@implementation SCRCGestureFactory

- (SCRCGestureFactory)initWithSize:(CGSize)a3 delegate:(id)a4
{
  return -[SCRCGestureFactory initWithSize:delegate:threadKey:](self, "initWithSize:delegate:threadKey:", a4, 0, a3.width, a3.height);
}

- (SCRCGestureFactory)initWithSize:(CGSize)a3 delegate:(id)a4 threadKey:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  SCRCGestureFactory *v11;
  SCRCGestureFactory *v12;
  double v13;
  double v14;
  SCRCTargetSelectorTimer *v15;
  SCRCTargetSelectorTimer *trackingTimer;
  SCRCTargetSelectorTimer *v17;
  SCRCTargetSelectorTimer *tapTimer;
  SCRCGestureFactory *v19;
  SCRCGestureFactory *splitFactory;
  CGRect v22;

  height = a3.height;
  width = a3.width;
  v9 = a4;
  v10 = a5;
  v11 = -[SCRCGestureFactory init](self, "init");
  v12 = v11;
  if (v11)
  {
    v11->_mainFrame.origin.x = 0.0;
    v11->_mainFrame.origin.y = 0.0;
    v11->_mainFrame.size.width = width;
    v11->_mainFrame.size.height = height;
    *(_OWORD *)&v11->_flickVelocityThreshold = xmmword_2110153E0;
    v11->_echoWaitTime = 0.35;
    v11->_potentialTrackingStartTimestamp = -3061152000.0;
    v11->_split.fingerDownTime = -3061152000.0;
    v22.origin.x = 0.0;
    v22.origin.y = 0.0;
    v22.size.width = width;
    v22.size.height = height;
    v11->_gutterFrame = CGRectInset(v22, 7.5, 7.5);
    -[SCRCGestureFactory setOrientation:](v12, "setOrientation:", 0);
    v13 = v12->_mainFrame.size.width;
    v14 = v12->_mainFrame.size.height;
    if (v13 <= v14)
      v13 = v12->_mainFrame.size.height;
    v12->_stallDistance = 10.0 / v13;
    v12->_maxDimension = v13;
    v12->_thumbRegion = v14 * 0.333333333;
    v15 = -[SCRCTargetSelectorTimer initWithTarget:selector:threadKey:]([SCRCTargetSelectorTimer alloc], "initWithTarget:selector:threadKey:", v12, sel__enterTrackingMode_, v10);
    trackingTimer = v12->_trackingTimer;
    v12->_trackingTimer = v15;

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_storeWeak((id *)&v12->_trackDelegate, v9);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_storeWeak((id *)&v12->_tapDelegate, v9);
      v17 = -[SCRCTargetSelectorTimer initWithTarget:selector:threadKey:]([SCRCTargetSelectorTimer alloc], "initWithTarget:selector:threadKey:", v12, sel__handleTap, v10);
      tapTimer = v12->_tapTimer;
      v12->_tapTimer = v17;

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_storeWeak((id *)&v12->_didBeginSplitGestureDelegate, v9);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_storeWeak((id *)&v12->_splitTapDelegate, v9);
      v19 = -[SCRCGestureFactory initWithSize:delegate:threadKey:]([SCRCGestureFactory alloc], "initWithSize:delegate:threadKey:", 0, v10, width, height);
      splitFactory = v12->_splitFactory;
      v12->_splitFactory = v19;

      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_storeWeak((id *)&v12->_canSplitTapDelegate, v9);
    }
  }

  return v12;
}

- (void)setFlickSpeed:(double)a3
{
  double v3;
  double v4;

  v3 = 1.0;
  if (a3 <= 1.0)
    v3 = a3;
  if (a3 >= -1.0)
    v4 = v3;
  else
    v4 = -1.0;
  self->_flickVelocityThreshold = v4 * 0.6 + 0.9;
}

- (double)flickSpeed
{
  return (self->_flickVelocityThreshold + -0.9) / 0.6;
}

- (void)setTapSpeed:(double)a3
{
  double v3;
  double v4;
  double v5;

  v3 = 1.0;
  if (a3 <= 1.0)
    v3 = a3;
  if (a3 >= -1.0)
    v4 = v3;
  else
    v4 = -1.0;
  v5 = v4 * -0.15 + 0.35;
  self->_tapVelocityThreshold = v5;
  self->_echoWaitTime = v5;
}

- (void)setTapSpeedTimeThreshold:(double)a3 forRegion:(CGRect)a4 fingerCount:(int64_t)a5
{
  self->_tapSpeedRegion = a4;
  self->_tapSpeedFingerCount = a5;
  self->_tapVelocityThresholdForRegion = a3;
}

- (double)tapSpeed
{
  return (0.35 - self->_tapVelocityThreshold) / 0.15;
}

- (void)setOrientation:(int64_t)a3
{
  int64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  double v12;
  double v13;

  -[SCRCGestureFactory setOrientation:](self->_splitFactory, "setOrientation:");
  self->_orientation = a3;
  self->_directions[0] = 0;
  v5 = a3 - 1;
  if ((unint64_t)(a3 - 1) > 2)
  {
    v12 = 1.0;
    v11 = 6;
    v10 = 5;
    v9 = 4;
    v8 = 3;
    v7 = 2;
    v13 = 1.0;
    v6 = 1;
  }
  else
  {
    v6 = a3 + 1;
    v7 = qword_2110154F0[v5];
    v8 = qword_211015508[v5];
    v9 = qword_211015520[v5];
    v10 = qword_211015538[v5];
    v11 = qword_211015550[v5];
    v12 = dbl_211015568[v5];
    v13 = dbl_211015580[v5];
  }
  self->_directions[1] = v6;
  self->_directions[2] = v7;
  self->_directions[3] = v8;
  self->_directions[4] = v9;
  self->_directions[5] = v10;
  self->_directions[6] = v11;
  self->_axisFlipper.horizontal = v12;
  self->_axisFlipper.vertical = v13;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)dealloc
{
  objc_super v3;

  -[SCRCTargetSelectorTimer invalidate](self->_trackingTimer, "invalidate");
  -[SCRCTargetSelectorTimer invalidate](self->_tapTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SCRCGestureFactory;
  -[SCRCGestureFactory dealloc](&v3, sel_dealloc);
}

- (CGRect)mainFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_mainFrame.origin.x;
  y = self->_mainFrame.origin.y;
  width = self->_mainFrame.size.width;
  height = self->_mainFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)_currentTapRect
{
  CGFloat v2;
  double v3;
  double v4;
  CGFloat *p_y;
  double v7;
  unint64_t v8;
  CGRect result;
  CGRect v10;

  v2 = self->_tap.locationPerTap[0].x + -5.0;
  v3 = self->_tap.locationPerTap[0].y + -5.0;
  v4 = 10.0;
  if (self->_tap.numFingersInCurrentGestureEvent < 2)
  {
    v7 = 10.0;
  }
  else
  {
    p_y = &self->_tap.locationPerTap[1].y;
    v7 = 10.0;
    v8 = 1;
    do
    {
      v10.origin.x = *(p_y - 1) + -5.0;
      v10.origin.y = *p_y + -5.0;
      v10.size.width = 10.0;
      v10.size.height = 10.0;
      *(CGRect *)&v2 = CGRectUnion(*(CGRect *)&v2, v10);
      ++v8;
      p_y += 2;
    }
    while (v8 < self->_tap.numFingersInCurrentGestureEvent);
  }
  result.size.height = v7;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)_updateMultiTapFrame
{
  CGRect *p_tapMultiFrame;
  CGRect *p_frame;
  CGSize size;

  p_tapMultiFrame = &self->_tapMultiFrame;
  if (self->_tap.dead)
  {
    p_frame = (CGRect *)MEMORY[0x24BDBF090];
LABEL_5:
    size = p_frame->size;
    p_tapMultiFrame->origin = p_frame->origin;
    p_tapMultiFrame->size = size;
    return;
  }
  if (CGRectEqualToRect(self->_tapMultiFrame, *MEMORY[0x24BDBF090]))
  {
    p_frame = &self->_tap.frame;
    goto LABEL_5;
  }
  self->_tapMultiFrame = CGRectUnion(self->_tapMultiFrame, self->_tap.frame);
}

- (void)_updateTapState
{
  $EAF4C1BEF1EEB00B3BB7876444B1597C *p_tap;
  CGSize v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGRect v13;
  CGRect v14;

  p_tap = &self->_tap;
  if (self->_tap.dead)
  {
    v4 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
    self->_tapMultiFrame.origin = (CGPoint)*MEMORY[0x24BDBF090];
    self->_tapMultiFrame.size = v4;
    *(_OWORD *)&p_tap->isFingerCurrentlyDown = 0u;
    *(_OWORD *)&self->_tap.totalNumFingersInGesture = 0u;
    self->_tap.frame.origin = 0u;
    self->_tap.frame.size = 0u;
    self->_tap.location[0] = 0u;
    self->_tap.location[1] = 0u;
    self->_tap.location[2] = 0u;
    self->_tap.location[3] = 0u;
    self->_tap.location[4] = 0u;
    self->_tap.location[5] = 0u;
    self->_tap.location[6] = 0u;
    self->_tap.location[7] = 0u;
    self->_tap.locationPerTap[0] = 0u;
    self->_tap.locationPerTap[1] = 0u;
    self->_tap.locationPerTap[2] = 0u;
    self->_tap.locationPerTap[3] = 0u;
    self->_tap.locationPerTap[4] = 0u;
    self->_tap.locationPerTap[5] = 0u;
    self->_tap.locationPerTap[6] = 0u;
    self->_tap.locationPerTap[7] = 0u;
    *(_OWORD *)&self->_tap.thisTime = 0u;
  }
  else
  {
    p_tap->isFingerCurrentlyDown = 0;
    if (self->_tap.numFingersInCurrentGestureEvent)
    {
      -[SCRCGestureFactory _currentTapRect](self, "_currentTapRect");
      v6 = v5;
      v8 = v7;
      v10 = v9;
      v12 = v11;
      if (CGRectIsEmpty(self->_tap.frame))
      {
        self->_tap.frame.origin.x = v6;
        self->_tap.frame.origin.y = v8;
        self->_tap.frame.size.width = v10;
        self->_tap.frame.size.height = v12;
      }
      else
      {
        v13.origin.x = v6;
        v13.origin.y = v8;
        v13.size.width = v10;
        v13.size.height = v12;
        if (CGRectIntersectsRect(self->_tap.frame, v13) || self->_tap.thisTime - self->_tap.lastTime <= 0.05)
        {
          v14.origin.x = v6;
          v14.origin.y = v8;
          v14.size.width = v10;
          v14.size.height = v12;
          self->_tap.frame = CGRectUnion(self->_tap.frame, v14);
        }
        else
        {
          p_tap->dead = 1;
        }
      }
      -[SCRCGestureFactory _updateMultiTapFrame](self, "_updateMultiTapFrame");
    }
  }
}

