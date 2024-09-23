@implementation PKManager

- (id)containingAppForPlugInWithPid:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = *(_QWORD *)&a3;
  -[PKManager external](self, "external");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "launch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy_extension_properties_for_pid:", v3);

  -[PKManager containingAppForExtensionProperties:](self, "containingAppForExtensionProperties:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (PKExternalProviders)external
{
  return (PKExternalProviders *)objc_getProperty(self, a2, 16, 1);
}

- (id)containingAppForExtensionProperties:(id)a3
{
  id v4;
  void *v5;
  const char *string;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_7;
  string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E0C83AE8]);
  if (!string)
    goto LABEL_7;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", string, 1, 0);
  -[PKManager external](self, "external");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ls");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "plugInKitProxyForURL:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "containingBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (!v12)
LABEL_7:
    v8 = 0;

  return v8;
}

+ (id)defaultManager
{
  if (qword_1ECDD6FD0 != -1)
    dispatch_once(&qword_1ECDD6FD0, &unk_1E5F405B8);
  return (id)qword_1ECDD6FC8;
}

+ (id)managerForUser:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)&a3;
  if (qword_1EEE37630 != -1)
    dispatch_once(&qword_1EEE37630, &unk_1E5F412E0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&dword_1EEE37640);
  objc_msgSend((id)qword_1EEE37638, "objectForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[PKManager initForUser:]([PKManager alloc], "initForUser:", v3);
    objc_msgSend((id)qword_1EEE37638, "setObject:forKey:", v5, v4);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_1EEE37640);

  return v5;
}

- (id)initForService:(const char *)a3
{
  PKDaemonClient *v4;
  PKManager *v5;

  v4 = -[PKDaemonClient initWithServiceName:]([PKDaemonClient alloc], "initWithServiceName:", a3);
  v5 = -[PKManager initWithDaemon:](self, "initWithDaemon:", v4);

  return v5;
}

- (id)initForUser:(unsigned int)a3
{
  PKDaemonClient *v4;
  PKManager *v5;

  v4 = -[PKDaemonClient initWithServiceName:user:]([PKDaemonClient alloc], "initWithServiceName:user:", 0, *(_QWORD *)&a3);
  v5 = -[PKManager initWithDaemon:](self, "initWithDaemon:", v4);

  return v5;
}

- (PKManager)initWithDaemon:(id)a3
{
  id v4;
  void *v5;
  PKManager *v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = -[PKManager initWithDaemon:externalProviders:](self, "initWithDaemon:externalProviders:", v4, v5);

  return v6;
}

- (PKManager)initWithDaemon:(id)a3 externalProviders:(id)a4
{
  id v6;
  id v7;
  PKManager *v8;
  PKManager *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKManager;
  v8 = -[PKManager init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[PKManager setClient:](v8, "setClient:", v6);
    objc_storeStrong((id *)&v9->_external, a4);
  }

  return v9;
}

- (PKManager)initWithExternalProviders:(id)a3
{
  id v4;
  PKDaemonClient *v5;
  PKManager *v6;

  v4 = a3;
  v5 = -[PKDaemonClient initWithServiceName:]([PKDaemonClient alloc], "initWithServiceName:", 0);
  v6 = -[PKManager initWithDaemon:externalProviders:](self, "initWithDaemon:externalProviders:", v5, v4);

  return v6;
}

