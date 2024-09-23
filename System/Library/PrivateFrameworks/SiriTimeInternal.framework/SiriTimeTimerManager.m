@implementation SiriTimeTimerManager

+ (id)timerManagerWithEndpointUUIDString:(id)a3
{
  NSObject *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "+[SiriTimeTimerManager timerManagerWithEndpointUUIDString:]";
    _os_log_impl(&dword_22D86F000, v3, OS_LOG_TYPE_DEFAULT, "%s Creating MTTimerManager", (uint8_t *)&v5, 0xCu);
  }
  return objc_alloc_init(MEMORY[0x24BE67870]);
}

- (SiriTimeTimerManager)initWithEndpointUUID:(id)a3
{
  id v4;
  SiriTimeTimerManager *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SiriTimeTimerManager;
  v5 = -[SiriTimeTimerManager init](&v8, sel_init);
  if (v5)
  {
    +[SiriTimeTimerManager timerManagerWithEndpointUUIDString:](SiriTimeTimerManager, "timerManagerWithEndpointUUIDString:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriTimeTimerManager setTimerManager:](v5, "setTimerManager:", v6);

  }
  return v5;
}

- (id)timers
{
  void *v2;
  void *v3;

  -[SiriTimeTimerManager timerManager](self, "timerManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)addTimer:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SiriTimeTimerManager timerManager](self, "timerManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTimer:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)updateTimer:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SiriTimeTimerManager timerManager](self, "timerManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateTimer:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)removeTimer:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SiriTimeTimerManager timerManager](self, "timerManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTimer:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dismissTimerWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  -[SiriTimeTimerManager timerManager](self, "timerManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[SiriTimeTimerManager timerManager](self, "timerManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v7, "dismissTimerWithIdentifier:", v4);

  }
  objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)addObserverForName:(id)a3 queue:(id)a4 usingBlock:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null", a3, a4, a5);
}

- (MTTimerManagerIntentSupport)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
  objc_storeStrong((id *)&self->_timerManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerManager, 0);
}

@end
