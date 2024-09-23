@implementation TSClockPulser

- (TSClockPulser)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[TSClockPulser init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Do not call %@"), v5);

  return 0;
}

- (TSClockPulser)initWithPulseClock:(id)a3
{
  id v5;
  TSClockPulser *v6;
  task_t *v7;
  NSObject *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TSClockPulser;
  v6 = -[TSClockPulser init](&v10, sel_init);
  if (v6)
  {
    v7 = (task_t *)MEMORY[0x1E0C83DA0];
    if (semaphore_create(*MEMORY[0x1E0C83DA0], &v6->_startSemaphore, 0, 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v12 = "status == KERN_SUCCESS";
        v13 = 2048;
        v14 = 0;
        v15 = 2048;
        v16 = 0;
        v17 = 2080;
        v18 = "";
        v19 = 2080;
        v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/Utilities/TSClockPulser.m";
        v21 = 1024;
        v22 = 69;
        v9 = MEMORY[0x1E0C81028];
LABEL_10:
        _os_log_impl(&dword_1B56CB000, v9, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
      }
    }
    else
    {
      if (!semaphore_create(*v7, &v6->_stopSemaphore, 0, 0))
      {
        objc_storeStrong((id *)&v6->_pulseClock, a3);
        v6->_pulsePeriod = 1000000000;
        goto LABEL_5;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v12 = "status == KERN_SUCCESS";
        v13 = 2048;
        v14 = 0;
        v15 = 2048;
        v16 = 0;
        v17 = 2080;
        v18 = "";
        v19 = 2080;
        v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/Utilities/TSClockPulser.m";
        v21 = 1024;
        v22 = 71;
        v9 = MEMORY[0x1E0C81028];
        goto LABEL_10;
      }
    }

    v6 = 0;
  }
LABEL_5:

  return v6;
}

- (BOOL)startPulsing
{
  _QWORD v4[5];

  if (-[TSClockPulser pulsePeriod](self, "pulsePeriod") < 0xF4240)
    return 0;
  -[TSClock addClient:](self->_pulseClock, "addClient:", self);
  self->_threadShouldBeRunning = 1;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __29__TSClockPulser_startPulsing__block_invoke;
  v4[3] = &unk_1E694AF60;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0CB3978], "detachNewThreadWithBlock:", v4);
  MEMORY[0x1B5E4EA20](self->_startSemaphore);
  return self->_threadIsRunning;
}

uint64_t __29__TSClockPulser_startPulsing__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pulseThread");
}

- (BOOL)stopPulsing
{
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_threadIsRunning)
  {
    self->_threadShouldBeRunning = 0;
    MEMORY[0x1B5E4EA20](self->_stopSemaphore, a2);
    self->_lastLockState = 0;
    -[TSClock removeClient:](self->_pulseClock, "removeClient:", self);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136316418;
    v5 = "_threadIsRunning";
    v6 = 2048;
    v7 = 0;
    v8 = 2048;
    v9 = 0;
    v10 = 2080;
    v11 = "";
    v12 = 2080;
    v13 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/Utilities/TSClockPulser.m";
    v14 = 1024;
    v15 = 106;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v4, 0x3Au);
  }
  return !self->_threadIsRunning;
}

- (void)didChangeClockMasterForClock:(id)a3
{
  uint8_t v3[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Changed master clock", v3, 2u);
  }
}

- (void)didChangeLockStateTo:(int)a3 forClock:(id)a4
{
  id v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = a3;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Change lock state to %u", (uint8_t *)v7, 8u);
  }
  self->_holdoverMode = a3 != 2;

}

- (void)didBeginClockGrandmasterChangeForClock:(id)a3
{
  uint8_t v3[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Begin grandmaster change", v3, 2u);
  }
}

- (void)didEndClockGrandmasterChangeForClock:(id)a3
{
  uint8_t v3[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "End grandmaster change", v3, 2u);
  }
}

- (void)pulseThread
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to convert pulse thread to realtime. Error 0x%08x\n", (uint8_t *)v1, 8u);
}

- (void)dealloc
{
  semaphore_t startSemaphore;
  task_t *v4;
  semaphore_t stopSemaphore;
  objc_super v6;

  startSemaphore = self->_startSemaphore;
  v4 = (task_t *)MEMORY[0x1E0C83DA0];
  if (startSemaphore)
  {
    semaphore_destroy(*MEMORY[0x1E0C83DA0], startSemaphore);
    self->_startSemaphore = 0;
  }
  stopSemaphore = self->_stopSemaphore;
  if (stopSemaphore)
  {
    semaphore_destroy(*v4, stopSemaphore);
    self->_stopSemaphore = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)TSClockPulser;
  -[TSClockPulser dealloc](&v6, sel_dealloc);
}

- (id)pulseHandler
{
  return self->_pulseHandler;
}

- (void)setPulseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)useRealtimePriority
{
  return self->_useRealtimePriority;
}

- (void)setUseRealtimePriority:(BOOL)a3
{
  self->_useRealtimePriority = a3;
}

- (unint64_t)pulsePeriod
{
  return self->_pulsePeriod;
}

- (void)setPulsePeriod:(unint64_t)a3
{
  self->_pulsePeriod = a3;
}

- (int)pulseOffset
{
  return self->_pulseOffset;
}

- (void)setPulseOffset:(int)a3
{
  self->_pulseOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pulseHandler, 0);
  objc_storeStrong((id *)&self->_pulseClock, 0);
}

@end
