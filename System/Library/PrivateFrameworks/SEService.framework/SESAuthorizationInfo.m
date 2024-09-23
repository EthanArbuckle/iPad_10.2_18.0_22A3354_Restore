@implementation SESAuthorizationInfo

+ (id)withState:(unsigned __int8)a3 remaningCount:(id)a4 remainingTime:(id)a5 publicKeyIdentifier:(id)a6 authorizationID:(id)a7 anonymizedDSID:(id)a8
{
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;

  v12 = a3;
  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = (void *)objc_opt_new();
  objc_msgSend(v18, "setState:", v12);
  objc_msgSend(v18, "setRemainingCount:", v17);

  objc_msgSend(v18, "setRemainingTime:", v16);
  objc_msgSend(v18, "setPublicKeyIdentifier:", v15);

  objc_msgSend(v18, "setAuthorizationID:", v14);
  objc_msgSend(v18, "setAnonymizedDSID:", v13);

  return v18;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("{\n\tstate : %d,\n"), -[SESAuthorizationInfo state](self, "state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SESAuthorizationInfo remainingCount](self, "remainingCount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tcount : %@,\n"), v4);

  -[SESAuthorizationInfo remainingTime](self, "remainingTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\ttime : %@,\n"), v5);

  -[SESAuthorizationInfo publicKeyIdentifier](self, "publicKeyIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tpkIdentifier : %@,\n"), v6);

  -[SESAuthorizationInfo authorizationID](self, "authorizationID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tauthorizationID : %@,\n"), v7);

  -[SESAuthorizationInfo anonymizedDSID](self, "anonymizedDSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tanonymizedDSID : %@,\n"), v8);

  objc_msgSend(v3, "appendFormat:", CFSTR("}"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[SESAuthorizationInfo state](self, "state"), CFSTR("state"));
  -[SESAuthorizationInfo remainingCount](self, "remainingCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("remainingCount"));

  -[SESAuthorizationInfo remainingTime](self, "remainingTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("remainingTime"));

  -[SESAuthorizationInfo publicKeyIdentifier](self, "publicKeyIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("publicKeyIdentifier"));

  -[SESAuthorizationInfo authorizationID](self, "authorizationID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("authorizationID"));

  -[SESAuthorizationInfo anonymizedDSID](self, "anonymizedDSID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("anonymizedDSID"));

}

- (SESAuthorizationInfo)initWithCoder:(id)a3
{
  id v4;
  SESAuthorizationInfo *v5;
  void *v6;
  uint64_t v7;
  NSNumber *remainingCount;
  void *v9;
  uint64_t v10;
  NSNumber *remainingTime;
  void *v12;
  uint64_t v13;
  NSData *publicKeyIdentifier;
  void *v15;
  uint64_t v16;
  NSData *authorizationID;
  void *v18;
  uint64_t v19;
  NSData *anonymizedDSID;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SESAuthorizationInfo;
  v5 = -[SESAuthorizationInfo init](&v22, sel_init);
  if (v5)
  {
    v5->_state = objc_msgSend(v4, "decodeIntForKey:", CFSTR("state"));
    -[SESAuthorizationInfo remainingCount](v5, "remainingCount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remainingCount"));
    v7 = objc_claimAutoreleasedReturnValue();
    remainingCount = v5->_remainingCount;
    v5->_remainingCount = (NSNumber *)v7;

    -[SESAuthorizationInfo remainingTime](v5, "remainingTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remainingTime"));
    v10 = objc_claimAutoreleasedReturnValue();
    remainingTime = v5->_remainingTime;
    v5->_remainingTime = (NSNumber *)v10;

    -[SESAuthorizationInfo publicKeyIdentifier](v5, "publicKeyIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("publicKeyIdentifier"));
    v13 = objc_claimAutoreleasedReturnValue();
    publicKeyIdentifier = v5->_publicKeyIdentifier;
    v5->_publicKeyIdentifier = (NSData *)v13;

    -[SESAuthorizationInfo authorizationID](v5, "authorizationID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authorizationID"));
    v16 = objc_claimAutoreleasedReturnValue();
    authorizationID = v5->_authorizationID;
    v5->_authorizationID = (NSData *)v16;

    -[SESAuthorizationInfo anonymizedDSID](v5, "anonymizedDSID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("anonymizedDSID"));
    v19 = objc_claimAutoreleasedReturnValue();
    anonymizedDSID = v5->_anonymizedDSID;
    v5->_anonymizedDSID = (NSData *)v19;

  }
  return v5;
}

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned __int8)a3
{
  self->_state = a3;
}

- (NSNumber)remainingCount
{
  return self->_remainingCount;
}

- (void)setRemainingCount:(id)a3
{
  objc_storeStrong((id *)&self->_remainingCount, a3);
}

- (NSNumber)remainingTime
{
  return self->_remainingTime;
}

- (void)setRemainingTime:(id)a3
{
  objc_storeStrong((id *)&self->_remainingTime, a3);
}

- (NSData)publicKeyIdentifier
{
  return self->_publicKeyIdentifier;
}

- (void)setPublicKeyIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_publicKeyIdentifier, a3);
}

- (NSData)authorizationID
{
  return self->_authorizationID;
}

- (void)setAuthorizationID:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationID, a3);
}

- (NSData)anonymizedDSID
{
  return self->_anonymizedDSID;
}

- (void)setAnonymizedDSID:(id)a3
{
  objc_storeStrong((id *)&self->_anonymizedDSID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anonymizedDSID, 0);
  objc_storeStrong((id *)&self->_authorizationID, 0);
  objc_storeStrong((id *)&self->_publicKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_remainingTime, 0);
  objc_storeStrong((id *)&self->_remainingCount, 0);
}

@end
