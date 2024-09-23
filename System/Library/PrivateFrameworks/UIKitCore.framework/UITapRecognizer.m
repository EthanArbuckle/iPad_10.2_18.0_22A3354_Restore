@implementation UITapRecognizer

- (unint64_t)numberOfTouchesRequired
{
  return self->_numberOfTouchesRequired;
}

- (unint64_t)numberOfTapsRequired
{
  return self->_numberOfTapsRequired;
}

- (void)startTapTimer:(double)a3
{
  -[UITapRecognizer clearTapTimer](self, "clearTapTimer");
  *((_BYTE *)self + 164) |= 1u;
  -[UITapRecognizer performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_tooSlow_, 0, a3);
}

- (void)_reset
{
  -[UITapRecognizer clearTapTimer](self, "clearTapTimer");
  -[UITapRecognizer clearMultitouchTimer](self, "clearMultitouchTimer");
  *(_QWORD *)&self->_currentNumberOfTouches = 0;
  self->_numberOfTouchesForCurrentTap = 0;
  self->_startPoint = (CGPoint)*MEMORY[0x1E0C9D538];
  *((_BYTE *)self + 164) &= ~4u;
  self->_strongestDirectionalAxis = -1;
  self->_strongestDirectionalForce = 0.0;
  -[NSMutableSet removeAllObjects](self->_activeTouches, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_touches, "removeAllObjects");
}

- (void)dealloc
{
  objc_super v3;

  -[UITapRecognizer clearTapTimer](self, "clearTapTimer");
  -[UITapRecognizer clearMultitouchTimer](self, "clearMultitouchTimer");
  v3.receiver = self;
  v3.super_class = (Class)UITapRecognizer;
  -[UITapRecognizer dealloc](&v3, sel_dealloc);
}

- (void)clearTapTimer
{
  char v3;

  v3 = *((_BYTE *)self + 164);
  if ((v3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_tooSlow_, 0);
    v3 = *((_BYTE *)self + 164);
  }
  *((_BYTE *)self + 164) = v3 & 0xFE;
}

- (void)clearMultitouchTimer
{
  char v3;

  v3 = *((_BYTE *)self + 164);
  if ((v3 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_multitouchExpired_, 0);
    v3 = *((_BYTE *)self + 164);
  }
  *((_BYTE *)self + 164) = v3 & 0xFD;
}

- (void)setNumberOfTapsRequired:(unint64_t)a3
{
  self->_numberOfTapsRequired = a3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UITapRecognizer)init
{
  UITapRecognizer *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UITapRecognizer;
  result = -[UITapRecognizer init](&v3, sel_init);
  if (result)
  {
    *(int64x2_t *)&result->_numberOfTouchesRequired = vdupq_n_s64(1uLL);
    result->_buttonMaskRequired = 1;
    *((_BYTE *)result + 164) &= 0xF8u;
    *(_OWORD *)&result->_allowableMovement = xmmword_18667D070;
    *(_OWORD *)&result->_allowableTouchTimeSeparation = xmmword_18667D080;
    result->_startTime = 0.0;
    result->_maximumIntervalBetweenSuccessiveTaps = 0.35;
    result->_minimumTapDuration = 0.0;
    *(_WORD *)&result->_countsOnlyActiveTouches = 1;
    result->_strongestDirectionalAxis = -1;
    result->_strongestDirectionalForce = 0.0;
    result->_exclusiveDirectionalAxis = -1;
  }
  return result;
}

- (void)setExclusiveDirectionalAxis:(int64_t)a3
{
  self->_exclusiveDirectionalAxis = a3;
}

