@implementation MusicStoreFlowScriptingClientController

+ (id)sharedScriptingClientController
{
  if (qword_100011BB8 != -1)
    dispatch_once(&qword_100011BB8, &stru_10000C3D8);
  return (id)qword_100011BB0;
}

- (MusicStoreFlowScriptingClientController)init
{
  MusicStoreFlowScriptingClientController *v2;
  uint64_t v3;
  NSHashTable *registeredStoreFlowServiceViewControllers;
  uint64_t v5;
  NSPointerArray *activeStoreFlowServiceViewControllersStack;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MusicStoreFlowScriptingClientController;
  v2 = -[MusicStoreFlowScriptingClientController init](&v9, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    registeredStoreFlowServiceViewControllers = v2->_registeredStoreFlowServiceViewControllers;
    v2->_registeredStoreFlowServiceViewControllers = (NSHashTable *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSPointerArray weakObjectsPointerArray](NSPointerArray, "weakObjectsPointerArray"));
    activeStoreFlowServiceViewControllersStack = v2->_activeStoreFlowServiceViewControllersStack;
    v2->_activeStoreFlowServiceViewControllersStack = (NSPointerArray *)v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, "_handleApplicationDidEnterBackgroundNotification:", UIApplicationDidEnterBackgroundNotification, 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, "_handleApplicationWillEnterForegroundNotification:", UIApplicationWillEnterForegroundNotification, 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UIApplicationDidEnterBackgroundNotification, 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, UIApplicationWillEnterForegroundNotification, 0);

  v4.receiver = self;
  v4.super_class = (Class)MusicStoreFlowScriptingClientController;
  -[MusicStoreFlowScriptingClientController dealloc](&v4, "dealloc");
}

- (void)applyCloudServiceSetupConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[MusicStoreFlowScriptingClientController clientInterface](self, "clientInterface"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "applicationIdentifier"));
  objc_msgSend(v7, "setApplicationIdentifier:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "applicationVersion"));
  objc_msgSend(v7, "setApplicationVersion:", v6);

}

- (void)registerStoreFlowServiceViewController:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[NSHashTable containsObject:](self->_registeredStoreFlowServiceViewControllers, "containsObject:"))
    -[NSHashTable addObject:](self->_registeredStoreFlowServiceViewControllers, "addObject:", v4);

}

- (void)storeFlowServiceViewControllerDidLoad:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MusicStoreFlowScriptingClientController rootViewController](self, "rootViewController"));

  if (!v4)
    -[MusicStoreFlowScriptingClientController _activateStoreFlowServiceViewController:](self, "_activateStoreFlowServiceViewController:", v5);

}

- (void)storeFlowServiceViewControllerWillAppear:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MusicStoreFlowScriptingClientController rootViewController](self, "rootViewController"));

  v5 = v6;
  if (v4 != v6)
  {
    -[MusicStoreFlowScriptingClientController _activateStoreFlowServiceViewController:](self, "_activateStoreFlowServiceViewController:", v6);
    v5 = v6;
  }

}

- (void)storeFlowServiceViewControllerDidDisappear:(id)a3
{
  -[MusicStoreFlowScriptingClientController _deactivateStoreFlowServiceViewController:andUnregister:](self, "_deactivateStoreFlowServiceViewController:andUnregister:", a3, 0);
}

- (void)unregisterStoreFlowServiceViewController:(id)a3
{
  -[MusicStoreFlowScriptingClientController _deactivateStoreFlowServiceViewController:andUnregister:](self, "_deactivateStoreFlowServiceViewController:andUnregister:", a3, 1);
}

- (BOOL)presentAccountViewController:(id)a3 showNavigationBar:(BOOL)a4 animated:(BOOL)a5
{
  uint64_t v5;
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = objc_msgSend(objc_alloc((Class)SUNavigationController), "initWithRootViewController:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "clientInterface"));

  objc_msgSend(v9, "setClientInterface:", v10);
  objc_msgSend(v9, "setNavigationBarHidden:", !v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MusicStoreFlowScriptingClientController rootViewController](self, "rootViewController"));
  LOBYTE(v5) = objc_msgSend(v11, "storeFlowScriptingClientController:requestsPresentingViewController:animated:", self, v9, v5);

  return v5;
}

- (id)newScriptInterface
{
  return objc_alloc_init(MusicStoreFlowScriptInterface);
}

- (void)clientInterface:(id)a3 dismissViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v7 = a5;
  v15 = a4;
  v9 = a6;
  v11 = objc_opt_class(ISInvocationRecorder, v10);
  if ((objc_opt_isKindOfClass(v15, v11) & 1) != 0)
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "adjustedTargetForSelector:", "self"));
  else
    v12 = v15;
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MusicStoreFlowScriptingClientController _correspondingStoreFlowServiceViewControllerForViewController:](self, "_correspondingStoreFlowServiceViewControllerForViewController:", v15));
  objc_msgSend(v14, "storeFlowScriptingClientController:requestsDismissingViewController:animated:completion:", self, v13, v7, v9);

}

- (void)clientInterface:(id)a3 presentSafariViewControllerWithURL:(id)a4 fromViewController:(id)a5 animated:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;

  v7 = a6;
  v11 = a7;
  v12 = a4;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[MusicStoreFlowScriptingClientController _correspondingStoreFlowServiceViewControllerForViewController:](self, "_correspondingStoreFlowServiceViewControllerForViewController:", a5));
  objc_msgSend(v13, "storeFlowScriptingClientController:requestsPresentingSafariViewControllerWithURL:animated:completion:", self, v12, v7, v11);

}

