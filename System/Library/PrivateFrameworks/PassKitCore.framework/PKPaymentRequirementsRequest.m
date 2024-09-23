@implementation PKPaymentRequirementsRequest

- (PKPaymentRequirementsRequest)initWithPaymentCredential:(id)a3
{
  id v5;
  PKPaymentRequirementsRequest *v6;
  PKPaymentRequirementsRequest *v7;
  void *v8;
  uint64_t v9;
  NSString *region;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentRequirementsRequest;
  v6 = -[PKOverlayableWebServiceRequest init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_paymentCredential, a3);
    objc_msgSend(v5, "underlyingPaymentPass");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "passTypeIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    region = v7->_region;
    v7->_region = (NSString *)v9;

  }
  return v7;
}

- (PKPaymentRequirementsRequest)initWithCardholderName:(id)a3 primaryAccountNumber:(id)a4
{
  id v6;
  id v7;
  PKPaymentRequirementsRequest *v8;
  uint64_t v9;
  NSString *cardholderName;
  uint64_t v11;
  NSString *primaryAccountNumber;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentRequirementsRequest;
  v8 = -[PKOverlayableWebServiceRequest init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    cardholderName = v8->_cardholderName;
    v8->_cardholderName = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    primaryAccountNumber = v8->_primaryAccountNumber;
    v8->_primaryAccountNumber = (NSString *)v11;

  }
  return v8;
}

- (id)_cardDictionary
{
  void *v3;
  PKPaymentCredential *paymentCredential;
  _BOOL4 v5;
  PKPaymentCredential *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _BOOL4 v10;
  PKPaymentCredential *v11;
  void *v12;
  _BOOL4 v13;
  PKPaymentCredential *v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *cardholderName;
  NSString *primaryAccountNumber;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  paymentCredential = self->_paymentCredential;
  if (paymentCredential)
  {
    v5 = -[PKPaymentCredential isContactlessProductCredential](paymentCredential, "isContactlessProductCredential");
    v6 = self->_paymentCredential;
    if (v5)
    {
      -[PKPaymentCredential contactlessProductCredential](v6, "contactlessProductCredential");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cardSessionToken");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
LABEL_17:

        return v3;
      }
      v9 = CFSTR("cardSessionToken");
LABEL_5:
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, v9);
      goto LABEL_17;
    }
    if (v6)
    {
      v10 = -[PKPaymentCredential isDigitalIssuanceProductCredential](v6, "isDigitalIssuanceProductCredential");
      v11 = self->_paymentCredential;
      if (v10)
      {
        -[PKPaymentCredential digitalIssuanceProductCredential](v11, "digitalIssuanceProductCredential");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
        v7 = v12;
        objc_msgSend(v12, "purchase");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "partnerMetadata");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("provisioningToken"));
        if (v16)
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("metadata"));

        goto LABEL_17;
      }
      if (v11)
      {
        v13 = -[PKPaymentCredential isPurchasedProductCredential](v11, "isPurchasedProductCredential");
        v14 = self->_paymentCredential;
        if (v13)
        {
          -[PKPaymentCredential purchasedProductCredential](v14, "purchasedProductCredential");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        }
        if (v14 && -[PKPaymentCredential isSafariCredential](v14, "isSafariCredential"))
        {
          -[PKPaymentCredential safariCredential](self->_paymentCredential, "safariCredential");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "cardholderName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("name"));

          objc_msgSend(v7, "cardNumber");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = CFSTR("primaryAccountNumber");
          goto LABEL_5;
        }
      }
    }
  }
  cardholderName = self->_cardholderName;
  if (cardholderName)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", cardholderName, CFSTR("name"));
  primaryAccountNumber = self->_primaryAccountNumber;
  if (primaryAccountNumber)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", primaryAccountNumber, CFSTR("primaryAccountNumber"));
  return v3;
}

