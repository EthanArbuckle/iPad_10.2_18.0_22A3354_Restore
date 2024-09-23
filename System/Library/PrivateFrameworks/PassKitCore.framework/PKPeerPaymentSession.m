@implementation PKPeerPaymentSession

- (PKPeerPaymentSession)initWithInternalSession:(id)a3 targetQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char isKindOfClass;
  PKPeerPaymentSession *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "nfSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKGetClassNFPeerPaymentSession();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(v6, "endSession");

    v6 = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)PKPeerPaymentSession;
  v10 = -[PKPaymentSession initWithInternalSession:targetQueue:](&v12, sel_initWithInternalSession_targetQueue_, v6, v7);

  return v10;
}

- (id)authorizePeerPaymentQuote:(id)a3 forPaymentApplication:(id)a4 withAuthenticationCredential:(id)a5
{
  return -[PKPeerPaymentSession authorizePeerPaymentQuote:forPaymentApplication:withAuthenticationCredential:shouldReregister:](self, "authorizePeerPaymentQuote:forPaymentApplication:withAuthenticationCredential:shouldReregister:", a3, a4, a5, 0);
}

- (id)authorizePeerPaymentQuote:(id)a3 forPaymentApplication:(id)a4 withAuthenticationCredential:(id)a5 shouldReregister:(BOOL *)a6
{
  id v10;
  id v11;
  NSObject *v12;
  PKAuthorizedPeerPaymentQuote *v13;
  id v14;
  NSObject *v15;
  PKAuthorizedPeerPaymentQuote *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  PKPaymentMerchantData *v45;
  void *v46;
  void *v47;
  PKPaymentMerchantData *v48;
  uint64_t v49;
  id v50;
  NSObject *v51;
  id v52;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  BOOL *v58;
  PKPeerPaymentSession *v59;
  void *v60;
  void *v61;
  id v62;
  __int128 v63;
  id v64;
  id v65;
  _QWORD v66[4];
  id v67;
  id v68;
  id v69;
  uint64_t *v70;
  BOOL *v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  uint8_t buf[4];
  id v79;
  __int16 v80;
  id v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v65 = a4;
  v11 = a5;
  v72 = 0;
  v73 = &v72;
  v74 = 0x3032000000;
  v75 = __Block_byref_object_copy__12;
  v76 = __Block_byref_object_dispose__12;
  v77 = 0;
  if (PKUseMockSURFServer())
  {
    PKLogFacilityTypeGetObject(6uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v79 = v10;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Mocking Authorization of Peer Payment Quote: %@", buf, 0xCu);
    }

    v13 = -[PKAuthorizedPeerPaymentQuote initWithQuote:transactionData:certificates:]([PKAuthorizedPeerPaymentQuote alloc], "initWithQuote:transactionData:certificates:", v10, 0, 0);
    v14 = (id)v73[5];
    v73[5] = (uint64_t)v13;
    goto LABEL_22;
  }
  if (PKMockOsloSecureElementAuth())
  {
    PKLogFacilityTypeGetObject(6uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v79 = v10;
      _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Mocking Signature of Peer Payment Quote: %@", buf, 0xCu);
    }

    v16 = [PKAuthorizedPeerPaymentQuote alloc];
    objc_msgSend(CFSTR("000000000000000000000000000000000000000000000000"), "dataUsingEncoding:", 4);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v17 = -[PKAuthorizedPeerPaymentQuote initWithQuote:transactionData:certificates:](v16, "initWithQuote:transactionData:certificates:", v10, v14, MEMORY[0x1E0C9AA70]);
    v18 = (void *)v73[5];
    v73[5] = v17;

    goto LABEL_22;
  }
  v58 = a6;
  v59 = self;
  v19 = v10;
  v62 = v65;
  v64 = objc_alloc_init((Class)PKGetClassNFPeerPaymentRequest());
  objc_msgSend(v19, "firstQuoteItemOfType:", 1);
  *((_QWORD *)&v63 + 1) = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstQuoteItemOfType:", 2);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstQuoteItemOfType:", 3);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstQuoteItemOfType:", 4);
  *(_QWORD *)&v63 = objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc_init((Class)PKGetClassNFPeerPaymentTransferRequest());
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTransactionDate:", v21);

  objc_msgSend(v19, "appleHash");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "hexEncoding");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAppleTransactionHash:", v23);

  objc_msgSend(v19, "externalHash");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "hexEncoding");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPublicTransactionHash:", v25);

  objc_msgSend(v19, "totalReceiveAmount");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTransactionAmount:", v26);

  objc_msgSend(v19, "totalReceiveAmountCurrency");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTransactionCurrency:", v27);

  v28 = v61;
  if (!v61)
  {
    if (*((_QWORD *)&v63 + 1))
    {
      objc_msgSend(*((id *)&v63 + 1), "countryCode");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setTransactionCountry:", v31);

      objc_msgSend(*((id *)&v63 + 1), "nonce");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setNonce:", v32);
    }
    else
    {
      v28 = v60;
      if (v60)
        goto LABEL_10;
      if (!(_QWORD)v63)
      {
        PKLogFacilityTypeGetObject(0xBuLL);
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18FC92000, v57, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentQuote has no supported items. Refusing to create AN NFPeerPaymentRequest object.", buf, 2u);
        }

        v50 = 0;
        goto LABEL_19;
      }
      objc_msgSend((id)v63, "countryCode");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setTransactionCountry:", v54);

      objc_msgSend((id)v63, "nonce");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setNonce:", v55);

      objc_msgSend(v19, "calculatedTotalAmount");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "amount");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setTransactionAmount:", v56);

    }
    objc_msgSend(v64, "setTransferRequest:", v20);
    goto LABEL_15;
  }
