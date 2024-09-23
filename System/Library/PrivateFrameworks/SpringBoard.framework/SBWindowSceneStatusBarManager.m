@implementation SBWindowSceneStatusBarManager

- (UIStatusBar)statusBar
{
  return self->_statusBar;
}

- (void)setAvoidanceFrame:(CGRect)a3 reason:(id)a4 statusBar:(id)a5 animationSettings:(id)a6 options:(unint64_t)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  NSMapTable *instanceAvoidanceFrames;
  NSMapTable *v22;
  NSMapTable *v23;
  void *v24;
  NSMutableDictionary *v25;
  NSMutableDictionary *globalAvoidanceFrames;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  SBStatusBarReusePool *reusePool;
  id v37;
  id v38;
  void *v39;
  _QWORD v40[4];
  _QWORD v41[5];
  id v42;
  id v43;
  double v44;
  double v45;
  double v46;
  double v47;
  unint64_t v48;
  _QWORD v49[4];
  _QWORD v50[4];
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v57 = *MEMORY[0x1E0C80C00];
  v16 = a4;
  v17 = a5;
  v18 = a6;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWindowSceneStatusBarManager.m"), 150, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason != nil"));

  }
  SBLogStatusBarish();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(CGFloat *)v50 = x;
    *(CGFloat *)&v50[1] = y;
    *(CGFloat *)&v50[2] = width;
    *(CGFloat *)&v50[3] = height;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v50, "{CGRect={CGPoint=dd}{CGSize=dd}}");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v52 = v20;
    v53 = 2114;
    v54 = v16;
    v55 = 2048;
    v56 = v17;
    _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_INFO, "setAvoidanceFrame:%@ reason: %{public}@ statusBar: %p", buf, 0x20u);

  }
  if (v17)
  {
    instanceAvoidanceFrames = self->_instanceAvoidanceFrames;
    if (!instanceAvoidanceFrames)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
      v22 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      v23 = self->_instanceAvoidanceFrames;
      self->_instanceAvoidanceFrames = v22;

      instanceAvoidanceFrames = self->_instanceAvoidanceFrames;
    }
    *(CGFloat *)v40 = x;
    *(CGFloat *)&v40[1] = y;
    *(CGFloat *)&v40[2] = width;
    *(CGFloat *)&v40[3] = height;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v40, "{CGRect={CGPoint=dd}{CGSize=dd}}");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](instanceAvoidanceFrames, "setObject:forKey:", v24, v17);

    -[SBWindowSceneStatusBarManager _globalAvoidanceFrame](self, "_globalAvoidanceFrame");
    -[SBWindowSceneStatusBarManager _applyAvoidanceFrameToStatusBar:withGlobalAvoidanceFrame:animationSettings:reason:options:](self, "_applyAvoidanceFrameToStatusBar:withGlobalAvoidanceFrame:animationSettings:reason:options:", v17, v18, v16, a7);
  }
  else
  {
    if (!self->_globalAvoidanceFrames)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v25 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      globalAvoidanceFrames = self->_globalAvoidanceFrames;
      self->_globalAvoidanceFrames = v25;

    }
    *(CGFloat *)v49 = x;
    *(CGFloat *)&v49[1] = y;
    *(CGFloat *)&v49[2] = width;
    *(CGFloat *)&v49[3] = height;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v49, "{CGRect={CGPoint=dd}{CGSize=dd}}");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_globalAvoidanceFrames, "setObject:forKeyedSubscript:", v27, v16);

    -[SBWindowSceneStatusBarManager _globalAvoidanceFrame](self, "_globalAvoidanceFrame");
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    reusePool = self->_reusePool;
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __94__SBWindowSceneStatusBarManager_setAvoidanceFrame_reason_statusBar_animationSettings_options___block_invoke;
    v41[3] = &unk_1E8E9EF58;
    v41[4] = self;
    v44 = v28;
    v45 = v30;
    v46 = v32;
    v47 = v34;
    v37 = v18;
    v42 = v37;
    v38 = v16;
    v43 = v38;
    v48 = a7;
    -[SBStatusBarReusePool enumerateStatusBars:](reusePool, "enumerateStatusBars:", v41);
    -[SBWindowSceneStatusBarManager _applyAvoidanceFrameToStatusBar:withGlobalAvoidanceFrame:animationSettings:reason:options:](self, "_applyAvoidanceFrameToStatusBar:withGlobalAvoidanceFrame:animationSettings:reason:options:", self->_statusBar, v37, v38, a7, v29, v31, v33, v35);

  }
}

