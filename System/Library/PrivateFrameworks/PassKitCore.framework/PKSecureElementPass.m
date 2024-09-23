@implementation PKSecureElementPass

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUpgradeRequests, 0);
  objc_storeStrong((id *)&self->_availableActions, 0);
  objc_storeStrong((id *)&self->_auxiliaryRegistrationRequirements, 0);
  objc_storeStrong((id *)&self->_supportedSiriIntents, 0);
  objc_storeStrong((id *)&self->_speakableModel, 0);
  objc_storeStrong((id *)&self->_speakableMake, 0);
  objc_storeStrong((id *)&self->_shippingAddressSeed, 0);
  objc_storeStrong((id *)&self->_localizedSuspendedReason, 0);
  objc_storeStrong((id *)&self->_customerServiceIdentifier, 0);
  objc_storeStrong((id *)&self->_appURLScheme, 0);
  objc_storeStrong((id *)&self->_messagePushTopic, 0);
  objc_storeStrong((id *)&self->_messageServiceRegistrationURL, 0);
  objc_storeStrong((id *)&self->_messageServiceURL, 0);
  objc_storeStrong((id *)&self->_transactionPushTopic, 0);
  objc_storeStrong((id *)&self->_transactionServiceRegistrationURL, 0);
  objc_storeStrong((id *)&self->_transactionServiceURL, 0);
  objc_storeStrong((id *)&self->_cobrandName, 0);
  objc_storeStrong((id *)&self->_transactionSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_partnerAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceInAppPaymentApplications, 0);
  objc_storeStrong((id *)&self->_devicePrimaryBarcodePaymentApplication, 0);
  objc_storeStrong((id *)&self->_devicePrimaryInAppPaymentApplication, 0);
  objc_storeStrong((id *)&self->_devicePrimaryContactlessPaymentApplication, 0);
  objc_storeStrong((id *)&self->_devicePrimaryPaymentApplication, 0);
  objc_storeStrong((id *)&self->_devicePaymentApplications, 0);
  objc_storeStrong((id *)&self->_paymentApplications, 0);
  objc_storeStrong((id *)&self->_topRightBackgroundTitle, 0);
  objc_storeStrong((id *)&self->_topLeftBackgroundTitle, 0);
  objc_storeStrong((id *)&self->_provisioningMetadata, 0);
  objc_storeStrong((id *)&self->_originalProvisioningDate, 0);
  objc_storeStrong((id *)&self->_identityAccountKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_issuerAdministrativeAreaCode, 0);
  objc_storeStrong((id *)&self->_issuerCountryCode, 0);
  objc_storeStrong((id *)&self->_associatedAccountServiceAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_sanitizedPrimaryAccountName, 0);
  objc_storeStrong((id *)&self->_sanitizedPrimaryAccountNumber, 0);
  objc_storeStrong((id *)&self->_associatedWebDomains, 0);
  objc_storeStrong((id *)&self->_associatedApplicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_primaryAccountNumberSuffix, 0);
  objc_storeStrong((id *)&self->_primaryAccountIdentifier, 0);
}

- (id)dynamicLayerConfiguration
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dynamicLayerConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)_activationStateForApplicationState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xE)
    return 4;
  else
    return qword_190454D50[a3 - 1];
}

- (BOOL)supportsBarcodePayment
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  -[PKSecureElementPass paymentApplications](self, "paymentApplications");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__PKSecureElementPass_supportsBarcodePayment__block_invoke;
  v4[3] = &unk_1E2AC95A8;
  v4[4] = &v5;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

- (NSSet)paymentApplications
{
  return self->_paymentApplications;
}

- (unint64_t)contactlessActivationState
{
  return -[PKSecureElementPass _activationStateForApplicationState:](self, "_activationStateForApplicationState:", -[PKSecureElementPass effectiveContactlessPaymentApplicationState](self, "effectiveContactlessPaymentApplicationState"));
}

- (int64_t)cardType
{
  return self->_cardType;
}

- (BOOL)isTransitPass
{
  int64_t cardType;
  NSSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  cardType = self->_cardType;
  if (cardType == 2)
  {
    LOBYTE(v4) = 1;
  }
  else if (cardType)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = self->_paymentApplications;
    v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v10;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(v3);
          v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
          if (objc_msgSend(v7, "paymentType", (_QWORD)v9) == 1000 && (objc_msgSend(v7, "supportsTransit") & 1) != 0)
          {
            LOBYTE(v4) = 1;
            goto LABEL_16;
          }
        }
        v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_16:

  }
  return v4;
}

- (BOOL)isIdentityPass
{
  return self->_cardType == 4;
}

