@implementation PUBlackOneUpInterfaceTheme

- (id)playheadColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

- (id)playheadOutlineColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
}

- (id)playheadBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
}

- (int64_t)photoBrowserBarStyle
{
  return 1;
}

- (id)photoBrowserTitleViewTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

- (id)photoBrowserSpotlightThemeColor
{
  return 0;
}

- (id)photoBrowserTitleViewTappableTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

- (id)photoBrowserChromeVisibleBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
}

- (id)scrubberPlaceholderColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.140000001, 1.0);
}

@end
