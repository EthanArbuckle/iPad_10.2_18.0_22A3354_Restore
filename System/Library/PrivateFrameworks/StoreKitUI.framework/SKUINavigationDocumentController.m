@implementation SKUINavigationDocumentController

- (SKUINavigationDocumentController)initWithNavigationController:(id)a3
{
  id v5;
  SKUINavigationDocumentController *v6;
  SKUINavigationDocumentController *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  NSMutableArray *stackItems;
  objc_super v14;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUINavigationDocumentController initWithNavigationController:].cold.1();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUINavigationDocumentController;
  v6 = -[SKUINavigationDocumentController init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_navigationController, a3);
    v8 = storeSemanticContentAttribute();
    -[UINavigationController view](v7->_navigationController, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSemanticContentAttribute:", v8);

    -[UINavigationController navigationBar](v7->_navigationController, "navigationBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSemanticContentAttribute:", v8);

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    stackItems = v7->_stackItems;
    v7->_stackItems = v11;

  }
  return v7;
}

- (void)ensureStackConsistencyForNavigationControllerOperation:(int64_t)a3 operationDidComplete:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  NSMutableArray *v8;
  NSMutableArray *pendingNavigationStackEnsureConsistencyRequests;
  SKUINavigationStackEnsureConsistencyRequest *v10;
  SKUINavigationStackEnsureConsistencyRequest *v11;

  v4 = a4;
  if (-[NSMutableArray count](self->_pendingNavigationStackEnsureConsistencyRequests, "count"))
  {
    v11 = -[SKUINavigationStackEnsureConsistencyRequest initWithNavigationControllerOperation:operationDidComplete:]([SKUINavigationStackEnsureConsistencyRequest alloc], "initWithNavigationControllerOperation:operationDidComplete:", a3, v4);
    -[NSMutableArray addObject:](self->_pendingNavigationStackEnsureConsistencyRequests, "addObject:", v11);
LABEL_5:

    return;
  }
  -[UINavigationController transitionCoordinator](self->_navigationController, "transitionCoordinator");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v11 = (SKUINavigationStackEnsureConsistencyRequest *)v7;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingNavigationStackEnsureConsistencyRequests = self->_pendingNavigationStackEnsureConsistencyRequests;
    self->_pendingNavigationStackEnsureConsistencyRequests = v8;

    v10 = -[SKUINavigationStackEnsureConsistencyRequest initWithNavigationControllerOperation:operationDidComplete:]([SKUINavigationStackEnsureConsistencyRequest alloc], "initWithNavigationControllerOperation:operationDidComplete:", a3, v4);
    -[NSMutableArray addObject:](self->_pendingNavigationStackEnsureConsistencyRequests, "addObject:", v10);
    -[SKUINavigationDocumentController _scheduleFlushingPendingNavigationStackEnsureConsistencyRequestsWithTransitionCoordinator:](self, "_scheduleFlushingPendingNavigationStackEnsureConsistencyRequestsWithTransitionCoordinator:", v11);

    goto LABEL_5;
  }
  -[SKUINavigationDocumentController _ensureStackConsistencyForNavigationControllerOperation:operationDidComplete:](self, "_ensureStackConsistencyForNavigationControllerOperation:operationDidComplete:", a3, v4);
}

- (void)popAllDocuments
{
  UINavigationController *moreNavigationController;
  id v4;

  -[SKUINavigationDocumentController _unloadAllStackItems](self, "_unloadAllStackItems");
  moreNavigationController = self->_moreNavigationController;
  if (moreNavigationController || (moreNavigationController = self->_overrideNavigationController) != 0)
    v4 = -[UINavigationController popToRootViewControllerAnimated:](moreNavigationController, "popToRootViewControllerAnimated:", 0);
  else
    -[UINavigationController setViewControllers:animated:](self->_navigationController, "setViewControllers:animated:", MEMORY[0x1E0C9AA60], 0);
  -[SKUINavigationDocumentController _handleStackDidChange](self, "_handleStackDidChange");
}

