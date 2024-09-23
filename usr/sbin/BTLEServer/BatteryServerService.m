@implementation BatteryServerService

- (BatteryServerService)init
{
  BatteryServerService *v2;
  id v3;
  void *v4;
  CBMutableCharacteristic *v5;
  CBMutableCharacteristic *batteryLevelCharacteristic;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  objc_super v13;
  CBMutableCharacteristic *v14;

  v13.receiver = self;
  v13.super_class = (Class)BatteryServerService;
  v2 = -[BatteryServerService init](&v13, "init");
  if (v2)
  {
    v3 = objc_alloc((Class)CBMutableCharacteristic);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDBatteryLevelCharacteristicString));
    v5 = (CBMutableCharacteristic *)objc_msgSend(v3, "initWithType:properties:value:permissions:", v4, 1042, 0, 17);
    batteryLevelCharacteristic = v2->_batteryLevelCharacteristic;
    v2->_batteryLevelCharacteristic = v5;

    v7 = objc_alloc((Class)CBMutableService);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDBatteryServiceString));
    v9 = objc_msgSend(v7, "initWithType:primary:", v8, 1);
    -[ServerService setService:](v2, "setService:", v9);

    v14 = v2->_batteryLevelCharacteristic;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ServerService service](v2, "service"));
    objc_msgSend(v11, "setCharacteristics:", v10);

    v2->_iopsNotifyPercentChangeToken = -1;
  }
  return v2;
}

- (void)stop
{
  objc_super v3;

  if (-[BatteryServerService iopsNotifyPercentChangeToken](self, "iopsNotifyPercentChangeToken") != -1)
    -[BatteryServerService stopNotifications](self, "stopNotifications");
  v3.receiver = self;
  v3.super_class = (Class)BatteryServerService;
  -[ServerService stop](&v3, "stop");
}

- (id)batteryLevelValue
{
  void *v2;
  void *v3;
  int v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DataOutputStream outputStream](DataOutputStream, "outputStream"));
  v5 = 0;
  IOPSGetPercentRemaining(&v5, 0, 0);
  objc_msgSend(v2, "writeUint8:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "data"));

  return v3;
}

- (void)updateBatterylevel
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BatteryServerService batteryLevelValue](self, "batteryLevelValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryServerService batteryLevelCharacteristic](self, "batteryLevelCharacteristic"));
  -[ServerService updateValue:forCharacteristic:onSubscribedCentrals:](self, "updateValue:forCharacteristic:onSubscribedCentrals:", v4, v3, 0);

}

- (void)startNotifications
{
  _QWORD handler[5];

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10005FFA8;
  handler[3] = &unk_1000AE540;
  handler[4] = self;
  notify_register_dispatch("com.apple.system.powersources.percent", &self->_iopsNotifyPercentChangeToken, (dispatch_queue_t)&_dispatch_main_q, handler);
}

- (void)stopNotifications
{
  void *v3;
  NSObject *v4;
  _DWORD v5[2];

  v3 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5[0] = 67109120;
    v5[1] = -[ServerService restrictedMode](self, "restrictedMode");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "restrictedMode : %d", (uint8_t *)v5, 8u);

  }
  notify_cancel(-[BatteryServerService iopsNotifyPercentChangeToken](self, "iopsNotifyPercentChangeToken"));
  -[BatteryServerService setIopsNotifyPercentChangeToken:](self, "setIopsNotifyPercentChangeToken:", 0xFFFFFFFFLL);
}

- (void)peripheralManager:(id)a3 didReceiveReadRequest:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "characteristic"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryServerService batteryLevelCharacteristic](self, "batteryLevelCharacteristic"));

  if (v5 == v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryServerService batteryLevelValue](self, "batteryLevelValue"));
    objc_msgSend(v9, "setValue:", v8);

    v7 = 0;
  }
  else
  {
    v7 = 10;
  }
  -[ServerService respondToRequest:withResult:](self, "respondToRequest:withResult:", v9, v7);

}

- (void)peripheralManager:(id)a3 central:(id)a4 didSubscribeToCharacteristic:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a5;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[BatteryServerService batteryLevelCharacteristic](self, "batteryLevelCharacteristic"));

  if (v7 == v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryServerService batteryLevelCharacteristic](self, "batteryLevelCharacteristic"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subscribedCentrals"));
    v10 = objc_msgSend(v9, "count");

    if (v10 == (id)1)
      -[BatteryServerService startNotifications](self, "startNotifications");
  }
}

- (void)peripheralManager:(id)a3 central:(id)a4 didUnsubscribeFromCharacteristic:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a5;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[BatteryServerService batteryLevelCharacteristic](self, "batteryLevelCharacteristic"));

  if (v7 == v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryServerService batteryLevelCharacteristic](self, "batteryLevelCharacteristic"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subscribedCentrals"));
    v10 = objc_msgSend(v9, "count");

    if (!v10)
      -[BatteryServerService stopNotifications](self, "stopNotifications");
  }
}

- (void)batteryLevelDidChange
{
  -[BatteryServerService updateBatterylevel](self, "updateBatterylevel");
}

- (CBMutableCharacteristic)batteryLevelCharacteristic
{
  return self->_batteryLevelCharacteristic;
}

- (void)setBatteryLevelCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_batteryLevelCharacteristic, a3);
}

- (int)iopsNotifyPercentChangeToken
{
  return self->_iopsNotifyPercentChangeToken;
}

- (void)setIopsNotifyPercentChangeToken:(int)a3
{
  self->_iopsNotifyPercentChangeToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryLevelCharacteristic, 0);
}

@end
