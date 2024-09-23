@implementation _UITabModel

- (void)setTabItems:(id)a3
{
  -[_UITabModel setTabItems:inferSelection:](self, "setTabItems:inferSelection:", a3, 1);
}

- (void)setTabItems:(id)a3 inferSelection:(BOOL)a4
{
  _BOOL4 v4;
  NSArray *v7;
  NSArray *tabItems;
  unint64_t v9;
  NSArray *v10;
  NSArray *v11;
  uint64_t v12;
  NSArray *v13;
  UITab *v14;
  UITab *v15;
  char v16;
  UITab *v17;
  void *v18;
  UITab *selectedItem;
  UITab *v20;
  void *v21;
  _QWORD v22[5];
  UITab *v23;
  char v24;
  _QWORD v25[5];
  _QWORD v26[6];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _QWORD v33[5];

  v4 = a4;
  v7 = (NSArray *)a3;
  tabItems = self->_tabItems;
  if (tabItems != v7)
  {
    -[NSArray enumerateObjectsUsingBlock:](tabItems, "enumerateObjectsUsingBlock:", &__block_literal_global_323);
    if ((*(_BYTE *)&self->_flags & 5) == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITabModel.m"), 62, CFSTR("Attempt to modify model while broadcasting a change to the model."));

    }
    if (self->_selectedItem)
      v9 = -[NSArray indexOfObject:](self->_tabItems, "indexOfObject:");
    else
      v9 = 0x7FFFFFFFFFFFFFFFLL;
    v10 = (NSArray *)-[NSArray copy](v7, "copy");
    v11 = self->_tabItems;
    self->_tabItems = v10;

    v12 = MEMORY[0x1E0C809B0];
    v13 = self->_tabItems;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __42___UITabModel_setTabItems_inferSelection___block_invoke_2;
    v33[3] = &unk_1E16CB518;
    v33[4] = self;
    -[NSArray enumerateObjectsUsingBlock:](v13, "enumerateObjectsUsingBlock:", v33);
    v14 = self->_selectedItem;
    v15 = self->_selectedItem;
    if (!_tabElementsContainsTab(v7, v14))
    {

      v14 = 0;
    }
    v16 = 0;
    if (!v14 && v4)
    {
      if (-[UITab _isMoreTab](self->_selectedItem, "_isMoreTab"))
      {
        v16 = 0;
      }
      else
      {
        v27 = 0;
        v28 = &v27;
        v29 = 0x3032000000;
        v30 = __Block_byref_object_copy__122;
        v31 = __Block_byref_object_dispose__122;
        v32 = 0;
        v26[0] = v12;
        v26[1] = 3221225472;
        v26[2] = __42___UITabModel_setTabItems_inferSelection___block_invoke_4;
        v26[3] = &unk_1E16D3C20;
        v26[4] = self;
        v26[5] = &v27;
        -[NSArray enumerateObjectsUsingBlock:](v7, "enumerateObjectsUsingBlock:", v26);
        if (v9 >= -[NSArray count](v7, "count"))
        {
          v18 = (void *)v28[5];
          if (v18)
          {
            v17 = v18;
          }
          else
          {
            -[NSArray firstObject](v7, "firstObject");
            v17 = (UITab *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          -[NSArray objectAtIndex:](v7, "objectAtIndex:", v9);
          v17 = (UITab *)objc_claimAutoreleasedReturnValue();
        }
        selectedItem = self->_selectedItem;
        self->_selectedItem = v17;

        _Block_object_dispose(&v27, 8);
        v16 = 1;
      }
    }
    v25[0] = v12;
    v25[1] = 3221225472;
    v25[2] = __42___UITabModel_setTabItems_inferSelection___block_invoke_2_5;
    v25[3] = &unk_1E16D3C48;
    v25[4] = self;
    -[_UITabModel _sendToObservers:allowUpdatesDuringBroadcast:](self, "_sendToObservers:allowUpdatesDuringBroadcast:", v25, 0);
    v22[0] = v12;
    v22[1] = 3221225472;
    v22[2] = __42___UITabModel_setTabItems_inferSelection___block_invoke_3;
    v22[3] = &unk_1E16B4008;
    v24 = v16;
    v22[4] = self;
    v23 = v15;
    v20 = v15;
    -[_UITabModel _updateSelectedLeafPerformBeforeNotifyingBlock:](self, "_updateSelectedLeafPerformBeforeNotifyingBlock:", v22);
    -[_UITabModel _inferCurrentEditability](self, "_inferCurrentEditability");

  }
}

- (void)replaceItemAtIndex:(int64_t)a3 withItem:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *tabItems;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a4;
  -[_UITabModel tabItems](self, "tabItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v6)
  {
    objc_msgSend(v8, "_setTabModel:", 0);
    objc_msgSend(v6, "_setTabModel:", self);
    -[_UITabModel tabItems](self, "tabItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v10, "replaceObjectAtIndex:withObject:", a3, v6);
    v11 = (NSArray *)objc_msgSend(v10, "copy");
    tabItems = self->_tabItems;
    self->_tabItems = v11;

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __43___UITabModel_replaceItemAtIndex_withItem___block_invoke;
    v13[3] = &unk_1E16D3C70;
    v13[4] = self;
    v14 = v8;
    v15 = v6;
    -[_UITabModel _sendToObservers:allowUpdatesDuringBroadcast:](self, "_sendToObservers:allowUpdatesDuringBroadcast:", v13, 0);

  }
}

- (void)setSelectedItem:(id)a3
{
  -[_UITabModel _setSelectedItem:notifyDelegateOnReselection:](self, "_setSelectedItem:notifyDelegateOnReselection:", a3, 1);
}

- (void)_setSelectedItem:(id)a3 notifyDelegateOnReselection:(BOOL)a4
{
  id v7;
  void *v8;
  UITab *v9;
  UITab *v10;
  UITab *v11;
  BOOL v12;
  UITab *selectedItem;
  UITab *v14;
  UITab *v15;
  UITab *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  UITab *v21;
  UITab *v22;
  BOOL v23;

  v7 = a3;
  v8 = v7;
  if (v7 && (objc_msgSend(v7, "_isElement") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITabModel.m"), 139, CFSTR("Cannot select a tab (%@) that is not selectable."), v8);

  }
  v9 = self->_selectedItem;
  v10 = v8;
  v11 = v10;
  if (v9 != v10)
  {
    if (v10 && v9)
    {
      v12 = -[UITab isEqual:](v9, "isEqual:", v10);

      if (v12)
        goto LABEL_18;
    }
    else
    {

    }
    if ((*(_BYTE *)&self->_flags & 5) == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITabModel.m"), 144, CFSTR("Attempt to modify model while broadcasting a change to the model."));

      if (v8)
        goto LABEL_13;
    }
    else if (v8)
    {
LABEL_13:
      if (!_tabElementsContainsTab(self->_tabItems, v11) && !-[UITab _isMoreTab](v11, "_isMoreTab"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITabModel.m"), 145, CFSTR("Attempt to select tab %@ that is not in the current tabs %@."), v11, self->_tabItems);

      }
    }
    v14 = v11;
    selectedItem = self->_selectedItem;
    self->_selectedItem = v14;
    a4 = 1;
    goto LABEL_17;
  }

  selectedItem = v11;
LABEL_17:

LABEL_18:
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __60___UITabModel__setSelectedItem_notifyDelegateOnReselection___block_invoke;
  v20[3] = &unk_1E16B4030;
  v23 = a4;
  v20[4] = self;
  v21 = v11;
  v22 = v9;
  v15 = v9;
  v16 = v11;
  -[_UITabModel _updateSelectedLeafPerformBeforeNotifyingBlock:](self, "_updateSelectedLeafPerformBeforeNotifyingBlock:", v20);

}

- (BOOL)shouldSelectTab:(id)a3
{
  UITabBarController **p_tabBarController;
  id v4;
  id WeakRetained;
  char v6;

  p_tabBarController = &self->_tabBarController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_tabBarController);
  v6 = -[UITabBarController _shouldSelectTab:]((uint64_t)WeakRetained, v4);

  return v6;
}

- (BOOL)isTabHidden:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  char v10;
  BOOL v11;

  v4 = a3;
  -[_UITabModel tabBarController](self, "tabBarController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sidebar");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = *(void **)(v6 + 96);
  else
    v8 = 0;
  v9 = v8;

  if (v9)
    v10 = objc_msgSend(v9, "isTabHidden:", v4);
  else
    v10 = objc_msgSend(v4, "isHidden");
  v11 = v10;

  return v11;
}

- (void)visibilityDidChangeForTab:(id)a3 editing:(BOOL)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  if (!a4)
    -[_UITabCustomizationStore updateCustomizationForTab:](self->_customizationStore, "updateCustomizationForTab:", v6);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49___UITabModel_visibilityDidChangeForTab_editing___block_invoke;
  v9[3] = &unk_1E16D3C98;
  v9[4] = self;
  v7 = v6;
  v10 = v7;
  v8 = v7;
  if (self)
  {
    -[_UITabModel _sendToObservers:allowUpdatesDuringBroadcast:](self, "_sendToObservers:allowUpdatesDuringBroadcast:", v9, 0);
    v8 = v10;
  }

}

- (void)customizabilityDidChangeForTab:(id)a3
{
  id v4;
  int v5;
  int v6;

  v4 = a3;
  v5 = -[_UITabModel isEditable](self, "isEditable");
  v6 = objc_msgSend(v4, "_isCustomizable");

  if (v5 != v6)
    -[_UITabModel _inferCurrentEditability](self, "_inferCurrentEditability");
}

- (void)tabContentDidChange:(id)a3
{
  id v4;
  id *WeakRetained;
  id *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_tabBarController);
  v6 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained[135], "tabContentDidChange:", v4);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __35___UITabModel_tabContentDidChange___block_invoke;
  v9[3] = &unk_1E16D3C98;
  v9[4] = self;
  v7 = v4;
  v10 = v7;
  v8 = v7;
  if (self)
  {
    -[_UITabModel _sendToObservers:allowUpdatesDuringBroadcast:](self, "_sendToObservers:allowUpdatesDuringBroadcast:", v9, 0);
    v8 = v10;
  }

}

