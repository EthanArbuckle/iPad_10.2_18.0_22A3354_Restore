@implementation _UISceneLifecycleMultiplexer

+ (int64_t)_compareLifecycleStateOfScene:(id)a3 toScene:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  id v10;
  unint64_t v11;
  id v13;
  unint64_t v14;

  v5 = a3;
  v6 = a4;
  if (!v6)
    goto LABEL_8;
  if (!v5 || (v7 = objc_msgSend(v5, "activationState"), v8 = objc_msgSend(v6, "activationState"), v7 > v8))
  {
    v9 = -1;
    goto LABEL_9;
  }
  if (v7 != v8)
  {
LABEL_8:
    v9 = 1;
    goto LABEL_9;
  }
  objc_msgSend(v5, "_effectiveSettings");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "underLock") & 1) != 0)
  {
    v11 = 1;
  }
  else if ((_UISceneLifecycleStateIsSEO(v10) & 1) != 0)
  {
    v11 = 2;
  }
  else if ((objc_msgSend(v10, "deactivationReasons") & 8) != 0)
  {
    v11 = 3;
  }
  else if (+[UIScene _activationStateFromSceneSettings:](UIScene, "_activationStateFromSceneSettings:", v10))
  {
    v11 = 0;
  }
  else
  {
    v11 = -1;
  }

  objc_msgSend(v6, "_effectiveSettings");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "underLock") & 1) != 0)
  {
    v14 = 1;
  }
  else if ((_UISceneLifecycleStateIsSEO(v13) & 1) != 0)
  {
    v14 = 2;
  }
  else if ((objc_msgSend(v13, "deactivationReasons") & 8) != 0)
  {
    v14 = 3;
  }
  else if (+[UIScene _activationStateFromSceneSettings:](UIScene, "_activationStateFromSceneSettings:", v13))
  {
    v14 = 0;
  }
  else
  {
    v14 = -1;
  }

  if (v11 < v14)
    v9 = -1;
  else
    v9 = 1;
LABEL_9:

  return v9;
}

+ (id)_mostActiveSceneIncludingInternal:(BOOL)a3 withTest:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD aBlock[4];
  id v31;

  v4 = a3;
  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75___UISceneLifecycleMultiplexer__mostActiveSceneIncludingInternal_withTest___block_invoke;
  aBlock[3] = &unk_1E16B7930;
  v8 = v6;
  v31 = v8;
  v9 = _Block_copy(aBlock);
  +[UIScene _scenesIncludingInternal:](UIScene, "_scenesIncludingInternal:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__24;
  v28 = __Block_byref_object_dispose__24;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = -1;
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __75___UISceneLifecycleMultiplexer__mostActiveSceneIncludingInternal_withTest___block_invoke_9;
  v15[3] = &unk_1E16B7958;
  v11 = v9;
  v16 = v11;
  v17 = &v24;
  v18 = &v20;
  v19 = a1;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v15);
  if (v21[3] == -1)
    v12 = 0;
  else
    v12 = (void *)v25[5];
  v13 = v12;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v13;
}

+ (id)sharedInstance
{
  if (qword_1ECD7CEB8 != -1)
    dispatch_once(&qword_1ECD7CEB8, &__block_literal_global_84);
  return (id)_MergedGlobals_977;
}

