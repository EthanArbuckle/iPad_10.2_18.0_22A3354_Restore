@implementation TFBetaApplicationProxy

- (id)initForAppWithBundleURL:(id)a3
{
  id v5;
  TFBetaApplicationProxy *v6;
  TFBetaApplicationProxy *v7;
  uint64_t v8;
  NSString *logKey;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TFBetaApplicationProxy;
  v6 = -[TFBetaApplicationProxy init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleURL, a3);
    AMSGenerateLogCorrelationKey();
    v8 = objc_claimAutoreleasedReturnValue();
    logKey = v7->_logKey;
    v7->_logKey = (NSString *)v8;

  }
  return v7;
}

- (id)initForAppWithIdentifier:(id)a3
{
  return -[TFBetaApplicationProxy initForAppWithIdentifier:appPlatform:](self, "initForAppWithIdentifier:appPlatform:", a3, 0);
}

- (id)initForAppWithIdentifier:(id)a3 appPlatform:(int64_t)a4
{
  id v7;
  TFBetaApplicationProxy *v8;
  TFBetaApplicationProxy *v9;
  uint64_t v10;
  NSString *logKey;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TFBetaApplicationProxy;
  v8 = -[TFBetaApplicationProxy init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_bundleIdentifier, a3);
    v9->_bundleAppPlatform = a4;
    AMSGenerateLogCorrelationKey();
    v10 = objc_claimAutoreleasedReturnValue();
    logKey = v9->_logKey;
    v9->_logKey = (NSString *)v10;

  }
  return v9;
}

