@implementation TVRStandardTouchProcessor

- (void)setTouchpadView:(id)a3
{
  id v4;
  void *v5;
  UITapGestureRecognizer *tapGestureRecognizer;
  UITapGestureRecognizer *v7;
  UITapGestureRecognizer *v8;
  objc_super v9;

  v4 = a3;
  -[TVRTouchProcessor touchpadView](self, "touchpadView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeGestureRecognizer:", self->_tapGestureRecognizer);

  v9.receiver = self;
  v9.super_class = (Class)TVRStandardTouchProcessor;
  -[TVRTouchProcessor setTouchpadView:](&v9, sel_setTouchpadView_, v4);
  if (v4)
  {
    tapGestureRecognizer = self->_tapGestureRecognizer;
    if (!tapGestureRecognizer)
    {
      v7 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel__tap_);
      v8 = self->_tapGestureRecognizer;
      self->_tapGestureRecognizer = v7;

      -[UITapGestureRecognizer setCancelsTouchesInView:](self->_tapGestureRecognizer, "setCancelsTouchesInView:", 0);
      -[UITapGestureRecognizer setDelaysTouchesBegan:](self->_tapGestureRecognizer, "setDelaysTouchesBegan:", 0);
      -[UITapGestureRecognizer setDelaysTouchesEnded:](self->_tapGestureRecognizer, "setDelaysTouchesEnded:", 0);
      tapGestureRecognizer = self->_tapGestureRecognizer;
    }
    objc_msgSend(v4, "addGestureRecognizer:", tapGestureRecognizer);
  }

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  NSTimer *clickVirtualizerTimer;
  id v7;
  id v8;
  void *v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  NSTimer *v13;
  NSTimer *v14;
  objc_super v15;

  clickVirtualizerTimer = self->_clickVirtualizerTimer;
  v7 = a4;
  v8 = a3;
  -[NSTimer invalidate](clickVirtualizerTimer, "invalidate");
  objc_msgSend(v8, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  self->_clickVirtualizerState = 1;
  -[TVRTouchProcessor touchpadView](self, "touchpadView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preciseLocationInView:", v10);
  self->_touchBeganLocation.x = v11;
  self->_touchBeganLocation.y = v12;

  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__touchpadClickVirtualizerTimerFired_, 0, 0, 0.25);
  v13 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  v14 = self->_clickVirtualizerTimer;
  self->_clickVirtualizerTimer = v13;

  v15.receiver = self;
  v15.super_class = (Class)TVRStandardTouchProcessor;
  -[TVRTouchProcessor touchesBegan:withEvent:](&v15, sel_touchesBegan_withEvent_, v8, v7);

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRTouchProcessor touchpadView](self, "touchpadView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preciseLocationInView:", v9);
  v12 = hypot(v10 - self->_touchBeganLocation.x, v11 - self->_touchBeganLocation.y);
  if (_TVRCGetTouchToSelectTravelDistance_onceToken != -1)
    dispatch_once(&_TVRCGetTouchToSelectTravelDistance_onceToken, &__block_literal_global_280);
  if ((__hasCachedTouchToSelectTravelDistance & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("TouchToSelectTravelDistance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      objc_msgSend(v14, "doubleValue");
    else
      v15 = 10.0;
    __cachedTouchToSelectTravelDistance = *(_QWORD *)&v15;
    __hasCachedTouchToSelectTravelDistance = 1;

  }
  if (self->_clickVirtualizerState == 1 && v12 > *(double *)&__cachedTouchToSelectTravelDistance)
    self->_clickVirtualizerState = 0;
  v17.receiver = self;
  v17.super_class = (Class)TVRStandardTouchProcessor;
  -[TVRTouchProcessor touchesMoved:withEvent:](&v17, sel_touchesMoved_withEvent_, v6, v7);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  int64_t clickVirtualizerState;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  -[NSTimer invalidate](self->_clickVirtualizerTimer, "invalidate");
  objc_msgSend(v6, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRTouchProcessor touchpadView](self, "touchpadView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preciseLocationInView:", v9);
  v12 = hypot(v10 - self->_touchBeganLocation.x, v11 - self->_touchBeganLocation.y);
  if (_TVRCGetTouchToSelectTravelDistance_onceToken != -1)
    dispatch_once(&_TVRCGetTouchToSelectTravelDistance_onceToken, &__block_literal_global_280);
  if ((__hasCachedTouchToSelectTravelDistance & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("TouchToSelectTravelDistance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      objc_msgSend(v14, "doubleValue");
    else
      v15 = 10.0;
    __cachedTouchToSelectTravelDistance = *(_QWORD *)&v15;
    __hasCachedTouchToSelectTravelDistance = 1;

  }
  clickVirtualizerState = self->_clickVirtualizerState;
  if (clickVirtualizerState == 1)
  {
    if (v12 <= *(double *)&__cachedTouchToSelectTravelDistance)
    {
      self->_clickVirtualizerState = 0;
      -[TVRTouchProcessor sendPressBegan:](self, "sendPressBegan:", 1);
      goto LABEL_13;
    }
  }
  else if (clickVirtualizerState == 2)
  {
    self->_clickVirtualizerState = 0;
LABEL_13:
    -[TVRTouchProcessor sendPressEnded:](self, "sendPressEnded:", 1);
  }
  v17.receiver = self;
  v17.super_class = (Class)TVRStandardTouchProcessor;
  -[TVRTouchProcessor touchesEnded:withEvent:](&v17, sel_touchesEnded_withEvent_, v6, v7);

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  NSTimer *clickVirtualizerTimer;
  id v7;
  id v8;
  objc_super v9;

  clickVirtualizerTimer = self->_clickVirtualizerTimer;
  v7 = a4;
  v8 = a3;
  -[NSTimer invalidate](clickVirtualizerTimer, "invalidate");
  v9.receiver = self;
  v9.super_class = (Class)TVRStandardTouchProcessor;
  -[TVRTouchProcessor touchesCancelled:withEvent:](&v9, sel_touchesCancelled_withEvent_, v8, v7);

}

- (void)_touchpadClickVirtualizerTimerFired:(id)a3
{
  if (self->_clickVirtualizerState == 1)
  {
    self->_clickVirtualizerState = 2;
    -[TVRTouchProcessor sendPressBegan:](self, "sendPressBegan:", 1);
  }
}

- (void)_tap:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
    -[TVRTouchProcessor markCurrentTouchToBeCancelled](self, "markCurrentTouchToBeCancelled");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clickVirtualizerTimer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
}

@end
