@implementation SBStatusBarReusePool

void __55__SBStatusBarReusePool__resetStatusBar_clearOverrides___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _OWORD v8[3];

  objc_msgSend(*(id *)(a1 + 32), "setHidden:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v8[0] = *MEMORY[0x1E0C9BAA8];
  v8[1] = v3;
  v8[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v8);
  objc_msgSend(*(id *)(a1 + 32), "sb_setEnabledStatusBarPartIdentifiersForStatusBarParts:", 0xFFFFLL);
  objc_msgSend(*(id *)(a1 + 32), "setStyleDelegate:", SBApp);
  objc_msgSend(*(id *)(a1 + 32), "_setDisablesRasterization:", 1);
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "sb_setLocalDataOverrides:", 0);
    objc_msgSend(*(id *)(a1 + 32), "forceUpdateData:", 0);
  }
  objc_msgSend(*(id *)(a1 + 40), "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statusBarManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setManager:", v6);
  objc_msgSend(*(id *)(a1 + 32), "statusBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOverlayData:", 0);
  objc_msgSend(v7, "setBackgroundColor:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", 0);

}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (id)getReusableStatusBarWithReason:(id)a3
{
  SBWindowScene **p_windowScene;
  id v5;
  id WeakRetained;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;

  p_windowScene = &self->_windowScene;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_windowScene);
  objc_msgSend(WeakRetained, "statusBarManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "statusBarFrame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[SBStatusBarReusePool getReusableStatusBarWithReason:withFrame:](self, "getReusableStatusBarWithReason:withFrame:", v5, v9, v11, v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)getReusableStatusBarWithReason:(id)a3 withFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  NSObject *v11;
  SBStatusBarContainer *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD);
  const __CFString *v19;
  uint64_t v20;
  int v21;
  const __CFString *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  -[NSMutableArray _sb_dequeue](self->_recycledStatusBars, "_sb_dequeue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogStatusBarish();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    if (v10)
      v19 = CFSTR("cached");
    else
      v19 = CFSTR("uncached");
    v20 = -[NSMutableArray count](self->_recycledStatusBars, "count");
    v21 = 138412802;
    v22 = v19;
    v23 = 2048;
    v24 = v20;
    v25 = 2112;
    v26 = v9;
    _os_log_debug_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEBUG, "SBStatusBarReusePool vending %@ Status Bar (cache size %lu) for reason: %@", (uint8_t *)&v21, 0x20u);
  }

  if (v10)
  {
    objc_getAssociatedObject(v10, "SBStatusBarContainerKey");
    v12 = (SBStatusBarContainer *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFrame:", x, y, width, height);
  }
  else
  {
    SBStatusBarIsSpeakeasy();
    v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", x, y, width, height);
    objc_msgSend(v10, "statusBar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    objc_msgSend(WeakRetained, "screen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTargetScreen:", v15);

    -[SBStatusBarReusePool _resetStatusBar:clearOverrides:](self, "_resetStatusBar:clearOverrides:", v10, 0);
    v12 = objc_alloc_init(SBStatusBarContainer);
    -[SBStatusBarContainer setStatusBar:](v12, "setStatusBar:", v10);
    -[SBStatusBarContainer setReusePool:](v12, "setReusePool:", self);
    -[NSHashTable addObject:](self->_statusBars, "addObject:", v12);
    objc_setAssociatedObject(v10, "SBStatusBarContainerKey", v12, (void *)0x301);
    -[SBStatusBarReusePool newStatusBarConfigurationHandler](self, "newStatusBarConfigurationHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[SBStatusBarReusePool newStatusBarConfigurationHandler](self, "newStatusBarConfigurationHandler");
      v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v17)[2](v17, v10);

    }
  }
  -[SBStatusBarContainer setReason:](v12, "setReason:", v9);

  return v10;
}

- (id)newStatusBarConfigurationHandler
{
  return self->_newStatusBarConfigurationHandler;
}

- (void)_resetStatusBar:(id)a3 clearOverrides:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  SBStatusBarReusePool *v11;
  BOOL v12;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CEABB0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__SBStatusBarReusePool__resetStatusBar_clearOverrides___block_invoke;
  v9[3] = &unk_1E8E9EE00;
  v12 = a4;
  v10 = v6;
  v11 = self;
  v8 = v6;
  objc_msgSend(v7, "_performWithoutRetargetingAnimations:", v9);
  objc_msgSend(v8, "_removeAllAnimations:", 1);

}

