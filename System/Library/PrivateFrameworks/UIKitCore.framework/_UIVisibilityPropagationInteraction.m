@implementation _UIVisibilityPropagationInteraction

- (UIView)view
{
  os_unfair_lock_s *p_visibilityLock;
  id WeakRetained;

  p_visibilityLock = &self->_visibilityLock;
  os_unfair_lock_lock(&self->_visibilityLock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_visibilityLock_view);
  os_unfair_lock_unlock(p_visibilityLock);
  return (UIView *)WeakRetained;
}

- (void)willMoveToView:(id)a3
{
  os_unfair_lock_s *p_visibilityLock;
  id WeakRetained;

  p_visibilityLock = &self->_visibilityLock;
  os_unfair_lock_lock(&self->_visibilityLock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_visibilityLock_view);
  if (!a3 || self->_visibilityLock_invalidated || !WeakRetained && self->_visibilityLock_isTrackingView)
    -[_UIVisibilityPropagationInteraction _visibilityLock_didMoveToWindow:]((uint64_t)self, 0);
  os_unfair_lock_unlock(p_visibilityLock);

}

+ (_UIVisibilityPropagationInteraction)interactionWithPID:(int)a3 environmentIdentifier:(id)a4
{
  uint64_t v4;
  id v7;
  id v8;
  _UIVisibilityPropagationInteraction *v9;
  id v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  _BYTE v26[22];
  __int16 v27;
  id v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v4 = *(_QWORD *)&a3;
  v35 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if ((int)v4 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid pid %i"), v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v26 = 138544642;
      *(_QWORD *)&v26[4] = v15;
      *(_WORD *)&v26[12] = 2114;
      *(_QWORD *)&v26[14] = v17;
      v27 = 2048;
      v28 = a1;
      v29 = 2114;
      v30 = CFSTR("_UIVisibilityPropagationView.m");
      v31 = 1024;
      v32 = 63;
      v33 = 2114;
      v34 = v14;
      _os_log_error_impl(&dword_185066000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v26, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x185424FC0);
  }
  v8 = v7;
  NSClassFromString(CFSTR("NSString"));
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v26 = 138544642;
      *(_QWORD *)&v26[4] = v19;
      *(_WORD *)&v26[12] = 2114;
      *(_QWORD *)&v26[14] = v21;
      v27 = 2048;
      v28 = a1;
      v29 = 2114;
      v30 = CFSTR("_UIVisibilityPropagationView.m");
      v31 = 1024;
      v32 = 64;
      v33 = 2114;
      v34 = v18;
      _os_log_error_impl(&dword_185066000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v26, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1854250B8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSStringClass]"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v26 = 138544642;
      *(_QWORD *)&v26[4] = v23;
      *(_WORD *)&v26[12] = 2114;
      *(_QWORD *)&v26[14] = v25;
      v27 = 2048;
      v28 = a1;
      v29 = 2114;
      v30 = CFSTR("_UIVisibilityPropagationView.m");
      v31 = 1024;
      v32 = 64;
      v33 = 2114;
      v34 = v22;
      _os_log_error_impl(&dword_185066000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v26, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1854251B0);
  }

  v9 = [_UIVisibilityPropagationInteraction alloc];
  if (v9)
  {
    *(_QWORD *)v26 = v9;
    *(_QWORD *)&v26[8] = _UIVisibilityPropagationInteraction;
    v10 = objc_msgSendSuper2((objc_super *)v26, sel_init);
    v11 = v10;
    if (v10)
      *((_QWORD *)v10 + 10) = 0;
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithPid:environmentIdentifier:", v4, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIVisibilityPropagationInteraction _setVisibilityTarget:]((uint64_t)v11, v12);

  -[_UIVisibilityPropagationInteraction _setVisibilityPropagationEnabled:]((uint64_t)v11, 1);
  return (_UIVisibilityPropagationInteraction *)v11;
}

