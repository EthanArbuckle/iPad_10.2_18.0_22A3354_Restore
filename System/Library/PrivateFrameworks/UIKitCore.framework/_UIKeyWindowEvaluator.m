@implementation _UIKeyWindowEvaluator

+ (id)sharedEvaluator
{
  if (_MergedGlobals_1208 != -1)
    dispatch_once(&_MergedGlobals_1208, &__block_literal_global_473);
  return (id)qword_1ECD801E0;
}

- (id)applicationKeyWindow
{
  if (a1)
    a1 = (id *)a1[25];
  return a1;
}

- (void)windowSceneDidConnect:(uint64_t)a1
{
  id v3;
  id v4;

  if (a1)
  {
    v3 = a2;
    objc_msgSend(v3, "_FBSScene");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIKeyWindowEvaluator _updateDefaultEvaluationStrategyForIdiomIfNeededWithRequest:](a1, v3, v4 != 0);

  }
}

- (uint64_t)windowScene:(uint64_t)a3 willTransitionToActivationState:
{
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v8;
  BOOL v9;
  char v10;
  _QWORD v11[8];
  BOOL v12;
  char v13;
  BOOL v14;

  if (result)
  {
    v5 = result;
    result = objc_msgSend(a2, "_hasInvalidated");
    if ((result & 1) == 0)
    {
      result = objc_msgSend(a2, "activationState");
      v6 = result;
      v8 = a3 == 2 && result != 2;
      if (result)
        v9 = a3 == 0;
      else
        v9 = 0;
      if (v9 || v8)
      {
        v10 = objc_msgSend((id)UIApp, "_isActivated");
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __69___UIKeyWindowEvaluator_windowScene_willTransitionToActivationState___block_invoke;
        v11[3] = &unk_1E16DFFA0;
        v11[6] = v6;
        v11[7] = a3;
        v11[4] = v5;
        v11[5] = a2;
        v12 = a3 == 0;
        v13 = v10;
        v14 = a3 == 2;
        return objc_msgSend(a2, "_enqueuePostSettingsUpdateResponseBlock:inPhase:", v11, 0x1E16F0C60);
      }
    }
  }
  return result;
}

