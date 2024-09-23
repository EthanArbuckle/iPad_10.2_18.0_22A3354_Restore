@implementation PKAccountAutomaticPaymentsController

- (PKAccountAutomaticPaymentsController)initWithAccountService:(id)a3 paymentWebService:(id)a4 account:(id)a5 context:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  PKAccountAutomaticPaymentsController *v14;
  PKAccountAutomaticPaymentsController *v15;
  void *v16;
  uint64_t v17;
  NSTimeZone *productTimeZone;
  id v19;
  uint64_t v20;
  NSCalendar *productCalendar;
  NSDateFormatter *v22;
  NSDateFormatter *monthDayFormatter;
  objc_super v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v25.receiver = self;
  v25.super_class = (Class)PKAccountAutomaticPaymentsController;
  v14 = -[PKAccountAutomaticPaymentsController init](&v25, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_accountService, a3);
    objc_storeStrong((id *)&v15->_paymentWebService, a4);
    objc_storeStrong((id *)&v15->_account, a5);
    objc_msgSend(v13, "creditDetails");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "productTimeZone");
    v17 = objc_claimAutoreleasedReturnValue();
    productTimeZone = v15->_productTimeZone;
    v15->_productTimeZone = (NSTimeZone *)v17;

    v19 = objc_alloc(MEMORY[0x1E0C99D48]);
    v20 = objc_msgSend(v19, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    productCalendar = v15->_productCalendar;
    v15->_productCalendar = (NSCalendar *)v20;

    -[NSCalendar setTimeZone:](v15->_productCalendar, "setTimeZone:", v15->_productTimeZone);
    v15->_featureIdentifier = objc_msgSend(v13, "feature");
    v15->_paymentSetupContext = a6;
    v15->_needsPreflight = 1;
    v22 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    monthDayFormatter = v15->_monthDayFormatter;
    v15->_monthDayFormatter = v22;

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v15->_monthDayFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMM d"));
    -[NSDateFormatter setTimeZone:](v15->_monthDayFormatter, "setTimeZone:", v15->_productTimeZone);
    -[PKAccountAutomaticPaymentsController _resetPaymentConfiguration](v15, "_resetPaymentConfiguration");
  }

  return v15;
}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  v5 = v4;
  if (self->_needsPreflight)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __64__PKAccountAutomaticPaymentsController_preflightWithCompletion___block_invoke;
    v8[3] = &unk_1E3E61BB8;
    objc_copyWeak(&v10, &location);
    v9 = v5;
    objc_msgSend(v6, "updatePaymentFundingSourcesForAccountIdentifier:force:completion:", v7, 1, v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
  }

}

void __64__PKAccountAutomaticPaymentsController_preflightWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__PKAccountAutomaticPaymentsController_preflightWithCompletion___block_invoke_2;
  v9[3] = &unk_1E3E689E0;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v10 = v6;
  v11 = v5;
  v12 = *(id *)(a1 + 32);
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(&v13);
}

void __64__PKAccountAutomaticPaymentsController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  uint64_t v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = WeakRetained;
    if (!v4)
    {
      objc_storeStrong(WeakRetained + 8, *(id *)(a1 + 40));
      v3 = v6;
      *((_BYTE *)v6 + 177) = 0;
    }
    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
    {
      (*(void (**)(uint64_t, BOOL, _QWORD))(v5 + 16))(v5, v4 == 0, *(_QWORD *)(a1 + 32));
      v3 = v6;
    }
  }

}

- (void)_resetPaymentConfiguration
{
  PKCurrencyAmount *amount;
  NSDate *paymentDate;

  amount = self->_amount;
  self->_amount = 0;

  self->_paymentFrequency = 0;
  self->_paymentPreset = 0;
  paymentDate = self->_paymentDate;
  self->_paymentDate = 0;

}

