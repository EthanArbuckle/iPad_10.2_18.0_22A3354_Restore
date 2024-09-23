@implementation RMProtocolSynchronizationTokens

+ (id)requestWithTimestamp:(id)a3 declarationsToken:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setTokensTimestamp:", v6);

  objc_msgSend(v7, "setTokensDeclarationsToken:", v5);
  return v7;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  BOOL v9;

  v6 = a4;
  v8 = a3;
  if (-[RMModelPayloadBase loadDateFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:serializationType:error:](self, "loadDateFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:serializationType:error:", v8, CFSTR("Timestamp"), CFSTR("tokensTimestamp"), 1, 0, v6, a5))
  {
    v9 = -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", v8, CFSTR("DeclarationsToken"), CFSTR("tokensDeclarationsToken"), 1, 0, a5);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)serializeWithType:(signed __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v5 = (void *)objc_opt_new();
  -[RMProtocolSynchronizationTokens tokensTimestamp](self, "tokensTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeDateIntoDictionary:usingKey:value:isRequired:defaultValue:serializationType:](self, "serializeDateIntoDictionary:usingKey:value:isRequired:defaultValue:serializationType:", v5, CFSTR("Timestamp"), v6, 1, 0, v3);

  -[RMProtocolSynchronizationTokens tokensDeclarationsToken](self, "tokensDeclarationsToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v5, CFSTR("DeclarationsToken"), v7, 1, 0);

  v8 = (void *)objc_msgSend(v5, "copy");
  return v8;
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
  v10.super_class = (Class)RMProtocolSynchronizationTokens;
  v4 = -[RMModelPayloadBase copyWithZone:](&v10, sel_copyWithZone_, a3);
  v5 = -[NSDate copy](self->_tokensTimestamp, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSString copy](self->_tokensDeclarationsToken, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

- (NSDate)tokensTimestamp
{
  return self->_tokensTimestamp;
}

- (void)setTokensTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)tokensDeclarationsToken
{
  return self->_tokensDeclarationsToken;
}

- (void)setTokensDeclarationsToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokensDeclarationsToken, 0);
  objc_storeStrong((id *)&self->_tokensTimestamp, 0);
}

@end
