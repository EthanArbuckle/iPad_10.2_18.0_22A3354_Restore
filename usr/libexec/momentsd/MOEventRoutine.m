@implementation MOEventRoutine

- (MOEventRoutine)init
{
  MOEventRoutine *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MOEventRoutine;
  result = -[MOEventRoutine init](&v3, "init");
  if (result)
    result->_isInvalid = 0;
  return result;
}

+ (id)descriptionOfMode:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Unknown");
  if (a3 == 1)
    v3 = CFSTR("Local");
  if (a3 == 2)
    return CFSTR("Tourist");
  else
    return (id)v3;
}

+ (id)stringOfPlaceUserType:(unint64_t)a3
{
  id result;

  switch(a3)
  {
    case 1uLL:
      result = CFSTR("Home");
      break;
    case 2uLL:
      result = CFSTR("Work");
      break;
    case 3uLL:
      result = CFSTR("School");
      break;
    case 4uLL:
      result = CFSTR("Gym");
      break;
    default:
      if (a3 == 100)
        result = CFSTR("Outing");
      else
        result = CFSTR("Unknown");
      break;
  }
  return result;
}

+ (id)stringOfPlaceInferencePlaceType:(unint64_t)a3
{
  id result;
  const __CFString *v4;
  const __CFString *v5;

  result = CFSTR("Unknown");
  if ((uint64_t)a3 > 99)
  {
    v4 = CFSTR("State");
    v5 = CFSTR("Country");
    if (a3 != 102)
      v5 = CFSTR("Unknown");
    if (a3 != 101)
      v4 = v5;
    if (a3 == 100)
      return CFSTR("City");
    else
      return (id)v4;
  }
  else
  {
    switch(a3)
    {
      case 1uLL:
        result = CFSTR("NonClassified");
        break;
      case 2uLL:
        result = CFSTR("AreaOfInterest");
        break;
      case 3uLL:
        result = CFSTR("PointOfInterest");
        break;
      case 4uLL:
        result = CFSTR("Address");
        break;
      case 5uLL:
        result = CFSTR("CoarseAddress");
        break;
      case 6uLL:
        result = CFSTR("Custom");
        break;
      default:
        return result;
    }
  }
  return result;
}

