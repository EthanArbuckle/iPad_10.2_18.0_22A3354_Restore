@implementation PKPeerPaymentRecurringPaymentsResponse

- (PKPeerPaymentRecurringPaymentsResponse)initWithData:(id)a3 productTimeZone:(id)a4
{
  id v6;
  PKPeerPaymentRecurringPaymentsResponse *v7;
  PKPeerPaymentRecurringPaymentsResponse *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  PKPeerPaymentRecurringPayment *v18;
  void *v19;
  uint64_t v20;
  NSArray *recurringPayments;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  uint8_t buf[4];
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v31.receiver = self;
  v31.super_class = (Class)PKPeerPaymentRecurringPaymentsResponse;
  v7 = -[PKWebServiceResponse initWithData:](&v31, sel_initWithData_, a3);
  v8 = v7;
  if (v7)
  {
    -[PKWebServiceResponse JSONObject](v7, "JSONObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = v9;
      v10 = v9;
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      -[NSObject PKArrayForKey:](v10, "PKArrayForKey:", CFSTR("recurringPayments"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v28 != v16)
              objc_enumerationMutation(v13);
            v18 = -[PKPeerPaymentRecurringPayment initWithDictionary:productTimeZone:]([PKPeerPaymentRecurringPayment alloc], "initWithDictionary:productTimeZone:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i), v6);
            if (-[PKPeerPaymentRecurringPayment status](v18, "status"))
              v19 = v11;
            else
              v19 = v12;
            objc_msgSend(v19, "addObject:", v18);

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
        }
        while (v15);
      }

      v20 = objc_msgSend(v11, "copy");
      recurringPayments = v8->_recurringPayments;
      v8->_recurringPayments = (NSArray *)v20;

      v9 = v26;
      if (objc_msgSend(v12, "count"))
      {
        PKLogFacilityTypeGetObject(6uLL);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v33 = v12;
          _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentRecurringPaymentsResponse: received recurring payments with unknown status %@", buf, 0xCu);
        }

      }
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v33 = v24;
        _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Malformed PKPeerPaymentRecurringPaymentsResponse: expected dictionary and received %{public}@", buf, 0xCu);

      }
    }

  }
  return v8;
}

- (NSArray)recurringPayments
{
  return self->_recurringPayments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recurringPayments, 0);
}

@end
