@implementation SUViewController

- (SUViewController)init
{
  SUViewController *v2;
  SUNavigationItem *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUViewController;
  v2 = -[SUViewController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SUNavigationItem);
    -[SUViewController _setExistingNavigationItem:](v2, "_setExistingNavigationItem:", v3);
    v2->_shouldInvalidateForMemoryPurge = 1;
    v2->_showsLibraryButton = 1;
    -[SUViewController setContainmentSupport:](v2, "setContainmentSupport:", 0);
    -[SUViewController reloadContentSizeForViewInPopover](v2, "reloadContentSizeForViewInPopover");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel__applicationDidEnterBackgroundNotification_, *MEMORY[0x24BDF7528], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel__applicationWillEnterForegroundNotification_, *MEMORY[0x24BDF75D0], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel__keyboardDidHideNotification_, *MEMORY[0x24BDF79F8], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel__keyboardDidShowNotification_, *MEMORY[0x24BDF7A00], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel__keyboardWillHideNotification_, *MEMORY[0x24BDF7B78], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel__keyboardWillShowNotification_, *MEMORY[0x24BDF7B80], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel__exitStoreButtonDidChangeNotification_, CFSTR("SUClientExitStoreButtonDidChangeNotification"), 0);

  }
  return v2;
}

- (SUViewController)initWithSection:(id)a3
{
  id v4;
  SUViewController *v5;
  SUViewController *v6;

  v4 = a3;
  v5 = -[SUViewController init](self, "init");
  v6 = v5;
  if (v5)
    -[SUViewController setSection:](v5, "setSection:", v4);

  return v6;
}

- (void)dealloc
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int64_t transitionSafetyCount;
  UIViewController *footerViewController;
  void *v12;
  void *v13;
  UIViewController *v14;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7528], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF75D0], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF79F8], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7A00], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7B78], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7B80], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SUClientExitStoreButtonDidChangeNotification"), 0);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_cancelOnDeallocOperations;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "setDelegate:", 0);
        objc_msgSend(v9, "cancel");
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  -[NSMutableArray makeObjectsPerformSelector:withObject:](self->_operations, "makeObjectsPerformSelector:withObject:", sel_setCompletionBlock_, 0);
  -[NSMutableArray makeObjectsPerformSelector:withObject:](self->_operations, "makeObjectsPerformSelector:withObject:", sel_setDelegate_, 0);
  transitionSafetyCount = self->_transitionSafetyCount;
  if (transitionSafetyCount >= 1)
  {
    do
    {
      self->_transitionSafetyCount = transitionSafetyCount - 1;
      objc_msgSend((id)objc_opt_class(), "endTransitionSafety");
      transitionSafetyCount = self->_transitionSafetyCount;
    }
    while (transitionSafetyCount > 0);
  }
  footerViewController = self->_footerViewController;
  if (footerViewController)
  {
    if (-[UIViewController isViewLoaded](footerViewController, "isViewLoaded"))
    {
      -[UIViewController view](self->_footerViewController, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "superviewOfClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeHitTestTarget:", v12);

    }
    -[SUViewController removeChildViewController:](self, "removeChildViewController:", self->_footerViewController);
    v14 = self->_footerViewController;
    self->_footerViewController = 0;

  }
  if (self->_inputAccessoryViewController)
    -[SUViewController removeChildViewController:](self, "removeChildViewController:");
  -[UIBarButtonItem setTarget:](self->_exitStoreButton, "setTarget:", 0);
  -[SURotationController setViewController:](self->_rotationController, "setViewController:", 0);

  v15.receiver = self;
  v15.super_class = (Class)SUViewController;
  -[SUViewController dealloc](&v15, sel_dealloc);
}

- (id)copyChildViewControllersForReason:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[SUViewController childViewControllers](self, "childViewControllers", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[SUViewController presentedViewController](self, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "removeObjectIdenticalTo:", v6);

  return v5;
}

- (void)cancelOperations
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = self->_cancelOnDeallocOperations;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v8, "setCompletionBlock:", 0);
        objc_msgSend(v8, "setDelegate:", 0);
        objc_msgSend(v8, "cancel");
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v5);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = self->_operations;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * j);
        objc_msgSend(v14, "setCompletionBlock:", 0, (_QWORD)v15);
        objc_msgSend(v14, "setDelegate:", 0);
        objc_msgSend(v14, "cancel");
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v11);
  }

  -[NSMutableArray removeAllObjects](self->_cancelOnDeallocOperations, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_operations, "removeAllObjects");
}

