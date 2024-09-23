@implementation SBHModalLibraryPresenter

- (SBHModalLibraryPresenter)initWithContainerViewController:(id)a3 libraryViewController:(id)a4
{
  id v6;
  id v7;
  SBHModalLibraryPresenter *v8;
  SBHModalLibraryPresenter *v9;
  SBHViewControllerTransition *v10;
  SBHViewControllerTransition *transition;
  void *v12;
  uint64_t v13;
  SBHAppLibrarySettings *librarySettings;
  UIPanGestureRecognizer *v15;
  void *v16;
  UIPanGestureRecognizer *dismissPanGestureRecognizer;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SBHModalLibraryPresenter;
  v8 = -[SBHModalLibraryPresenter init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_containerViewController, v6);
    objc_storeStrong((id *)&v9->_libraryViewController, a4);
    v10 = objc_alloc_init(SBHViewControllerTransition);
    transition = v9->_transition;
    v9->_transition = v10;

    v9->_preferredTransitionStyle = 0;
    +[SBHHomeScreenDomain rootSettings](SBHHomeScreenDomain, "rootSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appLibrarySettings");
    v13 = objc_claimAutoreleasedReturnValue();
    librarySettings = v9->_librarySettings;
    v9->_librarySettings = (SBHAppLibrarySettings *)v13;

    v9->_targetingPresentingLibrary = 0x7FFFFFFFFFFFFFFFLL;
    -[SBHViewControllerTransition setDelegate:](v9->_transition, "setDelegate:", v9);
    v15 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", v9, sel__handlePanGestureRecognizerUpdated_);
    -[UIPanGestureRecognizer setAllowedScrollTypesMask:](v15, "setAllowedScrollTypesMask:", 3);
    -[UIPanGestureRecognizer _setCanPanVertically:](v15, "_setCanPanVertically:", 0);
    -[UIPanGestureRecognizer setDelegate:](v15, "setDelegate:", v9);
    objc_msgSend(v7, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addGestureRecognizer:", v15);

    dismissPanGestureRecognizer = v9->_dismissPanGestureRecognizer;
    v9->_dismissPanGestureRecognizer = v15;

  }
  return v9;
}

- (UIViewController)overrideContainerViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UIViewController *v7;

  -[SBHModalLibraryPresenter libraryViewController](self, "libraryViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHModalLibraryPresenter containerViewController](self, "containerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == v5)
    v6 = 0;
  else
    v6 = v4;
  v7 = v6;

  return v7;
}

- (void)setOverrideContainerViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;

  v24 = a3;
  -[SBHModalLibraryPresenter containerViewController](self, "containerViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v24)
    v5 = v24;
  else
    v5 = v4;
  v6 = v5;
  -[SBHModalLibraryPresenter libraryViewController](self, "libraryViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parentViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "containerViewForModalLibraryPresenter:", self);
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }
  -[SBHModalLibraryPresenter backgroundView](self, "backgroundView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == v8)
  {
    if (v6 == v4)
    {
      objc_msgSend(v10, "bringSubviewToFront:", v9);
      objc_msgSend(v10, "subviews");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "indexOfObject:", v12);
      if (v23 != objc_msgSend(v21, "indexOfObject:", v9) - 1)
        objc_msgSend(v10, "insertSubview:belowSubview:", v12, v9);
    }
    else
    {
      objc_msgSend(v10, "sendSubviewToBack:", v12);
      objc_msgSend(v10, "subviews");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "indexOfObject:", v12);
      if (v22 != objc_msgSend(v21, "indexOfObject:", v9) - 1)
        objc_msgSend(v10, "insertSubview:aboveSubview:", v9, v12);
    }

  }
  else
  {
    objc_msgSend(v6, "addChildViewController:", v7);
    objc_msgSend(v10, "addSubview:", v9);
    objc_msgSend(v10, "bounds");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    objc_msgSend(v9, "setFrame:");
    objc_msgSend(v7, "didMoveToParentViewController:", v6);
    objc_msgSend(v10, "insertSubview:belowSubview:", v12, v9);
    objc_msgSend(v12, "setFrame:", v14, v16, v18, v20);
    objc_msgSend(v9, "layoutIfNeeded");
  }

}

