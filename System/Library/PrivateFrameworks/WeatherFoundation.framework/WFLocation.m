@implementation WFLocation

+ (int64_t)currentArchiveVersion
{
  return 1;
}

- (WFLocation)initWithSearchResponse:(id)a3
{
  void *v4;
  void *v5;
  WFLocation *v6;

  objc_msgSend(a3, "mapItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[WFLocation initWithMapItem:](self, "initWithMapItem:", v5);
  return v6;
}

- (WFLocation)initWithMapItem:(id)a3
{
  return -[WFLocation initWithMapItem:isCurrentLocation:](self, "initWithMapItem:isCurrentLocation:", a3, 0);
}

- (WFLocation)initWithMapItem:(id)a3 isCurrentLocation:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *weatherDisplayName;
  void *v13;
  NSString *v14;
  NSString *weatherLocationName;
  WFLocation *v16;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (!v6)
    goto LABEL_10;
  objc_msgSend(v6, "placemark");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[WFLocation initWithPlacemark:](self, "initWithPlacemark:", v8);

  if (self)
  {
    objc_msgSend(v7, "timeZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9 && v4)
    {
      objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&self->_timeZone, v9);
    if (self->_timeZone)
    {
      objc_msgSend(v7, "_weatherDisplayName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (NSString *)objc_msgSend(v10, "copy");
      weatherDisplayName = self->_weatherDisplayName;
      self->_weatherDisplayName = v11;

      objc_msgSend(v7, "_weatherLocationName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (NSString *)objc_msgSend(v13, "copy");
      weatherLocationName = self->_weatherLocationName;
      self->_weatherLocationName = v14;

      goto LABEL_8;
    }

LABEL_10:
    v16 = 0;
    goto LABEL_11;
  }
LABEL_8:
  self = self;
  v16 = self;
LABEL_11:

  return v16;
}

- (WFLocation)initWithPlacemark:(id)a3
{
  id v4;
  WFLocation *v5;
  void *v6;
  uint64_t v7;
  CLLocation *geoLocation;
  uint64_t v9;
  NSString *displayName;
  void *v11;
  uint64_t v12;
  NSString *city;
  void *v14;
  uint64_t v15;
  NSString *county;
  void *v17;
  uint64_t v18;
  NSString *state;
  void *v20;
  uint64_t v21;
  NSString *country;
  void *v23;
  uint64_t v24;
  NSString *countryAbbreviation;
  uint64_t v26;
  NSDate *creationDate;
  NSObject *v28;
  void *v29;
  WFLocation *v30;
  objc_super v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v32.receiver = self;
    v32.super_class = (Class)WFLocation;
    v5 = -[WFLocation init](&v32, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "location");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "copy");
      geoLocation = v5->_geoLocation;
      v5->_geoLocation = (CLLocation *)v7;

      WFLocationNameForPlacemark(v4);
      v9 = objc_claimAutoreleasedReturnValue();
      displayName = v5->_displayName;
      v5->_displayName = (NSString *)v9;

      objc_msgSend(v4, "locality");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      city = v5->_city;
      v5->_city = (NSString *)v12;

      objc_msgSend(v4, "subAdministrativeArea");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      county = v5->_county;
      v5->_county = (NSString *)v15;

      objc_msgSend(v4, "administrativeArea");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "copy");
      state = v5->_state;
      v5->_state = (NSString *)v18;

      objc_msgSend(v4, "country");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "copy");
      country = v5->_country;
      v5->_country = (NSString *)v21;

      objc_msgSend(v4, "ISOcountryCode");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "copy");
      countryAbbreviation = v5->_countryAbbreviation;
      v5->_countryAbbreviation = (NSString *)v24;

      v5->_archiveVersion = objc_msgSend((id)objc_opt_class(), "currentArchiveVersion");
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v26 = objc_claimAutoreleasedReturnValue();
      creationDate = v5->_creationDate;
      v5->_creationDate = (NSDate *)v26;

      WFLogForCategory(3uLL);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        -[WFLocation description](v5, "description");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v34 = v29;
        _os_log_impl(&dword_21189A000, v28, OS_LOG_TYPE_DEFAULT, "Initialized a new location: %@", buf, 0xCu);

      }
    }
    self = v5;
    v30 = self;
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[WFLocation city](self, "city");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "city");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", v7) & 1) != 0)
    {
      v8 = 30000.0;
    }
    else
    {
      -[WFLocation city](self, "city");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v8 = 5000.0;
      }
      else
      {
        objc_msgSend(v5, "city");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = dbl_2118E5E60[v11 == 0];

      }
    }

    -[WFLocation geoLocation](self, "geoLocation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "geoLocation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v12, "wf_isEquivalentToLocation:tolerance:", v13, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WFLocation geoLocation](self, "geoLocation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (id)knownKeys
{
  return &unk_24CCC1340;
}

- (id)summaryThatIsCompact:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ <0x%x>"), objc_opt_class(), self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v6);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend((id)objc_opt_class(), "knownKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    if (v3)
      v11 = CFSTR(" %@:%@");
    else
      v11 = CFSTR("\n      %@ : %@");
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[WFLocation valueForKey:](self, "valueForKey:", v13);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v14)
          objc_msgSend(v5, "appendFormat:", v11, v13, v14, (_QWORD)v17);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  return v5;
}