- (NSString)preferredLocalizedDisplayNameForInstalledVersion
{
  NSURL *bundleURL;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  bundleURL = self->_bundleURL;
  objc_msgSend(MEMORY[0x24BE04600], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (bundleURL)
    objc_msgSend(v4, "getDisplayNamesForBundleURL:", self->_bundleURL);
  else
    objc_msgSend(v4, "getDisplayNamesForBundleID:", self->_bundleIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[TFLocale preferredLocalizedDisplayNameFromDisplayNames:](TFLocale, "preferredLocalizedDisplayNameFromDisplayNames:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return (NSString *)v7;
}

- (BOOL)isProactiveFeedbackEnabledForInstalledVersion
{
  NSURL *bundleURL;
  void *v4;
  void *v5;
  int v6;
  _BOOL4 v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  bundleURL = self->_bundleURL;
  objc_msgSend(MEMORY[0x24BE04600], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (bundleURL)
    v6 = objc_msgSend(v4, "isFeedbackEnabledForBundleURL:", self->_bundleURL);
  else
    v6 = objc_msgSend(v4, "isFeedbackEnabledForBundleID:", self->_bundleIdentifier);
  v7 = v6;

  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "generatedLogger");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_opt_class();
    v11 = v10;
    -[TFBetaApplicationProxy bundleIdentifier](self, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFBetaApplicationProxy logKey](self, "logKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138544130;
    v16 = v10;
    v17 = 2114;
    v18 = v12;
    v19 = 2112;
    v20 = v13;
    v21 = 1024;
    v22 = v7;
    _os_log_impl(&dword_2174E1000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] isProactiveFeedbackEnabledForInstalledVersion enabled = %d", (uint8_t *)&v15, 0x26u);

  }
  return v7;
}

- (BOOL)isBetaAppLaunchScreenEnabledForInstalledVersion
{
  NSURL *bundleURL;
  void *v4;
  void *v5;
  int v6;
  _BOOL4 v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  bundleURL = self->_bundleURL;
  objc_msgSend(MEMORY[0x24BE04600], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (bundleURL)
    v6 = objc_msgSend(v4, "isLaunchScreenEnabledForBundleURL:", self->_bundleURL);
  else
    v6 = objc_msgSend(v4, "isLaunchScreenEnabledForBundleID:", self->_bundleIdentifier);
  v7 = v6;

  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "generatedLogger");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_opt_class();
    v11 = v10;
    -[TFBetaApplicationProxy bundleIdentifier](self, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFBetaApplicationProxy logKey](self, "logKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138544130;
    v16 = v10;
    v17 = 2114;
    v18 = v12;
    v19 = 2112;
    v20 = v13;
    v21 = 1024;
    v22 = v7;
    _os_log_impl(&dword_2174E1000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] isBetaAppLaunchScreenEnabledForInstalledVersion enabled = %d", (uint8_t *)&v15, 0x26u);

  }
  return v7;
}

- (void)deviceWillInstallVersion:(id)a3 build:(id)a4 withLocalizedDisplayNames:(id)a5 localizedTestNotes:(id)a6 primaryLocaleKey:(id)a7 developerName:(id)a8 expirationDate:(id)a9 iconUrlTemplate:(id)a10 testerEmail:(id)a11
{
  id v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  uint64_t v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  id v60;
  __int16 v61;
  id v62;
  __int16 v63;
  id v64;
  __int16 v65;
  id v66;
  __int16 v67;
  id v68;
  __int16 v69;
  id v70;
  __int16 v71;
  id v72;
  __int16 v73;
  id v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v46 = a3;
  v17 = a4;
  v43 = a5;
  v42 = a6;
  v41 = a7;
  v45 = a8;
  v44 = a9;
  v18 = a10;
  v19 = a11;
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "generatedLogger");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = v18;
    v23 = v17;
    v24 = (void *)objc_opt_class();
    v40 = v24;
    -[TFBetaApplicationProxy bundleIdentifier](self, "bundleIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFBetaApplicationProxy logKey](self, "logKey");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138546178;
    v52 = v24;
    v17 = v23;
    v18 = v22;
    v53 = 2114;
    v54 = v25;
    v55 = 2112;
    v56 = v26;
    v57 = 2112;
    v58 = v46;
    v59 = 2112;
    v60 = v17;
    v61 = 2112;
    v62 = v43;
    v63 = 2112;
    v64 = v42;
    v65 = 2112;
    v66 = v41;
    v67 = 2112;
    v68 = v45;
    v69 = 2112;
    v70 = v44;
    v71 = 2112;
    v72 = v22;
    v73 = 2112;
    v74 = v19;
    _os_log_impl(&dword_2174E1000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] deviceWillInstallVersion               shortVersionString = %@ |              bundleVersion = %@ |              localizedDisplayNames = %@ |              localizedTestNotes = %@ |              primaryLocaleKey = %@ |              developerName = %@ |              expirationDate = %@ |              iconUrlTemplate = %@ |              testerEmail = %@", buf, 0x7Au);

  }
  v27 = objc_alloc_init(MEMORY[0x24BE04508]);
  v28 = (void *)MEMORY[0x24BE04510];
  -[TFBetaApplicationProxy bundleIdentifier](self, "bundleIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "versionWithBundleID:bundleVersion:platform:andShortVersion:", v29, v17, -[TFBetaApplicationProxy _asdAppPlatform](self, "_asdAppPlatform"), v46);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setVersion:", v30);

  objc_msgSend(v27, "setExpirationDate:", v44);
  objc_msgSend(v27, "setArtistName:", v45);
  objc_msgSend(v27, "setIconURLTemplate:", v18);
  objc_msgSend(v27, "setLocalizedTestNotes:", v42);
  objc_msgSend(v27, "setTesterEmail:", v19);
  objc_msgSend(MEMORY[0x24BE044F8], "displayNameWithLocalizedNames:andPrimaryLocale:", v43, v41);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setDisplayNames:", v31);

  objc_msgSend(v27, "setSharedFeedback:", 0);
  objc_msgSend(v27, "setFeedbackEnabled:", 0);
  objc_msgSend(v27, "setLaunchScreenEnabled:", 0);
  v32 = objc_opt_class();
  -[TFBetaApplicationProxy bundleIdentifier](self, "bundleIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFBetaApplicationProxy logKey](self, "logKey");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE04600], "sharedInstance");
  v35 = v19;
  v36 = v17;
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = MEMORY[0x24BDAC760];
  v47[1] = 3221225472;
  v47[2] = __176__TFBetaApplicationProxy_deviceWillInstallVersion_build_withLocalizedDisplayNames_localizedTestNotes_primaryLocaleKey_developerName_expirationDate_iconUrlTemplate_testerEmail___block_invoke;
  v47[3] = &unk_24D794790;
  v49 = v34;
  v50 = v32;
  v48 = v33;
  v38 = v34;
  v39 = v33;
  objc_msgSend(v37, "setLaunchInfo:withCompletionHandler:", v27, v47);

}

void __176__TFBetaApplicationProxy_deviceWillInstallVersion_build_withLocalizedDisplayNames_localizedTestNotes_primaryLocaleKey_developerName_expirationDate_iconUrlTemplate_testerEmail___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "generatedLogger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = a1[5];
      v6 = a1[6];
      v8 = a1[4];
      objc_msgSend(v3, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138544130;
      v11 = v6;
      v12 = 2114;
      v13 = v8;
      v14 = 2112;
      v15 = v7;
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_2174E1000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@:%@] Failed to save launch info. error = %@", (uint8_t *)&v10, 0x2Au);

    }
  }

}

