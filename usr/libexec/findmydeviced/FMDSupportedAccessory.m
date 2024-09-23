@implementation FMDSupportedAccessory

- (FMDSupportedAccessory)initWithDictionary:(id)a3
{
  return -[FMDSupportedAccessory initWithDictionary:assetRegistry:](self, "initWithDictionary:assetRegistry:", a3, 0);
}

- (FMDSupportedAccessory)initWithDictionary:(id)a3 assetRegistry:(id)a4
{
  id v6;
  id v7;
  FMDSupportedAccessory *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *productType;
  NSNumber *v16;
  NSNumber *maximumHistoricalLocations;
  NSNumber *v18;
  NSNumber *longTermlocationExpiryTimeInterval;
  NSNumber *v20;
  NSNumber *shortTermlocationExpiryTimeInterval;
  NSNumber *v22;
  NSNumber *locationThrottleRatio;
  NSNumber *v24;
  NSNumber *locateTimeout;
  NSNumber *v26;
  NSNumber *desiredAccuracy;
  NSNumber *v28;
  NSNumber *startThreshold;
  NSNumber *v30;
  NSNumber *endThreshold;
  NSNumber *v32;
  NSNumber *decayFactor;
  NSNumber *v34;
  NSNumber *cachedLocValidityDuration;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;

  v6 = a3;
  v7 = a4;
  v8 = -[FMDSupportedAccessory init](self, "init");
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("assets")));
    -[FMDSupportedAccessory unmarshallAssets:assetRegistry:](v8, "unmarshallAssets:assetRegistry:", v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("productId")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v10, "integerValue")));
    -[FMDSupportedAccessory setDeviceProductId:](v8, "setDeviceProductId:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("vendorId")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v12, "integerValue")));
    -[FMDSupportedAccessory setDeviceVendor:](v8, "setDeviceVendor:", v13);

    v14 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("productType")));
    productType = v14;
    if (!v14)
      productType = v8->_productType;
    -[FMDSupportedAccessory setProductType:](v8, "setProductType:", productType);

    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("maxHistoricalLocations")));
    maximumHistoricalLocations = v16;
    if (!v16)
      maximumHistoricalLocations = v8->_maximumHistoricalLocations;
    -[FMDSupportedAccessory setMaximumHistoricalLocations:](v8, "setMaximumHistoricalLocations:", maximumHistoricalLocations);

    v18 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("longTermLocationExpiry")));
    longTermlocationExpiryTimeInterval = v18;
    if (!v18)
      longTermlocationExpiryTimeInterval = v8->_longTermlocationExpiryTimeInterval;
    -[FMDSupportedAccessory setLongTermlocationExpiryTimeInterval:](v8, "setLongTermlocationExpiryTimeInterval:", longTermlocationExpiryTimeInterval);

    v20 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("shortTermLocationExpiry")));
    shortTermlocationExpiryTimeInterval = v20;
    if (!v20)
      shortTermlocationExpiryTimeInterval = v8->_shortTermlocationExpiryTimeInterval;
    -[FMDSupportedAccessory setShortTermlocationExpiryTimeInterval:](v8, "setShortTermlocationExpiryTimeInterval:", shortTermlocationExpiryTimeInterval);

    v22 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("locationThrottleRatio")));
    locationThrottleRatio = v22;
    if (!v22)
      locationThrottleRatio = v8->_locationThrottleRatio;
    -[FMDSupportedAccessory setLocationThrottleRatio:](v8, "setLocationThrottleRatio:", locationThrottleRatio);

    v24 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("locateTimeout")));
    locateTimeout = v24;
    if (!v24)
      locateTimeout = v8->_locateTimeout;
    -[FMDSupportedAccessory setLocateTimeout:](v8, "setLocateTimeout:", locateTimeout);

    v26 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("desiredAccuracy")));
    desiredAccuracy = v26;
    if (!v26)
      desiredAccuracy = v8->_desiredAccuracy;
    -[FMDSupportedAccessory setDesiredAccuracy:](v8, "setDesiredAccuracy:", desiredAccuracy);

    v28 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("startThreshold")));
    startThreshold = v28;
    if (!v28)
      startThreshold = v8->_startThreshold;
    -[FMDSupportedAccessory setStartThreshold:](v8, "setStartThreshold:", startThreshold);

    v30 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("endThreshold")));
    endThreshold = v30;
    if (!v30)
      endThreshold = v8->_endThreshold;
    -[FMDSupportedAccessory setEndThreshold:](v8, "setEndThreshold:", endThreshold);

    v32 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("decayFactor")));
    decayFactor = v32;
    if (!v32)
      decayFactor = v8->_decayFactor;
    -[FMDSupportedAccessory setDecayFactor:](v8, "setDecayFactor:", decayFactor);

    v34 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cachedLocValidityDuration")));
    cachedLocValidityDuration = v34;
    if (!v34)
      cachedLocValidityDuration = v8->_cachedLocValidityDuration;
    -[FMDSupportedAccessory setCachedLocValidityDuration:](v8, "setCachedLocValidityDuration:", cachedLocValidityDuration);

    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("advertisementStatusKey")));
    -[FMDSupportedAccessory setProfile:](v8, "setProfile:", -[FMDSupportedAccessory profileForProfileName:](v8, "profileForProfileName:", v36));
    v37 = objc_alloc((Class)FMDAccessoryIdentifier);
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessory deviceVendor](v8, "deviceVendor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessory deviceProductId](v8, "deviceProductId"));
    v40 = objc_msgSend(v37, "initWithDeviceVendor:deviceProductId:", v38, v39);
    -[FMDSupportedAccessory setAccessoryIdentifier:](v8, "setAccessoryIdentifier:", v40);

  }
  return v8;
}

