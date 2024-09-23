@implementation WFDrawerPaneSearchHeaderView

- (WFDrawerPaneSearchHeaderView)initWithSearchBar:(id)a3
{
  id v4;
  WFDrawerPaneSearchHeaderView *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  WFDrawerPaneSearchHeaderView *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFDrawerPaneSearchHeaderView;
  v5 = -[WFDrawerPaneSearchHeaderView init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v4, "setSearchBarStyle:", 2);
    v6 = objc_storeWeak((id *)&v5->_searchBar, v4);
    -[WFDrawerPaneSearchHeaderView addSubview:](v5, "addSubview:", v4);

    v7 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "separatorColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v8);

    v9 = objc_storeWeak((id *)&v5->_separatorView, v7);
    -[WFDrawerPaneSearchHeaderView addSubview:](v5, "addSubview:", v7);

    v10 = (void *)MEMORY[0x24BDD1628];
    -[WFDrawerPaneSearchHeaderView layoutConstraints](v5, "layoutConstraints");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activateConstraints:", v11);

    v12 = v5;
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
  double v12;
  void *v13;
  id v15;
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
  _QWORD v41[11];

  v41[9] = *MEMORY[0x24BDAC8D0];
  -[WFDrawerPaneSearchHeaderView searchBar](self, "searchBar");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "heightAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToConstant:", 44.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v38;
  -[WFDrawerPaneSearchHeaderView searchBar](self, "searchBar");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDrawerPaneSearchHeaderView leadingAnchor](self, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, 8.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v34;
  -[WFDrawerPaneSearchHeaderView searchBar](self, "searchBar");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDrawerPaneSearchHeaderView trailingAnchor](self, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:constant:", v31, -8.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v30;
  -[WFDrawerPaneSearchHeaderView searchBar](self, "searchBar");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDrawerPaneSearchHeaderView topAnchor](self, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v27, 12.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v41[3] = v26;
  -[WFDrawerPaneSearchHeaderView searchBar](self, "searchBar");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDrawerPaneSearchHeaderView bottomAnchor](self, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23, -12.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v41[4] = v22;
  -[WFDrawerPaneSearchHeaderView separatorView](self, "separatorView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDrawerPaneSearchHeaderView leadingAnchor](self, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v41[5] = v18;
  -[WFDrawerPaneSearchHeaderView separatorView](self, "separatorView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDrawerPaneSearchHeaderView trailingAnchor](self, "trailingAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v41[6] = v4;
  -[WFDrawerPaneSearchHeaderView separatorView](self, "separatorView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDrawerPaneSearchHeaderView bottomAnchor](self, "bottomAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v41[7] = v8;
  -[WFDrawerPaneSearchHeaderView separatorView](self, "separatorView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "heightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scale");
  objc_msgSend(v10, "constraintEqualToConstant:", 1.0 / v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v41[8] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 9);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (WFDrawerPaneHeaderViewDelegate)delegate
{
  return (WFDrawerPaneHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UISearchBar)searchBar
{
  return (UISearchBar *)objc_loadWeakRetained((id *)&self->_searchBar);
}

- (UIButton)closeButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_closeButton);
}

- (UIView)separatorView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_separatorView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_separatorView);
  objc_destroyWeak((id *)&self->_closeButton);
  objc_destroyWeak((id *)&self->_searchBar);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
