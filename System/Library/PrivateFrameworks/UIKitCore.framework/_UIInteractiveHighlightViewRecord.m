@implementation _UIInteractiveHighlightViewRecord

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (UIView)superview
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_superview);
}

- (void)setSuperview:(id)a3
{
  objc_storeWeak((id *)&self->_superview, a3);
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_effectView, a3);
}

- (_UIPortalView)portalView
{
  return self->_portalView;
}

- (void)setPortalView:(id)a3
{
  objc_storeStrong((id *)&self->_portalView, a3);
}

- (NSHashTable)interactiveHighlightEffects
{
  return self->_interactiveHighlightEffects;
}

- (void)setInteractiveHighlightEffects:(id)a3
{
  objc_storeStrong((id *)&self->_interactiveHighlightEffects, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactiveHighlightEffects, 0);
  objc_storeStrong((id *)&self->_portalView, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_destroyWeak((id *)&self->_superview);
  objc_destroyWeak((id *)&self->_view);
}

@end
