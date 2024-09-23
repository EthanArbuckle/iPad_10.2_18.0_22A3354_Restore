@implementation NILocation

- (NILocation)initWithTimestamp:(id)a3 latitude:(double)a4 longitude:(double)a5 altitude:(double)a6 ellipsoidalAltitude:(double)a7 horizontalAccuracy:(double)a8 verticalAccuracy:(double)a9 speed:(double)a10 speedAccuracy:(double)a11 course:(double)a12 courseAccuracy:(double)a13 floor:(int64_t)a14 locationType:(int64_t)a15 signalEnvironment:(int64_t)a16
{
  id v28;
  NILocation *v29;
  NSDate *v30;
  NSDate *timestamp;
  objc_super v33;

  v28 = a3;
  if (!v28)
    __assert_rtn("-[NILocation initWithTimestamp:latitude:longitude:altitude:ellipsoidalAltitude:horizontalAccuracy:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:floor:locationType:signalEnvironment:]", "NILocation.mm", 37, "timestamp");
  v33.receiver = self;
  v33.super_class = (Class)NILocation;
  v29 = -[NILocation init](&v33, "init");
  if (v29)
  {
    v30 = (NSDate *)objc_msgSend(v28, "copy");
    timestamp = v29->_timestamp;
    v29->_timestamp = v30;

    v29->_latitude = a4;
    v29->_longitude = a5;
    v29->_altitude = a6;
    v29->_ellipsoidalAltitude = a7;
    v29->_horizontalAccuracy = a8;
    v29->_verticalAccuracy = a9;
    v29->_speed = a10;
    v29->_speedAccuracy = a11;
    v29->_course = a12;
    v29->_courseAccuracy = a13;
    v29->_floor = a14;
    v29->_locationType = a15;
    v29->_signalEnvironment = a16;
  }

  return v29;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NILocation initWithTimestamp:latitude:longitude:altitude:ellipsoidalAltitude:horizontalAccuracy:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:floor:locationType:signalEnvironment:](+[NILocation allocWithZone:](NILocation, "allocWithZone:", a3), "initWithTimestamp:latitude:longitude:altitude:ellipsoidalAltitude:horizontalAccuracy:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:floor:locationType:signalEnvironment:", self->_timestamp, self->_floor, self->_locationType, self->_signalEnvironment, self->_latitude, self->_longitude, self->_altitude, self->_ellipsoidalAltitude, self->_horizontalAccuracy, self->_verticalAccuracy, self->_speed, self->_speedAccuracy, *(_QWORD *)&self->_course, *(_QWORD *)&self->_courseAccuracy);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_timestamp, CFSTR("timestamp"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("latitude"), self->_latitude);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("longitude"), self->_longitude);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("altitude"), self->_altitude);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("ellipsoidalAltitude"), self->_ellipsoidalAltitude);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("horizontalAccuracy"), self->_horizontalAccuracy);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("verticalAccuracy"), self->_verticalAccuracy);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("speed"), self->_speed);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("speedAccuracy"), self->_speedAccuracy);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("course"), self->_course);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("courseAccuracy"), self->_courseAccuracy);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_floor, CFSTR("floor"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_locationType, CFSTR("locationType"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_signalEnvironment, CFSTR("signalEnvironment"));

}

