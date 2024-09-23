@implementation PKMerchantToken

- (PKMerchantToken)initWithMerchantTokenId:(id)a3 appleMerchantId:(id)a4 merchantName:(id)a5 merchantIconURL:(id)a6 merchantTokenManagementURL:(id)a7 tokenCategory:(id)a8 isDeferredPayment:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  PKMerchantToken *v21;
  uint64_t v22;
  NSString *merchantTokenId;
  uint64_t v24;
  NSString *appleMerchantId;
  uint64_t v26;
  NSString *merchantName;
  uint64_t v28;
  NSString *tokenCategory;
  objc_super v31;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v31.receiver = self;
  v31.super_class = (Class)PKMerchantToken;
  v21 = -[PKMerchantToken init](&v31, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v15, "copy");
    merchantTokenId = v21->_merchantTokenId;
    v21->_merchantTokenId = (NSString *)v22;

    v24 = objc_msgSend(v16, "copy");
    appleMerchantId = v21->_appleMerchantId;
    v21->_appleMerchantId = (NSString *)v24;

    v26 = objc_msgSend(v17, "copy");
    merchantName = v21->_merchantName;
    v21->_merchantName = (NSString *)v26;

    objc_storeStrong((id *)&v21->_merchantIconURL, a6);
    objc_storeStrong((id *)&v21->_merchantTokenManagementURL, a7);
    v28 = objc_msgSend(v20, "copy");
    tokenCategory = v21->_tokenCategory;
    v21->_tokenCategory = (NSString *)v28;

    v21->_isDeferredPayment = a9;
  }

  return v21;
}

- (PKMerchantToken)initWithDictionary:(id)a3
{
  id v4;
  PKMerchantToken *v5;
  uint64_t v6;
  NSString *merchantTokenId;
  uint64_t v8;
  NSString *appleMerchantId;
  uint64_t v10;
  NSString *merchantName;
  uint64_t v12;
  NSURL *merchantIconURL;
  uint64_t v14;
  NSURL *merchantTokenManagementURL;
  uint64_t v16;
  NSString *tokenCategory;
  void *v18;
  objc_super v20;

  v4 = a3;
  if (v4)
  {
    v20.receiver = self;
    v20.super_class = (Class)PKMerchantToken;
    v5 = -[PKMerchantToken init](&v20, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "PKStringForKey:", CFSTR("merchantTokenId"));
      v6 = objc_claimAutoreleasedReturnValue();
      merchantTokenId = v5->_merchantTokenId;
      v5->_merchantTokenId = (NSString *)v6;

      objc_msgSend(v4, "PKStringForKey:", CFSTR("appleMerchantId"));
      v8 = objc_claimAutoreleasedReturnValue();
      appleMerchantId = v5->_appleMerchantId;
      v5->_appleMerchantId = (NSString *)v8;

      objc_msgSend(v4, "PKStringForKey:", CFSTR("merchantName"));
      v10 = objc_claimAutoreleasedReturnValue();
      merchantName = v5->_merchantName;
      v5->_merchantName = (NSString *)v10;

      objc_msgSend(v4, "PKURLForKey:", CFSTR("merchantIconURL"));
      v12 = objc_claimAutoreleasedReturnValue();
      merchantIconURL = v5->_merchantIconURL;
      v5->_merchantIconURL = (NSURL *)v12;

      objc_msgSend(v4, "PKURLForKey:", CFSTR("merchantTokenManagementURL"));
      v14 = objc_claimAutoreleasedReturnValue();
      merchantTokenManagementURL = v5->_merchantTokenManagementURL;
      v5->_merchantTokenManagementURL = (NSURL *)v14;

      objc_msgSend(v4, "PKStringForKey:", CFSTR("tokenCategory"));
      v16 = objc_claimAutoreleasedReturnValue();
      tokenCategory = v5->_tokenCategory;
      v5->_tokenCategory = (NSString *)v16;

      objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("tokenRequestAttributes"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_isDeferredPayment = objc_msgSend(v18, "PKBoolForKey:", CFSTR("deferredPayment"));

    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (BOOL)isAMPPaymentToken
{
  return -[NSString isEqualToString:](self->_tokenCategory, "isEqualToString:", CFSTR("amp_payment_token"));
}

- (BOOL)isAppleCashPaymentToken
{
  return -[NSString isEqualToString:](self->_tokenCategory, "isEqualToString:", CFSTR("cash_auto_payment"));
}

- (NSString)merchantTokenId
{
  return self->_merchantTokenId;
}

- (NSString)appleMerchantId
{
  return self->_appleMerchantId;
}

- (NSString)merchantName
{
  return self->_merchantName;
}

- (NSURL)merchantIconURL
{
  return self->_merchantIconURL;
}

- (NSURL)merchantTokenManagementURL
{
  return self->_merchantTokenManagementURL;
}

- (NSString)tokenCategory
{
  return self->_tokenCategory;
}

- (BOOL)isDeferredPayment
{
  return self->_isDeferredPayment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenCategory, 0);
  objc_storeStrong((id *)&self->_merchantTokenManagementURL, 0);
  objc_storeStrong((id *)&self->_merchantIconURL, 0);
  objc_storeStrong((id *)&self->_merchantName, 0);
  objc_storeStrong((id *)&self->_appleMerchantId, 0);
  objc_storeStrong((id *)&self->_merchantTokenId, 0);
}

@end
