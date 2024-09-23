@implementation STSDropDownRootView

- (STSDropDownRootView)init
{
  STSDropDownRootView *v2;
  uint64_t v3;
  NSMutableArray *constraints;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STSDropDownRootView;
  v2 = -[STSDropDownRootView init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    constraints = v2->_constraints;
    v2->_constraints = (NSMutableArray *)v3;

    -[STSDropDownRootView setTranslatesAutoresizingMaskIntoConstraints:](v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }
  return v2;
}

- (void)layoutSubviews
{
  void *v3;
  int v4;
  NSMutableArray *constraints;
  void *v6;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)STSDropDownRootView;
  -[STSDropDownRootView layoutSubviews](&v21, sel_layoutSubviews);
  -[STSDropDownRootView subviews](self, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", self->_contentView);

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:", self->_constraints);
    -[NSMutableArray removeAllObjects](self->_constraints, "removeAllObjects");
    constraints = self->_constraints;
    -[UIView topAnchor](self->_contentView, "topAnchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSDropDownRootView topAnchor](self, "topAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintEqualToAnchor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](constraints, "addObject:", v8);

    v9 = self->_constraints;
    -[UIView bottomAnchor](self->_contentView, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSDropDownRootView bottomAnchor](self, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v9, "addObject:", v12);

    v13 = self->_constraints;
    -[UIView leadingAnchor](self->_contentView, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSDropDownRootView leadingAnchor](self, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v13, "addObject:", v16);

    v17 = self->_constraints;
    -[UIView trailingAnchor](self->_contentView, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSDropDownRootView trailingAnchor](self, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v17, "addObject:", v20);

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_constraints);
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
      -[STSDropDownRootView addSubview:](self, "addSubview:", *p_contentView);
    -[STSDropDownRootView setNeedsLayout](self, "setNeedsLayout");
    v5 = v10;
  }

}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
}

@end
