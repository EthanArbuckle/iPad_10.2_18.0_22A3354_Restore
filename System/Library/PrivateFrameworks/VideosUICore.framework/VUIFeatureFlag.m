@implementation VUIFeatureFlag

- (VUIFeatureFlag)initWithFeatureDict:(id)a3
{
  id v4;
  VUIFeatureFlag *v5;
  uint64_t v6;
  NSString *defaultsKey;
  uint64_t v8;
  NSString *featureName;
  const __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  NSString *isEnabledByDefaultKey;
  void *v16;
  void *v17;
  void *v18;
  NSString *v19;
  NSString *defaultsDomain;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)VUIFeatureFlag;
  v5 = -[VUIFeatureFlag init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("defaultsKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    defaultsKey = v5->_defaultsKey;
    v5->_defaultsKey = (NSString *)v6;

    objc_msgSend(v4, "objectForKey:", CFSTR("featureName"));
    v8 = objc_claimAutoreleasedReturnValue();
    featureName = v5->_featureName;
    v5->_featureName = (NSString *)v8;

    objc_msgSend(v4, "objectForKey:", CFSTR("featureDescription"));
    v10 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    v11 = (__CFString *)v10;
    v12 = v10 ? (__CFString *)v10 : &stru_1E9F2D140;
    objc_storeStrong((id *)&v5->_featureDescription, v12);

    objc_msgSend(v4, "objectForKey:", CFSTR("isEnabledByDefault"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isEnabledByDefault = objc_msgSend(v13, "BOOLValue");

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_ebd"), v5->_defaultsKey);
    v14 = objc_claimAutoreleasedReturnValue();
    isEnabledByDefaultKey = v5->_isEnabledByDefaultKey;
    v5->_isEnabledByDefaultKey = (NSString *)v14;

    objc_msgSend(v4, "objectForKey:", CFSTR("isIOS"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isAvailableForOS = objc_msgSend(v16, "intValue") != 0;

    if (v5->_isAvailableForOS)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("iOSDefaultsDomain"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        v19 = v17;
      }
      else
      {
        objc_msgSend(v4, "objectForKey:", CFSTR("defaultsDomain"));
        v19 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      defaultsDomain = v5->_defaultsDomain;
      v5->_defaultsDomain = v19;

      if (!v5->_defaultsDomain)
      {
        v5->_defaultsDomain = (NSString *)CFSTR("com.apple.tv");

      }
    }
  }

  return v5;
}

- (BOOL)enabled
{
  void *v3;
  void *v4;
  void *v5;
  BOOL result;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  if (self->_isAvailableForOS)
  {
    if (!self->_isEnabledByDefault)
      goto LABEL_4;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIFeatureFlag isEnabledByDefaultKey](self, "isEnabledByDefaultKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIFeatureFlag defaultsDomain](self, "defaultsDomain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[VUIFeatureFlag defaultsKey](self, "defaultsKey");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeObjectForKey:", v12);
      }
      else
      {
        -[VUIFeatureFlag defaultsDomain](self, "defaultsDomain");
        v13 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v11, "initWithSuiteName:", v13);
        -[VUIFeatureFlag defaultsKey](self, "defaultsKey");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeObjectForKey:", v14);

        v11 = (void *)v13;
      }

      self->_enabled = 1;
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIFeatureFlag isEnabledByDefaultKey](self, "isEnabledByDefaultKey");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v16);

      return self->_enabled;
    }
    else
    {
LABEL_4:
      result = -[VUIFeatureFlag _enabledFromDefaults](self, "_enabledFromDefaults");
      self->_enabled = result;
    }
  }
  else
  {
    result = 0;
    self->_enabled = 0;
  }
  return result;
}

- (BOOL)_enabledFromDefaults
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIFeatureFlag defaultsDomain](self, "defaultsDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[VUIFeatureFlag defaultsKey](self, "defaultsKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIFeatureFlag defaultsKey](self, "defaultsKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "BOOLForKey:", v11);

      return v12;
    }
  }
  else
  {
    -[VUIFeatureFlag defaultsDomain](self, "defaultsDomain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v7, "initWithSuiteName:", v14);
    -[VUIFeatureFlag defaultsKey](self, "defaultsKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIFeatureFlag defaultsDomain](self, "defaultsDomain");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v18, "initWithSuiteName:", v19);
      -[VUIFeatureFlag defaultsKey](self, "defaultsKey");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "BOOLForKey:", v21);

      return v22;
    }
  }
  return self->_isEnabledByDefault;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  self->_enabled = a3;
  if (self->_isAvailableForOS)
  {
    v3 = a3;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIFeatureFlag defaultsDomain](self, "defaultsDomain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIFeatureFlag defaultsKey](self, "defaultsKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKey:", v9, v10);
    }
    else
    {
      -[VUIFeatureFlag defaultsDomain](self, "defaultsDomain");
      v11 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v13, "initWithSuiteName:", v11);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIFeatureFlag defaultsKey](self, "defaultsKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v10, v12);

      v13 = (id)v11;
    }

  }
}

- (NSString)featureName
{
  return self->_featureName;
}

- (NSString)featureDescription
{
  return self->_featureDescription;
}

- (NSString)defaultsKey
{
  return self->_defaultsKey;
}

- (BOOL)isAvailableForOS
{
  return self->_isAvailableForOS;
}

- (BOOL)isEnabledByDefault
{
  return self->_isEnabledByDefault;
}

- (NSString)defaultsDomain
{
  return self->_defaultsDomain;
}

- (NSString)isEnabledByDefaultKey
{
  return self->_isEnabledByDefaultKey;
}

- (void)setIsEnabledByDefaultKey:(id)a3
{
  objc_storeStrong((id *)&self->_isEnabledByDefaultKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isEnabledByDefaultKey, 0);
  objc_storeStrong((id *)&self->_defaultsDomain, 0);
  objc_storeStrong((id *)&self->_defaultsKey, 0);
  objc_storeStrong((id *)&self->_featureDescription, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
}

@end
