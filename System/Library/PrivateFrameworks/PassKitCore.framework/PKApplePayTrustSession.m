@implementation PKApplePayTrustSession

- (PKApplePayTrustSession)initWithInternalSession:(id)a3 targetQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char isKindOfClass;
  PKApplePayTrustSession *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "nfSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKGetClassNFTrustSession();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(v6, "endSession");

    v6 = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)PKApplePayTrustSession;
  v10 = -[PKPaymentSession initWithInternalSession:targetQueue:](&v12, sel_initWithInternalSession_targetQueue_, v6, v7);

  return v10;
}

- (id)createKeyWithRequest:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t *v18;
  id v19;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[5];

  v43[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__47;
  v38 = __Block_byref_object_dispose__47;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__47;
  v32 = __Block_byref_object_dispose__47;
  v33 = 0;
  v5 = PKGetClassNFTrustLocalValidation();
  v6 = PKGetClassNFTrustKeyRequest();
  objc_msgSend(v4, "subjectIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localValidationWithPassCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v9;
  objc_msgSend(v5, "localValidationWithTouchID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v11;
  objc_msgSend(v5, "localValidationWithFaceID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyRequestWithSubjectIdentifier:discretionaryData:localValidations:counterLimit:", v7, 0, v14, &unk_1E2C3F100);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __53__PKApplePayTrustSession_createKeyWithRequest_error___block_invoke;
  v23[3] = &unk_1E2AD37A8;
  v16 = v4;
  v24 = v16;
  v17 = v15;
  v25 = v17;
  v26 = &v34;
  v27 = &v28;
  -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", v23);
  v18 = v35;
  if (a4 && !v35[5])
  {
    *a4 = objc_retainAutorelease((id)v29[5]);
    v18 = v35;
  }
  v19 = (id)v18[5];

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v19;
}

void __53__PKApplePayTrustSession_createKeyWithRequest_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  PKApplePayTrustKey *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "nfSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "keyIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v15 = 0;
  objc_msgSend(v3, "createKey:request:error:", v4, v5, &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;

  if (v6)
  {
    v8 = -[PKApplePayTrustKey initWithKey:]([PKApplePayTrustKey alloc], "initWithKey:", v6);
    v9 = *(_QWORD *)(a1 + 48);
  }
  else
  {
    PKLogFacilityTypeGetObject(0xFuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Failed to create Apple Pay Trust key: %@ Error: %@", buf, 0x16u);
    }

    v8 = (PKApplePayTrustKey *)objc_msgSend(v7, "copy");
    v9 = *(_QWORD *)(a1 + 56);
  }
  v13 = *(_QWORD *)(v9 + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v8;

}

- (id)keyWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
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
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__47;
  v16 = __Block_byref_object_dispose__47;
  v17 = 0;
  if (v4)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __44__PKApplePayTrustSession_keyWithIdentifier___block_invoke;
    v9[3] = &unk_1E2AC0D60;
    v10 = v4;
    v11 = &v12;
    -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", v9);

    v6 = (void *)v13[5];
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __44__PKApplePayTrustSession_keyWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  BOOL v7;
  uint64_t v8;
  PKApplePayTrustKey *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "nfSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v12 = 0;
  objc_msgSend(v3, "getKey:error:", v4, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;

  if (v6)
    v7 = 1;
  else
    v7 = v5 == 0;
  if (v7)
  {
    PKLogFacilityTypeGetObject(0xFuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v14 = v8;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Failed to get key with keyIdentifier: %@, error: %@", buf, 0x16u);
    }
  }
  else
  {
    v9 = -[PKApplePayTrustKey initWithKey:]([PKApplePayTrustKey alloc], "initWithKey:", v5);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(NSObject **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;
  }

}

- (BOOL)deleteKeyWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v5 = v4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (v4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50__PKApplePayTrustSession_deleteKeyWithIdentifier___block_invoke;
    v8[3] = &unk_1E2AC0E00;
    v10 = &v11;
    v9 = v4;
    -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", v8);

    v6 = *((_BYTE *)v12 + 24) != 0;
  }
  else
  {
    v6 = 0;
  }
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __50__PKApplePayTrustSession_deleteKeyWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  char v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "nfSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v12 = 0;
  v5 = objc_msgSend(v3, "deleteKey:error:", v4, &v12);
  v6 = v12;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;

  LODWORD(v3) = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  PKLogFacilityTypeGetObject(0xFuLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v3)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      v9 = "Successfully deleted Apple Pay Trust key.";
      v10 = v7;
      v11 = 2;
LABEL_6:
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
    }
  }
  else if (v8)
  {
    *(_DWORD *)buf = 138412290;
    v14 = v6;
    v9 = "Failed to delete Apple Pay Trust key with Error: %@";
    v10 = v7;
    v11 = 12;
    goto LABEL_6;
  }

}

- (id)signatureForRequest:(id)a3 withAuthorization:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  PKApplePayTrustSignature *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  unint64_t v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__47;
  v33 = __Block_byref_object_dispose__47;
  v34 = 0;
  if (PKMockOsloSecureElementAuth())
  {
    PKLogFacilityTypeGetObject(6uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKApplePayTrustSession signatureForRequest: mocking signature", buf, 2u);
    }

    v9 = [PKApplePayTrustSignature alloc];
    objc_msgSend(CFSTR("000000000000000000000000000000000000000000000000"), "dataUsingEncoding:", 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PKApplePayTrustSignature initWithSignatureRequest:signature:](v9, "initWithSignatureRequest:signature:", v6, v10);
    v12 = (void *)v30[5];
    v30[5] = v11;

    v13 = (id)v30[5];
  }
  else
  {
    objc_msgSend(v6, "nonce");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "length");
    if (v15 > 7)
    {
      v17 = v14;
    }
    else
    {
      v16 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
      objc_msgSend(v16, "increaseLengthBy:", 8 - v15);
      objc_msgSend(v16, "appendData:", v14);
      v17 = (id)objc_msgSend(v16, "copy");

    }
    v18 = PKGetClassNFTrustSignRequest();
    objc_msgSend(v6, "manifestHash");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "signRequestWithChallenge:data:", v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    PKLogFacilityTypeGetObject(0xFuLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v20;
      _os_log_impl(&dword_18FC92000, v21, OS_LOG_TYPE_DEFAULT, "Signing Apple Pay Trust Request: %@", buf, 0xCu);
    }

    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __64__PKApplePayTrustSession_signatureForRequest_withAuthorization___block_invoke;
    v24[3] = &unk_1E2AD37D0;
    v25 = v6;
    v22 = v20;
    v26 = v22;
    v27 = v7;
    v28 = &v29;
    -[PKPaymentSession performBlockSyncOnInternalSession:](self, "performBlockSyncOnInternalSession:", v24);
    v13 = (id)v30[5];

  }
  _Block_object_dispose(&v29, 8);

  return v13;
}

void __64__PKApplePayTrustSession_signatureForRequest_withAuthorization___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  PKApplePayTrustSignature *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "nfSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "keyIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v15 = 0;
  objc_msgSend(v3, "signWithKey:request:authorization:error:", v4, v5, v6, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;

  if (v7)
  {
    objc_msgSend(v7, "rawData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pk_decodeHexadecimal");
    v10 = objc_claimAutoreleasedReturnValue();

    v11 = -[PKApplePayTrustSignature initWithSignatureRequest:signature:]([PKApplePayTrustSignature alloc], "initWithSignatureRequest:signature:", *(_QWORD *)(a1 + 32), v10);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
  else
  {
    PKLogFacilityTypeGetObject(0xFuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v17 = v14;
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Failed to sign Apple Pay Trust Signature Request: %@ Error: %@", buf, 0x16u);
    }
  }

}

@end
