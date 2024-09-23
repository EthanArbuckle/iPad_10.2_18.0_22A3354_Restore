@implementation TAAggressiveScanState

- (id)getDate
{
  return self->_date;
}

- (TAAggressiveScanState)initWithState:(unint64_t)a3 date:(id)a4
{
  id v6;
  TAAggressiveScanState *v7;
  TAAggressiveScanState *v8;
  uint64_t v9;
  NSDate *date;
  TAAggressiveScanState *v11;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TAAggressiveScanState;
  v7 = -[TAAggressiveScanState init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    if (!v6)
    {
      v11 = 0;
      goto LABEL_6;
    }
    v7->_state = a3;
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
  void *v2;
  unint64_t v3;

  -[TAAggressiveScanState date](self, "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  TAAggressiveScanState *v6;
  TAAggressiveScanState *v7;
  void *v8;
  void *v9;
  BOOL v10;
  unint64_t v11;

  v6 = (TAAggressiveScanState *)a3;
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
      -[TAAggressiveScanState date](self, "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAAggressiveScanState date](v7, "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == v9
        || (-[TAAggressiveScanState date](self, "date"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            -[TAAggressiveScanState date](v7, "date"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "isEqual:", v4)))
      {
        v11 = -[TAAggressiveScanState state](self, "state");
        v10 = v11 == -[TAAggressiveScanState state](v7, "state");
        if (v8 == v9)
        {
LABEL_10:

          goto LABEL_11;
        }
      }
      else
      {
        v10 = 0;
      }

      goto LABEL_10;
    }
    v10 = 0;
  }
LABEL_11:

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
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("EventType");
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v10[1] = CFSTR("Date");
  -[TAAggressiveScanState date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getDateString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  v10[2] = CFSTR("State");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[TAAggressiveScanState state](self, "state"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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

  -[TAAggressiveScanState descriptionDictionary](self, "descriptionDictionary");
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAAggressiveScanState)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  TAAggressiveScanState *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("State"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[TAAggressiveScanState initWithState:date:](self, "initWithState:date:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t state;
  id v5;

  state = self->_state;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", state, CFSTR("State"));
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

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TAAggressiveScanState initWithState:date:]([TAAggressiveScanState alloc], "initWithState:date:", self->_state, self->_date);
}

- (unint64_t)state
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
}

@end
