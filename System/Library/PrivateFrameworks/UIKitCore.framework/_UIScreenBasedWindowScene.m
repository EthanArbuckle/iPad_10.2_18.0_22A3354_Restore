@implementation _UIScreenBasedWindowScene

- (id)_synthesizedSettings
{
  UIMutableApplicationSceneSettings *v3;
  UIMutableApplicationSceneSettings *synthesizedSettings;
  void *v5;
  void *v6;
  void *v7;

  if (!self->_synthesizedSettings)
  {
    v3 = (UIMutableApplicationSceneSettings *)objc_opt_new();
    -[UIMutableApplicationSceneSettings setForeground:](v3, "setForeground:", 0);
    synthesizedSettings = self->_synthesizedSettings;
    self->_synthesizedSettings = v3;

  }
  -[UIScreen _referenceBounds](self->_screen, "_referenceBounds");
  -[UIMutableApplicationSceneSettings setFrame:](self->_synthesizedSettings, "setFrame:");
  -[UIMutableApplicationSceneSettings setArtworkSubtype:](self->_synthesizedSettings, "setArtworkSubtype:", -[UIScreen _artworkSubtype](self->_screen, "_artworkSubtype"));
  -[UIMutableApplicationSceneSettings setInterfaceOrientation:](self->_synthesizedSettings, "setInterfaceOrientation:", -[UIScreen _interfaceOrientation](self->_screen, "_interfaceOrientation"));
  -[UIMutableApplicationSceneSettings setArtworkSubtype:](self->_synthesizedSettings, "setArtworkSubtype:", -[UIScreen _artworkSubtype](self->_screen, "_artworkSubtype"));
  -[UIScreen displayConfiguration](self->_screen, "displayConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[UIMutableApplicationSceneSettings setDisplayConfiguration:](self->_synthesizedSettings, "setDisplayConfiguration:", v5);
  -[UIScreen traitCollection](self->_screen, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIMutableApplicationSceneSettings setUserInterfaceStyle:](self->_synthesizedSettings, "setUserInterfaceStyle:", objc_msgSend(v6, "userInterfaceStyle"));

  v7 = (void *)-[UIMutableApplicationSceneSettings copy](self->_synthesizedSettings, "copy");
  return v7;
}

- (CGRect)_referenceBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIScreen _unjailedReferenceBounds](self->_screen, "_unjailedReferenceBounds");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)screen
{
  UIScreen *screen;

  screen = self->_screen;
  if (screen)
    return screen;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_displayInfoProvider
{
  void *v2;
  void *v3;

  -[_UIScreenBasedWindowScene screen](self, "screen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_displayInfoProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_unassociatedWindowSceneForScreen:(id)a3 create:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  uint64_t *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t *v24;
  id v25;
  BOOL v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;

  v6 = a3;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__25;
  v37 = __Block_byref_object_dispose__25;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__25;
  v31 = __Block_byref_object_dispose__25;
  v32 = 0;
  objc_msgSend(a1, "unassociationCacheAccessQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __70___UIScreenBasedWindowScene__unassociatedWindowSceneForScreen_create___block_invoke;
  v20 = &unk_1E16B7FA8;
  v22 = &v33;
  v8 = v6;
  v21 = v8;
  v23 = &v27;
  v24 = &v39;
  v26 = a4;
  v25 = a1;
  dispatch_sync(v7, &v17);

  v9 = v28;
  if (*((_BYTE *)v40 + 24) && v28[5] && v34[5])
  {
    v10 = objc_alloc((Class)a1);
    objc_msgSend((id)v28[5], "session", v17, v18, v19, v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithScreen:session:lookupKey:", v8, v11, v34[5]);

    objc_msgSend((id)v28[5], "setScene:", v12);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:", CFSTR("UISceneWillConnectNotification"), v12);

    objc_msgSend((id)v28[5], "session");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_setScene:", v12);

    v9 = v28;
  }
  objc_msgSend((id)v9[5], "scene", v17, v18, v19, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  return v15;
}

+ (id)unassociationCache
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;

  objc_msgSend((id)objc_opt_class(), "unassociationCacheAccessQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  v3 = (void *)unassociationCache__screenWindowSceneDictionary;
  if (!unassociationCache__screenWindowSceneDictionary)
  {
    v4 = objc_opt_new();
    v5 = (void *)unassociationCache__screenWindowSceneDictionary;
    unassociationCache__screenWindowSceneDictionary = v4;

    v3 = (void *)unassociationCache__screenWindowSceneDictionary;
  }
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v8 = (void *)objc_opt_new();
    v9 = (void *)unassociationCache__screenWindowSceneDictionary;
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v8, v11);

  }
  return v8;
}

+ (id)unassociationCacheAccessQueue
{
  if (qword_1ECD7AC38 != -1)
    dispatch_once(&qword_1ECD7AC38, &__block_literal_global_95);
  return (id)_MergedGlobals_17_0;
}

- (CGRect)_referenceBoundsForOrientation:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[UIScreen _unjailedReferenceBoundsForInterfaceOrientation:](self->_screen, "_unjailedReferenceBoundsForInterfaceOrientation:", a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)_attachWindow:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIScreenBasedWindowScene;
  -[UIWindowScene _attachWindow:](&v5, sel__attachWindow_, a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("_UIScreenBasedWindowSceneDidAttachWindowNotification"), self, 0);

}

- (void)_screenInterfaceOrientationChanged:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  UIScreen *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v6 = v8;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v8, "object");
    v7 = (UIScreen *)objc_claimAutoreleasedReturnValue();
    if (v7 == self->_screen)
      -[UIWindowScene _computeMetrics:](self, "_computeMetrics:", 0);

    v6 = v8;
  }

}

