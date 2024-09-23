@implementation RMModelStatusReason

+ (NSSet)allowedStatusKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("code");
  v6[1] = CFSTR("description");
  v6[2] = CFSTR("details");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithCode:(id)a3 description:(id)a4 details:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setStatusCode:", v9);

  objc_msgSend(v10, "setStatusDescription:", v8);
  objc_msgSend(v10, "setStatusDetails:", v7);

  return v10;
}

+ (id)buildRequiredOnlyWithCode:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setStatusCode:", v3);

  return v4;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  uint64_t v16;

  v8 = a3;
  v9 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v8, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[RMModelStatusReason allowedStatusKeys](RMModelStatusReason, "allowedStatusKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minusSet:", v12);

  v13 = (void *)objc_msgSend(v11, "copy");
  -[RMModelPayloadBase setUnknownPayloadKeys:](self, "setUnknownPayloadKeys:", v13);

  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("code"), CFSTR("statusCode"), 1, 0, a5))
  {
    v14 = 0;
    if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("description"), CFSTR("statusDescription"), 0, 0, a5))
    {
      LOWORD(v16) = a4;
      v14 = -[RMModelPayloadBase loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:](self, "loadDictionaryFromDictionary:usingKey:forKeyPath:classType:isRequired:defaultValue:serializationType:error:", v8, CFSTR("details"), CFSTR("statusDetails"), objc_opt_class(), 0, 0, v16, a5);
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
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
  -[RMModelStatusReason statusCode](self, "statusCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("code"), v6, 1, 0);

  -[RMModelStatusReason statusDescription](self, "statusDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("description"), v7, 0, 0);

  -[RMModelStatusReason statusDetails](self, "statusDetails");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __41__RMModelStatusReason_serializeWithType___block_invoke;
  v11[3] = &__block_descriptor_34_e42___NSDictionary_16__0__RMModelPayloadBase_8l;
  v12 = a3;
  -[RMModelPayloadBase serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:usingKey:value:dictSerializer:isRequired:defaultValue:", v5, CFSTR("details"), v8, v11, 0, 0);

  v9 = (void *)objc_msgSend(v5, "copy");
  return v9;
}

uint64_t __41__RMModelStatusReason_serializeWithType___block_invoke(uint64_t a1, void *a2)
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
  v12.super_class = (Class)RMModelStatusReason;
  v4 = -[RMModelPayloadBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_statusCode, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_statusDescription, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[RMModelAnyPayload copy](self->_statusDetails, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSString)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)statusDescription
{
  return self->_statusDescription;
}

- (void)setStatusDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (RMModelAnyPayload)statusDetails
{
  return self->_statusDetails;
}

- (void)setStatusDetails:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusDetails, 0);
  objc_storeStrong((id *)&self->_statusDescription, 0);
  objc_storeStrong((id *)&self->_statusCode, 0);
}

@end
