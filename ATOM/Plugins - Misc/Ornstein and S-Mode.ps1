# Launch: Hidden

Add-Type -AssemblyName PresentationFramework

[xml]$xaml = @"
<Window
	xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
	xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
	Title="Ornstein and S-Mode"
	Background="Transparent"
	AllowsTransparency="True"
	WindowStyle="None"
	Width="600" SizeToContent="Height"
	RenderOptions.BitmapScalingMode="HighQuality">
	
	<Window.Resources>
	
		<SolidColorBrush x:Key="primaryColor" Color="#E37222"/>
		<SolidColorBrush x:Key="primaryText" Color="Black"/>
		<SolidColorBrush x:Key="primaryHighlight" Color="#80FFFFFF"/>
		
		<SolidColorBrush x:Key="secondaryColor1" Color="#49494A"/>
		<SolidColorBrush x:Key="secondaryColor2" Color="#272728"/>
		<SolidColorBrush x:Key="secondaryText" Color="White"/>
		<SolidColorBrush x:Key="secondaryHighlight" Color="#80FFFFFF"/>
		
		<SolidColorBrush x:Key="accentColor" Color="#C3C4C4"/>
		<SolidColorBrush x:Key="accentText" Color="Black"/>
		<SolidColorBrush x:Key="accentHighlight" Color="#80FFFFFF"/>
	
		<Style x:Key="RoundHoverButtonStyle" TargetType="{x:Type Button}">
			<Setter Property="Background" Value="Transparent"/>
			<Setter Property="BorderBrush" Value="Transparent"/>
			<Setter Property="Template">
				<Setter.Value>
					<ControlTemplate TargetType="{x:Type Button}">
						<Grid>
							<Ellipse x:Name="circle" Fill="Transparent" Width="{TemplateBinding Width}" Height="{TemplateBinding Height}"/>
							<ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
						</Grid>
						<ControlTemplate.Triggers>
							<Trigger Property="IsMouseOver" Value="True">
								<Setter TargetName="circle" Property="Fill">
									<Setter.Value>
										<SolidColorBrush Color="#80FFFFFF"/>
									</Setter.Value>
								</Setter>
							</Trigger>
						</ControlTemplate.Triggers>
					</ControlTemplate>
				</Setter.Value>
			</Setter>
		</Style>
		
		<Style x:Key="RoundedButton" TargetType="{x:Type Button}">
			<Setter Property="Template">
				<Setter.Value>
					<ControlTemplate TargetType="{x:Type Button}">
						<Border x:Name="border" Background="{TemplateBinding Background}" BorderBrush="{TemplateBinding BorderBrush}" BorderThickness="0" CornerRadius="5">
							<ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
						</Border>
						<ControlTemplate.Triggers>
							<Trigger Property="IsMouseOver" Value="True">
								<Setter TargetName="border" Property="Background" Value="{DynamicResource secondaryHighlight}"/>
							</Trigger>
						</ControlTemplate.Triggers>
					</ControlTemplate>
				</Setter.Value>
			</Setter>
		</Style>
		
	</Window.Resources>
	
	<WindowChrome.WindowChrome>
		<WindowChrome ResizeBorderThickness="0" CaptionHeight="0" CornerRadius="10"/>
	</WindowChrome.WindowChrome>

	<Border BorderBrush="Transparent" BorderThickness="0" Background="{DynamicResource secondaryColor2}" CornerRadius="5">
		<Grid>
			<Grid.RowDefinitions>
				<RowDefinition Height="60"/>
				<RowDefinition Height="*"/>
				<RowDefinition Height="*"/>
				<RowDefinition Height="Auto"/>
			</Grid.RowDefinitions>
			<Grid Grid.Row="0">
				<Border Background="{DynamicResource primaryColor}" CornerRadius="5,5,0,0"/>
				<Image Name="logo" Width="40" Height="40" HorizontalAlignment="Left" VerticalAlignment="Center" Margin="15,0,0,0"/>
				<TextBlock Text="Ornstein and S-Mode" FontSize="20" FontWeight="Bold" VerticalAlignment="Center" HorizontalAlignment="Left" Foreground="{DynamicResource primaryText}" Margin="60,0,0,0"/>
				<Button Name="minimizeButton" Width="20" Height="20" Style="{StaticResource RoundHoverButtonStyle}" HorizontalAlignment="Right" Margin="0,0,45,0" ToolTip="Minimize"/>
				<Button Name="closeButton" Width="20" Height="20" Style="{StaticResource RoundHoverButtonStyle}" HorizontalAlignment="Right" Margin="0,0,10,0" ToolTip="Close"/>
			</Grid>
			<Grid Grid.Row="1">
				<Border Background="{DynamicResource secondaryColor1}" CornerRadius="5" Margin="10,10,10,0">
					<StackPanel>
						<TextBlock Name="regValue" Margin="10,10,0,0" TextWrapping="Wrap" Foreground="{DynamicResource secondaryText}"/>
						<TextBlock Name="secureBootStatus" Margin="10,0,10,0" TextWrapping="Wrap" Foreground="{DynamicResource secondaryText}"/>
						<TextBlock Name="tpmStatus" Margin="10,0,10,10" TextWrapping="Wrap" Foreground="{DynamicResource secondaryText}"/>
					</StackPanel>
				</Border>
			</Grid>
			<Grid Grid.Row="2">
				<Grid.ColumnDefinitions>
					<ColumnDefinition Width="*"/>
					<ColumnDefinition Width="*"/>
					<ColumnDefinition Width="*"/>
				</Grid.ColumnDefinitions>
				
				<Grid Name="gridStep1" Grid.Column="0">
					<Border Background="{DynamicResource secondaryColor1}" CornerRadius="5" Margin="10,10,5,0">
						<StackPanel Orientation="Vertical">
							<Label Content="Step 1" Foreground="{DynamicResource secondaryText}" FontWeight="Bold" HorizontalAlignment="Center"/>
							<TextBlock Name="txtStep1" Foreground="{DynamicResource secondaryText}" TextWrapping="Wrap" Margin="5"/>
							<Image Name="imgStep1" Width="140" Height="105" HorizontalAlignment="Center" Margin="10,0,10,10"/>
						</StackPanel>
					</Border>
				</Grid>
				
				<Grid Name="gridStep2" Grid.Column="1">
					<Border Background="{DynamicResource secondaryColor1}" CornerRadius="5" Margin="5,10,5,0">
						<StackPanel Orientation="Vertical">
							<Label Content="Step 2" Foreground="{DynamicResource secondaryText}" FontWeight="Bold" HorizontalAlignment="Center"/>
							<TextBlock Name="txtStep2" Foreground="{DynamicResource secondaryText}" TextWrapping="Wrap" Margin="5"/>
							<Image Name="imgStep2" Width="140" Height="105" HorizontalAlignment="Center" Margin="10,15,10,10"/>
						</StackPanel>
					</Border>
				</Grid>
				
				<Grid Name="gridStep3" Grid.Column="2">
					<Border Background="{DynamicResource secondaryColor1}" CornerRadius="5" Margin="5,10,10,0">
						<StackPanel Orientation="Vertical">
							<Label Content="Step 3" Foreground="{DynamicResource secondaryText}" FontWeight="Bold" HorizontalAlignment="Center"/>
							<TextBlock Name="txtStep3" Foreground="{DynamicResource secondaryText}" HorizontalAlignment="Center" TextAlignment="Center" TextWrapping="Wrap" Margin="5"/>
							<Image Name="imgStep3" Width="80" Height="100" HorizontalAlignment="Center" Margin="10,58,10,10"/>
						</StackPanel>
					</Border>
				</Grid>
				
			</Grid>
			<Grid Grid.Row="3">
				<Button Name="button" Content="Continue" Background="{DynamicResource accentColor}" Foreground="{DynamicResource accentText}" Margin="10" Height="20" Style="{StaticResource RoundedButton}"/>
			</Grid>
		</Grid>
	</Border>
