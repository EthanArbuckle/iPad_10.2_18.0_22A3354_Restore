@implementation PKPaymentRegisterPreTrackCredentialRequest

- (PKPaymentRegisterPreTrackCredentialRequest)initWithCredential:(id)a3 metadata:(id)a4
{
  PKPaymentRegisterPreTrackCredentialRequest *v4;
  PKPaymentRegisterPreTrackCredentialRequest *v5;
  NSDictionary *encryptedVehicleDataRequest;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPaymentRegisterPreTrackCredentialRequest;
  v4 = -[PKPaymentRegisterCredentialRequest initWithCredential:metadata:](&v8, sel_initWithCredential_metadata_, a3, a4);
  v5 = v4;
  if (v4)
  {
    encryptedVehicleDataRequest = v4->_encryptedVehicleDataRequest;
    v4->_encryptedVehicleDataRequest = 0;

  }
  return v5;
}

- (PKPaymentRegisterPreTrackCredentialRequest)initWithCredential:(id)a3 encryptedVehicleDataRequest:(id)a4 metadata:(id)a5
{
  id v8;
  PKPaymentRegisterPreTrackCredentialRequest *v9;
  uint64_t v10;
  NSDictionary *encryptedVehicleDataRequest;
  PKPaymentRegisterPreTrackCredentialRequest *v12;
  NSObject *v13;
  uint8_t v15[16];
  objc_super v16;

  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentRegisterPreTrackCredentialRequest;
  v9 = -[PKPaymentRegisterCredentialRequest initWithCredential:metadata:](&v16, sel_initWithCredential_metadata_, a3, a5);
  if (v9
    && (dictionaryFromSubcredentialEncryptedRequest(v8),
        v10 = objc_claimAutoreleasedReturnValue(),
        encryptedVehicleDataRequest = v9->_encryptedVehicleDataRequest,
        v9->_encryptedVehicleDataRequest = (NSDictionary *)v10,
        encryptedVehicleDataRequest,
        !v9->_encryptedVehicleDataRequest))
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Missing encryptedVehicleDataRequest on register request", v15, 2u);
    }

    v12 = 0;
  }
  else
  {
    v12 = v9;
  }

  return v12;
}

- (void)buildRequestBody:(id)a3
{
  id v4;
  NSObject *v5;
  NSDictionary *encryptedVehicleDataRequest;
  uint8_t v7[16];
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentRegisterPreTrackCredentialRequest;
  -[PKPaymentRegisterCredentialRequest buildRequestBody:](&v8, sel_buildRequestBody_, v4);
  if (self->_encryptedVehicleDataRequest)
  {
    if (PKSharingForceNilVehicleDataInPreTrackRequest())
    {
      PKLogFacilityTypeGetObject(0x20uLL);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "PKSharingForceNilVehicleDataInPreTrackRequest enabled", v7, 2u);
      }

      encryptedVehicleDataRequest = 0;
    }
    else
    {
      encryptedVehicleDataRequest = self->_encryptedVehicleDataRequest;
    }
    objc_msgSend(v4, "setObject:forKeyedSubscript:", encryptedVehicleDataRequest, CFSTR("vehicleData"));
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedVehicleDataRequest, 0);
}

@end
