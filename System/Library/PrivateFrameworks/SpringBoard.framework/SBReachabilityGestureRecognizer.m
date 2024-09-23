@implementation SBReachabilityGestureRecognizer

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  UITouch *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  BOOL everTranslatedUpwards;
  uint64_t v40;
  double y;
  double x;
  _QWORD v43[10];
  BOOL v44;
  BOOL v45;
  int v46;
  __int16 v47;
  objc_super v48;
  CGRect v49;

  v6 = a3;
  v7 = a4;
  v48.receiver = self;
  v48.super_class = (Class)SBReachabilityGestureRecognizer;
  -[SBReachabilityGestureRecognizer touchesEnded:withEvent:](&v48, sel_touchesEnded_withEvent_, v6, v7);
  objc_msgSend(v6, "anyObject");
  v8 = (UITouch *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") <= 1 && v8 == self->_activeTouch)
  {
    -[SBReachabilityGestureRecognizer view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITouch locationInView:](v8, "locationInView:", v9);
    v11 = v10;
    v13 = v12;
    y = self->_initialTouchLocation.y;
    x = self->_initialTouchLocation.x;
    objc_msgSend(v6, "anyObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "coalescedTouchesForTouch:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    _SBUpdateTouchHistoryWithCoalescedTouches(self->_touchHistory, v15, self, v9, 0);
    -[SBTouchHistory averageTouchVelocityOverTimeDuration:](self->_touchHistory, "averageTouchVelocityOverTimeDuration:", 0.0416666667);
    v17 = v16;
    v19 = v18;
    objc_msgSend(v9, "bounds");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    objc_msgSend(v9, "safeAreaInsets");
    v29 = v23 + v28;
    v32 = v25 - (v30 + v31);
    v49.size.height = v27 - (v28 + v33);
    v49.origin.x = v21 + v30;
    v49.origin.y = v29;
    v49.size.width = v32;
    v34 = CGRectContainsPoint(v49, self->_initialTouchLocation);
    objc_msgSend(v9, "bounds");
    if (!self->_movedPastHysteresis)
      goto LABEL_8;
    everTranslatedUpwards = self->_everTranslatedUpwards;
    *(double *)v43 = v11;
    *(double *)&v43[1] = v13;
    *(double *)&v43[2] = v11 - x;
    *(double *)&v43[3] = v13 - y;
    v43[4] = v17;
    v43[5] = v19;
    v43[6] = v35;
    v43[7] = v36;
    v43[8] = v37;
    v43[9] = v38;
    v44 = v34;
    v45 = everTranslatedUpwards;
    v46 = 0;
    v47 = 0;
    if (SBReachabilityGestureShouldActivate((uint64_t)v43))
    {
      -[SBReachabilityGestureRecognizer setState:](self, "setState:", 1);
      v40 = 3;
    }
    else
    {
LABEL_8:
      v40 = 5;
    }
    -[SBReachabilityGestureRecognizer setState:](self, "setState:", v40);

  }
  else
  {
    -[SBReachabilityGestureRecognizer setState:](self, "setState:", 5);
  }

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SBReachabilityGestureRecognizer;
  -[SBReachabilityGestureRecognizer touchesBegan:withEvent:](&v19, sel_touchesBegan_withEvent_, v6, v7);
  objc_msgSend(v6, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBReachabilityGestureRecognizer view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locationInView:", v9);
  v11 = v10;
  v13 = v12;
  if ((unint64_t)objc_msgSend(v6, "count") < 2
    && (objc_msgSend(v9, "bounds"),
        v15 = v14,
        -[SBReachabilitySettings systemWideSwipeDownHeight](self->_settings, "systemWideSwipeDownHeight"),
        v13 >= v15 - v16))
  {
    objc_msgSend(v6, "anyObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "coalescedTouchesForTouch:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    _SBUpdateTouchHistoryWithCoalescedTouches(self->_touchHistory, v18, self, v9, 0);
    objc_storeStrong((id *)&self->_activeTouch, v8);
    self->_initialTouchLocation.x = v11;
    self->_initialTouchLocation.y = v13;
    self->_everTranslatedUpwards = v13 - v13 < -10.0;

  }
  else
  {
    -[SBReachabilityGestureRecognizer setState:](self, "setState:", 5);
  }

}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBReachabilityGestureRecognizer;
  -[SBReachabilityGestureRecognizer reset](&v3, sel_reset);
  self->_everTranslatedUpwards = 0;
  self->_movedPastHysteresis = 0;
  -[SBTouchHistory reset](self->_touchHistory, "reset");
}

- (SBReachabilityGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  SBReachabilityGestureRecognizer *v4;
  SBReachabilityGestureRecognizer *v5;
  SBTouchHistory *v6;
  SBTouchHistory *touchHistory;
  uint64_t v8;
  SBReachabilitySettings *settings;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBReachabilityGestureRecognizer;
  v4 = -[SBReachabilityGestureRecognizer initWithTarget:action:](&v11, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[SBReachabilityGestureRecognizer _setRequiresSystemGesturesToFail:](v4, "_setRequiresSystemGesturesToFail:", 0);
    -[SBReachabilityGestureRecognizer setDelaysTouchesBegan:](v5, "setDelaysTouchesBegan:", 1);
    -[SBReachabilityGestureRecognizer setCancelsTouchesInView:](v5, "setCancelsTouchesInView:", 1);
    v6 = objc_alloc_init(SBTouchHistory);
    touchHistory = v5->_touchHistory;
    v5->_touchHistory = v6;

    +[SBReachabilityDomain rootSettings](SBReachabilityDomain, "rootSettings");
    v8 = objc_claimAutoreleasedReturnValue();
    settings = v5->_settings;
    v5->_settings = (SBReachabilitySettings *)v8;

  }
  return v5;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  UITouch *v8;
  void *v9;
  double v10;
  double v11;
  double x;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SBReachabilityGestureRecognizer;
  -[SBReachabilityGestureRecognizer touchesMoved:withEvent:](&v19, sel_touchesMoved_withEvent_, v6, v7);
  objc_msgSend(v6, "anyObject");
  v8 = (UITouch *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") <= 1 && v8 == self->_activeTouch)
  {
    -[SBReachabilityGestureRecognizer view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITouch locationInView:](v8, "locationInView:", v9);
    v11 = v10;
    x = self->_initialTouchLocation.x;
    v14 = v13 - self->_initialTouchLocation.y;
    objc_msgSend(v6, "anyObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "coalescedTouchesForTouch:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    _SBUpdateTouchHistoryWithCoalescedTouches(self->_touchHistory, v16, self, v9, 0);
    if (!self->_everTranslatedUpwards)
      self->_everTranslatedUpwards = v14 < -10.0;
    if (!self->_movedPastHysteresis)
    {
      v17 = fabs(v14);
      if (fabs(v11 - x) > 10.0 || v17 > 10.0)
        self->_movedPastHysteresis = 1;
    }

  }
  else
  {
    -[SBReachabilityGestureRecognizer setState:](self, "setState:", 5);
  }

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBReachabilityGestureRecognizer;
  -[SBReachabilityGestureRecognizer touchesCancelled:withEvent:](&v5, sel_touchesCancelled_withEvent_, a3, a4);
  -[SBReachabilityGestureRecognizer setState:](self, "setState:", 4);
}

- (SBTouchHistory)touchHistory
{
  return self->_touchHistory;
}

- (void)setTouchHistory:(id)a3
{
  objc_storeStrong((id *)&self->_touchHistory, a3);
}

- (UITouch)activeTouch
{
  return self->_activeTouch;
}

- (void)setActiveTouch:(id)a3
{
  objc_storeStrong((id *)&self->_activeTouch, a3);
}

- (CGPoint)initialTouchLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialTouchLocation.x;
  y = self->_initialTouchLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialTouchLocation:(CGPoint)a3
{
  self->_initialTouchLocation = a3;
}

- (BOOL)everTranslatedUpwards
{
  return self->_everTranslatedUpwards;
}

- (void)setEverTranslatedUpwards:(BOOL)a3
{
  self->_everTranslatedUpwards = a3;
}

- (BOOL)movedPastHysteresis
{
  return self->_movedPastHysteresis;
}

- (void)setMovedPastHysteresis:(BOOL)a3
{
  self->_movedPastHysteresis = a3;
}

- (SBReachabilitySettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_storeStrong((id *)&self->_settings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_activeTouch, 0);
  objc_storeStrong((id *)&self->_touchHistory, 0);
}

@end
