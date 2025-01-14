# Launch: Hidden

Add-Type -AssemblyName PresentationFramework, PresentationCore, WindowsBase

[xml]$xaml = @"
<Window
	xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
	xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
	Title="ATOM Store"
	Background="Transparent"
	WindowStyle="None"
	AllowsTransparency="True"
	Width="600" Height="600"
	MinWidth="400" MinHeight="400"
	MaxWidth="800" MaxHeight="800"
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
	
		<Style x:Key="CustomThumb" TargetType="{x:Type Thumb}">
			<Setter Property="Template">
				<Setter.Value>
					<ControlTemplate TargetType="{x:Type Thumb}">
						<Border Background="{DynamicResource accentColor}" CornerRadius="3" Margin="0,10,10,10"/>
					</ControlTemplate>
				</Setter.Value>
			</Setter>
		</Style>

		<Style x:Key="CustomScrollBar" TargetType="{x:Type ScrollBar}">
			<Setter Property="Width" Value="10"/>
			<Setter Property="Background" Value="Transparent"/>
			<Setter Property="Template">
				<Setter.Value>
					<ControlTemplate TargetType="{x:Type ScrollBar}">
						<Grid>
							<Rectangle Width="5" Fill="{DynamicResource accentHighlight}" RadiusX="3" RadiusY="3" Margin="0,10,10,10"/>
							<Track x:Name="PART_Track" IsDirectionReversed="True">
								<Track.Thumb>
									<Thumb Style="{StaticResource CustomThumb}"/>
								</Track.Thumb>
							</Track>
						</Grid>
					</ControlTemplate>
				</Setter.Value>
			</Setter>
		</Style>

		<Style x:Key="CustomScrollViewerStyle" TargetType="{x:Type ScrollViewer}">
			<Setter Property="Template">
				<Setter.Value>
					<ControlTemplate TargetType="{x:Type ScrollViewer}">
						<Grid>
							<Grid.ColumnDefinitions>
								<ColumnDefinition Width="*"/>
								<ColumnDefinition Width="Auto"/>
							</Grid.ColumnDefinitions>
							<ScrollContentPresenter Grid.Column="0"/>
							<ScrollBar x:Name="PART_VerticalScrollBar" Grid.Column="1" Orientation="Vertical" Style="{StaticResource CustomScrollBar}" Maximum="{TemplateBinding ScrollableHeight}" Value="{TemplateBinding VerticalOffset}" ViewportSize="{TemplateBinding ViewportHeight}"/>
						</Grid>
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
		
		<Style TargetType="ListBoxItem">
			<Setter Property="Foreground" Value="{DynamicResource secondaryText}"/>
			<Setter Property="Margin" Value="1"/>
			<Setter Property="Template">
				<Setter.Value>
					<ControlTemplate TargetType="{x:Type ListBoxItem}">
						<Border Background="{TemplateBinding Background}"
								BorderBrush="{TemplateBinding BorderBrush}"
								BorderThickness="{TemplateBinding BorderThickness}"
								Margin="{TemplateBinding Margin}"
								CornerRadius="5">
							<ContentPresenter/>
						</Border>
						<ControlTemplate.Triggers>
							<Trigger Property="IsMouseOver" Value="True">
								<Setter Property="Background" Value="{DynamicResource secondaryHighlight}"/>
								<Setter Property="BorderThickness" Value="1"/>
								<Setter Property="BorderBrush" Value="Transparent"/>
							</Trigger>
							<Trigger Property="IsSelected" Value="True">
								<Setter Property="Background" Value="#737474"/>
							</Trigger>
						</ControlTemplate.Triggers>
					</ControlTemplate>
				</Setter.Value>
			</Setter>
		</Style>
		
		<Style x:Key="CustomCheckBoxStyle" TargetType="{x:Type CheckBox}">
			<Setter Property="Template">
				<Setter.Value>
					<ControlTemplate TargetType="{x:Type CheckBox}">
						<Grid>
							<Grid.ColumnDefinitions>
								<ColumnDefinition Width="Auto"/>
								<ColumnDefinition Width="*"/>
							</Grid.ColumnDefinitions>
							<Image x:Name="PART_Image" Width="20" Height="20"/>
							<ContentPresenter Grid.Column="1" Margin="5,0,0,0" VerticalAlignment="Center"/>
						</Grid>
						<ControlTemplate.Triggers>
							<Trigger Property="IsChecked" Value="True">
								<Setter TargetName="PART_Image" Property="Source" Value="{DynamicResource CheckedImage}"/>
							</Trigger>
							<Trigger Property="IsChecked" Value="False">
								<Setter TargetName="PART_Image" Property="Source" Value="{DynamicResource UncheckedImage}"/>
							</Trigger>
						</ControlTemplate.Triggers>
					</ControlTemplate>
				</Setter.Value>
			</Setter>
		</Style>
		
	</Window.Resources>
	
	<WindowChrome.WindowChrome>
		<WindowChrome CaptionHeight="0" CornerRadius="10"/>
	</WindowChrome.WindowChrome>
	
	<Border BorderBrush="Transparent" BorderThickness="0" Background="{DynamicResource secondaryColor2}" CornerRadius="5">
		<Grid>
			<Grid.RowDefinitions>
				<RowDefinition Height="60"/>
				<RowDefinition Height="*"/>
				<RowDefinition Height="Auto"/>
			</Grid.RowDefinitions>
		
			<Grid Grid.Row="0">
				<Border Background="{DynamicResource primaryColor}" CornerRadius="5,5,0,0"/>
				<Image Name="logo" Width="40" Height="40" HorizontalAlignment="Left" VerticalAlignment="Center" Margin="10,0,0,0"/>
				<TextBlock Text="ATOM Store" FontSize="20" FontWeight="Bold" VerticalAlignment="Center" HorizontalAlignment="Left" Foreground="{DynamicResource primaryText}" Margin="60,0,0,0"/>
				<Button Name="minimizeButton" Width="20" Height="20" Style="{StaticResource RoundHoverButtonStyle}" HorizontalAlignment="Right" Margin="0,0,45,0" ToolTip="Minimize"/>
				<Button Name="closeButton" Width="20" Height="20" Style="{StaticResource RoundHoverButtonStyle}" HorizontalAlignment="Right" Margin="0,0,10,0" ToolTip="Close"/>
			</Grid>
			
			<Grid Grid.Row="1">
				<Grid.ColumnDefinitions>
					<ColumnDefinition Width="*"/>
					<ColumnDefinition Width="*"/>
				</Grid.ColumnDefinitions>
			
				<Border Grid.Column="0" CornerRadius="5" Background="{DynamicResource secondaryColor1}" Margin="10,10,5,0">
					<ScrollViewer Name="scrollViewer0" VerticalScrollBarVisibility="Auto" Style="{StaticResource CustomScrollViewerStyle}">
						<ListBox Name="programsListBox" Background="Transparent" Foreground="{DynamicResource secondaryText}" BorderThickness="0" HorizontalAlignment="Stretch" Margin="10,10,0,10"/>
					</ScrollViewer>
				</Border>
				
				<Border Grid.Column="1" CornerRadius="5" Background="{DynamicResource secondaryColor1}" Margin="5,10,10,0">
					<ScrollViewer Name="scrollViewer1" VerticalScrollBarVisibility="Auto" Style="{StaticResource CustomScrollViewerStyle}">
						<TextBlock Name="outputBox" Foreground="{DynamicResource secondaryText}" HorizontalAlignment="Stretch" TextWrapping="Wrap" VerticalAlignment="Stretch" Padding="10"/>
					</ScrollViewer>
				</Border>
			</Grid>
			
			<Button Name="installButton" Grid.Row="2" Content="Install Program(s)" Height="20" Background="{DynamicResource accentColor}" Foreground="{DynamicResource accentText}" BorderThickness="0" Margin="10" Style="{StaticResource RoundedButton}"/>
			
		</Grid>
	</Border>
