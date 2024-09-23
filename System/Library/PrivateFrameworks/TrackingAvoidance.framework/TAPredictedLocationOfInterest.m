@implementation TAPredictedLocationOfInterest

- (TAPredictedLocationOfInterest)initWithType:(unint64_t)a3 latitude:(double)a4 longitude:(double)a5 horizontalAccuracy:(double)a6 confidence:(double)a7 nextEntryTime:(id)a8 date:(id)a9
{
  return -[TAPredictedLocationOfInterest initWithType:latitude:longitude:horizontalAccuracy:referenceFrame:confidence:nextEntryTime:date:](self, "initWithType:latitude:longitude:horizontalAccuracy:referenceFrame:confidence:nextEntryTime:date:", a3, 0, a8, a9, a4, a5, a6, a7);
}

- (TAPredictedLocationOfInterest)initWithType:(unint64_t)a3 latitude:(double)a4 longitude:(double)a5 horizontalAccuracy:(double)a6 referenceFrame:(unint64_t)a7 confidence:(double)a8 nextEntryTime:(id)a9 date:(id)a10
{
  id v18;
  id v19;
  TAPredictedLocationOfInterest *v20;
  TAPredictedLocationOfInterest *v21;
  uint64_t v22;
  NSDate *nextEntryTime;
  uint64_t v24;
  NSDate *date;
  TAPredictedLocationOfInterest *v26;
  objc_super v28;

  v18 = a9;
  v19 = a10;
  v28.receiver = self;
  v28.super_class = (Class)TAPredictedLocationOfInterest;
  v20 = -[TAPredictedLocationOfInterest init](&v28, sel_init);
  v21 = v20;
  if (v20)
  {
    if (!v19)
    {
      v26 = 0;
      goto LABEL_6;
    }
    v20->_type = a3;
    v20->_latitude = a4;
    v20->_longitude = a5;
    v20->_horizontalAccuracy = a6;
    v20->_referenceFrame = a7;
    v20->_confidence = a8;
    v22 = objc_msgSend(v18, "copy");
    nextEntryTime = v21->_nextEntryTime;
    v21->_nextEntryTime = (NSDate *)v22;

    v24 = objc_msgSend(v19, "copy");
    date = v21->_date;
    v21->_date = (NSDate *)v24;

  }
  v26 = v21;
LABEL_6:

  return v26;
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
  void *v10;
  uint64_t v11;
  unint64_t v12;

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
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_confidence);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  v12 = v9 ^ v11 ^ -[NSDate hash](self->_date, "hash");

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  TAPredictedLocationOfInterest *v5;
  TAPredictedLocationOfInterest *v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  unint64_t v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v5 = (TAPredictedLocationOfInterest *)a3;
  if (self == v5)
  {
    v24 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      v7 = -[TAPredictedLocationOfInterest type](self, "type");
      if (v7 != -[TAPredictedLocationOfInterest type](v6, "type"))
        goto LABEL_14;
      -[TAPredictedLocationOfInterest latitude](self, "latitude");
      v9 = v8;
      -[TAPredictedLocationOfInterest latitude](v6, "latitude");
      if (v9 != v10)
        goto LABEL_14;
      -[TAPredictedLocationOfInterest longitude](self, "longitude");
      v12 = v11;
      -[TAPredictedLocationOfInterest longitude](v6, "longitude");
      if (v12 != v13
        || (-[TAPredictedLocationOfInterest horizontalAccuracy](self, "horizontalAccuracy"),
            v15 = v14,
            -[TAPredictedLocationOfInterest horizontalAccuracy](v6, "horizontalAccuracy"),
            v15 != v16)
        || (v17 = -[TAPredictedLocationOfInterest referenceFrame](self, "referenceFrame"),
            v17 != -[TAPredictedLocationOfInterest referenceFrame](v6, "referenceFrame"))
        || (-[TAPredictedLocationOfInterest confidence](self, "confidence"),
            v19 = v18,
            -[TAPredictedLocationOfInterest confidence](v6, "confidence"),
            v19 != v20))
      {
LABEL_14:
        v24 = 0;
LABEL_15:

        goto LABEL_16;
      }
      -[TAPredictedLocationOfInterest nextEntryTime](self, "nextEntryTime");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAPredictedLocationOfInterest nextEntryTime](v6, "nextEntryTime");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21 != v22)
      {
        -[TAPredictedLocationOfInterest nextEntryTime](self, "nextEntryTime");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAPredictedLocationOfInterest nextEntryTime](v6, "nextEntryTime");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v23, "isEqual:", v3))
        {
          v24 = 0;
LABEL_22:

LABEL_23:
          goto LABEL_15;
        }
        v31 = v23;
      }
      -[TAPredictedLocationOfInterest date](self, "date");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAPredictedLocationOfInterest date](v6, "date");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v26 == (void *)v27)
      {

        v24 = 1;
      }
      else
      {
        v28 = (void *)v27;
        -[TAPredictedLocationOfInterest date](self, "date");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAPredictedLocationOfInterest date](v6, "date");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v29, "isEqual:", v30);

      }
      v23 = v31;
      if (v21 == v22)
        goto LABEL_23;
      goto LABEL_22;
    }
    v24 = 0;
  }
