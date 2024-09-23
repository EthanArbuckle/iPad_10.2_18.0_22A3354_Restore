@implementation SBSearchGesture

- (void)setDisabled:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableSet *disabledReasons;
  NSMutableSet *v8;
  NSMutableSet *v9;
  id v10;

  v4 = a3;
  v6 = a4;
  if (v6)
  {
    disabledReasons = self->_disabledReasons;
    v10 = v6;
    if (v4)
    {
      if (!disabledReasons)
      {
        v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
        v9 = self->_disabledReasons;
        self->_disabledReasons = v8;

        v6 = v10;
        disabledReasons = self->_disabledReasons;
      }
      -[NSMutableSet addObject:](disabledReasons, "addObject:", v6);
    }
    else
    {
      -[NSMutableSet removeObject:](disabledReasons, "removeObject:", v6);
    }
    -[SBSearchGesture _updateScrollingEnabled](self, "_updateScrollingEnabled");
    v6 = v10;
  }

}

- (void)_updateScrollingEnabled
{
  -[SBSearchScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", -[NSMutableSet count](self->_disabledReasons, "count") == 0);
}

- (void)updateForRotation
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  self->_suppressObserverCallbacks = 1;
  -[SBSearchScrollView contentOffset](self->_scrollView, "contentOffset");
  v4 = v3;
  v6 = v5;
  -[SBSearchScrollView superview](self->_scrollView, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[SBSearchGesture _startingGestureOffset](self, "_startingGestureOffset");
  v17 = v15 + v16;
  -[SBSearchScrollView setFrame:](self->_scrollView, "setFrame:", v9, v11, v13, v15);
  -[SBSearchScrollView setContentSize:](self->_scrollView, "setContentSize:", v13, v17);
  -[SBSearchScrollView setContentOffset:](self->_scrollView, "setContentOffset:", v4, v6);
  self->_suppressObserverCallbacks = self->_searchPresenter != 0;
}

- (double)_startingGestureOffset
{
  SBHSearchPresenting *searchPresenter;
  double v4;
  double result;

  searchPresenter = self->_searchPresenter;
  if (searchPresenter)
  {
    -[SBHSearchPresenting interactivePresentationMetrics](searchPresenter, "interactivePresentationMetrics");
    return -v4;
  }
  else
  {
    -[SBSearchGesture _maxGestureOffset](self, "_maxGestureOffset");
  }
  return result;
}

+ (double)searchHeaderHeight
{
  return 94.0;
}

- (SBSearchGesture)init
{
  return -[SBSearchGesture initWithSearchPresenter:](self, "initWithSearchPresenter:", 0);
}

- (SBSearchGesture)initWithSearchPresenter:(id)a3
{
  id v5;
  SBSearchGesture *v6;
  SBSearchGesture *v7;
  SBSearchScrollView *v8;
  uint64_t v9;
  SBSearchScrollView *scrollView;
  SBSearchScrollView *v11;
  double v12;
  void *v13;
  uint64_t v14;
  UIPanGestureRecognizer *panGestureRecognizer;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBSearchGesture;
  v6 = -[SBSearchGesture init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_searchPresenter, a3);
    v7->_suppressObserverCallbacks = v5 != 0;
    v8 = [SBSearchScrollView alloc];
    v9 = -[SBSearchScrollView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    scrollView = v7->_scrollView;
    v7->_scrollView = (SBSearchScrollView *)v9;

    -[SBSearchScrollView setBounces:](v7->_scrollView, "setBounces:", 1);
    -[SBSearchScrollView setAlwaysBounceVertical:](v7->_scrollView, "setAlwaysBounceVertical:", v5 != 0);
    -[SBSearchScrollView setDelegate:](v7->_scrollView, "setDelegate:", v7);
    -[SBSearchScrollView setShowsVerticalScrollIndicator:](v7->_scrollView, "setShowsVerticalScrollIndicator:", 0);
    -[SBSearchScrollView setHidden:](v7->_scrollView, "setHidden:", 1);
    -[SBSearchScrollView setScrollsToTop:](v7->_scrollView, "setScrollsToTop:", 0);
    v11 = v7->_scrollView;
    -[SBSearchGesture _startingGestureOffset](v7, "_startingGestureOffset");
    -[SBSearchScrollView setContentOffset:](v11, "setContentOffset:", 0.0, v12);
    -[SBSearchScrollView setContentInsetAdjustmentBehavior:](v7->_scrollView, "setContentInsetAdjustmentBehavior:", 2);
    -[SBSearchScrollView panGestureRecognizer](v7->_scrollView, "panGestureRecognizer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_setHysteresis:", 18.5);

    -[SBSearchScrollView setSearchDelegate:](v7->_scrollView, "setSearchDelegate:", v7);
    -[SBSearchScrollView panGestureRecognizer](v7->_scrollView, "panGestureRecognizer");
    v14 = objc_claimAutoreleasedReturnValue();
    panGestureRecognizer = v7->_panGestureRecognizer;
    v7->_panGestureRecognizer = (UIPanGestureRecognizer *)v14;

    v7->_lastOffset = 0.0;
  }

  return v7;
}

- (void)setTargetView:(id)a3
{
  UIView *v5;
  UIPanGestureRecognizer *v6;
  UIPanGestureRecognizer *panGestureRecognizer;
  UIPanGestureRecognizer *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIView *v13;

  v5 = (UIView *)a3;
  if (self->_targetView != v5)
  {
    self->_suppressObserverCallbacks = 1;
    v13 = v5;
    -[SBSearchScrollView panGestureRecognizer](self->_scrollView, "panGestureRecognizer");
    v6 = (UIPanGestureRecognizer *)objc_claimAutoreleasedReturnValue();
    panGestureRecognizer = self->_panGestureRecognizer;
    self->_panGestureRecognizer = v6;
    v8 = v6;

    -[UIView removeGestureRecognizer:](self->_targetView, "removeGestureRecognizer:", v8);
    objc_storeStrong((id *)&self->_targetView, a3);
    -[SBSearchScrollView contentOffset](self->_scrollView, "contentOffset");
    v10 = v9;
    v12 = v11;
    -[SBSearchScrollView removeFromSuperview](self->_scrollView, "removeFromSuperview");
    -[UIView addSubview:](self->_targetView, "addSubview:", self->_scrollView);
    -[SBSearchScrollView setContentOffset:](self->_scrollView, "setContentOffset:", v10, v12);
    -[SBSearchGesture updateForRotation](self, "updateForRotation");
    -[UIView addGestureRecognizer:](self->_targetView, "addGestureRecognizer:", v8);

    v5 = v13;
    self->_suppressObserverCallbacks = self->_searchPresenter != 0;
  }

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

- (void)revealAnimated:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;

  if (!self->_searchPresenter)
  {
    v3 = a3;
    if (!self->_animatingResetOrReveal || !a3)
    {
      -[SBSearchScrollView contentOffset](self->_scrollView, "contentOffset");
      if (v6 != 0.0 || v5 != 0.0)
      {
        -[SBSearchGesture setDisabled:forReason:](self, "setDisabled:forReason:", 1, CFSTR("revealAnimated"));
        self->_animatingResetOrReveal = v3;
        -[SBSearchGesture _notifyThaWeStartedShowingOrHiding](self, "_notifyThaWeStartedShowingOrHiding");
        -[SBSearchScrollView setContentOffset:animated:](self->_scrollView, "setContentOffset:animated:", v3, 0.0, 0.0);
        if (!v3)
          -[SBSearchGesture _updateForFinalContentOffset](self, "_updateForFinalContentOffset");
      }
    }
  }
}

- (void)resetAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!self->_searchPresenter)
  {
    v3 = a3;
    self->_isDismissing = 1;
    if (!self->_suppressObserverCallbacks)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v5 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v17 != v8)
              objc_enumerationMutation(v5);
            v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v10, "searchGesture:resetAnimated:", self, v3);
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v7);
      }

    }
    if (!self->_animatingResetOrReveal || !v3)
    {
      -[SBSearchGesture _maxGestureOffset](self, "_maxGestureOffset");
      v12 = v11;
      -[SBSearchScrollView contentOffset](self->_scrollView, "contentOffset");
      if (v14 == 0.0 && v12 == v13)
      {
        self->_isDismissing = 0;
      }
      else
      {
        self->_animatingResetOrReveal = v3;
        -[SBSearchScrollView setContentOffset:animated:](self->_scrollView, "setContentOffset:animated:", v3, 0.0, v12);
        if (!v3)
          -[SBSearchGesture _updateForScrollingEnded](self, "_updateForScrollingEnded");
      }
    }
  }
}

