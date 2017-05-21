<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Clay01.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="tabordion">
<!--===================================================== 
    SECTION 1 NEW PROPERTY
========================================================== -->
        <section id="section1">
            <input type="radio" name="sections" id="option1" checked>
            <label for="option1">New Property</label>
            <article>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                    </Triggers>
                    <ContentTemplate>
                        <div class="form-group">
                            <div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                    ControlToValidate="name"
                                    ValidationGroup="AddProperty"
                                    ErrorMessage="Enter name of property"
                                    runat="Server">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-home fa" aria-hidden="true"></i></span>
                                    <asp:TextBox ID="name"
                                        class="form-control"
                                        name="name" runat="server"
                                        placeholder="Enter Property Name"
                                        CausesValidation="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="cols-sm-10">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                    ControlToValidate="numberOfDoors"
                                    ValidationGroup="AddProperty"
                                    ErrorMessage="Enter number"
                                    runat="Server">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                                    runat="server" ControlToValidate="numberOfDoors" ValidationGroup="AddProperty"
                                    ValidationExpression="^[0-9]*$"
                                    ErrorMessage="Enter number">
                                </asp:RegularExpressionValidator>
                            </div>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-key fa" aria-hidden="true"></i></span>
                                    <asp:TextBox ID="numberOfDoors"
                                        class="form-control"
                                        name="numberOfDoors" runat="server"
                                        CausesValidation="true"
                                        placeholder="Enter Number of Doors"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <asp:Button ID="btnSave"
                            runat="server"
                            Text="Save Property"
                            CssClass="btn btn-success"
                            CausesValidation="true"
                            ValidationGroup="AddProperty"
                            OnClick="btnSave_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </article>
        </section>
<!--===================================================== 
    SECTION 2 Add Doors to the property
========================================================== -->
        <section id="section2">
            <input type="radio" name="sections" id="option2">
            <label for="option2">Choose Property & Add Doors</label>
            <article>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnAddDoor" EventName="Click" />
                    </Triggers>
                    <ContentTemplate>
                        <div class="form-group">
                            <div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                                    ControlToValidate="propertyList"
                                    ValidationGroup="AddDoor"
                                    ErrorMessage="Please choose a property"
                                    runat="Server">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-home fa-lg" aria-hidden="true"></i></span>
                                    <asp:DropDownList runat="server" ID="propertyList" class="form-control"
                                        CausesValidation="true"
                                        ValidationGroup="AddDoor">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                                    ControlToValidate="doorDescription"
                                    ValidationGroup="AddDoor"
                                    ErrorMessage="Enter door description"
                                    runat="Server">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-key fa-lg" aria-hidden="true"></i></span>
                                    <asp:TextBox ID="doorDescription"
                                        class="form-control"
                                        name="door" runat="server"
                                        placeholder="Door Description"
                                        CausesValidation="true"
                                        ValidationGroup="AddDoor">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <asp:Button ID="btnAddDoor"
                            runat="server"
                            Text="Add Door"
                            CssClass="btn btn-success"
                            CausesValidation="true"
                            ValidationGroup="AddDoor"
                            OnClick="btnAddDoor_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </article>
        </section>
    </div>
</asp:Content>
