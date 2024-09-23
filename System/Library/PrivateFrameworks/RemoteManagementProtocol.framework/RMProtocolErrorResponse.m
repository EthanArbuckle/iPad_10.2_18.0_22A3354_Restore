@implementation RMProtocolErrorResponse

+ (id)requestWithCode:(id)a3 description:(id)a4 details:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setResponseCode:", v9);

  objc_msgSend(v10, "setResponseDescription:", v8);
  objc_msgSend(v10, "setResponseDetails:", v7);

  return v10;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8;
  BOOL v9;
  uint64_t v11;

  v8 = a3;
  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("Code"), CFSTR("responseCode"), 1, 0, a5))
  {
    v9 = 0;
    if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("Description"), CFSTR("responseDescription"), 0, 0, a5))
    {
      LOWORD(v11) = a4;
      v9 = -[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("Details"), CFSTR("responseDetails"), objc_opt_class(), 0, 0, v11, a5);
    }
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
  _QWORD v11[4];
  signed __int16 v12;

  v5 = (void *)objc_opt_new();
  -[RMProtocolErrorResponse responseCode](self, "responseCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("Code"), v6, 1, 0);

  -[RMProtocolErrorResponse responseDescription](self, "responseDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("Description"), v7, 0, 0);

  -[RMProtocolErrorResponse responseDetails](self, "responseDetails");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __45__RMProtocolErrorResponse_serializeWithType___block_invoke;
  v11[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v12 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("Details"), v8, v11, 0, 0);

  v9 = (void *)objc_msgSend(v5, "copy");
  return v9;
}

uint64_t __45__RMProtocolErrorResponse_serializeWithType___block_invoke(uint64_t a1, void *a2)
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)RMProtocolErrorResponse;
  v4 = -[RMModelPayloadBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_responseCode, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_responseDescription, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[RMModelAnyPayload copy](self->_responseDetails, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSString)responseCode
{
  return self->_responseCode;
}

- (void)setResponseCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)responseDescription
{
  return self->_responseDescription;
}

- (void)setResponseDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (RMModelAnyPayload)responseDetails
{
  return self->_responseDetails;
}

- (void)setResponseDetails:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDetails, 0);
  objc_storeStrong((id *)&self->_responseDescription, 0);
  objc_storeStrong((id *)&self->_responseCode, 0);
}

@end