- (CGRect)_globalAvoidanceFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;
  CGRect result;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[NSMutableDictionary allValues](self->_globalAvoidanceFrames, "allValues", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v11), "CGRectValue");
        -[SBWindowSceneStatusBarManager _combineAvoidanceFrame:withFrame:](self, "_combineAvoidanceFrame:withFrame:", v4, v3, v6, v5, v12, v13, v14, v15);
        v4 = v16;
        v3 = v17;
        v6 = v18;
        v5 = v19;
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v9);
  }

  v20 = v4;
  v21 = v3;
  v22 = v6;
  v23 = v5;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (void)_applyAvoidanceFrameToStatusBar:(id)a3 withGlobalAvoidanceFrame:(CGRect)a4 animationSettings:(id)a5 reason:(id)a6 options:(unint64_t)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[4];
  uint8_t v47[128];
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v54 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a5;
  v17 = a6;
  -[NSMapTable objectForKey:](self->_instanceAvoidanceFrames, "objectForKey:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "CGRectValue");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  -[SBWindowSceneStatusBarManager _combineAvoidanceFrame:withFrame:](self, "_combineAvoidanceFrame:withFrame:", x, y, width, height, v20, v22, v24, v26);
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  SBLogStatusBarish();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(double *)v46 = v28;
    *(double *)&v46[1] = v30;
    *(double *)&v46[2] = v32;
    *(double *)&v46[3] = v34;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v46, "{CGRect={CGPoint=dd}{CGSize=dd}}");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v49 = v36;
    v50 = 2048;
    v51 = v15;
    v52 = 2114;
    v53 = v17;
    _os_log_impl(&dword_1D0540000, v35, OS_LOG_TYPE_INFO, "setting avoidanceFrame %@ on statusBar %p for reason: %{public}@", buf, 0x20u);

  }
  objc_msgSend(v15, "setAvoidanceFrame:animationSettings:options:", v16, a7, v28, v30, v32, v34);
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[NSHashTable allObjects](self->_observers, "allObjects", 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v43;
    do
    {
      v41 = 0;
      do
      {
        if (*(_QWORD *)v43 != v40)
          objc_enumerationMutation(v37);
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v41++), "statusBarManager:didUpdateAvoidanceFrameForStatusBar:withAnimationSettings:", self, v15, v16);
      }
      while (v39 != v41);
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v39);
  }

}