- (void)_evaluateApplicationKeyWindowWithComparisonWindowScene:(uint64_t)a3 changingKeyWindowSceneActions:(uint64_t)a4 sceneKeyWindowActions:(int)a5 ignoringOldKeyWindow:(uint64_t)a6 sceneResignKeyWindowActions:(uint64_t)a7 andSceneBecomeKeyWindowActions:(uint64_t)a8 forReason:(void *)a9
{
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  id *v19;
  uint64_t v20;
  char *v21;
  _BOOL4 v22;
  _BOOL4 v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  NSObject *v28;
  char *v29;
  char *v30;
  void *v31;
  void *v32;
  objc_class *v33;
  const char *Name;
  const char *v35;
  unint64_t v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  int v40;
  objc_class *v41;
  const char *v42;
  void *v43;
  const char *v44;
  unint64_t v45;
  NSObject *v46;
  int v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  _BOOL4 v52;
  char v53;
  _BOOL4 v54;
  id *v56;
  char *v58;
  const __CFString *v59;
  void *v60;
  uint8_t buf[4];
  _BYTE v62[24];
  __int16 v63;
  const char *v64;
  __int16 v65;
  char *v66;
  __int16 v67;
  uint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  if (!a2 || (objc_msgSend(a2, "_hasInvalidated") & 1) == 0)
  {
    v15 = objc_msgSend(a9, "UTF8String");
    v16 = qword_1ECD801E8;
    if (!qword_1ECD801E8)
    {
      v16 = __UILogCategoryGetNode("KeyWindow", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v16, (unint64_t *)&qword_1ECD801E8);
    }
    if ((*(_BYTE *)v16 & 1) != 0)
    {
      v50 = *(NSObject **)(v16 + 8);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)v62 = v15;
        _os_log_impl(&dword_185066000, v50, OS_LOG_TYPE_ERROR, "Evaluating application key window for reason: %{public}s", buf, 0xCu);
      }
    }
    if ((a3 != 0) == (a4 != 0))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", sel__evaluateApplicationKeyWindowWithComparisonWindowScene_changingKeyWindowSceneActions_sceneKeyWindowActions_ignoringOldKeyWindow_sceneResignKeyWindowActions_andSceneBecomeKeyWindowActions_forReason_, a1, CFSTR("_UIKeyWindowEvaluator.m"), 496, CFSTR("Invalid actions specified"), a1, "-[_UIKeyWindowEvaluator _evaluateApplicationKeyWindowWithComparisonWindowScene:changingKeyWindowSceneActions:sceneKeyWindowActions:ignoringOldKeyWindow:sceneResignKeyWindowActions:andSceneBecomeKeyWindowActions:forReason:]");

    }
    v17 = a6;
    v18 = (char *)*(id *)(a1 + 200);
    objc_msgSend(*(id *)(a1 + 200), "windowScene");
    v56 = (id *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyWindowSceneStack keyWindowSceneInStack](*(id **)(a1 + 184));
    v19 = (id *)objc_claimAutoreleasedReturnValue();
    -[UIWindowScene _keyWindow](v19);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (char *)v20;
    v22 = v20 != 0;
    if (v20)
      v23 = a2 != 0;
    else
      v23 = 0;
    v24 = v19 == a2 && v23;
    v58 = v18;
    if ((char *)v20 == v18)
      v22 = 0;
    v54 = v22;
    v25 = v17;
    v26 = a4;
    if (a3 && v19 && v19 != v56 && v20)
      (*(void (**)(uint64_t, id *))(a3 + 16))(a3, v19);
    v27 = qword_1ECD801F0;
    if (!qword_1ECD801F0)
    {
      v27 = __UILogCategoryGetNode("KeyWindow", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v27, (unint64_t *)&qword_1ECD801F0);
    }
    v28 = *(NSObject **)(v27 + 8);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67241474;
      *(_DWORD *)v62 = v21 != v58;
      *(_WORD *)&v62[4] = 2050;
      *(_QWORD *)&v62[6] = v56;
      *(_WORD *)&v62[14] = 2050;
      *(_QWORD *)&v62[16] = v19;
      v63 = 2050;
      v64 = v58;
      v65 = 2050;
      v66 = v21;
      v67 = 2082;
      v68 = v15;
      _os_log_impl(&dword_185066000, v28, OS_LOG_TYPE_DEFAULT, "Key window needs update: %{public}d; currentKeyWindowScene: %{public}p; evaluatedKeyWindowScene: %{public}p; cur"
        "rentApplicationKeyWindow: %{public}p; evaluatedApplicationKeyWindow: %{public}p; reason: %{public}s",
        buf,
        0x3Au);
    }
    if (v21 == v58)
    {
      if (a4)
        (*(void (**)(uint64_t, _QWORD))(a4 + 16))(a4, 0);
      if (v25 && (a5 & 1) == 0)
        (*(void (**)(uint64_t))(v25 + 16))(v25);
      if (a7)
        (*(void (**)(void))(a7 + 16))();
      goto LABEL_67;
    }
    v52 = v24;
    if (a5)
      v29 = 0;
    else
      v29 = v58;
    v30 = v29;
    v53 = _UIWindowKeyWindowAPIIsSceneLevel();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v54)
    {
      objc_msgSend(v31, "postNotificationName:object:", CFSTR("_UIWindowWillBecomeApplicationKeyNotification"), v21);
      if ((v53 & 1) == 0)
        objc_msgSend(v32, "postNotificationName:object:", CFSTR("_UIWindowWillBecomeKeyNotification"), v21);
      *(_QWORD *)(a1 + 200) = v21;
    }
    else
    {
      *(_QWORD *)(a1 + 200) = v21;
      if (!v21)
      {
        Name = "(nil)";
        goto LABEL_42;
      }
    }
    v33 = (objc_class *)objc_opt_class();
    Name = class_getName(v33);