- (void)elementsDidChangeForGroup:(id)a3
{
  id v4;
  int v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = -[_UITabModel isEditable](self, "isEditable");
  if (v5 != objc_msgSend(v4, "_isCustomizable"))
    -[_UITabModel _inferCurrentEditability](self, "_inferCurrentEditability");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41___UITabModel_elementsDidChangeForGroup___block_invoke;
  v8[3] = &unk_1E16D3C98;
  v8[4] = self;
  v6 = v4;
  v9 = v6;
  v7 = v6;
  if (self)
  {
    -[_UITabModel _sendToObservers:allowUpdatesDuringBroadcast:](self, "_sendToObservers:allowUpdatesDuringBroadcast:", v8, 0);
    v7 = v9;
  }

}

- (void)displayOrderIdentifiersDidChangeForGroup:(id)a3
{
  -[_UITabCustomizationStore updateCustomizationForTab:](self->_customizationStore, "updateCustomizationForTab:", a3);
}

- (void)_selectElement:(id)a3 notifyObserversOnReselection:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a4;
  v10 = a3;
  if (v10 && (objc_msgSend(v10, "_isElement") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITabModel.m"), 239, CFSTR("Cannot select a tab that is not selectable."), v10);

  }
  *(_BYTE *)&self->_flags |= 2u;
  objc_msgSend(v10, "_parentGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __59___UITabModel__selectElement_notifyObserversOnReselection___block_invoke;
    v11[3] = &unk_1E16B1B50;
    v11[4] = self;
    v12 = v7;
    objc_msgSend(v12, "_selectElement:notifyOnReselection:performBeforeNotifyingDelegate:", v10, v4, v11);

  }
  else
  {
    *(_BYTE *)&self->_flags &= ~2u;
    -[_UITabModel _setSelectedItem:notifyDelegateOnReselection:](self, "_setSelectedItem:notifyDelegateOnReselection:", v10, v4);
  }

}

