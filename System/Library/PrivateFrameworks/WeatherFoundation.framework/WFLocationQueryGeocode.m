@implementation WFLocationQueryGeocode

+ (id)queryWithDictionaryRepresentation:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  const __CFString *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[2];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = CFSTR("Longitude");
  v33[0] = CFSTR("Latitude");
  v33[1] = CFSTR("Longitude");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    v27 = CFSTR("Longitude");
    v28 = a1;
    while (2)
    {
      v13 = v7;
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v15, v27, v28);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_opt_respondsToSelector();

          if ((v18 & 1) != 0)
            continue;
        }

        v25 = 0;
        v7 = v13;
        goto LABEL_12;
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      v7 = v13;
      v8 = v27;
      a1 = v28;
      if (v11)
        continue;
      break;
    }
  }

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Latitude"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  v21 = v20;

  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "doubleValue");
  v24 = v23;

  objc_msgSend(a1, "queryWithCoordinate:resultHandler:", v7, v21, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v25;
}

+ (id)queryWithCoordinate:(CLLocationCoordinate2D)a3 resultHandler:(id)a4
{
  double longitude;
  double latitude;
  id v6;
  void *v7;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCoordinate:resultHandler:", v6, latitude, longitude);

  objc_msgSend(v7, "setUnshiftedCoordinate:", latitude, longitude);
  return v7;
}

+ (id)queryWithSearchCompletion:(id)a3 resultHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSearchCompletion:resultHandler:", v6, v5);

  return v7;
}

- (WFLocationQueryGeocode)initWithSearchCompletion:(id)a3 resultHandler:(id)a4
{
  id v7;
  id v8;
  WFLocationQueryGeocode *v9;
  uint64_t v10;
  id resultHandler;
  double v12;
  double v13;
  WFLocationQueryGeocode *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WFLocationQueryGeocode;
  v9 = -[WFLocationQueryGeocode init](&v16, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    resultHandler = v9->_resultHandler;
    v9->_resultHandler = (id)v10;

    objc_storeStrong((id *)&v9->_searchCompletion, a3);
    v12 = *MEMORY[0x24BDBFB70];
    v13 = *(double *)(MEMORY[0x24BDBFB70] + 8);
    -[WFLocationQueryGeocode setSearchCoordinate:](v9, "setSearchCoordinate:", *MEMORY[0x24BDBFB70], v13);
    -[WFLocationQueryGeocode setUnshiftedCoordinate:](v9, "setUnshiftedCoordinate:", v12, v13);
    v14 = v9;
  }

  return v9;
}

+ (id)queryWithSearchString:(id)a3 resultHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSearchString:resultHandler:", v6, v5);

  return v7;
}

- (WFLocationQueryGeocode)initWithSearchString:(id)a3 resultHandler:(id)a4
{
  id v7;
  id v8;
  WFLocationQueryGeocode *v9;
  WFLocationQueryGeocode *v10;
  uint64_t v11;
  id resultHandler;
  double v13;
  double v14;
  NSObject *v15;
  WFLocationQueryGeocode *v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WFLocationQueryGeocode;
  v9 = -[WFLocationQueryGeocode init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_searchString, a3);
    v11 = objc_msgSend(v8, "copy");
    resultHandler = v10->_resultHandler;
    v10->_resultHandler = (id)v11;

    v13 = *MEMORY[0x24BDBFB70];
    v14 = *(double *)(MEMORY[0x24BDBFB70] + 8);
    -[WFLocationQueryGeocode setUnshiftedCoordinate:](v10, "setUnshiftedCoordinate:", *MEMORY[0x24BDBFB70], v14);
    -[WFLocationQueryGeocode setSearchCoordinate:](v10, "setSearchCoordinate:", v13, v14);
    WFLogForCategory(3uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[WFLocationQueryGeocode initWithSearchString:resultHandler:].cold.1();

    v16 = v10;
  }

  return v10;
}

