@implementation SUCoreRollbackDescriptor

- (SUCoreRollbackDescriptor)init
{
  SUCoreRollbackDescriptor *v2;
  void *v3;
  uint64_t v4;
  NSString *restoreVersion;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *productVersion;
  void *v13;
  uint64_t v14;
  NSString *productBuildVersion;
  void *v16;
  uint64_t v17;
  NSString *releaseType;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SUCoreRollbackDescriptor;
  v2 = -[SUCoreRollbackDescriptor init](&v21, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "splatCryptex1RestoreVersion");
    v4 = objc_claimAutoreleasedReturnValue();
    restoreVersion = v2->_restoreVersion;
    v2->_restoreVersion = (NSString *)v4;

    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "splatCryptex1ProductVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "splatCryptex1ProductVersionExtra");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ %@"), v8, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    productVersion = v2->_productVersion;
    v2->_productVersion = (NSString *)v11;

    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "splatCryptex1BuildVersion");
    v14 = objc_claimAutoreleasedReturnValue();
    productBuildVersion = v2->_productBuildVersion;
    v2->_productBuildVersion = (NSString *)v14;

    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "splatCryptex1ReleaseType");
    v17 = objc_claimAutoreleasedReturnValue();
    releaseType = v2->_releaseType;
    v2->_releaseType = (NSString *)v17;

    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_rollbackEligible = objc_msgSend(v19, "hasEligibleRollback");

  }
  return v2;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  const __CFString *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCoreRollbackDescriptor restoreVersion](self, "restoreVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreRollbackDescriptor productVersion](self, "productVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreRollbackDescriptor productBuildVersion](self, "productBuildVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreRollbackDescriptor releaseType](self, "releaseType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SUCoreRollbackDescriptor rollbackEligible](self, "rollbackEligible");
  v9 = CFSTR("NO");
  if (v8)
    v9 = CFSTR("YES");
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("restoreVersion:%@ productVersion:%@ producBuildVersion:%@ releaseType:%@ rollbackEligible:%@"), v4, v5, v6, v7, v9);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUCoreRollbackDescriptor)initWithCoder:(id)a3
{
  id v4;
  SUCoreRollbackDescriptor *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUCoreRollbackDescriptor;
  v5 = -[SUCoreRollbackDescriptor init](&v11, sel_init);
  if (v5)
  {
    -[SUCoreRollbackDescriptor setRollbackEligible:](v5, "setRollbackEligible:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("rollbackEligible")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("restoreVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreRollbackDescriptor setRestoreVersion:](v5, "setRestoreVersion:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreRollbackDescriptor setProductVersion:](v5, "setProductVersion:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productBuildVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreRollbackDescriptor setProductBuildVersion:](v5, "setProductBuildVersion:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("releaseType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreRollbackDescriptor setReleaseType:](v5, "setReleaseType:", v9);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[SUCoreRollbackDescriptor rollbackEligible](self, "rollbackEligible"), CFSTR("rollbackEligible"));
  -[SUCoreRollbackDescriptor restoreVersion](self, "restoreVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("restoreVersion"));

  -[SUCoreRollbackDescriptor productVersion](self, "productVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("productVersion"));

  -[SUCoreRollbackDescriptor productBuildVersion](self, "productBuildVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("productBuildVersion"));

  -[SUCoreRollbackDescriptor releaseType](self, "releaseType");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("releaseType"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  SUCoreRollbackDescriptor *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = -[SUCoreRollbackDescriptor init](+[SUCoreRollbackDescriptor allocWithZone:](SUCoreRollbackDescriptor, "allocWithZone:"), "init");
  -[SUCoreRollbackDescriptor setRollbackEligible:](v5, "setRollbackEligible:", -[SUCoreRollbackDescriptor rollbackEligible](self, "rollbackEligible"));
  -[SUCoreRollbackDescriptor restoreVersion](self, "restoreVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[SUCoreRollbackDescriptor setRestoreVersion:](v5, "setRestoreVersion:", v7);

  -[SUCoreRollbackDescriptor productVersion](self, "productVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  -[SUCoreRollbackDescriptor setProductVersion:](v5, "setProductVersion:", v9);

  -[SUCoreRollbackDescriptor productBuildVersion](self, "productBuildVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  -[SUCoreRollbackDescriptor setProductBuildVersion:](v5, "setProductBuildVersion:", v11);

  -[SUCoreRollbackDescriptor releaseType](self, "releaseType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  -[SUCoreRollbackDescriptor setReleaseType:](v5, "setReleaseType:", v13);

  return v5;
}

- (BOOL)rollbackEligible
{
  return self->_rollbackEligible;
}

- (void)setRollbackEligible:(BOOL)a3
{
  self->_rollbackEligible = a3;
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
  objc_storeStrong((id *)&self->_productVersion, a3);
}

- (NSString)productBuildVersion
{
  return self->_productBuildVersion;
}

- (void)setProductBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_productBuildVersion, a3);
}

- (NSString)restoreVersion
{
  return self->_restoreVersion;
}

- (void)setRestoreVersion:(id)a3
{
  objc_storeStrong((id *)&self->_restoreVersion, a3);
}

- (NSString)releaseType
{
  return self->_releaseType;
}

- (void)setReleaseType:(id)a3
{
  objc_storeStrong((id *)&self->_releaseType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_releaseType, 0);
  objc_storeStrong((id *)&self->_productBuildVersion, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_restoreVersion, 0);
}

@end
