@implementation _BatteryMonitorConcreteToken

- (_BatteryMonitorConcreteToken)init
{
  _BatteryMonitorConcreteToken *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_BatteryMonitorConcreteToken;
  v2 = -[_BatteryMonitorConcreteToken init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "_batteryStateDidChange:", UIDeviceBatteryStateDidChangeNotification, 0);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, "_batteryLevelDidChange:", UIDeviceBatteryLevelDidChangeNotification, 0);

  }
  return v2;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_concreteTokenDelegate);
  objc_msgSend(WeakRetained, "batteryMonitorConcreteTokenWillInvalidate:", self);

  v4.receiver = self;
  v4.super_class = (Class)_BatteryMonitorConcreteToken;
  -[_BatteryMonitorConcreteToken dealloc](&v4, "dealloc");
}

- (int64_t)currentBatteryState
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "batteryState");

  return (int64_t)v3;
}

- (float)currentBatteryLevel
{
  void *v2;
  float v3;
  float v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  objc_msgSend(v2, "batteryLevel");
  v4 = v3;

  return v4;
}

- (BOOL)batteryIsChargingOrFull
{
  return (-[_BatteryMonitorConcreteToken currentBatteryState](self, "currentBatteryState") & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)_batteryStateDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A455F8;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_batteryLevelDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A45690;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BatteryMonitorTokenDelegate)delegate
{
  return (BatteryMonitorTokenDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_BatteryMonitorConcreteTokenDelegate)concreteTokenDelegate
{
  return (_BatteryMonitorConcreteTokenDelegate *)objc_loadWeakRetained((id *)&self->_concreteTokenDelegate);
}

- (void)setConcreteTokenDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_concreteTokenDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_concreteTokenDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
