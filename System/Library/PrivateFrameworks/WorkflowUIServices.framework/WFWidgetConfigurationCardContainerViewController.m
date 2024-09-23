@implementation WFWidgetConfigurationCardContainerViewController

- (WFWidgetConfigurationCardContainerViewController)initWithRequest:(id)a3 contentViewController:(id)a4
{
  id v7;
  id v8;
  WFWidgetConfigurationCardContainerViewController *v9;
  WFWidgetConfigurationCardContainerViewController *v10;
  WFWidgetConfigurationCardContainerViewController *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFWidgetConfigurationCardContainerViewController;
  v9 = -[WFWidgetConfigurationCardContainerViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_contentViewController, a4);
    v11 = v10;
  }

  return v10;
}

- (UIColor)containerBackgroundColor
{
  void *v2;
  void *v3;

  -[WFWidgetConfigurationCardContainerViewController cardView](self, "cardView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setContainerBackgroundColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFWidgetConfigurationCardContainerViewController cardView](self, "cardView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (CGRect)configurationCardViewFrame
{
  void *v2;
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
  CGRect result;

  -[WFWidgetConfigurationCardContainerViewController containerView](self, "containerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationCardViewFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setConfigurationCardViewFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[WFWidgetConfigurationCardContainerViewController containerView](self, "containerView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConfigurationCardViewFrame:", x, y, width, height);

}

- (MTVisualStylingProvider)strokeProvider
{
  void *v2;
  void *v3;

  -[WFWidgetConfigurationCardContainerViewController cardView](self, "cardView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "strokeProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MTVisualStylingProvider *)v3;
}

- (MTVisualStylingProvider)fillProvider
{
  void *v2;
  void *v3;

  -[WFWidgetConfigurationCardContainerViewController cardView](self, "cardView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fillProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MTVisualStylingProvider *)v3;
}

- (void)loadView
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  WFWidgetConfigurationView *v12;
  WFWidgetConfigurationView *v13;
  void *v14;
  void *v15;
  void *v16;
  WFWidgetConfigurationCardView *v17;
  void *v18;
  WFWidgetConfigurationCardView *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  WFWidgetConfigurationContainerView *v30;
  void *v31;
  WFWidgetConfigurationContainerView *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  CGRect v71;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  -[WFWidgetConfigurationCardContainerViewController request](self, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[WFWidgetConfigurationCardContainerViewController request](self, "request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "defaultCardSize");
    v9 = v8;
    v11 = v10;

  }
  else
  {
    v9 = v5 + -56.0;
    v11 = ceil(v9 * 0.7);
  }

  v12 = [WFWidgetConfigurationView alloc];
  v13 = -[WFWidgetConfigurationView initWithFrame:preferredCardSize:](v12, "initWithFrame:preferredCardSize:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24), v9, v11);
  -[WFWidgetConfigurationCardContainerViewController setView:](self, "setView:", v13);

  -[WFWidgetConfigurationCardContainerViewController configurationView](self, "configurationView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAutoresizingMask:", 18);

  -[WFWidgetConfigurationCardContainerViewController contentViewController](self, "contentViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWidgetConfigurationCardContainerViewController addChildViewController:](self, "addChildViewController:", v15);

  -[WFWidgetConfigurationCardContainerViewController contentViewController](self, "contentViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "view");
  v70 = (id)objc_claimAutoreleasedReturnValue();

  v17 = [WFWidgetConfigurationCardView alloc];
  -[WFWidgetConfigurationCardContainerViewController request](self, "request");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[WFWidgetConfigurationCardView initWithRequest:contentView:](v17, "initWithRequest:contentView:", v18, v70);
  -[WFWidgetConfigurationCardContainerViewController setCardView:](self, "setCardView:", v19);

  -[WFWidgetConfigurationCardContainerViewController cardView](self, "cardView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDelegate:", self);

  -[WFWidgetConfigurationCardContainerViewController request](self, "request");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "widgetPrimaryColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    v24 = v22;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "wf_defaultWidgetConfigurationCardBackgroundColor");
    v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  v25 = v24;

  -[WFWidgetConfigurationCardContainerViewController cardView](self, "cardView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setBackgroundColor:", v25);

  -[WFWidgetConfigurationCardContainerViewController request](self, "request");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "widgetTintColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWidgetConfigurationCardContainerViewController cardView](self, "cardView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTintColor:", v28);

  v30 = [WFWidgetConfigurationContainerView alloc];
  -[WFWidgetConfigurationCardContainerViewController cardView](self, "cardView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[WFWidgetConfigurationContainerView initWithCardView:preferredSize:](v30, "initWithCardView:preferredSize:", v31, v9, v11);
  -[WFWidgetConfigurationCardContainerViewController setContainerView:](self, "setContainerView:", v32);

  -[WFWidgetConfigurationCardContainerViewController request](self, "request");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "resolvedWidgetConfigurationStyle");
  -[WFWidgetConfigurationCardContainerViewController containerView](self, "containerView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setWidgetConfigurationStyle:", v34);

  -[WFWidgetConfigurationCardContainerViewController request](self, "request");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[WFWidgetConfigurationCardContainerViewController request](self, "request");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "initialCardFrame");
    v39 = v38;
    v41 = v40;
    v43 = v42;
    v45 = v44;
    -[WFWidgetConfigurationCardContainerViewController configurationView](self, "configurationView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setOverridingCardViewFrame:", v39, v41, v43, v45);

    -[WFWidgetConfigurationCardContainerViewController request](self, "request");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "initialCardFrame");
    LODWORD(v46) = CGRectIsNull(v71);

    -[WFWidgetConfigurationCardContainerViewController request](self, "request");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v48;
    if ((_DWORD)v46)
    {
      objc_msgSend(v48, "defaultCardSize");
    }
    else
    {
      objc_msgSend(v48, "initialCardFrame");
      v50 = v52;
      v51 = v53;
    }
    -[WFWidgetConfigurationCardContainerViewController setPreferredContentSize:](self, "setPreferredContentSize:", v50, v51);

  }
  else
  {
    -[WFWidgetConfigurationCardContainerViewController setPreferredContentSize:](self, "setPreferredContentSize:", v9, v11);
  }
  -[WFWidgetConfigurationCardContainerViewController containerView](self, "containerView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setAutoresizingMask:", 18);

  -[WFWidgetConfigurationCardContainerViewController containerView](self, "containerView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setDelegate:", self);

  -[WFWidgetConfigurationCardContainerViewController view](self, "view");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "bounds");
  v58 = v57;
  v60 = v59;
  v62 = v61;
  v64 = v63;
  -[WFWidgetConfigurationCardContainerViewController containerView](self, "containerView");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setFrame:", v58, v60, v62, v64);

  -[WFWidgetConfigurationCardContainerViewController contentViewController](self, "contentViewController");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWidgetConfigurationCardContainerViewController addChildViewController:](self, "addChildViewController:", v66);

  -[WFWidgetConfigurationCardContainerViewController containerView](self, "containerView");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWidgetConfigurationCardContainerViewController configurationView](self, "configurationView");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setContainerView:", v67);

  -[WFWidgetConfigurationCardContainerViewController contentViewController](self, "contentViewController");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "didMoveToParentViewController:", self);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFWidgetConfigurationCardContainerViewController;
  -[WFWidgetConfigurationCardContainerViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[WFWidgetConfigurationCardContainerViewController request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widgetTintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWidgetConfigurationCardContainerViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v4);

  -[WFWidgetConfigurationCardContainerViewController updateUserInterfaceStyle](self, "updateUserInterfaceStyle");
}

- (void)updateUserInterfaceStyle
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;

  -[WFWidgetConfigurationCardContainerViewController cardView](self, "cardView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWidgetConfigurationCardContainerViewController containerView](self, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resolvedColorWithTraitCollection:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_retainAutorelease(v8);
  if (WFCGColorPerceivedLightness((CGColor *)objc_msgSend(v26, "CGColor")) > 0.7)
    v9 = 1;
  else
    v9 = 2;
  -[WFWidgetConfigurationCardContainerViewController containerView](self, "containerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceStyle");
  v25 = v9;
  if (v12)
  {
    -[WFWidgetConfigurationCardContainerViewController containerView](self, "containerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "traitCollection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "userInterfaceStyle") != v9)
    {

      goto LABEL_14;
    }
    v24 = v13;
  }
  -[WFWidgetConfigurationCardContainerViewController cardView](self, "cardView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "userInterfaceStyle"))
  {
    -[WFWidgetConfigurationCardContainerViewController cardView](self, "cardView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "traitCollection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "userInterfaceStyle") != v9;

  }
  else
  {
    v18 = 0;
  }

  if (v12)
  {

  }
  if (!v18)
  {
    -[WFWidgetConfigurationCardContainerViewController cardView](self, "cardView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setOverrideUserInterfaceStyle:", 0);

    -[WFWidgetConfigurationCardContainerViewController contentViewController](self, "contentViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = 0;
    goto LABEL_16;
  }
LABEL_14:
  -[WFWidgetConfigurationCardContainerViewController cardView](self, "cardView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setOverrideUserInterfaceStyle:", v25);

  -[WFWidgetConfigurationCardContainerViewController contentViewController](self, "contentViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  v22 = v25;
LABEL_16:
  objc_msgSend(v20, "setOverrideUserInterfaceStyle:", v22);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFWidgetConfigurationCardContainerViewController;
  v4 = a3;
  -[WFWidgetConfigurationCardContainerViewController traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[WFWidgetConfigurationCardContainerViewController traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[WFWidgetConfigurationCardContainerViewController updateUserInterfaceStyle](self, "updateUserInterfaceStyle");
}

- (void)widgetConfigurationCardViewDidRequestToClose:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[WFWidgetConfigurationCardContainerViewController containerDelegate](self, "containerDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WFWidgetConfigurationCardContainerViewController containerDelegate](self, "containerDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "widgetConfigurationContainerViewControllerDidRequestToClose:", self);

  }
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (WFWidgetConfigurationRequest)request
{
  return self->_request;
}

- (WFWidgetConfigurationContainerViewControllerProtocolDelegate)containerDelegate
{
  return (WFWidgetConfigurationContainerViewControllerProtocolDelegate *)objc_loadWeakRetained((id *)&self->_containerDelegate);
}

- (void)setContainerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_containerDelegate, a3);
}

- (unint64_t)widgetConfigurationStyle
{
  return self->_widgetConfigurationStyle;
}

- (void)setWidgetConfigurationStyle:(unint64_t)a3
{
  self->_widgetConfigurationStyle = a3;
}

- (WFWidgetConfigurationCardView)cardView
{
  return (WFWidgetConfigurationCardView *)objc_getProperty(self, a2, 1000, 1);
}

- (void)setCardView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1000);
}

- (WFWidgetConfigurationContainerView)containerView
{
  return (WFWidgetConfigurationContainerView *)objc_getProperty(self, a2, 1008, 1);
}

- (void)setContainerView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1008);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_cardView, 0);
  objc_destroyWeak((id *)&self->_containerDelegate);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end
