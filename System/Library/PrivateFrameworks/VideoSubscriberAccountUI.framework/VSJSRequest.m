@implementation VSJSRequest

- (id)copyWithZone:(_NSZone *)a3
{
  VSJSRequest *v4;
  void *v5;
  VSJSRequest *v6;
  uint64_t v7;
  NSString *requestType;
  uint64_t v9;
  NSString *requestBody;
  uint64_t v11;
  NSString *currentAuthentication;
  uint64_t v13;
  NSString *appleVerificationToken;
  uint64_t v15;
  NSString *requestorVerificationToken;

  v4 = +[VSJSRequest allocWithZone:](VSJSRequest, "allocWithZone:", a3);
  -[IKJSObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[IKJSObject initWithAppContext:](v4, "initWithAppContext:", v5);

  v7 = -[NSString copy](self->_requestType, "copy");
  requestType = v6->_requestType;
  v6->_requestType = (NSString *)v7;

  v9 = -[NSString copy](self->_requestBody, "copy");
  requestBody = v6->_requestBody;
  v6->_requestBody = (NSString *)v9;

  v11 = -[NSString copy](self->_currentAuthentication, "copy");
  currentAuthentication = v6->_currentAuthentication;
  v6->_currentAuthentication = (NSString *)v11;

  v13 = -[NSString copy](self->_appleVerificationToken, "copy");
  appleVerificationToken = v6->_appleVerificationToken;
  v6->_appleVerificationToken = (NSString *)v13;

  v15 = -[NSString copy](self->_requestorVerificationToken, "copy");
  requestorVerificationToken = v6->_requestorVerificationToken;
  v6->_requestorVerificationToken = (NSString *)v15;

  return v6;
}

- (NSString)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)requestBody
{
  return self->_requestBody;
}

- (void)setRequestBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)currentAuthentication
{
  return self->_currentAuthentication;
}

- (void)setCurrentAuthentication:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)appleVerificationToken
{
  return self->_appleVerificationToken;
}

- (void)setAppleVerificationToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)requestorVerificationToken
{
  return self->_requestorVerificationToken;
}

- (void)setRequestorVerificationToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)attributeNames
{
  return self->_attributeNames;
}

- (void)setAttributeNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeNames, 0);
  objc_storeStrong((id *)&self->_requestorVerificationToken, 0);
  objc_storeStrong((id *)&self->_appleVerificationToken, 0);
  objc_storeStrong((id *)&self->_currentAuthentication, 0);
  objc_storeStrong((id *)&self->_requestBody, 0);
  objc_storeStrong((id *)&self->_requestType, 0);
}

@end
