@implementation SATime

- (void)advanceTimeWithEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSDate *now;
  void *v11;
  uint64_t v12;
  NSDate *v13;
  NSDate *v14;
  _DWORD v15[2];
  __int16 v16;
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "getDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  if (v7 == 1)
  {
    v8 = (id)TASALog;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = 68289283;
      v15[1] = 0;
      v16 = 2082;
      v17 = "";
      v18 = 2113;
      v19 = v9;
      _os_log_impl(&dword_1CA04F000, v8, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SATime received event with future date\", \"Event\":\"%{private}@\"}", (uint8_t *)v15, 0x1Cu);

    }
  }
  else
  {
    now = self->_now;
    objc_msgSend(v4, "getDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NSDate compare:](now, "compare:", v11);

    if (v12 == -1)
    {
      objc_msgSend(v4, "getDate");
      v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
      v14 = self->_now;
      self->_now = v13;

    }
    -[SATime fireAlarmsIfReady](self, "fireAlarmsIfReady");
  }

}

- (void)fireAlarmsIfReady
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  -[SATime earliestAlarm](self, "earliestAlarm");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    while (1)
    {
      -[SATime now](self, "now");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fireDate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v3, "compare:", v4);

      if (v5 == -1)
        break;
      -[SATime alarmFired:](self, "alarmFired:", v8);
      -[SATime popAlarm](self, "popAlarm");
      -[SATime earliestAlarm](self, "earliestAlarm");
      v6 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v6;
      if (!v6)
      {
        v7 = 0;
        goto LABEL_7;
      }
    }
    v7 = v8;
LABEL_7:

  }
}

- (id)earliestAlarm
{
  _QWORD *v3;
  id v4;

  v3 = -[SATime alarmQueue](self, "alarmQueue");
  if (*v3 == v3[1])
    v4 = 0;
  else
    v4 = **(id **)-[SATime alarmQueue](self, "alarmQueue");
  return v4;
}

- (void)alarmQueue
{
  return self->_alarmQueue;
}

- (SATime)initWithExternalTimer:(id)a3 isReplay:(BOOL)a4
{
  id v6;
  SATime *v7;
  NSMutableSet *v8;
  NSMutableSet *ongoingAlarms;
  uint64_t v10;
  NSDate *now;
  _QWORD *v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SATime;
  v7 = -[SATime init](&v14, sel_init);
  if (v7)
  {
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    ongoingAlarms = v7->_ongoingAlarms;
    v7->_ongoingAlarms = v8;

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v10 = objc_claimAutoreleasedReturnValue();
    now = v7->_now;
    v7->_now = (NSDate *)v10;

    v12 = (_QWORD *)operator new();
    *v12 = 0;
    v12[1] = 0;
    v12[2] = 0;
    v7->_alarmQueue = v12;
    objc_storeWeak((id *)&v7->_externalTimer, v6);
    v7->_isReplay = a4;
  }

  return v7;
}

- (void)dealloc
{
  void *alarmQueue;
  objc_super v4;
  void **v5;

  alarmQueue = self->_alarmQueue;
  if (alarmQueue)
  {
    v5 = (void **)self->_alarmQueue;
    std::vector<SAAlarmTask * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v5);
    MEMORY[0x1CAA49634](alarmQueue, 0x80C402512154ALL);
  }
  self->_alarmQueue = 0;
  v4.receiver = self;
  v4.super_class = (Class)SATime;
  -[SATime dealloc](&v4, sel_dealloc);
}

- (unint64_t)alarmCount
{
  return (uint64_t)(*((_QWORD *)self->_alarmQueue + 1) - *(_QWORD *)self->_alarmQueue) >> 3;
}

- (void)addAlarm:(id)a3
{
  uint64_t *v4;
  id v5;
  char v6;

  v5 = a3;
  if (v5)
  {
    v4 = -[SATime alarmQueue](self, "alarmQueue");
    std::vector<SAAlarmTask * {__strong}>::push_back[abi:ne180100]((char **)v4, &v5);
    std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,SAAlarmClassCompare &,std::__wrap_iter<SAAlarmTask * {__strong}*>>(*v4, v4[1], (uint64_t)&v6, (v4[1] - *v4) >> 3);

  }
}

