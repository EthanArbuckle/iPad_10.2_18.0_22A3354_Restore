@implementation PXApplicationState

+ (BOOL)isRunningInPhotosApp
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "isEqualToString:", CFSTR("MobileSlideShow"));
  return (char)v2;
}

void __33__PXApplicationState_sharedState__block_invoke()
{
  PXApplicationState *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [PXApplicationState alloc];
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[PXApplicationState initWithApplication:isExtension:](v0, "initWithApplication:isExtension:", v3, _UIApplicationIsExtension());
  v2 = (void *)sharedState_sharedState;
  sharedState_sharedState = v1;

}

- (PXApplicationState)initWithApplication:(id)a3 isExtension:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  PXApplicationState *v8;
  PXApplicationState *v9;
  void *v10;
  _QWORD *v11;
  char **v12;
  _QWORD *v13;
  char **v14;
  id v15;
  NSObject *v16;
  int64_t visibilityState;
  uint64_t v18;
  NSMutableSet *disabledIdleTimerTokens;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  int64_t v29;
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PXApplicationState;
  v8 = -[PXApplicationState init](&v21, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_application, a3);
    v9->_needsUpdateVisibilityState = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v9->_isInactive = 0;
      v11 = (_QWORD *)MEMORY[0x1E0CB29E8];
      v12 = &selRef__appDidBecomeActive_;
      v13 = (_QWORD *)MEMORY[0x1E0CB2A00];
      v14 = &selRef__appDidBecomeInactive_;
      v15 = v7;
    }
    else
    {
      v9->_isInactive = objc_msgSend(v7, "applicationState") != 0;
      v15 = 0;
      v9->_isHidden = objc_msgSend(v7, "applicationState") == 2;
      v11 = (_QWORD *)MEMORY[0x1E0DC5308];
      v12 = &selRef__sceneDidActivate_;
      v13 = (_QWORD *)MEMORY[0x1E0DC5330];
      v14 = &selRef__sceneWillDeactivate_;
    }
    objc_msgSend(v10, "addObserver:selector:name:object:", v9, *v14, *v13, v15);
    objc_msgSend(v10, "addObserver:selector:name:object:", v9, *v12, *v11, v15);
    objc_msgSend(v10, "addObserver:selector:name:object:", v9, sel__appDidBecomeHidden_, *MEMORY[0x1E0DC5318], 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", v9, sel__appDidBecomeUnhidden_, *MEMORY[0x1E0DC5338], 0);
    PLUIGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      visibilityState = v9->_visibilityState;
      *(_DWORD *)buf = 136315906;
      v23 = "-[PXApplicationState initWithApplication:isExtension:]";
      v24 = 2112;
      v25 = v7;
      v26 = 1024;
      v27 = v4;
      v28 = 2048;
      v29 = visibilityState;
      _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_DEFAULT, "%s application: %@ isExtension: %i visibilityState: %ld", buf, 0x26u);
    }

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 3);
    disabledIdleTimerTokens = v9->_disabledIdleTimerTokens;
    v9->_disabledIdleTimerTokens = (NSMutableSet *)v18;

    -[PXApplicationState _updateIfNeeded](v9, "_updateIfNeeded");
  }

  return v9;
}

+ (PXApplicationState)sharedState
{
  if (sharedState_onceToken != -1)
    dispatch_once(&sharedState_onceToken, &__block_literal_global_94741);
  return (PXApplicationState *)(id)sharedState_sharedState;
}

- (PXApplicationState)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXApplicationState.m"), 75, CFSTR("%s is not available as initializer"), "-[PXApplicationState init]");

  abort();
}

- (PXApplicationState)initWithApplication:(id)a3
{
  return -[PXApplicationState initWithApplication:isExtension:](self, "initWithApplication:isExtension:", a3, 0);
}

- (BOOL)isLaunchedForTesting
{
  return +[PXApplicationState isLaunchedForTesting](PXApplicationState, "isLaunchedForTesting");
}

