每個vendor一頁

選一個vendor=> 對應他的PO => 篩選:Quantity Received(已收貨數量)>0 && Quantity Invoiced(已開發票數量)<>Quantity Received 
=> 從PO取得Line(明細) => 過帳編號(已過帳收貨單號)要從Posted Warehouse Receipt取得 => Line要用VAT CUR 分類(Group by VAT&Currency)

//https://vld-nav.com/how-to-group-data
                 
