@implementation PKPaymentEligibilitySupplementaryData

- (PKPaymentEligibilitySupplementaryData)initWithDictionary:(id)a3 accountFeatureIdentifier:(unint64_t)a4
{
  id v6;
  PKPaymentEligibilitySupplementaryData *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  PKAccount *v12;
  void *v13;
  uint64_t v14;
  PKAccount *lightweightAccount;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentEligibilitySupplementaryData;
  v7 = -[PKPaymentEligibilitySupplementaryData init](&v17, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "PKStringForKey:", CFSTR("accountIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PKCurrencyAmountForKey:", CFSTR("accountBalance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "PKArrayForKey:", CFSTR("cloudStoreZoneNames"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (a4 == 4 && v8 && v9 && v10)
    {
      v12 = [PKAccount alloc];
      PKLightweightAppleBalanceAccountDict(v8, v9, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[PKAccount initWithDictionary:isCloudAccount:](v12, "initWithDictionary:isCloudAccount:", v13, 1);
      lightweightAccount = v7->_lightweightAccount;
      v7->_lightweightAccount = (PKAccount *)v14;

    }
  }

  return v7;
}

- (PKAccount)lightweightAccount
{
  return self->_lightweightAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lightweightAccount, 0);
}

@end