- (SUClientInterface)clientInterface
{
  SUClientInterface *v2;

  v2 = self->_clientInterface;
  if (!v2)
  {
    +[SUClientDispatch clientInterface](SUClientDispatch, "clientInterface");
    v2 = (SUClientInterface *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)copyDefaultScriptProperties
{
  SUViewControllerScriptProperties *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = objc_alloc_init(SUViewControllerScriptProperties);
  -[SUViewControllerScriptProperties setShowsHorizontalScrollIndicator:](v3, "setShowsHorizontalScrollIndicator:", 1);
  -[SUViewControllerScriptProperties setShowsVerticalScrollIndicator:](v3, "setShowsVerticalScrollIndicator:", 1);
  objc_msgSend(MEMORY[0x24BEC8C48], "sharedCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLBagForContext:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "valueForKey:", CFSTR("p2-client-options"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v8 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("always-dispatch-scroll-events"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = objc_msgSend(v8, "BOOLValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "userInterfaceIdiom");

    v9 = (v11 & 0xFFFFFFFFFFFFFFFBLL) != 1;
  }
  -[SUViewControllerScriptProperties setAlwaysDispatchesScrollEvents:](v3, "setAlwaysDispatchesScrollEvents:", v9);
  -[SUViewController viewControllerFactory](self, "viewControllerFactory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "newPlaceholderViewController");

  -[SUViewController clientInterface](self, "clientInterface");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setClientInterface:", v14);

  objc_msgSend(v13, "loadingView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUViewControllerScriptProperties setLoadingIndicatorStyle:](v3, "setLoadingIndicatorStyle:", objc_msgSend(v15, "activityIndicatorStyle"));
  objc_msgSend(v15, "textColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUViewControllerScriptProperties setLoadingTextColor:](v3, "setLoadingTextColor:", v16);

  objc_msgSend(v15, "textShadowColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUViewControllerScriptProperties setLoadingTextShadowColor:](v3, "setLoadingTextShadowColor:", v17);

  objc_msgSend(v13, "backgroundGradient");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUViewControllerScriptProperties setPlaceholderBackgroundGradient:](v3, "setPlaceholderBackgroundGradient:", v18);

  -[UIViewController section](self, "section");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "loadingTextColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    -[SUViewControllerScriptProperties setLoadingTextColor:](v3, "setLoadingTextColor:", v20);
  objc_msgSend(v19, "loadingTextShadowColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    -[SUViewControllerScriptProperties setLoadingTextShadowColor:](v3, "setLoadingTextShadowColor:", v21);

  return v3;
}

- (id)copyScriptProperties
{
  if (self->_cachedScriptProperties)
    return (id)-[SUViewControllerScriptProperties copy](self->_cachedScriptProperties, "copy");
  else
    return -[SUViewController copyDefaultScriptProperties](self, "copyDefaultScriptProperties");
}

- (double)defaultPNGExpirationTime
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  v4 = v3;

  return v4;
}

- (NSString)defaultPNGName
{
  void *v2;
  uint64_t v3;

  -[UIViewController section](self, "section");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "defaultPNGStyle");

  if (v3 == 1)
    return (NSString *)CFSTR("Default-Dark");
  else
    return 0;
}

- (void)dismissFooterViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (self->_footerViewController)
  {
    v3 = a3;
    -[SUViewController view](self, "view");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "tag") != 1718903668)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUViewController.m"), 302, CFSTR("Incorrect view hierarchy"));

    }
    -[UIViewController view](self->_footerViewController, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "superviewOfClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeHitTestTarget:", v6);

    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "beginIgnoringInteractionEvents");

    -[UIViewController viewWillDisappear:](self->_footerViewController, "viewWillDisappear:", v3);
    if (v3)
    {
      objc_msgSend(MEMORY[0x24BDF6F90], "beginAnimations:context:", CFSTR("dismiss"), 0);
      objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationDelegate:", self);
      objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationDidStopSelector:", sel__dismissFooterAnimationDidStop_);
      objc_msgSend(v10, "setFooterVisible:", 0);
      objc_msgSend(MEMORY[0x24BDF6F90], "commitAnimations");
    }
    else
    {
      -[SUViewController _dismissFooterAnimationDidStop:](self, "_dismissFooterAnimationDidStop:", 0);
    }

  }
}

- (void)enqueueOperation:(id)a3 cancelOnDealloc:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _BYTE v15[24];
  uint64_t v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldLog");
  if (objc_msgSend(v7, "shouldLogToDisk"))
    v9 = v8 | 2;
  else
    v9 = v8;
  objc_msgSend(v7, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    v9 &= 2u;
  if (!v9)
    goto LABEL_9;
  *(_DWORD *)v15 = 138543874;
  *(_QWORD *)&v15[4] = objc_opt_class();
  *(_WORD *)&v15[12] = 2112;
  *(_QWORD *)&v15[14] = v6;
  *(_WORD *)&v15[22] = 1024;
  LODWORD(v16) = v4;
  v11 = *(id *)&v15[4];
  LODWORD(v14) = 28;
  v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v12, 4, v15, v14, *(_OWORD *)v15, *(_QWORD *)&v15[16], v16);
    v10 = objc_claimAutoreleasedReturnValue();
    free(v12);
    SSFileLog();
LABEL_9:

  }
  -[SUViewController trackOperation:cancelOnDealloc:](self, "trackOperation:cancelOnDealloc:", v6, v4);
  objc_msgSend(MEMORY[0x24BEC8BE8], "mainQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addOperation:", v6);

}

- (void)handleApplicationURL:(id)a3
{
  -[SUViewController handleApplicationURL:withSourceApplication:sourceURL:](self, "handleApplicationURL:withSourceApplication:sourceURL:", a3, 0, 0);
}

- (void)invalidate
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = -[SUViewController copyChildViewControllersForReason:](self, "copyChildViewControllersForReason:", 2);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "invalidate", (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[SUViewController resetRestoredContext](self, "resetRestoredContext");
}

