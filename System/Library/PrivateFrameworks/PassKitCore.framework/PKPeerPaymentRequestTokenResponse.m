@implementation PKPeerPaymentRequestTokenResponse

- (PKPeerPaymentRequestTokenResponse)initWithData:(id)a3
{
  return -[PKPeerPaymentRequestTokenResponse initWithData:deviceScoreIdentifier:](self, "initWithData:deviceScoreIdentifier:", a3, 0);
}

- (PKPeerPaymentRequestTokenResponse)initWithData:(id)a3 deviceScoreIdentifier:(id)a4
{
  id v6;
  PKPeerPaymentRequestTokenResponse *v7;
  PKPeerPaymentRequestTokenResponse *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  PKPeerPaymentRequestToken *v15;
  PKPeerPaymentRequestToken *requestToken;
  objc_class *v17;
  objc_class *v18;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PKPeerPaymentRequestTokenResponse;
  v7 = -[PKWebServiceResponse initWithData:](&v20, sel_initWithData_, a3);
  v8 = v7;
  if (v7)
  {
    -[PKWebServiceResponse JSONObject](v7, "JSONObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;
      v11 = -[NSObject PKBoolForKey:](v10, "PKBoolForKey:", CFSTR("success"));
      v8->_success = v11;
      if (v11)
      {
        -[NSObject PKStringForKey:](v10, "PKStringForKey:", CFSTR("requestToken"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject PKStringForKey:](v10, "PKStringForKey:", CFSTR("expiryDate"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        PKISO8601DateFromDateStringContainingFractionalSeconds(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[PKPeerPaymentRequestToken initWithRequestToken:deviceScoreIdentifier:expiryDate:]([PKPeerPaymentRequestToken alloc], "initWithRequestToken:deviceScoreIdentifier:expiryDate:", v12, v6, v14);
        requestToken = v8->_requestToken;
        v8->_requestToken = v15;

LABEL_7:
      }
    }
    else
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v22 = v12;
        v23 = 2114;
        v24 = v13;
        _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
        goto LABEL_7;
      }
    }

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentRequestTokenResponse)initWithCoder:(id)a3
{
  id v4;
  PKPeerPaymentRequestTokenResponse *v5;
  uint64_t v6;
  PKPeerPaymentRequestToken *requestToken;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentRequestTokenResponse;
  v5 = -[PKWebServiceResponse initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestToken"));
    v6 = objc_claimAutoreleasedReturnValue();
    requestToken = v5->_requestToken;
    v5->_requestToken = (PKPeerPaymentRequestToken *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentRequestTokenResponse;
  v4 = a3;
  -[PKWebServiceResponse encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_requestToken, CFSTR("requestToken"), v5.receiver, v5.super_class);

}

- (BOOL)success
{
  return self->_success;
}

- (PKPeerPaymentRequestToken)requestToken
{
  return self->_requestToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestToken, 0);
}

@end
