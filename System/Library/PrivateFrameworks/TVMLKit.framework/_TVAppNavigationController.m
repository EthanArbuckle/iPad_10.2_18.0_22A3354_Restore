@implementation _TVAppNavigationController

- (_TVAppNavigationController)initWithRootViewController:(id)a3
{
  _TVAppNavigationController *v3;
  _TVAppNavigationController *v4;
  objc_super v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_TVAppNavigationController;
  v3 = -[_TVAppNavigationController initWithRootViewController:](&v7, sel_initWithRootViewController_, a3);
  v4 = v3;
  if (v3)
  {
    v6.receiver = v3;
    v6.super_class = (Class)_TVAppNavigationController;
    -[_TVAppNavigationController setDelegate:](&v6, sel_setDelegate_, v3);
    v4->_maxNavControllerStackDepth = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v4;
}

- (_TVAppNavigationController)initWithApplicationController:(id)a3
{
  id v4;
  _TVAppNavigationController *v5;
  _TVAppNavigationController *v6;

  v4 = a3;
  v5 = -[_TVAppNavigationController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_appController, v4);
    v6->_maxNavControllerStackDepth = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (_TVAppNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  _TVAppNavigationController *v4;
  _TVAppNavigationController *v5;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_TVAppNavigationController;
  v4 = -[_TVAppNavigationController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  v5 = v4;
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)_TVAppNavigationController;
    -[_TVAppNavigationController setDelegate:](&v7, sel_setDelegate_, v4);
    v5->_maxNavControllerStackDepth = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v5;
}

- (void)setMaxNavControllerStackDepth:(unint64_t)a3
{
  NSObject *v3;

  if (a3 < 3)
  {
    v3 = TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEBUG))
      -[_TVAppNavigationController setMaxNavControllerStackDepth:].cold.1(v3);
  }
  else
  {
    self->_maxNavControllerStackDepth = a3;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVAppNavigationController;
  -[_TVAppNavigationController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == 2)
    -[_TVAppNavigationController setNavigationBarHidden:](self, "setNavigationBarHidden:", 1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TVAppNavigationController;
  -[_TVAppNavigationController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  if ((*(_BYTE *)&self->_ancDelegateFlags & 0x10) != 0)
  {
    -[_TVAppNavigationController appNavigationControllerDelegate](self, "appNavigationControllerDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appNavigationControllerWillDisappear:", self);

  }
}

- (void)setDelegate:(id)a3
{
  NSObject *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVAppNavigationController;
  -[_TVAppNavigationController setDelegate:](&v4, sel_setDelegate_, a3);
  v3 = TVMLKitLogObject;
  if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_ERROR))
    -[_TVAppNavigationController setDelegate:].cold.1(v3);
}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  objc_super v7;

  v4 = a3;
  -[_TVAppNavigationController title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[_TVAppNavigationController title](self, "title");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 != v4)
    {
      v7.receiver = self;
      v7.super_class = (Class)_TVAppNavigationController;
      -[_TVAppNavigationController setTitle:](&v7, sel_setTitle_, v4);
    }
  }

}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a6;
  objc_msgSend(v8, "customAnimatorForNavigationControllerOperation:toViewController:", a4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(v9, "customAnimatorForNavigationControllerOperation:fromViewController:", a4, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (void)setAppNavigationControllerDelegate:(id)a3
{
  _TVAppNavigationControllerDelegate **p_appNavigationControllerDelegate;
  id v5;
  char v6;
  id WeakRetained;
  char v8;
  id v9;
  char v10;
  id v11;
  char v12;
  id v13;
  char v14;
  id v15;

  p_appNavigationControllerDelegate = &self->_appNavigationControllerDelegate;
  v15 = a3;
  v5 = objc_storeWeak((id *)p_appNavigationControllerDelegate, v15);
  v6 = objc_opt_respondsToSelector();

  *(_BYTE *)&self->_ancDelegateFlags = *(_BYTE *)&self->_ancDelegateFlags & 0xFE | v6 & 1;
  WeakRetained = objc_loadWeakRetained((id *)p_appNavigationControllerDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = 2;
  else
    v8 = 0;
  *(_BYTE *)&self->_ancDelegateFlags = *(_BYTE *)&self->_ancDelegateFlags & 0xFD | v8;

  v9 = objc_loadWeakRetained((id *)p_appNavigationControllerDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = 4;
  else
    v10 = 0;
  *(_BYTE *)&self->_ancDelegateFlags = *(_BYTE *)&self->_ancDelegateFlags & 0xFB | v10;

  v11 = objc_loadWeakRetained((id *)p_appNavigationControllerDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v12 = 8;
  else
    v12 = 0;
  *(_BYTE *)&self->_ancDelegateFlags = *(_BYTE *)&self->_ancDelegateFlags & 0xF7 | v12;

  v13 = objc_loadWeakRetained((id *)p_appNavigationControllerDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v14 = 16;
  else
    v14 = 0;
  *(_BYTE *)&self->_ancDelegateFlags = *(_BYTE *)&self->_ancDelegateFlags & 0xEF | v14;

}

- (void)_handleMenuAction:(id)a3
{
  void *v4;

  -[_TVAppNavigationController presentingViewController](self, "presentingViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[_TVAppNavigationController popDocument](self, "popDocument");
}

- (void)loadView
{
  void *v3;
  UITapGestureRecognizer *v4;
  UITapGestureRecognizer *menuRecognizer;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_TVAppNavigationController;
  -[_TVAppNavigationController loadView](&v7, sel_loadView);
  -[_TVAppNavigationController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel__handleMenuAction_);
  menuRecognizer = self->_menuRecognizer;
  self->_menuRecognizer = v4;

  -[UITapGestureRecognizer setAllowedPressTypes:](self->_menuRecognizer, "setAllowedPressTypes:", &unk_24EBCD520);
  -[UITapGestureRecognizer setDelegate:](self->_menuRecognizer, "setDelegate:", self);
  objc_msgSend(v3, "addGestureRecognizer:", self->_menuRecognizer);
  -[_TVAppNavigationController navigationBar](self, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setHidesShadow:", 1);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[_TVAppNavigationController modalPresenterObserverToken](self, "modalPresenterObserverToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVAppNavigationController modalPresenterObserverToken](self, "modalPresenterObserverToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", v5);

  }
  v6.receiver = self;
  v6.super_class = (Class)_TVAppNavigationController;
  -[_TVAppNavigationController dealloc](&v6, sel_dealloc);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  BOOL v3;
  void *v5;
  void *v6;

  if (self->_menuRecognizer != a3)
    return 1;
  -[_TVAppNavigationController documents](self, "documents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "count") > 1)
  {
    v3 = 1;
  }
  else
  {
    -[_TVAppNavigationController viewControllers](self, "viewControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (unint64_t)objc_msgSend(v6, "count") > 1;

  }
  return v3;
}

- (UIViewController)currentViewController
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[_TVAppNavigationController presentedModalViewController](self, "presentedModalViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[_TVAppNavigationController viewControllers](self, "viewControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (UIViewController *)v5;
}

- (IKAppTabBar)appTabBar
{
  return 0;
}

- (void)clear
{
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v5[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVAppNavigationController setViewControllers:animated:](self, "setViewControllers:animated:", v4, 1);

}

- (void)setDocuments:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  _TVAppDocumentRequestController *v17;
  _TVAppDocumentRequestController *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(a4, "objectForKey:", CFSTR("animated"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "BOOLValue");
  else
    v9 = 1;
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        v17 = [_TVAppDocumentRequestController alloc];
        v18 = -[_TVAppDocumentRequestController initWithAppDocument:](v17, "initWithAppDocument:", v16, (_QWORD)v19);
        -[_TVAppNavigationController _doWillLoadAppDocumentWithController:](self, "_doWillLoadAppDocumentWithController:", v18);
        objc_msgSend(v10, "addObject:", v18);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  -[_TVAppNavigationController setViewControllers:animated:](self, "setViewControllers:animated:", v10, v9);
}

- (id)documents
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[_TVAppNavigationController viewControllers](self, "viewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v2, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v9, "appDocument", (_QWORD)v15);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            objc_msgSend(v9, "appDocument");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v11);

          }
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v6);
  }

  v12 = TVMLKitLogObject;
  if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v3;
    _os_log_impl(&dword_222D98000, v12, OS_LOG_TYPE_DEFAULT, "Nav controller returning app documents: %@", buf, 0xCu);
  }
  v13 = (void *)objc_msgSend(v3, "copy", (_QWORD)v15);

  return v13;
}

- (void)insertDocument:(id)a3 beforeDocument:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _TVAppNavigationController *v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_TVAppNavigationController viewControllers](self, "viewControllers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __68___TVAppNavigationController_insertDocument_beforeDocument_options___block_invoke;
  v16[3] = &unk_24EB85858;
  v17 = v9;
  v18 = self;
  v19 = v8;
  v20 = v10;
  v13 = v10;
  v14 = v8;
  v15 = v9;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v16);

}

- (void)pushDocument:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _TVAppDocumentRequestController *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = TVMLKitLogObject;
  if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412546;
    v19 = v6;
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_222D98000, v8, OS_LOG_TYPE_DEFAULT, "Nav controller pushing app document: %@, options: %@", (uint8_t *)&v18, 0x16u);
  }
  v9 = -[_TVAppDocumentRequestController initWithAppDocument:]([_TVAppDocumentRequestController alloc], "initWithAppDocument:", v6);
  -[_TVAppDocumentController setPresentedModal:](v9, "setPresentedModal:", 0);
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BE51868]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  -[_TVAppDocumentController setAdoptsContext:](v9, "setAdoptsContext:", v11);
  -[_TVAppNavigationController _doWillLoadAppDocumentWithController:](self, "_doWillLoadAppDocumentWithController:", v9);
  +[TVStorePlaybackLaunchShroud sharedShroud](TVStorePlaybackLaunchShroud, "sharedShroud");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isHidden");

  -[_TVAppNavigationController viewControllers](self, "viewControllers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("hidesBottomBarWhenPushed"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

  }
  else
  {
    v16 = 0;
  }

  -[_TVAppDocumentRequestController setHidesBottomBarWhenPushed:](v9, "setHidesBottomBarWhenPushed:", v16);
  -[_TVAppNavigationController viewControllers](self, "viewControllers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVAppNavigationController pushViewController:animated:](self, "pushViewController:animated:", v9, (objc_msgSend(v17, "count") | v13) != 0);

}

