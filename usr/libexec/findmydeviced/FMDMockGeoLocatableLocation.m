@implementation FMDMockGeoLocatableLocation

+ (id)geoLocatableLocation
{
  FMDMockGeoLocatableLocation *v2;
  void *v3;

  v2 = objc_alloc_init(FMDMockGeoLocatableLocation);
  -[FMDMockGeoLocatableLocation setLatitude:](v2, "setLatitude:", &off_1002D8330);
  -[FMDMockGeoLocatableLocation setLongitude:](v2, "setLongitude:", &off_1002D8340);
  -[FMDMockGeoLocatableLocation setAltitude:](v2, "setAltitude:", &off_1002D7F48);
  -[FMDMockGeoLocatableLocation setHorizontalAccuracy:](v2, "setHorizontalAccuracy:", &off_1002D7F48);
  -[FMDMockGeoLocatableLocation setVerticalAccuracy:](v2, "setVerticalAccuracy:", &off_1002D7F48);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[FMDMockGeoLocatableLocation setTimestamp:](v2, "setTimestamp:", v3);

  return v2;
}

- (void)setNewLatitude:(id)a3 longitude:(id)a4
{
  id v6;

  v6 = a4;
  -[FMDMockGeoLocatableLocation setLatitude:](self, "setLatitude:", a3);
  -[FMDMockGeoLocatableLocation setLongitude:](self, "setLongitude:", v6);

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  void *v14;
  NSString *v15;
  void *v16;
  void *v17;
  NSString *v18;
  void *v19;
  void *v20;
  NSString *v21;
  void *v22;
  void *v23;
  NSString *v24;
  void *v25;
  void *v26;
  NSString *v27;
  void *v28;
  void *v29;
  NSString *v30;
  void *v31;
  NSString *v32;
  void *v33;
  id v34;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockGeoLocatableLocation latitude](self, "latitude"));
  v6 = NSStringFromSelector("latitude");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v4, "encodeObject:forKey:", v5, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockGeoLocatableLocation longitude](self, "longitude"));
  v9 = NSStringFromSelector("longitude");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v4, "encodeObject:forKey:", v8, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockGeoLocatableLocation altitude](self, "altitude"));
  v12 = NSStringFromSelector("altitude");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v4, "encodeObject:forKey:", v11, v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockGeoLocatableLocation horizontalAccuracy](self, "horizontalAccuracy"));
  v15 = NSStringFromSelector("horizontalAccuracy");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  objc_msgSend(v4, "encodeObject:forKey:", v14, v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockGeoLocatableLocation verticalAccuracy](self, "verticalAccuracy"));
  v18 = NSStringFromSelector("verticalAccuracy");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  objc_msgSend(v4, "encodeObject:forKey:", v17, v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockGeoLocatableLocation course](self, "course"));
  v21 = NSStringFromSelector("course");
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  objc_msgSend(v4, "encodeObject:forKey:", v20, v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockGeoLocatableLocation speed](self, "speed"));
  v24 = NSStringFromSelector("speed");
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  objc_msgSend(v4, "encodeObject:forKey:", v23, v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockGeoLocatableLocation timestamp](self, "timestamp"));
  v27 = NSStringFromSelector("timestamp");
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  objc_msgSend(v4, "encodeObject:forKey:", v26, v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[FMDMockGeoLocatableLocation floor](self, "floor"));
  v30 = NSStringFromSelector("floor");
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  objc_msgSend(v4, "encodeObject:forKey:", v29, v31);

  v34 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[FMDMockGeoLocatableLocation locationType](self, "locationType")));
  v32 = NSStringFromSelector("locationType");
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  objc_msgSend(v4, "encodeObject:forKey:", v34, v33);

}

