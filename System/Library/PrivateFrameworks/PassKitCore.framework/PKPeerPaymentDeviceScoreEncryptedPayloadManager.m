@implementation PKPeerPaymentDeviceScoreEncryptedPayloadManager

+ (id)keyForDeviceScoreEncryptedPayloadVersion:(unint64_t)a3 endpointIdentifier:(id)a4 recipientAddress:(id)a5 quoteDestinationType:(unint64_t)a6
{
  id v9;
  id v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;

  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (a3 == 1)
  {
    v12 = off_1E2AD4218[PKPeerPaymentDeviceScoreTransactionTypeForEndpointIdentifier(v9, a6)];
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v12, v11);
      goto LABEL_7;
    }
  }
  else
  {
    if (!a3)
    {
      if (!v10)
      {
        v13 = (__CFString *)v9;
        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v9, v10);
LABEL_7:
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_10:
      v12 = v13;
      goto LABEL_11;
    }
    v12 = 0;
  }
LABEL_11:

  return v12;
}

- (PKPeerPaymentDeviceScoreEncryptedPayloadManager)initWithEndpointIdentifier:(id)a3 recipientAddress:(id)a4 deviceScoreEncryptedPayloadVersion:(unint64_t)a5 quoteDestinationType:(unint64_t)a6
{
  id v11;
  id v12;
  PKPeerPaymentDeviceScoreEncryptedPayloadManager *v13;
  PKPeerPaymentDeviceScoreEncryptedPayloadManager *v14;
  PKSecureElement *v15;
  PKSecureElement *secureElement;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PKPeerPaymentDeviceScoreEncryptedPayloadManager;
  v13 = -[PKPeerPaymentDeviceScoreEncryptedPayloadManager init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_endpointIdentifier, a3);
    objc_storeStrong((id *)&v14->_recipientAddress, a4);
    v14->_deviceScoreEncryptedPayloadVersion = 2;
    v14->_pendingDeviceScoreEncryptedPayloadVersion = 2;
    v15 = objc_alloc_init(PKSecureElement);
    secureElement = v14->_secureElement;
    v14->_secureElement = v15;

    v14->_quoteDestinationType = a6;
    -[PKPeerPaymentDeviceScoreEncryptedPayloadManager setDeviceScoreEncryptedPayloadVersion:](v14, "setDeviceScoreEncryptedPayloadVersion:", a5);
    -[PKPeerPaymentDeviceScoreEncryptedPayloadManager updateAttributesWithEndpointIdentifier:recipientAddress:quoteDestinationType:](v14, "updateAttributesWithEndpointIdentifier:recipientAddress:quoteDestinationType:", v14->_endpointIdentifier, v14->_recipientAddress, v14->_quoteDestinationType);
  }

  return v14;
}

