@implementation JSADevice

+ (JSAScreen)mainScreen
{
  return objc_alloc_init(JSAScreen);
}

+ (NSDictionary)diskUsage
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[5];
  _QWORD v13[5];

  v2 = (void *)MGCopyAnswer(CFSTR("DiskUsage"), 0);
  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v12[0] = CFSTR("totalSystemCapacity");
  v12[1] = CFSTR("totalSystemAvailable");
  v13[0] = kMGQDiskUsageTotalSystemCapacity;
  v13[1] = kMGQDiskUsageTotalSystemAvailable;
  v12[2] = CFSTR("totalDataCapacity");
  v12[3] = CFSTR("totalDataAvailable");
  v13[2] = kMGQDiskUsageTotalDataCapacity;
  v13[3] = kMGQDiskUsageTotalDataAvailable;
  v12[4] = CFSTR("totalDiskCapacity");
  v13[4] = kMGQDiskUsageTotalDiskCapacity;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 5));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_BF94;
  v9[3] = &unk_9E280;
  v10 = v2;
  v11 = v3;
  v5 = v3;
  v6 = v2;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);
  v7 = objc_msgSend(v5, "copy");

  return (NSDictionary *)v7;
}

+ (void)diskUsageAsync:(id)a3
{
  id v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  global_queue = dispatch_get_global_queue(17, 0);
  v6 = objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_C0D0;
  v8[3] = &unk_9E2A8;
  v9 = v4;
  v10 = a1;
  v7 = v4;
  dispatch_async(v6, v8);

}

+ (NSString)systemVersion
{
  return (NSString *)+[AMSDevice productVersion](AMSDevice, "productVersion");
}

+ (NSString)userAgent
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AMSUserAgent userAgentForProcessInfo:](AMSUserAgent, "userAgentForProcessInfo:", v2));

  return (NSString *)v3;
}

+ (NSString)guid
{
  return (NSString *)+[AMSDevice deviceGUID](AMSDevice, "deviceGUID");
}

+ (NSString)model
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "model"));

  return (NSString *)v3;
}

+ (NSString)platform
{
  void *v2;
  void *v3;
  __CFString *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "model"));
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));

  if ((-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("ipad")) & 1) == 0
    && (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("iphone")) & 1) == 0)
  {

    v4 = CFSTR("iphone");
  }
  return (NSString *)v4;
}

+ (NSString)productType
{
  return (NSString *)sub_C2DC((uint64_t)JSADevice, (uint64_t)CFSTR("ProductType"));
}

+ (NSArray)preferredLanguages
{
  return +[NSLocale preferredLanguages](NSLocale, "preferredLanguages");
}

+ (NSArray)preferredLocalizations
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "preferredLocalizations"));

  return (NSArray *)v3;
}

+ (NSString)localeIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localeIdentifier"));

  return (NSString *)v3;
}

+ (BOOL)isInternalBuild
{
  return MGGetBoolAnswer(CFSTR("InternalBuild"), a2);
}

+ (BOOL)wapiCapability
{
  return MGGetBoolAnswer(CFSTR("wapi"), a2);
}

@end
