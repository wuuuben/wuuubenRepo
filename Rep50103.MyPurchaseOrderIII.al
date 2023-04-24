
report 50103 MyPurchaseOrderIII
{
    ApplicationArea = All;
    Caption = 'MyPurchaseOrderIII';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;

    RDLCLayout = 'rdl/MyPurchaseOrderIII.rdlc';
    dataset
    {


        dataitem(Vendor; Vendor)
        {
            column(vendorNo; "No.")
            {
            }
            column(vendorName; Name)
            {
            }
            dataitem(tempTable2; tempTable2)
            {
                column(ExistInPILine_tempTable2; ExistInPILine)
                {
                }
                column(DirectUnitCost; DirectUnitCost)
                {
                }
                column(No; No)
                {
                }
                column(Description; Description)
                {
                }
                column(CurrencyCode; CurrencyCode)
                {
                }
                column(Amount; Amount)
                {
                }
                column(VAT; VATProdPostingGroup)
                {
                }
                column(BuyFromVendorNo; BuyFromVendorNo)
                {
                }
                column(PONo; PONo)
                {
                }
                column(PWRLNo; PWRLNo)
                {
                }
                column(QtyRcdNotInvoiced; QtyRcdNotInvoiced)
                {
                }
                column(startdate; startdateReq)
                {
                }
                column(enddate; enddateReq)
                {
                }
                trigger OnPreDataItem()
                begin
                    if FilterExistInPILine then
                        tempTable2.SetFilter(ExistInPILine, '=false');
                end;
            }
            trigger OnAfterGetRecord()
            var
                q: Query FilterPWRLwithVendor;
                PL: Record "Purchase Line";
                FilterStr: Text;

            begin
                vendorNo := "No.";//retrieve request page filter


                tempTable2.Reset();
                tempTable2.DeleteAll();

                q.SetRange(BuyfromVendorNo, vendorNo);
                q.SetFilter(QtyRcdNotInvoiced, '>0');//QtyRcdNotInvoiced filter

                if q.Open() then begin
                    while q.Read() do begin
                        //add query to temp record study: https://yzhums.com/4869/ https://yzhums.com/34290/

                        tempTable2.Init();

                        tempTable2.RowNo := tempTable2.RowNo + 1;
                        tempTable2.PONo := q.SourceNo_PWRL;
                        tempTable2.BuyFromVendorNo := q.BuyfromVendorNo;
                        tempTable2.PWRLNo := q.No_PWRL;
                        tempTable2.QtyRcdNotInvoiced := q.QtyRcdNotInvoiced;
                        tempTable2.VATProdPostingGroup := q.VATProdPostingGroup;
                        tempTable2.Amount := q.Amount;
                        tempTable2.CurrencyCode := q.CurrencyCode;
                        tempTable2.No := q.itemNo;
                        tempTable2.Description := q.Description;
                        tempTable2.DirectUnitCost := q.DirectUnitCost;
                        //check if exist in PI line
                        PL.Reset();
                        PL.SetRange("Receipt No.", q.DocumentNo_PRL);
                        PL.SetFilter("Document Type", '%1', "Purchase Document Type"::Invoice);
                        if PL.FindSet then begin
                            tempTable2.ExistInPILine := true;
                        end else begin
                            tempTable2.ExistInPILine := false;
                        end;
                        tempTable2.Insert();

                    end;
                    q.Close();
                end;

            end;
        }



    }
    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
                field(enddate; enddateReq)
                {
                    Caption = 'end date';
                    ApplicationArea = all;
                    trigger OnValidate()
                    begin
                        if enddateReq - startdateReq <= 0 then begin
                            Message('結束日期早於起始日期');
                            enddateReq := WorkDate;
                        end;
                    end;
                }

                field(FilterExistInPILine; FilterExistInPILine)//special scenario
                {
                    Caption = 'Filter Exist In PI Line';
                    ApplicationArea = all;
                }
            }
        }
        trigger OnOpenPage()
        begin
            startdateReq := WorkDate;
            if (enddateReq = 0D) then begin
                enddateReq := WorkDate;
            end
        end;
    }

    trigger OnInitReport()
    begin
        Vendor.Reset();
        FilterExistInPILine := false;
    end;


    trigger OnPreReport()
    begin
        if FilterExistInPILine then
            tempTable2.SetRange(ExistInPILine, false);
    end;






    var
        vendorNo: Code[20];
        startdateReq: Date;
        enddateReq: Date;
        FilterExistInPILine: Boolean;

}
