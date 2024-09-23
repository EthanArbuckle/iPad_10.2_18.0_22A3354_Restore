@implementation WFWidgetConfigurationContainerViewController

- (WFWidgetConfigurationContainerViewController)initWithRequest:(id)a3 contentViewController:(id)a4
{
  id v7;
  id v8;
  WFWidgetConfigurationContainerViewController *v9;
  WFWidgetConfigurationContainerViewController *v10;
  WFWidgetConfigurationContainerViewController *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFWidgetConfigurationContainerViewController;
  v9 = -[WFWidgetConfigurationContainerViewController initWithRootViewController:](&v13, sel_initWithRootViewController_, v8);
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

  -[WFWidgetConfigurationContainerViewController view](self, "view");
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
  -[WFWidgetConfigurationContainerViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (void)loadView
{
  MTStylingProvidingSolidColorView *v3;
  MTStylingProvidingSolidColorView *backgroundView;
  void *v5;
  MTVisualStylingProvider *v6;
  MTVisualStylingProvider *strokeProvider;
  void *v8;
  MTVisualStylingProvider *v9;
  MTVisualStylingProvider *fillProvider;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)WFWidgetConfigurationContainerViewController;
  -[WFWidgetConfigurationContainerViewController loadView](&v30, sel_loadView);
  v3 = (MTStylingProvidingSolidColorView *)objc_alloc_init(MEMORY[0x24BE64068]);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v3;

  -[WFWidgetConfigurationContainerViewController backgroundView](self, "backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visualStylingProviderForCategory:", 1);
  v6 = (MTVisualStylingProvider *)objc_claimAutoreleasedReturnValue();
  strokeProvider = self->_strokeProvider;
  self->_strokeProvider = v6;

  -[WFWidgetConfigurationContainerViewController backgroundView](self, "backgroundView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "visualStylingProviderForCategory:", 2);
  v9 = (MTVisualStylingProvider *)objc_claimAutoreleasedReturnValue();
  fillProvider = self->_fillProvider;
  self->_fillProvider = v9;

  -[WFWidgetConfigurationContainerViewController request](self, "request");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "widgetPrimaryColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "wf_defaultWidgetConfigurationCardBackgroundColor");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  -[WFWidgetConfigurationContainerViewController backgroundView](self, "backgroundView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v15);

  -[WFWidgetConfigurationContainerViewController backgroundView](self, "backgroundView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAutoresizingMask:", 18);

  -[WFWidgetConfigurationContainerViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  -[WFWidgetConfigurationContainerViewController backgroundView](self, "backgroundView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFrame:", v20, v22, v24, v26);

  -[WFWidgetConfigurationContainerViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWidgetConfigurationContainerViewController backgroundView](self, "backgroundView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "insertSubview:atIndex:", v29, 0);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFWidgetConfigurationContainerViewController;
  -[WFWidgetConfigurationContainerViewController viewDidLoad](&v7, sel_viewDidLoad);
  v3 = (void *)objc_opt_new();
  -[WFWidgetConfigurationContainerViewController navigationBar](self, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStandardAppearance:", v3);

  v5 = (void *)objc_opt_new();
  -[WFWidgetConfigurationContainerViewController navigationBar](self, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCompactAppearance:", v5);

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

- (MTVisualStylingProvider)strokeProvider
{
  return self->_strokeProvider;
}

- (MTVisualStylingProvider)fillProvider
{
  return self->_fillProvider;
}

- (MTStylingProvidingSolidColorView)backgroundView
{
  return self->_backgroundView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_fillProvider, 0);
  objc_storeStrong((id *)&self->_strokeProvider, 0);
  objc_destroyWeak((id *)&self->_containerDelegate);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end