- (void)presentModal:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _TVAppDocumentRequestController *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[_TVAppNavigationController presentedModalViewController](self, "presentedModalViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "appDocument");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  if (!-[_TVAppNavigationController _shouldOverrideModalBehaviorForPlaybackDocument:andExistingPlaybackDocument:](self, "_shouldOverrideModalBehaviorForPlaybackDocument:andExistingPlaybackDocument:", v12, v8))
  {
    v9 = -[_TVAppDocumentRequestController initWithAppDocument:]([_TVAppDocumentRequestController alloc], "initWithAppDocument:", v12);
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BE51868]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    -[_TVAppDocumentController setAdoptsContext:](v9, "setAdoptsContext:", v11);
    -[_TVAppNavigationController _presentModalDocumentController:options:](self, "_presentModalDocumentController:options:", v9, v6);

  }
}

- (void)_presentModalDocumentController:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  TVModalPresenterConfiguration *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  id *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  BOOL v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  TVModalPresenterConfiguration *v32;
  id v33;
  id v34;
  void (**v35)(void);
  id v36;
  _QWORD v37[4];
  void (**v38)(void);
  _QWORD v39[4];
  void (**v40)(void);
  _QWORD v41[5];
  TVModalPresenterConfiguration *v42;
  id v43;
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id location[2];

  v6 = a3;
  v36 = a4;
  objc_initWeak(location, self);
  objc_msgSend(v6, "setPresentedModal:", 1);
  -[_TVAppNavigationController modalPresenterObserverToken](self, "modalPresenterObserverToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = MEMORY[0x24BDAC760];
    v46[1] = 3221225472;
    v46[2] = __70___TVAppNavigationController__presentModalDocumentController_options___block_invoke;
    v46[3] = &unk_24EB86388;
    objc_copyWeak(&v47, location);
    objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", CFSTR("TVModalPresenterDismissedNotification"), 0, v9, v46);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[_TVAppNavigationController setModalPresenterObserverToken:](self, "setModalPresenterObserverToken:", v10);
    objc_destroyWeak(&v47);
  }
  -[_TVAppNavigationController presentedModalViewController](self, "presentedModalViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[TVModalPresenterConfiguration initWithDictionary:]([TVModalPresenterConfiguration alloc], "initWithDictionary:", v36);
  -[_TVAppNavigationController _doWillLoadAppDocumentWithController:](self, "_doWillLoadAppDocumentWithController:", v6);
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __70___TVAppNavigationController__presentModalDocumentController_options___block_invoke_2;
  v41[3] = &unk_24EB885A8;
  v41[4] = self;
  objc_copyWeak(&v45, location);
  v32 = v12;
  v42 = v32;
  v33 = v11;
  v43 = v33;
  v34 = v6;
  v44 = v34;
  v35 = (void (**)(void))MEMORY[0x22767F470](v41);
  -[_TVAppNavigationController presentedViewController](self, "presentedViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[_TVAppNavigationController presentedViewController](self, "presentedViewController");
    v12 = (TVModalPresenterConfiguration *)objc_claimAutoreleasedReturnValue();
    +[_TVModalPresenter presenter](_TVModalPresenter, "presenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "modalRootViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[TVModalPresenterConfiguration isEqual:](v12, "isEqual:", v15);

    if ((v16 & 1) == 0)
    {
      v39[0] = MEMORY[0x24BDAC760];
      v39[1] = 3221225472;
      v39[2] = __70___TVAppNavigationController__presentModalDocumentController_options___block_invoke_2_55;
      v39[3] = &unk_24EB85320;
      v40 = v35;
      -[_TVAppNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v39);
      v19 = (id *)&v40;
LABEL_19:

      goto LABEL_20;
    }
  }
  +[_TVModalPresenter presenter](_TVModalPresenter, "presenter");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "modalRootViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "presentingViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[_TVAppNavigationController presentedViewController](self, "presentedViewController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[_TVModalPresenter presenter](_TVModalPresenter, "presenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "modalRootViewController");
    v12 = (TVModalPresenterConfiguration *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v30, "isEqual:", v12))
    {

LABEL_18:
      +[_TVModalPresenter presenter](_TVModalPresenter, "presenter");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __70___TVAppNavigationController__presentModalDocumentController_options___block_invoke_3_56;
      v37[3] = &unk_24EB85320;
      v38 = v35;
      objc_msgSend(v27, "hideAllAnimated:withCompletion:", 0, v37);
      v19 = (id *)&v38;

      goto LABEL_19;
    }
  }
  +[_TVModalPresenter presenter](_TVModalPresenter, "presenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "modalRootViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "viewControllers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v22, "count") < 2)
  {
    v26 = 0;
  }
  else
  {
    +[_TVModalPresenter presenter](_TVModalPresenter, "presenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "modalRootViewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "visibleViewController");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v26 = v25 != v33 && -[TVModalPresenterConfiguration navigationBarHidden](v32, "navigationBarHidden");

  }
  if (v18)
  {

  }
  if (v26)
    goto LABEL_18;
  objc_msgSend(v34, "parentViewController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
    v35[2]();
LABEL_20:

  objc_destroyWeak(&v45);
  objc_destroyWeak(location);

}

- (void)dismissed
{
  void *v3;
  BOOL v4;

  -[_TVAppNavigationController presentedModalViewController](self, "presentedModalViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_TVAppNavigationController _shouldIgnoreModalDismissal:](self, "_shouldIgnoreModalDismissal:", v3);

  if (!v4)
    -[_TVAppNavigationController setPresentedModalViewController:](self, "setPresentedModalViewController:", 0);
}

- (void)dismissModal
{
  -[_TVAppNavigationController dismissModal:](self, "dismissModal:", 1);
}

- (void)dismissModal:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  -[_TVAppNavigationController presentedModalViewController](self, "presentedModalViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_TVAppNavigationController _shouldIgnoreModalDismissal:](self, "_shouldIgnoreModalDismissal:", v5);

  if (!v6)
  {
    -[_TVAppNavigationController presentedModalViewController](self, "presentedModalViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      +[_TVModalPresenter presenter](_TVModalPresenter, "presenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVAppNavigationController presentedModalViewController](self, "presentedModalViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hideController:animated:withCompletion:", v9, v3, 0);

      -[_TVAppNavigationController setPresentedModalViewController:](self, "setPresentedModalViewController:", 0);
    }
  }
}

- (void)dismissAllModals:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  void (**v24)(_QWORD);
  _QWORD v25[4];
  void (**v26)(_QWORD);
  _QWORD v27[4];
  void (**v28)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[_TVAppNavigationController presentedViewController](self, "presentedViewController");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_3;
  v6 = (void *)v5;
  -[_TVAppNavigationController presentedViewController](self, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_TVModalPresenter presenter](_TVModalPresenter, "presenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "modalRootViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if ((v10 & 1) == 0)
  {
    -[_TVAppNavigationController presentedViewController](self, "presentedViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[_TVAppNavigationController presentedViewController](self, "presentedViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (id)objc_msgSend(v18, "popToRootViewControllerAnimated:", 0);

    }
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __47___TVAppNavigationController_dismissAllModals___block_invoke;
    v27[3] = &unk_24EB85320;
    v28 = v4;
    -[_TVAppNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, v27);
    v15 = v28;
  }
  else
  {
LABEL_3:
    +[_TVModalPresenter presenter](_TVModalPresenter, "presenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "modalRootViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "presentingViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      +[_TVModalPresenter presenter](_TVModalPresenter, "presenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __47___TVAppNavigationController_dismissAllModals___block_invoke_2;
      v25[3] = &unk_24EB85320;
      v26 = v4;
      objc_msgSend(v14, "hideAllAnimated:withCompletion:", 0, v25);

      v15 = v26;
    }
    else
    {
      -[_TVAppNavigationController presentedModalViewController](self, "presentedModalViewController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        v4[2](v4);
        goto LABEL_11;
      }
      +[_TVModalPresenter presenter](_TVModalPresenter, "presenter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVAppNavigationController presentedModalViewController](self, "presentedModalViewController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __47___TVAppNavigationController_dismissAllModals___block_invoke_3;
      v23[3] = &unk_24EB85320;
      v24 = v4;
      objc_msgSend(v21, "hideController:animated:withCompletion:", v22, 0, v23);

      -[_TVAppNavigationController setPresentedModalViewController:](self, "setPresentedModalViewController:", 0);
      v15 = v24;
    }
  }

LABEL_11:
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;
  _QWORD v15[2];

  v4 = a4;
  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (-[_TVAppNavigationController _hasBeenCleared](self, "_hasBeenCleared"))
  {
    v15[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVAppNavigationController setViewControllers:animated:](self, "setViewControllers:animated:", v7, v4);
  }
  else
  {
    -[_TVAppNavigationController viewControllers](self, "viewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    if (v7)
    {
      v9 = v8;
      if (v8 >= 4 && v8 >= self->_maxNavControllerStackDepth)
      {
        v10 = objc_alloc(MEMORY[0x24BDBCEB8]);
        objc_msgSend(v7, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v10, "initWithObjects:", v11, 0);

        objc_msgSend(v7, "subarrayWithRange:", 2, v9 - 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObjectsFromArray:", v13);

        -[_TVAppNavigationController setViewControllers:](self, "setViewControllers:", v12);
      }
    }
    v14.receiver = self;
    v14.super_class = (Class)_TVAppNavigationController;
    -[_TVAppNavigationController pushViewController:animated:](&v14, sel_pushViewController_animated_, v6, v4);
  }

}

- (void)popDocument
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _OWORD v19[4];
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  memset(v19, 0, sizeof(v19));
  -[_TVAppNavigationController viewControllers](self, "viewControllers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v4, "reverseObjectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", v19, v22, 16))
  {
    v6 = (void *)**((_QWORD **)&v19[0] + 1);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v7 = (void *)TVMLKitLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEFAULT))
      {
        v8 = v7;
        objc_msgSend(v6, "appDocument");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v21 = v9;
        _os_log_impl(&dword_222D98000, v8, OS_LOG_TYPE_DEFAULT, "Nav controller popping top app document: %@", buf, 0xCu);

      }
    }
    -[_TVAppNavigationController viewControllers](self, "viewControllers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count") == 1
      && (-[_TVAppNavigationController presentingViewController](self, "presentingViewController"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          v11))
    {
      -[_TVAppNavigationController presentingViewController](self, "presentingViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 1, 0);

    }
    else
    {
      objc_msgSend(v10, "lastObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 == v6)
      {
        v17 = (id)-[_TVAppNavigationController popViewControllerAnimated:](self, "popViewControllerAnimated:", 1);
      }
      else
      {
        objc_msgSend(v10, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14 == v6)
        {
          v18 = -[_TVAppNavigationController popToRootViewControllerAnimated:](self, "popToRootViewControllerAnimated:", 1);
        }
        else
        {
          objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v10, "indexOfObjectIdenticalTo:", v6) - 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (id)-[_TVAppNavigationController popToViewController:animated:](self, "popToViewController:animated:", v15, 1);

        }
      }
    }

  }
}

- (void)popToDocument:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = TVMLKitLogObject;
  if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v4;
    _os_log_impl(&dword_222D98000, v5, OS_LOG_TYPE_DEFAULT, "Nav controller popping to app document: %@", buf, 0xCu);
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[_TVAppNavigationController viewControllers](self, "viewControllers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v12, "appDocument");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqual:", v4);

          if (v14)
          {
            v15 = (id)-[_TVAppNavigationController popToViewController:animated:](self, "popToViewController:animated:", v12, 1);
            goto LABEL_14;
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_14:

}

- (id)popToRootDocument:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[8];
  _BYTE v21[128];
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x24BDAC8D0];
  v5 = TVMLKitLogObject;
  if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D98000, v5, OS_LOG_TYPE_DEFAULT, "Nav controller popping to root app document.", buf, 2u);
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[_TVAppNavigationController viewControllers](self, "viewControllers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v12, "appDocument");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            -[_TVAppNavigationController popToViewController:animated:](self, "popToViewController:animated:", v12, v3);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_14;
          }
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (v9)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_14:

  return v14;
}

