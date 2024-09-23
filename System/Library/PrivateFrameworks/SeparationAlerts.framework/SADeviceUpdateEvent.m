@implementation SADeviceUpdateEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SADeviceUpdateEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  SADeviceUpdateEvent *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("SADeviceUpdateEventDevice"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SADeviceUpdateEventType"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SADeviceUpdateEventLast"));
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("SADeviceUpdateEventDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[SADeviceUpdateEvent initWithDevice:eventType:lastEvent:date:](self, "initWithDevice:eventType:lastEvent:date:", v5, v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SADeviceUpdateEvent device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SADeviceUpdateEventDevice"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[SADeviceUpdateEvent eventType](self, "eventType"), CFSTR("SADeviceUpdateEventType"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SADeviceUpdateEvent lastEvent](self, "lastEvent"), CFSTR("SADeviceUpdateEventLast"));
  -[SADeviceUpdateEvent date](self, "date");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("SADeviceUpdateEventDate"));

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
  SADeviceUpdateEvent *v4;
  void *v5;
  unint64_t v6;
  _BOOL8 v7;
  void *v8;
  SADeviceUpdateEvent *v9;

  v4 = +[SADeviceUpdateEvent allocWithZone:](SADeviceUpdateEvent, "allocWithZone:", a3);
  -[SADeviceUpdateEvent device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SADeviceUpdateEvent eventType](self, "eventType");
  v7 = -[SADeviceUpdateEvent lastEvent](self, "lastEvent");
  -[SADeviceUpdateEvent date](self, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SADeviceUpdateEvent initWithDevice:eventType:lastEvent:date:](v4, "initWithDevice:eventType:lastEvent:date:", v5, v6, v7, v8);

  return v9;
}

- (SADeviceUpdateEvent)initWithDevice:(id)a3 eventType:(unint64_t)a4 lastEvent:(BOOL)a5 date:(id)a6
{
  id v10;
  id v11;
  SADeviceUpdateEvent *v12;
  uint64_t v13;
  SADevice *device;
  uint64_t v15;
  NSDate *date;
  SADeviceUpdateEvent *v17;
  objc_super v19;

  v10 = a3;
  v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SADeviceUpdateEvent;
  v12 = -[SADeviceUpdateEvent init](&v19, sel_init);
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
      device = v12->_device;
      v12->_device = (SADevice *)v13;

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
  SADeviceUpdateEvent *v6;
  SADeviceUpdateEvent *v7;
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

  v6 = (SADeviceUpdateEvent *)a3;
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
      -[SADeviceUpdateEvent device](self, "device");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SADeviceUpdateEvent device](v7, "device");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == v9
        || (-[SADeviceUpdateEvent device](self, "device"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            -[SADeviceUpdateEvent device](v7, "device"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "isEqual:", v4)))
      {
        v11 = -[SADeviceUpdateEvent eventType](self, "eventType");
        if (v11 == -[SADeviceUpdateEvent eventType](v7, "eventType")
          && (v12 = -[SADeviceUpdateEvent lastEvent](self, "lastEvent"),
              v12 == -[SADeviceUpdateEvent lastEvent](v7, "lastEvent")))
        {
          -[SADeviceUpdateEvent date](self, "date");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[SADeviceUpdateEvent date](v7, "date");
          v15 = objc_claimAutoreleasedReturnValue();
          if (v14 == (void *)v15)
          {

            v10 = 1;
          }
          else
          {
            v16 = (void *)v15;
            -[SADeviceUpdateEvent date](self, "date");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[SADeviceUpdateEvent date](v7, "date");
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
  v14[1] = CFSTR("SADeviceUpdateEventDevice");
  -[SADeviceUpdateEvent device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[SADeviceUpdateEvent device](self, "device");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "description");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_1E83D18B8;
  }
  v15[1] = v7;
  v14[2] = CFSTR("SADeviceUpdateEventType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SADeviceUpdateEvent eventType](self, "eventType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v8;
  v14[3] = CFSTR("SADeviceUpdateEventLast");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SADeviceUpdateEvent lastEvent](self, "lastEvent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v9;
  v14[4] = CFSTR("SADeviceUpdateEventDate");
  -[SADeviceUpdateEvent date](self, "date");
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

  -[SADeviceUpdateEvent descriptionDictionary](self, "descriptionDictionary");
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

- (SADevice)device
{
  return self->_device;
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
  objc_storeStrong((id *)&self->_device, 0);
}

@end