- (id)_schedulePaymentRequestWithBankAccount:(id)a3
{
  PKAccountWebServiceSchedulePaymentRequest *schedulePaymentRequest;
  PKAccount *account;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  PKCurrencyAmount *amount;
  PKCurrencyAmount *v12;
  NSDecimalNumber *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  int64_t paymentFrequency;
  int64_t paymentPreset;
  NSDate *paymentDate;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  PKAccountWebServiceSchedulePaymentRequest *v27;
  NSString *v29;

  schedulePaymentRequest = self->_schedulePaymentRequest;
  if (!schedulePaymentRequest)
  {
    account = self->_account;
    v6 = a3;
    -[PKAccount schedulePaymentFeatureDescriptor](account, "schedulePaymentFeatureDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "paymentTermsIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKAccount creditDetails](self->_account, "creditDetails");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currencyCode");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();

    amount = self->_amount;
    if (amount)
    {
      v12 = amount;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
      v13 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      PKCurrencyAmountCreate(v13, v10);
      v12 = (PKCurrencyAmount *)objc_claimAutoreleasedReturnValue();

    }
    v29 = v10;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66890]), "initWithType:", 1);
    objc_msgSend(v6, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setIdentifier:", v15);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D668C8]), "initWithCurrencyAmount:fundingSource:", v12, v14);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D668D0]), "initWithScheduledPayment:", v16);
    v18 = objc_alloc_init(MEMORY[0x1E0D66898]);
    paymentFrequency = self->_paymentFrequency;
    paymentPreset = self->_paymentPreset;
    if (paymentFrequency == 7)
    {
      paymentDate = self->_paymentDate;
      self->_paymentDate = 0;

    }
    objc_msgSend(v18, "setFrequency:", paymentFrequency);
    objc_msgSend(v18, "setPreset:", paymentPreset);
    -[PKAccount creditDetails](self->_account, "creditDetails");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "productTimeZone");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setScheduleTimeZone:", v23);

    objc_msgSend(v18, "setScheduledDate:", self->_paymentDate);
    objc_msgSend(v18, "setPaymentTermsIdentifier:", v8);
    if (paymentFrequency == 6 && self->_scheduledDay)
    {
      objc_msgSend(v18, "setScheduledDay:");
      objc_msgSend(v18, "setScheduledDate:", 0);
    }
    v24 = objc_alloc_init(MEMORY[0x1E0D669D0]);
    objc_msgSend(v24, "setScheduledPayments:", v17);
    objc_msgSend(v24, "setScheduleDetails:", v18);
    -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAccountIdentifier:", v25);

    -[PKAccount accountBaseURL](self->_account, "accountBaseURL");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setBaseURL:", v26);

    v27 = self->_schedulePaymentRequest;
    self->_schedulePaymentRequest = (PKAccountWebServiceSchedulePaymentRequest *)v24;

    schedulePaymentRequest = self->_schedulePaymentRequest;
  }
  return schedulePaymentRequest;
}

- (id)_paymentRequest
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66900]), "initWithAccount:peerPaymentAccount:peerPaymentPass:transferType:fundingSources:currencyAmount:paymentDate:objectSettings:", self->_account, 0, 0, 1, self->_fundingSources, self->_amount, self->_paymentDate, 0);
  objc_msgSend(v3, "setConfirmationStyle:", 0);
  -[PKAccountAutomaticPaymentsController _paymentSummaryItems](self, "_paymentSummaryItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPaymentSummaryItems:", v4);

  objc_msgSend(v3, "setPaymentFrequency:", self->_paymentFrequency);
  return v3;
}

