@implementation SBWindowHidingManager

- (void)sceneHandle:(id)a3 didUpdateSettingsWithDiff:(id)a4 previousSettings:(id)a5
{
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _BOOL4 v13;
  id v14;

  v7 = a5;
  objc_msgSend(a3, "scene");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "level");
  v10 = v9;
  objc_msgSend(v7, "level");
  v12 = v11;

  if (v10 == v12)
  {

  }
  else
  {
    v13 = -[SBWindowHidingManager _isHidingWindows](self, "_isHidingWindows");

    if (v13)
      -[SBWindowHidingManager _adjustWindowsForActiveHideRange](self, "_adjustWindowsForActiveHideRange");
  }
}

- (BOOL)_isHidingWindows
{
  return -[NSMapTable count](self->_hidingContextMap, "count") != 0;
}

- (void)_takeNoteOfWindow:(id)a3 onScene:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  int v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  v9 = objc_msgSend(v7, "isEqual:", WeakRetained);

  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SBWindowHidingManager _captureWindow:](self, "_captureWindow:", v6);
    }
    else
    {
      SBLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = 134217984;
        v12 = v6;
        _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_INFO, "SBWindowManager: Ignoring window %p because it isn't an SBWindow", (uint8_t *)&v11, 0xCu);
      }

    }
  }
  else
  {
    -[SBWindowHidingManager _releaseWindow:](self, "_releaseWindow:", v6);
  }

}

- (SBWindowHidingManager)initWithWindowScene:(id)a3
{
  id v4;
  SBWindowHidingManager *v5;
  SBWindowHidingManager *v6;
  uint64_t v7;
  NSMapTable *hidingContextMap;
  uint64_t v9;
  NSMapTable *windowStateMap;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  SBSceneHandle *keyboardSceneHandle;
  void *v18;
  _QWORD v20[4];
  SBWindowHidingManager *v21;
  id v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SBWindowHidingManager;
  v5 = -[SBWindowHidingManager init](&v23, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_windowScene, v4);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    hidingContextMap = v6->_hidingContextMap;
    v6->_hidingContextMap = (NSMapTable *)v7;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v9 = objc_claimAutoreleasedReturnValue();
    windowStateMap = v6->_windowStateMap;
    v6->_windowStateMap = (NSMapTable *)v9;

    v6->_hideRange = (SBWindowLevelRange_struct)xmmword_1D0E8BF90;
    v11 = objc_alloc_init(MEMORY[0x1E0D23140]);
    objc_msgSend(MEMORY[0x1E0D231F0], "identityForIdentifier:", *MEMORY[0x1E0D42708]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIdentity:", v12);

    objc_msgSend(v4, "_FBSScene");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "settings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "displayIdentity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DAC248]), "_initWithDefinition:displayIdentity:", v11, v15);
    keyboardSceneHandle = v6->_keyboardSceneHandle;
    v6->_keyboardSceneHandle = (SBSceneHandle *)v16;

    -[SBSceneHandle addObserver:](v6->_keyboardSceneHandle, "addObserver:", v6);
    objc_msgSend(v4, "windows");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __45__SBWindowHidingManager_initWithWindowScene___block_invoke;
    v20[3] = &unk_1E8EC1460;
    v21 = v6;
    v22 = v4;
    objc_msgSend(v18, "enumerateObjectsUsingBlock:", v20);

  }
  return v6;
}

uint64_t __45__SBWindowHidingManager_initWithWindowScene___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_takeNoteOfWindow:onScene:", a2, *(_QWORD *)(a1 + 40));
}

- (void)_window:(id)a3 willDetachFromScene:(id)a4
{
  id v6;
  id WeakRetained;
  int v8;
  id v9;

  v9 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  v8 = objc_msgSend(v6, "isEqual:", WeakRetained);

  if (v8)
    -[SBWindowHidingManager _releaseWindow:](self, "_releaseWindow:", v9);

}

