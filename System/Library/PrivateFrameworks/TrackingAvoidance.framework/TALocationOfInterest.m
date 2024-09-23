@implementation TALocationOfInterest

- (TALocationOfInterest)initWithType:(unint64_t)a3 latitude:(double)a4 longitude:(double)a5 horizontalAccuracy:(double)a6 date:(id)a7
{
  return -[TALocationOfInterest initWithType:latitude:longitude:horizontalAccuracy:referenceFrame:date:](self, "initWithType:latitude:longitude:horizontalAccuracy:referenceFrame:date:", a3, 0, a7, a4, a5, a6);
}

- (TALocationOfInterest)initWithType:(unint64_t)a3 latitude:(double)a4 longitude:(double)a5 horizontalAccuracy:(double)a6 referenceFrame:(unint64_t)a7 date:(id)a8
{
  id v14;
  TALocationOfInterest *v15;
  TALocationOfInterest *v16;
  uint64_t v17;
  NSDate *date;
  TALocationOfInterest *v19;
  objc_super v21;

  v14 = a8;
  v21.receiver = self;
  v21.super_class = (Class)TALocationOfInterest;
  v15 = -[TALocationOfInterest init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    if (!v14)
    {
      v19 = 0;
      goto LABEL_6;
    }
    v15->_type = a3;
    v15->_latitude = a4;
    v15->_longitude = a5;
    v15->_horizontalAccuracy = a6;
    v15->_referenceFrame = a7;
    v17 = objc_msgSend(v14, "copy");
    date = v16->_date;
    v16->_date = (NSDate *)v17;

  }
  v19 = v16;
LABEL_6:

  return v19;
}

+ (unint64_t)convertRTToTALocationOfInterestType:(int64_t)a3
{
  if (a3)
    return 2 * (a3 == 1);
  else
    return 1;
}

- (unint64_t)hash
{
  unint64_t type;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;

  type = self->_type;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_latitude);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ type;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_longitude);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_horizontalAccuracy);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");
  v10 = v9 ^ -[NSDate hash](self->_date, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  TALocationOfInterest *v4;
  TALocationOfInterest *v5;
  unint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;

  v4 = (TALocationOfInterest *)a3;
  if (self == v4)
  {
    v21 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[TALocationOfInterest type](self, "type");
      if (v6 != -[TALocationOfInterest type](v5, "type"))
        goto LABEL_12;
      -[TALocationOfInterest latitude](self, "latitude");
      v8 = v7;
      -[TALocationOfInterest latitude](v5, "latitude");
      if (v8 != v9)
        goto LABEL_12;
      -[TALocationOfInterest longitude](self, "longitude");
      v11 = v10;
      -[TALocationOfInterest longitude](v5, "longitude");
      if (v11 == v12
        && (-[TALocationOfInterest horizontalAccuracy](self, "horizontalAccuracy"),
            v14 = v13,
            -[TALocationOfInterest horizontalAccuracy](v5, "horizontalAccuracy"),
            v14 == v15)
        && (v16 = -[TALocationOfInterest referenceFrame](self, "referenceFrame"),
            v16 == -[TALocationOfInterest referenceFrame](v5, "referenceFrame")))
      {
        -[TALocationOfInterest date](self, "date");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[TALocationOfInterest date](v5, "date");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17 == v18)
        {
          v21 = 1;
        }
        else
        {
          -[TALocationOfInterest date](self, "date");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[TALocationOfInterest date](v5, "date");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v19, "isEqual:", v20);

        }
      }
      else
      {
LABEL_12:
        v21 = 0;
      }

    }
    else
    {
      v21 = 0;
    }
  }

  return v21;
}

- (id)descriptionDictionary
{
  objc_class *v3;
  void *v4;
  unint64_t type;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[7];
  _QWORD v16[8];

  v16[7] = *MEMORY[0x24BDAC8D0];
  v15[0] = CFSTR("EventType");
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v15[1] = CFSTR("Type");
  type = self->_type;
  if (type > 2)
    v6 = CFSTR("<invalid>");
  else
    v6 = off_24D8155E0[type];
  v16[1] = v6;
  v15[2] = CFSTR("Latitude");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_latitude);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v7;
  v15[3] = CFSTR("Longitude");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_longitude);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v8;
  v15[4] = CFSTR("HorizontalAccuracy");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_horizontalAccuracy);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v9;
  v15[5] = CFSTR("ReferenceFrame");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_referenceFrame);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v10;
  v15[6] = CFSTR("Date");
  -[TALocationOfInterest date](self, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "getDateString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
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

  -[TALocationOfInterest descriptionDictionary](self, "descriptionDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONStringFromNSDictionary:error:", v3, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (v5)
  {
    v6 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      -[TAOutgoingRequests description].cold.1(v6, (uint64_t)self, (uint64_t)v5);
    objc_msgSend(MEMORY[0x24BDD17C8], "string");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v4;
  }
  v8 = v7;

  return (NSString *)v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TALocationOfInterest initWithType:latitude:longitude:horizontalAccuracy:date:]([TALocationOfInterest alloc], "initWithType:latitude:longitude:horizontalAccuracy:date:", self->_type, self->_date, self->_latitude, self->_longitude, self->_horizontalAccuracy);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TALocationOfInterest)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  TALocationOfInterest *v14;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Type"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("Latitude"));
  v7 = v6;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("Longitude"));
  v9 = v8;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HorizontalAccuracy"));
  v11 = v10;
  v12 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ReferenceFrame"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Date"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[TALocationOfInterest initWithType:latitude:longitude:horizontalAccuracy:referenceFrame:date:](self, "initWithType:latitude:longitude:horizontalAccuracy:referenceFrame:date:", v5, v12, v13, v7, v9, v11);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("Type"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("Latitude"), self->_latitude);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("Longitude"), self->_longitude);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("HorizontalAccuracy"), self->_horizontalAccuracy);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_referenceFrame, CFSTR("ReferenceFrame"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_date, CFSTR("Date"));

}

- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5
{
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = (void *)MEMORY[0x219A13570]();
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "appendBytes:length:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));

  objc_autoreleasePoolPop(v6);
}

- (id)getDate
{
  return self->_date;
}

- (unint64_t)type
{
  return self->_type;
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (unint64_t)referenceFrame
{
  return self->_referenceFrame;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
