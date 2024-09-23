@implementation SBBarSwipeAffordanceView

- (SBKeyboardHomeAffordanceAssertion)keyboardHomeAffordanceAssertion
{
  return self->_keyboardHomeAffordanceAssertion;
}

- (void)setKeyboardHomeAffordanceAssertion:(id)a3
{
  SBKeyboardHomeAffordanceAssertion *v5;
  SBKeyboardHomeAffordanceAssertion **p_keyboardHomeAffordanceAssertion;
  SBKeyboardHomeAffordanceAssertion *keyboardHomeAffordanceAssertion;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  SBKeyboardHomeAffordanceAssertion *v12;
  SBKeyboardHomeAffordanceAssertion *v13;

  v5 = (SBKeyboardHomeAffordanceAssertion *)a3;
  p_keyboardHomeAffordanceAssertion = &self->_keyboardHomeAffordanceAssertion;
  keyboardHomeAffordanceAssertion = self->_keyboardHomeAffordanceAssertion;
  if (keyboardHomeAffordanceAssertion != v5)
  {
    v13 = v5;
    if (v5)
    {
      objc_storeStrong((id *)&self->_keyboardHomeAffordanceAssertion, a3);
      -[SBBarSwipeAffordanceView grabberView](self, "grabberView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBBarSwipeAffordanceView _hideHomeAffordanceAnimationSettings](self, "_hideHomeAffordanceAnimationSettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v8;
      v11 = 1;
    }
    else
    {
      -[SBKeyboardHomeAffordanceAssertion invalidate](keyboardHomeAffordanceAssertion, "invalidate");
      v12 = *p_keyboardHomeAffordanceAssertion;
      *p_keyboardHomeAffordanceAssertion = 0;

      -[SBBarSwipeAffordanceView grabberView](self, "grabberView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBBarSwipeAffordanceView _unhideHomeAffordanceAnimationSettings](self, "_unhideHomeAffordanceAnimationSettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v8;
      v11 = 0;
    }
    objc_msgSend(v10, "setHidden:forReason:withAnimationSettings:", v11, CFSTR("SBBarSwipeAffordanceViewKeyboardVisible"), v9);

    v5 = v13;
  }

}

- (SBBarSwipeAffordanceView)initWithFrame:(CGRect)a3 systemGestureManager:(id)a4 enableGestures:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  double y;
  double x;
  id v12;
  SBBarSwipeAffordanceView *v13;
  SBBarSwipeAffordanceView *v14;
  uint64_t v15;
  char v16;
  BOOL v17;
  SBHomeGrabberView *v18;
  uint64_t v19;
  SBHomeGrabberView *grabberView;
  id v21;
  SBHomeGrabberView *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  SBFBarSwipeBehavior *barSwipeBehavior;
  void *v28;
  _QWORD v30[4];
  SBBarSwipeAffordanceView *v31;
  BOOL v32;
  char v33;
  objc_super v34;

  v5 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a4;
  v34.receiver = self;
  v34.super_class = (Class)SBBarSwipeAffordanceView;
  v13 = -[SBBarSwipeAffordanceView initWithFrame:](&v34, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_gestureManager, a4);
    v15 = SBFEffectiveHomeButtonType();
    objc_opt_class();
    v16 = objc_opt_isKindOfClass() & 1;
    v17 = v15 != 2;
    if (v15 == 2 || SBFEffectiveDeviceClass() == 2)
    {
      v18 = [SBHomeGrabberView alloc];
      v19 = -[SBHomeGrabberView initWithFrame:shouldEnableGestures:](v18, "initWithFrame:shouldEnableGestures:", v5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      grabberView = v14->_grabberView;
      v14->_grabberView = (SBHomeGrabberView *)v19;

      -[SBHomeGrabberView setDelegate:](v14->_grabberView, "setDelegate:", v14);
      -[SBHomeGrabberView setHomeAffordanceInteractionEnabled:](v14->_grabberView, "setHomeAffordanceInteractionEnabled:", v14->_active);
      -[SBBarSwipeAffordanceView addSubview:](v14, "addSubview:", v14->_grabberView);
      v21 = objc_alloc(MEMORY[0x1E0DA9DB8]);
      v22 = v14->_grabberView;
      +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "animationSettings");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "alertBarSwipeDismissalSettings");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v21, "initWithGrabberView:settleAffordanceAnimationBehaviorDescription:", v22, v25);
      barSwipeBehavior = v14->_barSwipeBehavior;
      v14->_barSwipeBehavior = (SBFBarSwipeBehavior *)v26;

      -[SBFBarSwipeBehavior setDelegate:](v14->_barSwipeBehavior, "setDelegate:", v14);
    }
    v28 = (void *)MEMORY[0x1E0CEABB0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __78__SBBarSwipeAffordanceView_initWithFrame_systemGestureManager_enableGestures___block_invoke;
    v30[3] = &unk_1E8EA1C70;
    v32 = v17;
    v33 = v16;
    v31 = v14;
    objc_msgSend(v28, "performWithoutAnimation:", v30);

  }
  return v14;
}

