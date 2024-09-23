@implementation SKInvitationPayload

- (SKInvitationPayload)initWithData:(id)a3 dateCreated:(id)a4
{
  id v7;
  id v8;
  SKInvitationPayload *v9;
  SKInvitationPayload *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SKInvitationPayload;
  v9 = -[SKInvitationPayload init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_payloadData, a3);
    objc_storeStrong((id *)&v10->_dateCreated, a4);
  }

  return v10;
}

+ (id)logger
{
  if (logger_onceToken_0 != -1)
    dispatch_once(&logger_onceToken_0, &__block_literal_global_0);
  return (id)logger__logger_0;
}

void __29__SKInvitationPayload_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "SKInvitationPayload");
  v1 = (void *)logger__logger_0;
  logger__logger_0 = (uint64_t)v0;

}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  -[SKInvitationPayload payloadDictionary](self, "payloadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_opt_class();
  if (v3)
  {
    -[SKInvitationPayload dateCreated](self, "dateCreated");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; payloadDictionary = \"%@\"; dateCreated = \"%@\">;"),
      v5,
      self,
      v3,
      v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SKInvitationPayload payloadData](self, "payloadData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKInvitationPayload dateCreated](self, "dateCreated");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; payloadData = \"%@\"; dateCreated = \"%@\">;"),
      v5,
      self,
      v6,
      v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *payloadData;
  id v5;

  payloadData = self->_payloadData;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", payloadData, CFSTR("payloadData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateCreated, CFSTR("dateCreated"));

}

- (SKInvitationPayload)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SKInvitationPayload *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payloadData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateCreated"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SKInvitationPayload initWithData:dateCreated:](self, "initWithData:dateCreated:", v5, v6);
  return v7;
}

- (NSData)payloadData
{
  return self->_payloadData;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
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
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_payloadData, 0);
}

- (SKInvitationPayload)initWithDictionary:(id)a3 dateCreated:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  SKInvitationPayload *v15;
  id v17;

  v6 = a4;
  if (a3)
  {
    v17 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", a3, 200, 0, &v17);
    a3 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v17;
    if (v7)
    {
      +[SKInvitationPayload logger](SKInvitationPayload, "logger");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[SKInvitationPayload(DictionaryPayloads) initWithDictionary:dateCreated:].cold.1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

    }
  }
  v15 = -[SKInvitationPayload initWithData:dateCreated:](self, "initWithData:dateCreated:", a3, v6);

  return v15;
}

- (NSDictionary)payloadDictionary
{
  SKInvitationPayload *v2;
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
  SKInvitationPayload *v15;
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

    -[SKInvitationPayload payloadData](v2, "payloadData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v17 = 0;
      objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v6, 0, 0, &v17);
      v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v7 = v17;
      if (v7)
      {
        +[SKInvitationPayload logger](SKInvitationPayload, "logger");
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
