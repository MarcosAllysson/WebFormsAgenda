<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="WebFormsAgenda.Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3> List of users </h3>

    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSourceUsers" DataKeyNames="Email" InsertItemPosition="LastItem">

    <AlternatingItemTemplate>
        <tr style="background-color:#FFF8DC;">
            <td>
                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
            </td>
            <td>
                <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
            </td>
            <td>
                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
            </td>
            <td>
                <asp:Label ID="PasswordLabel" runat="server" Text='<%# Eval("Password") %>' />
            </td>
        </tr>
    </AlternatingItemTemplate>

    <EditItemTemplate>
        <tr style="background-color:#008A8C;color: #FFFFFF;">
            <td>
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            </td>
            <td>
                <asp:Label ID="EmailLabel1" runat="server" Text='<%# Eval("Email") %>' />
            </td>
            <td>
                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
            </td>
            <td>
                <asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Bind("Password") %>' />
            </td>
        </tr>
    </EditItemTemplate>

    <EmptyDataTemplate>
        <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
            <tr>
                <td>No data was returned.</td>
            </tr>
        </table>
    </EmptyDataTemplate>

    <InsertItemTemplate>
        <tr style="">
            <td>
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
            </td>
            <td>
                <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
            </td>
            <td>
                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
            </td>
            <td>
                <asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Bind("Password") %>' />
            </td>
        </tr>
    </InsertItemTemplate>

    <ItemTemplate>
        <tr style="background-color:#DCDCDC;color: #000000;">
            <td>
                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
            </td>
            <td>
                <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
            </td>
            <td>
                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
            </td>
            <td>
                <asp:Label ID="PasswordLabel" runat="server" Text='<%# Eval("Password") %>' />
            </td>
        </tr>
    </ItemTemplate>

    <LayoutTemplate>
        <table runat="server">
            <tr runat="server">
                <td runat="server">
                    <table 
                        id="itemPlaceholderContainer" 
                        runat="server" 
                        border="1" 
                        style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                        <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                            <th runat="server"></th>
                            <th runat="server">Email</th>
                            <th runat="server">Name</th>
                            <th runat="server">Password</th>
                        </tr>
                        <tr id="itemPlaceholder" runat="server">
                        </tr>
                    </table>
                </td>
            </tr>
            <tr runat="server">
                <td 
                    runat="server" 
                    style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                    <asp:DataPager ID="DataPager1" runat="server">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                        </Fields>
                    </asp:DataPager>
                </td>
            </tr>
        </table>
    </LayoutTemplate>

    <SelectedItemTemplate>
        <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
            <td>
                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
            </td>
            <td>
                <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
            </td>
            <td>
                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
            </td>
            <td>
                <asp:Label ID="PasswordLabel" runat="server" Text='<%# Eval("Password") %>' />
            </td>
        </tr>
    </SelectedItemTemplate>
</asp:ListView>

<asp:SqlDataSource 
    ID="SqlDataSourceUsers" 
    runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    DeleteCommand="DELETE FROM [User] WHERE [Email] = @Email" 
    InsertCommand="INSERT INTO [User] ([Email], [Name], [Password]) VALUES (@Email, @Name, @Password)" 
    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
    SelectCommand="SELECT * FROM [User]" 
    UpdateCommand="UPDATE [User] SET [Name] = @Name, [Password] = @Password WHERE [Email] = @Email">

    <DeleteParameters>
        <asp:Parameter Name="Email" Type="String" />
    </DeleteParameters>

    <InsertParameters>
        <asp:Parameter Name="Email" Type="String" />
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Password" Type="String" />
    </InsertParameters>

    <UpdateParameters>
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Password" Type="String" />
        <asp:Parameter Name="Email" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
