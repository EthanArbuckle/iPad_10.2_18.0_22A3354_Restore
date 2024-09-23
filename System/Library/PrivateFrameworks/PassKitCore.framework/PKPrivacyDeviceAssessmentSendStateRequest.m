@implementation PKPrivacyDeviceAssessmentSendStateRequest

- (PKPrivacyDeviceAssessmentSendStateRequest)initWithPrivacyUiState:(id)a3
{
  id v5;
  PKPrivacyDeviceAssessmentSendStateRequest *v6;
  PKPrivacyDeviceAssessmentSendStateRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPrivacyDeviceAssessmentSendStateRequest;
  v6 = -[PKOverlayableWebServiceRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_privacyUiState, a3);

  return v7;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a4;
  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", a3, &unk_1E2C3E368, 0, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("dsid"));

  objc_msgSend(v10, "setObject:forKeyedSubscript:", self->_privacyUiState, CFSTR("privacyUiState"));
  objc_msgSend(v9, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHTTPBody:", v11);

  v12 = (void *)objc_msgSend(v9, "copy");
  return v12;
}

- (NSNumber)privacyUiState
{
  return self->_privacyUiState;
}

- (void)setPrivacyUiState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyUiState, 0);
}

@end
