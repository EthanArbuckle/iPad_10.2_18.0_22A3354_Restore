@implementation PKTransactionReceiptAuthorizationResponse

- (PKTransactionReceiptAuthorizationResponse)initWithData:(id)a3
{
  PKTransactionReceiptAuthorizationResponse *v3;
  PKTransactionReceiptAuthorizationResponse *v4;
  void *v5;
  uint64_t v6;
  NSString *authorizationToken;
  PKTransactionReceiptAuthorizationResponse *v8;
  PKTransactionReceiptAuthorizationResponse *v9;
  uint64_t v10;
  NSObject *p_super;
  objc_class *v12;
  void *v13;
  void *v14;
  id v15;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)PKTransactionReceiptAuthorizationResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v17, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "PKStringForKey:", CFSTR("authToken"));
      v6 = objc_claimAutoreleasedReturnValue();
      authorizationToken = v4->_authorizationToken;
      v4->_authorizationToken = (NSString *)v6;

      objc_msgSend(v5, "PKStringForKey:", CFSTR("signature"));
      v8 = (PKTransactionReceiptAuthorizationResponse *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (!v8)
      {
LABEL_9:

        return v4;
      }
      -[PKTransactionReceiptAuthorizationResponse pk_decodeURLBase64](v8, "pk_decodeURLBase64");
      v10 = objc_claimAutoreleasedReturnValue();
      p_super = &v4->_signature->super;
      v4->_signature = (NSData *)v10;
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v19 = v13;
        v20 = 2112;
        v21 = v14;
        v15 = v14;
        _os_log_impl(&dword_18FC92000, p_super, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);

      }
      v9 = v4;
      v4 = 0;
    }

    goto LABEL_9;
  }
  return v4;
}

- (NSString)authorizationToken
{
  return self->_authorizationToken;
}

- (NSData)signature
{
  return self->_signature;
}

- (NSString)conversationIdentifier
{
  return self->_conversationIdentifier;
}

- (void)setConversationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationIdentifier, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_authorizationToken, 0);
}

@end
