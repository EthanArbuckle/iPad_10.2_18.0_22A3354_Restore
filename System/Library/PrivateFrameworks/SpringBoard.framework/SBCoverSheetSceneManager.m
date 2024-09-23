@implementation SBCoverSheetSceneManager

- (SBCoverSheetSceneManager)initWithCoverSheetWindow:(id)a3
{
  id v4;
  SBCoverSheetSceneManager *v5;
  SBCoverSheetSceneManager *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  UIApplicationSceneDeactivationAssertion *notificationCenterAssertion;
  uint64_t v11;
  UIApplicationSceneDeactivationAssertion *systemAnimationAssertion;
  id v13;
  uint64_t v14;
  BSInvalidatable *stateCaptureInvalidatable;
  id v17;
  id location;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SBCoverSheetSceneManager;
  v5 = -[SBCoverSheetSceneManager init](&v19, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_coverSheetWindow, v4);
    +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sceneDeactivationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "newAssertionWithReason:", 1);
    notificationCenterAssertion = v6->_notificationCenterAssertion;
    v6->_notificationCenterAssertion = (UIApplicationSceneDeactivationAssertion *)v9;

    v11 = objc_msgSend(v8, "newAssertionWithReason:", 5);
    systemAnimationAssertion = v6->_systemAnimationAssertion;
    v6->_systemAnimationAssertion = (UIApplicationSceneDeactivationAssertion *)v11;

    objc_initWeak(&location, v6);
    v13 = MEMORY[0x1E0C80D38];
    objc_copyWeak(&v17, &location);
    BSLogAddStateCaptureBlockWithTitle();
    v14 = objc_claimAutoreleasedReturnValue();
    stateCaptureInvalidatable = v6->_stateCaptureInvalidatable;
    v6->_stateCaptureInvalidatable = (BSInvalidatable *)v14;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
  return v6;
}

id __53__SBCoverSheetSceneManager_initWithCoverSheetWindow___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v9 = CFSTR("pendingSceneUpdateBlocks");
    v3 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(WeakRetained, "pendingSceneUpdateBlocks");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)updateSceneManagerForPresented:(BOOL)a3 suspendUnderLockEnvironment:(BOOL)a4
{
  -[SBCoverSheetSceneManager _setSceneBackgrounded:suspendUnderLockEnvironment:](self, "_setSceneBackgrounded:suspendUnderLockEnvironment:", !a3, a4);
}

- (void)updateForegroundScenesForCoverSheetAnimationActive:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  void *v6;
  void *v7;
  UIApplicationSceneDeactivationAssertion *systemAnimationAssertion;
  id v9;
  id WeakRetained;
  void *v11;
  _QWORD v12[4];
  id v13;

  v3 = a3;
  v5 = -[UIApplicationSceneDeactivationAssertion isAcquired](self->_systemAnimationAssertion, "isAcquired");
  if (v3)
  {
    if ((v5 & 1) == 0)
    {
      +[SBSpotlightMultiplexingViewController sharedRemoteSearchViewController](SBSpotlightMultiplexingViewController, "sharedRemoteSearchViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sceneIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      systemAnimationAssertion = self->_systemAnimationAssertion;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __79__SBCoverSheetSceneManager_updateForegroundScenesForCoverSheetAnimationActive___block_invoke;
      v12[3] = &unk_1E8EA3EA0;
      v13 = v7;
      v9 = v7;
      WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetWindow);
      objc_msgSend(WeakRetained, "_fbsDisplayIdentity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIApplicationSceneDeactivationAssertion sb_acquireWithPredicate:transitionContext:displayIdentity:](systemAnimationAssertion, "sb_acquireWithPredicate:transitionContext:displayIdentity:", v12, 0, v11);

    }
  }
  else if (v5)
  {
    -[UIApplicationSceneDeactivationAssertion relinquish](self->_systemAnimationAssertion, "relinquish");
  }
}

uint64_t __79__SBCoverSheetSceneManager_updateForegroundScenesForCoverSheetAnimationActive___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32)) ^ 1;

  return v4;
}

- (void)_performSceneUpdateBlock:(id)a3
{
  id v4;
  NSMutableArray *pendingSceneUpdateBlocks;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  id v9;

  v4 = a3;
  pendingSceneUpdateBlocks = self->_pendingSceneUpdateBlocks;
  v9 = v4;
  if (!pendingSceneUpdateBlocks)
  {
    v6 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    v7 = self->_pendingSceneUpdateBlocks;
    self->_pendingSceneUpdateBlocks = v6;

    pendingSceneUpdateBlocks = self->_pendingSceneUpdateBlocks;
  }
  v8 = (void *)MEMORY[0x1D17E5550]();
  -[NSMutableArray addObject:](pendingSceneUpdateBlocks, "addObject:", v8);

  if (!self->_performingSceneUpdate)
    -[SBCoverSheetSceneManager _performNextSceneUpdateBlock](self, "_performNextSceneUpdateBlock");

}

