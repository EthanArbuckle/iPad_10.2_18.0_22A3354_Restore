@implementation PKPayLaterFinancingPlan

- (PKPayLaterFinancingPlan)initWithDictionary:(id)a3
{
  id v4;
  PKPayLaterFinancingPlan *v5;
  uint64_t v6;
  NSString *planIdentifier;
  void *v8;
  uint64_t v9;
  NSDate *lastUpdated;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  char v14;
  uint64_t v15;
  __CFString *v16;
  __CFString *v17;
  char v18;
  __CFString *v19;
  __CFString *v20;
  int v21;
  __CFString *v22;
  __CFString *v23;
  char v24;
  uint64_t v25;
  __CFString *v26;
  __CFString *v27;
  char v28;
  __CFString *v29;
  __CFString *v30;
  char v31;
  __CFString *v32;
  __CFString *v33;
  char v34;
  __CFString *v35;
  __CFString *v36;
  char v37;
  __CFString *v38;
  __CFString *v39;
  char v40;
  __CFString *v41;
  __CFString *v42;
  char v43;
  __CFString *v44;
  __CFString *v45;
  int v46;
  void *v47;
  PKPayLaterFinancingPlanSummary *v48;
  PKPayLaterFinancingPlanSummary *planSummary;
  void *v50;
  PKPayLaterFinancingPlanScheduleSummary *v51;
  PKPayLaterFinancingPlanScheduleSummary *scheduleSummary;
  void *v53;
  PKPayLaterMerchant *v54;
  PKPayLaterMerchant *merchant;
  void *v56;
  id v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t i;
  PKPayLaterFinancingPlanDispute *v63;
  uint64_t v64;
  NSArray *disputes;
  void *v66;
  PKPayLaterFinancingPlanFundingSource *v67;
  PKPayLaterFinancingPlanFundingSource *fundingSource;
  void *v69;
  PKPayLaterFinancingPlanTermsDetails *v70;
  PKPayLaterFinancingPlanTermsDetails *termsDetails;
  void *v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  objc_super v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v79.receiver = self;
  v79.super_class = (Class)PKPayLaterFinancingPlan;
  v5 = -[PKPayLaterFinancingPlan init](&v79, sel_init);
  if (!v5)
    goto LABEL_57;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("planIdentifier"));
  v6 = objc_claimAutoreleasedReturnValue();
  planIdentifier = v5->_planIdentifier;
  v5->_planIdentifier = (NSString *)v6;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("productType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_productType = PKPayLaterAccountProductTypeFromString(v8);

  objc_msgSend(v4, "PKDateForKey:", CFSTR("lastUpdated"));
  v9 = objc_claimAutoreleasedReturnValue();
  lastUpdated = v5->_lastUpdated;
  v5->_lastUpdated = (NSDate *)v9;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("state"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_state = PKPayLaterFinancingPlanStateFromString(v11);

  objc_msgSend(v4, "PKStringForKey:", CFSTR("planChannel"));
  v12 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12 == CFSTR("inApp"))
    goto LABEL_5;
  if (!v12)
    goto LABEL_12;
  v14 = -[__CFString isEqualToString:](v12, "isEqualToString:", CFSTR("inApp"));

  if ((v14 & 1) != 0)
  {
LABEL_5:
    v15 = 1;
    goto LABEL_13;
  }
  v16 = v13;
  if (v16 == CFSTR("web")
    || (v17 = v16,
        v18 = -[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("web")),
        v17,
        (v18 & 1) != 0))
  {
    v15 = 2;
    goto LABEL_13;
  }
  v19 = v17;
  if (v19 == CFSTR("inStore")
    || (v20 = v19,
        v21 = -[__CFString isEqualToString:](v19, "isEqualToString:", CFSTR("inStore")),
        v20,
        v21))
  {
    v15 = 3;
  }
  else
  {
LABEL_12:
    v15 = 0;
  }
LABEL_13:

  v5->_planChannel = v15;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("stateReason"));
  v22 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22 != CFSTR("currentUnsettled"))
  {
    if (v22)
    {
      v24 = -[__CFString isEqualToString:](v22, "isEqualToString:", CFSTR("currentUnsettled"));

      if ((v24 & 1) != 0)
        goto LABEL_16;
      v26 = v23;
      if (v26 == CFSTR("currentSettled")
        || (v27 = v26,
            v28 = -[__CFString isEqualToString:](v26, "isEqualToString:", CFSTR("currentSettled")),
            v27,
            (v28 & 1) != 0))
      {
        v25 = 2;
        goto LABEL_39;
      }
      v29 = v27;
      if (v29 == CFSTR("paidOffZero")
        || (v30 = v29,
            v31 = -[__CFString isEqualToString:](v29, "isEqualToString:", CFSTR("paidOffZero")),
            v30,
            (v31 & 1) != 0))
      {
        v25 = 3;
        goto LABEL_39;
      }
      v32 = v30;
      if (v32 == CFSTR("paidOffCredit")
        || (v33 = v32,
            v34 = -[__CFString isEqualToString:](v32, "isEqualToString:", CFSTR("paidOffCredit")),
            v33,
            (v34 & 1) != 0))
      {
        v25 = 4;
        goto LABEL_39;
      }
      v35 = v33;
      if (v35 == CFSTR("chargedOff")
        || (v36 = v35,
            v37 = -[__CFString isEqualToString:](v35, "isEqualToString:", CFSTR("chargedOff")),
            v36,
            (v37 & 1) != 0))
      {
        v25 = 5;
        goto LABEL_39;
      }
      v38 = v36;
      if (v38 == CFSTR("unresolvedDispute")
        || (v39 = v38,
            v40 = -[__CFString isEqualToString:](v38, "isEqualToString:", CFSTR("unresolvedDispute")),
            v39,
            (v40 & 1) != 0))
      {
        v25 = 6;
        goto LABEL_39;
      }
      v41 = v39;
      if (v41 == CFSTR("fraudSuspected")
        || (v42 = v41,
            v43 = -[__CFString isEqualToString:](v41, "isEqualToString:", CFSTR("fraudSuspected")),
            v42,
            (v43 & 1) != 0))
      {
        v25 = 7;
        goto LABEL_39;
      }
      v44 = v42;
      if (v44 == CFSTR("fraudConfirmed")
        || (v45 = v44,
            v46 = -[__CFString isEqualToString:](v44, "isEqualToString:", CFSTR("fraudConfirmed")),
            v45,
            v46))
      {
        v25 = 8;
        goto LABEL_39;
      }
    }
    v25 = 0;
    goto LABEL_39;
  }
