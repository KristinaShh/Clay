<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="HistoryLogs.aspx.cs" Inherits="Clay01.HistoryLogs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>History of Doors that have been opened</h3>
    <asp:GridView ID="gvHistoryLogs" runat="server" CssClass="table table-hover table-striped"></asp:GridView>
</asp:Content>