- (void)popToRootDocument
{
  id v2;

  v2 = -[_TVAppNavigationController popToRootDocument:](self, "popToRootDocument:", 1);
}

- (void)removeDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[_TVAppNavigationController viewControllers](self, "viewControllers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "appDocument");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqual:", v4);

          if (v13)
          {
            -[_TVAppNavigationController viewControllers](self, "viewControllers");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = (void *)objc_msgSend(v14, "mutableCopy");

            objc_msgSend(v15, "removeObject:", v11);
            -[_TVAppNavigationController setViewControllers:animated:](self, "setViewControllers:animated:", v15, 1);

            goto LABEL_12;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_12:

}

- (void)replaceDocument:(id)a3 withDocument:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _TVAppNavigationController *v22;
  char v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = TVMLKitLogObject;
  if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_222D98000, v11, OS_LOG_TYPE_DEFAULT, "Nav controller replacing document %@ with document %@.", buf, 0x16u);
  }
  v12 = objc_msgSend(v8, "tv_isPresentedModal");
  -[_TVAppNavigationController viewControllers](self, "viewControllers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __67___TVAppNavigationController_replaceDocument_withDocument_options___block_invoke;
  v18[3] = &unk_24EB885D0;
  v19 = v8;
  v20 = v9;
  v23 = v12;
  v21 = v10;
  v22 = self;
  v15 = v10;
  v16 = v9;
  v17 = v8;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v18);

}