</Window>
"@

$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($reader)

$preAtomPath = $MyInvocation.MyCommand.Path | Split-Path | Split-Path | Split-Path
$programsPath = Join-Path $preAtomPath "Programs"
$atomPath = $MyInvocation.MyCommand.Path | Split-Path | Split-Path
$dependenciesPath = Join-Path $atomPath "Dependencies"
$iconsPath = Join-Path $dependenciesPath "Icons"
$pluginsIconsPath = Join-Path $iconsPath "Plugins"
$hashtable = Join-Path $dependenciesPath "Programs-Hashtable.ps1"

. $hashtable

$logo = $window.FindName("logo")
$programsListBox = $Window.FindName("programsListBox")
$outputBox = $window.FindName("outputBox")
$installButton = $Window.FindName("installButton")
$minimizeButton = $window.FindName("minimizeButton")
$closeButton = $window.FindName("closeButton")

$colorsPath = Join-Path $dependenciesPath "Colors-Custom.ps1"
. $colorsPath

$logo.Source = Join-Path $iconsPath "Plugins\ATOM Store.png"

if ($secondaryIcons -eq "Light") {
	$checkedImagePath = Join-Path $iconsPath "Checkbox - Checked (Light).png"
	$uncheckedImagePath = Join-Path $iconsPath "Checkbox - Unchecked (Light).png"
} else {
	$checkedImagePath = Join-Path $iconsPath "Checkbox - Checked (Dark).png"
	$uncheckedImagePath = Join-Path $iconsPath "Checkbox - Unchecked (Dark).png"
}

