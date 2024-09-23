@implementation _UIKBProductivityPanGestureRecognizer

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  NSUInteger v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  objc_super v24;

  v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_UIKBProductivityPanGestureRecognizer;
  -[UIPanGestureRecognizer touchesEnded:withEvent:](&v24, sel_touchesEnded_withEvent_, v6, a4);
  -[UIGestureRecognizer delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_isSystemGestureForDelegate(v7) & 1) != 0
    || ((-[_UIKBProductivityPanGestureRecognizer beginPanCentroid](self, "beginPanCentroid"), v9 == *MEMORY[0x1E0C9D538])
      ? (v10 = v8 == *(double *)(MEMORY[0x1E0C9D538] + 8))
      : (v10 = 0),
        v10))
  {

  }
  else
  {
    -[_UIKBProductivityPanGestureRecognizer activeTouches](self, "activeTouches");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    v13 = -[UIPanGestureRecognizer minimumNumberOfTouches](self, "minimumNumberOfTouches");

    if (v12 == v13)
    {
      objc_msgSend(v6, "allObjects");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIKBProductivityPanGestureRecognizer centroidOfTouches:](self, "centroidOfTouches:", v14);
      v16 = v15;
      v18 = v17;

      -[_UIKBProductivityPanGestureRecognizer beginPanCentroid](self, "beginPanCentroid");
      v20 = vabdd_f64(v16, v19);
      -[_UIKBProductivityPanGestureRecognizer beginPanCentroid](self, "beginPanCentroid");
      if (v20 <= vabdd_f64(v18, v21))
        -[UIGestureRecognizer setState:](self, "setState:", 5);
    }
  }
  -[_UIKBProductivityPanGestureRecognizer activeTouches](self, "activeTouches");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "minusSet:", v6);

  -[_UIKBProductivityPanGestureRecognizer shiftTouches](self, "shiftTouches");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "minusSet:", v6);

}

