@implementation AXPhoenixConfiguration

- (AXPhoenixConfiguration)init
{
  AXPhoenixConfiguration *v3;
  objc_super v4;
  SEL v5;
  AXPhoenixConfiguration *v6;

  v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)AXPhoenixConfiguration;
  v6 = -[AXPhoenixConfiguration init](&v4, sel_init);
  objc_storeStrong((id *)&v6, v6);
  if (v6)
  {
    -[AXPhoenixConfiguration _initializeKeys](v6, "_initializeKeys");
    -[AXPhoenixConfiguration _setDefaultConfiguration](v6, "_setDefaultConfiguration");
  }
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (AXPhoenixConfiguration)initWithContentsOfFileAtPath:(id)a3
{
  id v3;
  id v5;
  id v6;
  os_log_t v7;
  id v8;
  os_log_type_t v9;
  os_log_t oslog;
  id obj;
  id v12;
  int v13;
  os_log_type_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  objc_super v19;
  id location[2];
  id v21;
  AXPhoenixConfiguration *v22;
  uint8_t v23[32];
  uint8_t v24[32];
  uint8_t v25[40];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v21;
  v21 = 0;
  v19.receiver = v3;
  v19.super_class = (Class)AXPhoenixConfiguration;
  v21 = -[AXPhoenixConfiguration init](&v19, sel_init);
  objc_storeStrong(&v21, v21);
  if (!v21)
    goto LABEL_18;
  objc_msgSend(v21, "_initializeKeys");
  v18 = 0;
  v16 = 0;
  v6 = (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", location[0], 0, &v16);
  objc_storeStrong(&v18, v16);
  v17 = v6;
  if (v6)
  {
    obj = v18;
    v5 = (id)objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v17, 1, &obj);
    objc_storeStrong(&v18, obj);
    v12 = v5;
    if (v18)
    {
      oslog = (os_log_t)(id)AXLogBackTap();
      v9 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v24, (uint64_t)"-[AXPhoenixConfiguration initWithContentsOfFileAtPath:]", (uint64_t)location[0], (uint64_t)v18);
        _os_log_error_impl(&dword_228CDB000, oslog, v9, "[PHOENIX] %s Could not create dictionary from %@. Error:%@", v24, 0x20u);
      }
      objc_storeStrong((id *)&oslog, 0);
      v22 = 0;
      v13 = 1;
    }
    else
    {
      v8 = (id)objc_msgSend(v21, "_updateConfigWithContentsOfDictionary:", v12);
      if (objc_msgSend(v8, "count"))
      {
        v7 = (os_log_t)(id)AXLogBackTap();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_2_8_32_8_64((uint64_t)v23, (uint64_t)"-[AXPhoenixConfiguration initWithContentsOfFileAtPath:]", (uint64_t)v8);
          _os_log_error_impl(&dword_228CDB000, v7, OS_LOG_TYPE_ERROR, "[PHOENIX] %s Missing keys detected in configuration file: %@", v23, 0x16u);
        }
        objc_storeStrong((id *)&v7, 0);
        v22 = 0;
        v13 = 1;
      }
      else
      {
        v13 = 0;
      }
      objc_storeStrong(&v8, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  else
  {
    v15 = (id)AXLogBackTap();
    v14 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v25, (uint64_t)"-[AXPhoenixConfiguration initWithContentsOfFileAtPath:]", (uint64_t)location[0], (uint64_t)v18);
      _os_log_error_impl(&dword_228CDB000, (os_log_t)v15, v14, "[PHOENIX] %s Could not read configuration from %@. Error:%@", v25, 0x20u);
    }
    objc_storeStrong(&v15, 0);
    v22 = 0;
    v13 = 1;
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  if (!v13)
  {
LABEL_18:
    v22 = (AXPhoenixConfiguration *)v21;
    v13 = 1;
  }
  objc_storeStrong(location, 0);
  objc_storeStrong(&v21, 0);
  return v22;
}