- (void)updateAttributesWithEndpointIdentifier:(id)a3 recipientAddress:(id)a4 quoteDestinationType:(unint64_t)a5
{
  id v9;
  id v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  BOOL v14;
  _BOOL4 v15;
  void **p_recipientAddress;
  NSString *v17;
  NSString *v18;
  NSString *v19;
  BOOL v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  PKContactResolver *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  PKContactResolver *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _BOOL4 v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  char *v53;
  id v54;
  _QWORD v55[21];

  v55[19] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = self->_endpointIdentifier;
  v12 = (NSString *)v9;
  v13 = v12;
  if (v11 == v12)
  {

    goto LABEL_7;
  }
  if (v12 && v11)
  {
    v14 = -[NSString isEqualToString:](v11, "isEqualToString:", v12);

    if (!v14)
      goto LABEL_9;
LABEL_7:
    v15 = 0;
    goto LABEL_10;
  }

LABEL_9:
  objc_storeStrong((id *)&self->_endpointIdentifier, a3);
  v15 = self->_deviceScoreEncryptedPayloadVersion == 0;
LABEL_10:
  p_recipientAddress = (void **)&self->_recipientAddress;
  v17 = self->_recipientAddress;
  v18 = (NSString *)v10;
  v19 = v18;
  if (v17 == v18)
  {

    goto LABEL_18;
  }
  if (!v18 || !v17)
  {

    goto LABEL_17;
  }
  v20 = -[NSString isEqualToString:](v17, "isEqualToString:", v18);

  if (!v20)
  {
LABEL_17:
    objc_storeStrong((id *)&self->_recipientAddress, a4);
    v15 = self->_deviceScoreEncryptedPayloadVersion == 0;
  }
LABEL_18:
  if (self->_quoteDestinationType == a5)
  {
    if (!v15)
      goto LABEL_23;
  }
  else
  {
    self->_quoteDestinationType = a5;
  }
  -[PKPeerPaymentDeviceScoreEncryptedPayloadManager _setupDeviceScoreService](self, "_setupDeviceScoreService");
LABEL_23:
  if (self->_odiServiceProviderAssessment && self->_deviceScoreEncryptedPayloadVersion == 1)
  {
    v21 = objc_alloc_init(MEMORY[0x1E0D17580]);
    v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[PKAppleAccountManager sharedInstance](PKAppleAccountManager, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "appleAccountInformation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "firstName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v24, "firstName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKey:", v26, *MEMORY[0x1E0D17698]);

    }
    objc_msgSend(v24, "lastName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(v24, "lastName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKey:", v28, *MEMORY[0x1E0D176B8]);

    }
    if (!*p_recipientAddress)
    {
LABEL_42:
      v53 = (char *)&loc_1901E2F0C
          + 4
          * byte_190455740[PKPeerPaymentDeviceScoreTransactionTypeForEndpointIdentifier(self->_endpointIdentifier, self->_quoteDestinationType)];
      __asm { BR              X10 }
    }
    v54 = v21;
    v29 = [PKContactResolver alloc];
    v30 = objc_alloc_init(MEMORY[0x1E0C97298]);
    v31 = *MEMORY[0x1E0C966C0];
    v55[0] = *MEMORY[0x1E0C966D0];
    v55[1] = v31;
    v32 = *MEMORY[0x1E0C966A8];
    v55[2] = *MEMORY[0x1E0C967C0];
    v55[3] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[PKContactResolver initWithContactStore:keysToFetch:](v29, "initWithContactStore:keysToFetch:", v30, v33);

    -[PKContactResolver contactForHandle:](v34, "contactForHandle:", *p_recipientAddress);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v35)
    {
      objc_msgSend(v35, "givenName");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
      {
        objc_msgSend(v36, "givenName");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKey:", v38, *MEMORY[0x1E0D17600]);

      }
      objc_msgSend(v36, "familyName", v54);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        objc_msgSend(v36, "familyName");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKey:", v40, *MEMORY[0x1E0D17608]);

      }
    }
    v41 = PKIsEmailAddress(*p_recipientAddress);
    v42 = *p_recipientAddress;
    if (v41)
    {
      objc_msgSend(v22, "setObject:forKey:", v42, *MEMORY[0x1E0D175F8]);
      objc_msgSend(v36, "phoneNumbers");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "count");

      if (v44)
      {
        objc_msgSend(v36, "phoneNumbers");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "firstObject");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "value");
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v47, "stringValue");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKey:", v48, *MEMORY[0x1E0D17610]);

LABEL_40:
      }
    }
    else
    {
      objc_msgSend(v22, "setObject:forKey:", v42, *MEMORY[0x1E0D17610]);
      objc_msgSend(v36, "emailAddresses");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "count");

      if (v50)
      {
        objc_msgSend(v36, "emailAddresses");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "firstObject");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "value");
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "setObject:forKey:", v47, *MEMORY[0x1E0D175F8]);
        goto LABEL_40;
      }
    }

    goto LABEL_42;
  }

}