- (void)_performNextSceneUpdateBlock
{
  void (**v3)(_QWORD, _QWORD);
  _QWORD v4[5];

  if (!self->_performingSceneUpdate)
  {
    -[NSMutableArray firstObject](self->_pendingSceneUpdateBlocks, "firstObject");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      self->_performingSceneUpdate = 1;
      -[NSMutableArray removeObjectAtIndex:](self->_pendingSceneUpdateBlocks, "removeObjectAtIndex:", 0);
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __56__SBCoverSheetSceneManager__performNextSceneUpdateBlock__block_invoke;
      v4[3] = &unk_1E8E9DED8;
      v4[4] = self;
      ((void (**)(_QWORD, _QWORD *))v3)[2](v3, v4);
    }

  }
}

uint64_t __56__SBCoverSheetSceneManager__performNextSceneUpdateBlock__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_performNextSceneUpdateBlock");
}

- (void)_setDisplayLayoutElementActive:(BOOL)a3
{
  BSInvalidatable *displayLayoutAssertion;
  id v5;
  id WeakRetained;
  double v7;
  void *v8;
  BSInvalidatable *v9;
  BSInvalidatable *v10;
  BSInvalidatable *v11;
  void *v12;

  displayLayoutAssertion = self->_displayLayoutAssertion;
  if (a3)
  {
    if (!displayLayoutAssertion)
    {
      v5 = objc_alloc(MEMORY[0x1E0DAAE30]);
      v12 = (void *)objc_msgSend(v5, "initWithIdentifier:", *MEMORY[0x1E0D22C78]);
      WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetWindow);
      objc_msgSend(WeakRetained, "level");
      objc_msgSend(v12, "setLevel:", (uint64_t)v7);

      objc_msgSend(v12, "setFillsDisplayBounds:", 1);
      objc_msgSend(v12, "setLayoutRole:", 3);
      objc_msgSend(MEMORY[0x1E0D22910], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addElement:", v12);
      v9 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      v10 = self->_displayLayoutAssertion;
      self->_displayLayoutAssertion = v9;

    }
  }
  else if (displayLayoutAssertion)
  {
    -[BSInvalidatable invalidate](displayLayoutAssertion, "invalidate");
    v11 = self->_displayLayoutAssertion;
    self->_displayLayoutAssertion = 0;

  }
}

- (void)_setSceneBackgrounded:(BOOL)a3 suspendUnderLockEnvironment:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;
  BOOL v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __78__SBCoverSheetSceneManager__setSceneBackgrounded_suspendUnderLockEnvironment___block_invoke;
  v4[3] = &unk_1E8EB3678;
  v5 = a3;
  v4[4] = self;
  v6 = a4;
  -[SBCoverSheetSceneManager _performSceneUpdateBlock:](self, "_performSceneUpdateBlock:", v4);
}

void __78__SBCoverSheetSceneManager__setSceneBackgrounded_suspendUnderLockEnvironment___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  _QWORD v6[5];
  void (**v7)(_QWORD);
  _QWORD v8[4];
  void (**v9)(_QWORD);
  _QWORD v10[5];

  v3 = a2;
  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 40))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __78__SBCoverSheetSceneManager__setSceneBackgrounded_suspendUnderLockEnvironment___block_invoke_2;
    v10[3] = &unk_1E8E9DED8;
    v10[4] = *(_QWORD *)(a1 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __78__SBCoverSheetSceneManager__setSceneBackgrounded_suspendUnderLockEnvironment___block_invoke_3;
    v8[3] = &unk_1E8E9E8D0;
    v9 = v3;
    objc_msgSend(v4, "setSuspendedUnderLock:alongsideWillChangeBlock:alongsideDidChangeBlock:", 0, v10, v8);
    v5 = v9;
  }
  else
  {
    if (!*(_BYTE *)(a1 + 41))
    {
      objc_msgSend(*(id *)(a1 + 32), "_updateForegroundScenesForNotificationCenter:", 1);
      objc_msgSend(*(id *)(a1 + 32), "_setDisplayLayoutElementActive:", 1);
      v3[2](v3);
      goto LABEL_6;
    }
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __78__SBCoverSheetSceneManager__setSceneBackgrounded_suspendUnderLockEnvironment___block_invoke_4;
    v6[3] = &unk_1E8EA02D8;
    v6[4] = *(_QWORD *)(a1 + 32);
    v7 = v3;
    objc_msgSend(v4, "setSuspendedUnderLock:alongsideWillChangeBlock:alongsideDidChangeBlock:", 1, 0, v6);
    v5 = v7;
  }