- (void)setAlpha:(double)a3 forWindow:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a4;
  -[NSMapTable objectForKey:](self->_windowStateMap, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    SBLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "SBWindowManager changing alpha for an untracked window. It may be untracked if the alpha change occurred while it was still hidden.", v9, 2u);
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v6, "setAlpha:", a3);
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  objc_msgSend(v6, "windowLevel");
  if (!-[SBWindowHidingManager _isHidingWindowLevel:](self, "_isHidingWindowLevel:"))
  {
LABEL_7:
    objc_msgSend(v6, "setAlphaAndObeyBecauseIAmTheWindowManager:", a3);
    goto LABEL_9;
  }
  objc_msgSend(v7, "setDesiredAlpha:", a3);
LABEL_9:

}

- (void)startHidingWindowsExclusivelyFromLevel:(double)a3 toLevel:(double)a4 forContext:(id)a5 reason:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  if (a4 >= a3)
  {
    -[NSMapTable objectForKey:](self->_hidingContextMap, "objectForKey:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      SBLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v14, "windowLevelRange");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%.f, %.f)"), v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%.f, %.f)"), *(_QWORD *)&a3, *(_QWORD *)&a4);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v21 = v10;
        v22 = 2112;
        v23 = v10;
        v24 = 2112;
        v25 = v18;
        v26 = 2112;
        v27 = v19;
        _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_INFO, "Context %p (%@) updating hide window request %@ -> %@", buf, 0x2Au);

      }
    }
    +[SBWindowHideRequest hideRequestWithWindowLevelRange:reason:](SBWindowHideRequest, "hideRequestWithWindowLevelRange:reason:", v11, a3, a4);
    v12 = objc_claimAutoreleasedReturnValue();

    -[NSMapTable setObject:forKey:](self->_hidingContextMap, "setObject:forKey:", v12, v10);
    -[SBWindowHidingManager _recomputeHideRangeAndAdjustWindows](self, "_recomputeHideRangeAndAdjustWindows");
  }
  else
  {
    SBLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%.f, %.f)"), *(_QWORD *)&a3, *(_QWORD *)&a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v21 = v10;
      v22 = 2112;
      v23 = v10;
      v24 = 2112;
      v25 = v13;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_INFO, "Context %p (%@) passed an invalid window level range %@", buf, 0x20u);

    }
  }

}

- (void)stopHidingWindowsForContext:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMapTable objectForKey:](self->_hidingContextMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 134218242;
      v13 = v4;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "Context %p (%@) cleared.", (uint8_t *)&v12, 0x16u);

    }
    -[NSMapTable removeObjectForKey:](self->_hidingContextMap, "removeObjectForKey:", v4);
    -[SBWindowHidingManager _recomputeHideRangeAndAdjustWindows](self, "_recomputeHideRangeAndAdjustWindows");
  }
  else
  {
    if (v7)
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 134218242;
      v13 = v4;
      v14 = 2114;
      v15 = v11;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "Stop hiding request from unknown context %p (%{public}@) ignored", (uint8_t *)&v12, 0x16u);

    }
  }

}

- (void)_recomputeHideRangeAndAdjustWindows
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t i;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (-[SBWindowHidingManager _isHidingWindows](self, "_isHidingWindows"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[NSMapTable objectEnumerator](self->_hidingContextMap, "objectEnumerator", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v18;
      v7 = 0.0;
      v8 = -1.0;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v18 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "windowLevelRange");
          if (v8 < v7)
            v12 = v11;
          else
            v12 = v8;
          if (v8 < v7)
            v13 = v10;
          else
            v13 = v7;
          if (v7 >= v10)
            v14 = v10;
          else
            v14 = v7;
          if (v8 >= v11)
            v15 = v8;
          else
            v15 = v11;
          v16 = v8 < v7 || v11 < v10;
          if (v16)
            v8 = v12;
          else
            v8 = v15;
          if (v16)
            v7 = v13;
          else
            v7 = v14;
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v5);
    }
    else
    {
      v7 = 0.0;
      v8 = -1.0;
    }

  }
  else
  {
    v7 = 0.0;
    v8 = -1.0;
  }
  self->_hideRange.start = v7;
  self->_hideRange.end = v8;
  -[SBWindowHidingManager _adjustWindowsForActiveHideRange](self, "_adjustWindowsForActiveHideRange");
}

