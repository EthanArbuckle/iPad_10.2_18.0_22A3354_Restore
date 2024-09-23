@implementation _UISplitViewControllerPanelPrimaryViewControllerPromiseItem

- (_UISplitViewControllerPanelPrimaryViewControllerPromiseItem)initWithParentView:(id)a3 impl:(id)a4
{
  id v6;
  id v7;
  _UISplitViewControllerPanelPrimaryViewControllerPromiseItem *v8;
  _UISplitViewControllerPanelPrimaryViewControllerPromiseItem *v9;
  _UISplitViewControllerPanelPrimaryViewControllerPromiseItem *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CGFloat v24;
  double MaxX;
  objc_super v27;

  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)_UISplitViewControllerPanelPrimaryViewControllerPromiseItem;
  v8 = -[_UISplitViewControllerPanelPrimaryViewControllerPromiseItem init](&v27, sel_init);
  v9 = v8;
  if (!v8)
  {
LABEL_8:
    v10 = v9;
    goto LABEL_9;
  }
  v10 = 0;
  if (v6 && v7)
  {
    objc_storeWeak((id *)&v8->_parentView, v6);
    objc_storeWeak((id *)&v9->_impl, v7);
    objc_msgSend(v6, "bounds");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v19 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v20 = objc_msgSend(v7, "_layoutPrimaryOnRight");
    v21 = v12;
    v22 = v14;
    v23 = v16;
    v24 = v18;
    if (v20)
      MaxX = CGRectGetMaxX(*(CGRect *)&v21);
    else
      MaxX = CGRectGetMinX(*(CGRect *)&v21) + -100.0;
    v9->_frame.origin.x = MaxX;
    v9->_frame.origin.y = v19;
    v9->_frame.size.width = 100.0;
    v9->_frame.size.height = v18;
    goto LABEL_8;
  }
LABEL_9:

  return v10;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setNeedsFocusUpdate
{
  id v3;

  +[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", self);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestFocusUpdateToEnvironment:", self);

}

- (void)updateFocusIfNeeded
{
  id v2;

  +[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", self);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateFocusIfNeeded");

}

- (NSArray)preferredFocusEnvironments
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (id)focusItemsInRect:(CGRect)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[_UISplitViewControllerPanelPrimaryViewControllerPromiseItem impl](self, "impl", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_triggerDisplayModeAction:", v3);
  objc_msgSend(v3, "panelController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsUpdate");

  objc_msgSend(v3, "panelController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIfNeeded");

  objc_msgSend(v3, "splitViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "masterViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v12[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

- (UICoordinateSpace)coordinateSpace
{
  void *v2;
  void *v3;

  -[_UISplitViewControllerPanelPrimaryViewControllerPromiseItem parentView](self, "parentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coordinateSpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UICoordinateSpace *)v3;
}

- (BOOL)_isLazyFocusItemContainer
{
  return 1;
}

- (UIView)parentView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_parentView);
}

- (void)setParentView:(id)a3
{
  objc_storeWeak((id *)&self->_parentView, a3);
}

- (UISplitViewControllerPanelImpl)impl
{
  return (UISplitViewControllerPanelImpl *)objc_loadWeakRetained((id *)&self->_impl);
}

- (void)setImpl:(id)a3
{
  objc_storeWeak((id *)&self->_impl, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_impl);
  objc_destroyWeak((id *)&self->_parentView);
}

@end