- (void)deviceScoreWithCompletion:(id)a3
{
  id v4;
  NSString *recipientAddress;
  NSString *v6;
  NSString *v7;
  unint64_t deviceScoreEncryptedPayloadVersion;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  PKODIServiceProviderAssessment *odiServiceProviderAssessment;
  _QWORD v13[4];
  NSString *v14;
  PKPeerPaymentDeviceScoreEncryptedPayloadManager *v15;
  id v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_isScoringInProgress = 1;
  recipientAddress = self->_recipientAddress;
  if (recipientAddress)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), self->_endpointIdentifier, recipientAddress);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = self->_endpointIdentifier;
  }
  v7 = v6;
  if ((__CFString *)self->_endpointIdentifier == CFSTR("registration"))
    goto LABEL_7;
  deviceScoreEncryptedPayloadVersion = self->_deviceScoreEncryptedPayloadVersion;
  if (deviceScoreEncryptedPayloadVersion == 1)
  {
    objc_msgSend((id)objc_opt_class(), "keyForDeviceScoreEncryptedPayloadVersion:endpointIdentifier:recipientAddress:quoteDestinationType:", self->_deviceScoreEncryptedPayloadVersion, self->_endpointIdentifier, self->_recipientAddress, self->_quoteDestinationType);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    PKLogFacilityTypeGetObject(0xBuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v9;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentDeviceScoreEncryptedPayloadManager: Score: Calling computeAssessment and waitForAssessmentWithContinueBlock: for key: %@.", buf, 0xCu);
    }

    v11 = mach_absolute_time();
    -[PKODIAssessment computeAssessment](self->_odiServiceProviderAssessment, "computeAssessment");
    odiServiceProviderAssessment = self->_odiServiceProviderAssessment;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __77__PKPeerPaymentDeviceScoreEncryptedPayloadManager_deviceScoreWithCompletion___block_invoke;
    v13[3] = &unk_1E2AD41A8;
    v7 = v9;
    v14 = v7;
    v15 = self;
    v17 = v11;
    v16 = v4;
    -[PKODIAssessment waitForAssessmentWithContinueBlock:](odiServiceProviderAssessment, "waitForAssessmentWithContinueBlock:", v13);

  }
  else if (!deviceScoreEncryptedPayloadVersion)
  {
LABEL_7:
    -[PKPeerPaymentDeviceScoreEncryptedPayloadManager _cristalV1DeviceScoreWithKey:completion:](self, "_cristalV1DeviceScoreWithKey:completion:", v6, v4);
  }

}