- (FMDSupportedAccessory)initWithType:(id)a3 locationInfo:(id)a4
{
  NSString *v6;
  id v7;
  FMDSupportedAccessory *v8;
  FMDSupportedAccessory *v9;
  NSString *productType;
  NSNumber *v11;
  NSNumber *maximumHistoricalLocations;
  NSNumber *v13;
  NSNumber *longTermlocationExpiryTimeInterval;
  NSNumber *v15;
  NSNumber *shortTermlocationExpiryTimeInterval;
  NSNumber *v17;
  NSNumber *locationThrottleRatio;
  NSNumber *v19;
  NSNumber *locateTimeout;
  NSNumber *v21;
  NSNumber *desiredAccuracy;
  NSNumber *v23;
  NSNumber *startThreshold;
  NSNumber *v25;
  NSNumber *endThreshold;
  NSNumber *v27;
  NSNumber *decayFactor;
  NSNumber *v29;
  NSNumber *cachedLocValidityDuration;

  v6 = (NSString *)a3;
  v7 = a4;
  v8 = -[FMDSupportedAccessory init](self, "init");
  v9 = v8;
  if (v8)
  {
    productType = v6;
    if (!v6)
      productType = v8->_productType;
    -[FMDSupportedAccessory setProductType:](v8, "setProductType:", productType);
    v11 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("maxHistoricalLocations")));
    maximumHistoricalLocations = v11;
    if (!v11)
      maximumHistoricalLocations = v9->_maximumHistoricalLocations;
    -[FMDSupportedAccessory setMaximumHistoricalLocations:](v9, "setMaximumHistoricalLocations:", maximumHistoricalLocations);

    v13 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("longTermLocationExpiry")));
    longTermlocationExpiryTimeInterval = v13;
    if (!v13)
      longTermlocationExpiryTimeInterval = v9->_longTermlocationExpiryTimeInterval;
    -[FMDSupportedAccessory setLongTermlocationExpiryTimeInterval:](v9, "setLongTermlocationExpiryTimeInterval:", longTermlocationExpiryTimeInterval);

    v15 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("shortTermLocationExpiry")));
    shortTermlocationExpiryTimeInterval = v15;
    if (!v15)
      shortTermlocationExpiryTimeInterval = v9->_shortTermlocationExpiryTimeInterval;
    -[FMDSupportedAccessory setShortTermlocationExpiryTimeInterval:](v9, "setShortTermlocationExpiryTimeInterval:", shortTermlocationExpiryTimeInterval);

    v17 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("locationThrottleRatio")));
    locationThrottleRatio = v17;
    if (!v17)
      locationThrottleRatio = v9->_locationThrottleRatio;
    -[FMDSupportedAccessory setLocationThrottleRatio:](v9, "setLocationThrottleRatio:", locationThrottleRatio);

    v19 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("locateTimeout")));
    locateTimeout = v19;
    if (!v19)
      locateTimeout = v9->_locateTimeout;
    -[FMDSupportedAccessory setLocateTimeout:](v9, "setLocateTimeout:", locateTimeout);

    v21 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("desiredAccuracy")));
    desiredAccuracy = v21;
    if (!v21)
      desiredAccuracy = v9->_desiredAccuracy;
    -[FMDSupportedAccessory setDesiredAccuracy:](v9, "setDesiredAccuracy:", desiredAccuracy);

    v23 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("startThreshold")));
    startThreshold = v23;
    if (!v23)
      startThreshold = v9->_startThreshold;
    -[FMDSupportedAccessory setStartThreshold:](v9, "setStartThreshold:", startThreshold);

    v25 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("endThreshold")));
    endThreshold = v25;
    if (!v25)
      endThreshold = v9->_endThreshold;
    -[FMDSupportedAccessory setEndThreshold:](v9, "setEndThreshold:", endThreshold);

    v27 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("decayFactor")));
    decayFactor = v27;
    if (!v27)
      decayFactor = v9->_decayFactor;
    -[FMDSupportedAccessory setDecayFactor:](v9, "setDecayFactor:", decayFactor);

    v29 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("cachedLocValidityDuration")));
    cachedLocValidityDuration = v29;
    if (!v29)
      cachedLocValidityDuration = v9->_cachedLocValidityDuration;
    -[FMDSupportedAccessory setCachedLocValidityDuration:](v9, "setCachedLocValidityDuration:", cachedLocValidityDuration);

  }
  return v9;
}