- (BOOL)needsGeocoding
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[WFLocation countryAbbreviation](self, "countryAbbreviation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WFLocation timeZone](self, "timeZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[WFLocation weatherDisplayName](self, "weatherDisplayName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        -[WFLocation weatherLocationName](self, "weatherLocationName");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6 == 0;

      }
      else
      {
        v7 = 1;
      }

    }
    else
    {
      v7 = 1;
    }

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)summary
{
  return -[WFLocation summaryThatIsCompact:](self, "summaryThatIsCompact:", 0);
}

- (id)description
{
  return -[WFLocation summaryThatIsCompact:](self, "summaryThatIsCompact:", 1);
}

- (void)encodeWithCoder:(id)a3
{
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
  id v17;

  v17 = a3;
  -[WFLocation city](self, "city");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v4, CFSTR("WFLocationCodingCity"));

  -[WFLocation county](self, "county");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v5, CFSTR("WFLocationCodingCounty"));

  -[WFLocation state](self, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v6, CFSTR("WFLocationCodingState"));

  -[WFLocation stateAbbreviation](self, "stateAbbreviation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v7, CFSTR("WFLocationCodingStateAbbreviation"));

  -[WFLocation country](self, "country");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v8, CFSTR("WFLocationCodingCountry"));

  -[WFLocation countryAbbreviation](self, "countryAbbreviation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v9, CFSTR("WFLocationCodingCountryAbbreviation"));

  -[WFLocation geoLocation](self, "geoLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v10, CFSTR("WFLocationCodingGeoLocation"));

  -[WFLocation locationID](self, "locationID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v11, CFSTR("WFLocationCodingLocationID"));

  -[WFLocation timeZone](self, "timeZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v12, CFSTR("WFLocationCodingTimeZone"));

  -[WFLocation creationDate](self, "creationDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v13, CFSTR("WFLocationCodingCreationDate"));

  -[WFLocation displayName](self, "displayName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v14, CFSTR("WFLocationDisplayName"));

  -[WFLocation weatherDisplayName](self, "weatherDisplayName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v15, CFSTR("WFLocationWeatherDisplayNameKey"));

  -[WFLocation weatherLocationName](self, "weatherLocationName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v16, CFSTR("WFLocationWeatherLacationName"));

  objc_msgSend(v17, "encodeInteger:forKey:", -[WFLocation archiveVersion](self, "archiveVersion"), CFSTR("WFLocationArchiveVersion"));
}

- (WFLocation)initWithCoder:(id)a3
{
  id v4;
  WFLocation *v5;
  uint64_t v6;
  NSString *city;
  uint64_t v8;
  NSString *county;
  uint64_t v10;
  NSString *state;
  uint64_t v12;
  NSString *stateAbbreviation;
  uint64_t v14;
  NSString *country;
  uint64_t v16;
  NSString *countryAbbreviation;
  uint64_t v18;
  CLLocation *geoLocation;
  uint64_t v20;
  NSString *locationID;
  uint64_t v22;
  NSTimeZone *timeZone;
  uint64_t v24;
  NSDate *creationDate;
  uint64_t v26;
  NSString *displayName;
  uint64_t v28;
  NSString *weatherDisplayName;
  uint64_t v30;
  NSString *weatherLocationName;
  uint64_t v32;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)WFLocation;
  v5 = -[WFLocation init](&v34, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFLocationCodingCity"));
    v6 = objc_claimAutoreleasedReturnValue();
    city = v5->_city;
    v5->_city = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFLocationCodingCounty"));
    v8 = objc_claimAutoreleasedReturnValue();
    county = v5->_county;
    v5->_county = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFLocationCodingState"));
    v10 = objc_claimAutoreleasedReturnValue();
    state = v5->_state;
    v5->_state = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFLocationCodingStateAbbreviation"));
    v12 = objc_claimAutoreleasedReturnValue();
    stateAbbreviation = v5->_stateAbbreviation;
    v5->_stateAbbreviation = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFLocationCodingCountry"));
    v14 = objc_claimAutoreleasedReturnValue();
    country = v5->_country;
    v5->_country = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFLocationCodingCountryAbbreviation"));
    v16 = objc_claimAutoreleasedReturnValue();
    countryAbbreviation = v5->_countryAbbreviation;
    v5->_countryAbbreviation = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFLocationCodingGeoLocation"));
    v18 = objc_claimAutoreleasedReturnValue();
    geoLocation = v5->_geoLocation;
    v5->_geoLocation = (CLLocation *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFLocationCodingLocationID"));
    v20 = objc_claimAutoreleasedReturnValue();
    locationID = v5->_locationID;
    v5->_locationID = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFLocationCodingTimeZone"));
    v22 = objc_claimAutoreleasedReturnValue();
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFLocationCodingCreationDate"));
    v24 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFLocationDisplayName"));
    v26 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFLocationWeatherDisplayNameKey"));
    v28 = objc_claimAutoreleasedReturnValue();
    weatherDisplayName = v5->_weatherDisplayName;
    v5->_weatherDisplayName = (NSString *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFLocationWeatherLacationName"));
    v30 = objc_claimAutoreleasedReturnValue();
    weatherLocationName = v5->_weatherLocationName;
    v5->_weatherLocationName = (NSString *)v30;

    v32 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("WFLocationArchiveVersion"));
    v5->_archiveVersion = v32;
    if (!v32)
      v32 = objc_msgSend((id)objc_opt_class(), "currentArchiveVersion");
    v5->_archiveVersion = v32;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
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

  objc_opt_class();
  v4 = (void *)objc_opt_new();
  -[WFLocation city](self, "city");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCity:", v5);

  -[WFLocation state](self, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setState:", v6);

  -[WFLocation county](self, "county");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCounty:", v7);

  -[WFLocation country](self, "country");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCountry:", v8);

  -[WFLocation stateAbbreviation](self, "stateAbbreviation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStateAbbreviation:", v9);

  -[WFLocation countryAbbreviation](self, "countryAbbreviation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCountryAbbreviation:", v10);

  -[WFLocation displayName](self, "displayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayName:", v11);

  -[WFLocation weatherDisplayName](self, "weatherDisplayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWeatherDisplayName:", v12);

  -[WFLocation weatherLocationName](self, "weatherLocationName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWeatherLocationName:", v13);

  -[WFLocation creationDate](self, "creationDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCreationDate:", v14);

  -[WFLocation geoLocation](self, "geoLocation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGeoLocation:", v15);

  -[WFLocation locationID](self, "locationID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocationID:", v16);

  -[WFLocation timeZone](self, "timeZone");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeZone:", v17);

  objc_msgSend(v4, "setArchiveVersion:", -[WFLocation archiveVersion](self, "archiveVersion"));
  return v4;
}

- (NSString)locationID
{
  NSString *locationID;
  void *v4;
  void *v5;
  double v6;
  double v7;
  NSString *v8;
  void *v9;
  NSString *v10;

  locationID = self->_locationID;
  if (!locationID)
  {
    -[WFLocation geoLocation](self, "geoLocation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!v4
      || (objc_msgSend(v4, "coordinate"),
          NSStringFromCLLocationCoordinate2D(v6, v7),
          (v8 = (NSString *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "UUIDString");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();

    }
    v10 = self->_locationID;
    self->_locationID = v8;

    locationID = self->_locationID;
  }
  return locationID;
}

- (void)setGeoLocation:(id)a3
{
  CLLocation *v4;
  CLLocation *geoLocation;
  NSString *locationID;

  v4 = (CLLocation *)objc_msgSend(a3, "copy");
  geoLocation = self->_geoLocation;
  self->_geoLocation = v4;

  locationID = self->_locationID;
  self->_locationID = 0;

}

+ (id)locationsByFilteringDuplicates:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "city", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v13, "addObject:", v11);
        objc_msgSend(v11, "city");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v13, v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  objc_msgSend(a1, "locationsByConsolidatingDuplicates:originalOrder:", v5, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)locationsByConsolidatingDuplicates:(id)a3 originalOrder:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v18 = a3;
  v17 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v7 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __63__WFLocation_locationsByConsolidatingDuplicates_originalOrder___block_invoke;
  v25[3] = &unk_24CCA2638;
  v8 = v6;
  v27 = &v29;
  v28 = a1;
  v26 = v8;
  objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v25);
  if (*((_BYTE *)v30 + 24))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = v17;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v9);
          v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          v20[0] = v7;
          v20[1] = 3221225472;
          v20[2] = __63__WFLocation_locationsByConsolidatingDuplicates_originalOrder___block_invoke_2;
          v20[3] = &unk_24CCA2660;
          v20[4] = v13;
          v14 = objc_msgSend(v8, "indexOfObjectPassingTest:", v20);
          if (v14 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v8, "objectAtIndex:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v15);
            objc_msgSend(v8, "removeObject:", v15);

          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
      }
      while (v10);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v17);
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v29, 8);
  return v19;
}

void __63__WFLocation_locationsByConsolidatingDuplicates_originalOrder___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "count") == 1)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v7, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "locationsByConsolidatingDuplicatesInBucket:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v5);
    v6 = objc_msgSend(v5, "count");
    if (v6 != objc_msgSend(v7, "count"))
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

uint64_t __63__WFLocation_locationsByConsolidatingDuplicates_originalOrder___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isEqual:", a2);
}

+ (id)locationsByConsolidatingDuplicatesInBucket:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  id obj;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v19;
    v8 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v14 = 0;
        v15 = &v14;
        v16 = 0x2020000000;
        v17 = 1;
        v13[0] = v8;
        v13[1] = 3221225472;
        v13[2] = __57__WFLocation_locationsByConsolidatingDuplicatesInBucket___block_invoke;
        v13[3] = &unk_24CCA2688;
        v13[4] = v10;
        v13[5] = &v14;
        objc_msgSend(v4, "enumerateObjectsUsingBlock:", v13);
        if (!*((_BYTE *)v15 + 24))
          objc_msgSend(v4, "addObject:", v10);
        _Block_object_dispose(&v14, 8);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  return v4;
}

uint64_t __57__WFLocation_locationsByConsolidatingDuplicatesInBucket___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32));
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (BOOL)isDay
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[WFLocation isDayForDate:](self, "isDayForDate:", v3);

  return (char)self;
}

