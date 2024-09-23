@implementation WeatherAQIAttribution

- (WeatherAQIAttribution)initWithFoundationAttribution:(id)a3
{
  id v4;
  WeatherAQIAttribution *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  UIImage *cachedLogoImage;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *reverseGeocodingQueue;
  void *v13;
  void *v14;
  uint64_t v15;
  CLLocation *stationLocation;
  void *v17;
  uint64_t v18;
  NSDate *stationLastReadDate;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)WeatherAQIAttribution;
  v5 = -[WeatherAQIAttribution init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "name");
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "cachedLogoImage");
    v8 = objc_claimAutoreleasedReturnValue();
    cachedLogoImage = v5->_cachedLogoImage;
    v5->_cachedLogoImage = (UIImage *)v8;

    v5->_dataOrigination = objc_msgSend(v4, "dataOrigination");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.weatherframework.airquality.attribution.reverse.geocoding", v10);
    reverseGeocodingQueue = v5->_reverseGeocodingQueue;
    v5->_reverseGeocodingQueue = (OS_dispatch_queue *)v11;

    objc_msgSend(v4, "station");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v4, "station");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "location");
      v15 = objc_claimAutoreleasedReturnValue();
      stationLocation = v5->_stationLocation;
      v5->_stationLocation = (CLLocation *)v15;

      objc_msgSend(v4, "station");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastReadDate");
      v18 = objc_claimAutoreleasedReturnValue();
      stationLastReadDate = v5->_stationLastReadDate;
      v5->_stationLastReadDate = (NSDate *)v18;

      -[WeatherAQIAttribution reverseGeocodeStationLocation:](v5, "reverseGeocodeStationLocation:", 0);
    }
  }

  return v5;
}

- (BOOL)isValid
{
  void *v2;
  BOOL v3;

  -[WeatherAQIAttribution name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (void)reverseGeocodeStationLocation:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[WeatherAQIAttribution stationLocation](self, "stationLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WeatherAQIAttribution reverseGeocodingQueue](self, "reverseGeocodingQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __55__WeatherAQIAttribution_reverseGeocodeStationLocation___block_invoke;
    v8[3] = &unk_24DD9D4A0;
    v8[4] = self;
    v9 = v4;
    dispatch_async(v6, v8);

  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.weather.foundation.airQuality.provider.attribution.errorDomain"), 7777, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v7);

  }
}

void __55__WeatherAQIAttribution_reverseGeocodeStationLocation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "geocodeRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "geocodeRequest");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancel");

  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  v4 = objc_alloc(MEMORY[0x24BEC21D8]);
  objc_msgSend(*(id *)(a1 + 32), "stationLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "coordinate");
  v7 = v6;
  v9 = v8;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __55__WeatherAQIAttribution_reverseGeocodeStationLocation___block_invoke_2;
  v12[3] = &unk_24DD9CE80;
  objc_copyWeak(&v14, &location);
  v13 = *(id *)(a1 + 40);
  v10 = (void *)objc_msgSend(v4, "initWithCoordinate:resultHandler:", v12, v7, v9);
  objc_msgSend(*(id *)(a1 + 32), "setGeocodeRequest:", v10);

  objc_msgSend(*(id *)(a1 + 32), "geocodeRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "start");

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __55__WeatherAQIAttribution_reverseGeocodeStationLocation___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!v5)
  {
    objc_msgSend(v9, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setStationLocationName:", v7);

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);

}

- (NSString)name
{
  NSString *p_isa;
  void *v3;
  int v4;
  char v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;

  p_isa = self->_name;
  +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("feature.enhancedAQIView.overridesEnabled"));
  v5 = objc_msgSend(v3, "BOOLForKey:", CFSTR("feature.enhancedAQIView.demoModeEnabled"));
  if (v4 && (v5 & 1) == 0)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("feature.enhancedAQIView.airQualityDataProviderOverride"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_10;
    v7 = objc_msgSend(v6, "integerValue");
    if (v7)
    {
      if (v7 != 1)
      {
LABEL_10:

        goto LABEL_11;
      }
      v8 = CFSTR("Breezometer");
    }
    else
    {
      v8 = CFSTR("The Weather Channel");
    }

    p_isa = &v8->isa;
    goto LABEL_10;
  }
LABEL_11:

  return p_isa;
}

- (int64_t)dataOrigination
{
  uint64_t dataOrigination;
  void *v3;
  int v4;
  char v5;
  void *v6;

  dataOrigination = self->_dataOrigination;
  +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("feature.enhancedAQIView.overridesEnabled"));
  v5 = objc_msgSend(v3, "BOOLForKey:", CFSTR("feature.enhancedAQIView.demoModeEnabled"));
  if (v4 && (v5 & 1) == 0)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("feature.enhancedAQIView.airQualityDataOriginationOverride"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)objc_msgSend(v6, "integerValue") <= 1)
        dataOrigination = objc_msgSend(v6, "integerValue");
    }

  }
  return dataOrigination;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)setDataOrigination:(int64_t)a3
{
  self->_dataOrigination = a3;
}

- (UIImage)cachedLogoImage
{
  return self->_cachedLogoImage;
}

- (NSDate)stationLastReadDate
{
  return self->_stationLastReadDate;
}

- (CLLocation)stationLocation
{
  return self->_stationLocation;
}

- (NSString)stationLocationName
{
  return self->_stationLocationName;
}

- (void)setStationLocationName:(id)a3
{
  objc_storeStrong((id *)&self->_stationLocationName, a3);
}

- (WFGeocodeRequest)geocodeRequest
{
  return self->_geocodeRequest;
}

- (void)setGeocodeRequest:(id)a3
{
  objc_storeStrong((id *)&self->_geocodeRequest, a3);
}

- (OS_dispatch_queue)reverseGeocodingQueue
{
  return self->_reverseGeocodingQueue;
}

- (void)setReverseGeocodingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_reverseGeocodingQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reverseGeocodingQueue, 0);
  objc_storeStrong((id *)&self->_geocodeRequest, 0);
  objc_storeStrong((id *)&self->_stationLocationName, 0);
  objc_storeStrong((id *)&self->_stationLocation, 0);
  objc_storeStrong((id *)&self->_stationLastReadDate, 0);
  objc_storeStrong((id *)&self->_cachedLogoImage, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
