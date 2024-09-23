@implementation PKSafariCardNotificationManager

- (PKSafariCardNotificationManager)init
{
  PKSafariCardNotificationManager *v2;
  PKPaymentService *v3;
  PKPaymentService *paymentService;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKSafariCardNotificationManager;
  v2 = -[PKSafariCardNotificationManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PKPaymentService);
    paymentService = v2->_paymentService;
    v2->_paymentService = v3;

  }
  return v2;
}

- (void)userDidPerformAction:(int64_t)a3 withCard:(id)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  PKSafariCardNotificationManager *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  int64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  PKLogFacilityTypeGetObject(6uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v15 = v9;
    v16 = 2048;
    v17 = a3;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "%@ called with action %ld", buf, 0x16u);

  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__PKSafariCardNotificationManager_userDidPerformAction_withCard___block_invoke;
  v11[3] = &unk_1E2ACF480;
  v12 = v7;
  v13 = self;
  v10 = v7;
  -[PKSafariCardNotificationManager _eligibleToCheckWithCompletion:](self, "_eligibleToCheckWithCompletion:", v11);

}

void __65__PKSafariCardNotificationManager_userDidPerformAction_withCard___block_invoke(uint64_t a1, int a2)
{
  PKPaymentSafariCredential *v3;
  PKPaymentSafariCredential *v4;
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  const char *v9;
  uint8_t v10[16];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = -[PKPaymentSafariCredential initWithSafariDictionary:]([PKPaymentSafariCredential alloc], "initWithSafariDictionary:", *(_QWORD *)(a1 + 32));
    v4 = v3;
    if (v3)
    {
      v5 = -[PKPaymentSafariCredential canCheckEligibility](v3, "canCheckEligibility");
      PKLogFacilityTypeGetObject(6uLL);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      if (v5)
      {
        if (v7)
        {
          *(_WORD *)v10 = 0;
          _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Safari Import: Sending credential to be suggested based on checks.", v10, 2u);
        }

        v8 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
        v11[0] = v4;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
        v6 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "suggestPaymentSafariCredentialImport:withCompletion:", v6, &__block_literal_global_113);
        goto LABEL_12;
      }
      if (v7)
      {
        *(_WORD *)v10 = 0;
        v9 = "Safari Import: Not sending credential as it's missing a required field for eligibility checking.";
        goto LABEL_11;
      }
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        v9 = "Safari Import: Error converting Safari dictionary into credential.";
LABEL_11:
        _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      }
    }
LABEL_12:

  }
}

void __65__PKSafariCardNotificationManager_userDidPerformAction_withCard___block_invoke_9(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PKLogFacilityTypeGetObject(6uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v6)
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Safari Import: Success passing Safari credential for import suggestion.", (uint8_t *)&v8, 2u);
    }
  }
  else if (v6)
  {
    objc_msgSend(v4, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Safari Import: Error passing Safari credential for import suggestion: %@", (uint8_t *)&v8, 0xCu);

  }
}

- (void)_eligibleToCheckWithCompletion:(id)a3
{
  void (**v3)(id, uint64_t);
  int v4;
  unint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  __int16 v9[8];
  uint8_t v10[16];
  uint8_t buf[16];

  v3 = (void (**)(id, uint64_t))a3;
  v4 = _os_feature_enabled_impl();
  if (v3)
  {
    if ((v4 & 1) != 0)
    {
      v5 = PKCurrentPassbookState();
      PKLogFacilityTypeGetObject(6uLL);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      if (v5 < 2)
      {
        if (v7)
        {
          v9[0] = 0;
          _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Safari Import Eligibility: All checks have passed.", (uint8_t *)v9, 2u);
        }

        v3[2](v3, 1);
        goto LABEL_15;
      }
      if (v7)
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Safari Import Eligibility: Wallet has been deleted.", v10, 2u);
      }

    }
    v3[2](v3, 0);
    goto LABEL_15;
  }
  if (v4)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Safari Import Eligibility: No completion block provided to eligibility check.", buf, 2u);
    }

  }
LABEL_15:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentService, 0);
}

@end
