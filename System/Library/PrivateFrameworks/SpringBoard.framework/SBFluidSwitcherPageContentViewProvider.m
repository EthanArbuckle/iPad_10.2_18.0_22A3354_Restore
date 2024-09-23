@implementation SBFluidSwitcherPageContentViewProvider

- (BOOL)isSuitableForRecycledItemContainer:(id)a3
{
  return objc_msgSend(a3, "type") == 0;
}

- (SBFluidSwitcherPageContentViewProvider)initWithDelegate:(id)a3 snapshotCache:(id)a4 lockoutViewProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBFluidSwitcherPageContentViewProvider *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SBFluidSwitcherPageContentViewProvider;
  v12 = -[SBFluidSwitcherPageContentViewProvider init](&v16, sel_init);
  if (v12)
  {
    if (v9)
    {
      if (v10)
      {
LABEL_4:
        objc_storeWeak((id *)&v12->_delegate, v9);
        objc_storeStrong((id *)&v12->_snapshotCache, a4);
        objc_storeStrong((id *)&v12->_lockoutVCProvider, a5);
        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("SBFluidSwitcherPageContentViewProvider.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

      if (v10)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("SBFluidSwitcherPageContentViewProvider.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cache"));

    goto LABEL_4;
  }
LABEL_5:

  return v12;
}

- (SBFluidSwitcherPageContentViewProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFluidSwitcherPageContentViewProvider.m"), 68, CFSTR("use initWithDelegate:snapshotCache:"));

  return 0;
}

- (void)acquiredViewController:(id)a3 forTransientOverlayAppLayout:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[NSMapTable objectEnumerator](self->_pageContentViewToTransientOverlayViewController, "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v5);

  if ((v8 & 1) == 0)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = self->_transientOverlayPageContentViews;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          -[NSMapTable objectForKey:](self->_pageContentViewToTransientOverlayViewController, "objectForKey:", v14, (_QWORD)v16);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v15 && objc_msgSend(v14, "isActive"))
          {
            -[SBFluidSwitcherPageContentViewProvider _applyTransientOverlayViewController:toPageContentView:](self, "_applyTransientOverlayViewController:toPageContentView:", v5, v14);
            goto LABEL_13;
          }

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_13:

  }
}

- (id)existingTransientOverlayViewControllerForAppLayout:(id)a3
{
  id v4;
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "type") == 2)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = self->_pageContentViewToTransientOverlayViewController;
    v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v10, "appLayout", (_QWORD)v15);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqual:", v4);

          if (v12)
          {
            -[NSMapTable objectForKey:](self->_pageContentViewToTransientOverlayViewController, "objectForKey:", v10);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_13;
          }
        }
        v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          continue;
        break;
      }
    }
    v13 = 0;