- (void)registerPlugInAtURL:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id from;
  id location;
  uint8_t buf[4];
  PKManager *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PKManager client](self, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v8);

  objc_initWeak(&from, self);
  pklog_handle_for_category(12);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v25 = self;
    v26 = 2112;
    v27 = v10;
    _os_log_impl(&dword_1AF254000, v9, OS_LOG_TYPE_DEFAULT, "<PKManager:%p> register plugin at [%@]", buf, 0x16u);

  }
  -[PKManager client](self, "client");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(v6, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arrayWithObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1AF2713D0;
  v17[3] = &unk_1E5F41308;
  objc_copyWeak(&v20, &location);
  objc_copyWeak(&v21, &from);
  v15 = v6;
  v18 = v15;
  v16 = v7;
  v19 = v16;
  objc_msgSend(v11, "addPlugIns:reply:", v14, v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

- (void)unregisterPlugInAtURL:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id from;
  id location;
  uint8_t buf[4];
  PKManager *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PKManager client](self, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v8);

  objc_initWeak(&from, self);
  pklog_handle_for_category(12);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v25 = self;
    v26 = 2112;
    v27 = v10;
    _os_log_impl(&dword_1AF254000, v9, OS_LOG_TYPE_DEFAULT, "<PKManager:%p> unregister plugin at [%@]", buf, 0x16u);

  }
  -[PKManager client](self, "client");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(v6, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arrayWithObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1AF271750;
  v17[3] = &unk_1E5F41308;
  objc_copyWeak(&v20, &location);
  objc_copyWeak(&v21, &from);
  v15 = v6;
  v18 = v15;
  v16 = v7;
  v19 = v16;
  objc_msgSend(v11, "removePlugIns:reply:", v14, v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

- (void)registerPlugInsInBundle:(id)a3 result:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id location;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  uint8_t v41[128];
  uint8_t buf[4];
  PKManager *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v28 = a4;
  if (v6)
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v6);
  else
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  pklog_handle_for_category(12);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundlePath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v43 = self;
    v44 = 2112;
    v45 = v9;
    v46 = 2112;
    v47 = v10;
    _os_log_impl(&dword_1AF254000, v8, OS_LOG_TYPE_DEFAULT, "<PKManager:%p> register plugins in bundle at [%@] resolved to [%@]", buf, 0x20u);

  }
  objc_msgSend(v7, "builtInPlugInsURL");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKManager external](self, "external");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "filesystem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  objc_msgSend(v12, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v29, 0, 4, &v40);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v40;

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v37;
      do
      {
        v18 = 0;
        if (v16 <= 1)
          v19 = 1;
        else
          v19 = v16;
        do
        {
          if (*(_QWORD *)v37 != v17)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v18), "path", v27);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

          ++v18;
        }
        while (v19 != v18);
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v16);
    }

    if (objc_msgSend(v14, "count"))
    {
      -[PKManager client](self, "client");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)buf, v21);

      objc_initWeak(&location, self);
      -[PKManager client](self, "client");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = sub_1AF271D58;
      v30[3] = &unk_1E5F41308;
      objc_copyWeak(&v33, (id *)buf);
      objc_copyWeak(&v34, &location);
      v31 = v7;
      v32 = v28;
      objc_msgSend(v22, "addPlugIns:reply:", v14, v30);

      objc_destroyWeak(&v34);
      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      pklog_handle_for_category(12);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "bundlePath");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v43 = self;
        v44 = 2112;
        v45 = v25;
        _os_log_impl(&dword_1AF254000, v24, OS_LOG_TYPE_DEFAULT, "<PKManager:%p> register plugins in bundle at [%@] completed, there were no plugins in that bundle", buf, 0x16u);

      }
      (*((void (**)(id, _QWORD))v28 + 2))(v28, 0);
    }

  }
  else
  {
    pklog_handle_for_category(12);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "bundlePath");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v43 = self;
      v44 = 2112;
      v45 = v26;
      v46 = 2112;
      v47 = v27;
      _os_log_error_impl(&dword_1AF254000, v23, OS_LOG_TYPE_ERROR, "<PKManager:%p> register plugins in bundle at [%@] failed to fetch candidates: %@", buf, 0x20u);

    }
    (*((void (**)(id, id))v28 + 2))(v28, v27);
  }

}

