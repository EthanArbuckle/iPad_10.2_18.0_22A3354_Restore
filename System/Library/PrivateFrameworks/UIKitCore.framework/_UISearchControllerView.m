@implementation _UISearchControllerView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  _UISearchControllerView *v5;
  void *v6;
  _UISearchControllerView *v7;
  _UISearchControllerView *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UISearchControllerView;
  -[UIView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (_UISearchControllerView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self
    || (-[UIView __viewDelegate]((id *)&self->super.super.super.isa),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "_resultsControllerViewContainer"),
        v7 = (_UISearchControllerView *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v5 == v7))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (void)_ensureViewOfClassIsOnTop:(Class)a3
{
  void *v5;
  _QWORD v6[6];

  -[UIView subviews](self, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53___UISearchControllerView__ensureViewOfClassIsOnTop___block_invoke;
  v6[3] = &unk_1E16DED38;
  v6[4] = self;
  v6[5] = a3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

}

- (void)_ensureContainerIsOnTop
{
  if (!-[_UISearchControllerView _ensureSystemInputViewAboveSearchBarContainerView](self, "_ensureSystemInputViewAboveSearchBarContainerView"))-[_UISearchControllerView _ensureViewOfClassIsOnTop:](self, "_ensureViewOfClassIsOnTop:", objc_opt_class());
}

- (void)_ensureCarPlayLimitedUIIsOnTop
{
  void *v3;
  uint64_t v4;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 3)
    -[_UISearchControllerView _ensureViewOfClassIsOnTop:](self, "_ensureViewOfClassIsOnTop:", objc_opt_class());
}

- (void)_ensurePortalViewIsOnTop
{
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
  {
    -[_UISearchControllerView _ensureViewOfClassIsOnTop:](self, "_ensureViewOfClassIsOnTop:", objc_opt_class());
  }
}

- (void)_addSubview:(id)a3 positioned:(int64_t)a4 relativeTo:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UISearchControllerView;
  -[UIView _addSubview:positioned:relativeTo:](&v6, sel__addSubview_positioned_relativeTo_, a3, a4, a5);
  -[_UISearchControllerView _ensureContainerIsOnTop](self, "_ensureContainerIsOnTop");
  -[_UISearchControllerView _ensureCarPlayLimitedUIIsOnTop](self, "_ensureCarPlayLimitedUIIsOnTop");
  -[_UISearchControllerView _ensurePortalViewIsOnTop](self, "_ensurePortalViewIsOnTop");
}

- (void)bringSubviewToFront:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UISearchControllerView;
  -[UIView bringSubviewToFront:](&v4, sel_bringSubviewToFront_, a3);
  -[_UISearchControllerView _ensureContainerIsOnTop](self, "_ensureContainerIsOnTop");
  -[_UISearchControllerView _ensureCarPlayLimitedUIIsOnTop](self, "_ensureCarPlayLimitedUIIsOnTop");
  -[_UISearchControllerView _ensurePortalViewIsOnTop](self, "_ensurePortalViewIsOnTop");
}

- (void)sendSubviewToBack:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UISearchControllerView;
  -[UIView sendSubviewToBack:](&v4, sel_sendSubviewToBack_, a3);
  -[_UISearchControllerView _ensureContainerIsOnTop](self, "_ensureContainerIsOnTop");
  -[_UISearchControllerView _ensureCarPlayLimitedUIIsOnTop](self, "_ensureCarPlayLimitedUIIsOnTop");
  -[_UISearchControllerView _ensurePortalViewIsOnTop](self, "_ensurePortalViewIsOnTop");
}

- (BOOL)_ensureSystemInputViewAboveSearchBarContainerView
{
  return self->__ensureSystemInputViewAboveSearchBarContainerView;
}

- (void)set_ensureSystemInputViewAboveSearchBarContainerView:(BOOL)a3
{
  self->__ensureSystemInputViewAboveSearchBarContainerView = a3;
}

@end
