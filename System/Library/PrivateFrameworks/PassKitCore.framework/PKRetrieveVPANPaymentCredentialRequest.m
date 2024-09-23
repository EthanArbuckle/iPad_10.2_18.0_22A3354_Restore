@implementation PKRetrieveVPANPaymentCredentialRequest

- (NSArray)endpointComponents
{
  NSString *deviceIdentifier;
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  deviceIdentifier = self->_deviceIdentifier;
  v4[0] = CFSTR("devices");
  v4[1] = deviceIdentifier;
  v4[2] = CFSTR("virtualCardPaymentCredential");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 3);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (PKRetrieveVPANPaymentCredentialRequest)initWithPaymentPass:(id)a3 vpanIdentifier:(id)a4 deviceIdentifier:(id)a5 nonce:(id)a6 encryptionFields:(id)a7 merchantHost:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  PKRetrieveVPANPaymentCredentialRequest *v21;
  PKRetrieveVPANPaymentCredentialRequest *v22;
  uint64_t v23;
  NSString *vpanIdentifier;
  uint64_t v25;
  NSString *deviceIdentifier;
  uint64_t v27;
  NSString *nonce;
  uint64_t v29;
  NSString *merchantHost;
  objc_super v32;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v32.receiver = self;
  v32.super_class = (Class)PKRetrieveVPANPaymentCredentialRequest;
  v21 = -[PKOverlayableWebServiceRequest init](&v32, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_paymentPass, a3);
    v23 = objc_msgSend(v16, "copy");
    vpanIdentifier = v22->_vpanIdentifier;
    v22->_vpanIdentifier = (NSString *)v23;

    v25 = objc_msgSend(v17, "copy");
    deviceIdentifier = v22->_deviceIdentifier;
    v22->_deviceIdentifier = (NSString *)v25;

    v27 = objc_msgSend(v18, "copy");
    nonce = v22->_nonce;
    v22->_nonce = (NSString *)v27;

    objc_storeStrong((id *)&v22->_encryptionFields, a7);
    v29 = objc_msgSend(v20, "copy");
    merchantHost = v22->_merchantHost;
    v22->_merchantHost = (NSString *)v29;

  }
  return v22;
}

- (void)_urlRequestWithServiceURL:(id)a3 rewrapData:(id)a4 appleAccountInformation:(id)a5 webService:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSString *merchantHost;
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
  _QWORD v32[4];
  id v33;
  id v34;

  v12 = a4;
  v13 = a6;
  v14 = a7;
  v15 = a5;
  v16 = a3;
  -[PKRetrieveVPANPaymentCredentialRequest endpointComponents](self, "endpointComponents");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:version:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:version:endpointComponents:queryParameters:appleAccountInformation:", v16, CFSTR("1"), v17, 0, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", self->_vpanIdentifier, CFSTR("virtualCardNumberIdentifier"));
  -[PKSecureElementPass primaryAccountIdentifier](self->_paymentPass, "primaryAccountIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("primaryAccountIdentifier"));

  objc_msgSend(v19, "setObject:forKeyedSubscript:", self->_nonce, CFSTR("nOnce"));
  merchantHost = self->_merchantHost;
  if (merchantHost)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", merchantHost, CFSTR("merchantDomain"));
  -[PKVirtualCardEncryptionFields dictionaryRepresentation](self->_encryptionFields, "dictionaryRepresentation");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v22, CFSTR("virtualCardEncryptionFields"));

  -[PKPass serialNumber](self->_paymentPass, "serialNumber");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v23, CFSTR("passSerialNumber"));

  if (v12)
  {
    objc_msgSend(v12, "platformData");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "hexEncoding");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v25, CFSTR("pairedSEP"));

    objc_msgSend(v12, "platformDataSignature");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "hexEncoding");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v27, CFSTR("pairedSEPSignature"));

  }
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v19);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setHTTPBody:", v28);

  objc_msgSend(v18, "HTTPBody");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "SHA256Hash");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "targetDevice");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __125__PKRetrieveVPANPaymentCredentialRequest__urlRequestWithServiceURL_rewrapData_appleAccountInformation_webService_completion___block_invoke;
    v32[3] = &unk_1E2ABDB80;
    v33 = v18;
    v34 = v14;
    objc_msgSend(v31, "paymentWebService:signData:signatureEntanglementMode:withCompletionHandler:", v13, v30, 0, v32);

  }
  else if (v14)
  {
    (*((void (**)(id, void *))v14 + 2))(v14, v18);
  }

}

uint64_t __125__PKRetrieveVPANPaymentCredentialRequest__urlRequestWithServiceURL_rewrapData_appleAccountInformation_webService_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t result;

  PKUpdateURLRequestWithSignatureDataAndInfo(*(void **)(a1 + 32), a2, a3);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (PKSecureElementPass)paymentPass
{
  return self->_paymentPass;
}

- (void)setPaymentPass:(id)a3
{
  objc_storeStrong((id *)&self->_paymentPass, a3);
}

- (NSString)vpanIdentifier
{
  return self->_vpanIdentifier;
}

- (void)setVpanIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (PKVirtualCardEncryptionFields)encryptionFields
{
  return self->_encryptionFields;
}

- (void)setEncryptionFields:(id)a3
{
  objc_storeStrong((id *)&self->_encryptionFields, a3);
}

- (NSString)merchantHost
{
  return self->_merchantHost;
}

- (void)setMerchantHost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantHost, 0);
  objc_storeStrong((id *)&self->_encryptionFields, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_vpanIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
}

@end