LABEL_10:
  objc_msgSend(v28, "countryCode", a6, v59);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTransactionCountry:", v29);

  objc_msgSend(v28, "nonce");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setNonce:", v30);

  objc_msgSend(v64, "setTransferRequest:", v20);
  if (v63 != 0)
  {
LABEL_15:
    v33 = (void *)*((_QWORD *)&v63 + 1);
    if (!*((_QWORD *)&v63 + 1))
      v33 = (void *)v63;
    v34 = v33;
    v35 = objc_alloc_init((Class)PKGetClassNFECommercePaymentRequest());
    objc_msgSend(v34, "totalAmountCurrency");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setCurrencyCode:", v36);

    objc_msgSend(v34, "totalAmount");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setTransactionAmount:", v37);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setTransactionDate:", v38);

    objc_msgSend(v62, "applicationIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setAppletIdentifier:", v39);

    objc_msgSend(v34, "nonce");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 0;
    objc_msgSend(v40, "getBytes:length:", buf, 4);
    objc_msgSend(v35, "setUnpredictableNumber:", bswap32(*(unsigned int *)buf));

    objc_msgSend(v34, "countryCode");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setCountryCode:", v41);

    objc_msgSend(MEMORY[0x1E0C99DF0], "data");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "externalHash");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "appendData:", v43);

    objc_msgSend(v19, "appleHash");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "appendData:", v44);

    v45 = [PKPaymentMerchantData alloc];
    objc_msgSend(v34, "merchantIdentifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)objc_msgSend(v42, "copy");
    v48 = -[PKPaymentMerchantData initWithMerchantIdentifier:applicationData:merchantSession:](v45, "initWithMerchantIdentifier:applicationData:merchantSession:", v46, v47, 0);

    -[PKPaymentMerchantData encode](v48, "encode");
    v49 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setMerchantData:", v49);

    LOBYTE(v49) = objc_msgSend(v34, "merchantCapabilities");
    objc_msgSend(v35, "setMerchantCapabilities:", v49 & 0x43);
    objc_msgSend(v64, "setTopUpRequest:", v35);

  }
  v50 = v64;
LABEL_19:

  PKLogFacilityTypeGetObject(6uLL);
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v79 = v50;
    v80 = 2112;
    v81 = v62;
    _os_log_impl(&dword_18FC92000, v51, OS_LOG_TYPE_DEFAULT, "Authorizing Peer Payment Quote: %@ for Payment Application %@", buf, 0x16u);
  }

  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v66[2] = __118__PKPeerPaymentSession_authorizePeerPaymentQuote_forPaymentApplication_withAuthenticationCredential_shouldReregister___block_invoke;
  v66[3] = &unk_1E2AC48A0;
  v67 = v11;
  v14 = v50;
  v68 = v14;
  v70 = &v72;
  v69 = v19;
  v71 = v58;
  -[PKPaymentSession performBlockSyncOnInternalSession:](v59, "performBlockSyncOnInternalSession:", v66);

LABEL_22:
  v52 = (id)v73[5];
  _Block_object_dispose(&v72, 8);

  return v52;
}

void __118__PKPeerPaymentSession_authorizePeerPaymentQuote_forPaymentApplication_withAuthenticationCredential_shouldReregister___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  PKAuthorizedPeerPaymentQuote *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _BYTE *v17;
  void *v18;
  void *v19;
  BOOL v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "nfSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = a1[4];
  v5 = a1[5];
  v21 = 0;
  objc_msgSend(v3, "performPeerPayment:request:error:", v4, v5, &v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v21;

  PKLogFacilityTypeGetObject(6uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = a1[5];
    *(_DWORD *)buf = 138412546;
    v23 = v9;
    v24 = 2112;
    v25 = v7;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Authorized Peer Payment Request: %@ Error: %@", buf, 0x16u);
  }

  if (v6)
  {
    v10 = [PKAuthorizedPeerPaymentQuote alloc];
    v11 = a1[6];
    objc_msgSend(v6, "transactionData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "certificates");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PKAuthorizedPeerPaymentQuote initWithQuote:transactionData:certificates:](v10, "initWithQuote:transactionData:certificates:", v11, v12, v13);
    v15 = *(_QWORD *)(a1[7] + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

  }
  v17 = (_BYTE *)a1[8];
  if (v17)
  {
    if (v7)
    {
      objc_msgSend(v7, "domain");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "isEqualToString:", v19))
        v20 = objc_msgSend(v7, "code") == 42;
      else
        v20 = 0;
      *(_BYTE *)a1[8] = v20;

    }
    else
    {
      *v17 = 0;
    }
  }

}

- (BOOL)deleteApplet
{
  NSObject *v3;
  char v4;
  _QWORD v6[5];
  uint8_t buf[16];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  PKLogFacilityTypeGetObject(0xBuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Deleting purple trust applet.", buf, 2u);
  }

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__PKPeerPaymentSession_deleteApplet__block_invoke;
  v6[3] = &unk_1E2AC48C8;
  v6[4] = &v8;
  -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", v6);
  v4 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __36__PKPeerPaymentSession_deleteApplet__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "nfSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4 == 0;
  PKLogFacilityTypeGetObject(0xBuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    v7 = 138543618;
    v8 = v6;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Deleted purple trust applet with success %{public}@, error: %@", (uint8_t *)&v7, 0x16u);
  }

}

@end