+ (id)stringOfMapItemPlaceType:(unint64_t)a3
{
  id result;

  result = CFSTR("AreaOfInterest");
  switch(a3)
  {
    case 0uLL:
      result = CFSTR("Unknown");
      break;
    case 1uLL:
      return result;
    case 2uLL:
      result = CFSTR("PointOfInterest");
      break;
    case 3uLL:
      result = CFSTR("Address");
      break;
    case 4uLL:
    case 5uLL:
      result = CFSTR("Country");
      break;
    case 6uLL:
      result = CFSTR("AdministrativeArea");
      break;
    case 7uLL:
      result = CFSTR("Locality");
      break;
    case 8uLL:
      result = CFSTR("TimeZone");
      break;
    case 9uLL:
      result = CFSTR("SubLocality");
      break;
    case 0xAuLL:
      result = CFSTR("Ocean");
      break;
    case 0xBuLL:
      result = CFSTR("InlandWater");
      break;
    case 0xCuLL:
      result = CFSTR("Island");
      break;
    case 0xDuLL:
      result = CFSTR("Street");
      break;
    case 0xEuLL:
      result = CFSTR("Admin");
      break;
    case 0xFuLL:
      result = CFSTR("Postal");
      break;
    case 0x10uLL:
      result = CFSTR("Intersection");
      break;
    case 0x11uLL:
      result = CFSTR("Building");
      break;
    case 0x12uLL:
      result = CFSTR("Continent");
      break;
    case 0x13uLL:
      result = CFSTR("Region");
      break;
    case 0x14uLL:
      result = CFSTR("Division");
      break;
    default:
      if (a3 == 1000)
        result = CFSTR("Undefined");
      break;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 isInvalid;
  double placeNameConfidence;
  id v6;

  isInvalid = self->_isInvalid;
  v6 = a3;
  objc_msgSend(v6, "encodeBool:forKey:", isInvalid, CFSTR("isInvalid"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isHighConfidence, CFSTR("isHighConfidence"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_placeName, CFSTR("placeName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_location, CFSTR("location"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_placeType, CFSTR("placeType"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_placeUserType, CFSTR("placeUserType"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_mode, CFSTR("mode"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_placeDiscovery, CFSTR("placeDiscovery"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_address, CFSTR("address"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_geoAddressObject, CFSTR("geoAddressObject"));
  placeNameConfidence = self->_placeNameConfidence;
  *(float *)&placeNameConfidence = placeNameConfidence;
  objc_msgSend(v6, "encodeFloat:forKey:", CFSTR("placeNameConfidence"), placeNameConfidence);
  objc_msgSend(v6, "encodeObject:forKey:", self->_placeMapItem, CFSTR("placeMapItem"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_poiCategory, CFSTR("poiCategory"));
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("familiarityIndexLOI"), self->_familiarityIndexLOI);
  objc_msgSend(v6, "encodeInteger:forKey:", self->_placeSource, CFSTR("placeSource"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_predominantWeather, CFSTR("predominantWeather"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isPreOnboardedVisit, CFSTR("isPreOnboardedVisit"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_mapItemLocation, CFSTR("mapItemLocation"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_mapItemID, CFSTR("mapItemID"));

}

- (MOEventRoutine)initWithCoder:(id)a3
{
  id v4;
  MOEventRoutine *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  NSString *placeName;
  uint64_t v10;
  id v11;
  uint64_t v12;
  RTLocation *location;
  uint64_t v14;
  id v15;
  uint64_t v16;
  RTAddress *address;
  uint64_t v18;
  id v19;
  uint64_t v20;
  GEOAddressObject *geoAddressObject;
  float v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  NSData *placeMapItem;
  uint64_t v27;
  id v28;
  uint64_t v29;
  NSString *poiCategory;
  double v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  MOWeather *predominantWeather;
  uint64_t v36;
  id v37;
  uint64_t v38;
  RTLocation *mapItemLocation;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)MOEventRoutine;
  v5 = -[MOEventRoutine init](&v41, "init");
  if (v5)
  {
    v5->_isInvalid = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isInvalid"));
    v5->_isHighConfidence = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isHighConfidence"));
    v5->_isPreOnboardedVisit = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPreOnboardedVisit"));
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v6), CFSTR("placeName"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    placeName = v5->_placeName;
    v5->_placeName = (NSString *)v8;

    v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(RTLocation, v10), CFSTR("location"));
    v12 = objc_claimAutoreleasedReturnValue(v11);
    location = v5->_location;
    v5->_location = (RTLocation *)v12;

    v5->_placeType = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("placeType"));
    v5->_placeUserType = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("placeUserType"));
    v5->_mode = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mode"));
    v5->_placeDiscovery = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("placeDiscovery"));
    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(RTAddress, v14), CFSTR("address"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    address = v5->_address;
    v5->_address = (RTAddress *)v16;

    v19 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(GEOAddressObject, v18), CFSTR("geoAddressObject"));
    v20 = objc_claimAutoreleasedReturnValue(v19);
    geoAddressObject = v5->_geoAddressObject;
    v5->_geoAddressObject = (GEOAddressObject *)v20;

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("placeNameConfidence"));
    v5->_placeNameConfidence = v22;
    v24 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v23), CFSTR("placeMapItem"));
    v25 = objc_claimAutoreleasedReturnValue(v24);
    placeMapItem = v5->_placeMapItem;
    v5->_placeMapItem = (NSData *)v25;

    v28 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v27), CFSTR("poiCategory"));
    v29 = objc_claimAutoreleasedReturnValue(v28);
    poiCategory = v5->_poiCategory;
    v5->_poiCategory = (NSString *)v29;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("familiarityIndexLOI"));
    v5->_familiarityIndexLOI = v31;
    v5->_placeSource = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("placeSource"));
    v33 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(MOWeather, v32), CFSTR("predominantWeather"));
    v34 = objc_claimAutoreleasedReturnValue(v33);
    predominantWeather = v5->_predominantWeather;
    v5->_predominantWeather = (MOWeather *)v34;

    v37 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(RTLocation, v36), CFSTR("mapItemLocation"));
    v38 = objc_claimAutoreleasedReturnValue(v37);
    mapItemLocation = v5->_mapItemLocation;
    v5->_mapItemLocation = (RTLocation *)v38;

    v5->_mapItemID = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mapItemID"));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOEventRoutine *v4;

  v4 = objc_alloc_init(MOEventRoutine);
  v4->_isInvalid = self->_isInvalid;
  v4->_isHighConfidence = self->_isHighConfidence;
  objc_storeStrong((id *)&v4->_address, self->_address);
  objc_storeStrong((id *)&v4->_geoAddressObject, self->_geoAddressObject);
  v4->_mode = self->_mode;
  objc_storeStrong((id *)&v4->_location, self->_location);
  objc_storeStrong((id *)&v4->_placeName, self->_placeName);
  v4->_placeType = self->_placeType;
  v4->_placeSource = self->_placeSource;
  objc_storeStrong((id *)&v4->_poiCategory, self->_poiCategory);
  v4->_placeDiscovery = self->_placeDiscovery;
  objc_storeStrong((id *)&v4->_placeMapItem, self->_placeMapItem);
  v4->_placeUserType = self->_placeUserType;
  objc_storeStrong((id *)&v4->_predominantWeather, self->_predominantWeather);
  v4->_familiarityIndexLOI = self->_familiarityIndexLOI;
  v4->_placeNameConfidence = self->_placeNameConfidence;
  v4->_isPreOnboardedVisit = self->_isPreOnboardedVisit;
  objc_storeStrong((id *)&v4->_mapItemLocation, self->_mapItemLocation);
  v4->_mapItemID = self->_mapItemID;
  return v4;
}

