@implementation PKPrivacyDeviceAssessmentRetrieveStateResponse

- (PKPrivacyDeviceAssessmentRetrieveStateResponse)initWithData:(id)a3
{
  PKPrivacyDeviceAssessmentRetrieveStateResponse *v3;
  PKPrivacyDeviceAssessmentRetrieveStateResponse *v4;
  void *v5;
  uint64_t v6;
  void *privacyUiState;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)PKPrivacyDeviceAssessmentRetrieveStateResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v14, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "PKNumberForKey:", CFSTR("privacyUiState"));
      v6 = objc_claimAutoreleasedReturnValue();
      privacyUiState = v4->_privacyUiState;
      v4->_privacyUiState = (NSNumber *)v6;
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v16 = v10;
        v17 = 2112;
        v18 = v11;
        v12 = v11;
        _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);

      }
      privacyUiState = v4;
      v4 = 0;
    }

  }
  return v4;
}

- (NSNumber)privacyUiState
{
  return self->_privacyUiState;
}

- (void)setPrivacyUiState:(id)a3
{
  objc_storeStrong((id *)&self->_privacyUiState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyUiState, 0);
}

@end
