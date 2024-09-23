@implementation RMAudioAccessoryManager

+ (id)internal
{
  return +[RMAudioAccessoryManagerSharedInternal sharedInternal](RMAudioAccessoryManagerSharedInternal, "sharedInternal");
}

- (RMAudioAccessoryManager)init
{
  RMAudioAccessoryManager *v2;
  RMAudioAccessoryManager *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  objc_super v14;
  uint8_t buf[4];
  RMAudioAccessoryManager *v16;
  __int16 v17;
  void *v18;

  v14.receiver = self;
  v14.super_class = (Class)RMAudioAccessoryManager;
  v2 = -[RMAudioAccessoryManager init](&v14, "init");
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend((id)objc_opt_class(v2), "internal");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    objc_sync_enter(v5);
    -[RMAudioAccessoryManager setSubscribedToStatus:](v3, "setSubscribedToStatus:", 0);
    v6 = objc_msgSend((id)objc_opt_class(v3), "internal");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "managers"));
    objc_msgSend(v8, "addObject:", v3);

    if (qword_10002C4B0 != -1)
      dispatch_once(&qword_10002C4B0, &stru_100024CE8);
    v9 = (id)qword_10002C4B8;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend((id)objc_opt_class(v3), "internal");
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "managers"));
      *(_DWORD *)buf = 134283779;
      v16 = v3;
      v17 = 2113;
      v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[RMAudioAccessoryManager] %{private}p.init managers: %{private}@", buf, 0x16u);

    }
    objc_sync_exit(v5);

  }
  return v3;
}

- (void)dealloc
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  RMAudioAccessoryManager *v14;
  __int16 v15;
  void *v16;

  v3 = objc_msgSend((id)objc_opt_class(self), "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_sync_enter(v4);
  -[RMAudioAccessoryManager stopDeviceMotionUpdates](self, "stopDeviceMotionUpdates");
  v5 = objc_msgSend((id)objc_opt_class(self), "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "managers"));
  objc_msgSend(v7, "removeObject:", self);

  if (qword_10002C4B0 != -1)
    dispatch_once(&qword_10002C4B0, &stru_100024CE8);
  v8 = (id)qword_10002C4B8;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend((id)objc_opt_class(self), "internal");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "managers"));
    *(_DWORD *)buf = 134283779;
    v14 = self;
    v15 = 2113;
    v16 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[RMAudioAccessoryManager] %{private}p.dealloc managers: %{private}@", buf, 0x16u);

  }
  objc_sync_exit(v4);

  v12.receiver = self;
  v12.super_class = (Class)RMAudioAccessoryManager;
  -[RMAudioAccessoryManager dealloc](&v12, "dealloc");
}

- (void)startDeviceMotionUpdatesWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = objc_msgSend((id)objc_opt_class(self), "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_sync_enter(v5);
  -[RMAudioAccessoryManager setDeviceMotionHandler:](self, "setDeviceMotionHandler:", v8);
  v6 = objc_msgSend((id)objc_opt_class(self), "internal");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v7, "startOrStopDeviceMotionUpdates");

  objc_sync_exit(v5);
}

- (void)stopDeviceMotionUpdates
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id obj;

  v3 = objc_msgSend((id)objc_opt_class(self), "internal");
  obj = (id)objc_claimAutoreleasedReturnValue(v3);
  objc_sync_enter(obj);
  if (!-[RMAudioAccessoryManager subscribedToStatus](self, "subscribedToStatus"))
    -[RMAudioAccessoryManager setDeviceMotionStatusHandler:](self, "setDeviceMotionStatusHandler:", 0);
  v4 = objc_msgSend((id)objc_opt_class(self), "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v5, "startOrStopStatusUpdates");

  -[RMAudioAccessoryManager setDeviceMotionHandler:](self, "setDeviceMotionHandler:", 0);
  v6 = objc_msgSend((id)objc_opt_class(self), "internal");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v7, "startOrStopDeviceMotionUpdates");

  objc_sync_exit(obj);
}

- (void)startStatusUpdatesWithHandler:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = objc_msgSend((id)objc_opt_class(self), "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_sync_enter(v5);
  -[RMAudioAccessoryManager setSubscribedToStatus:](self, "setSubscribedToStatus:", 1);
  -[RMAudioAccessoryManager setDeviceMotionStatusHandler:](self, "setDeviceMotionStatusHandler:", v11);
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[RMAudioAccessoryManager deviceMotionStatusHandler](self, "deviceMotionStatusHandler"));
  v7 = objc_msgSend((id)objc_opt_class(self), "internal");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  ((void (**)(_QWORD, id, _QWORD))v6)[2](v6, objc_msgSend(v8, "lastDeviceStatus"), 0);

  v9 = objc_msgSend((id)objc_opt_class(self), "internal");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v10, "startOrStopStatusUpdates");

  objc_sync_exit(v5);
}

- (void)stopStatusUpdates
{
  id v3;
  id v4;
  void *v5;
  id obj;

  v3 = objc_msgSend((id)objc_opt_class(self), "internal");
  obj = (id)objc_claimAutoreleasedReturnValue(v3);
  objc_sync_enter(obj);
  -[RMAudioAccessoryManager setDeviceMotionStatusHandler:](self, "setDeviceMotionStatusHandler:", 0);
  -[RMAudioAccessoryManager setSubscribedToStatus:](self, "setSubscribedToStatus:", 0);
  v4 = objc_msgSend((id)objc_opt_class(self), "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v5, "startOrStopStatusUpdates");

  objc_sync_exit(obj);
}

- (void)startActivityUpdatesWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = objc_msgSend((id)objc_opt_class(self), "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_sync_enter(v5);
  -[RMAudioAccessoryManager setActivityHandler:](self, "setActivityHandler:", v8);
  v6 = objc_msgSend((id)objc_opt_class(self), "internal");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v7, "startOrStopActivityUpdates");

  objc_sync_exit(v5);
}

- (void)stopActivityUpdates
{
  id v3;
  id v4;
  void *v5;
  id obj;

  v3 = objc_msgSend((id)objc_opt_class(self), "internal");
  obj = (id)objc_claimAutoreleasedReturnValue(v3);
  objc_sync_enter(obj);
  -[RMAudioAccessoryManager setActivityHandler:](self, "setActivityHandler:", 0);
  v4 = objc_msgSend((id)objc_opt_class(self), "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v5, "startOrStopActivityUpdates");

  objc_sync_exit(obj);
}

+ (BOOL)isTempestActive
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "internal"));
  v3 = objc_msgSend(v2, "isTempestActive");

  return v3;
}

+ (void)setTempestActive:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "internal"));
  objc_msgSend(v4, "setTempestActive:", v3);

}

- (BOOL)subscribedToStatus
{
  return self->_subscribedToStatus;
}

- (void)setSubscribedToStatus:(BOOL)a3
{
  self->_subscribedToStatus = a3;
}

- (id)deviceMotionHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setDeviceMotionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (id)deviceMotionStatusHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setDeviceMotionStatusHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (id)activityHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setActivityHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_activityHandler, 0);
  objc_storeStrong(&self->_deviceMotionStatusHandler, 0);
  objc_storeStrong(&self->_deviceMotionHandler, 0);
}

@end
