@implementation GlobalConfiguration

- (GlobalConfiguration)init
{
  GlobalConfiguration *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GlobalConfiguration;
  v2 = -[GlobalConfiguration init](&v7, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.eligibilityd.testMode", v4);
    -[GlobalConfiguration setTestModeQueue:](v2, "setTestModeQueue:", v5);

  }
  return v2;
}

- (BOOL)hasInternalContent
{
  if (qword_10003F3F8 != -1)
    dispatch_once(&qword_10003F3F8, &stru_100030C08);
  return byte_10003F400;
}

- (BOOL)isMemoryConstrainedDevice
{
  if (qword_10003F408 != -1)
    dispatch_once(&qword_10003F408, &stru_100030C28);
  return byte_10003F410;
}

- (NSString)currentUsername
{
  return (NSString *)CFSTR("mobile");
}

- (BOOL)setTestMode:(BOOL)a3 withError:(id *)a4
{
  BOOL v7;
  NSObject *v8;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD v13[5];
  BOOL v14;
  uint8_t buf[4];
  const char *v16;

  v7 = -[GlobalConfiguration hasInternalContent](self, "hasInternalContent");
  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[GlobalConfiguration testModeQueue](self, "testModeQueue"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000EEB0;
    v13[3] = &unk_100030C50;
    v13[4] = self;
    v14 = a3;
    dispatch_sync(v8, v13);

    v9 = 0;
  }
  else
  {
    v10 = sub_10000C5FC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[GlobalConfiguration setTestMode:withError:]";
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s: Test mode can only be set on internal builds", buf, 0xCu);
    }

    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, 0));
    if (a4)
    {
      v9 = objc_retainAutorelease(v9);
      *a4 = v9;
    }
  }

  return v7;
}

- (BOOL)testMode
{
  GlobalConfiguration *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[GlobalConfiguration testModeQueue](self, "testModeQueue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000EE80;
  v5[3] = &unk_100030F98;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (id)debugDescription
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GlobalConfiguration currentUsername](self, "currentUsername"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<GlobalConfiguration currUser: %@, testMode: %d>"), v3, -[GlobalConfiguration testMode](self, "testMode")));

  return v4;
}

- (OS_dispatch_queue)testModeQueue
{
  return self->_testModeQueue;
}

- (void)setTestModeQueue:(id)a3
{
  objc_storeStrong((id *)&self->_testModeQueue, a3);
}

- (BOOL)testModeEnabled
{
  return self->_testModeEnabled;
}

- (void)setTestModeEnabled:(BOOL)a3
{
  self->_testModeEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testModeQueue, 0);
}

+ (GlobalConfiguration)sharedInstance
{
  if (qword_10003F3F0 != -1)
    dispatch_once(&qword_10003F3F0, &stru_100030BE8);
  return (GlobalConfiguration *)(id)qword_10003F3E8;
}

@end
