﻿Type=Activity
Version=4.3
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: True
	#IncludeTitle: True
#End Region

Sub Process_Globals
	
End Sub

Sub Globals
	Dim Table1 As Table
End Sub

Sub Activity_Create(FirstTime As Boolean)
	Table1.Initialize(Me, "Table1", 5)
	Table1.AddToActivity(Activity, 0, 0dip, 100%x, 100%y)	
	Table1.SetHeader(Array As String("Name", "Population", "Dengue","Malaria","Measles" ))
	
	
	Main.cursor1 = Main.sql1.ExecQuery("SELECT * FROM tblBarangay")
For i = 0 To Main.cursor1.RowCount - 1
Main.cursor1.Position = i
    Table1.AddRow(Array As String(Main.cursor1.getString("bName"), Main.cursor1.getString("bPopulation"), Main.cursor1.getString("bDengue"), Main.cursor1.getString("bMalaria"), Main.cursor1.getString("bMeasles")))
	Next
	Table1.SetColumnsWidths(Array As Int(40%x, 15%x, 15%x,15%x,15%x))
	
	
End Sub



Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub
'Sub Table2_CellClick (Col As Int, Row As Int)
'	Log("(Table2) CellClick: " & Col & " , " & Row)
'	Activity.Title = Table2.GetValue(Col, Row)
'End Sub

Sub Table1_CellClick (Col As Int, Row As Int)
	Log("CellClick: " & Col & " , " & Row)
	Activity.Title = Table1.GetValue(Col, Row)
End Sub

Sub Table1_HeaderClick (Col As Int)
	Log("HeaderClick: " & Col)
End Sub
