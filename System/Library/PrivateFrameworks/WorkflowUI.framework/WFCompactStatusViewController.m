@implementation WFCompactStatusViewController

- (void)loadView
{
  void *v3;
  WFCompactStopButton *v4;
  void *v5;
  WFCompactStopButton *stopButton;
  WFCompactStopButton *v7;
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
  objc_super v24;
  _QWORD v25[6];

  v25[5] = *MEMORY[0x24BDAC8D0];
  v24.receiver = self;
  v24.super_class = (Class)WFCompactStatusViewController;
  -[WFCompactPlatterViewController loadView](&v24, sel_loadView);
  v23 = (void *)objc_opt_new();
  objc_msgSend(v23, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactPlatterViewController setContentViewController:](self, "setContentViewController:", v23);
  +[WFCompactStopButton buttonWithType:](WFCompactStopButton, "buttonWithType:", 1);
  v4 = (WFCompactStopButton *)objc_claimAutoreleasedReturnValue();
  -[WFCompactStatusViewController progress](self, "progress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactStopButton setProgress:](v4, "setProgress:", v5);

  -[WFCompactStopButton setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", v4);
  stopButton = self->_stopButton;
  self->_stopButton = v4;
  v7 = v4;

  v17 = (void *)MEMORY[0x24BDD1628];
  -[WFCompactStopButton widthAnchor](v7, "widthAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToConstant:", 36.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v21;
  -[WFCompactStopButton heightAnchor](v7, "heightAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToConstant:", 36.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v19;
  -[WFCompactStopButton topAnchor](v7, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v16, 8.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v8;
  -[WFCompactStopButton bottomAnchor](v7, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, -18.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v11;
  -[WFCompactStopButton centerXAnchor](v7, "centerXAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerXAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "activateConstraints:", v15);

}

- (void)setProgress:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_progress, a3);
  v5 = a3;
  -[WFCompactStatusViewController stopButton](self, "stopButton");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProgress:", v5);

}

- (void)setAttribution:(id)a3
{
  id v5;
  WFDialogAttribution *v6;
  WFDialogAttribution *v7;
  char v8;
  WFDialogAttribution *v9;
  void *v10;
  WFDialogAttribution *v11;

  v5 = a3;
  v6 = self->_attribution;
  v7 = (WFDialogAttribution *)v5;
  v11 = v7;
  if (v6 == v7)
  {

    v10 = v11;
  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[WFDialogAttribution isEqual:](v6, "isEqual:", v7);

      v9 = v11;
      if ((v8 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_attribution, a3);
    -[WFCompactPlatterViewController platterView](self, "platterView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAttribution:", v11);
  }

  v9 = v11;
LABEL_10:

}

- (void)transitionToCompleted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v7;

  v4 = a4;
  v5 = a3;
  -[WFCompactStatusViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[WFCompactStatusViewController stopButton](self, "stopButton");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transitionToCompleted:animated:", v5, v4);

}

- (NSProgress)progress
{
  return self->_progress;
}

- (WFDialogAttribution)attribution
{
  return self->_attribution;
}

- (WFCompactStopButton)stopButton
{
  return self->_stopButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopButton, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

@end
