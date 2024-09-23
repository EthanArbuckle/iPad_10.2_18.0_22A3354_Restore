@implementation PUScrollViewSpeedometer

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateSupportsRegimeChange = objc_opt_respondsToSelector() & 1;
  }

}

- (void)scrollViewDidScroll:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  double v15;
  double v16;
  BOOL v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;

  v28 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v5 = v4;
  objc_msgSend(v28, "contentOffset");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v28, "contentSize");
  v11 = v10;
  v13 = v12;
  -[PUScrollViewSpeedometer _lastScrollView](self, "_lastScrollView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v14 == v28
    && ((-[PUScrollViewSpeedometer _lastContentSize](self, "_lastContentSize"), v11 == v16)
      ? (v17 = v13 == v15)
      : (v17 = 0),
        v17))
  {
    v20 = *MEMORY[0x1E0C9D820];
    v21 = *(double *)(MEMORY[0x1E0C9D820] + 8);

    if (v11 != v20 || v13 != v21)
    {
      -[PUScrollViewSpeedometer _lastTime](self, "_lastTime");
      v24 = v23;
      -[PUScrollViewSpeedometer _lastContentOffset](self, "_lastContentOffset");
      v25 = 1.0 / (v5 - v24);
      v18 = v25 * (v7 - v26);
      v19 = v25 * (v9 - v27);
      goto LABEL_8;
    }
  }
  else
  {

  }
  v18 = *MEMORY[0x1E0C9D538];
  v19 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PUScrollViewSpeedometer _setLastScrollView:](self, "_setLastScrollView:", v28);
  -[PUScrollViewSpeedometer _setLastContentSize:](self, "_setLastContentSize:", v11, v13);
