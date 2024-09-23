@implementation WFWidgetConfigurationView

- (WFWidgetConfigurationView)initWithFrame:(CGRect)a3 preferredCardSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  WFWidgetConfigurationView *v6;
  WFWidgetConfigurationView *v7;
  CGSize v8;
  void *v9;
  void *v10;
  void *v11;
  WFWidgetConfigurationView *v12;
  objc_super v14;

  height = a4.height;
  width = a4.width;
  v14.receiver = self;
  v14.super_class = (Class)WFWidgetConfigurationView;
  v6 = -[WFWidgetConfigurationView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = v6;
  if (v6)
  {
    v6->_preferredConfigurationCardViewSize.width = width;
    v6->_preferredConfigurationCardViewSize.height = height;
    v8 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
    v6->_overridingCardViewFrame.origin = (CGPoint)*MEMORY[0x24BDBF070];
    v6->_overridingCardViewFrame.size = v8;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "colorWithAlphaComponent:", 0.01);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationView setBackgroundColor:](v7, "setBackgroundColor:", v10);

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", v7, sel_requestDismissal);
    objc_msgSend(v11, "setDelegate:", v7);
    -[WFWidgetConfigurationView addGestureRecognizer:](v7, "addGestureRecognizer:", v11);
    v12 = v7;

  }
  return v7;
}

- (WFWidgetConfigurationView)initWithFrame:(CGRect)a3
{
  double v3;

  v3 = fmax(a3.size.width + -40.0, 0.0);
  return -[WFWidgetConfigurationView initWithFrame:preferredCardSize:](self, "initWithFrame:preferredCardSize:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, v3, (v3 + v3) / 3.0);
}

- (void)setOverridingCardViewFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  id v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  self->_overridingCardViewFrame = a3;
  -[WFWidgetConfigurationView remoteViewController](self, "remoteViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConfigurationCardViewFrame:", x, y, width, height);

  -[WFWidgetConfigurationView containerView](self, "containerView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setConfigurationCardViewFrame:", x, y, width, height);

}

- (void)setRemoteViewController:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[WFWidgetConfigurationView remoteViewController](self, "remoteViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  objc_storeStrong((id *)&self->_remoteViewController, a3);
  if (v9)
  {
    objc_msgSend(v9, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationView bounds](self, "bounds");
    objc_msgSend(v7, "setFrame:");
    objc_msgSend(v7, "setAutoresizingMask:", 18);
    -[WFWidgetConfigurationView overridingCardViewFrame](self, "overridingCardViewFrame");
    objc_msgSend(v9, "setConfigurationCardViewFrame:");
    -[WFWidgetConfigurationView insertSubview:atIndex:](self, "insertSubview:atIndex:", v7, 0);

  }
  -[WFWidgetConfigurationView containerView](self, "containerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", v9 != 0);

}

- (void)setContainerView:(id)a3
{
  WFWidgetConfigurationContainerView *v4;
  void *v5;
  WFWidgetConfigurationContainerView *containerView;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  id v26;

  v4 = (WFWidgetConfigurationContainerView *)a3;
  -[WFWidgetConfigurationView containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  containerView = self->_containerView;
  self->_containerView = v4;

  -[WFWidgetConfigurationView containerView](self, "containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAutoresizingMask:", 18);

  -[WFWidgetConfigurationView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[WFWidgetConfigurationView containerView](self, "containerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  -[WFWidgetConfigurationView overridingCardViewFrame](self, "overridingCardViewFrame");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  -[WFWidgetConfigurationView containerView](self, "containerView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setConfigurationCardViewFrame:", v18, v20, v22, v24);

  -[WFWidgetConfigurationView containerView](self, "containerView");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  -[WFWidgetConfigurationView addSubview:](self, "addSubview:", v26);

}

- (void)requestDismissal
{
  id v2;

  -[WFWidgetConfigurationView containerView](self, "containerView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestDismissal");

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;

  v5 = a4;
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationView containerView](self, "containerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cardView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isDescendantOfView:", v9) ^ 1;

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (CGRect)overridingCardViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_overridingCardViewFrame.origin.x;
  y = self->_overridingCardViewFrame.origin.y;
  width = self->_overridingCardViewFrame.size.width;
  height = self->_overridingCardViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (WFWidgetConfigurationContainerView)containerView
{
  return self->_containerView;
}

- (WFWidgetConfigurationRemoteViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end