- (BOOL)isVisible
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  BOOL v8;
  SUViewController *v9;
  SUViewController *v10;

  if (-[SUViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[SUViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }
  -[SUViewController presentedViewController](self, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = 0;
  else
    v8 = v5;
  if (v6 && v5)
    v8 = objc_msgSend(v6, "modalPresentationStyle") != 0;
  -[UIViewController overlayViewController](self, "overlayViewController");
  v9 = (SUViewController *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if (-[SUViewController isActiveOverlay](v9, "isActiveOverlay"))
    {
      if (v10 != self)
        v8 = -[SUViewController isVisible](v10, "isVisible");
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)isVisibleAndFrontmost
{
  BOOL v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;
  void *v9;
  void *v10;

  v3 = -[SUViewController isVisible](self, "isVisible");
  -[SUViewController presentedViewController](self, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    || (-[UIViewController iTunesStoreUI_searchFieldController](self, "iTunesStoreUI_searchFieldController"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isActive"),
        v5,
        (v6 & 1) != 0))
  {
    v7 = 0;
  }
  else
  {
    -[UIViewController overlayViewController](self, "overlayViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v7 = 1;
    }
    else
    {
      -[UIViewController overlayBackgroundViewController](self, "overlayBackgroundViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v10 == 0;

    }
  }
  return v3 && v7;
}

- (id)newRotationController
{
  return 0;
}

- (BOOL)presentDialog:(id)a3 pendUntilVisible:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  id v15;
  void *v16;
  NSMutableArray *pendingDialogs;
  NSMutableArray *v18;
  NSMutableArray *v19;
  NSObject *v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (-[SUViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[SUViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[SUViewController clientInterface](self, "clientInterface");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_presentDialog:", v6);

LABEL_18:
      v10 = 1;
      goto LABEL_19;
    }
  }
  v10 = 0;
  if (v6 && v4)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "shouldLog");
    if (objc_msgSend(v11, "shouldLogToDisk"))
      v13 = v12 | 2;
    else
      v13 = v12;
    objc_msgSend(v11, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      v13 &= 2u;
    if (v13)
    {
      LODWORD(v23) = 138543362;
      *(_QWORD *)((char *)&v23 + 4) = objc_opt_class();
      v15 = *(id *)((char *)&v23 + 4);
      LODWORD(v22) = 12;
      v21 = &v23;
      v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_15:

        pendingDialogs = self->_pendingDialogs;
        if (!pendingDialogs)
        {
          v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
          v19 = self->_pendingDialogs;
          self->_pendingDialogs = v18;

          pendingDialogs = self->_pendingDialogs;
        }
        -[NSMutableArray addObject:](pendingDialogs, "addObject:", v6, v21);
        goto LABEL_18;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v16, 4, &v23, v22, v23);
      v14 = objc_claimAutoreleasedReturnValue();
      free(v16);
      v21 = v14;
      SSFileLog();
    }

    goto LABEL_15;
  }
LABEL_19:

  return v10;
}

- (BOOL)presentDialogForError:(id)a3 pendUntilVisible:(BOOL)a4
{
  _BOOL8 v4;
  objc_class *v6;
  id v7;
  void *v8;

  if (!a3)
    return 0;
  v4 = a4;
  v6 = (objc_class *)MEMORY[0x24BEC8B90];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithError:", v7);

  LOBYTE(v4) = -[SUViewController presentDialog:pendUntilVisible:](self, "presentDialog:pendUntilVisible:", v8, v4);
  return v4;
}

- (void)presentFooterViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  UIViewController **p_footerViewController;
  void *v10;
  int v11;
  int v12;
  SUFooterContainerView *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = v7;
  p_footerViewController = &self->_footerViewController;
  if (self->_footerViewController)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "shouldLog");
    if (objc_msgSend(v10, "shouldLogToDisk"))
      v12 = v11 | 2;
    else
      v12 = v11;
    objc_msgSend(v10, "OSLogObject");
    v13 = (SUFooterContainerView *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v13->super.super.super, OS_LOG_TYPE_DEFAULT))
      v12 &= 2u;
    if (v12)
    {
      LODWORD(v21) = 138412290;
      *(_QWORD *)((char *)&v21 + 4) = objc_opt_class();
      v14 = *(id *)((char *)&v21 + 4);
      LODWORD(v20) = 12;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v15, 4, &v21, v20, v21);
      v13 = (SUFooterContainerView *)objc_claimAutoreleasedReturnValue();
      free(v15);
      SSFileLog();
    }
LABEL_14:

    goto LABEL_15;
  }
  if (v7)
  {
    objc_storeStrong((id *)&self->_footerViewController, a3);
    -[SUViewController addChildViewController:](self, "addChildViewController:", *p_footerViewController);
    -[UIViewController viewWillAppear:](*p_footerViewController, "viewWillAppear:", v4);
    -[SUViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init(SUFooterContainerView);
    -[SUFooterContainerView setAutoresizingMask:](v13, "setAutoresizingMask:", objc_msgSend(v10, "autoresizingMask"));
    -[SUFooterContainerView setTag:](v13, "setTag:", 1718903668);
    -[SUViewController setView:](self, "setView:", v13);
    -[SUFooterContainerView setContentView:](v13, "setContentView:", v10);
    -[UIViewController view](*p_footerViewController, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUFooterContainerView setFooterView:](v13, "setFooterView:", v16);

    -[UIView superviewOfClass:](v13, "superviewOfClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](*p_footerViewController, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addHitTestTarget:", v18);

    if (v4)
    {
      -[SUFooterContainerView layoutIfNeeded](v13, "layoutIfNeeded");
      objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "beginIgnoringInteractionEvents");

      objc_msgSend(MEMORY[0x24BDF6F90], "beginAnimations:context:", 0, 0);
      objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationDelegate:", self);
      objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationDidStopSelector:", sel__presentFooterAnimationDidStop);
      -[SUFooterContainerView setFooterVisible:](v13, "setFooterVisible:", 1);
      objc_msgSend(MEMORY[0x24BDF6F90], "commitAnimations");
    }
    else
    {
      -[SUFooterContainerView setFooterVisible:](v13, "setFooterVisible:", 1);
      -[UIViewController viewDidAppear:](*p_footerViewController, "viewDidAppear:", 0);
    }
    goto LABEL_14;
  }
LABEL_16:

}

- (void)reloadContentSizeForViewInPopover
{
  double v3;
  double v4;
  double v5;

  -[SUViewController preferredContentSize](self, "preferredContentSize");
  v4 = v3;
  -[UIViewController maximumViewSize](self, "maximumViewSize");
  if (v5 < 0.00000011920929)
    v5 = 460.0;
  -[SUViewController setPreferredContentSize:](self, "setPreferredContentSize:", v4, v5);
}

- (void)setInputAccessoryViewController:(id)a3
{
  UIViewController *v5;
  UIViewController **p_inputAccessoryViewController;
  UIViewController *inputAccessoryViewController;
  UIViewController *v8;

  v5 = (UIViewController *)a3;
  p_inputAccessoryViewController = &self->_inputAccessoryViewController;
  inputAccessoryViewController = self->_inputAccessoryViewController;
  if (inputAccessoryViewController != v5)
  {
    v8 = v5;
    if (inputAccessoryViewController)
      -[SUViewController removeChildViewController:](self, "removeChildViewController:");
    objc_storeStrong((id *)&self->_inputAccessoryViewController, a3);
    if (*p_inputAccessoryViewController
      && (-[SUViewController addChildViewController:](self, "addChildViewController:"), *p_inputAccessoryViewController)
      && !-[SUViewController isFirstResponder](self, "isFirstResponder"))
    {
      -[SUViewController becomeFirstResponder](self, "becomeFirstResponder");
    }
    else
    {
      -[SUViewController reloadInputViews](self, "reloadInputViews");
    }
    v5 = v8;
  }

}

- (void)setSkLoading:(BOOL)a3
{
  id v4;

  if (self->_skLoading != a3)
  {
    self->_skLoading = a3;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("SUViewControllerLoadingDidChangeNotification"), self);

  }
}

- (void)setSection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_imageThatSuppressesAccessibilityHairlineThickening");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "selectedImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_imageThatSuppressesAccessibilityHairlineThickening");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUViewController tabBarItem](self, "tabBarItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    if (objc_msgSend(v11, "isUsingLocalArtwork"))
      objc_msgSend(v9, "setImageInsets:", 2.0, 0.0, -2.0, 0.0);
  }
  else
  {
    objc_msgSend(v8, "setImageInsets:", 2.0, 0.0, -2.0, 0.0);
    objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", CFSTR("GenericTabItem.png"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_imageThatSuppressesAccessibilityHairlineThickening");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (_UIApplicationUsesLegacyUI())
  {
    if (v7)
      objc_msgSend(v9, "setImage:", v7);
    else
      objc_msgSend(v9, "setFinishedSelectedImage:withFinishedUnselectedImage:", 0, v5);
  }
  else
  {
    objc_msgSend(v9, "setImage:", v5);
    objc_msgSend(v9, "setSelectedImage:", v7);
  }

}

