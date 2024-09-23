@implementation TAPlaySoundSuccess

- (TAPlaySoundSuccess)initWithUUID:(id)a3 address:(id)a4 successType:(unint64_t)a5 date:(id)a6
{
  id v11;
  id v12;
  id v13;
  TAPlaySoundSuccess *v14;
  TAPlaySoundSuccess *v15;
  TAPlaySoundSuccess *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)TAPlaySoundSuccess;
  v14 = -[TAPlaySoundSuccess init](&v18, sel_init);
  v15 = v14;
  if (!v14)
    goto LABEL_6;
  v16 = 0;
  if (v11 && v12 && v13)
  {
    objc_storeStrong((id *)&v14->_uuid, a3);
    objc_storeStrong((id *)&v15->_address, a4);
    v15->_successType = a5;
    objc_storeStrong((id *)&v15->_date, a6);
LABEL_6:
    v16 = v15;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  TAPlaySoundSuccess *v6;
  TAPlaySoundSuccess *v7;
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

  v6 = (TAPlaySoundSuccess *)a3;
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
      -[TAPlaySoundSuccess uuid](self, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAPlaySoundSuccess uuid](v7, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[TAPlaySoundSuccess uuid](self, "uuid");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAPlaySoundSuccess uuid](v7, "uuid");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          v10 = 0;
          goto LABEL_21;
        }
      }
      -[TAPlaySoundSuccess address](self, "address");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAPlaySoundSuccess address](v7, "address");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v12)
      {
        -[TAPlaySoundSuccess address](self, "address");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAPlaySoundSuccess address](v7, "address");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:"))
        {
          v10 = 0;
          goto LABEL_19;
        }
        v24 = v13;
      }
      v14 = -[TAPlaySoundSuccess successType](self, "successType");
      if (v14 == -[TAPlaySoundSuccess successType](v7, "successType"))
      {
        v23 = v4;
        -[TAPlaySoundSuccess date](self, "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAPlaySoundSuccess date](v7, "date");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v15 == (void *)v16)
        {

          v10 = 1;
        }
        else
        {
          v17 = (void *)v16;
          -[TAPlaySoundSuccess date](self, "date");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[TAPlaySoundSuccess date](v7, "date");
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
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[6];

  v15[5] = *MEMORY[0x24BDAC8D0];
  v14[0] = CFSTR("EventType");
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  v14[1] = CFSTR("uuid");
  -[TAPlaySoundSuccess uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v6;
  v14[2] = CFSTR("add");
  -[TAPlaySoundSuccess address](self, "address");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hexString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v8;
  v14[3] = CFSTR("type");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[TAPlaySoundSuccess successType](self, "successType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v9;
  v14[4] = CFSTR("date");
  -[TAPlaySoundSuccess date](self, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getDateString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
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

  -[TAPlaySoundSuccess descriptionDictionary](self, "descriptionDictionary");
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
  return -[TAPlaySoundSuccess initWithUUID:address:successType:date:]([TAPlaySoundSuccess alloc], "initWithUUID:address:successType:date:", self->_uuid, self->_address, self->_successType, self->_date);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAPlaySoundSuccess)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  TAPlaySoundSuccess *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("add"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[TAPlaySoundSuccess initWithUUID:address:successType:date:](self, "initWithUUID:address:successType:date:", v5, v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *uuid;
  id v5;

  uuid = self->_uuid;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uuid, CFSTR("uuid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_address, CFSTR("add"));
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

- (NSData)address
{
  return self->_address;
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
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