- (int64_t)applicationState
{
  UIScene **p_uiSceneOfRecord;
  id WeakRetained;
  int64_t v5;
  int64_t v6;
  id v8;
  id v9;
  uint64_t v10;

  p_uiSceneOfRecord = &self->_uiSceneOfRecord;
  WeakRetained = objc_loadWeakRetained((id *)&self->_uiSceneOfRecord);
  if (WeakRetained)
  {

  }
  else if ((objc_msgSend((id)UIApp, "isFrontBoard") & 1) != 0)
  {
    return 0;
  }
  if (self->_transitionalLifecycleState)
  {
    v6 = +[UIScene _activationStateFromSceneSettings:](UIScene, "_activationStateFromSceneSettings:");
    if (v6 != -1 && v6 != 2)
      return v6 || (*(_DWORD *)(UIApp + 176) & 0x3FFFF) != 0;
    return 2;
  }
  v8 = objc_loadWeakRetained((id *)p_uiSceneOfRecord);

  if (!v8)
    return 2;
  v9 = objc_loadWeakRetained((id *)p_uiSceneOfRecord);
  v10 = objc_msgSend(v9, "activationState");
  if (v10 == -1 || v10 == 2)
  {
    v5 = 2;
  }
  else if (v10)
  {
    v5 = 1;
  }
  else
  {
    v5 = (*(_DWORD *)(UIApp + 176) & 0x3FFFF) != 0;
  }

  return v5;
}