- (BOOL)isPresentingLibrary
{
  void *v2;
  BOOL v3;

  if (self->_targetingPresentingLibrary != 0x7FFFFFFFFFFFFFFFLL)
    return BSSettingFlagIsYes();
  -[SBHModalLibraryPresenter transition](self, "transition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "targetEndpoint") == 1;

  return v3;
}

- (BOOL)isLibraryContainedInForeground
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  char v7;
  char v8;
  BOOL v9;

  -[SBHModalLibraryPresenter contextProvider](self, "contextProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "isDefaultContainerForegroundForPresenter:", self) ^ 1;
  else
    LOBYTE(v5) = 0;
  -[SBHModalLibraryPresenter overrideContainerViewController](self, "overrideContainerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = 1;
  else
    v7 = v5;
  v8 = v7 ^ 1;
  if (v6)
    v9 = 1;
  else
    v9 = v8;

  return v9;
}

- (void)presentLibraryWithAnimation:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  BOOL v7;
  NSMutableArray *didPresentCompletions;
  void (**v9)(id, uint64_t);
  NSMutableArray *v10;
  NSMutableArray *v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(id, uint64_t);

  v4 = a3;
  v15 = (void (**)(id, uint64_t))a4;
  -[SBHModalLibraryPresenter _fireDismissCompletionsWithResult:](self, "_fireDismissCompletionsWithResult:", 0);
  if (v15)
  {
    -[SBHModalLibraryPresenter transition](self, "transition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isTransitioning") & 1) != 0)
    {

    }
    else
    {
      v7 = -[SBHModalLibraryPresenter isPresentingLibrary](self, "isPresentingLibrary");

      if (v7)
      {
        v15[2](v15, 1);
        goto LABEL_9;
      }
    }
    didPresentCompletions = self->_didPresentCompletions;
    v9 = v15;
    if (!didPresentCompletions)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v11 = self->_didPresentCompletions;
      self->_didPresentCompletions = v10;

      v9 = v15;
      didPresentCompletions = self->_didPresentCompletions;
    }
    v12 = (void *)objc_msgSend(v9, "copy");
    v13 = _Block_copy(v12);
    -[NSMutableArray addObject:](didPresentCompletions, "addObject:", v13);

  }
LABEL_9:
  -[SBHModalLibraryPresenter setPreferredTransitionStyle:](self, "setPreferredTransitionStyle:", 0);
  -[SBHModalLibraryPresenter transition](self, "transition");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "progressToEndStateWithAnimation:", v4);

}

- (void)dismissLibraryWithAnimation:(BOOL)a3 completion:(id)a4
{
  -[SBHModalLibraryPresenter dismissLibraryWithTransition:animated:completion:](self, "dismissLibraryWithTransition:animated:completion:", 0, a3, a4);
}

- (void)dismissLibraryWithTransition:(unint64_t)a3 completion:(id)a4
{
  -[SBHModalLibraryPresenter dismissLibraryWithTransition:animated:completion:](self, "dismissLibraryWithTransition:animated:completion:", a3, 1, a4);
}

- (void)dismissLibraryWithTransition:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  void *v8;
  BOOL v9;
  NSMutableArray *didDismissCompletions;
  void (**v11)(id, uint64_t);
  NSMutableArray *v12;
  NSMutableArray *v13;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(id, uint64_t);

  v5 = a4;
  v17 = (void (**)(id, uint64_t))a5;
  -[SBHModalLibraryPresenter _firePresentCompletionWithResult:](self, "_firePresentCompletionWithResult:", 0);
  if (v17)
  {
    -[SBHModalLibraryPresenter transition](self, "transition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isTransitioning") & 1) != 0)
    {

    }
    else
    {
      v9 = -[SBHModalLibraryPresenter isPresentingLibrary](self, "isPresentingLibrary");

      if (!v9)
      {
        v17[2](v17, 1);
        goto LABEL_9;
      }
    }
    didDismissCompletions = self->_didDismissCompletions;
    v11 = v17;
    if (!didDismissCompletions)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v13 = self->_didDismissCompletions;
      self->_didDismissCompletions = v12;

      v11 = v17;
      didDismissCompletions = self->_didDismissCompletions;
    }
    v14 = (void *)objc_msgSend(v11, "copy");
    v15 = _Block_copy(v14);
    -[NSMutableArray addObject:](didDismissCompletions, "addObject:", v15);

  }
LABEL_9:
  -[SBHModalLibraryPresenter setPreferredTransitionStyle:](self, "setPreferredTransitionStyle:", a3);
  -[SBHModalLibraryPresenter transition](self, "transition");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "returnToBeginningStateWithAnimation:", v5);

}

