@implementation TUIAuxiliaryViewState

- (TUIAuxiliaryViewState)initWithSearchControllerDelegate:(id)a3 hostingController:(id)a4 viewVisibilityController:(id)a5
{
  id v8;
  id v9;
  id v10;
  TUIAuxiliaryViewState *v11;
  TUIAuxiliaryViewState *v12;
  NSMapTable *v13;
  NSMapTable *barButtonItems;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)TUIAuxiliaryViewState;
  v11 = -[TUIAuxiliaryViewState init](&v16, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_searchControllerDelegate, v8);
    objc_storeStrong((id *)&v12->_hostingController, a4);
    objc_storeStrong((id *)&v12->_viewVisibilityController, a5);
    v13 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 0, 5, 3);
    barButtonItems = v12->_barButtonItems;
    v12->_barButtonItems = v13;

  }
  return v12;
}

- (void)updateWithRenderModel:(id)a3 factory:(id)a4 triggerManager:(id)a5 promoteAccessory:(BOOL)a6
{
  _BOOL4 v6;
  id v11;
  id v12;
  id v13;
  NSArray *v14;
  NSArray *rightItems;
  NSArray *v16;
  NSArray *leftItems;
  NSString *v18;
  NSString *title;
  NSString *v20;
  NSString *largeTitle;
  UIView *v22;
  UIView *largeTitleAccessoryView;
  void *v24;
  void *v25;
  NSArray *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSArray *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *v38;
  UIView *v39;
  UIBarButtonItem *largeTitleAccessoryItem;
  void *v41;
  void *v42;
  id WeakRetained;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];

  v6 = a6;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  objc_storeStrong((id *)&self->_renderModel, a3);
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue(-[TUIAuxiliaryViewState _renderRightNavigationItemsWithFactory:triggerManager:](self, "_renderRightNavigationItemsWithFactory:triggerManager:", v12, v13));
  rightItems = self->_rightItems;
  self->_rightItems = v14;

  v16 = (NSArray *)objc_claimAutoreleasedReturnValue(-[TUIAuxiliaryViewState _renderLeftNavigationItemsWithFactory:triggerManager:](self, "_renderLeftNavigationItemsWithFactory:triggerManager:", v12, v13));
  leftItems = self->_leftItems;
  self->_leftItems = v16;

  v18 = (NSString *)objc_claimAutoreleasedReturnValue(-[TUIAuxiliaryViewState _renderNavigationBarTitle:](self, "_renderNavigationBarTitle:", v13));
  title = self->_title;
  self->_title = v18;

  v20 = (NSString *)objc_claimAutoreleasedReturnValue(-[TUIAuxiliaryViewState _renderLargeNavigationBarTitle:](self, "_renderLargeNavigationBarTitle:", v13));
  largeTitle = self->_largeTitle;
  self->_largeTitle = v20;

  v22 = (UIView *)objc_claimAutoreleasedReturnValue(-[TUIAuxiliaryViewState _renderLargeTitleAccessoryViewWithFactory:](self, "_renderLargeTitleAccessoryViewWithFactory:", v12));
  largeTitleAccessoryView = self->_largeTitleAccessoryView;
  self->_largeTitleAccessoryView = v22;

  if (self->_largeTitleAccessoryView && v6)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAuxiliaryViewState _axBarButtonItemForLargeTitleAccessoryView:](self, "_axBarButtonItemForLargeTitleAccessoryView:"));
    if (v24)
    {
      v45 = v11;
      if (!self->_rightItems)
      {
        self->_rightItems = (NSArray *)&__NSArray0__struct;

      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "accessibilityIdentifier"));
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v26 = self->_rightItems;
      v27 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v51;
