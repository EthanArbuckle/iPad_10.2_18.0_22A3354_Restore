@implementation UVPropertyList

- (UVPropertyList)initWithDictionary:(id)a3
{
  id v5;
  UVPropertyList *v6;
  UVPropertyList *v7;
  NSData *data;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UVPropertyList;
  v6 = -[UVPropertyList init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dictionary, a3);
    data = v7->_data;
    v7->_data = 0;

  }
  return v7;
}

- (UVPropertyList)initWithData:(id)a3
{
  id v5;
  UVPropertyList *v6;
  UVPropertyList *v7;
  NSDictionary *dictionary;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UVPropertyList;
  v6 = -[UVPropertyList init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    dictionary = v6->_dictionary;
    v6->_dictionary = 0;

    objc_storeStrong((id *)&v7->_data, a3);
  }

  return v7;
}

- (NSDictionary)dictionary
{
  NSDictionary *dictionary;
  NSData *data;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char isKindOfClass;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  dictionary = self->_dictionary;
  if (dictionary)
    return dictionary;
  data = self->_data;
  v25 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", data, 0, 0, &v25);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v25;
  if (v5)
  {
    objc_opt_class();
    objc_opt_class();
    v7 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      objc_msgSend(v7, "allKeys");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v27;
        while (2)
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v27 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v12);
            if ((objc_opt_isKindOfClass() & 1) == 0
              || (objc_msgSend(v7, "objectForKey:", v13),
                  v14 = (void *)objc_claimAutoreleasedReturnValue(),
                  isKindOfClass = objc_opt_isKindOfClass(),
                  v14,
                  (isKindOfClass & 1) == 0))
            {

              goto LABEL_20;
            }
            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          if (v10)
            continue;
          break;
        }
      }

    }
    else
    {

LABEL_20:
      UVLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[UVPropertyList dictionary].cold.2(v23);

      objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
      v24 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v24;
    }
  }
  else
  {
    UVLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[UVPropertyList dictionary].cold.1((uint64_t)v6, v16, v17, v18, v19, v20, v21, v22);

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (NSDictionary *)v7;
}

- (NSData)data
{
  NSData *data;
  NSDictionary *dictionary;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  data = self->_data;
  if (data)
    return data;
  dictionary = self->_dictionary;
  v14 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", dictionary, 200, 0, &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v14;
  if (!v5)
  {
    UVLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[UVPropertyList data].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSData *)v5;
}

- (void)_encodeWithAnyCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UVPropertyList data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("data"));

}

- (id)_initWithAnyCoder:(id)a3
{
  id v4;
  void *v5;
  UVPropertyList *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("UVPropertyList missing serialization"));
  v6 = -[UVPropertyList initWithData:](self, "initWithData:", v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeToXpcDictionary:(id)a3
{
  id v4;
  UVRawXPCCoder *v5;

  v4 = a3;
  v5 = -[UVRawXPCCoder initWithXpcDictionary:]([UVRawXPCCoder alloc], "initWithXpcDictionary:", v4);

  -[UVPropertyList _encodeWithAnyCoder:](self, "_encodeWithAnyCoder:", v5);
}

- (UVPropertyList)initWithXpcDictionary:(id)a3
{
  id v4;
  UVRawXPCDecoder *v5;
  UVPropertyList *v6;

  v4 = a3;
  v5 = -[UVRawXPCDecoder initWithXpcDictionary:]([UVRawXPCDecoder alloc], "initWithXpcDictionary:", v4);
  v6 = -[UVPropertyList _initWithAnyCoder:](self, "_initWithAnyCoder:", v5);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

- (void)dictionary
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_230AE1000, log, OS_LOG_TYPE_ERROR, "UVPropertyList data did not deserialize to a [String: Any] dictionary", v1, 2u);
}

- (void)data
{
  OUTLINED_FUNCTION_0(&dword_230AE1000, a2, a3, "UVPropertyList dictionary could not be serialized: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithXpcDictionary:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_230AE1000, a2, a3, "UVPropertyList XPC dictionary could not be serialized: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
