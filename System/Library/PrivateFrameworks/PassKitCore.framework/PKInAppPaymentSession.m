@implementation PKInAppPaymentSession

- (PKInAppPaymentSession)initWithInternalSession:(id)a3 targetQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char isKindOfClass;
  PKInAppPaymentSession *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "nfSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKGetClassNFECommercePaymentSession();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(v6, "endSession");

    v6 = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)PKInAppPaymentSession;
  v10 = -[PKPaymentSession initWithInternalSession:targetQueue:](&v12, sel_initWithInternalSession_targetQueue_, v6, v7);

  return v10;
}

- (id)authorizePaymentRequest:(id)a3 forPaymentApplication:(id)a4 usingNonce:(id)a5 withAuthenticationCredential:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PKInAppPaymentSessionAuthorizeParamaters *v14;
  void *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[PKInAppPaymentSessionAuthorizeParamaters initWithNonce:authenticationCredential:networkMerchantIdentifier:cryptogramType:]([PKInAppPaymentSessionAuthorizeParamaters alloc], "initWithNonce:authenticationCredential:networkMerchantIdentifier:cryptogramType:", v11, v10, 0, 0);

  -[PKInAppPaymentSession authorizePaymentRequest:forPaymentApplication:withAuthorizationParameters:](self, "authorizePaymentRequest:forPaymentApplication:withAuthorizationParameters:", v13, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)authorizePaymentRequest:(id)a3 forPaymentApplication:(id)a4 usingNonce:(id)a5 withAuthenticationCredential:(id)a6 isFeatureNotSupportedError:(BOOL *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  PKInAppPaymentSessionAuthorizeParamaters *v16;
  void *v17;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = -[PKInAppPaymentSessionAuthorizeParamaters initWithNonce:authenticationCredential:networkMerchantIdentifier:cryptogramType:]([PKInAppPaymentSessionAuthorizeParamaters alloc], "initWithNonce:authenticationCredential:networkMerchantIdentifier:cryptogramType:", v13, v12, 0, 0);

  -[PKInAppPaymentSessionAuthorizeParamaters setIsFeatureNotSupportedError:](v16, "setIsFeatureNotSupportedError:", a7);
  -[PKInAppPaymentSession authorizePaymentRequest:forPaymentApplication:withAuthorizationParameters:](self, "authorizePaymentRequest:forPaymentApplication:withAuthorizationParameters:", v15, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)authorizePaymentRequest:(id)a3 forPaymentApplication:(id)a4 withAuthorizationParameters:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKInAppPaymentSessionAuthorizationRequest *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(PKInAppPaymentSessionAuthorizationRequest);
  -[PKInAppPaymentSessionAuthorizationRequest setPaymentApplication:](v11, "setPaymentApplication:", v9);

  objc_msgSend(v10, "currencyCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKInAppPaymentSessionAuthorizationRequest setCurrencyCode:](v11, "setCurrencyCode:", v12);

  objc_msgSend(v10, "countryCode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKInAppPaymentSessionAuthorizationRequest setCountryCode:](v11, "setCountryCode:", v13);

  objc_msgSend(v10, "_transactionAmount");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKInAppPaymentSessionAuthorizationRequest setTransactionAmount:](v11, "setTransactionAmount:", v14);

  -[PKInAppPaymentSessionAuthorizationRequest setMerchantCapabilities:](v11, "setMerchantCapabilities:", objc_msgSend(v10, "merchantCapabilities"));
  objc_msgSend(v10, "supportedNetworks");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKInAppPaymentSessionAuthorizationRequest setSupportedNetworks:](v11, "setSupportedNetworks:", v15);

  objc_msgSend(v10, "merchantIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKInAppPaymentSessionAuthorizationRequest setMerchantIdentifier:](v11, "setMerchantIdentifier:", v16);

  objc_msgSend(v10, "applicationData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKInAppPaymentSessionAuthorizationRequest setApplicationData:](v11, "setApplicationData:", v17);

  objc_msgSend(v10, "merchantSession");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKInAppPaymentSessionAuthorizationRequest setMerchantSession:](v11, "setMerchantSession:", v18);
  -[PKInAppPaymentSession authorizeWithRequest:authorizationParameters:](self, "authorizeWithRequest:authorizationParameters:", v11, v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)authorizeWithRequest:(id)a3 authorizationParameters:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  PKWrappedPayment *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  PKPaymentMerchantData *v21;
  void *v22;
  void *v23;
  void *v24;
  PKPaymentMerchantData *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  _BOOL4 v33;
  char v34;
  void *v35;
  NSObject *v36;
  id v37;
  id v38;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint8_t buf[4];
  id v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__63;
  v57 = __Block_byref_object_dispose__63;
  v58 = 0;
  if (PKMockOsloSecureElementAuth())
  {
    PKLogFacilityTypeGetObject(6uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "PKInAppPaymentSession authorizePaymentRequest: mocking wrapped payment data", buf, 2u);
    }

    v8 = objc_alloc_init(PKWrappedPayment);
    v9 = (void *)v54[5];
    v54[5] = (uint64_t)v8;

    v10 = (void *)v54[5];
    objc_msgSend(CFSTR("000000000000000000000000000000000000000000000000"), "dataUsingEncoding:", 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTransactionData:", v11);

    objc_msgSend((id)v54[5], "setTransactionIdentifier:", CFSTR("0123456789ABCDEF"));
    v12 = (void *)v54[5];
    objc_msgSend(v5, "countryCode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMerchantCountryCode:", v13);

    v14 = (id)v54[5];
  }
  else
  {
    objc_msgSend(v5, "paymentApplication");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKInAppPaymentSession _appletForPaymentApplication:](self, "_appletForPaymentApplication:");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nonce");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "authenticationCredential");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "networkMerchantIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v6, "isFeatureNotSupportedError");
    v42 = objc_msgSend(v6, "cryptogramType");
    v17 = v5;
    v45 = v16;
    v18 = v15;
    objc_msgSend(v17, "paymentApplication");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 0;
    objc_msgSend(v18, "getBytes:length:", buf, 4);

    *(_DWORD *)buf = bswap32(*(unsigned int *)buf);
    v20 = objc_alloc_init((Class)PKGetClassNFECommercePaymentRequest());
    v21 = [PKPaymentMerchantData alloc];
    objc_msgSend(v17, "merchantIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "applicationData");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "merchantSession");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[PKPaymentMerchantData initWithMerchantIdentifier:applicationData:merchantSession:](v21, "initWithMerchantIdentifier:applicationData:merchantSession:", v22, v23, v24);

    objc_msgSend(v19, "applicationIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAppletIdentifier:", v26);

    -[PKPaymentMerchantData encode](v25, "encode");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setMerchantData:", v27);

    objc_msgSend(v17, "currencyCode");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCurrencyCode:", v28);

    objc_msgSend(v17, "countryCode");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCountryCode:", v29);

    objc_msgSend(v17, "transactionAmount");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTransactionAmount:", v30);

    v31 = objc_msgSend(v17, "merchantCapabilities");
    if ((~v31 & 3) == 0)
    {
      objc_msgSend(v17, "supportedNetworks");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v32, "containsObject:", CFSTR("ChinaUnionPay")) & 1) != 0)
      {
        v33 = objc_msgSend(v19, "paymentNetworkIdentifier") == 11;

        if (!v33)
          LOBYTE(v31) = v31 ^ 2;
      }
      else
      {

      }
    }
    v34 = v31 | 0x40;
    if (v42 != 1)
      v34 = v31;
    objc_msgSend(v20, "setMerchantCapabilities:", v34 & 0x43);
    objc_msgSend(v20, "setUnpredictableNumber:", *(unsigned int *)buf);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTransactionDate:", v35);

    objc_msgSend(v20, "setNetworkMerchantIdentifier:", v45);
    PKLogFacilityTypeGetObject(6uLL);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v60 = v20;
      v61 = 2112;
      v62 = v43;
      v63 = 2112;
      v64 = v44;
      v65 = 2112;
      v66 = v18;
      _os_log_impl(&dword_18FC92000, v36, OS_LOG_TYPE_DEFAULT, "Authorizing Payment Request: %@ for Payment Application %@ (Applet: %@) with nonce: %@", buf, 0x2Au);
    }

    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __70__PKInAppPaymentSession_authorizeWithRequest_authorizationParameters___block_invoke;
    v47[3] = &unk_1E2AC48A0;
    v37 = v41;
    v48 = v37;
    v38 = v20;
    v49 = v38;
    v51 = &v53;
    v50 = v17;
    v52 = v40;
    -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", v47);
    v14 = (id)v54[5];

  }
  _Block_object_dispose(&v53, 8);

  return v14;
}