LABEL_42:
    v35 = _UIKeyWindowUTF8SceneIdentityStringForWindowScene(v19);
    v36 = qword_1ECD801F8;
    if (!qword_1ECD801F8)
    {
      v36 = __UILogCategoryGetNode("KeyWindow", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v36, (unint64_t *)&qword_1ECD801F8);
    }
    v37 = v25;
    v38 = v32;
    v39 = *(id *)(v36 + 8);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = objc_msgSend(v21, "_contextId");
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)v62 = Name;
      *(_WORD *)&v62[8] = 2050;
      *(_QWORD *)&v62[10] = v21;
      *(_WORD *)&v62[18] = 1026;
      *(_DWORD *)&v62[20] = v40;
      v63 = 2082;
      v64 = v35;
      _os_log_impl(&dword_185066000, v39, OS_LOG_TYPE_DEFAULT, "Window did become application key: %{public}s: %{public}p; contextId: 0x%{public}X; scene identity: %{public}s",
        buf,
        0x26u);
    }

    if (v26)
      (*(void (**)(uint64_t, _BOOL4))(v26 + 16))(v26, v52);
    if (v37 && (a5 & 1) == 0)
      (*(void (**)(uint64_t))(v37 + 16))(v37);
    if ((a5 & 1) == 0 && v30)
    {
      v41 = (objc_class *)objc_opt_class();
      v42 = class_getName(v41);
      objc_msgSend(v30, "windowScene");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = _UIKeyWindowUTF8SceneIdentityStringForWindowScene(v43);

      v45 = qword_1ECD80200;
      if (!qword_1ECD80200)
      {
        v45 = __UILogCategoryGetNode("KeyWindow", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v45, (unint64_t *)&qword_1ECD80200);
      }
      v46 = *(id *)(v45 + 8);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v47 = objc_msgSend(v30, "_contextId");
        *(_DWORD *)buf = 136446978;
        *(_QWORD *)v62 = v42;
        *(_WORD *)&v62[8] = 2050;
        *(_QWORD *)&v62[10] = v30;
        *(_WORD *)&v62[18] = 1026;
        *(_DWORD *)&v62[20] = v47;
        v63 = 2082;
        v64 = v44;
        _os_log_impl(&dword_185066000, v46, OS_LOG_TYPE_DEFAULT, "Window resigning application key: %{public}s: %{public}p; contextId: 0x%{public}X; scene identity: %{public}s",
          buf,
          0x26u);
      }

      objc_msgSend(v38, "postNotificationName:object:", CFSTR("_UIWindowDidResignApplicationKeyNotification"), v30);
      if ((v53 & 1) == 0)
      {
        objc_msgSend(v30, "resignKeyWindow");
        objc_msgSend(v38, "postNotificationName:object:", CFSTR("UIWindowDidResignKeyNotification"), v30);
      }
      -[UIWindow _resignApplicationKeyWindowStatus](v30);
    }
    if (a7)
      (*(void (**)(void))(a7 + 16))();
    if (v54)
    {
      v59 = CFSTR("Reason");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a10);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v48;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v38, "postNotificationName:object:userInfo:", CFSTR("_UIWindowDidBecomeApplicationKeyNotification"), v21, v49);
      if ((v53 & 1) == 0)
      {
        objc_msgSend(v21, "becomeKeyWindow");
        objc_msgSend(v38, "postNotificationName:object:", CFSTR("UIWindowDidBecomeKeyNotification"), v21);
      }
      -[UIWindow _didBecomeApplicationKeyWindowWithOldApplicationKeyWindow:](v21, v30);

    }
LABEL_67:

  }
}

- (void)windowSceneDidBecomeTargetOfKeyboardEventDeferringEnvironment:(char *)a1
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;

  if (a1 && (objc_msgSend(a2, "_hasInvalidated") & 1) == 0)
  {
    v4 = a2;
    -[_UIKeyWindowEvaluator _updateDefaultEvaluationStrategyForIdiomIfNeededWithRequest:]((uint64_t)a1, v4, 0);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p: Window scene became target of keyboard environment"), objc_opt_class(), v4);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIKeyWindowEvaluator _stackForWindowScene:](a1, v4);
    v5 = objc_claimAutoreleasedReturnValue();
    -[_UIKeyWindowSceneStack keyWindowSceneInStack]((id *)v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyWindowSceneStack pushWindowScene:withEvaluationStrategy:forReason:](v5, v4, 1, v11);
    -[_UIKeyWindowSceneStack keyWindowSceneInStack]((id *)v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v5 && (*(_BYTE *)(v5 + 32) & 1) != 0 && (void *)v7 != v6)
    {
      v9 = v11;
      -[_UIKeyWindowEvaluator _evaluateApplicationKeyWindowWithComparisonWindowScene:changingKeyWindowSceneActions:sceneKeyWindowActions:ignoringOldKeyWindow:sceneResignKeyWindowActions:andSceneBecomeKeyWindowActions:forReason:]((uint64_t)a1, (id *)v4, (uint64_t)&__block_literal_global_85_0, 0, 0, 0, 0, v10, v9, 1);
    }

  }
}

