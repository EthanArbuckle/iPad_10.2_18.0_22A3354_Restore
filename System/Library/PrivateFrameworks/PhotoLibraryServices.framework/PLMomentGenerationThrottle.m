@implementation PLMomentGenerationThrottle

- (PLMomentGenerationThrottle)initWithName:(id)a3 canDelayAnyQOS:(BOOL)a4 singleThreadedMode:(BOOL)a5 timeProvider:(id)a6 targetQueue:(id)a7 target:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  PLMomentGenerationThrottle *v19;
  uint64_t v20;
  NSString *name;
  uint64_t v22;
  id targetBlock;
  PLMomentGenerationThrottleDefaultTimeProvider *v24;
  PLMomentGenerationThrottleTimeProvider *timeProvider;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v15 = a3;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v30.receiver = self;
  v30.super_class = (Class)PLMomentGenerationThrottle;
  v19 = -[PLMomentGenerationThrottle init](&v30, sel_init);
  if (!v19)
    goto LABEL_9;
  if (v18)
  {
    if (v15)
      goto LABEL_4;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, v19, CFSTR("PLMomentGenerationThrottle.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

    if (v17)
      goto LABEL_5;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, v19, CFSTR("PLMomentGenerationThrottle.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("targetQueue"));

    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, v19, CFSTR("PLMomentGenerationThrottle.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("targetBlock"));

  if (!v15)
    goto LABEL_11;
LABEL_4:
  if (!v17)
    goto LABEL_12;
LABEL_5:
  v20 = objc_msgSend(v15, "copy");
  name = v19->_name;
  v19->_name = (NSString *)v20;

  objc_storeStrong((id *)&v19->_targetQueue, a7);
  v22 = objc_msgSend(v18, "copy");
  targetBlock = v19->_targetBlock;
  v19->_targetBlock = (id)v22;

  v19->_canDelayAnyQOS = a4;
  v19->_singleThreaded = a5;
  if (v16)
    v24 = (PLMomentGenerationThrottleDefaultTimeProvider *)v16;
  else
    v24 = objc_alloc_init(PLMomentGenerationThrottleDefaultTimeProvider);
  timeProvider = v19->_timeProvider;
  v19->_timeProvider = (PLMomentGenerationThrottleTimeProvider *)v24;

LABEL_9:
  return v19;
}

- (void)_doAsyncUpdateWithCompletionBlock:(id)a3 tryAgainLaterBlock:(id)a4 tryAgainAfterCurrentExecutionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL4 v11;
  BOOL *p_isExecutingOrConsideringExecution;
  unsigned __int8 v13;
  double v14;
  double v15;
  double lastRunEndTime;
  double lastRunDuration;
  double nextExpectedRun;
  _BOOL4 v19;
  _BOOL4 v20;
  double v21;
  NSObject *v22;
  NSString *v23;
  double v24;
  double v25;
  dispatch_time_t v26;
  BOOL *p_shouldRunAgain;
  unsigned __int8 v28;
  int64_t v29;
  NSObject *v30;
  NSString *name;
  dispatch_time_t v32;
  NSObject *v33;
  NSString *v34;
  int v35;
  NSString *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  double v40;
  __int16 v41;
  double v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self->_canDelayAnyQOS || qos_class_self() < 0x16;
  p_isExecutingOrConsideringExecution = &self->_isExecutingOrConsideringExecution;
  do
    v13 = __ldaxr((unsigned __int8 *)p_isExecutingOrConsideringExecution);
  while (__stlxr(1u, (unsigned __int8 *)p_isExecutingOrConsideringExecution));
  if ((v13 & 1) != 0)
  {
    p_shouldRunAgain = &self->_shouldRunAgain;
    do
      v28 = __ldaxr((unsigned __int8 *)p_shouldRunAgain);
    while (__stlxr(1u, (unsigned __int8 *)p_shouldRunAgain));
    if ((v28 & 1) == 0)
    {
      if (v11)
        v29 = 1000000000;
      else
        v29 = 100000000;
      PLMomentsGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        name = self->_name;
        v35 = 138543618;
        v36 = name;
        v37 = 2048;
        v38 = 0x3FF0000000000000;
        _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_DEBUG, "[MomentGenerationThrottle] %{public}@ scheduling a check again after interval: %f", (uint8_t *)&v35, 0x16u);
      }

      v32 = dispatch_time(0, v29);
      dispatch_after(v32, (dispatch_queue_t)self->_targetQueue, v10);
    }
  }
  else
  {
    -[PLMomentGenerationThrottleTimeProvider currentTime](self->_timeProvider, "currentTime");
    v15 = v14;
    lastRunEndTime = self->_lastRunEndTime;
    if (lastRunEndTime != 0.0 && vabdd_f64(v15, lastRunEndTime) > 300.0)
    {
      self->_lastRunDuration = 0.0;
      self->_lastRunEndTime = 0.0;
      self->_nextExpectedRun = 0.0;
    }
    lastRunDuration = self->_lastRunDuration;
    nextExpectedRun = self->_nextExpectedRun;
    v19 = nextExpectedRun <= 0.0;
    v20 = vabdd_f64(nextExpectedRun, v15) <= 60.0 || nextExpectedRun <= 0.0;
    if (lastRunDuration == 0.0)
      v20 = 0;
    if (nextExpectedRun >= v15)
      v19 = 1;
    if (v11 && v19 && v20)
    {
      if (nextExpectedRun == 0.0)
      {
        v21 = fmax(fmin(lastRunDuration, 60.0), 1.0);
        PLMomentsGetLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          v23 = self->_name;
          v25 = self->_lastRunDuration;
          v24 = self->_lastRunEndTime;
          v35 = 138544130;
          v36 = v23;
          v37 = 2048;
          v38 = *(_QWORD *)&v21;
          v39 = 2048;
          v40 = v24;
          v41 = 2048;
          v42 = v25;
          _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEBUG, "[MomentGenerationThrottle] %{public}@ delaying execution for %.2f sec, last end time: %f, last duration: %f", (uint8_t *)&v35, 0x2Au);
        }

        self->_nextExpectedRun = v15 + v21;
        v26 = dispatch_time(0, (uint64_t)(v21 * 1000000000.0));
        dispatch_after(v26, (dispatch_queue_t)self->_targetQueue, v9);
      }
      atomic_store(0, (unsigned __int8 *)p_isExecutingOrConsideringExecution);
    }
    else
    {
      PLMomentsGetLog();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        v34 = self->_name;
        v35 = 138543362;
        v36 = v34;
        _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_DEBUG, "[MomentGenerationThrottle] %{public}@ running now...", (uint8_t *)&v35, 0xCu);
      }

      self->_nextExpectedRun = 0.0;
      (*((void (**)(void))self->_targetBlock + 2))();
    }
  }

}

