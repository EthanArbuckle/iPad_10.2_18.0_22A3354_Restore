@implementation _UIKeyboardTextSelectionGestureController

- (_UIKeyboardTextSelectionGestureController)init
{
  _UIKeyboardTextSelectionGestureController *v2;
  NSMutableArray *v3;
  NSMutableArray *activeGestures;
  UITextMagnifierTimeWeightedPoint *v5;
  UITextMagnifierTimeWeightedPoint *weightedPoint;
  _UIStatesFeedbackGenerator *v7;
  _UIStatesFeedbackGenerator *feedbackBehaviour;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIKeyboardTextSelectionGestureController;
  v2 = -[_UIKeyboardTextSelectionGestureController init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    activeGestures = v2->_activeGestures;
    v2->_activeGestures = v3;

    v5 = objc_alloc_init(UITextMagnifierTimeWeightedPoint);
    weightedPoint = v2->_weightedPoint;
    v2->_weightedPoint = v5;

    v7 = -[_UIStatesFeedbackGenerator initWithStyle:]([_UIStatesFeedbackGenerator alloc], "initWithStyle:", 0);
    feedbackBehaviour = v2->_feedbackBehaviour;
    v2->_feedbackBehaviour = v7;

  }
  return v2;
}

- (id)addDeallocationHandler:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *deallocHandlers;
  void *v7;
  NSMutableArray *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (!self->_deallocHandlers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    deallocHandlers = self->_deallocHandlers;
    self->_deallocHandlers = v5;

  }
  v7 = (void *)objc_msgSend(v4, "copy");
  v8 = self->_deallocHandlers;
  v9 = _Block_copy(v7);
  -[NSMutableArray addObject:](v8, "addObject:", v9);

  v10 = _Block_copy(v7);
  return v10;
}

- (void)enableEnclosingScrollViewNestedPinching
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 *v9;
  id v10;

  -[_UIKeyboardTextSelectionGestureController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textSelectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_UIKeyboardTextSelectionGestureController selectionController](self, "selectionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textInputView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_scroller");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v7 = v10;
    if (v10)
    {
      objc_msgSend(v10, "pinchGestureRecognizer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v10;
      if (v8)
      {
        -[_UIKeyboardTextSelectionGestureController setWasNestedPinchingDisabled:](self, "setWasNestedPinchingDisabled:", 1);
        objc_msgSend(v10, "pinchGestureRecognizer");
        v9 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && v9 && !v9[297])
        {
          v9[297] = 1;
          -[UIScrollViewPinchGestureRecognizer _updateHysteresis](v9);
        }

        v7 = v10;
      }
    }

  }
}

- (_UIKeyboardTextSelectionGestureControllerDelegate)delegate
{
  return (_UIKeyboardTextSelectionGestureControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)addTwoFingerTextSelectionInteractionsToView:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(-[_UIKeyboardTextSelectionGestureController textInteractionClass](self, "textInteractionClass")), "initWithView:owner:forTypes:", v4, self, 6);
  if (v5)
    objc_msgSend(v4, "addInteraction:", v5);

  return v5;
}

- (void)removeDeallocationHandler:(id)a3
{
  if (a3)
    -[NSMutableArray removeObject:](self->_deallocHandlers, "removeObject:");
}

