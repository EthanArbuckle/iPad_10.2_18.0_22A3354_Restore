@implementation _UIHomeAffordanceSceneNotifierProxy

- (_UIHomeAffordanceSceneNotifierProxy)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHomeAffordanceSceneNotifier.m"), 705, CFSTR("%s: init is not allowed on %@"), "-[_UIHomeAffordanceSceneNotifierProxy init]", objc_opt_class());

  return 0;
}

- (_UIHomeAffordanceSceneNotifierProxy)initWithScene:(id)a3
{
  int v6;
  _UIHomeAffordanceSceneNotifierProxy *v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  _UIHomeAffordanceSceneNotifierProxy *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  objc_class *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  objc_class *v22;
  const char *Name;
  void *v24;
  id WeakRetained;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  BSInvalidatable *stateCaptureToken;
  _UIHomeAffordanceSceneNotifierProxy *v31;
  void *v33;
  id v34;
  objc_super v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  __CFString *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend((id)UIApp, "isFrontBoard");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v35.receiver = self;
    v35.super_class = (Class)_UIHomeAffordanceSceneNotifierProxy;
    v7 = -[_UIHomeAffordanceSceneNotifierProxy init](&v35, sel_init);
    if (v7)
    {
      v8 = initWithScene____s_category_182;
      if (!initWithScene____s_category_182)
      {
        v8 = __UILogCategoryGetNode("HomeAffordanceObservation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v8, (unint64_t *)&initWithScene____s_category_182);
      }
      v9 = *(id *)(v8 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (void *)MEMORY[0x1E0CB3940];
        v11 = v7;
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@: %p>"), v13, v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = v14;
        if (a3)
        {
          v16 = (void *)MEMORY[0x1E0CB3940];
          v17 = a3;
          v18 = (objc_class *)objc_opt_class();
          NSStringFromClass(v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@: %p>"), v19, v17);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v20 = CFSTR("(nil)");
        }
        *(_DWORD *)buf = 138543618;
        v37 = v15;
        v38 = 2114;
        v39 = v20;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "Initializing home affordance notifier: %{public}@; with scene: %{public}@",
          buf,
          0x16u);

      }
      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObserver:selector:name:object:", v7, sel__windowDidBecomeAppKeyNotification_, CFSTR("_UIWindowDidBecomeApplicationKeyNotification"), 0);
        objc_msgSend(v21, "addObserver:selector:name:object:", v7, sel__windowDidResignAppKeyNotification_, CFSTR("_UIWindowDidResignApplicationKeyNotification"), 0);

      }
      objc_storeWeak((id *)&v7->_scene, a3);
      objc_initWeak((id *)buf, v7);
      v22 = (objc_class *)objc_opt_class();
      Name = class_getName(v22);
      v24 = (void *)MEMORY[0x1E0CB3940];
      WeakRetained = objc_loadWeakRetained((id *)&v7->_scene);
      objc_msgSend(WeakRetained, "_sceneIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", CFSTR("UIKit - %s - %@"), Name, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = MEMORY[0x1E0C80D38];
      objc_copyWeak(&v34, (id *)buf);
      BSLogAddStateCaptureBlockWithTitle();
      v29 = objc_claimAutoreleasedReturnValue();
      stateCaptureToken = v7->_stateCaptureToken;
      v7->_stateCaptureToken = (BSInvalidatable *)v29;

      objc_destroyWeak(&v34);
      objc_destroyWeak((id *)buf);
    }
    self = v7;
    v31 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHomeAffordanceSceneNotifier.m"), 715, CFSTR("Unexpected scene class for notifier: %@"), a3);

    v31 = 0;
  }

  return v31;
}

- (void)_reset
{
  NSMutableSet *registeredObserverRecords;
  _UIInvalidatable *targetNotifierRegistrationToken;
  CGSize v5;

  registeredObserverRecords = self->_registeredObserverRecords;
  self->_registeredObserverRecords = 0;

  -[_UIInvalidatable _invalidate](self->_targetNotifierRegistrationToken, "_invalidate");
  targetNotifierRegistrationToken = self->_targetNotifierRegistrationToken;
  self->_targetNotifierRegistrationToken = 0;

  v5 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  self->_lastReceivedHomeAffordanceSceneReferenceFrame.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  self->_lastReceivedHomeAffordanceSceneReferenceFrame.size = v5;
  -[_UIHomeAffordanceSceneNotifierProxy _resetTargetNotifierSceneState]((uint64_t)self);
}

