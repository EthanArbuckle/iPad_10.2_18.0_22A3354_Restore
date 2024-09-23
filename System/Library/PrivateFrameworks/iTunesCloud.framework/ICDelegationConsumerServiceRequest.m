@implementation ICDelegationConsumerServiceRequest

- (ICDelegationConsumerServiceRequest)initWithUserIdentityDelegationAccountUUIDs:(id)a3 requestContext:(id)a4 timeoutInterval:(double)a5
{
  id v8;
  id v9;
  ICDelegationConsumerServiceRequest *v10;
  uint64_t v11;
  NSDictionary *userIdentityDelegationAccountUUIDs;
  uint64_t v13;
  ICRequestContext *requestContext;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ICDelegationConsumerServiceRequest;
  v10 = -[ICDelegationConsumerServiceRequest init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    userIdentityDelegationAccountUUIDs = v10->_userIdentityDelegationAccountUUIDs;
    v10->_userIdentityDelegationAccountUUIDs = (NSDictionary *)v11;

    v13 = objc_msgSend(v9, "copy");
    requestContext = v10->_requestContext;
    v10->_requestContext = (ICRequestContext *)v13;

    v10->_timeoutInterval = a5;
  }

  return v10;
}

- (ICRequestContext)requestContext
{
  return self->_requestContext;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (NSDictionary)userIdentityDelegationAccountUUIDs
{
  return self->_userIdentityDelegationAccountUUIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentityDelegationAccountUUIDs, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
}

@end
