@implementation PXAsyncDisplayLink

- (PXAsyncDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4
{
  return -[PXAsyncDisplayLink initWithWeakTarget:selector:queue:](self, "initWithWeakTarget:selector:queue:", a3, a4, MEMORY[0x24BDAC9B8]);
}

- (PXAsyncDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 queue:(id)a5
{
  id v8;
  id v9;
  PXAsyncDisplayLink *v10;

  v8 = a5;
  v9 = a3;
  v10 = -[PXAsyncDisplayLink initWithWeakTarget:selector:preferredFramesPerSecond:screen:queue:](self, "initWithWeakTarget:selector:preferredFramesPerSecond:screen:queue:", v9, a4, PXDisplayLinkDefaultPreferredFramesPerSecond(), 0, v8);

  return v10;
}

- (PXAsyncDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 screen:(id)a5 queue:(id)a6
{
  id v10;
  id v11;
  id v12;
  PXAsyncDisplayLink *v13;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = -[PXAsyncDisplayLink initWithWeakTarget:selector:preferredFramesPerSecond:screen:queue:](self, "initWithWeakTarget:selector:preferredFramesPerSecond:screen:queue:", v12, a4, PXDisplayLinkDefaultPreferredFramesPerSecond(), v11, v10);

  return v13;
}

- (PXAsyncDisplayLink)initWithWeakTarget:(id)a3 selector:(SEL)a4 preferredFramesPerSecond:(int64_t)a5 screen:(id)a6 queue:(id)a7
{
  id v12;
  id v13;
  id v14;
  PXAsyncDisplayLink *v15;
  PXAsyncDisplayLink *v16;
  PXDisplayLink *v17;
  PXDisplayLink *v18;
  PXDisplayLink *mainQueue_displayLink;
  PXDisplayLink *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  objc_super v27;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v27.receiver = self;
  v27.super_class = (Class)PXAsyncDisplayLink;
  v15 = -[PXAsyncDisplayLink init](&v27, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeWeak(&v15->_target, v12);
    v16->_selector = a4;
    objc_storeStrong((id *)&v16->_queue, a7);
    v17 = [PXDisplayLink alloc];
    v18 = -[PXDisplayLink initWithWeakTarget:selector:deferredStart:runloopModes:preferredFramesPerSecond:screen:queue:](v17, "initWithWeakTarget:selector:deferredStart:runloopModes:preferredFramesPerSecond:screen:queue:", v16, sel__mainQueue_tick, 0, *MEMORY[0x24BDBCB80], a5, v13, MEMORY[0x24BDAC9B8]);
    mainQueue_displayLink = v16->_mainQueue_displayLink;
    v16->_mainQueue_displayLink = v18;
    v20 = v18;

    v16->_highFrameRateReason = -[PXDisplayLink highFrameRateReason](v20, "highFrameRateReason");
    v16->_frameRateRangeType = -[PXDisplayLink frameRateRangeType](v20, "frameRateRangeType");
    v16->_paused = -[PXDisplayLink paused](v20, "paused");
    -[PXDisplayLink timestamp](v20, "timestamp");
    v16->_timestamp = v21;
    -[PXDisplayLink duration](v20, "duration");
    v16->_duration = v22;
    -[PXDisplayLink duration](v20, "duration");
    v16->_resolvedDuration = v23;
    -[PXDisplayLink targetTimestamp](v20, "targetTimestamp");
    v25 = v24;

    v16->_targetTimestamp = v25;
    v16->_preferredFramesPerSecond = a5;
  }

  return v16;
}

- (double)currentMediaTime
{
  double result;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[PXDisplayLink currentMediaTime](self->_mainQueue_displayLink, "currentMediaTime");
  return result;
}

- (void)setHighFrameRateReason:(unsigned int)a3
{
  uint64_t v5;
  _QWORD v6[4];
  unsigned int v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_highFrameRateReason != a3)
  {
    v5 = MEMORY[0x24BDAC760];
    self->_highFrameRateReason = a3;
    v6[0] = v5;
    v6[1] = 3221225472;
    v6[2] = __45__PXAsyncDisplayLink_setHighFrameRateReason___block_invoke;
    v6[3] = &__block_descriptor_36_e23_v16__0__PXDisplayLink_8l;
    v7 = a3;
    -[PXAsyncDisplayLink _modifyDisplayLink:](self, "_modifyDisplayLink:", v6);
  }
}

- (void)setFrameRateRangeType:(unint64_t)a3
{
  uint64_t v5;
  _QWORD v6[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_frameRateRangeType != a3)
  {
    v5 = MEMORY[0x24BDAC760];
    self->_frameRateRangeType = a3;
    v6[0] = v5;
    v6[1] = 3221225472;
    v6[2] = __44__PXAsyncDisplayLink_setFrameRateRangeType___block_invoke;
    v6[3] = &__block_descriptor_40_e23_v16__0__PXDisplayLink_8l;
    v6[4] = a3;
    -[PXAsyncDisplayLink _modifyDisplayLink:](self, "_modifyDisplayLink:", v6);
  }
}

- (void)setPaused:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  _QWORD v6[4];
  BOOL v7;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_paused != v3)
  {
    v5 = MEMORY[0x24BDAC760];
    self->_paused = v3;
    v6[0] = v5;
    v6[1] = 3221225472;
    v6[2] = __32__PXAsyncDisplayLink_setPaused___block_invoke;
    v6[3] = &__block_descriptor_33_e23_v16__0__PXDisplayLink_8l;
    v7 = v3;
    -[PXAsyncDisplayLink _modifyDisplayLink:](self, "_modifyDisplayLink:", v6);
  }
}

