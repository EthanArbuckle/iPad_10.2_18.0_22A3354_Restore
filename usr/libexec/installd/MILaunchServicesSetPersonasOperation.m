@implementation MILaunchServicesSetPersonasOperation

- (MILaunchServicesSetPersonasOperation)initWithBundleID:(id)a3 domain:(unint64_t)a4 personas:(id)a5 registrationUUID:(id)a6 serialNumber:(unint64_t)a7
{
  id v12;
  id v13;
  MILaunchServicesSetPersonasOperation *v14;
  NSString *v15;
  NSString *bundleID;
  NSSet *v17;
  NSSet *personaUniqueStrings;
  objc_super v20;

  v12 = a3;
  v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MILaunchServicesSetPersonasOperation;
  v14 = -[MILaunchServicesOperation initWithOperationUUID:serialNumber:](&v20, "initWithOperationUUID:serialNumber:", a6, a7);
  if (v14)
  {
    v15 = (NSString *)objc_msgSend(v12, "copy");
    bundleID = v14->_bundleID;
    v14->_bundleID = v15;

    v14->_domain = a4;
    v17 = (NSSet *)objc_msgSend(v13, "copy");
    personaUniqueStrings = v14->_personaUniqueStrings;
    v14->_personaUniqueStrings = v17;

  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MILaunchServicesSetPersonasOperation)initWithCoder:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  MILaunchServicesSetPersonasOperation *v17;
  void *v18;
  __CFString *v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MILaunchServicesSetPersonasOperation;
  v5 = -[MILaunchServicesOperation initWithCoder:](&v25, "initWithCoder:", v4);
  if (!v5)
    goto LABEL_5;
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("bundleID"));
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)*((_QWORD *)v5 + 3);
  *((_QWORD *)v5 + 3) = v7;

  if (!*((_QWORD *)v5 + 3))
  {
    v18 = (void *)MIInstallerErrorDomain;
    v19 = CFSTR("Missing bundle ID when deserializing registration");
    v20 = 43;
LABEL_9:
    v21 = sub_100010E50((uint64_t)"-[MILaunchServicesSetPersonasOperation initWithCoder:]", v20, v18, 186, 0, 0, v19, v9, v24);
    goto LABEL_10;
  }
  v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("domain"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  *((_QWORD *)v5 + 4) = objc_msgSend(v11, "unsignedIntegerValue");

  if ((MIIsValidInstallationDomain(*((_QWORD *)v5 + 4)) & 1) == 0)
  {
    v21 = sub_100010E50((uint64_t)"-[MILaunchServicesSetPersonasOperation initWithCoder:]", 49, MIInstallerErrorDomain, 186, 0, 0, CFSTR("Invalid installation domain value when deserializing registration for %@: %lu"), v12, *((_QWORD *)v5 + 3));
LABEL_10:
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    objc_msgSend(v4, "failWithError:", v22);

    v17 = 0;
    goto LABEL_11;
  }
  v13 = objc_opt_class(NSSet);
  v24 = objc_opt_class(NSString);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v13));
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("personaUniqueStrings")));
  v16 = (void *)*((_QWORD *)v5 + 5);
  *((_QWORD *)v5 + 5) = v15;

  if (!*((_QWORD *)v5 + 5))
  {
    v18 = (void *)MIInstallerErrorDomain;
    v19 = CFSTR("Missing persona unique strings when deserializing registration");
    v20 = 55;
    goto LABEL_9;
  }
LABEL_5:
  v17 = (MILaunchServicesSetPersonasOperation *)v5;
LABEL_11:

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MILaunchServicesSetPersonasOperation;
  v4 = a3;
  -[MILaunchServicesOperation encodeWithCoder:](&v8, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesSetPersonasOperation bundleID](self, "bundleID", v8.receiver, v8.super_class));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bundleID"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MILaunchServicesSetPersonasOperation domain](self, "domain")));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("domain"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesSetPersonasOperation personaUniqueStrings](self, "personaUniqueStrings"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("personaUniqueStrings"));

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
  BOOL v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MILaunchServicesSetPersonasOperation;
  if (-[MILaunchServicesOperation isEqual:](&v14, "isEqual:", v4)
    && (objc_opt_class(self), (objc_opt_isKindOfClass(v4) & 1) != 0))
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesSetPersonasOperation bundleID](self, "bundleID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleID"));
    v8 = sub_1000116CC(v6, v7);

    if (v8
      && (v9 = objc_msgSend(v5, "domain"), v9 == (id)-[MILaunchServicesSetPersonasOperation domain](self, "domain")))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesSetPersonasOperation personaUniqueStrings](self, "personaUniqueStrings"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "personaUniqueStrings"));
      v12 = sub_1000116CC(v10, v11);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MILaunchServicesSetPersonasOperation;
  v3 = -[MILaunchServicesOperation hash](&v10, "hash");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesSetPersonasOperation bundleID](self, "bundleID"));
  v5 = (unint64_t)objc_msgSend(v4, "hash");
  v6 = v5 ^ -[MILaunchServicesSetPersonasOperation domain](self, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesSetPersonasOperation personaUniqueStrings](self, "personaUniqueStrings"));
  v8 = v6 ^ (unint64_t)objc_msgSend(v7, "hash") ^ v3;

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesSetPersonasOperation personaUniqueStrings](self, "personaUniqueStrings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allObjects"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", ")));

  v6 = (objc_class *)objc_opt_class(self);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesOperation operationUUID](self, "operationUUID"));
  v10 = -[MILaunchServicesOperation serialNumber](self, "serialNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MILaunchServicesSetPersonasOperation bundleID](self, "bundleID"));
  v12 = MIStringForInstallationDomain(-[MILaunchServicesSetPersonasOperation domain](self, "domain"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %@:%lu %@/%@ personas:[%@]>"), v8, v9, v10, v11, v13, v5));

  return v14;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaUniqueStrings, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