- (BOOL)isDayForDate:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  if (!a3)
    return 0;
  v4 = (objc_class *)MEMORY[0x24BE3CB68];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[WFLocation geoLocation](self, "geoLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "coordinate");
  v9 = v8;
  v11 = v10;

  objc_msgSend(v6, "calculateAstronomicalTimeForLocation:", v9, v11);
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v13 = v12;

  LOBYTE(v7) = objc_msgSend(v6, "isDayLightForTime:", v13);
  return (char)v7;
}

- (id)_sunAlmanacForDate:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v4 = (objc_class *)MEMORY[0x24BE3CB68];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[WFLocation geoLocation](self, "geoLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "coordinate");
  v9 = v8;
  v11 = v10;

  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v13 = v12;

  objc_msgSend(v6, "calculateAstronomicalTimeForLocation:time:altitudeInDegrees:options:", 2, v9, v11, v13, *MEMORY[0x24BE3C908]);
  return v6;
}

- (void)sunrise:(id *)a3 andSunset:(id *)a4 forDate:(id)a5
{
  void *v7;
  id v8;

  if ((unint64_t)a3 | (unint64_t)a4)
  {
    -[WFLocation _sunAlmanacForDate:](self, "_sunAlmanacForDate:", a5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (a3)
    {
      objc_msgSend(v7, "sunrise");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      v7 = v8;
    }
    if (a4)
    {
      objc_msgSend(v8, "sunset");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      v7 = v8;
    }

  }
}

- (id)sunriseForDate:(id)a3
{
  void *v3;
  void *v4;

  -[WFLocation _sunAlmanacForDate:](self, "_sunAlmanacForDate:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sunrise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)sunsetForDate:(id)a3
{
  void *v3;
  void *v4;

  -[WFLocation _sunAlmanacForDate:](self, "_sunAlmanacForDate:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sunset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)shouldQueryForAirQualityData
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  char v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[WFLocation countryAbbreviation](self, "countryAbbreviation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[WFSettingsManager sharedInstance](WFSettingsManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "settings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "aqiEnabledCountryCodes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    WFLogForCategory(3uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412546;
      v10 = v2;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_21189A000, v6, OS_LOG_TYPE_DEFAULT, "Current country code=%@; AQI enabled country codes=%@",
        (uint8_t *)&v9,
        0x16u);
    }

    v7 = objc_msgSend(v5, "containsObject:", v2);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)displayName
{
  NSString *displayName;
  NSString *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSString *v16;
  NSString *v17;

  displayName = self->_displayName;
  if (displayName)
  {
    v3 = displayName;
  }
  else
  {
    -[WFLocation city](self, "city");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLocation country](self, "country");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLocation countryAbbreviation](self, "countryAbbreviation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLocation state](self, "state");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLocation stateAbbreviation](self, "stateAbbreviation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_opt_new();
    if (objc_msgSend(v5, "length"))
      objc_msgSend(v10, "addObject:", v5);
    v11 = objc_msgSend(v8, "length");
    v12 = v8;
    if (v11
      || (v13 = objc_msgSend(v9, "length", v8), v12 = v9, v13)
      || (v14 = objc_msgSend(v6, "length", v9), v12 = v6, v14)
      || (v15 = objc_msgSend(v7, "length", v6), v12 = v7, v15))
    {
      objc_msgSend(v10, "addObject:", v12);
    }
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v17 = self->_displayName;
    self->_displayName = v16;

    v3 = v16;
  }
  return v3;
}

- (id)localDataRepresentation
{
  return (id)objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
}

- (WFLocation)initWithLocalDataRepresentation:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  WFLocation *v9;
  id v11;

  v4 = (void *)MEMORY[0x24BDD1620];
  v5 = a3;
  v11 = 0;
  objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v11;
  if (v7)
  {
    WFLogForCategory(7uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[WFLocation initWithLocalDataRepresentation:].cold.1((uint64_t)v7, v8);

    v9 = 0;
  }
  else
  {
    v9 = v6;
  }

  return v9;
}

- (id)cloudDictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLocation city](self, "city");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("CityName"));

  v5 = (void *)MEMORY[0x24BDD16E0];
  -[WFLocation geoLocation](self, "geoLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "coordinate");
  objc_msgSend(v5, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("Latitude"));

  v8 = (void *)MEMORY[0x24BDD16E0];
  -[WFLocation geoLocation](self, "geoLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "coordinate");
  objc_msgSend(v8, "numberWithDouble:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("Longitude"));

  return v3;
}

- (WFLocation)initWithCloudDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  WFLocation *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  CLLocation *v17;
  CLLocation *geoLocation;
  CLLocation *v19;
  void *v20;
  uint64_t v21;
  NSString *city;
  uint64_t v23;
  NSDate *creationDate;
  WFLocation *v25;
  objc_super v27;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("Longitude"), CFSTR("Latitude"), CFSTR("CityName"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "count"))
    goto LABEL_6;
  v6 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v4, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "intersectsSet:", v5);

  if (v9)
  {
    v27.receiver = self;
    v27.super_class = (Class)WFLocation;
    v10 = -[WFLocation init](&v27, sel_init);
    if (v10)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Latitude"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v13 = v12;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Longitude"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValue");
      v16 = v15;

      v17 = (CLLocation *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFA80]), "initWithLatitude:longitude:", v13, v16);
      geoLocation = v10->_geoLocation;
      v10->_geoLocation = v17;
      v19 = v17;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CityName"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "copy");
      city = v10->_city;
      v10->_city = (NSString *)v21;

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v23 = objc_claimAutoreleasedReturnValue();
      creationDate = v10->_creationDate;
      v10->_creationDate = (NSDate *)v23;

    }
    self = v10;
    v25 = self;
  }
  else
  {
LABEL_6:
    v25 = 0;
  }

  return v25;
}

