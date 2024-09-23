@implementation PKPaymentRewrapResponseBase

- (PKPaymentRewrapResponseBase)initWithData:(id)a3
{
  PKPaymentRewrapResponseBase *v3;
  PKPaymentRewrapResponseBase *v4;
  void *v5;
  NSObject *p_super;
  uint64_t v7;
  NSString *transactionIdentifier;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  uint64_t v23;
  NSString *primaryAccountNumberSuffix;
  void *v25;
  PKPayLaterFinancingPlan *v26;
  PKPayLaterFinancingPlan *financingPlan;
  void *v28;
  PKAccount *v29;
  PKAccount *account;
  void *v31;
  void *v32;
  void *v33;
  NSString *v34;
  void *v35;
  NSString *v36;
  uint64_t v37;
  PKPaymentRewardsRedemption *redemption;
  uint64_t v39;
  NSURL *issuerInstallmentManagementURL;
  uint64_t v42;
  PKPaymentRewardsRedemption *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  objc_super v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v50.receiver = self;
  v50.super_class = (Class)PKPaymentRewrapResponseBase;
  v3 = -[PKWebServiceResponse initWithData:](&v50, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("header"));
      p_super = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[NSObject PKStringForKey:](p_super, "PKStringForKey:", CFSTR("transactionId"));
        v7 = objc_claimAutoreleasedReturnValue();
        transactionIdentifier = v4->_transactionIdentifier;
        v4->_transactionIdentifier = (NSString *)v7;

      }
      v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v5, "objectForKey:", CFSTR("data"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "safelySetObject:forKey:", v10, CFSTR("data"));

      objc_msgSend(v9, "safelySetObject:forKey:", p_super, CFSTR("header"));
      objc_msgSend(v5, "objectForKey:", CFSTR("signature"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "safelySetObject:forKey:", v11, CFSTR("signature"));

      objc_msgSend(v5, "objectForKey:", CFSTR("version"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "safelySetObject:forKey:", v12, CFSTR("version"));

      v49 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v9, 0, &v49);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v49;
      if (v13)
      {
        -[PKPaymentRewrapResponseBase setRewrappedPaymentData:](v4, "setRewrappedPaymentData:", v13);
      }
      else
      {
        PKLogFacilityTypeGetObject(6uLL);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v52 = v21;
          v53 = 2112;
          v54 = v48;
          v22 = v21;
          _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "Could not create rewrappedPaymentData for %{public}@: %@", buf, 0x16u);

        }
      }
      objc_msgSend(v5, "PKStringForKey:", CFSTR("primaryAccountNumberSuffix"));
      v23 = objc_claimAutoreleasedReturnValue();
      primaryAccountNumberSuffix = v4->_primaryAccountNumberSuffix;
      v4->_primaryAccountNumberSuffix = (NSString *)v23;

      objc_msgSend(v5, "PKDictionaryForKey:", CFSTR("financingPlan"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v26 = -[PKPayLaterFinancingPlan initWithDictionary:]([PKPayLaterFinancingPlan alloc], "initWithDictionary:", v25);
        financingPlan = v4->_financingPlan;
        v4->_financingPlan = v26;

      }
      objc_msgSend(v5, "PKDictionaryForKey:", CFSTR("account"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        v29 = -[PKAccount initWithDictionary:]([PKAccount alloc], "initWithDictionary:", v28);
        account = v4->_account;
        v4->_account = v29;

      }
      if (_os_feature_enabled_impl())
      {
        objc_msgSend(v5, "PKDictionaryForKey:", CFSTR("redemption"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          v43 = [PKPaymentRewardsRedemption alloc];
          objc_msgSend(v31, "PKStringForKey:", CFSTR("identifier"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "PKStringForKey:", CFSTR("balanceIdentifier"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "PKStringForKey:", CFSTR("status"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = PKPaymentRewardsRedemptionStatusFromString(v44);
          objc_msgSend(v31, "PKURLForKey:", CFSTR("statusLink"));
          v45 = p_super;
          v46 = v13;
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v4->_transactionIdentifier;
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v34;
          p_super = v45;
          v37 = -[PKPaymentRewardsRedemption initWithIdentifier:balanceIdentifier:status:statusLink:paymentHash:lastUpdatedAt:](v43, "initWithIdentifier:balanceIdentifier:status:statusLink:paymentHash:lastUpdatedAt:", v47, v32, v42, v33, v36, v35);
          redemption = v4->_redemption;
          v4->_redemption = (PKPaymentRewardsRedemption *)v37;

          v13 = v46;
        }

      }
      objc_msgSend(v5, "PKURLForKey:", CFSTR("issuerInstallmentManagementURL"));
      v39 = objc_claimAutoreleasedReturnValue();
      issuerInstallmentManagementURL = v4->_issuerInstallmentManagementURL;
      v4->_issuerInstallmentManagementURL = (NSURL *)v39;

    }
    else
    {
      if (v5 || !objc_msgSend((id)objc_opt_class(), "jsonDataOptional"))
      {
        PKLogFacilityTypeGetObject(6uLL);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = (objc_class *)objc_opt_class();
          NSStringFromClass(v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v52 = v17;
          v53 = 2112;
          v54 = v18;
          v19 = v18;
          _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);

        }
        p_super = &v4->super.super.super;
        v4 = 0;
        goto LABEL_27;
      }
      PKLogFacilityTypeGetObject(6uLL);
      p_super = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
LABEL_27:

        return v4;
      }
      v14 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v52 = v14;
      v9 = v14;
      _os_log_impl(&dword_18FC92000, p_super, OS_LOG_TYPE_DEFAULT, "No data received in re-wrap of %@ (which is allowed)", buf, 0xCu);
    }

    goto LABEL_27;
  }
  return v4;
}

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (NSData)rewrappedPaymentData
{
  return self->_rewrappedPaymentData;
}

- (void)setRewrappedPaymentData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)primaryAccountNumberSuffix
{
  return self->_primaryAccountNumberSuffix;
}

- (PKPayLaterFinancingPlan)financingPlan
{
  return self->_financingPlan;
}

- (PKAccount)account
{
  return self->_account;
}

- (PKPaymentRewardsRedemption)redemption
{
  return self->_redemption;
}

- (NSURL)issuerInstallmentManagementURL
{
  return self->_issuerInstallmentManagementURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issuerInstallmentManagementURL, 0);
  objc_storeStrong((id *)&self->_redemption, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
  objc_storeStrong((id *)&self->_primaryAccountNumberSuffix, 0);
  objc_storeStrong((id *)&self->_rewrappedPaymentData, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
}

@end
