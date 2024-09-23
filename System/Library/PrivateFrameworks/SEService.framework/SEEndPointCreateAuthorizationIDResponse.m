@implementation SEEndPointCreateAuthorizationIDResponse

+ (id)withAuthorizationID:(id)a3 authorizationInterval:(double)a4 authorizationCount:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setAuthorizationID:", v7);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAuthorizationInterval:", v9);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAuthorizationCount:", v10);

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SEEndPointCreateAuthorizationIDResponse authorizationID](self, "authorizationID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asHexString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SEEndPointCreateAuthorizationIDResponse authorizationInterval](self, "authorizationInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SEEndPointCreateAuthorizationIDResponse authorizationCount](self, "authorizationCount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{\n\tauthorizationID : %@,\n\tauthorizationInterval : %@\n\tauthorizationCount : %@\n}"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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
  id v7;

  v4 = a3;
  -[SEEndPointCreateAuthorizationIDResponse authorizationID](self, "authorizationID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("authorizationID"));

  -[SEEndPointCreateAuthorizationIDResponse authorizationInterval](self, "authorizationInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("authorizationInterval"));

  -[SEEndPointCreateAuthorizationIDResponse authorizationCount](self, "authorizationCount");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("authorizationCount"));

}

- (SEEndPointCreateAuthorizationIDResponse)initWithCoder:(id)a3
{
  id v4;
  SEEndPointCreateAuthorizationIDResponse *v5;
  SEEndPointCreateAuthorizationIDResponse *v6;
  void *v7;
  uint64_t v8;
  NSData *authorizationID;
  void *v10;
  uint64_t v11;
  NSNumber *authorizationInterval;
  void *v13;
  uint64_t v14;
  NSNumber *authorizationCount;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SEEndPointCreateAuthorizationIDResponse;
  v5 = -[SEEndPointCreateAuthorizationIDResponse init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SEEndPointCreateAuthorizationIDResponse authorizationID](v5, "authorizationID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authorizationID"));
    v8 = objc_claimAutoreleasedReturnValue();
    authorizationID = v6->_authorizationID;
    v6->_authorizationID = (NSData *)v8;

    -[SEEndPointCreateAuthorizationIDResponse authorizationInterval](v6, "authorizationInterval");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authorizationInterval"));
    v11 = objc_claimAutoreleasedReturnValue();
    authorizationInterval = v6->_authorizationInterval;
    v6->_authorizationInterval = (NSNumber *)v11;

    -[SEEndPointCreateAuthorizationIDResponse authorizationCount](v6, "authorizationCount");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authorizationCount"));
    v14 = objc_claimAutoreleasedReturnValue();
    authorizationCount = v6->_authorizationCount;
    v6->_authorizationCount = (NSNumber *)v14;

  }
  return v6;
}

- (NSData)authorizationID
{
  return self->_authorizationID;
}

- (void)setAuthorizationID:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationID, a3);
}

- (NSNumber)authorizationInterval
{
  return self->_authorizationInterval;
}

- (void)setAuthorizationInterval:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationInterval, a3);
}

- (NSNumber)authorizationCount
{
  return self->_authorizationCount;
}

- (void)setAuthorizationCount:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationCount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationCount, 0);
  objc_storeStrong((id *)&self->_authorizationInterval, 0);
  objc_storeStrong((id *)&self->_authorizationID, 0);
}

@end
