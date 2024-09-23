@implementation PKAccountWebServiceSchedulePaymentResponse

- (PKAccountWebServiceSchedulePaymentResponse)initWithData:(id)a3 account:(id)a4 request:(id)a5
{
  id v7;
  PKAccountWebServiceSchedulePaymentResponse *v8;
  PKAccountWebServiceSchedulePaymentResponse *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  PKAccountPayment *v22;
  NSArray *payments;
  PKAccountWebServiceSchedulePaymentResponse *v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  PKAccountWebServiceSchedulePaymentResponse *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v37.receiver = self;
  v37.super_class = (Class)PKAccountWebServiceSchedulePaymentResponse;
  v8 = -[PKWebServiceResponse initWithData:](&v37, sel_initWithData_, a3);
  v9 = v8;
  if (!v8)
  {
LABEL_13:
    v24 = v9;
    goto LABEL_17;
  }
  -[PKWebServiceResponse JSONObject](v8, "JSONObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = v9;
    objc_msgSend(v10, "PKArrayForKey:", CFSTR("payments"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v32 = v7;
    objc_msgSend(v7, "creditDetails");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "productTimeZone");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v15 = v11;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v34 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v21 = v20;
            v22 = -[PKAccountPayment initWithDictionary:productTimeZone:]([PKAccountPayment alloc], "initWithDictionary:productTimeZone:", v21, v14);
            -[NSArray safelyAddObject:](v12, "safelyAddObject:", v22);

          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v17);
    }

    v9 = v31;
    payments = v31->_payments;
    v31->_payments = v12;

    v7 = v32;
    goto LABEL_13;
  }
  PKLogFacilityTypeGetObject(0xEuLL);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v40 = v27;
    v41 = 2114;
    v42 = v29;
    _os_log_impl(&dword_18FC92000, v25, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

  }
  v24 = 0;
LABEL_17:

  return v24;
}

- (NSArray)payments
{
  return self->_payments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payments, 0);
}

@end
