@implementation _UINavigationBarBridgingPalette

- (void)_setSize:(CGSize)a3
{
  -[_UINavigationBarPalette setPreferredHeight:](self, "setPreferredHeight:", a3.height);
}

- (void)setFrame:(CGRect)a3 isAnimating:(BOOL)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView setFrame:](self, "setFrame:", a4);
  v9.origin.x = x;
  v9.origin.y = y;
  v9.size.width = width;
  v9.size.height = height;
  -[_UINavigationBarPalette setPreferredHeight:](self, "setPreferredHeight:", CGRectGetHeight(v9));
}

- (UIView)_backgroundView
{
  UIView *temporaryBackgroundView;
  UIView *v4;
  UIView *v5;

  temporaryBackgroundView = self->_temporaryBackgroundView;
  if (!temporaryBackgroundView)
  {
    v4 = (UIView *)objc_opt_new();
    v5 = self->_temporaryBackgroundView;
    self->_temporaryBackgroundView = v4;

    temporaryBackgroundView = self->_temporaryBackgroundView;
  }
  return temporaryBackgroundView;
}

- (BOOL)_paletteOverridesPinningBar
{
  return 0;
}

- (UINavigationController)navController
{
  return 0;
}

- (unint64_t)boundaryEdge
{
  return 0;
}

- (BOOL)pinningBarShadowWasHidden
{
  return 0;
}

- (BOOL)pinningBarShadowIsHidden
{
  return 0;
}

- (BOOL)paletteShadowIsHidden
{
  return 0;
}

- (BOOL)isVisibleWhenPinningBarIsHidden
{
  return 0;
}

- (UIEdgeInsets)preferredContentInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)isAttached
{
  void *v2;
  BOOL v3;

  -[UIView window](self, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)paletteIsHidden
{
  void *v2;
  BOOL v3;

  -[UIView window](self, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (id)_attachedPinningTopBar
{
  return 0;
}

- (BOOL)_shouldUpdateBackground
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryBackgroundView, 0);
}

@end