- (void)_updateSelectedLeaf
{
  -[_UITabModel _updateSelectedLeafPerformBeforeNotifyingBlock:](self, "_updateSelectedLeafPerformBeforeNotifyingBlock:", 0);
}

- (void)_updateSelectedLeafPerformBeforeNotifyingBlock:(id)a3
{
  void (**v4)(_QWORD);
  void (**v5)(_QWORD);
  UITab *v6;
  uint64_t v7;
  UITab *v8;
  UITab *v9;
  UITab *v10;
  UITab *v11;
  id WeakRetained;
  _QWORD v13[5];
  UITab *v14;
  UITab *v15;

  v4 = (void (**)(_QWORD))a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if (v4)
      v4[2](v4);
  }
  else
  {
    -[_UITabModel selectedItem](self, "selectedItem");
    v6 = (UITab *)objc_claimAutoreleasedReturnValue();
    if (-[UITab _isGroup](v6, "_isGroup"))
    {
      while (1)
      {
        -[UITab selectedChild](v6, "selectedChild");
        v7 = objc_claimAutoreleasedReturnValue();
        if (!v7)
          break;
        v8 = (UITab *)v7;

        v6 = v8;
        if (!-[UITab _isGroup](v8, "_isGroup"))
          goto LABEL_9;
      }
    }
    v8 = v6;
LABEL_9:
    v9 = self->_selectedLeaf;
    objc_storeStrong((id *)&self->_selectedLeaf, v8);
    if (v5)
      v5[2](v5);
    if (v8 != v9)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __62___UITabModel__updateSelectedLeafPerformBeforeNotifyingBlock___block_invoke;
      v13[3] = &unk_1E16D3C70;
      v13[4] = self;
      v10 = v8;
      v14 = v10;
      v11 = v9;
      v15 = v11;
      -[_UITabModel _sendToObservers:allowUpdatesDuringBroadcast:](self, "_sendToObservers:allowUpdatesDuringBroadcast:", v13, 0);
      WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarController);
      -[UITabBarController _selectedLeafDidChange:previousLeaf:]((uint64_t)WeakRetained, v10, v11);

    }
  }

}

