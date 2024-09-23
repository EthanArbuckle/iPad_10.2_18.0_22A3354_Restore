@implementation MSDConfigurationProfileManager

+ (id)sharedInstance
{
  if (qword_100175178 != -1)
    dispatch_once(&qword_100175178, &stru_10013D920);
  return (id)qword_100175170;
}

- (MSDConfigurationProfileManager)init
{
  MSDConfigurationProfileManager *v2;
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MSDConfigurationProfileManager;
  v2 = -[MSDConfigurationProfileManager init](&v7, "init");
  if (v2)
  {
    v3 = objc_alloc_init((Class)NSMutableArray);
    -[MSDConfigurationProfileManager setConfigurationProfilesSupported:](v2, "setConfigurationProfilesSupported:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDConfigurationProfileManager configurationProfilesSupported](v2, "configurationProfilesSupported"));
    objc_msgSend(v4, "addObject:", CFSTR("com.apple.mobilestoredemo.demoProfile.standardPreferences"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDConfigurationProfileManager configurationProfilesSupported](v2, "configurationProfilesSupported"));
    objc_msgSend(v5, "addObject:", CFSTR("com.apple.mobilestoredemo.demoProfile.supervisedRestrictions"));

  }
  return v2;
}

- (BOOL)installDefaultConfigurationProfile
{
  MSDConfigurationProfile *v3;

  v3 = -[MSDConfigurationProfile initWithDefaultProfile]([MSDConfigurationProfile alloc], "initWithDefaultProfile");
  LOBYTE(self) = -[MSDConfigurationProfileManager installConfigurationProfile:](self, "installConfigurationProfile:", v3);

  return (char)self;
}

- (BOOL)installDemoModeConfigurationProfile
{
  MSDConfigurationProfile *v3;

  v3 = -[MSDConfigurationProfile initWithDemoModeProfile]([MSDConfigurationProfile alloc], "initWithDemoModeProfile");
  LOBYTE(self) = -[MSDConfigurationProfileManager installConfigurationProfile:](self, "installConfigurationProfile:", v3);

  return (char)self;
}

- (BOOL)installConfigurationProfile:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  BOOL v9;
  unsigned int v11;
  id v12;
  _BOOL4 v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  int v18;
  void *v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "profileIdentifier"));
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobilestoredemo.demoProfile.standardPreferences")) & 1) != 0|| objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobilestoredemo.defaultProfile")))
  {
    v6 = sub_1000604F0();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138543362;
      v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Installing configuration profile: %{public}@", (uint8_t *)&v18, 0xCu);
    }

    if (-[MSDConfigurationProfileManager uninstallConfigurationProfileIfNeeded:](self, "uninstallConfigurationProfileIfNeeded:", v5))
    {
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getProfileData"));
      if (v8)
      {
        if (-[MSDConfigurationProfileManager installConfigurationProfileWithData:](self, "installConfigurationProfileWithData:", v8))
        {
          v9 = 1;
          goto LABEL_9;
        }
        v17 = sub_1000604F0();
        v16 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          sub_1000B7A60();
      }
      else
      {
        v15 = sub_1000604F0();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          sub_1000B7A34();
      }

    }
    else
    {
      v14 = sub_1000604F0();
      v8 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_1000B7A8C();
    }
LABEL_16:
    v9 = 0;
    goto LABEL_9;
  }
  v11 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobilestoredemo.demoProfile.supervisedRestrictions"));
  v12 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v12);
  v13 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v11)
  {
    if (v13)
    {
      v18 = 138543362;
      v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unknown profile type: %{public}@", (uint8_t *)&v18, 0xCu);
    }
    goto LABEL_16;
  }
  if (v13)
  {
    LOWORD(v18) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Installing restrictions configuration profile.", (uint8_t *)&v18, 2u);
  }

  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getSupervisedRestrictions"));
  v9 = -[MSDConfigurationProfileManager installRestrictionsConfigurationProfile:](self, "installRestrictionsConfigurationProfile:", v8);
LABEL_9:

  return v9;
}

