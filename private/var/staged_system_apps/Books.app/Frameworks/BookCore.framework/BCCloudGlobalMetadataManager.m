@implementation BCCloudGlobalMetadataManager

+ (void)fetchMetadataBoolForKey:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BDSCloudGlobalMetadataManager sharedManager](BDSCloudGlobalMetadataManager, "sharedManager"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_3B654;
  v9[3] = &unk_28D2A0;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "metadataValueForKey:completion:", v6, v9);

}

+ (void)fetchMetadataStringForKey:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[BDSCloudGlobalMetadataManager sharedManager](BDSCloudGlobalMetadataManager, "sharedManager"));
  objc_msgSend(v7, "metadataValueForKey:completion:", v6, v5);

}

+ (void)updateMetadataBool:(BOOL)a3 forKey:(id)a4 completion:(id)a5
{
  __CFString *v7;
  __CFString *v8;
  id v9;
  id v10;
  id v11;

  v7 = CFSTR("N");
  if (a3)
    v7 = CFSTR("Y");
  v8 = v7;
  v9 = a5;
  v10 = a4;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[BDSCloudGlobalMetadataManager sharedManager](BDSCloudGlobalMetadataManager, "sharedManager"));
  objc_msgSend(v11, "setMetadataValue:forKey:completion:", v8, v10, v9);

}

+ (void)updateMetadataString:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[BDSCloudGlobalMetadataManager sharedManager](BDSCloudGlobalMetadataManager, "sharedManager"));
  objc_msgSend(v10, "setMetadataValue:forKey:completion:", v9, v8, v7);

}

@end
