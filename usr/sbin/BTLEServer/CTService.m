@implementation CTService

- (CTService)init
{
  CTService *v2;
  id v3;
  void *v4;
  CBMutableCharacteristic *v5;
  CBMutableCharacteristic *currentTimeCharacteristic;
  id v7;
  void *v8;
  CBMutableCharacteristic *v9;
  CBMutableCharacteristic *localTimeInformationCharacteristic;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSTimer *nextDSTTransitionTimer;
  objc_super v18;
  _QWORD v19[2];

  v18.receiver = self;
  v18.super_class = (Class)CTService;
  v2 = -[CTService init](&v18, "init");
  if (v2)
  {
    v3 = objc_alloc((Class)CBMutableCharacteristic);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDCurrentTimeCharacteristicString));
    v5 = (CBMutableCharacteristic *)objc_msgSend(v3, "initWithType:properties:value:permissions:", v4, 1042, 0, 17);
    currentTimeCharacteristic = v2->_currentTimeCharacteristic;
    v2->_currentTimeCharacteristic = v5;

    v7 = objc_alloc((Class)CBMutableCharacteristic);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDLocalTimeInformationCharacteristicString));
    v9 = (CBMutableCharacteristic *)objc_msgSend(v7, "initWithType:properties:value:permissions:", v8, 2, 0, 17);
    localTimeInformationCharacteristic = v2->_localTimeInformationCharacteristic;
    v2->_localTimeInformationCharacteristic = v9;

    v11 = objc_alloc((Class)CBMutableService);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDCurrentTimeServiceString));
    v13 = objc_msgSend(v11, "initWithType:primary:", v12, 1);
    -[ServerService setService:](v2, "setService:", v13);

    v19[0] = v2->_currentTimeCharacteristic;
    v19[1] = v2->_localTimeInformationCharacteristic;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ServerService service](v2, "service"));
    objc_msgSend(v15, "setCharacteristics:", v14);

    nextDSTTransitionTimer = v2->_nextDSTTransitionTimer;
    v2->_nextDSTTransitionTimer = 0;

  }
  return v2;
}

- (void)stop
{
  objc_super v3;

  -[CTService cancelNextDSTTransitionTimer](self, "cancelNextDSTTransitionTimer");
  v3.receiver = self;
  v3.super_class = (Class)CTService;
  -[ServerService stop](&v3, "stop");
}

- (void)dealloc
{
  objc_super v3;

  -[CTService stopNotifications](self, "stopNotifications");
  v3.receiver = self;
  v3.super_class = (Class)CTService;
  -[CTService dealloc](&v3, "dealloc");
}

- (id)currentTimeValue
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DataOutputStream outputStreamWithByteOrder:](DataOutputStream, "outputStreamWithByteOrder:", 1));
  v3 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "components:fromDate:", 33532, v4));

  objc_msgSend(v2, "writeUint16:", (unsigned __int16)objc_msgSend(v5, "year"));
  objc_msgSend(v2, "writeUint8:", objc_msgSend(v5, "month"));
  objc_msgSend(v2, "writeUint8:", objc_msgSend(v5, "day"));
  objc_msgSend(v2, "writeUint8:", objc_msgSend(v5, "hour"));
  objc_msgSend(v2, "writeUint8:", objc_msgSend(v5, "minute"));
  objc_msgSend(v2, "writeUint8:", objc_msgSend(v5, "second"));
  v6 = objc_msgSend(v5, "weekday");
  v7 = v6 - 1;
  if (v6 == 1)
    v7 = 7;
  objc_msgSend(v2, "writeUint8:", v7);
  objc_msgSend(v2, "writeUint8:", (((((unint64_t)objc_msgSend(v5, "nanosecond") >> 1)* (unsigned __int128)0x112E0BE826D694B3uLL) >> 64) >> 17));
  objc_msgSend(v2, "writeUint8:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "data"));

  return v8;
}

- (void)updateCurrentTime
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CTService currentTimeValue](self, "currentTimeValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CTService currentTimeCharacteristic](self, "currentTimeCharacteristic"));
  -[ServerService updateValue:forCharacteristic:onSubscribedCentrals:](self, "updateValue:forCharacteristic:onSubscribedCentrals:", v4, v3, 0);

}

- (id)localTimeInformationValue
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DataOutputStream outputStream](DataOutputStream, "outputStream"));
  objc_msgSend(v3, "writeUint8:", -[CTService currentTimeZone](self, "currentTimeZone"));
  objc_msgSend(v3, "writeUint8:", -[CTService currentDstOffset](self, "currentDstOffset"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "data"));

  return v4;
}

- (id)readLocalTimeInformation
{
  return -[CTService localTimeInformationValue](self, "localTimeInformationValue");
}

- (void)cancelNextDSTTransitionTimer
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CTService nextDSTTransitionTimer](self, "nextDSTTransitionTimer"));
  objc_msgSend(v3, "invalidate");

  -[CTService setNextDSTTransitionTimer:](self, "setNextDSTTransitionTimer:", 0);
}

