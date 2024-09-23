@implementation SKUIJSTabBar

- (SKUIJSTabBar)initWithAppContext:(id)a3 controller:(id)a4
{
  id v6;
  SKUIJSTabBar *v7;
  id v8;
  objc_super v10;
  id location;

  v6 = a3;
  objc_initWeak(&location, a4);
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIJSTabBar initWithAppContext:controller:].cold.1();
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUIJSTabBar;
  v7 = -[IKJSObject initWithAppContext:](&v10, sel_initWithAppContext_, v6);
  if (v7)
  {
    v8 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v7->_applicationController, v8);

    -[SKUIJSTabBar _reloadTabBarItemsWithPreludeMainThreadWork:](v7, "_reloadTabBarItemsWithPreludeMainThreadWork:", 0);
  }
  objc_destroyWeak(&location);

  return v7;
}

- (void)sendOnNeedsContentForTabBarItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[IKJSObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__SKUIJSTabBar_sendOnNeedsContentForTabBarItem___block_invoke;
  v7[3] = &unk_1E73A1280;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "evaluate:completionBlock:", v7, 0);

}

void __48__SKUIJSTabBar_sendOnNeedsContentForTabBarItem___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  const __CFString *v21;
  id v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v6);
      objc_msgSend(v7, "tabBarItem", (_QWORD)v16);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(void **)(a1 + 40);

      if (v8 == v9)
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    v10 = v7;

    if (!v10)
      return;
    v22 = v10;
    v23[0] = CFSTR("type");
    v23[1] = CFSTR("detail");
    v24[0] = CFSTR("needscontent");
    v21 = CFSTR("tab");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = *(void **)(a1 + 32);
    v20 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v13, "invokeMethod:withArguments:", CFSTR("onNeedsContent"), v14);

    v2 = v10;
  }
LABEL_12:

}

- (void)sendOnUpdate
{
  void *v3;
  _QWORD v4[5];

  -[IKJSObject appContext](self, "appContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __28__SKUIJSTabBar_sendOnUpdate__block_invoke;
  v4[3] = &unk_1E73A2BE0;
  v4[4] = self;
  objc_msgSend(v3, "evaluate:completionBlock:", v4, 0);

}

id __28__SKUIJSTabBar_sendOnUpdate__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_reloadTabBarItemsWithPreludeMainThreadWork:", 0);
  return (id)objc_msgSend(*(id *)(a1 + 32), "invokeMethod:withArguments:", CFSTR("onUpdate"), 0);
}

- (void)sendOnUpdateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];

  v4 = a3;
  -[IKJSObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__SKUIJSTabBar_sendOnUpdateWithCompletion___block_invoke;
  v9[3] = &unk_1E73A2BE0;
  v9[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__SKUIJSTabBar_sendOnUpdateWithCompletion___block_invoke_2;
  v7[3] = &unk_1E73A0220;
  v6 = v4;
  objc_msgSend(v5, "evaluate:completionBlock:", v9, v7);

}

id __43__SKUIJSTabBar_sendOnUpdateWithCompletion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_reloadTabBarItemsWithPreludeMainThreadWork:", 0);
  return (id)objc_msgSend(*(id *)(a1 + 32), "invokeMethod:withArguments:", CFSTR("onUpdate"), 0);
}

void __43__SKUIJSTabBar_sendOnUpdateWithCompletion___block_invoke_2(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  if (*(_QWORD *)(a1 + 32))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__SKUIJSTabBar_sendOnUpdateWithCompletion___block_invoke_3;
    block[3] = &unk_1E73A1618;
    v2 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __43__SKUIJSTabBar_sendOnUpdateWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (SKUIJSTabBarItem)selectedTab
{
  void *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  -[IKJSObject appContext](self, "appContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __27__SKUIJSTabBar_selectedTab__block_invoke;
  v6[3] = &unk_1E73A8998;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "evaluateDelegateBlockSync:", v6);

  -[SKUIJSTabBar _selectedTabBarItemForIndex:](self, "_selectedTabBarItemForIndex:", v8[3]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v7, 8);
  return (SKUIJSTabBarItem *)v4;
}

void __27__SKUIJSTabBar_selectedTab__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(WeakRetained, "_selectedTabBarIndex");

}

- (void)setSelectedTab:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SKUIJSTabBar *v9;

  v4 = a3;
  -[IKJSObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31__SKUIJSTabBar_setSelectedTab___block_invoke;
  v7[3] = &unk_1E73A2AC8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "evaluateDelegateBlockSync:", v7);

}