- (NILocation)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NILocation *v27;
  double v29;
  double v30;

  v4 = a3;
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v5), CFSTR("timestamp"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v8 && (v9 = objc_opt_class(NSDate, v7), (objc_opt_isKindOfClass(v8, v9) & 1) != 0))
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("latitude"));
    v30 = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("longitude"));
    v29 = v11;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("altitude"));
    v13 = v12;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("ellipsoidalAltitude"));
    v15 = v14;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("horizontalAccuracy"));
    v17 = v16;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("verticalAccuracy"));
    v19 = v18;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("speed"));
    v21 = v20;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("speedAccuracy"));
    v23 = v22;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("course"));
    v25 = v24;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("courseAccuracy"));
    v27 = -[NILocation initWithTimestamp:latitude:longitude:altitude:ellipsoidalAltitude:horizontalAccuracy:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:floor:locationType:signalEnvironment:]([NILocation alloc], "initWithTimestamp:latitude:longitude:altitude:ellipsoidalAltitude:horizontalAccuracy:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:floor:locationType:signalEnvironment:", v8, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("floor")), objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("locationType")), objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("signalEnvironment")), v30, v29, v13, v15, v17, v19, v21, v23, v25, v26);
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NILocation *v7;
  NILocation *v8;
  NSDate *timestamp;
  void *v10;
  void *v11;
  unsigned int v12;
  double latitude;
  double v14;
  double v15;
  double longitude;
  double v17;
  double v18;
  double altitude;
  double v20;
  double v21;
  double ellipsoidalAltitude;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  int64_t floor;
  id v32;
  int64_t locationType;
  id v34;
  int64_t signalEnvironment;
  int64_t v36;
  BOOL v37;
  double v40;
  double courseAccuracy;
  double v42;
  double course;
  double v44;
  double speedAccuracy;
  double v46;
  double speed;
  double v48;
  double verticalAccuracy;
  double v50;
  double horizontalAccuracy;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (NILocation *)v4;
    v8 = v7;
    if (v7 == self)
    {
      v37 = 1;
LABEL_27:

      goto LABEL_28;
    }
    timestamp = self->_timestamp;
    if (!timestamp)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NILocation timestamp](v7, "timestamp"));

      if (!v10)
      {
        v12 = 1;
        goto LABEL_7;
      }
      timestamp = self->_timestamp;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NILocation timestamp](v8, "timestamp"));
    v12 = -[NSDate isEqual:](timestamp, "isEqual:", v11);

LABEL_7:
    latitude = self->_latitude;
    -[NILocation latitude](v8, "latitude");
    v15 = v14;
    longitude = self->_longitude;
    -[NILocation longitude](v8, "longitude");
    v18 = v17;
    altitude = self->_altitude;
    -[NILocation altitude](v8, "altitude");
    v21 = v20;
    ellipsoidalAltitude = self->_ellipsoidalAltitude;
    -[NILocation ellipsoidalAltitude](v8, "ellipsoidalAltitude");
    v24 = v23;
    horizontalAccuracy = self->_horizontalAccuracy;
    -[NILocation horizontalAccuracy](v8, "horizontalAccuracy");
    v50 = v25;
    verticalAccuracy = self->_verticalAccuracy;
    -[NILocation verticalAccuracy](v8, "verticalAccuracy");
    v48 = v26;
    speed = self->_speed;
    -[NILocation speed](v8, "speed");
    v46 = v27;
    speedAccuracy = self->_speedAccuracy;
    -[NILocation speedAccuracy](v8, "speedAccuracy");
    v44 = v28;
    course = self->_course;
    -[NILocation course](v8, "course");
    v42 = v29;
    courseAccuracy = self->_courseAccuracy;
    -[NILocation courseAccuracy](v8, "courseAccuracy");
    v40 = v30;
    floor = self->_floor;
    v32 = -[NILocation floor](v8, "floor");
    locationType = self->_locationType;
    v34 = -[NILocation locationType](v8, "locationType");
    signalEnvironment = self->_signalEnvironment;
    v36 = -[NILocation signalEnvironment](v8, "signalEnvironment");
    v37 = 0;
    if (v12
      && latitude == v15
      && longitude == v18
      && altitude == v21
      && ellipsoidalAltitude == v24
      && horizontalAccuracy == v50
      && verticalAccuracy == v48
      && speed == v46
      && speedAccuracy == v44
      && course == v42
      && courseAccuracy == v40
      && (id)floor == v32)
    {
      v37 = (id)locationType == v34 && signalEnvironment == v36;
    }
    goto LABEL_27;
  }
  v37 = 0;
LABEL_28:

  return v37;
}

