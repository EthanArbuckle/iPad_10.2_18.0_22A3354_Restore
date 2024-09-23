@implementation _UIClickPresentationInteraction

- (BOOL)clickDriver:(id)a3 shouldBeDelayedByGestureRecognizer:(id)a4
{
  _UIClickPresentationInteraction *v4;
  id v5;
  void *v6;

  if (!self->_delegateImplements.shouldBeDelayedByGestureRecognizer)
    return 0;
  v4 = self;
  v5 = a4;
  -[_UIClickPresentationInteraction delegate](v4, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "_clickPresentationInteraction:shouldBeDelayedByGestureRecognizer:", v4, v5);

  return (char)v4;
}

- (_UIClickPresentationInteractionDelegate)delegate
{
  return (_UIClickPresentationInteractionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)clickDriver:(id)a3 shouldDelayGestureRecognizer:(id)a4
{
  id v4;
  BOOL v5;

  v4 = a4;
  if (objc_msgSend(v4, "_isGestureType:", 8))
    v5 = objc_msgSend(v4, "state") < 1;
  else
    v5 = 0;

  return v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  _UIRelationshipGestureRecognizer *v6;
  id v7;
  _UIRelationshipGestureRecognizer *v8;
  _UIRelationshipGestureRecognizer *v9;
  char isKindOfClass;

  v6 = (_UIRelationshipGestureRecognizer *)a3;
  v7 = a4;
  -[_UIClickPresentationInteraction exclusionRelationshipGestureRecognizer](self, "exclusionRelationshipGestureRecognizer");
  v8 = (_UIRelationshipGestureRecognizer *)objc_claimAutoreleasedReturnValue();

  if (v8 != v6)
  {
    -[_UIClickPresentationInteraction failureRelationshipGestureRecognizer](self, "failureRelationshipGestureRecognizer");
    v9 = (_UIRelationshipGestureRecognizer *)objc_claimAutoreleasedReturnValue();

    if (v9 != v6)
    {
      isKindOfClass = self->_gestureRecognizerForBeginningDragRelationships == v6;
      goto LABEL_11;
    }
LABEL_8:
    isKindOfClass = 1;
    goto LABEL_11;
  }
  if (!objc_msgSend(v7, "_isGestureType:", 1))
  {
    if (!-[_UIClickPresentationInteraction _isControlledByCC](self, "_isControlledByCC"))
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  if ((objc_msgSend(v7, "_isGestureType:", 3) & 1) != 0)
    isKindOfClass = 0;
  else
    isKindOfClass = objc_msgSend(v7, "_prefersToBeExclusiveWithCompetingLongPressGestureRecognizers") ^ 1;
LABEL_11:

  return isKindOfClass & 1;
}

- (BOOL)_isControlledByCC
{
  void *v3;
  char isKindOfClass;
  void *v5;

  if (objc_msgSend((id)UIApp, "_isSpringBoard"))
  {
    -[_UIClickPresentationInteraction delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("CCUIContentModuleContainerViewController"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      isKindOfClass = 1;
    }
    else
    {
      -[_UIClickPresentationInteraction delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      NSClassFromString(CFSTR("CCUIContentModuleDetailClickPresentationInteractionManager"));
      isKindOfClass = objc_opt_isKindOfClass();

    }
  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (void)cancelInteraction
{
  -[_UIClickPresentationInteraction _cancelWithReason:alongsideActions:completion:](self, "_cancelWithReason:alongsideActions:completion:", 1, 0, 0);
}

- (void)_gestureRecognizerFailed:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  -[_UIClickPresentationInteraction exclusionRelationshipGestureRecognizer](self, "exclusionRelationshipGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    if (-[_UIClickPresentationInteraction _isActive](self, "_isActive"))
      -[_UIClickPresentationInteraction _cancelAllDrivers](self, "_cancelAllDrivers");
    -[_UIClickPresentationInteraction failureRelationshipGestureRecognizer](self, "failureRelationshipGestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_fail");

    -[_UIRelationshipGestureRecognizer _fail](self->_gestureRecognizerForBeginningDragRelationships, "_fail");
  }
}

- (_UIClickPresentationInteraction)initWithDelegate:(id)a3
{
  id v4;
  _UIClickPresentationInteraction *v5;
  _UIClickPresentationInteraction *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIClickPresentationInteraction;
  v5 = -[_UIClickPresentationInteraction init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[_UIClickPresentationInteraction _setDelegate:](v5, "_setDelegate:", v4);
    -[_UIClickPresentationInteraction setInitialLocation:](v6, "setInitialLocation:", 1.79769313e308, 1.79769313e308, 1.79769313e308);
    -[_UIClickPresentationInteraction setFallbackDriverStyle:](v6, "setFallbackDriverStyle:", 0);
  }

  return v6;
}

- (void)setInitialLocation:(CAPoint3D)a3
{
  self->_initialLocation = a3;
}

- (void)_setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateImplements.shouldBegin = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.previewForHighlightingAtLocation = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.shouldPresent = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.ended = objc_opt_respondsToSelector() & 1;
    if (objc_msgSend((id)UIApp, "_isSpringBoard"))
      self->_delegateImplements.activationStyle = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.asyncShouldBegin = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.shouldAllowRapidRestart = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.shouldAssociateWithDrag = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.shouldAllowDragAfterDismiss = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.liveDragPreviewForPresentation = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.previewForCancellingDragItem = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.willAnimateDragCancelWithAnimator = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.dragSessionDidEndForItems = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.interactionEffectForTargetedPreview = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.endedForPresentation = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.shouldPlayFeedback = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.shouldPresentWithCompletion = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.shouldBeDelayedByGestureRecognizer = objc_opt_respondsToSelector() & 1;
    -[_UIClickPresentationInteraction delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_delegateImplements.secondaryPreviews = objc_opt_respondsToSelector() & 1;

    -[_UIClickPresentationInteraction delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self->_delegateImplements.shouldMaintainKeyboardAssertion = objc_opt_respondsToSelector() & 1;

    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = obj;
    if (v8)
      self->_currentState = 1;
  }

}

- (void)setPresentationTypeDebugString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void)setDebugIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void)setOverrideDrivers:(id)a3
{
  id v5;
  NSArray *overrideDrivers;
  NSArray *v7;
  char v8;
  NSArray *v9;

  v5 = a3;
  overrideDrivers = self->_overrideDrivers;
  v9 = (NSArray *)v5;
  v7 = overrideDrivers;
  if (v7 == v9)
  {

  }
  else
  {
    if (v9 && v7)
    {
      v8 = -[NSArray isEqual:](v9, "isEqual:", v7);

      if ((v8 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_overrideDrivers, a3);
    -[_UIClickPresentationInteraction _refreshAllDrivers](self, "_refreshAllDrivers");
  }
LABEL_9:

}

- (void)didMoveToView:(id)a3
{
  UIView **p_view;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _UIClickPresentationFeedbackGenerator *v19;
  void *v20;
  id v21;
  _UIClickPresentationFeedbackGenerator *v22;

  p_view = &self->_view;
  v5 = objc_storeWeak((id *)&self->_view, a3);
  if (a3)
  {
    -[_UIClickPresentationInteraction _refreshAllDrivers](self, "_refreshAllDrivers");
    -[_UIClickPresentationInteraction exclusionRelationshipGestureRecognizer](self, "exclusionRelationshipGestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = (void *)objc_opt_new();
      objc_msgSend(v7, "setName:", CFSTR("com.apple.UIKit.clickPresentationExclusion"));
      objc_msgSend(v7, "setDelegate:", self);
      -[_UIClickPresentationInteraction setExclusionRelationshipGestureRecognizer:](self, "setExclusionRelationshipGestureRecognizer:", v7);

    }
    -[_UIClickPresentationInteraction failureRelationshipGestureRecognizer](self, "failureRelationshipGestureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = (void *)objc_opt_new();
      objc_msgSend(v9, "setName:", CFSTR("com.apple.UIKit.clickPresentationFailure"));
      objc_msgSend(v9, "setDelegate:", self);
      -[_UIClickPresentationInteraction setFailureRelationshipGestureRecognizer:](self, "setFailureRelationshipGestureRecognizer:", v9);

    }
    WeakRetained = objc_loadWeakRetained((id *)p_view);
    -[_UIClickPresentationInteraction exclusionRelationshipGestureRecognizer](self, "exclusionRelationshipGestureRecognizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "addGestureRecognizer:", v11);

    v12 = objc_loadWeakRetained((id *)p_view);
    -[_UIClickPresentationInteraction failureRelationshipGestureRecognizer](self, "failureRelationshipGestureRecognizer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addGestureRecognizer:", v13);

    if (self->_gestureRecognizerForBeginningDragRelationships)
    {
      v14 = objc_loadWeakRetained((id *)p_view);
      -[_UIClickPresentationInteraction gestureRecognizerForBeginningDragRelationships](self, "gestureRecognizerForBeginningDragRelationships");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addGestureRecognizer:", v15);

    }
    _UIContextMenuRegisterDefaultPlatformMetricsIfNecessary();
    v16 = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(v16, "traitCollection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _UIContextMenuGetPlatformMetrics(objc_msgSend(v17, "userInterfaceIdiom"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = [_UIClickPresentationFeedbackGenerator alloc];
    objc_msgSend(v18, "presentationFeedbackConfiguration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_loadWeakRetained((id *)p_view);
    v22 = -[_UIClickPresentationFeedbackGenerator initWithConfiguration:view:](v19, "initWithConfiguration:view:", v20, v21);
    -[_UIClickPresentationInteraction setFeedbackGenerator:](self, "setFeedbackGenerator:", v22);

  }
}

- (void)willMoveToView:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[_UIClickPresentationInteraction allDrivers](self, "allDrivers", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "setView:", 0);
        objc_msgSend(v9, "setDelegate:", 0);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  -[_UIClickPresentationInteraction exclusionRelationshipGestureRecognizer](self, "exclusionRelationshipGestureRecognizer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIClickPresentationInteraction exclusionRelationshipGestureRecognizer](self, "exclusionRelationshipGestureRecognizer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeGestureRecognizer:", v12);

  -[_UIClickPresentationInteraction failureRelationshipGestureRecognizer](self, "failureRelationshipGestureRecognizer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIClickPresentationInteraction failureRelationshipGestureRecognizer](self, "failureRelationshipGestureRecognizer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeGestureRecognizer:", v15);

  -[_UIClickPresentationInteraction setFeedbackGenerator:](self, "setFeedbackGenerator:", 0);
  -[_UIClickPresentationInteraction setAssociatedDragInteraction:](self, "setAssociatedDragInteraction:", 0);
  objc_storeWeak((id *)&self->_view, 0);
}

- (_UIRelationshipGestureRecognizer)exclusionRelationshipGestureRecognizer
{
  return self->_exclusionRelationshipGestureRecognizer;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _BOOL4 v10;
  void *v12;
  char v13;

  v6 = a3;
  v7 = a4;
  -[_UIClickPresentationInteraction failureRelationshipGestureRecognizer](self, "failureRelationshipGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v6 && objc_msgSend(v7, "_isGestureType:", 1))
  {
    -[_UIClickPresentationInteraction allDrivers](self, "allDrivers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count")
      && !objc_msgSend(v7, "_prefersNotToBePreventedByCompetingLongPressGestureRecognizers"))
    {
      objc_msgSend(v7, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("PKSelectionDragGesture"));

      if ((v13 & 1) == 0)
      {
        v10 = !-[_UIClickPresentationInteraction allowSimultaneousRecognition](self, "allowSimultaneousRecognition");
        goto LABEL_8;
      }
    }
    else
    {

    }
  }
  else
  {

  }
  LOBYTE(v10) = 0;
LABEL_8:

  return v10;
}

- (_UIRelationshipGestureRecognizer)failureRelationshipGestureRecognizer
{
  return self->_failureRelationshipGestureRecognizer;
}

- (void)setFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackGenerator, a3);
}

- (void)_refreshAllDrivers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
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
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  -[_UIClickPresentationInteraction allDrivers](self, "allDrivers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v43 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v8, "setView:", 0);
        objc_msgSend(v8, "setDelegate:", 0);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v5);
  }

  -[_UIClickPresentationInteraction view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_UIClickPresentationInteraction overrideDrivers](self, "overrideDrivers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[_UIClickPresentationInteraction overrideDrivers](self, "overrideDrivers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIClickPresentationInteraction setAllDrivers:](self, "setAllDrivers:", v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)_driverClassesByIdiom;
      v13 = (void *)MEMORY[0x1E0CB37E8];
      -[_UIClickPresentationInteraction view](self, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "traitCollection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v15, "userInterfaceIdiom"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v17, "count"))
      {
        if (self->_delegateImplements.activationStyle)
        {
          -[_UIClickPresentationInteraction delegate](self, "delegate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "activationStyleForClickPresentationInteraction:", self);

        }
        _UIClickInteractionDefaultDrivers();
        v19 = objc_claimAutoreleasedReturnValue();

        v17 = (void *)v19;
      }
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v20 = v17;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v39;
        do
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v39 != v23)
              objc_enumerationMutation(v20);
            v25 = (void *)objc_opt_new();
            objc_msgSend(v11, "addObject:", v25);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v25, "setBehavior:", 1);
              v26 = (void *)objc_opt_new();
              objc_msgSend(v26, "setBehavior:", 2);
              objc_msgSend(v11, "addObject:", v26);

            }
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
        }
        while (v22);
      }

      -[_UIClickPresentationInteraction setAllDrivers:](self, "setAllDrivers:", v11);
    }

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[_UIClickPresentationInteraction allDrivers](self, "allDrivers", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v35;
      do
      {
        for (k = 0; k != v29; ++k)
        {
          if (*(_QWORD *)v35 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * k);
          -[_UIClickPresentationInteraction view](self, "view");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setView:", v33);

          objc_msgSend(v32, "setDelegate:", self);
          objc_msgSend(v32, "setAllowableMovement:", _UIClickPresentationAllowableMovementForDriver(v32, 0));
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
      }
      while (v29);
    }

  }
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (NSArray)allDrivers
{
  return self->_allDrivers;
}

- (NSArray)overrideDrivers
{
  return self->_overrideDrivers;
}

- (void)setAssociatedDragInteraction:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_associatedDragInteraction);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_associatedDragInteraction);

    if (v5)
    {
      v6 = objc_loadWeakRetained((id *)&self->_associatedDragInteraction);
      objc_msgSend(v6, "_setInitiationDrivers:", 0);

    }
    v7 = objc_storeWeak((id *)&self->_associatedDragInteraction, obj);

    if (obj)
    {
      v8 = (void *)MEMORY[0x1E0C99E60];
      v9 = (void *)objc_opt_new();
      objc_msgSend(v8, "setWithObject:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_loadWeakRetained((id *)&self->_associatedDragInteraction);
      objc_msgSend(v11, "_setInitiationDrivers:", v10);

      v12 = objc_loadWeakRetained((id *)&self->_associatedDragInteraction);
      objc_msgSend(v12, "_setPresentationDelegate:", self);

    }
  }

}