- (void)setNumberOfTouchesRequired:(unint64_t)a3
{
  self->_numberOfTouchesRequired = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_touches, 0);
  objc_storeStrong((id *)&self->_activeTouches, 0);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  CGFloat v6;
  CGFloat v7;
  double v8;
  double startTime;
  id WeakRetained;

  objc_msgSend(a4, "_digitizerLocation");
  self->_digitizerLocation.x = v6;
  self->_digitizerLocation.y = v7;
  -[NSMutableSet minusSet:](self->_activeTouches, "minusSet:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_msgSend(WeakRetained, "tapIsPossibleForTapRecognizer:", self))
  {
    if (self->_numberOfTouchesRequired == self->_currentNumberOfTouches)
    {
      v8 = CACurrentMediaTime();
      startTime = self->_startTime;
      if (!-[NSMutableSet count](self->_activeTouches, "count") && v8 - startTime > self->_minimumTapDuration)
        -[UITapRecognizer _interactionEndedTouch:](self, "_interactionEndedTouch:", 1, v8 - startTime);
    }
    else
    {
      objc_msgSend(WeakRetained, "tapRecognizerFailedToRecognizeTap:", self);
    }
  }

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  CGFloat v7;
  CGFloat v8;
  NSMutableSet *activeTouches;
  NSMutableSet *v10;
  NSMutableSet *v11;
  id WeakRetained;
  NSMutableSet *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  unint64_t v19;
  unint64_t numberOfTouchesRequired;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  NSMutableArray *v24;
  NSMutableArray *touches;
  NSMutableSet *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  double v31;
  double v32;
  double v33;
  double v34;
  id v35;
  char v36;
  id v37;
  CGFloat v38;
  CGFloat v39;
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
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  self->_startTime = CACurrentMediaTime();
  objc_msgSend(a4, "_digitizerLocation");
  self->_digitizerLocation.x = v7;
  self->_digitizerLocation.y = v8;
  activeTouches = self->_activeTouches;
  if (!activeTouches)
  {
    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v11 = self->_activeTouches;
    self->_activeTouches = v10;

    activeTouches = self->_activeTouches;
  }
  -[NSMutableSet unionSet:](activeTouches, "unionSet:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (self->_countsOnlyActiveTouches)
  {
    if (-[NSMutableSet count](self->_activeTouches, "count") <= self->_numberOfTouchesRequired)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(a4, "allTouches");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");
  numberOfTouchesRequired = self->_numberOfTouchesRequired;

  if (v19 > numberOfTouchesRequired)
  {
LABEL_5:
    -[UITapRecognizer clearTapTimer](self, "clearTapTimer");
    -[UITapRecognizer clearMultitouchTimer](self, "clearMultitouchTimer");
    objc_msgSend(WeakRetained, "tapRecognizerFailedToRecognizeTap:", self);
  }
LABEL_6:
  if (self->_allowableSeparation != 1.79769313e308
    && -[UITapRecognizer activeTouchesExceedAllowableSeparation](self, "activeTouchesExceedAllowableSeparation"))
  {
    -[UITapRecognizer clearTapTimer](self, "clearTapTimer");
    -[UITapRecognizer clearMultitouchTimer](self, "clearMultitouchTimer");
    objc_msgSend(WeakRetained, "tapRecognizerFailedToRecognizeTap:", self);
  }
  if ((*((_BYTE *)self + 164) & 4) != 0)
    goto LABEL_23;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v13 = self->_activeTouches;
  v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v45;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v45 != v16)
          objc_enumerationMutation(v13);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "_isPointerTouch"))
        {
          *((_BYTE *)self + 164) |= 4u;
          goto LABEL_22;
        }
      }
      v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      if (v15)
        continue;
      break;
    }
  }
