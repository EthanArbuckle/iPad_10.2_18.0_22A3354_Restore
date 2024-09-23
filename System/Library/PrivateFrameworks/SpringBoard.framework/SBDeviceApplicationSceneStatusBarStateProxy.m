@implementation SBDeviceApplicationSceneStatusBarStateProxy

- (SBDeviceApplicationSceneStatusBarStateProxy)initWithDeviceApplicationSceneHandle:(id)a3
{
  id v4;
  SBDeviceApplicationSceneStatusBarStateProxy *v5;
  SBDeviceApplicationSceneStatusBarStateProxy *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBDeviceApplicationSceneStatusBarStateProxy;
  v5 = -[SBDeviceApplicationSceneStatusBarStateProvider_Base init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_deviceApplicationSceneHandle, v4);
    objc_msgSend(v4, "statusBarStateProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v6->_stateProvider, v7);
    objc_msgSend(v7, "addStatusBarObserver:", v6);

  }
  return v6;
}

- (void)invalidateStatusBarSettings
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_stateProvider);
  objc_msgSend(WeakRetained, "invalidateStatusBarSettings");

}

- (int64_t)_statusBarStyle
{
  id WeakRetained;
  int64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_stateProvider);
  v3 = objc_msgSend(WeakRetained, "_statusBarStyle");

  return v3;
}

- (id)_statusBarPartStyles
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_stateProvider);
  objc_msgSend(WeakRetained, "_statusBarPartStyles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)_statusBarStyleForPartWithIdentifier:(id)a3 suppressingInherited:(BOOL)a4
{
  SBDeviceApplicationSceneStatusBarStateProvider **p_stateProvider;
  id v6;
  id WeakRetained;
  int64_t v8;

  p_stateProvider = &self->_stateProvider;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_stateProvider);
  v8 = objc_msgSend(WeakRetained, "_statusBarStyleForPartWithIdentifier:suppressingInherited:", v6, -[SBDeviceApplicationSceneStatusBarStateProxy _suppressInheritedPartStyles](self, "_suppressInheritedPartStyles"));

  return v8;
}

- (double)_statusBarAlpha
{
  id WeakRetained;
  double v3;
  double v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_stateProvider);
  objc_msgSend(WeakRetained, "_statusBarAlpha");
  v4 = v3;

  return v4;
}

- (BOOL)_statusBarHiddenGivenFallbackOrientation:(int64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_stateProvider);
  LOBYTE(a3) = objc_msgSend(WeakRetained, "_statusBarHiddenGivenFallbackOrientation:", a3);

  return a3;
}

- (int64_t)_statusBarOrientationGivenFallbackOrientation:(int64_t)a3
{
  id WeakRetained;
  int64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_stateProvider);
  v5 = objc_msgSend(WeakRetained, "_statusBarOrientationGivenFallbackOrientation:", a3);

  return v5;
}

- (id)backgroundActivitiesToSuppress
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_stateProvider);
  objc_msgSend(WeakRetained, "backgroundActivitiesToSuppress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGRect)statusBarAvoidanceFrame
{
  id WeakRetained;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_stateProvider);
  objc_msgSend(WeakRetained, "statusBarAvoidanceFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)sceneWantsDeviceOrientationEventsEnabled
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_stateProvider);
  v3 = objc_msgSend(WeakRetained, "sceneWantsDeviceOrientationEventsEnabled");

  return v3;
}

- (id)overlayStatusBarData
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_stateProvider);
  objc_msgSend(WeakRetained, "overlayStatusBarData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)breadcrumbProvider
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_stateProvider);
  objc_msgSend(WeakRetained, "breadcrumbProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)statusBarSceneIdentifier
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_stateProvider);
  objc_msgSend(WeakRetained, "statusBarSceneIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)classicApplicationSceneHandleIfExists
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_stateProvider);
  objc_msgSend(WeakRetained, "classicApplicationSceneHandleIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)sceneToHandleStatusBarTapIfExists
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_stateProvider);
  objc_msgSend(WeakRetained, "sceneToHandleStatusBarTapIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)_fallbackInterfaceOrientation
{
  id WeakRetained;
  int64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_deviceApplicationSceneHandle);
  v3 = objc_msgSend(WeakRetained, "defaultInterfaceOrientation");

  return v3;
}

