table 50100 tempPO
{
    Caption = 'tempPO';
    DataClassification = ToBeClassified;
    TableType = Temporary;

    fields
    {
        field(1; RowNo; Integer)
        {
            Caption = 'RowNo';
            DataClassification = ToBeClassified;
        }
        field(2; PONo; Code[20])//vendor
        {
            Caption = 'PONo';
            DataClassification = ToBeClassified;
        }
        field(3; BuyFromVendorNo; Code[20])//vendor
        {
            Caption = 'BuyFromVendorNo';
            DataClassification = ToBeClassified;
        }
        field(4; PWRLNo; Code[20])
        {
            Caption = 'DocumentNo';
            DataClassification = ToBeClassified;
        }
        field(5; QtyRcdNotInvoiced; Decimal)
        {
            Caption = 'QtyRcdNotInvoiced';
            DataClassification = ToBeClassified;
        }
        field(6; VATProdPostingGroup; Code[20])
        {
            Caption = 'QtyRcdNotInvoiced';
            DataClassification = ToBeClassified;
        }
        field(7; Amount; Decimal)
        {
            Caption = 'QtyRcdNotInvoiced';
            DataClassification = ToBeClassified;
        }
        field(8; CurrencyCode; Code[10])
        {
            Caption = 'QtyRcdNotInvoiced';
            DataClassification = ToBeClassified;
        }
        field(9; Description; Text[100])
        {
            Caption = 'QtyRcdNotInvoiced';
            DataClassification = ToBeClassified;
        }
        field(10; No; Code[20])
        {
            Caption = 'QtyRcdNotInvoiced';
            DataClassification = ToBeClassified;
        }
        field(11; DirectUnitCost; Decimal)
        {
            Caption = 'QtyRcdNotInvoiced';
            DataClassification = ToBeClassified;
        }





    }
    keys
    {
        key(PK; RowNo)
        {
            Clustered = true;
        }
    }
}
