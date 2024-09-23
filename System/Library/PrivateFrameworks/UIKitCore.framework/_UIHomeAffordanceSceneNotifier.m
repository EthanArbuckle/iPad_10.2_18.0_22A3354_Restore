@implementation _UIHomeAffordanceSceneNotifier

- (_UIHomeAffordanceSceneNotifier)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHomeAffordanceSceneNotifier.m"), 449, CFSTR("%s: init is not allowed on %@"), "-[_UIHomeAffordanceSceneNotifier init]", objc_opt_class());

  return 0;
}

- (_UIHomeAffordanceSceneNotifier)initWithScene:(id)a3
{
  _UIHomeAffordanceSceneNotifier *v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  _UIHomeAffordanceSceneNotifier *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  objc_class *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  objc_class *v19;
  const char *Name;
  void *v21;
  id WeakRetained;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  BSInvalidatable *stateCaptureToken;
  id v29;
  objc_super v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)_UIHomeAffordanceSceneNotifier;
  v4 = -[_UIHomeAffordanceSceneNotifier init](&v30, sel_init);
  if (v4)
  {
    v5 = initWithScene____s_category;
    if (!initWithScene____s_category)
    {
      v5 = __UILogCategoryGetNode("HomeAffordanceObservation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&initWithScene____s_category);
    }
    v6 = *(id *)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = v4;
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p>"), v10, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v11;
      if (a3)
      {
        v13 = (void *)MEMORY[0x1E0CB3940];
        v14 = a3;
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@: %p>"), v16, v14);
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v17 = CFSTR("(nil)");
      }
      *(_DWORD *)buf = 138543618;
      v32 = v12;
      v33 = 2114;
      v34 = v17;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "Initializing home affordance notifier: %{public}@; with scene: %{public}@",
        buf,
        0x16u);

    }
    objc_storeWeak((id *)&v4->_scene, a3);
    -[_UIHomeAffordanceSceneNotifier _evaluateExpectsViewServiceObservers]((uint64_t)v4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v4, sel__mostActiveViewServiceSessionDidChange_, CFSTR("_UIActiveViewServiceSessionDidChangeNotification"), 0);
    objc_initWeak((id *)buf, v4);
    v19 = (objc_class *)objc_opt_class();
    Name = class_getName(v19);
    v21 = (void *)MEMORY[0x1E0CB3940];
    WeakRetained = objc_loadWeakRetained((id *)&v4->_scene);
    objc_msgSend(WeakRetained, "_sceneIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("UIKit - %s - %@"), Name, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = MEMORY[0x1E0C80D38];
    objc_copyWeak(&v29, (id *)buf);
    BSLogAddStateCaptureBlockWithTitle();
    v26 = objc_claimAutoreleasedReturnValue();
    stateCaptureToken = v4->_stateCaptureToken;
    v4->_stateCaptureToken = (BSInvalidatable *)v26;

    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)buf);

  }
  return v4;
}

- (void)_evaluateExpectsViewServiceObservers
{
  id WeakRetained;
  void *v3;
  char v4;
  void *v5;
  int v6;
  unint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  NSObject *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_FBSScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = 0;
    }
    else
    {
      +[_UIActiveViewServiceSessionTracker sharedTracker](_UIActiveViewServiceSessionTracker, "sharedTracker");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[_UIActiveViewServiceSessionTracker hasTrackedSessions]((uint64_t)v5);

      if (v6)
        v4 = 2;
      else
        v4 = 0;
    }
    *(_BYTE *)(a1 + 8) = *(_BYTE *)(a1 + 8) & 0xFD | v4;

    v7 = _evaluateExpectsViewServiceObservers___s_category;
    if (!_evaluateExpectsViewServiceObservers___s_category)
    {
      v7 = __UILogCategoryGetNode("HomeAffordanceObservation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&_evaluateExpectsViewServiceObservers___s_category);
    }
    if ((*(_BYTE *)v7 & 1) != 0)
    {
      v8 = *(NSObject **)(v7 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        if ((*(_BYTE *)(a1 + 8) & 2) != 0)
          v9 = CFSTR("YES");
        else
          v9 = CFSTR("NO");
        v10 = v8;
        objc_msgSend((id)a1, "succinctDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412546;
        v13 = v9;
        v14 = 2112;
        v15 = v11;
        _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Updating expectation of legacy view service home affordance observers to: %@; notifier: %@",
          (uint8_t *)&v12,
          0x16u);

      }
    }
  }
}

