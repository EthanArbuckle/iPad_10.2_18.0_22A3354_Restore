@implementation SKPresencePayload

- (SKPresencePayload)initWithData:(id)a3
{
  id v4;
  SKPresencePayload *v5;
  uint64_t v6;
  NSData *payloadData;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKPresencePayload;
  v5 = -[SKPresencePayload init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    payloadData = v5->_payloadData;
    v5->_payloadData = (NSData *)v6;

  }
  return v5;
}

+ (id)logger
{
  if (logger_onceToken != -1)
    dispatch_once(&logger_onceToken, &__block_literal_global);
  return (id)logger__logger;
}

void __27__SKPresencePayload_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "SKPresencePayload");
  v1 = (void *)logger__logger;
  logger__logger = (uint64_t)v0;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_payloadData, CFSTR("payload"));
}

- (SKPresencePayload)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  SKPresencePayload *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payload"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SKPresencePayload initWithData:](self, "initWithData:", v5);
  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  -[SKPresencePayload payloadDictionary](self, "payloadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_opt_class();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; payloadDictionary = \"%@\">;"), v5, self, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SKPresencePayload payloadData](self, "payloadData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; payloadData = \"%@\">;"), v6, self, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[SKPresencePayload payloadData](self, "payloadData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

    }
    else
    {
      objc_msgSend(v5, "payloadData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        v7 = 1;
        goto LABEL_7;
      }
    }
    -[SKPresencePayload payloadData](self, "payloadData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "payloadData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "isEqualToData:", v10);

LABEL_7:
    goto LABEL_8;
  }
  v7 = 0;
LABEL_8:

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  const void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unsigned __int8 md[32];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[SKPresencePayload payloadData](self, "payloadData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[SKPresencePayload payloadData](self, "payloadData");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const void *)objc_msgSend(v4, "bytes");
  -[SKPresencePayload payloadData](self, "payloadData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CC_SHA256(v5, objc_msgSend(v6, "length"), md);

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", md, 32);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SKPresencePayload *v4;
  void *v5;
  SKPresencePayload *v6;

  v4 = +[SKPresencePayload allocWithZone:](SKPresencePayload, "allocWithZone:", a3);
  -[SKPresencePayload payloadData](self, "payloadData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SKPresencePayload initWithData:](v4, "initWithData:", v5);

  return v6;
}

- (NSData)payloadData
{
  return self->_payloadData;
}

- (NSDictionary)cachedPayloadDictionary
{
  return self->_cachedPayloadDictionary;
}

- (void)setCachedPayloadDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_cachedPayloadDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPayloadDictionary, 0);
  objc_storeStrong((id *)&self->_payloadData, 0);
}

- (SKPresencePayload)initWithDictionary:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKPresencePayload *v13;
  id v15;

  if (a3)
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", a3, 200, 0, &v15);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v15;
    if (v5)
    {
      +[SKPresencePayload logger](SKPresencePayload, "logger");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[SKPresencePayload(DictionaryPayloads) initWithDictionary:].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

    }
  }
  else
  {
    v4 = 0;
  }
  v13 = -[SKPresencePayload initWithData:](self, "initWithData:", v4);

  return v13;
}

- (NSDictionary)payloadDictionary
{
  SKPresencePayload *v2;
  NSDictionary *cachedPayloadDictionary;
  id *p_cachedPayloadDictionary;
  NSDictionary *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  SKPresencePayload *v15;
  id v17;

  v2 = self;
  objc_sync_enter(v2);
  p_cachedPayloadDictionary = (id *)&v2->_cachedPayloadDictionary;
  cachedPayloadDictionary = v2->_cachedPayloadDictionary;
  if (cachedPayloadDictionary)
  {
    v5 = cachedPayloadDictionary;
    objc_sync_exit(v2);

  }
  else
  {
    objc_sync_exit(v2);

    -[SKPresencePayload payloadData](v2, "payloadData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v17 = 0;
      objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v6, 0, 0, &v17);
      v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v7 = v17;
      if (v7)
      {
        +[SKPresencePayload logger](SKPresencePayload, "logger");
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[SKPresencePayload(DictionaryPayloads) payloadDictionary].cold.1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

      }
    }
    else
    {
      v5 = 0;
    }
    v15 = v2;
    objc_sync_enter(v15);
    objc_storeStrong(p_cachedPayloadDictionary, v5);
    objc_sync_exit(v15);

  }
  return v5;
}

@end
