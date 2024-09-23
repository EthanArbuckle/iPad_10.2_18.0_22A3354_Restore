@implementation SADevicesWithSafeLocationsEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SADevicesWithSafeLocationsEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SADevicesWithSafeLocationsEvent *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("kSADevicesWithSafeLocationsEventKeyDevices"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("kSADevicesWithSafeLocationsEventKeySafeLocationIDs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("kSADevicesWithSafeLocationsEventKeyDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SADevicesWithSafeLocationsEvent initWithDevices:safeLocationUUIDs:date:](self, "initWithDevices:safeLocationUUIDs:date:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SADevicesWithSafeLocationsEvent devices](self, "devices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kSADevicesWithSafeLocationsEventKeyDevices"));

  -[SADevicesWithSafeLocationsEvent safeLocations](self, "safeLocations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kSADevicesWithSafeLocationsEventKeySafeLocationIDs"));

  -[SADevicesWithSafeLocationsEvent date](self, "date");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kSADevicesWithSafeLocationsEventKeyDate"));

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
  SADevicesWithSafeLocationsEvent *v4;
  void *v5;
  void *v6;
  void *v7;
  SADevicesWithSafeLocationsEvent *v8;

  v4 = +[SADevicesWithSafeLocationsEvent allocWithZone:](SADevicesWithSafeLocationsEvent, "allocWithZone:", a3);
  -[SADevicesWithSafeLocationsEvent devices](self, "devices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SADevicesWithSafeLocationsEvent safeLocations](self, "safeLocations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SADevicesWithSafeLocationsEvent date](self, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SADevicesWithSafeLocationsEvent initWithDevices:safeLocationUUIDs:date:](v4, "initWithDevices:safeLocationUUIDs:date:", v5, v6, v7);

  return v8;
}

- (SADevicesWithSafeLocationsEvent)initWithDevices:(id)a3 safeLocationUUIDs:(id)a4 date:(id)a5
{
  id v8;
  id v9;
  id v10;
  SADevicesWithSafeLocationsEvent *v11;
  uint64_t v12;
  NSDictionary *devices;
  uint64_t v14;
  NSDictionary *safeLocations;
  uint64_t v16;
  NSDate *date;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SADevicesWithSafeLocationsEvent;
  v11 = -[SADevicesWithSafeLocationsEvent init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    devices = v11->_devices;
    v11->_devices = (NSDictionary *)v12;

    v14 = objc_msgSend(v9, "copy");
    safeLocations = v11->_safeLocations;
    v11->_safeLocations = (NSDictionary *)v14;

    v16 = objc_msgSend(v10, "copy");
    date = v11->_date;
    v11->_date = (NSDate *)v16;

  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  SADevicesWithSafeLocationsEvent *v6;
  SADevicesWithSafeLocationsEvent *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v6 = (SADevicesWithSafeLocationsEvent *)a3;
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
      -[SADevicesWithSafeLocationsEvent devices](self, "devices");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SADevicesWithSafeLocationsEvent devices](v7, "devices");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[SADevicesWithSafeLocationsEvent devices](self, "devices");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[SADevicesWithSafeLocationsEvent devices](v7, "devices");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          v10 = 0;
          goto LABEL_19;
        }
      }
      -[SADevicesWithSafeLocationsEvent safeLocations](self, "safeLocations");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SADevicesWithSafeLocationsEvent safeLocations](v7, "safeLocations");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v25 = v11;
      }
      else
      {
        -[SADevicesWithSafeLocationsEvent safeLocations](self, "safeLocations");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SADevicesWithSafeLocationsEvent safeLocations](v7, "safeLocations");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:"))
        {
          v10 = 0;
          goto LABEL_17;
        }
        v24 = v13;
        v25 = v11;
      }
      -[SADevicesWithSafeLocationsEvent date](self, "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SADevicesWithSafeLocationsEvent date](v7, "date");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

        v10 = 1;
      }
      else
      {
        v16 = (void *)v15;
        -[SADevicesWithSafeLocationsEvent date](self, "date");
        v23 = v3;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SADevicesWithSafeLocationsEvent date](v7, "date");
        v22 = v4;
        v18 = v9;
        v19 = v8;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v17, "isEqual:", v20);

        v8 = v19;
        v9 = v18;
        v4 = v22;

        v3 = v23;
      }
      v13 = v24;
      v11 = v25;
      if (v25 == v12)
      {
LABEL_18:

        if (v8 == v9)
        {
LABEL_20:

          goto LABEL_21;
        }
LABEL_19:

        goto LABEL_20;
      }
LABEL_17:

      goto LABEL_18;
    }
    v10 = 0;
  }
LABEL_21:

  return v10;
}

- (id)descriptionDictionary
{
  void *v2;
  void *v3;
  objc_class *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("EventType");
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  v15[1] = CFSTR("kSADevicesWithSafeLocationsEventKeyDevices");
  -[SADevicesWithSafeLocationsEvent devices](self, "devices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SADevicesWithSafeLocationsEvent devices](self, "devices");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "description");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &stru_1E83D18B8;
  }
  v16[1] = v8;
  v15[2] = CFSTR("kSADevicesWithSafeLocationsEventKeySafeLocationIDs");
  -[SADevicesWithSafeLocationsEvent safeLocations](self, "safeLocations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[SADevicesWithSafeLocationsEvent safeLocations](self, "safeLocations");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "description");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = &stru_1E83D18B8;
  }
  v16[2] = v10;
  v15[3] = CFSTR("kSADevicesWithSafeLocationsEventKeyDate");
  -[SADevicesWithSafeLocationsEvent date](self, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "getDateString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {

  }
  if (v7)
  {

  }
  return v13;
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

  -[SADevicesWithSafeLocationsEvent descriptionDictionary](self, "descriptionDictionary");
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

- (NSDictionary)devices
{
  return self->_devices;
}

- (NSDictionary)safeLocations
{
  return self->_safeLocations;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_safeLocations, 0);
  objc_storeStrong((id *)&self->_devices, 0);
}

@end
