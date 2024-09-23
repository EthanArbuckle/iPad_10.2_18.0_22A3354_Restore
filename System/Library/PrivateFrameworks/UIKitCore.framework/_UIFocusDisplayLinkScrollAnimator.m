@implementation _UIFocusDisplayLinkScrollAnimator

- (_UIFocusDisplayLinkScrollAnimator)initWithScreen:(id)a3
{
  id v5;
  _UIFocusDisplayLinkScrollAnimator *v6;
  _UIFocusDisplayLinkScrollAnimator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIFocusDisplayLinkScrollAnimator;
  v6 = -[_UIFocusDisplayLinkScrollAnimator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_screen, a3);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_UIFocusDisplayLinkScrollAnimator;
  -[_UIFocusDisplayLinkScrollAnimator dealloc](&v3, sel_dealloc);
}

- (double)defaultConvergenceRate
{
  return self->_defaultConvergenceRate;
}

- (void)setDefaultConvergenceRate:(double)a3
{
  self->_defaultConvergenceRate = a3;
}

- (void)setTargetContentOffset:(CGPoint)a3 forEnvironmentScrollableContainer:(id)a4 convergenceRate:(double)a5 completion:(id)a6
{
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  unint64_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  int v20;
  double v21;
  __int16 v22;
  double v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  y = a3.y;
  x = a3.x;
  v26 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a6;
  -[_UIFocusDisplayLinkScrollAnimator _entryForEnvironmentScrollableContainer:createIfNeeded:](self, "_entryForEnvironmentScrollableContainer:createIfNeeded:", v11, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (fabs(x) == INFINITY || (v15 = fabs(y), v15 >= INFINITY) && v15 <= INFINITY)
  {
    v16 = setTargetContentOffset_forEnvironmentScrollableContainer_convergenceRate_completion____s_category;
    if (!setTargetContentOffset_forEnvironmentScrollableContainer_convergenceRate_completion____s_category)
    {
      v16 = __UILogCategoryGetNode("FocusScroll", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v16, (unint64_t *)&setTargetContentOffset_forEnvironmentScrollableContainer_convergenceRate_completion____s_category);
    }
    v17 = *(NSObject **)(v16 + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = v17;
      objc_msgSend(v11, "scrollableContainer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 134218498;
      v21 = x;
      v22 = 2048;
      v23 = y;
      v24 = 2112;
      v25 = v19;
      _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "Ignoring request to scroll container to non-finite location: (%g, %g) in %@", (uint8_t *)&v20, 0x20u);

    }
  }
  else
  {
    objc_msgSend(v13, "setTargetContentOffset:", x, y);
  }
  objc_msgSend(v14, "setConvergenceRate:", a5);
  objc_msgSend(v14, "setCompletion:", v12);

  -[_UIFocusDisplayLinkScrollAnimator _updateHeartbeatConfiguration](self, "_updateHeartbeatConfiguration");
}

- (void)cancelScrollingForScrollableContainer:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  -[_UIFocusDisplayLinkScrollAnimator _entryForScrollableContainer:](self, "_entryForScrollableContainer:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7 = v4;
    objc_msgSend(v4, "completion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v7, "completion");
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v6[2](v6, 0);

    }
    -[_UIFocusDisplayLinkScrollAnimator _removeEntry:](self, "_removeEntry:", v7);
    -[_UIFocusDisplayLinkScrollAnimator _updateHeartbeatConfiguration](self, "_updateHeartbeatConfiguration");
    v4 = v7;
  }

}

- (void)adjustTargetContentOffsetForScrollableContainer:(id)a3 byDelta:(CGPoint)a4
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  y = a4.y;
  x = a4.x;
  -[_UIFocusDisplayLinkScrollAnimator _entryForScrollableContainer:](self, "_entryForScrollableContainer:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v11 = v6;
    objc_msgSend(v6, "targetContentOffset");
    objc_msgSend(v11, "setTargetContentOffset:", x + v7, y + v8);
    objc_msgSend(v11, "lastContentOffset");
    objc_msgSend(v11, "setLastContentOffset:", x + v9, y + v10);
    v6 = v11;
  }

}