- (void)setIsInactive:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->_isInactive != a3)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __36__PXApplicationState_setIsInactive___block_invoke;
    v3[3] = &unk_1E5142B28;
    v3[4] = self;
    v4 = a3;
    -[PXApplicationState performChanges:](self, "performChanges:", v3);
  }
}

- (void)setIsHidden:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->_isHidden != a3)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __34__PXApplicationState_setIsHidden___block_invoke;
    v3[3] = &unk_1E5142B28;
    v3[4] = self;
    v4 = a3;
    -[PXApplicationState performChanges:](self, "performChanges:", v3);
  }
}

- (void)setVisibilityState:(int64_t)a3
{
  NSObject *v4;
  int64_t visibilityState;
  int v6;
  const char *v7;
  __int16 v8;
  int64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_visibilityState != a3)
  {
    self->_visibilityState = a3;
    PLUIGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      visibilityState = self->_visibilityState;
      v6 = 136315394;
      v7 = "-[PXApplicationState setVisibilityState:]";
      v8 = 2048;
      v9 = visibilityState;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "%s visibilityState: %li", (uint8_t *)&v6, 0x16u);
    }

    -[PXApplicationState signalChange:](self, "signalChange:", 1);
  }
}

- (void)didPerformChanges
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXApplicationState;
  -[PXApplicationState didPerformChanges](&v3, sel_didPerformChanges);
  -[PXApplicationState _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)_invalidateVisibilityState
{
  self->_needsUpdateVisibilityState = 1;
}

- (void)_updateIfNeeded
{
  if (self->_needsUpdateVisibilityState)
    -[PXApplicationState _updateVisibilityState](self, "_updateVisibilityState");
}

- (void)_updateVisibilityState
{
  uint64_t v3;
  _BOOL4 v4;
  _QWORD v5[6];

  if (-[PXApplicationState isHidden](self, "isHidden"))
  {
    v3 = 3;
  }
  else
  {
    v4 = -[PXApplicationState isInactive](self, "isInactive");
    v3 = 1;
    if (v4)
      v3 = 2;
  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__PXApplicationState__updateVisibilityState__block_invoke;
  v5[3] = &unk_1E5144FE8;
  v5[4] = self;
  v5[5] = v3;
  -[PXApplicationState performChanges:](self, "performChanges:", v5);
}

- (void)_appDidBecomeInactive:(id)a3
{
  -[PXApplicationState setIsInactive:](self, "setIsInactive:", 1);
}

- (void)_appDidBecomeActive:(id)a3
{
  -[PXApplicationState setIsInactive:](self, "setIsInactive:", 0);
}

- (void)_appDidBecomeHidden:(id)a3
{
  -[PXApplicationState setIsHidden:](self, "setIsHidden:", 1);
}

- (void)_appDidBecomeUnhidden:(id)a3
{
  -[PXApplicationState setIsHidden:](self, "setIsHidden:", 0);
}

- (void)_sceneWillDeactivate:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "role");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DC5650]);

  if (v6)
    -[PXApplicationState setIsInactive:](self, "setIsInactive:", 1);

}

- (void)_sceneDidActivate:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "role");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DC5650]);

  if (v6)
    -[PXApplicationState setIsInactive:](self, "setIsInactive:", 0);

}

- (void)_sceneDidEnterBackground:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "role");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DC5650]);

  if (v6)
    -[PXApplicationState setIsHidden:](self, "setIsHidden:", 1);

}

- (void)_sceneWillEnterBackground:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "role");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DC5650]);

  if (v6)
    -[PXApplicationState setIsHidden:](self, "setIsHidden:", 0);

}