- (void)_setKeepContextAssociationInBackground:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  objc_super v6;

  v3 = a3;
  if (objc_msgSend((id)objc_opt_class(), "alwaysKeepContexts"))
  {
    -[UIWindowScene _contextBinder](self, "_contextBinder");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContextManagementPolicy:", 1);

  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_UIScreenBasedWindowScene;
    -[UIWindowScene _setKeepContextAssociationInBackground:](&v6, sel__setKeepContextAssociationInBackground_, v3);
  }
}

- (_UIScreenBasedWindowScene)initWithScreen:(id)a3 session:(id)a4 lookupKey:(id)a5
{
  id v10;
  id v11;
  id v12;
  void *v13;
  UISceneConnectionOptions *v14;
  void *v15;
  id v16;
  _UISceneMetricsCalculating *v17;
  _UISceneMetricsCalculating *metricsCalculator;
  _UIScreenBasedWindowScene *v19;
  _UIScreenBasedWindowScene *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD aBlock[4];
  _UIScreenBasedWindowScene *v28;
  id v29;
  SEL v30;
  objc_super v31;

  v10 = a3;
  v11 = a5;
  v12 = a4;
  v13 = (void *)objc_opt_new();
  v14 = [UISceneConnectionOptions alloc];
  v15 = (void *)objc_opt_new();
  v16 = -[UISceneConnectionOptions _initWithConnectionOptionsContext:fbsScene:specification:](v14, "_initWithConnectionOptionsContext:fbsScene:specification:", v15, 0, v13);

  objc_msgSend(v12, "_resetStateRestorationToActivity:", 0);
  objc_msgSend(v12, "_clearAllDirtyFlags");
  objc_storeStrong((id *)&self->_screen, a3);
  objc_storeStrong((id *)&self->_lookupKey, a5);
  v17 = (_UISceneMetricsCalculating *)objc_opt_new();
  metricsCalculator = self->super._metricsCalculator;
  self->super._metricsCalculator = v17;

  v31.receiver = self;
  v31.super_class = (Class)_UIScreenBasedWindowScene;
  v19 = -[UIWindowScene initWithSession:connectionOptions:](&v31, sel_initWithSession_connectionOptions_, v12, v16);

  if (v19)
  {
    -[UIWindowScene _computeMetrics:](v19, "_computeMetrics:", 0);
    if (objc_msgSend((id)objc_opt_class(), "shouldAllowComponents"))
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __62___UIScreenBasedWindowScene_initWithScreen_session_lookupKey___block_invoke;
      aBlock[3] = &unk_1E16B7FD0;
      v30 = a2;
      v20 = v19;
      v28 = v20;
      v21 = v13;
      v29 = v21;
      v22 = _Block_copy(aBlock);
      objc_msgSend(v21, "coreSceneComponentClassDictionary");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v22);

      objc_msgSend(v21, "baseSceneComponentClassDictionary");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v22);

      -[UIScene _initializeSceneComponents](v20, "_initializeSceneComponents");
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v19, sel__screenDisconnected_, CFSTR("_UIScreenDidDisconnectNotification"), v10);
    objc_msgSend(v25, "addObserver:selector:name:object:", v19, sel__screenInterfaceOrientationChanged_, CFSTR("_UIScreenInterfaceOrientationDidChangeNotification"), v10);

  }
  return v19;
}

