@implementation PDSHeartbeatTracker

- (PDSHeartbeatTracker)initWithDelegate:(id)a3 queue:(id)a4 kvStoreBlock:(id)a5 serverBag:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PDSHeartbeatTracker *v15;
  PDSHeartbeatTracker *v16;
  uint64_t v17;
  id kvStoreBlock;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSHeartbeatTracker.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

    if (v12)
    {
LABEL_3:
      if (v13)
        goto LABEL_4;
LABEL_10:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSHeartbeatTracker.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kvStoreBlock"));

      if (v14)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSHeartbeatTracker.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

  if (!v13)
    goto LABEL_10;
LABEL_4:
  if (v14)
    goto LABEL_5;
LABEL_11:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSHeartbeatTracker.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serverBag"));

LABEL_5:
  v24.receiver = self;
  v24.super_class = (Class)PDSHeartbeatTracker;
  v15 = -[PDSHeartbeatTracker init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_delegate, v11);
    objc_storeStrong((id *)&v16->_queue, a4);
    v17 = MEMORY[0x2199F31C4](v13);
    kvStoreBlock = v16->_kvStoreBlock;
    v16->_kvStoreBlock = (id)v17;

    objc_storeStrong((id *)&v16->_serverBag, a6);
  }

  return v16;
}

- (void)_handleHeartbeatFired
{
  id v3;

  -[PDSHeartbeatTracker delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "heartbeatFiredForTracker:", self);

}

- (void)noteUpdatedHeartbeatTTL:(double)a3
{
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  int v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[PDSHeartbeatTracker serverBag](self, "serverBag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (double)arc4random_uniform(objc_msgSend(v5, "ttlWindowFromBag"));

  -[PDSHeartbeatTracker serverBag](self, "serverBag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (double)objc_msgSend(v7, "ttlGracePeriodFromBag");

  if (a3 - v8 - v6 >= 3600.0)
    v9 = a3 - v8 - v6;
  else
    v9 = 3600.0;
  pds_defaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134217984;
    v12 = v9;
    _os_log_impl(&dword_215E64000, v10, OS_LOG_TYPE_DEFAULT, "Scheduling heartbeat in: %f", (uint8_t *)&v11, 0xCu);
  }

  -[PDSHeartbeatTracker _markNextCheckpointTimeWithTTL:](self, "_markNextCheckpointTimeWithTTL:", v9);
  -[PDSHeartbeatTracker noteShouldTrackHeartbeat](self, "noteShouldTrackHeartbeat");
}

- (void)_setupMaintenanceActivity
{
  const char *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  id v9;
  id location;

  if (!-[PDSHeartbeatTracker scheduledActivity](self, "scheduledActivity"))
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v3 = (const char *)*MEMORY[0x24BE6E520];
    v4 = (void *)*MEMORY[0x24BDAC5A0];
    v5 = MEMORY[0x24BDAC760];
    v6 = 3221225472;
    v7 = __48__PDSHeartbeatTracker__setupMaintenanceActivity__block_invoke;
    v8 = &unk_24D4A7230;
    objc_copyWeak(&v9, &location);
    xpc_activity_register(v3, v4, &v5);
    -[PDSHeartbeatTracker setScheduledActivity:](self, "setScheduledActivity:", 1, v5, v6, v7, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __48__PDSHeartbeatTracker__setupMaintenanceActivity__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  id WeakRetained;
  xpc_activity_state_t state;
  NSObject *v6;
  xpc_object_t v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  NSObject *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    objc_msgSend(WeakRetained, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__PDSHeartbeatTracker__setupMaintenanceActivity__block_invoke_15;
    block[3] = &unk_24D4A6EE8;
    block[4] = WeakRetained;
    dispatch_async(v6, block);
LABEL_10:

    goto LABEL_11;
  }
  if (!state)
  {
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v6, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A0]);
    xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x24BDAC598], 0);
    xpc_dictionary_set_int64(v6, (const char *)*MEMORY[0x24BDAC5F0], *MEMORY[0x24BDAC600]);
    v7 = xpc_activity_copy_criteria(v3);
    v8 = v7;
    if (!v7 || !xpc_equal(v7, v6))
      xpc_activity_set_criteria(v3, v6);
    pds_defaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_impl(&dword_215E64000, v9, OS_LOG_TYPE_DEFAULT, "Scheduling heartbeat XPC activity %@", buf, 0xCu);
    }

    goto LABEL_10;
  }
LABEL_11:

}

uint64_t __48__PDSHeartbeatTracker__setupMaintenanceActivity__block_invoke_15(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  pds_defaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_215E64000, v2, OS_LOG_TYPE_DEFAULT, "Heartbeat XPC activity fired", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_handleHeartbeatFired");
}

