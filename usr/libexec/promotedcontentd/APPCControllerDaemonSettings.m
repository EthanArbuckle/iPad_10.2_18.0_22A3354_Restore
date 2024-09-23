@implementation APPCControllerDaemonSettings

+ (id)storageWithDefaultValues:(id)a3
{
  return objc_msgSend(objc_alloc((Class)APSettingsStorageKeychain), "initWithDefaultValues:", &off_10022B230);
}

- (BOOL)useAMSMescalValue
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APPCControllerDaemonSettings useAMSMescal](self, "useAMSMescal"));
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setUseAMSMescalValue:(BOOL)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  -[APPCControllerDaemonSettings setUseAMSMescal:](self, "setUseAMSMescal:", v4);

}

- (BOOL)httpUseFixedHttpSessionManagerValue
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APPCControllerDaemonSettings httpUseFixedHttpSessionManager](self, "httpUseFixedHttpSessionManager"));
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setHttpUseFixedHttpSessionManagerValue:(BOOL)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  -[APPCControllerDaemonSettings setHttpUseFixedHttpSessionManager:](self, "setHttpUseFixedHttpSessionManager:", v4);

}

- (int64_t)httpMaximumConnectionsPerHostValue
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APPCControllerDaemonSettings httpMaximumConnectionsPerHost](self, "httpMaximumConnectionsPerHost"));
  v3 = objc_msgSend(v2, "integerValue");

  return (int64_t)v3;
}

- (void)setHttpMaximumConnectionsPerHostValue:(int64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  -[APPCControllerDaemonSettings setHttpMaximumConnectionsPerHost:](self, "setHttpMaximumConnectionsPerHost:", v4);

}

- (int64_t)httpMaximumConnectionsPerHostTempSessionValue
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APPCControllerDaemonSettings httpMaximumConnectionsPerHostTempSession](self, "httpMaximumConnectionsPerHostTempSession"));
  v3 = objc_msgSend(v2, "integerValue");

  return (int64_t)v3;
}

- (void)setHttpMaximumConnectionsPerHostTempSessionValue:(int64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  -[APPCControllerDaemonSettings setHttpMaximumConnectionsPerHostTempSession:](self, "setHttpMaximumConnectionsPerHostTempSession:", v4);

}

- (double)httpLookBackWindowValue
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APPCControllerDaemonSettings httpLookBackWindow](self, "httpLookBackWindow"));
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (void)setHttpLookBackWindowValue:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  -[APPCControllerDaemonSettings setHttpLookBackWindow:](self, "setHttpLookBackWindow:", v4);

}

- (int64_t)cacheSizeLimitValue
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APPCControllerDaemonSettings cacheSizeLimit](self, "cacheSizeLimit"));
  v3 = objc_msgSend(v2, "integerValue");

  return (int64_t)v3;
}

- (void)setCacheSizeLimitValue:(int64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  -[APPCControllerDaemonSettings setCacheSizeLimit:](self, "setCacheSizeLimit:", v4);

}

- (BOOL)httpUseFixedHttpSessionManagerDefaultValue
{
  return 0;
}

- (int64_t)httpMaximumConnectionsPerHostDefaultValue
{
  return 4;
}

- (int64_t)httpMaximumConnectionsPerHostTempSessionDefaultValue
{
  return 1;
}

- (double)httpLookBackWindowDefaultValue
{
  return 5.0;
}

- (int64_t)cacheSizeLimitDefaultValue
{
  return 256000;
}

@end