LABEL_22:

  if ((*((_BYTE *)self + 164) & 4) != 0)
  {
LABEL_23:
    v21 = objc_msgSend(a4, "_buttonMask");
    v22 = objc_msgSend(a4, "_modifierFlags");
    v23 = v21 & 0xFFFFFFFFFFFFFFFCLL | 2;
    if ((v22 & 0x40000) == 0)
      v23 = v21;
    if ((v23 & self->_buttonMaskRequired) == 0)
    {
      -[UITapRecognizer clearTapTimer](self, "clearTapTimer");
      -[UITapRecognizer clearMultitouchTimer](self, "clearMultitouchTimer");
      objc_msgSend(WeakRetained, "tapRecognizerFailedToRecognizeTap:", self);
    }
  }
  if (objc_msgSend(WeakRetained, "tapIsPossibleForTapRecognizer:", self))
  {
    if (!self->_currentNumberOfTouches)
      -[UITapRecognizer _beginInteraction](self, "_beginInteraction");
    self->_currentNumberOfTouches = -[NSMutableSet count](self->_activeTouches, "count");
    self->_numberOfTouchesForCurrentTap += objc_msgSend(a3, "count");
    if (self->_numberOfTouchesRequired == self->_currentNumberOfTouches)
    {
      -[NSMutableArray removeAllObjects](self->_touches, "removeAllObjects");
      if (!self->_touches)
      {
        v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        touches = self->_touches;
        self->_touches = v24;

      }
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v26 = self->_activeTouches;
      v27 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v41;
        do
        {
          for (j = 0; j != v28; ++j)
          {
            if (*(_QWORD *)v41 != v29)
              objc_enumerationMutation(v26);
            -[NSMutableArray addObject:](self->_touches, "addObject:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j), (_QWORD)v40);
          }
          v28 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
        }
        while (v28);
      }

      if (!self->_currentNumberOfTaps)
      {
LABEL_47:
        -[UITapRecognizer _locationInSceneReferenceSpace](self, "_locationInSceneReferenceSpace", (_QWORD)v40);
        self->_startPoint.x = v38;
        self->_startPoint.y = v39;
        goto LABEL_48;
      }
      if (self->_allowableMovement != 1.79769313e308)
      {
        -[UITapRecognizer _locationInSceneReferenceSpace](self, "_locationInSceneReferenceSpace");
        v33 = sqrt((self->_startPoint.x - v31) * (self->_startPoint.x - v31)+ (self->_startPoint.y - v32) * (self->_startPoint.y - v32));
        -[UITapRecognizer _effectiveAllowableMovement](self, "_effectiveAllowableMovement");
        if (v33 > v34)
        {
          if (!self->_continuousTapRecognition)
          {
            objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
            -[UITapRecognizer clearTapTimer](self, "clearTapTimer");
            -[UITapRecognizer clearMultitouchTimer](self, "clearMultitouchTimer");
            objc_msgSend(WeakRetained, "tapRecognizerFailedToRecognizeTap:", self);
            goto LABEL_48;
          }
          v35 = objc_loadWeakRetained((id *)&self->_delegate);
          v36 = objc_opt_respondsToSelector();

          if ((v36 & 1) != 0)
          {
            v37 = objc_loadWeakRetained((id *)&self->_delegate);
            objc_msgSend(v37, "resetTapCountForTapRecognizer:", self);

          }
          self->_currentNumberOfTaps = 0;
          goto LABEL_47;
        }
      }
    }
  }
LABEL_48:

}

- (CGPoint)_locationInSceneReferenceSpace
{
  double v2;
  double v3;
  CGPoint result;

  v2 = _CentroidOfTouches(self->_touches, 0);
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)_beginInteraction
{
  double v3;
  double v4;
  double v5;

  -[UITapRecognizer maximumTapDuration](self, "maximumTapDuration");
  -[UITapRecognizer startTapTimer:](self, "startTapTimer:");
  if (-[UITapRecognizer numberOfTouchesRequired](self, "numberOfTouchesRequired") >= 2)
  {
    -[UITapRecognizer allowableTouchTimeSeparation](self, "allowableTouchTimeSeparation");
    v4 = v3;
    -[UITapRecognizer maximumTapDuration](self, "maximumTapDuration");
    if (v4 < v5)
    {
      -[UITapRecognizer allowableTouchTimeSeparation](self, "allowableTouchTimeSeparation");
      -[UITapRecognizer startMultitouchTimer:](self, "startMultitouchTimer:");
    }
  }
}