- (void)setAllDrivers:(id)a3
{
  objc_storeStrong((id *)&self->_allDrivers, a3);
}

- (void)setFailureRelationshipGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_failureRelationshipGestureRecognizer, a3);
}

- (void)setExclusionRelationshipGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_exclusionRelationshipGestureRecognizer, a3);
}

- (BOOL)allowSimultaneousRecognition
{
  return self->_allowSimultaneousRecognition;
}

- (void)_viewTraitCollectionDidChange:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v4 = objc_msgSend(v11, "forceTouchCapability");
  -[_UIClickPresentationInteraction view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == objc_msgSend(v6, "forceTouchCapability"))
  {
    v7 = objc_msgSend(v11, "userInterfaceIdiom");
    -[_UIClickPresentationInteraction view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceIdiom");

    if (v7 == v10)
      goto LABEL_6;
  }
  else
  {

  }
  -[_UIClickPresentationInteraction _refreshAllDrivers](self, "_refreshAllDrivers");
LABEL_6:

}

- (void)_cancelWithReason:(unint64_t)a3 alongsideActions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[3];
  id v11;
  id v12;
  id v13;

  v8 = a4;
  v9 = a5;
  if (self->_currentState > 3
    || !-[_UIClickPresentationInteraction _supportsRapidRestart](self, "_supportsRapidRestart"))
  {
    v10[0] = self;
    v10[1] = 0;
    v10[2] = a3;
    v11 = 0;
    v12 = _Block_copy(v8);
    v13 = _Block_copy(v9);
    -[_UIClickPresentationInteraction _endInteractionWithContext:](self, "_endInteractionWithContext:", v10);

  }
}

