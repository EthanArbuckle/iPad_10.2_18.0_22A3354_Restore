@implementation PKPeerPaymentQuoteResponse

- (PKPeerPaymentQuoteResponse)initWithData:(id)a3 productTimeZone:(id)a4
{
  id v6;
  PKPeerPaymentQuoteResponse *v7;
  PKPeerPaymentQuoteResponse *v8;
  void *v9;
  id v10;
  PKPeerPaymentQuote *v11;
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
  v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PKPeerPaymentQuoteResponse;
  v7 = -[PKWebServiceResponse initWithData:](&v18, sel_initWithData_, a3);
  v8 = v7;
  if (v7)
  {
    -[PKWebServiceResponse JSONObject](v7, "JSONObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;
      v11 = -[PKPeerPaymentQuote initWithDictionary:productTimeZone:]([PKPeerPaymentQuote alloc], "initWithDictionary:productTimeZone:", v10, v6);

      p_super = &v8->_quote->super;
      v8->_quote = v11;
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
  return v8;
}

- (PKPeerPaymentQuote)quote
{
  return self->_quote;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quote, 0);
}

@end
