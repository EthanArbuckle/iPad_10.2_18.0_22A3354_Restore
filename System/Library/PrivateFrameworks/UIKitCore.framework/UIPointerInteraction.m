@implementation UIPointerInteraction

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)_viewTraitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a3;
  -[UIPointerInteraction view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");
  v8 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v7 != v8)
    -[UIPointerInteraction _updateInteractionIsEnabled](self, "_updateInteractionIsEnabled");
}

- (void)willMoveToView:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_drivers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setView:", 0, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  objc_storeWeak((id *)&self->_view, 0);
}

- (void)_updateInteractionIsEnabled
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[UIPointerInteraction view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v3 && self->_enabled && (v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = self->_drivers;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v10++), "setView:", v3);
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v8);
    }

  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = self->_drivers;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v15++), "setView:", 0, (_QWORD)v17);
        }
        while (v13 != v15);
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v13);
    }

    if (self->_observingPresentationNotification)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeObserver:name:object:", self, CFSTR("UIPresentationControllerPresentationTransitionWillBeginNotification"), 0);

      self->_observingPresentationNotification = 0;
    }
  }

}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)didMoveToView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
  -[UIPointerInteraction _updateInteractionIsEnabled](self, "_updateInteractionIsEnabled");
}

- (void)invalidate
{
  UIPointerRegion *defaultRegion;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  defaultRegion = self->_defaultRegion;
  if (defaultRegion)
  {
    self->_defaultRegion = 0;

    ++self->_generationID;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = self->_drivers;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "invalidate", (_QWORD)v9);
        }
        while (v6 != v8);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)setEnabled:(BOOL)enabled
{
  if (self->_enabled != enabled)
  {
    self->_enabled = enabled;
    -[UIPointerInteraction _updateInteractionIsEnabled](self, "_updateInteractionIsEnabled");
  }
}

- (UIPointerInteraction)initWithDelegate:(id)delegate
{
  id v4;
  char *v5;
  UIPointerInteraction *v6;
  id v7;
  id v8;
  id WeakRetained;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSArray *v15;
  _UIPointerInteractionPencilHoverDriver *v16;
  _UIPointerInteractionHoverDriver *v17;
  NSArray *drivers;
  objc_super v20;

  v4 = delegate;
  v20.receiver = self;
  v20.super_class = (Class)UIPointerInteraction;
  v5 = -[UIPointerInteraction init](&v20, sel_init);
  v6 = (UIPointerInteraction *)v5;
  if (v5)
  {
    *(_WORD *)(v5 + 25) = 257;
    v7 = objc_storeWeak((id *)v5 + 6, v4);
    v6->_observingPresentationNotification = 0;
    v8 = v7;

    if (v4)
    {
      WeakRetained = objc_loadWeakRetained((id *)&v6->_delegate);
      v6->_delegateImplements.regionForRequest = objc_opt_respondsToSelector() & 1;

      v10 = objc_loadWeakRetained((id *)&v6->_delegate);
      v6->_delegateImplements.styleForRegion = objc_opt_respondsToSelector() & 1;

      v11 = objc_loadWeakRetained((id *)&v6->_delegate);
      v6->_delegateImplements.willEnterRegionAnimator = objc_opt_respondsToSelector() & 1;

      v12 = objc_loadWeakRetained((id *)&v6->_delegate);
      v6->_delegateImplements.willExitRegionAnimator = objc_opt_respondsToSelector() & 1;

      v13 = objc_loadWeakRetained((id *)&v6->_delegate);
      v6->_delegateImplements.asyncRegionForRequest = objc_opt_respondsToSelector() & 1;

      v14 = objc_loadWeakRetained((id *)&v6->_delegate);
      v6->_delegateImplements.targetRegionForDeceleratingPointerWithRequests = objc_opt_respondsToSelector() & 1;

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (_os_feature_enabled_impl())
    {
      v16 = -[_UIPointerInteractionPencilHoverDriver initWithSink:]([_UIPointerInteractionPencilHoverDriver alloc], "initWithSink:", v6);
      -[NSArray addObject:](v15, "addObject:", v16);

    }
    v17 = -[_UIPointerInteractionHoverDriver initWithSink:]([_UIPointerInteractionHoverDriver alloc], "initWithSink:", v6);
    -[NSArray addObject:](v15, "addObject:", v17);

    drivers = v6->_drivers;
    v6->_drivers = v15;

  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentRegion, 0);
  objc_storeStrong((id *)&self->_currentRegion, 0);
  objc_storeStrong((id *)&self->_drivers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_defaultRegion, 0);
  objc_destroyWeak((id *)&self->_view);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_observingPresentationNotification)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIPresentationControllerPresentationTransitionWillBeginNotification"), 0);

  }
  v4.receiver = self;
  v4.super_class = (Class)UIPointerInteraction;
  -[UIPointerInteraction dealloc](&v4, sel_dealloc);
}

