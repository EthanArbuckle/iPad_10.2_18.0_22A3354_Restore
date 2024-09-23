@implementation SBSpotlightDelegateManager

+ (SBSpotlightDelegateManager)sharedInstance
{
  if (sharedInstance_onceToken_30 != -1)
    dispatch_once(&sharedInstance_onceToken_30, &__block_literal_global_225);
  return (SBSpotlightDelegateManager *)(id)sharedInstance_sharedInstance_4;
}

void __44__SBSpotlightDelegateManager_sharedInstance__block_invoke()
{
  SBSpotlightDelegateManager *v0;
  void *v1;

  v0 = objc_alloc_init(SBSpotlightDelegateManager);
  v1 = (void *)sharedInstance_sharedInstance_4;
  sharedInstance_sharedInstance_4 = (uint64_t)v0;

}

- (SBSpotlightDelegateManager)init
{
  SBSpotlightDelegateManager *v2;
  uint64_t v3;
  SBSSpotlightActivationRequestServer *activationRequestServer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBSpotlightDelegateManager;
  v2 = -[SBSpotlightDelegateManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0DAAFC8]), "initWithDelegate:", v2);
    activationRequestServer = v2->_activationRequestServer;
    v2->_activationRequestServer = (SBSSpotlightActivationRequestServer *)v3;

    -[SBSSpotlightActivationRequestServer startServer](v2->_activationRequestServer, "startServer");
  }
  return v2;
}

- (void)addSpotlightDelegate:(id)a3 forLevel:(unint64_t)a4
{
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  uint8_t buf[4];
  unint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (a4 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSpotlightMultiplexingViewController.m"), 113, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("level < SBSpotlightMultiplexingLevelCount"));

  }
  SBLogSpotlight();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v15 = a4;
    v16 = 2114;
    v17 = v7;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Adding Spotlight delegate at level %ld: %{public}@", buf, 0x16u);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__SBSpotlightDelegateManager_addSpotlightDelegate_forLevel___block_invoke;
  v11[3] = &unk_1E8EA0AF0;
  v12 = v7;
  v13 = a4;
  v11[4] = self;
  v9 = v7;
  -[SBSpotlightDelegateManager _modifyDelegatesWithBlock:](self, "_modifyDelegatesWithBlock:", v11);

}

void __60__SBSpotlightDelegateManager_addSpotlightDelegate_forLevel___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v2 = *(void **)(a1[4] + 16);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = a1[4];
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

    v2 = *(void **)(a1[4] + 16);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1[4] + 16);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v9, v8);

  }
  objc_msgSend(v9, "addObject:", a1[5]);

}

- (void)removeSpotlightDelegate:(id)a3 forLevel:(unint64_t)a4
{
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  uint8_t buf[4];
  unint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (a4 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSpotlightMultiplexingViewController.m"), 130, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("level < SBSpotlightMultiplexingLevelCount"));

  }
  SBLogSpotlight();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v15 = a4;
    v16 = 2114;
    v17 = v7;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Removing Spotlight delegate at level %ld: %{public}@", buf, 0x16u);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__SBSpotlightDelegateManager_removeSpotlightDelegate_forLevel___block_invoke;
  v11[3] = &unk_1E8EA0AF0;
  v12 = v7;
  v13 = a4;
  v11[4] = self;
  v9 = v7;
  -[SBSpotlightDelegateManager _modifyDelegatesWithBlock:](self, "_modifyDelegatesWithBlock:", v11);

}

void __63__SBSpotlightDelegateManager_removeSpotlightDelegate_forLevel___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1[4] + 16);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeObject:", a1[5]);
  if (!objc_msgSend(v6, "count"))
  {
    v4 = *(void **)(a1[4] + 16);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:", v5);

  }
}

- (id)activeDelegate
{
  uint64_t v3;
  NSMutableDictionary *delegatesForLevel;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v3 = 3;
  do
  {
    delegatesForLevel = self->_delegatesForLevel;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](delegatesForLevel, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v8 = 1;
    else
      v8 = v3 == 0;
    --v3;
  }
  while (!v8);
  return v7;
}

- (void)_modifyDelegatesWithBlock:(id)a3
{
  void (**v4)(_QWORD);
  id v5;
  id v6;

  v4 = (void (**)(_QWORD))a3;
  -[SBSpotlightDelegateManager activeDelegate](self, "activeDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4[2](v4);

  -[SBSpotlightDelegateManager activeDelegate](self, "activeDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 != v5)
  {
    objc_msgSend(v5, "didBecomeActiveDelegate");
    objc_msgSend(v6, "didResignActiveDelegate:", v5 == 0);
  }

}

- (void)dismissSearchView
{
  id v2;

  -[SBSpotlightDelegateManager activeDelegate](self, "activeDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissSearchView");

}

- (void)searchViewKeyboardPresentationStateDidChange
{
  id v2;

  -[SBSpotlightDelegateManager activeDelegate](self, "activeDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "searchViewKeyboardPresentationStateDidChange");

}

- (void)searchViewContentAvailabilityDidChange
{
  id v2;

  -[SBSpotlightDelegateManager activeDelegate](self, "activeDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "searchViewContentAvailabilityDidChange");

}

- (void)spotlightActivationRequestServerDidRequestSpotlightActivation:(id)a3
{
  if ((SBSpotlightIsVisible() & 1) == 0)
    objc_msgSend((id)SBApp, "toggleSearchOnWindowScene:fromBreadcrumbSource:withWillBeginHandler:completionHandler:", 0, 0, &__block_literal_global_65_0, &__block_literal_global_66_1);
}

- (NSMutableDictionary)delegatesForLevel
{
  return self->_delegatesForLevel;
}

- (void)setDelegatesForLevel:(id)a3
{
  objc_storeStrong((id *)&self->_delegatesForLevel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegatesForLevel, 0);
  objc_storeStrong((id *)&self->_activationRequestServer, 0);
}

@end
