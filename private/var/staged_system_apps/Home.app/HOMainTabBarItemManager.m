@implementation HOMainTabBarItemManager

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  void *v5;
  HOMainTabItemProvider *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = -[HOMainTabItemProvider initWithHome:]([HOMainTabItemProvider alloc], "initWithHome:", v4);

  -[HOMainTabBarItemManager setTabItemProvider:](self, "setTabItemProvider:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarItemManager tabItemProvider](self, "tabItemProvider"));
  objc_msgSend(v5, "addObject:", v7);

  return v5;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = objc_msgSend(objc_alloc((Class)HFMutableItemSection), "initWithIdentifier:", CFSTR("HOMainTabBarItemManagerTabSectionIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarItemManager tabItemProvider](self, "tabItemProvider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "orderedTabItems"));
  objc_msgSend(v6, "setItems:filteringToDisplayedItems:", v8, v4);

  objc_msgSend(v5, "addObject:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarItemManager roomItemProvider](self, "roomItemProvider"));

  if (v9)
  {
    v10 = objc_msgSend(objc_alloc((Class)HFMutableItemSection), "initWithIdentifier:", CFSTR("HOMainTabBarItemManagerRoomSectionIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HOMainTabBarItemManager roomItemProvider](self, "roomItemProvider"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "items"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allObjects"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[HFItemSection defaultItemComparator](HFItemSection, "defaultItemComparator"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sortedArrayUsingComparator:", v14));
    objc_msgSend(v10, "setItems:filteringToDisplayedItems:", v15, v4);

    objc_msgSend(v5, "addObject:", v10);
  }

  return v5;
}

- (HOMainTabItemProvider)tabItemProvider
{
  return self->_tabItemProvider;
}

- (HFRoomItemProvider)roomItemProvider
{
  return self->_roomItemProvider;
}

- (void)setTabItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_tabItemProvider, a3);
}

- (void)setRoomItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_roomItemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabItemProvider, 0);
  objc_storeStrong((id *)&self->_roomItemProvider, 0);
}

@end
