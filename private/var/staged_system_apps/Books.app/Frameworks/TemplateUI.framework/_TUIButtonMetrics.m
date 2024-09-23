@implementation _TUIButtonMetrics

- (_TUIButtonMetrics)initWithHeight:(double)a3 widthPadding:(double)a4 alignmentRectInsets:(UIEdgeInsets)a5
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  _TUIButtonMetrics *result;
  objc_super v12;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v12.receiver = self;
  v12.super_class = (Class)_TUIButtonMetrics;
  result = -[_TUIButtonMetrics init](&v12, "init");
  if (result)
  {
    result->_height = a3;
    result->_widthPadding = a4;
    result->_alignmentRectInsets.top = top;
    result->_alignmentRectInsets.left = left;
    result->_alignmentRectInsets.bottom = bottom;
    result->_alignmentRectInsets.right = right;
  }
  return result;
}

- (double)contentHeight
{
  return self->_height - self->_alignmentRectInsets.top - self->_alignmentRectInsets.bottom;
}

- (double)contentWidthPadding
{
  return self->_widthPadding - self->_alignmentRectInsets.left - self->_alignmentRectInsets.right;
}

- (double)height
{
  return self->_height;
}

- (double)widthPadding
{
  return self->_widthPadding;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_alignmentRectInsets.top;
  left = self->_alignmentRectInsets.left;
  bottom = self->_alignmentRectInsets.bottom;
  right = self->_alignmentRectInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

@end
