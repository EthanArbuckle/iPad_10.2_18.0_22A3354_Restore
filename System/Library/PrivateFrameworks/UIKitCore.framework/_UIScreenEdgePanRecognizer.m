@implementation _UIScreenEdgePanRecognizer

- (_UIScreenEdgePanRecognizer)initWithType:(int64_t)a3 settings:(id)a4
{
  _UIScreenEdgePanRecognizer *v6;
  _UIScreenEdgePanRecognizer *v7;
  _UIScreenEdgePanRecognizer *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIScreenEdgePanRecognizer;
  v6 = -[_UIScreenEdgePanRecognizer init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    -[_UIScreenEdgePanRecognizer setTargetEdges:](v6, "setTargetEdges:", 15);
    v7->_type = a3;
    objc_storeStrong((id *)&v7->_settings, a4);
    -[_UIScreenEdgePanRecognizer setShouldUseGrapeFlags:](v7, "setShouldUseGrapeFlags:", 1);
    v8 = v7;
  }

  return v7;
}

- (_UIScreenEdgePanRecognizer)initWithType:(int64_t)a3
{
  _UIScreenEdgePanRecognizerSettings *v5;
  _UIScreenEdgePanRecognizer *v6;

  v5 = -[_UISettings initWithDefaultValues]([_UIScreenEdgePanRecognizerSettings alloc], "initWithDefaultValues");
  v6 = -[_UIScreenEdgePanRecognizer initWithType:settings:](self, "initWithType:settings:", a3, v5);

  return v6;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_UIScreenEdgePanRecognizer;
  -[_UIScreenEdgePanRecognizer dealloc](&v2, sel_dealloc);
}

- (void)reset
{
  CGPoint v3;
  UIDelayedAction *recognitionTimer;
  UIDelayedAction *v5;

  -[_UIScreenEdgePanRecognizer _setState:](self, "_setState:", 0);
  *(_WORD *)&self->_hasRecordedData = 0;
  v3 = (CGPoint)*MEMORY[0x1E0C9D538];
  self->_initialTouchLocation = (CGPoint)*MEMORY[0x1E0C9D538];
  self->_initialTouchTimestamp = 0.0;
  self->_touchedRegion = 0;
  self->_lastTouchLocation = v3;
  self->_recognizedRegion = 0;
  self->_lastTouchTimestamp = 0.0;
  self->_lastTouchModifier = 0;
  recognitionTimer = self->_recognitionTimer;
  if (recognitionTimer)
  {
    -[UIDelayedAction cancel](recognitionTimer, "cancel");
    v5 = self->_recognitionTimer;
    self->_recognitionTimer = 0;

  }
}

- (BOOL)useGrapeFlags
{
  return self->_shouldUseGrapeFlags;
}

- (void)_setState:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;

  if (self->_state != a3)
  {
    if (_UIScreenEdgePanRecognizerShouldLog())
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v7 = self->_type - 1;
      if (v7 > 4)
        v8 = CFSTR("unknown");
      else
        v8 = off_1E16C9730[v7];
      objc_msgSend(v5, "stringWithFormat:", CFSTR("%f (%@): "), v6, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = CFSTR("possible");
      if (a3 == 2)
        v11 = CFSTR("failed");
      if (a3 == 1)
        v11 = CFSTR("recognized");
      objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("Moving to state %@"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%@"), v12);

    }
    self->_state = a3;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[_UIScreenEdgePanRecognizerDelegate screenEdgePanRecognizerStateDidChange:](self->_delegate, "screenEdgePanRecognizerStateDidChange:", self);
  }
}

- (int64_t)_type
{
  return self->_type;
}

- (unint64_t)touchedEdgesForInterfaceOrientation:(int64_t)a3
{
  unint64_t touchedRegion;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (self->_state != 1)
    return 0;
  touchedRegion = self->_touchedRegion;
  v4 = 90;
  v5 = -90;
  v6 = 180;
  if (a3 != 2)
    v6 = 0;
  if (a3 != 4)
    v5 = v6;
  if (a3 != 3)
    v4 = v5;
  if (a3 == 1)
    v7 = 0;
  else
    v7 = v4;
  return _rotatedEdgesGivenOrientationInDegrees(touchedRegion, v7);
}