- (unint64_t)hash
{
  NSDate *timestamp;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  timestamp = self->_timestamp;
  if (timestamp)
    v24 = (unint64_t)-[NSDate hash](timestamp, "hash");
  else
    v24 = 0;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_latitude));
  v23 = (unint64_t)objc_msgSend(v31, "hash");
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_longitude));
  v22 = (unint64_t)objc_msgSend(v30, "hash");
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_altitude));
  v20 = (unint64_t)objc_msgSend(v29, "hash");
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_ellipsoidalAltitude));
  v19 = (unint64_t)objc_msgSend(v28, "hash");
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_horizontalAccuracy));
  v18 = (unint64_t)objc_msgSend(v27, "hash");
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_verticalAccuracy));
  v17 = (unint64_t)objc_msgSend(v26, "hash");
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_speed));
  v16 = (unint64_t)objc_msgSend(v25, "hash");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_speedAccuracy));
  v15 = (unint64_t)objc_msgSend(v21, "hash");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_course));
  v5 = (unint64_t)objc_msgSend(v4, "hash");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_courseAccuracy));
  v7 = (unint64_t)objc_msgSend(v6, "hash");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_floor));
  v9 = (unint64_t)objc_msgSend(v8, "hash");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_locationType));
  v11 = (unint64_t)objc_msgSend(v10, "hash");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_signalEnvironment));
  v13 = v23 ^ v24 ^ v22 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v5 ^ v7 ^ v9 ^ v11 ^ (unint64_t)objc_msgSend(v12, "hash");

  return v13;
}

- (id)description
{
  id v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = objc_alloc((Class)NSMutableString);
  v5 = (objc_class *)objc_opt_class(self, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NILocation descriptionInternal](self, "descriptionInternal"));
  v9 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %@>"), v7, v8);

  return v9;
}

- (id)descriptionInternal
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.7fdeg"), *(_QWORD *)&self->_latitude));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.7fdeg"), *(_QWORD *)&self->_longitude));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.1fm"), *(_QWORD *)&self->_altitude));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.1fm"), *(_QWORD *)&self->_ellipsoidalAltitude));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.1fm"), *(_QWORD *)&self->_horizontalAccuracy));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.1fm"), *(_QWORD *)&self->_verticalAccuracy));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.1fm/s"), *(_QWORD *)&self->_speed));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.1fm/s"), *(_QWORD *)&self->_speedAccuracy));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.1fdeg"), *(_QWORD *)&self->_course));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.1fdeg"), *(_QWORD *)&self->_courseAccuracy));
    if (self->_floor == NILocationFloorNotAvailable)
      v6 = CFSTR("-");
    else
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), self->_floor));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), self->_locationType));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), self->_signalEnvironment));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Time: %@. Pos: [%@, %@, %@ (sea) %@ (ell)] +/- [%@, %@]. Spd: %@ +/- %@. Crs: %@ +/- %@. Flr: %@. LocType: %@. SigEnv: %@."), self->_timestamp, v15, v14, v3, v4, v17, v16, v13, v5, v12, v11, v6, v8, v9));

  }
  else
  {
    v7 = CFSTR("***");
  }
  return v7;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

- (double)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(double)a3
{
  self->_altitude = a3;
}

- (double)ellipsoidalAltitude
{
  return self->_ellipsoidalAltitude;
}

- (void)setEllipsoidalAltitude:(double)a3
{
  self->_ellipsoidalAltitude = a3;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (void)setHorizontalAccuracy:(double)a3
{
  self->_horizontalAccuracy = a3;
}

- (double)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (void)setVerticalAccuracy:(double)a3
{
  self->_verticalAccuracy = a3;
}

- (double)speed
{
  return self->_speed;
}

- (void)setSpeed:(double)a3
{
  self->_speed = a3;
}

- (double)speedAccuracy
{
  return self->_speedAccuracy;
}

- (void)setSpeedAccuracy:(double)a3
{
  self->_speedAccuracy = a3;
}

- (double)course
{
  return self->_course;
}

- (void)setCourse:(double)a3
{
  self->_course = a3;
}

- (double)courseAccuracy
{
  return self->_courseAccuracy;
}

- (void)setCourseAccuracy:(double)a3
{
  self->_courseAccuracy = a3;
}

- (int64_t)floor
{
  return self->_floor;
}

- (void)setFloor:(int64_t)a3
{
  self->_floor = a3;
}

- (int64_t)locationType
{
  return self->_locationType;
}

- (void)setLocationType:(int64_t)a3
{
  self->_locationType = a3;
}

- (int64_t)signalEnvironment
{
  return self->_signalEnvironment;
}

- (void)setSignalEnvironment:(int64_t)a3
{
  self->_signalEnvironment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