- (BOOL)isEMoneyPass
{
  BOOL v3;
  void *v4;

  if (self->_cardType == 1 && -[PKSecureElementPass paymentType](self, "paymentType") == 1)
    return 1;
  -[PKSecureElementPass devicePrimaryPaymentApplication](self, "devicePrimaryPaymentApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "paymentType") == 5;

  return v3;
}

- (BOOL)isAppleCardPass
{
  return self->_associatedAccountFeatureIdentifier == 2;
}

- (PKSecureElementPassActivationState)passActivationState
{
  void *v3;
  PKSecureElementPassActivationState v4;

  -[PKSecureElementPass devicePrimaryPaymentApplication](self, "devicePrimaryPaymentApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKSecureElementPass _activationStateForApplicationState:](self, "_activationStateForApplicationState:", objc_msgSend(v3, "state"));

  return v4;
}

- (int64_t)effectiveContactlessPaymentApplicationState
{
  void *v3;
  int64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[PKSecureElementPass devicePrimaryPaymentApplication](self, "devicePrimaryPaymentApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "state");

  if (v4 == 15 || v4 == 1)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[PKSecureElementPass devicePaymentApplications](self, "devicePaymentApplications", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "state");
          if (v4 != v10)
          {
            v4 = v10;
            goto LABEL_13;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v4;
}

- (PKPaymentApplication)devicePrimaryPaymentApplication
{
  void *v3;
  objc_class *v4;
  void *v5;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!self->_devicePaymentApplications)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PKObject initializedViaInitWithCoder](self, "initializedViaInitWithCoder");
    v7 = CFSTR("was not");
    if (v6)
      v7 = CFSTR("was");
    objc_msgSend(v3, "stringWithFormat:", CFSTR("updateDevicePaymentApplicationsWithSecureElementIdentifiers: must be called before calling devicePrimaryPaymentApplication. (%@ %@ initialized via initWithCoder:)"), v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    PKLogFacilityTypeGetObject(6uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v8;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Error: %{public}@. Returning nil.", buf, 0xCu);
    }

  }
  return self->_devicePrimaryPaymentApplication;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKSecureElementPass;
  v5 = -[PKPass encodeWithCoder:](&v17, sel_encodeWithCoder_, v4);
  v6 = (void *)MEMORY[0x19400CFE8](v5);
  PKPaymentCardTypeToString(self->_cardType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("cardType"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_paymentApplications, CFSTR("paymentApplications"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_devicePaymentApplications, CFSTR("devicePaymentApplications"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_deviceInAppPaymentApplications, CFSTR("inAppPaymentApplications"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_devicePrimaryPaymentApplication, CFSTR("devicePrimaryPaymentApplication"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_devicePrimaryContactlessPaymentApplication, CFSTR("devicePrimaryContactlessPaymentApplication"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_devicePrimaryInAppPaymentApplication, CFSTR("devicePrimaryInAppPaymentApplication"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_devicePrimaryBarcodePaymentApplication, CFSTR("devicePrimaryBarcodePaymentApplication"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_associatedApplicationIdentifiers, CFSTR("associatedApplicationIdentifiers"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_associatedWebDomains, CFSTR("associatedWebDomains"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_primaryAccountIdentifier, CFSTR("primaryAccountIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_primaryAccountNumberSuffix, CFSTR("primaryAccountSuffix"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sanitizedPrimaryAccountNumber, CFSTR("sanitizedPrimaryAccountNumber"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sanitizedPrimaryAccountName, CFSTR("sanitizedPrimaryAccountName"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsDPANNotifications);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("supportsDPANNotifications"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsFPANNotifications);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("supportsFPANNotifications"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsDefaultCardSelection);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("supportsDefaultCardSelection"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shellPass);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("isShellPass"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_originalProvisioningDate, CFSTR("originalProvisioningDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_provisioningMetadata, CFSTR("provisioningMetadata"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsSerialNumberBasedProvisioning);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("supportsSerialNumberBasedProvisioning"));

  objc_msgSend(v4, "encodeBool:forKey:", self->_requiresTransferSerialNumberBasedProvisioning, CFSTR("requiresTransferSerialNumberBasedProvisioning"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_contactlessActivationGroupingType == 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("isPaymentOptionSelectable"));

  PKContactlessActivationGroupingTypeToString(self->_contactlessActivationGroupingType);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("contactlessActivationGroupingType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_cobranded);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("isCobranded"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_cobrandName, CFSTR("cobrandName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_issuerCountryCode, CFSTR("issuerCountryCode"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_issuerAdministrativeAreaCode, CFSTR("issuerAdministrativeAreaCode"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_identityAccountKeyIdentifier, CFSTR("identityAccountKeyIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasAssociatedPeerPaymentAccount);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("hasAssociatedPeerPaymentAccount"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_associatedAccountServiceAccountIdentifier, CFSTR("associatedAccountServiceAccountIdentifier"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_associatedAccountFeatureIdentifier, CFSTR("associatedAccountFeatureIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_topLeftBackgroundTitle, CFSTR("topLeftBackgroundTitle"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_topRightBackgroundTitle, CFSTR("topRightBackgroundTitle"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_transactionSourceIdentifier, CFSTR("transactionSourceIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_partnerAccountIdentifier, CFSTR("partnerAccountIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shippingAddressSeed, CFSTR("shippingAddressSeed"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_speakableMake, CFSTR("speakableCarMake"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_speakableModel, CFSTR("speakableCarModel"));
  objc_autoreleasePoolPop(v6);

}

- (unint64_t)associatedAccountFeatureIdentifier
{
  return self->_associatedAccountFeatureIdentifier;
}

uint64_t __83__PKSecureElementPass_updateDevicePaymentApplicationsWithSecureElementIdentifiers___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsBarcodePayment");
}

- (PKSecureElementPass)initWithDictionary:(id)a3 bundle:(id)a4
{
  id v6;
  PKSecureElementPass *v7;
  PKSecureElementPass *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  PKPaymentApplication *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  PKPaymentApplication *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  objc_super v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v74.receiver = self;
  v74.super_class = (Class)PKSecureElementPass;
  v7 = -[PKPass initWithDictionary:bundle:](&v74, sel_initWithDictionary_bundle_, v6, a4);
  v8 = v7;
  if (v6 && v7)
  {
    objc_msgSend(v6, "PKStringForKey:", CFSTR("cardType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setCardType:](v8, "setCardType:", PKPaymentCardTypeFromString(v9));

    v73 = v6;
    v10 = v6;
    objc_msgSend(v10, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("paymentApplications"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("auxiliaryPaymentApplications"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v71 = v12;
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v12, "count") + objc_msgSend(v11, "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = 0u;
      v80 = 0u;
      v81 = 0u;
      v82 = 0u;
      v69 = v11;
      v14 = v11;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v80;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v80 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
            PKValidatePaymentApplicationDict(v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v20)
            {
              v21 = -[PKPaymentApplication initWithPaymentApplicationDictionary:auxiliaryApplication:]([PKPaymentApplication alloc], "initWithPaymentApplicationDictionary:auxiliaryApplication:", v19, 0);
              objc_msgSend(v13, "addObject:", v21);

            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
        }
        while (v16);
      }

      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v22 = v71;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v76;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v76 != v25)
              objc_enumerationMutation(v22);
            v27 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * j);
            PKValidatePaymentApplicationDict(v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v28)
            {
              v29 = -[PKPaymentApplication initWithPaymentApplicationDictionary:auxiliaryApplication:]([PKPaymentApplication alloc], "initWithPaymentApplicationDictionary:auxiliaryApplication:", v27, 1);
              objc_msgSend(v13, "addObject:", v29);

            }
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
        }
        while (v24);
      }

      v11 = v69;
      v12 = v71;
    }
    else
    {
      v13 = 0;
    }
    if (objc_msgSend(v13, "count"))
      v30 = v13;
    else
      v30 = 0;
    v31 = v30;

    -[PKSecureElementPass setPaymentApplications:](v8, "setPaymentApplications:", v31);
    v32 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v10, "PKArrayForKey:", CFSTR("associatedApplicationIdentifiers"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setWithArray:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setAssociatedApplicationIdentifiers:](v8, "setAssociatedApplicationIdentifiers:", v34);

    v35 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v10, "PKArrayForKey:", CFSTR("associatedWebDomains"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setWithArray:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setAssociatedWebDomains:](v8, "setAssociatedWebDomains:", v37);

    objc_msgSend(v10, "PKStringForKey:", CFSTR("primaryAccountIdentifier"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setPrimaryAccountIdentifier:](v8, "setPrimaryAccountIdentifier:", v38);

    objc_msgSend(v10, "PKStringForKey:", CFSTR("primaryAccountSuffix"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setPrimaryAccountNumberSuffix:](v8, "setPrimaryAccountNumberSuffix:", v39);

    objc_msgSend(v10, "PKStringForKey:", CFSTR("sanitizedPrimaryAccountNumber"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setSanitizedPrimaryAccountNumber:](v8, "setSanitizedPrimaryAccountNumber:", v40);

    objc_msgSend(v10, "PKStringForKey:", CFSTR("sanitizedPrimaryAccountName"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setSanitizedPrimaryAccountName:](v8, "setSanitizedPrimaryAccountName:", v41);

    objc_msgSend(v10, "PKStringForKey:", CFSTR("topLeftBackgroundTitle"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setTopLeftBackgroundTitle:](v8, "setTopLeftBackgroundTitle:", v42);

    objc_msgSend(v10, "PKStringForKey:", CFSTR("topRightBackgroundTitle"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setTopRightBackgroundTitle:](v8, "setTopRightBackgroundTitle:", v43);

    objc_msgSend(v10, "PKStringForKey:", CFSTR("transactionServiceURL"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v44, "length"))
    {
      objc_msgSend(v10, "PKStringForKey:", CFSTR("transactionPushTopic"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "length") != 0;

    }
    else
    {
      v46 = 0;
    }

    objc_msgSend(v10, "objectForKey:", CFSTR("supportsDPANNotifications"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v46;
    if (v47)
      v48 = objc_msgSend(v10, "PKBoolForKey:", CFSTR("supportsDPANNotifications"));

    -[PKSecureElementPass setSupportsDPANNotifications:](v8, "setSupportsDPANNotifications:", v48);
    objc_msgSend(v10, "objectForKey:", CFSTR("supportsFPANNotifications"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
      v46 = objc_msgSend(v10, "PKBoolForKey:", CFSTR("supportsFPANNotifications"));

    -[PKSecureElementPass setSupportsFPANNotifications:](v8, "setSupportsFPANNotifications:", v46);
    objc_msgSend(v10, "objectForKey:", CFSTR("supportsDefaultCardSelection"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50)
      v51 = objc_msgSend(v10, "PKBoolForKey:", CFSTR("supportsDefaultCardSelection"));
    else
      v51 = 1;

    -[PKSecureElementPass setSupportsDefaultCardSelection:](v8, "setSupportsDefaultCardSelection:", v51);
    objc_msgSend(v10, "objectForKey:", CFSTR("supportsSerialNumberBasedProvisioning"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (v52)
      v53 = objc_msgSend(v10, "PKBoolForKey:", CFSTR("supportsSerialNumberBasedProvisioning"));
    else
      v53 = 1;

    -[PKSecureElementPass setSupportsSerialNumberBasedProvisioning:](v8, "setSupportsSerialNumberBasedProvisioning:", v53);
    objc_msgSend(v10, "objectForKey:", CFSTR("requiresTransferSerialNumberBasedProvisioning"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (v54)
      v55 = objc_msgSend(v10, "PKBoolForKey:", CFSTR("requiresTransferSerialNumberBasedProvisioning"));
    else
      v55 = 0;

    -[PKSecureElementPass setRequiresTransferSerialNumberBasedProvisioning:](v8, "setRequiresTransferSerialNumberBasedProvisioning:", v55);
    objc_msgSend(v10, "PKStringForKey:", CFSTR("contactlessActivationGroupingType"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v56;
    if (v56)
    {
      v57 = PKContactlessActivationGroupingTypeFromString(v56);
    }
    else
    {
      objc_msgSend(v10, "objectForKey:", CFSTR("isPaymentOptionSelectable"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if (v58)
      {
        if (objc_msgSend(v10, "PKBoolForKey:", CFSTR("isPaymentOptionSelectable")))
          v57 = 2;
        else
          v57 = 1;
      }
      else
      {
        v57 = 2;
      }

    }
    -[PKSecureElementPass setContactlessActivationGroupingType:](v8, "setContactlessActivationGroupingType:", v57);
    -[PKSecureElementPass setCobranded:](v8, "setCobranded:", objc_msgSend(v10, "PKBoolForKey:", CFSTR("isCobranded")));
    objc_msgSend(v10, "PKStringForKey:", CFSTR("cobrandName"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setCobrandName:](v8, "setCobrandName:", v70);
    objc_msgSend(v10, "PKStringForKey:", CFSTR("issuerCountryCode"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setIssuerCountryCode:](v8, "setIssuerCountryCode:", v59);
    objc_msgSend(v10, "PKStringForKey:", CFSTR("issuerAdministrativeAreaCode"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setIssuerAdministrativeAreaCode:](v8, "setIssuerAdministrativeAreaCode:", v60);
    objc_msgSend(v10, "PKStringForKey:", CFSTR("identityAccountKeyIdentifier"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setIdentityAccountKeyIdentifier:](v8, "setIdentityAccountKeyIdentifier:", v61);
    -[PKSecureElementPass setHasAssociatedPeerPaymentAccount:](v8, "setHasAssociatedPeerPaymentAccount:", objc_msgSend(v10, "PKBoolForKey:", CFSTR("hasAssociatedPeerPaymentAccount")));
    -[PKSecureElementPass setShellPass:](v8, "setShellPass:", objc_msgSend(v10, "PKBoolForKey:", CFSTR("isShellPass")));
    objc_msgSend(v10, "PKDateForKey:", CFSTR("originalProvisioningDate"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setOriginalProvisioningDate:](v8, "setOriginalProvisioningDate:", v62);
    objc_msgSend(v10, "PKStringForKey:", CFSTR("associatedAccountServiceAccountIdentifier"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setAssociatedAccountServiceAccountIdentifier:](v8, "setAssociatedAccountServiceAccountIdentifier:", v63);
    objc_msgSend(v10, "PKStringForKey:", CFSTR("partnerAccountIdentifier"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setPartnerAccountIdentifier:](v8, "setPartnerAccountIdentifier:", v64);
    objc_msgSend(v10, "PKStringForKey:", CFSTR("shippingAddressSeed"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setShippingAddressSeed:](v8, "setShippingAddressSeed:", v65);
    objc_msgSend(v10, "PKStringForKey:", CFSTR("speakableCarMake"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setSpeakableMake:](v8, "setSpeakableMake:", v66);
    objc_msgSend(v10, "PKStringForKey:", CFSTR("speakableCarModel"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setSpeakableModel:](v8, "setSpeakableModel:", v67);

    v6 = v73;
  }

  return v8;
}

+ (unint64_t)defaultSettings
{
  return 72;
}

- (PKSecureElementPass)initWithCoder:(id)a3
{
  id v4;
  PKSecureElementPass *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v64;
  objc_super v65;

  v4 = a3;
  v65.receiver = self;
  v65.super_class = (Class)PKSecureElementPass;
  v5 = -[PKPass initWithCoder:](&v65, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = MEMORY[0x19400CFE8]();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cardType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setCardType:](v5, "setCardType:", PKPaymentCardTypeFromString(v7));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionSourceIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setTransactionSourceIdentifier:](v5, "setTransactionSourceIdentifier:", v8);

    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x19400CFE8]();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("paymentApplications"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setPaymentApplications:](v5, "setPaymentApplications:", v13);

    objc_autoreleasePoolPop(v12);
    v14 = (void *)MEMORY[0x19400CFE8]();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("devicePaymentApplications"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("devicePaymentApplication"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    v64 = (void *)v6;
    if (v15)
    {
      -[PKSecureElementPass setDevicePaymentApplications:](v5, "setDevicePaymentApplications:", v15);
    }
    else if (v16)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSecureElementPass setDevicePaymentApplications:](v5, "setDevicePaymentApplications:", v18);

    }
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("inAppPaymentApplications"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setDeviceInAppPaymentApplications:](v5, "setDeviceInAppPaymentApplications:", v19);

    objc_autoreleasePoolPop(v14);
    v20 = (void *)MEMORY[0x19400CFE8]();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("devicePrimaryPaymentApplication"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setDevicePrimaryPaymentApplication:](v5, "setDevicePrimaryPaymentApplication:", v21);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("devicePrimaryContactlessPaymentApplication"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setDevicePrimaryContactlessPaymentApplication:](v5, "setDevicePrimaryContactlessPaymentApplication:", v22);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("devicePrimaryInAppPaymentApplication"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setDevicePrimaryInAppPaymentApplication:](v5, "setDevicePrimaryInAppPaymentApplication:", v23);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("devicePrimaryBarcodePaymentApplication"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setDevicePrimaryBarcodePaymentApplication:](v5, "setDevicePrimaryBarcodePaymentApplication:", v24);

    objc_autoreleasePoolPop(v20);
    v25 = (void *)MEMORY[0x1E0C99E60];
    v26 = objc_opt_class();
    objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("associatedApplicationIdentifiers"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setAssociatedApplicationIdentifiers:](v5, "setAssociatedApplicationIdentifiers:", v28);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("associatedWebDomains"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setAssociatedWebDomains:](v5, "setAssociatedWebDomains:", v29);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryAccountIdentifier"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setPrimaryAccountIdentifier:](v5, "setPrimaryAccountIdentifier:", v30);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryAccountSuffix"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setPrimaryAccountNumberSuffix:](v5, "setPrimaryAccountNumberSuffix:", v31);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sanitizedPrimaryAccountNumber"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setSanitizedPrimaryAccountNumber:](v5, "setSanitizedPrimaryAccountNumber:", v32);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sanitizedPrimaryAccountName"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setSanitizedPrimaryAccountName:](v5, "setSanitizedPrimaryAccountName:", v33);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supportsDPANNotifications"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setSupportsDPANNotifications:](v5, "setSupportsDPANNotifications:", objc_msgSend(v34, "BOOLValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supportsFPANNotifications"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setSupportsFPANNotifications:](v5, "setSupportsFPANNotifications:", objc_msgSend(v35, "BOOLValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supportsDefaultCardSelection"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setSupportsDefaultCardSelection:](v5, "setSupportsDefaultCardSelection:", objc_msgSend(v36, "BOOLValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isShellPass"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setShellPass:](v5, "setShellPass:", objc_msgSend(v37, "BOOLValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originalProvisioningDate"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setOriginalProvisioningDate:](v5, "setOriginalProvisioningDate:", v38);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("provisioningMetadata"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setProvisioningMetadata:](v5, "setProvisioningMetadata:", v39);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supportsSerialNumberBasedProvisioning"));
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = (void *)v40;
    v42 = (void *)MEMORY[0x1E0C9AAB0];
    if (v40)
      v42 = (void *)v40;
    v43 = v42;

    v44 = objc_msgSend(v43, "BOOLValue");
    -[PKSecureElementPass setSupportsSerialNumberBasedProvisioning:](v5, "setSupportsSerialNumberBasedProvisioning:", v44);
    -[PKSecureElementPass setRequiresTransferSerialNumberBasedProvisioning:](v5, "setRequiresTransferSerialNumberBasedProvisioning:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresTransferSerialNumberBasedProvisioning")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contactlessActivationGroupingType"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v45;
    if (v45)
    {
      v47 = PKContactlessActivationGroupingTypeFromString(v45);
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isPaymentOptionSelectable"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "BOOLValue");

      if (v49)
        v47 = 2;
      else
        v47 = 1;
    }
    v5->_contactlessActivationGroupingType = v47;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isCobranded"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setCobranded:](v5, "setCobranded:", objc_msgSend(v50, "BOOLValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cobrandName"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setCobrandName:](v5, "setCobrandName:", v51);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("issuerCountryCode"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setIssuerCountryCode:](v5, "setIssuerCountryCode:", v52);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("issuerAdministrativeAreaCode"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setIssuerAdministrativeAreaCode:](v5, "setIssuerAdministrativeAreaCode:", v53);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identityAccountKeyIdentifier"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setIdentityAccountKeyIdentifier:](v5, "setIdentityAccountKeyIdentifier:", v54);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hasAssociatedPeerPaymentAccount"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setHasAssociatedPeerPaymentAccount:](v5, "setHasAssociatedPeerPaymentAccount:", objc_msgSend(v55, "BOOLValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedAccountServiceAccountIdentifier"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setAssociatedAccountServiceAccountIdentifier:](v5, "setAssociatedAccountServiceAccountIdentifier:", v56);

    -[PKSecureElementPass setAssociatedAccountFeatureIdentifier:](v5, "setAssociatedAccountFeatureIdentifier:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("associatedAccountFeatureIdentifier")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("topLeftBackgroundTitle"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setTopLeftBackgroundTitle:](v5, "setTopLeftBackgroundTitle:", v57);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("topRightBackgroundTitle"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setTopRightBackgroundTitle:](v5, "setTopRightBackgroundTitle:", v58);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("partnerAccountIdentifier"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setPartnerAccountIdentifier:](v5, "setPartnerAccountIdentifier:", v59);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shippingAddressSeed"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setShippingAddressSeed:](v5, "setShippingAddressSeed:", v60);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("speakableCarMake"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setSpeakableMake:](v5, "setSpeakableMake:", v61);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("speakableCarModel"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSecureElementPass setSpeakableModel:](v5, "setSpeakableModel:", v62);

    objc_autoreleasePoolPop(v64);
  }

  return v5;
}

- (void)setSupportsSerialNumberBasedProvisioning:(BOOL)a3
{
  self->_supportsSerialNumberBasedProvisioning = a3;
}

- (void)setSupportsFPANNotifications:(BOOL)a3
{
  self->_supportsFPANNotifications = a3;
}

- (void)setSupportsDefaultCardSelection:(BOOL)a3
{
  self->_supportsDefaultCardSelection = a3;
}

- (void)setSupportsDPANNotifications:(BOOL)a3
{
  self->_supportsDPANNotifications = a3;
}

- (void)setShippingAddressSeed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 888);
}

- (void)setShellPass:(BOOL)a3
{
  self->_shellPass = a3;
}

- (void)setSanitizedPrimaryAccountNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 640);
}

- (void)setSanitizedPrimaryAccountName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 648);
}

- (void)setRequiresTransferSerialNumberBasedProvisioning:(BOOL)a3
{
  self->_requiresTransferSerialNumberBasedProvisioning = a3;
}

- (void)setPrimaryAccountNumberSuffix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 608);
}

- (void)setPrimaryAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 600);
}

- (void)setPaymentApplications:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 736);
}

- (void)setPartnerAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 792);
}

- (void)setOriginalProvisioningDate:(id)a3
{
  objc_storeStrong((id *)&self->_originalProvisioningDate, a3);
}

- (void)setIssuerCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 672);
}

- (void)setIssuerAdministrativeAreaCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 680);
}

- (void)setIdentityAccountKeyIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 688);
}

- (void)setHasAssociatedPeerPaymentAccount:(BOOL)a3
{
  self->_hasAssociatedPeerPaymentAccount = a3;
}

- (void)setCobranded:(BOOL)a3
{
  self->_cobranded = a3;
}

- (void)setCardType:(int64_t)a3
{
  self->_cardType = a3;
}

- (void)setAssociatedWebDomains:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 632);
}

- (void)setAssociatedApplicationIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 624);
}

- (void)setAssociatedAccountServiceAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 656);
}

- (void)setTransactionSourceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 800);
}

- (void)setProvisioningMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_provisioningMetadata, a3);
}

- (void)setAssociatedAccountFeatureIdentifier:(unint64_t)a3
{
  self->_associatedAccountFeatureIdentifier = a3;
}

- (void)setTopRightBackgroundTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 728);
}

- (void)setTopLeftBackgroundTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 720);
}

- (void)setSpeakableModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 904);
}

- (void)setSpeakableMake:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 896);
}

- (void)setCobrandName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 808);
}

- (void)setDevicePrimaryPaymentApplication:(id)a3
{
  objc_storeStrong((id *)&self->_devicePrimaryPaymentApplication, a3);
}

- (void)setDevicePrimaryInAppPaymentApplication:(id)a3
{
  objc_storeStrong((id *)&self->_devicePrimaryInAppPaymentApplication, a3);
}

- (void)setDevicePrimaryContactlessPaymentApplication:(id)a3
{
  objc_storeStrong((id *)&self->_devicePrimaryContactlessPaymentApplication, a3);
}

- (void)setDevicePrimaryBarcodePaymentApplication:(id)a3
{
  objc_storeStrong((id *)&self->_devicePrimaryBarcodePaymentApplication, a3);
}

- (void)setDevicePaymentApplications:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 744);
}