- (void)_sceneWillInvalidate:(id)a3
{
  unint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  __CFString *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "_hasInvalidated"))
  {
    *(_BYTE *)&self->_flags |= 1u;
    v5 = _sceneWillInvalidate____s_category_187;
    if (!_sceneWillInvalidate____s_category_187)
    {
      v5 = __UILogCategoryGetNode("HomeAffordanceObservation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&_sceneWillInvalidate____s_category_187);
    }
    v6 = *(id *)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[_UIHomeAffordanceSceneNotifierProxy succinctDescription](self, "succinctDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (a3)
      {
        v8 = (void *)MEMORY[0x1E0CB3940];
        v9 = a3;
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %p>"), v11, v9);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v12 = CFSTR("(nil)");
      }
      *(_DWORD *)buf = 138543618;
      v14 = v7;
      v15 = 2114;
      v16 = v12;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "Resetting home affordance notifier: %{public}@; for invalidating scene: %{public}@",
        buf,
        0x16u);

    }
    -[_UIHomeAffordanceSceneNotifierProxy _reset](self, "_reset");
    -[BSInvalidatable invalidate](self->_stateCaptureToken, "invalidate");
  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  -[BSInvalidatable invalidate](self->_stateCaptureToken, "invalidate");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = CFSTR("_UIWindowDidBecomeApplicationKeyNotification");
  v6[1] = CFSTR("_UIWindowDidResignApplicationKeyNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5.receiver = self;
  v5.super_class = (Class)_UIHomeAffordanceSceneNotifierProxy;
  -[_UIHomeAffordanceSceneNotifierProxy dealloc](&v5, sel_dealloc);
}

- (BOOL)_hasInvalidated
{
  return *(_BYTE *)&self->_flags & 1;
}

- (_UISceneUIWindowHosting)_windowHostingScene
{
  return (_UISceneUIWindowHosting *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)_unregisterHomeAffordanceObserverForRecord:(id)a3
{
  void *v5;
  void *v6;
  char v7;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[_UIHomeAffordanceSceneNotifierProxy _scene](self, "_scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "_hasInvalidated");

    if ((v7 & 1) == 0)
    {
      -[NSMutableSet removeObject:](self->_registeredObserverRecords, "removeObject:", a3);
      if (os_variant_has_internal_diagnostics())
      {
        v8 = _unregisterHomeAffordanceObserverForRecord____s_category_188;
        if (!_unregisterHomeAffordanceObserverForRecord____s_category_188)
        {
          v8 = __UILogCategoryGetNode("HomeAffordanceObservation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v8, (unint64_t *)&_unregisterHomeAffordanceObserverForRecord____s_category_188);
        }
        v9 = *(NSObject **)(v8 + 8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = v9;
          -[_UIHomeAffordanceObservationRecord observer]((id *)a3);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIHomeAffordanceSceneNotifierProxy succinctDescription](self, "succinctDescription");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = 138543618;
          v14 = v11;
          v15 = 2114;
          v16 = v12;
          _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "Unregistered home affordance observer: %{public}@; notifier: %{public}@",
            (uint8_t *)&v13,
            0x16u);

        }
      }
      if (!-[NSMutableSet count](self->_registeredObserverRecords, "count"))
      {
        if (self->_targetNotifierRegistrationToken)
          -[_UIHomeAffordanceSceneNotifierProxy _updateTargetNotifierRegistrationWithNotifier:forMovingScreens:]((uint64_t)self, self->_targetHomeAffordanceNotifier, 0);
      }
    }
  }
}

- (void)_updateTargetNotifierRegistrationWithNotifier:(char)a3 forMovingScreens:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id WeakRetained;
  uint64_t v18;
  void *v19;
  BOOL v20;
  int v21;
  unint64_t v22;
  NSObject *v23;
  void *v24;
  id v25;
  objc_class *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  BOOL v41;
  int v42;
  char v43;
  int v44;
  BOOL v45;
  int v46;
  int v47;
  int v48;
  int v49;
  unint64_t v50;
  void *v51;
  _OWORD *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  __int128 v66;
  void *v67;
  __int128 v68;
  NSObject *v69;
  NSObject *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  objc_class *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  id v81;
  __CFString *v82;
  void *v83;
  objc_class *v84;
  void *v85;
  void *v86;
  NSObject *log;
  NSObject *loga;
  int v89;
  id *v90;
  void *v91;
  char v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint8_t buf[4];
  void *v105;
  __int16 v106;
  uint64_t v107;
  __int16 v108;
  id v109;
  __int16 v110;
  _BYTE v111[10];
  __int16 v112;
  int v113;
  __int16 v114;
  int v115;
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v90 = (id *)(a1 + 48);
  v6 = *(id *)(a1 + 48);
  v91 = a2;
  v7 = a2;
  v92 = objc_msgSend(v6, "_hasInvalidated");
  objc_msgSend((id)a1, "_windowHostingScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_windowHostingScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_windowHostingScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = v8;
  objc_msgSend(v8, "_screen");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = v9;
  objc_msgSend(v9, "_screen");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = v10;
  objc_msgSend(v10, "_screen");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "_registeredObserverRecords");
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v100, buf, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v101;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v101 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * v15);
        if (v16)
          WeakRetained = objc_loadWeakRetained((id *)(v16 + 16));
        else
          WeakRetained = 0;

        if (WeakRetained == v7)
        {

          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)a1, "succinctDescription");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "succinctDescription");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", sel__updateTargetNotifierRegistrationWithNotifier_forMovingScreens_, a1, CFSTR("_UIHomeAffordanceSceneNotifier.m"), 884, CFSTR("Invalid target home affordance notifier. The target notifier is an observer of this notifier: self: %@; target: %@"),
            v38,
            v39);

          v40 = v94;
          goto LABEL_88;
        }
        ++v15;
      }
      while (v13 != v15);
      v18 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v100, buf, 16);
      v13 = v18;
    }
    while (v18);
  }

  v19 = v97;
  if (v6)
    v20 = v98 == v97;
  else
    v20 = 1;
  v21 = !v20;
  if ((a3 & 1) == 0 && v99 && v99 != v97)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        goto LABEL_33;
      loga = v23;
      v89 = v21;
      objc_msgSend(v7, "succinctDescription");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = (void *)MEMORY[0x1E0CB3940];
      v75 = v99;
      v76 = (objc_class *)objc_opt_class();
      NSStringFromClass(v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "stringWithFormat:", CFSTR("<%@: %p>"), v77, v75);
      v78 = (void *)objc_claimAutoreleasedReturnValue();

      v79 = v78;
      objc_msgSend((id)a1, "succinctDescription");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = v97;
      if (v81)
      {
        v83 = (void *)MEMORY[0x1E0CB3940];
        v84 = (objc_class *)objc_opt_class();
        NSStringFromClass(v84);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "stringWithFormat:", CFSTR("<%@: %p>"), v85, v81);
        v82 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v82 = CFSTR("(nil)");
      }

      *(_DWORD *)buf = 138413058;
      v105 = v73;
      v106 = 2112;
      v107 = (uint64_t)v79;
      v108 = 2112;
      v109 = v80;
      v110 = 2112;
      *(_QWORD *)v111 = v82;
      v23 = loga;
      _os_log_fault_impl(&dword_185066000, loga, OS_LOG_TYPE_FAULT, "Unregistering proxy from target home affordance notifier as they are not on the same screen, which is unsupported: target: %@; target screen: %@; self: %@; self screen: %@",
        buf,
        0x2Au);

      v19 = v97;
    }
    else
    {
      v22 = _MergedGlobals_944;
      if (!_MergedGlobals_944)
      {
        v22 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v22, (unint64_t *)&_MergedGlobals_944);
      }
      v23 = *(id *)(v22 + 8);
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        goto LABEL_33;
      log = v23;
      v89 = v21;
      objc_msgSend(v7, "succinctDescription");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0CB3940];
      v25 = v99;
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", CFSTR("<%@: %p>"), v27, v25);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = v28;
      objc_msgSend((id)a1, "succinctDescription");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v97;
      if (v31)
      {
        v32 = (void *)MEMORY[0x1E0CB3940];
        v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        v34 = v30;
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "stringWithFormat:", CFSTR("<%@: %p>"), v35, v31);
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v30 = v34;
      }
      else
      {
        v36 = CFSTR("(nil)");
      }

      *(_DWORD *)buf = 138413058;
      v23 = log;
      v105 = v86;
      v106 = 2112;
      v107 = (uint64_t)v29;
      v108 = 2112;
      v109 = v30;
      v110 = 2112;
      *(_QWORD *)v111 = v36;
      _os_log_impl(&dword_185066000, log, OS_LOG_TYPE_ERROR, "Unregistering proxy from target home affordance notifier as they are not on the same screen, which is unsupported: target: %@; target screen: %@; self: %@; self screen: %@",
        buf,
        0x2Au);

    }
    v21 = v89;
