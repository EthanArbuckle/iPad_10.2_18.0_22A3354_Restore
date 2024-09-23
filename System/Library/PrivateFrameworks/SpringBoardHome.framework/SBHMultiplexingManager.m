@implementation SBHMultiplexingManager

- (id)viewControllerForIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_viewControllersForIdentifier, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[NSMutableDictionary objectForKey:](self->_cachedRecentViewControllersForIdentifier, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (SBHMultiplexingManager)initWithDelegate:(id)a3
{
  id v4;
  SBHMultiplexingManager *v5;
  SBHMultiplexingManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBHMultiplexingManager;
  v5 = -[SBHMultiplexingManager init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)setViewController:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *viewControllersForIdentifier;
  void *v15;
  id WeakRetained;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  SBHMultiplexingManager *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_viewControllersForIdentifier)
  {
    if (v6)
    {
LABEL_3:
      SBLogWidgetMultiplexing();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138544386;
        v23 = v10;
        v24 = 2048;
        v25 = self;
        v26 = 2114;
        v27 = v12;
        v28 = 2048;
        v29 = v6;
        v30 = 2114;
        v31 = v7;
        _os_log_impl(&dword_1CFEF3000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> set view controller controller <%{public}@:%p> for %{public}@", (uint8_t *)&v22, 0x34u);

      }
      -[NSMutableDictionary setObject:forKey:](self->_viewControllersForIdentifier, "setObject:forKey:", v6, v7);
      goto LABEL_12;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    viewControllersForIdentifier = self->_viewControllersForIdentifier;
    self->_viewControllersForIdentifier = v13;

    if (v6)
      goto LABEL_3;
  }
  -[NSMutableDictionary objectForKey:](self->_viewControllersForIdentifier, "objectForKey:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bs_endAppearanceTransition:", 0);
  if (!-[SBHMultiplexingManager _cacheLastDiscardedViewController:forIdentifier:](self, "_cacheLastDiscardedViewController:forIdentifier:", v15, v7))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "multiplexingManager:willRemoveViewController:forIdentifier:", self, v15, v7);

  }
  -[NSMutableDictionary removeObjectForKey:](self->_viewControllersForIdentifier, "removeObjectForKey:", v7);
  SBLogWidgetMultiplexing();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138544386;
    v23 = v19;
    v24 = 2048;
    v25 = self;
    v26 = 2114;
    v27 = v21;
    v28 = 2048;
    v29 = v15;
    v30 = 2114;
    v31 = v7;
    _os_log_impl(&dword_1CFEF3000, v17, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> removed view controller controller <%{public}@:%p> for %{public}@", (uint8_t *)&v22, 0x34u);

  }
LABEL_12:

}

- (BOOL)hasViewControllerForIdentifier:(id)a3
{
  void *v3;
  BOOL v4;

  -[SBHMultiplexingManager viewControllerForIdentifier:](self, "viewControllerForIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)activeMultiplexingViewControllerForViewController:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  NSMutableDictionary *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_viewControllersForIdentifier;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
      -[NSMutableDictionary objectForKey:](self->_viewControllersForIdentifier, "objectForKey:", v10, (_QWORD)v15);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (v11 == v4)
        break;

      if (v7 == ++v9)
      {
        v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v13 = v10;

    if (v13)
    {
      -[SBHMultiplexingManager activeMultiplexingViewControllerForIdentifier:](self, "activeMultiplexingViewControllerForIdentifier:", v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v13;
      goto LABEL_12;
    }
    v12 = 0;
  }
  else
  {
LABEL_9:
    v12 = 0;
LABEL_12:

  }
  return v12;
}

- (id)newMultiplexingViewControllerForIdentifier:(id)a3 atLevel:(double)a4
{
  id v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *multiplexingViewControllersForIdentifier;
  SBHMultiplexingViewController *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  SBHMultiplexingViewController *v16;
  id v17;
  SBHMultiplexingViewController *v18;
  SBHMultiplexingViewController *v19;
  void *v21;
  _QWORD v22[5];
  id v23;
  SBHMultiplexingViewController *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  SBHMultiplexingManager *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  SBHMultiplexingViewController *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  double v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!-[SBHMultiplexingManager hasViewControllerForIdentifier:](self, "hasViewControllerForIdentifier:", v7))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[self hasViewControllerForIdentifier:identifier]"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBHMultiplexingManager newMultiplexingViewControllerForIdentifier:atLevel:].cold.1(a2, (uint64_t)self, (uint64_t)v21);
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D00C8710);
  }
  if (!self->_multiplexingViewControllersForIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    multiplexingViewControllersForIdentifier = self->_multiplexingViewControllersForIdentifier;
    self->_multiplexingViewControllersForIdentifier = v8;

  }
  v10 = -[SBHMultiplexingViewController initWithLevel:identifier:]([SBHMultiplexingViewController alloc], "initWithLevel:identifier:", v7, a4);
  -[SBHMultiplexingViewController setMultiplexingManager:](v10, "setMultiplexingManager:", self);
  SBLogWidgetMultiplexing();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v26 = v13;
    v27 = 2048;
    v28 = self;
    v29 = 2114;
    v30 = v15;
    v31 = 2048;
    v32 = v10;
    v33 = 2114;
    v34 = v7;
    v35 = 2048;
    v36 = a4;
    _os_log_impl(&dword_1CFEF3000, v11, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> creating new multiplexing view controller controller <%{public}@:%p> for %{public}@ at level: %.f", buf, 0x3Eu);

  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __77__SBHMultiplexingManager_newMultiplexingViewControllerForIdentifier_atLevel___block_invoke;
  v22[3] = &unk_1E8D84F18;
  v22[4] = self;
  v23 = v7;
  v16 = v10;
  v24 = v16;
  v17 = v7;
  -[SBHMultiplexingManager _modifyViewControllersForIdentifier:reusingCacheViewControllersIfNecessary:withBlock:](self, "_modifyViewControllersForIdentifier:reusingCacheViewControllersIfNecessary:withBlock:", v17, 1, v22);
  v18 = v24;
  v19 = v16;

  return v19;
}

