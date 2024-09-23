@implementation RMProtocolTokensResponse

+ (id)requestWithSyncTokens:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setResponseSyncTokens:", v3);

  return v4;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8;
  uint64_t v10;

  v8 = a3;
  LOWORD(v10) = a4;
  LOBYTE(a5) = -[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("SyncTokens"), CFSTR("responseSyncTokens"), objc_opt_class(), 1, 0, v10, a5);

  return (char)a5;
}

- (id)serializeWithType:(signed __int16)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  signed __int16 v10;

  v5 = (void *)objc_opt_new();
  -[RMProtocolTokensResponse responseSyncTokens](self, "responseSyncTokens");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__RMProtocolTokensResponse_serializeWithType___block_invoke;
  v9[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v10 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("SyncTokens"), v6, v9, 1, 0);

  v7 = (void *)objc_msgSend(v5, "copy");
  return v7;
}

uint64_t __46__RMProtocolTokensResponse_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RMProtocolTokensResponse;
  v4 = -[RMModelPayloadBase copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[RMProtocolSynchronizationTokens copy](self->_responseSyncTokens, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

- (RMProtocolSynchronizationTokens)responseSyncTokens
{
  return self->_responseSyncTokens;
}

- (void)setResponseSyncTokens:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseSyncTokens, 0);
}

@end