- (double)maximumTapDuration
{
  return self->_maximumTapDuration;
}

- (double)allowableTouchTimeSeparation
{
  return self->_allowableTouchTimeSeparation;
}

- (void)_interactionEndedTouch:(BOOL)a3
{
  uint64_t v4;
  int64_t exclusiveDirectionalAxis;
  int64_t strongestDirectionalAxis;
  id v8;
  id WeakRetained;

  v4 = self->_currentNumberOfTaps + 1;
  self->_currentNumberOfTaps = v4;
  exclusiveDirectionalAxis = self->_exclusiveDirectionalAxis;
  if (exclusiveDirectionalAxis != -1)
  {
    strongestDirectionalAxis = self->_strongestDirectionalAxis;
    if (strongestDirectionalAxis != -1 && exclusiveDirectionalAxis != strongestDirectionalAxis)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "tapRecognizerFailedToRecognizeTap:", self);

      return;
    }
  }
  if (self->_numberOfTapsRequired != v4 && !self->_continuousTapRecognition)
  {
    if (a3)
    {
      self->_currentNumberOfTouches = 0;
      self->_numberOfTouchesForCurrentTap = 0;
    }
    goto LABEL_10;
  }
  -[UITapRecognizer clearTapTimer](self, "clearTapTimer", a3);
  -[UITapRecognizer clearMultitouchTimer](self, "clearMultitouchTimer");
  v8 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v8, "tapRecognizerRecognizedTap:", self);

  if (self->_continuousTapRecognition)
LABEL_10:
    -[UITapRecognizer startTapTimer:](self, "startTapTimer:", self->_maximumIntervalBetweenSuccessiveTaps);
}

- (void)startMultitouchTimer:(double)a3
{
  -[UITapRecognizer clearMultitouchTimer](self, "clearMultitouchTimer");
  *((_BYTE *)self + 164) |= 2u;
  -[UITapRecognizer performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_multitouchExpired_, 0, a3);
}

