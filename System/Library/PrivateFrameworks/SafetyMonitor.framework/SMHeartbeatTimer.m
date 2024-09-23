@implementation SMHeartbeatTimer

- (SMHeartbeatTimer)init
{
  SMHeartbeatTimer *v2;
  SMHeartbeatTimer *v3;
  SMHeartbeatTimer *v4;
  NSObject *v5;
  const char *v6;
  id v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  NSTimer *heartbeatTimer;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SMHeartbeatTimer;
  v2 = -[SMHeartbeatTimer init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (const char *)-[SMHeartbeatTimer UTF8String](objc_retainAutorelease(v4), "UTF8String");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), v4);
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v6 = (const char *)objc_msgSend(v7, "UTF8String");

    }
    v8 = dispatch_queue_create(v6, v5);

    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v8;

    heartbeatTimer = v4->_heartbeatTimer;
    v4->_heartbeatTimer = 0;

  }
  return v3;
}

- (void)startHeartbeatForSessionID:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[SMHeartbeatTimer queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__SMHeartbeatTimer_startHeartbeatForSessionID_handler___block_invoke;
  block[3] = &unk_25166DDC8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __55__SMHeartbeatTimer_startHeartbeatForSessionID_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startHeartbeatForSessionID:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_startHeartbeatForSessionID:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    -[SMHeartbeatTimer heartbeatTimer](self, "heartbeatTimer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v24 = "-[SMHeartbeatTimer _startHeartbeatForSessionID:handler:]";
    v25 = 2112;
    v26 = v6;
    v27 = 2112;
    v28 = v9;
    _os_log_impl(&dword_245521000, v8, OS_LOG_TYPE_INFO, "%s, sessionID, %@, heartbeatTimer, %@", buf, 0x20u);

  }
  -[SMHeartbeatTimer heartbeatTimer](self, "heartbeatTimer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    -[SMHeartbeatTimer _stopHeartbeatWithHandler:](self, "_stopHeartbeatWithHandler:", 0);
  v11 = (void *)MEMORY[0x24BDBCF40];
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __56__SMHeartbeatTimer__startHeartbeatForSessionID_handler___block_invoke;
  v20 = &unk_25166DDF0;
  v21 = v6;
  v22 = v7;
  v12 = v7;
  v13 = v6;
  objc_msgSend(v11, "timerWithTimeInterval:repeats:block:", 1, &v17, 60.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMHeartbeatTimer setHeartbeatTimer:](self, "setHeartbeatTimer:", v14, v17, v18, v19, v20);

  objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMHeartbeatTimer heartbeatTimer](self, "heartbeatTimer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addTimer:forMode:", v16, *MEMORY[0x24BDBCB80]);

}

void __56__SMHeartbeatTimer__startHeartbeatForSessionID_handler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "-[SMHeartbeatTimer _startHeartbeatForSessionID:handler:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_245521000, v2, OS_LOG_TYPE_INFO, "Heartbeat timer fired %s, sessionID, %@", (uint8_t *)&v5, 0x16u);
  }

  +[SMSafetyMonitorManager defaultManager](SMSafetyMonitorManager, "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendHeartbeatForSessionID:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)stopHeartbeatWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SMHeartbeatTimer queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__SMHeartbeatTimer_stopHeartbeatWithHandler___block_invoke;
  v7[3] = &unk_25166D9A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __45__SMHeartbeatTimer_stopHeartbeatWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopHeartbeatWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_stopHeartbeatWithHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 136315138;
    v8 = "-[SMHeartbeatTimer _stopHeartbeatWithHandler:]";
    _os_log_impl(&dword_245521000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v7, 0xCu);
  }

  -[SMHeartbeatTimer heartbeatTimer](self, "heartbeatTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[SMHeartbeatTimer setHeartbeatTimer:](self, "setHeartbeatTimer:", 0);
  if (v4)
    v4[2](v4, 0);

}

- (NSTimer)heartbeatTimer
{
  return self->_heartbeatTimer;
}

- (void)setHeartbeatTimer:(id)a3
{
  objc_storeStrong((id *)&self->_heartbeatTimer, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_heartbeatTimer, 0);
}

@end