- (void)_handleTap
{
  $EAF4C1BEF1EEB00B3BB7876444B1597C *p_tap;
  CGSize v4;
  unint64_t totalNumFingersInGesture;
  unint64_t count;
  CGFloat x;
  CGFloat v10;
  CGFloat y;
  CGFloat *p_y;
  CGFloat v13;
  unint64_t v14;
  CGSize size;
  id WeakRetained;
  CGRect v17;

  p_tap = &self->_tap;
  if (!self->_tap.dead)
  {
    totalNumFingersInGesture = self->_tap.totalNumFingersInGesture;
    if (totalNumFingersInGesture)
    {
      if (totalNumFingersInGesture != 1 || !self->_tap.gutterHasBeenTouched)
      {
        if (totalNumFingersInGesture != 1 || !p_tap->isFingerCurrentlyDown)
        {
          count = self->_tap.count;
          if (totalNumFingersInGesture == 2 && count == 1)
          {
            if (self->_split.isTapping)
              goto LABEL_2;
            count = 1;
          }
        }
        else
        {
          count = self->_tap.count;
          if (count == 1)
            goto LABEL_2;
        }
        self->_state = 7;
        self->_fingerCount = totalNumFingersInGesture;
        self->_tapCount = count;
        x = self->_tap.location[0].x;
        v10 = 1.0;
        y = self->_tap.location[0].y;
        if (totalNumFingersInGesture < 2)
        {
          v13 = 1.0;
        }
        else
        {
          p_y = &self->_tap.location[1].y;
          v13 = 1.0;
          v14 = 1;
          do
          {
            v17.origin.x = *(p_y - 1);
            v17.origin.y = *p_y;
            v17.size.width = 1.0;
            v17.size.height = 1.0;
            *(CGRect *)&x = CGRectUnion(*(CGRect *)&x, v17);
            ++v14;
            p_y += 2;
          }
          while (v14 < self->_tap.totalNumFingersInGesture);
        }
        self->_tapFrame.origin.x = x;
        self->_tapFrame.origin.y = y;
        self->_tapFrame.size.width = v10;
        self->_tapFrame.size.height = v13;
        size = self->_tapFrame.size;
        self->_tap.frame.origin = self->_tapFrame.origin;
        self->_tap.frame.size = size;
        -[SCRCGestureFactory _updateMultiTapFrame](self, "_updateMultiTapFrame");
        WeakRetained = objc_loadWeakRetained((id *)&self->_tapDelegate);
        objc_msgSend(WeakRetained, "gestureTappingCallbackWithFactory:", self);

        -[SCRCGestureFactory _resetSplit](self, "_resetSplit");
        -[SCRCGestureFactory reset](self, "reset");
      }
    }
  }
LABEL_2:
  p_tap->locationPerTap[7] = 0u;
  *(_OWORD *)&p_tap->thisTime = 0u;
  p_tap->locationPerTap[5] = 0u;
  p_tap->locationPerTap[6] = 0u;
  p_tap->locationPerTap[3] = 0u;
  p_tap->locationPerTap[4] = 0u;
  p_tap->locationPerTap[1] = 0u;
  p_tap->locationPerTap[2] = 0u;
  p_tap->location[7] = 0u;
  p_tap->locationPerTap[0] = 0u;
  p_tap->location[5] = 0u;
  p_tap->location[6] = 0u;
  p_tap->location[3] = 0u;
  p_tap->location[4] = 0u;
  p_tap->location[1] = 0u;
  p_tap->location[2] = 0u;
  p_tap->frame.size = 0u;
  p_tap->location[0] = 0u;
  *(_OWORD *)&p_tap->totalNumFingersInGesture = 0u;
  p_tap->frame.origin = 0u;
  *(_OWORD *)&p_tap->isFingerCurrentlyDown = 0u;
  v4 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  self->_tapMultiFrame.origin = (CGPoint)*MEMORY[0x24BDBF090];
  self->_tapMultiFrame.size = v4;
}

- (void)_enterTrackingMode:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  self->_tap.dead = 1;
  if ((self->_state | 2) == 3 || objc_msgSend(v5, "BOOLValue"))
  {
    self->_state = 2;
    WeakRetained = objc_loadWeakRetained((id *)&self->_trackDelegate);
    objc_msgSend(WeakRetained, "gestureTrackingCallbackWithFactory:", self);

  }
}

- (void)_handleGutterUp
{
  -[SCRCGestureFactory _processUpAndPost:](self, "_processUpAndPost:", 1);
}

- (void)_processUpAndPost:(BOOL)a3
{
  int64_t lastFingerCount;
  _BOOL4 v5;
  id WeakRetained;

  lastFingerCount = self->_lastFingerCount;
  self->_tap.numFingersInCurrentGestureEvent = 0;
  self->_potentialTrackingStartTimestamp = -3061152000.0;
  if (lastFingerCount)
  {
    v5 = a3;
    self->_tap.lastTime = self->_tap.thisTime;
    self->_lastFingerCount = 0;
    -[SCRCGestureFactory _up](self, "_up");
    if (v5)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_gutterUpDelegate);
      objc_msgSend(WeakRetained, "gestureGutterUpCallbackWithFactory:", self);

    }
  }
  -[SCRCGestureFactory _updateTapState](self, "_updateTapState", a3);
  if (self->_inTapSpeedRegionForDownEvent
    && self->_tapVelocityThresholdForRegion == 0.0
    && self->_tapSpeedFingerCount >= lastFingerCount)
  {
    -[SCRCGestureFactory _handleTap](self, "_handleTap");
  }
  self->_inTapSpeedRegionForDownEvent = 0;
}

- (void)_updateStartWithPoint:(CGPoint)a3 time:(double)a4
{
  BOOL v4;

  if (self->_finger[0].dragStalled)
    self->_lastDownTime = a4;
  if (self->_finger[0].distancePerSample.current >= self->_stallDistance || a4 - self->_lastDownTime <= 0.2)
  {
    v4 = 0;
  }
  else
  {
    self->_finger[0].distancePerSample.current = 0.0;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[49] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.sum = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[45] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[47] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[41] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[43] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[37] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[39] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[33] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[35] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[29] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[31] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[25] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[27] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[21] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[23] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[17] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[19] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[13] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[15] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[9] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[11] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[5] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[7] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[1] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.fifo[3] = 0u;
    *(_OWORD *)&self->_finger[0].distancePerSample.samples = 0u;
    self->_finger[0].normalizedVelocityPerSample.current = 0.0;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[49] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.sum = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[45] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[47] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[41] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[43] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[37] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[39] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[33] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[35] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[29] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[31] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[25] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[27] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[21] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[23] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[17] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[19] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[13] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[15] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[9] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[11] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[5] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[7] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[1] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.fifo[3] = 0u;
    *(_OWORD *)&self->_finger[0].normalizedVelocityPerSample.samples = 0u;
    self->_finger[0].lastDownPoint = a3;
    self->_finger[0].startTouchPoint = a3;
    self->_lastDownTime = a4;
    v4 = 1;
    self->_finger[0].distanceTraveledWithInertiaApplied = 0.0;
  }
  self->_finger[0].dragStalled = v4;
}

- (BOOL)_handleSplitTap
{
  BOOL *p_isTapping;
  id WeakRetained;
  BOOL result;
  CGPoint v6;

  p_isTapping = &self->_split.isTapping;
  if (self->_split.isTapping
    && self->_state <= 2
    && SCRCMathGetDistanceBetweenPoints(self->_split.startTapLocation.x, self->_split.startTapLocation.y, self->_split.lastTapLocation.x, self->_split.lastTapLocation.y)* self->_maxDimension < 5.0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_splitTapDelegate);
    objc_msgSend(WeakRetained, "gestureSplitTappingCallbackWithFactory:", self);

    result = 1;
  }
  else
  {
    result = 0;
  }
  *p_isTapping = 0;
  v6 = (CGPoint)*MEMORY[0x24BDBEFB0];
  self->_split.lastTapLocation = (CGPoint)*MEMORY[0x24BDBEFB0];
  self->_split.startTapLocation = v6;
  return result;
}

- (BOOL)_handleSplitEvent:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  BOOL *p_dead;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int64_t v14;
  char v15;
  int64_t v16;
  BOOL isSplitting;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  CGFloat v22;
  CGFloat v23;
  double fingerDownTime;
  double v25;
  id WeakRetained;
  unint64_t v28;
  void *v29;
  CGFloat v30;
  CGFloat v31;
  void *v32;
  int64_t state;
  void *v34;
  double v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  unint64_t v39;
  void *v40;
  CGFloat v41;
  CGFloat v42;

  v4 = a3;
  v5 = objc_msgSend(v4, "fingerCount");
  if (v5)
  {
    v6 = v5;
    p_dead = &self->_tap.dead;
    if (self->_split.isSplitting)
    {
      objc_msgSend(v4, "fingerWithIdentifier:", self->_split.fingerIdentifier);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        *(_WORD *)&self->_split.isSplitting = 0;
        self->_split.fingerIdentifier = 0;
        self->_state = 1;
        -[SCRCGestureFactory _resetSplit](self, "_resetSplit");
        -[SCRCGestureFactory reset](self->_splitFactory, "reset");
        goto LABEL_69;
      }
      objc_msgSend(v4, "fingerWithIdentifier:", self->_split.fingerIdentifier);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "location");
      v11 = v10;
      v13 = v12;

      objc_msgSend(v4, "removeFingerWithIdentifier:", self->_split.fingerIdentifier);
      -[SCRCGestureFactory handleGestureEvent:](self->_splitFactory, "handleGestureEvent:", v4);
      v14 = -[SCRCGestureFactory gestureState](self->_splitFactory, "gestureState");
      v15 = 1;
      v16 = 14;
      switch(v14)
      {
        case 3:
          v16 = 20;
          break;
        case 4:
          break;
        case 5:
          v16 = 15;
          break;
        case 6:
          v16 = 16;
          break;
        case 8:
          v16 = 21;
          break;
        case 10:
          v16 = 17;
          break;
        case 11:
          v16 = 18;
          break;
        case 12:
          v16 = 19;
          break;
        default:
          v15 = 0;
          v16 = 13;
          break;
      }
      self->_split.state = v16;
      if (v6 == 2)
      {
        if (self->_splitFlickEnabled)
        {
LABEL_68:
          self->_split.isTapping = 0;
          self->_split.primaryFingerLocation.x = v11;
          self->_split.primaryFingerLocation.y = v13;
          goto LABEL_69;
        }
        if (self->_split.isTapping)
          v15 = 1;
        if ((v15 & 1) == 0)
        {
          self->_split.isTapping = 1;
          goto LABEL_76;
        }
      }
      else if (self->_splitFlickEnabled)
      {
        v39 = 1;
        goto LABEL_67;
      }
      v39 = 2;