- (void)setScriptProperties:(id)a3
{
  SUViewControllerScriptProperties *v5;
  SUViewControllerScriptProperties *v6;

  v5 = (SUViewControllerScriptProperties *)a3;
  if (self->_cachedScriptProperties != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_cachedScriptProperties, a3);
    v5 = v6;
  }

}

- (void)setShowsLibraryButton:(BOOL)a3
{
  id v4;

  if (self->_showsLibraryButton != a3)
  {
    self->_showsLibraryButton = a3;
    -[SUViewController parentViewController](self, "parentViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[SUViewController _reloadExitStoreButtonWithParentViewController:](self, "_reloadExitStoreButtonWithParentViewController:", v4);

  }
}

- (void)setTitle:(id)a3 changeTabBarItem:(BOOL)a4
{
  void *v6;
  id v7;

  v7 = a3;
  -[SUViewController _existingTabBarItem](self, "_existingTabBarItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    -[SUViewController setTitle:](self, "setTitle:", v7);
  }
  else
  {
    -[SUViewController _setExistingTabBarItem:](self, "_setExistingTabBarItem:", 0);
    -[SUViewController setTitle:](self, "setTitle:", v7);
    -[SUViewController _setExistingTabBarItem:](self, "_setExistingTabBarItem:", v6);
  }

}

- (BOOL)shouldInvalidateForMemoryPurge
{
  void *v2;
  char v3;

  if (!self->_shouldInvalidateForMemoryPurge)
    return 0;
  -[SUViewController parentViewController](self, "parentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldInvalidateForMemoryPurge");

  return v3;
}

- (void)trackOperation:(id)a3 cancelOnDealloc:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v4 = a4;
  v11 = a3;
  objc_msgSend(v11, "setDelegate:", self);
  objc_msgSend(v11, "setShouldMessageMainThread:", 1);
  if (v4)
    v6 = 984;
  else
    v6 = 1048;
  v7 = (void **)((char *)&self->super.super.super.isa + v6);
  v8 = *v7;
  if (!*v7)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v10 = *v7;
    *v7 = v9;

    v8 = *v7;
  }
  objc_msgSend(v8, "addObject:", v11);

}

- (BOOL)_canReloadView
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUViewController;
  v3 = -[SUViewController _canReloadView](&v5, sel__canReloadView);
  if (v3)
    LOBYTE(v3) = -[SUViewController shouldInvalidateForMemoryPurge](self, "shouldInvalidateForMemoryPurge");
  return v3;
}

- (id)copyArchivableContext
{
  id v3;
  id v4;
  objc_super v6;

  if (!-[UIViewController isRootViewController](self, "isRootViewController")
    && -[SUViewController shouldExcludeFromNavigationHistory](self, "shouldExcludeFromNavigationHistory"))
  {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)SUViewController;
  v3 = -[UIViewController copyArchivableContext](&v6, sel_copyArchivableContext);
  if (self->_cachedScriptProperties)
  {
    v4 = -[SUViewController copyScriptProperties](self, "copyScriptProperties");
    objc_msgSend(v3, "setValue:forMetadataKey:", v4, CFSTR("scriptProperties"));

  }
  return v3;
}

- (void)didReceiveMemoryWarning
{
  objc_super v3;

  -[SUViewController _invalidateForMemoryPurge](self, "_invalidateForMemoryPurge");
  v3.receiver = self;
  v3.super_class = (Class)SUViewController;
  -[SUViewController didReceiveMemoryWarning](&v3, sel_didReceiveMemoryWarning);
}

- (id)_existingNavigationItem
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUViewController;
  -[SUViewController _existingNavigationItem](&v3, sel__existingNavigationItem);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)interfaceOrientation
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  int64_t v7;
  objc_super v9;

  -[SUViewController _popoverController](self, "_popoverController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        v5 = +[SUClientDispatch isTabBarControllerLoaded](SUClientDispatch, "isTabBarControllerLoaded"),
        v4,
        v5))
  {
    +[SUClientDispatch tabBarController](SUClientDispatch, "tabBarController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "interfaceOrientation");

    return v7;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SUViewController;
    return -[SUViewController interfaceOrientation](&v9, sel_interfaceOrientation);
  }
}

- (int64_t)ITunesStoreUIBarStyle
{
  void *v2;
  void *v3;
  int64_t v4;

  -[UIViewController section](self, "section");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "defaultPNGStyle") == 1)
    v4 = 2;
  else
    v4 = 1;

  return v4;
}

- (void)loadView
{
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  objc_msgSend(v4, "setAutoresizingMask:", 18);
  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[SUViewController setView:](self, "setView:", v4);
  if (self->_cachedScriptProperties)
    -[SUViewController setScriptProperties:](self, "setScriptProperties:");

}