- (void)_detachWindow:(id)a3
{
  void *v4;
  objc_super v5;
  _QWORD v6[5];
  id v7;
  id location;

  v5.receiver = self;
  v5.super_class = (Class)_UIScreenBasedWindowScene;
  -[UIWindowScene _detachWindow:](&v5, sel__detachWindow_, a3);
  if (objc_msgSend((id)objc_opt_class(), "autoInvalidates")
    && !self->_invalidationEvaluatorRegistered
    && !-[UIScene _hasInvalidated](self, "_hasInvalidated")
    && !self->_invalidationEvaluatorRegistered)
  {
    self->_invalidationEvaluatorRegistered = 1;
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __67___UIScreenBasedWindowScene__registerInvalidationEvaluatorIfNeeded__block_invoke;
    v6[3] = &unk_1E16B1500;
    objc_copyWeak(&v7, &location);
    v6[4] = self;
    objc_msgSend(v4, "performBlock:", v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (id)_homeAffordanceSceneNotifier
{
  int v3;
  void *v4;

  if (!_os_feature_enabled_impl())
    goto LABEL_6;
  v3 = _UIDeviceSupportsGlobalEdgeSwipeTouches();
  v4 = 0;
  if (self && v3)
  {
    if (!-[UIScene _hostsWindows](self, "_hostsWindows") || -[UIScene _hasInvalidated](self, "_hasInvalidated"))
    {
LABEL_6:
      v4 = 0;
      return v4;
    }
    -[UIScene _existingHomeAffordanceSceneNotifier](self, "_existingHomeAffordanceSceneNotifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend((id)UIApp, "isFrontBoard");
      v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithScene:", self);
      -[UIWindowScene _registerSceneComponent:forKey:](self, "_registerSceneComponent:forKey:", v4, CFSTR("_UIHomeAffordanceSceneNotifierComponentKey"));
    }
  }
  return v4;
}

+ (BOOL)alwaysKeepContexts
{
  return 1;
}

+ (BOOL)shouldAllowComponents
{
  return 1;
}

+ (BOOL)autoInvalidates
{
  return 1;
}

- (void)_invalidate
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_UIScreenBasedWindowScene;
  -[UIWindowScene _invalidate](&v4, sel__invalidate);
}

- (void)_performInvalidationIfNeeded
{
  unint64_t v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a1 && a1[505] && (objc_msgSend(a1, "_hasInvalidated") & 1) == 0)
  {
    a1[505] = 0;
    v2 = _performInvalidationIfNeeded___s_category[0];
    if (!_performInvalidationIfNeeded___s_category[0])
    {
      v2 = __UILogCategoryGetNode("SceneAutoInvalidation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v2, _performInvalidationIfNeeded___s_category);
    }
    v3 = *(NSObject **)(v2 + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      objc_msgSend(a1, "succinctDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v9 = v5;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "Performing invalidation for scene: %{public}@", buf, 0xCu);

    }
    objc_msgSend(a1, "_invalidate");
    objc_msgSend((id)objc_opt_class(), "unassociationCacheAccessQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57___UIScreenBasedWindowScene__performInvalidationIfNeeded__block_invoke;
    block[3] = &unk_1E16B1B28;
    block[4] = a1;
    dispatch_sync(v6, block);

  }
}

- (id)_preventAutoInvalidationForReason:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  const char *Name;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  unint64_t v16;
  NSObject *v17;
  id *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  id location;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1 && objc_msgSend((id)objc_opt_class(), "autoInvalidates") && !*(_BYTE *)(a1 + 505))
  {
    if (!*(_QWORD *)(a1 + 520))
    {
      v6 = objc_opt_new();
      v7 = *(void **)(a1 + 520);
      *(_QWORD *)(a1 + 520) = v6;

    }
    v8 = (objc_class *)objc_opt_class();
    Name = class_getName(v8);
    if (!*(_QWORD *)(a1 + 512))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %p: prevent screen disconnection"), Name, a1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIScreen _preventDisconnectionForReason:](*(_QWORD *)(a1 + 488), v10);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(a1 + 512);
      *(_QWORD *)(a1 + 512) = v11;

    }
    objc_initWeak(&location, (id)a1);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s-%p-%lu"), Name, a1, ++qword_1ECD7AC40);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc(MEMORY[0x1E0D01868]);
    v15 = MEMORY[0x1E0C80D38];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __63___UIScreenBasedWindowScene__preventAutoInvalidationForReason___block_invoke;
    v25[3] = &unk_1E16B7FF8;
    objc_copyWeak(&v26, &location);
    v4 = (void *)objc_msgSend(v14, "initWithIdentifier:forReason:queue:invalidationBlock:", v13, v3, MEMORY[0x1E0C80D38], v25);

    objc_msgSend(*(id *)(a1 + 520), "addObject:", v4);
    v16 = qword_1ECD7AC48;
    if (!qword_1ECD7AC48)
    {
      v16 = __UILogCategoryGetNode("SceneAutoInvalidation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v16, (unint64_t *)&qword_1ECD7AC48);
    }
    v17 = *(id *)(v16 + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (id *)(id)a1;
      v19 = (void *)MEMORY[0x1E0CB3940];
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("<%@: %p>"), v21, v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = v22;
      v24 = objc_msgSend(v18[65], "count");
      *(_DWORD *)buf = 138543874;
      v29 = v23;
      v30 = 2048;
      v31 = v24;
      v32 = 2114;
      v33 = v4;
      _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_DEFAULT, "Preventing auto invalidation of scene: %{public}@; assertionsCount: %lu; assertion: %{public}@",
        buf,
        0x20u);

    }
    objc_destroyWeak(&v26);

    objc_destroyWeak(&location);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_removeAutoInvalidationPreventionAssertion:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  _UIScreenBasedWindowScene *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  NSMutableSet *v13;
  id v14;
  uint64_t v15;
  BSInvalidatable *screenDisconnectionPreventionAssertion;
  unint64_t v17;
  NSObject *v18;
  NSMutableSet *v19;
  NSObject *v20;
  NSMutableSet *autoInvalidationPreventionAssertions;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_autoInvalidationPreventionAssertions, "containsObject:", v4) & 1) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        autoInvalidationPreventionAssertions = self->_autoInvalidationPreventionAssertions;
        *(_DWORD *)buf = 138412546;
        v23 = v4;
        v24 = 2112;
        v25 = (uint64_t)autoInvalidationPreventionAssertions;
        _os_log_fault_impl(&dword_185066000, v20, OS_LOG_TYPE_FAULT, "Attempting to remove untracked autoInvalidationPreventionAssertion: %@; _autoInvalidationPreventionAssertions: %@",
          buf,
          0x16u);
      }

    }
    else
    {
      v17 = qword_1ECD7AC50;
      if (!qword_1ECD7AC50)
      {
        v17 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v17, (unint64_t *)&qword_1ECD7AC50);
      }
      v18 = *(NSObject **)(v17 + 8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = self->_autoInvalidationPreventionAssertions;
        *(_DWORD *)buf = 138412546;
        v23 = v4;
        v24 = 2112;
        v25 = (uint64_t)v19;
        _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "Attempting to remove untracked autoInvalidationPreventionAssertion: %@; _autoInvalidationPreventionAssertions: %@",
          buf,
          0x16u);
      }
    }
  }
  v5 = qword_1ECD7AC58;
  if (!qword_1ECD7AC58)
  {
    v5 = __UILogCategoryGetNode("SceneAutoInvalidation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&qword_1ECD7AC58);
  }
  v6 = *(NSObject **)(v5 + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = self;
    v9 = v6;
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p>"), v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = self->_autoInvalidationPreventionAssertions;
    v14 = v12;
    v15 = -[NSMutableSet count](v13, "count");
    *(_DWORD *)buf = 138543874;
    v23 = v12;
    v24 = 2048;
    v25 = v15;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "Removing autoInvalidationPreventionAssertion from scene: %{public}@; assertionsCount: %lu; assertion: %{public}@; ",
      buf,
      0x20u);

  }
  -[NSMutableSet removeObject:](self->_autoInvalidationPreventionAssertions, "removeObject:", v4);
  if (!-[NSMutableSet count](self->_autoInvalidationPreventionAssertions, "count"))
  {
    -[_UIScreenBasedWindowScene _performInvalidationIfNeeded](self);
    -[BSInvalidatable invalidate](self->_screenDisconnectionPreventionAssertion, "invalidate");
    screenDisconnectionPreventionAssertion = self->_screenDisconnectionPreventionAssertion;
    self->_screenDisconnectionPreventionAssertion = 0;

  }
}

