@implementation PCMapLocation

- (PCMapLocation)init
{
  PCMapLocation *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PCMapLocation;
  result = -[PCMapLocation init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_airportCode = 0u;
    *(_OWORD *)&result->_countryName = 0u;
    *(_OWORD *)&result->_latitude = 0u;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PCMapLocation;
  -[PCMapLocation dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  float v4;
  void *v5;
  float v6;

  v3 = (void *)objc_msgSend((id)objc_msgSend(CFSTR("MapLocation:\n"), "stringByAppendingFormat:", CFSTR("     name = %@\n"), -[PCMapLocation name](self, "name")), "stringByAppendingFormat:", CFSTR("     countryName = %@\n"), -[PCMapLocation countryName](self, "countryName"));
  -[PCMapLocation latitude](self, "latitude");
  v5 = (void *)objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("     latitude = %f\n"), v4);
  -[PCMapLocation longitude](self, "longitude");
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("     longitude = %f\n"), v6), "stringByAppendingFormat:", CFSTR("     airportCode = %@\n"), -[PCMapLocation airportCode](self, "airportCode")), "stringByAppendingFormat:", CFSTR("     airportName = %@\n"), -[PCMapLocation airportName](self, "airportName"));
}

- (id)stringRepresentation
{
  void *v3;
  NSString *v4;
  NSString *v5;
  float v6;
  double v7;
  float v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[PCMapLocation name](self, "name");
  v5 = -[PCMapLocation countryName](self, "countryName");
  -[PCMapLocation latitude](self, "latitude");
  v7 = v6;
  -[PCMapLocation longitude](self, "longitude");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("[name = %@, countryName = %@, latitude = %f, longitude = %f, airportCode = %@, airportName = %@]"), v4, v5, *(_QWORD *)&v7, v8, -[PCMapLocation airportCode](self, "airportCode"), -[PCMapLocation airportName](self, "airportName"));
}

- (NSString)locationName
{
  if (self->_locationName)
    return self->_locationName;
  else
    return -[PCMapLocation countryName](self, "countryName");
}

- (BOOL)isEqualToLocation:(id)a3
{
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;

  -[PCMapLocation latitude](self, "latitude");
  v6 = v5;
  objc_msgSend(a3, "latitude");
  if (v6 == v7 && (-[PCMapLocation longitude](self, "longitude"), v9 = v8, objc_msgSend(a3, "longitude"), v9 == v10))
    return -[NSString isEqualToString:](-[PCMapLocation name](self, "name"), "isEqualToString:", objc_msgSend(a3, "name"));
  else
    return 0;
}

- (BOOL)hasSamePositionAsLocation:(id)a3 tolerance:(float)a4
{
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;

  -[PCMapLocation latitude](self, "latitude");
  v8 = v7;
  objc_msgSend(a3, "latitude");
  v10 = v8 - v9;
  -[PCMapLocation longitude](self, "longitude");
  v12 = v11;
  objc_msgSend(a3, "longitude");
  return sqrtf((float)(v10 * v10) + (float)((float)(v12 - v13) * (float)(v12 - v13))) <= a4;
}

+ (id)dictionaryFromArrayOfLocations:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v10 = (void *)objc_msgSend(v4, "objectForKey:", objc_msgSend(v9, "name"));
        if (v10)
        {
          objc_msgSend(v10, "addObject:", v9);
        }
        else
        {
          v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          objc_msgSend(v11, "addObject:", v9);
          objc_msgSend(v4, "setObject:forKey:", v11, objc_msgSend(v9, "name"));
        }
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  return v4;
}

+ (void)removeLocationsFromArray:(id)a3 withinDistance:(float)a4 ofSameLocationsInDictionary:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v26 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(a3);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v12 = (void *)objc_msgSend(a5, "objectForKey:", objc_msgSend(v11, "name"));
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v28;
          while (2)
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v28 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
              if (!objc_msgSend(v17, "airportCode"))
              {
                objc_msgSend(v17, "latitude");
                v19 = v18;
                objc_msgSend(v11, "latitude");
                v21 = v19 - v20;
                objc_msgSend(v17, "longitude");
                v23 = v22;
                objc_msgSend(v11, "longitude");
                if (sqrtf((float)(v21 * v21) + (float)((float)(v23 - v24) * (float)(v23 - v24))) < a4)
                {
                  objc_msgSend(v26, "addObject:", v11);
                  goto LABEL_17;
                }
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            if (v14)
              continue;
            break;
          }
        }
LABEL_17:
        ;
      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v8);
  }
  objc_msgSend(a3, "removeObjectsInArray:", v26);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    objc_msgSend(v4, "setName:", -[PCMapLocation name](self, "name"));
    objc_msgSend(v4, "setCountryName:", -[PCMapLocation countryName](self, "countryName"));
    if (-[PCMapLocation locationName](self, "locationName"))
      objc_msgSend(v4, "setLocationName:", -[PCMapLocation locationName](self, "locationName"));
    -[PCMapLocation latitude](self, "latitude");
    objc_msgSend(v4, "setLatitude:");
    -[PCMapLocation longitude](self, "longitude");
    objc_msgSend(v4, "setLongitude:");
    objc_msgSend(v4, "setAirportCode:", -[PCMapLocation airportCode](self, "airportCode"));
    objc_msgSend(v4, "setAirportName:", -[PCMapLocation airportName](self, "airportName"));
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double v5;
  NSString *locationName;
  double v7;

  objc_msgSend(a3, "encodeObject:forKey:", self->_name, CFSTR("Name"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_countryName, CFSTR("CountryName"));
  locationName = self->_locationName;
  if (locationName)
    objc_msgSend(a3, "encodeObject:forKey:", locationName, CFSTR("LocationName"));
  *(float *)&v5 = self->_latitude;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("Latitude"), v5);
  *(float *)&v7 = self->_longitude;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("Longitude"), v7);
  objc_msgSend(a3, "encodeObject:forKey:", self->_airportCode, CFSTR("AirportCode"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_airportName, CFSTR("AirportNameKey"));
}

- (PCMapLocation)initWithCoder:(id)a3
{
  PCMapLocation *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PCMapLocation;
  v4 = -[PCMapLocation init](&v6, sel_init);
  if (v4)
  {
    -[PCMapLocation setName:](v4, "setName:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Name")));
    -[PCMapLocation setCountryName:](v4, "setCountryName:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CountryName")));
    -[PCMapLocation setLocationName:](v4, "setLocationName:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LocationName")));
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("Latitude"));
    -[PCMapLocation setLatitude:](v4, "setLatitude:");
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("Longitude"));
    -[PCMapLocation setLongitude:](v4, "setLongitude:");
    -[PCMapLocation setAirportCode:](v4, "setAirportCode:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AirportCode")));
    -[PCMapLocation setAirportName:](v4, "setAirportName:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AirportNameKey")));
  }
  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)countryName
{
  return self->_countryName;
}

- (void)setCountryName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (void)setLocationName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (float)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(float)a3
{
  self->_latitude = a3;
}

- (float)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(float)a3
{
  self->_longitude = a3;
}

- (NSString)airportCode
{
  return self->_airportCode;
}

- (void)setAirportCode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSString)airportName
{
  return self->_airportName;
}

- (void)setAirportName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

@end