- (FMDMockGeoLocatableLocation)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  FMDMockGeoLocatableLocation *v6;
  uint64_t v7;
  NSString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSString *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSString *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  NSString *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  NSString *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  NSString *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  NSString *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  NSString *v53;
  void *v54;
  void *v55;
  objc_super v57;

  v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)FMDMockGeoLocatableLocation;
  v6 = -[FMDMockGeoLocatableLocation init](&v57, "init");
  if (v6)
  {
    v7 = objc_opt_class(NSNumber, v5);
    v8 = NSStringFromSelector("latitude");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v9));
    -[FMDMockGeoLocatableLocation setLatitude:](v6, "setLatitude:", v10);

    v12 = objc_opt_class(NSNumber, v11);
    v13 = NSStringFromSelector("longitude");
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, v14));
    -[FMDMockGeoLocatableLocation setLongitude:](v6, "setLongitude:", v15);

    v17 = objc_opt_class(NSNumber, v16);
    v18 = NSStringFromSelector("altitude");
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v17, v19));
    -[FMDMockGeoLocatableLocation setAltitude:](v6, "setAltitude:", v20);

    v22 = objc_opt_class(NSNumber, v21);
    v23 = NSStringFromSelector("horizontalAccuracy");
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v22, v24));
    -[FMDMockGeoLocatableLocation setHorizontalAccuracy:](v6, "setHorizontalAccuracy:", v25);

    v27 = objc_opt_class(NSNumber, v26);
    v28 = NSStringFromSelector("verticalAccuracy");
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v27, v29));
    -[FMDMockGeoLocatableLocation setVerticalAccuracy:](v6, "setVerticalAccuracy:", v30);

    v32 = objc_opt_class(NSNumber, v31);
    v33 = NSStringFromSelector("course");
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v32, v34));
    -[FMDMockGeoLocatableLocation setCourse:](v6, "setCourse:", v35);

    v37 = objc_opt_class(NSNumber, v36);
    v38 = NSStringFromSelector("speed");
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v37, v39));
    -[FMDMockGeoLocatableLocation setSpeed:](v6, "setSpeed:", v40);

    v42 = objc_opt_class(NSDate, v41);
    v43 = NSStringFromSelector("timestamp");
    v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v42, v44));
    -[FMDMockGeoLocatableLocation setTimestamp:](v6, "setTimestamp:", v45);

    v47 = objc_opt_class(NSNumber, v46);
    v48 = NSStringFromSelector("floor");
    v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v47, v49));
    -[FMDMockGeoLocatableLocation setFloor:](v6, "setFloor:", v50);

    v52 = objc_opt_class(NSNumber, v51);
    v53 = NSStringFromSelector("locationType");
    v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v52, v54));
    -[FMDMockGeoLocatableLocation setLocationType:](v6, "setLocationType:", objc_msgSend(v55, "integerValue"));

  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(id)a3
{
  objc_storeStrong((id *)&self->_latitude, a3);
}

- (NSNumber)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(id)a3
{
  objc_storeStrong((id *)&self->_longitude, a3);
}

- (NSNumber)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(id)a3
{
  objc_storeStrong((id *)&self->_altitude, a3);
}

- (NSNumber)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (void)setHorizontalAccuracy:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalAccuracy, a3);
}

- (NSNumber)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (void)setVerticalAccuracy:(id)a3
{
  objc_storeStrong((id *)&self->_verticalAccuracy, a3);
}

- (NSNumber)course
{
  return self->_course;
}

- (void)setCourse:(id)a3
{
  objc_storeStrong((id *)&self->_course, a3);
}

- (NSNumber)speed
{
  return self->_speed;
}

- (void)setSpeed:(id)a3
{
  objc_storeStrong((id *)&self->_speed, a3);
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)floor
{
  return self->_floor;
}

- (void)setFloor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
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
  objc_storeStrong((id *)&self->_floor, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_speed, 0);
  objc_storeStrong((id *)&self->_course, 0);
  objc_storeStrong((id *)&self->_verticalAccuracy, 0);
  objc_storeStrong((id *)&self->_horizontalAccuracy, 0);
  objc_storeStrong((id *)&self->_altitude, 0);
  objc_storeStrong((id *)&self->_longitude, 0);
  objc_storeStrong((id *)&self->_latitude, 0);
}

@end
