@implementation WFURLComponents

+ (void)locationForURLComponents:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  WFGeocodeRequest *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  WFGeocodeRequest *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, uint64_t);
  void *v18;
  id v19;
  id v20;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    if (objc_msgSend(v5, "cityIndex") == 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = [WFGeocodeRequest alloc];
      objc_msgSend(v5, "location");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "coordinate");
      v10 = v9;
      v12 = v11;
      v15 = MEMORY[0x24BDAC760];
      v16 = 3221225472;
      v17 = __55__WFURLComponents_locationForURLComponents_completion___block_invoke;
      v18 = &unk_24CCA1DC0;
      v20 = v6;
      v19 = v5;
      v13 = -[WFGeocodeRequest initWithCoordinate:resultHandler:](v7, "initWithCoordinate:resultHandler:", &v15, v10, v12);

      -[WFTask start](v13, "start", v15, v16, v17, v18);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:", 5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v14);

    }
  }

}

void __55__WFURLComponents_locationForURLComponents_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void (*v5)(void);
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  if (a3)
  {
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "locationName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "locationName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDisplayName:", v7);

    }
    objc_msgSend(*(id *)(a1 + 32), "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setGeoLocation:", v8);

    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v5();

}

+ (void)locationForURL:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_class();
  +[WFURLComponents componentsForURL:](WFURLComponents, "componentsForURL:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "locationForURLComponents:completion:", v8, v5);
}

+ (id)componentsForURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  CLLocationCoordinate2D *v24;
  uint64_t v25;
  void *v26;
  __int128 v27;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("weather.apple.com"));

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v3, "host");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasSuffix:", CFSTR("weather.com"));

    v7 = 0;
    v10 = 0;
    if (!v9)
      goto LABEL_8;
  }
  objc_msgSend(v4, "setDestination:", v7);
  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v3, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = (CLLocationCoordinate2D *)&v23;
  v25 = 0x3010000000;
  v26 = &unk_2118F076A;
  v27 = *MEMORY[0x24BDBFB70];
  objc_msgSend(v11, "queryItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __36__WFURLComponents_componentsForURL___block_invoke;
  v20 = &unk_24CCA1DE8;
  v22 = &v23;
  v13 = v4;
  v21 = v13;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", &v17);

  if (CLLocationCoordinate2DIsValid(v24[2]))
  {
    v14 = objc_alloc(MEMORY[0x24BDBFA80]);
    v15 = (void *)objc_msgSend(v14, "initWithLatitude:longitude:", v24[2].latitude, v24[2].longitude, v17, v18, v19, v20);
    objc_msgSend(v13, "setLocation:", v15);

    v10 = v13;
  }
  else
  {
    v10 = 0;
  }

  _Block_object_dispose(&v23, 8);
LABEL_8:

  return v10;
}

void __36__WFURLComponents_componentsForURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  objc_msgSend(v3, "name");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("lat")) & 1) != 0
    || objc_msgSend(v9, "isEqualToString:", CFSTR("lat")))
  {
    objc_msgSend(v4, "doubleValue");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = v5;
  }
  else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("long")) & 1) != 0
         || (objc_msgSend(v9, "isEqualToString:", CFSTR("lon")) & 1) != 0
         || objc_msgSend(v9, "isEqualToString:", CFSTR("lng")))
  {
    objc_msgSend(v4, "doubleValue");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v6;
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("city")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setLocationName:", v4);
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("isShowingHourly")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setShowHourlyWeatherOnly:", objc_msgSend(v4, "BOOLValue"));
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("par")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setPlatform:", v4);
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("locale")))
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "setLocale:", v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setLocale:", v8);

    }
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("isLocal")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsLocalWeatherCity:", objc_msgSend(v4, "BOOLValue"));
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("index")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setCityIndex:", objc_msgSend(v4, "integerValue"));
  }

}

+ (id)componentsForLocation:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLocation:", v3);

  return v4;
}

- (WFURLComponents)init
{
  WFURLComponents *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFURLComponents;
  v2 = -[WFURLComponents init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFURLComponents setLocale:](v2, "setLocale:", v3);

    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "processName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFURLComponents setPlatform:](v2, "setPlatform:", v5);

    -[WFURLComponents setCityIndex:](v2, "setCityIndex:", 0x7FFFFFFFFFFFFFFFLL);
  }
  return v2;
}