- (CGRect)_combineAvoidanceFrame:(CGRect)a3 withFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect result;
  CGRect v20;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  if (!CGRectIsEmpty(a3))
  {
    v16.origin.x = x;
    v16.origin.y = y;
    v16.size.width = width;
    v16.size.height = height;
    if (CGRectIsEmpty(v16))
    {
      height = v8;
      width = v9;
      y = v10;
      x = v11;
    }
    else
    {
      v17.origin.x = v11;
      v17.origin.y = v10;
      v17.size.width = v9;
      v17.size.height = v8;
      v20.origin.x = x;
      v20.origin.y = y;
      v20.size.width = width;
      v20.size.height = height;
      v18 = CGRectUnion(v17, v20);
      x = v18.origin.x;
      y = v18.origin.y;
      width = v18.size.width;
      height = v18.size.height;
    }
  }
  v12 = x;
  v13 = y;
  v14 = width;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)setAvoidanceFrame:(CGRect)a3 reason:(id)a4 statusBar:(id)a5 animationSettings:(id)a6
{
  -[SBWindowSceneStatusBarManager setAvoidanceFrame:reason:statusBar:animationSettings:options:](self, "setAvoidanceFrame:reason:statusBar:animationSettings:options:", a4, a5, a6, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SBWindowSceneStatusBarAssertionManager)assertionManager
{
  return self->_assertionManager;
}

- (CGRect)sb_statusBarFrameForStatusBarHeight:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  -[UIStatusBarWindow _screen](self->_statusBarWindow, "_screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_referenceBounds");

  -[SBWindowSceneStatusBarManager statusBarOrientation](self, "statusBarOrientation");
  _UIWindowConvertRectFromOrientationToOrientation();
  v9 = a3;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (int64_t)statusBarOrientation
{
  if (-[SBWindowSceneStatusBarManager _isEmbeddedDisplay](self, "_isEmbeddedDisplay"))
    return objc_msgSend((id)SBApp, "statusBarOrientationForEmbeddedDisplay");
  else
    return -[UIStatusBarWindow orientation](self->_statusBarWindow, "orientation");
}

- (BOOL)_isEmbeddedDisplay
{
  void *v2;
  char v3;

  -[UIStatusBarWindow _fbsDisplayIdentity](self->_statusBarWindow, "_fbsDisplayIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMainDisplay");

  return v3;
}

- (SBStatusBarReusePool)reusePool
{
  return self->_reusePool;
}

- (CGRect)statusBarFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  if (-[SBWindowSceneStatusBarManager isStatusBarHidden](self, "isStatusBarHidden"))
  {
    v3 = *MEMORY[0x1E0C9D648];
    v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    -[SBWindowSceneStatusBarManager statusBarHeight](self, "statusBarHeight");
    -[SBWindowSceneStatusBarManager sb_statusBarFrameForStatusBarHeight:](self, "sb_statusBarFrameForStatusBarHeight:");
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

void __47__SBWindowSceneStatusBarManager_initWithScene___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_globalAvoidanceFrame");
  objc_msgSend(WeakRetained, "_applyAvoidanceFrameToStatusBar:withGlobalAvoidanceFrame:animationSettings:reason:options:", v3, 0, CFSTR("newly created status bar"), 0);

}

- (SBWindowSceneStatusBarLayoutManager)layoutManager
{
  return self->_layoutManager;
}

+ (id)windowSceneStatusBarManagerForEmbeddedDisplay
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "embeddedDisplayWindowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "statusBarManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (SBWindowSceneStatusBarManager)initWithScene:(id)a3
{
  id v5;
  SBWindowSceneStatusBarManager *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  objc_class *v14;
  objc_class *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  SBWindowSceneStatusBarAssertionManager *v23;
  SBWindowSceneStatusBarAssertionManager *assertionManager;
  SBWindowSceneStatusBarLayoutManager *v25;
  SBWindowSceneStatusBarLayoutManager *layoutManager;
  SBStatusBarReusePool *v27;
  SBStatusBarReusePool *reusePool;
  SBStatusBarReusePool *v29;
  void *v31;
  _QWORD v32[4];
  id v33;
  id location;
  objc_super v35;

  v5 = a3;
  v35.receiver = self;
  v35.super_class = (Class)SBWindowSceneStatusBarManager;
  v6 = -[SBWindowSceneStatusBarManager initWithScene:](&v35, sel_initWithScene_, v5);
  if (v6)
  {
    v7 = objc_opt_class();
    SBSafeCast(v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SBWindowSceneStatusBarManager.m"), 65, CFSTR("SBWindowSceneStatusBarManager is only for use with SBWindowScenes"));

    }
    objc_msgSend(v8, "session");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "role");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CEBE48]);

    if (v11)
    {
      objc_msgSend((id)SBApp, "statusBarWindowForEmbeddedDisplay");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)SBApp, "statusBarForEmbeddedDisplay");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setWindowScene:", v8);
    }
    else
    {
      v14 = (objc_class *)objc_msgSend((id)objc_opt_class(), "_statusBarWindowClass");
      v15 = (objc_class *)objc_msgSend((id)objc_opt_class(), "_statusBarClass");
      v12 = (void *)objc_msgSend([v14 alloc], "initWithWindowScene:", v8);
      objc_msgSend(v12, "frame");
      v17 = v16;
      v19 = v18;
      v21 = v20;
      -[SBWindowSceneStatusBarManager defaultStatusBarHeight](v6, "defaultStatusBarHeight");
      v13 = (void *)objc_msgSend([v15 alloc], "initWithFrame:", v17, v19, v21, v22);
      objc_msgSend(v13, "setOrientation:", 1);
      objc_msgSend(v13, "setStyleDelegate:", SBApp);
      -[SBWindowSceneStatusBarManager updateStatusBarAppearance](v6, "updateStatusBarAppearance");
      objc_msgSend(v12, "setStatusBar:", v13);
      objc_msgSend(v12, "setOrientation:animationParameters:", 1, 0);
      objc_msgSend(v12, "setWindowLevel:", *MEMORY[0x1E0CEBE30]);
      objc_msgSend(v12, "_orderFrontWithoutMakingKey");
    }
    objc_storeStrong((id *)&v6->_statusBarWindow, v12);
    objc_storeStrong((id *)&v6->_statusBar, v13);
    v23 = -[SBWindowSceneStatusBarAssertionManager initWithWindowScene:]([SBWindowSceneStatusBarAssertionManager alloc], "initWithWindowScene:", v8);
    assertionManager = v6->_assertionManager;
    v6->_assertionManager = v23;

    v25 = -[SBWindowSceneStatusBarLayoutManager initWithWindowScene:]([SBWindowSceneStatusBarLayoutManager alloc], "initWithWindowScene:", v8);
    layoutManager = v6->_layoutManager;
    v6->_layoutManager = v25;

    v27 = -[SBStatusBarReusePool initWithWindowScene:]([SBStatusBarReusePool alloc], "initWithWindowScene:", v8);
    reusePool = v6->_reusePool;
    v6->_reusePool = v27;

    objc_msgSend(v13, "setManager:", v6->_assertionManager);
    objc_initWeak(&location, v6);
    v29 = v6->_reusePool;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __47__SBWindowSceneStatusBarManager_initWithScene___block_invoke;
    v32[3] = &unk_1E8E9EF30;
    objc_copyWeak(&v33, &location);
    -[SBStatusBarReusePool setNewStatusBarConfigurationHandler:](v29, "setNewStatusBarConfigurationHandler:", v32);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);

  }
  return v6;
}