- (void)uiScene:(id)a3 transitionedFromState:(id)a4 withTransitionContext:(id)a5
{
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v19 = a3;
  v18 = a4;
  v8 = a5;
  objc_msgSend((id)objc_opt_class(), "_mostActiveSceneForApplicationState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_uiSceneOfRecord);
  objc_storeWeak((id *)&self->_uiSceneOfRecord, v9);
  objc_msgSend(v19, "_FBSScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8;
  objc_msgSend(v9, "_effectiveUISettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(WeakRetained, "isEqual:", v19);
  v15 = v18;
  if ((v14 & 1) == 0)
  {
    objc_msgSend(WeakRetained, "_effectiveUISettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = v11;
  v17 = v12;
  if (!self)
  {

    if ((v14 & 1) != 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  -[_UISceneLifecycleMultiplexer _evalTransitionToSettings:fromSettings:forceExit:withTransitionStore:](self, "_evalTransitionToSettings:fromSettings:forceExit:withTransitionStore:", v13, v15, 0, v16, v17);
  if ((v14 & 1) == 0)
LABEL_5:

LABEL_6:
}

+ (id)_mostActiveSceneForApplicationState
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "mostActiveScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_mostActiveSceneIncludingInternal:withTest:", 1, &__block_literal_global_12_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "_compareLifecycleStateOfScene:toScene:", v3, v4) == -1)
    v5 = v4;
  else
    v5 = v3;
  v6 = v5;
  v7 = _mostActiveSceneForApplicationState___s_category;
  if (!_mostActiveSceneForApplicationState___s_category)
  {
    v7 = __UILogCategoryGetNode("AppLifecycle", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v7, (unint64_t *)&_mostActiveSceneForApplicationState___s_category);
  }
  v8 = *(NSObject **)(v7 + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    objc_msgSend(v6, "_sceneIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_persistenceIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v10;
    v15 = 2114;
    v16 = v11;
    _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "sceneOfRecord: sceneID: %{public}@  persistentID: %{public}@", (uint8_t *)&v13, 0x16u);

  }
  return v6;
}

+ (UIScene)mostActiveScene
{
  return (UIScene *)objc_msgSend(a1, "mostActiveSceneWithTest:", 0);
}

- (void)_evalTransitionToSettings:(id)a3 fromSettings:(id)a4 forceExit:(BOOL)a5 withTransitionStore:(id)a6
{
  id var1;
  id var0;
  _BOOL4 v8;
  id v11;
  id v12;
  int64_t v13;
  unsigned int v14;
  char multiplexerFlags;
  unsigned int v16;
  id v17;
  void *v18;
  int v19;
  unsigned int v20;
  void *v21;
  char v22;
  id v23;
  id v24;
  id v25;
  id v26;
  UIApplicationSceneSettings *transitionalLifecycleState;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  id v32;
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  unsigned int v43;
  char v44;
  BOOL v45;
  char v46;

  var1 = a6.var1;
  var0 = a6.var0;
  v8 = a5;
  v11 = a3;
  v12 = a4;
  if ((_UISceneLifecycleStateIsEqual(v11, v12) & 1) != 0)
  {
    if (v8)
      objc_msgSend((id)UIApp, "_handleTaskCompletionAndTerminate:", var1);
  }
  else
  {
    objc_storeStrong((id *)&self->_transitionalLifecycleState, a4);
    v32 = var0;
    v33 = var1;
    v13 = +[UIScene _activationStateFromSceneSettings:](UIScene, "_activationStateFromSceneSettings:", v12);
    v31 = v8;
    v14 = _UISceneLifecycleCompositeActionMaskFromStateToState__staticStateMap[4 * v13
                                                                             + 5
                                                                             + +[UIScene _activationStateFromSceneSettings:](UIScene, "_activationStateFromSceneSettings:", v11)];
    _UISceneLifecycleCompositeActionMaskHighestLifecycleActionType(v14);
    multiplexerFlags = (char)self->_multiplexerFlags;
    v16 = multiplexerFlags & 2;
    *(_BYTE *)&self->_multiplexerFlags = multiplexerFlags | 2;
    v17 = var0;
    +[UIScene _sceneForFBSScene:](UIScene, "_sceneForFBSScene:", v17);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIScene _sceneForFBSScene:](UIWindowScene, "_sceneForFBSScene:", v17);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "uiSettings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "uiClientSettings");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (v16 == 0) & (v14 >> 5) | ((v14 & 4) >> 2);
    if (v19)
      -[_UISceneLifecycleMultiplexer _globalTestRelatedActivationActionsForFirstActivation:foreground:interfaceStyle:transitionContext:](self, "_globalTestRelatedActivationActionsForFirstActivation:foreground:interfaceStyle:transitionContext:", v16 == 0, objc_msgSend(v11, "isForeground"), objc_msgSend(v18, "userInterfaceStyle"), var1);
    v20 = v16 >> 1;
    v21 = var1;
    v22 = v20 ^ 1;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3254779904;
    v34[2] = __101___UISceneLifecycleMultiplexer__evalTransitionToSettings_fromSettings_forceExit_withTransitionStore___block_invoke;
    v34[3] = &unk_1E168B710;
    v43 = v14;
    v34[4] = self;
    v35 = v11;
    v36 = v17;
    v23 = v36;
    v41 = v23;
    v42 = v21;
    v24 = v18;
    v37 = v24;
    v25 = v30;
    v38 = v25;
    v39 = v12;
    v44 = v22;
    v45 = v31;
    v26 = v29;
    v40 = v26;
    v46 = v19;
    -[_UISceneLifecycleMultiplexer _performBlock:withApplicationOfDeactivationReasons:fromReasons:](self, "_performBlock:withApplicationOfDeactivationReasons:fromReasons:", v34, objc_msgSend(v35, "deactivationReasons"), objc_msgSend(v39, "deactivationReasons"));

    var0 = v32;
    var1 = v33;
  }
  transitionalLifecycleState = self->_transitionalLifecycleState;
  self->_transitionalLifecycleState = 0;

}

+ (id)mostActiveWindowSceneOnScreen:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62___UISceneLifecycleMultiplexer_mostActiveWindowSceneOnScreen___block_invoke;
  v8[3] = &unk_1E16B79A8;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "mostActiveSceneWithTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)mostActiveSceneWithTest:(id)a3
{
  return (id)objc_msgSend(a1, "_mostActiveSceneIncludingInternal:withTest:", 0, a3);
}

- (void)_globalTestRelatedActivationActionsForFirstActivation:(BOOL)a3 foreground:(BOOL)a4 interfaceStyle:(int64_t)a5 transitionContext:(id)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)UIApp;
  *(_QWORD *)(UIApp + 176) |= 0x200000000uLL;
  objc_msgSend(v8, "_configureLaunchOptions:", a6, a4, a5);
  objc_msgSend((id)UIApp, "_initiateLaunchActionsBackgrounded:firstActivation:", !v6, v7);
}

- (BOOL)suspendedEventsOnly
{
  UIScene **p_uiSceneOfRecord;
  id WeakRetained;
  UIApplicationSceneSettings *transitionalLifecycleState;
  id v7;
  char v8;

  p_uiSceneOfRecord = &self->_uiSceneOfRecord;
  WeakRetained = objc_loadWeakRetained((id *)&self->_uiSceneOfRecord);
  if (WeakRetained)
  {

  }
  else if ((objc_msgSend((id)UIApp, "isFrontBoard") & 1) != 0)
  {
    return 0;
  }
  transitionalLifecycleState = self->_transitionalLifecycleState;
  if (transitionalLifecycleState)
    return _UISceneLifecycleStateIsSEO(transitionalLifecycleState);
  v7 = objc_loadWeakRetained((id *)p_uiSceneOfRecord);
  v8 = objc_msgSend(v7, "_isSuspendedEventsOnly");

  return v8;
}

- (BOOL)suspendedUnderLock
{
  UIScene **p_uiSceneOfRecord;
  id WeakRetained;
  UIApplicationSceneSettings *transitionalLifecycleState;
  id v7;
  char v8;

  p_uiSceneOfRecord = &self->_uiSceneOfRecord;
  WeakRetained = objc_loadWeakRetained((id *)&self->_uiSceneOfRecord);
  if (WeakRetained)
  {

  }
  else if ((objc_msgSend((id)UIApp, "isFrontBoard") & 1) != 0)
  {
    return 0;
  }
  transitionalLifecycleState = self->_transitionalLifecycleState;
  if (transitionalLifecycleState)
    return -[UIApplicationSceneSettings underLock](transitionalLifecycleState, "underLock");
  v7 = objc_loadWeakRetained((id *)p_uiSceneOfRecord);
  v8 = objc_msgSend(v7, "_isSuspendedUnderLock");

  return v8;
}

- (BOOL)isActive
{
  UIScene **p_uiSceneOfRecord;
  id WeakRetained;
  UIApplicationSceneSettings *transitionalLifecycleState;
  id v7;
  char v8;

  p_uiSceneOfRecord = &self->_uiSceneOfRecord;
  WeakRetained = objc_loadWeakRetained((id *)&self->_uiSceneOfRecord);
  if (WeakRetained)
  {

  }
  else if ((objc_msgSend((id)UIApp, "isFrontBoard") & 1) != 0)
  {
    return 1;
  }
  transitionalLifecycleState = self->_transitionalLifecycleState;
  if (transitionalLifecycleState)
    return _UISceneLifecycleStateIsForegroundActive(transitionalLifecycleState);
  v7 = objc_loadWeakRetained((id *)p_uiSceneOfRecord);
  v8 = objc_msgSend(v7, "_isActive");

  return v8;
}

- (void)completeApplicationLaunchWithFBSScene:(id)a3 transitionContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if ((*(_BYTE *)&self->_multiplexerFlags & 1) == 0)
  {
    entr_act_end();
    _requestHardwareEventsIfNeeded();
    objc_msgSend((id)UIApp, "_deactivateForReason:", 11);
    v7 = (void *)UIApp;
    if (v6)
    {
      objc_msgSend((id)UIApp, "_runWithMainScene:transitionContext:completion:", v9, v6, 0);
    }
    else
    {
      +[FBSSceneTransitionContext transitionContext](UIApplicationSceneTransitionContext, "transitionContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_runWithMainScene:transitionContext:completion:", v9, v8, 0);

    }
  }

}

