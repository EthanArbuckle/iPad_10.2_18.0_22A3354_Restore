@implementation SBSystemApertureStateDumpService

- (SBSystemApertureStateDumpService)init
{
  SBSystemApertureStateDumpService *v2;
  uint64_t v3;
  FBServiceClientAuthenticator *clientAuthenticator;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBSystemApertureStateDumpService;
  v2 = -[SBSystemApertureStateDumpService init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.systemApertureStateDump"));
    clientAuthenticator = v2->_clientAuthenticator;
    v2->_clientAuthenticator = (FBServiceClientAuthenticator *)v3;

    +[SBSystemServiceServer sharedInstance](SBSystemServiceServer, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSystemApertureStateDumpDelegate:", v2);

  }
  return v2;
}

- (void)systemServiceServer:(id)a3 client:(id)a4 requestToWriteSystemApertureStateDumpToFile:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  objc_msgSend((id)SBApp, "systemApertureControllerForMainDisplay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "systemApertureModelStateDump");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    v17 = 0;
    -[SBSystemApertureStateDumpService _convertSystemApertureStateDumpToJSONString:error:](self, "_convertSystemApertureStateDumpToJSONString:error:", v8, &v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v17;
    if (v6)
    {
      v11 = v6;
    }
    else
    {
      -[SBSystemApertureStateDumpService _systemApertureStateDumpFilePath](self, "_systemApertureStateDumpFilePath");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v11;
    v16 = v10;
    objc_msgSend(v9, "writeToFile:atomically:encoding:error:", v11, 1, 4, &v16);
    v12 = v16;

    if (v12)
    {
      SBLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject localizedDescription](v12, "localizedDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v19 = v15;
        _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "SystemApertureStateDump failed to write to file with error: %{public}@", buf, 0xCu);

      }
    }

  }
  else
  {
    SBLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "SystemApertureStateDump is empty", buf, 2u);
    }
  }

}

- (void)systemServiceServer:(id)a3 client:(id)a4 requestSystemApertureStateDumpWithCompletion:(id)a5
{
  void (**v6)(id, void *, void *);
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint8_t buf[16];

  v6 = (void (**)(id, void *, void *))a5;
  objc_msgSend((id)SBApp, "systemApertureControllerForMainDisplay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "systemApertureModelStateDump");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    v12 = 0;
    -[SBSystemApertureStateDumpService _convertSystemApertureStateDumpToJSONString:error:](self, "_convertSystemApertureStateDumpToJSONString:error:", v8, &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v12;
    -[NSObject localizedDescription](v10, "localizedDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v9, v11);

  }
  else
  {
    SBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "SystemApertureStateDump is empty", buf, 2u);
    }
  }

}

- (id)_convertSystemApertureStateDumpToJSONString:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v10[16];

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v5, 1, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 4);

  }
  else
  {
    SBLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "SystemAperture State Dump is empty.", v10, 2u);
    }

    v7 = 0;
  }

  return v7;
}

- (id)_systemApertureStateDumpFilePath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Logs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("SpringBoard"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, 0);

  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("SystemApertureStateDump.json"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientAuthenticator, 0);
}

@end