void __77__SBHMultiplexingManager_newMultiplexingViewControllerForIdentifier_atLevel___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKey:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1[4] + 32), "setObject:forKey:", v3, a1[5]);
    v2 = v3;
  }
  v4 = v2;
  objc_msgSend(v2, "addPointer:", a1[6]);
  objc_msgSend(v4, "compact");

}

- (void)discardMultiplexingViewController:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v4 = a3;
  v5 = objc_opt_class();
  v10 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v10;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__SBHMultiplexingManager_discardMultiplexingViewController___block_invoke;
    v11[3] = &unk_1E8D84F18;
    v11[4] = self;
    v12 = v8;
    v13 = v7;
    v9 = v8;
    -[SBHMultiplexingManager _modifyViewControllersForIdentifier:reusingCacheViewControllersIfNecessary:withBlock:](self, "_modifyViewControllersForIdentifier:reusingCacheViewControllersIfNecessary:withBlock:", v9, 0, v11);

  }
}

void __60__SBHMultiplexingManager_discardMultiplexingViewController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "multiplexingViewControllersForIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sbh_removePointer:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v3, "compact");
  SBLogWidgetMultiplexing();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v13 = 138544386;
    v14 = v6;
    v15 = 2048;
    v16 = v7;
    v17 = 2114;
    v18 = v9;
    v19 = 2048;
    v20 = v10;
    v21 = 2114;
    v22 = v11;
    _os_log_impl(&dword_1CFEF3000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> removing multiplexing view controller controller <%{public}@:%p> for %{public}@", (uint8_t *)&v13, 0x34u);

  }
  if (!objc_msgSend(v3, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "multiplexingViewControllersForIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "setViewController:forIdentifier:", 0, *(_QWORD *)(a1 + 40));
  }

}

- (void)validateActiveMultiplexingViewControllerForIdentifier:(id)a3
{
  -[SBHMultiplexingManager _modifyViewControllersForIdentifier:reusingCacheViewControllersIfNecessary:withBlock:](self, "_modifyViewControllersForIdentifier:reusingCacheViewControllersIfNecessary:withBlock:", a3, 0, &__block_literal_global_60);
}