void __31__SKUIJSTabBar_setSelectedTab___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "tabBarItem");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tabIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("transient"));

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 24));
  v5 = WeakRetained;
  if (v3)
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_5:
    objc_msgSend(WeakRetained, "_setSelectedTabBarIndex:", v6);

    goto LABEL_6;
  }
  objc_msgSend(WeakRetained, "tabBarItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", v9);

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 24));
    v5 = WeakRetained;
    v6 = v8;
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_reloadTabBarItemsWithPreludeMainThreadWork:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSArray *v13;
  NSArray *tabs;
  SKUITabBarItem *v15;
  SKUIJSTabBarItem *v16;
  SKUIJSTabBarItem *v17;
  SKUIJSTabBarItem *transientTab;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD *v22;
  _QWORD v23[5];
  id v24;
  _QWORD *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _QWORD v40[5];
  id v41;

  v4 = a3;
  -[IKJSObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__89;
  v40[4] = __Block_byref_object_dispose__89;
  v41 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__89;
  v38 = __Block_byref_object_dispose__89;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__89;
  v32 = __Block_byref_object_dispose__89;
  v33 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __60__SKUIJSTabBar__reloadTabBarItemsWithPreludeMainThreadWork___block_invoke;
  v23[3] = &unk_1E73A89C0;
  v7 = v4;
  v23[4] = self;
  v24 = v7;
  v25 = v40;
  v26 = &v34;
  v27 = &v28;
  objc_msgSend(v5, "evaluateDelegateBlockSync:", v23);
  v8 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v9 = (void *)objc_msgSend(v8, "initWithCapacity:", objc_msgSend((id)v35[5], "count"));
  v10 = (void *)v35[5];
  v19[0] = v6;
  v19[1] = 3221225472;
  v19[2] = __60__SKUIJSTabBar__reloadTabBarItemsWithPreludeMainThreadWork___block_invoke_2;
  v19[3] = &unk_1E73A89E8;
  v22 = v40;
  v19[4] = self;
  v11 = v5;
  v20 = v11;
  v12 = v9;
  v21 = v12;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v19);
  v13 = (NSArray *)objc_msgSend(v12, "copy");
  tabs = self->_tabs;
  self->_tabs = v13;

  v15 = -[SKUITabBarItem initWithTabIdentifier:]([SKUITabBarItem alloc], "initWithTabIdentifier:", CFSTR("transient"));
  v16 = [SKUIJSTabBarItem alloc];
  v17 = -[SKUIJSTabBarItem initWithAppContext:navigationController:tabBarItem:owner:](v16, "initWithAppContext:navigationController:tabBarItem:owner:", v11, v29[5], v15, self);
  transientTab = self->_transientTab;
  self->_transientTab = v17;

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(v40, 8);
}

void __60__SKUIJSTabBar__reloadTabBarItemsWithPreludeMainThreadWork___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v2 = a1[5];
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));
  objc_msgSend(WeakRetained, "_navigationControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "copy");
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = objc_loadWeakRetained((id *)(a1[4] + 24));
  objc_msgSend(v8, "tabBarItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copy");
  v11 = *(_QWORD *)(a1[7] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  v16 = objc_loadWeakRetained((id *)(a1[4] + 24));
  objc_msgSend(v16, "_transientNavigationController");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1[8] + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

}

void __60__SKUIJSTabBar__reloadTabBarItemsWithPreludeMainThreadWork___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  SKUIJSTabBarItem *v12;
  id v13;

  v13 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {

    v5 = 0;
  }
  objc_msgSend(v13, "customRootViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v5)
  {
    if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EF4C5EE0))
    {
      objc_msgSend(v8, "appNavigationController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "clientContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("[%@]: Nil client context for %@"), v11, v13);

    }
  }
  v12 = -[SKUIJSTabBarItem initWithAppContext:navigationController:tabBarItem:owner:]([SKUIJSTabBarItem alloc], "initWithAppContext:navigationController:tabBarItem:owner:", *(_QWORD *)(a1 + 40), v5, v13, *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v12);

}

- (id)_selectedTabBarItemForIndex:(int64_t)a3
{
  SKUIJSTabBarItem *v4;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = self->_transientTab;
  }
  else if (a3 < 0 || -[NSArray count](self->_tabs, "count") <= a3)
  {
    v4 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_tabs, "objectAtIndexedSubscript:", a3);
    v4 = (SKUIJSTabBarItem *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (NSArray)tabs
{
  return self->_tabs;
}

- (SKUIJSTabBarItem)transientTab
{
  return self->_transientTab;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transientTab, 0);
  objc_storeStrong((id *)&self->_tabs, 0);
  objc_destroyWeak((id *)&self->_applicationController);
}

- (void)initWithAppContext:controller:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIJSTabBar initWithAppContext:controller:]";
}

@end