- (void)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5 certChain:(id)a6 devSigned:(BOOL)a7 deviceData:(id)a8 webService:(id)a9 completion:(id)a10
{
  _BOOL8 v11;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  PKPaymentCredential *paymentCredential;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSString *referrerIdentifier;
  void *v30;
  int v31;
  PKPaymentCredential *v32;
  PKPaymentCredential *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  PKPaymentCredential *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  _BOOL4 v58;
  void *v59;
  void *v60;
  _BOOL4 context;
  void *contexta;
  void *contextb;
  void *contextc;
  id v65;
  id v66;
  _QWORD v67[5];
  id v68;
  uint64_t *v69;
  uint8_t buf[8];
  _QWORD v71[4];
  id v72;
  PKPaymentRequirementsRequest *v73;
  id v74;
  id v75;
  uint64_t *v76;
  _QWORD aBlock[5];
  id v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  _QWORD v85[3];
  _QWORD v86[5];
  _QWORD v87[5];
  _QWORD v88[6];
  _QWORD v89[7];

  v11 = a7;
  v89[5] = *MEMORY[0x1E0C80C00];
  v65 = a3;
  v66 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  v79 = 0;
  v80 = &v79;
  v81 = 0x3032000000;
  v82 = __Block_byref_object_copy__52;
  v83 = __Block_byref_object_dispose__52;
  v21 = MEMORY[0x1E0C809B0];
  v84 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __152__PKPaymentRequirementsRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation_certChain_devSigned_deviceData_webService_completion___block_invoke;
  aBlock[3] = &unk_1E2ACC1A0;
  aBlock[4] = self;
  v22 = v20;
  v78 = v22;
  v23 = _Block_copy(aBlock);
  paymentCredential = self->_paymentCredential;
  if (paymentCredential
    && !-[PKPaymentCredential isContactlessProductCredential](paymentCredential, "isContactlessProductCredential")
    && !-[PKPaymentCredential isDigitalIssuanceProductCredential](self->_paymentCredential, "isDigitalIssuanceProductCredential")&& !-[PKPaymentCredential isPurchasedProductCredential](self->_paymentCredential, "isPurchasedProductCredential")&& !-[PKPaymentCredential isSafariCredential](self->_paymentCredential, "isSafariCredential"))
  {
    context = -[PKPaymentCredential isRemoteCredential](self->_paymentCredential, "isRemoteCredential");
    v31 = context | -[PKPaymentCredential isLocalPassCredential](self->_paymentCredential, "isLocalPassCredential");
    v32 = self->_paymentCredential;
    if (v31 == 1)
    {
      v58 = -[PKPaymentCredential couldSupportSuperEasyProvisioning](v32, "couldSupportSuperEasyProvisioning");
      v33 = self->_paymentCredential;
      if (context)
      {
        -[PKPaymentCredential remoteCredential](v33, "remoteCredential");
        contexta = (void *)objc_claimAutoreleasedReturnValue();
        v89[0] = CFSTR("devices");
        v89[1] = v66;
        v89[2] = CFSTR("cards");
        objc_msgSend(contexta, "identifier");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v89[3] = v59;
        v89[4] = CFSTR("provisioningRequirements");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 5);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v65, v34, 0, v16);
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = (void *)v80[5];
        v80[5] = v35;

      }
      else
      {
        -[PKPaymentCredential localPassCredential](v33, "localPassCredential");
        contexta = (void *)objc_claimAutoreleasedReturnValue();
        v88[0] = CFSTR("devices");
        v88[1] = v66;
        v88[2] = CFSTR("passes");
        objc_msgSend(contexta, "passTypeIdentifier");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v88[3] = v59;
        objc_msgSend(contexta, "serialNumber");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v88[4] = v57;
        v88[5] = CFSTR("provisioningRequirements");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 6);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v65, v48, 0, v16);
        v49 = objc_claimAutoreleasedReturnValue();
        v50 = (void *)v80[5];
        v80[5] = v49;

      }
      objc_msgSend(contexta, "state");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "useNonce");
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      v51 = (void *)v80[5];
      if (v58)
      {
        objc_msgSend(v51, "setHTTPMethod:", CFSTR("POST"));
        contextc = (void *)MEMORY[0x19400CFE8](objc_msgSend((id)v80[5], "setValue:forHTTPHeaderField:", CFSTR("application/binary"), CFSTR("Content-Type")));
        v71[0] = v21;
        v71[1] = 3221225472;
        v71[2] = __152__PKPaymentRequirementsRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation_certChain_devSigned_deviceData_webService_completion___block_invoke_2;
        v71[3] = &unk_1E2AD4428;
        v72 = v18;
        v73 = self;
        v74 = v60;
        v76 = &v79;
        v75 = v23;
        -[PKPaymentRequirementsRequest _encryptedDataWithDeviceData:certChain:devSigned:includeDeviceScore:inWebService:withCompletion:](self, "_encryptedDataWithDeviceData:certChain:devSigned:includeDeviceScore:inWebService:withCompletion:", v72, v17, v11, 1, v19, v71);

        objc_autoreleasePoolPop(contextc);
      }
      else
      {
        objc_msgSend(v51, "setHTTPMethod:", CFSTR("GET"));
        (*((void (**)(void *, uint64_t))v23 + 2))(v23, v80[5]);
      }

      goto LABEL_9;
    }
    v38 = -[PKPaymentCredential isAccountCredential](v32, "isAccountCredential");
    v39 = self->_paymentCredential;
    if (v38)
    {
      -[PKPaymentCredential accountCredential](v39, "accountCredential");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "passDetailsResponse");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "provisioningIdentifier");
      contextb = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(contextb, "length"))
      {
        PKLogFacilityTypeGetObject(0xEuLL);
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18FC92000, v42, OS_LOG_TYPE_DEFAULT, "Error: Missing provisioning identifier for requirements request", buf, 2u);
        }

      }
      if (!objc_msgSend(v66, "length"))
      {
        PKLogFacilityTypeGetObject(0xEuLL);
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18FC92000, v43, OS_LOG_TYPE_DEFAULT, "Error: Missing device identifier for requirements request", buf, 2u);
        }

      }
      v87[0] = CFSTR("devices");
      v87[1] = v66;
      v87[2] = CFSTR("cards");
      v87[3] = contextb;
      v87[4] = CFSTR("provisioningRequirements");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 5);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v65, v44, 0, v16);
      v45 = objc_claimAutoreleasedReturnValue();
      v46 = (void *)v80[5];
      v80[5] = v45;

      objc_msgSend((id)v80[5], "setHTTPMethod:", CFSTR("GET"));
      if (!v80[5])
      {
        PKLogFacilityTypeGetObject(0xEuLL);
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18FC92000, v47, OS_LOG_TYPE_DEFAULT, "Error: Could not generate requirements request", buf, 2u);
        }

      }
    }
    else
    {
      if (!-[PKPaymentCredential isPeerPaymentCredential](v39, "isPeerPaymentCredential"))
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unknown PKPaymentCredential type."));
        goto LABEL_35;
      }
      -[PKPaymentCredential peerPaymentCredential](self->_paymentCredential, "peerPaymentCredential");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "passDetailsResponse");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "remoteCredential");
      contextb = (void *)objc_claimAutoreleasedReturnValue();

      v86[0] = CFSTR("devices");
      v86[1] = v66;
      v86[2] = CFSTR("cards");
      objc_msgSend(contextb, "identifier");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v86[3] = v53;
      v86[4] = CFSTR("provisioningRequirements");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 5);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v65, v54, 0, v16);
      v55 = objc_claimAutoreleasedReturnValue();
      v56 = (void *)v80[5];
      v80[5] = v55;

      objc_msgSend((id)v80[5], "setHTTPMethod:", CFSTR("GET"));
    }

