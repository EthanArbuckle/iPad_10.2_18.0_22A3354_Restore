@implementation _UIKBProductivityPinchGestureRecognizer

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  self->_hasFailedOnOtherDominantMotion = 0;
  v5 = a3;
  -[_UIKBProductivityPinchGestureRecognizer activeTouches](self, "activeTouches");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeObjectsInArray:", v7);
  -[_UIKBProductivityPinchGestureRecognizer activeTouches](self, "activeTouches");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  v10 = self->_numberOfTouchesRequired - 1;

  if (v9 < v10)
  {
    if (self->_recognized)
    {
      self->_recognized = 0;
      v11 = 3;
    }
    else
    {
      v11 = 5;
    }
    -[UIGestureRecognizer setState:](self, "setState:", v11);
  }
}

- (void)reset
{
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIKBProductivityPinchGestureRecognizer;
  -[UIGestureRecognizer reset](&v7, sel_reset);
  -[_UIKBProductivityPinchGestureRecognizer activeTouches](self, "activeTouches");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[_UIKBProductivityPinchGestureRecognizer setActiveTouches:](self, "setActiveTouches:", 0);
  -[_UIKBProductivityPinchGestureRecognizer beginTouchLocations](self, "beginTouchLocations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[_UIKBProductivityPinchGestureRecognizer setBeginTouchLocations:](self, "setBeginTouchLocations:", 0);
  -[_UIKBProductivityPinchGestureRecognizer setBeginPinchTimestamp:](self, "setBeginPinchTimestamp:", 0.0);
  -[_UIKBProductivityPinchGestureRecognizer setBeforeReductionTimeInterval:](self, "setBeforeReductionTimeInterval:", 0.0);
  -[_UIKBProductivityPinchGestureRecognizer setBeginPerimeter:](self, "setBeginPerimeter:", 0.0);
  -[_UIKBProductivityPinchGestureRecognizer setBeginCentroid:](self, "setBeginCentroid:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  -[_UIKBProductivityPinchGestureRecognizer setTooMuchSingleMovement:](self, "setTooMuchSingleMovement:", 0);
  self->_pinchDirection = 0;
  self->_recognized = 0;
  self->_hasFailedOnOtherDominantMotion = 0;
  -[_UIKBProductivityPinchGestureRecognizer clearMultitouchTimer](self, "clearMultitouchTimer");
  objc_msgSend(self->_transformAnalyzer, "reset");
  -[_UIKBProductivityPinchGestureRecognizer _updateTransformAnalyzerWeights](self, "_updateTransformAnalyzerWeights");
  v5 = MEMORY[0x1E0C9BAA8];
  v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&self->_transform.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&self->_transform.c = v6;
  *(_OWORD *)&self->_transform.tx = *(_OWORD *)(v5 + 32);
}

- (void)setBeginTouchLocations:(id)a3
{
  objc_storeStrong((id *)&self->_beginTouchLocations, a3);
}

- (void)setBeginPinchTimestamp:(double)a3
{
  self->_beginPinchTimestamp = a3;
}

- (void)setActiveTouches:(id)a3
{
  objc_storeStrong((id *)&self->_activeTouches, a3);
}

- (void)clearMultitouchTimer
{
  if (self->_multitouchTimerEnabled)
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_multitouchExpired_, 0);
  self->_multitouchTimerEnabled = 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  unint64_t numberOfTouchesRequired;
  double v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "timestamp");
  -[_UIKBProductivityPinchGestureRecognizer setBeginPinchTimestamp:](self, "setBeginPinchTimestamp:");
  v34 = v7;
  -[UIGestureRecognizer _activeTouchesForEvent:](self, "_activeTouchesForEvent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKBProductivityPinchGestureRecognizer activeTouches](self, "activeTouches");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKBProductivityPinchGestureRecognizer setActiveTouches:](self, "setActiveTouches:", v10);

  }
  -[_UIKBProductivityPinchGestureRecognizer activeTouches](self, "activeTouches");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v6;
  objc_msgSend(v6, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObjectsFromArray:", v12);

  -[_UIKBProductivityPinchGestureRecognizer beginTouchLocations](self, "beginTouchLocations");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKBProductivityPinchGestureRecognizer setBeginTouchLocations:](self, "setBeginTouchLocations:", v14);

  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[_UIKBProductivityPinchGestureRecognizer activeTouches](self, "activeTouches");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v37 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        -[_UIKBProductivityPinchGestureRecognizer beginTouchLocations](self, "beginTouchLocations");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKey:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
        {
          -[_UIKBProductivityPinchGestureRecognizer beginTouchLocations](self, "beginTouchLocations");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)MEMORY[0x1E0CB3B18];
          objc_msgSend(v20, "locationInView:", 0);
          objc_msgSend(v24, "valueWithCGPoint:");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v20, "_touchIdentifier"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKey:", v25, v26);

        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v17);
  }

  -[_UIKBProductivityPinchGestureRecognizer activeTouches](self, "activeTouches");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "count");

  numberOfTouchesRequired = self->_numberOfTouchesRequired;
  if (v28 >= numberOfTouchesRequired)
  {
    if (!self->_recognized)
    {
      self->_hasFailedOnOtherDominantMotion = 0;
      self->_recognized = 0;
      -[_UIKBProductivityPinchGestureRecognizer activeTouches](self, "activeTouches");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIKBProductivityPinchGestureRecognizer perimeterOfTouches:](self, "perimeterOfTouches:", v31);
      -[_UIKBProductivityPinchGestureRecognizer setBeginPerimeter:](self, "setBeginPerimeter:");

      -[UIGestureRecognizer _centroidOfTouches:excludingEnded:](self, "_centroidOfTouches:excludingEnded:", v8, 1);
      -[_UIKBProductivityPinchGestureRecognizer setBeginCentroid:](self, "setBeginCentroid:");
      -[_UIKBProductivityPinchGestureRecognizer setBeforeReductionTimeInterval:](self, "setBeforeReductionTimeInterval:", 0.0);
      -[UIGestureRecognizer setState:](self, "setState:", 1);
      self->_pinchDirection = 0;
      -[_UIKBProductivityPinchGestureRecognizer activeTouches](self, "activeTouches");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIKBProductivityPinchGestureRecognizer avgDistanceToCentroid:](self, "avgDistanceToCentroid:", v32);
      self->_avgTouchesToCentroidDistance = v33;

      goto LABEL_23;
    }
  }
  else if (!self->_recognized)
  {
    -[_UIKBProductivityPinchGestureRecognizer allowableElapsedTimeForAllRequiredTouches](self, "allowableElapsedTimeForAllRequiredTouches");
    if (v30 > 0.0)
    {
      -[_UIKBProductivityPinchGestureRecognizer allowableElapsedTimeForAllRequiredTouches](self, "allowableElapsedTimeForAllRequiredTouches");
      -[_UIKBProductivityPinchGestureRecognizer startMultitouchTimer:](self, "startMultitouchTimer:");
      goto LABEL_23;
    }
    numberOfTouchesRequired = self->_numberOfTouchesRequired;
  }
  if (v28 == numberOfTouchesRequired)
    -[_UIKBProductivityPinchGestureRecognizer clearMultitouchTimer](self, "clearMultitouchTimer");
