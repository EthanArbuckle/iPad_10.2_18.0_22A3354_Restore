@implementation _UIContentUnavailableViewTV

- (id)_buttonBackgroundImageForStyle:(unint64_t)a3 controlState:(unint64_t)a4
{
  return 0;
}

- (id)_titleFont
{
  return (id)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleHeadline"));
}

- (double)_labelAlpha
{
  return 0.6;
}

- (double)_buttonAlpha
{
  return 1.0;
}

- (id)_buttonFont
{
  return (id)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleHeadline"));
}

- (CGSize)_buttonSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 390.0;
  v3 = 72.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)_labelVerticalSpacing
{
  return 68.0;
}

- (double)_buttonVerticalSpacing
{
  return 89.0;
}

@end
