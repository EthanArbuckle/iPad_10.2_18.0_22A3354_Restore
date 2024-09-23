@implementation SBSystemShellExternalDisplaySceneManager

- (SBSystemShellExternalDisplaySceneManager)initWithReference:(id)a3 sceneIdentityProvider:(id)a4 presentationBinder:(id)a5
{
  return -[SBSystemShellExternalDisplaySceneManager initWithReference:sceneIdentityProvider:presentationBinder:snapshotBehavior:](self, "initWithReference:sceneIdentityProvider:presentationBinder:snapshotBehavior:", a3, a4, a5, 1);
}

- (SBSystemShellExternalDisplaySceneManager)initWithReference:(id)a3 sceneIdentityProvider:(id)a4 presentationBinder:(id)a5 snapshotBehavior:(unint64_t)a6
{
  id v10;
  SBSystemShellExternalDisplaySceneManager *v11;
  SBSystemShellExternalDisplayPolicyAggregator *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  SBPolicyAggregatorCapabilityQuerying *policyAggregator;
  objc_super v20;

  v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SBSystemShellExternalDisplaySceneManager;
  v11 = -[SBSceneManager initWithReference:sceneIdentityProvider:presentationBinder:snapshotBehavior:](&v20, sel_initWithReference_sceneIdentityProvider_presentationBinder_snapshotBehavior_, a3, v10, a5, a6);
  if (v11)
  {
    objc_msgSend(v10, "setDataSource:", v11);
    v12 = [SBSystemShellExternalDisplayPolicyAggregator alloc];
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSceneManager displayIdentity](v11, "displayIdentity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "policyAggregator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[SBSystemShellExternalDisplayPolicyAggregator initWithDefaults:displayIdentity:policyDataSource:](v12, "initWithDefaults:displayIdentity:policyDataSource:", v13, v14, v16);
    policyAggregator = v11->_policyAggregator;
    v11->_policyAggregator = (SBPolicyAggregatorCapabilityQuerying *)v17;

  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[UIApplicationSceneClientSettingsDiffInspector removeAllObservers](self->_appClientSettingsDiffInspector, "removeAllObservers");
  v3.receiver = self;
  v3.super_class = (Class)SBSystemShellExternalDisplaySceneManager;
  -[SBSceneManager dealloc](&v3, sel_dealloc);
}

- (SBPolicyAggregatorCapabilityQuerying)policyAggregator
{
  return self->_policyAggregator;
}

- (BOOL)_shouldAutoHostScene:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CEA6C8], "usesInputSystemUI") & 1) != 0
    || (v4 = (void *)*MEMORY[0x1E0D42708],
        objc_msgSend(v3, "identifier"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        LOBYTE(v4) = objc_msgSend(v4, "isEqualToString:", v5),
        v5,
        (v4 & 1) == 0))
  {
    objc_msgSend(v3, "clientProcess");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = !objc_msgSend(v7, "isApplicationProcess") || objc_msgSend(v7, "isCurrentProcess");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_shouldTrackScenesForDeactivation
{
  return 1;
}

- (void)_doObserverCalloutWithBlock:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBSystemShellExternalDisplaySceneManager;
  -[SBSceneManager _doObserverCalloutWithBlock:](&v3, sel__doObserverCalloutWithBlock_, a3);
}

- (void)_reconnectSceneRemnant:(id)a3 forProcess:(id)a4 sceneManager:(id)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBSystemShellExternalDisplaySceneManager;
  -[SBSceneManager _reconnectSceneRemnant:forProcess:sceneManager:](&v5, sel__reconnectSceneRemnant_forProcess_sceneManager_, a3, a4, a5);
}

- (void)_scene:(id)a3 interceptUpdateWithNewSettings:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBSystemShellExternalDisplaySceneManager;
  -[SBSceneManager _scene:interceptUpdateWithNewSettings:](&v4, sel__scene_interceptUpdateWithNewSettings_, a3, a4);
}

