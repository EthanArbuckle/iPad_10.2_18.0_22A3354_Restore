@implementation TVRViewServiceConfigContext

- (TVRViewServiceConfigContext)init
{

  return 0;
}

- (id)_initWithLaunchContext:(int64_t)a3
{
  TVRViewServiceConfigContext *v4;
  TVRViewServiceConfigContext *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TVRViewServiceConfigContext;
  v4 = -[TVRViewServiceConfigContext init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[TVRViewServiceConfigContext _commonInit](v4, "_commonInit");
    v5->_deviceIdentifierType = TVRViewServiceDeviceIdentifierTypeNone;
    v5->_deviceType = 0;
    v5->_launchContext = a3;
    v5->_launchMethod = 1;
  }
  return v5;
}

- (id)_initWithUserInfo:(id)a3
{
  id v4;
  TVRViewServiceConfigContext *v5;
  TVRViewServiceConfigContext *v6;
  uint64_t v7;
  NSString *deviceIdentifier;
  NSObject *v9;
  NSString *v10;
  void *v11;
  NSObject *v12;
  int64_t deviceIdentifierType;
  void *v14;
  NSObject *v15;
  int64_t deviceType;
  void *v17;
  NSObject *v18;
  int64_t launchContext;
  void *v20;
  NSObject *v21;
  unint64_t dismissalType;
  uint64_t v23;
  NSString *lastActiveEndpointIdentifier;
  NSObject *v25;
  NSString *v26;
  void *v27;
  NSObject *v28;
  int64_t launchMethod;
  objc_super v31;
  uint8_t buf[4];
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)TVRViewServiceConfigContext;
  v5 = -[TVRViewServiceConfigContext init](&v31, sel_init);
  v6 = v5;
  if (v5)
  {
    -[TVRViewServiceConfigContext _commonInit](v5, "_commonInit");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    deviceIdentifier = v6->_deviceIdentifier;
    v6->_deviceIdentifier = (NSString *)v7;

    _TVRUIViewServiceLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v6->_deviceIdentifier;
      *(_DWORD *)buf = 138412290;
      v33 = (unint64_t)v10;
      _os_log_impl(&dword_21B042000, v9, OS_LOG_TYPE_DEFAULT, "Received device id %@", buf, 0xCu);
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceIdentifierType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_deviceIdentifierType = objc_msgSend(v11, "integerValue");
    _TVRUIViewServiceLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      deviceIdentifierType = v6->_deviceIdentifierType;
      *(_DWORD *)buf = 134217984;
      v33 = deviceIdentifierType;
      _os_log_impl(&dword_21B042000, v12, OS_LOG_TYPE_DEFAULT, "Received device id type %ld", buf, 0xCu);
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceType"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_deviceType = objc_msgSend(v14, "integerValue");
    _TVRUIViewServiceLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      deviceType = v6->_deviceType;
      *(_DWORD *)buf = 134217984;
      v33 = deviceType;
      _os_log_impl(&dword_21B042000, v15, OS_LOG_TYPE_DEFAULT, "Received device type %ld", buf, 0xCu);
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("launchContext"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_launchContext = objc_msgSend(v17, "integerValue");
    _TVRUIViewServiceLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      launchContext = v6->_launchContext;
      *(_DWORD *)buf = 134217984;
      v33 = launchContext;
      _os_log_impl(&dword_21B042000, v18, OS_LOG_TYPE_DEFAULT, "Received lauch context %ld", buf, 0xCu);
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dismissalType"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_dismissalType = objc_msgSend(v20, "unsignedIntegerValue");
    _TVRUIViewServiceLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      dismissalType = v6->_dismissalType;
      *(_DWORD *)buf = 134217984;
      v33 = dismissalType;
      _os_log_impl(&dword_21B042000, v21, OS_LOG_TYPE_DEFAULT, "Received dismissal type %ld", buf, 0xCu);
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastActiveIdentifier"));
    v23 = objc_claimAutoreleasedReturnValue();
    lastActiveEndpointIdentifier = v6->_lastActiveEndpointIdentifier;
    v6->_lastActiveEndpointIdentifier = (NSString *)v23;

    _TVRUIViewServiceLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = v6->_lastActiveEndpointIdentifier;
      *(_DWORD *)buf = 138412290;
      v33 = (unint64_t)v26;
      _os_log_impl(&dword_21B042000, v25, OS_LOG_TYPE_DEFAULT, "Received last active endpoint id %@", buf, 0xCu);
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("launchMethod"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_launchMethod = objc_msgSend(v27, "integerValue");
    _TVRUIViewServiceLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      launchMethod = v6->_launchMethod;
      *(_DWORD *)buf = 134217984;
      v33 = launchMethod;
      _os_log_impl(&dword_21B042000, v28, OS_LOG_TYPE_DEFAULT, "Received launch method %ld", buf, 0xCu);
    }

  }
  return v6;
}