- (WFLocationQueryGeocode)initWithCoordinate:(CLLocationCoordinate2D)a3 resultHandler:(id)a4
{
  double longitude;
  double latitude;
  id v7;
  WFLocationQueryGeocode *v8;
  WFLocationQueryGeocode *v9;
  uint64_t v10;
  id resultHandler;
  NSObject *v12;
  WFLocationQueryGeocode *v13;
  objc_super v15;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFLocationQueryGeocode;
  v8 = -[WFLocationQueryGeocode init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_searchCoordinate.latitude = latitude;
    v8->_searchCoordinate.longitude = longitude;
    v10 = objc_msgSend(v7, "copy");
    resultHandler = v9->_resultHandler;
    v9->_resultHandler = (id)v10;

    -[WFLocationQueryGeocode setUnshiftedCoordinate:](v9, "setUnshiftedCoordinate:", *MEMORY[0x24BDBFB70], *(double *)(MEMORY[0x24BDBFB70] + 8));
    WFLogForCategory(3uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[WFLocationQueryGeocode initWithCoordinate:resultHandler:].cold.1(v12, latitude, longitude);

    v13 = v9;
  }

  return v9;
}

- (void)start
{
  void *v3;
  void *v4;
  id v5;

  -[WFLocationQueryGeocode _reverseGeocoderLocation](self, "_reverseGeocoderLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFLocationQueryGeocode _startCLGeocoderReverseGeo](self, "_startCLGeocoderReverseGeo");
  }
  else
  {
    -[WFLocationQueryGeocode _mkLocalSearchRequest](self, "_mkLocalSearchRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[WFLocationQueryGeocode _startMKLocalSearch](self, "_startMKLocalSearch");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:", 5);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[WFLocationQueryGeocode _handleErrorResponse:](self, "_handleErrorResponse:", v5);

    }
  }
}

- (void)cancel
{
  void *v3;
  id v4;

  -[WFLocationQueryGeocode reverseGeocoder](self, "reverseGeocoder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelGeocode");

  -[WFLocationQueryGeocode search](self, "search");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

}

- (void)_startMKLocalSearch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[WFLocationQueryGeocode _mkLocalSearchRequest](self, "_mkLocalSearchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB0A0]), "initWithRequest:", v3);
  -[WFLocationQueryGeocode setSearch:](self, "setSearch:", v4);

  +[WFLocationQueryGeocodeCacheManager sharedManager](WFLocationQueryGeocodeCacheManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "naturalLanguageQuery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingString:", CFSTR("-MKLocalSearch"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  WFLogForCategory(3uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[WFLocationQueryGeocode searchString](self, "searchString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v11;
    _os_log_impl(&dword_21189A000, v10, OS_LOG_TYPE_DEFAULT, "Executing WFLocationQueryGeocode for search string %@", buf, 0xCu);

  }
  objc_msgSend(v5, "cachedLocationForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    WFLogForCategory(3uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[WFLocationQueryGeocode searchString](self, "searchString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v14;
      _os_log_impl(&dword_21189A000, v13, OS_LOG_TYPE_DEFAULT, "WFLocationQueryGeocode retrieved from cache for search string %@", buf, 0xCu);

    }
    -[WFLocationQueryGeocode handleSearchResponseWithLocation:](self, "handleSearchResponseWithLocation:", v12);
  }
  else
  {
    -[WFLocationQueryGeocode search](self, "search");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __45__WFLocationQueryGeocode__startMKLocalSearch__block_invoke;
    v16[3] = &unk_24CCA09C0;
    v16[4] = self;
    v17 = v3;
    v18 = v9;
    v19 = v5;
    objc_msgSend(v15, "startWithCompletionHandler:", v16);

  }
}

void __45__WFLocationQueryGeocode__startMKLocalSearch__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  WFLocation *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleErrorResponse:");
  }
  else
  {
    objc_msgSend(a2, "mapItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = -[WFLocation initWithMapItem:]([WFLocation alloc], "initWithMapItem:", v5);
    WFLogForCategory(3uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "naturalLanguageQuery");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 48);
      v10 = 138412546;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_21189A000, v7, OS_LOG_TYPE_DEFAULT, "Caching location for search string '%@' within cacheKey '%@'", (uint8_t *)&v10, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 56), "updateCacheForKey:withLocation:", *(_QWORD *)(a1 + 48), v6);
    objc_msgSend(*(id *)(a1 + 32), "handleSearchResponseWithLocation:", v6);

  }
}

