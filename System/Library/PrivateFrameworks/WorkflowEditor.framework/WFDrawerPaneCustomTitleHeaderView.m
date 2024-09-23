@implementation WFDrawerPaneCustomTitleHeaderView

- (WFDrawerPaneCustomTitleHeaderView)initWithTitleView:(id)a3
{
  id v4;
  WFDrawerPaneCustomTitleHeaderView *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  WFDrawerPaneCustomTitleHeaderView *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFDrawerPaneCustomTitleHeaderView;
  v5 = -[WFDrawerPaneCustomTitleHeaderView init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WFDrawerPaneCustomTitleHeaderView addSubview:](v5, "addSubview:", v4);
    objc_storeWeak((id *)&v5->_titleView, v4);
    +[WFDrawerPaneCloseButton buttonWithType:](WFDrawerPaneCloseButton, "buttonWithType:", 7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v7) = 1148829696;
    objc_msgSend(v6, "setContentCompressionResistancePriority:forAxis:", 0, v7);
    LODWORD(v8) = 1148829696;
    objc_msgSend(v6, "setContentHuggingPriority:forAxis:", 0, v8);
    objc_msgSend(v6, "addTarget:action:forControlEvents:", v5, sel_closeButtonTouchedUp_, 64);
    -[WFDrawerPaneCustomTitleHeaderView addSubview:](v5, "addSubview:", v6);
    objc_storeWeak((id *)&v5->_closeButton, v6);
    v9 = (void *)MEMORY[0x24BDD1628];
    -[WFDrawerPaneCustomTitleHeaderView layoutConstraints](v5, "layoutConstraints");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activateConstraints:", v10);

    v11 = v5;
  }

  return v5;
}

- (id)layoutConstraints
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
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  WFDrawerPaneCustomTitleHeaderView *v30;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[4];
  _QWORD v50[8];

  v50[6] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE193A0], "sharedContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shouldReverseLayoutDirection");

  -[WFDrawerPaneCustomTitleHeaderView titleView](self, "titleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFDrawerPaneCustomTitleHeaderView titleView](self, "titleView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDrawerPaneCustomTitleHeaderView leadingAnchor](self, "leadingAnchor");
    v40 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:constant:", v40, 16.0);
    v38 = objc_claimAutoreleasedReturnValue();
    v50[0] = v38;
    -[WFDrawerPaneCustomTitleHeaderView titleView](self, "titleView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDrawerPaneCustomTitleHeaderView layoutMarginsGuide](self, "layoutMarginsGuide");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "topAnchor");
    v37 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:constant:", v37, 0.0);
    v35 = objc_claimAutoreleasedReturnValue();
    v50[1] = v35;
    -[WFDrawerPaneCustomTitleHeaderView titleView](self, "titleView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "bottomAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDrawerPaneCustomTitleHeaderView bottomAnchor](self, "bottomAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:constant:", -18.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v50[2] = v45;
    -[WFDrawerPaneCustomTitleHeaderView titleView](self, "titleView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trailingAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDrawerPaneCustomTitleHeaderView closeButton](self, "closeButton");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v6;
    objc_msgSend(v6, "constraintEqualToAnchor:constant:", v32, -16.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v50[3] = v7;
    -[WFDrawerPaneCustomTitleHeaderView closeButton](self, "closeButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trailingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDrawerPaneCustomTitleHeaderView trailingAnchor](self, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, -16.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v50[4] = v11;
    -[WFDrawerPaneCustomTitleHeaderView closeButton](self, "closeButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "centerYAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDrawerPaneCustomTitleHeaderView centerYAnchor](self, "centerYAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v50[5] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 6);
    v42 = (id)objc_claimAutoreleasedReturnValue();

    v16 = v34;
    v17 = v5;

    v18 = v36;
    v19 = (void *)v38;

    v20 = (void *)v40;
    v21 = v41;

    v22 = v33;
    v23 = (void *)v35;

    v24 = (void *)v37;
    v25 = v39;
  }
  else
  {
    -[WFDrawerPaneCustomTitleHeaderView closeButton](self, "closeButton");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDrawerPaneCustomTitleHeaderView leadingAnchor](self, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v19;
    -[WFDrawerPaneCustomTitleHeaderView closeButton](self, "closeButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDrawerPaneCustomTitleHeaderView trailingAnchor](self, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v25, -16.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = v24;
    -[WFDrawerPaneCustomTitleHeaderView closeButton](self, "closeButton");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "topAnchor");
    v26 = objc_claimAutoreleasedReturnValue();
    -[WFDrawerPaneCustomTitleHeaderView topAnchor](self, "topAnchor");
    v27 = objc_claimAutoreleasedReturnValue();
    v48 = (void *)v26;
    v28 = (void *)v26;
    v22 = (void *)v27;
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v27, 0.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v49[2] = v46;
    -[WFDrawerPaneCustomTitleHeaderView closeButton](self, "closeButton");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "bottomAnchor");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = self;
    v17 = (void *)v29;
    -[WFDrawerPaneCustomTitleHeaderView bottomAnchor](v30, "bottomAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:constant:", 5.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v49[3] = v43;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 4);
    v42 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v42;
}

- (void)closeButtonTouchedUp:(id)a3
{
  void *v4;
  id v5;

  -[WFDrawerPaneCustomTitleHeaderView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFDrawerPaneCustomTitleHeaderView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didDismissHeaderView:", self);

  }
}

- (WFDrawerPaneHeaderViewDelegate)delegate
{
  return (WFDrawerPaneHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)titleView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_titleView);
}

- (WFDrawerPaneCloseButton)closeButton
{
  return (WFDrawerPaneCloseButton *)objc_loadWeakRetained((id *)&self->_closeButton);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_closeButton);
  objc_destroyWeak((id *)&self->_titleView);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
