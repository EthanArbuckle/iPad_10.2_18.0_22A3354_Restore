@implementation WFTableViewHeaderView

- (WFTableViewHeaderView)initWithReuseIdentifier:(id)a3
{
  WFTableViewHeaderView *v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFTableViewHeaderView;
  v3 = -[WFTableViewHeaderView initWithReuseIdentifier:](&v8, sel_initWithReuseIdentifier_, a3);
  objc_msgSend(MEMORY[0x24BEBD728], "groupedHeaderConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", &stru_24DB39F78);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD730]), "initWithConfiguration:", v4);
  -[WFTableViewHeaderView setListContentView:](v3, "setListContentView:", v5);

  v6 = objc_alloc_init(MEMORY[0x24BEBD398]);
  -[WFTableViewHeaderView setActivityIndicatorView:](v3, "setActivityIndicatorView:", v6);

  -[WFTableViewHeaderView _configureContents](v3, "_configureContents");
  return v3;
}

- (void)setTitle:(id)a3
{
  __CFString *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  id v8;

  v4 = (__CFString *)a3;
  -[WFTableViewHeaderView listContentView](self, "listContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configuration");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
    v6 = v4;
  else
    v6 = &stru_24DB39F78;
  objc_msgSend(v8, "setText:", v6);

  -[WFTableViewHeaderView listContentView](self, "listContentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConfiguration:", v8);

}

- (NSString)title
{
  void *v2;
  void *v3;

  -[WFTableViewHeaderView contentConfiguration](self, "contentConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setAnimating:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = a3;
  self->_animating = a3;
  -[WFTableViewHeaderView activityIndicatorView](self, "activityIndicatorView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "startAnimating");
  else
    objc_msgSend(v4, "stopAnimating");

}

- (void)_configureContents
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[8];

  v46[6] = *MEMORY[0x24BDAC8D0];
  -[WFTableViewHeaderView listContentView](self, "listContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WFTableViewHeaderView activityIndicatorView](self, "activityIndicatorView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WFTableViewHeaderView contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTableViewHeaderView listContentView](self, "listContentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  -[WFTableViewHeaderView contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTableViewHeaderView activityIndicatorView](self, "activityIndicatorView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  v31 = (void *)MEMORY[0x24BDD1628];
  -[WFTableViewHeaderView listContentView](self, "listContentView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTableViewHeaderView contentView](self, "contentView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "leadingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v42);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v41;
  -[WFTableViewHeaderView listContentView](self, "listContentView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTableViewHeaderView contentView](self, "contentView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v36;
  -[WFTableViewHeaderView listContentView](self, "listContentView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTableViewHeaderView contentView](self, "contentView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v32);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v46[2] = v30;
  -[WFTableViewHeaderView listContentView](self, "listContentView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTableViewHeaderView contentView](self, "contentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v46[3] = v25;
  -[WFTableViewHeaderView activityIndicatorView](self, "activityIndicatorView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTableViewHeaderView listContentView](self, "listContentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "textLayoutGuide");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v9, 7.5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v46[4] = v10;
  -[WFTableViewHeaderView activityIndicatorView](self, "activityIndicatorView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "centerYAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTableViewHeaderView listContentView](self, "listContentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "textLayoutGuide");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "centerYAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v46[5] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "activateConstraints:", v17);

  -[WFTableViewHeaderView activityIndicatorView](self, "activityIndicatorView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActivityIndicatorViewStyle:", 100);

  LODWORD(v18) = -[WFTableViewHeaderView animating](self, "animating");
  -[WFTableViewHeaderView activityIndicatorView](self, "activityIndicatorView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if ((_DWORD)v18)
    objc_msgSend(v19, "startAnimating");
  else
    objc_msgSend(v19, "stopAnimating");

}

- (BOOL)animating
{
  return self->_animating;
}

- (UIListContentView)listContentView
{
  return self->_listContentView;
}

- (void)setListContentView:(id)a3
{
  objc_storeStrong((id *)&self->_listContentView, a3);
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_listContentView, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