- (void)uninstallAllDemoBundleConfigurationProfiles
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Uninstalling all existing configuration profiles.", buf, 2u);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDConfigurationProfileManager configurationProfilesSupported](self, "configurationProfilesSupported"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v17;
    *(_QWORD *)&v7 = 138543362;
    v15 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (!objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.mobilestoredemo.demoProfile.standardPreferences"), v15))
        {
          if ((objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.mobilestoredemo.demoProfile.supervisedRestrictions")) & 1) != 0)
          {
            if (-[MSDConfigurationProfileManager uninstallRestrictionsConfigurationProfile](self, "uninstallRestrictionsConfigurationProfile"))
            {
              continue;
            }
LABEL_13:
            v12 = sub_1000604F0();
            v13 = objc_claimAutoreleasedReturnValue(v12);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v15;
              v21 = v11;
              _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to remove profile: %{public}@", buf, 0xCu);
            }
          }
          else
          {
            v14 = sub_1000604F0();
            v13 = objc_claimAutoreleasedReturnValue(v14);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v15;
              v21 = v11;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Unknown profile identifier found: %{public}@, Marking as removed.", buf, 0xCu);
            }
          }

          continue;
        }
        if (!-[MSDConfigurationProfileManager uninstallConfigurationProfileIfNeeded:](self, "uninstallConfigurationProfileIfNeeded:", v11))goto LABEL_13;
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v8);
  }

}

- (BOOL)uninstallConfigurationProfileIfNeeded:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  BOOL v7;
  uint8_t v9[16];

  v4 = a3;
  if (-[MSDConfigurationProfileManager isConfigurationProfileInstalled:](self, "isConfigurationProfileInstalled:", v4))
  {
    v5 = sub_1000604F0();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Uninstalling existing configuration profile.", v9, 2u);
    }

    v7 = -[MSDConfigurationProfileManager uninstallConfigurationProfile:](self, "uninstallConfigurationProfile:", v4);
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)installConfigurationProfileWithData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v11[8];
  id v12;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v12 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "installProfileData:outError:", v3, &v12));

  v6 = v12;
  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Successfully installed configuration profile.", v11, 2u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    sub_1000B7AB8();
  }

  return v5 != 0;
}

- (BOOL)uninstallConfigurationProfile:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  id v8;
  NSObject *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  objc_msgSend(v5, "removeProfileWithIdentifier:", v4);

  v6 = -[MSDConfigurationProfileManager isConfigurationProfileInstalled:](self, "isConfigurationProfileInstalled:", v4);
  if (v6)
  {
    v8 = sub_1000604F0();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000B7B18();

  }
  return v6 ^ 1;
}

- (BOOL)isConfigurationProfileInstalled:(id)a3
{
  id v3;
  dispatch_semaphore_t v4;
  void *v5;
  NSObject *v6;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v4 = dispatch_semaphore_create(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000084D0;
  v8[3] = &unk_10013D948;
  v10 = &v11;
  v6 = v4;
  v9 = v6;
  objc_msgSend(v5, "isProfileInstalledWithIdentifier:completion:", v3, v8);

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v5) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v5;
}

- (BOOL)installRestrictionsConfigurationProfile:(id)a3
{
  BOOL v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  id v10;
  char v11;

  v3 = 1;
  v11 = 1;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v10 = 0;
  objc_msgSend(v5, "applyRestrictionDictionary:clientType:clientUUID:localizedClientDescription:localizedWarningMessage:outRestrictionChanged:outEffectiveSettingsChanged:outError:", v4, CFSTR("com.apple.mobilestoredemod"), CFSTR("com.apple.mobilestoredemod"), 0, 0, &v11, 0, &v10);

  v6 = v10;
  if (!v11)
  {
    v7 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1000B7BA4();

    v3 = v11 != 0;
  }

  return v3;
}

- (BOOL)uninstallRestrictionsConfigurationProfile
{
  BOOL v2;
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  id v8;
  char v9;

  v2 = 1;
  v9 = 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v8 = 0;
  objc_msgSend(v3, "applyRestrictionDictionary:clientType:clientUUID:localizedClientDescription:localizedWarningMessage:outRestrictionChanged:outEffectiveSettingsChanged:outError:", 0, CFSTR("com.apple.mobilestoredemod"), CFSTR("com.apple.mobilestoredemod"), 0, 0, &v9, 0, &v8);
  v4 = v8;
  if (!v9)
  {
    v5 = sub_1000604F0();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000B7C04();

    v2 = v9 != 0;
  }

  return v2;
}

- (NSMutableArray)configurationProfilesSupported
{
  return self->_configurationProfilesSupported;
}

- (void)setConfigurationProfilesSupported:(id)a3
{
  objc_storeStrong((id *)&self->_configurationProfilesSupported, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationProfilesSupported, 0);
}

@end
