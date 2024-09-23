@implementation SUCoreDDMDeclaration

- (int64_t)compare:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  -[SUCoreDDMDeclaration enforcedInstallDate](self, "enforcedInstallDate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_14;
  v6 = (void *)v5;
  objc_msgSend(v4, "enforcedInstallDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7
    || (-[SUCoreDDMDeclaration enforcedInstallDate](self, "enforcedInstallDate"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "enforcedInstallDate"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = (void *)objc_msgSend(v8, "compare:", v9),
        v9,
        v8,
        !v10))
  {
LABEL_14:
    -[SUCoreDDMDeclaration versionString](self, "versionString");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
      goto LABEL_7;
    v12 = (void *)v11;
    objc_msgSend(v4, "versionString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13
      || (-[SUCoreDDMDeclaration versionString](self, "versionString"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v4, "versionString"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = (void *)objc_msgSend(v14, "compare:options:", v15, 64),
          v15,
          v14,
          !v10))
    {
LABEL_7:
      -[SUCoreDDMDeclaration buildVersionString](self, "buildVersionString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(v4, "buildVersionString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          -[SUCoreDDMDeclaration buildVersionString](self, "buildVersionString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "buildVersionString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = (void *)objc_msgSend(v17, "compare:options:", v18, 64);

        }
        else
        {
          v10 = 0;
        }
      }
    }
  }

  return (int64_t)v10;
}

- (SUCoreDDMDeclaration)initWithDeclarationKeys:(id)a3
{
  id v4;
  SUCoreDDMDeclaration *v5;
  uint64_t v6;
  NSString *declarationKey;
  void *v8;
  uint64_t v9;
  NSDate *enforcedInstallDate;
  uint64_t v11;
  NSString *versionString;
  uint64_t v13;
  NSString *buildVersionString;
  uint64_t v15;
  NSString *detailsURL;
  uint64_t v17;
  NSString *companyName;
  uint64_t v19;
  NSDictionary *additionalOptions;
  uint64_t v21;
  SUCoreDevice *device;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SUCoreDDMDeclaration;
  v5 = -[SUCoreDDMDeclaration init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "safeStringForKey:", CFSTR("RMStoreDeclarationKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    declarationKey = v5->_declarationKey;
    v5->_declarationKey = (NSString *)v6;

    objc_msgSend(v4, "safeStringForKey:", CFSTR("TargetLocalDateTime"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDDMDeclaration _dateFromString:](v5, "_dateFromString:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    enforcedInstallDate = v5->_enforcedInstallDate;
    v5->_enforcedInstallDate = (NSDate *)v9;

    objc_msgSend(v4, "safeStringForKey:", CFSTR("TargetOSVersion"));
    v11 = objc_claimAutoreleasedReturnValue();
    versionString = v5->_versionString;
    v5->_versionString = (NSString *)v11;

    objc_msgSend(v4, "safeStringForKey:", CFSTR("TargetBuildVersion"));
    v13 = objc_claimAutoreleasedReturnValue();
    buildVersionString = v5->_buildVersionString;
    v5->_buildVersionString = (NSString *)v13;

    v5->_enableNotifications = 1;
    objc_msgSend(v4, "safeStringForKey:", CFSTR("DetailsURL"));
    v15 = objc_claimAutoreleasedReturnValue();
    detailsURL = v5->_detailsURL;
    v5->_detailsURL = (NSString *)v15;

    objc_msgSend(v4, "safeStringForKey:", CFSTR("CompanyName"));
    v17 = objc_claimAutoreleasedReturnValue();
    companyName = v5->_companyName;
    v5->_companyName = (NSString *)v17;

    objc_msgSend(v4, "safeDictionaryForKey:", CFSTR("AdditionalOptions"));
    v19 = objc_claimAutoreleasedReturnValue();
    additionalOptions = v5->_additionalOptions;
    v5->_additionalOptions = (NSDictionary *)v19;

    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v21 = objc_claimAutoreleasedReturnValue();
    device = v5->_device;
    v5->_device = (SUCoreDevice *)v21;

  }
  return v5;
}

- (SUCoreDDMDeclaration)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  SUCoreDDMDeclaration *v9;
  _QWORD v11[15];

  v11[14] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v11[2] = objc_opt_class();
  v11[3] = objc_opt_class();
  v11[4] = objc_opt_class();
  v11[5] = objc_opt_class();
  v11[6] = objc_opt_class();
  v11[7] = objc_opt_class();
  v11[8] = objc_opt_class();
  v11[9] = objc_opt_class();
  v11[10] = objc_opt_class();
  v11[11] = objc_opt_class();
  v11[12] = objc_opt_class();
  v11[13] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("ddmDeclaration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[SUCoreDDMDeclaration initWithDeclarationKeys:](self, "initWithDeclarationKeys:", v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SUCoreDDMDeclaration dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("ddmDeclaration"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_dateFromString:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB3578];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss"));
  objc_msgSend(v5, "dateFromString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_stringFromDate:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB3578];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss"));
  objc_msgSend(v5, "stringFromDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  const __CFString *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SUCoreDDMDeclaration declarationKey](self, "declarationKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDDMDeclaration enforcedInstallDate](self, "enforcedInstallDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDDMDeclaration _stringFromDate:](self, "_stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDDMDeclaration versionString](self, "versionString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDDMDeclaration buildVersionString](self, "buildVersionString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDDMDeclaration detailsURL](self, "detailsURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDDMDeclaration companyName](self, "companyName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SUCoreDDMDeclaration enableNotifications](self, "enableNotifications");
  v12 = CFSTR("NO");
  if (v11)
    v12 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("SUCoreDDMDeclaration (DeclarationKey:%@|EnforcedInstallDate:%@|VersionString:%@|BuildVersionString:%@|DetailsURL:%@|companyName:%@|NotificationsEnabled:%@)"), v4, v6, v7, v8, v9, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDDMDeclaration declarationKey](self, "declarationKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v4, CFSTR("RMStoreDeclarationKey"));

  -[SUCoreDDMDeclaration enforcedInstallDate](self, "enforcedInstallDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDDMDeclaration _stringFromDate:](self, "_stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v6, CFSTR("TargetLocalDateTime"));

  -[SUCoreDDMDeclaration versionString](self, "versionString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v7, CFSTR("TargetOSVersion"));

  -[SUCoreDDMDeclaration buildVersionString](self, "buildVersionString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v8, CFSTR("TargetBuildVersion"));

  -[SUCoreDDMDeclaration companyName](self, "companyName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v9, CFSTR("CompanyName"));

  -[SUCoreDDMDeclaration additionalOptions](self, "additionalOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v10, CFSTR("AdditionalOptions"));

  -[SUCoreDDMDeclaration detailsURL](self, "detailsURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v11, CFSTR("DetailsURL"));

  v12 = (void *)objc_msgSend(v3, "copy");
  return v12;
}

- (BOOL)isValidDeclaration
{
  return -[SUCoreDDMDeclaration isValidDeclarationWithReason:](self, "isValidDeclarationWithReason:", 0);
}

- (BOOL)isInstallOverdue
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SUCoreDDMDeclaration enforcedInstallDate](self, "enforcedInstallDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "compare:", v3) == -1;

  return v4;
}

- (BOOL)isValidDeclarationWithReason:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  SUCoreDDMDeclaration *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  SUCoreDDMDeclaration *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[SUCoreDDMDeclaration declarationKey](self, "declarationKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid declaration: invalid declaration key"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    goto LABEL_8;
  }
  -[SUCoreDDMDeclaration enforcedInstallDate](self, "enforcedInstallDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid declaration: invalid enforced install date"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    goto LABEL_8;
  }
  -[SUCoreDDMDeclaration versionString](self, "versionString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

LABEL_13:
    -[SUCoreDDMDeclaration device](self, "device");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Internal error: failed to get a core device"));
      v14 = (id)objc_claimAutoreleasedReturnValue();
      +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "oslog");
      v22 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[SUCoreDDMDeclaration isValidDeclarationWithReason:].cold.1();

      if (a3)
      {
        v14 = objc_retainAutorelease(v14);
        v12 = 0;
        *a3 = v14;
      }
      else
      {
        v12 = 0;
      }
      goto LABEL_43;
    }
    -[SUCoreDDMDeclaration versionString](self, "versionString");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "productVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDDMDeclaration buildVersionString](self, "buildVersionString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDDMDeclaration versionString](self, "versionString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      goto LABEL_23;
    if ((objc_msgSend(v8, "isCorrectlyFormattedProductVersion:", v14) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid declaration: target OS version (%@) has an invalid format"), v14);
      v18 = objc_claimAutoreleasedReturnValue();
      +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "oslog");
      v20 = objc_claimAutoreleasedReturnValue();

      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        goto LABEL_39;
      goto LABEL_38;
    }
    if (objc_msgSend(v15, "compare:options:", v14, 64) == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid declaration: target OS version (%@) is older than current version (%@)"), v14, v15);
      v18 = objc_claimAutoreleasedReturnValue();
      +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "oslog");
      v20 = objc_claimAutoreleasedReturnValue();

      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        goto LABEL_39;
    }
    else
    {
LABEL_23:
      -[SUCoreDDMDeclaration buildVersionString](self, "buildVersionString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23 || (objc_msgSend(v8, "isCorrectlyFormattedBuildVersion:", v16) & 1) != 0)
      {
        if (-[SUCoreDDMDeclaration isInstallOverdue](self, "isInstallOverdue"))
        {
          +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "oslog");
          v25 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            -[SUCoreDDMDeclaration enforcedInstallDate](self, "enforcedInstallDate");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[SUCoreDDMDeclaration _stringFromDate:](self, "_stringFromDate:", v26);
            v27 = (SUCoreDDMDeclaration *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v34 = "-[SUCoreDDMDeclaration isValidDeclarationWithReason:]";
            v35 = 2112;
            v36 = v27;
            _os_log_impl(&dword_1DDFDD000, v25, OS_LOG_TYPE_DEFAULT, "%s: Past-due declaration: enforced install date is in the past (%@)", buf, 0x16u);

          }
        }
        +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "oslog");
        v18 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v34 = "-[SUCoreDDMDeclaration isValidDeclarationWithReason:]";
          v35 = 2112;
          v36 = self;
          _os_log_impl(&dword_1DDFDD000, v18, OS_LOG_TYPE_DEFAULT, "%s: %@ is (likely) good to go!", buf, 0x16u);
        }
        v12 = 1;
        goto LABEL_42;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid declaration: target build version (%@) has an invalid format"), v16);
      v18 = objc_claimAutoreleasedReturnValue();
      +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "oslog");
      v20 = objc_claimAutoreleasedReturnValue();

      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
LABEL_39:

        if (a3)
        {
          v18 = objc_retainAutorelease(v18);
          v12 = 0;
          *a3 = v18;
        }
        else
        {
          v12 = 0;
        }
LABEL_42:

LABEL_43:
        goto LABEL_44;
      }
    }
LABEL_38:
    -[SUCoreDDMDeclaration isValidDeclarationWithReason:].cold.1();
    goto LABEL_39;
  }
  -[SUCoreDDMDeclaration buildVersionString](self, "buildVersionString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    goto LABEL_13;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid declaration: no target version set"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "oslog");
  v10 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