- (BOOL)_supportsRapidRestart
{
  _UIClickPresentationInteraction *v2;
  void *v3;

  if (!self->_delegateImplements.shouldAllowRapidRestart)
    return 0;
  v2 = self;
  -[_UIClickPresentationInteraction delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "_clickPresentationInteractionShouldAllowRapidRestart:", v2);

  return (char)v2;
}

- (void)_endInteractionDidComplete:(void *)a1 completion:(void *)a2
{
  id v3;
  void *v4;
  _QWORD v5[3];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5[0] = a1;
    v5[1] = 0;
    v6 = 0;
    v7 = 0;
    v5[2] = 0;
    v8 = _Block_copy(v3);
    objc_msgSend(a1, "_endInteractionWithContext:", v5);

  }
}

- (void)_endInteractionWithContext:(const InteractionEndingContext *)a3
{
  unint64_t currentState;
  void *v5;

  currentState = self->_currentState;
  if (currentState < 2)
  {
    -[_UIClickPresentationInteraction exclusionRelationshipGestureRecognizer](self, "exclusionRelationshipGestureRecognizer", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_fail");

    -[_UIRelationshipGestureRecognizer _fail](self->_gestureRecognizerForBeginningDragRelationships, "_fail");
    self->_unableToClick = 0;
  }
  else
  {
    handleEvent(stateMachineSpec_3, currentState, 3, (uint64_t)a3, (uint64_t *)&self->_currentState);
  }
}

- (void)clickDriver:(id)a3 didPerformEvent:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  unsigned __int8 v14;
  int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[_UIClickPresentationInteraction activeDriver](self, "activeDriver");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (a4 == 3)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[_UIClickPresentationInteraction allDrivers](self, "allDrivers", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "primaryGestureRecognizer");
          v13 = (uint64_t *)objc_claimAutoreleasedReturnValue();
          v14 = -[UIGestureRecognizer _isActive](v13);

          if ((v14 & 1) != 0)
          {
            v15 = 0;
            goto LABEL_13;
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v10)
          continue;
        break;
      }
    }
    v15 = 1;
LABEL_13:

  }
  else
  {
    v15 = 0;
  }
  if (v7 == v6 || v15)
  {
    switch(a4)
    {
      case 3uLL:
        -[_UIClickPresentationInteraction _driverEnded](self, "_driverEnded");
        break;
      case 2uLL:
        -[_UIClickPresentationInteraction _driverClickedUp](self, "_driverClickedUp");
        break;
      case 1uLL:
        -[_UIClickPresentationInteraction _driverClickedDown](self, "_driverClickedDown");
        break;
    }
  }

}

- (_UIClickInteractionDriving)activeDriver
{
  return self->_activeDriver;
}