- (BOOL)isAnimatingScrollableContainer:(id)a3
{
  void *v3;
  BOOL v4;

  -[_UIFocusDisplayLinkScrollAnimator _entryForScrollableContainer:](self, "_entryForScrollableContainer:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (CGPoint)targetContentOffsetForScrollableContainer:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  -[_UIFocusDisplayLinkScrollAnimator _entryForScrollableContainer:](self, "_entryForScrollableContainer:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "targetContentOffset");
    v6 = v5;
    v8 = v7;
  }
  else
  {
    v6 = *MEMORY[0x1E0C9D538];
    v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (CGPoint)currentVelocityForScrollableContainer:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  long double v13;
  long double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGPoint result;

  -[_UIFocusDisplayLinkScrollAnimator _entryForScrollableContainer:](self, "_entryForScrollableContainer:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "lastContentOffset");
    v6 = v5;
    v8 = v7;
    objc_msgSend(v4, "targetContentOffset");
    v10 = v9;
    v12 = v11;
    objc_msgSend(v4, "convergenceRate");
    v14 = pow(v13, 16.0);
    v15 = (v6 * v14 + v10 * (1.0 - v14) - v6) * 0.0625;
    v16 = (v8 * v14 + v12 * (1.0 - v14) - v8) * 0.0625;
  }
  else
  {
    v15 = *MEMORY[0x1E0C9D538];
    v16 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }

  v17 = v15;
  v18 = v16;
  result.y = v18;
  result.x = v17;
  return result;
}

- (CGPoint)velocityToScrollFromOffset:(CGPoint)a3 toOffset:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  long double v8;
  long double v9;
  double v10;
  double v11;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  v8 = pow(self->_defaultConvergenceRate, 16.0);
  v9 = v6 * v8 + y * (1.0 - v8) - v6;
  v10 = (v7 * v8 + x * (1.0 - v8) - v7) * 0.0625;
  v11 = v9 * 0.0625;
  result.y = v11;
  result.x = v10;
  return result;
}

- (id)_entryForScrollableContainer:(id)a3
{
  id v4;
  _UIFocusEngineScrollableContainerOffsets *singleScrollableContainerEntry;
  void *v6;
  id v7;
  NSMapTable *scrollableContainers;
  _UIFocusEngineScrollableContainerOffsets *v9;
  _UIFocusEngineScrollableContainerOffsets *v10;

  v4 = a3;
  singleScrollableContainerEntry = self->_singleScrollableContainerEntry;
  if (singleScrollableContainerEntry)
  {
    -[_UIFocusEngineScrollableContainerOffsets environmentScrollableContainer](singleScrollableContainerEntry, "environmentScrollableContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scrollableContainer");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v4)
    {
      v9 = self->_singleScrollableContainerEntry;
      goto LABEL_7;
    }
  }
  scrollableContainers = self->_scrollableContainers;
  if (scrollableContainers)
  {
    -[NSMapTable objectForKey:](scrollableContainers, "objectForKey:", v4);
    v9 = (_UIFocusEngineScrollableContainerOffsets *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v10 = v9;
    goto LABEL_8;
  }
  v10 = 0;
LABEL_8:

  return v10;
}