LABEL_67:
      if (v6 <= v39)
      {
        if (v6 == 1)
        {
          if (self->_split.isTapping)
          {
            objc_msgSend(v4, "fingerWithoutIdentifier:", self->_split.fingerIdentifier);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "location");
            self->_split.startTapLocation.x = v41;
            self->_split.startTapLocation.y = v42;
            self->_split.lastTapLocation = self->_split.startTapLocation;

            -[SCRCGestureFactory _handleSplitTap](self, "_handleSplitTap");
          }
          else if (SCRCMathGetDistanceBetweenPoints(self->_split.primaryFingerLocation.x, self->_split.primaryFingerLocation.y, v11, v13)* self->_maxDimension > 5.0)
          {
            self->_split.primaryFingerLocation.x = v11;
            self->_split.primaryFingerLocation.y = v13;
            self->_split.isSplitting = 0;
            isSplitting = 1;
            *((_WORD *)p_dead + 181) = 0;
            goto LABEL_77;
          }
          goto LABEL_70;
        }
LABEL_74:
        if (v6 < 3)
          goto LABEL_76;
        goto LABEL_75;
      }
      goto LABEL_68;
    }
    objc_msgSend(v4, "time");
    v19 = v18;
    v20 = -[SCRCGestureFactory gestureState](self, "gestureState");
    if (!self->_split.isTapping && !self->_split.fingerIdentifier)
    {
      objc_msgSend(v4, "fingerAtIndex:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      self->_split.fingerIdentifier = objc_msgSend(v21, "identifier");
      if (self->_split.fingerDownTime == -3061152000.0)
      {
        self->_split.fingerDownTime = v19;
        objc_msgSend(v21, "location");
        self->_split.primaryFingerLocation.x = v22;
        self->_split.primaryFingerLocation.y = v23;
      }

    }
    fingerDownTime = self->_split.fingerDownTime;
    if (fingerDownTime == -3061152000.0)
      v25 = 0.0;
    else
      v25 = v19 - fingerDownTime;
    if (v6 == 1 && !self->_split.timedOut && !self->_split.didNotify && v25 > 0.15 && v20 <= 2)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_didBeginSplitGestureDelegate);
      objc_msgSend(WeakRetained, "gestureFactoryDidBeginSplitGesture:", self);

      self->_split.didNotify = 1;
    }
    v28 = 1;
    if (!self->_splitFlickEnabled)
      v28 = 2;
    if (v6 <= v28 || self->_split.timedOut)
    {
      if (v6 != 2 || self->_splitFlickEnabled)
      {
        if (!self->_split.isTapping)
          goto LABEL_69;
      }
      else if (!self->_split.isTapping)
      {
        if (self->_split.tapDead || v25 <= 0.15)
          goto LABEL_76;
        self->_split.isTapping = 1;
        objc_msgSend(v4, "fingerWithoutIdentifier:", self->_split.fingerIdentifier);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "location");
        self->_split.startTapLocation.x = v30;
        self->_split.startTapLocation.y = v31;
        self->_split.lastTapLocation = self->_split.startTapLocation;
        goto LABEL_50;
      }
      objc_msgSend(v4, "fingerWithIdentifier:", self->_split.fingerIdentifier);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        if (v6 == 1)
        {
          state = self->_state;
          -[SCRCGestureFactory _handleSplitTap](self, "_handleSplitTap");
          -[SCRCGestureFactory reset](self, "reset");
          *p_dead = 1;
          *(_DWORD *)&self->_fingerCount = 65537;
          if (state == 1)
          {
            self->_state = 2;
            self->_split.fastTrack = 1;
            self->_potentialTrackingStartTimestamp = -3061152000.0;
          }
          else
          {
            self->_state = 1;
          }
          goto LABEL_70;
        }
        if (v6 != 2)
        {
LABEL_75:
          self->_split.tapDead = 1;
          goto LABEL_76;
        }
        objc_msgSend(v4, "fingerWithoutIdentifier:", self->_split.fingerIdentifier);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "location");
        self->_split.lastTapLocation.x = v37;
        self->_split.lastTapLocation.y = v38;
LABEL_50:

LABEL_76:
        isSplitting = self->_split.isSplitting;
        goto LABEL_77;
      }
      self->_lastFingerCount = 0;
      objc_msgSend(v4, "fingerAtIndex:", 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      self->_split.fingerIdentifier = objc_msgSend(v34, "identifier");

      self->_split.isTapping = 0;
      if (self->_state == 1)
        v35 = -3061152000.0;
      else
        v35 = v19;
      self->_split.fastTrack = self->_state == 1;
      self->_potentialTrackingStartTimestamp = v35;
      self->_state = 1;
    }
    else if (v25 <= 0.15)
    {
      self->_split.timedOut = 1;
    }
    else if (v20 <= 2)
    {
      -[SCRCGestureFactory velocity](self, "velocity");
      if (v36 < 0.15)
      {
        self->_split.tapDead = 1;
        *(_WORD *)&self->_split.isSplitting = 1;
        *p_dead = 1;
        objc_msgSend(v4, "removeFingerWithIdentifier:", self->_split.fingerIdentifier);
      }
    }
LABEL_69:
    if (v6 == 1)
    {
LABEL_70:
      *(_WORD *)&self->_split.tapDead = 0;
      goto LABEL_76;
    }
    goto LABEL_74;
  }
  -[SCRCGestureFactory _resetSplit](self, "_resetSplit");
  -[SCRCGestureFactory reset](self->_splitFactory, "reset");
  isSplitting = 0;
LABEL_77:

  return isSplitting;
}

- ($59F5B3D3FC56264B602E56EF9D3D8816)handleGestureEvent:(SEL)a3
{
  double v5;
  double v6;
  unint64_t v7;
  unint64_t v9;
  id WeakRetained;
  void *v11;
  $59F5B3D3FC56264B602E56EF9D3D8816 *result;
  double echoWaitTime;
  unint64_t lastFingerCount;
  int64_t state;
  SCRCTargetSelectorTimer *trackingTimer;
  void *v17;
  id v18;

  v18 = a4;
  objc_msgSend(v18, "time");
  v6 = v5;
  v7 = objc_msgSend(v18, "fingerCount");
  self->_absoluteFingerCount = v7;
  if (!self->_requireUp || v7 == 0)
  {
    v9 = v7;
    self->_split.fastTrack = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_canSplitTapDelegate);
    v11 = WeakRetained;
    if (self->_splitFactory
      && WeakRetained
      && (objc_msgSend(WeakRetained, "shouldBlockSplitTapGestureWithFactory:", self) & 1) == 0
      && -[SCRCGestureFactory _handleSplitEvent:](self, "_handleSplitEvent:", v18))
    {
      self->_split.active = 1;
      goto LABEL_16;
    }
    self->_split.active = 0;
    if (!v9 || objc_msgSend(v18, "isCancelEvent"))
    {
      if (objc_msgSend(v18, "isCancelEvent"))
        self->_tap.dead = 1;
      -[SCRCGestureFactory _processUpAndPost:](self, "_processUpAndPost:", 0);
      self->_requireUp = 0;
      goto LABEL_16;
    }
    if (v9 > 8 || v9 <= 1 && v6 - self->_potentialTrackingStartTimestamp <= 0.25)
    {
LABEL_16:
      -[SCRCGestureFactory captureCurrentState](self, "captureCurrentState");

      goto LABEL_17;
    }
    self->_tap.numFingersInCurrentGestureEvent = v9;
    echoWaitTime = 0.0;
    if (!self->_split.fastTrack)
      echoWaitTime = self->_echoWaitTime;
    self->_potentialTrackingStartTimestamp = -3061152000.0;
    lastFingerCount = self->_lastFingerCount;
    if (v9 == lastFingerCount)
    {
      self->_fingerCount = v9;
      self->_lastFingerCount = v9;
      if (v9 >= 2)
        self->_potentialTrackingStartTimestamp = v6;
      -[SCRCGestureFactory _drag:](self, "_drag:", v18);
      goto LABEL_16;
    }
    if (!self->_lastFingerCount || v9 >= lastFingerCount)
    {
      self->_fingerCount = v9;
      self->_lastFingerCount = v9;
      -[SCRCGestureFactory _down:](self, "_down:", v18);
      goto LABEL_16;
    }
    state = self->_state;
    if (state != 1)
    {
      if (state == 3)
        goto LABEL_36;
      if ((unint64_t)(state - 4) > 2)
        goto LABEL_16;
    }
    if (v9 == 1)
    {
      -[SCRCGestureFactory _up](self, "_up");
      *(_DWORD *)&self->_fingerCount = 65537;
      self->_setTrackingTimer = 1;
      trackingTimer = self->_trackingTimer;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCRCTargetSelectorTimer dispatchAfterDelay:withObject:](trackingTimer, "dispatchAfterDelay:withObject:", v17, echoWaitTime);

      goto LABEL_16;
    }
    self->_requireUp = 1;
LABEL_36:
    self->_potentialTrackingStartTimestamp = v6;
    -[SCRCGestureFactory _up](self, "_up");
    self->_lastFingerCount = 0;
    goto LABEL_16;
  }
  -[SCRCGestureFactory captureCurrentState](self, "captureCurrentState");
LABEL_17:

  return result;
}