- (void)dealloc
{
  void *v3;
  NSMutableArray *deallocHandlers;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  UIDelayedAction *longForcePressAction;
  _UIStatesFeedbackGenerator *feedbackBehaviour;
  UITextMagnifierTimeWeightedPoint *weightedPoint;
  NSMutableArray *activeGestures;
  UIDelayedAction *tapLogTimer;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableArray copy](self->_deallocHandlers, "copy");
  deallocHandlers = self->_deallocHandlers;
  self->_deallocHandlers = 0;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9++) + 16))();
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  -[UIDelayedAction cancel](self->_longForcePressAction, "cancel");
  longForcePressAction = self->_longForcePressAction;
  self->_longForcePressAction = 0;

  feedbackBehaviour = self->_feedbackBehaviour;
  self->_feedbackBehaviour = 0;

  weightedPoint = self->_weightedPoint;
  self->_weightedPoint = 0;

  activeGestures = self->_activeGestures;
  self->_activeGestures = 0;

  tapLogTimer = self->_tapLogTimer;
  self->_tapLogTimer = 0;

  v15.receiver = self;
  v15.super_class = (Class)_UIKeyboardTextSelectionGestureController;
  -[_UIKeyboardTextSelectionGestureController dealloc](&v15, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  id obj;

  obj = a3;
  -[_UIKeyboardTextSelectionGestureController _cleanupDeadGesturesIfNecessary](self, "_cleanupDeadGesturesIfNecessary");
  objc_storeWeak((id *)&self->_delegate, obj);

}

+ (_UIKeyboardTextSelectionGestureController)sharedInstance
{
  if (_MergedGlobals_15_2 != -1)
    dispatch_once(&_MergedGlobals_15_2, &__block_literal_global_382);
  return (_UIKeyboardTextSelectionGestureController *)(id)qword_1ECD7C640;
}

- (void)_cleanupDeadGesturesIfNecessary
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "textSelectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_UIKeyboardTextSelectionGestureController redisableEnclosingScrollViewNestedPinching](self, "redisableEnclosingScrollViewNestedPinching");
    if (-[_UIKeyboardTextSelectionGestureController didSuppressSelectionGrabbers](self, "didSuppressSelectionGrabbers"))
    {
      -[_UIKeyboardTextSelectionGestureController selectionController](self, "selectionController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setRangedSelectionShouldShowGrabbers:", 1);

      -[_UIKeyboardTextSelectionGestureController setDidSuppressSelectionGrabbers:](self, "setDidSuppressSelectionGrabbers:", 0);
    }
  }
}

- (id)addOneFingerTextSelectionInteractionsToView:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  v5 = -[_UIKeyboardTextSelectionGestureController shouldAddForceGesture](self, "shouldAddForceGesture");
  if (-[_UIKeyboardTextSelectionGestureController _longPressAllowedForView:](self, "_longPressAllowedForView:", v4))
    v5 |= 8uLL;
  v6 = (void *)objc_msgSend(objc_alloc(-[_UIKeyboardTextSelectionGestureController textInteractionClass](self, "textInteractionClass")), "initWithView:owner:forTypes:", v4, self, v5);
  if (v6)
    objc_msgSend(v4, "addInteraction:", v6);

  return v6;
}

- (id)addLongPressTextSelectionInteractionsToView:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[_UIKeyboardTextSelectionGestureController _longPressAllowedForView:](self, "_longPressAllowedForView:", v4))
  {
    v5 = (void *)objc_msgSend(objc_alloc(-[_UIKeyboardTextSelectionGestureController textInteractionClass](self, "textInteractionClass")), "initWithView:owner:forTypes:", v4, self, 8);
    if (v5)
      objc_msgSend(v4, "addInteraction:", v5);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (Class)textInteractionClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_longPressAllowedForView:(id)a3
{
  return objc_msgSend(a3, "conformsToProtocol:", &unk_1EDF8C098);
}

- (BOOL)shouldAddForceGesture
{
  void *v2;
  char v3;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_supportsForceTouch");

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackBehaviour, 0);
  objc_storeStrong((id *)&self->_longForcePressAction, 0);
  objc_storeStrong((id *)&self->_tapLogTimer, 0);
  objc_storeStrong((id *)&self->_activeGestures, 0);
  objc_storeStrong((id *)&self->_weightedPoint, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_deallocHandlers, 0);
}

- (id)selectionController
{
  void *v2;
  void *v3;

  -[_UIKeyboardTextSelectionGestureController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textSelectionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)willRemoveSelectionController
{
  id v3;

  v3 = (id)-[NSMutableArray copy](self->_activeGestures, "copy");
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global_248_1);
  -[_UIKeyboardTextSelectionGestureController _cleanupDeadGesturesIfNecessary](self, "_cleanupDeadGesturesIfNecessary");

}