- (void)noteApplicationLaunchCompleted
{
  *(_BYTE *)&self->_multiplexerFlags |= 1u;
}

- (id)initForAppSingleton:(id)a3
{
  _UISceneLifecycleMultiplexer *v3;
  _UISceneLifecycleMultiplexer *v4;
  UIApplicationSceneSettings *transitionalLifecycleState;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UISceneLifecycleMultiplexer;
  v3 = -[_UISceneLifecycleMultiplexer init](&v7, sel_init, a3);
  v4 = v3;
  if (v3)
  {
    objc_storeWeak((id *)&v3->_uiSceneOfRecord, 0);
    transitionalLifecycleState = v4->_transitionalLifecycleState;
    v4->_transitionalLifecycleState = 0;

    *(_BYTE *)&v4->_multiplexerFlags &= ~2u;
  }
  return v4;
}

+ (void)configureInitialDeactivationReasons:(unint64_t)a3
{
  void *v4;
  char v5;
  unint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "activatedOnce");

  if (a3 && (v5 & 1) == 0)
  {
    v6 = 0;
    do
    {
      v7 = (1 << v6);
      if ((a3 & v7) != 0)
      {
        if (v6 <= 0x12 && ((0x43FFFu >> v6) & 1) != 0)
          objc_msgSend((id)UIApp, "_deactivateForReason:", dword_186679730[v6]);
        a3 &= ~v7;
      }
      if (v6 > 0x11)
        break;
      ++v6;
    }
    while (a3);
  }
}

