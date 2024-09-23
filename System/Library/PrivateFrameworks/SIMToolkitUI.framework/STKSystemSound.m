@implementation STKSystemSound

- (id)initForSystemSoundID:(unsigned int)a3 duration:(double)a4
{
  id result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STKSystemSound;
  result = -[STKBaseSound initWithDuration:](&v6, sel_initWithDuration_, a4);
  if (result)
    *((_DWORD *)result + 7) = a3;
  return result;
}

- (void)_reallyPlaySound
{
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  STKSystemSound *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = -[STKBaseSound playsOnce](self, "playsOnce");
  STKCommonLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = *(_DWORD *)(&self->super._isPlaying + 3);
      v9 = 134218240;
      v10 = self;
      v11 = 1024;
      v12 = v6;
      _os_log_impl(&dword_216439000, v4, OS_LOG_TYPE_DEFAULT, "<STKSound:%p> - Playing %d sound once.", (uint8_t *)&v9, 0x12u);
    }

    AudioServicesPlaySystemSound(*(_DWORD *)(&self->super._isPlaying + 3));
  }
  else
  {
    if (v5)
    {
      v7 = *(_DWORD *)(&self->super._isPlaying + 3);
      -[STKBaseSound duration](self, "duration");
      v9 = 134218496;
      v10 = self;
      v11 = 1024;
      v12 = v7;
      v13 = 2048;
      v14 = v8;
      _os_log_impl(&dword_216439000, v4, OS_LOG_TYPE_DEFAULT, "<STKSound:%p> - Playing %d sound until we tell it to stop (in %f seconds)", (uint8_t *)&v9, 0x1Cu);
    }

    AudioServicesStartSystemSound();
  }
}

- (void)_reallyStopSound
{
  NSObject *v3;
  int v4;
  STKSystemSound *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  STKCommonLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = self;
    _os_log_impl(&dword_216439000, v3, OS_LOG_TYPE_DEFAULT, "<STKSound:%p> - Actually stopping system sound explicitly.", (uint8_t *)&v4, 0xCu);
  }

  AudioServicesStopSystemSound();
}

@end