- (void)incorporateTouchSampleAtLocation:(CGPoint)a3 timestamp:(double)a4 modifier:(int64_t)a5 region:(unint64_t)a6 interfaceOrientation:(int64_t)a7 forceState:(int64_t)a8
{
  CGFloat x;
  CGFloat y;

  if (!self->_state)
  {
    x = a3.x;
    if (self->_lastTouchTimestamp != a4)
    {
      y = a3.y;
      if (self->_hasRecordedData)
        -[_UIScreenEdgePanRecognizer _incorporateIncrementalSampleAtLocation:timestamp:modifier:region:interfaceOrientation:forceState:](self, "_incorporateIncrementalSampleAtLocation:timestamp:modifier:region:interfaceOrientation:forceState:", a5, a6, a7, a8, a3.x, a3.y, a4);
      else
        -[_UIScreenEdgePanRecognizer _incorporateInitialTouchAtLocation:timestamp:modifier:region:interfaceOrientation:forceState:](self, "_incorporateInitialTouchAtLocation:timestamp:modifier:region:interfaceOrientation:forceState:", a5, a6, a7, a8, a3.x, a3.y, a4);
      self->_lastTouchLocation.x = x;
      self->_lastTouchLocation.y = y;
      self->_lastTouchTimestamp = a4;
      self->_lastTouchModifier = a5;
      self->_hasRecordedData = 1;
    }
  }
}

