<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.Master" AutoEventWireup="true" CodeBehind="Contacts.aspx.cs" Inherits="WebFormsAgenda.Contacts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Create New Contact" Font-Bold="True" Font-Size="Larger"></asp:Label>

    <br />
    <asp:Label ID="Label2" runat="server" Text="Name: " Font-Bold="True"></asp:Label>
    <asp:TextBox ID="txtName" runat="server" Width="234px"></asp:TextBox>

    <br />
    <asp:Label ID="Label3" runat="server" Text="Email:" Font-Bold="True"></asp:Label>
    &nbsp;<asp:TextBox ID="txtEmail" runat="server" Width="234px"></asp:TextBox>
    
    <br />
    <asp:Label ID="Label4" runat="server" Text="Phone: " Font-Bold="True"></asp:Label>
    <asp:TextBox ID="txtPhone" runat="server" Width="226px"></asp:TextBox>
    
    <br />
    <asp:Button ID="buttonCreate" runat="server" Font-Bold="True" Text="Create" OnClick="buttonCreate_Click" />
    <br />


    <h3>Contacts List</h3>

    <asp:GridView 
        ID="GridView1" 
        runat="server" 
        AllowPaging="True" 
        AllowSorting="True" 
        AutoGenerateColumns="False" 
        BackColor="White" 
        BorderColor="#999999" 
        BorderStyle="Solid" 
        BorderWidth="1px" 
        CellPadding="3" 
        DataKeyNames="Id" 
        DataSourceID="SqlDataSourceContacts" 
        ForeColor="Black" 
        GridLines="Vertical" >
        <AlternatingRowStyle BackColor="#CCCCCC" />

        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
        </Columns>

        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>

    <asp:SqlDataSource 
        ID="SqlDataSourceContacts" 
        runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Contact] WHERE [Id] = @Id" 
        InsertCommand="INSERT INTO [Contact] ([Name], [Email], [Phone]) VALUES (@Name, @Email, @Phone)" 
        SelectCommand="SELECT * FROM [Contact]" 
        UpdateCommand="UPDATE [Contact] SET [Name] = @Name, [Email] = @Email, [Phone] = @Phone WHERE [Id] = @Id">

        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>

        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
        </InsertParameters>

        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