- (void)_down:(id)a3
{
  $EAF4C1BEF1EEB00B3BB7876444B1597C *p_tap;
  SCRCFingerState *finger;
  double v6;
  double v7;
  unint64_t v8;
  char v9;
  char v10;
  void *v11;
  void *v12;
  SCRCFingerState *v13;
  double height;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGPoint mostRecentTouchPoint;
  double v20;
  uint64_t v21;
  uint64_t v22;
  CGPoint lastDownPoint;
  CGFloat *p_y;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  unint64_t count;
  unint64_t numFingersInCurrentGestureEvent;
  double tapVelocityThreshold;
  uint64_t v40;
  void *v41;
  CGFloat v42;
  CGFloat v43;
  BOOL v44;
  double v45;
  double thumbRegion;
  double v47;
  double v48;
  double echoWaitTime;
  double x;
  double y;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double startDegrees;
  double v61;
  id v62;
  CGPoint v63;

  p_tap = &self->_tap;
  v62 = a3;
  finger = self->_finger;
  bzero(self->_finger, 0xEB0uLL);
  self->_tap.locationPerTap[7] = 0u;
  self->_tap.locationPerTap[6] = 0u;
  self->_tap.locationPerTap[5] = 0u;
  self->_tap.locationPerTap[4] = 0u;
  self->_tap.locationPerTap[3] = 0u;
  self->_tap.locationPerTap[2] = 0u;
  self->_tap.locationPerTap[1] = 0u;
  self->_tap.locationPerTap[0] = 0u;
  objc_msgSend(v62, "time");
  v7 = v6;
  v8 = 0;
  self->_tap.thisTime = v6;
  p_tap->dead = 0;
  v9 = 1;
  while (1)
  {
    v10 = v9;
    if (v8 >= self->_fingerCount)
      break;
    objc_msgSend(v62, "fingerAtIndex:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = &finger[v8];
      objc_msgSend(v11, "location");
      height = self->_mainFrame.size.height;
      v16 = v15 * self->_mainFrame.size.width;
      objc_msgSend(v12, "location");
      v18 = height - v17 * self->_mainFrame.size.height;
      v13->mostRecentTouchPoint.x = v16;
      v13->mostRecentTouchPoint.y = v18;
      mostRecentTouchPoint = v13->mostRecentTouchPoint;
      v13->lastDownPoint = mostRecentTouchPoint;
      v13->startTouchPoint = mostRecentTouchPoint;
      v13->identifier = objc_msgSend(v12, "identifier");
      v13->type = objc_msgSend(v12, "type");
      objc_msgSend(v12, "pressure");
      v13->pressure = v20;
      if (objc_msgSend(v12, "type") == 1)
        objc_msgSend(v12, "altitude");
      else
        v21 = 0x7FF8000000000000;
      *(_QWORD *)&finger[v8].altitude = v21;
      if (objc_msgSend(v12, "type") == 1)
        objc_msgSend(v12, "azimuth");
      else
        v22 = 0x7FF8000000000000;
      *(_QWORD *)&finger[v8].azimuth = v22;
      lastDownPoint = v13->lastDownPoint;
      self->_tap.location[v8] = lastDownPoint;
      self->_tap.locationPerTap[v8] = lastDownPoint;
    }

    v9 = 0;
    v8 = 1;
    if ((v10 & 1) == 0)
    {
      v8 = 2;
      break;
    }
  }
  if (v8 < self->_tap.numFingersInCurrentGestureEvent)
  {
    p_y = &self->_tap.locationPerTap[v8].y;
    while (1)
    {
      objc_msgSend(v62, "fingerAtIndex:", v8);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v25)
        break;
      v26 = v25;
      objc_msgSend(v25, "location");
      v27 = self->_mainFrame.size.height;
      v29 = v28 * self->_mainFrame.size.width;
      objc_msgSend(v26, "location");
      v31 = v27 - v30 * self->_mainFrame.size.height;
      *(p_y - 17) = v29;
      *(p_y - 16) = v31;
      objc_msgSend(v26, "location");
      v32 = self->_mainFrame.size.height;
      v34 = v33 * self->_mainFrame.size.width;
      objc_msgSend(v26, "location");
      v36 = v32 - v35 * self->_mainFrame.size.height;
      *(p_y - 1) = v34;
      *p_y = v36;

      ++v8;
      p_y += 2;
      if (v8 >= self->_tap.numFingersInCurrentGestureEvent)
        goto LABEL_19;
    }
    p_tap->dead = 1;
  }
LABEL_19:
  *(_OWORD *)&self->_state = xmmword_2110153F0;
  self->_distance = 0.0;
  self->_scaledTrackingDistance = 0.0;
  self->_setTrackingTimer = 0;
  self->_startDegrees = 0.0;
  self->_startDistance = 0.0;
  self->_lastDegrees = 0.0;
  if (!p_tap->isFingerCurrentlyDown)
  {
    count = self->_tap.count;
    if (count <= 3)
      self->_tap.count = count + 1;
    p_tap->isFingerCurrentlyDown = 1;
  }
  numFingersInCurrentGestureEvent = self->_tap.numFingersInCurrentGestureEvent;
  if (numFingersInCurrentGestureEvent > self->_tap.totalNumFingersInGesture)
    self->_tap.totalNumFingersInGesture = numFingersInCurrentGestureEvent;
  tapVelocityThreshold = self->_tapVelocityThreshold;
  if (!CGRectEqualToRect(*MEMORY[0x24BDBF090], self->_tapSpeedRegion))
  {
    if (self->_tap.numFingersInCurrentGestureEvent)
    {
      v40 = 0;
      while (1)
      {
        objc_msgSend(v62, "fingerAtIndex:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "location");
        v63.x = v42;
        v63.y = v43;
        v44 = CGRectContainsPoint(self->_tapSpeedRegion, v63);

        if (!v44)
          break;
        if (++v40 >= self->_tap.numFingersInCurrentGestureEvent)
          goto LABEL_30;
      }
    }
    else
    {
LABEL_30:
      tapVelocityThreshold = self->_tapVelocityThresholdForRegion;
      self->_inTapSpeedRegionForDownEvent = 1;
    }
  }
  if (tapVelocityThreshold > 0.0)
    -[SCRCTargetSelectorTimer dispatchAfterDelay:](self->_tapTimer, "dispatchAfterDelay:", tapVelocityThreshold);
  if (self->_fingerCount != 1)
  {
    -[SCRCTargetSelectorTimer cancel](self->_trackingTimer, "cancel");
    self->_setTrackingTimer = 0;
    if (self->_fingerCount != 2)
      goto LABEL_68;
    x = self->_finger[0].lastDownPoint.x;
    y = self->_finger[0].lastDownPoint.y;
    v52 = self->_finger[1].lastDownPoint.x;
    v53 = self->_finger[1].lastDownPoint.y;
    v54 = x - v52;
    v55 = vabdd_f64(x, v52);
    v56 = vabdd_f64(y, v53);
    self->_startDistance = hypot(v55, v56);
    if (v54 == 0.0)
      v57 = 90.0;
    else
      v57 = atan(v56 / v55) * 57.2957795;
    v58 = y - v53;
    if (v54 >= 0.0)
    {
      if (v58 > 0.0)
        goto LABEL_54;
      v57 = 90.0 - v57;
      v59 = 270.0;
    }
    else if (v58 <= 0.0)
    {
      v59 = 180.0;
    }
    else
    {
      v59 = 90.0;
      v57 = 90.0 - v57;
    }
    v57 = v57 + v59;
LABEL_54:
    startDegrees = self->_startDegrees;
    v61 = v57 + floor(startDegrees / 360.0) * 360.0;
    self->_startDegrees = v61;
    if (v57 > 270.0)
    {
      if (startDegrees <= 0.0 || startDegrees >= 180.0)
      {
        if (startDegrees <= 360.0 && startDegrees != 0.0)
          goto LABEL_67;
      }
      else
      {
        v57 = v57 + -360.0;
      }
      goto LABEL_66;
    }
    if (v57 < 90.0)
    {
      if (startDegrees > 180.0 && startDegrees < 360.0)
      {
        v57 = v61 + 360.0;
LABEL_66:
        self->_startDegrees = v57;
        v61 = v57;
        goto LABEL_67;
      }
      if (startDegrees <= 0.0)
        goto LABEL_66;
    }
LABEL_67:
    self->_lastDegrees = v61;
    goto LABEL_68;
  }
  v45 = self->_finger[0].mostRecentTouchPoint.y;
  thumbRegion = self->_thumbRegion;
  if (v45 < thumbRegion)
  {
    v47 = 1.0 - v45 / thumbRegion;
    v48 = 3.6;
    if (!self->_thumbRejectionEnabled)
      v48 = 0.0;
    self->_scaledTrackingDistance = v47 * v48;
  }
  if (BYTE2(p_tap[1].count))
  {
    p_tap->dead = 1;
    echoWaitTime = 0.0;
  }
  else
  {
    echoWaitTime = self->_echoWaitTime;
  }
  if (!self->_thumbRejectionEnabled)
  {
    self->_setTrackingTimer = 1;
    -[SCRCTargetSelectorTimer dispatchAfterDelay:](self->_trackingTimer, "dispatchAfterDelay:", echoWaitTime);
  }
LABEL_68:
  self->_lastTime = v7;
  self->_lastDownTime = v7;

}