- (void)toggleLibraryPresentedInForegroundWithAnimation:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a3;
  v6 = a4;
  if (!-[SBHModalLibraryPresenter isPresentingLibrary](self, "isPresentingLibrary"))
    goto LABEL_5;
  if (!-[SBHModalLibraryPresenter isLibraryContainedInForeground](self, "isLibraryContainedInForeground"))
  {
    -[SBHModalLibraryPresenter dismissLibraryWithAnimation:completion:](self, "dismissLibraryWithAnimation:completion:", 0, 0);
LABEL_5:
    -[SBHModalLibraryPresenter presentLibraryWithAnimation:completion:](self, "presentLibraryWithAnimation:completion:", v4, v6);
    goto LABEL_6;
  }
  -[SBHModalLibraryPresenter dismissLibraryWithAnimation:completion:](self, "dismissLibraryWithAnimation:completion:", v4, v6);
LABEL_6:

}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (BOOL)isLibraryPresentationModal
{
  return 1;
}

- (BOOL)hasBackgroundBlur
{
  return 1;
}

- (BOOL)isPresentingLibraryInMostForegroundState:(id)a3
{
  _BOOL4 v4;

  v4 = -[SBHModalLibraryPresenter isPresentingLibrary](self, "isPresentingLibrary", a3);
  if (v4)
    LOBYTE(v4) = -[SBHModalLibraryPresenter isLibraryContainedInForeground](self, "isLibraryContainedInForeground");
  return v4;
}

- (id)acquireUseSnapshotAsBackgroundViewAssertionForReason:(id)a3
{
  id v4;
  NSCountedSet *reasonsToSnapshotBackgroundView;
  NSCountedSet *v6;
  NSCountedSet *v7;
  NSCountedSet *v8;
  id v9;
  NSCountedSet *v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  NSCountedSet *v18;
  id v19;
  id v20;
  id location;

  v4 = a3;
  reasonsToSnapshotBackgroundView = self->_reasonsToSnapshotBackgroundView;
  if (!reasonsToSnapshotBackgroundView)
  {
    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v6 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_reasonsToSnapshotBackgroundView;
    self->_reasonsToSnapshotBackgroundView = v6;

    reasonsToSnapshotBackgroundView = self->_reasonsToSnapshotBackgroundView;
  }
  v8 = reasonsToSnapshotBackgroundView;
  -[NSCountedSet addObject:](v8, "addObject:", v4);
  objc_initWeak(&location, self);
  v9 = objc_alloc(MEMORY[0x1E0D01868]);
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __81__SBHModalLibraryPresenter_acquireUseSnapshotAsBackgroundViewAssertionForReason___block_invoke;
  v17 = &unk_1E8D88668;
  v10 = v8;
  v18 = v10;
  v11 = v4;
  v19 = v11;
  objc_copyWeak(&v20, &location);
  v12 = (void *)objc_msgSend(v9, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("SBHModalLibraryPresenter"), v11, &v14);
  -[SBHModalLibraryPresenter _updateBackgroundViewSnapshotted](self, "_updateBackgroundViewSnapshotted", v14, v15, v16, v17);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&location);
  return v12;
}

void __81__SBHModalLibraryPresenter_acquireUseSnapshotAsBackgroundViewAssertionForReason___block_invoke(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "removeObject:", *(_QWORD *)(a1 + 40));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_updateBackgroundViewSnapshotted");

}

- (void)_updateBackgroundViewSnapshotted
{
  void *v3;
  _BOOL4 v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  -[SBHModalLibraryPresenter transition](self, "transition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "isTransitioning") & 1) == 0
    && -[SBHModalLibraryPresenter isPresentingLibrary](self, "isPresentingLibrary")
    && -[NSCountedSet count](self->_reasonsToSnapshotBackgroundView, "count") != 0;

  v5 = -[MTMaterialView isContentReplacedWithSnapshot](self->_backgroundView, "isContentReplacedWithSnapshot");
  if (!v4 || (v5 & 1) != 0)
  {
    if (((v4 | v5 ^ 1) & 1) == 0)
    {
      SBLogLibrary();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1CFEF3000, v7, OS_LOG_TYPE_INFO, "[SBHModalLibraryPresenter] Returning background to live blur", v8, 2u);
      }

      -[MTMaterialView setContentReplacedWithSnapshot:](self->_backgroundView, "setContentReplacedWithSnapshot:", 0);
      -[MTMaterialView layoutIfNeeded](self->_backgroundView, "layoutIfNeeded");
    }
  }
  else
  {
    SBLogLibrary();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CFEF3000, v6, OS_LOG_TYPE_INFO, "[SBHModalLibraryPresenter] Replacing background with snapshot", buf, 2u);
    }

    -[MTMaterialView setContentReplacedWithSnapshot:](self->_backgroundView, "setContentReplacedWithSnapshot:", 1);
  }
}

