@implementation _UISearchBarContainerView

- (void)safeAreaInsetsDidChange
{
  if (self->_shouldSendContainerSafeAreaInsetsDidChange)
    -[UIView _containerSafeAreaInsetsDidChange:](self->_subview, "_containerSafeAreaInsetsDidChange:", self);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  _UISearchBarContainerView *v5;
  _UISearchBarContainerView *v6;
  _UISearchBarContainerView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UISearchBarContainerView;
  -[UIView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (_UISearchBarContainerView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

- (void)_addSubview:(id)a3 positioned:(int64_t)a4 relativeTo:(id)a5
{
  UIView *v8;
  char v9;
  UIView *subview;
  objc_super v11;

  v8 = (UIView *)a3;
  v11.receiver = self;
  v11.super_class = (Class)_UISearchBarContainerView;
  -[UIView _addSubview:positioned:relativeTo:](&v11, sel__addSubview_positioned_relativeTo_, v8, a4, a5);
  v9 = objc_opt_respondsToSelector();
  self->_shouldSendContainerSafeAreaInsetsDidChange = v9 & 1;
  if ((v9 & 1) != 0)
    -[UIView _containerSafeAreaInsetsDidChange:](v8, "_containerSafeAreaInsetsDidChange:", self);
  self->_resizingMask = -[UIView autoresizingMask](v8, "autoresizingMask");
  -[UIView setAutoresizingMask:](v8, "setAutoresizingMask:", 10);
  subview = self->_subview;
  self->_subview = v8;

}

- (void)_uncontainerSubview:(id)a3
{
  UIView *subview;

  if (self->_subview == a3)
  {
    objc_msgSend(a3, "setAutoresizingMask:", self->_resizingMask);
    subview = self->_subview;
    self->_subview = 0;

  }
}

- (void)enforceSubviewAtBottomIfNecessary
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double MaxY;
  double v12;
  double v13;
  CGRect v14;
  CGRect v15;

  -[UIView frame](self->_subview, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView bounds](self, "bounds");
  MaxY = CGRectGetMaxY(v14);
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  v12 = CGRectGetMaxY(v15);
  if (MaxY != v12)
  {
    v13 = MaxY - v12;
    if (v13 != 0.0)
      -[UIView setFrame:](self->_subview, "setFrame:", v4, v6 + v13, v8, v10);
  }
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UISearchBarContainerView;
  -[UIView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_UISearchBarContainerView enforceSubviewAtBottomIfNecessary](self, "enforceSubviewAtBottomIfNecessary");
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UISearchBarContainerView;
  -[UIView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_UISearchBarContainerView enforceSubviewAtBottomIfNecessary](self, "enforceSubviewAtBottomIfNecessary");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subview, 0);
}

@end