- (id)_paymentSummaryItems
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (self->_paymentPreset > 3uLL)
  {
    v3 = 0;
  }
  else
  {
    PKLocalizedFeatureString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PKCurrencyAmount amount](self->_amount, "amount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0D67358], "summaryItemWithLabel:amount:", v3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_addNewBankAccountIfNecessary:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSArray *fundingSources;
  NSArray *v13;
  NSArray *v14;
  BOOL v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSArray *v21;
  void *v22;
  void *v23;
  NSArray *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = self->_fundingSources;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "identifier", (_QWORD)v25);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        fundingSources = v10;
        v13 = v11;
        if (fundingSources == v13)
        {

          v21 = fundingSources;
          goto LABEL_18;
        }
        v14 = v13;
        if (fundingSources)
          v15 = v13 == 0;
        else
          v15 = 1;
        if (v15)
        {

        }
        else
        {
          v16 = -[NSArray isEqualToString:](fundingSources, "isEqualToString:", v13);

          if ((v16 & 1) != 0)
            goto LABEL_19;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v7)
        continue;
      break;
    }
  }

  v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E0D66888]);
  -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray setAccountIdentifier:](v5, "setAccountIdentifier:", v17);

  objc_msgSend(v4, "bankName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray setName:](v5, "setName:", v18);

  -[NSArray setStatus:](v5, "setStatus:", objc_msgSend(v4, "status"));
  objc_msgSend(v4, "routingNumber");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray setRoutingNumber:](v5, "setRoutingNumber:", v19);

  objc_msgSend(v4, "accountNumber");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray setAccountNumber:](v5, "setAccountNumber:", v20);

  v21 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66890]), "initWithType:", 1);
  objc_msgSend(v4, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray setIdentifier:](v21, "setIdentifier:", v22);

  objc_msgSend(v4, "accountSuffix");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray setAccountSuffix:](v21, "setAccountSuffix:", v23);

  -[NSArray setFundingDetails:](v21, "setFundingDetails:", v5);
  v24 = (NSArray *)-[NSArray mutableCopy](self->_fundingSources, "mutableCopy");
  -[NSArray addObject:](v24, "addObject:", v21);
  fundingSources = self->_fundingSources;
  self->_fundingSources = v24;
LABEL_18:

LABEL_19:
}

- (id)firstAutomaticPaymentDateForSelectedDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t paymentPreset;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  id v17;

  v4 = a3;
  v5 = v4;
  if (!v4 || self->_paymentPreset == 1)
  {
    v10 = v4;
    goto LABEL_19;
  }
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountSummary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  paymentPreset = self->_paymentPreset;
  if (paymentPreset == 3)
  {
    objc_msgSend(v7, "remainingStatementBalance");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (paymentPreset != 2)
      goto LABEL_10;
    objc_msgSend(v7, "remainingMinimumPayment");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v9;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "compare:", v11) != -1;

    goto LABEL_11;
  }
LABEL_10:
  v13 = 0;
LABEL_11:
  objc_msgSend(v7, "balanceSummary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "closingDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 && (objc_msgSend(v5, "compare:", v15) != 1 ? (v16 = v13) : (v16 = 0), v16))
  {
    -[NSCalendar dateByAddingUnit:value:toDate:options:](self->_productCalendar, "dateByAddingUnit:value:toDate:options:", 8, 1, v5, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = v5;
  }
  v10 = v17;

LABEL_19:
  return v10;
}

- (id)alertControllerForScheduledDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;

  v4 = a3;
  if (v4 && (-[PKAccount isClosedAndChargedOff](self->_account, "isClosedAndChargedOff") & 1) == 0)
  {
    -[PKAccount creditDetails](self->_account, "creditDetails");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountSummary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "paymentDueDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && objc_msgSend(v8, "compare:", v4) == -1)
    {
      if (self->_paymentPreset == 2)
        objc_msgSend(v7, "remainingMinimumPayment");
      else
        objc_msgSend(v7, "remainingStatementBalance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10
        && (objc_msgSend(MEMORY[0x1E0CB3598], "zero"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v12 = objc_msgSend(v11, "compare:", v10),
            v11,
            v12 == -1))
      {
        -[NSDateFormatter stringFromDate:](self->_monthDayFormatter, "stringFromDate:", v4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedFeatureString();
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSDateFormatter stringFromDate:](self->_monthDayFormatter, "stringFromDate:", v9, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedFeatureString();
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v13, v14, 1, v17);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)minimumPaymentDayForPreset:(int64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
    return 11;
  else
    return 1;
}

- (BOOL)canPerformScheduleAutomaticPaymentsWithPreset:(int64_t)a3 frequency:(int64_t)a4 amount:(id)a5 paymentDate:(id)a6
{
  id v10;
  id v11;
  void *v12;
  BOOL v13;
  char v14;
  BOOL v15;
  void *v16;
  void *v17;
  BOOL v18;
  char v19;
  BOOL v20;
  BOOL v21;

  v10 = a5;
  v11 = a6;
  v12 = v11;
  v13 = (unint64_t)(a4 - 4) > 1 || a3 != 1;
  v14 = (unint64_t)(a4 - 6) >= 2 && v13;
  v15 = v10 == 0;
  if (a3 != 1)
  {
    if (a4 != 7)
    {
      if (v11)
        v18 = -[NSCalendar component:fromDate:](self->_productCalendar, "component:fromDate:", 16, v11) > 10;
      else
        v18 = 0;
      goto LABEL_18;
    }
    goto LABEL_15;
  }
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "amount");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v16, "compare:", v17) == -1;

  }
  else
  {
    v15 = 0;
  }
  if (a4 == 7)
  {
LABEL_15:
    v18 = v12 == 0;
    goto LABEL_18;
  }
  v18 = v12 != 0;
LABEL_18:
  if (a3)
    v19 = v14;
  else
    v19 = 1;
  v20 = v15 && v18;
  v21 = (v19 & 1) == 0 && v20;

  return v21;
}

