@implementation _UINavigationControllerPaletteClippingView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  _UINavigationControllerPaletteClippingView *v5;
  _UINavigationControllerPaletteClippingView *v6;
  _UINavigationControllerPaletteClippingView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UINavigationControllerPaletteClippingView;
  -[UIView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (_UINavigationControllerPaletteClippingView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

- (BOOL)_isTransparentFocusRegion
{
  return 1;
}

@end
