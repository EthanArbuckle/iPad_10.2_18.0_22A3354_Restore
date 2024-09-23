@implementation TGTextGenerationConfiguration

+ (NSUUID)defaultConfigurationUUID
{
  if (+[TGTextGenerationConfiguration defaultConfigurationUUID]::onceToken != -1)
    dispatch_once(&+[TGTextGenerationConfiguration defaultConfigurationUUID]::onceToken, &__block_literal_global_1);
  return (NSUUID *)(id)+[TGTextGenerationConfiguration defaultConfigurationUUID]::uuid;
}

void __57__TGTextGenerationConfiguration_defaultConfigurationUUID__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("45B6920D-B93B-4A91-815B-874312410EFB"));
  v1 = (void *)+[TGTextGenerationConfiguration defaultConfigurationUUID]::uuid;
  +[TGTextGenerationConfiguration defaultConfigurationUUID]::uuid = v0;

}

+ (id)defaultConfiguration
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  TGTextGenerationConfiguration *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  TGTextGenerationConfiguration *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v47;
  NSObject *v48;
  NSObject *obj;
  void *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[32];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("Configuration"), CFSTR("plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      +[TGTextGenerationConfiguration defaultConfigurationUUID](TGTextGenerationConfiguration, "defaultConfigurationUUID");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "UUIDString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKey:](v4, "objectForKey:", v5);
      v6 = objc_claimAutoreleasedReturnValue();

      v47 = (void *)v6;
      if (v50)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v7 = (void *)v6;
        else
          v7 = 0;
        v8 = v7;
        v48 = v8;
        if (v8)
        {
          -[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("resources"), v6);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[NSObject objectForKeyedSubscript:](v48, "objectForKeyedSubscript:", CFSTR("resources"));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v10 = 0;
          }

          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          obj = v10;
          v28 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
          if (v28)
          {
            v29 = *(_QWORD *)v53;
LABEL_25:
            v30 = 0;
            while (1)
            {
              if (*(_QWORD *)v53 != v29)
                objc_enumerationMutation(obj);
              v31 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v30);
              objc_opt_class();
              v32 = (objc_opt_isKindOfClass() & 1) != 0 ? (void *)v31 : 0;
              v33 = v32;
              if (!v33)
                break;
              v34 = v33;
              +[TGTextGenerationResource createWithResourceDict:](TGTextGenerationResource, "createWithResourceDict:", v33);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v35)
              {
                _nlpDefaultLog();
                v39 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                  +[TGTextGenerationConfiguration defaultConfiguration].cold.6((uint64_t)v34, v39, v40, v41, v42, v43, v44, v45);

LABEL_41:
                v17 = 0;
                v37 = obj;
                goto LABEL_42;
              }
              objc_msgSend(v51, "addObject:", v35);

              if (v28 == ++v30)
              {
                v28 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
                if (v28)
                  goto LABEL_25;
                goto LABEL_35;
              }
            }
            _nlpDefaultLog();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              v38 = objc_opt_class();
              +[TGTextGenerationConfiguration defaultConfiguration].cold.5(v31, v38, (uint64_t)v57);
            }
            goto LABEL_41;
          }
LABEL_35:

          v36 = [TGTextGenerationConfiguration alloc];
          +[TGTextGenerationConfiguration defaultConfigurationUUID](TGTextGenerationConfiguration, "defaultConfigurationUUID");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          +[TGTextGenerationDecodingPolicy defaultDecodingPolicy](TGTextGenerationDecodingPolicy, "defaultDecodingPolicy");
          v34 = objc_claimAutoreleasedReturnValue();
          v17 = -[TGTextGenerationConfiguration initWithUUID:resources:decodingPolicy:](v36, "initWithUUID:resources:decodingPolicy:", v37, v51, v34);
LABEL_42:

        }
        else
        {
          _nlpDefaultLog();
          obj = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
          {
            v27 = objc_opt_class();
            +[TGTextGenerationConfiguration defaultConfiguration].cold.4((uint64_t)v50, v27, (uint64_t)v57);
          }
          v17 = 0;
        }

      }
      else
      {
        _nlpDefaultLog();
        v25 = objc_claimAutoreleasedReturnValue();
        v48 = v25;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          +[TGTextGenerationConfiguration defaultConfiguration].cold.3((uint64_t)v4, v25, v26);
        v17 = 0;
      }

    }
    else
    {
      _nlpDefaultLog();
      v18 = objc_claimAutoreleasedReturnValue();
      v50 = v18;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        +[TGTextGenerationConfiguration defaultConfiguration].cold.2((uint64_t)v3, v18, v19, v20, v21, v22, v23, v24);
      v17 = 0;
    }

  }
  else
  {
    _nlpDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[TGTextGenerationConfiguration defaultConfiguration].cold.1((uint64_t)v2, v4, v11, v12, v13, v14, v15, v16);
    v17 = 0;
  }

  return v17;
}