LABEL_35:
    (*((void (**)(void *, uint64_t))v23 + 2))(v23, v80[5]);
    goto LABEL_9;
  }
  v85[0] = CFSTR("devices");
  v85[1] = v66;
  v85[2] = CFSTR("provisioningRequirements");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v65, v25, 0, v16);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v80[5];
  v80[5] = v26;

  objc_msgSend((id)v80[5], "setHTTPMethod:", CFSTR("POST"));
  v28 = objc_msgSend((id)v80[5], "setValue:forHTTPHeaderField:", CFSTR("application/binary"), CFSTR("Content-Type"));
  referrerIdentifier = self->_referrerIdentifier;
  if (referrerIdentifier)
    v28 = objc_msgSend((id)v80[5], "setValue:forHTTPHeaderField:", referrerIdentifier, CFSTR("x-apple-referrer-identifier"));
  v30 = (void *)MEMORY[0x19400CFE8](v28);
  v67[0] = v21;
  v67[1] = 3221225472;
  v67[2] = __152__PKPaymentRequirementsRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation_certChain_devSigned_deviceData_webService_completion___block_invoke_273;
  v67[3] = &unk_1E2AD4450;
  v67[4] = self;
  v69 = &v79;
  v68 = v23;
  -[PKPaymentRequirementsRequest _encryptedDataWithDeviceData:certChain:devSigned:includeDeviceScore:inWebService:withCompletion:](self, "_encryptedDataWithDeviceData:certChain:devSigned:includeDeviceScore:inWebService:withCompletion:", v18, v17, v11, 0, v19, v67);

  objc_autoreleasePoolPop(v30);