- (void)unregisterPlugInsInBundle:(id)a3 result:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id location;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  PKManager *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v26 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleURL");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  pklog_handle_for_category(12);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v39 = self;
    v40 = 2112;
    v41 = v9;
    _os_log_impl(&dword_1AF254000, v8, OS_LOG_TYPE_DEFAULT, "<PKManager:%p> unregister plugins in bundle at [%@]", buf, 0x16u);

  }
  -[PKManager external](self, "external");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ls");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "applicationProxyForBundleURL:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "plugInKitPlugins");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v34;
    do
    {
      v18 = 0;
      if (v16 <= 1)
        v19 = 1;
      else
        v19 = v16;
      do
      {
        if (*(_QWORD *)v34 != v17)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v18), "bundleURL", v26);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "path");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v21);

        ++v18;
      }
      while (v19 != v18);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v16);
  }

  if (objc_msgSend(v14, "count"))
  {
    -[PKManager client](self, "client");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, v22);

    objc_initWeak(&location, self);
    -[PKManager client](self, "client");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_1AF272288;
    v27[3] = &unk_1E5F41308;
    objc_copyWeak(&v30, (id *)buf);
    objc_copyWeak(&v31, &location);
    v28 = v6;
    v29 = v26;
    objc_msgSend(v23, "removePlugIns:reply:", v14, v27);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    pklog_handle_for_category(12);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "path");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v39 = self;
      v40 = 2112;
      v41 = v25;
      _os_log_impl(&dword_1AF254000, v24, OS_LOG_TYPE_DEFAULT, "<PKManager:%p> unregister plugins in bundle at [%@] completed, there were plugins in that bundle registered with LaunchServices", buf, 0x16u);

    }
    (*((void (**)(id, _QWORD))v26 + 2))(v26, 0);
  }

}

- (id)informationForPlugInWithPid:(int)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const char *string;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int int64;
  id v24;
  void *v25;
  void *v26;
  __CFBundle *v27;
  __CFBundle *v28;
  void *v29;
  void *v30;
  _BYTE buffer[4096];
  uint64_t v33;

  v3 = (void *)MEMORY[0x1E0C80A78](self, a2, *(_QWORD *)&a3);
  v5 = v4;
  v6 = v3;
  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v3, "external");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "launch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy_extension_properties_for_pid:", v5);

  if (v9 && (string = xpc_dictionary_get_string(v9, (const char *)*MEMORY[0x1E0C83AE8])) != 0)
  {
    v11 = string;
    v12 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v11, 1, 0);
    objc_msgSend(v6, "external");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "ls");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "plugInKitProxyForURL:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "containingBundle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      objc_msgSend(v18, "bundleURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "path");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v21, CFSTR("ContainingPath"));

      objc_msgSend(v19, "bundleIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v22, CFSTR("ContainingIdentifier"));

    }
    int64 = xpc_dictionary_get_int64(v9, (const char *)*MEMORY[0x1E0C83AE0]);
    if (int64 && proc_pidpath(int64, buffer, 0x1000u) >= 1)
    {
      v24 = objc_alloc(MEMORY[0x1E0C99E98]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", buffer);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v24, "initFileURLWithPath:", v25);

      if (v26 && (v27 = (__CFBundle *)_CFBundleCreateWithExecutableURLIfLooksLikeBundle(), (v28 = v27) != 0))
      {
        v29 = CFBundleCopyBundleURL(v27);
        objc_msgSend(v29, "path");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v30, CFSTR("HostPath"));

        objc_msgSend(v13, "setObject:forKeyedSubscript:", CFBundleGetIdentifier(v28), CFSTR("XPCExtensionHostBundleIdentifier"));
        CFRelease(v28);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", buffer);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v29, CFSTR("HostPath"));
      }

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)containingAppForPlugInConnectedTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PKManager external](self, "external");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "launch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy_extension_properties:", v4);

  -[PKManager containingAppForExtensionProperties:](self, "containingAppForExtensionProperties:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)holdPlugInsInApplication:(id)a3 result:(id)a4
{
  -[PKManager holdRequest:flags:result:](self, "holdRequest:flags:result:", a3, 2, a4);
}

- (void)holdPlugInsWithExtensionPointName:(id)a3 platforms:(id)a4 terminate:(BOOL)a5 result:(id)a6
{
  uint64_t v7;

  if (a5)
    v7 = 36;
  else
    v7 = 32;
  -[PKManager holdRequest:extensionPointName:platforms:flags:result:](self, "holdRequest:extensionPointName:platforms:flags:result:", 0, a3, a4, v7, a6);
}

- (void)holdPlugInsWithExtensionPointName:(id)a3 result:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel_holdPlugInsWithExtensionPointName_platforms_terminate_result_);
}