- (id)description
{
  double placeNameConfidence;
  void *v4;
  unint64_t placeDiscovery;
  _BOOL8 isHighConfidence;
  _BOOL8 isInvalid;
  _BOOL8 isPreOnboardedVisit;
  unint64_t placeSource;
  NSString *poiCategory;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v19;
  id v20;

  v20 = objc_alloc((Class)NSString);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSString mask](self->_placeName, "mask"));
  placeNameConfidence = self->_placeNameConfidence;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventRoutine descriptionOfMode:](MOEventRoutine, "descriptionOfMode:", -[MOEventRoutine mode](self, "mode")));
  placeDiscovery = self->_placeDiscovery;
  isHighConfidence = self->_isHighConfidence;
  isInvalid = self->_isInvalid;
  isPreOnboardedVisit = self->_isPreOnboardedVisit;
  poiCategory = self->_poiCategory;
  placeSource = self->_placeSource;
  v12 = objc_msgSend((id)objc_opt_class(self, v11), "stringOfPlaceInferencePlaceType:", self->_placeType);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v15 = objc_msgSend((id)objc_opt_class(self, v14), "stringOfMapItemPlaceType:", self->_mapItemPlaceType);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = objc_msgSend(v20, "initWithFormat:", CFSTR("placeName, %@, confidence, %f, locationMode, %@, new place, %lu, isHighConfidence, %d, isInvalid, %d, isPreOnboardedVisit, %d, poiCategory, %@, placeSource, %lu, placeType, %@, mapItemPlaceType, %@, userType, %lu, predominantWeather %@,familiarityIndexLOI, %.2f, mapItem, %lu"), v19, *(_QWORD *)&placeNameConfidence, v4, placeDiscovery, isHighConfidence, isInvalid, isPreOnboardedVisit, poiCategory, placeSource, v13, v16, self->_placeUserType, self->_predominantWeather, *(_QWORD *)&self->_familiarityIndexLOI, self->_mapItemID);

  return v17;
}

- (id)formatAddressCurrentFormatWithFallback:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  unsigned int v7;
  void *v8;
  id os_log;
  NSObject *v10;
  NSString *v11;
  void *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  id v17;
  NSString *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  _BOOL4 v27;

  v3 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RTAddress countryCode](self->_address, "countryCode"));
  v7 = objc_msgSend(v6, "containsString:", CFSTR("US"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RTAddress getPreferredName](self->_address, "getPreferredName"));
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventData);
    v10 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RTAddress countryCode](self->_address, "countryCode"));
      v20 = 138412802;
      v21 = v12;
      v22 = 2112;
      v23 = v13;
      v24 = 2112;
      v25 = v8;
      v14 = "%@, country code, %@, using current format output string, %@";
      v15 = v10;
      v16 = 32;