- (void)setProactiveFeedbackEnabled:(BOOL)a3 forVersion:(id)a4 build:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  _BOOL4 v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v6 = a3;
  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "generatedLogger");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_opt_class();
    v13 = v12;
    -[TFBetaApplicationProxy bundleIdentifier](self, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFBetaApplicationProxy logKey](self, "logKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v30 = v12;
    v31 = 2114;
    v32 = v14;
    v33 = 2112;
    v34 = v15;
    v35 = 1024;
    v36 = v6;
    v37 = 2112;
    v38 = v8;
    v39 = 2112;
    v40 = v9;
    _os_log_impl(&dword_2174E1000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] setProactiveFeedbackEnabled               enabled = %d |              shortVersionString = %@ |              bundleVersion = %@ ", buf, 0x3Au);

  }
  v16 = (void *)MEMORY[0x24BE04510];
  -[TFBetaApplicationProxy bundleIdentifier](self, "bundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "versionWithBundleID:bundleVersion:platform:andShortVersion:", v17, v9, -[TFBetaApplicationProxy _asdAppPlatform](self, "_asdAppPlatform"), v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_opt_class();
  -[TFBetaApplicationProxy bundleIdentifier](self, "bundleIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFBetaApplicationProxy logKey](self, "logKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE04600], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __71__TFBetaApplicationProxy_setProactiveFeedbackEnabled_forVersion_build___block_invoke;
  v25[3] = &unk_24D794790;
  v27 = v21;
  v28 = v19;
  v26 = v20;
  v23 = v21;
  v24 = v20;
  objc_msgSend(v22, "setFeedbackEnabled:forVersion:withCompletionHandler:", v6, v18, v25);

}

void __71__TFBetaApplicationProxy_setProactiveFeedbackEnabled_forVersion_build___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "generatedLogger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = a1[5];
      v6 = a1[6];
      v8 = a1[4];
      objc_msgSend(v3, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138544130;
      v11 = v6;
      v12 = 2114;
      v13 = v8;
      v14 = 2112;
      v15 = v7;
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_2174E1000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@:%@] Failed to set proactive feedback flag. error = %@", (uint8_t *)&v10, 0x2Au);

    }
  }

}

- (void)setBetaAppLaunchScreenEnabled:(BOOL)a3 forVersion:(id)a4 build:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  _BOOL4 v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v6 = a3;
  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "generatedLogger");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_opt_class();
    v13 = v12;
    -[TFBetaApplicationProxy bundleIdentifier](self, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFBetaApplicationProxy logKey](self, "logKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v30 = v12;
    v31 = 2114;
    v32 = v14;
    v33 = 2112;
    v34 = v15;
    v35 = 1024;
    v36 = v6;
    v37 = 2112;
    v38 = v8;
    v39 = 2112;
    v40 = v9;
    _os_log_impl(&dword_2174E1000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] setBetaAppLaunchScreenEnabled               enabled = %d |              shortVersionString = %@ |              bundleVersion = %@ ", buf, 0x3Au);

  }
  v16 = (void *)MEMORY[0x24BE04510];
  -[TFBetaApplicationProxy bundleIdentifier](self, "bundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "versionWithBundleID:bundleVersion:platform:andShortVersion:", v17, v9, -[TFBetaApplicationProxy _asdAppPlatform](self, "_asdAppPlatform"), v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_opt_class();
  -[TFBetaApplicationProxy bundleIdentifier](self, "bundleIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFBetaApplicationProxy logKey](self, "logKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE04600], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __73__TFBetaApplicationProxy_setBetaAppLaunchScreenEnabled_forVersion_build___block_invoke;
  v25[3] = &unk_24D794790;
  v27 = v21;
  v28 = v19;
  v26 = v20;
  v23 = v21;
  v24 = v20;
  objc_msgSend(v22, "setLaunchScreenEnabled:forVersion:withCompletionHandler:", v6, v18, v25);

}