- (void)_modifyViewControllersForIdentifier:(id)a3 reusingCacheViewControllersIfNecessary:(BOOL)a4 withBlock:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  objc_class *v22;
  const char *v23;
  objc_class *v24;
  objc_class *v25;
  objc_class *v26;
  objc_class *v27;
  void *v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  _BYTE v32[24];
  id v33;
  _BYTE v34[30];
  __int16 v35;
  id v36;
  uint64_t v37;

  v6 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  -[SBHMultiplexingManager _activeMultiplexingViewControllerForIdentifier:](self, "_activeMultiplexingViewControllerForIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9);

  -[SBHMultiplexingManager _activeMultiplexingViewControllerForIdentifier:](self, "_activeMultiplexingViewControllerForIdentifier:", v8);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10 == (void *)v11)
  {
    if (!v10)
      goto LABEL_26;
    objc_msgSend(v10, "multiplexedViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
      goto LABEL_26;
    SBLogWidgetMultiplexing();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v32 = 138544386;
    *(_QWORD *)&v32[4] = v15;
    *(_WORD *)&v32[12] = 2048;
    *(_QWORD *)&v32[14] = self;
    *(_WORD *)&v32[22] = 2114;
    v33 = v17;
    *(_WORD *)v34 = 2048;
    *(_QWORD *)&v34[2] = v10;
    *(_WORD *)&v34[10] = 2114;
    *(_QWORD *)&v34[12] = v8;
    v23 = "<%{public}@:%p> active view controller did not change but does not have the active multiplexed view controller"
          ": <%{public}@:%p> for %{public}@";
    goto LABEL_16;
  }
  if (!v10 || !v11)
  {
    if (v10)
    {
      SBLogWidgetMultiplexing();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        goto LABEL_18;
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v32 = 138544386;
      *(_QWORD *)&v32[4] = v15;
      *(_WORD *)&v32[12] = 2048;
      *(_QWORD *)&v32[14] = self;
      *(_WORD *)&v32[22] = 2114;
      v33 = v17;
      *(_WORD *)v34 = 2048;
      *(_QWORD *)&v34[2] = v10;
      *(_WORD *)&v34[10] = 2114;
      *(_QWORD *)&v34[12] = v8;
      v23 = "<%{public}@:%p> active view controller changed from <%{public}@:%p> to NONE for %{public}@";
    }
    else
    {
      if (!v11)
        goto LABEL_19;
      SBLogWidgetMultiplexing();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        goto LABEL_18;
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v32 = 138544386;
      *(_QWORD *)&v32[4] = v15;
      *(_WORD *)&v32[12] = 2048;
      *(_QWORD *)&v32[14] = self;
      *(_WORD *)&v32[22] = 2114;
      v33 = v17;
      *(_WORD *)v34 = 2048;
      *(_QWORD *)&v34[2] = v12;
      *(_WORD *)&v34[10] = 2114;
      *(_QWORD *)&v34[12] = v8;
      v23 = "<%{public}@:%p> active view controller changed NONE to <%{public}@:%p> for %{public}@";
    }
LABEL_16:
    _os_log_impl(&dword_1CFEF3000, v13, OS_LOG_TYPE_DEFAULT, v23, v32, 0x34u);
    goto LABEL_17;
  }
  SBLogWidgetMultiplexing();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v32 = 138544898;
    *(_QWORD *)&v32[4] = v15;
    *(_WORD *)&v32[12] = 2048;
    *(_QWORD *)&v32[14] = self;
    *(_WORD *)&v32[22] = 2114;
    v33 = v17;
    *(_WORD *)v34 = 2048;
    *(_QWORD *)&v34[2] = v10;
    *(_WORD *)&v34[10] = 2114;
    *(_QWORD *)&v34[12] = v19;
    *(_WORD *)&v34[20] = 2048;
    *(_QWORD *)&v34[22] = v12;
    v35 = 2114;
    v36 = v8;
    _os_log_impl(&dword_1CFEF3000, v13, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> active view controller changed from <%{public}@:%p> to <%{public}@:%p> for %{public}@", v32, 0x48u);

LABEL_17:
  }
LABEL_18:

LABEL_19:
  -[NSMutableDictionary objectForKey:](self->_viewControllersForIdentifier, "objectForKey:", v8, *(_OWORD *)v32, *(_QWORD *)&v32[16], v33, *(_OWORD *)v34, *(_QWORD *)&v34[16]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v28 && v6)
  {
    -[NSMutableDictionary objectForKey:](self->_cachedRecentViewControllersForIdentifier, "objectForKey:", v8);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      SBLogWidgetMultiplexing();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v32 = 138543874;
        *(_QWORD *)&v32[4] = v31;
        *(_WORD *)&v32[12] = 2048;
        *(_QWORD *)&v32[14] = self;
        *(_WORD *)&v32[22] = 2114;
        v33 = v8;
        _os_log_impl(&dword_1CFEF3000, v29, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Reusing recent view controller for identifier: %{public}@", v32, 0x20u);

      }
      -[NSMutableDictionary setObject:forKey:](self->_viewControllersForIdentifier, "setObject:forKey:", v28, v8);
      -[NSMutableDictionary removeObjectForKey:](self->_cachedRecentViewControllersForIdentifier, "removeObjectForKey:", v8);
      -[NSMutableOrderedSet removeObject:](self->_cachedRecentViewControllerIdentifiers, "removeObject:", v8);
    }
  }
  objc_msgSend(v12, "activateWithViewController:", v28);
  objc_msgSend(v10, "deactivate");