- (id)_primaryViewServiceOperator
{
  _QWORD *v3;
  void *v4;
  id *v5;
  id WeakRetained;
  uint64_t v7;
  id v8;
  void *v9;
  _UIScreenBasedWindowScene *v10;
  id v11;
  _UIScreenBasedWindowScene *v12;
  _UIScreenBasedWindowScene *v13;
  _UIScreenBasedWindowScene *v14;
  int v15;
  void *v16;
  uint64_t v17;
  _UIScreenBasedWindowScene *v18;

  +[_UIActiveViewServiceSessionTracker sharedTracker](_UIActiveViewServiceSessionTracker, "sharedTracker");
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (-[_UIActiveViewServiceSessionTracker hasTrackedSessions]((uint64_t)v3))
  {
    -[UIWindowScene traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActiveViewServiceSessionTracker mostActiveViewServiceSessionForUserInterfaceIdiom:](v3, objc_msgSend(v4, "userInterfaceIdiom"));
    v5 = (id *)objc_claimAutoreleasedReturnValue();

    if (v5)
      WeakRetained = objc_loadWeakRetained(v5 + 9);
    else
      WeakRetained = 0;
    v7 = objc_opt_class();
    v8 = WeakRetained;
    if (v7)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v11 = v9;

    if (!v11)
      goto LABEL_15;
    objc_msgSend(v11, "windowScene");
    v12 = (_UIScreenBasedWindowScene *)(id)objc_claimAutoreleasedReturnValue();
    v13 = self;
    v14 = v13;
    if (v12 == v13)
    {

    }
    else
    {
      if (!v13 || !v12)
      {

        v10 = 0;
LABEL_24:

        goto LABEL_25;
      }
      v15 = -[_UIScreenBasedWindowScene isEqual:](v12, "isEqual:", v13);

      if (!v15)
      {
LABEL_15:
        v10 = 0;
LABEL_25:

        goto LABEL_26;
      }
    }
    objc_msgSend(v11, "rootViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_class();
    v12 = v16;
    if (v17)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v12;
      else
        v18 = 0;
    }
    else
    {
      v18 = 0;
    }
    v10 = v18;
    goto LABEL_24;
  }
  v10 = 0;
LABEL_26:

  return v10;
}