void __73__TFBetaApplicationProxy_setBetaAppLaunchScreenEnabled_forVersion_build___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "generatedLogger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = a1[5];
      v6 = a1[6];
      v8 = a1[4];
      objc_msgSend(v3, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138544130;
      v11 = v6;
      v12 = 2114;
      v13 = v8;
      v14 = 2112;
      v15 = v7;
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_2174E1000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@:%@] Failed to set beta launch screen flag. error = %@", (uint8_t *)&v10, 0x2Au);

    }
  }

}

- (void)updateLocalizedTestNotes:(id)a3 forVersion:(id)a4 build:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "generatedLogger");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_opt_class();
    v14 = v13;
    -[TFBetaApplicationProxy bundleIdentifier](self, "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFBetaApplicationProxy logKey](self, "logKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v31 = v13;
    v32 = 2114;
    v33 = v15;
    v34 = 2112;
    v35 = v16;
    v36 = 2112;
    v37 = v8;
    v38 = 2112;
    v39 = v9;
    v40 = 2112;
    v41 = v10;
    _os_log_impl(&dword_2174E1000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] updateLocalizedTestNotes               localizedTestNotes = %@ |              shortVersionString = %@ |              bundleVersion = %@ ", buf, 0x3Eu);

  }
  v17 = (void *)MEMORY[0x24BE04510];
  -[TFBetaApplicationProxy bundleIdentifier](self, "bundleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "versionWithBundleID:bundleVersion:platform:andShortVersion:", v18, v10, -[TFBetaApplicationProxy _asdAppPlatform](self, "_asdAppPlatform"), v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_opt_class();
  -[TFBetaApplicationProxy bundleIdentifier](self, "bundleIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFBetaApplicationProxy logKey](self, "logKey");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE04600], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __68__TFBetaApplicationProxy_updateLocalizedTestNotes_forVersion_build___block_invoke;
  v26[3] = &unk_24D794790;
  v28 = v22;
  v29 = v20;
  v27 = v21;
  v24 = v22;
  v25 = v21;
  objc_msgSend(v23, "updateTestNotes:forVersion:withCompletionHandler:", v8, v19, v26);

}

void __68__TFBetaApplicationProxy_updateLocalizedTestNotes_forVersion_build___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "generatedLogger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = a1[5];
      v6 = a1[6];
      v8 = a1[4];
      objc_msgSend(v3, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138544130;
      v11 = v6;
      v12 = 2114;
      v13 = v8;
      v14 = 2112;
      v15 = v7;
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_2174E1000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@:%@] Failed to update test notes. error = %@", (uint8_t *)&v10, 0x2Au);

    }
  }

}