LABEL_7:
      _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, v14, (uint8_t *)&v20, v16);

    }
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventRoutine formatAddressParkingDisplayNameWithFallback:](self, "formatAddressParkingDisplayNameWithFallback:", v3));
    v17 = _mo_log_facility_get_os_log(&MOLogFacilityEventData);
    v10 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v19 = NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RTAddress countryCode](self->_address, "countryCode"));
      v20 = 138413058;
      v21 = v12;
      v22 = 2112;
      v23 = v13;
      v24 = 2112;
      v25 = v8;
      v26 = 1024;
      v27 = v3;
      v14 = "%@, country code, %@, using parking display name output string, %@, fallback, %i";
      v15 = v10;
      v16 = 38;
      goto LABEL_7;
    }
  }

  return v8;
}

- (id)formatAddressParkingDisplayNameWithFallback:(BOOL)a3
{
  _BOOL4 v3;
  void *v6;
  id os_log;
  NSObject *v8;
  BOOL v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v14;
  NSObject *v15;
  NSString *v17;
  void *v18;
  NSString *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  _BOOL4 v26;

  v3 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOAddressObject parkingDisplayName](self->_geoAddressObject, "parkingDisplayName"));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventData);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v17 = NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v21 = 138412802;
    v22 = v18;
    v23 = 2112;
    v24 = v6;
    v25 = 1024;
    v26 = v3;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@, parkingDisplayName output string, %@, fallback, %i", (uint8_t *)&v21, 0x1Cu);

  }
  if (objc_msgSend(v6, "length"))
    v9 = 1;
  else
    v9 = !v3;
  if (v9)
  {
    v10 = v6;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GEOAddressObject shortAddress](self->_geoAddressObject, "shortAddress"));

    v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventData);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[MOEventRoutine formatAddressParkingDisplayNameWithFallback:].cold.1(a2, (uint64_t)v10, v12);

  }
  v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventData);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v19 = NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = 138412802;
    v22 = v20;
    v23 = 2112;
    v24 = v10;
    v25 = 1024;
    v26 = v3;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%@, output string, %@, fallback, %i", (uint8_t *)&v21, 0x1Cu);

  }
  return v10;
}

- (id)formatAddressWithFormatOption:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  unsigned __int8 v11;
  id os_log;
  NSObject *v13;
  NSString *v14;
  void *v15;
  NSString *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;

  v5 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("currentFormat")))
  {
    v6 = objc_claimAutoreleasedReturnValue(-[MOEventRoutine formatAddressCurrentFormatWithFallback:](self, "formatAddressCurrentFormatWithFallback:", 1));
LABEL_7:
    v7 = (void *)v6;
    goto LABEL_8;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("shortAddress")))
  {
    v6 = objc_claimAutoreleasedReturnValue(-[GEOAddressObject shortAddress](self->_geoAddressObject, "shortAddress"));
    goto LABEL_7;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("parkingDisplayName")))
  {
    v6 = objc_claimAutoreleasedReturnValue(-[MOEventRoutine formatAddressParkingDisplayNameWithFallback:](self, "formatAddressParkingDisplayNameWithFallback:", 1));
    goto LABEL_7;
  }
  v11 = objc_msgSend(v5, "isEqualToString:", CFSTR("aboveDoorShortAddress"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOAddressObject aboveDoorShortAddress](self->_geoAddressObject, "aboveDoorShortAddress"));
  if ((v11 & 1) == 0)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventData);
    v13 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v16 = NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = 138412802;
      v19 = v17;
      v20 = 2112;
      v21 = v5;
      v22 = 2112;
      v23 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@, unrecognized format option, %@, will use default, %@", (uint8_t *)&v18, 0x20u);

    }
  }
LABEL_8:
  v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventData);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v14 = NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v18 = 138412802;
    v19 = v15;
    v20 = 2112;
    v21 = v5;
    v22 = 2112;
    v23 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@, format option, %@, output string, %@", (uint8_t *)&v18, 0x20u);

  }
  return v7;
}

- (id)formatLocalityWithFormatOption:(id)a3
{
  id v5;
  void *v6;
  id os_log;
  NSObject *v8;
  id v9;
  id v11;
  NSString *v12;
  void *v13;
  NSString *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;

  v5 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("currentFormat")))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RTAddress locality](self->_address, "locality"));
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventData);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      goto LABEL_11;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("shortAddress")) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", CFSTR("parkingDisplayName")) & 1) != 0
         || objc_msgSend(v5, "isEqualToString:", CFSTR("aboveDoorShortAddress")))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOAddressObject cityDisplayNameWithFallback:](self->_geoAddressObject, "cityDisplayNameWithFallback:", 1));
    v9 = _mo_log_facility_get_os_log(&MOLogFacilityEventData);
    v8 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
