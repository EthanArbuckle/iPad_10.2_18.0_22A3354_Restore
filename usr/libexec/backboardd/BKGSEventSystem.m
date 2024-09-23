@implementation BKGSEventSystem

- (BKGSEventSystem)init
{
  BKGSEventSystem *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKGSEventSystem;
  v2 = -[BKGSEventSystem init](&v4, "init");
  if (v2)
  {
    GSEventRegisterEventCallBack(sub_100043248);
    GSEventInitializeWorkspaceWithQueue(&_dispatch_main_q);
  }
  return v2;
}

- (void)_handleEvent:(__GSEvent *)a3
{
  uint64_t Type;
  int v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  int SenderPID;

  Type = GSEventGetType(a3, a2);
  if ((_DWORD)Type == 50)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(+[BKHIDSystemInterface sharedInstance](BKHIDSystemInterface, "sharedInstance"));
    objc_msgSend(v10, "injectGSEvent:", a3);

  }
  else
  {
    v5 = Type;
    if ((_DWORD)Type == 100)
    {
      v6 = sub_100059A14();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        SenderPID = GSEventGetSenderPID(a3);
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Ignoring call to deprecated GSEventResetIdleTimer received from %d", buf, 8u);
      }

    }
    else
    {
      v8 = BKLogEventDelivery(Type);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        SenderPID = v5;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "_handleEvent: Ignoring GSEvent type:%d.", buf, 8u);
      }

    }
  }
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100043300;
  block[3] = &unk_1000EBC38;
  block[4] = a1;
  if (qword_100117300 != -1)
    dispatch_once(&qword_100117300, block);
  return (id)qword_1001172F8;
}

@end
