@implementation SBSearchPresenter

- (int64_t)presentationState
{
  return self->_presentationState;
}

- (BOOL)isPresenting
{
  return (unint64_t)(self->_presentationState - 1) < 2;
}

- (SBHSearchInteractivePresentationMetrics)interactivePresentationMetrics
{
  double interactiveTransitionStartOffset;
  double interactiveTransitionDistance;
  double interactiveTransitionBeganFromTopLeeway;
  double interactiveActivationThreshold;
  SBHSearchInteractivePresentationMetrics result;

  interactiveTransitionStartOffset = self->_interactivePresentationMetrics.interactiveTransitionStartOffset;
  interactiveTransitionDistance = self->_interactivePresentationMetrics.interactiveTransitionDistance;
  interactiveTransitionBeganFromTopLeeway = self->_interactivePresentationMetrics.interactiveTransitionBeganFromTopLeeway;
  interactiveActivationThreshold = self->_interactivePresentationMetrics.interactiveActivationThreshold;
  result.interactiveActivationThreshold = interactiveActivationThreshold;
  result.interactiveTransitionBeganFromTopLeeway = interactiveTransitionBeganFromTopLeeway;
  result.interactiveTransitionDistance = interactiveTransitionDistance;
  result.interactiveTransitionStartOffset = interactiveTransitionStartOffset;
  return result;
}

- (SBSearchPresenter)initWithSettings:(id)a3 identifier:(id)a4
{
  id v7;
  id v8;
  SBSearchPresenter *v9;
  uint64_t v10;
  NSString *identifier;
  uint64_t v12;
  NSHashTable *observers;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SBSearchPresenter;
  v9 = -[SBSearchPresenter init](&v15, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v12 = objc_claimAutoreleasedReturnValue();
    observers = v9->_observers;
    v9->_observers = (NSHashTable *)v12;

    objc_storeStrong((id *)&v9->_pullToSearchSettings, a3);
    -[SBHHomePullToSearchSettings addKeyObserver:](v9->_pullToSearchSettings, "addKeyObserver:", v9);
    -[SBSearchPresenter _setUpSearchAnimationSettings](v9, "_setUpSearchAnimationSettings");
    -[SBSearchPresenter _setUpInteractivePresentationMetrics](v9, "_setUpInteractivePresentationMetrics");
  }

  return v9;
}

- (void)presentSearchAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  UIScrollView *trackingScrollView;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[4];
  id v17;
  SBSearchPresenter *v18;
  _BYTE v19[128];
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  if (-[SBSearchPresenter _canPresent](self, "_canPresent"))
  {
    -[SBSearchPresenter _willPresentSearchAnimated:](self, "_willPresentSearchAnimated:", v3);
    -[SBSearchPresenter _noteWillBeginModifyingPresentationProgressForState:animated:](self, "_noteWillBeginModifyingPresentationProgressForState:animated:", 2, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_presentationState = 2;
    self->_presentationVelocity = 0.0;
    trackingScrollView = self->_trackingScrollView;
    if (trackingScrollView)
      -[UIScrollView _forcePanGestureToEndImmediately](trackingScrollView, "_forcePanGestureToEndImmediately");
    if (v3)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __43__SBSearchPresenter_presentSearchAnimated___block_invoke;
      v16[3] = &unk_1E8E9DEB0;
      v17 = v5;
      v18 = self;
      -[SBSearchPresenter _updatePresentablesWithMode:withCompletion:](self, "_updatePresentablesWithMode:withCompletion:", 3, v16);

    }
    else
    {
      -[SBSearchPresenter _updatePresentablesWithMode:withCompletion:](self, "_updatePresentablesWithMode:withCompletion:", 4, 0);
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v7 = v5;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v19, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v13;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v13 != v10)
              objc_enumerationMutation(v7);
            (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11) + 16))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11));
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v19, 16);
        }
        while (v9);
      }

      -[SBSearchPresenter _didPresentSearch](self, "_didPresentSearch", (_QWORD)v12);
    }

  }
}

