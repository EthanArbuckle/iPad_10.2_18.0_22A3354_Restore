@implementation SKStatusPayload

- (SKStatusPayload)initWithData:(id)a3
{
  id v5;
  SKStatusPayload *v6;
  SKStatusPayload *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKStatusPayload;
  v6 = -[SKStatusPayload init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_payloadData, a3);

  return v7;
}

+ (id)logger
{
  if (logger_onceToken_4 != -1)
    dispatch_once(&logger_onceToken_4, &__block_literal_global_4);
  return (id)logger__logger_4;
}

void __25__SKStatusPayload_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "SKStatusPayload");
  v1 = (void *)logger__logger_4;
  logger__logger_4 = (uint64_t)v0;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_payloadData, CFSTR("payloadData"));
}

- (SKStatusPayload)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  SKStatusPayload *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payloadData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SKStatusPayload initWithData:](self, "initWithData:", v5);
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

  -[SKStatusPayload payloadDictionary](self, "payloadDictionary");
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
    -[SKStatusPayload payloadData](self, "payloadData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; payloadData = \"%@\">;"), v6, self, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
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

- (SKStatusPayload)initWithDictionary:(id)a3
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
  SKStatusPayload *v13;
  id v15;

  if (a3)
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", a3, 200, 0, &v15);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v15;
    if (v5)
    {
      +[SKStatusPayload logger](SKStatusPayload, "logger");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[SKInvitationPayload(DictionaryPayloads) initWithDictionary:dateCreated:].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

    }
  }
  else
  {
    v4 = 0;
  }
  v13 = -[SKStatusPayload initWithData:](self, "initWithData:", v4);

  return v13;
}

- (NSDictionary)payloadDictionary
{
  SKStatusPayload *v2;
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
  SKStatusPayload *v15;
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

    -[SKStatusPayload payloadData](v2, "payloadData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v17 = 0;
      objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v6, 0, 0, &v17);
      v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v7 = v17;
      if (v7)
      {
        +[SKStatusPayload logger](SKStatusPayload, "logger");
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[SKInvitationPayload(DictionaryPayloads) payloadDictionary].cold.1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

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
