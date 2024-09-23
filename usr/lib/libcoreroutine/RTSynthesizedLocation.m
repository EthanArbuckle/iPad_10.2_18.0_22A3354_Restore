@implementation RTSynthesizedLocation

- (int64_t)convertGeoRoadClass:(int)a3
{
  if (a3 > 9)
    return 0;
  else
    return qword_1D1EECDF8[a3];
}

- (int64_t)convertFormOfWay:(int)a3
{
  if ((a3 - 1) > 0x15)
    return 0;
  else
    return qword_1D1EECE48[a3 - 1];
}

- (int64_t)convertCLLocationType:(int)a3
{
  if ((a3 - 1) > 0xC)
    return 0;
  else
    return qword_1D1EECEF8[a3 - 1];
}

- (int64_t)convertReconstructedLocationType:(id)a3
{
  id v4;
  unsigned int v5;
  int v6;
  int v7;
  int v8;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  int64_t v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "isOriginalLocationType");
  v6 = objc_msgSend(v4, "isInertialIntegrated");
  v7 = objc_msgSend(v4, "isLinearInterpolated");
  v8 = objc_msgSend(v4, "isMapMatched");
  if (objc_msgSend(v4, "isOriginalLocationType"))
  {
    v9 = -[RTSynthesizedLocation convertCLLocationType:](self, "convertCLLocationType:", objc_msgSend(v4, "locType"));
  }
  else
  {
    v10 = -[RTSynthesizedLocation convertCLLocationType:](self, "convertCLLocationType:", objc_msgSend(v4, "locTypeStart"));
    v9 = -[RTSynthesizedLocation convertCLLocationType:](self, "convertCLLocationType:", objc_msgSend(v4, "locTypeStop")) | v10;
  }
  v11 = v5;
  if (v6)
    v11 = v5 | 2;
  if (v7)
    v11 |= 4uLL;
  if (v8)
    v11 |= 8uLL;
  v12 = v9 | v11;

  return v12;
}

- (RTSynthesizedLocation)initWithCLTripSegmentLocation:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  RTSynthesizedLocation *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  RTSynthesizedLocation *v27;
  double v29;

  v4 = a3;
  objc_msgSend(v4, "latitude");
  v29 = v5;
  objc_msgSend(v4, "longitude");
  v7 = v6;
  v8 = -[RTSynthesizedLocation convertGeoRoadClass:](self, "convertGeoRoadClass:", objc_msgSend(v4, "mapsRoadClass"));
  v9 = -[RTSynthesizedLocation convertFormOfWay:](self, "convertFormOfWay:", objc_msgSend(v4, "mapsFormOfWay"));
  v10 = -[RTSynthesizedLocation convertReconstructedLocationType:](self, "convertReconstructedLocationType:", v4);
  v11 = [RTSynthesizedLocation alloc];
  objc_msgSend(v4, "altitude");
  v13 = v12;
  objc_msgSend(v4, "horizontalAccuracy");
  v15 = v14;
  objc_msgSend(v4, "altitudeAccuracy");
  v17 = v16;
  objc_msgSend(v4, "course");
  v19 = v18;
  objc_msgSend(v4, "courseAccuracy");
  v21 = v20;
  objc_msgSend(v4, "speed");
  v23 = v22;
  objc_msgSend(v4, "speedAccuracy");
  v25 = v24;
  objc_msgSend(v4, "timestamp");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = -[RTSynthesizedLocation initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:geoRoadClass:geoFormOfWay:locationType:timestamp:downsamplingLevel:](v11, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:geoRoadClass:geoFormOfWay:locationType:timestamp:downsamplingLevel:", v8, v9, v10, v26, 0, v29, v7, v13, v15, v17, v19, v21, v23, v25);
  return v27;
}

