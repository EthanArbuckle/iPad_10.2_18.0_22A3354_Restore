@implementation STUChargingStatePropertyProvider_iOS

- (void)dealloc
{
  objc_super v3;

  -[STUChargingStatePropertyProvider_iOS endUpdating](self, "endUpdating");
  v3.receiver = self;
  v3.super_class = (Class)STUChargingStatePropertyProvider_iOS;
  -[STUChargingStatePropertyProvider_iOS dealloc](&v3, "dealloc");
}

- (void)beginUpdating
{
  void *v3;
  void *v4;
  void *v5;

  if (!self->mIsObserving)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    objc_msgSend(v3, "setBatteryMonitoringEnabled:", 1);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    objc_msgSend(v4, "addObserver:selector:name:object:", self, "chargingStateDidChange", UIDeviceBatteryStateDidChangeNotification, v5);

    -[STUChargingStatePropertyProvider_iOS chargingStateDidChange](self, "chargingStateDidChange");
    self->mIsObserving = 1;
  }
}

- (void)endUpdating
{
  void *v3;
  void *v4;
  void *v5;

  if (self->mIsObserving)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    objc_msgSend(v3, "setBatteryMonitoringEnabled:", 0);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    objc_msgSend(v4, "removeObserver:name:object:", self, UIDeviceBatteryStateDidChangeNotification, v5);

    self->mIsObserving = 0;
  }
}

- (void)chargingStateDidChange
{
  void *v4;
  char *v5;
  char *v6;

  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v5 = (char *)objc_msgSend(v4, "batteryState");

    if ((unint64_t)(v5 - 1) >= 3)
      v6 = 0;
    else
      v6 = v5;
    -[STUChargingStatePropertyProvider setChargingState:](self, "setChargingState:", v6);
  }
  else
  {
    -[STUChargingStatePropertyProvider_iOS performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 0);
  }
}

@end