- (void)update
{
  uint64_t v3;
  void *v4;
  __int128 v5;
  BOOL *p_isExecutingOrConsideringExecution;
  unsigned __int8 v7;
  BOOL *p_shouldRunAgain;
  double v9;
  double lastRunEndTime;
  NSObject *v11;
  NSString *v12;
  unsigned __int8 v13;
  NSObject *v14;
  NSObject *v15;
  NSString *v16;
  unsigned __int8 v17;
  NSObject *v18;
  NSString *name;
  id v20;
  void *v21;
  id v22;
  void *v23;
  NSString *v24;
  __int128 v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  uint8_t buf[4];
  NSString *v32;
  uint64_t v33;

  v3 = MEMORY[0x1E0C809B0];
  v33 = *MEMORY[0x1E0C80C00];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __36__PLMomentGenerationThrottle_update__block_invoke;
  v30[3] = &unk_1E366EFD8;
  v30[4] = self;
  v4 = (void *)MEMORY[0x19AEC174C](v30, a2);
  if (self->_singleThreaded)
  {
    p_isExecutingOrConsideringExecution = &self->_isExecutingOrConsideringExecution;
    do
      v7 = __ldaxr((unsigned __int8 *)p_isExecutingOrConsideringExecution);
    while (__stlxr(1u, (unsigned __int8 *)p_isExecutingOrConsideringExecution));
    if ((v7 & 1) != 0)
    {
LABEL_19:
      PLMomentsGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        name = self->_name;
        *(_DWORD *)buf = 138543362;
        v32 = name;
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "[MomentGenerationThrottle] %{public}@ running sync: will check again when done...", buf, 0xCu);
      }

      atomic_store(1u, (unsigned __int8 *)&self->_shouldRunAgain);
    }
    else
    {
      p_shouldRunAgain = &self->_shouldRunAgain;
      *(_QWORD *)&v5 = 138543362;
      v25 = v5;
      while (1)
      {
        -[PLMomentGenerationThrottleTimeProvider currentTime](self->_timeProvider, "currentTime", v25);
        lastRunEndTime = self->_lastRunEndTime;
        if (lastRunEndTime != 0.0 && vabdd_f64(v9, lastRunEndTime) > 300.0)
        {
          self->_lastRunDuration = 0.0;
          self->_lastRunEndTime = 0.0;
          self->_nextExpectedRun = 0.0;
        }
        PLMomentsGetLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          v12 = self->_name;
          *(_DWORD *)buf = v25;
          v32 = v12;
          _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEBUG, "[MomentGenerationThrottle] %{public}@ running sync now...", buf, 0xCu);
        }

        self->_nextExpectedRun = 0.0;
        (*((void (**)(void))self->_targetBlock + 2))();
        do
          v13 = __ldaxr((unsigned __int8 *)p_shouldRunAgain);
        while (__stlxr(0, (unsigned __int8 *)p_shouldRunAgain));
        PLMomentsGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if ((v13 & 1) == 0)
          break;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          v16 = self->_name;
          *(_DWORD *)buf = v25;
          v32 = v16;
          _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEBUG, "[MomentGenerationThrottle] %{public}@ targetBlock executed, calling again (shouldRunAgain==YES)...", buf, 0xCu);
        }

        do
          v17 = __ldaxr((unsigned __int8 *)p_isExecutingOrConsideringExecution);
        while (__stlxr(1u, (unsigned __int8 *)p_isExecutingOrConsideringExecution));
        if ((v17 & 1) != 0)
          goto LABEL_19;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v24 = self->_name;
        *(_DWORD *)buf = v25;
        v32 = v24;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "[MomentGenerationThrottle] %{public}@ done with sync update.", buf, 0xCu);
      }

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLMomentGenerationThrottle update]");
    v28[0] = v3;
    v28[1] = 3221225472;
    v28[2] = __36__PLMomentGenerationThrottle_update__block_invoke_56;
    v28[3] = &unk_1E3677C18;
    v28[4] = self;
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v29 = v20;
    v21 = (void *)MEMORY[0x19AEC174C](v28);
    v26[0] = v3;
    v26[1] = 3221225472;
    v26[2] = __36__PLMomentGenerationThrottle_update__block_invoke_2;
    v26[3] = &unk_1E3677C18;
    v26[4] = self;
    v27 = v20;
    v22 = v20;
    v23 = (void *)MEMORY[0x19AEC174C](v26);
    -[PLMomentGenerationThrottle _doAsyncUpdateWithCompletionBlock:tryAgainLaterBlock:tryAgainAfterCurrentExecutionBlock:](self, "_doAsyncUpdateWithCompletionBlock:tryAgainLaterBlock:tryAgainAfterCurrentExecutionBlock:", v4, v21, v23);

  }
}

