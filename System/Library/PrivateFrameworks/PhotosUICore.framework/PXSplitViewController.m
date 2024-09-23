@implementation PXSplitViewController

+ (void)initialize
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("sidebarHiddenOnLaunch");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "registerDefaults:", v4);

  }
}

- (PXSplitViewController)initWithSidebarNavigationController:(id)a3 contentViewController:(id)a4 compactViewController:(id)a5
{
  id v9;
  id v10;
  id v11;
  PXSplitViewController *v12;
  PXSplitViewController *v13;
  uint64_t v14;
  NSHashTable *changeObservers;
  void *v16;
  int v17;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PXSplitViewController;
  v12 = -[PXSplitViewController initWithStyle:](&v19, sel_initWithStyle_, 1);
  v13 = v12;
  if (v12)
  {
    -[PXSplitViewController setViewController:forColumn:](v12, "setViewController:forColumn:", v9, 0);
    -[PXSplitViewController setViewController:forColumn:](v13, "setViewController:forColumn:", v10, 2);
    -[PXSplitViewController setViewController:forColumn:](v13, "setViewController:forColumn:", v11, 3);
    objc_storeStrong((id *)&v13->_sidebarViewController, a3);
    objc_storeStrong((id *)&v13->_contentViewController, a4);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v14 = objc_claimAutoreleasedReturnValue();
    changeObservers = v13->_changeObservers;
    v13->_changeObservers = (NSHashTable *)v14;

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "BOOLForKey:", CFSTR("sidebarHiddenOnLaunch"));

    if (v17)
      -[PXSplitViewController setPreferredDisplayMode:](v13, "setPreferredDisplayMode:", 1);
    -[PXSplitViewController setDelegate:](v13, "setDelegate:", v13);
  }

  return v13;
}

- (BOOL)_isDisplayModeAllVisibleAllowed
{
  int64_t v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  BOOL v9;

  v3 = -[UIViewController px_deprecatedInterfaceOrientation](self, "px_deprecatedInterfaceOrientation");
  -[PXSplitViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;

  if (v6 <= 980.0)
    return 0;
  -[PXSplitViewController traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "horizontalSizeClass") == 2 && (unint64_t)(v3 - 3) < 2;

  return v9;
}

- (void)registerChangeObserver:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSplitViewController.m"), 92, CFSTR("%s must be called on the main thread"), "-[PXSplitViewController registerChangeObserver:]");

  }
  if (!-[NSHashTable containsObject:](self->_changeObservers, "containsObject:", v6))
    -[NSHashTable addObject:](self->_changeObservers, "addObject:", v6);

}

- (void)unregisterChangeObserver:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSplitViewController.m"), 99, CFSTR("%s must be called on the main thread"), "-[PXSplitViewController unregisterChangeObserver:]");

  }
  -[NSHashTable removeObject:](self->_changeObservers, "removeObject:", v6);

}

- (BOOL)isSidebarVisible
{
  return PXIsSidebarVisibleWithDisplayMode(-[PXSplitViewController displayMode](self, "displayMode"));
}

- (void)setWantsSidebarHidden:(BOOL)a3
{
  int64_t originalPreferredDisplayMode;

  if (self->_wantsSidebarHidden != a3)
  {
    self->_wantsSidebarHidden = a3;
    if (a3)
    {
      self->_originalPreferredDisplayMode = -[PXSplitViewController preferredDisplayMode](self, "preferredDisplayMode");
      originalPreferredDisplayMode = 1;
    }
    else
    {
      originalPreferredDisplayMode = self->_originalPreferredDisplayMode;
    }
    -[PXSplitViewController setPreferredDisplayMode:](self, "setPreferredDisplayMode:", originalPreferredDisplayMode);
  }
}

- (void)toggleSidebarVisibilityAnimated
{
  if (-[PXSplitViewController isSidebarVisible](self, "isSidebarVisible"))
    -[PXSplitViewController hideColumn:](self, "hideColumn:", 0);
  else
    -[PXSplitViewController showColumn:](self, "showColumn:", 0);
}

- (void)dismissPrimaryColumnIfOverlay
{
  if (-[PXSplitViewController displayMode](self, "displayMode") == 3)
    -[PXSplitViewController hideColumn:](self, "hideColumn:", 0);
}

- (void)requestFocusUpdateWithPreferredFocusEnvironment:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_preferredFocusEnvironmentForNextRequest, a3);
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0DC37E0], "focusSystemForEnvironment:", self);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "requestFocusUpdateToEnvironment:", self);
}

