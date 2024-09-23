@implementation _APRSBiomeAppLaunchTimeEvent

+ (id)eventWithAppBundleID:(id)a3 activationTime:(unsigned int)a4 launchReason:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  id v9;
  void *v10;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = objc_alloc_init((Class)objc_opt_class(a1));
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "setBundleID:", v8);
    objc_msgSend(v10, "setActivationTime:", v6);
    objc_msgSend(v10, "setLaunchReason:", v5);
  }

  return v10;
}

- (unsigned)dataVersion
{
  return 2;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _OWORD v11[3];
  __int128 v12;
  unsigned int v13;

  v13 = 0;
  v12 = 0u;
  memset(v11, 0, sizeof(v11));
  if (a4 == 2)
  {
    objc_msgSend(a3, "getBytes:length:", v11, 68);
    v5 = (void *)objc_opt_class(a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v11));
    v7 = HIDWORD(v12);
    v8 = v13;
  }
  else
  {
    objc_msgSend(a3, "getBytes:length:", v11, 68);
    v5 = (void *)objc_opt_class(a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v11));
    v7 = HIDWORD(v12);
    v8 = v13;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "eventWithAppBundleID:activationTime:launchReason:", v6, v7, v8));

  return v9;
}

- (id)serialize
{
  _APRSBiomeAppLaunchTimeEvent *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  LODWORD(v10) = 0;
  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSString copy](v2->_bundleID, "copy", (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, v10);
  if ((unint64_t)objc_msgSend(v3, "length") >= 0x3D)
  {
    v4 = os_log_create("com.apple.aprs", "appResume.AppLaunchWriter");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_1000E2B58((uint64_t *)&v2->_bundleID, (uint64_t)v3, v4);
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringToIndex:", 60));

    v3 = (id)v5;
  }
  if ((objc_msgSend(v3, "getCString:maxLength:encoding:", &v8, 60, 4) & 1) == 0)
  {
    v6 = os_log_create("com.apple.aprs", "appResume.AppLaunchWriter");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000E2AE0((uint64_t *)&v2->_bundleID, v6);

  }
  HIDWORD(v9) = v2->_activationTime;
  LOBYTE(v10) = v2->_launchReason;

  objc_sync_exit(v2);
  return (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v8, 68));
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (unsigned)activationTime
{
  return self->_activationTime;
}

- (void)setActivationTime:(unsigned int)a3
{
  self->_activationTime = a3;
}

- (unsigned)launchReason
{
  return self->_launchReason;
}

- (void)setLaunchReason:(unsigned int)a3
{
  self->_launchReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
