pageextension 50100 CustomerListext extends "Customer List"
{


    actions
    {

        addLast("Reports")
        {


            action(testInvoiceReport)
            {
                ApplicationArea = All;
                Caption = 'testInvoiceReport';
                trigger onAction();
                begin
                    rep.RunModal();
                end;
            }
            action(testPurchaseOrderReport)
            {
                ApplicationArea = All;
                Caption = 'testPurchaseOrderReport';
                trigger onAction();
                begin
                    rep.RunModal();

                end;
            }
        }
    }



    var
        rep: Report MyInvoice;
}
pageextension 50104 CustomerCardext extends "Customer Card"
{
    layout
    {
        addfirst(content)
        {
            part(WB; WorkbenchPart)
            {
                ApplicationArea = All;
            }
        }
    }
}
pageextension 50101 PurchaseOrderCardext extends "Purchase Order"
{
    actions
    {
        addlast("navigation")
        {
            group(MyReport)
            {
                action(ReportII)
                {
                    ApplicationArea = All;
                    Caption = 'ReportII';
                    Image = Report;
                    trigger onAction();
                    var
                        rep: Report MyPurchaseOrder;
                    begin
                        rep.SetParameter(Rec."No.");
                        rep.Run();
                        // Report.Run(Report::MyPurchaseOreder);
                    end;
                }
                action(ReportIII)
                {
                    ApplicationArea = All;
                    Caption = 'ReportIII';
                    Image = Report;
                    trigger onAction();
                    var
                        rep: Report MyPurchaseOrderII;
                    begin
                        rep.SetParameter(Rec."Document Type", Rec."No.");
                        rep.PaymentMethodWithCheckBox(Rec."Payment Method Code");
                        rep.Run();
                    end;
                }
            }
        }
    }

}
pageextension 50102 PurchaseOrderListext extends "Purchase Order List"
{
    actions
    {
        addLast("F&unctions")
        {
            action(ReportII)
            {
                ApplicationArea = All;
                Caption = 'ReportII In List';
                trigger onAction();
                var
                    rep: Report MyPurchaseOrder;
                    PurchaseHeader: Record "Purchase Header";
                begin
                    PurchaseHeader.Reset();
                    CurrPage.SetSelectionFilter(PurchaseHeader);
                    if PurchaseHeader.FindSet then begin
                        // Message(format(PurchaseHeader."No."));
                        rep.SetParameter(PurchaseHeader."No.");
                    end;
                    rep.Run();
                end;
            }
            action(ReportIII)
            {
                ApplicationArea = All;
                Caption = 'ReportIII In List';
                trigger onAction();
                var
                    rep: Report MyPurchaseOrderII;
                    PurchaseHeader: Record "Purchase Header";
                begin
                    PurchaseHeader.Reset();
                    CurrPage.SetSelectionFilter(PurchaseHeader);
                    if PurchaseHeader.FindSet then begin
                        rep.SetParameter(Rec."Document Type", Rec."No.");
                        rep.PaymentMethodWithCheckBox(Rec."Payment Method Code");
                        rep.Run();
                    end;
                    rep.Run();
                end;
            }
            action(GetFilterForSelectedRecord)
            {
                ApplicationArea = All;
                Caption = 'Get Filter For No.';
                trigger OnAction()
                var
                    PH: Record "Purchase Header";
                    recR: RecordRef;
                    SelectionFilterManagement: Codeunit SelectionFilterManagement;
                begin
                    PH.Reset();
                    CurrPage.SetSelectionFilter(PH);
                    recR.GetTable(PH);
                    Message(SelectionFilterManagement.GetSelectionFilter(recR, PH.FieldNo("No.")));
                end;
            }
        }
    }
}
pageextension 50103 PurchaseInvoiceCardext extends "Purchase Invoice"
{
    layout
    {
        // addlast(content)
        // {
        //     usercontrol(sample; SampleAddIn)
        //     {
        //         ApplicationArea = All;
        //     }
        // }
    }
    actions
    {
        addlast("navigation")
        {
            group(MyReport)
            {
                action(ReportIII)
                {
                    ApplicationArea = All;
                    Caption = 'ReportIII';
                    Image = Report;
                    trigger onAction();
                    var
                        rep: Report MyPurchaseOrderII;
                    begin
                        rep.SetParameter(Rec."Document Type", Rec."No.");
                        rep.PaymentMethodWithCheckBox(Rec."Payment Method Code");
                        rep.Run();
                    end;
                }
            }
        }
    }
}
pageextension 50105 VendorListext extends "Vendor List"
{
    actions
    {
        addLast("reporting")
        {
            action(ReportIII)
            {
                ApplicationArea = All;
                Caption = 'ReportIII';
                trigger onAction();
                var
                    rep: Report MyPurchaseOrderIII;
                    vendor: Record vendor;
                begin
                    vendor.Reset();
                    CurrPage.SetSelectionFilter(vendor);
                    if vendor.FindSet then begin
                        Report.Run(Report::MyPurchaseOrderIII, true, true, vendor);
                    end;
                    rep.Run();
                end;
            }
        }
    }

    var
        myInt: Integer;
}
