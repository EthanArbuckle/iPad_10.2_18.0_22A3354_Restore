@implementation HDSPTimeChangeListener

- (HDSPTimeChangeListener)initWithEnvironment:(id)a3
{
  id v4;
  HDSPTimeChangeListener *v5;
  id v6;
  void *v7;
  uint64_t v8;
  HKSPObserverSet *observers;
  HDSPTimeChangeListener *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDSPTimeChangeListener;
  v5 = -[HDSPTimeChangeListener init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BEA98C8]);
    objc_msgSend(v4, "defaultCallbackScheduler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithCallbackScheduler:", v7);
    observers = v5->_observers;
    v5->_observers = (HKSPObserverSet *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)addObserver:(id)a3
{
  if (a3)
    -[HKSPObserverSet addObserver:](self->_observers, "addObserver:");
}

- (void)removeObserver:(id)a3
{
  if (a3)
    -[HKSPObserverSet removeObserver:](self->_observers, "removeObserver:");
}

- (void)environmentWillBecomeReady:(id)a3
{
  id v4;

  objc_msgSend(a3, "notificationListener");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:", self);

}

- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;

  v5 = a4;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("SignificantTimeChange")))
  {
    -[HDSPTimeChangeListener handleSignificantTimeChange](self, "handleSignificantTimeChange");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "com.apple.system.timezone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    if (v7)
      -[HDSPTimeChangeListener handleTimeZoneChange](self, "handleTimeZoneChange");
  }
  objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)handleSignificantTimeChange
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HKSPObserverSet *observers;
  _QWORD v11[5];
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = (id)objc_opt_class();
    v4 = v13;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] handleSignificantTimeChange", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDBCF38], "resetSystemTimeZone");
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    v7 = (void *)MEMORY[0x24BDBCF38];
    v8 = v6;
    objc_msgSend(v7, "systemTimeZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v6;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] timeZone: %{public}@", buf, 0x16u);

  }
  observers = self->_observers;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __53__HDSPTimeChangeListener_handleSignificantTimeChange__block_invoke;
  v11[3] = &unk_24D4E56B0;
  v11[4] = self;
  -[HKSPObserverSet enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v11);
}

void __53__HDSPTimeChangeListener_handleSignificantTimeChange__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "significantTimeChangeDetected:", *(_QWORD *)(a1 + 32));

}

- (void)handleTimeZoneChange
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HKSPObserverSet *observers;
  _QWORD v11[5];
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = (id)objc_opt_class();
    v4 = v13;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] handleTimeZoneChange", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDBCF38], "resetSystemTimeZone");
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    v7 = (void *)MEMORY[0x24BDBCF38];
    v8 = v6;
    objc_msgSend(v7, "systemTimeZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v6;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] timeZone: %{public}@", buf, 0x16u);

  }
  observers = self->_observers;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __46__HDSPTimeChangeListener_handleTimeZoneChange__block_invoke;
  v11[3] = &unk_24D4E56B0;
  v11[4] = self;
  -[HKSPObserverSet enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v11);
}

void __46__HDSPTimeChangeListener_handleTimeZoneChange__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "timeZoneChangeDetected:", *(_QWORD *)(a1 + 32));

}

- (NSString)sourceIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (HDSPEnvironment)environment
{
  return (HDSPEnvironment *)objc_loadWeakRetained((id *)&self->environment);
}

- (HKSPObserverSet)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->environment);
}

@end
