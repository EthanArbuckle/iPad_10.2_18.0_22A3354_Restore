@implementation PXCADisplayLink

- (double)duration
{
  double result;

  -[CADisplayLink duration](self->_displayLink, "duration");
  return result;
}

- (double)targetTimestamp
{
  double result;

  result = self->_updateCycleTargetTimestamp;
  if (result == 0.0)
    -[CADisplayLink targetTimestamp](self->_displayLink, "targetTimestamp");
  return result;
}

- (double)timestamp
{
  double result;

  result = self->_updateCycleTimestamp;
  if (result == 0.0)
    -[CADisplayLink timestamp](self->_displayLink, "timestamp");
  return result;
}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  kdebug_trace();
  -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", v3);
  -[PXCADisplayLink _updateIsHighFrameRateActive](self, "_updateIsHighFrameRateActive");
}

- (void)setIsHighFrameRateActive:(BOOL)a3
{
  if (self->_isHighFrameRateActive != a3)
  {
    self->_isHighFrameRateActive = a3;
    -[PXCADisplayLink highFrameRateReason](self, "highFrameRateReason");
    -[CADisplayLink preferredFrameRateRange](self->_displayLink, "preferredFrameRateRange");
    kdebug_trace();
  }
}

- (void)_addToRunLoop
{
  CADisplayLink *displayLink;
  void *v4;
  void *v5;

  displayLink = self->_displayLink;
  objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDisplayLink runloopModes](self, "runloopModes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CADisplayLink addToRunLoop:forMode:](displayLink, "addToRunLoop:forMode:", v4, v5);

  -[PXCADisplayLink paused](self, "paused");
  kdebug_trace();
}

- (void)setHighFrameRateReason:(unsigned int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (+[PXCADisplayLink highFramerateRequiresReasonAndRange](PXCADisplayLink, "highFramerateRequiresReasonAndRange"))
  {
    -[CADisplayLink setHighFrameRateReason:](self->_displayLink, "setHighFrameRateReason:", v3);
    kdebug_trace();
    -[PXCADisplayLink _updateIsHighFrameRateActive](self, "_updateIsHighFrameRateActive");
  }
}

- (void)setFrameRateRangeType:(unint64_t)a3
{
  double v5;

  if (+[PXCADisplayLink highFramerateRequiresReasonAndRange](PXCADisplayLink, "highFramerateRequiresReasonAndRange"))
  {
    if (self->_frameRateRangeType != a3)
    {
      self->_frameRateRangeType = a3;
      *(float *)&v5 = PXFrameRateRangeTypeGetCAFrameRateRange(a3);
      -[CADisplayLink setPreferredFrameRateRange:](self->_displayLink, "setPreferredFrameRateRange:", v5);
      kdebug_trace();
      -[PXCADisplayLink _updateIsHighFrameRateActive](self, "_updateIsHighFrameRateActive");
    }
  }
}

- (void)_updateIsHighFrameRateActive
{
  float v3;
  _BOOL8 v4;

  if (+[PXCADisplayLink highFramerateRequiresReasonAndRange](PXCADisplayLink, "highFramerateRequiresReasonAndRange")&& !-[PXCADisplayLink paused](self, "paused")&& -[PXCADisplayLink highFrameRateReason](self, "highFrameRateReason"))
  {
    -[CADisplayLink preferredFrameRateRange](self->_displayLink, "preferredFrameRateRange");
    v4 = v3 > 60.0;
  }
  else
  {
    v4 = 0;
  }
  -[PXCADisplayLink setIsHighFrameRateActive:](self, "setIsHighFrameRateActive:", v4);
}

+ (BOOL)highFramerateRequiresReasonAndRange
{
  if (highFramerateRequiresReasonAndRange_onceToken != -1)
    dispatch_once(&highFramerateRequiresReasonAndRange_onceToken, &__block_literal_global_7891);
  return highFramerateRequiresReasonAndRange_highFramerateRequiresReasonAndRange;
}

- (BOOL)paused
{
  CADisplayLink *displayLink;

  displayLink = self->_displayLink;
  return !displayLink || -[CADisplayLink isPaused](displayLink, "isPaused");
}

- (unsigned)highFrameRateReason
{
  return -[CADisplayLink highFrameRateReason](self->_displayLink, "highFrameRateReason");
}

- (int64_t)preferredFramesPerSecond
{
  float v2;

  -[CADisplayLink preferredFrameRateRange](self->_displayLink, "preferredFrameRateRange");
  return (uint64_t)v2;
}

- (void)_tick:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  if (self->_displayLink == a3)
  {
    if (_UIUpdateCycleEnabled())
    {
      if (_UIUpdateCurrentTiming())
      {
        _UIMediaTimeForMachTime();
        v5 = v4;
        self->_updateCycleTargetTimestamp = v4;
        -[CADisplayLink duration](self->_displayLink, "duration");
        v7 = v5 - v6;
      }
      else
      {
        self->_updateCycleTargetTimestamp = 0.0;
        v7 = 0.0;
      }
      self->_updateCycleTimestamp = v7;
    }
    -[PXDisplayLink target](self, "target");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v8, "performSelector:withObject:", -[PXDisplayLink selector](self, "selector"), self);
    else
      -[PXCADisplayLink invalidate](self, "invalidate");

  }
}