- (UIPointerInteraction)init
{
  return -[UIPointerInteraction initWithDelegate:](self, "initWithDelegate:", 0);
}

- (BOOL)_supportsAssociation
{
  return 1;
}

- (id)_targetedPreviewForContinuingEffectWithPreview:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[UIPointerInteraction currentRegion](self, "currentRegion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[_UIContentEffectManager sharedManager](_UIContentEffectManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPointerInteraction currentRegion](self, "currentRegion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "previewForContinuingToEffectWithPreview:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (UIPointerRegion)defaultRegion
{
  UIPointerRegion *defaultRegion;
  void *v4;
  UIPointerRegion *v5;
  UIPointerRegion *v6;

  defaultRegion = self->_defaultRegion;
  if (!defaultRegion)
  {
    -[UIPointerInteraction view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", 0);
    v5 = (UIPointerRegion *)objc_claimAutoreleasedReturnValue();
    v6 = self->_defaultRegion;
    self->_defaultRegion = v5;

    defaultRegion = self->_defaultRegion;
  }
  return defaultRegion;
}

- (void)driver:(id)a3 didIssueUpdate:(id *)a4
{
  id v6;
  double x;
  double y;
  int64_t var2;
  int64_t var3;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  double var1;
  double z;
  void *v27;
  void *v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, void *);
  void *v34;
  id v35;
  UIPointerInteraction *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  double var6;
  char v42;
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  x = a4->var0.x;
  y = a4->var0.y;
  var2 = a4->var2;
  var3 = a4->var3;
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setLocation:", x, y);
  objc_msgSend(v11, "setModifiers:", var2);
  objc_msgSend(v11, "set_pointerType:", objc_msgSend(v6, "type"));
  v31 = MEMORY[0x1E0C809B0];
  v32 = 3221225472;
  v33 = __46__UIPointerInteraction_driver_didIssueUpdate___block_invoke;
  v34 = &unk_1E16E7E00;
  v12 = v6;
  v42 = var3 & 1;
  v35 = v12;
  v36 = self;
  v13 = *(_OWORD *)&a4->var4;
  v39 = *(_OWORD *)&a4->var2;
  v40 = v13;
  var6 = a4->var6;
  v14 = *(_OWORD *)&a4->var0.z;
  v37 = *(_OWORD *)&a4->var0.x;
  v38 = v14;
  -[UIPointerInteraction _queryDelegateForRegionWithRequest:completion:forceSynchronous:](self, "_queryDelegateForRegionWithRequest:completion:forceSynchronous:", v11, &v31, 0);
  -[UIPointerInteraction currentRegion](self, "currentRegion", v31, v32, v33, v34);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15 && ((var3 & 1) == 0 || (objc_msgSend(v15, "_isLatching") & 1) == 0))
  {
    if (-[UIPointerInteraction _regionContainsCurrentHoverLocation:](self, "_regionContainsCurrentHoverLocation:", v16))
    {
      +[_UIContentEffectManager sharedManager](_UIContentEffectManager, "sharedManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPointerInteraction currentRegion](self, "currentRegion");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "setPressed:animated:", var3 != 0, 1);
    }
    else
    {
      v20 = driver_didIssueUpdate____s_category;
      if (!driver_didIssueUpdate____s_category)
      {
        v20 = __UILogCategoryGetNode("UIPointerInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v20, (unint64_t *)&driver_didIssueUpdate____s_category);
      }
      v21 = *(NSObject **)(v20 + 8);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v44 = v16;
        _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_DEFAULT, "auto exiting region: %@", buf, 0xCu);
      }
      -[UIPointerInteraction _pointerDidExit](self, "_pointerDidExit");
    }
  }
  +[_UIContentEffectManager sharedManager](_UIContentEffectManager, "sharedManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPointerInteraction currentRegion](self, "currentRegion");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    z = a4->var0.z;
    var1 = a4->var1;
    if (var1 > z)
    {
      objc_msgSend(v24, "setLiftProgress:", 1.0 - fmax(fmin((z / var1 + -0.6) / 0.4, 1.0), 0.0));
      goto LABEL_22;
    }
    objc_msgSend(v24, "style");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "pointerEffect");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28)
    {
LABEL_21:

      goto LABEL_22;
    }
    v29 = a4->var6;
    if (v29 <= 0.0)
    {
      if (v29 >= 0.0)
      {
LABEL_20:
        objc_msgSend(v24, "setLiftProgress:", 1.0 - v29);
        goto LABEL_21;
      }
      v30 = -2.5;
    }
    else
    {
      v30 = 2.5;
    }
    v29 = (1.0 - 1.0 / (v29 / v30 * 0.55 + 1.0)) * v30;
    goto LABEL_20;
  }
