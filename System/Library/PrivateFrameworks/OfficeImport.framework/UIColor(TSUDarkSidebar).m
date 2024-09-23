@implementation UIColor(TSUDarkSidebar)

+ (uint64_t)tsu_switchOnTintColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.478431373, 1.0, 1.0);
}

+ (uint64_t)tsu_switchTintColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.149019608, 0.149019608, 0.149019608, 1.0);
}

+ (uint64_t)tsu_switchOffOutlineColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.149019608, 0.149019608, 0.149019608, 1.0);
}

+ (uint64_t)tsu_sliderMinimumTrackTintColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.478431373, 1.0, 1.0);
}

+ (uint64_t)tsu_sliderMaximumTrackTintColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.149019608, 0.149019608, 0.149019608, 1.0);
}

+ (uint64_t)tsu_sliderThumbTintColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.8, 0.8, 0.8, 1.0);
}

+ (uint64_t)tsu_sidebarBackgroundColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.168627451, 0.168627451, 0.168627451, 1.0);
}

+ (uint64_t)tsu_sidebarNavigationBarTintColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
}

+ (uint64_t)tsu_sidebarNavigationBarBackgroundColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.168627451, 0.168627451, 0.168627451, 1.0);
}

+ (uint64_t)tsu_insertPaneBackgroundColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.168627451, 0.168627451, 0.168627451, 1.0);
}

+ (uint64_t)tsu_darkInsertSwatchBackgroundColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.6, 0.6, 0.6, 1.0);
}

+ (uint64_t)tsu_sidebarCellBackgroundColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.223529412, 0.223529412, 0.22745098, 1.0);
}

+ (uint64_t)tsu_rowItemDividersColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.141176471, 0.141176471, 0.141176471, 1.0);
}

+ (uint64_t)tsu_mediaBrowserNavigationBarTitleColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.670588235, 0.670588235, 0.670588235, 1.0);
}

+ (uint64_t)tsu_mediaBrowserNavigationBarTintColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
}

+ (uint64_t)tsu_mediaBrowserPrimaryContentColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.670588235, 0.670588235, 0.670588235, 1.0);
}

+ (uint64_t)tsu_mediaBrowserSecondaryContentColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.670588235, 0.670588235, 0.670588235, 1.0);
}

+ (uint64_t)tsu_sidebarNavigationBarTitleColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.949019608, 0.949019608, 0.949019608, 1.0);
}

+ (uint64_t)tsu_sidebarActiveTintColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.478431373, 1.0, 1.0);
}

+ (uint64_t)tsu_sidebarInactiveTintColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.949019608, 0.949019608, 0.949019608, 1.0);
}

+ (uint64_t)tsu_sidebarPlaybackButtonTintColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
}

+ (uint64_t)tsu_sidebarPrimaryContentColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.949019608, 0.949019608, 0.949019608, 1.0);
}

+ (uint64_t)tsu_sidebarSecondaryContentColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.670588235, 0.670588235, 0.670588235, 1.0);
}

+ (uint64_t)tsu_sidebarInactiveCellTintColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.498039216, 0.498039216, 0.498039216, 1.0);
}

+ (uint64_t)tsu_sidebarSegmentedControlTintColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.42745098, 0.42745098, 0.431372549, 1.0);
}

+ (uint64_t)tsu_sidebarSegmentedCellTintColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
}

+ (uint64_t)tsu_sidebarTableViewCellTintColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
}

+ (uint64_t)tsu_sidebarPressedStateColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.2, 0.2, 0.203921569, 1.0);
}

+ (uint64_t)tsu_sidebarTopTabTextColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.949019608, 0.949019608, 0.949019608, 1.0);
}

+ (uint64_t)tsu_progressViewTintColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.949019608, 0.949019608, 0.949019608, 1.0);
}

+ (uint64_t)tsu_progressViewTrackTintColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.168627451, 0.168627451, 0.168627451, 1.0);
}

+ (uint64_t)tsu_keynoteCanvasBackgroundColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.168627451, 0.168627451, 0.168627451, 1.0);
}

+ (uint64_t)tsu_keynoteCanvasDarkBackgroundColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.152941176, 0.152941176, 0.152941176, 1.0);
}

+ (uint64_t)tsu_keynoteNavigatorBackgroundColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.168627451, 0.168627451, 0.168627451, 1.0);
}

+ (uint64_t)tsu_keynoteNavigatorDividerColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.278431373, 0.278431373, 0.28627451, 1.0);
}

+ (uint64_t)tsu_navigatorSelectionHighlightColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.129411765, 0.48627451, 0.956862745, 1.0);
}

+ (uint64_t)tsu_navigatorSelectionFocusedHighlightColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.180392157, 0.576470588, 1.0, 1.0);
}

+ (uint64_t)tsu_darkToolbarBackgroundColor
{
  return objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.168627451, 0.168627451, 0.168627451, 1.0);
}

@end
