@implementation SKUIMediaQueryNetworkTypeFeature

- (SKUIMediaQueryNetworkTypeFeature)initWithFeatureName:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SKUIMediaQueryNetworkTypeFeature *v16;
  uint64_t v17;
  NSString *value;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIMediaQueryNetworkTypeFeature initWithFeatureName:value:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUIMediaQueryNetworkTypeFeature;
  v16 = -[SKUIMediaQueryFeature initWithFeatureName:value:](&v20, sel_initWithFeatureName_value_, v6, v7);
  if (v16)
  {
    v17 = objc_msgSend(v7, "copy");
    value = v16->_value;
    v16->_value = (NSString *)v17;

  }
  return v16;
}

+ (BOOL)supportsFeatureName:(id)a3
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        +[SKUIMediaQueryNetworkTypeFeature supportsFeatureName:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = objc_msgSend(v3, "isEqualToString:", CFSTR("network"));

  return v12;
}

- (BOOL)evaluateWithValues:(id)a3
{
  void *v4;

  objc_msgSend(a3, "objectForKey:", 0x1E73AA210);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v4, "isEqualToString:", self->_value);

  return (char)self;
}

- (id)notificationNames
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0DDC138];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)requiredKeys
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0x1E73AA210;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)SKUIMediaQueryNetworkTypeFeature;
  -[SKUIMediaQueryNetworkTypeFeature description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIMediaQueryFeature featureName](self, "featureName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: [%@, %@]"), v4, v5, self->_value);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

- (void)initWithFeatureName:(uint64_t)a3 value:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)supportsFeatureName:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
