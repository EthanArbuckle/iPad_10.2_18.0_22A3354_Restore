@implementation FMDSupportedAccessoryRegistry

+ (id)defaultStorageLocation
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init((Class)FMInternalFileContainer);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "url"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fm_preferencesPathURLForDomain:", CFSTR("com.apple.icloud.findmydeviced.supportedaccessories")));

  return v4;
}

- (FMDSupportedAccessoryRegistry)initWithDelegate:(id)a3
{
  id v4;
  FMDSupportedAccessoryRegistry *v5;
  dispatch_queue_t v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  void **v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27;
  id v28;
  id location;
  objc_super v30;
  uint8_t buf[4];
  void *v32;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)FMDSupportedAccessoryRegistry;
  v5 = -[FMDSupportedAccessoryRegistry init](&v30, "init");
  if (v5)
  {
    v6 = dispatch_queue_create("FMDSupportedAccessoryRegistry.serialQueue", 0);
    -[FMDSupportedAccessoryRegistry setSerialQueue:](v5, "setSerialQueue:", v6);

    -[FMDSupportedAccessoryRegistry setSupportedAccessories:](v5, "setSupportedAccessories:", &__NSDictionary0__struct);
    -[FMDSupportedAccessoryRegistry setDelegate:](v5, "setDelegate:", v4);
    v7 = objc_alloc((Class)FMDataArchiver);
    v9 = objc_msgSend((id)objc_opt_class(v5, v8), "defaultStorageLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = objc_msgSend(v7, "initWithFileURL:", v10);
    -[FMDSupportedAccessoryRegistry setDataArchiver:](v5, "setDataArchiver:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessoryRegistry dataArchiver](v5, "dataArchiver"));
    objc_msgSend(v12, "setDataProtectionClass:", 4);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessoryRegistry dataArchiver](v5, "dataArchiver"));
    objc_msgSend(v13, "setBackedUp:", 0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessoryRegistry dataArchiver](v5, "dataArchiver"));
    objc_msgSend(v14, "setCreateDirectories:", 1);

    -[FMDSupportedAccessoryRegistry setDefaultAccessoriesEnabled:](v5, "setDefaultAccessoriesEnabled:", 1);
    -[FMDSupportedAccessoryRegistry readSupportedAccessoriesFromDisk](v5, "readSupportedAccessoriesFromDisk");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessoryRegistry defaultSupportedAccessoriesIfEnabled:](v5, "defaultSupportedAccessoriesIfEnabled:", -[FMDSupportedAccessoryRegistry defaultAccessoriesEnabled](v5, "defaultAccessoriesEnabled")));
    objc_initWeak(&location, v5);
    v16 = objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessoryRegistry serialQueue](v5, "serialQueue"));
    v22 = _NSConcreteStackBlock;
    v23 = 3221225472;
    v24 = sub_1000BBE2C;
    v25 = &unk_1002C21C8;
    objc_copyWeak(&v28, &location);
    v17 = v15;
    v26 = v17;
    v27 = v4;
    dispatch_async(v16, &v22);

    v18 = sub_1000031B8();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessoryRegistry supportedAccessories](v5, "supportedAccessories", v22, v23, v24, v25, v26));
      *(_DWORD *)buf = 138412290;
      v32 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "FMDSupportedAccessoryRegistry initizlied %@", buf, 0xCu);

    }
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);

  }
  return v5;
}