LABEL_33:

  }
  if (v7)
    v41 = v6 == v7;
  else
    v41 = 1;
  v42 = !v41;
  if (v6)
    v43 = v92;
  else
    v43 = 0;
  if ((v43 & 1) != 0)
  {
    v44 = 1;
  }
  else
  {
    if (v6)
      v45 = v7 == 0;
    else
      v45 = 0;
    v44 = v45;
  }
  v40 = v94;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    if (v6 && v98 == v19)
    {
      v46 = *(_QWORD *)(a1 + 40) ? 1 : v44;
      if (v46 != 1)
      {
        v49 = 0;
        v48 = 1;
        goto LABEL_73;
      }
    }
    if (v99)
      v47 = v42;
    else
      v47 = 0;
    if (v99 == v19)
      v48 = v47;
    else
      v48 = 0;
  }
  else
  {
    v48 = 0;
  }
  if (((v48 | v44) & 1) != 0)
  {
LABEL_71:
    v49 = 0;
    goto LABEL_73;
  }
  if (!*(_QWORD *)(a1 + 40))
  {
    v48 = 0;
    goto LABEL_71;
  }
  v48 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
    v49 = v42 | v21;
  else
    v49 = 1;
LABEL_73:
  v50 = qword_1ECD7CB90;
  if (!qword_1ECD7CB90)
  {
    v50 = __UILogCategoryGetNode("HomeAffordanceObservation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v50, (unint64_t *)&qword_1ECD7CB90);
  }
  if ((*(_BYTE *)v50 & 1) != 0)
  {
    v69 = *(NSObject **)(v50 + 8);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    {
      v70 = v69;
      objc_msgSend((id)a1, "succinctDescription");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "succinctDescription");
      v71 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      v105 = v93;
      v106 = 2114;
      v107 = v71;
      v72 = (void *)v71;
      v108 = 2114;
      v109 = v7;
      v110 = 1024;
      *(_DWORD *)v111 = v42;
      *(_WORD *)&v111[4] = 1024;
      *(_DWORD *)&v111[6] = v48;
      v112 = 1024;
      v113 = v49;
      v114 = 1024;
      v115 = v44;
      _os_log_impl(&dword_185066000, v70, OS_LOG_TYPE_ERROR, "Update target notifier registration requested for notifier: %{public}@; _targetHomeAffordanceNotifier: %{public}"
        "@; targetHomeAffordanceNotifier: %{public}@; shouldUpdateToNewTarget: %d; shouldRegister: %d; shouldUnregister: "
        "%d; shouldCleanUpOldTargetAndRegistration %d",
        buf,
        0x38u);

    }
  }
  if ((v42 | v48 | v49 | v44) == 1)
  {
    if (v42)
    {
      -[_UIHomeAffordanceSceneNotifierProxy _resetTargetNotifierSceneState](a1);
      objc_storeStrong(v90, v91);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "addObserver:selector:name:object:", a1, sel__targetNotifierSceneDidMoveToScreen_, CFSTR("_UIWindowHostingSceneDidMoveToScreenNotification"), v96);
      objc_msgSend(v51, "addObserver:selector:name:object:", a1, sel__targetNotifierSceneDidDisconnect_, CFSTR("UISceneDidDisconnectNotification"), v96);

    }
    v52 = (_OWORD *)MEMORY[0x1E0C9D648];
    if (v48)
    {
      objc_msgSend(v94, "_allWindows");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "firstObject");
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 48), "registerHomeAffordanceObserver:inWindow:", a1, v54);
      v55 = objc_claimAutoreleasedReturnValue();
      v56 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v55;

      objc_msgSend(*(id *)(a1 + 48), "homeAffordanceSceneReferenceFrameForWindow:", v54);
      v58 = v57;
      v60 = v59;
      v62 = v61;
      v64 = v63;

    }
    else
    {
      v58 = *MEMORY[0x1E0C9D648];
      v60 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v62 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v64 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    if (objc_msgSend(*(id *)(a1 + 32), "count"))
      objc_msgSend((id)a1, "_notifier:homeAffordanceFrameDidChange:", *(_QWORD *)(a1 + 48), v58, v60, v62, v64);
    if (v49)
    {
      objc_msgSend(*(id *)(a1 + 40), "_invalidate");
      v65 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = 0;

      v66 = v52[1];
      *(_OWORD *)(a1 + 56) = *v52;
      *(_OWORD *)(a1 + 72) = v66;
    }
    if (v44)
    {
      objc_msgSend(*(id *)(a1 + 40), "_invalidate");
      v67 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = 0;

      v68 = v52[1];
      *(_OWORD *)(a1 + 56) = *v52;
      *(_OWORD *)(a1 + 72) = v68;
      -[_UIHomeAffordanceSceneNotifierProxy _resetTargetNotifierSceneState](a1);
    }
  }
