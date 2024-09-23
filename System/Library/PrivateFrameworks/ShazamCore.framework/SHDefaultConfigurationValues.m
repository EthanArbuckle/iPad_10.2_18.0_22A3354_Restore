@implementation SHDefaultConfigurationValues

- (SHDefaultConfigurationValues)initWithConfiguration:(id)a3
{
  id v5;
  SHDefaultConfigurationValues *v6;
  SHDefaultConfigurationValues *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHDefaultConfigurationValues;
  v6 = -[SHDefaultConfigurationValues init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_defaultValues, a3);

  return v7;
}

- (double)recordingIntermission
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  -[SHDefaultConfigurationValues defaultValues](self, "defaultValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("recordingIntermission"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SHDefaultConfigurationValues defaultValues](self, "defaultValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("recordingIntermission"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

  }
  else
  {
    v8 = 10.0;
  }

  return v8;
}

- (NSString)campaignGroup
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  -[SHDefaultConfigurationValues defaultValues](self, "defaultValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("campaignGroup"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SHDefaultConfigurationValues defaultValues](self, "defaultValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("campaignGroup"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = CFSTR("30201");
  }

  return (NSString *)v6;
}

- (int64_t)lookupBatchSize
{
  void *v2;
  void *v3;
  uint64_t v4;
  int64_t v5;

  -[SHDefaultConfigurationValues defaultValues](self, "defaultValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("lookupBatchSize"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");
  if (v4)
    v5 = v4;
  else
    v5 = 10;

  return v5;
}

- (NSString)providerToken
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  NSString *v5;

  -[SHDefaultConfigurationValues defaultValues](self, "defaultValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("providerToken"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("2003");
  v5 = v3;

  return v5;
}

- (NSDictionary)defaultValues
{
  return self->_defaultValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultValues, 0);
}

@end
