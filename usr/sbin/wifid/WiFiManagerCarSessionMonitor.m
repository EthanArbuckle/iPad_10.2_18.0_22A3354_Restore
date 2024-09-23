@implementation WiFiManagerCarSessionMonitor

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100063F78;
  block[3] = &unk_10022EA38;
  block[4] = a1;
  if (qword_10026D5F8 != -1)
    dispatch_once(&qword_10026D5F8, block);
  return (id)qword_10026D5F0;
}

- (void)initializeWithManager:(__WiFiManager *)a3 queue:(id)a4
{
  id v6;
  id v7;
  __CFNotificationCenter *DarwinNotifyCenter;

  v6 = a4;
  -[WiFiManagerCarSessionMonitor setManager:](self, "setManager:", a3);
  -[WiFiManagerCarSessionMonitor setQueue:](self, "setQueue:", v6);

  self->_carDNDActive = 0;
  v7 = objc_alloc_init((Class)CARAutomaticDNDStatus);
  -[WiFiManagerCarSessionMonitor setDndStatus:](self, "setDndStatus:", v7);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100064034, CFSTR("CARAutomaticDNDStatusChangedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  -[WiFiManagerCarSessionMonitor _updateDNDStatus](self, "_updateDNDStatus");
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("CARAutomaticDNDStatusChangedNotification"), 0);
  v4.receiver = self;
  v4.super_class = (Class)WiFiManagerCarSessionMonitor;
  -[WiFiManagerCarSessionMonitor dealloc](&v4, "dealloc");
}

- (void)sessionDidConnect:(id)a3
{
  id v4;
  void *v5;
  CARSessionConfiguration *v6;
  CARSessionConfiguration *carPlaySessionConfiguration;
  CARSessionConfiguration *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  NSObject *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  _QWORD block[5];
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;

  v4 = a3;
  if (v4)
  {
    v5 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: carplay session started", "-[WiFiManagerCarSessionMonitor sessionDidConnect:]");
    objc_autoreleasePoolPop(v5);
    v6 = (CARSessionConfiguration *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
    carPlaySessionConfiguration = self->carPlaySessionConfiguration;
    self->carPlaySessionConfiguration = v6;

    v8 = self->carPlaySessionConfiguration;
    if (v8)
    {
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CARSessionConfiguration vehicleModelName](v8, "vehicleModelName"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CARSessionConfiguration vehicleManufacturer](self->carPlaySessionConfiguration, "vehicleManufacturer"));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CARSessionConfiguration vehicleHardwareVersion](self->carPlaySessionConfiguration, "vehicleHardwareVersion"));
      if (v9)
        v12 = v9;
      else
        v12 = CFSTR("unknown");
      v13 = v12;

      if (v10)
        v14 = v10;
      else
        v14 = CFSTR("unknown");
      v15 = v14;

      if (v11)
        v16 = v11;
      else
        v16 = CFSTR("unknown");
      v17 = v16;

      v18 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: vehicleModelName %@, vehicleManufacturer %@, vehicleHardwareVersion %@", "-[WiFiManagerCarSessionMonitor sessionDidConnect:]", v13, v15, v17);
      objc_autoreleasePoolPop(v18);
      v19 = objc_claimAutoreleasedReturnValue(-[WiFiManagerCarSessionMonitor queue](self, "queue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100064274;
      block[3] = &unk_10022F4D0;
      block[4] = self;
      v24 = v13;
      v25 = v15;
      v26 = v17;
      v20 = v17;
      v21 = v15;
      v22 = v13;
      dispatch_async(v19, block);

    }
  }

}

- (void)sessionDidDisconnect:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD block[5];

  v4 = a3;
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[WiFiManagerCarSessionMonitor queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100064368;
    block[3] = &unk_10022E8F8;
    block[4] = self;
    dispatch_async(v5, block);

    v6 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: carplay session ended", "-[WiFiManagerCarSessionMonitor sessionDidDisconnect:]");
    objc_autoreleasePoolPop(v6);
  }

}

- (void)startMonitoringCarSession
{
  CARSessionStatus *v3;
  CARSessionStatus *carSessionStatus;

  v3 = (CARSessionStatus *)objc_alloc_init((Class)CARSessionStatus);
  carSessionStatus = self->carSessionStatus;
  self->carSessionStatus = v3;

  -[CARSessionStatus addSessionObserver:](self->carSessionStatus, "addSessionObserver:", self);
}

- (void)stopMonitoringCarSession
{
  -[CARSessionStatus removeSessionObserver:](self->carSessionStatus, "removeSessionObserver:", self);
}

- (void)_updateDNDStatus
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[WiFiManagerCarSessionMonitor queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100064444;
  block[3] = &unk_10022E8F8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (BOOL)isCarDNDActive
{
  return self->_carDNDActive;
}

- (void)setCarDNDActive:(BOOL)a3
{
  self->_carDNDActive = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (__WiFiManager)manager
{
  return self->_manager;
}

- (void)setManager:(__WiFiManager *)a3
{
  self->_manager = a3;
}

- (CARAutomaticDNDStatus)dndStatus
{
  return self->_dndStatus;
}

- (void)setDndStatus:(id)a3
{
  objc_storeStrong((id *)&self->_dndStatus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dndStatus, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->carPlaySessionConfiguration, 0);
  objc_storeStrong((id *)&self->carSessionStatus, 0);
}

@end
