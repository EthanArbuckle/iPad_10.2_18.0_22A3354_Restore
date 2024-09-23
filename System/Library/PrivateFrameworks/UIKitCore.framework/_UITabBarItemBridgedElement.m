@implementation _UITabBarItemBridgedElement

- (_UITabBarItemBridgedElement)initWithViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _UITabBarItemBridgedElement *v7;
  uint64_t v8;
  UITabBarItem *tabBarItem;
  UITabBarItem *v10;
  uint64_t v11;
  objc_super v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)_UITabBarItemBridgedElement;
  v7 = -[_UITabElement initWithIdentifier:title:image:](&v13, sel_initWithIdentifier_title_image_, v6, &stru_1E16EDF20, 0);

  if (v7)
  {
    objc_msgSend(v4, "tabBarItem");
    v8 = objc_claimAutoreleasedReturnValue();
    tabBarItem = v7->_tabBarItem;
    v7->_tabBarItem = (UITabBarItem *)v8;

    v10 = v7->_tabBarItem;
    if (v10)
    {
      objc_storeWeak((id *)&v10->_changeObserver, v7);
      v11 = (uint64_t)v7->_tabBarItem;
    }
    else
    {
      v11 = 0;
    }
    -[UITabBarItem set_fallbackSourceItem:](v11, v7);
    -[_UITabElement _setViewController:](v7, "_setViewController:", v4);
  }

  return v7;
}

- (void)_reloadTabBarItem
{
  _UITabBarItemBridgedElement *v3;
  UITabBarItem *tabBarItem;
  UITabBarItem *v5;
  void *v6;
  UITabBarItem *v7;
  UITabBarItem *v8;
  UITabBarItem *v9;
  UITabBarItem *v10;

  -[UITabBarItem _changeObserver]((id *)&self->_tabBarItem->super.super.isa);
  v3 = (_UITabBarItemBridgedElement *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
  {
    tabBarItem = self->_tabBarItem;
    if (tabBarItem)
    {
      objc_storeWeak((id *)&tabBarItem->_changeObserver, 0);
      v5 = self->_tabBarItem;
    }
    else
    {
      v5 = 0;
    }
    -[UITabBarItem set_fallbackSourceItem:]((uint64_t)v5, 0);
  }
  -[_UITabElement _viewController](self, "_viewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tabBarItem");
  v7 = (UITabBarItem *)objc_claimAutoreleasedReturnValue();
  v8 = self->_tabBarItem;
  self->_tabBarItem = v7;

  v9 = self->_tabBarItem;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_changeObserver, self);
    v10 = self->_tabBarItem;
  }
  else
  {
    v10 = 0;
  }
  -[UITabBarItem set_fallbackSourceItem:]((uint64_t)v10, self);
}

- (id)title
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  -[_UITabBarItemBridgedElement titleForStyle:state:](self, "titleForStyle:state:", 1, 0);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E16EDF20;
  v4 = v2;

  return v4;
}

- (id)image
{
  return -[_UITabBarItemBridgedElement imageForStyle:state:](self, "imageForStyle:state:", 1, 0);
}

- (id)badgeValue
{
  void *v2;
  void *v3;

  -[_UITabBarItemBridgedElement tabBarItem](self, "tabBarItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "badgeValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_resolvedTabBarItemSourceItemForPopoverPresentationControllerSourceItem
{
  return -[UITabBarItem _tabBarButton]((id *)&self->_tabBarItem->super.super.isa);
}

- (void)_updateView
{
  -[UITabBarItem _updateView](self->_tabBarItem, "_updateView");
}

- (BOOL)_isBridgedItem
{
  return 1;
}

- (BOOL)isEnabled
{
  void *v2;
  char v3;

  -[_UITabBarItemBridgedElement tabBarItem](self, "tabBarItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  return v3;
}

- (BOOL)isSelected
{
  void *v2;
  char v3;

  -[_UITabBarItemBridgedElement tabBarItem](self, "tabBarItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSelected");

  return v3;
}

- (BOOL)isSpringLoaded
{
  void *v2;
  char v3;

  -[_UITabBarItemBridgedElement tabBarItem](self, "tabBarItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSpringLoaded");

  return v3;
}

- (int64_t)preferredPlacement
{
  void *v2;
  int64_t v3;

  -[_UITabBarItemBridgedElement tabBarItem](self, "tabBarItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "preferredPlacement");

  return v3;
}

- (id)titleForStyle:(int64_t)a3 state:(int64_t)a4
{
  void *v6;
  void *v7;

  -[_UITabBarItemBridgedElement tabBarItem](self, "tabBarItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleForStyle:state:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)badgeForStyle:(int64_t)a3 state:(int64_t)a4
{
  void *v6;
  void *v7;

  -[_UITabBarItemBridgedElement tabBarItem](self, "tabBarItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "badgeForStyle:state:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)imageForStyle:(int64_t)a3 state:(int64_t)a4
{
  void *v6;
  void *v7;

  -[_UITabBarItemBridgedElement tabBarItem](self, "tabBarItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageForStyle:state:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (UIEdgeInsets)imageInsetsForStyle:(int64_t)a3 state:(int64_t)a4
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  -[_UITabBarItemBridgedElement tabBarItem](self, "tabBarItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageInsetsForStyle:state:", a3, a4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (id)standardAppearance
{
  void *v2;
  void *v3;

  -[_UITabBarItemBridgedElement tabBarItem](self, "tabBarItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "standardAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)scrollEdgeAppearance
{
  void *v2;
  void *v3;

  -[_UITabBarItemBridgedElement tabBarItem](self, "tabBarItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollEdgeAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_tabDataProviderContentDidChange:(id)a3
{
  id v4;

  -[UITab _tabModel](self, "_tabModel", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tabContentDidChange:", self);

}

- (id)accessibilityIdentifier
{
  void *v2;
  void *v3;

  -[_UITabBarItemBridgedElement tabBarItem](self, "tabBarItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityAttributedLabel
{
  void *v2;
  void *v3;

  -[_UITabBarItemBridgedElement tabBarItem](self, "tabBarItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityAttributedLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UITabBarItem)tabBarItem
{
  return self->_tabBarItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabBarItem, 0);
}

@end