void __77__PKPeerPaymentDeviceScoreEncryptedPayloadManager_deviceScoreWithCompletion___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  NSObject *v6;
  double v7;
  void *v8;
  uint64_t v9;
  double v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  double v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(double *)(a1 + 32);
      v13 = 138412290;
      v14 = v7;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentDeviceScoreEncryptedPayloadManager: Score: waitForAssessmentWithContinueBlock: Did timeout for key: %@. Calling completion with error", (uint8_t *)&v13, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "_errorForUnavailableDeviceScoreWithUnderlyingError:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9 = mach_absolute_time();
  v10 = PKSecondsFromMachTimeInterval(v9 - *(_QWORD *)(a1 + 56));
  PKLogFacilityTypeGetObject(0xBuLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = 134218242;
    v14 = v10;
    v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentDeviceScoreEncryptedPayloadManager: Score response took: %gs for key: %@.", (uint8_t *)&v13, 0x16u);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 8) = 0;
  objc_msgSend(*(id *)(a1 + 40), "setDeviceScoreEncryptedPayloadVersion:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)provideSessionFeedbackWithIngested:(BOOL)a3
{
  PKODIServiceProviderAssessment *odiServiceProviderAssessment;
  _BOOL4 v5;
  uint64_t v6;

  odiServiceProviderAssessment = self->_odiServiceProviderAssessment;
  if (odiServiceProviderAssessment)
  {
    v5 = a3;
    if (-[PKODIAssessment currentAssessmentDidTimeout](odiServiceProviderAssessment, "currentAssessmentDidTimeout"))
      v6 = 2;
    else
      v6 = !v5;
    -[PKODIAssessment provideSessionFeedback:](self->_odiServiceProviderAssessment, "provideSessionFeedback:", v6);
  }
}

- (void)setDeviceScoreEncryptedPayloadVersion:(unint64_t)a3
{
  uint64_t v5;
  unint64_t v6;

  if (PKForcePeerPaymentDeviceScoreVersion())
  {
    v5 = PKGetPeerPaymentDeviceScoreVersion();
    v6 = 1;
    if (v5 != 1)
      v6 = 2;
    if (v5)
      a3 = v6;
    else
      a3 = 0;
  }
  if (self->_deviceScoreEncryptedPayloadVersion != a3)
  {
    if (self->_isScoringInProgress)
    {
      self->_pendingDeviceScoreEncryptedPayloadVersion = a3;
    }
    else
    {
      self->_deviceScoreEncryptedPayloadVersion = a3;
      self->_pendingDeviceScoreEncryptedPayloadVersion = a3;
      -[PKPeerPaymentDeviceScoreEncryptedPayloadManager _setupDeviceScoreService](self, "_setupDeviceScoreService");
    }
  }
}

- (void)_setupDeviceScoreService
{
  NSObject *v3;
  unint64_t deviceScoreEncryptedPayloadVersion;
  NSString *endpointIdentifier;
  unint64_t v6;
  void *odiServiceProviderAssessment;
  PKDeviceScorer *v8;
  PKDeviceScorer *deviceScorer;
  unint64_t quoteDestinationType;
  NSString *v11;
  __CFString *v12;
  __CFString *v13;
  _BOOL4 v14;
  uint64_t v15;
  id *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  int v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  char v26;
  PKODIServiceProviderAssessment *v27;
  PKODIServiceProviderAssessment *v28;
  PKODIServiceProviderAssessment *v29;
  void *v30;
  __CFString *v31;
  __CFString *v32;
  __CFString *v33;
  char v34;
  __CFString *v35;
  __CFString *v36;
  __CFString *v37;
  char v38;
  int v39;
  unint64_t v40;
  __int16 v41;
  NSString *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0xBuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    deviceScoreEncryptedPayloadVersion = self->_deviceScoreEncryptedPayloadVersion;
    endpointIdentifier = self->_endpointIdentifier;
    v39 = 134218242;
    v40 = deviceScoreEncryptedPayloadVersion;
    v41 = 2112;
    v42 = endpointIdentifier;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentDeviceScoreEncryptedPayloadManager: Score: Calling _setupDeviceScoreService with payload version: %lu, endpointIdentifier: %@.", (uint8_t *)&v39, 0x16u);
  }

  v6 = self->_deviceScoreEncryptedPayloadVersion;
  if (v6 == 1)
  {
    if ((__CFString *)self->_endpointIdentifier == CFSTR("registration"))
    {
      odiServiceProviderAssessment = self->_odiServiceProviderAssessment;
      self->_odiServiceProviderAssessment = 0;
LABEL_38:
      v15 = 24;
      goto LABEL_39;
    }
    PKPassKitCoreBundle();
    odiServiceProviderAssessment = (void *)objc_claimAutoreleasedReturnValue();
    quoteDestinationType = self->_quoteDestinationType;
    v11 = self->_endpointIdentifier;
    v12 = CFSTR("requestToken");
    if (v12 == (__CFString *)v11)
    {

    }
    else
    {
      v13 = v12;
      if (!v11 || !v12)
      {

LABEL_19:
        v17 = v11;
        v18 = CFSTR("identityVerification");
        if (v18 == v17)
        {

        }
        else
        {
          v19 = v18;
          if (!v11 || !v18)
          {

LABEL_42:
            v31 = v17;
            v32 = CFSTR("quote");
            if (v32 == v31)
              goto LABEL_53;
            v33 = v32;
            if (v11 && v32)
            {
              v34 = -[__CFString isEqualToString:](v31, "isEqualToString:", v32);

              if ((v34 & 1) != 0)
                goto LABEL_54;
            }
            else
            {

            }
            v35 = v31;
            v36 = CFSTR("performQuote");
            if (v36 == v35)
            {
LABEL_53:

            }
            else
            {
              v37 = v36;
              if (!v11 || !v36)
              {

LABEL_57:
                v21 = 0;
LABEL_27:

                -[PKODIServiceProviderAssessment serviceIdentifier](self->_odiServiceProviderAssessment, "serviceIdentifier");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = v21;
                v24 = v22;
                if (v23 != v24)
                {
                  v25 = v24;
                  if (v23 && v24)
                  {
                    v26 = objc_msgSend(v23, "isEqualToString:", v24);

                    if ((v26 & 1) != 0)
                      goto LABEL_37;
                  }
                  else
                  {

                  }
                  v27 = self->_odiServiceProviderAssessment;
                  if (v27)
                  {
                    -[PKODIServiceProviderAssessment setServiceIdentifier:](v27, "setServiceIdentifier:", v23);
                  }
                  else
                  {
                    v28 = -[PKODIServiceProviderAssessment initWithServiceProviderIdentifier:locationBundle:]([PKODIServiceProviderAssessment alloc], "initWithServiceProviderIdentifier:locationBundle:", v23, odiServiceProviderAssessment);
                    v29 = self->_odiServiceProviderAssessment;
                    self->_odiServiceProviderAssessment = v28;

                    -[PKODIAssessment startAssessment](self->_odiServiceProviderAssessment, "startAssessment");
                  }
                  goto LABEL_37;
                }

LABEL_37:
                goto LABEL_38;
              }
              v38 = -[__CFString isEqualToString:](v35, "isEqualToString:", v36);

              if ((v38 & 1) == 0)
                goto LABEL_57;
            }
LABEL_54:
            switch(quoteDestinationType)
            {
              case 0uLL:
              case 1uLL:
                goto LABEL_17;
              case 2uLL:
              case 4uLL:
                v16 = (id *)MEMORY[0x1E0D176D8];
                goto LABEL_26;
              case 3uLL:
                v16 = (id *)MEMORY[0x1E0D176F8];
                goto LABEL_26;
              case 5uLL:
                v16 = (id *)MEMORY[0x1E0D176F0];
                goto LABEL_26;
              default:
                goto LABEL_57;
            }
          }
          v20 = -[__CFString isEqualToString:](v17, "isEqualToString:", v18);

          if (!v20)
            goto LABEL_42;
        }
        v16 = (id *)MEMORY[0x1E0D176E0];
LABEL_26:
        v21 = *v16;
        goto LABEL_27;
      }
      v14 = -[NSString isEqualToString:](v11, "isEqualToString:", v12);

      if (!v14)
        goto LABEL_19;
    }
LABEL_17:
    v16 = (id *)MEMORY[0x1E0D176E8];
    goto LABEL_26;
  }
  if (v6)
    return;
  if (+[PKDeviceScorer deviceScoringSupported](PKDeviceScorer, "deviceScoringSupported"))
  {
    -[PKPeerPaymentDeviceScoreEncryptedPayloadManager _createContextForDeviceScorer](self, "_createContextForDeviceScorer");
    odiServiceProviderAssessment = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PKDeviceScorer initWithContext:]([PKDeviceScorer alloc], "initWithContext:", odiServiceProviderAssessment);
    deviceScorer = self->_deviceScorer;
    self->_deviceScorer = v8;

  }
  else
  {
    odiServiceProviderAssessment = self->_deviceScorer;
    self->_deviceScorer = 0;
  }
  v15 = 32;
LABEL_39:

  v30 = *(Class *)((char *)&self->super.isa + v15);
  *(Class *)((char *)&self->super.isa + v15) = 0;

}