- (void)setStackItems:(id)a3 animated:(BOOL)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  SKUIDocumentContainerViewController *v13;
  SKUIDocumentContainerViewController *v14;
  void *v15;
  void *v16;
  UINavigationController *moreNavigationController;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v23 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[SKUINavigationDocumentController _unloadAllStackItems](self, "_unloadAllStackItems");
  -[SKUINavigationDocumentController clientContext](self, "clientContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v12, "viewController");
        v13 = (SKUIDocumentContainerViewController *)objc_claimAutoreleasedReturnValue();
        if (v13)
          goto LABEL_8;
        v14 = [SKUIDocumentContainerViewController alloc];
        objc_msgSend(v12, "document");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "presentationOptions");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[SKUIDocumentContainerViewController initWithDocument:options:clientContext:](v14, "initWithDocument:options:clientContext:", v15, v16, v24);

        objc_msgSend(v12, "setViewController:", v13);
        if (v13)
        {
LABEL_8:
          -[NSMutableArray addObject:](self->_stackItems, "addObject:", v12);
          objc_msgSend(v6, "addObject:", v13);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }

  moreNavigationController = self->_moreNavigationController;
  if (moreNavigationController || (moreNavigationController = self->_overrideNavigationController) != 0)
  {
    -[UINavigationController viewControllers](moreNavigationController, "viewControllers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      objc_msgSend(v6, "insertObject:atIndex:", v19, 0);

  }
  -[SKUINavigationDocumentController _activeNavigationController](self, "_activeNavigationController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "conformsToProtocol:", &unk_1EF453AE8))
    objc_msgSend(v20, "setTransitioningDelegate:", v21);
  -[SKUINavigationDocumentController _activeNavigationController](self, "_activeNavigationController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setViewControllers:animated:", v6, v23);

  -[SKUINavigationDocumentController _handleStackDidChange](self, "_handleStackDidChange");
}

- (id)documents
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_stackItems;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "document", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)insertDocument:(id)a3 beforeDocument:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  NSMutableArray *stackItems;
  uint64_t v11;
  SKUIDocumentContainerViewController *v12;
  void *v13;
  SKUIDocumentContainerViewController *v14;
  SKUIDocumentStackItem *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSMutableArray *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v23 = a3;
  v8 = a4;
  v9 = a5;
  if (!v8)
    goto LABEL_3;
  stackItems = self->_stackItems;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __74__SKUINavigationDocumentController_insertDocument_beforeDocument_options___block_invoke;
  v24[3] = &unk_1E73A52A0;
  v25 = v8;
  v11 = -[NSMutableArray indexOfObjectPassingTest:](stackItems, "indexOfObjectPassingTest:", v24);

  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = [SKUIDocumentContainerViewController alloc];
    -[SKUINavigationDocumentController clientContext](self, "clientContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SKUIDocumentContainerViewController initWithDocument:options:clientContext:](v12, "initWithDocument:options:clientContext:", v23, v9, v13);

    if (v14)
    {
      v15 = -[SKUIDocumentStackItem initWithDocument:presentationOptions:]([SKUIDocumentStackItem alloc], "initWithDocument:presentationOptions:", v23, v9);
      -[SKUIDocumentStackItem setViewController:](v15, "setViewController:", v14);
      -[SKUINavigationDocumentController _activeNavigationController](self, "_activeNavigationController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "viewControllers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "mutableCopy");

      -[NSMutableArray objectAtIndex:](self->_stackItems, "objectAtIndex:", v11);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "viewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "indexOfObjectIdenticalTo:", v19);

      v21 = self->_stackItems;
      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
      {
        -[NSMutableArray addObject:](v21, "addObject:", v15);
        objc_msgSend(v16, "pushViewController:animated:", v14, -[SKUIDocumentStackItem isAnimated](v15, "isAnimated"));
      }
      else
      {
        -[NSMutableArray insertObject:atIndex:](v21, "insertObject:atIndex:", v15, v11);
        objc_msgSend(v18, "insertObject:atIndex:", v14, v20);
        objc_msgSend(v16, "setViewControllers:animated:", v18, -[SKUIDocumentStackItem isAnimated](v15, "isAnimated"));
      }
      -[SKUINavigationDocumentController _handleStackDidChange](self, "_handleStackDidChange");

    }
    else
    {
      NSLog(CFSTR("No view controller for document: %@, options: %@"), v23, v9);
    }

  }
  else
  {
LABEL_3:
    -[SKUINavigationDocumentController pushDocument:options:](self, "pushDocument:options:", v23, v9);
  }

}