- (id)_entryForEnvironmentScrollableContainer:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  _UIFocusEngineScrollableContainerOffsets *singleScrollableContainerEntry;
  BOOL v9;
  void *v11;
  void *v12;
  _UIFocusEngineScrollableContainerOffsets *v13;
  NSMapTable *scrollableContainers;
  NSMapTable *v15;
  NSMapTable *v16;
  NSMapTable *v17;
  _UIFocusEngineScrollableContainerOffsets *v18;
  void *v19;
  void *v20;
  _UIFocusEngineScrollableContainerOffsets *v21;
  _UIFocusEngineScrollableContainerOffsets *v22;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "scrollableContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  singleScrollableContainerEntry = self->_singleScrollableContainerEntry;
  if (self->_scrollableContainers)
    v9 = 0;
  else
    v9 = singleScrollableContainerEntry == 0;
  if (!v9 || !v4)
  {
    -[_UIFocusEngineScrollableContainerOffsets environmentScrollableContainer](singleScrollableContainerEntry, "environmentScrollableContainer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scrollableContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = self->_singleScrollableContainerEntry;
    if (v12 == v7)
    {
      v22 = v13;
    }
    else
    {
      scrollableContainers = self->_scrollableContainers;
      if (v13 && v4)
      {
        if (!scrollableContainers)
        {
          objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
          v15 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
          v16 = self->_scrollableContainers;
          self->_scrollableContainers = v15;

        }
        -[_UIFocusDisplayLinkScrollAnimator _createEntryForEnvironmentScrollableContainer:](self, "_createEntryForEnvironmentScrollableContainer:", v6);
        v22 = (_UIFocusEngineScrollableContainerOffsets *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable setObject:forKey:](self->_scrollableContainers, "setObject:forKey:", v22, v7);
        v18 = self->_singleScrollableContainerEntry;
        v17 = self->_scrollableContainers;
        -[_UIFocusEngineScrollableContainerOffsets environmentScrollableContainer](v18, "environmentScrollableContainer");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "scrollableContainer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable setObject:forKey:](v17, "setObject:forKey:", v18, v20);

        v21 = self->_singleScrollableContainerEntry;
        self->_singleScrollableContainerEntry = 0;

      }
      else if (scrollableContainers)
      {
        -[NSMapTable objectForKey:](scrollableContainers, "objectForKey:", v7);
        v22 = (_UIFocusEngineScrollableContainerOffsets *)objc_claimAutoreleasedReturnValue();
        if (!v22 && v4)
        {
          -[_UIFocusDisplayLinkScrollAnimator _createEntryForEnvironmentScrollableContainer:](self, "_createEntryForEnvironmentScrollableContainer:", v6);
          v22 = (_UIFocusEngineScrollableContainerOffsets *)objc_claimAutoreleasedReturnValue();
          -[NSMapTable setObject:forKey:](self->_scrollableContainers, "setObject:forKey:", v22, v7);
        }
      }
      else
      {
        v22 = 0;
      }
    }
  }
  else
  {
    -[_UIFocusDisplayLinkScrollAnimator _createEntryForEnvironmentScrollableContainer:](self, "_createEntryForEnvironmentScrollableContainer:", v6);
    v22 = (_UIFocusEngineScrollableContainerOffsets *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_singleScrollableContainerEntry, v22);
  }

  return v22;
}

- (id)_createEntryForEnvironmentScrollableContainer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  _UIFocusEngineScrollableContainerOffsets *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _BYTE *v14;
  unint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  __CFString *v21;
  unint64_t v23;
  void *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  __CFString *v28;
  void *v29;
  __CFString *v30;
  void *v31;
  uint8_t buf[4];
  __CFString *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "scrollableContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "__isKindOfUIScrollView"))
  {
    v6 = v5;
    objc_msgSend(v6, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "_adjustsTargetsOnContentOffsetChanges"))
      v8 = objc_msgSend(v6, "isScrollAnimating") ^ 1;
    else
      v8 = 0;

  }
  else
  {
    v7 = 0;
    v8 = 1;
  }
  v9 = objc_alloc_init(_UIFocusEngineScrollableContainerOffsets);
  -[_UIFocusEngineScrollableContainerOffsets setAdjustsTargetsOnContentOffsetChanges:](v9, "setAdjustsTargetsOnContentOffsetChanges:", v8);
  -[_UIFocusEngineScrollableContainerOffsets setEnvironmentScrollableContainer:](v9, "setEnvironmentScrollableContainer:", v4);
  -[_UIFocusEngineScrollableContainerOffsets setScrollDelegate:](v9, "setScrollDelegate:", v7);
  -[_UIFocusEngineScrollableContainerOffsets setConvergenceRate:](v9, "setConvergenceRate:", self->_defaultConvergenceRate);
  objc_msgSend(v5, "contentOffset");
  v11 = v10;
  v13 = v12;
  -[_UIFocusEngineScrollableContainerOffsets setStartContentOffset:](v9, "setStartContentOffset:");
  -[_UIFocusEngineScrollableContainerOffsets setTargetContentOffset:](v9, "setTargetContentOffset:", v11, v13);
  -[_UIFocusEngineScrollableContainerOffsets setLastContentOffset:](v9, "setLastContentOffset:", v11, v13);
  -[_UIFocusEngineScrollableContainerOffsets setLastRoundedOffset:](v9, "setLastRoundedOffset:", v11, v13);
  v14 = (_BYTE *)_MergedGlobals_1048;
  if (!_MergedGlobals_1048)
  {
    v14 = (_BYTE *)(__UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16);
    atomic_store((unint64_t)v14, (unint64_t *)&_MergedGlobals_1048);
  }
  if ((*v14 & 1) == 0)
  {
    v15 = qword_1ECD7DC30;
    if (!qword_1ECD7DC30)
    {
      v15 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v15, (unint64_t *)&qword_1ECD7DC30);
    }
    v16 = *(id *)(v15 + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "owningEnvironment");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = (void *)MEMORY[0x1E0CB3940];
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", CFSTR("<%@: %p>"), v20, v17);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v21 = CFSTR("(nil)");
      }
      *(_DWORD *)buf = 138412290;
      v33 = v21;
      _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_DEFAULT, "Creating focus scroll animator entry for environment %@", buf, 0xCu);

    }