LABEL_23:

}

- (NSMutableArray)activeTouches
{
  return self->_activeTouches;
}

- (NSMutableDictionary)beginTouchLocations
{
  return self->_beginTouchLocations;
}

- (double)allowableElapsedTimeForAllRequiredTouches
{
  return self->_allowableElapsedTimeForAllRequiredTouches;
}

- (void)startMultitouchTimer:(double)a3
{
  -[_UIKBProductivityPinchGestureRecognizer clearMultitouchTimer](self, "clearMultitouchTimer");
  self->_multitouchTimerEnabled = 1;
  -[_UIKBProductivityPinchGestureRecognizer performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_multitouchExpired_, 0, a3);
}

- (void)setTooMuchSingleMovement:(BOOL)a3
{
  self->_tooMuchSingleMovement = a3;
}

- (void)setBeginPerimeter:(double)a3
{
  self->_beginPerimeter = a3;
}

- (void)setBeginCentroid:(CGPoint)a3
{
  self->_beginCentroid = a3;
}

- (void)setBeforeReductionTimeInterval:(double)a3
{
  self->_beforeReductionTimeInterval = a3;
}

- (void)_updateTransformAnalyzerWeights
{
  double v2;

  v2 = 0.330000013;
  if ((unint64_t)(self->super._state - 1) < 3)
    v2 = 1.0;
  objc_msgSend(self->_transformAnalyzer, "setPinchingWeight:", v2);
}