- (BOOL)activatedOnce
{
  return (*(_BYTE *)&self->_multiplexerFlags >> 1) & 1;
}

- (BOOL)lifecycleWantsUnnecessaryDelayForSceneDelivery
{
  if (lifecycleWantsUnnecessaryDelayForSceneDelivery_onceToken != -1)
    dispatch_once(&lifecycleWantsUnnecessaryDelayForSceneDelivery_onceToken, &__block_literal_global_1_2);
  return lifecycleWantsUnnecessaryDelayForSceneDelivery__lifecycleWantsUnnecessaryDelayForSceneDelivery;
}

- (void)_performBlock:(id)a3 withApplicationOfDeactivationReasons:(unint64_t)a4 fromReasons:(unint64_t)a5
{
  int v7;
  char v8;
  void (**v9)(_QWORD);
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void (**v16)(_QWORD);

  v16 = (void (**)(_QWORD))a3;
  v7 = objc_msgSend((id)UIApp, "_isSpringBoardShowingAnAlert");
  v8 = v7;
  if (v7)
    objc_msgSend((id)UIApp, "_deactivateForReason:", 13);
  v9 = v16;
  if (!v16 || a5 == a4)
  {
    if (v16)
    {
      v16[2](v16);
      v9 = v16;
    }
  }
  else
  {
    v10 = a4 & ~a5;
    if (v10)
    {
      v11 = 0;
      do
      {
        v12 = (1 << v11);
        if ((v10 & v12) != 0)
        {
          if (v11 <= 0x12 && ((0x43FFFu >> v11) & 1) != 0)
          {
            objc_msgSend((id)UIApp, "_deactivateForReason:", dword_186679730[v11]);
            v9 = v16;
          }
          v10 &= ~v12;
        }
        if (v11 > 0x11)
          break;
        ++v11;
      }
      while (v10);
    }
    v9[2](v16);
    v9 = v16;
    v13 = a5 & ~a4;
    if (v13)
    {
      v14 = 0;
      do
      {
        v15 = (1 << v14);
        if ((v13 & v15) != 0)
        {
          if (v14 <= 0x12 && ((0x43FFFu >> v14) & 1) != 0)
          {
            objc_msgSend((id)UIApp, "_stopDeactivatingForReason:", dword_186679730[v14]);
            v9 = v16;
          }
          v13 &= ~v15;
        }
        if (v14 > 0x11)
          break;
        ++v14;
      }
      while (v13);
    }
  }
  if ((v8 & 1) == 0)
  {
    objc_msgSend((id)UIApp, "_stopDeactivatingForReason:", 13);
    v9 = v16;
  }

}

- (void)_scheduleFirstCommit
{
  void (**v2)(void);

  objc_msgSend((id)UIApp, "_firstCommitBlock");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();

}

