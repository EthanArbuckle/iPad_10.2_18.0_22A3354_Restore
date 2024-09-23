@implementation CFDaemon

- (void)set24hMode
{
  NVRAMHelper *nvramHelper;
  id v3;

  nvramHelper = self->nvramHelper;
  v3 = (id)objc_claimAutoreleasedReturnValue(-[CFHelper read24HrMode](self->cfPrefsHelper, "read24HrMode"));
  -[NVRAMHelper writeNVRAM::](nvramHelper, "writeNVRAM::", CFSTR("alpm-24h-mode"), v3);

}

- (void)setDST
{
  CFHelper *cfPrefsHelper;
  id v4;
  id v5;
  id v6;
  id v7;

  cfPrefsHelper = self->cfPrefsHelper;
  v6 = 0;
  v7 = 0;
  -[CFHelper readDST::](cfPrefsHelper, "readDST::", &v7, &v6);
  v4 = v7;
  v5 = v6;
  -[NVRAMHelper writeNVRAM::](self->nvramHelper, "writeNVRAM::", CFSTR("alpm-next-dst"), v4);
  -[NVRAMHelper writeNVRAM::](self->nvramHelper, "writeNVRAM::", CFSTR("alpm-dst-offset"), v5);

}

- (void)setUTCOffset
{
  NVRAMHelper *nvramHelper;
  id v3;

  nvramHelper = self->nvramHelper;
  v3 = (id)objc_claimAutoreleasedReturnValue(-[CFHelper readUTCOffset](self->cfPrefsHelper, "readUTCOffset"));
  -[NVRAMHelper writeNVRAM::](nvramHelper, "writeNVRAM::", CFSTR("utc-offset"), v3);

}

- (void)writeAllVariables
{
  if (os_log_type_enabled((os_log_t)self->logs, OS_LOG_TYPE_DEBUG))
    sub_1000026C4();
  -[CFDaemon setDST](self, "setDST");
  -[CFDaemon setUTCOffset](self, "setUTCOffset");
  -[CFDaemon set24hMode](self, "set24hMode");
  -[NVRAMHelper syncNVRAM](self->nvramHelper, "syncNVRAM");
}

- (void)_updateLocaleChange
{
  -[CFDaemon set24hMode](self, "set24hMode");
  -[NVRAMHelper syncNVRAM](self->nvramHelper, "syncNVRAM");
}

- (void)_handleTimeZoneChange
{
  if (os_log_type_enabled((os_log_t)self->logs, OS_LOG_TYPE_DEBUG))
    sub_1000026F0();
  -[CFDaemon setDST](self, "setDST");
  -[CFDaemon setUTCOffset](self, "setUTCOffset");
  -[NVRAMHelper syncNVRAM](self->nvramHelper, "syncNVRAM");
}

- (void)_handleLocaleChange
{
  void *v3;
  NSObject *v4;
  NSObject *token;
  _QWORD v6[6];
  _QWORD v7[5];
  id v8;

  if (os_log_type_enabled((os_log_t)self->logs, OS_LOG_TYPE_DEBUG))
    sub_10000271C();
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = sub_100002120;
  v7[4] = sub_100002130;
  v8 = (id)os_transaction_create("com.apple.batterytrapd.localeobserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100002138;
  v6[3] = &unk_100004240;
  v6[4] = self;
  v6[5] = v7;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", NSCurrentLocaleDidChangeNotification, 0, 0, v6));
  token = self->token;
  self->token = v4;

  _Block_object_dispose(v7, 8);
}

- (CFDaemon)init
{
  CFDaemon *v2;
  os_log_t v3;
  OS_os_log *logs;
  NVRAMHelper *v5;
  NVRAMHelper *nvramHelper;
  CFHelper *v7;
  CFHelper *cfPrefsHelper;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CFDaemon;
  v2 = -[CFDaemon init](&v10, "init");
  if (v2)
  {
    v3 = os_log_create("CoreFirmwareAgent", "com.apple.batterytrapd");
    logs = v2->logs;
    v2->logs = (OS_os_log *)v3;

    v5 = -[NVRAMHelper initWithLog:]([NVRAMHelper alloc], "initWithLog:", v2->logs);
    nvramHelper = v2->nvramHelper;
    v2->nvramHelper = v5;

    v7 = -[CFHelper initWithLog:]([CFHelper alloc], "initWithLog:", v2->logs);
    cfPrefsHelper = v2->cfPrefsHelper;
    v2->cfPrefsHelper = v7;

    -[CFDaemon writeAllVariables](v2, "writeAllVariables");
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->token, 0);
  objc_storeStrong((id *)&self->logs, 0);
  objc_storeStrong((id *)&self->cfPrefsHelper, 0);
  objc_storeStrong((id *)&self->nvramHelper, 0);
}

@end
