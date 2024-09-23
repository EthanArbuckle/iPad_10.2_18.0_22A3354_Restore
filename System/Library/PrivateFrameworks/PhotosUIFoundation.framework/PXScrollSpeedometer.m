@implementation PXScrollSpeedometer

- (PXScrollSpeedometer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXScrollSpeedometer;
  return -[PXObservable init](&v3, sel_init);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  const __CFString *v7;
  void *v8;
  objc_super v10;
  CGPoint v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v10.receiver = self;
  v10.super_class = (Class)PXScrollSpeedometer;
  -[PXScrollSpeedometer description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXScrollSpeedometer scrollVelocity](self, "scrollVelocity");
  NSStringFromCGPoint(v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXScrollSpeedometer regime](self, "regime");
  if ((unint64_t)(v6 + 1) > 4)
    v7 = CFSTR("???");
  else
    v7 = off_2514CF2C0[v6 + 1];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ scrollVelocity:%@ regime:%@>"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)didPerformChanges
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXScrollSpeedometer;
  -[PXObservable didPerformChanges](&v3, sel_didPerformChanges);
  -[PXScrollSpeedometer _updateScrollRegime](self, "_updateScrollRegime");
}

- (void)_updateScrollRegime
{
  double v4;
  long double v5;
  double v6;
  long double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int64_t v13;
  _BOOL4 v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _BOOL4 v24;
  double v25;
  _BOOL4 v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _BOOL4 v32;
  void *v33;

  -[PXScrollSpeedometer scrollVelocity](self, "scrollVelocity");
  v5 = v4;
  v7 = v6;
  -[PXScrollSpeedometer scrollAcceleration](self, "scrollAcceleration");
  v9 = v8;
  v11 = v10;
  v12 = hypot(v5, v7);
  if (v12 == 0.0 && !-[PXScrollSpeedometer isScrubbing](self, "isScrubbing"))
  {
    v13 = 0;
  }
  else
  {
    v13 = -[PXScrollSpeedometer regime](self, "regime");
    v14 = -[PXScrollSpeedometer isAnimatingScroll](self, "isAnimatingScroll");
    v15 = 0.0;
    v16 = 0.0;
    switch(v13)
    {
      case -1:
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXScrollSpeedometer.m"), 89, CFSTR("undefined regime"));

        break;
      case 0:
      case 1:
        -[PXScrollSpeedometer mediumUpperThreshold](self, "mediumUpperThreshold");
        goto LABEL_8;
      case 2:
        -[PXScrollSpeedometer mediumLowerThreshold](self, "mediumLowerThreshold");
LABEL_8:
        v16 = v17;
        -[PXScrollSpeedometer fastUpperThreshold](self, "fastUpperThreshold");
        goto LABEL_10;
      case 3:
        -[PXScrollSpeedometer mediumLowerThreshold](self, "mediumLowerThreshold");
        v16 = v20;
        -[PXScrollSpeedometer fastLowerThreshold](self, "fastLowerThreshold");
LABEL_10:
        v15 = v19;
        break;
      default:
        break;
    }
    v21 = -1.0;
    if (v5 >= 0.0)
      v22 = 0.0;
    else
      v22 = -1.0;
    if (v5 > 0.0)
      v22 = 1.0;
    if (v9 >= 0.0)
      v23 = 0.0;
    else
      v23 = -1.0;
    if (v9 > 0.0)
      v23 = 1.0;
    v24 = v22 == v23;
    if (v9 == 0.0)
      v24 = 0;
    if (v7 >= 0.0)
      v25 = 0.0;
    else
      v25 = -1.0;
    if (v7 > 0.0)
      v25 = 1.0;
    if (v11 >= 0.0)
      v21 = 0.0;
    if (v11 > 0.0)
      v21 = 1.0;
    v26 = v25 == v21;
    if (v11 == 0.0)
      v26 = 0;
    v27 = v24 || v26;
    if (v14
      && (v24 || v26)
      && !-[PXScrollSpeedometer hasRampedUpForCurrentAnimatedScroll](self, "hasRampedUpForCurrentAnimatedScroll"))
    {
      -[PXScrollSpeedometer setHasRampedUpForCurrentAnimatedScroll:](self, "setHasRampedUpForCurrentAnimatedScroll:", 1);
      v15 = 0.0;
    }
    v28 = 2;
    if (v12 <= v16)
      v28 = 1;
    if (v12 <= v15)
      v29 = v28;
    else
      v29 = 3;
    if (v13)
    {
      if (v29 == -[PXScrollSpeedometer _nextRegime](self, "_nextRegime"))
      {
        v30 = -[PXScrollSpeedometer _nextRegimeCount](self, "_nextRegimeCount");
        v31 = v30 + 1;
        if (v30 >= 2)
          v13 = v29;
      }
      else
      {
        v31 = 0;
      }
    }
    else
    {
      v31 = 0;
      v13 = v29;
    }
    v32 = v12 > v15 && v14;
    if ((v32 & v27) != 0)
      v13 = 3;
    -[PXScrollSpeedometer _setNextRegime:](self, "_setNextRegime:", v29);
    -[PXScrollSpeedometer _setNextRegimeCount:](self, "_setNextRegimeCount:", v31);
    -[PXScrollSpeedometer setLastScrollDirection:](self, "setLastScrollDirection:", (double)(v5 / v12), (double)(v7 / v12), 0.0);
  }
  -[PXScrollSpeedometer scrollView](self, "scrollView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXScrollSpeedometer _lastVisibleRect](self, "_lastVisibleRect");
  kdebug_trace();
  kdebug_trace();

  -[PXScrollSpeedometer _setRegime:](self, "_setRegime:", v13);
}

- (void)handleScrollEventVisibleRect:(CGRect)a3 didEnd:(BOOL)a4
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  BOOL v17;
  double v18;
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
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  _QWORD v33[9];
  CGRect v34;
  CGRect v35;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[PXScrollSpeedometer isManuallyChanging](self, "isManuallyChanging"))
  {
    -[PXScrollSpeedometer _setLastVisibleRect:](self, "_setLastVisibleRect:", x, y, width, height);
    return;
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v11 = v10;
  -[PXScrollSpeedometer _lastTime](self, "_lastTime");
  v13 = v12;
  -[PXScrollSpeedometer _lastVisibleRect](self, "_lastVisibleRect");
  v16 = width == v15 && height == v14;
  if (!v16
    || (width == *MEMORY[0x24BDBF148] ? (v17 = height == *(double *)(MEMORY[0x24BDBF148] + 8)) : (v17 = 0), v17))
  {
    v26 = *MEMORY[0x24BDBEFB0];
    v28 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    v24 = v28;
    v23 = *MEMORY[0x24BDBEFB0];
    goto LABEL_15;
  }
  v18 = v11 - v13;
  if (a4)
    goto LABEL_13;
  -[PXScrollSpeedometer _lastVisibleRect](self, "_lastVisibleRect");
  v35.origin.x = v29;
  v35.origin.y = v30;
  v35.size.width = v31;
  v35.size.height = v32;
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  if (!CGRectEqualToRect(v34, v35) || v18 >= 0.00833333333)
  {
LABEL_13:
    -[PXScrollSpeedometer _lastVisibleRect](self, "_lastVisibleRect");
    v20 = v19;
    v22 = v21;
    -[PXScrollSpeedometer scrollVelocity](self, "scrollVelocity");
    v23 = 1.0 / v18 * (x - v20);
    v24 = 1.0 / v18 * (y - v22);
    v26 = 1.0 / v18 * (v23 - v25);
    v28 = 1.0 / v18 * (v24 - v27);
LABEL_15:
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __59__PXScrollSpeedometer_handleScrollEventVisibleRect_didEnd___block_invoke;
    v33[3] = &unk_2514CF2A0;
    v33[4] = self;
    *(double *)&v33[5] = v26;
    *(double *)&v33[6] = v28;
    *(double *)&v33[7] = v23;
    *(double *)&v33[8] = v24;
    -[PXObservable performChanges:](self, "performChanges:", v33);
    -[PXScrollSpeedometer _setLastTime:](self, "_setLastTime:", v11);
    -[PXScrollSpeedometer _setLastVisibleRect:](self, "_setLastVisibleRect:", x, y, width, height);
    -[PXScrollSpeedometer _scheduleScrubbingTimeout](self, "_scheduleScrubbingTimeout");
    -[PXScrollSpeedometer _rescheduleTimeout](self, "_rescheduleTimeout");
  }
}

