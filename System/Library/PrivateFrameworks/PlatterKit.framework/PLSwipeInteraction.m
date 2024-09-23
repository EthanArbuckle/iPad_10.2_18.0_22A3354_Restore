@implementation PLSwipeInteraction

- (PLSwipeInteraction)initWithDelegate:(id)a3
{
  id v4;
  PLSwipeInteraction *v5;
  PLSwipeInteraction *v6;
  uint64_t v7;
  UIPanGestureRecognizer *panGestureRecognizer;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLSwipeInteraction;
  v5 = -[PLSwipeInteraction init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_animationCount = 0;
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7F8]), "initWithTarget:action:", v6, sel__handlePanGesture_);
    panGestureRecognizer = v6->_panGestureRecognizer;
    v6->_panGestureRecognizer = (UIPanGestureRecognizer *)v7;

    -[UIPanGestureRecognizer _setCanPanVertically:](v6->_panGestureRecognizer, "_setCanPanVertically:", 0);
    -[UIPanGestureRecognizer setDelegate:](v6->_panGestureRecognizer, "setDelegate:", v6);
    -[UIPanGestureRecognizer _setAllowedScrollTypesMask:](v6->_panGestureRecognizer, "_setAllowedScrollTypesMask:", 2);
    -[PLSwipeInteraction _setupContentOffsetFloatAnimatableProperty](v6, "_setupContentOffsetFloatAnimatableProperty");
  }

  return v6;
}

- (void)revealActionsForLayoutLocation:(unint64_t)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  PLActionButtonsPresentingView *actionButtonsPresentingView;
  _QWORD v8[5];
  void (**v9)(_QWORD);
  unint64_t v10;

  v6 = (void (**)(_QWORD))a4;
  -[PLSwipeInteraction setPerformingSwipeHinting:](self, "setPerformingSwipeHinting:", 0);
  actionButtonsPresentingView = self->_actionButtonsPresentingView;
  if (actionButtonsPresentingView)
  {
    if (-[PLActionButtonsPresentingView layoutLocation](actionButtonsPresentingView, "layoutLocation") == a3)
    {
      if (v6)
        v6[2](v6);
    }
    else
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __64__PLSwipeInteraction_revealActionsForLayoutLocation_completion___block_invoke;
      v8[3] = &unk_1E91D35B8;
      v8[4] = self;
      v10 = a3;
      v9 = v6;
      -[PLSwipeInteraction hideActionsAnimated:fastAnimation:completion:](self, "hideActionsAnimated:fastAnimation:completion:", 1, 1, v8);

    }
  }
  else
  {
    -[PLSwipeInteraction _addActionButtonsAndRevealAnimated:fastAnimation:layoutLocation:completion:](self, "_addActionButtonsAndRevealAnimated:fastAnimation:layoutLocation:completion:", 1, 1, a3, v6);
  }

}

uint64_t __64__PLSwipeInteraction_revealActionsForLayoutLocation_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addActionButtonsAndRevealAnimated:fastAnimation:layoutLocation:completion:", 1, 1, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)hideActionsAnimated:(BOOL)a3 fastAnimation:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  -[PLSwipeInteraction setPerformingSwipeHinting:](self, "setPerformingSwipeHinting:", 0);
  if (self->_actionButtonsPresentingView)
  {
    -[UIPanGestureRecognizer setState:](self->_panGestureRecognizer, "setState:", 4);
    -[PLSwipeInteraction _hideAnimated:fastAnimation:velocity:completion:](self, "_hideAnimated:fastAnimation:velocity:completion:", v6, v5, v8, 0.0);
  }

}