- (WFURLComponents)initWithLocation:(id)a3
{
  id v4;
  WFURLComponents *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = -[WFURLComponents init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "geoLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFURLComponents setLocation:](v5, "setLocation:", v6);

    objc_msgSend(v4, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFURLComponents setLocationName:](v5, "setLocationName:", v7);

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFURLComponents)initWithCoder:(id)a3
{
  id v4;
  WFURLComponents *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = -[WFURLComponents init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFURLComponents setLocation:](v5, "setLocation:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locationName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFURLComponents setLocationName:](v5, "setLocationName:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locale"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFURLComponents setLocale:](v5, "setLocale:", v8);

    -[WFURLComponents setShowHourlyWeatherOnly:](v5, "setShowHourlyWeatherOnly:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showHourlyWeatherOnly")));
    -[WFURLComponents setDestination:](v5, "setDestination:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("destination")));
    -[WFURLComponents setIsLocalWeatherCity:](v5, "setIsLocalWeatherCity:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isLocalWeatherCity")));
    -[WFURLComponents setCityIndex:](v5, "setCityIndex:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cityIndex")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[WFURLComponents location](self, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("location"));

  -[WFURLComponents locationName](self, "locationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("locationName"));

  -[WFURLComponents locale](self, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("locale"));

  objc_msgSend(v7, "encodeBool:forKey:", -[WFURLComponents showHourlyWeatherOnly](self, "showHourlyWeatherOnly"), CFSTR("showHourlyWeatherOnly"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[WFURLComponents destination](self, "destination"), CFSTR("destination"));
  objc_msgSend(v7, "encodeBool:forKey:", -[WFURLComponents isLocalWeatherCity](self, "isLocalWeatherCity"), CFSTR("isLocalWeatherCity"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[WFURLComponents cityIndex](self, "cityIndex"), CFSTR("cityIndex"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_opt_class();
  v4 = (void *)objc_opt_new();
  -[WFURLComponents location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocation:", v5);

  -[WFURLComponents locationName](self, "locationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocationName:", v6);

  -[WFURLComponents locale](self, "locale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocale:", v7);

  objc_msgSend(v4, "setShowHourlyWeatherOnly:", -[WFURLComponents showHourlyWeatherOnly](self, "showHourlyWeatherOnly"));
  objc_msgSend(v4, "setDestination:", -[WFURLComponents destination](self, "destination"));
  objc_msgSend(v4, "setIsLocalWeatherCity:", -[WFURLComponents isLocalWeatherCity](self, "isLocalWeatherCity"));
  objc_msgSend(v4, "setCityIndex:", -[WFURLComponents cityIndex](self, "cityIndex"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[WFURLComponents isEqualToComponents:](self, "isEqualToComponents:", v4);

  return v5;
}

- (BOOL)isEqualToComponents:(id)a3
{
  WFURLComponents *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = (WFURLComponents *)a3;
  if (v4 == self
    || (v11.receiver = self,
        v11.super_class = (Class)WFURLComponents,
        -[WFURLComponents isEqual:](&v11, sel_isEqual_, v4)))
  {
    v5 = 1;
  }
  else
  {
    -[WFURLComponents URL](self, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFURLComponents URL](v4, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "isEqualToString:", v9);

  }
  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WFURLComponents URL](self, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSURL)URL
{
  unint64_t v3;
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
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;

  if (-[WFURLComponents _canBuildURLWithProvidedComponents](self, "_canBuildURLWithProvidedComponents"))
  {
    v3 = -[WFURLComponents destination](self, "destination");
    if (v3)
    {
      if (v3 != 1)
      {
        v4 = 0;
        v5 = 0;
LABEL_18:
        objc_msgSend(v4, "URL");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        return (NSURL *)v30;
      }
      v4 = (void *)objc_opt_new();
      objc_msgSend(v4, "setScheme:", CFSTR("https"));
      objc_msgSend(v4, "setHost:", CFSTR("weather.apple.com"));
      objc_msgSend(v4, "setPath:", CFSTR("/"));
      v5 = (void *)objc_opt_new();
      if (-[WFURLComponents cityIndex](self, "cityIndex") == 0x7FFFFFFFFFFFFFFFLL)
      {
        -[WFURLComponents location](self, "location");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)MEMORY[0x24BDD1838];
        v8 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v6, "coordinate");
        objc_msgSend(v8, "numberWithDouble:");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringValue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "queryItemWithName:value:", CFSTR("lat"), v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        v12 = (void *)MEMORY[0x24BDD1838];
        v13 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v6, "coordinate");
        objc_msgSend(v13, "numberWithDouble:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "queryItemWithName:value:", CFSTR("long"), v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v17);

        -[WFURLComponents locationName](self, "locationName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          v19 = (void *)MEMORY[0x24BDD1838];
          -[WFURLComponents locationName](self, "locationName");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "queryItemWithName:value:", CFSTR("city"), v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v21);

        }
        v22 = (void *)MEMORY[0x24BDD1838];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[WFURLComponents showHourlyWeatherOnly](self, "showHourlyWeatherOnly"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringValue");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "queryItemWithName:value:", CFSTR("isShowingHourly"), v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v25);

        if (!-[WFURLComponents isLocalWeatherCity](self, "isLocalWeatherCity"))
          goto LABEL_16;
        v26 = (void *)MEMORY[0x24BDD1838];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[WFURLComponents isLocalWeatherCity](self, "isLocalWeatherCity"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringValue");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "queryItemWithName:value:", CFSTR("isLocal"), v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v29);

      }
      else
      {
        v50 = (void *)MEMORY[0x24BDD1838];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[WFURLComponents cityIndex](self, "cityIndex"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringValue");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "queryItemWithName:value:", CFSTR("index"), v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v28);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1808], "componentsWithString:", CFSTR("https://www.weather.com/wx/today/"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_opt_new();
      -[WFURLComponents location](self, "location");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v31;
      if (v31)
      {
        v32 = (void *)MEMORY[0x24BDD1838];
        v33 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v31, "coordinate");
        objc_msgSend(v33, "stringWithFormat:", CFSTR("%.2f"), v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "queryItemWithName:value:", CFSTR("lat"), v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v36);

        v37 = (void *)MEMORY[0x24BDD1838];
        v38 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v6, "coordinate");
        objc_msgSend(v38, "stringWithFormat:", CFSTR("%.2f"), v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "queryItemWithName:value:", CFSTR("lon"), v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v41);

      }
      -[WFURLComponents locale](self, "locale");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKey:", *MEMORY[0x24BDBCAE8]);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "uppercaseString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "objectForKey:", *MEMORY[0x24BDBCB20]);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "lowercaseString");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), v44, v28);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("locale"), v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v46);

      v47 = (void *)MEMORY[0x24BDD1838];
      -[WFURLComponents platform](self, "platform");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "queryItemWithName:value:", CFSTR("par"), v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v49);

    }
LABEL_16:

    if (v5)
      objc_msgSend(v4, "setQueryItems:", v5);
    goto LABEL_18;
  }
  v30 = 0;
  return (NSURL *)v30;
}