- (id)moreListImage
{
  void *v2;
  void *v3;

  -[UIViewController section](self, "section");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "moreListImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)moreListSelectedImage
{
  void *v2;
  void *v3;

  -[UIViewController section](self, "section");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedMoreListImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (SUNavigationItem)navigationItem
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v10;
  SUNavigationItem *v11;
  objc_super v12;

  -[SUViewController parentViewController](self, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

LABEL_4:
    -[SUViewController parentViewController](self, "parentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return (SUNavigationItem *)v8;
  }
  -[SUViewController parentViewController](self, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    goto LABEL_4;
  -[SUViewController _existingNavigationItem](self, "_existingNavigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = objc_alloc_init(SUNavigationItem);
    -[SUViewController _setExistingNavigationItem:](self, "_setExistingNavigationItem:", v11);

  }
  v12.receiver = self;
  v12.super_class = (Class)SUViewController;
  -[SUViewController navigationItem](&v12, sel_navigationItem);
  return (SUNavigationItem *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)navigationController
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  objc_super v10;

  -[SUViewController parentViewController](self, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

LABEL_4:
    -[SUViewController parentViewController](self, "parentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  -[SUViewController parentViewController](self, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    goto LABEL_4;
  v10.receiver = self;
  v10.super_class = (Class)SUViewController;
  -[SUViewController navigationController](&v10, sel_navigationController);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)resetRestoredContext
{
  SUViewControllerContext *restoredContext;
  objc_super v4;

  restoredContext = self->_restoredContext;
  self->_restoredContext = 0;

  v4.receiver = self;
  v4.super_class = (Class)SUViewController;
  -[UIViewController resetRestoredContext](&v4, sel_resetRestoredContext);
}

- (void)restoreArchivableContext:(id)a3
{
  SUViewControllerContext *v5;
  void *v6;
  SUViewControllerContext *v7;

  v5 = (SUViewControllerContext *)a3;
  if (self->_restoredContext != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_restoredContext, a3);
    -[SUViewControllerContext valueForMetadataKey:](self->_restoredContext, "valueForMetadataKey:", CFSTR("scriptProperties"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SUViewController setScriptProperties:](self, "setScriptProperties:", v6);

    v5 = v7;
  }

}

- (void)_setExistingNavigationItem:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUViewController;
  -[SUViewController _setExistingNavigationItem:](&v3, sel__setExistingNavigationItem_, a3);
}

- (void)setParentViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[SUViewController parentViewController](self, "parentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)SUViewController;
  -[SUViewController setParentViewController:](&v8, sel_setParentViewController_, v4);

  -[SUViewController parentViewController](self, "parentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
  {
    -[UIViewController parentViewControllerHierarchyDidChange](self, "parentViewControllerHierarchyDidChange");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("SUViewControllerParentViewControllerDidChangeNotification"), self);

  }
  if (v4 && !self->_canBeWeakScriptReference)
    self->_canBeWeakScriptReference = 1;

}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[SUViewController title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  if ((v6 & 1) == 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)SUViewController;
    -[SUViewController setTitle:](&v9, sel_setTitle_, v4);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUViewController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("SUViewControllerNavigationItemDidChangeNotification"), v8);

  }
}

- (void)storePageProtocolDidChange
{
  void *v3;
  void *v4;
  objc_super v5;

  -[UIViewController storePageProtocol](self, "storePageProtocol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    -[SUViewController setShouldExcludeFromNavigationHistory:](self, "setShouldExcludeFromNavigationHistory:", objc_msgSend(v3, "shouldExcludeFromNavigationHistory"));
  v5.receiver = self;
  v5.super_class = (Class)SUViewController;
  -[UIViewController storePageProtocolDidChange](&v5, sel_storePageProtocolDidChange);

}

- (id)tabBarItem
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUViewController;
  -[SUViewController tabBarItem](&v7, sel_tabBarItem);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUViewController clientInterface](self, "clientInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "styleTabBarItem:", v3);

  return v3;
}

- (id)viewControllerFactory
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[SUViewController clientInterface](self, "clientInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllerFactory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SUViewController;
    -[UIViewController viewControllerFactory](&v8, sel_viewControllerFactory);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  NSMutableArray *pendingDialogs;
  int64_t transitionSafetyCount;
  BOOL v18;
  int64_t v19;
  void *v20;
  void *v21;
  objc_super v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v3 = a3;
  v33 = *MEMORY[0x24BDAC8D0];
  if ((-[SUViewController containmentSupport](self, "containmentSupport") & 1) == 0)
  {
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v5 = -[SUViewController copyChildViewControllersForReason:](self, "copyChildViewControllersForReason:", 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v28 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "viewDidAppear:", v3);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v7);
    }

  }
  -[SUViewController clientInterface](self, "clientInterface");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = self->_pendingDialogs;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(v10, "_presentDialog:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j));
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v13);
  }

  pendingDialogs = self->_pendingDialogs;
  self->_pendingDialogs = 0;

  v22.receiver = self;
  v22.super_class = (Class)SUViewController;
  -[SUViewController viewDidAppear:](&v22, sel_viewDidAppear_, v3);
  if (self->_inputAccessoryViewController)
    -[SUViewController reloadInputViews](self, "reloadInputViews");
  if (-[SUViewController isVisible](self, "isVisible"))
    SUSetStatusBarStyleWithBarStyle(-[SUViewController ITunesStoreUIBarStyle](self, "ITunesStoreUIBarStyle"), 0);
  transitionSafetyCount = self->_transitionSafetyCount;
  v18 = transitionSafetyCount < 1;
  v19 = transitionSafetyCount - 1;
  if (!v18)
  {
    self->_transitionSafetyCount = v19;
    objc_msgSend((id)objc_opt_class(), "endTransitionSafety");
  }
  -[SUViewController parentViewController](self, "parentViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "postNotificationName:object:", CFSTR("SUViewControllerParentViewControllerDidChangeNotification"), self);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  int64_t transitionSafetyCount;
  BOOL v12;
  int64_t v13;
  void *v14;
  void *v15;
  objc_super v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x24BDAC8D0];
  if ((-[SUViewController containmentSupport](self, "containmentSupport") & 1) == 0)
  {
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = -[SUViewController copyChildViewControllersForReason:](self, "copyChildViewControllersForReason:", 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "viewDidDisappear:", v3);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:", CFSTR("SUViewControllerDidDisappearNotification"), self);

  v16.receiver = self;
  v16.super_class = (Class)SUViewController;
  -[SUViewController viewDidDisappear:](&v16, sel_viewDidDisappear_, v3);
  transitionSafetyCount = self->_transitionSafetyCount;
  v12 = transitionSafetyCount < 1;
  v13 = transitionSafetyCount - 1;
  if (!v12)
  {
    self->_transitionSafetyCount = v13;
    objc_msgSend((id)objc_opt_class(), "endTransitionSafety");
  }
  -[SUViewController parentViewController](self, "parentViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "postNotificationName:object:", CFSTR("SUViewControllerParentViewControllerDidChangeNotification"), self);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  SUViewControllerContext *memoryPurgeContext;
  SUViewControllerContext *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  memoryPurgeContext = self->_memoryPurgeContext;
  if (memoryPurgeContext)
  {
    self->_memoryPurgeContext = 0;
    v6 = memoryPurgeContext;

    -[SUViewController restoreArchivableContext:](self, "restoreArchivableContext:", v6);
  }
  if ((-[SUViewController containmentSupport](self, "containmentSupport") & 1) == 0)
  {
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = -[SUViewController copyChildViewControllersForReason:](self, "copyChildViewControllersForReason:", 0);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11++), "viewWillAppear:", v3);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
  if (v3)
  {
    ++self->_transitionSafetyCount;
    objc_msgSend((id)objc_opt_class(), "beginTransitionSafety");
  }
  -[SUViewController parentViewController](self, "parentViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUViewController _reloadExitStoreButtonWithParentViewController:](self, "_reloadExitStoreButtonWithParentViewController:", v12);

  v13.receiver = self;
  v13.super_class = (Class)SUViewController;
  -[SUViewController viewWillAppear:](&v13, sel_viewWillAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t transitionSafetyCount;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  if ((-[SUViewController containmentSupport](self, "containmentSupport") & 1) == 0)
  {
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = -[SUViewController copyChildViewControllersForReason:](self, "copyChildViewControllersForReason:", 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9++), "viewWillDisappear:", v3);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  transitionSafetyCount = self->_transitionSafetyCount;
  if (transitionSafetyCount >= 1)
  {
    do
    {
      self->_transitionSafetyCount = transitionSafetyCount - 1;
      objc_msgSend((id)objc_opt_class(), "endTransitionSafety");
      transitionSafetyCount = self->_transitionSafetyCount;
    }
    while (transitionSafetyCount > 0);
  }
  if (v3)
  {
    self->_transitionSafetyCount = transitionSafetyCount + 1;
    objc_msgSend((id)objc_opt_class(), "beginTransitionSafety");
  }
  v11.receiver = self;
  v11.super_class = (Class)SUViewController;
  -[SUViewController viewWillDisappear:](&v11, sel_viewWillDisappear_, v3);
}

- (void)willMoveToParentViewController:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[SUViewController _reloadExitStoreButtonWithParentViewController:](self, "_reloadExitStoreButtonWithParentViewController:", v4);
  v5.receiver = self;
  v5.super_class = (Class)SUViewController;
  -[SUViewController willMoveToParentViewController:](&v5, sel_willMoveToParentViewController_, v4);

}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  SURotationController *rotationController;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[SUViewController _rotationController](self, "_rotationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "finishRotationFromInterfaceOrientation:", a3);
    -[SURotationController setViewController:](self->_rotationController, "setViewController:", 0);
    rotationController = self->_rotationController;
    self->_rotationController = 0;

  }
  else if ((-[SUViewController containmentSupport](self, "containmentSupport") & 1) == 0)
  {
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = -[SUViewController copyChildViewControllersForReason:](self, "copyChildViewControllersForReason:", 1);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "didRotateFromInterfaceOrientation:", a3);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
  self->_rotationState = 0;
  v13.receiver = self;
  v13.super_class = (Class)SUViewController;
  -[SUViewController didRotateFromInterfaceOrientation:](&v13, sel_didRotateFromInterfaceOrientation_, a3);

}