- (void)_cristalV1DeviceScoreWithKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PKSecureElement *secureElement;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (+[PKDeviceScorer deviceScoringSupported](PKDeviceScorer, "deviceScoringSupported"))
  {
    secureElement = self->_secureElement;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __91__PKPeerPaymentDeviceScoreEncryptedPayloadManager__cristalV1DeviceScoreWithKey_completion___block_invoke;
    v11[3] = &unk_1E2AD41F8;
    v11[4] = self;
    v12 = v6;
    v13 = v7;
    -[PKSecureElement SEPPairingInfoWithCompletion:](secureElement, "SEPPairingInfoWithCompletion:", v11);

  }
  else
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentDeviceScoreEncryptedPayloadManager: Score: Device scoring not supported for key: %@. Calling completion", buf, 0xCu);
    }

    self->_isScoringInProgress = 0;
    -[PKPeerPaymentDeviceScoreEncryptedPayloadManager setDeviceScoreEncryptedPayloadVersion:](self, "setDeviceScoreEncryptedPayloadVersion:", self->_pendingDeviceScoreEncryptedPayloadVersion);
    -[PKPeerPaymentDeviceScoreEncryptedPayloadManager _errorForUnavailableDeviceScoreWithUnderlyingError:](self, "_errorForUnavailableDeviceScoreWithUnderlyingError:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, 0, v10);

  }
}

void __91__PKPeerPaymentDeviceScoreEncryptedPayloadManager__cristalV1DeviceScoreWithKey_completion___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!a2)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v25 = v16;
      v17 = "PKPeerPaymentDeviceScoreEncryptedPayloadManager: Score: Failed to fetch cryptogram and challengeResponse for"
            " key: %@. Calling completion with error.";
LABEL_10:
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);
    }
