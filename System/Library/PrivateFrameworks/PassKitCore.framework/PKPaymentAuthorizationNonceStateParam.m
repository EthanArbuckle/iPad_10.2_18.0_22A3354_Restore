@implementation PKPaymentAuthorizationNonceStateParam

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

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PKPaymentAuthorizationNonceStateParam credential](self, "credential");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; credential: (%tu bytes)>"),
    v4,
    self,
    objc_msgSend(v5, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSData)credential
{
  return self->_credential;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evaluationResponse, 0);
  objc_storeStrong((id *)&self->_credential, 0);
}

@end