LABEL_88:

}

- (id)registerHomeAffordanceObserver:(id)a3 inWindow:(id)a4
{
  void *v7;
  void *v8;
  char v9;
  _BOOL4 v10;
  id *v12;
  NSMutableSet *registeredObserverRecords;
  NSMutableSet *v14;
  NSMutableSet *v15;
  unint64_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  BOOL v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[_UIHomeAffordanceSceneNotifierProxy _scene](self, "_scene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "_hasInvalidated");

    if ((v9 & 1) != 0)
      return 0;
    v20 = 0;
    if (!_UIHomeAffordanceValidateObserver(self, a3, a4, 0, &v20))
      return 0;
    if (-[NSMutableSet count](self->_registeredObserverRecords, "count"))
      v10 = 0;
    else
      v10 = self->_targetHomeAffordanceNotifier != 0;
    v12 = -[_UIHomeAffordanceObservationRecord initWithObserver:forLegacyViewService:scopedWindow:]([_UIHomeAffordanceObservationRecord alloc], a3, 0, 0);
    registeredObserverRecords = self->_registeredObserverRecords;
    if (!registeredObserverRecords)
    {
      v14 = (NSMutableSet *)objc_opt_new();
      v15 = self->_registeredObserverRecords;
      self->_registeredObserverRecords = v14;

      registeredObserverRecords = self->_registeredObserverRecords;
    }
    -[NSMutableSet addObject:](registeredObserverRecords, "addObject:", v12);
    _UIHomeAffordanceRegistrationTokenForNotifierAndRecord(self, (uint64_t)v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      -[_UIHomeAffordanceSceneNotifierProxy _updateTargetNotifierRegistrationWithNotifier:forMovingScreens:]((uint64_t)self, self->_targetHomeAffordanceNotifier, 0);
    if (os_variant_has_internal_diagnostics())
    {
      v16 = registerHomeAffordanceObserver_inWindow____s_category_189;
      if (!registerHomeAffordanceObserver_inWindow____s_category_189)
      {
        v16 = __UILogCategoryGetNode("HomeAffordanceObservation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v16, (unint64_t *)&registerHomeAffordanceObserver_inWindow____s_category_189);
      }
      v17 = *(NSObject **)(v16 + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = v17;
        -[_UIHomeAffordanceSceneNotifierProxy succinctDescription](self, "succinctDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v22 = a3;
        v23 = 2114;
        v24 = v8;
        v25 = 2114;
        v26 = v19;
        _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_DEFAULT, "Registered home affordance observer: %{public}@; token: %{public}@; notifier: %{public}@",
          buf,
          0x20u);

      }
    }

  }
  return v8;
}

- (CGRect)homeAffordanceSceneReferenceFrameForWindow:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_lastReceivedHomeAffordanceSceneReferenceFrame.origin.x;
  y = self->_lastReceivedHomeAffordanceSceneReferenceFrame.origin.y;
  width = self->_lastReceivedHomeAffordanceSceneReferenceFrame.size.width;
  height = self->_lastReceivedHomeAffordanceSceneReferenceFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_resetTargetNotifierSceneState
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    objc_msgSend(v2, "_windowHostingScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", a1, CFSTR("_UIWindowHostingSceneDidMoveToScreenNotification"), v3);
    objc_msgSend(v4, "removeObserver:name:object:", a1, CFSTR("UISceneDidDisconnectNotification"), v3);

    v2 = *(void **)(a1 + 48);
  }
  *(_QWORD *)(a1 + 48) = 0;

}

