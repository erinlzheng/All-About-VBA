Attribute VB_Name = "Module1"
Sub Stock_Data()


'Loop Through All Sheets
Dim WS As Worksheet
    For Each WS In ActiveWorkbook.Worksheets
    WS.Activate
    
'Determine Last Row
    LastRow = WS.Cells(Rows.Count, 1).End(xlUp).Row
 
'Naming the Columns
    Cells(1, 9).Value = "Ticker"
    Cells(1, 10).Value = "Yearly Change"
    Cells(1, 11).Value = "Percent Change"
    Cells(1, 12).Value = "Total Stock Volume"
        
'Creating Variables
    Dim Open1 As Double
    Dim Close1 As Double
    Dim Ticker As String
    Dim Yearly_Change As Double
    Dim Percentage_Change As Double
    Dim TS_Volume As Double
    Dim Row As Double
        Row = 2
    Dim Column As Integer
        Column = 1
    Dim i As Long
    
'Setting Open Values
    Open1 = Cells(2, Column + 2).Value
    
'Loop All Tickers
    For i = 2 To LastRow
    
'Ticker Symbol is the Same
    If Cells(i + 1, Column).Value <> Cells(i, Column).Value Then
'Set Ticker
    Ticker = Cells(i, Column).Value
    Cells(Row, Column + 8).Value = Ticker
'Set Close Price
    Close1 = Cells(i, Column + 5).Value
'Find Yearly Change
    Yearly_Change = Close1 - Open1
    Cells(Row, Column + 9).Value = Yearly_Change
'Find Percent Change
    If (Open1 = 0 And Close1 = 0) Then
        Percent_Change = 0
    ElseIf (Open1 = 0 And Close1 <> 0) Then
        Percent_Change = 1
    Else
        Percent_Change = Yearly_Change / Open1
        Cells(Row, Column + 10).Value = Percent_Change
    End If
'Add Total Stock Volume
    TS_Volume = 0
    TS_Volume = TS_Volume + Cells(i, Column + 6).Value
    Cells(Row, Column + 11).Value = TS_Volume
'Add one to the summary table row
    Row = Row + 1
'reset the Open Price
    Open1 = Cells(i + 1, Column + 2)

'if cells are the same ticker
    Else
        TS_Volume = TS_Volume + Cells(i, Column + 6).Value
    End If
    Next i
'Determine the Last Row of Yearly Change
        YCLastRow = WS.Cells(Rows.Count, Column + 8).End(xlUp).Row
 'Set the Cell Colors
    For j = 2 To YCLastRow
    If (Cells(j, Column + 9).Value > 0 Or Cells(j, Column + 9).Value = 0) Then
        Cells(j, Column + 9).Interior.ColorIndex = 50
    ElseIf Cells(j, Column + 9).Value < 0 Then
        Cells(j, Column + 9).Interior.ColorIndex = 22

End If
    Next j
    Next WS
    
        
End Sub
    