_QWORD *__43__SBSearchPresenter_presentSearchAnimated___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *result;
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
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6) + 16))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  result = *(_QWORD **)(a1 + 40);
  if (result[8] == 2)
    return (_QWORD *)objc_msgSend(result, "_didPresentSearch", (_QWORD)v8);
  return result;
}

- (void)dismissSearchAnimated:(BOOL)a3
{
  _BOOL8 v3;
  int64_t presentationState;
  void *v6;
  UIScrollView *trackingScrollView;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[4];
  id v18;
  SBSearchPresenter *v19;
  _BYTE v20[128];
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  presentationState = self->_presentationState;
  -[SBSearchPresenter _willDismissSearchAnimated:](self, "_willDismissSearchAnimated:");
  self->_presentationVelocity = 0.0;
  self->_presentationState = presentationState;
  -[SBSearchPresenter _noteWillBeginModifyingPresentationProgressForState:animated:](self, "_noteWillBeginModifyingPresentationProgressForState:animated:", 0, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_presentationState = 0;
  trackingScrollView = self->_trackingScrollView;
  if (trackingScrollView)
    -[UIScrollView _forcePanGestureToEndImmediately](trackingScrollView, "_forcePanGestureToEndImmediately");
  if (v3)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __43__SBSearchPresenter_dismissSearchAnimated___block_invoke;
    v17[3] = &unk_1E8E9DEB0;
    v18 = v6;
    v19 = self;
    -[SBSearchPresenter _updatePresentablesWithMode:withCompletion:](self, "_updatePresentablesWithMode:withCompletion:", 3, v17);

  }
  else
  {
    -[SBSearchPresenter _updatePresentablesWithMode:withCompletion:](self, "_updatePresentablesWithMode:withCompletion:", 4, 0);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v20, 16);
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
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12) + 16))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12));
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v20, 16);
      }
      while (v10);
    }

    -[SBSearchPresenter _didDismissSearch](self, "_didDismissSearch", (_QWORD)v13);
  }

}

_QWORD *__43__SBSearchPresenter_dismissSearchAnimated___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *result;
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
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6) + 16))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  result = *(_QWORD **)(a1 + 40);
  if (!result[8])
    return (_QWORD *)objc_msgSend(result, "_didDismissSearch", (_QWORD)v8);
  return result;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  NSString *identifier;
  int v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  int v23;
  void *v24;
  __int16 v25;
  NSString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SBLogSpotlight();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    identifier = self->_identifier;
    v23 = 138412546;
    v24 = v7;
    v25 = 2112;
    v26 = identifier;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%@ identifier: %@", (uint8_t *)&v23, 0x16u);

  }
  v9 = -[SBSearchPresenter _canPresent](self, "_canPresent");
  if (v9)
  {
    objc_storeStrong((id *)&self->_trackingScrollView, a3);
    objc_msgSend(v5, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)(objc_msgSend(v10, "interfaceOrientation") - 1) > 1)
    {

    }
    else
    {
      +[SBReachabilityDomain rootSettings](SBReachabilityDomain, "rootSettings");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "homeGestureSwipeDownHeight");
      v13 = v12;

      objc_msgSend(v5, "panGestureRecognizer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "locationInView:", v5);
      v16 = v15;
      v18 = v17;

      objc_msgSend(v5, "convertPoint:toView:", 0, v16, v18);
      v20 = v19;
      objc_msgSend(v10, "size");
      v22 = v21 - v13;

      if (v20 > v22)
      {
        LOBYTE(v9) = 0;
        goto LABEL_9;
      }
    }
    objc_msgSend(v5, "contentOffset");
    LOBYTE(v9) = BSFloatLessThanOrEqualToFloat();
  }
LABEL_9:
  self->_scrollViewBeganScrollingFromTop = v9;

}

