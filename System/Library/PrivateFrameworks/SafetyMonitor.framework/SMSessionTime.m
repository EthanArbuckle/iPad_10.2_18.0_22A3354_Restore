@implementation SMSessionTime

- (SMSessionTime)initWithTimeBound:(id)a3
{
  id v5;
  SMSessionTime *v6;
  SMSessionTime *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SMSessionTime;
  v6 = -[SMSessionTime init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_timeBound, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMSessionTime)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  SMSessionTime *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TimeBound"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SMSessionTime initWithTimeBound:](self, "initWithTimeBound:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_timeBound, CFSTR("TimeBound"));
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SMSessionTime timeBound](self, "timeBound");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  SMSessionTime *v4;
  SMSessionTime *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  BOOL v11;

  v4 = (SMSessionTime *)a3;
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
      -[SMSessionTime timeBound](self, "timeBound");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "timeIntervalSince1970");
      v8 = v7;
      -[SMSessionTime timeBound](v5, "timeBound");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "timeIntervalSince1970");
      v11 = v8 == v10;

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (SMSessionTime)initWithDictionary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SMSessionTime *v8;

  objc_msgSend(a3, "valueForKey:", CFSTR("TimeBound"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v4, "doubleValue");
    objc_msgSend(v6, "dateWithTimeIntervalSince1970:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SMSessionTime initWithTimeBound:]([SMSessionTime alloc], "initWithTimeBound:", v7);
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }

  return v8;
}

- (id)outputToDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[SMSessionTime timeBound](self, "timeBound");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("TimeBound"));

  return v3;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[SMSessionTime timeBound](self, "timeBound");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("timeBound, %@,"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSDate)timeBound
{
  return self->_timeBound;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeBound, 0);
}

@end