- (void)_scene:(id)a3 willUpdateWithSettings:(id)a4 transitionContext:(id)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBSystemShellExternalDisplaySceneManager;
  -[SBSceneManager _scene:willUpdateWithSettings:transitionContext:](&v5, sel__scene_willUpdateWithSettings_transitionContext_, a3, a4, a5);
}

- (void)_scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBSystemShellExternalDisplaySceneManager;
  -[SBSceneManager _scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:](&v6, sel__scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext_, a3, a4, a5, a6);
}

- (BOOL)_shouldFenceTransitionForScene:(id)a3 updatedClientSettingsDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBSystemShellExternalDisplaySceneManager;
  return -[SBSceneManager _shouldFenceTransitionForScene:updatedClientSettingsDiff:oldClientSettings:transitionContext:](&v7, sel__shouldFenceTransitionForScene_updatedClientSettingsDiff_oldClientSettings_transitionContext_, a3, a4, a5, a6);
}

- (void)_noteDidChangeToVisibility:(unint64_t)a3 previouslyExisted:(BOOL)a4 forScene:(id)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBSystemShellExternalDisplaySceneManager;
  -[SBSceneManager _noteDidChangeToVisibility:previouslyExisted:forScene:](&v5, sel__noteDidChangeToVisibility_previouslyExisted_forScene_, a3, a4, a5);
}

- (void)_noteDidCommitUpdateForScene:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBSystemShellExternalDisplaySceneManager;
  -[SBSceneManager _noteDidCommitUpdateForScene:](&v3, sel__noteDidCommitUpdateForScene_, a3);
}

- (SBWindowScene)_windowScene
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSceneManager displayIdentity](self, "displayIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowSceneForDisplayIdentity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBWindowScene *)v5;
}

- (BOOL)isSuspendedUnderLock
{
  BSDispatchQueueAssertMain();
  return -[SBSuspendedUnderLockManager isSuspendedUnderLock](self->_lazy_suspendedUnderLockManager, "isSuspendedUnderLock");
}

- (void)setSuspendedUnderLock:(BOOL)a3
{
  -[SBSystemShellExternalDisplaySceneManager setSuspendedUnderLock:alongsideWillChangeBlock:alongsideDidChangeBlock:](self, "setSuspendedUnderLock:alongsideWillChangeBlock:alongsideDidChangeBlock:", a3, 0, 0);
}

- (void)setSuspendedUnderLock:(BOOL)a3 alongsideWillChangeBlock:(id)a4 alongsideDidChangeBlock:(id)a5
{
  _BOOL8 v6;
  id v8;
  SBSuspendedUnderLockManager *lazy_suspendedUnderLockManager;
  SBSuspendedUnderLockManager *v10;
  void *v11;
  void *v12;
  SBSuspendedUnderLockManager *v13;
  SBSuspendedUnderLockManager *v14;
  id v15;

  v6 = a3;
  v15 = a4;
  v8 = a5;
  BSDispatchQueueAssertMain();
  lazy_suspendedUnderLockManager = self->_lazy_suspendedUnderLockManager;
  if (!lazy_suspendedUnderLockManager)
  {
    v10 = [SBSuspendedUnderLockManager alloc];
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "eventQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SBSuspendedUnderLockManager initWithDelegate:eventQueue:](v10, "initWithDelegate:eventQueue:", self, v12);
    v14 = self->_lazy_suspendedUnderLockManager;
    self->_lazy_suspendedUnderLockManager = v13;

    lazy_suspendedUnderLockManager = self->_lazy_suspendedUnderLockManager;
  }
  -[SBSuspendedUnderLockManager setSuspendedUnderLock:alongsideWillChangeBlock:alongsideDidChangeBlock:](lazy_suspendedUnderLockManager, "setSuspendedUnderLock:alongsideWillChangeBlock:alongsideDidChangeBlock:", v6, v15, v8);

}