- (FMDSupportedAccessory)initWithDeviceVendor:(id)a3 deviceProductId:(id)a4 profile:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  FMDSupportedAccessory *v11;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v11 = -[FMDSupportedAccessory initWithDeviceVendor:deviceProductId:profile:assets:](self, "initWithDeviceVendor:deviceProductId:profile:assets:", v9, v8, a5, v10);

  return v11;
}

- (FMDSupportedAccessory)initWithDeviceVendor:(id)a3 deviceProductId:(id)a4 profile:(int64_t)a5 assets:(id)a6
{
  id v10;
  id v11;
  id v12;
  FMDSupportedAccessory *v13;
  FMDSupportedAccessory *v14;
  id v15;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = -[FMDSupportedAccessory init](self, "init");
  v14 = v13;
  if (v13)
  {
    -[FMDSupportedAccessory setDeviceProductId:](v13, "setDeviceProductId:", v11);
    -[FMDSupportedAccessory setDeviceVendor:](v14, "setDeviceVendor:", v10);
    v15 = objc_msgSend(objc_alloc((Class)FMDAccessoryIdentifier), "initWithDeviceVendor:deviceProductId:", v10, v11);
    -[FMDSupportedAccessory setAccessoryIdentifier:](v14, "setAccessoryIdentifier:", v15);

    -[FMDSupportedAccessory setProfile:](v14, "setProfile:", a5);
    -[FMDSupportedAccessory setAssets:](v14, "setAssets:", v12);
  }

  return v14;
}

