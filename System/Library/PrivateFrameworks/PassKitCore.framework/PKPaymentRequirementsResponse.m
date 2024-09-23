@implementation PKPaymentRequirementsResponse

- (PKPaymentRequirementsResponse)initWithData:(id)a3 headers:(id)a4
{
  id v6;
  PKPaymentRequirementsResponse *v7;
  PKPaymentRequirementsResponse *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *nonce;
  uint64_t v15;
  NSString *region;
  int64_t status;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSArray *requiredPaymentSetupFields;
  uint64_t v31;
  NSObject *productIdentifier;
  objc_class *v33;
  void *v34;
  void *v35;
  id v36;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  PKPaymentSetupProduct *v44;
  uint64_t v45;
  NSArray *possibleProducts;
  void *v47;
  uint64_t v48;
  id v49;
  PKPaymentRequirementsResponse *v50;
  PKPaymentRequirementsResponse *v51;
  id obj;
  id obja;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  objc_super v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  void *v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v62.receiver = self;
  v62.super_class = (Class)PKPaymentRequirementsResponse;
  v7 = -[PKWebServiceResponse initWithData:headers:](&v62, sel_initWithData_headers_, a3, v6);
  v8 = v7;
  if (v7)
  {
    -[PKWebServiceResponse JSONObject](v7, "JSONObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("requirementsStatus")),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          v10))
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("requirementsStatus"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8->_status = objc_msgSend(v11, "integerValue");

      objc_msgSend(v9, "PKStringForKey:", CFSTR("nonce"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "copy");
      nonce = v8->_nonce;
      v8->_nonce = (NSString *)v13;

      objc_msgSend(v6, "PKStringForKey:", CFSTR("x-pod-region"));
      v15 = objc_claimAutoreleasedReturnValue();
      region = v8->_region;
      v8->_region = (NSString *)v15;

      status = v8->_status;
      if (status == 2)
      {
        objc_msgSend(v9, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("possibleProducts"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v18)
          goto LABEL_18;
        v51 = v8;
        obja = v9;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        productIdentifier = objc_claimAutoreleasedReturnValue();
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v38 = v18;
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
        if (v39)
        {
          v40 = v39;
          v41 = *(_QWORD *)v55;
          do
          {
            v42 = 0;
            do
            {
              if (*(_QWORD *)v55 != v41)
                objc_enumerationMutation(v38);
              v43 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v42);
              v44 = objc_alloc_init(PKPaymentSetupProduct);
              -[PKPaymentSetupProduct updateWithProductDictionary:](v44, "updateWithProductDictionary:", v43);
              -[NSObject safelyAddObject:](productIdentifier, "safelyAddObject:", v44);

              ++v42;
            }
            while (v40 != v42);
            v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
          }
          while (v40);
        }

        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", productIdentifier);
        v45 = objc_claimAutoreleasedReturnValue();
        v8 = v51;
        possibleProducts = v51->_possibleProducts;
        v51->_possibleProducts = (NSArray *)v45;

        v9 = obja;
      }
      else if (status == 1)
      {
        v49 = v6;
        v50 = v8;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        objc_msgSend(v9, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("requiredFields"));
        obj = (id)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v59;
          do
          {
            v22 = 0;
            do
            {
              v23 = v18;
              if (*(_QWORD *)v59 != v21)
                objc_enumerationMutation(obj);
              v24 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * v22);
              objc_msgSend(v9, "PKDictionaryForKey:", CFSTR("requiredFieldOptions"));
              v25 = v9;
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "PKDictionaryForKey:", v24);
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              v9 = v25;
              +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", v24, v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = v23;
              objc_msgSend(v23, "safelyAddObject:", v28);

              ++v22;
            }
            while (v20 != v22);
            v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
          }
          while (v20);
        }

        v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v18);
        v8 = v50;
        requiredPaymentSetupFields = v50->_requiredPaymentSetupFields;
        v50->_requiredPaymentSetupFields = (NSArray *)v29;

        objc_msgSend(v9, "PKStringForKey:", CFSTR("productIdentifier"));
        v31 = objc_claimAutoreleasedReturnValue();
        productIdentifier = v50->_productIdentifier;
        v50->_productIdentifier = (NSString *)v31;
        v6 = v49;
      }
      else
      {
        v47 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("learnMoreURL"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "URLWithString:", v18);
        v48 = objc_claimAutoreleasedReturnValue();
        productIdentifier = &v8->_learnMoreURL->super;
        v8->_learnMoreURL = (NSURL *)v48;
      }
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      productIdentifier = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(productIdentifier, OS_LOG_TYPE_DEFAULT))
      {
        v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v64 = v34;
        v65 = 2112;
        v66 = v35;
        v36 = v35;
        _os_log_impl(&dword_18FC92000, productIdentifier, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);

      }
      v18 = v8;
      v8 = 0;
    }

LABEL_18:
  }

  return v8;
}

- (PKPaymentRequirementsResponse)initWithProduct:(id)a3
{
  id v4;
  PKPaymentRequirementsResponse *v5;
  PKPaymentRequirementsResponse *v6;
  void *v7;
  uint64_t v8;
  NSArray *requiredPaymentSetupFields;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *productIdentifier;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentRequirementsResponse;
  v5 = -[PKPaymentRequirementsResponse init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_status = 1;
    objc_msgSend(v4, "requiredFields");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    requiredPaymentSetupFields = v6->_requiredPaymentSetupFields;
    v6->_requiredPaymentSetupFields = (NSArray *)v8;

    objc_msgSend(v4, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "productIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    productIdentifier = v6->_productIdentifier;
    v6->_productIdentifier = (NSString *)v12;

  }
  return v6;
}

- (PKPaymentRequirementsResponse)initWithProvisioningMethodMetadata:(id)a3
{
  id v4;
  PKPaymentRequirementsResponse *v5;
  PKPaymentRequirementsResponse *v6;
  void *v7;
  uint64_t v8;
  NSArray *requiredPaymentSetupFields;
  void *v10;
  uint64_t v11;
  NSString *productIdentifier;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentRequirementsResponse;
  v5 = -[PKPaymentRequirementsResponse init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_status = 1;
    objc_msgSend(v4, "requiredFields");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    requiredPaymentSetupFields = v6->_requiredPaymentSetupFields;
    v6->_requiredPaymentSetupFields = (NSArray *)v8;

    objc_msgSend(v4, "productIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    productIdentifier = v6->_productIdentifier;
    v6->_productIdentifier = (NSString *)v11;

  }
  return v6;
}

+ (id)emptyRequirementsResponse
{
  PKPaymentRequirementsResponse *v2;

  v2 = objc_alloc_init(PKPaymentRequirementsResponse);
  v2->_status = 1;
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)status
{
  return self->_status;
}

- (NSArray)requiredPaymentSetupFields
{
  return self->_requiredPaymentSetupFields;
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (NSArray)possibleProducts
{
  return self->_possibleProducts;
}

- (NSURL)learnMoreURL
{
  return self->_learnMoreURL;
}

- (NSString)nonce
{
  return self->_nonce;
}

- (NSString)region
{
  return self->_region;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_learnMoreURL, 0);
  objc_storeStrong((id *)&self->_possibleProducts, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_requiredPaymentSetupFields, 0);
}

@end
