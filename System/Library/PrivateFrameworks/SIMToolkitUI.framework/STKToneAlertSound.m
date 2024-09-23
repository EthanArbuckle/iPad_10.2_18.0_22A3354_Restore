@implementation STKToneAlertSound

- (STKToneAlertSound)initWithType:(int64_t)a3 duration:(double)a4
{
  STKToneAlertSound *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STKToneAlertSound;
  result = -[STKBaseSound initWithDuration:](&v6, sel_initWithDuration_, a4);
  if (result)
    result->_alertType = a3;
  return result;
}

- (void)_reallyPlaySound
{
  _BOOL4 v3;
  void *v4;
  TLAlert *v5;
  TLAlert *alert;
  NSObject *v7;
  TLAlert *v8;
  TLAlert *v9;
  _QWORD v10[5];
  id v11;
  id location;
  uint8_t buf[4];
  STKToneAlertSound *v14;
  __int16 v15;
  TLAlert *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = -[STKBaseSound playsOnce](self, "playsOnce");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB8CA8]), "initWithType:", self->_alertType);
  objc_msgSend(v4, "setVibrationIdentifier:", *MEMORY[0x24BEB8DD8]);
  objc_msgSend(v4, "setShouldRepeat:", !v3);
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BEB8CA0], "alertWithConfiguration:", v4);
  v5 = (TLAlert *)objc_claimAutoreleasedReturnValue();
  alert = self->_alert;
  self->_alert = v5;

  STKCommonLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = self->_alert;
    *(_DWORD *)buf = 134218240;
    v14 = self;
    v15 = 2048;
    v16 = v8;
    _os_log_impl(&dword_216439000, v7, OS_LOG_TYPE_DEFAULT, "<STKSound:%p> - Tone sound: %p", buf, 0x16u);
  }

  v9 = self->_alert;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __37__STKToneAlertSound__reallyPlaySound__block_invoke;
  v10[3] = &unk_24D563718;
  v10[4] = self;
  objc_copyWeak(&v11, &location);
  -[TLAlert playWithCompletionHandler:](v9, "playWithCompletionHandler:", v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __37__STKToneAlertSound__reallyPlaySound__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  id WeakRetained;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  STKCommonLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v10 = 134218498;
    v11 = v7;
    v12 = 2048;
    v13 = a2;
    v14 = 2114;
    v15 = v5;
    _os_log_impl(&dword_216439000, v6, OS_LOG_TYPE_DEFAULT, "<STKSound:%p> - Tone sound completion fired:  type:%ld, error:%{public}@", (uint8_t *)&v10, 0x20u);
  }

  v8 = *(id *)(a1 + 32);
  objc_sync_enter(v8);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_sync_stopSound");

  objc_sync_exit(v8);
}

- (void)_reallyStopSound
{
  TLAlert *alert;
  NSObject *v4;
  int v5;
  STKToneAlertSound *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  alert = self->_alert;
  if (alert)
  {
    if (!self->_finishedSoundNormally)
    {
      STKCommonLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = 134217984;
        v6 = self;
        _os_log_impl(&dword_216439000, v4, OS_LOG_TYPE_DEFAULT, "<STKSound:%p> - Actually stopping TL sound explicitly.", (uint8_t *)&v5, 0xCu);
      }

      -[TLAlert stop](self->_alert, "stop");
      alert = self->_alert;
    }
    self->_alert = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alert, 0);
}

@end
