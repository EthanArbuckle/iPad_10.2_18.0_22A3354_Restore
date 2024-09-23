@implementation HDSPXPCAlarmScheduler

- (HDSPXPCAlarmScheduler)initWithCurrentDateProvider:(id)a3
{
  id v4;
  HDSPXPCAlarmScheduler *v5;
  uint64_t v6;
  id currentDateProvider;
  HDSPXPCAlarmScheduler *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDSPXPCAlarmScheduler;
  v5 = -[HDSPXPCAlarmScheduler init](&v10, sel_init);
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
  char v4;
  id v6;
  void *v7;
  double v8;
  double v9;
  const char *v10;
  time_t v11;
  xpc_object_t xdict;

  v4 = a4;
  v6 = a3;
  xdict = xpc_dictionary_create(0, 0, 0);
  (*((void (**)(void))self->_currentDateProvider + 2))();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v9 = v8;

  v10 = (const char *)objc_msgSend(CFSTR("Date"), "UTF8String");
  v11 = time(0);
  xpc_dictionary_set_date(xdict, v10, 1000000000 * (unint64_t)(ceil(v9) + (double)v11));
  xpc_dictionary_set_BOOL(xdict, (const char *)objc_msgSend(CFSTR("UserVisible"), "UTF8String"), v4 & 1);
  objc_msgSend(CFSTR("com.apple.alarm"), "UTF8String");
  objc_msgSend(CFSTR("com.apple.sleepd.NextAlarm"), "UTF8String");
  xpc_set_event();

}

- (void)unschedule
{
  objc_msgSend(CFSTR("com.apple.alarm"), "UTF8String");
  objc_msgSend(CFSTR("com.apple.sleepd.NextAlarm"), "UTF8String");
  xpc_set_event();
}

- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  _BYTE v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.sleepd.NextAlarm")))
  {
    -[HDSPXPCAlarmScheduler unschedule](self, "unschedule");
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v11 = 138543618;
      *(_QWORD *)&v11[4] = objc_opt_class();
      *(_WORD *)&v11[12] = 2114;
      *(_QWORD *)&v11[14] = v5;
      v7 = *(id *)&v11[4];
      _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] received %{public}@", v11, 0x16u);

    }
    -[HDSPXPCAlarmScheduler delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scheduledEventIsDue");

  }
  objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult", *(_OWORD *)v11, *(_QWORD *)&v11[16], v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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
