@implementation UIPageControlTimerProgress

- (void)setResetsToInitialPageAfterEnd:(BOOL)resetsToInitialPageAfterEnd
{
  self->_resetsToInitialPageAfterEnd = resetsToInitialPageAfterEnd;
}

- (void)setPageControl:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIPageControlTimerProgress;
  -[UIPageControlProgress setPageControl:](&v4, sel_setPageControl_, a3);
  -[UIPageControlTimerProgress _updateTimer](self, "_updateTimer");
}

- (void)setDelegate:(id)delegate
{
  id v4;
  char v5;
  char v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIPageControlTimerProgress;
  v4 = delegate;
  -[UIPageControlProgress setDelegate:](&v7, sel_setDelegate_, v4);
  *(_BYTE *)&self->_delegateImplements = *(_BYTE *)&self->_delegateImplements & 0xFE | objc_opt_respondsToSelector() & 1;
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
    v6 = 2;
  else
    v6 = 0;
  *(_BYTE *)&self->_delegateImplements = *(_BYTE *)&self->_delegateImplements & 0xFD | v6;
}

- (void)setCurrentProgress:(float)a3
{
  double currentDuration;
  float v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIPageControlTimerProgress;
  -[UIPageControlProgress setCurrentProgress:](&v6, sel_setCurrentProgress_);
  currentDuration = self->_currentDuration;
  -[UIPageControlProgress currentProgress](self, "currentProgress");
  self->_currentDurationProgress = currentDuration * v5;
}

- (NSTimeInterval)preferredDuration
{
  return self->_preferredDuration;
}

- (void)pauseTimer
{
  self->_enableTimer = 0;
  -[UIPageControlTimerProgress _updateTimer](self, "_updateTimer");
}

- (UIPageControlTimerProgress)initWithPreferredDuration:(NSTimeInterval)preferredDuration
{
  UIPageControlTimerProgress *result;
  void *v7;
  objc_super v8;

  if (preferredDuration <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPageControlProgress.m"), 110, CFSTR("preferredDuration (%f) must be greater than zero."), *(_QWORD *)&preferredDuration);

  }
  v8.receiver = self;
  v8.super_class = (Class)UIPageControlTimerProgress;
  result = -[UIPageControlProgress init](&v8, sel_init);
  if (result)
    result->_preferredDuration = preferredDuration;
  return result;
}

- (BOOL)enableTimer
{
  return self->_enableTimer;
}

- (NSTimeInterval)durationForPage:(NSInteger)page
{
  NSMutableDictionary *customDurationByPage;
  void *v5;
  void *v6;
  double v7;
  double v8;

  customDurationByPage = self->_customDurationByPage;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", page);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](customDurationByPage, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v6, "doubleValue");
  else
    -[UIPageControlTimerProgress preferredDuration](self, "preferredDuration");
  v8 = v7;

  return v8;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)_updateTimer
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  id v12;

  v3 = -[UIPageControlTimerProgress _canInstallTimer](self, "_canInstallTimer");
  -[UIPageControlTimerProgress displayLink](self, "displayLink");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!v4)
    {
      -[UIPageControlProgress pageControl](self, "pageControl");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_screen");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "displayLinkWithTarget:selector:", self, sel__displayLinkTicked_);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addToRunLoop:forMode:", v7, *MEMORY[0x1E0C99860]);

      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addToRunLoop:forMode:", v8, CFSTR("UITrackingRunLoopMode"));

      -[UIPageControlTimerProgress setDisplayLink:](self, "setDisplayLink:", v12);
      self->_previousTime = CFAbsoluteTimeGetCurrent();
      -[UIPageControlProgress pageControl](self, "pageControl");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPageControlTimerProgress durationForPage:](self, "durationForPage:", objc_msgSend(v9, "currentPage"));
      self->_currentDuration = v10;

    }
  }
  else if (v4)
  {
    -[UIPageControlTimerProgress displayLink](self, "displayLink");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidate");

    -[UIPageControlTimerProgress setDisplayLink:](self, "setDisplayLink:", 0);
  }
}

- (void)_progressVisibilityChanged:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIPageControlTimerProgress;
  -[UIPageControlProgress _progressVisibilityChanged:](&v4, sel__progressVisibilityChanged_, a3);
  -[UIPageControlTimerProgress _updateTimer](self, "_updateTimer");
}