LABEL_16:
  v25 = 1;
LABEL_39:

  v5->_stateReason = v25;
  v5->_requiresGenericMessaging = objc_msgSend(v4, "PKBoolForKey:", CFSTR("requiresGenericMessaging"));
  v5->_cancellable = objc_msgSend(v4, "PKBoolForKey:", CFSTR("cancellable"));
  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("planSummary"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = -[PKPayLaterFinancingPlanSummary initWithDictionary:]([PKPayLaterFinancingPlanSummary alloc], "initWithDictionary:", v47);
    planSummary = v5->_planSummary;
    v5->_planSummary = v48;

  }
  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("scheduleSummary"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50)
  {
    v51 = -[PKPayLaterFinancingPlanScheduleSummary initWithDictionary:]([PKPayLaterFinancingPlanScheduleSummary alloc], "initWithDictionary:", v50);
    scheduleSummary = v5->_scheduleSummary;
    v5->_scheduleSummary = v51;

  }
  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("merchantSummary"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = -[PKPayLaterMerchant initWithDictionary:]([PKPayLaterMerchant alloc], "initWithDictionary:", v53);
  merchant = v5->_merchant;
  v5->_merchant = v54;

  objc_msgSend(v4, "PKArrayForKey:", CFSTR("disputes"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v56, "count"))
  {
    v73 = v50;
    v74 = v47;
    v57 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v58 = v56;
    v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v75, v80, 16);
    if (v59)
    {
      v60 = v59;
      v61 = *(_QWORD *)v76;
      do
      {
        for (i = 0; i != v60; ++i)
        {
          if (*(_QWORD *)v76 != v61)
            objc_enumerationMutation(v58);
          v63 = -[PKPayLaterFinancingPlanDispute initWithDictionary:]([PKPayLaterFinancingPlanDispute alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * i));
          objc_msgSend(v57, "safelyAddObject:", v63);

        }
        v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v75, v80, 16);
      }
      while (v60);
    }

    v64 = objc_msgSend(v57, "copy");
    disputes = v5->_disputes;
    v5->_disputes = (NSArray *)v64;

    v50 = v73;
    v47 = v74;
  }
  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("fundingSource"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v66, "count"))
  {
    v67 = -[PKPayLaterFinancingPlanFundingSource initWithDictionary:]([PKPayLaterFinancingPlanFundingSource alloc], "initWithDictionary:", v66);
    fundingSource = v5->_fundingSource;
    v5->_fundingSource = v67;

  }
  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("termsDetails"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v69, "count"))
  {
    v70 = -[PKPayLaterFinancingPlanTermsDetails initWithDictionary:]([PKPayLaterFinancingPlanTermsDetails alloc], "initWithDictionary:", v69);
    termsDetails = v5->_termsDetails;
    v5->_termsDetails = v70;

  }
LABEL_57:

  return v5;
}

+ (id)aprStringForNumber:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB37F0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setNumberStyle:", 3);
  objc_msgSend(v5, "setMinimumFractionDigits:", 0);
  objc_msgSend(v5, "setMaximumFractionDigits:", 2);
  objc_msgSend(v5, "stringFromNumber:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)displayableLoanIdentifier
{
  NSString *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = self->_planIdentifier;
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v2);

    if (v3)
    {
      -[NSString componentsSeparatedByString:](v2, "componentsSeparatedByString:", CFSTR("-"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lastObject");
      v5 = objc_claimAutoreleasedReturnValue();

      v2 = (NSString *)v5;
    }
  }
  return v2;
}

+ (BOOL)requiresGenericMessagingForAccount:(id)a3 financingPlans:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;

  v5 = a4;
  objc_msgSend(a3, "payLaterDetails");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "requiresGenericMessaging");

  objc_msgSend(v5, "pk_firstObjectPassingTest:", &__block_literal_global_55);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    return 1;
  else
    return v7;
}

