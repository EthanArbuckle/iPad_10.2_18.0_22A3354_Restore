@implementation MILaunchServicesOperation

- (MILaunchServicesOperation)initWithOperationUUID:(id)a3 serialNumber:(unint64_t)a4
{
  id v7;
  MILaunchServicesOperation *v8;
  MILaunchServicesOperation *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MILaunchServicesOperation;
  v8 = -[MILaunchServicesOperation init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_operationUUID, a3);
    v9->_serialNumber = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MILaunchServicesOperation)initWithCoder:(id)a3
{
  id v4;
  MILaunchServicesOperation *v5;
  id v6;
  uint64_t v7;
  NSUUID *operationUUID;
  uint64_t v9;
  id v10;
  void *v11;
  MILaunchServicesOperation *v12;
  id v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MILaunchServicesOperation;
  v5 = -[MILaunchServicesOperation init](&v16, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID), CFSTR("operationUUID"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    operationUUID = v5->_operationUUID;
    v5->_operationUUID = (NSUUID *)v7;

    if (!v5->_operationUUID)
    {
      v13 = sub_100010E50((uint64_t)"-[MILaunchServicesOperation initWithCoder:]", 40, MIInstallerErrorDomain, 186, 0, 0, CFSTR("Missing operation UUID when deserializing LS operation"), v9, (uint64_t)v16.receiver);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      objc_msgSend(v4, "failWithError:", v14);

      v12 = 0;
      goto LABEL_6;
    }
    v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("serialNumber"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v5->_serialNumber = (unint64_t)objc_msgSend(v11, "unsignedIntegerValue");

  }
  v12 = v5;
LABEL_6:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperation operationUUID](self, "operationUUID"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("operationUUID"));

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MILaunchServicesOperation serialNumber](self, "serialNumber")));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("serialNumber"));

}

- (BOOL)isEqual:(id)a3
{
  MILaunchServicesOperation *v4;
  MILaunchServicesOperation *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  id v9;
  BOOL v10;

  v4 = (MILaunchServicesOperation *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4) & 1) != 0)
    {
      v5 = v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperation operationUUID](self, "operationUUID"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperation operationUUID](v5, "operationUUID"));
      v8 = sub_1000116CC(v6, v7);

      if (v8)
      {
        v9 = -[MILaunchServicesOperation serialNumber](v5, "serialNumber");
        v10 = v9 == (id)-[MILaunchServicesOperation serialNumber](self, "serialNumber");
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
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  unint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperation operationUUID](self, "operationUUID"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = -[MILaunchServicesOperation serialNumber](self, "serialNumber") ^ v4;

  return v5;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperation operationUUID](self, "operationUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %@:%lu>"), v5, v6, -[MILaunchServicesOperation serialNumber](self, "serialNumber")));

  return v7;
}

- (NSUUID)operationUUID
{
  return self->_operationUUID;
}

- (unint64_t)serialNumber
{
  return self->_serialNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationUUID, 0);
}

@end
