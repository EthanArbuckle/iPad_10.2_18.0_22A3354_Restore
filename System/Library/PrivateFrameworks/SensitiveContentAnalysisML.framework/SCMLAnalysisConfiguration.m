@implementation SCMLAnalysisConfiguration

- (SCMLAnalysisConfiguration)init
{

  return 0;
}

- (SCMLAnalysisConfiguration)initWithOptions:(id)a3
{
  id v4;
  SCMLAnalysisConfiguration *v5;
  SCMLAnalysisConfiguration *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SCMLAnalysisConfiguration;
  v5 = -[SCMLAnalysisConfiguration init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_deviceType = 0;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SCMLAnalysisConfigurationDeviceType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SCMLAnalysisConfigurationDeviceType"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_deviceType = objc_msgSend(v8, "unsignedIntValue");

    }
  }

  return v6;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

@end
