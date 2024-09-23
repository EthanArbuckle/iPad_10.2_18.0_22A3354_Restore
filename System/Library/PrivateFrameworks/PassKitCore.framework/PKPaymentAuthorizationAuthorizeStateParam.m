@implementation PKPaymentAuthorizationAuthorizeStateParam

+ (id)paramWithCredential:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "param");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCredential:", v4);

  return v5;
}

+ (id)paramWithAuthenticatorEvaluationResponse:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "param");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEvaluationResponse:", v4);

  return v5;
}

+ (id)paramWithNonceParam:(id)a3 nonce:(id)a4 cryptogramType:(int64_t)a5 networkMerchantIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  objc_msgSend(a1, "param");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "credential");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCredential:", v14);

  objc_msgSend(v13, "setNonceData:", v11);
  objc_msgSend(v12, "evaluationResponse");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setEvaluationResponse:", v15);
  objc_msgSend(v13, "setCryptogramType:", a5);
  objc_msgSend(v13, "setNetworkMerchantIdentifier:", v10);

  return v13;
}

- (NSData)credential
{
  NSData *credential;

  credential = self->_credential;
  if (credential)
    return credential;
  -[PKAuthenticatorEvaluationResponse credential](self->_evaluationResponse, "credential");
  return (NSData *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PKPaymentAuthorizationAuthorizeStateParam credential](self, "credential");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; credential: (%tu bytes); nonce: %@; networkMerchantIdentifier: %@>"),
    v4,
    self,
    objc_msgSend(v5, "length"),
    self->_nonceData,
    self->_networkMerchantIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setCredential:(id)a3
{
  objc_storeStrong((id *)&self->_credential, a3);
}

- (PKAuthenticatorEvaluationResponse)evaluationResponse
{
  return self->_evaluationResponse;
}

- (void)setEvaluationResponse:(id)a3
{
  objc_storeStrong((id *)&self->_evaluationResponse, a3);
}

- (NSData)nonceData
{
  return self->_nonceData;
}

- (void)setNonceData:(id)a3
{
  objc_storeStrong((id *)&self->_nonceData, a3);
}

- (NSData)networkMerchantIdentifier
{
  return self->_networkMerchantIdentifier;
}

- (void)setNetworkMerchantIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_networkMerchantIdentifier, a3);
}

- (int64_t)cryptogramType
{
  return self->_cryptogramType;
}

- (void)setCryptogramType:(int64_t)a3
{
  self->_cryptogramType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkMerchantIdentifier, 0);
  objc_storeStrong((id *)&self->_nonceData, 0);
  objc_storeStrong((id *)&self->_evaluationResponse, 0);
  objc_storeStrong((id *)&self->_credential, 0);
}

@end
