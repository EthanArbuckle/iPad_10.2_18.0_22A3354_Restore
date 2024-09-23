@implementation UIPanGestureRecognizer

- (BOOL)_isGestureType:(int64_t)a3
{
  return a3 == 8;
}

- (void)_resetGestureRecognizer
{
  objc_super v3;

  -[UIPanGestureRecognizer clearMultitouchTimer](self, "clearMultitouchTimer");
  -[UIPanGestureRecognizer _resetVelocitySamples]((uint64_t)self);
  self->_lastTouchCount = 0;
  -[NSMutableArray removeAllObjects](self->_touches, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_movingTouches, "removeAllObjects");
  *((_BYTE *)self + 384) |= 0x40u;
  *((_BYTE *)self + 384) |= 0x80u;
  *((_BYTE *)self + 385) &= ~1u;
  *((_BYTE *)self + 385) &= ~2u;
  *((_BYTE *)self + 385) &= ~0x20u;
  *((_BYTE *)self + 385) &= ~0x40u;
  v3.receiver = self;
  v3.super_class = (Class)UIPanGestureRecognizer;
  -[UIGestureRecognizer _resetGestureRecognizer](&v3, sel__resetGestureRecognizer);
}

- (void)clearMultitouchTimer
{
  char v3;

  v3 = *((_BYTE *)self + 385);
  if ((v3 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_multitouchExpired_, 0);
    v3 = *((_BYTE *)self + 385);
  }
  *((_BYTE *)self + 385) = v3 & 0xF7;
}

- (void)_resetVelocitySamples
{
  void *v2;
  void *v3;

  if (a1)
  {
    v2 = *(void **)(a1 + 416);
    *(_QWORD *)(a1 + 416) = 0;

    v3 = *(void **)(a1 + 424);
    *(_QWORD *)(a1 + 424) = 0;

  }
}

- (BOOL)shouldReceiveEvent:(id)a3
{
  id v5;
  BOOL v6;
  int64_t allowedScrollTypesMask;
  objc_super v9;

  if (objc_msgSend(a3, "type") == 10)
  {
    v5 = a3;
    if (!self->_allowedScrollTypesMask)
      goto LABEL_7;
    if (!-[UIPanGestureRecognizer _iOSMacUseNonacceleratedDelta](self, "_iOSMacUseNonacceleratedDelta"))
    {
      allowedScrollTypesMask = self->_allowedScrollTypesMask;
      v6 = (allowedScrollTypesMask & (1 << objc_msgSend(v5, "_scrollType"))) != 0;
      goto LABEL_9;
    }
    if (objc_msgSend(v5, "_scrollType") == 1)
    {
      objc_msgSend(v5, "nonAcceleratedDelta");
      v6 = 1;
    }
    else
    {
LABEL_7:
      v6 = 0;
    }
LABEL_9:

    return v6;
  }
  v9.receiver = self;
  v9.super_class = (Class)UIPanGestureRecognizer;
  return -[UIGestureRecognizer shouldReceiveEvent:](&v9, sel_shouldReceiveEvent_, a3);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  CGPoint *p_digitizerLocation;
  CGFloat v8;
  CGFloat v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  BOOL v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    p_digitizerLocation = &self->_digitizerLocation;
    objc_msgSend(a4, "_digitizerLocation");
    p_digitizerLocation->x = v8;
    self->_digitizerLocation.y = v9;
  }
  v10 = -[NSMutableArray copy](self->_movingTouches, "copy");
  v11 = (void *)v10;
  if (UIPanGestureRecognizersEnabled)
  {
    v23 = (void *)v10;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v12 = a3;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          if (-[NSMutableArray count](self->_touches, "count") >= self->_maximumNumberOfTouches)
          {
            if ((*((_BYTE *)self + 384) & 4) != 0
              && -[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStatePossible)
            {

              v18 = 1;
              goto LABEL_20;
            }
          }
          else
          {
            -[NSMutableArray addObject:](self->_touches, "addObject:", v17);
            -[NSMutableArray addObject:](self->_movingTouches, "addObject:", v17);
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v14)
          continue;
        break;
      }
    }

    v18 = self->_allowableSeparation != 1.79769313e308
       && -[UIPanGestureRecognizer _touchesExceedAllowableSeparation](self, "_touchesExceedAllowableSeparation");
LABEL_20:
    v11 = v23;
  }
  else
  {
    v18 = 1;
  }
  if (-[UIPanGestureRecognizer minimumNumberOfTouches](self, "minimumNumberOfTouches") >= 2)
  {
    if (-[UIPanGestureRecognizer _requiresImmediateMultipleTouches](self, "_requiresImmediateMultipleTouches"))
    {
      -[UIPanGestureRecognizer _allowableTouchTimeSeparation](self, "_allowableTouchTimeSeparation");
      if (v19 > 0.0)
      {
        -[UIPanGestureRecognizer _allowableTouchTimeSeparation](self, "_allowableTouchTimeSeparation");
        -[UIPanGestureRecognizer startMultitouchTimer:](self, "startMultitouchTimer:");
      }
    }
  }
  if (v18)
  {
    -[UIPanGestureRecognizer clearMultitouchTimer](self, "clearMultitouchTimer");
    -[UIGestureRecognizer setState:](self, "setState:", 5);
  }
  else if (self->_lastTouchCount)
  {
    -[UIPanGestureRecognizer _touchesListChangedFrom:to:](self, "_touchesListChangedFrom:to:", v11, self->_movingTouches);
  }
  else
  {
    -[UIGestureRecognizer _centroidOfTouches:excludingEnded:](self, "_centroidOfTouches:excludingEnded:", self->_movingTouches, 1);
    self->_firstSceneReferenceLocation.x = v20;
    self->_firstSceneReferenceLocation.y = v21;
    self->_lastSceneReferenceLocation = self->_firstSceneReferenceLocation;
    self->_lastUnadjustedSceneReferenceLocation = self->_firstSceneReferenceLocation;
    self->_lastTouchCount = -[NSMutableArray count](self->_movingTouches, "count");
    objc_msgSend(a4, "timestamp");
    self->_lastTouchTime = v22;
  }

}

