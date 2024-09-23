@implementation VSApplicationControllerRequest

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)authenticationToken
{
  return self->_authenticationToken;
}

- (void)setAuthenticationToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)SAMLRequest
{
  return self->_SAMLRequest;
}

- (void)setSAMLRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)attributeNames
{
  return self->_attributeNames;
}

- (void)setAttributeNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)requestorVerificationToken
{
  return self->_requestorVerificationToken;
}

- (void)setRequestorVerificationToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestorVerificationToken, 0);
  objc_storeStrong((id *)&self->_attributeNames, 0);
  objc_storeStrong((id *)&self->_SAMLRequest, 0);
  objc_storeStrong((id *)&self->_authenticationToken, 0);
}

@end
