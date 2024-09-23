@implementation PKTransactionReceiptRequest

- (PKTransactionReceiptRequest)initWithReceiptProviderURL:(id)a3 authorizationToken:(id)a4 signature:(id)a5 receiptIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PKTransactionReceiptRequest *v15;
  PKTransactionReceiptRequest *v16;
  uint64_t v17;
  NSString *authorizationToken;
  uint64_t v19;
  NSData *signature;
  uint64_t v21;
  NSString *receiptIdentifier;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PKTransactionReceiptRequest;
  v15 = -[PKOverlayableWebServiceRequest init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_receiptProviderURL, a3);
    v17 = objc_msgSend(v12, "copy");
    authorizationToken = v16->_authorizationToken;
    v16->_authorizationToken = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    signature = v16->_signature;
    v16->_signature = (NSData *)v19;

    v21 = objc_msgSend(v14, "copy");
    receiptIdentifier = v16->_receiptIdentifier;
    v16->_receiptIdentifier = (NSString *)v21;

  }
  return v16;
}

- (id)_urlRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSData *signature;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", self->_receiptProviderURL, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queryItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = v7;

  if (self->_authorizationToken)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("authorizationToken"), self->_authorizationToken);
    objc_msgSend(v8, "addObject:", v9);

  }
  if (self->_receiptIdentifier)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("receiptIdentifier"), self->_receiptIdentifier);
    objc_msgSend(v8, "addObject:", v10);

  }
  signature = self->_signature;
  if (signature)
  {
    -[NSData URLBase64EncodedString](signature, "URLBase64EncodedString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("signature"), v12);
    objc_msgSend(v8, "addObject:", v13);

  }
  objc_msgSend(v3, "setQueryItems:", v8);
  objc_msgSend(v3, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceRequest _murlRequestWithURL:](self, "_murlRequestWithURL:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHTTPMethod:", CFSTR("GET"));
  objc_msgSend(v15, "setValue:forHTTPHeaderField:", self->_conversationIdentifier, CFSTR("x-conversation-id"));
  v16 = (void *)objc_msgSend(v15, "copy");

  return v16;
}

- (NSURL)receiptProviderURL
{
  return self->_receiptProviderURL;
}

- (NSString)authorizationToken
{
  return self->_authorizationToken;
}

- (NSData)signature
{
  return self->_signature;
}

- (NSString)receiptIdentifier
{
  return self->_receiptIdentifier;
}

- (NSString)conversationIdentifier
{
  return self->_conversationIdentifier;
}

- (void)setConversationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationIdentifier, 0);
  objc_storeStrong((id *)&self->_receiptIdentifier, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_authorizationToken, 0);
  objc_storeStrong((id *)&self->_receiptProviderURL, 0);
}

@end
