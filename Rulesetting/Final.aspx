<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Final.aspx.cs" Inherits="Rulesetting.Final" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="Style2.css" />
    <script type="text/javascript" src="js/JScript.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField ID="hdnCurrentId" runat="server" />
        <nav class="navbar navbar-dark bg-dark">
            <!-- Navbar content goes here -->
            <span class="navbar-brand mb-0 h1">EMAIL-AUTOMATION</span>
            <div class="form-inline">
                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control mr-sm-2" placeholder="Search by Rule Name"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-outline-light my-2 my-sm-0" OnClick="btnSearch_Click"></asp:Button>
                <div style="margin-left: 10px;"></div>
                <!-- Small gap -->
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-outline-light my-2 my-sm-0" OnClick="btnCancel_Click" Visible="false"></asp:Button>
            </div>
        </nav>

        <table class="w-100">
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    <h1>Manage Your Rules</h1>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="center-container">
                    <asp:Button ID="Button1" runat="server" Text="Create" CssClass="btn btn-primary" OnClick="Button1_Click" />
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;  </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    <asp:GridView ID="GridView1" runat="server" OnRowDataBound="GridView1_RowDataBound" DataKeyNames="id" AutoGenerateColumns="False"
                        AllowPaging="true" PageSize="5" PagerStyle-Mode="NumericPages" PagerSettings-PageButtonCount="5"
                        OnPageIndexChanging="GridView1_PageIndexChanging" PagerStyle-HorizontalAlign="Center">
                        <Columns>
                            <asp:BoundField DataField="rulename" HeaderText="Rule Name" ItemStyle-Width="150px" ItemStyle-CssClass="gridview-center" HeaderStyle-CssClass="gridview-header" />
                            <asp:BoundField DataField="emailid" HeaderText="Email" ItemStyle-Width="200px" ItemStyle-CssClass="gridview-center" HeaderStyle-CssClass="gridview-header" />
                            <asp:BoundField DataField="subject" HeaderText="Subject" ItemStyle-Width="170px" ItemStyle-CssClass="gridview-center" HeaderStyle-CssClass="gridview-header" />
                            <asp:BoundField DataField="description" HeaderText="Description" ItemStyle-Width="220px" ItemStyle-CssClass="gridview-center" HeaderStyle-CssClass="gridview-header" />
                            <asp:BoundField DataField="body" HeaderText="Body" ItemStyle-Width="250px" ItemStyle-CssClass="gridview-center" HeaderStyle-CssClass="gridview-header" />
                            <asp:BoundField DataField="file_type" HeaderText="Filefilter" ItemStyle-Width="150px" ItemStyle-CssClass="gridview-center" HeaderStyle-CssClass="gridview-header" />
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:Label ID="lblEditDetailsHeader" runat="server" Text="Edit Details" CssClass="gridview-header" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Button ID="btnShowDetails" runat="server" Text="Edit" CssClass="edit-details-button"
                                        OnClientClick='<%# "resetPopup(); ShowDetails(" + Eval("id") + ", \"" + Eval("rulename") + "\", \"" + Eval("emailid") + "\", \"" + Eval("subject") + "\", \"" + Eval("description") + "\", \"" + Eval("body") + "\", \"" + Eval("file_type") + "\"); return false;" %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>

        <div id="popup" class="overlay" style="display: none;">
            <div class="popup-container">
                <span class="close-btn" onclick="hidePopup();">&times;</span>
                <h2>Edit Details</h2>
                <div class="container-fluid">
                    <!-- Textbox 1 -->
                    <div class="row">
                        <div class="col-lg-10">
                            <div class="form-group">
                                <asp:Label ID="lblRuleName" runat="server" AssociatedControlID="txtRuleName">Rule Name:</asp:Label>
                                <asp:TextBox ID="txtRuleName" runat="server" CssClass="form-control" placeholder="Enter Rule Name"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorRuleName" runat="server" ControlToValidate="txtRuleName" ErrorMessage="*Required" ForeColor="#3c8dbc" ValidationGroup="popupValidation"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <!-- Textbox 2 -->
                    <div class="row">
                        <div class="col-lg-10">
                            <div class="form-group">
                                <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail">Email:</asp:Label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Enter Email"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="*" ForeColor="#3c8dbc" ValidationGroup="popupValidation"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail" ErrorMessage="*Invalid Email" ValidationExpression="^([a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,},?)+$" ValidationGroup="popupValidation" ForeColor="#3c8dbc"></asp:RegularExpressionValidator>

                            </div>
                        </div>
                    </div>
                    <!-- Textbox 3 (Subject) -->
                    <div class="row">
                        <div class="col-lg-10">
                            <div class="form-group">
                                <asp:Label ID="lblSubject" runat="server" AssociatedControlID="txtSubject">Subject:</asp:Label>
                                <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="Enter Subject"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorSubject" runat="server" ControlToValidate="txtSubject" ErrorMessage="*Required" ForeColor="#3c8dbc" ValidationGroup="popupValidation"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <!-- Textbox 4 (Body) -->
                    <div class="row">
                        <div class="col-lg-10">
                            <div class="form-group">
                                <asp:Label ID="lblBody" runat="server" AssociatedControlID="txtbody">Body:</asp:Label>
                                <asp:TextBox ID="txtbody" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" Columns="50" placeholder="Enter Body"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorBody" runat="server" ControlToValidate="txtbody" ErrorMessage="*Required" ForeColor="#3c8dbc" ValidationGroup="popupValidation"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <!-- Textbox 5 (FileType) -->
                    <div class="row">
                        <div class="col-lg-10">
                            <div class="form-group">
                                <asp:Label ID="lblFileType" runat="server" AssociatedControlID="txtFileType">Filefilter:</asp:Label>
                                <asp:TextBox ID="txtFileType" runat="server" CssClass="form-control" placeholder="Enter FileType"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorFileType" runat="server" ControlToValidate="txtFileType" ErrorMessage="*Required" ForeColor="#3c8dbc" ValidationGroup="popupValidation"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btn-container">
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click" ValidationGroup="popupValidation" />
                    <button class="btn btn-secondary cancel-btn" onclick="hidePopup(); return false;">Cancel</button>

                </div>
            </div>
        </div>

        <div id="popup1" class="overlay">
            <div class="popup-container">
                <span class="close-btn" onclick="hidePopup1();">&times;</span>
                <h2>Create A Rule</h2>
                <div class="container-fluid">
                    <!-- Textbox 1 -->
                    <div class="row">
                        <div class="col-lg-10">
                            <div class="form-group">
                                <asp:Label ID="Label1" runat="server" AssociatedControlID="Textbox1">Rule Name:</asp:Label>
                                <asp:TextBox ID="Textbox1" runat="server" CssClass="form-control" placeholder="Enter Rule Name"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Textbox1" ErrorMessage="*Required..." ValidationGroup="ValidationGroup1" ForeColor="#3c8dbc"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                    <!-- Textbox 2 -->
                    <div class="row">
                        <div class="col-lg-10">
                            <div class="form-group">
                                <asp:Label ID="Label2" runat="server" AssociatedControlID="Textbox2">Email:</asp:Label>
                                <asp:TextBox ID="Textbox2" runat="server" CssClass="form-control" placeholder="Enter Multiple Emails Using Comma"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Textbox2" ErrorMessage="*<br/>" ValidationGroup="ValidationGroup1" ForeColor="#3c8dbc"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Textbox2" ErrorMessage="*Invalid Email" ValidationExpression="^([a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,},?)+$"  ValidationGroup="ValidationGroup1" ForeColor="#3c8dbc"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                    </div>


                    <!-- Textbox 3 -->
                    <div class="row">
                        <div class="col-lg-10">
                            <div class="form-group">
                                <asp:Label ID="Label3" runat="server" AssociatedControlID="Textbox3">Subject:</asp:Label>
                                <asp:TextBox ID="Textbox3" runat="server" CssClass="form-control" placeholder="Enter Subject"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Textbox3" ErrorMessage="*Required..." ValidationGroup="ValidationGroup1" ForeColor="#3c8dbc"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                    <!-- Textbox 4 -->
                    <div class="row">
                        <div class="col-lg-10">
                            <div class="form-group">
                                <asp:Label ID="Label4" runat="server" AssociatedControlID="Textbox4">Description:</asp:Label>
                                <asp:TextBox ID="Textbox4" runat="server" CssClass="form-control" placeholder="Enter Description"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Textbox4" ErrorMessage="*Required..." ValidationGroup="ValidationGroup1" ForeColor="#3c8dbc"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                    <!-- Textbox 5 -->
                    <div class="row">
                        <div class="col-lg-10">
                            <div class="form-group">
                                <asp:Label ID="Label5" runat="server" AssociatedControlID="Textbox5">Body:</asp:Label>
                                <asp:TextBox ID="Textbox5" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="Enter Body"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Textbox5" ErrorMessage="*Required..." ValidationGroup="ValidationGroup1" ForeColor="#3c8dbc"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                    <!-- Textbox 6 -->
                    <div class="row">
                        <div class="col-lg-10">
                            <div class="form-group">
                                <asp:Label ID="Label6" runat="server" AssociatedControlID="Textbox6">Filefilter:</asp:Label>
                                <asp:TextBox ID="Textbox6" runat="server" CssClass="form-control" placeholder="Enter Filefilter"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="Textbox6" ErrorMessage="*Required..." ValidationGroup="ValidationGroup1" ForeColor="#3c8dbc"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btn-container">
                    <asp:Button ID="Button2" runat="server" Text="Create" CssClass="btn btn-primary" OnClick="btnSave1_Click" ValidationGroup="ValidationGroup1" />
                    <!-- Cancel Button -->
                    <button class="btn btn-secondary cancel-btn" onclick="hidePopup1(); return false;">Cancel</button>

                </div>
            </div>
        </div>
        <!-- tick message-->
        <div id="success-popup" class="success-popup">
            <div class="success-content">
                <div class="success-icon">
                    <span>&#10003;</span>
                </div>
                <div class="success-message">Saved Successfully</div>
            </div>
        </div>

        <script type="text/javascript">
            var currentId;

            function ShowDetails(id, name, email, subject, description, body, fileType) {
                var popup = document.getElementById('popup');
                popup.style.display = 'block';
                document.getElementById('<%= txtRuleName.ClientID %>').value = name;
                    document.getElementById('<%= txtEmail.ClientID %>').value = email;
                    document.getElementById('<%= txtSubject.ClientID %>').value = subject;
                    document.getElementById('<%= txtbody.ClientID %>').value = body;
                    document.getElementById('<%= txtFileType.ClientID %>').value = fileType;
                    currentId = id;
                    document.getElementById('<%= hdnCurrentId.ClientID %>').value = currentId;
            }

            function resetPopup() {
                document.getElementById('<%= txtRuleName.ClientID %>').value = "";
                    document.getElementById('<%= txtEmail.ClientID %>').value = "";
            }

            function hidePopup() {
                document.getElementById('popup').style.display = 'none';
            }

            function showPopup1() {
                document.getElementById('popup1').style.display = 'flex';
            }

            function hidePopup1() {
                document.getElementById('popup1').style.display = 'none';
            }

            function showSuccessPopup() {
                var popup = document.getElementById('success-popup');
                popup.style.display = 'block';
                setTimeout(function () {
                    popup.style.display = 'none';
                }, 2000);
            }

        </script>
    </form>
</body>
</html>
