@implementation RMProtocolEnrollResponse

+ (id)requestWithPushTopic:(id)a3 pushEnvironment:(id)a4 statusItems:(id)a5
{
  id v7;
  __CFString *v8;
  id v9;
  void *v10;
  const __CFString *v11;

  v7 = a5;
  v8 = (__CFString *)a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setResponsePushTopic:", v9);

  if (v8)
    v11 = v8;
  else
    v11 = CFSTR("production");
  objc_msgSend(v10, "setResponsePushEnvironment:", v11);

  objc_msgSend(v10, "setResponseStatusItems:", v7);
  return v10;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  id v7;
  BOOL v8;

  v7 = a3;
  if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("PushTopic"), CFSTR("responsePushTopic"), 1, 0, a5))
  {
    v8 = 0;
    if (-[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v7, CFSTR("PushEnvironment"), CFSTR("responsePushEnvironment"), 0, CFSTR("production"), a5))
    {
      v8 = -[RMModelPayloadBase loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:usingKey:forKeyPath:validator:isRequired:defaultValue:error:", v7, CFSTR("StatusItems"), CFSTR("responseStatusItems"), &__block_literal_global, 0, 0, a5);
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __71__RMProtocolEnrollResponse_loadFromDictionary_serializationType_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializeWithType:(signed __int16)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_opt_new();
  -[RMProtocolEnrollResponse responsePushTopic](self, "responsePushTopic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("PushTopic"), v5, 1, 0);

  -[RMProtocolEnrollResponse responsePushEnvironment](self, "responsePushEnvironment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("PushEnvironment"), v6, 0, CFSTR("production"));

  -[RMProtocolEnrollResponse responseStatusItems](self, "responseStatusItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:usingKey:value:itemSerializer:isRequired:defaultValue:", v4, CFSTR("StatusItems"), v7, &__block_literal_global_19, 0, 0);

  v8 = (void *)objc_msgSend(v4, "copy");
  return v8;
}

id __46__RMProtocolEnrollResponse_serializeWithType___block_invoke(uint64_t a1, void *a2)
{
  return a2;
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
  v12.super_class = (Class)RMProtocolEnrollResponse;
  v4 = -[RMModelPayloadBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_responsePushTopic, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_responsePushEnvironment, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSArray copy](self->_responseStatusItems, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  return v4;
}

- (NSString)responsePushTopic
{
  return self->_responsePushTopic;
}

- (void)setResponsePushTopic:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)responsePushEnvironment
{
  return self->_responsePushEnvironment;
}

- (void)setResponsePushEnvironment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)responseStatusItems
{
  return self->_responseStatusItems;
}

- (void)setResponseStatusItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseStatusItems, 0);
  objc_storeStrong((id *)&self->_responsePushEnvironment, 0);
  objc_storeStrong((id *)&self->_responsePushTopic, 0);
}

@end