- (void)_reset
{
  NSMutableSet *registeredObserverRecords;
  CGSize v4;
  NSMapTable *viewServiceWindowToHomeAffordanceSceneReferenceFrames;

  registeredObserverRecords = self->_registeredObserverRecords;
  self->_registeredObserverRecords = 0;

  -[_UIHomeAffordanceSceneNotifier _evaluateExpectsViewServiceObservers]((uint64_t)self);
  v4 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  self->_homeAffordanceSceneReferenceFrameForScene.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  self->_homeAffordanceSceneReferenceFrameForScene.size = v4;
  viewServiceWindowToHomeAffordanceSceneReferenceFrames = self->_viewServiceWindowToHomeAffordanceSceneReferenceFrames;
  self->_viewServiceWindowToHomeAffordanceSceneReferenceFrames = 0;

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
    v5 = _sceneWillInvalidate____s_category;
    if (!_sceneWillInvalidate____s_category)
    {
      v5 = __UILogCategoryGetNode("HomeAffordanceObservation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&_sceneWillInvalidate____s_category);
    }
    v6 = *(id *)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[_UIHomeAffordanceSceneNotifier succinctDescription](self, "succinctDescription");
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
    -[_UIHomeAffordanceSceneNotifier _reset](self, "_reset");
    -[BSInvalidatable invalidate](self->_stateCaptureToken, "invalidate");
  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[BSInvalidatable invalidate](self->_stateCaptureToken, "invalidate");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = CFSTR("_UIActiveViewServiceSessionDidChangeNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5.receiver = self;
  v5.super_class = (Class)_UIHomeAffordanceSceneNotifier;
  -[_UIHomeAffordanceSceneNotifier dealloc](&v5, sel_dealloc);
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
  -[_UIHomeAffordanceSceneNotifier _scene](self, "_scene");
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
        v8 = _unregisterHomeAffordanceObserverForRecord____s_category;
        if (!_unregisterHomeAffordanceObserverForRecord____s_category)
        {
          v8 = __UILogCategoryGetNode("HomeAffordanceObservation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v8, (unint64_t *)&_unregisterHomeAffordanceObserverForRecord____s_category);
        }
        v9 = *(NSObject **)(v8 + 8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = v9;
          -[_UIHomeAffordanceObservationRecord observer]((id *)a3);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIHomeAffordanceSceneNotifier succinctDescription](self, "succinctDescription");
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
    }
  }
}

- (id)registerHomeAffordanceObserver:(id)a3 inWindow:(id)a4
{
  void *v7;
  void *v8;
  char v9;
  id v10;
  id v11;
  _UIHomeAffordanceObservationRecord *v12;
  id *v13;
  NSMutableSet *registeredObserverRecords;
  NSMutableSet *v15;
  NSMutableSet *v16;
  unint64_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  BOOL v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[_UIHomeAffordanceSceneNotifier _scene](self, "_scene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "_hasInvalidated");

    if ((v9 & 1) != 0
      || (v22 = 0,
          !_UIHomeAffordanceValidateObserver(self, a3, a4, (*(_BYTE *)&self->_flags & 2) != 0, &v22)))
    {
      v8 = 0;
    }
    else
    {
      if (v22)
        v10 = a4;
      else
        v10 = 0;
      v11 = v10;
      v12 = [_UIHomeAffordanceObservationRecord alloc];
      v13 = -[_UIHomeAffordanceObservationRecord initWithObserver:forLegacyViewService:scopedWindow:](v12, a3, v22, v11);

      registeredObserverRecords = self->_registeredObserverRecords;
      if (!registeredObserverRecords)
      {
        v15 = (NSMutableSet *)objc_opt_new();
        v16 = self->_registeredObserverRecords;
        self->_registeredObserverRecords = v15;

        registeredObserverRecords = self->_registeredObserverRecords;
      }
      -[NSMutableSet addObject:](registeredObserverRecords, "addObject:", v13);
      _UIHomeAffordanceRegistrationTokenForNotifierAndRecord(self, (uint64_t)v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_variant_has_internal_diagnostics())
      {
        v18 = registerHomeAffordanceObserver_inWindow____s_category;
        if (!registerHomeAffordanceObserver_inWindow____s_category)
        {
          v18 = __UILogCategoryGetNode("HomeAffordanceObservation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v18, (unint64_t *)&registerHomeAffordanceObserver_inWindow____s_category);
        }
        v19 = *(NSObject **)(v18 + 8);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = v19;
          -[_UIHomeAffordanceSceneNotifier succinctDescription](self, "succinctDescription");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v24 = a3;
          v25 = 2114;
          v26 = v8;
          v27 = 2114;
          v28 = v21;
          _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_DEFAULT, "Registered home affordance observer: %{public}@; token: %{public}@; notifier: %{public}@",
            buf,
            0x20u);

        }
      }

    }
  }
  return v8;
}

