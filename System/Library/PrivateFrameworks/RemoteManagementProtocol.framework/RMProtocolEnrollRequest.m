@implementation RMProtocolEnrollRequest

+ (id)requestWithEnrollmentToken:(id)a3 statusItems:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setRequestEnrollmentToken:", v6);

  objc_msgSend(v7, "setRequestStatusItems:", v5);
  return v7;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8;
  BOOL v9;
  uint64_t v11;

  v8 = a3;
  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("EnrollmentToken"), CFSTR("requestEnrollmentToken"), 1, 0, a5))
  {
    LOWORD(v11) = a4;
    v9 = -[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("StatusItems"), CFSTR("requestStatusItems"), objc_opt_class(), 1, 0, v11, a5);
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
  _QWORD v10[4];
  signed __int16 v11;

  v5 = (void *)objc_opt_new();
  -[RMProtocolEnrollRequest requestEnrollmentToken](self, "requestEnrollmentToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("EnrollmentToken"), v6, 1, 0);

  -[RMProtocolEnrollRequest requestStatusItems](self, "requestStatusItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __45__RMProtocolEnrollRequest_serializeWithType___block_invoke;
  v10[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v11 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("StatusItems"), v7, v10, 1, 0);

  v8 = (void *)objc_msgSend(v5, "copy");
  return v8;
}

uint64_t __45__RMProtocolEnrollRequest_serializeWithType___block_invoke(uint64_t a1, void *a2)
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
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RMProtocolEnrollRequest;
  v4 = -[RMModelPayloadBase copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_requestEnrollmentToken, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[RMModelAnyPayload copy](self->_requestStatusItems, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSString)requestEnrollmentToken
{
  return self->_requestEnrollmentToken;
}

- (void)setRequestEnrollmentToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (RMModelAnyPayload)requestStatusItems
{
  return self->_requestStatusItems;
}

- (void)setRequestStatusItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestStatusItems, 0);
  objc_storeStrong((id *)&self->_requestEnrollmentToken, 0);
}

@end
