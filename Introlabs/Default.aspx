<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Introlabs.Master" CodeBehind="Default.aspx.vb" Inherits="Introlabs._Default" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="data" />

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Lab Charts Online - Enter Data</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="FormView1" EventName="ModeChanged" />
                        </Triggers>
                        <ContentTemplate>

                            <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1" RenderOuterTable="False">
                                <InsertItemTemplate>

                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                ControlToValidate="RoomAdd_ddl"
                                                Display="Dynamic" ForeColor="Red"
                                                ErrorMessage="Room is Required!"
                                                ValidationGroup="data" InitialValue="Please Select"><i class="fa fa-exclamation-triangle"></i></asp:RequiredFieldValidator>
                                            Room:</label>
                                        <div class="col-sm-9">
                                            <asp:DropDownList ID="RoomAdd_ddl" runat="server" SelectedValue='<%# Bind("room") %>' Width="200" CssClass="form-control" DataSourceID="RoomAdd_sds" DataTextField="room" DataValueField="room" AppendDataBoundItems="true" AutoPostBack="True" OnSelectedIndexChanged="RoomAdd_ddl_SelectedIndexChanged">
                                                <asp:ListItem>Please Select</asp:ListItem>
                                                <asp:ListItem style="display: none" Text="" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="RoomAdd_sds" runat="server" ConnectionString="<%$ ConnectionStrings:MM_OCS_SQL_STRING %>"
                                                SelectCommand="SELECT DISTINCT [room] FROM [room_sections]"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                                ControlToValidate="SectionAdd_ddl"
                                                Display="Dynamic" ForeColor="Red"
                                                ErrorMessage="Section is Required!"
                                                ValidationGroup="data" InitialValue="Please Select"><i class="fa fa-exclamation-triangle"></i></asp:RequiredFieldValidator>
                                            Section:</label>
                                        <div class="col-sm-9">
                                            <asp:DropDownList ID="SectionAdd_ddl" runat="server" Width="200" CssClass="form-control" DataSourceID="SectionAdd_sds" DataTextField="section" DataValueField="section" AppendDataBoundItems="true">
                                                <asp:ListItem>Please Select</asp:ListItem>
                                                <asp:ListItem style="display: none" Text="" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SectionAdd_sds" runat="server" ConnectionString="<%$ ConnectionStrings:MM_OCS_SQL_STRING %>"
                                                SelectCommand="SELECT DISTINCT [section] FROM [room_sections] WHERE ([room] = @room)">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="RoomAdd_ddl" Name="room" PropertyName="SelectedValue" Type="String" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                                ControlToValidate="DropDownList3"
                                                Display="Dynamic" ForeColor="Red"
                                                ErrorMessage="Station is Required!"
                                                ValidationGroup="data" InitialValue="Please Select"><i class="fa fa-exclamation-triangle"></i></asp:RequiredFieldValidator>
                                            Station</label>
                                        <div class="col-sm-9">
                                            <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control" SelectedValue='<%# Bind("station") %>' Width="200">
                                                <asp:ListItem>Please Select</asp:ListItem>
                                                <asp:ListItem>1</asp:ListItem>
                                                <asp:ListItem>2</asp:ListItem>
                                                <asp:ListItem>3</asp:ListItem>
                                                <asp:ListItem>4</asp:ListItem>
                                                <asp:ListItem>5</asp:ListItem>
                                                <asp:ListItem>6</asp:ListItem>
                                                <asp:ListItem>7</asp:ListItem>
                                                <asp:ListItem>8</asp:ListItem>
                                                <asp:ListItem>9</asp:ListItem>
                                                <asp:ListItem>10</asp:ListItem>
                                                <asp:ListItem>11</asp:ListItem>
                                                <asp:ListItem>12</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                                ControlToValidate="DropDownList5"
                                                Display="Dynamic" ForeColor="Red"
                                                ErrorMessage="Lab is Required!"
                                                ValidationGroup="data" InitialValue="Please Select"><i class="fa fa-exclamation-triangle"></i></asp:RequiredFieldValidator>
                                            Lab:</label>
                                        <div class="col-sm-9">
                                            <asp:DropDownList ID="DropDownList5" runat="server" CssClass="form-control" SelectedValue='<%# Bind("lab") %>' Width="200">
                                                <asp:ListItem>Please Select</asp:ListItem>
                                                <asp:ListItem>1</asp:ListItem>
                                                <asp:ListItem>2</asp:ListItem>
                                                <asp:ListItem>3</asp:ListItem>
                                                <asp:ListItem>4</asp:ListItem>
                                                <asp:ListItem>5</asp:ListItem>
                                                <asp:ListItem>6</asp:ListItem>
                                                <asp:ListItem>7</asp:ListItem>
                                                <asp:ListItem>8</asp:ListItem>
                                                <asp:ListItem>9</asp:ListItem>
                                                <asp:ListItem>10</asp:ListItem>
                                                <asp:ListItem>11</asp:ListItem>
                                                <asp:ListItem>12</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                                ControlToValidate="DropDownList4"
                                                Display="Dynamic" ForeColor="Red"
                                                ErrorMessage="Chart is Required!"
                                                ValidationGroup="data" InitialValue="Please Select"><i class="fa fa-exclamation-triangle"></i></asp:RequiredFieldValidator>
                                            Chart:</label>
                                        <div class="col-sm-9">
                                            <asp:DropDownList ID="DropDownList4" runat="server" CssClass="form-control" SelectedValue='<%# Bind("chart") %>' Width="200">
                                                <asp:ListItem>Please Select</asp:ListItem>
                                                <asp:ListItem>1</asp:ListItem>
                                                <asp:ListItem>2</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Number 1:</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="number1TextBox" runat="server" Text='<%# Bind("number1") %>' CssClass="form-control" Width="120" />
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Number 2:</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="number2TextBox" runat="server" Text='<%# Bind("number2") %>' CssClass="form-control" Width="120" />
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Number 3:</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="number3TextBox" runat="server" Text='<%# Bind("number3") %>' CssClass="form-control" Width="120" />
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Number 4:</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="number4TextBox" runat="server" Text='<%# Bind("number4") %>' CssClass="form-control" Width="120" />
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Number 5:</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="number5TextBox" runat="server" Text='<%# Bind("number5") %>' CssClass="form-control" Width="120" />
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Number 6:</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="number6TextBox" runat="server" Text='<%# Bind("number6") %>' CssClass="form-control" Width="120" />
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Number 7:</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="number7TextBox" runat="server" Text='<%# Bind("number7") %>' CssClass="form-control" Width="120" />
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Number 8:</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="number8TextBox" runat="server" Text='<%# Bind("number8") %>' CssClass="form-control" Width="120" />
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Number 9:</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="number9TextBox" runat="server" Text='<%# Bind("number9") %>' CssClass="form-control" Width="120" />
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-3 col-form-label">Number 10:</label>
                                        <div class="col-sm-9">
                                            <asp:TextBox ID="number10TextBox" runat="server" Text='<%# Bind("number10") %>' CssClass="form-control" Width="120" />
                                        </div>
                                    </div>

                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" ValidationGroup="data" />
                                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />

                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add New Data" CssClass="btn btn-primary" />
                                </ItemTemplate>
                                <EmptyDataTemplate>
                                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add New Data" CssClass="btn btn-primary" />
                                </EmptyDataTemplate>
                            </asp:FormView>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12 form-inline">

            <div class="input-group mb-3 mr-4">
                <div class="input-group-prepend">
                    <span class="input-group-text">Room:</span>
                </div>
                <asp:DropDownList ID="Room_ddl" runat="server" CssClass="form-control" DataSourceID="Room_sds" DataTextField="room" DataValueField="room" AppendDataBoundItems="true" AutoPostBack="True">
                    <asp:ListItem Value="999">Please Select</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="Room_sds" runat="server" ConnectionString="<%$ ConnectionStrings:MM_OCS_SQL_STRING %>"
                    SelectCommand="SELECT DISTINCT [room] FROM [room_sections]"></asp:SqlDataSource>
            </div>

            <div class="input-group mb-3 mr-4">
                <div class="input-group-prepend">
                    <span class="input-group-text">Section:</span>
                </div>
                <asp:DropDownList ID="Section_ddl" runat="server" CssClass="form-control" DataSourceID="Section_sds" DataTextField="section" DataValueField="section" AppendDataBoundItems="true" AutoPostBack="True">
                    <asp:ListItem>Please Select</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="Section_sds" runat="server" ConnectionString="<%$ ConnectionStrings:MM_OCS_SQL_STRING %>"
                    SelectCommand="SELECT DISTINCT [section] FROM [room_sections] WHERE ([room] = @room)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Room_ddl" Name="room" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>

            <div class="input-group mb-3 mr-4">
                <div class="input-group-prepend">
                    <span class="input-group-text">Lab:</span>
                </div>
                <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control" AutoPostBack="True">
                    <asp:ListItem>Please Select</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="input-group mb-3 mr-4">
                <div class="input-group-prepend">
                    <span class="input-group-text">Chart:</span>
                </div>
                <asp:DropDownList ID="DropDownList4" runat="server" CssClass="form-control" AutoPostBack="True">
                    <asp:ListItem>Please Select</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                </asp:DropDownList>
            </div>

            <asp:LinkButton ID="Export_lnkbtn" runat="server" CssClass="btn btn-outline-info mb-3" Visible="False"><i class="fa fa-download"></i>&nbsp;Download Report to Excel</asp:LinkButton>

        </div>
    </div>

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1"
        CssClass="table table-bordered table-striped table-sm bottom-buffer mt-3" GridLines="None" Font-Size="10pt" AllowSorting="True" PageSize="20">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-primary btn-sm"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary btn-sm"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn btn-primary btn-sm"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" CssClass="btn btn-danger btn-sm" OnClientClick="return confirm('You are about to delete this record!');" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="room" HeaderText="Room" SortExpression="room" ReadOnly="True" />
            <asp:BoundField DataField="section" HeaderText="Section" SortExpression="section" ReadOnly="True" />
            <asp:BoundField DataField="station" HeaderText="Station" SortExpression="station" ReadOnly="True" />
            <asp:TemplateField HeaderText="Lab" SortExpression="lab">
                <EditItemTemplate>
                    <asp:DropDownList ID="labedit_ddl" runat="server" CssClass="form-control" SelectedValue='<%# Bind("lab") %>' Width="125">
                        <asp:ListItem>Please Select</asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                        <asp:ListItem style="display: none" Text="" Value=""></asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("lab") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Chart" SortExpression="chart">
                <EditItemTemplate>
                    <asp:DropDownList ID="chartedit_ddl" runat="server" CssClass="form-control" SelectedValue='<%# Bind("chart") %>' Width="125">
                        <asp:ListItem>Please Select</asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem style="display: none" Text="" Value=""></asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("chart") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Number 1" SortExpression="number1">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("number1") %>' CssClass="form-control" Width="100"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("number1") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Number 2" SortExpression="number2">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("number2") %>' CssClass="form-control" Width="100"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("number2") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Number 3" SortExpression="number3">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("number3") %>' CssClass="form-control" Width="100"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("number3") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Number 4" SortExpression="number4">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("number4") %>' CssClass="form-control" Width="100"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("number4") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Number 5" SortExpression="number5">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("number5") %>' CssClass="form-control" Width="100"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("number5") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Number 6" SortExpression="number6">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("number6") %>' CssClass="form-control" Width="100"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("number6") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Number 7" SortExpression="number7">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("number7") %>' CssClass="form-control" Width="100"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("number7") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Number 8" SortExpression="number8">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("number8") %>' CssClass="form-control" Width="100"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("number8") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Number 9" SortExpression="number9">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("number9") %>' CssClass="form-control" Width="100"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("number9") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Number 10" SortExpression="number10">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("number10") %>' CssClass="form-control" Width="100"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label12" runat="server" Text='<%# Bind("number10") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MM_OCS_SQL_STRING %>"
        DeleteCommand="DELETE FROM [lab_charts] WHERE [ID] = @ID"
        InsertCommand="INSERT INTO [lab_charts] ([room], [section], [station], [lab], [chart], [number1], [number2], [number3], [number4], [number5], [number6], [number7], [number8], [number9], [number10]) VALUES (@room, @section, @station, @lab, @chart, @number1, @number2, @number3, @number4, @number5, @number6, @number7, @number8, @number9, @number10)"
        SelectCommand="SELECT ID, datestamp, RTRIM(room) AS room, RTRIM(section) AS section, RTRIM(station) AS station, RTRIM(lab) AS lab, RTRIM(chart) AS chart, number1, number2, number3, number4, number5, number6, number7, number8, number9, number10 FROM lab_charts WHERE (@room = 'Please Select' OR @room IS NULL OR room = @room) AND (@section = 'Please Select' OR @section IS NULL OR section = @section) AND (@lab = 'Please Select' OR @lab IS NULL OR lab = @lab) AND (@chart = 'Please Select' OR @chart IS NULL OR chart = @chart)"
        UpdateCommand="UPDATE [lab_charts] SET [lab] = @lab, [chart] = @chart, [number1] = @number1, [number2] = @number2, [number3] = @number3, [number4] = @number4, [number5] = @number5, [number6] = @number6, [number7] = @number7, [number8] = @number8, [number9] = @number9, [number10] = @number10 WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="room" Type="String" />
            <asp:ControlParameter ControlID="FormView1$SectionAdd_ddl" Name="section" PropertyName="SelectedValue" Type="String" />
            <asp:Parameter Name="station" Type="String" />
            <asp:Parameter Name="lab" Type="String" />
            <asp:Parameter Name="chart" Type="String" />
            <asp:Parameter Name="number1" Type="String" />
            <asp:Parameter Name="number2" Type="Double" />
            <asp:Parameter Name="number3" Type="Double" />
            <asp:Parameter Name="number4" Type="Double" />
            <asp:Parameter Name="number5" Type="Double" />
            <asp:Parameter Name="number6" Type="Double" />
            <asp:Parameter Name="number7" Type="Double" />
            <asp:Parameter Name="number8" Type="Double" />
            <asp:Parameter Name="number9" Type="Double" />
            <asp:Parameter Name="number10" Type="Double" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="Room_ddl" Name="room" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="Section_ddl" Name="section" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DropDownList3" Name="lab" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DropDownList4" Name="chart" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="lab" Type="String" />
            <asp:Parameter Name="chart" Type="String" />
            <asp:Parameter Name="number1" Type="String" />
            <asp:Parameter Name="number2" Type="Double" />
            <asp:Parameter Name="number3" Type="Double" />
            <asp:Parameter Name="number4" Type="Double" />
            <asp:Parameter Name="number5" Type="Double" />
            <asp:Parameter Name="number6" Type="Double" />
            <asp:Parameter Name="number7" Type="Double" />
            <asp:Parameter Name="number8" Type="Double" />
            <asp:Parameter Name="number9" Type="Double" />
            <asp:Parameter Name="number10" Type="Double" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
