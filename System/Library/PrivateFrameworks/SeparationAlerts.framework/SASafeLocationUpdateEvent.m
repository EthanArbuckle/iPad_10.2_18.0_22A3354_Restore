@implementation SASafeLocationUpdateEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SASafeLocationUpdateEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  SASafeLocationUpdateEvent *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("SASafeLocationUpdateEventSafeLocation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SASafeLocationUpdateEventType"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SASafeLocationUpdateEventLast"));
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("SASafeLocationUpdateEventDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[SASafeLocationUpdateEvent initWithSafeLocation:eventType:lastEvent:date:](self, "initWithSafeLocation:eventType:lastEvent:date:", v5, v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SASafeLocationUpdateEvent safeLocation](self, "safeLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SASafeLocationUpdateEventSafeLocation"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[SASafeLocationUpdateEvent eventType](self, "eventType"), CFSTR("SASafeLocationUpdateEventType"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SASafeLocationUpdateEvent lastEvent](self, "lastEvent"), CFSTR("SASafeLocationUpdateEventLast"));
  -[SASafeLocationUpdateEvent date](self, "date");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("SASafeLocationUpdateEventDate"));

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
  SASafeLocationUpdateEvent *v4;
  void *v5;
  unint64_t v6;
  _BOOL8 v7;
  void *v8;
  SASafeLocationUpdateEvent *v9;

  v4 = +[SASafeLocationUpdateEvent allocWithZone:](SASafeLocationUpdateEvent, "allocWithZone:", a3);
  -[SASafeLocationUpdateEvent safeLocation](self, "safeLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SASafeLocationUpdateEvent eventType](self, "eventType");
  v7 = -[SASafeLocationUpdateEvent lastEvent](self, "lastEvent");
  -[SASafeLocationUpdateEvent date](self, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SASafeLocationUpdateEvent initWithSafeLocation:eventType:lastEvent:date:](v4, "initWithSafeLocation:eventType:lastEvent:date:", v5, v6, v7, v8);

  return v9;
}

- (SASafeLocationUpdateEvent)initWithSafeLocation:(id)a3 eventType:(unint64_t)a4 lastEvent:(BOOL)a5 date:(id)a6
{
  id v10;
  id v11;
  SASafeLocationUpdateEvent *v12;
  uint64_t v13;
  SASafeLocation *safeLocation;
  uint64_t v15;
  NSDate *date;
  SASafeLocationUpdateEvent *v17;
  objc_super v19;

  v10 = a3;
  v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SASafeLocationUpdateEvent;
  v12 = -[SASafeLocationUpdateEvent init](&v19, sel_init);
  if (v12)
  {
    if (!v11)
    {
      v17 = 0;
      goto LABEL_8;
    }
    if (v10)
    {
      v13 = objc_msgSend(v10, "copy");
      safeLocation = v12->_safeLocation;
      v12->_safeLocation = (SASafeLocation *)v13;

    }
    v12->_eventType = a4;
    v12->_lastEvent = a5;
    v15 = objc_msgSend(v11, "copy");
    date = v12->_date;
    v12->_date = (NSDate *)v15;

  }
  v17 = v12;
LABEL_8:

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  SASafeLocationUpdateEvent *v6;
  SASafeLocationUpdateEvent *v7;
  void *v8;
  void *v9;
  char v10;
  unint64_t v11;
  _BOOL4 v12;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = (SASafeLocationUpdateEvent *)a3;
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
      -[SASafeLocationUpdateEvent safeLocation](self, "safeLocation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SASafeLocationUpdateEvent safeLocation](v7, "safeLocation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == v9
        || (-[SASafeLocationUpdateEvent safeLocation](self, "safeLocation"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            -[SASafeLocationUpdateEvent safeLocation](v7, "safeLocation"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "isEqual:", v4)))
      {
        v11 = -[SASafeLocationUpdateEvent eventType](self, "eventType");
        if (v11 == -[SASafeLocationUpdateEvent eventType](v7, "eventType")
          && (v12 = -[SASafeLocationUpdateEvent lastEvent](self, "lastEvent"),
              v12 == -[SASafeLocationUpdateEvent lastEvent](v7, "lastEvent")))
        {
          -[SASafeLocationUpdateEvent date](self, "date");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[SASafeLocationUpdateEvent date](v7, "date");
          v15 = objc_claimAutoreleasedReturnValue();
          if (v14 == (void *)v15)
          {

            v10 = 1;
          }
          else
          {
            v16 = (void *)v15;
            -[SASafeLocationUpdateEvent date](self, "date");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[SASafeLocationUpdateEvent date](v7, "date");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v18, "isEqual:", v17);

          }
        }
        else
        {
          v10 = 0;
        }
        if (v8 == v9)
          goto LABEL_13;
      }
      else
      {
        v10 = 0;
      }

LABEL_13:
      goto LABEL_14;
    }
    v10 = 0;
  }
LABEL_14:

  return v10;
}

- (id)descriptionDictionary
{
  void *v2;
  objc_class *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("EventType");
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  v14[1] = CFSTR("SASafeLocationUpdateEventSafeLocation");
  -[SASafeLocationUpdateEvent safeLocation](self, "safeLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[SASafeLocationUpdateEvent safeLocation](self, "safeLocation");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "description");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_1E83D18B8;
  }
  v15[1] = v7;
  v14[2] = CFSTR("SASafeLocationUpdateEventType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SASafeLocationUpdateEvent eventType](self, "eventType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v8;
  v14[3] = CFSTR("SASafeLocationUpdateEventLast");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SASafeLocationUpdateEvent lastEvent](self, "lastEvent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v9;
  v14[4] = CFSTR("SASafeLocationUpdateEventDate");
  -[SASafeLocationUpdateEvent date](self, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getDateString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {

  }
  return v12;
}

- (NSString)description
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v9;

  -[SASafeLocationUpdateEvent descriptionDictionary](self, "descriptionDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONStringFromNSDictionary:error:", v2, &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  if (v4)
  {
    v5 = (void *)TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR))
      -[SASafeLocationUpdateEvent description].cold.1(v5);
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v3;
  }
  v7 = v6;

  return (NSString *)v7;
}

- (id)getDate
{
  return self->_date;
}

- (SASafeLocation)safeLocation
{
  return self->_safeLocation;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (BOOL)lastEvent
{
  return self->_lastEvent;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_safeLocation, 0);
}

- (void)description
{
  void *v1;
  id v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = a1;
  v3 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CA04F000, v5, v6, "%@ instance failed to create description:%@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1();
}

@end
