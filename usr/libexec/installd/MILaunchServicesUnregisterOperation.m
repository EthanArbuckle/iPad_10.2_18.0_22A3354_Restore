@implementation MILaunchServicesUnregisterOperation

- (MILaunchServicesUnregisterOperation)initWithBundleID:(id)a3 domain:(unint64_t)a4 registrationUUID:(id)a5 serialNumber:(unint64_t)a6
{
  id v11;
  MILaunchServicesUnregisterOperation *v12;
  MILaunchServicesUnregisterOperation *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MILaunchServicesUnregisterOperation;
  v12 = -[MILaunchServicesOperation initWithOperationUUID:serialNumber:](&v15, "initWithOperationUUID:serialNumber:", a5, a6);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bundleID, a3);
    v13->_domain = a4;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MILaunchServicesUnregisterOperation)initWithCoder:(id)a3
{
  id v4;
  MILaunchServicesUnregisterOperation *v5;
  id v6;
  uint64_t v7;
  NSString *bundleID;
  uint64_t v9;
  id v10;
  void *v11;
  MILaunchServicesUnregisterOperation *v12;
  void *v13;
  __CFString *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MILaunchServicesUnregisterOperation;
  v5 = -[MILaunchServicesOperation initWithCoder:](&v20, "initWithCoder:", v4);
  if (!v5)
    goto LABEL_4;
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("bundleID"));
  v7 = objc_claimAutoreleasedReturnValue(v6);
  bundleID = v5->_bundleID;
  v5->_bundleID = (NSString *)v7;

  if (!v5->_bundleID)
  {
    v13 = (void *)MIInstallerErrorDomain;
    v14 = CFSTR("Missing bundle ID when deserializing unregistration");
    v15 = 42;
LABEL_7:
    v16 = sub_100010E50((uint64_t)"-[MILaunchServicesUnregisterOperation initWithCoder:]", v15, v13, 186, 0, 0, v14, v9, v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    objc_msgSend(v4, "failWithError:", v17);

    v12 = 0;
    goto LABEL_8;
  }
  v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("domain"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v5->_domain = (unint64_t)objc_msgSend(v11, "unsignedIntegerValue");

  if ((MIIsValidInstallationDomain(v5->_domain) & 1) == 0)
  {
    v13 = (void *)MIInstallerErrorDomain;
    v19 = (uint64_t)v5->_bundleID;
    v14 = CFSTR("Invalid installation domain value when deserializing unregistration for %@: %lu");
    v15 = 48;
    goto LABEL_7;
  }
LABEL_4:
  v12 = v5;
LABEL_8:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MILaunchServicesUnregisterOperation;
  v4 = a3;
  -[MILaunchServicesOperation encodeWithCoder:](&v7, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesUnregisterOperation bundleID](self, "bundleID", v7.receiver, v7.super_class));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bundleID"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MILaunchServicesUnregisterOperation domain](self, "domain")));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("domain"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  id v9;
  BOOL v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MILaunchServicesUnregisterOperation;
  if (-[MILaunchServicesOperation isEqual:](&v12, "isEqual:", v4)
    && (objc_opt_class(self), (objc_opt_isKindOfClass(v4) & 1) != 0))
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesUnregisterOperation bundleID](self, "bundleID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleID"));
    v8 = sub_1000116CC(v6, v7);

    if (v8)
    {
      v9 = objc_msgSend(v5, "domain");
      v10 = v9 == (id)-[MILaunchServicesUnregisterOperation domain](self, "domain");
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MILaunchServicesUnregisterOperation;
  v3 = -[MILaunchServicesOperation hash](&v8, "hash");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesUnregisterOperation bundleID](self, "bundleID"));
  v5 = (unint64_t)objc_msgSend(v4, "hash");
  v6 = v5 ^ -[MILaunchServicesUnregisterOperation domain](self, "domain") ^ v3;

  return v6;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperation operationUUID](self, "operationUUID"));
  v7 = -[MILaunchServicesOperation serialNumber](self, "serialNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesUnregisterOperation bundleID](self, "bundleID"));
  v9 = MIStringForInstallationDomain(-[MILaunchServicesUnregisterOperation domain](self, "domain"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %@:%lu %@/%@>"), v5, v6, v7, v8, v10));

  return v11;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (unint64_t)domain
{
  return self->_domain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
