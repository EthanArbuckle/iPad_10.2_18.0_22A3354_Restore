@implementation RMProtocolWellKnownResponse

+ (id)requestWithServers:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setResponseServers:", v3);

  return v4;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8;
  uint64_t v10;

  v8 = a3;
  LOWORD(v10) = a4;
  LOBYTE(a5) = -[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:classType:nested:isRequired:defaultValue:serializationType:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:classType:nested:isRequired:defaultValue:serializationType:error:", v8, CFSTR("Servers"), CFSTR("responseServers"), objc_opt_class(), 0, 1, 0, v10, a5);

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
  -[RMProtocolWellKnownResponse responseServers](self, "responseServers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__RMProtocolWellKnownResponse_serializeWithType___block_invoke;
  v9[3] = &__block_descriptor_34_e75___NSDictionary_16__0__RMProtocolWellKnownResponse_WellKnownResponseServer_8l;
  v10 = a3;
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v5, CFSTR("Servers"), v6, v9, 1, 0);

  v7 = (void *)objc_msgSend(v5, "copy");
  return v7;
}

uint64_t __49__RMProtocolWellKnownResponse_serializeWithType___block_invoke(uint64_t a1, void *a2)
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
  v8.super_class = (Class)RMProtocolWellKnownResponse;
  v4 = -[RMModelPayloadBase copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[NSArray copy](self->_responseServers, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

- (NSArray)responseServers
{
  return self->_responseServers;
}

- (void)setResponseServers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseServers, 0);
}

@end