</Window>
"@

$reader = New-Object System.Xml.XmlNodeReader $xaml
$window = [Windows.Markup.XamlReader]::Load($reader)

$atomPath = $MyInvocation.MyCommand.Path | Split-Path | Split-Path
$dependenciesPath = Join-Path $atomPath "Dependencies"
$iconsPath = Join-Path $dependenciesPath "Icons"

$logo = $window.FindName("logo")
$minimizeButton = $window.FindName("minimizeButton")
$closeButton = $window.FindName("closeButton")
$regValue = $window.FindName('regValue')
$secureBootStatus = $window.FindName('secureBootStatus')
$tpmStatus = $window.FindName('tpmStatus')
$gridStep1 = $window.FindName('gridStep1')
$txtStep1 = $window.FindName('txtStep1')
$imgStep1 = $window.FindName('imgStep1')
$gridStep2 = $window.FindName('gridStep2')
$txtStep2 = $window.FindName('txtStep2')
$imgStep2 = $window.FindName('imgStep2')
$gridStep3 = $window.FindName('gridStep3')
$txtStep3 = $window.FindName('txtStep3')
$imgStep3 = $window.FindName('imgStep3')
$button = $window.FindName('button')

$colorsPath = Join-Path $dependenciesPath "Colors-Custom.ps1"
. $colorsPath

$logo.Source = Join-Path $iconsPath "Plugins\Ornstein and S-Mode.png"

if ($primaryIcons -eq "Light") {
	$buttons = @{ "Minimize (Light)"=$minimizeButton; "Close (Light)"=$closeButton }
} else {
	$buttons = @{ "Minimize (Dark)"=$minimizeButton; "Close (Dark)"=$closeButton }
}

$buttons.GetEnumerator() | %{
	$uri = New-Object System.Uri (Join-Path $iconsPath "$($_.Key).png")
	$img = New-Object System.Windows.Media.Imaging.BitmapImage $uri
	$_.Value.Content = New-Object System.Windows.Controls.Image -Property @{ Source = $img }
}

