@implementation UIColor(TSUAdditions)

+ (id)tsu_tableViewCellDarkBlueTextColor
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)tsu_tableViewCellDarkBlueTextColor_sColor;
  if (!tsu_tableViewCellDarkBlueTextColor_sColor)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.219607843, 0.329411765, 0.529411765, 1.0);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)tsu_tableViewCellDarkBlueTextColor_sColor;
    tsu_tableViewCellDarkBlueTextColor_sColor = v1;

    v0 = (void *)tsu_tableViewCellDarkBlueTextColor_sColor;
  }
  return v0;
}

@end
