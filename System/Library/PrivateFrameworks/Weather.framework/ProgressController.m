@implementation ProgressController

+ (id)sharedProgressController
{
  void *v2;
  ProgressController *v3;
  void *v4;

  v2 = (void *)sharedProgressController_sharedProgressController;
  if (!sharedProgressController_sharedProgressController)
  {
    v3 = objc_alloc_init(ProgressController);
    v4 = (void *)sharedProgressController_sharedProgressController;
    sharedProgressController_sharedProgressController = (uint64_t)v3;

    v2 = (void *)sharedProgressController_sharedProgressController;
  }
  return v2;
}

- (void)_setHideSpinnerTimer:(id)a3
{
  NSTimer *v5;
  NSTimer *v6;
  NSTimer **p_hideSpinnerTimer;
  NSTimer *hideSpinnerTimer;
  NSTimer *v9;

  v5 = (NSTimer *)a3;
  hideSpinnerTimer = self->_hideSpinnerTimer;
  p_hideSpinnerTimer = &self->_hideSpinnerTimer;
  v6 = hideSpinnerTimer;
  if (hideSpinnerTimer != v5)
  {
    v9 = v5;
    -[NSTimer invalidate](v6, "invalidate");
    objc_storeStrong((id *)p_hideSpinnerTimer, a3);
    v5 = v9;
  }

}

- (void)_hideSpinner
{
  -[ProgressController _setHideSpinnerTimer:](self, "_setHideSpinnerTimer:", 0);
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "setStatusBarShowsProgress:", 0);
}

- (void)_showSpinner
{
  -[ProgressController _setHideSpinnerTimer:](self, "_setHideSpinnerTimer:", 0);
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "setStatusBarShowsProgress:", 1);
}

- (void)setLoadingData:(BOOL)a3
{
  _BOOL4 v3;
  int loadingCount;
  int *p_loadingCount;
  int v7;
  NSObject *v8;
  int v9;
  void *v10;

  v3 = a3;
  p_loadingCount = &self->_loadingCount;
  loadingCount = self->_loadingCount;
  if (a3)
    v7 = loadingCount + 1;
  else
    v7 = loadingCount - 1;
  *p_loadingCount = v7;
  WALogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ProgressController setLoadingData:].cold.1(v3, p_loadingCount, v8);

  v9 = *p_loadingCount;
  if (v3)
  {
    if (v9 >= 1)
    {
      if (!self->_progressShowing)
        -[ProgressController _showSpinner](self, "_showSpinner");
      self->_progressShowing = 1;
    }
  }
  else if (!v9)
  {
    if (self->_progressShowing)
    {
      objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__hideSpinner, 0, 0, 0.1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ProgressController _setHideSpinnerTimer:](self, "_setHideSpinnerTimer:", v10);

    }
    self->_progressShowing = 0;
  }
}

- (void)suspend
{
  if (self->_progressShowing)
    -[ProgressController _hideSpinner](self, "_hideSpinner");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hideSpinnerTimer, 0);
}

- (void)setLoadingData:(os_log_t)log .cold.1(char a1, int *a2, os_log_t log)
{
  const __CFString *v3;
  int v4;
  int v5;
  const __CFString *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("NO");
  v4 = *a2;
  if ((a1 & 1) != 0)
    v3 = CFSTR("YES");
  v5 = 138412546;
  v6 = v3;
  v7 = 1024;
  v8 = v4;
  _os_log_debug_impl(&dword_21AAEC000, log, OS_LOG_TYPE_DEBUG, "loading %@, count = %d", (uint8_t *)&v5, 0x12u);
}

@end