LABEL_9:

  _Block_object_dispose(&v79, 8);
}

void __152__PKPaymentRequirementsRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation_certChain_devSigned_deviceData_webService_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 128);
  v10 = v3;
  if (v5)
  {
    objc_msgSend(v3, "setValue:forHTTPHeaderField:", v5, CFSTR("x-apple-referrer-identifier"));
    v4 = *(_QWORD *)(a1 + 32);
  }
  v6 = *(_QWORD *)(v4 + 160);
  if (v6)
    objc_msgSend(v10, "setValue:forHTTPHeaderField:", v6, CFSTR("X-Apple-Ownership-Token"));
  v7 = *(_QWORD *)(a1 + 40);
  v8 = v10;
  if (v7)
  {
    v9 = (void *)objc_msgSend(v10, "copy");
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v9);

    v8 = v10;
  }

}

void __152__PKPaymentRequirementsRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation_certChain_devSigned_deviceData_webService_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
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
  id v14;

  v14 = (id)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "phoneNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setValue:forKey:", v3, CFSTR("devicePhoneNumber"));

  objc_msgSend(*(id *)(a1 + 32), "signedPhoneNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setValue:forKey:", v4, CFSTR("signedDevicePhoneNumber"));

  objc_msgSend(*(id *)(a1 + 32), "signedPhoneNumberVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setValue:forKey:", v5, CFSTR("signedDevicePhoneNumberVersion"));

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 40) + 88))
  {
    objc_msgSend(*(id *)(a1 + 32), "deviceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setValue:forKey:", v6, CFSTR("deviceName"));

    objc_msgSend(*(id *)(a1 + 32), "extensiveLatitude");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setValue:forKey:", v7, CFSTR("extensiveLatitude"));

    objc_msgSend(*(id *)(a1 + 32), "extensiveLongitude");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setValue:forKey:", v8, CFSTR("extensiveLongitude"));

  }
  objc_msgSend(v14, "setValue:forKey:", *(_QWORD *)(a1 + 48), CFSTR("nonce"));
  objc_msgSend(*(id *)(a1 + 40), "_archivedDataForEncryptedDataDictionary:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(MEMORY[0x1E0C92C78], "setProperty:forKey:inRequest:", v9, CFSTR("overlayRequest"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  v11 = (void *)objc_opt_class();
  v12 = (void *)objc_msgSend(v14, "copy");
  objc_msgSend(v11, "_HTTPBodyWithDictionary:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHTTPBody:", v13);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __152__PKPaymentRequirementsRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation_certChain_devSigned_deviceData_webService_completion___block_invoke_273(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "_archivedDataForEncryptedDataDictionary:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(MEMORY[0x1E0C92C78], "setProperty:forKey:inRequest:", v7, CFSTR("overlayRequest"), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  v5 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setHTTPBody:", v6);
  (*(void (**)(void))(a1[5] + 16))();

}

- (void)_encryptedDataWithDeviceData:(id)a3 certChain:(id)a4 devSigned:(BOOL)a5 includeDeviceScore:(BOOL)a6 inWebService:(id)a7 withCompletion:(id)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  BOOL v21;

  v10 = a6;
  v14 = a4;
  v15 = a8;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __128__PKPaymentRequirementsRequest__encryptedDataWithDeviceData_certChain_devSigned_includeDeviceScore_inWebService_withCompletion___block_invoke;
  v18[3] = &unk_1E2AD4478;
  v18[4] = self;
  v19 = v14;
  v21 = a5;
  v20 = v15;
  v16 = v15;
  v17 = v14;
  -[PKPaymentRequirementsRequest _cardDictionaryForDeviceData:inWebService:includingDeviceScore:withCompletion:](self, "_cardDictionaryForDeviceData:inWebService:includingDeviceScore:withCompletion:", a3, a7, v10, v18);

}