- (void)setTargetHomeAffordanceNotifier:(void *)a1
{
  void *v4;
  void *v5;
  char v6;

  if (a1)
  {
    objc_msgSend(a1, "_scene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      v6 = objc_msgSend(v4, "_hasInvalidated");

      if ((v6 & 1) == 0)
        -[_UIHomeAffordanceSceneNotifierProxy _updateTargetNotifierRegistrationWithNotifier:forMovingScreens:]((uint64_t)a1, a2, 0);
    }
  }
}

- (void)_windowDidBecomeAppKeyNotification:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a3, "object");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  if (_UIHomeAffordanceNotifierShouldUpdateTargetForKeyWindow(self, v8))
  {
    objc_msgSend(v8, "_windowHostingScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_homeAffordanceSceneNotifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIHomeAffordanceSceneNotifierProxy _updateTargetNotifierRegistrationWithNotifier:forMovingScreens:]((uint64_t)self, v7, 0);

  }
}

- (void)_windowDidResignAppKeyNotification:(id)a3
{
  void *v5;
  id v6;

  objc_msgSend(a3, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a3, "object");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  if (_UIHomeAffordanceNotifierShouldUpdateTargetForKeyWindow(self, v6))
    -[_UIHomeAffordanceSceneNotifierProxy _updateTargetNotifierRegistrationWithNotifier:forMovingScreens:]((uint64_t)self, 0, 0);

}