- (RTSynthesizedLocation)initWithCLLocation:(id)a3
{
  id v4;
  RTSynthesizedLocation *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  RTSynthesizedLocation *v24;
  double v26;

  v4 = a3;
  v5 = [RTSynthesizedLocation alloc];
  objc_msgSend(v4, "coordinate");
  v26 = v6;
  v8 = v7;
  objc_msgSend(v4, "altitude");
  v10 = v9;
  objc_msgSend(v4, "horizontalAccuracy");
  v12 = v11;
  objc_msgSend(v4, "verticalAccuracy");
  v14 = v13;
  objc_msgSend(v4, "course");
  v16 = v15;
  objc_msgSend(v4, "courseAccuracy");
  v18 = v17;
  objc_msgSend(v4, "speed");
  v20 = v19;
  objc_msgSend(v4, "speedAccuracy");
  v22 = v21;
  objc_msgSend(v4, "timestamp");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = -[RTSynthesizedLocation initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:geoRoadClass:geoFormOfWay:locationType:timestamp:downsamplingLevel:](v5, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:geoRoadClass:geoFormOfWay:locationType:timestamp:downsamplingLevel:", 0, 0, 1, v23, 0, v26, v8, v10, v12, v14, v16, v18, v20, v22);
  return v24;
}

- (RTSynthesizedLocation)initWithCoordinate:(CLLocationCoordinate2D)a3 altitude:(double)a4 horizontalAccuracy:(double)a5 verticalAccuracy:(double)a6 course:(double)a7 courseAccuracy:(double)a8 speed:(double)a9 speedAccuracy:(double)a10 geoRoadClass:(int64_t)a11 geoFormOfWay:(int64_t)a12 locationType:(int64_t)a13 timestamp:(id)a14 downsamplingLevel:(int64_t)a15
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  id v29;
  RTSynthesizedLocation *v30;
  RTSynthesizedLocation *v31;
  objc_super v33;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v29 = a14;
  v33.receiver = self;
  v33.super_class = (Class)RTSynthesizedLocation;
  v30 = -[RTSynthesizedLocation init](&v33, sel_init);
  v31 = v30;
  if (v30)
  {
    v30->_coordinate.latitude = latitude;
    v30->_coordinate.longitude = longitude;
    v30->_altitude = a4;
    v30->_horizontalAccuracy = a5;
    v30->_verticalAccuracy = a6;
    v30->_course = a7;
    v30->_courseAccuracy = a8;
    v30->_speed = a9;
    v30->_speedAccuracy = a10;
    v30->_geoRoadClass = a11;
    v30->_geoFormOfWay = a12;
    v30->_locationType = a13;
    objc_storeStrong((id *)&v30->_timestamp, a14);
    v31->_downsamplingLevel = a15;
  }

  return v31;
}

