@implementation STSSearchBrowserRootView

- (STSSearchBrowserRootView)init
{
  STSSearchBrowserRootView *v2;
  uint64_t v3;
  NSMutableArray *constraints;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STSSearchBrowserRootView;
  v2 = -[STSSearchBrowserRootView init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    constraints = v2->_constraints;
    v2->_constraints = (NSMutableArray *)v3;

    -[STSSearchBrowserRootView setTranslatesAutoresizingMaskIntoConstraints:](v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }
  return v2;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  STSSearchBrowserRootView *v5;
  STSSearchBrowserHeaderView *headerView;
  NSMutableArray *constraints;
  void *v8;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  void *v16;
  STSSearchBrowserRootView *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  NSMutableArray *v24;
  void *v25;
  void *v26;
  void *v27;
  NSMutableArray *v28;
  void *v29;
  void *v30;
  void *v31;
  NSMutableArray *v32;
  void *v33;
  void *v34;
  void *v35;
  NSMutableArray *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;

  -[STSSearchBrowserRootView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "horizontalSizeClass");

  objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:", self->_constraints);
  -[NSMutableArray removeAllObjects](self->_constraints, "removeAllObjects");
  -[STSSearchBrowserRootView layoutMarginsGuide](self, "layoutMarginsGuide");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  -[STSSearchBrowserRootView readableContentGuide](self, "readableContentGuide");
  v5 = (STSSearchBrowserRootView *)objc_claimAutoreleasedReturnValue();
  headerView = self->_headerView;
  if (headerView)
  {
    constraints = self->_constraints;
    -[STSSearchBrowserHeaderView topAnchor](headerView, "topAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](constraints, "addObject:", v10);

    v11 = self->_constraints;
    -[STSSearchBrowserHeaderView leadingAnchor](self->_headerView, "leadingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 == 2)
    {
      -[STSSearchBrowserRootView leadingAnchor](v5, "leadingAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constraintEqualToAnchor:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v11, "addObject:", v14);

      v15 = self->_constraints;
      -[STSSearchBrowserHeaderView trailingAnchor](self->_headerView, "trailingAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v5;
    }
    else
    {
      -[STSSearchBrowserRootView leadingAnchor](self, "leadingAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constraintEqualToAnchor:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v11, "addObject:", v19);

      v15 = self->_constraints;
      -[STSSearchBrowserHeaderView trailingAnchor](self->_headerView, "trailingAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = self;
    }
    -[STSSearchBrowserRootView trailingAnchor](v17, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v15, "addObject:", v21);

    if (self->_headerView)
    {
      if (self->_contentView)
      {
        -[STSSearchBrowserRootView subviews](self, "subviews");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "containsObject:", self->_contentView);

        if (v23)
        {
          v24 = self->_constraints;
          -[UIView topAnchor](self->_contentView, "topAnchor");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[STSSearchBrowserHeaderView bottomAnchor](self->_headerView, "bottomAnchor");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "constraintEqualToAnchor:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v24, "addObject:", v27);

          v28 = self->_constraints;
          -[UIView bottomAnchor](self->_contentView, "bottomAnchor");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "bottomAnchor");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "constraintEqualToAnchor:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v28, "addObject:", v31);

          v32 = self->_constraints;
          -[UIView leadingAnchor](self->_contentView, "leadingAnchor");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[STSSearchBrowserRootView leadingAnchor](self, "leadingAnchor");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34, 6.0);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v32, "addObject:", v35);

          v36 = self->_constraints;
          -[UIView trailingAnchor](self->_contentView, "trailingAnchor");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[STSSearchBrowserRootView trailingAnchor](self, "trailingAnchor");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "constraintEqualToAnchor:constant:", v38, -6.0);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v36, "addObject:", v39);

        }
      }
    }
  }
  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_constraints);

}

- (void)didAddSubview:(id)a3
{
  -[STSSearchBrowserRootView bringSubviewToFront:](self, "bringSubviewToFront:", self->_headerView);
}

- (void)setHeaderView:(id)a3
{
  STSSearchBrowserHeaderView *v5;
  STSSearchBrowserHeaderView *headerView;
  STSSearchBrowserHeaderView *v7;

  v5 = (STSSearchBrowserHeaderView *)a3;
  headerView = self->_headerView;
  if (headerView != v5)
  {
    v7 = v5;
    -[STSSearchBrowserHeaderView removeFromSuperview](headerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_headerView, a3);
    -[STSSearchBrowserRootView addSubview:](self, "addSubview:", self->_headerView);
    -[STSSearchBrowserRootView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setHeaderTopInset:(double)a3
{
  if (self->_headerTopInset != a3)
  {
    self->_headerTopInset = a3;
    -[STSSearchBrowserRootView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setContentView:(id)a3
{
  UIView *v5;
  UIView **p_contentView;
  UIView *contentView;
  void *v8;
  char v9;
  UIView *v10;

  v5 = (UIView *)a3;
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    v10 = v5;
    -[UIView removeFromSuperview](contentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentView, a3);
    -[UIView superview](*p_contentView, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", self);

    if ((v9 & 1) == 0)
      -[STSSearchBrowserRootView addSubview:](self, "addSubview:", *p_contentView);
    -[STSSearchBrowserRootView setNeedsLayout](self, "setNeedsLayout");
    v5 = v10;
  }

}

- (STSSearchBrowserHeaderView)headerView
{
  return self->_headerView;
}

- (double)headerTopInset
{
  return self->_headerTopInset;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
}

@end
