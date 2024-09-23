@implementation _SAUIProvidedViewContainerView

- (_SAUIProvidedViewContainerView)initWithFrame:(CGRect)a3
{
  _SAUIProvidedViewContainerView *v3;
  _SAUIProvidedViewContainerView *v4;
  CGSize *p_lastSize;
  objc_class *v6;
  CGFloat v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_SAUIProvidedViewContainerView;
  v3 = -[_SAUIProvidedViewContainerView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    p_lastSize = &v3->_lastSize;
    -[_SAUIProvidedViewContainerView bounds](v3, "bounds");
    *(_QWORD *)&p_lastSize->width = v6;
    v4->_lastSize.height = v7;
  }
  return v4;
}

- (id)_contentView
{
  _SAUIPortalView *portalView;

  portalView = self->_portalView;
  if (!portalView)
    portalView = (_SAUIPortalView *)self->_providedView;
  return portalView;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id WeakRetained;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_SAUIProvidedViewContainerView;
  -[_SAUIProvidedViewContainerView layoutSubviews](&v14, sel_layoutSubviews);
  -[_SAUIProvidedViewContainerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_SAUIProvidedViewContainerView _contentView](self, "_contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  if (self->_lastSize.width != v8 || self->_lastSize.height != v10)
  {
    self->_lastSize.width = v8;
    self->_lastSize.height = v10;
    WeakRetained = objc_loadWeakRetained((id *)&self->_elementView);
    objc_msgSend(WeakRetained, "_didLayoutResizedTransformView:", self);

  }
}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  -[_SAUIProvidedViewContainerView window](self, "window");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)_SAUIProvidedViewContainerView;
  -[_SAUIProvidedViewContainerView willMoveToWindow:](&v6, sel_willMoveToWindow_, v4);

  if (v5 != v4 && v4 && v5)
    -[_SAUIProvidedViewContainerView _recreatePortalViewIfNeeded](self, "_recreatePortalViewIfNeeded");

}

- (void)setProvidedView:(id)a3
{
  UIView *v5;
  UIView **p_providedView;
  int v7;
  UIView *v8;

  v5 = (UIView *)a3;
  p_providedView = &self->_providedView;
  if (self->_providedView != v5)
  {
    v8 = v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = -[UIView allowsReparentingByLayoutHost](v8, "allowsReparentingByLayoutHost") ^ 1;
    else
      LOBYTE(v7) = 1;
    self->_portalsProvidedView = v7;
    if (-[UIView isDescendantOfView:](*p_providedView, "isDescendantOfView:", self))
      -[UIView removeFromSuperview](*p_providedView, "removeFromSuperview");
    -[_SAUIProvidedViewContainerView _removePortalView](self, "_removePortalView");
    objc_storeStrong((id *)&self->_providedView, a3);
    v5 = v8;
    if (v8)
    {
      if (self->_portalsProvidedView)
      {
        -[_SAUIProvidedViewContainerView _createPortalView](self, "_createPortalView");
      }
      else
      {
        -[_SAUIProvidedViewContainerView bounds](self, "bounds");
        -[UIView setFrame:](v8, "setFrame:");
        -[_SAUIProvidedViewContainerView addSubview:](self, "addSubview:", v8);
      }
      -[_SAUIProvidedViewContainerView setNeedsLayout](self, "setNeedsLayout");
      v5 = v8;
    }
  }

}

- (void)_recreatePortalViewIfNeeded
{
  if (self->_providedView)
  {
    if (self->_portalsProvidedView)
    {
      -[_SAUIProvidedViewContainerView _removePortalView](self, "_removePortalView");
      -[_SAUIProvidedViewContainerView _createPortalView](self, "_createPortalView");
      -[_SAUIProvidedViewContainerView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)_createPortalView
{
  _SAUIPortalView *v3;
  _SAUIPortalView *v4;
  _SAUIPortalView *portalView;

  v3 = [_SAUIPortalView alloc];
  -[_SAUIProvidedViewContainerView bounds](self, "bounds");
  v4 = -[_SAUIPortalView initWithFrame:](v3, "initWithFrame:");
  portalView = self->_portalView;
  self->_portalView = v4;

  -[_SAUIPortalView setSourceView:](self->_portalView, "setSourceView:", self->_providedView);
  -[_SAUIProvidedViewContainerView addSubview:](self, "addSubview:", self->_portalView);
}

- (void)_removePortalView
{
  _SAUIPortalView *portalView;

  -[_SAUIPortalView removeFromSuperview](self->_portalView, "removeFromSuperview");
  portalView = self->_portalView;
  self->_portalView = 0;

}

- (UIView)providedView
{
  return self->_providedView;
}

- (BOOL)portalsProvidedView
{
  return self->_portalsProvidedView;
}

- (SAUIElementView)elementView
{
  return (SAUIElementView *)objc_loadWeakRetained((id *)&self->_elementView);
}

- (void)setElementView:(id)a3
{
  objc_storeWeak((id *)&self->_elementView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_elementView);
  objc_storeStrong((id *)&self->_providedView, 0);
  objc_storeStrong((id *)&self->_portalView, 0);
}

@end