- (void)setDeviceInAppPaymentApplications:(id)a3
{
  objc_storeStrong((id *)&self->_deviceInAppPaymentApplications, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)supportsDeviceAssessmentAccordingToService:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[PKSecureElementPass devicePaymentApplications](self, "devicePaymentApplications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__PKSecureElementPass_supportsDeviceAssessmentAccordingToService___block_invoke;
  v9[3] = &unk_1E2AC9680;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "pk_hasObjectPassingTest:", v9);

  return v7;
}

- (NSSet)devicePaymentApplications
{
  NSSet *devicePaymentApplications;
  void *v4;
  objc_class *v5;
  void *v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;
  NSObject *v10;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  devicePaymentApplications = self->_devicePaymentApplications;
  if (!devicePaymentApplications)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PKObject initializedViaInitWithCoder](self, "initializedViaInitWithCoder");
    v8 = CFSTR("was not");
    if (v7)
      v8 = CFSTR("was");
    objc_msgSend(v4, "stringWithFormat:", CFSTR("updateDevicePaymentApplicationsWithSecureElementIdentifiers: must be called before calling devicePaymentApplications. (%@ %@ initialized via initWithCoder:)"), v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    PKLogFacilityTypeGetObject(6uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v9;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Error: %{public}@. Returning nil.", buf, 0xCu);
    }

    devicePaymentApplications = self->_devicePaymentApplications;
  }
  return devicePaymentApplications;
}

- (BOOL)isPaymentOptionSelectable
{
  return self->_contactlessActivationGroupingType == 2;
}

uint64_t __45__PKSecureElementPass_supportsBarcodePayment__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "supportsBarcodePayment");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

- (void)updateDevicePaymentApplicationsWithSecureElementIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSSet *paymentApplications;
  id v8;
  NSSet *v9;
  NSSet *devicePaymentApplications;
  PKPaymentApplication **p_devicePrimaryPaymentApplication;
  PKPaymentApplication *v12;
  void *devicePrimaryContactlessPaymentApplication;
  NSObject *v14;
  void *v15;
  void *v16;
  PKPaymentApplication *v17;
  PKPaymentApplication *v18;
  PKPaymentApplication *v19;
  void *devicePrimaryBarcodePaymentApplication;
  void *v21;
  void *v22;
  PKPaymentApplication *v23;
  PKPaymentApplication *v24;
  id v25;
  NSSet *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  NSSet *v32;
  NSSet *deviceInAppPaymentApplications;
  PKPaymentApplication *v34;
  void *devicePrimaryInAppPaymentApplication;
  void *v36;
  PKPaymentApplication *v37;
  PKPaymentApplication *v38;
  PKPaymentApplication *v39;
  void *v40;
  PKPaymentApplication *v41;
  PKPaymentApplication *v42;
  NSObject *v43;
  const char *v44;
  void *v45;
  _BOOL4 v46;
  NSObject *v47;
  uint32_t v48;
  NSSet *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[4];
  id v55;
  uint8_t *v56;
  uint8_t buf[8];
  uint8_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint8_t v63[4];
  void *v64;
  __int16 v65;
  NSSet *v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    *(_QWORD *)buf = 0;
    v58 = buf;
    v59 = 0x3032000000;
    v60 = __Block_byref_object_copy__22;
    v61 = __Block_byref_object_dispose__22;
    v62 = 0;
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    paymentApplications = self->_paymentApplications;
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __83__PKSecureElementPass_updateDevicePaymentApplicationsWithSecureElementIdentifiers___block_invoke;
    v54[3] = &unk_1E2AC9618;
    v56 = buf;
    v8 = v6;
    v55 = v8;
    EnumerateApplicationsForSEIDs(paymentApplications, v5, v54);
    v9 = (NSSet *)objc_msgSend(v8, "copy");
    devicePaymentApplications = self->_devicePaymentApplications;
    self->_devicePaymentApplications = v9;

    p_devicePrimaryPaymentApplication = &self->_devicePrimaryPaymentApplication;
    objc_storeStrong((id *)&self->_devicePrimaryPaymentApplication, *((id *)v58 + 5));
    if (-[PKPaymentApplication supportsContactlessPayment](self->_devicePrimaryPaymentApplication, "supportsContactlessPayment"))
    {
      v12 = *p_devicePrimaryPaymentApplication;
      devicePrimaryContactlessPaymentApplication = self->_devicePrimaryContactlessPaymentApplication;
      self->_devicePrimaryContactlessPaymentApplication = v12;
    }
    else
    {
      -[NSSet objectsPassingTest:](self->_devicePaymentApplications, "objectsPassingTest:", &__block_literal_global_74);
      devicePrimaryContactlessPaymentApplication = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(devicePrimaryContactlessPaymentApplication, "allObjects");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSecureElementPass sortedPaymentApplications:ascending:](self, "sortedPaymentApplications:ascending:", v15, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firstObject");
      v17 = (PKPaymentApplication *)objc_claimAutoreleasedReturnValue();
      v18 = self->_devicePrimaryContactlessPaymentApplication;
      self->_devicePrimaryContactlessPaymentApplication = v17;

    }
    if (-[PKPaymentApplication supportsBarcodePayment](self->_devicePrimaryBarcodePaymentApplication, "supportsBarcodePayment"))
    {
      v19 = *p_devicePrimaryPaymentApplication;
      devicePrimaryBarcodePaymentApplication = self->_devicePrimaryBarcodePaymentApplication;
      self->_devicePrimaryBarcodePaymentApplication = v19;
    }
    else
    {
      -[NSSet objectsPassingTest:](self->_devicePaymentApplications, "objectsPassingTest:", &__block_literal_global_75);
      devicePrimaryBarcodePaymentApplication = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(devicePrimaryBarcodePaymentApplication, "allObjects");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSecureElementPass sortedPaymentApplications:ascending:](self, "sortedPaymentApplications:ascending:", v21, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "firstObject");
      v23 = (PKPaymentApplication *)objc_claimAutoreleasedReturnValue();
      v24 = self->_devicePrimaryBarcodePaymentApplication;
      self->_devicePrimaryBarcodePaymentApplication = v23;

    }
    v25 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v26 = self->_devicePaymentApplications;
    v27 = -[NSSet countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v50, v67, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v51 != v28)
            objc_enumerationMutation(v26);
          v30 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          if ((objc_msgSend(v30, "supportsInAppPayment") & 1) != 0)
          {
            if (objc_msgSend(v30, "supportsComboCard"))
            {
              objc_msgSend(v30, "paymentApplicationsIncludingAuxiliaryPaymentTypes");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "addObjectsFromArray:", v31);

            }
            else
            {
              objc_msgSend(v25, "addObject:", v30);
            }
          }
        }
        v27 = -[NSSet countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v50, v67, 16);
      }
      while (v27);
    }

    v32 = (NSSet *)objc_msgSend(v25, "copy");
    deviceInAppPaymentApplications = self->_deviceInAppPaymentApplications;
    self->_deviceInAppPaymentApplications = v32;

    if (-[PKPaymentApplication supportsInAppPayment](*p_devicePrimaryPaymentApplication, "supportsInAppPayment"))
    {
      v34 = *p_devicePrimaryPaymentApplication;
      devicePrimaryInAppPaymentApplication = self->_devicePrimaryInAppPaymentApplication;
      self->_devicePrimaryInAppPaymentApplication = v34;
    }
    else
    {
      -[NSSet allObjects](self->_deviceInAppPaymentApplications, "allObjects");
      devicePrimaryInAppPaymentApplication = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSecureElementPass sortedPaymentApplications:ascending:](self, "sortedPaymentApplications:ascending:", devicePrimaryInAppPaymentApplication, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "firstObject");
      v37 = (PKPaymentApplication *)objc_claimAutoreleasedReturnValue();
      v38 = self->_devicePrimaryInAppPaymentApplication;
      self->_devicePrimaryInAppPaymentApplication = v37;

    }
    v39 = self->_devicePrimaryInAppPaymentApplication;
    if (v39 && -[PKPaymentApplication supportsComboCard](v39, "supportsComboCard"))
    {
      -[PKPaymentApplication paymentApplicationsIncludingAuxiliaryPaymentTypes](self->_devicePrimaryInAppPaymentApplication, "paymentApplicationsIncludingAuxiliaryPaymentTypes");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "firstObject");
      v41 = (PKPaymentApplication *)objc_claimAutoreleasedReturnValue();
      v42 = self->_devicePrimaryInAppPaymentApplication;
      self->_devicePrimaryInAppPaymentApplication = v41;

    }
    if (*p_devicePrimaryPaymentApplication)
      goto LABEL_39;
    if (-[PKSecureElementPass hasAssociatedPeerPaymentAccount](self, "hasAssociatedPeerPaymentAccount"))
    {
      PKLogFacilityTypeGetObject(6uLL);
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v63 = 0;
        v44 = "PeerPayment pass found without devicePrimaryPaymentApplication. This could be the ghost pass.";
LABEL_36:
        v47 = v43;
        v48 = 2;
LABEL_37:
        _os_log_impl(&dword_18FC92000, v47, OS_LOG_TYPE_DEFAULT, v44, v63, v48);
      }
    }
    else
    {
      -[PKSecureElementPass associatedAccountServiceAccountIdentifier](self, "associatedAccountServiceAccountIdentifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      PKLogFacilityTypeGetObject(6uLL);
      v43 = objc_claimAutoreleasedReturnValue();
      v46 = os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);
      if (!v45)
      {
        if (!v46)
          goto LABEL_38;
        v49 = self->_paymentApplications;
        *(_DWORD *)v63 = 138412546;
        v64 = v5;
        v65 = 2112;
        v66 = v49;
        v44 = "Failed to find devicePrimaryPaymentApplication for seids: %@ in payment applications: %@";
        v47 = v43;
        v48 = 22;
        goto LABEL_37;
      }
      if (v46)
      {
        *(_WORD *)v63 = 0;
        v44 = "Pass with associatedAccountServiceAccountIdentifier found without devicePrimaryPaymentApplication. This co"
              "uld be the ghost pass.";
        goto LABEL_36;
      }
    }