LABEL_13:

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)pageContentViewForAppLayout:(id)a3 setActive:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SBAppSwitcherTransientOverlayPageContentView *v12;
  SBAppSwitcherTransientOverlayPageContentView *v13;
  NSMutableArray *transientOverlayPageContentViews;
  NSMutableArray *v15;
  NSMutableArray *v16;
  SBPlusSwitcherPageContentView *v17;
  uint64_t v18;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "type") == 3)
  {
    +[SBAppSwitcherServiceManager sharedInstance](SBAppSwitcherServiceManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registeredServicesSnapshot");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "itemForLayoutRole:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serviceForBundleIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFluidSwitcherPageContentViewProvider _viewForService:appLayout:](self, "_viewForService:appLayout:", v11, v6);
    v12 = (SBAppSwitcherTransientOverlayPageContentView *)objc_claimAutoreleasedReturnValue();
    -[SBAppSwitcherTransientOverlayPageContentView setActive:](v12, "setActive:", v4);
    -[SBAppSwitcherTransientOverlayPageContentView setOrientation:](v12, "setOrientation:", -[SBFluidSwitcherPageContentViewProvider _interfaceOrientation](self, "_interfaceOrientation"));

  }
  else if (objc_msgSend(v6, "type") == 2)
  {
    v13 = [SBAppSwitcherTransientOverlayPageContentView alloc];
    -[SBFluidSwitcherPageContentViewProvider _pageViewSizeForAppLayout:](self, "_pageViewSizeForAppLayout:", v6);
    SBRectWithSize();
    v12 = -[SBAppSwitcherTransientOverlayPageContentView initWithFrame:appLayout:](v13, "initWithFrame:appLayout:", v6);
    -[SBAppSwitcherTransientOverlayPageContentView setDelegate:](v12, "setDelegate:", self);
    -[SBAppSwitcherTransientOverlayPageContentView setActive:](v12, "setActive:", v4);
    -[SBAppSwitcherTransientOverlayPageContentView setOrientation:](v12, "setOrientation:", -[SBFluidSwitcherPageContentViewProvider _interfaceOrientation](self, "_interfaceOrientation"));
    transientOverlayPageContentViews = self->_transientOverlayPageContentViews;
    if (!transientOverlayPageContentViews)
    {
      v15 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
      v16 = self->_transientOverlayPageContentViews;
      self->_transientOverlayPageContentViews = v15;

      transientOverlayPageContentViews = self->_transientOverlayPageContentViews;
    }
    -[NSMutableArray addObject:](transientOverlayPageContentViews, "addObject:", v12);
  }
  else
  {
    if (objc_msgSend(v6, "type"))
    {
      if (objc_msgSend(v6, "type") != 5)
      {
        v12 = 0;
        goto LABEL_13;
      }
      v17 = [SBPlusSwitcherPageContentView alloc];
      v18 = -[SBPlusSwitcherPageContentView initWithFrame:](v17, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    }
    else
    {
      -[SBFluidSwitcherPageContentViewProvider _snapshotViewForAppLayout:setActive:](self, "_snapshotViewForAppLayout:setActive:", v6, v4);
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (SBAppSwitcherTransientOverlayPageContentView *)v18;
  }
LABEL_13:

  return v12;
}

- (void)purgePageContentViewForAppLayout:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *switcherServiceViewControllerMap;
  id v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  NSMutableArray *transientOverlayPageContentViews;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "type") == 3)
  {
    objc_msgSend(v4, "itemForLayoutRole:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    switcherServiceViewControllerMap = self->_switcherServiceViewControllerMap;
    objc_msgSend(v5, "bundleIdentifier");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](switcherServiceViewControllerMap, "removeObjectForKey:", v7);
LABEL_3:

    goto LABEL_4;
  }
  if (objc_msgSend(v4, "type") != 2)
    goto LABEL_18;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = self->_transientOverlayPageContentViews;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v9)
  {
    v10 = v9;
    v5 = 0;
    v11 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v13, "appLayout");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqual:", v4);

        if (v15)
        {
          if (!v5)
            v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
          objc_msgSend(v5, "addObject:", v13);
        }
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v10);
  }
  else
  {
    v5 = 0;
  }

  if (objc_msgSend(v5, "count"))
  {
    -[NSMutableArray removeObjectsInArray:](self->_transientOverlayPageContentViews, "removeObjectsInArray:", v5);
    if (!-[NSMutableArray count](self->_transientOverlayPageContentViews, "count"))
    {
      transientOverlayPageContentViews = self->_transientOverlayPageContentViews;
      self->_transientOverlayPageContentViews = 0;

    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = v5;
    v17 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v24 != v19)
            objc_enumerationMutation(v7);
          v21 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j);
          -[NSMapTable objectForKey:](self->_pageContentViewToTransientOverlayViewController, "objectForKey:", v21, (_QWORD)v23);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
            -[SBFluidSwitcherPageContentViewProvider _relinquishTransientOverlayViewController:forPageContentView:](self, "_relinquishTransientOverlayViewController:forPageContentView:", v22, v21);

        }
        v18 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v18);
    }
    goto LABEL_3;
  }
LABEL_4:

LABEL_18:
}