- (id)preferredFocusEnvironments
{
  void *v3;
  UIFocusEnvironment *preferredFocusEnvironmentForNextRequest;
  objc_super v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (self->_preferredFocusEnvironmentForNextRequest)
  {
    v7[0] = self->_preferredFocusEnvironmentForNextRequest;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    preferredFocusEnvironmentForNextRequest = self->_preferredFocusEnvironmentForNextRequest;
    self->_preferredFocusEnvironmentForNextRequest = 0;

    return v3;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PXSplitViewController;
    -[PXSplitViewController preferredFocusEnvironments](&v6, sel_preferredFocusEnvironments);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  BOOL v7;
  void *v8;
  objc_super v10;

  v6 = a4;
  if (sel_toggleSidebar_ == a3
    && (-[PXSplitViewController presentedViewController](self, "presentedViewController"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    v7 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PXSplitViewController;
    v7 = -[PXSplitViewController canPerformAction:withSender:](&v10, sel_canPerformAction_withSender_, a3, v6);
  }

  return v7;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  objc_super v5;

  self->_inViewWillTransitionToSize = 1;
  v5.receiver = self;
  v5.super_class = (Class)PXSplitViewController;
  -[PXSplitViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  self->_inViewWillTransitionToSize = 0;
}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  id v6;
  uint64_t v7;
  dispatch_time_t v8;
  void *v9;
  char v10;
  void *v11;
  void (**v12)(void *, _QWORD);
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void (**v18)(void *, _QWORD);
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  char v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD aBlock[5];
  char v29;
  _QWORD block[6];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  if (!self->_inViewWillTransitionToSize)
  {
    v8 = dispatch_time(0, 0);
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __69__PXSplitViewController_splitViewController_willChangeToDisplayMode___block_invoke;
    block[3] = &unk_1E5144EB8;
    block[4] = self;
    block[5] = a4;
    dispatch_after(v8, MEMORY[0x1E0C80D38], block);
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBool:forKey:", a4 == 1, CFSTR("sidebarHiddenOnLaunch"));

  v10 = PXIsSidebarVisibleWithDisplayMode(a4);
  -[NSHashTable allObjects](self->_changeObservers, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = v7;
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PXSplitViewController_splitViewController_willChangeToDisplayMode___block_invoke_2;
  aBlock[3] = &unk_1E5144210;
  aBlock[4] = self;
  v29 = v10;
  v12 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v13);
        v12[2](v12, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
    }
    while (v15);
  }

  v20[0] = v7;
  v20[1] = 3221225472;
  v20[2] = __69__PXSplitViewController_splitViewController_willChangeToDisplayMode___block_invoke_3;
  v20[3] = &unk_1E5144238;
  v20[4] = self;
  v21 = v13;
  v22 = v12;
  v23 = v10;
  v18 = v12;
  v19 = v13;
  dispatch_async(MEMORY[0x1E0C80D38], v20);

}

- (int64_t)splitViewController:(id)a3 displayModeForExpandingToProposedDisplayMode:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSHashTable allObjects](self->_changeObservers, "allObjects", a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "splitViewControllerWillExpand:", self);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return a4;
}

- (id)px_diagnosticsItemProvidersForPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  double y;
  double x;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  y = a3.y;
  x = a3.x;
  v7 = (void *)MEMORY[0x1E0C99DE8];
  v8 = a4;
  objc_msgSend(v7, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSplitViewController sidebarViewController](self, "sidebarViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "px_diagnosticsItemProvidersForPoint:inCoordinateSpace:", v8, x, y);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v11);

  -[PXSplitViewController contentViewController](self, "contentViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "px_diagnosticsItemProvidersForPoint:inCoordinateSpace:", v8, x, y);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObjectsFromArray:", v13);
  return v9;
}

- (int64_t)_splitViewController:(id)a3 overrideProposedPermission:(int64_t)a4 forInteractivePresentationGesture:(id)a5 inView:(id)a6
{
  id v7;
  double v8;
  double v9;

  v7 = a6;
  objc_msgSend(a5, "locationInView:", v7);
  LODWORD(a5) = objc_msgSend(v7, "px_areAllScrollViewsContainingPoint:scrolledAtEdge:", objc_msgSend(v7, "px_leadingEdge"), v8, v9);

  if ((_DWORD)a5)
    return 0;
  else
    return 2;
}

- (UIViewController)sidebarViewController
{
  return self->_sidebarViewController;
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (BOOL)wantsSidebarHidden
{
  return self->_wantsSidebarHidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_sidebarViewController, 0);
  objc_storeStrong((id *)&self->_changeObservers, 0);
  objc_storeStrong((id *)&self->_preferredFocusEnvironmentForNextRequest, 0);
}

uint64_t __69__PXSplitViewController_splitViewController_willChangeToDisplayMode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPreferredDisplayMode:", *(_QWORD *)(a1 + 40) == 1);
}

void __69__PXSplitViewController_splitViewController_willChangeToDisplayMode___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "splitViewController:willChangeSidebarVisibility:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

void __69__PXSplitViewController_splitViewController_willChangeToDisplayMode___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "allObjects", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v7) & 1) == 0)
          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "splitViewController:didChangeSidebarVisibility:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

@end
