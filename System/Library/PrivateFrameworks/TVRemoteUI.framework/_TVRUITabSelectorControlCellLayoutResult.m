@implementation _TVRUITabSelectorControlCellLayoutResult

- (_TVRUITabSelectorControlCellLayoutResult)initWithResolvedLayoutSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _TVRUITabSelectorControlCellLayoutResult *result;
  objc_super v6;

  height = a3.height;
  width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)_TVRUITabSelectorControlCellLayoutResult;
  result = -[_TVRUITabSelectorControlCellLayoutResult init](&v6, sel_init);
  if (result)
  {
    result->_resolvedLayoutSize.width = width;
    result->_resolvedLayoutSize.height = height;
  }
  return result;
}

- (CGSize)resolvedLayoutSize
{
  double width;
  double height;
  CGSize result;

  width = self->_resolvedLayoutSize.width;
  height = self->_resolvedLayoutSize.height;
  result.height = height;
  result.width = width;
  return result;
}

@end
