@implementation UITabBarItemProxy

- (UITabBarItemProxy)initWithItem:(id)a3 inTabBar:(id)a4
{
  id v7;
  id v8;
  UITabBarItemProxy *v9;
  UITabBarItemProxy *v10;
  UITabBarItem **p_item;
  uint64_t v12;
  UITabBarButton *view;
  void *v14;
  uint64_t v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)UITabBarItemProxy;
  v9 = -[UITabBarItemProxy init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    p_item = &v9->_item;
    objc_storeStrong((id *)&v9->_item, a3);
    objc_msgSend(v7, "_createViewForTabBar:asProxyView:", v8, 1);
    v12 = objc_claimAutoreleasedReturnValue();
    view = v10->_view;
    v10->_view = (UITabBarButton *)v12;

    objc_msgSend(v8, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "userInterfaceIdiom");

    if (v15 == 6)
    {
      if (*p_item)
        objc_storeWeak((id *)&(*p_item)->_changeObserver, v8);
    }
  }

  return v10;
}

- (void)setSelected:(BOOL)a3
{
  -[UITabBarButton _setSelected:](self->_view, "_setSelected:", a3);
}

- (id)item
{
  return self->_item;
}

- (id)view
{
  return self->_view;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