- (UIView)containerView
{
  void *v2;
  void *v3;

  -[SBHModalLibraryPresenter iconListView](self, "iconListView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (UIView)libraryView
{
  void *v2;
  void *v3;

  -[SBHModalLibraryPresenter libraryViewController](self, "libraryViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (SBHSearchBar)searchBar
{
  void *v2;
  void *v3;
  void *v4;

  -[SBHModalLibraryPresenter libraryViewController](self, "libraryViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBHSearchBar *)v4;
}

- (UIScrollView)podScrollView
{
  void *v2;
  void *v3;
  void *v4;

  -[SBHModalLibraryPresenter libraryViewController](self, "libraryViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "folderController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentScrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIScrollView *)v4;
}

- (SBIconListView)iconListView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[SBHModalLibraryPresenter libraryViewController](self, "libraryViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "folderController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconListViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBIconListView *)v5;
}

- (UIView)sourceContainerView
{
  void *v3;
  void *v4;

  -[SBHModalLibraryPresenter contextProvider](self, "contextProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceContainerViewForPresenter:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v4;
}

- (SBIconView)libraryPodIconView
{
  void *v3;
  void *v4;

  -[SBHModalLibraryPresenter contextProvider](self, "contextProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "libraryIconViewForPresenter:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBIconView *)v4;
}

- (SBHLibraryIconViewController)libraryIconViewController
{
  void *v3;
  void *v4;

  -[SBHModalLibraryPresenter contextProvider](self, "contextProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "libraryIconViewControllerForPresenter:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBHLibraryIconViewController *)v4;
}

- (id)acquireOrderPresentationSourceContainerViewBeforeLibraryViewAssertionForReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBHModalLibraryPresenter contextProvider](self, "contextProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "acquireOrderSourceContainerViewBeforeLibraryViewAssertionForReason:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)noteWillAnimateToEndpoint:(int64_t)a3 withAnimationDuration:(double)a4
{
  NSTimer *criticalDismissalNotifyTimer;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSTimer *v16;
  NSTimer *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id location;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[NSTimer invalidate](self->_criticalDismissalNotifyTimer, "invalidate", a4);
    criticalDismissalNotifyTimer = self->_criticalDismissalNotifyTimer;
    self->_criticalDismissalNotifyTimer = 0;

  }
  else
  {
    -[SBHAppLibrarySettings criticalDismissalThresholdDurationFactor](self->_librarySettings, "criticalDismissalThresholdDurationFactor");
    v8 = v7 * a4;
    if (BSFloatIsZero())
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      -[NSHashTable allObjects](self->_observers, "allObjects");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v26;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v26 != v11)
              objc_enumerationMutation(v9);
            v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v12);
            -[SBHModalLibraryPresenter libraryViewController](self, "libraryViewController");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "modalLibraryPresenter:didPassCriticalDismissalPoint:", self, v14);

            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v10);
      }

    }
    else
    {
      objc_initWeak(&location, self);
      v15 = (void *)MEMORY[0x1E0C99E88];
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __76__SBHModalLibraryPresenter_noteWillAnimateToEndpoint_withAnimationDuration___block_invoke;
      v22 = &unk_1E8D88690;
      objc_copyWeak(&v23, &location);
      objc_msgSend(v15, "timerWithTimeInterval:repeats:block:", 0, &v19, v8);
      v16 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      v17 = self->_criticalDismissalNotifyTimer;
      self->_criticalDismissalNotifyTimer = v16;

      -[NSTimer setTolerance:](self->_criticalDismissalNotifyTimer, "setTolerance:", v8 * 0.15, v19, v20, v21, v22);
      objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addTimer:forMode:", self->_criticalDismissalNotifyTimer, *MEMORY[0x1E0C99860]);

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
  }
}

void __76__SBHModalLibraryPresenter_noteWillAnimateToEndpoint_withAnimationDuration___block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(*((id *)WeakRetained + 1), "allObjects", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
          objc_msgSend(v2, "libraryViewController");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "modalLibraryPresenter:didPassCriticalDismissalPoint:", v2, v9);

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v5);
    }

    v10 = (void *)v2[8];
    v2[8] = 0;

  }
}