uint64_t __77__PKPayLaterFinancingPlan_requiresGenericMessagingForAccount_financingPlans___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "requiresGenericMessaging");
}

+ (BOOL)canMakePaymentsWithAccountState:(unint64_t)a3
{
  return (a3 < 6) & (6u >> a3);
}

- (BOOL)installmentWasPaidEarly:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v4 = a3;
  if (objc_msgSend(v4, "status") == 3)
  {
    objc_msgSend(v4, "payments");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "type");
    if (v7 <= 7)
    {
      if (((1 << v7) & 0xF3) == 0)
      {
        v10 = 1;
LABEL_16:

        goto LABEL_17;
      }
      -[PKPayLaterFinancingPlanScheduleSummary installments](self->_scheduleSummary, "installments");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __51__PKPayLaterFinancingPlan_installmentWasPaidEarly___block_invoke;
      v18[3] = &unk_1E2AC8678;
      v19 = v4;
      v9 = objc_msgSend(v8, "indexOfObjectPassingTest:", v18);
      if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      {

      }
      else
      {
        v11 = v9;
        objc_msgSend(v6, "postedDate");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        v10 = 0;
        v14 = 1;
        if (v11 >= 1 && v12)
        {
          objc_msgSend(v8, "objectAtIndexedSubscript:", v11 - 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "dueDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v14 = 0;
            v10 = objc_msgSend(v13, "compare:", v16) == -1;
          }
          else
          {
            v10 = 0;
          }

        }
        if (!v14)
          goto LABEL_16;
      }
    }
    v10 = 0;
    goto LABEL_16;
  }
  v10 = 0;
LABEL_17:

  return v10;
}

uint64_t __51__PKPayLaterFinancingPlan_installmentWasPaidEarly___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "installmentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "installmentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

- (id)nextDueInstallmentAfterInstallmentIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  unint64_t i;
  void *v9;
  unint64_t v10;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[PKPayLaterFinancingPlanScheduleSummary installments](self->_scheduleSummary, "installments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__PKPayLaterFinancingPlan_nextDueInstallmentAfterInstallmentIdentifier___block_invoke;
  v13[3] = &unk_1E2AC8678;
  v6 = v4;
  v14 = v6;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v13);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (i = v7; i < objc_msgSend(v5, "count"); ++i)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "status");
      if (v10 > 4 || ((1 << v10) & 0x16) == 0)
      {

      }
      else if (v9)
      {
        goto LABEL_12;
      }
    }
  }
  v9 = 0;
LABEL_12:

  return v9;
}

uint64_t __72__PKPayLaterFinancingPlan_nextDueInstallmentAfterInstallmentIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "installmentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

+ (id)activeFinancingPlanStates
{
  if (qword_1ECF223B0 != -1)
    dispatch_once(&qword_1ECF223B0, &__block_literal_global_78);
  return (id)_MergedGlobals_213;
}

void __52__PKPayLaterFinancingPlan_activeFinancingPlanStates__block_invoke()
{
  void *v0;

  v0 = (void *)_MergedGlobals_213;
  _MergedGlobals_213 = (uint64_t)&unk_1E2C3DE88;

}

+ (id)completedFinancingPlanStates
{
  if (qword_1ECF223C0 != -1)
    dispatch_once(&qword_1ECF223C0, &__block_literal_global_84);
  return (id)qword_1ECF223B8;
}

void __55__PKPayLaterFinancingPlan_completedFinancingPlanStates__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECF223B8;
  qword_1ECF223B8 = (uint64_t)&unk_1E2C3DEA0;

}

+ (id)pendingFinancingPlanStates
{
  if (qword_1ECF223D0 != -1)
    dispatch_once(&qword_1ECF223D0, &__block_literal_global_89);
  return (id)qword_1ECF223C8;
}

void __53__PKPayLaterFinancingPlan_pendingFinancingPlanStates__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECF223C8;
  qword_1ECF223C8 = (uint64_t)&unk_1E2C3DEB8;

}

- (id)paymentSource
{
  PKPayLaterPaymentSource *paymentSource;

  paymentSource = self->_paymentSource;
  if (!paymentSource)
  {
    -[PKPayLaterFinancingPlan _loadPaymentSource](self, "_loadPaymentSource");
    paymentSource = self->_paymentSource;
  }
  return paymentSource;
}

- (id)fundingSourceName
{
  NSString *fundingSourceName;

  fundingSourceName = self->_fundingSourceName;
  if (!fundingSourceName)
  {
    -[PKPayLaterFinancingPlan _loadPaymentSource](self, "_loadPaymentSource");
    fundingSourceName = self->_fundingSourceName;
  }
  return fundingSourceName;
}