LABEL_22:

}

void __46__UIPointerInteraction_driver_didIssueUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  int v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[4];
  uint64_t v12;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "allowsUpdatesWhilePrimaryButtonIsPressed") & 1) != 0)
    goto LABEL_6;
  if (!*(_BYTE *)(a1 + 120))
    goto LABEL_6;
  objc_msgSend(*(id *)(a1 + 40), "currentRegion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_isLatching");

  if ((v5 & 1) == 0)
  {
    if ((objc_msgSend(v3, "_isLatching") & 1) != 0
      || (objc_msgSend(*(id *)(a1 + 40), "mostRecentRegion"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v3, "isEqual:", v6),
          v6,
          v7))
    {
LABEL_6:
      v8 = *(void **)(a1 + 40);
      v9 = *(_OWORD *)(a1 + 96);
      v11[2] = *(_OWORD *)(a1 + 80);
      v11[3] = v9;
      v12 = *(_QWORD *)(a1 + 112);
      v10 = *(_OWORD *)(a1 + 64);
      v11[0] = *(_OWORD *)(a1 + 48);
      v11[1] = v10;
      objc_msgSend(v8, "_updateCurrentRegionIfNecessary:update:", v3, v11);
    }
  }

}

- (void)driver:(id)a3 willAttachHoverGestureRecognizer:(id)a4 toView:(id)a5
{
  id v6;

  v6 = a4;
  objc_msgSend(v6, "_setPausesWhilePanning:", -[UIPointerInteraction _pausesPointerUpdatesWhilePanning](self, "_pausesPointerUpdatesWhilePanning"));

}

- (void)_pointerDidExit
{
  _OWORD v2[4];
  uint64_t v3;

  v3 = 0;
  memset(v2, 0, sizeof(v2));
  -[UIPointerInteraction _updateCurrentRegionIfNecessary:update:](self, "_updateCurrentRegionIfNecessary:update:", 0, v2);
}

