@implementation MSDProvisioningProfilePrepareOperation

- (id)methodSelectors
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  if (+[MSDOperationContext downloadOnly](MSDOperationContext, "downloadOnly"))
  {
    v3 = (void *)objc_opt_new(NSArray, v2);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", "_determineAppInstallNecessity"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", "_prepareStagingArea"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v4, v5, 0));

  }
  return v3;
}

- (int64_t)type
{
  return 1;
}

- (BOOL)_determineAppInstallNecessity
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  int v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  if (+[MSDProvisioningProfileUtils isProvisioningProfileInstalled:](MSDProvisioningProfileUtils, "isProvisioningProfileInstalled:", v4))
  {
    v5 = sub_1000604F0();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Provisioning profile with UUID already installed: %{public}@", (uint8_t *)&v8, 0xCu);
    }

    -[MSDOperation setSkipped:](self, "setSkipped:", 1);
  }

  return 1;
}

@end