- (BOOL)_suppressInheritedPartStyles
{
  return 0;
}

- (BOOL)_statusBarAppearsOutsideOfAJailedApp
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_stateProvider);
  v3 = objc_msgSend(WeakRetained, "_statusBarAppearsOutsideOfAJailedApp");

  return v3;
}

- (int64_t)_defaultStatusBarStyle
{
  id WeakRetained;
  int64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_stateProvider);
  v3 = objc_msgSend(WeakRetained, "_defaultStatusBarStyle");

  return v3;
}

- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarStyleTo:(int64_t)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[SBDeviceApplicationSceneStatusBarStateProvider_Base statusBarStyle](self, "statusBarStyle");
  if (v7 != a4)
  {
    SBLogAppStatusBars();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = (void *)objc_opt_class();
      v10 = v9;
      _SBStringFromStatusBarStyle(v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _SBStringFromStatusBarStyle(a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v17 = v6;
      v18 = 2112;
      v19 = v9;
      v20 = 2112;
      v21 = v11;
      v22 = 2112;
      v23 = v12;
      _os_log_debug_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEBUG, "(%@) %@ Using our overridden style %@ (was provided %@)", buf, 0x2Au);

    }
  }
  if (-[SBDeviceApplicationSceneStatusBarStateProxy _anyObserverWants:](self, "_anyObserverWants:", sel_sceneWithIdentifier_didChangeStatusBarStyleTo_))
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __93__SBDeviceApplicationSceneStatusBarStateProxy_sceneWithIdentifier_didChangeStatusBarStyleTo___block_invoke;
    v13[3] = &unk_1E8EA2630;
    v14 = v6;
    v15 = v7;
    -[SBDeviceApplicationSceneStatusBarStateProvider_Base enumerateObserversWithBlock:](self, "enumerateObserversWithBlock:", v13);

  }
}

uint64_t __93__SBDeviceApplicationSceneStatusBarStateProxy_sceneWithIdentifier_didChangeStatusBarStyleTo___block_invoke(uint64_t result, void *a2, char a3)
{
  if ((a3 & 1) != 0)
    return objc_msgSend(a2, "sceneWithIdentifier:didChangeStatusBarStyleTo:", *(_QWORD *)(result + 32), *(_QWORD *)(result + 40));
  return result;
}

- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarStyleTo:(int64_t)a4 forPartWithIdentifier:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = -[SBDeviceApplicationSceneStatusBarStateProvider_Base statusBarStyleForPartWithIdentifier:](self, "statusBarStyleForPartWithIdentifier:", v9);
  if (v10 != a4)
  {
    SBLogAppStatusBars();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = (void *)objc_opt_class();
      v13 = v12;
      _SBStringFromStatusBarStyle(v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      _SBStringFromStatusBarStyle(a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v21 = v8;
      v22 = 2112;
      v23 = v12;
      v24 = 2112;
      v25 = v14;
      v26 = 2112;
      v27 = v9;
      v28 = 2112;
      v29 = v15;
      _os_log_debug_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEBUG, "(%@) %@ Using our overridden style %@ for %@ (was provided %@)", buf, 0x34u);

    }
  }
  if (-[SBDeviceApplicationSceneStatusBarStateProxy _anyObserverWants:](self, "_anyObserverWants:", sel_sceneWithIdentifier_didChangeStatusBarStyleTo_forPartWithIdentifier_))
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __115__SBDeviceApplicationSceneStatusBarStateProxy_sceneWithIdentifier_didChangeStatusBarStyleTo_forPartWithIdentifier___block_invoke;
    v16[3] = &unk_1E8EB5A78;
    v17 = v8;
    v19 = v10;
    v18 = v9;
    -[SBDeviceApplicationSceneStatusBarStateProvider_Base enumerateObserversWithBlock:](self, "enumerateObserversWithBlock:", v16);

  }
}

_QWORD *__115__SBDeviceApplicationSceneStatusBarStateProxy_sceneWithIdentifier_didChangeStatusBarStyleTo_forPartWithIdentifier___block_invoke(_QWORD *result, void *a2, char a3)
{
  if ((a3 & 2) != 0)
    return (_QWORD *)objc_msgSend(a2, "sceneWithIdentifier:didChangeStatusBarStyleTo:forPartWithIdentifier:", result[4], result[6], result[5]);
  return result;
}

- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarAlphaTo:(double)a4
{
  id v6;
  double v7;
  double v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  double v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  double v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SBDeviceApplicationSceneStatusBarStateProvider_Base statusBarAlpha](self, "statusBarAlpha");
  v8 = v7;
  if (v7 != a4)
  {
    SBLogAppStatusBars();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      v15 = v6;
      v16 = 2112;
      v17 = (id)objc_opt_class();
      v18 = 2048;
      v19 = v8;
      v20 = 2048;
      v21 = a4;
      v10 = v17;
      _os_log_debug_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEBUG, "(%@) %@ Using our overridden alpha %1.1f (was provided %1.1f)", buf, 0x2Au);

    }
  }
  if (-[SBDeviceApplicationSceneStatusBarStateProxy _anyObserverWants:](self, "_anyObserverWants:", sel_sceneWithIdentifier_didChangeStatusBarAlphaTo_))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __93__SBDeviceApplicationSceneStatusBarStateProxy_sceneWithIdentifier_didChangeStatusBarAlphaTo___block_invoke;
    v11[3] = &unk_1E8EA2630;
    v12 = v6;
    v13 = v8;
    -[SBDeviceApplicationSceneStatusBarStateProvider_Base enumerateObserversWithBlock:](self, "enumerateObserversWithBlock:", v11);

  }
}

uint64_t __93__SBDeviceApplicationSceneStatusBarStateProxy_sceneWithIdentifier_didChangeStatusBarAlphaTo___block_invoke(uint64_t result, void *a2, char a3)
{
  if ((a3 & 4) != 0)
    return objc_msgSend(a2, "sceneWithIdentifier:didChangeStatusBarAlphaTo:", *(_QWORD *)(result + 32), *(double *)(result + 40));
  return result;
}

- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarHiddenTo:(BOOL)a4 withAnimation:(int64_t)a5
{
  int v6;
  id v8;
  int v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  int64_t v14;
  char v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v6 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = -[SBDeviceApplicationSceneStatusBarStateProvider_Base statusBarHidden](self, "statusBarHidden");
  if (v9 != v6)
  {
    SBLogAppStatusBars();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      v17 = v8;
      v18 = 2112;
      v19 = (id)objc_opt_class();
      v20 = 1024;
      v21 = v9;
      v22 = 1024;
      v23 = v6;
      v11 = v19;
      _os_log_debug_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEBUG, "(%@) %@ Using our overridden hidden %{BOOL}u (was provided %{BOOL}u)", buf, 0x22u);

    }
  }
  if (-[SBDeviceApplicationSceneStatusBarStateProxy _anyObserverWants:](self, "_anyObserverWants:", sel_sceneWithIdentifier_didChangeStatusBarHiddenTo_withAnimation_))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __108__SBDeviceApplicationSceneStatusBarStateProxy_sceneWithIdentifier_didChangeStatusBarHiddenTo_withAnimation___block_invoke;
    v12[3] = &unk_1E8EA26A8;
    v15 = v9;
    v13 = v8;
    v14 = a5;
    -[SBDeviceApplicationSceneStatusBarStateProvider_Base enumerateObserversWithBlock:](self, "enumerateObserversWithBlock:", v12);

  }
}

uint64_t __108__SBDeviceApplicationSceneStatusBarStateProxy_sceneWithIdentifier_didChangeStatusBarHiddenTo_withAnimation___block_invoke(uint64_t result, void *a2, char a3)
{
  if ((a3 & 8) != 0)
    return objc_msgSend(a2, "sceneWithIdentifier:didChangeStatusBarHiddenTo:withAnimation:", *(_QWORD *)(result + 32), *(unsigned __int8 *)(result + 48), *(_QWORD *)(result + 40));
  return result;
}

- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarOrientationTo:(int64_t)a4
{
  id v6;
  int64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  int64_t v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[SBDeviceApplicationSceneStatusBarStateProvider_Base statusBarOrientation](self, "statusBarOrientation");
  if (v7 != a4)
  {
    SBLogAppStatusBars();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = (void *)objc_opt_class();
      v10 = v9;
      BSInterfaceOrientationDescription();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      BSInterfaceOrientationDescription();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v17 = v6;
      v18 = 2112;
      v19 = v9;
      v20 = 2112;
      v21 = v11;
      v22 = 2112;
      v23 = v12;
      _os_log_debug_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEBUG, "(%@) %@ Using our overridden orientation %@ (was provided %@)", buf, 0x2Au);

    }
  }
  if (-[SBDeviceApplicationSceneStatusBarStateProxy _anyObserverWants:](self, "_anyObserverWants:", sel_sceneWithIdentifier_didChangeStatusBarOrientationTo_))
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __99__SBDeviceApplicationSceneStatusBarStateProxy_sceneWithIdentifier_didChangeStatusBarOrientationTo___block_invoke;
    v13[3] = &unk_1E8EA2630;
    v14 = v6;
    v15 = v7;
    -[SBDeviceApplicationSceneStatusBarStateProvider_Base enumerateObserversWithBlock:](self, "enumerateObserversWithBlock:", v13);

  }
}

uint64_t __99__SBDeviceApplicationSceneStatusBarStateProxy_sceneWithIdentifier_didChangeStatusBarOrientationTo___block_invoke(uint64_t result, void *a2, char a3)
{
  if ((a3 & 0x10) != 0)
    return objc_msgSend(a2, "sceneWithIdentifier:didChangeStatusBarOrientationTo:", *(_QWORD *)(result + 32), *(_QWORD *)(result + 40));
  return result;
}

- (void)sceneWithIdentifier:(id)a3 didChangeBackgroundActivitiesToSuppressTo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SBDeviceApplicationSceneStatusBarStateProxy backgroundActivitiesToSuppress](self, "backgroundActivitiesToSuppress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BSEqualSets() & 1) == 0)
  {
    SBLogAppStatusBars();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = (void *)objc_opt_class();
      v11 = v10;
      STBackgroundActivityIdentifiersDescription();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      STBackgroundActivityIdentifiersDescription();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v18 = v6;
      v19 = 2112;
      v20 = v10;
      v21 = 2112;
      v22 = v12;
      v23 = 2112;
      v24 = v13;
      _os_log_debug_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEBUG, "(%@) %@ Using our overridden backgroundActivitiesToSuppress %@ (was provided %@)", buf, 0x2Au);

    }
  }
  if (-[SBDeviceApplicationSceneStatusBarStateProxy _anyObserverWants:](self, "_anyObserverWants:", sel_sceneWithIdentifier_didChangeBackgroundActivitiesToSuppressTo_))
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __109__SBDeviceApplicationSceneStatusBarStateProxy_sceneWithIdentifier_didChangeBackgroundActivitiesToSuppressTo___block_invoke;
    v14[3] = &unk_1E8EA2720;
    v15 = v6;
    v16 = v7;
    -[SBDeviceApplicationSceneStatusBarStateProvider_Base enumerateObserversWithBlock:](self, "enumerateObserversWithBlock:", v14);

  }
}

uint64_t __109__SBDeviceApplicationSceneStatusBarStateProxy_sceneWithIdentifier_didChangeBackgroundActivitiesToSuppressTo___block_invoke(uint64_t result, void *a2, char a3)
{
  if ((a3 & 0x40) != 0)
    return objc_msgSend(a2, "sceneWithIdentifier:didChangeBackgroundActivitiesToSuppressTo:", *(_QWORD *)(result + 32), *(_QWORD *)(result + 40));
  return result;
}

