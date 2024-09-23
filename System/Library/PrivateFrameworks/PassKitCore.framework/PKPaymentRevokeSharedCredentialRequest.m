@implementation PKPaymentRevokeSharedCredentialRequest

- (PKPaymentRevokeSharedCredentialRequest)initWithCredential:(id)a3 revocationAttestation:(id)a4
{
  id v7;
  id v8;
  PKPaymentRevokeSharedCredentialRequest *v9;
  PKPaymentRevokeSharedCredentialRequest *v10;
  PKAppletSubcredential **p_credential;
  uint64_t v12;
  NSDictionary *revocationAttestation;
  PKPaymentRevokeSharedCredentialRequest *v14;
  NSObject *v15;
  const char *v16;
  __int16 v18[8];
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PKPaymentRevokeSharedCredentialRequest;
  v9 = -[PKOverlayableWebServiceRequest init](&v19, sel_init);
  v10 = v9;
  if (!v9)
    goto LABEL_4;
  p_credential = &v9->_credential;
  objc_storeStrong((id *)&v9->_credential, a3);
  dictionaryFromSubcredentialEncryptedRequest(v8);
  v12 = objc_claimAutoreleasedReturnValue();
  revocationAttestation = v10->_revocationAttestation;
  v10->_revocationAttestation = (NSDictionary *)v12;

  if (!*p_credential)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v18[0] = 0;
      v16 = "Missing credential on deletion request";
LABEL_9:
      _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)v18, 2u);
    }
LABEL_10:

    v14 = 0;
    goto LABEL_11;
  }
  if (!v10->_revocationAttestation)
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v18[0] = 0;
      v16 = "Missing attestation on revocation request";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
LABEL_4:
  v14 = v10;
LABEL_11:

  return v14;
}

- (id)requestBody
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSDictionary *revocationAttestation;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PKAppletSubcredential identifier](self->_credential, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("keyID"));

  -[PKAppletSubcredential partnerIdentifier](self->_credential, "partnerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("partnerID"));

  -[PKAppletSubcredential brandIdentifier](self->_credential, "brandIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("brand"));

  revocationAttestation = self->_revocationAttestation;
  if (revocationAttestation)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", revocationAttestation, CFSTR("remoteTerminationRequest"));
  return v3;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v19;
  id v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v19 = CFSTR("devices");
  v20 = a4;
  v21 = CFSTR("deleteKey");
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v19, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v11, v12, 0, v9, v19, v20, v21, v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setHTTPMethod:", CFSTR("POST"));
  v14 = (void *)objc_opt_class();
  -[PKPaymentRevokeSharedCredentialRequest requestBody](self, "requestBody");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_HTTPBodyWithDictionary:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHTTPBody:", v16);

  v17 = (void *)objc_msgSend(v13, "copy");
  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_revocationAttestation, 0);
}

@end