- (id)senderForActionWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PLActionButtonsPresentingView actionButtonsView](self->_actionButtonsPresentingView, "actionButtonsView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "senderForActionWithIdentifier:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setMaterialGroupNameBase:(id)a3
{
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = -[NSString isEqualToString:](self->_materialGroupNameBase, "isEqualToString:", v9);
  v6 = v9;
  if (!v5)
  {
    objc_storeStrong((id *)&self->_materialGroupNameBase, a3);
    -[PLActionButtonsPresentingView actionButtonsView](self->_actionButtonsPresentingView, "actionButtonsView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      objc_msgSend(v7, "setMaterialGroupNameBase:", v9);

    v6 = v9;
  }

}

- (void)willMoveToView:(id)a3
{
  UIView **p_view;
  id v5;
  void *v6;
  _UIStatesFeedbackGenerator *defaultActionFeedbackGenerator;
  id WeakRetained;

  p_view = &self->_view;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_view);

  v6 = WeakRetained;
  if (WeakRetained && WeakRetained != v5)
  {
    objc_msgSend(WeakRetained, "removeGestureRecognizer:", self->_panGestureRecognizer);
    defaultActionFeedbackGenerator = self->_defaultActionFeedbackGenerator;
    self->_defaultActionFeedbackGenerator = 0;

    objc_storeWeak((id *)&self->_viewToMove, 0);
    -[PLSwipeInteraction _removeActionButtons](self, "_removeActionButtons");
    v6 = WeakRetained;
  }

}

- (void)didMoveToView:(id)a3
{
  _UIStatesFeedbackGenerator *v4;
  _UIStatesFeedbackGenerator *defaultActionFeedbackGenerator;
  id v6;

  v6 = a3;
  objc_storeWeak((id *)&self->_view, v6);
  if (v6)
  {
    objc_msgSend(v6, "addGestureRecognizer:", self->_panGestureRecognizer);
    v4 = (_UIStatesFeedbackGenerator *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAEC8]), "initWithStyle:view:", 1, v6);
    defaultActionFeedbackGenerator = self->_defaultActionFeedbackGenerator;
    self->_defaultActionFeedbackGenerator = v4;

  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UIPanGestureRecognizer *v4;
  id WeakRetained;
  UIPanGestureRecognizer *panGestureRecognizer;
  char v7;
  uint64_t v8;
  _BOOL4 v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  double v13;
  double v14;
  double v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  int v21;
  PLSwipeInteraction *v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  _BOOL4 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (UIPanGestureRecognizer *)a3;
  if (-[PLSwipeInteraction _shouldContinuePresentingActionButtons](self, "_shouldContinuePresentingActionButtons"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    panGestureRecognizer = self->_panGestureRecognizer;
    if (WeakRetained && panGestureRecognizer == v4)
    {
      if (self->_actionButtonsPresentingView)
      {
        v7 = 1;
        goto LABEL_17;
      }
      -[PLSwipeInteraction _panHorizontalTranslation](self, "_panHorizontalTranslation");
      v14 = v13;
      -[PLSwipeInteraction _panHorizontalVelocity](self, "_panHorizontalVelocity");
      v16 = -[PLSwipeInteraction _interfaceEdgeToPresentOnForInitialPanTranslation:andInitialPanVelocity:](self, "_interfaceEdgeToPresentOnForInitialPanTranslation:andInitialPanVelocity:", v14, v15);
      if (v16)
      {
        v17 = -[PLSwipeInteraction _layoutLocationForInterfaceEdge:](self, "_layoutLocationForInterfaceEdge:", v16);
        -[PLSwipeInteraction delegate](self, "delegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v7 = objc_msgSend(v18, "swipeInteraction:shouldRevealActionsFromLayoutLocation:", self, v17);
        else
          v7 = 0;

        goto LABEL_17;
      }
      v19 = PLLogInteraction;
      v7 = 0;
      if (!os_log_type_enabled((os_log_t)PLLogInteraction, OS_LOG_TYPE_DEFAULT))
      {
LABEL_17:

        goto LABEL_18;
      }
      v21 = 138543362;
      v22 = self;
      v10 = "%{public}@: Denying pan gesture. Pan gesture translation and velocity are both 0. Cannot infer edge to revea"
            "l action buttons on.";
      v11 = v19;
      v12 = 12;
    }
    else
    {
      v8 = PLLogInteraction;
      v7 = 0;
      if (!os_log_type_enabled((os_log_t)PLLogInteraction, OS_LOG_TYPE_DEFAULT))
        goto LABEL_17;
      v9 = self->_actionButtonsPresentingView != 0;
      v21 = 138543874;
      v22 = self;
      v23 = 1026;
      v24 = panGestureRecognizer == v4;
      v25 = 1026;
      v26 = v9;
      v10 = "%{public}@: Denying pan gesture. recognizerMatches: %{public}d actionsRevealed: %{public}d";
      v11 = v8;
      v12 = 24;
    }
    _os_log_impl(&dword_1D1285000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v21, v12);
    v7 = 0;
    goto LABEL_17;
  }
  -[PLSwipeInteraction hideActionsAnimated:fastAnimation:completion:](self, "hideActionsAnimated:fastAnimation:completion:", 1, 1, 0);
  v7 = 0;
LABEL_18:

  return v7;
}

- (BOOL)_shouldContinuePresentingActionButtons
{
  void *v3;
  char v4;

  -[PLSwipeInteraction delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "shouldContinuePresentingActionButtonsForSwipeInteraction:", self);
  else
    v4 = 1;

  return v4;
}

- (unint64_t)_interfaceEdgeToPresentOnForInitialPanTranslation:(double)a3 andInitialPanVelocity:(double)a4
{
  if (a3 == 0.0)
    a3 = a4;
  return -[PLSwipeInteraction _interfaceEdgeToPresentOnForComparisonValue:](self, "_interfaceEdgeToPresentOnForComparisonValue:", a3);
}

- (unint64_t)_interfaceEdgeToPresentOnForComparisonValue:(double)a3
{
  unint64_t v3;

  v3 = 2;
  if (a3 > 0.0)
    v3 = 1;
  if (a3 == 0.0)
    return 0;
  else
    return v3;
}

- (unint64_t)_layoutLocationForInterfaceEdge:(unint64_t)a3
{
  id WeakRetained;
  int v6;
  uint64_t v7;
  void *v10;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSwipeInteraction.m"), 257, CFSTR("Must pass a valid PLSwipeInteractionLayoutLocation."));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v6 = objc_msgSend(WeakRetained, "_shouldReverseLayoutDirection");

  v7 = 1;
  if (v6)
    v7 = 2;
  return v7 != a3;
}

- (unint64_t)_interfaceEdgeForLayoutLocation:(unint64_t)a3
{
  id WeakRetained;
  int v5;
  int v6;
  BOOL v7;
  unint64_t v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v5 = objc_msgSend(WeakRetained, "_shouldReverseLayoutDirection");

  if (a3)
    v6 = 1;
  else
    v6 = v5;
  v7 = v6 == 0;
  v8 = 1;
  if (!v7)
    v8 = 2;
  if (((a3 == 1) & v5) != 0)
    return 1;
  else
    return v8;
}

- (double)_panHorizontalTranslation
{
  id WeakRetained;
  double v4;
  UIPanGestureRecognizer *panGestureRecognizer;
  double v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v4 = 0.0;
  if (WeakRetained)
  {
    panGestureRecognizer = self->_panGestureRecognizer;
    if (panGestureRecognizer)
    {
      -[UIPanGestureRecognizer translationInView:](panGestureRecognizer, "translationInView:", WeakRetained);
      v4 = v6;
    }
  }

  return v4;
}

- (double)_panHorizontalVelocity
{
  id WeakRetained;
  double v4;
  UIPanGestureRecognizer *panGestureRecognizer;
  double v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v4 = 0.0;
  if (WeakRetained)
  {
    panGestureRecognizer = self->_panGestureRecognizer;
    if (panGestureRecognizer)
    {
      -[UIPanGestureRecognizer velocityInView:](panGestureRecognizer, "velocityInView:", WeakRetained);
      v4 = v6;
    }
  }

  return v4;
}

- (CGPoint)_panLocation
{
  id WeakRetained;
  double v4;
  double v5;
  UIPanGestureRecognizer *panGestureRecognizer;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v4 = *MEMORY[0x1E0C9D538];
  v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (WeakRetained)
  {
    panGestureRecognizer = self->_panGestureRecognizer;
    if (panGestureRecognizer)
    {
      -[UIPanGestureRecognizer locationInView:](panGestureRecognizer, "locationInView:", WeakRetained);
      v4 = v7;
      v5 = v8;
    }
  }

  v9 = v4;
  v10 = v5;
  result.y = v10;
  result.x = v9;
  return result;
}

- (void)_handlePanGesture:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  unint64_t v11;
  double v12;
  double v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  double v17;
  NSObject *v18;
  id WeakRetained;
  double v20;
  double v21;
  _QWORD v22[4];
  id v23;
  _BYTE location[12];
  __int16 v25;
  double v26;
  __int16 v27;
  double v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLSwipeInteraction setPerformingSwipeHinting:](self, "setPerformingSwipeHinting:", 0);
  -[PLSwipeInteraction delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "swipeInteractionDidSignificantUserInteraction:", self);
  if (-[PLSwipeInteraction _shouldContinuePresentingActionButtons](self, "_shouldContinuePresentingActionButtons"))
  {
    -[PLSwipeInteraction _panHorizontalTranslation](self, "_panHorizontalTranslation");
    v7 = v6;
    -[PLSwipeInteraction _panHorizontalVelocity](self, "_panHorizontalVelocity");
    v9 = v8;
    v10 = objc_msgSend(v4, "state");
    switch(v10)
    {
      case 3:
        -[PLSwipeInteraction _updateActionRevealStateForTargetPosition:currentPosition:velocity:](self, "_updateActionRevealStateForTargetPosition:currentPosition:velocity:", v7 + self->_panGestureStartingPosition + v9 * 0.05, v7 + self->_panGestureStartingPosition, v9);
        if (v12 == 0.0)
        {
          -[PLSwipeInteraction _hideAnimated:fastAnimation:velocity:completion:](self, "_hideAnimated:fastAnimation:velocity:completion:", 1, 0, 0, v9);
        }
        else
        {
          v17 = v12;
          objc_initWeak((id *)location, self);
          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = __40__PLSwipeInteraction__handlePanGesture___block_invoke;
          v22[3] = &unk_1E91D3278;
          objc_copyWeak(&v23, (id *)location);
          -[PLSwipeInteraction _revealToPosition:animated:fastAnimation:velocity:completion:](self, "_revealToPosition:animated:fastAnimation:velocity:completion:", 1, 0, v22, v17, v9);
          objc_destroyWeak(&v23);
          objc_destroyWeak((id *)location);
        }
        break;
      case 2:
        v13 = v7 + self->_panGestureStartingPosition;
        v14 = -[PLSwipeInteraction _interfaceEdgeToPresentOnForAbsoluteTranslation:](self, "_interfaceEdgeToPresentOnForAbsoluteTranslation:", v13);
        if (v14)
        {
          v15 = v14;
          v16 = -[PLSwipeInteraction _layoutLocationForInterfaceEdge:](self, "_layoutLocationForInterfaceEdge:", v14);
          if (-[PLActionButtonsPresentingView layoutLocation](self->_actionButtonsPresentingView, "layoutLocation") != v16
            || -[PLActionButtonsPresentingView interfaceEdge](self->_actionButtonsPresentingView, "interfaceEdge") != v15)
          {
            -[PLSwipeInteraction _removeActionButtons](self, "_removeActionButtons");
            -[PLSwipeInteraction _addActionButtonViewsAtLayoutLocation:interfaceEdge:](self, "_addActionButtonViewsAtLayoutLocation:interfaceEdge:", v16, v15);
          }
        }
        -[PLSwipeInteraction _setViewPosition:withVelocity:usingNonInteractiveSpring:animated:completion:](self, "_setViewPosition:withVelocity:usingNonInteractiveSpring:animated:completion:", 0, 0, 0, v13, 0.0);
        break;
      case 1:
        if (self->_actionButtonsPresentingView)
          goto LABEL_22;
        v11 = -[PLSwipeInteraction _interfaceEdgeToPresentOnForInitialPanTranslation:andInitialPanVelocity:](self, "_interfaceEdgeToPresentOnForInitialPanTranslation:andInitialPanVelocity:", v7, v9);
        if (v11)
        {
          -[PLSwipeInteraction _addActionButtonViewsAtLayoutLocation:interfaceEdge:](self, "_addActionButtonViewsAtLayoutLocation:interfaceEdge:", -[PLSwipeInteraction _layoutLocationForInterfaceEdge:](self, "_layoutLocationForInterfaceEdge:", v11), v11);
        }
        else
        {
          v18 = PLLogInteraction;
          if (os_log_type_enabled((os_log_t)PLLogInteraction, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)location = 138543874;
            *(_QWORD *)&location[4] = self;
            v25 = 2048;
            v26 = v9;
            v27 = 2048;
            v28 = v7;
            _os_log_impl(&dword_1D1285000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Cannot infer which side to reveal actions. Gesture translation: %f velocity: %f", location, 0x20u);
          }
        }
        if (self->_actionButtonsPresentingView)
        {
LABEL_22:
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v5, "swipeInteractionDidBeginRevealingActions:", self);
        }
        WeakRetained = objc_loadWeakRetained((id *)&self->_viewToMove);
        objc_msgSend(WeakRetained, "frame");
        v21 = v20;

        self->_panGestureStartingPosition = v21;
        -[PLSwipeInteraction _setViewPosition:withVelocity:usingNonInteractiveSpring:animated:completion:](self, "_setViewPosition:withVelocity:usingNonInteractiveSpring:animated:completion:", 0, 0, 0, v7 + v21, 0.0);
        break;
    }
  }
  else
  {
    -[PLSwipeInteraction hideActionsAnimated:fastAnimation:completion:](self, "hideActionsAnimated:fastAnimation:completion:", 1, 1, 0);
  }

}