- (void)_incorporateInitialTouchAtLocation:(CGPoint)a3 timestamp:(double)a4 modifier:(int64_t)a5 region:(unint64_t)a6 interfaceOrientation:(int64_t)a7 forceState:(int64_t)a8
{
  double y;
  double x;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  _BOOL4 v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  const __CFString *v30;
  unint64_t type;
  UIDelayedAction *v32;
  UIDelayedAction *v33;
  UIDelayedAction *recognitionTimer;
  void *v35;
  uint64_t v36;
  unint64_t v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  unint64_t v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  id v49;

  y = a3.y;
  x = a3.x;
  if (-[_UIScreenEdgePanRecognizer useGrapeFlags](self, "useGrapeFlags", a5, a6, a7, a8))
  {
    -[_UIScreenEdgePanRecognizer screenBounds](self, "screenBounds");
    v15 = v14 * 0.5;
    -[_UIScreenEdgePanRecognizer screenBounds](self, "screenBounds");
    if (v15 >= v16 * 0.5)
      v17 = v16 * 0.5;
    else
      v17 = v15;
  }
  else
  {
    -[_UIScreenEdgePanRecognizerSettings edgeSettings](self->_settings, "edgeSettings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "edgeRegionSize");
    v17 = v19;

  }
  if (_UIScreenEdgePanRecognizerShouldLog())
  {
    v35 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v37 = self->_type - 1;
    if (v37 > 4)
      v38 = CFSTR("unknown");
    else
      v38 = off_1E16C9730[v37];
    objc_msgSend(v35, "stringWithFormat:", CFSTR("%f (%@): "), v36, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stringByAppendingFormat:", CFSTR("performing initial check for touch at {%.1f, %.1f} with edge region %f"), *(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&v17);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@"), v40);

  }
  v20 = _regionForLocation(self->_screenBounds.origin.x, self->_screenBounds.origin.y, self->_screenBounds.size.width, self->_screenBounds.size.height, x, y, v17);
  v21 = -[_UIScreenEdgePanRecognizer _targetEdges](self, "_targetEdges");
  if (a7 == 4)
  {
    v23 = ((2 * v21) | (v21 >> 3) & 1) & v20;
    self->_touchedRegion = v23;
    v22 = -90;
  }
  else if (a7 == 3)
  {
    v23 = ((8 * v21) | (v21 >> 1) & 7) & v20;
    self->_touchedRegion = v23;
    v22 = 90;
  }
  else
  {
    if (a7 == 1)
    {
      v22 = 0;
    }
    else
    {
      if (a7 == 2)
        v24 = -180;
      else
        v24 = 0;
      if (a7 == 2)
        v22 = 180;
      else
        v22 = 0;
      v21 = _rotatedEdgesGivenOrientationInDegrees(v21, v24);
    }
    v23 = v21 & v20;
    self->_touchedRegion = v23;
  }
  v25 = _rotatedEdgesGivenOrientationInDegrees(v23, v22);
  v26 = -[_UIScreenEdgePanRecognizer useGrapeFlags](self, "useGrapeFlags");
  if ((unint64_t)(a5 - 5) <= 0xFFFFFFFFFFFFFFFBLL && v26)
  {
    if (_UIScreenEdgePanRecognizerShouldLog())
    {
      v27 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v29 = self->_type - 1;
      if (v29 > 4)
        v30 = CFSTR("unknown");
      else
        v30 = off_1E16C9730[v29];
      objc_msgSend(v27, "stringWithFormat:", CFSTR("%f (%@): "), v28, v30);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "stringByAppendingFormat:", CFSTR("failed modifier flag check (got %@)"), CFSTR("_UIScreenEdgePanRecognizerTouchModifierNone"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%@"), v42);
LABEL_44:

      goto LABEL_30;
    }
    goto LABEL_30;
  }
  if ((-[_UIScreenEdgePanRecognizer _targetEdges](self, "_targetEdges") & v25) == 0)
  {
    if (_UIScreenEdgePanRecognizerShouldLog())
    {
      v43 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v45 = self->_type - 1;
      if (v45 > 4)
        v46 = CFSTR("unknown");
      else
        v46 = off_1E16C9730[v45];
      objc_msgSend(v43, "stringWithFormat:", CFSTR("%f (%@): "), v44, v46);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      _formatRegion(-[_UIScreenEdgePanRecognizer _targetEdges](self, "_targetEdges"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      _formatRegion(v25);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "stringByAppendingFormat:", CFSTR("failed region check (expected %@, got %@)"), v42, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%@"), v48);

      goto LABEL_44;
    }
LABEL_30:
    -[_UIScreenEdgePanRecognizer _setState:](self, "_setState:", 2);
    return;
  }
  self->_initialTouchLocation.x = x;
  self->_initialTouchLocation.y = y;
  self->_initialTouchTimestamp = a4;
  self->_initialInterfaceOrientation = a7;
  if (!self->_recognizeAlongEdge)
  {
    type = self->_type;
    if (type <= 5 && ((1 << type) & 0x2C) != 0)
    {
      v32 = [UIDelayedAction alloc];
      -[_UIScreenEdgePanRecognizerSettings edgeSettings](self->_settings, "edgeSettings");
      v49 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "maximumSwipeDuration");
      v33 = -[UIDelayedAction initWithTarget:action:userInfo:delay:mode:](v32, "initWithTarget:action:userInfo:delay:mode:", self, sel__idleTimerElapsed_, 0, *MEMORY[0x1E0C99860]);
      recognitionTimer = self->_recognitionTimer;
      self->_recognitionTimer = v33;

    }
  }
}

- (void)_incorporateIncrementalSampleAtLocation:(CGPoint)a3 timestamp:(double)a4 modifier:(int64_t)a5 region:(unint64_t)a6 interfaceOrientation:(int64_t)a7 forceState:(int64_t)a8
{
  double y;
  double x;
  int64_t type;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  _UIScreenEdgePanRecognizer *v20;
  uint64_t v21;
  BOOL v22;
  BOOL v23;
  BOOL v24;
  BOOL v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  BOOL v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  double v44;
  unint64_t touchedRegion;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  unint64_t v51;
  void *v52;
  double v53;
  void *v54;
  uint64_t v55;
  unint64_t v56;
  const __CFString *v57;
  void *v58;
  double v59;
  double v60;
  int64_t v61;
  unint64_t v62;
  long double v63;
  double v64;
  double v65;
  double v66;
  unint64_t v67;
  double initialTouchTimestamp;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  uint64_t v76;
  unint64_t v77;
  const __CFString *v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  void *v85;
  void *v86;
  const __CFString *v87;
  void *v88;
  uint64_t v89;
  const __CFString *v90;
  void *v91;
  uint64_t v92;
  const __CFString *v93;
  void *v94;
  uint64_t v95;
  const __CFString *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  const __CFString *v104;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  CGFloat v111;
  CGFloat v112;
  uint64_t v113;
  int64_t v114;
  int64_t v115;
  int64_t v116;
  BOOL v117;
  unint64_t v118;
  unint64_t v119;
  unint64_t v120;
  unint64_t v121;
  int __z;

  y = a3.y;
  x = a3.x;
  if (!self->_recognizeAlongEdge
    && sqrt((self->_lastTouchLocation.x - a3.x) * (self->_lastTouchLocation.x - a3.x)+ (self->_lastTouchLocation.y - a3.y) * (self->_lastTouchLocation.y - a3.y)) > 100.0)
  {
    type = self->_type;
    if (_UIScreenEdgePanRecognizerShouldLog())
    {
      v17 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      if ((unint64_t)(type - 1) > 4)
        v19 = CFSTR("unknown");
      else
        v19 = off_1E16C9730[type - 1];
      objc_msgSend(v17, "stringWithFormat:", CFSTR("%f (%@): "), v18, v19);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = v85;
      v87 = CFSTR("Touches have teleported");
LABEL_123:
      objc_msgSend(v85, "stringByAppendingFormat:", v87, *(_QWORD *)&v111, *(_QWORD *)&v112);
LABEL_124:
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%@"), v101);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (!a5 && self->_lastTouchModifier == 3)
    goto LABEL_8;
  v22 = -[_UIScreenEdgePanRecognizer useGrapeFlags](self, "useGrapeFlags");
  v23 = a5 == 3 && v22;
  v24 = -[_UIScreenEdgePanRecognizer useGrapeFlags](self, "useGrapeFlags");
  v25 = a5 == 4 && v24;
  if (!self->_hasDoneInitialBackProjectionTest && !v23)
  {
    v26 = -[_UIScreenEdgePanRecognizer _targetEdges](self, "_targetEdges");
    v27 = -90;
    v28 = 90;
    v29 = -180;
    if (a7 != 2)
      v29 = 0;
    if (a7 != 4)
      v28 = v29;
    if (a7 != 3)
      v27 = v28;
    if (a7 == 1)
      v30 = 0;
    else
      v30 = v27;
    v31 = _rotatedEdgesGivenOrientationInDegrees(v26, v30);
    if (a6)
      v32 = v25;
    else
      v32 = 0;
    if (!v32)
    {
      v33 = a4 - self->_initialTouchTimestamp;
      v34 = self->_initialTouchLocation.x - v33 * ((x - self->_initialTouchLocation.x) / v33);
      v35 = self->_initialTouchLocation.y - v33 * ((y - self->_initialTouchLocation.y) / v33);
      -[_UIScreenEdgePanRecognizerSettings edgeSettings](self->_settings, "edgeSettings");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "edgeRegionSize");
      v38 = v37;

      v39 = 90;
      v40 = -90;
      v41 = 180;
      if (a7 != 2)
        v41 = 0;
      if (a7 != 4)
        v40 = v41;
      if (a7 != 3)
        v39 = v40;
      if (a7 == 1)
        v42 = 0;
      else
        v42 = v39;
      if (_rotatedEdgesGivenOrientationInDegrees(self->_touchedRegion, v42) == 4)
      {
        -[_UIScreenEdgePanRecognizerSettings edgeSettings](self->_settings, "edgeSettings");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "bottomEdgeRegionSize");
        v38 = v44;

      }
      a6 = _regionForLocation(self->_screenBounds.origin.x, self->_screenBounds.origin.y, self->_screenBounds.size.width, self->_screenBounds.size.height, v34, v35, v38);
    }
    self->_touchedRegion = a6 & v31;
    if ((a6 & v31) == 0)
    {
      if (_UIScreenEdgePanRecognizerShouldLog())
      {
        v54 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v56 = self->_type - 1;
        if (v56 > 4)
          v57 = CFSTR("unknown");
        else
          v57 = off_1E16C9730[v56];
        objc_msgSend(v54, "stringWithFormat:", CFSTR("%f (%@): "), v55, v57);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = v85;
        v111 = self->_initialTouchLocation.x;
        v112 = self->_initialTouchLocation.y;
        v87 = CFSTR("Touched outside target edge region ({%.1f, %.1f})");
        goto LABEL_123;
      }
LABEL_8:
      v20 = self;
      v21 = 2;
LABEL_9:
      -[_UIScreenEdgePanRecognizer _setState:](v20, "_setState:", v21);
      return;
    }
    self->_hasDoneInitialBackProjectionTest = 1;
  }
  if (self->_recognizeAlongEdge
    || (touchedRegion = self->_touchedRegion, touchedRegion <= 0xC) && ((1 << touchedRegion) & 0x1248) != 0)
  {
    v46 = sqrt((self->_initialTouchLocation.x - x) * (self->_initialTouchLocation.x - x)+ (self->_initialTouchLocation.y - y) * (self->_initialTouchLocation.y - y));
    v47 = 0.0;
  }
  else if ((touchedRegion & 0xA) != 0)
  {
    v46 = vabdd_f64(x, self->_initialTouchLocation.x);
    v47 = vabdd_f64(y, self->_initialTouchLocation.y);
  }
  else
  {
    v46 = vabdd_f64(y, self->_initialTouchLocation.y);
    v47 = vabdd_f64(x, self->_initialTouchLocation.x);
  }
  -[_UIScreenEdgePanRecognizerSettings edgeSettings](self->_settings, "edgeSettings");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "edgeAngleWindow");
  v50 = v49;

  v51 = self->_touchedRegion;
  if (v51 <= 0xC && ((1 << v51) & 0x1248) != 0)
  {
    -[_UIScreenEdgePanRecognizerSettings cornerSettings](self->_settings, "cornerSettings");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "cornerAngleWindow");
    v50 = v53;

  }
  else if (v51 == 4)
  {
    v50 = 2.0943951;
  }
  -[_UIScreenEdgePanRecognizerSettings edgeSettings](self->_settings, "edgeSettings");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "hysteresis");
  v60 = v59;

  if (v60 <= 0.0)
  {
    if (a8 == 2 || self->_type != 4)
    {
      -[_UIScreenEdgePanRecognizer _setState:](self, "_setState:", 1);
      return;
    }
    initialTouchTimestamp = self->_initialTouchTimestamp;
    -[_UIScreenEdgePanRecognizerSettings edgeSettings](self->_settings, "edgeSettings");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "edgeAngleWindowDecayTime");
    v71 = v70;
    v72 = 10.0 / tan(v50 * -0.5 + 1.57079633);
  }
  else
  {
    if (v46 > v60)
    {
      v61 = self->_type;
      v62 = self->_touchedRegion;
      v63 = atan2(y - self->_initialTouchLocation.y, x - self->_initialTouchLocation.x);
      v64 = 0.0;
      if (v62 - 1 <= 0xB)
        v64 = dbl_18667CFF0[v62 - 1];
      if (_UIScreenEdgePanRecognizerShouldLog())
      {
        v118 = v62;
        v88 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v114 = v61;
        if ((unint64_t)(v61 - 1) > 4)
          v90 = CFSTR("unknown");
        else
          v90 = off_1E16C9730[v61 - 1];
        objc_msgSend(v88, "stringWithFormat:", CFSTR("%f (%@): "), v89, v90);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "stringByAppendingFormat:", CFSTR("Checking angle %f against %f around %f"), v63 * 57.2957795, v50 * 57.2957795, v64 * 57.2957795);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("%@"), v98);

        v61 = v114;
        v62 = v118;
      }
      v65 = fabs(remainder(v63 - v64, 6.28318531));
      v66 = v50 * 0.5;
      if (_UIScreenEdgePanRecognizerShouldLog())
      {
        v119 = v62;
        v91 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v115 = v61;
        if ((unint64_t)(v61 - 1) > 4)
          v93 = CFSTR("unknown");
        else
          v93 = off_1E16C9730[v61 - 1];
        objc_msgSend(v91, "stringWithFormat:", CFSTR("%f (%@): "), v92, v93);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "stringByAppendingFormat:", CFSTR("Comparing angles (%f vs %f) Imperfection: %f; threshold: %f"),
          v63 * 57.2957795,
          v64 * 57.2957795,
          v65 * 57.2957795,
          v66 * 57.2957795);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("%@"), v100);

        v61 = v115;
        v62 = v119;
      }
      if (v65 >= v66)
      {
        if (_UIScreenEdgePanRecognizerShouldLog())
        {
          v120 = v62;
          v94 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
          v116 = v61;
          if ((unint64_t)(v61 - 1) > 4)
            v96 = CFSTR("unknown");
          else
            v96 = off_1E16C9730[v61 - 1];
          objc_msgSend(v94, "stringWithFormat:", CFSTR("%f (%@): "), v95, v96);
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "stringByAppendingFormat:", CFSTR("failed angle %.0f from ideal. threshold is %.0f"), v65 * 57.2957795, v66 * 57.2957795);
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("%@"), v106);

          v61 = v116;
          v62 = v120;
        }
        v67 = 0;
        if (v62 <= 0xC && ((1 << v62) & 0x1248) != 0)
        {
          __z = 0;
          remquo(v63, 1.57079633, &__z);
          if (__z < 0)
            __z += 4;
          if (_UIScreenEdgePanRecognizerShouldLog())
          {
            v121 = v62;
            v117 = v23;
            v102 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
            if ((unint64_t)(v61 - 1) > 4)
              v104 = CFSTR("unknown");
            else
              v104 = off_1E16C9730[v61 - 1];
            objc_msgSend(v102, "stringWithFormat:", CFSTR("%f (%@): "), v103, v104);
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            if (__z > 3)
              v108 = 0;
            else
              v108 = qword_18667D050[__z];
            _formatRegion(v108);
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v107, "stringByAppendingFormat:", CFSTR("Corner gesture being interpreted as %@"), v109);
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            NSLog(CFSTR("%@"), v110);

            v23 = v117;
            v62 = v121;
          }
          if (__z > 3)
            v79 = 0;
          else
            v79 = qword_18667D050[__z];
          v67 = v79 & v62;
        }
      }
      else
      {
        v67 = v62;
      }
      switch(a7)
      {
        case 1:
          v80 = 0;
          break;
        case 3:
          v80 = 90;
          break;
        case 4:
          v80 = -90;
          break;
        case 2:
          v80 = 180;
          break;
        default:
          v80 = 0;
          break;
      }
      v81 = _rotatedEdgesGivenOrientationInDegrees(v67, v80);
      self->_recognizedRegion = v81;
      if (!self->_recognizeAlongEdge)
      {
        v82 = v81;
        v83 = self->_type - 6;
        v84 = -[_UIScreenEdgePanRecognizer _targetEdges](self, "_targetEdges");
        if (v83 > 0xFFFFFFFFFFFFFFFCLL)
        {
          if ((v84 & v82) == 0)
            goto LABEL_8;
        }
        else if (v82 != v84)
        {
          goto LABEL_8;
        }
      }
      if (!v23 && (a8 == 2 || self->_type != 4))
      {
        v20 = self;
        v21 = 1;
        goto LABEL_9;
      }
      return;
    }
    initialTouchTimestamp = self->_initialTouchTimestamp;
    -[_UIScreenEdgePanRecognizerSettings edgeSettings](self->_settings, "edgeSettings");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "edgeAngleWindowDecayTime");
    v71 = v73;
    v72 = v60 / tan(v50 * -0.5 + 1.57079633);
  }
  v74 = fmax(v72 * (1.0 - (a4 - initialTouchTimestamp) * (1.0 / v71)), 20.0);

  if (v47 > v74)
  {
    if (_UIScreenEdgePanRecognizerShouldLog())
    {
      v75 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v77 = self->_type - 1;
      if (v77 > 4)
        v78 = CFSTR("unknown");
      else
        v78 = off_1E16C9730[v77];
      objc_msgSend(v75, "stringWithFormat:", CFSTR("%f (%@): "), v76, v78);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "stringByAppendingFormat:", CFSTR("too much movement on non-target axis (%f)"), *(_QWORD *)&v47, v113);
      goto LABEL_124;
    }
    goto LABEL_8;
  }
}