- (void)_initializeKeys
{
  -[AXPhoenixConfiguration setMajorVersionKey:](self, "setMajorVersionKey:", CFSTR("majorVersion"));
  -[AXPhoenixConfiguration setMinorVersionKey:](self, "setMinorVersionKey:", CFSTR("minorVersion"));
  -[AXPhoenixConfiguration setClassifierConfigurationKey:](self, "setClassifierConfigurationKey:", CFSTR("classifier"));
  -[AXPhoenixConfiguration setMitigatorConfigurationKey:](self, "setMitigatorConfigurationKey:", CFSTR("mitigator"));
}

- (void)_setDefaultConfiguration
{
  AXPhoenixClassifierConfiguration *v2;
  AXPhoenixMitigatorConfiguration *v3;

  -[AXPhoenixConfiguration setConfigurationAssetVersion:](self, "setConfigurationAssetVersion:", 0);
  -[AXPhoenixConfiguration setMajorVersion:](self, "setMajorVersion:");
  -[AXPhoenixConfiguration setMinorVersion:](self, "setMinorVersion:", CFSTR("0.0"));
  v2 = objc_alloc_init(AXPhoenixClassifierConfiguration);
  -[AXPhoenixConfiguration setClassifierConfiguration:](self, "setClassifierConfiguration:");

  v3 = objc_alloc_init(AXPhoenixMitigatorConfiguration);
  -[AXPhoenixConfiguration setMitigatorConfiguration:](self, "setMitigatorConfiguration:");

}

- (void)setConfigurationAssetVersion:(unint64_t)a3
{
  -[AXPhoenixConfiguration setAssetVersion:](self, "setAssetVersion:", a3);
}