- (id)scrollview
{
  return 0;
}

- (BOOL)isManuallyChanging
{
  return 0;
}

- (BOOL)isScrubbing
{
  return 0;
}

- (void)setScrollVelocity:(CGPoint)a3
{
  if (a3.x != self->_scrollVelocity.x || a3.y != self->_scrollVelocity.y)
  {
    self->_scrollVelocity = a3;
    -[PXObservable signalChange:](self, "signalChange:", 1);
  }
}

- (void)_setRegime:(int64_t)a3
{
  if (self->_regime != a3)
  {
    -[PXScrollSpeedometer _setPreviousRegime:](self, "_setPreviousRegime:");
    self->_regime = a3;
    -[PXObservable signalChange:](self, "signalChange:", 2);
  }
}

- (void)_setPreviousRegime:(int64_t)a3
{
  if (self->_previousRegime != a3)
  {
    self->_previousRegime = a3;
    -[PXObservable signalChange:](self, "signalChange:", 4);
  }
}

- (void)setLastScrollDirection:(CGPoint)a3
{
  if (a3.x != self->_lastScrollDirection.x || a3.y != self->_lastScrollDirection.y)
  {
    self->_lastScrollDirection = a3;
    -[PXObservable signalChange:](self, "signalChange:", 8);
  }
}

- (double)mediumLowerThreshold
{
  return 200.0;
}

- (double)mediumUpperThreshold
{
  return 1000.0;
}

- (double)fastLowerThreshold
{
  return 1000.0;
}

- (double)fastUpperThreshold
{
  return 5000.0;
}