LABEL_38:

LABEL_39:
    _Block_object_dispose(buf, 8);

    goto LABEL_40;
  }
  PKLogFacilityTypeGetObject(6uLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Error: PKPaymentPass updateDevicePaymentApplicationsWithSecureElementIdentifiers: called with no identifiers. Here be dragons!", buf, 2u);
  }

LABEL_40:
}

- (id)sortedPaymentApplications:(id)a3 ascending:(BOOL)a4
{
  return PKSortedPaymentApplicationsByAID(a3, self->_devicePrimaryPaymentApplication, a4);
}

- (BOOL)hasAssociatedPeerPaymentAccount
{
  return self->_hasAssociatedPeerPaymentAccount;
}

- (NSString)associatedAccountServiceAccountIdentifier
{
  return self->_associatedAccountServiceAccountIdentifier;
}

void __83__PKSecureElementPass_updateDevicePaymentApplicationsWithSecureElementIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;
  char v6;
  id v7;

  v4 = a2;
  v5 = v4;
  v7 = v4;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v6 = objc_msgSend(v4, "isAuxiliary");
    v5 = v7;
    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      v5 = v7;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

- (PKCurrencyAmount)peerPaymentBalance
{
  void *v3;

  if (-[PKSecureElementPass hasAssociatedPeerPaymentAccount](self, "hasAssociatedPeerPaymentAccount"))
  {
    objc_getAssociatedObject(self, sel_peerPaymentBalance);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (PKCurrencyAmount *)v3;
}

- (void)setPeerPaymentBalance:(id)a3
{
  objc_setAssociatedObject(self, sel_peerPaymentBalance, a3, (void *)1);
}

- (FKAccount)bankConnectAccount
{
  return (FKAccount *)objc_getAssociatedObject(self, sel_bankConnectAccount);
}

- (void)setBankConnectAccount:(id)a3
{
  objc_setAssociatedObject(self, sel_bankConnectAccount, a3, (void *)1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  objc_super v59;

  v59.receiver = self;
  v59.super_class = (Class)PKSecureElementPass;
  v5 = -[PKPass copyWithZone:](&v59, sel_copyWithZone_);
  *((_QWORD *)v5 + 77) = self->_cardType;
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithSet:copyItems:", self->_paymentApplications, 1);
  v7 = (void *)*((_QWORD *)v5 + 92);
  *((_QWORD *)v5 + 92) = v6;

  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithSet:copyItems:", self->_devicePaymentApplications, 1);
  v9 = (void *)*((_QWORD *)v5 + 93);
  *((_QWORD *)v5 + 93) = v8;

  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithSet:copyItems:", self->_deviceInAppPaymentApplications, 1);
  v11 = (void *)*((_QWORD *)v5 + 98);
  *((_QWORD *)v5 + 98) = v10;

  v12 = -[PKPaymentApplication copyWithZone:](self->_devicePrimaryPaymentApplication, "copyWithZone:", a3);
  v13 = (void *)*((_QWORD *)v5 + 94);
  *((_QWORD *)v5 + 94) = v12;

  v14 = -[PKPaymentApplication copyWithZone:](self->_devicePrimaryContactlessPaymentApplication, "copyWithZone:", a3);
  v15 = (void *)*((_QWORD *)v5 + 95);
  *((_QWORD *)v5 + 95) = v14;

  v16 = -[PKPaymentApplication copyWithZone:](self->_devicePrimaryInAppPaymentApplication, "copyWithZone:", a3);
  v17 = (void *)*((_QWORD *)v5 + 96);
  *((_QWORD *)v5 + 96) = v16;

  v18 = -[PKPaymentApplication copyWithZone:](self->_devicePrimaryBarcodePaymentApplication, "copyWithZone:", a3);
  v19 = (void *)*((_QWORD *)v5 + 97);
  *((_QWORD *)v5 + 97) = v18;

  v20 = -[NSSet copyWithZone:](self->_associatedApplicationIdentifiers, "copyWithZone:", a3);
  v21 = (void *)*((_QWORD *)v5 + 78);
  *((_QWORD *)v5 + 78) = v20;

  v22 = -[NSSet copyWithZone:](self->_associatedWebDomains, "copyWithZone:", a3);
  v23 = (void *)*((_QWORD *)v5 + 79);
  *((_QWORD *)v5 + 79) = v22;

  v24 = -[NSString copyWithZone:](self->_primaryAccountIdentifier, "copyWithZone:", a3);
  v25 = (void *)*((_QWORD *)v5 + 75);
  *((_QWORD *)v5 + 75) = v24;

  v26 = -[NSString copyWithZone:](self->_primaryAccountNumberSuffix, "copyWithZone:", a3);
  v27 = (void *)*((_QWORD *)v5 + 76);
  *((_QWORD *)v5 + 76) = v26;

  v28 = -[NSString copyWithZone:](self->_sanitizedPrimaryAccountNumber, "copyWithZone:", a3);
  v29 = (void *)*((_QWORD *)v5 + 80);
  *((_QWORD *)v5 + 80) = v28;

  v30 = -[NSString copyWithZone:](self->_sanitizedPrimaryAccountName, "copyWithZone:", a3);
  v31 = (void *)*((_QWORD *)v5 + 81);
  *((_QWORD *)v5 + 81) = v30;

  *((_BYTE *)v5 + 584) = self->_supportsDPANNotifications;
  *((_BYTE *)v5 + 585) = self->_supportsFPANNotifications;
  *((_BYTE *)v5 + 586) = self->_supportsDefaultCardSelection;
  *((_BYTE *)v5 + 590) = self->_shellPass;
  v32 = -[NSDate copyWithZone:](self->_originalProvisioningDate, "copyWithZone:", a3);
  v33 = (void *)*((_QWORD *)v5 + 88);
  *((_QWORD *)v5 + 88) = v32;

  v34 = -[PKPassProvisioningMetadata copy](self->_provisioningMetadata, "copy");
  v35 = (void *)*((_QWORD *)v5 + 89);
  *((_QWORD *)v5 + 89) = v34;

  *((_BYTE *)v5 + 589) = self->_supportsSerialNumberBasedProvisioning;
  *((_BYTE *)v5 + 592) = self->_requiresTransferSerialNumberBasedProvisioning;
  *((_QWORD *)v5 + 87) = self->_contactlessActivationGroupingType;
  *((_BYTE *)v5 + 591) = self->_cobranded;
  v36 = -[NSString copyWithZone:](self->_cobrandName, "copyWithZone:", a3);
  v37 = (void *)*((_QWORD *)v5 + 101);
  *((_QWORD *)v5 + 101) = v36;

  v38 = -[NSString copyWithZone:](self->_issuerCountryCode, "copyWithZone:", a3);
  v39 = (void *)*((_QWORD *)v5 + 84);
  *((_QWORD *)v5 + 84) = v38;

  v40 = -[NSString copyWithZone:](self->_issuerAdministrativeAreaCode, "copyWithZone:", a3);
  v41 = (void *)*((_QWORD *)v5 + 85);
  *((_QWORD *)v5 + 85) = v40;

  v42 = -[NSString copyWithZone:](self->_identityAccountKeyIdentifier, "copyWithZone:", a3);
  v43 = (void *)*((_QWORD *)v5 + 86);
  *((_QWORD *)v5 + 86) = v42;

  *((_BYTE *)v5 + 587) = self->_hasAssociatedPeerPaymentAccount;
  objc_storeStrong((id *)v5 + 82, self->_associatedAccountServiceAccountIdentifier);
  *((_QWORD *)v5 + 83) = self->_associatedAccountFeatureIdentifier;
  v44 = -[NSString copyWithZone:](self->_topLeftBackgroundTitle, "copyWithZone:", a3);
  v45 = (void *)*((_QWORD *)v5 + 90);
  *((_QWORD *)v5 + 90) = v44;

  v46 = -[NSString copyWithZone:](self->_topRightBackgroundTitle, "copyWithZone:", a3);
  v47 = (void *)*((_QWORD *)v5 + 91);
  *((_QWORD *)v5 + 91) = v46;

  v48 = -[NSString copyWithZone:](self->_transactionSourceIdentifier, "copyWithZone:", a3);
  v49 = (void *)*((_QWORD *)v5 + 100);
  *((_QWORD *)v5 + 100) = v48;

  v50 = -[NSString copyWithZone:](self->_partnerAccountIdentifier, "copyWithZone:", a3);
  v51 = (void *)*((_QWORD *)v5 + 99);
  *((_QWORD *)v5 + 99) = v50;

  v52 = -[NSString copyWithZone:](self->_shippingAddressSeed, "copyWithZone:", a3);
  v53 = (void *)*((_QWORD *)v5 + 111);
  *((_QWORD *)v5 + 111) = v52;

  v54 = -[NSString copyWithZone:](self->_speakableMake, "copyWithZone:", a3);
  v55 = (void *)*((_QWORD *)v5 + 112);
  *((_QWORD *)v5 + 112) = v54;

  v56 = -[NSString copyWithZone:](self->_speakableModel, "copyWithZone:", a3);
  v57 = (void *)*((_QWORD *)v5 + 113);
  *((_QWORD *)v5 + 113) = v56;

  return v5;
}

- (BOOL)isEqualToPassIncludingMetadata:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKSecureElementPass;
  if (-[PKPass isEqualToPassIncludingMetadata:](&v10, sel_isEqualToPassIncludingMetadata_, v4))
  {
    -[PKPass paymentPass](self, "paymentPass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "associatedAccountFeatureIdentifier");
    objc_msgSend(v4, "paymentPass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6 == objc_msgSend(v7, "associatedAccountFeatureIdentifier");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)primaryPaymentApplicationForSecureElementIdentifiers:(id)a3
{
  id v4;
  NSSet *paymentApplications;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__22;
  v13 = __Block_byref_object_dispose__22;
  paymentApplications = self->_paymentApplications;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__PKSecureElementPass_primaryPaymentApplicationForSecureElementIdentifiers___block_invoke;
  v8[3] = &unk_1E2AC95A8;
  v8[4] = &v9;
  EnumerateApplicationsForSEIDs(paymentApplications, v4, v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __76__PKSecureElementPass_primaryPaymentApplicationForSecureElementIdentifiers___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if ((objc_msgSend(v6, "isAuxiliary") & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (id)paymentApplicationsForSecureElementIdentifiers:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  NSSet *paymentApplications;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  paymentApplications = self->_paymentApplications;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__PKSecureElementPass_paymentApplicationsForSecureElementIdentifiers___block_invoke;
  v11[3] = &unk_1E2AC95D0;
  v12 = v6;
  v8 = v6;
  EnumerateApplicationsForSEIDs(paymentApplications, v5, v11);

  v9 = (void *)objc_msgSend(v8, "copy");
  return v9;
}

uint64_t __70__PKSecureElementPass_paymentApplicationsForSecureElementIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)paymentApplicationForAID:(id)a3
{
  id v4;
  NSSet *paymentApplications;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__22;
  v16 = __Block_byref_object_dispose__22;
  v17 = 0;
  paymentApplications = self->_paymentApplications;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__PKSecureElementPass_paymentApplicationForAID___block_invoke;
  v9[3] = &unk_1E2AC9618;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[NSSet enumerateObjectsUsingBlock:](paymentApplications, "enumerateObjectsUsingBlock:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __48__PKSecureElementPass_paymentApplicationForAID___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "applicationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (id)devicePaymentApplicationForAID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__22;
  v16 = __Block_byref_object_dispose__22;
  v17 = 0;
  -[PKSecureElementPass devicePaymentApplications](self, "devicePaymentApplications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__PKSecureElementPass_devicePaymentApplicationForAID___block_invoke;
  v9[3] = &unk_1E2AC9618;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __54__PKSecureElementPass_devicePaymentApplicationForAID___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "applicationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (BOOL)isDevicePrimaryPaymentApplicationPersonalized
{
  void *v2;
  uint64_t v3;
  BOOL v5;

  -[PKSecureElementPass devicePrimaryPaymentApplication](self, "devicePrimaryPaymentApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state");
  v5 = v3 == 1 || v3 == 15;

  return v5;
}

- (BOOL)isPrivateLabel
{
  NSSet *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_paymentApplications;
  v3 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "paymentNetworkIdentifier", (_QWORD)v7) == 100)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isAccessPass
{
  int64_t cardType;
  NSSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  unint64_t v8;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  cardType = self->_cardType;
  if (cardType == 3)
    return 1;
  if (cardType)
    return 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_paymentApplications;
  v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "paymentType", (_QWORD)v12) - 1001;
        if (v8 <= 3 && v8 != 1)
        {
          v10 = 1;
          goto LABEL_19;
        }
      }
      v5 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v10 = 0;
    }
    while (v5);
  }
  else
  {
    v10 = 0;
  }
LABEL_19:

  return v10;
}

- (BOOL)isPrecursorPass:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PKSecureElementPass upgradeRequests](self, "upgradeRequests", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "type") == 2)
        {
          objc_msgSend(v9, "secureElementIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v10 || (objc_msgSend(v4, "containsObject:", v10) & 1) != 0)
          {

            LOBYTE(v6) = 1;
            goto LABEL_14;
          }

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_14:

  return v6;
}

- (BOOL)isSuicaPass
{
  void *v2;
  BOOL v3;

  -[PKSecureElementPass devicePrimaryPaymentApplication](self, "devicePrimaryPaymentApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "paymentNetworkIdentifier") == 103;

  return v3;
}

- (BOOL)hasLegacyBalanceModel
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;

  -[PKSecureElementPass devicePrimaryPaymentApplication](self, "devicePrimaryPaymentApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "paymentNetworkIdentifier");

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E2C3EC68, &unk_1E2C3EC80, &unk_1E2C3EC98, &unk_1E2C3ECB0, &unk_1E2C3ECC8, &unk_1E2C3ECE0, 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

- (BOOL)isPrepaidPass
{
  void *v2;
  BOOL v3;

  -[PKSecureElementPass devicePrimaryPaymentApplication](self, "devicePrimaryPaymentApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "paymentType") == 3;

  return v3;
}

- (BOOL)isStoredValuePass
{
  return -[PKSecureElementPass isTransitPass](self, "isTransitPass")
      || -[PKSecureElementPass isEMoneyPass](self, "isEMoneyPass");
}

- (BOOL)isChinaTransitCredential
{
  void *v3;
  uint64_t v4;

  -[PKSecureElementPass devicePrimaryPaymentApplication](self, "devicePrimaryPaymentApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "paymentNetworkIdentifier");

  return (v4 & 0xFFFFFFFFFFFFFFFELL) == 0x6C && -[PKSecureElementPass isTransitPass](self, "isTransitPass");
}

- (BOOL)needsHardcodedReminderOptions
{
  return -[PKSecureElementPass isSuicaPass](self, "isSuicaPass")
      || -[PKSecureElementPass isChinaTransitCredential](self, "isChinaTransitCredential");
}

- (BOOL)isOctopusPass
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  char v5;

  -[PKSecureElementPass devicePrimaryPaymentApplication](self, "devicePrimaryPaymentApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appletDataFormat");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && CFSTR("transit.apple.octopus"))
    v5 = -[__CFString isEqual:](v3, "isEqual:", CFSTR("transit.apple.octopus"));
  else
    v5 = v3 == CFSTR("transit.apple.octopus");

  return v5;
}

- (BOOL)isHybridIdentityPass
{
  void *v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[PKSecureElementPass paymentApplications](self, "paymentApplications");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = 0;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "paymentType");
        v4 |= v8 != 1002;
        v5 |= v8 == 1002;
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v3);
    LOBYTE(v3) = v5 & v4;
  }

  return v3 & 1;
}

- (BOOL)isPeerPaymentPass
{
  return self->_associatedAccountFeatureIdentifier == 1;
}

- (BOOL)isPayLaterPass
{
  return self->_associatedAccountFeatureIdentifier == 3;
}

- (BOOL)isAppleBalancePass
{
  return self->_associatedAccountFeatureIdentifier == 4
      || -[PKPaymentApplication paymentNetworkIdentifier](self->_devicePrimaryPaymentApplication, "paymentNetworkIdentifier") == 135;
}

- (BOOL)hasImmediateAutomaticSelectionCriterion
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[PKSecureElementPass devicePaymentApplications](self, "devicePaymentApplications");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        objc_msgSend(v7, "automaticSelectionCriteria", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v16;
          while (2)
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v16 != v11)
                objc_enumerationMutation(v8);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * j), "technologyType") == 7)
              {

                v13 = 1;
                goto LABEL_19;
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
            if (v10)
              continue;
            break;
          }
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      v13 = 0;
    }
    while (v4);
  }
  else
  {
    v13 = 0;
  }