- (void)scrollViewDidScroll:(id)a3
{
  NSObject *v4;
  void *v5;
  NSString *identifier;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSString *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  NSString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "contentOffset");
  -[SBSearchPresenter _rubberbandingOffsetForContentOffset:](self, "_rubberbandingOffsetForContentOffset:");
  if (self->_scrollViewBeganScrollingFromTop && BSFloatGreaterThanFloat() && !self->_presentationState)
  {
    SBLogSpotlight();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      _SBFLoggingMethodProem();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      identifier = self->_identifier;
      v13 = 138412546;
      v14 = v5;
      v15 = 2112;
      v16 = identifier;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%@ identifier: %@ starting new interactive transition", (uint8_t *)&v13, 0x16u);

    }
    self->_presentationVelocity = 0.0;
    -[SBSearchPresenter _willPresentSearchAnimated:](self, "_willPresentSearchAnimated:", 1);
    -[SBSearchPresenter _noteWillBeginModifyingPresentationProgressForState:animated:](self, "_noteWillBeginModifyingPresentationProgressForState:animated:", 1, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSearchPresenter interactionCompletions](self, "interactionCompletions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      SBLogSpotlight();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        _SBFLoggingMethodProem();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = self->_identifier;
        v13 = 138412546;
        v14 = v10;
        v15 = 2112;
        v16 = v11;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "%@ identifier: %@ had previous interactive transition completions", (uint8_t *)&v13, 0x16u);

      }
      objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v8);
      v12 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v12;
    }
    -[SBSearchPresenter setInteractionCompletions:](self, "setInteractionCompletions:", v7);
    self->_presentationState = 1;

  }
  if (self->_presentationState == 1)
  {
    self->_presentationVelocity = 0.0;
    -[SBSearchPresenter _updatePresentablesWithMode:withCompletion:](self, "_updatePresentablesWithMode:withCompletion:", 5, 0);
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4
{
  double y;
  id v6;
  int64_t presentationState;
  NSObject *v8;
  void *v9;
  NSString *identifier;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int v22;
  char v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  UIScrollView *trackingScrollView;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  SBSearchPresenter *v36;
  char v37;
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  _BOOL4 v42;
  __int16 v43;
  NSString *v44;
  uint64_t v45;

  y = a4.y;
  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  self->_scrollViewBeganScrollingFromTop = 0;
  presentationState = self->_presentationState;
  SBLogSpotlight();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    identifier = self->_identifier;
    *(_DWORD *)buf = 138412802;
    v40 = v9;
    v41 = 1024;
    v42 = presentationState == 1;
    v43 = 2112;
    v44 = identifier;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "%@ interactive: %{BOOL}u identifier: %@", buf, 0x1Cu);

  }
  -[SBSearchPresenter interactionCompletions](self, "interactionCompletions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSearchPresenter setInteractionCompletions:](self, "setInteractionCompletions:", 0);
  if (presentationState == 1)
  {
    v12 = *MEMORY[0x1E0CEBBA0];
    objc_msgSend(v6, "contentOffset");
    v14 = v13;
    v16 = v15;
    objc_msgSend(v6, "panGestureRecognizer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "velocityInView:", v6);
    v19 = v18;
    v21 = v20;

    -[SBSearchPresenter _rubberbandingOffsetForContentOffset:](self, "_rubberbandingOffsetForContentOffset:", v14 - v12 * (v19 / 1000.0) / (1.0 - v12), v16 - v12 * (v21 / 1000.0) / (1.0 - v12));
    v22 = BSFloatGreaterThanFloat();
    v23 = v22;
    if (v22)
      self->_presentationState = 2;
    else
      -[SBSearchPresenter _willDismissSearchAnimated:](self, "_willDismissSearchAnimated:", 1);
    self->_presentationVelocity = y * -1000.0;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __60__SBSearchPresenter_scrollViewWillEndDragging_withVelocity___block_invoke_2;
    v34[3] = &unk_1E8EA8528;
    v37 = v23;
    v35 = v11;
    v36 = self;
    -[SBSearchPresenter _updatePresentablesWithMode:withCompletion:](self, "_updatePresentablesWithMode:withCompletion:", 3, v34);
    v24 = v35;
  }
  else
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v24 = v11;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v31 != v27)
            objc_enumerationMutation(v24);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v26);
    }
  }

  trackingScrollView = self->_trackingScrollView;
  self->_trackingScrollView = 0;

}