- (NSUInteger)minimumNumberOfTouches
{
  return self->_minimumNumberOfTouches;
}

- (double)_allowableTouchTimeSeparation
{
  return self->_allowableTouchTimeSeparation;
}

- (BOOL)_requiresImmediateMultipleTouches
{
  return (*((unsigned __int8 *)self + 385) >> 4) & 1;
}

- (void)startMultitouchTimer:(double)a3
{
  -[UIPanGestureRecognizer clearMultitouchTimer](self, "clearMultitouchTimer");
  *((_BYTE *)self + 385) |= 8u;
  -[UIPanGestureRecognizer performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_multitouchExpired_, 0, a3);
}

- (BOOL)_shouldTryToBeginWithEvent:(id)a3
{
  BOOL v5;

  if (!objc_msgSend(a3, "type")
    && -[NSMutableArray count](self->_movingTouches, "count") < self->_minimumNumberOfTouches
    || !-[UIPanGestureRecognizer _shouldBeginHorizontally:vertically:withEvent:](self, "_shouldBeginHorizontally:vertically:withEvent:", -[UIPanGestureRecognizer _willScrollX](self, "_willScrollX"), -[UIPanGestureRecognizer _willScrollY](self, "_willScrollY"), a3))
  {
    return 0;
  }
  v5 = 1;
  -[UIPanGestureRecognizer _shouldBeginHorizontally:vertically:withEvent:](self, "_shouldBeginHorizontally:vertically:withEvent:", 1, 1, a3);
  return v5;
}

- (BOOL)_willScrollY
{
  double v3;
  double v4;
  _BOOL4 v5;

  v3 = -[UIPanGestureRecognizer _translationDistanceInSceneInSelfAxis:](self, 0.0, 1.0);
  -[UIPanGestureRecognizer _hysteresis](self, "_hysteresis");
  if (v3 >= v4)
    LOBYTE(v5) = 1;
  else
    return (*((unsigned __int8 *)self + 385) >> 6) & 1;
  return v5;
}

- (BOOL)_willScrollX
{
  double v3;
  double v4;
  _BOOL4 v5;

  v3 = -[UIPanGestureRecognizer _translationDistanceInSceneInSelfAxis:](self, 1.0, 0.0);
  -[UIPanGestureRecognizer _hysteresis](self, "_hysteresis");
  if (v3 >= v4)
    LOBYTE(v5) = 1;
  else
    return (*((unsigned __int8 *)self + 385) >> 5) & 1;
  return v5;
}