- (void)evaluateApplicationKeyWindowForWindowScene:(int)a3 withWindowMadeKey:(uint64_t)a4 sceneKeyWindowActions:(int)a5 ignoringOldKeyWindow:(uint64_t)a6 sceneResignKeyWindowActions:(uint64_t)a7 andSceneBecomeKeyWindowActions:(uint64_t)a8 forReason:(void *)a9
{
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;

  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", sel_evaluateApplicationKeyWindowForWindowScene_withWindowMadeKey_sceneKeyWindowActions_ignoringOldKeyWindow_sceneResignKeyWindowActions_andSceneBecomeKeyWindowActions_forReason_, a1, CFSTR("_UIKeyWindowEvaluator.m"), 625, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("windowScene"));

    }
    if ((objc_msgSend(a2, "_hasInvalidated") & 1) == 0)
    {
      v17 = _UIKeyWindowSceneObserverForScene(a2);
      v18 = a2;
      -[_UIKeyWindowEvaluator _updateDefaultEvaluationStrategyForIdiomIfNeededWithRequest:]((uint64_t)a1, v18, 0);
      v19 = -[_UIKeyWindowEvaluator _evaluationStrategyForScene:]((uint64_t)a1, v18);
      -[UIWindowScene _keyWindow]((id *)v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19 && a3 && v20)
      {
        -[_UIKeyWindowEvaluator _stackForWindowScene:](a1, v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIKeyWindowSceneStack pushWindowScene:withEvaluationStrategy:forReason:]((uint64_t)v21, v18, 0, a9);

      }
      v22 = a9;
      -[_UIKeyWindowEvaluator _evaluateApplicationKeyWindowWithComparisonWindowScene:changingKeyWindowSceneActions:sceneKeyWindowActions:ignoringOldKeyWindow:sceneResignKeyWindowActions:andSceneBecomeKeyWindowActions:forReason:]((uint64_t)a1, (id *)v18, 0, a4, a5, a6, a7, v23, a9, a10);
    }
  }

}

- (uint64_t)_evaluationStrategyForScene:(uint64_t)a1
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = a1;
  if (a1)
  {
    objc_msgSend(a2, "_screen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_userInterfaceIdiom");

    v2 = -[_UIKeyWindowEvaluator _defaultEvaluationStrategyForIdiom:](v2, v5);
    if (_UIApplicationMayVendViews())
    {
      objc_msgSend(a2, "_FBSScene");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        return 0;
    }
  }
  return v2;
}

- (void)_updateDefaultEvaluationStrategyForIdiomIfNeededWithRequest:(unsigned __int16)a3
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  _BOOL4 v18;
  void (**v19)(void *, _QWORD);
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD aBlock[7];

  if (!a1)
    goto LABEL_35;
  v6 = a2;
  objc_msgSend(v6, "_screen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_userInterfaceIdiom");

  v9 = a3 & 0xFF00;
  if ((_BYTE)a3 && (a3 & 0xFF00) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", sel__updateDefaultEvaluationStrategyForIdiomIfNeededWithRequest_, a1, CFSTR("_UIKeyWindowEvaluator.m"), 262, CFSTR("Invalid request. The scene cannot be connecting and invalidating: %@"), v6);

    goto LABEL_5;
  }
  if ((_BYTE)a3)
  {
LABEL_5:
    if ((unint64_t)(v8 - 11) <= 0xFFFFFFFFFFFFFFF3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", sel__incrementFBSSceneBackedSceneCountForIdiom_, a1, CFSTR("_UIKeyWindowEvaluator.m"), 234, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(idiom >= UIUserInterfaceIdiomFirst) && (idiom <= UIUserInterfaceIdiomLast)"));

    }
    ++*(_QWORD *)(a1 + 8 * v8 + 16);
  }
  v10 = v8 - 11;
  if (v9)
  {
    if (v10 <= 0xFFFFFFFFFFFFFFF3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", sel__decrementFBSSceneBackedSceneCountForIdiom_, a1, CFSTR("_UIKeyWindowEvaluator.m"), 239, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(idiom >= UIUserInterfaceIdiomFirst) && (idiom <= UIUserInterfaceIdiomLast)"));

    }
    --*(_QWORD *)(a1 + 8 * v8 + 16);
  }
  if (v10 <= 0xFFFFFFFFFFFFFFF3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", sel__countOfFBSSceneBackedScenesForIdiom_, a1, CFSTR("_UIKeyWindowEvaluator.m"), 229, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(idiom >= UIUserInterfaceIdiomFirst) && (idiom <= UIUserInterfaceIdiomLast)"));

  }
  v11 = *(_QWORD *)(a1 + 8 * v8 + 16);
  v12 = objc_msgSend(v6, "_isTargetOfKeyboardEventDeferringEnvironment");
  if (v11)
    v13 = v12;
  else
    v13 = 0;
  v14 = -[_UIKeyWindowEvaluator _defaultEvaluationStrategyForIdiom:](a1, v8);
  if (v14 == -1)
    -[_UIKeyWindowEvaluator _setDefaultEvaluationStrategy:forIdiom:](a1, v13, v8);
  if (!_UIApplicationMayVendViews()
    || (objc_msgSend(v6, "_FBSScene"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = v15 == 0,
        v15,
        !v16))
  {
    if (v14 != v13)
    {
      if (v14)
        v13 = 0;
      else
        v13 = v13;
      v18 = v14 == 1 && v11 == 0;
      if ((v13 & 1) != 0 || v18)
      {
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __85___UIKeyWindowEvaluator__updateDefaultEvaluationStrategyForIdiomIfNeededWithRequest___block_invoke;
        aBlock[3] = &__block_descriptor_56_e32_v16__0___UIKeyWindowSceneStack_8l;
        aBlock[4] = v13 ^ 1;
        aBlock[5] = v13;
        aBlock[6] = v8;
        v19 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
        v19[2](v19, *(_QWORD *)(a1 + 184));
        v19[2](v19, *(_QWORD *)(a1 + 192));
        -[_UIKeyWindowEvaluator _setDefaultEvaluationStrategy:forIdiom:](a1, v13, v8);

      }
    }
  }

LABEL_35:
}

