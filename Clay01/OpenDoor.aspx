<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="OpenDoor.aspx.cs" Inherits="Clay01.OpenDoor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!--Welcome label-->
    <span><i class="fa fa-user fa" aria-hidden="true"></i></span>
    <asp:Label ID="lblUser" runat="server"></asp:Label>

    <!--Sign Out Button-->
    <asp:Button ID="btn_signout" runat="server"
        Text="Sign Out"
        class="btn btn-info"
        OnClick="btn_signout_Click" />

    <!--GridView with all doors-->
    <asp:GridView ID="GridView1" runat="server"
        OnRowCommand="GridView1_RowCommand" Width="50%"
        CssClass="table table-hover table-striped">
        <Columns>
            <asp:TemplateField HeaderText="ID" ItemStyle-Width="150" Visible="false">
                <ItemTemplate>
                    <asp:TextBox ID="txtID" runat="server" Text='<%# Eval("DoorID") %>' />
                    <asp:TextBox ID="txtDoor" runat="server" Text='<%# Eval("Description") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:ButtonField ButtonType="Button"
                CommandName="OpenDoor"
                HeaderText="Open Door"
                Text="Open Door" />
        </Columns>
    </asp:GridView>
</asp:Content>