- (TVRViewServiceConfigContext)initWithDeviceIdentifier:(id)a3 identifierType:(int64_t)a4 deviceType:(int64_t)a5 launchContext:(int64_t)a6
{
  return -[TVRViewServiceConfigContext initWithDeviceIdentifier:identifierType:deviceType:launchContext:launchMethod:](self, "initWithDeviceIdentifier:identifierType:deviceType:launchContext:launchMethod:", a3, a4, a5, a6, 1);
}

- (TVRViewServiceConfigContext)initWithDeviceIdentifier:(id)a3 identifierType:(int64_t)a4 deviceType:(int64_t)a5 launchContext:(int64_t)a6 launchMethod:(int64_t)a7
{
  id v12;
  TVRViewServiceConfigContext *v13;
  TVRViewServiceConfigContext *v14;
  uint64_t v15;
  NSString *deviceIdentifier;
  objc_super v18;

  v12 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TVRViewServiceConfigContext;
  v13 = -[TVRViewServiceConfigContext init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    -[TVRViewServiceConfigContext _commonInit](v13, "_commonInit");
    v15 = objc_msgSend(v12, "copy");
    deviceIdentifier = v14->_deviceIdentifier;
    v14->_deviceIdentifier = (NSString *)v15;

    v14->_deviceIdentifierType = a4;
    v14->_deviceType = a5;
    v14->_launchContext = a6;
    v14->_launchMethod = a7;
  }

  return v14;
}

- (NSDictionary)userInfo
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRViewServiceConfigContext deviceIdentifier](self, "deviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[TVRViewServiceConfigContext deviceIdentifier](self, "deviceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("deviceIdentifier"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[TVRViewServiceConfigContext deviceIdentifierType](self, "deviceIdentifierType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("deviceIdentifierType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[TVRViewServiceConfigContext deviceType](self, "deviceType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("deviceType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[TVRViewServiceConfigContext launchContext](self, "launchContext"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("launchContext"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[TVRViewServiceConfigContext dismissalType](self, "dismissalType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("dismissalType"));

  -[TVRViewServiceConfigContext lastActiveEndpointIdentifier](self, "lastActiveEndpointIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[TVRViewServiceConfigContext lastActiveEndpointIdentifier](self, "lastActiveEndpointIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("lastActiveIdentifier"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[TVRViewServiceConfigContext launchMethod](self, "launchMethod"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("launchMethod"));

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v14;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[TVRViewServiceConfigContext userInfo](self, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_commonInit
{
  self->_dismissalType = 1;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (int64_t)deviceIdentifierType
{
  return self->_deviceIdentifierType;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (int64_t)launchContext
{
  return self->_launchContext;
}

- (int64_t)launchMethod
{
  return self->_launchMethod;
}

- (id)presentationAnimations
{
  return self->_presentationAnimations;
}

- (void)setPresentationAnimations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)dismissalAnimations
{
  return self->_dismissalAnimations;
}

- (void)setDismissalAnimations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)dismissalType
{
  return self->_dismissalType;
}

- (void)setDismissalType:(unint64_t)a3
{
  self->_dismissalType = a3;
}

- (NSString)lastActiveEndpointIdentifier
{
  return self->_lastActiveEndpointIdentifier;
}

- (void)setLastActiveEndpointIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastActiveEndpointIdentifier, 0);
  objc_storeStrong(&self->_dismissalAnimations, 0);
  objc_storeStrong(&self->_presentationAnimations, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end
