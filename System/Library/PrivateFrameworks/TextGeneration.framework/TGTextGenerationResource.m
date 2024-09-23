@implementation TGTextGenerationResource

+ (id)createWithResourceDict:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  TGMutableTextGenerationResource *v12;
  NSObject *v14;
  NSObject *v15;
  TGMutableTextGenerationResource *v16;
  void *v17;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("path"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("path"));
    v5 = objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
        v7 = objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          v8 = -[NSObject intValue](v7, "intValue");
          v9 = (int)v8;
          if (v8 < 2)
          {
            objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("e5FunctionName"));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("e5FunctionName"));
              v11 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v11 = 0;
            }

            if ((_DWORD)v9 != 1 || v11)
            {
              v16 = [TGMutableTextGenerationResource alloc];
              objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v5);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = -[TGTextGenerationResource initWithType:url:](v16, "initWithType:url:", v9, v17);

              -[TGTextGenerationResource setE5FunctionName:](v12, "setE5FunctionName:", v11);
            }
            else
            {
              _nlpDefaultLog();
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
                +[TGTextGenerationResource createWithResourceDict:].cold.3();

              v12 = 0;
            }

            goto LABEL_16;
          }
          _nlpDefaultLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            +[TGTextGenerationResource createWithResourceDict:].cold.4((uint64_t)v3, v9, v14);

LABEL_15:
          v12 = 0;
LABEL_16:

          goto LABEL_17;
        }
      }
      else
      {

      }
      _nlpDefaultLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        +[TGTextGenerationResource createWithResourceDict:].cold.2();
      goto LABEL_15;
    }
  }
  else
  {

  }
  _nlpDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    +[TGTextGenerationResource createWithResourceDict:].cold.1();
  v12 = 0;
LABEL_17:

  return v12;
}

- (TGTextGenerationResource)initWithType:(unint64_t)a3 url:(id)a4
{
  id v6;
  TGTextGenerationResource *v7;
  TGTextGenerationResource *v8;
  uint64_t v9;
  NSURL *url;
  unint64_t type;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  NSString *description;
  objc_super v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)TGTextGenerationResource;
  v7 = -[TGTextGenerationResource init](&v17, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    v9 = objc_msgSend(v6, "copy");
    url = v8->_url;
    v8->_url = (NSURL *)v9;

    v18[0] = CFSTR("type");
    type = v8->_type;
    if (type == 1)
    {
      v12 = CFSTR("Foundation Language Model");
    }
    else if (type)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown resource type: %d"), v8->_type);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = CFSTR("Sentence Piece Tokenizer");
    }
    v18[1] = CFSTR("url");
    v19[0] = v12;
    v19[1] = v8->_url;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "description");
    v14 = objc_claimAutoreleasedReturnValue();
    description = v8->_description;
    v8->_description = (NSString *)v14;

  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TGTextGenerationResource *v4;
  unint64_t v5;
  void *v6;
  TGTextGenerationResource *v7;
  void *v8;

  v4 = [TGTextGenerationResource alloc];
  v5 = -[TGTextGenerationResource type](self, "type");
  -[TGTextGenerationResource url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TGTextGenerationResource initWithType:url:](v4, "initWithType:url:", v5, v6);

  -[TGTextGenerationResource e5FunctionName](self, "e5FunctionName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TGTextGenerationResource setE5FunctionName:](v7, "setE5FunctionName:", v8);

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  TGMutableTextGenerationResource *v4;
  unint64_t v5;
  void *v6;
  TGMutableTextGenerationResource *v7;
  void *v8;

  v4 = [TGMutableTextGenerationResource alloc];
  v5 = -[TGTextGenerationResource type](self, "type");
  -[TGTextGenerationResource url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TGTextGenerationResource initWithType:url:](v4, "initWithType:url:", v5, v6);

  -[TGTextGenerationResource e5FunctionName](self, "e5FunctionName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TGTextGenerationResource setE5FunctionName:](v7, "setE5FunctionName:", v8);

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[TGTextGenerationResource type](self, "type");
  -[TGTextGenerationResource url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  -[TGTextGenerationResource e5FunctionName](self, "e5FunctionName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6 && (v7 = -[TGTextGenerationResource type](self, "type"), v7 == objc_msgSend(v6, "type")))
  {
    -[TGTextGenerationResource url](self, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqual:", v9))
    {
      -[TGTextGenerationResource e5FunctionName](self, "e5FunctionName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "e5FunctionName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = TGTextGenerationEqualAllowingNil(v10, v11);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  return objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)type
{
  return self->_type;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)e5FunctionName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setE5FunctionName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_e5FunctionName, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

+ (void)createWithResourceDict:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_247FA3000, v0, v1, "Missing path key: %@ in config dictionary: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)createWithResourceDict:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_247FA3000, v0, v1, "Missing type key: %@ in config dictionary: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)createWithResourceDict:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_247FA3000, v0, v1, "Missing E5 function name key: %@ in configuration: %@ for foundation model", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)createWithResourceDict:(os_log_t)log .cold.4(uint64_t a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_247FA3000, log, OS_LOG_TYPE_ERROR, "Invalid type: %d for resource type in config dictionary: %@", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_2();
}

@end
