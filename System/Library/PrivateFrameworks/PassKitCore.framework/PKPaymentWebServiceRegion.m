@implementation PKPaymentWebServiceRegion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentWebServiceRegion)initWithDictionary:(id)a3 hasPeerPaymentAccount:(BOOL)a4
{
  id v6;
  PKPaymentWebServiceRegion *v7;
  void *v8;
  uint64_t v9;
  NSArray *certificates;
  void *v11;
  void *v12;
  uint64_t v13;
  NSURL *brokerURL;
  uint64_t v15;
  NSString *regionCode;
  uint64_t v17;
  NSURL *paymentServicesURL;
  uint64_t v19;
  NSURL *inAppPaymentServicesURL;
  uint64_t v21;
  NSURL *paymentServicesMerchantURL;
  uint64_t v23;
  NSURL *partnerServiceURL;
  uint64_t v25;
  NSURL *trustedServiceManagerURL;
  uint64_t v27;
  NSString *trustedServiceManagerPushTopic;
  uint64_t v29;
  NSString *userNotificationPushTopic;
  uint64_t v31;
  NSString *deviceCheckInPushTopic;
  uint64_t v33;
  NSURL *peerPaymentServiceURL;
  void *v35;
  uint64_t v36;
  NSURL *accountServiceURL;
  uint64_t v38;
  NSString *accountServicePushTopic;
  uint64_t v40;
  NSURL *applyServiceURL;
  uint64_t v42;
  NSString *applyServicePushTopic;
  uint64_t v44;
  NSString *productsPushTopic;
  uint64_t v46;
  NSString *transactionZonePushTopic;
  uint64_t v48;
  NSString *provisioningTargetsPushTopic;
  uint64_t v50;
  NSString *ownershipTokensPushTopic;
  uint64_t v52;
  NSString *auxiliaryRegistrationRequirementPushTopic;
  uint64_t v54;
  NSURL *paymentOffersServiceURL;
  uint64_t v56;
  NSString *paymentOffersServicePushTopic;
  objc_super v59;

  v6 = a3;
  v59.receiver = self;
  v59.super_class = (Class)PKPaymentWebServiceRegion;
  v7 = -[PKPaymentWebServiceRegion init](&v59, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("certificates"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_128);
    v9 = objc_claimAutoreleasedReturnValue();
    certificates = v7->_certificates;
    v7->_certificates = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v6, "PKStringForKey:", CFSTR("brokerURL"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLWithString:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    brokerURL = v7->_brokerURL;
    v7->_brokerURL = (NSURL *)v13;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("region"));
    v15 = objc_claimAutoreleasedReturnValue();
    regionCode = v7->_regionCode;
    v7->_regionCode = (NSString *)v15;

    objc_msgSend(v6, "PKURLForKey:", CFSTR("paymentServicesURL"));
    v17 = objc_claimAutoreleasedReturnValue();
    paymentServicesURL = v7->_paymentServicesURL;
    v7->_paymentServicesURL = (NSURL *)v17;

    objc_msgSend(v6, "PKURLForKey:", CFSTR("inAppPaymentServicesURL"));
    v19 = objc_claimAutoreleasedReturnValue();
    inAppPaymentServicesURL = v7->_inAppPaymentServicesURL;
    v7->_inAppPaymentServicesURL = (NSURL *)v19;

    objc_msgSend(v6, "PKURLForKey:", CFSTR("paymentServicesMerchantURL"));
    v21 = objc_claimAutoreleasedReturnValue();
    paymentServicesMerchantURL = v7->_paymentServicesMerchantURL;
    v7->_paymentServicesMerchantURL = (NSURL *)v21;

    objc_msgSend(v6, "PKURLForKey:", CFSTR("partnerServiceURL"));
    v23 = objc_claimAutoreleasedReturnValue();
    partnerServiceURL = v7->_partnerServiceURL;
    v7->_partnerServiceURL = (NSURL *)v23;

    objc_msgSend(v6, "PKURLForKey:", CFSTR("trustedServiceManagerURL"));
    v25 = objc_claimAutoreleasedReturnValue();
    trustedServiceManagerURL = v7->_trustedServiceManagerURL;
    v7->_trustedServiceManagerURL = (NSURL *)v25;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("trustedServiceManagerPushTopic"));
    v27 = objc_claimAutoreleasedReturnValue();
    trustedServiceManagerPushTopic = v7->_trustedServiceManagerPushTopic;
    v7->_trustedServiceManagerPushTopic = (NSString *)v27;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("userNotificationPushTopic"));
    v29 = objc_claimAutoreleasedReturnValue();
    userNotificationPushTopic = v7->_userNotificationPushTopic;
    v7->_userNotificationPushTopic = (NSString *)v29;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("deviceCheckInPushTopic"));
    v31 = objc_claimAutoreleasedReturnValue();
    deviceCheckInPushTopic = v7->_deviceCheckInPushTopic;
    v7->_deviceCheckInPushTopic = (NSString *)v31;

    objc_msgSend(v6, "PKURLForKey:", CFSTR("peerPaymentServiceURL"));
    v33 = objc_claimAutoreleasedReturnValue();
    peerPaymentServiceURL = v7->_peerPaymentServiceURL;
    v7->_peerPaymentServiceURL = (NSURL *)v33;

    objc_msgSend(v6, "objectForKey:", CFSTR("hasPeerPaymentAccount"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7->_hasPeerPaymentAccount = objc_msgSend(v35, "BOOLValue");
    }
    else if (-[NSString isEqualToString:](v7->_regionCode, "isEqualToString:", CFSTR("US")))
    {
      v7->_hasPeerPaymentAccount = a4;
    }
    objc_msgSend(v6, "PKURLForKey:", CFSTR("accountServiceURL"));
    v36 = objc_claimAutoreleasedReturnValue();
    accountServiceURL = v7->_accountServiceURL;
    v7->_accountServiceURL = (NSURL *)v36;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("accountServicePushTopic"));
    v38 = objc_claimAutoreleasedReturnValue();
    accountServicePushTopic = v7->_accountServicePushTopic;
    v7->_accountServicePushTopic = (NSString *)v38;

    v7->_hasAccounts = objc_msgSend(v6, "PKBoolForKey:", CFSTR("hasAccounts"));
    objc_msgSend(v6, "PKURLForKey:", CFSTR("applyServiceURL"));
    v40 = objc_claimAutoreleasedReturnValue();
    applyServiceURL = v7->_applyServiceURL;
    v7->_applyServiceURL = (NSURL *)v40;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("applyServicePushTopic"));
    v42 = objc_claimAutoreleasedReturnValue();
    applyServicePushTopic = v7->_applyServicePushTopic;
    v7->_applyServicePushTopic = (NSString *)v42;

    v7->_hasApplications = objc_msgSend(v6, "PKBoolForKey:", CFSTR("hasApplications"));
    objc_msgSend(v6, "PKStringForKey:", CFSTR("productsPushTopic"));
    v44 = objc_claimAutoreleasedReturnValue();
    productsPushTopic = v7->_productsPushTopic;
    v7->_productsPushTopic = (NSString *)v44;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("transactionZonePushTopic"));
    v46 = objc_claimAutoreleasedReturnValue();
    transactionZonePushTopic = v7->_transactionZonePushTopic;
    v7->_transactionZonePushTopic = (NSString *)v46;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("provisioningTargetsPushTopic"));
    v48 = objc_claimAutoreleasedReturnValue();
    provisioningTargetsPushTopic = v7->_provisioningTargetsPushTopic;
    v7->_provisioningTargetsPushTopic = (NSString *)v48;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("ownershipTokensPushTopic"));
    v50 = objc_claimAutoreleasedReturnValue();
    ownershipTokensPushTopic = v7->_ownershipTokensPushTopic;
    v7->_ownershipTokensPushTopic = (NSString *)v50;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("auxiliaryRegistrationRequirementPushTopic"));
    v52 = objc_claimAutoreleasedReturnValue();
    auxiliaryRegistrationRequirementPushTopic = v7->_auxiliaryRegistrationRequirementPushTopic;
    v7->_auxiliaryRegistrationRequirementPushTopic = (NSString *)v52;

    objc_msgSend(v6, "PKURLForKey:", CFSTR("paymentOffersServiceURL"));
    v54 = objc_claimAutoreleasedReturnValue();
    paymentOffersServiceURL = v7->_paymentOffersServiceURL;
    v7->_paymentOffersServiceURL = (NSURL *)v54;

    objc_msgSend(v6, "PKStringForKey:", CFSTR("paymentOffersServicePushTopic"));
    v56 = objc_claimAutoreleasedReturnValue();
    paymentOffersServicePushTopic = v7->_paymentOffersServicePushTopic;
    v7->_paymentOffersServicePushTopic = (NSString *)v56;

  }
  return v7;
}