- (void)_driverEnded
{
  void *v3;

  if (self->_activatedFeedbackGeneratorForClick)
  {
    -[_UIClickPresentationInteraction feedbackGenerator](self, "feedbackGenerator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "userInteractionEnded");

    self->_activatedFeedbackGeneratorForClick = 0;
  }
  if (self->_currentState <= 4)
    -[_UIClickPresentationInteraction _endInteractionDidComplete:completion:](self, 0);
}

- (void)setAllowSimultaneousRecognition:(BOOL)a3
{
  self->_allowSimultaneousRecognition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDrivers, 0);
  objc_storeStrong((id *)&self->_presentationTypeDebugString, 0);
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
  objc_destroyWeak((id *)&self->_associatedDragInteraction);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_pendingPresentation, 0);
  objc_storeStrong((id *)&self->_presentationAssistant, 0);
  objc_storeStrong((id *)&self->_failureRelationshipGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_exclusionRelationshipGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_allDrivers, 0);
  objc_storeStrong((id *)&self->_activeDriver, 0);
  objc_storeStrong((id *)&self->_latentAssociatedDragInteraction, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activeEffectKey, 0);
  objc_storeStrong((id *)&self->_gestureRecognizerForBeginningDragRelationships, 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[_UIClickPresentationInteraction view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeInteraction:", self);

  v4.receiver = self;
  v4.super_class = (Class)_UIClickPresentationInteraction;
  -[_UIClickPresentationInteraction dealloc](&v4, sel_dealloc);
}

- (BOOL)_isActive
{
  return self->_currentState != 1;
}

- (void)present
{
  unint64_t currentState;
  unint64_t v4;
  NSObject *v5;
  unint64_t v6;
  NSObject *v7;
  unint64_t v8;
  int v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    currentState = self->_currentState;
    if (currentState == 4)
    {
LABEL_4:
      -[_UIClickPresentationInteraction _performPreviewPresentation](self, "_performPreviewPresentation");
      return;
    }
  }
  else
  {
    currentState = MEMORY[8];
  }
  if (currentState == 1)
    goto LABEL_4;
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v8 = self->_currentState;
      v9 = 134217984;
      v10 = v8;
      _os_log_fault_impl(&dword_185066000, v7, OS_LOG_TYPE_FAULT, "Called -present on an active interaction. Current state: %lu.", (uint8_t *)&v9, 0xCu);
    }

  }
  else
  {
    v4 = present___s_category;
    if (!present___s_category)
    {
      v4 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&present___s_category);
    }
    v5 = *(NSObject **)(v4 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = self->_currentState;
      v9 = 134217984;
      v10 = v6;
      _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "Called -present on an active interaction. Current state: %lu.", (uint8_t *)&v9, 0xCu);
    }
  }
  if (self->_currentState != 5)
    -[_UIClickPresentationInteraction _endInteractionDidComplete:completion:](self, 0);
}

- (void)beginPanInteraction
{
  id v2;

  if (self->_shouldAllowFeedback)
  {
    -[_UIClickPresentationInteraction feedbackGenerator](self, "feedbackGenerator");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "userInteractionStarted");

  }
}

- (void)endPanInteraction
{
  id v2;

  if (self->_shouldAllowFeedback)
  {
    -[_UIClickPresentationInteraction feedbackGenerator](self, "feedbackGenerator");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "userInteractionEnded");

  }
}

- (CGPoint)locationInView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  CGPoint result;

  v4 = a3;
  -[_UIClickPresentationInteraction initialLocation](self, "initialLocation");
  v6 = v5;
  v8 = v7;
  -[_UIClickPresentationInteraction view](self, "view");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[_UIClickPresentationInteraction activeDriver](self, "activeDriver");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {

      if (v6 == 1.79769313e308 && v8 == 1.79769313e308)
      {
        -[_UIClickPresentationInteraction activeDriver](self, "activeDriver");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIClickPresentationInteraction view](self, "view");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "locationInCoordinateSpace:", v13);
        -[_UIClickPresentationInteraction setInitialLocation:](self, "setInitialLocation:");

        -[_UIClickPresentationInteraction initialLocation](self, "initialLocation");
        v6 = v14;
        v8 = v15;
      }
    }
    else
    {

    }
  }
  *(double *)&v16 = 1.79769313e308;
  v17 = v6 == 1.79769313e308 && v8 == 1.79769313e308;
  *(double *)&v18 = 1.79769313e308;
  if (!v17)
  {
    -[_UIClickPresentationInteraction view](self, "view");
    v19 = (id)objc_claimAutoreleasedReturnValue();

    if (v19 == v4)
    {
      *(double *)&v16 = v8;
      *(double *)&v18 = v6;
    }
    else
    {
      -[_UIClickPresentationInteraction view](self, "view");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "convertPoint:toView:", v4, v6, v8);
      v18 = v21;
      v16 = v22;

    }
  }

  v23 = *(double *)&v18;
  v24 = *(double *)&v16;
  result.y = v24;
  result.x = v23;
  return result;
}

