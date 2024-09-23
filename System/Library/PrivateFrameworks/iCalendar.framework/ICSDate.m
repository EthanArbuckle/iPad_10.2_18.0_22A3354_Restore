@implementation ICSDate

- (ICSDate)initWithValue:(id)a3
{
  id v4;
  ICSDate *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ICSDate;
  v5 = -[ICSProperty initWithValue:type:](&v7, sel_initWithValue_type_, v4, (int)objc_msgSend(v4, "dateType"));

  return v5;
}

- (ICSDate)initWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5
{
  ICSDateValue *v6;
  ICSDate *v7;
  ICSDate *v8;
  objc_super v10;

  v6 = -[ICSDateValue initWithYear:month:day:]([ICSDateValue alloc], "initWithYear:month:day:", a3, a4, a5);
  v10.receiver = self;
  v10.super_class = (Class)ICSDate;
  v7 = -[ICSProperty initWithValue:type:](&v10, sel_initWithValue_type_, v6, 5006);
  v8 = v7;
  if (v7)
    -[ICSProperty setParameterValue:forName:](v7, "setParameterValue:forName:", CFSTR("DATE"), CFSTR("VALUE"));

  return v8;
}

- (ICSDate)initWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5 hour:(int64_t)a6 minute:(int64_t)a7 second:(int64_t)a8
{
  return -[ICSDate initWithYear:month:day:hour:minute:second:timeZone:](self, "initWithYear:month:day:hour:minute:second:timeZone:", a3, a4, a5, a6, a7, a8, 0);
}

- (ICSDate)initWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5 hour:(int64_t)a6 minute:(int64_t)a7 second:(int64_t)a8 timeZone:(id)a9
{
  id v15;
  void *v16;
  objc_class *v17;
  void *v18;
  ICSDate *v19;
  void *v20;
  ICSDate *v21;
  void *v22;

  v15 = a9;
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("GMT"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "isEqualToTimeZone:", v16) & 1) != 0)
  {
    v17 = (objc_class *)objc_opt_class();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "isEqualToTimeZone:", v18);
    v17 = (objc_class *)objc_opt_class();

  }
  v19 = self;

  v20 = (void *)objc_msgSend([v17 alloc], "initWithYear:month:day:hour:minute:second:", a3, a4, a5, a6, a7, a8);
  v21 = -[ICSProperty initWithValue:type:](v19, "initWithValue:type:", v20, 5016);
  if (v21)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v15, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICSDate setTzid:](v21, "setTzid:", v22);

    }
  }

  return v21;
}

- (void)setTzid:(id)a3
{
  -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("TZID"));
}

- (NSString)tzid
{
  return (NSString *)-[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("TZID"));
}

- (id)components
{
  void *v2;
  void *v3;

  -[ICSProperty value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hasTimeComponent
{
  void *v2;
  char isKindOfClass;

  -[ICSProperty value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)hasFloatingTimeZone
{
  void *v3;
  char v4;
  void *v5;

  -[ICSDate tzid](self, "tzid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[ICSProperty value](self, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v4 = objc_opt_isKindOfClass() ^ 1;

  }
  return v4 & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  -[ICSDate tzid](self, "tzid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSProperty stringValue](self, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSDate tzid](self, "tzid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %p - %@ (%@)>"), v6, self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)ICSDate;
    -[ICSProperty description](&v11, sel_description);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

@end
