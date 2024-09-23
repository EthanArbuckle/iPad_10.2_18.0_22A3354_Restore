@implementation SBDisplayPowerLogReporter

- (SBDisplayPowerLogReporter)init
{
  SBDisplayPowerLogReporter *v2;
  uint64_t v3;
  NSMutableDictionary *displayNameToPowerLogEntry;
  uint64_t SerialWithQoS;
  OS_dispatch_queue *powerLogSendQueue;
  id v7;
  uint64_t v8;
  BSInvalidatable *stateCaptureAssertion;
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBDisplayPowerLogReporter;
  v2 = -[SBDisplayPowerLogReporter init](&v13, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    displayNameToPowerLogEntry = v2->_displayNameToPowerLogEntry;
    v2->_displayNameToPowerLogEntry = (NSMutableDictionary *)v3;

    SerialWithQoS = BSDispatchQueueCreateSerialWithQoS();
    powerLogSendQueue = v2->_powerLogSendQueue;
    v2->_powerLogSendQueue = (OS_dispatch_queue *)SerialWithQoS;

    objc_initWeak(&location, v2);
    v7 = MEMORY[0x1E0C80D38];
    objc_copyWeak(&v11, &location);
    BSLogAddStateCaptureBlockWithTitle();
    v8 = objc_claimAutoreleasedReturnValue();
    stateCaptureAssertion = v2->_stateCaptureAssertion;
    v2->_stateCaptureAssertion = (BSInvalidatable *)v8;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

id __33__SBDisplayPowerLogReporter_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "description");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)reportPowerLogEntry:(id)a3
{
  __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *powerLogSendQueue;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD block[4];
  id v22;
  const __CFString *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBDisplayPowerLogReporter reportPowerLogEntry:]");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("SBDisplayPowerLogReporter.m"), 50, CFSTR("this call must be made on the main thread"));

  }
  -[__CFString displayName](v5, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayPowerLogReporter.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[powerLogEntry displayName]"));

  }
  -[__CFString displayName](v5, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[__CFString windowingMode](v5, "windowingMode");
  -[NSMutableDictionary objectForKey:](self->_displayNameToPowerLogEntry, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if ((objc_msgSend(v9, "isEqual:", v5) & 1) != 0)
    {

      goto LABEL_16;
    }
    -[NSMutableDictionary setObject:forKey:](self->_displayNameToPowerLogEntry, "setObject:forKey:", v5, v7);

  }
  else
  {

    if (v10)
    {
      SBLogDisplayControlling();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        _SBFLoggingMethodProem();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v17;
        v26 = 2114;
        v27 = v5;
        _os_log_debug_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ incoming entry has .Invalid windowing mode. evicting from cache: %{public}@", buf, 0x16u);

      }
      -[NSMutableDictionary removeObjectForKey:](self->_displayNameToPowerLogEntry, "removeObjectForKey:", v7);
    }
  }
  -[__CFString logPayload](v5, "logPayload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogDisplayControlling();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    _SBFLoggingMethodProem();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v25 = v16;
    v26 = 2114;
    v27 = CFSTR("WindowMode");
    v28 = 2114;
    v29 = v12;
    _os_log_debug_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEBUG, "%{public}@ reporting to powerlog. eventName: %{public}@; payload: %{public}@",
      buf,
      0x20u);

  }
  powerLogSendQueue = self->_powerLogSendQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SBDisplayPowerLogReporter_reportPowerLogEntry___block_invoke;
  block[3] = &unk_1E8E9DE88;
  v22 = v12;
  v23 = CFSTR("WindowMode");
  v15 = v12;
  dispatch_async(powerLogSendQueue, block);

LABEL_16:
}

uint64_t __49__SBDisplayPowerLogReporter_reportPowerLogEntry___block_invoke()
{
  uint64_t result;

  result = PLShouldLogRegisteredEvent();
  if ((_DWORD)result)
    return PLLogRegisteredEvent();
  return result;
}

- (id)description
{
  return -[SBDisplayPowerLogReporter descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBDisplayPowerLogReporter descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendDictionarySection:withName:skipIfEmpty:", self->_displayNameToPowerLogEntry, CFSTR("map"), 0);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerLogSendQueue, 0);
  objc_storeStrong((id *)&self->_stateCaptureAssertion, 0);
  objc_storeStrong((id *)&self->_displayNameToPowerLogEntry, 0);
}

@end
