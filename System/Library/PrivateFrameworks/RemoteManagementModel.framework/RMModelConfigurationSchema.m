@implementation RMModelConfigurationSchema

+ (NSDictionary)schemas
{
  return (NSDictionary *)(id)_schemas;
}

- (id)initFromDictionary:(id)a3
{
  id v4;
  RMModelConfigurationSchema *v5;
  void *v6;
  void *v7;
  void *v8;
  NSDictionary *v9;
  NSDictionary *supportedOS;
  NSDictionary *v11;
  void *v12;
  uint64_t v13;
  NSArray *assetReferences;
  RMModelConfigurationSchema *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)RMModelConfigurationSchema;
  v5 = -[RMModelConfigurationSchema init](&v17, sel_init);
  if (!v5)
    goto LABEL_7;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("version"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v6, "intValue") != 1)
  {
LABEL_9:

    v15 = 0;
    goto LABEL_10;
  }
  objc_storeStrong((id *)&v5->_version, v6);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("configuration-type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_storeStrong((id *)&v5->_configurationType, v7),
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("supported-os")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        +[RMModelSchemaParser loadSupportedOSFromDictionary:](RMModelSchemaParser, "loadSupportedOSFromDictionary:", v8), v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue(), v8, !v9))
  {

    goto LABEL_9;
  }
  supportedOS = v5->_supportedOS;
  v5->_supportedOS = v9;
  v11 = v9;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("asset-references"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelConfigurationSchema _parseAssetReferences:](v5, "_parseAssetReferences:", v12);
  v13 = objc_claimAutoreleasedReturnValue();
  assetReferences = v5->_assetReferences;
  v5->_assetReferences = (NSArray *)v13;

LABEL_7:
  v15 = v5;
LABEL_10:

  return v15;
}

- (BOOL)isSupportedForPlatform:(int64_t)a3 scope:(int64_t)a4
{
  void *v6;

  -[RMModelConfigurationSchema supportedOS](self, "supportedOS");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = +[RMModelPayloadUtilities isSupportedForPlatform:scope:supportedOS:](RMModelPayloadUtilities, "isSupportedForPlatform:scope:supportedOS:", a3, a4, v6);

  return a4;
}

- (BOOL)isSupportedForPlatform:(int64_t)a3 scope:(int64_t)a4 enrollmentType:(int64_t)a5
{
  void *v8;

  -[RMModelConfigurationSchema supportedOS](self, "supportedOS");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = +[RMModelPayloadUtilities isSupportedForPlatform:scope:enrollmentType:supportedOS:](RMModelPayloadUtilities, "isSupportedForPlatform:scope:enrollmentType:supportedOS:", a3, a4, a5, v8);

  return a5;
}

+ (void)loadDynamicSchemaFromDirectory:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_opt_new();
  objc_msgSend(a1, "_loadDynamicSchemaFromDirectory:into:", v4, v7);

  v5 = objc_msgSend(v7, "copy");
  v6 = (void *)_schemas;
  _schemas = v5;

}

+ (void)loadDynamicSchemaFromFiles:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "_loadDynamicSchemaFromFile:into:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10++), v5, (_QWORD)v13);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  v11 = objc_msgSend(v5, "copy");
  v12 = (void *)_schemas;
  _schemas = v11;

}

+ (void)_loadDynamicSchemaFromDirectory:(id)a3 into:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  objc_msgSend(v5, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentsOfDirectoryAtPath:error:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v16, "pathExtension");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("json"));

        if (v18)
        {
          objc_msgSend(v8, "URLByAppendingPathComponent:", v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_loadDynamicSchemaFromFile:into:", v19, v6);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }

}

+ (void)_loadDynamicSchemaFromFile:(id)a3 into:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v19 = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v6, 0, &v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v19;
  if (v8)
  {
    v18 = v9;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v8, 0, &v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v18;

    objc_msgSend(a1, "_loadDynamicSchemaFromDictionary:into:fileURL:", v10, v7, v6);
    v9 = v11;
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    +[RMModelConfigurationSchema _loadDynamicSchemaFromFile:into:].cold.1((uint64_t)v6, (uint64_t)v9, v12, v13, v14, v15, v16, v17);
  }

}