- (id)layoutStateManager
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSceneManager displayIdentity](self, "displayIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowSceneForDisplayIdentity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "layoutStateManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)externalApplicationSceneHandles
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBSystemShellExternalDisplaySceneManager;
  -[SBSceneManager externalApplicationSceneHandles](&v3, sel_externalApplicationSceneHandles);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)transientApplicationSceneHandlesForApplication:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBSystemShellExternalDisplaySceneManager;
  -[SBSceneManager transientApplicationSceneHandlesForApplication:](&v4, sel_transientApplicationSceneHandlesForApplication_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)newSceneIdentifierForBundleIdentifier:(id)a3 supportsMultiwindow:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBSystemShellExternalDisplaySceneManager;
  return -[SBSceneManager newSceneIdentifierForBundleIdentifier:supportsMultiwindow:](&v5, sel_newSceneIdentifierForBundleIdentifier_supportsMultiwindow_, a3, a4);
}

- (id)suspendedUnderLockManagerDisplayConfiguration:(id)a3
{
  void *v3;
  void *v4;

  -[SBSceneManager displayIdentity](self, "displayIdentity", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)suspendedUnderLockManager:(id)a3 sceneHandleForScene:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBSystemShellExternalDisplaySceneManager;
  -[SBSceneManager existingSceneHandleForScene:](&v5, sel_existingSceneHandleForScene_, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)suspendedUnderLockManager:(id)a3 shouldPreventUnderLockForScene:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a4, "clientHandle", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.PosterBoard"));
  return (char)v4;
}

- (BOOL)suspendedUnderLockManager:(id)a3 shouldPreventSuspendUnderLockForScene:(id)a4 settings:(id)a5
{
  return 0;
}

- (id)suspendedUnderLockManagerVisibleScenes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemShellExternalDisplaySceneManager _windowScene](self, "_windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "switcherController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutStateApplicationSceneHandles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unionSet:", v7);

  return v4;
}

- (id)sceneSnapshotRequestStrategyForSceneSnapshotRequestor:(id)a3
{
  return objc_alloc_init(SBExternalDisplaySceneSnapshotRequestStrategy);
}

- (id)_appSceneClientSettingsDiffInspector
{
  UIApplicationSceneClientSettingsDiffInspector *appClientSettingsDiffInspector;
  UIApplicationSceneClientSettingsDiffInspector *v4;
  UIApplicationSceneClientSettingsDiffInspector *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  UIApplicationSceneClientSettingsDiffInspector *v9;
  void *v10;

  appClientSettingsDiffInspector = self->_appClientSettingsDiffInspector;
  if (!appClientSettingsDiffInspector)
  {
    v4 = (UIApplicationSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E0CEA328]);
    v5 = self->_appClientSettingsDiffInspector;
    self->_appClientSettingsDiffInspector = v4;

    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v9 = self->_appClientSettingsDiffInspector;
      __80__SBSystemShellExternalDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke(v8, &__block_literal_global_37_5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIApplicationSceneClientSettingsDiffInspector observePreferredPointerLockStateWithBlock:](v9, "observePreferredPointerLockStateWithBlock:", v10);

    }
    appClientSettingsDiffInspector = self->_appClientSettingsDiffInspector;
  }
  return appClientSettingsDiffInspector;
}

id __80__SBSystemShellExternalDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__SBSystemShellExternalDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_2;
  v6[3] = &unk_1E8E9E1D0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)objc_msgSend(v6, "copy");

  return v4;
}

uint64_t __80__SBSystemShellExternalDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __80__SBSystemShellExternalDisplaySceneManager__appSceneClientSettingsDiffInspector__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v2 = a2;
  objc_msgSend(v2, "updatedClientSettings");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v11, "preferredPointerLockStatus");
  objc_msgSend(v2, "scene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)SBApp, "windowSceneManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sceneHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "displayIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowSceneForDisplayIdentity:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lockedPointerManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "clientWithSceneIdentifier:prefersPointerLockStatus:", v5, v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyAggregator, 0);
  objc_storeStrong((id *)&self->_appClientSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_lazy_suspendedUnderLockManager, 0);
}

@end
