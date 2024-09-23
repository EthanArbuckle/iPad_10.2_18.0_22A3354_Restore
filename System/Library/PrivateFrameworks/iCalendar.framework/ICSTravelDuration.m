@implementation ICSTravelDuration

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4 additionalParameters:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v8 = a4;
  v9 = a5;
  -[ICSProperty parameters](self, "parameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("VALUE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

  }
  else
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("VALUE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      if (!v9)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("DURATION"), CFSTR("VALUE"));
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)ICSTravelDuration;
  -[ICSProperty _ICSStringWithOptions:appendingToString:additionalParameters:](&v13, sel__ICSStringWithOptions_appendingToString_additionalParameters_, a3, v8, v9);

}

- (NSString)transparency
{
  return (NSString *)-[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("TRAVEL-TRANSPARENCY"));
}

- (void)setTransparency:(id)a3
{
  -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("TRAVEL-TRANSPARENCY"));
}

- (void)setDuration:(id)a3
{
  -[ICSProperty setValue:type:](self, "setValue:type:", a3, 5011);
}

- (BOOL)alwaysHasParametersToSerialize
{
  return 1;
}

@end