- (void)prepareTransition:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v4 = (void *)MEMORY[0x1E0CD28B0];
  v5 = a3;
  objc_msgSend(v4, "setFrameStallSkipRequest:", 1);
  objc_msgSend(v5, "setUserInfo:", self);

  -[SBHModalLibraryPresenter libraryViewController](self, "libraryViewController");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHModalLibraryPresenter backgroundView](self, "backgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v9 = CFSTR("homeScreenOverlayLibrary-iPad");
    else
      v9 = CFSTR("homeScreenOverlay");
    v10 = (void *)MEMORY[0x1E0D47498];
    v11 = v9;
    SBHBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "materialViewWithRecipeNamed:inBundle:options:initialWeighting:scaleAdjustment:", v11, v12, 0, 0, 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setAutoresizingMask:", 18);
    SBHHomeScreenMaterialViewBackdropScaleAdjustmentHandlerForCurrentDevice();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackdropScaleAdjustment:", v13);

    objc_msgSend(v6, "setGroupNameBase:", CFSTR("Modal-App-Library"));
    objc_msgSend(v6, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setContentsOpaque:", 1);

    -[SBHModalLibraryPresenter setBackgroundView:](self, "setBackgroundView:", v6);
    objc_msgSend(v18, "setExternalBackgroundView:", v6);
  }
  objc_msgSend(v18, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAutoresizingMask:", 18);
  -[SBHModalLibraryPresenter contextProvider](self, "contextProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v16, "isDefaultContainerForegroundForPresenter:", self) & 1) != 0)
  {
    v17 = 0;
  }
  else
  {
    objc_msgSend(v16, "containerViewControllerForPresentingInForeground:", self);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[SBHModalLibraryPresenter setOverrideContainerViewController:](self, "setOverrideContainerViewController:", v17);
  objc_msgSend(v15, "setHidden:", 0);
  objc_msgSend(v6, "setHidden:", 0);
  objc_msgSend(v15, "layoutIfNeeded");
  objc_msgSend(v18, "setContentVisibility:", 0);

}

- (id)animatorForTransition:(id)a3
{
  void *v3;
  SBHLibraryZoomAnimator *v4;
  unint64_t v6;
  BOOL IsReduceMotionEnabled;
  __objc2_class *v8;

  v6 = -[SBHModalLibraryPresenter preferredTransitionStyle](self, "preferredTransitionStyle", a3);
  switch(v6)
  {
    case 2uLL:
      v8 = SBHLibraryFadeAnimator;
LABEL_9:
      v4 = (SBHLibraryZoomAnimator *)objc_alloc_init(v8);
      return v4;
    case 1uLL:
      v8 = SBHLibraryZoomAnimator;
      goto LABEL_9;
    case 0uLL:
      IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
      if (!IsReduceMotionEnabled)
      {
        -[SBHModalLibraryPresenter libraryViewController](self, "libraryViewController");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (+[SBHLibraryZoomAnimator validateWithLibrary:context:](SBHLibraryZoomAnimator, "validateWithLibrary:context:", v3, self))
        {
          v4 = objc_alloc_init(SBHLibraryZoomAnimator);
LABEL_11:

          return v4;
        }
      }
      v4 = objc_alloc_init(SBHLibraryFadeAnimator);
      if (!IsReduceMotionEnabled)
        goto LABEL_11;
      break;
  }
  return v4;
}

- (void)transitionWillProgressToEndState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_targetingPresentingLibrary = 1;
  -[SBHModalLibraryPresenter libraryViewController](self, "libraryViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHModalLibraryPresenter _updateLibraryTranslation:withVelocity:animated:](self, "_updateLibraryTranslation:withVelocity:animated:", 1, 0.0, 0.0);
  objc_msgSend(v5, "bs_beginAppearanceTransition:animated:", 1, objc_msgSend(v4, "wantsAnimation"));
  -[SBHModalLibraryPresenter libraryView](self, "libraryView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bs_setHitTestingDisabled:", 0);

  -[SBHModalLibraryPresenter backgroundView](self, "backgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_setHitTestingDisabled:", 0);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSHashTable allObjects](self->_observers, "allObjects", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "modalLibraryPresenter:willPresentLibrary:", self, v5);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  -[SBHModalLibraryPresenter _updateBackgroundViewSnapshotted](self, "_updateBackgroundViewSnapshotted");
  self->_targetingPresentingLibrary = 0x7FFFFFFFFFFFFFFFLL;

}

- (void)transitionDidProgressToEndState:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BSInvalidatable *v10;
  BSInvalidatable *librarySearchPrewarmAssertion;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[SBHModalLibraryPresenter libraryViewController](self, "libraryViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_endAppearanceTransition");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSHashTable allObjects](self->_observers, "allObjects", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9++), "modalLibraryPresenter:didPresentLibrary:", self, v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  if (!self->_librarySearchPrewarmAssertion)
  {
    objc_msgSend(v4, "acquireLibrarySearchPrewarmAssertionForReason:", CFSTR("SBHModalLibraryPresenter"));
    v10 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    librarySearchPrewarmAssertion = self->_librarySearchPrewarmAssertion;
    self->_librarySearchPrewarmAssertion = v10;

  }
  -[SBHModalLibraryPresenter _firePresentCompletionWithResult:](self, "_firePresentCompletionWithResult:", 1);
  -[SBHModalLibraryPresenter _updateBackgroundViewSnapshotted](self, "_updateBackgroundViewSnapshotted");

}

