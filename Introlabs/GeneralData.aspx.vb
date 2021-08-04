Imports System.Data.SqlClient
Imports System.IO
Imports OfficeOpenXml
Public Class GeneralData
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Not Used
    End Sub

    Protected Sub Room_ddl_SelectedIndexChanged(sender As Object, e As EventArgs) Handles Room_ddl.SelectedIndexChanged

        Section_ddl.Items.Clear()
        Section_ddl.DataBind()
        Section_ddl.Items.Insert(0, "Please Select")

    End Sub

    Protected Sub RoomAdd_ddl_SelectedIndexChanged(sender As Object, e As EventArgs)

        If FormView1.CurrentMode = FormViewMode.Insert Then

            Dim SectionAdd_ddl As DropDownList = CType(FormView1.Row.FindControl("SectionAdd_ddl"), DropDownList)

            SectionAdd_ddl.Items.Clear()
            SectionAdd_ddl.DataBind()
            SectionAdd_ddl.Items.Insert(0, "Please Select")

        End If

    End Sub

    Public Overloads Overrides Sub VerifyRenderingInServerForm(ByVal control As Control)
        ' Nothing needed here...
    End Sub

    Protected Sub Export_lnkbtn_Click(sender As Object, e As EventArgs) Handles Export_lnkbtn.Click

        Dim dt As DataTable = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView).Table

        Dim excel As New ExcelPackage()
        Dim workSheet = excel.Workbook.Worksheets.Add("Sheet1")
        workSheet.Cells(1, 1).LoadFromDataTable(dt, True)

        workSheet.Column(2).Style.Numberformat.Format = "mm-dd-yyyy"
        workSheet.Column(2).AutoFit(15, 12)

        Dim NewFileName As String = "Room_" & Room_ddl.SelectedValue.ToString & "_IntrolabsData.xlsx"

        Using memoryStream = New MemoryStream()
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
            Response.AddHeader("content-disposition", "attachment;  filename=" & NewFileName)
            excel.SaveAs(memoryStream)
            memoryStream.WriteTo(Response.OutputStream)
            Response.Flush()
            Response.[End]()
        End Using

    End Sub

    Protected Sub SqlDataSource1_Selected(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Selected

        If e.AffectedRows > 0 Then
            Export_lnkbtn.Visible = True
            Copy_plhdr.Visible = True
        Else
            Export_lnkbtn.Visible = False
            Copy_plhdr.Visible = False
        End If

    End Sub

End Class