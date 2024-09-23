@implementation SUBarButtonItem

- (void)dealloc
{
  objc_super v3;

  -[SUBarButtonItem _removeTouchCaptureView](self, "_removeTouchCaptureView");

  v3.receiver = self;
  v3.super_class = (Class)SUBarButtonItem;
  -[SUBarButtonItem dealloc](&v3, sel_dealloc);
}

- (void)hideConfirmationWithAppearance:(id)a3 animated:(BOOL)a4
{
  NSString *preConfirmationTitle;

  preConfirmationTitle = self->_preConfirmationTitle;
  if (preConfirmationTitle)
  {
    -[SUBarButtonItem _setTitle:isConfirmation:appearance:animated:](self, "_setTitle:isConfirmation:appearance:animated:", preConfirmationTitle, 0, a3, a4);

    self->_confirmationAppearance = 0;
    self->_preConfirmationTitle = 0;
  }
}

- (BOOL)isLoading
{
  -[SUBarButtonItem accessoryView](self, "accessoryView");
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)isShowingConfirmation
{
  return self->_preConfirmationTitle != 0;
}

- (void)setAccessoryView:(id)a3
{
  UIView *accessoryView;

  accessoryView = self->_accessoryView;
  if (accessoryView != a3)
  {

    self->_accessoryView = (UIView *)a3;
  }
  objc_msgSend(-[SUBarButtonItem _navigationButton](self, "_navigationButton"), "setAccessoryView:", a3);
  -[SUBarButtonItem _updateViewForAccessoryChange](self, "_updateViewForAccessoryChange");
}

- (void)setAccessoryViewInsets:(UIEdgeInsets)a3
{
  self->_accessoryViewInsets = a3;
  objc_msgSend(-[SUBarButtonItem _navigationButton](self, "_navigationButton"), "setAccessoryViewInsets:", a3.top, a3.left, a3.bottom, a3.right);
  -[SUBarButtonItem _updateViewForAccessoryChange](self, "_updateViewForAccessoryChange");
}

- (void)setLoading:(BOOL)a3
{
  id v4;

  if (a3)
  {
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 1);
    objc_msgSend(v4, "sizeToFit");
    objc_msgSend(v4, "startAnimating");
    -[SUBarButtonItem setAccessoryView:](self, "setAccessoryView:", v4);
    -[SUBarButtonItem setAccessoryViewInsets:](self, "setAccessoryViewInsets:", 0.0, 0.0, 0.0, 10.0);

  }
  else
  {
    -[SUBarButtonItem setAccessoryView:](self, "setAccessoryView:", 0);
  }
}

- (void)showConfirmationWithTitle:(id)a3 appearance:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;

  if (!self->_preConfirmationTitle)
  {
    v5 = a5;

    self->_confirmationAppearance = (SUUIAppearance *)objc_msgSend(a4, "copy");
    self->_preConfirmationTitle = (NSString *)(id)-[SUBarButtonItem title](self, "title");
    -[SUBarButtonItem _setTitle:isConfirmation:appearance:animated:](self, "_setTitle:isConfirmation:appearance:animated:", a3, 1, a4, v5);
  }
}

+ (Class)classForNavigationButton
{
  return (Class)objc_opt_class();
}

- (void)configureFromScriptButton:(id)a3
{
  objc_super v5;

  -[SUBarButtonItem setLoading:](self, "setLoading:", objc_msgSend(a3, "loading"));
  v5.receiver = self;
  v5.super_class = (Class)SUBarButtonItem;
  -[UIBarButtonItem configureFromScriptButton:](&v5, sel_configureFromScriptButton_, a3);
}

- (id)createViewForNavigationItem:(id)a3
{
  id v5;
  objc_super v7;

  self->_lastNavigationItem = (UINavigationItem *)a3;
  v7.receiver = self;
  v7.super_class = (Class)SUBarButtonItem;
  v5 = -[SUBarButtonItem createViewForNavigationItem:](&v7, sel_createViewForNavigationItem_, a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "setAccessoryView:", self->_accessoryView);
    objc_msgSend(v5, "setAccessoryViewInsets:", self->_accessoryViewInsets.top, self->_accessoryViewInsets.left, self->_accessoryViewInsets.bottom, self->_accessoryViewInsets.right);
    objc_msgSend(v5, "sizeToFit");
  }
  return v5;
}

- (void)_touchCaptureAction:(id)a3
{
  if (-[SUBarButtonItem isShowingConfirmation](self, "isShowingConfirmation", a3))
    -[SUBarButtonItem hideConfirmationWithAppearance:animated:](self, "hideConfirmationWithAppearance:animated:", self->_confirmationAppearance, 1);
  else
    -[SUBarButtonItem _removeTouchCaptureView](self, "_removeTouchCaptureView");
}