- (CGRect)statusBarWindowFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[UIStatusBarWindow windowScene](self->_statusBarWindow, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_referenceBounds");

  -[UIStatusBarWindow orientation](self->_statusBarWindow, "orientation");
  _UIWindowConvertRectFromOrientationToOrientation();
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)windowSceneDidConnect:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  -[UIStatusBarWindow _sbWindowScene](self->_statusBarWindow, "_sbWindowScene");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWindowSceneStatusBarManager.m"), 116, CFSTR("should connect to the window scene our status bar window is on"));

  }
  if (SBStatusBarIsSpeakeasy())
    -[UIStatusBarWindow windowSceneDidConnect:](self->_statusBarWindow, "windowSceneDidConnect:", v7);

}

- (BOOL)isStatusBarEffectivelyHidden
{
  double v4;

  if ((-[SBWindowSceneStatusBarManager isStatusBarHidden](self, "isStatusBarHidden") & 1) != 0)
    return 1;
  -[UIStatusBar alpha](self->_statusBar, "alpha");
  return v4 == 0.0;
}

- (void)setStatusBarOrientation:(int64_t)a3
{
  if (-[SBWindowSceneStatusBarManager _isEmbeddedDisplay](self, "_isEmbeddedDisplay"))
    objc_msgSend((id)SBApp, "setStatusBarOrientation:forEmbeddedDisplayAnimated:", a3, 0);
  else
    -[UIStatusBarWindow setOrientation:animationParameters:](self->_statusBarWindow, "setOrientation:animationParameters:", a3, 0);
}

uint64_t __94__SBWindowSceneStatusBarManager_setAvoidanceFrame_reason_statusBar_animationSettings_options___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyAvoidanceFrameToStatusBar:withGlobalAvoidanceFrame:animationSettings:reason:options:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 88), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

