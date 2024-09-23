@implementation UISegmentedControlTVStyleProvider

- (BOOL)useGeneratedImages
{
  return 0;
}

- (BOOL)useTVStyleFocusSelection
{
  return 1;
}

- (double)selectionIndicatorOverflowForControlSize:(int)a3
{
  return 0.0;
}

- (double)dividerWidthForControlSize:(int)a3
{
  return 0.0;
}

- (double)cornerRadiusForControlSize:(int)a3
{
  return 6.0;
}

- (double)defaultHeightForControlSize:(int)a3 traitCollection:(id)a4
{
  double result;
  objc_super v5;

  if (a3 != 1)
    return 70.0;
  v5.receiver = self;
  v5.super_class = (Class)UISegmentedControlTVStyleProvider;
  -[UISegmentedControlDefaultStyleProvider defaultHeightForControlSize:traitCollection:](&v5, sel_defaultHeightForControlSize_traitCollection_, *(_QWORD *)&a3, a4);
  return result;
}

- (id)fontForControlSize:(int)a3 selected:(BOOL)a4
{
  return (id)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleHeadline"), a4);
}

- (id)fontColorForSegment:(id)a3 enabled:(BOOL)a4 selected:(BOOL)a5 state:(unint64_t)a6
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  v7 = a3;
  objc_msgSend(v7, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceStyle");

  switch(a6)
  {
    case 0uLL:
      v11 = (void *)objc_opt_class();
      if (v9 == 2)
        objc_msgSend(v11, "_tvDefaultTextColorNormalUserInterfaceStyleDark");
      else
        objc_msgSend(v11, "_tvDefaultTextColorNormalUserInterfaceStyleLight");
      goto LABEL_5;
    case 1uLL:
    case 8uLL:
      objc_msgSend((id)objc_opt_class(), "_tvDefaultTextColorFocused");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 2uLL:
      v12 = (void *)objc_opt_class();
      if (v9 == 2)
        objc_msgSend(v12, "_tvDefaultTextColorDisabledUserInterfaceStyleDark");
      else
        objc_msgSend(v12, "_tvDefaultTextColorDisabledUserInterfaceStyleLight");
LABEL_5:
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 4uLL:
      objc_msgSend(v7, "tintColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        v15 = v13;
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "_tvDefaultTextColorSelected");
        v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      v16 = v15;

      goto LABEL_15;
    case 6uLL:
      objc_msgSend((id)objc_opt_class(), "_tvDefaultTextColorDisabledSelected");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    default:
      objc_msgSend(v7, "_disabledColor");
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_14:
      v16 = (void *)v10;
LABEL_15:

      return v16;
  }
}

+ (id)_tvDefaultTextColorSelected
{
  return +[UIColor whiteColor](UIColor, "whiteColor");
}

+ (id)_tvDefaultTextColorFocused
{
  return +[UIColor blackColor](UIColor, "blackColor");
}

+ (id)_tvDefaultTextColorDisabledSelected
{
  return +[UIColor whiteColor](UIColor, "whiteColor");
}

+ (id)_tvDefaultTextColorNormalUserInterfaceStyleLight
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.5);
}

+ (id)_tvDefaultTextColorDisabledUserInterfaceStyleLight
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.1);
}

+ (id)_tvDefaultTextColorNormalUserInterfaceStyleDark
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.3);
}

+ (id)_tvDefaultTextColorDisabledUserInterfaceStyleDark
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.2);
}

@end
