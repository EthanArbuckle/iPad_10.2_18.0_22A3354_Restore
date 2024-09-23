@implementation SKUIMediaQuerySizeFeature

- (SKUIMediaQuerySizeFeature)initWithFeatureName:(id)a3 value:(id)a4
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
  SKUIMediaQuerySizeFeature *v16;
  float v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIMediaQuerySizeFeature initWithFeatureName:value:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)SKUIMediaQuerySizeFeature;
  v16 = -[SKUIMediaQueryFeature initWithFeatureName:value:](&v19, sel_initWithFeatureName_value_, v6, v7);
  if (v16)
  {
    objc_msgSend(v7, "floatValue");
    v16->_value = v17;
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
        +[SKUIMediaQuerySizeFeature supportsFeatureName:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("min-width")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("max-width")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("min-height")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("max-height")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("width")) & 1) != 0)
  {
    v12 = 1;
  }
  else
  {
    v12 = objc_msgSend(v3, "isEqualToString:", CFSTR("height"));
  }

  return v12;
}

- (BOOL)evaluateWithValues:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  float v8;
  BOOL v9;
  __CFString *v10;
  float v11;
  __CFString *v12;

  v4 = a3;
  -[SKUIMediaQueryFeature featureName](self, "featureName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("min-width")))
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("max-width")))
    {
      v10 = CFSTR("width");
LABEL_6:
      objc_msgSend(v4, "objectForKey:", v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "floatValue");
      v9 = self->_value >= v11;
      goto LABEL_10;
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("width")))
    {
      v12 = CFSTR("width");
    }
    else
    {
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("min-height")))
      {
        v6 = CFSTR("height");
        goto LABEL_3;
      }
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("max-height")))
      {
        v10 = CFSTR("height");
        goto LABEL_6;
      }
      if (!objc_msgSend(v5, "isEqualToString:", CFSTR("height")))
      {
        v9 = 0;
        goto LABEL_11;
      }
      v12 = CFSTR("height");
    }
    objc_msgSend(v4, "objectForKey:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "longValue") == (uint64_t)self->_value;
    goto LABEL_10;
  }
  v6 = CFSTR("width");
LABEL_3:
  objc_msgSend(v4, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = self->_value <= v8;
LABEL_10:

LABEL_11:
  return v9;
}

- (id)requiredKeys
{
  void *v2;
  __CFString **v3;
  void *v4;
  __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[SKUIMediaQueryFeature featureName](self, "featureName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("min-width")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("max-width")) & 1) != 0
    || objc_msgSend(v2, "isEqualToString:", CFSTR("width")))
  {
    v7[0] = 0x1E73AA190;
    v3 = (__CFString **)v7;
  }
  else
  {
    v6 = CFSTR("height");
    v3 = &v6;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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
  v8.super_class = (Class)SKUIMediaQuerySizeFeature;
  -[SKUIMediaQuerySizeFeature description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIMediaQueryFeature featureName](self, "featureName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: [%@, %.0f]"), v4, v5, *(_QWORD *)&self->_value);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)initWithFeatureName:(uint64_t)a3 value:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)supportsFeatureName:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
