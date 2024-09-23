@implementation RCUserSegmentationConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_todayEndpointURLString, 0);
  objc_storeStrong((id *)&self->_widgetEndpointURLString, 0);
  objc_storeStrong((id *)&self->_endpointURLString, 0);
}

- (unint64_t)modThreshold
{
  return self->_modThreshold;
}

- (unint64_t)modMax
{
  return self->_modMax;
}

- (NSString)endpointURLString
{
  return self->_endpointURLString;
}

- (RCUserSegmentationConfiguration)initWithCoder:(id)a3
{
  id v4;
  RCUserSegmentationConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *endpointURLString;
  uint64_t v12;
  NSString *widgetEndpointURLString;
  uint64_t v14;
  NSString *todayEndpointURLString;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)RCUserSegmentationConfiguration;
  v5 = -[RCUserSegmentationConfiguration init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("foregroundRefreshRate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_foregroundRefreshRate = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundRefreshRate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_backgroundRefreshRate = objc_msgSend(v7, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modThreshold"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_modThreshold = objc_msgSend(v8, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modMax"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_modMax = objc_msgSend(v9, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endpointURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    endpointURLString = v5->_endpointURLString;
    v5->_endpointURLString = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("widgetEndpointURL"));
    v12 = objc_claimAutoreleasedReturnValue();
    widgetEndpointURLString = v5->_widgetEndpointURLString;
    v5->_widgetEndpointURLString = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("todayEndpointURL"));
    v14 = objc_claimAutoreleasedReturnValue();
    todayEndpointURLString = v5->_todayEndpointURLString;
    v5->_todayEndpointURLString = (NSString *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", -[RCUserSegmentationConfiguration foregroundRefreshRate](self, "foregroundRefreshRate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("foregroundRefreshRate"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RCUserSegmentationConfiguration backgroundRefreshRate](self, "backgroundRefreshRate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("backgroundRefreshRate"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RCUserSegmentationConfiguration modThreshold](self, "modThreshold"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("modThreshold"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RCUserSegmentationConfiguration modMax](self, "modMax"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("modMax"));

  -[RCUserSegmentationConfiguration endpointURLString](self, "endpointURLString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("endpointURL"));

  -[RCUserSegmentationConfiguration widgetEndpointURLString](self, "widgetEndpointURLString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("widgetEndpointURL"));

  -[RCUserSegmentationConfiguration todayEndpointURLString](self, "todayEndpointURLString");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v12, CFSTR("todayEndpointURL"));

}

- (NSString)todayEndpointURLString
{
  return self->_todayEndpointURLString;
}

- (NSString)widgetEndpointURLString
{
  return self->_widgetEndpointURLString;
}

- (unint64_t)backgroundRefreshRate
{
  return self->_backgroundRefreshRate;
}

- (unint64_t)foregroundRefreshRate
{
  return self->_foregroundRefreshRate;
}

+ (id)userSegmentationConfigurationWithConfigDict:(id)a3 environment:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  RCUserSegmentationConfiguration *v24;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = RCJSONIntegerValue(v5, CFSTR("appConfigRefreshRate"), 300);
  RCJSONArrayValue(v5, CFSTR("endpointConfigs"));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
  if (v8)
  {
    v26 = v6;
    v9 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        RCJSONStringValue(v11, CFSTR("environment"), 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = RCUserSegmentationEnvironmentForEnvironmentString(v12);

        if (v13 == a4)
        {
          RCJSONStringValue(v11, CFSTR("configurationEndpointUrl"), 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          RCJSONStringValue(v11, CFSTR("widgetConfigurationEndpointUrl"), 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          RCJSONStringValue(v11, CFSTR("todayConfigurationEndpointUrl"), 0);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v8 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
      if (v8)
        continue;
      break;
    }
    v14 = 0;
    v28 = 0;
LABEL_11:
    v6 = v26;
  }
  else
  {
    v14 = 0;
    v28 = 0;
  }

  RCJSONDictionaryValue(v5, CFSTR("userSegmentationApiConfiguration"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v27 = RCJSONIntegerValue(v15, CFSTR("userSegmentationApiModMax"), 1000);
    v17 = RCJSONIntegerValue(v16, CFSTR("userSegmentationApiModThreshold"), 1000);
    v6 = RCJSONIntegerValue(v16, CFSTR("userSegmentationRefreshRate"), v6);
    v18 = RCJSONIntegerValue(v16, CFSTR("userSegmentationBackgroundRefreshRate"), 3600);
  }
  else
  {
    v18 = 3600;
    v27 = 1000;
    v17 = 1000;
  }
  RCJSONDictionaryValue(v5, CFSTR("widgetConfiguration"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    v21 = RCJSONIntegerValue(v19, CFSTR("user_segmentation_foreground_refresh_rate"), v6);
    v18 = RCJSONIntegerValue(v20, CFSTR("user_segmentation_refresh_rate"), v21);
    v6 = v18;
  }
  RCSharedLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218752;
    v34 = v6;
    v35 = 2048;
    v36 = v18;
    v37 = 2048;
    v38 = v27;
    v39 = 2048;
    v40 = v17;
    _os_log_impl(&dword_1A1FB5000, v22, OS_LOG_TYPE_DEFAULT, "creating user segmentation config with foreground refresh rate: %lu background refresh rate: %lu modMax: %lu modThreshold: %lu", buf, 0x2Au);
  }

  RCSharedLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v34 = (uint64_t)v28;
    v35 = 2112;
    v36 = (uint64_t)v14;
    v37 = 2112;
    v38 = (uint64_t)v8;
    _os_log_impl(&dword_1A1FB5000, v23, OS_LOG_TYPE_DEFAULT, "creating user segmentation config with endpointURL: %@ widgetEndpointURL: %@ todayEndpointURL: %@", buf, 0x20u);
  }

  v24 = -[RCUserSegmentationConfiguration initWithForegroundRefreshRate:backgroundRefreshRate:modThreshold:modMax:endpointURLString:widgetEndpointURLString:todayEndpointURLString:]([RCUserSegmentationConfiguration alloc], "initWithForegroundRefreshRate:backgroundRefreshRate:modThreshold:modMax:endpointURLString:widgetEndpointURLString:todayEndpointURLString:", v6, v18, v17, v27, v28, v14, v8);
  return v24;
}

- (RCUserSegmentationConfiguration)initWithForegroundRefreshRate:(unint64_t)a3 backgroundRefreshRate:(unint64_t)a4 modThreshold:(unint64_t)a5 modMax:(unint64_t)a6 endpointURLString:(id)a7 widgetEndpointURLString:(id)a8 todayEndpointURLString:(id)a9
{
  id v15;
  id v16;
  id v17;
  RCUserSegmentationConfiguration *v18;
  RCUserSegmentationConfiguration *v19;
  uint64_t v20;
  NSString *endpointURLString;
  uint64_t v22;
  NSString *widgetEndpointURLString;
  uint64_t v24;
  NSString *todayEndpointURLString;
  objc_super v27;

  v15 = a7;
  v16 = a8;
  v17 = a9;
  v27.receiver = self;
  v27.super_class = (Class)RCUserSegmentationConfiguration;
  v18 = -[RCUserSegmentationConfiguration init](&v27, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_foregroundRefreshRate = a3;
    v18->_backgroundRefreshRate = a4;
    v18->_modThreshold = a5;
    v18->_modMax = a6;
    v20 = objc_msgSend(v15, "copy");
    endpointURLString = v19->_endpointURLString;
    v19->_endpointURLString = (NSString *)v20;

    v22 = objc_msgSend(v16, "copy");
    widgetEndpointURLString = v19->_widgetEndpointURLString;
    v19->_widgetEndpointURLString = (NSString *)v22;

    v24 = objc_msgSend(v17, "copy");
    todayEndpointURLString = v19->_todayEndpointURLString;
    v19->_todayEndpointURLString = (NSString *)v24;

  }
  return v19;
}

+ (id)defaultConfiguration
{
  return -[RCUserSegmentationConfiguration initWithForegroundRefreshRate:backgroundRefreshRate:modThreshold:modMax:endpointURLString:widgetEndpointURLString:todayEndpointURLString:]([RCUserSegmentationConfiguration alloc], "initWithForegroundRefreshRate:backgroundRefreshRate:modThreshold:modMax:endpointURLString:widgetEndpointURLString:todayEndpointURLString:", 300, 3600, 1000, 1000, 0, 0, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[RCUserSegmentationConfiguration foregroundRefreshRate](self, "foregroundRefreshRate");
    if (v6 == objc_msgSend(v5, "foregroundRefreshRate")
      && (v7 = -[RCUserSegmentationConfiguration backgroundRefreshRate](self, "backgroundRefreshRate"),
          v7 == objc_msgSend(v5, "backgroundRefreshRate"))
      && (v8 = -[RCUserSegmentationConfiguration modThreshold](self, "modThreshold"),
          v8 == objc_msgSend(v5, "modThreshold"))
      && (v9 = -[RCUserSegmentationConfiguration modMax](self, "modMax"), v9 == objc_msgSend(v5, "modMax")))
    {
      -[RCUserSegmentationConfiguration endpointURLString](self, "endpointURLString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "endpointURLString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqualToString:", v11))
      {
        -[RCUserSegmentationConfiguration widgetEndpointURLString](self, "widgetEndpointURLString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "widgetEndpointURLString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqualToString:", v13))
        {
          -[RCUserSegmentationConfiguration todayEndpointURLString](self, "todayEndpointURLString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "todayEndpointURLString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "isEqualToString:", v15);

        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RCUserSegmentationConfiguration foregroundRefreshRate](self, "foregroundRefreshRate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RCUserSegmentationConfiguration backgroundRefreshRate](self, "backgroundRefreshRate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RCUserSegmentationConfiguration modThreshold](self, "modThreshold"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RCUserSegmentationConfiguration modMax](self, "modMax"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[RCUserSegmentationConfiguration endpointURLString](self, "endpointURLString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[RCUserSegmentationConfiguration widgetEndpointURLString](self, "widgetEndpointURLString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[RCUserSegmentationConfiguration todayEndpointURLString](self, "todayEndpointURLString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10 ^ v14 ^ objc_msgSend(v15, "hash");

  return v16;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[RCUserSegmentationConfiguration foregroundRefreshRate](self, "foregroundRefreshRate");
  v6 = -[RCUserSegmentationConfiguration backgroundRefreshRate](self, "backgroundRefreshRate");
  v7 = -[RCUserSegmentationConfiguration modThreshold](self, "modThreshold");
  v8 = -[RCUserSegmentationConfiguration modMax](self, "modMax");
  -[RCUserSegmentationConfiguration endpointURLString](self, "endpointURLString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCUserSegmentationConfiguration widgetEndpointURLString](self, "widgetEndpointURLString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCUserSegmentationConfiguration todayEndpointURLString](self, "todayEndpointURLString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; foregroundRefreshRate: %lu\n backgroundRefreshRate: %lu\n modThreshold: %lu\n modMax: %lu endpointURL: %@ widgetEndpointURL: %@ todayEndpointURL: %@"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
