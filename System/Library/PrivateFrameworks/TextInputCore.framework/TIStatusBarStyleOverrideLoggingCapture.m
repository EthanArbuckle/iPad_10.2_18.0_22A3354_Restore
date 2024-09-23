@implementation TIStatusBarStyleOverrideLoggingCapture

- (TIStatusBarStyleOverrideLoggingCapture)init
{
  TIStatusBarStyleOverrideLoggingCapture *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TIStatusBarStyleOverrideLoggingCapture;
  v2 = -[TIStatusBarStyleOverrideLoggingCapture init](&v4, sel_init);
  if (v2)
    objc_msgSend((id)objc_opt_class(), "acquireLoggingCaptureOverride");
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_opt_class(), "releaseLoggingCaptureOverride");
  v3.receiver = self;
  v3.super_class = (Class)TIStatusBarStyleOverrideLoggingCapture;
  -[TIStatusBarStyleOverrideLoggingCapture dealloc](&v3, sel_dealloc);
}

+ (int64_t)_loggingCaptureOverrideCountPtr
{
  return (int64_t *)&_loggingCaptureOverrideCountPtr_count;
}

+ (int64_t)_incrementLoggingCaptureOverride
{
  int64_t v3;

  v3 = *(_QWORD *)objc_msgSend(a1, "_loggingCaptureOverrideCountPtr");
  *(_QWORD *)objc_msgSend(a1, "_loggingCaptureOverrideCountPtr") = v3 + 1;
  return v3;
}

+ (int64_t)_decrementLoggingCaptureOverride
{
  int64_t *v3;
  int64_t v4;
  uint64_t v5;

  v3 = (int64_t *)objc_msgSend(a1, "_loggingCaptureOverrideCountPtr");
  v4 = *v3;
  if (*v3 <= 1)
    v5 = 1;
  else
    v5 = *v3;
  *(_QWORD *)objc_msgSend(a1, "_loggingCaptureOverrideCountPtr") = v5 - 1;
  return v4;
}

+ (void)_statusBarStyleOverrideLoggingCapture:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  const char *v5;
  pid_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  int v17;
  _DWORD v18[7];

  v3 = a3;
  *(_QWORD *)&v18[5] = *MEMORY[0x1E0C80C00];
  _sbsOverrideLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = "Release";
    if (v3)
      v5 = "Acquire";
    v17 = 136315138;
    *(_QWORD *)v18 = v5;
    _os_log_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_DEFAULT, "%s 'LoggingCapture' style override assertion", (uint8_t *)&v17, 0xCu);
  }

  v6 = _statusBarStyleOverrideLoggingCapture__pid;
  if (!_statusBarStyleOverrideLoggingCapture__pid)
  {
    v6 = getpid();
    _statusBarStyleOverrideLoggingCapture__pid = v6;
  }
  v7 = _statusBarStyleOverrideLoggingCapture__assertion;
  if (v6 && !_statusBarStyleOverrideLoggingCapture__assertion)
  {
    objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLForKey:", 54);

    if (v9)
      v10 = 0x8000;
    else
      v10 = 0x200000;
    objc_msgSend(MEMORY[0x1E0DAAFD8], "assertionWithStatusBarStyleOverrides:forPID:exclusive:showsWhenForeground:", v10, _statusBarStyleOverrideLoggingCapture__pid, 0, 1);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)_statusBarStyleOverrideLoggingCapture__assertion;
    _statusBarStyleOverrideLoggingCapture__assertion = v11;

    v6 = _statusBarStyleOverrideLoggingCapture__pid;
    v7 = _statusBarStyleOverrideLoggingCapture__assertion;
  }
  if (v6 && v7)
  {
    if (v3)
    {
      if (_statusBarStyleOverrideLoggingCapture__timer)
      {
        objc_msgSend((id)_statusBarStyleOverrideLoggingCapture__timer, "invalidate");
        v13 = (void *)_statusBarStyleOverrideLoggingCapture__timer;
        _statusBarStyleOverrideLoggingCapture__timer = 0;

      }
      if (!_statusBarStyleOverrideLoggingCapture__assertionAcquired)
      {
        objc_msgSend((id)_statusBarStyleOverrideLoggingCapture__assertion, "acquireWithHandler:invalidationHandler:", &__block_literal_global_12544, &__block_literal_global_10);
        objc_msgSend((id)_statusBarStyleOverrideLoggingCapture__assertion, "setStatusString:", CFSTR("Recording Keyboard Data"));
      }
    }
    else if (_statusBarStyleOverrideLoggingCapture__assertionAcquired && !_statusBarStyleOverrideLoggingCapture__timer)
    {
      objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, &__block_literal_global_15_12547, 2.0);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)_statusBarStyleOverrideLoggingCapture__timer;
      _statusBarStyleOverrideLoggingCapture__timer = v15;

    }
  }
  else
  {
    _sbsOverrideLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v17 = 67109376;
      v18[0] = _statusBarStyleOverrideLoggingCapture__pid;
      LOWORD(v18[1]) = 2048;
      *(_QWORD *)((char *)&v18[1] + 2) = _statusBarStyleOverrideLoggingCapture__assertion;
      _os_log_error_impl(&dword_1DA6F2000, v14, OS_LOG_TYPE_ERROR, "Couldn't get pid %d or assertion %p.", (uint8_t *)&v17, 0x12u);
    }

  }
}

+ (void)acquireLoggingCaptureOverride
{
  TIDispatchAsync();
}

+ (void)releaseLoggingCaptureOverride
{
  TIDispatchAsync();
}

uint64_t __71__TIStatusBarStyleOverrideLoggingCapture_releaseLoggingCaptureOverride__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_decrementLoggingCaptureOverride");
  if (result == 1)
    return objc_msgSend(*(id *)(a1 + 32), "_statusBarStyleOverrideLoggingCapture:", 0);
  return result;
}

uint64_t __71__TIStatusBarStyleOverrideLoggingCapture_acquireLoggingCaptureOverride__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_incrementLoggingCaptureOverride");
  if (!result)
    return objc_msgSend(*(id *)(a1 + 32), "_statusBarStyleOverrideLoggingCapture:", 1);
  return result;
}

uint64_t __80__TIStatusBarStyleOverrideLoggingCapture__statusBarStyleOverrideLoggingCapture___block_invoke_13()
{
  uint64_t result;

  result = objc_msgSend((id)_statusBarStyleOverrideLoggingCapture__assertion, "invalidate");
  _statusBarStyleOverrideLoggingCapture__assertionAcquired = 0;
  return result;
}

void __80__TIStatusBarStyleOverrideLoggingCapture__statusBarStyleOverrideLoggingCapture___block_invoke_8()
{
  NSObject *v0;
  uint8_t v1[16];

  _sbsOverrideLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1DA6F2000, v0, OS_LOG_TYPE_DEFAULT, "'LoggingCapture' style override assertion was invalidated.", v1, 2u);
  }

  _statusBarStyleOverrideLoggingCapture__assertionAcquired = 0;
}

void __80__TIStatusBarStyleOverrideLoggingCapture__statusBarStyleOverrideLoggingCapture___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  const char *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _sbsOverrideLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = "Failed to acquire";
    if (a2)
      v4 = "Acquired";
    v5 = 136315138;
    v6 = v4;
    _os_log_impl(&dword_1DA6F2000, v3, OS_LOG_TYPE_DEFAULT, "%s 'LoggingCapture' style override assertion.", (uint8_t *)&v5, 0xCu);
  }

  _statusBarStyleOverrideLoggingCapture__assertionAcquired = a2;
}

@end
