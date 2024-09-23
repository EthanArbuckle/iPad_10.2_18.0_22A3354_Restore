@implementation PKDataReleaseEntityLookupSource

- (PKDataReleaseEntityLookupSource)initWithEntityIdentifier:(id)a3
{
  id v5;
  PKDataReleaseEntityLookupSource *v6;
  PKDataReleaseEntityLookupSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKDataReleaseEntityLookupSource;
  v6 = -[PKDataReleaseEntityLookupSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_entity, a3);

  return v7;
}

- (id)mapsMerchantLookupRequest
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(getMKWalletMerchantLookupRequestClass());
  objc_msgSend(v3, "setTransactionType:", 6);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTransactionDate:", v4);

  objc_msgSend(v3, "setRelyingPartyIdentifier:", self->_entity);
  return v3;
}

- (BOOL)isRefund
{
  return 0;
}

- (BOOL)isSettlement
{
  return 0;
}

- (BOOL)containsSensitiveData
{
  return 0;
}

- (id)identifier
{
  return 0;
}

- (int64_t)type
{
  return 2;
}

- (id)mapsURL
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entity, 0);
}

@end