- (BOOL)runningInTaskSwitcher
{
  UIScene **p_uiSceneOfRecord;
  id WeakRetained;
  _BOOL8 v5;
  UIApplicationSceneSettings *transitionalLifecycleState;
  id v7;
  char v8;

  p_uiSceneOfRecord = &self->_uiSceneOfRecord;
  WeakRetained = objc_loadWeakRetained((id *)&self->_uiSceneOfRecord);
  if (WeakRetained)
  {

  }
  else if ((objc_msgSend((id)UIApp, "isFrontBoard") & 1) != 0)
  {
    LOBYTE(v5) = 0;
    return v5;
  }
  transitionalLifecycleState = self->_transitionalLifecycleState;
  if (transitionalLifecycleState)
  {
    return (-[UIApplicationSceneSettings deactivationReasons](transitionalLifecycleState, "deactivationReasons") >> 3) & 1;
  }
  else
  {
    v7 = objc_loadWeakRetained((id *)p_uiSceneOfRecord);
    v8 = objc_msgSend(v7, "_isRunningInTaskSwitcher");

    LOBYTE(v5) = v8;
  }
  return v5;
}

- (BOOL)isTrackingScene:(id)a3
{
  UIScene **p_uiSceneOfRecord;
  id v4;
  id WeakRetained;

  p_uiSceneOfRecord = &self->_uiSceneOfRecord;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_uiSceneOfRecord);

  return WeakRetained == v4;
}

- (void)forceExitWithTransitionContext:(id)a3 scene:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "uiSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v9, "setForeground:", 0);
  v10 = v7;
  v11 = v6;
  v12 = (void *)objc_msgSend(v9, "copy");
  v13 = v10;
  v14 = v11;
  v15 = v14;
  if (self)
  {
    -[_UISceneLifecycleMultiplexer _evalTransitionToSettings:fromSettings:forceExit:withTransitionStore:](self, "_evalTransitionToSettings:fromSettings:forceExit:withTransitionStore:", v12, v8, 1, v13, v14);
  }
  else
  {

  }
}

- (void)collectBackingStores
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
  +[_UISceneLifecycleMultiplexer sharedInstance](_UISceneLifecycleMultiplexer, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "applicationState");

  if (v3 == 2)
  {
    objc_msgSend((id)UIApp, "_beginBackgroundTaskWithName:expirationHandler:", CFSTR("com.apple.UIKit.CABackingStoreCollect"), 0);
    CABackingStoreCollectWithCompletionHandler();
  }
  else
  {
    CACurrentMediaTime();
    CABackingStoreCollect();
  }
}

- (BOOL)_prepareForClientSuspensionWithScene:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t v22;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend((id)UIApp, "defaultImageSnapshotExpiration");
  v7 = v6;
  v8 = objc_opt_respondsToSelector();
  v9 = (void *)UIApp;
  if ((v8 & 1) != 0)
  {
    LOBYTE(v10) = objc_msgSend((id)UIApp, "applicationSuspendWithSettings:", v5);
    if ((*(_BYTE *)(UIApp + 184) & 8) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "synchronize");

    }
    objc_msgSend(v5, "valueForKey:", CFSTR("UISuspendedDefaultPNGKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");

    if (v13)
      v14 = v13;

  }
  else
  {
    *(_QWORD *)(UIApp + 176) &= ~0x400000000uLL;
    objc_msgSend(v9, "applicationSuspend");
    v13 = 0;
    v10 = (*(unsigned __int8 *)(UIApp + 180) >> 2) & 1;
  }
  +[UIScene _sceneForFBSScene:](UIScene, "_sceneForFBSScene:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __69___UISceneLifecycleMultiplexer__prepareForClientSuspensionWithScene___block_invoke;
  v19[3] = &unk_1E16B7980;
  v20 = v5;
  v21 = v13;
  v22 = v7;
  v16 = v13;
  v17 = v5;
  objc_msgSend(v15, "_updateUIClientSettingsWithBlock:", v19);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionalLifecycleState, 0);
  objc_destroyWeak((id *)&self->_uiSceneOfRecord);
}

@end
