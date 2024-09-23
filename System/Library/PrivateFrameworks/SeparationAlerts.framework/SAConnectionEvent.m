@implementation SAConnectionEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SAConnectionEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  SAConnectionEvent *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SAConnectionEventIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SAConnectionEventState"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SAConnectionEventDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SAConnectionEvent initWithDeviceUUID:state:date:](self, "initWithDeviceUUID:state:date:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SAConnectionEvent identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SAConnectionEventIdentifier"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[SAConnectionEvent state](self, "state"), CFSTR("SAConnectionEventState"));
  -[SAConnectionEvent date](self, "date");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("SAConnectionEventDate"));

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
  SAConnectionEvent *v4;
  void *v5;
  int64_t v6;
  void *v7;
  SAConnectionEvent *v8;

  v4 = +[SAConnectionEvent allocWithZone:](SAConnectionEvent, "allocWithZone:", a3);
  -[SAConnectionEvent identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SAConnectionEvent state](self, "state");
  -[SAConnectionEvent date](self, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SAConnectionEvent initWithDeviceUUID:state:date:](v4, "initWithDeviceUUID:state:date:", v5, v6, v7);

  return v8;
}

- (SAConnectionEvent)initWithDeviceUUID:(id)a3 state:(int64_t)a4 date:(id)a5
{
  id v8;
  id v9;
  SAConnectionEvent *v10;
  SAConnectionEvent *v11;
  uint64_t v12;
  NSUUID *identifier;
  uint64_t v14;
  NSDate *date;
  objc_super v17;

  v8 = a3;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SAConnectionEvent;
  v10 = -[SAConnectionEvent init](&v17, sel_init);
  if (!v10)
    goto LABEL_5;
  v11 = 0;
  if (v8 && v9)
  {
    v12 = objc_msgSend(v8, "copy");
    identifier = v10->_identifier;
    v10->_identifier = (NSUUID *)v12;

    v10->_state = a4;
    v14 = objc_msgSend(v9, "copy");
    date = v10->_date;
    v10->_date = (NSDate *)v14;

LABEL_5:
    v11 = v10;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  SAConnectionEvent *v6;
  SAConnectionEvent *v7;
  void *v8;
  void *v9;
  char v10;
  int64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;

  v6 = (SAConnectionEvent *)a3;
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
      -[SAConnectionEvent identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SAConnectionEvent identifier](v7, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == v9
        || (-[SAConnectionEvent identifier](self, "identifier"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            -[SAConnectionEvent identifier](v7, "identifier"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "isEqual:", v4)))
      {
        v11 = -[SAConnectionEvent state](self, "state");
        if (v11 == -[SAConnectionEvent state](v7, "state"))
        {
          -[SAConnectionEvent date](self, "date");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[SAConnectionEvent date](v7, "date");
          v13 = objc_claimAutoreleasedReturnValue();
          if (v12 == (void *)v13)
          {

            v10 = 1;
          }
          else
          {
            v14 = (void *)v13;
            -[SAConnectionEvent date](self, "date");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[SAConnectionEvent date](v7, "date");
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
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("EventType");
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("SAConnectionEventIdentifier");
  -[SAConnectionEvent identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v12[2] = CFSTR("SAConnectionEventState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SAConnectionEvent state](self, "state"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v7;
  v12[3] = CFSTR("SAConnectionEventDate");
  -[SAConnectionEvent date](self, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getDateString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
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

  -[SAConnectionEvent descriptionDictionary](self, "descriptionDictionary");
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
  return self->_date;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (int64_t)state
{
  return self->_state;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)description
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a1;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a3;
  _os_log_error_impl(&dword_1CA04F000, v4, OS_LOG_TYPE_ERROR, "%@ instance failed to create description:%@", (uint8_t *)&v7, 0x16u);

}

@end