- (BOOL)_canBuildURLWithProvidedComponents
{
  unint64_t v3;
  void *v4;
  BOOL v5;

  v3 = -[WFURLComponents destination](self, "destination");
  if (!v3)
    return 1;
  if (v3 != 1)
    return 0;
  -[WFURLComponents location](self, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = 1;
  else
    v5 = -[WFURLComponents cityIndex](self, "cityIndex") != 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

- (unint64_t)destination
{
  return self->_destination;
}

- (void)setDestination:(unint64_t)a3
{
  self->_destination = a3;
}

- (CLLocation)location
{
  return (CLLocation *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLocation:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)locationName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLocationName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (BOOL)showHourlyWeatherOnly
{
  return self->_showHourlyWeatherOnly;
}

- (void)setShowHourlyWeatherOnly:(BOOL)a3
{
  self->_showHourlyWeatherOnly = a3;
}

- (BOOL)isLocalWeatherCity
{
  return self->_isLocalWeatherCity;
}

- (void)setIsLocalWeatherCity:(BOOL)a3
{
  self->_isLocalWeatherCity = a3;
}

- (unint64_t)cityIndex
{
  return self->_cityIndex;
}

- (void)setCityIndex:(unint64_t)a3
{
  self->_cityIndex = a3;
}

- (NSLocale)locale
{
  return (NSLocale *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLocale:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)platform
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPlatform:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_locationName, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