- (CGPoint)locationInView:(id)a3
{
  double x;
  double y;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  x = self->_startPoint.x;
  y = self->_startPoint.y;
  if (!-[NSMutableArray count](self->_touches, "count"))
  {
    -[UITapRecognizer locationInViewNotTrackingTouches:](self, "locationInViewNotTrackingTouches:", a3);
    x = v12;
    y = v13;
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (a3)
  {
LABEL_3:
    objc_msgSend(a3, "_window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_convertPointFromSceneReferenceSpace:", x, y);
    objc_msgSend(a3, "convertPoint:fromView:", 0);
    x = v8;
    y = v9;

  }
LABEL_4:
  v10 = x;
  v11 = y;
  result.y = v11;
  result.x = v10;
  return result;
}

- (BOOL)activeTouchesExceedAllowableSeparation
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double allowableSeparation;
  void *v9;
  double v10;
  BOOL v11;

  v3 = _BoundingRectForTouches(self->_activeTouches, 0);
  v5 = v4;
  v7 = v6;
  allowableSeparation = self->_allowableSeparation;
  -[UITapRecognizer delegate](self, "delegate", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_touchSloppinessFactor");
  v11 = allowableSeparation * v10 < sqrt(v5 * v5 + v7 * v7);

  return v11;
}

- (UITapRecognizerDelegate)delegate
{
  return (UITapRecognizerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setAllowableMovement:(double)a3
{
  self->_allowableMovement = a3;
}

- (int64_t)buttonMaskRequired
{
  return self->_buttonMaskRequired;
}

- (double)allowableSeparation
{
  return self->_allowableSeparation;
}

- (void)setMaximumTapDuration:(double)a3
{
  self->_maximumTapDuration = a3;
}

- (void)setAllowableTouchTimeSeparation:(double)a3
{
  self->_allowableTouchTimeSeparation = a3;
}

- (void)setAllowableSeparation:(double)a3
{
  self->_allowableSeparation = a3;
}

- (void)tooSlow:(id)a3
{
  id WeakRetained;

  -[UITapRecognizer clearTapTimer](self, "clearTapTimer", a3);
  -[UITapRecognizer clearMultitouchTimer](self, "clearMultitouchTimer");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tapRecognizerFailedToRecognizeTap:", self);

}

- (void)setButtonMaskRequired:(int64_t)a3
{
  self->_buttonMaskRequired = a3;
}

- (void)setMaximumIntervalBetweenSuccessiveTaps:(double)a3
{
  self->_maximumIntervalBetweenSuccessiveTaps = a3;
}

- (void)setContinuousTapRecognition:(BOOL)a3
{
  self->_continuousTapRecognition = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UITapRecognizer)initWithCoder:(id)a3
{
  char *v4;
  UITapRecognizer *v5;
  float v6;
  float v7;
  float v8;
  UITapRecognizer *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UITapRecognizer;
  v4 = -[UITapRecognizer init](&v11, sel_init);
  v5 = (UITapRecognizer *)v4;
  if (v4)
  {
    *(int64x2_t *)(v4 + 8) = vdupq_n_s64(1uLL);
    *((_QWORD *)v4 + 3) = 1;
    v4[164] &= 0xF8u;
    *(_OWORD *)(v4 + 72) = xmmword_18667D070;
    *(_OWORD *)(v4 + 88) = xmmword_18667D080;
    *((_QWORD *)v4 + 14) = 0;
    *((_QWORD *)v4 + 15) = 0x3FD6666666666666;
    *((_QWORD *)v4 + 13) = 0;
    *(_WORD *)(v4 + 165) = 1;
    *((_QWORD *)v4 + 17) = -1;
    *((_QWORD *)v4 + 18) = 0;
    *((_QWORD *)v4 + 22) = -1;
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("UITapRecognizer.numberOfTapsRequired")))
      v5->_numberOfTapsRequired = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("UITapRecognizer.numberOfTapsRequired"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("UITapRecognizer.continuousTapRecognition")))
      v5->_continuousTapRecognition = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("UITapRecognizer.continuousTapRecognition"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("UITapRecognizer.numberOfTouchesRequired")))
      v5->_numberOfTouchesRequired = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("UITapRecognizer.numberOfTouchesRequired"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("UITapRecognizer.buttonMaskRequired")))
      v5->_buttonMaskRequired = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("UITapRecognizer.buttonMaskRequired"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("UITapRecognizer.allowableMovement")))
    {
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("UITapRecognizer.allowableMovement"));
      v5->_allowableMovement = v6;
    }
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("UITapRecognizer.allowableSeparation")))
    {
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("UITapRecognizer.allowableSeparation"));
      v5->_allowableSeparation = v7;
    }
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("UITapRecognizer.maximumIntervalBetweenSuccessiveTaps")))
    {
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("UITapRecognizer.maximumIntervalBetweenSuccessiveTaps"));
      v5->_maximumIntervalBetweenSuccessiveTaps = v8;
    }
    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t numberOfTapsRequired;
  unint64_t numberOfTouchesRequired;
  int64_t buttonMaskRequired;
  double allowableMovement;
  double allowableSeparation;
  double maximumIntervalBetweenSuccessiveTaps;

  numberOfTapsRequired = self->_numberOfTapsRequired;
  if (numberOfTapsRequired != 1)
    objc_msgSend(a3, "encodeInteger:forKey:", numberOfTapsRequired, CFSTR("UITapRecognizer.numberOfTapsRequired"));
  if (self->_continuousTapRecognition)
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("UITapRecognizer.continuousTapRecognition"));
  numberOfTouchesRequired = self->_numberOfTouchesRequired;
  if (numberOfTouchesRequired != 1)
    objc_msgSend(a3, "encodeInteger:forKey:", numberOfTouchesRequired, CFSTR("UITapRecognizer.numberOfTouchesRequired"));
  buttonMaskRequired = self->_buttonMaskRequired;
  if (buttonMaskRequired != 1)
    objc_msgSend(a3, "encodeInteger:forKey:", buttonMaskRequired, CFSTR("UITapRecognizer.buttonMaskRequired"));
  allowableMovement = self->_allowableMovement;
  if (allowableMovement != 45.0)
  {
    *(float *)&allowableMovement = allowableMovement;
    objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("UITapRecognizer.allowableMovement"), allowableMovement);
  }
  allowableSeparation = self->_allowableSeparation;
  if (allowableSeparation != 1.79769313e308)
  {
    *(float *)&allowableSeparation = allowableSeparation;
    objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("UITapRecognizer.allowableSeparation"), allowableSeparation);
  }
  maximumIntervalBetweenSuccessiveTaps = self->_maximumIntervalBetweenSuccessiveTaps;
  if (maximumIntervalBetweenSuccessiveTaps != 0.35)
  {
    *(float *)&maximumIntervalBetweenSuccessiveTaps = maximumIntervalBetweenSuccessiveTaps;
    objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("UITapRecognizer.maximumIntervalBetweenSuccessiveTaps"), maximumIntervalBetweenSuccessiveTaps);
  }
}

