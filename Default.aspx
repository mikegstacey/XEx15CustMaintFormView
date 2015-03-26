<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Chapter 15: Customer Maintenance</title>
    <link href="Main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <header>
        <img src="Images/banner.jpg" />
    </header>
    <section>
        <form id="form1" runat="server">
            <div id="gridview">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    DataKeyNames="Email" DataSourceID="SqlDataSource1"
                    AutoGenerateColumns="False" SelectedIndex="0"
                    CellPadding="4" GridLines="None" ForeColor="Black" Width="320px">
                    <Columns>
                        <asp:BoundField DataField="Email" HeaderText="Email"
                            ReadOnly="True" Visible="False">
                        </asp:BoundField>
                        <asp:BoundField DataField="LastName" HeaderText="LastName">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="FirstName" HeaderText="FirstName">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="120px" />
                        </asp:BoundField>
                        <asp:CommandField ShowSelectButton="True" />
                    </Columns>
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="White" ForeColor="Black" />
                    <AlternatingRowStyle BackColor="#E3EAEB" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#F46D11" ForeColor="White" />
                    <PagerSettings Mode="NextPreviousFirstLast" />
                    <PagerStyle BackColor="#1C5E55" ForeColor="White"
                        HorizontalAlign="Center" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>"
                    SelectCommand="SELECT [Email], [LastName], [FirstName] 
                                   FROM [Customers] ORDER BY [LastName]">
              </asp:SqlDataSource>
            </div>
            <div id="formview">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="Email" 
                    DataSourceID="SqlDataSource2" CellPadding="4" Width="350px" 
                    onitemdeleted="FormView1_ItemDeleted" oniteminserted="FormView1_ItemInserted" 
                    onitemupdated="FormView1_ItemUpdated">
                    <EditItemTemplate>
                        <p class="label">Email:</p>
                        <p class="display">
                            <asp:Label ID="EmailLabel1" runat="server" Text='<%# Eval("Email") %>' />
                        </p>
                        <p class="label">Last Name:</p>
                        <p class="entry">
                            <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' 
                                Width="150" MaxLength="20" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="LastNameTextBox" 
                                ErrorMessage="Last Name is a required field.">*</asp:RequiredFieldValidator>
                            </p>
                        <p class="label">First Name:</p>
                        <p class="entry">
                            <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' 
                                Width="150" MaxLength="20" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="FirstNameTextBox" 
                                ErrorMessage="First Name is a required field.">*</asp:RequiredFieldValidator>
                        </p>
                        <p class="label">Address:</p>
                        <p class="entry">
                            <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' 
                                Width="220" MaxLength="40" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="AddressTextBox" 
                                ErrorMessage="Address is a required field.">*</asp:RequiredFieldValidator>
                        </p>
                        <p class="label">City:</p>
                        <p class="entry">
                            <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' 
                                Width="150" MaxLength="30" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="CityTextBox" 
                                ErrorMessage="City is a required field.">*</asp:RequiredFieldValidator>
                        </p>
                        <p class="label">State:</p>
                        <p class="entry">
                            <asp:DropDownList ID="DropDownList1" runat="server" 
                                DataSourceID="SqlDataSource3" DataTextField="StateName" 
                                DataValueField="StateCode" SelectedValue='<%# Bind("State") %>' Width="156px">
                            </asp:DropDownList>
                        </p>
                        <p class="label">Zip Code:</p>
                        <p class="entry">
                            <asp:TextBox ID="ZipCodeTextBox" runat="server" Text='<%# Bind("ZipCode") %>' 
                                Width="75" MaxLength="9" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="ZipCodeTextBox" 
                                ErrorMessage="Zip Code is a required field">*</asp:RequiredFieldValidator>
                        </p>
                        <p class="label">Phone Number:</p>
                        <p class="entry">
                            <asp:TextBox ID="PhoneNumberTextBox" runat="server" Text='<%# Bind("PhoneNumber") %>' 
                                Width="150" MaxLength="20" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="PhoneNumberTextBox" 
                                ErrorMessage="Phone is a required field.">*</asp:RequiredFieldValidator>
                        </p>
                        <p>
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                CommandName="Update" Text="Update" ForeColor="White" />&nbsp;
                            <asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                CausesValidation="False" CommandName="Cancel" Text="Cancel" ForeColor="White" />
                        </p>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <p class="label">Email:</p>
                        <p class="entry">
                            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' 
                                Width="220" MaxLength="25" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                ControlToValidate="EmailTextBox" ErrorMessage="Email is a required field.">*
                                </asp:RequiredFieldValidator>
                        </p>
                        <p class="label">Last Name:</p>
                        <p class="entry">
                            <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' 
                                Width="150" MaxLength="20" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="LastNameTextBox" 
                                ErrorMessage="Last Name is a required field.">*</asp:RequiredFieldValidator>
                        </p>
                        <p class="label">First Name:</p>
                        <p class="entry">
                            <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' 
                                Width="150" MaxLength="20" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="FirstNameTextBox" 
                                ErrorMessage="First Name is a required field.">*</asp:RequiredFieldValidator>
                        </p>
                        <p class="label">Address:</p>
                        <p class="entry">
                            <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' 
                                Width="220" MaxLength="40" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="AddressTextBox" 
                                ErrorMessage="Address is a required field.">*</asp:RequiredFieldValidator>
                        </p>
                        <p class="label">City:</p>
                        <p class="entry">
                            <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' 
                                Width="150" MaxLength="30" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="CityTextBox" 
                                ErrorMessage="City is a required field.">*</asp:RequiredFieldValidator>
                        </p>
                        <p class="label">State:</p>
                        <p class="entry">
                            <asp:DropDownList ID="DropDownList1" runat="server" 
                                DataSourceID="SqlDataSource3" DataTextField="StateName" 
                                DataValueField="StateCode" SelectedValue='<%# Bind("State") %>' Width="156px">
                            </asp:DropDownList>
                        </p>
                        <p class="label">Zip Code:</p>
                        <p class="entry">
                            <asp:TextBox ID="ZipCodeTextBox" runat="server" Text='<%# Bind("ZipCode") %>' 
                                Width="75" MaxLength="9" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="ZipCodeTextBox" 
                                ErrorMessage="Zip Code is a required field">*</asp:RequiredFieldValidator>
                        </p>
                        <p class="label">Phone Number:</p>
                        <p class="entry">
                            <asp:TextBox ID="PhoneNumberTextBox" runat="server" Text='<%# Bind("PhoneNumber") %>' 
                                Width="150" MaxLength="20" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="PhoneNumberTextBox" 
                                ErrorMessage="Phone is a required field.">*</asp:RequiredFieldValidator>
                        </p>
                        <p>
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                CommandName="Insert" Text="Insert" ForeColor="White" />&nbsp;
                            <asp:LinkButton ID="InsertCancelButton" runat="server" 
                                CausesValidation="False" CommandName="Cancel" Text="Cancel" ForeColor="White" />
                        </p>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <p class="label">Email:</p>
                        <p class="display">
                            <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                        </p>
                        <p class="label">Last Name:</p>
                        <p class="display">
                            <asp:Label ID="LastNameLabel" runat="server" Text='<%# Bind("LastName") %>' />
                        </p>
                        <p class="label">First Name:</p>
                        <p class="display">
                            <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Bind("FirstName") %>' />
                        </p>
                        <p class="label">Address:</p>
                        <p class="display">
                            <asp:Label ID="AddressLabel" runat="server" Text='<%# Bind("Address") %>' />
                        </p>
                        <p class="label">City:</p>
                        <p class="display">
                            <asp:Label ID="CityLabel" runat="server" Text='<%# Bind("City") %>' />
                        </p>
                        <p class="label">State:</p>
                        <p class="display">
                            <asp:Label ID="StateLabel" runat="server" Text='<%# Bind("State") %>' />
                        </p>
                        <p class="label">Zip Code:</p>
                        <p class="display">
                            <asp:Label ID="ZipCodeLabel" runat="server" Text='<%# Bind("ZipCode") %>' />
                        </p>
                        <p class="label">Phone Number:</p>
                        <p class="display">
                            <asp:Label ID="PhoneNumberLabel" runat="server" Text='<%# Bind("PhoneNumber") %>' />
                        </p>
                        <p>
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                CommandName="Edit" Text="Edit" />&nbsp;
                            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                                CommandName="Delete" Text="Delete" />&nbsp;
                            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                                CommandName="New" Text="New" />
                        </p>
                    </ItemTemplate>
                    <RowStyle BackColor="LightGray" ForeColor="Black" />
                    <EditRowStyle BackColor="Gray" ForeColor="White" />
                    <InsertRowStyle BackColor="Gray" ForeColor="White" />
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConflictDetection="CompareAllValues" 
                    ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>" 
                    DeleteCommand="DELETE FROM [Customers] WHERE [Email] = @original_Email AND [LastName] = @original_LastName AND [FirstName] = @original_FirstName AND [Address] = @original_Address AND [City] = @original_City AND [State] = @original_State AND [ZipCode] = @original_ZipCode AND [PhoneNumber] = @original_PhoneNumber" 
                    InsertCommand="INSERT INTO [Customers] ([Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber]) VALUES (@Email, @LastName, @FirstName, @Address, @City, @State, @ZipCode, @PhoneNumber)" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="SELECT [Email], [LastName], [FirstName], [Address], [City], [State], [ZipCode], [PhoneNumber] FROM [Customers] WHERE ([Email] = @Email)" 
                    UpdateCommand="UPDATE [Customers] SET [LastName] = @LastName, [FirstName] = @FirstName, [Address] = @Address, [City] = @City, [State] = @State, [ZipCode] = @ZipCode, [PhoneNumber] = @PhoneNumber WHERE [Email] = @original_Email AND [LastName] = @original_LastName AND [FirstName] = @original_FirstName AND [Address] = @original_Address AND [City] = @original_City AND [State] = @original_State AND [ZipCode] = @original_ZipCode AND [PhoneNumber] = @original_PhoneNumber">
                    <DeleteParameters>
                        <asp:Parameter Name="original_Email" Type="String" />
                        <asp:Parameter Name="original_LastName" Type="String" />
                        <asp:Parameter Name="original_FirstName" Type="String" />
                        <asp:Parameter Name="original_Address" Type="String" />
                        <asp:Parameter Name="original_City" Type="String" />
                        <asp:Parameter Name="original_State" Type="String" />
                        <asp:Parameter Name="original_ZipCode" Type="String" />
                        <asp:Parameter Name="original_PhoneNumber" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="FirstName" Type="String" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="City" Type="String" />
                        <asp:Parameter Name="State" Type="String" />
                        <asp:Parameter Name="ZipCode" Type="String" />
                        <asp:Parameter Name="PhoneNumber" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="Email" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="FirstName" Type="String" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="City" Type="String" />
                        <asp:Parameter Name="State" Type="String" />
                        <asp:Parameter Name="ZipCode" Type="String" />
                        <asp:Parameter Name="PhoneNumber" Type="String" />
                        <asp:Parameter Name="original_Email" Type="String" />
                        <asp:Parameter Name="original_LastName" Type="String" />
                        <asp:Parameter Name="original_FirstName" Type="String" />
                        <asp:Parameter Name="original_Address" Type="String" />
                        <asp:Parameter Name="original_City" Type="String" />
                        <asp:Parameter Name="original_State" Type="String" />
                        <asp:Parameter Name="original_ZipCode" Type="String" />
                        <asp:Parameter Name="original_PhoneNumber" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>" 
                    SelectCommand="SELECT [StateCode], [StateName] FROM [States] ORDER BY [StateName]">
                </asp:SqlDataSource>
                <p>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                        HeaderText="Please correct the following errors:" CssClass="error" />
                </p>
                <p>
                    <asp:Label ID = "lblError" runat="server" EnableViewState="False" CssClass="error"></asp:Label>
                </p>
            </div>
        </form>
    </section>
</body>
</html>
