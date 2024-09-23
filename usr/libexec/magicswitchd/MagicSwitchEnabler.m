@implementation MagicSwitchEnabler

- (MagicSwitchEnabler)init
{
  MagicSwitchEnabler *v2;
  NSObject *v3;
  dispatch_queue_attr_t v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *workQueue;
  objc_super v9;
  uint8_t buf[4];
  MagicSwitchEnabler *v11;

  v9.receiver = self;
  v9.super_class = (Class)MagicSwitchEnabler;
  v2 = -[MagicSwitchEnabler init](&v9, "init");
  if (v2)
  {
    v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v11 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "MagicSwitchEnabler --- Initializing (%p)", buf, 0xCu);
    }
    objc_storeStrong((id *)&qword_100021A48, v2);
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = dispatch_queue_create("com.apple.NanoRegistry.MagicSwitch", v5);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v6;

  }
  return v2;
}

+ (void)run
{
  void *v2;
  NSObject *v3;
  MagicSwitchEnablerCompanion *v4;
  MagicSwitchEnablerCompanion *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  MagicSwitchEnablerCompanion *v13;
  uint8_t buf[16];

  v2 = objc_autoreleasePoolPush();
  sub_10000AD20();
  v3 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "MagicSwitchEnabler --- Launching; \"MagicSwitch-37\" \"12984\",
      buf,
      2u);
  }
  if (MGGetBoolAnswer(CFSTR("watch-companion"))
    && (v4 = objc_opt_new(MagicSwitchEnablerCompanion)) != 0)
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MagicSwitchEnabler sharedInstance](MagicSwitchEnabler, "sharedInstance"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "workQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000C30C;
    block[3] = &unk_100018538;
    v13 = v5;
    dispatch_async(v7, block);

  }
  else
  {
    +[KeepAliveManager deleteMagicSwitchPathFile](KeepAliveManager, "deleteMagicSwitchPathFile");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MagicSwitchEnabler sharedInstance](MagicSwitchEnabler, "sharedInstance"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "workQueue"));
  v10 = (void *)v9;
  if (v9)
    v11 = v9;
  else
    v11 = &_dispatch_main_q;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v11, &stru_1000186F8);

  objc_autoreleasePoolPop(v2);
  dispatch_main();
}

+ (id)sharedInstance
{
  return (id)qword_100021A48;
}

- (BOOL)isSettingEnabled
{
  void *v2;

  v2 = (void *)objc_opt_class(self, a2);
  return objc_msgSend(v2, "isMagicSwitchEnabled");
}

+ (BOOL)isMagicSwitchEnabled
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("EnableMagicSwitch"), CFSTR("com.apple.NanoRegistry"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 0;
  return !v3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