- (CLLocation)geoLocation
{
  return self->_geoLocation;
}

- (void)setLocationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)weatherDisplayName
{
  return self->_weatherDisplayName;
}

- (void)setWeatherDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)weatherLocationName
{
  return self->_weatherLocationName;
}

- (void)setWeatherLocationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)city
{
  return self->_city;
}

- (void)setCity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)county
{
  return self->_county;
}

- (void)setCounty:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)stateAbbreviation
{
  return self->_stateAbbreviation;
}

- (void)setStateAbbreviation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)countryAbbreviation
{
  return self->_countryAbbreviation;
}

- (void)setCountryAbbreviation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_timeZone, a3);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (int64_t)archiveVersion
{
  return self->_archiveVersion;
}

- (void)setArchiveVersion:(int64_t)a3
{
  self->_archiveVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_countryAbbreviation, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_stateAbbreviation, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_county, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_weatherLocationName, 0);
  objc_storeStrong((id *)&self->_weatherDisplayName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_locationID, 0);
  objc_storeStrong((id *)&self->_geoLocation, 0);
}

- (NSString)wf_weatherChannelGeocodeValue
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[WFLocation geoLocation](self, "geoLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coordinate");
  v6 = v5;
  -[WFLocation geoLocation](self, "geoLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "coordinate");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%f,%f"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)initWithLocalDataRepresentation:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21189A000, a2, OS_LOG_TYPE_ERROR, "Error occured while unarchiving %@", (uint8_t *)&v2, 0xCu);
}

@end
