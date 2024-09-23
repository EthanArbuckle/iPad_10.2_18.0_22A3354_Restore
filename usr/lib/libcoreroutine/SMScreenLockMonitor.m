@implementation SMScreenLockMonitor

- (SMScreenLockMonitor)initWithQueue:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  SMScreenLockMonitor *v12;
  SMScreenLockMonitor *v13;
  uint64_t v14;
  id handler;
  NSObject *queue;
  _QWORD block[4];
  SMScreenLockMonitor *v19;
  objc_super v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[SMScreenLockMonitor initWithQueue:handler:]";
    v23 = 1024;
    v24 = 43;
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[SMScreenLockMonitor initWithQueue:handler:]";
      v23 = 1024;
      v24 = 44;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  v20.receiver = self;
  v20.super_class = (Class)SMScreenLockMonitor;
  v12 = -[SMScreenLockMonitor init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a3);
    v14 = objc_msgSend(v9, "copy");
    handler = v13->_handler;
    v13->_handler = (id)v14;

    queue = v13->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__SMScreenLockMonitor_initWithQueue_handler___block_invoke;
    block[3] = &unk_1E92977B8;
    v19 = v13;
    dispatch_async(queue, block);

  }
  return v13;
}

uint64_t __45__SMScreenLockMonitor_initWithQueue_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registerForLockNotifications");
}

- (void)_registerForLockNotifications
{
  NSObject *v3;
  NSObject *v4;
  uint32_t v5;
  NSObject *v6;
  NSObject *v7;
  _BOOL8 v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  _QWORD handler[4];
  id v12;
  id location;
  int out_token;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[SMScreenLockMonitor _registerForLockNotifications]";
    _os_log_debug_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  out_token = 0;
  objc_initWeak(&location, self);
  -[SMScreenLockMonitor queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __52__SMScreenLockMonitor__registerForLockNotifications__block_invoke;
  handler[3] = &unk_1E929C650;
  objc_copyWeak(&v12, &location);
  v5 = notify_register_dispatch((const char *)*MEMORY[0x1E0DAC070], &out_token, v4, handler);

  -[SMScreenLockMonitor setScreenLockNotificationToken:](self, "setScreenLockNotificationToken:", out_token);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[SMScreenLockMonitor _registerForLockNotifications]";
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "%s, unable to register for screen lock notifications", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[SMScreenLockMonitor _registerForLockNotifications]";
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEFAULT, "%s, registered for screen lock notifications", buf, 0xCu);
  }

  v8 = +[SMScreenLockMonitor isDeviceLocked](SMScreenLockMonitor, "isDeviceLocked");
  -[SMScreenLockMonitor handler](self, "handler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SMScreenLockMonitor handler](self, "handler");
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v10[2](v10, v8);

  }
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __52__SMScreenLockMonitor__registerForLockNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _BOOL8 v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "handler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v5;
    if (v2)
    {
      v3 = +[SMScreenLockMonitor isDeviceLocked](SMScreenLockMonitor, "isDeviceLocked");
      objc_msgSend(v5, "handler");
      v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v4[2](v4, v3);

      WeakRetained = v5;
    }
  }

}

- (void)_unregisterForLockNotification
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315138;
    v5 = "-[SMScreenLockMonitor _unregisterForLockNotification]";
    _os_log_debug_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v4, 0xCu);
  }

  notify_cancel(-[SMScreenLockMonitor screenLockNotificationToken](self, "screenLockNotificationToken"));
  -[SMScreenLockMonitor setHandler:](self, "setHandler:", 0);
}

+ (BOOL)isDeviceLocked
{
  return SBSGetScreenLockStatus() != 0;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int)screenLockNotificationToken
{
  return self->_screenLockNotificationToken;
}

- (void)setScreenLockNotificationToken:(int)a3
{
  self->_screenLockNotificationToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