- (void)relinquishTransientOverlayViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)-[NSMapTable copy](self->_pageContentViewToTransientOverlayViewController, "copy");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKey:", v11, (_QWORD)v13);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        if (v12 == v4)
          -[SBFluidSwitcherPageContentViewProvider _relinquishTransientOverlayViewController:forPageContentView:](self, "_relinquishTransientOverlayViewController:forPageContentView:", v4, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (void)appSwitcherTransientOverlayPageContentViewDidChangeActive:(id)a3
{
  char v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;

  v9 = a3;
  v4 = objc_msgSend(v9, "isActive");
  -[NSMapTable objectForKey:](self->_pageContentViewToTransientOverlayViewController, "objectForKey:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) == 0)
  {
    if (v5)
      -[SBFluidSwitcherPageContentViewProvider _relinquishTransientOverlayViewController:forPageContentView:](self, "_relinquishTransientOverlayViewController:forPageContentView:", v5, v9);
    goto LABEL_9;
  }

  if (!v6)
  {
    objc_msgSend(v9, "appLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "viewControllerForTransientOverlayAppLayout:fromProvider:", v6, self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      -[SBFluidSwitcherPageContentViewProvider _applyTransientOverlayViewController:toPageContentView:](self, "_applyTransientOverlayViewController:toPageContentView:", v8, v9);
    else
      objc_msgSend(v9, "setContentView:", 0);

LABEL_9:
  }

}

- (void)appSwitcherTransientOverlayPageContentViewDidChangeContainerOrientation:(id)a3
{
  NSMapTable *pageContentViewToTransientOverlayViewController;
  id v5;
  int64_t v6;
  id v7;

  pageContentViewToTransientOverlayViewController = self->_pageContentViewToTransientOverlayViewController;
  v5 = a3;
  -[NSMapTable objectForKey:](pageContentViewToTransientOverlayViewController, "objectForKey:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = -[SBFluidSwitcherPageContentViewProvider _preferredContentInterfaceOrientationForViewController:preferredInterfaceOrientation:](self, "_preferredContentInterfaceOrientationForViewController:preferredInterfaceOrientation:", v7, objc_msgSend(v5, "orientation"));
  objc_msgSend(v7, "setContainerOrientation:", v6);
  objc_msgSend(v5, "setContentOrientation:", v6);

}

- (int64_t)_preferredContentInterfaceOrientationForViewController:(id)a3 preferredInterfaceOrientation:(int64_t)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = objc_msgSend(a3, "supportedInterfaceOrientations");
  if (v5)
    v6 = v5;
  else
    v6 = 2;
  v7 = XBInterfaceOrientationMaskForInterfaceOrientation();
  v8 = 1;
  v9 = 4;
  v10 = 2;
  if ((v6 & 8) != 0)
    v10 = 3;
  if ((v6 & 0x10) == 0)
    v9 = v10;
  if ((v6 & 2) == 0)
    v8 = v9;
  if ((v6 & v7) != 0)
    return a4;
  else
    return v8;
}

- (int64_t)_interfaceOrientation
{
  id WeakRetained;
  int64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_msgSend(WeakRetained, "orientationForPageViewFromProvider:", self);

  return v4;
}

- (CGSize)_pageViewSizeForAppLayout:(id)a3
{
  SBFluidSwitcherPageContentViewProviderDelegate **p_delegate;
  id v5;
  id WeakRetained;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "sizeForAppLayout:fromProvider:", v5, self);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)_containerViewController
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "containerViewControllerForPageViewFromProvider:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_snapshotViewDelegate
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "delegateForSnapshotPageViewFromProvider:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_snapshotViewForAppLayout:(id)a3 setActive:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  SBAppSwitcherReusableSnapshotView *v7;
  void *v8;
  SBAppSwitcherSnapshotImageCache *snapshotCache;
  SBAppSwitcherSnapshotLockoutViewControllerProvider *lockoutVCProvider;
  void *v11;
  void *v12;
  SBAppSwitcherReusableSnapshotView *v13;

  v4 = a4;
  v6 = a3;
  v7 = [SBAppSwitcherReusableSnapshotView alloc];
  -[SBFluidSwitcherPageContentViewProvider _snapshotViewDelegate](self, "_snapshotViewDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  snapshotCache = self->_snapshotCache;
  lockoutVCProvider = self->_lockoutVCProvider;
  objc_msgSend((id)SBApp, "appClipOverlayCoordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherPageContentViewProvider _containerViewController](self, "_containerViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SBAppSwitcherReusableSnapshotView initWithDelegate:snapshotCache:lockoutVCProvider:appClipOverlayCoordinator:containerViewController:](v7, "initWithDelegate:snapshotCache:lockoutVCProvider:appClipOverlayCoordinator:containerViewController:", v8, snapshotCache, lockoutVCProvider, v11, v12);

  -[SBAppSwitcherReusableSnapshotView setActive:](v13, "setActive:", v4);
  -[SBAppSwitcherReusableSnapshotView setAppLayout:](v13, "setAppLayout:", v6);
  -[SBFluidSwitcherPageContentViewProvider _pageViewSizeForAppLayout:](self, "_pageViewSizeForAppLayout:", v6);

  SBRectWithSize();
  -[SBAppSwitcherReusableSnapshotView setFrame:](v13, "setFrame:");
  return v13;
}

- (id)_viewForService:(id)a3 appLayout:(id)a4
{
  id v6;
  id v7;
  SBAppSwitcherServicePageContentView *v8;
  SBAppSwitcherServicePageContentView *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *switcherServiceViewControllerMap;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[5];
  SBAppSwitcherServicePageContentView *v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = [SBAppSwitcherServicePageContentView alloc];
  -[SBFluidSwitcherPageContentViewProvider _pageViewSizeForAppLayout:](self, "_pageViewSizeForAppLayout:", v7);

  SBRectWithSize();
  v9 = -[SBAppSwitcherServicePageContentView initWithFrame:](v8, "initWithFrame:");
  if (!self->_switcherServiceViewControllerMap)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    switcherServiceViewControllerMap = self->_switcherServiceViewControllerMap;
    self->_switcherServiceViewControllerMap = v10;

  }
  objc_msgSend(v6, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_switcherServiceViewControllerMap, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[SBFluidSwitcherPageContentViewProvider _containerViewController](self, "_containerViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "beginAppearanceTransition:animated:", 1, 0);
    objc_msgSend(v14, "addChildViewController:", v13);
    objc_msgSend(v13, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAppSwitcherServicePageContentView bounds](v9, "bounds");
    objc_msgSend(v15, "setFrame:");
    objc_msgSend(v15, "setAutoresizingMask:", 18);
    -[SBAppSwitcherServicePageContentView addSubview:](v9, "addSubview:", v15);
    objc_msgSend(v13, "didMoveToParentViewController:", v14);
    objc_msgSend(v13, "bs_endAppearanceTransition");

  }
  else
  {
    objc_msgSend(v6, "viewServiceClassName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __68__SBFluidSwitcherPageContentViewProvider__viewForService_appLayout___block_invoke;
    v20[3] = &unk_1E8EBB6C0;
    v20[4] = self;
    v21 = v9;
    v22 = v12;
    v18 = +[_UIRemoteViewController requestViewController:fromServiceWithBundleIdentifier:connectionHandler:](SBAppSwitcherPageServiceRemoteViewController, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", v16, v17, v20);

  }
  return v9;
}

void __68__SBFluidSwitcherPageContentViewProvider__viewForService_appLayout___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_containerViewController");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "beginAppearanceTransition:animated:", 1, 0);
    -[NSObject addChildViewController:](v8, "addChildViewController:", v5);
    objc_msgSend(v5, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "bounds");
    objc_msgSend(v9, "setFrame:");
    objc_msgSend(v9, "setAutoresizingMask:", 18);
    objc_msgSend(*(id *)(a1 + 40), "addSubview:", v9);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKey:", v5, *(_QWORD *)(a1 + 48));
    objc_msgSend(v5, "didMoveToParentViewController:", v8);
    objc_msgSend(v5, "bs_endAppearanceTransition");

  }
  else
  {
    if (!v6)
      goto LABEL_4;
    SBLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = *(_QWORD *)(a1 + 48);
      v11 = 138543618;
      v12 = v10;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "Failed to load remote view service: %{public}@. %@", (uint8_t *)&v11, 0x16u);
    }
  }

LABEL_4:
}

