@implementation PKPaymentBillingAgreementViewPresenter

+ (void)presentCell:(id)a3 withDataItem:(id)a4 shouldShowSeperator:(BOOL)a5 forPaymentRequest:(id)a6 cellProvider:(id)a7
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_BILLING_AGREEMENT"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pk_uppercaseAttributedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLabel:", v11);

  objc_msgSend(v8, "setShowsDisclosure:", 0);
  objc_msgSend(v8, "setShowsSeparator:", 1);
  objc_msgSend(v8, "setSelectionStyle:", 0);
  v12 = v9;
  objc_msgSend(v12, "billingAgreement");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  if (v14)
  {
    v15 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v12, "billingAgreement");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithString:", v16);
    v18 = (id)objc_msgSend(v8, "addValue:", v17);

  }
  PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_BILLING_AGREEMENT_PAYMENT_METHOD_STORED"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc(MEMORY[0x1E0CB3778]);
  v24 = *MEMORY[0x1E0D6ACC8];
  v25[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithString:attributes:", v19, v21);
  v23 = (id)objc_msgSend(v8, "addValue:", v22);

}

@end