+ (id)productivityPinchGestureRecognizerWithTarget:(id)a3 action:(SEL)a4 delegate:(id)a5
{
  id v7;
  id v8;
  _UIKBProductivityPinchGestureRecognizer *v9;
  _UIKBProductivityPinchGestureRecognizer *v10;

  v7 = a5;
  v8 = a3;
  v9 = -[_UIKBProductivityPinchGestureRecognizer initWithTarget:action:]([_UIKBProductivityPinchGestureRecognizer alloc], "initWithTarget:action:", v8, a4);

  if (v9)
  {
    -[UIGestureRecognizer setAllowedTouchTypes:](v9, "setAllowedTouchTypes:", &unk_1E1A93620);
    -[UIGestureRecognizer setDelaysTouchesBegan:](v9, "setDelaysTouchesBegan:", 0);
    -[UIGestureRecognizer setDelaysTouchesEnded:](v9, "setDelaysTouchesEnded:", 0);
    if (_isSystemGestureForDelegate(v7))
      -[UIGestureRecognizer setCancelsTouchesInView:](v9, "setCancelsTouchesInView:", 0);
    -[UIGestureRecognizer setName:](v9, "setName:", CFSTR("com.apple.UIKit.kbProductivity.threeFingerPinch"));
    -[UIGestureRecognizer setDelegate:](v9, "setDelegate:", v7);
    -[_UIKBProductivityPinchGestureRecognizer setAllowableElapsedTimeForAllRequiredTouches:](v9, "setAllowableElapsedTimeForAllRequiredTouches:", 0.06);
    v10 = v9;
  }

  return v9;
}