LABEL_8:
    -[SUCoreDDMDeclaration isValidDeclarationWithReason:].cold.1();
LABEL_9:

  if (a3)
  {
    v8 = objc_retainAutorelease(v8);
    v12 = 0;
    *a3 = v8;
  }
  else
  {
    v12 = 0;
  }
LABEL_44:

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  SUCoreDDMDeclaration *v4;
  SUCoreDDMDeclaration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v4 = (SUCoreDDMDeclaration *)a3;
  if (v4 == self)
  {
    v21 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = (void *)MEMORY[0x1E0DA8920];
      -[SUCoreDDMDeclaration enforcedInstallDate](self, "enforcedInstallDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDDMDeclaration enforcedInstallDate](v5, "enforcedInstallDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "dateIsEqual:to:", v7, v8))
      {
        v9 = (void *)MEMORY[0x1E0DA8920];
        -[SUCoreDDMDeclaration versionString](self, "versionString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCoreDDMDeclaration versionString](v5, "versionString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "stringIsEqual:to:", v10, v11))
        {
          v12 = (void *)MEMORY[0x1E0DA8920];
          -[SUCoreDDMDeclaration buildVersionString](self, "buildVersionString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUCoreDDMDeclaration buildVersionString](v5, "buildVersionString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "stringIsEqual:to:", v13))
          {
            v25 = v13;
            v14 = (void *)MEMORY[0x1E0DA8920];
            -[SUCoreDDMDeclaration detailsURL](self, "detailsURL");
            v15 = objc_claimAutoreleasedReturnValue();
            -[SUCoreDDMDeclaration detailsURL](v5, "detailsURL");
            v16 = objc_claimAutoreleasedReturnValue();
            v24 = (void *)v15;
            v17 = v15;
            v18 = (void *)v16;
            if (objc_msgSend(v14, "stringIsEqual:to:", v17, v16))
            {
              v23 = (void *)MEMORY[0x1E0DA8920];
              -[SUCoreDDMDeclaration companyName](self, "companyName");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[SUCoreDDMDeclaration companyName](v5, "companyName");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v23, "stringIsEqual:to:", v19, v20);

            }
            else
            {
              v21 = 0;
            }

            v13 = v25;
          }
          else
          {
            v21 = 0;
          }

        }
        else
        {
          v21 = 0;
        }

      }
      else
      {
        v21 = 0;
      }

    }
    else
    {
      v21 = 0;
    }
  }

  return v21;
}

