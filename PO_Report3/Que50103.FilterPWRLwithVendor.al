query 50103 FilterPWRLwithVendor
{
    Caption = 'FilterPWRLwithVendor';
    OrderBy = Ascending(No_PWRL);
    // QueryType = Normal;

    elements
    {
        dataitem("PWRL"; "Posted Whse. Receipt Line")
        {
            column(No_PWRL; "No.")
            {
            }
            column(SourceNo_PWRL; "Source No.")
            {
            }

            dataitem(PurchaseLine_order; "Purchase Line")
            {
                DataItemTableFilter = "Document Type" = const(Order);
                DataItemLink = "Document No." = PWRL."Source No.";
                SqlJoinType = InnerJoin;
                column(DirectUnitCost; "Direct Unit Cost")
                {
                }
                column(itemNo; "No.")
                {
                }
                column(Description; Description)
                {
                }
                column(CurrencyCode; "Currency Code")
                {
                }

                column(VATProdPostingGroup; "VAT Prod. Posting Group")
                {
                }
                column(Amount; Amount)
                {
                }
                column(QtyRcdNotInvoiced_PurchaseLine; "Qty. Rcd. Not Invoiced")
                {
                }
                column(BuyfromVendorNo_PurchaseLine; "Buy-from Vendor No.")
                {
                }
                column(QtyRcdNotInvoiced; "Qty. Rcd. Not Invoiced")
                {
                }
                column(BuyfromVendorNo; "Buy-from Vendor No.")
                {
                }
                dataitem(PurchaseReceiptLine; "Purch. Rcpt. Line")
                {
                    DataItemLink = "Order No." = PurchaseLine_order."Document No.";
                    column(DocumentNo_PRL; "Document No.")
                    {
                    }
                }

            }
        }
    }
}

