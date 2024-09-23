@implementation SBIconZoomAnimator

- (SBIconZoomAnimator)initWithAnimationContainer:(id)a3
{
  id v4;
  SBIconZoomAnimator *v5;
  uint64_t v6;
  NSMapTable *listIconToViewMap;
  uint64_t v8;
  NSMapTable *dockIconToViewMap;
  uint64_t v10;
  SBHIconModel *iconModel;
  void *v12;
  void *v13;
  uint64_t v14;
  SBIconListModel *iconListModel;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBIconZoomAnimator;
  v5 = -[SBIconAnimator initWithAnimationContainer:](&v17, sel_initWithAnimationContainer_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v6 = objc_claimAutoreleasedReturnValue();
    listIconToViewMap = v5->_listIconToViewMap;
    v5->_listIconToViewMap = (NSMapTable *)v6;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    dockIconToViewMap = v5->_dockIconToViewMap;
    v5->_dockIconToViewMap = (NSMapTable *)v8;

    objc_msgSend(v4, "iconModel");
    v10 = objc_claimAutoreleasedReturnValue();
    iconModel = v5->_iconModel;
    v5->_iconModel = (SBHIconModel *)v10;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v5, sel__iconModelDidRelayout_, CFSTR("SBIconModelDidLayoutIconStateNotification"), v5->_iconModel);
    objc_msgSend(v12, "addObserver:selector:name:object:", v5, sel__iconModelDidReload_, CFSTR("SBIconModelDidReloadIconsNotification"), v5->_iconModel);
    objc_msgSend(v4, "currentIconListView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "model");
    v14 = objc_claimAutoreleasedReturnValue();
    iconListModel = v5->_iconListModel;
    v5->_iconListModel = (SBIconListModel *)v14;

    -[SBIconListModel addNodeObserver:](v5->_iconListModel, "addNodeObserver:", v5);
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[SBIconZoomAnimator _clearObservers](self, "_clearObservers");
  v3.receiver = self;
  v3.super_class = (Class)SBIconZoomAnimator;
  -[SBIconAnimator dealloc](&v3, sel_dealloc);
}

- (id)iconViewForIcon:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_listIconToViewMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[NSMapTable objectForKey:](self->_dockIconToViewMap, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      SBLogCommon();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[SBIconZoomAnimator iconViewForIcon:].cold.1(v6);

      -[SBIconAnimator animationContainer](self, "animationContainer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "currentIconListView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "iconViewForIcon:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v5;
}

- (void)enumerateIconsAndIconViewsWithHandler:(id)a3
{
  void (**v4)(id, uint64_t, void *, _QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, void *, _QWORD))a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[NSMapTable keyEnumerator](self->_listIconToViewMap, "keyEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_listIconToViewMap, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v10, v11, 0);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[NSMapTable keyEnumerator](self->_dockIconToViewMap, "keyEnumerator", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j);
        -[NSMapTable objectForKey:](self->_dockIconToViewMap, "objectForKey:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v17, v18, 1);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }

}

- (unint64_t)listIconCount
{
  return -[NSMapTable count](self->_listIconToViewMap, "count");
}

- (unint64_t)dockIconCount
{
  return -[NSMapTable count](self->_dockIconToViewMap, "count");
}

- (double)startTime
{
  return self->_startTime;
}

- (BOOL)isPastPointOfNoReturn
{
  if ((BSFloatIsZero() & 1) != 0)
    return 1;
  CACurrentMediaTime();
  return BSFloatGreaterThanFloat();
}

- (void)_prepareAnimation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBIconZoomAnimator;
  -[SBIconAnimator _prepareAnimation](&v9, sel__prepareAnimation);
  -[SBIconAnimator animationContainer](self, "animationContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentIconListView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconZoomAnimator _setIconListView:](self, "_setIconListView:", v4);
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__SBIconZoomAnimator__prepareAnimation__block_invoke;
  v8[3] = &unk_1E8D87340;
  v8[4] = self;
  objc_msgSend(v4, "enumerateIconViewsUsingBlock:", v8);
  objc_msgSend(v3, "dockIconListView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconZoomAnimator _setDockListView:](self, "_setDockListView:", v6);
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __39__SBIconZoomAnimator__prepareAnimation__block_invoke_2;
  v7[3] = &unk_1E8D87340;
  v7[4] = self;
  objc_msgSend(v6, "enumerateIconViewsUsingBlock:", v7);

}

void __39__SBIconZoomAnimator__prepareAnimation__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  v3 = a2;
  objc_msgSend(v3, "icon");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, v4);

}

void __39__SBIconZoomAnimator__prepareAnimation__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  v3 = a2;
  objc_msgSend(v3, "icon");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, v4);

}