- (void)invalidate
{
  -[PXAsyncDisplayLink _modifyDisplayLink:](self, "_modifyDisplayLink:", &__block_literal_global);
}

- (void)_queue_tickTimestamp:(double)a3 duration:(double)a4 targetTimestamp:(double)a5 preferredFramesPerSecond:(int64_t)a6
{
  double v11;
  id v12;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_timestamp = a3;
  self->_duration = a4;
  v11 = a5 - a3;
  if (a6 <= 0)
    v11 = a4;
  self->_resolvedDuration = v11;
  self->_targetTimestamp = a5;
  self->_preferredFramesPerSecond = a6;
  if (!-[PXAsyncDisplayLink paused](self, "paused"))
  {
    -[PXAsyncDisplayLink target](self, "target");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v12, "performSelector:withObject:", -[PXAsyncDisplayLink selector](self, "selector"), self);
    else
      -[PXAsyncDisplayLink invalidate](self, "invalidate");

  }
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
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXAsyncDisplayLink paused](self, "paused");
  v7 = CFSTR("NO");
  if (v6)
    v7 = CFSTR("YES");
  v8 = v7;
  -[PXAsyncDisplayLink targetTimestamp](self, "targetTimestamp");
  v10 = v9;
  -[PXAsyncDisplayLink timestamp](self, "timestamp");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; paused = %@; targetTimestamp = %.3f timestamp = %.3f mainQueue_displayLink = %@>"),
    v5,
    self,
    v8,
    v10,
    v11,
    self->_mainQueue_displayLink);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (void)_mainQueue_tick
{
  PXDisplayLink *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *queue;
  _QWORD v12[4];
  id v13[5];
  id location;

  v3 = self->_mainQueue_displayLink;
  -[PXDisplayLink timestamp](v3, "timestamp");
  v5 = v4;
  -[PXDisplayLink duration](v3, "duration");
  v7 = v6;
  -[PXDisplayLink targetTimestamp](v3, "targetTimestamp");
  v9 = v8;
  v10 = -[PXDisplayLink preferredFramesPerSecond](v3, "preferredFramesPerSecond");
  objc_initWeak(&location, self);
  queue = self->_queue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __37__PXAsyncDisplayLink__mainQueue_tick__block_invoke;
  v12[3] = &unk_2514CF218;
  objc_copyWeak(v13, &location);
  v13[1] = v5;
  v13[2] = v7;
  v13[3] = v9;
  v13[4] = v10;
  dispatch_async(queue, v12);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

- (void)_modifyDisplayLink:(id)a3
{
  id v4;
  PXDisplayLink *v5;
  NSObject *v6;
  PXDisplayLink *v7;
  id v8;
  _QWORD v9[4];
  PXDisplayLink *v10;
  id v11;

  v4 = a3;
  v5 = self->_mainQueue_displayLink;
  -[PXDisplayLink queue](self->_mainQueue_displayLink, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __41__PXAsyncDisplayLink__modifyDisplayLink___block_invoke;
  v9[3] = &unk_2514D0C98;
  v10 = v5;
  v11 = v4;
  v7 = v5;
  v8 = v4;
  dispatch_async(v6, v9);

}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (SEL)selector
{
  return self->_selector;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (double)duration
{
  return self->_duration;
}

- (double)resolvedDuration
{
  return self->_resolvedDuration;
}

- (double)targetTimestamp
{
  return self->_targetTimestamp;
}

- (int64_t)preferredFramesPerSecond
{
  return self->_preferredFramesPerSecond;
}

- (unsigned)highFrameRateReason
{
  return self->_highFrameRateReason;
}

- (unint64_t)frameRateRangeType
{
  return self->_frameRateRangeType;
}

- (BOOL)paused
{
  return self->_paused;
}

- (UIScreen)screen
{
  return (UIScreen *)objc_loadWeakRetained((id *)&self->_screen);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_screen);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_mainQueue_displayLink, 0);
}

uint64_t __41__PXAsyncDisplayLink__modifyDisplayLink___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __37__PXAsyncDisplayLink__mainQueue_tick__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_tickTimestamp:duration:targetTimestamp:preferredFramesPerSecond:", *(_QWORD *)(a1 + 64), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));

}

uint64_t __32__PXAsyncDisplayLink_invalidate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

uint64_t __32__PXAsyncDisplayLink_setPaused___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPaused:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __44__PXAsyncDisplayLink_setFrameRateRangeType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFrameRateRangeType:", *(_QWORD *)(a1 + 32));
}

uint64_t __45__PXAsyncDisplayLink_setHighFrameRateReason___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHighFrameRateReason:", *(unsigned int *)(a1 + 32));
}

+ (BOOL)supportsSpecificScreen
{
  return 0;
}

@end
