@implementation HDSPGCDTimerScheduler

- (HDSPGCDTimerScheduler)initWithCurrentDateProvider:(id)a3
{
  id v4;
  HDSPGCDTimerScheduler *v5;
  uint64_t v6;
  id currentDateProvider;
  HDSPGCDTimerScheduler *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDSPGCDTimerScheduler;
  v5 = -[HDSPGCDTimerScheduler init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    currentDateProvider = v5->_currentDateProvider;
    v5->_currentDateProvider = (id)v6;

    v8 = v5;
  }

  return v5;
}

- (void)scheduleEventForDate:(id)a3 options:(unint64_t)a4
{
  _QWORD *currentDateProvider;
  void (*v6)(_QWORD *);
  id v7;
  void *v8;
  double v9;
  double v10;
  dispatch_time_t v11;
  _QWORD block[5];

  currentDateProvider = self->_currentDateProvider;
  v6 = (void (*)(_QWORD *))currentDateProvider[2];
  v7 = a3;
  v6(currentDateProvider);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  v10 = v9;

  v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__HDSPGCDTimerScheduler_scheduleEventForDate_options___block_invoke;
  block[3] = &unk_24D4E3498;
  block[4] = self;
  dispatch_after(v11, MEMORY[0x24BDAC9B8], block);
}

void __54__HDSPGCDTimerScheduler_scheduleEventForDate_options___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scheduledEventIsDue");

}

- (HDSPEventScheduleDelegate)delegate
{
  return (HDSPEventScheduleDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (id)currentDateProvider
{
  return self->_currentDateProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_currentDateProvider, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
