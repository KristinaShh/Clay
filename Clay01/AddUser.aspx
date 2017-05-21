<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="Clay01.AddUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-login main-center col-lg-6">
        <h3>Add New User</h3>
        <form class="form-horizontal">
            <div class="form-group">
                <div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                        ControlToValidate="name"
                        ValidationGroup="AddNewUser"
                        ErrorMessage="*Please enter your name"
                        runat="Server">
                    </asp:RequiredFieldValidator>
                </div>

                <label for="name" class="cols-sm-2 control-label">Your Name</label>
                <div class="cols-sm-10">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                        <asp:TextBox ID="name"
                            class="form-control"
                            name="name" runat="server"
                            placeholder="Enter Your Name"
                            CausesValidation="true"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                        ControlToValidate="username"
                        ValidationGroup="AddNewUser"
                        ErrorMessage="*Please enter your username"
                        runat="Server">
                    </asp:RequiredFieldValidator>

                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                        ErrorMessage="Please enter valid email"
                        ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"
                        ControlToValidate="username">
                    </asp:RegularExpressionValidator>
                </div>

                <label for="username" class="cols-sm-2 control-label">Username</label>
                <div class="cols-sm-10">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                        <asp:TextBox ID="username"
                            class="form-control"
                            name="username" runat="server"
                            placeholder="Enter Username"
                            CausesValidation="true"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                        ControlToValidate="password"
                        ValidationGroup="AddNewUser"
                        ErrorMessage="*Please enter your password"
                        runat="Server">
                    </asp:RequiredFieldValidator>
                </div>
                <label for="password" class="cols-sm-2 control-label">Password</label>
                <div class="cols-sm-10">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                        <asp:TextBox ID="password"
                            TextMode="Password"
                            class="form-control"
                            name="password" runat="server"
                            placeholder="Enter your Password"
                            CausesValidation="true"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                        ControlToValidate="password"
                        ValidationGroup="AddNewUser"
                        ErrorMessage="*Please confirm your password"
                        runat="Server">
                    </asp:RequiredFieldValidator>
                </div>
                <label for="confirm" class="cols-sm-2 control-label">Confirm Password</label>
                <div class="cols-sm-10">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                        <asp:TextBox ID="confirmPassword"
                            TextMode="Password"
                            class="form-control"
                            name="confirm" runat="server"
                            placeholder="Confirm your Password"
                            CausesValidation="true"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="confirm" class="cols-sm-2 control-label">Property Name</label>
                <div class="cols-sm-10">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-home fa-lg" aria-hidden="true"></i></span>
                        <asp:DropDownList runat="server" ID="propertyList" class="form-control" CausesValidation="true" ValidationGroup="AddNewUser"></asp:DropDownList>
                    </div>
                </div>
            </div>

            <div class="form-group ">
                <asp:Button ID="btnRegister" runat="server" Text="Add New User"
                    class="btn btn-primary btn-lg btn-block login-button"
                    OnClick="btnRegister_Click" CausesValidation="true"
                    ValidationGroup="AddNewUser" />
            </div>
        </form>
    </div>
    <div class="main-login main-center col-lg-6">
        <h3>Sign in to open a door</h3>

        <div class="form-group">
            <div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                    ControlToValidate="sign_username"
                    ValidationGroup="SignIn"
                    ErrorMessage="*Please enter your username"
                    runat="Server">
                </asp:RequiredFieldValidator>

                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                    ErrorMessage="Please enter valid email"
                    ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"
                    ControlToValidate="sign_username">
                </asp:RegularExpressionValidator>
            </div>

            <label for="sign_username" class="cols-sm-2 control-label">Username</label>
            <div class="cols-sm-10">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                    <asp:TextBox ID="sign_username"
                        class="form-control"
                        name="sign_username" runat="server"
                        placeholder="Enter Username"
                        CausesValidation="true"></asp:TextBox>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                    ControlToValidate="sign_password"
                    ValidationGroup="SignIn"
                    ErrorMessage="*Please enter your password"
                    runat="Server">
                </asp:RequiredFieldValidator>
            </div>
            <label for="sign_password" class="cols-sm-2 control-label">Password</label>
            <div class="cols-sm-10">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                    <asp:TextBox ID="sign_password"
                        TextMode="Password"
                        class="form-control"
                        name="sign_password" runat="server"
                        placeholder="Enter your Password"
                        CausesValidation="true"></asp:TextBox>
                </div>
            </div>
        </div>

        <div class="form-group ">
            <asp:Button ID="btn_signin" runat="server" Text="Sign In"
                class="btn btn-success btn-lg btn-block login-button"
                OnClick="btn_signin_Click" CausesValidation="true"
                ValidationGroup="SignIn" />
        </div>

    </div>

</asp:Content>