- (id)defaultSupportedAccessoriesIfEnabled:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  FMDSupportedAccessory *v7;
  FMDSupportedAccessory *v8;
  void *v9;
  void *v10;
  void *v11;
  FMDSupportedAccessory *v12;
  void *v13;
  void *v14;
  FMDSupportedAccessory *v15;
  void *v16;
  FMDSupportedAccessory *v17;
  void *v18;
  id v19;
  void *v21;
  _QWORD v22[3];
  _QWORD v23[3];
  const __CFString *v24;
  const __CFString *v25;

  v3 = a3;
  v5 = objc_alloc_init((Class)NSMutableDictionary);
  v24 = CFSTR("FMDSupportedAccessoryRegistryLocalVersionKey");
  v25 = CFSTR("2");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
  objc_msgSend(v5, "setDictionary:", v6);

  if (v3)
  {
    v7 = -[FMDSupportedAccessory initWithDeviceVendor:deviceProductId:profile:]([FMDSupportedAccessory alloc], "initWithDeviceVendor:deviceProductId:profile:", &off_1002D8248, &off_1002D8260, 1);
    v8 = -[FMDSupportedAccessory initWithDeviceVendor:deviceProductId:profile:]([FMDSupportedAccessory alloc], "initWithDeviceVendor:deviceProductId:profile:", &off_1002D8248, &off_1002D8278, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessory accessoryIdentifier](v7, "accessoryIdentifier"));
    v22[0] = v9;
    v23[0] = v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessory accessoryIdentifier](v8, "accessoryIdentifier"));
    v22[1] = v10;
    v22[2] = CFSTR("FMDSupportedAccessoryRegistryLocalVersionKey");
    v23[1] = v8;
    v23[2] = CFSTR("7");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 3));
    objc_msgSend(v5, "addEntriesFromDictionary:", v11);

    v12 = -[FMDSupportedAccessory initWithDeviceVendor:deviceProductId:profile:]([FMDSupportedAccessory alloc], "initWithDeviceVendor:deviceProductId:profile:", &off_1002D8248, &off_1002D8290, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessory accessoryIdentifier](v12, "accessoryIdentifier"));
    objc_msgSend(v5, "setObject:forKey:", v12, v13);

    objc_msgSend(v5, "setObject:forKey:", CFSTR("8"), CFSTR("FMDSupportedAccessoryRegistryLocalVersionKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessoryRegistry assetForProfile:](self, "assetForProfile:", 2));
    v15 = [FMDSupportedAccessory alloc];
    v21 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
    v17 = -[FMDSupportedAccessory initWithDeviceVendor:deviceProductId:profile:assets:](v15, "initWithDeviceVendor:deviceProductId:profile:assets:", &off_1002D8248, &off_1002D82A8, 2, v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessory accessoryIdentifier](v17, "accessoryIdentifier"));
    objc_msgSend(v5, "setObject:forKey:", v17, v18);

    objc_msgSend(v5, "setObject:forKey:", CFSTR("9"), CFSTR("FMDSupportedAccessoryRegistryLocalVersionKey"));
  }
  v19 = objc_msgSend(v5, "copy");

  return v19;
}

- (void)updateSupportedAccessories:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessoryRegistry serialQueue](self, "serialQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000BC3AC;
  v11[3] = &unk_1002C44C8;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (id)supportedAccessoriesVersion
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_1000BC884;
  v11 = sub_1000BC894;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessoryRegistry serialQueue](self, "serialQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000BC89C;
  v6[3] = &unk_1002C11C0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)resetSupportedAccessoriesVersion
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessoryRegistry serialQueue](self, "serialQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000BC9C0;
  v4[3] = &unk_1002C1378;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)isAccessorySupported:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "category") == (id)2 || objc_msgSend(v4, "category") == (id)3)
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessoryRegistry supportedAccessoryForAccessory:](self, "supportedAccessoryForAccessory:", v4));
    v5 = v6 != 0;

  }
  return v5;
}

- (int64_t)profileForAccessoryIdentifier:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessoryRegistry supportedAccessoryForIdentifier:](self, "supportedAccessoryForIdentifier:", a3));
  v4 = objc_msgSend(v3, "profile");

  return (int64_t)v4;
}

- (id)maximumHistoricalLocationsForAccessory:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessoryRegistry supportedAccessoryForAccessory:](self, "supportedAccessoryForAccessory:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "maximumHistoricalLocations"));

  return v4;
}

- (id)shortTermLocationExpiryTimeIntervalForAccessory:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessoryRegistry supportedAccessoryForAccessory:](self, "supportedAccessoryForAccessory:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shortTermlocationExpiryTimeInterval"));

  return v4;
}

- (id)longTermLocationExpiryTimeIntervalForAccessory:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessoryRegistry supportedAccessoryForAccessory:](self, "supportedAccessoryForAccessory:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "longTermlocationExpiryTimeInterval"));

  return v4;
}

- (double)locateTimeoutForAccessory:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessoryRegistry supportedAccessoryForAccessory:](self, "supportedAccessoryForAccessory:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "locateTimeout"));
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (double)locateDesiredAccuracyForAccessory:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessoryRegistry supportedAccessoryForAccessory:](self, "supportedAccessoryForAccessory:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "desiredAccuracy"));
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (id)advertisementStatusKeyForProfile:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 2)
    return &stru_1002CD590;
  else
    return CFSTR("hsStatus");
}

- (unint64_t)defaultTimeoutAudioSafetyStatusForAccessory:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessoryRegistry supportedAccessoryForAccessory:](self, "supportedAccessoryForAccessory:", a3));
  v5 = v4;
  if (v4)
    v6 = -[FMDSupportedAccessoryRegistry defaultTimeoutAudioSafetyStatusForProfile:](self, "defaultTimeoutAudioSafetyStatusForProfile:", objc_msgSend(v4, "profile"));
  else
    v6 = 0;

  return v6;
}