- (unint64_t)inputPrecision
{
  void *v2;
  unint64_t v3;

  -[_UIClickPresentationInteraction activeDriver](self, "activeDriver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "inputPrecision");

  return v3;
}

- (UITargetedPreview)primaryEffectPreview
{
  void *v3;
  UITargetedPreview *v4;
  void *v5;
  UITargetedPreview *v6;
  void *v7;

  -[_UIClickPresentationInteraction _activeEffect](self, "_activeEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [UITargetedPreview alloc];
  -[_UIClickPresentationInteraction view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UITargetedPreview initWithView:](v4, "initWithView:", v5);
  objc_msgSend(v3, "previewForContinuingToEffectWithPreview:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITargetedPreview *)v7;
}

- (NSArray)secondaryEffectPreviews
{
  void *v2;
  void *v3;

  -[_UIClickPresentationInteraction _activeEffect](self, "_activeEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "secondaryBodyPreviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)_reachedForceThreshold
{
  void *v2;
  char v3;

  -[_UIClickPresentationInteraction activeDriver](self, "activeDriver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCurrentlyAcceleratedByForce");

  return v3;
}

- (BOOL)_delegate_shouldAllowDragAfterDismiss
{
  _UIClickPresentationInteraction *v2;
  void *v3;

  if (!self->_delegateImplements.shouldAllowDragAfterDismiss)
    return 0;
  v2 = self;
  -[_UIClickPresentationInteraction delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "_clickPresentationInteractionShouldAllowDragAfterDismiss:", v2);

  return (char)v2;
}

- (void)_delegate_interactionEndedWithContext:(const InteractionEndingContext *)a3
{
  _BOOL4 endedForPresentation;
  void *v6;
  id v7;

  endedForPresentation = self->_delegateImplements.endedForPresentation;
  -[_UIClickPresentationInteraction delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (endedForPresentation)
    objc_msgSend(v6, "_clickPresentationInteractionEnded:forPresentation:reason:", self, a3->var3, a3->var2);
  else
    objc_msgSend(v6, "clickPresentationInteractionEnded:wasCancelled:", self, !a3->var1);

}

- (void)_performPreviewPresentation
{
  _UIClickPresentationInteraction *v3;

  if (!self->_activeEffectKey)
    -[_UIClickPresentationInteraction _prepareInteractionEffect](self, "_prepareInteractionEffect");
  v3 = self;
  handleEvent(stateMachineSpec_3, self->_currentState, 2, (uint64_t)&v3, (uint64_t *)&self->_currentState);
}

- (BOOL)_canPerformPresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[_UIClickPresentationInteraction view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        goto LABEL_14;
      -[_UIClickPresentationInteraction view](self, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138412290;
      v34 = v14;
      _os_log_fault_impl(&dword_185066000, v13, OS_LOG_TYPE_FAULT, "Attempting to present while the interaction's view (%@) is not in a window. Removing the interaction's view (or an ancestor) from the view hierarchy while the interaction is active is not recommended!", (uint8_t *)&v33, 0xCu);
    }
    else
    {
      v11 = _MergedGlobals_1181;
      if (!_MergedGlobals_1181)
      {
        v11 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v11, (unint64_t *)&_MergedGlobals_1181);
      }
      v12 = *(NSObject **)(v11 + 8);
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        return 0;
      v13 = v12;
      -[_UIClickPresentationInteraction view](self, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138412290;
      v34 = v14;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "Attempting to present while the interaction's view (%@) is not in a window. Removing the interaction's view (or an ancestor) from the view hierarchy while the interaction is active is not recommended!", (uint8_t *)&v33, 0xCu);
    }

LABEL_14:
    return 0;
  }
  -[_UIClickPresentationInteraction presentationAssistant](self, "presentationAssistant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[_UIClickPresentationInteraction view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_viewControllerForAncestor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_4;
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        goto LABEL_28;
      -[_UIClickPresentationInteraction view](self, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIClickPresentationInteraction view](self, "view");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "window");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138412546;
      v34 = v24;
      v35 = 2112;
      v36 = v26;
      _os_log_fault_impl(&dword_185066000, v23, OS_LOG_TYPE_FAULT, "Failed to find a presenting view controller for view (%@) in window (%@). The interaction's view (or an ancestor) must have an associated view controller for presentation to work.", (uint8_t *)&v33, 0x16u);
    }
    else
    {
      v21 = qword_1ECD7F6C8;
      if (!qword_1ECD7F6C8)
      {
        v21 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v21, (unint64_t *)&qword_1ECD7F6C8);
      }
      v22 = *(NSObject **)(v21 + 8);
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
LABEL_4:
        objc_msgSend(v7, "presentedViewController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (!v8 || (objc_msgSend(v8, "isBeingDismissed") & 1) != 0)
        {
          if (!v7)
          {
LABEL_7:
            v10 = 0;
LABEL_18:

            return v10;
          }
LABEL_17:
          -[_UIClickPresentationInteraction delegate](self, "delegate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "clickPresentationInteraction:presentationForPresentingViewController:", self, v7);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIClickPresentationInteraction setPendingPresentation:](self, "setPendingPresentation:", v18);

          -[_UIClickPresentationInteraction pendingPresentation](self, "pendingPresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v19 != 0;

          goto LABEL_18;
        }
        -[_UIClickPresentationInteraction view](self, "view");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIViewController _viewControllerForFullScreenPresentationFromView:](UIViewController, "_viewControllerForFullScreenPresentationFromView:", v15);
        v16 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v16;
        if (v16)
          goto LABEL_17;
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v29 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
            goto LABEL_35;
          -[_UIClickPresentationInteraction view](self, "view");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIClickPresentationInteraction view](self, "view");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "window");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 138412546;
          v34 = v30;
          v35 = 2112;
          v36 = v32;
          _os_log_fault_impl(&dword_185066000, v29, OS_LOG_TYPE_FAULT, "Failed to find a presenting view controller for view (%@) in window (%@). The interaction's view (or an ancestor) must have an associated view controller inside the window's root view controller hierarchy.", (uint8_t *)&v33, 0x16u);
        }
        else
        {
          v27 = qword_1ECD7F6D0;
          if (!qword_1ECD7F6D0)
          {
            v27 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v27, (unint64_t *)&qword_1ECD7F6D0);
          }
          v28 = *(NSObject **)(v27 + 8);
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            goto LABEL_7;
          v29 = v28;
          -[_UIClickPresentationInteraction view](self, "view");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIClickPresentationInteraction view](self, "view");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "window");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 138412546;
          v34 = v30;
          v35 = 2112;
          v36 = v32;
          _os_log_impl(&dword_185066000, v29, OS_LOG_TYPE_ERROR, "Failed to find a presenting view controller for view (%@) in window (%@). The interaction's view (or an ancestor) must have an associated view controller inside the window's root view controller hierarchy.", (uint8_t *)&v33, 0x16u);
        }

LABEL_35:
        goto LABEL_7;
      }
      v23 = v22;
      -[_UIClickPresentationInteraction view](self, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIClickPresentationInteraction view](self, "view");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "window");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138412546;
      v34 = v24;
      v35 = 2112;
      v36 = v26;
      _os_log_impl(&dword_185066000, v23, OS_LOG_TYPE_ERROR, "Failed to find a presenting view controller for view (%@) in window (%@). The interaction's view (or an ancestor) must have an associated view controller for presentation to work.", (uint8_t *)&v33, 0x16u);
    }

LABEL_28:
    goto LABEL_4;
  }
  return 0;
}

- (unint64_t)activatedDriverStyle
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  unint64_t v8;
  void *v10;

  -[_UIClickPresentationInteraction activeDriver](self, "activeDriver");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[_UIClickPresentationInteraction activeDriver](self, "activeDriver"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_opt_respondsToSelector(),
        v5,
        v4,
        (v6 & 1) != 0))
  {
    -[_UIClickPresentationInteraction activeDriver](self, "activeDriver");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "driverStyle");

    return v8;
  }
  else
  {
    -[_UIClickPresentationInteraction activeDriver](self, "activeDriver");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      return 0;
    else
      return -[_UIClickPresentationInteraction fallbackDriverStyle](self, "fallbackDriverStyle");
  }
}

- (void)_performPresentation
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int64_t v7;
  uint64_t v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void (**v15)(_QWORD);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  void (**v21)(_QWORD);
  _QWORD v22[5];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD aBlock[4];
  id v28;
  id location[2];

  -[_UIClickPresentationInteraction pendingPresentation](self, "pendingPresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_UIClickPresentationInteraction _clickDriverTouch](self, "_clickDriverTouch");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[_UIClickPresentationInteraction activeDriver](self, "activeDriver");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isCurrentlyAcceleratedByForce");

      v7 = 1;
      if (v6)
        v7 = 2;
    }
    else
    {
      v7 = 3;
    }
    self->_statsPresentation = v7;
    objc_initWeak(location, self);
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __55___UIClickPresentationInteraction__performPresentation__block_invoke;
    aBlock[3] = &unk_1E16B44C0;
    objc_copyWeak(&v28, location);
    v9 = _Block_copy(aBlock);
    v10 = (objc_class *)objc_opt_class();
    if (-[_UIClickPresentationInteraction _supportsRapidRestart](self, "_supportsRapidRestart"))
      v10 = (objc_class *)objc_opt_class();
    v11 = (void *)objc_msgSend([v10 alloc], "initWithClickPresentation:", v3);
    -[_UIClickPresentationInteraction setPresentationAssistant:](self, "setPresentationAssistant:", v11);

    v25[0] = v8;
    v25[1] = 3221225472;
    v25[2] = __55___UIClickPresentationInteraction__performPresentation__block_invoke_23;
    v25[3] = &unk_1E16DAEF0;
    objc_copyWeak(&v26, location);
    -[_UIClickPresentationInteraction presentationAssistant](self, "presentationAssistant");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setKeyboardAssertionInvalidationHandler:", v25);

    -[_UIClickPresentationInteraction primaryEffectPreview](self, "primaryEffectPreview");
    v22[0] = v8;
    v22[1] = 3221225472;
    v22[2] = __55___UIClickPresentationInteraction__performPresentation__block_invoke_2;
    v22[3] = &unk_1E16BAD68;
    v22[4] = self;
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v23 = v13;
    v14 = v9;
    v24 = v14;
    v15 = (void (**)(_QWORD))_Block_copy(v22);
    objc_msgSend(v3, "viewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "transitionCoordinator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      goto LABEL_11;
    objc_msgSend(v3, "presentationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "presentingViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "transitionCoordinator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
LABEL_11:
      v20[0] = v8;
      v20[1] = 3221225472;
      v20[2] = __55___UIClickPresentationInteraction__performPresentation__block_invoke_5;
      v20[3] = &unk_1E16B1CC8;
      v21 = v15;
      objc_msgSend(v17, "animateAlongsideTransition:completion:", 0, v20);

    }
    else
    {
      v15[2](v15);
    }

    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(location);
  }
  -[_UIClickPresentationInteraction setPendingPresentation:](self, "setPendingPresentation:", 0);

}