- (void)_setVisibilityPropagationEnabled:(uint64_t)a1
{
  os_unfair_lock_s *v4;

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 80);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if (*(unsigned __int8 *)(a1 + 88) != a2)
    {
      *(_BYTE *)(a1 + 88) = a2;
      -[_UIVisibilityPropagationInteraction _visibilityLock_updateVisibility](a1);
    }
    os_unfair_lock_unlock(v4);
  }
}

- (void)_setVisibilityTarget:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  if (a1)
  {
    v6 = v3;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((BSEqualObjects() & 1) == 0)
    {
      v4 = objc_msgSend(v6, "copy");
      v5 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v4;

      -[_UIVisibilityPropagationInteraction _visibilityLock_enqueueUpdateIfNecessary](a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    v3 = v6;
  }

}

- (void)didMoveToView:(id)a3
{
  os_unfair_lock_s *p_visibilityLock;
  id v5;
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  _BOOL4 visibilityLock_isViewVisible;
  void *v11;
  void *v12;
  char v13;

  p_visibilityLock = &self->_visibilityLock;
  v5 = a3;
  os_unfair_lock_lock(p_visibilityLock);
  v6 = v5;
  v7 = v6;
  if (self)
  {
    os_unfair_lock_assert_owner(p_visibilityLock);
    WeakRetained = objc_loadWeakRetained((id *)&self->_visibilityLock_view);
    v9 = WeakRetained;
    if (self->_visibilityLock_invalidated || !v6 || (v11 = v6, v7 = v6, WeakRetained != v6))
    {
      visibilityLock_isViewVisible = self->_visibilityLock_isViewVisible;
      if (self->_visibilityLock_isTrackingView)
      {
        self->_visibilityLock_isTrackingView = 0;
        visibilityLock_isViewVisible = 1;
      }
      if (WeakRetained)
      {
        objc_storeWeak((id *)&self->_visibilityLock_view, 0);

        if (!v6 || self->_visibilityLock_invalidated)
          goto LABEL_16;
LABEL_14:
        self->_visibilityLock_isViewVisible = objc_msgSend(v6, "isHidden") ^ 1;
        objc_storeWeak((id *)&self->_visibilityLock_view, v6);
        self->_visibilityLock_isTrackingView = 1;
        v7 = v6;
LABEL_17:
        objc_msgSend(v7, "window");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[_UIVisibilityPropagationInteraction _visibilityLock_didMoveToWindow:]((uint64_t)self, v12);

        if ((v13 & 1) == 0)
          -[_UIVisibilityPropagationInteraction _visibilityLock_updateVisibility]((uint64_t)self);
        v11 = 0;
        goto LABEL_20;
      }
      if (v6 && !self->_visibilityLock_invalidated)
        goto LABEL_14;
      if (visibilityLock_isViewVisible)
      {
LABEL_16:

        v7 = 0;
        goto LABEL_17;
      }
      v11 = 0;
      v7 = v6;
    }
LABEL_20:

  }
  os_unfair_lock_unlock(p_visibilityLock);
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  os_unfair_lock_s *p_visibilityLock;
  id v6;

  p_visibilityLock = &self->_visibilityLock;
  v6 = a4;
  os_unfair_lock_lock(p_visibilityLock);
  -[_UIVisibilityPropagationInteraction _visibilityLock_didMoveToWindow:]((uint64_t)self, v6);

  os_unfair_lock_unlock(p_visibilityLock);
}

- (uint64_t)_visibilityLock_didMoveToWindow:(uint64_t)a1
{
  id *v3;
  id *WeakRetained;
  id *v5;
  uint64_t v6;
  id *v7;
  _BOOL4 v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  void *v15;
  id *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id *location;
  _QWORD aBlock[4];
  id v35;
  id from;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 80));
    location = (id *)(a1 + 24);
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 24));
    v5 = WeakRetained;
    if (!*(_BYTE *)(a1 + 93) && v3 && WeakRetained == v3)
    {
      a1 = 0;
      v16 = v3;
LABEL_35:

      goto LABEL_36;
    }
    v7 = (id *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 32);
    v8 = v6 != 0;
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v10 = *v7;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v38 != v12)
              objc_enumerationMutation(v10);
            objc_msgSend(v9, "removeObserver:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        }
        while (v11);
      }

      v14 = *v7;
      *v7 = 0;

    }
    v15 = *(void **)(a1 + 40);
    if (v15)
    {
      *(_QWORD *)(a1 + 40) = 0;

      v8 = 1;
    }
    if (*(_BYTE *)(a1 + 91))
    {
      *(_BYTE *)(a1 + 91) = 0;
      v8 = 1;
    }
    if (v5)
    {
      objc_storeWeak(location, 0);

      if (!v3 || *(_BYTE *)(a1 + 93))
        goto LABEL_34;
    }
    else if (!v3 || *(_BYTE *)(a1 + 93))
    {
      if (!v8)
      {
        v16 = 0;
        a1 = 0;
        goto LABEL_35;
      }
      goto LABEL_34;
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&from, (id)a1);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __71___UIVisibilityPropagationInteraction__visibilityLock_didMoveToWindow___block_invoke;
    aBlock[3] = &unk_1E16B22E0;
    objc_copyWeak(&v35, &from);
    v19 = _Block_copy(aBlock);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserverForName:object:queue:usingBlock:", CFSTR("UIWindowDidMoveToScreenNotification"), v3, v18, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v21);

    objc_msgSend(v17, "addObserverForName:object:queue:usingBlock:", 0x1E1764CC0, v3, v18, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v22);

    objc_msgSend(v17, "addObserverForName:object:queue:usingBlock:", CFSTR("UIWindowDidBecomeVisibleNotification"), v3, v18, v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v23);

    objc_msgSend(v17, "addObserverForName:object:queue:usingBlock:", CFSTR("UIWindowDidBecomeHiddenNotification"), v3, v18, v19);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v24);

    objc_storeStrong((id *)(a1 + 32), v20);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UIRootWindow:%p"), v3);
      v25 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 && !objc_msgSend(v3, "_isRemoteInputHostWindow"))
          {
            -[UIWindow _fbsScene](v3);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v28;
            if (v28)
            {
              objc_msgSend(v28, "identityToken");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "stringRepresentation");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              _UISVisibilityEnvironmentForSceneIdentityTokenString();
              v31 = objc_claimAutoreleasedReturnValue();
              v32 = *(void **)(a1 + 40);
              *(_QWORD *)(a1 + 40) = v31;

            }
            else
            {
              v29 = *(void **)(a1 + 40);
              *(_QWORD *)(a1 + 40) = 0;
            }

            goto LABEL_33;
          }
        }
      }
      objc_msgSend(v3, "_contextId");
      _UISVisibilityEnvironmentForUIHostedWindowContextID();
      v25 = objc_claimAutoreleasedReturnValue();
    }
    v26 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v25;
