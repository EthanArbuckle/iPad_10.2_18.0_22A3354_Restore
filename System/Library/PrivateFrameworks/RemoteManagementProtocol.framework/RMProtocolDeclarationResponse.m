@implementation RMProtocolDeclarationResponse

+ (id)requestWithType:(id)a3 identifier:(id)a4 serverToken:(id)a5 payload:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setResponseType:", v12);

  objc_msgSend(v13, "setResponseIdentifier:", v11);
  objc_msgSend(v13, "setResponseServerToken:", v10);

  objc_msgSend(v13, "setResponsePayload:", v9);
  return v13;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8;
  BOOL v9;
  uint64_t v11;

  v8 = a3;
  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("Type"), CFSTR("responseType"), 1, 0, a5)&& -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("Identifier"), CFSTR("responseIdentifier"), 1, 0, a5)&& -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self,
         "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:",
         v8,
         CFSTR("ServerToken"),
         CFSTR("responseServerToken"),
         1,
         0,
         a5))
  {
    LOWORD(v11) = a4;
    v9 = -[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("Payload"), CFSTR("responsePayload"), objc_opt_class(), 1, 0, v11, a5);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)serializeWithType:(signed __int16)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  signed __int16 v13;

  v5 = (void *)objc_opt_new();
  -[RMProtocolDeclarationResponse responseType](self, "responseType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("Type"), v6, 1, 0);

  -[RMProtocolDeclarationResponse responseIdentifier](self, "responseIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("Identifier"), v7, 1, 0);

  -[RMProtocolDeclarationResponse responseServerToken](self, "responseServerToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("ServerToken"), v8, 1, 0);

  -[RMProtocolDeclarationResponse responsePayload](self, "responsePayload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __51__RMProtocolDeclarationResponse_serializeWithType___block_invoke;
  v12[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v13 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("Payload"), v9, v12, 1, 0);

  v10 = (void *)objc_msgSend(v5, "copy");
  return v10;
}

uint64_t __51__RMProtocolDeclarationResponse_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeWithType:", *(__int16 *)(a1 + 32));
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RMProtocolDeclarationResponse;
  v4 = -[RMModelPayloadBase copyWithZone:](&v14, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_responseType, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_responseIdentifier, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSString copy](self->_responseServerToken, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[RMModelAnyPayload copy](self->_responsePayload, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSString)responseType
{
  return self->_responseType;
}

- (void)setResponseType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)responseIdentifier
{
  return self->_responseIdentifier;
}

- (void)setResponseIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)responseServerToken
{
  return self->_responseServerToken;
}

- (void)setResponseServerToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (RMModelAnyPayload)responsePayload
{
  return self->_responsePayload;
}

- (void)setResponsePayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responsePayload, 0);
  objc_storeStrong((id *)&self->_responseServerToken, 0);
  objc_storeStrong((id *)&self->_responseIdentifier, 0);
  objc_storeStrong((id *)&self->_responseType, 0);
}

@end
