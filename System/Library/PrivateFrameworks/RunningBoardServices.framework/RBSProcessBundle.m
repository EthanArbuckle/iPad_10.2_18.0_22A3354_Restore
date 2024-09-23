@implementation RBSProcessBundle

- (NSString)identifier
{
  return self->_identifier;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)setInstance:(id)a3
{
  objc_storeStrong((id *)&self->_instance, a3);
}

- (RBSProcessBundle)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSProcessBundle *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *path;
  uint64_t v10;
  NSString *executablePath;
  uint64_t v12;
  NSString *extensionPointIdentifier;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RBSProcessBundle;
  v5 = -[RBSProcessBundle init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeStringForKey:", CFSTR("_identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeStringForKey:", CFSTR("_path"));
    v8 = objc_claimAutoreleasedReturnValue();
    path = v5->_path;
    v5->_path = (NSString *)v8;

    objc_msgSend(v4, "decodeStringForKey:", CFSTR("_executablePath"));
    v10 = objc_claimAutoreleasedReturnValue();
    executablePath = v5->_executablePath;
    v5->_executablePath = (NSString *)v10;

    objc_msgSend(v4, "decodeStringForKey:", CFSTR("_extensionPointIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    extensionPointIdentifier = v5->_extensionPointIdentifier;
    v5->_extensionPointIdentifier = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4;
  NSString *identifier;
  NSString *path;
  NSString *executablePath;
  NSString *extensionPointIdentifier;
  id v9;

  v4 = a3;
  identifier = self->_identifier;
  v9 = v4;
  if (identifier)
  {
    objc_msgSend(v4, "encodeObject:forKey:", identifier, CFSTR("_identifier"));
    v4 = v9;
  }
  path = self->_path;
  if (path)
  {
    objc_msgSend(v9, "encodeObject:forKey:", path, CFSTR("_path"));
    v4 = v9;
  }
  executablePath = self->_executablePath;
  if (executablePath)
  {
    objc_msgSend(v9, "encodeObject:forKey:", executablePath, CFSTR("_executablePath"));
    v4 = v9;
  }
  extensionPointIdentifier = self->_extensionPointIdentifier;
  if (extensionPointIdentifier)
  {
    objc_msgSend(v9, "encodeObject:forKey:", extensionPointIdentifier, CFSTR("_extensionPointIdentifier"));
    v4 = v9;
  }

}

- (id)bundleInfoValueForKey:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  NSClassFromString(CFSTR("NSString"));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSProcessBundle.m"), 43, CFSTR("Invalid condition not satisfying: %@"), CFSTR("object != nil"));

  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSProcessBundle.m"), 43, CFSTR("Invalid condition not satisfying: %@"), CFSTR("[object isKindOfClass:NSStringClass]"));

  }
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSProcessBundle bundleInfoValuesForKeys:](self, "bundleInfoValuesForKeys:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)bundleInfoValuesForKeys:(id)a3
{
  id WeakRetained;
  id v5;
  RBSProcessBundle *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSDictionary *plistValues;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  void *v28;
  BOOL v29;
  NSObject *v30;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  RBSProcessBundle *v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  if (objc_msgSend(v35, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v34 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "bundleInfoValuesForKeys:", v35);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else if (self->_instance)
    {
      v6 = self;
      objc_sync_enter(v6);
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v35);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(v32, "mutableCopy");
      v7 = (void *)MEMORY[0x1E0C99E60];
      -[NSDictionary allKeys](v6->_plistValues, "allKeys");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setWithArray:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "minusSet:", v9);

      if (objc_msgSend(v33, "count"))
      {
        +[RBSConnection sharedInstance](RBSConnection, "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "infoPlistResultForInstance:forKeys:error:", self->_instance, v35, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v6->_plistValues);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v13 = v33;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
        if (v14)
        {
          v15 = *(_QWORD *)v41;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v41 != v15)
                objc_enumerationMutation(v13);
              v17 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
              objc_msgSend(v11, "objectForKey:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (v18)
              {
                objc_msgSend(v12, "setObject:forKey:", v18, v17);
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "setObject:forKey:", v19, v17);

              }
            }
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
          }
          while (v14);
        }

        v20 = objc_msgSend(v12, "copy");
        plistValues = v6->_plistValues;
        v6->_plistValues = (NSDictionary *)v20;

      }
      v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v22 = v32;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
      if (v23)
      {
        v24 = *(_QWORD *)v37;
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v37 != v24)
              objc_enumerationMutation(v22);
            v26 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j);
            -[NSDictionary objectForKey:](v6->_plistValues, "objectForKey:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (v27)
            {
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = v27 == v28;

              if (!v29)
                objc_msgSend(v5, "setObject:forKey:", v27, v26);
            }

          }
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
        }
        while (v23);
      }

      objc_sync_exit(v6);
    }
    else
    {
      rbs_process_log();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v45 = self;
        _os_log_impl(&dword_190CD6000, v30, OS_LOG_TYPE_DEFAULT, "Cannot fetch info.plist values: no data source found for bundle: %{public}@", buf, 0xCu);
      }

      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)bundleWithDataSource:(id)a3
{
  id v3;
  RBSProcessBundle *v4;
  uint64_t v5;
  NSString *identifier;
  uint64_t v7;
  NSString *path;
  uint64_t v9;
  NSString *executablePath;
  uint64_t v11;
  NSString *extensionPointIdentifier;

  v3 = a3;
  v4 = objc_alloc_init(RBSProcessBundle);
  objc_storeWeak((id *)&v4->_dataSource, v3);
  objc_msgSend(v3, "bundleIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v5;

  objc_msgSend(v3, "bundlePath");
  v7 = objc_claimAutoreleasedReturnValue();
  path = v4->_path;
  v4->_path = (NSString *)v7;

  objc_msgSend(v3, "executablePath");
  v9 = objc_claimAutoreleasedReturnValue();
  executablePath = v4->_executablePath;
  v4->_executablePath = (NSString *)v9;

  objc_msgSend(v3, "extensionPointIdentifier");
  v11 = objc_claimAutoreleasedReturnValue();

  extensionPointIdentifier = v4->_extensionPointIdentifier;
  v4->_extensionPointIdentifier = (NSString *)v11;

  return v4;
}

- (NSString)extensionPointIdentifier
{
  return self->_extensionPointIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instance, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_extensionPointIdentifier, 0);
  objc_storeStrong((id *)&self->_executablePath, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_plistValues, 0);
}

- (NSString)executablePath
{
  return self->_executablePath;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| id:\"%@\" path:\"%@\">"), v4, self->_identifier, self->_path);

  return (NSString *)v5;
}

- (NSString)debugDescription
{
  id v3;
  void *v4;
  NSString *executablePath;
  NSString *extensionPointIdentifier;
  void *v7;
  void *v8;
  __int128 v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_OWORD *)&self->_identifier;
  executablePath = self->_executablePath;
  extensionPointIdentifier = self->_extensionPointIdentifier;
  -[NSDictionary entriesToStringWithIndent:debug:](self->_plistValues, "entriesToStringWithIndent:debug:", 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| id:\"%@\" path:\"%@\" executablePath:\"%@\" extensionPoint:\"%@\" Info.plist values:\n%@\n    >"), v4, v10, executablePath, extensionPointIdentifier, v7);

  return (NSString *)v8;
}

- (NSString)path
{
  return self->_path;
}

- (RBSProcessInstance)instance
{
  return self->_instance;
}

@end
