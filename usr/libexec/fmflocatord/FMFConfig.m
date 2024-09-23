@implementation FMFConfig

- (void)dealloc
{
  id v3;
  NSObject *v4;
  void *v5;
  objc_super v6;

  v3 = sub_10001C4E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100034C70(self, v4);

  v5 = (void *)qword_100069730;
  qword_100069730 = 0;

  v6.receiver = self;
  v6.super_class = (Class)FMFConfig;
  -[FMFConfig dealloc](&v6, "dealloc");
}

+ (id)sharedInstance
{
  void *v2;
  id v3;
  NSObject *v4;
  uint8_t v6[16];

  if (qword_100069738 != -1)
    dispatch_once(&qword_100069738, &stru_100055D00);
  v2 = (void *)qword_100069730;
  if (!qword_100069730)
  {
    v3 = sub_10001C4E8();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "*** The FMFConfig singleton seems to have been deallocated. This is unexpected & damaging.", v6, 2u);
    }

    v2 = (void *)qword_100069730;
  }
  return v2;
}

- (id)initSingleton
{
  FMFConfig *v2;
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
  v13.super_class = (Class)FMFConfig;
  v2 = -[FMFConfig init](&v13, "init");
  if (v2)
  {
    v3 = sub_10001C4E8();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      sub_100034D38(v4, v5, v6, v7, v8, v9, v10, v11);

    objc_storeStrong((id *)&qword_100069730, v2);
  }
  return v2;
}

- (BOOL)isLocationServicesEnabled
{
  return +[CLLocationManager locationServicesEnabled](CLLocationManager, "locationServicesEnabled");
}

- (BOOL)isLocationServicesEnabledForShareMyLocation
{
  return +[CLLocationManager authorizationStatusForBundlePath:](CLLocationManager, "authorizationStatusForBundlePath:", CFSTR("/System/Library/PrivateFrameworks/FMF.framework")) == 3;
}

- (BOOL)isFMFAllowed
{
  const __CFBoolean *v2;
  const __CFBoolean *v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  int v8;

  if ((byte_100069740 & 1) == 0)
  {
    v8 = 0;
    v2 = (const __CFBoolean *)MGCopyAnswerWithError(CFSTR("FMFAllowed"), 0, &v8);
    v3 = v2;
    if (v8)
      v4 = 1;
    else
      v4 = v2 == 0;
    if (!v4)
    {
      byte_100068DE8 = CFBooleanGetValue(v2) != 0;
      byte_100069740 = 1;
LABEL_10:
      CFRelease(v3);
      return byte_100068DE8;
    }
    v5 = sub_10001C4E8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100034D6C(&v8, v6);

    if (v3)
      goto LABEL_10;
  }
  return byte_100068DE8;
}

@end