- (BOOL)_shouldBeginHorizontally:(BOOL)a3 vertically:(BOOL)a4 withEvent:(id)a5
{
  _BOOL4 v6;
  _BOOL4 v7;
  UIPanGestureRecognizer *v8;
  void *v9;
  void *v10;
  char v11;
  char v12;
  unsigned int v13;

  v6 = a4;
  v7 = a3;
  v8 = self;
  -[UIGestureRecognizer delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((*((_BYTE *)v8 + 384) & 1) != 0 && v7 && (*((_BYTE *)v8 + 385) & 1) == 0)
  {
    if (objc_msgSend(v9, "_panGestureRecognizer:shouldTryToBeginHorizontallyWithEvent:", v8, a5))
      v11 = 64;
    else
      v11 = 0;
    *((_BYTE *)v8 + 384) = *((_BYTE *)v8 + 384) & 0xBF | v11;
    *((_BYTE *)v8 + 385) |= 1u;
  }
  if ((*((_BYTE *)v8 + 384) & 2) != 0 && v6 && (*((_BYTE *)v8 + 385) & 2) == 0)
  {
    if (objc_msgSend(v10, "_panGestureRecognizer:shouldTryToBeginVerticallyWithEvent:", v8, a5))
      v12 = 0x80;
    else
      v12 = 0;
    *((_BYTE *)v8 + 384) = v12 & 0x80 | *((_BYTE *)v8 + 384) & 0x7F;
    *((_BYTE *)v8 + 385) |= 2u;
  }
  if (!v7)
  {
    if (!v6)
    {
      LOBYTE(v8) = 0;
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  v13 = *((unsigned __int8 *)v8 + 384);
  if (((!v6 | ((v13 & 0x40) >> 6)) & 1) == 0)
  {
LABEL_19:
    LOBYTE(v8) = *((char *)v8 + 384) < 0;
    goto LABEL_21;
  }
  LODWORD(v8) = (v13 >> 6) & 1;
LABEL_21:

  return (char)v8;
}

- (BOOL)_touchesExceedAllowableSeparation
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v3 = _BoundingRectForTouches(self->_touches, 0);
  v5 = v4;
  v7 = v6;
  -[UIPanGestureRecognizer _allowableSeparation](self, "_allowableSeparation", v3);
  return v8 < sqrt(v5 * v5 + v7 * v7);
}

- (double)_hysteresis
{
  double hysteresis;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  int v9;
  double v10;

  hysteresis = self->_hysteresis;
  -[UIGestureRecognizer view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_touchSloppinessFactor");
  v6 = hysteresis * v5;

  -[UIGestureRecognizer _activeEventOfType:](self, "_activeEventOfType:", 10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && !objc_msgSend(v7, "_scrollType"))
  {
    v9 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_DiscreteScrollHysteresisScale, (uint64_t)CFSTR("DiscreteScrollHysteresisScale"));
    v10 = *(double *)&qword_1EDDA8108;
    if (v9)
      v10 = 0.0001;
    v6 = v6 * v10;
  }

  return v6;
}

- (double)_allowableSeparation
{
  double allowableSeparation;
  void *v3;
  double v4;
  double v5;

  allowableSeparation = self->_allowableSeparation;
  -[UIGestureRecognizer view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_touchSloppinessFactor");
  v5 = allowableSeparation * v4;

  return v5;
}

- (double)_translationDistanceInSceneInSelfAxis:(double)a3
{
  void *v6;
  double v7;
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

  if (!a1)
    return 0.0;
  objc_msgSend(a1, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "translationInView:", v6);
  v8 = a2 * v7;
  v10 = a3 * v9;
  objc_msgSend(a1, "_convertPoint:toSceneReferenceCoordinatesFromView:", v6, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  v12 = v11;
  v14 = v13;
  objc_msgSend(a1, "_convertPoint:toSceneReferenceCoordinatesFromView:", v6, v8, v10);
  v17 = hypot(v15 - v12, v16 - v14);

  return v17;
}

- (CGPoint)translationInView:(UIView *)view
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  -[UIPanGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", self->_firstSceneReferenceLocation.x, self->_firstSceneReferenceLocation.y);
  v6 = v5;
  v8 = v7;
  -[UIPanGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", view, self->_lastSceneReferenceLocation.x, self->_lastSceneReferenceLocation.y);
  v10 = v9 - v6;
  v12 = v11 - v8;
  result.y = v12;
  result.x = v10;
  return result;
}

- (CGPoint)_convertPoint:(CGPoint)a3 fromSceneReferenceCoordinatesToView:(id)a4
{
  double y;
  double x;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  if (a4)
  {
    v6 = a4;
  }
  else
  {
    -[UIGestureRecognizer view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_window");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "_window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "_convertDoublePointFromSceneReferenceSpace:", x, y);
    x = v10;
    y = v11;
  }
  objc_msgSend(v6, "convertPoint:fromView:", 0, x, y);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.y = v17;
  result.x = v16;
  return result;
}

- (CGPoint)_convertPoint:(CGPoint)a3 toSceneReferenceCoordinatesFromView:(id)a4
{
  double y;
  double x;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  if (a4)
  {
    v6 = a4;
  }
  else
  {
    -[UIGestureRecognizer view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "_window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:toView:", 0, x, y);
  v11 = v9;
  v12 = v10;
  if (v8)
  {
    objc_msgSend(v8, "_convertDoublePointToSceneReferenceSpace:", v9, v10);
    v11 = v13;
    v12 = v14;
  }

  v15 = v11;
  v16 = v12;
  result.y = v16;
  result.x = v15;
  return result;
}

- (void)setMaximumNumberOfTouches:(NSUInteger)maximumNumberOfTouches
{
  self->_maximumNumberOfTouches = maximumNumberOfTouches;
}

- (void)_setHysteresis:(double)a3
{
  self->_hysteresis = a3;
}

- (UIPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  UIPanGestureRecognizer *v4;
  UIPanGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIPanGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
    _UIPanGestureRecognizerCommonInit((uint64_t)v4);
  return v5;
}

+ (double)_defaultHysteresis
{
  return 10.0;
}

- (void)setAllowedScrollTypesMask:(UIScrollTypeMask)allowedScrollTypesMask
{
  self->_allowedScrollTypesMask = allowedScrollTypesMask;
}

- (void)setFailsPastMaxTouches:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 384) = *((_BYTE *)self + 384) & 0xFB | v3;
}

- (void)setMinimumNumberOfTouches:(NSUInteger)minimumNumberOfTouches
{
  self->_minimumNumberOfTouches = minimumNumberOfTouches;
}

- (void)_setFailsPastHysteresisWithoutMinTouches:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 384) = *((_BYTE *)self + 384) & 0xF7 | v3;
}

- (void)_setAllowableTouchTimeSeparation:(double)a3
{
  self->_allowableTouchTimeSeparation = a3;
}

- (void)_setRequiresImmediateMultipleTouches:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 385) = *((_BYTE *)self + 385) & 0xEF | v3;
}

- (void)_setAllowableSeparation:(double)a3
{
  self->_allowableSeparation = a3;
}

- (void)_setCanPanVertically:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 384) = *((_BYTE *)self + 384) & 0xDF | v3;
}

- (void)_setiOSMacUseNonacceleratedDelta:(BOOL)a3
{
  self->_iOSMacUseNonacceleratedDelta = a3;
}

- (void)_setIgnoresStationaryTouches:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 385) = *((_BYTE *)self + 385) & 0xFB | v3;
}

