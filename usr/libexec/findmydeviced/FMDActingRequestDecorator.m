@implementation FMDActingRequestDecorator

- (FMDActingRequestDecorator)init
{
  FMDActingRequestDecorator *v2;
  FMDActingRequestDecorator *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FMDActingRequestDecorator;
  v2 = -[FMDActingRequestDecorator init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[FMDActingRequestDecorator setDeviceContextGenerator:](v2, "setDeviceContextGenerator:", &stru_1002C3098);
    -[FMDActingRequestDecorator setDeviceInfoGenerator:](v3, "setDeviceInfoGenerator:", &stru_1002C3098);
    -[FMDActingRequestDecorator setServerContextGenerator:](v3, "setServerContextGenerator:", &stru_1002C3098);
    -[FMDActingRequestDecorator setRequestHeaderGenerator:](v3, "setRequestHeaderGenerator:", &stru_1002C3098);
  }
  return v3;
}

- (FMDActingRequestDecorator)initWithDeviceContextGenerator:(id)a3 deviceInfoGenerator:(id)a4 serverContextGenerator:(id)a5 requestHeaderGenerator:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  FMDActingRequestDecorator *v14;
  FMDActingRequestDecorator *v15;
  id deviceContextGenerator;
  id deviceInfoGenerator;
  id serverContextGenerator;
  id requestHeaderGenerator;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[FMDActingRequestDecorator init](self, "init");
  v15 = v14;
  if (v14)
  {
    deviceContextGenerator = v10;
    if (!v10)
      deviceContextGenerator = v14->_deviceContextGenerator;
    -[FMDActingRequestDecorator setDeviceContextGenerator:](v14, "setDeviceContextGenerator:", deviceContextGenerator);
    deviceInfoGenerator = v11;
    if (!v11)
      deviceInfoGenerator = v15->_deviceInfoGenerator;
    -[FMDActingRequestDecorator setDeviceInfoGenerator:](v15, "setDeviceInfoGenerator:", deviceInfoGenerator);
    serverContextGenerator = v12;
    if (!v12)
      serverContextGenerator = v15->_serverContextGenerator;
    -[FMDActingRequestDecorator setServerContextGenerator:](v15, "setServerContextGenerator:", serverContextGenerator);
    requestHeaderGenerator = v13;
    if (!v13)
      requestHeaderGenerator = v15->_requestHeaderGenerator;
    -[FMDActingRequestDecorator setRequestHeaderGenerator:](v15, "setRequestHeaderGenerator:", requestHeaderGenerator);
  }

  return v15;
}

- (id)registerDeviceContextForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDActingRequestDecorator standardDeviceContext](self, "standardDeviceContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastLoggedInDsid"));

  objc_msgSend(v5, "fm_safelyMapKey:toObject:", CFSTR("lastLoggedInDsid"), v6);
  return v5;
}

- (id)standardDeviceContext
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init((Class)NSMutableDictionary);
  v3 = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringValueForServer"));

  objc_msgSend(v2, "fm_safeSetObject:forKey:", v5, CFSTR("deviceTS"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil stringForKey:inDomain:](FMPreferencesUtil, "stringForKey:inDomain:", CFSTR("lastCommandId"), kFMDNotBackedUpPrefDomain));
  objc_msgSend(v2, "fm_safeSetObject:forKey:", v6, CFSTR("lastCommandId"));

  objc_autoreleasePoolPop(v3);
  return v2;
}

- (id)deviceContextGenerator
{
  return self->_deviceContextGenerator;
}

- (void)setDeviceContextGenerator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)deviceInfoGenerator
{
  return self->_deviceInfoGenerator;
}

- (void)setDeviceInfoGenerator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)serverContextGenerator
{
  return self->_serverContextGenerator;
}

- (void)setServerContextGenerator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)requestHeaderGenerator
{
  return self->_requestHeaderGenerator;
}

- (void)setRequestHeaderGenerator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestHeaderGenerator, 0);
  objc_storeStrong(&self->_serverContextGenerator, 0);
  objc_storeStrong(&self->_deviceInfoGenerator, 0);
  objc_storeStrong(&self->_deviceContextGenerator, 0);
}

@end