- (void)_longPressTimerElapsed:(id)a3
{
  void *v4;
  uint64_t v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  if (!self->_state)
  {
    if (_UIScreenEdgePanRecognizerShouldLog())
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v6 = self->_type - 1;
      if (v6 > 4)
        v7 = CFSTR("unknown");
      else
        v7 = off_1E16C9730[v6];
      objc_msgSend(v4, "stringWithFormat:", CFSTR("%f (%@): "), v5, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("User has dwelled long enough"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%@"), v9);

    }
    -[_UIScreenEdgePanRecognizer _setState:](self, "_setState:", 1);
  }
}

- (void)_idleTimerElapsed:(id)a3
{
  void *v4;
  uint64_t v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  if (!self->_state)
  {
    if (_UIScreenEdgePanRecognizerShouldLog())
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v6 = self->_type - 1;
      if (v6 > 4)
        v7 = CFSTR("unknown");
      else
        v7 = off_1E16C9730[v6];
      objc_msgSend(v4, "stringWithFormat:", CFSTR("%f (%@): "), v5, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("Finger was idle too long"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%@"), v9);

    }
    -[_UIScreenEdgePanRecognizer _setState:](self, "_setState:", 2);
  }
}

- (void)setScreenBounds:(CGRect)a3
{
  self->_screenBounds = a3;
  -[_UIScreenEdgePanRecognizer reset](self, "reset");
}

- (void)setSettings:(id)a3
{
  objc_storeStrong((id *)&self->_settings, a3);
}

- (void)setTargetEdges:(unint64_t)a3
{
  self->_targetEdges = a3;
  -[_UIScreenEdgePanRecognizer reset](self, "reset");
}

- (unint64_t)_targetEdges
{
  return self->_targetEdges;
}

- (BOOL)shouldUseGrapeFlags
{
  return self->_shouldUseGrapeFlags;
}

- (void)setShouldUseGrapeFlags:(BOOL)a3
{
  self->_shouldUseGrapeFlags = a3;
}

- (BOOL)hasRecordedData
{
  return self->_hasRecordedData;
}

- (CGPoint)_lastTouchLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastTouchLocation.x;
  y = self->_lastTouchLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (_UIScreenEdgePanRecognizerSettings)settings
{
  return self->_settings;
}

- (CGRect)screenBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_screenBounds.origin.x;
  y = self->_screenBounds.origin.y;
  width = self->_screenBounds.size.width;
  height = self->_screenBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unint64_t)targetEdges
{
  return self->_targetEdges;
}

- (BOOL)requiresFlatThumb
{
  return self->_requiresFlatThumb;
}

- (void)setRequiresFlatThumb:(BOOL)a3
{
  self->_requiresFlatThumb = a3;
}

- (BOOL)recognizeAlongEdge
{
  return self->_recognizeAlongEdge;
}

- (void)setRecognizeAlongEdge:(BOOL)a3
{
  self->_recognizeAlongEdge = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (unint64_t)recognizedRegion
{
  return self->_recognizedRegion;
}

- (_UIScreenEdgePanRecognizerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (_UIScreenEdgePanRecognizerDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_recognitionTimer, 0);
}

@end