LABEL_8:
        v30 = 0;
        while (1)
        {
          if (*(_QWORD *)v51 != v29)
            objc_enumerationMutation(v26);
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * v30), "accessibilityIdentifier"));

          if (v31 == v25)
            break;
          if (v28 == (id)++v30)
          {
            v28 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
            if (v28)
              goto LABEL_8;
            goto LABEL_14;
          }
        }
      }
      else
      {
LABEL_14:

        v32 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObject:](self->_rightItems, "arrayByAddingObject:", v24));
        v26 = self->_rightItems;
        self->_rightItems = v32;
      }

      v33 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelNavigationItem hostingIdentifiers](self->_largeTitleAccessoryModel, "hostingIdentifiers"));
      if (v33)
      {
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelNavigationItem hostingIdentifiers](self->_largeTitleAccessoryModel, "hostingIdentifiers"));
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v47;
          do
          {
            v38 = 0;
            do
            {
              if (*(_QWORD *)v47 != v37)
                objc_enumerationMutation(v34);
              -[TUIAuxiliaryViewState setBarButtonItem:forHostingIdentifier:](self, "setBarButtonItem:forHostingIdentifier:", v24, *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)v38));
              v38 = (char *)v38 + 1;
            }
            while (v36 != v38);
            v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
          }
          while (v36);
        }

      }
      v11 = v45;
    }
    v39 = self->_largeTitleAccessoryView;
    self->_largeTitleAccessoryView = 0;

  }
  else
  {
    largeTitleAccessoryItem = self->_largeTitleAccessoryItem;
    self->_largeTitleAccessoryItem = 0;

  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAuxiliaryViewState searchController](self, "searchController"));

  if (v41)
  {
    -[TUIAuxiliaryViewState _updateSearchController:](self, "_updateSearchController:", self->_searchController);
  }
  else
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAuxiliaryViewState _renderSearchControllerWithFactory:](self, "_renderSearchControllerWithFactory:", v12));
    if (v42)
    {
      objc_storeStrong((id *)&self->_searchController, v42);
      WeakRetained = objc_loadWeakRetained((id *)&self->_searchControllerDelegate);
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[TUISearchController searchController](self->_searchController, "searchController"));
      objc_msgSend(v44, "setDelegate:", WeakRetained);

    }
  }
  -[TUIAuxiliaryViewState _setupHosting](self, "_setupHosting");

}

- (void)_setupHosting
{
  void *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *largeTitleViewHostMap;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  _TUIAuxiliaryViewHost *v12;
  _TUIAuxiliaryViewHost *v13;
  UIView *v14;
  UIView *largeTitleAccessoryView;
  _TUIAuxiliaryViewHost *v16;
  NSMutableDictionary *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  if (self->_largeTitleAccessoryView
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelNavigationItem hostingIdentifiers](self->_largeTitleAccessoryModel, "hostingIdentifiers")), v3, v3))
  {
    if (!self->_largeTitleViewHostMap)
    {
      v4 = objc_opt_new(NSMutableDictionary);
      largeTitleViewHostMap = self->_largeTitleViewHostMap;
      self->_largeTitleViewHostMap = v4;

    }
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelNavigationItem hostingIdentifiers](self->_largeTitleAccessoryModel, "hostingIdentifiers", 0));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          v12 = (_TUIAuxiliaryViewHost *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_largeTitleViewHostMap, "objectForKeyedSubscript:", v11));
          v13 = v12;
          if (!v12
            || (v14 = (UIView *)objc_claimAutoreleasedReturnValue(-[_TUIAuxiliaryViewHost view](v12, "view")),
                largeTitleAccessoryView = self->_largeTitleAccessoryView,
                v14,
                v14 != largeTitleAccessoryView))
          {
            v16 = -[_TUIAuxiliaryViewHost initWithIdentifier:hostingController:viewVisibilityController:view:]([_TUIAuxiliaryViewHost alloc], "initWithIdentifier:hostingController:viewVisibilityController:view:", v11, self->_hostingController, self->_viewVisibilityController, self->_largeTitleAccessoryView);

            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_largeTitleViewHostMap, "setObject:forKeyedSubscript:", v16, v11);
            v13 = v16;
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

  }
  else
  {
    v17 = self->_largeTitleViewHostMap;
    self->_largeTitleViewHostMap = 0;

  }
}

