@implementation PKAccountWebServiceCreditRecoveryPaymentPlansResponse

- (PKAccountWebServiceCreditRecoveryPaymentPlansResponse)initWithData:(id)a3
{
  PKAccountWebServiceCreditRecoveryPaymentPlansResponse *v3;
  PKAccountWebServiceCreditRecoveryPaymentPlansResponse *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  PKCreditRecoveryPaymentPlan *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  PKCreditRecoveryPaymentPlan *v21;
  uint64_t v22;
  NSArray *paymentPlans;
  PKAccountWebServiceCreditRecoveryPaymentPlansResponse *v24;
  objc_class *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  objc_class *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  objc_super v49;
  _BYTE v50[128];
  uint8_t v51[128];
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v49.receiver = self;
  v49.super_class = (Class)PKAccountWebServiceCreditRecoveryPaymentPlansResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v49, sel_initWithData_, a3);
  v4 = v3;
  if (!v3)
  {
LABEL_20:
    v24 = v4;
    goto LABEL_28;
  }
  -[PKWebServiceResponse JSONObject](v3, "JSONObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "PKArrayForKey:", CFSTR("eligiblePaymentPlans"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v5;
    objc_msgSend(v5, "PKArrayForKey:", CFSTR("enrolledPaymentPlans"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v8 = v6;
    v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v46;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v46 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v12);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            PKLogFacilityTypeGetObject(0xEuLL);
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              v30 = (objc_class *)objc_opt_class();
              NSStringFromClass(v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = (objc_class *)objc_opt_class();
              NSStringFromClass(v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v53 = v31;
              v54 = 2114;
              v55 = v33;
              _os_log_impl(&dword_18FC92000, v29, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected eligible plan to be dictionary and received %{public}@", buf, 0x16u);

            }
            v15 = v8;
LABEL_26:
            v5 = v39;

            goto LABEL_27;
          }
          v14 = -[PKCreditRecoveryPaymentPlan initWithDictionary:enrolled:]([PKCreditRecoveryPaymentPlan alloc], "initWithDictionary:enrolled:", v13, 0);
          objc_msgSend(v7, "addObject:", v14);

          ++v12;
        }
        while (v10 != v12);
        v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
        if (v10)
          continue;
        break;
      }
    }

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v15 = v40;
    v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v42;
      while (2)
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v42 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v19);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            PKLogFacilityTypeGetObject(0xEuLL);
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              v35 = (objc_class *)objc_opt_class();
              NSStringFromClass(v35);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = (objc_class *)objc_opt_class();
              NSStringFromClass(v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v53 = v36;
              v54 = 2114;
              v55 = v38;
              _os_log_impl(&dword_18FC92000, v29, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected enrolled plan to be dictionary and received %{public}@", buf, 0x16u);

            }
            goto LABEL_26;
          }
          v21 = -[PKCreditRecoveryPaymentPlan initWithDictionary:enrolled:]([PKCreditRecoveryPaymentPlan alloc], "initWithDictionary:enrolled:", v20, 1);
          objc_msgSend(v7, "addObject:", v21);

          ++v19;
        }
        while (v17 != v19);
        v17 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
        if (v17)
          continue;
        break;
      }
    }

    v22 = objc_msgSend(v7, "copy");
    paymentPlans = v4->_paymentPlans;
    v4->_paymentPlans = (NSArray *)v22;

    goto LABEL_20;
  }
  PKLogFacilityTypeGetObject(0xEuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v53 = v26;
    v54 = 2114;
    v55 = v28;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

  }
LABEL_27:

  v24 = 0;
LABEL_28:

  return v24;
}

- (NSArray)paymentPlans
{
  return self->_paymentPlans;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentPlans, 0);
}

@end