- (void)clickDriver:(id)a3 shouldBegin:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  void (**v18)(_QWORD);
  _QWORD aBlock[5];
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59___UIClickPresentationInteraction_clickDriver_shouldBegin___block_invoke;
  aBlock[3] = &unk_1E16BAD68;
  aBlock[4] = self;
  v9 = v6;
  v20 = v9;
  v10 = v7;
  v21 = v10;
  v11 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[_UIClickPresentationInteraction view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rootViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "presentedViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "transitionCoordinator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[_UIClickPresentationInteraction _supportsRapidRestart](self, "_supportsRapidRestart") || !v16)
  {
    v11[2](v11);
  }
  else
  {
    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __59___UIClickPresentationInteraction_clickDriver_shouldBegin___block_invoke_3;
    v17[3] = &unk_1E16B1CC8;
    v18 = v11;
    objc_msgSend(v16, "animateAlongsideTransition:completion:", 0, v17);

  }
}

- (void)clickDriver:(id)a3 didUpdateHighlightProgress:(double)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  if (!self->_unableToClick)
  {
    v8 = v6;
    if (-[_UIClickPresentationInteraction _isActive](self, "_isActive") && !self->_activeEffectKey)
      -[_UIClickPresentationInteraction _prepareInteractionEffect](self, "_prepareInteractionEffect");
    -[_UIClickPresentationInteraction _activeEffect](self, "_activeEffect");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "maximumEffectProgress");
      objc_msgSend(v7, "setMaxProgress:");
    }
    objc_msgSend(v7, "updateWithProgress:", a4);

    v6 = v8;
  }

}

- (void)_driverClickedDown
{
  _UIClickPresentationInteraction *v2;

  v2 = self;
  handleEvent(stateMachineSpec_3, self->_currentState, 1, (uint64_t)&v2, (uint64_t *)&self->_currentState);
}

- (void)_driverClickedUp
{
  _UIClickPresentationInteraction *v2;

  v2 = self;
  handleEvent(stateMachineSpec_3, self->_currentState, 2, (uint64_t)&v2, (uint64_t *)&self->_currentState);
}

+ (void)_setDefaultDriverClasses:(id)a3 forIdiom:(int64_t)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = (void *)_driverClassesByIdiom;
  if (!_driverClassesByIdiom)
  {
    v6 = objc_opt_new();
    v7 = (void *)_driverClassesByIdiom;
    _driverClassesByIdiom = v6;

    v5 = (void *)_driverClassesByIdiom;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, v8);

}

- (void)setActiveDriver:(id)a3
{
  _UIClickInteractionDriving **p_activeDriver;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _UIClickInteractionDriving *v10;

  p_activeDriver = &self->_activeDriver;
  v10 = (_UIClickInteractionDriving *)a3;
  if (*p_activeDriver != v10)
  {
    objc_storeStrong((id *)&self->_activeDriver, a3);
    if (*p_activeDriver)
    {
      v6 = objc_msgSend((id)objc_opt_class(), "prefersCancelsTouchesInView");
      -[_UIClickPresentationInteraction exclusionRelationshipGestureRecognizer](self, "exclusionRelationshipGestureRecognizer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCancelsTouchesInView:", v6);

      -[_UIClickPresentationInteraction failureRelationshipGestureRecognizer](self, "failureRelationshipGestureRecognizer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setCancelsTouchesInView:", v6);

      -[_UIClickInteractionDriving setCancelsTouchesInView:](self->_activeDriver, "setCancelsTouchesInView:", 0);
      if (-[_UIClickPresentationInteraction _delegate_shouldAllowDragAfterDismiss](self, "_delegate_shouldAllowDragAfterDismiss"))
      {
        -[_UIClickInteractionDriving primaryGestureRecognizer](*p_activeDriver, "primaryGestureRecognizer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_setKeepTouchesOnContinuation:", 1);

      }
    }
  }

}

- (void)_cancelAllDrivers
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[_UIClickPresentationInteraction allDrivers](self, "allDrivers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "cancelInteraction");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)_candidateInteractionsForAssociation
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v17;
  id obj;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIClickPresentationInteraction _clickDriverTouch](self, "_clickDriverTouch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v17 = v4;
    objc_msgSend(v4, "gestureRecognizers");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v5)
    {
      v6 = v5;
      v19 = *(_QWORD *)v25;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v7);
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          objc_msgSend(v8, "view");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "interactions");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v21;
            do
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v21 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v14);
                if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v15, "_supportsAssociation"))
                  objc_msgSend(v3, "addObject:", v15);
                ++v14;
              }
              while (v12 != v14);
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            }
            while (v12);
          }

          ++v7;
        }
        while (v7 != v6);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v6);
    }

    v4 = v17;
  }

  return v3;
}

- (void)_associateWithActiveDragInteraction
{
  _UIClickPresentationInteraction *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  _UIClickPresentationInteraction *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v2 = self;
  v30 = *MEMORY[0x1E0C80C00];
  -[_UIClickPresentationInteraction _clickDriverTouch](self, "_clickDriverTouch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v3, "gestureRecognizers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v5)
  {
    v6 = v5;
    v18 = v2;
    v19 = v3;
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (_isDragInteractionGestureRecognizer(v9))
        {
          v22 = 0u;
          v23 = 0u;
          v20 = 0u;
          v21 = 0u;
          objc_msgSend(v9, "view");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "interactions");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v21;
LABEL_9:
            v15 = 0;
            while (1)
            {
              if (*(_QWORD *)v21 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v15);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                break;
              if (v13 == ++v15)
              {
                v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
                if (v13)
                  goto LABEL_9;
                goto LABEL_15;
              }
            }
            v17 = v16;

            if (v17)
              goto LABEL_20;
          }
          else
          {
LABEL_15:

          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v6);
    v17 = 0;
LABEL_20:
    v2 = v18;
    v3 = v19;
  }
  else
  {
    v17 = 0;
  }

  -[_UIClickPresentationInteraction setAssociatedDragInteraction:](v2, "setAssociatedDragInteraction:", v17);
}

