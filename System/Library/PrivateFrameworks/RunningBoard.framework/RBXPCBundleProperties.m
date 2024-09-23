@implementation RBXPCBundleProperties

- (NSString)bundlePath
{
  return self->_path;
}

- (BOOL)continuousBackgroundMode
{
  return self->_continuousBackgroundMode;
}

- (RBXPCBundleProperties)initWithPID:(int)a3
{
  RBXPCBundleProperties *v4;
  RBXPCBundleProperties *v5;
  uint64_t v6;
  NSString *executablePath;
  NSString *v8;
  void *v9;
  void *executable_path;
  void *v11;
  void *v12;
  const char *string;
  uint64_t v14;
  NSString *identifier;
  uint64_t v16;
  NSString *v17;
  uint64_t property;
  uint64_t v20;
  NSString *path;
  uint64_t v22;
  NSString *extensionPointIdentifier;
  void *v24;
  id v25;
  char v26;
  char v27;
  void *v28;
  char v29;

  v4 = -[RBXPCBundleProperties init](self, "init");
  v5 = v4;
  if (v4)
  {
    v4->_pid = a3;
    RBSExecutablePathForPID();
    v6 = objc_claimAutoreleasedReturnValue();
    executablePath = v5->_executablePath;
    v5->_executablePath = (NSString *)v6;

    v8 = v5->_executablePath;
    if (v8)
    {
      -[NSString UTF8String](v8, "UTF8String");
      v9 = (void *)xpc_bundle_create();
      executable_path = (void *)xpc_bundle_get_executable_path();
      if (executable_path)
        executable_path = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", executable_path);
      if (v9
        && -[RBXPCBundleProperties _bundleMatchesProcessWithExecutablePath:bundleExecutablePath:]((uint64_t)v5, v5->_executablePath, executable_path))
      {
        v5->_canFetchBundle = 1;
        xpc_bundle_get_info_dictionary();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)_CFXPCCreateCFObjectFromXPCObject();
          string = xpc_dictionary_get_string(v11, (const char *)objc_msgSend(objc_retainAutorelease((id)*MEMORY[0x24BDBD288]), "UTF8String"));
          if (string)
          {
            v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", string);
            identifier = v5->_identifier;
            v5->_identifier = (NSString *)v14;

          }
        }
        else
        {
          v12 = 0;
        }
        property = xpc_bundle_get_property();
        if (property)
        {
          v20 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", property);
          path = v5->_path;
          v5->_path = (NSString *)v20;

        }
        RBSExtensionPointFromBundleDict();
        v22 = objc_claimAutoreleasedReturnValue();
        extensionPointIdentifier = v5->_extensionPointIdentifier;
        v5->_extensionPointIdentifier = (NSString *)v22;

        v5->_isExtension = v5->_extensionPointIdentifier != 0;
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("UIBackgroundModes"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v25 = v24;
          if ((objc_msgSend(v25, "containsObject:", CFSTR("fetch")) & 1) != 0)
            v26 = 1;
          else
            v26 = objc_msgSend(v25, "containsObject:", CFSTR("remote-notification"));
          v5->_supportsBackgroundContentFetching = v26;
          if ((objc_msgSend(v25, "containsObject:", CFSTR("voip")) & 1) != 0)
            v27 = 1;
          else
            v27 = objc_msgSend(v25, "containsObject:", CFSTR("push-to-talk"));
          v5->_usesSocketMonitoring = v27;
          v5->_supportsUnboundedTaskCompletion = objc_msgSend(v25, "containsObject:", CFSTR("unboundedTaskCompletion"));
          v5->_supportsBackgroundNetworkAuthentication = objc_msgSend(v25, "containsObject:", CFSTR("network-authentication"));
          v5->_supportsBackgroundAudio = objc_msgSend(v25, "containsObject:", CFSTR("audio"));
          v5->_continuousBackgroundMode = objc_msgSend(v25, "containsObject:", CFSTR("continuous"));

        }
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("SBPreferredPriorityBand"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v28, "isEqualToString:", CFSTR("PriorityBandSuspended")))
        {
          v5->_preferredJetsamBand = 0;
        }
        else
        {
          if (!objc_msgSend(v28, "isEqualToString:", CFSTR("PriorityBandMail")))
          {
            v29 = 0;
            v5->_preferredJetsamBand = -1;
            goto LABEL_31;
          }
          v5->_preferredJetsamBand = 40;
        }
        v29 = 1;
LABEL_31:
        v5->_hasPreferredJetsamBand = v29;

        goto LABEL_12;
      }
    }
    else
    {
      v9 = 0;
      executable_path = 0;
    }
    v5->_canFetchBundle = 0;
    RBSBundleIDForPID();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v5->_identifier;
    v5->_identifier = (NSString *)v16;

    v5->_preferredJetsamBand = -1;
LABEL_12:

  }
  return v5;
}

