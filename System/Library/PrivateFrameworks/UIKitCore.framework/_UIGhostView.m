@implementation _UIGhostView

+ (id)ghostViewForView:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithView:", v4);

  return v5;
}

- (_UIGhostView)initWithView:(id)a3
{
  id v5;
  _UIGhostView *v6;
  _UIGhostView *v7;
  _UIPortalView *v8;
  _UIPortalView *portalView;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIGhostView;
  v6 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_view, a3);
    v8 = -[_UIPortalView initWithSourceView:]([_UIPortalView alloc], "initWithSourceView:", v5);
    portalView = v7->_portalView;
    v7->_portalView = v8;

    -[_UIPortalView setHidesSourceView:](v7->_portalView, "setHidesSourceView:", 1);
    -[UIView addSubview:](v7, "addSubview:", v7->_portalView);
  }

  return v7;
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIGhostView;
  -[UIView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setHidden:](self->_view, "setHidden:", v3 == 0);

}

- (void)didMoveToSuperview
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIGhostView;
  -[UIView didMoveToSuperview](&v4, sel_didMoveToSuperview);
  -[UIView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setHidden:](self->_view, "setHidden:", v3 == 0);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  _UIPortalView *v8;
  _UIPortalView *v9;
  _UIPortalView *v10;
  _UIPortalView *v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_UIGhostView;
  -[UIView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
  v8 = (_UIPortalView *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 == self->_portalView)
  {
    -[UIView hitTest:withEvent:](self->_view, "hitTest:withEvent:", v7, x, y);
    v10 = (_UIPortalView *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v8;
  }
  v11 = v10;

  return v11;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return -[UIView pointInside:withEvent:](self->_view, "pointInside:withEvent:", a4, a3.x, a3.y);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UIView intrinsicContentSize](self->_view, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UIView sizeThatFits:](self->_view, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[UIView setHidden:](self->_view, "setHidden:");
  v5.receiver = self;
  v5.super_class = (Class)_UIGhostView;
  -[UIView setHidden:](&v5, sel_setHidden_, v3);
}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;

  v3.receiver = self;
  v3.super_class = (Class)_UIGhostView;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  -[UIView setBounds:](self->_view, "setBounds:");
  -[UIView bounds](self, "bounds");
  -[_UIPortalView setFrame:](self->_portalView, "setFrame:");
  -[UIView bounds](self->_portalView, "bounds");
  if (!CGRectIsEmpty(v4))
  {
    -[UIView center](self->_portalView, "center");
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", 0);
    -[UIView setCenter:](self->_view, "setCenter:");
  }
}

- (UIView)view
{
  return self->_view;
}

- (_UIPortalView)portalView
{
  return self->_portalView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portalView, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end
