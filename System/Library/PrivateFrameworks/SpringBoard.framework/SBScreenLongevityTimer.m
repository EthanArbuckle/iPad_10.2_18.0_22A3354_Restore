@implementation SBScreenLongevityTimer

- (SBScreenLongevityTimer)init
{
  SBScreenLongevityTimer *v2;
  uint64_t v3;
  SBScreenLongevitySettings *settings;
  double v5;
  double v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBScreenLongevityTimer;
  v2 = -[SBScreenLongevityTimer init](&v9, sel_init);
  if (v2)
  {
    +[SBScreenLongevityDomain rootSettings](SBScreenLongevityDomain, "rootSettings");
    v3 = objc_claimAutoreleasedReturnValue();
    settings = v2->_settings;
    v2->_settings = (SBScreenLongevitySettings *)v3;

    -[SBScreenLongevitySettings dimInterval](v2->_settings, "dimInterval");
    v2->_dimInterval = v5;
    -[SBScreenLongevitySettings waitInterval](v2->_settings, "waitInterval");
    v2->_waitInterval = v6;
    -[SBScreenLongevitySettings minimalFaceDetectionInterval](v2->_settings, "minimalFaceDetectionInterval");
    v2->_minimalFaceDetectionInterval = v7;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[SBScreenLongevityTimer invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBScreenLongevityTimer;
  -[SBScreenLongevityTimer dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  NSObject *v3;
  NSTimer *timer;
  int v5;
  SBScreenLongevityTimer *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (-[NSTimer isValid](self->_timer, "isValid"))
  {
    SBLogScreenLongevityController();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = self;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Dimming timer invalidate %{public}@", (uint8_t *)&v5, 0xCu);
    }

    -[NSTimer invalidate](self->_timer, "invalidate");
    timer = self->_timer;
    self->_timer = 0;

  }
}

- (BOOL)isValid
{
  return -[NSTimer isValid](self->_timer, "isValid");
}

- (double)elapsedTime
{
  _BOOL4 v3;
  double result;
  double v5;

  v3 = -[NSTimer isValid](self->_timer, "isValid");
  result = 0.0;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate", 0.0);
    return v5 - self->_startTime;
  }
  return result;
}

- (void)start
{
  NSObject *v3;
  double v4;
  id *v5;
  NSObject *v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  _QWORD block[5];
  id v11;
  uint8_t buf[4];
  SBScreenLongevityTimer *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  SBLogScreenLongevityController();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = self;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Dimming timer start %{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  self->_startTime = v4;
  if (self->_waitInterval >= self->_dimInterval)
  {
    objc_initWeak((id *)buf, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __31__SBScreenLongevityTimer_start__block_invoke;
    block[3] = &unk_1E8EA7838;
    block[4] = self;
    v5 = &v11;
    objc_copyWeak(&v11, (id *)buf);
    v6 = MEMORY[0x1E0C80D38];
    v7 = block;
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __31__SBScreenLongevityTimer_start__block_invoke_3;
    v8[3] = &unk_1E8EA7838;
    v8[4] = self;
    v5 = &v9;
    objc_copyWeak(&v9, (id *)buf);
    v6 = MEMORY[0x1E0C80D38];
    v7 = v8;
  }
  dispatch_async(v6, v7);
  objc_destroyWeak(v5);
  objc_destroyWeak((id *)buf);
}

void __31__SBScreenLongevityTimer_start__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  v4 = (void *)MEMORY[0x1E0C99E88];
  v5 = *(double *)(*(_QWORD *)(a1 + 32) + 56);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __31__SBScreenLongevityTimer_start__block_invoke_2;
  v9[3] = &unk_1E8E9FA90;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  objc_msgSend(v4, "scheduledTimerWithTimeInterval:repeats:block:", 0, v9, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 16);
  *(_QWORD *)(v7 + 16) = v6;

  objc_destroyWeak(&v10);
}

void __31__SBScreenLongevityTimer_start__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  LODWORD(v2) = objc_msgSend(WeakRetained, "_isValidCurrentTimer:", v3);

  if ((_DWORD)v2)
    objc_msgSend(WeakRetained, "dimTimerFired");

}

void __31__SBScreenLongevityTimer_start__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  v4 = (void *)MEMORY[0x1E0C99E88];
  v5 = *(double *)(*(_QWORD *)(a1 + 32) + 48);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __31__SBScreenLongevityTimer_start__block_invoke_4;
  v9[3] = &unk_1E8E9FA90;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  objc_msgSend(v4, "scheduledTimerWithTimeInterval:repeats:block:", 0, v9, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 16);
  *(_QWORD *)(v7 + 16) = v6;

  objc_destroyWeak(&v10);
}