- (BOOL)sufficientMotionInDirection:(int64_t)a3 withLocation:(CGPoint)a4 withScale:(double)a5 withAngle:(double)a6
{
  double y;
  double x;
  double v9;
  double v11;
  double v12;
  BOOL v13;
  double v14;

  if (a3 == 3)
  {
    v11 = fabs(a6);
    v12 = 0.314159265;
LABEL_8:
    v13 = v11 <= v12;
    return !v13;
  }
  if (a3 == 2)
  {
    v11 = vabdd_f64(1.0, a5);
    v12 = 0.08;
    goto LABEL_8;
  }
  if (a3 != 1)
    return 0;
  y = a4.y;
  x = a4.x;
  -[_UIKBProductivityPinchGestureRecognizer beginCentroid](self, "beginCentroid", a4.x, a4.y, a5, a6);
  if (vabdd_f64(x, v9) > 10.0)
    return 1;
  -[_UIKBProductivityPinchGestureRecognizer beginCentroid](self, "beginCentroid");
  v13 = vabdd_f64(y, v14) <= 10.0;
  return !v13;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  _BOOL4 v19;
  _BOOL4 v20;
  __int128 v21;
  _BOOL4 recognized;
  void *v24;
  double v25;
  void *v26;
  double v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  CGAffineTransform v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C99E60];
  -[_UIKBProductivityPinchGestureRecognizer activeTouches](self, "activeTouches");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "timestamp");
  v10 = v9;
  -[_UIKBProductivityPinchGestureRecognizer beginPinchTimestamp](self, "beginPinchTimestamp");
  v12 = 336;
  if (!self->_hasFailedOnOtherDominantMotion)
  {
    v13 = v11;
    if (objc_msgSend(v8, "count") == self->_numberOfTouchesRequired)
    {
      objc_msgSend(self->_transformAnalyzer, "analyzeTouches:", v8);
      objc_msgSend(v8, "allObjects");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIKBProductivityPinchGestureRecognizer perimeterOfTouches:](self, "perimeterOfTouches:", v14);
      v16 = v15;

      -[_UIKBProductivityPinchGestureRecognizer beginPerimeter](self, "beginPerimeter");
      memset(&v51, 0, sizeof(v51));
      CGAffineTransformMakeScale(&v51, v16 / v17, v16 / v17);
      v18 = objc_msgSend(self->_transformAnalyzer, "dominantComponent");
      -[UIGestureRecognizer _centroidOfTouches:excludingEnded:](self, "_centroidOfTouches:excludingEnded:", v8, 1);
      v19 = -[_UIKBProductivityPinchGestureRecognizer sufficientMotionInDirection:withLocation:withScale:withAngle:](self, "sufficientMotionInDirection:withLocation:withScale:withAngle:", v18);
      v20 = v19;
      if (!self->_recognized && v19 && objc_msgSend(self->_transformAnalyzer, "dominantComponent") != 2)
      {
        -[UIGestureRecognizer setState:](self, "setState:", 5);
        self->_hasFailedOnOtherDominantMotion = 1;
      }
      if (objc_msgSend(self->_transformAnalyzer, "dominantComponent") == 2)
      {
        v21 = *(_OWORD *)&v51.c;
        *(_OWORD *)&self->_transform.a = *(_OWORD *)&v51.a;
        *(_OWORD *)&self->_transform.c = v21;
        *(_OWORD *)&self->_transform.tx = *(_OWORD *)&v51.tx;
        recognized = self->_recognized;
        if (!self->_recognized && v20)
        {
          self->_recognized = 1;
          -[_UIKBProductivityPinchGestureRecognizer _updateTransformAnalyzerWeights](self, "_updateTransformAnalyzerWeights");
          -[UIGestureRecognizer setState:](self, "setState:", 1);
          objc_msgSend(v5, "timestamp");
          self->_pinchDirection = -[_UIKBProductivityPinchGestureRecognizer pinchDirectionWithCurrentTime:perimeter:](self, "pinchDirectionWithCurrentTime:perimeter:");
          -[_UIKBProductivityPinchGestureRecognizer activeTouches](self, "activeTouches");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIKBProductivityPinchGestureRecognizer avgDistanceToCentroid:](self, "avgDistanceToCentroid:", v24);
          self->_avgTouchesToCentroidDistance = v25;

          recognized = self->_recognized;
        }
        if (recognized || -[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStateChanged)
        {
          -[UIGestureRecognizer setState:](self, "setState:", 2);
          objc_msgSend(v5, "timestamp");
          self->_pinchDirection = -[_UIKBProductivityPinchGestureRecognizer pinchDirectionWithCurrentTime:perimeter:](self, "pinchDirectionWithCurrentTime:perimeter:");
          -[_UIKBProductivityPinchGestureRecognizer activeTouches](self, "activeTouches");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIKBProductivityPinchGestureRecognizer avgDistanceToCentroid:](self, "avgDistanceToCentroid:", v26);
          self->_avgTouchesToCentroidDistance = v27;

        }
      }
      else if (!self->_recognized)
      {
        -[_UIKBProductivityPinchGestureRecognizer setBeginPerimeter:](self, "setBeginPerimeter:", v16 / self->_transform.a);
      }
    }
    else if (-[UIGestureRecognizer state](self, "state") <= UIGestureRecognizerStatePossible)
    {
      v45 = 336;
      v46 = v8;
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v28 = v8;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v48 != v31)
              objc_enumerationMutation(v28);
            v33 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
            objc_msgSend(v33, "locationInView:", 0, v45, v46, (_QWORD)v47);
            v35 = v34;
            v37 = v36;
            -[_UIKBProductivityPinchGestureRecognizer beginTouchLocations](self, "beginTouchLocations");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v33, "_touchIdentifier"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "objectForKey:", v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "CGPointValue");
            v42 = v41;
            v44 = v43;

            if (sqrt((v42 - v35) * (v42 - v35) + (v44 - v37) * (v44 - v37)) > 20.0)
              -[_UIKBProductivityPinchGestureRecognizer setTooMuchSingleMovement:](self, "setTooMuchSingleMovement:", 1);
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
        }
        while (v30);
      }

      v12 = v45;
      v8 = v46;
    }
    if (-[_UIKBProductivityPinchGestureRecognizer tooMuchSingleMovement](self, "tooMuchSingleMovement", v45, v46)
      || v10 - v13 > 0.05 && -[UIGestureRecognizer state](self, "state", v10 - v13) == UIGestureRecognizerStatePossible)
    {
      -[UIGestureRecognizer setState:](self, "setState:", 5);
      *((_BYTE *)&self->super.super.isa + v12) = 1;
    }
  }

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t numberOfTouchesRequired;
  uint64_t v11;

  self->_recognized = 0;
  self->_hasFailedOnOtherDominantMotion = 0;
  v5 = a3;
  -[_UIKBProductivityPinchGestureRecognizer activeTouches](self, "activeTouches");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeObjectsInArray:", v7);
  -[_UIKBProductivityPinchGestureRecognizer activeTouches](self, "activeTouches");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  numberOfTouchesRequired = self->_numberOfTouchesRequired;

  if (v9 < numberOfTouchesRequired)
  {
    self->_pinchDirection = 0;
    if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStateBegan)
    {
      v11 = 4;
    }
    else if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStateChanged)
    {
      v11 = 4;
    }
    else
    {
      v11 = 5;
    }
    -[UIGestureRecognizer setState:](self, "setState:", v11);
  }
}