- (CGRect)avoidanceFrameForStatusBar:(id)statusBar
{
  NSMapTable *instanceAvoidanceFrames;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  instanceAvoidanceFrames = self->_instanceAvoidanceFrames;
  if (!statusBar)
    statusBar = self->_statusBar;
  -[NSMapTable objectForKey:](instanceAvoidanceFrames, "objectForKey:", statusBar);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");

  -[SBWindowSceneStatusBarManager _globalAvoidanceFrame](self, "_globalAvoidanceFrame");
  -[SBWindowSceneStatusBarManager _combineAvoidanceFrame:withFrame:](self, "_combineAvoidanceFrame:withFrame:");
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (id)leadingStatusBarStyleRequest
{
  void *v3;
  void *v4;
  void *v5;

  if (!-[SBWindowSceneStatusBarManager isStatusBarEffectivelyHidden](self, "isStatusBarEffectivelyHidden"))
    goto LABEL_4;
  -[SBWindowSceneStatusBarManager _transientOverlayPresentationManagerActiveStatusBarStyleRequest](self, "_transientOverlayPresentationManagerActiveStatusBarStyleRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[UIStatusBarWindow _sbWindowScene](self->_statusBarWindow, "_sbWindowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "switcherController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "leadingStatusBarStyleRequest");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
LABEL_4:
      -[SBWindowSceneStatusBarAssertionManager effectiveStatusBarStyleRequestWithSettings:](self->_assertionManager, "effectiveStatusBarStyleRequestWithSettings:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (id)trailingStatusBarStyleRequest
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  if (!-[SBWindowSceneStatusBarManager isStatusBarEffectivelyHidden](self, "isStatusBarEffectivelyHidden"))
    goto LABEL_7;
  -[SBWindowSceneStatusBarManager _transientOverlayPresentationManagerActiveStatusBarStyleRequest](self, "_transientOverlayPresentationManagerActiveStatusBarStyleRequest");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[UIStatusBarWindow _sbWindowScene](self->_statusBarWindow, "_sbWindowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "switcherController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "leadingStatusBarStyleRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trailingStatusBarStyleRequest");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = v7 ? (void *)v7 : v6;
    v3 = v9;

    if (!v3)
    {
LABEL_7:
      -[SBWindowSceneStatusBarAssertionManager effectiveStatusBarStyleRequestWithSettings:](self->_assertionManager, "effectiveStatusBarStyleRequestWithSettings:", 0);
      v3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (id)_transientOverlayPresentationManagerActiveStatusBarStyleRequest
{
  void *v2;
  void *v3;
  void *v4;

  -[UIStatusBarWindow _sbWindowScene](self->_statusBarWindow, "_sbWindowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transientOverlayPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasActivePresentation"))
  {
    objc_msgSend(v3, "currentStatusBarStyleRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v3, "currentStatusBarStyleRequest");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSString)description
{
  return (NSString *)-[SBWindowSceneStatusBarManager descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBWindowSceneStatusBarManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBWindowSceneStatusBarManager descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBWindowSceneStatusBarManager *v11;

  v4 = a3;
  -[SBWindowSceneStatusBarManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__SBWindowSceneStatusBarManager_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __71__SBWindowSceneStatusBarManager_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "_sbWindowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "succinctDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "appendObject:withName:", v4, CFSTR("windowScene"));

  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72), CFSTR("status bar"));
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64), CFSTR("status bar window"));
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 112), CFSTR("layout manager"));
  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104), CFSTR("assertion manager"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 120), CFSTR("reuse pool"));
}

- (UIStatusBarWindow)statusBarWindow
{
  return self->_statusBarWindow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reusePool, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_instanceAvoidanceFrames, 0);
  objc_storeStrong((id *)&self->_globalAvoidanceFrames, 0);
  objc_storeStrong((id *)&self->_statusBar, 0);
  objc_storeStrong((id *)&self->_statusBarWindow, 0);
}

- (void)sbf_addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (void)sbf_removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

@end
