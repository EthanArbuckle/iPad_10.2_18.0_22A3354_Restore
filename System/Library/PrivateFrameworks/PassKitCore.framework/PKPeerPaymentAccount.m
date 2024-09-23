@implementation PKPeerPaymentAccount

- (PKPeerPaymentAccount)initWithDictionary:(id)a3 lastUpdated:(id)a4
{
  id v6;
  id v7;
  PKPeerPaymentAccount *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *countryCode;
  void *v16;
  uint64_t v17;
  NSString *identifier;
  uint64_t v19;
  NSDate *createdDate;
  uint64_t v21;
  NSDate *identifiedDate;
  uint64_t v23;
  uint64_t v24;
  PKCurrencyAmount *v25;
  PKCurrencyAmount *currentBalance;
  uint64_t v27;
  NSDecimalNumber *maximumBalance;
  NSDecimalNumber *v29;
  void *v30;
  NSDecimalNumber *v31;
  void *v32;
  uint64_t v33;
  NSDecimalNumber *v34;
  void *v35;
  void *v36;
  NSDecimalNumber *v37;
  NSDecimalNumber *amountRemainingUntilIdentityVerification;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  NSString *termsIdentifier;
  uint64_t v44;
  NSURL *termsURL;
  uint64_t v46;
  NSURL *associatedPassURL;
  uint64_t v48;
  NSString *associatedPassSerialNumber;
  uint64_t v50;
  NSString *associatedPassTypeIdentifier;
  id v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  PKPeerPaymentAccountFeatureDescriptor *v58;
  uint64_t v59;
  NSSet *supportedFeatureDescriptors;
  PKPeerPaymentAssociatedAccountInformation *v61;
  PKPeerPaymentAssociatedAccountInformation *associatedAccountInformation;
  uint64_t v63;
  NSString *altDSID;
  uint64_t v65;
  NSSet *cloudStoreZoneNames;
  void *v67;
  PKPeerPaymentAdditionalPushTopics *v68;
  PKPeerPaymentAdditionalPushTopics *additionalPushTopics;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  PKPeerPaymentPaymentModeIdentifiers *v73;
  PKPeerPaymentPaymentModeIdentifiers *paymentModeIdentifiers;
  void *v75;
  PKPeerPaymentEncryptionCertificatesVersions *v76;
  PKPeerPaymentEncryptionCertificatesVersions *encryptionCertificatesVersions;
  void *v79;
  void *v80;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  objc_super v86;
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v86.receiver = self;
  v86.super_class = (Class)PKPeerPaymentAccount;
  v8 = -[PKPeerPaymentAccount init](&v86, sel_init);
  if (!v8)
    goto LABEL_34;
  objc_msgSend(v6, "PKStringForKey:", CFSTR("state"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8->_state = PKPeerPaymentAccountStateFromString(v9);

  objc_msgSend(v6, "PKStringForKey:", CFSTR("stage"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8->_stage = PKPeerPaymentAccountStageFromString(v10);

  objc_msgSend(v6, "PKStringForKey:", CFSTR("stateReason"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v8->_stateReason = PKPeerPaymentAccountStateReasonFromString(v11);

  objc_msgSend(v6, "PKStringForKey:", CFSTR("personToPersonRestrictionType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v8->_sendRestrictionType = PKPeerPaymentAccountSendRestrictionTypeFromString(v12);

  objc_msgSend(v6, "PKStringForKey:", CFSTR("receiveRestrictionType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v8->_receiveRestrictionType = PKPeerPaymentAccountReceiveRestrictionTypeFromString(v13);

  objc_msgSend(v6, "PKStringForKey:", CFSTR("countryCode"));
  v14 = objc_claimAutoreleasedReturnValue();
  countryCode = v8->_countryCode;
  v8->_countryCode = (NSString *)v14;

  objc_msgSend(v6, "PKStringForKey:", CFSTR("role"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v8->_role = PKPeerPaymentAccountRoleFromString(v16);

  objc_msgSend(v6, "PKStringForKey:", CFSTR("identifier"));
  v17 = objc_claimAutoreleasedReturnValue();
  identifier = v8->_identifier;
  v8->_identifier = (NSString *)v17;

  objc_msgSend(v6, "PKDateForKey:", CFSTR("createdDate"));
  v19 = objc_claimAutoreleasedReturnValue();
  createdDate = v8->_createdDate;
  v8->_createdDate = (NSDate *)v19;

  objc_msgSend(v6, "PKDateForKey:", CFSTR("identifiedDate"));
  v21 = objc_claimAutoreleasedReturnValue();
  identifiedDate = v8->_identifiedDate;
  v8->_identifiedDate = (NSDate *)v21;

  objc_msgSend(v6, "PKDecimalNumberFromStringForKey:", CFSTR("currentBalance"));
  v23 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "PKStringForKey:", CFSTR("currency"));
  v24 = objc_claimAutoreleasedReturnValue();
  v79 = (void *)v24;
  v80 = (void *)v23;
  if (v23 && v24)
  {
    v25 = -[PKCurrencyAmount initWithAmount:currency:exponent:]([PKCurrencyAmount alloc], "initWithAmount:currency:exponent:", v23, v24, 0);
    currentBalance = v8->_currentBalance;
    v8->_currentBalance = v25;
  }
  else
  {
    currentBalance = v8->_currentBalance;
    v8->_currentBalance = 0;
  }

  objc_msgSend(v6, "PKDecimalNumberFromStringForKey:", CFSTR("maximumBalance"));
  v27 = objc_claimAutoreleasedReturnValue();
  maximumBalance = v8->_maximumBalance;
  v8->_maximumBalance = (NSDecimalNumber *)v27;

  v29 = v8->_maximumBalance;
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSDecimalNumber compare:](v29, "compare:", v30) == NSOrderedSame)
  {

LABEL_10:
    v34 = v8->_maximumBalance;
    v8->_maximumBalance = 0;

    goto LABEL_11;
  }
  v31 = v8->_maximumBalance;
  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[NSDecimalNumber compare:](v31, "compare:", v32);

  if (v33 == -1)
    goto LABEL_10;
LABEL_11:
  v81 = v7;
  v8->_identityVerificationRequired = objc_msgSend(v6, "PKBoolForKey:", CFSTR("identityVerificationRequired"));
  objc_msgSend(v6, "PKDecimalNumberFromStringForKey:", CFSTR("amountRemainingUntilIdentityVerification"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v35)
  {
    v37 = v35;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("500"));
    v37 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  }
  amountRemainingUntilIdentityVerification = v8->_amountRemainingUntilIdentityVerification;
  v8->_amountRemainingUntilIdentityVerification = v37;

  objc_storeStrong((id *)&v8->_lastUpdated, a4);
  objc_msgSend(v6, "PKDoubleForKey:", CFSTR("proactiveFetchPeriod"));
  v8->_proactiveFetchPeriod = v39;
  objc_msgSend(v6, "PKDoubleForKey:", CFSTR("accountFetchAfterTransactionWaitPeriod"));
  v8->_accountFetchAfterTransactionWaitPeriod = v40;
  objc_msgSend(v6, "PKDoubleForKey:", CFSTR("accountFetchAfterTransactionWaitTolerance"));
  v8->_accountFetchAfterTransactionWaitTolerance = v41;
  v8->_termsAcceptanceRequired = objc_msgSend(v6, "PKBoolForKey:", CFSTR("termsAcceptanceRequired"));
  objc_msgSend(v6, "PKStringForKey:", CFSTR("termsIdentifier"));
  v42 = objc_claimAutoreleasedReturnValue();
  termsIdentifier = v8->_termsIdentifier;
  v8->_termsIdentifier = (NSString *)v42;

  objc_msgSend(v6, "PKURLForKey:", CFSTR("termsURL"));
  v44 = objc_claimAutoreleasedReturnValue();
  termsURL = v8->_termsURL;
  v8->_termsURL = (NSURL *)v44;

  objc_msgSend(v6, "PKURLForKey:", CFSTR("associatedPassURL"));
  v46 = objc_claimAutoreleasedReturnValue();
  associatedPassURL = v8->_associatedPassURL;
  v8->_associatedPassURL = (NSURL *)v46;

  objc_msgSend(v6, "PKStringForKey:", CFSTR("associatedPassSerialNumber"));
  v48 = objc_claimAutoreleasedReturnValue();
  associatedPassSerialNumber = v8->_associatedPassSerialNumber;
  v8->_associatedPassSerialNumber = (NSString *)v48;

  objc_msgSend(v6, "PKStringForKey:", CFSTR("associatedPassTypeIdentifier"));
  v50 = objc_claimAutoreleasedReturnValue();
  associatedPassTypeIdentifier = v8->_associatedPassTypeIdentifier;
  v8->_associatedPassTypeIdentifier = (NSString *)v50;

  v52 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("supportedFeatures"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
  if (v54)
  {
    v55 = v54;
    v56 = *(_QWORD *)v83;
    do
    {
      for (i = 0; i != v55; ++i)
      {
        if (*(_QWORD *)v83 != v56)
          objc_enumerationMutation(v53);
        v58 = -[PKPeerPaymentAccountFeatureDescriptor initWithDictionary:]([PKPeerPaymentAccountFeatureDescriptor alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * i));
        if (v58)
          objc_msgSend(v52, "addObject:", v58);

      }
      v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
    }
    while (v55);
  }

  v59 = objc_msgSend(v52, "copy");
  supportedFeatureDescriptors = v8->_supportedFeatureDescriptors;
  v8->_supportedFeatureDescriptors = (NSSet *)v59;

  v7 = v81;
  v61 = -[PKPeerPaymentAssociatedAccountInformation initWithDictionary:lastUpdated:]([PKPeerPaymentAssociatedAccountInformation alloc], "initWithDictionary:lastUpdated:", v6, v81);
  associatedAccountInformation = v8->_associatedAccountInformation;
  v8->_associatedAccountInformation = v61;

  v8->_pendingPaymentCount = objc_msgSend(v6, "PKIntegerForKey:", CFSTR("pendingPaymentCount"));
  v8->_identityVerificationForDisbursementsRequired = objc_msgSend(v6, "PKBoolForKey:", CFSTR("identityVerificationForDisbursementsRequired"));
  objc_msgSend(v6, "PKStringForKey:", CFSTR("altDSID"));
  v63 = objc_claimAutoreleasedReturnValue();
  altDSID = v8->_altDSID;
  v8->_altDSID = (NSString *)v63;

  objc_msgSend(v6, "PKSetContaining:forKey:", objc_opt_class(), CFSTR("cloudStoreZoneNames"));
  v65 = objc_claimAutoreleasedReturnValue();
  cloudStoreZoneNames = v8->_cloudStoreZoneNames;
  v8->_cloudStoreZoneNames = (NSSet *)v65;

  objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("additionalPushTopics"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (v67)
  {
    v68 = -[PKPeerPaymentAdditionalPushTopics initWithDictionary:]([PKPeerPaymentAdditionalPushTopics alloc], "initWithDictionary:", v67);
    additionalPushTopics = v8->_additionalPushTopics;
    v8->_additionalPushTopics = v68;

  }
  v70 = objc_msgSend(v6, "PKIntegerForKey:", CFSTR("deviceScoreEncryptedPayloadVersion"));
  v71 = 1;
  if (v70 != 1)
    v71 = 2;
  if (!v70)
    v71 = 0;
  v8->_deviceScoreEncryptedPayloadVersion = v71;
  v8->_hasRecurringPayments = objc_msgSend(v6, "PKBoolForKey:", CFSTR("hasRecurringPayments"));
  objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("paymentModeIdentifiers"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (v72)
  {
    v73 = -[PKPeerPaymentPaymentModeIdentifiers initWithDictionary:]([PKPeerPaymentPaymentModeIdentifiers alloc], "initWithDictionary:", v72);
    paymentModeIdentifiers = v8->_paymentModeIdentifiers;
    v8->_paymentModeIdentifiers = v73;

  }
  objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("encryptionCertificatesVersions"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  if (v75)
  {
    v76 = -[PKPeerPaymentEncryptionCertificatesVersions initWithDictionary:]([PKPeerPaymentEncryptionCertificatesVersions alloc], "initWithDictionary:", v75);
    encryptionCertificatesVersions = v8->_encryptionCertificatesVersions;
    v8->_encryptionCertificatesVersions = v76;

  }
LABEL_34:

  return v8;
}

- (NSArray)defaultSuggestions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("10"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("20"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:", CFSTR("50"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (NSString)associatedPassTypeIdentifier
{
  NSString *v3;

  if ((PKUseMockSURFServer() & 1) != 0 || PKStoreDemoModeEnabled())
  {
    PKMockPeerPaymentPassPassTypeID();
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_associatedPassTypeIdentifier;
  }
  return v3;
}

- (NSString)associatedPassSerialNumber
{
  NSString *v3;

  if ((PKUseMockSURFServer() & 1) != 0 || PKStoreDemoModeEnabled())
  {
    PKMockPeerPaymentPassSerialNumber();
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_associatedPassSerialNumber;
  }
  return v3;
}

- (id)associatedPassUniqueID
{
  void *v3;
  void *v4;
  void *v5;

  -[PKPeerPaymentAccount associatedPassTypeIdentifier](self, "associatedPassTypeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentAccount associatedPassSerialNumber](self, "associatedPassSerialNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKGeneratePassUniqueID(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PKPeerPaymentAccount)peerPaymentAccountWithIdentifier:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;
  _BOOL4 v8;
  PKPeerPaymentAccount *v9;
  PKPeerPaymentAssociatedAccountInformation *associatedAccountInformation;
  _QWORD v12[4];
  NSString *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v5 = self->_identifier;
  v6 = (NSString *)v4;
  v7 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (!v6 || !v5)
    {

LABEL_9:
      v15 = 0;
      v16 = &v15;
      v17 = 0x3032000000;
      v18 = __Block_byref_object_copy__36;
      v19 = __Block_byref_object_dispose__36;
      v20 = 0;
      associatedAccountInformation = self->_associatedAccountInformation;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __57__PKPeerPaymentAccount_peerPaymentAccountWithIdentifier___block_invoke;
      v12[3] = &unk_1E2ACFC00;
      v13 = v7;
      v14 = &v15;
      -[PKPeerPaymentAssociatedAccountInformation enumerateAssociatedAccountsUsingBlock:](associatedAccountInformation, "enumerateAssociatedAccountsUsingBlock:", v12);
      v9 = (PKPeerPaymentAccount *)(id)v16[5];

      _Block_object_dispose(&v15, 8);
      goto LABEL_10;
    }
    v8 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

    if (!v8)
      goto LABEL_9;
  }
  v9 = self;
LABEL_10:

  return v9;
}

void __57__PKPeerPaymentAccount_peerPaymentAccountWithIdentifier___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  v8 = v6;
  v9 = v7;
  if (v8 == v9)
  {

  }
  else
  {
    v10 = v9;
    if (!v8 || !v9)
    {

      goto LABEL_9;
    }
    v11 = objc_msgSend(v8, "isEqualToString:", v9);

    if (!v11)
      goto LABEL_9;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  *a3 = 1;
LABEL_9:

}

- (PKPeerPaymentAccount)peerPaymentAccountWithAltDSID:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;
  _BOOL4 v8;
  PKPeerPaymentAccount *v9;
  PKPeerPaymentAssociatedAccountInformation *associatedAccountInformation;
  _QWORD v12[4];
  NSString *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v5 = self->_altDSID;
  v6 = (NSString *)v4;
  v7 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (!v6 || !v5)
    {

LABEL_9:
      v15 = 0;
      v16 = &v15;
      v17 = 0x3032000000;
      v18 = __Block_byref_object_copy__36;
      v19 = __Block_byref_object_dispose__36;
      v20 = 0;
      associatedAccountInformation = self->_associatedAccountInformation;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __54__PKPeerPaymentAccount_peerPaymentAccountWithAltDSID___block_invoke;
      v12[3] = &unk_1E2ACFC00;
      v13 = v7;
      v14 = &v15;
      -[PKPeerPaymentAssociatedAccountInformation enumerateAssociatedAccountsUsingBlock:](associatedAccountInformation, "enumerateAssociatedAccountsUsingBlock:", v12);
      v9 = (PKPeerPaymentAccount *)(id)v16[5];

      _Block_object_dispose(&v15, 8);
      goto LABEL_10;
    }
    v8 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

    if (!v8)
      goto LABEL_9;
  }
  v9 = self;
LABEL_10:

  return v9;
}

void __54__PKPeerPaymentAccount_peerPaymentAccountWithAltDSID___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "altDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  v8 = v6;
  v9 = v7;
  if (v8 == v9)
  {

  }
  else
  {
    v10 = v9;
    if (!v8 || !v9)
    {

      goto LABEL_9;
    }
    v11 = objc_msgSend(v8, "isEqualToString:", v9);

    if (!v11)
      goto LABEL_9;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  *a3 = 1;
LABEL_9:

}

- (id)accountInvitationWithAltDSID:(id)a3
{
  id v4;
  void *v5;
  PKPeerPaymentAssociatedAccountInformation *associatedAccountInformation;
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
  v5 = v4;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__36;
    v16 = __Block_byref_object_dispose__36;
    v17 = 0;
    associatedAccountInformation = self->_associatedAccountInformation;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__PKPeerPaymentAccount_accountInvitationWithAltDSID___block_invoke;
    v9[3] = &unk_1E2ACFC28;
    v10 = v4;
    v11 = &v12;
    -[PKPeerPaymentAssociatedAccountInformation enumerateAccountInvitationsUsingBlock:](associatedAccountInformation, "enumerateAccountInvitationsUsingBlock:", v9);
    v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __53__PKPeerPaymentAccount_accountInvitationWithAltDSID___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  int v13;
  id v14;

  v6 = a2;
  v7 = *(void **)(a1 + 32);
  v14 = v6;
  objc_msgSend(v6, "altDSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  v10 = v8;
  if (v9 == v10)
  {

LABEL_10:
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
    goto LABEL_11;
  }
  v11 = v10;
  if (v9)
    v12 = v10 == 0;
  else
    v12 = 1;
  if (v12)
  {

  }
  else
  {
    v13 = objc_msgSend(v9, "isEqualToString:", v10);

    if (v13)
      goto LABEL_10;
  }
LABEL_11:

}

- (BOOL)isAccountOutOfDate
{
  double proactiveFetchPeriod;
  void *v4;
  double v5;
  BOOL v6;

  if (!self->_lastUpdated)
    return 1;
  if (self->_proactiveFetchPeriod <= 0.0)
    proactiveFetchPeriod = *(double *)&PKPeerPaymentAccountDefaultProactiveFetchPeriod;
  else
    proactiveFetchPeriod = self->_proactiveFetchPeriod;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", self->_lastUpdated);
  v6 = v5 >= proactiveFetchPeriod;

  return v6;
}

- (BOOL)areAssociatedAccountsOutOfDate
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  BOOL v8;

  if (!-[PKPeerPaymentAccount supportsFamilySharing](self, "supportsFamilySharing"))
    return 0;
  -[PKPeerPaymentAssociatedAccountInformation proactiveAssociatedAccountFetchPeriod](self->_associatedAccountInformation, "proactiveAssociatedAccountFetchPeriod");
  v4 = v3;
  -[PKPeerPaymentAssociatedAccountInformation lastUpdated](self->_associatedAccountInformation, "lastUpdated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (v4 <= 0.0)
      v4 = *(double *)&PKPeerPaymentAssociatedAccountDefaultProactiveFetchPeriod;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v5);
    v8 = v7 >= v4;

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (BOOL)areRecurringPaymentsOutOfDate
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  BOOL v9;

  if (!-[PKPeerPaymentAccount supportsRecurringPayments](self, "supportsRecurringPayments"))
    return 0;
  -[PKPeerPaymentAccount recurringPaymentsFeatureDescriptor](self, "recurringPaymentsFeatureDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "proactiveFetchPeriod");
  v5 = v4;

  PKPeerPaymentRecurringPaymentsLastUpdated();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (v5 <= 0.0)
      v5 = *(double *)&PKPeerPaymentRecurringPaymentsDefaultProactiveFetchPeriod;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", v6);
    v9 = v8 >= v5;

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)isParticipantAccountLockedByOwner
{
  return self->_role == 1 && self->_state == 3 && self->_stateReason - 1 < 3;
}

- (BOOL)isPariticipantAccountSecurityDowngraded
{
  return self->_role == 1 && self->_state == 3 && self->_stateReason == 2;
}

- (BOOL)isPariticipantAccountEmbargoRecovery
{
  return self->_role == 1 && self->_state == 3 && self->_stateReason == 3;
}

- (BOOL)isEligibleToAddMoneyForUser:(id)a3
{
  BOOL v4;
  BOOL v5;

  v4 = 0;
  if (a3 && self->_role == 1)
    v4 = objc_msgSend(a3, "memberType") == 2;
  v5 = !v4;
  return self->_state == 1 && v5;
}

- (BOOL)isEligibleToWithdrawForUser:(id)a3
{
  return self->_state - 1 < 2;
}

- (BOOL)isEligibleForRecurringPaymentsForUser:(id)a3
{
  BOOL v4;
  BOOL v5;

  v4 = 0;
  if (a3 && self->_role == 1)
    v4 = objc_msgSend(a3, "memberType") == 2;
  v5 = !v4;
  return self->_state - 3 > 0xFFFFFFFFFFFFFFFDLL && v5;
}

- (BOOL)isEligibleForThresholdTopUpForUser:(id)a3
{
  BOOL v4;
  BOOL v5;

  v4 = 0;
  if (a3 && self->_role == 1)
    v4 = objc_msgSend(a3, "memberType") == 2;
  v5 = !v4;
  return self->_state - 3 > 0xFFFFFFFFFFFFFFFDLL && v5;
}

- (BOOL)willTriggerIdentityVerificationForTransactionAmount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  if (*(_OWORD *)&self->_state == __PAIR128__(2, 1))
  {
    -[NSDecimalNumber decimalNumberBySubtracting:](self->_amountRemainingUntilIdentityVerification, "decimalNumberBySubtracting:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "compare:", v6) == -1;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)identityVerificationRequired
{
  return (PKUseMockSURFServer() & 1) == 0 && (PKStoreDemoModeEnabled() & 1) == 0 && self->_identityVerificationRequired;
}

- (BOOL)termsAcceptanceRequired
{
  void *v4;

  if ((PKUseMockSURFServer() & 1) != 0 || (PKStoreDemoModeEnabled() & 1) != 0)
    return 0;
  PKPeerPaymentServiceForceTermsURL();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4 || self->_termsAcceptanceRequired;
}

- (NSURL)termsURL
{
  void *v3;
  NSURL *v4;

  PKPeerPaymentServiceForceTermsURL();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    PKPeerPaymentServiceForceTermsURL();
    v4 = (NSURL *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_termsURL;
  }
  return v4;
}

- (NSString)termsIdentifier
{
  void *v3;
  __CFString *v4;

  PKPeerPaymentServiceForceTermsURL();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = CFSTR("clientForcedTerms");
  else
    v4 = self->_termsIdentifier;
  return (NSString *)v4;
}

- (NSSet)cloudStoreZoneNames
{
  NSSet *v3;

  if (-[NSSet count](self->_cloudStoreZoneNames, "count"))
  {
    v3 = self->_cloudStoreZoneNames;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("transactions"));
    v3 = (NSSet *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)setAssociatedAccountInformation:(id)a3
{
  id v5;
  void *v6;
  id v7;
  id *p_associatedAccountInformation;
  PKPeerPaymentAssociatedAccountInformation *associatedAccountInformation;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  associatedAccountInformation = self->_associatedAccountInformation;
  p_associatedAccountInformation = (id *)&self->_associatedAccountInformation;
  v7 = associatedAccountInformation;
  if (v5 && v7)
  {
    if ((objc_msgSend(v5, "isEqual:") & 1) != 0)
      goto LABEL_14;
    v7 = *p_associatedAccountInformation;
  }
  else if (v7 == v5)
  {
    goto LABEL_14;
  }
  v10 = v7;
  objc_storeStrong(p_associatedAccountInformation, a3);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v10, "associatedAccountRemovalRecords", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v17 = *p_associatedAccountInformation;
        objc_msgSend(v16, "altDSID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "markAssociatedAccountRemovalRecordWithAltDSID:hasPresentedNotification:", v18, objc_msgSend(v16, "hasPresentedNotification"));

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

LABEL_14:
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentAccount)initWithCoder:(id)a3
{
  id v4;
  PKPeerPaymentAccount *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSDate *createdDate;
  uint64_t v10;
  NSDate *identifiedDate;
  uint64_t v12;
  NSString *countryCode;
  uint64_t v14;
  PKCurrencyAmount *currentBalance;
  uint64_t v16;
  NSDecimalNumber *maximumBalance;
  uint64_t v18;
  NSDecimalNumber *amountRemainingUntilIdentityVerification;
  uint64_t v20;
  NSDate *lastUpdated;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  NSString *termsIdentifier;
  uint64_t v27;
  NSURL *termsURL;
  uint64_t v29;
  NSURL *associatedPassURL;
  uint64_t v31;
  NSString *associatedPassSerialNumber;
  uint64_t v33;
  NSString *associatedPassTypeIdentifier;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSSet *supportedFeatureDescriptors;
  uint64_t v40;
  NSString *altDSID;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  NSSet *cloudStoreZoneNames;
  uint64_t v47;
  PKPeerPaymentAdditionalPushTopics *additionalPushTopics;
  uint64_t v49;
  NSString *transactionSourceIdentifier;
  uint64_t v51;
  PKPeerPaymentAssociatedAccountInformation *associatedAccountInformation;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  PKPeerPaymentPaymentModeIdentifiers *paymentModeIdentifiers;
  uint64_t v57;
  PKPeerPaymentEncryptionCertificatesVersions *encryptionCertificatesVersions;
  objc_super v60;
  _QWORD v61[2];
  _QWORD v62[3];

  v62[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)PKPeerPaymentAccount;
  v5 = -[PKPeerPaymentAccount init](&v60, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_role = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("role"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("createdDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    createdDate = v5->_createdDate;
    v5->_createdDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifiedDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    identifiedDate = v5->_identifiedDate;
    v5->_identifiedDate = (NSDate *)v10;

    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));
    v5->_stage = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("stage"));
    v5->_stateReason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("stateReason"));
    v5->_sendRestrictionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("personToPersonRestrictionType"));
    v5->_receiveRestrictionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("receiveRestrictionType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("countryCode"));
    v12 = objc_claimAutoreleasedReturnValue();
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentBalance"));
    v14 = objc_claimAutoreleasedReturnValue();
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (PKCurrencyAmount *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maximumBalance"));
    v16 = objc_claimAutoreleasedReturnValue();
    maximumBalance = v5->_maximumBalance;
    v5->_maximumBalance = (NSDecimalNumber *)v16;

    v5->_identityVerificationRequired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("identityVerificationRequired"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amountRemainingUntilIdentityVerification"));
    v18 = objc_claimAutoreleasedReturnValue();
    amountRemainingUntilIdentityVerification = v5->_amountRemainingUntilIdentityVerification;
    v5->_amountRemainingUntilIdentityVerification = (NSDecimalNumber *)v18;

    v5->_accountStateDirty = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("accountStateDirty"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdated"));
    v20 = objc_claimAutoreleasedReturnValue();
    lastUpdated = v5->_lastUpdated;
    v5->_lastUpdated = (NSDate *)v20;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("proactiveFetchPeriod"));
    v5->_proactiveFetchPeriod = v22;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("accountFetchAfterTransactionWaitPeriod"));
    v5->_accountFetchAfterTransactionWaitPeriod = v23;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("accountFetchAfterTransactionWaitTolerance"));
    v5->_accountFetchAfterTransactionWaitTolerance = v24;
    v5->_termsAcceptanceRequired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("termsAcceptanceRequired"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("termsIdentifier"));
    v25 = objc_claimAutoreleasedReturnValue();
    termsIdentifier = v5->_termsIdentifier;
    v5->_termsIdentifier = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("termsURL"));
    v27 = objc_claimAutoreleasedReturnValue();
    termsURL = v5->_termsURL;
    v5->_termsURL = (NSURL *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedPassURL"));
    v29 = objc_claimAutoreleasedReturnValue();
    associatedPassURL = v5->_associatedPassURL;
    v5->_associatedPassURL = (NSURL *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedPassSerialNumber"));
    v31 = objc_claimAutoreleasedReturnValue();
    associatedPassSerialNumber = v5->_associatedPassSerialNumber;
    v5->_associatedPassSerialNumber = (NSString *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedPassTypeIdentifier"));
    v33 = objc_claimAutoreleasedReturnValue();
    associatedPassTypeIdentifier = v5->_associatedPassTypeIdentifier;
    v5->_associatedPassTypeIdentifier = (NSString *)v33;

    v35 = (void *)MEMORY[0x1E0C99E60];
    v62[0] = objc_opt_class();
    v62[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setWithArray:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, CFSTR("supportedFeatureDescriptors"));
    v38 = objc_claimAutoreleasedReturnValue();
    supportedFeatureDescriptors = v5->_supportedFeatureDescriptors;
    v5->_supportedFeatureDescriptors = (NSSet *)v38;

    v5->_pendingPaymentCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pendingPaymentCount"));
    v5->_identityVerificationForDisbursementsRequired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("identityVerificationForDisbursementsRequired"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altDSID"));
    v40 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v40;

    v42 = (void *)MEMORY[0x1E0C99E60];
    v61[0] = objc_opt_class();
    v61[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setWithArray:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v44, CFSTR("cloudStoreZoneNames"));
    v45 = objc_claimAutoreleasedReturnValue();
    cloudStoreZoneNames = v5->_cloudStoreZoneNames;
    v5->_cloudStoreZoneNames = (NSSet *)v45;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("additionalPushTopics"));
    v47 = objc_claimAutoreleasedReturnValue();
    additionalPushTopics = v5->_additionalPushTopics;
    v5->_additionalPushTopics = (PKPeerPaymentAdditionalPushTopics *)v47;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionSourceIdentifier"));
    v49 = objc_claimAutoreleasedReturnValue();
    transactionSourceIdentifier = v5->_transactionSourceIdentifier;
    v5->_transactionSourceIdentifier = (NSString *)v49;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedAccountInformation"));
    v51 = objc_claimAutoreleasedReturnValue();
    associatedAccountInformation = v5->_associatedAccountInformation;
    v5->_associatedAccountInformation = (PKPeerPaymentAssociatedAccountInformation *)v51;

    v5->_hasDisplayedAssociatedAccountActiveNotification = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasDisplayedAssociatedAccountActiveNotification"));
    v53 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("deviceScoreEncryptedPayloadVersion"));
    v54 = 1;
    if (v53 != 1)
      v54 = 2;
    if (!v53)
      v54 = 0;
    v5->_deviceScoreEncryptedPayloadVersion = v54;
    v5->_hasRecurringPayments = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasRecurringPayments"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentModeIdentifiers"));
    v55 = objc_claimAutoreleasedReturnValue();
    paymentModeIdentifiers = v5->_paymentModeIdentifiers;
    v5->_paymentModeIdentifiers = (PKPeerPaymentPaymentModeIdentifiers *)v55;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encryptionCertificatesVersions"));
    v57 = objc_claimAutoreleasedReturnValue();
    encryptionCertificatesVersions = v5->_encryptionCertificatesVersions;
    v5->_encryptionCertificatesVersions = (PKPeerPaymentEncryptionCertificatesVersions *)v57;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_role, CFSTR("role"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_createdDate, CFSTR("createdDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifiedDate, CFSTR("identifiedDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_state, CFSTR("state"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_stage, CFSTR("stage"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_stateReason, CFSTR("stateReason"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sendRestrictionType, CFSTR("personToPersonRestrictionType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_receiveRestrictionType, CFSTR("receiveRestrictionType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_countryCode, CFSTR("countryCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentBalance, CFSTR("currentBalance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_maximumBalance, CFSTR("maximumBalance"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_identityVerificationRequired, CFSTR("identityVerificationRequired"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_amountRemainingUntilIdentityVerification, CFSTR("amountRemainingUntilIdentityVerification"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_accountStateDirty, CFSTR("accountStateDirty"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastUpdated, CFSTR("lastUpdated"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("proactiveFetchPeriod"), self->_proactiveFetchPeriod);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("accountFetchAfterTransactionWaitPeriod"), self->_accountFetchAfterTransactionWaitPeriod);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("accountFetchAfterTransactionWaitTolerance"), self->_accountFetchAfterTransactionWaitTolerance);
  objc_msgSend(v5, "encodeBool:forKey:", self->_termsAcceptanceRequired, CFSTR("termsAcceptanceRequired"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_termsIdentifier, CFSTR("termsIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_termsURL, CFSTR("termsURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedPassURL, CFSTR("associatedPassURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedPassSerialNumber, CFSTR("associatedPassSerialNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedPassTypeIdentifier, CFSTR("associatedPassTypeIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportedFeatureDescriptors, CFSTR("supportedFeatureDescriptors"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_pendingPaymentCount, CFSTR("pendingPaymentCount"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_identityVerificationForDisbursementsRequired, CFSTR("identityVerificationForDisbursementsRequired"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_altDSID, CFSTR("altDSID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cloudStoreZoneNames, CFSTR("cloudStoreZoneNames"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_additionalPushTopics, CFSTR("additionalPushTopics"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionSourceIdentifier, CFSTR("transactionSourceIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedAccountInformation, CFSTR("associatedAccountInformation"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasDisplayedAssociatedAccountActiveNotification, CFSTR("hasDisplayedAssociatedAccountActiveNotification"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_deviceScoreEncryptedPayloadVersion, CFSTR("deviceScoreEncryptedPayloadVersion"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasRecurringPayments, CFSTR("hasRecurringPayments"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentModeIdentifiers, CFSTR("paymentModeIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_encryptionCertificatesVersions, CFSTR("encryptionCertificatesVersions"));

}

- (id)description
{
  void *v3;
  unint64_t role;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  unint64_t v8;
  unint64_t v9;
  const __CFString *v10;
  unint64_t stateReason;
  const __CFString *v12;
  unint64_t sendRestrictionType;
  const __CFString *v14;
  unint64_t receiveRestrictionType;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  double accountFetchAfterTransactionWaitPeriod;
  double accountFetchAfterTransactionWaitTolerance;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  unint64_t deviceScoreEncryptedPayloadVersion;
  const __CFString *v26;
  const __CFString *v27;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  role = self->_role;
  v5 = CFSTR("unknown");
  v6 = CFSTR("participant");
  if (role != 1)
    v6 = CFSTR("unknown");
  if (role)
    v7 = v6;
  else
    v7 = CFSTR("owner");
  objc_msgSend(v3, "appendFormat:", CFSTR("role: '%@'; "), v7);
  objc_msgSend(v3, "appendFormat:", CFSTR("createdDate: '%@'; "), self->_createdDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("identifiedDate: '%@'; "), self->_identifiedDate);
  v8 = self->_state - 1;
  if (v8 <= 3)
    v5 = off_1E2ACFC48[v8];
  objc_msgSend(v3, "appendFormat:", CFSTR("state: '%@'; "), v5);
  v9 = self->_stage - 1;
  if (v9 > 2)
    v10 = CFSTR("unknown");
  else
    v10 = off_1E2ACFC68[v9];
  objc_msgSend(v3, "appendFormat:", CFSTR("stage: '%@'; "), v10);
  stateReason = self->_stateReason;
  if (stateReason > 7)
    v12 = CFSTR("unknown");
  else
    v12 = off_1E2ACFC80[stateReason];
  objc_msgSend(v3, "appendFormat:", CFSTR("stateReason: '%@'; "), v12);
  sendRestrictionType = self->_sendRestrictionType;
  v14 = CFSTR("unknown");
  if (sendRestrictionType <= 2)
    v14 = off_1E2ACFCC0[sendRestrictionType];
  objc_msgSend(v3, "appendFormat:", CFSTR("sendRestrictionType: '%@'; "), v14);
  receiveRestrictionType = self->_receiveRestrictionType;
  v16 = CFSTR("none");
  if (receiveRestrictionType)
    v16 = CFSTR("unknown");
  if (receiveRestrictionType == 1)
    v17 = CFSTR("family");
  else
    v17 = v16;
  objc_msgSend(v3, "appendFormat:", CFSTR("receiveRestrictionType: '%@'; "), v17);
  objc_msgSend(v3, "appendFormat:", CFSTR("countryCode: '%@'; "), self->_countryCode);
  objc_msgSend(v3, "appendFormat:", CFSTR("currentBalance: '%@'; "), self->_currentBalance);
  objc_msgSend(v3, "appendFormat:", CFSTR("maximumBalance: '%@'; "), self->_maximumBalance);
  if (self->_identityVerificationRequired)
    v18 = CFSTR("YES");
  else
    v18 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("identityVerificationRequired: '%@'; "), v18);
  objc_msgSend(v3, "appendFormat:", CFSTR("amountRemainingUntilIdentityVerification: '%@'; "),
    self->_amountRemainingUntilIdentityVerification);
  if (self->_accountStateDirty)
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("accountStateDirty: '%@'; "), v19);
  objc_msgSend(v3, "appendFormat:", CFSTR("lastUpdated: '%@'; "), self->_lastUpdated);
  accountFetchAfterTransactionWaitPeriod = self->_accountFetchAfterTransactionWaitPeriod;
  if (accountFetchAfterTransactionWaitPeriod > 0.0)
    objc_msgSend(v3, "appendFormat:", CFSTR("accountFetchAfterTransactionWaitPeriod: '%ld'; "),
      (uint64_t)accountFetchAfterTransactionWaitPeriod);
  accountFetchAfterTransactionWaitTolerance = self->_accountFetchAfterTransactionWaitTolerance;
  if (accountFetchAfterTransactionWaitTolerance > 0.0)
    objc_msgSend(v3, "appendFormat:", CFSTR("accountFetchAfterTransactionWaitTolerance: '%ld'; "),
      (uint64_t)accountFetchAfterTransactionWaitTolerance);
  if (self->_termsAcceptanceRequired)
    v22 = CFSTR("YES");
  else
    v22 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("termsAcceptanceRequired: '%@'; "), v22);
  if (self->_termsAcceptanceRequired)
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("termsIdentifier: '%@'; "), self->_termsIdentifier);
    objc_msgSend(v3, "appendFormat:", CFSTR("termsURL: '%@'; "), self->_termsURL);
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("associatedPassURL: '%@'; "), self->_associatedPassURL);
  objc_msgSend(v3, "appendFormat:", CFSTR("associatedPassSerialNumber: '%@'; "), self->_associatedPassSerialNumber);
  objc_msgSend(v3, "appendFormat:", CFSTR("associatedPassTypeIdentifier: '%@'; "), self->_associatedPassTypeIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("supportedFeatureDescriptors: '%@'; "), self->_supportedFeatureDescriptors);
  objc_msgSend(v3, "appendFormat:", CFSTR("pendingPaymentCount: '%ld'; "), self->_pendingPaymentCount);
  if (self->_identityVerificationForDisbursementsRequired)
    v23 = CFSTR("YES");
  else
    v23 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("identityVerificationForDisbursementsRequired: '%@'; "), v23);
  objc_msgSend(v3, "appendFormat:", CFSTR("altDSID: '%@'; "), self->_altDSID);
  objc_msgSend(v3, "appendFormat:", CFSTR("cloudStoreZoneNames: '%@'; "), self->_cloudStoreZoneNames);
  objc_msgSend(v3, "appendFormat:", CFSTR("additionalPushTopics: '%@'; "), self->_additionalPushTopics);
  objc_msgSend(v3, "appendFormat:", CFSTR("transactionSourceIdentifier: '%@'; "), self->_transactionSourceIdentifier);
  if (self->_associatedAccountInformation)
    objc_msgSend(v3, "appendFormat:", CFSTR("associatedAccountInformation: '%@'; "),
      self->_associatedAccountInformation);
  if (self->_hasDisplayedAssociatedAccountActiveNotification)
    v24 = CFSTR("YES");
  else
    v24 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("hasDisplayedAssociatedAccountActiveNotification: '%@'; "), v24);
  deviceScoreEncryptedPayloadVersion = self->_deviceScoreEncryptedPayloadVersion;
  if (deviceScoreEncryptedPayloadVersion > 2)
    v26 = CFSTR("unknown");
  else
    v26 = off_1E2ACFCD8[deviceScoreEncryptedPayloadVersion];
  objc_msgSend(v3, "appendFormat:", CFSTR("deviceScoreEncryptedPayloadVersion: '%@'; "), v26);
  if (self->_hasRecurringPayments)
    v27 = CFSTR("YES");
  else
    v27 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("hasRecurringPayments: '%@'; "), v27);
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentModeIdentifiers: '%@'; "), self->_paymentModeIdentifiers);
  objc_msgSend(v3, "appendFormat:", CFSTR("encryptionCertificatesVersions: '%@'; "),
    self->_encryptionCertificatesVersions);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  double *v4;
  NSString *identifier;
  NSString *v6;
  NSDate *createdDate;
  NSDate *v8;
  NSDate *identifiedDate;
  NSDate *v10;
  NSString *countryCode;
  NSString *v12;
  PKCurrencyAmount *currentBalance;
  PKCurrencyAmount *v14;
  NSDecimalNumber *maximumBalance;
  NSDecimalNumber *v16;
  NSString *termsIdentifier;
  NSString *v18;
  NSURL *termsURL;
  NSURL *v20;
  NSURL *associatedPassURL;
  NSURL *v22;
  NSString *associatedPassSerialNumber;
  NSString *v24;
  NSString *associatedPassTypeIdentifier;
  NSString *v26;
  NSSet *supportedFeatureDescriptors;
  NSSet *v28;
  void *v29;
  NSString *v30;
  NSString *v31;
  NSString *v32;
  _BOOL4 v33;
  NSSet *cloudStoreZoneNames;
  NSSet *v35;
  PKPeerPaymentAdditionalPushTopics *additionalPushTopics;
  PKPeerPaymentAdditionalPushTopics *v37;
  PKPeerPaymentAssociatedAccountInformation *associatedAccountInformation;
  PKPeerPaymentAssociatedAccountInformation *v39;
  void *v40;
  NSString *v41;
  _BOOL4 v42;
  BOOL v43;
  PKPeerPaymentPaymentModeIdentifiers *paymentModeIdentifiers;
  PKPeerPaymentPaymentModeIdentifiers *v46;
  PKPeerPaymentEncryptionCertificatesVersions *encryptionCertificatesVersions;
  PKPeerPaymentEncryptionCertificatesVersions *v48;
  NSDecimalNumber *amountRemainingUntilIdentityVerification;
  NSDecimalNumber *v50;

  v4 = (double *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_89;
  identifier = self->_identifier;
  v6 = (NSString *)*((_QWORD *)v4 + 2);
  if (identifier && v6)
  {
    if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
      goto LABEL_89;
  }
  else if (identifier != v6)
  {
    goto LABEL_89;
  }
  createdDate = self->_createdDate;
  v8 = (NSDate *)*((_QWORD *)v4 + 4);
  if (createdDate && v8)
  {
    if ((-[NSDate isEqual:](createdDate, "isEqual:") & 1) == 0)
      goto LABEL_89;
  }
  else if (createdDate != v8)
  {
    goto LABEL_89;
  }
  identifiedDate = self->_identifiedDate;
  v10 = (NSDate *)*((_QWORD *)v4 + 5);
  if (identifiedDate && v10)
  {
    if ((-[NSDate isEqual:](identifiedDate, "isEqual:") & 1) == 0)
      goto LABEL_89;
  }
  else if (identifiedDate != v10)
  {
    goto LABEL_89;
  }
  countryCode = self->_countryCode;
  v12 = (NSString *)*((_QWORD *)v4 + 11);
  if (countryCode && v12)
  {
    if ((-[NSString isEqual:](countryCode, "isEqual:") & 1) == 0)
      goto LABEL_89;
  }
  else if (countryCode != v12)
  {
    goto LABEL_89;
  }
  currentBalance = self->_currentBalance;
  v14 = (PKCurrencyAmount *)*((_QWORD *)v4 + 12);
  if (currentBalance && v14)
  {
    if (!-[PKCurrencyAmount isEqual:](currentBalance, "isEqual:"))
      goto LABEL_89;
  }
  else if (currentBalance != v14)
  {
    goto LABEL_89;
  }
  maximumBalance = self->_maximumBalance;
  v16 = (NSDecimalNumber *)*((_QWORD *)v4 + 13);
  if (maximumBalance && v16)
  {
    if ((-[NSDecimalNumber isEqual:](maximumBalance, "isEqual:") & 1) == 0)
      goto LABEL_89;
  }
  else if (maximumBalance != v16)
  {
    goto LABEL_89;
  }
  termsIdentifier = self->_termsIdentifier;
  v18 = (NSString *)*((_QWORD *)v4 + 19);
  if (termsIdentifier && v18)
  {
    if ((-[NSString isEqual:](termsIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_89;
  }
  else if (termsIdentifier != v18)
  {
    goto LABEL_89;
  }
  termsURL = self->_termsURL;
  v20 = (NSURL *)*((_QWORD *)v4 + 20);
  if (termsURL && v20)
  {
    if ((-[NSURL isEqual:](termsURL, "isEqual:") & 1) == 0)
      goto LABEL_89;
  }
  else if (termsURL != v20)
  {
    goto LABEL_89;
  }
  associatedPassURL = self->_associatedPassURL;
  v22 = (NSURL *)*((_QWORD *)v4 + 21);
  if (associatedPassURL && v22)
  {
    if ((-[NSURL isEqual:](associatedPassURL, "isEqual:") & 1) == 0)
      goto LABEL_89;
  }
  else if (associatedPassURL != v22)
  {
    goto LABEL_89;
  }
  associatedPassSerialNumber = self->_associatedPassSerialNumber;
  v24 = (NSString *)*((_QWORD *)v4 + 22);
  if (associatedPassSerialNumber && v24)
  {
    if ((-[NSString isEqual:](associatedPassSerialNumber, "isEqual:") & 1) == 0)
      goto LABEL_89;
  }
  else if (associatedPassSerialNumber != v24)
  {
    goto LABEL_89;
  }
  associatedPassTypeIdentifier = self->_associatedPassTypeIdentifier;
  v26 = (NSString *)*((_QWORD *)v4 + 23);
  if (associatedPassTypeIdentifier && v26)
  {
    if ((-[NSString isEqual:](associatedPassTypeIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_89;
  }
  else if (associatedPassTypeIdentifier != v26)
  {
    goto LABEL_89;
  }
  supportedFeatureDescriptors = self->_supportedFeatureDescriptors;
  v28 = (NSSet *)*((_QWORD *)v4 + 33);
  if (supportedFeatureDescriptors && v28)
  {
    if ((-[NSSet isEqual:](supportedFeatureDescriptors, "isEqual:") & 1) == 0)
      goto LABEL_89;
  }
  else if (supportedFeatureDescriptors != v28)
  {
    goto LABEL_89;
  }
  v29 = (void *)*((_QWORD *)v4 + 25);
  v30 = self->_altDSID;
  v31 = v29;
  if (v30 == v31)
  {

  }
  else
  {
    v32 = v31;
    if (!v30 || !v31)
      goto LABEL_88;
    v33 = -[NSString isEqualToString:](v30, "isEqualToString:", v31);

    if (!v33)
      goto LABEL_89;
  }
  cloudStoreZoneNames = self->_cloudStoreZoneNames;
  v35 = (NSSet *)*((_QWORD *)v4 + 26);
  if (cloudStoreZoneNames && v35)
  {
    if ((-[NSSet isEqual:](cloudStoreZoneNames, "isEqual:") & 1) == 0)
      goto LABEL_89;
  }
  else if (cloudStoreZoneNames != v35)
  {
    goto LABEL_89;
  }
  additionalPushTopics = self->_additionalPushTopics;
  v37 = (PKPeerPaymentAdditionalPushTopics *)*((_QWORD *)v4 + 27);
  if (additionalPushTopics && v37)
  {
    if (!-[PKPeerPaymentAdditionalPushTopics isEqual:](additionalPushTopics, "isEqual:"))
      goto LABEL_89;
  }
  else if (additionalPushTopics != v37)
  {
    goto LABEL_89;
  }
  associatedAccountInformation = self->_associatedAccountInformation;
  v39 = (PKPeerPaymentAssociatedAccountInformation *)*((_QWORD *)v4 + 28);
  if (associatedAccountInformation && v39)
  {
    if (!-[PKPeerPaymentAssociatedAccountInformation isEqual:](associatedAccountInformation, "isEqual:"))
      goto LABEL_89;
  }
  else if (associatedAccountInformation != v39)
  {
    goto LABEL_89;
  }
  v40 = (void *)*((_QWORD *)v4 + 29);
  v30 = self->_transactionSourceIdentifier;
  v41 = v40;
  if (v30 != v41)
  {
    v32 = v41;
    if (v30 && v41)
    {
      v42 = -[NSString isEqualToString:](v30, "isEqualToString:", v41);

      if (!v42)
        goto LABEL_89;
      goto LABEL_92;
    }
LABEL_88:

    goto LABEL_89;
  }

LABEL_92:
  paymentModeIdentifiers = self->_paymentModeIdentifiers;
  v46 = (PKPeerPaymentPaymentModeIdentifiers *)*((_QWORD *)v4 + 31);
  if (paymentModeIdentifiers && v46)
  {
    if (!-[PKPeerPaymentPaymentModeIdentifiers isEqual:](paymentModeIdentifiers, "isEqual:"))
      goto LABEL_89;
  }
  else if (paymentModeIdentifiers != v46)
  {
    goto LABEL_89;
  }
  encryptionCertificatesVersions = self->_encryptionCertificatesVersions;
  v48 = (PKPeerPaymentEncryptionCertificatesVersions *)*((_QWORD *)v4 + 32);
  if (encryptionCertificatesVersions && v48)
  {
    if (!-[PKPeerPaymentEncryptionCertificatesVersions isEqual:](encryptionCertificatesVersions, "isEqual:"))
      goto LABEL_89;
  }
  else if (encryptionCertificatesVersions != v48)
  {
    goto LABEL_89;
  }
  if (self->_identityVerificationRequired == *((unsigned __int8 *)v4 + 8))
  {
    amountRemainingUntilIdentityVerification = self->_amountRemainingUntilIdentityVerification;
    v50 = (NSDecimalNumber *)*((_QWORD *)v4 + 14);
    if (amountRemainingUntilIdentityVerification && v50)
    {
      if ((-[NSDecimalNumber isEqual:](amountRemainingUntilIdentityVerification, "isEqual:") & 1) == 0)
        goto LABEL_89;
    }
    else if (amountRemainingUntilIdentityVerification != v50)
    {
      goto LABEL_89;
    }
    if (self->_termsAcceptanceRequired == *((unsigned __int8 *)v4 + 10)
      && self->_proactiveFetchPeriod == v4[16]
      && self->_accountFetchAfterTransactionWaitPeriod == v4[17]
      && self->_accountFetchAfterTransactionWaitTolerance == v4[18]
      && self->_role == *((_QWORD *)v4 + 3)
      && self->_state == *((_QWORD *)v4 + 6)
      && self->_stateReason == *((_QWORD *)v4 + 8)
      && self->_sendRestrictionType == *((_QWORD *)v4 + 9)
      && self->_receiveRestrictionType == *((_QWORD *)v4 + 10)
      && self->_stage == *((_QWORD *)v4 + 7)
      && self->_pendingPaymentCount == *((_QWORD *)v4 + 24)
      && self->_identityVerificationForDisbursementsRequired == *((unsigned __int8 *)v4 + 11)
      && self->_hasDisplayedAssociatedAccountActiveNotification == *((unsigned __int8 *)v4 + 12)
      && self->_deviceScoreEncryptedPayloadVersion == *((_QWORD *)v4 + 30))
    {
      v43 = self->_hasRecurringPayments == *((unsigned __int8 *)v4 + 13);
      goto LABEL_90;
    }
  }
LABEL_89:
  v43 = 0;
LABEL_90:

  return v43;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_createdDate);
  objc_msgSend(v3, "safelyAddObject:", self->_identifiedDate);
  objc_msgSend(v3, "safelyAddObject:", self->_countryCode);
  objc_msgSend(v3, "safelyAddObject:", self->_currentBalance);
  objc_msgSend(v3, "safelyAddObject:", self->_maximumBalance);
  objc_msgSend(v3, "safelyAddObject:", self->_amountRemainingUntilIdentityVerification);
  objc_msgSend(v3, "safelyAddObject:", self->_termsIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_termsURL);
  objc_msgSend(v3, "safelyAddObject:", self->_associatedPassURL);
  objc_msgSend(v3, "safelyAddObject:", self->_associatedPassSerialNumber);
  objc_msgSend(v3, "safelyAddObject:", self->_associatedPassTypeIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_supportedFeatureDescriptors);
  objc_msgSend(v3, "safelyAddObject:", self->_altDSID);
  objc_msgSend(v3, "safelyAddObject:", self->_cloudStoreZoneNames);
  objc_msgSend(v3, "safelyAddObject:", self->_additionalPushTopics);
  objc_msgSend(v3, "safelyAddObject:", self->_transactionSourceIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_associatedAccountInformation);
  objc_msgSend(v3, "safelyAddObject:", self->_paymentModeIdentifiers);
  objc_msgSend(v3, "safelyAddObject:", self->_encryptionCertificatesVersions);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_identityVerificationRequired - v4 + 32 * v4;
  v6 = self->_termsAcceptanceRequired - v5 + 32 * v5;
  v7 = (unint64_t)self->_proactiveFetchPeriod - v6 + 32 * v6;
  v8 = (unint64_t)self->_accountFetchAfterTransactionWaitPeriod - v7 + 32 * v7;
  v9 = (unint64_t)self->_accountFetchAfterTransactionWaitTolerance - v8 + 32 * v8;
  v10 = self->_role - v9 + 32 * v9;
  v11 = self->_state - v10 + 32 * v10;
  v12 = self->_stateReason - v11 + 32 * v11;
  v13 = self->_stage - v12 + 32 * v12;
  v14 = self->_sendRestrictionType - v13 + 32 * v13;
  v15 = self->_receiveRestrictionType - v14 + 32 * v14;
  v16 = self->_pendingPaymentCount - v15 + 32 * v15;
  v17 = self->_identityVerificationForDisbursementsRequired - v16 + 32 * v16;
  v18 = self->_hasDisplayedAssociatedAccountActiveNotification - v17 + 32 * v17;
  v19 = self->_deviceScoreEncryptedPayloadVersion - v18 + 32 * v18;
  v20 = self->_hasRecurringPayments - v19 + 32 * v19;

  return v20;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)role
{
  return self->_role;
}

- (void)setRole:(unint64_t)a3
{
  self->_role = a3;
}

- (NSDate)createdDate
{
  return self->_createdDate;
}

- (void)setCreatedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)identifiedDate
{
  return self->_identifiedDate;
}

- (void)setIdentifiedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)stage
{
  return self->_stage;
}

- (void)setStage:(unint64_t)a3
{
  self->_stage = a3;
}

- (unint64_t)stateReason
{
  return self->_stateReason;
}

- (void)setStateReason:(unint64_t)a3
{
  self->_stateReason = a3;
}

- (unint64_t)sendRestrictionType
{
  return self->_sendRestrictionType;
}

- (void)setSendRestrictionType:(unint64_t)a3
{
  self->_sendRestrictionType = a3;
}

- (unint64_t)receiveRestrictionType
{
  return self->_receiveRestrictionType;
}

- (void)setReceiveRestrictionType:(unint64_t)a3
{
  self->_receiveRestrictionType = a3;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (PKCurrencyAmount)currentBalance
{
  return self->_currentBalance;
}

- (void)setCurrentBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSDecimalNumber)maximumBalance
{
  return self->_maximumBalance;
}

- (void)setMaximumBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setIdentityVerificationRequired:(BOOL)a3
{
  self->_identityVerificationRequired = a3;
}

- (NSDecimalNumber)amountRemainingUntilIdentityVerification
{
  return self->_amountRemainingUntilIdentityVerification;
}

- (void)setAmountRemainingUntilIdentityVerification:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)isAccountStateDirty
{
  return self->_accountStateDirty;
}

- (void)setAccountStateDirty:(BOOL)a3
{
  self->_accountStateDirty = a3;
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdated, a3);
}

- (double)proactiveFetchPeriod
{
  return self->_proactiveFetchPeriod;
}

- (void)setProactiveFetchPeriod:(double)a3
{
  self->_proactiveFetchPeriod = a3;
}

- (double)accountFetchAfterTransactionWaitPeriod
{
  return self->_accountFetchAfterTransactionWaitPeriod;
}

- (void)setAccountFetchAfterTransactionWaitPeriod:(double)a3
{
  self->_accountFetchAfterTransactionWaitPeriod = a3;
}

- (double)accountFetchAfterTransactionWaitTolerance
{
  return self->_accountFetchAfterTransactionWaitTolerance;
}

- (void)setAccountFetchAfterTransactionWaitTolerance:(double)a3
{
  self->_accountFetchAfterTransactionWaitTolerance = a3;
}

- (void)setTermsAcceptanceRequired:(BOOL)a3
{
  self->_termsAcceptanceRequired = a3;
}

- (void)setTermsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void)setTermsURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSURL)associatedPassURL
{
  return self->_associatedPassURL;
}

- (void)setAssociatedPassURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void)setAssociatedPassSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void)setAssociatedPassTypeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (int64_t)pendingPaymentCount
{
  return self->_pendingPaymentCount;
}

- (void)setPendingPaymentCount:(int64_t)a3
{
  self->_pendingPaymentCount = a3;
}

- (BOOL)identityVerificationForDisbursementsRequired
{
  return self->_identityVerificationForDisbursementsRequired;
}

- (void)setIdentityVerificationForDisbursementsRequired:(BOOL)a3
{
  self->_identityVerificationForDisbursementsRequired = a3;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void)setCloudStoreZoneNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (PKPeerPaymentAdditionalPushTopics)additionalPushTopics
{
  return self->_additionalPushTopics;
}

- (void)setAdditionalPushTopics:(id)a3
{
  objc_storeStrong((id *)&self->_additionalPushTopics, a3);
}

- (PKPeerPaymentAssociatedAccountInformation)associatedAccountInformation
{
  return self->_associatedAccountInformation;
}

- (BOOL)hasDisplayedAssociatedAccountActiveNotification
{
  return self->_hasDisplayedAssociatedAccountActiveNotification;
}

- (void)setHasDisplayedAssociatedAccountActiveNotification:(BOOL)a3
{
  self->_hasDisplayedAssociatedAccountActiveNotification = a3;
}

- (NSString)transactionSourceIdentifier
{
  return self->_transactionSourceIdentifier;
}

- (void)setTransactionSourceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (unint64_t)deviceScoreEncryptedPayloadVersion
{
  return self->_deviceScoreEncryptedPayloadVersion;
}

- (void)setDeviceScoreEncryptedPayloadVersion:(unint64_t)a3
{
  self->_deviceScoreEncryptedPayloadVersion = a3;
}

- (PKPeerPaymentPaymentModeIdentifiers)paymentModeIdentifiers
{
  return self->_paymentModeIdentifiers;
}

- (void)setPaymentModeIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_paymentModeIdentifiers, a3);
}

- (PKPeerPaymentEncryptionCertificatesVersions)encryptionCertificatesVersions
{
  return self->_encryptionCertificatesVersions;
}

- (void)setEncryptionCertificatesVersions:(id)a3
{
  objc_storeStrong((id *)&self->_encryptionCertificatesVersions, a3);
}

- (BOOL)hasRecurringPayments
{
  return self->_hasRecurringPayments;
}

- (void)setHasRecurringPayments:(BOOL)a3
{
  self->_hasRecurringPayments = a3;
}

- (NSSet)supportedFeatureDescriptors
{
  return self->_supportedFeatureDescriptors;
}

- (void)setSupportedFeatureDescriptors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedFeatureDescriptors, 0);
  objc_storeStrong((id *)&self->_encryptionCertificatesVersions, 0);
  objc_storeStrong((id *)&self->_paymentModeIdentifiers, 0);
  objc_storeStrong((id *)&self->_transactionSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedAccountInformation, 0);
  objc_storeStrong((id *)&self->_additionalPushTopics, 0);
  objc_storeStrong((id *)&self->_cloudStoreZoneNames, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_associatedPassTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedPassSerialNumber, 0);
  objc_storeStrong((id *)&self->_associatedPassURL, 0);
  objc_storeStrong((id *)&self->_termsURL, 0);
  objc_storeStrong((id *)&self->_termsIdentifier, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_amountRemainingUntilIdentityVerification, 0);
  objc_storeStrong((id *)&self->_maximumBalance, 0);
  objc_storeStrong((id *)&self->_currentBalance, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_identifiedDate, 0);
  objc_storeStrong((id *)&self->_createdDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)supportsLoadFromCard
{
  void *v2;
  BOOL v3;

  -[PKPeerPaymentAccount loadFromCardFeatureDescriptor](self, "loadFromCardFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)loadFromCardFeatureDescriptor
{
  return -[PKPeerPaymentAccount _featureWithIdentifier:](self, "_featureWithIdentifier:", CFSTR("loadFromCard"));
}

- (BOOL)supportsTransferToBank
{
  void *v2;
  BOOL v3;

  -[PKPeerPaymentAccount transferToBankFeatureDescriptor](self, "transferToBankFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)transferToBankFeatureDescriptor
{
  return -[PKPeerPaymentAccount _featureWithIdentifier:](self, "_featureWithIdentifier:", CFSTR("transferToBank"));
}

- (BOOL)supportsSendToUser
{
  void *v2;
  BOOL v3;

  -[PKPeerPaymentAccount sendToUserFeatureDescriptor](self, "sendToUserFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)sendToUserFeatureDescriptor
{
  return -[PKPeerPaymentAccount _featureWithIdentifier:](self, "_featureWithIdentifier:", CFSTR("sendToUser"));
}

- (BOOL)supportsRequestFromUser
{
  void *v2;
  BOOL v3;

  -[PKPeerPaymentAccount requestFromUserFeatureDescriptor](self, "requestFromUserFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)requestFromUserFeatureDescriptor
{
  return -[PKPeerPaymentAccount _featureWithIdentifier:](self, "_featureWithIdentifier:", CFSTR("requestFromUser"));
}

- (BOOL)supportsSendFromWallet
{
  void *v2;
  BOOL v3;

  -[PKPeerPaymentAccount sendFromWalletFeatureDescriptor](self, "sendFromWalletFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)sendFromWalletFeatureDescriptor
{
  return -[PKPeerPaymentAccount _featureWithIdentifier:](self, "_featureWithIdentifier:", CFSTR("sendFromWallet"));
}

- (BOOL)supportsRequestFromWallet
{
  void *v2;
  BOOL v3;

  -[PKPeerPaymentAccount requestFromWalletFeatureDescriptor](self, "requestFromWalletFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)requestFromWalletFeatureDescriptor
{
  return -[PKPeerPaymentAccount _featureWithIdentifier:](self, "_featureWithIdentifier:", CFSTR("requestFromWallet"));
}

- (BOOL)supportsPendingRequestAction
{
  void *v2;
  BOOL v3;

  -[PKPeerPaymentAccount pendingRequestActionFeatureDescriptor](self, "pendingRequestActionFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)pendingRequestActionFeatureDescriptor
{
  return -[PKPeerPaymentAccount _featureWithIdentifier:](self, "_featureWithIdentifier:", CFSTR("pendingRequestAction"));
}

- (BOOL)supportsRecurringPayments
{
  void *v2;
  BOOL v3;

  -[PKPeerPaymentAccount recurringPaymentsFeatureDescriptor](self, "recurringPaymentsFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)recurringPaymentsFeatureDescriptor
{
  return -[PKPeerPaymentAccount _featureWithIdentifier:](self, "_featureWithIdentifier:", CFSTR("recurringPayments"));
}

- (BOOL)supportsThresholdTopUp
{
  void *v2;
  BOOL v3;

  -[PKPeerPaymentAccount thresholdTopUpFeatureDescriptor](self, "thresholdTopUpFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)thresholdTopUpFeatureDescriptor
{
  return -[PKPeerPaymentAccount _featureWithIdentifier:](self, "_featureWithIdentifier:", CFSTR("thresholdTopUp"));
}

- (BOOL)supportsCardBalancePromotion
{
  void *v2;
  BOOL v3;

  -[PKPeerPaymentAccount cardBalancePromotionFeatureDescriptor](self, "cardBalancePromotionFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)cardBalancePromotionFeatureDescriptor
{
  return -[PKPeerPaymentAccount _featureWithIdentifier:](self, "_featureWithIdentifier:", CFSTR("cardBalancePromotion"));
}

- (BOOL)supportsInstantWithdrawal
{
  void *v2;
  BOOL v3;

  -[PKPeerPaymentAccount instantWithdrawalPromotionFeatureDescriptor](self, "instantWithdrawalPromotionFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)instantWithdrawalPromotionFeatureDescriptor
{
  return -[PKPeerPaymentAccount _featureWithIdentifier:](self, "_featureWithIdentifier:", CFSTR("instantWithdrawal"));
}

- (BOOL)supportsAssociatedAccountStateAction
{
  void *v2;
  BOOL v3;

  -[PKPeerPaymentAccount associatedAccountStateActionFeatureDescriptor](self, "associatedAccountStateActionFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)associatedAccountStateActionFeatureDescriptor
{
  return -[PKPeerPaymentAccount _featureWithIdentifier:](self, "_featureWithIdentifier:", CFSTR("associatedAccountStateAction"));
}

- (BOOL)supportsPreserveCurrentBalance
{
  void *v2;
  BOOL v3;

  -[PKPeerPaymentAccount preserveCurrentBalanceFeatureDescriptor](self, "preserveCurrentBalanceFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)preserveCurrentBalanceFeatureDescriptor
{
  return -[PKPeerPaymentAccount _featureWithIdentifier:](self, "_featureWithIdentifier:", CFSTR("preserveCurrentBalance"));
}

- (BOOL)supportsFamilySharing
{
  void *v2;
  BOOL v3;

  -[PKPeerPaymentAccount supportsFamilySharingFeatureDescriptor](self, "supportsFamilySharingFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)supportsFamilySharingFeatureDescriptor
{
  return -[PKPeerPaymentAccount _featureWithIdentifier:](self, "_featureWithIdentifier:", CFSTR("familySharing"));
}

- (BOOL)supportsGraduationWhileAssociatedAccountLocked
{
  void *v2;
  BOOL v3;

  -[PKPeerPaymentAccount supportsGraduationWhileAssociatedAccountLockedFeatureDescriptor](self, "supportsGraduationWhileAssociatedAccountLockedFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)supportsGraduationWhileAssociatedAccountLockedFeatureDescriptor
{
  return -[PKPeerPaymentAccount _featureWithIdentifier:](self, "_featureWithIdentifier:", CFSTR("graduationWhenAssociatedAccountLocked"));
}

- (BOOL)supportsDeviceTap
{
  void *v2;
  BOOL v3;

  -[PKPeerPaymentAccount deviceTapFeatureDescriptor](self, "deviceTapFeatureDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)deviceTapFeatureDescriptor
{
  return -[PKPeerPaymentAccount _featureWithIdentifier:](self, "_featureWithIdentifier:", CFSTR("deviceTap"));
}

- (id)_featureWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PKPeerPaymentAccount supportedFeatureDescriptors](self, "supportedFeatureDescriptors", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqualToString:", v4))
        {
          v11 = objc_msgSend(v9, "isSupported");

          if (v11)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        else
        {

        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
LABEL_12:

  return v6;
}

- (PKPeerPaymentAccount)initWithDictionary:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  PKPeerPaymentAccount *v7;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PKPeerPaymentAccount initWithDictionary:lastUpdated:](self, "initWithDictionary:lastUpdated:", v5, v6);

  return v7;
}

- (NSDictionary)minimumTransferAmounts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[PKPeerPaymentAccount currentBalance](self, "currentBalance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currency");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPeerPaymentAccount sendToUserFeatureDescriptor](self, "sendToUserFeatureDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minimumAmount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (v4 && v6)
  {
    v9 = v4;
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSDictionary *)v7;
}

- (NSDictionary)maximumTransferAmounts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[PKPeerPaymentAccount currentBalance](self, "currentBalance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currency");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPeerPaymentAccount sendToUserFeatureDescriptor](self, "sendToUserFeatureDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "maximumAmount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (v4 && v6)
  {
    v9 = v4;
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSDictionary *)v7;
}

@end
