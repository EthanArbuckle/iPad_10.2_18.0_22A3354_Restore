@implementation APPCPolicySettings

- (BOOL)dataFetchedFromServer
{
  return byte_100268800;
}

+ (id)loadDeviceHeaderInfo
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v16;
  void *v17;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSISO8601DateFormatter apDefaultSharedFormatter](NSISO8601DateFormatter, "apDefaultSharedFormatter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[APDeviceInfo current](APDeviceInfo, "current"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[APIDAccountProvider privateUserAccount](APIDAccountProvider, "privateUserAccount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storefront"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userAgentStringForBundleID:storefront:", CFSTR("com.apple.ap.promotedcontentd"), v6));

  v17 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storefront"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "systemVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "systemName"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceModel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "buildVersion"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringFromDate:", v12));

  if (objc_msgSend(v7, "length"))
    objc_msgSend(v2, "setObject:forKey:", v7, CFSTR("User-Agent"));
  if (objc_msgSend(v8, "length"))
    objc_msgSend(v2, "setObject:forKey:", v8, CFSTR("storefront"));
  if (objc_msgSend(v9, "length"))
    objc_msgSend(v2, "setObject:forKey:", v9, CFSTR("osVersion"));
  if (objc_msgSend(v10, "length"))
    objc_msgSend(v2, "setObject:forKey:", v10, CFSTR("osPlatform"));
  if (objc_msgSend(v16, "length"))
    objc_msgSend(v2, "setObject:forKey:", v16, CFSTR("device"));
  if (objc_msgSend(CFSTR("com.apple.ap.promotedcontentd"), "length"))
    objc_msgSend(v2, "setObject:forKey:", CFSTR("com.apple.ap.promotedcontentd"), CFSTR("bundleId"));
  if (objc_msgSend(v11, "length"))
    objc_msgSend(v2, "setObject:forKey:", v11, CFSTR("osBuild"));
  if (objc_msgSend(v13, "length"))
    objc_msgSend(v2, "setObject:forKey:", v13, CFSTR("timestamp"));
  v14 = objc_msgSend(v2, "copy");

  return v14;
}

+ (id)policySettingsURL
{
  id v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  id *v7;
  id v8;
  void *v9;
  void *v10;

  v2 = kAPServerEnvironmentProductionBaseURL;
  if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))
  {
    v3 = objc_alloc((Class)NSUserDefaults);
    v4 = objc_msgSend(v3, "initWithSuiteName:", APDefaultsBundleID);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringForKey:", kAPServerEnvironmentKey));
    v6 = v5;
    if (!v5 || (objc_msgSend(v5, "isEqualToString:", kAPServerEnvironmentProduction) & 1) != 0)
      goto LABEL_13;
    if ((objc_msgSend(v6, "isEqualToString:", kAPServerEnvironmentQE1) & 1) != 0)
    {
      v7 = (id *)&kAPDisplayServerQE1Base;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", kAPServerEnvironmentQE2) & 1) != 0)
    {
      v7 = (id *)&kAPDisplayServerQE2Base;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", kAPServerEnvironmentQE3) & 1) != 0)
    {
      v7 = (id *)&kAPDisplayServerQE3Base;
    }
    else
    {
      if (!objc_msgSend(v6, "isEqualToString:", kAPServerEnvironmentQE4))
      {
LABEL_13:

        goto LABEL_14;
      }
      v7 = (id *)&kAPDisplayServerQE4Base;
    }
    v8 = *v7;

    v2 = v8;
    goto LABEL_13;
  }
LABEL_14:
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByAppendingString:", CFSTR("2/policy/display")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v9));

  return v10;
}

+ (id)storageWithDefaultValues:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "policySettingsURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "loadDeviceHeaderInfo"));
  v7 = objc_msgSend(objc_alloc((Class)APSettingsStorageServer), "initWithURL:headers:defaultValues:", v5, v6, v4);

  byte_100268800 = objc_msgSend(v7, "didFetchFromServer");
  return v7;
}

+ (id)defaultValues
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16[0] = CFSTR("value");
  v16[1] = CFSTR("adFormatType");
  v17[0] = &off_100228D00;
  v17[1] = CFSTR("carousel");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 2));
  objc_msgSend(v12, "addObject:", v13);
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("timer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14[0] = CFSTR("value");
  v14[1] = CFSTR("adFormatType");
  v15[0] = &off_100228D18;
  v15[1] = CFSTR("carousel");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2));
  objc_msgSend(v5, "addObject:", v6);
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("timer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("spacing"));

  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("adSessionBefore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("spacing"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("adsAllowed"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("adSessionAfter"));

  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("policy"));
  return v2;
}

@end
