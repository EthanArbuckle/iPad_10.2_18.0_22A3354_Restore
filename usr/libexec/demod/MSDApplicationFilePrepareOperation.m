@implementation MSDApplicationFilePrepareOperation

- (id)methodSelectors
{
  unsigned int v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = +[MSDOperationContext downloadOnly](MSDOperationContext, "downloadOnly");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", "_waitForPricingAppUpdateIfNeeded"));
  v4 = objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", "_determineAppInstallNecessity"));
  v5 = (void *)v4;
  if (v2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v3, v4, 0));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", "_prepareStagingArea"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v3, v5, v7, 0));

  }
  return v6;
}

- (BOOL)_waitForPricingAppUpdateIfNeeded
{
  void *v2;
  unsigned int v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v8[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v3 = objc_msgSend(v2, "pricingAppUpdateDeferred");

  if (v3)
  {
    v4 = sub_1000604F0();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Waiting for Pricing app to finish its own update.", v8, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
    objc_msgSend(v6, "waitForPricing:forReboot:", 0, 0);

  }
  return 1;
}

- (BOOL)_determineAppInstallNecessity
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  int v23;
  void *v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAppHelper sharedInstance](MSDAppHelper, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "installedApps"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));

  if (objc_msgSend(v4, "containsObject:", v6))
  {
    v7 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138543362;
      v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "App is already installed: %{public}@", (uint8_t *)&v23, 0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAppHelper sharedInstance](MSDAppHelper, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundlePathForInstalledApp:", v6));

    v11 = v10 != 0;
    if (v10)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDiOSApp appWithPath:](MSDiOSApp, "appWithPath:", v10));
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uniqueIdentifier"));

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uniqueIdentifier"));
      v16 = objc_msgSend(v15, "isEqualToString:", v13);

      -[MSDOperation setSkipped:](self, "setSkipped:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
      objc_msgSend(v17, "setAlreadyInstalled:", 1);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
      objc_msgSend(v18, "setCurrentUniqueIdentifier:", v13);

    }
    else
    {
      v22 = sub_1000604F0();
      v13 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_1000C11BC((uint64_t)v6, v13);
    }

  }
  else
  {
    -[MSDOperation setSkipped:](self, "setSkipped:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
    objc_msgSend(v19, "setAlreadyInstalled:", 0);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
    objc_msgSend(v20, "setCurrentUniqueIdentifier:", 0);

    v11 = 1;
  }

  return v11;
}

@end