_QWORD *__60__SBSearchPresenter_scrollViewWillEndDragging_withVelocity___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *result;
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
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6) + 16))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  if (!*(_BYTE *)(a1 + 48)
    || (result = *(_QWORD **)(a1 + 40), result[8] == 2)
    && (result = (_QWORD *)objc_msgSend(result, "_didPresentSearch", (_QWORD)v8), !*(_BYTE *)(a1 + 48)))
  {
    result = *(_QWORD **)(a1 + 40);
    if (!result[8])
      return (_QWORD *)objc_msgSend(result, "_didDismissSearch");
  }
  return result;
}

- (void)layout
{
  -[SBSearchPresenter _updatePresentablesWithMode:withCompletion:](self, "_updatePresentablesWithMode:withCompletion:", 4, 0);
}

- (void)addSearchPresenterObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeSearchPresenterObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (BOOL)usesTransitionDistanceAsStartOffset
{
  return self->_usesTransitionDistanceAsStartOffset;
}

- (void)setUsesTransitionDistanceAsStartOffset:(BOOL)a3
{
  if (self->_usesTransitionDistanceAsStartOffset != a3)
  {
    self->_usesTransitionDistanceAsStartOffset = a3;
    -[SBSearchPresenter _setUpInteractivePresentationMetrics](self, "_setUpInteractivePresentationMetrics");
  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  -[SBSearchPresenter _setUpSearchAnimationSettings](self, "_setUpSearchAnimationSettings", a3, a4);
  -[SBSearchPresenter _setUpInteractivePresentationMetrics](self, "_setUpInteractivePresentationMetrics");
}

- (BOOL)_canPresent
{
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_searchPresenterDelegate);
  if (WeakRetained)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = objc_msgSend(WeakRetained, "searchPresenterCanPresent:", self);
    else
      v4 = 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_setUpSearchAnimationSettings
{
  SBFFluidBehaviorSettings *v3;
  SBFFluidBehaviorSettings *searchAnimationSettings;

  -[SBHHomePullToSearchSettings pullTransitionAnimationSettings](self->_pullToSearchSettings, "pullTransitionAnimationSettings");
  v3 = (SBFFluidBehaviorSettings *)objc_claimAutoreleasedReturnValue();
  searchAnimationSettings = self->_searchAnimationSettings;
  self->_searchAnimationSettings = v3;

}

- (void)_setUpInteractivePresentationMetrics
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[SBHHomePullToSearchSettings pullTransitionDistance](self->_pullToSearchSettings, "pullTransitionDistance");
  self->_interactivePresentationMetrics.interactiveTransitionDistance = v3;
  -[SBHHomePullToSearchSettings pullTransitionActivationThreshold](self->_pullToSearchSettings, "pullTransitionActivationThreshold");
  self->_interactivePresentationMetrics.interactiveActivationThreshold = v4;
  -[SBHHomePullToSearchSettings pullGestureBeganFromTopLeeway](self->_pullToSearchSettings, "pullGestureBeganFromTopLeeway");
  self->_interactivePresentationMetrics.interactiveTransitionBeganFromTopLeeway = v5;
  if (self->_usesTransitionDistanceAsStartOffset)
  {
    -[SBHHomePullToSearchSettings pullTransitionRubberbandThreshold](self->_pullToSearchSettings, "pullTransitionRubberbandThreshold");
    self->_interactivePresentationMetrics.interactiveTransitionStartOffset = -v6;
  }
}

