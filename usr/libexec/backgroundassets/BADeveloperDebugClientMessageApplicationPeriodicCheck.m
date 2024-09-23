@implementation BADeveloperDebugClientMessageApplicationPeriodicCheck

- (BADeveloperDebugClientMessageApplicationPeriodicCheck)initWithAppBundleIdentifier:(id)a3
{
  id v5;
  BADeveloperDebugClientMessageApplicationPeriodicCheck *v6;
  BADeveloperDebugClientMessageApplicationPeriodicCheck *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BADeveloperDebugClientMessageApplicationPeriodicCheck;
  v6 = -[BADeveloperDebugClientMessage initWithMessageOperation:](&v9, "initWithMessageOperation:", 4);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_appBundleIdentifier, a3);

  return v7;
}

- (BADeveloperDebugClientMessageApplicationPeriodicCheck)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  BADeveloperDebugClientMessageApplicationPeriodicCheck *v6;
  id v7;
  uint64_t v8;
  NSString *appBundleIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BADeveloperDebugClientMessageApplicationPeriodicCheck;
  v6 = -[BADeveloperDebugClientMessage initWithCoder:](&v11, "initWithCoder:", v4);
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), CFSTR("BAApplicationIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    appBundleIdentifier = v6->_appBundleIdentifier;
    v6->_appBundleIdentifier = (NSString *)v8;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BADeveloperDebugClientMessageApplicationPeriodicCheck;
  v4 = a3;
  -[BADeveloperDebugClientMessage encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BADeveloperDebugClientMessageApplicationPeriodicCheck appBundleIdentifier](self, "appBundleIdentifier", v6.receiver, v6.super_class));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("BAApplicationIdentifier"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
}

@end