LABEL_33:

    objc_storeWeak(location, v3);
    *(_BYTE *)(a1 + 91) = 1;

    objc_destroyWeak(&v35);
    objc_destroyWeak(&from);

LABEL_34:
    -[_UIVisibilityPropagationInteraction _visibilityLock_updateVisibility](a1);
    v16 = 0;
    a1 = 1;
    goto LABEL_35;
  }
LABEL_36:

  return a1;
}

- (void)_visibilityLock_updateVisibility
{
  id v2;
  void *v3;
  id WeakRetained;

  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 80));
    if (!*(_BYTE *)(a1 + 93) && *(_BYTE *)(a1 + 88) && *(_BYTE *)(a1 + 90))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      v2 = objc_loadWeakRetained((id *)(a1 + 24));
      v3 = 0;
      if (WeakRetained && v2)
      {
        if ((objc_msgSend(v2, "isHidden") & 1) != 0)
          v3 = 0;
        else
          v3 = *(void **)(a1 + 40);
      }
      -[_UIVisibilityPropagationInteraction _visibilityLock_setSource:](a1, v3);

    }
    else
    {
      -[_UIVisibilityPropagationInteraction _visibilityLock_setSource:](a1, 0);
    }
  }
}

- (void)_visibilityLock_setSource:(uint64_t)a1
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 80));
    if ((BSEqualStrings() & 1) == 0)
    {
      v3 = objc_msgSend(v5, "copy");
      v4 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v3;

      -[_UIVisibilityPropagationInteraction _visibilityLock_enqueueUpdateIfNecessary](a1);
    }
  }

}

