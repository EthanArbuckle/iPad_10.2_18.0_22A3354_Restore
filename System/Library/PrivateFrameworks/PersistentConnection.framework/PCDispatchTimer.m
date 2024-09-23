@implementation PCDispatchTimer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
}

- (void)start
{
  PCDispatchTimer *v2;
  NSObject *v3;
  CUTWeakReference *target;
  const char *Name;
  unint64_t fireTime;
  OS_dispatch_source *timerSource;
  int v8;
  PCDispatchTimer *v9;
  __int16 v10;
  CUTWeakReference *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  unint64_t v15;
  __int16 v16;
  OS_dispatch_source *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v2->_isValid = 1;
  dispatch_source_set_timer((dispatch_source_t)v2->_timerSource, v2->_fireTime, 0xFFFFFFFFFFFFFFFFLL, 0);
  +[PCLog timer](PCLog, "timer");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    target = v2->_target;
    Name = sel_getName(v2->_selector);
    fireTime = v2->_fireTime;
    timerSource = v2->_timerSource;
    v8 = 138544386;
    v9 = v2;
    v10 = 2114;
    v11 = target;
    v12 = 2082;
    v13 = Name;
    v14 = 2048;
    v15 = fireTime;
    v16 = 2114;
    v17 = timerSource;
    _os_log_debug_impl(&dword_1CBC1B000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ start with target %{public}@ selector %{public}s firetime %llu timerSource %{public}@", (uint8_t *)&v8, 0x34u);
  }

  objc_sync_exit(v2);
}