- (void)redisableEnclosingScrollViewNestedPinching
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 *v8;
  id v9;

  -[_UIKeyboardTextSelectionGestureController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textSelectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && -[_UIKeyboardTextSelectionGestureController wasNestedPinchingDisabled](self, "wasNestedPinchingDisabled"))
  {
    -[_UIKeyboardTextSelectionGestureController selectionController](self, "selectionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textInputView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_scroller");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v7 = v9;
    if (v9)
    {
      -[_UIKeyboardTextSelectionGestureController setWasNestedPinchingDisabled:](self, "setWasNestedPinchingDisabled:", 0);
      objc_msgSend(v9, "pinchGestureRecognizer");
      v8 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && v8)
      {
        if (v8[297])
        {
          v8[297] = 0;
          -[UIScrollViewPinchGestureRecognizer _updateHysteresis](v8);
        }
      }

      v7 = v9;
    }

  }
}

- (double)oneFingerForcePressMinimumDuration
{
  return 0.35;
}

- (BOOL)oneFingerForcePressShouldFailWithoutForce
{
  return 0;
}

- (BOOL)oneFingerForcePressShouldCancelTouchesInView
{
  return 0;
}

- (double)oneFingerForcePressAllowableMovement
{
  return 1.79769313e308;
}

- (BOOL)allowOneFingerDeepPress
{
  return 0;
}

- (id)textSelectionInteractionForRTIForwarding
{
  return (id)objc_msgSend(objc_alloc(-[_UIKeyboardTextSelectionGestureController textInteractionClass](self, "textInteractionClass")), "initWithView:owner:forTypes:", 0, self, 0);
}

- (void)configureTwoFingerPanGestureRecognizer:(id)a3
{
  id v4;

  v4 = a3;
  -[objc_class attachToExistingRecogniser:owner:forType:](-[_UIKeyboardTextSelectionGestureController textInteractionClass](self, "textInteractionClass"), "attachToExistingRecogniser:owner:forType:", v4, self, 4);

}

- (void)configureTwoFingerTapGestureRecognizer:(id)a3
{
  id v4;

  v4 = a3;
  -[objc_class attachToExistingRecogniser:owner:forType:](-[_UIKeyboardTextSelectionGestureController textInteractionClass](self, "textInteractionClass"), "attachToExistingRecogniser:owner:forType:", v4, self, 2);

}

- (void)configureOneFingerForcePressRecognizer:(id)a3
{
  id v4;

  v4 = a3;
  -[objc_class attachToExistingRecogniser:owner:forType:](-[_UIKeyboardTextSelectionGestureController textInteractionClass](self, "textInteractionClass"), "attachToExistingRecogniser:owner:forType:", v4, self, 1);

}

- (CGPoint)lastPanTranslation
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastPanTranslation.x;
  y = self->_lastPanTranslation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastPanTranslation:(CGPoint)a3
{
  self->_lastPanTranslation = a3;
}

