@implementation RMModelStatusSchema

+ (NSDictionary)schemas
{
  return (NSDictionary *)(id)_schemas_0;
}

- (id)initFromDictionary:(id)a3
{
  id v4;
  RMModelStatusSchema *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  RMModelStatusSchema *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)RMModelStatusSchema;
  v5 = -[RMModelStatusSchema init](&v14, sel_init);
  if (!v5)
  {
LABEL_15:
    v12 = v5;
    goto LABEL_16;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("version"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v6, "intValue") != 1)
    goto LABEL_9;
  objc_storeStrong((id *)&v5->_version, v6);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status-type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_9:
    goto LABEL_10;
  }
  objc_storeStrong((id *)&v5->_statusType, v7);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("array-value"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5->_isArrayValue = objc_msgSend(v8, "BOOLValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("supported-os"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[RMModelSchemaParser loadSupportedOSFromDictionary:](RMModelSchemaParser, "loadSupportedOSFromDictionary:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_storeStrong((id *)&v5->_supportedOS, v10);
      v11 = 0;
    }
    else
    {
      v11 = 1;
    }

  }
  else
  {
    v11 = 1;
  }

  if (!v11)
    goto LABEL_15;
LABEL_10:
  v12 = 0;
LABEL_16:

  return v12;
}

- (BOOL)isSupportedForPlatform:(int64_t)a3 scope:(int64_t)a4
{
  void *v6;

  -[RMModelStatusSchema supportedOS](self, "supportedOS");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = +[RMModelPayloadUtilities isSupportedForPlatform:scope:supportedOS:](RMModelPayloadUtilities, "isSupportedForPlatform:scope:supportedOS:", a3, a4, v6);

  return a4;
}

- (BOOL)isSupportedForPlatform:(int64_t)a3 scope:(int64_t)a4 enrollmentType:(int64_t)a5
{
  void *v8;

  -[RMModelStatusSchema supportedOS](self, "supportedOS");
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
  v6 = (void *)_schemas_0;
  _schemas_0 = v5;

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
  v12 = (void *)_schemas_0;
  _schemas_0 = v11;

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
  v10 = -[RMModelStatusSchema initFromDictionary:]([RMModelStatusSchema alloc], "initFromDictionary:", v9);

  if (v10)
  {
    objc_msgSend(v10, "statusType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        +[RMModelStatusSchema _loadDynamicSchemaFromDictionary:into:fileURL:].cold.3(v10);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "statusType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543362;
        v16 = v13;
        _os_log_impl(&dword_24510E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Loaded status item schema: %{public}@", (uint8_t *)&v15, 0xCu);

      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        +[RMModelStatusSchema _loadDynamicSchemaFromDictionary:into:fileURL:].cold.2(v10);
      objc_msgSend(v10, "statusType");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, v14);

    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    +[RMModelConfigurationSchema _loadDynamicSchemaFromDictionary:into:fileURL:].cold.1((uint64_t)v8);
  }

}

- (NSNumber)version
{
  return self->_version;
}

- (NSString)statusType
{
  return self->_statusType;
}

- (void)setStatusType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isArrayValue
{
  return self->_isArrayValue;
}

- (void)setIsArrayValue:(BOOL)a3
{
  self->_isArrayValue = a3;
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
  objc_storeStrong((id *)&self->_statusType, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

+ (void)_loadDynamicSchemaFromDictionary:(void *)a1 into:fileURL:.cold.2(void *a1)
{
  void *v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "statusType");
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

  objc_msgSend(a1, "statusType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_24510E000, MEMORY[0x24BDACB70], v2, "Ignoring duplicate schema for '%{public}@' from JSON data file: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

@end
