<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Temperature Conversion</title>
    <style>
        .radio-container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .radio-container label {
            margin-bottom: 5px;
        }

        .radio-container .radio-buttons {
            display: flex;
            justify-content: center;
            gap: 15px; /* Space between radio buttons */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center; margin-top: 50px;">
            <h1>Temperature Conversion</h1>
            
            <asp:Label ID="lblTemperature" runat="server" Text="Enter Temperature:"></asp:Label>
            <asp:TextBox ID="txtTemperature" runat="server"></asp:TextBox><br /><br />
            
            <div class="radio-container">
                <asp:Label ID="lblConvertTo" runat="server" Text="Convert To:"></asp:Label>
                <div class="radio-buttons">
                    <asp:RadioButtonList ID="rblConversionType" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="Celsius" Text="Celsius" />
                        <asp:ListItem Value="Fahrenheit" Text="Fahrenheit" />
                    </asp:RadioButtonList>
                </div>
            </div><br /><br />
            
            <asp:Button ID="btnConvert" runat="server" Text="Convert" OnClick="btnConvert_Click" /><br /><br />
            
            <asp:Label ID="lblResult" runat="server" Text="" ForeColor="Blue"></asp:Label>
        </div>
    </form>

    <script runat="server">
        protected void btnConvert_Click(object sender, EventArgs e)
        {
            try
            {
                double temperature = double.Parse(txtTemperature.Text);
                string conversionType = rblConversionType.SelectedValue;
                double convertedTemperature;

                if (conversionType == "Celsius")
                {
                    convertedTemperature = (temperature - 32) * 5 / 9;
                    lblResult.Text = $"Result: {convertedTemperature:F2} °C";
                }
                else if (conversionType == "Fahrenheit")
                {
                    convertedTemperature = (temperature * 9 / 5) + 32;
                    lblResult.Text = $"Result: {convertedTemperature:F2} °F";
                }
                else
                {
                    lblResult.Text = "Please select a conversion type.";
                }
            }
            catch (FormatException)
            {
                lblResult.Text = "Please enter a valid numeric temperature.";
            }
        }
    </script>
</body>
</html>
