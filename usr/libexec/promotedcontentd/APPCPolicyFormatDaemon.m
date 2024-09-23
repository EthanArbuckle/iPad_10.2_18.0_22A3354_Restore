@implementation APPCPolicyFormatDaemon

+ (BOOL)storeAdPolicies:(id)a3
{
  id v3;
  id v4;
  id *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v10;
  uint64_t v11;
  uint8_t buf[4];
  id v13;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)APStorageManager), "initWithPathPrefix:", CFSTR("a/p/"));
  if (objc_msgSend(v3, "count"))
  {
    v10 = 0;
    v5 = (id *)&v10;
    objc_msgSend(v4, "storeObject:atPath:error:", v3, CFSTR("APAdPolicy"), &v10);
  }
  else
  {
    v11 = 0;
    v5 = (id *)&v11;
    objc_msgSend(v4, "removeObjectAtPath:error:", CFSTR("APAdPolicy"), &v11);
  }
  v6 = *v5;
  if (v6)
  {
    v7 = APLogForCategory(1);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Error storing EFS Settings object for policy: %{public}@", buf, 0xCu);
    }

  }
  return v6 == 0;
}

+ (id)adPolicies
{
  id v2;
  NSSet *v3;
  void *v4;
  unsigned int v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;

  v2 = objc_msgSend(objc_alloc((Class)APStorageManager), "initWithPathPrefix:", CFSTR("a/p/"));
  v3 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(APPCPolicyData));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  +[APSupportedSecureEncodedClass addClasses:](APSupportedSecureEncodedClass, "addClasses:", v4);
  v13 = 0;
  v5 = objc_msgSend(v2, "fileExistsAtPath:error:", CFSTR("APAdPolicy"), &v13);
  v6 = v13;
  if (v6)
  {
    v7 = APLogForCategory(1);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Error finding EFS Settings object for policy: %{public}@", buf, 0xCu);
    }

  }
  if (v5)
  {
    v12 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectStoredAtPath:error:", CFSTR("APAdPolicy"), &v12));
    v10 = v12;

    v6 = v10;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
