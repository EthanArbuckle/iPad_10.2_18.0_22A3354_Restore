@implementation TFBetaLaunchHandleConfiguration

- (TFBetaLaunchHandleConfiguration)initWithBundleURL:(id)a3 preloadingLaunchInfo:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  TFBetaLaunchHandleConfiguration *v9;

  v6 = a4;
  +[TFBundle bundleIdentifierForBundleURL:](TFBundle, "bundleIdentifierForBundleURL:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  v9 = -[TFBetaLaunchHandleConfiguration initWithBundleIdentifier:preloadingLaunchInfo:](self, "initWithBundleIdentifier:preloadingLaunchInfo:", v8, v6);
  return v9;
}

- (TFBetaLaunchHandleConfiguration)initWithBundleURL:(id)a3
{
  return -[TFBetaLaunchHandleConfiguration initWithBundleURL:preloadingLaunchInfo:](self, "initWithBundleURL:preloadingLaunchInfo:", a3, 0);
}

- (TFBetaLaunchHandleConfiguration)initWithBundleIdentifier:(id)a3 preloadingLaunchInfo:(id)a4
{
  id v6;
  id v7;
  TFBetaLaunchHandleConfiguration *v8;
  uint64_t v9;
  NSString *bundleIdentifier;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TFBetaLaunchHandleConfiguration;
  v8 = -[TFBetaLaunchHandleConfiguration init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v9;

    objc_storeStrong((id *)&v8->_launchInfo, a4);
  }

  return v8;
}

- (TFBetaLaunchHandleConfiguration)initWithBundleIdentifier:(id)a3
{
  return -[TFBetaLaunchHandleConfiguration initWithBundleIdentifier:preloadingLaunchInfo:](self, "initWithBundleIdentifier:preloadingLaunchInfo:", a3, 0);
}

- (id)encodedAsUserInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 1);
  -[TFBetaLaunchHandleConfiguration bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("CONFIG_BUNDLE_ID"));

  -[TFBetaLaunchHandleConfiguration launchInfo](self, "launchInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD1618];
    -[TFBetaLaunchHandleConfiguration launchInfo](self, "launchInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v6, "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v17;

    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("CONFIG_LAUNCH_INFO_DATA"));
    }
    else
    {
      +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "generatedLogger");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = (void *)objc_opt_class();
        v13 = v12;
        -[TFBetaLaunchHandleConfiguration bundleIdentifier](self, "bundleIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v19 = v12;
        v20 = 2114;
        v21 = v14;
        v22 = 2112;
        v23 = v15;
        _os_log_impl(&dword_2174E1000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode launch info. error = %@", buf, 0x20u);

      }
    }

  }
  return v3;
}

+ (id)configurationFromUserInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  TFBetaLaunchHandleConfiguration *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CONFIG_BUNDLE_ID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CONFIG_LAUNCH_INFO_DATA"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v15 = 0;
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v15);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v15;
      if (v7)
      {
        +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "generatedLogger");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = (void *)objc_opt_class();
          v11 = v10;
          objc_msgSend(v7, "localizedDescription");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v17 = v10;
          v18 = 2114;
          v19 = v4;
          v20 = 2112;
          v21 = v12;
          _os_log_impl(&dword_2174E1000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to encode launch info. error = %@", buf, 0x20u);

        }
      }

    }
    else
    {
      v6 = 0;
    }
    v13 = -[TFBetaLaunchHandleConfiguration initWithBundleIdentifier:preloadingLaunchInfo:]([TFBetaLaunchHandleConfiguration alloc], "initWithBundleIdentifier:preloadingLaunchInfo:", v4, v6);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TFBetaLaunchHandleConfiguration *v4;
  void *v5;
  TFBetaLaunchHandleConfiguration *v6;

  v4 = [TFBetaLaunchHandleConfiguration alloc];
  -[TFBetaLaunchHandleConfiguration bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TFBetaLaunchHandleConfiguration initWithBundleIdentifier:](v4, "initWithBundleIdentifier:", v5);

  return v6;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (ASDBetaAppLaunchInfo)launchInfo
{
  return self->_launchInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchInfo, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