- (void)setDelegate:(id)a3
{
  char v5;
  objc_super v6;

  *((_BYTE *)self + 384) = *((_BYTE *)self + 384) & 0xFE | objc_opt_respondsToSelector() & 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = 2;
  else
    v5 = 0;
  *((_BYTE *)self + 384) = *((_BYTE *)self + 384) & 0xFD | v5;
  v6.receiver = self;
  v6.super_class = (Class)UIPanGestureRecognizer;
  -[UIGestureRecognizer setDelegate:](&v6, sel_setDelegate_, a3);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  CGPoint *p_digitizerLocation;
  CGFloat v7;
  CGFloat v8;
  _QWORD v9[5];

  if (self)
  {
    p_digitizerLocation = &self->_digitizerLocation;
    objc_msgSend(a4, "_digitizerLocation");
    p_digitizerLocation->x = v7;
    self->_digitizerLocation.y = v8;
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__UIPanGestureRecognizer_touchesEnded_withEvent___block_invoke;
  v9[3] = &unk_1E16B1B28;
  v9[4] = self;
  -[UIPanGestureRecognizer _handleEndedTouches:withFinalStateAdjustments:](self, "_handleEndedTouches:withFinalStateAdjustments:", a3, v9);
}

- (void)_handleEndedTouches:(id)a3 withFinalStateAdjustments:(id)a4
{
  void *v6;
  BOOL v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  unint64_t lastTouchCount;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = (void *)-[NSMutableArray copy](self->_movingTouches, "copy");
  v7 = -[UIPanGestureRecognizer _updateMovingTouchesArraySavingOldArray:](self, "_updateMovingTouchesArraySavingOldArray:", 0);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = a3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[NSMutableArray removeObject:](self->_touches, "removeObject:", v13);
        -[NSMutableArray removeObject:](self->_movingTouches, "removeObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  if (-[NSMutableArray count](self->_movingTouches, "count"))
  {
    if (v7
      || (lastTouchCount = self->_lastTouchCount,
          lastTouchCount != -[NSMutableArray count](self->_movingTouches, "count")))
    {
      -[UIPanGestureRecognizer _touchesListChangedFrom:to:](self, "_touchesListChangedFrom:to:", v6, self->_movingTouches);
    }
  }
  else
  {
    (*((void (**)(void))a4 + 2))();
  }

}

uint64_t __49__UIPanGestureRecognizer_touchesEnded_withEvent___block_invoke(uint64_t a1)
{
  uint64_t v2;

  if (objc_msgSend(*(id *)(a1 + 32), "state") == 1)
  {
    v2 = 3;
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    v2 = 3;
  }
  else
  {
    v2 = 5;
  }
  return objc_msgSend(*(id *)(a1 + 32), "setState:", v2);
}

- (BOOL)_updateMovingTouchesArraySavingOldArray:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  int v11;
  NSMutableArray *movingTouches;
  NSMutableArray *obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((*((_BYTE *)self + 385) & 4) == 0 || (unint64_t)-[NSMutableArray count](self->_touches, "count") < 2)
    return 0;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = self->_touches;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        v11 = -[UITouch _isStationaryRelativeToTouches:](v10, self->_touches);
        if (v11 == -[NSMutableArray containsObject:](self->_movingTouches, "containsObject:", v10))
        {
          if (a3 && !*a3)
            *a3 = (id)-[NSMutableArray copy](self->_movingTouches, "copy");
          movingTouches = self->_movingTouches;
          if ((v11 & 1) != 0)
            -[NSMutableArray removeObject:](movingTouches, "removeObject:", v10);
          else
            -[NSMutableArray addObject:](movingTouches, "addObject:", v10);
          v7 = 1;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7 & 1;
}

- (CGPoint)locationInView:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[UIPanGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", a3, self->_lastSceneReferenceLocation.x, self->_lastSceneReferenceLocation.y);
  result.y = v4;
  result.x = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousVelocitySample, 0);
  objc_storeStrong((id *)&self->_velocitySample, 0);
  objc_storeStrong((id *)&self->_movingTouches, 0);
  objc_storeStrong((id *)&self->_touches, 0);
}

- (void)_setCanPanHorizontally:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 384) = *((_BYTE *)self + 384) & 0xEF | v3;
}

- (void)_setiOSMacIgnoreScrollDirectionUserPreference:(BOOL)a3
{
  self->_iOSMacIgnoreScrollDirectionUserPreference = a3;
}