- (uint64_t)_defaultEvaluationStrategyForIdiom:(uint64_t)a1
{
  void *v5;

  if ((unint64_t)(a2 - 11) <= 0xFFFFFFFFFFFFFFF3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", sel__defaultEvaluationStrategyForIdiom_, a1, CFSTR("_UIKeyWindowEvaluator.m"), 244, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(idiom >= UIUserInterfaceIdiomFirst) && (idiom <= UIUserInterfaceIdiomLast)"));

  }
  return *(_QWORD *)(a1 + 8 * a2 + 104);
}

- (void)_setDefaultEvaluationStrategy:(uint64_t)a3 forIdiom:
{
  id v6;
  uint64_t v7;
  const __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a3 - 11) <= 0xFFFFFFFFFFFFFFF3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel__setDefaultEvaluationStrategy_forIdiom_, a1, CFSTR("_UIKeyWindowEvaluator.m"), 249, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(idiom >= UIUserInterfaceIdiomFirst) && (idiom <= UIUserInterfaceIdiomLast)"));

  }
  *(_QWORD *)(a1 + 8 * a3 + 104) = a2;
  _NSStringFromUIUserInterfaceIdiom(a3);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend(v6, "UTF8String");

  v8 = &stru_1E16EDF20;
  if (a2 == 1)
    v8 = CFSTR("SystemShellManaged");
  if (a2)
    v9 = (__CFString *)v8;
  else
    v9 = CFSTR("LastOneWins");
  v10 = -[__CFString UTF8String](v9, "UTF8String");
  v11 = _setDefaultEvaluationStrategy_forIdiom____s_category;
  if (!_setDefaultEvaluationStrategy_forIdiom____s_category)
  {
    v11 = __UILogCategoryGetNode("KeyWindow", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v11, (unint64_t *)&_setDefaultEvaluationStrategy_forIdiom____s_category);
  }
  v12 = *(NSObject **)(v11 + 8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v15 = v7;
    v16 = 2082;
    v17 = v10;
    _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_DEFAULT, "Setting default evaluation strategy for %{public}s to %{public}s", buf, 0x16u);
  }
}