- (id)_rotationController
{
  SURotationController *rotationController;
  SURotationController *v4;
  SURotationController *v5;

  rotationController = self->_rotationController;
  if (!rotationController)
  {
    v4 = -[SUViewController newRotationController](self, "newRotationController");
    v5 = self->_rotationController;
    self->_rotationController = v4;

    rotationController = self->_rotationController;
  }
  return rotationController;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 1)
    return 30;
  if (SUAllowsLandscapePhone())
    return 26;
  return 2;
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  objc_super v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  self->_rotationState = 2;
  -[SUViewController _rotationController](self, "_rotationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "animateRotationToInterfaceOrientation:duration:", a3, a4);
  }
  else if ((-[SUViewController containmentSupport](self, "containmentSupport") & 1) == 0)
  {
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = -[SUViewController copyChildViewControllersForReason:](self, "copyChildViewControllersForReason:", 1);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "willAnimateRotationToInterfaceOrientation:duration:", a3, a4);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

  }
  v14.receiver = self;
  v14.super_class = (Class)SUViewController;
  -[SUViewController willAnimateRotationToInterfaceOrientation:duration:](&v14, sel_willAnimateRotationToInterfaceOrientation_duration_, a3, a4);

}

- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  objc_super v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[SUViewController _rotationController](self, "_rotationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "prepareToRotateToInterfaceOrientation:", a3);
  }
  else if ((-[SUViewController containmentSupport](self, "containmentSupport") & 1) == 0)
  {
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = -[SUViewController copyChildViewControllersForReason:](self, "copyChildViewControllersForReason:", 1);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "willRotateToInterfaceOrientation:duration:", a3, a4);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

  }
  v14.receiver = self;
  v14.super_class = (Class)SUViewController;
  -[SUViewController willRotateToInterfaceOrientation:duration:](&v14, sel_willRotateToInterfaceOrientation_duration_, a3, a4);

}

- (BOOL)window:(id)a3 shouldAutorotateToInterfaceOrientation:(int64_t)a4
{
  id v6;
  unsigned int v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SUViewController;
  v7 = -[SUViewController window:shouldAutorotateToInterfaceOrientation:](&v19, sel_window_shouldAutorotateToInterfaceOrientation_, v6, a4);
  -[SUViewController _rotationController](self, "_rotationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v7)
      LOBYTE(v7) = self->_rotationState != 1;
  }
  else if ((-[SUViewController containmentSupport](self, "containmentSupport") & 1) == 0)
  {
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = -[SUViewController copyChildViewControllersForReason:](self, "copyChildViewControllersForReason:", 1);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          if ((v7 & 1) != 0)
            LOBYTE(v7) = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "window:shouldAutorotateToInterfaceOrientation:", v6, a4, (_QWORD)v15);
          else
            LOBYTE(v7) = 0;
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v11);
    }

  }
  return v7;
}

- (BOOL)becomeFirstResponder
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUViewController;
  v3 = -[SUViewController becomeFirstResponder](&v5, sel_becomeFirstResponder);
  if (v3)
    -[SUViewController reloadInputViews](self, "reloadInputViews");
  return v3;
}

- (BOOL)canBecomeFirstResponder
{
  objc_super v3;

  if (self->_inputAccessoryViewController)
    return 1;
  v3.receiver = self;
  v3.super_class = (Class)SUViewController;
  return -[SUViewController canBecomeFirstResponder](&v3, sel_canBecomeFirstResponder);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  void *v5;
  void *v6;
  BOOL v7;

  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0;
  if (!sel_isEqual(a3, sel_remoteControlReceivedWithEvent_))
    return 1;
  +[SUAudioPlayerSessionManager sessionManager](SUAudioPlayerSessionManager, "sessionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allSessionURLs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") != 0;

  return v7;
}