$fontPath = Join-Path $dependenciesPath "Fonts\OpenSans-Regular.ttf"
$fontFamily = New-Object Windows.Media.FontFamily "file:///$fontPath#Open Sans"
$window.FontFamily = $fontFamily

$minimizeButton.Add_Click({ $window.WindowState = 'Minimized' })
$closeButton.Add_Click({ $window.Close() })
$window.Add_MouseLeftButtonDown({ $this.DragMove() })

$runOncePath = "HKLM:\Software\Microsoft\Windows\CurrentVersion\RunOnce"
$windowsTempPath = "$env:TEMP"
$scriptStatePath = Join-Path $windowsTempPath "Ornstein and S-Mode State"
$scriptFullPath = $MyInvocation.MyCommand.Path

function Start-OnReboot {
	$registryValue = "cmd /c `"start /b powershell -ExecutionPolicy Bypass -WindowStyle Hidden -File `"$scriptFullPath`"`""
	New-ItemProperty -Path $runOncePath -Name "Ornstein" -Value $registryValue -Force | Out-Null
}

$sModeRegPath = "HKLM:\System\CurrentControlSet\Control\CI\Policy"
$sModeRegName = "SkuPolicyRequired"
$sMode = (Get-ItemProperty -Path $sModeRegPath -Name $sModeRegName).$sModeRegName

if ($sMode -eq 0) {
	$sModeStatus = "Disabled"
	$sModeDisabled = $true
} elseif ($sMode -eq 1) {
	$sModeStatus = "Enabled"
	$sModeEnabled = $true
}

$secureBoot = Confirm-SecureBootUEFI
$tpm = (Get-Tpm).TpmReady

$regValue.Text			= "S-Mode Status:             " + $sModeStatus
$secureBootStatus.Text	= "Secure Boot Status:     " + $secureBoot
$tpmStatus.Text			= "TPM Status:                   " + $tpm

$txtStep1.Text  = "- Click 'Continue'`n"
$txtStep1.Text += "- S-Mode will be Disabled`n"
$txtStep1.Text += "- Computer will Reboot to UEFI`n"
$txtStep1.Text += "- Disable Secure Boot & TPM`n"
$txtStep1.Text += "- Save Changes and Restart`n"

$txtStep2.Text  = "- Click 'Continue'`n"
$txtStep2.Text += "- Computer will Reboot to UEFI`n"
$txtStep2.Text += "- Reenable Secure Boot & TPM`n"
$txtStep2.Text += "- Save Changes and Restart`n"

$txtStep3.Text  = "Praise the Sun!`n"
$txtStep3.Text += "Press 'Continue' to exit"
$imgStep3.Source = Join-Path $iconsPath "S-Mode3.png"

if ($secondaryIcons -eq "Light") {
	$imgStep1.Source = Join-Path $iconsPath "S-Mode1 (Light).png"
	$imgStep2.Source = Join-Path $iconsPath "S-Mode2 (Light).png"
} else {
	$imgStep1.Source = Join-Path $iconsPath "S-Mode1 (Dark).png"
	$imgStep2.Source = Join-Path $iconsPath "S-Mode2 (Dark).png"
}

if ($sModeEnabled) {
	$gridStep2.Opacity = "0.25"
	$gridStep3.Opacity = "0.25"
	$button.ToolTip = "Reboot to UEFI"
	function Launch-ContinueButton {
		Set-ItemProperty -Path $sModeRegPath -Name $sModeRegName -Type String -Value 0
		New-Item -Path $scriptStatePath -ItemType File -Force
		Start-OnReboot
		shutdown /r /fw /t 2
	}
} elseif ($sModeDisabled -and ($secureBoot -eq $true) -and (Test-Path $scriptStatePath)) {
	$gridStep2.Opacity = "0.25"
	$gridStep3.Opacity = "0.25"
	$button.ToolTip = "Reboot to UEFI"
	function Launch-ContinueButton {
		Start-OnReboot
		shutdown /r /fw /t 2
	}
} elseif ($sModeDisabled -and ($secureBoot -eq $false) -and ($tpm -eq $false)) {
	$gridStep1.Opacity = "0.25"
	$gridStep3.Opacity = "0.25"
	$button.ToolTip = "Reboot to UEFI"
	function Launch-ContinueButton {
		Remove-Item -Path $scriptStatePath -Force
		Start-OnReboot
		shutdown /r /fw /t 2
	}
} elseif ($sModeDisabled -and !(Test-Path $scriptStatePath)) {
	$gridStep1.Opacity = "0.25"
	$gridStep2.Opacity = "0.25"
	$button.ToolTip = "Close script"
	if (Test-Path $scriptStatePath) { Remove-Item -Path $scriptStatePath -Force }
	function Launch-ContinueButton {
		exit
	}
} else {
	$gridStep1.Opacity = "0.25"
	$gridStep2.Opacity = "0.25"
	$button.ToolTip = "Close script"
	function Launch-ContinueButton {
		exit
	}
}

$button.Add_Click({ Launch-ContinueButton })

$window.ShowDialog() | Out-Null