- (void)_updateCurrentRegionIfNecessary:(id)a3 update:(id *)a4
{
  id v6;
  void *v7;
  int64_t v8;
  int64_t var2;
  id v10;
  id v11;
  void *v12;
  int v13;
  BOOL v14;
  BOOL v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  double var6;

  v6 = a3;
  -[UIPointerInteraction currentRegion](self, "currentRegion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UIPointerInteraction currentModifiers](self, "currentModifiers");
  var2 = a4->var2;
  v10 = v6;
  v11 = v7;
  v12 = v11;
  if (v11 == v10)
  {
    v13 = 1;
    goto LABEL_6;
  }
  if (v10 && v11)
  {
    v13 = objc_msgSend(v10, "isEqual:", v11);
LABEL_6:

    v14 = var2 == v8;
    v15 = var2 == v8;
    if (v13 && v14)
      goto LABEL_20;
    goto LABEL_10;
  }

  LOBYTE(v13) = 0;
  v15 = var2 == v8;
LABEL_10:
  if (v12 && (v13 & 1) == 0)
    -[UIPointerInteraction _pointerDidExitRegion:willEnterNewRegion:](self, "_pointerDidExitRegion:willEnterNewRegion:", v12, v10 != 0);
  -[UIPointerInteraction setCurrentRegion:](self, "setCurrentRegion:", v10);
  -[UIPointerInteraction setCurrentModifiers:](self, "setCurrentModifiers:", var2);
  -[UIPointerInteraction currentRegion](self, "currentRegion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    if ((v13 & 1) != 0)
    {
      if (!v15)
      {
        v17 = *(_OWORD *)&a4->var4;
        v23 = *(_OWORD *)&a4->var2;
        v24 = v17;
        var6 = a4->var6;
        v18 = *(_OWORD *)&a4->var0.z;
        v21 = *(_OWORD *)&a4->var0.x;
        v22 = v18;
        -[UIPointerInteraction _modifiersDidChangeInRegion:update:](self, "_modifiersDidChangeInRegion:update:", v16, &v21);
      }
    }
    else
    {
      v19 = *(_OWORD *)&a4->var4;
      v23 = *(_OWORD *)&a4->var2;
      v24 = v19;
      var6 = a4->var6;
      v20 = *(_OWORD *)&a4->var0.z;
      v21 = *(_OWORD *)&a4->var0.x;
      v22 = v20;
      -[UIPointerInteraction _pointerDidEnterRegion:update:](self, "_pointerDidEnterRegion:update:", v16, &v21);
    }
    -[UIPointerInteraction setMostRecentRegion:](self, "setMostRecentRegion:", v16);
  }

LABEL_20:
}

- (void)_pointerDidEnterRegion:(id)a3 update:(id *)a4
{
  id v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  void *v12;
  _OWORD v13[4];
  double var6;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _pointerDidEnterRegion_update____s_category;
  if (!_pointerDidEnterRegion_update____s_category)
  {
    v7 = __UILogCategoryGetNode("UIPointerInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v7, (unint64_t *)&_pointerDidEnterRegion_update____s_category);
  }
  v8 = *(NSObject **)(v7 + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v13[0]) = 138412290;
    *(_QWORD *)((char *)v13 + 4) = v6;
    _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "Entered region: %@", (uint8_t *)v13, 0xCu);
  }
  -[UIPointerInteraction _updateDebugUIForRegionIfEnabled:](self, "_updateDebugUIForRegionIfEnabled:", v6);
  -[UIPointerInteraction _notifyDelegate_willEnterRegion:](self, "_notifyDelegate_willEnterRegion:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_OWORD *)&a4->var4;
  v13[2] = *(_OWORD *)&a4->var2;
  v13[3] = v10;
  var6 = a4->var6;
  v11 = *(_OWORD *)&a4->var0.z;
  v13[0] = *(_OWORD *)&a4->var0.x;
  v13[1] = v11;
  -[UIPointerInteraction _updatePointerStyleForRegion:update:animator:](self, "_updatePointerStyleForRegion:update:animator:", v6, v13, v9);
  if (!self->_observingPresentationNotification)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", self, sel__handlePresentationNotification_, CFSTR("UIPresentationControllerPresentationTransitionWillBeginNotification"), 0);

    self->_observingPresentationNotification = 1;
  }

}

- (void)_handlePresentationNotification:(id)a3
{
  void *v4;
  char isKindOfClass;
  unint64_t v6;
  NSObject *v7;
  uint8_t v8[16];

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v6 = _handlePresentationNotification____s_category;
    if (!_handlePresentationNotification____s_category)
    {
      v6 = __UILogCategoryGetNode("UIPointerInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&_handlePresentationNotification____s_category);
    }
    v7 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "Invalidating due to presentation.", v8, 2u);
    }
    -[UIPointerInteraction invalidate](self, "invalidate");
  }
}

