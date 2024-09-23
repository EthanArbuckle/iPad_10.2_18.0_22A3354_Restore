@implementation TAGeoNavigationNotification

- (TAGeoNavigationNotification)initWithTransportType:(unint64_t)a3 andNavigationState:(unint64_t)a4 date:(id)a5
{
  id v8;
  TAGeoNavigationNotification *v9;
  TAGeoNavigationNotification *v10;
  uint64_t v11;
  NSDate *date;
  TAGeoNavigationNotification *v13;
  objc_super v15;

  v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TAGeoNavigationNotification;
  v9 = -[TAGeoNavigationNotification init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    if (!v8)
    {
      v13 = 0;
      goto LABEL_6;
    }
    v9->_transportType = a3;
    v9->_navState = a4;
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
  unint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = -[TAGeoNavigationNotification transportType](self, "transportType");
  v4 = -[TAGeoNavigationNotification navState](self, "navState") ^ v3;
  -[TAGeoNavigationNotification date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  TAGeoNavigationNotification *v4;
  TAGeoNavigationNotification *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (TAGeoNavigationNotification *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[TAGeoNavigationNotification transportType](self, "transportType");
      if (v6 == -[TAGeoNavigationNotification transportType](v5, "transportType")
        && (v7 = -[TAGeoNavigationNotification navState](self, "navState"),
            v7 == -[TAGeoNavigationNotification navState](v5, "navState")))
      {
        -[TAGeoNavigationNotification date](self, "date");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAGeoNavigationNotification date](v5, "date");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 == v9)
        {
          v12 = 1;
        }
        else
        {
          -[TAGeoNavigationNotification date](self, "date");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[TAGeoNavigationNotification date](v5, "date");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isEqual:", v11);

        }
      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)descriptionDictionary
{
  objc_class *v3;
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x24BDAC8D0];
  v13[0] = CFSTR("EventType");
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  v13[1] = CFSTR("TransportType");
  v5 = -[TAGeoNavigationNotification transportType](self, "transportType");
  if (v5 > 6)
    v6 = CFSTR("<invalid>");
  else
    v6 = off_24D815418[v5];
  v14[1] = v6;
  v13[2] = CFSTR("NavState");
  v7 = -[TAGeoNavigationNotification navState](self, "navState");
  if (v7 > 2)
    v8 = CFSTR("<invalid>");
  else
    v8 = off_24D815450[v7];
  v14[2] = v8;
  v13[3] = CFSTR("Date");
  -[TAGeoNavigationNotification date](self, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getDateString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
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

  -[TAGeoNavigationNotification descriptionDictionary](self, "descriptionDictionary");
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

- (TAGeoNavigationNotification)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  TAGeoNavigationNotification *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("TransportType"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("NavState"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Date"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[TAGeoNavigationNotification initWithTransportType:andNavigationState:date:](self, "initWithTransportType:andNavigationState:date:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t transportType;
  id v5;

  transportType = self->_transportType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", transportType, CFSTR("TransportType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_navState, CFSTR("NavState"));
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
  return -[TAGeoNavigationNotification initWithTransportType:andNavigationState:date:]([TAGeoNavigationNotification alloc], "initWithTransportType:andNavigationState:date:", self->_transportType, self->_navState, self->_date);
}

- (id)getDate
{
  return self->_date;
}

- (NSDate)date
{
  return self->_date;
}

- (unint64_t)transportType
{
  return self->_transportType;
}

- (unint64_t)navState
{
  return self->_navState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