- (void)dealloc
{
  objc_super v3;

  -[PXCADisplayLink invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PXCADisplayLink;
  -[PXCADisplayLink dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  CADisplayLink *v3;
  CADisplayLink *displayLink;
  _QWORD v5[4];
  CADisplayLink *v6;

  v3 = self->_displayLink;
  if (v3)
  {
    displayLink = self->_displayLink;
    self->_displayLink = 0;

    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __29__PXCADisplayLink_invalidate__block_invoke;
    v5[3] = &unk_2514D11A8;
    v6 = v3;
    px_dispatch_on_main_queue(v5);

  }
}

uint64_t __29__PXCADisplayLink_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
}

void __54__PXCADisplayLink_highFramerateRequiresReasonAndRange__block_invoke()
{
  char v0;
  void *v1;
  char v2;

  v0 = MGGetBoolAnswer();
  v1 = (void *)MGGetStringAnswer();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("iPhone"));

  highFramerateRequiresReasonAndRange_highFramerateRequiresReasonAndRange = v0 & v2;
}

- (id)queue
{
  void *v2;
  id v3;

  v2 = (void *)MEMORY[0x24BDAC9B8];
  v3 = MEMORY[0x24BDAC9B8];
  return v2;
}

- (PXCADisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 deferredStart:(BOOL)a5 runloopModes:(id)a6 preferredFramesPerSecond:(int64_t)a7 screen:(id)a8 queue:(id)a9
{
  _BOOL8 v12;
  id v16;
  id v17;
  id v18;
  id v19;
  PXCADisplayLink *v20;
  uint64_t v21;
  CADisplayLink *displayLink;
  BOOL v23;
  __CFRunLoopObserver *v24;
  __CFRunLoop *Current;
  NSObject *v26;
  void *v28;
  _QWORD aBlock[4];
  id v30;
  id location;
  objc_super v32;
  uint8_t buf[8];
  CFRunLoopObserverContext context;
  CAFrameRateRange v35;

  v12 = a5;
  v16 = a3;
  v17 = a6;
  v18 = a8;
  v19 = a9;
  if (v19 != (id)MEMORY[0x24BDAC9B8])
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCADisplayLink.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue == dispatch_get_main_queue()"));

  }
  v32.receiver = self;
  v32.super_class = (Class)PXCADisplayLink;
  v20 = -[PXDisplayLink initInternalWithWeakTarget:selector:deferredStart:runloopModes:preferredFramesPerSecond:screen:queue:](&v32, sel_initInternalWithWeakTarget_selector_deferredStart_runloopModes_preferredFramesPerSecond_screen_queue_, v16, a4, v12, v17, a7, v18, v19);
  if (v20)
  {
    objc_msgSend(MEMORY[0x24BDE5670], "displayLinkWithTarget:selector:", v20, sel__tick_);
    v21 = objc_claimAutoreleasedReturnValue();
    displayLink = v20->_displayLink;
    v20->_displayLink = (CADisplayLink *)v21;

    v23 = +[PXCADisplayLink highFramerateRequiresReasonAndRange](PXCADisplayLink, "highFramerateRequiresReasonAndRange");
    if (a7 >= 1 && !v23)
    {
      v35 = CAFrameRateRangeMake((float)a7, (float)a7, (float)a7);
      -[CADisplayLink setPreferredFrameRateRange:](v20->_displayLink, "setPreferredFrameRateRange:", *(double *)&v35.minimum, *(double *)&v35.maximum, *(double *)&v35.preferred);
    }
    if (v12)
    {
      objc_initWeak(&location, v20);
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __112__PXCADisplayLink_initWithWeakTarget_selector_deferredStart_runloopModes_preferredFramesPerSecond_screen_queue___block_invoke;
      aBlock[3] = &unk_2514D1180;
      objc_copyWeak(&v30, &location);
      context.version = 0;
      context.info = _Block_copy(aBlock);
      memset(&context.retain, 0, 24);
      v24 = CFRunLoopObserverCreate(0, 0x20uLL, 0, 2000001, (CFRunLoopObserverCallBack)_PXRunLoopObserverTrampoline, &context);
      if (v24)
      {
        Current = CFRunLoopGetCurrent();
        CFRunLoopAddObserver(Current, v24, (CFRunLoopMode)*MEMORY[0x24BDBD598]);
        CFRelease(v24);
      }
      else
      {
        PFUIGetLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_24430E000, v26, OS_LOG_TYPE_ERROR, "Failed to create an observer", buf, 2u);
        }

        CFRelease(context.info);
      }
      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }
    else
    {
      -[PXCADisplayLink _addToRunLoop](v20, "_addToRunLoop");
    }
  }

  return v20;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  _BOOL4 v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXCADisplayLink paused](self, "paused");
  v7 = CFSTR("NO");
  if (v6)
    v7 = CFSTR("YES");
  v8 = v7;
  -[PXCADisplayLink targetTimestamp](self, "targetTimestamp");
  v10 = v9;
  -[PXCADisplayLink timestamp](self, "timestamp");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; paused = %@; targetTimestamp = %.3f timestamp = %.3f>"),
    v5,
    self,
    v8,
    v10,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (double)resolvedDuration
{
  uint64_t v3;
  CADisplayLink *displayLink;
  double v5;
  double v6;
  double v7;
  double result;

  v3 = -[PXCADisplayLink preferredFramesPerSecond](self, "preferredFramesPerSecond");
  displayLink = self->_displayLink;
  if (v3 < 1)
  {
    -[CADisplayLink duration](displayLink, "duration");
  }
  else
  {
    -[CADisplayLink targetTimestamp](displayLink, "targetTimestamp");
    v6 = v5;
    -[CADisplayLink timestamp](self->_displayLink, "timestamp");
    return v6 - v7;
  }
  return result;
}

- (unint64_t)frameRateRangeType
{
  return self->_frameRateRangeType;
}

- (BOOL)isHighFrameRateActive
{
  return self->_isHighFrameRateActive;
}

void __112__PXCADisplayLink_initWithWeakTarget_selector_deferredStart_runloopModes_preferredFramesPerSecond_screen_queue___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_addToRunLoop");

}

+ (BOOL)supportsSpecificScreen
{
  return 0;
}

@end
