@implementation PKPaymentApplication

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subcredentials, 0);
  objc_storeStrong((id *)&self->_supportedTransitNetworkIdentifiers, 0);
  objc_storeStrong((id *)&self->_unsupportedInAppMerchantCountryCodes, 0);
  objc_storeStrong((id *)&self->_supportedInAppMerchantCountryCodes, 0);
  objc_storeStrong((id *)&self->_transitProperties, 0);
  objc_storeStrong((id *)&self->_appletDataFormat, 0);
  objc_storeStrong((id *)&self->_transactionSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_inAppPINRequiredCurrency, 0);
  objc_storeStrong((id *)&self->_inAppPINRequiredAmount, 0);
  objc_storeStrong((id *)&self->_appletCurrencyCode, 0);
  objc_storeStrong((id *)&self->_automaticSelectionCriteria, 0);
  objc_storeStrong((id *)&self->_supportedExpressModes, 0);
  objc_storeStrong((id *)&self->_supportsMultiTokens, 0);
  objc_storeStrong((id *)&self->_virtualCardRefreshTypeNumber, 0);
  objc_storeStrong((id *)&self->_supportsVirtualCardNumber, 0);
  objc_storeStrong((id *)&self->_virtualCardSuffix, 0);
  objc_storeStrong((id *)&self->_virtualCardIdentifier, 0);
  objc_storeStrong((id *)&self->_apanSuffix, 0);
  objc_storeStrong((id *)&self->_apanIdentifier, 0);
  objc_storeStrong((id *)&self->_suspendedReason, 0);
  objc_storeStrong((id *)&self->_secureElementIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_sanitizedDPAN, 0);
  objc_storeStrong((id *)&self->_dpanSuffix, 0);
  objc_storeStrong((id *)&self->_dpanIdentifier, 0);
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  int64_t state;
  _BOOL8 supportsContactlessPayment;
  _BOOL8 supportsInAppPayment;
  _BOOL8 supportsMerchantTokens;
  _BOOL8 hasMerchantTokens;
  _BOOL8 hadMerchantTokens;
  NSNumber *supportsVirtualCardNumber;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  int64_t v25;
  int64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_applicationIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_secureElementIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_dpanIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_dpanSuffix);
  objc_msgSend(v3, "safelyAddObject:", self->_sanitizedDPAN);
  objc_msgSend(v3, "safelyAddObject:", self->_apanIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_apanSuffix);
  objc_msgSend(v3, "safelyAddObject:", self->_virtualCardIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_virtualCardSuffix);
  objc_msgSend(v3, "safelyAddObject:", self->_suspendedReason);
  objc_msgSend(v3, "safelyAddObject:", self->_inAppPINRequiredAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_inAppPINRequiredCurrency);
  objc_msgSend(v3, "safelyAddObject:", self->_displayName);
  objc_msgSend(v3, "safelyAddObject:", self->_supportedExpressModes);
  objc_msgSend(v3, "safelyAddObject:", self->_automaticSelectionCriteria);
  objc_msgSend(v3, "safelyAddObject:", self->_appletDataFormat);
  objc_msgSend(v3, "safelyAddObject:", self->_appletCurrencyCode);
  objc_msgSend(v3, "safelyAddObject:", self->_transitProperties);
  objc_msgSend(v3, "safelyAddObject:", self->_supportedInAppMerchantCountryCodes);
  objc_msgSend(v3, "safelyAddObject:", self->_unsupportedInAppMerchantCountryCodes);
  objc_msgSend(v3, "safelyAddObject:", self->_supportedTransitNetworkIdentifiers);
  objc_msgSend(v3, "safelyAddObject:", self->_transactionSourceIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_subcredentials);
  objc_msgSend(v3, "safelyAddObject:", self->_supportsMultiTokens);
  objc_msgSend(v3, "safelyAddObject:", self->_virtualCardRefreshTypeNumber);
  v4 = PKCombinedHash(17, v3);
  state = self->_state;
  supportsContactlessPayment = self->_supportsContactlessPayment;
  supportsInAppPayment = self->_supportsInAppPayment;
  supportsMerchantTokens = self->_supportsMerchantTokens;
  hasMerchantTokens = self->_hasMerchantTokens;
  hadMerchantTokens = self->_hadMerchantTokens;
  supportsVirtualCardNumber = self->_supportsVirtualCardNumber;
  if (supportsVirtualCardNumber)
    v12 = -[NSNumber BOOLValue](supportsVirtualCardNumber, "BOOLValue");
  else
    v12 = 2;
  v13 = supportsContactlessPayment - (state - v4 + 32 * v4) + 32 * (state - v4 + 32 * v4);
  v14 = supportsMerchantTokens - (supportsInAppPayment - v13 + 32 * v13) + 32 * (supportsInAppPayment - v13 + 32 * v13);
  v15 = hadMerchantTokens - (hasMerchantTokens - v14 + 32 * v14) + 32 * (hasMerchantTokens - v14 + 32 * v14);
  v16 = self->_virtualCardVPANOrigin - (v12 - v15 + 32 * v15) + 32 * (v12 - v15 + 32 * v15);
  v17 = self->_supportsBarcodePayment - v16 + 32 * v16;
  v18 = self->_supportsOptionalAuthentication - v17 + 32 * v17;
  v19 = self->_supportsServiceMode - v18 + 32 * v18;
  v20 = self->_paymentNetworkIdentifier - v19 + 32 * v19;
  v21 = self->_auxiliary - v20 + 32 * v20;
  v22 = self->_paymentType - v21 + 32 * v21;
  v23 = self->_auxiliaryPaymentType - v22 + 32 * v22;
  v24 = self->_requiresDeferredAuthorization - v23 + 32 * v23;
  v25 = self->_contactlessPriority - v24 + 32 * v24;
  v26 = self->_inAppPriority - v25 + 32 * v25;
  v27 = self->_supportsInstantFundsIn - v26 + 32 * v26;
  v28 = self->_fundingSourcePaymentType - v27 + 32 * v27;
  v29 = self->_requiresConsentForDataRelease - v28 + 32 * v28;
  v30 = self->_shareable - v29 + 32 * v29;

  return v30;
}

- (unint64_t)paymentType
{
  return self->_paymentType;
}

- (void)setVirtualCardVPANOrigin:(int64_t)a3
{
  self->_virtualCardVPANOrigin = a3;
}

- (void)setVirtualCardSuffix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setVirtualCardIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setUnsupportedInAppMerchantCountryCodes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (void)setTransactionSourceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (void)setSuspendedReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setSupportsServiceMode:(BOOL)a3
{
  self->_supportsServiceMode = a3;
}

- (void)setSupportsOptionalAuthentication:(BOOL)a3
{
  self->_supportsOptionalAuthentication = a3;
}

- (void)setSupportsMerchantTokens:(BOOL)a3
{
  self->_supportsMerchantTokens = a3;
}

- (void)setSupportsInstantFundsIn:(BOOL)a3
{
  self->_supportsInstantFundsIn = a3;
}

- (void)setSupportsInAppPayment:(BOOL)a3
{
  self->_supportsInAppPayment = a3;
}

- (void)setSupportsContactlessPayment:(BOOL)a3
{
  self->_supportsContactlessPayment = a3;
}

- (void)setSupportsBarcodePayment:(BOOL)a3
{
  self->_supportsBarcodePayment = a3;
}

- (void)setSupportedTransitNetworkIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (void)setSupportedInAppMerchantCountryCodes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (void)setSupportedExpressModes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)setSubcredentials:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void)setShareable:(BOOL)a3
{
  self->_shareable = a3;
}

- (void)setSecureElementIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setSanitizedDPAN:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setRequiresDeferredAuthorization:(BOOL)a3
{
  self->_requiresDeferredAuthorization = a3;
}

- (void)setRequiresConsentForDataRelease:(BOOL)a3
{
  self->_requiresConsentForDataRelease = a3;
}

- (void)setPaymentType:(unint64_t)a3
{
  self->_paymentType = a3;
}

- (void)setPaymentNetworkIdentifier:(int64_t)a3
{
  self->_paymentNetworkIdentifier = a3;
}

- (void)setInAppPriority:(int64_t)a3
{
  self->_inAppPriority = a3;
}

- (void)setInAppPINRequiredCurrency:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void)setInAppPINRequiredAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void)setHasMerchantTokens:(BOOL)a3
{
  self->_hasMerchantTokens = a3;
}

- (void)setHadMerchantTokens:(BOOL)a3
{
  self->_hadMerchantTokens = a3;
}

- (void)setFundingSourcePaymentType:(unint64_t)a3
{
  self->_fundingSourcePaymentType = a3;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void)setDPANSuffix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setDPANIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setContactlessPriority:(int64_t)a3
{
  self->_contactlessPriority = a3;
}

- (void)setAuxiliaryPaymentType:(unint64_t)a3
{
  self->_auxiliaryPaymentType = a3;
}

- (void)setAuxiliary:(BOOL)a3
{
  self->_auxiliary = a3;
}

- (void)setAutomaticSelectionCriteria:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setAppletDataFormat:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (void)setAppletCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void)setAPANSuffix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setAPANIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setSupportsVirtualCardNumber:(id)a3
{
  objc_storeStrong((id *)&self->_supportsVirtualCardNumber, a3);
}

- (void)setSupportsMultiTokens:(id)a3
{
  objc_storeStrong((id *)&self->_supportsMultiTokens, a3);
}