- (CGPoint)locationInView:(id)a3
{
  SBSearchScrollView *scrollView;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  scrollView = self->_scrollView;
  v4 = a3;
  -[SBSearchScrollView panGestureRecognizer](scrollView, "panGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v4);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)_notifyThaWeStartedShowingOrHiding
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!self->_suppressObserverCallbacks)
  {
    v3 = -[SBSearchGesture _isShowingSearch](self, "_isShowingSearch");
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = !v3;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v10, "searchGesture:startedShowing:", self, v7);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
}

- (void)_notifyThatGestureEndedWithShowingIfNeeded:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_isDraggingAccordingToScrollView)
  {
    self->_isDraggingAccordingToScrollView = 0;
    if (!self->_suppressObserverCallbacks)
    {
      v4 = a3;
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v5 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v12;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v12 != v8)
              objc_enumerationMutation(v5);
            v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v10, "searchGesture:endedGesture:", self, v4);
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v7);
      }

    }
  }
}

- (void)_updateForScrollingEnded
{
  SBSearchScrollView *scrollView;
  double v4;
  void *v5;
  void *v6;
  SBSearchScrollView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v13;
  SBSearchScrollView *v14;
  double v15;
  double v16;
  double v17;

  if (!self->_ignoreScrollingEnded)
  {
    self->_ignoreScrollingEnded = 1;
    if (self->_searchPresenter)
    {
      scrollView = self->_scrollView;
      -[SBSearchGesture _startingGestureOffset](self, "_startingGestureOffset");
      -[SBSearchScrollView setContentOffset:animated:](scrollView, "setContentOffset:animated:", 0, 0.0, v4);
      self->_ignoreScrollingEnded = 0;
    }
    else
    {
      if (self->_isDismissing)
      {
        -[SBSearchScrollView panGestureRecognizer](self->_scrollView, "panGestureRecognizer");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setEnabled:", 0);

        -[SBSearchScrollView panGestureRecognizer](self->_scrollView, "panGestureRecognizer");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setEnabled:", 1);

        v7 = self->_scrollView;
        -[SBSearchGesture _maxGestureOffset](self, "_maxGestureOffset");
        -[SBSearchScrollView setContentOffset:animated:](v7, "setContentOffset:animated:", 0, 0.0, v8);
      }
      -[SBSearchScrollView contentOffset](self->_scrollView, "contentOffset");
      v10 = v9;
      -[SBSearchGesture _maxGestureOffset](self, "_maxGestureOffset");
      if (v10 != 0.0 && v10 != v11)
      {
        v13 = v11;
        v14 = self->_scrollView;
        -[SBSearchGesture _progressThreshold](self, "_progressThreshold");
        if (v10 / v13 >= v15)
          v16 = v13;
        else
          v16 = 0.0;
        -[SBSearchScrollView setContentOffset:animated:](v14, "setContentOffset:animated:", 1, 0.0, v16);
      }
      *(_WORD *)&self->_isDismissing = 0;
      if (v10 == 0.0 || (-[SBSearchGesture _maxGestureOffset](self, "_maxGestureOffset"), v10 == v17))
        -[SBSearchGesture _updateForFinalContentOffset](self, "_updateForFinalContentOffset");
      -[SBSearchGesture _notifyThatGestureEndedWithShowingIfNeeded:](self, "_notifyThatGestureEndedWithShowingIfNeeded:", -[SBSearchGesture isShowingSearch](self, "isShowingSearch"));
    }
  }
}

