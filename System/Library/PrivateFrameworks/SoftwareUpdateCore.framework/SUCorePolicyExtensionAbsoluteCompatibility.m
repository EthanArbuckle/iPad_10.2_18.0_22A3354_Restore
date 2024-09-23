@implementation SUCorePolicyExtensionAbsoluteCompatibility

- (SUCorePolicyExtensionAbsoluteCompatibility)init
{
  SUCorePolicyExtensionAbsoluteCompatibility *v2;
  SUCorePolicyExtensionAbsoluteCompatibility *v3;
  NSNumber *compatibilityVersion;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUCorePolicyExtensionAbsoluteCompatibility;
  v2 = -[SUCorePolicyExtension init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    compatibilityVersion = v2->_compatibilityVersion;
    v2->_compatibilityVersion = 0;

  }
  return v3;
}

- (void)extendSoftwareUpdateMAAssetQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  SUCorePolicyExtensionAbsoluteCompatibility *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCorePolicyExtensionAbsoluteCompatibility compatibilityVersion](self, "compatibilityVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SUCorePolicyExtensionAbsoluteCompatibility compatibilityVersion](self, "compatibilityVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addKeyValuePair:with:", CFSTR("_CompatibilityVersion"), v7);

  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "oslog");
  v9 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[SUCorePolicyExtensionAbsoluteCompatibility compatibilityVersion](self, "compatibilityVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = self;
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ querying SU metadata: compatibilityVersion=%{public}@", (uint8_t *)&v11, 0x16u);

  }
}

- (id)filterSoftwareUpdateAssetArray:(id)a3
{
  return a3;
}

- (id)filterDocumentationAssetArray:(id)a3
{
  return a3;
}

- (SUCorePolicyExtensionAbsoluteCompatibility)initWithCoder:(id)a3
{
  id v4;
  SUCorePolicyExtensionAbsoluteCompatibility *v5;
  uint64_t v6;
  NSNumber *compatibilityVersion;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUCorePolicyExtensionAbsoluteCompatibility;
  v5 = -[SUCorePolicyExtension init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_CompatibilityVersion"));
    v6 = objc_claimAutoreleasedReturnValue();
    compatibilityVersion = v5->_compatibilityVersion;
    v5->_compatibilityVersion = (NSNumber *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SUCorePolicyExtensionAbsoluteCompatibility compatibilityVersion](self, "compatibilityVersion");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_CompatibilityVersion"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  SUCorePolicyExtensionAbsoluteCompatibility *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (SUCorePolicyExtensionAbsoluteCompatibility *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = (void *)MEMORY[0x1E0DA8920];
      -[SUCorePolicyExtensionAbsoluteCompatibility compatibilityVersion](v4, "compatibilityVersion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCorePolicyExtensionAbsoluteCompatibility compatibilityVersion](self, "compatibilityVersion");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v5, "numberIsEqual:to:", v6, v7);

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)extensionName
{
  return CFSTR("SUCorePolicyExtensionAbsoluteCompatibility");
}

- (id)summary
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;

  -[SUCorePolicyExtensionAbsoluteCompatibility compatibilityVersion](self, "compatibilityVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCorePolicyExtensionAbsoluteCompatibility compatibilityVersion](self, "compatibilityVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("|compatibilityVersion=%@"), v5);
    objc_msgSend(&stru_1EA87A8E8, "stringByAppendingString:", v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = &stru_1EA87A8E8;
  }
  if ((-[__CFString isEqualToString:](v7, "isEqualToString:", &stru_1EA87A8E8) & 1) == 0)
  {
    -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", CFSTR("|"));
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (__CFString *)v8;
  }
  return v7;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCorePolicyExtensionAbsoluteCompatibility extensionName](self, "extensionName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionAbsoluteCompatibility compatibilityVersion](self, "compatibilityVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@(compatibilityVersion:%@)"), v4, v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SUCorePolicyExtensionAbsoluteCompatibility *v4;
  void *v5;

  v4 = objc_alloc_init(SUCorePolicyExtensionAbsoluteCompatibility);
  -[SUCorePolicyExtensionAbsoluteCompatibility compatibilityVersion](self, "compatibilityVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicyExtensionAbsoluteCompatibility setCompatibilityVersion:](v4, "setCompatibilityVersion:", v5);

  return v4;
}

- (NSNumber)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (void)setCompatibilityVersion:(id)a3
{
  objc_storeStrong((id *)&self->_compatibilityVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compatibilityVersion, 0);
}

@end
