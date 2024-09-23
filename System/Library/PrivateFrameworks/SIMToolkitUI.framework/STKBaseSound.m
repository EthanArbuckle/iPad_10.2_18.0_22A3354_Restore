@implementation STKBaseSound

- (STKBaseSound)initWithDuration:(double)a3
{
  STKBaseSound *v4;
  STKBaseSound *v5;
  NSObject *v6;
  _BOOL4 playsOnce;
  objc_super v9;
  uint8_t buf[4];
  STKBaseSound *v11;
  __int16 v12;
  double v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v9.receiver = self;
  v9.super_class = (Class)STKBaseSound;
  v4 = -[STKBaseSound init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_duration = a3;
    v4->_playsOnce = BSFloatLessThanOrEqualToFloat();
    STKCommonLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      playsOnce = v5->_playsOnce;
      *(_DWORD *)buf = 134218496;
      v11 = v5;
      v12 = 2048;
      v13 = a3;
      v14 = 1024;
      v15 = playsOnce;
      _os_log_impl(&dword_216439000, v6, OS_LOG_TYPE_DEFAULT, "<STKSound:%p> - Created sound with duration: %f, playsOnce: %d", buf, 0x1Cu);
    }

  }
  return v5;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  STKBaseSound *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  STKCommonLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_216439000, v3, OS_LOG_TYPE_DEFAULT, "<STKSound:%p> - Dealloc.", buf, 0xCu);
  }

  -[STKBaseSound stopSound](self, "stopSound");
  v4.receiver = self;
  v4.super_class = (Class)STKBaseSound;
  -[STKBaseSound dealloc](&v4, sel_dealloc);
}

- (void)playSound
{
  STKBaseSound *obj;

  obj = self;
  objc_sync_enter(obj);
  -[STKBaseSound _sync_playSound](obj, "_sync_playSound");
  objc_sync_exit(obj);

}

- (void)stopSound
{
  STKBaseSound *obj;

  obj = self;
  objc_sync_enter(obj);
  -[STKBaseSound _sync_stopSound](obj, "_sync_stopSound");
  objc_sync_exit(obj);

}

- (void)_sync_playSound
{
  NSObject *v3;
  NSObject *v4;
  double duration;
  void *v6;
  double v7;
  void *v8;
  BSTimer *v9;
  BSTimer *timer;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  STKBaseSound *v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[STKBaseSound _sync_stopSound](self, "_sync_stopSound");
  if (!self->_isPlaying)
  {
    STKCommonLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v14 = self;
      _os_log_impl(&dword_216439000, v3, OS_LOG_TYPE_DEFAULT, "<STKSound:%p> - Playing sound.", buf, 0xCu);
    }

    self->_isPlaying = 1;
    -[STKBaseSound _reallyPlaySound](self, "_reallyPlaySound");
    if (!self->_playsOnce)
    {
      STKCommonLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        duration = self->_duration;
        *(_DWORD *)buf = 134218240;
        v14 = self;
        v15 = 2048;
        v16 = duration;
        _os_log_impl(&dword_216439000, v4, OS_LOG_TYPE_DEFAULT, "<STKSound:%p> - Scheduling sound stop timer with interval duration: %f.", buf, 0x16u);
      }

      objc_initWeak((id *)buf, self);
      v6 = (void *)MEMORY[0x24BE0BEB0];
      v7 = self->_duration;
      dispatch_get_global_queue(33, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __31__STKBaseSound__sync_playSound__block_invoke;
      v11[3] = &unk_24D5636F0;
      v11[4] = self;
      objc_copyWeak(&v12, (id *)buf);
      objc_msgSend(v6, "scheduledTimerWithFireInterval:queue:handler:", v8, v11, v7);
      v9 = (BSTimer *)objc_claimAutoreleasedReturnValue();
      timer = self->_timer;
      self->_timer = v9;

      objc_destroyWeak(&v12);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __31__STKBaseSound__sync_playSound__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  STKCommonLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_216439000, v2, OS_LOG_TYPE_DEFAULT, "<STKSound:%p> - Stop timer fired!.", (uint8_t *)&v5, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "stopSound");

}

- (void)_sync_stopSound
{
  NSObject *v3;
  BSTimer *timer;
  int v5;
  STKBaseSound *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (self->_isPlaying)
  {
    STKCommonLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 134217984;
      v6 = self;
      _os_log_impl(&dword_216439000, v3, OS_LOG_TYPE_DEFAULT, "<STKSound:%p> - Stopping sound explicitly.", (uint8_t *)&v5, 0xCu);
    }

    -[STKBaseSound _reallyStopSound](self, "_reallyStopSound");
    self->_isPlaying = 0;
    -[BSTimer cancel](self->_timer, "cancel");
    timer = self->_timer;
    self->_timer = 0;

  }
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)playsOnce
{
  return self->_playsOnce;
}

- (BOOL)isPlaying
{
  return self->_isPlaying;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
