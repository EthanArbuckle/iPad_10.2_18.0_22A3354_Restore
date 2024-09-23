@implementation PKPeerPaymentEncryptionCertificatesResponse

- (PKPeerPaymentEncryptionCertificatesResponse)initWithData:(id)a3
{
  PKPeerPaymentEncryptionCertificatesResponse *v3;
  PKPeerPaymentEncryptionCertificatesResponse *v4;
  void *v5;
  id v6;
  PKPeerPaymentEncryptionCertificate *v7;
  NSObject *p_super;
  objc_class *v9;
  void *v10;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)PKPeerPaymentEncryptionCertificatesResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v12, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      v7 = -[PKPeerPaymentEncryptionCertificate initWithDictionary:]([PKPeerPaymentEncryptionCertificate alloc], "initWithDictionary:", v6);

      p_super = &v4->_certificate->super;
      v4->_certificate = v7;
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v14 = v10;
        _os_log_impl(&dword_18FC92000, p_super, OS_LOG_TYPE_DEFAULT, "Malformed PKPeerPaymentEncryptionCertificatesResponse: expected dictionary and received %{public}@", buf, 0xCu);

      }
    }

  }
  return v4;
}

- (PKPeerPaymentEncryptionCertificate)certificate
{
  return self->_certificate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificate, 0);
}

@end
