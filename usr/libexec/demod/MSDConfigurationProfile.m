@implementation MSDConfigurationProfile

- (MSDConfigurationProfile)initWithFile:(id)a3 andIdentifier:(id)a4
{
  id v6;
  __CFString *v7;
  MSDConfigurationProfile *v8;
  MSDConfigurationProfile *v9;
  objc_super v11;

  v6 = a3;
  v7 = (__CFString *)a4;
  v11.receiver = self;
  v11.super_class = (Class)MSDConfigurationProfile;
  v8 = -[MSDConfigurationProfile init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[MSDConfigurationProfile setProfilePath:](v8, "setProfilePath:", v6);
    if (-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("com.apple.mobilestoredemo.demoBundleProfile")))
    {

      v7 = CFSTR("com.apple.mobilestoredemo.demoProfile.standardPreferences");
    }
    -[MSDConfigurationProfile setProfileIdentifier:](v9, "setProfileIdentifier:", v7);
  }

  return v9;
}

- (MSDConfigurationProfile)initWithDefaultProfile
{
  MSDConfigurationProfile *v2;
  MSDConfigurationProfile *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSDConfigurationProfile;
  v2 = -[MSDConfigurationProfile init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[MSDConfigurationProfile setProfilePath:](v2, "setProfilePath:", 0);
    -[MSDConfigurationProfile setProfileIdentifier:](v3, "setProfileIdentifier:", CFSTR("com.apple.mobilestoredemo.defaultProfile"));
  }
  return v3;
}

- (MSDConfigurationProfile)initWithDemoModeProfile
{
  MSDConfigurationProfile *v2;
  MSDConfigurationProfile *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSDConfigurationProfile;
  v2 = -[MSDConfigurationProfile init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[MSDConfigurationProfile setProfilePath:](v2, "setProfilePath:", 0);
    -[MSDConfigurationProfile setProfileIdentifier:](v3, "setProfileIdentifier:", CFSTR("com.apple.mobilestoredemo.demoMode"));
  }
  return v3;
}

- (id)getProfileData
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  char *v6;
  void *v7;
  unsigned int v8;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDConfigurationProfile profileIdentifier](self, "profileIdentifier"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilestoredemo.defaultProfile"));

  if (v4)
  {
    v5 = dword_100173614;
    v6 = (char *)&unk_100172E50;
    return (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v6, v5));
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDConfigurationProfile profileIdentifier](self, "profileIdentifier"));
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.mobilestoredemo.demoMode"));

  if (v8)
  {
    v5 = dword_100173C70;
    v6 = aXmlVersion10En;
    return (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v6, v5));
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDConfigurationProfile profileIdentifier](self, "profileIdentifier"));
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.mobilestoredemo.demoProfile.standardPreferences")))
  {

LABEL_9:
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDConfigurationProfile profilePath](self, "profilePath"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v13));

    return v14;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDConfigurationProfile profileIdentifier](self, "profileIdentifier"));
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.mobilestoredemo.mdmProfile.dockLayout"));

  if (v12)
    goto LABEL_9;
  v15 = sub_1000604F0();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDConfigurationProfile profileIdentifier](self, "profileIdentifier"));
    v18 = 138543362;
    v19 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "getProfileData called for unknown profile type: %{public}@", (uint8_t *)&v18, 0xCu);

  }
  return 0;
}

- (id)getSupervisedRestrictions
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  CFTypeID v20;
  id obj;
  uint64_t v23;
  id v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDConfigurationProfile profileIdentifier](self, "profileIdentifier"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.mobilestoredemo.demoProfile.supervisedRestrictions"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDConfigurationProfile profilePath](self, "profilePath"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("PayloadContent")));

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = v8;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v24)
    {
      v23 = *(_QWORD *)v31;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v31 != v23)
            objc_enumerationMutation(obj);
          v25 = v9;
          v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v9);
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v11 = v10;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v27;
            do
            {
              for (i = 0; i != v13; i = (char *)i + 1)
              {
                if (*(_QWORD *)v27 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
                if ((objc_msgSend(v16, "containsString:", CFSTR("Payload")) & 1) == 0)
                {
                  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v16));
                  v19 = objc_opt_class(NSNumber, v18);
                  if ((objc_opt_isKindOfClass(v17, v19) & 1) != 0)
                  {
                    v20 = CFGetTypeID(v17);
                    if (v20 == CFBooleanGetTypeID())
                      objc_msgSend(v3, "MCSetBoolRestriction:value:", v16, objc_msgSend(v17, "BOOLValue"));
                  }

                }
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            }
            while (v13);
          }

          v9 = v25 + 1;
        }
        while ((id)(v25 + 1) != v24);
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v24);
    }

  }
  return v3;
}

- (NSString)profileIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setProfileIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)profilePath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setProfilePath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profilePath, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
}

@end
