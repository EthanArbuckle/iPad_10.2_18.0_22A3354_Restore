@implementation TACLVisit

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

- (id)getDate
{
  return self->_detectionDate;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TACLVisit)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  TACLVisit *v15;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("Latitude"));
  v6 = v5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("Longitude"));
  v8 = v7;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HorizontalAccuracy"));
  v10 = v9;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ArrivalDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DepartureDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Date"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Confidence"));

  v15 = -[TACLVisit initWithCoordinate:horizontalAccuracy:arrivalDate:departureDate:detectionDate:confidence:](self, "initWithCoordinate:horizontalAccuracy:arrivalDate:departureDate:detectionDate:confidence:", v11, v12, v13, v14, v6, v8, v10);
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[TACLVisit coordinate](self, "coordinate");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("Latitude"));
  -[TACLVisit coordinate](self, "coordinate");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("Longitude"), v4);
  -[TACLVisit horizontalAccuracy](self, "horizontalAccuracy");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("HorizontalAccuracy"));
  -[TACLVisit arrivalDate](self, "arrivalDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("ArrivalDate"));

  -[TACLVisit departureDate](self, "departureDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("DepartureDate"));

  -[TACLVisit detectionDate](self, "detectionDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("Date"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[TACLVisit confidence](self, "confidence"), CFSTR("Confidence"));
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

- (id)copyWithZone:(_NSZone *)a3
{
  TACLVisit *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  TACLVisit *v14;

  v4 = +[TACLVisit allocWithZone:](TACLVisit, "allocWithZone:", a3);
  -[TACLVisit coordinate](self, "coordinate");
  v6 = v5;
  v8 = v7;
  -[TACLVisit horizontalAccuracy](self, "horizontalAccuracy");
  v10 = v9;
  -[TACLVisit arrivalDate](self, "arrivalDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TACLVisit departureDate](self, "departureDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TACLVisit detectionDate](self, "detectionDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[TACLVisit initWithCoordinate:horizontalAccuracy:arrivalDate:departureDate:detectionDate:confidence:](v4, "initWithCoordinate:horizontalAccuracy:arrivalDate:departureDate:detectionDate:confidence:", v11, v12, v13, -[TACLVisit confidence](self, "confidence"), v6, v8, v10);

  return v14;
}

- (TACLVisit)initWithCoordinate:(CLLocationCoordinate2D)a3 horizontalAccuracy:(double)a4 arrivalDate:(id)a5 departureDate:(id)a6 detectionDate:(id)a7 confidence:(unint64_t)a8
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  uint64_t v15;
  uint64_t v16;
  id v17;
  TACLVisit *v18;
  uint64_t v19;
  NSDate *arrivalDate;
  uint64_t v21;
  NSDate *departureDate;
  uint64_t v23;
  NSDate *detectionDate;
  TACLVisit *v25;
  objc_super v27;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v15 = (uint64_t)a5;
  v16 = (uint64_t)a6;
  v17 = a7;
  v27.receiver = self;
  v27.super_class = (Class)TACLVisit;
  v18 = -[TACLVisit init](&v27, sel_init);
  if (!v18)
    goto LABEL_7;
  if (!v17)
  {
LABEL_9:
    v25 = 0;
    goto LABEL_10;
  }
  if (!(v15 | v16))
  {
    v15 = 0;
    v16 = 0;
    goto LABEL_9;
  }
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v15)
      goto LABEL_6;
LABEL_12:
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (!v15)
    goto LABEL_12;
LABEL_6:
  v18->_coordinate.latitude = latitude;
  v18->_coordinate.longitude = longitude;
  v18->_horizontalAccuracy = a4;
  v19 = objc_msgSend((id)v15, "copy");
  arrivalDate = v18->_arrivalDate;
  v18->_arrivalDate = (NSDate *)v19;

  v21 = objc_msgSend((id)v16, "copy");
  departureDate = v18->_departureDate;
  v18->_departureDate = (NSDate *)v21;

  v23 = objc_msgSend(v17, "copy");
  detectionDate = v18->_detectionDate;
  v18->_detectionDate = (NSDate *)v23;

  v18->_confidence = a8;
LABEL_7:
  v25 = v18;
LABEL_10:

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  TACLVisit *v5;
  TACLVisit *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v5 = (TACLVisit *)a3;
  if (self == v5)
  {
    v19 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[TACLVisit coordinate](self, "coordinate");
      v8 = v7;
      -[TACLVisit coordinate](v6, "coordinate");
      if (v8 != v9
        || (-[TACLVisit coordinate](self, "coordinate"), v11 = v10,
                                                         -[TACLVisit coordinate](v6, "coordinate"),
                                                         v11 != v12)
        || (-[TACLVisit horizontalAccuracy](self, "horizontalAccuracy"),
            v14 = v13,
            -[TACLVisit horizontalAccuracy](v6, "horizontalAccuracy"),
            v14 != v15))
      {
        v19 = 0;
LABEL_29:

        goto LABEL_30;
      }
      -[TACLVisit arrivalDate](self, "arrivalDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[TACLVisit arrivalDate](v6, "arrivalDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 != v17)
      {
        -[TACLVisit arrivalDate](self, "arrivalDate");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[TACLVisit arrivalDate](v6, "arrivalDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v18))
        {
          v19 = 0;
          goto LABEL_27;
        }
        v32 = v18;
        v33 = v3;
      }
      -[TACLVisit departureDate](self, "departureDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[TACLVisit departureDate](v6, "departureDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20 != v21)
      {
        -[TACLVisit departureDate](self, "departureDate");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[TACLVisit departureDate](v6, "departureDate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v22))
        {
          v19 = 0;
LABEL_25:

LABEL_26:
          v18 = v32;
          v3 = v33;
          if (v16 == v17)
          {
LABEL_28:

            goto LABEL_29;
          }
LABEL_27:

          goto LABEL_28;
        }
        v30 = v22;
        v31 = v3;
      }
      -[TACLVisit detectionDate](self, "detectionDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[TACLVisit detectionDate](v6, "detectionDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23 != v24)
      {
        v28 = v20;
        -[TACLVisit detectionDate](self, "detectionDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[TACLVisit detectionDate](v6, "detectionDate");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v25;
        if (!objc_msgSend(v25, "isEqual:", v3))
        {
          v19 = 0;
          v20 = v28;
          goto LABEL_23;
        }
        v20 = v28;
      }
      v26 = -[TACLVisit confidence](self, "confidence");
      v19 = v26 == -[TACLVisit confidence](v6, "confidence");
      if (v23 == v24)
      {

        goto LABEL_24;
      }
LABEL_23:

LABEL_24:
      v22 = v30;
      v3 = v31;
      if (v20 == v21)
        goto LABEL_26;
      goto LABEL_25;
    }
    v19 = 0;
  }
LABEL_30:

  return v19;
}

- (id)descriptionDictionary
{
  void *v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t confidence;
  const __CFString *v15;
  void *v16;
  _QWORD v18[8];
  _QWORD v19[9];

  v19[8] = *MEMORY[0x24BDAC8D0];
  if (-[TACLVisit hasArrivalDate](self, "hasArrivalDate"))
  {
    -[TACLVisit arrivalDate](self, "arrivalDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getDateString");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = CFSTR("-");
  }
  if (-[TACLVisit hasDepartureDate](self, "hasDepartureDate"))
  {
    -[TACLVisit departureDate](self, "departureDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getDateString");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = CFSTR("-");
  }
  v18[0] = CFSTR("EventType");
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v8;
  v18[1] = CFSTR("Latitude");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_coordinate.latitude);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v9;
  v18[2] = CFSTR("Longitude");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_coordinate.longitude);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v10;
  v18[3] = CFSTR("HorizontalAccuracy");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_horizontalAccuracy);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v11;
  v19[4] = v4;
  v18[4] = CFSTR("ArrivalDate");
  v18[5] = CFSTR("DepartureDate");
  v19[5] = v6;
  v18[6] = CFSTR("Date");
  -[TACLVisit detectionDate](self, "detectionDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "getDateString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v13;
  v18[7] = CFSTR("Confidence");
  confidence = self->_confidence;
  if (confidence > 2)
    v15 = CFSTR("<invalid>");
  else
    v15 = off_24D8154F8[confidence];
  v19[7] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

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

  -[TACLVisit descriptionDictionary](self, "descriptionDictionary");
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

- (BOOL)hasArrivalDate
{
  void *v2;
  void *v3;
  char v4;

  -[TACLVisit arrivalDate](self, "arrivalDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3) ^ 1;

  return v4;
}

- (BOOL)hasDepartureDate
{
  void *v2;
  void *v3;
  char v4;

  -[TACLVisit departureDate](self, "departureDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3) ^ 1;

  return v4;
}

- (BOOL)isTemporalOrderSensical
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  -[TACLVisit arrivalDate](self, "arrivalDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TACLVisit departureDate](self, "departureDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "earlierDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TACLVisit detectionDate](self, "detectionDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "earlierDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TACLVisit arrivalDate](self, "arrivalDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  return v9;
}

- (NSDateInterval)dateInterval
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  _DWORD v13[2];
  __int16 v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (-[TACLVisit isTemporalOrderSensical](self, "isTemporalOrderSensical"))
  {
    v3 = objc_alloc(MEMORY[0x24BDD1508]);
    -[TACLVisit arrivalDate](self, "arrivalDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TACLVisit departureDate](self, "departureDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "initWithStartDate:endDate:", v4, v5);

  }
  else
  {
    v7 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      -[TACLVisit arrivalDate](self, "arrivalDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TACLVisit departureDate](self, "departureDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = 68289539;
      v13[1] = 0;
      v14 = 2082;
      v15 = "";
      v16 = 2113;
      v17 = v9;
      v18 = 2113;
      v19 = v10;
      _os_log_impl(&dword_217877000, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TACLVisit attempted to create dateInterval with nonsensical arrival and departure dates\", \"arrivalDate\":\"%{private}@\", \"departureDate\":\"%{private}@\"}", (uint8_t *)v13, 0x26u);

    }
    v11 = objc_alloc(MEMORY[0x24BDD1508]);
    -[TACLVisit arrivalDate](self, "arrivalDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v11, "initWithStartDate:duration:", v4, 0.0);
  }

  return (NSDateInterval *)v6;
}

- (NSDate)arrivalDate
{
  return self->_arrivalDate;
}

- (NSDate)departureDate
{
  return self->_departureDate;
}

- (NSDate)detectionDate
{
  return self->_detectionDate;
}

- (unint64_t)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectionDate, 0);
  objc_storeStrong((id *)&self->_departureDate, 0);
  objc_storeStrong((id *)&self->_arrivalDate, 0);
}

@end
