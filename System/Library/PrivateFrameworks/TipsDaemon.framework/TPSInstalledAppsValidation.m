@implementation TPSInstalledAppsValidation

- (TPSInstalledAppsValidation)initWithInstalledAppInfo:(id)a3
{
  id v5;
  TPSInstalledAppsValidation *v6;
  TPSInstalledAppsValidation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSInstalledAppsValidation;
  v6 = -[TPSInstalledAppsValidation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_appInfo, a3);

  return v7;
}

- (void)validateWithCompletion:(id)a3
{
  void (**v4)(id, _BOOL8, _QWORD);
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _BOOL8 v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _BOOL8, _QWORD))a3;
  -[TPSInstalledAppsValidation appInfo](self, "appInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0CA5870]);
    -[TPSInstalledAppsValidation appInfo](self, "appInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "initWithBundleIdentifier:allowPlaceholder:error:", v10, 1, 0);

    if (objc_msgSend(MEMORY[0x1E0DBF348], "isRecordValid:", v11))
    {
      -[NSObject shortVersionString](v11, "shortVersionString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPSInstalledAppsValidation appInfo](self, "appInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "minVersion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPSInstalledAppsValidation appInfo](self, "appInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "maxVersion");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v12;
      v18 = v14;
      v19 = v16;
      if (!objc_msgSend(v17, "length")
        || objc_msgSend(v18, "length") && objc_msgSend(v17, "compare:options:", v18, 64) == -1)
      {
        v20 = 0;
      }
      else if (objc_msgSend(v19, "length"))
      {
        v20 = objc_msgSend(v17, "compare:options:", v19, 64) != 1;
      }
      else
      {
        v20 = 1;
      }

    }
    else
    {
      v20 = 0;
    }
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      -[TPSInstalledAppsValidation validateWithCompletion:].cold.1(self, v20, v25);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v11 = objc_claimAutoreleasedReturnValue();
    v20 = 1;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v21 = (void *)objc_opt_class();
      v22 = v21;
      -[TPSInstalledAppsValidation appInfo](self, "appInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "debugDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412802;
      v27 = v21;
      v28 = 2112;
      v29 = v24;
      v30 = 1024;
      v31 = 1;
      _os_log_impl(&dword_1DAC2F000, v11, OS_LOG_TYPE_INFO, "%@ - no bundleID specified in appInfo: %@, Valid: %d", (uint8_t *)&v26, 0x1Cu);

    }
  }

  v4[2](v4, v20, 0);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSInstalledAppsValidation appInfo](self, "appInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; appInfo = %@>"), v5, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (TPSInstalledAppInfo)appInfo
{
  return self->_appInfo;
}

- (void)setAppInfo:(id)a3
{
  objc_storeStrong((id *)&self->_appInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appInfo, 0);
}

- (void)validateWithCompletion:(NSObject *)a3 .cold.1(void *a1, char a2, NSObject *a3)
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_opt_class();
  v7 = v6;
  objc_msgSend(a1, "appInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "debugDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138412802;
  v11 = v6;
  v12 = 2112;
  v13 = v9;
  v14 = 1024;
  v15 = a2 & 1;
  _os_log_debug_impl(&dword_1DAC2F000, a3, OS_LOG_TYPE_DEBUG, "%@ - checking installed app: %@, Valid: %d", (uint8_t *)&v10, 0x1Cu);

}

@end