- (void)_willPresentSearchAnimated:(BOOL)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  NSString *identifier;
  id WeakRetained;
  NSArray **p_presentables;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  unsigned int v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint8_t v39[128];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  NSString *v45;
  uint64_t v46;

  v3 = a3;
  v46 = *MEMORY[0x1E0C80C00];
  SBLogSpotlight();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    identifier = self->_identifier;
    *(_DWORD *)buf = 138412802;
    v41 = v6;
    v42 = 1024;
    v43 = v3;
    v44 = 2112;
    v45 = identifier;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%@ animated: %{BOOL}u identifier: %@", buf, 0x1Cu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchPresenterDelegate);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setFrameStallSkipRequest:", 1);
  p_presentables = &self->_presentables;
  if (self->_presentables)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(WeakRetained, "searchPresentablesForPresenter:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v11, "copy");

    objc_storeStrong((id *)&self->_presentables, v10);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "displayConfigurationForPresenter:", self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && v10)
    {
      v28 = v3;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v13 = v10;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v35 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v18, "setTargetDisplayConfiguration:", v12);
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        }
        while (v15);
      }

      v3 = v28;
      p_presentables = &self->_presentables;
    }
  }
  else
  {
    v12 = 0;
  }
  -[SBSearchPresenter _sendWillPresentSearchToDelegateAndObservers:](self, "_sendWillPresentSearchToDelegateAndObservers:", v3);
  if (!objc_msgSend(v10, "count"))
  {
    objc_msgSend(WeakRetained, "searchPresentablesForPresenter:", self);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copy");

    objc_storeStrong((id *)p_presentables, v20);
    v10 = v20;
  }
  if (v10)
  {
    self->_topOffset = 0.0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "searchTopOffsetForSearchPresenter:", self);
      self->_topOffset = v21;
    }
    v29 = WeakRetained;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v22 = v10;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v31 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
          objc_msgSend(v27, "setTopOffset:", self->_topOffset);
          objc_msgSend(v27, "setMaxPresentationOffset:", self->_interactivePresentationMetrics.interactiveTransitionDistance);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v27, "setSearchTransitionSettings:", self->_pullToSearchSettings);
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v24);
    }

    WeakRetained = v29;
  }

}

- (void)_sendWillPresentSearchToDelegateAndObservers:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchPresenterDelegate);
  -[SBSearchPresenter _sendWillPresentSearch:toObserver:](self, "_sendWillPresentSearch:toObserver:", v3, WeakRetained);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[SBSearchPresenter _sendWillPresentSearch:toObserver:](self, "_sendWillPresentSearch:toObserver:", v3, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_sendWillPresentSearch:(BOOL)a3 toObserver:(id)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "searchPresenterWillPresentSearch:animated:", self, v4);

}

- (void)_didPresentSearch
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
  v15 = CFSTR("SBSearchPresenter.m");
  v16 = 1024;
  v17 = 340;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

- (void)_sendDidPresentSearchToDelegateAndObservers
{
  id WeakRetained;
  void *v4;
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
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchPresenterDelegate);
  -[SBSearchPresenter _sendDidPresentSearchToObserver:](self, "_sendDidPresentSearchToObserver:", WeakRetained);

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
        -[SBSearchPresenter _sendDidPresentSearchToObserver:](self, "_sendDidPresentSearchToObserver:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_sendDidPresentSearchToObserver:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "searchPresenterDidPresentSearch:", self);

}

- (void)_willDismissSearchAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  NSString *identifier;
  int v8;
  void *v9;
  __int16 v10;
  _BOOL4 v11;
  __int16 v12;
  NSString *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  SBLogSpotlight();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    identifier = self->_identifier;
    v8 = 138412802;
    v9 = v6;
    v10 = 1024;
    v11 = v3;
    v12 = 2112;
    v13 = identifier;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%@ animated: %{BOOL}u identifier: %@", (uint8_t *)&v8, 0x1Cu);

  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "setFrameStallSkipRequest:", 1);
  -[SBSearchPresenter _sendWillDismissSearchToDelegateAndObservers:](self, "_sendWillDismissSearchToDelegateAndObservers:", v3);
  self->_presentationState = 0;
}

- (void)_sendWillDismissSearchToDelegateAndObservers:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchPresenterDelegate);
  -[SBSearchPresenter _sendWillDismissSearch:toObserver:](self, "_sendWillDismissSearch:toObserver:", v3, WeakRetained);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[SBSearchPresenter _sendWillDismissSearch:toObserver:](self, "_sendWillDismissSearch:toObserver:", v3, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_sendWillDismissSearch:(BOOL)a3 toObserver:(id)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "searchPresenterWillDismissSearch:animated:", self, v4);

}

- (void)_didDismissSearch
{
  NSObject *v3;
  void *v4;
  NSString *identifier;
  NSArray *presentables;
  int v7;
  void *v8;
  __int16 v9;
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  SBLogSpotlight();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    identifier = self->_identifier;
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = identifier;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "%@ identifier %@", (uint8_t *)&v7, 0x16u);

  }
  presentables = self->_presentables;
  self->_presentables = 0;

  -[SBSearchPresenter _sendDidDismissSearchToDelegateAndObservers](self, "_sendDidDismissSearchToDelegateAndObservers");
}