- (void)_applyTransientOverlayViewController:(id)a3 toPageContentView:(id)a4
{
  id v6;
  NSMapTable *pageContentViewToTransientOverlayViewController;
  NSMapTable *v8;
  NSMapTable *v9;
  void *v10;
  int64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  pageContentViewToTransientOverlayViewController = self->_pageContentViewToTransientOverlayViewController;
  if (!pageContentViewToTransientOverlayViewController)
  {
    v8 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 512, 1);
    v9 = self->_pageContentViewToTransientOverlayViewController;
    self->_pageContentViewToTransientOverlayViewController = v8;

    pageContentViewToTransientOverlayViewController = self->_pageContentViewToTransientOverlayViewController;
  }
  -[NSMapTable setObject:forKey:](pageContentViewToTransientOverlayViewController, "setObject:forKey:", v13, v6);
  -[SBFluidSwitcherPageContentViewProvider _containerViewController](self, "_containerViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addChildViewController:", v13);
  objc_msgSend(v13, "didMoveToParentViewController:", v10);
  objc_msgSend(v13, "bs_beginAppearanceTransition:animated:", 1, 0);
  objc_msgSend(v6, "setOrientation:", -[SBFluidSwitcherPageContentViewProvider _interfaceOrientation](self, "_interfaceOrientation"));
  v11 = -[SBFluidSwitcherPageContentViewProvider _preferredContentInterfaceOrientationForViewController:preferredInterfaceOrientation:](self, "_preferredContentInterfaceOrientationForViewController:preferredInterfaceOrientation:", v13, objc_msgSend(v6, "orientation"));
  objc_msgSend(v13, "setContainerOrientation:", v11);
  objc_msgSend(v6, "setContentOrientation:", v11);
  objc_msgSend(v13, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContentView:", v12);

  objc_msgSend(v13, "bs_endAppearanceTransition:", 1);
}