- (FMDSupportedAccessory)init
{
  FMDSupportedAccessory *v2;
  FMDSupportedAccessory *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FMDSupportedAccessory;
  v2 = -[FMDSupportedAccessory init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[FMDSupportedAccessory setMaximumHistoricalLocations:](v2, "setMaximumHistoricalLocations:", &off_1002D7ED0);
    -[FMDSupportedAccessory setShortTermlocationExpiryTimeInterval:](v3, "setShortTermlocationExpiryTimeInterval:", &off_1002D7EE8);
    -[FMDSupportedAccessory setLongTermlocationExpiryTimeInterval:](v3, "setLongTermlocationExpiryTimeInterval:", &off_1002D7F00);
    -[FMDSupportedAccessory setLocationThrottleRatio:](v3, "setLocationThrottleRatio:", &off_1002D8310);
    -[FMDSupportedAccessory setLocateTimeout:](v3, "setLocateTimeout:", &off_1002D7F18);
    -[FMDSupportedAccessory setDesiredAccuracy:](v3, "setDesiredAccuracy:", &off_1002D7F30);
    -[FMDSupportedAccessory setStartThreshold:](v3, "setStartThreshold:", &off_1002D9338);
    -[FMDSupportedAccessory setEndThreshold:](v3, "setEndThreshold:", &off_1002D9348);
    -[FMDSupportedAccessory setDecayFactor:](v3, "setDecayFactor:", &off_1002D9358);
    -[FMDSupportedAccessory setCachedLocValidityDuration:](v3, "setCachedLocValidityDuration:", &off_1002D8320);
    -[FMDSupportedAccessory setProfile:](v3, "setProfile:", 1);
  }
  return v3;
}

- (void)unmarshallAssets:(id)a3 assetRegistry:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = objc_msgSend(v7, "newAssetWithDictionary:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v13), (_QWORD)v15);
        objc_msgSend(v8, "fm_safeAddObject:", v14);

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

  -[FMDSupportedAccessory setAssets:](self, "setAssets:", v8);
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessory deviceVendor](self, "deviceVendor"));
  v4 = objc_msgSend(v3, "integerValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessory deviceProductId](self, "deviceProductId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%li, %li"), v4, objc_msgSend(v5, "integerValue")));

  return (NSString *)v6;
}