- (void)setFireDate:(id)a3
{
  NSDate *v5;
  PCDispatchTimer *v6;
  double v7;
  double v8;
  int64_t v9;
  dispatch_time_t v10;
  NSObject *v11;
  id v12;
  const char *Name;
  unint64_t fireTime;
  void *v15;
  void *v16;
  OS_dispatch_source *timerSource;
  int v18;
  PCDispatchTimer *v19;
  __int16 v20;
  NSDate *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  OS_dispatch_source *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = (NSDate *)a3;
  v6 = self;
  objc_sync_enter(v6);
  -[NSDate timeIntervalSinceNow](v5, "timeIntervalSinceNow");
  v8 = fmax(v7, 0.0);
  if (v8 >= 9223372040.0)
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v9 = (uint64_t)(v8 * 1000000000.0);
  v10 = dispatch_time(0, v9);
  v6->_fireTime = v10;
  if (v6->_isValid)
  {
    dispatch_source_set_timer((dispatch_source_t)v6->_timerSource, v10, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    +[PCLog timer](PCLog, "timer");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      -[CUTWeakReference object](v6->_target, "object");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      Name = sel_getName(v6->_selector);
      fireTime = v6->_fireTime;
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)v9 / 1000000000.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PCStringFromDate(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      timerSource = v6->_timerSource;
      v18 = 138544898;
      v19 = v6;
      v20 = 2114;
      v21 = v5;
      v22 = 2114;
      v23 = v12;
      v24 = 2082;
      v25 = Name;
      v26 = 2048;
      v27 = fireTime;
      v28 = 2114;
      v29 = v16;
      v30 = 2114;
      v31 = timerSource;
      _os_log_debug_impl(&dword_1CBC1B000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ setFireDate %{public}@ and start with target %{public}@ selector %{public}s fireTime %llu deltaNanosec %{public}@ timerSource %{public}@", (uint8_t *)&v18, 0x48u);

    }
  }
  else
  {
    +[PCLog timer](PCLog, "timer");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[PCDispatchTimer setFireDate:].cold.1();
  }

  if (v6->_fireDate != v5)
    objc_storeStrong((id *)&v6->_fireDate, a3);
  objc_sync_exit(v6);

}

- (PCDispatchTimer)initWithQueue:(id)a3 target:(id)a4 selector:(SEL)a5 fireTime:(unint64_t)a6
{
  id v11;
  id v12;
  PCDispatchTimer *v13;
  PCDispatchTimer *v14;
  uint64_t v15;
  CUTWeakReference *target;
  dispatch_source_t v17;
  OS_dispatch_source *timerSource;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v24;
  const char *Name;
  OS_dispatch_source *v26;
  _QWORD handler[4];
  id v28;
  objc_super v29;
  uint8_t buf[4];
  PCDispatchTimer *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  OS_dispatch_source *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v29.receiver = self;
  v29.super_class = (Class)PCDispatchTimer;
  v13 = -[PCDispatchTimer init](&v29, sel_init);
  v14 = v13;
  if (v11 && v13)
  {
    objc_storeStrong((id *)&v13->_queue, a3);
    objc_msgSend(MEMORY[0x1E0D13238], "weakRefWithObject:", v12);
    v15 = objc_claimAutoreleasedReturnValue();
    target = v14->_target;
    v14->_target = (CUTWeakReference *)v15;

    v14->_selector = a5;
    v14->_isValid = 1;
    v14->_fireTime = a6;
    v17 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v14->_queue);
    timerSource = v14->_timerSource;
    v14->_timerSource = (OS_dispatch_source *)v17;

    dispatch_source_set_timer((dispatch_source_t)v14->_timerSource, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    +[PCLog timer](PCLog, "timer");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      -[CUTWeakReference object](v14->_target, "object");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      Name = sel_getName(v14->_selector);
      v26 = v14->_timerSource;
      *(_DWORD *)buf = 138544130;
      v31 = v14;
      v32 = 2114;
      v33 = v24;
      v34 = 2082;
      v35 = Name;
      v36 = 2114;
      v37 = v26;
      _os_log_debug_impl(&dword_1CBC1B000, v19, OS_LOG_TYPE_DEBUG, "%{public}@ initialized with target %{public}@ selector %{public}s timerSource %{public}@", buf, 0x2Au);

    }
    objc_msgSend(MEMORY[0x1E0D13238], "weakRefWithObject:", v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v14->_timerSource;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __58__PCDispatchTimer_initWithQueue_target_selector_fireTime___block_invoke;
    handler[3] = &unk_1E8743348;
    v28 = v20;
    v22 = v20;
    dispatch_source_set_event_handler(v21, handler);
    dispatch_resume((dispatch_object_t)v14->_timerSource);

  }
  return v14;
}

- (void)invalidate
{
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_3(&dword_1CBC1B000, a4, a3, "%{public}@ is invalidated \nCallstack %{public}@", (uint8_t *)a3);

}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1CBC1B000, v0, v1, "%{public}@ dealloced", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_cleanupTimer
{
  NSObject *timerSource;
  OS_dispatch_source *v3;
  PCDispatchTimer *obj;

  obj = self;
  objc_sync_enter(obj);
  timerSource = obj->_timerSource;
  if (timerSource)
  {
    dispatch_source_set_event_handler(timerSource, &__block_literal_global_10);
    dispatch_source_cancel((dispatch_source_t)obj->_timerSource);
    v3 = obj->_timerSource;
    obj->_timerSource = 0;

  }
  objc_sync_exit(obj);

}

- (BOOL)isValid
{
  PCDispatchTimer *v2;
  BOOL isValid;

  v2 = self;
  objc_sync_enter(v2);
  isValid = v2->_isValid;
  objc_sync_exit(v2);

  return isValid;
}

void __58__PCDispatchTimer_initWithQueue_target_selector_fireTime___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[PCLog timer](PCLog, "timer");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __58__PCDispatchTimer_initWithQueue_target_selector_fireTime___block_invoke_cold_1();

  objc_msgSend(v1, "invalidate");
  objc_msgSend(v1, "_callTarget");

}

- (void)_callTarget
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1CBC1B000, v0, v1, "%{public}@ performing call back", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (NSDate)fireDate
{
  PCDispatchTimer *v2;
  NSDate *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_fireDate;
  objc_sync_exit(v2);

  return v3;
}

void __58__PCDispatchTimer_initWithQueue_target_selector_fireTime___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1CBC1B000, v0, v1, "%{public}@ in call back event handler", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setFireDate:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  v3 = 2114;
  v4 = v0;
  OUTLINED_FUNCTION_3(&dword_1CBC1B000, v1, (uint64_t)v1, "%{public}@ tried to setFireDate %{public}@ but the timer is not valid", v2);
  OUTLINED_FUNCTION_1();
}

@end