- (void)_startCLGeocoderReverseGeo
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_21189A000, v0, OS_LOG_TYPE_ERROR, "Retrieved an invalid location from the cache. key='%@'", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __52__WFLocationQueryGeocode__startCLGeocoderReverseGeo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  WFLocation *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  WFLocation *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    WFLogForCategory(3uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412290;
      v20 = v6;
      _os_log_impl(&dword_21189A000, v7, OS_LOG_TYPE_DEFAULT, "Reverse Geocoder failed to obtain a location with error: %@", (uint8_t *)&v19, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_handleErrorResponse:", v6);
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x24BDDB0F0]);
    v9 = objc_alloc(MEMORY[0x24BDDB160]);
    objc_msgSend(v5, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithPlacemark:", v10);
    v12 = (void *)objc_msgSend(v8, "initWithPlacemark:", v11);

    v13 = -[WFLocation initWithMapItem:]([WFLocation alloc], "initWithMapItem:", v12);
    if (v13 && objc_msgSend(*(id *)(a1 + 32), "isLocationValid:", v13))
    {
      WFLogForCategory(3uLL);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(void **)(a1 + 40);
        v19 = 138412547;
        v20 = v15;
        v21 = 2113;
        v22 = v13;
        _os_log_impl(&dword_21189A000, v14, OS_LOG_TYPE_DEFAULT, "Caching location with cacheKey '%@'. location=%{private}@", (uint8_t *)&v19, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 48), "updateCacheForKey:withLocation:", *(_QWORD *)(a1 + 40), v13);
      objc_msgSend(*(id *)(a1 + 32), "handleSearchResponseWithLocation:", v13);
    }
    else
    {
      WFLogForCategory(3uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138412290;
        v20 = v12;
        _os_log_impl(&dword_21189A000, v16, OS_LOG_TYPE_DEFAULT, "Failed to initialize location with mapItem: %@", (uint8_t *)&v19, 0xCu);
      }

      v17 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:", 16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_handleErrorResponse:", v18);

    }
  }

}

- (BOOL)isLocationValid:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;

  v3 = a3;
  objc_msgSend(v3, "countryAbbreviation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    objc_msgSend(v3, "geoLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "coordinate");
    v8 = v7;

    if (v8 == 0.0)
    {
      WFLogForCategory(3uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[WFLocationQueryGeocode isLocationValid:].cold.2(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    else
    {
      objc_msgSend(v3, "geoLocation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "coordinate");
      v26 = v25;

      if (v26 != 0.0)
      {
        v34 = 1;
        goto LABEL_11;
      }
      WFLogForCategory(3uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[WFLocationQueryGeocode isLocationValid:].cold.3(v9, v27, v28, v29, v30, v31, v32, v33);
    }
  }
  else
  {
    WFLogForCategory(3uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[WFLocationQueryGeocode isLocationValid:].cold.1(v9, v17, v18, v19, v20, v21, v22, v23);
  }

  v34 = 0;
LABEL_11:

  return v34;
}

- (id)_mkLocalSearchRequest
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[WFLocationQueryGeocode searchCompletion](self, "searchCompletion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDDB0B8];
    -[WFLocationQueryGeocode searchCompletion](self, "searchCompletion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchRequestWithCompletion:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:

    return v6;
  }
  -[WFLocationQueryGeocode searchString](self, "searchString");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDDB0B8]);
    -[WFLocationQueryGeocode searchString](self, "searchString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNaturalLanguageQuery:", v5);
    goto LABEL_5;
  }
  return v6;
}

- (id)_reverseGeocoderLocation
{
  id v3;
  double v4;
  double v5;
  void *v6;
  CLLocationCoordinate2D v8;

  -[WFLocationQueryGeocode searchCoordinate](self, "searchCoordinate");
  if (CLLocationCoordinate2DIsValid(v8))
  {
    v3 = objc_alloc(MEMORY[0x24BDBFA80]);
    -[WFLocationQueryGeocode searchCoordinate](self, "searchCoordinate");
    v5 = v4;
    -[WFLocationQueryGeocode searchCoordinate](self, "searchCoordinate");
    v6 = (void *)objc_msgSend(v3, "initWithLatitude:longitude:", v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)handleSearchResponseWithLocation:(id)a3
{
  id v4;
  double latitude;
  double longitude;
  void *v7;
  WFGeocodeResponse *v8;
  void *v9;
  void *v10;
  WFGeocodeResponse *v11;
  NSObject *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  CLLocationCoordinate2D v15;

  v4 = a3;
  -[WFLocationQueryGeocode unshiftedCoordinate](self, "unshiftedCoordinate");
  latitude = v15.latitude;
  longitude = v15.longitude;
  if (CLLocationCoordinate2DIsValid(v15))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFA80]), "initWithLatitude:longitude:", latitude, longitude);
    objc_msgSend(v4, "setGeoLocation:", v7);

  }
  v8 = [WFGeocodeResponse alloc];
  -[WFLocationQueryGeocode identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WFGeocodeResponse initWithIdentifier:location:](v8, "initWithIdentifier:location:", v10, v4);

  objc_storeStrong((id *)&self->_response, v11);
  WFLogForCategory(3uLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[WFLocationQueryGeocode handleSearchResponseWithLocation:].cold.1(self, v12);

  -[WFLocationQueryGeocode resultHandler](self, "resultHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[WFLocationQueryGeocode resultHandler](self, "resultHandler");
    v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, WFGeocodeResponse *))v14)[2](v14, v11);

  }
}

