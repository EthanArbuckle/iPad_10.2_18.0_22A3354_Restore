@implementation MILaunchServicesRegisterOperation

- (MILaunchServicesRegisterOperation)initWithBundleID:(id)a3 domain:(unint64_t)a4 personas:(id)a5 mountPoint:(id)a6 operationUUID:(id)a7 serialNumber:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  MILaunchServicesRegisterOperation *v17;
  NSString *v18;
  NSString *bundleID;
  NSSet *v20;
  NSSet *personaUniqueStrings;
  objc_super v23;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v23.receiver = self;
  v23.super_class = (Class)MILaunchServicesRegisterOperation;
  v17 = -[MILaunchServicesOperation initWithOperationUUID:serialNumber:](&v23, "initWithOperationUUID:serialNumber:", a7, a8);
  if (v17)
  {
    v18 = (NSString *)objc_msgSend(v14, "copy");
    bundleID = v17->_bundleID;
    v17->_bundleID = v18;

    v17->_domain = a4;
    v20 = (NSSet *)objc_msgSend(v15, "copy");
    personaUniqueStrings = v17->_personaUniqueStrings;
    v17->_personaUniqueStrings = v20;

    objc_storeStrong((id *)&v17->_mountPoint, a6);
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MILaunchServicesRegisterOperation)initWithCoder:(id)a3
{
  id v4;
  MILaunchServicesRegisterOperation *v5;
  id v6;
  uint64_t v7;
  NSString *bundleID;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSSet *v13;
  void *v14;
  uint64_t v15;
  NSSet *personaUniqueStrings;
  id v17;
  uint64_t v18;
  NSURL *mountPoint;
  MILaunchServicesRegisterOperation *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)MILaunchServicesRegisterOperation;
  v5 = -[MILaunchServicesOperation initWithCoder:](&v35, "initWithCoder:", v4);
  if (!v5)
    goto LABEL_6;
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("bundleID"));
  v7 = objc_claimAutoreleasedReturnValue(v6);
  bundleID = v5->_bundleID;
  v5->_bundleID = (NSString *)v7;

  if (!v5->_bundleID)
  {
    v21 = sub_100010E50((uint64_t)"-[MILaunchServicesRegisterOperation initWithCoder:]", 44, MIInstallerErrorDomain, 186, 0, 0, CFSTR("Missing bundle ID when deserializing registration"), v9, v34);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
LABEL_11:
    objc_msgSend(v4, "failWithError:", v22);

    v20 = 0;
    goto LABEL_12;
  }
  v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("domain"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v5->_domain = (unint64_t)objc_msgSend(v11, "unsignedIntegerValue");

  if ((MIIsValidInstallationDomain(v5->_domain) & 1) == 0)
  {
    v23 = (void *)MIInstallerErrorDomain;
    v24 = (uint64_t)v5->_bundleID;
    v25 = MIStringForInstallationDomain(v5->_domain);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v28 = sub_100010E50((uint64_t)"-[MILaunchServicesRegisterOperation initWithCoder:]", 50, v23, 186, 0, 0, CFSTR("Invalid installation domain value when deserializing registration for %@/%@"), v27, v24);
LABEL_10:
    v22 = (void *)objc_claimAutoreleasedReturnValue(v28);

    goto LABEL_11;
  }
  v12 = objc_opt_class(NSSet);
  v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, objc_opt_class(NSString), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("personaUniqueStrings")));
  personaUniqueStrings = v5->_personaUniqueStrings;
  v5->_personaUniqueStrings = (NSSet *)v15;

  if (!v5->_personaUniqueStrings)
  {
    v29 = (void *)MIInstallerErrorDomain;
    v30 = (uint64_t)v5->_bundleID;
    v31 = MIStringForInstallationDomain(v5->_domain);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v28 = sub_100010E50((uint64_t)"-[MILaunchServicesRegisterOperation initWithCoder:]", 56, v29, 186, 0, 0, CFSTR("Missing persona unique strings when deserializing registration for %@/%@"), v32, v30);
    goto LABEL_10;
  }
  v17 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSURL), CFSTR("mountPoint"));
  v18 = objc_claimAutoreleasedReturnValue(v17);
  mountPoint = v5->_mountPoint;
  v5->_mountPoint = (NSURL *)v18;

