@implementation SPObservationLocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPObservationLocation *v4;
  void *v5;
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
  SPObservationLocation *v24;
  double v26;

  v4 = [SPObservationLocation alloc];
  -[SPObservationLocation timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPObservationLocation latitude](self, "latitude");
  v26 = v6;
  -[SPObservationLocation longitude](self, "longitude");
  v8 = v7;
  -[SPObservationLocation horizontalAccuracy](self, "horizontalAccuracy");
  v10 = v9;
  -[SPObservationLocation altitude](self, "altitude");
  v12 = v11;
  -[SPObservationLocation verticalAccuracy](self, "verticalAccuracy");
  v14 = v13;
  -[SPObservationLocation speed](self, "speed");
  v16 = v15;
  -[SPObservationLocation speedAccuracy](self, "speedAccuracy");
  v18 = v17;
  -[SPObservationLocation course](self, "course");
  v20 = v19;
  -[SPObservationLocation courseAccuracy](self, "courseAccuracy");
  v22 = v21;
  -[SPObservationLocation floorLevel](self, "floorLevel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[SPObservationLocation initWithTimestamp:latitude:longitude:horizontalAccuracy:altitude:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:floorLevel:](v4, "initWithTimestamp:latitude:longitude:horizontalAccuracy:altitude:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:floorLevel:", v5, v23, v26, v8, v10, v12, v14, v16, v18, v20, v22);

  return v24;
}

- (SPObservationLocation)initWithTimestamp:(id)a3 latitude:(double)a4 longitude:(double)a5 horizontalAcuracy:(double)a6 altitude:(double)a7 verticalAccuracy:(double)a8 speed:(double)a9 speedAccuracy:(double)a10 course:(double)a11 courseAccuracy:(double)a12 floorLevel:(id)a13
{
  return -[SPObservationLocation initWithTimestamp:latitude:longitude:horizontalAccuracy:altitude:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:floorLevel:](self, "initWithTimestamp:latitude:longitude:horizontalAccuracy:altitude:verticalAccuracy:speed:speedAccuracy:course:courseAccuracy:floorLevel:", a3, a13, a4, a5, a6, a7, a8, a9, a10, a11);
}

- (SPObservationLocation)initWithTimestamp:(id)a3 latitude:(double)a4 longitude:(double)a5 horizontalAccuracy:(double)a6 altitude:(double)a7 verticalAccuracy:(double)a8 speed:(double)a9 speedAccuracy:(double)a10 course:(double)a11 courseAccuracy:(double)a12 floorLevel:(id)a13
{
  id v24;
  id v25;
  SPObservationLocation *v26;
  SPObservationLocation *v27;
  objc_super v29;

  v24 = a3;
  v25 = a13;
  v29.receiver = self;
  v29.super_class = (Class)SPObservationLocation;
  v26 = -[SPObservationLocation init](&v29, sel_init);
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_timestamp, a3);
    v27->_latitude = a4;
    v27->_longitude = a5;
    v27->_horizontalAccuracy = a6;
    v27->_altitude = a7;
    v27->_verticalAccuracy = a8;
    v27->_speed = a9;
    v27->_speedAccuracy = a10;
    v27->_course = a11;
    v27->_courseAccuracy = a12;
    objc_storeStrong((id *)&v27->_floorLevel, a13);
  }

  return v27;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *timestamp;
  id v5;

  timestamp = self->_timestamp;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", timestamp, CFSTR("timestamp"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("latitude"), self->_latitude);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("longitude"), self->_longitude);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("horizontalAccuracy"), self->_horizontalAccuracy);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("altitude"), self->_altitude);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("verticalAccuracy"), self->_verticalAccuracy);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("speed"), self->_speed);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("speedAccuracy"), self->_speedAccuracy);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("course"), self->_course);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("courseAccuracy"), self->_courseAccuracy);
  objc_msgSend(v5, "encodeObject:forKey:", self->_floorLevel, CFSTR("floorLevel"));

}

- (SPObservationLocation)initWithCoder:(id)a3
{
  id v4;
  NSDate *v5;
  NSDate *timestamp;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  NSNumber *v16;
  NSNumber *floorLevel;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  timestamp = self->_timestamp;
  self->_timestamp = v5;

  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("latitude"));
  self->_latitude = v7;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("longitude"));
  self->_longitude = v8;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("horizontalAccuracy"));
  self->_horizontalAccuracy = v9;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("altitude"));
  self->_altitude = v10;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("verticalAccuracy"));
  self->_verticalAccuracy = v11;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("speed"));
  self->_speed = v12;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("speedAccuracy"));
  self->_speedAccuracy = v13;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("course"));
  self->_course = v14;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("courseAccuracy"));
  self->_courseAccuracy = v15;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("floorLevel"));
  v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  floorLevel = self->_floorLevel;
  self->_floorLevel = v16;

  return self;
}

- (id)description
{
  void *v3;
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
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SPObservationLocation latitude](self, "latitude");
  v25 = v4;
  -[SPObservationLocation longitude](self, "longitude");
  v6 = v5;
  -[SPObservationLocation horizontalAccuracy](self, "horizontalAccuracy");
  v8 = v7;
  -[SPObservationLocation altitude](self, "altitude");
  v10 = v9;
  -[SPObservationLocation verticalAccuracy](self, "verticalAccuracy");
  v12 = v11;
  -[SPObservationLocation speed](self, "speed");
  v14 = v13;
  -[SPObservationLocation speedAccuracy](self, "speedAccuracy");
  v16 = v15;
  -[SPObservationLocation course](self, "course");
  v18 = v17;
  -[SPObservationLocation courseAccuracy](self, "courseAccuracy");
  v20 = v19;
  -[SPObservationLocation floorLevel](self, "floorLevel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPObservationLocation timestamp](self, "timestamp");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("SPObservationLocation Latitude: %f Longitude: %f hAcc: %f alt: %f(acc:%f) speed: %f(acc:%f) course: %f(acc:%f) floor: %@ %@"), v25, v6, v8, v10, v12, v14, v16, v18, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
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

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (void)setHorizontalAccuracy:(double)a3
{
  self->_horizontalAccuracy = a3;
}

- (double)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(double)a3
{
  self->_altitude = a3;
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

- (NSNumber)floorLevel
{
  return self->_floorLevel;
}

- (void)setFloorLevel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floorLevel, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