- (int64_t)profileForProfileName:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AirPods")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Frost")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *deviceVendor;
  id v5;
  NSString *v6;
  void *v7;
  NSNumber *deviceProductId;
  NSString *v9;
  void *v10;
  NSString *productType;
  NSString *v12;
  void *v13;
  NSArray *assets;
  NSString *v15;
  void *v16;
  NSNumber *maximumHistoricalLocations;
  NSString *v18;
  void *v19;
  NSNumber *longTermlocationExpiryTimeInterval;
  NSString *v21;
  void *v22;
  NSNumber *shortTermlocationExpiryTimeInterval;
  NSString *v24;
  void *v25;
  NSNumber *locationThrottleRatio;
  NSString *v27;
  void *v28;
  NSNumber *locateTimeout;
  NSString *v30;
  void *v31;
  NSNumber *startThreshold;
  NSString *v33;
  void *v34;
  NSNumber *endThreshold;
  NSString *v36;
  void *v37;
  NSNumber *decayFactor;
  NSString *v39;
  void *v40;
  NSNumber *cachedLocValidityDuration;
  NSString *v42;
  void *v43;
  NSNumber *desiredAccuracy;
  NSString *v45;
  void *v46;
  NSString *v47;
  void *v48;
  id v49;

  deviceVendor = self->_deviceVendor;
  v5 = a3;
  v6 = NSStringFromSelector("deviceVendor");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v5, "encodeObject:forKey:", deviceVendor, v7);

  deviceProductId = self->_deviceProductId;
  v9 = NSStringFromSelector("deviceProductId");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v5, "encodeObject:forKey:", deviceProductId, v10);

  productType = self->_productType;
  v12 = NSStringFromSelector("productType");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v5, "encodeObject:forKey:", productType, v13);

  assets = self->_assets;
  v15 = NSStringFromSelector("assets");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  objc_msgSend(v5, "encodeObject:forKey:", assets, v16);

  maximumHistoricalLocations = self->_maximumHistoricalLocations;
  v18 = NSStringFromSelector("maximumHistoricalLocations");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  objc_msgSend(v5, "encodeObject:forKey:", maximumHistoricalLocations, v19);

  longTermlocationExpiryTimeInterval = self->_longTermlocationExpiryTimeInterval;
  v21 = NSStringFromSelector("longTermlocationExpiryTimeInterval");
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  objc_msgSend(v5, "encodeObject:forKey:", longTermlocationExpiryTimeInterval, v22);

  shortTermlocationExpiryTimeInterval = self->_shortTermlocationExpiryTimeInterval;
  v24 = NSStringFromSelector("shortTermlocationExpiryTimeInterval");
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  objc_msgSend(v5, "encodeObject:forKey:", shortTermlocationExpiryTimeInterval, v25);

  locationThrottleRatio = self->_locationThrottleRatio;
  v27 = NSStringFromSelector("locationThrottleRatio");
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  objc_msgSend(v5, "encodeObject:forKey:", locationThrottleRatio, v28);

  locateTimeout = self->_locateTimeout;
  v30 = NSStringFromSelector("locateTimeout");
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  objc_msgSend(v5, "encodeObject:forKey:", locateTimeout, v31);

  startThreshold = self->_startThreshold;
  v33 = NSStringFromSelector("startThreshold");
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  objc_msgSend(v5, "encodeObject:forKey:", startThreshold, v34);

  endThreshold = self->_endThreshold;
  v36 = NSStringFromSelector("endThreshold");
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  objc_msgSend(v5, "encodeObject:forKey:", endThreshold, v37);

  decayFactor = self->_decayFactor;
  v39 = NSStringFromSelector("decayFactor");
  v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
  objc_msgSend(v5, "encodeObject:forKey:", decayFactor, v40);

  cachedLocValidityDuration = self->_cachedLocValidityDuration;
  v42 = NSStringFromSelector("cachedLocValidityDuration");
  v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
  objc_msgSend(v5, "encodeObject:forKey:", cachedLocValidityDuration, v43);

  desiredAccuracy = self->_desiredAccuracy;
  v45 = NSStringFromSelector("desiredAccuracy");
  v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
  objc_msgSend(v5, "encodeObject:forKey:", desiredAccuracy, v46);

  v49 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_profile));
  v47 = NSStringFromSelector("profile");
  v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
  objc_msgSend(v5, "encodeObject:forKey:", v49, v48);

}