void __40__PLSwipeInteraction__handlePanGesture___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_msgSend(WeakRetained, "_shouldContinuePresentingActionButtons") & 1) == 0)
    objc_msgSend(WeakRetained, "hideActionsAnimated:fastAnimation:completion:", 1, 1, 0);

}

- (double)_updateActionRevealStateForTargetPosition:(double)a3 currentPosition:(double)a4 velocity:(double)a5
{
  id WeakRetained;
  unint64_t v10;
  PLActionButtonsPresentingView *actionButtonsPresentingView;
  double v12;
  double v13;
  BOOL v14;
  uint64_t v15;
  BOOL v16;
  BOOL v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double Width;
  unint64_t v24;
  double v25;
  double v26;
  CGRect v28;

  WeakRetained = objc_loadWeakRetained((id *)&self->_viewToMove);
  v10 = -[PLActionButtonsPresentingView interfaceEdge](self->_actionButtonsPresentingView, "interfaceEdge");
  actionButtonsPresentingView = self->_actionButtonsPresentingView;
  v12 = 0.0;
  if (actionButtonsPresentingView)
  {
    v13 = fabs(a5);
    v14 = v10 == 2 ? a5 > 0.0 : a5 < 0.0;
    v15 = -[PLActionButtonsPresentingView interfaceEdge](actionButtonsPresentingView, "interfaceEdge");
    v16 = v13 > 100.0 && v14;
    v17 = fabs(a3) < 45.0 || v15 == 0;
    if (!v17 && !v16)
    {
      if (objc_msgSend(WeakRetained, "_shouldReverseLayoutDirection"))
        v18 = a4;
      else
        v18 = a3;
      -[PLActionButtonsPresentingView actionButtonsView](self->_actionButtonsPresentingView, "actionButtonsView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSwipeInteraction _actionButtonTriggerDistanceForView:](self, "_actionButtonTriggerDistanceForView:", v19);
      v21 = v20;
      objc_msgSend(v19, "defaultAction");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22 && fabs(v18) > v21)
      {
        objc_msgSend(WeakRetained, "bounds");
        Width = CGRectGetWidth(v28);
        v24 = -[PLActionButtonsPresentingView interfaceEdge](self->_actionButtonsPresentingView, "interfaceEdge");
        v25 = -(Width + 8.0);
      }
      else
      {
        objc_msgSend(v19, "defaultWidth");
        Width = v26 + 8.0;
        v24 = -[PLActionButtonsPresentingView interfaceEdge](self->_actionButtonsPresentingView, "interfaceEdge");
        v25 = -Width;
      }
      if (v24 == 2)
        v12 = v25;
      else
        v12 = Width;

    }
  }

  return v12;
}