- (void)_addSubclassFlagsToDebugDescriptionWithBuilder:(id)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIScreenBasedWindowScene;
  -[UIScene _addSubclassFlagsToDebugDescriptionWithBuilder:](&v7, sel__addSubclassFlagsToDebugDescriptionWithBuilder_, v4);
  v5 = (id)objc_msgSend(v4, "appendBool:withName:", objc_msgSend((id)objc_opt_class(), "autoInvalidates"), CFSTR("autoInvalidates"));
  v6 = (id)objc_msgSend(v4, "appendBool:withName:", self->_needsInvalidation, CFSTR("needsInvalidation"));

}

- (void)_addSubclassDebugDescriptionWithBuilder:(id)a3
{
  id v4;
  BSInvalidatable *screenDisconnectionPreventionAssertion;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIScreenBasedWindowScene;
  -[UIScene _addSubclassDebugDescriptionWithBuilder:](&v10, sel__addSubclassDebugDescriptionWithBuilder_, v4);
  screenDisconnectionPreventionAssertion = self->_screenDisconnectionPreventionAssertion;
  if (screenDisconnectionPreventionAssertion)
    v6 = (id)objc_msgSend(v4, "appendObject:withName:", screenDisconnectionPreventionAssertion, CFSTR("screenDisconnectionPreventionAssertion"));
  if (self->_autoInvalidationPreventionAssertions)
  {
    objc_msgSend(v4, "activeMultilinePrefix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __69___UIScreenBasedWindowScene__addSubclassDebugDescriptionWithBuilder___block_invoke;
    v8[3] = &unk_1E16B1B50;
    v8[4] = self;
    v9 = v4;
    objc_msgSend(v9, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("autoInvalidationPreventionAssertions"), v7, v8);

  }
}

- (void)_updateClientSettingsToInterfaceOrientation:(int64_t)a3 withAnimationDuration:(double)a4
{
  -[UIScreen _setInterfaceOrientation:](self->_screen, "_setInterfaceOrientation:", a3, a4);
}

- (BOOL)_usesMinimumSafeAreaInsets
{
  return 0;
}

- (void)_openURL:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v5;
  void *v6;
  _QWORD block[4];
  id v8;

  v5 = a5;
  v6 = v5;
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64___UIScreenBasedWindowScene__openURL_options_completionHandler___block_invoke;
    block[3] = &unk_1E16B1BF8;
    v8 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

- (BOOL)_shouldAllowFencing
{
  return 1;
}

- (void)_screenDisconnected:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  UIScreen *v7;
  BSInvalidatable *v8;
  unint64_t v9;
  NSObject *v10;
  BSInvalidatable *v11;
  NSObject *v12;
  BSInvalidatable *screenDisconnectionPreventionAssertion;
  int v14;
  UIScreen *v15;
  __int16 v16;
  BSInvalidatable *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "object");
    v7 = (UIScreen *)objc_claimAutoreleasedReturnValue();
    if (v7 == self->_screen)
    {
      if (self->_screenDisconnectionPreventionAssertion)
      {
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          {
            screenDisconnectionPreventionAssertion = self->_screenDisconnectionPreventionAssertion;
            v14 = 138412546;
            v15 = v7;
            v16 = 2112;
            v17 = screenDisconnectionPreventionAssertion;
            _os_log_fault_impl(&dword_185066000, v12, OS_LOG_TYPE_FAULT, "Screen is disconnecting when we have an assertion that should prevent it from doing so: %@; screenDisconne"
              "ctionPreventionAssertion: %@",
              (uint8_t *)&v14,
              0x16u);
          }

        }
        else
        {
          v9 = _screenDisconnected____s_category;
          if (!_screenDisconnected____s_category)
          {
            v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v9, (unint64_t *)&_screenDisconnected____s_category);
          }
          v10 = *(NSObject **)(v9 + 8);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            v11 = self->_screenDisconnectionPreventionAssertion;
            v14 = 138412546;
            v15 = v7;
            v16 = 2112;
            v17 = v11;
            _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Screen is disconnecting when we have an assertion that should prevent it from doing so: %@; screenDisconne"
              "ctionPreventionAssertion: %@",
              (uint8_t *)&v14,
              0x16u);
          }
        }
      }
      -[BSInvalidatable invalidate](self->_screenDisconnectionPreventionAssertion, "invalidate");
      v8 = self->_screenDisconnectionPreventionAssertion;
      self->_screenDisconnectionPreventionAssertion = 0;

      self->_needsInvalidation = 1;
      -[_UIScreenBasedWindowScene _performInvalidationIfNeeded](self);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoInvalidationPreventionAssertions, 0);
  objc_storeStrong((id *)&self->_screenDisconnectionPreventionAssertion, 0);
  objc_storeStrong((id *)&self->_synthesizedSettings, 0);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_lookupKey, 0);
}