LABEL_8:
  -[PUScrollViewSpeedometer _setScrollSpeed:](self, "_setScrollSpeed:", v18, v19);
  -[PUScrollViewSpeedometer _setLastTime:](self, "_setLastTime:", v5);
  -[PUScrollViewSpeedometer _setLastContentOffset:](self, "_setLastContentOffset:", v7, v9);
  -[PUScrollViewSpeedometer _rescheduleTimeout](self, "_rescheduleTimeout");

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[PUScrollViewSpeedometer _setScrollSpeed:](self, "_setScrollSpeed:", a3, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  -[PUScrollViewSpeedometer _setScrollSpeed:](self, "_setScrollSpeed:", a3, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (void)scrollViewDidScrollToTop:(id)a3
{
  -[PUScrollViewSpeedometer _setScrollSpeed:](self, "_setScrollSpeed:", a3, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (void)_rescheduleTimeout
{
  void *v3;
  void *v4;
  double v5;
  uint64_t v6;
  id v7;

  -[PUScrollViewSpeedometer _timeoutTimer](self, "_timeoutTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v7 = v3;
    objc_msgSend(v3, "fireDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceNow");
    if (v5 < 0.5)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 1.5);
      v6 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "setFireDate:", v6);
      v4 = (void *)v6;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__handleTimeoutTimer_, 0, 0, 1.5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PUScrollViewSpeedometer _setTimeoutTimer:](self, "_setTimeoutTimer:", v7);
  }

}

- (void)_handleTimeoutTimer:(id)a3
{
  -[PUScrollViewSpeedometer _setScrollSpeed:](self, "_setScrollSpeed:", a3, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  -[PUScrollViewSpeedometer _setTimeoutTimer:](self, "_setTimeoutTimer:", 0);
}

- (void)_setScrollSpeed:(CGPoint)a3
{
  if (a3.x != self->_scrollSpeed.x || a3.y != self->_scrollSpeed.y)
  {
    self->_scrollSpeed = a3;
    -[PUScrollViewSpeedometer _setRegime:](self, "_setRegime:", -[PUScrollViewSpeedometer _newRegimeForScrollSpeed:](self, "_newRegimeForScrollSpeed:"));
  }
}

- (void)_setRegime:(int64_t)a3
{
  int64_t regime;
  id v6;

  regime = self->_regime;
  if (regime != a3)
  {
    self->_regime = a3;
    if (self->_delegateSupportsRegimeChange)
    {
      -[PUScrollViewSpeedometer delegate](self, "delegate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "scrollViewSpeedometer:regimeDidChange:from:", self, a3, regime);

    }
  }
}

- (int64_t)_newRegimeForScrollSpeed:(CGPoint)a3
{
  double v3;
  int64_t v4;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;

  v3 = fmax(fabs(a3.x), fabs(a3.y));
  if (v3 == 0.0)
    return 0;
  v4 = -[PUScrollViewSpeedometer regime](self, "regime");
  v7 = 0.0;
  switch(v4)
  {
    case -1:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUScrollViewSpeedometer.m"), 165, CFSTR("undefined regime"));

      goto LABEL_12;
    case 0:
    case 1:
      -[PUScrollViewSpeedometer mediumUpperThreshold](self, "mediumUpperThreshold");
      v9 = v8;
      -[PUScrollViewSpeedometer fastUpperThreshold](self, "fastUpperThreshold");
      v11 = 2;
      if (v3 <= v9)
        v11 = 1;
      if (v3 <= v10)
        v12 = v11;
      else
        v12 = 3;
      if (v4)
        goto LABEL_20;
      v13 = 0;
      v4 = v12;
      break;
    case 2:
      -[PUScrollViewSpeedometer mediumLowerThreshold](self, "mediumLowerThreshold");
      v7 = v16;
      -[PUScrollViewSpeedometer fastUpperThreshold](self, "fastUpperThreshold");
      goto LABEL_15;
    case 3:
      -[PUScrollViewSpeedometer mediumLowerThreshold](self, "mediumLowerThreshold");
      v7 = v17;
      -[PUScrollViewSpeedometer fastLowerThreshold](self, "fastLowerThreshold");
      goto LABEL_15;
    default:
LABEL_12:
      v15 = 0.0;
LABEL_15:
      v18 = 2;
      if (v3 <= v7)
        v18 = 1;
      if (v3 <= v15)
        v12 = v18;
      else
        v12 = 3;
LABEL_20:
      if (v12 == -[PUScrollViewSpeedometer _nextRegime](self, "_nextRegime"))
      {
        v19 = -[PUScrollViewSpeedometer _nextRegimeCount](self, "_nextRegimeCount");
        v13 = v19 + 1;
        if (v19 >= 2)
          v4 = v12;
      }
      else
      {
        v13 = 0;
      }
      break;
  }
  -[PUScrollViewSpeedometer _setNextRegime:](self, "_setNextRegime:", v12);
  -[PUScrollViewSpeedometer _setNextRegimeCount:](self, "_setNextRegimeCount:", v13);
  return v4;
}

- (PUScrollViewSpeedometerDelegate)delegate
{
  return (PUScrollViewSpeedometerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (CGPoint)scrollSpeed
{
  double x;
  double y;
  CGPoint result;

  x = self->_scrollSpeed.x;
  y = self->_scrollSpeed.y;
  result.y = y;
  result.x = x;
  return result;
}

- (int64_t)regime
{
  return self->_regime;
}

- (double)mediumUpperThreshold
{
  return self->_mediumUpperThreshold;
}

- (void)setMediumUpperThreshold:(double)a3
{
  self->_mediumUpperThreshold = a3;
}

- (double)mediumLowerThreshold
{
  return self->_mediumLowerThreshold;
}

- (void)setMediumLowerThreshold:(double)a3
{
  self->_mediumLowerThreshold = a3;
}

- (double)fastUpperThreshold
{
  return self->_fastUpperThreshold;
}

- (void)setFastUpperThreshold:(double)a3
{
  self->_fastUpperThreshold = a3;
}

- (double)fastLowerThreshold
{
  return self->_fastLowerThreshold;
}

- (void)setFastLowerThreshold:(double)a3
{
  self->_fastLowerThreshold = a3;
}

- (UIScrollView)_lastScrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->__lastScrollView);
}

- (void)_setLastScrollView:(id)a3
{
  objc_storeWeak((id *)&self->__lastScrollView, a3);
}

- (CGSize)_lastContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->__lastContentSize.width;
  height = self->__lastContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setLastContentSize:(CGSize)a3
{
  self->__lastContentSize = a3;
}

- (double)_lastTime
{
  return self->__lastTime;
}

- (void)_setLastTime:(double)a3
{
  self->__lastTime = a3;
}

- (CGPoint)_lastContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->__lastContentOffset.x;
  y = self->__lastContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_setLastContentOffset:(CGPoint)a3
{
  self->__lastContentOffset = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__timeoutTimer, 0);
  objc_destroyWeak((id *)&self->__lastScrollView);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