- (BOOL)isIdle
{
  unsigned __int8 v2;
  unsigned __int8 v3;
  BOOL result;

  v2 = atomic_load((unsigned __int8 *)&self->_isExecutingOrConsideringExecution);
  result = (v2 & 1) == 0
        && (v3 = atomic_load((unsigned __int8 *)&self->_shouldRunAgain), (v3 & 1) == 0)
        && self->_nextExpectedRun == 0.0;
  return result;
}

- (PLMomentGenerationThrottleTimeProvider)timeProvider
{
  return self->_timeProvider;
}

- (BOOL)singleThreaded
{
  return self->_singleThreaded;
}

- (void)setSingleThreaded:(BOOL)a3
{
  self->_singleThreaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_timeProvider, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_targetBlock, 0);
}

void __36__PLMomentGenerationThrottle_update__block_invoke(uint64_t a1, double a2)
{
  double v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "currentTime");
  *(double *)(*(_QWORD *)(a1 + 32) + 64) = fmax(v4 - a2, 0.0);
  *(double *)(*(_QWORD *)(a1 + 32) + 72) = v4;
  atomic_store(0, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 57));
  PLMomentsGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "[MomentGenerationThrottle] %{public}@ completion called.", (uint8_t *)&v7, 0xCu);
  }

}

uint64_t __36__PLMomentGenerationThrottle_update__block_invoke_56(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "update");
  return objc_msgSend(*(id *)(a1 + 40), "stillAlive");
}

uint64_t __36__PLMomentGenerationThrottle_update__block_invoke_2(uint64_t a1)
{
  atomic_store(0, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(*(id *)(a1 + 32), "update");
  return objc_msgSend(*(id *)(a1 + 40), "stillAlive");
}

@end
