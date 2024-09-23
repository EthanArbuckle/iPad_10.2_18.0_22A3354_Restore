@implementation SAGeofenceEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SAGeofenceEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  SAGeofenceEvent *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GeofenceEventRegion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("GeofenceEventType"));
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("GeofenceEventDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SAGeofenceEvent initWithRegion:eventType:eventDate:](self, "initWithRegion:eventType:eventDate:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SAGeofenceEvent region](self, "region");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("GeofenceEventRegion"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[SAGeofenceEvent eventType](self, "eventType"), CFSTR("GeofenceEventType"));
  -[SAGeofenceEvent eventDate](self, "eventDate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("GeofenceEventDate"));

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
  SAGeofenceEvent *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  SAGeofenceEvent *v8;

  v4 = +[SAGeofenceEvent allocWithZone:](SAGeofenceEvent, "allocWithZone:", a3);
  -[SAGeofenceEvent region](self, "region");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SAGeofenceEvent eventType](self, "eventType");
  -[SAGeofenceEvent eventDate](self, "eventDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SAGeofenceEvent initWithRegion:eventType:eventDate:](v4, "initWithRegion:eventType:eventDate:", v5, v6, v7);

  return v8;
}

- (SAGeofenceEvent)initWithRegion:(id)a3 eventType:(unint64_t)a4 eventDate:(id)a5
{
  id v8;
  id v9;
  SAGeofenceEvent *v10;
  SAGeofenceEvent *v11;
  uint64_t v12;
  CLRegion *region;
  uint64_t v14;
  NSDate *eventDate;
  objc_super v17;

  v8 = a3;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SAGeofenceEvent;
  v10 = -[SAGeofenceEvent init](&v17, sel_init);
  if (!v10)
    goto LABEL_5;
  v11 = 0;
  if (v8 && v9)
  {
    v12 = objc_msgSend(v8, "copy");
    region = v10->_region;
    v10->_region = (CLRegion *)v12;

    v10->_eventType = a4;
    v14 = objc_msgSend(v9, "copy");
    eventDate = v10->_eventDate;
    v10->_eventDate = (NSDate *)v14;

LABEL_5:
    v11 = v10;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  SAGeofenceEvent *v6;
  SAGeofenceEvent *v7;
  void *v8;
  void *v9;
  char v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;

  v6 = (SAGeofenceEvent *)a3;
  if (self == v6)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      -[SAGeofenceEvent region](self, "region");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SAGeofenceEvent region](v7, "region");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == v9
        || (-[SAGeofenceEvent region](self, "region"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            -[SAGeofenceEvent region](v7, "region"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "isEqual:", v4)))
      {
        v11 = -[SAGeofenceEvent eventType](self, "eventType");
        if (v11 == -[SAGeofenceEvent eventType](v7, "eventType"))
        {
          -[SAGeofenceEvent eventDate](self, "eventDate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[SAGeofenceEvent eventDate](v7, "eventDate");
          v13 = objc_claimAutoreleasedReturnValue();
          if (v12 == (void *)v13)
          {

            v10 = 1;
          }
          else
          {
            v14 = (void *)v13;
            -[SAGeofenceEvent eventDate](self, "eventDate");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[SAGeofenceEvent eventDate](v7, "eventDate");
            v18 = v3;
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v15, "isEqual:", v16);

            v3 = v18;
          }
        }
        else
        {
          v10 = 0;
        }
        if (v8 == v9)
          goto LABEL_15;
      }
      else
      {
        v10 = 0;
      }

LABEL_15:
      goto LABEL_16;
    }
    v10 = 0;
  }
LABEL_16:

  return v10;
}

- (id)descriptionDictionary
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("EventType");
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  v13[1] = CFSTR("GeofenceEventDate");
  -[SAGeofenceEvent eventDate](self, "eventDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getDateString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  v13[2] = CFSTR("GeofenceEventType");
  v7 = -[SAGeofenceEvent eventType](self, "eventType");
  if (v7 > 6)
    v8 = CFSTR("<invalid>");
  else
    v8 = off_1E83D1058[v7];
  v14[2] = v8;
  v13[3] = CFSTR("GeofenceEventRegion");
  -[SAGeofenceEvent region](self, "region");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
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

  -[SAGeofenceEvent descriptionDictionary](self, "descriptionDictionary");
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
  return self->_eventDate;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (CLRegion)region
{
  return self->_region;
}

- (NSDate)eventDate
{
  return self->_eventDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDate, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

@end
