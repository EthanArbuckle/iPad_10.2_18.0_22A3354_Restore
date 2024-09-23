@implementation PowerUIWakeRequestSignalMonitor

- (PowerUIWakeRequestSignalMonitor)initWithDelegate:(id)a3
{
  PowerUIWakeRequestSignalMonitor *v3;
  os_log_t v4;
  OS_os_log *log;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PowerUIWakeRequestSignalMonitor;
  v3 = -[PowerUIWakeRequestSignalMonitor init](&v7, sel_init, a3);
  if (v3)
  {
    v4 = os_log_create("com.apple.powerui.smartcharging", "signals");
    log = v3->_log;
    v3->_log = (OS_os_log *)v4;

  }
  return v3;
}

+ (id)monitorWithDelegate:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDelegate:", v3);

  return v4;
}

- (unint64_t)signalID
{
  return 6;
}

- (id)nextUserVisibleWakeDate
{
  _CDContext *context;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  context = self->_context;
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForNextUserVisibleWakeDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "dateByAddingTimeInterval:", 15.01);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BE1B198], "keyPathWithKey:", CFSTR("/system/nextUserVisibleWakeRequestor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContext objectForKeyedSubscript:](self->_context, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUIWakeRequestSignalMonitor log](self, "log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v8;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_215A71000, v9, OS_LOG_TYPE_DEFAULT, "%@ requests a wake at %@, requesting", (uint8_t *)&v12, 0x16u);
  }

  objc_msgSend(v6, "dateByAddingTimeInterval:", -3600.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)startMonitoring
{
  _CDContext *v3;
  _CDContext *context;
  void *v5;
  void *v6;
  void *v7;
  _CDContextualChangeRegistration *v8;
  _CDContextualChangeRegistration *registration;
  _QWORD v10[5];

  if (!self->_context)
  {
    objc_msgSend(MEMORY[0x24BE1B170], "userContext");
    v3 = (_CDContext *)objc_claimAutoreleasedReturnValue();
    context = self->_context;
    self->_context = v3;

  }
  v5 = (void *)MEMORY[0x24BE1B1A0];
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForNextUserVisibleWakeDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateForChangeAtKeyPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __50__PowerUIWakeRequestSignalMonitor_startMonitoring__block_invoke;
  v10[3] = &unk_24D3FBB00;
  v10[4] = self;
  objc_msgSend(MEMORY[0x24BE1B190], "localNonWakingRegistrationWithIdentifier:contextualPredicate:callback:", CFSTR("com.apple.powerui.nextwake"), v7, v10);
  v8 = (_CDContextualChangeRegistration *)objc_claimAutoreleasedReturnValue();
  registration = self->_registration;
  self->_registration = v8;

}

uint64_t __50__PowerUIWakeRequestSignalMonitor_startMonitoring__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "nextUserVisibleWakeDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "monitor:maySuggestNewFullChargeDeadline:", *(_QWORD *)(a1 + 32), v2);

  return 1;
}

- (void)stopMonitoring
{
  _CDContextualChangeRegistration *registration;

  if (self->_registration)
  {
    -[_CDContext deregisterCallback:](self->_context, "deregisterCallback:");
    registration = self->_registration;
    self->_registration = 0;

  }
}

- (PowerUISignalMonitorDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (_CDContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (_CDContextualChangeRegistration)registration
{
  return self->_registration;
}

- (void)setRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_registration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registration, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