- (void)transitionWillReturnToBeginningState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_targetingPresentingLibrary = 0;
  -[SBHModalLibraryPresenter libraryViewController](self, "libraryViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_beginAppearanceTransition:animated:", 0, objc_msgSend(v4, "wantsAnimation"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSHashTable allObjects](self->_observers, "allObjects", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10++), "modalLibraryPresenter:willDismissLibrary:", self, v5);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  -[SBHModalLibraryPresenter libraryView](self, "libraryView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endEditing:", 0);
  objc_msgSend(v11, "bs_setHitTestingDisabled:", 1);
  -[SBHModalLibraryPresenter backgroundView](self, "backgroundView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bs_setHitTestingDisabled:", 1);

  -[SBHModalLibraryPresenter _updateBackgroundViewSnapshotted](self, "_updateBackgroundViewSnapshotted");
  self->_targetingPresentingLibrary = 0x7FFFFFFFFFFFFFFFLL;

}

- (void)transitionDidReturnToBeginningState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BSInvalidatable *librarySearchPrewarmAssertion;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBHModalLibraryPresenter libraryViewController](self, "libraryViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInfo:", 0);
  -[SBHModalLibraryPresenter _updateLibraryTranslation:withVelocity:animated:](self, "_updateLibraryTranslation:withVelocity:animated:", 0, 0.0, 0.0);
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 1);

  -[SBHModalLibraryPresenter backgroundView](self, "backgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 1);

  objc_msgSend(v5, "bs_endAppearanceTransition");
  -[BSInvalidatable invalidate](self->_librarySearchPrewarmAssertion, "invalidate");
  librarySearchPrewarmAssertion = self->_librarySearchPrewarmAssertion;
  self->_librarySearchPrewarmAssertion = 0;

  objc_msgSend(MEMORY[0x1E0DC37E0], "focusSystemForEnvironment:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNeedsFocusUpdate");

  -[SBHModalLibraryPresenter _updateBackgroundViewSnapshotted](self, "_updateBackgroundViewSnapshotted");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSHashTable allObjects](self->_observers, "allObjects", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "modalLibraryPresenter:didDismissLibrary:", self, v5);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

  -[SBHModalLibraryPresenter _fireDismissCompletionsWithResult:](self, "_fireDismissCompletionsWithResult:", 1);
}

- (void)_fireDismissCompletionsWithResult:(BOOL)a3
{
  NSMutableArray *didDismissCompletions;
  NSMutableArray *v5;
  _QWORD v6[4];
  BOOL v7;

  didDismissCompletions = self->_didDismissCompletions;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__SBHModalLibraryPresenter__fireDismissCompletionsWithResult___block_invoke;
  v6[3] = &__block_descriptor_33_e22_v32__0___v__B_8Q16_B24l;
  v7 = a3;
  -[NSMutableArray enumerateObjectsUsingBlock:](didDismissCompletions, "enumerateObjectsUsingBlock:", v6);
  v5 = self->_didDismissCompletions;
  self->_didDismissCompletions = 0;

}

uint64_t __62__SBHModalLibraryPresenter__fireDismissCompletionsWithResult___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(unsigned __int8 *)(a1 + 32));
}

- (void)_firePresentCompletionWithResult:(BOOL)a3
{
  NSMutableArray *didPresentCompletions;
  NSMutableArray *v5;
  _QWORD v6[4];
  BOOL v7;

  didPresentCompletions = self->_didPresentCompletions;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__SBHModalLibraryPresenter__firePresentCompletionWithResult___block_invoke;
  v6[3] = &__block_descriptor_33_e22_v32__0___v__B_8Q16_B24l;
  v7 = a3;
  -[NSMutableArray enumerateObjectsUsingBlock:](didPresentCompletions, "enumerateObjectsUsingBlock:", v6);
  v5 = self->_didPresentCompletions;
  self->_didPresentCompletions = 0;

}

