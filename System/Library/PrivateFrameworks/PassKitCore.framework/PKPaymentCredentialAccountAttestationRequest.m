@implementation PKPaymentCredentialAccountAttestationRequest

- (PKPaymentCredentialAccountAttestationRequest)initWithAttestationRequest:(id)a3
{
  id v4;
  PKPaymentCredentialAccountAttestationRequest *v5;
  PKPaymentCredentialAccountAttestationRequest *v6;
  uint64_t v7;
  NSDictionary *requestBody;
  PKPaymentCredentialAccountAttestationRequest *v9;

  v4 = a3;
  v5 = -[PKOverlayableWebServiceRequest init](self, "init");
  v6 = v5;
  if (v5
    && (-[PKPaymentCredentialAccountAttestationRequest requestBodyWithAttesationRequest:](v5, "requestBodyWithAttesationRequest:", v4), v7 = objc_claimAutoreleasedReturnValue(), requestBody = v6->_requestBody, v6->_requestBody = (NSDictionary *)v7, requestBody, !v6->_requestBody))
  {
    v9 = 0;
  }
  else
  {
    v9 = v6;
  }

  return v9;
}

- (id)requestBodyWithAttesationRequest:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint8_t v16[8];
  _QWORD v17[5];
  _QWORD v18[6];

  v18[5] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "casdCertificate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v4, "certificateOfType:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("ECDSA"));
    objc_msgSend(v4, "certificateOfType:", 1);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("RSA"));
    if (!objc_msgSend(v5, "count"))
    {
      PKLogFacilityTypeGetObject(0x16uLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Missing cert when creating account attesation request", v16, 2u);
      }
      v13 = 0;
      goto LABEL_26;
    }
    objc_msgSend(v3, "anonymizationSalt");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      PKLogFacilityTypeGetObject(0x16uLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Missing anonymization salt when creating account attesation request", v16, 2u);
      }
      v13 = 0;
      goto LABEL_25;
    }
    objc_msgSend(v3, "subCASEResidencyAttestation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hexEncoding");
    v10 = objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v3, "sharingTokenHash");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hexEncoding");
      v12 = objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v17[0] = CFSTR("casdCertificate");
        v17[1] = CFSTR("casdCertificates");
        v18[0] = v6;
        v18[1] = v5;
        v17[2] = CFSTR("anonymizationSalt");
        v17[3] = CFSTR("subCAResidencyAttestation");
        v18[2] = v8;
        v18[3] = v10;
        v17[4] = CFSTR("sharingToken");
        v18[4] = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:

LABEL_25:
LABEL_26:

        goto LABEL_27;
      }
      PKLogFacilityTypeGetObject(0x16uLL);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Missing sharing token when creating account attesation request", v16, 2u);
      }

      v12 = 0;
    }
    else
    {
      PKLogFacilityTypeGetObject(0x16uLL);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Missing subCA SE residency attesation when creating account attesation request", v16, 2u);
      }
    }
    v13 = 0;
    goto LABEL_24;
  }
  PKLogFacilityTypeGetObject(0x16uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Missing ecdsa casd cert when creating account attesation request", v16, 2u);
  }
  v13 = 0;
LABEL_27:

  return v13;
}

- (void)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5 webService:(id)a6 completion:(id)a7
{
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v12 = a7;
  v24[0] = CFSTR("devices");
  v24[1] = a4;
  v24[2] = CFSTR("accountAttestation");
  v13 = (void *)MEMORY[0x1E0C99D20];
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  objc_msgSend(v13, "arrayWithObjects:count:", v24, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v17, v18, 0, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", self->_requestBody);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setHTTPBody:", v20);

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __137__PKPaymentCredentialAccountAttestationRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation_webService_completion___block_invoke;
  v22[3] = &unk_1E2AD44F0;
  v23 = v12;
  v21 = v12;
  -[PKPaymentWebServiceRequest _signRequest:webService:completion:](self, "_signRequest:webService:completion:", v19, v14, v22);

}

void __137__PKPaymentCredentialAccountAttestationRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation_webService_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = (id)objc_msgSend(a2, "copy");
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestBody, 0);
}

@end