- (NSString)declarationKey
{
  return self->_declarationKey;
}

- (void)setDeclarationKey:(id)a3
{
  objc_storeStrong((id *)&self->_declarationKey, a3);
}

- (NSDate)enforcedInstallDate
{
  return self->_enforcedInstallDate;
}

- (void)setEnforcedInstallDate:(id)a3
{
  objc_storeStrong((id *)&self->_enforcedInstallDate, a3);
}

- (NSString)versionString
{
  return self->_versionString;
}

- (void)setVersionString:(id)a3
{
  objc_storeStrong((id *)&self->_versionString, a3);
}

- (NSString)buildVersionString
{
  return self->_buildVersionString;
}

- (void)setBuildVersionString:(id)a3
{
  objc_storeStrong((id *)&self->_buildVersionString, a3);
}

- (NSString)detailsURL
{
  return self->_detailsURL;
}

- (void)setDetailsURL:(id)a3
{
  objc_storeStrong((id *)&self->_detailsURL, a3);
}

- (NSString)companyName
{
  return self->_companyName;
}

- (void)setCompanyName:(id)a3
{
  objc_storeStrong((id *)&self->_companyName, a3);
}

- (NSDictionary)additionalOptions
{
  return self->_additionalOptions;
}

- (void)setAdditionalOptions:(id)a3
{
  objc_storeStrong((id *)&self->_additionalOptions, a3);
}

- (BOOL)enableNotifications
{
  return self->_enableNotifications;
}

- (void)setEnableNotifications:(BOOL)a3
{
  self->_enableNotifications = a3;
}

- (SUCoreDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_additionalOptions, 0);
  objc_storeStrong((id *)&self->_companyName, 0);
  objc_storeStrong((id *)&self->_detailsURL, 0);
  objc_storeStrong((id *)&self->_buildVersionString, 0);
  objc_storeStrong((id *)&self->_versionString, 0);
  objc_storeStrong((id *)&self->_enforcedInstallDate, 0);
  objc_storeStrong((id *)&self->_declarationKey, 0);
}

- (void)isValidDeclarationWithReason:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_4(&dword_1DDFDD000, v0, v1, "%s: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

@end
