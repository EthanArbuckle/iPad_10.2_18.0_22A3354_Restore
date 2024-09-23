@implementation SASafeLocationsEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SASafeLocationsEvent)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SASafeLocationsEvent *v10;
  _QWORD v12[7];

  v12[6] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v12[2] = objc_opt_class();
  v12[3] = objc_opt_class();
  v12[4] = objc_opt_class();
  v12[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("kSASafeLocationsEventKeySafeLocations"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSASafeLocationsEventKeyDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[SASafeLocationsEvent initWithSafeLocations:date:](self, "initWithSafeLocations:date:", v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SASafeLocationsEvent safeLocations](self, "safeLocations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kSASafeLocationsEventKeySafeLocations"));

  -[SASafeLocationsEvent date](self, "date");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kSASafeLocationsEventKeyDate"));

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
  SASafeLocationsEvent *v4;
  void *v5;
  void *v6;
  SASafeLocationsEvent *v7;

  v4 = +[SASafeLocationsEvent allocWithZone:](SASafeLocationsEvent, "allocWithZone:", a3);
  -[SASafeLocationsEvent safeLocations](self, "safeLocations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASafeLocationsEvent date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SASafeLocationsEvent initWithSafeLocations:date:](v4, "initWithSafeLocations:date:", v5, v6);

  return v7;
}

- (SASafeLocationsEvent)initWithSafeLocations:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  SASafeLocationsEvent *v8;
  uint64_t v9;
  NSDictionary *safeLocations;
  uint64_t v11;
  NSDate *date;
  SASafeLocationsEvent *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SASafeLocationsEvent;
  v8 = -[SASafeLocationsEvent init](&v15, sel_init);
  if (v8)
  {
    if (!v7)
    {
      v13 = 0;
      goto LABEL_8;
    }
    if (v6)
    {
      v9 = objc_msgSend(v6, "copy");
      safeLocations = v8->_safeLocations;
      v8->_safeLocations = (NSDictionary *)v9;

    }
    v11 = objc_msgSend(v7, "copy");
    date = v8->_date;
    v8->_date = (NSDate *)v11;

  }
  v13 = v8;
LABEL_8:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SASafeLocationsEvent *v5;
  SASafeLocationsEvent *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v5 = (SASafeLocationsEvent *)a3;
  if (self == v5)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[SASafeLocationsEvent safeLocations](self, "safeLocations");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SASafeLocationsEvent safeLocations](v6, "safeLocations");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != v8)
      {
        -[SASafeLocationsEvent safeLocations](self, "safeLocations");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SASafeLocationsEvent safeLocations](v6, "safeLocations");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "isEqual:", v3))
        {
          v10 = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v16 = v9;
      }
      -[SASafeLocationsEvent date](self, "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SASafeLocationsEvent date](v6, "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v10 = 1;
      }
      else
      {
        -[SASafeLocationsEvent date](self, "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SASafeLocationsEvent date](v6, "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v13, "isEqual:", v14);

      }
      v9 = v16;
      if (v7 == v8)
        goto LABEL_14;
      goto LABEL_13;
    }
    v10 = 0;
  }
LABEL_15:

  return v10;
}

- (id)descriptionDictionary
{
  objc_class *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("EventType");
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("kSASafeLocationsEventKeySafeLocations");
  v10[0] = v4;
  -[SASafeLocationsEvent safeLocations](self, "safeLocations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SASafeLocationsEvent safeLocations](self, "safeLocations");
    self = (SASafeLocationsEvent *)objc_claimAutoreleasedReturnValue();
    -[SASafeLocationsEvent description](self, "description");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_1E83D18B8;
  }
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  return v7;
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

  -[SASafeLocationsEvent descriptionDictionary](self, "descriptionDictionary");
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
}

@end
