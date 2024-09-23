@implementation BAAppStoreEventDescriptor

- (BAAppStoreEventDescriptor)init
{

  return 0;
}

+ (id)new
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)descriptorWithAppBundleIdentifier:(id)a3 appBundleURL:(id)a4 event:(unint64_t)a5 client:(unint64_t)a6
{
  id v9;
  id v10;
  id *v11;

  v9 = a4;
  v10 = a3;
  v11 = sub_100011F6C((id *)[BAAppStoreEventDescriptor alloc], v10, v9, (void *)a5, (void *)a6);

  return v11;
}

- (BAAppStoreEventDescriptor)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  BAAppStoreEventDescriptor *v6;
  id v7;
  uint64_t v8;
  NSString *appBundleIdentifier;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSURL *appBundleURL;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BAAppStoreEventDescriptor;
  v6 = -[BAAppStoreEventDescriptor init](&v15, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), CFSTR("appBundleIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    appBundleIdentifier = v6->_appBundleIdentifier;
    v6->_appBundleIdentifier = (NSString *)v8;

    v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSURL, v10), CFSTR("appBundleURL"));
    v12 = objc_claimAutoreleasedReturnValue(v11);
    appBundleURL = v6->_appBundleURL;
    v6->_appBundleURL = (NSURL *)v12;

    v6->_eventType = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("eventType"));
    v6->_clientType = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("clientType"));
    v6->_userInitiated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("userInitiated"));
    v6->_automaticInstall = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("automaticInstall"));
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAAppStoreEventDescriptor appBundleIdentifier](self, "appBundleIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("appBundleIdentifier"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAAppStoreEventDescriptor appBundleURL](self, "appBundleURL"));
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("appBundleURL"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[BAAppStoreEventDescriptor eventType](self, "eventType"), CFSTR("eventType"));
  objc_msgSend(v6, "encodeInteger:forKey:", -[BAAppStoreEventDescriptor clientType](self, "clientType"), CFSTR("clientType"));
  objc_msgSend(v6, "encodeBool:forKey:", -[BAAppStoreEventDescriptor userInitiated](self, "userInitiated"), CFSTR("userInitiated"));
  objc_msgSend(v6, "encodeBool:forKey:", -[BAAppStoreEventDescriptor automaticInstall](self, "automaticInstall"), CFSTR("automaticInstall"));

}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (NSURL)appBundleURL
{
  return self->_appBundleURL;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (unint64_t)clientType
{
  return self->_clientType;
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (BOOL)automaticInstall
{
  return self->_automaticInstall;
}

- (void)setAutomaticInstall:(BOOL)a3
{
  self->_automaticInstall = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundleURL, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
}

@end