- (id)_updateConfigWithContentsOfDictionary:(id)a3
{
  id v4;
  NSString *v5;
  AXPhoenixConfiguration *v6;
  AXPhoenixMitigatorConfiguration *v7;
  id v8;
  NSString *v9;
  NSString *v10;
  AXPhoenixConfiguration *v11;
  AXPhoenixClassifierConfiguration *v12;
  id v13;
  NSString *v14;
  NSString *v15;
  id v16;
  AXPhoenixConfiguration *v17;
  id v18;
  NSString *v19;
  id v20;
  NSString *v21;
  id v22;
  NSString *v23;
  id v24;
  AXPhoenixConfiguration *v25;
  id v26;
  NSString *v27;
  id v28;
  NSString *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id location[2];
  AXPhoenixConfiguration *v35;

  v35 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v33 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v28 = location[0];
  v29 = -[AXPhoenixConfiguration majorVersionKey](v35, "majorVersionKey");
  v30 = (id)objc_msgSend(v28, "objectForKey:");

  if (v30)
  {
    v25 = v35;
    v24 = location[0];
    v27 = -[AXPhoenixConfiguration majorVersionKey](v35, "majorVersionKey");
    v26 = (id)objc_msgSend(v24, "objectForKey:");
    -[AXPhoenixConfiguration setMajorVersion:](v25, "setMajorVersion:");

  }
  else
  {
    v23 = -[AXPhoenixConfiguration majorVersionKey](v35, "majorVersionKey");
    objc_msgSend(v33, "addObject:");

  }
  v20 = location[0];
  v21 = -[AXPhoenixConfiguration minorVersionKey](v35, "minorVersionKey");
  v22 = (id)objc_msgSend(v20, "objectForKey:");

  if (v22)
  {
    v17 = v35;
    v16 = location[0];
    v19 = -[AXPhoenixConfiguration minorVersionKey](v35, "minorVersionKey");
    v18 = (id)objc_msgSend(v16, "objectForKey:");
    -[AXPhoenixConfiguration setMinorVersion:](v17, "setMinorVersion:");

  }
  else
  {
    v15 = -[AXPhoenixConfiguration minorVersionKey](v35, "minorVersionKey");
    objc_msgSend(v33, "addObject:");

  }
  v13 = location[0];
  v14 = -[AXPhoenixConfiguration classifierConfigurationKey](v35, "classifierConfigurationKey");
  v32 = (id)objc_msgSend(v13, "objectForKey:");

  if (v32)
  {
    v11 = v35;
    v12 = -[AXPhoenixClassifierConfiguration initWithDictionary:missingKeys:]([AXPhoenixClassifierConfiguration alloc], "initWithDictionary:missingKeys:", v32, v33);
    -[AXPhoenixConfiguration setClassifierConfiguration:](v11, "setClassifierConfiguration:");

  }
  else
  {
    v10 = -[AXPhoenixConfiguration classifierConfigurationKey](v35, "classifierConfigurationKey");
    objc_msgSend(v33, "addObject:");

  }
  v8 = location[0];
  v9 = -[AXPhoenixConfiguration mitigatorConfigurationKey](v35, "mitigatorConfigurationKey");
  v31 = (id)objc_msgSend(v8, "objectForKey:");

  if (v31)
  {
    v6 = v35;
    v7 = -[AXPhoenixMitigatorConfiguration initWithDictionary:missingKeys:]([AXPhoenixMitigatorConfiguration alloc], "initWithDictionary:missingKeys:", v31, v33);
    -[AXPhoenixConfiguration setMitigatorConfiguration:](v6, "setMitigatorConfiguration:");

  }
  else
  {
    v5 = -[AXPhoenixConfiguration mitigatorConfigurationKey](v35, "mitigatorConfigurationKey");
    objc_msgSend(v33, "addObject:");

  }
  v4 = v33;
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)toStringifiedJSON
{
  id v2;
  NSObject *v4;
  os_log_type_t v5;
  id v6;
  id v7;
  AXPhoenixMitigatorConfiguration *v8;
  NSString *v9;
  id v10;
  AXPhoenixClassifierConfiguration *v11;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  id v17;
  os_log_type_t v18;
  os_log_t oslog;
  id v20;
  id v21;
  id v22;
  int v23;
  os_log_type_t v24;
  id location;
  id v26[2];
  AXPhoenixConfiguration *v27;
  id v28;
  uint8_t v29[32];
  uint8_t v30[24];
  _QWORD v31[4];
  _QWORD v32[5];

  v32[4] = *MEMORY[0x24BDAC8D0];
  v27 = self;
  v26[1] = (id)a2;
  v16 = -[AXPhoenixConfiguration majorVersionKey](self, "majorVersionKey");
  v31[0] = v16;
  v15 = -[AXPhoenixConfiguration majorVersion](v27, "majorVersion");
  v32[0] = v15;
  v14 = -[AXPhoenixConfiguration minorVersionKey](v27, "minorVersionKey");
  v31[1] = v14;
  v13 = -[AXPhoenixConfiguration minorVersion](v27, "minorVersion");
  v32[1] = v13;
  v12 = -[AXPhoenixConfiguration classifierConfigurationKey](v27, "classifierConfigurationKey");
  v31[2] = v12;
  v11 = -[AXPhoenixConfiguration classifierConfiguration](v27, "classifierConfiguration");
  v10 = -[AXPhoenixClassifierConfiguration toDictionary](v11, "toDictionary");
  v32[2] = v10;
  v9 = -[AXPhoenixConfiguration mitigatorConfigurationKey](v27, "mitigatorConfigurationKey");
  v31[3] = v9;
  v8 = -[AXPhoenixConfiguration mitigatorConfiguration](v27, "mitigatorConfiguration");
  v7 = -[AXPhoenixMitigatorConfiguration toDictionary](v8, "toDictionary");
  v32[3] = v7;
  v26[0] = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 4);

  if ((objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v26[0]) & 1) != 0)
  {
    v22 = 0;
    v20 = 0;
    v6 = (id)objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v26[0], 1, &v20);
    objc_storeStrong(&v22, v20);
    v21 = v6;
    if (v6)
    {
      v2 = objc_alloc(MEMORY[0x24BDD17C8]);
      v28 = (id)objc_msgSend(v2, "initWithData:encoding:", v21, 4);
      v23 = 1;
    }
    else
    {
      oslog = (os_log_t)(id)AXLogBackTap();
      v18 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        v4 = oslog;
        v5 = v18;
        v17 = (id)objc_opt_class();
        __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v29, (uint64_t)"-[AXPhoenixConfiguration toStringifiedJSON]", (uint64_t)v17, (uint64_t)v22);
        _os_log_error_impl(&dword_228CDB000, v4, v5, "[PHOENIX] %s Error serializing %@: Got error: %@", v29, 0x20u);
        objc_storeStrong(&v17, 0);
      }
      objc_storeStrong((id *)&oslog, 0);
      v28 = 0;
      v23 = 1;
    }
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v22, 0);
  }
  else
  {
    location = (id)AXLogBackTap();
    v24 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v30, (uint64_t)"-[AXPhoenixConfiguration toStringifiedJSON]");
      _os_log_error_impl(&dword_228CDB000, (os_log_t)location, v24, "[PHOENIX] %s Invalid JSON object!", v30, 0xCu);
    }
    objc_storeStrong(&location, 0);
    v28 = 0;
    v23 = 1;
  }
  objc_storeStrong(v26, 0);
  return v28;
}