void __128__PKPaymentRequirementsRequest__encryptedDataWithDeviceData_certChain_devSigned_includeDeviceScore_inWebService_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Encrypted COF Requirements Fields: %@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138477827;
    v24 = v7;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "%{private}@", buf, 0xCu);

  }
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 40);
  v10 = *(unsigned __int8 *)(a1 + 56);
  v22 = 0;
  PKPaymentEncryptDataWithCertChain(v8, v9, v10, &v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v22;
  if (!v11)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Error: Failed to generate COF requirements request encryptedCardData. This is bad!", buf, 2u);
    }

  }
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("EV_ECC_v1-ASN.1"), CFSTR("encryptionVersion"));
  if (v11)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v11, 4);
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("encryptedCardData"));

  }
  if (v12)
  {
    objc_msgSend(v12, "hexEncoding");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("publicKeyHash"));

  }
  v16 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  if (v16)
  {
    v17 = objc_msgSend(v16, "isContactlessProductCredential");
    v18 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
    if (v17)
    {
      objc_msgSend(v18, "contactlessProductCredential");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v18 || !objc_msgSend(v18, "isDigitalIssuanceProductCredential"))
        goto LABEL_20;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "digitalIssuanceProductCredential");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v20 = v19;
    objc_msgSend(v19, "productIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v21, CFSTR("productIdentifier"));

  }
LABEL_20:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)_cardDictionaryForDeviceData:(id)a3 inWebService:(id)a4 includingDeviceScore:(BOOL)a5 withCompletion:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v7 = a5;
  v10 = a4;
  v11 = a6;
  v12 = a3;
  -[PKPaymentRequirementsRequest _cardDictionary](self, "_cardDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "primaryJSBLSequenceCounter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "stringValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v15, "dataUsingEncoding:", 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hexEncoding");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, CFSTR("jsblSequenceCounter"));

  }
  if (v7)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __110__PKPaymentRequirementsRequest__cardDictionaryForDeviceData_inWebService_includingDeviceScore_withCompletion___block_invoke;
    v18[3] = &unk_1E2AD44A0;
    v19 = v13;
    v20 = v11;
    -[PKPaymentRequirementsRequest _deviceScoreUsingWebService:withCompletion:](self, "_deviceScoreUsingWebService:withCompletion:", v10, v18);

  }
  else
  {
    (*((void (**)(id, void *))v11 + 2))(v11, v13);
  }

}

uint64_t __110__PKPaymentRequirementsRequest__cardDictionaryForDeviceData_inWebService_includingDeviceScore_withCompletion___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  const __CFString *v5;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, CFSTR("deviceScore"));
    if (a3)
      v5 = CFSTR("2");
    else
      v5 = CFSTR("1");
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, CFSTR("deviceScoreVersion"));
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_deviceScoreUsingWebService:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  PKODIServiceProviderAssessment *v8;
  uint64_t v9;
  void *v10;
  PKODIServiceProviderAssessment *v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (+[PKDeviceScorer deviceScoringSupported](PKDeviceScorer, "deviceScoringSupported")
      && -[PKPaymentCredential couldSupportSuperEasyProvisioning](self->_paymentCredential, "couldSupportSuperEasyProvisioning"))
    {
      v8 = [PKODIServiceProviderAssessment alloc];
      v9 = *MEMORY[0x1E0D17748];
      PKPassKitCoreBundle();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PKODIServiceProviderAssessment initWithServiceProviderIdentifier:locationBundle:](v8, "initWithServiceProviderIdentifier:locationBundle:", v9, v10);

      -[PKODIAssessment startAssessment](v11, "startAssessment");
      -[PKODIAssessment computeAssessment](v11, "computeAssessment");
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __75__PKPaymentRequirementsRequest__deviceScoreUsingWebService_withCompletion___block_invoke;
      v12[3] = &unk_1E2AD44C8;
      v13 = v7;
      -[PKODIAssessment waitForAssessmentWithTimeout:startTimeoutFromAssessmentStart:continueBlock:](v11, "waitForAssessmentWithTimeout:startTimeoutFromAssessmentStart:continueBlock:", 1, 0, v12);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    }
  }

}

