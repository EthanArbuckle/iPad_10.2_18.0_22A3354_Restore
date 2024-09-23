@implementation RAPWebBundleConfigurationManager

- (id)configuration
{
  void *v2;
  void *v3;
  NSSet *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  RAPWebBundleConfiguration *v10;
  id v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("RAPWebBundleConfigurationManagerKey")));
  if (!v3)
    goto LABEL_8;
  v4 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(RAPWebBundleConfiguration), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v14 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v5, v3, &v14));
  v7 = v14;

  if (v7)
  {
    v8 = sub_10043292C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Web Bundle Configuration Retrieve Error: %@", buf, 0xCu);
    }

  }
  if (v6)
  {
    v10 = (RAPWebBundleConfiguration *)objc_msgSend(v6, "copy");

  }
  else
  {
LABEL_8:
    v11 = sub_10043292C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Creating new RAPWebBundleConfiguration...", buf, 2u);
    }

    v10 = objc_alloc_init(RAPWebBundleConfiguration);
  }

  return v10;
}

+ (void)saveConfiguration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v9 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v9));

  v6 = v9;
  if (v6)
  {
    v7 = sub_10043292C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Web Bundle Configuration Save Error: %@", buf, 0xCu);
    }

  }
  else
  {
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("RAPWebBundleConfigurationManagerKey"));
    objc_msgSend(v4, "synchronize");
  }

}

@end
