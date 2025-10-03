Add-Type -AssemblyName PresentationFramework

# Create the Window
$Window = New-Object System.Windows.Window
$Window.Title = "SIG Windows Installer"
$Window.Width = 400
$Window.Height = 300
$Window.WindowStartupLocation = "CenterScreen"

# Create a StackPanel for Vertical Layout
$StackPanel = New-Object System.Windows.Controls.StackPanel
$StackPanel.HorizontalAlignment = "Center"
$StackPanel.VerticalAlignment = "Center"

# Add a Title Label
$Title = New-Object System.Windows.Controls.Label
$Title.Content = "Select Windows Version"
$Title.FontSize = 16
$Title.HorizontalAlignment = "Center"
$StackPanel.Children.Add($Title)

# Function to start installation and close the window
function Start-Installation {
    param ($OSVersion)
    $Window.Close()  # Close the window after selection
    Start-OSDCloud -OSName $OSVersion -OSLanguage en-GB -OSEdition "Enterprise" -ZTI
    wpeutil reboot
}

# Button for Windows 11 24H2 Enterprise
$Button1 = New-Object System.Windows.Controls.Button
$Button1.Content = "Install Windows 11 24H2 Enterprise"
$Button1.Width = 300
$Button1.Height = 50
$Button1.Margin = "0,10,0,10"
$Button1.Add_Click({ Start-Installation 'Windows 11 24H2 x64' })
$StackPanel.Children.Add($Button1)

# Button for Windows 11 25H2 Enterprise
$Button2 = New-Object System.Windows.Controls.Button
$Button2.Width  = 300
$Button2.Height = 50
$Button2.Margin = "0,10,0,10"
$Button2.HorizontalContentAlignment = "Stretch"
$Button2.VerticalContentAlignment   = "Center"
$Button2.Padding = "0"
$tb = New-Object System.Windows.Controls.TextBlock
$tb.Text = "Install Windows 11 25H2 Enterprise`nTesting Only!"
$tb.TextAlignment = "Center"
$tb.TextWrapping  = "Wrap"
$Button2.Content = $tb
$Button2.Add_Click({ Start-Installation 'Windows 11 25H2 x64' })
$StackPanel.Children.Add($Button2)

# Add Warning Label (in red)
$WarningLabel = New-Object System.Windows.Controls.Label
$WarningLabel.Content = "⚠ WARNING: The primary disk will be formatted!"
$WarningLabel.FontSize = 14
$WarningLabel.Foreground = "Red"
$WarningLabel.HorizontalAlignment = "Center"
$StackPanel.Children.Add($WarningLabel)

# Set Content and Show Window
$Window.Content = $StackPanel
$Window.ShowDialog()