- (void)multitouchExpired:(id)a3
{
  unint64_t numberOfTouchesForCurrentTap;
  id WeakRetained;

  numberOfTouchesForCurrentTap = self->_numberOfTouchesForCurrentTap;
  if (-[UITapRecognizer numberOfTouchesRequired](self, "numberOfTouchesRequired", a3) > numberOfTouchesForCurrentTap)
  {
    -[UITapRecognizer clearTapTimer](self, "clearTapTimer");
    -[UITapRecognizer clearMultitouchTimer](self, "clearMultitouchTimer");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "tapRecognizerFailedToRecognizeTap:", self);

  }
}

- (double)_effectiveAllowableMovement
{
  double allowableMovement;
  void *v3;
  double v4;
  double v5;

  allowableMovement = self->_allowableMovement;
  -[UITapRecognizer delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_touchSloppinessFactor");
  v5 = allowableMovement * v4;

  return v5;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id WeakRetained;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  WeakRetained = a3;
  v7 = objc_msgSend(WeakRetained, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v9)
        objc_enumerationMutation(WeakRetained);
      v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v10);
      objc_msgSend(v11, "locationInView:", 0, (_QWORD)v24);
      v13 = v12;
      v15 = v14;
      objc_msgSend(v11, "previousLocationInView:", 0);
      if (sqrt((v16 - v13) * (v16 - v13) + (v17 - v15) * (v17 - v15)) != 0.0)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(WeakRetained, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_13;
      }
    }

    objc_msgSend(a4, "_digitizerLocation");
    self->_digitizerLocation.x = v18;
    self->_digitizerLocation.y = v19;
    if (self->_allowableMovement != 1.79769313e308)
    {
      -[UITapRecognizer _locationInSceneReferenceSpace](self, "_locationInSceneReferenceSpace");
      v22 = sqrt((self->_startPoint.x - v20) * (self->_startPoint.x - v20)+ (self->_startPoint.y - v21) * (self->_startPoint.y - v21));
      -[UITapRecognizer _effectiveAllowableMovement](self, "_effectiveAllowableMovement");
      if (v22 > v23)
      {
        objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "tapRecognizerFailedToRecognizeTap:", self);
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:

  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id WeakRetained;

  self->_numberOfTouchesForCurrentTap -= objc_msgSend(a3, "count");
  -[NSMutableSet minusSet:](self->_activeTouches, "minusSet:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tapRecognizerFailedToRecognizeTap:", self);

}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id WeakRetained;
  int v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_msgSend(WeakRetained, "tapIsPossibleForTapRecognizer:", self);

  if (v6)
    -[UITapRecognizer _beginInteraction](self, "_beginInteraction");
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  double v5;
  double v6;
  id v7;

  if (self->_exclusiveDirectionalAxis != -1)
  {
    objc_msgSend(a4, "_directionalPressWithStrongestForce", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "force");
    if (v5 > self->_strongestDirectionalForce)
    {
      objc_msgSend(v7, "force");
      self->_strongestDirectionalForce = v6;
      self->_strongestDirectionalAxis = objc_msgSend(v7, "type");
    }

  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id WeakRetained;
  int v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_msgSend(WeakRetained, "tapIsPossibleForTapRecognizer:", self);

  if (v6)
    -[UITapRecognizer _interactionEndedTouch:](self, "_interactionEndedTouch:", 0);
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "tapRecognizerFailedToRecognizeTap:", self);

}

