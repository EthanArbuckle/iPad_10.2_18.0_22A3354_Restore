@implementation MSDProfilesManager

- (MSDProfilesManager)init
{
  MSDProfilesManager *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSDProfilesManager;
  v2 = -[MSDProfilesManager init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
    objc_msgSend(v3, "registerObserver:", v2);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  objc_msgSend(v3, "unregisterObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MSDProfilesManager;
  -[MSDProfilesManager dealloc](&v4, "dealloc");
}

- (void)syncStatusOfInstalledProfiles
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  const char *v16;
  id v17;
  NSObject *v18;
  void *v19;
  unsigned int v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  int v25;
  id v26;

  v3 = sub_10002E034();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Fetching Installed Profiles", (uint8_t *)&v25, 2u);
  }

  v5 = objc_msgSend((id)objc_opt_class(self), "fetchInstalledMediaSetupProfilesManagedDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v6, "count");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  v9 = objc_msgSend(v8, "developerProfilesCount");

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  objc_msgSend(v10, "setDeveloperProfilesCount:", v7);

  if (v7)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
    v12 = objc_msgSend(v11, "profilesEverInstalled");

    v13 = sub_10002E034();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (!v12 || v7 >= v9)
    {
      if (v15)
      {
        v24 = objc_msgSend(v6, "count");
        v25 = 134217984;
        v26 = v24;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Found %lu matching profiles installed on device", (uint8_t *)&v25, 0xCu);
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProfilesManager delegate](self, "delegate"));
      v23 = objc_msgSend(v6, "copy");
      objc_msgSend(v22, "profilesManager:didAddProfiles:", self, v23);
      goto LABEL_18;
    }
    if (v15)
    {
      LOWORD(v25) = 0;
      v16 = "A profile was removed from the device";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v25, 2u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  v17 = sub_10002E034();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25) = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "No Profiles matching com.apple.mediasetup.developer domain", (uint8_t *)&v25, 2u);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](MSDDefaultsManager, "sharedManager"));
  v20 = objc_msgSend(v19, "profilesEverInstalled");

  if (v20)
  {
    v21 = sub_10002E034();
    v14 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      v16 = "Profile was installed on device, and we received a state change";
      goto LABEL_13;
    }
LABEL_14:

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDProfilesManager delegate](self, "delegate"));
    v23 = objc_msgSend(v6, "copy");
    objc_msgSend(v22, "profilesManager:didUpdateProfiles:", self, v23);
LABEL_18:

  }
}

+ (id)fetchInstalledMediaSetupProfilesManagedDefaults
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *i;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  void *v22;
  id v23;
  id obj;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];

  v2 = (void *)objc_opt_new(NSMutableArray, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "installedProfilesWithFilterFlags:", 3));

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v4;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v27)
  {
    v26 = *(_QWORD *)v40;
    v5 = kMediaSetupTestingProfileDefaultsIdentifier;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v40 != v26)
          objc_enumerationMutation(obj);
        v28 = v6;
        v7 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v6);
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v29 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "payloads"));
        v8 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
        if (v8)
        {
          v9 = v8;
          v30 = *(_QWORD *)v36;
          do
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(_QWORD *)v36 != v30)
                objc_enumerationMutation(v29);
              v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
              v12 = objc_opt_class(MCDefaultsPayload);
              v13 = v11;
              if ((objc_opt_isKindOfClass(v13, v12) & 1) != 0)
                v14 = v13;
              else
                v14 = 0;
              v15 = v14;

              v33 = 0u;
              v34 = 0u;
              v31 = 0u;
              v32 = 0u;
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "domains"));
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
              if (v17)
              {
                v18 = v17;
                v19 = *(_QWORD *)v32;
                do
                {
                  for (j = 0; j != v18; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v32 != v19)
                      objc_enumerationMutation(v16);
                    v21 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)j);
                    if (objc_msgSend(v21, "containsString:", v5))
                    {
                      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "defaultsForDomain:", v21));
                      objc_msgSend(v2, "na_safeAddObject:", v22);

                    }
                  }
                  v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
                }
                while (v18);
              }

            }
            v9 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
          }
          while (v9);
        }

        v6 = v28 + 1;
      }
      while ((id)(v28 + 1) != v27);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v27);
  }

  v23 = objc_msgSend(v2, "copy");
  return v23;
}

- (void)profileConnectionDidReceiveProfileListChangedNotification:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = sub_10002E034();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Profile List changed notification received for profileconnection..%@ with userinfo..%@", (uint8_t *)&v10, 0x16u);
  }

  -[MSDProfilesManager syncStatusOfInstalledProfiles](self, "syncStatusOfInstalledProfiles");
}

- (MSDProfilesManagerDelegate)delegate
{
  return (MSDProfilesManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