- (void)_actuateFeedbackForDefaultActionLockedIfNecessary
{
  _UIStatesFeedbackGenerator *defaultActionFeedbackGenerator;
  uint64_t v4;

  if (!-[PLSwipeInteraction didPlayHaptic](self, "didPlayHaptic"))
  {
    -[PLSwipeInteraction setDidPlayHaptic:](self, "setDidPlayHaptic:", 1);
    defaultActionFeedbackGenerator = self->_defaultActionFeedbackGenerator;
    v4 = *MEMORY[0x1E0CEC1C8];
    -[PLSwipeInteraction _panLocation](self, "_panLocation");
    -[_UIStatesFeedbackGenerator transitionToState:ended:atLocation:](defaultActionFeedbackGenerator, "transitionToState:ended:atLocation:", v4, 1);
  }
}

- (void)_actuateFeedbackForDefaultActionUnlockedIfNecessary
{
  _UIStatesFeedbackGenerator *defaultActionFeedbackGenerator;
  uint64_t v4;

  if (-[PLSwipeInteraction didPlayHaptic](self, "didPlayHaptic"))
  {
    -[PLSwipeInteraction setDidPlayHaptic:](self, "setDidPlayHaptic:", 0);
    defaultActionFeedbackGenerator = self->_defaultActionFeedbackGenerator;
    v4 = *MEMORY[0x1E0CEC1D0];
    -[PLSwipeInteraction _panLocation](self, "_panLocation");
    -[_UIStatesFeedbackGenerator transitionToState:ended:atLocation:](defaultActionFeedbackGenerator, "transitionToState:ended:atLocation:", v4, 1);
  }
}

- (void)_addActionButtonsAndRevealAnimated:(BOOL)a3 fastAnimation:(BOOL)a4 layoutLocation:(unint64_t)a5 completion:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  void *v10;
  double v11;
  double v12;
  unint64_t v13;
  double v14;
  id v15;

  v7 = a4;
  v8 = a3;
  v15 = a6;
  -[PLSwipeInteraction _addActionButtonViewsAtLayoutLocation:interfaceEdge:](self, "_addActionButtonViewsAtLayoutLocation:interfaceEdge:", a5, -[PLSwipeInteraction _interfaceEdgeForLayoutLocation:](self, "_interfaceEdgeForLayoutLocation:", a5));
  -[PLActionButtonsPresentingView actionButtonsView](self->_actionButtonsPresentingView, "actionButtonsView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "defaultWidth");
  v12 = v11;

  v13 = -[PLActionButtonsPresentingView interfaceEdge](self->_actionButtonsPresentingView, "interfaceEdge");
  v14 = v12 + 8.0;
  if (v13 == 2)
    v14 = -(v12 + 8.0);
  -[PLSwipeInteraction _revealToPosition:animated:fastAnimation:velocity:completion:](self, "_revealToPosition:animated:fastAnimation:velocity:completion:", v8, v7, v15, v14, 0.0);

}

- (void)_revealToPosition:(double)a3 animated:(BOOL)a4 fastAnimation:(BOOL)a5 velocity:(double)a6 completion:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v8 = a5;
  v9 = a4;
  v12 = a7;
  -[PLSwipeInteraction delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v13, "swipeInteractionDidBeginRevealingActions:", self);
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__PLSwipeInteraction__revealToPosition_animated_fastAnimation_velocity_completion___block_invoke;
  v15[3] = &unk_1E91D35E0;
  objc_copyWeak(&v17, &location);
  v14 = v12;
  v16 = v14;
  -[PLSwipeInteraction _setViewPosition:withVelocity:usingNonInteractiveSpring:animated:completion:](self, "_setViewPosition:withVelocity:usingNonInteractiveSpring:animated:completion:", v8, v9, v15, a3, a6);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __83__PLSwipeInteraction__revealToPosition_animated_fastAnimation_velocity_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "swipeInteractionDidCompleteRevealingActions:", v5);
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
      (*(void (**)(void))(v4 + 16))();

    WeakRetained = v5;
  }

}

