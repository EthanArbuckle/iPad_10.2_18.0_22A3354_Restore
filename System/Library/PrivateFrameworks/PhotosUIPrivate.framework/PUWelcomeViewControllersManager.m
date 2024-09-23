@implementation PUWelcomeViewControllersManager

- (PUWelcomeViewControllersManager)init
{
  return (PUWelcomeViewControllersManager *)-[PUWelcomeViewControllersManager _initWithWelcomeViewControllerClasses:](self, "_initWithWelcomeViewControllerClasses:", 0);
}

- (id)_initWithWelcomeViewControllerClasses:(id)a3
{
  id v4;
  PUWelcomeViewControllersManager *v5;
  uint64_t v6;
  NSArray *welcomeViewControllerClasses;
  uint64_t v8;
  NSMutableSet *remainingWelcomeViewControllerClassesToPresent;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUWelcomeViewControllersManager;
  v5 = -[PUWelcomeViewControllersManager init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    welcomeViewControllerClasses = v5->__welcomeViewControllerClasses;
    v5->__welcomeViewControllerClasses = (NSArray *)v6;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    remainingWelcomeViewControllerClassesToPresent = v5->__remainingWelcomeViewControllerClassesToPresent;
    v5->__remainingWelcomeViewControllerClassesToPresent = (NSMutableSet *)v8;

  }
  return v5;
}

- (void)presentWelcomeViewControllersIfNecessaryFromViewController:(id)a3 completion:(id)a4
{
  id v6;

  v6 = a3;
  -[PUWelcomeViewControllersManager setCompletionHandler:](self, "setCompletionHandler:", a4);
  -[PUWelcomeViewControllersManager _setPresentingViewController:](self, "_setPresentingViewController:", v6);

  -[PUWelcomeViewControllersManager _reset](self, "_reset");
  -[PUWelcomeViewControllersManager _update](self, "_update");
}

- (void)resetAllLastPresentationInfos
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[PUWelcomeViewControllersManager _welcomeViewControllerClasses](self, "_welcomeViewControllerClasses", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "resetLastPresentationInfo");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synchronize");

}

- (void)_reset
{
  void *v3;
  id v4;

  -[PUWelcomeViewControllersManager _remainingWelcomeViewControllerClassesToPresent](self, "_remainingWelcomeViewControllerClassesToPresent");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PUWelcomeViewControllersManager _welcomeViewControllerClasses](self, "_welcomeViewControllerClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v3);

}

- (void)_update
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  BOOL v12;
  void (**v13)(void);
  _QWORD v14[4];
  id v15;
  id location;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[PUWelcomeViewControllersManager _presentingViewController](self, "_presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && !-[PUWelcomeViewControllersManager _presentedWelcomeViewControllerClass](self, "_presentedWelcomeViewControllerClass"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[PUWelcomeViewControllersManager _welcomeViewControllerClasses](self, "_welcomeViewControllerClasses");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v18;
LABEL_6:
      v7 = 0;
      while (1)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v7);
        -[PUWelcomeViewControllersManager _remainingWelcomeViewControllerClassesToPresent](self, "_remainingWelcomeViewControllerClassesToPresent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "containsObject:", v8);

        if ((v10 & 1) != 0)
          break;
        if (v5 == ++v7)
        {
          v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v5)
            goto LABEL_6;
          goto LABEL_12;
        }
      }

      if (!v8)
        goto LABEL_15;
      objc_initWeak(&location, self);
      -[PUWelcomeViewControllersManager _setPresentedWelcomeViewControllerClass:](self, "_setPresentedWelcomeViewControllerClass:", v8);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __42__PUWelcomeViewControllersManager__update__block_invoke_2;
      v14[3] = &unk_1E58AB320;
      objc_copyWeak(&v15, &location);
      objc_msgSend(v8, "presentIfNecessaryFromViewController:presentationHandler:completionHandler:", v3, &__block_literal_global_6, v14);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    else
    {
LABEL_12:

LABEL_15:
      -[PUWelcomeViewControllersManager completionHandler](self, "completionHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11 == 0;

      if (!v12)
      {
        -[PUWelcomeViewControllersManager completionHandler](self, "completionHandler");
        v13 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v13[2]();

        -[PUWelcomeViewControllersManager setCompletionHandler:](self, "setCompletionHandler:", 0);
      }
    }
  }

}

- (void)_handleWelcomeViewControllerCompletion
{
  objc_class *v3;
  void *v4;

  v3 = -[PUWelcomeViewControllersManager _presentedWelcomeViewControllerClass](self, "_presentedWelcomeViewControllerClass");
  -[PUWelcomeViewControllersManager _remainingWelcomeViewControllerClassesToPresent](self, "_remainingWelcomeViewControllerClassesToPresent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", v3);

  -[PUWelcomeViewControllersManager _setPresentedWelcomeViewControllerClass:](self, "_setPresentedWelcomeViewControllerClass:", 0);
  -[PUWelcomeViewControllersManager _update](self, "_update");
}

- (NSArray)_welcomeViewControllerClasses
{
  return self->__welcomeViewControllerClasses;
}

- (NSMutableSet)_remainingWelcomeViewControllerClassesToPresent
{
  return self->__remainingWelcomeViewControllerClassesToPresent;
}

- (UIViewController)_presentingViewController
{
  return self->__presentingViewController;
}

- (void)_setPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->__presentingViewController, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (Class)_presentedWelcomeViewControllerClass
{
  return self->__presentedWelcomeViewControllerClass;
}

- (void)_setPresentedWelcomeViewControllerClass:(Class)a3
{
  self->__presentedWelcomeViewControllerClass = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->__presentingViewController, 0);
  objc_storeStrong((id *)&self->__remainingWelcomeViewControllerClassesToPresent, 0);
  objc_storeStrong((id *)&self->__welcomeViewControllerClasses, 0);
}

void __42__PUWelcomeViewControllersManager__update__block_invoke_2(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__PUWelcomeViewControllersManager__update__block_invoke_3;
  block[3] = &unk_1E58AB2F8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __42__PUWelcomeViewControllersManager__update__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  PXPreferencesSetWelcomeViewLastPresentationDate();

}

void __42__PUWelcomeViewControllersManager__update__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleWelcomeViewControllerCompletion");

}

+ (PUWelcomeViewControllersManager)defaultManager
{
  if (defaultManager_onceToken_103528 != -1)
    dispatch_once(&defaultManager_onceToken_103528, &__block_literal_global_103529);
  return (PUWelcomeViewControllersManager *)(id)defaultManager_defaultManager_103530;
}

void __49__PUWelcomeViewControllersManager_defaultManager__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = -[PUWelcomeViewControllersManager _initWithWelcomeViewControllerClasses:]([PUWelcomeViewControllersManager alloc], "_initWithWelcomeViewControllerClasses:", v0);
  v2 = (void *)defaultManager_defaultManager_103530;
  defaultManager_defaultManager_103530 = (uint64_t)v1;

}

@end
