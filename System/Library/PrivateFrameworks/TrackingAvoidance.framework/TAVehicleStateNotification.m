@implementation TAVehicleStateNotification

- (id)getDate
{
  return self->_date;
}

- (TAVehicleStateNotification)initWithVehicularState:(unint64_t)a3 andVehicularHints:(unint64_t)a4 andOperatorState:(unint64_t)a5 date:(id)a6
{
  id v10;
  TAVehicleStateNotification *v11;
  TAVehicleStateNotification *v12;
  uint64_t v13;
  NSDate *date;
  TAVehicleStateNotification *v15;
  objc_super v17;

  v10 = a6;
  v17.receiver = self;
  v17.super_class = (Class)TAVehicleStateNotification;
  v11 = -[TAVehicleStateNotification init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    if (!v10)
    {
      v15 = 0;
      goto LABEL_6;
    }
    v11->_vehicularHints = a4;
    v11->_operatorState = a5;
    v11->_vehicularState = a3;
    v13 = objc_msgSend(v10, "copy");
    date = v12->_date;
    v12->_date = (NSDate *)v13;

  }
  v15 = v12;
LABEL_6:

  return v15;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[TAVehicleStateNotification vehicularState](self, "vehicularState");
  v4 = -[TAVehicleStateNotification vehicularHints](self, "vehicularHints") ^ v3;
  v5 = v4 ^ -[TAVehicleStateNotification operatorState](self, "operatorState");
  -[TAVehicleStateNotification date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  TAVehicleStateNotification *v4;
  TAVehicleStateNotification *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (TAVehicleStateNotification *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[TAVehicleStateNotification vehicularState](self, "vehicularState");
      if (v6 == -[TAVehicleStateNotification vehicularState](v5, "vehicularState")
        && (v7 = -[TAVehicleStateNotification vehicularHints](self, "vehicularHints"),
            v7 == -[TAVehicleStateNotification vehicularHints](v5, "vehicularHints"))
        && (v8 = -[TAVehicleStateNotification operatorState](self, "operatorState"),
            v8 == -[TAVehicleStateNotification operatorState](v5, "operatorState")))
      {
        -[TAVehicleStateNotification date](self, "date");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAVehicleStateNotification date](v5, "date");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9 == v10)
        {
          v13 = 1;
        }
        else
        {
          -[TAVehicleStateNotification date](self, "date");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[TAVehicleStateNotification date](v5, "date");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqual:", v12);

        }
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
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
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[10];
  _QWORD v20[12];

  v20[10] = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v4;
  v5 = -[TAVehicleStateNotification vehicularState](self, "vehicularState", CFSTR("EventType"), CFSTR("VehicularState"));
  if (v5 > 2)
    v6 = CFSTR("Invalid");
  else
    v6 = off_24D8153A8[v5];
  v20[1] = v6;
  v19[2] = CFSTR("VehicularHints");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[TAVehicleStateNotification vehicularHints](self, "vehicularHints"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v7;
  v19[3] = CFSTR("MotionHint");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[TAVehicleStateNotification vehicularHints](self, "vehicularHints") & 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v8;
  v19[4] = CFSTR("GPSHint");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (-[TAVehicleStateNotification vehicularHints](self, "vehicularHints") >> 1) & 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v9;
  v19[5] = CFSTR("BasebandHint");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (-[TAVehicleStateNotification vehicularHints](self, "vehicularHints") >> 2) & 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v10;
  v19[6] = CFSTR("WifiHint");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (-[TAVehicleStateNotification vehicularHints](self, "vehicularHints") >> 3) & 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[6] = v11;
  v19[7] = CFSTR("BTHint");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (-[TAVehicleStateNotification vehicularHints](self, "vehicularHints") >> 4) & 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[7] = v12;
  v19[8] = CFSTR("OperatorState");
  v13 = -[TAVehicleStateNotification operatorState](self, "operatorState");
  if (v13 > 2)
    v14 = CFSTR("Invalid");
  else
    v14 = off_24D8153C0[v13];
  v20[8] = v14;
  v19[9] = CFSTR("Date");
  -[TAVehicleStateNotification date](self, "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "getDateString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[9] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
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

  -[TAVehicleStateNotification descriptionDictionary](self, "descriptionDictionary");
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

- (TAVehicleStateNotification)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  TAVehicleStateNotification *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("VehicularState"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("VehicularHints"));
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("OperatorState"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[TAVehicleStateNotification initWithVehicularState:andVehicularHints:andOperatorState:date:](self, "initWithVehicularState:andVehicularHints:andOperatorState:date:", v5, v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t vehicularState;
  id v5;

  vehicularState = self->_vehicularState;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", vehicularState, CFSTR("VehicularState"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_vehicularHints, CFSTR("VehicularHints"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_operatorState, CFSTR("OperatorState"));
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
  return -[TAVehicleStateNotification initWithVehicularState:andVehicularHints:andOperatorState:date:]([TAVehicleStateNotification alloc], "initWithVehicularState:andVehicularHints:andOperatorState:date:", self->_vehicularState, self->_vehicularHints, self->_operatorState, self->_date);
}

- (NSDate)date
{
  return self->_date;
}

- (unint64_t)vehicularState
{
  return self->_vehicularState;
}

- (unint64_t)vehicularHints
{
  return self->_vehicularHints;
}

- (unint64_t)operatorState
{
  return self->_operatorState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
