@implementation DOCSourceBuilder

- (id)containingAppBundleIdentifierForPicker:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "infoDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Path")));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceBuilder containingAppBundleIdentifierForBundleURL:](self, "containingAppBundleIdentifierForBundleURL:", v6));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)matchingLegacyProviderIdentifierForPicker:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = a3;
  v4 = objc_alloc((Class)LSApplicationExtensionRecord);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  v6 = objc_msgSend(v4, "initWithBundleIdentifier:error:", v5, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "containingBundleRecord"));
  v8 = objc_opt_class(LSApplicationRecord);
  v9 = 0;
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "applicationExtensionRecords"));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = v11;
      v19 = v3;
      v13 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "extensionPointRecord"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));

          if ((objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.fileprovider-nonui")) & 1) != 0)
          {
            v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bundleIdentifier"));

            goto LABEL_12;
          }

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v12)
          continue;
        break;
      }
      v9 = 0;
LABEL_12:
      v3 = v19;
    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (id)containingAppBundleIdentifierForProvider:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "extensionBundleURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceBuilder containingAppBundleIdentifierForBundleURL:](self, "containingAppBundleIdentifierForBundleURL:", v4));

  return v5;
}

- (id)buildSourcesFromLegacyPickerExtensions:(id)a3 legacyProviders:(id)a4
{
  id v6;
  id v7;
  __int128 v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  BOOL v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  DOCPickerSource *v25;
  id v26;
  __int128 v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  id obj;
  id v34;
  _QWORD v35[4];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  _BYTE v47[128];

  v6 = a3;
  v31 = a4;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v6, "count")));
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v38;
    *(_QWORD *)&v8 = 136315650;
    v28 = v8;
    v30 = *(_QWORD *)v38;
    do
    {
      v11 = 0;
      v32 = v9;
      do
      {
        if (*(_QWORD *)v38 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[DOCManagedPermission defaultPermission](DOCManagedPermission, "defaultPermission", v28));
        v14 = objc_msgSend(v13, "canHostAppPerformAction:legacyPickerExtension:", -[DOCSourceBuilder userAction](self, "userAction"), v12);

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceBuilder matchingLegacyProviderIdentifierForPicker:](self, "matchingLegacyProviderIdentifierForPicker:", v12));
        v16 = v15;
        if (v15)
          v17 = v14 == 0;
        else
          v17 = 1;
        if (!v17)
        {
          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472;
          v35[2] = sub_1000BE454;
          v35[3] = &unk_1005BE968;
          v18 = v15;
          v36 = v18;
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v35));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "filteredArrayUsingPredicate:", v19));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "firstObject"));

          if (!v21)
          {
            v22 = docLogHandle;
            if (!docLogHandle)
            {
              DOCInitLogging();
              v22 = docLogHandle;
            }
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v42 = "-[DOCSourceBuilder buildSourcesFromLegacyPickerExtensions:legacyProviders:]";
              v43 = 2112;
              v44 = v18;
              _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%s falling back to fetching domain manually for legacy V1 file provider for ID: %@", buf, 0x16u);
            }
            v34 = 0;
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[FPProviderDomain providerDomainWithID:cachePolicy:error:](FPProviderDomain, "providerDomainWithID:cachePolicy:error:", v18, 1, &v34));
            v23 = v34;
            if (v23)
            {
              v24 = docLogHandle;
              if (!docLogHandle)
              {
                DOCInitLogging();
                v24 = docLogHandle;
              }
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v28;
                v42 = "-[DOCSourceBuilder buildSourcesFromLegacyPickerExtensions:legacyProviders:]";
                v43 = 2112;
                v44 = v18;
                v45 = 2112;
                v46 = v23;
                _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s failed to fetch domain manually for legacy V1 file provider for ID: %@ error: %@", buf, 0x20u);
              }
            }

          }
          v25 = -[DOCPickerSource initWithPicker:providerDomain:]([DOCPickerSource alloc], "initWithPicker:providerDomain:", v12, v21);
          if (v25)
            objc_msgSend(v29, "addObject:", v25);

          v10 = v30;
          v9 = v32;
        }

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    }
    while (v9);
  }

  v26 = objc_msgSend(v29, "copy");
  return v26;
}

