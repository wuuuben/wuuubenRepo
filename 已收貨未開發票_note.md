每個vendor一頁

選一個vendor=> 對應他的PO => 篩選:Quantity Received(已收貨數量)>0 && Quantity Invoiced(已開發票數量)<>Quantity Received 
=> 從PO取得Line(明細) => 過帳編號(已過帳收貨單號)要從Posted Warehouse Receipt取得 => Line要用VAT CUR 分類(Group by VAT&Currency)

Page::"Posted Whse. Receipt"對應的Line Page::"Posted Whse. Receipt Subform" 

Page::"Trasfer Orders"對應的Line Page::"Transfer Order Subform"

Page::"Warehouse Receipt"對應的Line Page::"Whse. Receipt Subform"

Cross-Dock Bin Code 倉單

Number of put-away activities created: 1

用PO header 的No.跟 Page::"Posted Whse. Receipt Subform" 裡的 source No.連 以取得 "Posted Whse. Receipt" N


Page::"Posted Transfer Receipt"=>field "Transfer Order No"=> Page::"Transfer Orders"

prepayment修改為0





https://vld-nav.com/how-to-group-data

https://learn.microsoft.com/en-us/sql/reporting-services/lesson-6-adding-grouping-and-totals-reporting-services?view=sql-server-ver16

https://www.youtube.com/watch?v=0NAIZ0kiT5A&t=405s

https://www.mssqltips.com/sqlservertip/6533/multiple-row-grouping-levels-in-ssrs-report/

https://sqlskull.com/2021/04/10/aadd-row-number-for-grouped-data/