- (void)_hideAnimated:(BOOL)a3 fastAnimation:(BOOL)a4 velocity:(double)a5 completion:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v7 = a4;
  v8 = a3;
  v10 = a6;
  -[PLSwipeInteraction delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "swipeInteractionDidBeginHidingActions:", self);
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__PLSwipeInteraction__hideAnimated_fastAnimation_velocity_completion___block_invoke;
  v13[3] = &unk_1E91D35E0;
  objc_copyWeak(&v15, &location);
  v12 = v10;
  v14 = v12;
  -[PLSwipeInteraction _setViewPosition:withVelocity:usingNonInteractiveSpring:animated:completion:](self, "_setViewPosition:withVelocity:usingNonInteractiveSpring:animated:completion:", v7, v8, v13, 0.0, a5);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __70__PLSwipeInteraction__hideAnimated_fastAnimation_velocity_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "swipeInteractionDidCompleteHidingActions:", v5);
    objc_msgSend(v5, "setViewToMove:", 0);
    objc_msgSend(v5, "_removeActionButtons");
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
      (*(void (**)(void))(v4 + 16))();

    WeakRetained = v5;
  }

}

- (void)_setViewPosition:(double)a3 withVelocity:(double)a4 usingNonInteractiveSpring:(BOOL)a5 animated:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16[2];
  id location;

  v7 = a6;
  v8 = a5;
  v12 = a7;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __98__PLSwipeInteraction__setViewPosition_withVelocity_usingNonInteractiveSpring_animated_completion___block_invoke;
  v14[3] = &unk_1E91D3608;
  objc_copyWeak(v16, &location);
  v16[1] = *(id *)&a3;
  v13 = v12;
  v15 = v13;
  -[PLSwipeInteraction _setViewPositionHelper:withVelocity:usingNonInteractiveSpring:animated:completion:](self, "_setViewPositionHelper:withVelocity:usingNonInteractiveSpring:animated:completion:", v8, v7, v14, a3, a4);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

}

void __98__PLSwipeInteraction__setViewPosition_withVelocity_usingNonInteractiveSpring_animated_completion___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 12);
    v4 = v3;
    if (v3)
    {
      v5 = *(double *)(a1 + 48);
      objc_msgSend(v3, "frame");
      if (v5 != v6)
      {
        objc_msgSend(v4, "frame");
        objc_msgSend(v4, "setFrame:", *(double *)(a1 + 48));
      }
    }
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      (*(void (**)(void))(v7 + 16))();

    WeakRetained = v8;
  }

}

- (void)_setViewPositionHelper:(double)a3 withVelocity:(double)a4 usingNonInteractiveSpring:(BOOL)a5 animated:(BOOL)a6 completion:(id)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  void (**v12)(_QWORD);
  id animationCompletion;
  id performWithoutRetargetingAnimationCompletion;
  UIViewFloatAnimatableProperty *v15;
  double v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  id v29;
  id location;
  _QWORD v31[4];
  UIViewFloatAnimatableProperty *v32;
  double v33;

  v7 = a6;
  v8 = a5;
  v12 = (void (**)(_QWORD))a7;
  animationCompletion = self->_animationCompletion;
  self->_animationCompletion = 0;

  performWithoutRetargetingAnimationCompletion = self->_performWithoutRetargetingAnimationCompletion;
  self->_performWithoutRetargetingAnimationCompletion = 0;

  v15 = self->_targetPositionAnimatableProperty;
  -[UIViewFloatAnimatableProperty value](v15, "value");
  if (vabdd_f64(v16, a3) >= 2.22044605e-16)
  {
    v19 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __104__PLSwipeInteraction__setViewPositionHelper_withVelocity_usingNonInteractiveSpring_animated_completion___block_invoke;
    v31[3] = &unk_1E91D3428;
    v32 = v15;
    v33 = a3;
    v20 = (void *)MEMORY[0x1D17E5ED8](v31);
    v21 = (void *)MEMORY[0x1D17E5ED8](v12);
    if (v7)
    {
      v22 = self->_animationCompletion;
      self->_animationCompletion = v21;

      ++self->_animationCount;
      objc_initWeak(&location, self);
      v25 = v19;
      v26 = 3221225472;
      v27 = __104__PLSwipeInteraction__setViewPositionHelper_withVelocity_usingNonInteractiveSpring_animated_completion___block_invoke_2;
      v28 = &unk_1E91D3630;
      objc_copyWeak(&v29, &location);
      v23 = (void *)MEMORY[0x1D17E5ED8](&v25);
      if (v8)
        objc_msgSend(MEMORY[0x1E0CEABB0], "_animateUsingSpringInteractive:animations:completion:", 0, v20, v23, v25, v26, v27, v28);
      else
        objc_msgSend(MEMORY[0x1E0CEABB0], "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v20, v23, fabs(a4) * 0.1 + 180.0, 25.0, v25, v26, v27, v28);

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
    else
    {
      v24 = self->_performWithoutRetargetingAnimationCompletion;
      self->_performWithoutRetargetingAnimationCompletion = v21;

      objc_msgSend(MEMORY[0x1E0CEABB0], "_performWithoutRetargetingAnimations:", v20);
    }

    v18 = v32;
LABEL_12:

    goto LABEL_13;
  }
  if (v12)
  {
    if (!self->_animationCount)
    {
      v12[2](v12);
      goto LABEL_13;
    }
    v17 = (void *)MEMORY[0x1D17E5ED8](v12);
    v18 = self->_animationCompletion;
    self->_animationCompletion = v17;
    goto LABEL_12;
  }
LABEL_13:

}

uint64_t __104__PLSwipeInteraction__setViewPositionHelper_withVelocity_usingNonInteractiveSpring_animated_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:", *(double *)(a1 + 40));
}

void __104__PLSwipeInteraction__setViewPositionHelper_withVelocity_usingNonInteractiveSpring_animated_completion___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v2;
  void (**v3)(_QWORD);
  void *v4;
  BOOL v5;
  _QWORD *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained[8];
    if (v2)
      WeakRetained[8] = v2 - 1;
    v6 = WeakRetained;
    v3 = (void (**)(_QWORD))MEMORY[0x1D17E5ED8](WeakRetained[6]);
    v4 = (void *)v6[6];
    v6[6] = 0;

    if (v6[8])
      v5 = 1;
    else
      v5 = v3 == 0;
    if (!v5)
      v3[2](v3);

    WeakRetained = v6;
  }

}

- (double)_actionButtonTriggerDistanceForView:(id)a3
{
  UIView **p_viewToMove;
  id v4;
  id WeakRetained;
  double Width;
  double v7;
  double v8;
  CGRect v10;

  p_viewToMove = &self->_viewToMove;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_viewToMove);
  objc_msgSend(WeakRetained, "bounds");
  Width = CGRectGetWidth(v10);

  objc_msgSend(v4, "defaultWidth");
  v8 = v7;

  return fmax(Width * 0.5, (v8 + 8.0) * 1.1);
}