- (void)performScheduleAutomaticPayments:(id)a3
{
  void *v4;
  void *v5;
  id performScheduleAutomaticPaymentsCompletion;
  id aBlock;

  aBlock = a3;
  -[PKAccountAutomaticPaymentsController _paymentRequest](self, "_paymentRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = _Block_copy(aBlock);
    performScheduleAutomaticPaymentsCompletion = self->_performScheduleAutomaticPaymentsCompletion;
    self->_performScheduleAutomaticPaymentsCompletion = v5;

    -[PKAccountAutomaticPaymentsController _performPaymentRequest:](self, "_performPaymentRequest:", v4);
  }
  else if (aBlock)
  {
    (*((void (**)(id, _QWORD, _QWORD))aBlock + 2))(aBlock, 0, 0);
  }

}

- (void)performScheduleAutomaticPaymentsFromViewController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, int, void *);
  void *v9;
  id v10;
  id v11;
  id from;
  id location;

  v4 = a3;
  objc_initWeak(&location, v4);
  objc_initWeak(&from, self);
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __91__PKAccountAutomaticPaymentsController_performScheduleAutomaticPaymentsFromViewController___block_invoke;
  v9 = &unk_1E3E765C0;
  objc_copyWeak(&v10, &from);
  objc_copyWeak(&v11, &location);
  v5 = _Block_copy(&v6);
  -[PKAccountAutomaticPaymentsController performScheduleAutomaticPayments:](self, "performScheduleAutomaticPayments:", v5, v6, v7, v8, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __91__PKAccountAutomaticPaymentsController_performScheduleAutomaticPaymentsFromViewController___block_invoke(uint64_t a1, int a2, void *a3)
{
  _QWORD *WeakRetained;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = v6;
  if (WeakRetained && v6)
  {
    if (a2)
    {
      objc_msgSend(WeakRetained, "presentNextViewControllerFromViewController:", v6);
    }
    else if (v10)
    {
      +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", v10, WeakRetained[23], 0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = PKAlertForDisplayableErrorWithHandlers(v8, 0, 0, 0);
      objc_msgSend(v7, "presentViewController:animated:completion:", v9, 1, 0);

    }
  }

}

- (void)presentNextViewControllerFromViewController:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __84__PKAccountAutomaticPaymentsController_presentNextViewControllerFromViewController___block_invoke;
  v6[3] = &unk_1E3E63BA0;
  v7 = v4;
  v5 = v4;
  -[PKAccountAutomaticPaymentsController nextViewControllerFromViewController:withCompletion:](self, "nextViewControllerFromViewController:withCompletion:", v5, v6);

}

void __84__PKAccountAutomaticPaymentsController_presentNextViewControllerFromViewController___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    v3 = a2;
    objc_msgSend(v2, "navigationController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pk_presentPaymentSetupViewController:animated:completion:", v3, 1, 0);

  }
}

