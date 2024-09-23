@implementation PKRenderLoop

- (void)_drawWithDisplayLink:(uint64_t)a1
{
  id v3;
  double v4;
  id v5;

  v3 = a2;
  if (a1 && v3 && *(id *)(a1 + 24) == v3)
  {
    v5 = v3;
    objc_msgSend(v3, "targetTimestamp");
    -[PKRenderLoop _drawAtTime:](a1, v4);
    v3 = v5;
  }

}

- (void)_drawAtTime:(uint64_t)a1
{
  void *v4;
  id WeakRetained;

  if (a1)
  {
    if (!*(_BYTE *)(a1 + 38))
    {
      v4 = (void *)MEMORY[0x2199BAF4C]();
      *(_BYTE *)(a1 + 16) = 1;
      objc_msgSend((id)a1, "_willDraw");
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      objc_msgSend(WeakRetained, "renderLoop:drawAtTime:", a1, a2);

      *(_BYTE *)(a1 + 16) = 0;
      objc_msgSend((id)a1, "_didDraw");
      objc_autoreleasePoolPop(v4);
    }
  }
}

- (BOOL)effectiveIsPaused
{
  return self->_effectivePaused;
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    -[PKRenderLoop _updateEffectivePausedState]((uint64_t)self);
  }
}

- (void)setDelegate:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  objc_storeWeak((id *)&self->_delegate, v6);
  v4 = v6;
  if (v6)
  {
    self->_delegateObservesEffectivePaused = objc_opt_respondsToSelector() & 1;
    v5 = objc_opt_respondsToSelector();
    v4 = v6;
  }
  else
  {
    v5 = 0;
    self->_delegateObservesEffectivePaused = 0;
  }
  self->_delegateObservesRunnable = v5 & 1;

}

- (PKRenderLoop)init
{
  char *v2;
  PKRenderLoop *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKRenderLoop;
  v2 = -[PKRenderLoop init](&v6, sel_init);
  v3 = (PKRenderLoop *)v2;
  if (v2)
  {
    *(_WORD *)(v2 + 37) = 257;
    v2[34] = 1;
    v4 = MEMORY[0x24BDE5430];
    *((_QWORD *)v2 + 8) = *MEMORY[0x24BDE5430];
    *((_DWORD *)v2 + 18) = *(_DWORD *)(v4 + 8);
    -[PKRenderLoop _updateBackgroundState]((uint64_t)v2);
  }
  return v3;
}

- (BOOL)attachToWindowScene:(id)a3
{
  id v4;
  char v5;
  id WeakRetained;
  void *v7;
  CADisplayLink *displayLink;

  v4 = a3;
  if (!self->_invalidated)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    if (WeakRetained != v4)
    {
      objc_storeWeak((id *)&self->_windowScene, v4);
      -[PKRenderLoop _resetBackgroundState]((uint64_t)self);
LABEL_5:
      objc_msgSend(v4, "screen");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[PKRenderLoop _attachToScreen:]((uint64_t)self, v7);

LABEL_6:
      goto LABEL_7;
    }
    displayLink = self->_displayLink;
    if (v4)
    {
      if (!displayLink)
        goto LABEL_5;
    }
    else if (displayLink)
    {
      goto LABEL_5;
    }
    v5 = displayLink != 0;
    goto LABEL_6;
  }
  v5 = 0;
LABEL_7:

  return v5;
}

- (void)_resetBackgroundState
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  id WeakRetained;
  id v9;

  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v2 = (_QWORD *)MEMORY[0x24BDF7D30];
    v3 = (_QWORD *)MEMORY[0x24BDF7D20];
    v4 = (_QWORD *)MEMORY[0x24BDF7D18];
    v5 = (_QWORD *)MEMORY[0x24BDF7D38];
    v6 = (_QWORD *)MEMORY[0x24BDF7D40];
    v7 = (_QWORD *)MEMORY[0x24BDF7D28];
    if (*(_BYTE *)(a1 + 32))
    {
      objc_msgSend(v9, "removeObserver:name:object:", a1, *MEMORY[0x24BDF7D30], 0);
      objc_msgSend(v9, "removeObserver:name:object:", a1, *v3, 0);
      objc_msgSend(v9, "removeObserver:name:object:", a1, *v4, 0);
      objc_msgSend(v9, "removeObserver:name:object:", a1, *v5, 0);
      objc_msgSend(v9, "removeObserver:name:object:", a1, *v6, 0);
      objc_msgSend(v9, "removeObserver:name:object:", a1, *v7, 0);
      *(_BYTE *)(a1 + 32) = 0;
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      *(_BYTE *)(a1 + 32) = 1;
      objc_msgSend(v9, "addObserver:selector:name:object:", a1, sel__sceneWillConnect_, *v2, WeakRetained);
      objc_msgSend(v9, "addObserver:selector:name:object:", a1, sel__sceneDidDisconnect_, *v3, WeakRetained);
      objc_msgSend(v9, "addObserver:selector:name:object:", a1, sel__sceneDidActivate_, *v4, WeakRetained);
      objc_msgSend(v9, "addObserver:selector:name:object:", a1, sel__sceneWillDeactivate_, *v5, WeakRetained);
      objc_msgSend(v9, "addObserver:selector:name:object:", a1, sel__sceneWillEnterForeground_, *v6, WeakRetained);
      objc_msgSend(v9, "addObserver:selector:name:object:", a1, sel__sceneDidEnterBackground_, *v7, WeakRetained);
    }
    -[PKRenderLoop _updateBackgroundState](a1);

  }
}