- (void)_setupContentOffsetFloatAnimatableProperty
{
  UIViewFloatAnimatableProperty *v3;
  UIViewFloatAnimatableProperty *targetPositionAnimatableProperty;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v3 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
  targetPositionAnimatableProperty = self->_targetPositionAnimatableProperty;
  self->_targetPositionAnimatableProperty = v3;

  -[UIViewFloatAnimatableProperty setValue:](self->_targetPositionAnimatableProperty, "setValue:", 0.0);
  v5 = (void *)MEMORY[0x1E0CEABB0];
  v10[0] = self->_targetPositionAnimatableProperty;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__PLSwipeInteraction__setupContentOffsetFloatAnimatableProperty__block_invoke;
  v7[3] = &unk_1E91D3278;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v5, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __64__PLSwipeInteraction__setupContentOffsetFloatAnimatableProperty__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((_QWORD *)WeakRetained + 3);
    if (v3)
    {
      v4 = v2;
      objc_msgSend(v3, "presentationValue");
      objc_msgSend(v4, "_updateTargetPosition:");
      v2 = v4;
    }
  }

}

- (void)_updateTargetPosition:(double)a3
{
  -[PLSwipeInteraction _updatePosition:](self, "_updatePosition:");
  -[PLSwipeInteraction _updateActionButtonRevealPercentageForTargetPosition:](self, "_updateActionButtonRevealPercentageForTargetPosition:", a3);
}

- (void)_updatePosition:(double)a3
{
  void *v5;
  void (**v6)(_QWORD);
  id performWithoutRetargetingAnimationCompletion;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_viewToMove);
  objc_msgSend(WeakRetained, "frame");
  objc_msgSend(WeakRetained, "setFrame:", a3);
  -[PLSwipeInteraction delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "swipeInteraction:didMoveToNewXPosition:", self, a3);
  v6 = (void (**)(_QWORD))MEMORY[0x1D17E5ED8](self->_performWithoutRetargetingAnimationCompletion);
  performWithoutRetargetingAnimationCompletion = self->_performWithoutRetargetingAnimationCompletion;
  self->_performWithoutRetargetingAnimationCompletion = 0;

  if (v6)
    v6[2](v6);

}

- (void)_updateActionButtonRevealPercentageForTargetPosition:(double)a3
{
  double Width;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id WeakRetained;
  CGRect v15;

  WeakRetained = objc_loadWeakRetained((id *)&self->_viewToMove);
  objc_msgSend(WeakRetained, "bounds");
  Width = CGRectGetWidth(v15);
  -[PLActionButtonsPresentingView actionButtonsView](self->_actionButtonsPresentingView, "actionButtonsView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = fabs(a3);
  if (v8 <= 8.0)
  {
    -[PLSwipeInteraction _updateRevealPercentage:](self, "_updateRevealPercentage:", 0.0);
    objc_msgSend(v7, "setHighlightDefaultActionButton:", 0);
  }
  else
  {
    if (v6)
    {
      objc_msgSend(v6, "defaultWidth");
      if (v9 > 0.0)
      {
        objc_msgSend(v7, "defaultWidth");
        -[PLSwipeInteraction _updateRevealPercentage:](self, "_updateRevealPercentage:", (v8 + -8.0) / v10);
      }
    }
    -[PLSwipeInteraction _actionButtonTriggerDistanceForView:](self, "_actionButtonTriggerDistanceForView:", v7);
    v12 = v11;
    objc_msgSend(v7, "setHighlightDefaultActionButton:", v8 > v11);
    if (v8 > v12 && (unint64_t)objc_msgSend(v7, "actionButtonCount") >= 2)
      -[PLSwipeInteraction _actuateFeedbackForDefaultActionLockedIfNecessary](self, "_actuateFeedbackForDefaultActionLockedIfNecessary");
    if (-[UIPanGestureRecognizer state](self->_panGestureRecognizer, "state") != 2
      && v8 > Width * 0.98
      && !-[PLActionButtonsPresentingView defaultActionTriggered](self->_actionButtonsPresentingView, "defaultActionTriggered"))
    {
      objc_msgSend(v7, "defaultAction");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "performWithSender:target:", self, 0);
      -[PLActionButtonsPresentingView setDefaultActionTriggered:](self->_actionButtonsPresentingView, "setDefaultActionTriggered:", 1);

    }
  }

}

