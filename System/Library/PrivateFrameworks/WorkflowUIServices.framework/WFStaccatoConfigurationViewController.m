@implementation WFStaccatoConfigurationViewController

- (WFStaccatoConfigurationViewController)initWithConfigurationContext:(id)a3
{
  id v5;
  WFStaccatoConfigurationViewController *v6;
  WFStaccatoConfigurationViewController *v7;
  WFStaccatoConfigurationViewController *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFStaccatoConfigurationViewController;
  v6 = -[WFStaccatoConfigurationViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configurationContext, a3);
    v8 = v7;
  }

  return v7;
}

- (WFStaccatoConfigurationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[WFStaccatoConfigurationViewController initWithConfigurationContext:](self, "initWithConfigurationContext:", CFSTR("WFSystemActionConfigurationContextActionButtonSettings"), a4);
}

- (void)loadView
{
  WFSystemActionConfigurationViewController *v3;
  void *v4;
  WFSystemActionConfigurationViewController *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  objc_super v41;
  _QWORD v42[6];

  v42[4] = *MEMORY[0x24BDAC8D0];
  v41.receiver = self;
  v41.super_class = (Class)WFStaccatoConfigurationViewController;
  -[WFStaccatoConfigurationViewController loadView](&v41, sel_loadView);
  v3 = [WFSystemActionConfigurationViewController alloc];
  -[WFStaccatoConfigurationViewController configurationContext](self, "configurationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WFSystemActionConfigurationViewController initWithConfigurationContext:](v3, "initWithConfigurationContext:", v4);

  -[WFSystemActionConfigurationViewController setDelegate:](v5, "setDelegate:", self);
  -[WFStaccatoConfigurationViewController addChildViewController:](self, "addChildViewController:", v5);
  -[WFStaccatoConfigurationViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[WFSystemActionConfigurationViewController view](v5, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  -[WFSystemActionConfigurationViewController view](v5, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WFStaccatoConfigurationViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSystemActionConfigurationViewController view](v5, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", v18);

  v31 = (void *)MEMORY[0x24BDD1628];
  -[WFSystemActionConfigurationViewController view](v5, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStaccatoConfigurationViewController view](self, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v36;
  -[WFSystemActionConfigurationViewController view](v5, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStaccatoConfigurationViewController view](self, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v32);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v30;
  -[WFSystemActionConfigurationViewController view](v5, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStaccatoConfigurationViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v20;
  -[WFSystemActionConfigurationViewController view](v5, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFStaccatoConfigurationViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "activateConstraints:", v26);

  -[WFSystemActionConfigurationViewController didMoveToParentViewController:](v5, "didMoveToParentViewController:", self);
  -[WFStaccatoConfigurationViewController setInnerViewController:](self, "setInnerViewController:", v5);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFStaccatoConfigurationViewController;
  -[WFStaccatoConfigurationViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[WFStaccatoConfigurationViewController sheetPresentationController](self, "sheetPresentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitOverrides");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInterfaceStyle:", 2);

  -[WFStaccatoConfigurationViewController sheetPresentationController](self, "sheetPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPrefersGrabberVisible:", 1);

}

- (void)setSelectedAction:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v7;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  objc_storeStrong((id *)&self->_selectedAction, v4);
  v5 = v4;
  -[WFStaccatoConfigurationViewController innerViewController](self, "innerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelectedAction:", v5);

}

- (void)configurationController:(id)a3 didFinishWithAction:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  -[WFStaccatoConfigurationViewController delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configurationController:didFinishWithAction:error:", self, v8, v7);

}

- (WFStaccatoConfigurationViewControllerDelegate)delegate
{
  return (WFStaccatoConfigurationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFConfiguredStaccatoAction)selectedAction
{
  return self->_selectedAction;
}

- (NSString)configurationContext
{
  return self->_configurationContext;
}

- (void)setConfigurationContext:(id)a3
{
  objc_storeStrong((id *)&self->_configurationContext, a3);
}

- (WFSystemActionConfigurationViewController)innerViewController
{
  return self->_innerViewController;
}

- (void)setInnerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_innerViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerViewController, 0);
  objc_storeStrong((id *)&self->_configurationContext, 0);
  objc_storeStrong((id *)&self->_selectedAction, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