- (void)_loadPaymentSource
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  PKAccountPaymentFundingSource *v7;
  void *v8;
  void *v9;
  PKAccountPaymentFundingDetailsBankAccount *v10;
  void *v11;
  NSString *v12;
  NSString *v13;
  PKPayLaterBankPaymentSource *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSString *v21;
  NSString *fundingSourceName;
  NSString *v23;
  NSString *v24;
  NSString *v25;
  uint64_t v26;
  void *v27;
  PKPayLaterPassPaymentSource *v28;
  NSString *v29;
  NSString *v30;
  PKPayLaterPaymentSource *paymentSource;
  id v32;

  +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterFinancingPlan fundingSource](self, "fundingSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "details");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");
  if (v5 == 1)
  {
    v7 = v4;
    -[PKAccountPaymentFundingSource dpanIdentifier](v7, "dpanIdentifier");
    v10 = (PKAccountPaymentFundingDetailsBankAccount *)objc_claimAutoreleasedReturnValue();
    -[PKAccountPaymentFundingSource fpanIdentifier](v7, "fpanIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "passWithDPANIdentifier:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "paymentPass");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      objc_msgSend(v32, "passWithFPANIdentifier:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "paymentPass");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v17, "organizationName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      v21 = v19;
      fundingSourceName = self->_fundingSourceName;
      self->_fundingSourceName = v21;
    }
    else
    {
      -[PKAccountPaymentFundingSource cardName](v7, "cardName");
      v23 = (NSString *)objc_claimAutoreleasedReturnValue();
      fundingSourceName = v23;
      if (v23)
      {
        v24 = v23;
      }
      else
      {
        -[PKAccountPaymentFundingSource cardName](v7, "cardName");
        v24 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      v25 = self->_fundingSourceName;
      self->_fundingSourceName = v24;

    }
    objc_msgSend(v17, "devicePrimaryPaymentApplication");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    if (v17 && v26)
    {
      v28 = -[PKPayLaterPassPaymentSource initWithPaymentPass:paymentApplication:]([PKPayLaterPassPaymentSource alloc], "initWithPaymentPass:paymentApplication:", v17, v26);
    }
    else
    {
      objc_msgSend(v3, "displayName");
      v29 = (NSString *)objc_claimAutoreleasedReturnValue();
      v30 = self->_fundingSourceName;
      self->_fundingSourceName = v29;

      v28 = -[PKPayLaterUnavailablePassPaymentSource initWithFundingSource:]([PKPayLaterUnavailablePassPaymentSource alloc], "initWithFundingSource:", v3);
    }
    paymentSource = self->_paymentSource;
    self->_paymentSource = &v28->super;

    goto LABEL_17;
  }
  if (v5 == 2)
  {
    v6 = v4;
    v7 = -[PKAccountPaymentFundingSource initWithType:]([PKAccountPaymentFundingSource alloc], "initWithType:", 1);
    objc_msgSend(v3, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountPaymentFundingSource setIdentifier:](v7, "setIdentifier:", v8);

    objc_msgSend(v6, "accountNumberSuffix");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountPaymentFundingSource setAccountSuffix:](v7, "setAccountSuffix:", v9);

    v10 = objc_alloc_init(PKAccountPaymentFundingDetailsBankAccount);
    objc_msgSend(v6, "bankName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountPaymentFundingDetailsBankAccount setName:](v10, "setName:", v11);

    -[PKAccountPaymentFundingSource setFundingDetails:](v7, "setFundingDetails:", v10);
    objc_msgSend(v6, "bankName");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();

    v13 = self->_fundingSourceName;
    self->_fundingSourceName = v12;

    v14 = -[PKPayLaterBankPaymentSource initWithAccountPaymentFundingSource:]([PKPayLaterBankPaymentSource alloc], "initWithAccountPaymentFundingSource:", v7);
    v15 = self->_paymentSource;
    self->_paymentSource = &v14->super;
LABEL_17:

  }
}

- (BOOL)updateReasonIsInitialDownload
{
  return self->_updateReasons & 1;
}

- (void)addUpdateReasons:(unint64_t)a3
{
  self->_updateReasons |= a3;
}