LABEL_17:

    goto LABEL_18;
  }
  v23 = qword_1ECD7DC28;
  if (!qword_1ECD7DC28)
  {
    v23 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v23, (unint64_t *)&qword_1ECD7DC28);
  }
  if ((*(_BYTE *)v23 & 1) != 0)
  {
    v16 = *(id *)(v23 + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "owningEnvironment");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v25 = (void *)MEMORY[0x1E0CB3940];
        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringWithFormat:", CFSTR("<%@: %p>"), v27, v24);
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v28 = CFSTR("(nil)");
      }
      v29 = (void *)MEMORY[0x1E0CB3978];
      v30 = v28;
      objc_msgSend(v29, "callStackSymbols");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v33 = v28;
      v34 = 2114;
      v35 = v31;
      _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "Creating focus scroll animator entry for environment %@\n%{public}@", buf, 0x16u);

    }
    goto LABEL_17;
  }
LABEL_18:

  return v9;
}

- (BOOL)_canCreateDisplayLink
{
  return 1;
}

- (void)_switchToTimerScrolling
{
  CADisplayLink *displayLink;
  CADisplayLink *v4;

  displayLink = self->_displayLink;
  -[CADisplayLink invalidate](displayLink, "invalidate");
  v4 = self->_displayLink;
  self->_displayLink = 0;

  if (displayLink)
  {
    _UIQOSManagedCommitsEnd(self, CFSTR("FocusScrollAnimation"));
    -[_UIFocusDisplayLinkScrollAnimator _updateHeartbeatConfiguration](self, "_updateHeartbeatConfiguration");
    if (-[_UIFocusDisplayLinkScrollAnimator _shouldPushAndPopRunLoopModes](self, "_shouldPushAndPopRunLoopModes"))
      objc_msgSend((id)UIApp, "_popRunLoopMode:requester:reason:", CFSTR("UITrackingRunLoopMode"), self, CFSTR("Focus scroll animator, display link switched to timer"));
  }
  else
  {
    -[_UIFocusDisplayLinkScrollAnimator _updateHeartbeatConfiguration](self, "_updateHeartbeatConfiguration");
  }
}

- (void)_updateHeartbeatConfiguration
{
  NSTimer *timer;
  CADisplayLink *displayLink;
  _BOOL4 v5;
  BOOL v6;
  CADisplayLink *v7;
  CADisplayLink *v8;
  CADisplayLink *v9;
  void *v10;
  const __CFString *v11;
  char v12;
  NSTimer *v13;
  void *v14;
  const __CFString *v15;
  NSTimer *v16;
  NSTimer *v17;
  void *v18;
  CADisplayLink *v19;

  displayLink = self->_displayLink;
  timer = self->_timer;
  if (self->_singleScrollableContainerEntry)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v5 = -[NSMapTable count](self->_scrollableContainers, "count") != 0;
    if (!v5)
      goto LABEL_11;
  }
  if (displayLink)
    v6 = 0;
  else
    v6 = timer == 0;
  if (v6)
  {
    self->_lastHeartbeatTime = CFAbsoluteTimeGetCurrent();
    if (-[_UIFocusDisplayLinkScrollAnimator _canCreateDisplayLink](self, "_canCreateDisplayLink"))
    {
      -[UIScreen displayLinkWithTarget:selector:](self->_screen, "displayLinkWithTarget:selector:", self, sel__displayLinkHeartbeat_);
      v7 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
      v8 = self->_displayLink;
      self->_displayLink = v7;

      v9 = self->_displayLink;
      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CADisplayLink addToRunLoop:forMode:](v9, "addToRunLoop:forMode:", v10, *MEMORY[0x1E0C99860]);

      _UIQOSManagedCommitsBegin(self, CFSTR("FocusScrollAnimation"));
      v11 = CFSTR("Focus scroll animator, display link");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__timerHeartbeat_, 0, 1, 0.0166666667);
      v16 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      v17 = self->_timer;
      self->_timer = v16;

      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addTimer:forMode:", self->_timer, *MEMORY[0x1E0C99860]);

      v11 = CFSTR("Focus scroll animator, timer");
    }
    if (-[_UIFocusDisplayLinkScrollAnimator _shouldPushAndPopRunLoopModes](self, "_shouldPushAndPopRunLoopModes"))
      objc_msgSend((id)UIApp, "_pushRunLoopMode:requester:reason:", CFSTR("UITrackingRunLoopMode"), self, v11);
    return;
  }
