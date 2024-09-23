@implementation BAInstallationSourceUtilities

+ (int64_t)installationSourceFromAuditToken:(id *)a3 applicationIdentifier:(id)a4
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int64_t v9;
  id v10;
  NSObject *v11;

  v4 = a4;
  v5 = sub_1000128F4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_100035604((uint64_t)v4, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", v4));
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "profileValidated"))
      v9 = 2;
    else
      v9 = 1;
  }
  else
  {
    v10 = sub_1000128F4();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100035590((uint64_t)v4, v11);

    v9 = 3;
  }

  return v9;
}

@end