- (void)_drag:(id)a3
{
  BOOL *p_dead;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double width;
  double height;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  SCRCFingerState *finger;
  double v25;
  double v26;
  char v27;
  SCRCFingerState *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double *p_x;
  SCRCFingerState *v35;
  float64x2_t v36;
  float64x2_t v37;
  int8x16_t v38;
  double *v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  unsigned int fingerCount;
  int64_t v53;
  double maxDimension;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  int64_t v68;
  BOOL v69;
  double v70;
  double echoWaitTime;
  double v72;
  double scaledTrackingDistance;
  double v74;
  double vertical;
  double v76;
  double v77;
  double x;
  double y;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  BOOL v90;
  BOOL v91;
  double v92;
  double lastDegrees;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  int64_t state;
  double v106;
  double v107;
  int64_t direction;
  double v109;
  double v110;
  double horizontal;
  double v112;
  BOOL v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  id v120;
  __int128 v121;
  __int128 v122;
  uint64_t v123;

  v123 = *MEMORY[0x24BDAC8D0];
  p_dead = &self->_tap.dead;
  v120 = a3;
  objc_msgSend(v120, "fingerWithIdentifier:", self->_finger[0].identifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v120;
  if (!v5)
  {
    if (!objc_msgSend(v120, "fingerCount"))
    {
      *p_dead = 1;
      goto LABEL_160;
    }
    objc_msgSend(v120, "fingerAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v120;
  }
  objc_msgSend(v6, "time");
  v119 = v7;
  objc_msgSend(v5, "location");
  v9 = v8;
  width = self->_mainFrame.size.width;
  height = self->_mainFrame.size.height;
  objc_msgSend(v5, "location");
  v13 = v12;
  v14 = self->_mainFrame.size.height;
  v15 = objc_msgSend(v5, "type");
  objc_msgSend(v5, "pressure");
  v17 = v16;
  if (v15 == 1)
  {
    objc_msgSend(v5, "altitude");
    v19 = v18;
    objc_msgSend(v5, "azimuth");
    v21 = v20;
  }
  else
  {
    v19 = 0x7FF8000000000000;
    v21 = 0x7FF8000000000000;
  }
  v22 = 0;
  v23 = 0;
  finger = self->_finger;
  v25 = v9 * width;
  v26 = height - v13 * v14;
  v121 = 0u;
  v122 = 0u;
  v117 = v26;
  v118 = v25;
  while (1)
  {
    v27 = v22;
    v28 = &finger[v23];
    v29 = v25 - v28->mostRecentTouchPoint.x;
    v30 = v26 - v28->mostRecentTouchPoint.y;
    v31 = fabs(hypot(v29, v30));
    SCRCMathUpdateAverage((uint64_t)&v28->distancePerSample, 0x32u, v31);
    SCRCMathUpdateAverage((uint64_t)&v28->deltaXPerSample, 0x32u, v29);
    SCRCMathUpdateAverage((uint64_t)&v28->deltaYPerSample, 0x32u, v30);
    v32 = v119 - self->_lastTime;
    if (v32 == 0.0)
      v33 = 0.0;
    else
      v33 = v31 / self->_maxDimension / v32;
    p_x = &v28->mostRecentTouchPoint.x;
    v35 = &finger[v23];
    SCRCMathUpdateAverage((uint64_t)&v35->normalizedVelocityPerSample, 0x32u, v33);
    v35->distanceTraveledWithInertiaApplied = v35->distancePerSample.average + v35->distanceTraveledWithInertiaApplied;
    v36.f64[0] = v35->deltaXPerSample.average;
    v37.f64[0] = 0.0;
    v37.f64[1] = v35->deltaYPerSample.average;
    v38 = (int8x16_t)vcgtq_f64(v37, v36);
    *(int8x16_t *)&v35->xDirection = vorrq_s8(vandq_s8(v38, (int8x16_t)xmmword_211015410), vandq_s8(vbicq_s8((int8x16_t)vcgtq_f64(v36, v37), v38), (int8x16_t)xmmword_211015400));
    *p_x = v25;
    p_x[1] = v26;
    v35->pressure = v17;
    *(_QWORD *)&v35->altitude = v19;
    *(_QWORD *)&v35->azimuth = v21;
    v39 = (double *)(&v121 + v23);
    *v39 = v25;
    v39[1] = v26;
    objc_msgSend(v120, "fingerWithIdentifier:", v35[1].identifier);
    v40 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v40;
    if (v40)
      goto LABEL_14;
    if ((unint64_t)objc_msgSend(v120, "fingerCount") < 2)
      break;
    objc_msgSend(v120, "fingerAtIndex:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
    objc_msgSend(v5, "location", *(_QWORD *)&v117);
    v42 = v41;
    v43 = self->_mainFrame.size.width;
    v44 = self->_mainFrame.size.height;
    objc_msgSend(v5, "location");
    v46 = v45;
    v47 = self->_mainFrame.size.height;
    v48 = objc_msgSend(v5, "type");
    objc_msgSend(v5, "pressure");
    v17 = v49;
    if (v48 == 1)
    {
      objc_msgSend(v5, "altitude");
      v19 = v50;
      objc_msgSend(v5, "azimuth");
      v21 = v51;
    }
    else
    {
      v21 = 0x7FF8000000000000;
      v19 = 0x7FF8000000000000;
    }
    v25 = v42 * v43;
    v26 = v44 - v46 * v47;
    v22 = 1;
    v23 = 1;
    if ((v27 & 1) != 0)
      goto LABEL_20;
  }
  v5 = 0;
LABEL_20:
  fingerCount = self->_fingerCount;
  if (fingerCount == 2)
  {
    v61 = *((double *)&v121 + 1);
    v62 = *((double *)&v122 + 1);
    v63 = *(double *)&v121 - *(double *)&v122;
    v64 = vabdd_f64(*(double *)&v121, *(double *)&v122);
    v65 = vabdd_f64(*((double *)&v121 + 1), *((double *)&v122 + 1));
    v66 = hypot(v64, v65);
    if (v63 == 0.0)
      v67 = 90.0;
    else
      v67 = atan(v65 / v64) * 57.2957795;
    v76 = v61 - v62;
    if (v63 >= 0.0)
    {
      if (v76 > 0.0)
        goto LABEL_85;
      v67 = 90.0 - v67;
      v77 = 270.0;
    }
    else if (v76 <= 0.0)
    {
      v77 = 180.0;
    }
    else
    {
      v77 = 90.0;
      v67 = 90.0 - v67;
    }
    v67 = v67 + v77;
LABEL_85:
    lastDegrees = self->_lastDegrees;
    v95 = v67 + floor(lastDegrees / 360.0) * 360.0;
    self->_lastDegrees = v95;
    if (v67 <= 270.0)
    {
      if (v67 >= 90.0)
        goto LABEL_104;
      if (lastDegrees <= 180.0 || lastDegrees >= 360.0)
      {
        if (lastDegrees > 0.0)
          goto LABEL_104;
      }
      else
      {
        v67 = v95 + 360.0;
      }
    }
    else if (lastDegrees <= 0.0 || lastDegrees >= 180.0)
    {
      if (lastDegrees <= 360.0 && lastDegrees != 0.0)
        goto LABEL_104;
    }
    else
    {
      v67 = v67 + -360.0;
    }
    self->_lastDegrees = v67;
    v95 = v67;
LABEL_104:
    v97 = self->_startDegrees - v95;
    x = self->_finger[0].lastDownPoint.x;
    y = self->_finger[0].lastDownPoint.y;
    v98 = self->_finger[0].mostRecentTouchPoint.x - x;
    v99 = self->_finger[0].mostRecentTouchPoint.y - y;
    v100 = 0.0;
    if (v99 == 0.0)
      v101 = 0.0;
    else
      v101 = v98 / v99;
    v102 = self->_finger[1].mostRecentTouchPoint.x - self->_finger[1].lastDownPoint.x;
    v103 = self->_finger[1].mostRecentTouchPoint.y - self->_finger[1].lastDownPoint.y;
    v104 = v103 / v102;
    if (v102 == 0.0)
      v104 = 0.0;
    if (v103 != 0.0)
      v100 = v102 / v103;
    state = self->_state;
    if (state == 4)
    {
      v69 = 0;
    }
    else
    {
      if (state == 6)
      {
        direction = self->_direction;
        if (direction == 6)
        {
          v69 = 0;
          goto LABEL_152;
        }
        if (direction != 5)
          goto LABEL_121;
        v69 = 0;
LABEL_130:
        v70 = v118 - x;
LABEL_131:
        v110 = v70 / self->_maxDimension;
        horizontal = self->_axisFlipper.horizontal;
LABEL_153:
        v107 = v110 * horizontal;
        goto LABEL_154;
      }
      v106 = v66 - self->_startDistance;
      if (state == 5)
      {
        v69 = 0;
LABEL_115:
        v107 = v106 / self->_maxDimension;
LABEL_154:
        self->_distance = v107;
        goto LABEL_155;
      }
      v109 = v99 / v98;
      if (v98 == 0.0)
        v109 = 0.0;
      if (fabs(v109) < 1.2
        && fabs(v98) > 8.0
        && fabs(v104) < 1.2
        && fabs(v102) > 8.0
        && *(_QWORD *)&v98 >> 63 == *(_QWORD *)&v102 >> 63)
      {
LABEL_129:
        v69 = 0;
        *(_OWORD *)&self->_state = xmmword_211015420;
        goto LABEL_130;
      }
      if (fabs(v101) < 0.8
        && fabs(v99) > 4.0
        && fabs(v100) < 0.8
        && fabs(v103) > 4.0
        && *(_QWORD *)&v99 >> 63 == *(_QWORD *)&v103 >> 63)
      {
LABEL_137:
        v69 = 0;
        *(int64x2_t *)&self->_state = vdupq_n_s64(6uLL);
        goto LABEL_152;
      }
      v112 = fabs(v106);
      v113 = -[SCRCGestureFactory usesAbsoluteDistanceForPinch](self, "usesAbsoluteDistanceForPinch", *(_QWORD *)&v117);
      v114 = fabs(v66);
      if (v113)
        v115 = 7.8;
      else
        v115 = v114 / 2.75;
      v90 = v112 <= v115;
      v116 = fabs(v97);
      if (!v90 && v116 < 750.0 / (v114 + 25.0) + 4.0)
      {
        v69 = 0;
        self->_state = 5;
        goto LABEL_115;
      }
      if (v66 <= 17.0 || v116 <= 650.0 / v114 + 4.0)
      {
        v69 = v112 > 7.8 || v116 > 12.0;
        goto LABEL_155;
      }
      v69 = 0;
      self->_state = 4;
    }
    v107 = v97 / 360.0;
    goto LABEL_154;
  }
  if (fingerCount != 1)
  {
    if (fingerCount < 3)
      goto LABEL_121;
    if (self->_state == 6)
    {
      v68 = self->_direction;
      if (v68 != 6)
      {
        if (v68 != 5)
          goto LABEL_121;
        v69 = 0;
        v70 = v118 - self->_finger[0].lastDownPoint.x;
        goto LABEL_131;
      }
      v69 = 0;
      y = self->_finger[0].lastDownPoint.y;
LABEL_152:
      v110 = (v117 - y) / self->_maxDimension;
      horizontal = self->_axisFlipper.vertical;
      goto LABEL_153;
    }
    x = self->_finger[0].lastDownPoint.x;
    y = self->_finger[0].lastDownPoint.y;
    v80 = self->_finger[0].mostRecentTouchPoint.x - x;
    v81 = self->_finger[0].mostRecentTouchPoint.y - y;
    v82 = v81 / v80;
    if (v80 == 0.0)
      v82 = 0.0;
    v83 = fabs(v82);
    if (v81 == 0.0)
      v84 = 0.0;
    else
      v84 = v80 / v81;
    v85 = self->_finger[1].mostRecentTouchPoint.x - self->_finger[1].lastDownPoint.x;
    v86 = self->_finger[1].mostRecentTouchPoint.y - self->_finger[1].lastDownPoint.y;
    v87 = v85 / v86;
    if (v86 == 0.0)
      v87 = 0.0;
    if (v83 >= 1.2)
      goto LABEL_75;
    v88 = v86 / v85;
    if (v85 == 0.0)
      v88 = 0.0;
    if (fabs(v80) <= 8.0
      || ((v89 = fabs(v85), fabs(v88) < 1.2) ? (v90 = v89 <= 8.0) : (v90 = 1),
          !v90 ? (v91 = *(_QWORD *)&v80 >> 63 == *(_QWORD *)&v85 >> 63) : (v91 = 0),
          !v91))
    {
LABEL_75:
      if (fabs(v84) >= 0.8)
        goto LABEL_121;
      v69 = 0;
      if (fabs(v81) <= 4.0)
        goto LABEL_155;
      v92 = fabs(v86);
      if (fabs(v87) >= 0.8 || v92 <= 4.0)
        goto LABEL_155;
      if (*(_QWORD *)&v81 >> 63 != *(_QWORD *)&v86 >> 63)
        goto LABEL_121;
      goto LABEL_137;
    }
    goto LABEL_129;
  }
  -[SCRCGestureFactory _updateStartWithPoint:time:](self, "_updateStartWithPoint:time:", v118, v117, v119);
  v53 = self->_state;
  if (v53 != 2 && self->_finger[0].normalizedVelocityPerSample.average > self->_flickVelocityThreshold)
  {
    v53 = 3;
    self->_state = 3;
  }
  maxDimension = self->_maxDimension;
  self->_distance = self->_finger[0].distancePerSample.average / maxDimension;
  v55 = self->_finger[0].lastDownPoint.x;
  v56 = self->_finger[0].lastDownPoint.y;
  v57 = self->_finger[0].mostRecentTouchPoint.x - v55;
  v58 = self->_finger[0].mostRecentTouchPoint.y - v56;
  if (v57 == 0.0)
    v59 = 0.0;
  else
    v59 = v58 / v57;
  v60 = hypot(self->_finger[0].mostRecentTouchPoint.x - v55, self->_finger[0].mostRecentTouchPoint.y - v56);
  if (!self->_setTrackingTimer)
  {
    if (v53 != 3)
    {
      if (v53 == 2)
        goto LABEL_48;
      if (v53 != 1)
        goto LABEL_121;
    }
    echoWaitTime = 0.0;
    if (!p_dead[361])
    {
      v72 = fabs(v60);
      scaledTrackingDistance = self->_scaledTrackingDistance;
      if ((v72 <= scaledTrackingDistance || self->_finger[0].normalizedVelocityPerSample.average <= 0.2)
        && v72 <= scaledTrackingDistance + scaledTrackingDistance)
      {
LABEL_121:
        v69 = 0;
        goto LABEL_155;
      }
      echoWaitTime = self->_echoWaitTime;
    }
    self->_setTrackingTimer = 1;
    -[SCRCTargetSelectorTimer dispatchAfterDelay:](self->_trackingTimer, "dispatchAfterDelay:", echoWaitTime, *(_QWORD *)&v117);
    goto LABEL_121;
  }
  if (v53 != 2)
    goto LABEL_121;
LABEL_48:
  if (fabs(v57) > 8.0 && fabs(v59) < 1.2)
  {
    v69 = 0;
    self->_direction = 5;
    v74 = (v118 - v55) / maxDimension;
    vertical = self->_axisFlipper.horizontal;
    goto LABEL_101;
  }
  v69 = 0;
  v96 = v57 / v58;
  if (v58 == 0.0)
    v96 = 0.0;
  if (fabs(v58) > 8.0 && fabs(v96) < 0.8)
  {
    v69 = 0;
    self->_direction = 6;
    v74 = (v117 - v56) / maxDimension;
    vertical = self->_axisFlipper.vertical;
LABEL_101:
    self->_distance = vertical * v74;
    self->_finger[0].lastDownPoint = self->_finger[0].mostRecentTouchPoint;
  }
LABEL_155:
  if (!*p_dead && (v69 || (self->_state | 2) != 3))
  {
    p_dead[362] = self->_fingerCount != 1;
    *p_dead = 1;
  }
  self->_lastTime = v119;

LABEL_160:
}

- (void)_up
{
  int64_t state;
  int64_t v4;
  int64_t v5;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int64_t xDirection;

  if (self->_fingerCount)
  {
    if (self->_fingerCount == 1)
    {
      self->_direction = 0;
      state = self->_state;
      if (state == 1)
      {
        -[SCRCTargetSelectorTimer cancel](self->_trackingTimer, "cancel");
        self->_setTrackingTimer = 0;
        goto LABEL_19;
      }
      if (state != 3)
      {
        if (state != 2)
          return;
LABEL_19:
        self->_state = 0;
        return;
      }
      -[SCRCTargetSelectorTimer cancel](self->_trackingTimer, "cancel");
      self->_setTrackingTimer = 0;
      self->_state = 0;
      x = self->_finger[0].mostRecentTouchPoint.x;
      v7 = self->_finger[0].lastDownPoint.x;
      v8 = self->_finger[0].mostRecentTouchPoint.y - self->_finger[0].lastDownPoint.y;
      v9 = v8 / (x - v7);
      if (x - v7 == 0.0)
        v9 = 0.0;
      v10 = fabs(v9);
      v11 = (x - v7) / v8;
      if (v8 == 0.0)
        v11 = 0.0;
      if (v10 < 1.2 && vabdd_f64(x, v7) > 3.6)
      {
        self->_tap.dead = 1;
        xDirection = self->_finger[0].xDirection;
LABEL_27:
        self->_state = 8;
        self->_direction = xDirection;
        self->_directionalSlope = v10;
        return;
      }
      v10 = fabs(v11);
      if (v10 < 0.8 && fabs(v8) > 3.6)
      {
        self->_tap.dead = 1;
        xDirection = self->_finger[0].yDirection;
        goto LABEL_27;
      }
    }
    else
    {
      v4 = self->_state;
      switch(v4)
      {
        case 6:
          v5 = 12;
          break;
        case 5:
          v5 = 11;
          break;
        case 4:
          v5 = 10;
          break;
        default:
          return;
      }
      self->_state = v5;
    }
  }
}

- (void)reset
{
  -[SCRCGestureFactory reset](self->_splitFactory, "reset");
  *(_DWORD *)&self->_fingerCount = 0;
  self->_requireUp = 0;
  self->_state = 0;
  self->_direction = 0;
  self->_potentialTrackingStartTimestamp = -3061152000.0;
  -[SCRCTargetSelectorTimer cancel](self->_tapTimer, "cancel");
}

- (void)_resetSplit
{
  *(_WORD *)&self->_split.tapDead = 0;
  self->_split.fingerDownTime = -3061152000.0;
  self->_split.fingerIdentifier = 0;
  self->_split.isSplitting = 0;
  self->_split.didNotify = 0;
}

- ($59F5B3D3FC56264B602E56EF9D3D8816)captureCurrentState
{
  CGPoint *p_mostRecentTouchPoint;
  SCRCGestureFactory *splitFactory;
  int64_t v7;
  double v8;
  double average;
  double distance;
  int v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  char v22;
  double v23;
  unint64_t fingerCount;
  double height;
  double width;
  CGFloat v28;
  float64x2_t v29;
  uint64_t v30;
  float64x2_t *v31;
  int64_t v32;
  double x;
  int64_t v34;
  double v35;
  double y;
  double v37;
  CGFloat v38;
  CGFloat v39;
  int64_t v40;
  double v41;
  double v42;
  int64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat MidX;
  $59F5B3D3FC56264B602E56EF9D3D8816 *result;
  CGFloat MidY;
  double v64;
  double v65;
  double v66;
  int64_t v67;
  double v68;
  double v69;
  double v70;
  CGPoint v71;
  uint64_t v72;
  uint64_t v73;
  CGPoint v74;
  CGPoint v75;
  _OWORD v76[2];
  CGPoint v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;

  *(_OWORD *)&retstr->var19.y = 0u;
  *(_OWORD *)&retstr->var20.y = 0u;
  p_mostRecentTouchPoint = &self->_finger[0].mostRecentTouchPoint;
  *(_OWORD *)&retstr->var18.origin.y = 0u;
  *(_OWORD *)&retstr->var18.size.height = 0u;
  *(_OWORD *)&retstr->var17.origin.y = 0u;
  *(_OWORD *)&retstr->var17.size.height = 0u;
  *(_OWORD *)&retstr->var15.y = 0u;
  *(_OWORD *)&retstr->var16.y = 0u;
  *(_OWORD *)&retstr->var13 = 0u;
  *(_OWORD *)&retstr->var14.y = 0u;
  retstr->var10 = 0u;
  *(_OWORD *)&retstr->var11 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  v77 = (CGPoint)0;
  memset(v76, 0, 24);
  v75 = (CGPoint)0;
  if (!self->_split.active)
  {
    retstr->var0 = self->_state;
    average = 0.0;
    distance = 0.0;
    goto LABEL_8;
  }
  splitFactory = self->_splitFactory;
  if (!splitFactory)
  {
    v7 = 0;
    retstr->var0 = self->_split.state;
    v8 = 0.0;
    average = 0.0;
    distance = 0.0;
LABEL_11:
    v22 = 0;
    retstr->var1 = v7;
    retstr->var2 = self->_directionalSlope;
    retstr->var3 = v8;
    goto LABEL_29;
  }
  -[SCRCGestureFactory captureCurrentState](splitFactory, "captureCurrentState");
  v7 = v67;
  v8 = v68;
  average = v69;
  v77 = v71;
  distance = v70;
  *((_QWORD *)&v76[0] + 1) = v72;
  *(_QWORD *)&v76[1] = v73;
  v75 = v74;
  v11 = BYTE5(p_mostRecentTouchPoint[153].x);
  v12 = 4712;
  if (!BYTE5(p_mostRecentTouchPoint[153].x))
    v12 = 336;
  retstr->var0 = *(int64_t *)((char *)&self->super.isa + v12);
  if (v11)
    goto LABEL_11;
LABEL_8:
  retstr->var1 = self->_directions[self->_direction];
  retstr->var2 = self->_directionalSlope;
  -[SCRCGestureFactory startLocation](self, "startLocation");
  v14 = v13;
  v16 = v15;
  -[SCRCGestureFactory endLocation](self, "endLocation");
  v18 = 1.0 - v14 + v17 + -1.0;
  v20 = v16 - v19;
  if (v18 == 0.0)
    v21 = 90.0;
  else
    v21 = atan(fabs(v20 / v18)) * 57.2957795;
  if (v18 < 0.0)
  {
    if (v20 <= 0.0)
    {
      v23 = 180.0;
    }
    else
    {
      v23 = 90.0;
      v21 = 90.0 - v21;
    }
    goto LABEL_19;
  }
  if (v20 <= 0.0)
  {
    v21 = 90.0 - v21;
    v23 = 270.0;
LABEL_19:
    v21 = v21 + v23;
  }
  if (v21 >= 90.0 && v21 <= 270.0)
    v21 = v21 + 0.0;
  retstr->var3 = v21;
  if (BYTE5(p_mostRecentTouchPoint[153].x))
  {
    v22 = 0;
  }
  else
  {
    average = self->_finger[0].normalizedVelocityPerSample.average;
    distance = self->_distance;
    v22 = 1;
  }
LABEL_29:
  retstr->var4 = average;
  retstr->var5 = distance;
  fingerCount = self->_fingerCount;
  retstr->var6 = self->_absoluteFingerCount;
  retstr->var7 = fingerCount;
  retstr->var8 = self->_tapCount;
  retstr->var9 = LOBYTE(p_mostRecentTouchPoint[130].y);
  if ((v22 & 1) == 0)
  {
    retstr->var10 = v77;
    *(CGPoint *)&retstr->var11 = p_mostRecentTouchPoint[2];
    retstr->var13 = self->_finger[0].azimuth;
    retstr->var14 = v77;
    retstr->var15 = *(CGPoint *)((char *)v76 + 8);
LABEL_44:
    retstr->var16 = v75;
    goto LABEL_47;
  }
  width = self->_mainFrame.size.width;
  height = self->_mainFrame.size.height;
  v28 = (height - self->_finger[0].mostRecentTouchPoint.y) / height;
  retstr->var10.x = self->_finger[0].mostRecentTouchPoint.x / width;
  retstr->var10.y = v28;
  *(CGPoint *)&retstr->var11 = p_mostRecentTouchPoint[2];
  retstr->var13 = self->_finger[0].azimuth;
  v29 = *(float64x2_t *)MEMORY[0x24BDBEFB0];
  v30 = 2;
  if (fingerCount < 2)
    v30 = fingerCount;
  if (v30)
  {
    v31 = (float64x2_t *)p_mostRecentTouchPoint;
    do
    {
      v29 = vaddq_f64(v29, *v31);
      v31 = (float64x2_t *)((char *)v31 + 1880);
      --v30;
    }
    while (v30);
  }
  if (!(_DWORD)fingerCount)
  {
    retstr->var14.x = v29.f64[0] / width;
    retstr->var14.y = (height - v29.f64[1]) / height;
    goto LABEL_46;
  }
  retstr->var14.x = v29.f64[0] / (double)fingerCount / width;
  retstr->var14.y = (height - v29.f64[1] / (double)fingerCount) / height;
  if ((_DWORD)fingerCount != 2)
  {
LABEL_46:
    v39 = (height - self->_finger[0].startTouchPoint.y) / height;
    retstr->var15.x = self->_finger[0].startTouchPoint.x / width;
    retstr->var15.y = v39;
    goto LABEL_47;
  }
  v32 = self->_directions[self->_direction];
  x = self->_finger[0].startTouchPoint.x;
  v78.origin.y = self->_finger[0].startTouchPoint.y;
  v88.origin.x = self->_finger[1].startTouchPoint.x;
  v88.origin.y = self->_finger[1].startTouchPoint.y;
  v78.size.width = 1.0;
  v78.size.height = 1.0;
  v88.size.width = 1.0;
  v88.size.height = 1.0;
  v78.origin.x = x;
  v79 = CGRectUnion(v78, v88);
  if (v32 == 5)
    x = v79.origin.x + v79.origin.x / (width - v79.size.width) * v79.size.width;
  v34 = self->_directions[self->_direction];
  v35 = self->_mainFrame.size.height;
  v80.origin.x = self->_finger[0].startTouchPoint.x;
  y = self->_finger[0].startTouchPoint.y;
  v89.origin.x = self->_finger[1].startTouchPoint.x;
  v89.origin.y = self->_finger[1].startTouchPoint.y;
  v37 = x / self->_mainFrame.size.width;
  v80.size.width = 1.0;
  v80.size.height = 1.0;
  v89.size.width = 1.0;
  v89.size.height = 1.0;
  v80.origin.y = y;
  v81 = CGRectUnion(v80, v89);
  if (v34 == 6)
    y = v81.origin.y + v81.origin.y / (v35 - v81.size.height) * v81.size.height;
  v38 = (v35 - y) / self->_mainFrame.size.height;
  retstr->var15.x = v37;
  retstr->var15.y = v38;
  if (BYTE5(p_mostRecentTouchPoint[153].x))
    goto LABEL_44;
LABEL_47:
  if (self->_fingerCount == 2)
  {
    v40 = self->_directions[self->_direction];
    v41 = self->_finger[0].mostRecentTouchPoint.x;
    v82.origin.y = self->_finger[0].mostRecentTouchPoint.y;
    v90.origin.x = self->_finger[1].mostRecentTouchPoint.x;
    v90.origin.y = self->_finger[1].mostRecentTouchPoint.y;
    v42 = self->_mainFrame.size.width;
    v82.size.width = 1.0;
    v82.size.height = 1.0;
    v90.size.width = 1.0;
    v90.size.height = 1.0;
    v82.origin.x = v41;
    v83 = CGRectUnion(v82, v90);
    if (v40 == 5)
      v41 = v83.origin.x + v83.origin.x / (v42 - v83.size.width) * v83.size.width;
    v43 = self->_directions[self->_direction];
    v44 = self->_mainFrame.size.height;
    v84.origin.x = self->_finger[0].mostRecentTouchPoint.x;
    v45 = self->_finger[0].mostRecentTouchPoint.y;
    v91.origin.x = self->_finger[1].mostRecentTouchPoint.x;
    v91.origin.y = self->_finger[1].mostRecentTouchPoint.y;
    v46 = v41 / self->_mainFrame.size.width;
    v84.size.width = 1.0;
    v84.size.height = 1.0;
    v91.size.width = 1.0;
    v91.size.height = 1.0;
    v84.origin.y = v45;
    v85 = CGRectUnion(v84, v91);
    if (v43 == 6)
      v45 = v85.origin.y + v85.origin.y / (v44 - v85.size.height) * v85.size.height;
    v48 = self->_mainFrame.size.width;
    v47 = self->_mainFrame.size.height;
    retstr->var16.x = v46;
    retstr->var16.y = (v44 - v45) / v47;
  }
  else
  {
    v48 = self->_mainFrame.size.width;
    v47 = self->_mainFrame.size.height;
    v49 = (v47 - self->_finger[0].mostRecentTouchPoint.y) / v47;
    retstr->var16.x = self->_finger[0].mostRecentTouchPoint.x / v48;
    retstr->var16.y = v49;
  }
  v50 = self->_tapFrame.size.height;
  v51 = (v47 - (self->_tapFrame.origin.y + v50)) / v47;
  v52 = self->_tapFrame.size.width / v48;
  retstr->var17.origin.x = self->_tapFrame.origin.x / v48;
  retstr->var17.origin.y = v51;
  retstr->var17.size.width = v52;
  retstr->var17.size.height = v50 / v47;
  v53 = self->_tapMultiFrame.origin.x / v48;
  v54 = self->_tapMultiFrame.size.height;
  v55 = (v47 - (self->_tapMultiFrame.origin.y + v54)) / v47;
  v56 = self->_tapMultiFrame.size.width / v48;
  retstr->var18.origin.x = v53;
  retstr->var18.origin.y = v55;
  retstr->var18.size.width = v56;
  retstr->var18.size.height = v54 / v47;
  -[SCRCGestureFactory tapFrame](self, "tapFrame");
  v57 = v86.origin.x;
  v58 = v86.origin.y;
  v59 = v86.size.width;
  v60 = v86.size.height;
  MidX = CGRectGetMidX(v86);
  v87.origin.x = v57;
  v87.origin.y = v58;
  v87.size.width = v59;
  v87.size.height = v60;
  MidY = CGRectGetMidY(v87);
  retstr->var19.x = MidX;
  retstr->var19.y = MidY;
  v64 = self->_mainFrame.size.height;
  v65 = self->_tapFrame.origin.y;
  v66 = self->_tapFrame.size.height;
  retstr->var20.x = (self->_tapFrame.origin.x
                   + self->_tapFrame.origin.x
                   / (self->_mainFrame.size.width - self->_tapFrame.size.width)
                   * self->_tapFrame.size.width)
                  / self->_mainFrame.size.width;
  retstr->var20.y = (v64 - (v65 + v65 / (v64 - v66) * v66)) / v64;
  retstr->var21 = self->_tap.thisTime - self->_tap.lastTime;
  return result;
}

- (double)directionalSlope
{
  return self->_directionalSlope;
}

- (int64_t)gestureState
{
  uint64_t v2;

  v2 = 4712;
  if (!self->_split.active)
    v2 = 336;
  return *(int64_t *)((char *)&self->super.isa + v2);
}

- (int64_t)direction
{
  if (self->_split.active)
    return -[SCRCGestureFactory direction](self->_splitFactory, "direction");
  else
    return self->_directions[self->_direction];
}

- (double)vector
{
  double result;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  if (self->_split.active)
  {
    -[SCRCGestureFactory vector](self->_splitFactory, "vector");
    return result;
  }
  -[SCRCGestureFactory startLocation](self, "startLocation");
  v5 = v4;
  v7 = v6;
  -[SCRCGestureFactory endLocation](self, "endLocation");
  v9 = 1.0 - v5 + v8 + -1.0;
  v11 = v7 - v10;
  if (v9 == 0.0)
    result = 90.0;
  else
    result = atan(fabs(v11 / v9)) * 57.2957795;
  if (v9 < 0.0)
  {
    if (v11 <= 0.0)
    {
      v12 = 180.0;
    }
    else
    {
      v12 = 90.0;
      result = 90.0 - result;
    }
    goto LABEL_12;
  }
  if (v11 <= 0.0)
  {
    result = 90.0 - result;
    v12 = 270.0;
LABEL_12:
    result = result + v12;
  }
  if (result >= 90.0 && result <= 270.0)
    return result + 0.0;
  return result;
}

- (double)velocity
{
  double result;

  if (!self->_split.active)
    return self->_finger[0].normalizedVelocityPerSample.average;
  -[SCRCGestureFactory velocity](self->_splitFactory, "velocity");
  return result;
}

- (double)distance
{
  double result;

  if (!self->_split.active)
    return self->_distance;
  -[SCRCGestureFactory distance](self->_splitFactory, "distance");
  return result;
}

- (unint64_t)absoluteFingerCount
{
  return self->_absoluteFingerCount;
}

- (unint64_t)fingerCount
{
  return self->_fingerCount;
}

- (unint64_t)tapCount
{
  return self->_tapCount;
}

- (BOOL)tapIsDown
{
  return self->_tap.isFingerCurrentlyDown;
}

- (CGPoint)rawLocation
{
  double v2;
  double v3;
  CGPoint result;

  if (self->_split.active)
  {
    -[SCRCGestureFactory rawLocation](self->_splitFactory, "rawLocation");
  }
  else
  {
    v2 = self->_finger[0].mostRecentTouchPoint.x / self->_mainFrame.size.width;
    v3 = (self->_mainFrame.size.height - self->_finger[0].mostRecentTouchPoint.y) / self->_mainFrame.size.height;
  }
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)firstFingerPressure
{
  return self->_finger[0].pressure;
}

- (double)firstFingerAltitude
{
  return self->_finger[0].altitude;
}

- (double)firstFingerAzimuth
{
  return self->_finger[0].azimuth;
}

- (CGPoint)rawAverageLocation
{
  CGPoint *p_mostRecentTouchPoint;
  double v3;
  double v4;
  float64x2_t v5;
  unsigned int fingerCount;
  uint64_t v7;
  CGPoint result;

  p_mostRecentTouchPoint = &self->_finger[0].mostRecentTouchPoint;
  if (self->_split.active)
  {
    -[SCRCGestureFactory rawLocation](self->_splitFactory, "rawLocation");
  }
  else
  {
    v5 = *(float64x2_t *)MEMORY[0x24BDBEFB0];
    fingerCount = self->_fingerCount;
    if (fingerCount >= 2)
      v7 = 2;
    else
      v7 = self->_fingerCount;
    if ((_DWORD)v7)
    {
      do
      {
        v5 = vaddq_f64(v5, *(float64x2_t *)p_mostRecentTouchPoint);
        p_mostRecentTouchPoint = (CGPoint *)((char *)p_mostRecentTouchPoint + 1880);
        --v7;
      }
      while (v7);
    }
    if (self->_fingerCount)
      v5 = vdivq_f64(v5, (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)fingerCount), 0));
    v3 = v5.f64[0] / self->_mainFrame.size.width;
    v4 = (self->_mainFrame.size.height - v5.f64[1]) / self->_mainFrame.size.height;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)startLocation
{
  double v3;
  double v4;
  int64_t v5;
  double x;
  double width;
  int64_t v8;
  double height;
  double y;
  double v11;
  CGPoint result;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  if (self->_split.active)
  {
    -[SCRCGestureFactory startLocation](self->_splitFactory, "startLocation");
  }
  else
  {
    if (self->_fingerCount == 2)
    {
      v5 = self->_directions[self->_direction];
      x = self->_finger[0].startTouchPoint.x;
      v13.origin.y = self->_finger[0].startTouchPoint.y;
      v17.origin.x = self->_finger[1].startTouchPoint.x;
      v17.origin.y = self->_finger[1].startTouchPoint.y;
      width = self->_mainFrame.size.width;
      v13.size.width = 1.0;
      v13.size.height = 1.0;
      v17.size.width = 1.0;
      v17.size.height = 1.0;
      v13.origin.x = x;
      v14 = CGRectUnion(v13, v17);
      if (v5 == 5)
        x = v14.origin.x + v14.origin.x / (width - v14.size.width) * v14.size.width;
      v8 = self->_directions[self->_direction];
      height = self->_mainFrame.size.height;
      v15.origin.x = self->_finger[0].startTouchPoint.x;
      y = self->_finger[0].startTouchPoint.y;
      v18.origin.x = self->_finger[1].startTouchPoint.x;
      v18.origin.y = self->_finger[1].startTouchPoint.y;
      v11 = x / self->_mainFrame.size.width;
      v15.size.width = 1.0;
      v15.size.height = 1.0;
      v18.size.width = 1.0;
      v18.size.height = 1.0;
      v15.origin.y = y;
      v16 = CGRectUnion(v15, v18);
      if (v8 == 6)
        y = v16.origin.y + v16.origin.y / (height - v16.size.height) * v16.size.height;
      v4 = (height - y) / self->_mainFrame.size.height;
    }
    else
    {
      v11 = self->_finger[0].startTouchPoint.x / self->_mainFrame.size.width;
      v4 = (self->_mainFrame.size.height - self->_finger[0].startTouchPoint.y) / self->_mainFrame.size.height;
    }
    v3 = v11;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)endLocation
{
  double v3;
  double v4;
  int64_t v5;
  double x;
  double width;
  int64_t v8;
  double height;
  double y;
  double v11;
  CGPoint result;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  if (self->_split.active)
  {
    -[SCRCGestureFactory endLocation](self->_splitFactory, "endLocation");
  }
  else
  {
    if (self->_fingerCount == 2)
    {
      v5 = self->_directions[self->_direction];
      x = self->_finger[0].mostRecentTouchPoint.x;
      v13.origin.y = self->_finger[0].mostRecentTouchPoint.y;
      v17.origin.x = self->_finger[1].mostRecentTouchPoint.x;
      v17.origin.y = self->_finger[1].mostRecentTouchPoint.y;
      width = self->_mainFrame.size.width;
      v13.size.width = 1.0;
      v13.size.height = 1.0;
      v17.size.width = 1.0;
      v17.size.height = 1.0;
      v13.origin.x = x;
      v14 = CGRectUnion(v13, v17);
      if (v5 == 5)
        x = v14.origin.x + v14.origin.x / (width - v14.size.width) * v14.size.width;
      v8 = self->_directions[self->_direction];
      height = self->_mainFrame.size.height;
      v15.origin.x = self->_finger[0].mostRecentTouchPoint.x;
      y = self->_finger[0].mostRecentTouchPoint.y;
      v18.origin.x = self->_finger[1].mostRecentTouchPoint.x;
      v18.origin.y = self->_finger[1].mostRecentTouchPoint.y;
      v11 = x / self->_mainFrame.size.width;
      v15.size.width = 1.0;
      v15.size.height = 1.0;
      v18.size.width = 1.0;
      v18.size.height = 1.0;
      v15.origin.y = y;
      v16 = CGRectUnion(v15, v18);
      if (v8 == 6)
        y = v16.origin.y + v16.origin.y / (height - v16.size.height) * v16.size.height;
      v4 = (height - y) / self->_mainFrame.size.height;
    }
    else
    {
      v11 = self->_finger[0].mostRecentTouchPoint.x / self->_mainFrame.size.width;
      v4 = (self->_mainFrame.size.height - self->_finger[0].mostRecentTouchPoint.y) / self->_mainFrame.size.height;
    }
    v3 = v11;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGRect)tapFrame
{
  double width;
  double height;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  width = self->_mainFrame.size.width;
  height = self->_mainFrame.size.height;
  v4 = self->_tapFrame.origin.x / width;
  v5 = self->_tapFrame.size.height;
  v6 = (height - (self->_tapFrame.origin.y + v5)) / height;
  v7 = self->_tapFrame.size.width / width;
  v8 = v5 / height;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v4;
  return result;
}

- (CGRect)multiTapFrame
{
  double width;
  double height;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  width = self->_mainFrame.size.width;
  height = self->_mainFrame.size.height;
  v4 = self->_tapMultiFrame.origin.x / width;
  v5 = self->_tapMultiFrame.size.height;
  v6 = (height - (self->_tapMultiFrame.origin.y + v5)) / height;
  v7 = self->_tapMultiFrame.size.width / width;
  v8 = v5 / height;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v4;
  return result;
}

- (CGPoint)tapPoint
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  double MidY;
  double v8;
  CGPoint result;
  CGRect v10;
  CGRect v11;

  -[SCRCGestureFactory tapFrame](self, "tapFrame");
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  MidX = CGRectGetMidX(v10);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  MidY = CGRectGetMidY(v11);
  v8 = MidX;
  result.y = MidY;
  result.x = v8;
  return result;
}

- (CGPoint)tapPointWeightedToSides
{
  double v2;
  double v3;
  CGPoint result;

  v2 = (self->_tapFrame.origin.x
      + self->_tapFrame.origin.x
      / (self->_mainFrame.size.width - self->_tapFrame.size.width)
      * self->_tapFrame.size.width)
     / self->_mainFrame.size.width;
  v3 = (self->_mainFrame.size.height
      - (self->_tapFrame.origin.y
       + self->_tapFrame.origin.y
       / (self->_mainFrame.size.height - self->_tapFrame.size.height)
       * self->_tapFrame.size.height))
     / self->_mainFrame.size.height;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)tapInterval
{
  return self->_tap.thisTime - self->_tap.lastTime;
}

- (id)gestureStateString
{
  -[SCRCGestureFactory gestureState](self, "gestureState");
  return 0;
}

- (CGPoint)splitTapPrimaryFingerPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_split.primaryFingerLocation.x;
  y = self->_split.primaryFingerLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)thumbRejectionEnabled
{
  return self->_thumbRejectionEnabled;
}

- (void)setThumbRejectionEnabled:(BOOL)a3
{
  self->_thumbRejectionEnabled = a3;
}

- (BOOL)splitFlickEnabled
{
  return self->_splitFlickEnabled;
}

- (void)setSplitFlickEnabled:(BOOL)a3
{
  self->_splitFlickEnabled = a3;
}

- (BOOL)usesAbsoluteDistanceForPinch
{
  return self->_usesAbsoluteDistanceForPinch;
}

- (void)setUsesAbsoluteDistanceForPinch:(BOOL)a3
{
  self->_usesAbsoluteDistanceForPinch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_splitFactory, 0);
  objc_storeStrong((id *)&self->_gutterUpTimer, 0);
  objc_storeStrong((id *)&self->_tapTimer, 0);
  objc_storeStrong((id *)&self->_trackingTimer, 0);
  objc_destroyWeak((id *)&self->_didBeginSplitGestureDelegate);
  objc_destroyWeak((id *)&self->_canSplitTapDelegate);
  objc_destroyWeak((id *)&self->_splitTapDelegate);
  objc_destroyWeak((id *)&self->_gutterUpDelegate);
  objc_destroyWeak((id *)&self->_tapDelegate);
  objc_destroyWeak((id *)&self->_trackDelegate);
}

@end