id __70__PKPaymentWebServiceRegion_initWithDictionary_hasPeerPaymentAccount___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0C99D50];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithBase64EncodedString:options:", v3, 0);

  return v4;
}

- (PKPaymentWebServiceRegion)initWithCeritficates:(id)a3 brokerURL:(id)a4 trustedServiceManagerURL:(id)a5 trustedServiceManagerPushTopic:(id)a6 paymentServicesURL:(id)a7 inAppPaymentServicesURL:(id)a8 consistencyCheckBackoffLevel:(int64_t)a9 lastUpdatedTag:(id)a10
{
  id v17;
  id v18;
  PKPaymentWebServiceRegion *v19;
  PKPaymentWebServiceRegion *v20;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a3;
  v25 = a4;
  v24 = a5;
  v23 = a6;
  v22 = a7;
  v17 = a8;
  v18 = a10;
  v27.receiver = self;
  v27.super_class = (Class)PKPaymentWebServiceRegion;
  v19 = -[PKPaymentWebServiceRegion init](&v27, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_certificates, a3);
    objc_storeStrong((id *)&v20->_brokerURL, a4);
    objc_storeStrong((id *)&v20->_paymentServicesURL, a7);
    objc_storeStrong((id *)&v20->_inAppPaymentServicesURL, a8);
    objc_storeStrong((id *)&v20->_trustedServiceManagerURL, a5);
    objc_storeStrong((id *)&v20->_trustedServiceManagerPushTopic, a6);
    objc_storeStrong((id *)&v20->_lastUpdatedTag, a10);
    v20->_consistencyCheckBackoffLevel = a9;
  }

  return v20;
}