uint64_t __61__SBHModalLibraryPresenter__firePresentCompletionWithResult___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(unsigned __int8 *)(a1 + 32));
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  char v8;

  -[SBHModalLibraryPresenter presentationDelegate](self, "presentationDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "modalLibraryPresenterShouldAllowSwipeToDismissGesture:", self))
  {
    -[SBHModalLibraryPresenter libraryViewController](self, "libraryViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isPresentingFolder");

    v8 = v7 ^ 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_handlePanGestureRecognizerUpdated:(id)a3
{
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  double v14;
  SBHModalLibraryPresenter *v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  id v24;

  v24 = a3;
  v4 = objc_msgSend(v24, "state");
  if ((unint64_t)(v4 - 3) < 3)
  {
    objc_msgSend(v24, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "velocityInView:", v5);
    v7 = v6;

    objc_msgSend(v24, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "translationInView:", v8);
    v10 = v9;

    v11 = 0.0;
    if (v4 == 3
      && -[SBHModalLibraryPresenter _dismissLibraryIfNecessaryForTranslation:velocity:](self, "_dismissLibraryIfNecessaryForTranslation:velocity:", v10, v7))
    {
      v12 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection");
      -[SBHModalLibraryPresenter libraryView](self, "libraryView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "frame");
      if (v12 == 1)
        v11 = -v14;
      else
        v11 = v14;

    }
    v15 = self;
    v16 = v11;
    v17 = v7 * 0.0625;
    v18 = 1;
LABEL_19:
    -[SBHModalLibraryPresenter _updateLibraryTranslation:withVelocity:animated:](v15, "_updateLibraryTranslation:withVelocity:animated:", v18, v16, v17);
    goto LABEL_20;
  }
  if (v4 == 2)
  {
    objc_msgSend(v24, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "translationInView:", v20);
    v22 = v21;

    if (!-[SBHModalLibraryPresenter _isPanGestureQuantityTowardDismissalDirection:](self, "_isPanGestureQuantityTowardDismissalDirection:", v22))
    {
      BSUIConstrainValueWithRubberBand();
      if (v22 >= 0.0)
        v22 = v23;
      else
        v22 = -v23;
    }
    v17 = 0.0;
    v15 = self;
    v16 = v22;
    v18 = 0;
    goto LABEL_19;
  }
  if (v4 == 1)
  {
    -[SBHModalLibraryPresenter libraryViewController](self, "libraryViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "isPresentingSearch"))
      objc_msgSend(v19, "dismissSearch");

  }
LABEL_20:

}

- (BOOL)_isPanGestureQuantityTowardDismissalDirection:(double)a3
{
  if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1)
    return a3 < 0.0;
  else
    return a3 > 0.0;
}

- (void)_updateLibraryTranslation:(double)a3 withVelocity:(double)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  _QWORD aBlock[4];
  id v18;
  double v19;
  uint64_t v20;

  v5 = a5;
  -[SBHModalLibraryPresenter libraryView](self, "libraryView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  if (v10 != a3 || v9 != 0.0)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __76__SBHModalLibraryPresenter__updateLibraryTranslation_withVelocity_animated___block_invoke;
    aBlock[3] = &unk_1E8D886D8;
    v11 = v8;
    v18 = v11;
    v19 = a3;
    v20 = 0;
    v12 = _Block_copy(aBlock);
    v13 = v12;
    if (v5)
    {
      objc_msgSend(v11, "frame");
      v15 = a3 - v14;
      if (BSFloatIsZero())
        v16 = 0.0;
      else
        v16 = a4 / v15;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 6, v13, 0, 0.67, 0.0, 1.0, v16);
    }
    else
    {
      (*((void (**)(void *))v12 + 2))(v12);
    }

  }
}

uint64_t __76__SBHModalLibraryPresenter__updateLibraryTranslation_withVelocity_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "frame");
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (BOOL)_dismissLibraryIfNecessaryForTranslation:(double)a3 velocity:(double)a4
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  BOOL v18;
  void *v19;

  -[SBHModalLibraryPresenter libraryView](self, "libraryView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[SBHModalLibraryPresenter _isPanGestureQuantityTowardDismissalDirection:](self, "_isPanGestureQuantityTowardDismissalDirection:", a3))
  {
    if (!-[SBHModalLibraryPresenter _isPanGestureQuantityTowardDismissalDirection:](self, "_isPanGestureQuantityTowardDismissalDirection:", a4))goto LABEL_13;
    -[SBHAppLibrarySettings minimumVelocityForSwipeToDismiss](self->_librarySettings, "minimumVelocityForSwipeToDismiss");
LABEL_7:
    if (fabs(a4) > v13)
      goto LABEL_11;
LABEL_13:
    v18 = 0;
    goto LABEL_16;
  }
  v8 = fabs(a3);
  objc_msgSend(v7, "frame");
  v10 = v9;
  -[SBHAppLibrarySettings minimumTranslationFractionForSwipeToDismiss](self->_librarySettings, "minimumTranslationFractionForSwipeToDismiss");
  v12 = v10 * v11;
  if (-[SBHModalLibraryPresenter _isPanGestureQuantityTowardDismissalDirection:](self, "_isPanGestureQuantityTowardDismissalDirection:", a4))
  {
    -[SBHAppLibrarySettings minimumVelocityForSwipeToDismiss](self->_librarySettings, "minimumVelocityForSwipeToDismiss");
    if (v8 > v12)
    {
      BSFloatIsZero();
      goto LABEL_11;
    }
    goto LABEL_7;
  }
  if (v8 <= v12 || (BSFloatIsZero() & 1) == 0)
    goto LABEL_13;
LABEL_11:
  objc_msgSend(v7, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "presentationLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    objc_msgSend(v7, "layer");
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = v17;

  objc_msgSend(v7, "frame");
  objc_msgSend(v19, "frame");
  objc_msgSend(v7, "setFrame:");
  v18 = 1;
  -[SBHModalLibraryPresenter setShouldUseTranslatingAnimationBehavior:](self, "setShouldUseTranslatingAnimationBehavior:", 1);
  -[SBHModalLibraryPresenter dismissLibraryWithAnimation:completion:](self, "dismissLibraryWithAnimation:completion:", 1, 0);
  -[SBHModalLibraryPresenter setShouldUseTranslatingAnimationBehavior:](self, "setShouldUseTranslatingAnimationBehavior:", 0);

LABEL_16:
  return v18;
}

- (NSString)description
{
  return (NSString *)-[SBHModalLibraryPresenter descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHModalLibraryPresenter succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBHModalLibraryPresenter descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBHModalLibraryPresenter *v11;

  v4 = a3;
  -[SBHModalLibraryPresenter succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__SBHModalLibraryPresenter_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8D84EF0;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __66__SBHModalLibraryPresenter_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isPresentingLibrary"), CFSTR("isPresentingLibrary"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isLibraryContainedInForeground"), CFSTR("isLibraryContainedInForeground"));
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "overrideContainerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v5, CFSTR("overrideContainerViewController"), 1);

  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendArraySection:withName:skipIfEmpty:", v8, CFSTR("reasonsToSnapshotBackgroundView"), 1);

  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "transition");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "appendObject:withName:", v11, CFSTR("transition"));

}