uint64_t __78__SBBarSwipeAffordanceView_initWithFrame_systemGestureManager_enableGestures___block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 40) || *(_BYTE *)(a1 + 41))
    objc_msgSend(*(id *)(a1 + 32), "setHomeAffordanceHidden:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_deactivate");
}

- (void)setPointerClickDelegate:(id)a3
{
  -[SBHomeGrabberView setPointerClickDelegate:](self->_grabberView, "setPointerClickDelegate:", a3);
}

- (SBHomeGrabberPointerClickDelegate)pointerClickDelegate
{
  return -[SBHomeGrabberView pointerClickDelegate](self->_grabberView, "pointerClickDelegate");
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  SBHomeGestureInteraction *homeGestureInteraction;
  SBHomeGestureInteraction *v7;
  SBHomeGestureInteraction *v8;
  SBHomeGestureInteraction *v9;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    v5 = obj;
    homeGestureInteraction = self->_homeGestureInteraction;
    if (obj)
    {
      if (!homeGestureInteraction)
      {
        v7 = -[SBHomeGestureInteraction initWithSystemGestureManager:delegate:]([SBHomeGestureInteraction alloc], "initWithSystemGestureManager:delegate:", self->_gestureManager, self);
        v8 = self->_homeGestureInteraction;
        self->_homeGestureInteraction = v7;

        -[SBHomeGestureInteraction setEnabled:](self->_homeGestureInteraction, "setEnabled:", self->_active);
LABEL_7:
        v5 = obj;
      }
    }
    else if (homeGestureInteraction)
    {
      -[SBHomeGestureInteraction invalidate](homeGestureInteraction, "invalidate");
      v9 = self->_homeGestureInteraction;
      self->_homeGestureInteraction = 0;

      goto LABEL_7;
    }
  }

}

- (int64_t)feedbackType
{
  return -[SBFBarSwipeBehavior feedbackType](self->_barSwipeBehavior, "feedbackType");
}

- (void)setFeedbackType:(int64_t)a3
{
  -[SBFBarSwipeBehavior setFeedbackType:](self->_barSwipeBehavior, "setFeedbackType:", a3);
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    if (a3)
      -[SBBarSwipeAffordanceView _activate](self, "_activate");
    else
      -[SBBarSwipeAffordanceView _deactivate](self, "_deactivate");
  }
}

- (int64_t)colorBias
{
  void *v2;
  int64_t v3;

  -[SBBarSwipeAffordanceView grabberView](self, "grabberView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "colorBias");

  return v3;
}

- (void)setColorBias:(int64_t)a3
{
  id v4;

  -[SBBarSwipeAffordanceView grabberView](self, "grabberView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColorBias:", a3);

}

- (BOOL)ignoresLuminance
{
  void *v2;
  char v3;

  -[SBBarSwipeAffordanceView grabberView](self, "grabberView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ignoresLuminance");

  return v3;
}

- (void)setIgnoresLuminance:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBBarSwipeAffordanceView grabberView](self, "grabberView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIgnoresLuminance:", v3);

}

- (void)setHomeAffordanceHidden:(BOOL)a3
{
  if (self->_homeAffordanceHidden != a3)
  {
    self->_homeAffordanceHidden = a3;
    -[SBBarSwipeAffordanceView _updateHomeAffordanceVisibility](self, "_updateHomeAffordanceVisibility");
  }
}

- (void)_updateHomeAffordanceVisibility
{
  id v3;

  -[SBBarSwipeAffordanceView grabberView](self, "grabberView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:forReason:withAnimationSettings:", self->_homeAffordanceHidden, CFSTR("SBBarSwipeAffordanceViewAlways"), 0);

}

