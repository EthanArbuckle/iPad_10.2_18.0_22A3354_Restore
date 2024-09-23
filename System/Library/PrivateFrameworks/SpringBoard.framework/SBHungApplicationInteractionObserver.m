@implementation SBHungApplicationInteractionObserver

- (void)activate
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void soft_HTInitializeHangTracerMonitor(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SBHungApplicationInteractionObserver.m"), 28, CFSTR("%s"), dlerror());

  __break(1u);
}

- (void)observeBackgroundingApplicationSceneEntities:(id)a3 withTransitionContext:(id)a4
{
  id v6;
  id v7;
  int v8;
  int v9;
  uint64_t v10;
  const __CFString *v11;
  NSObject *v12;

  v6 = a3;
  v7 = a4;
  if (-[SBHungApplicationInteractionObserver _transitionContextRepresentsActivatingAppFromAppSwitcher:](self, "_transitionContextRepresentsActivatingAppFromAppSwitcher:", v7))
  {
    v8 = 0;
    v9 = 0;
    v10 = 1;
    v11 = CFSTR("activate-app-from-app-switcher");
  }
  else if (-[SBHungApplicationInteractionObserver _transitionContextRepresentsActivatingDynamicIslandApp:](self, "_transitionContextRepresentsActivatingDynamicIslandApp:", v7))
  {
    v8 = 0;
    v9 = 1;
    v10 = 2;
    v11 = CFSTR("activate-app-from-dynamic-island");
  }
  else if (-[SBHungApplicationInteractionObserver _transitionContextRepresentsActivatingHomeScreen:](self, "_transitionContextRepresentsActivatingHomeScreen:", v7))
  {
    v8 = 0;
    v9 = 0;
    v10 = 3;
    v11 = CFSTR("activate-home-screen");
  }
  else if (-[SBHungApplicationInteractionObserver _transitionContextRepresentsArcSwipingToPreviousApp:](self, "_transitionContextRepresentsArcSwipingToPreviousApp:", v7))
  {
    v8 = 0;
    v9 = 0;
    v10 = 4;
    v11 = CFSTR("arc-swipe-to-previous-app");
  }
  else if (-[SBHungApplicationInteractionObserver _transitionContextRepresentsTappingBreadcrumbToPreviousApp:](self, "_transitionContextRepresentsTappingBreadcrumbToPreviousApp:", v7))
  {
    v8 = 0;
    v9 = 0;
    v10 = 5;
    v11 = CFSTR("tap-breadcrumb-to-previous-app");
  }
  else
  {
    v10 = 0;
    v9 = 0;
    v8 = 1;
    v11 = CFSTR("unspecified");
  }
  SBLogHangTracer();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[SBHungApplicationInteractionObserver observeBackgroundingApplicationSceneEntities:withTransitionContext:].cold.1((uint64_t)v11, v12);

  if (((v8 | v9) & 1) == 0)
    -[SBHungApplicationInteractionObserver _notifyInteractionWithPossiblyHungApplicationSceneEntities:withInteractionType:](self, "_notifyInteractionWithPossiblyHungApplicationSceneEntities:withInteractionType:", v6, v10);

}

- (void)observeRemovedApplicationSceneEntity:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHungApplicationInteractionObserver _notifyInteractionWithPossiblyHungApplicationSceneEntities:withInteractionType:](self, "_notifyInteractionWithPossiblyHungApplicationSceneEntities:withInteractionType:", v4, 7);

}

- (void)_lockStateDidChange:(id)a3
{
  SBHungApplicationInteractionObserver *v3;
  unint64_t previousLockState;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  SBHungApplicationInteractionObserver *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v3 = self;
  v38 = *MEMORY[0x1E0C80C00];
  previousLockState = self->_previousLockState;
  objc_msgSend(a3, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("SBAggregateLockStateKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  if ((previousLockState & 2) == 0 && (v7 & 2) != 0)
  {
    v25 = v7;
    v26 = v3;
    v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend((id)SBApp, "windowSceneManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "connectedWindowScenes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v10;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v33;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v33 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v14);
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          objc_msgSend(v15, "switcherController");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "layoutState");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "elements");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v29;
            do
            {
              v22 = 0;
              do
              {
                if (*(_QWORD *)v29 != v21)
                  objc_enumerationMutation(v18);
                objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v22), "workspaceEntity");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "applicationSceneEntity");
                v24 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v8, "bs_safeAddObject:", v24);
                ++v22;
              }
              while (v20 != v22);
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            }
            while (v20);
          }

          ++v14;
        }
        while (v14 != v12);
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v12);
    }

    v3 = v26;
    -[SBHungApplicationInteractionObserver _notifyInteractionWithPossiblyHungApplicationSceneEntities:withInteractionType:](v26, "_notifyInteractionWithPossiblyHungApplicationSceneEntities:withInteractionType:", v8, 6);

    v7 = v25;
  }
  v3->_previousLockState = v7;
}