- (void)_pointerDidExitRegion:(id)a3 willEnterNewRegion:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _pointerDidExitRegion_willEnterNewRegion____s_category;
  if (!_pointerDidExitRegion_willEnterNewRegion____s_category)
  {
    v7 = __UILogCategoryGetNode("UIPointerInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v7, (unint64_t *)&_pointerDidExitRegion_willEnterNewRegion____s_category);
  }
  v8 = *(NSObject **)(v7 + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    NSStringFromBOOL();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412546;
    v18 = v6;
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "Exited region: %@, is entering new region: %@", (uint8_t *)&v17, 0x16u);

  }
  -[UIPointerInteraction _updateDebugUIForRegionIfEnabled:](self, "_updateDebugUIForRegionIfEnabled:", 0);
  if (self->_observingPresentationNotification)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObserver:name:object:", self, CFSTR("UIPresentationControllerPresentationTransitionWillBeginNotification"), 0);

    self->_observingPresentationNotification = 0;
  }
  -[UIPointerInteraction _notifyDelegate_willExitRegion:](self, "_notifyDelegate_willExitRegion:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIContentEffectManager sharedManager](_UIContentEffectManager, "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPointerInteraction currentRegion](self, "currentRegion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v15, "setExitAnimator:", v12);
    objc_msgSend(v15, "end:", v4);
  }
  else
  {
    -[UIPointerInteraction _runAlongsideAnimator:](self, "_runAlongsideAnimator:", v12);
    if (!v4)
    {
      +[_UIPointerArbiter sharedArbiter](_UIPointerArbiter, "sharedArbiter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "exitRegion:removeStyle:completion:", v6, 1, 0);

    }
  }

}

- (void)_runAlongsideAnimator:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDampingRatio:response:", 1.0, 0.4);
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__UIPointerInteraction__runAlongsideAnimator___block_invoke;
  v9[3] = &unk_1E16B1B28;
  v10 = v3;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __46__UIPointerInteraction__runAlongsideAnimator___block_invoke_2;
  v7[3] = &unk_1E16B2588;
  v8 = v10;
  v6 = v10;
  +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v4, 0, v9, v7);

}

uint64_t __46__UIPointerInteraction__runAlongsideAnimator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performAllAnimations");
}

uint64_t __46__UIPointerInteraction__runAlongsideAnimator___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "performAllCompletions:", a2);
}

- (void)_modifiersDidChangeInRegion:(id)a3 update:(id *)a4
{
  id v6;
  unint64_t v7;
  NSObject *v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[4];
  double var6;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _modifiersDidChangeInRegion_update____s_category;
  if (!_modifiersDidChangeInRegion_update____s_category)
  {
    v7 = __UILogCategoryGetNode("UIPointerInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v7, (unint64_t *)&_modifiersDidChangeInRegion_update____s_category);
  }
  v8 = *(NSObject **)(v7 + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v11[0]) = 138412290;
    *(_QWORD *)((char *)v11 + 4) = v6;
    _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "Modifiers changed in region: %@", (uint8_t *)v11, 0xCu);
  }
  v9 = *(_OWORD *)&a4->var4;
  v11[2] = *(_OWORD *)&a4->var2;
  v11[3] = v9;
  var6 = a4->var6;
  v10 = *(_OWORD *)&a4->var0.z;
  v11[0] = *(_OWORD *)&a4->var0.x;
  v11[1] = v10;
  -[UIPointerInteraction _updatePointerStyleForRegion:update:animator:](self, "_updatePointerStyleForRegion:update:animator:", v6, v11, 0);

}

- (id)_notifyDelegate_willEnterRegion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UIPointerInteraction.entranceAnimator.%@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDebugName:", v6);

  if (self->_delegateImplements.willEnterRegionAnimator)
  {
    -[UIPointerInteraction delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pointerInteraction:willEnterRegion:animator:", self, v4, v5);

  }
  return v5;
}

- (id)_notifyDelegate_willExitRegion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UIPointerInteraction.exitAnimator.%@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDebugName:", v6);

  if (self->_delegateImplements.willExitRegionAnimator)
  {
    -[UIPointerInteraction delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pointerInteraction:willExitRegion:animator:", self, v4, v5);

  }
  return v5;
}

- (void)_updatePointerStyleForRegion:(id)a3 update:(id *)a4 animator:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a5;
  -[UIPointerInteraction _pointerStyleForRegion:](self, "_pointerStyleForRegion:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!a4->var5)
    objc_msgSend(v9, "_adaptForNonSystemEffectSupportingEnvironment");
  -[UIPointerInteraction _applyPointerStyle:forRegion:animator:](self, "_applyPointerStyle:forRegion:animator:", v10, v11, v8);

}