- (BOOL)continuousTapRecognition
{
  return self->_continuousTapRecognition;
}

- (double)allowableMovement
{
  return self->_allowableMovement;
}

- (double)maximumIntervalBetweenSuccessiveTaps
{
  return self->_maximumIntervalBetweenSuccessiveTaps;
}

- (CGPoint)locationInViewNotTrackingTouches:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
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
  void *v18;
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
  CGPoint result;

  -[UITapRecognizer delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v7, "focusedItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[_UIFocusItemInfo infoWithItem:](_UIFocusItemInfo, "infoWithItem:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "focusedRectInCoordinateSpace:", v6);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(v5, "_window");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_convertPointToSceneReferenceSpace:", v11 + v15 * 0.5, v13 + v17 * 0.5);
    v20 = v19;
    v22 = v21;

  }
  else
  {
    if (v5)
    {
      objc_msgSend(v5, "bounds");
      objc_msgSend(v5, "convertPoint:toView:", v6, v24 + v23 * 0.5, v26 + v25 * 0.5);
      objc_msgSend(v6, "_convertPointToSceneReferenceSpace:");
      v20 = v27;
      v22 = v28;
      goto LABEL_9;
    }
    objc_msgSend(a3, "_window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "center");
    objc_msgSend(v9, "_convertPointToSceneReferenceSpace:");
    v20 = v31;
    v22 = v32;
  }

LABEL_9:
  v29 = v20;
  v30 = v22;
  result.y = v30;
  result.x = v29;
  return result;
}

- (CGPoint)locationInView:(id)a3 focusSystem:(id)a4
{
  void *v5;
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
  CGPoint result;

  objc_msgSend(a4, "focusedItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[_UIFocusItemInfo infoWithItem:](_UIFocusItemInfo, "infoWithItem:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "focusedRectInCoordinateSpace:", a3);
    v9 = v8 + v7 * 0.5;
    v12 = v11 + v10 * 0.5;
  }
  else
  {
    objc_msgSend(a3, "_window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "center");
    v9 = v13;
    v12 = v14;
  }

  v15 = v9;
  v16 = v12;
  result.y = v16;
  result.x = v15;
  return result;
}

- (NSSet)activeTouches
{
  return (NSSet *)self->_activeTouches;
}

- (NSArray)touches
{
  return &self->_touches->super;
}

- (double)minimumTapDuration
{
  return self->_minimumTapDuration;
}

- (void)setMinimumTapDuration:(double)a3
{
  self->_minimumTapDuration = a3;
}

- (BOOL)countsOnlyActiveTouches
{
  return self->_countsOnlyActiveTouches;
}

- (void)setCountsOnlyActiveTouches:(BOOL)a3
{
  self->_countsOnlyActiveTouches = a3;
}

- (int64_t)exclusiveDirectionalAxis
{
  return self->_exclusiveDirectionalAxis;
}

@end