- (id)_clickDragDriver
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
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
  -[_UIClickPresentationInteraction associatedDragInteraction](self, "associatedDragInteraction", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_initiationDrivers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)_attemptDragLiftAtLocation:(CGPoint)a3 useDefaultLiftAnimation:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  _QWORD v14[4];
  id v15;
  _UIClickPresentationInteraction *v16;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  -[_UIClickPresentationInteraction _clickDragDriver](self, "_clickDragDriver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "canBeginLiftAtLocation:", x, y))
  {
    if (self->_unableToClick)
    {
      objc_msgSend(v8, "liftDelay");
      v10 = v9;
      -[_UIClickPresentationInteraction activeDriver](self, "activeDriver");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "touchDuration");
      v13 = v10 - v12;

    }
    else
    {
      v13 = 0.0;
    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __86___UIClickPresentationInteraction__attemptDragLiftAtLocation_useDefaultLiftAnimation___block_invoke;
    v14[3] = &unk_1E16B2218;
    v15 = v8;
    v16 = self;
    objc_msgSend(v15, "beginLiftAtLocation:useDefaultLiftAnimation:delay:completion:", v4, v14, x, y, v13);

  }
}

- (BOOL)beginDragIfPossibleWithTouch:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[6];
  _QWORD v14[5];
  id v15;
  id location;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  -[_UIRelationshipGestureRecognizer _fail](self->_gestureRecognizerForBeginningDragRelationships, "_fail");
  if (v4
    || (-[_UIClickPresentationInteraction _clickDriverTouch](self, "_clickDriverTouch"),
        (v4 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[_UIClickPresentationInteraction _clickDragDriver](self, "_clickDragDriver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isLifted") & 1) == 0)
    {
      -[_UIClickPresentationInteraction locationInView:](self, "locationInView:", 0);
      -[_UIClickPresentationInteraction _attemptDragLiftAtLocation:useDefaultLiftAnimation:](self, "_attemptDragLiftAtLocation:useDefaultLiftAnimation:", 0);
    }
    v6 = objc_msgSend(v5, "isLifted");
    if (v6)
    {
      v17[0] = 0;
      v17[1] = v17;
      v17[2] = 0x3032000000;
      v17[3] = __Block_byref_object_copy__156;
      v17[4] = __Block_byref_object_dispose__156;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = MEMORY[0x1E0C809B0];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __64___UIClickPresentationInteraction_beginDragIfPossibleWithTouch___block_invoke;
      v14[3] = &unk_1E16DAF40;
      objc_copyWeak(&v15, &location);
      v14[4] = v17;
      v13[0] = v8;
      v13[1] = 3221225472;
      v13[2] = __64___UIClickPresentationInteraction_beginDragIfPossibleWithTouch___block_invoke_2;
      v13[3] = &unk_1E16DAF68;
      v13[4] = self;
      v13[5] = v17;
      objc_msgSend(v5, "beginDragWithTouches:itemIterator:beginningSessionHandler:", v7, v14, v13);

      if (self->_shouldAllowFeedback)
      {
        -[_UIClickPresentationInteraction feedbackGenerator](self, "feedbackGenerator");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIClickPresentationInteraction locationInView:](self, "locationInView:", 0);
        objc_msgSend(v9, "draggedAtLocation:");

      }
      if (self->_unableToClick)
      {
        -[_UIClickPresentationInteraction exclusionRelationshipGestureRecognizer](self, "exclusionRelationshipGestureRecognizer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_succeed");

        -[_UIClickPresentationInteraction failureRelationshipGestureRecognizer](self, "failureRelationshipGestureRecognizer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_succeed");

      }
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
      _Block_object_dispose(v17, 8);

    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (UIGestureRecognizer)gestureRecognizerForBeginningDragRelationships
{
  _UIRelationshipGestureRecognizer *v3;
  _UIRelationshipGestureRecognizer *gestureRecognizerForBeginningDragRelationships;
  id WeakRetained;

  if (!self->_gestureRecognizerForBeginningDragRelationships)
  {
    v3 = (_UIRelationshipGestureRecognizer *)objc_opt_new();
    gestureRecognizerForBeginningDragRelationships = self->_gestureRecognizerForBeginningDragRelationships;
    self->_gestureRecognizerForBeginningDragRelationships = v3;

    -[UIGestureRecognizer setName:](self->_gestureRecognizerForBeginningDragRelationships, "setName:", CFSTR("com.apple.UIKit.UICPI-beginning-drag-failure-relationship"));
    -[UIGestureRecognizer setDelegate:](self->_gestureRecognizerForBeginningDragRelationships, "setDelegate:", self);
    -[UIGestureRecognizer _setKeepTouchesOnContinuation:](self->_gestureRecognizerForBeginningDragRelationships, "_setKeepTouchesOnContinuation:", 1);
    -[_UIRelationshipGestureRecognizer setSucceedsOnTouchesEnded:](self->_gestureRecognizerForBeginningDragRelationships, "setSucceedsOnTouchesEnded:", 1);
    -[UIGestureRecognizer setCancelsTouchesInView:](self->_gestureRecognizerForBeginningDragRelationships, "setCancelsTouchesInView:", 0);
    -[UIGestureRecognizer setDelaysTouchesEnded:](self->_gestureRecognizerForBeginningDragRelationships, "setDelaysTouchesEnded:", 0);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "addGestureRecognizer:", self->_gestureRecognizerForBeginningDragRelationships);

  return (UIGestureRecognizer *)self->_gestureRecognizerForBeginningDragRelationships;
}

- (void)_prepareInteractionEffect
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  UITargetedPreview *v9;
  UITargetedPreview *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id *v28;
  id *v29;
  void *v30;
  _QWORD v31[4];
  UITargetedPreview *v32;
  id v33;
  id v34;
  id v35;
  uint64_t *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  -[_UIClickPresentationInteraction view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIClickPresentationInteraction locationInView:](self, "locationInView:", v3);
  v5 = v4;
  v7 = v6;

  if (!self->_delegateImplements.previewForHighlightingAtLocation
    || (-[_UIClickPresentationInteraction delegate](self, "delegate"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "clickPresentationInteraction:previewForHighlightingAtLocation:", self, v5, v7),
        v9 = (UITargetedPreview *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v9))
  {
    v10 = [UITargetedPreview alloc];
    -[_UIClickPresentationInteraction view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[UITargetedPreview initWithView:](v10, "initWithView:", v11);

  }
  if (-[_UIClickPresentationInteraction activatedDriverStyle](self, "activatedDriverStyle") == 1)
  {
    v12 = 0;
  }
  else
  {
    -[_UIClickPresentationInteraction _candidateInteractionsForAssociation](self, "_candidateInteractionsForAssociation");
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v47;
LABEL_8:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v47 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v16);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v17, "_targetedPreviewForContinuingEffectWithPreview:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            break;
        }
        if (v14 == ++v16)
        {
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
          if (v14)
            goto LABEL_8;
          goto LABEL_15;
        }
      }
    }
    else
    {
LABEL_15:
      v12 = 0;
    }

  }
  v18 = (void *)objc_opt_new();
  -[_UIClickPresentationInteraction view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setView:", v19);

  objc_msgSend(v18, "setPoint:", v5, v7);
  v20 = (void *)objc_opt_new();
  objc_msgSend(v20, "setPrimaryPreview:", v9);
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__156;
  v44 = __Block_byref_object_dispose__156;
  v45 = 0;
  if (self->_delegateImplements.interactionEffectForTargetedPreview)
  {
    -[_UIClickPresentationInteraction delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_clickPresentationInteraction:interactionEffectForTargetedPreview:", self, v9);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v41[5];
    v41[5] = v22;

    if (v41[5])
      goto LABEL_21;
  }
  if (!self->_delegateImplements.secondaryPreviews)
  {
LABEL_21:
    +[_UIContentEffectManager sharedManager](_UIContentEffectManager, "sharedManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __60___UIClickPresentationInteraction__prepareInteractionEffect__block_invoke_2;
    v31[3] = &unk_1E16DB2E8;
    v36 = &v40;
    v32 = v9;
    v33 = v12;
    v34 = v20;
    v35 = v18;
    objc_msgSend(v30, "compatibleEffectForKey:descriptor:constructor:", v35, v34, v31);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (id *)&v32;
    v29 = &v33;
    v26 = v34;
  }
  else
  {
    -[_UIClickPresentationInteraction delegate](self, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "_secondaryPreviewsForClickPresentationInteraction:", self);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setSecondaryPreviews:", v25);

    +[_UIContentEffectManager sharedManager](_UIContentEffectManager, "sharedManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __60___UIClickPresentationInteraction__prepareInteractionEffect__block_invoke;
    v37[3] = &unk_1E16DB2C0;
    v38 = v20;
    v39 = v12;
    objc_msgSend(v26, "compatibleEffectForKey:descriptor:constructor:", v18, v38, v37);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = &v38;
    v29 = &v39;
  }

  if (v27)
  {
    objc_storeStrong((id *)&self->_activeEffectKey, v18);
    objc_msgSend(v27, "begin");
  }

  _Block_object_dispose(&v40, 8);
}

- (id)_clickDriverTouch
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[_UIClickPresentationInteraction activeDriver](self, "activeDriver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_allActiveTouches");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_endInteractionEffectIfNeeded
{
  void *v3;
  _UIGravityWellEffectKey *activeEffectKey;

  -[_UIClickPresentationInteraction _activeEffect](self, "_activeEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "end");

  activeEffectKey = self->_activeEffectKey;
  self->_activeEffectKey = 0;

}

- (id)_activeEffect
{
  void *v3;
  void *v4;

  +[_UIContentEffectManager sharedManager](_UIContentEffectManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", self->_activeEffectKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)presentationTypeDebugString
{
  NSString *presentationTypeDebugString;
  NSString *v3;
  void *v4;
  void *v5;

  presentationTypeDebugString = self->_presentationTypeDebugString;
  if (presentationTypeDebugString)
  {
    v3 = presentationTypeDebugString;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[_UIClickPresentationInteraction delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("(delegate: %@)"), objc_opt_class());
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)_dragInteractionPresentation:(id)a3 previewForCancellingItem:(id)a4 defaultPreview:(id)a5 proposedPreview:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a4;
  v9 = a6;
  -[_UIClickPresentationInteraction delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 && self->_delegateImplements.previewForCancellingDragItem)
  {
    objc_msgSend(v10, "_clickPresentationInteraction:previewForCancellingDragItem:", self, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "target");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "retargetedPreviewWithTarget:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "_setPreviewMode:", 3);
    objc_msgSend(v14, "_setDefaultPreview:", 1);
  }
  else
  {
    v14 = 0;
  }
  if (v14)
    v15 = v14;
  else
    v15 = v9;
  v16 = v15;

  return v16;
}

- (void)_dragInteractionPresentation:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v7 = a5;
  -[_UIClickPresentationInteraction delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (self->_delegateImplements.willAnimateDragCancelWithAnimator)
    objc_msgSend(v8, "_clickPresentationInteraction:item:willAnimateDragCancelWithAnimator:", self, v10, v7);

}

- (void)_dragInteractionPresentation:(id)a3 sessionDidEnd:(id)a4 withoutBeginning:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  _UIClickPresentationInteraction *v15;
  id v16;

  v5 = a5;
  v7 = a4;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __95___UIClickPresentationInteraction__dragInteractionPresentation_sessionDidEnd_withoutBeginning___block_invoke;
  v14 = &unk_1E16B1B50;
  v15 = self;
  v16 = v7;
  v8 = v7;
  v9 = (void (**)(_QWORD))_Block_copy(&v11);
  v10 = v9;
  if (v5)
  {
    -[_UIClickPresentationInteraction _endInteractionDidComplete:completion:](self, v9);
    -[_UIClickPresentationInteraction _endInteractionEffectIfNeeded](self, "_endInteractionEffectIfNeeded", v11, v12, v13, v14, v15, v16);
  }
  else
  {
    v9[2](v9);
  }

}

- (UIDragInteraction)latentAssociatedDragInteraction
{
  return self->_latentAssociatedDragInteraction;
}

- (void)setLatentAssociatedDragInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_latentAssociatedDragInteraction, a3);
}

- (_UIClickPresentationAssisting)presentationAssistant
{
  return self->_presentationAssistant;
}

- (void)setPresentationAssistant:(id)a3
{
  objc_storeStrong((id *)&self->_presentationAssistant, a3);
}

- (_UIClickPresentation)pendingPresentation
{
  return self->_pendingPresentation;
}

- (void)setPendingPresentation:(id)a3
{
  objc_storeStrong((id *)&self->_pendingPresentation, a3);
}

- (CAPoint3D)initialLocation
{
  double x;
  double y;
  double z;
  CAPoint3D result;

  x = self->_initialLocation.x;
  y = self->_initialLocation.y;
  z = self->_initialLocation.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (_UIClickPresentationFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (UIDragInteraction)associatedDragInteraction
{
  return (UIDragInteraction *)objc_loadWeakRetained((id *)&self->_associatedDragInteraction);
}

- (NSString)debugIdentifier
{
  return self->_debugIdentifier;
}

- (unint64_t)fallbackDriverStyle
{
  return self->_fallbackDriverStyle;
}

- (void)setFallbackDriverStyle:(unint64_t)a3
{
  self->_fallbackDriverStyle = a3;
}

@end