LABEL_11:
      v14 = NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v15 = 138412802;
      v16 = v13;
      v17 = 2112;
      v18 = v5;
      v19 = 2112;
      v20 = v6;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@, format option, %@, output string, %@", (uint8_t *)&v15, 0x20u);
      goto LABEL_12;
    }
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOAddressObject cityDisplayNameWithFallback:](self->_geoAddressObject, "cityDisplayNameWithFallback:", 1));
    v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventData);
    v8 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v15 = 138412802;
      v16 = v13;
      v17 = 2112;
      v18 = v5;
      v19 = 2112;
      v20 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@, unrecognized format option, %@, will use default, %@", (uint8_t *)&v15, 0x20u);
LABEL_12:

    }
  }

  return v6;
}

- (id)formatAdministrativeAreaWithFormatOption:(id)a3
{
  id v5;
  void *v6;
  id os_log;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v13;
  NSString *v14;
  void *v15;
  NSString *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;

  v5 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("currentFormat")))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RTAddress administrativeArea](self->_address, "administrativeArea"));
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventData);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
LABEL_13:
      v16 = NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v17 = 138412802;
      v18 = v15;
      v19 = 2112;
      v20 = v5;
      v21 = 2112;
      v22 = v6;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@, format option, %@, output string, %@", (uint8_t *)&v17, 0x20u);
      goto LABEL_14;
    }
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("shortAddress")) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", CFSTR("parkingDisplayName")) & 1) != 0
         || objc_msgSend(v5, "isEqualToString:", CFSTR("aboveDoorShortAddress")))
  {
    v9 = _mo_log_facility_get_os_log(&MOLogFacilityEventData);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MOEventRoutine formatAdministrativeAreaWithFormatOption:].cold.1(a2, (uint64_t)v5, v10);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RTAddress administrativeArea](self->_address, "administrativeArea"));
    v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventData);
    v8 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      goto LABEL_13;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RTAddress administrativeArea](self->_address, "administrativeArea"));
    v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventData);
    v8 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v14 = NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v17 = 138412802;
      v18 = v15;
      v19 = 2112;
      v20 = v5;
      v21 = 2112;
      v22 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@, unrecognized format option, %@, will use default, %@", (uint8_t *)&v17, 0x20u);
LABEL_14:

    }
  }

  return v6;
}

- (id)formatCountryWithFormatOption:(id)a3
{
  id v5;
  void *v6;
  id os_log;
  NSObject *v8;
  id v9;
  id v11;
  NSString *v12;
  void *v13;
  const char *v14;
  NSString *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;

  v5 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("currentFormat")))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RTAddress country](self->_address, "country"));
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventData);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      goto LABEL_11;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("shortAddress")) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", CFSTR("parkingDisplayName")) & 1) != 0
         || objc_msgSend(v5, "isEqualToString:", CFSTR("aboveDoorShortAddress")))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOAddressObject countryName](self->_geoAddressObject, "countryName"));
    v9 = _mo_log_facility_get_os_log(&MOLogFacilityEventData);
    v8 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
LABEL_11:
      v15 = NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v16 = 138412802;
      v17 = v13;
      v18 = 2112;
      v19 = v5;
      v20 = 2112;
      v21 = v6;
      v14 = "%@, format option, %@, output string, %@";
      goto LABEL_12;
    }
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOAddressObject countryName](self->_geoAddressObject, "countryName"));
    v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventData);
    v8 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v12 = NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v16 = 138412802;
      v17 = v13;
      v18 = 2112;
      v19 = v5;
      v20 = 2112;
      v21 = v6;
      v14 = "%@, unrecognized format option, %@, will use default, %@";
LABEL_12:
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, v14, (uint8_t *)&v16, 0x20u);

    }
  }

  return v6;
}

- (BOOL)isInvalid
{
  return self->_isInvalid;
}

- (void)setIsInvalid:(BOOL)a3
{
  self->_isInvalid = a3;
}

- (BOOL)isPreOnboardedVisit
{
  return self->_isPreOnboardedVisit;
}

- (void)setIsPreOnboardedVisit:(BOOL)a3
{
  self->_isPreOnboardedVisit = a3;
}