LABEL_11:
  if (displayLink)
    v12 = v5;
  else
    v12 = 1;
  if ((v12 & 1) == 0)
  {
    -[CADisplayLink invalidate](self->_displayLink, "invalidate");
    v19 = self->_displayLink;
    self->_displayLink = 0;

    _UIQOSManagedCommitsEnd(self, CFSTR("FocusScrollAnimation"));
    if (!-[_UIFocusDisplayLinkScrollAnimator _shouldPushAndPopRunLoopModes](self, "_shouldPushAndPopRunLoopModes"))
      return;
    v14 = (void *)UIApp;
    v15 = CFSTR("Focus scroll animator, display link");
    goto LABEL_25;
  }
  if (!timer)
    LOBYTE(v5) = 1;
  if (!v5)
  {
    -[NSTimer invalidate](self->_timer, "invalidate");
    v13 = self->_timer;
    self->_timer = 0;

    if (-[_UIFocusDisplayLinkScrollAnimator _shouldPushAndPopRunLoopModes](self, "_shouldPushAndPopRunLoopModes"))
    {
      v14 = (void *)UIApp;
      v15 = CFSTR("Focus scroll animator, timer");
LABEL_25:
      objc_msgSend(v14, "_popRunLoopMode:requester:reason:", CFSTR("UITrackingRunLoopMode"), self, v15);
    }
  }
}

- (BOOL)_shouldPushAndPopRunLoopModes
{
  return 0;
}

- (void)_displayLinkHeartbeat:(id)a3
{
  double v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "timestamp");
  v5 = _UIMachTimeForMediaTime(v4);
  objc_msgSend(v8, "targetTimestamp");
  v7 = _UIMachTimeForMediaTime(v6);
  _UIQOSProcessingBegin("UIFocusScrollAnimator", 0, v5, v7);
  -[_UIFocusDisplayLinkScrollAnimator _commonHeartbeat](self, "_commonHeartbeat");
  _UIQOSProcessingEnd();

}

- (void)_commonHeartbeat
{
  CFAbsoluteTime Current;

  Current = CFAbsoluteTimeGetCurrent();
  -[_UIFocusDisplayLinkScrollAnimator _commonHeartbeat:](self, "_commonHeartbeat:", Current - self->_lastHeartbeatTime);
  self->_lastHeartbeatTime = Current;
}