- (RTSynthesizedLocation)initWithCoordinate:(CLLocationCoordinate2D)a3 altitude:(double)a4 horizontalAccuracy:(double)a5 verticalAccuracy:(double)a6 course:(double)a7 courseAccuracy:(double)a8 speed:(double)a9 speedAccuracy:(double)a10 geoRoadClass:(int64_t)a11 geoFormOfWay:(int64_t)a12 locationType:(int64_t)a13 timestamp:(id)a14
{
  double longitude;
  double latitude;
  id v25;
  RTSynthesizedLocation *v26;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v25 = a14;
  v26 = -[RTSynthesizedLocation initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:geoRoadClass:geoFormOfWay:locationType:timestamp:downsamplingLevel:]([RTSynthesizedLocation alloc], "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:geoRoadClass:geoFormOfWay:locationType:timestamp:downsamplingLevel:", a11, a12, a13, v25, 0, latitude, longitude, a4, a5, a6, a7, a8, a9, *(_QWORD *)&a10);

  return v26;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTSynthesizedLocation)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  int v26;
  RTSynthesizedLocation *v27;
  double v29;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("latitude"));
  v29 = v5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("longitude"));
  v7 = v6;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("altitude"));
  v9 = v8;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("horizontalUncertainty"));
  v11 = v10;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("verticalUncertainty"));
  v13 = v12;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("speed"));
  v15 = v14;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("speedAccuracy"));
  v17 = v16;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("course"));
  v19 = v18;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("courseAccuracy"));
  v21 = v20;
  v22 = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("geoRoadClass"));
  v23 = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("geoFormOfWay"));
  v24 = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("locationType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("downsamplingLevel"));

  v27 = -[RTSynthesizedLocation initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:geoRoadClass:geoFormOfWay:locationType:timestamp:downsamplingLevel:](self, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:geoRoadClass:geoFormOfWay:locationType:timestamp:downsamplingLevel:", v22, v23, v24, v25, v26, v29, v7, v9, v11, v13, v19, v21, v15, v17);
  return v27;
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  void *v5;
  id v6;

  v6 = a3;
  -[RTSynthesizedLocation coordinate](self, "coordinate");
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("latitude"));
  -[RTSynthesizedLocation coordinate](self, "coordinate");
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("longitude"), v4);
  -[RTSynthesizedLocation altitude](self, "altitude");
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("altitude"));
  -[RTSynthesizedLocation horizontalAccuracy](self, "horizontalAccuracy");
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("horizontalUncertainty"));
  -[RTSynthesizedLocation verticalAccuracy](self, "verticalAccuracy");
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("verticalUncertainty"));
  -[RTSynthesizedLocation speed](self, "speed");
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("speed"));
  -[RTSynthesizedLocation speedAccuracy](self, "speedAccuracy");
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("speedAccuracy"));
  -[RTSynthesizedLocation course](self, "course");
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("course"));
  -[RTSynthesizedLocation courseAccuracy](self, "courseAccuracy");
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("courseAccuracy"));
  objc_msgSend(v6, "encodeInt64:forKey:", -[RTSynthesizedLocation geoRoadClass](self, "geoRoadClass"), CFSTR("geoRoadClass"));
  objc_msgSend(v6, "encodeInt64:forKey:", -[RTSynthesizedLocation geoFormOfWay](self, "geoFormOfWay"), CFSTR("geoFormOfWay"));
  objc_msgSend(v6, "encodeInt64:forKey:", -[RTSynthesizedLocation locationType](self, "locationType"), CFSTR("locationType"));
  -[RTSynthesizedLocation timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("timestamp"));

  objc_msgSend(v6, "encodeInt64:forKey:", -[RTSynthesizedLocation downsamplingLevel](self, "downsamplingLevel"), CFSTR("downsamplingLevel"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:geoRoadClass:geoFormOfWay:locationType:timestamp:downsamplingLevel:", self->_geoRoadClass, self->_geoFormOfWay, self->_locationType, self->_timestamp, self->_downsamplingLevel, self->_coordinate.latitude, self->_coordinate.longitude, self->_altitude, self->_horizontalAccuracy, self->_verticalAccuracy, self->_course, self->_courseAccuracy, self->_speed, *(_QWORD *)&self->_speedAccuracy);
}

- (BOOL)isEqualToLocation:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  int64_t v32;
  int64_t v33;
  int64_t v34;
  void *v35;
  void *v36;
  char v37;

  v4 = a3;
  -[RTSynthesizedLocation coordinate](self, "coordinate");
  v6 = v5;
  objc_msgSend(v4, "coordinate");
  if (v6 != v7)
    goto LABEL_14;
  -[RTSynthesizedLocation coordinate](self, "coordinate");
  v9 = v8;
  objc_msgSend(v4, "coordinate");
  if (v9 != v10)
    goto LABEL_14;
  -[RTSynthesizedLocation altitude](self, "altitude");
  v12 = v11;
  objc_msgSend(v4, "altitude");
  if (v12 != v13)
    goto LABEL_14;
  -[RTSynthesizedLocation horizontalAccuracy](self, "horizontalAccuracy");
  v15 = v14;
  objc_msgSend(v4, "horizontalAccuracy");
  if (v15 != v16)
    goto LABEL_14;
  -[RTSynthesizedLocation verticalAccuracy](self, "verticalAccuracy");
  v18 = v17;
  objc_msgSend(v4, "verticalAccuracy");
  if (v18 != v19)
    goto LABEL_14;
  -[RTSynthesizedLocation course](self, "course");
  v21 = v20;
  objc_msgSend(v4, "course");
  if (v21 != v22)
    goto LABEL_14;
  -[RTSynthesizedLocation courseAccuracy](self, "courseAccuracy");
  v24 = v23;
  objc_msgSend(v4, "courseAccuracy");
  if (v24 != v25)
    goto LABEL_14;
  -[RTSynthesizedLocation speed](self, "speed");
  v27 = v26;
  objc_msgSend(v4, "speed");
  if (v27 != v28)
    goto LABEL_14;
  -[RTSynthesizedLocation speedAccuracy](self, "speedAccuracy");
  v30 = v29;
  objc_msgSend(v4, "speedAccuracy");
  if (v30 == v31
    && (v32 = -[RTSynthesizedLocation geoRoadClass](self, "geoRoadClass"), v32 == objc_msgSend(v4, "geoRoadClass"))
    && (v33 = -[RTSynthesizedLocation geoFormOfWay](self, "geoFormOfWay"), v33 == objc_msgSend(v4, "geoFormOfWay"))
    && (v34 = -[RTSynthesizedLocation locationType](self, "locationType"), v34 == objc_msgSend(v4, "locationType")))
  {
    -[RTSynthesizedLocation timestamp](self, "timestamp");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timestamp");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqualToDate:", v36);

  }
  else
  {
LABEL_14:
    v37 = 0;
  }

  return v37;
}