- (CGPoint)velocityInView:(UIView *)view
{
  double v4;
  double v5;
  double v6;
  double v7;
  UIPanGestureVelocitySample *previousVelocitySample;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  -[UIPanGestureRecognizer _convertVelocitySample:fromSceneReferenceCoordinatesToView:](self, "_convertVelocitySample:fromSceneReferenceCoordinatesToView:", self->_velocitySample, view);
  v5 = v4;
  v7 = v6;
  previousVelocitySample = self->_previousVelocitySample;
  if (previousVelocitySample && previousVelocitySample->dt > 0.00000011920929)
  {
    -[UIPanGestureRecognizer _convertVelocitySample:fromSceneReferenceCoordinatesToView:](self, "_convertVelocitySample:fromSceneReferenceCoordinatesToView:");
    v5 = v5 * 0.2 + v9 * 0.8;
    v7 = v7 * 0.2 + v10 * 0.8;
  }
  v11 = v5;
  v12 = v7;
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGPoint)_convertVelocitySample:(id)a3 fromSceneReferenceCoordinatesToView:(id)a4
{
  double v5;
  double v6;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  if (a3)
  {
    v5 = 0.0;
    v6 = 0.0;
    if (*((double *)a3 + 5) >= 0.001)
    {
      -[UIPanGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", a4, *((double *)a3 + 1), *((double *)a3 + 2));
      v10 = v9;
      v12 = v11;
      -[UIPanGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", a4, *((double *)a3 + 3), *((double *)a3 + 4));
      v14 = *((double *)a3 + 5);
      v5 = (v13 - v10) / v14;
      v6 = (v15 - v12) / v14;
    }
  }
  else
  {
    v5 = 0.0;
    v6 = 0.0;
  }
  result.y = v6;
  result.x = v5;
  return result;
}

+ (BOOL)_supportsDefaultTouchTypes
{
  return 1;
}

+ (BOOL)_supportsDefaultPressTypes
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIPanGestureRecognizer)initWithCoder:(id)a3
{
  UIPanGestureRecognizer *v4;
  UIPanGestureRecognizer *v5;
  UIPanGestureRecognizer *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIPanGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithCoder:](&v8, sel_initWithCoder_);
  v5 = v4;
  if (v4)
  {
    _UIPanGestureRecognizerCommonInit((uint64_t)v4);
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("UIPanGestureRecognizer.minimumNumberOfTouches")))
      v5->_minimumNumberOfTouches = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("UIPanGestureRecognizer.minimumNumberOfTouches"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("UIPanGestureRecognizer.maximumNumberOfTouches")))
      v5->_maximumNumberOfTouches = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("UIPanGestureRecognizer.maximumNumberOfTouches"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("UIPanGestureRecognizer.allowedScrollTypesMask")))
      v5->_allowedScrollTypesMask = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("UIPanGestureRecognizer.allowedScrollTypesMask"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t minimumNumberOfTouches;
  unint64_t maximumNumberOfTouches;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIPanGestureRecognizer;
  -[UIGestureRecognizer encodeWithCoder:](&v7, sel_encodeWithCoder_);
  minimumNumberOfTouches = self->_minimumNumberOfTouches;
  if (minimumNumberOfTouches != 1)
    objc_msgSend(a3, "encodeInteger:forKey:", minimumNumberOfTouches, CFSTR("UIPanGestureRecognizer.minimumNumberOfTouches"));
  maximumNumberOfTouches = self->_maximumNumberOfTouches;
  if (maximumNumberOfTouches != 0xFFFFFFFF)
    objc_msgSend(a3, "encodeInteger:forKey:", maximumNumberOfTouches, CFSTR("UIPanGestureRecognizer.maximumNumberOfTouches"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_allowedScrollTypesMask, CFSTR("UIPanGestureRecognizer.allowedScrollTypesMask"));
}

- (void)multitouchExpired:(id)a3
{
  if (-[NSMutableArray count](self->_touches, "count", a3) < self->_minimumNumberOfTouches)
  {
    -[UIPanGestureRecognizer clearMultitouchTimer](self, "clearMultitouchTimer");
    -[UIGestureRecognizer setState:](self, "setState:", 5);
  }
}

- (BOOL)failsPastMaxTouches
{
  return (*((unsigned __int8 *)self + 384) >> 2) & 1;
}

- (BOOL)_failsPastHysteresisWithoutMinTouches
{
  return (*((unsigned __int8 *)self + 384) >> 3) & 1;
}

- (BOOL)_ignoresStationaryTouches
{
  return (*((unsigned __int8 *)self + 385) >> 2) & 1;
}

- (BOOL)_canPanHorizontally
{
  return (*((unsigned __int8 *)self + 384) >> 4) & 1;
}

- (BOOL)_canPanVertically
{
  return (*((unsigned __int8 *)self + 384) >> 5) & 1;
}

- (id)_movingTouches
{
  return self->_movingTouches;
}

+ (void)_setPanGestureRecognizersEnabled:(BOOL)a3
{
  UIPanGestureRecognizersEnabled = a3;
}

- (void)setTranslation:(CGPoint)translation inView:(UIView *)view
{
  double y;
  double x;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat v11;

  if (self->_lastTouchCount)
  {
    y = translation.y;
    x = translation.x;
    -[UIPanGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", self->_lastSceneReferenceLocation.x, self->_lastSceneReferenceLocation.y);
    -[UIPanGestureRecognizer _convertPoint:toSceneReferenceCoordinatesFromView:](self, "_convertPoint:toSceneReferenceCoordinatesFromView:", view, v8 - x, v9 - y);
    self->_firstSceneReferenceLocation.x = v10;
    self->_firstSceneReferenceLocation.y = v11;
  }
}

- (void)_touchesListChangedFrom:(id)a3 to:(id)a4
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  id v19;
  unint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIGestureRecognizer _centroidOfTouches:excludingEnded:](self, "_centroidOfTouches:excludingEnded:", v6, 0);
  v8 = v7;
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIGestureRecognizer _centroidOfTouches:excludingEnded:](self, "_centroidOfTouches:excludingEnded:", v11, 1);
  v13 = v12;
  v15 = v14;

  v16 = v15 - v10 + self->_firstSceneReferenceLocation.y;
  self->_firstSceneReferenceLocation.x = v13 - v8 + self->_firstSceneReferenceLocation.x;
  self->_firstSceneReferenceLocation.y = v16;
  v17 = v15 - v10 + self->_lastSceneReferenceLocation.y;
  self->_lastSceneReferenceLocation.x = v13 - v8 + self->_lastSceneReferenceLocation.x;
  self->_lastSceneReferenceLocation.y = v17;
  v18 = v15 - v10 + self->_lastUnadjustedSceneReferenceLocation.y;
  self->_lastUnadjustedSceneReferenceLocation.x = v13 - v8 + self->_lastUnadjustedSceneReferenceLocation.x;
  self->_lastUnadjustedSceneReferenceLocation.y = v18;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v19 = a4;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v20)
  {
    v21 = 0;
    v22 = *(_QWORD *)v25;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(v19);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v23), "phase", (_QWORD)v24) < 3)
          ++v21;
        ++v23;
      }
      while (v20 != v23);
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v20);
    v20 = v21;
  }

  self->_lastTouchCount = v20;
}