LABEL_6:
}

uint64_t __78__SBCoverSheetSceneManager__setSceneBackgrounded_suspendUnderLockEnvironment___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setDisplayLayoutElementActive:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_updateForegroundScenesForNotificationCenter:", 0);
}

uint64_t __78__SBCoverSheetSceneManager__setSceneBackgrounded_suspendUnderLockEnvironment___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __78__SBCoverSheetSceneManager__setSceneBackgrounded_suspendUnderLockEnvironment___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateForegroundScenesForNotificationCenter:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_setDisplayLayoutElementActive:", 1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_updateForegroundScenesForNotificationCenter:(BOOL)a3
{
  _BOOL4 v3;
  int v5;

  v3 = a3;
  v5 = -[UIApplicationSceneDeactivationAssertion isAcquired](self->_notificationCenterAssertion, "isAcquired");
  if (v3)
  {
    if ((v5 & 1) == 0)
      -[UIApplicationSceneDeactivationAssertion acquireWithPredicate:transitionContext:](self->_notificationCenterAssertion, "acquireWithPredicate:transitionContext:", &__block_literal_global_224, 0);
  }
  else if (v5)
  {
    -[UIApplicationSceneDeactivationAssertion relinquish](self->_notificationCenterAssertion, "relinquish");
  }
}

uint64_t __73__SBCoverSheetSceneManager__updateForegroundScenesForNotificationCenter___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;

  v2 = a2;
  +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v3, "isCoverSheetHostingAnApp"))
    goto LABEL_10;
  objc_msgSend(v3, "coverSheetHostedAppSceneHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sceneIfExists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isEqualToString:", v7);

  if ((v8 & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
LABEL_10:
    if (SBSpotlightIsVisible())
    {
      +[SBSpotlightMultiplexingViewController sharedRemoteSearchViewController](SBSpotlightMultiplexingViewController, "sharedRemoteSearchViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sceneIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v4, "isEqualToString:", v11);

      v9 = v12 ^ 1u;
    }
    else
    {
      v9 = 1;
    }
  }

  return v9;
}

- (UIWindow)coverSheetWindow
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_coverSheetWindow);
}

- (void)setCoverSheetWindow:(id)a3
{
  objc_storeWeak((id *)&self->_coverSheetWindow, a3);
}

- (BSInvalidatable)displayLayoutAssertion
{
  return self->_displayLayoutAssertion;
}

- (void)setDisplayLayoutAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_displayLayoutAssertion, a3);
}

- (UIApplicationSceneDeactivationAssertion)notificationCenterAssertion
{
  return self->_notificationCenterAssertion;
}

- (void)setNotificationCenterAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_notificationCenterAssertion, a3);
}

- (UIApplicationSceneDeactivationAssertion)systemAnimationAssertion
{
  return self->_systemAnimationAssertion;
}

- (void)setSystemAnimationAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_systemAnimationAssertion, a3);
}

- (NSMutableArray)pendingSceneUpdateBlocks
{
  return self->_pendingSceneUpdateBlocks;
}

- (void)setPendingSceneUpdateBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_pendingSceneUpdateBlocks, a3);
}

- (BOOL)isPerformingSceneUpdate
{
  return self->_performingSceneUpdate;
}

- (void)setPerformingSceneUpdate:(BOOL)a3
{
  self->_performingSceneUpdate = a3;
}

- (BSInvalidatable)stateCaptureInvalidatable
{
  return self->_stateCaptureInvalidatable;
}

- (void)setStateCaptureInvalidatable:(id)a3
{
  objc_storeStrong((id *)&self->_stateCaptureInvalidatable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureInvalidatable, 0);
  objc_storeStrong((id *)&self->_pendingSceneUpdateBlocks, 0);
  objc_storeStrong((id *)&self->_systemAnimationAssertion, 0);
  objc_storeStrong((id *)&self->_notificationCenterAssertion, 0);
  objc_storeStrong((id *)&self->_displayLayoutAssertion, 0);
  objc_destroyWeak((id *)&self->_coverSheetWindow);
}

@end