- (void)_commonHeartbeat:(double)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  _UIFocusEngineScrollableContainerOffsets *singleScrollableContainerEntry;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void (**v21)(_QWORD, _QWORD);
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void (**v35)(_QWORD, _QWORD);
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = (uint64_t)(a3 * 1000.0);
  if (v3 >= 1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectEnumerator](self->_scrollableContainers, "objectEnumerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    singleScrollableContainerEntry = self->_singleScrollableContainerEntry;
    if (singleScrollableContainerEntry)
      -[_UIFocusDisplayLinkScrollAnimator _processEntry:timeDelta:completed:cancelled:](self, "_processEntry:timeDelta:completed:cancelled:", singleScrollableContainerEntry, v3, v5, v6);
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v45 != v12)
            objc_enumerationMutation(v9);
          -[_UIFocusDisplayLinkScrollAnimator _processEntry:timeDelta:completed:cancelled:](self, "_processEntry:timeDelta:completed:cancelled:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i), v3, v5, v6);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
      }
      while (v11);
    }

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v14 = v6;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v41 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
          objc_msgSend(v19, "completion");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            objc_msgSend(v19, "completion");
            v21 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            v21[2](v21, 0);

          }
          -[_UIFocusDisplayLinkScrollAnimator _removeEntry:](self, "_removeEntry:", v19);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
      }
      while (v16);
    }

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v22 = v5;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v37;
      do
      {
        for (k = 0; k != v24; ++k)
        {
          if (*(_QWORD *)v37 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * k);
          objc_msgSend(v27, "targetContentOffset", (_QWORD)v36);
          v29 = v28;
          v31 = v30;
          objc_msgSend(v27, "environmentScrollableContainer");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "scrollableContainer");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setContentOffset:", v29, v31);

          objc_msgSend(v27, "completion");
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (v34)
          {
            objc_msgSend(v27, "completion");
            v35 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            v35[2](v35, 1);

          }
          -[_UIFocusDisplayLinkScrollAnimator _removeEntry:](self, "_removeEntry:", v27);
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
      }
      while (v24);
    }

    -[_UIFocusDisplayLinkScrollAnimator _updateHeartbeatConfiguration](self, "_updateHeartbeatConfiguration");
  }
}

- (void)_removeEntry:(id)a3
{
  _UIFocusEngineScrollableContainerOffsets *v4;
  _BYTE *v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  __CFString *v13;
  NSMapTable *scrollableContainers;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  uint8_t buf[4];
  __CFString *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = (_UIFocusEngineScrollableContainerOffsets *)a3;
  v5 = (_BYTE *)qword_1ECD7DC38;
  if (!qword_1ECD7DC38)
  {
    v5 = (_BYTE *)(__UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16);
    atomic_store((unint64_t)v5, (unint64_t *)&qword_1ECD7DC38);
  }
  if ((*v5 & 1) == 0)
  {
    v6 = qword_1ECD7DC48;
    if (!qword_1ECD7DC48)
    {
      v6 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&qword_1ECD7DC48);
    }
    v7 = *(id *)(v6 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[_UIFocusEngineScrollableContainerOffsets environmentScrollableContainer](v4, "environmentScrollableContainer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "owningEnvironment");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)MEMORY[0x1E0CB3940];
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@: %p>"), v12, v9);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v13 = CFSTR("(nil)");
      }
      *(_DWORD *)buf = 138412290;
      v28 = v13;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "Removing focus scroll animator entry for environment %@", buf, 0xCu);

    }
LABEL_11:

    goto LABEL_12;
  }
  v17 = qword_1ECD7DC40;
  if (!qword_1ECD7DC40)
  {
    v17 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v17, (unint64_t *)&qword_1ECD7DC40);
  }
  if ((*(_BYTE *)v17 & 1) != 0)
  {
    v7 = *(id *)(v17 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[_UIFocusEngineScrollableContainerOffsets environmentScrollableContainer](v4, "environmentScrollableContainer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "owningEnvironment");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v20 = (void *)MEMORY[0x1E0CB3940];
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", CFSTR("<%@: %p>"), v22, v19);
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v23 = CFSTR("(nil)");
      }
      v24 = (void *)MEMORY[0x1E0CB3978];
      v25 = v23;
      objc_msgSend(v24, "callStackSymbols");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v28 = v23;
      v29 = 2114;
      v30 = v26;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Removing focus scroll animator entry for environment %@\n%{public}@", buf, 0x16u);

    }
    goto LABEL_11;
  }
LABEL_12:
  if (self->_singleScrollableContainerEntry == v4)
  {
    self->_singleScrollableContainerEntry = 0;

  }
  scrollableContainers = self->_scrollableContainers;
  if (scrollableContainers)
  {
    -[_UIFocusEngineScrollableContainerOffsets environmentScrollableContainer](v4, "environmentScrollableContainer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scrollableContainer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable removeObjectForKey:](scrollableContainers, "removeObjectForKey:", v16);

  }
}