- (void)_targetNotifierSceneDidMoveToScreen:(id)a3
{
  void *v5;
  void *v6;
  char v7;
  _UIHomeAffordanceNotifying *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  objc_class *v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  id v22;
  void *v23;
  objc_class *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  __CFString *v33;
  __int16 v34;
  __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[_UIHomeAffordanceSceneNotifierProxy _scene](self, "_scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "_hasInvalidated");

    if ((v7 & 1) == 0)
    {
      v8 = self->_targetHomeAffordanceNotifier;
      objc_msgSend(a3, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("_UIWindowHostingSceneOldScreenUserInfoKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a3, "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("_UIWindowHostingSceneNewScreenUserInfoKey"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = _targetNotifierSceneDidMoveToScreen____s_category;
      if (!_targetNotifierSceneDidMoveToScreen____s_category)
      {
        v13 = __UILogCategoryGetNode("HomeAffordanceObservation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v13, (unint64_t *)&_targetNotifierSceneDidMoveToScreen____s_category);
      }
      v14 = *(id *)(v13 + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        -[_UIHomeAffordanceNotifying succinctDescription](v8, "succinctDescription");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIHomeAffordanceSceneNotifierProxy succinctDescription](self, "succinctDescription");
        v15 = (id)objc_claimAutoreleasedReturnValue();
        v16 = v10;
        if (v16)
        {
          v17 = (void *)MEMORY[0x1E0CB3940];
          v18 = (objc_class *)objc_opt_class();
          NSStringFromClass(v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@: %p>"), v19, v16);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v20 = CFSTR("(nil)");
        }

        v21 = v20;
        v22 = v12;
        if (v22)
        {
          v23 = (void *)MEMORY[0x1E0CB3940];
          v24 = (objc_class *)objc_opt_class();
          NSStringFromClass(v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringWithFormat:", CFSTR("<%@: %p>"), v25, v22);
          v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v26 = CFSTR("(nil)");
        }

        *(_DWORD *)buf = 138544130;
        v29 = v27;
        v30 = 2114;
        v31 = v15;
        v32 = 2114;
        v33 = v21;
        v34 = 2114;
        v35 = v26;
        _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_DEFAULT, "Current target home affordance notifier: %{public}@; for notifier: %{public}@; did move from screen: %{public}"
          "@; to screen: %{public}@",
          buf,
          0x2Au);

      }
      -[_UIHomeAffordanceSceneNotifierProxy _updateTargetNotifierRegistrationWithNotifier:forMovingScreens:]((uint64_t)self, self->_targetHomeAffordanceNotifier, 1);

    }
  }
}

- (void)_targetNotifierSceneDidDisconnect:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  -[_UIHomeAffordanceSceneNotifierProxy _scene](self, "_scene", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "_hasInvalidated");

    if ((v6 & 1) == 0)
      -[_UIHomeAffordanceSceneNotifierProxy _updateTargetNotifierRegistrationWithNotifier:forMovingScreens:]((uint64_t)self, self->_targetHomeAffordanceNotifier, 0);
  }
}

- (void)_notifier:(id)a3 homeAffordanceFrameDidChange:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  void *v11;
  char v12;
  _UIHomeAffordanceNotifying *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id WeakRetained;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  double v69;
  double v70;
  double v71;
  double v72;
  _BOOL4 IsNull;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  unint64_t v81;
  NSObject *v82;
  NSObject *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  uint8_t buf[4];
  void *v95;
  __int16 v96;
  void *v97;
  __int16 v98;
  void *v99;
  __int16 v100;
  void *v101;
  uint64_t v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v102 = *MEMORY[0x1E0C80C00];
  -[_UIHomeAffordanceSceneNotifierProxy _scene](self, "_scene", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = v10;
    v12 = objc_msgSend(v10, "_hasInvalidated");

    if ((v12 & 1) == 0)
    {
      v13 = self->_targetHomeAffordanceNotifier;
      if (v13)
      {
        v15 = *MEMORY[0x1E0C9D648];
        v14 = *(double *)(MEMORY[0x1E0C9D648] + 8);
        v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
        v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
        v103.origin.x = x;
        v103.origin.y = y;
        v103.size.width = width;
        v103.size.height = height;
        v109.origin.x = *(CGFloat *)MEMORY[0x1E0C9D648];
        v109.origin.y = v14;
        v109.size.width = v17;
        v109.size.height = v16;
        if (CGRectEqualToRect(v103, v109))
        {
          v16 = height;
          v17 = width;
          v14 = y;
          v15 = x;
        }
        else
        {
          v90 = v15;
          v91 = v14;
          v92 = v17;
          v93 = v16;
          -[_UIHomeAffordanceNotifying _windowHostingScene](v13, "_windowHostingScene");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIHomeAffordanceSceneNotifierProxy _windowHostingScene](self, "_windowHostingScene");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "_screen");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "_screen");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24 == v25)
          {
            objc_msgSend(v22, "_referenceBounds");
            v27 = v26;
            v29 = v28;
            objc_msgSend(v23, "_referenceBounds");
            v88 = v30;
            v89 = v31;
            objc_msgSend(v22, "_coordinateSpace");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "_coordinateSpace");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "_effectiveSettings");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "interfaceOrientation");

            objc_msgSend(v23, "_effectiveSettings");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "interfaceOrientation");

            v38 = _UIWindowConvertRectFromSceneReferenceSpaceToSceneSpace(v35, x, y, width, height, v27, v29);
            v40 = v39;
            v42 = v41;
            v44 = v43;
            objc_msgSend(v22, "_screen");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "fixedCoordinateSpace");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "convertRect:toCoordinateSpace:", v46, v38, v40, v42, v44);
            v48 = v47;
            v50 = v49;
            v52 = v51;
            v54 = v53;

            objc_msgSend(v22, "_screen");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "fixedCoordinateSpace");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "convertRect:toCoordinateSpace:", v33, v48, v50, v52, v54);
            v58 = v57;
            v60 = v59;
            v62 = v61;
            v64 = v63;

            objc_msgSend(v33, "bounds");
            v110.origin.x = v65;
            v110.origin.y = v66;
            v110.size.width = v67;
            v110.size.height = v68;
            v104.origin.x = v58;
            v104.origin.y = v60;
            v104.size.width = v62;
            v104.size.height = v64;
            v105 = CGRectIntersection(v104, v110);
            v69 = v105.origin.x;
            v70 = v105.origin.y;
            v71 = v105.size.width;
            v72 = v105.size.height;
            IsNull = CGRectIsNull(v105);
            v74 = v90;
            v75 = v91;
            if (!IsNull)
            {
              v74 = v69;
              v75 = v70;
            }
            v76 = v92;
            v77 = v93;
            if (!IsNull)
            {
              v76 = v71;
              v77 = v72;
            }
            v15 = _UIWindowConvertRectFromSceneSpaceToSceneReferenceSpace(v37, v74, v75, v76, v77, v88, v89);
            v14 = v78;
            v17 = v79;
            v16 = v80;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGRect _UIHomeAffordanceConvertSceneReferenceFrameFromSceneToScene(CGRect, UIScene<_UISceneUIWindowHosting> * _Nonnull const __strong, UIScene<_UISceneUIWindowHosting> * _Nonnull const __strong)");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, CFSTR("_UIHomeAffordanceSceneNotifier.m"), 337, CFSTR("Invalid conversion attempt between scenes on different screens: fromScene: %@; toScene: %@"),
              v22,
              v23);
          }

        }
        v106.origin.x = v15;
        v106.origin.y = v14;
        v106.size.width = v17;
        v106.size.height = v16;
        if (!CGRectEqualToRect(v106, self->_lastReceivedHomeAffordanceSceneReferenceFrame))
        {
          v81 = _notifier_homeAffordanceFrameDidChange____s_category;
          if (!_notifier_homeAffordanceFrameDidChange____s_category)
          {
            v81 = __UILogCategoryGetNode("HomeAffordanceObservation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v81, (unint64_t *)&_notifier_homeAffordanceFrameDidChange____s_category);
          }
          if ((*(_BYTE *)v81 & 1) != 0)
          {
            v82 = *(NSObject **)(v81 + 8);
            if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
            {
              v83 = v82;
              v107.origin.x = x;
              v107.origin.y = y;
              v107.size.width = width;
              v107.size.height = height;
              NSStringFromCGRect(v107);
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              v108.origin.x = v15;
              v108.origin.y = v14;
              v108.size.width = v17;
              v108.size.height = v16;
              NSStringFromCGRect(v108);
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              -[_UIHomeAffordanceNotifying succinctDescription](v13, "succinctDescription");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              -[_UIHomeAffordanceSceneNotifierProxy succinctDescription](self, "succinctDescription");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v95 = v84;
              v96 = 2112;
              v97 = v85;
              v98 = 2112;
              v99 = v86;
              v100 = 2112;
              v101 = v87;
              _os_log_impl(&dword_185066000, v83, OS_LOG_TYPE_ERROR, "Received proxy home affordance frame update from target notifier: %@; converted frame: %@; target notifi"
                "er: %@; proxy: %@",
                buf,
                0x2Au);

            }
          }
          self->_lastReceivedHomeAffordanceSceneReferenceFrame.origin.x = v15;
          self->_lastReceivedHomeAffordanceSceneReferenceFrame.origin.y = v14;
          self->_lastReceivedHomeAffordanceSceneReferenceFrame.size.width = v17;
          self->_lastReceivedHomeAffordanceSceneReferenceFrame.size.height = v16;
          _UIHomeAffordanceNotifyObserversFrameDidChange(self, v15, v14, v17, v16);
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIHomeAffordanceSceneNotifierProxy succinctDescription](self, "succinctDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
        objc_msgSend(WeakRetained, "succinctDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHomeAffordanceSceneNotifier.m"), 1032, CFSTR("Unexpected target notifier update for proxy notifier: %@; scene: %@"),
          v19,
          v21);

      }
    }
  }
}

