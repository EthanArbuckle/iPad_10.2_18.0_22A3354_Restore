@implementation ExtensionListViewController

- (ExtensionListViewController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ExtensionListViewController;
  return -[ExtensionListViewController init](&v3, sel_init);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ExtensionListViewController;
  -[ExtensionListViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[ExtensionListViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("extension"));

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel__loadExtensions, 4096);
  -[ExtensionListViewController setRefreshControl:](self, "setRefreshControl:", v4);
  -[ExtensionListViewController _loadExtensions](self, "_loadExtensions");

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ExtensionListViewController;
  -[ExtensionListViewController viewWillAppear:](&v3, sel_viewWillAppear_, a3);
}

- (void)_loadExtensions
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  ExtensionListViewController *v8;

  if (MEMORY[0x1D17A3148]("-[ExtensionListViewController _loadExtensions]", a2))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA560]), "initWithExtensionPointIdentifier:", CFSTR("com.apple.posterkit.provider"));
    dispatch_get_global_queue(33, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __46__ExtensionListViewController__loadExtensions__block_invoke;
    v6[3] = &unk_1E86F2540;
    v7 = v3;
    v8 = self;
    v5 = v3;
    dispatch_async(v4, v6);

  }
}

void __46__ExtensionListViewController__loadExtensions__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(MEMORY[0x1E0CAA568], "executeQuery:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__ExtensionListViewController__loadExtensions__block_invoke_3;
  v5[3] = &unk_1E86F2540;
  v5[4] = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __46__ExtensionListViewController__loadExtensions__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __46__ExtensionListViewController__loadExtensions__block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  dispatch_time_t v14;
  _QWORD v15[5];
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 1016);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v6++), "invalidate");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v4);
  }

  v7 = objc_msgSend(*(id *)(a1 + 32), "extensionItemActivationStyle");
  v8 = MEMORY[0x1E0C809B0];
  v9 = *(void **)(a1 + 40);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __46__ExtensionListViewController__loadExtensions__block_invoke_4;
  v16[3] = &__block_descriptor_40_e30__16__0___EXExtensionIdentity_8l;
  v16[4] = v7;
  objc_msgSend(v9, "bs_map:", v16);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 1016);
  *(_QWORD *)(v11 + 1016) = v10;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reloadData");

  v14 = dispatch_time(0, 800000000);
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __46__ExtensionListViewController__loadExtensions__block_invoke_5;
  v15[3] = &unk_1E86F2518;
  v15[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v14, MEMORY[0x1E0C80D38], v15);
}

ExtensionItem *__46__ExtensionListViewController__loadExtensions__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return +[ExtensionItem itemWithExtension:activationStyle:](ExtensionItem, "itemWithExtension:activationStyle:", a2, *(_QWORD *)(a1 + 32));
}

void __46__ExtensionListViewController__loadExtensions__block_invoke_5(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "refreshControl");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "endRefreshing");

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_extensions, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSArray *extensions;
  uint64_t v10;
  void *v11;
  void *v12;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("extension"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultContentConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  extensions = self->_extensions;
  v10 = objc_msgSend(v6, "row");

  -[NSArray objectAtIndex:](extensions, "objectAtIndex:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v12);

  objc_msgSend(v7, "setContentConfiguration:", v8);
  return v7;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NSArray objectAtIndex:](self->_extensions, "objectAtIndex:", objc_msgSend(v7, "row"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "wasEverActivated"))
    goto LABEL_4;
  v9 = (void *)MEMORY[0x1E0DC36C8];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __92__ExtensionListViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke;
  v15[3] = &unk_1E86F3D40;
  v16 = v8;
  v17 = v6;
  v18 = v7;
  objc_msgSend(v9, "contextualActionWithStyle:title:handler:", 1, CFSTR("Invalidate"), v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0DC3D08];
    v19[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configurationWithActions:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_4:
    v13 = 0;
  }

  return v13;
}

void __92__ExtensionListViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  void (**v6)(id, uint64_t);
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)a1[4];
  v6 = a4;
  objc_msgSend(v5, "invalidate");
  v7 = (void *)a1[5];
  v9[0] = a1[6];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadRowsAtIndexPaths:withRowAnimation:", v8, 100);

  v6[2](v6, 1);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[NSArray objectAtIndex:](self->_extensions, "objectAtIndex:", objc_msgSend(v7, "row"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    objc_msgSend(v9, "setDelegate:", self);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__ExtensionListViewController_tableView_didSelectRowAtIndexPath___block_invoke;
  v14[3] = &unk_1E86F2540;
  v15 = v6;
  v16 = v7;
  v12 = v7;
  v13 = v6;
  -[ExtensionListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, v14);

}

void __65__ExtensionListViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "deselectRowAtIndexPath:animated:", *(_QWORD *)(a1 + 40), 1);
  v2 = *(void **)(a1 + 32);
  v4[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadRowsAtIndexPaths:withRowAnimation:", v3, 100);

}

- (void)editingSceneViewController:(id)a3 userDidDismissWithAction:(int64_t)a4 updatedConfiguration:(id)a5 updatedConfiguredProperties:(id)a6 completion:(id)a7
{
  -[ExtensionListViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0, a5, a6, a7);
}

- (int64_t)extensionItemActivationStyle
{
  return self->_extensionItemActivationStyle;
}

- (void)setExtensionItemActivationStyle:(int64_t)a3
{
  self->_extensionItemActivationStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensions, 0);
}

@end
