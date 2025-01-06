<%--
    Aqui, você está referenciando a Master Page com MasterPageFile="~/MainMasterPage.Master".
--%>
<%@ Page Title="" Language="C#" MasterPageFile="~/MainMasterPage.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebFormsAgenda.Index" %>


<%--
    O controle <asp:Content> é usado para definir o conteúdo que será inserido nos ContentPlaceHolders da Master Page.
--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Image ID="Image1" runat="server" Height="331px" ImageUrl="~/Images/agenda.png" Width="334px" />
</asp:Content>