LABEL_16:

  return v24;
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
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[9];
  _QWORD v19[11];

  v19[9] = *MEMORY[0x24BDAC8D0];
  v18[0] = CFSTR("EventType");
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v17;
  v18[1] = CFSTR("Type");
  TALocationOfInterestTypeToString(self->_type);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v16;
  v18[2] = CFSTR("Latitude");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_latitude);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v15;
  v18[3] = CFSTR("Longitude");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_longitude);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v5;
  v18[4] = CFSTR("HorizontalAccuracy");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_horizontalAccuracy);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v6;
  v18[5] = CFSTR("ReferenceFrame");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_referenceFrame);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v7;
  v18[6] = CFSTR("Confidence");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_confidence);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v8;
  v18[7] = CFSTR("NextEntryTime");
  -[TAPredictedLocationOfInterest nextEntryTime](self, "nextEntryTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[TAPredictedLocationOfInterest nextEntryTime](self, "nextEntryTime");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "getDateString");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = &stru_24D815B48;
  }
  v19[7] = v10;
  v18[8] = CFSTR("Date");
  -[TAPredictedLocationOfInterest date](self, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "getDateString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[8] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {

  }
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

  -[TAPredictedLocationOfInterest descriptionDictionary](self, "descriptionDictionary");
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
  return -[TAPredictedLocationOfInterest initWithType:latitude:longitude:horizontalAccuracy:confidence:nextEntryTime:date:]([TAPredictedLocationOfInterest alloc], "initWithType:latitude:longitude:horizontalAccuracy:confidence:nextEntryTime:date:", self->_type, self->_nextEntryTime, self->_date, self->_latitude, self->_longitude, self->_horizontalAccuracy, self->_confidence);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAPredictedLocationOfInterest)initWithCoder:(id)a3
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
  double v13;
  double v14;
  void *v15;
  void *v16;
  TAPredictedLocationOfInterest *v17;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Type"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("Latitude"));
  v7 = v6;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("Longitude"));
  v9 = v8;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HorizontalAccuracy"));
  v11 = v10;
  v12 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ReferenceFrame"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("Confidence"));
  v14 = v13;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NextEntryTime"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Date"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[TAPredictedLocationOfInterest initWithType:latitude:longitude:horizontalAccuracy:referenceFrame:confidence:nextEntryTime:date:](self, "initWithType:latitude:longitude:horizontalAccuracy:referenceFrame:confidence:nextEntryTime:date:", v5, v12, v15, v16, v7, v9, v11, v14);
  return v17;
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
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("Confidence"), self->_confidence);
  objc_msgSend(v5, "encodeObject:forKey:", self->_nextEntryTime, CFSTR("NextEntryTime"));
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

- (double)confidence
{
  return self->_confidence;
}

- (NSDate)nextEntryTime
{
  return self->_nextEntryTime;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_nextEntryTime, 0);
}

@end
