@implementation PKPeerPaymentIdentityVerificationRequiredResponse

- (PKPeerPaymentIdentityVerificationRequiredResponse)initWithData:(id)a3
{
  PKPeerPaymentIdentityVerificationRequiredResponse *v3;
  PKPeerPaymentIdentityVerificationRequiredResponse *v4;
  void *v5;
  uint64_t v6;
  NSObject *prerequisiteIdentifier;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)PKPeerPaymentIdentityVerificationRequiredResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v13, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "PKStringForKey:", CFSTR("prerequisiteIdentifier"));
      v6 = objc_claimAutoreleasedReturnValue();
      prerequisiteIdentifier = v4->_prerequisiteIdentifier;
      v4->_prerequisiteIdentifier = (NSString *)v6;
    }
    else
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      prerequisiteIdentifier = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(prerequisiteIdentifier, OS_LOG_TYPE_DEFAULT))
      {
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v15 = v9;
        v16 = 2114;
        v17 = v11;
        _os_log_impl(&dword_18FC92000, prerequisiteIdentifier, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

      }
    }

  }
  return v4;
}

- (NSString)prerequisiteIdentifier
{
  return self->_prerequisiteIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prerequisiteIdentifier, 0);
}

@end
