@implementation RMProtocolEnrollReferralResponse

+ (id)requestWithReferralBaseURL:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setResponseReferralBaseURL:", v3);

  return v4;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  return -[RMModelPayloadBase loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:](self, "loadStringFromDictionary:usingKey:forKeyPath:isRequired:defaultValue:error:", a3, CFSTR("ReferralBaseURL"), CFSTR("responseReferralBaseURL"), 1, 0, a5);
}

- (id)serializeWithType:(signed __int16)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_opt_new();
  -[RMProtocolEnrollReferralResponse responseReferralBaseURL](self, "responseReferralBaseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RMModelPayloadBase serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:](self, "serializeStringIntoDictionary:usingKey:value:isRequired:defaultValue:", v4, CFSTR("ReferralBaseURL"), v5, 1, 0);

  v6 = (void *)objc_msgSend(v4, "copy");
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RMProtocolEnrollReferralResponse;
  v4 = -[RMModelPayloadBase copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[NSString copy](self->_responseReferralBaseURL, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

- (NSString)responseReferralBaseURL
{
  return self->_responseReferralBaseURL;
}

- (void)setResponseReferralBaseURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseReferralBaseURL, 0);
}

@end
