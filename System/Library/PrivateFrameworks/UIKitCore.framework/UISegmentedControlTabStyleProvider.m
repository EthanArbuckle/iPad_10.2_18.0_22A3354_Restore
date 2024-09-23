@implementation UISegmentedControlTabStyleProvider

- (double)cornerRadiusForControlSize:(int)a3
{
  return 19.0;
}

- (double)selectionIndicatorInsetForControlSize:(int)a3
{
  return 4.0;
}

- (double)defaultHeightForControlSize:(int)a3 traitCollection:(id)a4
{
  return 38.0;
}

- (double)defaultContentPaddingWidth
{
  return 16.0;
}

- (BOOL)apportionsSegmentWidthsByContentByDefault
{
  return 1;
}

- (id)backgroundBlurEffect
{
  return +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 10);
}

- (id)fontForControlSize:(int)a3 selected:(BOOL)a4
{
  return (id)objc_msgSend(off_1E167A828, "_preferredFontForTextStyle:weight:", CFSTR("UICTFontTextStyleSubhead"), a4, *(double *)off_1E167DC68);
}

- (id)fontColorForSegment:(id)a3 enabled:(BOOL)a4 selected:(BOOL)a5 state:(unint64_t)a6
{
  void *v6;
  void *v7;

  if (a5)
  {
    objc_msgSend(a3, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "userInterfaceStyle") == 1)
      +[UIColor tintColor](UIColor, "tintColor");
    else
      +[UIColor labelColor](UIColor, "labelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor", a3, a4, a5, a6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

@end