- (void)_didChangeCurrentPage
{
  void *v3;
  double v4;
  objc_super v5;

  -[UIPageControlProgress pageControl](self, "pageControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPageControlTimerProgress durationForPage:](self, "durationForPage:", objc_msgSend(v3, "currentPage"));
  self->_currentDuration = v4;

  v5.receiver = self;
  v5.super_class = (Class)UIPageControlTimerProgress;
  -[UIPageControlProgress _didChangeCurrentPage](&v5, sel__didChangeCurrentPage);
}

- (BOOL)_canInstallTimer
{
  void *v3;
  void *v4;
  BOOL v5;

  -[UIPageControlProgress pageControl](self, "pageControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4
    && -[UIPageControlProgress isProgressVisible](self, "isProgressVisible")
    && -[UIPageControlTimerProgress enableTimer](self, "enableTimer");

  return v5;
}

- (void)setPreferredDuration:(NSTimeInterval)preferredDuration
{
  void *v6;

  if (preferredDuration <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPageControlProgress.m"), 138, CFSTR("preferredDuration (%f) must be greater than zero."), *(_QWORD *)&preferredDuration);

  }
  self->_preferredDuration = preferredDuration;
  -[UIPageControlTimerProgress _updateTimer](self, "_updateTimer");
}

- (void)setDuration:(NSTimeInterval)duration forPage:(NSInteger)page
{
  NSMutableDictionary *customDurationByPage;
  void *v6;
  id v7;

  customDurationByPage = self->_customDurationByPage;
  if (duration <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", page);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](customDurationByPage, "removeObjectForKey:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", page);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](customDurationByPage, "setObject:forKey:", v7, v6);

  }
}

- (BOOL)isRunning
{
  return self->_displayLink != 0;
}

- (void)resumeTimer
{
  self->_enableTimer = 1;
  -[UIPageControlTimerProgress _updateTimer](self, "_updateTimer");
}

- (void)_displayLinkTicked:(id)a3
{
  CFAbsoluteTime Current;
  CFAbsoluteTime v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  id v10;

  Current = CFAbsoluteTimeGetCurrent();
  v5 = Current - self->_previousTime;
  -[UIPageControlProgress pageControl](self, "pageControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 + self->_currentDurationProgress;
  v10 = v6;
  if (v7 >= self->_currentDuration)
  {
    v9 = objc_msgSend(v6, "currentPage") + 1;
    if (v9 == objc_msgSend(v10, "numberOfPages")
      && -[UIPageControlTimerProgress resetsToInitialPageAfterEnd](self, "resetsToInitialPageAfterEnd"))
    {
      v9 = 0;
    }
    if (v9 < objc_msgSend(v10, "numberOfPages")
      && -[UIPageControlTimerProgress _shouldAdvanceToPage:](self, "_shouldAdvanceToPage:", v9))
    {
      objc_msgSend(v10, "_setPage:interactionState:", v9, 1);
    }
    else
    {
      -[UIPageControlTimerProgress pauseTimer](self, "pauseTimer");
    }
  }
  else
  {
    self->_currentDurationProgress = v7;
    v8 = v7 / self->_currentDuration;
    *(float *)&v8 = v8;
    -[UIPageControlTimerProgress setCurrentProgress:](self, "setCurrentProgress:", v8);
  }
  self->_previousTime = Current;

}

- (BOOL)_shouldAdvanceToPage:(int64_t)a3
{
  void *v6;

  if ((*(_BYTE *)&self->_delegateImplements & 2) == 0)
    return 1;
  -[UIPageControlProgress delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v6, "pageControlTimerProgress:shouldAdvanceToPage:", self, a3);

  return a3;
}

- (void)dealloc
{
  objc_super v3;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)UIPageControlTimerProgress;
  -[UIPageControlTimerProgress dealloc](&v3, sel_dealloc);
}

- (BOOL)resetsToInitialPageAfterEnd
{
  return self->_resetsToInitialPageAfterEnd;
}

- (NSMutableDictionary)customDurationByPage
{
  return self->_customDurationByPage;
}

- (void)setCustomDurationByPage:(id)a3
{
  objc_storeStrong((id *)&self->_customDurationByPage, a3);
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (void)setEnableTimer:(BOOL)a3
{
  self->_enableTimer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_customDurationByPage, 0);
}

@end