- (FMDSupportedAccessory)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  FMDSupportedAccessory *v6;
  uint64_t v7;
  NSString *v8;
  void *v9;
  uint64_t v10;
  NSNumber *deviceVendor;
  uint64_t v12;
  uint64_t v13;
  NSString *v14;
  void *v15;
  uint64_t v16;
  NSNumber *deviceProductId;
  uint64_t v18;
  uint64_t v19;
  NSString *v20;
  void *v21;
  NSString *v22;
  NSString *productType;
  uint64_t v24;
  uint64_t v25;
  NSString *v26;
  void *v27;
  uint64_t v28;
  NSArray *assets;
  uint64_t v30;
  uint64_t v31;
  NSString *v32;
  void *v33;
  NSNumber *v34;
  NSNumber *maximumHistoricalLocations;
  uint64_t v36;
  uint64_t v37;
  NSString *v38;
  void *v39;
  NSNumber *v40;
  NSNumber *longTermlocationExpiryTimeInterval;
  uint64_t v42;
  uint64_t v43;
  NSString *v44;
  void *v45;
  NSNumber *v46;
  NSNumber *shortTermlocationExpiryTimeInterval;
  uint64_t v48;
  uint64_t v49;
  NSString *v50;
  void *v51;
  NSNumber *v52;
  NSNumber *locationThrottleRatio;
  uint64_t v54;
  uint64_t v55;
  NSString *v56;
  void *v57;
  NSNumber *v58;
  NSNumber *locateTimeout;
  uint64_t v60;
  uint64_t v61;
  NSString *v62;
  void *v63;
  NSNumber *v64;
  NSNumber *startThreshold;
  uint64_t v66;
  uint64_t v67;
  NSString *v68;
  void *v69;
  NSNumber *v70;
  NSNumber *endThreshold;
  uint64_t v72;
  uint64_t v73;
  NSString *v74;
  void *v75;
  NSNumber *v76;
  NSNumber *decayFactor;
  uint64_t v78;
  uint64_t v79;
  NSString *v80;
  void *v81;
  NSNumber *v82;
  NSNumber *cachedLocValidityDuration;
  uint64_t v84;
  uint64_t v85;
  NSString *v86;
  void *v87;
  NSNumber *v88;
  NSNumber *desiredAccuracy;
  uint64_t v90;
  uint64_t v91;
  NSString *v92;
  void *v93;
  void *v94;
  id profile;
  id v96;

  v4 = a3;
  v6 = -[FMDSupportedAccessory init](self, "init");
  if (v6)
  {
    v7 = objc_opt_class(NSNumber, v5);
    v8 = NSStringFromSelector("deviceVendor");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v9));
    deviceVendor = v6->_deviceVendor;
    v6->_deviceVendor = (NSNumber *)v10;

    v13 = objc_opt_class(NSNumber, v12);
    v14 = NSStringFromSelector("deviceProductId");
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v13, v15));
    deviceProductId = v6->_deviceProductId;
    v6->_deviceProductId = (NSNumber *)v16;

    v19 = objc_opt_class(NSString, v18);
    v20 = NSStringFromSelector("productType");
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v19, v21));
    productType = v22;
    if (!v22)
      productType = v6->_productType;
    objc_storeStrong((id *)&v6->_productType, productType);

    v25 = objc_opt_class(NSArray, v24);
    v26 = NSStringFromSelector("assets");
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v25, v27));
    assets = v6->_assets;
    v6->_assets = (NSArray *)v28;

    v31 = objc_opt_class(NSNumber, v30);
    v32 = NSStringFromSelector("maximumHistoricalLocations");
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v34 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v31, v33));
    maximumHistoricalLocations = v34;
    if (!v34)
      maximumHistoricalLocations = v6->_maximumHistoricalLocations;
    objc_storeStrong((id *)&v6->_maximumHistoricalLocations, maximumHistoricalLocations);

    v37 = objc_opt_class(NSNumber, v36);
    v38 = NSStringFromSelector("longTermlocationExpiryTimeInterval");
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    v40 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v37, v39));
    longTermlocationExpiryTimeInterval = v40;
    if (!v40)
      longTermlocationExpiryTimeInterval = v6->_longTermlocationExpiryTimeInterval;
    objc_storeStrong((id *)&v6->_longTermlocationExpiryTimeInterval, longTermlocationExpiryTimeInterval);

    v43 = objc_opt_class(NSNumber, v42);
    v44 = NSStringFromSelector("shortTermlocationExpiryTimeInterval");
    v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
    v46 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v43, v45));
    shortTermlocationExpiryTimeInterval = v46;
    if (!v46)
      shortTermlocationExpiryTimeInterval = v6->_shortTermlocationExpiryTimeInterval;
    objc_storeStrong((id *)&v6->_shortTermlocationExpiryTimeInterval, shortTermlocationExpiryTimeInterval);

    v49 = objc_opt_class(NSNumber, v48);
    v50 = NSStringFromSelector("locationThrottleRatio");
    v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
    v52 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v49, v51));
    locationThrottleRatio = v52;
    if (!v52)
      locationThrottleRatio = v6->_locationThrottleRatio;
    objc_storeStrong((id *)&v6->_locationThrottleRatio, locationThrottleRatio);

    v55 = objc_opt_class(NSNumber, v54);
    v56 = NSStringFromSelector("locateTimeout");
    v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
    v58 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v55, v57));
    locateTimeout = v58;
    if (!v58)
      locateTimeout = v6->_locateTimeout;
    objc_storeStrong((id *)&v6->_locateTimeout, locateTimeout);

    v61 = objc_opt_class(NSNumber, v60);
    v62 = NSStringFromSelector("startThreshold");
    v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
    v64 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v61, v63));
    startThreshold = v64;
    if (!v64)
      startThreshold = v6->_startThreshold;
    objc_storeStrong((id *)&v6->_startThreshold, startThreshold);

    v67 = objc_opt_class(NSNumber, v66);
    v68 = NSStringFromSelector("endThreshold");
    v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
    v70 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v67, v69));
    endThreshold = v70;
    if (!v70)
      endThreshold = v6->_endThreshold;
    objc_storeStrong((id *)&v6->_endThreshold, endThreshold);

    v73 = objc_opt_class(NSNumber, v72);
    v74 = NSStringFromSelector("decayFactor");
    v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
    v76 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v73, v75));
    decayFactor = v76;
    if (!v76)
      decayFactor = v6->_decayFactor;
    objc_storeStrong((id *)&v6->_decayFactor, decayFactor);

    v79 = objc_opt_class(NSNumber, v78);
    v80 = NSStringFromSelector("cachedLocValidityDuration");
    v81 = (void *)objc_claimAutoreleasedReturnValue(v80);
    v82 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v79, v81));
    cachedLocValidityDuration = v82;
    if (!v82)
      cachedLocValidityDuration = v6->_cachedLocValidityDuration;
    objc_storeStrong((id *)&v6->_cachedLocValidityDuration, cachedLocValidityDuration);

    v85 = objc_opt_class(NSNumber, v84);
    v86 = NSStringFromSelector("desiredAccuracy");
    v87 = (void *)objc_claimAutoreleasedReturnValue(v86);
    v88 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v85, v87));
    desiredAccuracy = v88;
    if (!v88)
      desiredAccuracy = v6->_desiredAccuracy;
    objc_storeStrong((id *)&v6->_desiredAccuracy, desiredAccuracy);

    v91 = objc_opt_class(NSNumber, v90);
    v92 = NSStringFromSelector("profile");
    v93 = (void *)objc_claimAutoreleasedReturnValue(v92);
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v91, v93));
    profile = objc_msgSend(v94, "integerValue");
    if (!profile)
      profile = (id)v6->_profile;
    v6->_profile = (int64_t)profile;

    v96 = objc_msgSend(objc_alloc((Class)FMDAccessoryIdentifier), "initWithDeviceVendor:deviceProductId:", v6->_deviceVendor, v6->_deviceProductId);
    -[FMDSupportedAccessory setAccessoryIdentifier:](v6, "setAccessoryIdentifier:", v96);

  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  FMDSupportedAccessory *v4;
  void *v5;
  void *v6;
  FMDSupportedAccessory *v7;

  v4 = +[FMDSupportedAccessory allocWithZone:](FMDSupportedAccessory, "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessory deviceVendor](self, "deviceVendor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessory deviceProductId](self, "deviceProductId"));
  v7 = -[FMDSupportedAccessory initWithDeviceVendor:deviceProductId:profile:](v4, "initWithDeviceVendor:deviceProductId:profile:", v5, v6, -[FMDSupportedAccessory profile](self, "profile"));

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  FMDSupportedAccessory *v5;
  uint64_t v6;
  FMDSupportedAccessory *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;

  v5 = (FMDSupportedAccessory *)a3;
  if (v5 == self)
  {
    v10 = 1;
  }
  else
  {
    v6 = objc_opt_class(FMDSupportedAccessory, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessory deviceVendor](self, "deviceVendor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessory deviceVendor](v7, "deviceVendor"));
      if (v8 == v9)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessory deviceProductId](self, "deviceProductId"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessory deviceProductId](v7, "deviceProductId"));
        v10 = v11 == v12;

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessory deviceVendor](self, "deviceVendor"));
  v4 = (unint64_t)objc_msgSend(v3, "unsignedIntegerValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDSupportedAccessory deviceProductId](self, "deviceProductId"));
  v6 = (unint64_t)objc_msgSend(v5, "unsignedIntegerValue") ^ v4;

  return v6;
}

