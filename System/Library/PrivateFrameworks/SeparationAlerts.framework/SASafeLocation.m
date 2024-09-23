@implementation SASafeLocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SASafeLocation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  SASafeLocation *v15;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("SASafeLocationIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("SASafeLocationLatitude"));
  v7 = v6;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("SASafeLocationLongitude"));
  v9 = v8;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("SASafeLocationRadius"));
  v11 = v10;
  v12 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SASafeLocationReferenceFrame"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SASafeLocationNameString"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SASafeLocationDate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[SASafeLocation initWithLocationUUID:latitude:longitude:radius:referenceFrame:name:date:](self, "initWithLocationUUID:latitude:longitude:radius:referenceFrame:name:date:", v5, v12, v13, v14, v7, v9, v11);
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SASafeLocation identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SASafeLocationIdentifier"));

  -[SASafeLocation latitude](self, "latitude");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("SASafeLocationLatitude"));
  -[SASafeLocation longitude](self, "longitude");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("SASafeLocationLongitude"));
  -[SASafeLocation radius](self, "radius");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("SASafeLocationRadius"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SASafeLocation referenceFrame](self, "referenceFrame"), CFSTR("SASafeLocationReferenceFrame"));
  -[SASafeLocation name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("SASafeLocationNameString"));

  -[SASafeLocation date](self, "date");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("SASafeLocationDate"));

}

- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5
{
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = (void *)MEMORY[0x1CAA49754]();
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "appendBytes:length:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));

  objc_autoreleasePoolPop(v6);
}

- (id)copyWithZone:(_NSZone *)a3
{
  SASafeLocation *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  unint64_t v12;
  void *v13;
  void *v14;
  SASafeLocation *v15;

  v4 = +[SASafeLocation allocWithZone:](SASafeLocation, "allocWithZone:", a3);
  -[SASafeLocation identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASafeLocation latitude](self, "latitude");
  v7 = v6;
  -[SASafeLocation longitude](self, "longitude");
  v9 = v8;
  -[SASafeLocation radius](self, "radius");
  v11 = v10;
  v12 = -[SASafeLocation referenceFrame](self, "referenceFrame");
  -[SASafeLocation name](self, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASafeLocation date](self, "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SASafeLocation initWithLocationUUID:latitude:longitude:radius:referenceFrame:name:date:](v4, "initWithLocationUUID:latitude:longitude:radius:referenceFrame:name:date:", v5, v12, v13, v14, v7, v9, v11);

  return v15;
}

- (SASafeLocation)initWithLocationUUID:(id)a3 latitude:(double)a4 longitude:(double)a5 radius:(double)a6 referenceFrame:(unint64_t)a7 name:(id)a8 date:(id)a9
{
  id v16;
  id v17;
  id v18;
  SASafeLocation *v19;
  SASafeLocation *v20;
  uint64_t v21;
  NSUUID *identifier;
  uint64_t v23;
  NSString *name;
  uint64_t v25;
  NSDate *date;
  objc_super v28;

  v16 = a3;
  v17 = a8;
  v18 = a9;
  v28.receiver = self;
  v28.super_class = (Class)SASafeLocation;
  v19 = -[SASafeLocation init](&v28, sel_init);
  if (!v19)
    goto LABEL_5;
  v20 = 0;
  if (v16 && v18)
  {
    v21 = objc_msgSend(v16, "copy");
    identifier = v19->_identifier;
    v19->_identifier = (NSUUID *)v21;

    v19->_latitude = a4;
    v19->_longitude = a5;
    v19->_radius = a6;
    v19->_referenceFrame = a7;
    v23 = objc_msgSend(v17, "copy");
    name = v19->_name;
    v19->_name = (NSString *)v23;

    v25 = objc_msgSend(v18, "copy");
    date = v19->_date;
    v19->_date = (NSDate *)v25;

LABEL_5:
    v20 = v19;
  }

  return v20;
}

- (BOOL)isReallyEqual:(id)a3
{
  void *v3;
  void *v4;
  SASafeLocation *v6;
  SASafeLocation *v7;
  void *v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  unint64_t v21;

  v6 = (SASafeLocation *)a3;
  if (self == v6)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      -[SASafeLocation identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SASafeLocation identifier](v7, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == v9
        || (-[SASafeLocation identifier](self, "identifier"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            -[SASafeLocation identifier](v7, "identifier"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "isEqual:", v4)))
      {
        -[SASafeLocation latitude](self, "latitude");
        v13 = v12;
        -[SASafeLocation latitude](v7, "latitude");
        if (v13 == v14
          && (-[SASafeLocation longitude](self, "longitude"),
              v16 = v15,
              -[SASafeLocation longitude](v7, "longitude"),
              v16 == v17)
          && (-[SASafeLocation radius](self, "radius"), v19 = v18, -[SASafeLocation radius](v7, "radius"), v19 == v20))
        {
          v21 = -[SASafeLocation referenceFrame](self, "referenceFrame");
          v10 = v21 == -[SASafeLocation referenceFrame](v7, "referenceFrame");
          v11 = v10;
        }
        else
        {
          v10 = 0;
          v11 = 0;
        }
        if (v8 == v9)
          goto LABEL_15;
      }
      else
      {
        v10 = 0;
      }

      v11 = v10;
LABEL_15:

      goto LABEL_16;
    }
    v11 = 0;
  }
LABEL_16:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  SASafeLocation *v4;
  SASafeLocation *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (SASafeLocation *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SASafeLocation identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SASafeLocation identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SASafeLocation identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)descriptionDictionary
{
  void *v2;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[8];
  _QWORD v22[10];

  v22[8] = *MEMORY[0x1E0C80C00];
  v21[0] = CFSTR("EventType");
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v20;
  v21[1] = CFSTR("SASafeLocationIdentifier");
  -[SASafeLocation identifier](self, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "description");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v18;
  v21[2] = CFSTR("SASafeLocationLatitude");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[SASafeLocation latitude](self, "latitude");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v6;
  v21[3] = CFSTR("SASafeLocationLongitude");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[SASafeLocation longitude](self, "longitude");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v8;
  v21[4] = CFSTR("SASafeLocationRadius");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[SASafeLocation radius](self, "radius");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v10;
  v21[5] = CFSTR("SASafeLocationReferenceFrame");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SASafeLocation referenceFrame](self, "referenceFrame"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v11;
  v21[6] = CFSTR("SASafeLocationNameString");
  -[SASafeLocation name](self, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[SASafeLocation name](self, "name");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "description");
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = &stru_1E83D18B8;
  }
  v22[6] = v13;
  v21[7] = CFSTR("SASafeLocationDate");
  -[SASafeLocation date](self, "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "getDateString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[7] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {

  }
  return v16;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v10;

  -[SASafeLocation descriptionDictionary](self, "descriptionDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONStringFromNSDictionary:error:", v3, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (v5)
  {
    v6 = (void *)TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
      -[SAConnectionEvent description].cold.1(v6, (uint64_t)self, (uint64_t)v5);
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v4;
  }
  v8 = v7;

  return (NSString *)v8;
}

- (id)getDate
{
  return self->_date;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)radius
{
  return self->_radius;
}

- (unint64_t)referenceFrame
{
  return self->_referenceFrame;
}

- (NSString)name
{
  return self->_name;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
