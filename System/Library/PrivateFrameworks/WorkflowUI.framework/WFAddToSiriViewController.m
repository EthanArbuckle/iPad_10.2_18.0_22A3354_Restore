@implementation WFAddToSiriViewController

- (WFAddToSiriViewController)initWithWorkflow:(id)a3 database:(id)a4
{
  id v7;
  id v8;
  WFAddToSiriViewController *v9;
  WFAddToSiriViewController *v10;
  WFAddToSiriViewController *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFAddToSiriViewController;
  v9 = -[WFAddToSiriViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_database, a4);
    objc_storeStrong((id *)&v10->_workflow, a3);
    v11 = v10;
  }

  return v10;
}

- (void)viewDidLoad
{
  _TtC10WorkflowUI35AddToSiriSwiftHostingViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
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
  objc_super v33;
  _QWORD v34[6];

  v34[4] = *MEMORY[0x24BDAC8D0];
  v33.receiver = self;
  v33.super_class = (Class)WFAddToSiriViewController;
  -[WFAddToSiriViewController viewDidLoad](&v33, sel_viewDidLoad);
  v3 = objc_alloc_init(_TtC10WorkflowUI35AddToSiriSwiftHostingViewController);
  -[AddToSiriSwiftHostingViewController setDelegate:](v3, "setDelegate:", self);
  -[WFAddToSiriViewController workflow](self, "workflow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AddToSiriSwiftHostingViewController setWorkflow:](v3, "setWorkflow:", v4);

  -[WFAddToSiriViewController database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AddToSiriSwiftHostingViewController setDatabase:](v3, "setDatabase:", v5);

  -[WFAddToSiriViewController addChildViewController:](self, "addChildViewController:", v3);
  -[WFAddToSiriViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AddToSiriSwiftHostingViewController view](v3, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAddToSiriViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTintColor:", v8);

  -[AddToSiriSwiftHostingViewController didMoveToParentViewController:](v3, "didMoveToParentViewController:", self);
  -[AddToSiriSwiftHostingViewController view](v3, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WFAddToSiriViewController setHostedAddToSiriController:](self, "setHostedAddToSiriController:", v3);
  v23 = (void *)MEMORY[0x24BDD1628];
  -[WFAddToSiriViewController view](self, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[AddToSiriSwiftHostingViewController view](v3, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v28;
  -[WFAddToSiriViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[AddToSiriSwiftHostingViewController view](v3, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v22;
  -[WFAddToSiriViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AddToSiriSwiftHostingViewController view](v3, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v13;
  -[WFAddToSiriViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AddToSiriSwiftHostingViewController view](v3, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "activateConstraints:", v19);

}

- (void)addToSiriDidCancelWithViewController:(id)a3
{
  id v4;

  -[WFAddToSiriViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addToSiriViewControllerDidCancel:", self);

}

- (void)addToSiriWithViewController:(id)a3 createdShortcut:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  -[WFAddToSiriViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  -[WFAddToSiriViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 & 1) != 0)
    objc_msgSend(v7, "addToSiriViewController:didCreateShortcut:", self, v9);
  else
    objc_msgSend(v7, "addToSiriViewControllerDidCancel:", self);

}

- (void)addToSiriWithViewController:(id)a3 deletedShortcut:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  -[WFAddToSiriViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  -[WFAddToSiriViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 & 1) != 0)
    objc_msgSend(v7, "addToSiriViewController:didDeleteShortcut:", self, v9);
  else
    objc_msgSend(v7, "addToSiriViewControllerDidCancel:", self);

}

- (void)addToSiriWithViewController:(id)a3 savedShortcut:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  -[WFAddToSiriViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  -[WFAddToSiriViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 & 1) != 0)
    objc_msgSend(v7, "addToSiriViewController:didSaveShortcut:", self, v9);
  else
    objc_msgSend(v7, "addToSiriViewControllerDidCancel:", self);

}

- (WFAddToSiriViewControllerDelegate)delegate
{
  return (WFAddToSiriViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFWorkflow)workflow
{
  return self->_workflow;
}

- (WFDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (_TtC10WorkflowUI35AddToSiriSwiftHostingViewController)hostedAddToSiriController
{
  return self->_hostedAddToSiriController;
}

- (void)setHostedAddToSiriController:(id)a3
{
  objc_storeStrong((id *)&self->_hostedAddToSiriController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostedAddToSiriController, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_workflow, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