- (void)_inferCurrentEditability
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  -[_UITabModel tabItems](self, "tabItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    v7 = 0;
    v8 = &v7;
    v9 = 0x2020000000;
    v10 = 0;
    -[_UITabModel tabItems](self, "tabItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __39___UITabModel__inferCurrentEditability__block_invoke;
    v6[3] = &unk_1E16D3CC0;
    v6[4] = &v11;
    v6[5] = &v7;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

    if (!*((_BYTE *)v8 + 24))
      -[_UITabModel setEditable:](self, "setEditable:", *((unsigned __int8 *)v12 + 24));
    _Block_object_dispose(&v7, 8);
    _Block_object_dispose(&v11, 8);
  }
}

- (id)tabForIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[_UITabModel tabItems](self, "tabItems", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v6)
    goto LABEL_13;
  v7 = v6;
  v8 = *(_QWORD *)v17;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v17 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
      objc_msgSend(v10, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", v4);

      if (v12)
      {
        v13 = v10;
      }
      else
      {
        if (!objc_msgSend(v10, "_isGroup"))
          continue;
        objc_msgSend(v10, "tabForIdentifier:", v4);
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      v14 = v13;
      if (v13)
        goto LABEL_14;
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  }
  while (v7);
LABEL_13:
  v14 = 0;
LABEL_14:

  return v14;
}