$checkedImage = New-Object -TypeName System.Windows.Media.Imaging.BitmapImage -ArgumentList (New-Object -TypeName System.Uri -ArgumentList $checkedImagePath)
$uncheckedImage = New-Object -TypeName System.Windows.Media.Imaging.BitmapImage -ArgumentList (New-Object -TypeName System.Uri -ArgumentList $uncheckedImagePath)
$window.Resources.Add("CheckedImage", $checkedImage)
$window.Resources.Add("UncheckedImage", $uncheckedImage)

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

0..1 | % { $window.FindName("scrollViewer$_").AddHandler([System.Windows.UIElement]::MouseWheelEvent, [System.Windows.Input.MouseWheelEventHandler]{ param($sender, $e) $sender.ScrollToVerticalOffset($sender.VerticalOffset - $e.Delta) }, $true) }
$minimizeButton.Add_Click({ $window.WindowState = 'Minimized' })
$closeButton.Add_Click({ $window.Close() })
$window.Add_MouseLeftButtonDown({ $this.DragMove() })

foreach ($program in $programsInfo.Keys) {
	$checkbox = New-Object System.Windows.Controls.CheckBox
	$checkbox.Foreground = $secondaryText
	$checkBox.Style = $window.Resources["CustomCheckBoxStyle"]

	$iconPath = Join-Path $pluginsIconsPath "$program.png"
	$iconExists = Test-Path $iconPath
	if (!$iconExists) {
		$firstLetter = $program.Substring(0,1)
		$iconPath = if ($firstLetter -match "^[A-Z]") { Join-Path $iconsPath "\Default\Default$firstLetter.png" }
					else { Join-Path $iconsPath "\Default\Default.png" }
	}
	
	$image = New-Object System.Windows.Controls.Image
	$image.Source = $iconPath
	$image.Width = 16
	$image.Height = 16
	$image.Margin = "0,0,5,0"

	$textBlock = New-Object System.Windows.Controls.TextBlock
	$textBlock.Text = $program
	$textBlock.Foreground = $secondaryText
	$textBlock.VerticalAlignment = "Center"
	
	$stackPanel = New-Object System.Windows.Controls.StackPanel
	$stackPanel.Orientation = "Horizontal"
	$stackPanel.Children.Add($checkbox) | Out-Null
	$stackPanel.Children.Add($image) | Out-Null
	$stackPanel.Children.Add($textBlock) | Out-Null
	
	$listBoxItem = New-Object System.Windows.Controls.ListBoxItem
	$listBoxItem.Content = $stackPanel
	$listBoxItem.Tag = $checkBox
	
	$programPath = Join-Path $programsPath ($programsInfo[$program].ProgramFolder + "\" + $programsInfo[$program].ExeName)
	if (Test-Path $programPath) {
		$checkbox.IsEnabled = $false
		$stackPanel.Opacity = "0.25"
	} else {
		$listBoxItem.Add_MouseUp({ $this.Tag.IsChecked = !$this.Tag.IsChecked })
	}
	
	$programsListBox.Items.Add($listBoxItem) | Out-Null
}

$installButton.Add_Click({
	$scrollToEnd = $window.FindName("scrollViewer1").ScrollToEnd()
	
	$listBoxItems = $programsListBox.Items
	$checkedItems = @()
	foreach ($listboxItem in $programsListBox.Items) {
 		$stackPanel = $listBoxItem.Content
		$checkBox = $stackPanel.Children[0]
		if ($checkBox.IsChecked) {
			$textBlock = $stackPanel.Children[2]
			$checkedItems += $textBlock.Text
		}
	}
	
	$credentials = @{}
	foreach ($item in $checkedItems) {
		if ($programsInfo[$item].Credential) {
			$userName = $programsInfo[$item].UserName
			$credentials[$item] = Get-Credential -Message "Please enter your password for $item" -UserName $userName
		}
	}

	$runspace = [runspacefactory]::CreateRunspace()
	$runspace.ApartmentState = "STA"
	$runspace.ThreadOptions = "ReuseThread"
	$runspace.Open()
	
	$runspace.SessionStateProxy.SetVariable('outputBox', $outputBox)
	$runspace.SessionStateProxy.SetVariable('preAtomPath', $preAtomPath)
	$runspace.SessionStateProxy.SetVariable('programsPath', $programsPath)
	$runspace.SessionStateProxy.SetVariable('atomPath', $atomPath)
	$runspace.SessionStateProxy.SetVariable('dependenciesPath', $dependenciesPath)
	$runspace.SessionStateProxy.SetVariable('installButton', $installButton)
	$runspace.SessionStateProxy.SetVariable('hashtable', $hashtable)
	$runspace.SessionStateProxy.SetVariable('listBoxItems', $listBoxItems)
	$runspace.SessionStateProxy.SetVariable('programsListBox', $programsListBox)
	$runspace.SessionStateProxy.SetVariable('checkedItems', $checkedItems)
	$runspace.SessionStateProxy.SetVariable('credentials', $credentials)
	$runspace.SessionStateProxy.SetVariable('scrollToEnd', $scrollToEnd)
	
	$powershell = [powershell]::Create().AddScript({
		function Write-OutputBox {
			param([string]$Text)
			$outputBox.Dispatcher.Invoke([action]{ $outputBox.Text += "$Text`r`n"; $scrollToEnd }, "Render")
		}
		
		$installButton.Dispatcher.Invoke([action]{ $installButton.Content = "Running..."; $installButton.IsEnabled = $false }, "Render")
		
		. $hashtable
		
		function Install-PortableProgram {
			param (
				[Parameter(Mandatory=$true)]
				[string]$programKey
			)

			$downloadPath = Join-Path $env:TEMP ($programKey + ".zip")
			$extractionPath = Join-Path $programsPath $programsInfo[$programKey].ProgramFolder
			$ProgressPreference = 'SilentlyContinue'
			
			if ($programsInfo[$programKey].Override -ne $null) {
				& $programsInfo[$programKey].Override
				return
			}
			
			if ($programsInfo[$programKey].Credential) {
				$credential = $credentials[$programKey]
				$downloadURL = $programsInfo[$programKey].DownloadUrl
				Invoke-RestMethod -Uri $downloadURL -Headers @{"X-Requested-With" = "XMLHttpRequest"} -Credential $credential -OutFile $downloadPath
			} else {
				Invoke-WebRequest $programsInfo[$programKey].DownloadUrl -OutFile $downloadPath
			}
			
			Expand-Archive -Path $downloadPath -DestinationPath $extractionPath -Force
			Remove-Item -Path $downloadPath -Force
			
			if ($programsInfo[$programKey].PostInstall -ne $null) {
				& $programsInfo[$programKey].PostInstall
			}
		}
		
		if (!(Test-Path $programsPath)) { New-Item -Path $programsPath -ItemType Directory -Force }
		
		foreach ($programKey in $checkedItems) {
			Write-OutputBox "$($programKey):"
			Write-OutputBox "- Downloading"
			
			try {
				Install-PortableProgram -programKey $programKey
				Write-OutputBox "- Installed"
			} 
			catch {
				Write-OutputBox "- An error occurred. Verify internet connection, valid download URL, and credentials if applicable."
			}
			Write-OutputBox ""
		}
		
		<#
		$installButton.Dispatcher.Invoke([action]{
			foreach ($item in $programsListBox.Items) {
				if ($item.IsEnabled) {
					$item.IsChecked = $false
					$checkedItems = @()
				}
			}
		}, "Render")
		#>
		
		$installButton.Dispatcher.Invoke([action]{ $installButton.Content = "Run"; $installButton.IsEnabled = $true }, "Render")
	})
	$powershell.Runspace = $runspace
	$null = $powershell.BeginInvoke()
})

# Finds the resolution of the primary display and the display scaling setting
# If the "effective" resolution will cause ATOM's window to clip, it will decrease the window size
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class Display
{
	[DllImport("user32.dll")] public static extern IntPtr GetDC(IntPtr hwnd);
	[DllImport("gdi32.dll")] public static extern int GetDeviceCaps(IntPtr hdc, int nIndex);
	public static int GetScreenHeight() { return GetDeviceCaps(GetDC(IntPtr.Zero), 10); }
	public static int GetScalingFactor() { return GetDeviceCaps(GetDC(IntPtr.Zero), 88); }
}
"@

$scalingDecimal = [Display]::GetScalingFactor()/ 96
$effectiveVertRes = ([double][Display]::GetScreenHeight()/ $scalingDecimal)
if ($effectiveVertRes -le (1.0 * $window.MaxHeight)) {
	$window.MinHeight = 0.6 * $effectiveVertRes
	$window.MaxHeight = 0.9 * $effectiveVertRes
}

$window.ShowDialog() | Out-Null