- (void)clientInterface:(id)a3 dismissSafariViewControllerAnimated:(BOOL)a4 fromViewController:(id)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;

  v7 = a4;
  v9 = a6;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[MusicStoreFlowScriptingClientController _correspondingStoreFlowServiceViewControllerForViewController:](self, "_correspondingStoreFlowServiceViewControllerForViewController:", a5));
  objc_msgSend(v10, "storeFlowScriptingClientController:requestsDismissingSafariViewControllerAnimated:completion:", self, v7, v9);

}

- (BOOL)clientInterface:(id)a3 isAllowedToOpenExternalURL:(id)a4
{
  id v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;

  v4 = a4;
  if ((objc_msgSend(v4, "isSafeExternalURL") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scheme"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lowercaseString"));
    v5 = objc_msgSend(v7, "containsString:", CFSTR("sonos"));

  }
  return v5;
}

- (void)clientInterface:(id)a3 overrideCreditCardPresentationFromViewController:(id)a4 completion:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[MusicStoreFlowScriptingClientController _correspondingStoreFlowServiceViewControllerForViewController:](self, "_correspondingStoreFlowServiceViewControllerForViewController:", a4));
  objc_msgSend(v8, "storeFlowScriptingClientController:overrideCreditCardPresentationWithCompletion:", self, v7);

}

- (void)_handleApplicationDidEnterBackgroundNotification:(id)a3
{
  self->_isApplicationInBackground = 1;
  if (-[MusicStoreFlowScriptingClientController isActive](self, "isActive", a3))
    -[MusicStoreFlowScriptingClientController resignActive](self, "resignActive");
}

- (void)_handleApplicationWillEnterForegroundNotification:(id)a3
{
  void *v4;

  self->_isApplicationInBackground = 0;
  if ((-[MusicStoreFlowScriptingClientController isActive](self, "isActive", a3) & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MusicStoreFlowScriptingClientController rootViewController](self, "rootViewController"));

    if (v4)
      -[MusicStoreFlowScriptingClientController becomeActive](self, "becomeActive");
  }
}

- (void)_activateStoreFlowServiceViewController:(id)a3
{
  id v4;

  v4 = a3;
  -[MusicStoreFlowScriptingClientController setRootViewController:](self, "setRootViewController:");
  if ((-[MusicStoreFlowScriptingClientController isActive](self, "isActive") & 1) == 0
    && !self->_isApplicationInBackground)
  {
    -[MusicStoreFlowScriptingClientController becomeActive](self, "becomeActive");
  }
  -[NSPointerArray addPointer:](self->_activeStoreFlowServiceViewControllersStack, "addPointer:", v4);

}

- (id)_correspondingStoreFlowServiceViewControllerForViewController:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = a3;
  v6 = v4;
  if (v4)
  {
    v7 = v4;
    while (1)
    {
      v8 = objc_opt_class(MusicStoreFlowServiceViewController, v5);
      if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
        break;
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "parentViewController"));

      v7 = (void *)v9;
      if (!v9)
        goto LABEL_5;
    }
    v11 = v7;
    v10 = v11;
  }
  else
  {
LABEL_5:
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MusicStoreFlowScriptingClientController rootViewController](self, "rootViewController"));
    v11 = 0;
  }

  return v10;
}

- (void)_deactivateStoreFlowServiceViewController:(id)a3 andUnregister:(BOOL)a4
{
  NSUInteger v6;
  NSUInteger v7;
  id v8;
  id v9;
  void *v10;
  NSUInteger v11;
  NSUInteger v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = -[NSPointerArray count](self->_activeStoreFlowServiceViewControllersStack, "count");
  if (v6)
  {
    v7 = v6 - 1;
    do
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(-[NSPointerArray pointerAtIndex:](self->_activeStoreFlowServiceViewControllersStack, "pointerAtIndex:", v7));
      if (v8 == v15)
        -[NSPointerArray removePointerAtIndex:](self->_activeStoreFlowServiceViewControllersStack, "removePointerAtIndex:", v7);

      --v7;
    }
    while (v7 != -1);
  }
  if (a4 && -[NSHashTable containsObject:](self->_registeredStoreFlowServiceViewControllers, "containsObject:", v15))
    -[NSHashTable removeObject:](self->_registeredStoreFlowServiceViewControllers, "removeObject:", v15);
  v9 = (id)objc_claimAutoreleasedReturnValue(-[MusicStoreFlowScriptingClientController rootViewController](self, "rootViewController"));

  v10 = v15;
  if (v9 == v15)
  {
    v11 = -[NSPointerArray count](self->_activeStoreFlowServiceViewControllersStack, "count");
    if (v11)
    {
      v12 = v11 - 1;
      while (1)
      {
        v13 = objc_claimAutoreleasedReturnValue(-[NSPointerArray pointerAtIndex:](self->_activeStoreFlowServiceViewControllersStack, "pointerAtIndex:", v12));
        if (v13)
          break;
        if (--v12 == -1)
          goto LABEL_14;
      }
      v14 = (void *)v13;
      -[MusicStoreFlowScriptingClientController setRootViewController:](self, "setRootViewController:", v13);
      if ((-[MusicStoreFlowScriptingClientController isActive](self, "isActive") & 1) == 0
        && !self->_isApplicationInBackground)
      {
        -[MusicStoreFlowScriptingClientController becomeActive](self, "becomeActive");
      }
    }
    else
    {
LABEL_14:
      -[MusicStoreFlowScriptingClientController setRootViewController:](self, "setRootViewController:", 0);
      v14 = 0;
      if (-[MusicStoreFlowScriptingClientController isActive](self, "isActive"))
      {
        -[MusicStoreFlowScriptingClientController resignActive](self, "resignActive");
        v14 = 0;
      }
    }

    v10 = v15;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeStoreFlowServiceViewControllersStack, 0);
  objc_storeStrong((id *)&self->_registeredStoreFlowServiceViewControllers, 0);
}

@end