LABEL_19:

  return v13;
}

- (BOOL)hasCredentials
{
  NSSet *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_paymentApplications;
  v3 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "subcredentials", (_QWORD)v9);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "count");

        if (v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isAutoTopEnabled
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  double v11;
  double v12;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[PKPass autoTopUpFields](self, "autoTopUpFields", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v7, "key");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("auto_top_up_field_value"));

        if ((v9 & 1) != 0)
        {
          objc_msgSend(v7, "threshold");
          v12 = v11;
          objc_msgSend(v7, "amount");
          v10 = v13 != 0.0 || v12 != 0.0;
          goto LABEL_13;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v4)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_13:

  return v10;
}

- (BOOL)hasMerchantTokens
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((PKMerchantTokensDemoModeEnabled() & 1) != 0)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    -[PKSecureElementPass paymentApplications](self, "paymentApplications", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v5 = *(_QWORD *)v9;
      while (2)
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v4);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "hasMerchantTokens") & 1) != 0)
          {
            LOBYTE(v3) = 1;
            goto LABEL_13;
          }
        }
        v3 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v3)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v3;
}

- (BOOL)hadMerchantTokens
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((PKMerchantTokensDemoModeEnabled() & 1) != 0)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    -[PKSecureElementPass paymentApplications](self, "paymentApplications", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v5 = *(_QWORD *)v9;
      while (2)
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v4);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "hadMerchantTokens") & 1) != 0)
          {
            LOBYTE(v3) = 1;
            goto LABEL_13;
          }
        }
        v3 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v3)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v3;
}

- (BOOL)isCarKeyPass
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PKSecureElementPass devicePaymentApplications](self, "devicePaymentApplications", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 |= objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "paymentNetworkIdentifier") == 301;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5 & 1;
}

- (BOOL)isHomeKeyPass
{
  void *v2;
  char v3;

  -[PKSecureElementPass devicePaymentApplications](self, "devicePaymentApplications");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pk_hasObjectPassingTest:", &__block_literal_global_68);

  return v3;
}

BOOL __36__PKSecureElementPass_isHomeKeyPass__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "paymentNetworkIdentifier") == 133;
}

- (BOOL)areCredentialsStoredInKML
{
  _BOOL4 v3;

  v3 = -[PKSecureElementPass hasCredentials](self, "hasCredentials");
  if (v3)
    LOBYTE(v3) = !-[PKSecureElementPass isIdentityPass](self, "isIdentityPass");
  return v3;
}

- (NSString)devicePassIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PKSecureElementPass devicePrimaryPaymentApplication](self, "devicePrimaryPaymentApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subcredentials");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)pairedTerminalIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PKSecureElementPass devicePrimaryPaymentApplication](self, "devicePrimaryPaymentApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subcredentials");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pairedReaderIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)requiresFelicaSecureElement
{
  void *v2;
  __CFString *v3;
  char v4;

  -[PKSecureElementPass devicePrimaryPaymentApplication](self, "devicePrimaryPaymentApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appletDataFormat");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v3 && CFSTR("transit.felica.suica"))
  {
    if ((-[__CFString isEqual:](v3, "isEqual:", CFSTR("transit.felica.suica")) & 1) != 0)
    {
LABEL_4:
      v4 = 1;
      goto LABEL_10;
    }
  }
  else if (v3 == CFSTR("transit.felica.suica"))
  {
    goto LABEL_4;
  }
  if (v3 && CFSTR("transit.apple.octopus"))
    v4 = -[__CFString isEqual:](v3, "isEqual:", CFSTR("transit.apple.octopus"));
  else
    v4 = v3 == CFSTR("transit.apple.octopus");
LABEL_10:

  return v4;
}

- (BOOL)shouldIgnoreTransactionUpdatesSwitch
{
  return -[PKSecureElementPass isTransitPass](self, "isTransitPass")
      || -[PKSecureElementPass supportsBarcodePayment](self, "supportsBarcodePayment");
}

- (BOOL)availableForAutomaticPresentationUsingVASContext
{
  void *v3;
  BOOL v4;

  if (!-[PKSecureElementPass isPrivateLabel](self, "isPrivateLabel")
    && !-[PKSecureElementPass isCobranded](self, "isCobranded"))
  {
    return 0;
  }
  -[PKPass associatedPassTypeIdentifiers](self, "associatedPassTypeIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (BOOL)availableForAutomaticPresentationUsingBeaconContext
{
  _BOOL4 v3;
  objc_super v5;

  if (-[PKSecureElementPass isPrivateLabel](self, "isPrivateLabel")
    || (v3 = -[PKSecureElementPass isCobranded](self, "isCobranded")))
  {
    v5.receiver = self;
    v5.super_class = (Class)PKSecureElementPass;
    LOBYTE(v3) = -[PKPass availableForAutomaticPresentationUsingBeaconContext](&v5, sel_availableForAutomaticPresentationUsingBeaconContext);
  }
  return v3;
}

- (BOOL)availableForAutomaticPresentationUsingInAppOrWebContext
{
  void *v3;
  BOOL v4;
  void *v5;

  if (!-[PKSecureElementPass isPrivateLabel](self, "isPrivateLabel")
    && !-[PKSecureElementPass isCobranded](self, "isCobranded"))
  {
    return 0;
  }
  -[PKSecureElementPass associatedWebDomains](self, "associatedWebDomains");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[PKSecureElementPass associatedApplicationIdentifiers](self, "associatedApplicationIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count") != 0;

  }
  return v4;
}

- (NSString)deviceAccountIdentifier
{
  void *v2;
  void *v3;

  -[PKSecureElementPass devicePrimaryPaymentApplication](self, "devicePrimaryPaymentApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dpanIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)deviceAccountNumberSuffix
{
  void *v2;
  void *v3;

  -[PKSecureElementPass devicePrimaryPaymentApplication](self, "devicePrimaryPaymentApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dpanSuffix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)sanitizedDeviceAccountNumber
{
  void *v2;
  void *v3;

  -[PKSecureElementPass devicePrimaryPaymentApplication](self, "devicePrimaryPaymentApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sanitizedDPAN");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PKPaymentApplication)devicePrimaryContactlessPaymentApplication
{
  void *v3;
  objc_class *v4;
  void *v5;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!self->_devicePaymentApplications)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PKObject initializedViaInitWithCoder](self, "initializedViaInitWithCoder");
    v7 = CFSTR("was not");
    if (v6)
      v7 = CFSTR("was");
    objc_msgSend(v3, "stringWithFormat:", CFSTR("updateDevicePaymentApplicationsWithSecureElementIdentifiers: must be called before calling devicePrimaryContactlessPaymentApplication. (%@ %@ initialized via initWithCoder:)"), v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    PKLogFacilityTypeGetObject(6uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v8;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Error: %{public}@. Returning nil.", buf, 0xCu);
    }

  }
  return self->_devicePrimaryContactlessPaymentApplication;
}

- (PKPaymentApplication)devicePrimaryInAppPaymentApplication
{
  void *v3;
  objc_class *v4;
  void *v5;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!self->_devicePaymentApplications)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PKObject initializedViaInitWithCoder](self, "initializedViaInitWithCoder");
    v7 = CFSTR("was not");
    if (v6)
      v7 = CFSTR("was");
    objc_msgSend(v3, "stringWithFormat:", CFSTR("updateDevicePaymentApplicationsWithSecureElementIdentifiers: must be called before calling devicePrimaryInAppPaymentApplication. (%@ %@ initialized via initWithCoder:)"), v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    PKLogFacilityTypeGetObject(6uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v8;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Error: %{public}@. Returning nil.", buf, 0xCu);
    }

  }
  return self->_devicePrimaryInAppPaymentApplication;
}

- (PKPaymentApplication)devicePrimaryBarcodePaymentApplication
{
  void *v3;
  objc_class *v4;
  void *v5;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!self->_devicePaymentApplications)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PKObject initializedViaInitWithCoder](self, "initializedViaInitWithCoder");
    v7 = CFSTR("was not");
    if (v6)
      v7 = CFSTR("was");
    objc_msgSend(v3, "stringWithFormat:", CFSTR("updateDevicePaymentApplicationsWithSecureElementIdentifiers: must be called before calling devicePrimaryInAppPaymentApplication. (%@ %@ initialized via initWithCoder:)"), v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    PKLogFacilityTypeGetObject(6uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v8;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Error: %{public}@. Returning nil.", buf, 0xCu);
    }

  }
  return self->_devicePrimaryBarcodePaymentApplication;
}