- (BOOL)isHighConfidence
{
  return self->_isHighConfidence;
}

- (void)setIsHighConfidence:(BOOL)a3
{
  self->_isHighConfidence = a3;
}

- (unint64_t)placeType
{
  return self->_placeType;
}

- (void)setPlaceType:(unint64_t)a3
{
  self->_placeType = a3;
}

- (unint64_t)placeUserType
{
  return self->_placeUserType;
}

- (void)setPlaceUserType:(unint64_t)a3
{
  self->_placeUserType = a3;
}

- (NSString)placeName
{
  return self->_placeName;
}

- (void)setPlaceName:(id)a3
{
  objc_storeStrong((id *)&self->_placeName, a3);
}

- (double)placeNameConfidence
{
  return self->_placeNameConfidence;
}

- (void)setPlaceNameConfidence:(double)a3
{
  self->_placeNameConfidence = a3;
}

- (unint64_t)placeDiscovery
{
  return self->_placeDiscovery;
}

- (void)setPlaceDiscovery:(unint64_t)a3
{
  self->_placeDiscovery = a3;
}

- (RTLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (RTAddress)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_storeStrong((id *)&self->_address, a3);
}

- (GEOAddressObject)geoAddressObject
{
  return self->_geoAddressObject;
}

- (void)setGeoAddressObject:(id)a3
{
  objc_storeStrong((id *)&self->_geoAddressObject, a3);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (NSData)placeMapItem
{
  return self->_placeMapItem;
}

- (void)setPlaceMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_placeMapItem, a3);
}

- (NSString)poiCategory
{
  return self->_poiCategory;
}

- (void)setPoiCategory:(id)a3
{
  objc_storeStrong((id *)&self->_poiCategory, a3);
}

- (unint64_t)placeSource
{
  return self->_placeSource;
}

- (void)setPlaceSource:(unint64_t)a3
{
  self->_placeSource = a3;
}

- (unint64_t)mapItemPlaceType
{
  return self->_mapItemPlaceType;
}

- (void)setMapItemPlaceType:(unint64_t)a3
{
  self->_mapItemPlaceType = a3;
}

- (RTLocation)mapItemLocation
{
  return self->_mapItemLocation;
}

- (void)setMapItemLocation:(id)a3
{
  objc_storeStrong((id *)&self->_mapItemLocation, a3);
}

- (unint64_t)mapItemID
{
  return self->_mapItemID;
}

- (void)setMapItemID:(unint64_t)a3
{
  self->_mapItemID = a3;
}

- (double)distanceFromVisitToPlace
{
  return self->_distanceFromVisitToPlace;
}

- (void)setDistanceFromVisitToPlace:(double)a3
{
  self->_distanceFromVisitToPlace = a3;
}

- (double)familiarityIndexLOI
{
  return self->_familiarityIndexLOI;
}

- (void)setFamiliarityIndexLOI:(double)a3
{
  self->_familiarityIndexLOI = a3;
}

- (MOWeather)predominantWeather
{
  return self->_predominantWeather;
}

- (void)setPredominantWeather:(id)a3
{
  objc_storeStrong((id *)&self->_predominantWeather, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predominantWeather, 0);
  objc_storeStrong((id *)&self->_mapItemLocation, 0);
  objc_storeStrong((id *)&self->_poiCategory, 0);
  objc_storeStrong((id *)&self->_placeMapItem, 0);
  objc_storeStrong((id *)&self->_geoAddressObject, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_placeName, 0);
}

- (void)formatAddressParkingDisplayNameWithFallback:(NSObject *)a3 .cold.1(const char *a1, uint64_t a2, NSObject *a3)
{
  NSString *v4;
  void *v5;
  uint8_t v6[22];
  __int16 v7;
  int v8;

  v4 = NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  OUTLINED_FUNCTION_2_1();
  v7 = 1024;
  v8 = 1;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%@, shortAddress output string, %@, fallback, %i", v6, 0x1Cu);

}

- (void)formatAdministrativeAreaWithFormatOption:(NSObject *)a3 .cold.1(const char *a1, uint64_t a2, NSObject *a3)
{
  NSString *v4;
  void *v5;
  uint8_t v6[24];

  v4 = NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  OUTLINED_FUNCTION_2_1();
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%@, short address format doesn't support the administrative area (state), option, %@, will use default", v6, 0x16u);

}

@end