- (void)setPersistenceIdentifier:(id)a3
{
  id v4;
  NSString *v5;
  NSString *persistenceIdentifier;
  _UITabCustomizationStore *customizationStore;
  _UITabCustomizationStore *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  if (!-[NSString isEqualToString:](self->_persistenceIdentifier, "isEqualToString:", v4))
  {
    v5 = (NSString *)objc_msgSend(v4, "copy");
    persistenceIdentifier = self->_persistenceIdentifier;
    self->_persistenceIdentifier = v5;

    customizationStore = self->_customizationStore;
    if (customizationStore)
    {
      -[_UITabCustomizationStore removeObserver:](customizationStore, "removeObserver:", self);
      v8 = self->_customizationStore;
      self->_customizationStore = 0;

      -[_UITabModel customizationStore](self, "customizationStore");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __40___UITabModel_setPersistenceIdentifier___block_invoke;
      v11[3] = &unk_1E16D3C98;
      v11[4] = self;
      v12 = v9;
      v10 = v9;
      -[_UITabModel _sendToObservers:allowUpdatesDuringBroadcast:](self, "_sendToObservers:allowUpdatesDuringBroadcast:", v11, 0);

    }
  }

}

- (_UITabCustomizationStore)customizationStore
{
  _UITabCustomizationStore *customizationStore;
  void *v4;
  _UITabCustomizationStore *v5;
  _UITabCustomizationStore *v6;

  customizationStore = self->_customizationStore;
  if (!customizationStore)
  {
    -[_UITabModel persistenceIdentifier](self, "persistenceIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UITabCustomizationStore customizationStoreWithPersistenceIdentifier:](_UITabCustomizationStore, "customizationStoreWithPersistenceIdentifier:", v4);
    v5 = (_UITabCustomizationStore *)objc_claimAutoreleasedReturnValue();
    v6 = self->_customizationStore;
    self->_customizationStore = v5;

    -[_UITabCustomizationStore addObserver:](self->_customizationStore, "addObserver:", self);
    customizationStore = self->_customizationStore;
  }
  return customizationStore;
}

- (void)favoriteOrderDidChange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38___UITabModel_favoriteOrderDidChange___block_invoke;
  v7[3] = &unk_1E16D3C98;
  v7[4] = self;
  v5 = v4;
  v8 = v5;
  v6 = v5;
  if (self)
  {
    -[_UITabModel _sendToObservers:allowUpdatesDuringBroadcast:](self, "_sendToObservers:allowUpdatesDuringBroadcast:", v7, 0);
    v6 = v8;
  }

}

- (void)customizationStoreDidReset:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42___UITabModel_customizationStoreDidReset___block_invoke;
  v7[3] = &unk_1E16D3C98;
  v7[4] = self;
  v5 = v4;
  v8 = v5;
  v6 = v5;
  if (self)
  {
    -[_UITabModel _sendToObservers:allowUpdatesDuringBroadcast:](self, "_sendToObservers:allowUpdatesDuringBroadcast:", v7, 0);
    v6 = v8;
  }

}

- (void)setEditable:(BOOL)a3
{
  _BOOL4 v3;
  id *WeakRetained;
  void *v6;
  int v7;
  int v8;
  _BOOL4 v9;
  _QWORD v10[5];
  char v11;

  v3 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_tabBarController);
  -[UITabBarController _visualStyle](WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "suppressesEditingUI");

  v8 = v3 & ~v7;
  if (self->_editable != v8)
  {
    v9 = -[_UITabModel isEditing](self, "isEditing");
    if ((v8 & 1) == 0 && v9)
      -[_UITabModel setEditing:](self, "setEditing:", 0);
    self->_editable = v8;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __27___UITabModel_setEditable___block_invoke;
    v10[3] = &unk_1E16D3CE8;
    v10[4] = self;
    v11 = v8;
    -[_UITabModel _sendToObservers:allowUpdatesDuringBroadcast:](self, "_sendToObservers:allowUpdatesDuringBroadcast:", v10, 0);
  }
}