- (double)_offsetInViewFromSceneReferenceLocation:(double)a3 toSceneReferenceLocation:(double)a4
{
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;

  if (!a1)
    return 0.0;
  objc_msgSend(a1, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_convertPoint:fromSceneReferenceCoordinatesToView:", v10, a2, a3);
  v12 = v11;

  objc_msgSend(a1, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_convertPoint:fromSceneReferenceCoordinatesToView:", v13, a4, a5);
  v15 = v14;

  return v15 - v12;
}

- (double)_shiftPanLocationToNewSceneReferenceLocation:(double)a3 lockingToAxis:(double)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;

  if (!a1)
    return 0.0;
  v6 = -[UIPanGestureRecognizer _offsetInViewFromSceneReferenceLocation:toSceneReferenceLocation:](a1, a1[45], a1[46], a3, a4);
  if (a2 == 1)
    v8 = 0.0;
  else
    v8 = v7;
  if (a2 == 2)
    v9 = 0.0;
  else
    v9 = v6;
  if (a2 == 2)
    v10 = v7;
  else
    v10 = v8;
  objc_msgSend(a1, "view", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_convertPoint:fromSceneReferenceCoordinatesToView:", v11, a1[36], a1[37]);
  v13 = v12;
  v15 = v14;

  objc_msgSend(a1, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_convertPoint:toSceneReferenceCoordinatesFromView:", v16, v9 + v13, v10 + v15);
  v18 = v17;

  return v18;
}

- (CGPoint)_adjustSceneReferenceLocation:(CGPoint)result
{
  uint64_t v3;

  if ((*((_BYTE *)self + 384) & 0x20) == 0 || (*((char *)self + 384) & 0x80000000) == 0)
  {
    v3 = 1;
LABEL_4:
    result.x = -[UIPanGestureRecognizer _shiftPanLocationToNewSceneReferenceLocation:lockingToAxis:]((double *)self, v3, result.x, result.y);
    return result;
  }
  if ((*((_BYTE *)self + 384) & 0x10) == 0 || (*((_BYTE *)self + 384) & 0x40) == 0)
  {
    v3 = 2;
    goto LABEL_4;
  }
  if (self->_lastSceneReferenceLocation.x != self->_lastUnadjustedSceneReferenceLocation.x
    || self->_lastSceneReferenceLocation.y != self->_lastUnadjustedSceneReferenceLocation.y)
  {
    v3 = 0;
    goto LABEL_4;
  }
  return result;
}

- (void)_centroidMovedTo:(CGPoint)a3 atTime:(double)a4 affectingTranslation:(BOOL)a5
{
  _BOOL4 v5;
  CGFloat y;
  CGFloat x;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  UIPanGestureVelocitySample *v15;
  void *v16;
  char *v17;

  v5 = a5;
  y = a3.y;
  x = a3.x;
  -[UIPanGestureRecognizer _adjustSceneReferenceLocation:](self, "_adjustSceneReferenceLocation:");
  v11 = v10;
  v13 = v12;
  v14 = a4 - self->_lastTouchTime;
  if (v14 > 0.008 || v14 > 0.0)
  {
    v15 = self->_previousVelocitySample;
    objc_storeStrong((id *)&self->_previousVelocitySample, self->_velocitySample);
    v16 = v15;
    if (!v15)
      v16 = (void *)objc_opt_new();
    objc_storeStrong((id *)&self->_velocitySample, v16);
    v17 = v16;
    if (!v15)

    *(CGPoint *)(v17 + 8) = self->_lastSceneReferenceLocation;
    *((CGFloat *)v17 + 3) = v11;
    *((CGFloat *)v17 + 4) = v13;
    *((double *)v17 + 5) = v14;

  }
  if (v5)
  {
    self->_lastUnadjustedSceneReferenceLocation.x = x;
    self->_lastUnadjustedSceneReferenceLocation.y = y;
    self->_lastSceneReferenceLocation.x = v11;
    self->_lastSceneReferenceLocation.y = v13;
  }
  self->_lastTouchTime = a4;
}

- (void)_removeHysteresisFromTranslation
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;

  -[UIGestureRecognizer view](self, "view");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  -[UIPanGestureRecognizer _hysteresis](self, "_hysteresis");
  v4 = v3;
  -[UIPanGestureRecognizer translationInView:](self, "translationInView:", v33);
  v6 = v5;
  v8 = v7;
  v9 = *MEMORY[0x1E0C9D538];
  v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[UIPanGestureRecognizer _convertPoint:toSceneReferenceCoordinatesFromView:](self, "_convertPoint:toSceneReferenceCoordinatesFromView:", v33, *MEMORY[0x1E0C9D538], v10);
  v12 = v11;
  v14 = v13;
  -[UIPanGestureRecognizer _convertPoint:toSceneReferenceCoordinatesFromView:](self, "_convertPoint:toSceneReferenceCoordinatesFromView:", v33, v6, v8);
  v16 = v15 - v12;
  v18 = v17 - v14;
  v19 = v4 + v16;
  if (v4 + v16 > 0.0)
    v19 = 0.0;
  v20 = fmax(v16 - v4, 0.0);
  if (v16 > 0.0)
    v21 = v20;
  else
    v21 = v19;
  v22 = v4 + v18;
  if (v4 + v18 > 0.0)
    v22 = 0.0;
  v23 = fmax(v18 - v4, 0.0);
  if (v18 > 0.0)
    v24 = v23;
  else
    v24 = v22;
  -[UIPanGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", v33, v9, v10);
  v26 = v25;
  v28 = v27;
  -[UIPanGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", v33, v21, v24);
  v30 = v29 - v26;
  v32 = v31 - v28;
  if ((*((_BYTE *)self + 384) & 0x40) == 0)
    v30 = 0.0;
  if (*((char *)self + 384) >= 0)
    v32 = 0.0;
  -[UIPanGestureRecognizer setTranslation:inView:](self, "setTranslation:inView:", v33, v30, v32);

}

- (void)_willBeginAfterSatisfyingFailureRequirements
{
  id v3;

  -[UIGestureRecognizer view](self, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIPanGestureRecognizer setTranslation:inView:](self, "setTranslation:inView:", v3, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  CGPoint *p_digitizerLocation;
  CGFloat v8;
  CGFloat v9;
  BOOL v10;
  NSMutableArray *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  NSMutableArray *movingTouches;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  UIPanGestureRecognizer *v23;
  uint64_t v24;
  unint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    p_digitizerLocation = &self->_digitizerLocation;
    objc_msgSend(a4, "_digitizerLocation");
    p_digitizerLocation->x = v8;
    self->_digitizerLocation.y = v9;
    v30 = 0;
    v10 = -[UIPanGestureRecognizer _updateMovingTouchesArraySavingOldArray:](self, "_updateMovingTouchesArraySavingOldArray:", &v30);
    v11 = (NSMutableArray *)v30;
    if (v10)
    {
LABEL_13:
      if (v11)
        movingTouches = v11;
      else
        movingTouches = self->_movingTouches;
      -[UIPanGestureRecognizer _touchesListChangedFrom:to:](self, "_touchesListChangedFrom:to:", movingTouches);
    }
    else
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v12 = self->_movingTouches;
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v27;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v27 != v15)
              objc_enumerationMutation(v12);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "phase", (_QWORD)v26) >= 3)
            {

              goto LABEL_13;
            }
          }
          v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
          if (v14)
            continue;
          break;
        }
      }

    }
    -[UIGestureRecognizer _centroidOfTouches:excludingEnded:](self, "_centroidOfTouches:excludingEnded:", self->_movingTouches, 1, (_QWORD)v26);
    v19 = v18;
    v21 = v20;
    objc_msgSend(a4, "timestamp");
    -[UIPanGestureRecognizer _centroidMovedTo:atTime:affectingTranslation:](self, "_centroidMovedTo:atTime:affectingTranslation:", 1, v19, v21, v22);
    -[UIPanGestureRecognizer _didUpdateCentroidWithTouches:event:](self, "_didUpdateCentroidWithTouches:event:", a3, a4);

  }
  if (-[UIGestureRecognizer state](self, "state", a3) == UIGestureRecognizerStatePossible
    && -[UIPanGestureRecognizer _shouldTryToBeginWithEvent:](self, "_shouldTryToBeginWithEvent:", a4))
  {
    -[UIPanGestureRecognizer _removeHysteresisFromTranslation](self, "_removeHysteresisFromTranslation");
    v23 = self;
    v24 = 1;
LABEL_27:
    -[UIGestureRecognizer setState:](v23, "setState:", v24);
    return;
  }
  if (-[UIPanGestureRecognizer _failsPastHysteresisWithoutMinTouches](self, "_failsPastHysteresisWithoutMinTouches"))
  {
    if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStatePossible)
    {
      v25 = -[NSMutableArray count](self->_movingTouches, "count");
      if (v25 < -[UIPanGestureRecognizer minimumNumberOfTouches](self, "minimumNumberOfTouches")
        && (-[UIPanGestureRecognizer _willScrollX](self, "_willScrollX")
         || -[UIPanGestureRecognizer _willScrollY](self, "_willScrollY")))
      {
        v23 = self;
        v24 = 5;
        goto LABEL_27;
      }
    }
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__UIPanGestureRecognizer_touchesCancelled_withEvent___block_invoke;
  v4[3] = &unk_1E16B1B28;
  v4[4] = self;
  -[UIPanGestureRecognizer _handleEndedTouches:withFinalStateAdjustments:](self, "_handleEndedTouches:withFinalStateAdjustments:", a3, v4);
}

