@implementation TUIButtonBarItemView

- (UIView)contentView
{
  void *customView;

  customView = self->_customView;
  if (!customView)
    customView = self->_barButtonView;
  return (UIView *)customView;
}

- (void)setCustomView:(id)a3
{
  UIView **p_customView;
  TUIButtonBarItemView *v6;
  id v7;

  v7 = a3;
  p_customView = &self->_customView;
  -[UIView superview](self->_customView, "superview");
  v6 = (TUIButtonBarItemView *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
    -[UIView removeFromSuperview](*p_customView, "removeFromSuperview");
  objc_storeStrong((id *)&self->_customView, a3);
  if (*p_customView)
  {
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](*p_customView, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
    -[TUIButtonBarItemView addSubview:](self, "addSubview:", *p_customView);
    -[_UIButtonBarButton setHidden:](self->_barButtonView, "setHidden:", 1);
  }

}

- (void)setBarButtonView:(id)a3
{
  id v5;

  v5 = a3;
  -[_UIButtonBarButton removeFromSuperview](self->_barButtonView, "removeFromSuperview");
  objc_storeStrong((id *)&self->_barButtonView, a3);
  if (self->_barButtonView)
  {
    -[TUIButtonBarItemView addSubview:](self, "addSubview:");
    -[UIView setHidden:](self->_customView, "setHidden:", 1);
    -[_UIButtonBarButton setHidden:](self->_barButtonView, "setHidden:", 0);
  }

}

- (BOOL)_isPad
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return objc_msgSend(MEMORY[0x1E0DC3958], "isFloating") ^ 1;
  else
    return 0;
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
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)TUIButtonBarItemView;
  -[TUIButtonBarItemView layoutSubviews](&v16, sel_layoutSubviews);
  -[TUIButtonBarItemView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (!-[TUIButtonBarItemView _isPad](self, "_isPad"))
  {
    UIRectInsetEdges();
    v4 = v11;
    v6 = v12;
    v8 = v13;
    v10 = v14;
  }
  -[TUIButtonBarItemView contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v4, v6, v8, v10);

}

- (BOOL)isCollapsedItem
{
  return self->_collapsedItem;
}

- (void)setCollapsedItem:(BOOL)a3
{
  self->_collapsedItem = a3;
}

- (UIBarButtonItem)associatedItem
{
  return self->_associatedItem;
}

- (void)setAssociatedItem:(id)a3
{
  objc_storeStrong((id *)&self->_associatedItem, a3);
}

- (UIBarButtonItemGroup)associatedGroup
{
  return self->_associatedGroup;
}

- (void)setAssociatedGroup:(id)a3
{
  objc_storeStrong((id *)&self->_associatedGroup, a3);
}

- (_UIButtonBarButton)barButtonView
{
  return self->_barButtonView;
}

- (UIView)customView
{
  return self->_customView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customView, 0);
  objc_storeStrong((id *)&self->_barButtonView, 0);
  objc_storeStrong((id *)&self->_associatedGroup, 0);
  objc_storeStrong((id *)&self->_associatedItem, 0);
}

@end