- (void)_addTouchCaptureViewForNavigationButton:(id)a3
{
  SUTouchCaptureView *v5;

  if (!self->_touchCaptureView)
  {
    v5 = (SUTouchCaptureView *)(id)objc_msgSend((id)objc_msgSend(a3, "window"), "addTouchCaptureViewWithTag:", 1651078243);
    self->_touchCaptureView = v5;
    -[SUTouchCaptureView addTarget:action:forControlEvents:](v5, "addTarget:action:forControlEvents:", self, sel__touchCaptureAction_, 64);
    -[SUTouchCaptureView setPassThroughViews:](self->_touchCaptureView, "setPassThroughViews:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", a3, 0));
  }
}

- (id)_navigationButton
{
  SUBarButtonItem *v3;
  UINavigationItem *lastNavigationItem;
  void *v5;
  uint64_t v6;

  v3 = -[UINavigationItem leftBarButtonItem](self->_lastNavigationItem, "leftBarButtonItem");
  lastNavigationItem = self->_lastNavigationItem;
  if (v3 == self)
  {
    v6 = -[UINavigationItem customLeftView](lastNavigationItem, "customLeftView");
  }
  else
  {
    if ((SUBarButtonItem *)-[UINavigationItem rightBarButtonItem](lastNavigationItem, "rightBarButtonItem") != self)
    {
      v5 = 0;
      goto LABEL_7;
    }
    v6 = -[UINavigationItem customRightView](self->_lastNavigationItem, "customRightView");
  }
  v5 = (void *)v6;
LABEL_7:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v5;
  else
    return 0;
}

- (void)_removeTouchCaptureView
{
  SUTouchCaptureView *touchCaptureView;

  touchCaptureView = self->_touchCaptureView;
  if (touchCaptureView)
  {
    objc_msgSend((id)-[SUTouchCaptureView window](touchCaptureView, "window"), "removeTouchCaptureViewWithTag:", -[SUTouchCaptureView tag](self->_touchCaptureView, "tag"));
    -[SUTouchCaptureView removeTarget:action:forControlEvents:](self->_touchCaptureView, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

    self->_touchCaptureView = 0;
  }
}

- (void)_setTitle:(id)a3 isConfirmation:(BOOL)a4 appearance:(id)a5 animated:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v8;
  id v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  _QWORD v32[7];
  BOOL v33;
  _QWORD v34[10];

  v6 = a6;
  v8 = a4;
  v11 = -[SUBarButtonItem _navigationButton](self, "_navigationButton");
  v12 = objc_msgSend(v11, "superviewOfClass:", objc_opt_class());
  if (v12)
  {
    v13 = (void *)v12;
    objc_msgSend(v11, "frame");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v22 = -[SUBarButtonItem title](self, "title");
    -[SUBarButtonItem setTitle:](self, "setTitle:", a3);
    objc_msgSend(v13, "layoutIfNeeded");
    objc_msgSend(v11, "frame");
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
    -[SUBarButtonItem setTitle:](self, "setTitle:", v22);
    objc_msgSend(v13, "layoutIfNeeded");
    if (a5)
    {
      if (v8)
        objc_msgSend(a5, "styleConfirmationButtonItem:", self);
      else
        objc_msgSend(a5, "styleBarButtonItem:", self);
    }
    -[SUBarButtonItem setTitle:](self, "setTitle:", &stru_24DE83F60);
    objc_msgSend(v11, "setFrame:", v15, v17, v19, v21);
    v31 = 0.35;
    if (!v6)
      v31 = 0.0;
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __64__SUBarButtonItem__setTitle_isConfirmation_appearance_animated___block_invoke;
    v34[3] = &unk_24DE7D318;
    v34[6] = v24;
    v34[7] = v26;
    v34[8] = v28;
    v34[9] = v30;
    v34[4] = v11;
    v34[5] = v13;
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __64__SUBarButtonItem__setTitle_isConfirmation_appearance_animated___block_invoke_2;
    v32[3] = &unk_24DE7D340;
    v33 = v8;
    v32[4] = self;
    v32[5] = v11;
    v32[6] = a3;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v34, v32, v31);
  }
}

uint64_t __64__SUBarButtonItem__setTitle_isConfirmation_appearance_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  return objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
}

uint64_t __64__SUBarButtonItem__setTitle_isConfirmation_appearance_animated___block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;

  v2 = *(unsigned __int8 *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v3, "_addTouchCaptureViewForNavigationButton:", *(_QWORD *)(a1 + 40));
  else
    objc_msgSend(v3, "_removeTouchCaptureView");
  return objc_msgSend(*(id *)(a1 + 32), "setTitle:", *(_QWORD *)(a1 + 48));
}

- (void)_updateViewForAccessoryChange
{
  objc_msgSend(-[SUBarButtonItem _navigationButton](self, "_navigationButton"), "sizeToFit");
  objc_msgSend((id)-[UINavigationItem navigationBar](self->_lastNavigationItem, "navigationBar"), "setNeedsLayout");
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (UIEdgeInsets)accessoryViewInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_accessoryViewInsets.top;
  left = self->_accessoryViewInsets.left;
  bottom = self->_accessoryViewInsets.bottom;
  right = self->_accessoryViewInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

@end