- (void)encodeWithCoder:(id)a3
{
  NSString *applicationIdentifier;
  id v5;

  applicationIdentifier = self->_applicationIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", applicationIdentifier, CFSTR("applicationIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secureElementIdentifier, CFSTR("secureElementIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dpanIdentifier, CFSTR("DPANIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dpanSuffix, CFSTR("DPANSuffix"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sanitizedDPAN, CFSTR("sanitizedDPAN"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("applicationDescription"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_state, CFSTR("state"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_suspendedReason, CFSTR("suspendedReason"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsContactlessPayment, CFSTR("supportsContactlessPayment"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsServiceMode, CFSTR("supportsServiceMode"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsInAppPayment, CFSTR("supportsInAppPayment"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsMerchantTokens, CFSTR("supportsMerchantTokens"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasMerchantTokens, CFSTR("hasMerchantTokens"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hadMerchantTokens, CFSTR("hadMerchantTokens"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_apanIdentifier, CFSTR("APANIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_apanSuffix, CFSTR("APANSuffix"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_virtualCardIdentifier, CFSTR("VPANIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_virtualCardSuffix, CFSTR("VPANSuffix"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportsVirtualCardNumber, CFSTR("supportsVirtualCardNumber"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_virtualCardVPANOrigin, CFSTR("virtualCardNumberOrigin"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_virtualCardRefreshTypeNumber, CFSTR("virtualCardRefreshType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportsMultiTokens, CFSTR("supportsMultiTokens"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsBarcodePayment, CFSTR("supportsBarcodePayment"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsOptionalAuthentication, CFSTR("supportsOptionalAuthentication"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportedExpressModes, CFSTR("supportedExpressModes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_automaticSelectionCriteria, CFSTR("automaticSelectionCriteria"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appletDataFormat, CFSTR("appletDataFormat"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appletCurrencyCode, CFSTR("appletCurrencyCode"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_requiresDeferredAuthorization, CFSTR("requiresDeferredAuthorization"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transitProperties, CFSTR("transitPassProperties"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_auxiliary, CFSTR("isAuxiliary"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_paymentNetworkIdentifier, CFSTR("paymentNetworkIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_paymentType, CFSTR("paymentType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_auxiliaryPaymentType, CFSTR("auxiliaryPaymentType"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsInstantFundsIn, CFSTR("supportsInstantFundsIn"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_fundingSourcePaymentType, CFSTR("fundingSourcePaymentType"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_requiresConsentForDataRelease, CFSTR("requiresConsentForDataRelease"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_contactlessPriority, CFSTR("contactlessPriority"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_inAppPriority, CFSTR("inAppPriority"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_inAppPINRequiredAmount, CFSTR("inAppPINRequiredAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_inAppPINRequiredCurrency, CFSTR("inAppPINRequiredCurrency"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportedInAppMerchantCountryCodes, CFSTR("supportedInAppMerchantCountryCodes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_unsupportedInAppMerchantCountryCodes, CFSTR("unsupportedInAppMerchantCountryCodes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportedTransitNetworkIdentifiers, CFSTR("supportedTransitNetworkIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subcredentials, CFSTR("subcredentials"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionSourceIdentifier, CFSTR("transactionSourceIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shareable, CFSTR("shareable"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSSet)subcredentials
{
  return self->_subcredentials;
}

- (BOOL)supportsExpress
{
  unint64_t state;
  BOOL v3;
  uint64_t v4;
  BOOL v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  state = self->_state;
  v3 = state > 0xF;
  v4 = (1 << state) & 0x83DE;
  v5 = v3 || v4 == 0;
  if (v5 || !self->_supportsOptionalAuthentication)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_automaticSelectionCriteria;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v6);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "supportsExpress", (_QWORD)v11) & 1) != 0)
          {
            LOBYTE(v7) = 1;
            goto LABEL_17;
          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_17:

  }
  return v7;
}

- (NSArray)automaticSelectionCriteria
{
  return self->_automaticSelectionCriteria;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (BOOL)supportsBarcodePayment
{
  return self->_supportsBarcodePayment;
}

- (NSString)secureElementIdentifier
{
  return self->_secureElementIdentifier;
}

- (BOOL)supportsInAppPayment
{
  return self->_supportsInAppPayment;
}

- (BOOL)supportsContactlessPayment
{
  return self->_supportsContactlessPayment;
}

- (BOOL)isAuxiliary
{
  return self->_auxiliary;
}

- (PKPaymentApplication)initWithPaymentApplicationDictionary:(id)a3 auxiliaryApplication:(BOOL)a4
{
  id v6;
  PKPaymentApplication *v7;
  uint64_t v8;
  NSString *applicationIdentifier;
  uint64_t v10;
  NSString *secureElementIdentifier;
  uint64_t v12;
  NSString *dpanIdentifier;
  uint64_t v14;
  NSString *dpanSuffix;
  uint64_t v16;
  NSString *sanitizedDPAN;
  void *v18;
  uint64_t v19;
  NSString *suspendedReason;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSString *apanIdentifier;
  uint64_t v28;
  NSString *apanSuffix;
  uint64_t v30;
  NSNumber *supportsMultiTokens;
  uint64_t v32;
  NSString *virtualCardIdentifier;
  uint64_t v34;
  NSString *virtualCardSuffix;
  uint64_t v36;
  NSNumber *supportsVirtualCardNumber;
  void *v38;
  uint64_t v39;
  NSNumber *virtualCardRefreshTypeNumber;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  NSArray *supportedExpressModes;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  PKPassAutomaticSelectionCriterion *v57;
  uint64_t v58;
  NSArray *automaticSelectionCriteria;
  void *v60;
  uint64_t v61;
  NSString *appletDataFormat;
  void *v63;
  uint64_t v64;
  NSString *appletCurrencyCode;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  NSString *displayName;
  void *v72;
  uint64_t v73;
  NSDecimalNumber *inAppPINRequiredAmount;
  uint64_t v75;
  NSString *inAppPINRequiredCurrency;
  void *v77;
  void *v78;
  uint64_t v79;
  NSArray *supportedInAppMerchantCountryCodes;
  uint64_t v81;
  NSArray *unsupportedInAppMerchantCountryCodes;
  uint64_t v83;
  NSArray *supportedTransitNetworkIdentifiers;
  void *v85;
  void *v86;
  void *v87;
  uint64_t paymentType;
  void *v89;
  void *v90;
  PKAppletSubcredential *v91;
  uint64_t v92;
  NSSet *subcredentials;
  void *v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  objc_super v100;
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v100.receiver = self;
  v100.super_class = (Class)PKPaymentApplication;
  v7 = -[PKPaymentApplication init](&v100, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("applicationIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    applicationIdentifier = v7->_applicationIdentifier;
    v7->_applicationIdentifier = (NSString *)v8;

    objc_msgSend(v6, "objectForKey:", CFSTR("secureElementIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    secureElementIdentifier = v7->_secureElementIdentifier;
    v7->_secureElementIdentifier = (NSString *)v10;

    objc_msgSend(v6, "objectForKey:", CFSTR("DPANIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    dpanIdentifier = v7->_dpanIdentifier;
    v7->_dpanIdentifier = (NSString *)v12;

    objc_msgSend(v6, "objectForKey:", CFSTR("DPANSuffix"));
    v14 = objc_claimAutoreleasedReturnValue();
    dpanSuffix = v7->_dpanSuffix;
    v7->_dpanSuffix = (NSString *)v14;

    objc_msgSend(v6, "objectForKey:", CFSTR("sanitizedDPAN"));
    v16 = objc_claimAutoreleasedReturnValue();
    sanitizedDPAN = v7->_sanitizedDPAN;
    v7->_sanitizedDPAN = (NSString *)v16;

    objc_msgSend(v6, "objectForKey:", CFSTR("state"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_state = objc_msgSend(v18, "integerValue");

    objc_msgSend(v6, "objectForKey:", CFSTR("suspendedReason"));
    v19 = objc_claimAutoreleasedReturnValue();
    suspendedReason = v7->_suspendedReason;
    v7->_suspendedReason = (NSString *)v19;

    objc_msgSend(v6, "objectForKey:", CFSTR("supportsContactlessPayment"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_supportsContactlessPayment = objc_msgSend(v21, "BOOLValue");

    objc_msgSend(v6, "objectForKey:", CFSTR("supportsInAppPayment"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_supportsInAppPayment = objc_msgSend(v22, "BOOLValue");

    objc_msgSend(v6, "objectForKey:", CFSTR("supportsMerchantTokens"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_supportsMerchantTokens = objc_msgSend(v23, "BOOLValue");

    objc_msgSend(v6, "objectForKey:", CFSTR("hasMerchantTokens"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_hasMerchantTokens = objc_msgSend(v24, "BOOLValue");

    objc_msgSend(v6, "objectForKey:", CFSTR("hadMerchantTokens"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_hadMerchantTokens = objc_msgSend(v25, "BOOLValue");

    objc_msgSend(v6, "objectForKey:", CFSTR("APANIdentifier"));
    v26 = objc_claimAutoreleasedReturnValue();
    apanIdentifier = v7->_apanIdentifier;
    v7->_apanIdentifier = (NSString *)v26;

    objc_msgSend(v6, "objectForKey:", CFSTR("APANSuffix"));
    v28 = objc_claimAutoreleasedReturnValue();
    apanSuffix = v7->_apanSuffix;
    v7->_apanSuffix = (NSString *)v28;

    objc_msgSend(v6, "objectForKey:", CFSTR("supportsMultiTokens"));
    v30 = objc_claimAutoreleasedReturnValue();
    supportsMultiTokens = v7->_supportsMultiTokens;
    v7->_supportsMultiTokens = (NSNumber *)v30;

    objc_msgSend(v6, "objectForKey:", CFSTR("VPANIdentifier"));
    v32 = objc_claimAutoreleasedReturnValue();
    virtualCardIdentifier = v7->_virtualCardIdentifier;
    v7->_virtualCardIdentifier = (NSString *)v32;

    objc_msgSend(v6, "objectForKey:", CFSTR("VPANSuffix"));
    v34 = objc_claimAutoreleasedReturnValue();
    virtualCardSuffix = v7->_virtualCardSuffix;
    v7->_virtualCardSuffix = (NSString *)v34;

    objc_msgSend(v6, "objectForKey:", CFSTR("supportsVirtualCardNumber"));
    v36 = objc_claimAutoreleasedReturnValue();
    supportsVirtualCardNumber = v7->_supportsVirtualCardNumber;
    v7->_supportsVirtualCardNumber = (NSNumber *)v36;

    objc_msgSend(v6, "objectForKey:", CFSTR("virtualCardNumberOrigin"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_virtualCardVPANOrigin = PKVirtualCardVPANOriginForString(v38);

    objc_msgSend(v6, "PKNumberForKey:", CFSTR("virtualCardRefreshType"));
    v39 = objc_claimAutoreleasedReturnValue();
    virtualCardRefreshTypeNumber = v7->_virtualCardRefreshTypeNumber;
    v7->_virtualCardRefreshTypeNumber = (NSNumber *)v39;

    objc_msgSend(v6, "objectForKey:", CFSTR("supportsBarcodePayment"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_supportsBarcodePayment = objc_msgSend(v41, "BOOLValue");

    objc_msgSend(v6, "objectForKey:", CFSTR("supportsOptionalAuthentication"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_supportsOptionalAuthentication = objc_msgSend(v42, "BOOLValue");

    objc_msgSend(v6, "objectForKey:", CFSTR("supportedExpressModes"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "copy");
    supportedExpressModes = v7->_supportedExpressModes;
    v7->_supportedExpressModes = (NSArray *)v44;

    objc_msgSend(v6, "objectForKey:", CFSTR("supportsServiceMode"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v46;
    if (v46)
      v48 = objc_msgSend(v46, "BOOLValue");
    else
      v48 = 1;
    v7->_supportsServiceMode = v48;
    objc_msgSend(v6, "objectForKey:", CFSTR("automaticSelectionCriteria"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      v95 = v47;
      v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v49, "count"));
      v96 = 0u;
      v97 = 0u;
      v98 = 0u;
      v99 = 0u;
      v51 = v49;
      v52 = v49;
      v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v96, v101, 16);
      if (v53)
      {
        v54 = v53;
        v55 = *(_QWORD *)v97;
        do
        {
          for (i = 0; i != v54; ++i)
          {
            if (*(_QWORD *)v97 != v55)
              objc_enumerationMutation(v52);
            v57 = -[PKPassAutomaticSelectionCriterion initWithDictionary:]([PKPassAutomaticSelectionCriterion alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * i));
            if (v57)
              objc_msgSend(v50, "addObject:", v57);

          }
          v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v96, v101, 16);
        }
        while (v54);
      }

      v58 = objc_msgSend(v50, "copy");
      automaticSelectionCriteria = v7->_automaticSelectionCriteria;
      v7->_automaticSelectionCriteria = (NSArray *)v58;

      v47 = v95;
      v49 = v51;
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("appletDataFormat"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v60, "copy");
    appletDataFormat = v7->_appletDataFormat;
    v7->_appletDataFormat = (NSString *)v61;

    objc_msgSend(v6, "objectForKey:", CFSTR("appletCurrencyCode"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v63, "copy");
    appletCurrencyCode = v7->_appletCurrencyCode;
    v7->_appletCurrencyCode = (NSString *)v64;

    objc_msgSend(v6, "objectForKey:", CFSTR("requiresDeferredAuthorization"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_requiresDeferredAuthorization = objc_msgSend(v66, "BOOLValue");

    objc_msgSend(v6, "objectForKey:", CFSTR("paymentNetworkIdentifier"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_paymentNetworkIdentifier = objc_msgSend(v67, "integerValue");

    objc_msgSend(v6, "objectForKey:", CFSTR("paymentType"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_paymentType = PKPaymentMethodTypeForString(v68);

    objc_msgSend(v6, "objectForKey:", CFSTR("auxiliaryPaymentType"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_auxiliaryPaymentType = PKPaymentMethodTypeForString(v69);

    objc_msgSend(v6, "objectForKey:", CFSTR("applicationDescription"));
    v70 = objc_claimAutoreleasedReturnValue();
    displayName = v7->_displayName;
    v7->_displayName = (NSString *)v70;

    objc_msgSend(v6, "objectForKey:", CFSTR("inAppPINRequiredAmount"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    if (v72)
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", v72);
      v73 = objc_claimAutoreleasedReturnValue();
      inAppPINRequiredAmount = v7->_inAppPINRequiredAmount;
      v7->_inAppPINRequiredAmount = (NSDecimalNumber *)v73;

    }
    objc_msgSend(v6, "objectForKey:", CFSTR("inAppPINRequiredCurrency"));
    v75 = objc_claimAutoreleasedReturnValue();
    inAppPINRequiredCurrency = v7->_inAppPINRequiredCurrency;
    v7->_inAppPINRequiredCurrency = (NSString *)v75;

    v7->_auxiliary = a4;
    objc_msgSend(v6, "objectForKey:", CFSTR("contactlessPriority"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_contactlessPriority = objc_msgSend(v77, "integerValue");

    objc_msgSend(v6, "objectForKey:", CFSTR("inAppPriority"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_inAppPriority = objc_msgSend(v78, "integerValue");

    objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("supportedInAppMerchantCountryCodes"));
    v79 = objc_claimAutoreleasedReturnValue();
    supportedInAppMerchantCountryCodes = v7->_supportedInAppMerchantCountryCodes;
    v7->_supportedInAppMerchantCountryCodes = (NSArray *)v79;

    objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("unsupportedInAppMerchantCountryCodes"));
    v81 = objc_claimAutoreleasedReturnValue();
    unsupportedInAppMerchantCountryCodes = v7->_unsupportedInAppMerchantCountryCodes;
    v7->_unsupportedInAppMerchantCountryCodes = (NSArray *)v81;

    objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("supportedTransitNetworkIdentifiers"));
    v83 = objc_claimAutoreleasedReturnValue();
    supportedTransitNetworkIdentifiers = v7->_supportedTransitNetworkIdentifiers;
    v7->_supportedTransitNetworkIdentifiers = (NSArray *)v83;

    objc_msgSend(v6, "objectForKey:", CFSTR("supportsInstantFundsIn"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_supportsInstantFundsIn = objc_msgSend(v85, "BOOLValue");

    objc_msgSend(v6, "objectForKey:", CFSTR("fundingSourcePaymentType"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = v86;
    if (v86)
      paymentType = PKPaymentMethodTypeForString(v86);
    else
      paymentType = v7->_paymentType;
    v7->_fundingSourcePaymentType = paymentType;
    objc_msgSend(v6, "objectForKey:", CFSTR("requiresConsentForDataRelease"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_requiresConsentForDataRelease = objc_msgSend(v89, "BOOLValue");

    objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("subcredential"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    if (v90)
    {
      v91 = -[PKAppletSubcredential initWithDictionary:]([PKAppletSubcredential alloc], "initWithDictionary:", v90);
      if (v91)
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v91);
        v92 = objc_claimAutoreleasedReturnValue();
        subcredentials = v7->_subcredentials;
        v7->_subcredentials = (NSSet *)v92;
      }
      else
      {
        subcredentials = v7->_subcredentials;
        v7->_subcredentials = 0;
      }

    }
    v7->_shareable = objc_msgSend(v6, "PKBoolForKey:", CFSTR("shareable"));
    v7->_foundVehicleReport = 0;
    -[PKPaymentApplication _createAndPopulateAutomaticSelectionCriteriaIfNecessary](v7, "_createAndPopulateAutomaticSelectionCriteriaIfNecessary");

  }
  return v7;
}

- (PKPaymentApplication)initWithCoder:(id)a3
{
  id v4;
  PKPaymentApplication *v5;
  uint64_t v6;
  NSString *applicationIdentifier;
  uint64_t v8;
  NSString *secureElementIdentifier;
  uint64_t v10;
  NSString *dpanIdentifier;
  uint64_t v12;
  NSString *dpanSuffix;
  uint64_t v14;
  NSString *sanitizedDPAN;
  uint64_t v16;
  NSDecimalNumber *inAppPINRequiredAmount;
  uint64_t v18;
  NSString *inAppPINRequiredCurrency;
  uint64_t v20;
  NSString *displayName;
  uint64_t v22;
  NSString *suspendedReason;
  uint64_t v24;
  NSString *apanIdentifier;
  uint64_t v26;
  NSString *apanSuffix;
  uint64_t v28;
  NSString *virtualCardIdentifier;
  uint64_t v30;
  NSString *virtualCardSuffix;
  uint64_t v32;
  NSNumber *supportsVirtualCardNumber;
  uint64_t v34;
  NSNumber *virtualCardRefreshTypeNumber;
  uint64_t v36;
  NSNumber *supportsMultiTokens;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  NSArray *supportedExpressModes;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSArray *automaticSelectionCriteria;
  uint64_t v48;
  NSString *appletCurrencyCode;
  uint64_t v50;
  NSString *appletDataFormat;
  uint64_t v52;
  PKTransitPassProperties *transitProperties;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  NSArray *supportedInAppMerchantCountryCodes;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  NSArray *unsupportedInAppMerchantCountryCodes;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  NSArray *supportedTransitNetworkIdentifiers;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  NSSet *subcredentials;
  uint64_t v74;
  NSString *transactionSourceIdentifier;
  objc_super v77;

  v4 = a3;
  v77.receiver = self;
  v77.super_class = (Class)PKPaymentApplication;
  v5 = -[PKPaymentApplication init](&v77, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secureElementIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    secureElementIdentifier = v5->_secureElementIdentifier;
    v5->_secureElementIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DPANIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    dpanIdentifier = v5->_dpanIdentifier;
    v5->_dpanIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DPANSuffix"));
    v12 = objc_claimAutoreleasedReturnValue();
    dpanSuffix = v5->_dpanSuffix;
    v5->_dpanSuffix = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sanitizedDPAN"));
    v14 = objc_claimAutoreleasedReturnValue();
    sanitizedDPAN = v5->_sanitizedDPAN;
    v5->_sanitizedDPAN = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inAppPINRequiredAmount"));
    v16 = objc_claimAutoreleasedReturnValue();
    inAppPINRequiredAmount = v5->_inAppPINRequiredAmount;
    v5->_inAppPINRequiredAmount = (NSDecimalNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inAppPINRequiredCurrency"));
    v18 = objc_claimAutoreleasedReturnValue();
    inAppPINRequiredCurrency = v5->_inAppPINRequiredCurrency;
    v5->_inAppPINRequiredCurrency = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationDescription"));
    v20 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v20;

    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suspendedReason"));
    v22 = objc_claimAutoreleasedReturnValue();
    suspendedReason = v5->_suspendedReason;
    v5->_suspendedReason = (NSString *)v22;

    v5->_supportsContactlessPayment = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsContactlessPayment"));
    v5->_supportsServiceMode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsServiceMode"));
    v5->_supportsInAppPayment = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsInAppPayment"));
    v5->_supportsMerchantTokens = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsMerchantTokens"));
    v5->_hasMerchantTokens = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasMerchantTokens"));
    v5->_hadMerchantTokens = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hadMerchantTokens"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("APANIdentifier"));
    v24 = objc_claimAutoreleasedReturnValue();
    apanIdentifier = v5->_apanIdentifier;
    v5->_apanIdentifier = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("APANSuffix"));
    v26 = objc_claimAutoreleasedReturnValue();
    apanSuffix = v5->_apanSuffix;
    v5->_apanSuffix = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("VPANIdentifier"));
    v28 = objc_claimAutoreleasedReturnValue();
    virtualCardIdentifier = v5->_virtualCardIdentifier;
    v5->_virtualCardIdentifier = (NSString *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("VPANSuffix"));
    v30 = objc_claimAutoreleasedReturnValue();
    virtualCardSuffix = v5->_virtualCardSuffix;
    v5->_virtualCardSuffix = (NSString *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supportsVirtualCardNumber"));
    v32 = objc_claimAutoreleasedReturnValue();
    supportsVirtualCardNumber = v5->_supportsVirtualCardNumber;
    v5->_supportsVirtualCardNumber = (NSNumber *)v32;

    v5->_virtualCardVPANOrigin = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("virtualCardNumberOrigin"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("virtualCardRefreshType"));
    v34 = objc_claimAutoreleasedReturnValue();
    virtualCardRefreshTypeNumber = v5->_virtualCardRefreshTypeNumber;
    v5->_virtualCardRefreshTypeNumber = (NSNumber *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supportsMultiTokens"));
    v36 = objc_claimAutoreleasedReturnValue();
    supportsMultiTokens = v5->_supportsMultiTokens;
    v5->_supportsMultiTokens = (NSNumber *)v36;

    v5->_supportsBarcodePayment = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsBarcodePayment"));
    v5->_supportsOptionalAuthentication = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsOptionalAuthentication"));
    v38 = (void *)MEMORY[0x1E0C99E60];
    v39 = objc_opt_class();
    objc_msgSend(v38, "setWithObjects:", v39, objc_opt_class(), 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v40, CFSTR("supportedExpressModes"));
    v41 = objc_claimAutoreleasedReturnValue();
    supportedExpressModes = v5->_supportedExpressModes;
    v5->_supportedExpressModes = (NSArray *)v41;

    v43 = (void *)MEMORY[0x1E0C99E60];
    v44 = objc_opt_class();
    objc_msgSend(v43, "setWithObjects:", v44, objc_opt_class(), 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v45, CFSTR("automaticSelectionCriteria"));
    v46 = objc_claimAutoreleasedReturnValue();
    automaticSelectionCriteria = v5->_automaticSelectionCriteria;
    v5->_automaticSelectionCriteria = (NSArray *)v46;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appletCurrencyCode"));
    v48 = objc_claimAutoreleasedReturnValue();
    appletCurrencyCode = v5->_appletCurrencyCode;
    v5->_appletCurrencyCode = (NSString *)v48;

    v5->_requiresDeferredAuthorization = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresDeferredAuthorization"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appletDataFormat"));
    v50 = objc_claimAutoreleasedReturnValue();
    appletDataFormat = v5->_appletDataFormat;
    v5->_appletDataFormat = (NSString *)v50;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transitPassProperties"));
    v52 = objc_claimAutoreleasedReturnValue();
    transitProperties = v5->_transitProperties;
    v5->_transitProperties = (PKTransitPassProperties *)v52;

    v5->_paymentNetworkIdentifier = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("paymentNetworkIdentifier"));
    v5->_auxiliary = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAuxiliary"));
    v5->_paymentType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("paymentType"));
    v5->_auxiliaryPaymentType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("auxiliaryPaymentType"));
    v5->_contactlessPriority = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("contactlessPriority"));
    v5->_inAppPriority = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("inAppPriority"));
    v54 = (void *)MEMORY[0x1E0C99E60];
    v55 = objc_opt_class();
    objc_msgSend(v54, "setWithObjects:", v55, objc_opt_class(), 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v56, CFSTR("supportedInAppMerchantCountryCodes"));
    v57 = objc_claimAutoreleasedReturnValue();
    supportedInAppMerchantCountryCodes = v5->_supportedInAppMerchantCountryCodes;
    v5->_supportedInAppMerchantCountryCodes = (NSArray *)v57;

    v59 = (void *)MEMORY[0x1E0C99E60];
    v60 = objc_opt_class();
    objc_msgSend(v59, "setWithObjects:", v60, objc_opt_class(), 0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v61, CFSTR("unsupportedInAppMerchantCountryCodes"));
    v62 = objc_claimAutoreleasedReturnValue();
    unsupportedInAppMerchantCountryCodes = v5->_unsupportedInAppMerchantCountryCodes;
    v5->_unsupportedInAppMerchantCountryCodes = (NSArray *)v62;

    v64 = (void *)MEMORY[0x1E0C99E60];
    v65 = objc_opt_class();
    objc_msgSend(v64, "setWithObjects:", v65, objc_opt_class(), 0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v66, CFSTR("supportedTransitNetworkIdentifiers"));
    v67 = objc_claimAutoreleasedReturnValue();
    supportedTransitNetworkIdentifiers = v5->_supportedTransitNetworkIdentifiers;
    v5->_supportedTransitNetworkIdentifiers = (NSArray *)v67;

    v5->_supportsInstantFundsIn = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsInstantFundsIn"));
    v5->_fundingSourcePaymentType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fundingSourcePaymentType"));
    v5->_requiresConsentForDataRelease = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresConsentForDataRelease"));
    v69 = (void *)MEMORY[0x1E0C99E60];
    v70 = objc_opt_class();
    objc_msgSend(v69, "setWithObjects:", v70, objc_opt_class(), 0);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v71, CFSTR("subcredentials"));
    v72 = objc_claimAutoreleasedReturnValue();
    subcredentials = v5->_subcredentials;
    v5->_subcredentials = (NSSet *)v72;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionSourceIdentifier"));
    v74 = objc_claimAutoreleasedReturnValue();
    transactionSourceIdentifier = v5->_transactionSourceIdentifier;
    v5->_transactionSourceIdentifier = (NSString *)v74;

    v5->_shareable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shareable"));
    -[PKPaymentApplication _createAndPopulateAutomaticSelectionCriteriaIfNecessary](v5, "_createAndPopulateAutomaticSelectionCriteriaIfNecessary");
  }

  return v5;
}

- (void)_createAndPopulateAutomaticSelectionCriteriaIfNecessary
{
  NSUInteger v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSArray *v11;
  NSArray *automaticSelectionCriteria;
  NSArray *v13;
  id v14;
  NSSet *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  void *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (!self->_automaticSelectionCriteria)
  {
    v3 = -[NSArray count](self->_supportedExpressModes, "count");
    if (v3)
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v3);
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v5 = self->_supportedExpressModes;
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v41 != v8)
              objc_enumerationMutation(v5);
            +[PKPassAutomaticSelectionCriterion criterionForExpressMode:](PKPassAutomaticSelectionCriterion, "criterionForExpressMode:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (v10)
              objc_msgSend(v4, "addObject:", v10);

          }
          v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
        }
        while (v7);
      }

      v11 = (NSArray *)objc_msgSend(v4, "copy");
      automaticSelectionCriteria = self->_automaticSelectionCriteria;
      self->_automaticSelectionCriteria = v11;

    }
    else
    {
      v13 = self->_automaticSelectionCriteria;
      self->_automaticSelectionCriteria = (NSArray *)MEMORY[0x1E0C9AA60];

    }
  }
  v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v15 = self->_subcredentials;
  v16 = -[NSSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v37 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
        objc_msgSend(v20, "readerIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          objc_msgSend(v14, "pk_safelyAddObject:", v21);
        }
        else
        {
          objc_msgSend(v20, "pairedReaderIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "pk_decodeHexadecimal");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "pk_safelyAddObject:", v23);

        }
      }
      v17 = -[NSSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v17);
  }

  if (objc_msgSend(v14, "count"))
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v24 = self->_automaticSelectionCriteria;
    v25 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v33;
      do
      {
        for (k = 0; k != v26; ++k)
        {
          if (*(_QWORD *)v33 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * k);
          objc_msgSend(v29, "readerIDs", (_QWORD)v32);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "count");

          if (!v31)
            objc_msgSend(v29, "setReaderIDs:", v14);
        }
        v26 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
      }
      while (v26);
    }

  }
}

- (BOOL)acceptedForNonWebPaymentWithSupportedNetworkIdentifiers:(id)a3 merchantCapabilities:(unint64_t)a4 paymentMode:(int64_t)a5
{
  void *v6;
  uint64_t v8;

  LOBYTE(v8) = 0;
  +[PKPaymentRequestSupportedQuery inAppQueryWithSupportedNetworkIDs:merchantCapabilities:merchantCountryCode:paymentMode:paymentApplicationStates:paymentRequestType:isMultiTokensRequest:webService:](PKPaymentRequestSupportedQuery, "inAppQueryWithSupportedNetworkIDs:merchantCapabilities:merchantCountryCode:paymentMode:paymentApplicationStates:paymentRequestType:isMultiTokensRequest:webService:", a3, a4, 0, a5, 0, 0, v8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PKPaymentApplication canProcessPayment:](self, "canProcessPayment:", v6);

  return (char)self;
}

- (BOOL)canProcessPayment:(id)a3
{
  id v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;

  v4 = a3;
  v5 = objc_msgSend(v4, "issuedOnTheWeb");
  objc_msgSend(v4, "supportedNetworkIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "merchantCapabilities");
  objc_msgSend(v4, "merchantCountryCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paymentApplicationStates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "webService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v4, "paymentMode");
    v12 = objc_msgSend(v4, "isMultiTokensRequest");

    LOBYTE(v17) = v12;
    v13 = -[PKPaymentApplication acceptedForWebPaymentWithSupportedNetworkIdentifiers:merchantCapabilities:merchantCountryCode:paymentApplicationStates:webService:paymentMode:isMultiTokensRequest:](self, "acceptedForWebPaymentWithSupportedNetworkIdentifiers:merchantCapabilities:merchantCountryCode:paymentApplicationStates:webService:paymentMode:isMultiTokensRequest:", v6, v7, v8, v9, v10, v11, v17);
  }
  else
  {
    objc_msgSend(v4, "paymentRequestType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v4, "isMultiTokensRequest");
    objc_msgSend(v4, "webService");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[PKPaymentApplication acceptedForNonWebPaymentWithSupportedNetworkIdentifiers:merchantCapabilities:merchantCountryCode:paymentApplicationStates:paymentRequestType:isMultiTokensRequest:webService:](self, "acceptedForNonWebPaymentWithSupportedNetworkIdentifiers:merchantCapabilities:merchantCountryCode:paymentApplicationStates:paymentRequestType:isMultiTokensRequest:webService:", v6, v7, v8, v9, v10, v14, v15);
  }

  return v13;
}

- (BOOL)acceptedForWebPaymentWithSupportedNetworkIdentifiers:(id)a3 merchantCapabilities:(unint64_t)a4 merchantCountryCode:(id)a5 paymentApplicationStates:(id)a6 webService:(id)a7 paymentMode:(int64_t)a8 isMultiTokensRequest:(BOOL)a9
{
  id v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;

  v15 = a7;
  if (-[PKPaymentApplication acceptedForNonWebPaymentWithSupportedNetworkIdentifiers:merchantCapabilities:merchantCountryCode:paymentApplicationStates:paymentRequestType:isMultiTokensRequest:webService:](self, "acceptedForNonWebPaymentWithSupportedNetworkIdentifiers:merchantCapabilities:merchantCountryCode:paymentApplicationStates:paymentRequestType:isMultiTokensRequest:webService:", a3, a4, a5, a6, 0, a9, v15))
  {
    objc_msgSend(v15, "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "unsupportedWebPaymentConfigurations");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = -[PKPaymentApplication supportsWebPaymentMode:withExclusionList:](self, "supportsWebPaymentMode:withExclusionList:", a8, v18);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)acceptedForNonWebPaymentWithSupportedNetworkIdentifiers:(id)a3 merchantCapabilities:(unint64_t)a4 merchantCountryCode:(id)a5 paymentApplicationStates:(id)a6 paymentRequestType:(id)a7 isMultiTokensRequest:(BOOL)a8 webService:(id)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  char v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v33;

  v33 = a8;
  v13 = a7;
  v14 = a9;
  v15 = a6;
  v16 = a5;
  v17 = a3;
  LODWORD(a3) = -[PKPaymentApplication supportsInAppPayment](self, "supportsInAppPayment");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PKPaymentApplication state](self, "state"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v15, "containsObject:", v18);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PKPaymentApplication paymentNetworkIdentifier](self, "paymentNetworkIdentifier"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v17, "containsObject:", v20);

  -[PKPaymentApplication unsupportedInAppMerchantCountryCodes](self, "unsupportedInAppMerchantCountryCodes");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "containsObject:", v16);

  v24 = 0;
  if ((_DWORD)a3 && v19 && v21 && (v23 & 1) == 0)
  {
    if (!v13 || objc_msgSend(v13, "intValue") != 10)
      goto LABEL_10;
    if ((a4 & 0x80) != 0 && !-[PKPaymentApplication supportsInstantFundsIn](self, "supportsInstantFundsIn"))
      goto LABEL_16;
    +[PKWebServiceDisbursementFeature disbursementFeatureWithWebService:](PKWebServiceDisbursementFeature, "disbursementFeatureWithWebService:", v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "supportedNetworks");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PKPaymentApplication paymentNetworkIdentifier](self, "paymentNetworkIdentifier"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "containsObject:", v27);

    if (!v28)
    {
LABEL_16:
      v24 = 0;
    }
    else
    {
LABEL_10:
      objc_msgSend(v14, "targetDevice");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "paymentWebService:supportedRegionFeatureOfType:", v14, 4);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v30, "supportedNetworks");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33
        && !-[PKPaymentApplication supportsMultiTokensWithImplicitlyEnabledNetworks:](self, "supportsMultiTokensWithImplicitlyEnabledNetworks:", v31))
      {
        v24 = 0;
      }
      else
      {
        v24 = objc_msgSend((id)objc_opt_class(), "paymentApplicationSupportsMerchantCapabilties:paymentType:", a4, -[PKPaymentApplication paymentType](self, "paymentType"));
      }

    }
  }

  return v24;
}

+ (PKPaymentApplication)applicationWithProtobuf:(id)a3
{
  id v3;
  PKPaymentApplication *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = a3;
  v4 = objc_alloc_init(PKPaymentApplication);
  objc_msgSend(v3, "dpanIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentApplication setDPANIdentifier:](v4, "setDPANIdentifier:", v5);

  objc_msgSend(v3, "dpanSuffix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentApplication setDPANSuffix:](v4, "setDPANSuffix:", v6);

  objc_msgSend(v3, "sanitizedDpan");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentApplication setSanitizedDPAN:](v4, "setSanitizedDPAN:", v7);

  objc_msgSend(v3, "applicationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentApplication setApplicationIdentifier:](v4, "setApplicationIdentifier:", v8);

  objc_msgSend(v3, "secureElementIdenfitier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentApplication setSecureElementIdentifier:](v4, "setSecureElementIdentifier:", v9);

  -[PKPaymentApplication setState:](v4, "setState:", objc_msgSend(v3, "state"));
  objc_msgSend(v3, "suspendedReason");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentApplication setSuspendedReason:](v4, "setSuspendedReason:", v10);

  -[PKPaymentApplication setSupportsContactlessPayment:](v4, "setSupportsContactlessPayment:", objc_msgSend(v3, "supportsContactlessPayment"));
  -[PKPaymentApplication setSupportsInAppPayment:](v4, "setSupportsInAppPayment:", objc_msgSend(v3, "supportsInAppPayment"));
  -[PKPaymentApplication setPaymentNetworkIdentifier:](v4, "setPaymentNetworkIdentifier:", objc_msgSend(v3, "paymentNetworkIdentifier"));
  -[PKPaymentApplication setInAppPINRequired:](v4, "setInAppPINRequired:", objc_msgSend(v3, "inAppPINRequired"));
  if (objc_msgSend(v3, "hasBalanceInAppPINRequiredAmount"))
  {
    objc_msgSend(v3, "balanceInAppPINRequiredAmount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PKProtoSupportDecimalNumberFromProtobuf(v11);
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v13 = (void *)v12;
    -[PKPaymentApplication setInAppPINRequiredAmount:](v4, "setInAppPINRequiredAmount:", v12);

    goto LABEL_7;
  }
  if (objc_msgSend(v3, "hasCustomPrecisionInAppPINRequiredAmount"))
  {
    objc_msgSend(v3, "customPrecisionInAppPINRequiredAmount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PKLegacyCurrencyStorageIntegerToDecimal(objc_msgSend(v11, "amount"), 1);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  PKLegacyCurrencyStorageIntegerToDecimal(objc_msgSend(v3, "inAppPINRequiredAmount"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentApplication setInAppPINRequiredAmount:](v4, "setInAppPINRequiredAmount:", v11);
LABEL_7:

  objc_msgSend(v3, "inAppPINRequiredCurrency");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentApplication setInAppPINRequiredCurrency:](v4, "setInAppPINRequiredCurrency:", v14);

  objc_msgSend(v3, "displayName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentApplication setDisplayName:](v4, "setDisplayName:", v15);

  -[PKPaymentApplication setAuxiliary:](v4, "setAuxiliary:", objc_msgSend(v3, "auxiliary"));
  -[PKPaymentApplication setPaymentType:](v4, "setPaymentType:", objc_msgSend(v3, "paymentType"));
  -[PKPaymentApplication setAuxiliaryPaymentType:](v4, "setAuxiliaryPaymentType:", objc_msgSend(v3, "auxiliaryPaymentType"));
  -[PKPaymentApplication setAutomaticSelectionCriteria:](v4, "setAutomaticSelectionCriteria:", MEMORY[0x1E0C9AA60]);
  -[PKPaymentApplication setInAppPriority:](v4, "setInAppPriority:", objc_msgSend(v3, "inAppPriority"));
  objc_msgSend(v3, "apanIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentApplication setAPANIdentifier:](v4, "setAPANIdentifier:", v16);

  objc_msgSend(v3, "apanSuffix");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentApplication setAPANSuffix:](v4, "setAPANSuffix:", v17);

  -[PKPaymentApplication setSupportsMerchantTokens:](v4, "setSupportsMerchantTokens:", objc_msgSend(v3, "supportsMerchantTokens"));
  -[PKPaymentApplication setSupportsInstantFundsIn:](v4, "setSupportsInstantFundsIn:", objc_msgSend(v3, "supportsInstantFundsIn"));
  if ((objc_msgSend(v3, "hasSupportsMultiTokensV2") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "supportsMultiTokensV2"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentApplication setSupportsMultiTokens:](v4, "setSupportsMultiTokens:", v18);

  }
  else
  {
    -[PKPaymentApplication setSupportsMultiTokens:](v4, "setSupportsMultiTokens:", 0);
  }

  return v4;
}

- (id)protobuf
{
  PKProtobufPaymentApplication *v3;
  void *v4;
  void *v5;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = objc_alloc_init(PKProtobufPaymentApplication);
  -[PKPaymentApplication dpanIdentifier](self, "dpanIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentApplication setDpanIdentifier:](v3, "setDpanIdentifier:", v4);

  -[PKPaymentApplication dpanSuffix](self, "dpanSuffix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentApplication setDpanSuffix:](v3, "setDpanSuffix:", v5);

  -[PKPaymentApplication sanitizedDPAN](self, "sanitizedDPAN");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentApplication setSanitizedDpan:](v3, "setSanitizedDpan:", v6);

  -[PKPaymentApplication applicationIdentifier](self, "applicationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentApplication setApplicationIdentifier:](v3, "setApplicationIdentifier:", v7);

  -[PKPaymentApplication secureElementIdentifier](self, "secureElementIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentApplication setSecureElementIdenfitier:](v3, "setSecureElementIdenfitier:", v8);

  -[PKProtobufPaymentApplication setState:](v3, "setState:", -[PKPaymentApplication state](self, "state"));
  -[PKPaymentApplication suspendedReason](self, "suspendedReason");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentApplication setSuspendedReason:](v3, "setSuspendedReason:", v9);

  -[PKProtobufPaymentApplication setSupportsContactlessPayment:](v3, "setSupportsContactlessPayment:", -[PKPaymentApplication supportsContactlessPayment](self, "supportsContactlessPayment"));
  -[PKProtobufPaymentApplication setSupportsInAppPayment:](v3, "setSupportsInAppPayment:", -[PKPaymentApplication supportsInAppPayment](self, "supportsInAppPayment"));
  -[PKProtobufPaymentApplication setPaymentNetworkIdentifier:](v3, "setPaymentNetworkIdentifier:", -[PKPaymentApplication paymentNetworkIdentifier](self, "paymentNetworkIdentifier"));
  -[PKProtobufPaymentApplication setInAppPINRequired:](v3, "setInAppPINRequired:", -[PKPaymentApplication inAppPINRequired](self, "inAppPINRequired"));
  -[PKPaymentApplication inAppPINRequiredAmount](self, "inAppPINRequiredAmount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentApplication setInAppPINRequiredAmount:](v3, "setInAppPINRequiredAmount:", PKCurrencyDecimalToLegacyStorageInteger(v10, 0));

  -[PKPaymentApplication inAppPINRequiredAmount](self, "inAppPINRequiredAmount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  DecimalToCustomPrecisionProtobuf(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentApplication setCustomPrecisionInAppPINRequiredAmount:](v3, "setCustomPrecisionInAppPINRequiredAmount:", v12);

  -[PKPaymentApplication inAppPINRequiredAmount](self, "inAppPINRequiredAmount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PKProtoSupportProtoDecimalNumberFromDecimalNumber(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentApplication setBalanceInAppPINRequiredAmount:](v3, "setBalanceInAppPINRequiredAmount:", v14);

  -[PKPaymentApplication inAppPINRequiredCurrency](self, "inAppPINRequiredCurrency");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentApplication setInAppPINRequiredCurrency:](v3, "setInAppPINRequiredCurrency:", v15);

  -[PKPaymentApplication displayName](self, "displayName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentApplication setDisplayName:](v3, "setDisplayName:", v16);

  -[PKProtobufPaymentApplication setAuxiliary:](v3, "setAuxiliary:", -[PKPaymentApplication isAuxiliary](self, "isAuxiliary"));
  -[PKProtobufPaymentApplication setPaymentType:](v3, "setPaymentType:", -[PKPaymentApplication paymentType](self, "paymentType"));
  -[PKProtobufPaymentApplication setAuxiliaryPaymentType:](v3, "setAuxiliaryPaymentType:", -[PKPaymentApplication auxiliaryPaymentType](self, "auxiliaryPaymentType"));
  -[PKProtobufPaymentApplication setInAppPriority:](v3, "setInAppPriority:", -[PKPaymentApplication inAppPriority](self, "inAppPriority"));
  -[PKPaymentApplication apanIdentifier](self, "apanIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentApplication setApanIdentifier:](v3, "setApanIdentifier:", v17);

  -[PKPaymentApplication apanSuffix](self, "apanSuffix");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentApplication setApanSuffix:](v3, "setApanSuffix:", v18);

  -[PKProtobufPaymentApplication setSupportsMerchantTokens:](v3, "setSupportsMerchantTokens:", -[PKPaymentApplication supportsMerchantTokens](self, "supportsMerchantTokens"));
  -[PKProtobufPaymentApplication setSupportsInstantFundsIn:](v3, "setSupportsInstantFundsIn:", -[PKPaymentApplication supportsInstantFundsIn](self, "supportsInstantFundsIn"));
  -[PKPaymentApplication supportsMultiTokens](self, "supportsMultiTokens");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[PKPaymentApplication supportsMultiTokens](self, "supportsMultiTokens");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKProtobufPaymentApplication setSupportsMultiTokensV2:](v3, "setSupportsMultiTokensV2:", objc_msgSend(v20, "BOOLValue"));

  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentApplication *v4;
  PKPaymentApplication *v5;
  BOOL v6;

  v4 = (PKPaymentApplication *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPaymentApplication isEqualToPaymentApplication:](self, "isEqualToPaymentApplication:", v5);

  return v6;
}

- (BOOL)isEqualToPaymentApplication:(id)a3
{
  _QWORD *v4;
  NSString *applicationIdentifier;
  NSString *v6;
  BOOL v7;
  NSString *secureElementIdentifier;
  NSString *v9;
  NSString *dpanIdentifier;
  NSString *v11;
  NSString *dpanSuffix;
  NSString *v13;
  NSString *sanitizedDPAN;
  NSString *v15;
  NSString *suspendedReason;
  NSString *v17;
  NSDecimalNumber *inAppPINRequiredAmount;
  NSDecimalNumber *v19;
  NSString *inAppPINRequiredCurrency;
  NSString *v21;
  NSString *displayName;
  NSString *v23;
  NSString *apanIdentifier;
  NSString *v25;
  NSString *apanSuffix;
  NSString *v27;
  NSString *virtualCardIdentifier;
  NSString *v29;
  NSString *virtualCardSuffix;
  NSString *v31;
  NSNumber *supportsVirtualCardNumber;
  NSNumber *v33;
  NSNumber *virtualCardRefreshTypeNumber;
  NSNumber *v35;
  NSNumber *supportsMultiTokens;
  NSNumber *v37;
  NSArray *supportedExpressModes;
  NSArray *v39;
  NSArray *automaticSelectionCriteria;
  NSArray *v41;
  PKTransitPassProperties *transitProperties;
  PKTransitPassProperties *v43;
  NSString *appletDataFormat;
  NSString *v45;
  NSSet *subcredentials;
  NSSet *v47;
  NSArray *supportedInAppMerchantCountryCodes;
  NSArray *v49;
  NSArray *unsupportedInAppMerchantCountryCodes;
  NSArray *v51;
  NSArray *supportedTransitNetworkIdentifiers;
  NSArray *v53;
  NSString *transactionSourceIdentifier;
  NSString *v55;
  BOOL v56;

  v4 = a3;
  applicationIdentifier = self->_applicationIdentifier;
  v6 = (NSString *)v4[6];
  if (applicationIdentifier)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (applicationIdentifier != v6)
      goto LABEL_149;
  }
  else if ((-[NSString isEqual:](applicationIdentifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_149;
  }
  secureElementIdentifier = self->_secureElementIdentifier;
  v9 = (NSString *)v4[7];
  if (secureElementIdentifier && v9)
  {
    if ((-[NSString isEqual:](secureElementIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_149;
  }
  else if (secureElementIdentifier != v9)
  {
    goto LABEL_149;
  }
  dpanIdentifier = self->_dpanIdentifier;
  v11 = (NSString *)v4[3];
  if (dpanIdentifier && v11)
  {
    if ((-[NSString isEqual:](dpanIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_149;
  }
  else if (dpanIdentifier != v11)
  {
    goto LABEL_149;
  }
  dpanSuffix = self->_dpanSuffix;
  v13 = (NSString *)v4[4];
  if (dpanSuffix && v13)
  {
    if ((-[NSString isEqual:](dpanSuffix, "isEqual:") & 1) == 0)
      goto LABEL_149;
  }
  else if (dpanSuffix != v13)
  {
    goto LABEL_149;
  }
  sanitizedDPAN = self->_sanitizedDPAN;
  v15 = (NSString *)v4[5];
  if (sanitizedDPAN && v15)
  {
    if ((-[NSString isEqual:](sanitizedDPAN, "isEqual:") & 1) == 0)
      goto LABEL_149;
  }
  else if (sanitizedDPAN != v15)
  {
    goto LABEL_149;
  }
  suspendedReason = self->_suspendedReason;
  v17 = (NSString *)v4[9];
  if (suspendedReason && v17)
  {
    if ((-[NSString isEqual:](suspendedReason, "isEqual:") & 1) == 0)
      goto LABEL_149;
  }
  else if (suspendedReason != v17)
  {
    goto LABEL_149;
  }
  inAppPINRequiredAmount = self->_inAppPINRequiredAmount;
  v19 = (NSDecimalNumber *)v4[22];
  if (inAppPINRequiredAmount && v19)
  {
    if ((-[NSDecimalNumber isEqual:](inAppPINRequiredAmount, "isEqual:") & 1) == 0)
      goto LABEL_149;
  }
  else if (inAppPINRequiredAmount != v19)
  {
    goto LABEL_149;
  }
  inAppPINRequiredCurrency = self->_inAppPINRequiredCurrency;
  v21 = (NSString *)v4[23];
  if (inAppPINRequiredCurrency && v21)
  {
    if ((-[NSString isEqual:](inAppPINRequiredCurrency, "isEqual:") & 1) == 0)
      goto LABEL_149;
  }
  else if (inAppPINRequiredCurrency != v21)
  {
    goto LABEL_149;
  }
  displayName = self->_displayName;
  v23 = (NSString *)v4[26];
  if (displayName && v23)
  {
    if ((-[NSString isEqual:](displayName, "isEqual:") & 1) == 0)
      goto LABEL_149;
  }
  else if (displayName != v23)
  {
    goto LABEL_149;
  }
  if (self->_state != v4[8]
    || self->_supportsContactlessPayment != *((unsigned __int8 *)v4 + 9)
    || self->_supportsInAppPayment != *((unsigned __int8 *)v4 + 10)
    || self->_supportsMerchantTokens != *((unsigned __int8 *)v4 + 11)
    || self->_hasMerchantTokens != *((unsigned __int8 *)v4 + 12)
    || self->_hadMerchantTokens != *((unsigned __int8 *)v4 + 13))
  {
    goto LABEL_149;
  }
  apanIdentifier = self->_apanIdentifier;
  v25 = (NSString *)v4[10];
  if (apanIdentifier && v25)
  {
    if ((-[NSString isEqual:](apanIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_149;
  }
  else if (apanIdentifier != v25)
  {
    goto LABEL_149;
  }
  apanSuffix = self->_apanSuffix;
  v27 = (NSString *)v4[11];
  if (apanSuffix && v27)
  {
    if ((-[NSString isEqual:](apanSuffix, "isEqual:") & 1) == 0)
      goto LABEL_149;
  }
  else if (apanSuffix != v27)
  {
    goto LABEL_149;
  }
  virtualCardIdentifier = self->_virtualCardIdentifier;
  v29 = (NSString *)v4[12];
  if (virtualCardIdentifier && v29)
  {
    if ((-[NSString isEqual:](virtualCardIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_149;
  }
  else if (virtualCardIdentifier != v29)
  {
    goto LABEL_149;
  }
  virtualCardSuffix = self->_virtualCardSuffix;
  v31 = (NSString *)v4[13];
  if (virtualCardSuffix && v31)
  {
    if ((-[NSString isEqual:](virtualCardSuffix, "isEqual:") & 1) == 0)
      goto LABEL_149;
  }
  else if (virtualCardSuffix != v31)
  {
    goto LABEL_149;
  }
  supportsVirtualCardNumber = self->_supportsVirtualCardNumber;
  v33 = (NSNumber *)v4[14];
  if (supportsVirtualCardNumber && v33)
  {
    if ((-[NSNumber isEqual:](supportsVirtualCardNumber, "isEqual:") & 1) == 0)
      goto LABEL_149;
  }
  else if (supportsVirtualCardNumber != v33)
  {
    goto LABEL_149;
  }
  if (self->_virtualCardVPANOrigin != v4[15])
    goto LABEL_149;
  virtualCardRefreshTypeNumber = self->_virtualCardRefreshTypeNumber;
  v35 = (NSNumber *)v4[16];
  if (virtualCardRefreshTypeNumber && v35)
  {
    if ((-[NSNumber isEqual:](virtualCardRefreshTypeNumber, "isEqual:") & 1) == 0)
      goto LABEL_149;
  }
  else if (virtualCardRefreshTypeNumber != v35)
  {
    goto LABEL_149;
  }
  supportsMultiTokens = self->_supportsMultiTokens;
  v37 = (NSNumber *)v4[17];
  if (supportsMultiTokens && v37)
  {
    if ((-[NSNumber isEqual:](supportsMultiTokens, "isEqual:") & 1) == 0)
      goto LABEL_149;
  }
  else if (supportsMultiTokens != v37)
  {
    goto LABEL_149;
  }
  if (self->_supportsBarcodePayment != *((unsigned __int8 *)v4 + 14)
    || self->_supportsOptionalAuthentication == (*((_BYTE *)v4 + 15) == 0)
    || self->_requiresDeferredAuthorization == (*((_BYTE *)v4 + 17) == 0))
  {
    goto LABEL_149;
  }
  supportedExpressModes = self->_supportedExpressModes;
  v39 = (NSArray *)v4[18];
  if (supportedExpressModes && v39)
  {
    if ((-[NSArray isEqual:](supportedExpressModes, "isEqual:") & 1) == 0)
      goto LABEL_149;
  }
  else if (supportedExpressModes != v39)
  {
    goto LABEL_149;
  }
  automaticSelectionCriteria = self->_automaticSelectionCriteria;
  v41 = (NSArray *)v4[19];
  if (automaticSelectionCriteria && v41)
  {
    if ((-[NSArray isEqual:](automaticSelectionCriteria, "isEqual:") & 1) == 0)
      goto LABEL_149;
  }
  else if (automaticSelectionCriteria != v41)
  {
    goto LABEL_149;
  }
  transitProperties = self->_transitProperties;
  v43 = (PKTransitPassProperties *)v4[32];
  if (transitProperties && v43)
  {
    if (!-[PKStoredValuePassProperties isEqual:](transitProperties, "isEqual:"))
      goto LABEL_149;
  }
  else if (transitProperties != v43)
  {
    goto LABEL_149;
  }
  if (self->_paymentNetworkIdentifier != v4[21]
    || self->_auxiliary != *((unsigned __int8 *)v4 + 19)
    || self->_paymentType != v4[24]
    || self->_auxiliaryPaymentType != v4[25]
    || self->_contactlessPriority != v4[27]
    || self->_inAppPriority != v4[28]
    || self->_supportsInstantFundsIn != *((unsigned __int8 *)v4 + 20)
    || self->_fundingSourcePaymentType != v4[29]
    || self->_requiresConsentForDataRelease != *((unsigned __int8 *)v4 + 21)
    || self->_supportsServiceMode != *((unsigned __int8 *)v4 + 16))
  {
    goto LABEL_149;
  }
  appletDataFormat = self->_appletDataFormat;
  v45 = (NSString *)v4[31];
  if (appletDataFormat && v45)
  {
    if ((-[NSString isEqual:](appletDataFormat, "isEqual:") & 1) == 0)
      goto LABEL_149;
  }
  else if (appletDataFormat != v45)
  {
    goto LABEL_149;
  }
  subcredentials = self->_subcredentials;
  v47 = (NSSet *)v4[37];
  if (subcredentials && v47)
  {
    if ((-[NSSet isEqual:](subcredentials, "isEqual:") & 1) == 0)
      goto LABEL_149;
  }
  else if (subcredentials != v47)
  {
    goto LABEL_149;
  }
  supportedInAppMerchantCountryCodes = self->_supportedInAppMerchantCountryCodes;
  v49 = (NSArray *)v4[33];
  if (supportedInAppMerchantCountryCodes && v49)
  {
    if ((-[NSArray isEqual:](supportedInAppMerchantCountryCodes, "isEqual:") & 1) == 0)
      goto LABEL_149;
  }
  else if (supportedInAppMerchantCountryCodes != v49)
  {
    goto LABEL_149;
  }
  unsupportedInAppMerchantCountryCodes = self->_unsupportedInAppMerchantCountryCodes;
  v51 = (NSArray *)v4[34];
  if (unsupportedInAppMerchantCountryCodes && v51)
  {
    if ((-[NSArray isEqual:](unsupportedInAppMerchantCountryCodes, "isEqual:") & 1) == 0)
      goto LABEL_149;
  }
  else if (unsupportedInAppMerchantCountryCodes != v51)
  {
    goto LABEL_149;
  }
  supportedTransitNetworkIdentifiers = self->_supportedTransitNetworkIdentifiers;
  v53 = (NSArray *)v4[35];
  if (supportedTransitNetworkIdentifiers && v53)
  {
    if ((-[NSArray isEqual:](supportedTransitNetworkIdentifiers, "isEqual:") & 1) == 0)
      goto LABEL_149;
  }
  else if (supportedTransitNetworkIdentifiers != v53)
  {
    goto LABEL_149;
  }
  transactionSourceIdentifier = self->_transactionSourceIdentifier;
  v55 = (NSString *)v4[30];
  if (!transactionSourceIdentifier || !v55)
  {
    if (transactionSourceIdentifier == v55)
      goto LABEL_147;
LABEL_149:
    v56 = 0;
    goto LABEL_150;
  }
  if ((-[NSString isEqual:](transactionSourceIdentifier, "isEqual:") & 1) == 0)
    goto LABEL_149;
LABEL_147:
  v56 = self->_shareable == *((unsigned __int8 *)v4 + 22);
LABEL_150:

  return v56;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPaymentApplication *v5;
  uint64_t v6;
  NSString *applicationIdentifier;
  uint64_t v8;
  NSString *secureElementIdentifier;
  uint64_t v10;
  NSString *dpanIdentifier;
  uint64_t v12;
  NSString *dpanSuffix;
  uint64_t v14;
  NSString *sanitizedDPAN;
  uint64_t v16;
  NSDecimalNumber *inAppPINRequiredAmount;
  uint64_t v18;
  NSString *inAppPINRequiredCurrency;
  uint64_t v20;
  NSString *displayName;
  uint64_t v22;
  NSString *suspendedReason;
  uint64_t v24;
  NSString *transactionSourceIdentifier;
  uint64_t v26;
  NSString *apanIdentifier;
  uint64_t v28;
  NSString *apanSuffix;
  uint64_t v30;
  NSString *virtualCardIdentifier;
  uint64_t v32;
  NSString *virtualCardSuffix;
  uint64_t v34;
  NSNumber *supportsVirtualCardNumber;
  uint64_t v36;
  NSNumber *virtualCardRefreshTypeNumber;
  uint64_t v38;
  NSNumber *supportsMultiTokens;
  uint64_t v40;
  NSArray *supportedExpressModes;
  uint64_t v42;
  NSArray *automaticSelectionCriteria;
  uint64_t v44;
  NSString *appletDataFormat;
  uint64_t v46;
  NSString *appletCurrencyCode;
  PKTransitPassProperties *v48;
  PKTransitPassProperties *transitProperties;
  uint64_t v50;
  NSArray *supportedInAppMerchantCountryCodes;
  uint64_t v52;
  NSArray *unsupportedInAppMerchantCountryCodes;
  uint64_t v54;
  NSArray *supportedTransitNetworkIdentifiers;
  uint64_t v56;
  NSSet *subcredentials;

  v5 = -[PKPaymentApplication init](+[PKPaymentApplication allocWithZone:](PKPaymentApplication, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_applicationIdentifier, "copyWithZone:", a3);
  applicationIdentifier = v5->_applicationIdentifier;
  v5->_applicationIdentifier = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_secureElementIdentifier, "copyWithZone:", a3);
  secureElementIdentifier = v5->_secureElementIdentifier;
  v5->_secureElementIdentifier = (NSString *)v8;

  v10 = -[NSString copyWithZone:](self->_dpanIdentifier, "copyWithZone:", a3);
  dpanIdentifier = v5->_dpanIdentifier;
  v5->_dpanIdentifier = (NSString *)v10;

  v12 = -[NSString copyWithZone:](self->_dpanSuffix, "copyWithZone:", a3);
  dpanSuffix = v5->_dpanSuffix;
  v5->_dpanSuffix = (NSString *)v12;

  v14 = -[NSString copyWithZone:](self->_sanitizedDPAN, "copyWithZone:", a3);
  sanitizedDPAN = v5->_sanitizedDPAN;
  v5->_sanitizedDPAN = (NSString *)v14;

  v16 = -[NSDecimalNumber copyWithZone:](self->_inAppPINRequiredAmount, "copyWithZone:", a3);
  inAppPINRequiredAmount = v5->_inAppPINRequiredAmount;
  v5->_inAppPINRequiredAmount = (NSDecimalNumber *)v16;

  v18 = -[NSString copyWithZone:](self->_inAppPINRequiredCurrency, "copyWithZone:", a3);
  inAppPINRequiredCurrency = v5->_inAppPINRequiredCurrency;
  v5->_inAppPINRequiredCurrency = (NSString *)v18;

  v20 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  displayName = v5->_displayName;
  v5->_displayName = (NSString *)v20;

  v5->_state = self->_state;
  v22 = -[NSString copyWithZone:](self->_suspendedReason, "copyWithZone:", a3);
  suspendedReason = v5->_suspendedReason;
  v5->_suspendedReason = (NSString *)v22;

  v24 = -[NSString copyWithZone:](self->_transactionSourceIdentifier, "copyWithZone:", a3);
  transactionSourceIdentifier = v5->_transactionSourceIdentifier;
  v5->_transactionSourceIdentifier = (NSString *)v24;

  v5->_supportsContactlessPayment = self->_supportsContactlessPayment;
  v5->_supportsInAppPayment = self->_supportsInAppPayment;
  v5->_supportsMerchantTokens = self->_supportsMerchantTokens;
  v5->_hasMerchantTokens = self->_hasMerchantTokens;
  v5->_hadMerchantTokens = self->_hadMerchantTokens;
  v26 = -[NSString copyWithZone:](self->_apanIdentifier, "copyWithZone:", a3);
  apanIdentifier = v5->_apanIdentifier;
  v5->_apanIdentifier = (NSString *)v26;

  v28 = -[NSString copyWithZone:](self->_apanSuffix, "copyWithZone:", a3);
  apanSuffix = v5->_apanSuffix;
  v5->_apanSuffix = (NSString *)v28;

  v30 = -[NSString copyWithZone:](self->_virtualCardIdentifier, "copyWithZone:", a3);
  virtualCardIdentifier = v5->_virtualCardIdentifier;
  v5->_virtualCardIdentifier = (NSString *)v30;

  v32 = -[NSString copyWithZone:](self->_virtualCardSuffix, "copyWithZone:", a3);
  virtualCardSuffix = v5->_virtualCardSuffix;
  v5->_virtualCardSuffix = (NSString *)v32;

  v34 = -[NSNumber copyWithZone:](self->_supportsVirtualCardNumber, "copyWithZone:", a3);
  supportsVirtualCardNumber = v5->_supportsVirtualCardNumber;
  v5->_supportsVirtualCardNumber = (NSNumber *)v34;

  v5->_virtualCardVPANOrigin = self->_virtualCardVPANOrigin;
  v36 = -[NSNumber copyWithZone:](self->_virtualCardRefreshTypeNumber, "copyWithZone:", a3);
  virtualCardRefreshTypeNumber = v5->_virtualCardRefreshTypeNumber;
  v5->_virtualCardRefreshTypeNumber = (NSNumber *)v36;

  v38 = -[NSNumber copyWithZone:](self->_supportsMultiTokens, "copyWithZone:", a3);
  supportsMultiTokens = v5->_supportsMultiTokens;
  v5->_supportsMultiTokens = (NSNumber *)v38;

  v5->_supportsBarcodePayment = self->_supportsBarcodePayment;
  v5->_supportsOptionalAuthentication = self->_supportsOptionalAuthentication;
  v5->_supportsServiceMode = self->_supportsServiceMode;
  v40 = -[NSArray copyWithZone:](self->_supportedExpressModes, "copyWithZone:", a3);
  supportedExpressModes = v5->_supportedExpressModes;
  v5->_supportedExpressModes = (NSArray *)v40;

  v42 = -[NSArray copyWithZone:](self->_automaticSelectionCriteria, "copyWithZone:", a3);
  automaticSelectionCriteria = v5->_automaticSelectionCriteria;
  v5->_automaticSelectionCriteria = (NSArray *)v42;

  v44 = -[NSString copyWithZone:](self->_appletDataFormat, "copyWithZone:", a3);
  appletDataFormat = v5->_appletDataFormat;
  v5->_appletDataFormat = (NSString *)v44;

  v46 = -[NSString copyWithZone:](self->_appletCurrencyCode, "copyWithZone:", a3);
  appletCurrencyCode = v5->_appletCurrencyCode;
  v5->_appletCurrencyCode = (NSString *)v46;

  v5->_requiresDeferredAuthorization = self->_requiresDeferredAuthorization;
  v48 = -[PKStoredValuePassProperties copyWithZone:](self->_transitProperties, "copyWithZone:", a3);
  transitProperties = v5->_transitProperties;
  v5->_transitProperties = v48;

  v5->_paymentNetworkIdentifier = self->_paymentNetworkIdentifier;
  v5->_auxiliary = self->_auxiliary;
  v5->_paymentType = self->_paymentType;
  v5->_auxiliaryPaymentType = self->_auxiliaryPaymentType;
  v5->_contactlessPriority = self->_contactlessPriority;
  v5->_inAppPriority = self->_inAppPriority;
  v5->_supportsInstantFundsIn = self->_supportsInstantFundsIn;
  v5->_fundingSourcePaymentType = self->_fundingSourcePaymentType;
  v5->_requiresConsentForDataRelease = self->_requiresConsentForDataRelease;
  v50 = -[NSArray copyWithZone:](self->_supportedInAppMerchantCountryCodes, "copyWithZone:", a3);
  supportedInAppMerchantCountryCodes = v5->_supportedInAppMerchantCountryCodes;
  v5->_supportedInAppMerchantCountryCodes = (NSArray *)v50;

  v52 = -[NSArray copyWithZone:](self->_unsupportedInAppMerchantCountryCodes, "copyWithZone:", a3);
  unsupportedInAppMerchantCountryCodes = v5->_unsupportedInAppMerchantCountryCodes;
  v5->_unsupportedInAppMerchantCountryCodes = (NSArray *)v52;

  v54 = -[NSArray copyWithZone:](self->_supportedTransitNetworkIdentifiers, "copyWithZone:", a3);
  supportedTransitNetworkIdentifiers = v5->_supportedTransitNetworkIdentifiers;
  v5->_supportedTransitNetworkIdentifiers = (NSArray *)v54;

  v56 = -[NSSet copyWithZone:](self->_subcredentials, "copyWithZone:", a3);
  subcredentials = v5->_subcredentials;
  v5->_subcredentials = (NSSet *)v56;

  v5->_shareable = self->_shareable;
  return v5;
}

- (BOOL)inAppPINRequired
{
  return self->_inAppPINRequiredAmount && self->_inAppPINRequiredCurrency != 0;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = objc_opt_class();
  -[PKPaymentApplication secureElementIdentifier](self, "secureElementIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentApplication applicationIdentifier](self, "applicationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentApplication displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentApplication dpanIdentifier](self, "dpanIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PKPaymentApplication state](self, "state");
  -[PKPaymentApplication stateAsString](self, "stateAsString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; SEID: %@; Application Identifier: %@; Display Name: %@; DPAN Identifier: %@; State: %d (%@)"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PKPaymentApplication inAppPINRequired](self, "inAppPINRequired"))
  {
    -[PKPaymentApplication inAppPINRequiredAmount](self, "inAppPINRequiredAmount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentApplication inAppPINRequiredCurrency](self, "inAppPINRequiredCurrency");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendFormat:", CFSTR("; InAppPINRequiredAmount: %@; InAppPINRequiredCurrency: %@"), v12, v13);

  }
  objc_msgSend(v11, "appendFormat:", CFSTR(">"));
  v14 = (void *)objc_msgSend(v11, "copy");

  return v14;
}

- (NSString)stateAsString
{
  __CFString *v3;
  void *v4;
  void *v5;

  v3 = CFSTR("Personalized");
  switch(-[PKPaymentApplication state](self, "state"))
  {
    case 1:
      return (NSString *)v3;
    case 2:
      v3 = CFSTR("Personalizing");
      break;
    case 3:
    case 4:
      v3 = CFSTR("Requires Verification");
      break;
    case 5:
      v3 = CFSTR("Verification Terminated");
      break;
    case 6:
      v3 = CFSTR("Suspended - Issuer");
      break;
    case 7:
      v3 = CFSTR("Suspended - Lost Mode");
      break;
    case 8:
      v3 = CFSTR("Suspended - No Passcode");
      break;
    case 9:
      v4 = (void *)MEMORY[0x1E0CB3940];
      -[PKPaymentApplication suspendedReason](self, "suspendedReason");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("Suspended - Custom '%@'"), v5);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    case 10:
      v3 = CFSTR("Removed by Issuer");
      break;
    case 15:
      v3 = CFSTR("In Termination");
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown: %lu"), -[PKPaymentApplication state](self, "state"));
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return (NSString *)v3;
}

- (BOOL)supportsWebPaymentMode:(int64_t)a3 withExclusionList:(id)a4
{
  return -[PKPaymentApplication supportsWebPaymentMode:withExclusionList:clientOSVersion:](self, "supportsWebPaymentMode:withExclusionList:clientOSVersion:", a3, a4, 0);
}

- (BOOL)supportsWebPaymentMode:(int64_t)a3 withExclusionList:(id)a4 clientOSVersion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  _BOOL4 v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  PKPaymentApplication *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  int v29;
  const __CFString *v30;
  void *v31;
  int v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  uint64_t v36;
  void *v37;
  BOOL v38;
  NSObject *v39;
  __int128 v41;
  id v42;
  int64_t v43;
  _BOOL4 v44;
  uint64_t v45;
  id obj;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
  if (!v10)
  {
    v38 = 1;
    goto LABEL_49;
  }
  v12 = v10;
  v42 = v9;
  v43 = a3;
  v14 = a3 == 2 && v9 != 0;
  v44 = v14;
  v15 = *(_QWORD *)v48;
  v16 = 0x1E0CB3000uLL;
  *(_QWORD *)&v11 = 138412546;
  v41 = v11;
  while (2)
  {
    v17 = 0;
    v45 = v12;
    do
    {
      if (*(_QWORD *)v48 != v15)
        objc_enumerationMutation(obj);
      v18 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v17);
      objc_msgSend(v18, "PKArrayForKey:", CFSTR("PaymentNetworks"), v41);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v16 + 2024), "numberWithInteger:", self->_paymentNetworkIdentifier);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "containsObject:", v20);

      if (!v21)
        goto LABEL_40;
      v22 = self;
      objc_msgSend(v18, "PKDictionaryForKey:", CFSTR("OSVersion"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      PKOSVersion();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v23)
        goto LABEL_20;
      objc_msgSend(v23, "PKStringForKey:", CFSTR("iOS"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v25, "length") || objc_msgSend(v24, "compare:options:", v25, 64) == -1)
      {

LABEL_20:
        if (v43 == 1)
        {
          objc_msgSend(v18, "PKArrayForKey:", CFSTR("LocalDeviceClasses"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            PKDeviceClass();
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v27, "containsObject:", v28);

          }
          else
          {
            v29 = 1;
          }

          v30 = CFSTR("local");
        }
        else
        {
          v29 = 1;
          v30 = CFSTR("remote");
        }
        objc_msgSend(v18, "PKArrayForKey:", CFSTR("PaymentModes"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v31;
        if (v31)
          v32 = objc_msgSend(v31, "containsObject:", v30);
        else
          v32 = 1;
        if ((v29 & v32 & 1) != 0)
          goto LABEL_47;
        goto LABEL_30;
      }
      PKLogFacilityTypeGetObject(6uLL);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v41;
        v52 = v24;
        v53 = 2112;
        v54 = v25;
        _os_log_impl(&dword_18FC92000, v26, OS_LOG_TYPE_DEFAULT, "Current version %@ is greater than or equal to the specified config version %@, skipping over", buf, 0x16u);
      }

LABEL_30:
      objc_msgSend(v18, "PKDictionaryForKey:", CFSTR("HandoffMinOSVersion"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v33;
      if (v33)
        v34 = v44;
      else
        v34 = 0;
      if (v34)
      {
        objc_msgSend(v33, "PKStringForKey:", CFSTR("Mac"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "PKStringForKey:", CFSTR("iOS"));
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = (void *)v36;
        if (v35
          && v36
          && (objc_msgSend(v35, "compare:options:", v42, 64) == 1
           || objc_msgSend(v37, "compare:options:", v24, 64) == 1))
        {
          PKLogFacilityTypeGetObject(6uLL);
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138413058;
            v52 = v42;
            v53 = 2112;
            v54 = v24;
            v55 = 2112;
            v56 = v35;
            v57 = 2112;
            v58 = v37;
            _os_log_impl(&dword_18FC92000, v39, OS_LOG_TYPE_DEFAULT, "Client version %@ or host version %@ is lower than minimum supported client version %@ or host version %@", buf, 0x2Au);
          }

LABEL_47:
          v38 = 0;
          goto LABEL_48;
        }

      }
      self = v22;
      v12 = v45;
      v16 = 0x1E0CB3000;
LABEL_40:

      ++v17;
    }
    while (v12 != v17);
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
    if (v12)
      continue;
    break;
  }
  v38 = 1;
LABEL_48:
  v9 = v42;
LABEL_49:

  return v38;
}

- (BOOL)supportsExpressForAutomaticSelectionCriteriaPassingTest:(id)a3
{
  uint64_t (**v4)(id, void *);
  unint64_t state;
  BOOL v6;
  uint64_t v7;
  BOOL v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(id, void *))a3;
  state = self->_state;
  v6 = state > 0xF;
  v7 = (1 << state) & 0x83DE;
  v8 = v6 || v7 == 0;
  if (v8 || !self->_supportsOptionalAuthentication)
  {
    LOBYTE(v10) = 0;
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = self->_automaticSelectionCriteria;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v13, "supportsExpress", (_QWORD)v15) && (!v4 || (v4[2](v4, v13) & 1) != 0))
          {
            LOBYTE(v10) = 1;
            goto LABEL_19;
          }
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_19:

  }
  return v10;
}

- (BOOL)supportsExpressForAutomaticSelectionTechnologyType:(int64_t)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__PKPaymentApplication_supportsExpressForAutomaticSelectionTechnologyType___block_invoke;
  v4[3] = &__block_descriptor_40_e43_B16__0__PKPassAutomaticSelectionCriterion_8l;
  v4[4] = a3;
  return -[PKPaymentApplication supportsExpressForAutomaticSelectionCriteriaPassingTest:](self, "supportsExpressForAutomaticSelectionCriteriaPassingTest:", v4);
}

BOOL __75__PKPaymentApplication_supportsExpressForAutomaticSelectionTechnologyType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "technologyType") == *(_QWORD *)(a1 + 32);
}

- (BOOL)supportsExpressMode:(id)a3
{
  id v4;
  void *v5;
  unint64_t state;
  BOOL v7;
  uint64_t v8;
  BOOL v9;
  BOOL v10;
  NSArray *supportedExpressModes;

  v4 = a3;
  v5 = v4;
  state = self->_state;
  v7 = state > 0xF;
  v8 = (1 << state) & 0x83DE;
  v9 = v7 || v8 == 0;
  if (v9 || !self->_supportsOptionalAuthentication)
  {
    v10 = 0;
  }
  else
  {
    v10 = 0;
    if (v4)
    {
      supportedExpressModes = self->_supportedExpressModes;
      if (supportedExpressModes)
        v10 = -[NSArray indexOfObject:](supportedExpressModes, "indexOfObject:", v5) != 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return v10;
}

- (BOOL)supportsAutomaticSelectionForTCI:(id)a3
{
  id v4;
  NSArray *v5;
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
  v4 = a3;
  if (v4)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = self->_automaticSelectionCriteria;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v10, "primaryTCIs", (_QWORD)v16);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "containsObject:", v4))
          {

LABEL_15:
            v14 = 1;
            goto LABEL_16;
          }
          objc_msgSend(v10, "TCIs");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "containsObject:", v4);

          if ((v13 & 1) != 0)
            goto LABEL_15;
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        v14 = 0;
        if (v7)
          continue;
        break;
      }
    }
    else
    {
      v14 = 0;
    }
LABEL_16:

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)supportsComboCard
{
  unint64_t auxiliaryPaymentType;

  auxiliaryPaymentType = self->_auxiliaryPaymentType;
  return auxiliaryPaymentType && auxiliaryPaymentType != self->_paymentType;
}

- (id)paymentApplicationsIncludingAuxiliaryPaymentTypes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[PKPaymentApplication supportsComboCard](self, "supportsComboCard"))
  {
    v3 = (void *)-[PKPaymentApplication copy](self, "copy");
    PKDisplayablePaymentMethodStringFromType(self->_paymentType);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDisplayName:", v4);

    v5 = (void *)-[PKPaymentApplication copy](self, "copy");
    objc_msgSend(v5, "setPaymentType:", self->_auxiliaryPaymentType);
    PKDisplayablePaymentMethodStringFromType(self->_auxiliaryPaymentType);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDisplayName:", v6);

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v3, v5, 0);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)isRequiredForMerchantInCountry:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PKPaymentApplication supportedInAppMerchantCountryCodes](self, "supportedInAppMerchantCountryCodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (BOOL)supportsTransit
{
  __CFString *v3;
  BOOL v4;

  -[PKPaymentApplication appletDataFormat](self, "appletDataFormat");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v3 || !CFSTR("transit.felica.suica"))
  {
    if (CFSTR("transit.felica.suica") == v3)
      goto LABEL_4;
LABEL_6:
    v4 = -[PKPaymentApplication isParsedTransitApplication](self, "isParsedTransitApplication");
    goto LABEL_7;
  }
  if ((objc_msgSend(CFSTR("transit.felica.suica"), "isEqual:", v3) & 1) == 0)
    goto LABEL_6;
LABEL_4:
  v4 = 1;
LABEL_7:

  return v4;
}

- (PKFelicaPassProperties)felicaProperties
{
  return -[PKTransitPassProperties felicaProperties](self->_transitProperties, "felicaProperties");
}

- (void)setFelicaProperties:(id)a3
{
  PKTransitPassProperties *v4;
  PKTransitPassProperties *transitProperties;

  v4 = (PKTransitPassProperties *)objc_msgSend(a3, "copy");
  transitProperties = self->_transitProperties;
  self->_transitProperties = v4;

}

- (BOOL)supportsSuica
{
  __CFString *v2;
  char v3;

  -[PKPaymentApplication appletDataFormat](self, "appletDataFormat");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v2 && CFSTR("transit.felica.suica"))
    v3 = objc_msgSend(CFSTR("transit.felica.suica"), "isEqual:", v2);
  else
    v3 = CFSTR("transit.felica.suica") == v2;

  return v3;
}

- (BOOL)isParsedTransitApplication
{
  void *v2;
  char v3;

  -[PKPaymentApplication appletDataFormat](self, "appletDataFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("transit.apple"));

  return v3;
}

- (BOOL)generatesLocalTransactions
{
  return -[PKPaymentApplication supportsSuica](self, "supportsSuica")
      || -[PKPaymentApplication isParsedTransitApplication](self, "isParsedTransitApplication");
}

- (BOOL)blockingSupportedUWBDueToHardware
{
  uint64_t v3;
  NSSet *v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[PKPaymentApplication supportsUWB](self, "supportsUWB"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v4 = self->_subcredentials;
    v3 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v5 = *(_QWORD *)v9;
      while (2)
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v4);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "allSupportedRadioTechnologies", (_QWORD)v8) & 2) != 0)
          {
            LOBYTE(v3) = 1;
            goto LABEL_13;
          }
        }
        v3 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v3)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v3;
}

- (BOOL)supportsUWB
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
  v2 = self->_subcredentials;
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
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "supportedRadioTechnologies", (_QWORD)v7) & 2) != 0)
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

- (unint64_t)supportedRadioTechnologies
{
  NSSet *v2;
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
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_subcredentials;
  v3 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
        v5 |= objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "supportedRadioTechnologies", (_QWORD)v9);
      }
      v4 = -[NSSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  if (v5 <= 1)
    return 1;
  else
    return v5;
}

- (NSString)stationCodeProvider
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;

  -[PKPaymentApplication appletDataFormat](self, "appletDataFormat");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v2 || !CFSTR("transit.felica.suica"))
  {
    if (CFSTR("transit.felica.suica") == v2)
      goto LABEL_4;
LABEL_6:
    v3 = 0;
    goto LABEL_7;
  }
  if ((objc_msgSend(CFSTR("transit.felica.suica"), "isEqual:", v2) & 1) == 0)
    goto LABEL_6;
LABEL_4:
  v3 = CFSTR("transit.felica.cjrc");
LABEL_7:
  if (!v2 || !CFSTR("transit.apple.bmac"))
  {
    if (CFSTR("transit.apple.bmac") != v2)
      goto LABEL_11;
    goto LABEL_10;
  }
  if ((objc_msgSend(CFSTR("transit.apple.bmac"), "isEqual:", v2) & 1) != 0)
  {
LABEL_10:
    v4 = CFSTR("transit.apple.bmac");

    v3 = v4;
  }
LABEL_11:
  if (!v2 || !CFSTR("transit.apple.sptcc"))
  {
    if (CFSTR("transit.apple.sptcc") != v2)
      goto LABEL_15;
    goto LABEL_14;
  }
  if ((objc_msgSend(CFSTR("transit.apple.sptcc"), "isEqual:", v2) & 1) != 0)
  {
LABEL_14:
    v5 = CFSTR("transit.apple.sptcc");

    v3 = v5;
  }
LABEL_15:
  if (!v2 || !CFSTR("transit.apple.mot"))
  {
    if (CFSTR("transit.apple.mot") != v2)
      goto LABEL_19;
    goto LABEL_18;
  }
  if ((objc_msgSend(CFSTR("transit.apple.mot"), "isEqual:", v2) & 1) != 0)
  {
LABEL_18:
    v6 = CFSTR("transit.apple.mot");

    v3 = v6;
  }
LABEL_19:
  if (!v2 || !CFSTR("transit.apple.mifare"))
  {
    if (CFSTR("transit.apple.mifare") != v2)
      goto LABEL_23;
    goto LABEL_22;
  }
  if ((objc_msgSend(CFSTR("transit.apple.mifare"), "isEqual:", v2) & 1) != 0)
  {
LABEL_22:
    v7 = CFSTR("transit.apple.mifare");

    v3 = v7;
  }
LABEL_23:
  if (!v2 || !CFSTR("transit.apple.tmoney"))
  {
    if (CFSTR("transit.apple.tmoney") != v2)
      goto LABEL_27;
    goto LABEL_26;
  }
  if ((objc_msgSend(CFSTR("transit.apple.tmoney"), "isEqual:", v2) & 1) != 0)
  {
LABEL_26:
    v8 = CFSTR("transit.apple.tmoney");

    v3 = v8;
  }
LABEL_27:
  if (!v2 || !CFSTR("transit.apple.calypso.navigo"))
  {
    if (CFSTR("transit.apple.calypso.navigo") != v2)
      goto LABEL_31;
    goto LABEL_30;
  }
  if ((objc_msgSend(CFSTR("transit.apple.calypso.navigo"), "isEqual:", v2) & 1) != 0)
  {
LABEL_30:
    v9 = CFSTR("com.apple.transit.navigo");

    v3 = v9;
  }
LABEL_31:

  return (NSString *)v3;
}

- (id)asDictionary
{
  id v3;
  void *v4;
  NSString *applicationIdentifier;
  NSString *secureElementIdentifier;
  NSString *dpanIdentifier;
  NSString *dpanSuffix;
  NSString *sanitizedDPAN;
  void *v10;
  NSString *suspendedReason;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *apanIdentifier;
  NSString *apanSuffix;
  NSNumber *supportsMultiTokens;
  void *v21;
  void *v22;
  void *v23;
  NSString *appletDataFormat;
  void *v25;
  NSString *appletCurrencyCode;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSString *displayName;
  NSDecimalNumber *inAppPINRequiredAmount;
  void *v33;
  NSString *inAppPINRequiredCurrency;
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

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  applicationIdentifier = self->_applicationIdentifier;
  if (applicationIdentifier)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", applicationIdentifier, CFSTR("applicationIdentifier"));
  secureElementIdentifier = self->_secureElementIdentifier;
  if (secureElementIdentifier)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", secureElementIdentifier, CFSTR("secureElementIdentifier"));
  dpanIdentifier = self->_dpanIdentifier;
  if (dpanIdentifier)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", dpanIdentifier, CFSTR("DPANIdentifier"));
  dpanSuffix = self->_dpanSuffix;
  if (dpanSuffix)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", dpanSuffix, CFSTR("DPANSuffix"));
  sanitizedDPAN = self->_sanitizedDPAN;
  if (sanitizedDPAN)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", sanitizedDPAN, CFSTR("sanitizedDPAN"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_state);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("state"));

  suspendedReason = self->_suspendedReason;
  if (suspendedReason)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", suspendedReason, CFSTR("suspendedReason"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsContactlessPayment);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("supportsContactlessPayment"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsInAppPayment);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("supportsInAppPayment"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsOptionalAuthentication);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("supportsOptionalAuthentication"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsMerchantTokens);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("supportsMerchantTokens"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasMerchantTokens);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("hasMerchantTokens"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hadMerchantTokens);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("hadMerchantTokens"));

  apanIdentifier = self->_apanIdentifier;
  if (apanIdentifier)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", apanIdentifier, CFSTR("APANIdentifier"));
  apanSuffix = self->_apanSuffix;
  if (apanSuffix)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", apanSuffix, CFSTR("APANSuffix"));
  supportsMultiTokens = self->_supportsMultiTokens;
  if (supportsMultiTokens)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", supportsMultiTokens, CFSTR("supportsMultiTokens"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_virtualCardIdentifier, CFSTR("VPANIdentifier"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_virtualCardSuffix, CFSTR("VPANSuffix"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_supportsVirtualCardNumber, CFSTR("supportsVirtualCardNumber"));
  PKVirtualCardVPANOriginToString(self->_virtualCardVPANOrigin);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("virtualCardNumberOrigin"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_virtualCardRefreshTypeNumber, CFSTR("virtualCardRefreshType"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsBarcodePayment);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("supportsBarcodePayment"));

  if (-[NSArray count](self->_supportedExpressModes, "count"))
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_supportedExpressModes, CFSTR("supportedExpressModes"));
  }
  else if (-[NSArray count](self->_automaticSelectionCriteria, "count"))
  {
    -[NSArray pk_arrayByApplyingBlock:](self->_automaticSelectionCriteria, "pk_arrayByApplyingBlock:", &__block_literal_global_109);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("automaticSelectionCriteria"));

  }
  appletDataFormat = self->_appletDataFormat;
  if (appletDataFormat)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", appletDataFormat, CFSTR("appletDataFormat"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsServiceMode);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, CFSTR("supportsServiceMode"));

  appletCurrencyCode = self->_appletCurrencyCode;
  if (appletCurrencyCode)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", appletCurrencyCode, CFSTR("appletCurrencyCode"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_requiresDeferredAuthorization);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, CFSTR("requiresDeferredAuthorization"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_paymentNetworkIdentifier);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v28, CFSTR("paymentNetworkIdentifier"));

  PKPaymentMethodTypeToString(self->_paymentType);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, CFSTR("paymentType"));

  PKPaymentMethodTypeToString(self->_auxiliaryPaymentType);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v30, CFSTR("auxiliaryPaymentType"));

  displayName = self->_displayName;
  if (displayName)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", displayName, CFSTR("applicationDescription"));
  inAppPINRequiredAmount = self->_inAppPINRequiredAmount;
  if (inAppPINRequiredAmount)
  {
    -[NSDecimalNumber stringValue](inAppPINRequiredAmount, "stringValue");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v33, CFSTR("inAppPINRequiredAmount"));

  }
  inAppPINRequiredCurrency = self->_inAppPINRequiredCurrency;
  if (inAppPINRequiredCurrency)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", inAppPINRequiredCurrency, CFSTR("inAppPINRequiredCurrency"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_contactlessPriority);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v35, CFSTR("contactlessPriority"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_inAppPriority);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v36, CFSTR("inAppPriority"));

  v37 = (void *)-[NSArray copy](self->_supportedInAppMerchantCountryCodes, "copy");
  if (v37)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_supportedInAppMerchantCountryCodes, CFSTR("supportedInAppMerchantCountryCodes"));
  v38 = (void *)-[NSArray copy](self->_unsupportedInAppMerchantCountryCodes, "copy");

  if (v38)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_unsupportedInAppMerchantCountryCodes, CFSTR("unsupportedInAppMerchantCountryCodes"));
  if (-[NSArray count](self->_supportedTransitNetworkIdentifiers, "count"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_supportedTransitNetworkIdentifiers, CFSTR("supportedTransitNetworkIdentifiers"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsInstantFundsIn);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v39, CFSTR("supportsInstantFundsIn"));

  PKPaymentMethodTypeToString(self->_fundingSourcePaymentType);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v40, CFSTR("fundingSourcePaymentType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_requiresConsentForDataRelease);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v41, CFSTR("requiresConsentForDataRelease"));

  if (-[NSSet count](self->_subcredentials, "count"))
  {
    -[NSSet anyObject](self->_subcredentials, "anyObject");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "asDictionary");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v43, CFSTR("subcredential"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shareable);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v44, CFSTR("shareable"));

  v45 = (void *)objc_msgSend(v4, "copy");
  return v45;
}

uint64_t __36__PKPaymentApplication_asDictionary__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "asDictionary");
}

- (BOOL)firstApproachCompleted
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_foundVehicleReport)
    return 1;
  -[PKPaymentApplication subcredentials](self, "subcredentials");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    v12 = 0;
    objc_msgSend(PKGetClassNFDigitalCarKeySession(), "vehicleReports:", &v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v12;
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        -[PKPaymentApplication applicationIdentifier](self, "applicationIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v14 = v11;
        v15 = 2112;
        v16 = v6;
        v17 = 2112;
        v18 = v8;
        _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "PKPaymentApplication: failed to fetch vehicle report for (%@: %@) - %@.", buf, 0x20u);

      }
    }
    self->_foundVehicleReport = v9 != 0;

  }
  return self->_foundVehicleReport;
}

- (BOOL)supportsPartnerSpecificIdentifier
{
  return self->_supportsMerchantTokens || self->_apanIdentifier || self->_virtualCardIdentifier != 0;
}

- (BOOL)supportsMultiTokensWithImplicitlyEnabledNetworks:(id)a3
{
  id v4;
  BOOL v5;
  char v6;
  void *v7;

  v4 = a3;
  v5 = -[NSNumber BOOLValue](self->_supportsMultiTokens, "BOOLValue");
  if (self->_supportsMultiTokens)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_paymentNetworkIdentifier);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "containsObject:", v7);

  }
  return v5 | v6;
}

- (BOOL)isShareable
{
  BOOL v2;
  void *v3;

  if (self->_shareable)
    return 1;
  -[NSSet pk_anyObjectPassingTest:](self->_subcredentials, "pk_anyObjectPassingTest:", &__block_literal_global_80);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v3 != 0;

  return v2;
}

uint64_t __35__PKPaymentApplication_isShareable__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isShareable");
}

- (BOOL)supportsDeviceAssessmentAccordingToService:(id)a3
{
  void *v4;
  int64_t v5;
  void *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  int v11;
  int64_t v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[PKPaymentApplication networksSupportedAccordingToService:](self, "networksSupportedAccordingToService:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[PKPaymentApplication paymentNetworkIdentifier](self, "paymentNetworkIdentifier");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "containsObject:", v6);

    PKLogFacilityTypeGetObject(6uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = "No";
      if (v7)
        v9 = "Yes";
      v11 = 134218242;
      v12 = v5;
      v13 = 2080;
      v14 = v9;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Device assessment supports network %ld: %s", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Device assessment not supported.", (uint8_t *)&v11, 2u);
    }
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)networksSupportedAccordingToService:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PKPaymentApplication torinoFeatureFromService:](self, "torinoFeatureFromService:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "implicitFeatureSupportedNetworks");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)torinoFeatureFromService:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "targetDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "paymentWebService:supportedRegionFeatureOfType:", v3, 6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)vpanRefreshTypeAccordingToService:(id)a3
{
  void *v4;
  unint64_t v5;

  +[PKWebServiceVirtualCardFeature virtualCardFeatureWithWebService:](PKWebServiceVirtualCardFeature, "virtualCardFeatureWithWebService:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "refreshTypeForPaymentApplication:", self);

  return v5;
}

+ (BOOL)paymentApplicationSupportsMerchantCapabilties:(unint64_t)a3 paymentType:(unint64_t)a4
{
  BOOL result;
  unint64_t v5;
  unint64_t v6;
  BOOL v7;

  result = 1;
  if ((a3 & 0x1C) != 0)
  {
    v5 = (a3 >> 4) & 1;
    v6 = (a3 >> 2) & 1;
    v7 = a4 != 1 || (a3 & 8) != 0;
    if (a4 != 2)
      LOBYTE(v6) = v7;
    if (a4 != 100)
      LOBYTE(v5) = v6;
    if ((a3 & 0x1C) == 0x1C)
      return 1;
    else
      return v5;
  }
  return result;
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (NSString)dpanSuffix
{
  return self->_dpanSuffix;
}

- (NSString)sanitizedDPAN
{
  return self->_sanitizedDPAN;
}

- (int64_t)state
{
  return self->_state;
}

- (NSString)suspendedReason
{
  return self->_suspendedReason;
}

- (BOOL)supportsMerchantTokens
{
  return self->_supportsMerchantTokens;
}

- (BOOL)hasMerchantTokens
{
  return self->_hasMerchantTokens;
}

- (BOOL)hadMerchantTokens
{
  return self->_hadMerchantTokens;
}

- (NSString)apanIdentifier
{
  return self->_apanIdentifier;
}

- (NSString)apanSuffix
{
  return self->_apanSuffix;
}

- (NSString)virtualCardIdentifier
{
  return self->_virtualCardIdentifier;
}

- (NSString)virtualCardSuffix
{
  return self->_virtualCardSuffix;
}

- (NSNumber)supportsVirtualCardNumber
{
  return self->_supportsVirtualCardNumber;
}

- (int64_t)virtualCardVPANOrigin
{
  return self->_virtualCardVPANOrigin;
}

- (NSNumber)virtualCardRefreshTypeNumber
{
  return self->_virtualCardRefreshTypeNumber;
}

- (void)setVirtualCardRefreshTypeNumber:(id)a3
{
  objc_storeStrong((id *)&self->_virtualCardRefreshTypeNumber, a3);
}

- (NSNumber)supportsMultiTokens
{
  return self->_supportsMultiTokens;
}

- (BOOL)supportsOptionalAuthentication
{
  return self->_supportsOptionalAuthentication;
}

- (NSArray)supportedExpressModes
{
  return self->_supportedExpressModes;
}

- (BOOL)supportsServiceMode
{
  return self->_supportsServiceMode;
}

- (NSString)appletCurrencyCode
{
  return self->_appletCurrencyCode;
}

- (BOOL)requiresDeferredAuthorization
{
  return self->_requiresDeferredAuthorization;
}

- (int64_t)paymentNetworkIdentifier
{
  return self->_paymentNetworkIdentifier;
}

- (void)setInAppPINRequired:(BOOL)a3
{
  self->_inAppPINRequired = a3;
}

- (NSDecimalNumber)inAppPINRequiredAmount
{
  return self->_inAppPINRequiredAmount;
}

- (NSString)inAppPINRequiredCurrency
{
  return self->_inAppPINRequiredCurrency;
}

- (unint64_t)auxiliaryPaymentType
{
  return self->_auxiliaryPaymentType;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (int64_t)contactlessPriority
{
  return self->_contactlessPriority;
}

- (int64_t)inAppPriority
{
  return self->_inAppPriority;
}

- (BOOL)supportsInstantFundsIn
{
  return self->_supportsInstantFundsIn;
}

- (unint64_t)fundingSourcePaymentType
{
  return self->_fundingSourcePaymentType;
}

- (BOOL)requiresConsentForDataRelease
{
  return self->_requiresConsentForDataRelease;
}

- (NSString)transactionSourceIdentifier
{
  return self->_transactionSourceIdentifier;
}

- (NSString)appletDataFormat
{
  return self->_appletDataFormat;
}

- (PKTransitPassProperties)transitProperties
{
  return self->_transitProperties;
}

- (void)setTransitProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSArray)supportedInAppMerchantCountryCodes
{
  return self->_supportedInAppMerchantCountryCodes;
}

- (NSArray)unsupportedInAppMerchantCountryCodes
{
  return self->_unsupportedInAppMerchantCountryCodes;
}

- (NSArray)supportedTransitNetworkIdentifiers
{
  return self->_supportedTransitNetworkIdentifiers;
}

- (void)setSupportedRadioTechnologies:(unint64_t)a3
{
  self->_supportedRadioTechnologies = a3;
}

@end
