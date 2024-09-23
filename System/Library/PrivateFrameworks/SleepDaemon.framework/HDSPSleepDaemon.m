@implementation HDSPSleepDaemon

- (HDSPSleepDaemon)init
{
  void *v3;
  HDSPSleepDaemon *v4;

  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HDSPSleepDaemon initWithBehavior:](self, "initWithBehavior:", v3);

  return v4;
}

- (HDSPSleepDaemon)initWithBehavior:(id)a3
{
  id v4;
  HDSPSleepDaemon *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSDate *launchDate;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  HDSPEnvironment *environment;
  HDSPSleepDaemon *v17;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  HDSPSleepDaemon *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HDSPSleepDaemon;
  v5 = -[HDSPSleepDaemon init](&v19, sel_init);
  if (v5)
  {
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v21 = v7;
      v22 = 2048;
      v23 = v5;
      v8 = v7;
      _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] initializing...", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = objc_claimAutoreleasedReturnValue();
    launchDate = v5->_launchDate;
    v5->_launchDate = (NSDate *)v9;

    if ((objc_msgSend(v4, "hksp_supportsSleep") & 1) != 0)
    {
      if (!objc_msgSend(v4, "hksp_demoMode"))
      {
        +[HDSPEnvironment standardEnvironment](HDSPEnvironment, "standardEnvironment");
        v15 = objc_claimAutoreleasedReturnValue();
        environment = v5->_environment;
        v5->_environment = (HDSPEnvironment *)v15;

        -[HDSPEnvironment diagnostics](v5->_environment, "diagnostics");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addProvider:", v5);
        goto LABEL_14;
      }
      HKSPLogForCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, "sleepd entering demo mode", buf, 2u);
      }

      +[HDSPEnvironment demoModeEnvironment](HDSPEnvironment, "demoModeEnvironment");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      HKSPLogForCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21610C000, v13, OS_LOG_TYPE_DEFAULT, "sleepd disabled", buf, 2u);
      }

      +[HDSPEnvironment disabledEnvironment](HDSPEnvironment, "disabledEnvironment");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v14 = v5->_environment;
    v5->_environment = (HDSPEnvironment *)v12;
LABEL_14:

    v17 = v5;
  }

  return v5;
}

- (void)start
{
  -[HDSPEnvironment prepare](self->_environment, "prepare");
  -[HDSPSleepDaemon _setupSigtermHandler](self, "_setupSigtermHandler");
}

- (void)_setupSigtermHandler
{
  NSObject *v3;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *sigtermSource;
  NSObject *v7;
  _QWORD handler[4];
  id v9;
  id buf[2];

  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "sleepd setting up sigterm handler", (uint8_t *)buf, 2u);
  }

  signal(15, (void (__cdecl *)(int))1);
  dispatch_get_global_queue(21, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA08], 0xFuLL, 0, v4);
  sigtermSource = self->_sigtermSource;
  self->_sigtermSource = v5;

  objc_initWeak(buf, self);
  v7 = self->_sigtermSource;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __39__HDSPSleepDaemon__setupSigtermHandler__block_invoke;
  handler[3] = &unk_24D4E4C10;
  objc_copyWeak(&v9, buf);
  dispatch_source_set_event_handler(v7, handler);
  dispatch_activate((dispatch_object_t)self->_sigtermSource);
  objc_destroyWeak(&v9);
  objc_destroyWeak(buf);

}

void __39__HDSPSleepDaemon__setupSigtermHandler__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleSigterm");
  xpc_transaction_exit_clean();

}

- (void)_handleSigterm
{
  NSObject *v3;
  uint8_t v4[16];

  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "sleepd received sigterm", v4, 2u);
  }

  -[HDSPEnvironment shutdown](self->_environment, "shutdown");
}

- (id)diagnosticDescription
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Launched: %@"), self->_launchDate);
}

- (id)diagnosticInfo
{
  NSDate *launchDate;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  launchDate = self->_launchDate;
  v4 = CFSTR("Launched");
  v5[0] = launchDate;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSDate)launchDate
{
  return self->_launchDate;
}

- (OS_dispatch_source)sigtermSource
{
  return self->_sigtermSource;
}

- (HDSPEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_sigtermSource, 0);
  objc_storeStrong((id *)&self->_launchDate, 0);
}

@end