void __31__SBScreenLongevityTimer_start__block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  LODWORD(v2) = objc_msgSend(WeakRetained, "_isValidCurrentTimer:", v3);

  if ((_DWORD)v2)
    objc_msgSend(WeakRetained, "startFaceDetection");

}

- (void)startFaceDetection
{
  NSObject *v3;
  int v4;
  SBScreenLongevityTimer *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  self->_currentFaceDetectionTimerInterval = self->_dimInterval
                                           - self->_waitInterval
                                           + self->_minimalFaceDetectionInterval;
  SBLogScreenLongevityController();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Dimming timer start face detection %{public}@", (uint8_t *)&v4, 0xCu);
  }

  -[SBScreenLongevityTimer scheduleFaceDetection](self, "scheduleFaceDetection");
}

- (void)dimTimerFired
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "dimTimerDidExpireForTimer:", self);

}

- (void)scheduleFaceDetection
{
  id WeakRetained;
  double v4;
  _QWORD block[5];
  id v6;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "faceDetectionTimerDidExpire:", self);

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  if (v4 - self->_startTime <= self->_dimInterval)
  {
    self->_currentFaceDetectionTimerInterval = self->_currentFaceDetectionTimerInterval * 0.5;
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__SBScreenLongevityTimer_scheduleFaceDetection__block_invoke;
    block[3] = &unk_1E8EA7838;
    block[4] = self;
    objc_copyWeak(&v6, &location);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  else
  {
    -[SBScreenLongevityTimer dimTimerFired](self, "dimTimerFired");
  }
}

void __47__SBScreenLongevityTimer_scheduleFaceDetection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  v4 = (void *)MEMORY[0x1E0C99E88];
  v5 = *(double *)(*(_QWORD *)(a1 + 32) + 24);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__SBScreenLongevityTimer_scheduleFaceDetection__block_invoke_2;
  v9[3] = &unk_1E8E9FA90;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  objc_msgSend(v4, "scheduledTimerWithTimeInterval:repeats:block:", 0, v9, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 16);
  *(_QWORD *)(v7 + 16) = v6;

  objc_destroyWeak(&v10);
}

void __47__SBScreenLongevityTimer_scheduleFaceDetection__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  LODWORD(v2) = objc_msgSend(WeakRetained, "_isValidCurrentTimer:", v3);

  if ((_DWORD)v2)
    objc_msgSend(WeakRetained, "scheduleFaceDetection");

}

- (BOOL)_isValidCurrentTimer:(id)a3
{
  if (self->_timer == a3)
    return objc_msgSend(a3, "isValid");
  else
    return 0;
}

- (SBScreenLongevityTimerDelegate)delegate
{
  return (SBScreenLongevityTimerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)waitInterval
{
  return self->_waitInterval;
}

- (void)setWaitInterval:(double)a3
{
  self->_waitInterval = a3;
}

- (double)dimInterval
{
  return self->_dimInterval;
}

- (void)setDimInterval:(double)a3
{
  self->_dimInterval = a3;
}

- (double)minimalFaceDetectionInterval
{
  return self->_minimalFaceDetectionInterval;
}

- (void)setMinimalFaceDetectionInterval:(double)a3
{
  self->_minimalFaceDetectionInterval = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
