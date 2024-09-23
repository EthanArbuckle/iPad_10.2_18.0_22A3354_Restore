@implementation TASystemState

- (id)getDate
{
  return self->_date;
}

- (TASystemState)initWithSystemStateType:(unint64_t)a3 isOn:(BOOL)a4 date:(id)a5
{
  id v8;
  TASystemState *v9;
  TASystemState *v10;
  uint64_t v11;
  NSDate *date;
  TASystemState *v13;
  objc_super v15;

  v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TASystemState;
  v9 = -[TASystemState init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    if (!v8)
    {
      v13 = 0;
      goto LABEL_6;
    }
    v9->_systemStateType = a3;
    v9->_isOn = a4;
    v11 = objc_msgSend(v8, "copy");
    date = v10->_date;
    v10->_date = (NSDate *)v11;

  }
  v13 = v10;
LABEL_6:

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = -[TASystemState systemStateType](self, "systemStateType");
  v4 = -[TASystemState isOn](self, "isOn");
  -[TASystemState date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3 ^ objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  TASystemState *v4;
  TASystemState *v5;
  unint64_t v6;
  _BOOL4 v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (TASystemState *)a3;
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
      v6 = -[TASystemState systemStateType](self, "systemStateType");
      if (v6 == -[TASystemState systemStateType](v5, "systemStateType")
        && (v7 = -[TASystemState isOn](self, "isOn"), v7 == -[TASystemState isOn](v5, "isOn")))
      {
        -[TASystemState date](self, "date");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[TASystemState date](v5, "date");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9 == v10)
        {
          v8 = 1;
        }
        else
        {
          -[TASystemState date](self, "date");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[TASystemState date](v5, "date");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v11, "isEqual:", v12);

        }
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)descriptionDictionary
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("EventType");
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v11[1] = CFSTR("SystemStateType");
  TASystemStateTypeToString(self->_systemStateType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  v11[2] = CFSTR("IsOn");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isOn);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v6;
  v11[3] = CFSTR("Date");
  -[TASystemState date](self, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getDateString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
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

  -[TASystemState descriptionDictionary](self, "descriptionDictionary");
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
  return -[TASystemState initWithSystemStateType:isOn:date:]([TASystemState alloc], "initWithSystemStateType:isOn:date:", self->_systemStateType, self->_isOn, self->_date);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TASystemState)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  TASystemState *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SystemStateType"));
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsOn"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Date"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[TASystemState initWithSystemStateType:isOn:date:](self, "initWithSystemStateType:isOn:date:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t systemStateType;
  id v5;

  systemStateType = self->_systemStateType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", systemStateType, CFSTR("SystemStateType"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isOn, CFSTR("IsOn"));
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

- (unint64_t)getEventSubtype
{
  return self->_systemStateType;
}

- (unint64_t)systemStateType
{
  return self->_systemStateType;
}

- (BOOL)isOn
{
  return self->_isOn;
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
