@implementation ICSStructuredLocation

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  -[ICSProperty value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", CFSTR("URI"), CFSTR("VALUE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSProperty _ICSStringWithOptions:appendingToString:additionalParameters:](self, "_ICSStringWithOptions:appendingToString:additionalParameters:", a3, v9, v8);
  objc_msgSend(v9, "appendString:", CFSTR(":"));
  if ((a3 & 0x10) != 0 && -[ICSStructuredLocation shouldObscureValue](self, "shouldObscureValue"))
    a3 |= 0x20uLL;
  objc_msgSend(v7, "_ICSStringWithOptions:appendingToString:", a3, v9);

}

- (NSString)fmtype
{
  return (NSString *)-[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("X-FMTTYPE"));
}

- (void)setFmtype:(id)a3
{
  -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("X-FMTTYPE"));
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("X-TITLE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\\n"), CFSTR("\n"), 0, 0, objc_msgSend(v3, "length"));
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\n"), CFSTR("\\n"), 0, 0, objc_msgSend(v4, "length"));
    -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", v4, CFSTR("X-TITLE"));

  }
  else
  {
    -[ICSProperty removeParameterValueForName:](self, "removeParameterValueForName:", CFSTR("X-TITLE"));
  }
}

- (NSString)loctype
{
  return (NSString *)-[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("X-TYPE"));
}

- (void)setLoctype:(id)a3
{
  -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("X-TYPE"));
}

- (double)radius
{
  void *v2;
  double v3;
  double v4;

  -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("X-APPLE-RADIUS"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (void)setRadius:(double)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", v4, CFSTR("X-APPLE-RADIUS"));

}

- (NSString)abURLString
{
  return (NSString *)-[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("X-APPLE-ABUID"));
}

- (void)setAbURLString:(id)a3
{
  -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("X-APPLE-ABUID"));
}

- (NSData)mapKitHandle
{
  return (NSData *)-[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("X-APPLE-MAPKIT-HANDLE"));
}

- (void)setMapKitHandle:(id)a3
{
  -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("X-APPLE-MAPKIT-HANDLE"));
}

- (NSString)displayName
{
  return (NSString *)-[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("X-DISPLAY-NAME"));
}

- (void)setDisplayName:(id)a3
{
  -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("X-DISPLAY-NAME"));
}

- (NSString)address
{
  void *v2;
  void *v3;

  -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("X-ADDRESS"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\\n"), CFSTR("\n"), 0, 0, objc_msgSend(v3, "length"));
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setAddress:(id)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\n"), CFSTR("\\n"), 0, 0, objc_msgSend(v4, "length"));
    -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", v4, CFSTR("X-ADDRESS"));

  }
  else
  {
    -[ICSProperty removeParameterValueForName:](self, "removeParameterValueForName:", CFSTR("X-ADDRESS"));
  }
}

- (NSString)routing
{
  return (NSString *)-[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("ROUTING"));
}

- (void)setRouting:(id)a3
{
  -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("ROUTING"));
}

- (id)propertiesToObscure
{
  return 0;
}

- (id)propertiesToHide
{
  return 0;
}

- (BOOL)shouldObscureParameter:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  objc_msgSend(v3, "setWithObjects:", CFSTR("X-FMTTYPE"), CFSTR("X-TYPE"), CFSTR("X-APPLE-ABUID"), CFSTR("X-APPLE-RADIUS"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6 ^ 1;
}

- (BOOL)shouldObscureValue
{
  return 1;
}

@end
