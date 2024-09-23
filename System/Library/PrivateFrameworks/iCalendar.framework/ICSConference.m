@implementation ICSConference

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a4;
  -[ICSProperty value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v6, "absoluteString"), (v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = (void *)v7;
    -[ICSProperty _ICSStringWithOptions:appendingToString:additionalParameters:](self, "_ICSStringWithOptions:appendingToString:additionalParameters:", a3, v9, 0);
    objc_msgSend(v9, "appendString:", CFSTR(":"));
    objc_msgSend(v8, "_ICSStringWithOptions:appendingToString:", a3, v9);

  }
  else
  {
    NSLog(CFSTR("Ignoring conference with nothing to export: %@"), self);
    objc_msgSend(v9, "appendString:", CFSTR(":"));
  }

}

- (ICSConference)initWithValue:(id)a3 type:(unint64_t)a4
{
  ICSConference *v4;
  ICSConference *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICSConference;
  v4 = -[ICSProperty initWithValue:type:](&v7, sel_initWithValue_type_, a3, a4);
  v5 = v4;
  if (v4)
    -[ICSProperty setParameterValue:forName:](v4, "setParameterValue:forName:", CFSTR("URI"), CFSTR("VALUE"));
  return v5;
}

- (NSString)feature
{
  return (NSString *)-[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("X-FEATURE"));
}

- (void)setFeature:(id)a3
{
  -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("X-FEATURE"));
}

- (NSString)info
{
  return (NSString *)-[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("X-INFO"));
}

- (void)setInfo:(id)a3
{
  -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("X-INFO"));
}

- (NSString)language
{
  return (NSString *)-[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("LANGUAGE"));
}

- (void)setLanguage:(id)a3
{
  -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("LANGUAGE"));
}

- (NSString)region
{
  return (NSString *)-[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("X-REGION"));
}

- (void)setRegion:(id)a3
{
  -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("X-REGION"));
}

- (unint64_t)currentHash
{
  void *v2;
  unint64_t v3;

  -[ICSProperty value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqualToConference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[ICSProperty value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    -[ICSProperty parameters](self, "parameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