- (void)_notifyInteractionWithPossiblyHungApplicationSceneEntities:(id)a3 withInteractionType:(int64_t)a4
{
  id v5;
  const __CFString *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  __int128 v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[8];
  __int128 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((unint64_t)(a4 - 1) > 6)
    v6 = CFSTR("unspecified");
  else
    v6 = off_1E8EB9758[a4 - 1];
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v9 = *(_QWORD *)v21;
    *(_QWORD *)&v8 = 67109378;
    v18 = v8;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "sceneHandle", v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "application");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "processState");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "pid");

        SBLogHangTracer();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v18;
          *(_DWORD *)&buf[4] = v14;
          LOWORD(v26) = 2112;
          *(_QWORD *)((char *)&v26 + 2) = v6;
          _os_log_debug_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEBUG, "Calling HTUserSwitchedAwayFromApp with pid %d, reason %@", buf, 0x12u);
        }

        *(_QWORD *)buf = 0;
        *(_QWORD *)&v26 = buf;
        *((_QWORD *)&v26 + 1) = 0x2020000000;
        v16 = getHTUserSwitchedAwayFromAppSymbolLoc_ptr;
        v27 = getHTUserSwitchedAwayFromAppSymbolLoc_ptr;
        if (!getHTUserSwitchedAwayFromAppSymbolLoc_ptr)
        {
          v17 = (void *)HangTracerLibrary();
          v16 = dlsym(v17, "HTUserSwitchedAwayFromApp");
          *(_QWORD *)(v26 + 24) = v16;
          getHTUserSwitchedAwayFromAppSymbolLoc_ptr = v16;
        }
        _Block_object_dispose(buf, 8);
        if (!v16)
          -[SBHungApplicationInteractionObserver _notifyInteractionWithPossiblyHungApplicationSceneEntities:withInteractionType:].cold.1();
        ((void (*)(uint64_t, const __CFString *))v16)(v14, v6);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

}

- (BOOL)_transitionContextRepresentsActivatingAppFromAppSwitcher:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  BOOL v14;

  v3 = a3;
  objc_msgSend(v3, "previousLayoutState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  objc_msgSend(v3, "layoutState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  v11 = v9;
  if (v10)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  v14 = objc_msgSend(v8, "unlockedEnvironmentMode") == 2 && objc_msgSend(v13, "unlockedEnvironmentMode") == 3;
  return v14;
}

- (BOOL)_transitionContextRepresentsActivatingDynamicIslandApp:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  BOOL v17;

  v3 = a3;
  objc_msgSend(v3, "previousLayoutState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  objc_msgSend(v3, "layoutState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  v11 = v9;
  if (v10)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  objc_msgSend(v3, "request");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "source");

  v17 = objc_msgSend(v8, "unlockedEnvironmentMode") == 3
     && objc_msgSend(v13, "unlockedEnvironmentMode") == 3
     && v15 == 61;

  return v17;
}

- (BOOL)_transitionContextRepresentsArcSwipingToPreviousApp:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  int v16;
  void *v17;
  void *v18;

  v3 = a3;
  objc_msgSend(v3, "previousLayoutState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  objc_msgSend(v3, "layoutState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  v11 = v9;
  if (v10)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  objc_msgSend(v3, "request");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "source");

  if (objc_msgSend(v8, "unlockedEnvironmentMode") == 3)
  {
    LOBYTE(v16) = 0;
    if (objc_msgSend(v13, "unlockedEnvironmentMode") == 3 && v15 == 11)
    {
      objc_msgSend(v13, "elements");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "elements");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v17, "intersectsSet:", v18) ^ 1;

    }
  }
  else
  {
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (BOOL)_transitionContextRepresentsActivatingHomeScreen:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  objc_msgSend(a3, "layoutState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  v8 = objc_msgSend(v7, "unlockedEnvironmentMode");
  return v8 == 1;
}

- (BOOL)_transitionContextRepresentsTappingBreadcrumbToPreviousApp:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  BOOL v17;

  v3 = a3;
  objc_msgSend(v3, "previousLayoutState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  objc_msgSend(v3, "layoutState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  v11 = v9;
  if (v10)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  objc_msgSend(v3, "request");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "source");

  v17 = objc_msgSend(v8, "unlockedEnvironmentMode") == 3
     && objc_msgSend(v13, "unlockedEnvironmentMode") == 3
     && v15 == 15;

  return v17;
}

- (uint64_t)setPreviousLockState:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 8) = a2;
  return result;
}

- (void)observeBackgroundingApplicationSceneEntities:(uint64_t)a1 withTransitionContext:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "Observed backgrounding application scene(s) with interaction type %@", (uint8_t *)&v2, 0xCu);
}

- (void)_notifyInteractionWithPossiblyHungApplicationSceneEntities:withInteractionType:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void soft_HTUserSwitchedAwayFromApp(pid_t, NSString * _Nonnull __strong)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SBHungApplicationInteractionObserver.m"), 29, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
