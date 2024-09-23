@implementation _UIInteractiveHighlightEffect

- (void)applyBackgroundEffectWithMagnitude:(double)a3 interactive:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;

  v5 = a4;
  v8 = a5;
  if (v5)
    -[_UIInteractiveHighlightEnvironment applyContentInsets:](self->_environment, "applyContentInsets:", self->_preferredContentInsets.top, self->_preferredContentInsets.left, self->_preferredContentInsets.bottom, self->_preferredContentInsets.right);
  -[_UIInteractiveHighlightEnvironment applyBackgroundEffectWithMagnitude:interactive:completion:](self->_environment, "applyBackgroundEffectWithMagnitude:interactive:completion:", v5, v8, a3);

}

- (void)finalizeEffect
{
  -[_UIInteractiveHighlightEnvironment removeInteractiveHighlightEffect:](self->_environment, "removeInteractiveHighlightEffect:", self);
}

- (void)dealloc
{
  objc_super v3;

  -[_UIInteractiveHighlightEffect finalizeEffect](self, "finalizeEffect");
  v3.receiver = self;
  v3.super_class = (Class)_UIInteractiveHighlightEffect;
  -[_UIInteractiveHighlightEffect dealloc](&v3, sel_dealloc);
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (UIVisualEffectView)effectView
{
  return (UIVisualEffectView *)objc_loadWeakRetained((id *)&self->_effectView);
}

- (void)setEffectView:(id)a3
{
  objc_storeWeak((id *)&self->_effectView, a3);
}

- (UIEdgeInsets)preferredContentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_preferredContentInsets.top;
  left = self->_preferredContentInsets.left;
  bottom = self->_preferredContentInsets.bottom;
  right = self->_preferredContentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPreferredContentInsets:(UIEdgeInsets)a3
{
  self->_preferredContentInsets = a3;
}

- (_UIInteractiveHighlightEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_environment, a3);
}

- (UIView)superview
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_superview);
}

- (void)setSuperview:(id)a3
{
  objc_storeWeak((id *)&self->_superview, a3);
}

- (_UIPortalView)portalView
{
  return (_UIPortalView *)objc_loadWeakRetained((id *)&self->_portalView);
}

- (void)setPortalView:(id)a3
{
  objc_storeWeak((id *)&self->_portalView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_portalView);
  objc_destroyWeak((id *)&self->_superview);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_destroyWeak((id *)&self->_effectView);
  objc_destroyWeak((id *)&self->_view);
}

@end
