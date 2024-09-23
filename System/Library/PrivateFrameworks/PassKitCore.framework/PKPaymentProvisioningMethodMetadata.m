@implementation PKPaymentProvisioningMethodMetadata

- (PKPaymentProvisioningMethodMetadata)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentProvisioningMethodMetadata *v5;
  uint64_t v6;
  NSString *productIdentifier;
  uint64_t v8;
  NSString *currency;
  void *v10;
  NSString *v11;
  id v12;
  NSString *v13;
  NSString *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSDecimalNumber *depositAmount;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSArray *requiredFields;
  uint64_t v39;
  NSDictionary *readerModeMetadata;
  uint64_t v41;
  NSDictionary *readerModeResources;
  void *v43;
  PKPaymentDigitalIssuanceMetadata *v44;
  PKPaymentDigitalIssuanceMetadata *digitalIssuanceMetadata;
  void *v46;
  void *v47;
  char v48;
  void *v50;
  void *v51;
  id obj;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  objc_super v57;
  uint8_t v58[128];
  uint8_t buf[4];
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)PKPaymentProvisioningMethodMetadata;
  v5 = -[PKPaymentProvisioningMethodMetadata init](&v57, sel_init);
  if (!v5)
    goto LABEL_30;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("productIdentifier"));
  v6 = objc_claimAutoreleasedReturnValue();
  productIdentifier = v5->_productIdentifier;
  v5->_productIdentifier = (NSString *)v6;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("currency"));
  v8 = objc_claimAutoreleasedReturnValue();
  currency = v5->_currency;
  v5->_currency = (NSString *)v8;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("depositType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v5->_productIdentifier;
  v12 = v10;
  v13 = v11;
  v14 = v13;
  if (!v12)
  {
    if (v13)
    {
      v15 = -[NSString isEqualToString:](v13, "isEqualToString:", CFSTR("59F12F58E2D04C9180CFD6C2096C125F-caprieightball-DC5AC19A6D2D477D8765687C3C2D4CA5"));
      goto LABEL_14;
    }
LABEL_13:
    v15 = 0;
    goto LABEL_14;
  }
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("RefundableDeposit")) & 1) == 0)
  {
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("RefundableServiceFee")) & 1) == 0)
    {
      if ((objc_msgSend(v12, "isEqualToString:", CFSTR("ServiceFee")) & 1) != 0)
      {
        v15 = 2;
        goto LABEL_14;
      }
      PKLogFacilityTypeGetObject(6uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v60 = v12;
        _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Unknown depositType %{public}@", buf, 0xCu);
      }

    }
    goto LABEL_13;
  }
  v15 = 1;
LABEL_14:

  v5->_depositType = v15;
  objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("depositAmount"));
  v17 = objc_claimAutoreleasedReturnValue();
  depositAmount = v5->_depositAmount;
  v5->_depositAmount = (NSDecimalNumber *)v17;

  objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("minLoadedBalance"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "isEqual:", v20);

  if ((v21 & 1) == 0)
    objc_storeStrong((id *)&v5->_minLoadedBalance, v19);
  objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("maxLoadedBalance"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v22, "isEqual:", v23);

  if ((v24 & 1) == 0)
    objc_storeStrong((id *)&v5->_maxLoadedBalance, v22);
  objc_msgSend(v4, "PKArrayForKey:", CFSTR("requiredFields"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "count");

  if (v26)
  {
    v50 = v22;
    v51 = v19;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("requiredFields"));
    obj = (id)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v54 != v30)
            objc_enumerationMutation(obj);
          v32 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
          objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("requiredFieldOptions"));
          v33 = v4;
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "PKDictionaryForKey:", v32);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          v4 = v33;
          +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", v32, v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "safelyAddObject:", v36);

        }
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      }
      while (v29);
    }

    v37 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v27);
    requiredFields = v5->_requiredFields;
    v5->_requiredFields = (NSArray *)v37;

    v22 = v50;
    v19 = v51;
  }
  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("readerModeMetadata"));
  v39 = objc_claimAutoreleasedReturnValue();
  readerModeMetadata = v5->_readerModeMetadata;
  v5->_readerModeMetadata = (NSDictionary *)v39;

  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("readerModeResources"));
  v41 = objc_claimAutoreleasedReturnValue();
  readerModeResources = v5->_readerModeResources;
  v5->_readerModeResources = (NSDictionary *)v41;

  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("digitalIssuanceMetadata"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = -[PKPaymentDigitalIssuanceMetadata initWithDictionary:]([PKPaymentDigitalIssuanceMetadata alloc], "initWithDictionary:", v43);
  digitalIssuanceMetadata = v5->_digitalIssuanceMetadata;
  v5->_digitalIssuanceMetadata = v44;

  objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("minimumReaderModeBalance"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v46, "isEqual:", v47);

  if ((v48 & 1) == 0)
    objc_storeStrong((id *)&v5->_minimumReaderModeBalance, v46);

LABEL_30:
  return v5;
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (NSString)currency
{
  return self->_currency;
}

- (unint64_t)depositType
{
  return self->_depositType;
}

- (NSDecimalNumber)depositAmount
{
  return self->_depositAmount;
}

- (NSDecimalNumber)minLoadedBalance
{
  return self->_minLoadedBalance;
}

- (NSDecimalNumber)maxLoadedBalance
{
  return self->_maxLoadedBalance;
}

- (NSArray)requiredFields
{
  return self->_requiredFields;
}

- (NSDictionary)readerModeMetadata
{
  return self->_readerModeMetadata;
}

- (PKPaymentDigitalIssuanceMetadata)digitalIssuanceMetadata
{
  return self->_digitalIssuanceMetadata;
}

- (NSDictionary)readerModeResources
{
  return self->_readerModeResources;
}

- (NSDecimalNumber)minimumReaderModeBalance
{
  return self->_minimumReaderModeBalance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumReaderModeBalance, 0);
  objc_storeStrong((id *)&self->_readerModeResources, 0);
  objc_storeStrong((id *)&self->_digitalIssuanceMetadata, 0);
  objc_storeStrong((id *)&self->_readerModeMetadata, 0);
  objc_storeStrong((id *)&self->_requiredFields, 0);
  objc_storeStrong((id *)&self->_maxLoadedBalance, 0);
  objc_storeStrong((id *)&self->_minLoadedBalance, 0);
  objc_storeStrong((id *)&self->_depositAmount, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
}

@end
