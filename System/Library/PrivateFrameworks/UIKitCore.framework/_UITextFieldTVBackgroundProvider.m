@implementation _UITextFieldTVBackgroundProvider

- (int64_t)associatedBorderStyle
{
  return -1;
}

- (id)backgroundView
{
  return 0;
}

- (CGRect)contentFrameForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = _UICGRectInsetZeroClamped(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 20.0, 0.0);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (double)naturalHeight
{
  return -1.0;
}

- (BOOL)shouldExtendCaretHeight
{
  return 1;
}

@end