+ (void)_loadDynamicSchemaFromDictionary:(id)a3 into:(id)a4 fileURL:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v9 = a3;
  v10 = -[RMModelConfigurationSchema initFromDictionary:]([RMModelConfigurationSchema alloc], "initFromDictionary:", v9);

  if (v10)
  {
    objc_msgSend(v10, "configurationType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        +[RMModelConfigurationSchema _loadDynamicSchemaFromDictionary:into:fileURL:].cold.3(v10);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "configurationType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543362;
        v16 = v13;
        _os_log_impl(&dword_24510E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Loaded configuration schema: %{public}@", (uint8_t *)&v15, 0xCu);

      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        +[RMModelConfigurationSchema _loadDynamicSchemaFromDictionary:into:fileURL:].cold.2(v10);
      objc_msgSend(v10, "configurationType");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, v14);

    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    +[RMModelConfigurationSchema _loadDynamicSchemaFromDictionary:into:fileURL:].cold.1((uint64_t)v8);
  }

}

- (id)_parseAssetReferences:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  RMModelConfigurationSchemaAssetReference *v13;
  void *v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BOOL8 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)objc_opt_new();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v34;
      v32 = v3;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v34 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("asset-types"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("key-path"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            v23 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            if (v23)
              -[RMModelConfigurationSchema _parseAssetReferences:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);

            v14 = (void *)MEMORY[0x24BDBD1A8];
            v3 = v32;
            goto LABEL_18;
          }
          v13 = -[RMModelConfigurationSchemaAssetReference initWithAssetTypes:keyPath:]([RMModelConfigurationSchemaAssetReference alloc], "initWithAssetTypes:keyPath:", v11, v12);
          objc_msgSend(v4, "addObject:", v13);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        v3 = v32;
        if (v7)
          continue;
        break;
      }
    }

    v14 = (void *)objc_msgSend(v4, "copy");
LABEL_18:

  }
  else
  {
    v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v15)
      -[RMModelConfigurationSchema _parseAssetReferences:].cold.2(v15, v16, v17, v18, v19, v20, v21, v22);
    v14 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v14;
}

- (NSNumber)version
{
  return self->_version;
}

- (NSString)configurationType
{
  return self->_configurationType;
}

- (void)setConfigurationType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)assetReferences
{
  return self->_assetReferences;
}

- (void)setAssetReferences:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)supportedOS
{
  return self->_supportedOS;
}

- (void)setSupportedOS:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedOS, 0);
  objc_storeStrong((id *)&self->_assetReferences, 0);
  objc_storeStrong((id *)&self->_configurationType, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

+ (void)_loadDynamicSchemaFromFile:(uint64_t)a3 into:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_24510E000, MEMORY[0x24BDACB70], a3, "Could not read JSON data file: %{public}@ %{public}@", a5, a6, a7, a8, 2u);
}

+ (void)_loadDynamicSchemaFromDictionary:(uint64_t)a1 into:fileURL:.cold.1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138543362;
  v2 = a1;
  _os_log_error_impl(&dword_24510E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Could not read schema from JSON data file: %{public}@", (uint8_t *)&v1, 0xCu);
}

+ (void)_loadDynamicSchemaFromDictionary:(void *)a1 into:fileURL:.cold.2(void *a1)
{
  void *v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "configurationType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_24510E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Read schema for '%{public}@' from JSON data file: %{public}@", v2, 0x16u);

  OUTLINED_FUNCTION_2();
}

+ (void)_loadDynamicSchemaFromDictionary:(void *)a1 into:fileURL:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "configurationType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_24510E000, MEMORY[0x24BDACB70], v2, "Ignoring duplicate schema for '%{public}@' from JSON data file: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

- (void)_parseAssetReferences:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_24510E000, MEMORY[0x24BDACB70], a3, "Invalid asset-references", a5, a6, a7, a8, 0);
}

- (void)_parseAssetReferences:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_24510E000, MEMORY[0x24BDACB70], a3, "Missing asset-references", a5, a6, a7, a8, 0);
}

@end