- (void)reset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIKBProductivityPanGestureRecognizer;
  -[UIGestureRecognizer reset](&v7, sel_reset);
  -[_UIKBProductivityPanGestureRecognizer activeTouches](self, "activeTouches");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[_UIKBProductivityPanGestureRecognizer setActiveTouches:](self, "setActiveTouches:", 0);
  -[_UIKBProductivityPanGestureRecognizer shiftTouches](self, "shiftTouches");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[_UIKBProductivityPanGestureRecognizer setShiftTouches:](self, "setShiftTouches:", 0);
  -[_UIKBProductivityPanGestureRecognizer beginTouchLocations](self, "beginTouchLocations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[_UIKBProductivityPanGestureRecognizer setBeginTouchLocations:](self, "setBeginTouchLocations:", 0);
  -[_UIKBProductivityPanGestureRecognizer transformAnalyzer](self, "transformAnalyzer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reset");

  -[_UIKBProductivityPanGestureRecognizer setBeginPanTimestamp:](self, "setBeginPanTimestamp:", 0.0);
  -[_UIKBProductivityPanGestureRecognizer setBeginPanCentroid:](self, "setBeginPanCentroid:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  -[_UIKBProductivityPanGestureRecognizer setActiveTouches:](self, "setActiveTouches:", 0);
  -[_UIKBProductivityPanGestureRecognizer setShiftTouches:](self, "setShiftTouches:", 0);
  -[_UIKBProductivityPanGestureRecognizer setTooMuchSingleMovement:](self, "setTooMuchSingleMovement:", 0);
}

- (void)setShiftTouches:(id)a3
{
  objc_storeStrong((id *)&self->_shiftTouches, a3);
}

- (void)setActiveTouches:(id)a3
{
  objc_storeStrong((id *)&self->_activeTouches, a3);
}

- (NSMutableSet)shiftTouches
{
  return self->_shiftTouches;
}

- (void)setBeginTouchLocations:(id)a3
{
  objc_storeStrong((id *)&self->_beginTouchLocations, a3);
}

- (void)setBeginPanTimestamp:(double)a3
{
  self->_beginPanTimestamp = a3;
}

- (void)setBeginPanCentroid:(CGPoint)a3
{
  self->_beginPanCentroid = a3;
}

- (_UIGestureRecognizerTransformAnalyzer)transformAnalyzer
{
  return self->_transformAnalyzer;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSUInteger v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  uint64_t v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  objc_super v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[_UIKBProductivityPanGestureRecognizer beginPanTimestamp](self, "beginPanTimestamp");
  if (v8 == 0.0)
  {
    objc_msgSend(v7, "timestamp");
    -[_UIKBProductivityPanGestureRecognizer setBeginPanTimestamp:](self, "setBeginPanTimestamp:");
  }
  v49.receiver = self;
  v49.super_class = (Class)_UIKBProductivityPanGestureRecognizer;
  -[UIPanGestureRecognizer touchesBegan:withEvent:](&v49, sel_touchesBegan_withEvent_, v6, v7);
  -[_UIKBProductivityPanGestureRecognizer activeTouches](self, "activeTouches");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKBProductivityPanGestureRecognizer setActiveTouches:](self, "setActiveTouches:", v10);

  }
  v40 = v7;
  -[_UIKBProductivityPanGestureRecognizer activeTouches](self, "activeTouches");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unionSet:", v6);

  -[_UIKBProductivityPanGestureRecognizer beginTouchLocations](self, "beginTouchLocations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKBProductivityPanGestureRecognizer setBeginTouchLocations:](self, "setBeginTouchLocations:", v13);

  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  -[_UIKBProductivityPanGestureRecognizer activeTouches](self, "activeTouches");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v46 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        -[_UIKBProductivityPanGestureRecognizer beginTouchLocations](self, "beginTouchLocations");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKey:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
        {
          -[_UIKBProductivityPanGestureRecognizer beginTouchLocations](self, "beginTouchLocations");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)MEMORY[0x1E0CB3B18];
          objc_msgSend(v19, "locationInView:", 0);
          objc_msgSend(v23, "valueWithCGPoint:");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v19, "_touchIdentifier"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKey:", v24, v25);

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v16);
  }

  -[_UIKBProductivityPanGestureRecognizer activeTouches](self, "activeTouches");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "count");
  v28 = -[UIPanGestureRecognizer minimumNumberOfTouches](self, "minimumNumberOfTouches");

  if (v27 == v28)
  {
    -[_UIKBProductivityPanGestureRecognizer activeTouches](self, "activeTouches");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "allObjects");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKBProductivityPanGestureRecognizer centroidOfTouches:](self, "centroidOfTouches:", v30);
    -[_UIKBProductivityPanGestureRecognizer setBeginPanCentroid:](self, "setBeginPanCentroid:");

  }
  else
  {
    -[_UIKBProductivityPanGestureRecognizer setBeginPanCentroid:](self, "setBeginPanCentroid:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  }
  -[_UIKBProductivityPanGestureRecognizer shiftTouches](self, "shiftTouches");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v31)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKBProductivityPanGestureRecognizer setShiftTouches:](self, "setShiftTouches:", v32);

  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v33 = v6;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v42 != v36)
          objc_enumerationMutation(v33);
        v38 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j);
        if (-[_UIKBProductivityPanGestureRecognizer isShiftOrMoreKeyForTouch:](self, "isShiftOrMoreKeyForTouch:", v38))
        {
          -[_UIKBProductivityPanGestureRecognizer shiftTouches](self, "shiftTouches");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "addObject:", v38);

        }
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v35);
  }

}

- (NSMutableSet)activeTouches
{
  return self->_activeTouches;
}

- (NSMutableDictionary)beginTouchLocations
{
  return self->_beginTouchLocations;
}

- (double)beginPanTimestamp
{
  return self->_beginPanTimestamp;
}

- (void)setTooMuchSingleMovement:(BOOL)a3
{
  *(&self->_tooMuchSingleMovement + 2) = a3;
}

- (BOOL)isShiftOrMoreKeyForTouch:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "callLayoutIsGeometricShiftOrMoreKeyForTouch:", v3);
  else
    v6 = 0;

  return v6;
}

