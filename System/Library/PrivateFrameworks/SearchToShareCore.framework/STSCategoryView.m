@implementation STSCategoryView

- (STSCategoryView)init
{
  STSCategoryView *v2;
  STSCategoryView *v3;
  id v4;
  uint64_t v5;
  UITableView *tableView;
  UITableView *v7;
  void *v8;
  id v9;
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
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)STSCategoryView;
  v2 = -[STSCategoryView init](&v24, sel_init);
  v3 = v2;
  if (v2)
  {
    -[STSCategoryView setTranslatesAutoresizingMaskIntoConstraints:](v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v4 = objc_alloc(MEMORY[0x24BEBD9F0]);
    v5 = objc_msgSend(v4, "initWithFrame:style:", 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    tableView = v3->_tableView;
    v3->_tableView = (UITableView *)v5;

    v7 = v3->_tableView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView setBackgroundColor:](v7, "setBackgroundColor:", v8);

    -[UITableView setSeparatorStyle:](v3->_tableView, "setSeparatorStyle:", 0);
    -[UITableView setCellLayoutMarginsFollowReadableWidth:](v3->_tableView, "setCellLayoutMarginsFollowReadableWidth:", 1);
    v9 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    objc_msgSend(v9, "sizeToFit");
    -[UITableView setTableFooterView:](v3->_tableView, "setTableFooterView:", v9);
    -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](v3->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[STSCategoryView addSubview:](v3, "addSubview:", v3->_tableView);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView leadingAnchor](v3->_tableView, "leadingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSCategoryView leadingAnchor](v3, "leadingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v13);

    -[UITableView trailingAnchor](v3->_tableView, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSCategoryView trailingAnchor](v3, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v16);

    -[UITableView topAnchor](v3->_tableView, "topAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSCategoryView topAnchor](v3, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v19);

    -[UITableView bottomAnchor](v3->_tableView, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSCategoryView bottomAnchor](v3, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v22);

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v10);
  }
  return v3;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (CGPoint)footerOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_footerOffset.x;
  y = self->_footerOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setFooterOffset:(CGPoint)a3
{
  self->_footerOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
