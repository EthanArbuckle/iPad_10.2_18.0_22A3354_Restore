@implementation ATXLocationOfInterest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_visits, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (ATXLocationOfInterest)initWithUUID:(id)a3 visits:(id)a4 coordinate:(CLLocationCoordinate2D)a5 type:(int64_t)a6 city:(id)a7
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  id v15;
  id v16;
  id v17;
  ATXLocationOfInterest *v18;
  ATXLocationOfInterest *v19;
  NSArray *v20;
  NSArray *visits;
  void *v23;
  objc_super v24;

  longitude = a5.longitude;
  latitude = a5.latitude;
  v15 = a3;
  v16 = a4;
  v17 = a7;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXLocationOfInterest.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uuid"));

  }
  v24.receiver = self;
  v24.super_class = (Class)ATXLocationOfInterest;
  v18 = -[ATXLocationOfInterest init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_uuid, a3);
    if (v16)
      v20 = (NSArray *)v16;
    else
      v20 = (NSArray *)objc_opt_new();
    visits = v19->_visits;
    v19->_visits = v20;

    v19->_type = a6;
    v19->_coordinate.latitude = latitude;
    v19->_coordinate.longitude = longitude;
    objc_storeStrong((id *)&v19->_city, a7);
  }

  return v19;
}

- (ATXLocationOfInterest)initWithUUID:(id)a3 visits:(id)a4 coordinate:(CLLocationCoordinate2D)a5 type:(int64_t)a6
{
  return -[ATXLocationOfInterest initWithUUID:visits:coordinate:type:city:](self, "initWithUUID:visits:coordinate:type:city:", a3, a4, a6, 0, a5.latitude, a5.longitude);
}

- (ATXLocationOfInterest)initWithUUID:(id)a3 visits:(id)a4 coordinate:(CLLocationCoordinate2D)a5
{
  return -[ATXLocationOfInterest initWithUUID:visits:coordinate:type:](self, "initWithUUID:visits:coordinate:type:", a3, a4, -1, a5.latitude, a5.longitude);
}

- (void)addVisitFrom:(unint64_t)a3 to:(unint64_t)a4
{
  NSArray *visits;
  NSArray *v6;
  NSArray *v7;
  id v8;

  visits = self->_visits;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a3, a4 - a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray arrayByAddingObject:](visits, "arrayByAddingObject:", v8);
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v7 = self->_visits;
  self->_visits = v6;

}

- (BOOL)isEqual:(id)a3
{
  ATXLocationOfInterest *v4;
  ATXLocationOfInterest *v5;
  BOOL v6;

  v4 = (ATXLocationOfInterest *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXLocationOfInterest isEqualToLocation:](self, "isEqualToLocation:", v5);

  return v6;
}

- (BOOL)isEqualToLocation:(id)a3
{
  NSUUID *v4;
  NSUUID *v5;
  char v6;

  v4 = self->_uuid;
  v5 = v4;
  if (v4 == *((NSUUID **)a3 + 1))
    v6 = 1;
  else
    v6 = -[NSUUID isEqual:](v4, "isEqual:");

  return v6;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_uuid, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXLocationOfInterest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  CLLocationDegrees v8;
  CLLocationDegrees v9;
  CLLocationCoordinate2D v10;
  void *v11;
  ATXLocationOfInterest *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("type")))
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  else
    v6 = -1;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("latitude"));
  v8 = v7;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("longitude"));
  v10 = CLLocationCoordinate2DMake(v8, v9);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("city"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ATXLocationOfInterest initWithUUID:visits:coordinate:type:city:](self, "initWithUUID:visits:coordinate:type:city:", v5, 0, v6, v11, v10.latitude, v10.longitude);

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *city;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_uuid, CFSTR("uuid"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("latitude"), self->_coordinate.latitude);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("longitude"), self->_coordinate.longitude);
  city = self->_city;
  if (city)
    objc_msgSend(v5, "encodeObject:forKey:", city, CFSTR("city"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = (void *)-[NSUUID copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v7 = (void *)-[NSArray copyWithZone:](self->_visits, "copyWithZone:", a3);
  v8 = (void *)objc_msgSend(v5, "initWithUUID:visits:coordinate:type:city:", v6, v7, self->_type, self->_city, self->_coordinate.latitude, self->_coordinate.longitude);

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ATXLocationOfInterest uuid:%@ visits:%@ type:%ld lat:%f long:%f city:%@"), v4, self->_visits, self->_type, *(_QWORD *)&self->_coordinate.latitude, *(_QWORD *)&self->_coordinate.longitude, self->_city);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSArray)visits
{
  return self->_visits;
}

- (int64_t)type
{
  return self->_type;
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

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->_coordinate = a3;
}

- (NSString)city
{
  return self->_city;
}

@end