- (_UIKBProductivityPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _UIKBProductivityPanGestureRecognizer *v4;
  _UIKBProductivityPanGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIKBProductivityPanGestureRecognizer;
  v4 = -[UIPanGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
    _UIUndoGestureRecognizerCommonInit(v4);
  return v5;
}

+ (id)productivityPanGestureRecognizerWithTarget:(id)a3 action:(SEL)a4 delegate:(id)a5
{
  id v7;
  id v8;
  _UIKBProductivityPanGestureRecognizer *v9;
  void *v10;
  double v11;
  _UIKBProductivityPanGestureRecognizer *v12;

  v7 = a5;
  v8 = a3;
  v9 = -[_UIKBProductivityPanGestureRecognizer initWithTarget:action:]([_UIKBProductivityPanGestureRecognizer alloc], "initWithTarget:action:", v8, a4);

  if (v9)
  {
    -[UIGestureRecognizer setAllowedTouchTypes:](v9, "setAllowedTouchTypes:", &unk_1E1A93608);
    -[UIGestureRecognizer setName:](v9, "setName:", CFSTR("com.apple.UIKit.kbProductivity.threeFingerPan"));
    -[UIPanGestureRecognizer setDelegate:](v9, "setDelegate:", v7);
    -[UIPanGestureRecognizer setMinimumNumberOfTouches:](v9, "setMinimumNumberOfTouches:", 3);
    -[UIGestureRecognizer setDelaysTouchesBegan:](v9, "setDelaysTouchesBegan:", 0);
    -[UIGestureRecognizer setDelaysTouchesEnded:](v9, "setDelaysTouchesEnded:", 0);
    if (_isSystemGestureForDelegate(v7))
      -[UIGestureRecognizer setCancelsTouchesInView:](v9, "setCancelsTouchesInView:", 0);
    -[UIPanGestureRecognizer _setFailsPastHysteresisWithoutMinTouches:](v9, "_setFailsPastHysteresisWithoutMinTouches:", 1);
    +[_UITextSelectionSettings sharedInstance](_UITextSelectionSettings, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allowableSeparation");
    -[UIPanGestureRecognizer _setAllowableSeparation:](v9, "_setAllowableSeparation:", v11 + v11);

    -[UIPanGestureRecognizer _setRequiresImmediateMultipleTouches:](v9, "_setRequiresImmediateMultipleTouches:", 1);
    -[UIPanGestureRecognizer _setAllowableTouchTimeSeparation:](v9, "_setAllowableTouchTimeSeparation:", 0.06);
    v12 = v9;
  }

  return v9;
}

- (_UIKBProductivityPanGestureRecognizer)initWithCoder:(id)a3
{
  id v4;
  _UIKBProductivityPanGestureRecognizer *v5;
  _UIKBProductivityPanGestureRecognizer *v6;
  _UIKBProductivityPanGestureRecognizer *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIKBProductivityPanGestureRecognizer;
  v5 = -[UIPanGestureRecognizer initWithCoder:](&v9, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    _UIUndoGestureRecognizerCommonInit(v5);
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIPanGestureRecognizer.minimumNumberOfTouches")))
      v6->super._minimumNumberOfTouches = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIPanGestureRecognizer.minimumNumberOfTouches"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIPanGestureRecognizer.maximumNumberOfTouches")))
      v6->super._maximumNumberOfTouches = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UIPanGestureRecognizer.maximumNumberOfTouches"));
    v7 = v6;
  }

  return v6;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  uint64_t v33;
  void *v34;
  BOOL v35;
  _BOOL4 v36;
  char v37;
  void *v38;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "timestamp");
  v9 = v8;
  -[_UIKBProductivityPanGestureRecognizer beginPanTimestamp](self, "beginPanTimestamp");
  v11 = v10;
  -[UIGestureRecognizer _activeTouchesForEvent:](self, "_activeTouchesForEvent:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKBProductivityPanGestureRecognizer transformAnalyzer](self, "transformAnalyzer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "analyzeTouches:", v12);

  v45.receiver = self;
  v45.super_class = (Class)_UIKBProductivityPanGestureRecognizer;
  -[UIPanGestureRecognizer touchesMoved:withEvent:](&v45, sel_touchesMoved_withEvent_, v6, v7);
  if ((unint64_t)objc_msgSend(v12, "count") <= 2
    && -[UIGestureRecognizer state](self, "state") <= UIGestureRecognizerStatePossible)
  {
    v39 = v12;
    v40 = v6;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v14 = v12;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v42 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(v19, "locationInView:", 0, v39, v40, (_QWORD)v41);
          v21 = v20;
          v23 = v22;
          -[_UIKBProductivityPanGestureRecognizer beginTouchLocations](self, "beginTouchLocations");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v19, "_touchIdentifier"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKey:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "CGPointValue");
          v28 = v27;
          v30 = v29;

          if (sqrt((v28 - v21) * (v28 - v21) + (v30 - v23) * (v30 - v23)) > 20.0)
            -[_UIKBProductivityPanGestureRecognizer setTooMuchSingleMovement:](self, "setTooMuchSingleMovement:", 1);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v16);
    }

    v12 = v39;
    v6 = v40;
  }
  v31 = v9 - v11;
  -[_UIKBProductivityPanGestureRecognizer shiftTouches](self, "shiftTouches", v39, v40);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "count");

  -[_UIKBProductivityPanGestureRecognizer activeTouches](self, "activeTouches");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v34, "count") == 3 || -[UIGestureRecognizer state](self, "state") > UIGestureRecognizerStatePossible)
  {
    v35 = 1;
  }
  else
  {
    -[_UIKBProductivityPanGestureRecognizer transformAnalyzer](self, "transformAnalyzer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v38, "dominantComponent") == 1;

  }
  v36 = -[_UIKBProductivityPanGestureRecognizer tooMuchSingleMovement](self, "tooMuchSingleMovement");
  v37 = v31 <= 0.18 || v35;
  if (v36 || v33 || (v37 & 1) == 0)
    -[UIGestureRecognizer setState:](self, "setState:", 5);

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIKBProductivityPanGestureRecognizer;
  v6 = a3;
  -[UIPanGestureRecognizer touchesCancelled:withEvent:](&v9, sel_touchesCancelled_withEvent_, v6, a4);
  -[_UIKBProductivityPanGestureRecognizer activeTouches](self, "activeTouches", v9.receiver, v9.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v6);

  -[_UIKBProductivityPanGestureRecognizer shiftTouches](self, "shiftTouches");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minusSet:", v6);

}

