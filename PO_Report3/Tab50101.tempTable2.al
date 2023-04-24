table 50101 tempTable2
{
    Caption = 'tempTable2';
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
            Caption = 'PWRLNo';
            DataClassification = ToBeClassified;
        }
        field(5; QtyRcdNotInvoiced; Decimal)
        {
            Caption = 'QtyRcdNotInvoiced';
            DataClassification = ToBeClassified;
        }
        field(6; VATProdPostingGroup; Code[20])
        {
            Caption = 'VATProdPostingGroup';
            DataClassification = ToBeClassified;
        }
        field(7; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = ToBeClassified;
        }
        field(8; CurrencyCode; Code[10])
        {
            Caption = 'CurrencyCode';
            DataClassification = ToBeClassified;
        }
        field(9; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(10; No; Code[20])
        {
            Caption = 'No';
            DataClassification = ToBeClassified;
        }
        field(11; DirectUnitCost; Decimal)
        {
            Caption = 'DirectUnitCost';
            DataClassification = ToBeClassified;
        }
        field(12; ExistInPILine; Boolean)
        {
            Caption = 'Exist In PI Line';
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
