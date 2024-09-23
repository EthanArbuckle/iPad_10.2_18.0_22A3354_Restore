@implementation SMSessionDestinationEta

- (SMSessionDestinationEta)initWithExpectedTravelTime:(double)a3 additionalTravelTime:(double)a4 transportType:(unint64_t)a5
{
  SMSessionDestinationEta *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SMSessionDestinationEta;
  result = -[SMSessionDestinationEta init](&v9, sel_init);
  if (result)
  {
    result->_expectedTravelTime = a3;
    result->_additionalTravelTime = a4;
    result->_transportType = a5;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  -[SMSessionDestinationEta expectedTravelTime](self, "expectedTravelTime");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("__kSMSessionDestinationEtaExpectedTravelTimeKey"));
  -[SMSessionDestinationEta additionalTravelTime](self, "additionalTravelTime");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("__kSMSessionDestinationEtaAdditionalTravelTimeKey"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SMSessionDestinationEta transportType](self, "transportType"), CFSTR("__kSMSessionDestinationEtaTransportTypeKey"));

}

- (SMSessionDestinationEta)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int v9;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("__kSMSessionDestinationEtaExpectedTravelTimeKey"));
  v6 = v5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("__kSMSessionDestinationEtaAdditionalTravelTimeKey"));
  v8 = v7;
  v9 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("__kSMSessionDestinationEtaTransportTypeKey"));

  return -[SMSessionDestinationEta initWithExpectedTravelTime:additionalTravelTime:transportType:](self, "initWithExpectedTravelTime:additionalTravelTime:transportType:", v9, v6, v8);
}

- (unint64_t)hash
{
  double v3;
  uint64_t v4;
  double v5;

  -[SMSessionDestinationEta expectedTravelTime](self, "expectedTravelTime");
  v4 = (uint64_t)v3;
  -[SMSessionDestinationEta additionalTravelTime](self, "additionalTravelTime");
  return (uint64_t)v5 ^ v4 ^ -[SMSessionDestinationEta transportType](self, "transportType");
}

- (BOOL)isEqual:(id)a3
{
  SMSessionDestinationEta *v4;
  SMSessionDestinationEta *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  unint64_t v18;
  BOOL v19;

  v4 = (SMSessionDestinationEta *)a3;
  if (self == v4)
  {
    v19 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SMSessionDestinationEta expectedTravelTime](self, "expectedTravelTime");
      v7 = v6;
      -[SMSessionDestinationEta expectedTravelTime](v5, "expectedTravelTime");
      if (v7 != v8)
      {
        -[SMSessionDestinationEta expectedTravelTime](self, "expectedTravelTime");
        v10 = v9;
        -[SMSessionDestinationEta expectedTravelTime](v5, "expectedTravelTime");
        if (vabdd_f64(v10, v11) >= 2.22044605e-16)
          goto LABEL_10;
      }
      -[SMSessionDestinationEta additionalTravelTime](self, "additionalTravelTime");
      v13 = v12;
      -[SMSessionDestinationEta additionalTravelTime](v5, "additionalTravelTime");
      if (v13 == v14
        || (-[SMSessionDestinationEta additionalTravelTime](self, "additionalTravelTime"),
            v16 = v15,
            -[SMSessionDestinationEta additionalTravelTime](v5, "additionalTravelTime"),
            vabdd_f64(v16, v17) < 2.22044605e-16))
      {
        v18 = -[SMSessionDestinationEta transportType](self, "transportType");
        v19 = v18 == -[SMSessionDestinationEta transportType](v5, "transportType");
      }
      else
      {
LABEL_10:
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }
  }

  return v19;
}

- (SMSessionDestinationEta)initWithDictionary:(id)a3
{
  id v4;
  SMSessionDestinationEta *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("__kSMSessionDestinationEtaExpectedTravelTimeKey"));
  v5 = (SMSessionDestinationEta *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("__kSMSessionDestinationEtaAdditionalTravelTimeKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(v4, "objectForKey:", CFSTR("__kSMSessionDestinationEtaTransportTypeKey"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v4, "valueForKey:", CFSTR("__kSMSessionDestinationEtaExpectedTravelTimeKey"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "doubleValue");
        v11 = v10;

        objc_msgSend(v4, "valueForKey:", CFSTR("__kSMSessionDestinationEtaAdditionalTravelTimeKey"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "doubleValue");
        v14 = v13;

        objc_msgSend(v4, "valueForKey:", CFSTR("__kSMSessionDestinationEtaTransportTypeKey"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (int)objc_msgSend(v15, "intValue");

        self = -[SMSessionDestinationEta initWithExpectedTravelTime:additionalTravelTime:transportType:](self, "initWithExpectedTravelTime:additionalTravelTime:transportType:", v16, v11, v14);
        v5 = self;
        goto LABEL_7;
      }
    }
    else
    {

    }
    v5 = 0;
  }
LABEL_7:

  return v5;
}

- (id)outputToDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[SMSessionDestinationEta expectedTravelTime](self, "expectedTravelTime");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("__kSMSessionDestinationEtaExpectedTravelTimeKey"));

  v6 = (void *)MEMORY[0x24BDD16E0];
  -[SMSessionDestinationEta additionalTravelTime](self, "additionalTravelTime");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("__kSMSessionDestinationEtaAdditionalTravelTimeKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SMSessionDestinationEta transportType](self, "transportType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("__kSMSessionDestinationEtaTransportTypeKey"));

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SMSessionDestinationEta expectedTravelTime](self, "expectedTravelTime");
  v5 = v4;
  -[SMSessionDestinationEta additionalTravelTime](self, "additionalTravelTime");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("expected travel time, %.1f, additional travel time, %.1f, transportType, %d"), v5, v6, -[SMSessionDestinationEta transportType](self, "transportType"));
}

- (id)etaDate
{
  double v3;
  double v4;
  double v5;

  -[SMSessionDestinationEta expectedTravelTime](self, "expectedTravelTime");
  v4 = v3;
  -[SMSessionDestinationEta additionalTravelTime](self, "additionalTravelTime");
  return (id)objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", v4 + v5);
}

- (id)coarseEtaDate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE60];
  -[SMSessionDestinationEta etaDate](self, "etaDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "roundingUpDate:bucketDurationMinute:", v3, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)expectedTravelTime
{
  return self->_expectedTravelTime;
}

- (double)additionalTravelTime
{
  return self->_additionalTravelTime;
}

- (unint64_t)transportType
{
  return self->_transportType;
}

@end