- (SBHModalLibraryPresenterContextProviding)contextProvider
{
  return (SBHModalLibraryPresenterContextProviding *)objc_loadWeakRetained((id *)&self->_contextProvider);
}

- (void)setContextProvider:(id)a3
{
  objc_storeWeak((id *)&self->_contextProvider, a3);
}

- (SBHModalLibraryPresentationDelegate)presentationDelegate
{
  return (SBHModalLibraryPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentationDelegate, a3);
}

- (UIViewController)containerViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_containerViewController);
}

- (SBHLibraryViewController)libraryViewController
{
  return self->_libraryViewController;
}

- (MTMaterialView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (SBHViewControllerTransition)transition
{
  return self->_transition;
}

- (unint64_t)preferredTransitionStyle
{
  return self->_preferredTransitionStyle;
}

- (void)setPreferredTransitionStyle:(unint64_t)a3
{
  self->_preferredTransitionStyle = a3;
}

- (UIPanGestureRecognizer)dismissPanGestureRecognizer
{
  return self->_dismissPanGestureRecognizer;
}

- (BOOL)shouldUseTranslatingAnimationBehavior
{
  return self->_shouldUseTranslatingAnimationBehavior;
}

- (void)setShouldUseTranslatingAnimationBehavior:(BOOL)a3
{
  self->_shouldUseTranslatingAnimationBehavior = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_transition, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_libraryViewController, 0);
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_destroyWeak((id *)&self->_contextProvider);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_criticalDismissalNotifyTimer, 0);
  objc_storeStrong((id *)&self->_librarySettings, 0);
  objc_storeStrong((id *)&self->_librarySearchPrewarmAssertion, 0);
  objc_storeStrong((id *)&self->_reasonsToSnapshotBackgroundView, 0);
  objc_storeStrong((id *)&self->_didDismissCompletions, 0);
  objc_storeStrong((id *)&self->_didPresentCompletions, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