- (id)systemShellHostingEnvironment
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _UIScreenBasedWindowScene *v9;
  _UIScreenBasedWindowScene *v10;
  _UIScreenBasedWindowScene *v11;
  char v12;
  unint64_t v14;
  NSObject *v15;
  NSObject *v16;
  __int16 v17[8];
  uint8_t buf[16];

  -[UIScene _settingsScene](self, "_settingsScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[UIScene _hasSettingsScene](self, "_hasSettingsScene"))
  {
    -[_UIScreenBasedWindowScene _primaryViewServiceOperator](self, "_primaryViewServiceOperator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_sceneContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v4 = v6;
LABEL_16:

      goto LABEL_17;
    }
    if ((objc_msgSend((id)UIApp, "isFrontBoard") & 1) == 0)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v16, OS_LOG_TYPE_FAULT, "Unexpectedly falling back to the key window scene for the systemShellHostingEnvironment", buf, 2u);
        }

      }
      else
      {
        v14 = systemShellHostingEnvironment___s_category;
        if (!systemShellHostingEnvironment___s_category)
        {
          v14 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v14, (unint64_t *)&systemShellHostingEnvironment___s_category);
        }
        v15 = *(NSObject **)(v14 + 8);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v17[0] = 0;
          _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "Unexpectedly falling back to the key window scene for the systemShellHostingEnvironment", (uint8_t *)v17, 2u);
        }
      }
    }
    +[UIWindowScene _keyWindowScene]();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = self;
      v10 = v8;
      if (v10 == v9)
      {

      }
      else
      {
        v11 = v10;
        if (!v9)
        {

LABEL_14:
          -[_UIScreenBasedWindowScene systemShellHostingEnvironment](v11, "systemShellHostingEnvironment");
          v4 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        }
        v12 = -[_UIScreenBasedWindowScene isEqual:](v9, "isEqual:", v10);

        if ((v12 & 1) == 0)
          goto LABEL_14;
      }
    }
    v4 = 0;