BOOL __74__SKUINavigationDocumentController_insertDocument_beforeDocument_options___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)popDocument
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  if (-[NSMutableArray count](self->_stackItems, "count"))
  {
    -[NSMutableArray lastObject](self->_stackItems, "lastObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v7, "isAnimated");
    objc_msgSend(v7, "document");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "onUnload");

    -[NSMutableArray removeLastObject](self->_stackItems, "removeLastObject");
    -[SKUINavigationDocumentController _activeNavigationController](self, "_activeNavigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "popViewControllerAnimated:", v3);

    -[SKUINavigationDocumentController _handleStackDidChange](self, "_handleStackDidChange");
  }
}

- (void)popToRootDocument
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = -[NSMutableArray count](self->_stackItems, "count");
  if (v3 >= 2)
  {
    v4 = v3 + 1;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_stackItems, "objectAtIndex:", v4 - 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "document");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "onUnload");

      -[NSMutableArray removeObjectAtIndex:](self->_stackItems, "removeObjectAtIndex:", v4 - 2);
      --v4;
    }
    while (v4 > 2);
  }
  if (-[NSMutableArray count](self->_stackItems, "count"))
  {
    -[NSMutableArray firstObject](self->_stackItems, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUINavigationDocumentController _activeNavigationController](self, "_activeNavigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v8, "popToViewController:animated:", v9, 1);

  }
  -[SKUINavigationDocumentController _handleStackDidChange](self, "_handleStackDidChange");
}

- (void)popToDocument:(id)a3
{
  id v4;
  NSMutableArray *stackItems;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  stackItems = self->_stackItems;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __50__SKUINavigationDocumentController_popToDocument___block_invoke;
  v16[3] = &unk_1E73A52A0;
  v15 = v4;
  v17 = v15;
  v6 = -[NSMutableArray indexOfObjectPassingTest:](stackItems, "indexOfObjectPassingTest:", v16);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v6;
    for (i = -[NSMutableArray count](self->_stackItems, "count") - 1; i > v7; --i)
    {
      -[NSMutableArray objectAtIndex:](self->_stackItems, "objectAtIndex:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "document");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "onUnload");

      -[NSMutableArray removeObjectAtIndex:](self->_stackItems, "removeObjectAtIndex:", i);
    }
    -[NSMutableArray objectAtIndex:](self->_stackItems, "objectAtIndex:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUINavigationDocumentController _activeNavigationController](self, "_activeNavigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "viewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v12, "popToViewController:animated:", v13, objc_msgSend(v11, "isAnimated"));

    -[SKUINavigationDocumentController _handleStackDidChange](self, "_handleStackDidChange");
  }

}

BOOL __50__SKUINavigationDocumentController_popToDocument___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)pushDocument:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  SKUIDocumentContainerViewController *v8;
  void *v9;
  SKUIDocumentContainerViewController *v10;
  SKUIDocumentStackItem *v11;
  void *v12;
  double v13;
  double v14;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void (**v20)(_QWORD);
  void *v21;
  _QWORD v22[4];
  void (**v23)(_QWORD);
  _QWORD aBlock[4];
  id v25;
  SKUIDocumentContainerViewController *v26;

  v6 = a3;
  v7 = a4;
  v8 = [SKUIDocumentContainerViewController alloc];
  -[SKUINavigationDocumentController clientContext](self, "clientContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SKUIDocumentContainerViewController initWithDocument:options:clientContext:](v8, "initWithDocument:options:clientContext:", v6, v7, v9);

  if (v10)
  {
    v11 = -[SKUIDocumentStackItem initWithDocument:presentationOptions:]([SKUIDocumentStackItem alloc], "initWithDocument:presentationOptions:", v6, v7);
    -[SKUIDocumentStackItem setViewController:](v11, "setViewController:", v10);
    -[NSMutableArray addObject:](self->_stackItems, "addObject:", v11);
    -[SKUINavigationDocumentController _activeNavigationController](self, "_activeNavigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIDocumentContainerViewController preferredContentSize](v10, "preferredContentSize");
    if (*MEMORY[0x1E0C9D820] == v14 && *(double *)(MEMORY[0x1E0C9D820] + 8) == v13)
    {
      objc_msgSend(v12, "preferredContentSize");
      -[SKUIDocumentContainerViewController setPreferredContentSize:](v10, "setPreferredContentSize:");
    }
    objc_msgSend(v12, "viewControllers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    objc_msgSend(v12, "transitionCoordinator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pushViewController:animated:", v10, -[SKUIDocumentStackItem isAnimated](v11, "isAnimated"));
    if (!v17)
    {
      v19 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __57__SKUINavigationDocumentController_pushDocument_options___block_invoke;
      aBlock[3] = &unk_1E739FD10;
      v25 = v12;
      v26 = v10;
      v20 = (void (**)(_QWORD))_Block_copy(aBlock);
      v21 = v20;
      if (v18)
      {
        v22[0] = v19;
        v22[1] = 3221225472;
        v22[2] = __57__SKUINavigationDocumentController_pushDocument_options___block_invoke_4;
        v22[3] = &unk_1E73A52C8;
        v23 = v20;
        objc_msgSend(v18, "animateAlongsideTransition:completion:", 0, v22);

      }
      else
      {
        v20[2](v20);
      }

    }
    -[SKUINavigationDocumentController _handleStackDidChange](self, "_handleStackDidChange");

  }
  else
  {
    NSLog(CFSTR("No view controller for document: %@, options: %@"), v6, v7);
  }

}

void __57__SKUINavigationDocumentController_pushDocument_options___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__SKUINavigationDocumentController_pushDocument_options___block_invoke_2;
  v3[3] = &unk_1E739FD10;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_performBlockAfterCATransactionCommits:", v3);

}

void __57__SKUINavigationDocumentController_pushDocument_options___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__SKUINavigationDocumentController_pushDocument_options___block_invoke_3;
  v3[3] = &unk_1E739FD10;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "performWithoutAnimation:", v3);

}

