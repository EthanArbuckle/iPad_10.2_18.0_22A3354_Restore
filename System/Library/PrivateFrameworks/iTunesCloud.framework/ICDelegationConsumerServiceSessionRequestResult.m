@implementation ICDelegationConsumerServiceSessionRequestResult

- (ICDelegationConsumerServiceSessionRequestResult)initWithDelegateToken:(id)a3 storefrontIdentifier:(id)a4 resultError:(id)a5
{
  id v8;
  id v9;
  id v10;
  ICDelegationConsumerServiceSessionRequestResult *v11;
  uint64_t v12;
  ICDelegateToken *delegateToken;
  uint64_t v14;
  NSError *resultError;
  uint64_t v16;
  NSString *storefrontIdentifier;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ICDelegationConsumerServiceSessionRequestResult;
  v11 = -[ICDelegationConsumerServiceSessionRequestResult init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    delegateToken = v11->_delegateToken;
    v11->_delegateToken = (ICDelegateToken *)v12;

    v14 = objc_msgSend(v10, "copy");
    resultError = v11->_resultError;
    v11->_resultError = (NSError *)v14;

    v16 = objc_msgSend(v9, "copy");
    storefrontIdentifier = v11->_storefrontIdentifier;
    v11->_storefrontIdentifier = (NSString *)v16;

  }
  return v11;
}

- (ICDelegateToken)delegateToken
{
  return self->_delegateToken;
}

- (NSError)resultError
{
  return self->_resultError;
}

- (NSString)storefrontIdentifier
{
  return self->_storefrontIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefrontIdentifier, 0);
  objc_storeStrong((id *)&self->_resultError, 0);
  objc_storeStrong((id *)&self->_delegateToken, 0);
}

@end
