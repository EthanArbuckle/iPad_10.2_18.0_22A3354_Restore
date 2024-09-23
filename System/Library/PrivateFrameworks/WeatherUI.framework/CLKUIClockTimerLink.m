@implementation CLKUIClockTimerLink

- (CLKUIClockTimerLink)initWithUpdateHandler:(id)a3
{
  id v4;
  CLKUIClockTimerLink *v5;
  void *v6;
  id updateHandler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLKUIClockTimerLink;
  v5 = -[CLKUIRenderFrequencyLink init](&v9, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    updateHandler = v5->_updateHandler;
    v5->_updateHandler = v6;

  }
  return v5;
}

- (void)updateCoordinator
{
  void *v3;
  CLKClockTimerToken *timerToken;
  unint64_t v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  id updateHandler;
  CLKClockTimerToken *v10;
  CLKClockTimerToken *v11;
  void *v12;
  _QWORD v13[5];
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CLKUIClockTimerLink;
  -[CLKUIRenderFrequencyLink updateCoordinator](&v14, sel_updateCoordinator);
  objc_msgSend(MEMORY[0x1E0C94130], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopUpdatesForToken:", self->_timerToken);

  timerToken = self->_timerToken;
  self->_timerToken = 0;

  if (!-[CLKUIRenderFrequencyLink isPaused](self, "isPaused"))
  {
    v5 = -[CLKUIRenderFrequencyLink preferredFramesPerSecond](self, "preferredFramesPerSecond");
    v6 = -[CLKUIClockTimerLink _updateFrequencyForFPS:](self, "_updateFrequencyForFPS:", v5);
    if ((v6 & 0x8000000000000000) == 0)
    {
      v7 = v6;
      objc_msgSend(MEMORY[0x1E0C94130], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      updateHandler = self->_updateHandler;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __40__CLKUIClockTimerLink_updateCoordinator__block_invoke;
      v13[3] = &__block_descriptor_40_e15___NSString_8__0l;
      v13[4] = v5;
      objc_msgSend(v8, "startUpdatesWithUpdateFrequency:withHandler:identificationLog:", v7, updateHandler, v13);
      v10 = (CLKClockTimerToken *)objc_claimAutoreleasedReturnValue();
      v11 = self->_timerToken;
      self->_timerToken = v10;

      objc_msgSend(MEMORY[0x1E0C94130], "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setHandler:wantsCommit:", self->_timerToken, 1);

    }
  }
}

uint64_t __40__CLKUIClockTimerLink_updateCoordinator__block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CLKClockTimerLink %ldfps Clock Timer Callback"), *(_QWORD *)(a1 + 32));
}

- (void)invalidate
{
  void *v3;
  CLKClockTimerToken *timerToken;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLKUIClockTimerLink;
  -[CLKUIRenderFrequencyLink invalidate](&v5, sel_invalidate);
  if (self->_timerToken)
  {
    objc_msgSend(MEMORY[0x1E0C94130], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopUpdatesForToken:", self->_timerToken);

    timerToken = self->_timerToken;
    self->_timerToken = 0;

  }
}

- (int64_t)_updateFrequencyForFPS:(int64_t)a3
{
  int64_t v3;
  uint64_t v4;

  v3 = 4;
  v4 = -1;
  if (a3 == 30)
    v4 = 3;
  if (a3 != 60)
    v3 = v4;
  if (a3 == 15)
    return 2;
  else
    return v3;
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_timerToken, 0);
}

@end