- (CGPoint)accumulatedAcceleration
{
  double x;
  double y;
  CGPoint result;

  x = self->_accumulatedAcceleration.x;
  y = self->_accumulatedAcceleration.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAccumulatedAcceleration:(CGPoint)a3
{
  self->_accumulatedAcceleration = a3;
}

- (CGPoint)accumulatedBounding
{
  double x;
  double y;
  CGPoint result;

  x = self->_accumulatedBounding.x;
  y = self->_accumulatedBounding.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAccumulatedBounding:(CGPoint)a3
{
  self->_accumulatedBounding = a3;
}

- (double)lastPressTimestamp
{
  return self->_lastPressTimestamp;
}

- (void)setLastPressTimestamp:(double)a3
{
  self->_lastPressTimestamp = a3;
}

- (UITextMagnifierTimeWeightedPoint)weightedPoint
{
  return self->_weightedPoint;
}

- (void)setWeightedPoint:(id)a3
{
  objc_storeStrong((id *)&self->_weightedPoint, a3);
}

- (double)twoFingerTapTimestamp
{
  return self->_twoFingerTapTimestamp;
}

- (void)setTwoFingerTapTimestamp:(double)a3
{
  self->_twoFingerTapTimestamp = a3;
}

- (int64_t)previousRepeatedGranularity
{
  return self->_previousRepeatedGranularity;
}

- (void)setPreviousRepeatedGranularity:(int64_t)a3
{
  self->_previousRepeatedGranularity = a3;
}

- (int64_t)panGestureState
{
  return self->_panGestureState;
}

- (void)setPanGestureState:(int64_t)a3
{
  self->_panGestureState = a3;
}

- (BOOL)wasScrollingEnabled
{
  return self->_wasScrollingEnabled;
}

- (void)setWasScrollingEnabled:(BOOL)a3
{
  self->_wasScrollingEnabled = a3;
}

- (BOOL)wasNestedPinchingDisabled
{
  return self->_wasNestedPinchingDisabled;
}

- (void)setWasNestedPinchingDisabled:(BOOL)a3
{
  self->_wasNestedPinchingDisabled = a3;
}

- (BOOL)suppressTwoFingerPan
{
  return self->_suppressTwoFingerPan;
}

- (void)setSuppressTwoFingerPan:(BOOL)a3
{
  self->_suppressTwoFingerPan = a3;
}

- (BOOL)didSuppressSelectionGrabbers
{
  return self->_didSuppressSelectionGrabbers;
}

- (void)setDidSuppressSelectionGrabbers:(BOOL)a3
{
  self->_didSuppressSelectionGrabbers = a3;
}

- (BOOL)isLongPressing
{
  return self->_isLongPressing;
}

- (void)setIsLongPressing:(BOOL)a3
{
  self->_isLongPressing = a3;
}

- (BOOL)isPanning
{
  return self->_isPanning;
}

- (void)setIsPanning:(BOOL)a3
{
  self->_isPanning = a3;
}

- (BOOL)isSpacePan
{
  return self->_isSpacePan;
}

- (void)setIsSpacePan:(BOOL)a3
{
  self->_isSpacePan = a3;
}

- (BOOL)hadAddedTouch
{
  return self->_hadAddedTouch;
}

- (void)setHadAddedTouch:(BOOL)a3
{
  self->_hadAddedTouch = a3;
}

- (double)spacePanDistance
{
  return self->_spacePanDistance;
}

- (void)setSpacePanDistance:(double)a3
{
  self->_spacePanDistance = a3;
}

- (NSMutableArray)activeGestures
{
  return self->_activeGestures;
}

- (void)setActiveGestures:(id)a3
{
  objc_storeStrong((id *)&self->_activeGestures, a3);
}

- (BOOL)didFloatCursor
{
  return self->_didFloatCursor;
}

- (void)setDidFloatCursor:(BOOL)a3
{
  self->_didFloatCursor = a3;
}

- (CGPoint)cursorLocationBase
{
  double x;
  double y;
  CGPoint result;

  x = self->_cursorLocationBase.x;
  y = self->_cursorLocationBase.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCursorLocationBase:(CGPoint)a3
{
  self->_cursorLocationBase = a3;
}

- (UIDelayedAction)tapLogTimer
{
  return self->_tapLogTimer;
}

- (void)setTapLogTimer:(id)a3
{
  objc_storeStrong((id *)&self->_tapLogTimer, a3);
}

- (int)previousForcePressCount
{
  return self->_previousForcePressCount;
}

- (void)setPreviousForcePressCount:(int)a3
{
  self->_previousForcePressCount = a3;
}

- (UIDelayedAction)longForcePressAction
{
  return self->_longForcePressAction;
}

- (void)setLongForcePressAction:(id)a3
{
  objc_storeStrong((id *)&self->_longForcePressAction, a3);
}

- (_UIStatesFeedbackGenerator)feedbackBehaviour
{
  return self->_feedbackBehaviour;
}

- (void)setFeedbackBehaviour:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackBehaviour, a3);
}

@end
