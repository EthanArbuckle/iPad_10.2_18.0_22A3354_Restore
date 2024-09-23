@implementation PKPeerPaymentWebServiceBadRequestResponse

- (PKPeerPaymentWebServiceBadRequestResponse)initWithData:(id)a3
{
  PKPeerPaymentWebServiceBadRequestResponse *v3;
  PKPeerPaymentWebServiceBadRequestResponse *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *serverDebugDescription;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)PKPeerPaymentWebServiceBadRequestResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v14, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "PKStringForKey:", CFSTR("errorCode"));
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSObject integerValue](v6, "integerValue"));
      else
        objc_msgSend(v5, "PKNumberForKey:", CFSTR("errorCode"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&v4->_errorCode, v10);

      objc_msgSend(v5, "PKStringForKey:", CFSTR("debugDescription"));
      v11 = objc_claimAutoreleasedReturnValue();
      serverDebugDescription = v4->_serverDebugDescription;
      v4->_serverDebugDescription = (NSString *)v11;

    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v16 = v9;
        _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@", buf, 0xCu);

      }
    }

  }
  return v4;
}

- (NSNumber)errorCode
{
  return self->_errorCode;
}

- (NSString)serverDebugDescription
{
  return self->_serverDebugDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverDebugDescription, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
}

@end