uint64_t __53__UIPanGestureRecognizer_touchesCancelled_withEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setState:", 5);
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  void *v7;
  objc_super v8;

  objc_msgSend(a3, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIGestureRecognizer ignorePress:forEvent:](self, "ignorePress:forEvent:", v7, a4);

  v8.receiver = self;
  v8.super_class = (Class)UIPanGestureRecognizer;
  -[UIGestureRecognizer pressesBegan:withEvent:](&v8, sel_pressesBegan_withEvent_, a3, a4);
}

- (void)_ignoreTouchForTouchIdentifier:(unsigned int)a3
{
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  void *v12;
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
  v5 = self->_touches;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
      if (objc_msgSend(v10, "_touchIdentifier", (_QWORD)v13) == a3)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    v11 = v10;

    if (!v11)
      return;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPanGestureRecognizer touchesCancelled:withEvent:](self, "touchesCancelled:withEvent:", v12, 0);

    -[UIGestureRecognizer ignoreTouch:forEvent:](self, "ignoreTouch:forEvent:", v11, 0);
    v5 = v11;
  }
LABEL_12:

}

- (unint64_t)numberOfTouches
{
  return -[NSMutableArray count](self->_touches, "count");
}

- (CGPoint)locationOfTouch:(unint64_t)a3 inView:(id)a4
{
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  CGPoint result;

  if (-[NSMutableArray count](self->_touches, "count") <= a3)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("-[%@ %@]"), v15, v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("%@: index (%ld) beyond bounds (%ld)."), v8, a3, -[NSMutableArray count](self->_touches, "count"));
    v10 = *MEMORY[0x1E0C9D538];
    v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_touches, "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "locationInView:", a4);
    v10 = v9;
    v12 = v11;
  }

  v17 = v10;
  v18 = v12;
  result.y = v18;
  result.x = v17;
  return result;
}

- (id)_activeTouches
{
  if (a1)
    a1 = (id *)a1[39];
  return a1;
}

- (void)_ignoreTouches:(uint64_t)a3 forEvent:
{
  id v6;
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

  v16 = *MEMORY[0x1E0C80C00];
  if (a1 && objc_msgSend(a2, "count"))
  {
    objc_msgSend(a1, "touchesCancelled:withEvent:", a2, a3);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = a2;
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
          objc_msgSend(a1, "ignoreTouch:forEvent:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), a3, (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (CGPoint)_initialLocationInView:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[UIPanGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", a3, self->_firstSceneReferenceLocation.x, self->_firstSceneReferenceLocation.y);
  result.y = v4;
  result.x = v3;
  return result;
}

- (NSArray)_allowedScrollTypes
{
  void *v3;
  void *v4;
  int64_t allowedScrollTypesMask;
  void *v6;

  v3 = (void *)objc_opt_new();
  v4 = v3;
  allowedScrollTypesMask = self->_allowedScrollTypesMask;
  if ((allowedScrollTypesMask & 1) != 0)
  {
    objc_msgSend(v3, "addObject:", &unk_1E1A97DB8);
    allowedScrollTypesMask = self->_allowedScrollTypesMask;
  }
  if ((allowedScrollTypesMask & 2) != 0)
    objc_msgSend(v4, "addObject:", &unk_1E1A97DD0);
  v6 = (void *)objc_msgSend(v4, "copy");

  return (NSArray *)v6;
}

- (void)_setAllowedScrollTypes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  self->_allowedScrollTypesMask = 0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    v8 = *MEMORY[0x1E0C99778];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "integerValue");
        if (v10 == 2 || v10 == 1)
        {
          v11 = self->_allowedScrollTypesMask | 2;
          goto LABEL_11;
        }
        if (!v10)
        {
          v11 = self->_allowedScrollTypesMask | 1;
LABEL_11:
          self->_allowedScrollTypesMask = v11;
          goto LABEL_13;
        }
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v8, CFSTR("Invalid value for scroll type: %ld. Must be either UIScrollTypeDiscrete or UIScrollTypeContinuous"), v10);
LABEL_13:
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)_setiOSMacScrollingEnabled:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 3;
  else
    v3 = 0;
  -[UIPanGestureRecognizer setAllowedScrollTypesMask:](self, "setAllowedScrollTypesMask:", v3);
}

- (BOOL)isIOSMacScrollingEnabled
{
  return self->_allowedScrollTypesMask != 0;
}