- (void)_notifier:(id)a3 homeAffordanceDoubleTapGestureDidSucceed:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  char v9;
  _UIHomeAffordanceNotifying *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  _BOOL4 v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  -[_UIHomeAffordanceSceneNotifierProxy _scene](self, "_scene", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(v7, "_hasInvalidated");

    if ((v9 & 1) == 0)
    {
      v10 = self->_targetHomeAffordanceNotifier;
      if (v10)
      {
        v11 = _notifier_homeAffordanceDoubleTapGestureDidSucceed____s_category;
        if (!_notifier_homeAffordanceDoubleTapGestureDidSucceed____s_category)
        {
          v11 = __UILogCategoryGetNode("HomeAffordanceObservation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v11, (unint64_t *)&_notifier_homeAffordanceDoubleTapGestureDidSucceed____s_category);
        }
        if ((*(_BYTE *)v11 & 1) != 0)
        {
          v16 = *(NSObject **)(v11 + 8);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v17 = v16;
            -[_UIHomeAffordanceNotifying succinctDescription](v10, "succinctDescription");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UIHomeAffordanceSceneNotifierProxy succinctDescription](self, "succinctDescription");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 67109634;
            v21 = v4;
            v22 = 2112;
            v23 = v18;
            v24 = 2112;
            v25 = v19;
            _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "Received proxy doubleTapGestureDidSucceed from target notifier: %d; target notifier: %@; proxy: %@",
              buf,
              0x1Cu);

          }
        }
        _UIHomeAffordanceNotifyObserversDoubleTapGestureDidSucceed(self, v4);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIHomeAffordanceSceneNotifierProxy succinctDescription](self, "succinctDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
        objc_msgSend(WeakRetained, "succinctDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHomeAffordanceSceneNotifier.m"), 1064, CFSTR("Unexpected target notifier update for proxy notifier: %@; scene: %@"),
          v13,
          v15);

      }
    }
  }
}