uint64_t __57__SKUINavigationDocumentController_pushDocument_options___block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutSubviews");

  return objc_msgSend(*(id *)(a1 + 40), "reloadData");
}

uint64_t __57__SKUINavigationDocumentController_pushDocument_options___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeDocument:(id)a3
{
  id v4;
  NSMutableArray *stackItems;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  stackItems = self->_stackItems;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __51__SKUINavigationDocumentController_removeDocument___block_invoke;
  v15[3] = &unk_1E73A52A0;
  v14 = v4;
  v16 = v14;
  v6 = -[NSMutableArray indexOfObjectPassingTest:](stackItems, "indexOfObjectPassingTest:", v15);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v6;
    -[NSMutableArray objectAtIndex:](self->_stackItems, "objectAtIndex:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUINavigationDocumentController _activeNavigationController](self, "_activeNavigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewControllers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    objc_msgSend(v8, "viewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectIdenticalTo:", v12);

    objc_msgSend(v8, "document");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "onUnload");

    -[NSMutableArray removeObjectAtIndex:](self->_stackItems, "removeObjectAtIndex:", v7);
    objc_msgSend(v9, "setViewControllers:animated:", v11, 0);
    -[SKUINavigationDocumentController _handleStackDidChange](self, "_handleStackDidChange");

  }
}

