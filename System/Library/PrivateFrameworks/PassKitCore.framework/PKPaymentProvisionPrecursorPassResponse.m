@implementation PKPaymentProvisionPrecursorPassResponse

- (PKPaymentProvisionPrecursorPassResponse)initWithData:(id)a3
{
  PKPaymentProvisionPrecursorPassResponse *v3;
  PKPaymentProvisionPrecursorPassResponse *v4;
  void *v5;
  PKPaymentProvisionPrecursorPassResponse *v6;
  NSObject *v7;
  uint64_t v8;
  NSArray *downloadablePasses;
  NSArray *v10;
  NSObject *v11;
  void *v12;
  id v13;
  objc_class *v14;
  void *v15;
  void *v16;
  id v17;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)PKPaymentProvisionPrecursorPassResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v19, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[PKPaymentProvisionPrecursorPassResponse PKArrayContaining:forKey:](v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("passes"));
      v7 = objc_claimAutoreleasedReturnValue();
      -[NSObject pk_arrayBySafelyApplyingBlock:](v7, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_1175);
      v8 = objc_claimAutoreleasedReturnValue();
      downloadablePasses = v4->_downloadablePasses;
      v4->_downloadablePasses = (NSArray *)v8;

      v10 = v4->_downloadablePasses;
      if (v10 && -[NSArray count](v10, "count"))
        goto LABEL_12;
      PKLogFacilityTypeGetObject(6uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v21 = v12;
        v13 = v12;
        _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Malformed response: missing downloadable pass urls inside %@", buf, 0xCu);

      }
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v21 = v15;
        v22 = 2112;
        v23 = v16;
        v17 = v16;
        _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);

      }
      v6 = v4;
    }
    v4 = 0;
LABEL_12:

  }
  return v4;
}

PKPaymentProvisioningPassData *__56__PKPaymentProvisionPrecursorPassResponse_initWithData___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKPaymentProvisioningPassData *v3;

  v2 = a2;
  v3 = -[PKPaymentProvisioningPassData initWithDictionary:]([PKPaymentProvisioningPassData alloc], "initWithDictionary:", v2);

  return v3;
}

- (NSArray)downloadablePasses
{
  return self->_downloadablePasses;
}

- (void)setDownloadablePasses:(id)a3
{
  objc_storeStrong((id *)&self->_downloadablePasses, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadablePasses, 0);
}

@end