- (void)_setAnimationFraction:(double)a3
{
  void *v5;
  int v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBIconZoomAnimator;
  -[SBIconAnimator _setAnimationFraction:](&v7, sel__setAnimationFraction_);
  -[SBIconAnimator settings](self, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "labelAlphaWithZoom");

  if (v6)
    -[SBIconZoomAnimator _applyLabelAlphaFraction:](self, "_applyLabelAlphaFraction:", a3);
}

- (void)_cleanupAnimation
{
  void *v3;
  int v4;
  objc_super v5;

  -[SBIconAnimator settings](self, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "labelAlphaWithZoom");

  if (v4)
    -[SBIconZoomAnimator _applyLabelAlphaFraction:](self, "_applyLabelAlphaFraction:", 0.0);
  self->_startTime = 0.0;
  if (-[SBIconAnimator invalidated](self, "invalidated"))
    -[SBIconZoomAnimator _clearObservers](self, "_clearObservers");
  v5.receiver = self;
  v5.super_class = (Class)SBIconZoomAnimator;
  -[SBIconAnimator _cleanupAnimation](&v5, sel__cleanupAnimation);
}

- (unint64_t)_numberOfSignificantAnimations
{
  id v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBIconZoomAnimator;
  v3 = -[SBIconAnimator _numberOfSignificantAnimations](&v7, sel__numberOfSignificantAnimations);
  -[SBIconAnimator settings](self, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (unint64_t)v3 + objc_msgSend(v4, "labelAlphaWithZoom");

  return v5;
}

- (void)_applyLabelAlphaFraction:(double)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[NSMapTable objectEnumerator](self->_listIconToViewMap, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v9++), "setIconLabelAlpha:", 1.0 - a3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMapTable objectEnumerator](self->_dockIconToViewMap, "objectEnumerator", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    v14 = 1.0 - a3;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "setIconLabelAlpha:", v14);
      }
      while (v12 != v15);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v12);
  }

}

- (void)_animateToFraction:(double)a3 afterDelay:(double)a4 withSharedCompletion:(id)a5
{
  id v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  objc_super v12;

  v8 = a5;
  v9 = -[SBIconAnimator isAnimating](self, "isAnimating");
  v12.receiver = self;
  v12.super_class = (Class)SBIconZoomAnimator;
  -[SBIconAnimator _animateToFraction:afterDelay:withSharedCompletion:](&v12, sel__animateToFraction_afterDelay_withSharedCompletion_, v8, a3, a4);
  if (!v9)
    self->_startTime = CACurrentMediaTime();
  -[SBIconAnimator settings](self, "settings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "centralAnimationSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconZoomAnimator _performAnimationToFraction:withCentralAnimationSettings:delay:alreadyAnimating:sharedCompletion:](self, "_performAnimationToFraction:withCentralAnimationSettings:delay:alreadyAnimating:sharedCompletion:", v11, v9, v8, a3, a4);

}

- (void)_performAnimationToFraction:(double)a3 withCentralAnimationSettings:(id)a4 delay:(double)a5 alreadyAnimating:(BOOL)a6 sharedCompletion:(id)a7
{
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[6];

  v14 = a7;
  if ((BSFloatIsZero() & 1) != 0 || BSFloatIsOne())
  {
    -[SBIconAnimator settings](self, "settings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "labelAlphaWithZoom");

    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0D01908];
      -[SBIconAnimator centralAnimationFactory](self, "centralAnimationFactory");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __119__SBIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke;
      v15[3] = &unk_1E8D84C78;
      v15[4] = self;
      *(double *)&v15[5] = a3;
      objc_msgSend(v12, "animateWithFactory:additionalDelay:options:actions:completion:", v13, 2, v15, v14, a5);

    }
  }

}

