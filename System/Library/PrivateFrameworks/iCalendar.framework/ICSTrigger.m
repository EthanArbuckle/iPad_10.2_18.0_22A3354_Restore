@implementation ICSTrigger

- (void)fixAlarmTrigger
{
  void *v3;
  void *v4;
  char isKindOfClass;

  -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("RELATED"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("RELATED"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      -[ICSProperty removeParameterValueForName:](self, "removeParameterValueForName:", CFSTR("RELATED"));
  }
}

- (ICSTrigger)initWithDate:(id)a3
{
  id v4;
  ICSTrigger *v5;
  ICSTrigger *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICSTrigger;
  v5 = -[ICSTrigger init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ICSTrigger setDate:](v5, "setDate:", v4);

  return v6;
}

- (ICSTrigger)initWithDuration:(id)a3
{
  id v4;
  ICSTrigger *v5;
  ICSTrigger *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICSTrigger;
  v5 = -[ICSTrigger init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ICSTrigger setDuration:](v5, "setDuration:", v4);

  return v6;
}

- (BOOL)isDurationBased
{
  return -[ICSProperty type](self, "type") == 5011;
}

- (ICSTrigger)initWithDuration:(id)a3 travelRelativeDuration:(id)a4
{
  id v6;
  ICSTrigger *v7;

  v6 = a4;
  v7 = -[ICSTrigger initWithDuration:](self, "initWithDuration:", a3);
  -[ICSProperty setParameterValue:forName:](v7, "setParameterValue:forName:", v6, CFSTR("X-APPLE-RELATED-TRAVEL"));

  return v7;
}

- (id)travelRelativeDuration
{
  return -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("X-APPLE-RELATED-TRAVEL"));
}

- (void)setDate:(id)a3
{
  id v4;

  v4 = a3;
  -[ICSProperty setValue:type:](self, "setValue:type:", v4, (int)objc_msgSend(v4, "dateType"));

  -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", CFSTR("DATE-TIME"), CFSTR("VALUE"));
  -[ICSProperty removeParameterValueForName:](self, "removeParameterValueForName:", CFSTR("RELATED"));
}

- (void)setDuration:(id)a3
{
  -[ICSProperty setValue:type:](self, "setValue:type:", a3, 5011);
  -[ICSProperty removeParameterValueForName:](self, "removeParameterValueForName:", CFSTR("VALUE"));
}

@end