- (void)_processEntry:(id)a3 timeDelta:(int64_t)a4 completed:(id)a5 cancelled:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  long double v26;
  long double v27;
  long double v28;
  long double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  unint64_t v60;
  NSObject *v61;
  void *v62;
  int v63;
  double v64;
  __int16 v65;
  double v66;
  __int16 v67;
  double v68;
  __int16 v69;
  double v70;
  __int16 v71;
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "environmentScrollableContainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "owningEnvironment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  _UIFocusEnvironmentRootAncestorEnvironment(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v62 = v12;
LABEL_22:
    objc_msgSend(v62, "addObject:", v10);
    goto LABEL_25;
  }
  objc_msgSend(v10, "lastContentOffset");
  v17 = v16;
  v19 = v18;
  objc_msgSend(v10, "targetContentOffset");
  v21 = v20;
  v23 = v22;
  v24 = vabdd_f64(v19, v22);
  if (vabdd_f64(v17, v20) < 0.5 && v24 < 0.5)
  {
    v62 = v11;
    goto LABEL_22;
  }
  objc_msgSend(v10, "convergenceRate");
  v27 = pow(v26, (double)a4);
  v28 = v17 * v27 + v21 * (1.0 - v27);
  v29 = v19 * v27 + v23 * (1.0 - v27);
  objc_msgSend(v10, "lastVelocity");
  v31 = v30;
  v33 = v32;
  -[_UIFocusDisplayLinkScrollAnimator _applyAccelerationLimitToAcceleration:currentOffset:targetOffset:](self, "_applyAccelerationLimitToAcceleration:currentOffset:targetOffset:", (double)(v28 - v17 - v30), (double)(v29 - v19 - v32), v17, v19, v21, v23);
  v35 = v31 + v34;
  v37 = v33 + v36;
  -[_UIFocusDisplayLinkScrollAnimator _hyperJumpContentOffsetIfNecessaryForEntry:currentOffset:](self, "_hyperJumpContentOffsetIfNecessaryForEntry:currentOffset:", v10, v17, v19);
  v39 = v38 + v35;
  v41 = v40 + v37;
  objc_msgSend(v10, "environmentScrollableContainer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "scrollableContainer");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v43, "contentOffset");
  v45 = v44;
  v47 = v46;
  objc_msgSend(v10, "lastRoundedOffset");
  v49 = v45 - v48;
  v51 = v47 - v50;
  if ((v49 != *MEMORY[0x1E0C9D538] || v51 != *(double *)(MEMORY[0x1E0C9D538] + 8))
    && objc_msgSend(v10, "adjustsTargetsOnContentOffsetChanges"))
  {
    v39 = v39 + v49;
    v41 = v41 + v51;
    objc_msgSend(v10, "targetContentOffset");
    objc_msgSend(v10, "setTargetContentOffset:", v49 + v52, v51 + v53);
  }
  +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "_currentScreenScale");
  v56 = UIPointRoundToScale(v39, v41, v55);
  v58 = v57;

  if (fabs(v39) == INFINITY
    || fabs(v41) == INFINITY
    || fabs(v56) == INFINITY
    || (v59 = fabs(v58), v59 >= INFINITY) && v59 <= INFINITY)
  {
    v60 = _processEntry_timeDelta_completed_cancelled____s_category;
    if (!_processEntry_timeDelta_completed_cancelled____s_category)
    {
      v60 = __UILogCategoryGetNode("FocusScroll", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v60, (unint64_t *)&_processEntry_timeDelta_completed_cancelled____s_category);
    }
    v61 = *(NSObject **)(v60 + 8);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      v63 = 134219010;
      v64 = v39;
      v65 = 2048;
      v66 = v41;
      v67 = 2048;
      v68 = v56;
      v69 = 2048;
      v70 = v58;
      v71 = 2112;
      v72 = v43;
      _os_log_impl(&dword_185066000, v61, OS_LOG_TYPE_ERROR, "Focus entry attempted to scroll container to non-finite location: (%g, %g) rounded to (%g, %g) in container %@", (uint8_t *)&v63, 0x34u);
    }
    objc_msgSend(v11, "addObject:", v10);
  }
  else
  {
    objc_msgSend(v10, "setLastContentOffset:", v39, v41);
    objc_msgSend(v10, "setLastRoundedOffset:", v56, v58);
    objc_msgSend(v43, "setContentOffset:", v56, v58);
    objc_msgSend(v10, "setLastVelocity:", v35, v37);
  }