- (void)_sendDidDismissSearchToDelegateAndObservers
{
  id WeakRetained;
  void *v4;
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
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchPresenterDelegate);
  -[SBSearchPresenter _sendDidDismissSearchToObserver:](self, "_sendDidDismissSearchToObserver:", WeakRetained);

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
        -[SBSearchPresenter _sendDidDismissSearchToObserver:](self, "_sendDidDismissSearchToObserver:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_sendDidDismissSearchToObserver:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "searchPresenterDidDismissSearch:", self);

}

- (id)_noteWillBeginModifyingPresentationProgressForState:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SBSearchPresenter *v18;
  NSArray *obj;
  id v20;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v18 = self;
  obj = self->_presentables;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v21 = 0;
        objc_msgSend(v12, "willBeginModifyingPresentationProgressForState:animated:needsInitialLayout:", a3, v4, &v21, v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          v15 = (void *)objc_msgSend(v13, "copy");
          v16 = (void *)MEMORY[0x1D17E5550]();
          objc_msgSend(v20, "addObject:", v16);

        }
        if (v21)
          objc_msgSend(v7, "addObject:", v12);

      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v7, "count"))
    -[SBSearchPresenter _updatePresentables:withMode:withCompletion:](v18, "_updatePresentables:withMode:withCompletion:", v7, 2, 0);

  return v20;
}

- (double)_rubberbandingOffsetForContentOffset:(CGPoint)a3
{
  double interactiveTransitionStartOffset;
  CGFloat v4;
  double result;

  interactiveTransitionStartOffset = self->_interactivePresentationMetrics.interactiveTransitionStartOffset;
  v4 = -interactiveTransitionStartOffset;
  result = -(a3.y + interactiveTransitionStartOffset);
  if (a3.y >= v4)
    return 0.0;
  return result;
}

- (double)_searchPresentationProgressForOffset:(double)a3
{
  return fmin(fmax(a3 / self->_interactivePresentationMetrics.interactiveTransitionDistance + 0.0, 0.0), 1.0);
}

- (void)_updatePresentablesWithMode:(int64_t)a3 withCompletion:(id)a4
{
  -[SBSearchPresenter _updatePresentables:withMode:withCompletion:](self, "_updatePresentables:withMode:withCompletion:", self->_presentables, a3, a4);
}

- (void)_updatePresentables:(id)a3 withMode:(int64_t)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  SBFFluidBehaviorSettings *searchAnimationSettings;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  id v17;
  int64_t v18;

  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0CEABB0];
  searchAnimationSettings = self->_searchAnimationSettings;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65__SBSearchPresenter__updatePresentables_withMode_withCompletion___block_invoke;
  v16[3] = &unk_1E8EA0AF0;
  v16[4] = self;
  v17 = v8;
  v18 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__SBSearchPresenter__updatePresentables_withMode_withCompletion___block_invoke_2;
  v14[3] = &unk_1E8EA4988;
  v15 = v9;
  v12 = v9;
  v13 = v8;
  objc_msgSend(v10, "sb_animateWithSettings:mode:animations:completion:", searchAnimationSettings, a4, v16, v14);

}

