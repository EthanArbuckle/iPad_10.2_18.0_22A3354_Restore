@implementation SPSecureLocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPSecureLocation *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(SPSecureLocation);
  -[SPSecureLocation findMyId](self, "findMyId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPSecureLocation setFindMyId:](v4, "setFindMyId:", v5);

  -[SPSecureLocation longitude](self, "longitude");
  -[SPSecureLocation setLongitude:](v4, "setLongitude:");
  -[SPSecureLocation latitude](self, "latitude");
  -[SPSecureLocation setLatitude:](v4, "setLatitude:");
  -[SPSecureLocation speed](self, "speed");
  -[SPSecureLocation setSpeed:](v4, "setSpeed:");
  -[SPSecureLocation horizontalAccuracy](self, "horizontalAccuracy");
  -[SPSecureLocation setHorizontalAccuracy:](v4, "setHorizontalAccuracy:");
  -[SPSecureLocation verticalAccuracy](self, "verticalAccuracy");
  -[SPSecureLocation setVerticalAccuracy:](v4, "setVerticalAccuracy:");
  -[SPSecureLocation course](self, "course");
  -[SPSecureLocation setCourse:](v4, "setCourse:");
  -[SPSecureLocation altitude](self, "altitude");
  -[SPSecureLocation setAltitude:](v4, "setAltitude:");
  -[SPSecureLocation floor](self, "floor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPSecureLocation setFloor:](v4, "setFloor:", v6);

  -[SPSecureLocation timestamp](self, "timestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPSecureLocation setTimestamp:](v4, "setTimestamp:", v7);

  -[SPSecureLocation setMotionActivityState:](v4, "setMotionActivityState:", -[SPSecureLocation motionActivityState](self, "motionActivityState"));
  -[SPSecureLocation setPublishReason:](v4, "setPublishReason:", -[SPSecureLocation publishReason](self, "publishReason"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *findMyId;
  id v5;

  findMyId = self->_findMyId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", findMyId, CFSTR("findMyId"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("latitude"), self->_latitude);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("longitude"), self->_longitude);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("horizontalAccuracy"), self->_horizontalAccuracy);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("verticalAccuracy"), self->_verticalAccuracy);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("speed"), self->_speed);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("course"), self->_course);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("altitude"), self->_altitude);
  objc_msgSend(v5, "encodeObject:forKey:", self->_floor, CFSTR("floor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timestamp, CFSTR("timestamp"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_motionActivityState, CFSTR("motionActivityState"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_publishReason, CFSTR("publishReason"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_locationLabel, CFSTR("locationLabel"));

}

- (SPSecureLocation)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *findMyId;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NSNumber *v14;
  NSNumber *floor;
  NSDate *v16;
  NSDate *timestamp;
  NSString *v18;
  NSString *locationLabel;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("findMyId"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  findMyId = self->_findMyId;
  self->_findMyId = v5;

  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("latitude"));
  self->_latitude = v7;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("longitude"));
  self->_longitude = v8;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("horizontalAccuracy"));
  self->_horizontalAccuracy = v9;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("verticalAccuracy"));
  self->_verticalAccuracy = v10;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("speed"));
  self->_speed = v11;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("course"));
  self->_course = v12;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("altitude"));
  self->_altitude = v13;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("floor"));
  v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  floor = self->_floor;
  self->_floor = v14;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
  v16 = (NSDate *)objc_claimAutoreleasedReturnValue();
  timestamp = self->_timestamp;
  self->_timestamp = v16;

  self->_motionActivityState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("motionActivityState"));
  self->_publishReason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("publishReason"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locationLabel"));
  v18 = (NSString *)objc_claimAutoreleasedReturnValue();

  locationLabel = self->_locationLabel;
  self->_locationLabel = v18;

  return self;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[SPSecureLocation findMyId](self, "findMyId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPSecureLocation latitude](self, "latitude");
  v7 = v6;
  -[SPSecureLocation longitude](self, "longitude");
  v9 = v8;
  -[SPSecureLocation timestamp](self, "timestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPSecureLocation horizontalAccuracy](self, "horizontalAccuracy");
  v12 = v11;
  -[SPSecureLocation verticalAccuracy](self, "verticalAccuracy");
  v14 = v13;
  -[SPSecureLocation speed](self, "speed");
  v16 = v15;
  -[SPSecureLocation altitude](self, "altitude");
  v18 = v17;
  -[SPSecureLocation floor](self, "floor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[SPSecureLocation _stringFromMotionState:](SPSecureLocation, "_stringFromMotionState:", -[SPSecureLocation motionActivityState](self, "motionActivityState"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[SPSecureLocation _stringFromPublishReason:](SPSecureLocation, "_stringFromPublishReason:", -[SPSecureLocation publishReason](self, "publishReason"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPSecureLocation locationLabel](self, "locationLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: %@ %.06f/%.06f %@ ha %.06f va %.06f sp %.06f alt %0.06f fl %@ mstate %@ pubreason %@ lbl %@>"), v4, self, v5, v7, v9, v10, v12, v14, v16, v18, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)_stringFromPublishReason:(int64_t)a3
{
  id result;

  result = CFSTR("slc");
  switch(a3)
  {
    case 1:
      return result;
    case 2:
      result = CFSTR("visitStart");
      break;
    case 3:
      result = CFSTR("heartbeat");
      break;
    case 4:
      result = CFSTR("bystander");
      break;
    case 5:
      result = CFSTR("ondemand");
      break;
    case 6:
      result = CFSTR("shallow");
      break;
    case 7:
      result = CFSTR("live");
      break;
    case 8:
      result = CFSTR("stewie");
      break;
    default:
      if (a3 == 100)
        result = CFSTR("legacyLocate");
      else
        result = CFSTR("unknown");
      break;
  }
  return result;
}

+ (id)_stringFromMotionState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
    return CFSTR("unknown");
  else
    return off_1E5E17DA0[a3 - 1];
}

- (NSString)findMyId
{
  return self->_findMyId;
}

- (void)setFindMyId:(id)a3
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

- (double)course
{
  return self->_course;
}

- (void)setCourse:(double)a3
{
  self->_course = a3;
}

- (double)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(double)a3
{
  self->_altitude = a3;
}

- (NSNumber)floor
{
  return self->_floor;
}

- (void)setFloor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (int64_t)motionActivityState
{
  return self->_motionActivityState;
}

- (void)setMotionActivityState:(int64_t)a3
{
  self->_motionActivityState = a3;
}

- (int64_t)publishReason
{
  return self->_publishReason;
}

- (void)setPublishReason:(int64_t)a3
{
  self->_publishReason = a3;
}

- (NSString)locationLabel
{
  return self->_locationLabel;
}

- (void)setLocationLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationLabel, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_floor, 0);
  objc_storeStrong((id *)&self->_findMyId, 0);
}

@end
