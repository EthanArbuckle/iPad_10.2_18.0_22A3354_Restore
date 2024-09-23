@implementation SBLockStateAggregator

+ (SBLockStateAggregator)sharedInstance
{
  if (sharedInstance_onceToken_37 != -1)
    dispatch_once(&sharedInstance_onceToken_37, &__block_literal_global_247);
  return (SBLockStateAggregator *)(id)sharedInstance___manager_0;
}

- (BOOL)hasAnyLockState
{
  return self->_lockState != 0;
}

void __39__SBLockStateAggregator_sharedInstance__block_invoke()
{
  SBLockStateAggregator *v0;
  void *v1;

  v0 = objc_alloc_init(SBLockStateAggregator);
  v1 = (void *)sharedInstance___manager_0;
  sharedInstance___manager_0 = (uint64_t)v0;

}

- (SBLockStateAggregator)init
{
  void *v3;
  SBLockStateAggregator *v4;

  objc_msgSend(MEMORY[0x1E0DA9D78], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBLockStateAggregator _initWithAnalyticsClient:](self, "_initWithAnalyticsClient:", v3);

  return v4;
}

- (id)_initWithAnalyticsClient:(id)a3
{
  id v4;
  SBLockStateAggregator *v5;
  SBLockStateAggregator *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBLockStateAggregator;
  v5 = -[SBLockStateAggregator init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_analyticsClient, v4);
    v6->_lockState = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__updateLockState, *MEMORY[0x1E0DAC318], 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__updateLockState, *MEMORY[0x1E0DAA248], 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__updateLockState, *MEMORY[0x1E0DAA050], 0);
    -[SBLockStateAggregator _updateLockState](v6, "_updateLockState");

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBLockStateAggregator;
  -[SBLockStateAggregator dealloc](&v4, sel_dealloc);
}

- (id)_descriptionForLockState:(unint64_t)a3
{
  char v3;
  __CFString *v4;
  __CFString *v5;

  if (!a3)
  {
    v5 = CFSTR("none");
    return v5;
  }
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((v3 & 1) != 0)
  {
    -[__CFString appendString:](v4, "appendString:", CFSTR("UILocked"));
    if ((v3 & 2) == 0)
    {
LABEL_4:
      if ((v3 & 4) == 0)
        return v5;
      goto LABEL_11;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_4;
  }
  if (-[__CFString length](v5, "length"))
    -[__CFString appendString:](v5, "appendString:", CFSTR(", "));
  -[__CFString appendString:](v5, "appendString:", CFSTR("PasscodeLocked"));
  if ((v3 & 4) != 0)
  {
LABEL_11:
    if (-[__CFString length](v5, "length"))
      -[__CFString appendString:](v5, "appendString:", CFSTR(", "));
    -[__CFString appendString:](v5, "appendString:", CFSTR("Blocked"));
  }
  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t lockState;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  lockState = self->_lockState;
  -[SBLockStateAggregator _descriptionForLockState:](self, "_descriptionForLockState:", lockState);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; lockState = 0x%X (%@)>"), v4, self, lockState, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)lockState
{
  return self->_lockState;
}

- (void)_updateLockState
{
  void *v3;
  unsigned int v4;
  unint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t lockState;
  unint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id WeakRetained;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  +[SBLockScreenManager sharedInstanceIfExists](SBLockScreenManager, "sharedInstanceIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUILocked");

  v5 = v4;
  objc_msgSend((id)SBApp, "lockOutController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "authenticationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isAuthenticated"))
    v5 |= 2uLL;
  if (objc_msgSend(v6, "isBlocked"))
    v5 |= 4uLL;
  if (self->_lockState != v5)
  {
    SBLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);

    if (v9)
    {
      v10 = (void *)MEMORY[0x1E0CB37A0];
      -[SBLockStateAggregator _descriptionForLockState:](self, "_descriptionForLockState:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("Aggregate lock state changed: %@"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      lockState = self->_lockState;
      if (lockState)
      {
        v14 = (lockState ^ v5) & lockState;
        if (((lockState ^ v5) & v5) != 0)
        {
          -[SBLockStateAggregator _descriptionForLockState:](self, "_descriptionForLockState:", (lockState ^ v5) & v5);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "appendFormat:", CFSTR(" (%@ added)"), v15);

        }
        if (v14)
        {
          -[SBLockStateAggregator _descriptionForLockState:](self, "_descriptionForLockState:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "appendFormat:", CFSTR(" (%@ removed)"), v16);

        }
      }
      else
      {
        objc_msgSend(v12, "appendString:", CFSTR(" (added)"));
      }
      SBLogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v29 = v12;
        _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_INFO, "%{public}@", buf, 0xCu);
      }

    }
    self->_lockState = v5;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = CFSTR("SBAggregateLockStateKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_lockState);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "postNotificationName:object:userInfo:", CFSTR("SBAggregateLockStateDidChangeNotification"), 0, v20);

    WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsClient);
    v24 = *MEMORY[0x1E0DABE88];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_lockState);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "emitEvent:withPayload:", 48, v23);

  }
}

- (SBFAnalyticsClient)analyticsClient
{
  return (SBFAnalyticsClient *)objc_loadWeakRetained((id *)&self->_analyticsClient);
}

- (void)setAnalyticsClient:(id)a3
{
  objc_storeWeak((id *)&self->_analyticsClient, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_analyticsClient);
}

@end