- (id)beginDisablingIdleTimerForReason:(id)a3
{
  id v4;
  NSObject *v5;
  PXApplicationDisabledIdleTimerToken *v6;
  void *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  _QWORD block[4];
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[PXApplicationState isRunningInPhotosApp](PXApplicationState, "isRunningInPhotosApp")
    || (PFProcessIsLaunchedToExecuteTests() & 1) != 0)
  {
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Begin disabling idle timer for reason: %@", buf, 0xCu);
    }

    v6 = -[PXApplicationDisabledIdleTimerToken initWithReason:powerAssertionID:]([PXApplicationDisabledIdleTimerToken alloc], "initWithReason:powerAssertionID:", v4, 0);
    if (!-[NSMutableSet count](self->_disabledIdleTimerTokens, "count"))
    {
      -[PXApplicationState application](self, "application");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        PXAssertGetLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "missing application instance", buf, 2u);
        }

      }
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __55__PXApplicationState_beginDisablingIdleTimerForReason___block_invoke;
      block[3] = &unk_1E5149198;
      v13 = v7;
      v9 = v7;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    -[NSMutableSet addObject:](self->_disabledIdleTimerTokens, "addObject:", v6);
  }
  else
  {
    PLUIGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "Skipping disabling idle timer (requested for reason: %@), because process is not the Photos app", buf, 0xCu);
    }

    v6 = 0;
  }

  return v6;
}

- (void)endDisablingIdleTimer:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLUIGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "reason");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v6;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "End disabling idle timer for reason: %@", buf, 0xCu);

  }
  if ((-[NSMutableSet containsObject:](self->_disabledIdleTimerTokens, "containsObject:", v4) & 1) == 0)
  {
    PXAssertGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_error_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "invalid token (probably an unbalanced call): %@", buf, 0xCu);
    }

  }
  -[NSMutableSet removeObject:](self->_disabledIdleTimerTokens, "removeObject:", v4);
  if (!-[NSMutableSet count](self->_disabledIdleTimerTokens, "count"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__PXApplicationState_endDisablingIdleTimer___block_invoke;
    block[3] = &unk_1E5149198;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

- (BOOL)isDisablingIdleTimerForReasons:(id *)a3
{
  uint64_t v5;
  id v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = -[NSMutableSet count](self->_disabledIdleTimerTokens, "count");
  if (!v5)
  {
    v13 = 0;
    if (!a3)
      goto LABEL_11;
    goto LABEL_10;
  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = self->_disabledIdleTimerTokens;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "reason", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

      }
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  v13 = (void *)objc_msgSend(v6, "copy");
  if (a3)
LABEL_10:
    *a3 = objc_retainAutorelease(v13);
LABEL_11:

  return v5 != 0;
}

- (int64_t)visibilityState
{
  return self->_visibilityState;
}

- (BOOL)isInactive
{
  return self->_isInactive;
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (UIApplication)application
{
  return self->_application;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_disabledIdleTimerTokens, 0);
}

void __44__PXApplicationState_endDisablingIdleTimer___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "application");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setIdleTimerDisabled:", 0);

}

uint64_t __55__PXApplicationState_beginDisablingIdleTimerForReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIdleTimerDisabled:", 1);
}

uint64_t __44__PXApplicationState__updateVisibilityState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setVisibilityState:", *(_QWORD *)(a1 + 40));
}

uint64_t __34__PXApplicationState_setIsHidden___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PLUIGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 106);
    v5 = 136315394;
    v6 = "-[PXApplicationState setIsHidden:]_block_invoke";
    v7 = 1024;
    v8 = v3;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "%s isHidden: %i", (uint8_t *)&v5, 0x12u);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 106) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateVisibilityState");
}

uint64_t __36__PXApplicationState_setIsInactive___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 105) = *(_BYTE *)(a1 + 40);
  PLUIGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 105);
    v5 = 136315394;
    v6 = "-[PXApplicationState setIsInactive:]_block_invoke";
    v7 = 1024;
    v8 = v3;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "%s isInactive: %i", (uint8_t *)&v5, 0x12u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_invalidateVisibilityState");
}

+ (BOOL)isRunningInPhotosTopShelfExtension
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(0, "isEqualToString:", v3);
  return (char)v2;
}

+ (BOOL)isLaunchedForTesting
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "launchedToTest");

  return v3;
}

@end