- (NSSet)deviceInAppPaymentApplications
{
  void *v3;
  objc_class *v4;
  void *v5;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!self->_devicePaymentApplications)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PKObject initializedViaInitWithCoder](self, "initializedViaInitWithCoder");
    v7 = CFSTR("was not");
    if (v6)
      v7 = CFSTR("was");
    objc_msgSend(v3, "stringWithFormat:", CFSTR("updateDevicePaymentApplicationsWithSecureElementIdentifiers: must be called before calling devicePrimaryInAppPaymentApplication. (%@ %@ initialized via initWithCoder:)"), v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    PKLogFacilityTypeGetObject(6uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Error: %@. Returning nil.", buf, 0xCu);
    }

  }
  return self->_deviceInAppPaymentApplications;
}

- (id)deviceContactlessPaymentApplications
{
  void *v2;
  void *v3;

  -[PKSecureElementPass devicePaymentApplications](self, "devicePaymentApplications");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectsPassingTest:", &__block_literal_global_72_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __59__PKSecureElementPass_deviceContactlessPaymentApplications__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v5;

  v2 = a2;
  v3 = objc_msgSend(v2, "state");
  if (v3 == 15 || v3 == 1)
    v5 = objc_msgSend(v2, "supportsContactlessPayment");
  else
    v5 = 0;

  return v5;
}

- (BOOL)hasContactlessDevicePaymentApplicationsAvailable
{
  void *v2;
  BOOL v3;

  -[PKSecureElementPass deviceContactlessPaymentApplications](self, "deviceContactlessPaymentApplications");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

uint64_t __83__PKSecureElementPass_updateDevicePaymentApplicationsWithSecureElementIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsContactlessPayment");
}

- (void)sanitizePaymentApplications
{
  id v3;
  NSSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v4 = self->_paymentApplications;
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v6);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = self->_devicePaymentApplications;
  v10 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      v11 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    }
    while (v11);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = v3;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18++), "setSecureElementIdentifier:", 0, (_QWORD)v19);
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
    }
    while (v16);
  }

}

- (BOOL)supportsWebPaymentMode:(int64_t)a3 withExclusionList:(id)a4
{
  return -[PKSecureElementPass supportsWebPaymentMode:withExclusionList:clientOSVersion:](self, "supportsWebPaymentMode:withExclusionList:clientOSVersion:", a3, a4, 0);
}

- (BOOL)supportsWebPaymentMode:(int64_t)a3 withExclusionList:(id)a4 clientOSVersion:(id)a5
{
  id v7;
  id v8;
  NSSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = self->_deviceInAppPaymentApplications;
  v10 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v9);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "supportsWebPaymentMode:withExclusionList:clientOSVersion:", 2, v7, v8, (_QWORD)v14) & 1) != 0)
        {
          LOBYTE(v10) = 1;
          goto LABEL_11;
        }
      }
      v10 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  return v10;
}

- (NSString)cobrandName
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cobrandName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)shippingAddressSeed
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shippingAddressSeed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)speakableMake
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "speakableMake");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)speakableModel
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "speakableModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (PKSiriIntentsConfiguration)supportedSiriIntents
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportedSiriIntents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKSiriIntentsConfiguration *)v3;
}

- (NSURL)transactionServiceURL
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[PKSecureElementPass _transactionServiceURLOverride](self, "_transactionServiceURLOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transactionServiceURL");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSURL *)v5;
}

- (NSURL)transactionServiceRegistrationURL
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[PKSecureElementPass _transactionServiceURLOverride](self, "_transactionServiceURLOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transactionServiceRegistrationURL");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSURL *)v5;
}

- (NSString)transactionPushTopic
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[PKObject uniqueID](self, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKTransactionServicePushTopicOverrideForPassUniqueIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transactionPushTopic");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v5;
}

- (NSURL)messageServiceURL
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageServiceURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)messageServiceRegistrationURL
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageServiceRegistrationURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSString)messagePushTopic
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messagePushTopic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)appURLScheme
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appURLScheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)customerServiceIdentifier
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "customerServiceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)localizedSuspendedReason
{
  void *v3;
  void *v4;
  void *v5;

  -[PKSecureElementPass devicePrimaryPaymentApplication](self, "devicePrimaryPaymentApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSecureElementPass _localizedSuspendedReasonForAID:](self, "_localizedSuspendedReasonForAID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)_localizedSuspendedReasonForAID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedSuspendedReasonsByAID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)supportsOnlyTransit
{
  void *v2;
  char v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsTransitOnly");

  return v3;
}

- (unint64_t)transitCommutePlanType
{
  void *v2;
  unint64_t v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "transitCommutePlanType");

  return v3;
}

- (id)transitCommutePlans
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitCommutePlans");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)notificationCenterTitle
{
  void *v3;
  objc_super v5;

  if (-[PKSecureElementPass isStoredValuePass](self, "isStoredValuePass")
    || -[PKSecureElementPass hasAssociatedPeerPaymentAccount](self, "hasAssociatedPeerPaymentAccount")
    || -[PKSecureElementPass associatedAccountFeatureIdentifier](self, "associatedAccountFeatureIdentifier") == 4)
  {
    -[PKPass localizedDescription](self, "localizedDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PKSecureElementPass;
    -[PKPass notificationCenterTitle](&v5, sel_notificationCenterTitle);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (NSArray)availableActions
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "availableActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)actionLocalizations
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionLocalizations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)actionGroups
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)upgradeRequests
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "upgradeRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)eligibleExpressUpgradeRequestsForDeviceClass:(id)a3 deviceSEIDs:(id)a4 deviceVersion:(id)a5 technologyTest:(id)a6
{
  id v10;
  id v11;
  id v12;
  unsigned int (**v13)(_QWORD, uint64_t);
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  id v40;
  id v42;
  uint64_t v43;
  void *v44;
  unsigned int (**v45)(_QWORD, uint64_t);
  id v46;
  id v47;
  id v48;
  PKSecureElementPass *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t v65[128];
  uint8_t buf[4];
  void *v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (unsigned int (**)(_QWORD, uint64_t))a6;
  v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v49 = self;
  -[PKSecureElementPass upgradeRequests](self, "upgradeRequests");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v62;
    v47 = v11;
    v48 = v10;
    v45 = v13;
    v46 = v12;
    v43 = *(_QWORD *)v62;
    v44 = v14;
    do
    {
      v18 = 0;
      v50 = v16;
      do
      {
        if (*(_QWORD *)v62 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v18);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v19, "osVersionRange");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          if ((!v52 || objc_msgSend(v52, "versionMeetsRequirements:deviceClass:", v12, v10))
            && objc_msgSend(v19, "type") == 1)
          {
            objc_msgSend(v19, "secureElementIdentifier");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v11, "containsObject:"))
            {
              objc_msgSend(v19, "paymentApplicationIdentifiers");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v57 = 0u;
              v58 = 0u;
              v59 = 0u;
              v60 = 0u;
              -[PKSecureElementPass devicePaymentApplications](v49, "devicePaymentApplications");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
              if (v22)
              {
                v23 = v22;
                v24 = 0;
                v25 = *(_QWORD *)v58;
                do
                {
                  for (i = 0; i != v23; ++i)
                  {
                    if (*(_QWORD *)v58 != v25)
                      objc_enumerationMutation(v21);
                    v27 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
                    objc_msgSend(v27, "applicationIdentifier");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v20, "containsObject:", v28))
                    {
                      v29 = objc_msgSend(v27, "state");
                      if ((unint64_t)(v29 - 1) > 0xE)
                        v30 = 0;
                      else
                        v30 = qword_190454DC8[v29 - 1];

                      v24 += v30;
                    }
                    else
                    {

                    }
                  }
                  v31 = v19;
                  v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
                }
                while (v23);
              }
              else
              {
                v31 = v19;
                v24 = 0;
              }

              v13 = v45;
              if (v24 == objc_msgSend(v20, "count"))
              {
                v55 = 0u;
                v56 = 0u;
                v53 = 0u;
                v54 = 0u;
                objc_msgSend(v31, "technologyTypes");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
                v11 = v47;
                v14 = v44;
                if (v33)
                {
                  v34 = v33;
                  v35 = *(_QWORD *)v54;
                  while (2)
                  {
                    for (j = 0; j != v34; ++j)
                    {
                      if (*(_QWORD *)v54 != v35)
                        objc_enumerationMutation(v32);
                      v37 = PKPassAutomaticSelectionTechnologyTypeFromType(*(void **)(*((_QWORD *)&v53 + 1) + 8 * j));
                      if (!v45[2](v45, v37))
                      {

                        goto LABEL_40;
                      }
                    }
                    v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
                    if (v34)
                      continue;
                    break;
                  }
                }

                objc_msgSend(v42, "addObject:", v19);
LABEL_40:
                v10 = v48;
                v12 = v46;
              }
              else
              {
                PKLogFacilityTypeGetObject(6uLL);
                v38 = objc_claimAutoreleasedReturnValue();
                v11 = v47;
                v10 = v48;
                v12 = v46;
                v14 = v44;
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v67 = v20;
                  _os_log_impl(&dword_18FC92000, v38, OS_LOG_TYPE_DEFAULT, "Discarding upgrade request. One or more invalid payment applications: %@", buf, 0xCu);
                }

              }
              v17 = v43;
              v16 = v50;
            }

          }
        }
        ++v18;
      }
      while (v18 != v16);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
    }
    while (v16);
  }

  if (objc_msgSend(v42, "count"))
    v39 = v42;
  else
    v39 = 0;
  v40 = v39;

  return v40;
}

- (id)precursorUpgradeRequestsForDeviceSEIDs:(id)a3 deviceClass:(id)a4 deviceVersion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  __int128 v25;
  id v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v28 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[PKSecureElementPass upgradeRequests](self, "upgradeRequests");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v30;
    *(_QWORD *)&v13 = 138412290;
    v25 = v13;
    v26 = v8;
    v27 = v10;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (objc_msgSend(v17, "type", v25) == 2)
        {
          v18 = v17;
          objc_msgSend(v18, "secureElementIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v8, "containsObject:", v19))
          {
            objc_msgSend(v18, "osVersionRange");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v20;
            if (v20 && (objc_msgSend(v20, "versionMeetsRequirements:deviceClass:", v9, v28) & 1) == 0)
            {
              PKLogFacilityTypeGetObject(0x25uLL);
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v25;
                v34 = v18;
                _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "Precursor request does not meet os version requirements: %@", buf, 0xCu);
              }

              v8 = v26;
              v10 = v27;
            }
            else
            {
              objc_msgSend(v10, "addObject:", v18);
            }

          }
        }
      }
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v14);
  }

  if (objc_msgSend(v10, "count"))
    v23 = v10;
  else
    v23 = 0;

  return v23;
}

- (int64_t)identityType
{
  void *v2;
  int64_t v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "identityType");

  return v3;
}

- (int64_t)accessType
{
  void *v4;
  int64_t v5;

  if (-[PKSecureElementPass isCarKeyPass](self, "isCarKeyPass"))
    return 4;
  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "accessType");

  return v5;
}

- (int64_t)paymentType
{
  void *v2;
  int64_t v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "paymentType");

  return v3;
}

- (unint64_t)supportedRadioTechnologies
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[PKSecureElementPass paymentApplications](self, "paymentApplications");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 |= objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "supportedRadioTechnologies");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (PKPassAuxiliaryRegistrationRequirements)auxiliaryRegistrationRequirements
{
  void *v2;
  void *v3;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "auxiliaryRegistrationRequirements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKPassAuxiliaryRegistrationRequirements *)v3;
}

- (id)longTermPrivacyKeyGroupIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PKObject contentLoadedIfNeeded](self, "contentLoadedIfNeeded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "auxiliaryRegistrationRequirements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceDecryptionRequirements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pk_firstObjectPassingTest:", &__block_literal_global_84_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "groupIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __56__PKSecureElementPass_longTermPrivacyKeyGroupIdentifier__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 2;
}

- (PKTransitPassProperties)transitProperties
{
  void *v2;
  void *v3;

  -[PKSecureElementPass devicePrimaryPaymentApplication](self, "devicePrimaryPaymentApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transitProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKTransitPassProperties *)v3;
}

- (id)addValueURL
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[PKSecureElementPass availableActions](self, "availableActions");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v7);
      if (objc_msgSend(v8, "type") == 1)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v9 = v8;

    v13 = 0;
    if (v9
      && (-[PKSecureElementPass canPerformAction:unableReason:displayableError:](self, "canPerformAction:unableReason:displayableError:", v9, &v13, 0)|| v13 == 7|| v13 == 2))
    {
      -[PKSecureElementPass _launchURLForPassAction:](self, "_launchURLForPassAction:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
  }
  else
  {
LABEL_9:

    v9 = 0;
  }
  v10 = 0;
LABEL_16:
  v11 = v10;

  return v11;
}