BOOL __51__SKUINavigationDocumentController_removeDocument___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)replaceDocument:(id)a3 withDocument:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableArray *stackItems;
  uint64_t v12;
  SKUIDocumentContainerViewController *v13;
  void *v14;
  SKUIDocumentContainerViewController *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  SKUIDocumentStackItem *v24;
  void *v25;
  SKUIDocumentStackItem *v26;
  _QWORD v27[5];
  id v28;
  SKUIDocumentStackItem *v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
    goto LABEL_3;
  stackItems = self->_stackItems;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __73__SKUINavigationDocumentController_replaceDocument_withDocument_options___block_invoke;
  v31[3] = &unk_1E73A52A0;
  v32 = v8;
  v12 = -[NSMutableArray indexOfObjectPassingTest:](stackItems, "indexOfObjectPassingTest:", v31);

  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = [SKUIDocumentContainerViewController alloc];
    -[SKUINavigationDocumentController clientContext](self, "clientContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SKUIDocumentContainerViewController initWithDocument:options:clientContext:](v13, "initWithDocument:options:clientContext:", v9, v10, v14);

    if (v15)
    {
      v26 = -[SKUIDocumentStackItem initWithDocument:presentationOptions:]([SKUIDocumentStackItem alloc], "initWithDocument:presentationOptions:", v9, v10);
      -[SKUIDocumentStackItem setViewController:](v26, "setViewController:", v15);
      -[NSMutableArray objectAtIndex:](self->_stackItems, "objectAtIndex:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUINavigationDocumentController _activeNavigationController](self, "_activeNavigationController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "viewControllers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "viewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v18;
      v20 = objc_msgSend(v18, "indexOfObjectIdenticalTo:", v19);

      v21 = v17;
      if (v20 == 0x7FFFFFFFFFFFFFFFLL
        && (objc_msgSend(v17, "transitionCoordinator"), (v22 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v23 = (void *)v22;
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __73__SKUINavigationDocumentController_replaceDocument_withDocument_options___block_invoke_2;
        v27[3] = &unk_1E73A52F0;
        v27[4] = self;
        v28 = v16;
        v30 = v12;
        v24 = v26;
        v29 = v26;
        objc_msgSend(v23, "animateAlongsideTransition:completion:", 0, v27);

      }
      else
      {
        v24 = v26;
        -[SKUINavigationDocumentController _applyDocumentReplacementForOldStackItem:atOldIndex:withStackItem:](self, "_applyDocumentReplacementForOldStackItem:atOldIndex:withStackItem:", v16, v12, v26);
      }

    }
    else
    {
      NSLog(CFSTR("No view controller for document: %@, options: %@"), v9, v10);
    }

  }
  else
  {
LABEL_3:
    -[SKUINavigationDocumentController pushDocument:options:](self, "pushDocument:options:", v9, v10);
  }

}

BOOL __73__SKUINavigationDocumentController_replaceDocument_withDocument_options___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

uint64_t __73__SKUINavigationDocumentController_replaceDocument_withDocument_options___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyDocumentReplacementForOldStackItem:atOldIndex:withStackItem:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (id)_activeNavigationController
{
  UINavigationController *moreNavigationController;

  moreNavigationController = self->_moreNavigationController;
  if (moreNavigationController)
    return moreNavigationController;
  moreNavigationController = self->_overrideNavigationController;
  if (moreNavigationController)
    return moreNavigationController;
  else
    return self->_navigationController;
}

- (void)_applyDocumentReplacementForOldStackItem:(id)a3 atOldIndex:(int64_t)a4 withStackItem:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a5;
  -[SKUINavigationDocumentController _activeNavigationController](self, "_activeNavigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewControllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v16, "viewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "indexOfObjectIdenticalTo:", v12);

  objc_msgSend(v8, "viewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray addObject:](self->_stackItems, "addObject:", v8);
    objc_msgSend(v9, "pushViewController:animated:", v14, objc_msgSend(v8, "isAnimated"));
  }
  else
  {
    objc_msgSend(v16, "document");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "onUnload");

    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_stackItems, "replaceObjectAtIndex:withObject:", a4, v8);
    objc_msgSend(v11, "replaceObjectAtIndex:withObject:", v13, v14);
    objc_msgSend(v9, "setViewControllers:animated:", v11, objc_msgSend(v8, "isAnimated"));
  }
  -[SKUINavigationDocumentController _handleStackDidChange](self, "_handleStackDidChange");

}