- (id)navigationBarItemMatchingQuery:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  TUIAuxiliaryViewState *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_118F7C;
  v17 = sub_118F8C;
  v18 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelAuxiliary navigationItems](self->_renderModel, "navigationItems"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_118F94;
  v9[3] = &unk_241BB0;
  v6 = v4;
  v11 = self;
  v12 = &v13;
  v10 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

- (void)setBarButtonItem:(id)a3 forIdentifier:(id)a4
{
  -[NSMapTable setObject:forKey:](self->_barButtonItems, "setObject:forKey:", a3, a4);
}

- (void)setBarButtonItem:(id)a3 forHostingIdentifier:(id)a4
{
  id v6;
  NSMutableDictionary *itemHostMap;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  _TUIAuxiliaryItemHost *v10;
  _TUIAuxiliaryItemHost *v11;
  id v12;
  _TUIAuxiliaryItemHost *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  itemHostMap = self->_itemHostMap;
  if (!itemHostMap)
  {
    v8 = objc_opt_new(NSMutableDictionary);
    v9 = self->_itemHostMap;
    self->_itemHostMap = v8;

    itemHostMap = self->_itemHostMap;
  }
  v10 = (_TUIAuxiliaryItemHost *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](itemHostMap, "objectForKeyedSubscript:", v6));
  v11 = v10;
  if (!v10
    || (v12 = (id)objc_claimAutoreleasedReturnValue(-[_TUIAuxiliaryItemHost item](v10, "item")),
        v12,
        v12 != v14))
  {
    v13 = -[_TUIAuxiliaryItemHost initWithIdentifier:hostingController:item:]([_TUIAuxiliaryItemHost alloc], "initWithIdentifier:hostingController:item:", v6, self->_hostingController, v14);

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_itemHostMap, "setObject:forKeyedSubscript:", v13, v6);
    v11 = v13;
  }

}

- (BOOL)configureNavigationItem:(id)a3 scrollView:(id)a4 extraLeftItems:(id)a5 extraRightItems:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSArray *v14;
  NSArray *v15;
  BOOL v16;
  NSArray *v17;
  uint64_t v18;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  BOOL v26;
  void *v27;
  void *v28;
  BOOL v29;
  void *v30;
  NSArray *v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = self->_leftItems;
  v15 = self->_rightItems;
  v16 = -[NSArray count](v15, "count") || -[NSArray count](v14, "count") || self->_largeTitleAccessoryView != 0;
  if (objc_msgSend(v12, "count"))
  {
    if (v14)
      v17 = v14;
    else
      v17 = (NSArray *)&__NSArray0__struct;
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v17));

    v14 = (NSArray *)v18;
  }
  if (objc_msgSend(v13, "count"))
  {
    if (v15)
      v19 = v15;
    else
      v19 = (NSArray *)&__NSArray0__struct;
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v19));

    v15 = (NSArray *)v20;
  }
  if (self->_title || self->_largeTitle)
    objc_msgSend(v10, "setTitle:");
  objc_msgSend(v10, "_setLargeTitleAccessoryView:alignToBaseline:", self->_largeTitleAccessoryView, 0);
  objc_msgSend(v10, "setRightBarButtonItems:animated:", v15, 0);
  objc_msgSend(v10, "setLeftBarButtonItems:animated:", v14, 0);
  v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "window"));
  if (v21)
  {
    v22 = (void *)v21;
    v32 = v14;
    v23 = v13;
    v24 = v12;
    v25 = v11;
    v26 = v16;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "searchController"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[TUISearchController searchController](self->_searchController, "searchController"));

    v29 = v27 == v28;
    v16 = v26;
    v11 = v25;
    v12 = v24;
    v13 = v23;
    v14 = v32;
    if (!v29)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[TUISearchController searchController](self->_searchController, "searchController"));
      objc_msgSend(v10, "setSearchController:", v30);

      objc_msgSend(v11, "scrollRectToVisible:animated:", 0, 0.0, -1.0, 1.0, 1.0);
    }
  }
  objc_msgSend(v10, "setHidesSearchBarWhenScrolling:", 0);

  return v16;
}