- (id)playbackChannelNamesForAccessory:(id)a3 commandChannels:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  FMDSupportedAccessoryRegistry *v11;
  const __CFString *v13;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "category") != (id)3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessoryRegistry supportedAccessoryForAccessory:](self, "supportedAccessoryForAccessory:", v6));
    v9 = v8;
    if (v8)
    {
      v10 = objc_msgSend(v8, "profile");
      if (v10 == (id)2)
      {
        if (!v7 || !objc_msgSend(v7, "count"))
        {
          self = (FMDSupportedAccessoryRegistry *)&__NSArray0__struct;
          goto LABEL_9;
        }
        v13 = CFSTR("monaural");
        v11 = (FMDSupportedAccessoryRegistry *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
      }
      else
      {
        if ((unint64_t)v10 > 1)
        {
LABEL_9:

          goto LABEL_10;
        }
        v11 = (FMDSupportedAccessoryRegistry *)v7;
      }
    }
    else
    {
      v11 = (FMDSupportedAccessoryRegistry *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessoryRegistry channelNamesForProfile:](self, "channelNamesForProfile:", 0));
    }
    self = v11;
    goto LABEL_9;
  }
  self = (FMDSupportedAccessoryRegistry *)v7;
LABEL_10:

  return self;
}

- (id)channelNamesForProfile:(int64_t)a3
{
  const __CFString **v3;
  uint64_t v4;
  void *v5;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;

  if (a3 == 2)
  {
    v7 = CFSTR("monaural");
    v3 = &v7;
    v4 = 1;
  }
  else
  {
    if (a3 != 1)
    {
      v5 = &__NSArray0__struct;
      return v5;
    }
    v8 = CFSTR("left");
    v9 = CFSTR("right");
    v3 = &v8;
    v4 = 2;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, v4, v7, v8, v9));
  return v5;
}

- (id)locatorForAccessory:(id)a3
{
  void *v3;
  FMDLocator *v4;
  void *v5;
  id v6;
  FMDLocator *v7;
  void *v8;
  void *v9;
  FMDConservativeLocatorPublisher *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessoryRegistry supportedAccessoryForAccessory:](self, "supportedAccessoryForAccessory:", a3));
  if (v3)
  {
    v4 = [FMDLocator alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMDLocationManagerFactory sharedInstance](FMDLocationManagerFactory, "sharedInstance"));
    v6 = objc_msgSend(v5, "newLocationManager");
    v7 = -[FMDLocator initWithLocationManager:](v4, "initWithLocationManager:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "desiredAccuracy"));
    objc_msgSend(v8, "doubleValue");
    -[FMDLocator setDesiredAccuracy:](v7, "setDesiredAccuracy:");

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "locateTimeout"));
    objc_msgSend(v9, "doubleValue");
    -[FMDLocator setDuration:](v7, "setDuration:");

    v10 = objc_alloc_init(FMDConservativeLocatorPublisher);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startThreshold"));
    -[FMDConservativeLocatorPublisher setStartThreshold:](v10, "setStartThreshold:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endThreshold"));
    -[FMDConservativeLocatorPublisher setEndThreshold:](v10, "setEndThreshold:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "decayFactor"));
    -[FMDConservativeLocatorPublisher setDecayFactor:](v10, "setDecayFactor:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cachedLocValidityDuration"));
    -[FMDConservativeLocatorPublisher setCachedLocationValidityTimeInterval:](v10, "setCachedLocationValidityTimeInterval:", v14);

    -[FMDLocator setLocatorPublisher:](v7, "setLocatorPublisher:", v10);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (double)locationThrottleTimeIntervalForAccessory:(id)a3 speed:(double)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double result;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessoryRegistry supportedAccessoryForAccessory:](self, "supportedAccessoryForAccessory:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "locationThrottleRatio"));
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  result = 0.0;
  if (v8 > 0.0)
    return 60.0 / (fmax(a4, 1.0) * v8);
  return result;
}

- (id)assetsForAccessory:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessoryRegistry supportedAccessoryForAccessory:](self, "supportedAccessoryForAccessory:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "assets"));

  return v4;
}

- (void)clearSupportedAccessoryRegistry
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessoryRegistry serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BD154;
  block[3] = &unk_1002C1328;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (id)assetForProfile:(int64_t)a3
{
  void *v3;
  void *v4;
  id v5;
  FMDStandardAsset *v6;
  id v8;
  NSObject *v9;
  uint8_t v10[16];

  if (a3 != 2)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/FindMyDevice.framework")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathForResource:ofType:", CFSTR("accessory_locateSound_lg-B515"), CFSTR("wav")));
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc((Class)NSURL), "initFileURLWithPath:isDirectory:", v4, 0);
    v6 = -[FMDStandardAsset initWithFileURL:lastModified:etag:type:url:]([FMDStandardAsset alloc], "initWithFileURL:lastModified:etag:type:url:", v5, &stru_1002CD590, &stru_1002CD590, 1, v5);

  }
  else
  {
    v8 = sub_1000031B8();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FMDSupportedAccessoryRegistry did not find accessory_locateSound_lg.", v10, 2u);
    }

    v6 = 0;
  }

  return v6;
}

