@implementation WFSingleStepHomeScreenShortcutCompletionDialogViewController

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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;
  _QWORD v22[6];

  v22[5] = *MEMORY[0x24BDAC8D0];
  v21.receiver = self;
  v21.super_class = (Class)WFSingleStepHomeScreenShortcutCompletionDialogViewController;
  -[WFCompactDialogViewController loadView](&v21, sel_loadView);
  v20 = (void *)objc_opt_new();
  objc_msgSend(v20, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactPlatterViewController setContentViewController:](self, "setContentViewController:", v20);
  +[WFCompactStopButton buttonWithType:](WFCompactStopButton, "buttonWithType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", v4);
  objc_msgSend(v4, "transitionToCompleted:animated:", 1, 0);
  v14 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v4, "widthAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToConstant:", 36.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v18;
  objc_msgSend(v4, "heightAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToConstant:", 36.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  objc_msgSend(v4, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v13, 8.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v5;
  objc_msgSend(v4, "bottomAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, -18.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v8;
  objc_msgSend(v4, "centerXAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerXAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activateConstraints:", v12);

}

- (id)requestIdentifier
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFSingleStepHomeScreenShortcutCompletionDialogViewController;
  -[WFCompactPlatterViewController requestIdentifier](&v5, sel_requestIdentifier);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.single-step-home-screen-completion"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