- (void)nextViewControllerFromViewController:(id)a3 withCompletion:(id)a4
{
  void (**v6)(id, id);
  int v7;
  id v8;
  void **p_viewPaymentController;
  PKAccountAutomaticPaymentsController *v10;
  void *heroViewController;
  PKAccountAutomaticPaymentsPresetViewController *v12;
  void *presetViewController;
  PKAccountAutomaticPaymentsSetupCompleteViewController *v14;
  PKAccountAutomaticPaymentsDateViewController *v15;
  PKAccountAutomaticPaymentsConfigurationViewController *configurationViewController;
  PKAccountAutomaticPaymentsConfigurationViewController *v17;
  PKAccountAutomaticPaymentsHeroViewController *v18;
  PKAccountAutomaticPaymentsDateViewController *v19;

  v19 = (PKAccountAutomaticPaymentsDateViewController *)a3;
  v6 = (void (**)(id, id))a4;
  if (v6)
  {
    v7 = -[PKAccount isClosedAndChargedOff](self->_account, "isClosedAndChargedOff");
    if (!v19)
    {
      if (-[NSArray count](self->_automaticPayments, "count"))
      {
        p_viewPaymentController = (void **)&self->_viewPaymentController;
LABEL_24:
        heroViewController = *p_viewPaymentController;
        goto LABEL_25;
      }
      p_viewPaymentController = (void **)&self->_heroViewController;
      heroViewController = self->_heroViewController;
      if (!heroViewController)
      {
        v18 = -[PKAccountAutomaticPaymentsHeroViewController initWithController:]([PKAccountAutomaticPaymentsHeroViewController alloc], "initWithController:", self);
        presetViewController = self->_heroViewController;
        self->_heroViewController = v18;
        goto LABEL_23;
      }
      goto LABEL_25;
    }
    if ((PKAccountAutomaticPaymentsDateViewController *)self->_heroViewController == v19)
    {
      v10 = self;
      if (!v7)
      {
        p_viewPaymentController = (void **)&self->_presetViewController;
        heroViewController = self->_presetViewController;
        if (!heroViewController)
        {
          v12 = -[PKAccountAutomaticPaymentsPresetViewController initWithController:]([PKAccountAutomaticPaymentsPresetViewController alloc], "initWithController:", self);
          presetViewController = self->_presetViewController;
          self->_presetViewController = v12;
LABEL_23:

          goto LABEL_24;
        }
LABEL_25:
        v8 = heroViewController;
        goto LABEL_26;
      }
    }
    else
    {
      if ((PKAccountAutomaticPaymentsDateViewController *)self->_presetViewController != v19)
      {
        if (self->_dateViewController != v19
          && (PKAccountAutomaticPaymentsDateViewController *)self->_configurationViewController != v19
          && (PKAccountAutomaticPaymentsDateViewController *)self->_minimumPaymentDisclosureViewController != v19)
        {
          v8 = 0;
LABEL_26:
          v6[2](v6, v8);

          goto LABEL_27;
        }
        p_viewPaymentController = (void **)&self->_setupCompleteViewController;
        heroViewController = self->_setupCompleteViewController;
        if (!heroViewController)
        {
          v14 = -[PKAccountAutomaticPaymentsSetupCompleteViewController initWithController:]([PKAccountAutomaticPaymentsSetupCompleteViewController alloc], "initWithController:", self);
          presetViewController = self->_setupCompleteViewController;
          self->_setupCompleteViewController = v14;
          goto LABEL_23;
        }
        goto LABEL_25;
      }
      v10 = self;
      if ((self->_paymentPreset & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        p_viewPaymentController = (void **)&self->_dateViewController;
        heroViewController = self->_dateViewController;
        if (!heroViewController)
        {
          v15 = -[PKAccountAutomaticPaymentsDateViewController initWithController:]([PKAccountAutomaticPaymentsDateViewController alloc], "initWithController:", self);
          presetViewController = self->_dateViewController;
          self->_dateViewController = v15;
          goto LABEL_23;
        }
        goto LABEL_25;
      }
    }
    configurationViewController = v10->_configurationViewController;
    p_viewPaymentController = (void **)&v10->_configurationViewController;
    heroViewController = configurationViewController;
    if (!configurationViewController)
    {
      v17 = -[PKAccountAutomaticPaymentsConfigurationViewController initWithController:]([PKAccountAutomaticPaymentsConfigurationViewController alloc], "initWithController:", self);
      presetViewController = self->_configurationViewController;
      self->_configurationViewController = v17;
      goto LABEL_23;
    }
    goto LABEL_25;
  }
LABEL_27:

}

- (void)_performPaymentRequest:(id)a3
{
  objc_class *v4;
  id v5;
  PKPaymentAuthorizationCoordinator *v6;
  PKPaymentAuthorizationCoordinator *paymentAuthorizationCoordinator;

  v4 = (objc_class *)MEMORY[0x1E0D67088];
  v5 = a3;
  v6 = (PKPaymentAuthorizationCoordinator *)objc_msgSend([v4 alloc], "initWithPaymentRequest:", v5);

  paymentAuthorizationCoordinator = self->_paymentAuthorizationCoordinator;
  self->_paymentAuthorizationCoordinator = v6;

  -[PKPaymentAuthorizationCoordinator setDelegate:](self->_paymentAuthorizationCoordinator, "setDelegate:", self);
  -[PKPaymentAuthorizationCoordinator _setPrivateDelegate:](self->_paymentAuthorizationCoordinator, "_setPrivateDelegate:", self);
  -[PKPaymentAuthorizationCoordinator presentWithCompletion:](self->_paymentAuthorizationCoordinator, "presentWithCompletion:", &__block_literal_global_194);
}

void __63__PKAccountAutomaticPaymentsController__performPaymentRequest___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a2;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "_paymentAuthorizationCoordinator presentWithCompletion: completed with success:%d", (uint8_t *)v4, 8u);
  }

}