- (uint64_t)_bundleMatchesProcessWithExecutablePath:(void *)a3 bundleExecutablePath:
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v4 = a3;
  objc_msgSend(a2, "stringByStandardizingPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByStandardizingPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqual:", v6) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v7 = (uint64_t)realpath_DARWIN_EXTSN((const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), 0);
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      free((void *)v7);
      rbs_general_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138543618;
        v12 = v5;
        v13 = 2114;
        v14 = v8;
        _os_log_impl(&dword_21A8B4000, v9, OS_LOG_TYPE_DEFAULT, "_bundleMatchesProcessWithExecutablePath using realpath and comparing %{public}@ and %{public}@", (uint8_t *)&v11, 0x16u);
      }

      if (v5 == v8)
      {
        v7 = 1;
      }
      else
      {
        v7 = 0;
        if (v5 && v8)
          v7 = objc_msgSend(v5, "isEqualToString:", v8);
      }

    }
  }

  return v7;
}

- (NSString)extensionPointIdentifier
{
  return self->_extensionPointIdentifier;
}

- (id)bundleInfoValuesForKeys:(id)a3
{
  RBXPCBundleProperties *v4;
  NSCache *v5;
  NSCache *plistValues;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int pid;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  NSCache *v26;
  void *v27;
  void *v29;
  id v30;
  id v31;
  id obj;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint8_t v44[128];
  uint8_t buf[4];
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v31 = a3;
  if (objc_msgSend(v31, "count"))
  {
    if (self->_canFetchBundle)
    {
      v4 = self;
      objc_sync_enter(v4);
      if (!v4->_plistValues)
      {
        v5 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
        plistValues = v4->_plistValues;
        v4->_plistValues = v5;

        -[NSCache setCountLimit:](v4->_plistValues, "setCountLimit:", 20);
      }
      v34 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v31);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(v7, "mutableCopy");
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      obj = v7;
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v40 != v9)
              objc_enumerationMutation(obj);
            v11 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
            -[NSCache objectForKey:](v4->_plistValues, "objectForKey:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
            {
              objc_msgSend(MEMORY[0x24BDBCEF8], "null");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = v12 == v13;

              if (!v14)
                objc_msgSend(v34, "setObject:forKey:", v12, v11);
              objc_msgSend(v33, "removeObject:", v11);
            }

          }
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        }
        while (v8);
      }

      if (objc_msgSend(v33, "count"))
      {
        RBSExecutablePathForPID();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v15;
        if (v15 && (objc_msgSend(objc_retainAutorelease(v15), "UTF8String"), (v16 = xpc_bundle_create()) != 0))
        {
          v29 = (void *)v16;
          xpc_bundle_get_info_dictionary();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            v18 = (void *)_CFXPCCreateCFObjectFromXPCObject();
          else
            v18 = 0;

        }
        else
        {
          v29 = 0;
          v18 = 0;
        }
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v20 = v33;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (v21)
        {
          v22 = *(_QWORD *)v36;
          do
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v36 != v22)
                objc_enumerationMutation(v20);
              v24 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j);
              objc_msgSend(v18, "objectForKey:", v24, v29, v30);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = v4->_plistValues;
              if (v25)
              {
                -[NSCache setObject:forKey:](v4->_plistValues, "setObject:forKey:", v25, v24);
                objc_msgSend(v34, "setObject:forKey:", v25, v24);
              }
              else
              {
                objc_msgSend(MEMORY[0x24BDBCEF8], "null");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSCache setObject:forKey:](v26, "setObject:forKey:", v27, v24);

              }
            }
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          }
          while (v21);
        }

      }
      objc_sync_exit(v4);
    }
    else
    {
      rbs_general_log();
      v4 = (RBXPCBundleProperties *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_INFO))
      {
        pid = self->_pid;
        *(_DWORD *)buf = 67109120;
        v46 = pid;
        _os_log_impl(&dword_21A8B4000, &v4->super, OS_LOG_TYPE_INFO, "Bundle info cannot be fetched for process %d", buf, 8u);
      }
      v34 = 0;
    }

  }
  else
  {
    v34 = 0;
  }

  return v34;
}

- (BOOL)usesSocketMonitoring
{
  return self->_usesSocketMonitoring;
}

- (NSString)executablePath
{
  return self->_executablePath;
}

- (NSString)bundleIdentifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentVariables, 0);
  objc_storeStrong((id *)&self->_containerOverrideIdentifier, 0);
  objc_storeStrong((id *)&self->_dataContainerURL, 0);
  objc_storeStrong((id *)&self->_extensionPointIdentifier, 0);
  objc_storeStrong((id *)&self->_executablePath, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_plistValues, 0);
}

- (NSURL)dataContainerURL
{
  return self->_dataContainerURL;
}

- (NSString)containerOverrideIdentifier
{
  return self->_containerOverrideIdentifier;
}

- (NSDictionary)environmentVariables
{
  return self->_environmentVariables;
}

- (BOOL)hasPreferredJetsamBand
{
  return self->_hasPreferredJetsamBand;
}

- (int)preferredJetsamBand
{
  return self->_preferredJetsamBand;
}

- (BOOL)supportsBackgroundContentFetching
{
  return self->_supportsBackgroundContentFetching;
}

- (BOOL)supportsBackgroundNetworkAuthentication
{
  return self->_supportsBackgroundNetworkAuthentication;
}

- (BOOL)supportsBackgroundAudio
{
  return self->_supportsBackgroundAudio;
}

- (BOOL)supportsUnboundedTaskCompletion
{
  return self->_supportsUnboundedTaskCompletion;
}

- (BOOL)isExtension
{
  return self->_isExtension;
}

- (int)platform
{
  return self->_platform;
}

@end