- (id)inputAccessoryView
{
  void *v3;
  objc_super v5;

  if (-[SUViewController isVisibleAndFrontmost](self, "isVisibleAndFrontmost"))
  {
    -[UIViewController view](self->_inputAccessoryViewController, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SUViewController;
    -[SUViewController inputAccessoryView](&v5, sel_inputAccessoryView);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)remoteControlReceivedWithEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "type") == 2)
  {
    +[SUAudioPlayerSessionManager sessionManager](SUAudioPlayerSessionManager, "sessionManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allSessionURLs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v4, "audioPlayerForURL:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          switch(objc_msgSend(v3, "subtype"))
          {
            case 'f':
            case 'h':
              objc_msgSend(v10, "stop");
              break;
            case 'g':
              objc_msgSend(v10, "playerStatus");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = objc_msgSend(v11, "playerState");

              if (v12 == 2)
                objc_msgSend(v10, "pause");
              else
                objc_msgSend(v10, "play");
              break;
            case 'i':
              objc_msgSend(v10, "seekToTime:", 0.0);
              break;
            default:
              break;
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
}

- (BOOL)clearsWeakScriptReferences
{
  return self->_canBeWeakScriptReference;
}

- (void)_exitStoreButtonAction:(id)a3
{
  id v3;

  -[SUViewController clientInterface](self, "clientInterface", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_exitStoreWithReason:", 3);

}

- (void)_dismissFooterAnimationDidStop:(id)a3
{
  void *v5;
  UIViewController *footerViewController;
  void *v7;
  id v8;

  -[SUViewController view](self, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentView:", 0);
  -[SUViewController setView:](self, "setView:", v5);
  -[UIViewController viewDidDisappear:](self->_footerViewController, "viewDidDisappear:", a3 != 0);
  -[SUViewController removeChildViewController:](self, "removeChildViewController:", self->_footerViewController);
  footerViewController = self->_footerViewController;
  self->_footerViewController = 0;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endIgnoringInteractionEvents");

}

- (void)_presentFooterAnimationDidStop
{
  id v2;

  -[UIViewController viewDidAppear:](self->_footerViewController, "viewDidAppear:", 1);
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endIgnoringInteractionEvents");

}

- (void)operation:(id)a3 failedWithError:(id)a4
{
  id v6;
  id v7;
  char isKindOfClass;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "shouldLog");
  if (objc_msgSend(v9, "shouldLogToDisk"))
    v11 = v10 | 2;
  else
    v11 = v10;
  objc_msgSend(v9, "OSLogObject");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    v11 &= 2u;
  if ((isKindOfClass & 1) != 0)
  {
    if (v11)
    {
      v13 = (void *)objc_opt_class();
      v14 = v13;
      objc_msgSend(v6, "requestProperties");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "URL");
      v18 = 138544130;
      v19 = v13;
      v20 = 2114;
      v21 = v6;
      v22 = 2112;
      v23 = v7;
      v24 = 2112;
      v25 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v17) = 42;
      v16 = (void *)_os_log_send_and_compose_impl();

      goto LABEL_11;
    }
LABEL_13:

    goto LABEL_14;
  }
  if (!v11)
    goto LABEL_13;
  v18 = 138543874;
  v19 = (id)objc_opt_class();
  v20 = 2114;
  v21 = v6;
  v22 = 2112;
  v23 = v7;
  v14 = v19;
  LODWORD(v17) = 32;
  v16 = (void *)_os_log_send_and_compose_impl();
LABEL_11:

  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v16, 4, &v18, v17);
    v12 = objc_claimAutoreleasedReturnValue();
    free(v16);
    SSFileLog();
    goto LABEL_13;
  }
LABEL_14:

  objc_msgSend(v6, "setDelegate:", 0);
  -[NSMutableArray removeObject:](self->_cancelOnDeallocOperations, "removeObject:", v6);
  -[NSMutableArray removeObject:](self->_operations, "removeObject:", v6);

}

- (void)operationFinished:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    v7 = v6 | 2;
  else
    v7 = v6;
  objc_msgSend(v5, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    v7 &= 2u;
  if (!v7)
    goto LABEL_9;
  v9 = (void *)objc_opt_class();
  v10 = v9;
  v13 = 138543874;
  v14 = v9;
  v15 = 2114;
  v16 = v4;
  v17 = 1024;
  v18 = objc_msgSend(v4, "success");
  LODWORD(v12) = 28;
  v11 = (void *)_os_log_send_and_compose_impl();

  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v11, 4, &v13, v12);
    v8 = objc_claimAutoreleasedReturnValue();
    free(v11);
    SSFileLog();
LABEL_9:

  }
  objc_msgSend(v4, "setDelegate:", 0);
  -[NSMutableArray removeObject:](self->_cancelOnDeallocOperations, "removeObject:", v4);
  -[NSMutableArray removeObject:](self->_operations, "removeObject:", v4);

}

- (void)_applicationDidEnterBackgroundNotification:(id)a3
{
  self->_isEnteringForeground = 0;
  -[SUViewController _invalidateForMemoryPurge](self, "_invalidateForMemoryPurge", a3);
  -[SUViewController applicationDidEnterBackground](self, "applicationDidEnterBackground");
}

- (void)_applicationWillEnterForegroundNotification:(id)a3
{
  _QWORD block[5];

  self->_isEnteringForeground = 1;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__SUViewController__applicationWillEnterForegroundNotification___block_invoke;
  block[3] = &unk_24DE7B230;
  block[4] = self;
  dispatch_after(0, MEMORY[0x24BDAC9B8], block);
  -[SUViewController applicationWillEnterForeground](self, "applicationWillEnterForeground");
}

uint64_t __64__SUViewController__applicationWillEnterForegroundNotification___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1032) = 0;
  return result;
}

- (void)_exitStoreButtonDidChangeNotification:(id)a3
{
  id v4;

  -[SUViewController parentViewController](self, "parentViewController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SUViewController _reloadExitStoreButtonWithParentViewController:](self, "_reloadExitStoreButtonWithParentViewController:", v4);

}

- (void)_keyboardDidHideNotification:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  id v7;

  v7 = a3;
  -[SUViewController parentViewController](self, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(v7, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController keyboardDidHideWithInfo:](self, "keyboardDidHideWithInfo:", v6);

  }
}

- (void)_keyboardDidShowNotification:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  id v7;

  v7 = a3;
  -[SUViewController parentViewController](self, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(v7, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController keyboardDidShowWithInfo:](self, "keyboardDidShowWithInfo:", v6);

  }
}

- (void)_keyboardWillHideNotification:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  id v7;

  v7 = a3;
  -[SUViewController parentViewController](self, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(v7, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController keyboardWillHideWithInfo:](self, "keyboardWillHideWithInfo:", v6);

  }
}

- (void)_keyboardWillShowNotification:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  id v7;

  v7 = a3;
  -[SUViewController parentViewController](self, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(v7, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController keyboardWillShowWithInfo:](self, "keyboardWillShowWithInfo:", v6);

  }
}