- (id)_axBarButtonItemForLargeTitleAccessoryView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UIBarButtonItem *largeTitleAccessoryItem;
  UIBarButtonItem *v8;
  UIBarButtonItem *v9;
  UIBarButtonItem *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_accessibilityFindUnsortedSubviewDescendantsPassingTest:", &stru_241BF0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  if (v6)
  {
    largeTitleAccessoryItem = self->_largeTitleAccessoryItem;
    if (!largeTitleAccessoryItem)
    {
      v8 = (UIBarButtonItem *)objc_alloc_init((Class)UIBarButtonItem);
      v9 = self->_largeTitleAccessoryItem;
      self->_largeTitleAccessoryItem = v8;

      largeTitleAccessoryItem = self->_largeTitleAccessoryItem;
    }
    -[UIBarButtonItem setCustomView:](largeTitleAccessoryItem, "setCustomView:", v4);
    v10 = self->_largeTitleAccessoryItem;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)configureSearchControllerIfNeededForNavigationItem:(id)a3
{
  TUISearchController *searchController;
  id v4;
  id v5;

  searchController = self->_searchController;
  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[TUISearchController searchController](searchController, "searchController"));
  objc_msgSend(v4, "setSearchController:", v5);

}

- (id)_renderRightNavigationItemsWithFactory:(id)a3 triggerManager:(id)a4
{
  return -[TUIAuxiliaryViewState _renderItemsForButtonTypeWithFactory:type:triggerManager:](self, "_renderItemsForButtonTypeWithFactory:type:triggerManager:", a3, 4, a4);
}

- (id)_renderLeftNavigationItemsWithFactory:(id)a3 triggerManager:(id)a4
{
  return -[TUIAuxiliaryViewState _renderItemsForButtonTypeWithFactory:type:triggerManager:](self, "_renderItemsForButtonTypeWithFactory:type:triggerManager:", a3, 3, a4);
}

- (id)_renderItemsForButtonTypeWithFactory:(id)a3 type:(unint64_t)a4 triggerManager:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  id v26;
  id v28;
  id v29;
  id v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];

  v30 = a3;
  v29 = a5;
  v28 = objc_alloc_init((Class)NSMutableArray);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[TUIRenderModelAuxiliary navigationItems](self->_renderModel, "navigationItems"));
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v12, "itemType") == (id)a4)
        {
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "observeTrigger"));
          if (!v13
            || (v14 = (void *)v13,
                v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "observeTrigger")),
                v16 = objc_msgSend(v29, "stateForTriggerWithName:", v15),
                v17 = objc_msgSend(v12, "observeTriggerValue"),
                v15,
                v14,
                v16 == v17))
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "renderItemWithFactory:", v30));
            if (v18)
            {
              objc_msgSend(v28, "addObject:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
              -[TUIAuxiliaryViewState setBarButtonItem:forIdentifier:](self, "setBarButtonItem:forIdentifier:", v18, v19);

              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "hostingIdentifiers"));
              if (v20)
              {
                v34 = 0u;
                v35 = 0u;
                v32 = 0u;
                v33 = 0u;
                v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "hostingIdentifiers"));
                v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
                if (v22)
                {
                  v23 = v22;
                  v24 = *(_QWORD *)v33;
                  do
                  {
                    for (j = 0; j != v23; j = (char *)j + 1)
                    {
                      if (*(_QWORD *)v33 != v24)
                        objc_enumerationMutation(v21);
                      -[TUIAuxiliaryViewState setBarButtonItem:forHostingIdentifier:](self, "setBarButtonItem:forHostingIdentifier:", v18, *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)j));
                    }
                    v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
                  }
                  while (v23);
                }

              }
            }

          }
        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v9);
  }

  v26 = objc_msgSend(v28, "copy");
  return v26;
}