- (uint64_t)_attachToScreen:(uint64_t)a1
{
  id v3;
  id WeakRetained;
  void *v5;
  void **v6;
  void *v7;
  id *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  BOOL v16;

  v3 = a2;
  if (!a1)
    goto LABEL_21;
  if (*(_BYTE *)(a1 + 17))
  {
    a1 = 0;
    goto LABEL_21;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained != v3)
  {
    v6 = (void **)(a1 + 24);
    v5 = *(void **)(a1 + 24);
    if (!v5)
      goto LABEL_7;
    goto LABEL_6;
  }
  v6 = (void **)(a1 + 24);
  v5 = *(void **)(a1 + 24);
  if (v3)
  {
    if (!v5)
    {
      objc_storeWeak((id *)(a1 + 56), v3);
      goto LABEL_8;
    }
LABEL_16:
    v16 = v5 == 0;
    goto LABEL_17;
  }
  if (!v5)
    goto LABEL_16;
LABEL_6:
  objc_msgSend(v5, "invalidate");
  v7 = *v6;
  *v6 = 0;

LABEL_7:
  objc_storeWeak((id *)(a1 + 56), v3);
  if (v3)
  {
LABEL_8:
    v8 = -[PKDisplayLinkTargetProxy initWithTarget:]((id *)[PKDisplayLinkTargetProxy alloc], (void *)a1);
    objc_msgSend(v3, "displayLinkWithTarget:selector:", v8, sel_drawWithDisplayLink_);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v9;

    objc_msgSend(*(id *)(a1 + 24), "setPaused:", *(unsigned __int8 *)(a1 + 38));
    LODWORD(v11) = *(_DWORD *)(a1 + 64);
    LODWORD(v12) = *(_DWORD *)(a1 + 68);
    LODWORD(v13) = *(_DWORD *)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 24), "setPreferredFrameRateRange:", v11, v12, v13);
    if (*(_BYTE *)(a1 + 33))
      objc_msgSend(*(id *)(a1 + 24), "setHighFrameRateReason:", *(unsigned int *)(a1 + 40));
    v14 = *(void **)(a1 + 24);
    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addToRunLoop:forMode:", v15, *MEMORY[0x24BDBCB80]);

  }
  -[PKRenderLoop _updateEffectivePausedState](a1);
  v16 = *(_BYTE *)(a1 + 39) == 0;
LABEL_17:
  a1 = !v16;

LABEL_21:
  return a1;
}

- (void)_updateBackgroundState
{
  uint64_t v2;
  id WeakRetained;

  if (a1)
  {
    *(_BYTE *)(a1 + 34) = 1;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      v2 = objc_msgSend(WeakRetained, "activationState");
      if ((unint64_t)(v2 + 1) <= 3)
        *(_BYTE *)(a1 + 34) = 0x1000001u >> (8 * (v2 + 1));
    }
    -[PKRenderLoop _updateEffectivePausedState](a1);

  }
}