- (void)_visibilityLock_enqueueUpdateIfNecessary
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id location;

  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 80));
    if (!*(_BYTE *)(a1 + 92))
    {
      objc_initWeak(&location, (id)a1);
      *(_BYTE *)(a1 + 92) = 1;
      dispatch_get_global_queue(25, 0);
      v2 = objc_claimAutoreleasedReturnValue();
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __79___UIVisibilityPropagationInteraction__visibilityLock_enqueueUpdateIfNecessary__block_invoke;
      v3[3] = &unk_1E16B3F40;
      objc_copyWeak(&v4, &location);
      dispatch_async(v2, v3);

      objc_destroyWeak(&v4);
      objc_destroyWeak(&location);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibilityProcessingLock_endpointInjector, 0);
  objc_storeStrong((id *)&self->_visibilityProcessingLock_sourceEnvironment, 0);
  objc_storeStrong((id *)&self->_visibilityProcessingLock_target, 0);
  objc_storeStrong((id *)&self->_visibilityLock_sourceEnvironment, 0);
  objc_storeStrong((id *)&self->_visibilityLock_windowEnvironment, 0);
  objc_storeStrong((id *)&self->_visibilityLock_windowChangeNotifications, 0);
  objc_destroyWeak((id *)&self->_visibilityLock_window);
  objc_destroyWeak((id *)&self->_visibilityLock_view);
  objc_storeStrong((id *)&self->_visibilityLock_target, 0);
}

- (void)dealloc
{
  os_unfair_lock_s *p_visibilityProcessingLock;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *visibilityLock_windowChangeNotifications;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_visibilityProcessingLock = &self->_visibilityProcessingLock;
  os_unfair_lock_lock(&self->_visibilityProcessingLock);
  os_unfair_lock_lock(&self->_visibilityLock);
  self->_visibilityLock_invalidated = 1;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_visibilityLock_windowChangeNotifications;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "removeObserver:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  visibilityLock_windowChangeNotifications = self->_visibilityLock_windowChangeNotifications;
  self->_visibilityLock_windowChangeNotifications = 0;

  os_unfair_lock_unlock(&self->_visibilityLock);
  -[BSServiceConnectionEndpointInjector invalidate](self->_visibilityProcessingLock_endpointInjector, "invalidate");
  os_unfair_lock_unlock(p_visibilityProcessingLock);

  v11.receiver = self;
  v11.super_class = (Class)_UIVisibilityPropagationInteraction;
  -[_UIVisibilityPropagationInteraction dealloc](&v11, sel_dealloc);
}

- (void)_viewVisibilityDidChange
{
  os_unfair_lock_s *p_visibilityLock;
  int v4;
  id WeakRetained;

  p_visibilityLock = &self->_visibilityLock;
  os_unfair_lock_lock(&self->_visibilityLock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_visibilityLock_view);
  if (WeakRetained)
  {
    v4 = objc_msgSend(WeakRetained, "isHidden");
    if (self->_visibilityLock_isViewVisible != (v4 ^ 1))
    {
      self->_visibilityLock_isViewVisible = v4 ^ 1;
      -[_UIVisibilityPropagationInteraction _visibilityLock_updateVisibility]((uint64_t)self);
    }
  }
  os_unfair_lock_unlock(p_visibilityLock);

}

@end
