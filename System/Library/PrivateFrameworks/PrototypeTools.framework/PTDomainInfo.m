@implementation PTDomainInfo

- (PTDomainInfo)initWithDomain:(id)a3
{
  id v4;
  PTDomainInfo *v5;
  void *v6;
  uint64_t v7;
  NSString *domainGroupName;
  uint64_t v9;
  NSString *domainName;
  objc_class *v11;
  objc_class *v12;
  uint64_t v13;
  NSString *settingsClassName;
  void *v15;
  uint64_t v16;
  NSString *settingsFrameworkBundlePath;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PTDomainInfo;
  v5 = -[PTDomainInfo init](&v19, sel_init);
  if (v5)
  {
    v6 = (void *)objc_opt_class();
    objc_msgSend(v6, "domainGroupName");
    v7 = objc_claimAutoreleasedReturnValue();
    domainGroupName = v5->_domainGroupName;
    v5->_domainGroupName = (NSString *)v7;

    objc_msgSend(v6, "domainName");
    v9 = objc_claimAutoreleasedReturnValue();
    domainName = v5->_domainName;
    v5->_domainName = (NSString *)v9;

    v11 = (objc_class *)objc_msgSend(v6, "rootSettingsClass");
    if (v11)
    {
      v12 = v11;
      NSStringFromClass(v11);
      v13 = objc_claimAutoreleasedReturnValue();
      settingsClassName = v5->_settingsClassName;
      v5->_settingsClassName = (NSString *)v13;

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bundlePath");
      v16 = objc_claimAutoreleasedReturnValue();
      settingsFrameworkBundlePath = v5->_settingsFrameworkBundlePath;
      v5->_settingsFrameworkBundlePath = (NSString *)v16;

    }
  }

  return v5;
}

- (NSString)uniqueIdentifier
{
  NSString *uniqueIdentifier;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *v10;

  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString componentsSeparatedByCharactersInSet:](self->_domainGroupName, "componentsSeparatedByCharactersInSet:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", &stru_1E7059270);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSString componentsSeparatedByCharactersInSet:](self->_domainName, "componentsSeparatedByCharactersInSet:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsJoinedByString:", &stru_1E7059270);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v6, v8);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v9;

    uniqueIdentifier = self->_uniqueIdentifier;
  }
  return uniqueIdentifier;
}

- (void)loadSettingsClassBundleIfNecessary
{
  PTDomainInfo *v2;
  NSString *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  Class v10;
  NSObject *v11;
  _BOOL4 v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  NSString *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = self;
  -[PTDomainInfo settingsClassName](v2, "settingsClassName");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && !NSClassFromString(v3))
  {
    -[PTDomainInfo settingsFrameworkBundlePath](v2, "settingsFrameworkBundlePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
LABEL_18:

      goto LABEL_19;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
    {
      PTLogObjectForTopic(2);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v19 = v4;
        v20 = 2112;
        v21 = v5;
        _os_log_impl(&dword_1B966F000, v9, OS_LOG_TYPE_DEFAULT, "No bundle found for settings class '%@' at path %@", buf, 0x16u);
      }
      goto LABEL_17;
    }
    v17 = 0;
    v8 = objc_msgSend(v6, "loadAndReturnError:", &v17);
    v9 = v17;
    if ((v8 & 1) == 0)
    {
      PTLogObjectForTopic(2);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject localizedDescription](v9, "localizedDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v19 = (NSString *)v5;
        v20 = 2112;
        v21 = v16;
        _os_log_impl(&dword_1B966F000, v11, OS_LOG_TYPE_DEFAULT, "Unable to load settings bundle at path %@: %@", buf, 0x16u);

      }
      goto LABEL_16;
    }
    v10 = NSClassFromString(v4);
    PTLogObjectForTopic(2);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        *(_DWORD *)buf = 138412290;
        v19 = v4;
        v13 = "Successfully loaded bundle for settings class '%@'";
        v14 = v11;
        v15 = 12;
LABEL_15:
        _os_log_impl(&dword_1B966F000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
      }
    }
    else if (v12)
    {
      *(_DWORD *)buf = 138412546;
      v19 = v4;
      v20 = 2112;
      v21 = v5;
      v13 = "Unable to find settings class '%@' even after loading bundle at path %@";
      v14 = v11;
      v15 = 22;
      goto LABEL_15;
    }
LABEL_16:

LABEL_17:
    goto LABEL_18;
  }
LABEL_19:

}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && BSEqualStrings()
    && BSEqualStrings()
    && BSEqualStrings())
  {
    v4 = BSEqualStrings();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendString:", self->_domainGroupName);
  v5 = (id)objc_msgSend(v3, "appendString:", self->_domainName);
  v6 = (id)objc_msgSend(v3, "appendString:", self->_settingsClassName);
  v7 = (id)objc_msgSend(v3, "appendString:", self->_settingsFrameworkBundlePath);
  v8 = objc_msgSend(v3, "hash");

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *domainName;
  id v5;

  domainName = self->_domainName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", domainName, CFSTR("domainName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_settingsClassName, CFSTR("settingsClassName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_settingsFrameworkBundlePath, CFSTR("settingsBundlePath"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_domainGroupName, CFSTR("groupName"));

}

- (PTDomainInfo)initWithCoder:(id)a3
{
  id v4;
  PTDomainInfo *v5;
  uint64_t v6;
  NSString *domainName;
  uint64_t v8;
  NSString *settingsClassName;
  uint64_t v10;
  NSString *settingsFrameworkBundlePath;
  uint64_t v12;
  NSString *domainGroupName;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PTDomainInfo;
  v5 = -[PTDomainInfo init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("domainName"));
    v6 = objc_claimAutoreleasedReturnValue();
    domainName = v5->_domainName;
    v5->_domainName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("settingsClassName"));
    v8 = objc_claimAutoreleasedReturnValue();
    settingsClassName = v5->_settingsClassName;
    v5->_settingsClassName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("settingsBundlePath"));
    v10 = objc_claimAutoreleasedReturnValue();
    settingsFrameworkBundlePath = v5->_settingsFrameworkBundlePath;
    v5->_settingsFrameworkBundlePath = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupName"));
    v12 = objc_claimAutoreleasedReturnValue();
    domainGroupName = v5->_domainGroupName;
    v5->_domainGroupName = (NSString *)v12;

  }
  return v5;
}

- (NSString)domainGroupName
{
  return self->_domainGroupName;
}

- (NSString)domainName
{
  return self->_domainName;
}

- (NSString)settingsClassName
{
  return self->_settingsClassName;
}

- (NSString)settingsFrameworkBundlePath
{
  return self->_settingsFrameworkBundlePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsFrameworkBundlePath, 0);
  objc_storeStrong((id *)&self->_settingsClassName, 0);
  objc_storeStrong((id *)&self->_domainName, 0);
  objc_storeStrong((id *)&self->_domainGroupName, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
