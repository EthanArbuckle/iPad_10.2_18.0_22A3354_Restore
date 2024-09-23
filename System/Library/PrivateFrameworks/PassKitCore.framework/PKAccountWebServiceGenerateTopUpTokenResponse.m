@implementation PKAccountWebServiceGenerateTopUpTokenResponse

- (PKAccountWebServiceGenerateTopUpTokenResponse)initWithData:(id)a3
{
  return -[PKAccountWebServiceGenerateTopUpTokenResponse initWithData:account:request:](self, "initWithData:account:request:", a3, 0, 0);
}

- (PKAccountWebServiceGenerateTopUpTokenResponse)initWithData:(id)a3 account:(id)a4 request:(id)a5
{
  id v7;
  PKAccountWebServiceGenerateTopUpTokenResponse *v8;
  PKAccountWebServiceGenerateTopUpTokenResponse *v9;
  void *v10;
  id v11;
  PKAppleBalanceInStoreTopUpToken *v12;
  void *v13;
  PKAppleBalanceInStoreTopUpToken *v14;
  objc_super v16;

  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PKAccountWebServiceGenerateTopUpTokenResponse;
  v8 = -[PKWebServiceResponse initWithData:](&v16, sel_initWithData_, a3);
  v9 = v8;
  if (v8)
  {
    -[PKWebServiceResponse JSONObject](v8, "JSONObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v10;
      v12 = [PKAppleBalanceInStoreTopUpToken alloc];
      objc_msgSend(v7, "accountIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[PKAppleBalanceInStoreTopUpToken initWithDictionary:accountIdentifier:](v12, "initWithDictionary:accountIdentifier:", v11, v13);

      if (PKVerifySignatureForInStoreTopUpToken(v14))
        objc_storeStrong((id *)&v9->_token, v14);

    }
  }

  return v9;
}

- (PKAppleBalanceInStoreTopUpToken)token
{
  return self->_token;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
}

@end
