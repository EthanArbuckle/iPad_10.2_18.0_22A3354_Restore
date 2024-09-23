@implementation UIAlertControllerVisualStyleActionSheetCar

- (UIEdgeInsets)contentInsetsForContainerView:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat Width;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect v21;
  UIEdgeInsets result;

  v3 = a3;
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;
  objc_msgSend(v3, "safeAreaInsets");
  v7 = v5 + v6;
  objc_msgSend(v3, "bounds");
  Width = CGRectGetWidth(v21);
  v9 = fmax((Width - v7 - fmin(Width - v7, 420.0)) * 0.5, 10.0);
  v10 = _UIActionSheetPresentationControllerContentInsetsAdjustedForSafeAreaWithStandardContentInsets(v3, 6.0, v9, 6.0, v9);
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (id)titleLabelFont
{
  return (id)objc_msgSend(off_1E167A828, "systemFontOfSize:", 16.0);
}

- (id)titleLabelColor
{
  return +[UIColor labelColor](UIColor, "labelColor");
}

- (double)marginAboveTitleLabelFirstBaseline
{
  return 21.0;
}

- (double)marginBelowLastLabelLastBaseline
{
  return 11.5;
}

- (int64_t)maximumNumberOfLinesInTitleLabel
{
  return 1;
}

- (int64_t)maximumNumberOfLinesInMessageLabel
{
  return 2;
}

- (int64_t)permittedActionLayoutDirection
{
  return 1;
}

- (BOOL)placementAvoidsKeyboard
{
  return 0;
}

@end