- (id)refundPaymentsNotAssociatedWithDispute
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  PKPayLaterFinancingPlan *v20;
  _QWORD v21[4];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v20 = self;
  v4 = self->_disputes;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v8);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(v9, "appliedPayments", v20);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v24;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v24 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v14), "paymentIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "pk_safelyAddObject:", v15);

              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v6);
  }

  -[PKPayLaterFinancingPlanScheduleSummary payments](v20->_scheduleSummary, "payments");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __65__PKPayLaterFinancingPlan_refundPaymentsNotAssociatedWithDispute__block_invoke;
  v21[3] = &unk_1E2AC86C0;
  v22 = v3;
  v17 = v3;
  objc_msgSend(v16, "pk_objectsPassingTest:", v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

uint64_t __65__PKPayLaterFinancingPlan_refundPaymentsNotAssociatedWithDispute__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if (objc_msgSend(v3, "type") == 3)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      v4 = *(void **)(a1 + 32);
      objc_msgSend(v3, "paymentIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v4, "containsObject:", v5) ^ 1;

    }
    else
    {
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)disputeWithIdentifier:(id)a3
{
  id v4;
  NSArray *disputes;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  disputes = self->_disputes;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__PKPayLaterFinancingPlan_disputeWithIdentifier___block_invoke;
  v9[3] = &unk_1E2AC86E8;
  v10 = v4;
  v6 = v4;
  -[NSArray pk_firstObjectPassingTest:](disputes, "pk_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __49__PKPayLaterFinancingPlan_disputeWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  BOOL v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  v5 = v3;
  v6 = v5;
  if (v4 == v5)
  {
    v8 = 1;
  }
  else
  {
    if (v4)
      v7 = v5 == 0;
    else
      v7 = 1;
    if (v7)
      v8 = 0;
    else
      v8 = objc_msgSend(v4, "isEqualToString:", v5);
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterFinancingPlan *v4;
  PKPayLaterFinancingPlan *v5;
  BOOL v6;

  v4 = (PKPayLaterFinancingPlan *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPayLaterFinancingPlan isEqualToPayLaterFinancingPlan:](self, "isEqualToPayLaterFinancingPlan:", v5);

  return v6;
}

- (BOOL)isEqualToPayLaterFinancingPlan:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  NSDate *lastUpdated;
  NSDate *v12;
  PKPayLaterFinancingPlanSummary *planSummary;
  PKPayLaterFinancingPlanSummary *v14;
  PKPayLaterMerchant *merchant;
  PKPayLaterMerchant *v16;
  PKPayLaterFinancingPlanScheduleSummary *scheduleSummary;
  PKPayLaterFinancingPlanScheduleSummary *v18;
  NSArray *disputes;
  NSArray *v20;
  PKPayLaterFinancingPlanFundingSource *fundingSource;
  PKPayLaterFinancingPlanFundingSource *v22;
  PKPayLaterFinancingPlanTermsDetails *termsDetails;
  PKPayLaterFinancingPlanTermsDetails *v24;
  NSString *accountIdentifier;
  void *v26;
  NSString *v27;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_50;
  v6 = (void *)v4[4];
  v7 = self->_planIdentifier;
  v8 = v6;
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    LOBYTE(v10) = 0;
    if (!v7 || !v8)
    {
LABEL_52:

      goto LABEL_53;
    }
    v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_53;
  }
  if (self->_productType == v5[5])
  {
    lastUpdated = self->_lastUpdated;
    v12 = (NSDate *)v5[6];
    if (lastUpdated && v12)
    {
      if ((-[NSDate isEqual:](lastUpdated, "isEqual:") & 1) == 0)
        goto LABEL_50;
    }
    else if (lastUpdated != v12)
    {
      goto LABEL_50;
    }
    if (self->_state != v5[7] || self->_planChannel != v5[9] || self->_stateReason != v5[8])
      goto LABEL_50;
    planSummary = self->_planSummary;
    v14 = (PKPayLaterFinancingPlanSummary *)v5[10];
    if (planSummary && v14)
    {
      if (!-[PKPayLaterFinancingPlanSummary isEqual:](planSummary, "isEqual:"))
        goto LABEL_50;
    }
    else if (planSummary != v14)
    {
      goto LABEL_50;
    }
    merchant = self->_merchant;
    v16 = (PKPayLaterMerchant *)v5[13];
    if (merchant && v16)
    {
      if (!-[PKPayLaterMerchant isEqual:](merchant, "isEqual:"))
        goto LABEL_50;
    }
    else if (merchant != v16)
    {
      goto LABEL_50;
    }
    scheduleSummary = self->_scheduleSummary;
    v18 = (PKPayLaterFinancingPlanScheduleSummary *)v5[11];
    if (scheduleSummary && v18)
    {
      if (!-[PKPayLaterFinancingPlanScheduleSummary isEqual:](scheduleSummary, "isEqual:"))
        goto LABEL_50;
    }
    else if (scheduleSummary != v18)
    {
      goto LABEL_50;
    }
    disputes = self->_disputes;
    v20 = (NSArray *)v5[12];
    if (disputes && v20)
    {
      if ((-[NSArray isEqual:](disputes, "isEqual:") & 1) == 0)
        goto LABEL_50;
    }
    else if (disputes != v20)
    {
      goto LABEL_50;
    }
    fundingSource = self->_fundingSource;
    v22 = (PKPayLaterFinancingPlanFundingSource *)v5[14];
    if (fundingSource && v22)
    {
      if (!-[PKPayLaterFinancingPlanFundingSource isEqual:](fundingSource, "isEqual:"))
        goto LABEL_50;
    }
    else if (fundingSource != v22)
    {
      goto LABEL_50;
    }
    termsDetails = self->_termsDetails;
    v24 = (PKPayLaterFinancingPlanTermsDetails *)v5[15];
    if (termsDetails && v24)
    {
      if (-[PKPayLaterFinancingPlanTermsDetails isEqual:](termsDetails, "isEqual:"))
        goto LABEL_45;
    }
    else if (termsDetails == v24)
    {
LABEL_45:
      accountIdentifier = self->_accountIdentifier;
      v26 = (void *)v5[16];
      v7 = accountIdentifier;
      v27 = v26;
      if (v7 == v27)
      {
        LOBYTE(v10) = 1;
        v9 = v7;
      }
      else
      {
        v9 = v27;
        LOBYTE(v10) = 0;
        if (v7 && v27)
          LOBYTE(v10) = -[NSString isEqualToString:](v7, "isEqualToString:", v27);
      }
      goto LABEL_52;
    }
  }
LABEL_50:
  LOBYTE(v10) = 0;
LABEL_53:

  return v10;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_planIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_lastUpdated);
  objc_msgSend(v3, "safelyAddObject:", self->_planSummary);
  objc_msgSend(v3, "safelyAddObject:", self->_merchant);
  objc_msgSend(v3, "safelyAddObject:", self->_scheduleSummary);
  objc_msgSend(v3, "safelyAddObject:", self->_disputes);
  objc_msgSend(v3, "safelyAddObject:", self->_accountIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_fundingSource);
  objc_msgSend(v3, "safelyAddObject:", self->_termsDetails);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_productType - v4 + 32 * v4;
  v6 = self->_state - v5 + 32 * v5;
  v7 = self->_planChannel - v6 + 32 * v6;
  v8 = self->_stateReason - v7 + 32 * v7;

  return v8;
}