- (void)_updateRevealPercentage:(double)a3
{
  PLActionButtonsPresentingView *actionButtonsPresentingView;
  double v6;
  double v7;
  id WeakRetained;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  unint64_t v17;
  double v18;
  void *v19;
  char v20;
  id *v21;
  NSString *v22;
  double v23;
  double v24;
  double v25;
  double Height;
  NSString *v27;
  _BOOL4 IsAccessibilityCategory;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double MaxX;
  double v40;
  double v41;
  double v42;
  id v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  actionButtonsPresentingView = self->_actionButtonsPresentingView;
  if (a3 <= 0.0)
  {
    -[PLActionButtonsPresentingView setHidden:](actionButtonsPresentingView, "setHidden:", 1);
  }
  else
  {
    -[PLActionButtonsPresentingView setHidden:](actionButtonsPresentingView, "setHidden:", 0);
    -[PLActionButtonsPresentingView actionButtonsView](self->_actionButtonsPresentingView, "actionButtonsView");
    v43 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "defaultWidth");
    if (v6 * a3 >= 30.0)
      v7 = v6 * a3;
    else
      v7 = 30.0;
    -[PLActionButtonsPresentingView setAlpha:](self->_actionButtonsPresentingView, "setAlpha:", fmin(a3, 1.0) * ((v7 + -30.0) / (v6 * 0.5 + -30.0)));
    WeakRetained = objc_loadWeakRetained((id *)&self->_viewToMove);
    objc_msgSend(WeakRetained, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[PLActionButtonsPresentingView frame](self->_actionButtonsPresentingView, "frame");
    v17 = -[PLActionButtonsPresentingView interfaceEdge](self->_actionButtonsPresentingView, "interfaceEdge");
    v18 = 0.0;
    if (v17 == 2)
    {
      v44.origin.x = v10;
      v44.origin.y = v12;
      v44.size.width = v14;
      v44.size.height = v16;
      v18 = CGRectGetWidth(v44) - v7;
    }
    -[PLActionButtonsPresentingView actionButtonsView](self->_actionButtonsPresentingView, "actionButtonsView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isVerticallyStacked");

    if ((v20 & 1) != 0)
    {
      v21 = (id *)MEMORY[0x1E0CEB258];
      objc_msgSend((id)*MEMORY[0x1E0CEB258], "preferredContentSizeCategory");
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (UIContentSizeCategoryIsAccessibilityCategory(v22))
        v23 = 0.0;
      else
        v23 = 0.2;
      v45.origin.x = v10;
      v45.origin.y = v12;
      v45.size.width = v14;
      v45.size.height = v16;
      v24 = v23 * CGRectGetHeight(v45);
      v46.origin.x = v10;
      v46.origin.y = v12;
      v46.size.width = v14;
      v46.size.height = v16;
      v25 = v24 + CGRectGetMinY(v46);

      v47.origin.x = v10;
      v47.origin.y = v12;
      v47.size.width = v14;
      v47.size.height = v16;
      Height = CGRectGetHeight(v47);
      objc_msgSend(*v21, "preferredContentSizeCategory");
      v27 = (NSString *)objc_claimAutoreleasedReturnValue();
      IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v27);
      v29 = 0.6;
      if (IsAccessibilityCategory)
        v29 = 1.0;
      v30 = Height * v29;

    }
    else
    {
      v48.origin.x = v10;
      v48.origin.y = v12;
      v48.size.width = v14;
      v48.size.height = v16;
      v25 = CGRectGetMinY(v48) + 0.0;
      v49.origin.x = v10;
      v49.origin.y = v12;
      v49.size.width = v14;
      v49.size.height = v16;
      v30 = CGRectGetHeight(v49);
    }
    -[PLActionButtonsPresentingView setFrame:](self->_actionButtonsPresentingView, "setFrame:", v18, v25, v7, v30);
    objc_msgSend(v43, "setStretchedWidth:", v7);
    objc_msgSend(v43, "setNeedsLayout");
    objc_msgSend(v43, "sizeToFit");
    objc_msgSend(v43, "frame");
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;
    -[PLActionButtonsPresentingView bounds](self->_actionButtonsPresentingView, "bounds");
    MaxX = CGRectGetMaxX(v50);
    v51.origin.x = v32;
    v51.origin.y = v34;
    v51.size.width = v36;
    v51.size.height = v38;
    v40 = MaxX - CGRectGetWidth(v51);
    if (v17 == 2)
      v41 = v40;
    else
      v41 = *MEMORY[0x1E0C9D538];
    if (v17 == 2)
      v42 = 0.0;
    else
      v42 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v52.origin.x = v41;
    v52.origin.y = v42;
    v52.size.width = v36;
    v52.size.height = v38;
    objc_msgSend(v43, "setFrame:", v41, v42, CGRectGetWidth(v52), v30);

  }
}

- (void)_addActionButtonViewsAtLayoutLocation:(unint64_t)a3 interfaceEdge:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  id v19;
  id WeakRetained;
  uint64_t v21;
  PLPlatterActionButtonsView *v22;
  PLPlatterActionButtonsView *v23;
  void *v24;
  void *v25;
  PLActionButtonsPresentingView *v26;
  PLActionButtonsPresentingView *actionButtonsPresentingView;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[PLSwipeInteraction delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || !objc_msgSend(v7, "swipeInteraction:shouldRevealActionsFromLayoutLocation:", self, a3))
  {
    goto LABEL_26;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "swipeInteraction:actionsToRevealFromLayoutLocation:", self, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && objc_msgSend(v8, "count"))
      goto LABEL_10;
  }
  else
  {
    v9 = 0;
  }
  if (os_log_type_enabled((os_log_t)PLLogInteraction, OS_LOG_TYPE_DEBUG))
    -[PLSwipeInteraction _addActionButtonViewsAtLayoutLocation:interfaceEdge:].cold.4();
LABEL_10:
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  v12 = v10;
  if (v11)
  {
    v13 = v11;
    v14 = 0;
    v15 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v10);
        v14 += objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "pl_isDefaultAction", (_QWORD)v28);
      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v13);

    if (v14 < 2)
      goto LABEL_22;
    if (os_log_type_enabled((os_log_t)PLLogInteraction, OS_LOG_TYPE_DEBUG))
      -[PLSwipeInteraction _addActionButtonViewsAtLayoutLocation:interfaceEdge:].cold.3();
    v12 = 0;
  }

  v10 = v12;
LABEL_22:
  if ((unint64_t)objc_msgSend(v10, "count", (_QWORD)v28) < 5)
    goto LABEL_27;
  if (os_log_type_enabled((os_log_t)PLLogInteraction, OS_LOG_TYPE_DEBUG))
    -[PLSwipeInteraction _addActionButtonViewsAtLayoutLocation:interfaceEdge:].cold.2();

LABEL_26:
  v10 = 0;
