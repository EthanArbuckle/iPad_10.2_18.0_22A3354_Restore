@implementation POWSTrustResponse

- (BOOL)isCredentialFault
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;

  if (!-[POWSTrustResponse isFault](self, "isFault"))
    return 0;
  -[POWSTrustResponse faultSubCodeValue](self, "faultSubCodeValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[POWSTrustResponse securityExtensionPrefix](self, "securityExtensionPrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@:FailedAuthentication"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", v6) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    -[POWSTrustResponse faultSubCodeValue](self, "faultSubCodeValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "hasSuffix:", CFSTR("FailedAuthentication"));

  }
  return v7;
}

- (BOOL)isFault
{
  return self->_fault;
}

- (void)setFault:(BOOL)a3
{
  self->_fault = a3;
}

- (NSString)faultReason
{
  return self->_faultReason;
}

- (void)setFaultReason:(id)a3
{
  objc_storeStrong((id *)&self->_faultReason, a3);
}

- (NSString)faultCodeValue
{
  return self->_faultCodeValue;
}

- (void)setFaultCodeValue:(id)a3
{
  objc_storeStrong((id *)&self->_faultCodeValue, a3);
}

- (NSString)faultSubCodeValue
{
  return self->_faultSubCodeValue;
}

- (void)setFaultSubCodeValue:(id)a3
{
  objc_storeStrong((id *)&self->_faultSubCodeValue, a3);
}

- (NSString)endpointURN
{
  return self->_endpointURN;
}

- (void)setEndpointURN:(id)a3
{
  objc_storeStrong((id *)&self->_endpointURN, a3);
}

- (NSString)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
  objc_storeStrong((id *)&self->_nonce, a3);
}

- (NSString)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_assertion, a3);
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (void)setKeyIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_keyIdentifier, a3);
}

- (NSString)tokenType
{
  return self->_tokenType;
}

- (void)setTokenType:(id)a3
{
  objc_storeStrong((id *)&self->_tokenType, a3);
}

- (NSDate)created
{
  return self->_created;
}

- (void)setCreated:(id)a3
{
  objc_storeStrong((id *)&self->_created, a3);
}

- (NSDate)expires
{
  return self->_expires;
}

- (void)setExpires:(id)a3
{
  objc_storeStrong((id *)&self->_expires, a3);
}

- (NSDate)tokenExpires
{
  return self->_tokenExpires;
}

- (void)setTokenExpires:(id)a3
{
  objc_storeStrong((id *)&self->_tokenExpires, a3);
}

- (NSString)securityExtensionPrefix
{
  return self->_securityExtensionPrefix;
}

- (void)setSecurityExtensionPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_securityExtensionPrefix, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_securityExtensionPrefix, 0);
  objc_storeStrong((id *)&self->_tokenExpires, 0);
  objc_storeStrong((id *)&self->_expires, 0);
  objc_storeStrong((id *)&self->_created, 0);
  objc_storeStrong((id *)&self->_tokenType, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_endpointURN, 0);
  objc_storeStrong((id *)&self->_faultSubCodeValue, 0);
  objc_storeStrong((id *)&self->_faultCodeValue, 0);
  objc_storeStrong((id *)&self->_faultReason, 0);
}

@end
