@implementation PKPeerPaymentDocumentSubmissionResponse

- (PKPeerPaymentDocumentSubmissionResponse)initWithData:(id)a3
{
  PKPeerPaymentDocumentSubmissionResponse *v3;
  PKPeerPaymentDocumentSubmissionResponse *v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)PKPeerPaymentDocumentSubmissionResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v12, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("result"));
      v6 = objc_claimAutoreleasedReturnValue();
      v4->_status = PKPeerPaymentDocumentSubmissionStatusFromString(v6);
    }
    else
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = (objc_class *)objc_opt_class();
        NSStringFromClass(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v14 = v8;
        v15 = 2114;
        v16 = v10;
        _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

      }
    }

  }
  return v4;
}

- (unint64_t)status
{
  return self->_status;
}

@end