+ (id)createWithUUID:(id)a3
{
  return 0;
}

- (TGTextGenerationConfiguration)initWithUUID:(id)a3 resources:(id)a4 decodingPolicy:(id)a5
{
  id v8;
  id v9;
  id v10;
  TGTextGenerationConfiguration *v11;
  uint64_t v12;
  NSUUID *uuid;
  uint64_t v14;
  NSSet *resources;
  uint64_t v16;
  TGTextGenerationDecodingPolicy *decodingPolicy;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)TGTextGenerationConfiguration;
  v11 = -[TGTextGenerationConfiguration init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    uuid = v11->_uuid;
    v11->_uuid = (NSUUID *)v12;

    v14 = objc_msgSend(v9, "copy");
    resources = v11->_resources;
    v11->_resources = (NSSet *)v14;

    v16 = objc_msgSend(v10, "copy");
    decodingPolicy = v11->_decodingPolicy;
    v11->_decodingPolicy = (TGTextGenerationDecodingPolicy *)v16;

  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TGTextGenerationConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  TGTextGenerationConfiguration *v8;

  v4 = [TGTextGenerationConfiguration alloc];
  -[TGTextGenerationConfiguration uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TGTextGenerationConfiguration resources](self, "resources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TGTextGenerationConfiguration decodingPolicy](self, "decodingPolicy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TGTextGenerationConfiguration initWithUUID:resources:decodingPolicy:](v4, "initWithUUID:resources:decodingPolicy:", v5, v6, v7);

  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  TGMutableTextGenerationConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  TGMutableTextGenerationConfiguration *v8;

  v4 = [TGMutableTextGenerationConfiguration alloc];
  -[TGTextGenerationConfiguration uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TGTextGenerationConfiguration resources](self, "resources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TGTextGenerationConfiguration decodingPolicy](self, "decodingPolicy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TGTextGenerationConfiguration initWithUUID:resources:decodingPolicy:](v4, "initWithUUID:resources:decodingPolicy:", v5, v6, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[TGTextGenerationConfiguration uuid](self, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[TGTextGenerationConfiguration resources](self, "resources");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "resources");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToSet:", v10))
      {
        -[TGTextGenerationConfiguration decodingPolicy](self, "decodingPolicy");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "decodingPolicy");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[TGTextGenerationConfiguration uuid](self, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hash");

  -[TGTextGenerationConfiguration resources](self, "resources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hash");

  -[TGTextGenerationConfiguration decodingPolicy](self, "decodingPolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("uuid");
  -[TGTextGenerationConfiguration uuid](self, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("resources");
  -[TGTextGenerationConfiguration resources](self, "resources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("decodingPolicy");
  -[TGTextGenerationConfiguration decodingPolicy](self, "decodingPolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (TGITextGenerationInferenceModelConfiguration)modelConfiguration
{
  void *v1;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  TGITextGenerationInferenceModelConfiguration *result;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  *((_QWORD *)&retstr[1].var0.var0.var0.var0.var1 + 2) = 0;
  *(_OWORD *)&retstr->var0.var0.var1.var0[1] = 0u;
  *(_OWORD *)retstr[1].var0.var0.var0.var0.var0.var0 = 0u;
  *(_OWORD *)retstr->var0.var0.var0.var0.var0.var0 = 0u;
  *((_OWORD *)&retstr->var0.var0.var0.var0.var1 + 1) = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v1, "resources", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v16;
    for (i = *(_QWORD *)v16; ; i = *(_QWORD *)v16)
    {
      if (i != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v5);
      if (objc_msgSend(v8, "type") == 1)
      {
        objc_msgSend(v8, "url");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "path");
        v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        std::string::__assign_external((std::string *)retstr, (const std::string::value_type *)objc_msgSend(v10, "UTF8String"));

        objc_msgSend(v8, "e5FunctionName");
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        std::string::__assign_external((std::string *)&retstr[1], (const std::string::value_type *)objc_msgSend(v11, "UTF8String"));

      }
      if (!objc_msgSend(v8, "type"))
      {
        objc_msgSend(v8, "url");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "path");
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        std::string::__assign_external((std::string *)&retstr->var0.var0.var1, (const std::string::value_type *)objc_msgSend(v13, "UTF8String"));

      }
      if (++v5 >= v4)
      {
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (!v4)
          break;
        v5 = 0;
      }
    }
  }

  return result;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (TGTextGenerationDecodingPolicy)decodingPolicy
{
  return (TGTextGenerationDecodingPolicy *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDecodingPolicy:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSSet)resources
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_decodingPolicy, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (void)defaultConfiguration
{
  OUTLINED_FUNCTION_0_1(&dword_247FA3000, a2, a3, "Failed to create resource with resource dict: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