- (void)forceHoldPlugIn:(id)a3 result:(id)a4
{
  -[PKManager holdRequest:flags:result:](self, "holdRequest:flags:result:", a3, 1, a4);
}

- (void)terminatePlugInsInApplication:(id)a3 options:(int64_t)a4 result:(id)a5
{
  void (**v8)(id, _QWORD, void *);
  void *v9;
  id v10;

  v10 = a3;
  v8 = (void (**)(id, _QWORD, void *))a5;
  if (a4)
  {
    pkError(18, CFSTR("unrecognized option to terminatePlugInsInApplication"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v9);

  }
  -[PKManager holdRequest:flags:result:](self, "holdRequest:flags:result:", v10, 4, v8);

}

- (id)holdPlugInsInApplication:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1AF272938;
  v21 = sub_1AF272948;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_1AF272938;
  v15 = sub_1AF272948;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1AF272950;
  v10[3] = &unk_1E5F41330;
  v10[4] = &v17;
  v10[5] = &v11;
  -[PKManager holdRequest:flags:result:](self, "holdRequest:flags:result:", v6, 10, v10);
  if (!v18[5])
  {
    if (a4)
    {
      v7 = (void *)v12[5];
      if (v7)
        *a4 = objc_retainAutorelease(v7);
    }
  }
  v8 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (id)holdPlugInsWithExtensionPointName:(id)a3 platforms:(id)a4 terminate:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_1AF272938;
  v27 = sub_1AF272948;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1AF272938;
  v21 = sub_1AF272948;
  v22 = 0;
  if (v7)
    v12 = 44;
  else
    v12 = 40;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1AF272B28;
  v16[3] = &unk_1E5F41330;
  v16[4] = &v23;
  v16[5] = &v17;
  -[PKManager holdRequest:extensionPointName:platforms:flags:result:](self, "holdRequest:extensionPointName:platforms:flags:result:", 0, v10, v11, v12, v16);
  if (!v24[5])
  {
    if (a6)
    {
      v13 = (void *)v18[5];
      if (v13)
        *a6 = objc_retainAutorelease(v13);
    }
  }
  v14 = (id)v24[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v14;
}

- (id)holdPlugInsWithExtensionPointName:(id)a3 error:(id *)a4
{
  -[PKManager holdPlugInsWithExtensionPointName:platforms:terminate:error:](self, "holdPlugInsWithExtensionPointName:platforms:terminate:error:", a3, MEMORY[0x1E0C9AA60], 1, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)forceHoldPlugIn:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1AF272938;
  v21 = sub_1AF272948;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_1AF272938;
  v15 = sub_1AF272948;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1AF272CF8;
  v10[3] = &unk_1E5F41330;
  v10[4] = &v17;
  v10[5] = &v11;
  -[PKManager holdRequest:flags:result:](self, "holdRequest:flags:result:", v6, 9, v10);
  if (!v18[5])
  {
    if (a4)
    {
      v7 = (void *)v12[5];
      if (v7)
        *a4 = objc_retainAutorelease(v7);
    }
  }
  v8 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (BOOL)terminatePlugInAtURL:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id *v9;
  BOOL v10;
  BOOL v11;
  id obj;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_1AF272938;
  v25 = sub_1AF272948;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_1AF272938;
  v19 = sub_1AF272948;
  v20 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1AF272EF8;
  v14[3] = &unk_1E5F41330;
  v14[4] = &v21;
  v14[5] = &v15;
  -[PKManager holdRequest:flags:result:](self, "holdRequest:flags:result:", v6, 29, v14);
  v7 = (void *)v16[5];
  if (v22[5])
  {
    v16[5] = 0;

    v8 = v22[5];
    v9 = (id *)(v16 + 5);
    obj = (id)v16[5];
    v10 = -[PKManager releaseHold:flags:withError:](self, "releaseHold:flags:withError:", v8, 24, &obj);
    objc_storeStrong(v9, obj);
    if (v10)
    {
      v11 = 1;
      goto LABEL_10;
    }
    v11 = 0;
    if (a4)
    {
      v7 = (void *)v16[5];
      if (v7)
      {
LABEL_9:
        v11 = 0;
        *a4 = objc_retainAutorelease(v7);
      }
    }
  }
  else
  {
    v11 = 0;
    if (a4 && v7)
      goto LABEL_9;
  }
LABEL_10:
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v11;
}

- (id)terminatePlugInsInApplication:(id)a3 options:(int64_t)a4 withError:(id *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_1AF272938;
  v25 = sub_1AF272948;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_1AF272938;
  v19 = sub_1AF272948;
  v20 = 0;
  if (a4)
  {
    pkError(18, CFSTR("unrecognized option to terminatePlugInsInApplication"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v16[5];
    v16[5] = v9;

  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1AF2730D0;
    v14[3] = &unk_1E5F41330;
    v14[4] = &v21;
    v14[5] = &v15;
    -[PKManager holdRequest:flags:result:](self, "holdRequest:flags:result:", v8, 12, v14);
  }
  if (!v22[5])
  {
    if (a5)
    {
      v11 = (void *)v16[5];
      if (v11)
        *a5 = objc_retainAutorelease(v11);
    }
  }
  v12 = (id)v22[5];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v12;
}

- (void)holdRequest:(id)a3 flags:(unint64_t)a4 result:(id)a5
{
  -[PKManager holdRequest:extensionPointName:platforms:flags:result:](self, "holdRequest:extensionPointName:platforms:flags:result:", a3, 0, MEMORY[0x1E0C9AA60], a4, a5);
}

- (void)holdRequest:(id)a3 extensionPointName:(id)a4 platforms:(id)a5 flags:(unint64_t)a6 result:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD, void *);
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  BOOL v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  void (**v28)(id, _QWORD, void *);
  id v29[2];
  id location;
  void *v31;
  uint8_t buf[4];
  PKManager *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  unint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void (**)(id, _QWORD, void *))a7;
  -[PKManager client](self, "client");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v16);

  if (v12)
  {
    objc_msgSend(v12, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = v13;
  }
  v18 = v17;
  if (v12)

  pklog_handle_for_category(11);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v33 = self;
    v34 = 2112;
    v35 = v18;
    v36 = 2048;
    v37 = a6;
    _os_log_impl(&dword_1AF254000, v19, OS_LOG_TYPE_DEFAULT, "<PKManager:%p> hold request for [%@] with flags: 0x%llx", buf, 0x20u);
  }

  if (v13)
    v20 = 1;
  else
    v20 = v12 != 0;
  if (v20)
  {
    if (v12 && v13)
    {
      pkError(18, CFSTR("Malformed hold request: only one of URL or extension point allowed"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v15[2](v15, 0, v21);
    }
    else
    {
      if (v12)
      {
        objc_msgSend(v12, "path");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22 == 0;

        if (v23)
        {
          pkError(18, CFSTR("Malformed NSURL passed by the client."));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v15[2](v15, 0, v21);
          goto LABEL_22;
        }
        objc_msgSend(v12, "path");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v24;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v21 = 0;
      }
      -[PKManager client](self, "client");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = sub_1AF2734A8;
      v26[3] = &unk_1E5F41358;
      objc_copyWeak(v29, &location);
      v26[4] = self;
      v27 = v18;
      v29[1] = (id)a6;
      v28 = v15;
      objc_msgSend(v25, "holdPlugins:extensionPointName:platforms:flags:reply:", v21, v13, v14, a6, v26);

      objc_destroyWeak(v29);
    }
  }
  else
  {
    pkError(18, CFSTR("Malformed hold request: must supply URL or extension point"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, 0, v21);
  }
LABEL_22:

  objc_destroyWeak(&location);
}

- (void)releaseHold:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id location;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PKManager.m"), 509, CFSTR("bad plugin hold token:%@"), v5);

  }
  -[PKManager client](self, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v6);

  -[PKManager client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1AF2738CC;
  v10[3] = &unk_1E5F41380;
  objc_copyWeak(&v12, &location);
  v10[4] = self;
  v8 = v5;
  v11 = v8;
  objc_msgSend(v7, "releaseHold:flags:reply:", v8, 0, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)releaseHold:(id)a3 reply:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id location;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PKManager.m"), 523, CFSTR("bad plugin hold token:%@"), v7);

  }
  -[PKManager client](self, "client");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v9);

  -[PKManager client](self, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1AF273B70;
  v14[3] = &unk_1E5F413A8;
  objc_copyWeak(&v17, &location);
  v14[4] = self;
  v11 = v7;
  v15 = v11;
  v12 = v8;
  v16 = v12;
  objc_msgSend(v10, "releaseHold:flags:reply:", v11, 0, v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (BOOL)releaseHold:(id)a3 flags:(unint64_t)a4 withError:(id *)a5
{
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  void *v16;
  _QWORD v17[5];
  id v18;
  uint64_t *v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  id location;

  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PKManager.m"), 538, CFSTR("bad plugin hold token:%@"), v9);

  }
  -[PKManager client](self, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v10);

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_1AF272938;
  v25 = sub_1AF272948;
  v26 = 0;
  -[PKManager client](self, "client");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1AF273E80;
  v17[3] = &unk_1E5F413D0;
  v19 = &v21;
  objc_copyWeak(&v20, &location);
  v17[4] = self;
  v12 = v9;
  v18 = v12;
  objc_msgSend(v11, "releaseHold:flags:reply:", v12, a4, v17);

  if (a5)
  {
    v13 = (void *)v22[5];
    if (v13)
      *a5 = objc_retainAutorelease(v13);
  }
  v14 = v22[5] == 0;

  objc_destroyWeak(&v20);
  _Block_object_dispose(&v21, 8);

  objc_destroyWeak(&location);
  return v14;
}

- (BOOL)releaseHold:(id)a3 withError:(id *)a4
{
  return -[PKManager releaseHold:flags:withError:](self, "releaseHold:flags:withError:", a3, 8, a4);
}

- (void)updateExtensionStatesForPlugIns:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  PKManager *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  pklog_handle_for_category(10);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v18 = self;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1AF254000, v8, OS_LOG_TYPE_DEFAULT, "<PKManager:%p> bulk update extension states: %@", buf, 0x16u);
  }

  -[PKManager client](self, "client");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, v9);

  -[PKManager client](self, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1AF27417C;
  v13[3] = &unk_1E5F413A8;
  objc_copyWeak(&v16, (id *)buf);
  v13[4] = self;
  v11 = v6;
  v14 = v11;
  v12 = v7;
  v15 = v12;
  objc_msgSend(v10, "bulkSetPluginAnnotations:reply:", v11, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);

}

- (PKDaemonClient)client
{
  return (PKDaemonClient *)objc_getProperty(self, a2, 8, 1);
}

- (void)setClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_external, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end
