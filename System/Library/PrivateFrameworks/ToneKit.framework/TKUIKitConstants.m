@implementation TKUIKitConstants

+ (int64_t)defaultStyleForTableViewCellsWithDetailText
{
  return 1;
}

+ (UIColor)defaultTableViewCellTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "_labelColor");
}

+ (UIColor)groupedTableCellBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "tableCellGroupedBackgroundColor");
}

+ (UIColor)groupedTableHeaderFooterTextColor
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(MEMORY[0x24BDF6950], "_groupTableHeaderFooterTextColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.42745098, 0.42745098, 0.447058824, 1.0);
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

@end