- (void)_updateForFinalContentOffset
{
  _BOOL8 v3;
  _BOOL8 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[SBSearchGesture setDisabled:forReason:](self, "setDisabled:forReason:", 0, CFSTR("revealAnimated"));
  self->_animatingResetOrReveal = 0;
  v3 = -[SBSearchGesture _isShowingSearch](self, "_isShowingSearch");
  if (!self->_suppressObserverCallbacks)
  {
    v4 = v3;
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v10, "searchGesture:completedShowing:", self, v4);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (BOOL)_isShowingSearch
{
  double v3;

  if (self->_isDismissing)
    return 0;
  -[SBSearchScrollView contentOffset](self->_scrollView, "contentOffset");
  return fabs(v3) < 2.22044605e-16;
}

- (BOOL)isTracking
{
  return -[SBSearchScrollView isTracking](self->_scrollView, "isTracking");
}

- (BOOL)isDragging
{
  _BOOL4 v3;

  v3 = -[SBSearchGesture isTracking](self, "isTracking");
  if (v3)
    LOBYTE(v3) = self->_isDraggingAccordingToScrollView;
  return v3;
}

- (double)_maxGestureOffset
{
  SBHSearchPresenting *searchPresenter;
  double v3;

  searchPresenter = self->_searchPresenter;
  if (!searchPresenter)
    return 94.0;
  -[SBHSearchPresenting interactivePresentationMetrics](searchPresenter, "interactivePresentationMetrics");
  return v3;
}

- (double)_progressThreshold
{
  SBHSearchPresenting *searchPresenter;
  double v3;

  searchPresenter = self->_searchPresenter;
  if (!searchPresenter)
    return 0.5;
  -[SBHSearchPresenting interactivePresentationMetrics](searchPresenter, "interactivePresentationMetrics");
  return v3;
}

- (NSString)description
{
  return (NSString *)-[SBSearchGesture descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("\t"));
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  SBSearchScrollView *scrollView;
  id v5;

  self->_isDraggingAccordingToScrollView = 1;
  scrollView = self->_scrollView;
  v5 = a3;
  -[SBSearchScrollView setBounces:](scrollView, "setBounces:", 1);
  -[SBSearchGesture _notifyThaWeStartedShowingOrHiding](self, "_notifyThaWeStartedShowingOrHiding");
  -[SBHSearchPresenting scrollViewWillBeginDragging:](self->_searchPresenter, "scrollViewWillBeginDragging:", v5);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBSearchScrollView contentOffset](self->_scrollView, "contentOffset");
  v6 = v5;
  if ((SBFFloatEqualsFloat() & 1) == 0)
  {
    -[SBHSearchPresenting scrollViewDidScroll:](self->_searchPresenter, "scrollViewDidScroll:", v4);
    -[SBSearchGesture _startingGestureOffset](self, "_startingGestureOffset");
    v8 = v7;
    -[SBSearchGesture _maxGestureOffset](self, "_maxGestureOffset");
    if (!self->_suppressObserverCallbacks)
    {
      v10 = v9;
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v11 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v18;
        v15 = (v8 - v6) / v10;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v18 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "searchGesture:changedPercentComplete:", self, v15);
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v13);
      }

    }
    self->_lastOffset = v6;
  }

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  id v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  double v17;
  _BOOL8 v18;
  id v19;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  v19 = v9;
  if (self->_searchPresenter)
  {
    objc_msgSend(v9, "contentOffset");
    a5->x = v10;
    a5->y = v11;
    -[SBHSearchPresenting scrollViewWillEndDragging:withVelocity:](self->_searchPresenter, "scrollViewWillEndDragging:withVelocity:", v19, x, y);
  }
  else
  {
    v12 = a5->y;
    -[SBSearchGesture _maxGestureOffset](self, "_maxGestureOffset");
    v14 = v13;
    -[SBSearchGesture _progressThreshold](self, "_progressThreshold");
    v16 = v12 / v14 < v15;
    v17 = 0.0;
    if (!v16)
      v17 = v14;
    a5->y = v17;
    v18 = fabs(v17) < 2.22044605e-16;
    -[SBSearchScrollView setBounces:](self->_scrollView, "setBounces:", v18);
    -[SBSearchGesture _notifyThatGestureEndedWithShowingIfNeeded:](self, "_notifyThatGestureEndedWithShowingIfNeeded:", v18);
  }

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[SBSearchGesture _updateForScrollingEnded](self, "_updateForScrollingEnded", a3);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  if ((-[SBSearchScrollView isTracking](self->_scrollView, "isTracking", a3) & 1) == 0
    && !self->_animatingResetOrReveal)
  {
    -[SBSearchGesture _updateForScrollingEnded](self, "_updateForScrollingEnded");
  }
}

