@implementation ISAnimatedImageTimer

- (ISAnimatedImageTimer)init
{
  ISAnimatedImageTimer *v2;
  _ISAnimatedImageTimerForwardingProxy *v3;
  _ISAnimatedImageTimerForwardingProxy *displayLinkProxy;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ISAnimatedImageTimer;
  v2 = -[ISObservable init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_ISAnimatedImageTimerForwardingProxy);
    displayLinkProxy = v2->_displayLinkProxy;
    v2->_displayLinkProxy = v3;

    -[_ISAnimatedImageTimerForwardingProxy _setForwardingTarget:](v2->_displayLinkProxy, "_setForwardingTarget:", v2);
  }
  return v2;
}

- (void)dealloc
{
  CADisplayLink *displayLink;
  objc_super v4;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  v4.receiver = self;
  v4.super_class = (Class)ISAnimatedImageTimer;
  -[ISAnimatedImageTimer dealloc](&v4, sel_dealloc);
}

- (void)hasObserversDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISAnimatedImageTimer;
  -[ISObservable hasObserversDidChange](&v3, sel_hasObserversDidChange);
  -[ISAnimatedImageTimer _updateDisplayLink](self, "_updateDisplayLink");
}

- (void)_updateDisplayLink
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__ISAnimatedImageTimer__updateDisplayLink__block_invoke;
  block[3] = &unk_1E9453F48;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)_fireTimerWithInterval:(double)a3
{
  _QWORD block[6];
  _QWORD v6[5];

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __47__ISAnimatedImageTimer__fireTimerWithInterval___block_invoke;
    v6[3] = &__block_descriptor_40_e30_v16__0__ISAnimatedImageTimer_8l;
    *(double *)&v6[4] = a3;
    -[ISObservable performChanges:](self, "performChanges:", v6);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__ISAnimatedImageTimer__fireTimerWithInterval___block_invoke_2;
    block[3] = &unk_1E94541A8;
    block[4] = self;
    *(double *)&block[5] = a3;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (void)_setTimestamp:(double)a3
{
  if (self->_timestamp != a3)
  {
    self->_timestamp = a3;
    -[ISObservable signalChange:](self, "signalChange:", 1);
  }
}

- (void)_iosUpdateDisplayLink
{
  CADisplayLink *displayLink;
  _BOOL4 v4;
  CADisplayLink *v5;
  CADisplayLink *v6;
  CADisplayLink *v7;
  CADisplayLink *v8;
  void *v9;
  CADisplayLink *v10;
  CAFrameRateRange v11;

  displayLink = self->_displayLink;
  if (displayLink || (v4 = -[ISObservable hasObservers](self, "hasObservers"), displayLink = self->_displayLink, !v4))
  {
    -[CADisplayLink invalidate](displayLink, "invalidate");
    v5 = self->_displayLink;
    self->_displayLink = 0;

  }
  else if (!displayLink)
  {
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self->_displayLinkProxy, sel__displayLinkFire_);
    v6 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    v7 = self->_displayLink;
    self->_displayLink = v6;

    v8 = self->_displayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v8, "addToRunLoop:forMode:", v9, *MEMORY[0x1E0C99860]);

    v10 = self->_displayLink;
    v11 = CAFrameRateRangeMake(60.0, 60.0, 60.0);
    -[CADisplayLink setPreferredFrameRateRange:](v10, "setPreferredFrameRateRange:", *(double *)&v11.minimum, *(double *)&v11.maximum, *(double *)&v11.preferred);
  }
}

- (void)_animationTimerFired:(id)a3
{
  objc_msgSend(a3, "timestamp");
  -[ISAnimatedImageTimer _fireTimerWithInterval:](self, "_fireTimerWithInterval:");
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLinkProxy, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

uint64_t __47__ISAnimatedImageTimer__fireTimerWithInterval___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setTimestamp:", *(double *)(a1 + 32));
}

uint64_t __47__ISAnimatedImageTimer__fireTimerWithInterval___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__ISAnimatedImageTimer__fireTimerWithInterval___block_invoke_3;
  v3[3] = &__block_descriptor_40_e30_v16__0__ISAnimatedImageTimer_8l;
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "performChanges:", v3);
}

uint64_t __47__ISAnimatedImageTimer__fireTimerWithInterval___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setTimestamp:", *(double *)(a1 + 32));
}

uint64_t __42__ISAnimatedImageTimer__updateDisplayLink__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_iosUpdateDisplayLink");
}

+ (id)sharedTimer
{
  if (sharedTimer_onceToken != -1)
    dispatch_once(&sharedTimer_onceToken, &__block_literal_global_2757);
  return (id)sharedTimer__sharedTimer;
}

void __35__ISAnimatedImageTimer_sharedTimer__block_invoke()
{
  ISAnimatedImageTimer *v0;
  void *v1;

  v0 = objc_alloc_init(ISAnimatedImageTimer);
  v1 = (void *)sharedTimer__sharedTimer;
  sharedTimer__sharedTimer = (uint64_t)v0;

}

@end