- (id)filterNonObsoleteLegacyPickersFromPickers:(id)a3 modernProviders:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void **v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void *v22;
  DOCSourceBuilder *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v7, "count")));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceBuilder containingAppBundleIdentifierForProvider:](self, "containingAppBundleIdentifierForProvider:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v13)));
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }

  v19 = _NSConcreteStackBlock;
  v20 = 3221225472;
  v21 = sub_10007E8B4;
  v22 = &unk_1005BE990;
  v23 = self;
  v24 = v8;
  v15 = v8;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &v19));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filteredArrayUsingPredicate:", v16, v19, v20, v21, v22, v23));

  return v17;
}

- (id)buildSourcesProviders:(id)a3 legacyWebViewFileProviders:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_10007E908;
  v19 = &unk_1005BE940;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v20 = v9;
  v10 = v8;
  v21 = v10;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v16);

  if (v6)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceBuilder filterNonObsoleteLegacyPickersFromPickers:modernProviders:](self, "filterNonObsoleteLegacyPickersFromPickers:modernProviders:", v6, v9, v16, v17, v18, v19, v20));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceBuilder buildSourcesFromLegacyPickerExtensions:legacyProviders:](self, "buildSourcesFromLegacyPickerExtensions:legacyProviders:", v11, v10));

  }
  else
  {
    v12 = 0;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceBuilder buildSourcesFromProviderDomains:](self, "buildSourcesFromProviderDomains:", v9, v16, v17, v18, v19));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v12));

  return v14;
}

- (id)containingAppBundleIdentifierForBundleURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSBundleRecord doc_applicationExtensionRecordAtURL:](LSBundleRecord, "doc_applicationExtensionRecordAtURL:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "containingApplicationRecord"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));
  return v5;
}

- (id)buildSourcesFromProviderDomains:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v4 = a3;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (char *)objc_msgSend(v4, "count") + 1));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[DOCAppProtectionManager sharedManager](DOCAppProtectionManager, "sharedManager"));
        v12 = objc_msgSend(v11, "hostAppCanSeeFileProviderDomain:", v10);

        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[DOCManagedPermission defaultPermission](DOCManagedPermission, "defaultPermission"));
          v14 = objc_msgSend(v13, "canHostAppPerformAction:fileProviderDomain:", -[DOCSourceBuilder userAction](self, "userAction"), v10);

          if (v14)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[DOCSourceBuilder hostIdentifier](self, "hostIdentifier"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[DOCFileProviderSource createSourceFrom:with:](_TtC5Files21DOCFileProviderSource, "createSourceFrom:with:", v10, v15));

            objc_msgSend(v20, "addObject:", v16);
          }
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[DOCFileProviderSource createSpotlightSources](_TtC5Files21DOCFileProviderSource, "createSpotlightSources"));
  objc_msgSend(v20, "addObjectsFromArray:", v17);

  v18 = objc_msgSend(v20, "copy");
  return v18;
}

- (unint64_t)userAction
{
  return self->_userAction;
}

- (void)setUserAction:(unint64_t)a3
{
  self->_userAction = a3;
}

- (void)setManagedPermission:(id)a3
{
  objc_storeStrong((id *)&self->_managedPermission, a3);
}

- (void)setHostIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (DOCSourceBuilder)initWithUserAction:(unint64_t)a3 hostIdentifier:(id)a4 managedPermissions:(id)a5
{
  id v8;
  id v9;
  DOCSourceBuilder *v10;
  DOCSourceBuilder *v11;
  objc_super v13;

  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)DOCSourceBuilder;
  v10 = -[DOCSourceBuilder init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    -[DOCSourceBuilder setUserAction:](v10, "setUserAction:", a3);
    -[DOCSourceBuilder setHostIdentifier:](v11, "setHostIdentifier:", v8);
    -[DOCSourceBuilder setManagedPermission:](v11, "setManagedPermission:", v9);
  }

  return v11;
}

- (DOCSourceBuilder)initWithUserAction:(unint64_t)a3 hostIdentifier:(id)a4
{
  id v6;
  void *v7;
  DOCSourceBuilder *v8;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[DOCManagedPermission defaultPermission](DOCManagedPermission, "defaultPermission"));
  v8 = -[DOCSourceBuilder initWithUserAction:hostIdentifier:managedPermissions:](self, "initWithUserAction:hostIdentifier:managedPermissions:", a3, v6, v7);

  return v8;
}

- (NSString)hostIdentifier
{
  return self->_hostIdentifier;
}

- (DOCManagedPermission)managedPermission
{
  return self->_managedPermission;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedPermission, 0);
  objc_storeStrong((id *)&self->_hostIdentifier, 0);
}

@end
