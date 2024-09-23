@implementation OSIAlarmMonitor

- (OSIAlarmMonitor)init
{
  OSIAlarmMonitor *v2;
  MTAlarmManager *v3;
  MTAlarmManager *alarmManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OSIAlarmMonitor;
  v2 = -[OSIAlarmMonitor init](&v6, "init");
  if (v2)
  {
    v3 = (MTAlarmManager *)objc_alloc_init((Class)MTAlarmManager);
    alarmManager = v2->_alarmManager;
    v2->_alarmManager = v3;

  }
  return v2;
}

- (id)nextAlarmFireDateBetweenDate:(id)a3 andDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  double v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD v16[4];
  NSObject *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    objc_msgSend(v7, "timeIntervalSinceDate:", v6);
    if (v10 <= 0.0)
    {
      v9 = 0;
    }
    else
    {
      v11 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v6, v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTAlarmManager nextAlarmsInRange:maxCount:includeSleepAlarm:](self->_alarmManager, "nextAlarmsInRange:maxCount:includeSleepAlarm:", v11, 64, 1));
      v19 = 0;
      v20 = &v19;
      v21 = 0x3032000000;
      v22 = sub_10000EC80;
      v23 = sub_10000EC90;
      v24 = 0;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10000EC98;
      v16[3] = &unk_100060BC0;
      v18 = &v19;
      v13 = dispatch_semaphore_create(0);
      v17 = v13;
      v14 = objc_msgSend(v12, "addCompletionBlock:", v16);
      dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
      v9 = (id)v20[5];

      _Block_object_dispose(&v19, 8);
    }
  }

  return v9;
}

- (MTAlarmManager)alarmManager
{
  return self->_alarmManager;
}

- (void)setAlarmManager:(id)a3
{
  objc_storeStrong((id *)&self->_alarmManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmManager, 0);
}

@end