uint64_t __65__SBSearchPresenter__updatePresentables_withMode_withCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePresentables:withMode:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __65__SBSearchPresenter__updatePresentables_withMode_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_updatePresentables:(id)a3 withMode:(int64_t)a4
{
  id v6;
  int64_t presentationState;
  double v8;
  double v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  char v17;
  double presentationProgress;
  double presentationOffset;
  double presentationVelocity;
  int64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  presentationState = self->_presentationState;
  if (presentationState)
  {
    if (presentationState == 2)
    {
      *(_OWORD *)&self->_presentationProgress = xmmword_1D0E891A0;
    }
    else if (presentationState == 1)
    {
      -[UIScrollView contentOffset](self->_trackingScrollView, "contentOffset");
      -[SBSearchPresenter _rubberbandingOffsetForContentOffset:](self, "_rubberbandingOffsetForContentOffset:");
      self->_presentationOffset = v8;
      -[SBSearchPresenter _searchPresentationProgressForOffset:](self, "_searchPresentationProgressForOffset:");
      self->_presentationProgress = v9;
    }
  }
  else
  {
    self->_presentationProgress = 0.0;
    self->_presentationOffset = 0.0;
  }
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __50__SBSearchPresenter__updatePresentables_withMode___block_invoke;
  v26[3] = &__block_descriptor_40_e43_v24__0__SBFFluidBehaviorSettings_8___v___16l;
  v26[4] = a4;
  v10 = (void *)MEMORY[0x1D17E5550](v26);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v17 = objc_opt_respondsToSelector();
        presentationProgress = self->_presentationProgress;
        presentationOffset = self->_presentationOffset;
        presentationVelocity = self->_presentationVelocity;
        v21 = self->_presentationState;
        if ((v17 & 1) != 0)
          objc_msgSend(v16, "updatePresentationProgress:withOffset:velocity:presentationState:applyBlock:", v21, v10, presentationProgress, presentationOffset, presentationVelocity);
        else
          objc_msgSend(v16, "updatePresentationProgress:withOffset:velocity:presentationState:", v21, presentationProgress, presentationOffset, presentationVelocity, (_QWORD)v22);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v13);
  }

}

uint64_t __50__SBSearchPresenter__updatePresentables_withMode___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(MEMORY[0x1E0CEABB0], "sb_animateWithSettings:mode:animations:completion:", a2, *(_QWORD *)(a1 + 32), a3, 0);
}

- (SBSearchPresenterDelegate)searchPresenterDelegate
{
  return (SBSearchPresenterDelegate *)objc_loadWeakRetained((id *)&self->_searchPresenterDelegate);
}

- (void)setSearchPresenterDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_searchPresenterDelegate, a3);
}

- (void)setInteractivePresentationMetrics:(SBHSearchInteractivePresentationMetrics)a3
{
  self->_interactivePresentationMetrics = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (UIScrollView)trackingScrollView
{
  return self->_trackingScrollView;
}

- (void)setTrackingScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_trackingScrollView, a3);
}

- (SBHHomePullToSearchSettings)pullToSearchSettings
{
  return self->_pullToSearchSettings;
}

- (void)setPullToSearchSettings:(id)a3
{
  objc_storeStrong((id *)&self->_pullToSearchSettings, a3);
}

- (SBFFluidBehaviorSettings)searchAnimationSettings
{
  return self->_searchAnimationSettings;
}

- (void)setSearchAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_searchAnimationSettings, a3);
}

- (void)setPresentationState:(int64_t)a3
{
  self->_presentationState = a3;
}

- (double)presentationProgress
{
  return self->_presentationProgress;
}

- (void)setPresentationProgress:(double)a3
{
  self->_presentationProgress = a3;
}

- (double)presentationOffset
{
  return self->_presentationOffset;
}

- (void)setPresentationOffset:(double)a3
{
  self->_presentationOffset = a3;
}

- (double)presentationVelocity
{
  return self->_presentationVelocity;
}

- (void)setPresentationVelocity:(double)a3
{
  self->_presentationVelocity = a3;
}

- (BOOL)scrollViewBeganScrollingFromTop
{
  return self->_scrollViewBeganScrollingFromTop;
}

- (void)setScrollViewBeganScrollingFromTop:(BOOL)a3
{
  self->_scrollViewBeganScrollingFromTop = a3;
}

- (double)topOffset
{
  return self->_topOffset;
}

- (void)setTopOffset:(double)a3
{
  self->_topOffset = a3;
}

- (NSArray)presentables
{
  return self->_presentables;
}

- (void)setPresentables:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSArray)interactionCompletions
{
  return self->_interactionCompletions;
}

- (void)setInteractionCompletions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionCompletions, 0);
  objc_storeStrong((id *)&self->_presentables, 0);
  objc_storeStrong((id *)&self->_searchAnimationSettings, 0);
  objc_storeStrong((id *)&self->_pullToSearchSettings, 0);
  objc_storeStrong((id *)&self->_trackingScrollView, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_searchPresenterDelegate);
}

@end
