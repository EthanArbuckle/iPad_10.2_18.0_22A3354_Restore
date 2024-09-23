@implementation PKPaymentOfferWebServiceDynamicContentResponse

- (PKPaymentOfferWebServiceDynamicContentResponse)initWithData:(id)a3
{
  PKPaymentOfferWebServiceDynamicContentResponse *v3;
  PKPaymentOfferWebServiceDynamicContentResponse *v4;
  void *v5;
  void *v6;
  PKPaymentOfferDynamicContent *v7;
  PKPaymentOfferDynamicContent *dynamicContent;
  PKPaymentOfferWebServiceDynamicContentResponse *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentOfferWebServiceDynamicContentResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v16, sel_initWithData_, a3);
  v4 = v3;
  if (!v3)
  {
LABEL_6:
    v9 = v4;
    goto LABEL_10;
  }
  -[PKWebServiceResponse JSONObject](v3, "JSONObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "PKDictionaryForKey:", CFSTR("dynamicContent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v7 = -[PKPaymentOfferDynamicContent initWithDictionary:]([PKPaymentOfferDynamicContent alloc], "initWithDictionary:", v6);
      dynamicContent = v4->_dynamicContent;
      v4->_dynamicContent = v7;

    }
    goto LABEL_6;
  }
  PKLogFacilityTypeGetObject(6uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v12;
    v19 = 2114;
    v20 = v14;
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

  }
  v9 = 0;
LABEL_10:

  return v9;
}

- (PKPaymentOfferDynamicContent)dynamicContent
{
  return self->_dynamicContent;
}

- (void)setDynamicContent:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicContent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicContent, 0);
}

@end