- (void)_adjustWindowsForActiveHideRange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double end;
  double start;
  int v14;
  _BOOL4 v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  BOOL v25;
  void *keyboardPresenter;
  UIScenePresenter *v27;
  UIScenePresenter *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA918], "_synchronizeDrawing");
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[NSMapTable keyEnumerator](self->_windowStateMap, "keyEnumerator", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v30 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_windowStateMap, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "windowLevel");
        v11 = v10;
        if (-[SBWindowHidingManager _isHidingWindows](self, "_isHidingWindows")
          && (start = self->_hideRange.start, end = self->_hideRange.end, end >= start))
        {
          v15 = end > v11 && start < v11;
          v14 = objc_msgSend(v9, "isHidden");
          if (v15 && (v14 & 1) == 0)
          {
            objc_msgSend(v8, "alpha");
            objc_msgSend(v9, "setDesiredAlpha:");
            objc_msgSend(v9, "setHidden:", 1);
            v16 = 0.0;
            goto LABEL_18;
          }
        }
        else
        {
          v14 = objc_msgSend(v9, "isHidden");
          LOBYTE(v15) = 0;
        }
        if (!v15 && v14)
        {
          objc_msgSend(v9, "setHidden:", 0);
          objc_msgSend(v9, "desiredAlpha");
LABEL_18:
          objc_msgSend(v8, "setAlphaAndObeyBecauseIAmTheWindowManager:", v16);
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v5);
  }

  -[SBSceneHandle sceneIfExists](self->_keyboardSceneHandle, "sceneIfExists");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "settings");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "level");
    v21 = v20;

    objc_msgSend(v18, "uiPresentationManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[SBWindowHidingManager _isHidingWindows](self, "_isHidingWindows")
      || (v23 = self->_hideRange.start, v24 = self->_hideRange.end, v24 < v23)
      || (v23 < v21 ? (v25 = v24 <= v21) : (v25 = 1), v25))
    {
      -[UIScenePresenter invalidate](self->_keyboardPresenter, "invalidate");
      keyboardPresenter = self->_keyboardPresenter;
      self->_keyboardPresenter = 0;
    }
    else
    {
      if (self->_keyboardPresenter)
        goto LABEL_31;
      objc_msgSend(v22, "createPresenterWithIdentifier:priority:", CFSTR("SBWindowHidingManager"), -5);
      v27 = (UIScenePresenter *)objc_claimAutoreleasedReturnValue();
      v28 = self->_keyboardPresenter;
      self->_keyboardPresenter = v27;

      -[UIScenePresenter activate](self->_keyboardPresenter, "activate");
      -[UIScenePresenter presentationView](self->_keyboardPresenter, "presentationView");
      keyboardPresenter = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(keyboardPresenter, "setHidden:", 1);
    }

LABEL_31:
  }

}

- (void)_captureWindow:(id)a3
{
  id v4;
  SBWindowHideState *v5;
  NSObject *v6;
  _BOOL4 v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMapTable objectForKey:](self->_windowStateMap, "objectForKey:", v4);
  v5 = (SBWindowHideState *)objc_claimAutoreleasedReturnValue();
  SBLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      v8 = 134217984;
      v9 = v4;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "SBWindowManager: already tracking window %p", (uint8_t *)&v8, 0xCu);
    }

  }
  else
  {
    if (v7)
    {
      v8 = 134217984;
      v9 = v4;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "SBWindowManager now tracking window %p", (uint8_t *)&v8, 0xCu);
    }

    v5 = objc_alloc_init(SBWindowHideState);
    -[SBWindowHideState setHidden:](v5, "setHidden:", 0);
    objc_msgSend(v4, "alpha");
    -[SBWindowHideState setDesiredAlpha:](v5, "setDesiredAlpha:");
    -[NSMapTable setObject:forKey:](self->_windowStateMap, "setObject:forKey:", v5, v4);
  }

}