- (char)_stackForWindowScene:(char *)a1
{
  char *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void **v11;
  void *v12;
  _UIKeyWindowSceneStack *v13;
  __CFString *v14;
  char v15;
  void *v16;
  id *v17;
  void *v18;

  if (a1)
  {
    v3 = a1;
    objc_msgSend(a2, "_screen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_userInterfaceIdiom");

    objc_msgSend(a2, "session");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "role");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v7;
      v9 = objc_msgSend(v7, "isEqualToString:", CFSTR("UIWindowSceneSessionRoleExternalDisplayNonInteractive"));

      if (v5 != 3 && (v9 & 1) == 0)
      {
        v12 = (void *)*((_QWORD *)v3 + 23);
        v11 = (void **)(v3 + 184);
        v10 = v12;
        if (!v12)
        {
          v13 = [_UIKeyWindowSceneStack alloc];
          v14 = CFSTR("KeyWindow");
          v15 = 1;
LABEL_10:
          v17 = -[_UIKeyWindowSceneStack _initWithName:affectsApplicationKeyWindow:](v13, v14, v15);
          v18 = *v11;
          *v11 = v17;

          v10 = *v11;
          goto LABEL_11;
        }
        goto LABEL_11;
      }
    }
    else
    {

    }
    v16 = (void *)*((_QWORD *)v3 + 24);
    v11 = (void **)(v3 + 192);
    v10 = v16;
    if (!v16)
    {
      v13 = [_UIKeyWindowSceneStack alloc];
      v14 = CFSTR("Excluded");
      v15 = 0;
      goto LABEL_10;
    }
LABEL_11:
    a1 = v10;
  }
  return a1;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v5;
  _UIKeyWindowSceneStack *keyWindowSceneStack;
  uint64_t v7;
  id v8;
  _UIKeyWindowSceneStack *excludedSceneStack;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  _UIKeyWindowEvaluator *v18;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveMultilinePrefix:", a3);
  keyWindowSceneStack = self->_keyWindowSceneStack;
  if (keyWindowSceneStack)
    v7 = -[NSMapTable count](keyWindowSceneStack->_recordsByWindowScene, "count");
  else
    v7 = 0;
  v8 = (id)objc_msgSend(v5, "appendUnsignedInteger:withName:", v7, CFSTR("keyWindowSceneStack.count"));
  excludedSceneStack = self->_excludedSceneStack;
  if (excludedSceneStack)
    v10 = -[NSMapTable count](excludedSceneStack->_recordsByWindowScene, "count");
  else
    v10 = 0;
  v11 = (id)objc_msgSend(v5, "appendUnsignedInteger:withName:", v10, CFSTR("excludedSceneStack.count"));
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63___UIKeyWindowEvaluator_descriptionBuilderWithMultilinePrefix___block_invoke;
  v16[3] = &unk_1E16B1B50;
  v12 = v5;
  v17 = v12;
  v18 = self;
  v13 = (id)objc_msgSend(v12, "modifyBody:", v16);
  v14 = v12;

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_stateCaptureToken, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_UIKeyWindowEvaluator;
  -[_UIKeyWindowEvaluator dealloc](&v3, sel_dealloc);
}