- (void)_processScrollPhaseChanged:(id)a3
{
  double v5;
  double v6;
  _BOOL8 v7;
  unsigned int v8;
  int v9;
  char v10;
  unsigned int v11;
  int v12;
  char v13;
  double v14;
  double v15;
  double v16;

  objc_msgSend(a3, "_adjustedDeltaForPanWithAcceleration:honoringScrollDirectionPreference:", -[UIPanGestureRecognizer _iOSMacUseNonacceleratedDelta](self, "_iOSMacUseNonacceleratedDelta") ^ 1, -[UIPanGestureRecognizer _iOSMacIgnoreScrollDirectionUserPreference](self, "_iOSMacIgnoreScrollDirectionUserPreference") ^ 1);
  v7 = v6 != 0.0 || v5 != 0.0;
  if (v7)
  {
LABEL_18:
    v14 = v5 + self->_lastUnadjustedSceneReferenceLocation.x;
    v15 = v6 + self->_lastUnadjustedSceneReferenceLocation.y;
    objc_msgSend(a3, "timestamp");
    -[UIPanGestureRecognizer _centroidMovedTo:atTime:affectingTranslation:](self, "_centroidMovedTo:atTime:affectingTranslation:", v7, v14, v15, v16);
    goto LABEL_19;
  }
  objc_msgSend(a3, "_stifledDelta");
  if (v5 != 0.0 || v6 != 0.0)
  {
    v8 = *((unsigned __int8 *)self + 385);
    v9 = (v8 >> 5) & 1;
    if (v5 != 0.0)
      v9 = 1;
    if (v9)
      v10 = 32;
    else
      v10 = 0;
    *((_BYTE *)self + 385) = v10 | v8 & 0xDF;
    v11 = *((unsigned __int8 *)self + 385);
    v12 = (v11 >> 6) & 1;
    if (v6 != 0.0)
      v12 = 1;
    if (v12)
      v13 = 64;
    else
      v13 = 0;
    *((_BYTE *)self + 385) = v13 | v11 & 0xBF;
    goto LABEL_18;
  }
LABEL_19:
  if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStatePossible
    && -[UIPanGestureRecognizer _shouldTryToBeginWithEvent:](self, "_shouldTryToBeginWithEvent:", a3))
  {
    if ((*((_BYTE *)self + 385) & 0x20) == 0 && (*((_BYTE *)self + 385) & 0x40) == 0)
      -[UIPanGestureRecognizer _removeHysteresisFromTranslation](self, "_removeHysteresisFromTranslation");
    -[UIGestureRecognizer setState:](self, "setState:", 1);
  }
}

- (void)_scrollingChangedWithEvent:(id)a3
{
  CGFloat v5;
  CGFloat v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  int v13;
  double v14;
  UIPanGestureVelocitySample *velocitySample;
  UIPanGestureVelocitySample *previousVelocitySample;
  UIPanGestureRecognizer *v17;
  uint64_t v18;
  id v19;

  switch(objc_msgSend(a3, "phase"))
  {
    case 2:
      if (self)
      {
        objc_msgSend(a3, "_digitizerLocation");
        self->_digitizerLocation.x = v5;
        self->_digitizerLocation.y = v6;
      }
      objc_msgSend(a3, "_allWindows");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "anyObject");
      v19 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a3, "locationInView:", 0);
      -[UIPanGestureRecognizer _convertPoint:toSceneReferenceCoordinatesFromView:](self, "_convertPoint:toSceneReferenceCoordinatesFromView:", v19);
      self->_firstSceneReferenceLocation.x = v8;
      self->_firstSceneReferenceLocation.y = v9;
      self->_lastSceneReferenceLocation = self->_firstSceneReferenceLocation;
      self->_lastUnadjustedSceneReferenceLocation = self->_firstSceneReferenceLocation;
      objc_msgSend(a3, "timestamp");
      self->_lastTouchTime = v10;
      self->_lastTouchCount = 1;
      if (!objc_msgSend(a3, "_scrollType"))
        -[UIPanGestureRecognizer _processScrollPhaseChanged:](self, "_processScrollPhaseChanged:", a3);

      break;
    case 3:
      -[UIPanGestureRecognizer _processScrollPhaseChanged:](self, "_processScrollPhaseChanged:", a3);
      break;
    case 4:
      if (-[UIGestureRecognizer state](self, "state") != UIGestureRecognizerStateBegan
        && -[UIGestureRecognizer state](self, "state") != UIGestureRecognizerStateChanged)
      {
        goto LABEL_15;
      }
      objc_msgSend(a3, "timestamp");
      v12 = v11 - self->_lastTouchTime;
      v13 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_DurationBetweenScrollChangeAndEndEventsToResetVelocity, (uint64_t)CFSTR("DurationBetweenScrollChangeAndEndEventsToResetVelocity"));
      v14 = *(double *)&qword_1EDDA80F8;
      if (v13)
        v14 = 0.13;
      if (v12 > v14)
      {
        velocitySample = self->_velocitySample;
        self->_velocitySample = 0;

        previousVelocitySample = self->_previousVelocitySample;
        self->_previousVelocitySample = 0;

      }
      v17 = self;
      v18 = 3;
      goto LABEL_16;
    case 5:
LABEL_15:
      v17 = self;
      v18 = 5;
LABEL_16:
      -[UIGestureRecognizer setState:](v17, "setState:", v18);
      break;
    default:
      return;
  }
}

- (uint64_t)_scrollDeviceCategory
{
  void *v1;
  uint64_t v2;

  if (!a1)
    return 0;
  objc_msgSend(a1, "_activeEventOfType:", 10);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = objc_msgSend(v1, "_scrollDeviceCategory");
  else
    v2 = 0;

  return v2;
}

- (NSUInteger)maximumNumberOfTouches
{
  return self->_maximumNumberOfTouches;
}

- (UIScrollTypeMask)allowedScrollTypesMask
{
  return self->_allowedScrollTypesMask;
}

- (BOOL)_iOSMacUseNonacceleratedDelta
{
  return self->_iOSMacUseNonacceleratedDelta;
}

- (BOOL)_iOSMacIgnoreScrollDirectionUserPreference
{
  return self->_iOSMacIgnoreScrollDirectionUserPreference;
}

- (BOOL)_iOSMacScrollingEnabled
{
  return self->_iOSMacScrollingEnabled;
}

@end