- (void)_performApplePayTrustSignatureRequestWithSignature:(id)a3 completion:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  PKPaymentWebService *paymentWebService;
  PKAccount *account;
  id v12;
  _QWORD v13[5];
  id v14;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0D66960];
  v8 = a3;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithApplePayTrustProtocol:", self->_schedulePaymentRequest);
  objc_msgSend(v9, "setSignature:", v8);

  paymentWebService = self->_paymentWebService;
  account = self->_account;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __102__PKAccountAutomaticPaymentsController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke;
  v13[3] = &unk_1E3E76608;
  v13[4] = self;
  v14 = v6;
  v12 = v6;
  -[PKPaymentWebService applePayTrustSignatureRequestWithRequest:account:completion:](paymentWebService, "applePayTrustSignatureRequestWithRequest:account:completion:", v9, account, v13);

}

void __102__PKAccountAutomaticPaymentsController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __102__PKAccountAutomaticPaymentsController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_2;
  v10[3] = &unk_1E3E622D8;
  v7 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v13 = v7;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

void __102__PKAccountAutomaticPaymentsController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    LOBYTE(v2) = *(_QWORD *)(a1 + 48) == 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 176) = v2;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(a1 + 48));
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D670A8]), "initWithStatus:errors:", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 176) == 0, 0);
  v4 = *(void **)(a1 + 40);
  if (v4 && !*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(v4, "payments");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "paymentDate");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 96);
    *(_QWORD *)(v8 + 96) = v7;

    objc_msgSend(v6, "scheduleDetails");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "scheduledDay");

    if ((unint64_t)(v11 - 1) <= 0x1E)
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) = v11;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = objc_msgSend(v6, "willSkipFirstPaymentForAccount:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 8);
    v14 = *(_QWORD *)(v12 + 24);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __102__PKAccountAutomaticPaymentsController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_3;
    v17[3] = &unk_1E3E6CFD8;
    v17[4] = v12;
    v18 = v6;
    v15 = v6;
    objc_msgSend(v13, "updateScheduledPaymentsWithAccount:completion:", v14, v17);

  }
  v16 = *(_QWORD *)(a1 + 56);
  if (v16)
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v3);

}

void __102__PKAccountAutomaticPaymentsController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  char v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 240));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __102__PKAccountAutomaticPaymentsController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_4;
    v5[3] = &unk_1E3E61388;
    v4 = *(void **)(a1 + 40);
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

