@implementation WFWidgetConfigurationLoadingContentViewController

- (void)setCurrentContentView:(id)a3
{
  id v5;
  UIView *currentContentView;
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
  _QWORD v30[5];

  v30[4] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  currentContentView = self->_currentContentView;
  if (currentContentView)
    -[UIView removeFromSuperview](currentContentView, "removeFromSuperview");
  objc_storeStrong((id *)&self->_currentContentView, a3);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_currentContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (v5 && -[WFWidgetConfigurationLoadingContentViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[WFWidgetConfigurationLoadingContentViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v5);

    v20 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v5, "centerXAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationLoadingContentViewController view](self, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "layoutMarginsGuide");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "centerXAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v25;
    objc_msgSend(v5, "centerYAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationLoadingContentViewController view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "layoutMarginsGuide");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v19;
    objc_msgSend(v5, "widthAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationLoadingContentViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layoutMarginsGuide");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "widthAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintLessThanOrEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v10;
    objc_msgSend(v5, "heightAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationLoadingContentViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layoutMarginsGuide");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "heightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintLessThanOrEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30[3] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activateConstraints:", v16);

  }
}

- (void)viewDidLoad
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
  objc_super v32;
  _QWORD v33[6];

  v33[4] = *MEMORY[0x24BDAC8D0];
  v32.receiver = self;
  v32.super_class = (Class)WFWidgetConfigurationLoadingContentViewController;
  -[WFWidgetConfigurationLoadingContentViewController viewDidLoad](&v32, sel_viewDidLoad);
  -[WFWidgetConfigurationLoadingContentViewController currentContentView](self, "currentContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFWidgetConfigurationLoadingContentViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationLoadingContentViewController currentContentView](self, "currentContentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSubview:", v5);

    v20 = (void *)MEMORY[0x24BDD1628];
    -[WFWidgetConfigurationLoadingContentViewController currentContentView](self, "currentContentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "centerXAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationLoadingContentViewController view](self, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "layoutMarginsGuide");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "centerXAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v26;
    -[WFWidgetConfigurationLoadingContentViewController currentContentView](self, "currentContentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "centerYAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationLoadingContentViewController view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "layoutMarginsGuide");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v19;
    -[WFWidgetConfigurationLoadingContentViewController currentContentView](self, "currentContentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "widthAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationLoadingContentViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layoutMarginsGuide");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "widthAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintLessThanOrEqualToAnchor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v8;
    -[WFWidgetConfigurationLoadingContentViewController currentContentView](self, "currentContentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "heightAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationLoadingContentViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layoutMarginsGuide");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "heightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintLessThanOrEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v33[3] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activateConstraints:", v15);

  }
  else
  {
    -[WFWidgetConfigurationLoadingContentViewController startLoading](self, "startLoading");
  }
}

- (void)startLoading
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 101);
  objc_msgSend(v3, "startAnimating");
  -[WFWidgetConfigurationLoadingContentViewController setCurrentContentView:](self, "setCurrentContentView:", v3);

}

- (void)showMessage:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (objc_class *)MEMORY[0x24BEBD708];
  v5 = a3;
  v8 = objc_alloc_init(v4);
  objc_msgSend(v8, "setText:", v5);

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v6);

  objc_msgSend(v8, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v8, "setNumberOfLines:", 0);
  objc_msgSend(v8, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v7);

  -[WFWidgetConfigurationLoadingContentViewController setCurrentContentView:](self, "setCurrentContentView:", v8);
}

- (UIView)currentContentView
{
  return self->_currentContentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentContentView, 0);
}

@end
