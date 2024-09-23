@implementation BAAppStorePrepareDescriptor

- (BAAppStorePrepareDescriptor)init
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

+ (id)descriptorWithAppBundleIdentifier:(id)a3 appStoreMetadata:(id)a4 client:(unint64_t)a5
{
  id v7;
  id v8;
  id *v9;

  v7 = a4;
  v8 = a3;
  v9 = sub_100011BF8((id *)[BAAppStorePrepareDescriptor alloc], v8, v7, (void *)a5);

  return v9;
}

- (BAAppStorePrepareDescriptor)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  BAAppStorePrepareDescriptor *v6;
  id v7;
  uint64_t v8;
  NSString *appBundleIdentifier;
  NSSet *v10;
  void *v11;
  uint64_t v12;
  NSDictionary *appStoreMetadata;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BAAppStorePrepareDescriptor;
  v6 = -[BAAppStorePrepareDescriptor init](&v15, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), CFSTR("appBundleIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    appBundleIdentifier = v6->_appBundleIdentifier;
    v6->_appBundleIdentifier = (NSString *)v8;

    v10 = sub_100018260((uint64_t)NSSet);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("appStoreMetadata")));
    appStoreMetadata = v6->_appStoreMetadata;
    v6->_appStoreMetadata = (NSDictionary *)v12;

    v6->_cellularPolicy = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cellularPolicy"));
    v6->_clientType = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("clientType"));
    v6->_userInitiated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("userInitiated"));
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BAAppStorePrepareDescriptor appBundleIdentifier](self, "appBundleIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("appBundleIdentifier"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BAAppStorePrepareDescriptor appStoreMetadata](self, "appStoreMetadata"));
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("appStoreMetadata"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[BAAppStorePrepareDescriptor cellularPolicy](self, "cellularPolicy"), CFSTR("cellularPolicy"));
  objc_msgSend(v6, "encodeInteger:forKey:", -[BAAppStorePrepareDescriptor clientType](self, "clientType"), CFSTR("clientType"));
  objc_msgSend(v6, "encodeBool:forKey:", -[BAAppStorePrepareDescriptor userInitiated](self, "userInitiated"), CFSTR("userInitiated"));

}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (NSDictionary)appStoreMetadata
{
  return self->_appStoreMetadata;
}

- (unint64_t)clientType
{
  return self->_clientType;
}

- (unint64_t)cellularPolicy
{
  return self->_cellularPolicy;
}

- (void)setCellularPolicy:(unint64_t)a3
{
  self->_cellularPolicy = a3;
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appStoreMetadata, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
}

@end
