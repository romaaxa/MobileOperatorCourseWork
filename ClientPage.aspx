<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClientPage.aspx.cs" Inherits="PhoneStation.ClientPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Client</title>
    <link href="webcss/StyleClient.css" rel="stylesheet" />
    <link href="BootstrapCSS/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="BootstrapJS/bootstrap.min.js"></script>
    <style>
        .carousel-inner > .item > img,
        .carousel-inner > .item > a > img {
            width:100%;
            margin:auto;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <section>
            <img src="webcss/clientback.png" class="panel" />
        </section>
        <div class="sec2">
            <div class="content">
                <div class="secup" style="margin-bottom:250px; text-align:center; margin-right:700px; margin-top:50px">
                    <h3 style="font-family: 'Segoe UI', Verdana, Geneva, Tahoma, sans-serif;">We are glad to see you</h3><br /> <br />
                    <asp:Image ID="ImageClient" ImageUrl="~/githubuserimg.png" runat="server" Width="200px" Height="200px"/> <br />
                    <asp:Button ID="Button1" runat="server" Text="User" BackColor="#666666" 
                BorderColor="Black" BorderWidth="0px" Height="50px" style="margin-right:170px"/> 
                 </div>
             </div>
            <div style="margin-bottom:100px">
                <h2>Check rules please</h2>
            <p>We are glad to see you on our site.</p> <p>Plese be careful when you put your info to choose operator. 
                Our products are connected only with this operators: MTS, Life, Velcome, Yoola.</p><p> 
                If you enter the information incorrectly, your account will be deleted by the administration.
            </p>
            <h2>
                Example of filling the form:
            </h2>
                        <p> Ivanov Ivan MTS.</p>
            <h2>
                Please:</h2>
                <p>Enter the amount of your payment to the account. In case of discrepancies, you will be listed on our site.
            </p>
                    </div> 

            <br />
        </div>
          <div>
            <div class="sec2">
            
                <div class="content">

            <div><asp:Label ID="Label6" runat="server" Text="ID" Height="28px" Width="140px"></asp:Label>
                <asp:TextBox ID="TextBox1" placeholder="ID" runat="server" Height="26px" Width="170px"></asp:TextBox>
                </div>

            <div><asp:Label ID="Label3" runat="server" Text="Surname" Height="31px" Width="140px"></asp:Label>
                <asp:TextBox ID="TextBox2" placeholder="Surname" runat="server" Height="26px" Width="170px"></asp:TextBox></div>

            <div><asp:Label ID="Label4" runat="server" Text="   Name" Height="27px" Width="140px"></asp:Label>
                <asp:TextBox ID="TextBox3" placeholder="Name" runat="server" Height="31px" Width="170px"></asp:TextBox></div>

           <div> <asp:Label ID="Label5" runat="server" Text="Mobile Operator" Height="26px" Width="141px"></asp:Label>
               <asp:TextBox ID="TextBox4" placeholder="Mobile Operator" runat="server" Height="28px" Width="170px"></asp:TextBox></div>
            <div style="height: 36px">
                <asp:Label ID="Label7" runat="server" Text="Internet speed" Height="33px" Width="141px"></asp:Label>
                <asp:TextBox ID="TextBox5" placeholder="Internet Speed" runat="server" Height="28px" Width="170px"></asp:TextBox> <br />
                <asp:Button ID="Button2" runat="server" Text="Add" Width="210px" OnClick="Button2_Click" BackColor="#666666" 
                BorderColor="Black" BorderWidth="1px" Height="45px"/> <br />
                <asp:Button ID="ButtonTry" runat="server" Text="Exit" Width="210px" BackColor="#666666" 
                BorderColor="Black" BorderWidth="1px" Height="45px" OnClick="ButtonTry_Click"/> <br />
                <br />
                </div>
                          
                </div>
                     </div>
                </div>
              <div class ="slide">
             <br />
             <div id="myCarousel" class="carousel slide" data-ride="carousel">
                 <ol class="carousel-indicators">
                     <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                     <li data-target="#myCarousel" data-slide-to="1""></li>
                     <li data-target="#myCarousel" data-slide-to="2"></li>
                 </ol>
                 <div class="carousel-inner" role="listitem">
                     <div class="item-active">
                         <img class="img-responsive" src="Slide/phonestart.jpg" />
                     </div>
                     <div class="item">
                         <img class="img-responsive" src="Slide/phonesim.jpg" />
                     </div>
                     <div class="item">
                         <img class="img-responsive" src="Slide/phone end.jpg" />
                     </div>
                 </div>
                 <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                     <span class="icon-prev" aria-hidden="true"></span>
                     <span class="sr-only">Previous</span>
                 </a>
                 <a class="left carousel-control" href="#myCarousel" role="button" data-slide="next">
                     <span class="icon-next" aria-hidden="true"></span>
                     <span class="sr-only">Next</span>
                 </a>
             </div>
         </div> 
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Database1ConnectionString %>" DeleteCommand="DELETE FROM [requesttable] WHERE [Id] = @Id" InsertCommand="INSERT INTO [requesttable] ([Id], [surname], [name], [operator], [internetspeed], [sumofperation]) VALUES (@Id, @surname, @name, @operator, @internetspeed, @sumofperation)" SelectCommand="SELECT * FROM [requesttable]" UpdateCommand="UPDATE [requesttable] SET [surname] = @surname, [name] = @name, [operator] = @operator, [internetspeed] = @internetspeed, [sumofperation] = @sumofperation WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Id" Type="Int32" />
                <asp:Parameter Name="surname" Type="String" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="operator" Type="String" />
                <asp:Parameter Name="internetspeed" Type="Int32" />
                <asp:Parameter Name="sumofperation" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="surname" Type="String" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="operator" Type="String" />
                <asp:Parameter Name="internetspeed" Type="Int32" />
                <asp:Parameter Name="sumofperation" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