LABEL_26:
}

- (id)_activeMultiplexingViewControllerForIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NSMutableDictionary objectForKey:](self->_multiplexingViewControllersForIdentifier, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_10_1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __73__SBHMultiplexingManager__activeMultiplexingViewControllerForIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "level");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "level");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

- (BOOL)_cacheLastDiscardedViewController:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  BOOL v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  NSMutableDictionary *cachedRecentViewControllersForIdentifier;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  NSMutableOrderedSet *cachedRecentViewControllerIdentifiers;
  NSMutableOrderedSet *v18;
  NSMutableOrderedSet *v19;
  int v21;
  void *v22;
  __int16 v23;
  SBHMultiplexingManager *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[SBHMultiplexingManager cachedRecentViewControllerCountLimit](self, "cachedRecentViewControllerCountLimit");
  v9 = 0;
  if (v6 && v8)
  {
    -[SBHMultiplexingManager delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0
      && !objc_msgSend(v10, "multiplexingManager:shouldCacheRecentViewController:forIdentifier:", self, v6, v7))
    {
      v9 = 0;
    }
    else
    {
      SBLogWidgetMultiplexing();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543874;
        v22 = v13;
        v23 = 2048;
        v24 = self;
        v25 = 2114;
        v26 = v7;
        _os_log_impl(&dword_1CFEF3000, v11, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Caching recent view controller for identifier: %{public}@", (uint8_t *)&v21, 0x20u);

      }
      cachedRecentViewControllersForIdentifier = self->_cachedRecentViewControllersForIdentifier;
      if (!cachedRecentViewControllersForIdentifier)
      {
        v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v16 = self->_cachedRecentViewControllersForIdentifier;
        self->_cachedRecentViewControllersForIdentifier = v15;

        cachedRecentViewControllersForIdentifier = self->_cachedRecentViewControllersForIdentifier;
      }
      -[NSMutableDictionary setObject:forKey:](cachedRecentViewControllersForIdentifier, "setObject:forKey:", v6, v7);
      cachedRecentViewControllerIdentifiers = self->_cachedRecentViewControllerIdentifiers;
      if (!cachedRecentViewControllerIdentifiers)
      {
        v18 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
        v19 = self->_cachedRecentViewControllerIdentifiers;
        self->_cachedRecentViewControllerIdentifiers = v18;

        cachedRecentViewControllerIdentifiers = self->_cachedRecentViewControllerIdentifiers;
      }
      -[NSMutableOrderedSet removeObject:](cachedRecentViewControllerIdentifiers, "removeObject:", v7);
      -[NSMutableOrderedSet insertObject:atIndex:](self->_cachedRecentViewControllerIdentifiers, "insertObject:atIndex:", v7, 0);
      -[SBHMultiplexingManager _trimCachedRecentViewControllers](self, "_trimCachedRecentViewControllers");
      v9 = 1;
    }

  }
  return v9;
}

- (void)_trimCachedRecentViewControllers
{
  unint64_t v3;
  unint64_t v4;
  __int128 v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  __int128 v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  SBHMultiplexingManager *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = -[SBHMultiplexingManager cachedRecentViewControllerCountLimit](self, "cachedRecentViewControllerCountLimit");
  v4 = -[NSMutableOrderedSet count](self->_cachedRecentViewControllerIdentifiers, "count");
  if (v4 >= v3)
    v6 = v4 - v3;
  else
    v6 = 0;
  if (v4 > v3)
  {
    v7 = 0;
    *(_QWORD *)&v5 = 138543874;
    v15 = v5;
    do
    {
      -[NSMutableOrderedSet lastObject](self->_cachedRecentViewControllerIdentifiers, "lastObject", v15);
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
        break;
      v9 = (void *)v8;
      SBLogWidgetMultiplexing();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v15;
        v17 = v12;
        v18 = 2048;
        v19 = self;
        v20 = 2114;
        v21 = v9;
        _os_log_impl(&dword_1CFEF3000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Discarding oldest view controller for identifier: %{public}@", buf, 0x20u);

      }
      -[NSMutableDictionary objectForKey:](self->_cachedRecentViewControllersForIdentifier, "objectForKey:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "multiplexingManager:willRemoveViewController:forIdentifier:", self, v13, v9);

      -[NSMutableDictionary removeObjectForKey:](self->_cachedRecentViewControllersForIdentifier, "removeObjectForKey:", v9);
      -[NSMutableOrderedSet removeObject:](self->_cachedRecentViewControllerIdentifiers, "removeObject:", v9);

      ++v7;
    }
    while (v7 < v6);
  }
}

- (void)setCachedRecentViewControllerCountLimit:(unint64_t)a3
{
  if (self->_cachedRecentViewControllerCountLimit != a3)
  {
    self->_cachedRecentViewControllerCountLimit = a3;
    -[SBHMultiplexingManager _trimCachedRecentViewControllers](self, "_trimCachedRecentViewControllers");
  }
}

- (void)discardCachedRecentViewControllersForIdentifier:(id)a3
{
  void *v4;
  id WeakRetained;
  id v6;

  v6 = a3;
  -[NSMutableDictionary objectForKey:](self->_cachedRecentViewControllersForIdentifier, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "multiplexingManager:willRemoveViewController:forIdentifier:", self, v4, v6);

    -[NSMutableDictionary removeObjectForKey:](self->_cachedRecentViewControllersForIdentifier, "removeObjectForKey:", v6);
    -[NSMutableOrderedSet removeObject:](self->_cachedRecentViewControllerIdentifiers, "removeObject:", v6);
  }

}

