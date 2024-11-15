@implementation UITableView(PKUIUtilities)

+ (uint64_t)pkui_groupedStyleDefaultRoundedCornerBehavior
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__UITableView_PKUIUtilities__pkui_groupedStyleDefaultRoundedCornerBehavior__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (pkui_groupedStyleDefaultRoundedCornerBehavior_onceToken != -1)
    dispatch_once(&pkui_groupedStyleDefaultRoundedCornerBehavior_onceToken, block);
  return pkui_groupedStyleDefaultRoundedCornerBehavior_groupedStyle;
}

+ (uint64_t)pkui_groupedStyleWithRoundedCorners:()PKUIUtilities
{
  if (a3)
    return 2;
  else
    return 1;
}

- (uint64_t)pkui_setupForReadableContentGuide
{
  uint64_t result;

  result = objc_msgSend(a1, "pkui_userInterfaceIdiomSupportsLargeLayouts");
  if ((_DWORD)result)
  {
    result = objc_msgSend(a1, "style");
    if ((unint64_t)(result - 1) <= 1)
    {
      objc_msgSend(a1, "_setSectionContentInsetFollowsLayoutMargins:", 1);
      return objc_msgSend(a1, "setCellLayoutMarginsFollowReadableWidth:", 1);
    }
  }
  return result;
}

@end