- (void)noteShouldNotTrackHeartbeat
{
  void *v3;

  xpc_activity_unregister((const char *)*MEMORY[0x24BE6E520]);
  -[PDSHeartbeatTracker setScheduledActivity:](self, "setScheduledActivity:", 0);
  -[PDSHeartbeatTracker heartbeatTimer](self, "heartbeatTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[PDSHeartbeatTracker setHeartbeatTimer:](self, "setHeartbeatTimer:", 0);
}

- (void)noteShouldTrackHeartbeat
{
  void *v3;
  void *v4;
  int v5;
  IMDispatchTimer *heartbeatTimer;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  IMDispatchTimer *v14;
  IMDispatchTimer *v15;
  _QWORD v16[5];

  -[PDSHeartbeatTracker trackedHeartbeatDate](self, "trackedHeartbeatDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDSHeartbeatTracker delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldScheduleHeartbeatForTracker:", self);

  if (v5)
  {
    -[IMDispatchTimer invalidate](self->_heartbeatTimer, "invalidate");
    heartbeatTimer = self->_heartbeatTimer;
    self->_heartbeatTimer = 0;

    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceDate:", v7);
    v9 = v8;

    v10 = (double)arc4random_uniform(0x3Cu) + 21600.0;
    if (v9 < v10)
      v10 = v9;
    v11 = fmax(v10, 3600.0);
    v12 = objc_alloc(MEMORY[0x24BE50888]);
    im_primary_queue();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __47__PDSHeartbeatTracker_noteShouldTrackHeartbeat__block_invoke;
    v16[3] = &unk_24D4A7258;
    v16[4] = self;
    v14 = (IMDispatchTimer *)objc_msgSend(v12, "initWithQueue:interval:repeats:handlerBlock:", v13, (unint64_t)v11, 0, v16);
    v15 = self->_heartbeatTimer;
    self->_heartbeatTimer = v14;

    -[PDSHeartbeatTracker _setupMaintenanceActivity](self, "_setupMaintenanceActivity");
  }

}

void __47__PDSHeartbeatTracker_noteShouldTrackHeartbeat__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_handleHeartbeatFired");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

}

- (BOOL)isPassedTrackedHeartbeatDate
{
  void *v2;
  NSObject *v3;
  double v4;
  double v5;
  NSObject *v6;
  double v7;
  BOOL v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[PDSHeartbeatTracker trackedHeartbeatDate](self, "trackedHeartbeatDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  pds_defaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v2;
    _os_log_impl(&dword_215E64000, v3, OS_LOG_TYPE_DEFAULT, "Next checkpoint time %@", (uint8_t *)&v10, 0xCu);
  }

  if (v2)
  {
    objc_msgSend(v2, "timeIntervalSinceReferenceDate");
    v5 = v4 + -300.0;
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject timeIntervalSinceReferenceDate](v6, "timeIntervalSinceReferenceDate");
    v8 = v7 > v5;
  }
  else
  {
    pds_defaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_215E64000, v6, OS_LOG_TYPE_DEFAULT, "No checkpoint time saved. Heartbeating", (uint8_t *)&v10, 2u);
    }
    v8 = 1;
  }

  return v8;
}

- (NSDate)trackedHeartbeatDate
{
  void (**v2)(void);
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PDSHeartbeatTracker kvStoreBlock](self, "kvStoreBlock");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "numberForKey:", CFSTR("kPDSNextCheckpointTime"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(v4, "doubleValue");
  objc_msgSend(v5, "dateWithTimeIntervalSince1970:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v6;
}

- (void)_markNextCheckpointTimeWithTTL:(double)a3
{
  void (**v4)(void);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[PDSHeartbeatTracker kvStoreBlock](self, "kvStoreBlock");
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v4[2]();
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  objc_msgSend(v5, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNumber:forKey:", v8, CFSTR("kPDSNextCheckpointTime"));

}

- (IMDispatchTimer)heartbeatTimer
{
  return self->_heartbeatTimer;
}

- (void)setHeartbeatTimer:(id)a3
{
  objc_storeStrong((id *)&self->_heartbeatTimer, a3);
}

- (IDSServerBag)serverBag
{
  return self->_serverBag;
}

- (void)setServerBag:(id)a3
{
  objc_storeStrong((id *)&self->_serverBag, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (id)kvStoreBlock
{
  return self->_kvStoreBlock;
}

- (void)setKvStoreBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (PDSHeartbeatTrackerDelegate)delegate
{
  return (PDSHeartbeatTrackerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)scheduledActivity
{
  return self->_scheduledActivity;
}

- (void)setScheduledActivity:(BOOL)a3
{
  self->_scheduledActivity = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_kvStoreBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_serverBag, 0);
  objc_storeStrong((id *)&self->_heartbeatTimer, 0);
}

@end