uint64_t __119__SBIconZoomAnimator__performAnimationToFraction_withCentralAnimationSettings_delay_alreadyAnimating_sharedCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyLabelAlphaFraction:", *(double *)(a1 + 40));
}

- (void)node:(id)a3 didRemoveContainedNodeIdentifiers:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  if (-[NSSet intersectsSet:](self->_criticalIconNodeIdentifiers, "intersectsSet:"))
  {
    v5 = (void *)-[NSSet mutableCopy](self->_criticalIconNodeIdentifiers, "mutableCopy");
    objc_msgSend(v5, "intersectSet:", v7);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Critical node identifier removed: %@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconZoomAnimator _invalidateAnimationForSignificantIconModelChangesForReason:](self, "_invalidateAnimationForSignificantIconModelChangesForReason:", v6);

  }
}

- (void)_setIconListView:(id)a3
{
  SBIconListView *v5;
  SBIconListView *v6;

  v5 = (SBIconListView *)a3;
  if (self->_iconListView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_iconListView, a3);
    v5 = v6;
  }

}

- (void)_setDockListView:(id)a3
{
  SBIconListView *v5;
  SBIconListView *v6;

  v5 = (SBIconListView *)a3;
  if (self->_dockListView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_dockListView, a3);
    v5 = v6;
  }

}

- (void)_clearObservers
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SBIconModelDidLayoutIconStateNotification"), self->_iconModel);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SBIconModelDidReloadIconsNotification"), self->_iconModel);
  -[SBIconListModel removeNodeObserver:](self->_iconListModel, "removeNodeObserver:", self);

}

- (void)_iconModelDidRelayout:(id)a3
{
  -[SBIconZoomAnimator _invalidateAnimationForSignificantIconModelChangesForReason:](self, "_invalidateAnimationForSignificantIconModelChangesForReason:", CFSTR("Icon model relayout"));
}

- (void)_iconModelDidReload:(id)a3
{
  -[SBIconZoomAnimator _invalidateAnimationForSignificantIconModelChangesForReason:](self, "_invalidateAnimationForSignificantIconModelChangesForReason:", CFSTR("Icon model reloaded all icon instances"));
}

- (void)_invalidateAnimationForSignificantIconModelChangesForReason:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[SBIconAnimator invalidated](self, "invalidated"))
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v4;
      v9 = 2114;
      v10 = v6;
      _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_INFO, "Invalidated icon zoom animation for reason: %@, stack=%{public}@", (uint8_t *)&v7, 0x16u);

    }
    -[SBIconAnimator setInvalidated:](self, "setInvalidated:", 1);
  }

}

- (NSSet)criticalIconNodeIdentifiers
{
  return self->_criticalIconNodeIdentifiers;
}

- (void)setCriticalIconNodeIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_criticalIconNodeIdentifiers, a3);
}

- (SBIconListView)iconListView
{
  return self->_iconListView;
}

- (SBIconListView)dockListView
{
  return self->_dockListView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dockListView, 0);
  objc_storeStrong((id *)&self->_iconListView, 0);
  objc_storeStrong((id *)&self->_iconModel, 0);
  objc_storeStrong((id *)&self->_iconListModel, 0);
  objc_storeStrong((id *)&self->_criticalIconNodeIdentifiers, 0);
  objc_storeStrong((id *)&self->_dockIconToViewMap, 0);
  objc_storeStrong((id *)&self->_listIconToViewMap, 0);
}

- (void)iconViewForIcon:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CFEF3000, log, OS_LOG_TYPE_ERROR, "Could not find icon view in visible icon list or dock!", v1, 2u);
}

@end