LABEL_15:

    goto LABEL_16;
  }
  objc_msgSend(v3, "systemShellHostingEnvironment");
  v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v4;
}

- (id)renderingEnvironment
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _UIScreenBasedWindowScene *v9;
  _UIScreenBasedWindowScene *v10;
  _UIScreenBasedWindowScene *v11;
  char v12;
  unint64_t v14;
  NSObject *v15;
  NSObject *v16;
  __int16 v17[8];
  uint8_t buf[16];

  -[UIScene _settingsScene](self, "_settingsScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[UIScene _hasSettingsScene](self, "_hasSettingsScene"))
  {
    -[_UIScreenBasedWindowScene _primaryViewServiceOperator](self, "_primaryViewServiceOperator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_sceneContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v4 = v6;
LABEL_16:

      goto LABEL_17;
    }
    if ((objc_msgSend((id)UIApp, "isFrontBoard") & 1) == 0)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v16, OS_LOG_TYPE_FAULT, "Unexpectedly falling back to the key window scene for the systemShellHostingEnvironment", buf, 2u);
        }

      }
      else
      {
        v14 = renderingEnvironment___s_category;
        if (!renderingEnvironment___s_category)
        {
          v14 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v14, (unint64_t *)&renderingEnvironment___s_category);
        }
        v15 = *(NSObject **)(v14 + 8);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v17[0] = 0;
          _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "Unexpectedly falling back to the key window scene for the systemShellHostingEnvironment", (uint8_t *)v17, 2u);
        }
      }
    }
    +[UIWindowScene _keyWindowScene]();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = self;
      v10 = v8;
      if (v10 == v9)
      {

      }
      else
      {
        v11 = v10;
        if (!v9)
        {

LABEL_14:
          -[_UIScreenBasedWindowScene renderingEnvironment](v11, "renderingEnvironment");
          v4 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        }
        v12 = -[_UIScreenBasedWindowScene isEqual:](v9, "isEqual:", v10);

        if ((v12 & 1) == 0)
          goto LABEL_14;
      }
    }
    v4 = 0;
LABEL_15:

    goto LABEL_16;
  }
  objc_msgSend(v3, "renderingEnvironment");
  v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v4;
}

@end