- (BOOL)_isHidingWindowLevel:(double)a3
{
  double end;
  double start;

  start = self->_hideRange.start;
  end = self->_hideRange.end;
  if (end < start)
    return 0;
  if (end > a3)
    return start < a3;
  return 0;
}

- (void)_releaseWindow:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  char isKindOfClass;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMapTable objectForKey:](self->_windowStateMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    SBLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v10 = 134217984;
      v11 = v4;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "SBWindowManager is releasing window %p", (uint8_t *)&v10, 0xCu);
    }

    if (objc_msgSend(v5, "isHidden"))
    {
      SBLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v5, "desiredAlpha");
        v10 = 134218240;
        v11 = v8;
        v12 = 2048;
        v13 = v4;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "SBWindowManager restoring alpha to %.f for released window %p", (uint8_t *)&v10, 0x16u);
      }

      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      objc_msgSend(v5, "desiredAlpha");
      if ((isKindOfClass & 1) != 0)
        objc_msgSend(v4, "setAlphaAndObeyBecauseIAmTheWindowManager:");
      else
        objc_msgSend(v4, "setAlpha:");
    }
    -[NSMapTable removeObjectForKey:](self->_windowStateMap, "removeObjectForKey:", v4);
  }

}

- (id)dumpHidingState
{
  void *v3;
  void *v4;
  double end;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  objc_class *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  end = self->_hideRange.end;
  if (end >= self->_hideRange.start)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%.f, %.f)"), *(_QWORD *)&self->_hideRange.start, *(_QWORD *)&end);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Active hide range is: %@\n"), v6);

  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("Active hide range is: %@\n"), CFSTR("OFF"));
  }
  objc_msgSend(v4, "appendString:", CFSTR("These are our active hide requests:\n"));
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSMapTable keyEnumerator](self->_hidingContextMap, "keyEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_hidingContextMap, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR("Context %p (%@): %@\n"), v12, v15, v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  return v4;
}

- (id)dumpKnownWindows
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD *v21;
  _QWORD v22[3];
  char v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "appendString:", CFSTR("These are our known windows:\n"));
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[NSMapTable keyEnumerator](self->_windowStateMap, "keyEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_windowStateMap, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "appendFormat:", CFSTR("Window %p [%@]: %@\n"), v8, v11, v9);

        objc_msgSend(v3, "addObject:", v8);
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v5);
  }

  v12 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(MEMORY[0x1E0CEAC18], "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 1, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "minusSet:", v3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  if (objc_msgSend(v14, "count"))
  {
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    v23 = 0;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __41__SBWindowHidingManager_dumpKnownWindows__block_invoke;
    v18[3] = &unk_1E8EC1488;
    v19 = WeakRetained;
    v21 = v22;
    v20 = v17;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v18);

    _Block_object_dispose(v22, 8);
  }

  return v17;
}

void __41__SBWindowHidingManager_dumpKnownWindows__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  objc_class *v6;
  void *v7;
  char isKindOfClass;
  const __CFString *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v4)
  {
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR("There are additional UIKit windows that we don't know about:\n"));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    v5 = *(void **)(a1 + 40);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v9 = CFSTR("NOT an SBWindow");
    if ((isKindOfClass & 1) != 0)
      v9 = CFSTR("SBWindow");
    objc_msgSend(v5, "appendFormat:", CFSTR("%p: %@ (%@)\n"), v10, v7, v9);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardPresenter, 0);
  objc_storeStrong((id *)&self->_keyboardSceneHandle, 0);
  objc_storeStrong((id *)&self->_hidingContextMap, 0);
  objc_storeStrong((id *)&self->_windowStateMap, 0);
  objc_destroyWeak((id *)&self->_windowScene);
}

@end