- (void)_ensureStackConsistencyForNavigationControllerOperation:(int64_t)a3 operationDidComplete:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v6;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  SKUIDocumentStackItem *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  SKUINavigationDocumentController *v32;
  id v33;
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v4 = (a3 & 0xFFFFFFFFFFFFFFFDLL) == 1 && !a4;
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1 || a4)
  {
    v6 = a4;
    -[SKUINavigationDocumentController _activeNavigationController](self, "_activeNavigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewControllers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = v6;
    if (v6)
    {
      v10 = -[NSMutableArray count](self->_stackItems, "count");
      if (v10)
      {
        v11 = v10 - 1;
        do
        {
          -[NSMutableArray objectAtIndex:](self->_stackItems, "objectAtIndex:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "viewController");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v9, "indexOfObjectIdenticalTo:", v13);

          if (v14 == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v12, "document");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "onUnload");

            -[NSMutableArray removeObjectAtIndex:](self->_stackItems, "removeObjectAtIndex:", v11);
          }

          --v11;
        }
        while (v11 != -1);
      }
    }
    if (v4)
    {
      -[SKUINavigationDocumentController delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v27 = v16;
        v29 = objc_msgSend(v9, "count");
        if (v29)
        {
          v17 = 0;
          v18 = 0;
          do
          {
            objc_msgSend(v9, "objectAtIndex:", v17);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17 >= -[NSMutableArray count](self->_stackItems, "count"))
            {
              v20 = 0;
            }
            else
            {
              -[NSMutableArray objectAtIndex:](self->_stackItems, "objectAtIndex:", v17);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v20, "viewController");
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19 != v21)
            {
              v22 = -[SKUIDocumentStackItem initWithDocument:presentationOptions:]([SKUIDocumentStackItem alloc], "initWithDocument:presentationOptions:", 0, 0);
              -[SKUIDocumentStackItem setViewController:](v22, "setViewController:", v19);
              -[NSMutableArray insertObject:atIndex:](self->_stackItems, "insertObject:atIndex:", v22, v17);
              if (!v18)
                v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v34[0] = CFSTR("stackItem");
              v34[1] = CFSTR("viewControllerClass");
              v35[0] = v22;
              v23 = (objc_class *)objc_opt_class();
              NSStringFromClass(v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v35[1] = v24;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = (void *)objc_msgSend(v25, "mutableCopy");
              objc_msgSend(v18, "addObject:", v26);

            }
            ++v17;

          }
          while (v29 != v17);
        }
        else
        {
          v18 = 0;
        }
        v16 = v27;
        if (objc_msgSend(v18, "count"))
        {
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __113__SKUINavigationDocumentController__ensureStackConsistencyForNavigationControllerOperation_operationDidComplete___block_invoke;
          v30[3] = &unk_1E73A4A48;
          v31 = v27;
          v32 = self;
          v33 = v18;
          objc_msgSend(v31, "navigationDocumentController:requestsAccessToAppContextUsingBlock:", self, v30);

        }
      }

    }
    if (v28)
      -[SKUINavigationDocumentController _handleStackDidChange](self, "_handleStackDidChange");

  }
}

void __113__SKUINavigationDocumentController__ensureStackConsistencyForNavigationControllerOperation_operationDidComplete___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __113__SKUINavigationDocumentController__ensureStackConsistencyForNavigationControllerOperation_operationDidComplete___block_invoke_2;
  v8[3] = &unk_1E73A2970;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v9 = v4;
  v10 = v5;
  v11 = v6;
  v12 = v3;
  v7 = v3;
  objc_msgSend(v7, "evaluate:completionBlock:", v8, 0);

}

void __113__SKUINavigationDocumentController__ensureStackConsistencyForNavigationControllerOperation_operationDidComplete___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "jsNavigationDocumentForNavigationDocumentController:inContext:", *(_QWORD *)(a1 + 40), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    obj = *(id *)(a1 + 48);
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v18 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v8, "objectForKey:", CFSTR("viewControllerClass"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<document><nativeViewPlaceholderTemplate viewControllerClass=\"%@\"></nativeViewPlaceholderTemplate></document>"), v9);
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A660]), "initWithAppContext:xmlStr:error:", *(_QWORD *)(a1 + 56), v10, 0);
          objc_msgSend(v11, "setNavigationDocument:", v3);
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A5E8]), "initWithAppContext:document:owner:", *(_QWORD *)(a1 + 56), v11, v3);
          objc_msgSend(v8, "setObject:forKey:", v12, CFSTR("placeholderTemplateDocument"));

        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v5);
    }

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __113__SKUINavigationDocumentController__ensureStackConsistencyForNavigationControllerOperation_operationDidComplete___block_invoke_3;
    v15[3] = &unk_1E73A29C0;
    v13 = *(void **)(a1 + 56);
    v16 = *(id *)(a1 + 48);
    objc_msgSend(v13, "evaluateDelegateBlockSync:", v15);

  }
}