- (void)_scheduleScrubbingTimeout
{
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  if (-[PXScrollSpeedometer isScrubbing](self, "isScrubbing"))
  {
    objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__handleScrubbingTimeout, 0);
    v4[0] = *MEMORY[0x24BDBCB80];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXScrollSpeedometer performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel__handleScrubbingTimeout, 0, v3, 0.1);

  }
}

- (void)_handleScrubbingTimeout
{
  if (-[PXScrollSpeedometer isScrubbing](self, "isScrubbing"))
  {
    if (-[PXScrollSpeedometer regime](self, "regime") == 3)
    {
      -[PXScrollSpeedometer _lastVisibleRect](self, "_lastVisibleRect");
      -[PXScrollSpeedometer handleScrollEventVisibleRect:didEnd:](self, "handleScrollEventVisibleRect:didEnd:", 0);
      -[PXScrollSpeedometer _scheduleScrubbingTimeout](self, "_scheduleScrubbingTimeout");
    }
  }
}

- (void)_rescheduleTimeout
{
  void *v3;
  void *v4;
  double v5;
  uint64_t v6;
  id v7;

  -[PXScrollSpeedometer _timeoutTimer](self, "_timeoutTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v7 = v3;
    objc_msgSend(v3, "fireDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceNow");
    if (v5 < 0.5)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 1.5);
      v6 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "setFireDate:", v6);
      v4 = (void *)v6;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__handleTimeoutTimer_, 0, 0, 1.5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PXScrollSpeedometer _setTimeoutTimer:](self, "_setTimeoutTimer:", v7);
  }

}

- (void)_handleTimeoutTimer:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __43__PXScrollSpeedometer__handleTimeoutTimer___block_invoke;
  v3[3] = &unk_2514CFA40;
  v3[4] = self;
  -[PXObservable performChanges:](self, "performChanges:", v3);
}

- (CGPoint)scrollVelocity
{
  double x;
  double y;
  CGPoint result;

  x = self->_scrollVelocity.x;
  y = self->_scrollVelocity.y;
  result.y = y;
  result.x = x;
  return result;
}

- (int64_t)regime
{
  return self->_regime;
}

- (int64_t)previousRegime
{
  return self->_previousRegime;
}

- (CGPoint)lastScrollDirection
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastScrollDirection.x;
  y = self->_lastScrollDirection.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGRect)_lastVisibleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__lastVisibleRect.origin.x;
  y = self->__lastVisibleRect.origin.y;
  width = self->__lastVisibleRect.size.width;
  height = self->__lastVisibleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_setLastVisibleRect:(CGRect)a3
{
  self->__lastVisibleRect = a3;
}

- (double)_lastTime
{
  return self->__lastTime;
}

- (void)_setLastTime:(double)a3
{
  self->__lastTime = a3;
}

- (NSTimer)_timeoutTimer
{
  return self->__timeoutTimer;
}

- (void)_setTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->__timeoutTimer, a3);
}

- (int64_t)_nextRegime
{
  return self->__nextRegime;
}

- (void)_setNextRegime:(int64_t)a3
{
  self->__nextRegime = a3;
}

- (int64_t)_nextRegimeCount
{
  return self->__nextRegimeCount;
}

- (void)_setNextRegimeCount:(int64_t)a3
{
  self->__nextRegimeCount = a3;
}

- (CGPoint)scrollAcceleration
{
  double x;
  double y;
  CGPoint result;

  x = self->_scrollAcceleration.x;
  y = self->_scrollAcceleration.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setScrollAcceleration:(CGPoint)a3
{
  self->_scrollAcceleration = a3;
}

- (id)scrollView
{
  return self->_scrollView;
}

- (BOOL)isAnimatingScroll
{
  return self->_isAnimatingScroll;
}

- (void)setIsAnimatingScroll:(BOOL)a3
{
  self->_isAnimatingScroll = a3;
}

- (BOOL)hasRampedUpForCurrentAnimatedScroll
{
  return self->_hasRampedUpForCurrentAnimatedScroll;
}

- (void)setHasRampedUpForCurrentAnimatedScroll:(BOOL)a3
{
  self->_hasRampedUpForCurrentAnimatedScroll = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_scrollView, 0);
  objc_storeStrong((id *)&self->__timeoutTimer, 0);
}

uint64_t __43__PXScrollSpeedometer__handleTimeoutTimer___block_invoke(uint64_t a1)
{
  double v2;
  double v3;

  v2 = *MEMORY[0x24BDBEFB0];
  v3 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  objc_msgSend(*(id *)(a1 + 32), "setScrollVelocity:", *MEMORY[0x24BDBEFB0], v3);
  objc_msgSend(*(id *)(a1 + 32), "setScrollAcceleration:", v2, v3);
  return objc_msgSend(*(id *)(a1 + 32), "_setTimeoutTimer:", 0);
}

uint64_t __59__PXScrollSpeedometer_handleScrollEventVisibleRect_didEnd___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setScrollAcceleration:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "setScrollVelocity:", *(double *)(a1 + 56), *(double *)(a1 + 64));
}

@end