void __70__PKInAppPaymentSession_authorizeWithRequest_authorizationParameters___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  PKWrappedPayment *v10;
  void *v11;
  void *v12;
  void *v13;
  PKSecureElementCertificateSet *v14;
  void *v15;
  PKSecureElementCertificateSet *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  _BYTE *v24;
  void *v25;
  void *v26;
  BOOL v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "nfSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v28 = 0;
  objc_msgSend(v3, "performECommercePayment:request:error:", v4, v5, &v28);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v28;

  if (v6)
  {
    v8 = *(id *)(a1 + 48);
    v9 = v6;
    v10 = objc_alloc_init(PKWrappedPayment);
    objc_msgSend(v9, "transactionIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKWrappedPayment setTransactionIdentifier:](v10, "setTransactionIdentifier:", v11);

    objc_msgSend(v9, "transactionData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKWrappedPayment setTransactionData:](v10, "setTransactionData:", v12);

    objc_msgSend(v9, "confirmationBlobSignature");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKWrappedPayment setTransactionInstructionsSignature:](v10, "setTransactionInstructionsSignature:", v13);

    v14 = [PKSecureElementCertificateSet alloc];
    objc_msgSend(v9, "certs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PKSecureElementCertificateSet initWithDictionary:](v14, "initWithDictionary:", v15);
    -[PKWrappedPayment setCertificates:](v10, "setCertificates:", v16);

    objc_msgSend(v8, "countryCode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKWrappedPayment setMerchantCountryCode:](v10, "setMerchantCountryCode:", v17);
    objc_msgSend(v9, "SEPcerts");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKWrappedPayment setSEPCertificates:](v10, "setSEPCertificates:", v18);

    objc_msgSend(v9, "confirmationBlobHash");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKWrappedPayment setConfirmationBlobHash:](v10, "setConfirmationBlobHash:", v19);

    v20 = objc_msgSend(v9, "confirmationBlobVersion");
    -[PKWrappedPayment setConfirmationBlobVersion:](v10, "setConfirmationBlobVersion:", v20);
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v22 = *(NSObject **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v10;
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v30 = v23;
      v31 = 2112;
      v32 = v7;
      _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "Failed to Authorize Payment Request: %@ Error: %@", buf, 0x16u);
    }
  }

  v24 = *(_BYTE **)(a1 + 64);
  if (v24)
  {
    if (v7)
    {
      objc_msgSend(v7, "domain");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v25, "isEqualToString:", v26))
        v27 = objc_msgSend(v7, "code") == 14;
      else
        v27 = 0;
      **(_BYTE **)(a1 + 64) = v27;

    }
    else
    {
      *v24 = 0;
    }
  }

}

- (id)_appletForPaymentApplication:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "applicationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKInAppPaymentSession _appletWithIdentifier:](self, "_appletWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_appletWithIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__63;
  v15 = __Block_byref_object_dispose__63;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__PKInAppPaymentSession__appletWithIdentifier___block_invoke;
  v8[3] = &unk_1E2AC0E00;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __47__PKInAppPaymentSession__appletWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "nfSession");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appletWithIdentifier:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

@end