- (NSString)debugDescription
{
  return (NSString *)-[_UIKeyWindowEvaluator debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_UIKeyWindowEvaluator succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  objc_class *v4;
  const char *Name;
  UIWindow *applicationKeyWindow;
  void *v7;
  id v8;
  _UIKeyWindowSceneStack *keyWindowSceneStack;
  uint64_t v10;
  id v11;
  _UIKeyWindowSceneStack *excludedSceneStack;
  uint64_t v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_applicationKeyWindow)
  {
    v4 = (objc_class *)objc_opt_class();
    Name = class_getName(v4);
    applicationKeyWindow = self->_applicationKeyWindow;
  }
  else
  {
    applicationKeyWindow = 0;
    Name = "(nil)";
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%s: %p>"), Name, applicationKeyWindow);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", v7, CFSTR("applicationKeyWindow"));
  keyWindowSceneStack = self->_keyWindowSceneStack;
  if (keyWindowSceneStack)
    v10 = -[NSMapTable count](keyWindowSceneStack->_recordsByWindowScene, "count");
  else
    v10 = 0;
  v11 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", v10, CFSTR("keyWindowSceneStack.count"));
  excludedSceneStack = self->_excludedSceneStack;
  if (excludedSceneStack)
    v13 = -[NSMapTable count](excludedSceneStack->_recordsByWindowScene, "count");
  else
    v13 = 0;
  v14 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", v13, CFSTR("excludedSceneStack.count"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIKeyWindowEvaluator descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIKeyWindowEvaluator descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)keyWindowForUserInterfaceIdiom:(uint64_t)a1
{
  uint64_t v2;
  id *v3;
  void *v4;
  _QWORD v6[5];

  if (!a1)
    return 0;
  if (a2 != 3)
    return *(id *)(a1 + 200);
  v2 = *(_QWORD *)(a1 + 192);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56___UIKeyWindowEvaluator_keyWindowForUserInterfaceIdiom___block_invoke;
  v6[3] = &__block_descriptor_40_e23_B16__0__UIWindowScene_8l;
  v6[4] = 3;
  -[_UIKeyWindowSceneStack keyWindowSceneInStackPassingTest:](v2, (uint64_t)v6);
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[UIWindowScene _keyWindow](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)windowSceneWillInvalidate:(uint64_t)a1
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  id *v17;
  void *v18;
  int IsForegroundActive;
  id v20;
  id *v21;
  id *v22;
  _BYTE *v23;
  _QWORD *v24;
  _BYTE *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  objc_class *v32;
  const char *Name;
  objc_class *v34;
  const char *v35;
  unint64_t v36;
  NSObject *v37;
  unint64_t v38;
  NSObject *v39;
  NSObject *v40;
  int v41;
  _QWORD v42[5];
  uint8_t v43[4];
  void *v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  id *v48;
  _BYTE buf[24];
  void *v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = *(id *)(a1 + 200);
    v5 = a2;
    objc_msgSend(v5, "_FBSScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyWindowEvaluator _updateDefaultEvaluationStrategyForIdiomIfNeededWithRequest:](a1, v5, (v6 != 0) << 8);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p: Window scene was invalidated"), objc_opt_class(), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyWindowEvaluator _stackForWindowScene:]((char *)a1, v5);
    v8 = objc_claimAutoreleasedReturnValue();
    -[_UIKeyWindowSceneStack keyWindowSceneInStack]((id *)v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyWindowSceneStack removeWindowScene:forReason:](v8, v5, v7);
    -[_UIKeyWindowSceneStack keyWindowSceneInStack]((id *)v8);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v8)
    {
      if ((*(_BYTE *)(v8 + 32) & 1) != 0 && (void *)v10 != v9)
      {
        v12 = v7;
        -[_UIKeyWindowEvaluator _evaluateApplicationKeyWindowWithComparisonWindowScene:changingKeyWindowSceneActions:sceneKeyWindowActions:ignoringOldKeyWindow:sceneResignKeyWindowActions:andSceneBecomeKeyWindowActions:forReason:](a1, 0, (uint64_t)&__block_literal_global_88_4, 0, 1, 0, 0, v13, v12, 3);
        if (v4 == *(id *)(a1 + 200))
        {
          objc_msgSend(v5, "screen");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v42[0] = MEMORY[0x1E0C809B0];
          v42[1] = 3221225472;
          v42[2] = __51___UIKeyWindowEvaluator_windowSceneWillInvalidate___block_invoke_2;
          v42[3] = &unk_1E16B8120;
          v42[4] = v4;
          if (!v14)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UIWindow * _Nullable _UIKeyWindowEvaluatorFindNewKeyWindowOnScreenPassingTest(UIScreen * _Nonnull const __strong, BOOL (^ _Nullable const __strong)(UIWindow * _Nonnull __strong))");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("_UIKeyWindowEvaluator.m"), 462, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("screen"));

          }
          v15 = qword_1ECD80208;
          if (!qword_1ECD80208)
          {
            v15 = __UILogCategoryGetNode("KeyWindow", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v15, (unint64_t *)&qword_1ECD80208);
          }
          if ((*(_BYTE *)v15 & 1) != 0)
          {
            v28 = *(NSObject **)(v15 + 8);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134349056;
              *(_QWORD *)&buf[4] = v14;
              _os_log_impl(&dword_185066000, v28, OS_LOG_TYPE_ERROR, "Finding new application key window on screen: %{public}p", buf, 0xCu);
            }
          }
          if (!v14)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UIWindowScene * _Nullable _UIKeyWindowEvaluatorFindNewKeyWindowSceneOnScreen(UIScreen * _Nonnull const __strong)");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, CFSTR("_UIKeyWindowEvaluator.m"), 429, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("screen"));

          }
          v16 = qword_1ECD80220;
          if (!qword_1ECD80220)
          {
            v16 = __UILogCategoryGetNode("KeyWindow", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v16, (unint64_t *)&qword_1ECD80220);
          }
          if ((*(_BYTE *)v16 & 1) != 0)
          {
            v31 = *(NSObject **)(v16 + 8);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134349056;
              *(_QWORD *)&buf[4] = v14;
              _os_log_impl(&dword_185066000, v31, OS_LOG_TYPE_ERROR, "Finding new key window scene on screen: %{public}p", buf, 0xCu);
            }
          }
          +[_UISceneLifecycleMultiplexer mostActiveWindowSceneOnScreen:](_UISceneLifecycleMultiplexer, "mostActiveWindowSceneOnScreen:", v14);
          v17 = (id *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "_effectiveUISettings");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          IsForegroundActive = _UISceneLifecycleStateIsForegroundActive(v18);

          if (v17 && IsForegroundActive && (v20 = v17[43], v20, !v20))
          {
            v21 = v17;
          }
          else
          {
            *(_QWORD *)buf = MEMORY[0x1E0C809B0];
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = ___UIKeyWindowEvaluatorFindNewKeyWindowSceneOnScreen_block_invoke;
            v50 = &unk_1E16B79A8;
            v51 = v14;
            +[_UISceneLifecycleMultiplexer mostActiveSceneWithTest:](_UISceneLifecycleMultiplexer, "mostActiveSceneWithTest:", buf);
            v21 = (id *)objc_claimAutoreleasedReturnValue();
          }
          v22 = v21;
          v23 = (_BYTE *)qword_1ECD80228;
          if (!qword_1ECD80228)
          {
            v23 = (_BYTE *)(__UILogCategoryGetNode("KeyWindow", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16);
            atomic_store((unint64_t)v23, (unint64_t *)&qword_1ECD80228);
          }
          if ((*v23 & 1) != 0)
          {
            if (v22)
            {
              v32 = (objc_class *)objc_opt_class();
              Name = class_getName(v32);
            }
            else
            {
              Name = "(nil)";
            }
            v36 = qword_1ECD80230;
            if (!qword_1ECD80230)
            {
              v36 = __UILogCategoryGetNode("KeyWindow", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v36, (unint64_t *)&qword_1ECD80230);
            }
            if ((*(_BYTE *)v36 & 1) != 0)
            {
              v37 = *(NSObject **)(v36 + 8);
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v43 = 134349570;
                v44 = v14;
                v45 = 2082;
                v46 = Name;
                v47 = 2050;
                v48 = v22;
                _os_log_impl(&dword_185066000, v37, OS_LOG_TYPE_ERROR, "Found new key window on screen: %{public}p; scene: %{public}s: %{public}p",
                  v43,
                  0x20u);
              }
            }
          }

          if (v22)
          {
            -[UIWindowScene _findNewKeyWindowPassingTest:](v22, v42);
            v24 = (_QWORD *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v24 = 0;
          }
          v25 = (_BYTE *)qword_1ECD80210;
          if (!qword_1ECD80210)
          {
            v25 = (_BYTE *)(__UILogCategoryGetNode("KeyWindow", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16);
            atomic_store((unint64_t)v25, (unint64_t *)&qword_1ECD80210);
          }
          if ((*v25 & 1) != 0)
          {
            if (v24)
            {
              v34 = (objc_class *)objc_opt_class();
              v35 = class_getName(v34);
            }
            else
            {
              v35 = "(nil)";
            }
            v38 = qword_1ECD80218;
            if (!qword_1ECD80218)
            {
              v38 = __UILogCategoryGetNode("KeyWindow", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v38, (unint64_t *)&qword_1ECD80218);
            }
            if ((*(_BYTE *)v38 & 1) != 0)
            {
              v39 = *(NSObject **)(v38 + 8);
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              {
                v40 = v39;
                v41 = objc_msgSend(v24, "_contextId");
                *(_DWORD *)buf = 134349826;
                *(_QWORD *)&buf[4] = v14;
                *(_WORD *)&buf[12] = 2082;
                *(_QWORD *)&buf[14] = v35;
                *(_WORD *)&buf[22] = 2050;
                v50 = v24;
                LOWORD(v51) = 1026;
                *(_DWORD *)((char *)&v51 + 2) = v41;
                _os_log_impl(&dword_185066000, v40, OS_LOG_TYPE_ERROR, "Found new application key window on screen: %{public}p; %{public}s: %{public}p; contextId: 0x%{public}X",
                  buf,
                  0x26u);

              }
            }
          }

          -[UIWindow _makeKeyWindowIgnoringOldKeyWindow:transferringScenes:](v24, 1, 0);
        }
      }
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureToken, 0);
  objc_storeStrong((id *)&self->_excludedSceneStack, 0);
  objc_storeStrong((id *)&self->_keyWindowSceneStack, 0);
}

@end
