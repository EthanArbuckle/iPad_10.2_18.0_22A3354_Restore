@implementation UITableView

- (int64_t)_maps_indexOfFirstNonEmptySection
{
  void *v3;
  uint64_t v4;
  NSInteger v5;
  int64_t v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView dataSource](self, "dataSource"));
  v4 = (uint64_t)objc_msgSend(v3, "numberOfSectionsInTableView:", self);

  v5 = -[UITableView numberOfSections](self, "numberOfSections");
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 >= 1 && v4 == v5)
  {
    v6 = 0;
    while (1)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView dataSource](self, "dataSource"));
      v8 = objc_msgSend(v7, "tableView:numberOfRowsInSection:", self, v6);

      if (v8)
        break;
      if (v4 == ++v6)
        return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v6;
}

- (BOOL)_maps_shouldShowTopHairline
{
  double v3;
  double v4;
  double v5;
  BOOL result;
  int64_t v7;
  NSInteger v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  uint64_t v17;
  double v18;
  double v19;
  double MaxY;
  uint64_t v21;
  CGRect v22;

  if ((id)-[UITableView style](self, "style") == (id)2)
  {
    -[UITableView contentOffset](self, "contentOffset");
    v4 = v3;
    -[UITableView contentInset](self, "contentInset");
    return v4 > v5;
  }
  else
  {
    v7 = -[UITableView _maps_indexOfFirstNonEmptySection](self, "_maps_indexOfFirstNonEmptySection");
    v8 = -[UITableView numberOfSections](self, "numberOfSections");
    result = 0;
    if (v7 != 0x7FFFFFFFFFFFFFFFLL && v7 < v8)
    {
      -[UITableView rectForHeaderInSection:](self, "rectForHeaderInSection:", v7);
      if (v12 == 0.0)
      {
        return 1;
      }
      else
      {
        v13 = v9;
        v14 = v10;
        v15 = v11;
        v16 = v12;
        -[UITableView contentOffset](self, "contentOffset");
        v19 = UIRoundToViewScale(self, v17, v18);
        v22.origin.x = v13;
        v22.origin.y = v14;
        v22.size.width = v15;
        v22.size.height = v16;
        MaxY = CGRectGetMaxY(v22);
        return v19 >= UIRoundToViewScale(self, v21, MaxY);
      }
    }
  }
  return result;
}

- (void)_maps_registerGroupedHeaderView
{
  -[UITableView registerClass:forHeaderFooterViewReuseIdentifier:](self, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(MapsGroupedTableHeaderView), CFSTR("_maps_groupedHeaderReuseIdentifier"));
  -[UITableView registerClass:forHeaderFooterViewReuseIdentifier:](self, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(ButtonTableViewHeaderFooterView), CFSTR("_maps_groupedHeaderButtonReuseIdentifier"));
}

- (void)_maps_registerSelectableFooterView
{
  -[UITableView registerClass:forHeaderFooterViewReuseIdentifier:](self, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(TableViewSelectableFooterView), CFSTR("_maps_selectableFooterReuseIdentifier"));
}

- (id)_maps_groupedHeaderViewWithTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView dequeueReusableHeaderFooterViewWithIdentifier:](self, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("_maps_groupedHeaderReuseIdentifier")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "titleLabel"));
    objc_msgSend(v6, "setText:", v4);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "titleLabel"));
    objc_msgSend(v8, "setFont:", v7);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_maps_groupedHeaderViewWithTitle:(id)a3 buttonTitle:(id)a4 target:(id)a5 selector:(SEL)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView dequeueReusableHeaderFooterViewWithIdentifier:](self, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("_maps_groupedHeaderButtonReuseIdentifier")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "titleLabel"));
  objc_msgSend(v14, "setText:", v12);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "titleLabel"));
  objc_msgSend(v16, "setFont:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "button"));
  objc_msgSend(v17, "setTitle:forState:", v11, 0);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "button"));
  objc_msgSend(v18, "addTarget:action:forControlEvents:", v10, a6, 64);

  return v13;
}

- (id)_maps_footerViewWithTitle:(id)a3 linkText:(id)a4 target:(id)a5 selector:(SEL)a6
{
  id v9;
  id v10;
  id v11;
  TableViewFooterOptions *v12;
  TableViewSelectableFooterView *v13;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = objc_alloc_init(TableViewFooterOptions);
  -[TableViewFooterOptions setLabelText:](v12, "setLabelText:", v11);

  -[TableViewFooterOptions setLinkText:](v12, "setLinkText:", v10);
  v13 = -[TableViewSelectableFooterView initWithReuseIdentifier:options:]([TableViewSelectableFooterView alloc], "initWithReuseIdentifier:options:", CFSTR("_maps_selectableFooterReuseIdentifier"), v12);
  -[TableViewSelectableFooterView setTarget:action:](v13, "setTarget:action:", v9, a6);

  return v13;
}

- (void)_maps_initializeRAPAppearance
{
  void *v3;
  _BOOL8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v4 = objc_msgSend(v3, "userInterfaceIdiom") == (id)5;

  -[UITableView _maps_initializeRAPAppearanceWithStyle:](self, "_maps_initializeRAPAppearanceWithStyle:", v4);
}

- (void)_maps_initializeRAPAppearanceWithStyle:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  id v7;

  -[UITableView _maps_registerGroupedHeaderView](self, "_maps_registerGroupedHeaderView");
  if (a3 == 2)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    goto LABEL_5;
  }
  if (!a3)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("RAPGroupedTableViewBackgroundColor")));
LABEL_5:
    v6 = (void *)v5;
    -[UITableView setBackgroundColor:](self, "setBackgroundColor:", v5);

  }
  v7 = (id)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("RAPGroupedTableViewSeparatorColor")));
  -[UITableView setSeparatorColor:](self, "setSeparatorColor:", v7);

}

- (void)_maps_reloadCellHeights
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100291C74;
  v2[3] = &unk_1011AC860;
  v2[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v2);
}

- (CGSize)_maps_contentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UITableView _contentSize](self, "_contentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_maps_commitUpdates
{
  -[UITableView beginUpdates](self, "beginUpdates");
  -[UITableView endUpdates](self, "endUpdates");
}

@end
