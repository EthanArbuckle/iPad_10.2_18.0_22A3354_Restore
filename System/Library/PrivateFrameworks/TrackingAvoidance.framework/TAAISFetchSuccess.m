@implementation TAAISFetchSuccess

- (TAAISFetchSuccess)initWithUUID:(id)a3 withAISInfo:(id)a4 successType:(unint64_t)a5 date:(id)a6
{
  id v10;
  id v11;
  id v12;
  TAAISFetchSuccess *v13;
  TAAISFetchSuccess *v14;
  uint64_t v15;
  NSUUID *uuid;
  uint64_t v17;
  TAAccessoryInformation *info;
  uint64_t v19;
  NSDate *date;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)TAAISFetchSuccess;
  v13 = -[TAAISFetchSuccess init](&v22, sel_init);
  if (!v13)
    goto LABEL_5;
  v14 = 0;
  if (v10 && v12)
  {
    v15 = objc_msgSend(v10, "copy");
    uuid = v13->_uuid;
    v13->_uuid = (NSUUID *)v15;

    v17 = objc_msgSend(v11, "copy");
    info = v13->_info;
    v13->_info = (TAAccessoryInformation *)v17;

    v13->_successType = a5;
    v19 = objc_msgSend(v12, "copy");
    date = v13->_date;
    v13->_date = (NSDate *)v19;

LABEL_5:
    v14 = v13;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  TAAISFetchSuccess *v6;
  TAAISFetchSuccess *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v6 = (TAAISFetchSuccess *)a3;
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
      -[TAAISFetchSuccess uuid](self, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAAISFetchSuccess uuid](v7, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[TAAISFetchSuccess uuid](self, "uuid");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAAISFetchSuccess uuid](v7, "uuid");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          v10 = 0;
          goto LABEL_21;
        }
      }
      -[TAAISFetchSuccess info](self, "info");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAAISFetchSuccess info](v7, "info");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v12)
      {
        -[TAAISFetchSuccess info](self, "info");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAAISFetchSuccess info](v7, "info");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:"))
        {
          v10 = 0;
          goto LABEL_19;
        }
        v24 = v13;
      }
      v14 = -[TAAISFetchSuccess successType](self, "successType");
      if (v14 == -[TAAISFetchSuccess successType](v7, "successType"))
      {
        v23 = v4;
        -[TAAISFetchSuccess date](self, "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAAISFetchSuccess date](v7, "date");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v15 == (void *)v16)
        {

          v10 = 1;
        }
        else
        {
          v17 = (void *)v16;
          -[TAAISFetchSuccess date](self, "date");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[TAAISFetchSuccess date](v7, "date");
          v22 = v3;
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v21, "isEqual:", v18);

          v3 = v22;
        }
        v19 = v11 == v12;
        v4 = v23;
      }
      else
      {
        v10 = 0;
        v19 = v11 == v12;
      }
      v13 = v24;
      if (v19)
      {
LABEL_20:

        if (v8 == v9)
        {
LABEL_22:

          goto LABEL_23;
        }
LABEL_21:

        goto LABEL_22;
      }
LABEL_19:

      goto LABEL_20;
    }
    v10 = 0;
  }
LABEL_23:

  return v10;
}

- (id)descriptionDictionary
{
  void *v2;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  _QWORD v16[6];

  v16[5] = *MEMORY[0x24BDAC8D0];
  v15[0] = CFSTR("EventType");
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  v15[1] = CFSTR("uuid");
  -[TAAISFetchSuccess uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v7;
  v15[2] = CFSTR("info");
  -[TAAISFetchSuccess info](self, "info");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[TAAISFetchSuccess info](self, "info");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "descriptionDictionary");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = &stru_24D815B48;
  }
  v16[2] = v9;
  v15[3] = CFSTR("type");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[TAAISFetchSuccess successType](self, "successType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v10;
  v15[4] = CFSTR("date");
  -[TAAISFetchSuccess date](self, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "getDateString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
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

  -[TAAISFetchSuccess descriptionDictionary](self, "descriptionDictionary");
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
  return -[TAAISFetchSuccess initWithUUID:withAISInfo:successType:date:]([TAAISFetchSuccess alloc], "initWithUUID:withAISInfo:successType:date:", self->_uuid, self->_info, self->_successType, self->_date);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAAISFetchSuccess)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  TAAISFetchSuccess *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("info"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[TAAISFetchSuccess initWithUUID:withAISInfo:successType:date:](self, "initWithUUID:withAISInfo:successType:date:", v5, v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *uuid;
  id v5;

  uuid = self->_uuid;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uuid, CFSTR("uuid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_info, CFSTR("info"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_successType, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_date, CFSTR("date"));

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

- (NSUUID)uuid
{
  return self->_uuid;
}

- (TAAccessoryInformation)info
{
  return self->_info;
}

- (unint64_t)successType
{
  return self->_successType;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