- (NSDictionary)dictionaryValue
{
  return (NSDictionary *)&__NSDictionary0__struct;
}

- (NSNumber)deviceVendor
{
  return self->_deviceVendor;
}

- (void)setDeviceVendor:(id)a3
{
  objc_storeStrong((id *)&self->_deviceVendor, a3);
}

- (NSNumber)deviceProductId
{
  return self->_deviceProductId;
}

- (void)setDeviceProductId:(id)a3
{
  objc_storeStrong((id *)&self->_deviceProductId, a3);
}

- (NSArray)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
  objc_storeStrong((id *)&self->_assets, a3);
}

- (NSNumber)maximumHistoricalLocations
{
  return self->_maximumHistoricalLocations;
}

- (void)setMaximumHistoricalLocations:(id)a3
{
  objc_storeStrong((id *)&self->_maximumHistoricalLocations, a3);
}

- (NSNumber)longTermlocationExpiryTimeInterval
{
  return self->_longTermlocationExpiryTimeInterval;
}

- (void)setLongTermlocationExpiryTimeInterval:(id)a3
{
  objc_storeStrong((id *)&self->_longTermlocationExpiryTimeInterval, a3);
}

- (NSNumber)shortTermlocationExpiryTimeInterval
{
  return self->_shortTermlocationExpiryTimeInterval;
}