void __113__SKUINavigationDocumentController__ensureStackConsistencyForNavigationControllerOperation_operationDidComplete___block_invoke_3(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKey:", CFSTR("stackItem"), (_QWORD)v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKey:", CFSTR("placeholderTemplateDocument"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_setDocument:", v8);

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v3);
  }

}

- (void)_handleStackDidChange
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[NSMutableArray firstObject](self->_stackItems, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UINavigationController tabBarItem](self->_navigationController, "tabBarItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTabBarItem:", v4);

  -[SKUINavigationDocumentController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "navigationDocumentStackDidChange:", self);

}

- (void)_scheduleFlushingPendingNavigationStackEnsureConsistencyRequestsWithTransitionCoordinator:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __126__SKUINavigationDocumentController__scheduleFlushingPendingNavigationStackEnsureConsistencyRequestsWithTransitionCoordinator___block_invoke;
  v3[3] = &unk_1E739FF90;
  v3[4] = self;
  objc_msgSend(a3, "animateAlongsideTransition:completion:", 0, v3);
}

void __126__SKUINavigationDocumentController__scheduleFlushingPendingNavigationStackEnsureConsistencyRequestsWithTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __126__SKUINavigationDocumentController__scheduleFlushingPendingNavigationStackEnsureConsistencyRequestsWithTransitionCoordinator___block_invoke_2;
  v3[3] = &unk_1E739FD38;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "_performBlockAfterCATransactionCommits:", v3);

}

void __126__SKUINavigationDocumentController__scheduleFlushingPendingNavigationStackEnsureConsistencyRequestsWithTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  void *i;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "transitionCoordinator");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD **)(a1 + 32);
  v8 = (id)v2;
  if (v2)
  {
    objc_msgSend(v3, "_scheduleFlushingPendingNavigationStackEnsureConsistencyRequestsWithTransitionCoordinator:", v2);
  }
  else
  {
    for (i = (void *)v3[1]; objc_msgSend(i, "count"); i = *(void **)(*(_QWORD *)(a1 + 32) + 8))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectAtIndex:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectAtIndex:", 0);
      objc_msgSend(*(id *)(a1 + 32), "_ensureStackConsistencyForNavigationControllerOperation:operationDidComplete:", objc_msgSend(v5, "navigationControllerOperation"), objc_msgSend(v5, "operationDidComplete"));

    }
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 8);
    *(_QWORD *)(v6 + 8) = 0;

  }
}

- (void)_unloadAllStackItems
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;

  v3 = -[NSMutableArray count](self->_stackItems, "count");
  if (v3 >= 1)
  {
    v4 = v3 + 1;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_stackItems, "objectAtIndex:", v4 - 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "document");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "onUnload");

      --v4;
    }
    while (v4 > 1);
  }
  -[NSMutableArray removeAllObjects](self->_stackItems, "removeAllObjects");
}

- (NSArray)documentStackItems
{
  return &self->_stackItems->super;
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (SKUINavigationDocumentDelegate)delegate
{
  return (SKUINavigationDocumentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UINavigationController)overrideNavigationController
{
  return self->_overrideNavigationController;
}

- (void)setOverrideNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_overrideNavigationController, a3);
}

- (UINavigationController)moreNavigationController
{
  return self->_moreNavigationController;
}

- (void)setMoreNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_moreNavigationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreNavigationController, 0);
  objc_storeStrong((id *)&self->_overrideNavigationController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_stackItems, 0);
  objc_storeStrong((id *)&self->_pendingNavigationStackEnsureConsistencyRequests, 0);
}

- (void)initWithNavigationController:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUINavigationDocumentController initWithNavigationController:]";
}

@end
