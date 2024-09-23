@implementation UIPickerViewStyle

UIColor *__52___UIPickerViewStyle_tvOS_createCenterHighlightView__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  BOOL v3;
  double v4;

  v2 = objc_msgSend(a2, "userInterfaceStyle");
  v3 = v2 == 1000 || v2 == 2;
  v4 = 1.0;
  if (v3)
    v4 = 0.2;
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, v4);
}

@end
