@implementation _UISwipeHandler

- (_UISwipeHandler)initWithSwipeController:(id)a3
{
  id v4;
  _UISwipeHandler *v5;
  _UISwipeHandler *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UISwipeHandler;
  v5 = -[_UISwipeHandler init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[_UISwipeHandler setSwipeController:](v5, "setSwipeController:", v4);
    -[_UISwipeHandler _setUp](v6, "_setUp");
  }

  return v6;
}

- (void)setSwipeController:(id)a3
{
  objc_storeWeak((id *)&self->_swipeController, a3);
}

- (void)_setUp
{
  _UISwipeActionPanGestureRecognizer *v3;
  _UISwipeActionPanGestureRecognizer *swipeActionPanRecognizer;
  void *v5;
  void *v6;
  void *v7;
  _UISwipeDismissalGestureRecognizer *v8;
  _UISwipeDismissalGestureRecognizer *dismissalGestureRecognizer;
  _UIStatesFeedbackGenerator *v10;
  void *v11;
  _UIStatesFeedbackGenerator *v12;
  _UIStatesFeedbackGenerator *swipeFeedbackGenerator;
  id v14;

  v3 = -[_UISwipeActionPanGestureRecognizer initWithTarget:action:]([_UISwipeActionPanGestureRecognizer alloc], "initWithTarget:action:", self, sel__swipeRecognizerDidRecognize_);
  swipeActionPanRecognizer = self->_swipeActionPanRecognizer;
  self->_swipeActionPanRecognizer = v3;

  -[UIPanGestureRecognizer setDelegate:](self->_swipeActionPanRecognizer, "setDelegate:", self);
  -[UIPanGestureRecognizer _setCanPanVertically:](self->_swipeActionPanRecognizer, "_setCanPanVertically:", 0);
  -[UIPanGestureRecognizer _setHysteresis:](self->_swipeActionPanRecognizer, "_setHysteresis:", 25.0);
  -[UIGestureRecognizer setAllowedTouchTypes:](self->_swipeActionPanRecognizer, "setAllowedTouchTypes:", &unk_1E1A94BB0);
  -[_UISwipeHandler swipeController](self, "swipeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "swipeActionHost");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISwipeHandler swipeController](self, "swipeController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "gestureRecognizerViewForSwipeActionController:", v7);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addGestureRecognizer:", self->_swipeActionPanRecognizer);
  v8 = -[_UISwipeDismissalGestureRecognizer initWithTarget:action:]([_UISwipeDismissalGestureRecognizer alloc], "initWithTarget:action:", self, sel__dismissalRecognizerDidRecognize_);
  dismissalGestureRecognizer = self->_dismissalGestureRecognizer;
  self->_dismissalGestureRecognizer = v8;

  -[UIGestureRecognizer setDelegate:](self->_dismissalGestureRecognizer, "setDelegate:", self);
  -[UIGestureRecognizer setEnabled:](self->_dismissalGestureRecognizer, "setEnabled:", 0);
  objc_msgSend(v14, "addGestureRecognizer:", self->_dismissalGestureRecognizer);
  v10 = [_UIStatesFeedbackGenerator alloc];
  +[_UIStatesFeedbackGeneratorSwipeActionConfiguration defaultConfiguration](_UIStatesFeedbackGeneratorSwipeActionConfiguration, "defaultConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[_UIStatesFeedbackGenerator initWithConfiguration:view:](v10, "initWithConfiguration:view:", v11, v14);
  swipeFeedbackGenerator = self->_swipeFeedbackGenerator;
  self->_swipeFeedbackGenerator = v12;

  self->_active = 1;
}

- (UISwipeActionController)swipeController
{
  return (UISwipeActionController *)objc_loadWeakRetained((id *)&self->_swipeController);
}

- (void)resetSwipe
{
  self->_resetSwipeWhileInitiating = 1;
  self->_initialTranslation = 0.0;
  self->_confirmationTranslationAdjustment = 0.0;
  *(_OWORD *)&self->_currentSwipeConfig.direction = 0u;
  *(_OWORD *)&self->_currentSwipeConfig.openThreshold = 0u;
  self->_currentSwipeState = 0;
  -[UIGestureRecognizer setEnabled:](self->_dismissalGestureRecognizer, "setEnabled:", 0);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_swipeController);
  objc_storeStrong((id *)&self->_swipeFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_swipeActionPanRecognizer, 0);
  objc_storeStrong((id *)&self->_dismissalGestureRecognizer, 0);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[UIGestureRecognizer view](self->_swipeActionPanRecognizer, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeGestureRecognizer:", self->_swipeActionPanRecognizer);

  -[UIGestureRecognizer view](self->_dismissalGestureRecognizer, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeGestureRecognizer:", self->_dismissalGestureRecognizer);

  v5.receiver = self;
  v5.super_class = (Class)_UISwipeHandler;
  -[_UISwipeHandler dealloc](&v5, sel_dealloc);
}

- (BOOL)isInteracting
{
  UIGestureRecognizerState v3;

  v3 = -[UIGestureRecognizer state](self->_swipeActionPanRecognizer, "state");
  if (v3 != UIGestureRecognizerStateBegan)
    LOBYTE(v3) = -[UIGestureRecognizer state](self->_swipeActionPanRecognizer, "state") == UIGestureRecognizerStateChanged;
  return v3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  _UISwipeActionPanGestureRecognizer *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (_UISwipeActionPanGestureRecognizer *)a4;
  if (self->_dismissalGestureRecognizer == a3)
  {
    -[_UISwipeHandler swipeController](self, "swipeController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "containerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_swipeActionPanRecognizer == v6)
    {
      v7 = 1;
    }
    else
    {
      -[UIGestureRecognizer view](v6, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v10 == v9;

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  _UISwipeActionPanGestureRecognizer *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _UISwipeDismissalGestureRecognizer *dismissalGestureRecognizer;
  unint64_t v12;
  void *v13;
  char v14;
  uint64_t v15;
  char v16;
  void *v17;

  v4 = (_UISwipeActionPanGestureRecognizer *)a3;
  -[UIGestureRecognizer view](v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPanGestureRecognizer locationInView:](v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  if (self->_swipeActionPanRecognizer == v4)
  {
    v12 = -[_UISwipeHandler _directionForGestureRecognizer:](self, "_directionForGestureRecognizer:", v4);

    -[_UISwipeHandler swipeController](self, "swipeController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "swipeHandler:mayBeginSwipeAtLocation:withProposedDirection:", self, v12, v7, v9);

    return v14;
  }
  else
  {
    dismissalGestureRecognizer = self->_dismissalGestureRecognizer;

    if (dismissalGestureRecognizer == (_UISwipeDismissalGestureRecognizer *)v4)
    {
      -[_UISwipeHandler swipeController](self, "swipeController");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend((id)v15, "touchAtLocationShouldDismissSwipedItem:isTouchUp:", 1, v7, v9);

      -[_UISwipeHandler swipeController](self, "swipeController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v15) = objc_msgSend(v17, "touchAtLocationShouldDismissSwipedItem:isTouchUp:", 0, v7, v9);

      return v15 | v16;
    }
    else
    {
      return 1;
    }
  }
}

- (BOOL)gestureRecognizerShouldDismissForTouchUp:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[_UISwipeHandler swipeController](self, "swipeController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v10, "touchAtLocationShouldDismissSwipedItem:isTouchUp:", 1, v7, v9);

  return (char)v4;
}

- (void)_dismissalRecognizerDidRecognize:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
  {
    if (self->_currentSwipeConfig.direction)
      -[_UISwipeHandler _cancelExistingSwipe](self, "_cancelExistingSwipe");
  }
}

- (unint64_t)_directionForGestureRecognizer:(id)a3
{
  if (_UISwipeActionGestureRecognizerEffectiveVelocity(a3) < 0.0)
    return 1;
  else
    return 2;
}

- (void)_swipeRecognizerDidRecognize:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  unsigned int (**v7)(_QWORD);
  _UISwipeHandler *v8;
  id v9;
  uint64_t v10;
  _QWORD block[4];
  unsigned int (**v12)(_QWORD);
  _QWORD aBlock[5];
  id v14;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48___UISwipeHandler__swipeRecognizerDidRecognize___block_invoke;
  aBlock[3] = &unk_1E16D5FC0;
  aBlock[4] = self;
  v6 = v4;
  v14 = v6;
  v7 = (unsigned int (**)(_QWORD))_Block_copy(aBlock);
  switch(objc_msgSend(v6, "state"))
  {
    case 1:
      *(_BYTE *)&self->_flags &= 0xFCu;
      block[0] = v5;
      block[1] = 3221225472;
      block[2] = __48___UISwipeHandler__swipeRecognizerDidRecognize___block_invoke_2;
      block[3] = &unk_1E16B1BF8;
      v12 = v7;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      break;
    case 2:
      if (v7[2](v7))
        -[_UISwipeHandler _swipeRecognizerChanged:](self, "_swipeRecognizerChanged:", v6);
      break;
    case 3:
      if (v7[2](v7))
      {
        v8 = self;
        v9 = v6;
        v10 = 0;
        goto LABEL_7;
      }
      break;
    case 4:
      if (v7[2](v7))
      {
        v8 = self;
        v9 = v6;
        v10 = 1;
LABEL_7:
        -[_UISwipeHandler _swipeRecognizerEnded:wasCancelled:](v8, "_swipeRecognizerEnded:wasCancelled:", v9, v10);
      }
      break;
    default:
      break;
  }

}

- (BOOL)_swipeRecognizerBegan:(id)a3
{
  id v4;
  unint64_t direction;
  void *v6;
  void *v7;
  BOOL v8;
  unint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;

  v4 = a3;
  -[_UISwipeHandler _cancelExistingSwipeForGestureBeganIfNecessary:](self, "_cancelExistingSwipeForGestureBeganIfNecessary:", v4);
  direction = self->_currentSwipeConfig.direction;
  -[_UISwipeHandler swipeController](self, "swipeController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentSwipeOccurrence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (direction && v7)
  {
    if ((objc_msgSend(v7, "state") & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      v8 = 0;
      goto LABEL_10;
    }
  }
  else if (!direction)
  {
    v9 = -[_UISwipeHandler _directionForGestureRecognizer:](self, "_directionForGestureRecognizer:", v4);
    objc_msgSend(v4, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v10);
    v12 = v11;
    v14 = v13;

    -[_UISwipeHandler initiateSwipeWithDirection:configuration:location:userInitiated:](self, "initiateSwipeWithDirection:configuration:location:userInitiated:", v9, 0, 1, v12, v14);
  }
  if (self->_currentSwipeConfig.direction)
  {
    -[_UISwipeHandler swipeController](self, "swipeController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "swipeHandlerDidBeginSwipe:", self);

    -[_UISwipeHandler swipeFeedbackGenerator](self, "swipeFeedbackGenerator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activateWithCompletionBlock:", 0);

    -[UIGestureRecognizer setEnabled:](self->_dismissalGestureRecognizer, "setEnabled:", 0);
  }
  v8 = 1;
LABEL_10:

  return v8;
}

- (void)_swipeRecognizerChanged:(id)a3
{
  id v4;
  double v5;
  unint64_t v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double confirmationThreshold;
  double v15;
  BOOL primaryActionCanBeTriggeredBySwipe;
  unint64_t direction;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  double v25;
  id v26;
  double Width;
  id v28;
  double v29;
  double v30;
  unint64_t currentSwipeState;
  __CFString **v32;
  void *v33;
  double v34;
  double v35;
  float v36;
  double v37;
  float v38;
  void *v39;
  _BOOL4 v40;
  _BOOL4 v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v52;
  id v53;
  CGRect v54;
  CGRect v55;

  v4 = a3;
  if (!self->_currentSwipeConfig.direction)
    goto LABEL_42;
  v53 = v4;
  v5 = _UISwipeActionGestureRecognizerEffectiveTranslation(v4);
  v6 = -[UIPanGestureRecognizer _scrollDeviceCategory](v53) - 1;
  if (v6 <= 2)
    v5 = v5 / dbl_1866841D8[v6] * fabs(self->_currentSwipeConfig.confirmationThreshold);
  v7 = v5 + self->_initialTranslation + self->_confirmationTranslationAdjustment;
  objc_msgSend(v53, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "locationInView:", v8);
  v10 = v9;
  v12 = v11;

  v13 = _UISwipeActionGestureRecognizerEffectiveVelocity(v53);
  confirmationThreshold = self->_currentSwipeConfig.confirmationThreshold;
  v15 = -confirmationThreshold;
  if (confirmationThreshold >= 0.0)
    v15 = self->_currentSwipeConfig.confirmationThreshold;
  if (v15 > 0.0)
  {
    primaryActionCanBeTriggeredBySwipe = self->_currentSwipeConfig.primaryActionCanBeTriggeredBySwipe;
    if (!primaryActionCanBeTriggeredBySwipe)
      goto LABEL_21;
    direction = self->_currentSwipeConfig.direction;
    if (direction == 2 && confirmationThreshold <= v7)
    {
      v18 = 0;
      primaryActionCanBeTriggeredBySwipe = 1;
LABEL_11:
      v19 = 1;
      goto LABEL_23;
    }
    if (direction == 1 && confirmationThreshold >= v7)
      goto LABEL_15;
    primaryActionCanBeTriggeredBySwipe = self->_currentSwipeConfig.primaryActionIsDestructive;
    if (primaryActionCanBeTriggeredBySwipe)
    {
      -[_UISwipeHandler swipeController](self, "swipeController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "swipeActionHost");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UISwipeHandler swipeController](self, "swipeController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "itemContainerViewForSwipeActionController:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = self->_currentSwipeConfig.direction;
      v25 = self->_currentSwipeConfig.confirmationThreshold;
      v26 = v23;
      objc_msgSend(v26, "frame");
      Width = CGRectGetWidth(v54);
      v28 = v26;
      objc_msgSend(v28, "frame");
      v29 = CGRectGetWidth(v55);
      if (v29 >= 414.0)
      {
        objc_msgSend(v28, "traitCollection");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "userInterfaceIdiom") == 6;

        v30 = dbl_1866841F0[v40];
      }
      else if (v29 == 375.0)
      {
        v30 = 75.0;
      }
      else
      {
        v30 = 50.0;
      }

      if (v24 == 1)
      {
        v41 = v30 > v10;
      }
      else
      {
        objc_msgSend(v28, "frame");
        v41 = v42 - v30 < v10;
      }
      v43 = -v13;
      if (v13 >= 0.0)
        v43 = v13;
      v44 = 0.66;
      if (Width >= 414.0)
        v44 = 0.5;
      v45 = fmax(v44, v43 / 2500.0);
      v46 = 0.8;
      if (Width >= 414.0)
        v46 = 0.75;
      v47 = fmin(v45, v46);
      v48 = -v7;
      if (v7 >= 0.0)
        v48 = v7;
      v49 = -v25;
      if (v25 >= 0.0)
        v49 = v25;
      v50 = v48 - v49 * v47;

      if (v50 > 0.00000011920929 && v41)
      {
        if (self->_confirmationTranslationAdjustment == 0.0)
        {
          v52 = self->_currentSwipeConfig.confirmationThreshold - v7;
          self->_confirmationTranslationAdjustment = v52;
          v7 = v7 + v52;
          v18 = 1;
          primaryActionCanBeTriggeredBySwipe = 1;
          goto LABEL_11;
        }
LABEL_15:
        v18 = 0;
        v19 = 1;
        primaryActionCanBeTriggeredBySwipe = 1;
        goto LABEL_23;
      }
      v18 = 0;
      primaryActionCanBeTriggeredBySwipe = 0;
    }
    else
    {
LABEL_21:
      v18 = 0;
    }
    v19 = 0;
LABEL_23:
    currentSwipeState = self->_currentSwipeState;
    if (currentSwipeState != v19)
    {
      if (primaryActionCanBeTriggeredBySwipe)
      {
        v32 = &_UIStatesFeedbackGeneratorSwipeActionStateConfirm;
LABEL_28:
        -[_UISwipeHandler swipeFeedbackGenerator](self, "swipeFeedbackGenerator");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "transitionToState:ended:atLocation:", *v32, 1, v10, v12);

        goto LABEL_29;
      }
      if (currentSwipeState == 1)
      {
        v32 = _UIStatesFeedbackGeneratorSwipeActionStateOpen;
        goto LABEL_28;
      }
    }
LABEL_29:
    self->_currentSwipeState = v19;
    confirmationThreshold = self->_currentSwipeConfig.confirmationThreshold;
    goto LABEL_30;
  }
  v18 = 0;
LABEL_30:
  if (!self->_currentSwipeConfig.primaryActionCanBeTriggeredBySwipe)
    confirmationThreshold = self->_currentSwipeConfig.openThreshold;
  if (confirmationThreshold <= 0.0)
    v34 = confirmationThreshold;
  else
    v34 = 0.0;
  v35 = fmax(confirmationThreshold, 0.0);
  if (v7 <= v35)
  {
    if (v7 < v34)
    {
      v37 = v7 - v34;
      if (v7 - v34 < 0.0)
        v37 = -(v7 - v34);
      v38 = v37;
      v7 = v34 - powf(v38, 0.7);
    }
  }
  else
  {
    v36 = v7 - v35;
    v7 = v35 + powf(v36, 0.7);
  }
  -[_UISwipeHandler _moveSwipedItemToOffset:animated:usingSpringWithStiffness:isTracking:](self, "_moveSwipedItemToOffset:animated:usingSpringWithStiffness:isTracking:", v18, 1, v7, 1.0);
  v4 = v53;
LABEL_42:

}

- (void)_swipeRecognizerEnded:(id)a3 wasCancelled:(BOOL)a4
{
  id v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  double openThreshold;
  double v12;
  double v13;
  unint64_t direction;
  double v15;
  double v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  if (self->_currentSwipeConfig.direction)
  {
    self->_confirmationTranslationAdjustment = 0.0;
    v6 = a3;
    v7 = _UISwipeActionGestureRecognizerEffectiveVelocity(v6);
    v8 = _UISwipeActionGestureRecognizerEffectiveTranslation(v6);
    v9 = -[UIPanGestureRecognizer _scrollDeviceCategory](v6);

    if ((unint64_t)(v9 - 1) <= 2)
      v8 = v8 / dbl_1866841D8[v9 - 1] * fabs(self->_currentSwipeConfig.confirmationThreshold);
    if (!a4 && self->_currentSwipeState == 1)
    {
      self->_currentSwipeState = 2;
      v22 = 0u;
      v23 = 0u;
      v21 = 0u;
      -[_UISwipeHandler _currentSwipeInfoWithTargetOffset:animated:usingSpringWithStiffness:](self, "_currentSwipeInfoWithTargetOffset:animated:usingSpringWithStiffness:", 1, 0.0, 1.0);
      -[_UISwipeHandler swipeController](self, "swipeController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v21;
      v19 = v22;
      v20 = v23;
      objc_msgSend(v10, "swipeHandler:didConfirmSwipeWithInfo:", self, &v18);
LABEL_19:

LABEL_20:
      -[_UISwipeHandler swipeFeedbackGenerator](self, "swipeFeedbackGenerator");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "deactivate");

      return;
    }
    openThreshold = self->_currentSwipeConfig.openThreshold;
    v12 = -openThreshold;
    if (openThreshold >= 0.0)
      v12 = self->_currentSwipeConfig.openThreshold;
    if (v12 > 0.0)
    {
      v13 = -v7;
      if (v7 >= 0.0)
        v13 = v7;
      direction = self->_currentSwipeConfig.direction;
      if (v13 <= 50.0)
      {
        v15 = v8 + self->_initialTranslation;
        v16 = openThreshold * 0.5;
        if (direction == 1)
        {
          if (v15 >= v16)
            goto LABEL_18;
        }
        else if (v15 <= v16)
        {
          goto LABEL_18;
        }
LABEL_25:
        -[_UISwipeHandler _moveSwipedItemToOffset:animated:usingSpringWithStiffness:isTracking:](self, "_moveSwipedItemToOffset:animated:usingSpringWithStiffness:isTracking:", 1, 0, self->_currentSwipeConfig.openThreshold, 1.0);
        -[UIGestureRecognizer setEnabled:](self->_dismissalGestureRecognizer, "setEnabled:", 1);
        self->_initialTranslation = openThreshold;
        goto LABEL_20;
      }
      if (direction == 1)
      {
        if (v7 < -50.0)
          goto LABEL_25;
      }
      else if (v7 > 50.0)
      {
        goto LABEL_25;
      }
    }
LABEL_18:
    v22 = 0u;
    v23 = 0u;
    v21 = 0u;
    -[_UISwipeHandler _currentSwipeInfoWithTargetOffset:animated:usingSpringWithStiffness:](self, "_currentSwipeInfoWithTargetOffset:animated:usingSpringWithStiffness:", 1, 0.0, 1.0);
    -[_UISwipeHandler swipeController](self, "swipeController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v21;
    v19 = v22;
    v20 = v23;
    objc_msgSend(v10, "swipeHandler:didGenerateSwipeWithInfo:isTracking:", self, &v18, 0);
    goto LABEL_19;
  }
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    -[UIGestureRecognizer setEnabled:](self->_swipeActionPanRecognizer, "setEnabled:");
    if (!self->_active)
      -[UIGestureRecognizer setEnabled:](self->_dismissalGestureRecognizer, "setEnabled:", 0);
  }
}

- (void)initiateSwipeWithDirection:(unint64_t)a3 configuration:(id)a4 location:(CGPoint)a5 userInitiated:(BOOL)a6
{
  double y;
  double x;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;

  y = a5.y;
  x = a5.x;
  v11 = a4;
  -[_UISwipeHandler swipeController](self, "swipeController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "prepareForSwipeDirection:startingAtTouchLocation:", a3, x, y);

  self->_resetSwipeWhileInitiating = 0;
  v15 = 0u;
  v16 = 0u;
  -[_UISwipeHandler swipeController](self, "swipeController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "configureForSwipeDirection:configuration:startingAtTouchLocation:", a3, v11, x, y);
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
  }

  if (self->_resetSwipeWhileInitiating)
  {
    if (a6)
      goto LABEL_10;
  }
  else
  {
    *(_OWORD *)&self->_currentSwipeConfig.direction = v15;
    *(_OWORD *)&self->_currentSwipeConfig.openThreshold = v16;
    if (a6)
      goto LABEL_10;
  }
  if (self->_currentSwipeConfig.direction)
  {
    -[UIGestureRecognizer setEnabled:](self->_dismissalGestureRecognizer, "setEnabled:", 1);
    self->_initialTranslation = self->_currentSwipeConfig.openThreshold;
  }
LABEL_10:

}

- (void)_cancelExistingSwipeForGestureBeganIfNecessary:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  -[_UISwipeHandler currentSwipeConfig](self, "currentSwipeConfig");
  if (v5
    && -[_UISwipeHandler _delegateWantsToDismissOnTouchDownForGestureRecognizer:](self, "_delegateWantsToDismissOnTouchDownForGestureRecognizer:", v4))
  {
    -[_UISwipeHandler _cancelExistingSwipe](self, "_cancelExistingSwipe");
  }

}

- (void)_cancelExistingSwipe
{
  void *v2;
  id v3;

  -[_UISwipeHandler swipeController](self, "swipeController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentSwipeOccurrence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "state") & 0xFFFFFFFFFFFFFFFELL) != 4)
    objc_msgSend(v3, "resetSwipedItemAnimated:completion:", 1, 0);

}

- (BOOL)_delegateWantsToDismissOnTouchDownForGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[_UISwipeHandler swipeController](self, "swipeController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v10, "touchAtLocationShouldDismissSwipedItem:isTouchUp:", 0, v7, v9);

  return (char)v4;
}

- ($A7B7FA971CD029BAA4A09478E9E1AEDA)currentSwipeConfig
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var0;
  *(_OWORD *)&retstr->var3 = v3;
  return self;
}

- ($B18736ADBBD355D2E16F2B3CA0B0347D)_currentSwipeInfoWithTargetOffset:(SEL)a3 animated:(double)a4 usingSpringWithStiffness:(BOOL)a5
{
  unint64_t currentSwipeState;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  $B18736ADBBD355D2E16F2B3CA0B0347D *result;
  id v32;
  CGRect v33;
  CGRect v34;

  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  retstr->var2 = a5;
  currentSwipeState = self->_currentSwipeState;
  retstr->var0 = self->_currentSwipeConfig.direction;
  retstr->var1 = currentSwipeState;
  -[_UISwipeHandler swipeController](self, "swipeController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISwipeHandler swipeController](self, "swipeController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "swipedIndexPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_swipedViewForItemAtIndexPath:", v13);
  v32 = (id)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[_UISwipeHandler swipeController](self, "swipeController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "swipeHandlerRestingFrame:", self);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    v33.origin.x = v16;
    v33.origin.y = v18;
    v33.size.width = v20;
    v33.size.height = v22;
    v23 = 0.0;
    if (!CGRectIsNull(v33))
    {
      v34.origin.x = v16;
      v34.origin.y = v18;
      v34.size.width = v20;
      v34.size.height = v22;
      v24 = CGRectGetMidX(v34) + a4;
      v25 = _UISwipeActionGestureRecognizerEffectiveVelocity(self->_swipeActionPanRecognizer);
      objc_msgSend(v32, "layer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "presentationLayer");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "position");
      v29 = v28;

      v30 = -(v24 - v29);
      if (v24 - v29 >= 0.0)
        v30 = v24 - v29;
      if (v30 > 0.00000011920929)
        v23 = fmax(fmin(v25 / (v24 - v29), 200.0), 0.0);
    }
    retstr->var3 = a4;
    retstr->var4 = v23;
    retstr->var5 = a6;
  }

  return result;
}

- (void)_moveSwipedItemToOffset:(double)a3 animated:(BOOL)a4 usingSpringWithStiffness:(double)a5 isTracking:(BOOL)a6
{
  _BOOL8 v6;
  void *v8;
  _OWORD v9[3];
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v6 = a6;
  v11 = 0u;
  v12 = 0u;
  v10 = 0u;
  -[_UISwipeHandler _currentSwipeInfoWithTargetOffset:animated:usingSpringWithStiffness:](self, "_currentSwipeInfoWithTargetOffset:animated:usingSpringWithStiffness:", a4, a3, a5);
  -[_UISwipeHandler swipeController](self, "swipeController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v10;
  v9[1] = v11;
  v9[2] = v12;
  objc_msgSend(v8, "swipeHandler:didGenerateSwipeWithInfo:isTracking:", self, v9, v6);

}

- (unint64_t)currentSwipeState
{
  return self->_currentSwipeState;
}

- (_UIStatesFeedbackGenerator)swipeFeedbackGenerator
{
  return self->_swipeFeedbackGenerator;
}

- (void)setSwipeFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_swipeFeedbackGenerator, a3);
}

- (BOOL)isActive
{
  return self->_active;
}

@end