- (void)_handleErrorResponse:(id)a3
{
  id v4;
  WFGeocodeResponse *v5;
  void *v6;
  void *v7;
  WFGeocodeResponse *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);

  v4 = a3;
  v5 = [WFGeocodeResponse alloc];
  -[WFLocationQueryGeocode identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFGeocodeResponse initWithIdentifier:location:](v5, "initWithIdentifier:location:", v7, 0);

  objc_msgSend(v4, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDBFB10]))
  {
    v10 = objc_msgSend(v4, "code");

    if (v10 != 10)
      goto LABEL_5;
    objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:encapsulatedError:userInfo:", 13, v4, 0);
    v9 = v4;
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_5:
  -[WFResponse setError:](v8, "setError:", v4);
  objc_storeStrong((id *)&self->_response, v8);
  WFLogForCategory(3uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[WFLocationQueryGeocode _handleErrorResponse:].cold.1(self, (uint64_t)v4, v11);

  -[WFLocationQueryGeocode resultHandler](self, "resultHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[WFLocationQueryGeocode resultHandler](self, "resultHandler");
    v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, WFGeocodeResponse *))v13)[2](v13, v8);

  }
}

- (WFTaskIdentifier)identifier
{
  return (WFTaskIdentifier *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (MKLocalSearchCompletion)searchCompletion
{
  return (MKLocalSearchCompletion *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)searchString
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (id)resultHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setResultHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (WFResponse)response
{
  return (WFResponse *)objc_getProperty(self, a2, 48, 1);
}

- (void)setResponse:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (CLGeocoder)reverseGeocoder
{
  return self->_reverseGeocoder;
}

- (void)setReverseGeocoder:(id)a3
{
  objc_storeStrong((id *)&self->_reverseGeocoder, a3);
}

- (MKLocalSearch)search
{
  return self->_search;
}

- (void)setSearch:(id)a3
{
  objc_storeStrong((id *)&self->_search, a3);
}

- (CLLocationCoordinate2D)searchCoordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_searchCoordinate.latitude;
  longitude = self->_searchCoordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setSearchCoordinate:(CLLocationCoordinate2D)a3
{
  self->_searchCoordinate = a3;
}

- (CLLocationCoordinate2D)unshiftedCoordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_unshiftedCoordinate.latitude;
  longitude = self->_unshiftedCoordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setUnshiftedCoordinate:(CLLocationCoordinate2D)a3
{
  self->_unshiftedCoordinate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_search, 0);
  objc_storeStrong((id *)&self->_reverseGeocoder, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_searchCompletion, 0);
  objc_storeStrong((id *)&self->identifier, 0);
}

- (void)initWithSearchString:resultHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_21189A000, v0, v1, "Building WFLocationQueryGeocode for search string %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoordinate:(double)a3 resultHandler:.cold.1(NSObject *a1, double a2, double a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  NSStringFromCLLocationCoordinate2D(a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_21189A000, a1, v5, "Building WFLocationQueryGeocode for coordinate %@", v6);

}

- (void)isLocationValid:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_21189A000, a1, a3, "The location is missing its country abbreviation.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

- (void)isLocationValid:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_21189A000, a1, a3, "The location is missing its longitude.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

- (void)isLocationValid:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_21189A000, a1, a3, "The location is missing its latitude.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

- (void)handleSearchResponseWithLocation:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_reverseGeocoderLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(a1, "_mkLocalSearchRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = 138412290;
  v8 = v6;
  OUTLINED_FUNCTION_0(&dword_21189A000, a2, v4, "WFLocationQueryGeocode w/ search '%@' succeeded.", (uint8_t *)&v7);
  if (!v5)

  OUTLINED_FUNCTION_3();
}

- (void)_handleErrorResponse:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "searchString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl(&dword_21189A000, a3, OS_LOG_TYPE_ERROR, "WFLocationQueryGeocode w/ search string '%@' failed with error  Error: %@", v6, 0x16u);

  OUTLINED_FUNCTION_3();
}

@end
