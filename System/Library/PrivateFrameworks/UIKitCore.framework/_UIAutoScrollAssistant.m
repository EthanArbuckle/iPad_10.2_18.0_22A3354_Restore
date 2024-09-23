@implementation _UIAutoScrollAssistant

- (UIEdgeInsets)touchInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_touchInsets.top;
  left = self->_touchInsets.left;
  bottom = self->_touchInsets.bottom;
  right = self->_touchInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTouchInsets:(UIEdgeInsets)a3
{
  self->_touchInsets = a3;
}

- (void)setAllowedDirections:(unint64_t)a3
{
  self->_allowedDirections = a3;
}

- (_UIAutoScrollAssistant)initWithScrollView:(id)a3
{
  id v4;
  _UIAutoScrollAssistant *v5;
  _UIAutoScrollAssistant *v6;
  uint64_t v7;
  _UIAutoScrollBehavior *behavior;
  id WeakRetained;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  uint64_t v13;
  double v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_UIAutoScrollAssistant;
  v5 = -[_UIAutoScrollAssistant init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scrollView, v4);
    v7 = objc_opt_new();
    behavior = v6->_behavior;
    v6->_behavior = (_UIAutoScrollBehavior *)v7;

    v6->_allowedDirections = 30;
    WeakRetained = objc_loadWeakRetained((id *)&v6->_scrollView);
    objc_msgSend(WeakRetained, "contentOffset");
    v6->_referenceContentOffsetForPoint.x = v10;
    v6->_referenceContentOffsetForPoint.y = v11;

    objc_msgSend(v4, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userInterfaceIdiom");
    if (v13 == 6 || v13 == 1)
      v15 = -50.0;
    else
      v15 = -25.0;

    v6->_touchInsets.top = -50.0;
    v6->_touchInsets.left = v15;
    v6->_touchInsets.bottom = -50.0;
    v6->_touchInsets.right = v15;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_destroyWeak((id *)&self->_scrollView);
}

- (void)autoScrollFromPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  id WeakRetained;
  double v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  CAFrameRateRange v19;

  y = a3.y;
  x = a3.x;
  -[_UIAutoScrollAssistant point](self, "point");
  v7 = v6;
  v9 = v8;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  objc_msgSend(WeakRetained, "contentOffset");
  -[_UIAutoScrollAssistant setPoint:forContentOffset:](self, "setPoint:forContentOffset:", x, y, v11, v12);

  if (!self->_displayLink)
  {
    v13 = objc_loadWeakRetained((id *)&self->_scrollView);
    objc_msgSend(v13, "_screen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "displayLinkWithTarget:selector:", self, sel_displayLinkFired_);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v15, "setPreferredFrameRateRange:", *(double *)&v19.minimum, *(double *)&v19.maximum, *(double *)&v19.preferred);
    objc_msgSend(v15, "setHighFrameRateReason:", 1048631);
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addToRunLoop:forMode:", v16, *MEMORY[0x1E0C99860]);

    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addToRunLoop:forMode:", v17, CFSTR("UITrackingRunLoopMode"));

    -[_UIAutoScrollAssistant setDisplayLink:](self, "setDisplayLink:", v15);
    _UIQOSManagedCommitsBegin(self, CFSTR("AutoScroll"));

  }
  v18 = sqrt((x - v7) * (x - v7) + (y - v9) * (y - v9));
  if (-[_UIAutoScrollAssistant started](self, "started") && v18 > 40.0)
  {
    -[_UIAutoScrollAssistant setStarted:](self, "setStarted:", 0);
  }
  else if (!-[_UIAutoScrollAssistant started](self, "started") && v18 > 20.0)
  {
    -[_UIAutoScrollAssistant setLastTimestamp:](self, "setLastTimestamp:", CACurrentMediaTime());
  }
}

- (void)stop
{
  void *v3;

  -[_UIAutoScrollAssistant displayLink](self, "displayLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[_UIAutoScrollAssistant setDisplayLink:](self, "setDisplayLink:", 0);
  -[_UIAutoScrollAssistant setStarted:](self, "setStarted:", 0);
  _UIQOSManagedCommitsEnd(self, CFSTR("AutoScroll"));
}

- (BOOL)isActive
{
  void *v2;
  BOOL v3;

  -[_UIAutoScrollAssistant displayLink](self, "displayLink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)_scrollContinuous
{
  int64_t v3;
  void *v4;
  int v5;

  v3 = -[_UIAutoScrollAssistant mode](self, "mode");
  if (v3 == 2)
  {
    LOBYTE(v5) = 0;
  }
  else if (v3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    -[_UIAutoScrollAssistant scrollView](self, "scrollView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isPagingEnabled") ^ 1;

  }
  return v5;
}

- (void)displayLinkFired:(id)a3
{
  id v4;
  _BOOL4 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;

  v4 = a3;
  v5 = -[_UIAutoScrollAssistant _scrollContinuous](self, "_scrollContinuous");
  -[_UIAutoScrollAssistant lastTimestamp](self, "lastTimestamp");
  v7 = v6 + 0.75;
  objc_msgSend(v4, "timestamp");
  v9 = v8;
  objc_msgSend(v4, "timestamp");
  v11 = v10;
  -[_UIAutoScrollAssistant lastTimestamp](self, "lastTimestamp");
  v13 = v11 - v12;
  if (-[_UIAutoScrollAssistant started](self, "started") || v7 >= v9)
  {
    if (v7 >= v9 && (!v5 || !-[_UIAutoScrollAssistant started](self, "started")))
      goto LABEL_11;
  }
  else
  {
    -[_UIAutoScrollAssistant setStarted:](self, "setStarted:", 1);
    if (v5)
    {
      objc_msgSend(v4, "duration");
      v13 = v14;
    }
  }
  -[_UIAutoScrollAssistant behavior](self, "behavior");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
    objc_msgSend(v15, "offsetForAutoScroller:timeDelta:", self, v13);

  -[_UIAutoScrollAssistant _handleAutoScrollerWithContentOffset:direction:](self, "_handleAutoScrollerWithContentOffset:direction:", 0, 0.0, 0.0);
  objc_msgSend(v4, "timestamp");
  -[_UIAutoScrollAssistant setLastTimestamp:](self, "setLastTimestamp:");
LABEL_11:
  -[_UIAutoScrollAssistant lastTimestamp](self, "lastTimestamp");
  if (v17 == 0.0)
  {
    objc_msgSend(v4, "timestamp");
    -[_UIAutoScrollAssistant setLastTimestamp:](self, "setLastTimestamp:");
  }

}

- (void)_handleAutoScrollerWithContentOffset:(CGPoint)a3 direction:(unint64_t)a4
{
  double y;
  double x;
  id v6;

  if (a4 == 1)
  {
    -[_UIAutoScrollAssistant setStarted:](self, "setStarted:", 0, a3.x, a3.y);
  }
  else
  {
    y = a3.y;
    x = a3.x;
    -[_UIAutoScrollAssistant scrollView](self, "scrollView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_autoScrollAssistantUpdateContentOffset:", x, y);

  }
}

- (void)_adjustPointToCurrentContentOffset
{
  id WeakRetained;
  double v4;
  double v5;
  double v6;
  double v7;
  double x;
  double y;
  CGFloat v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  objc_msgSend(WeakRetained, "contentOffset");
  v5 = v4;
  v7 = v6;

  x = self->_referenceContentOffsetForPoint.x;
  y = self->_referenceContentOffsetForPoint.y;
  if (x != v5 || y != v7)
  {
    v11 = v7 - y + self->_point.y;
    self->_point.x = v5 - x + self->_point.x;
    self->_point.y = v11;
    self->_referenceContentOffsetForPoint.x = v5;
    self->_referenceContentOffsetForPoint.y = v7;
  }
}

- (void)setPoint:(CGPoint)a3 forContentOffset:(CGPoint)a4
{
  self->_point = a3;
  self->_referenceContentOffsetForPoint = a4;
}

- (CGPoint)point
{
  double x;
  double y;
  CGPoint result;

  -[_UIAutoScrollAssistant _adjustPointToCurrentContentOffset](self, "_adjustPointToCurrentContentOffset");
  x = self->_point.x;
  y = self->_point.y;
  result.y = y;
  result.x = x;
  return result;
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_scrollView);
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (unint64_t)allowedDirections
{
  return self->_allowedDirections;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (CGPoint)referenceContentOffsetForPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_referenceContentOffsetForPoint.x;
  y = self->_referenceContentOffsetForPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setReferenceContentOffsetForPoint:(CGPoint)a3
{
  self->_referenceContentOffsetForPoint = a3;
}

- (double)lastTimestamp
{
  return self->_lastTimestamp;
}

- (void)setLastTimestamp:(double)a3
{
  self->_lastTimestamp = a3;
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (_UIAutoScrollBehavior)behavior
{
  return self->_behavior;
}

- (void)setBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_behavior, a3);
}

@end