- (void)overwriteMetadataForInstalledVersion:(id)a3 build:(id)a4 withLocalizedDisplayNames:(id)a5 localizedTestNotes:(id)a6 primaryLocaleKey:(id)a7 developerName:(id)a8 expirationDate:(id)a9 iconUrlTemplate:(id)a10 testerEmail:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  _QWORD v60[4];
  id v61;
  id v62;
  uint64_t v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  id v71;
  __int16 v72;
  id v73;
  __int16 v74;
  id v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  id v79;
  __int16 v80;
  id v81;
  __int16 v82;
  id v83;
  __int16 v84;
  id v85;
  __int16 v86;
  id v87;
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v18 = a4;
  v54 = a5;
  v19 = a6;
  v59 = a7;
  v58 = a8;
  v20 = a9;
  v57 = a10;
  v56 = a11;
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "generatedLogger");
  v22 = objc_claimAutoreleasedReturnValue();
  v55 = v19;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = v18;
    v24 = (void *)objc_opt_class();
    v51 = v24;
    -[TFBetaApplicationProxy bundleIdentifier](self, "bundleIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFBetaApplicationProxy logKey](self, "logKey");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138546178;
    v65 = v24;
    v18 = v23;
    v66 = 2114;
    v67 = v25;
    v68 = 2112;
    v69 = v26;
    v70 = 2112;
    v71 = v17;
    v72 = 2112;
    v73 = v23;
    v74 = 2112;
    v75 = v54;
    v76 = 2112;
    v77 = v55;
    v78 = 2112;
    v79 = v59;
    v80 = 2112;
    v81 = v58;
    v82 = 2112;
    v83 = v20;
    v84 = 2112;
    v85 = v57;
    v86 = 2112;
    v87 = v56;
    _os_log_impl(&dword_2174E1000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] overwriteMetadataForInstalledVersion               shortVersionString = %@ |              bundleVersion = %@ |              localizedDisplayNames = %@ |              localizedTestNotes = %@ |              primaryLocaleKey = %@ |              developerName = %@ |              expirationDate = %@ |              iconUrlTemplate = %@ |              testerEmail = %@", buf, 0x7Au);

    v19 = v55;
  }

  v27 = (void *)MEMORY[0x24BE04510];
  -[TFBetaApplicationProxy bundleIdentifier](self, "bundleIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "versionWithBundleID:bundleVersion:platform:andShortVersion:", v28, v18, -[TFBetaApplicationProxy _asdAppPlatform](self, "_asdAppPlatform"), v17);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE04600], "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "getLaunchInfoForVersion:", v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    v32 = v54;
    if (v54)
    {
      objc_msgSend(v31, "displayNames");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setLocalizedNames:", v54);

    }
    if (v19)
      objc_msgSend(v31, "setLocalizedTestNotes:", v19);
    if (v59)
    {
      objc_msgSend(v31, "displayNames");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setPrimaryLocale:", v59);

    }
    v52 = v17;
    if (v58)
      objc_msgSend(v31, "setArtistName:");
    v35 = v29;
    if (v20)
      objc_msgSend(v31, "setExpirationDate:", v20);
    v36 = v20;
    if (v57)
      objc_msgSend(v31, "setIconURLTemplate:", v57);
    v37 = v18;
    if (v56)
      objc_msgSend(v31, "setTesterEmail:");
    v38 = objc_opt_class();
    -[TFBetaApplicationProxy bundleIdentifier](self, "bundleIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFBetaApplicationProxy logKey](self, "logKey");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE04600], "sharedInstance");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = MEMORY[0x24BDAC760];
    v60[1] = 3221225472;
    v60[2] = __188__TFBetaApplicationProxy_overwriteMetadataForInstalledVersion_build_withLocalizedDisplayNames_localizedTestNotes_primaryLocaleKey_developerName_expirationDate_iconUrlTemplate_testerEmail___block_invoke;
    v60[3] = &unk_24D794790;
    v62 = v40;
    v63 = v38;
    v61 = v39;
    v42 = v40;
    v43 = v39;
    objc_msgSend(v41, "setLaunchInfo:withCompletionHandler:", v31, v60);

    v18 = v37;
    v20 = v36;
    v29 = v35;
    v17 = v52;
  }
  else
  {
    +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
    v43 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "generatedLogger");
    v42 = objc_claimAutoreleasedReturnValue();
    v32 = v54;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v53 = v17;
      v44 = v29;
      v45 = v20;
      v46 = v18;
      v47 = (void *)objc_opt_class();
      v50 = v47;
      -[TFBetaApplicationProxy bundleIdentifier](self, "bundleIdentifier");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[TFBetaApplicationProxy logKey](self, "logKey");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v65 = v47;
      v18 = v46;
      v20 = v45;
      v29 = v44;
      v17 = v53;
      v66 = 2114;
      v67 = v48;
      v68 = 2112;
      v69 = v49;
      _os_log_impl(&dword_2174E1000, v42, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@:%@] Failed to find beta app launch info to overwrite", buf, 0x20u);

    }
  }

}

void __188__TFBetaApplicationProxy_overwriteMetadataForInstalledVersion_build_withLocalizedDisplayNames_localizedTestNotes_primaryLocaleKey_developerName_expirationDate_iconUrlTemplate_testerEmail___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "generatedLogger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = a1[5];
      v6 = a1[6];
      v8 = a1[4];
      objc_msgSend(v3, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138544130;
      v11 = v6;
      v12 = 2114;
      v13 = v8;
      v14 = 2112;
      v15 = v7;
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_2174E1000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@:%@] Failed to update launch info. error = %@", (uint8_t *)&v10, 0x2Au);

    }
  }

}

- (int64_t)_asdAppPlatform
{
  int64_t result;

  result = self->_bundleAppPlatform;
  if ((unint64_t)result > 1)
    return objc_msgSend(MEMORY[0x24BE04510], "defaultPlatform");
  return result;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (int64_t)bundleAppPlatform
{
  return self->_bundleAppPlatform;
}

- (void)setBundleAppPlatform:(int64_t)a3
{
  self->_bundleAppPlatform = a3;
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
}

@end