- (void)setupNextDSTTransitionTimer
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  -[CTService cancelNextDSTTransitionTimer](self, "cancelNextDSTTransitionTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nextDaylightSavingTimeTransition"));

  if (v7)
  {
    v4 = objc_msgSend(objc_alloc((Class)NSTimer), "initWithFireDate:interval:target:selector:userInfo:repeats:", v7, self, "dstDidChange", 0, 0, 0.0);
    -[CTService setNextDSTTransitionTimer:](self, "setNextDSTTransitionTimer:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CTService nextDSTTransitionTimer](self, "nextDSTTransitionTimer"));
    objc_msgSend(v5, "addTimer:forMode:", v6, NSDefaultRunLoopMode);

  }
}

- (void)startNotifications
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1000541C0, CFSTR("SignificantTimeChangeNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  -[CTService setupNextDSTTransitionTimer](self, "setupNextDSTTransitionTimer");
}

- (void)stopNotifications
{
  void *v3;
  NSObject *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  _DWORD v6[2];

  v3 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v6[0] = 67109120;
    v6[1] = -[ServerService restrictedMode](self, "restrictedMode");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "restrictedMode : %d", (uint8_t *)v6, 8u);

  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("SignificantTimeChangeNotification"), 0);
  -[CTService cancelNextDSTTransitionTimer](self, "cancelNextDSTTransitionTimer");
}

- (void)peripheralManager:(id)a3 didReceiveReadRequest:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CTService currentTimeCharacteristic](self, "currentTimeCharacteristic"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subscribedCentrals"));
  v9 = objc_msgSend(v8, "count");

  if (!v9)
    +[NSTimeZone resetSystemTimeZone](NSTimeZone, "resetSystemTimeZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "characteristic"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CTService currentTimeCharacteristic](self, "currentTimeCharacteristic"));

  if (v10 == v11)
  {
    v15 = objc_claimAutoreleasedReturnValue(-[CTService readCurrentTime](self, "readCurrentTime"));
LABEL_8:
    v16 = (void *)v15;
    objc_msgSend(v6, "setValue:", v15);

    v14 = 0;
    goto LABEL_9;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "characteristic"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CTService localTimeInformationCharacteristic](self, "localTimeInformationCharacteristic"));

  if (v12 == v13)
  {
    v15 = objc_claimAutoreleasedReturnValue(-[CTService readLocalTimeInformation](self, "readLocalTimeInformation"));
    goto LABEL_8;
  }
  v14 = 10;
LABEL_9:
  objc_msgSend(v17, "respondToRequest:withResult:", v6, v14);

}

- (void)peripheralManager:(id)a3 central:(id)a4 didSubscribeToCharacteristic:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a5;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[CTService currentTimeCharacteristic](self, "currentTimeCharacteristic"));

  if (v7 == v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CTService currentTimeCharacteristic](self, "currentTimeCharacteristic"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subscribedCentrals"));
    v10 = objc_msgSend(v9, "count");

    if (v10 == (id)1)
    {
      -[CTService startNotifications](self, "startNotifications");
      +[NSTimeZone resetSystemTimeZone](NSTimeZone, "resetSystemTimeZone");
    }
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
  v7 = (id)objc_claimAutoreleasedReturnValue(-[CTService currentTimeCharacteristic](self, "currentTimeCharacteristic"));

  if (v7 == v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CTService currentTimeCharacteristic](self, "currentTimeCharacteristic"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subscribedCentrals"));
    v10 = objc_msgSend(v9, "count");

    if (!v10)
      -[CTService stopNotifications](self, "stopNotifications");
  }
}

- (void)significantTimeChange
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Significant time change", v4, 2u);
  }
  +[NSTimeZone resetSystemTimeZone](NSTimeZone, "resetSystemTimeZone");
  -[CTService currentTimeDidChange](self, "currentTimeDidChange");
}

- (void)dstDidChange
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "DST did change", v4, 2u);
  }
  -[CTService currentTimeDidChange](self, "currentTimeDidChange");
}

- (void)currentTimeDidChange
{
  -[CTService setupNextDSTTransitionTimer](self, "setupNextDSTTransitionTimer");
  -[CTService updateCurrentTime](self, "updateCurrentTime");
}

- (char)currentTimeZone
{
  void *v2;
  double v3;
  double v4;
  int v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"));
  v3 = (double)(uint64_t)objc_msgSend(v2, "secondsFromGMT");
  objc_msgSend(v2, "daylightSavingTimeOffset");
  v5 = (int)((v3 - v4) / 60.0 / 15.0);

  return v5;
}

- (unsigned)currentDstOffset
{
  void *v2;
  double v3;
  int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"));
  objc_msgSend(v2, "daylightSavingTimeOffset");
  v4 = (int)(v3 / 60.0 / 15.0);

  return v4;
}

- (CBMutableCharacteristic)currentTimeCharacteristic
{
  return self->_currentTimeCharacteristic;
}

- (void)setCurrentTimeCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_currentTimeCharacteristic, a3);
}

- (CBMutableCharacteristic)localTimeInformationCharacteristic
{
  return self->_localTimeInformationCharacteristic;
}

- (void)setLocalTimeInformationCharacteristic:(id)a3
{
  objc_storeStrong((id *)&self->_localTimeInformationCharacteristic, a3);
}

- (NSTimer)nextDSTTransitionTimer
{
  return self->_nextDSTTransitionTimer;
}

- (void)setNextDSTTransitionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_nextDSTTransitionTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextDSTTransitionTimer, 0);
  objc_storeStrong((id *)&self->_localTimeInformationCharacteristic, 0);
  objc_storeStrong((id *)&self->_currentTimeCharacteristic, 0);
}

@end
