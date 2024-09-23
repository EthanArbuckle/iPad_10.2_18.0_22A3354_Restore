@implementation UITableViewCell(PKUIUtilities)

- (double)pkui_effectiveLayoutMargins
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "_shouldReverseLayoutDirection");
  objc_msgSend(a1, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "separatorInset");
  objc_msgSend(v2, "layoutMargins");
  v4 = v3;

  return v4;
}

@end
