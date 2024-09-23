@implementation PKPeerPaymentServiceRegistrationResponse

- (PKPeerPaymentServiceRegistrationResponse)initWithData:(id)a3
{
  PKPeerPaymentServiceRegistrationResponse *v3;
  PKPeerPaymentServiceRegistrationResponse *v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSString *deviceIdentifier;
  uint64_t v9;
  NSString *peerPaymentServicesPushTopic;
  uint64_t v11;
  NSObject *p_super;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)PKPeerPaymentServiceRegistrationResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v18, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      objc_msgSend(v6, "PKStringForKey:", CFSTR("deviceIdentifier"));
      v7 = objc_claimAutoreleasedReturnValue();
      deviceIdentifier = v4->_deviceIdentifier;
      v4->_deviceIdentifier = (NSString *)v7;

      objc_msgSend(v6, "PKStringForKey:", CFSTR("peerPaymentServicesPushTopic"));
      v9 = objc_claimAutoreleasedReturnValue();
      peerPaymentServicesPushTopic = v4->_peerPaymentServicesPushTopic;
      v4->_peerPaymentServicesPushTopic = (NSString *)v9;

      objc_msgSend(v6, "PKURLForKey:", CFSTR("peerPaymentServiceURL"));
      v11 = objc_claimAutoreleasedReturnValue();

      p_super = &v4->_peerPaymentServiceURL->super;
      v4->_peerPaymentServiceURL = (NSURL *)v11;
    }
    else
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v20 = v14;
        v21 = 2114;
        v22 = v16;
        _os_log_impl(&dword_18FC92000, p_super, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

      }
    }

  }
  return v4;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSString)peerPaymentServicesPushTopic
{
  return self->_peerPaymentServicesPushTopic;
}

- (NSURL)peerPaymentServiceURL
{
  return self->_peerPaymentServiceURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentServiceURL, 0);
  objc_storeStrong((id *)&self->_peerPaymentServicesPushTopic, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end