- (unint64_t)assetVersion
{
  return self->_assetVersion;
}

- (void)setAssetVersion:(unint64_t)a3
{
  self->_assetVersion = a3;
}

- (NSString)majorVersion
{
  return self->_majorVersion;
}

- (void)setMajorVersion:(id)a3
{
  objc_storeStrong((id *)&self->_majorVersion, a3);
}

- (NSString)minorVersion
{
  return self->_minorVersion;
}

- (void)setMinorVersion:(id)a3
{
  objc_storeStrong((id *)&self->_minorVersion, a3);
}

- (AXPhoenixClassifierConfiguration)classifierConfiguration
{
  return self->_classifierConfiguration;
}

- (void)setClassifierConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_classifierConfiguration, a3);
}

- (AXPhoenixMitigatorConfiguration)mitigatorConfiguration
{
  return self->_mitigatorConfiguration;
}

- (void)setMitigatorConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_mitigatorConfiguration, a3);
}

- (NSString)majorVersionKey
{
  return self->_majorVersionKey;
}

- (void)setMajorVersionKey:(id)a3
{
  objc_storeStrong((id *)&self->_majorVersionKey, a3);
}

- (NSString)minorVersionKey
{
  return self->_minorVersionKey;
}

- (void)setMinorVersionKey:(id)a3
{
  objc_storeStrong((id *)&self->_minorVersionKey, a3);
}

- (NSString)classifierConfigurationKey
{
  return self->_classifierConfigurationKey;
}

- (void)setClassifierConfigurationKey:(id)a3
{
  objc_storeStrong((id *)&self->_classifierConfigurationKey, a3);
}

- (NSString)mitigatorConfigurationKey
{
  return self->_mitigatorConfigurationKey;
}

- (void)setMitigatorConfigurationKey:(id)a3
{
  objc_storeStrong((id *)&self->_mitigatorConfigurationKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mitigatorConfigurationKey, 0);
  objc_storeStrong((id *)&self->_classifierConfigurationKey, 0);
  objc_storeStrong((id *)&self->_minorVersionKey, 0);
  objc_storeStrong((id *)&self->_majorVersionKey, 0);
  objc_storeStrong((id *)&self->_mitigatorConfiguration, 0);
  objc_storeStrong((id *)&self->_classifierConfiguration, 0);
  objc_storeStrong((id *)&self->_minorVersion, 0);
  objc_storeStrong((id *)&self->_majorVersion, 0);
}

@end