- (CGRect)homeAffordanceSceneReferenceFrameForWindow:(id)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if (a3)
    {
      -[NSMapTable objectForKey:](self->_viewServiceWindowToHomeAffordanceSceneReferenceFrames, "objectForKey:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "CGRectValue");
      x = v9;
      y = v10;
      width = v11;
      height = v12;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIHomeAffordanceSceneNotifier.m"), 574, CFSTR("Invalid home affordance frame request in legacy view service with nil window"));

      x = *MEMORY[0x1E0C9D648];
      y = *(double *)(MEMORY[0x1E0C9D648] + 8);
      width = *(double *)(MEMORY[0x1E0C9D648] + 16);
      height = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
  }
  else
  {
    x = self->_homeAffordanceSceneReferenceFrameForScene.origin.x;
    y = self->_homeAffordanceSceneReferenceFrameForScene.origin.y;
    width = self->_homeAffordanceSceneReferenceFrameForScene.size.width;
    height = self->_homeAffordanceSceneReferenceFrameForScene.size.height;
  }
  v15 = x;
  v16 = y;
  v17 = width;
  v18 = height;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)cleanupForDetachingWindow:(id)a3
{
  -[NSMapTable removeObjectForKey:](self->_viewServiceWindowToHomeAffordanceSceneReferenceFrames, "removeObjectForKey:", a3);
}

- (void)_homeAffordanceSceneUpdateSource:(CGFloat)a3 frameDidChange:(CGFloat)a4
{
  void *v12;
  void *v13;
  char v14;
  id WeakRetained;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;
  CGRect v33;
  CGRect v34;

  v32 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend((id)a1, "_scene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = v12;
      v14 = objc_msgSend(v12, "_hasInvalidated");

      if ((v14 & 1) == 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
        objc_msgSend(WeakRetained, "_FBSScene");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "_homeAffordanceClientSceneComponent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17 == a2)
        {
          if ((*(_BYTE *)(a1 + 8) & 2) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_loadWeakRetained((id *)(a1 + 32));
            objc_msgSend(v21, "succinctDescription");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)a1, "succinctDescription");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", sel__homeAffordanceSceneUpdateSource_frameDidChange_, a1, CFSTR("_UIHomeAffordanceSceneNotifier.m"), 604, CFSTR("Unexpected FrontBoard-based scene update for scene: %@; notifier: %@"),
              v22,
              v23);

          }
          else
          {
            v33.origin.x = a3;
            v33.origin.y = a4;
            v33.size.width = a5;
            v33.size.height = a6;
            if (!CGRectEqualToRect(v33, *(CGRect *)(a1 + 56)))
            {
              v19 = _homeAffordanceSceneUpdateSource_frameDidChange____s_category;
              if (!_homeAffordanceSceneUpdateSource_frameDidChange____s_category)
              {
                v19 = __UILogCategoryGetNode("HomeAffordanceObservation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                atomic_store(v19, (unint64_t *)&_homeAffordanceSceneUpdateSource_frameDidChange____s_category);
              }
              if ((*(_BYTE *)v19 & 1) != 0)
              {
                v24 = *(NSObject **)(v19 + 8);
                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                {
                  v25 = v24;
                  v34.origin.x = a3;
                  v34.origin.y = a4;
                  v34.size.width = a5;
                  v34.size.height = a6;
                  NSStringFromCGRect(v34);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend((id)a1, "succinctDescription");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v29 = v26;
                  v30 = 2112;
                  v31 = v27;
                  _os_log_impl(&dword_185066000, v25, OS_LOG_TYPE_ERROR, "Received home affordance frame change for scene: %@; notifier: %@",
                    buf,
                    0x16u);

                }
              }
              *(CGFloat *)(a1 + 56) = a3;
              *(CGFloat *)(a1 + 64) = a4;
              *(CGFloat *)(a1 + 72) = a5;
              *(CGFloat *)(a1 + 80) = a6;
              _UIHomeAffordanceNotifyObserversFrameDidChange((void *)a1, a3, a4, a5, a6);
            }
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", sel__homeAffordanceSceneUpdateSource_frameDidChange_, a1, CFSTR("_UIHomeAffordanceSceneNotifier.m"), 598, CFSTR("Unexpected frame update from other FrontBoard-based scene component: %@; notifier component: %@"),
            a2,
            v17);

        }
      }
    }
  }
}