- (void)multitouchExpired:(id)a3
{
  void *v4;
  unint64_t v5;
  unint64_t numberOfTouchesRequired;

  -[_UIKBProductivityPinchGestureRecognizer activeTouches](self, "activeTouches", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  numberOfTouchesRequired = self->_numberOfTouchesRequired;

  if (v5 < numberOfTouchesRequired)
  {
    -[_UIKBProductivityPinchGestureRecognizer clearMultitouchTimer](self, "clearMultitouchTimer");
    -[UIGestureRecognizer setState:](self, "setState:", 5);
  }
}

- (_UIKBProductivityPinchGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _UIKBProductivityPinchGestureRecognizer *v4;
  _UIKBProductivityPinchGestureRecognizer *v5;
  _UIKBProductivityPinchGestureRecognizer *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIKBProductivityPinchGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithTarget:action:](&v8, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    _UIUndoPinchGestureRecognizerCommonInit((uint64_t)v4);
    v6 = v5;
  }

  return v5;
}

- (_UIKBProductivityPinchGestureRecognizer)initWithCoder:(id)a3
{
  _UIKBProductivityPinchGestureRecognizer *v3;
  _UIKBProductivityPinchGestureRecognizer *v4;
  _UIKBProductivityPinchGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIKBProductivityPinchGestureRecognizer;
  v3 = -[UIGestureRecognizer initWithCoder:](&v7, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    _UIUndoPinchGestureRecognizerCommonInit((uint64_t)v3);
    v5 = v4;
  }

  return v4;
}

- (double)scale
{
  return self->_transform.a;
}

- (int64_t)pinchDirectionWithCurrentTime:(double)a3 perimeter:(double)a4
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
  _BOOL4 v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int64_t result;
  double v23;
  double v24;

  -[_UIKBProductivityPinchGestureRecognizer beginPinchTimestamp](self, "beginPinchTimestamp", a3);
  -[_UIKBProductivityPinchGestureRecognizer activeTouches](self, "activeTouches");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKBProductivityPinchGestureRecognizer centroidOfTouches:](self, "centroidOfTouches:", v6);
  v8 = v7;
  v10 = v9;

  -[_UIKBProductivityPinchGestureRecognizer beginCentroid](self, "beginCentroid");
  v12 = vabdd_f64(v8, v11);
  -[_UIKBProductivityPinchGestureRecognizer beginCentroid](self, "beginCentroid");
  if (v12 <= vabdd_f64(v10, v13) * 5.0)
  {
    -[_UIKBProductivityPinchGestureRecognizer beginCentroid](self, "beginCentroid");
    v17 = vabdd_f64(v10, v16);
    -[_UIKBProductivityPinchGestureRecognizer beginCentroid](self, "beginCentroid");
    v19 = vabdd_f64(v8, v18) * 5.0;
    v15 = v17 > v19;
    -[_UIKBProductivityPinchGestureRecognizer beginPerimeter](self, "beginPerimeter");
    if (v20 <= a4)
      goto LABEL_7;
    if (v17 <= v19)
      return 8;
LABEL_6:
    -[_UIKBProductivityPinchGestureRecognizer beginPerimeter](self, "beginPerimeter");
    return 8 * (v21 * 0.8 >= a4);
  }
  -[_UIKBProductivityPinchGestureRecognizer beginPerimeter](self, "beginPerimeter");
  if (v14 > a4)
    goto LABEL_6;
  v15 = 1;
