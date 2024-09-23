@implementation FMDExtAccessoryConfiguration

- (FMDExtAccessoryConfiguration)initWithConfigurationInfo:(id)a3
{
  id v4;
  FMDExtAccessoryConfiguration *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *accessoryType;
  uint64_t v11;
  NSString *version;
  uint64_t v13;
  NSDictionary *features;
  void *v15;
  FMDSupportedAccessory *v16;
  FMDSupportedAccessory *supportedAccessory;
  FMDExtAccessoryConfiguration *v18;
  id v19;
  NSObject *v20;
  const char *v21;
  id v22;
  objc_super v24;
  uint8_t buf[4];
  id v26;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)FMDExtAccessoryConfiguration;
  v5 = -[FMDExtAccessoryConfiguration init](&v24, "init");
  if (!v5)
    goto LABEL_7;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("config")));
  v8 = objc_opt_class(NSDictionary, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
  {
    v19 = sub_1000530AC();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v4;
      v21 = "Invalid configuration type %@";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 0xCu);
    }
LABEL_13:

    v18 = 0;
    goto LABEL_14;
  }
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type")));
  accessoryType = v5->_accessoryType;
  v5->_accessoryType = (NSString *)v9;

  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("version")));
  version = v5->_version;
  v5->_version = (NSString *)v11;

  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("features")));
  features = v5->_features;
  v5->_features = (NSDictionary *)v13;

  if (!v5->_accessoryType || !v5->_version || !v5->_features)
  {
    v22 = sub_1000530AC();
    v20 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v4;
      v21 = "Partial configuration received %@";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessoryConfiguration infoForFeature:](v5, "infoForFeature:", CFSTR("lastKnownLocation")));
  v16 = -[FMDSupportedAccessory initWithType:locationInfo:]([FMDSupportedAccessory alloc], "initWithType:locationInfo:", v5->_accessoryType, v15);
  supportedAccessory = v5->_supportedAccessory;
  v5->_supportedAccessory = v16;

LABEL_7:
  v18 = v5;
LABEL_14:

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessoryConfiguration accessoryType](self, "accessoryType"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("accessoryType"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessoryConfiguration version](self, "version"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("version"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessoryConfiguration features](self, "features"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("features"));

  v8 = (id)objc_claimAutoreleasedReturnValue(-[FMDExtAccessoryConfiguration supportedAccessory](self, "supportedAccessory"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("supportedAccessory"));

}

- (FMDExtAccessoryConfiguration)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  FMDExtAccessoryConfiguration *v6;
  id v7;
  uint64_t v8;
  NSString *accessoryType;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSString *version;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSSet *v21;
  void *v22;
  uint64_t v23;
  NSDictionary *features;
  uint64_t v25;
  id v26;
  uint64_t v27;
  FMDSupportedAccessory *supportedAccessory;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)FMDExtAccessoryConfiguration;
  v6 = -[FMDExtAccessoryConfiguration init](&v30, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), CFSTR("accessoryType"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    accessoryType = v6->_accessoryType;
    v6->_accessoryType = (NSString *)v8;

    v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v10), CFSTR("version"));
    v12 = objc_claimAutoreleasedReturnValue(v11);
    version = v6->_version;
    v6->_version = (NSString *)v12;

    v15 = objc_opt_class(NSString, v14);
    v17 = objc_opt_class(NSDictionary, v16);
    v19 = objc_opt_class(NSArray, v18);
    v21 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v15, v17, v19, objc_opt_class(NSNumber, v20), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("features")));
    features = v6->_features;
    v6->_features = (NSDictionary *)v23;

    v26 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(FMDSupportedAccessory, v25), CFSTR("supportedAccessory"));
    v27 = objc_claimAutoreleasedReturnValue(v26);
    supportedAccessory = v6->_supportedAccessory;
    v6->_supportedAccessory = (FMDSupportedAccessory *)v27;

  }
  return v6;
}

- (id)flavorForFeature:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char isKindOfClass;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessoryConfiguration features](self, "features"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessoryConfiguration features](self, "features"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v4));
    v11 = objc_opt_class(NSDictionary, v10);
    isKindOfClass = objc_opt_isKindOfClass(v9, v11);

    if ((isKindOfClass & 1) == 0)
    {
      v14 = 0;
      goto LABEL_7;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessoryConfiguration features](self, "features"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("flavor")));

  }
  else
  {
    v14 = 0;
  }

LABEL_7:
  return v14;
}

- (double)timeoutForFeature:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessoryConfiguration features](self, "features"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  v8 = 2.0;
  if (v6)
  {
    v9 = objc_opt_class(NSDictionary, v7);
    if ((objc_opt_isKindOfClass(v6, v9) & 1) != 0)
    {
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timeout")));
      v11 = (void *)v10;
      if (v10 && (objc_opt_respondsToSelector(v10, "doubleValue") & 1) != 0)
      {
        objc_msgSend(v11, "doubleValue");
        v8 = v12;
      }

    }
  }

  return v8;
}

- (id)infoForFeature:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessoryConfiguration features](self, "features"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  if (v6 && (v8 = objc_opt_class(NSDictionary, v7), (objc_opt_isKindOfClass(v6, v8) & 1) != 0))
    v9 = v6;
  else
    v9 = 0;

  return v9;
}

- (double)detachNotificaitonsWaitTime
{
  void *v2;
  void *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDExtAccessoryConfiguration features](self, "features"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("nwd")));

  v5 = 0.0;
  if (v3)
  {
    v6 = objc_opt_class(NSDictionary, v4);
    if ((objc_opt_isKindOfClass(v3, v6) & 1) != 0)
    {
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("delay")));
      v8 = (void *)v7;
      if (v7 && (objc_opt_respondsToSelector(v7, "doubleValue") & 1) != 0)
      {
        objc_msgSend(v8, "doubleValue");
        v5 = v9;
      }

    }
  }

  return v5;
}

- (NSString)accessoryType
{
  return self->_accessoryType;
}

- (NSString)version
{
  return self->_version;
}

- (NSDictionary)features
{
  return self->_features;
}

- (FMDSupportedAccessory)supportedAccessory
{
  return self->_supportedAccessory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedAccessory, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_accessoryType, 0);
}

@end
