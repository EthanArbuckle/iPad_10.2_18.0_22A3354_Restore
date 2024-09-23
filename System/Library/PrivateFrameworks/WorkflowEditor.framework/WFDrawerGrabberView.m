@implementation WFDrawerGrabberView

- (WFDrawerGrabberView)init
{
  WFDrawerGrabberView *v2;
  _UIGrabber *v3;
  _UIGrabber *grabber;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  WFDrawerGrabberView *v14;
  void *v16;
  void *v17;
  objc_super v18;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)WFDrawerGrabberView;
  v2 = -[WFDrawerGrabberView init](&v18, sel_init);
  if (v2)
  {
    v3 = (_UIGrabber *)objc_alloc_init(MEMORY[0x24BEBDC38]);
    grabber = v2->_grabber;
    v2->_grabber = v3;

    -[_UIGrabber setTranslatesAutoresizingMaskIntoConstraints:](v2->_grabber, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WFDrawerGrabberView addSubview:](v2, "addSubview:", v2->_grabber);
    v16 = (void *)MEMORY[0x24BDD1628];
    -[_UIGrabber topAnchor](v2->_grabber, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDrawerGrabberView topAnchor](v2, "topAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:constant:", v5, 6.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v6;
    -[_UIGrabber bottomAnchor](v2->_grabber, "bottomAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDrawerGrabberView bottomAnchor](v2, "bottomAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, -6.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v9;
    -[_UIGrabber centerXAnchor](v2->_grabber, "centerXAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDrawerGrabberView centerXAnchor](v2, "centerXAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activateConstraints:", v13);

    v14 = v2;
  }

  return v2;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return WFLocalizedString(CFSTR("Actions Controller"));
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;

  -[WFDrawerGrabberView drawerController](self, "drawerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3
    && (-[WFDrawerGrabberView drawerController](self, "drawerController"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "visibility"),
        v4,
        v5 <= 3))
  {
    WFLocalizedString(*(&off_24EE25CB8 + v5));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;

  -[WFDrawerGrabberView drawerController](self, "drawerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFDrawerGrabberView drawerController](self, "drawerController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "visibility");

    if (v5 == 3)
      v6 = CFSTR("Double-tap to collapse the actions drawer to half screen");
    else
      v6 = CFSTR("Double-tap to fully expand the actions drawer");
    WFLocalizedString(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (CGRect)accessibilityFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGRect result;

  v10.receiver = self;
  v10.super_class = (Class)WFDrawerGrabberView;
  -[WFDrawerGrabberView accessibilityFrame](&v10, sel_accessibilityFrame);
  v3 = v2 + -10.0;
  v5 = v4 + -25.0;
  v7 = v6 + 20.0;
  v9 = v8 + 50.0;
  result.size.height = v9;
  result.size.width = v7;
  result.origin.y = v5;
  result.origin.x = v3;
  return result;
}

- (BOOL)accessibilityActivate
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[WFDrawerGrabberView drawerController](self, "drawerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFDrawerGrabberView drawerController](self, "drawerController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "visibility");

    if (v5 == 3)
      -[WFDrawerGrabberView accessibilityCollapseDrawer](self, "accessibilityCollapseDrawer");
    else
      -[WFDrawerGrabberView accessibilityExpandDrawer](self, "accessibilityExpandDrawer");
  }
  return v3 != 0;
}

- (BOOL)accessibilityCollapseDrawer
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[WFDrawerGrabberView drawerController](self, "drawerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFDrawerGrabberView drawerController](self, "drawerController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "visibility");

    -[WFDrawerGrabberView drawerController](self, "drawerController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5 == 3)
      v8 = 2;
    else
      v8 = 1;
    objc_msgSend(v6, "transitionToVisibility:withDimming:animated:", v8, 3, 1);

  }
  return v3 != 0;
}

- (BOOL)accessibilityExpandDrawer
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[WFDrawerGrabberView drawerController](self, "drawerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFDrawerGrabberView drawerController](self, "drawerController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "visibility");

    -[WFDrawerGrabberView drawerController](self, "drawerController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5 == 1)
      v8 = 2;
    else
      v8 = 3;
    objc_msgSend(v6, "transitionToVisibility:withDimming:animated:", v8, 3, 1);

  }
  return v3 != 0;
}

- (id)accessibilityCustomActions
{
  NSArray *accessibilityCustomActions;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSArray *v10;
  NSArray *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  accessibilityCustomActions = self->_accessibilityCustomActions;
  if (!accessibilityCustomActions)
  {
    v4 = objc_alloc(MEMORY[0x24BEBD378]);
    WFLocalizedStringWithKey(CFSTR("Collapse (Actions Drawer)"), CFSTR("Collapse"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithName:target:selector:", v5, self, sel_accessibilityCollapseDrawer);

    v7 = objc_alloc(MEMORY[0x24BEBD378]);
    WFLocalizedStringWithKey(CFSTR("Expand (Actions Drawer)"), CFSTR("Expand"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithName:target:selector:", v8, self, sel_accessibilityExpandDrawer);

    v13[0] = v6;
    v13[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v11 = self->_accessibilityCustomActions;
    self->_accessibilityCustomActions = v10;

    accessibilityCustomActions = self->_accessibilityCustomActions;
  }
  return accessibilityCustomActions;
}

- (WFDrawerController)drawerController
{
  return (WFDrawerController *)objc_loadWeakRetained((id *)&self->_drawerController);
}

- (void)setDrawerController:(id)a3
{
  objc_storeWeak((id *)&self->_drawerController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_drawerController);
  objc_storeStrong((id *)&self->_grabber, 0);
  objc_storeStrong((id *)&self->_accessibilityCustomActions, 0);
}

@end