- (id)_renderNavigationBarTitle:(id)a3
{
  return -[TUIAuxiliaryViewState _renderTitleForType:](self, "_renderTitleForType:", 1);
}

- (id)_renderLargeNavigationBarTitle:(id)a3
{
  return -[TUIAuxiliaryViewState _renderTitleForType:](self, "_renderTitleForType:", 2);
}

- (id)_renderTitleForType:(unint64_t)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelAuxiliary navigationItems](self->_renderModel, "navigationItems", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "itemType") == (id)a3)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (double)navigationBarBackgroundOpacity:(id)a3 anchors:(id)a4 scrollView:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  double v13;
  void *i;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  id obj;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];

  v37 = a3;
  v8 = a4;
  v9 = a5;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[TUIRenderModelAuxiliary navigationItems](self->_renderModel, "navigationItems"));
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v39;
    v13 = NAN;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v12)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v15, "navigationBarBackgroundOpacity");
        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "observeTrigger"));
        if (!v16
          || (v17 = (void *)v16,
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "observeTrigger")),
              v19 = objc_msgSend(v37, "stateForTriggerWithName:", v18),
              v20 = objc_msgSend(v15, "observeTriggerValue"),
              v18,
              v17,
              v19 == v20))
        {
          objc_msgSend(v15, "navigationBarBackgroundOpacity");
          v13 = v32;
          goto LABEL_19;
        }
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "observeTrigger"));

        if (v8 && v21 && v9)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "observeTrigger"));
          objc_msgSend(v8, "offsetForTriggerWithName:inScrollView:", v22, v9);
          v24 = v23;

          objc_msgSend(v9, "contentOffset");
          v26 = v25;
          if (objc_msgSend(v15, "ignoreInsetsForOpacityTrigger"))
          {
            objc_msgSend(v9, "safeAreaInsets");
            v28 = v27;
            objc_msgSend(v9, "contentInset");
            v30 = v28 + v29;
            v26 = v26 + v30;
            v24 = v24 + v30;
          }
          objc_msgSend(v15, "navigationBarBackgroundOpacity");
          v13 = v26 / v24 * v31;
        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v11)
        continue;
      break;
    }
  }
  else
  {
    v13 = NAN;
  }
LABEL_19:

  v33 = fmax(v13, 0.0);
  if (v33 > 1.0)
    v33 = 1.0;
  v34 = v33;

  return v34;
}