LABEL_27:
  if (!objc_msgSend(v10, "count"))
  {
LABEL_36:
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    v18 = 0;
LABEL_37:

    goto LABEL_38;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v7, "viewToMoveForSwipeInteraction:", self), (v17 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (os_log_type_enabled((os_log_t)PLLogInteraction, OS_LOG_TYPE_DEBUG))
      -[PLSwipeInteraction _addActionButtonViewsAtLayoutLocation:interfaceEdge:].cold.1();
    goto LABEL_36;
  }
  v18 = (void *)v17;
  v19 = objc_loadWeakRetained((id *)&self->_view);
  if (v19)
  {
    WeakRetained = v19;
    objc_storeWeak((id *)&self->_viewToMove, v18);
    if ((unint64_t)objc_msgSend(v10, "count") >= 2 && (objc_opt_respondsToSelector() & 1) != 0)
      v21 = objc_msgSend(v7, "shouldVerticallyStackButtonsForSwipeInteraction:", self);
    else
      v21 = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "buttonsCornerRadiusForSwipeInteraction:", self);
    v22 = [PLPlatterActionButtonsView alloc];
    objc_msgSend(WeakRetained, "bounds");
    v23 = -[PLPlatterActionButtonsView initWithFrame:actions:cornerRadius:shouldVerticallyStack:](v22, "initWithFrame:actions:cornerRadius:shouldVerticallyStack:", v10, v21);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[PLPlatterActionButtonsView setMaterialGroupNameBase:](v23, "setMaterialGroupNameBase:", self->_materialGroupNameBase);
      -[PLPlatterActionButtonsView setBackgroundMaterialRecipe:](v23, "setBackgroundMaterialRecipe:", objc_msgSend(v7, "buttonsRecipeForSwipeInteraction:", self));
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "buttonsTintColorForSwipeInteraction:", self);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPlatterActionButtonsView setBackgroundTintColor:](v23, "setBackgroundTintColor:", v24);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "buttonsTextColorForSwipeInteraction:", self);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPlatterActionButtonsView setTextColor:](v23, "setTextColor:", v25);

    }
    v26 = -[PLActionButtonsPresentingView initWithActionButtonsView:interfaceEdge:layoutLocation:]([PLActionButtonsPresentingView alloc], "initWithActionButtonsView:interfaceEdge:layoutLocation:", v23, a4, a3);
    actionButtonsPresentingView = self->_actionButtonsPresentingView;
    self->_actionButtonsPresentingView = v26;

    objc_msgSend(WeakRetained, "addSubview:", self->_actionButtonsPresentingView);
    objc_msgSend(WeakRetained, "sendSubviewToBack:", self->_actionButtonsPresentingView);

    goto LABEL_37;
  }
LABEL_38:

}

- (void)_removeActionButtons
{
  PLActionButtonsPresentingView *actionButtonsPresentingView;

  -[PLActionButtonsPresentingView removeFromSuperview](self->_actionButtonsPresentingView, "removeFromSuperview");
  actionButtonsPresentingView = self->_actionButtonsPresentingView;
  self->_actionButtonsPresentingView = 0;

  -[PLSwipeInteraction setDidPlayHaptic:](self, "setDidPlayHaptic:", 0);
}

- (void)setPerformingSwipeHinting:(BOOL)a3
{
  id swipeHintingHideAnimationBlock;

  if (self->_performingSwipeHinting != a3)
  {
    self->_performingSwipeHinting = a3;
    if (!a3)
    {
      dispatch_block_cancel(self->_swipeHintingHideAnimationBlock);
      swipeHintingHideAnimationBlock = self->_swipeHintingHideAnimationBlock;
      self->_swipeHintingHideAnimationBlock = 0;

    }
  }
}

- (void)_performSwipeHintingForLayoutLocation:(unint64_t)a3
{
  dispatch_block_t v5;
  id swipeHintingHideAnimationBlock;
  dispatch_time_t v7;
  _QWORD v8[4];
  id v9;
  id location;

  if (self->_actionButtonsPresentingView)
  {
    -[PLSwipeInteraction hideActionsAnimated:fastAnimation:completion:](self, "hideActionsAnimated:fastAnimation:completion:", 1, 0, 0);
  }
  else
  {
    -[PLSwipeInteraction setPerformingSwipeHinting:](self, "setPerformingSwipeHinting:", 1);
    -[PLSwipeInteraction _addActionButtonsAndRevealAnimated:fastAnimation:layoutLocation:completion:](self, "_addActionButtonsAndRevealAnimated:fastAnimation:layoutLocation:completion:", 1, 0, a3, 0);
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__PLSwipeInteraction__performSwipeHintingForLayoutLocation___block_invoke;
    v8[3] = &unk_1E91D3278;
    objc_copyWeak(&v9, &location);
    v5 = dispatch_block_create((dispatch_block_flags_t)0, v8);
    swipeHintingHideAnimationBlock = self->_swipeHintingHideAnimationBlock;
    self->_swipeHintingHideAnimationBlock = v5;

    v7 = dispatch_time(0, 3000000000);
    dispatch_after(v7, MEMORY[0x1E0C80D38], self->_swipeHintingHideAnimationBlock);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __60__PLSwipeInteraction__performSwipeHintingForLayoutLocation___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  int v3;
  _BYTE *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "isPerformingSwipeHinting");
    v2 = v4;
    if (v3)
    {
      v4[72] = 0;
      objc_msgSend(v4, "hideActionsAnimated:fastAnimation:completion:", 1, 0, 0);
      v2 = v4;
    }
  }

}

- (NSString)materialGroupNameBase
{
  return self->_materialGroupNameBase;
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (UIView)viewToMove
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_viewToMove);
}

- (void)setViewToMove:(id)a3
{
  objc_storeWeak((id *)&self->_viewToMove, a3);
}

- (PLSwipeInteractionDelegate)delegate
{
  return (PLSwipeInteractionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isPerformingSwipeHinting
{
  return self->_performingSwipeHinting;
}

- (_UIStatesFeedbackGenerator)defaultActionFeedbackGenerator
{
  return self->_defaultActionFeedbackGenerator;
}

- (void)setDefaultActionFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_defaultActionFeedbackGenerator, a3);
}

- (BOOL)didPlayHaptic
{
  return self->_didPlayHaptic;
}

- (void)setDidPlayHaptic:(BOOL)a3
{
  self->_didPlayHaptic = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultActionFeedbackGenerator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_viewToMove);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);
  objc_storeStrong(&self->_performWithoutRetargetingAnimationCompletion, 0);
  objc_storeStrong(&self->_animationCompletion, 0);
  objc_storeStrong(&self->_swipeHintingHideAnimationBlock, 0);
  objc_storeStrong((id *)&self->_actionButtonsPresentingView, 0);
  objc_storeStrong((id *)&self->_targetPositionAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
}

- (void)_addActionButtonViewsAtLayoutLocation:interfaceEdge:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D1285000, v0, v1, "%{public}@: Must provide view to present actions in", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_addActionButtonViewsAtLayoutLocation:interfaceEdge:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D1285000, v0, v1, "%{public}@: Must provide 4 or less actions per location", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_addActionButtonViewsAtLayoutLocation:interfaceEdge:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D1285000, v0, v1, "%{public}@: Must provide only one UIAction with defaultAction=YES per location", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_addActionButtonViewsAtLayoutLocation:interfaceEdge:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D1285000, v0, v1, "%{public}@: Must provide actions for reveal", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
