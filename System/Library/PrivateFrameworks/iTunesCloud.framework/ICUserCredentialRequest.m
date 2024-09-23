@implementation ICUserCredentialRequest

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (ICUserCredentialRequest)initWithIdentity:(id)a3 identityStore:(id)a4 clientInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  ICUserCredentialRequest *v11;
  uint64_t v12;
  ICUserIdentity *identity;
  uint64_t v14;
  ICClientInfo *clientInfo;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ICUserCredentialRequest;
  v11 = -[ICUserCredentialRequest init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    identity = v11->_identity;
    v11->_identity = (ICUserIdentity *)v12;

    objc_storeStrong((id *)&v11->_identityStore, a4);
    v14 = objc_msgSend(v10, "copy");
    clientInfo = v11->_clientInfo;
    v11->_clientInfo = (ICClientInfo *)v14;

    v11->_qualityOfService = 25;
    v11->_timeoutInterval = 30.0;
  }

  return v11;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (ICUserIdentity)identity
{
  return self->_identity;
}

- (ICUserIdentityStore)identityStore
{
  return self->_identityStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_identityStore, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p [%@]>"), objc_opt_class(), self, self->_identity);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithIdentity:identityStore:clientInfo:", self->_identity, self->_identityStore, self->_clientInfo);
  if (result)
  {
    *((_QWORD *)result + 4) = self->_qualityOfService;
    *((_QWORD *)result + 5) = *(_QWORD *)&self->_timeoutInterval;
  }
  return result;
}

- (ICClientInfo)clientInfo
{
  return self->_clientInfo;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

@end
