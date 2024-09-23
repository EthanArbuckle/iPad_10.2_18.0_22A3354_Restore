@implementation TAUserActivity

- (TAUserActivity)initWithActivityType:(unint64_t)a3 date:(id)a4
{
  id v6;
  TAUserActivity *v7;
  TAUserActivity *v8;
  uint64_t v9;
  NSDate *date;
  TAUserActivity *v11;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TAUserActivity;
  v7 = -[TAUserActivity init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    if (!v6)
    {
      v11 = 0;
      goto LABEL_6;
    }
    v7->_activityType = a3;
    v9 = objc_msgSend(v6, "copy");
    date = v8->_date;
    v8->_date = (NSDate *)v9;

  }
  v11 = v8;
LABEL_6:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[TAUserActivity activityType](self, "activityType");
  -[TAUserActivity date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  TAUserActivity *v4;
  TAUserActivity *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (TAUserActivity *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[TAUserActivity activityType](self, "activityType");
      if (v6 == -[TAUserActivity activityType](v5, "activityType"))
      {
        -[TAUserActivity date](self, "date");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAUserActivity date](v5, "date");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7 == v8)
        {
          v11 = 1;
        }
        else
        {
          -[TAUserActivity date](self, "date");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[TAUserActivity date](v5, "date");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "isEqual:", v10);

        }
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)descriptionDictionary
{
  objc_class *v3;
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("EventType");
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v11[1] = CFSTR("ActivityType");
  v5 = self->_activityType - 1;
  if (v5 > 3)
    v6 = CFSTR("<unknown>");
  else
    v6 = off_24D8155F8[v5];
  v12[1] = v6;
  v11[2] = CFSTR("Date");
  -[TAUserActivity date](self, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getDateString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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

  -[TAUserActivity descriptionDictionary](self, "descriptionDictionary");
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
  return -[TAUserActivity initWithActivityType:date:]([TAUserActivity alloc], "initWithActivityType:date:", self->_activityType, self->_date);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAUserActivity)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  TAUserActivity *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ActivityType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[TAUserActivity initWithActivityType:date:](self, "initWithActivityType:date:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t activityType;
  id v5;

  activityType = self->_activityType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", activityType, CFSTR("ActivityType"));
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

- (unint64_t)activityType
{
  return self->_activityType;
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
