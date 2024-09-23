@implementation MILaunchServicesUnregisterMountPointOperation

- (MILaunchServicesUnregisterMountPointOperation)initWithMountPoint:(id)a3 operationUUID:(id)a4 serialNumber:(unint64_t)a5
{
  id v9;
  MILaunchServicesUnregisterMountPointOperation *v10;
  MILaunchServicesUnregisterMountPointOperation *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MILaunchServicesUnregisterMountPointOperation;
  v10 = -[MILaunchServicesOperation initWithOperationUUID:serialNumber:](&v13, "initWithOperationUUID:serialNumber:", a4, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_mountPoint, a3);

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MILaunchServicesUnregisterMountPointOperation)initWithCoder:(id)a3
{
  id v4;
  MILaunchServicesUnregisterMountPointOperation *v5;
  id v6;
  uint64_t v7;
  NSURL *mountPoint;
  uint64_t v9;
  MILaunchServicesUnregisterMountPointOperation *v10;
  id v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MILaunchServicesUnregisterMountPointOperation;
  v5 = -[MILaunchServicesOperation initWithCoder:](&v14, "initWithCoder:", v4);
  if (v5
    && (v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSURL), CFSTR("mountPoint")),
        v7 = objc_claimAutoreleasedReturnValue(v6),
        mountPoint = v5->_mountPoint,
        v5->_mountPoint = (NSURL *)v7,
        mountPoint,
        !v5->_mountPoint))
  {
    v11 = sub_100010E50((uint64_t)"-[MILaunchServicesUnregisterMountPointOperation initWithCoder:]", 39, MIInstallerErrorDomain, 186, 0, 0, CFSTR("Missing mount point when deserializing LS operation"), v9, (uint64_t)v14.receiver);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    objc_msgSend(v4, "failWithError:", v12);

    v10 = 0;
  }
  else
  {
    v10 = v5;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MILaunchServicesUnregisterMountPointOperation;
  v4 = a3;
  -[MILaunchServicesOperation encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesUnregisterMountPointOperation mountPoint](self, "mountPoint", v6.receiver, v6.super_class));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("mountPoint"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MILaunchServicesUnregisterMountPointOperation;
  if (-[MILaunchServicesOperation isEqual:](&v10, "isEqual:", v4)
    && (objc_opt_class(self), (objc_opt_isKindOfClass(v4) & 1) != 0))
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesUnregisterMountPointOperation mountPoint](self, "mountPoint"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mountPoint"));

    v8 = sub_1000116CC(v6, v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MILaunchServicesUnregisterMountPointOperation;
  v3 = -[MILaunchServicesOperation hash](&v7, "hash");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesUnregisterMountPointOperation mountPoint](self, "mountPoint"));
  v5 = (unint64_t)objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperation operationUUID](self, "operationUUID"));
  v7 = -[MILaunchServicesOperation serialNumber](self, "serialNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesUnregisterMountPointOperation mountPoint](self, "mountPoint"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %@:%lu mount:%@>"), v5, v6, v7, v9));

  return v10;
}

- (NSURL)mountPoint
{
  return self->_mountPoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mountPoint, 0);
}

@end