- (id)_launchURLForPassAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[PKObject uniqueID](self, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && !-[PKPass isRemotePass](self, "isRemotePass")
    && (+[PKStoredValuePassProperties passPropertiesForPass:](PKTransitPassProperties, "passPropertiesForPass:", self), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    objc_msgSend(v7, "setScheme:", CFSTR("shoebox"));
    objc_msgSend(v7, "setHost:", CFSTR("card"));
    PKPaymentPassActionTypeToString(objc_msgSend(v4, "type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/%@/%@"), v5, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPath:", v9);

    objc_msgSend(v7, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)shouldSuppressNoChargeAmount
{
  void *v2;
  uint64_t v3;

  -[PKSecureElementPass devicePrimaryPaymentApplication](self, "devicePrimaryPaymentApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "paymentNetworkIdentifier");

  return (v3 & 0xFFFFFFFFFFFFFFFELL) == 108;
}

- (BOOL)isContactlessPaymentSupportedForTransitNetworks:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[PKSecureElementPass deviceContactlessPaymentApplications](self, "deviceContactlessPaymentApplications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__PKSecureElementPass_isContactlessPaymentSupportedForTransitNetworks___block_invoke;
  v8[3] = &unk_1E2AC9618;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  LOBYTE(v5) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

void __71__PKSecureElementPass_isContactlessPaymentSupportedForTransitNetworks___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "supportedTransitNetworkIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "count"))
  {
    PKLegacyTransitNetworkIdentifierForCredentialType(objc_msgSend(v5, "paymentNetworkIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
    {
      v20[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
      v9 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v9;
    }

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
          *a3 = 1;
          goto LABEL_15;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_15:

}

- (id)deviceTransactionSourceIdentifiers
{
  id v3;
  NSSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  _BOOL4 v15;
  const __CFString *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (self->_devicePaymentApplications)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v4 = self->_devicePaymentApplications;
    v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v19;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v19 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v8), "transactionSourceIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
            objc_msgSend(v3, "addObject:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v6);
    }

    -[PKSecureElementPass transactionSourceIdentifier](self, "transactionSourceIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v3, "addObject:", v10);
    v11 = (void *)objc_msgSend(v3, "copy");
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PKObject initializedViaInitWithCoder](self, "initializedViaInitWithCoder");
    v16 = CFSTR("was not");
    if (v15)
      v16 = CFSTR("was");
    objc_msgSend(v12, "stringWithFormat:", CFSTR("updateDevicePaymentApplicationsWithSecureElementIdentifiers: must be called before calling devicePaymentApplications. (%@ %@ initialized via initWithCoder:)"), v14, v16);
    v3 = (id)objc_claimAutoreleasedReturnValue();

    PKLogFacilityTypeGetObject(6uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v3;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Error: %{public}@. Returning nil.", buf, 0xCu);
    }
    v11 = 0;
  }

  return v11;
}

- (BOOL)hasDeviceTransactionSourceIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  objc_class *v10;
  void *v11;
  _BOOL4 v12;
  const __CFString *v13;
  void *v14;
  NSObject *v15;
  BOOL v16;
  NSSet *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  id v22;
  id v23;
  void *v24;
  char v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_devicePaymentApplications)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PKObject initializedViaInitWithCoder](self, "initializedViaInitWithCoder");
    v13 = CFSTR("was not");
    if (v12)
      v13 = CFSTR("was");
    objc_msgSend(v9, "stringWithFormat:", CFSTR("updateDevicePaymentApplicationsWithSecureElementIdentifiers: must be called before calling devicePaymentApplications. (%@ %@ initialized via initWithCoder:)"), v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    PKLogFacilityTypeGetObject(6uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v33 = v14;
      _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Error: %{public}@. Returning NO.", buf, 0xCu);
    }

    v16 = 0;
    goto LABEL_32;
  }
  -[PKSecureElementPass transactionSourceIdentifier](self, "transactionSourceIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {

    goto LABEL_13;
  }
  if (v6 && v5)
  {
    v8 = objc_msgSend(v5, "isEqualToString:", v6);

    if ((v8 & 1) == 0)
      goto LABEL_15;
LABEL_13:
    v16 = 1;
    goto LABEL_32;
  }

LABEL_15:
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v17 = self->_devicePaymentApplications;
  v18 = -[NSSet countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "transactionSourceIdentifier");
        v22 = (id)objc_claimAutoreleasedReturnValue();
        v23 = v7;
        v24 = v23;
        if (v22 == v23)
        {

LABEL_30:
          v16 = 1;
          goto LABEL_31;
        }
        if (v7 && v22)
        {
          v25 = objc_msgSend(v22, "isEqualToString:", v23);

          if ((v25 & 1) != 0)
            goto LABEL_30;
        }
        else
        {

        }
      }
      v19 = -[NSSet countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v19)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_31:

LABEL_32:
  return v16;
}

- (id)_transactionServiceURLOverride
{
  void *v2;
  void *v3;
  void *v4;

  -[PKObject uniqueID](self, "uniqueID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PKTransactionServiceURLOverrideForPassUniqueIdentifier(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_passSubcredentialFilesWithPrefix:(id)a3 extension:(id)a4 forSecureElementIdentifiers:(id)a5
{
  id v8;
  void *v9;
  PKSecureElementPass *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  id obj;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v30 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v10 = self;
  v24 = v8;
  -[PKSecureElementPass paymentApplicationsForSecureElementIdentifiers:](self, "paymentApplicationsForSecureElementIdentifiers:", v8);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v27)
  {
    v26 = *(_QWORD *)v37;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v37 != v26)
          objc_enumerationMutation(obj);
        v28 = v11;
        v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v11);
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        objc_msgSend(v12, "subcredentials");
        v29 = (id)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v33 != v15)
                objc_enumerationMutation(v29);
              v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
              objc_msgSend(v17, "identifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "stringByAppendingString:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKObject dataAccessor](v10, "dataAccessor");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "dataForBundleResourceNamed:withExtension:", v19, v30);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              if (v9)
                objc_msgSend(v9, "setObject:forKey:", v21, v17);

            }
            v14 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          }
          while (v14);
        }

        v11 = v28 + 1;
      }
      while (v28 + 1 != v27);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v27);
  }

  v22 = (void *)objc_msgSend(v9, "copy");
  return v22;
}

- (id)iso18013BlobsForSecureElementIdentifiers:(id)a3
{
  return -[PKSecureElementPass _passSubcredentialFilesWithPrefix:extension:forSecureElementIdentifiers:](self, "_passSubcredentialFilesWithPrefix:extension:forSecureElementIdentifiers:", CFSTR("ISO18013-"), &stru_1E2ADF4C0, a3);
}

- (id)iso18013BlobsMetdataForSecureElementIdentifiers:(id)a3
{
  return -[PKSecureElementPass _passSubcredentialFilesWithPrefix:extension:forSecureElementIdentifiers:](self, "_passSubcredentialFilesWithPrefix:extension:forSecureElementIdentifiers:", CFSTR("ISO18013Metadata-"), CFSTR("json"), a3);
}

- (id)seBlobsForSecureElementIdentifiers:(id)a3
{
  return -[PKSecureElementPass _passSubcredentialFilesWithPrefix:extension:forSecureElementIdentifiers:](self, "_passSubcredentialFilesWithPrefix:extension:forSecureElementIdentifiers:", CFSTR("TerminalUpdateReaderData-"), &stru_1E2ADF4C0, a3);
}

- (id)subcredentialConfigurationForSecureElementIdentifiers:(id)a3
{
  return -[PKSecureElementPass _passSubcredentialFilesWithPrefix:extension:forSecureElementIdentifiers:](self, "_passSubcredentialFilesWithPrefix:extension:forSecureElementIdentifiers:", CFSTR("carKeyCredentialConfiguration-"), CFSTR("json"), a3);
}

- (BOOL)preventsWalletDeletion
{
  PKSecureElementPassActivationState v3;

  v3 = -[PKSecureElementPass passActivationState](self, "passActivationState");
  if (-[PKSecureElementPass hasAssociatedPeerPaymentAccount](self, "hasAssociatedPeerPaymentAccount"))
    return (v3 & 0xFFFFFFFFFFFFFFFDLL) == 0;
  else
    return -[PKSecureElementPass accessType](self, "accessType") != 3;
}

- (BOOL)isUserDeletable
{
  return !-[PKSecureElementPass isHomeKeyPass](self, "isHomeKeyPass");
}

- (BOOL)supportsVirtualCardNumber
{
  void *v3;

  +[PKPaymentWebService sharedService](PKPaymentWebService, "sharedService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PKSecureElementPass supportsVirtualCardNumberAccordingToWebService:](self, "supportsVirtualCardNumberAccordingToWebService:", v3);

  return (char)self;
}

- (BOOL)supportsVirtualCardNumberAccordingToWebService:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  char v8;
  unint64_t associatedAccountFeatureIdentifier;
  char v10;
  char v11;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  uint8_t v17[16];
  uint8_t v18[16];
  uint8_t buf[2];
  __int16 v20;

  v4 = a3;
  if (-[PKSecureElementPass passActivationState](self, "passActivationState"))
  {
    PKLogFacilityTypeGetObject(6uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 0;
      v6 = "Not offering VPAN (pass not activated)";
      v7 = (uint8_t *)&v20;
LABEL_11:
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  v8 = _os_feature_enabled_impl();
  associatedAccountFeatureIdentifier = self->_associatedAccountFeatureIdentifier;
  if (associatedAccountFeatureIdentifier == 1)
    v10 = v8;
  else
    v10 = 0;
  if (!associatedAccountFeatureIdentifier || (v10 & 1) != 0)
  {
    -[PKSecureElementPass devicePrimaryPaymentApplication](self, "devicePrimaryPaymentApplication");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      +[PKWebServiceVirtualCardFeature virtualCardFeatureWithWebService:](PKWebServiceVirtualCardFeature, "virtualCardFeatureWithWebService:", v4);
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = v13;
        objc_msgSend(v4, "targetDevice");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[NSObject doesPaymentApplication:supportVPANOnDevice:associatedAccountFeatureIdentifier:](v14, "doesPaymentApplication:supportVPANOnDevice:associatedAccountFeatureIdentifier:", v5, v15, self->_associatedAccountFeatureIdentifier);

LABEL_23:
        goto LABEL_13;
      }
      PKLogFacilityTypeGetObject(6uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Not offering VPAN (not enabled)", v17, 2u);
      }

      v14 = 0;
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Not offering VPAN (no payment application)", v18, 2u);
      }
    }
    v11 = 0;
    goto LABEL_23;
  }
  PKLogFacilityTypeGetObject(6uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v6 = "Not offering VPAN (unsupported feature)";
    v7 = buf;
    goto LABEL_11;
  }
LABEL_12:
  v11 = 0;
LABEL_13:

  return v11;
}

- (BOOL)hasActiveVirtualCard
{
  void *v3;

  +[PKPaymentWebService sharedService](PKPaymentWebService, "sharedService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PKSecureElementPass hasActiveVirtualCardAccordingToWebService:](self, "hasActiveVirtualCardAccordingToWebService:", v3);

  return (char)self;
}

- (BOOL)hasActiveVirtualCardAccordingToWebService:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;

  v4 = a3;
  if (-[PKSecureElementPass passActivationState](self, "passActivationState"))
  {
    v5 = 0;
  }
  else
  {
    +[PKVirtualCard cardsForPaymentPass:accordingToWebService:](PKVirtualCard, "cardsForPaymentPass:accordingToWebService:", self, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "count") != 0;

  }
  return v5;
}

- (id)virtualCardSuffix
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PKSecureElementPass paymentApplications](self, "paymentApplications", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "virtualCardSuffix");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          objc_msgSend(v6, "virtualCardSuffix");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

uint64_t __66__PKSecureElementPass_supportsDeviceAssessmentAccordingToService___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsDeviceAssessmentAccordingToService:", *(_QWORD *)(a1 + 32));
}

- (BOOL)shouldDisplayDeviceAssessmentEducationAccordingToService:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = !PKHasSeenDeviceAssessmentEducation()
    && -[PKSecureElementPass supportsDeviceAssessmentAccordingToService:](self, "supportsDeviceAssessmentAccordingToService:", v4);

  return v5;
}

- (BOOL)supportsFeatureForCurrentDevice:(unint64_t)a3
{
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  void *v9;
  void *v10;
  objc_super v12;

  if (-[PKPaymentApplication isShareable](self->_devicePrimaryPaymentApplication, "isShareable"))
    return 1;
  if (-[PKSecureElementPass isCarKeyPass](self, "isCarKeyPass"))
  {
    -[PKPaymentApplication subcredentials](self->_devicePrimaryPaymentApplication, "subcredentials");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isShareable");

    if ((v7 & 1) != 0)
      return 1;
  }
  PKDeviceClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKOSVersionRequirement fromDeviceVersion](PKOSVersionRequirement, "fromDeviceVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)PKSecureElementPass;
  v8 = -[PKPass supportsFeature:forDevice:version:](&v12, sel_supportsFeature_forDevice_version_, a3, v9, v10);

  return v8;
}