- (void)setEditing:(BOOL)a3
{
  int v4;
  id *v5;

  v4 = -[_UITabModel isEditable](self, "isEditable") && a3;
  if (self->_editing != v4)
  {
    self->_editing = v4;
    -[_UITabModel tabBarController](self, "tabBarController");
    v5 = (id *)objc_claimAutoreleasedReturnValue();
    -[UITabBarController _notifyEditingStateChange:](v5, v4);

  }
}

- (id)resolvedPopoverPresentationControllerSourceItemForTab:(id)a3
{
  UITabBarController **p_tabBarController;
  id v4;
  id *WeakRetained;
  void *v6;

  p_tabBarController = &self->_tabBarController;
  v4 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)p_tabBarController);
  -[UITabBarController _resolvedPopoverPresentationControllerSourceItemForTab:](WeakRetained, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)addObserver:(id)a3
{
  NSPointerArray *observers;
  NSPointerArray *v5;
  NSPointerArray *v6;
  id v7;

  v7 = a3;
  observers = self->_observers;
  if (!observers)
  {
    v5 = (NSPointerArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3868]), "initWithOptions:", 5);
    v6 = self->_observers;
    self->_observers = v5;

    observers = self->_observers;
  }
  -[NSPointerArray compact](observers, "compact");
  if (-[_UITabModel _indexOfObserver:]((uint64_t)self, v7) == 0x7FFFFFFFFFFFFFFFLL)
    -[NSPointerArray addPointer:](self->_observers, "addPointer:", v7);

}

- (uint64_t)_indexOfObserver:(uint64_t)a1
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (a1)
  {
    if (objc_msgSend(*(id *)(a1 + 8), "count"))
    {
      v4 = 0;
      while ((id)objc_msgSend(*(id *)(a1 + 8), "pointerAtIndex:", v4) != v3)
      {
        if (++v4 >= (unint64_t)objc_msgSend(*(id *)(a1 + 8), "count"))
          goto LABEL_6;
      }
    }
    else
    {
LABEL_6:
      v4 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)removeObserver:(id)a3
{
  uint64_t v4;

  if (self->_observers)
  {
    v4 = -[_UITabModel _indexOfObserver:]((uint64_t)self, a3);
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
      -[NSPointerArray removePointerAtIndex:](self->_observers, "removePointerAtIndex:", v4);
    -[NSPointerArray compact](self->_observers, "compact");
  }
}

- (void)_sendToObservers:(id)a3 allowUpdatesDuringBroadcast:(BOOL)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  char v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a3;
  if (v4)
    v7 = 5;
  else
    v7 = 1;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v7;
  v8 = (void *)-[NSPointerArray copy](self->_observers, "copy");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        if (*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i))
          v6[2](v6);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

  -[NSPointerArray compact](self->_observers, "compact", (_QWORD)v14);
  *(_BYTE *)&self->_flags &= 0xFAu;

}

- (UITabBarController)tabBarController
{
  return (UITabBarController *)objc_loadWeakRetained((id *)&self->_tabBarController);
}

- (void)setTabBarController:(id)a3
{
  objc_storeWeak((id *)&self->_tabBarController, a3);
}

- (NSArray)tabItems
{
  return self->_tabItems;
}

- (UITab)selectedItem
{
  return self->_selectedItem;
}

- (UITab)selectedLeaf
{
  return self->_selectedLeaf;
}

- (NSString)persistenceIdentifier
{
  return self->_persistenceIdentifier;
}

- (BOOL)isEditable
{
  return self->_editable;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceIdentifier, 0);
  objc_storeStrong((id *)&self->_selectedLeaf, 0);
  objc_storeStrong((id *)&self->_selectedItem, 0);
  objc_storeStrong((id *)&self->_tabItems, 0);
  objc_destroyWeak((id *)&self->_tabBarController);
  objc_storeStrong((id *)&self->_customizationStore, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