- (BOOL)isTrackingHomeGestureOfType:(int64_t)a3
{
  return -[SBHomeGestureInteraction recognizedGestureType](self->_homeGestureInteraction, "recognizedGestureType") == a3;
}

- (void)_activate
{
  void *v3;
  void *v4;
  id v5;

  -[SBHomeGestureInteraction setEnabled:](self->_homeGestureInteraction, "setEnabled:", 1);
  -[SBBarSwipeAffordanceView grabberView](self, "grabberView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBBarSwipeAffordanceView _unhideHomeAffordanceAnimationSettings](self, "_unhideHomeAffordanceAnimationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:forReason:withAnimationSettings:", 0, CFSTR("SBBarSwipeAffordanceView"), v4);

  -[SBBarSwipeAffordanceView grabberView](self, "grabberView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHomeAffordanceInteractionEnabled:", 1);

}

- (void)_deactivate
{
  void *v3;
  void *v4;
  id v5;

  -[SBHomeGestureInteraction setEnabled:](self->_homeGestureInteraction, "setEnabled:", 0);
  -[SBBarSwipeAffordanceView grabberView](self, "grabberView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBBarSwipeAffordanceView _hideHomeAffordanceAnimationSettings](self, "_hideHomeAffordanceAnimationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:forReason:withAnimationSettings:", 1, CFSTR("SBBarSwipeAffordanceView"), v4);

  -[SBBarSwipeAffordanceView grabberView](self, "grabberView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHomeAffordanceInteractionEnabled:", 0);

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
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
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

- (void)_runBlockOnObservers:(id)a3
{
  NSHashTable *observers;
  id v4;
  id v5;

  observers = self->_observers;
  v4 = a3;
  -[NSHashTable allObjects](observers, "allObjects");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_each:", v4);

}

- (void)didAddSubview:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBBarSwipeAffordanceView;
  -[SBBarSwipeAffordanceView didAddSubview:](&v5, sel_didAddSubview_, a3);
  -[SBBarSwipeAffordanceView grabberView](self, "grabberView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBBarSwipeAffordanceView bringSubviewToFront:](self, "bringSubviewToFront:", v4);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
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
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)SBBarSwipeAffordanceView;
  -[SBBarSwipeAffordanceView layoutSubviews](&v20, sel_layoutSubviews);
  -[SBBarSwipeAffordanceView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[SBBarSwipeAffordanceView subviews](self, "subviews", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "setFrame:", v4, v6, v8, v10);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v13);
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[SBBarSwipeAffordanceView grabberView](self, "grabberView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BSRectWithSize();
  objc_msgSend(v3, "grabberFrameForBounds:");
  v5 = v4;
  v7 = v6;

  v8 = v7 + *MEMORY[0x1E0DAA368];
  v9 = v5;
  result.height = v8;
  result.width = v9;
  return result;
}

- (unint64_t)homeGestureInteraction:(id)a3 systemGestureTypeForType:(int64_t)a4
{
  id WeakRetained;
  unint64_t v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_msgSend(WeakRetained, "barSwipeAffordanceView:systemGestureTypeForType:", self, a4);

  return v7;
}

- (id)customScreenEdgePanGestureRecognizerForHomeGestureInteraction:(id)a3
{
  void *v4;

  +[SBHomeGesturePanGestureRecognizer homeGesturePanGestureRecognizerWithTarget:action:](SBHomeGesturePanGestureRecognizer, "homeGesturePanGestureRecognizerWithTarget:action:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterfaceDelegate:", self);
  objc_msgSend(v4, "setEdges:", 4);
  objc_msgSend(v4, "setAllowedTouchTypes:", &unk_1E91CE548);
  return v4;
}

- (void)homeGestureInteractionBegan:(id)a3
{
  -[SBFBarSwipeBehavior barSwipeInteractionBegan:](self->_barSwipeBehavior, "barSwipeInteractionBegan:", a3);
}

- (void)homeGestureInteractionChanged:(id)a3
{
  -[SBFBarSwipeBehavior barSwipeInteractionChanged:](self->_barSwipeBehavior, "barSwipeInteractionChanged:", a3);
}

- (void)homeGestureInteractionEnded:(id)a3
{
  -[SBFBarSwipeBehavior barSwipeInteractionEnded:](self->_barSwipeBehavior, "barSwipeInteractionEnded:", a3);
}

- (void)homeGestureInteractionCancelled:(id)a3
{
  -[SBFBarSwipeBehavior barSwipeInteractionCancelled:](self->_barSwipeBehavior, "barSwipeInteractionCancelled:", a3);
}

- (void)barSwipeBehaviorActionPerformed:(id)a3
{
  _QWORD v4[5];

  if (-[SBHomeGestureInteraction isEnabled](self->_homeGestureInteraction, "isEnabled", a3))
  {
    -[SBHomeGestureInteraction setEnabled:](self->_homeGestureInteraction, "setEnabled:", 0);
    -[SBHomeGestureInteraction setEnabled:](self->_homeGestureInteraction, "setEnabled:", 1);
  }
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__SBBarSwipeAffordanceView_barSwipeBehaviorActionPerformed___block_invoke;
  v4[3] = &unk_1E8EA6F20;
  v4[4] = self;
  -[SBBarSwipeAffordanceView _runBlockOnObservers:](self, "_runBlockOnObservers:", v4);
}

uint64_t __60__SBBarSwipeAffordanceView_barSwipeBehaviorActionPerformed___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "homeGesturePerformedForBarSwipeAffordanceView:", *(_QWORD *)(a1 + 32));
}

- (void)barSwipeBehavior:(id)a3 didUpdateAdditionalEdgeSpacing:(double)a4
{
  -[SBKeyboardHomeAffordanceAssertion setAdditionalEdgeMargin:](self->_keyboardHomeAffordanceAssertion, "setAdditionalEdgeMargin:", a3, a4);
}

- (int64_t)_effectiveOrientationAccountingForTransforms
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _BOOL4 v15;

  -[SBBarSwipeAffordanceView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBBarSwipeAffordanceView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBBarSwipeAffordanceView convertPoint:toView:](self, "convertPoint:toView:", v4, 1.0, 1.0);
  objc_msgSend(v3, "_convertPointToSceneReferenceSpace:");
  v6 = v5;
  v8 = v7;
  -[SBBarSwipeAffordanceView window](self, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBBarSwipeAffordanceView window](self, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBBarSwipeAffordanceView convertPoint:toView:](self, "convertPoint:toView:", v10, 0.0, 0.0);
  objc_msgSend(v9, "_convertPointToSceneReferenceSpace:");
  v12 = v6 - v11;
  v14 = v8 - v13;

  v15 = v12 <= 0.0;
  if (v12 > 0.0 && v14 > 0.0)
    return 1;
  if (v12 <= 0.0 && v14 <= 0.0)
    return 2;
  if (v14 > 0.0)
    v15 = 1;
  if (v15)
    return 3;
  else
    return 4;
}

