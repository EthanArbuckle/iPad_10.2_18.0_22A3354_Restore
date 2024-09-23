@implementation MSDServiceResolutionHelper

+ (id)createMSResolutionInfoObject:(id)a3 homeUserID:(id)a4 sharedUserID:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPublicDBManager getCachedPublicInfoForBundleID:](MSDPublicDBManager, "getCachedPublicInfoForBundleID:", v9));
  v11 = objc_alloc((Class)MSServiceAppInfo);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "serviceName"));
  v13 = objc_msgSend(v11, "initWithServiceName:serviceBundleID:", v12, v9);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleIDS"));
  v15 = objc_msgSend(v14, "copy");
  objc_msgSend(v13, "setAlternateBundleIDS:", v15);

  v16 = objc_msgSend(objc_alloc((Class)MSUserAccountInfo), "initWithHomeUserID:sharedUserID:", v8, v7);
  v17 = objc_msgSend(objc_alloc((Class)MSServiceResolutionInfo), "initWithServiceAppInfo:userAccountInfo:", v13, v16);

  return v17;
}

@end
