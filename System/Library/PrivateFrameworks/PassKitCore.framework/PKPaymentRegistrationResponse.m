@implementation PKPaymentRegistrationResponse

- (PKPaymentRegistrationResponse)initWithData:(id)a3
{
  PKPaymentRegistrationResponse *v3;
  PKPaymentRegistrationResponse *v4;
  void *v5;
  uint64_t v6;
  NSString *deviceIdentifier;
  uint64_t v8;
  NSNumber *cardsOnFile;
  uint64_t v10;
  NSNumber *maxCards;
  uint64_t v12;
  NSString *primaryRegion;
  uint64_t v14;
  NSString *environmentName;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  PKPaymentRegistrationResponse *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  PKPaymentWebServiceRegion *v25;
  void *v26;
  PKPaymentWebServiceRegion *v27;
  void *v28;
  uint64_t v29;
  NSURL *brokerURL;
  uint64_t v31;
  uint64_t v32;
  NSURL *trustedServiceManagerURL;
  void *v34;
  uint64_t v35;
  NSURL *paymentServicesURL;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  uint64_t v45;
  PKPaymentRegistrationResponse *v46;
  NSArray *certificates;
  objc_class *v48;
  void *v49;
  void *v50;
  id v51;
  void *v53;
  void *v54;
  PKPaymentRegistrationResponse *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  objc_super v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v64.receiver = self;
  v64.super_class = (Class)PKPaymentRegistrationResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v64, sel_initWithData_, a3);
  if (!v3)
    return 0;
  v4 = v3;
  -[PKWebServiceResponse JSONObject](v3, "JSONObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "PKStringForKey:", CFSTR("deviceIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    deviceIdentifier = v4->_deviceIdentifier;
    v4->_deviceIdentifier = (NSString *)v6;

    objc_msgSend(v5, "PKNumberForKey:", CFSTR("cardsOnFile"));
    v8 = objc_claimAutoreleasedReturnValue();
    cardsOnFile = v4->_cardsOnFile;
    v4->_cardsOnFile = (NSNumber *)v8;

    objc_msgSend(v5, "PKNumberForKey:", CFSTR("maxCards"));
    v10 = objc_claimAutoreleasedReturnValue();
    maxCards = v4->_maxCards;
    v4->_maxCards = (NSNumber *)v10;

    objc_msgSend(v5, "PKStringForKey:", CFSTR("primaryRegion"));
    v12 = objc_claimAutoreleasedReturnValue();
    primaryRegion = v4->_primaryRegion;
    v4->_primaryRegion = (NSString *)v12;

    objc_msgSend(v5, "PKStringForKey:", CFSTR("environmentName"));
    v14 = objc_claimAutoreleasedReturnValue();
    environmentName = v4->_environmentName;
    v55 = v4;
    v4->_environmentName = (NSString *)v14;

    objc_msgSend(v5, "PKDictionaryForKey:", CFSTR("regions"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v54 = v5;
    v18 = objc_msgSend(v5, "PKBoolForKey:", CFSTR("hasPeerPaymentAccount"));
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v19 = v16;
    v20 = -[PKPaymentRegistrationResponse countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v61 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i);
          v25 = [PKPaymentWebServiceRegion alloc];
          -[PKPaymentRegistrationResponse PKDictionaryForKey:](v19, "PKDictionaryForKey:", v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = -[PKPaymentWebServiceRegion initWithDictionary:hasPeerPaymentAccount:](v25, "initWithDictionary:hasPeerPaymentAccount:", v26, v18);
          -[NSObject setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v27, v24);

        }
        v21 = -[PKPaymentRegistrationResponse countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
      }
      while (v21);
    }

    -[PKPaymentRegistrationResponse setRegions:](v4, "setRegions:", v17);
    objc_msgSend(v54, "objectForKey:", CFSTR("brokerURL"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v28);
      brokerURL = v4->_brokerURL;
      v4->_brokerURL = (NSURL *)v29;

    }
    objc_msgSend(v54, "objectForKey:", CFSTR("trustedServiceManagerURL"));
    v31 = objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v31);
      trustedServiceManagerURL = v4->_trustedServiceManagerURL;
      v4->_trustedServiceManagerURL = (NSURL *)v32;

    }
    objc_msgSend(v54, "objectForKey:", CFSTR("paymentServicesURL"), v31);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v34);
      paymentServicesURL = v4->_paymentServicesURL;
      v4->_paymentServicesURL = (NSURL *)v35;

    }
    objc_msgSend(v54, "objectForKey:", CFSTR("certificates"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v39 = v37;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v57;
      do
      {
        for (j = 0; j != v41; ++j)
        {
          if (*(_QWORD *)v57 != v42)
            objc_enumerationMutation(v39);
          v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * j), 0);
          if (v44)
            objc_msgSend(v38, "addObject:", v44);

        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
      }
      while (v41);
    }

    v45 = objc_msgSend(v38, "copy");
    v46 = v55;
    certificates = v55->_certificates;
    v55->_certificates = (NSArray *)v45;

    v5 = v54;
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v48 = (objc_class *)objc_opt_class();
      NSStringFromClass(v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v66 = v49;
      v67 = 2112;
      v68 = v50;
      v51 = v50;
      _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);

    }
    v19 = v4;
    v46 = 0;
  }

  return v46;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)cardsOnFile
{
  return self->_cardsOnFile;
}

- (void)setCardsOnFile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)maxCards
{
  return self->_maxCards;
}

- (void)setMaxCards:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)primaryRegion
{
  return self->_primaryRegion;
}

- (NSDictionary)regions
{
  return self->_regions;
}

- (void)setRegions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)environmentName
{
  return self->_environmentName;
}

- (void)setEnvironmentName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSURL)brokerURL
{
  return self->_brokerURL;
}

- (void)setBrokerURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSURL)trustedServiceManagerURL
{
  return self->_trustedServiceManagerURL;
}

- (void)setTrustedServiceManagerURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSURL)paymentServicesURL
{
  return self->_paymentServicesURL;
}

- (void)setPaymentServicesURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)certificates
{
  return self->_certificates;
}

- (void)setCertificates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_paymentServicesURL, 0);
  objc_storeStrong((id *)&self->_trustedServiceManagerURL, 0);
  objc_storeStrong((id *)&self->_brokerURL, 0);
  objc_storeStrong((id *)&self->_environmentName, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_primaryRegion, 0);
  objc_storeStrong((id *)&self->_maxCards, 0);
  objc_storeStrong((id *)&self->_cardsOnFile, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end