- (void)downloadAssetsIfNeededForAccessory:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessoryRegistry assetsForAccessory:](self, "assetsForAccessory:", a3));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BD404;
  v7[3] = &unk_1002C40D0;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = v8;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessoryRegistry assetRegistry](self, "assetRegistry"));
  objc_msgSend(v5, "downloadAssets:", v4);

}

- (id)supportedAccessoryForAccessory:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;

  v4 = a3;
  if (objc_msgSend(v4, "category") == (id)1)
  {
    if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___FMDDynamicAccessoryAdressable))
    {
      v5 = v4;
      v6 = objc_alloc((Class)FMDAccessoryIdentifier);
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceVendor"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceProductId"));

      v9 = objc_msgSend(v6, "initWithDeviceVendor:deviceProductId:", v7, v8);
LABEL_9:
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessoryRegistry supportedAccessoryForIdentifier:](self, "supportedAccessoryForIdentifier:", v9));
      goto LABEL_10;
    }
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "category") != (id)3)
    goto LABEL_8;
  v9 = v4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMDExtConfigurationRegistry sharedInstance](FMDExtConfigurationRegistry, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accessoryType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "configForAccessoryType:", v11));

  v13 = sub_1000530AC();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    sub_10022DDD8(v12, v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "supportedAccessory"));
LABEL_10:

  return v15;
}

- (id)supportedAccessoryForIdentifier:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  id v9;
  NSObject *v10;
  const char *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v16;
  FMDSupportedAccessoryRegistry *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  id v26;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1000BC884;
  v23 = sub_1000BC894;
  v24 = 0;
  v5 = sub_1000031B8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMDSupportedAccessoryRegistry supportedAccessoryForAccessory %@", buf, 0xCu);
  }

  v7 = objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessoryRegistry serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BD848;
  block[3] = &unk_1002C3BD8;
  v8 = v4;
  v17 = self;
  v18 = &v19;
  v16 = v8;
  dispatch_sync(v7, block);

  if (v20[5])
  {
    v9 = sub_1000031B8();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v8;
      v11 = "FMDSupportedAccessoryRegistry accessory is supported %@";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);
    }
  }
  else
  {
    v12 = sub_1000031B8();
    v10 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v8;
      v11 = "FMDSupportedAccessoryRegistry accessory is NOT supported %@";
      goto LABEL_8;
    }
  }

  v13 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v13;
}

- (FMDAssetRegistry)assetRegistry
{
  FMDAssetRegistry *assetRegistry;
  FMDAssetRegistry *v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  FMDAssetRegistry *v10;
  FMDAssetRegistry *v11;

  assetRegistry = self->_assetRegistry;
  if (!assetRegistry)
  {
    v4 = [FMDAssetRegistry alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAssetRegistry defaultStorageLocation](FMDAssetRegistry, "defaultStorageLocation"));
    v7 = (objc_class *)objc_opt_class(self, v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = -[FMDAssetRegistry initWithStorageLocation:identifier:](v4, "initWithStorageLocation:identifier:", v5, v9);
    v11 = self->_assetRegistry;
    self->_assetRegistry = v10;

    assetRegistry = self->_assetRegistry;
  }
  return assetRegistry;
}

- (void)readSupportedAccessoriesFromDisk
{
  NSObject *v3;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessoryRegistry serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BDA00;
  block[3] = &unk_1002C11E8;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (unint64_t)defaultTimeoutAudioSafetyStatusForProfile:(int64_t)a3
{
  unint64_t v3;

  v3 = 5;
  if (a3 != 2)
    v3 = 0;
  if (a3 == 1)
    return 3;
  else
    return v3;
}

- (FMDSupportedAccessoryRegistryDelegate)delegate
{
  return (FMDSupportedAccessoryRegistryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDictionary)supportedAccessories
{
  return self->_supportedAccessories;
}

- (void)setSupportedAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_supportedAccessories, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (FMDataArchiver)dataArchiver
{
  return self->_dataArchiver;
}

- (void)setDataArchiver:(id)a3
{
  objc_storeStrong((id *)&self->_dataArchiver, a3);
}

- (BOOL)defaultAccessoriesEnabled
{
  return self->_defaultAccessoriesEnabled;
}

- (void)setDefaultAccessoriesEnabled:(BOOL)a3
{
  self->_defaultAccessoriesEnabled = a3;
}

- (void)setAssetRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_assetRegistry, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetRegistry, 0);
  objc_storeStrong((id *)&self->_dataArchiver, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_supportedAccessories, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
