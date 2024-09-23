@implementation HKSleepHealthStore(HDSPSleep)

- (uint64_t)hdsp_startSession
{
  NSObject *v2;
  id v3;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = (id)objc_opt_class();
    v3 = v6;
    _os_log_impl(&dword_21610C000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] starting session", (uint8_t *)&v5, 0xCu);

  }
  return objc_msgSend(a1, "startSleepTrackingSession");
}

- (uint64_t)hdsp_stopSession
{
  NSObject *v2;
  id v3;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = (id)objc_opt_class();
    v3 = v6;
    _os_log_impl(&dword_21610C000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] stopping session", (uint8_t *)&v5, 0xCu);

  }
  return objc_msgSend(a1, "stopSleepTrackingSession");
}

- (id)hdsp_persistSessions:()HDSPSleep
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE6B608]);
  objc_msgSend(a1, "scheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __54__HKSleepHealthStore_HDSPSleep__hdsp_persistSessions___block_invoke;
  v12[3] = &unk_24D4E4918;
  v12[4] = a1;
  v7 = v5;
  v13 = v7;
  v14 = v4;
  v8 = v4;
  objc_msgSend(v6, "performBlock:", v12);

  v9 = v14;
  v10 = v7;

  return v10;
}

@end