- (id)_renderLargeTitleAccessoryViewWithFactory:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  UIView *v11;
  void *v12;
  UIView *largeTitleAccessoryContainer;
  UIView *v14;
  UIView *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  double y;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *k;
  uint64_t v29;
  uint64_t v30;
  UIView *v31;
  id v32;
  UIView *v33;
  void *v34;
  void *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];

  v4 = a3;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelAuxiliary navigationItems](self->_renderModel, "navigationItems"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v46;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v46 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "itemType") == (char *)&dword_4 + 1)
        {
          objc_storeStrong((id *)&self->_largeTitleAccessoryModel, v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "renderViewWithFactory:", v4));
          largeTitleAccessoryContainer = self->_largeTitleAccessoryContainer;
          if (!largeTitleAccessoryContainer)
          {
            v14 = (UIView *)objc_alloc_init((Class)UIView);
            v15 = self->_largeTitleAccessoryContainer;
            self->_largeTitleAccessoryContainer = v14;

            largeTitleAccessoryContainer = self->_largeTitleAccessoryContainer;
          }
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](largeTitleAccessoryContainer, "subviews"));
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v42;
            do
            {
              for (j = 0; j != v18; j = (char *)j + 1)
              {
                if (*(_QWORD *)v42 != v19)
                  objc_enumerationMutation(v16);
                objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)j), "removeFromSuperview");
              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
            }
            while (v18);
          }

          -[UIView addSubview:](self->_largeTitleAccessoryContainer, "addSubview:", v12);
          y = CGPointZero.y;
          objc_msgSend(v12, "bounds");
          -[UIView setBounds:](self->_largeTitleAccessoryContainer, "setBounds:", CGPointZero.x, y);
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelNavigationItem axAttributes](self->_largeTitleAccessoryModel, "axAttributes"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "axLabel"));

          if (v23)
          {
            v39 = 0u;
            v40 = 0u;
            v37 = 0u;
            v38 = 0u;
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIView interactions](self->_largeTitleAccessoryContainer, "interactions", 0));
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
            if (v25)
            {
              v26 = v25;
              v27 = *(_QWORD *)v38;
              do
              {
                for (k = 0; k != v26; k = (char *)k + 1)
                {
                  if (*(_QWORD *)v38 != v27)
                    objc_enumerationMutation(v24);
                  v29 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)k);
                  v30 = objc_opt_class(UILargeContentViewerInteraction);
                  if ((objc_opt_isKindOfClass(v29, v30) & 1) != 0)
                    -[UIView removeInteraction:](self->_largeTitleAccessoryContainer, "removeInteraction:", v29);
                }
                v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
              }
              while (v26);
            }

            v31 = self->_largeTitleAccessoryContainer;
            v32 = objc_alloc_init((Class)UILargeContentViewerInteraction);
            -[UIView addInteraction:](v31, "addInteraction:", v32);

            -[UIView setShowsLargeContentViewer:](self->_largeTitleAccessoryContainer, "setShowsLargeContentViewer:", 1);
            v33 = self->_largeTitleAccessoryContainer;
            v34 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelNavigationItem axAttributes](self->_largeTitleAccessoryModel, "axAttributes"));
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "axLabel"));
            -[UIView setLargeContentTitle:](v33, "setLargeContentTitle:", v35);

          }
          v11 = self->_largeTitleAccessoryContainer;

          goto LABEL_31;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_31:

  return v11;
}

- (id)_renderSearchControllerWithFactory:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelAuxiliary navigationItems](self->_renderModel, "navigationItems", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "itemType") == (char *)&dword_4 + 2)
        {
          v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "renderSearchControllerWithFactory:", v4));
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_updateSearchController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelAuxiliary navigationItems](self->_renderModel, "navigationItems", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "itemType") == (char *)&dword_4 + 2)
        {
          objc_msgSend(v4, "configureWithModel:", v10);
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

}

- (TUISearchController)searchController
{
  return self->_searchController;
}

- (UISearchControllerDelegate)searchControllerDelegate
{
  return (UISearchControllerDelegate *)objc_loadWeakRetained((id *)&self->_searchControllerDelegate);
}

- (TUIHostingController)hostingController
{
  return self->_hostingController;
}

- (TUIViewVisibilityController)viewVisibilityController
{
  return self->_viewVisibilityController;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)largeTitle
{
  return self->_largeTitle;
}

- (UIView)largeTitleAccessoryView
{
  return self->_largeTitleAccessoryView;
}

- (UIBarButtonItem)largeTitleAccessoryItem
{
  return self->_largeTitleAccessoryItem;
}

- (NSArray)leftItems
{
  return self->_leftItems;
}

- (NSArray)rightItems
{
  return self->_rightItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightItems, 0);
  objc_storeStrong((id *)&self->_leftItems, 0);
  objc_storeStrong((id *)&self->_largeTitleAccessoryItem, 0);
  objc_storeStrong((id *)&self->_largeTitleAccessoryView, 0);
  objc_storeStrong((id *)&self->_largeTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_viewVisibilityController, 0);
  objc_storeStrong((id *)&self->_hostingController, 0);
  objc_destroyWeak((id *)&self->_searchControllerDelegate);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_largeTitleAccessoryContainer, 0);
  objc_storeStrong((id *)&self->_largeTitleAccessoryModel, 0);
  objc_storeStrong((id *)&self->_largeTitleViewHostMap, 0);
  objc_storeStrong((id *)&self->_itemHostMap, 0);
  objc_storeStrong((id *)&self->_barButtonItems, 0);
  objc_storeStrong((id *)&self->_renderModel, 0);
}

@end
