@implementation WFDrawerNavigationBarTitleView

- (WFDrawerNavigationBarTitleView)initWithDelegate:(id)a3 showsDetailsButton:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  WFDrawerNavigationBarTitleView *v7;
  WFDrawerNavigationBarTitleView *v8;
  WFInspectorPaneSegmentedControlHostingView *v9;
  WFInspectorPaneSegmentedControlHostingView *hostingView;
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
  WFDrawerNavigationBarTitleView *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  objc_super v33;
  _QWORD v34[5];

  v4 = a4;
  v34[4] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v33.receiver = self;
  v33.super_class = (Class)WFDrawerNavigationBarTitleView;
  v7 = -[_UINavigationBarTitleView initWithFrame:](&v33, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v8 = v7;
  if (v7)
  {
    -[_UINavigationBarTitleView setUnderlayBarContent:](v7, "setUnderlayBarContent:", 1);
    -[_UINavigationBarTitleView setHideStandardTitle:](v8, "setHideStandardTitle:", 1);
    -[_UINavigationBarTitleView setPreferredContentAlignment:](v8, "setPreferredContentAlignment:", 2);
    v9 = -[WFInspectorPaneSegmentedControlHostingView initWithDelegate:showsDetailsButton:]([WFInspectorPaneSegmentedControlHostingView alloc], "initWithDelegate:showsDetailsButton:", v6, v4);
    hostingView = v8->_hostingView;
    v8->_hostingView = v9;

    -[WFDrawerNavigationBarTitleView addSubview:](v8, "addSubview:", v8->_hostingView);
    -[_UINavigationBarTitleView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WFDrawerNavigationBarTitleView hostingView](v8, "hostingView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v24 = (void *)MEMORY[0x24BDD1628];
    -[WFDrawerNavigationBarTitleView hostingView](v8, "hostingView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "centerXAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDrawerNavigationBarTitleView centerXAnchor](v8, "centerXAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v29);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v28;
    -[WFDrawerNavigationBarTitleView hostingView](v8, "hostingView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "centerYAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDrawerNavigationBarTitleView centerYAnchor](v8, "centerYAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v23;
    -[WFDrawerNavigationBarTitleView hostingView](v8, "hostingView");
    v32 = v6;
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "widthAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDrawerNavigationBarTitleView widthAnchor](v8, "widthAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = v15;
    -[WFDrawerNavigationBarTitleView hostingView](v8, "hostingView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "heightAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDrawerNavigationBarTitleView heightAnchor](v8, "heightAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v34[3] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activateConstraints:", v20);

    v6 = v32;
    v21 = v8;
  }

  return v8;
}

- (WFInspectorPaneSegmentedControlHostingView)hostingView
{
  return self->_hostingView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostingView, 0);
}

@end
