@implementation FMIPConfig

- (void)dealloc
{
  id v3;
  NSObject *v4;
  void *v5;
  objc_super v6;

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100225550(self, v4);

  v5 = (void *)qword_1003064B8;
  qword_1003064B8 = 0;

  v6.receiver = self;
  v6.super_class = (Class)FMIPConfig;
  -[FMIPConfig dealloc](&v6, "dealloc");
}

+ (id)sharedInstance
{
  void *v2;
  id v3;
  NSObject *v4;
  uint8_t v6[16];

  if (qword_1003064C0 != -1)
    dispatch_once(&qword_1003064C0, &stru_1002C1E68);
  v2 = (void *)qword_1003064B8;
  if (!qword_1003064B8)
  {
    v3 = sub_1000031B8();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "*** The FMIPConfig singleton seems to have been deallocated. This is unexpected & damaging.", v6, 2u);
    }

    v2 = (void *)qword_1003064B8;
  }
  return v2;
}

- (id)initSingleton
{
  FMIPConfig *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)FMIPConfig;
  v2 = -[FMIPConfig init](&v13, "init");
  if (v2)
  {
    v3 = sub_1000031B8();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      sub_100226848(v4, v5, v6, v7, v8, v9, v10, v11);

    objc_storeStrong((id *)&qword_1003064B8, v2);
  }
  return v2;
}

- (void)enableFMIPLocationServices
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/FindMyDevice.framework")));
  +[CLLocationManager setAuthorizationStatusByType:forBundle:](CLLocationManager, "setAuthorizationStatusByType:forBundle:", 3, v2);

}

@end