- (void)_applyPointerStyle:(id)a3 forRegion:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && objc_msgSend(v8, "type") == 1)
  {
    +[_UIContentEffectManager sharedManager](_UIContentEffectManager, "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __62__UIPointerInteraction__applyPointerStyle_forRegion_animator___block_invoke;
    v15[3] = &unk_1E16E7E28;
    v16 = v8;
    v17 = v9;
    objc_msgSend(v11, "compatibleEffectForKey:descriptor:constructor:", v17, v16, v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setEntranceAnimator:", v10);
    objc_msgSend(v12, "begin");

  }
  else
  {
    +[_UIPointerArbiter sharedArbiter](_UIPointerArbiter, "sharedArbiter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __62__UIPointerInteraction__applyPointerStyle_forRegion_animator___block_invoke_2;
    v14[3] = &unk_1E16E7E50;
    v14[4] = self;
    objc_msgSend(v13, "applyStyle:forRegion:effectSourceHandler:completion:", v8, v9, v14, 0);

    if (v8)
      -[UIPointerInteraction _runAlongsideAnimator:](self, "_runAlongsideAnimator:", v10);
  }

}

_UIPointerContentEffect *__62__UIPointerInteraction__applyPointerStyle_forRegion_animator___block_invoke(uint64_t a1)
{
  return -[_UIPointerContentEffect initWithStyle:region:]([_UIPointerContentEffect alloc], "initWithStyle:region:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __62__UIPointerInteraction__applyPointerStyle_forRegion_animator___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 != v7)
  {

LABEL_4:
    objc_msgSend(v7, "addSubview:", v10);
    objc_msgSend(v7, "addSubview:", v5);
    goto LABEL_5;
  }
  objc_msgSend(v5, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 != v7)
    goto LABEL_4;
LABEL_5:

}

- (id)_pointerRegionAtPoint:(CGPoint)a3 modifiers:(int64_t)a4
{
  double y;
  double x;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  y = a3.y;
  x = a3.x;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__218;
  v16 = __Block_byref_object_dispose__218;
  v17 = 0;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setLocation:", x, y);
  objc_msgSend(v8, "setModifiers:", a4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__UIPointerInteraction__pointerRegionAtPoint_modifiers___block_invoke;
  v11[3] = &unk_1E16E7E78;
  v11[4] = &v12;
  -[UIPointerInteraction _queryDelegateForRegionWithRequest:completion:forceSynchronous:](self, "_queryDelegateForRegionWithRequest:completion:forceSynchronous:", v8, v11, 1);
  v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v9;
}

void __56__UIPointerInteraction__pointerRegionAtPoint_modifiers___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)_regionContainsCurrentHoverLocation:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  NSArray *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;
  CGPoint v39;
  CGRect v40;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = self->_drivers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v9);
      if ((objc_msgSend(v10, "isActive", (_QWORD)v33) & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v12 = v10;

    if (!v12)
    {
      v11 = 0;
      goto LABEL_16;
    }
    -[UIPointerInteraction view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray locationInView:](v12, "locationInView:", v13);
    v15 = v14;
    v17 = v16;

    -[UIPointerInteraction view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "referenceView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18 != v19)
    {
      objc_msgSend(v4, "referenceView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_window");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "screen");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "fixedCoordinateSpace");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIPointerInteraction view](self, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "convertPoint:toCoordinateSpace:", v23, v15, v17);
      v26 = v25;
      v28 = v27;

      objc_msgSend(v4, "referenceView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "convertPoint:fromCoordinateSpace:", v23, v26, v28);
      v15 = v30;
      v17 = v31;

    }
    objc_msgSend(v4, "rect");
    v39.x = v15;
    v39.y = v17;
    v11 = CGRectContainsPoint(v40, v39);
  }
  else
  {
LABEL_9:
    v11 = 0;
    v12 = v5;
  }

LABEL_16:
  return v11;
}

- (void)_queryDelegateForRegionWithRequest:(id)a3 completion:(id)a4 forceSynchronous:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void (**v12)(void *, void *);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  void (**v18)(void *, void *);
  _QWORD aBlock[5];
  id v20;
  BOOL v21;

  v8 = a3;
  v9 = a4;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__UIPointerInteraction__queryDelegateForRegionWithRequest_completion_forceSynchronous___block_invoke;
  aBlock[3] = &unk_1E16E7EA0;
  aBlock[4] = self;
  v21 = a5;
  v11 = v9;
  v20 = v11;
  v12 = (void (**)(void *, void *))_Block_copy(aBlock);
  -[UIPointerInteraction delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPointerInteraction defaultRegion](self, "defaultRegion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPointerInteraction view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  objc_msgSend(v14, "setRect:");

  if (!v13)
    goto LABEL_7;
  if (a5 || !self->_delegateImplements.asyncRegionForRequest)
  {
    if (self->_delegateImplements.regionForRequest)
    {
      objc_msgSend(v13, "pointerInteraction:regionForRequest:defaultRegion:", self, v8, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, v16);

      goto LABEL_8;
    }
LABEL_7:
    v12[2](v12, v14);
    goto LABEL_8;
  }
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __87__UIPointerInteraction__queryDelegateForRegionWithRequest_completion_forceSynchronous___block_invoke_2;
  v17[3] = &unk_1E16E7EC8;
  v18 = v12;
  objc_msgSend(v13, "_pointerInteraction:regionForRequest:defaultRegion:completion:", self, v8, v14, v17);

LABEL_8:
}

void __87__UIPointerInteraction__queryDelegateForRegionWithRequest_completion_forceSynchronous___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  char v7;
  id v8;
  id v9;

  v3 = a2;
  if (!v3)
    goto LABEL_8;
  v8 = v3;
  objc_msgSend(v3, "setGenerationID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(v8, "referenceView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setReferenceView:", v5);

  }
  if (!*(_BYTE *)(a1 + 48))
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "_regionContainsCurrentHoverLocation:", v8);
    v6 = v8;
    if ((v7 & 1) != 0)
      goto LABEL_9;

LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  v6 = v8;
LABEL_9:
  v9 = v6;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __87__UIPointerInteraction__queryDelegateForRegionWithRequest_completion_forceSynchronous___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_pointerStyleForRegion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UITargetedPreview *v10;
  void *v11;
  UITargetedPreview *v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  void *v16;
  UIPointerInteraction *v17;
  objc_class *v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  __CFString *v29;
  void *v30;
  UIPointerInteraction *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  __CFString *v40;
  __int16 v41;
  __CFString *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIPointerInteraction delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    -[UIPointerInteraction view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = [UITargetedPreview alloc];
      -[UIPointerInteraction view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[UITargetedPreview initWithView:](v10, "initWithView:", v11);

      +[UIPointerEffect effectWithPreview:](UIPointerEffect, "effectWithPreview:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v13, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_20;
    }
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        goto LABEL_18;
      if (self)
      {
        v30 = (void *)MEMORY[0x1E0CB3940];
        v31 = self;
        v32 = (objc_class *)objc_opt_class();
        NSStringFromClass(v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringWithFormat:", CFSTR("<%@: %p>"), v33, v31);
        v29 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v29 = CFSTR("(nil)");
      }
      v21 = v29;
      -[UIPointerInteraction view](self, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v34 = (void *)MEMORY[0x1E0CB3940];
        v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "stringWithFormat:", CFSTR("<%@: %p>"), v36, v22);
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v26 = CFSTR("(nil)");
      }
      *(_DWORD *)buf = 138412802;
      v38 = v4;
      v39 = 2112;
      v40 = v21;
      v41 = 2112;
      v42 = v26;
      _os_log_fault_impl(&dword_185066000, v15, OS_LOG_TYPE_FAULT, "Unable to create default pointer style for region %@ provided to %@ attached to %@ since its view is not in a window. This most likely means the view (or an ancestor) was removed from the view hierarchy after receiving the pointer region.", buf, 0x20u);
    }
    else
    {
      v14 = _pointerStyleForRegion____s_category;
      if (!_pointerStyleForRegion____s_category)
      {
        v14 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v14, (unint64_t *)&_pointerStyleForRegion____s_category);
      }
      v15 = *(id *)(v14 + 8);
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        goto LABEL_18;
      if (self)
      {
        v16 = (void *)MEMORY[0x1E0CB3940];
        v17 = self;
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
      v21 = v20;
      -[UIPointerInteraction view](self, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
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
      *(_DWORD *)buf = 138412802;
      v38 = v4;
      v39 = 2112;
      v40 = v21;
      v41 = 2112;
      v42 = v26;
      _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "Unable to create default pointer style for region %@ provided to %@ attached to %@ since its view is not in a window. This most likely means the view (or an ancestor) was removed from the view hierarchy after receiving the pointer region.", buf, 0x20u);
    }

LABEL_18:
    goto LABEL_19;
  }
  if (!self->_delegateImplements.styleForRegion)
  {
LABEL_19:
    v7 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v5, "pointerInteraction:styleForRegion:", self, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:
  v27 = (void *)objc_msgSend(v7, "copy");

  return v27;
}