void __102__PKAccountAutomaticPaymentsController__performApplePayTrustSignatureRequestWithSignature_completion___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 240));
  objc_msgSend(WeakRetained, "accountAutomaticPaymentsController:didSchedulePayment:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3
{
  PKPaymentAuthorizationCoordinator *v4;
  NSObject *v5;
  PKPaymentAuthorizationCoordinator *paymentAuthorizationCoordinator;
  _QWORD v7[4];
  PKPaymentAuthorizationCoordinator *v8;
  PKAccountAutomaticPaymentsController *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  PKAccountAutomaticPaymentsController *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (PKPaymentAuthorizationCoordinator *)a3;
  if (self->_paymentAuthorizationCoordinator == v4)
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[PKAccountAutomaticPaymentsController paymentAuthorizationCoordinatorDidFinish:]";
      v12 = 2048;
      v13 = self;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "%s %p: paymentAuthorizationCoordinatorDidFinish: callback called.", buf, 0x16u);
    }

    paymentAuthorizationCoordinator = self->_paymentAuthorizationCoordinator;
    self->_paymentAuthorizationCoordinator = 0;

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __81__PKAccountAutomaticPaymentsController_paymentAuthorizationCoordinatorDidFinish___block_invoke;
    v7[3] = &unk_1E3E61388;
    v8 = v4;
    v9 = self;
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
}

uint64_t __81__PKAccountAutomaticPaymentsController_paymentAuthorizationCoordinatorDidFinish___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __81__PKAccountAutomaticPaymentsController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2;
  v3[3] = &unk_1E3E612E8;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "dismissWithCompletion:", v3);
}

void __81__PKAccountAutomaticPaymentsController_paymentAuthorizationCoordinatorDidFinish___block_invoke_2(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__PKAccountAutomaticPaymentsController_paymentAuthorizationCoordinatorDidFinish___block_invoke_3;
  block[3] = &unk_1E3E612E8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __81__PKAccountAutomaticPaymentsController_paymentAuthorizationCoordinatorDidFinish___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 176))
    v3 = *(_QWORD *)(v2 + 80) == 0;
  else
    v3 = 0;
  v4 = v3;
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(v2 + 160) + 16))(*(_QWORD *)(v2 + 160), v4);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 80);
  *(_QWORD *)(v7 + 80) = 0;

}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizeApplePayTrustSignature:(id)a4 handler:(id)a5
{
  -[PKAccountAutomaticPaymentsController _performApplePayTrustSignatureRequestWithSignature:completion:](self, "_performApplePayTrustSignatureRequestWithSignature:completion:", a4, a5);
}

- (void)paymentAuthorizationCoordinator:(id)a3 didUpdateAccountServicePaymentMethod:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  PKPaymentWebService *paymentWebService;
  _QWORD v15[4];
  id v16;
  _QWORD aBlock[4];
  id v18;
  PKAccountAutomaticPaymentsController *v19;
  id v20;

  v7 = a4;
  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __117__PKAccountAutomaticPaymentsController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke;
  aBlock[3] = &unk_1E3E76658;
  v10 = v7;
  v18 = v10;
  v19 = self;
  v11 = v8;
  v20 = v11;
  v12 = _Block_copy(aBlock);
  -[PKPaymentWebService targetDevice](self->_paymentWebService, "targetDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    paymentWebService = self->_paymentWebService;
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __117__PKAccountAutomaticPaymentsController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke_3;
    v15[3] = &unk_1E3E6DD10;
    v16 = v12;
    objc_msgSend(v13, "paymentWebService:deviceMetadataWithFields:completion:", paymentWebService, 123, v15);

  }
  else
  {
    (*((void (**)(void *, _QWORD))v12 + 2))(v12, 0);
  }

}

void __117__PKAccountAutomaticPaymentsController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "bankAccountInformation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_addNewBankAccountIfNecessary:", v5);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = 0;

  v8 = (id)objc_msgSend(*(id *)(a1 + 40), "_schedulePaymentRequestWithBankAccount:", v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "setDeviceMetadata:", v4);

  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(a1 + 48);
  v11 = *(void **)(v9 + 16);
  v12 = *(_QWORD *)(v9 + 56);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __117__PKAccountAutomaticPaymentsController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke_2;
  v13[3] = &unk_1E3E76630;
  v13[4] = v9;
  v14 = v10;
  objc_msgSend(v11, "schedulePaymentWithRequest:completion:", v12, v13);

}