- (double)additionalEdgeSpacingForHomeGrabberView:(id)a3
{
  double result;

  -[SBFBarSwipeBehavior grabberViewAdditionalEdgeSpacing](self->_barSwipeBehavior, "grabberViewAdditionalEdgeSpacing", a3);
  return result;
}

- (BOOL)shouldAllowThinStyleForHomeGrabberView:(id)a3
{
  return 0;
}

- (BOOL)shouldAllowAutoHideForHomeGrabberView:(id)a3
{
  return 0;
}

- (id)_hideHomeAffordanceAnimationSettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SBBarSwipeAffordanceView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3
    || (objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v3, "hideAnimationSettingsForBarSwipeAffordanceView:", self),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0DA9E28], "rootSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hideForHomeGestureOwnershipAnimationSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "BSAnimationSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)_unhideHomeAffordanceAnimationSettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SBBarSwipeAffordanceView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3
    || (objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v3, "unhideAnimationSettingsForBarSwipeAffordanceView:", self),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0DA9E28], "rootSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unhideForHomeGestureOwnershipAnimationSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "BSAnimationSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (SBBarSwipeAffordanceDelegate)delegate
{
  return (SBBarSwipeAffordanceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)isHomeAffordanceHidden
{
  return self->_homeAffordanceHidden;
}

- (SBHomeGrabberView)grabberView
{
  return self->_grabberView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grabberView, 0);
  objc_storeStrong((id *)&self->_keyboardHomeAffordanceAssertion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gestureManager, 0);
  objc_storeStrong((id *)&self->_homeGestureInteraction, 0);
  objc_storeStrong((id *)&self->_barSwipeBehavior, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
