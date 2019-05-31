<%@ Page Language="C#" async="true" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PhoneStation.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>

    <link href="webcss/Style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <section>
            <img src="webcss/background1.jpg" class="panel" />
        </section>
        <div class="sec2">
            <div class="container">
                <div class="social">
                    <a href="https://github.com/romaaxa" ><asp:Image ID="Image1" runat="server" ImageUrl="~/webcss/logo.png" /></a>
                    <a href="https://instagram.com/romaaxa"><asp:Image ID="Image2" runat="server" ImageUrl="~/webcss/inst.png" /></a>
                    <a href="https://twitter.com/romaaaxa"><asp:Image ID="Image3" runat="server" ImageUrl="~/webcss/twitter.png" /></a>
                    <a href="https://twitter.com/romaaaxa"><asp:Image ID="Image4" runat="server" ImageUrl="~/webcss/telegram.png" /></a>
                </div>
                        <div class="content">  
                        <h2>Administration Page</h2> <br />
                        
                        <asp:TextBox ID="TextBox1" placeholder="Username" runat="server" Height="35px" Width="300px"></asp:TextBox> <br />
                   
                        <asp:TextBox ID="TextBox2" placeholder="Password" runat="server" Height="35px" Width="300px" ></asp:TextBox> <br /> 
                   
                      
                        <asp:Button ID="Button1" runat="server" Text="Enter" OnClick="Button1_Click" /> <br />


                       <h2>Login as a Client</h2>
                    
                       <asp:Button ID="Button2" runat="server" Text="Login" OnClick="Button2_Click" ForeColor="White" />
                        </div>

                   </div>
               </div>
    </form>
</body>
</html>