- (void)_homeAffordanceSceneUpdateSource:(uint64_t)a3 doubleTapGestureDidSucceed:
{
  void *v6;
  void *v7;
  char v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend((id)a1, "_scene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = v6;
      v8 = objc_msgSend(v6, "_hasInvalidated");

      if ((v8 & 1) == 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
        objc_msgSend(WeakRetained, "_FBSScene");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_homeAffordanceClientSceneComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 == a2)
        {
          if ((*(_BYTE *)(a1 + 8) & 2) == 0)
          {
            v13 = _homeAffordanceSceneUpdateSource_doubleTapGestureDidSucceed____s_category;
            if (!_homeAffordanceSceneUpdateSource_doubleTapGestureDidSucceed____s_category)
            {
              v13 = __UILogCategoryGetNode("HomeAffordanceObservation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v13, (unint64_t *)&_homeAffordanceSceneUpdateSource_doubleTapGestureDidSucceed____s_category);
            }
            if ((*(_BYTE *)v13 & 1) != 0)
            {
              v17 = *(NSObject **)(v13 + 8);
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                v18 = v17;
                objc_msgSend((id)a1, "succinctDescription");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 67109378;
                v21 = a3;
                v22 = 2114;
                v23 = v19;
                _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "Received doubleTapGestureDidSucceed for scene: %d; notifier: %{public}@",
                  buf,
                  0x12u);

              }
            }
            _UIHomeAffordanceNotifyObserversDoubleTapGestureDidSucceed((void *)a1, a3);
            goto LABEL_13;
          }
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_loadWeakRetained((id *)(a1 + 32));
          objc_msgSend(v14, "succinctDescription");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)a1, "succinctDescription");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel__homeAffordanceSceneUpdateSource_doubleTapGestureDidSucceed_, a1, CFSTR("_UIHomeAffordanceSceneNotifier.m"), 632, CFSTR("Unexpected FrontBoard-based scene update for scene: %@; notifier: %@"),
            v15,
            v16);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel__homeAffordanceSceneUpdateSource_doubleTapGestureDidSucceed_, a1, CFSTR("_UIHomeAffordanceSceneNotifier.m"), 626, CFSTR("Unexpected didSucceed update from other FrontBoard-based scene component: %@; notifier component: %@"),
            a2,
            v11);
        }

LABEL_13:
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
  v7[2] = __60___UIHomeAffordanceSceneNotifier_appendDescriptionToStream___block_invoke;
  v7[3] = &unk_1E16B1B50;
  v7[4] = a3;
  v7[5] = self;
  objc_msgSend(a3, "appendProem:block:", self, v7);
  if (objc_msgSend(a3, "hasDebugStyle"))
  {
    v6[0] = v5;
    v6[1] = 3221225472;
    v6[2] = __60___UIHomeAffordanceSceneNotifier_appendDescriptionToStream___block_invoke_2;
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
  objc_storeStrong((id *)&self->_viewServiceWindowToHomeAffordanceSceneReferenceFrames, 0);
  objc_storeStrong((id *)&self->_registeredObserverRecords, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_stateCaptureToken, 0);
}

@end