- (void)_updateDebugUIForRegionIfEnabled:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3
    && (+[_UIPointerSettingsDomain rootSettings](_UIPointerSettingsDomain, "rootSettings"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "showRegions"),
        v4,
        v5))
  {
    if (!_updateDebugUIForRegionIfEnabled____regionDebugView)
    {
      v6 = objc_opt_new();
      v7 = (void *)_updateDebugUIForRegionIfEnabled____regionDebugView;
      _updateDebugUIForRegionIfEnabled____regionDebugView = v6;

      objc_msgSend((id)_updateDebugUIForRegionIfEnabled____regionDebugView, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBorderWidth:", 1.0);

      +[UIColor magentaColor](UIColor, "magentaColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "colorWithAlphaComponent:", 0.75);
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v11 = objc_msgSend(v10, "CGColor");
      objc_msgSend((id)_updateDebugUIForRegionIfEnabled____regionDebugView, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setBorderColor:", v11);

      objc_msgSend((id)_updateDebugUIForRegionIfEnabled____regionDebugView, "setUserInteractionEnabled:", 0);
    }
    objc_msgSend(v3, "referenceView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "window");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "referenceView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rect");
    objc_msgSend(v15, "convertRect:toView:", v14);
    objc_msgSend((id)_updateDebugUIForRegionIfEnabled____regionDebugView, "setFrame:");

    objc_msgSend((id)_updateDebugUIForRegionIfEnabled____regionDebugView, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setZPosition:", 100000.0);

    objc_msgSend(v14, "addSubview:", _updateDebugUIForRegionIfEnabled____regionDebugView);
    v17 = (void *)objc_opt_new();
    objc_msgSend(v3, "referenceView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setSourceLayer:", v19);

    objc_msgSend(v17, "setDuration:", INFINITY);
    v20 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v3, "rect");
    objc_msgSend(v20, "valueWithCGPoint:", v22 + v21 * 0.5, v24 + v23 * 0.5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setSourcePoints:", v26);

    objc_msgSend((id)_updateDebugUIForRegionIfEnabled____regionDebugView, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "removeAnimationForKey:", CFSTR("PointerInteractionDebugViewMatchMove"));

    objc_msgSend((id)_updateDebugUIForRegionIfEnabled____regionDebugView, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addAnimation:forKey:", v17, CFSTR("PointerInteractionDebugViewMatchMove"));

  }
  else
  {
    objc_msgSend((id)_updateDebugUIForRegionIfEnabled____regionDebugView, "removeFromSuperview");
  }

}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSArray)drivers
{
  return self->_drivers;
}

- (void)setDrivers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (UIPointerRegion)currentRegion
{
  return self->_currentRegion;
}

- (void)setCurrentRegion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (UIPointerRegion)mostRecentRegion
{
  return self->_mostRecentRegion;
}

- (void)setMostRecentRegion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int64_t)currentModifiers
{
  return self->_currentModifiers;
}

- (void)setCurrentModifiers:(int64_t)a3
{
  self->_currentModifiers = a3;
}

- (BOOL)_pausesPointerUpdatesWhilePanning
{
  return self->_pausesPointerUpdatesWhilePanning;
}

- (void)_setPausesPointerUpdatesWhilePanning:(BOOL)a3
{
  self->_pausesPointerUpdatesWhilePanning = a3;
}

@end
