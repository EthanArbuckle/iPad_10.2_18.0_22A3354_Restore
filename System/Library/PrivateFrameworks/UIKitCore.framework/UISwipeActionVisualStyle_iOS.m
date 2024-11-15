@implementation UISwipeActionVisualStyle_iOS

- (unint64_t)defaultCollectionViewCompositionalLayoutSwipeStyle
{
  return 0;
}

- (unint64_t)defaultSwipeActionUIStyleForUITableViewStyle:(int64_t)a3
{
  return 0;
}

- (double)defaultButtonWidth
{
  return 74.0;
}

- (double)maxButtonWidth
{
  return 120.0;
}

- (double)buttonCornerRadiusForStyle:(unint64_t)a3 view:(id)a4
{
  void *v4;

  objc_msgSend(a4, "traitCollection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInterfaceIdiom");

  return 10.0;
}

- (double)interitemButtonCornerRadiusForStyle:(unint64_t)a3
{
  double result;

  result = 0.0;
  if (a3 == 2)
    return 2.0;
  return result;
}

- (double)paddingToSwipeViewForStyle:(unint64_t)a3
{
  double result;

  result = 0.0;
  if (a3 == 2)
    return 8.0;
  return result;
}

- (double)interButtonPaddingForStyle:(unint64_t)a3
{
  double result;

  result = 0.0;
  if (a3 == 2)
    return 2.0;
  return result;
}

- (unint64_t)maxLines
{
  return 2;
}

- (double)minFontSize
{
  return 11.0;
}

- (double)maxFontSize
{
  return 15.0;
}

- (double)titleFontWeight
{
  return *(double *)off_1E167DC68;
}

- (double)defaultContentHeightForView:(id)a3
{
  double result;

  UIRoundToViewScale(a3);
  return result;
}

- (double)horizontalPadding
{
  return 6.0;
}

- (double)iconToTitleSpacing
{
  return 5.0;
}

- (UIColor)defaultTintColor
{
  return +[UIColor whiteColor](UIColor, "whiteColor");
}

- (UIColor)defaultButtonBackgroundColor
{
  return +[UIColor systemGray3Color](UIColor, "systemGray3Color");
}

@end
