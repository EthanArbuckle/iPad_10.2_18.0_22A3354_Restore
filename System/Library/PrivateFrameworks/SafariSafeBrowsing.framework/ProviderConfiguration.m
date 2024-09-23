@implementation ProviderConfiguration

- (ProviderConfiguration)init
{

  return 0;
}

- (ProviderConfiguration)initWithConfiguration:(id)a3
{
  id v4;
  ProviderConfiguration *v5;
  uint64_t v6;
  NSDictionary *configuration;
  ProviderConfiguration *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ProviderConfiguration;
  v5 = -[ProviderConfiguration init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    configuration = v5->_configuration;
    v5->_configuration = (NSDictionary *)v6;

    -[ProviderConfiguration _parseConfiguration:](v5, "_parseConfiguration:", v4);
    v8 = v5;
  }

  return v5;
}

- (BOOL)providerOff
{
  if (self->_providerOff)
    return 1;
  if (self->_socialEngineeringThreatTypeOff && self->_malwareThreatTypeOff)
    return self->_unwantedSoftwareThreatTypeOff;
  return 0;
}

- (void)_configureToUseDefaultValues
{
  *(_WORD *)&self->_socialEngineeringThreatTypeOff = 0;
  self->_unwantedSoftwareThreatTypeOff = 0;
}

- (void)_configureToBeOff
{
  *(_WORD *)&self->_socialEngineeringThreatTypeOff = 257;
  self->_unwantedSoftwareThreatTypeOff = 1;
}

- (void)_parseConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  self->_proxyOff = 0;
  v12 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("Proxy Versions To Turn Off"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[ProxyConfiguration currentVersion](ProxyConfiguration, "currentVersion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "containsObject:", v6);

      if (v7)
        self->_proxyOff = 1;
    }
    objc_msgSend(v12, "objectForKey:", CFSTR("Regions To Turn Off"));
    isKindOfClass = objc_claimAutoreleasedReturnValue();
    v9 = (void *)isKindOfClass;
    if (isKindOfClass && (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), (isKindOfClass & 1) == 0))
    {
      -[ProviderConfiguration _configureToUseDefaultValues](self, "_configureToUseDefaultValues");
    }
    else
    {
      Backend::Google::SSBUtilities::currentCountryCode((Backend::Google::SSBUtilities *)isKindOfClass);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 && (!v9 || (objc_msgSend(v9, "containsObject:", v10) & 1) != 0))
      {
        objc_msgSend(v12, "objectForKey:", CFSTR("Threat Types To Turn Off"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (objc_msgSend(v11, "containsObject:", CFSTR("Social Engineering")))
              self->_socialEngineeringThreatTypeOff = 1;
            if (objc_msgSend(v11, "containsObject:", CFSTR("Malware")))
              self->_malwareThreatTypeOff = 1;
            if (objc_msgSend(v11, "containsObject:", CFSTR("Unwanted Software")))
              self->_unwantedSoftwareThreatTypeOff = 1;
          }
          else
          {
            -[ProviderConfiguration _configureToUseDefaultValues](self, "_configureToUseDefaultValues");
          }
        }
        else
        {
          -[ProviderConfiguration _configureToBeOff](self, "_configureToBeOff");
        }

      }
      else
      {
        -[ProviderConfiguration _configureToUseDefaultValues](self, "_configureToUseDefaultValues");
      }

    }
  }
  else
  {
    -[ProviderConfiguration _configureToUseDefaultValues](self, "_configureToUseDefaultValues");
  }

}

- (BOOL)isEqualToConfiguration:(id)a3
{
  unint64_t v4;
  NSDictionary *configuration;
  BOOL v6;

  v4 = (unint64_t)a3;
  configuration = self->_configuration;
  v6 = !(v4 | (unint64_t)configuration)
    || v4 && -[NSDictionary isEqualToDictionary:](configuration, "isEqualToDictionary:", v4);

  return v6;
}

- (void)setProviderOff:(BOOL)a3
{
  self->_providerOff = a3;
}

- (BOOL)socialEngineeringThreatTypeOff
{
  return self->_socialEngineeringThreatTypeOff;
}

- (BOOL)malwareThreatTypeOff
{
  return self->_malwareThreatTypeOff;
}

- (BOOL)unwantedSoftwareThreatTypeOff
{
  return self->_unwantedSoftwareThreatTypeOff;
}

- (BOOL)proxyOff
{
  return self->_proxyOff;
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