- (void)_relinquishTransientOverlayViewController:(id)a3 forPageContentView:(id)a4
{
  id v6;
  NSMapTable *pageContentViewToTransientOverlayViewController;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v8)
  {
    objc_msgSend(v8, "bs_beginAppearanceTransition:animated:", 0, 0);
    objc_msgSend(v6, "setContentView:", 0);
    objc_msgSend(v8, "bs_endAppearanceTransition:", 0);
    objc_msgSend(v8, "willMoveToParentViewController:", 0);
    objc_msgSend(v8, "removeFromParentViewController");
    -[NSMapTable removeObjectForKey:](self->_pageContentViewToTransientOverlayViewController, "removeObjectForKey:", v6);
    if (!-[NSMapTable count](self->_pageContentViewToTransientOverlayViewController, "count"))
    {
      pageContentViewToTransientOverlayViewController = self->_pageContentViewToTransientOverlayViewController;
      self->_pageContentViewToTransientOverlayViewController = 0;

    }
  }

}

- (SBFluidSwitcherPageContentViewProviderDelegate)delegate
{
  return (SBFluidSwitcherPageContentViewProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switcherServiceViewControllerMap, 0);
  objc_storeStrong((id *)&self->_transientOverlayPageContentViews, 0);
  objc_storeStrong((id *)&self->_pageContentViewToTransientOverlayViewController, 0);
  objc_storeStrong((id *)&self->_lockoutVCProvider, 0);
  objc_storeStrong((id *)&self->_snapshotCache, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