- (void)_updateEffectivePausedState
{
  int v2;
  int v3;
  int v4;
  int v5;
  id v6;
  id WeakRetained;

  if (a1)
  {
    if (*(_BYTE *)(a1 + 17)
      || !*(_QWORD *)(a1 + 24)
      || !CAFrameRateRangeIsEqualToRange(*(CAFrameRateRange *)(a1 + 64), *MEMORY[0x24BDE5430])
      && *(float *)(a1 + 68) <= 0.0
      || *(_BYTE *)(a1 + 34))
    {
      v2 = 1;
    }
    else
    {
      v2 = objc_msgSend((id)a1, "_isForcingPause");
    }
    v3 = v2 ^ 1;
    v4 = *(unsigned __int8 *)(a1 + 39);
    if (v4 != (v2 ^ 1))
      *(_BYTE *)(a1 + 39) = v3;
    v5 = (v2 & 1) != 0 || *(_BYTE *)(a1 + 37) != 0;
    if (*(unsigned __int8 *)(a1 + 38) == v5)
    {
      if (v4 != v3 && *(_BYTE *)(a1 + 36))
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
        objc_msgSend(WeakRetained, "renderLoop:didChangeRunnable:", a1, *(unsigned __int8 *)(a1 + 39));
LABEL_18:

      }
    }
    else
    {
      *(_BYTE *)(a1 + 38) = v5;
      objc_msgSend(*(id *)(a1 + 24), "setPaused:");
      if (v4 != v3 && *(_BYTE *)(a1 + 36))
      {
        v6 = objc_loadWeakRetained((id *)(a1 + 8));
        objc_msgSend(v6, "renderLoop:didChangeRunnable:", a1, *(unsigned __int8 *)(a1 + 39));

      }
      if (*(_BYTE *)(a1 + 35))
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
        objc_msgSend(WeakRetained, "renderLoop:didChangeEffectivePaused:", a1, *(unsigned __int8 *)(a1 + 38));
        goto LABEL_18;
      }
    }
  }
}

- (BOOL)_isForcingPause
{
  return 0;
}

- (BOOL)isRunnable
{
  return self->_runnable;
}

- (UIScreen)screen
{
  return (UIScreen *)objc_loadWeakRetained((id *)&self->_screen);
}

- (void)_setNeedsForcingPauseUpdate
{
  if (a1)
    -[PKRenderLoop _updateEffectivePausedState](a1);
}

- (void)setPreferredFrameRateRange:(CAFrameRateRange)a3
{
  float preferred;
  float maximum;
  float minimum;
  double v7;
  double v8;
  double v9;

  preferred = a3.preferred;
  maximum = a3.maximum;
  minimum = a3.minimum;
  if (!CAFrameRateRangeIsEqualToRange(self->_preferredFrameRateRange, a3))
  {
    self->_preferredFrameRateRange.minimum = minimum;
    self->_preferredFrameRateRange.maximum = maximum;
    self->_preferredFrameRateRange.preferred = preferred;
    *(float *)&v7 = minimum;
    *(float *)&v8 = maximum;
    *(float *)&v9 = preferred;
    -[CADisplayLink setPreferredFrameRateRange:](self->_displayLink, "setPreferredFrameRateRange:", v7, v8, v9);
    -[PKRenderLoop _updateEffectivePausedState]((uint64_t)self);
  }
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[PKRenderLoop invalidate](self, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)PKRenderLoop;
  -[PKRenderLoop dealloc](&v4, sel_dealloc);
}

- (void)invalidate
{
  CADisplayLink *displayLink;
  CADisplayLink *v4;

  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    -[PKRenderLoop _didInvalidate](self, "_didInvalidate");
    objc_storeWeak((id *)&self->_screen, 0);
    displayLink = self->_displayLink;
    if (displayLink)
    {
      -[CADisplayLink invalidate](displayLink, "invalidate");
      v4 = self->_displayLink;
      self->_displayLink = 0;

    }
    -[PKRenderLoop _updateEffectivePausedState]((uint64_t)self);
  }
}

- (void)setHighFrameRateReason:(unsigned int)a3
{
  self->_hasHighFrameRateReason = 1;
  self->_highFrameRateReason = a3;
  -[CADisplayLink setHighFrameRateReason:](self->_displayLink, "setHighFrameRateReason:");
}

- (void)_sceneWillEnterForeground:(id)a3
{
  self->_background = 0;
  -[PKRenderLoop _updateEffectivePausedState]((uint64_t)self);
}

- (UIWindowScene)windowScene
{
  return (UIWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (BOOL)isDrawing
{
  return self->_drawing;
}

- (CAFrameRateRange)preferredFrameRateRange
{
  float minimum;
  float maximum;
  float preferred;
  CAFrameRateRange result;

  minimum = self->_preferredFrameRateRange.minimum;
  maximum = self->_preferredFrameRateRange.maximum;
  preferred = self->_preferredFrameRateRange.preferred;
  result.preferred = preferred;
  result.maximum = maximum;
  result.minimum = minimum;
  return result;
}

- (PKRenderLoopDelegate)delegate
{
  return (PKRenderLoopDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unsigned)highFrameRateReason
{
  return self->_highFrameRateReason;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_screen);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