- (SBStatusBarReusePool)initWithWindowScene:(id)a3
{
  id v4;
  SBStatusBarReusePool *v5;
  uint64_t v6;
  NSHashTable *statusBars;
  SBStatusBarReusePoolWindow *v8;
  UIWindow *recycledStatusBarsContainerWindow;
  uint64_t v10;
  NSMutableArray *recycledStatusBars;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBStatusBarReusePool;
  v5 = -[SBStatusBarReusePool init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 1);
    statusBars = v5->_statusBars;
    v5->_statusBars = (NSHashTable *)v6;

    v8 = -[SBStatusBarReusePoolWindow initWithWindowScene:]([SBStatusBarReusePoolWindow alloc], "initWithWindowScene:", v4);
    recycledStatusBarsContainerWindow = v5->_recycledStatusBarsContainerWindow;
    v5->_recycledStatusBarsContainerWindow = &v8->super;

    -[UIWindow setHidden:](v5->_recycledStatusBarsContainerWindow, "setHidden:", 1);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    recycledStatusBars = v5->_recycledStatusBars;
    v5->_recycledStatusBars = (NSMutableArray *)v10;

    objc_storeWeak((id *)&v5->_windowScene, v4);
  }

  return v5;
}

- (void)recycleStatusBar:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableArray **p_recycledStatusBars;
  unint64_t v8;
  NSObject *v9;
  NSObject *v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_getAssociatedObject(v4, "SBStatusBarContainerKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    p_recycledStatusBars = &self->_recycledStatusBars;
    v8 = -[NSMutableArray count](self->_recycledStatusBars, "count");
    if (v8 >= -[SBStatusBarReusePool _statusBarInstanceLimit](self, "_statusBarInstanceLimit"))
    {
      objc_setAssociatedObject(v5, "SBStatusBarContainerKey", 0, (void *)0x301);
      objc_msgSend(v5, "removeFromSuperview");
      SBLogStatusBarish();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[SBStatusBarReusePool recycleStatusBar:].cold.2((id *)p_recycledStatusBars, v6);

    }
    else
    {
      SBLogStatusBarish();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[SBStatusBarReusePool recycleStatusBar:].cold.1((id *)&self->_recycledStatusBars, v6);

      objc_msgSend(v6, "setReason:", CFSTR("RecycledStatusBar"));
      -[SBStatusBarReusePool _resetStatusBar:clearOverrides:](self, "_resetStatusBar:clearOverrides:", v5, 1);
      -[UIWindow addSubview:](self->_recycledStatusBarsContainerWindow, "addSubview:", v5);
      -[NSMutableArray _sb_enqueue:](self->_recycledStatusBars, "_sb_enqueue:", v5);
    }

  }
}

- (void)enumerateStatusBars:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSHashTable allObjects](self->_statusBars, "allObjects", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "statusBar");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (unint64_t)_statusBarInstanceLimit
{
  id WeakRetained;
  void *v4;
  void *v5;
  unint64_t v6;

  if (!_os_feature_enabled_impl())
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isExternal"))
    v6 = 3;
  else
    v6 = 15;

  return v6;
}

- (void)_removeStatusBarContainer:(id)a3
{
  -[NSHashTable removeObject:](self->_statusBars, "removeObject:", a3);
}

- (NSString)description
{
  return (NSString *)-[SBStatusBarReusePool descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBStatusBarReusePool succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBStatusBarReusePool descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBStatusBarReusePool succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHashTable allObjects](self->_statusBars, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", v6, CFSTR("Status Bars"), v4, 1);

  return v5;
}

- (void)setNewStatusBarConfigurationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setWindowScene:(id)a3
{
  objc_storeWeak((id *)&self->_windowScene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong(&self->_newStatusBarConfigurationHandler, 0);
  objc_storeStrong((id *)&self->_recycledStatusBars, 0);
  objc_storeStrong((id *)&self->_recycledStatusBarsContainerWindow, 0);
  objc_storeStrong((id *)&self->_statusBars, 0);
}

- (void)recycleStatusBar:(id *)a1 .cold.1(id *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_15(a1);
  objc_msgSend(a2, "reason");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_17();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v4, v5, "SBStatusBarReusePool recycling Status Bar (cache size %lu) for reason: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_20();
}

- (void)recycleStatusBar:(id *)a1 .cold.2(id *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_15(a1);
  objc_msgSend(a2, "reason");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_17();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v4, v5, "SBStatusBarReusePool NOT recycling Status Bar (cache size %lu) for reason: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_20();
}

@end
