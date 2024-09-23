@implementation UIKBCadenceMonitor

- (id)recognizer:(id)a3 confidenceWhenPendingTouchInfo:(id)a4
{
  _UIKBRTPendingConfidenceLevels *v5;
  double v6;
  double v7;

  if (-[UIKBCadenceMonitor touchCount](self, "touchCount", a3, a4) >= 10)
  {
    v5 = objc_alloc_init(_UIKBRTPendingConfidenceLevels);
    -[UIKBCadenceMonitor confidence](self, "confidence");
    -[_UIKBRTConfidenceLevels setTouchConfidence:](v5, "setTouchConfidence:");
    LODWORD(v6) = 0;
    -[_UIKBRTConfidenceLevels setRestConfidence:](v5, "setRestConfidence:", v6);
    LODWORD(v7) = 0;
    -[_UIKBRTPendingConfidenceLevels setConfidenceCheckTimeout:](v5, "setConfidenceCheckTimeout:", v7);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)recognizer:(id)a3 confidenceWhenSettingTouchInfo:(id)a4
{
  return 0;
}

- (void)updateConfidenceWithGap:(double)a3
{
  double v5;
  float v6;
  double v7;
  double v8;
  float v9;
  double v10;
  double v11;

  -[UIKBCadenceMonitor gapAvg](self, "gapAvg");
  v6 = v5 - a3;
  -[UIKBCadenceMonitor gapAvg](self, "gapAvg");
  v8 = v7 * v7;
  if (v6 <= 0.0)
  {
    v9 = v8 * 0.2;
    v10 = 0.200000003;
  }
  else
  {
    v9 = v8 * 0.8;
    v10 = 0.800000012;
  }
  v11 = v6 * v6 * v10;
  *(float *)&v11 = v11;
  if (*(float *)&v11 > v9)
    *(float *)&v11 = v9;
  *(float *)&v11 = (float)((float)(v9 - *(float *)&v11) / v9) * 100.0;
  -[UIKBCadenceMonitor setConfidence:](self, "setConfidence:", v11);
}

- (void)typingCadence:(double)a3
{
  double v5;
  double v6;
  float v7;
  float v8;
  double v9;
  float v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  UIDelayedAction *v19;
  UIDelayedAction *v20;

  if (-[UIKBCadenceMonitor touchCount](self, "touchCount") < 1)
  {
    v6 = 30.0;
  }
  else
  {
    -[UIKBCadenceMonitor prevTouchDown](self, "prevTouchDown");
    v6 = a3 - v5;
    v7 = 60.0 / (a3 - v5);
    -[UIKBCadenceMonitor typingAvg](self, "typingAvg");
    if (v8 == 0.0)
    {
      -[UIKBCadenceMonitor gapAvg](self, "gapAvg");
      if (v9 == 0.0)
      {
        *(float *)&v9 = v7;
        -[UIKBCadenceMonitor setTypingAvg:](self, "setTypingAvg:", v9);
        -[UIKBCadenceMonitor setGapAvg:](self, "setGapAvg:", v6);
      }
    }
    -[UIKBCadenceMonitor typingAvg](self, "typingAvg");
    *(float *)&v11 = (float)(v10 + v7) * 0.5;
    -[UIKBCadenceMonitor setTypingAvg:](self, "setTypingAvg:", v11);
    -[UIKBCadenceMonitor gapAvg](self, "gapAvg");
    -[UIKBCadenceMonitor setGapAvg:](self, "setGapAvg:", (v6 + v12) * 0.5);
  }
  -[UIKBCadenceMonitor typingAvg](self, "typingAvg");
  -[UIKBCadenceMonitor setCadence:](self, "setCadence:");
  -[UIKBCadenceMonitor updateConfidenceWithGap:](self, "updateConfidenceWithGap:", v6);
  -[UIKBCadenceMonitor touchLogTimer](self, "touchLogTimer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[UIKBCadenceMonitor gapAvg](self, "gapAvg");
    v15 = v14 * 1.5;
    -[UIKBCadenceMonitor touchLogTimer](self, "touchLogTimer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 <= v15)
    {
      v18 = 1.0;
    }
    else
    {
      -[UIKBCadenceMonitor gapAvg](self, "gapAvg");
      v18 = v17 * 1.5;
    }
    objc_msgSend(v16, "touchWithDelay:", v18);
  }
  else
  {
    v19 = [UIDelayedAction alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[UIDelayedAction initWithTarget:action:userInfo:delay:mode:](v19, "initWithTarget:action:userInfo:delay:mode:", self, sel_logUserTyping_, v16, *MEMORY[0x1E0C99748], 3.0);
    -[UIKBCadenceMonitor setTouchLogTimer:](self, "setTouchLogTimer:", v20);

  }
  -[UIKBCadenceMonitor setIsUserTyping:](self, "setIsUserTyping:", v13 != 0);
  -[UIKBCadenceMonitor setPrevTouchDown:](self, "setPrevTouchDown:", a3);
  -[UIKBCadenceMonitor setTouchCount:](self, "setTouchCount:", -[UIKBCadenceMonitor touchCount](self, "touchCount") + 1);
}

- (void)logUserTyping:(id)a3
{
  void *v4;

  -[UIKBCadenceMonitor setIsUserTyping:](self, "setIsUserTyping:", objc_msgSend(a3, "BOOLValue"));
  -[UIKBCadenceMonitor touchLogTimer](self, "touchLogTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  -[UIKBCadenceMonitor setTouchLogTimer:](self, "setTouchLogTimer:", 0);
}

- (void)addTypingTouchTime:(double)a3
{
  double v5;

  -[UIKBCadenceMonitor prevTouchDown](self, "prevTouchDown");
  if (v5 <= a3)
    -[UIKBCadenceMonitor typingCadence:](self, "typingCadence:", a3);
}

- (void)reset
{
  double v3;
  double v4;
  double v5;

  -[UIKBCadenceMonitor setIsUserTyping:](self, "setIsUserTyping:", 0);
  LODWORD(v3) = 0;
  -[UIKBCadenceMonitor setCadence:](self, "setCadence:", v3);
  LODWORD(v4) = 0;
  -[UIKBCadenceMonitor setConfidence:](self, "setConfidence:", v4);
  LODWORD(v5) = 0;
  -[UIKBCadenceMonitor setTypingAvg:](self, "setTypingAvg:", v5);
  -[UIKBCadenceMonitor setGapAvg:](self, "setGapAvg:", 0.0);
  -[UIKBCadenceMonitor setPrevTouchDown:](self, "setPrevTouchDown:", 0.0);
  -[UIKBCadenceMonitor setTouchCount:](self, "setTouchCount:", 0);
}

- (UIKBCadenceMonitor)init
{
  UIKBCadenceMonitor *v2;
  UIKBCadenceMonitor *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIKBCadenceMonitor;
  v2 = -[UIKBCadenceMonitor init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[UIKBCadenceMonitor reset](v2, "reset");
  return v3;
}

- (BOOL)isUserTyping
{
  return self->_isUserTyping;
}

- (void)setIsUserTyping:(BOOL)a3
{
  self->_isUserTyping = a3;
}

- (float)cadence
{
  return self->_cadence;
}

- (void)setCadence:(float)a3
{
  self->_cadence = a3;
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (float)typingAvg
{
  return self->_typingAvg;
}

- (void)setTypingAvg:(float)a3
{
  self->_typingAvg = a3;
}

- (double)gapAvg
{
  return self->_gapAvg;
}

- (void)setGapAvg:(double)a3
{
  self->_gapAvg = a3;
}

- (double)prevTouchDown
{
  return self->_prevTouchDown;
}

- (void)setPrevTouchDown:(double)a3
{
  self->_prevTouchDown = a3;
}

- (int)touchCount
{
  return self->_touchCount;
}

- (void)setTouchCount:(int)a3
{
  self->_touchCount = a3;
}

- (UIDelayedAction)touchLogTimer
{
  return self->_touchLogTimer;
}

- (void)setTouchLogTimer:(id)a3
{
  objc_storeStrong((id *)&self->_touchLogTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchLogTimer, 0);
}

@end
