@implementation APIDAccountsSettings

+ (id)defaultValues
{
  id v2;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSString *v19;
  void *v20;
  NSString *v21;
  void *v22;
  void *v23;
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[16];
  _QWORD v28[16];

  v2 = objc_msgSend(CFSTR("BAAAAAAD"), "length");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", 0, v2, CFSTR("BAAAAAAD")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByReplacingCharactersInRange:withString:", 0, v2, CFSTR("BAAAAAAD")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", 0, v2, CFSTR("BAAAAAAD")));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByReplacingCharactersInRange:withString:", 0, v2, CFSTR("BAAAAAAD")));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByReplacingCharactersInRange:withString:", 0, v2, CFSTR("BAAAAAAD")));

  v27[0] = CFSTR("iTunesDSID");
  v27[1] = CFSTR("isChild");
  v28[0] = CFSTR("0");
  v28[1] = &__kCFBooleanFalse;
  v27[2] = CFSTR("isAdolescent");
  v27[3] = CFSTR("isAdult");
  v28[2] = &__kCFBooleanFalse;
  v28[3] = &__kCFBooleanFalse;
  v27[4] = CFSTR("ageUnknown");
  v27[5] = CFSTR("sensitiveContentEligible");
  v28[4] = &__kCFBooleanTrue;
  v28[5] = &__kCFBooleanFalse;
  v27[6] = CFSTR("isManagedAccount");
  v27[7] = CFSTR("iCloudDSID");
  v28[6] = &__kCFBooleanFalse;
  v28[7] = CFSTR("0");
  v27[8] = CFSTR("DPID");
  v27[9] = CFSTR("segmentData");
  v28[8] = &stru_100219118;
  v28[9] = &stru_100219118;
  v27[10] = CFSTR("deviceNewsPlusSubscriberID");
  v27[11] = CFSTR("anonymousDemandID");
  v28[10] = v5;
  v28[11] = v8;
  v27[12] = CFSTR("toroID");
  v27[13] = CFSTR("iAdID");
  v28[12] = v11;
  v28[13] = v14;
  v27[14] = CFSTR("contentID");
  v27[15] = CFSTR("isNoServicesRegion");
  v28[14] = v17;
  v28[15] = &__kCFBooleanFalse;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 16));
  v19 = NSStringFromSelector("IDAccountsRecord");
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v25[0] = v20;
  v26[0] = v18;
  v21 = NSStringFromSelector("storefront");
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v25[1] = v22;
  v26[1] = CFSTR("NONE");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 2));

  return v23;
}

+ (id)storageWithDefaultValues:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)APSettingsStorageKeychain), "initWithDefaultValues:", v3);

  return v4;
}

@end