- (void)discardCachedRecentViewControllers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary allKeys](self->_cachedRecentViewControllersForIdentifier, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[SBHMultiplexingManager discardCachedRecentViewControllersForIdentifier:](self, "discardCachedRecentViewControllersForIdentifier:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)enumerateAllViewControllersUsingBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __64__SBHMultiplexingManager_enumerateAllViewControllersUsingBlock___block_invoke;
  v12 = &unk_1E8D8C238;
  v5 = v4;
  v13 = v5;
  v14 = &v15;
  v6 = _Block_copy(&v9);
  -[SBHMultiplexingManager viewControllersForIdentifier](self, "viewControllersForIdentifier", v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v6);

  if (!*((_BYTE *)v16 + 24))
  {
    -[SBHMultiplexingManager cachedRecentViewControllersForIdentifier](self, "cachedRecentViewControllersForIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v6);

  }
  _Block_object_dispose(&v15, 8);

}

uint64_t __64__SBHMultiplexingManager_enumerateAllViewControllersUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  char v7;

  v7 = 0;
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (id)description
{
  return -[SBHMultiplexingManager descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("\t"));
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBHMultiplexingManager descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_viewControllersForIdentifier, CFSTR("viewControllersForIdentifier"));
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", self->_multiplexingViewControllersForIdentifier, CFSTR("multiplexingViewControllersForIdentifier"));
  v7 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_cachedRecentViewControllersForIdentifier, CFSTR("cachedRecentViewControllersForIdentifier"), 1);
  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHMultiplexingManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (unint64_t)cachedRecentViewControllerCountLimit
{
  return self->_cachedRecentViewControllerCountLimit;
}

- (SBHMultiplexingManagerDelegate)delegate
{
  return (SBHMultiplexingManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)viewControllersForIdentifier
{
  return self->_viewControllersForIdentifier;
}

- (void)setViewControllersForIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_viewControllersForIdentifier, a3);
}

- (NSMutableDictionary)multiplexingViewControllersForIdentifier
{
  return self->_multiplexingViewControllersForIdentifier;
}

- (void)setMultiplexingViewControllersForIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_multiplexingViewControllersForIdentifier, a3);
}

- (NSMutableDictionary)cachedRecentViewControllersForIdentifier
{
  return self->_cachedRecentViewControllersForIdentifier;
}

- (void)setCachedRecentViewControllersForIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cachedRecentViewControllersForIdentifier, a3);
}

- (NSMutableOrderedSet)cachedRecentViewControllerIdentifiers
{
  return self->_cachedRecentViewControllerIdentifiers;
}

- (void)setCachedRecentViewControllerIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_cachedRecentViewControllerIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedRecentViewControllerIdentifiers, 0);
  objc_storeStrong((id *)&self->_cachedRecentViewControllersForIdentifier, 0);
  objc_storeStrong((id *)&self->_multiplexingViewControllersForIdentifier, 0);
  objc_storeStrong((id *)&self->_viewControllersForIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)newMultiplexingViewControllerForIdentifier:(uint64_t)a3 atLevel:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("SBHMultiplexingManager.m");
  v16 = 1024;
  v17 = 95;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1CFEF3000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
