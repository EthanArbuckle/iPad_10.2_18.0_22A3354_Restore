@implementation PowerUIAlarmSignalMonitor

- (PowerUIAlarmSignalMonitor)initWithDelegate:(id)a3 trialManager:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  PowerUIAlarmSignalMonitor *v10;
  MTAlarmManager *v11;
  MTAlarmManager *alarmManager;
  os_log_t v13;
  OS_os_log *log;
  id v15;
  void (**v16)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  PowerUIAlarmSignalMonitor *v26;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)PowerUIAlarmSignalMonitor;
  v10 = -[PowerUIAlarmSignalMonitor init](&v27, sel_init);
  if (v10)
  {
    v11 = (MTAlarmManager *)objc_alloc_init(MEMORY[0x24BE67828]);
    alarmManager = v10->_alarmManager;
    v10->_alarmManager = v11;

    objc_storeStrong((id *)&v10->_delegate, a3);
    v13 = os_log_create("com.apple.powerui.smartcharging", "signals");
    log = v10->_log;
    v10->_log = (OS_os_log *)v13;

    v21 = MEMORY[0x24BDAC760];
    v22 = 3221225472;
    v23 = __71__PowerUIAlarmSignalMonitor_initWithDelegate_trialManager_withContext___block_invoke;
    v24 = &unk_24D3FC690;
    v15 = v9;
    v25 = v15;
    v26 = v10;
    v16 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x2199EC2D0](&v21);
    v16[2](v16, v17, v18, v19);
    objc_msgSend(v15, "addUpdateHandler:", v16, v21, v22, v23, v24);

  }
  return v10;
}

void __71__PowerUIAlarmSignalMonitor_initWithDelegate_trialManager_withContext___block_invoke(uint64_t a1)
{
  double v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "doubleFactorForName:", CFSTR("alarmSignalBuffer"));
  if (v2 > 1.0)
    kBufferBeforeAlarm = *(_QWORD *)&v2;
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 24);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = kBufferBeforeAlarm;
    _os_log_impl(&dword_215A71000, v3, OS_LOG_TYPE_DEFAULT, "Alarm Buffer: %lf", (uint8_t *)&v4, 0xCu);
  }
}

+ (id)monitorWithDelegate:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDelegate:trialManager:withContext:", v3, 0, 0);

  return v4;
}

+ (id)monitorWithDelegate:(id)a3 trialManager:(id)a4 withContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDelegate:trialManager:withContext:", v9, v8, v7);

  return v10;
}

- (unint64_t)signalID
{
  return 2;
}

- (void)startMonitoring
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_sourceInformationChangedNotification_, *MEMORY[0x24BE677A0], 0);

}

- (void)sourceInformationChangedNotification:(id)a3
{
  id v4;

  -[PowerUIAlarmSignalMonitor requiredFullChargeDate](self, "requiredFullChargeDate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PowerUISignalMonitorDelegate monitor:maySuggestNewFullChargeDeadline:](self->_delegate, "monitor:maySuggestNewFullChargeDeadline:", self, v4);

}

- (void)stopMonitoring
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE677A0], 0);

}

- (id)nextLocalAlarm
{
  void *v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  id v6;
  NSObject *log;
  uint64_t v8;
  id v9;
  _QWORD v11[5];
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__7;
  v18 = __Block_byref_object_dispose__7;
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[MTAlarmManager nextAlarm](self->_alarmManager, "nextAlarm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __43__PowerUIAlarmSignalMonitor_nextLocalAlarm__block_invoke;
  v11[3] = &unk_24D3FCD98;
  v11[4] = self;
  v13 = &v14;
  v5 = v4;
  v12 = v5;
  v6 = (id)objc_msgSend(v3, "addCompletionBlock:", v11);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v15[5];
    *(_DWORD *)buf = 138412290;
    v21 = v8;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Earliest fire date is %@", buf, 0xCu);
  }
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __43__PowerUIAlarmSignalMonitor_nextLocalAlarm__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v5, "nextFireDate");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412546;
      v13 = v7;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_215A71000, v11, OS_LOG_TYPE_DEFAULT, "Unable to obtain next alarm to fire: %@, %@", (uint8_t *)&v12, 0x16u);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (id)requiredFullChargeDate
{
  void *v2;
  void *v3;
  double v4;
  uint64_t v5;
  void *v6;

  -[PowerUIAlarmSignalMonitor nextAlarm](self, "nextAlarm");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (objc_msgSend(v2, "timeIntervalSinceNow"), v4 >= 0.0))
  {
    objc_msgSend(v3, "dateByAddingTimeInterval:", -*(double *)&kBufferBeforeAlarm);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)detectedSignals
{
  void *v2;
  void *v3;
  int v4;
  void *v5;

  -[PowerUIAlarmSignalMonitor nextAlarm](self, "nextAlarm");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToDate:", v3);

  if (v4)
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
  else
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (MTAlarmManager)alarmManager
{
  return self->_alarmManager;
}

- (void)setAlarmManager:(id)a3
{
  objc_storeStrong((id *)&self->_alarmManager, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_alarmManager, 0);
}

@end
