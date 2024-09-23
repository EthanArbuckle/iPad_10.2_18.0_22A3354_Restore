@implementation WFEntityPickerDialogViewController

- (WFEntityPickerDialogViewController)initWithRequest:(id)a3
{
  WFEntityPickerDialogViewController *v3;
  WFEntityPickerDialogViewController *v4;
  WFEntityPickerDialogViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFEntityPickerDialogViewController;
  v3 = -[WFCompactDialogViewController initWithRequest:](&v7, sel_initWithRequest_, a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
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
  _QWORD v33[5];
  objc_super v34;
  _QWORD v35[6];

  v35[4] = *MEMORY[0x24BDAC8D0];
  v34.receiver = self;
  v34.super_class = (Class)WFEntityPickerDialogViewController;
  -[WFCompactDialogViewController loadView](&v34, sel_loadView);
  -[WFCompactPlatterViewController platterView](self, "platterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSashVisible:", 0);

  v32 = (void *)objc_opt_new();
  -[WFCompactPlatterViewController setContentViewController:](self, "setContentViewController:", v32);
  -[WFCompactDialogViewController request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __46__WFEntityPickerDialogViewController_loadView__block_invoke;
  v33[3] = &unk_24E604948;
  v33[4] = self;
  +[WFEntityPickerHostingControllerFactory makeHostingController:maxRows:tapHandler:](WFEntityPickerHostingControllerFactory, "makeHostingController:maxRows:tapHandler:", v4, 2, v33);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  -[WFCompactPlatterViewController contentViewController](self, "contentViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  v31 = v5;
  objc_msgSend(v8, "addChildViewController:", v5);

  -[WFCompactPlatterViewController contentViewController](self, "contentViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = 1148846080;
  objc_msgSend(v12, "setContentCompressionResistancePriority:forAxis:", 1, v13);
  objc_msgSend(v11, "addSubview:", v12);
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v12, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v17) = 1144750080;
  v30 = v16;
  objc_msgSend(v16, "setPriority:", v17);
  v26 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v12, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v27;
  v35[1] = v16;
  objc_msgSend(v12, "leftAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leftAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v20;
  objc_msgSend(v12, "rightAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rightAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "activateConstraints:", v24);

  -[WFCompactPlatterViewController contentViewController](self, "contentViewController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "didMoveToParentViewController:", v25);

  -[WFCompactPlatterViewController invalidateContentSize](self, "invalidateContentSize");
}

- (void)finishWithEntry:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x24BEC3CF0];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithSelectedEntry:", v5);

  -[WFCompactDialogViewController finishWithResponse:](self, "finishWithResponse:", v6);
}

- (BOOL)shouldHideSashView
{
  return 1;
}

uint64_t __46__WFEntityPickerDialogViewController_loadView__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithEntry:", a2);
}

@end
