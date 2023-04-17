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

            dataitem(PurchaseLine; "Purchase Line")
            {
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
                    // Method = Sum;
                }
                column(QtyRcdNotInvoiced_PurchaseLine; "Qty. Rcd. Not Invoiced")
                {
                }
                column(BuyfromVendorNo_PurchaseLine; "Buy-from Vendor No.")
                {
                }





            }
        }
    }
}