- (id)activeDocument
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  -[_TVAppNavigationController currentViewController](self, "currentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_2557C8770))
  {
    objc_msgSend(v2, "currentViewController");
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v3;
  }
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_2557AEB30))
    v4 = v2;
  else
    v4 = 0;
  objc_msgSend(v4, "activeDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)popToRootViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v3 = a3;
  -[_TVAppNavigationController viewControllers](self, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_TVAppNavigationController popToRootDocument:](self, "popToRootDocument:", v3);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_TVAppNavigationController;
    -[_TVAppNavigationController popToRootViewControllerAnimated:](&v10, sel_popToRootViewControllerAnimated_, v3);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x24BDD16D0];
  v6 = a3;
  objc_msgSend(v5, "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("TVAppNavigationDidDisplayViewControllerNotification"), v6);

}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x24BDD16D0];
  v6 = a3;
  objc_msgSend(v5, "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("TVAppNavigationWillDisplayViewControllerNotification"), v6);

}

- (BOOL)_hasBeenCleared
{
  void *v2;
  char isKindOfClass;

  -[_TVAppNavigationController topViewController](self, "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_doWillLoadAppDocumentWithController:(id)a3
{
  id v4;
  id v5;

  if ((*(_BYTE *)&self->_ancDelegateFlags & 8) != 0)
  {
    v4 = a3;
    -[_TVAppNavigationController appNavigationControllerDelegate](self, "appNavigationControllerDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appNavigationController:willLoadAppDocumentWithController:", self, v4);

  }
}

- (BOOL)_shouldIgnoreModalDismissal:(id)a3
{
  _TVAppNavigationController *v4;
  id v5;
  void *v6;

  if ((*(_BYTE *)&self->_ancDelegateFlags & 2) == 0)
    return 0;
  v4 = self;
  v5 = a3;
  -[_TVAppNavigationController appNavigationControllerDelegate](v4, "appNavigationControllerDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "appNavigationController:shouldIgnoreDismissalForViewController:", v4, v5);

  return (char)v4;
}

- (BOOL)_shouldOverrideModalBehaviorForPlaybackDocument:(id)a3 andExistingPlaybackDocument:(id)a4
{
  _TVAppNavigationController *v6;
  id v7;
  id v8;
  void *v9;

  if ((*(_BYTE *)&self->_ancDelegateFlags & 1) == 0)
    return 0;
  v6 = self;
  v7 = a4;
  v8 = a3;
  -[_TVAppNavigationController appNavigationControllerDelegate](v6, "appNavigationControllerDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v9, "appNavigationController:shouldOverrideModalBehaviorForDocument:andExistingDocument:", v6, v8, v7);

  return (char)v6;
}

- (TVApplicationController)appController
{
  return (TVApplicationController *)objc_loadWeakRetained((id *)&self->_appController);
}

- (_TVAppNavigationControllerDelegate)appNavigationControllerDelegate
{
  return (_TVAppNavigationControllerDelegate *)objc_loadWeakRetained((id *)&self->_appNavigationControllerDelegate);
}

- (unint64_t)maxNavControllerStackDepth
{
  return self->_maxNavControllerStackDepth;
}

- (UITapGestureRecognizer)menuRecognizer
{
  return self->_menuRecognizer;
}

- (void)setMenuRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_menuRecognizer, a3);
}

- (UIViewController)presentedModalViewController
{
  return self->_presentedModalViewController;
}

- (void)setPresentedModalViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentedModalViewController, a3);
}

- (NSObject)modalPresenterObserverToken
{
  return self->_modalPresenterObserverToken;
}

- (void)setModalPresenterObserverToken:(id)a3
{
  objc_storeStrong((id *)&self->_modalPresenterObserverToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modalPresenterObserverToken, 0);
  objc_storeStrong((id *)&self->_presentedModalViewController, 0);
  objc_storeStrong((id *)&self->_menuRecognizer, 0);
  objc_destroyWeak((id *)&self->_appNavigationControllerDelegate);
  objc_destroyWeak((id *)&self->_appController);
}

- (void)setMaxNavControllerStackDepth:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_222D98000, log, OS_LOG_TYPE_DEBUG, "New max navigation controller stack depth is ignored as the value is less than the minimum stack depth.", v1, 2u);
}

- (void)setDelegate:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_222D98000, log, OS_LOG_TYPE_ERROR, "Warning: Changing TVNavigationController's UINavigationControllerDelegate is not recommended because it is itself the delegate in order to implement its UIViewController (TVMLKitNavigationAdditions)", v1, 2u);
}

@end
