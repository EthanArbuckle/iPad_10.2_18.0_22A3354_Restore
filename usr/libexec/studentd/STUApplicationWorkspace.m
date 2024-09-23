@implementation STUApplicationWorkspace

- (STUApplicationWorkspace)initWithPrimitives:(id)a3 device:(id)a4
{
  id v7;
  id v8;
  STUApplicationWorkspace *v9;
  STUApplicationWorkspace *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)STUApplicationWorkspace;
  v9 = -[STUApplicationWorkspace init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_primitives, a3);
    objc_storeStrong((id *)&v10->_device, a4);
  }

  return v10;
}

- (BOOL)isBundleIdentifierLaunchable:(id)a3 error:(id *)a4
{
  return -[STUApplicationWorkspace isBundleIdentifierLaunchable:returnDMFError:error:](self, "isBundleIdentifierLaunchable:returnDMFError:error:", a3, 0, a4);
}

- (BOOL)isBundleIdentifierLaunchable:(id)a3 returnDMFError:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v9;
  STUAppLaunchabilityInfo *v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  STUAppLaunchabilityInfo *v14;
  unsigned __int8 v15;
  void *v17;
  NSString *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  id v22;

  v6 = a4;
  v9 = a3;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v18 = NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUApplicationWorkspace.m"), 50, CFSTR("%@ must be called from the main thread"), v19);

    if (v9)
      goto LABEL_3;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUApplicationWorkspace.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

LABEL_3:
  v10 = (STUAppLaunchabilityInfo *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->mCachedInfoByBundleIdentifier, "objectForKeyedSubscript:", v9));
  v11 = sub_100047428();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138543362;
      v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Cache hit for launchability info for %{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (v13)
    {
      *(_DWORD *)buf = 138543362;
      v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Cache miss for launchability info for %{public}@", buf, 0xCu);
    }

    v14 = [STUAppLaunchabilityInfo alloc];
    v12 = objc_claimAutoreleasedReturnValue(-[STUApplicationWorkspace primitives](self, "primitives"));
    v10 = -[STUAppLaunchabilityInfo initWithBundleIdentifier:primitives:](v14, "initWithBundleIdentifier:primitives:", v9, v12);
  }

  v15 = -[STUAppLaunchabilityInfo isLaunchableReturningDMFError:error:](v10, "isLaunchableReturningDMFError:error:", v6, a5);
  return v15;
}

- (BOOL)isUsingCachedData
{
  BOOL v2;
  void *v3;

  if (self->mCachedInfoByBundleIdentifier)
    return 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUApplicationWorkspace cachedDefaultWebBrowserBundleIdentifier](self, "cachedDefaultWebBrowserBundleIdentifier"));
  v2 = v3 != 0;

  return v2;
}

- (void)startUsingCachedData
{
  id v4;
  NSObject *v5;
  NSDictionary *v6;
  NSDictionary *mCachedInfoByBundleIdentifier;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  uint8_t buf[16];

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v12 = NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUApplicationWorkspace.m"), 72, CFSTR("%@ must be called from the main thread"), v13);

  }
  if (!-[STUApplicationWorkspace isUsingCachedData](self, "isUsingCachedData"))
  {
    v4 = sub_100047428();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Starting to use cached data", buf, 2u);
    }

    v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[STUApplicationWorkspace buildCache](self, "buildCache"));
    mCachedInfoByBundleIdentifier = self->mCachedInfoByBundleIdentifier;
    self->mCachedInfoByBundleIdentifier = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUApplicationWorkspace primitives](self, "primitives"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "launchServicesPrimitives"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "defaultWebBrowserBundleIdentifier"));
    -[STUApplicationWorkspace setCachedDefaultWebBrowserBundleIdentifier:](self, "setCachedDefaultWebBrowserBundleIdentifier:", v10);

  }
}

- (void)stopUsingCachedData
{
  id v4;
  NSObject *v5;
  NSDictionary *mCachedInfoByBundleIdentifier;
  void *v7;
  NSString *v8;
  void *v9;
  uint8_t buf[16];

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v8 = NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUApplicationWorkspace.m"), 84, CFSTR("%@ must be called from the main thread"), v9);

  }
  if (-[STUApplicationWorkspace isUsingCachedData](self, "isUsingCachedData"))
  {
    v4 = sub_100047428();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "No longer using cached data", buf, 2u);
    }

    mCachedInfoByBundleIdentifier = self->mCachedInfoByBundleIdentifier;
    self->mCachedInfoByBundleIdentifier = 0;

    -[STUApplicationWorkspace setCachedDefaultWebBrowserBundleIdentifier:](self, "setCachedDefaultWebBrowserBundleIdentifier:", 0);
  }
}

- (id)buildCache
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  STUAppLaunchabilityInfo *v12;
  void *v13;
  STUAppLaunchabilityInfo *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = objc_opt_new(NSMutableDictionary);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUApplicationWorkspace device](self, "device", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "installedApplicationInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRKApplicationInfo bundleIdentifiersFromDictionaryRepresentations:](CRKApplicationInfo, "bundleIdentifiersFromDictionaryRepresentations:", v5));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v10);
        v12 = [STUAppLaunchabilityInfo alloc];
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[STUApplicationWorkspace primitives](self, "primitives"));
        v14 = -[STUAppLaunchabilityInfo initWithBundleIdentifier:primitives:](v12, "initWithBundleIdentifier:primitives:", v11, v13);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v14, v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v15 = -[NSMutableDictionary copy](v3, "copy");
  return v15;
}

- (NSString)cachedDefaultWebBrowserBundleIdentifier
{
  return self->_cachedDefaultWebBrowserBundleIdentifier;
}

- (void)setCachedDefaultWebBrowserBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (STUPrimitives)primitives
{
  return self->_primitives;
}

- (CRKDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_primitives, 0);
  objc_storeStrong((id *)&self->_cachedDefaultWebBrowserBundleIdentifier, 0);
  objc_storeStrong((id *)&self->mCachedInfoByBundleIdentifier, 0);
}

@end