- (void)requireGestureRecognizerToFail:(id)a3
{
  -[UIPanGestureRecognizer requireGestureRecognizerToFail:](self->_panGestureRecognizer, "requireGestureRecognizerToFail:", a3);
}

- (BOOL)searchScrollViewShouldRecognize:(id)a3
{
  id WeakRetained;
  void *v5;
  char v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained;
  if (WeakRetained)
    v6 = objc_msgSend(WeakRetained, "searchGestureShouldRecognize:", self);
  else
    v6 = 1;

  return v6;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBSearchGesture descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  id v8;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendBool:withName:", self->_isDismissing, CFSTR("isDismissing"));
  v6 = (id)objc_msgSend(v4, "appendBool:withName:", self->_animatingResetOrReveal, CFSTR("animatingResetOrReveal"));
  v7 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("lastOffset"), self->_lastOffset);
  v8 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_disabledReasons, CFSTR("disabledReasons"), 1);
  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSearchGesture succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (SBHSearchPresenting)searchPresenter
{
  return self->_searchPresenter;
}

- (void)setSearchPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_searchPresenter, a3);
}

- (SBSearchGestureDelegate)delegate
{
  return (SBSearchGestureDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)targetView
{
  return self->_targetView;
}

- (BOOL)isAnimatingResetOrReveal
{
  return self->_animatingResetOrReveal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_searchPresenter, 0);
  objc_storeStrong((id *)&self->_disabledReasons, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
