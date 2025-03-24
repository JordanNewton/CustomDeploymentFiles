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

# Button for Windows 11 23H2 Enterprise
$Button1 = New-Object System.Windows.Controls.Button
$Button1.Content = "Install Windows 11 23H2 Enterprise"
$Button1.Width = 300
$Button1.Height = 50
$Button1.Margin = "0,10,0,10"   # Adds space above and below
$Button1.Add_Click({ Start-OSDCloud -OSName 'Windows 11 23H2 x64' -OSLanguage en-GB -OSEdition "Enterprise" -CloudDriver Dell -ZTI })
$StackPanel.Children.Add($Button1)

# Button for Windows 11 24H2 Enterprise
$Button2 = New-Object System.Windows.Controls.Button
$Button2.Content = "Install Windows 11 24H2 Enterprise"
$Button2.Width = 300
$Button2.Height = 50
$Button2.Margin = "0,10,0,10"   # Adds space above and below
$Button2.Add_Click({ Start-OSDCloud -OSName 'Windows 11 24H2 x64' -OSLanguage en-GB -OSEdition "Enterprise" -CloudDriver Dell -ZTI})
$StackPanel.Children.Add($Button2)

# Set Content and Show Window
$Window.Content = $StackPanel
$Window.ShowDialog()