- (BOOL)isEqual:(id)a3
{
  RTSynthesizedLocation *v4;
  RTSynthesizedLocation *v5;
  BOOL v6;

  v4 = (RTSynthesizedLocation *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[RTSynthesizedLocation isEqualToLocation:](self, "isEqualToLocation:", v5);

  return v6;
}

- (NSString)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  void *v25;

  v25 = (void *)MEMORY[0x1E0CB3940];
  -[RTSynthesizedLocation coordinate](self, "coordinate");
  v24 = v3;
  -[RTSynthesizedLocation coordinate](self, "coordinate");
  v23 = v4;
  -[RTSynthesizedLocation altitude](self, "altitude");
  v6 = v5;
  -[RTSynthesizedLocation horizontalAccuracy](self, "horizontalAccuracy");
  v8 = v7;
  -[RTSynthesizedLocation verticalAccuracy](self, "verticalAccuracy");
  v10 = v9;
  -[RTSynthesizedLocation course](self, "course");
  v12 = v11;
  -[RTSynthesizedLocation courseAccuracy](self, "courseAccuracy");
  v14 = v13;
  -[RTSynthesizedLocation speed](self, "speed");
  v16 = v15;
  -[RTSynthesizedLocation speedAccuracy](self, "speedAccuracy");
  v18 = v17;
  -[RTSynthesizedLocation timestamp](self, "timestamp");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timeIntervalSinceReferenceDate");
  objc_msgSend(v25, "stringWithFormat:", CFSTR("lat,%.6f,lon,%.6f,alt,%.2f,hunc,%.2f,vunc,%.2f,course,%.2f,cunc,%.2f,speed,%.2f,sunc,%.1f,timestamp,%.3f,downsamplingLevel,%lu,geoRoadClass,%ld,formOfWay,%ld,locationType,%ld,BC,%ld,II,%ld,LI,%ld,MM,%ld,EA,%ld,WiFi,%ld,GPS,%ld,LOI,%ld"), v24, v23, v6, v8, v10, v12, v14, v16, v18, v20, -[RTSynthesizedLocation downsamplingLevel](self, "downsamplingLevel"), -[RTSynthesizedLocation geoRoadClass](self, "geoRoadClass"), -[RTSynthesizedLocation geoFormOfWay](self, "geoFormOfWay"), -[RTSynthesizedLocation locationType](self, "locationType"), -[RTSynthesizedLocation locationType](self, "locationType") & 1, ((unint64_t)-[RTSynthesizedLocation locationType](self, "locationType") >> 1) & 1,
    ((unint64_t)-[RTSynthesizedLocation locationType](self, "locationType") >> 2) & 1,
    ((unint64_t)-[RTSynthesizedLocation locationType](self, "locationType") >> 3) & 1,
    ((unint64_t)-[RTSynthesizedLocation locationType](self, "locationType") >> 4) & 1,
    ((unint64_t)-[RTSynthesizedLocation locationType](self, "locationType") >> 6) & 1,
    ((unint64_t)-[RTSynthesizedLocation locationType](self, "locationType") >> 5) & 1,
    ((unint64_t)-[RTSynthesizedLocation locationType](self, "locationType") >> 7) & 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v21;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (double)altitude
{
  return self->_altitude;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (double)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (double)course
{
  return self->_course;
}

- (double)courseAccuracy
{
  return self->_courseAccuracy;
}

- (double)speed
{
  return self->_speed;
}

- (double)speedAccuracy
{
  return self->_speedAccuracy;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (int64_t)downsamplingLevel
{
  return self->_downsamplingLevel;
}

- (void)setDownsamplingLevel:(int64_t)a3
{
  self->_downsamplingLevel = a3;
}

- (int64_t)geoRoadClass
{
  return self->_geoRoadClass;
}

- (void)setGeoRoadClass:(int64_t)a3
{
  self->_geoRoadClass = a3;
}

- (int64_t)geoFormOfWay
{
  return self->_geoFormOfWay;
}

- (void)setGeoFormOfWay:(int64_t)a3
{
  self->_geoFormOfWay = a3;
}

- (int64_t)locationType
{
  return self->_locationType;
}

- (void)setLocationType:(int64_t)a3
{
  self->_locationType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
}

+ (id)createWithManagedObject:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138413058;
      v11 = v9;
      v12 = 2112;
      v14 = 2080;
      v13 = v4;
      v15 = "+[RTSynthesizedLocation(RTCoreDataTransformable) createWithManagedObject:]";
      v16 = 1024;
      v17 = 34;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "%@, managedObject, %@, is not supported by RTTripSegment+CoreDataReadable (in %s:%d)", (uint8_t *)&v10, 0x26u);

    }
    goto LABEL_7;
  }
  v5 = v4;
  objc_msgSend((id)objc_opt_class(), "createWithSynhtesizedLocationMO:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v6;
}

+ (id)createWithSynhtesizedLocationMO:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  RTSynthesizedLocation *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  RTSynthesizedLocation *v27;
  double v29;

  v3 = a3;
  objc_msgSend(v3, "latitude");
  v29 = v4;
  objc_msgSend(v3, "longitude");
  v6 = v5;
  if (objc_msgSend(v3, "downsamplingLevel"))
    v7 = (int)objc_msgSend(v3, "downsamplingLevel");
  else
    v7 = 0;
  if (objc_msgSend(v3, "geoRoadClass"))
    v8 = (int)objc_msgSend(v3, "geoRoadClass");
  else
    v8 = 0;
  if (objc_msgSend(v3, "geoFormOfWay"))
    v9 = (int)objc_msgSend(v3, "geoFormOfWay");
  else
    v9 = 0;
  if (objc_msgSend(v3, "locationType"))
    v10 = (int)objc_msgSend(v3, "locationType");
  else
    v10 = 0;
  v11 = [RTSynthesizedLocation alloc];
  objc_msgSend(v3, "altitude");
  v13 = v12;
  objc_msgSend(v3, "horizontalAccuracy");
  v15 = v14;
  objc_msgSend(v3, "verticalAccuracy");
  v17 = v16;
  objc_msgSend(v3, "course");
  v19 = v18;
  objc_msgSend(v3, "courseAccuracy");
  v21 = v20;
  objc_msgSend(v3, "speed");
  v23 = v22;
  objc_msgSend(v3, "speedAccuracy");
  v25 = v24;
  objc_msgSend(v3, "timestamp");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[RTSynthesizedLocation initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:geoRoadClass:geoFormOfWay:locationType:timestamp:downsamplingLevel:](v11, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:geoRoadClass:geoFormOfWay:locationType:timestamp:downsamplingLevel:", v8, v9, v10, v26, v7, v29, v6, v13, v15, v17, v19, v21, v23, v25);

  return v27;
}

- (id)managedObjectWithContext:(id)a3
{
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  if (a3)
  {
    +[RTSynthesizedLocationMO managedObjectWithSynthesizedLocation:inManagedObjectContext:](RTSynthesizedLocationMO, "managedObjectWithSynthesizedLocation:inManagedObjectContext:", self, a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", v6, 2u);
    }

    v3 = 0;
  }
  return v3;
}

@end