LABEL_6:
  v20 = v5;
LABEL_12:

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MILaunchServicesRegisterOperation;
  v4 = a3;
  -[MILaunchServicesOperation encodeWithCoder:](&v9, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesRegisterOperation bundleID](self, "bundleID", v9.receiver, v9.super_class));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bundleID"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MILaunchServicesRegisterOperation domain](self, "domain")));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("domain"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesRegisterOperation personaUniqueStrings](self, "personaUniqueStrings"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("personaUniqueStrings"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesRegisterOperation mountPoint](self, "mountPoint"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("mountPoint"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  BOOL v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MILaunchServicesRegisterOperation;
  if (-[MILaunchServicesOperation isEqual:](&v17, "isEqual:", v4)
    && (objc_opt_class(self), (objc_opt_isKindOfClass(v4) & 1) != 0))
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesRegisterOperation bundleID](self, "bundleID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleID"));
    v8 = sub_1000116CC(v6, v7);

    if (v8
      && (v9 = objc_msgSend(v5, "domain"), v9 == (id)-[MILaunchServicesRegisterOperation domain](self, "domain"))
      && (v10 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesRegisterOperation personaUniqueStrings](self, "personaUniqueStrings")),
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "personaUniqueStrings")),
          v12 = sub_1000116CC(v10, v11),
          v11,
          v10,
          v12))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesRegisterOperation mountPoint](self, "mountPoint"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mountPoint"));
      v15 = sub_1000116CC(v13, v14);

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MILaunchServicesRegisterOperation;
  v3 = -[MILaunchServicesOperation hash](&v12, "hash");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesRegisterOperation bundleID](self, "bundleID"));
  v5 = (unint64_t)objc_msgSend(v4, "hash");
  v6 = v5 ^ -[MILaunchServicesRegisterOperation domain](self, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesRegisterOperation personaUniqueStrings](self, "personaUniqueStrings"));
  v8 = v6 ^ (unint64_t)objc_msgSend(v7, "hash");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesRegisterOperation mountPoint](self, "mountPoint"));
  v10 = v8 ^ (unint64_t)objc_msgSend(v9, "hash") ^ v3;

  return v10;
}

- (void)updatePersonaUniqueStrings:(id)a3
{
  NSSet *v4;
  NSSet *personaUniqueStrings;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  personaUniqueStrings = self->_personaUniqueStrings;
  self->_personaUniqueStrings = v4;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesRegisterOperation personaUniqueStrings](self, "personaUniqueStrings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allObjects"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", ")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesRegisterOperation mountPoint](self, "mountPoint"));
  v7 = (objc_class *)objc_opt_class(self);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperation operationUUID](self, "operationUUID"));
  v11 = -[MILaunchServicesOperation serialNumber](self, "serialNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesRegisterOperation bundleID](self, "bundleID"));
  v13 = MIStringForInstallationDomain(-[MILaunchServicesRegisterOperation domain](self, "domain"));
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)v14;
  if (v6)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %@:%lu %@/%@ personas:[%@] mount:%@>"), v9, v10, v11, v12, v15, v5, v16));

  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %@:%lu %@/%@ personas:[%@]>"), v9, v10, v11, v12, v14, v5));
  }

  return v17;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (unint64_t)domain
{
  return self->_domain;
}

- (NSSet)personaUniqueStrings
{
  return self->_personaUniqueStrings;
}

- (NSURL)mountPoint
{
  return self->_mountPoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mountPoint, 0);
  objc_storeStrong((id *)&self->_personaUniqueStrings, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