- (void)_reloadLibraryButton
{
  id v3;

  -[SUViewController parentViewController](self, "parentViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SUViewController _reloadExitStoreButtonWithParentViewController:](self, "_reloadExitStoreButtonWithParentViewController:", v3);

}

- (void)_invalidateForMemoryPurge
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD block[6];
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  if (-[SUViewController shouldInvalidateForMemoryPurge](self, "shouldInvalidateForMemoryPurge"))
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = *MEMORY[0x24BDF7608];
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x24BDAC760];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __45__SUViewController__invalidateForMemoryPurge__block_invoke;
    v7[3] = &unk_24DE7AF68;
    v7[4] = &v8;
    v5 = objc_msgSend(v3, "beginBackgroundTaskWithExpirationHandler:", v7);
    v9[3] = v5;

    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __45__SUViewController__invalidateForMemoryPurge__block_invoke_2;
    block[3] = &unk_24DE7B458;
    block[4] = self;
    block[5] = &v8;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    _Block_object_dispose(&v8, 8);
  }
}

void __45__SUViewController__invalidateForMemoryPurge__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  v1 = *MEMORY[0x24BDF7608];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) != *MEMORY[0x24BDF7608])
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v1;
  }
}

void __45__SUViewController__invalidateForMemoryPurge__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if ((objc_msgSend(*(id *)(a1 + 32), "isSkLoaded") & 1) == 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "copyArchivableJetsamContext");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 1040);
    *(_QWORD *)(v3 + 1040) = v2;

  }
  objc_msgSend(*(id *)(a1 + 32), "invalidateForMemoryPurge");
  v5 = *MEMORY[0x24BDF7608];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != *MEMORY[0x24BDF7608])
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
  }
}

- (void)_reloadExitStoreButtonWithParentViewController:(id)a3
{
  void *v4;
  UIBarButtonItem *v5;
  UIBarButtonItem *v6;
  UIBarButtonItem *v7;
  SUBarButtonItem *v8;
  UIBarButtonItem *exitStoreButton;
  UIBarButtonItem *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  UIBarButtonItem *v18;
  id v19;

  v19 = a3;
  if (v19)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      -[UIViewController overlayViewController](self, "overlayViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        v5 = self->_exitStoreButton;
        +[SUClientDispatch exitStoreButtonTitle](SUClientDispatch, "exitStoreButtonTitle");
        v7 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
        v6 = v7;
        if (self->_showsLibraryButton && -[UIBarButtonItem length](v7, "length"))
        {
          if (!self->_exitStoreButton)
          {
            v8 = objc_alloc_init(SUBarButtonItem);
            exitStoreButton = self->_exitStoreButton;
            self->_exitStoreButton = &v8->super;

            -[UIBarButtonItem setAction:](self->_exitStoreButton, "setAction:", sel__exitStoreButtonAction_);
            -[UIBarButtonItem setTarget:](self->_exitStoreButton, "setTarget:", self);
          }
        }
        else
        {
          -[UIBarButtonItem setTarget:](self->_exitStoreButton, "setTarget:", 0);
          v10 = self->_exitStoreButton;
          self->_exitStoreButton = 0;

        }
        -[UIBarButtonItem setTitle:](self->_exitStoreButton, "setTitle:", v6);
        -[UIViewController navigationItemForScriptInterface](self, "navigationItemForScriptInterface");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (self->_exitStoreButton)
        {
          objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "userInterfaceIdiom");

          -[SUViewController clientInterface](self, "clientInterface");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "appearance");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          v18 = self->_exitStoreButton;
          if (v14 == 1)
          {
            objc_msgSend(v16, "styleExitStoreButtonItem:", v18);

            objc_msgSend(v12, "setLeftBarButtonItem:", self->_exitStoreButton);
            objc_msgSend(v12, "setLeftItemsSupplementBackButton:", 1);
          }
          else
          {
            objc_msgSend(v16, "styleBarButtonItem:", v18);

            objc_msgSend(v12, "setRightBarButtonItem:", self->_exitStoreButton);
          }
        }
        else if (v5)
        {
          SUNavigationItemRemoveButton(v11, (uint64_t)v5);
        }

        goto LABEL_6;
      }
    }
  }
  if (self->_exitStoreButton)
  {
    -[UIViewController navigationItemForScriptInterface](self, "navigationItemForScriptInterface");
    v5 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
    SUNavigationItemRemoveButton(v5, (uint64_t)self->_exitStoreButton);
    -[UIBarButtonItem setTarget:](self->_exitStoreButton, "setTarget:", 0);
    v6 = self->_exitStoreButton;
    self->_exitStoreButton = 0;
LABEL_6:

  }
}

- (SUViewControllerScriptProperties)_cachedScriptProperties
{
  return self->_cachedScriptProperties;
}

- (BOOL)_isEnteringForeground
{
  return self->_isEnteringForeground;
}

- (void)setClientInterface:(id)a3
{
  objc_storeStrong((id *)&self->_clientInterface, a3);
}

- (UIViewController)footerViewController
{
  return self->_footerViewController;
}

- (UIViewController)inputAccessoryViewController
{
  return self->_inputAccessoryViewController;
}

- (NSArray)_pendingDialogs
{
  return &self->_pendingDialogs->super;
}

- (SUViewControllerContext)_restoredContext
{
  return self->_restoredContext;
}

- (BOOL)shouldExcludeFromNavigationHistory
{
  return self->_excludeFromNavigationHistory;
}

- (void)setShouldExcludeFromNavigationHistory:(BOOL)a3
{
  self->_excludeFromNavigationHistory = a3;
}

- (void)setShouldInvalidateForMemoryPurge:(BOOL)a3
{
  self->_shouldInvalidateForMemoryPurge = a3;
}

- (BOOL)showsLibraryButton
{
  return self->_showsLibraryButton;
}

- (BOOL)isSkLoading
{
  return self->_skLoading;
}

- (BOOL)shouldAdjustContentOffsets
{
  return self->_shouldAdjustContentOffsets;
}

- (void)setShouldAdjustContentOffsets:(BOOL)a3
{
  self->_shouldAdjustContentOffsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rotationController, 0);
  objc_storeStrong((id *)&self->_restoredContext, 0);
  objc_storeStrong((id *)&self->_pendingDialogs, 0);
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_memoryPurgeContext, 0);
  objc_storeStrong((id *)&self->_inputAccessoryViewController, 0);
  objc_storeStrong((id *)&self->_footerViewController, 0);
  objc_storeStrong((id *)&self->_exitStoreButton, 0);
  objc_storeStrong((id *)&self->_clientInterface, 0);
  objc_storeStrong((id *)&self->_cancelOnDeallocOperations, 0);
  objc_storeStrong((id *)&self->_cachedScriptProperties, 0);
}

@end
