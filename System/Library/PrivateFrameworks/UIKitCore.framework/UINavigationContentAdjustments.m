@implementation UINavigationContentAdjustments

- (UIEdgeInsets)insetAdjustment
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_insetAdjustment.top;
  left = self->_insetAdjustment.left;
  bottom = self->_insetAdjustment.bottom;
  right = self->_insetAdjustment.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setInsetAdjustment:(UIEdgeInsets)a3
{
  self->_insetAdjustment = a3;
}

- (UIScrollView)adjustedScrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_adjustedScrollView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_adjustedScrollView);
}

- (void)setAdjustedScrollView:(id)a3
{
  objc_storeWeak((id *)&self->_adjustedScrollView, a3);
}

@end
