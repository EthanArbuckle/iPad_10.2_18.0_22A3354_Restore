@implementation PKPeerPaymentRecurringPaymentActionResponse

- (PKPeerPaymentRecurringPaymentActionResponse)initWithData:(id)a3 productTimeZone:(id)a4
{
  id v6;
  PKPeerPaymentRecurringPaymentActionResponse *v7;
  PKPeerPaymentRecurringPaymentActionResponse *v8;
  void *v9;
  id v10;
  PKPeerPaymentRecurringPayment *v11;
  NSObject *p_super;
  objc_class *v13;
  void *v14;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PKPeerPaymentRecurringPaymentActionResponse;
  v7 = -[PKWebServiceResponse initWithData:](&v16, sel_initWithData_, a3);
  v8 = v7;
  if (v7)
  {
    -[PKWebServiceResponse JSONObject](v7, "JSONObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;
      v11 = -[PKPeerPaymentRecurringPayment initWithDictionary:productTimeZone:]([PKPeerPaymentRecurringPayment alloc], "initWithDictionary:productTimeZone:", v10, v6);

      p_super = &v8->_recurringPayment->super;
      v8->_recurringPayment = v11;
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v18 = v14;
        _os_log_impl(&dword_18FC92000, p_super, OS_LOG_TYPE_DEFAULT, "Malformed PKPeerPaymentRecurringPaymentActionResponse: expected dictionary and received %{public}@", buf, 0xCu);

      }
    }

  }
  return v8;
}

- (PKPeerPaymentRecurringPayment)recurringPayment
{
  return self->_recurringPayment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recurringPayment, 0);
}

@end
