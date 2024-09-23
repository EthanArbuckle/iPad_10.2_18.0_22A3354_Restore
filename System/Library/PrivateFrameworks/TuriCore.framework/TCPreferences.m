@implementation TCPreferences

+ (void)setOverridePreferences:(id)a3
{
  objc_storeStrong((id *)&gPreferenceOverride, a3);
}

+ (id)defaultPreferences
{
  if (defaultPreferences_onceToken != -1)
    dispatch_once(&defaultPreferences_onceToken, &__block_literal_global_5);
  return (id)defaultPreferences_defaults;
}

void __35__TCPreferences_defaultPreferences__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  DevicePolicyToString(0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("DevicePolicy");
  v5[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "mutableCopy");
  v3 = (void *)defaultPreferences_defaults;
  defaultPreferences_defaults = v2;

}

+ (id)userPreferences
{
  TCPreferences *v2;
  void *v3;
  void *v4;
  void *v5;

  if (gPreferenceOverride)
  {
    v2 = (TCPreferences *)(id)gPreferenceOverride;
  }
  else
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.TuriCore"));
    +[TCPreferences defaultPreferences](TCPreferences, "defaultPreferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "registerDefaults:", v4);

    objc_msgSend(v3, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = -[TCPreferences initWithProperties:]([TCPreferences alloc], "initWithProperties:", v5);

  }
  return v2;
}

- (TCPreferences)initWithDefaults
{
  void *v3;
  TCPreferences *v4;

  +[TCPreferences defaultPreferences](TCPreferences, "defaultPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TCPreferences initWithProperties:](self, "initWithProperties:", v3);

  return v4;
}

- (TCPreferences)initWithProperties:(id)a3
{
  id v4;
  TCPreferences *v5;
  uint64_t v6;
  NSMutableDictionary *properties;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TCPreferences;
  v5 = -[TCPreferences init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    properties = v5->_properties;
    v5->_properties = (NSMutableDictionary *)v6;

  }
  return v5;
}

- (int64_t)devicePolicy
{
  void *v2;
  void *v3;
  int64_t v4;

  -[TCPreferences properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("DevicePolicy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = DevicePolicyFromString(v3);

  return v4;
}

- (void)setDevicePolicy:(int64_t)a3
{
  void *v4;
  id v5;

  DevicePolicyToString(a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[TCPreferences properties](self, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("DevicePolicy"));

}

- (NSMutableDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
}

@end