- (PKPaymentWebServiceRegion)initWithCoder:(id)a3
{
  id v4;
  PKPaymentWebServiceRegion *v5;
  uint64_t v6;
  NSString *lastUpdatedTag;
  uint64_t v8;
  NSURL *brokerURL;
  uint64_t v10;
  NSString *regionCode;
  uint64_t v12;
  NSURL *paymentServicesURL;
  uint64_t v14;
  NSURL *inAppPaymentServicesURL;
  uint64_t v16;
  NSURL *paymentServicesMerchantURL;
  uint64_t v18;
  NSURL *partnerServiceURL;
  uint64_t v20;
  NSURL *trustedServiceManagerURL;
  uint64_t v22;
  NSString *trustedServiceManagerPushTopic;
  uint64_t v24;
  NSArray *certificates;
  uint64_t v26;
  NSString *userNotificationPushTopic;
  uint64_t v28;
  NSURL *peerPaymentServiceURL;
  uint64_t v30;
  NSString *deviceCheckInPushTopic;
  uint64_t v32;
  NSString *lastDeviceCheckInBuildVersion;
  uint64_t v34;
  NSString *lastDeviceUpgradeTaskBuildVersion;
  uint64_t v36;
  NSURL *applyServiceURL;
  uint64_t v38;
  NSString *applyServicePushTopic;
  uint64_t v40;
  NSURL *accountServiceURL;
  uint64_t v42;
  NSString *accountServicePushTopic;
  uint64_t v44;
  NSString *productsPushTopic;
  uint64_t v46;
  NSString *transactionZonePushTopic;
  uint64_t v48;
  NSString *provisioningTargetsPushTopic;
  uint64_t v50;
  NSString *ownershipTokensPushTopic;
  uint64_t v52;
  NSString *auxiliaryRegistrationRequirementPushTopic;
  uint64_t v54;
  NSURL *paymentOffersServiceURL;
  uint64_t v56;
  NSString *paymentOffersServicePushTopic;
  objc_super v59;

  v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)PKPaymentWebServiceRegion;
  v5 = -[PKPaymentWebServiceRegion init](&v59, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdatedTag"));
    v6 = objc_claimAutoreleasedReturnValue();
    lastUpdatedTag = v5->_lastUpdatedTag;
    v5->_lastUpdatedTag = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("brokerURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    brokerURL = v5->_brokerURL;
    v5->_brokerURL = (NSURL *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("regionCode"));
    v10 = objc_claimAutoreleasedReturnValue();
    regionCode = v5->_regionCode;
    v5->_regionCode = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentServicesURL"));
    v12 = objc_claimAutoreleasedReturnValue();
    paymentServicesURL = v5->_paymentServicesURL;
    v5->_paymentServicesURL = (NSURL *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inAppPaymentServicesURL"));
    v14 = objc_claimAutoreleasedReturnValue();
    inAppPaymentServicesURL = v5->_inAppPaymentServicesURL;
    v5->_inAppPaymentServicesURL = (NSURL *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentServicesMerchantURL"));
    v16 = objc_claimAutoreleasedReturnValue();
    paymentServicesMerchantURL = v5->_paymentServicesMerchantURL;
    v5->_paymentServicesMerchantURL = (NSURL *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("partnerServiceURL"));
    v18 = objc_claimAutoreleasedReturnValue();
    partnerServiceURL = v5->_partnerServiceURL;
    v5->_partnerServiceURL = (NSURL *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trustedServiceManagerURL"));
    v20 = objc_claimAutoreleasedReturnValue();
    trustedServiceManagerURL = v5->_trustedServiceManagerURL;
    v5->_trustedServiceManagerURL = (NSURL *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trustedServiceManagerPushTopic"));
    v22 = objc_claimAutoreleasedReturnValue();
    trustedServiceManagerPushTopic = v5->_trustedServiceManagerPushTopic;
    v5->_trustedServiceManagerPushTopic = (NSString *)v22;

    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("certificates"));
    v24 = objc_claimAutoreleasedReturnValue();
    certificates = v5->_certificates;
    v5->_certificates = (NSArray *)v24;

    v5->_consistencyCheckBackoffLevel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("consistencyCheckBackoff"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userNotificationPushTopic"));
    v26 = objc_claimAutoreleasedReturnValue();
    userNotificationPushTopic = v5->_userNotificationPushTopic;
    v5->_userNotificationPushTopic = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("peerPaymentServiceURL"));
    v28 = objc_claimAutoreleasedReturnValue();
    peerPaymentServiceURL = v5->_peerPaymentServiceURL;
    v5->_peerPaymentServiceURL = (NSURL *)v28;

    v5->_hasPeerPaymentAccount = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasPeerPaymentAccount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceCheckInPushTopic"));
    v30 = objc_claimAutoreleasedReturnValue();
    deviceCheckInPushTopic = v5->_deviceCheckInPushTopic;
    v5->_deviceCheckInPushTopic = (NSString *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastDeviceCheckInBuildVersion"));
    v32 = objc_claimAutoreleasedReturnValue();
    lastDeviceCheckInBuildVersion = v5->_lastDeviceCheckInBuildVersion;
    v5->_lastDeviceCheckInBuildVersion = (NSString *)v32;

    v5->_outstandingCheckInAction = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("outstandingCheckInAction"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceUpgradeTasksBuildVersion"));
    v34 = objc_claimAutoreleasedReturnValue();
    lastDeviceUpgradeTaskBuildVersion = v5->_lastDeviceUpgradeTaskBuildVersion;
    v5->_lastDeviceUpgradeTaskBuildVersion = (NSString *)v34;

    v5->_hasApplications = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasApplications"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applyServiceURL"));
    v36 = objc_claimAutoreleasedReturnValue();
    applyServiceURL = v5->_applyServiceURL;
    v5->_applyServiceURL = (NSURL *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applyServicePushTopic"));
    v38 = objc_claimAutoreleasedReturnValue();
    applyServicePushTopic = v5->_applyServicePushTopic;
    v5->_applyServicePushTopic = (NSString *)v38;

    v5->_hasAccounts = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasAccounts"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountServiceURL"));
    v40 = objc_claimAutoreleasedReturnValue();
    accountServiceURL = v5->_accountServiceURL;
    v5->_accountServiceURL = (NSURL *)v40;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountServicePushTopic"));
    v42 = objc_claimAutoreleasedReturnValue();
    accountServicePushTopic = v5->_accountServicePushTopic;
    v5->_accountServicePushTopic = (NSString *)v42;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productsPushTopic"));
    v44 = objc_claimAutoreleasedReturnValue();
    productsPushTopic = v5->_productsPushTopic;
    v5->_productsPushTopic = (NSString *)v44;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionZonePushTopic"));
    v46 = objc_claimAutoreleasedReturnValue();
    transactionZonePushTopic = v5->_transactionZonePushTopic;
    v5->_transactionZonePushTopic = (NSString *)v46;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("provisioningTargetsPushTopic"));
    v48 = objc_claimAutoreleasedReturnValue();
    provisioningTargetsPushTopic = v5->_provisioningTargetsPushTopic;
    v5->_provisioningTargetsPushTopic = (NSString *)v48;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ownershipTokensPushTopic"));
    v50 = objc_claimAutoreleasedReturnValue();
    ownershipTokensPushTopic = v5->_ownershipTokensPushTopic;
    v5->_ownershipTokensPushTopic = (NSString *)v50;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("auxiliaryRegistrationRequirementPushTopic"));
    v52 = objc_claimAutoreleasedReturnValue();
    auxiliaryRegistrationRequirementPushTopic = v5->_auxiliaryRegistrationRequirementPushTopic;
    v5->_auxiliaryRegistrationRequirementPushTopic = (NSString *)v52;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentOffersServiceURL"));
    v54 = objc_claimAutoreleasedReturnValue();
    paymentOffersServiceURL = v5->_paymentOffersServiceURL;
    v5->_paymentOffersServiceURL = (NSURL *)v54;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentOffersServicePushTopic"));
    v56 = objc_claimAutoreleasedReturnValue();
    paymentOffersServicePushTopic = v5->_paymentOffersServicePushTopic;
    v5->_paymentOffersServicePushTopic = (NSString *)v56;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *certificates;
  id v5;

  certificates = self->_certificates;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", certificates, CFSTR("certificates"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastUpdatedTag, CFSTR("lastUpdatedTag"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_brokerURL, CFSTR("brokerURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_regionCode, CFSTR("regionCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentServicesURL, CFSTR("paymentServicesURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_inAppPaymentServicesURL, CFSTR("inAppPaymentServicesURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentServicesMerchantURL, CFSTR("paymentServicesMerchantURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_partnerServiceURL, CFSTR("partnerServiceURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_trustedServiceManagerURL, CFSTR("trustedServiceManagerURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_trustedServiceManagerPushTopic, CFSTR("trustedServiceManagerPushTopic"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_consistencyCheckBackoffLevel, CFSTR("consistencyCheckBackoff"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userNotificationPushTopic, CFSTR("userNotificationPushTopic"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_peerPaymentServiceURL, CFSTR("peerPaymentServiceURL"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasPeerPaymentAccount, CFSTR("hasPeerPaymentAccount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceCheckInPushTopic, CFSTR("deviceCheckInPushTopic"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastDeviceCheckInBuildVersion, CFSTR("lastDeviceCheckInBuildVersion"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_outstandingCheckInAction, CFSTR("outstandingCheckInAction"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastDeviceUpgradeTaskBuildVersion, CFSTR("deviceUpgradeTasksBuildVersion"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasApplications, CFSTR("hasApplications"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_applyServiceURL, CFSTR("applyServiceURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_applyServicePushTopic, CFSTR("applyServicePushTopic"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasAccounts, CFSTR("hasAccounts"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountServiceURL, CFSTR("accountServiceURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountServicePushTopic, CFSTR("accountServicePushTopic"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_productsPushTopic, CFSTR("productsPushTopic"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionZonePushTopic, CFSTR("transactionZonePushTopic"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_provisioningTargetsPushTopic, CFSTR("provisioningTargetsPushTopic"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ownershipTokensPushTopic, CFSTR("ownershipTokensPushTopic"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_auxiliaryRegistrationRequirementPushTopic, CFSTR("auxiliaryRegistrationRequirementPushTopic"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentOffersServiceURL, CFSTR("paymentOffersServiceURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentOffersServicePushTopic, CFSTR("paymentOffersServicePushTopic"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPaymentWebServiceRegion *v4;

  v4 = objc_alloc_init(PKPaymentWebServiceRegion);
  objc_storeStrong((id *)&v4->_certificates, self->_certificates);
  objc_storeStrong((id *)&v4->_brokerURL, self->_brokerURL);
  objc_storeStrong((id *)&v4->_regionCode, self->_regionCode);
  objc_storeStrong((id *)&v4->_paymentServicesURL, self->_paymentServicesURL);
  objc_storeStrong((id *)&v4->_inAppPaymentServicesURL, self->_inAppPaymentServicesURL);
  objc_storeStrong((id *)&v4->_paymentServicesMerchantURL, self->_paymentServicesMerchantURL);
  objc_storeStrong((id *)&v4->_partnerServiceURL, self->_partnerServiceURL);
  objc_storeStrong((id *)&v4->_trustedServiceManagerURL, self->_trustedServiceManagerURL);
  objc_storeStrong((id *)&v4->_trustedServiceManagerPushTopic, self->_trustedServiceManagerPushTopic);
  objc_storeStrong((id *)&v4->_userNotificationPushTopic, self->_userNotificationPushTopic);
  objc_storeStrong((id *)&v4->_deviceCheckInPushTopic, self->_deviceCheckInPushTopic);
  objc_storeStrong((id *)&v4->_peerPaymentServiceURL, self->_peerPaymentServiceURL);
  v4->_hasPeerPaymentAccount = self->_hasPeerPaymentAccount;
  objc_storeStrong((id *)&v4->_accountServiceURL, self->_accountServiceURL);
  objc_storeStrong((id *)&v4->_accountServicePushTopic, self->_accountServicePushTopic);
  v4->_hasAccounts = self->_hasAccounts;
  objc_storeStrong((id *)&v4->_applyServiceURL, self->_applyServiceURL);
  objc_storeStrong((id *)&v4->_applyServicePushTopic, self->_applyServicePushTopic);
  v4->_hasApplications = self->_hasApplications;
  objc_storeStrong((id *)&v4->_productsPushTopic, self->_productsPushTopic);
  objc_storeStrong((id *)&v4->_transactionZonePushTopic, self->_transactionZonePushTopic);
  objc_storeStrong((id *)&v4->_provisioningTargetsPushTopic, self->_provisioningTargetsPushTopic);
  objc_storeStrong((id *)&v4->_ownershipTokensPushTopic, self->_ownershipTokensPushTopic);
  objc_storeStrong((id *)&v4->_auxiliaryRegistrationRequirementPushTopic, self->_auxiliaryRegistrationRequirementPushTopic);
  objc_storeStrong((id *)&v4->_lastUpdatedTag, self->_lastUpdatedTag);
  objc_storeStrong((id *)&v4->_lastDeviceCheckInBuildVersion, self->_lastDeviceCheckInBuildVersion);
  objc_storeStrong((id *)&v4->_lastDeviceUpgradeTaskBuildVersion, self->_lastDeviceUpgradeTaskBuildVersion);
  v4->_outstandingCheckInAction = self->_outstandingCheckInAction;
  v4->_consistencyCheckBackoffLevel = self->_consistencyCheckBackoffLevel;
  objc_storeStrong((id *)&v4->_paymentOffersServiceURL, self->_paymentOffersServiceURL);
  objc_storeStrong((id *)&v4->_paymentOffersServicePushTopic, self->_paymentOffersServicePushTopic);
  return v4;
}

- (NSURL)inAppPaymentServicesURL
{
  NSURL *v3;
  NSURL *inAppPaymentServicesURL;
  NSURL *v5;

  PKOverrideInAppPaymentServicesURL();
  v3 = (NSURL *)objc_claimAutoreleasedReturnValue();
  inAppPaymentServicesURL = v3;
  if (!v3)
  {
    inAppPaymentServicesURL = self->_inAppPaymentServicesURL;
    if (!inAppPaymentServicesURL)
      inAppPaymentServicesURL = self->_paymentServicesURL;
  }
  v5 = inAppPaymentServicesURL;

  return v5;
}

- (id)description
{
  void *v3;
  NSURL *inAppPaymentServicesURL;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("certificates: '%@'; "), self->_certificates);
  objc_msgSend(v3, "appendFormat:", CFSTR("lastUpdatedTag: '%@'; "), self->_lastUpdatedTag);
  objc_msgSend(v3, "appendFormat:", CFSTR("brokerURL: '%@'; "), self->_brokerURL);
  objc_msgSend(v3, "appendFormat:", CFSTR("regionCode: '%@'; "), self->_regionCode);
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentServicesURL: '%@'; "), self->_paymentServicesURL);
  inAppPaymentServicesURL = self->_inAppPaymentServicesURL;
  -[PKPaymentWebServiceRegion inAppPaymentServicesURL](self, "inAppPaymentServicesURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("inAppPaymentServicesURL: '%@' (resolved '%@'); "),
    inAppPaymentServicesURL,
    v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("paymentServicesMerchantURL: '%@'; "), self->_paymentServicesMerchantURL);
  objc_msgSend(v3, "appendFormat:", CFSTR("trustedServiceManagerURL: '%@'; "), self->_trustedServiceManagerURL);
  objc_msgSend(v3, "appendFormat:", CFSTR("trustedServiceManagerPushTopic: '%@'; "),
    self->_trustedServiceManagerPushTopic);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_consistencyCheckBackoffLevel);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("consistencyCheckBackoffLevel: '%@'; "), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR("userNotificationPushTopic: '%@'; "), self->_userNotificationPushTopic);
  objc_msgSend(v3, "appendFormat:", CFSTR("peerPaymentServiceURL: '%@'; "), self->_peerPaymentServiceURL);
  if (self->_hasPeerPaymentAccount)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("hasPeerPaymentAccount: '%@'; "), v7);
  objc_msgSend(v3, "appendFormat:", CFSTR("deviceCheckInPushTopic: '%@'; "), self->_deviceCheckInPushTopic);
  objc_msgSend(v3, "appendFormat:", CFSTR("lastDeviceCheckInBuildVersion: '%@'; "),
    self->_lastDeviceCheckInBuildVersion);
  objc_msgSend(v3, "appendFormat:", CFSTR("outstandingCheckInAction: '%ld'; "), self->_outstandingCheckInAction);
  objc_msgSend(v3, "appendFormat:", CFSTR("deviceUpgradeTasksBuildVersion: '%@'; "),
    self->_lastDeviceUpgradeTaskBuildVersion);
  objc_msgSend(v3, "appendFormat:", CFSTR("applyServiceURL: '%@'; "), self->_applyServiceURL);
  objc_msgSend(v3, "appendFormat:", CFSTR("applyServicePushTopic: '%@'; "), self->_applyServicePushTopic);
  if (self->_hasApplications)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("hasApplications: '%@'; "), v8);
  objc_msgSend(v3, "appendFormat:", CFSTR("accountServiceURL: '%@'; "), self->_accountServiceURL);
  objc_msgSend(v3, "appendFormat:", CFSTR("accountServicePushTopic: '%@'; "), self->_accountServicePushTopic);
  if (self->_hasAccounts)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("hasAccounts: '%@'; "), v9);
  objc_msgSend(v3, "appendFormat:", CFSTR("productsPushTopic: %@; "), self->_productsPushTopic);
  objc_msgSend(v3, "appendFormat:", CFSTR("transactionZonePushTopic: %@; "), self->_transactionZonePushTopic);
  objc_msgSend(v3, "appendFormat:", CFSTR("provisioningTargetsPushTopic: %@; "), self->_provisioningTargetsPushTopic);
  objc_msgSend(v3, "appendFormat:", CFSTR("ownershipTokensPushTopic: %@; "), self->_ownershipTokensPushTopic);
  objc_msgSend(v3, "appendFormat:", CFSTR("auxiliaryRegistrationRequirementPushTopic: '%@'; "),
    self->_auxiliaryRegistrationRequirementPushTopic);
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentOffersServiceURL: '%@'; "), self->_paymentOffersServiceURL);
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentOffersServicePushTopic: '%@'; "),
    self->_paymentOffersServicePushTopic);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSURL)applyServiceURL
{
  NSURL *v3;
  NSObject *v4;
  NSURL *applyServiceURL;
  NSURL *v6;
  int v8;
  NSURL *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PKApplyServiceOverrideURL();
  v3 = (NSURL *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    PKLogFacilityTypeGetObject(0xDuLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Using overridden Apply service URL: %@ ", (uint8_t *)&v8, 0xCu);
    }

    applyServiceURL = v3;
  }
  else
  {
    applyServiceURL = self->_applyServiceURL;
  }
  v6 = applyServiceURL;

  return v6;
}

- (NSURL)accountServiceURL
{
  NSURL *v3;
  NSObject *v4;
  NSURL *accountServiceURL;
  NSURL *v6;
  int v8;
  NSURL *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PKAccountServiceOverrideURL();
  v3 = (NSURL *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Using overridden Account service URL: %@ ", (uint8_t *)&v8, 0xCu);
    }

    accountServiceURL = v3;
  }
  else
  {
    accountServiceURL = self->_accountServiceURL;
  }
  v6 = accountServiceURL;

  return v6;
}

- (NSURL)paymentOffersServiceURL
{
  NSURL *v3;
  NSObject *v4;
  NSURL *paymentOffersServiceURL;
  NSURL *v6;
  int v8;
  NSURL *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PKOverridePaymentOffersServiceURL();
  v3 = (NSURL *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Using overridden Payment Offers Service URL: %@ ", (uint8_t *)&v8, 0xCu);
    }

    paymentOffersServiceURL = v3;
  }
  else
  {
    paymentOffersServiceURL = self->_paymentOffersServiceURL;
  }
  v6 = paymentOffersServiceURL;

  return v6;
}

- (id)regionBySettingLastUpdatedTag:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  v5 = (_QWORD *)-[PKPaymentWebServiceRegion copy](self, "copy");
  v6 = (void *)v5[23];
  v5[23] = v4;

  return v5;
}

- (id)regionBySettingOutstandingCheckInAction:(int64_t)a3 lastDeviceCheckInBuildVersion:(id)a4
{
  id v6;
  _QWORD *v7;
  void *v8;

  v6 = a4;
  v7 = (_QWORD *)-[PKPaymentWebServiceRegion copy](self, "copy");
  v7[26] = a3;
  v8 = (void *)v7[24];
  v7[24] = v6;

  return v7;
}

- (id)regionBySettingLastDeviceCheckInBuildVersion:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  v5 = (_QWORD *)-[PKPaymentWebServiceRegion copy](self, "copy");
  v6 = (void *)v5[24];
  v5[24] = v4;

  return v5;
}

- (id)regionBySettingLastDeviceUpgradeTaskBuildVersion:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  v5 = (_QWORD *)-[PKPaymentWebServiceRegion copy](self, "copy");
  v6 = (void *)v5[25];
  v5[25] = v4;

  return v5;
}

- (id)regionBySettingConsistencyCheckBackoffLevel:(int64_t)a3
{
  _QWORD *v4;

  v4 = (_QWORD *)-[PKPaymentWebServiceRegion copy](self, "copy");
  v4[27] = a3;
  return v4;
}

- (NSArray)certificates
{
  return self->_certificates;
}

- (NSURL)brokerURL
{
  return self->_brokerURL;
}

- (NSString)regionCode
{
  return self->_regionCode;
}

- (NSURL)paymentServicesURL
{
  return self->_paymentServicesURL;
}

- (NSURL)paymentServicesMerchantURL
{
  return self->_paymentServicesMerchantURL;
}

- (NSURL)partnerServiceURL
{
  return self->_partnerServiceURL;
}

- (NSURL)trustedServiceManagerURL
{
  return self->_trustedServiceManagerURL;
}

- (NSString)trustedServiceManagerPushTopic
{
  return self->_trustedServiceManagerPushTopic;
}

- (NSString)userNotificationPushTopic
{
  return self->_userNotificationPushTopic;
}

- (NSString)deviceCheckInPushTopic
{
  return self->_deviceCheckInPushTopic;
}

- (NSString)accountServicePushTopic
{
  return self->_accountServicePushTopic;
}

- (BOOL)hasAccounts
{
  return self->_hasAccounts;
}

- (NSString)applyServicePushTopic
{
  return self->_applyServicePushTopic;
}

- (BOOL)hasApplications
{
  return self->_hasApplications;
}

- (NSString)productsPushTopic
{
  return self->_productsPushTopic;
}

- (NSString)transactionZonePushTopic
{
  return self->_transactionZonePushTopic;
}

- (NSString)provisioningTargetsPushTopic
{
  return self->_provisioningTargetsPushTopic;
}

- (NSString)ownershipTokensPushTopic
{
  return self->_ownershipTokensPushTopic;
}

- (NSString)auxiliaryRegistrationRequirementPushTopic
{
  return self->_auxiliaryRegistrationRequirementPushTopic;
}

- (NSString)lastUpdatedTag
{
  return self->_lastUpdatedTag;
}

- (NSString)lastDeviceCheckInBuildVersion
{
  return self->_lastDeviceCheckInBuildVersion;
}

- (NSString)lastDeviceUpgradeTaskBuildVersion
{
  return self->_lastDeviceUpgradeTaskBuildVersion;
}

- (int64_t)outstandingCheckInAction
{
  return self->_outstandingCheckInAction;
}

- (int64_t)consistencyCheckBackoffLevel
{
  return self->_consistencyCheckBackoffLevel;
}

- (NSString)paymentOffersServicePushTopic
{
  return self->_paymentOffersServicePushTopic;
}

- (NSURL)peerPaymentServiceURL
{
  return self->_peerPaymentServiceURL;
}

- (void)setPeerPaymentServiceURL:(id)a3
{
  objc_storeStrong((id *)&self->_peerPaymentServiceURL, a3);
}

- (BOOL)hasPeerPaymentAccount
{
  return self->_hasPeerPaymentAccount;
}

- (void)setHasPeerPaymentAccount:(BOOL)a3
{
  self->_hasPeerPaymentAccount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentServiceURL, 0);
  objc_storeStrong((id *)&self->_paymentOffersServicePushTopic, 0);
  objc_storeStrong((id *)&self->_lastDeviceUpgradeTaskBuildVersion, 0);
  objc_storeStrong((id *)&self->_lastDeviceCheckInBuildVersion, 0);
  objc_storeStrong((id *)&self->_lastUpdatedTag, 0);
  objc_storeStrong((id *)&self->_auxiliaryRegistrationRequirementPushTopic, 0);
  objc_storeStrong((id *)&self->_ownershipTokensPushTopic, 0);
  objc_storeStrong((id *)&self->_provisioningTargetsPushTopic, 0);
  objc_storeStrong((id *)&self->_transactionZonePushTopic, 0);
  objc_storeStrong((id *)&self->_productsPushTopic, 0);
  objc_storeStrong((id *)&self->_applyServicePushTopic, 0);
  objc_storeStrong((id *)&self->_accountServicePushTopic, 0);
  objc_storeStrong((id *)&self->_deviceCheckInPushTopic, 0);
  objc_storeStrong((id *)&self->_userNotificationPushTopic, 0);
  objc_storeStrong((id *)&self->_trustedServiceManagerPushTopic, 0);
  objc_storeStrong((id *)&self->_trustedServiceManagerURL, 0);
  objc_storeStrong((id *)&self->_partnerServiceURL, 0);
  objc_storeStrong((id *)&self->_paymentServicesMerchantURL, 0);
  objc_storeStrong((id *)&self->_paymentServicesURL, 0);
  objc_storeStrong((id *)&self->_regionCode, 0);
  objc_storeStrong((id *)&self->_brokerURL, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_paymentOffersServiceURL, 0);
  objc_storeStrong((id *)&self->_applyServiceURL, 0);
  objc_storeStrong((id *)&self->_accountServiceURL, 0);
  objc_storeStrong((id *)&self->_inAppPaymentServicesURL, 0);
}

@end