- (void)appendDescriptionToStream:(id)a3
{
  uint64_t v5;
  _QWORD v6[6];
  _QWORD v7[6];

  v5 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65___UIHomeAffordanceSceneNotifierProxy_appendDescriptionToStream___block_invoke;
  v7[3] = &unk_1E16B1B50;
  v7[4] = a3;
  v7[5] = self;
  objc_msgSend(a3, "appendProem:block:", self, v7);
  if (objc_msgSend(a3, "hasDebugStyle"))
  {
    v6[0] = v5;
    v6[1] = 3221225472;
    v6[2] = __65___UIHomeAffordanceSceneNotifierProxy_appendDescriptionToStream___block_invoke_2;
    v6[3] = &unk_1E16B1B50;
    v6[4] = a3;
    v6[5] = self;
    objc_msgSend(a3, "appendBodySectionWithName:block:", 0, v6);
  }
}

- (id)succinctDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D01750];
  objc_msgSend(MEMORY[0x1E0D01758], "succinctStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionForRootObject:withStyle:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D01750];
  objc_msgSend(MEMORY[0x1E0D01758], "debugStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionForRootObject:withStyle:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)_setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (NSMutableSet)_registeredObserverRecords
{
  return self->_registeredObserverRecords;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetHomeAffordanceNotifier, 0);
  objc_storeStrong((id *)&self->_targetNotifierRegistrationToken, 0);
  objc_storeStrong((id *)&self->_registeredObserverRecords, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_stateCaptureToken, 0);
}

@end
