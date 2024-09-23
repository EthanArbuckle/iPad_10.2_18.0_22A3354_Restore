@implementation PXManualDisplayLink

- (PXManualDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4
{
  return -[PXManualDisplayLink initWithWeakTarget:selector:queue:](self, "initWithWeakTarget:selector:queue:", a3, a4, MEMORY[0x1E0C80D38]);
}

- (PXManualDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 screen:(id)a5 queue:(id)a6
{
  return -[PXManualDisplayLink initWithWeakTarget:selector:queue:](self, "initWithWeakTarget:selector:queue:", a3, a4, a6);
}

- (PXManualDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 queue:(id)a5
{
  id v8;
  id v9;
  PXManualDisplayLink *v10;
  PXManualDisplayLink *v11;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PXManualDisplayLink;
  v10 = -[PXManualDisplayLink init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak(&v10->_target, v8);
    v11->_selector = a4;
    objc_storeStrong((id *)&v11->_queue, a5);
    v11->_preferredFramesPerSecond = 30;
  }

  return v11;
}

- (double)currentMediaTime
{
  return self->_targetTimestamp;
}

- (double)timestamp
{
  return self->_targetTimestamp;
}

- (double)duration
{
  return 1.0 / (double)self->_preferredFramesPerSecond;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  _BOOL4 v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXManualDisplayLink paused](self, "paused");
  v7 = CFSTR("NO");
  if (v6)
    v7 = CFSTR("YES");
  v8 = v7;
  -[PXManualDisplayLink targetTimestamp](self, "targetTimestamp");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; paused = %@; targetTimestamp = %.3f>"), v5, self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (void)incrementTargetTimeWithInterval:(double)a3
{
  void *v4;
  id WeakRetained;
  id v6;

  self->_targetTimestamp = self->_targetTimestamp + a3;
  if (!self->_paused)
  {
    -[PXManualDisplayLink target](self, "target");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v6 = v4;
      WeakRetained = objc_loadWeakRetained(&self->_target);
      objc_msgSend(WeakRetained, "performSelector:withObject:", -[PXManualDisplayLink selector](self, "selector"), self);

      v4 = v6;
    }

  }
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (SEL)selector
{
  return self->_selector;
}

- (BOOL)paused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (int64_t)preferredFramesPerSecond
{
  return self->_preferredFramesPerSecond;
}

- (void)setPreferredFramesPerSecond:(int64_t)a3
{
  self->_preferredFramesPerSecond = a3;
}

- (double)targetTimestamp
{
  return self->_targetTimestamp;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (UIScreen)screen
{
  return (UIScreen *)objc_loadWeakRetained((id *)&self->screen);
}

- (unsigned)highFrameRateReason
{
  return self->_highFrameRateReason;
}

- (void)setHighFrameRateReason:(unsigned int)a3
{
  self->_highFrameRateReason = a3;
}

- (unint64_t)frameRateRangeType
{
  return self->_frameRateRangeType;
}

- (void)setFrameRateRangeType:(unint64_t)a3
{
  self->_frameRateRangeType = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->screen);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak(&self->_target);
}

+ (BOOL)supportsSpecificScreen
{
  return 0;
}

@end
