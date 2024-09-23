@implementation RAPTablePartSection

- (RAPTablePartSection)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RAPTablePartSection;
  return -[RAPTablePartSection init](&v3, "init");
}

- (void)_setPartController:(id)a3
{
  objc_storeWeak((id *)&self->_partController, a3);
}

- (RAPTablePartsDataSource)dataSource
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection partController](self, "partController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dataSource"));

  return (RAPTablePartsDataSource *)v3;
}

- (RAPPresentingViewController)presentingViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection partController](self, "partController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "presentingViewController"));

  return (RAPPresentingViewController *)v3;
}

- (void)holdChangesAffectingTableViewWithinBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection partController](self, "partController"));
  objc_msgSend(v5, "holdChangesAffectingTableViewWithinBlock:", v4);

}

- (void)_registerReuseIdentifiersIfNeeded
{
  UITableView **p_tableView;
  id v4;
  id v5;
  id WeakRetained;

  p_tableView = &self->_tableView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  v4 = objc_loadWeakRetained((id *)&self->_partController);
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tableView"));

  if (WeakRetained != v5 && v5 != 0)
  {
    objc_storeWeak((id *)p_tableView, v5);
    -[RAPTablePartSection registerReuseIdentifiersForCells](self, "registerReuseIdentifiersForCells");
  }

}

- (id)namespacedReuseIdentifierWithSuffix:(id)a3
{
  id v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class(self);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingFormat:", CFSTR("__%@"), v4));

  return v8;
}

- (id)dequeueCellWithNamespacedReuseIdentifier:(id)a3
{
  return -[RAPTablePartSection dequeueCellWithNamespacedReuseIdentifier:creationBlock:](self, "dequeueCellWithNamespacedReuseIdentifier:creationBlock:", a3, 0);
}

- (id)dequeueCellWithNamespacedReuseIdentifier:(id)a3 creationBlock:(id)a4
{
  uint64_t (**v6)(id, void *);
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v6 = (uint64_t (**)(id, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection namespacedReuseIdentifierWithSuffix:](self, "namespacedReuseIdentifierWithSuffix:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection tableView](self, "tableView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithIdentifier:", v7));

  if (v6 && !v9)
  {
    v10 = v6[2](v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v10);
  }

  return v9;
}

- (id)dequeueDefaultSingleLineTableViewCell
{
  void *v2;
  void *v3;
  RAPSingleLineTableViewCell *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection tableView](self, "tableView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RAPSingleLineTableViewCell reuseIdentifier](RAPSingleLineTableViewCell, "reuseIdentifier"));
  v4 = (RAPSingleLineTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dequeueReusableCellWithIdentifier:", v3));

  if (!v4)
    v4 = objc_alloc_init(RAPSingleLineTableViewCell);
  return v4;
}

- (id)dequeueSubtitleStyleCell
{
  void *v2;
  void *v3;
  RAPTwoLinesMenuTableViewCell *v4;
  RAPTwoLinesMenuTableViewCell *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection tableView](self, "tableView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RAPTwoLinesMenuTableViewCell reuseIdentifier](RAPTwoLinesMenuTableViewCell, "reuseIdentifier"));
  v4 = (RAPTwoLinesMenuTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dequeueReusableCellWithIdentifier:", v3));

  if (!v4)
  {
    v5 = [RAPTwoLinesMenuTableViewCell alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RAPTwoLinesMenuTableViewCell reuseIdentifier](RAPTwoLinesMenuTableViewCell, "reuseIdentifier"));
    v4 = -[RAPTwoLinesMenuTableViewCell initWithStyle:reuseIdentifier:](v5, "initWithStyle:reuseIdentifier:", 0, v6);

  }
  return v4;
}

- (void)registerClass:(Class)a3 forNamespacedReuseIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection tableView](self, "tableView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection namespacedReuseIdentifierWithSuffix:](self, "namespacedReuseIdentifierWithSuffix:", v6));

  objc_msgSend(v8, "registerClass:forCellReuseIdentifier:", a3, v7);
}

- (int64_t)rowsCount
{
  return 0;
}

- (id)cellForRowAtIndex:(int64_t)a3
{
  return 0;
}

- (int64_t)sectionIndex
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection dataSource](self, "dataSource"));
  v4 = objc_msgSend(v3, "indexOfSection:", self);

  return (int64_t)v4;
}