- (void)setShortTermlocationExpiryTimeInterval:(id)a3
{
  objc_storeStrong((id *)&self->_shortTermlocationExpiryTimeInterval, a3);
}

- (NSNumber)locationThrottleRatio
{
  return self->_locationThrottleRatio;
}

- (void)setLocationThrottleRatio:(id)a3
{
  objc_storeStrong((id *)&self->_locationThrottleRatio, a3);
}

- (NSNumber)locateTimeout
{
  return self->_locateTimeout;
}

- (void)setLocateTimeout:(id)a3
{
  objc_storeStrong((id *)&self->_locateTimeout, a3);
}

- (NSNumber)startThreshold
{
  return self->_startThreshold;
}

- (void)setStartThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_startThreshold, a3);
}

- (NSNumber)endThreshold
{
  return self->_endThreshold;
}

- (void)setEndThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_endThreshold, a3);
}

- (NSNumber)decayFactor
{
  return self->_decayFactor;
}

- (void)setDecayFactor:(id)a3
{
  objc_storeStrong((id *)&self->_decayFactor, a3);
}

- (NSNumber)cachedLocValidityDuration
{
  return self->_cachedLocValidityDuration;
}

- (void)setCachedLocValidityDuration:(id)a3
{
  objc_storeStrong((id *)&self->_cachedLocValidityDuration, a3);
}

- (NSNumber)desiredAccuracy
{
  return self->_desiredAccuracy;
}

- (void)setDesiredAccuracy:(id)a3
{
  objc_storeStrong((id *)&self->_desiredAccuracy, a3);
}

- (int64_t)profile
{
  return self->_profile;
}

- (void)setProfile:(int64_t)a3
{
  self->_profile = a3;
}

- (FMDAccessoryIdentifier)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (void)setAccessoryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryIdentifier, a3);
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
  objc_storeStrong((id *)&self->_productType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_desiredAccuracy, 0);
  objc_storeStrong((id *)&self->_cachedLocValidityDuration, 0);
  objc_storeStrong((id *)&self->_decayFactor, 0);
  objc_storeStrong((id *)&self->_endThreshold, 0);
  objc_storeStrong((id *)&self->_startThreshold, 0);
  objc_storeStrong((id *)&self->_locateTimeout, 0);
  objc_storeStrong((id *)&self->_locationThrottleRatio, 0);
  objc_storeStrong((id *)&self->_shortTermlocationExpiryTimeInterval, 0);
  objc_storeStrong((id *)&self->_longTermlocationExpiryTimeInterval, 0);
  objc_storeStrong((id *)&self->_maximumHistoricalLocations, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_deviceProductId, 0);
  objc_storeStrong((id *)&self->_deviceVendor, 0);
}

@end