- (BOOL)isAutoTopUpBalance:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[PKPass autoTopUpFields](self, "autoTopUpFields", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "key");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("auto_top_up_field_value")) & 1) != 0)
        {
          objc_msgSend(v10, "foreignReferenceIdentifiers");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "intersectsSet:", v4);

          if ((v13 & 1) != 0)
          {
            v14 = 1;
            goto LABEL_13;
          }
        }
        else
        {

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }
  v14 = 0;
LABEL_13:

  return v14;
}

- (id)autoTopUpBalanceIdentifiers
{
  PKSecureElementPass *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v17;
  PKSecureElementPass *v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v2 = self;
  v31 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[PKPass balanceFields](self, "balanceFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v19)
  {
    v4 = *(_QWORD *)v26;
    v20 = v3;
    v17 = *(_QWORD *)v26;
    v18 = v2;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v26 != v4)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v5), "foreignReferenceIdentifiers", v17, v18);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        -[PKPass autoTopUpFields](v2, "autoTopUpFields");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v22;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v22 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
              objc_msgSend(v12, "key");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v13, "isEqualToString:", CFSTR("auto_top_up_field_value")) & 1) != 0)
              {
                objc_msgSend(v12, "foreignReferenceIdentifiers");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = objc_msgSend(v14, "intersectsSet:", v6);

                if ((v15 & 1) != 0)
                {

                  v3 = v20;
                  goto LABEL_21;
                }
              }
              else
              {

              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v9);
        }

        ++v5;
        v3 = v20;
        v4 = v17;
        v2 = v18;
      }
      while (v5 != v19);
      v6 = 0;
      v19 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v19);
  }
  else
  {
    v6 = 0;
  }
LABEL_21:

  return v6;
}

- (id)autoTopUpMerchantTokenIdentifier
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[PKPass balances](self, "balances", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i), "paymentMethod");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v6, "type"))
        {
          objc_msgSend(v6, "merchantTokenIdentifier");
          v3 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }

      }
      v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (NSString)primaryAccountIdentifier
{
  return self->_primaryAccountIdentifier;
}

- (NSString)primaryAccountNumberSuffix
{
  return self->_primaryAccountNumberSuffix;
}

- (NSSet)associatedApplicationIdentifiers
{
  return self->_associatedApplicationIdentifiers;
}

- (NSSet)associatedWebDomains
{
  return self->_associatedWebDomains;
}

- (NSString)sanitizedPrimaryAccountNumber
{
  return self->_sanitizedPrimaryAccountNumber;
}

- (NSString)sanitizedPrimaryAccountName
{
  return self->_sanitizedPrimaryAccountName;
}

- (BOOL)supportsDPANNotifications
{
  return self->_supportsDPANNotifications;
}

- (BOOL)supportsFPANNotifications
{
  return self->_supportsFPANNotifications;
}

- (BOOL)supportsDefaultCardSelection
{
  return self->_supportsDefaultCardSelection;
}

- (BOOL)supportsPeerPayment
{
  return self->_supportsPeerPayment;
}

- (void)setSupportsPeerPayment:(BOOL)a3
{
  self->_supportsPeerPayment = a3;
}

- (NSString)issuerCountryCode
{
  return self->_issuerCountryCode;
}

- (NSString)issuerAdministrativeAreaCode
{
  return self->_issuerAdministrativeAreaCode;
}

- (NSString)identityAccountKeyIdentifier
{
  return self->_identityAccountKeyIdentifier;
}

- (BOOL)supportsSerialNumberBasedProvisioning
{
  return self->_supportsSerialNumberBasedProvisioning;
}

- (unint64_t)contactlessActivationGroupingType
{
  return self->_contactlessActivationGroupingType;
}

- (void)setContactlessActivationGroupingType:(unint64_t)a3
{
  self->_contactlessActivationGroupingType = a3;
}

- (BOOL)isShellPass
{
  return self->_shellPass;
}

- (NSDate)originalProvisioningDate
{
  return self->_originalProvisioningDate;
}

- (PKPassProvisioningMetadata)provisioningMetadata
{
  return self->_provisioningMetadata;
}

- (NSString)topLeftBackgroundTitle
{
  return self->_topLeftBackgroundTitle;
}

- (NSString)topRightBackgroundTitle
{
  return self->_topRightBackgroundTitle;
}

- (NSString)partnerAccountIdentifier
{
  return self->_partnerAccountIdentifier;
}

- (NSString)transactionSourceIdentifier
{
  return self->_transactionSourceIdentifier;
}

- (BOOL)isCobranded
{
  return self->_cobranded;
}

- (void)setTransactionServiceURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 816);
}

- (void)setTransactionServiceRegistrationURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 824);
}

- (void)setTransactionPushTopic:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 832);
}

- (void)setMessageServiceURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 840);
}

- (void)setMessageServiceRegistrationURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 848);
}

- (void)setMessagePushTopic:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 856);
}

- (void)setAppURLScheme:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 864);
}

- (void)setCustomerServiceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 872);
}

- (void)setLocalizedSuspendedReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 880);
}

- (void)setSupportedSiriIntents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 912);
}

- (void)setAuxiliaryRegistrationRequirements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 920);
}

- (BOOL)requiresTransferSerialNumberBasedProvisioning
{
  return self->_requiresTransferSerialNumberBasedProvisioning;
}

- (void)setAvailableActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 928);
}

- (NSArray)deviceUpgradeRequests
{
  return self->_deviceUpgradeRequests;
}

- (BOOL)canPerformAction:(id)a3 unableReason:(unint64_t *)a4 displayableError:(id *)a5
{
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int64_t v18;
  void *v19;
  _BOOL4 v20;
  unint64_t v21;
  uint64_t v22;
  int PaymentsUsingNetworksIssuerCountryCodesWithCapabilitiesAndRequestType;
  void *v24;
  void *v25;
  objc_class *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (PKRunningInPassd())
  {
    PKLogFacilityTypeGetObject(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v28;
      v32 = 2114;
      v33 = v29;
      _os_log_error_impl(&dword_18FC92000, v10, OS_LOG_TYPE_ERROR, "Calling [%{public}@ %{public}@] is unsupported from passd. Use [PDDatabaseManager canPerformAction:forPassWithUniqueIdentifier:] instead.", buf, 0x16u);

    }
  }
  if (objc_msgSend(v9, "type") == 2)
  {
    objc_msgSend(v9, "associatedPlanIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v9, "associatedPlan");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        -[PKPass paymentPass](self, "paymentPass");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        PKTransitCommutePlanInPassForIdentifier(v13, v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "setAssociatedPlan:", v14);
      }
    }

  }
  objc_msgSend(v9, "availableFrom");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "availableUntil");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)PKCurrentPassbookState() > 1)
  {
    LOBYTE(PaymentsUsingNetworksIssuerCountryCodesWithCapabilitiesAndRequestType) = 0;
    v21 = 6;
    if (a4)
      goto LABEL_33;
  }
  else
  {
    v18 = -[PKSecureElementPass effectiveContactlessPaymentApplicationState](self, "effectiveContactlessPaymentApplicationState");
    if (v18 == 15 || v18 == 1)
    {
      objc_msgSend(v9, "unavailableActionReason");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = v19 == 0;
      if (v19)
        v21 = 7;
      else
        v21 = 0;
      if (!v19)
      {
        if (v15)
        {
          v22 = objc_msgSend(v17, "compare:", v15);
          v20 = v22 != -1;
          if (v22 == -1)
            v21 = 3;
        }
      }
      if (v20 && v16)
      {
        if (objc_msgSend(v17, "compare:", v16) == 1)
        {
          LOBYTE(PaymentsUsingNetworksIssuerCountryCodesWithCapabilitiesAndRequestType) = 0;
          v21 = 4;
          if (!a4)
            goto LABEL_34;
LABEL_33:
          *a4 = v21;
          goto LABEL_34;
        }
        goto LABEL_30;
      }
      if (v20)
      {
LABEL_30:
        objc_msgSend(v9, "serviceProviderAcceptedNetworks");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "serviceProviderSupportedCountries");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        PaymentsUsingNetworksIssuerCountryCodesWithCapabilitiesAndRequestType = PKCanMakePaymentsUsingNetworksIssuerCountryCodesWithCapabilitiesAndRequestType(v24, v25, objc_msgSend(v9, "serviceProviderCapabilities"), 0, 0);

        if (!PaymentsUsingNetworksIssuerCountryCodesWithCapabilitiesAndRequestType)
          v21 = 2;
        if (a4)
          goto LABEL_33;
        goto LABEL_34;
      }
      LOBYTE(PaymentsUsingNetworksIssuerCountryCodesWithCapabilitiesAndRequestType) = 0;
      if (a4)
        goto LABEL_33;
    }
    else
    {
      LOBYTE(PaymentsUsingNetworksIssuerCountryCodesWithCapabilitiesAndRequestType) = 0;
      v21 = 1;
      if (a4)
        goto LABEL_33;
    }
  }
LABEL_34:
  if (a5)
  {
    objc_msgSend((id)objc_opt_class(), "displayableErrorForAction:andReason:", v9, v21);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return PaymentsUsingNetworksIssuerCountryCodesWithCapabilitiesAndRequestType;
}

+ (id)displayableNoPaymentNetworkErrorMessageForAction:(id)a3 isTransit:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  __CFString *v10;
  const __CFString *v11;
  NSString *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v4 = a4;
  v5 = a3;
  objc_msgSend(v5, "serviceProviderAcceptedNetworks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "serviceProviderCapabilities");
  objc_msgSend(v5, "serviceProviderSupportedCountries");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count") == 1 && !objc_msgSend(v8, "count"))
  {
    v10 = CFSTR("PASS_ACTION_UNAVAILABLE_REASON_NO_SPECIFIC_PAYMENT_CARD_AVAILABLE");
    v11 = CFSTR("PASS_ACTION_UNAVAILABLE_REASON_NO_SPECIFIC_PAYMENT_CARD_AVAILABLE_TRANSIT");
    if ((v7 & 0xC) == 8)
    {
      v10 = CFSTR("PASS_ACTION_UNAVAILABLE_REASON_NO_SPECIFIC_DEBIT_CARD_AVAILABLE");
      v11 = CFSTR("PASS_ACTION_UNAVAILABLE_REASON_NO_SPECIFIC_DEBIT_CARD_AVAILABLE_TRANSIT");
    }
    if (v4)
      v10 = (__CFString *)v11;
    v12 = v10;
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = PKPaymentCredentialTypeForPaymentNetworkName(v13);

    PKDisplayablePaymentNetworkNameForPaymentCredentialType(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(v12, CFSTR("%@"), v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PKLocalizedPaymentString(CFSTR("PASS_ACTION_UNAVAILABLE_REASON_NO_PAYMENT_CARDS_AVAILABLE"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)displayableErrorForTransitAction:(id)a3 andReason:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  if (a4 == 2)
  {
    PKLocalizedString(CFSTR("PASS_ACTION_UNAVAILABLE_ADD_PAYMENT_METHOD_TITLE"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKSecureElementPass displayableNoPaymentNetworkErrorMessageForAction:isTransit:](PKPaymentPass, "displayableNoPaymentNetworkErrorMessageForAction:isTransit:", v6, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    PKDisplayableErrorCustomWithType(-1, v7, v8, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v7;
  }
  else
  {
    objc_msgSend(a1, "displayableErrorForAction:andReason:", v6, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)displayableErrorForAction:(id)a3 andReason:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  id v12;
  void *v13;

  v5 = a3;
  v6 = v5;
  switch(a4)
  {
    case 2uLL:
      PKLocalizedPaymentString(CFSTR("PASS_ACTION_UNAVAILABLE_ADD_PAYMENT_METHOD_TITLE"), 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKSecureElementPass displayableNoPaymentNetworkErrorMessageForAction:isTransit:](PKPaymentPass, "displayableNoPaymentNetworkErrorMessageForAction:isTransit:", v6, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
        break;
      goto LABEL_16;
    case 3uLL:
      objc_msgSend(v5, "unavailableBeforeReason");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        goto LABEL_10;
      v10 = CFSTR("PASS_ACTION_UNAVAILABLE_REASON_GENERIC_BEFORE_REASON");
      goto LABEL_12;
    case 4uLL:
      objc_msgSend(v5, "unavailableAfterReason");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        goto LABEL_10;
      objc_msgSend(v6, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("PASS_ACTION_UNAVAILABLE_REASON_GENERIC_AFTER_REASON_FORMAT"), CFSTR("%@"), v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    case 7uLL:
      objc_msgSend(v5, "unavailableActionReason");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
LABEL_10:
        v12 = v9;
      }
      else
      {
        v10 = CFSTR("PASS_ACTION_UNAVAILABLE_GENERIC_REASON");
LABEL_12:
        PKLocalizedPaymentString(&v10->isa, 0);
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      v8 = v12;
LABEL_14:

      break;
    default:
      PKLocalizedPaymentString(CFSTR("PASS_ACTION_UNAVAILABLE_GENERIC_REASON"), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  PKLocalizedPaymentString(CFSTR("PASS_ACTION_UNAVAILABLE_GENERIC_TITLE"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
  PKDisplayableErrorCustomWithType(-1, v7, v8, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