- (void)sceneWithIdentifier:(id)a3 didChangeStatusBarAvoidanceFrameTo:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  -[SBDeviceApplicationSceneStatusBarStateProxy statusBarAvoidanceFrame](self, "statusBarAvoidanceFrame");
  v10 = v34.origin.x;
  v11 = v34.origin.y;
  v12 = v34.size.width;
  v13 = v34.size.height;
  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  if (!CGRectEqualToRect(v34, v37))
  {
    SBLogAppStatusBars();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v15 = (void *)objc_opt_class();
      v16 = v15;
      v35.origin.x = v10;
      v35.origin.y = v11;
      v35.size.width = v12;
      v35.size.height = v13;
      NSStringFromCGRect(v35);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v36.origin.x = x;
      v36.origin.y = y;
      v36.size.width = width;
      v36.size.height = height;
      NSStringFromCGRect(v36);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v26 = v9;
      v27 = 2112;
      v28 = v15;
      v29 = 2112;
      v30 = v17;
      v31 = 2112;
      v32 = v18;
      _os_log_debug_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEBUG, "(%@) %@ Using our overridden statusBarAvoidanceFrame %@ (was provided %@)", buf, 0x2Au);

    }
  }
  if (-[SBDeviceApplicationSceneStatusBarStateProxy _anyObserverWants:](self, "_anyObserverWants:", sel_sceneWithIdentifier_didChangeStatusBarAvoidanceFrameTo_))
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __102__SBDeviceApplicationSceneStatusBarStateProxy_sceneWithIdentifier_didChangeStatusBarAvoidanceFrameTo___block_invoke;
    v19[3] = &unk_1E8EA26F8;
    v20 = v9;
    v21 = x;
    v22 = y;
    v23 = width;
    v24 = height;
    -[SBDeviceApplicationSceneStatusBarStateProvider_Base enumerateObserversWithBlock:](self, "enumerateObserversWithBlock:", v19);

  }
}

uint64_t __102__SBDeviceApplicationSceneStatusBarStateProxy_sceneWithIdentifier_didChangeStatusBarAvoidanceFrameTo___block_invoke(uint64_t result, void *a2, char a3)
{
  if (a3 < 0)
    return objc_msgSend(a2, "sceneWithIdentifier:didChangeStatusBarAvoidanceFrameTo:", *(_QWORD *)(result + 32), *(double *)(result + 40), *(double *)(result + 48), *(double *)(result + 56), *(double *)(result + 64));
  return result;
}

- (void)didInvalidateStatusBarDescriptionForSceneWithIdentifier:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v4 = a3;
  if (-[SBDeviceApplicationSceneStatusBarStateProxy _anyObserverWants:](self, "_anyObserverWants:", sel_didInvalidateStatusBarDescriptionForSceneWithIdentifier_))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __103__SBDeviceApplicationSceneStatusBarStateProxy_didInvalidateStatusBarDescriptionForSceneWithIdentifier___block_invoke;
    v5[3] = &unk_1E8EA2608;
    v6 = v4;
    -[SBDeviceApplicationSceneStatusBarStateProvider_Base enumerateObserversWithBlock:](self, "enumerateObserversWithBlock:", v5);

  }
}

uint64_t __103__SBDeviceApplicationSceneStatusBarStateProxy_didInvalidateStatusBarDescriptionForSceneWithIdentifier___block_invoke(uint64_t result, void *a2, char a3)
{
  if ((a3 & 0x20) != 0)
    return objc_msgSend(a2, "didInvalidateStatusBarDescriptionForSceneWithIdentifier:", *(_QWORD *)(result + 32));
  return result;
}

- (void)sceneWithIdentifier:(id)a3 didChangeSceneInterfaceOrientationTo:(int64_t)a4
{
  id v6;
  _QWORD v7[4];
  id v8;
  int64_t v9;

  v6 = a3;
  if (-[SBDeviceApplicationSceneStatusBarStateProxy _anyObserverWants:](self, "_anyObserverWants:", sel_sceneWithIdentifier_didChangeSceneInterfaceOrientationTo_))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __104__SBDeviceApplicationSceneStatusBarStateProxy_sceneWithIdentifier_didChangeSceneInterfaceOrientationTo___block_invoke;
    v7[3] = &unk_1E8EA2630;
    v8 = v6;
    v9 = a4;
    -[SBDeviceApplicationSceneStatusBarStateProvider_Base enumerateObserversWithBlock:](self, "enumerateObserversWithBlock:", v7);

  }
}

uint64_t __104__SBDeviceApplicationSceneStatusBarStateProxy_sceneWithIdentifier_didChangeSceneInterfaceOrientationTo___block_invoke(uint64_t result, void *a2, __int16 a3)
{
  if ((a3 & 0x100) != 0)
    return objc_msgSend(a2, "sceneWithIdentifier:didChangeSceneInterfaceOrientationTo:", *(_QWORD *)(result + 32), *(_QWORD *)(result + 40));
  return result;
}

- (BOOL)_anyObserverWants:(SEL)a3
{
  return 1;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deviceApplicationSceneHandle);
  objc_destroyWeak((id *)&self->_stateProvider);
}

@end