- (CGPoint)centroidOfTouches:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t i;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  CGPoint result;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v3, "count") == 1)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "locationInView:", 0);
      v6 = v5;
      v8 = v7;

    }
    else
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v9 = v3;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v22;
        v13 = 0.0;
        v14 = 0.0;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v22 != v12)
              objc_enumerationMutation(v9);
            v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            objc_msgSend(v16, "locationInView:", 0, (_QWORD)v21);
            v14 = v14 + v17;
            objc_msgSend(v16, "locationInView:", 0);
            v13 = v13 + v18;
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v11);
      }
      else
      {
        v13 = 0.0;
        v14 = 0.0;
      }

      v6 = v14 / (double)(unint64_t)objc_msgSend(v9, "count");
      v8 = v13 / (double)(unint64_t)objc_msgSend(v9, "count");
    }
  }
  else
  {
    v6 = *MEMORY[0x1E0C9D538];
    v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }

  v19 = v6;
  v20 = v8;
  result.y = v20;
  result.x = v19;
  return result;
}

- (CGPoint)beginPanCentroid
{
  double x;
  double y;
  CGPoint result;

  x = self->_beginPanCentroid.x;
  y = self->_beginPanCentroid.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTransformAnalyzer:(id)a3
{
  objc_storeStrong((id *)&self->_transformAnalyzer, a3);
}

- (BOOL)tooMuchSingleMovement
{
  return *(&self->_tooMuchSingleMovement + 2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beginTouchLocations, 0);
  objc_storeStrong((id *)&self->_transformAnalyzer, 0);
  objc_storeStrong((id *)&self->_shiftTouches, 0);
  objc_storeStrong((id *)&self->_activeTouches, 0);
}

@end
