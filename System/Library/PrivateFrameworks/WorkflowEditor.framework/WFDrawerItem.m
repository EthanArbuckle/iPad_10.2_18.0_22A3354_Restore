@implementation WFDrawerItem

- (WFDrawerItem)initWithDrawerPane:(id)a3
{
  id v4;
  WFDrawerItem *v5;
  WFDrawerItem *v6;
  WFDrawerItem *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFDrawerItem;
  v5 = -[WFDrawerItem init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_drawerPane, v4);
    v7 = v6;
  }

  return v6;
}

- (UISearchBar)searchBar
{
  void *v2;
  void *v3;

  -[WFDrawerItem drawerPane](self, "drawerPane");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UISearchBar *)v3;
}

- (void)setSearchBar:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFDrawerItem drawerPane](self, "drawerPane");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSearchBar:", v4);

}

- (NSString)title
{
  void *v2;
  void *v3;

  -[WFDrawerItem drawerPane](self, "drawerPane");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(a3, "copy");
  -[WFDrawerItem drawerPane](self, "drawerPane");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

}

- (UIView)titleView
{
  void *v2;
  void *v3;

  -[WFDrawerItem drawerPane](self, "drawerPane");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (void)setTitleView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFDrawerItem drawerPane](self, "drawerPane");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitleView:", v4);

}

- (double)fauxHeaderHeight
{
  void *v2;
  double v3;
  double v4;

  -[WFDrawerItem drawerPane](self, "drawerPane");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fauxHeaderHeight");
  v4 = v3;

  return v4;
}

- (void)setFauxHeaderHeight:(double)a3
{
  id v4;

  -[WFDrawerItem drawerPane](self, "drawerPane");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFauxHeaderHeight:", a3);

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WFDrawerItem drawerPane](self, "drawerPane");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollViewWillBeginDragging:", v4);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WFDrawerItem drawerPane](self, "drawerPane");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollViewDidScroll:", v4);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  id v9;
  void *v10;
  id v11;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  -[WFDrawerItem drawerPane](self, "drawerPane");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "container");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v9, a5, x, y);

}

- (WFDrawerPane)drawerPane
{
  return (WFDrawerPane *)objc_loadWeakRetained((id *)&self->_drawerPane);
}

- (void)setDrawerPane:(id)a3
{
  objc_storeWeak((id *)&self->_drawerPane, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_drawerPane);
}

@end
