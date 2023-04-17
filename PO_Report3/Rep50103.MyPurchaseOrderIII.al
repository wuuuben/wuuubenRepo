report 50103 MyPurchaseOrderIII
{
    ApplicationArea = All;
    Caption = 'MyPurchaseOrderIII';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;

    RDLCLayout = 'rdl/MyPurchaseOrderIII.rdlc';
    dataset
    {
        dataitem(tempPO; tempPO)
        {
            column(DirectUnitCost_tempPO; DirectUnitCost)
            {
            }
            column(No_tempPO; No)
            {
            }
            column(Description_tempPO; Description)
            {
            }
            column(CurrencyCode_tempPO; CurrencyCode)
            {
            }
            column(Amount_tempPO; Amount)
            {
            }
            column(VAT_tempPO; VATProdPostingGroup)
            {
            }
            column(RowNo_tempPO; RowNo)
            {
            }
            column(BuyFromVendorNo_tempPO; BuyFromVendorNo)
            {
            }
            column(PONo_tempPO; PONo)
            {
            }
            column(PWRLNo_tempPO; PWRLNo)
            {
            }
            column(QtyRcdNotInvoiced_tempPO; QtyRcdNotInvoiced)
            {
            }
            column(startdate; startdateReq)
            {
            }
            column(enddate; enddateReq)
            {
            }
            dataitem(Vendor; Vendor)
            {
                RequestFilterFields = "No.";
                column(vendorNo; vendorNo)
                {
                }
                column(vendorName; Name)
                {
                }
            }
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
            }
        }
        trigger OnOpenPage()
        begin
            startdateReq := WorkDate;
            if (enddateReq = 0D) then begin
                enddateReq := WorkDate;
            end
            // Vendor.SetFilter("No.", '=%1', vendorNo);
        end;
    }

    trigger OnPreReport()
    var
        q: Query FilterPWRLwithVendor;

    begin
        vendorNo := Vendor.GetFilter("No.");//retrieve request page filter
        tempPO.Reset();
        tempPO.DeleteAll();
        q.SetRange(BuyfromVendorNo_PurchaseLine, vendorNo);
        q.SetFilter(QtyRcdNotInvoiced_PurchaseLine, '>0');//QtyRcdNotInvoiced filter
        if q.Open() then begin
            while q.Read() do begin
                //add query to temp record study: https://yzhums.com/4869/ https://yzhums.com/34290/
                tempPO.Init();
                tempPO.RowNo := tempPO.RowNo + 1;
                tempPO.PONo := q.SourceNo_PWRL;
                tempPO.BuyFromVendorNo := q.BuyfromVendorNo_PurchaseLine;
                tempPO.PWRLNo := q.No_PWRL;
                tempPO.QtyRcdNotInvoiced := q.QtyRcdNotInvoiced_PurchaseLine;
                tempPO.VATProdPostingGroup := q.VATProdPostingGroup;
                tempPO.Amount := q.Amount;
                tempPO.CurrencyCode := q.CurrencyCode;
                tempPO.No := q.itemNo;
                tempPO.Description := q.Description;
                tempPO.DirectUnitCost := q.DirectUnitCost;
                tempPO.Insert();
            end;
            q.Close();
        end;


    end;




    // procedure SetParameter(var _VendorNo: Code[20])
    // begin
    //     vendorNo := _VendorNo;
    // end;

    var
        vendorNo: Code[20];
        startdateReq: Date;
        enddateReq: Date;

}

