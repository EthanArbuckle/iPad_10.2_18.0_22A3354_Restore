@implementation FMDBLEStateOwner

+ (id)sharedInstance
{
  if (qword_100306420 != -1)
    dispatch_once(&qword_100306420, &stru_1002C17D8);
  return (id)qword_100306418;
}

- (FMDBLEStateOwner)init
{
  FMDBLEStateOwner *v2;
  FMDBLEStateOwner *v3;
  NSString *blePowerStatus;
  _QWORD v6[4];
  id v7;
  id location;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FMDBLEStateOwner;
  v2 = -[FMDBLEStateOwner init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    blePowerStatus = v2->_blePowerStatus;
    v2->_blePowerStatus = (NSString *)CFSTR("unknown");

    objc_initWeak(&location, v3);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100013F44;
    v6[3] = &unk_1002C1378;
    objc_copyWeak(&v7, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)_monitorWatchBLEStatus
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id buf[2];

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting to listen for BluetoothState changes", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v6 = BluetoothAvailabilityChangedNotification;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100014158;
  v17[3] = &unk_1002C1800;
  objc_copyWeak(&v18, buf);
  v7 = objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v6, 0, 0, v17);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v9 = BluetoothStateChangedNotification;
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_1000141D4;
  v15 = &unk_1002C1800;
  objc_copyWeak(&v16, buf);
  v10 = objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", v9, 0, 0, &v12);

  v11 = +[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance", v12, v13, v14, v15);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(buf);
}

- (void)_updateBLEStatus
{
  void *v3;
  const __CFString *v4;
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD block[4];
  id v9;
  uint8_t buf[4];
  void *v11;

  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"));
    if (objc_msgSend(v3, "available"))
    {
      if (objc_msgSend(v3, "enabled"))
        v4 = CFSTR("on");
      else
        v4 = CFSTR("off");
      -[FMDBLEStateOwner setBlePowerStatus:](self, "setBlePowerStatus:", v4);
    }
    v5 = sub_1000031B8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBLEStateOwner blePowerStatus](self, "blePowerStatus"));
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "BluetoothState: %@", buf, 0xCu);

    }
  }
  else
  {
    objc_initWeak((id *)buf, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000143D4;
    block[3] = &unk_1002C1378;
    objc_copyWeak(&v9, (id *)buf);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
}

- (NSString)blePowerStatus
{
  return self->_blePowerStatus;
}

- (void)setBlePowerStatus:(id)a3
{
  objc_storeStrong((id *)&self->_blePowerStatus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blePowerStatus, 0);
}

@end
