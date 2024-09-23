@implementation _UITextFieldPaddedMetricsProvider

- (CGRect)contentFrameForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double top;
  double left;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectIsEmpty(a3))
  {
    top = self->_padding.top;
    left = self->_padding.left;
    v10 = width - left - self->_padding.right;
    v11 = v10 * 0.5;
    if (v10 >= 0.0)
      v11 = 0.0;
    width = fmax(v10, 0.0);
    v12 = height - top - self->_padding.bottom;
    v13 = v12 * 0.5;
    if (v12 >= 0.0)
      v13 = 0.0;
    height = fmax(v12, 0.0);
    x = x + left + v11;
    y = y + top + v13;
  }
  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)setMinimumIntrinsicHeight:(double)a3
{
  self->_minimumIntrinsicHeight = a3;
}

- (_UITextFieldPaddedMetricsProvider)initWithSymmetricalPadding:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _UITextFieldPaddedMetricsProvider *result;
  objc_super v6;

  height = a3.height;
  width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)_UITextFieldPaddedMetricsProvider;
  result = -[_UITextFieldPaddedMetricsProvider init](&v6, sel_init);
  if (result)
  {
    result->_padding.top = height;
    result->_padding.left = width;
    result->_padding.bottom = height;
    result->_padding.right = width;
  }
  return result;
}

- (CGSize)intrinsicSizeForContentSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[_UITextFieldPaddedMetricsProvider minimumIntrinsicHeight](self, "minimumIntrinsicHeight");
  if (v6 > 0.0)
  {
    v7 = dyld_program_sdk_at_least();
    -[_UITextFieldPaddedMetricsProvider minimumIntrinsicHeight](self, "minimumIntrinsicHeight");
    v9 = fmax(height, v8);
    if (v7)
      height = v9;
    else
      height = v8;
  }
  v10 = width - (-self->_padding.right - self->_padding.left);
  v11 = height - (-self->_padding.bottom - self->_padding.top);
  result.height = v11;
  result.width = v10;
  return result;
}

- (double)minimumIntrinsicHeight
{
  return self->_minimumIntrinsicHeight;
}

- (BOOL)shouldExtendCaretHeight
{
  return 1;
}

- (_UITextFieldPaddedMetricsProvider)init
{
  _UITextFieldPaddedMetricsProvider *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UITextFieldPaddedMetricsProvider;
  result = -[_UITextFieldPaddedMetricsProvider init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_padding.bottom = 0u;
    *(_OWORD *)&result->_padding.top = 0u;
  }
  return result;
}

- (_UITextFieldPaddedMetricsProvider)initWithPerEdgePadding:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  _UITextFieldPaddedMetricsProvider *result;
  objc_super v8;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v8.receiver = self;
  v8.super_class = (Class)_UITextFieldPaddedMetricsProvider;
  result = -[_UITextFieldPaddedMetricsProvider init](&v8, sel_init);
  if (result)
  {
    result->_padding.top = top;
    result->_padding.left = left;
    result->_padding.bottom = bottom;
    result->_padding.right = right;
  }
  return result;
}

- (double)naturalHeight
{
  return -1.0;
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (BOOL)canIntrinsicHeightExceedContentHeight
{
  return self->_canIntrinsicHeightExceedContentHeight;
}

- (void)setCanIntrinsicHeightExceedContentHeight:(BOOL)a3
{
  self->_canIntrinsicHeightExceedContentHeight = a3;
}

@end