LABEL_7:
  -[_UIKBProductivityPinchGestureRecognizer beginPerimeter](self, "beginPerimeter");
  if (v23 >= a4)
    result = 0;
  else
    result = 10;
  if (v23 < a4 && v15)
  {
    -[_UIKBProductivityPinchGestureRecognizer beginPerimeter](self, "beginPerimeter");
    if (v24 * 1.2 <= a4)
      return 10;
    else
      return 0;
  }
  return result;
}

- (double)perimeterOfTouches:(id)a3
{
  id v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = 0.0;
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v6;
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 0.0;
    if (self)
    {
      _UIGestureRecognizerDistanceBetweenTouches(v8);
      v5 = v11;
    }

    if (objc_msgSend(v4, "count") == 3)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v12;
      objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v25[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (self)
      {
        _UIGestureRecognizerDistanceBetweenTouches(v14);
        v10 = v16;
      }

    }
    v17 = 0.0;
    if (objc_msgSend(v4, "count") == 3)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v18;
      objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (self)
      {
        _UIGestureRecognizerDistanceBetweenTouches(v20);
        v17 = v22;
      }

    }
    v5 = v5 + v10 + v17;
  }

  return v5;
}

- (CGPoint)centroidOfTouches:(id)a3
{
  id v3;
  double v4;
  double v5;
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
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGPoint result;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") > 1)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locationInView:", 0);
    v8 = v7;
    v10 = v9;

    objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "locationInView:", 0);
    v13 = v12;
    v15 = v14;

    if (objc_msgSend(v3, "count") == 3)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "locationInView:", 0);
      v18 = v17;
      v20 = v19;

    }
    else
    {
      v18 = *MEMORY[0x1E0C9D538];
      v20 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    }
    v5 = (v8 + v13 + v18) / 3.0;
    v4 = (v10 + v15 + v20) / 3.0;
  }
  else
  {
    v5 = *MEMORY[0x1E0C9D538];
    v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }

  v21 = v5;
  v22 = v4;
  result.y = v22;
  result.x = v21;
  return result;
}

- (double)avgDistanceToCentroid:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  unint64_t v10;
  double v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;

  v4 = a3;
  v5 = 0.0;
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    -[_UIKBProductivityPinchGestureRecognizer centroidOfTouches:](self, "centroidOfTouches:", v4);
    v7 = v6;
    v9 = v8;
    if ((unint64_t)objc_msgSend(v4, "count") > 2)
    {
      v10 = 3;
    }
    else
    {
      v10 = objc_msgSend(v4, "count");
      if (!v10)
      {
        v11 = 0.0;
LABEL_8:
        v5 = v11 / (double)v10;
        goto LABEL_9;
      }
    }
    v12 = 0;
    v11 = 0.0;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "locationInView:", 0);
      v11 = v11 + sqrt((v14 - v7) * (v14 - v7) + (v15 - v9) * (v15 - v9));

      ++v12;
    }
    while (v10 != v12);
    goto LABEL_8;
  }
LABEL_9:

  return v5;
}

- (double)avgTouchesToCentroidDistance
{
  return self->_avgTouchesToCentroidDistance;
}

- (int64_t)pinchDirection
{
  return self->_pinchDirection;
}

- (double)beginPinchTimestamp
{
  return self->_beginPinchTimestamp;
}

- (double)beforeReductionTimeInterval
{
  return self->_beforeReductionTimeInterval;
}

- (double)beginPerimeter
{
  return self->_beginPerimeter;
}

- (CGPoint)beginCentroid
{
  double x;
  double y;
  CGPoint result;

  x = self->_beginCentroid.x;
  y = self->_beginCentroid.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAllowableElapsedTimeForAllRequiredTouches:(double)a3
{
  self->_allowableElapsedTimeForAllRequiredTouches = a3;
}

- (BOOL)tooMuchSingleMovement
{
  return self->_tooMuchSingleMovement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beginTouchLocations, 0);
  objc_storeStrong((id *)&self->_activeTouches, 0);
  objc_storeStrong(&self->_transformAnalyzer, 0);
}

@end
