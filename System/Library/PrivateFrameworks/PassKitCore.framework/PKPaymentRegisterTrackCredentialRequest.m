@implementation PKPaymentRegisterTrackCredentialRequest

- (PKPaymentRegisterTrackCredentialRequest)initWithCredential:(id)a3 registrationData:(id)a4 metadata:(id)a5
{
  id v8;
  PKPaymentRegisterTrackCredentialRequest *v9;
  uint64_t v10;
  NSDictionary *registrationData;
  PKPaymentRegisterTrackCredentialRequest *v12;
  NSObject *v13;
  uint8_t v15[16];
  objc_super v16;

  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentRegisterTrackCredentialRequest;
  v9 = -[PKPaymentRegisterCredentialRequest initWithCredential:metadata:](&v16, sel_initWithCredential_metadata_, a3, a5);
  if (v9
    && (dictionaryFromSubcredentialEncryptedRequest(v8),
        v10 = objc_claimAutoreleasedReturnValue(),
        registrationData = v9->_registrationData,
        v9->_registrationData = (NSDictionary *)v10,
        registrationData,
        !v9->_registrationData))
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Missing registrationData on register request", v15, 2u);
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
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentRegisterTrackCredentialRequest;
  v4 = a3;
  -[PKPaymentRegisterCredentialRequest buildRequestBody:](&v5, sel_buildRequestBody_, v4);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_registrationData, CFSTR("keyData"), v5.receiver, v5.super_class);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationData, 0);
}

@end
