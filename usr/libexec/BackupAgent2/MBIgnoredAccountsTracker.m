@implementation MBIgnoredAccountsTracker

- (MBIgnoredAccountsTracker)init
{
  MBIgnoredAccountsTracker *v2;
  NSMutableSet *v3;
  NSMutableSet *allowedDSIDs;
  NSMutableSet *v5;
  NSMutableSet *ignoredDSIDs;
  NSMutableSet *v7;
  NSMutableSet *ignoredAppleIDs;
  NSMutableSet *v9;
  NSMutableSet *allowedAppleIDs;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MBIgnoredAccountsTracker;
  v2 = -[MBIgnoredAccountsTracker init](&v12, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableSet);
    allowedDSIDs = v2->_allowedDSIDs;
    v2->_allowedDSIDs = v3;

    v5 = objc_opt_new(NSMutableSet);
    ignoredDSIDs = v2->_ignoredDSIDs;
    v2->_ignoredDSIDs = v5;

    v7 = objc_opt_new(NSMutableSet);
    ignoredAppleIDs = v2->_ignoredAppleIDs;
    v2->_ignoredAppleIDs = v7;

    v9 = objc_opt_new(NSMutableSet);
    allowedAppleIDs = v2->_allowedAppleIDs;
    v2->_allowedAppleIDs = v9;

  }
  return v2;
}

+ (BOOL)_isEnterpriseAccount:(id)a3
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  NSObject *v20;
  __int16 v21;
  NSObject *v22;

  v3 = a3;
  if (!v3)
    sub_100088580();
  v4 = v3;
  v6 = objc_claimAutoreleasedReturnValue(-[NSObject personaIdentifier](v3, "personaIdentifier"));
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[UMUserPersonaAttributes personaAttributesForPersonaUniqueString:](UMUserPersonaAttributes, "personaAttributesForPersonaUniqueString:", v6));
    v8 = v7 != 0;
    v10 = MBGetDefaultLog(v7, v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (!v7)
    {
      if (v12)
      {
        *(_DWORD *)buf = 138543362;
        v20 = v6;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Failed to fetch the persona attributes for persona %{public}@", buf, 0xCu);
        _MBLog(CFSTR("DEFAULT"), "Failed to fetch the persona attributes for persona %{public}@", v6);
      }
      goto LABEL_15;
    }
    if (v12)
    {
      *(_DWORD *)buf = 138543618;
      v20 = v6;
      v21 = 2112;
      v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Fetched the attributes for persona %{public}@: %@", buf, 0x16u);
      _MBLog(CFSTR("DEFAULT"), "Fetched the attributes for persona %{public}@: %@", v6, v7);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject userPersonaUniqueString](v7, "userPersonaUniqueString"));
    if ((-[NSObject isEqualToString:](v6, "isEqualToString:", v13) & 1) == 0)
      sub_1000885A8();

    v14 = -[NSObject isEnterprisePersona](v7, "isEnterprisePersona");
    if ((_DWORD)v14)
    {
      v16 = MBGetDefaultLog(v14, v15);
      v11 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v20 = v6;
        v21 = 2112;
        v22 = v4;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Found an enterprise persona (%@) for account %@", buf, 0x16u);
        _MBLog(CFSTR("DEFAULT"), "Found an enterprise persona (%@) for account %@", v6, v4);
      }
LABEL_15:

      goto LABEL_16;
    }
  }
  else
  {
    v17 = MBGetDefaultLog(0, v5);
    v7 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Found nil personaIdentifier for %@", buf, 0xCu);
      _MBLog(CFSTR("DEBUG"), "Found nil personaIdentifier for %@", v4);
    }
  }
  v8 = 0;
LABEL_16:

  return v8;
}

- (BOOL)addAccountWithDSID:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  MBIgnoredAccountsTracker *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  id *v22;
  uint64_t v23;
  NSObject *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;

  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "isEqualToNumber:", &off_1000E4F20) & 1) == 0)
  {
    v8 = self;
    objc_sync_enter(v8);
    if (-[NSMutableSet containsObject:](v8->_ignoredDSIDs, "containsObject:", v5))
    {
      objc_sync_exit(v8);

      v6 = 0;
      goto LABEL_4;
    }
    v9 = -[NSMutableSet containsObject:](v8->_allowedDSIDs, "containsObject:", v5);
    objc_sync_exit(v8);

    if ((v9 & 1) == 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "aa_appleAccountWithPersonID:", v11));

      if (v12)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "username"));
        v16 = objc_msgSend((id)objc_opt_class(v8), "_isEnterpriseAccount:", v12);
        v17 = (int)v16;
        v19 = MBGetDefaultLog(v16, v18);
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          if (v17)
            v21 = "Ignoring";
          else
            v21 = "Found";
          v26 = v21;
          v27 = 2112;
          v28 = v15;
          v29 = 2112;
          v30 = v5;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%s account: %@/%@", buf, 0x20u);
          _MBLog(CFSTR("DEBUG"), "%s account: %@/%@", v21, v15, v5);
        }

        v22 = v8;
        objc_sync_enter(v22);
        if (v17)
        {
          -[NSMutableSet addObject:](v8->_ignoredDSIDs, "addObject:", v5);
          if (v15)
            objc_msgSend(v22[4], "addObject:", v15);
          v6 = 0;
LABEL_24:
          objc_sync_exit(v8);

          goto LABEL_4;
        }
      }
      else
      {
        v23 = MBGetDefaultLog(v13, v14);
        v24 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v26 = (const char *)v5;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "No account found for %@", buf, 0xCu);
          _MBLog(CFSTR("INFO"), "No account found for %@", v5);
        }

        objc_sync_enter(v8);
        v15 = 0;
      }
      -[NSMutableSet addObject:](v8->_allowedDSIDs, "addObject:", v5);
      if (v15)
        -[NSMutableSet addObject:](v8->_allowedAppleIDs, "addObject:", v15);
      v6 = 1;
      goto LABEL_24;
    }
  }
  v6 = 1;
LABEL_4:

  return v6;
}

- (BOOL)isIgnoredAppleID:(id)a3
{
  id v4;
  MBIgnoredAccountsTracker *v5;
  unsigned __int8 v6;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    v6 = -[NSMutableSet containsObject:](v5->_ignoredAppleIDs, "containsObject:", v4);
    if ((v6 & 1) == 0)
      -[NSMutableSet containsObject:](v5->_allowedAppleIDs, "containsObject:", v4);
    objc_sync_exit(v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoredAppleIDs, 0);
  objc_storeStrong((id *)&self->_allowedAppleIDs, 0);
  objc_storeStrong((id *)&self->_ignoredDSIDs, 0);
  objc_storeStrong((id *)&self->_allowedDSIDs, 0);
}

@end
