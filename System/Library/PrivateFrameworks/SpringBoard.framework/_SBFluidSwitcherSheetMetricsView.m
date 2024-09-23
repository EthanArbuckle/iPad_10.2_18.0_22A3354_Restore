@implementation _SBFluidSwitcherSheetMetricsView

- (UIEdgeInsets)_safeAreaInsetsForFrame:(CGRect)a3 inSuperview:(id)a4
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_overrideSafeAreaInsets.top;
  left = self->_overrideSafeAreaInsets.left;
  bottom = self->_overrideSafeAreaInsets.bottom;
  right = self->_overrideSafeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)overrideSafeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_overrideSafeAreaInsets.top;
  left = self->_overrideSafeAreaInsets.left;
  bottom = self->_overrideSafeAreaInsets.bottom;
  right = self->_overrideSafeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setOverrideSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_overrideSafeAreaInsets = a3;
}

@end
