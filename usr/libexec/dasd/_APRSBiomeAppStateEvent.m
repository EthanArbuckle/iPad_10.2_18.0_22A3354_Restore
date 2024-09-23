@implementation _APRSBiomeAppStateEvent

+ (id)eventWithAppBundleID:(id)a3 appState:(int)a4
{
  uint64_t v4;
  id v5;
  _APRSBiomeAppStateEvent *v6;
  _APRSBiomeAppStateEvent *v7;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v6 = objc_alloc_init(_APRSBiomeAppStateEvent);
  v7 = v6;
  if (v6)
  {
    -[_APRSBiomeAppStateEvent setBundleID:](v6, "setBundleID:", v5);
    -[_APRSBiomeAppStateEvent setAppState:](v7, "setAppState:", v4);
  }

  return v7;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  void *v5;
  void *v6;
  void *v7;
  _OWORD v9[3];
  __int128 v10;

  v10 = 0u;
  memset(v9, 0, sizeof(v9));
  objc_msgSend(a3, "getBytes:length:", v9, 64);
  v5 = (void *)objc_opt_class(a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v9));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "eventWithAppBundleID:appState:", v6, HIDWORD(v10)));

  return v7;
}

- (id)serialize
{
  _APRSBiomeAppStateEvent *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  __int128 v8;
  __int128 v9;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSString copy](v2->_bundleID, "copy", (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0);
  if ((unint64_t)objc_msgSend(v3, "length") >= 0x3D)
  {
    v4 = os_log_create("com.apple.aprs", "appResume.AppStateWriter");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_1000E2B58((uint64_t *)&v2->_bundleID, (uint64_t)v3, v4);
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringToIndex:", 60));

    v3 = (id)v5;
  }
  if ((objc_msgSend(v3, "getCString:maxLength:encoding:", &v8, 60, 4) & 1) == 0)
  {
    v6 = os_log_create("com.apple.aprs", "appResume.AppStateWriter");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000E2AE0((uint64_t *)&v2->_bundleID, v6);

  }
  HIDWORD(v9) = v2->_appState;

  objc_sync_exit(v2);
  return (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v8, 64));
}

- (unsigned)dataVersion
{
  return self->dataVersion;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (int)appState
{
  return self->_appState;
}

- (void)setAppState:(int)a3
{
  self->_appState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