- (double)headerHeight
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection headerView](self, "headerView"));

  if (!v3)
    return UITableViewAutomaticDimension;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection headerView](self, "headerView"));
  objc_msgSend(v4, "setNeedsLayout");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection headerView](self, "headerView"));
  objc_msgSend(v5, "layoutIfNeeded");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection headerView](self, "headerView"));
  objc_msgSend(v6, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  v8 = v7;

  return v8;
}

- (double)footerHeight
{
  return UITableViewAutomaticDimension;
}

- (void)setHeaderView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_headerView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_headerView, a3);
    -[RAPTablePartSection didChange](self, "didChange");
    v5 = v6;
  }

}

- (void)setFooterView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_footerView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_footerView, a3);
    -[RAPTablePartSection didChange](self, "didChange");
    v5 = v6;
  }

}

- (void)setHeaderTitle:(id)a3
{
  NSString *v4;
  NSString *headerTitle;

  if (self->_headerTitle != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    headerTitle = self->_headerTitle;
    self->_headerTitle = v4;

    -[RAPTablePartSection _reloadHeaderFooterWithAnimation:](self, "_reloadHeaderFooterWithAnimation:", 5);
  }
}

- (void)setFooterTitle:(id)a3
{
  NSString *v4;
  NSString *footerTitle;

  if (self->_footerTitle != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    footerTitle = self->_footerTitle;
    self->_footerTitle = v4;

    -[RAPTablePartSection _reloadHeaderFooterWithAnimation:](self, "_reloadHeaderFooterWithAnimation:", 5);
  }
}

- (BOOL)canEditRowAtIndex:(int64_t)a3
{
  return 0;
}

- (void)didChange
{
  -[RAPTablePartSection reloadWithRowAnimation:](self, "reloadWithRowAnimation:", 5);
}

- (void)reloadWithRowAnimation:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = qword_1014D2248;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection tableView](self, "tableView"));
  LOBYTE(v5) = objc_msgSend((id)v5, "containsObject:", v6);

  if ((v5 & 1) == 0)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection tableView](self, "tableView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection dataSource](self, "dataSource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", objc_msgSend(v7, "indexOfSection:", self)));
    objc_msgSend(v9, "reloadSections:withRowAnimation:", v8, a3);

  }
}

- (void)_reloadHeaderFooterWithAnimation:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = qword_1014D2248;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection tableView](self, "tableView"));
  LOBYTE(v5) = objc_msgSend((id)v5, "containsObject:", v6);

  if ((v5 & 1) == 0)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection tableView](self, "tableView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartSection dataSource](self, "dataSource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", objc_msgSend(v7, "indexOfSection:", self)));
    objc_msgSend(v9, "_reloadSectionHeaderFooters:withRowAnimation:", v8, a3);

  }
}

- (BOOL)shouldHighlightCellForRowAtIndex:(int64_t)a3 tableIndexPath:(id)a4
{
  return 1;
}

- (UITableView)tableView
{
  return (UITableView *)objc_loadWeakRetained((id *)&self->_tableView);
}

- (UIView)headerView
{
  return self->_headerView;
}

- (UIView)footerView
{
  return self->_footerView;
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (NSString)footerTitle
{
  return self->_footerTitle;
}

- (RAPTablePart)partController
{
  return (RAPTablePart *)objc_loadWeakRetained((id *)&self->_partController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_partController);
  objc_storeStrong((id *)&self->_footerTitle, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_destroyWeak((id *)&self->_tableView);
}

@end