void __117__PKAccountAutomaticPaymentsController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = 0;
  if (a2 && !a3)
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    v5 = a2;
    objc_msgSend(v5, "referenceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "manifestHashWithReferenceIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_alloc(MEMORY[0x1E0D66A88]);
    v9 = *MEMORY[0x1E0D699F0];
    objc_msgSend(v5, "nonce");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (id)objc_msgSend(v8, "initWithKeyIdentifier:manifestHash:nonce:", v9, v7, v10);
  }
  v11 = objc_alloc(MEMORY[0x1E0D67278]);
  objc_msgSend(*(id *)(a1 + 32), "_paymentSummaryItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithPaymentSummaryItems:", v12);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __117__PKAccountAutomaticPaymentsController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __117__PKAccountAutomaticPaymentsController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke_4;
  v6[3] = &unk_1E3E618A0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __117__PKAccountAutomaticPaymentsController_paymentAuthorizationCoordinator_didUpdateAccountServicePaymentMethod_handler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "presentationSceneIdentifierForAccountAutomaticPaymentsController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (int64_t)paymentSetupContext
{
  return self->_paymentSetupContext;
}

- (PKAccount)account
{
  return self->_account;
}

- (BOOL)willSkipFirstPayment
{
  return self->_willSkipFirstPayment;
}

- (BOOL)needsPreflight
{
  return self->_needsPreflight;
}

- (void)setNeedsPreflight:(BOOL)a3
{
  self->_needsPreflight = a3;
}

- (NSDate)paymentDate
{
  return self->_paymentDate;
}

- (void)setPaymentDate:(id)a3
{
  objc_storeStrong((id *)&self->_paymentDate, a3);
}

- (int64_t)paymentFrequency
{
  return self->_paymentFrequency;
}

- (void)setPaymentFrequency:(int64_t)a3
{
  self->_paymentFrequency = a3;
}

- (int64_t)scheduledDay
{
  return self->_scheduledDay;
}

- (void)setScheduledDay:(int64_t)a3
{
  self->_scheduledDay = a3;
}

- (int64_t)paymentPreset
{
  return self->_paymentPreset;
}

- (void)setPaymentPreset:(int64_t)a3
{
  self->_paymentPreset = a3;
}

- (PKCurrencyAmount)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
  objc_storeStrong((id *)&self->_amount, a3);
}

- (NSArray)fundingSources
{
  return self->_fundingSources;
}

- (void)setFundingSources:(id)a3
{
  objc_storeStrong((id *)&self->_fundingSources, a3);
}

- (NSArray)automaticPayments
{
  return self->_automaticPayments;
}

- (void)setAutomaticPayments:(id)a3
{
  objc_storeStrong((id *)&self->_automaticPayments, a3);
}

- (PKAccountAutomaticPaymentsControllerDelegate)delegate
{
  return (PKAccountAutomaticPaymentsControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_automaticPayments, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_paymentAuthorizationCoordinator, 0);
  objc_storeStrong(&self->_performScheduleAutomaticPaymentsCompletion, 0);
  objc_storeStrong((id *)&self->_minimumPaymentDisclosureViewController, 0);
  objc_storeStrong((id *)&self->_setupCompleteViewController, 0);
  objc_storeStrong((id *)&self->_configurationViewController, 0);
  objc_storeStrong((id *)&self->_dateViewController, 0);
  objc_storeStrong((id *)&self->_presetViewController, 0);
  objc_storeStrong((id *)&self->_heroViewController, 0);
  objc_storeStrong((id *)&self->_viewPaymentController, 0);
  objc_storeStrong((id *)&self->_paymentDate, 0);
  objc_storeStrong((id *)&self->_monthDayFormatter, 0);
  objc_storeStrong((id *)&self->_performScheduleAutomaticPaymentsError, 0);
  objc_storeStrong((id *)&self->_applePayTrustSignatureRequest, 0);
  objc_storeStrong((id *)&self->_fundingSources, 0);
  objc_storeStrong((id *)&self->_schedulePaymentRequest, 0);
  objc_storeStrong((id *)&self->_productTimeZone, 0);
  objc_storeStrong((id *)&self->_productCalendar, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_paymentWebService, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
}

@end