- (id)description
{
  id v3;
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  unint64_t v7;
  const __CFString *v8;
  unint64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("purchaseIdentifier: '%@'; "), self->_planIdentifier);
  PKPayLaterAccountProductTypeToString(self->_productType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("productType: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("lastUpdated: '%@'; "), self->_lastUpdated);
  v5 = self->_state - 1;
  if (v5 > 7)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E2AC8748[v5];
  objc_msgSend(v3, "appendFormat:", CFSTR("state: '%@'; "), v6);
  v7 = self->_planChannel - 1;
  if (v7 > 2)
    v8 = CFSTR("unknown");
  else
    v8 = off_1E2AC8788[v7];
  objc_msgSend(v3, "appendFormat:", CFSTR("planChannel: '%@'; "), v8);
  v9 = self->_stateReason - 1;
  if (v9 > 7)
    v10 = CFSTR("unknown");
  else
    v10 = off_1E2AC87A0[v9];
  objc_msgSend(v3, "appendFormat:", CFSTR("stateReason: '%@'; "), v10);
  if (self->_requiresGenericMessaging)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("requiresGenericMessaging: '%@'; "), v11);
  if (self->_cancellable)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("cancellable: '%@'; "), v12);
  objc_msgSend(v3, "appendFormat:", CFSTR("purchaseSummary: '%@'; "), self->_planSummary);
  objc_msgSend(v3, "appendFormat:", CFSTR("merchant: '%@'; "), self->_merchant);
  objc_msgSend(v3, "appendFormat:", CFSTR("scheduleSummary: '%@'; "), self->_scheduleSummary);
  objc_msgSend(v3, "appendFormat:", CFSTR("disputes: '%@'; "), self->_disputes);
  objc_msgSend(v3, "appendFormat:", CFSTR("fundingSources: '%@'; "), self->_fundingSource);
  objc_msgSend(v3, "appendFormat:", CFSTR("termsDetails: '%@'; "), self->_termsDetails);
  objc_msgSend(v3, "appendFormat:", CFSTR("accountIdentifier: '%@'; "), self->_accountIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  NSDate *lastUpdated;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  unint64_t v9;
  const __CFString *v10;
  unint64_t v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_planIdentifier, CFSTR("planIdentifier"));
  PKPayLaterAccountProductTypeToString(self->_productType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("productType"));

  lastUpdated = self->_lastUpdated;
  if (lastUpdated)
  {
    PKISO8601DateStringFromDate(lastUpdated);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("lastUpdated"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("lastUpdated"));
  }
  v7 = self->_state - 1;
  if (v7 > 7)
    v8 = CFSTR("unknown");
  else
    v8 = off_1E2AC8748[v7];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("state"));
  v9 = self->_planChannel - 1;
  if (v9 > 2)
    v10 = CFSTR("unknown");
  else
    v10 = off_1E2AC8788[v9];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("planChannel"));
  v11 = self->_stateReason - 1;
  if (v11 > 7)
    v12 = CFSTR("unknown");
  else
    v12 = off_1E2AC87A0[v11];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("stateReason"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_requiresGenericMessaging);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("requiresGenericMessaging"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_cancellable);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("cancellable"));

  -[PKPayLaterFinancingPlanSummary dictionaryRepresentation](self->_planSummary, "dictionaryRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("planSummary"));

  -[PKPayLaterFinancingPlanScheduleSummary dictionaryRepresentation](self->_scheduleSummary, "dictionaryRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("scheduleSummary"));

  -[PKPayLaterMerchant dictionaryRepresentation](self->_merchant, "dictionaryRepresentation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("merchantSummary"));

  -[NSArray pk_arrayBySafelyApplyingBlock:](self->_disputes, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_143);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("disputes"));

  -[PKPayLaterFinancingPlanFundingSource dictionaryRepresentation](self->_fundingSource, "dictionaryRepresentation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("fundingSource"));

  -[PKPayLaterFinancingPlanTermsDetails dictionaryRepresentation](self->_termsDetails, "dictionaryRepresentation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("termsDetails"));

  v21 = (void *)objc_msgSend(v3, "copy");
  return v21;
}

uint64_t __51__PKPayLaterFinancingPlan_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterFinancingPlan)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterFinancingPlan *v5;
  uint64_t v6;
  NSString *planIdentifier;
  uint64_t v8;
  NSDate *lastUpdated;
  uint64_t v10;
  PKPayLaterFinancingPlanSummary *planSummary;
  uint64_t v12;
  PKPayLaterMerchant *merchant;
  uint64_t v14;
  PKPayLaterFinancingPlanFundingSource *fundingSource;
  uint64_t v16;
  PKPayLaterFinancingPlanTermsDetails *termsDetails;
  uint64_t v18;
  PKPayLaterFinancingPlanScheduleSummary *scheduleSummary;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSArray *disputes;
  uint64_t v25;
  NSString *accountIdentifier;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PKPayLaterFinancingPlan;
  v5 = -[PKPayLaterFinancingPlan init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("planIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    planIdentifier = v5->_planIdentifier;
    v5->_planIdentifier = (NSString *)v6;

    v5->_productType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("productType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdated"));
    v8 = objc_claimAutoreleasedReturnValue();
    lastUpdated = v5->_lastUpdated;
    v5->_lastUpdated = (NSDate *)v8;

    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));
    v5->_planChannel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("planChannel"));
    v5->_stateReason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("stateReason"));
    v5->_requiresGenericMessaging = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresGenericMessaging"));
    v5->_cancellable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cancellable"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("planSummary"));
    v10 = objc_claimAutoreleasedReturnValue();
    planSummary = v5->_planSummary;
    v5->_planSummary = (PKPayLaterFinancingPlanSummary *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantSummary"));
    v12 = objc_claimAutoreleasedReturnValue();
    merchant = v5->_merchant;
    v5->_merchant = (PKPayLaterMerchant *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fundingSource"));
    v14 = objc_claimAutoreleasedReturnValue();
    fundingSource = v5->_fundingSource;
    v5->_fundingSource = (PKPayLaterFinancingPlanFundingSource *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("termsDetails"));
    v16 = objc_claimAutoreleasedReturnValue();
    termsDetails = v5->_termsDetails;
    v5->_termsDetails = (PKPayLaterFinancingPlanTermsDetails *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scheduleSummary"));
    v18 = objc_claimAutoreleasedReturnValue();
    scheduleSummary = v5->_scheduleSummary;
    v5->_scheduleSummary = (PKPayLaterFinancingPlanScheduleSummary *)v18;

    v20 = (void *)MEMORY[0x1E0C99E60];
    v21 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("disputes"));
    v23 = objc_claimAutoreleasedReturnValue();
    disputes = v5->_disputes;
    v5->_disputes = (NSArray *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"));
    v25 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v25;

    v5->_updateReasons = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("updateReasons"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *planIdentifier;
  id v5;

  planIdentifier = self->_planIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", planIdentifier, CFSTR("planIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_productType, CFSTR("productType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastUpdated, CFSTR("lastUpdated"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_state, CFSTR("state"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_planChannel, CFSTR("planChannel"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_stateReason, CFSTR("stateReason"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_requiresGenericMessaging, CFSTR("requiresGenericMessaging"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_cancellable, CFSTR("cancellable"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_planSummary, CFSTR("planSummary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_merchant, CFSTR("merchantSummary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_scheduleSummary, CFSTR("scheduleSummary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_disputes, CFSTR("disputes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fundingSource, CFSTR("fundingSource"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_termsDetails, CFSTR("termsDetails"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountIdentifier, CFSTR("accountIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_updateReasons, CFSTR("updateReasons"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPayLaterFinancingPlan *v5;
  uint64_t v6;
  NSString *planIdentifier;
  uint64_t v8;
  NSDate *lastUpdated;
  PKPayLaterFinancingPlanSummary *v10;
  PKPayLaterFinancingPlanSummary *planSummary;
  PKPayLaterMerchant *v12;
  PKPayLaterMerchant *merchant;
  PKPayLaterFinancingPlanScheduleSummary *v14;
  PKPayLaterFinancingPlanScheduleSummary *scheduleSummary;
  uint64_t v16;
  NSArray *disputes;
  PKPayLaterFinancingPlanFundingSource *v18;
  PKPayLaterFinancingPlanFundingSource *fundingSource;
  PKPayLaterFinancingPlanTermsDetails *v20;
  PKPayLaterFinancingPlanTermsDetails *termsDetails;
  uint64_t v22;
  NSString *accountIdentifier;

  v5 = -[PKPayLaterFinancingPlan init](+[PKPayLaterFinancingPlan allocWithZone:](PKPayLaterFinancingPlan, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_planIdentifier, "copyWithZone:", a3);
  planIdentifier = v5->_planIdentifier;
  v5->_planIdentifier = (NSString *)v6;

  v5->_productType = self->_productType;
  v8 = -[NSDate copyWithZone:](self->_lastUpdated, "copyWithZone:", a3);
  lastUpdated = v5->_lastUpdated;
  v5->_lastUpdated = (NSDate *)v8;

  v5->_state = self->_state;
  v5->_planChannel = self->_planChannel;
  v5->_stateReason = self->_stateReason;
  v10 = -[PKPayLaterFinancingPlanSummary copyWithZone:](self->_planSummary, "copyWithZone:", a3);
  planSummary = v5->_planSummary;
  v5->_planSummary = v10;

  v12 = -[PKPayLaterMerchant copyWithZone:](self->_merchant, "copyWithZone:", a3);
  merchant = v5->_merchant;
  v5->_merchant = v12;

  v14 = -[PKPayLaterFinancingPlanScheduleSummary copyWithZone:](self->_scheduleSummary, "copyWithZone:", a3);
  scheduleSummary = v5->_scheduleSummary;
  v5->_scheduleSummary = v14;

  v16 = -[NSArray copyWithZone:](self->_disputes, "copyWithZone:", a3);
  disputes = v5->_disputes;
  v5->_disputes = (NSArray *)v16;

  v18 = -[PKPayLaterFinancingPlanFundingSource copyWithZone:](self->_fundingSource, "copyWithZone:", a3);
  fundingSource = v5->_fundingSource;
  v5->_fundingSource = v18;

  v20 = -[PKPayLaterFinancingPlanTermsDetails copyWithZone:](self->_termsDetails, "copyWithZone:", a3);
  termsDetails = v5->_termsDetails;
  v5->_termsDetails = v20;

  v22 = -[NSString copyWithZone:](self->_accountIdentifier, "copyWithZone:", a3);
  accountIdentifier = v5->_accountIdentifier;
  v5->_accountIdentifier = (NSString *)v22;

  return v5;
}

- (NSString)planIdentifier
{
  return self->_planIdentifier;
}

- (void)setPlanIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)productType
{
  return self->_productType;
}

- (void)setProductType:(unint64_t)a3
{
  self->_productType = a3;
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdated, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)stateReason
{
  return self->_stateReason;
}

- (void)setStateReason:(unint64_t)a3
{
  self->_stateReason = a3;
}

- (unint64_t)planChannel
{
  return self->_planChannel;
}

- (void)setPlanChannel:(unint64_t)a3
{
  self->_planChannel = a3;
}

- (BOOL)requiresGenericMessaging
{
  return self->_requiresGenericMessaging;
}

- (void)setRequiresGenericMessaging:(BOOL)a3
{
  self->_requiresGenericMessaging = a3;
}

- (BOOL)isCancellable
{
  return self->_cancellable;
}

- (void)setCancellable:(BOOL)a3
{
  self->_cancellable = a3;
}

- (PKPayLaterFinancingPlanSummary)planSummary
{
  return self->_planSummary;
}

- (void)setPlanSummary:(id)a3
{
  objc_storeStrong((id *)&self->_planSummary, a3);
}

- (PKPayLaterFinancingPlanScheduleSummary)scheduleSummary
{
  return self->_scheduleSummary;
}

- (void)setScheduleSummary:(id)a3
{
  objc_storeStrong((id *)&self->_scheduleSummary, a3);
}

- (NSArray)disputes
{
  return self->_disputes;
}

- (void)setDisputes:(id)a3
{
  objc_storeStrong((id *)&self->_disputes, a3);
}

- (PKPayLaterMerchant)merchant
{
  return self->_merchant;
}

- (void)setMerchant:(id)a3
{
  objc_storeStrong((id *)&self->_merchant, a3);
}

- (PKPayLaterFinancingPlanFundingSource)fundingSource
{
  return self->_fundingSource;
}

- (void)setFundingSource:(id)a3
{
  objc_storeStrong((id *)&self->_fundingSource, a3);
}

- (PKPayLaterFinancingPlanTermsDetails)termsDetails
{
  return self->_termsDetails;
}

- (void)setTermsDetails:(id)a3
{
  objc_storeStrong((id *)&self->_termsDetails, a3);
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (unint64_t)updateReasons
{
  return self->_updateReasons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_termsDetails, 0);
  objc_storeStrong((id *)&self->_fundingSource, 0);
  objc_storeStrong((id *)&self->_merchant, 0);
  objc_storeStrong((id *)&self->_disputes, 0);
  objc_storeStrong((id *)&self->_scheduleSummary, 0);
  objc_storeStrong((id *)&self->_planSummary, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_planIdentifier, 0);
  objc_storeStrong((id *)&self->_fundingSourceName, 0);
  objc_storeStrong((id *)&self->_paymentSource, 0);
}

@end
