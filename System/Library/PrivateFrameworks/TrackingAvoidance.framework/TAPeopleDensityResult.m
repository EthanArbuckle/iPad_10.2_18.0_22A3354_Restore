@implementation TAPeopleDensityResult

- (TAPeopleDensityResult)initWithState:(int64_t)a3 confidence:(double)a4 observationInterval:(id)a5 additionalInfo:(id)a6 date:(id)a7
{
  id v12;
  id v13;
  id v14;
  TAPeopleDensityResult *v15;
  TAPeopleDensityResult *v16;
  TAPeopleDensityResult *v17;
  uint64_t v18;
  NSDateInterval *observationInterval;
  uint64_t v20;
  NSDate *date;
  uint64_t v22;
  NSDictionary *additionalInfo;
  objc_super v25;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  v25.receiver = self;
  v25.super_class = (Class)TAPeopleDensityResult;
  v15 = -[TAPeopleDensityResult init](&v25, sel_init);
  v16 = v15;
  if (!v15)
  {
LABEL_9:
    v17 = v16;
    goto LABEL_10;
  }
  v17 = 0;
  if (a4 >= 0.0 && v12 && v14)
  {
    v15->_peopleDensityState = a3;
    v15->_confidence = a4;
    v18 = objc_msgSend(v12, "copy");
    observationInterval = v16->_observationInterval;
    v16->_observationInterval = (NSDateInterval *)v18;

    v20 = objc_msgSend(v14, "copy");
    date = v16->_date;
    v16->_date = (NSDate *)v20;

    if (v13)
    {
      v22 = objc_msgSend(v13, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
      v22 = objc_claimAutoreleasedReturnValue();
    }
    additionalInfo = v16->_additionalInfo;
    v16->_additionalInfo = (NSDictionary *)v22;

    goto LABEL_9;
  }
LABEL_10:

  return v17;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  v3 = -[TAPeopleDensityResult peopleDensityState](self, "peopleDensityState");
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[TAPeopleDensityResult confidence](self, "confidence");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  -[TAPeopleDensityResult observationInterval](self, "observationInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v3 ^ objc_msgSend(v7, "hash");
  -[TAPeopleDensityResult additionalInfo](self, "additionalInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ objc_msgSend(v9, "hash");
  -[TAPeopleDensityResult date](self, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v6 ^ v10 ^ objc_msgSend(v11, "hash");

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  TAPeopleDensityResult *v6;
  TAPeopleDensityResult *v7;
  int64_t v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v6 = (TAPeopleDensityResult *)a3;
  if (self == v6)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      v8 = -[TAPeopleDensityResult peopleDensityState](self, "peopleDensityState");
      if (v8 != -[TAPeopleDensityResult peopleDensityState](v7, "peopleDensityState")
        || (-[TAPeopleDensityResult confidence](self, "confidence"),
            v10 = v9,
            -[TAPeopleDensityResult confidence](v7, "confidence"),
            v10 != v11))
      {
        v14 = 0;
LABEL_24:

        goto LABEL_25;
      }
      -[TAPeopleDensityResult observationInterval](self, "observationInterval");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAPeopleDensityResult observationInterval](v7, "observationInterval");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 != v13)
      {
        -[TAPeopleDensityResult observationInterval](self, "observationInterval");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAPeopleDensityResult observationInterval](v7, "observationInterval");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          v14 = 0;
          goto LABEL_22;
        }
      }
      -[TAPeopleDensityResult additionalInfo](self, "additionalInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAPeopleDensityResult additionalInfo](v7, "additionalInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15 == v16)
      {
        v29 = v15;
      }
      else
      {
        -[TAPeopleDensityResult additionalInfo](self, "additionalInfo");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAPeopleDensityResult additionalInfo](v7, "additionalInfo");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v17, "isEqual:"))
        {
          v14 = 0;
          goto LABEL_20;
        }
        v28 = v17;
        v29 = v15;
      }
      -[TAPeopleDensityResult date](self, "date");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[TAPeopleDensityResult date](v7, "date");
      v19 = objc_claimAutoreleasedReturnValue();
      if (v18 == (void *)v19)
      {

        v14 = 1;
      }
      else
      {
        v20 = (void *)v19;
        -[TAPeopleDensityResult date](self, "date");
        v27 = v3;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[TAPeopleDensityResult date](v7, "date");
        v26 = v4;
        v22 = v13;
        v23 = v12;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v21, "isEqual:", v24);

        v12 = v23;
        v13 = v22;
        v4 = v26;

        v3 = v27;
      }
      v17 = v28;
      v15 = v29;
      if (v29 == v16)
      {
LABEL_21:

        if (v12 == v13)
        {
LABEL_23:

          goto LABEL_24;
        }
LABEL_22:

        goto LABEL_23;
      }
LABEL_20:

      goto LABEL_21;
    }
    v14 = 0;
  }
LABEL_25:

  return v14;
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
  void *v13;
  _QWORD v15[6];
  _QWORD v16[7];

  v16[6] = *MEMORY[0x24BDAC8D0];
  v15[0] = CFSTR("EventType");
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v15[1] = CFSTR("PeopleDensityState");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[TAPeopleDensityResult peopleDensityState](self, "peopleDensityState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v5;
  v15[2] = CFSTR("Confidence");
  v6 = (void *)MEMORY[0x24BDD16E0];
  -[TAPeopleDensityResult confidence](self, "confidence");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v7;
  v15[3] = CFSTR("ObservationInterval");
  -[TAPeopleDensityResult observationInterval](self, "observationInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v9;
  v15[4] = CFSTR("AdditionalInfo");
  -[TAPeopleDensityResult additionalInfo](self, "additionalInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v10;
  v15[5] = CFSTR("Date");
  -[TAPeopleDensityResult date](self, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "getDateString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

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

  -[TAPeopleDensityResult descriptionDictionary](self, "descriptionDictionary");
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

- (TAPeopleDensityResult)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  TAPeopleDensityResult *v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PeopleDensityState"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("Confidence"));
  v7 = v6;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ObservationInterval"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AdditionalInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Date"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[TAPeopleDensityResult initWithState:confidence:observationInterval:additionalInfo:date:](self, "initWithState:confidence:observationInterval:additionalInfo:date:", v5, v8, v9, v10, v7);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t peopleDensityState;
  id v5;

  peopleDensityState = self->_peopleDensityState;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", peopleDensityState, CFSTR("PeopleDensityState"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("Confidence"), self->_confidence);
  objc_msgSend(v5, "encodeObject:forKey:", self->_observationInterval, CFSTR("ObservationInterval"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_additionalInfo, CFSTR("AdditionalInfo"));
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
  return -[TAPeopleDensityResult initWithState:confidence:observationInterval:additionalInfo:date:](+[TAPeopleDensityResult allocWithZone:](TAPeopleDensityResult, "allocWithZone:", a3), "initWithState:confidence:observationInterval:additionalInfo:date:", self->_peopleDensityState, self->_observationInterval, self->_additionalInfo, self->_date, self->_confidence);
}

- (id)getDate
{
  return self->_date;
}

- (int64_t)peopleDensityState
{
  return self->_peopleDensityState;
}

- (double)confidence
{
  return self->_confidence;
}

- (NSDateInterval)observationInterval
{
  return self->_observationInterval;
}

- (NSDictionary)additionalInfo
{
  return self->_additionalInfo;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_additionalInfo, 0);
  objc_storeStrong((id *)&self->_observationInterval, 0);
}

@end
