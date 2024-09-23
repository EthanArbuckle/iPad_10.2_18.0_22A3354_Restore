@implementation TraceSliderView

- (TraceSliderView)initWithFrame:(CGRect)a3
{
  TraceSliderView *v3;
  TraceSliderView *v4;
  SliderLargerHitArea *v5;
  UISlider *playbackSlider;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;
  _QWORD v22[4];

  v21.receiver = self;
  v21.super_class = (Class)TraceSliderView;
  v3 = -[TraceSliderView initWithFrame:](&v21, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_playSpeed = 1.0;
    v5 = -[SliderLargerHitArea initWithFrame:]([SliderLargerHitArea alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    playbackSlider = v4->_playbackSlider;
    v4->_playbackSlider = &v5->super;

    -[UISlider setContinuous:](v4->_playbackSlider, "setContinuous:", 0);
    -[UISlider setTranslatesAutoresizingMaskIntoConstraints:](v4->_playbackSlider, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TraceSliderView addSubview:](v4, "addSubview:", v4->_playbackSlider);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UISlider leadingAnchor](v4->_playbackSlider, "leadingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TraceSliderView leadingAnchor](v4, "leadingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v19, 10.0));
    v22[0] = v18;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TraceSliderView trailingAnchor](v4, "trailingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UISlider trailingAnchor](v4->_playbackSlider, "trailingAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v16, 10.0));
    v22[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UISlider topAnchor](v4->_playbackSlider, "topAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TraceSliderView topAnchor](v4, "topAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, 5.0));
    v22[2] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TraceSliderView bottomAnchor](v4, "bottomAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UISlider bottomAnchor](v4->_playbackSlider, "bottomAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 5.0));
    v22[3] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 4));
    -[TraceSliderView addConstraints:](v4, "addConstraints:", v14);

    -[UISlider addTarget:action:forControlEvents:](v4->_playbackSlider, "addTarget:action:forControlEvents:", v4, "editingDidBegin:", 1);
    -[UISlider addTarget:action:forControlEvents:](v4->_playbackSlider, "addTarget:action:forControlEvents:", v4, "editingChanged:", 4096);
    -[UISlider addTarget:action:forControlEvents:](v4->_playbackSlider, "addTarget:action:forControlEvents:", v4, "editingWasCancelled:", 256);
    -[UISlider addTarget:action:forControlEvents:](v4->_playbackSlider, "addTarget:action:forControlEvents:", v4, "editingDidEnd:", 64);
    -[UISlider addTarget:action:forControlEvents:](v4->_playbackSlider, "addTarget:action:forControlEvents:", v4, "editingDidEnd:", 128);
  }
  return v4;
}

- (void)setPlaySpeed:(double)a3
{
  if (self->_playSpeed != a3)
  {
    self->_playSpeed = a3;
    -[NSTimer fire](self->_sliderThrottleTimer, "fire");
  }
}

- (void)setTraceLength:(double)a3
{
  double traceLength;
  double v6;

  traceLength = self->_traceLength;
  if (traceLength != a3)
  {
    self->_traceLength = a3;
    LODWORD(traceLength) = 0;
    -[UISlider setMinimumValue:](self->_playbackSlider, "setMinimumValue:", traceLength);
    *(float *)&v6 = a3;
    -[UISlider setMaximumValue:](self->_playbackSlider, "setMaximumValue:", v6);
  }
}

- (void)setTraceTime:(double)a3
{
  -[TraceSliderView setTraceTime:animated:](self, "setTraceTime:animated:", 0, a3);
}

- (void)setTraceTime:(double)a3 animated:(BOOL)a4
{
  if (self->_traceTime != a3)
  {
    self->_traceTime = a3;
    *(float *)&a3 = a3;
    -[TraceSliderView _updateSliderValue:animated:](self, "_updateSliderValue:animated:", a4, a3);
  }
}

- (void)_updateSliderValue:(float)a3 animated:(BOOL)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  NSTimer *v9;
  NSTimer *sliderThrottleTimer;

  if (!self->_sliderEditing)
  {
    if (self->_sliderThrottleTimer)
    {
      self->_animateNextSliderUpdate = a4;
    }
    else
    {
      -[UISlider setValue:animated:](self->_playbackSlider, "setValue:animated:", a4);
      -[TraceSliderView playSpeed](self, "playSpeed");
      v6 = 1.0 / v5;
      v7 = 0.0666666667;
      if (v6 >= 0.0666666667)
      {
        -[TraceSliderView playSpeed](self, "playSpeed");
        v7 = 1.0 / v8;
      }
      v9 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_throttledSliderUpdate:", 0, 0, v7));
      sliderThrottleTimer = self->_sliderThrottleTimer;
      self->_sliderThrottleTimer = v9;

    }
  }
}

- (void)_throttledSliderUpdate:(id)a3
{
  NSTimer *sliderThrottleTimer;
  double traceTime;

  -[NSTimer invalidate](self->_sliderThrottleTimer, "invalidate", a3);
  sliderThrottleTimer = self->_sliderThrottleTimer;
  self->_sliderThrottleTimer = 0;

  if (!self->_sliderEditing)
  {
    traceTime = self->_traceTime;
    *(float *)&traceTime = traceTime;
    -[UISlider setValue:animated:](self->_playbackSlider, "setValue:animated:", self->_animateNextSliderUpdate, traceTime);
  }
}

- (void)setStale:(BOOL)a3
{
  id v4;

  if (self->_stale != a3)
  {
    self->_stale = a3;
    if (a3)
    {
      v4 = (id)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
      -[UISlider setThumbTintColor:](self->_playbackSlider, "setThumbTintColor:", v4);

    }
    else
    {
      -[UISlider setThumbTintColor:](self->_playbackSlider, "setThumbTintColor:", 0);
    }
  }
}

- (void)editingDidBegin:(id)a3
{
  NSTimer *sliderThrottleTimer;
  id WeakRetained;

  self->_sliderEditing = 1;
  -[NSTimer invalidate](self->_sliderThrottleTimer, "invalidate", a3);
  sliderThrottleTimer = self->_sliderThrottleTimer;
  self->_sliderThrottleTimer = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "traceSliderViewEditingDidBegin:", self);

}

- (void)editingChanged:(id)a3
{
  float v4;
  id WeakRetained;

  objc_msgSend(a3, "value");
  self->_traceTime = v4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "traceSliderView:editingEndedAtTime:", self, self->_traceTime);

}

- (void)editingWasCancelled:(id)a3
{
  id WeakRetained;

  self->_sliderEditing = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "traceSliderViewCancelledEditing:", self);

}

- (void)editingDidEnd:(id)a3
{
  self->_sliderEditing = 0;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  UISlider *playbackSlider;
  BOOL v9;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  playbackSlider = self->_playbackSlider;
  -[UISlider convertPoint:fromView:](playbackSlider, "convertPoint:fromView:", self, x, y);
  if ((-[UISlider pointInside:withEvent:](playbackSlider, "pointInside:withEvent:", v7) & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)TraceSliderView;
    v9 = -[TraceSliderView pointInside:withEvent:](&v11, "pointInside:withEvent:", v7, x, y);
  }

  return v9;
}

- (TraceSliderViewDelegate)delegate
{
  return (TraceSliderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)traceLength
{
  return self->_traceLength;
}

- (double)traceTime
{
  return self->_traceTime;
}

- (BOOL)isStale
{
  return self->_stale;
}

- (BOOL)isSliderEditing
{
  return self->_sliderEditing;
}

- (double)playSpeed
{
  return self->_playSpeed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sliderThrottleTimer, 0);
  objc_storeStrong((id *)&self->_playbackSlider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
