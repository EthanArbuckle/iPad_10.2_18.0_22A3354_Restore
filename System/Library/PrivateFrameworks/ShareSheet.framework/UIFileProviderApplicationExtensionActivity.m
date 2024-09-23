@implementation UIFileProviderApplicationExtensionActivity

- (UIFileProviderApplicationExtensionActivity)initWithApplicationExtension:(id)a3
{
  id v4;
  UIFileProviderApplicationExtensionActivity *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  LSPlugInKitProxy *pluginProxy;
  LSPlugInKitProxy *v11;
  void *v12;
  uint64_t v13;
  NSArray *groupContainerURLs;
  UIFileProviderApplicationExtensionActivity *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)UIFileProviderApplicationExtensionActivity;
  v5 = -[UIApplicationExtensionActivity initWithApplicationExtension:](&v17, sel_initWithApplicationExtension_, v4);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0CA58F0];
      objc_msgSend(v4, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pluginKitProxyForIdentifier:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      pluginProxy = v5->_pluginProxy;
      v5->_pluginProxy = (LSPlugInKitProxy *)v9;

      v11 = v5->_pluginProxy;
      if (v11)
      {
        -[LSPlugInKitProxy groupContainerURLs](v11, "groupContainerURLs");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "allValues");
        v13 = objc_claimAutoreleasedReturnValue();
        groupContainerURLs = v5->_groupContainerURLs;
        v5->_groupContainerURLs = (NSArray *)v13;

      }
    }
    v15 = v5;
  }

  return v5;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIFileProviderApplicationExtensionActivity pluginProxy](self, "pluginProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && objc_msgSend(v11, "ui_isFileProviderURL", (_QWORD)v14)
            && -[UIFileProviderApplicationExtensionActivity _sharesGroupContainerWithURL:](self, "_sharesGroupContainerWithURL:", v11))
          {
            v12 = 1;
            goto LABEL_15;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          continue;
        break;
      }
    }
    v12 = 0;
LABEL_15:

  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (BOOL)_sharesGroupContainerWithURL:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  __int128 v15;
  id v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[UIFileProviderApplicationExtensionActivity groupContainerURLs](self, "groupContainerURLs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v6)
  {
    v8 = *(_QWORD *)v19;
    *(_QWORD *)&v7 = 138543874;
    v15 = v7;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v17 = 0;
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 0;
        objc_msgSend(v11, "getRelationship:ofDirectoryAtURL:toItemAtURL:error:", &v17, v10, v4, &v16);
        v12 = v16;

        if (v12)
        {
          share_sheet_log();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v15;
            v23 = v4;
            v24 = 2114;
            v25 = v10;
            v26 = 2112;
            v27 = v12;
            _os_log_error_impl(&dword_19E419000, v13, OS_LOG_TYPE_ERROR, "error getting relationship for url:%{public}@ containerURL:%{public}@ error:%@", buf, 0x20u);
          }

        }
        else if (!v17)
        {
          LOBYTE(v6) = 1;
          goto LABEL_15;
        }

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_15:

  return v6;
}

- (LSPlugInKitProxy)pluginProxy
{
  return self->_pluginProxy;
}

- (void)setPluginProxy:(id)a3
{
  objc_storeStrong((id *)&self->_pluginProxy, a3);
}

- (NSArray)groupContainerURLs
{
  return self->_groupContainerURLs;
}

- (void)setGroupContainerURLs:(id)a3
{
  objc_storeStrong((id *)&self->_groupContainerURLs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupContainerURLs, 0);
  objc_storeStrong((id *)&self->_pluginProxy, 0);
}

@end