LABEL_25:
}

- (CGPoint)_applyAccelerationLimitToAcceleration:(CGPoint)a3 currentOffset:(CGPoint)a4 targetOffset:(CGPoint)a5
{
  double y;
  double x;
  double v7;
  double v8;
  int v9;
  int8x16_t v10;
  int8x16_t v11;
  int8x16_t v12;
  double v13;
  double v14;
  float64x2_t v15;
  int8x16_t v16;
  BOOL v17;
  double v18;
  double v19;
  double v20;
  int8x16_t v22;
  CGPoint result;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  v22 = *(int8x16_t *)&a3.y;
  v9 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_FocusScrollAccelerationLimit, (uint64_t)CFSTR("FocusScrollAccelerationLimit"));
  v13 = a3.x;
  if (v9)
    v14 = 10.0;
  else
    v14 = *(double *)&qword_1EDDA80B0;
  *(double *)v11.i64 = x - v8;
  v10.i64[0] = 1.0;
  v15.f64[0] = NAN;
  v15.f64[1] = NAN;
  v16 = (int8x16_t)vnegq_f64(v15);
  v17 = *(double *)vbslq_s8(v16, v10, (int8x16_t)a3).i64 == *(double *)vbslq_s8(v16, v10, v11).i64;
  v18 = -v14;
  if (v17)
  {
    if (a3.x <= v18)
      v19 = -v14;
    else
      v19 = a3.x;
    if (v14 <= v19)
      v13 = v14;
    else
      v13 = v19;
  }
  v20 = *(double *)v22.i64;
  *(double *)v12.i64 = y - v7;
  if (*(double *)vbslq_s8(v16, v10, v22).i64 == *(double *)vbslq_s8(v16, v10, v12).i64)
  {
    if (*(double *)v22.i64 <= v18)
      v20 = -v14;
    if (v14 <= v20)
      v20 = v14;
  }
  result.y = v20;
  result.x = v13;
  return result;
}

- (CGPoint)_hyperJumpContentOffsetIfNecessaryForEntry:(id)a3 currentOffset:(CGPoint)a4
{
  double y;
  double x;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  int8x16_t v21;
  int8x16_t v22;
  double v23;
  int8x16_t v24;
  BOOL v25;
  float64x2_t v26;
  int8x16_t v27;
  double v28;
  BOOL v29;
  double v30;
  double v31;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v6 = a3;
  if (_UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_FocusScrollPageLimit, (uint64_t)CFSTR("FocusScrollPageLimit")))v7 = 2.0;
  else
    v7 = *(double *)&qword_1EDDA80C0;
  objc_msgSend(v6, "startContentOffset");
  v31 = v8;
  v10 = v9;
  objc_msgSend(v6, "targetContentOffset");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v6, "environmentScrollableContainer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "scrollableContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "visibleSize");
  v18 = v17;
  v20 = v19;

  *(double *)v22.i64 = v14 - y;
  v23 = fabs(v12 - x);
  *(double *)v24.i64 = v7 * v18;
  v25 = vabdd_f64(x, v31) < v18 || v23 < *(double *)v24.i64;
  v26.f64[0] = NAN;
  v26.f64[1] = NAN;
  v27 = (int8x16_t)vnegq_f64(v26);
  *(double *)v21.i64 = v12 - x;
  *(double *)v21.i64 = v12 - *(double *)vbslq_s8(v27, v24, v21).i64;
  if (v25)
    *(double *)v21.i64 = x;
  v28 = fabs(*(double *)v22.i64);
  *(double *)v24.i64 = v7 * v20;
  v29 = fabs(y - v10) < v20 || v28 < *(double *)v24.i64;
  v30 = v14 - *(double *)vbslq_s8(v27, v24, v22).i64;
  if (v29)
    v30 = y;
  result.x = *(double *)v21.i64;
  result.y = v30;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_scrollableContainers, 0);
  objc_storeStrong((id *)&self->_singleScrollableContainerEntry, 0);
  objc_storeStrong((id *)&self->_screen, 0);
}

@end
