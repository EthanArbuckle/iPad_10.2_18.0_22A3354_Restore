@implementation PFPosterExtension

- (PFPosterExtension)initWithIdentity:(id)a3
{
  id v6;
  void *v7;
  PFPosterExtension *v8;
  PFPosterExtension *v9;
  uint64_t v10;
  NSUUID *uuid;
  id v12;
  PFPosterExtension *result;
  void *v14;
  objc_super v15;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    v15.receiver = self;
    v15.super_class = (Class)PFPosterExtension;
    v8 = -[PFPosterExtension init](&v15, sel_init);
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_identity, a3);
      objc_msgSend(v7, "uniqueIdentifier");
      v10 = objc_claimAutoreleasedReturnValue();
      uuid = v9->_uuid;
      v9->_uuid = (NSUUID *)v10;

      v12 = -[PFPosterExtension applicationExtensionRecord](v9, "applicationExtensionRecord");
    }

    return v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("identity"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PFPosterExtension initWithIdentity:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    result = (PFPosterExtension *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (id)extensionWithIdentity:(id)a3
{
  id v3;
  PFPosterExtension *v4;

  v3 = a3;
  v4 = -[PFPosterExtension initWithIdentity:]([PFPosterExtension alloc], "initWithIdentity:", v3);

  return v4;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_uuid, "hash");
}

- (BOOL)isEqual:(id)a3
{
  PFPosterExtension *v4;

  v4 = (PFPosterExtension *)a3;
  if (v4 != self)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && -[NSUUID isEqual:](self->_uuid, "isEqual:", v4->_uuid)
      && -[RBSProcessIdentity isEqual:](self->_processIdentity, "isEqual:", v4->_processIdentity)
      && -[_EXHostConfiguration isEqual:](self->_hostConfiguration, "isEqual:", v4->_hostConfiguration))
    {
      -[_EXExtensionIdentity isEqual:](self->_identity, "isEqual:", v4->_identity);
    }
  }

  return v4 == self;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("instanceIdentifier"));

  -[PFPosterExtension posterExtensionBundleIdentifier](self, "posterExtensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("posterExtensionBundleIdentifier"));

  -[PFPosterExtension localizedName](self, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("localizedName"));

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)applicationExtensionRecord
{
  os_unfair_lock_s *p_lock;
  LSApplicationExtensionRecord *record;
  LSApplicationExtensionRecord *v5;
  LSApplicationExtensionRecord *v6;
  LSApplicationExtensionRecord *v7;
  id v8;
  id v9;
  NSUUID *uuid;
  LSApplicationExtensionRecord *v11;
  LSApplicationExtensionRecord *v12;
  void *v13;
  id v14;
  void *v15;
  LSApplicationExtensionRecord *v16;
  id v17;
  LSApplicationExtensionRecord *v18;
  NSObject *v19;
  LSApplicationExtensionRecord *v20;
  _EXExtensionIdentity *identity;
  id v23;
  id v24;
  uint8_t buf[4];
  PFPosterExtension *v26;
  __int16 v27;
  _EXExtensionIdentity *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  record = self->_record;
  if (record)
  {
    v5 = record;
  }
  else
  {
    -[_EXExtensionIdentity applicationExtensionRecord](self->_identity, "applicationExtensionRecord");
    v6 = (LSApplicationExtensionRecord *)objc_claimAutoreleasedReturnValue();
    v7 = self->_record;
    self->_record = v6;

    if (self->_record)
    {
      v8 = 0;
    }
    else
    {
      -[_EXExtensionIdentity uniqueIdentifier](self->_identity, "uniqueIdentifier");
      v8 = (id)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v9 = objc_alloc(MEMORY[0x24BDC1528]);
        uuid = self->_uuid;
        v24 = 0;
        v11 = (LSApplicationExtensionRecord *)objc_msgSend(v9, "initWithUUID:error:", uuid, &v24);
        v8 = v24;
        v12 = self->_record;
        self->_record = v11;

      }
      if (!self->_record)
      {
        -[_EXExtensionIdentity bundleIdentifier](self->_identity, "bundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v14 = objc_alloc(MEMORY[0x24BDC1528]);
          -[_EXExtensionIdentity bundleIdentifier](self->_identity, "bundleIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v8;
          v16 = (LSApplicationExtensionRecord *)objc_msgSend(v14, "initWithBundleIdentifier:error:", v15, &v23);
          v17 = v23;

          v18 = self->_record;
          self->_record = v16;

          v8 = v17;
        }
        if (!self->_record)
        {
          PFLogHosting();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            identity = self->_identity;
            *(_DWORD *)buf = 134218498;
            v26 = self;
            v27 = 2114;
            v28 = identity;
            v29 = 2114;
            v30 = v8;
            _os_log_error_impl(&dword_24462A000, v19, OS_LOG_TYPE_ERROR, "%p Failure to fault in application extensionRecord for identity %{public}@: %{public}@", buf, 0x20u);
          }

        }
      }
    }

  }
  os_unfair_lock_unlock(p_lock);
  v20 = self->_record;

  return v20;
}

- (NSString)localizedName
{
  return (NSString *)-[_EXExtensionIdentity localizedName](self->_identity, "localizedName");
}

- (id)instanceIdentifier
{
  return self->_uuid;
}

- (NSString)posterExtensionBundleIdentifier
{
  return (NSString *)-[_EXExtensionIdentity bundleIdentifier](self->_identity, "bundleIdentifier");
}

- (NSString)posterExtensionContainerBundleIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[PFPosterExtension applicationExtensionRecord](self, "applicationExtensionRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containingBundleRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (LSPropertyList)posterExtensionInfoPlist
{
  void *v2;
  void *v3;

  -[PFPosterExtension applicationExtensionRecord](self, "applicationExtensionRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (LSPropertyList *)v3;
}

- (LSPropertyList)posterExtensionEntitlementsPlist
{
  void *v2;
  void *v3;

  -[PFPosterExtension applicationExtensionRecord](self, "applicationExtensionRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entitlements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (LSPropertyList *)v3;
}

- (NSData)persistentIdentifier
{
  void *v2;
  void *v3;

  -[PFPosterExtension applicationExtensionRecord](self, "applicationExtensionRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (NSBundle)posterExtensionBundle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1488];
  -[PFPosterExtension applicationExtensionRecord](self, "applicationExtensionRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pf_uniqueBundleWithURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSBundle *)v5;
}

- (NSSet)supportedRoles
{
  void *v2;
  void *v3;

  -[PFPosterExtension posterExtensionInfoPlist](self, "posterExtensionInfoPlist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pf_supportedRoles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uuid;
}

- (_EXExtensionIdentity)identity
{
  return self->_identity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_processIdentity, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_hostConfiguration, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

- (void)initWithIdentity:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_24462A000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
