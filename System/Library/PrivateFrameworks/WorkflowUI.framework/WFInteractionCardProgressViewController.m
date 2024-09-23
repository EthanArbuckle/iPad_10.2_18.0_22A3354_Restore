@implementation WFInteractionCardProgressViewController

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SUICProgressEventViewController *progressEventViewController;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;
  _QWORD v22[5];

  v22[4] = *MEMORY[0x24BDAC8D0];
  v21.receiver = self;
  v21.super_class = (Class)WFInteractionCardProgressViewController;
  -[WFInteractionCardProgressViewController loadView](&v21, sel_loadView);
  v3 = objc_alloc_init(getSUICProgressEventViewControllerClass());
  -[WFInteractionCardProgressViewController addChildViewController:](self, "addChildViewController:", v3);
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WFInteractionCardProgressViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v4);

  v16 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v4, "heightAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToConstant:", 20.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v19;
  objc_msgSend(v4, "widthAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToConstant:", 20.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v17;
  objc_msgSend(v4, "centerXAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFInteractionCardProgressViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "centerXAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v7;
  objc_msgSend(v4, "centerYAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFInteractionCardProgressViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "centerYAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "activateConstraints:", v12);

  objc_msgSend(v3, "didMoveToParentViewController:", self);
  objc_msgSend(v3, "handleEvent:", 0);
  progressEventViewController = self->_progressEventViewController;
  self->_progressEventViewController = (SUICProgressEventViewController *)v3;

}

- (void)handleEvent:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;

  -[WFInteractionCardProgressViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  v5 = 2;
  if (a3 != 1)
    v5 = -1;
  if (a3)
    v6 = v5;
  else
    v6 = 0;
  -[WFInteractionCardProgressViewController progressEventViewController](self, "progressEventViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleEvent:", v6);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (SUICProgressEventViewController)progressEventViewController
{
  return self->_progressEventViewController;
}

- (void)setProgressEventViewController:(id)a3
{
  objc_storeStrong((id *)&self->_progressEventViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressEventViewController, 0);
}

@end