LABEL_11:

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
    objc_msgSend(*(id *)(a1 + 32), "setDeviceScoreEncryptedPayloadVersion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    v19 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "_errorForUnavailableDeviceScoreWithUnderlyingError:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v19 + 16))(v19, 0, 0, 0, v20);

    goto LABEL_12;
  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  PKLogFacilityTypeGetObject(0xBuLL);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v9)
  {
    if (v11)
    {
      v18 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v25 = v18;
      v17 = "PKPeerPaymentDeviceScoreEncryptedPayloadManager: Score: nil _deviceScorer for key: %@. Calling completion";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (v11)
  {
    v12 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v25 = v12;
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentDeviceScoreEncryptedPayloadManager: Score: Successfully fetched cryptogram and challengeResponse for key: %@. Calling peerPaymentDeviceScoreWithCryptogram:challengeResponse:completion:.", buf, 0xCu);
  }

  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(a1 + 40);
  v15 = *(void **)(v13 + 24);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __91__PKPeerPaymentDeviceScoreEncryptedPayloadManager__cristalV1DeviceScoreWithKey_completion___block_invoke_27;
  v21[3] = &unk_1E2AD41D0;
  v21[4] = v13;
  v22 = v14;
  v23 = *(id *)(a1 + 48);
  objc_msgSend(v15, "peerPaymentDeviceScoreWithCryptogram:challengeResponse:completion:", v7, v8, v21);

LABEL_12:
}

void __91__PKPeerPaymentDeviceScoreEncryptedPayloadManager__cristalV1DeviceScoreWithKey_completion___block_invoke_27(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  PKLogFacilityTypeGetObject(0xBuLL);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v11)
    {
      v12 = *(_QWORD *)(a1 + 40);
      v16 = 138412290;
      v17 = v12;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentDeviceScoreEncryptedPayloadManager: Score: peerPaymentDeviceScoreWithCryptogram: successfully returned a deviceScore for key: %@. Calling completion with score.", (uint8_t *)&v16, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
    objc_msgSend(*(id *)(a1 + 32), "setDeviceScoreEncryptedPayloadVersion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (v11)
    {
      v13 = *(_QWORD *)(a1 + 40);
      v16 = 138412290;
      v17 = v13;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentDeviceScoreEncryptedPayloadManager: Score: peerPaymentDeviceScoreWithCryptogram: failed to return a deviceScore for key: %@. Calling completion with error.", (uint8_t *)&v16, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
    objc_msgSend(*(id *)(a1 + 32), "setDeviceScoreEncryptedPayloadVersion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    v14 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "_errorForUnavailableDeviceScoreWithUnderlyingError:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v14 + 16))(v14, 0, 0, 0, v15);

  }
}

- (id)_createContextForDeviceScorer
{
  PKDSPContext *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t recipientAddress;
  void *v8;
  int v9;

  v3 = objc_alloc_init(PKDSPContext);
  +[PKAppleAccountManager sharedInstance](PKAppleAccountManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appleAccountInformation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDSPContext setPrimaryAppleAccount:](v3, "setPrimaryAppleAccount:", v5);

  -[PKSecureElement primarySecureElementIdentifier](self->_secureElement, "primarySecureElementIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDSPContext setSecureElementID:](v3, "setSecureElementID:", v6);

  if (self->_endpointIdentifier)
    -[PKDSPContext setServerEndpointIdentifier:](v3, "setServerEndpointIdentifier:");
  recipientAddress = (uint64_t)self->_recipientAddress;
  if (recipientAddress)
  {
    -[PKDSPContext setPeerPaymentRecipientAddress:](v3, "setPeerPaymentRecipientAddress:");
    if (self->_recipientAddress)
    {
      +[PKPeerPaymentRecipientCache sharedCache](PKPeerPaymentRecipientCache, "sharedCache");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "lowFrequencyDeviceScoreSubmissionRequiredForRecipientAddress:", self->_recipientAddress);

      if (v9)
        recipientAddress = 1;
      else
        recipientAddress = 2;
    }
    else
    {
      recipientAddress = 0;
    }
  }
  -[PKDSPContext setEventFrequency:](v3, "setEventFrequency:", recipientAddress);
  return v3;
}

- (id)_errorForUnavailableDeviceScoreWithUnderlyingError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_GENERIC_ERROR_TITLE"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_GENERIC_ERROR_MESSAGE"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", CFSTR("\n\n(Internal Only: Device Score Unavailable)"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0CB2D68]);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CB2D80]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %@"), v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB2D50]);

  if (v3)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0CB3388]);
  v9 = (void *)MEMORY[0x1E0CB35C8];
  v10 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -7000, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)deviceScoreEncryptedPayloadVersion
{
  return self->_deviceScoreEncryptedPayloadVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientAddress, 0);
  objc_storeStrong((id *)&self->_endpointIdentifier, 0);
  objc_storeStrong((id *)&self->_secureElement, 0);
  objc_storeStrong((id *)&self->_odiServiceProviderAssessment, 0);
  objc_storeStrong((id *)&self->_deviceScorer, 0);
}

@end