- (void)popAlarm
{
  _QWORD *v3;

  v3 = -[SATime alarmQueue](self, "alarmQueue");
  if (*v3 != v3[1])
    std::priority_queue<SAAlarmTask * {__strong},std::vector<SAAlarmTask * {__strong}>,SAAlarmClassCompare>::pop((uint64_t)-[SATime alarmQueue](self, "alarmQueue"));
}

- (void)cancelAlarmWithUUID:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  if (-[NSMutableSet containsObject:](self->_ongoingAlarms, "containsObject:"))
  {
    -[NSMutableSet removeObject:](self->_ongoingAlarms, "removeObject:", v5);
    WeakRetained = objc_loadWeakRetained((id *)&self->_externalTimer);
    objc_msgSend(WeakRetained, "cancelSATimeEventForAlarm:", v5);

  }
}

- (id)setupAlarmFireAt:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SAAlarmTask *v9;
  void *v10;
  double v11;
  double v12;
  id WeakRetained;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(SAAlarmTask);
    -[SAAlarmTask setAlarmUUID:](v9, "setAlarmUUID:", v8);
    -[SAAlarmTask setFireDate:](v9, "setFireDate:", v6);
    -[SAAlarmTask setClient:](v9, "setClient:", v7);
    -[NSMutableSet addObject:](self->_ongoingAlarms, "addObject:", v8);
    -[SATime addAlarm:](self, "addAlarm:", v9);
    -[SATime getCurrentTime](self, "getCurrentTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v10);
    v12 = v11;

    if (v12 > 0.0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_externalTimer);
      objc_msgSend(WeakRetained, "scheduleSATimeEvent:forAlarm:", v8, v12);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)alarmFired:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSMutableSet *ongoingAlarms;
  void *v10;
  char v11;
  char v12;
  NSMutableSet *v13;
  void *v14;
  void *v15;
  _DWORD v16[2];
  __int16 v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)TASALog;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "alarmUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fireDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = 68289795;
    v16[1] = 0;
    v17 = 2082;
    v18 = "";
    v19 = 2113;
    v20 = v7;
    v21 = 2113;
    v22 = v8;
    v23 = 2113;
    v24 = v5;
    _os_log_impl(&dword_1CA04F000, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SATime alarm fired\", \"uuid\":\"%{private}@\", \"alarmDate\":\"%{private}@\", \"client\":\"%{private}@\"}", (uint8_t *)v16, 0x30u);

  }
  ongoingAlarms = self->_ongoingAlarms;
  objc_msgSend(v4, "alarmUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NSMutableSet containsObject:](ongoingAlarms, "containsObject:", v10);
  if (v5)
    v12 = v11;
  else
    v12 = 0;

  if ((v12 & 1) != 0)
  {
    v13 = self->_ongoingAlarms;
    objc_msgSend(v4, "alarmUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet removeObject:](v13, "removeObject:", v14);

    objc_msgSend(v4, "alarmUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alarmFiredForUUID:", v15);

  }
}

- (id)getCurrentTime
{
  NSDate *v3;

  if (-[SATime isReplay](self, "isReplay"))
  {
    v3 = self->_now;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)getEarliestAlarmDate
{
  _QWORD *v3;
  void *v4;

  v3 = -[SATime alarmQueue](self, "alarmQueue");
  if (*v3 == v3[1])
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(**(id **)-[SATime alarmQueue](self, "alarmQueue"), "fireDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (NSDate)now
{
  return self->_now;
}

- (NSMutableSet)ongoingAlarms
{
  return self->_ongoingAlarms;
}

- (void)setOngoingAlarms:(id)a3
{
  objc_storeStrong((id *)&self->_ongoingAlarms, a3);
}

- (void)setAlarmQueue:(void *)a3
{
  self->_alarmQueue = a3;
}

- (SATimeEventRequestProtocol)externalTimer
{
  return (SATimeEventRequestProtocol *)objc_loadWeakRetained((id *)&self->_externalTimer);
}

- (void)setExternalTimer:(id)a3
{
  objc_storeWeak((id *)&self->_externalTimer, a3);
}

- (BOOL)isReplay
{
  return self->_isReplay;
}

- (void)setIsReplay:(BOOL)a3
{
  self->_isReplay = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_externalTimer);
  objc_storeStrong((id *)&self->_ongoingAlarms, 0);
  objc_storeStrong((id *)&self->_now, 0);
}

@end