uint64_t __75__PKPaymentRequirementsRequest__deviceScoreUsingWebService_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_updateContextUsingWebService:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  void (**v14)(_QWORD);
  uint8_t buf[16];

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (!+[PKDeviceScorer deviceScoringSupported](PKDeviceScorer, "deviceScoringSupported")
    || (-[PKPaymentRequirementsRequest cryptogram](self, "cryptogram"), (v8 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v9 = (void *)v8,
        -[PKPaymentRequirementsRequest challengeResponse](self, "challengeResponse"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v10))
  {
    if (v7)
      v7[2](v7);
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Fetching local crypto and challenge for request", buf, 2u);
    }

    if (PKRunningInPassd())
      objc_msgSend(v6, "targetDevice");
    else
      +[PKPaymentWebServiceTargetDevice localTargetDevice](PKPaymentWebServiceTargetDevice, "localTargetDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __73__PKPaymentRequirementsRequest__updateContextUsingWebService_completion___block_invoke;
      v13[3] = &unk_1E2ABDC98;
      v13[4] = self;
      v14 = v7;
      objc_msgSend(v12, "paymentWebService:setNewAuthRandomIfNecessaryReturningPairingState:", v6, v13);

    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Error: No targetDevice to configure context with", buf, 2u);
      }

      if (v7)
        v7[2](v7);
    }

  }
}

void __73__PKPaymentRequirementsRequest__updateContextUsingWebService_completion___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint8_t v11[16];

  v7 = a3;
  v8 = a4;
  if ((a2 & 1) == 0)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Cannot fetch local crypto and challenge for request", v11, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "setCryptogram:", v7);
  objc_msgSend(*(id *)(a1 + 32), "setChallengeResponse:", v8);
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(void))(v10 + 16))();

}

- (id)_archivedDataForEncryptedDataDictionary:(id)a3
{
  id v3;
  PKPaymentWebServiceRequest *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(PKPaymentWebServiceRequest);
  -[PKOverlayableWebServiceRequest setRequiresConfigurationForRedirect:](v4, "setRequiresConfigurationForRedirect:", 1);
  -[PKOverlayableWebServiceRequest setOverlayParameters:](v4, "setOverlayParameters:", v3);

  -[PKOverlayableWebServiceRequest _setOverriddenKeys:](v4, "_setOverriddenKeys:", &unk_1E2C3E248);
  -[PKOverlayableWebServiceRequest archivedData](v4, "archivedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
  objc_storeStrong((id *)&self->_region, a3);
}

- (PKPaymentCredential)paymentCredential
{
  return self->_paymentCredential;
}

- (void)setPaymentCredential:(id)a3
{
  objc_storeStrong((id *)&self->_paymentCredential, a3);
}

- (NSString)cardholderName
{
  return self->_cardholderName;
}

- (void)setCardholderName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)primaryAccountNumber
{
  return self->_primaryAccountNumber;
}

- (void)setPrimaryAccountNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)referrerIdentifier
{
  return self->_referrerIdentifier;
}

- (void)setReferrerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (PKDSPContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSData)cryptogram
{
  return self->_cryptogram;
}

- (void)setCryptogram:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSData)challengeResponse
{
  return self->_challengeResponse;
}

- (void)setChallengeResponse:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (BOOL)sendReducedDeviceData
{
  return self->_sendReducedDeviceData;
}

- (void)setSendReducedDeviceData:(BOOL)a3
{
  self->_sendReducedDeviceData = a3;
}

- (NSString)passOwnershipToken
{
  return self->_passOwnershipToken;
}

- (void)setPassOwnershipToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passOwnershipToken, 0);
  objc_storeStrong((id *)&self->_challengeResponse, 0);
  objc_storeStrong((id *)&self->_cryptogram, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_referrerIdentifier, 0);
  objc_storeStrong((id *)&self->_primaryAccountNumber, 0);
  objc_storeStrong((id *)&self->_cardholderName, 0);
  objc_storeStrong((id *)&self->_paymentCredential, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

@end
