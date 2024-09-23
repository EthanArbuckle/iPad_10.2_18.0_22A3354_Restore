@implementation PKPayLaterDashboardMessageComposer

- (PKPayLaterDashboardMessageComposer)initWithContext:(unint64_t)a3 allFinancingPlans:(id)a4 payLaterPass:(id)a5 payLaterAccount:(id)a6 financingPlan:(id)a7 paymentIntentController:(id)a8 delegate:(id)a9
{
  id v16;
  id v17;
  id v18;
  PKPayLaterDashboardMessageComposer *v19;
  PKPayLaterDashboardMessageComposer *v20;
  uint64_t v21;
  PKAccountService *accountService;
  NSMutableSet *v23;
  NSMutableSet *dashboardMessagesThatNeedSpinners;
  NSDateFormatter *v25;
  NSDateFormatter *shortDateFormatter;
  NSDateFormatter *v27;
  void *v28;
  id v30;
  id v31;
  id v32;
  objc_super v33;

  v32 = a4;
  v31 = a5;
  v30 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v33.receiver = self;
  v33.super_class = (Class)PKPayLaterDashboardMessageComposer;
  v19 = -[PKPayLaterDashboardMessageComposer init](&v33, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_context = a3;
    objc_storeWeak((id *)&v19->_delegate, v18);
    objc_storeStrong((id *)&v20->_payLaterPass, a5);
    objc_storeStrong((id *)&v20->_payLaterAccount, a6);
    objc_storeStrong((id *)&v20->_financingPlan, a7);
    objc_storeStrong((id *)&v20->_allFinancingPlans, a4);
    objc_storeStrong((id *)&v20->_paymentIntentController, a8);
    objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance");
    v21 = objc_claimAutoreleasedReturnValue();
    accountService = v20->_accountService;
    v20->_accountService = (PKAccountService *)v21;

    v20->_isAllContext = v20->_context == 2;
    v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    dashboardMessagesThatNeedSpinners = v20->_dashboardMessagesThatNeedSpinners;
    v20->_dashboardMessagesThatNeedSpinners = v23;

    v25 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    shortDateFormatter = v20->_shortDateFormatter;
    v20->_shortDateFormatter = v25;

    v27 = v20->_shortDateFormatter;
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setCalendar:](v27, "setCalendar:", v28);

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v20->_shortDateFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("MMM d"));
  }

  return v20;
}

- (id)dashboardMessages
{
  PKPaymentPass *payLaterPass;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  NSMutableSet *dashboardMessagesThatNeedSpinners;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id obj;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  payLaterPass = self->_payLaterPass;
  if (!payLaterPass
    || -[PKPaymentPass associatedAccountFeatureIdentifier](payLaterPass, "associatedAccountFeatureIdentifier") != 3)
  {
    return 0;
  }
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKPayLaterDashboardMessageComposer _accountLocked](self, "_accountLocked");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safelyAddObject:", v5);

  if (-[PKAccount state](self->_payLaterAccount, "state") != 3)
  {
    -[PKPayLaterDashboardMessageComposer _payLaterWelcomeMessageWithNoPlans](self, "_payLaterWelcomeMessageWithNoPlans");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safelyAddObject:", v6);

    -[PKPayLaterDashboardMessageComposer _payLaterWelcomeMessageWithPlans](self, "_payLaterWelcomeMessageWithPlans");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safelyAddObject:", v7);

    -[PKPayLaterDashboardMessageComposer _autoPayAvailableForBNPL](self, "_autoPayAvailableForBNPL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safelyAddObject:", v8);

    -[PKPayLaterDashboardMessageComposer _payLaterFinancingPlanPastDue](self, "_payLaterFinancingPlanPastDue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v9);

    -[PKPayLaterDashboardMessageComposer _payLaterFinancingDeclinedPayments](self, "_payLaterFinancingDeclinedPayments");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v10);

    -[PKPayLaterDashboardMessageComposer _financingPlanPaymentReversalMessage](self, "_financingPlanPaymentReversalMessage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v11);

    -[PKPayLaterDashboardMessageComposer _accountRestrictedNoPastDuePlans](self, "_accountRestrictedNoPastDuePlans");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safelyAddObject:", v12);

    -[PKPayLaterDashboardMessageComposer _accountRestrictedWithPastDuePlans](self, "_accountRestrictedWithPastDuePlans");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safelyAddObject:", v13);

    -[PKPayLaterDashboardMessageComposer _accountUnusualActivityDetected](self, "_accountUnusualActivityDetected");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safelyAddObject:", v14);

    -[PKPayLaterDashboardMessageComposer _accountClosed](self, "_accountClosed");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safelyAddObject:", v15);

    -[PKPayLaterDashboardMessageComposer _financingPlanDisasterRecovery](self, "_financingPlanDisasterRecovery");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safelyAddObject:", v16);

    -[PKPayLaterDashboardMessageComposer _financingPlanActiveMilitary](self, "_financingPlanActiveMilitary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safelyAddObject:", v17);

    -[PKPayLaterDashboardMessageComposer _financingPlanHardshipBenefitorPlan](self, "_financingPlanHardshipBenefitorPlan");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safelyAddObject:", v18);

    -[PKPayLaterDashboardMessageComposer _financingPlanRAPDeferral](self, "_financingPlanRAPDeferral");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safelyAddObject:", v19);

    -[PKPayLaterDashboardMessageComposer _financingPlanInProgressDisputes](self, "_financingPlanInProgressDisputes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v20);

    -[PKPayLaterDashboardMessageComposer _financingPlanEvidenceRequestedDisputes](self, "_financingPlanEvidenceRequestedDisputes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v21);

    -[PKPayLaterDashboardMessageComposer _financingPlanApprovedDisputes](self, "_financingPlanApprovedDisputes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v22);

    -[PKPayLaterDashboardMessageComposer _financingPlanSplitDisputes](self, "_financingPlanSplitDisputes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v23);

    -[PKPayLaterDashboardMessageComposer _financingPlanRejectedDisputes](self, "_financingPlanRejectedDisputes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v24);

    -[PKPayLaterDashboardMessageComposer _financingPlanWithdrawnDisputes](self, "_financingPlanWithdrawnDisputes");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v25);

    -[PKPayLaterDashboardMessageComposer _financingPlanUnresolvedDisputeState](self, "_financingPlanUnresolvedDisputeState");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safelyAddObject:", v26);

    -[PKPayLaterDashboardMessageComposer _financingPlanRefundIssued](self, "_financingPlanRefundIssued");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v27);

    -[PKPayLaterDashboardMessageComposer _financingPlanRefundRevoked](self, "_financingPlanRefundRevoked");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v28);

    -[PKPayLaterDashboardMessageComposer _financingPlanAdjustments](self, "_financingPlanAdjustments");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v29);

    -[PKPayLaterDashboardMessageComposer _financingPlanOutstandingCredit](self, "_financingPlanOutstandingCredit");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v30);

    -[PKPayLaterDashboardMessageComposer _financingPlanCanceled](self, "_financingPlanCanceled");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v31);

    -[PKPayLaterDashboardMessageComposer _financingPlanChargedOff](self, "_financingPlanChargedOff");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v32);

    -[PKPayLaterDashboardMessageComposer _financingPlanProActiveCancellation](self, "_financingPlanProActiveCancellation");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safelyAddObject:", v33);

  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v4;
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v51 != v36)
          objc_enumerationMutation(obj);
        v38 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend(v38, "message");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        dashboardMessagesThatNeedSpinners = self->_dashboardMessagesThatNeedSpinners;
        objc_msgSend(v39, "identifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = -[NSMutableSet containsObject:](dashboardMessagesThatNeedSpinners, "containsObject:", v41);

        objc_msgSend(v39, "setShowSpinner:", v42);
        objc_msgSend(v39, "setReportToAnalytics:", 1);
        objc_msgSend(MEMORY[0x1E0D66A58], "subjectToReportDashboardAnalyticsForPass:", self->_payLaterPass);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setAnalyticsReporterSubject:", v43);

        objc_msgSend(v39, "identifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "rangeOfString:", CFSTR("-"));
        if (v45 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v44, "substringToIndex:", v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setAnalyticsIdentifier:", v46);

        }
        if (self->_isAllContext)
          objc_msgSend(v38, "setPriority:", 400);

      }
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    }
    while (v35);
  }

  objc_msgSend(obj, "sortUsingSelector:", sel_compare_);
  v47 = (void *)objc_msgSend(obj, "pk_createOrderedSetByApplyingBlock:", &__block_literal_global_145);

  return v47;
}

uint64_t __55__PKPayLaterDashboardMessageComposer_dashboardMessages__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "message");
}

- (void)preflightDashboardMessagesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  v5 = v4;
  if (self->_isAllContext)
  {
    if (v4)
      (*((void (**)(id))v4 + 2))(v4);
  }
  else
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0D67768], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __79__PKPayLaterDashboardMessageComposer_preflightDashboardMessagesWithCompletion___block_invoke;
    v7[3] = &unk_1E3E6F588;
    objc_copyWeak(&v9, &location);
    v8 = v5;
    objc_msgSend(v6, "authorizationStatusWithCompletion:", v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __79__PKPayLaterDashboardMessageComposer_preflightDashboardMessagesWithCompletion___block_invoke(uint64_t a1, void *a2, char a3)
{
  _QWORD v6[4];
  id v7;
  id v8[2];
  char v9;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__PKPayLaterDashboardMessageComposer_preflightDashboardMessagesWithCompletion___block_invoke_2;
  v6[3] = &unk_1E3E712F8;
  objc_copyWeak(v8, (id *)(a1 + 40));
  v9 = a3;
  v8[1] = a2;
  v7 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v6);

  objc_destroyWeak(v8);
}

void __79__PKPayLaterDashboardMessageComposer_preflightDashboardMessagesWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 56))
      *((_QWORD *)WeakRetained + 10) = *(_QWORD *)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      v5 = v3;
      (*(void (**)(void))(v4 + 16))();
      v3 = v5;
    }
  }

}

- (id)_payLaterWelcomeMessageWithNoPlans
{
  _BOOL8 v3;
  void *v4;
  void *v5;

  v3 = -[NSArray count](self->_allFinancingPlans, "count") == 0;
  PKLocalizedCocoonString(CFSTR("DASHBOARD_WELCOME_TO_PAY_LATER_MESSAGE_NO_LOANS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterDashboardMessageComposer _payLaterWelcomeMessageForSharedCacheKey:identifierKey:hasValidPlanCount:messageString:](self, "_payLaterWelcomeMessageForSharedCacheKey:identifierKey:hasValidPlanCount:messageString:", CFSTR("PKSharedCachePayLaterDashboardWelcomeMessageWithNoPlans-FOP"), CFSTR("PayLaterWelcomeMessageNoPlans-FOP"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_payLaterWelcomeMessageWithPlans
{
  _BOOL8 v3;
  void *v4;
  void *v5;

  v3 = -[NSArray count](self->_allFinancingPlans, "count") != 0;
  PKLocalizedCocoonString(CFSTR("DASHBOARD_WELCOME_TO_PAY_LATER_MESSAGE_WITH_LOANS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterDashboardMessageComposer _payLaterWelcomeMessageForSharedCacheKey:identifierKey:hasValidPlanCount:messageString:](self, "_payLaterWelcomeMessageForSharedCacheKey:identifierKey:hasValidPlanCount:messageString:", CFSTR("PKSharedCachePayLaterDashboardWelcomeMessageWithWithPlans-FOP"), CFSTR("PayLaterWelcomeMessageWithPlans-FOP"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_payLaterWelcomeMessageForSharedCacheKey:(id)a3 identifierKey:(id)a4 hasValidPlanCount:(BOOL)a5 messageString:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  unint64_t context;
  PKDashboardPassMessage *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  PKPayLaterDashboardMessage *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id location;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_initWeak(&location, self);
  context = self->_context;
  if ((context == 2 || !context && v7) && (!PKSharedCacheGetBoolForKey() || self->_isAllContext))
  {
    v14 = objc_alloc_init(PKDashboardPassMessage);
    -[PKDashboardPassMessage setIdentifier:](v14, "setIdentifier:", v11);
    PKLocalizedCocoonString(CFSTR("DASHBOARD_WELCOME_TO_PAY_LATER_TITLE"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardPassMessage setTitle:](v14, "setTitle:", v15);

    -[PKDashboardPassMessage setMessage:](v14, "setMessage:", v12);
    PKLocalizedCocoonString(CFSTR("DASHBOARD_LEARN_MORE_BUTTON"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardPassMessage setButtonTitle:](v14, "setButtonTitle:", v16);

    -[PKDashboardPassMessage setShowDisclosure:](v14, "setShowDisclosure:", 1);
    v17 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __125__PKPayLaterDashboardMessageComposer__payLaterWelcomeMessageForSharedCacheKey_identifierKey_hasValidPlanCount_messageString___block_invoke;
    v25[3] = &unk_1E3E61B68;
    objc_copyWeak(&v27, &location);
    v18 = v10;
    v26 = v18;
    -[PKDashboardPassMessage setActionOnButtonPress:](v14, "setActionOnButtonPress:", v25);
    v22[0] = v17;
    v22[1] = 3221225472;
    v22[2] = __125__PKPayLaterDashboardMessageComposer__payLaterWelcomeMessageForSharedCacheKey_identifierKey_hasValidPlanCount_messageString___block_invoke_2;
    v22[3] = &unk_1E3E61B68;
    objc_copyWeak(&v24, &location);
    v23 = v18;
    -[PKDashboardPassMessage setActionOnDismiss:](v14, "setActionOnDismiss:", v22);
    PKDashboardMessagePassIcon(self->_payLaterPass);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardPassMessage setImage:](v14, "setImage:", v19);

    v20 = -[PKPayLaterDashboardMessage initWithMessage:priority:date:]([PKPayLaterDashboardMessage alloc], "initWithMessage:priority:date:", v14, 600, 0);
    objc_destroyWeak(&v24);

    objc_destroyWeak(&v27);
  }
  else
  {
    v20 = 0;
  }
  objc_destroyWeak(&location);

  return v20;
}

void __125__PKPayLaterDashboardMessageComposer__payLaterWelcomeMessageForSharedCacheKey_identifierKey_hasValidPlanCount_messageString___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://apple.co/paylater"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "openURL:configuration:completionHandler:", v3, 0, 0);

    objc_msgSend(WeakRetained, "_updateSharedCacheForKey:value:reloadMessages:", *(_QWORD *)(a1 + 32), 1, 1);
  }

}

void __125__PKPayLaterDashboardMessageComposer__payLaterWelcomeMessageForSharedCacheKey_identifierKey_hasValidPlanCount_messageString___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateSharedCacheForKey:value:reloadMessages:", *(_QWORD *)(a1 + 32), 1, 1);
    WeakRetained = v3;
  }

}

- (id)_autoPayAvailableForBNPL
{
  void *v3;
  void *v4;

  PKLocalizedCocoonString(CFSTR("DASHBOARD_TURN_ON_AUTO_PAY_BNPL_MESSAGE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterDashboardMessageComposer _autoPayAvailableMessageForSharedCachePrefix:identifierKeyPrefix:productType:messageString:](self, "_autoPayAvailableMessageForSharedCachePrefix:identifierKeyPrefix:productType:messageString:", CFSTR("PKSharedCachePayLaterDashboardAutoPayAvailableForBNPLPrefix-Loan-%@"), CFSTR("PayLaterAutoPayAvailableForBNPL-Loan-%@"), 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_autoPayAvailableMessageForSharedCachePrefix:(id)a3 identifierKeyPrefix:(id)a4 productType:(unint64_t)a5 messageString:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t context;
  PKPayLaterFinancingPlan *financingPlan;
  void *v18;
  uint64_t v19;
  PKDashboardPassMessage *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  PKPayLaterDashboardMessage *v26;
  _QWORD v28[5];
  id v29;
  _QWORD v30[6];
  id v31;
  id location[2];

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[PKPayLaterFinancingPlan planIdentifier](self->_financingPlan, "planIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v10, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  if (context != 2)
  {
    if (context != 1)
      goto LABEL_11;
    financingPlan = self->_financingPlan;
    if (!financingPlan || -[PKPayLaterFinancingPlan productType](financingPlan, "productType") != a5)
      goto LABEL_11;
    -[PKPayLaterFinancingPlan fundingSource](self->_financingPlan, "fundingSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "autoPayment"))
    {

LABEL_11:
      v26 = 0;
      goto LABEL_12;
    }
    v19 = -[PKPayLaterFinancingPlan state](self->_financingPlan, "state");

    if (v19 != 1)
      goto LABEL_11;
  }
  if (PKSharedCacheGetBoolForKey() && !self->_isAllContext)
    goto LABEL_11;
  objc_initWeak(location, self);
  v20 = objc_alloc_init(PKDashboardPassMessage);
  -[PKDashboardPassMessage setIdentifier:](v20, "setIdentifier:", v14);
  PKLocalizedCocoonString(CFSTR("DASHBOARD_TURN_ON_AUTO_PAY_TITLE"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setTitle:](v20, "setTitle:", v21);

  -[PKDashboardPassMessage setMessage:](v20, "setMessage:", v12);
  PKLocalizedCocoonString(CFSTR("DASHBOARD_TURN_ON_AUTO_PAY_BUTTON"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setButtonTitle:](v20, "setButtonTitle:", v22);

  -[PKDashboardPassMessage setShowDisclosure:](v20, "setShowDisclosure:", 1);
  v23 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __129__PKPayLaterDashboardMessageComposer__autoPayAvailableMessageForSharedCachePrefix_identifierKeyPrefix_productType_messageString___block_invoke;
  v30[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v31, location);
  v30[4] = v14;
  v30[5] = v15;
  -[PKDashboardPassMessage setActionOnButtonPress:](v20, "setActionOnButtonPress:", v30);
  v28[0] = v23;
  v28[1] = 3221225472;
  v28[2] = __129__PKPayLaterDashboardMessageComposer__autoPayAvailableMessageForSharedCachePrefix_identifierKeyPrefix_productType_messageString___block_invoke_3;
  v28[3] = &unk_1E3E61B68;
  objc_copyWeak(&v29, location);
  v28[4] = v15;
  -[PKDashboardPassMessage setActionOnDismiss:](v20, "setActionOnDismiss:", v28);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterDashboardMessageComposer _systemImageWithName:tintColor:](self, "_systemImageWithName:tintColor:", CFSTR("arrow.triangle.2.circlepath"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setImage:](v20, "setImage:", v25);

  v26 = -[PKPayLaterDashboardMessage initWithMessage:priority:date:]([PKPayLaterDashboardMessage alloc], "initWithMessage:priority:date:", v20, 400, 0);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&v31);

  objc_destroyWeak(location);
LABEL_12:

  return v26;
}

void __129__PKPayLaterDashboardMessageComposer__autoPayAvailableMessageForSharedCachePrefix_identifierKeyPrefix_productType_messageString___block_invoke(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  _QWORD *v4;
  PKPayLaterChangeFundingSourceViewController *v5;
  PKNavigationController *v6;
  PKNavigationController *v7;
  _QWORD v8[4];
  PKNavigationController *v9;
  int8x16_t v10;
  id v11;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_showSpinnerForDashboardMessageIdentifier:showSpinner:", *(_QWORD *)(a1 + 32), 1);
    v5 = -[PKPayLaterChangeFundingSourceViewController initWithFinancingPlan:payLaterPass:paymentIntentController:]([PKPayLaterChangeFundingSourceViewController alloc], "initWithFinancingPlan:payLaterPass:paymentIntentController:", v4[13], v4[3], v4[5]);
    v6 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v5);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __129__PKPayLaterDashboardMessageComposer__autoPayAvailableMessageForSharedCachePrefix_identifierKeyPrefix_productType_messageString___block_invoke_2;
    v8[3] = &unk_1E3E65C48;
    objc_copyWeak(&v11, v2);
    v7 = v6;
    v9 = v7;
    v10 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
    -[PKPayLaterChangeFundingSourceViewController preflightWithCompletion:](v5, "preflightWithCompletion:", v8);

    objc_destroyWeak(&v11);
  }

}

void __129__PKPayLaterDashboardMessageComposer__autoPayAvailableMessageForSharedCachePrefix_identifierKeyPrefix_productType_messageString___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id *WeakRetained;
  id *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  v11 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      v7 = objc_loadWeakRetained(WeakRetained + 1);
      objc_msgSend(v7, "dashboardMessageComposer:requestPresentViewController:", v6, *(_QWORD *)(a1 + 32));

      objc_msgSend(v6, "_updateSharedCacheForKey:value:reloadMessages:", *(_QWORD *)(a1 + 40), 1, 1);
    }
    else if (v11)
    {
      PKAccountDisplayableError();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = PKAlertForDisplayableErrorWithHandlers(v8, 0, 0, 0);

      if (v9)
      {
        v10 = objc_loadWeakRetained(v6 + 1);
        objc_msgSend(v10, "dashboardMessageComposer:requestPresentViewController:", v6, v9);

      }
    }
    objc_msgSend(v6, "_showSpinnerForDashboardMessageIdentifier:showSpinner:", *(_QWORD *)(a1 + 48), 0);
  }

}

void __129__PKPayLaterDashboardMessageComposer__autoPayAvailableMessageForSharedCachePrefix_identifierKeyPrefix_productType_messageString___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateSharedCacheForKey:value:reloadMessages:", *(_QWORD *)(a1 + 32), 1, 1);
    WeakRetained = v3;
  }

}

- (id)_payLaterFinancingPlanPastDue
{
  id v3;
  void *v4;
  unint64_t context;
  PKPayLaterFinancingPlan *financingPlan;
  void *v7;
  uint64_t v8;
  void (**v9)(id, _QWORD);
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSDateFormatter *shortDateFormatter;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  PKDashboardPassMessage *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  PKPayLaterDashboardMessage *v30;
  void *v31;
  PKPayLaterDashboardMessage *v32;
  void *v33;
  id v35;
  void (**v36)(id, _QWORD);
  id v37;
  id obj;
  id v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[4];
  id v43;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[4];
  id v51;
  _QWORD aBlock[4];
  id v53;
  id location;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PKPayLaterDashboardMessageComposer__payLaterFinancingPlanPastDue__block_invoke;
  aBlock[3] = &unk_1E3E71340;
  v37 = v3;
  v53 = v37;
  v4 = _Block_copy(aBlock);
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __67__PKPayLaterDashboardMessageComposer__payLaterFinancingPlanPastDue__block_invoke_3;
  v50[3] = &unk_1E3E61828;
  v35 = v4;
  v51 = v35;
  v36 = (void (**)(id, _QWORD))_Block_copy(v50);
  context = self->_context;
  switch(context)
  {
    case 0uLL:
      v8 = 48;
      v9 = v36;
LABEL_10:
      v9[2](v9, *(Class *)((char *)&self->super.isa + v8));
      break;
    case 1uLL:
      v8 = 104;
      v9 = (void (**)(id, _QWORD))v35;
      goto LABEL_10;
    case 2uLL:
      financingPlan = self->_financingPlan;
      v7 = financingPlan;
      if (!financingPlan)
      {
        -[NSArray firstObject](self->_allFinancingPlans, "firstObject");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v37, "safelyAddObject:", v7);
      if (!financingPlan)

      break;
  }
  if (objc_msgSend(v37, "count"))
  {
    v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    obj = v37;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    if (v10)
    {
      v40 = *(_QWORD *)v47;
      do
      {
        v41 = v10;
        for (i = 0; i != v41; ++i)
        {
          if (*(_QWORD *)v47 != v40)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          objc_msgSend(v12, "merchant");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "displayName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "scheduleSummary");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "installments");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "pk_firstObjectPassingTest:", &__block_literal_global_171);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          shortDateFormatter = self->_shortDateFormatter;
          objc_msgSend(v17, "dueDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDateFormatter stringFromDate:](shortDateFormatter, "stringFromDate:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            v21 = objc_alloc(MEMORY[0x1E0CB3940]);
            objc_msgSend(v12, "planIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("%@-%@"), CFSTR("PayLaterPastDue-FOP-Loan"), v22);

            v24 = objc_alloc_init(PKDashboardPassMessage);
            -[PKDashboardPassMessage setIdentifier:](v24, "setIdentifier:", v23);
            PKLocalizedCocoonString(CFSTR("DASHBOARD_PAST_DUE_TITLE"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKDashboardPassMessage setTitle:](v24, "setTitle:", v25);

            PKLocalizedCocoonString(CFSTR("DASHBOARD_PAST_DUE_MESSAGE"), CFSTR("%@%@"), v14, v20);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKDashboardPassMessage setMessage:](v24, "setMessage:", v26);

            PKLocalizedCocoonString(CFSTR("DASHBOARD_MAKE_PAYMENT_BUTTON"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKDashboardPassMessage setButtonTitle:](v24, "setButtonTitle:", v27);

            -[PKDashboardPassMessage setShowDisclosure:](v24, "setShowDisclosure:", 1);
            v42[0] = MEMORY[0x1E0C809B0];
            v42[1] = 3221225472;
            v42[2] = __67__PKPayLaterDashboardMessageComposer__payLaterFinancingPlanPastDue__block_invoke_5;
            v42[3] = &unk_1E3E61EE8;
            objc_copyWeak(&v45, &location);
            v28 = v23;
            v43 = v28;
            v44 = v12;
            -[PKDashboardPassMessage setActionOnButtonPress:](v24, "setActionOnButtonPress:", v42);
            -[PKPayLaterDashboardMessageComposer _warningImage](self, "_warningImage");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKDashboardPassMessage setImage:](v24, "setImage:", v29);

            v30 = [PKPayLaterDashboardMessage alloc];
            objc_msgSend(v12, "lastUpdated");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = -[PKPayLaterDashboardMessage initWithMessage:priority:date:](v30, "initWithMessage:priority:date:", v24, 800, v31);
            objc_msgSend(v39, "addObject:", v32);

            objc_destroyWeak(&v45);
          }

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
      }
      while (v10);
    }

    v33 = (void *)objc_msgSend(v39, "copy");
  }
  else
  {
    v33 = 0;
  }

  objc_destroyWeak(&location);
  return v33;
}

void __67__PKPayLaterDashboardMessageComposer__payLaterFinancingPlanPastDue__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "scheduleSummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "installments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "pk_containsObjectPassingTest:", &__block_literal_global_168);

  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "safelyAddObject:", v6);

}

BOOL __67__PKPayLaterDashboardMessageComposer__payLaterFinancingPlanPastDue__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "status") == 4;
}

void __67__PKPayLaterDashboardMessageComposer__payLaterFinancingPlanPastDue__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

BOOL __67__PKPayLaterDashboardMessageComposer__payLaterFinancingPlanPastDue__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "status") == 4;
}

void __67__PKPayLaterDashboardMessageComposer__payLaterFinancingPlanPastDue__block_invoke_5(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  _QWORD *v4;
  PKPayLaterMakePaymentViewController *v5;
  PKNavigationController *v6;
  PKNavigationController *v7;
  _QWORD v8[4];
  PKNavigationController *v9;
  id v10;
  id v11;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_showSpinnerForDashboardMessageIdentifier:showSpinner:", *(_QWORD *)(a1 + 32), 1);
    v5 = -[PKPayLaterMakePaymentViewController initWithFinancingPlan:paymentIntentController:]([PKPayLaterMakePaymentViewController alloc], "initWithFinancingPlan:paymentIntentController:", *(_QWORD *)(a1 + 40), v4[5]);
    v6 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v5);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __67__PKPayLaterDashboardMessageComposer__payLaterFinancingPlanPastDue__block_invoke_6;
    v8[3] = &unk_1E3E63548;
    objc_copyWeak(&v11, v2);
    v7 = v6;
    v9 = v7;
    v10 = *(id *)(a1 + 32);
    -[PKPayLaterMakePaymentViewController preflightWithCompletion:](v5, "preflightWithCompletion:", v8);

    objc_destroyWeak(&v11);
  }

}

void __67__PKPayLaterDashboardMessageComposer__payLaterFinancingPlanPastDue__block_invoke_6(uint64_t a1, int a2, void *a3)
{
  id *WeakRetained;
  id *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      v7 = objc_loadWeakRetained(WeakRetained + 1);
      objc_msgSend(v7, "dashboardMessageComposer:requestPresentViewController:", v6, *(_QWORD *)(a1 + 32));
    }
    else
    {
      if (!v10)
      {
LABEL_8:
        objc_msgSend(v6, "_showSpinnerForDashboardMessageIdentifier:showSpinner:", *(_QWORD *)(a1 + 40), 0);
        goto LABEL_9;
      }
      PKAccountDisplayableError();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = PKAlertForDisplayableErrorWithHandlers(v8, 0, 0, 0);

      if (v7)
      {
        v9 = objc_loadWeakRetained(v6 + 1);
        objc_msgSend(v9, "dashboardMessageComposer:requestPresentViewController:", v6, v7);

      }
    }

    goto LABEL_8;
  }
LABEL_9:

}

- (id)_payLaterFinancingDeclinedPayments
{
  id v2;
  unint64_t context;
  PKPayLaterFinancingPlan *financingPlan;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t j;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  PKDashboardPassMessage *v22;
  void *v23;
  void *v24;
  void *v25;
  PKPayLaterDashboardMessage *v26;
  void *v27;
  PKPayLaterDashboardMessage *v28;
  void *v29;
  id v31;
  id v32;
  void (**v34)(void *, _QWORD);
  id obj;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  _QWORD v41[5];
  id v42;
  _QWORD v43[7];
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD aBlock[5];
  id v54;
  id location;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PKPayLaterDashboardMessageComposer__payLaterFinancingDeclinedPayments__block_invoke;
  aBlock[3] = &unk_1E3E713C8;
  aBlock[4] = self;
  v31 = v2;
  v54 = v31;
  v34 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  context = self->_context;
  switch(context)
  {
    case 0uLL:
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v5 = self->_allFinancingPlans;
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v50 != v7)
              objc_enumerationMutation(v5);
            v34[2](v34, *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i));
          }
          v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
        }
        while (v6);
      }
LABEL_16:

      break;
    case 1uLL:
      ((void (**)(void *, PKPayLaterFinancingPlan *))v34)[2](v34, self->_financingPlan);
      break;
    case 2uLL:
      financingPlan = self->_financingPlan;
      v5 = (NSArray *)financingPlan;
      if (!financingPlan)
      {
        -[NSArray firstObject](self->_allFinancingPlans, "firstObject");
        v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v31, "safelyAddObject:", v5);
      if (!financingPlan)
        goto LABEL_16;
      break;
  }
  if (objc_msgSend(v31, "count"))
  {
    v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = v31;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
    if (v9)
    {
      v37 = *(_QWORD *)v46;
      do
      {
        v38 = v9;
        for (j = 0; j != v38; ++j)
        {
          if (*(_QWORD *)v46 != v37)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
          objc_msgSend(v11, "merchant");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "displayName");
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "scheduleSummary");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "payments");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "pk_lastObjectPassingTest:", &__block_literal_global_184);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "amount");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "formattedStringValue");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v15, "postedDate");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              PKMediumDateString();
              v39 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v39 = 0;
            }
            objc_msgSend(v15, "paymentIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PayLaterDeclinedPayment-Loan-%@"), v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PKSharedCachePayLaterDashboardDeclinedPayment-Loan-%@"), v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if ((PKSharedCacheGetBoolForKey() & 1) == 0)
            {
              if (v39)
                PKLocalizedCocoonString(CFSTR("DASHBOARD_DECLINED_PAYMENT_WITH_DATE_MESSAGE"), CFSTR("%@%@%@"), v17, v39, v40);
              else
                PKLocalizedCocoonString(CFSTR("DASHBOARD_DECLINED_PAYMENT_MESSAGE"), CFSTR("%@%@"), v17, v40);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_alloc_init(PKDashboardPassMessage);
              -[PKDashboardPassMessage setIdentifier:](v22, "setIdentifier:", v20);
              PKLocalizedCocoonString(CFSTR("DASHBOARD_DECLINED_PAYMENT_TITLE"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKDashboardPassMessage setTitle:](v22, "setTitle:", v23);

              -[PKDashboardPassMessage setMessage:](v22, "setMessage:", v36);
              PKLocalizedCocoonString(CFSTR("DASHBOARD_MAKE_PAYMENT_BUTTON"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKDashboardPassMessage setButtonTitle:](v22, "setButtonTitle:", v24);

              -[PKDashboardPassMessage setShowDisclosure:](v22, "setShowDisclosure:", 1);
              v43[0] = MEMORY[0x1E0C809B0];
              v43[1] = 3221225472;
              v43[2] = __72__PKPayLaterDashboardMessageComposer__payLaterFinancingDeclinedPayments__block_invoke_4;
              v43[3] = &unk_1E3E65CC0;
              objc_copyWeak(&v44, &location);
              v43[4] = v20;
              v43[5] = v11;
              v43[6] = v21;
              -[PKDashboardPassMessage setActionOnButtonPress:](v22, "setActionOnButtonPress:", v43);
              v41[0] = MEMORY[0x1E0C809B0];
              v41[1] = 3221225472;
              v41[2] = __72__PKPayLaterDashboardMessageComposer__payLaterFinancingDeclinedPayments__block_invoke_6;
              v41[3] = &unk_1E3E61B68;
              objc_copyWeak(&v42, &location);
              v41[4] = v21;
              -[PKDashboardPassMessage setActionOnDismiss:](v22, "setActionOnDismiss:", v41);
              -[PKPayLaterDashboardMessageComposer _warningImage](self, "_warningImage");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKDashboardPassMessage setImage:](v22, "setImage:", v25);

              v26 = [PKPayLaterDashboardMessage alloc];
              objc_msgSend(v15, "postedDate");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = -[PKPayLaterDashboardMessage initWithMessage:priority:date:](v26, "initWithMessage:priority:date:", v22, 600, v27);
              objc_msgSend(v32, "addObject:", v28);

              objc_destroyWeak(&v42);
              objc_destroyWeak(&v44);

            }
          }

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
      }
      while (v9);
    }

    v29 = (void *)objc_msgSend(v32, "copy");
  }
  else
  {
    v29 = 0;
  }

  objc_destroyWeak(&location);
  return v29;
}

void __72__PKPayLaterDashboardMessageComposer__payLaterFinancingDeclinedPayments__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char IsPending;
  int v8;
  void *v9;
  void *v10;
  int v11;
  id v12;

  v3 = a2;
  v12 = v3;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 56))
    goto LABEL_6;
  objc_msgSend(v3, "scheduleSummary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextDueInstallment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dueDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "state");
  IsPending = PKPayLaterFinancingPlanStateIsPending();
  v8 = objc_msgSend(MEMORY[0x1E0D67010], "canMakePaymentsWithAccountState:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "state"));

  v3 = v12;
  if ((IsPending & 1) == 0 && v5 && v6 && v8)
  {
LABEL_6:
    objc_msgSend(v3, "scheduleSummary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "payments");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "pk_containsObjectPassingTest:", &__block_literal_global_183);

    v3 = v12;
    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 40), "safelyAddObject:", v12);
      v3 = v12;
    }
  }

}

BOOL __72__PKPayLaterDashboardMessageComposer__payLaterFinancingDeclinedPayments__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 5;
}

BOOL __72__PKPayLaterDashboardMessageComposer__payLaterFinancingDeclinedPayments__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 5;
}

void __72__PKPayLaterDashboardMessageComposer__payLaterFinancingDeclinedPayments__block_invoke_4(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  _QWORD *v4;
  PKPayLaterMakePaymentViewController *v5;
  PKNavigationController *v6;
  PKNavigationController *v7;
  uint64_t v8;
  _QWORD v9[4];
  PKNavigationController *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_showSpinnerForDashboardMessageIdentifier:showSpinner:", *(_QWORD *)(a1 + 32), 1);
    v5 = -[PKPayLaterMakePaymentViewController initWithFinancingPlan:paymentIntentController:]([PKPayLaterMakePaymentViewController alloc], "initWithFinancingPlan:paymentIntentController:", *(_QWORD *)(a1 + 40), v4[5]);
    v6 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v5);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __72__PKPayLaterDashboardMessageComposer__payLaterFinancingDeclinedPayments__block_invoke_5;
    v9[3] = &unk_1E3E65C48;
    objc_copyWeak(&v13, v2);
    v7 = v6;
    v8 = *(_QWORD *)(a1 + 48);
    v10 = v7;
    v11 = v8;
    v12 = *(_QWORD *)(a1 + 32);
    -[PKPayLaterMakePaymentViewController preflightWithCompletion:](v5, "preflightWithCompletion:", v9);

    objc_destroyWeak(&v13);
  }

}

void __72__PKPayLaterDashboardMessageComposer__payLaterFinancingDeclinedPayments__block_invoke_5(uint64_t a1, int a2, void *a3)
{
  id *WeakRetained;
  id *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  v11 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      v7 = objc_loadWeakRetained(WeakRetained + 1);
      objc_msgSend(v7, "dashboardMessageComposer:requestPresentViewController:", v6, *(_QWORD *)(a1 + 32));

      objc_msgSend(v6, "_updateSharedCacheForKey:value:reloadMessages:", *(_QWORD *)(a1 + 40), 1, 1);
    }
    else if (v11)
    {
      PKAccountDisplayableError();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = PKAlertForDisplayableErrorWithHandlers(v8, 0, 0, 0);

      if (v9)
      {
        v10 = objc_loadWeakRetained(v6 + 1);
        objc_msgSend(v10, "dashboardMessageComposer:requestPresentViewController:", v6, v9);

      }
    }
    objc_msgSend(v6, "_showSpinnerForDashboardMessageIdentifier:showSpinner:", *(_QWORD *)(a1 + 48), 0);
  }

}

void __72__PKPayLaterDashboardMessageComposer__payLaterFinancingDeclinedPayments__block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateSharedCacheForKey:value:reloadMessages:", *(_QWORD *)(a1 + 32), 1, 1);
    WeakRetained = v3;
  }

}

- (id)_financingPlanPaymentReversalMessage
{
  id v3;
  void *v4;
  unint64_t context;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PKDashboardPassMessage *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  PKPayLaterDashboardMessage *v22;
  void *v23;
  id v25;
  void (**v26)(void *, NSArray *);
  id v27;
  id obj;
  id v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[7];
  id v35;
  id location;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  _QWORD aBlock[4];
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__PKPayLaterDashboardMessageComposer__financingPlanPaymentReversalMessage__block_invoke;
  aBlock[3] = &unk_1E3E71340;
  v27 = v3;
  v44 = v27;
  v4 = _Block_copy(aBlock);
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __74__PKPayLaterDashboardMessageComposer__financingPlanPaymentReversalMessage__block_invoke_2;
  v41[3] = &unk_1E3E61828;
  v25 = v4;
  v42 = v25;
  v26 = (void (**)(void *, NSArray *))_Block_copy(v41);
  context = self->_context;
  if (context)
  {
    if (context == 1)
    {
      (*((void (**)(id, PKPayLaterFinancingPlan *))v25 + 2))(v25, self->_financingPlan);
    }
    else if (context == 2)
    {
      if (self->_financingPlan)
      {
        objc_msgSend(v27, "safelyAddObject:");
      }
      else
      {
        -[NSArray firstObject](self->_allFinancingPlans, "firstObject");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "safelyAddObject:", v6);

      }
    }
  }
  else
  {
    v26[2](v26, self->_allFinancingPlans);
  }
  if (objc_msgSend(v27, "count"))
  {
    v39 = 0u;
    v40 = 0u;
    v38 = 0u;
    v37 = 0u;
    obj = v27;
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v31)
    {
      v30 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v38 != v30)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          v9 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v8, "planIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "stringWithFormat:", CFSTR("PKSharedCachePayLaterDashboardPaymentReversalPrefix-FOP-Loan-%@"), v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v8, "planIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringWithFormat:", CFSTR("PayLaterPaymentReversalPrefix-FOP-Loan-%@"), v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!PKSharedCacheGetBoolForKey() || self->_isAllContext)
          {
            objc_initWeak(&location, self);
            v15 = objc_alloc_init(PKDashboardPassMessage);
            -[PKDashboardPassMessage setIdentifier:](v15, "setIdentifier:", v14);
            PKLocalizedCocoonString(CFSTR("DASHBOARD_PAYMENT_REVERSAL_TITLE"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKDashboardPassMessage setTitle:](v15, "setTitle:", v16);

            objc_msgSend(v8, "merchant");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "displayName");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            PKLocalizedCocoonString(CFSTR("DASHBOARD_PAYMENT_REVERSAL_MESSAGE"), CFSTR("%@"), v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKDashboardPassMessage setMessage:](v15, "setMessage:", v19);

            if ((self->_context | 2) == 2)
            {
              PKLocalizedCocoonString(CFSTR("DASHBOARD_VIEW_PAYMENT_SCHEDULE_BUTTON"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKDashboardPassMessage setButtonTitle:](v15, "setButtonTitle:", v20);

              -[PKDashboardPassMessage setShowDisclosure:](v15, "setShowDisclosure:", 1);
              v34[0] = MEMORY[0x1E0C809B0];
              v34[1] = 3221225472;
              v34[2] = __74__PKPayLaterDashboardMessageComposer__financingPlanPaymentReversalMessage__block_invoke_3;
              v34[3] = &unk_1E3E65CC0;
              objc_copyWeak(&v35, &location);
              v34[4] = self;
              v34[5] = v8;
              v34[6] = v11;
              -[PKDashboardPassMessage setActionOnButtonPress:](v15, "setActionOnButtonPress:", v34);
              objc_destroyWeak(&v35);
            }
            v32[0] = MEMORY[0x1E0C809B0];
            v32[1] = 3221225472;
            v32[2] = __74__PKPayLaterDashboardMessageComposer__financingPlanPaymentReversalMessage__block_invoke_4;
            v32[3] = &unk_1E3E61B68;
            objc_copyWeak(&v33, &location);
            v32[4] = v11;
            -[PKDashboardPassMessage setActionOnDismiss:](v15, "setActionOnDismiss:", v32);
            -[PKPayLaterDashboardMessageComposer _reverseImage](self, "_reverseImage");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKDashboardPassMessage setImage:](v15, "setImage:", v21);

            v22 = -[PKPayLaterDashboardMessage initWithMessage:priority:date:]([PKPayLaterDashboardMessage alloc], "initWithMessage:priority:date:", v15, 400, 0);
            objc_msgSend(v29, "addObject:", v22);

            objc_destroyWeak(&v33);
            objc_destroyWeak(&location);
          }

        }
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v31);
    }

    v23 = (void *)objc_msgSend(v29, "copy");
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

void __74__PKPayLaterDashboardMessageComposer__financingPlanPaymentReversalMessage__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "scheduleSummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "scheduleSummaryReason");

  if (v4 == 9)
    objc_msgSend(*(id *)(a1 + 32), "safelyAddObject:", v5);

}

void __74__PKPayLaterDashboardMessageComposer__financingPlanPaymentReversalMessage__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

void __74__PKPayLaterDashboardMessageComposer__financingPlanPaymentReversalMessage__block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 1);
    objc_msgSend(v3, "dashboardMessageComposer:requestPresentFinancingPlanDetails:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    objc_msgSend(v4, "_updateSharedCacheForKey:value:reloadMessages:", *(_QWORD *)(a1 + 48), 1, 1);
    WeakRetained = v4;
  }

}

void __74__PKPayLaterDashboardMessageComposer__financingPlanPaymentReversalMessage__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateSharedCacheForKey:value:reloadMessages:", *(_QWORD *)(a1 + 32), 1, 1);
    WeakRetained = v3;
  }

}

- (id)_accountRestrictedNoPastDuePlans
{
  char v3;
  unint64_t context;
  char v5;
  PKAccount *payLaterAccount;
  char v7;
  PKDashboardPassMessage *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PKPayLaterDashboardMessage *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  v3 = -[NSArray pk_containsObjectPassingTest:](self->_allFinancingPlans, "pk_containsObjectPassingTest:", &__block_literal_global_202);
  context = self->_context;
  if (context != 2)
  {
    if (context)
      return 0;
    v5 = v3;
    payLaterAccount = self->_payLaterAccount;
    if (!payLaterAccount)
      return 0;
    v7 = -[PKAccount state](payLaterAccount, "state") == 2 ? v5 : 1;
    if ((v7 & 1) != 0)
      return 0;
  }
  objc_initWeak(&location, self);
  v9 = objc_alloc_init(PKDashboardPassMessage);
  -[PKDashboardPassMessage setIdentifier:](v9, "setIdentifier:", CFSTR("PayLaterAccountRestrictedNoPastDuePlans-FOP"));
  PKLocalizedCocoonString(CFSTR("DASHBOARD_ACCOUNT_RESTRICTED_TITLE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setTitle:](v9, "setTitle:", v10);

  PKLocalizedCocoonString(CFSTR("DASHBOARD_ACCOUNT_RESTRICTED_NO_PAST_DUE_LOAN_MESSAGE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setMessage:](v9, "setMessage:", v11);

  PKLocalizedCocoonString(CFSTR("DASHBOARD_CHAT_WITH_SPECIALIST_BUTTON"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setButtonTitle:](v9, "setButtonTitle:", v12);

  -[PKDashboardPassMessage setShowDisclosure:](v9, "setShowDisclosure:", 1);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __70__PKPayLaterDashboardMessageComposer__accountRestrictedNoPastDuePlans__block_invoke_2;
  v18 = &unk_1E3E61310;
  objc_copyWeak(&v19, &location);
  -[PKDashboardPassMessage setActionOnButtonPress:](v9, "setActionOnButtonPress:", &v15);
  -[PKPayLaterDashboardMessageComposer _warningImage](self, "_warningImage", v15, v16, v17, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setImage:](v9, "setImage:", v13);

  v14 = -[PKPayLaterDashboardMessage initWithMessage:priority:date:]([PKPayLaterDashboardMessage alloc], "initWithMessage:priority:date:", v9, 1000, 0);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
  return v14;
}

BOOL __70__PKPayLaterDashboardMessageComposer__accountRestrictedNoPastDuePlans__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "state") == 4;
}

void __70__PKPayLaterDashboardMessageComposer__accountRestrictedNoPastDuePlans__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_presentBusinessChatForApplePayLaterAccountWithTopicType:", 12);
    WeakRetained = v2;
  }

}

- (id)_accountRestrictedWithPastDuePlans
{
  int v3;
  unint64_t context;
  int v5;
  PKAccount *payLaterAccount;
  int v7;
  PKDashboardPassMessage *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PKPayLaterDashboardMessage *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  v3 = -[NSArray pk_containsObjectPassingTest:](self->_allFinancingPlans, "pk_containsObjectPassingTest:", &__block_literal_global_209);
  context = self->_context;
  if (context != 2)
  {
    if (context)
      return 0;
    v5 = v3;
    payLaterAccount = self->_payLaterAccount;
    if (!payLaterAccount)
      return 0;
    v7 = -[PKAccount state](payLaterAccount, "state") == 2 ? v5 : 0;
    if (v7 != 1)
      return 0;
  }
  objc_initWeak(&location, self);
  v8 = objc_alloc_init(PKDashboardPassMessage);
  -[PKDashboardPassMessage setIdentifier:](v8, "setIdentifier:", CFSTR("PayLaterAccountRestrictedWithPastDuePlans-FOP"));
  PKLocalizedCocoonString(CFSTR("DASHBOARD_ACCOUNT_RESTRICTED_TITLE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setTitle:](v8, "setTitle:", v9);

  PKLocalizedCocoonString(CFSTR("DASHBOARD_ACCOUNT_RESTRICTED_WITH_PAST_DUE_LOAN_MESSAGE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setMessage:](v8, "setMessage:", v10);

  PKLocalizedCocoonString(CFSTR("DASHBOARD_CHAT_WITH_SPECIALIST_BUTTON"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setButtonTitle:](v8, "setButtonTitle:", v11);

  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __72__PKPayLaterDashboardMessageComposer__accountRestrictedWithPastDuePlans__block_invoke_2;
  v18 = &unk_1E3E61310;
  objc_copyWeak(&v19, &location);
  -[PKDashboardPassMessage setActionOnButtonPress:](v8, "setActionOnButtonPress:", &v15);
  -[PKPayLaterDashboardMessageComposer _warningImage](self, "_warningImage", v15, v16, v17, v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setImage:](v8, "setImage:", v12);

  v13 = -[PKPayLaterDashboardMessage initWithMessage:priority:date:]([PKPayLaterDashboardMessage alloc], "initWithMessage:priority:date:", v8, 1000, 0);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
  return v13;
}

BOOL __72__PKPayLaterDashboardMessageComposer__accountRestrictedWithPastDuePlans__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "state") == 4;
}

void __72__PKPayLaterDashboardMessageComposer__accountRestrictedWithPastDuePlans__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_presentBusinessChatForApplePayLaterAccountWithTopicType:", 12);
    WeakRetained = v2;
  }

}

- (id)_accountUnusualActivityDetected
{
  unint64_t context;
  PKAccount *payLaterAccount;
  PKDashboardPassMessage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PKPayLaterDashboardMessage *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  context = self->_context;
  if (context != 2)
  {
    if (context)
      return 0;
    payLaterAccount = self->_payLaterAccount;
    if (!payLaterAccount || -[PKAccount stateReason](payLaterAccount, "stateReason") != 5)
      return 0;
  }
  objc_initWeak(&location, self);
  v5 = objc_alloc_init(PKDashboardPassMessage);
  -[PKDashboardPassMessage setIdentifier:](v5, "setIdentifier:", CFSTR("PayLaterAccountAccountFraudSuspected-FOP"));
  PKLocalizedCocoonString(CFSTR("DASHBOARD_ACCOUNT_FRAUD_SUSPECTED_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setTitle:](v5, "setTitle:", v6);

  PKLocalizedCocoonString(CFSTR("DASHBOARD_ACCOUNT_FRAUD_SUSPECTED_MESSAGE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setMessage:](v5, "setMessage:", v7);

  PKLocalizedCocoonString(CFSTR("DASHBOARD_CHAT_WITH_SPECIALIST_BUTTON"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setButtonTitle:](v5, "setButtonTitle:", v8);

  -[PKDashboardPassMessage setShowDisclosure:](v5, "setShowDisclosure:", 1);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __69__PKPayLaterDashboardMessageComposer__accountUnusualActivityDetected__block_invoke;
  v15 = &unk_1E3E61310;
  objc_copyWeak(&v16, &location);
  -[PKDashboardPassMessage setActionOnButtonPress:](v5, "setActionOnButtonPress:", &v12);
  -[PKPayLaterDashboardMessageComposer _warningImage](self, "_warningImage", v12, v13, v14, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setImage:](v5, "setImage:", v9);

  v10 = -[PKPayLaterDashboardMessage initWithMessage:priority:date:]([PKPayLaterDashboardMessage alloc], "initWithMessage:priority:date:", v5, 800, 0);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
  return v10;
}

void __69__PKPayLaterDashboardMessageComposer__accountUnusualActivityDetected__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_presentBusinessChatForApplePayLaterAccountWithTopicType:", 13);
    objc_msgSend(v2[4], "updateWalletBadgeCountWithCompletion:", 0);
    WeakRetained = v2;
  }

}

- (id)_accountLocked
{
  unint64_t context;
  PKAccount *payLaterAccount;
  PKDashboardPassMessage *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v10;
  void *v11;
  PKPayLaterDashboardMessage *v12;
  _QWORD v13[4];
  id v14[2];
  id location;

  context = self->_context;
  if (context != 2)
  {
    if (context)
      return 0;
    payLaterAccount = self->_payLaterAccount;
    if (!payLaterAccount || -[PKAccount state](payLaterAccount, "state") != 3)
      return 0;
  }
  objc_initWeak(&location, self);
  v5 = objc_alloc_init(PKDashboardPassMessage);
  -[PKDashboardPassMessage setIdentifier:](v5, "setIdentifier:", CFSTR("PayLaterAccountAccountLocked-FOP"));
  PKLocalizedCocoonString(CFSTR("DASHBOARD_ACCOUNT_LOCKED_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setTitle:](v5, "setTitle:", v6);

  if (-[PKAccount stateReason](self->_payLaterAccount, "stateReason") == 15)
  {
    PKLocalizedCocoonString(CFSTR("DASHBOARD_ACCOUNT_LOCKED_BANKRUPTCY_MESSAGE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardPassMessage setMessage:](v5, "setMessage:", v7);
    v8 = 15;
  }
  else
  {
    PKLocalizedCocoonString(CFSTR("DASHBOARD_ACCOUNT_LOCKED_MESSAGE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardPassMessage setMessage:](v5, "setMessage:", v7);
    v8 = 14;
  }

  PKLocalizedCocoonString(CFSTR("DASHBOARD_CHAT_WITH_SPECIALIST_BUTTON"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setButtonTitle:](v5, "setButtonTitle:", v10);

  -[PKDashboardPassMessage setShowDisclosure:](v5, "setShowDisclosure:", 1);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__PKPayLaterDashboardMessageComposer__accountLocked__block_invoke;
  v13[3] = &unk_1E3E66D38;
  objc_copyWeak(v14, &location);
  v14[1] = (id)v8;
  -[PKDashboardPassMessage setActionOnButtonPress:](v5, "setActionOnButtonPress:", v13);
  -[PKPayLaterDashboardMessageComposer _warningImage](self, "_warningImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setImage:](v5, "setImage:", v11);

  v12 = -[PKPayLaterDashboardMessage initWithMessage:priority:date:]([PKPayLaterDashboardMessage alloc], "initWithMessage:priority:date:", v5, 1000, 0);
  objc_destroyWeak(v14);

  objc_destroyWeak(&location);
  return v12;
}

void __52__PKPayLaterDashboardMessageComposer__accountLocked__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_presentBusinessChatForApplePayLaterAccountWithTopicType:", *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (id)_accountClosed
{
  unint64_t context;
  PKAccount *payLaterAccount;
  PKDashboardPassMessage *v5;
  void *v6;
  void *v7;
  void *v8;
  PKPayLaterDashboardMessage *v9;

  context = self->_context;
  if (context != 2)
  {
    if (context)
      return 0;
    payLaterAccount = self->_payLaterAccount;
    if (!payLaterAccount || -[PKAccount state](payLaterAccount, "state") != 4)
      return 0;
  }
  v5 = objc_alloc_init(PKDashboardPassMessage);
  -[PKDashboardPassMessage setIdentifier:](v5, "setIdentifier:", CFSTR("PayLaterAccountAccountClosed-FOP"));
  PKLocalizedCocoonString(CFSTR("DASHBOARD_ACCOUNT_CLOSED_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setTitle:](v5, "setTitle:", v6);

  PKLocalizedCocoonString(CFSTR("DASHBOARD_ACCOUNT_CLOSED_MESSAGE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setMessage:](v5, "setMessage:", v7);

  -[PKPayLaterDashboardMessageComposer _warningImage](self, "_warningImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setImage:](v5, "setImage:", v8);

  v9 = -[PKPayLaterDashboardMessage initWithMessage:priority:date:]([PKPayLaterDashboardMessage alloc], "initWithMessage:priority:date:", v5, 1000, 0);
  return v9;
}

- (id)_financingPlanDisasterRecovery
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t context;
  PKPayLaterFinancingPlan *financingPlan;
  void *v11;
  uint64_t v12;
  PKDashboardPassMessage *v13;
  void *v14;
  void *v15;
  void *v16;
  PKPayLaterDashboardMessage *v17;
  _QWORD v19[5];
  id v20;
  id location;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PKPayLaterFinancingPlan planIdentifier](self->_financingPlan, "planIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PKSharedCachePayLaterDashboardPlanDisasterRecoveryPrefix-Loan-%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  -[PKPayLaterFinancingPlan planIdentifier](self->_financingPlan, "planIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("PayLaterPlanDisasterRecovery-Loan-%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  context = self->_context;
  if ((context == 2
     || context == 1
     && (financingPlan = self->_financingPlan) != 0
     && (-[PKPayLaterFinancingPlan scheduleSummary](financingPlan, "scheduleSummary"),
         v11 = (void *)objc_claimAutoreleasedReturnValue(),
         v12 = objc_msgSend(v11, "scheduleSummaryReason"),
         v11,
         v12 == 1))
    && (!PKSharedCacheGetBoolForKey() || self->_isAllContext))
  {
    objc_initWeak(&location, self);
    v13 = objc_alloc_init(PKDashboardPassMessage);
    -[PKDashboardPassMessage setIdentifier:](v13, "setIdentifier:", v8);
    PKLocalizedCocoonString(CFSTR("DASHBOARD_LOAN_DISASTER_RECOVERY_TITLE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardPassMessage setTitle:](v13, "setTitle:", v14);

    PKLocalizedCocoonString(CFSTR("DASHBOARD_LOAN_DISASTER_RECOVERY_MESSAGE"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardPassMessage setMessage:](v13, "setMessage:", v15);

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __68__PKPayLaterDashboardMessageComposer__financingPlanDisasterRecovery__block_invoke;
    v19[3] = &unk_1E3E61B68;
    objc_copyWeak(&v20, &location);
    v19[4] = v5;
    -[PKDashboardPassMessage setActionOnDismiss:](v13, "setActionOnDismiss:", v19);
    -[PKPayLaterDashboardMessageComposer _pencilImage](self, "_pencilImage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardPassMessage setImage:](v13, "setImage:", v16);

    v17 = -[PKPayLaterDashboardMessage initWithMessage:priority:date:]([PKPayLaterDashboardMessage alloc], "initWithMessage:priority:date:", v13, 400, 0);
    objc_destroyWeak(&v20);

    objc_destroyWeak(&location);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

void __68__PKPayLaterDashboardMessageComposer__financingPlanDisasterRecovery__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateSharedCacheForKey:value:reloadMessages:", *(_QWORD *)(a1 + 32), 1, 1);
    WeakRetained = v3;
  }

}

- (id)_financingPlanActiveMilitary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t context;
  PKPayLaterFinancingPlan *financingPlan;
  void *v11;
  uint64_t v12;
  PKDashboardPassMessage *v13;
  void *v14;
  void *v15;
  void *v16;
  PKPayLaterDashboardMessage *v17;
  _QWORD v19[5];
  id v20;
  id location;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PKPayLaterFinancingPlan planIdentifier](self->_financingPlan, "planIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PKSharedCachePayLaterDashboardPlanActiveMilitaryPrefix-Loan-%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  -[PKPayLaterFinancingPlan planIdentifier](self->_financingPlan, "planIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("PayLaterPlanActiveMilitary-Loan-%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  context = self->_context;
  if ((context == 2
     || context == 1
     && (financingPlan = self->_financingPlan) != 0
     && (-[PKPayLaterFinancingPlan scheduleSummary](financingPlan, "scheduleSummary"),
         v11 = (void *)objc_claimAutoreleasedReturnValue(),
         v12 = objc_msgSend(v11, "scheduleSummaryReason"),
         v11,
         v12 == 2))
    && (!PKSharedCacheGetBoolForKey() || self->_isAllContext))
  {
    objc_initWeak(&location, self);
    v13 = objc_alloc_init(PKDashboardPassMessage);
    -[PKDashboardPassMessage setIdentifier:](v13, "setIdentifier:", v8);
    PKLocalizedCocoonString(CFSTR("DASHBOARD_LOAN_ACTIVE_MILITARY_TITLE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardPassMessage setTitle:](v13, "setTitle:", v14);

    PKLocalizedCocoonString(CFSTR("DASHBOARD_LOAN_ACTIVE_MILITARY_MESSAGE"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardPassMessage setMessage:](v13, "setMessage:", v15);

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __66__PKPayLaterDashboardMessageComposer__financingPlanActiveMilitary__block_invoke;
    v19[3] = &unk_1E3E61B68;
    objc_copyWeak(&v20, &location);
    v19[4] = v5;
    -[PKDashboardPassMessage setActionOnDismiss:](v13, "setActionOnDismiss:", v19);
    -[PKPayLaterDashboardMessageComposer _pencilImage](self, "_pencilImage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardPassMessage setImage:](v13, "setImage:", v16);

    v17 = -[PKPayLaterDashboardMessage initWithMessage:priority:date:]([PKPayLaterDashboardMessage alloc], "initWithMessage:priority:date:", v13, 400, 0);
    objc_destroyWeak(&v20);

    objc_destroyWeak(&location);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

void __66__PKPayLaterDashboardMessageComposer__financingPlanActiveMilitary__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateSharedCacheForKey:value:reloadMessages:", *(_QWORD *)(a1 + 32), 1, 1);
    WeakRetained = v3;
  }

}

- (id)_financingPlanHardshipBenefitorPlan
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t context;
  PKPayLaterFinancingPlan *financingPlan;
  void *v11;
  uint64_t v12;
  PKDashboardPassMessage *v13;
  void *v14;
  void *v15;
  void *v16;
  PKPayLaterDashboardMessage *v17;
  _QWORD v19[5];
  id v20;
  id location;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PKPayLaterFinancingPlan planIdentifier](self->_financingPlan, "planIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PKSharedCachePayLaterDashboardPlanHardshipBenefitorPlanPrefix-Loan-%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  -[PKPayLaterFinancingPlan planIdentifier](self->_financingPlan, "planIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("PayLaterPlanHardshipBenefitorPlan-Loan-%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  context = self->_context;
  if ((context == 2
     || context == 1
     && (financingPlan = self->_financingPlan) != 0
     && (-[PKPayLaterFinancingPlan scheduleSummary](financingPlan, "scheduleSummary"),
         v11 = (void *)objc_claimAutoreleasedReturnValue(),
         v12 = objc_msgSend(v11, "scheduleSummaryReason"),
         v11,
         v12 == 3))
    && (!PKSharedCacheGetBoolForKey() || self->_isAllContext))
  {
    objc_initWeak(&location, self);
    v13 = objc_alloc_init(PKDashboardPassMessage);
    -[PKDashboardPassMessage setIdentifier:](v13, "setIdentifier:", v8);
    PKLocalizedCocoonString(CFSTR("DASHBOARD_LOAN_HARDSHIP_PLAN_TITLE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardPassMessage setTitle:](v13, "setTitle:", v14);

    PKLocalizedCocoonString(CFSTR("DASHBOARD_LOAN_HARDSHIP_PLAN_MESSAGE"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardPassMessage setMessage:](v13, "setMessage:", v15);

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __73__PKPayLaterDashboardMessageComposer__financingPlanHardshipBenefitorPlan__block_invoke;
    v19[3] = &unk_1E3E61B68;
    objc_copyWeak(&v20, &location);
    v19[4] = v5;
    -[PKDashboardPassMessage setActionOnDismiss:](v13, "setActionOnDismiss:", v19);
    -[PKPayLaterDashboardMessageComposer _pencilImage](self, "_pencilImage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardPassMessage setImage:](v13, "setImage:", v16);

    v17 = -[PKPayLaterDashboardMessage initWithMessage:priority:date:]([PKPayLaterDashboardMessage alloc], "initWithMessage:priority:date:", v13, 400, 0);
    objc_destroyWeak(&v20);

    objc_destroyWeak(&location);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

void __73__PKPayLaterDashboardMessageComposer__financingPlanHardshipBenefitorPlan__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateSharedCacheForKey:value:reloadMessages:", *(_QWORD *)(a1 + 32), 1, 1);
    WeakRetained = v3;
  }

}

- (id)_financingPlanRAPDeferral
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t context;
  PKPayLaterFinancingPlan *financingPlan;
  void *v11;
  uint64_t v12;
  PKDashboardPassMessage *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PKPayLaterDashboardMessage *v19;
  _QWORD v21[5];
  id v22;
  id location;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PKPayLaterFinancingPlan planIdentifier](self->_financingPlan, "planIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PKSharedCachePayLaterDashboardPlanRAPDeferralPrefix-Loan-%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  -[PKPayLaterFinancingPlan planIdentifier](self->_financingPlan, "planIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("PayLaterPlanRAPDeferral-Loan-%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  context = self->_context;
  if ((context == 2
     || context == 1
     && (financingPlan = self->_financingPlan) != 0
     && (-[PKPayLaterFinancingPlan scheduleSummary](financingPlan, "scheduleSummary"),
         v11 = (void *)objc_claimAutoreleasedReturnValue(),
         v12 = objc_msgSend(v11, "scheduleSummaryReason"),
         v11,
         v12 == 7))
    && (!PKSharedCacheGetBoolForKey() || self->_isAllContext))
  {
    objc_initWeak(&location, self);
    v13 = objc_alloc_init(PKDashboardPassMessage);
    -[PKDashboardPassMessage setIdentifier:](v13, "setIdentifier:", v8);
    PKLocalizedCocoonString(CFSTR("DASHBOARD_LOAN_RAP_DEFERRAL_TITLE"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardPassMessage setTitle:](v13, "setTitle:", v14);

    -[PKPayLaterFinancingPlan merchant](self->_financingPlan, "merchant");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "displayName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedCocoonString(CFSTR("DASHBOARD_LOAN_RAP_DEFERRAL_MESSAGE"), CFSTR("%@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardPassMessage setMessage:](v13, "setMessage:", v17);

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __63__PKPayLaterDashboardMessageComposer__financingPlanRAPDeferral__block_invoke;
    v21[3] = &unk_1E3E61B68;
    objc_copyWeak(&v22, &location);
    v21[4] = v5;
    -[PKDashboardPassMessage setActionOnDismiss:](v13, "setActionOnDismiss:", v21);
    -[PKPayLaterDashboardMessageComposer _pencilImage](self, "_pencilImage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardPassMessage setImage:](v13, "setImage:", v18);

    v19 = -[PKPayLaterDashboardMessage initWithMessage:priority:date:]([PKPayLaterDashboardMessage alloc], "initWithMessage:priority:date:", v13, 400, 0);
    objc_destroyWeak(&v22);

    objc_destroyWeak(&location);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

void __63__PKPayLaterDashboardMessageComposer__financingPlanRAPDeferral__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateSharedCacheForKey:value:reloadMessages:", *(_QWORD *)(a1 + 32), 1, 1);
    WeakRetained = v3;
  }

}

- (id)_financingPlanInProgressDisputes
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t context;
  PKPayLaterFinancingPlan *financingPlan;
  PKPayLaterFinancingPlan *v13;
  PKPayLaterFinancingPlan *v14;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(void *, void *, uint64_t, void *, void *);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  PKPayLaterDashboardMessageComposer *v44;
  id v45;
  _QWORD aBlock[4];
  id v47;
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PKPayLaterDashboardMessageComposer__financingPlanInProgressDisputes__block_invoke;
  aBlock[3] = &unk_1E3E713C8;
  v7 = v4;
  v47 = v7;
  v8 = v5;
  v48 = v8;
  v9 = _Block_copy(aBlock);
  v10 = v9;
  context = self->_context;
  if (context == 1)
  {
    (*((void (**)(void *, PKPayLaterFinancingPlan *))v9 + 2))(v9, self->_financingPlan);
  }
  else if (context == 2)
  {
    financingPlan = self->_financingPlan;
    if (financingPlan)
    {
      v13 = financingPlan;
    }
    else
    {
      -[NSArray firstObject](self->_allFinancingPlans, "firstObject");
      v13 = (PKPayLaterFinancingPlan *)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;
    -[PKPayLaterFinancingPlan disputes](v13, "disputes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "safelyAddObject:", v16);
    objc_msgSend(v16, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v14, v17);

  }
  if (!objc_msgSend(v7, "count"))
  {
    v29 = 0;
    goto LABEL_24;
  }
  v33 = v10;
  v34 = v8;
  v42[0] = v6;
  v42[1] = 3221225472;
  v42[2] = __70__PKPayLaterDashboardMessageComposer__financingPlanInProgressDisputes__block_invoke_2;
  v42[3] = &unk_1E3E714B0;
  v43 = v8;
  v44 = self;
  v36 = v3;
  v32 = v3;
  v45 = v32;
  v18 = (void (**)(void *, void *, uint64_t, void *, void *))_Block_copy(v42);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v35 = v7;
  obj = v7;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
  if (!v19)
    goto LABEL_22;
  v20 = v19;
  v21 = *(_QWORD *)v39;
  do
  {
    for (i = 0; i != v20; ++i)
    {
      if (*(_QWORD *)v39 != v21)
        objc_enumerationMutation(obj);
      v23 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
      objc_msgSend(v23, "identifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      PKStringWithValidatedFormat();
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v23, "identifier", v31);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringWithFormat:", CFSTR("PayLaterPlanDisputeInProgress-Loan-%@"), v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (PKSharedCacheGetBoolForKey())
      {
        if (self->_isAllContext)
          goto LABEL_18;
      }
      else
      {
        if (self->_isAllContext)
        {
LABEL_18:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v27, CFSTR("bnpl"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v18[2](v18, v23, 1, v24, v28);

          goto LABEL_20;
        }
        v18[2](v18, v23, -[PKPayLaterFinancingPlan productType](self->_financingPlan, "productType"), v24, v27);
      }
LABEL_20:

    }
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
  }
  while (v20);
LABEL_22:

  v29 = (void *)objc_msgSend(v32, "copy");
  v7 = v35;
  v3 = v36;
  v10 = v33;
  v8 = v34;
LABEL_24:

  return v29;
}

void __70__PKPayLaterDashboardMessageComposer__financingPlanInProgressDisputes__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "disputes", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "state") == 1)
        {
          objc_msgSend(*(id *)(a1 + 32), "safelyAddObject:", v9);
          v10 = *(void **)(a1 + 40);
          objc_msgSend(v9, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKey:", v3, v11);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

void __70__PKPayLaterDashboardMessageComposer__financingPlanInProgressDisputes__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  PKDashboardPassMessage *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  PKPayLaterDashboardMessage *v35;
  void *v36;
  void *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  id location;
  _QWORD v47[4];
  id v48;

  v9 = a2;
  v38 = a4;
  v10 = a5;
  v11 = *(void **)(a1 + 32);
  objc_msgSend(v9, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v9, "appliedPayments");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pk_arrayByApplyingBlock:", &__block_literal_global_245);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "scheduleSummary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "payments");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __70__PKPayLaterDashboardMessageComposer__financingPlanInProgressDisputes__block_invoke_4;
  v47[3] = &unk_1E3E62610;
  v20 = v17;
  v48 = v20;
  objc_msgSend(v19, "pk_firstObjectPassingTest:", v47);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "amount");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "formattedStringValue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = v20;
  if (a3 == 1)
  {
    if (v21 && objc_msgSend(v23, "length"))
    {
      PKLocalizedCocoonString(CFSTR("DASHBOARD_LOAN_DISPUTE_REVIEW_TEMPORARY_CREDIT_BNPL_MESSAGE"), CFSTR("%@"), v23);
      v24 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PKLocalizedCocoonString(CFSTR("DASHBOARD_LOAN_DISPUTE_REVIEW_BNPL_MESSAGE"));
      v24 = objc_claimAutoreleasedReturnValue();
    }
    v25 = (void *)v24;
  }
  else
  {
    v25 = 0;
  }
  objc_initWeak(&location, *(id *)(a1 + 40));
  v26 = objc_alloc_init(PKDashboardPassMessage);
  -[PKDashboardPassMessage setIdentifier:](v26, "setIdentifier:", v10);
  PKLocalizedCocoonString(CFSTR("DASHBOARD_LOAN_DISPUTE_REVIEW_TITLE"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setTitle:](v26, "setTitle:", v27);

  -[PKDashboardPassMessage setMessage:](v26, "setMessage:", v25);
  PKLocalizedCocoonString(CFSTR("DASHBOARD_LEARN_MORE_BUTTON"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setButtonTitle:](v26, "setButtonTitle:", v28);

  -[PKDashboardPassMessage setShowDisclosure:](v26, "setShowDisclosure:", 1);
  v36 = v25;
  v29 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __70__PKPayLaterDashboardMessageComposer__financingPlanInProgressDisputes__block_invoke_5;
  v42[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v45, &location);
  v30 = v13;
  v43 = v30;
  v31 = v10;
  v44 = v31;
  -[PKDashboardPassMessage setActionOnButtonPress:](v26, "setActionOnButtonPress:", v42);
  v39[0] = v29;
  v39[1] = 3221225472;
  v39[2] = __70__PKPayLaterDashboardMessageComposer__financingPlanInProgressDisputes__block_invoke_6;
  v39[3] = &unk_1E3E61B68;
  objc_copyWeak(&v41, &location);
  v32 = v38;
  v40 = v32;
  -[PKDashboardPassMessage setActionOnDismiss:](v26, "setActionOnDismiss:", v39);
  objc_msgSend(*(id *)(a1 + 40), "_flagImage");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDashboardPassMessage setImage:](v26, "setImage:", v33);

  v34 = *(void **)(a1 + 48);
  v35 = -[PKPayLaterDashboardMessage initWithMessage:priority:date:]([PKPayLaterDashboardMessage alloc], "initWithMessage:priority:date:", v26, 600, 0);
  objc_msgSend(v34, "addObject:", v35);

  objc_destroyWeak(&v41);
  objc_destroyWeak(&v45);

  objc_destroyWeak(&location);
}

uint64_t __70__PKPayLaterDashboardMessageComposer__financingPlanInProgressDisputes__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "paymentIdentifier");
}

uint64_t __70__PKPayLaterDashboardMessageComposer__financingPlanInProgressDisputes__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if (objc_msgSend(v3, "type") == 2)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "paymentIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "containsObject:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __70__PKPayLaterDashboardMessageComposer__financingPlanInProgressDisputes__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_displayDisputeExplanationViewControllerForFinancingPlan:contentType:messageIdentifier:", *(_QWORD *)(a1 + 32), 11, *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

void __70__PKPayLaterDashboardMessageComposer__financingPlanInProgressDisputes__block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateSharedCacheForKey:value:reloadMessages:", *(_QWORD *)(a1 + 32), 1, 1);
    WeakRetained = v3;
  }

}

- (id)_financingPlanEvidenceRequestedDisputes
{
  id v3;
  unint64_t context;
  PKPayLaterFinancingPlan *financingPlan;
  PKPayLaterFinancingPlan *v6;
  PKPayLaterFinancingPlan *v7;
  void *v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PKDashboardPassMessage *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PKPayLaterDashboardMessage *v23;
  void *v24;
  PKPayLaterDashboardMessage *v25;
  void *v26;
  void *v28;
  void (**v29)(void *, PKPayLaterFinancingPlan *);
  id v30;
  id obj;
  id v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  id v38;
  id location;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD aBlock[4];
  id v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PKPayLaterDashboardMessageComposer__financingPlanEvidenceRequestedDisputes__block_invoke;
  aBlock[3] = &unk_1E3E71340;
  v30 = v3;
  v45 = v30;
  v29 = (void (**)(void *, PKPayLaterFinancingPlan *))_Block_copy(aBlock);
  context = self->_context;
  if (context == 1)
  {
    v29[2](v29, self->_financingPlan);
  }
  else if (context == 2)
  {
    financingPlan = self->_financingPlan;
    if (financingPlan)
    {
      v6 = financingPlan;
    }
    else
    {
      -[NSArray firstObject](self->_allFinancingPlans, "firstObject");
      v6 = (PKPayLaterFinancingPlan *)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    -[PKPayLaterFinancingPlan disputes](v6, "disputes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "safelyAddObject:", v9);
  }
  if (objc_msgSend(v30, "count"))
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = v30;
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v34)
    {
      v33 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v41 != v33)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v11, "identifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          PKStringWithValidatedFormat();
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v11, "identifier", v28);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringWithFormat:", CFSTR("PayLaterPlanDisputeEvidenceRequired-Loan-%@"), v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "deadlineDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!PKSharedCacheGetBoolForKey() || self->_isAllContext)
          {
            objc_initWeak(&location, self);
            v17 = objc_alloc_init(PKDashboardPassMessage);
            -[PKDashboardPassMessage setIdentifier:](v17, "setIdentifier:", v15);
            PKLocalizedCocoonString(CFSTR("DASHBOARD_LOAN_DISPUTE_EVIDENCE_REQUIRED_TITLE"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKDashboardPassMessage setTitle:](v17, "setTitle:", v18);

            -[NSDateFormatter stringFromDate:](self->_shortDateFormatter, "stringFromDate:", v16);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            PKLocalizedCocoonString(CFSTR("DASHBOARD_LOAN_DISPUTE_EVIDENCE_REQUIRED_MESSAGE"), CFSTR("%@"), v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKDashboardPassMessage setMessage:](v17, "setMessage:", v20);

            PKLocalizedCocoonString(CFSTR("DASHBOARD_LEARN_MORE_BUTTON"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKDashboardPassMessage setButtonTitle:](v17, "setButtonTitle:", v21);

            -[PKDashboardPassMessage setShowDisclosure:](v17, "setShowDisclosure:", 1);
            v37[0] = MEMORY[0x1E0C809B0];
            v37[1] = 3221225472;
            v37[2] = __77__PKPayLaterDashboardMessageComposer__financingPlanEvidenceRequestedDisputes__block_invoke_2;
            v37[3] = &unk_1E3E61B68;
            objc_copyWeak(&v38, &location);
            v37[4] = v11;
            -[PKDashboardPassMessage setActionOnButtonPress:](v17, "setActionOnButtonPress:", v37);
            v35[0] = MEMORY[0x1E0C809B0];
            v35[1] = 3221225472;
            v35[2] = __77__PKPayLaterDashboardMessageComposer__financingPlanEvidenceRequestedDisputes__block_invoke_3;
            v35[3] = &unk_1E3E61B68;
            objc_copyWeak(&v36, &location);
            v35[4] = v12;
            -[PKDashboardPassMessage setActionOnDismiss:](v17, "setActionOnDismiss:", v35);
            -[PKPayLaterDashboardMessageComposer _flagImage](self, "_flagImage");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKDashboardPassMessage setImage:](v17, "setImage:", v22);

            v23 = [PKPayLaterDashboardMessage alloc];
            objc_msgSend(v11, "lastUpdated");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = -[PKPayLaterDashboardMessage initWithMessage:priority:date:](v23, "initWithMessage:priority:date:", v17, 600, v24);
            objc_msgSend(v32, "addObject:", v25);

            objc_destroyWeak(&v36);
            objc_destroyWeak(&v38);

            objc_destroyWeak(&location);
          }

        }
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v34);
    }

    v26 = (void *)objc_msgSend(v32, "copy");
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

void __77__PKPayLaterDashboardMessageComposer__financingPlanEvidenceRequestedDisputes__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a2, "disputes", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "state") == 2)
          objc_msgSend(*(id *)(a1 + 32), "safelyAddObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

void __77__PKPayLaterDashboardMessageComposer__financingPlanEvidenceRequestedDisputes__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_displayDisputeEvidenceRequiredViewControllerForFinancingPlan:dispute:", WeakRetained[13], *(_QWORD *)(a1 + 32));
    objc_msgSend(v3[4], "updateWalletBadgeCountWithCompletion:", 0);
    WeakRetained = v3;
  }

}

void __77__PKPayLaterDashboardMessageComposer__financingPlanEvidenceRequestedDisputes__block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateSharedCacheForKey:value:reloadMessages:", *(_QWORD *)(a1 + 32), 1, 1);
    objc_msgSend(v3[4], "updateWalletBadgeCountWithCompletion:", 0);
    WeakRetained = v3;
  }

}

- (id)_financingPlanApprovedDisputes
{
  id v2;
  id v3;
  void *v4;
  unint64_t context;
  PKPayLaterFinancingPlan *financingPlan;
  PKPayLaterFinancingPlan *v7;
  void *v8;
  const __CFString *v9;
  PKPayLaterFinancingPlan *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PKPayLaterDashboardMessageComposer *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  PKDashboardPassMessage *v26;
  void *v27;
  PKPayLaterDashboardMessage *v28;
  void *v29;
  PKPayLaterDashboardMessage *v30;
  void *v31;
  id v33;
  void (**v34)(void *, void *);
  id v35;
  id obj;
  id v37;
  uint64_t v38;
  const __CFString *v39;
  const __CFString *v40;
  id v41;
  uint64_t v42;
  void *v43;
  _QWORD v45[5];
  id v46;
  _QWORD v47[5];
  id v48;
  void *v49;
  id v50;
  id location;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[4];
  id v57;
  _QWORD aBlock[4];
  id v59;
  id v60;
  _BYTE v61[128];
  _QWORD v62[4];

  v62[1] = *MEMORY[0x1E0C80C00];
  v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PKPayLaterDashboardMessageComposer__financingPlanApprovedDisputes__block_invoke;
  aBlock[3] = &unk_1E3E713C8;
  v35 = v3;
  v59 = v35;
  v41 = v2;
  v60 = v41;
  v4 = _Block_copy(aBlock);
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __68__PKPayLaterDashboardMessageComposer__financingPlanApprovedDisputes__block_invoke_4;
  v56[3] = &unk_1E3E61828;
  v33 = v4;
  v57 = v33;
  v34 = (void (**)(void *, void *))_Block_copy(v56);
  context = self->_context;
  if (context)
  {
    if (context == 1)
    {
      if (self->_financingPlan)
      {
        v62[0] = self->_financingPlan;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v34[2](v34, v8);

      }
      v40 = CFSTR("PKSharedCachePayLaterDashboardPlanDisputeApproved-Loan-%@");
      v9 = CFSTR("PayLaterPlanDisputeApproved-Loan-%@");
      goto LABEL_13;
    }
    if (context == 2)
    {
      financingPlan = self->_financingPlan;
      if (financingPlan)
      {
        v7 = financingPlan;
      }
      else
      {
        -[NSArray firstObject](self->_allFinancingPlans, "firstObject");
        v7 = (PKPayLaterFinancingPlan *)objc_claimAutoreleasedReturnValue();
      }
      v10 = v7;
      -[PKPayLaterFinancingPlan disputes](v7, "disputes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v35, "safelyAddObject:", v12);
      objc_msgSend(v12, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setObject:forKey:", v10, v13);

    }
  }
  else
  {
    v34[2](v34, self->_allFinancingPlans);
  }
  v40 = CFSTR("PKSharedCachePayLaterDashboardPlanDisputeApproved-FOP-%@");
  v9 = CFSTR("PayLaterPlanDisputeApproved-FOP-%@");
LABEL_13:
  v39 = v9;
  if (!objc_msgSend(v35, "count"))
  {
    v31 = 0;
    goto LABEL_35;
  }
  v54 = 0u;
  v55 = 0u;
  v53 = 0u;
  v52 = 0u;
  obj = v35;
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
  if (!v42)
    goto LABEL_33;
  v38 = *(_QWORD *)v53;
  do
  {
    for (i = 0; i != v42; ++i)
    {
      if (*(_QWORD *)v53 != v38)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
      objc_msgSend(v15, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v40, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v39, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectForKey:", v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!PKSharedCacheGetBoolForKey() || self->_isAllContext)
      {
        v20 = self;
        v21 = self->_context;
        switch(v21)
        {
          case 2uLL:
            goto LABEL_24;
          case 1uLL:
            PKLocalizedCocoonString(CFSTR("DASHBOARD_LOAN_DISPUTE_APPROVED_TITLE"));
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            PKLocalizedCocoonString(CFSTR("DASHBOARD_LOAN_DISPUTE_APPROVED_MESSAGE"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = 0;
LABEL_26:
            v20 = self;
            break;
          case 0uLL:
LABEL_24:
            PKLocalizedCocoonString(CFSTR("DASHBOARD_DISPUTE_APPROVED_TITLE"));
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "merchant");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "displayName");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            PKLocalizedCocoonString(CFSTR("DASHBOARD_DISPUTE_APPROVED_MESSAGE"), CFSTR("%@"), v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            PKLocalizedCocoonString(CFSTR("DASHBOARD_VIEW_PAYMENT_SCHEDULE_BUTTON"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_26;
          default:
            v24 = 0;
            v43 = 0;
            v25 = 0;
            break;
        }
        objc_initWeak(&location, v20);
        v26 = objc_alloc_init(PKDashboardPassMessage);
        -[PKDashboardPassMessage setIdentifier:](v26, "setIdentifier:", v18);
        -[PKDashboardPassMessage setTitle:](v26, "setTitle:", v43);
        -[PKDashboardPassMessage setMessage:](v26, "setMessage:", v24);
        -[PKDashboardPassMessage setButtonTitle:](v26, "setButtonTitle:", v25);
        -[PKDashboardPassMessage setShowDisclosure:](v26, "setShowDisclosure:", v25 != 0);
        if (v25)
        {
          v47[0] = MEMORY[0x1E0C809B0];
          v47[1] = 3221225472;
          v47[2] = __68__PKPayLaterDashboardMessageComposer__financingPlanApprovedDisputes__block_invoke_5;
          v47[3] = &unk_1E3E65CC0;
          objc_copyWeak(&v50, &location);
          v47[4] = self;
          v48 = v19;
          v49 = v17;
          -[PKDashboardPassMessage setActionOnButtonPress:](v26, "setActionOnButtonPress:", v47);

          objc_destroyWeak(&v50);
        }
        v45[0] = MEMORY[0x1E0C809B0];
        v45[1] = 3221225472;
        v45[2] = __68__PKPayLaterDashboardMessageComposer__financingPlanApprovedDisputes__block_invoke_6;
        v45[3] = &unk_1E3E61B68;
        objc_copyWeak(&v46, &location);
        v45[4] = v17;
        -[PKDashboardPassMessage setActionOnDismiss:](v26, "setActionOnDismiss:", v45);
        -[PKPayLaterDashboardMessageComposer _flagImage](self, "_flagImage");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDashboardPassMessage setImage:](v26, "setImage:", v27);

        v28 = [PKPayLaterDashboardMessage alloc];
        objc_msgSend(v15, "lastUpdated");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[PKPayLaterDashboardMessage initWithMessage:priority:date:](v28, "initWithMessage:priority:date:", v26, 600, v29);
        objc_msgSend(v37, "addObject:", v30);

        objc_destroyWeak(&v46);
        objc_destroyWeak(&location);

      }
    }
    v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
  }
  while (v42);
LABEL_33:

  v31 = (void *)objc_msgSend(v37, "copy");
LABEL_35:

  return v31;
}

void __68__PKPayLaterDashboardMessageComposer__financingPlanApprovedDisputes__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "disputes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pk_objectsPassingTest:", &__block_literal_global_260);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_262);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v9, v8);

  }
}

BOOL __68__PKPayLaterDashboardMessageComposer__financingPlanApprovedDisputes__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "state") == 3;
}

uint64_t __68__PKPayLaterDashboardMessageComposer__financingPlanApprovedDisputes__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "lastUpdated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastUpdated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __68__PKPayLaterDashboardMessageComposer__financingPlanApprovedDisputes__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

void __68__PKPayLaterDashboardMessageComposer__financingPlanApprovedDisputes__block_invoke_5(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 1);
    objc_msgSend(v3, "dashboardMessageComposer:requestPresentFinancingPlanDetails:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    objc_msgSend(v4, "_updateSharedCacheForKey:value:reloadMessages:", *(_QWORD *)(a1 + 48), 1, 1);
    WeakRetained = v4;
  }

}

void __68__PKPayLaterDashboardMessageComposer__financingPlanApprovedDisputes__block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateSharedCacheForKey:value:reloadMessages:", *(_QWORD *)(a1 + 32), 1, 1);
    WeakRetained = v3;
  }

}

- (id)_financingPlanSplitDisputes
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t context;
  PKPayLaterFinancingPlan *financingPlan;
  PKPayLaterFinancingPlan *v11;
  PKPayLaterFinancingPlan *v12;
  void *v13;
  void *v14;
  PKPayLaterDashboardMessageComposer *v15;
  void (**v16)(void *, void *, uint64_t, void *, void *);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  id v30;
  id v31;
  id v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[5];
  id v39;
  _QWORD aBlock[4];
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__PKPayLaterDashboardMessageComposer__financingPlanSplitDisputes__block_invoke;
  aBlock[3] = &unk_1E3E71340;
  v6 = v4;
  v41 = v6;
  v7 = _Block_copy(aBlock);
  v8 = v7;
  context = self->_context;
  if (context == 1)
  {
    (*((void (**)(void *, PKPayLaterFinancingPlan *))v7 + 2))(v7, self->_financingPlan);
  }
  else if (context == 2)
  {
    financingPlan = self->_financingPlan;
    if (financingPlan)
    {
      v11 = financingPlan;
    }
    else
    {
      -[NSArray firstObject](self->_allFinancingPlans, "firstObject");
      v11 = (PKPayLaterFinancingPlan *)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;
    -[PKPayLaterFinancingPlan disputes](v11, "disputes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "safelyAddObject:", v14);
  }
  if (!objc_msgSend(v6, "count"))
  {
    v27 = 0;
    goto LABEL_24;
  }
  v38[0] = v5;
  v38[1] = 3221225472;
  v38[2] = __65__PKPayLaterDashboardMessageComposer__financingPlanSplitDisputes__block_invoke_2;
  v38[3] = &unk_1E3E71578;
  v15 = self;
  v38[4] = self;
  v32 = v3;
  v30 = v3;
  v39 = v30;
  v16 = (void (**)(void *, void *, uint64_t, void *, void *))_Block_copy(v38);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v31 = v6;
  obj = v6;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (!v17)
    goto LABEL_22;
  v18 = v17;
  v19 = *(_QWORD *)v35;
  do
  {
    for (i = 0; i != v18; ++i)
    {
      if (*(_QWORD *)v35 != v19)
        objc_enumerationMutation(obj);
      v21 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
      objc_msgSend(v21, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      PKStringWithValidatedFormat();
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v21, "identifier", v29);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("PayLaterPlanDisputeSplit-Loan-%@"), v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (PKSharedCacheGetBoolForKey())
      {
        if (v15->_isAllContext)
          goto LABEL_18;
      }
      else
      {
        if (v15->_isAllContext)
        {
LABEL_18:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v25, CFSTR("bnpl"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v16[2](v16, v21, 1, v22, v26);

          goto LABEL_20;
        }
        v16[2](v16, v21, -[PKPayLaterFinancingPlan productType](v15->_financingPlan, "productType"), v22, v25);
      }
LABEL_20:

    }
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  }
  while (v18);
LABEL_22:

  v27 = (void *)objc_msgSend(v30, "copy");
  v6 = v31;
  v3 = v32;
LABEL_24:

  return v27;
}

void __65__PKPayLaterDashboardMessageComposer__financingPlanSplitDisputes__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a2, "disputes", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "state") == 5)
          objc_msgSend(*(id *)(a1 + 32), "safelyAddObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

void __65__PKPayLaterDashboardMessageComposer__financingPlanSplitDisputes__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  PKDashboardPassMessage *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  PKPayLaterDashboardMessage *v40;
  void *v41;
  PKPayLaterDashboardMessage *v42;
  void *v43;
  NSString *p_isa;
  id v45;
  void *v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id location;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;

  v9 = a2;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (a3)
  {
    v46 = v10;
    v13 = v11;
    if (a3 == 1)
      v14 = CFSTR("DASHBOARD_LOAN_DISPUTE_SPLIT_BNPL_MESSAGE");
    else
      v14 = 0;
    v15 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v9, "appliedPayments");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pk_arrayByApplyingBlock:", &__block_literal_global_274_0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "scheduleSummary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "payments");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __65__PKPayLaterDashboardMessageComposer__financingPlanSplitDisputes__block_invoke_4;
    v54[3] = &unk_1E3E62610;
    v22 = v18;
    v55 = v22;
    objc_msgSend(v20, "pk_firstObjectPassingTest:", v54);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "scheduleSummary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "payments");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v21;
    v52[1] = 3221225472;
    v52[2] = __65__PKPayLaterDashboardMessageComposer__financingPlanSplitDisputes__block_invoke_5;
    v52[3] = &unk_1E3E62610;
    v45 = v22;
    v53 = v45;
    objc_msgSend(v24, "pk_firstObjectPassingTest:", v52);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, *(id *)(a1 + 32));
    v26 = objc_alloc_init(PKDashboardPassMessage);
    v12 = v13;
    -[PKDashboardPassMessage setIdentifier:](v26, "setIdentifier:", v13);
    PKLocalizedCocoonString(CFSTR("DASHBOARD_LOAN_DISPUTE_SPLIT_TITLE"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardPassMessage setTitle:](v26, "setTitle:", v27);

    if (v47 && v25)
    {
      v43 = v13;
      p_isa = &v14->isa;
      objc_msgSend(v25, "amount");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "amount");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "pk_absoluteValue");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "amount");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "currency");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      PKCurrencyAmountMake();
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v47, "amount");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "formattedStringValue");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "formattedStringValue");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedCocoonString(p_isa, CFSTR("%@%@"), v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardPassMessage setMessage:](v26, "setMessage:", v37);

      v12 = v43;
    }
    else
    {
      PKLocalizedCocoonString(CFSTR("DASHBOARD_LOAN_DISPUTE_SPLIT_FALLBACK_MESSAGE"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardPassMessage setMessage:](v26, "setMessage:", v33);
    }

    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __65__PKPayLaterDashboardMessageComposer__financingPlanSplitDisputes__block_invoke_6;
    v48[3] = &unk_1E3E61B68;
    objc_copyWeak(&v50, &location);
    v10 = v46;
    v49 = v46;
    -[PKDashboardPassMessage setActionOnDismiss:](v26, "setActionOnDismiss:", v48);
    objc_msgSend(*(id *)(a1 + 32), "_flagImage");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardPassMessage setImage:](v26, "setImage:", v38);

    v39 = *(void **)(a1 + 40);
    v40 = [PKPayLaterDashboardMessage alloc];
    objc_msgSend(v9, "lastUpdated");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = -[PKPayLaterDashboardMessage initWithMessage:priority:date:](v40, "initWithMessage:priority:date:", v26, 600, v41);
    objc_msgSend(v39, "addObject:", v42);

    objc_destroyWeak(&v50);
    objc_destroyWeak(&location);

  }
}

uint64_t __65__PKPayLaterDashboardMessageComposer__financingPlanSplitDisputes__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "paymentIdentifier");
}

uint64_t __65__PKPayLaterDashboardMessageComposer__financingPlanSplitDisputes__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if (objc_msgSend(v3, "type") == 2)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "paymentIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "containsObject:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __65__PKPayLaterDashboardMessageComposer__financingPlanSplitDisputes__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if (objc_msgSend(v3, "type") == 4)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "paymentIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "containsObject:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __65__PKPayLaterDashboardMessageComposer__financingPlanSplitDisputes__block_invoke_6(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateSharedCacheForKey:value:reloadMessages:", *(_QWORD *)(a1 + 32), 1, 1);
    objc_msgSend(v3[4], "updateWalletBadgeCountWithCompletion:", 0);
    WeakRetained = v3;
  }

}

- (id)_financingPlanRejectedDisputes
{
  id v2;
  uint64_t v3;
  PKPayLaterDashboardMessageComposer *v4;
  unint64_t context;
  PKPayLaterFinancingPlan *financingPlan;
  PKPayLaterFinancingPlan *v7;
  PKPayLaterFinancingPlan *v8;
  void *v9;
  void *v10;
  void (**v11)(void *, void *, uint64_t, void *, void *);
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void (**v24)(void *, PKPayLaterFinancingPlan *);
  id v25;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[6];
  _QWORD aBlock[4];
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__35;
  v39 = __Block_byref_object_dispose__35;
  v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PKPayLaterDashboardMessageComposer__financingPlanRejectedDisputes__block_invoke;
  aBlock[3] = &unk_1E3E71340;
  v25 = v2;
  v34 = v25;
  v24 = (void (**)(void *, PKPayLaterFinancingPlan *))_Block_copy(aBlock);
  v4 = self;
  context = self->_context;
  if (context == 1)
  {
    v24[2](v24, self->_financingPlan);
  }
  else if (context == 2)
  {
    financingPlan = self->_financingPlan;
    if (financingPlan)
    {
      v7 = financingPlan;
    }
    else
    {
      -[NSArray firstObject](self->_allFinancingPlans, "firstObject");
      v7 = (PKPayLaterFinancingPlan *)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;
    -[PKPayLaterFinancingPlan disputes](v7, "disputes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "safelyAddObject:", v10);
    v4 = self;
  }
  if (!objc_msgSend(v25, "count"))
  {
    v21 = 0;
    goto LABEL_24;
  }
  v32[0] = v3;
  v32[1] = 3221225472;
  v32[2] = __68__PKPayLaterDashboardMessageComposer__financingPlanRejectedDisputes__block_invoke_2;
  v32[3] = &unk_1E3E715C0;
  v32[4] = v4;
  v32[5] = &v35;
  v11 = (void (**)(void *, void *, uint64_t, void *, void *))_Block_copy(v32);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v25;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
  if (!v12)
    goto LABEL_22;
  v13 = *(_QWORD *)v29;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v29 != v13)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
      objc_msgSend(v15, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      PKStringWithValidatedFormat();
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v15, "identifier", v23);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("PayLaterPlanDisputeRejected-Loan-%@"), v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (PKSharedCacheGetBoolForKey())
      {
        if (self->_isAllContext)
          goto LABEL_18;
      }
      else
      {
        if (self->_isAllContext)
        {
LABEL_18:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v19, CFSTR("bnpl"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v11[2](v11, v15, 1, v16, v20);

          goto LABEL_20;
        }
        v11[2](v11, v15, -[PKPayLaterFinancingPlan productType](self->_financingPlan, "productType"), v16, v19);
      }
LABEL_20:

    }
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
  }
  while (v12);
LABEL_22:

  v21 = (void *)objc_msgSend((id)v36[5], "copy");
LABEL_24:

  _Block_object_dispose(&v35, 8);
  return v21;
}

void __68__PKPayLaterDashboardMessageComposer__financingPlanRejectedDisputes__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a2, "disputes", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "state") == 4)
          objc_msgSend(*(id *)(a1 + 32), "safelyAddObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

void __68__PKPayLaterDashboardMessageComposer__financingPlanRejectedDisputes__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  PKDashboardPassMessage *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  PKPayLaterDashboardMessage *v28;
  void *v29;
  PKPayLaterDashboardMessage *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id location;
  _QWORD v35[4];
  id v36;

  v9 = a2;
  v10 = a4;
  v11 = a5;
  if (a3)
  {
    if (a3 == 1)
      v12 = CFSTR("DASHBOARD_LOAN_DISPUTE_REJECTED_BNPL_MESSAGE");
    else
      v12 = 0;
    v13 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v9, "appliedPayments");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pk_arrayByApplyingBlock:", &__block_literal_global_281_0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "scheduleSummary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "payments");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __68__PKPayLaterDashboardMessageComposer__financingPlanRejectedDisputes__block_invoke_4;
    v35[3] = &unk_1E3E62610;
    v19 = v16;
    v36 = v19;
    objc_msgSend(v18, "pk_firstObjectPassingTest:", v35);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, *(id *)(a1 + 32));
    v21 = objc_alloc_init(PKDashboardPassMessage);
    -[PKDashboardPassMessage setIdentifier:](v21, "setIdentifier:", v11);
    PKLocalizedCocoonString(CFSTR("DASHBOARD_LOAN_DISPUTE_REJECTED_TITLE"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardPassMessage setTitle:](v21, "setTitle:", v22);

    objc_msgSend(v20, "amount");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "formattedStringValue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedCocoonString(&v12->isa, CFSTR("%@"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardPassMessage setMessage:](v21, "setMessage:", v25);

    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __68__PKPayLaterDashboardMessageComposer__financingPlanRejectedDisputes__block_invoke_5;
    v31[3] = &unk_1E3E61B68;
    objc_copyWeak(&v33, &location);
    v32 = v10;
    -[PKDashboardPassMessage setActionOnDismiss:](v21, "setActionOnDismiss:", v31);
    objc_msgSend(*(id *)(a1 + 32), "_flagImage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardPassMessage setImage:](v21, "setImage:", v26);

    v27 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v28 = [PKPayLaterDashboardMessage alloc];
    objc_msgSend(v9, "lastUpdated");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[PKPayLaterDashboardMessage initWithMessage:priority:date:](v28, "initWithMessage:priority:date:", v21, 600, v29);
    objc_msgSend(v27, "addObject:", v30);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);

  }
}

uint64_t __68__PKPayLaterDashboardMessageComposer__financingPlanRejectedDisputes__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "paymentIdentifier");
}

uint64_t __68__PKPayLaterDashboardMessageComposer__financingPlanRejectedDisputes__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if (objc_msgSend(v3, "type") == 2)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "paymentIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "containsObject:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __68__PKPayLaterDashboardMessageComposer__financingPlanRejectedDisputes__block_invoke_5(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateSharedCacheForKey:value:reloadMessages:", *(_QWORD *)(a1 + 32), 1, 1);
    objc_msgSend(v3[4], "updateWalletBadgeCountWithCompletion:", 0);
    WeakRetained = v3;
  }

}

- (id)_financingPlanWithdrawnDisputes
{
  id v3;
  unint64_t context;
  PKPayLaterFinancingPlan *financingPlan;
  PKPayLaterFinancingPlan *v6;
  PKPayLaterFinancingPlan *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PKDashboardPassMessage *v20;
  void *v21;
  void *v22;
  void *v23;
  PKPayLaterDashboardMessage *v24;
  void *v25;
  PKPayLaterDashboardMessage *v26;
  void *v27;
  void (**v29)(void *, PKPayLaterFinancingPlan *);
  id v30;
  id obj;
  id v32;
  _QWORD v33[5];
  id v34;
  id location;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD aBlock[4];
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PKPayLaterDashboardMessageComposer__financingPlanWithdrawnDisputes__block_invoke;
  aBlock[3] = &unk_1E3E71340;
  v30 = v3;
  v41 = v30;
  v29 = (void (**)(void *, PKPayLaterFinancingPlan *))_Block_copy(aBlock);
  context = self->_context;
  if (context == 1)
  {
    v29[2](v29, self->_financingPlan);
  }
  else if (context == 2)
  {
    financingPlan = self->_financingPlan;
    if (financingPlan)
    {
      v6 = financingPlan;
    }
    else
    {
      -[NSArray firstObject](self->_allFinancingPlans, "firstObject");
      v6 = (PKPayLaterFinancingPlan *)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    -[PKPayLaterFinancingPlan disputes](v6, "disputes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "safelyAddObject:", v9);
  }
  if (objc_msgSend(v30, "count"))
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = v30;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v37 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          v14 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v13, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "stringWithFormat:", CFSTR("PKSharedCachePayLaterDashboardPlanDisputeWithdrawn-Loan-%@"), v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v13, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringWithFormat:", CFSTR("PayLaterPlanDisputeWithdrawn-Loan-%@"), v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (!PKSharedCacheGetBoolForKey() || self->_isAllContext)
          {
            objc_initWeak(&location, self);
            v20 = objc_alloc_init(PKDashboardPassMessage);
            -[PKDashboardPassMessage setIdentifier:](v20, "setIdentifier:", v19);
            PKLocalizedCocoonString(CFSTR("DASHBOARD_LOAN_DISPUTE_WITHDRAWN_TITLE"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKDashboardPassMessage setTitle:](v20, "setTitle:", v21);

            PKLocalizedCocoonString(CFSTR("DASHBOARD_LOAN_DISPUTE_WITHDRAWN_MESSAGE"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKDashboardPassMessage setMessage:](v20, "setMessage:", v22);

            v33[0] = MEMORY[0x1E0C809B0];
            v33[1] = 3221225472;
            v33[2] = __69__PKPayLaterDashboardMessageComposer__financingPlanWithdrawnDisputes__block_invoke_2;
            v33[3] = &unk_1E3E61B68;
            objc_copyWeak(&v34, &location);
            v33[4] = v16;
            -[PKDashboardPassMessage setActionOnDismiss:](v20, "setActionOnDismiss:", v33);
            -[PKPayLaterDashboardMessageComposer _flagImage](self, "_flagImage");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKDashboardPassMessage setImage:](v20, "setImage:", v23);

            v24 = [PKPayLaterDashboardMessage alloc];
            objc_msgSend(v13, "lastUpdated");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = -[PKPayLaterDashboardMessage initWithMessage:priority:date:](v24, "initWithMessage:priority:date:", v20, 600, v25);
            objc_msgSend(v32, "addObject:", v26);

            objc_destroyWeak(&v34);
            objc_destroyWeak(&location);
          }

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v10);
    }

    v27 = (void *)objc_msgSend(v32, "copy");
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

void __69__PKPayLaterDashboardMessageComposer__financingPlanWithdrawnDisputes__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a2, "disputes", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "state") == 6)
          objc_msgSend(*(id *)(a1 + 32), "safelyAddObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

void __69__PKPayLaterDashboardMessageComposer__financingPlanWithdrawnDisputes__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateSharedCacheForKey:value:reloadMessages:", *(_QWORD *)(a1 + 32), 1, 1);
    WeakRetained = v3;
  }

}

- (id)_financingPlanUnresolvedDisputeState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t context;
  PKPayLaterFinancingPlan *financingPlan;
  PKDashboardPassMessage *v11;
  void *v12;
  void *v13;
  void *v14;
  PKPayLaterDashboardMessage *v15;
  _QWORD v17[5];
  id v18;
  id location;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PKPayLaterFinancingPlan planIdentifier](self->_financingPlan, "planIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PKSharedCachePayLaterDashboardPlanUnresolvedDisputeStatePrefix-Loan-%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  -[PKPayLaterFinancingPlan planIdentifier](self->_financingPlan, "planIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("PayLaterPlanUnresolvedDisputeStatePrefix-Loan-%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  context = self->_context;
  if ((context == 2
     || context == 1
     && (financingPlan = self->_financingPlan) != 0
     && -[PKPayLaterFinancingPlan stateReason](financingPlan, "stateReason") == 6)
    && (!PKSharedCacheGetBoolForKey() || self->_isAllContext))
  {
    objc_initWeak(&location, self);
    v11 = objc_alloc_init(PKDashboardPassMessage);
    -[PKDashboardPassMessage setIdentifier:](v11, "setIdentifier:", v8);
    PKLocalizedCocoonString(CFSTR("DASHBOARD_LOAN_UNRESOLVED_DISPUTE_STATE_TITLE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardPassMessage setTitle:](v11, "setTitle:", v12);

    PKLocalizedCocoonString(CFSTR("DASHBOARD_LOAN_UNRESOLVED_DISPUTE_STATE_MESSAGE"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardPassMessage setMessage:](v11, "setMessage:", v13);

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __74__PKPayLaterDashboardMessageComposer__financingPlanUnresolvedDisputeState__block_invoke;
    v17[3] = &unk_1E3E61B68;
    objc_copyWeak(&v18, &location);
    v17[4] = v5;
    -[PKDashboardPassMessage setActionOnDismiss:](v11, "setActionOnDismiss:", v17);
    -[PKPayLaterDashboardMessageComposer _warningImage](self, "_warningImage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDashboardPassMessage setImage:](v11, "setImage:", v14);

    v15 = -[PKPayLaterDashboardMessage initWithMessage:priority:date:]([PKPayLaterDashboardMessage alloc], "initWithMessage:priority:date:", v11, 600, 0);
    objc_destroyWeak(&v18);

    objc_destroyWeak(&location);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __74__PKPayLaterDashboardMessageComposer__financingPlanUnresolvedDisputeState__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateSharedCacheForKey:value:reloadMessages:", *(_QWORD *)(a1 + 32), 1, 1);
    WeakRetained = v3;
  }

}

- (id)_financingPlanRefundIssued
{
  id v3;
  void *v4;
  unint64_t context;
  PKPayLaterFinancingPlan *financingPlan;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PKDashboardPassMessage *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSDateFormatter *shortDateFormatter;
  void *v31;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  PKPayLaterDashboardMessage *v38;
  void *v39;
  PKPayLaterDashboardMessage *v40;
  void *v41;
  id obj;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  PKPayLaterDashboardMessageComposer *val;
  _QWORD v54[5];
  id v55;
  _QWORD v56[7];
  id v57;
  id location;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v50 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = v3;
  context = self->_context;
  if (context)
  {
    if (context == 1)
    {
      financingPlan = self->_financingPlan;
    }
    else
    {
      if (context != 2)
        goto LABEL_9;
      financingPlan = self->_financingPlan;
      if (!financingPlan)
      {
        -[NSArray firstObject](self->_allFinancingPlans, "firstObject");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "safelyAddObject:", v7);

        goto LABEL_9;
      }
    }
    objc_msgSend(v3, "safelyAddObject:", financingPlan);
  }
  else
  {
    objc_msgSend(v3, "addObjectsFromArray:", self->_allFinancingPlans);
  }
LABEL_9:
  val = self;
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = v4;
  v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
  if (v45)
  {
    v44 = *(_QWORD *)v64;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v64 != v44)
        {
          v9 = v8;
          objc_enumerationMutation(obj);
          v8 = v9;
        }
        v46 = v8;
        v49 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v8);
        v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v11 = val->_context;
        if (v11 < 2)
        {
          objc_msgSend(v49, "refundPaymentsNotAssociatedWithDispute");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObjectsFromArray:", v12);
LABEL_18:

          goto LABEL_19;
        }
        if (v11 == 2)
        {
          objc_msgSend(v49, "scheduleSummary");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "payments");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "firstObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v14);

          goto LABEL_18;
        }
LABEL_19:
        objc_msgSend(v49, "merchant");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "displayName");
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        v61 = 0u;
        v62 = 0u;
        v60 = 0u;
        v59 = 0u;
        v48 = v10;
        v52 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
        if (!v52)
          goto LABEL_44;
        v51 = *(_QWORD *)v60;
        do
        {
          for (i = 0; i != v52; ++i)
          {
            if (*(_QWORD *)v60 != v51)
              objc_enumerationMutation(v48);
            v17 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
            v18 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v17, "paymentIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "stringWithFormat:", CFSTR("PKSharedCachePayLaterDashboardRefundPaymentPrefix-FOP-Loan-%@"), v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            v21 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v17, "paymentIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "stringWithFormat:", CFSTR("PayLaterRefundPaymentPrefix-FOP-Loan-%@"), v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (!PKSharedCacheGetBoolForKey() || val->_isAllContext)
            {
              objc_initWeak(&location, val);
              v24 = objc_alloc_init(PKDashboardPassMessage);
              -[PKDashboardPassMessage setIdentifier:](v24, "setIdentifier:", v23);
              v25 = objc_msgSend(v17, "subtype");
              if (v25 >= 5)
              {
                v26 = 0;
              }
              else
              {
                PKLocalizedCocoonString(&off_1E3E71620[v25]->isa);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
              }
              -[PKDashboardPassMessage setTitle:](v24, "setTitle:", v26);
              objc_msgSend(v17, "amount");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "absoluteValue");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "formattedStringValue");
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              shortDateFormatter = val->_shortDateFormatter;
              objc_msgSend(v17, "postedDate");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSDateFormatter stringFromDate:](shortDateFormatter, "stringFromDate:", v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              v33 = val->_context;
              if (v33)
              {
                if (v33 == 1)
                {
                  +[PKPayLaterFinancingPlanPaymentScheduleComposer detailTextForPayment:financingPlan:](PKPayLaterFinancingPlanPaymentScheduleComposer, "detailTextForPayment:financingPlan:", v17, v49);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  if (v33 == 2)
                    goto LABEL_32;
                  v35 = 0;
                }
              }
              else
              {
LABEL_32:
                v34 = objc_msgSend(v17, "subtype");
                if (v34 > 4)
                {
                  v35 = 0;
                }
                else
                {
                  PKLocalizedCocoonString(&off_1E3E71648[v34]->isa, CFSTR("%1$@%2$@%3$@"), v47, v29, v32);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                }
                PKLocalizedCocoonString(CFSTR("DASHBOARD_VIEW_PAYMENT_SCHEDULE_BUTTON"));
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                -[PKDashboardPassMessage setButtonTitle:](v24, "setButtonTitle:", v36);

                -[PKDashboardPassMessage setShowDisclosure:](v24, "setShowDisclosure:", 1);
                v56[0] = MEMORY[0x1E0C809B0];
                v56[1] = 3221225472;
                v56[2] = __64__PKPayLaterDashboardMessageComposer__financingPlanRefundIssued__block_invoke;
                v56[3] = &unk_1E3E65CC0;
                objc_copyWeak(&v57, &location);
                v56[4] = val;
                v56[5] = v49;
                v56[6] = v20;
                -[PKDashboardPassMessage setActionOnButtonPress:](v24, "setActionOnButtonPress:", v56);
                objc_destroyWeak(&v57);
              }
              -[PKDashboardPassMessage setMessage:](v24, "setMessage:", v35);
              v54[0] = MEMORY[0x1E0C809B0];
              v54[1] = 3221225472;
              v54[2] = __64__PKPayLaterDashboardMessageComposer__financingPlanRefundIssued__block_invoke_2;
              v54[3] = &unk_1E3E61B68;
              objc_copyWeak(&v55, &location);
              v54[4] = v20;
              -[PKDashboardPassMessage setActionOnDismiss:](v24, "setActionOnDismiss:", v54);
              if (objc_msgSend(v17, "subtype") == 1)
                -[PKPayLaterDashboardMessageComposer _pencilImage](val, "_pencilImage");
              else
                -[PKPayLaterDashboardMessageComposer _uturnImage](val, "_uturnImage");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKDashboardPassMessage setImage:](v24, "setImage:", v37);

              v38 = [PKPayLaterDashboardMessage alloc];
              objc_msgSend(v17, "postedDate");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = -[PKPayLaterDashboardMessage initWithMessage:priority:date:](v38, "initWithMessage:priority:date:", v24, 600, v39);
              objc_msgSend(v50, "addObject:", v40);

              objc_destroyWeak(&v55);
              objc_destroyWeak(&location);
            }

          }
          v52 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
        }
        while (v52);
LABEL_44:

        v8 = v46 + 1;
      }
      while (v46 + 1 != v45);
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
    }
    while (v45);
  }

  v41 = (void *)objc_msgSend(v50, "copy");
  return v41;
}

void __64__PKPayLaterDashboardMessageComposer__financingPlanRefundIssued__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 1);
    objc_msgSend(v3, "dashboardMessageComposer:requestPresentFinancingPlanDetails:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    objc_msgSend(v4, "_updateSharedCacheForKey:value:reloadMessages:", *(_QWORD *)(a1 + 48), 1, 1);
    WeakRetained = v4;
  }

}

void __64__PKPayLaterDashboardMessageComposer__financingPlanRefundIssued__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateSharedCacheForKey:value:reloadMessages:", *(_QWORD *)(a1 + 32), 1, 1);
    WeakRetained = v3;
  }

}

- (id)_financingPlanRefundRevoked
{
  id v3;
  void *v4;
  unint64_t context;
  PKPayLaterFinancingPlan *financingPlan;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  PKDashboardPassMessage *v25;
  void *v26;
  void *v27;
  void *v28;
  PKPayLaterDashboardMessage *v29;
  void *v30;
  PKPayLaterDashboardMessage *v31;
  void *v32;
  id obj;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  _QWORD v41[5];
  id v42;
  id location;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = v3;
  context = self->_context;
  if (context)
  {
    if (context == 1)
    {
      financingPlan = self->_financingPlan;
    }
    else
    {
      if (context != 2)
        goto LABEL_9;
      financingPlan = self->_financingPlan;
      if (!financingPlan)
      {
        -[NSArray firstObject](self->_allFinancingPlans, "firstObject");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "safelyAddObject:", v7);

        goto LABEL_9;
      }
    }
    objc_msgSend(v3, "safelyAddObject:", financingPlan);
  }
  else
  {
    objc_msgSend(v3, "addObjectsFromArray:", self->_allFinancingPlans);
  }
LABEL_9:
  v50 = 0u;
  v51 = 0u;
  v49 = 0u;
  v48 = 0u;
  obj = v4;
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v36)
  {
    v35 = *(_QWORD *)v49;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v49 != v35)
        {
          v9 = v8;
          objc_enumerationMutation(obj);
          v8 = v9;
        }
        v37 = v8;
        v38 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v8);
        v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v11 = self->_context;
        if (v11 >= 2)
        {
          if (v11 != 2)
            goto LABEL_19;
          objc_msgSend(v38, "scheduleSummary");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "payments");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "firstObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v14);
        }
        else
        {
          objc_msgSend(v38, "scheduleSummary");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "payments");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "pk_objectsPassingTest:", &__block_literal_global_304);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObjectsFromArray:", v14);
        }

LABEL_19:
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v39 = v10;
        v15 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        if (v15)
        {
          v16 = *(_QWORD *)v45;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v45 != v16)
                objc_enumerationMutation(v39);
              v18 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
              v19 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v18, "paymentIdentifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "stringWithFormat:", CFSTR("PKSharedCachePayLaterDashboardRefundRevokedPaymentPrefix-FOP-Loan-%@"), v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              v22 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v18, "paymentIdentifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "stringWithFormat:", CFSTR("PayLaterRefundRevokedPaymentPrefix-FOP-Loan-%@"), v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              if (!PKSharedCacheGetBoolForKey() || self->_isAllContext)
              {
                objc_initWeak(&location, self);
                v25 = objc_alloc_init(PKDashboardPassMessage);
                -[PKDashboardPassMessage setIdentifier:](v25, "setIdentifier:", v24);
                PKLocalizedCocoonString(CFSTR("DASHBOARD_REFUND_REVOKED_TITLE"));
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                -[PKDashboardPassMessage setTitle:](v25, "setTitle:", v26);

                if (self->_context >= 3)
                {
                  v27 = 0;
                }
                else
                {
                  +[PKPayLaterFinancingPlanPaymentScheduleComposer detailTextForPayment:financingPlan:](PKPayLaterFinancingPlanPaymentScheduleComposer, "detailTextForPayment:financingPlan:", v18, v38);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                }
                -[PKDashboardPassMessage setMessage:](v25, "setMessage:", v27);
                v41[0] = MEMORY[0x1E0C809B0];
                v41[1] = 3221225472;
                v41[2] = __65__PKPayLaterDashboardMessageComposer__financingPlanRefundRevoked__block_invoke_2;
                v41[3] = &unk_1E3E61B68;
                objc_copyWeak(&v42, &location);
                v41[4] = v21;
                -[PKDashboardPassMessage setActionOnDismiss:](v25, "setActionOnDismiss:", v41);
                -[PKPayLaterDashboardMessageComposer _reverseImage](self, "_reverseImage");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                -[PKDashboardPassMessage setImage:](v25, "setImage:", v28);

                v29 = [PKPayLaterDashboardMessage alloc];
                objc_msgSend(v18, "postedDate");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = -[PKPayLaterDashboardMessage initWithMessage:priority:date:](v29, "initWithMessage:priority:date:", v25, 600, v30);
                objc_msgSend(v40, "addObject:", v31);

                objc_destroyWeak(&v42);
                objc_destroyWeak(&location);
              }

            }
            v15 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
          }
          while (v15);
        }

        v8 = v37 + 1;
      }
      while (v37 + 1 != v36);
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v36);
  }

  v32 = (void *)objc_msgSend(v40, "copy");
  return v32;
}

BOOL __65__PKPayLaterDashboardMessageComposer__financingPlanRefundRevoked__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 6;
}

void __65__PKPayLaterDashboardMessageComposer__financingPlanRefundRevoked__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateSharedCacheForKey:value:reloadMessages:", *(_QWORD *)(a1 + 32), 1, 1);
    WeakRetained = v3;
  }

}

- (id)_financingPlanAdjustments
{
  id v3;
  void *v4;
  unint64_t context;
  PKPayLaterFinancingPlan *financingPlan;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PKDashboardPassMessage *v24;
  unint64_t v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSDateFormatter *shortDateFormatter;
  void *v32;
  void *v33;
  unint64_t v34;
  unint64_t v35;
  __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  PKPayLaterDashboardMessage *v40;
  void *v41;
  PKPayLaterDashboardMessage *v42;
  uint64_t v43;
  void *v44;
  id obj;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  PKPayLaterDashboardMessageComposer *val;
  _QWORD v57[5];
  id v58;
  _QWORD v59[7];
  id v60;
  id location;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v53 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = v3;
  context = self->_context;
  if (context)
  {
    if (context == 1)
    {
      financingPlan = self->_financingPlan;
    }
    else
    {
      if (context != 2)
        goto LABEL_9;
      financingPlan = self->_financingPlan;
      if (!financingPlan)
      {
        -[NSArray firstObject](self->_allFinancingPlans, "firstObject");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "safelyAddObject:", v7);

        goto LABEL_9;
      }
    }
    objc_msgSend(v3, "safelyAddObject:", financingPlan);
  }
  else
  {
    objc_msgSend(v3, "addObjectsFromArray:", self->_allFinancingPlans);
  }
LABEL_9:
  val = self;
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  obj = v4;
  v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
  if (v48)
  {
    v47 = *(_QWORD *)v67;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v67 != v47)
        {
          v9 = v8;
          objc_enumerationMutation(obj);
          v8 = v9;
        }
        v49 = v8;
        v51 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v8);
        v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v11 = val->_context;
        if (v11 < 2)
        {
          objc_msgSend(v51, "scheduleSummary");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "paymentsOfType:", 7);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObjectsFromArray:", v13);
LABEL_18:

          goto LABEL_19;
        }
        if (v11 == 2)
        {
          objc_msgSend(v51, "scheduleSummary");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "payments");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "firstObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v14);

          goto LABEL_18;
        }
LABEL_19:
        objc_msgSend(v51, "merchant");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "displayName");
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        v64 = 0u;
        v65 = 0u;
        v63 = 0u;
        v62 = 0u;
        v52 = v10;
        v55 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
        if (!v55)
          goto LABEL_52;
        v54 = *(_QWORD *)v63;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v63 != v54)
              objc_enumerationMutation(v52);
            v17 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v16);
            v18 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v17, "paymentIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "stringWithFormat:", CFSTR("PKSharedCachePayLaterDashboardAdjustmentPaymentPrefix-FOP-Loan-%@"), v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            v21 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v17, "paymentIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "stringWithFormat:", CFSTR("PayLaterAdjustmentPaymentPrefix-FOP-Loan-%@"), v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (!PKSharedCacheGetBoolForKey() || val->_isAllContext)
            {
              objc_initWeak(&location, val);
              v24 = objc_alloc_init(PKDashboardPassMessage);
              -[PKDashboardPassMessage setIdentifier:](v24, "setIdentifier:", v23);
              v25 = objc_msgSend(v17, "subtype");
              if (v25 < 2)
              {
                v26 = CFSTR("DASHBOARD_LOAN_REDUCED_TITLE");
                if (val->_isAllContext)
                {
LABEL_31:
                  PKLocalizedCocoonString(&v26->isa);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  goto LABEL_32;
                }
                goto LABEL_47;
              }
              v26 = CFSTR("DASHBOARD_LOAN_REDUCED_TITLE");
              if (v25 - 2 < 2)
                goto LABEL_31;
              if (v25 == 4)
              {
                v26 = CFSTR("DASHBOARD_LOAN_INCREASED_TITLE");
                goto LABEL_31;
              }
              v27 = 0;
LABEL_32:
              -[PKDashboardPassMessage setTitle:](v24, "setTitle:", v27);
              objc_msgSend(v17, "amount");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "absoluteValue");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "formattedStringValue");
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              shortDateFormatter = val->_shortDateFormatter;
              objc_msgSend(v17, "postedDate");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSDateFormatter stringFromDate:](shortDateFormatter, "stringFromDate:", v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              v34 = val->_context;
              if (v34)
              {
                if (v34 == 1)
                {
                  +[PKPayLaterFinancingPlanPaymentScheduleComposer detailTextForPayment:financingPlan:](PKPayLaterFinancingPlanPaymentScheduleComposer, "detailTextForPayment:financingPlan:", v17, v51);
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  if (v34 == 2)
                    goto LABEL_35;
                  v37 = 0;
                }
LABEL_45:
                -[PKDashboardPassMessage setMessage:](v24, "setMessage:", v37);
                v57[0] = MEMORY[0x1E0C809B0];
                v57[1] = 3221225472;
                v57[2] = __63__PKPayLaterDashboardMessageComposer__financingPlanAdjustments__block_invoke_2;
                v57[3] = &unk_1E3E61B68;
                objc_copyWeak(&v58, &location);
                v57[4] = v20;
                -[PKDashboardPassMessage setActionOnDismiss:](v24, "setActionOnDismiss:", v57);
                -[PKPayLaterDashboardMessageComposer _pencilImage](val, "_pencilImage");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                -[PKDashboardPassMessage setImage:](v24, "setImage:", v39);

                v40 = [PKPayLaterDashboardMessage alloc];
                objc_msgSend(v17, "postedDate");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v42 = -[PKPayLaterDashboardMessage initWithMessage:priority:date:](v40, "initWithMessage:priority:date:", v24, 600, v41);
                objc_msgSend(v53, "addObject:", v42);

                objc_destroyWeak(&v58);
LABEL_46:

LABEL_47:
                objc_destroyWeak(&location);
                goto LABEL_48;
              }
LABEL_35:
              v35 = objc_msgSend(v17, "subtype");
              if (v35 < 2)
              {
                v36 = CFSTR("DASHBOARD_LOAN_REDUCED_MESSAGE_FOP");
                if (!val->_isAllContext)
                  goto LABEL_46;
LABEL_43:
                PKLocalizedCocoonString(&v36->isa, CFSTR("%1$@%2$@%3$@"), v50, v30, v33);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v36 = CFSTR("DASHBOARD_LOAN_REDUCED_MESSAGE_FOP");
                if (v35 - 2 < 2)
                  goto LABEL_43;
                if (v35 == 4)
                {
                  v36 = CFSTR("DASHBOARD_LOAN_INCREASED_MESSAGE_FOP");
                  goto LABEL_43;
                }
                v37 = 0;
              }
              PKLocalizedCocoonString(CFSTR("DASHBOARD_VIEW_PAYMENT_SCHEDULE_BUTTON"));
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKDashboardPassMessage setButtonTitle:](v24, "setButtonTitle:", v38);

              -[PKDashboardPassMessage setShowDisclosure:](v24, "setShowDisclosure:", 1);
              v59[0] = MEMORY[0x1E0C809B0];
              v59[1] = 3221225472;
              v59[2] = __63__PKPayLaterDashboardMessageComposer__financingPlanAdjustments__block_invoke;
              v59[3] = &unk_1E3E65CC0;
              objc_copyWeak(&v60, &location);
              v59[4] = val;
              v59[5] = v51;
              v59[6] = v20;
              -[PKDashboardPassMessage setActionOnButtonPress:](v24, "setActionOnButtonPress:", v59);
              objc_destroyWeak(&v60);
              goto LABEL_45;
            }
LABEL_48:

            ++v16;
          }
          while (v55 != v16);
          v43 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
          v55 = v43;
        }
        while (v43);
LABEL_52:

        v8 = v49 + 1;
      }
      while (v49 + 1 != v48);
      v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
    }
    while (v48);
  }

  v44 = (void *)objc_msgSend(v53, "copy");
  return v44;
}

void __63__PKPayLaterDashboardMessageComposer__financingPlanAdjustments__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 1);
    objc_msgSend(v3, "dashboardMessageComposer:requestPresentFinancingPlanDetails:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    objc_msgSend(v4, "_updateSharedCacheForKey:value:reloadMessages:", *(_QWORD *)(a1 + 48), 1, 1);
    WeakRetained = v4;
  }

}

void __63__PKPayLaterDashboardMessageComposer__financingPlanAdjustments__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateSharedCacheForKey:value:reloadMessages:", *(_QWORD *)(a1 + 32), 1, 1);
    WeakRetained = v3;
  }

}

- (id)_financingPlanOutstandingCredit
{
  id v3;
  void *v4;
  unint64_t context;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PKDashboardPassMessage *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PKPayLaterDashboardMessage *v21;
  void *v22;
  id v24;
  void (**v25)(void *, NSArray *);
  id v26;
  id obj;
  id v28;
  uint64_t v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  id v33;
  id location;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  id v40;
  _QWORD aBlock[4];
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PKPayLaterDashboardMessageComposer__financingPlanOutstandingCredit__block_invoke;
  aBlock[3] = &unk_1E3E71340;
  v26 = v3;
  v42 = v26;
  v4 = _Block_copy(aBlock);
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __69__PKPayLaterDashboardMessageComposer__financingPlanOutstandingCredit__block_invoke_2;
  v39[3] = &unk_1E3E61828;
  v24 = v4;
  v40 = v24;
  v25 = (void (**)(void *, NSArray *))_Block_copy(v39);
  context = self->_context;
  if (context)
  {
    if (context == 1)
    {
      (*((void (**)(id, PKPayLaterFinancingPlan *))v24 + 2))(v24, self->_financingPlan);
    }
    else if (context == 2)
    {
      if (self->_financingPlan)
      {
        objc_msgSend(v26, "safelyAddObject:");
      }
      else
      {
        -[NSArray firstObject](self->_allFinancingPlans, "firstObject");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "safelyAddObject:", v6);

      }
    }
  }
  else
  {
    v25[2](v25, self->_allFinancingPlans);
  }
  if (objc_msgSend(v26, "count"))
  {
    v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = v26;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v7)
    {
      v29 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v36 != v29)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          v10 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v9, "planIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stringWithFormat:", CFSTR("PKSharedCachePayLaterDashboardPlanOutstandingCreditPrefix-FOP-Loan-%@"), v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v9, "planIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringWithFormat:", CFSTR("PayLaterPlanOutstandingCreditPrefix-FOP-Loan-%@"), v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!PKSharedCacheGetBoolForKey() || self->_isAllContext)
          {
            objc_initWeak(&location, self);
            v16 = objc_alloc_init(PKDashboardPassMessage);
            -[PKDashboardPassMessage setIdentifier:](v16, "setIdentifier:", v15);
            PKLocalizedCocoonString(CFSTR("DASHBOARD_LOAN_OUTSTANDING_CREDIT_TITLE"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKDashboardPassMessage setTitle:](v16, "setTitle:", v17);

            PKLocalizedCocoonString(CFSTR("DASHBOARD_LOAN_OUTSTANDING_CREDIT_MESSAGE"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKDashboardPassMessage setMessage:](v16, "setMessage:", v18);

            PKLocalizedCocoonString(CFSTR("DASHBOARD_CHAT_WITH_SPECIALIST_BUTTON"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKDashboardPassMessage setButtonTitle:](v16, "setButtonTitle:", v19);

            -[PKDashboardPassMessage setShowDisclosure:](v16, "setShowDisclosure:", 1);
            v32[0] = MEMORY[0x1E0C809B0];
            v32[1] = 3221225472;
            v32[2] = __69__PKPayLaterDashboardMessageComposer__financingPlanOutstandingCredit__block_invoke_3;
            v32[3] = &unk_1E3E61B68;
            objc_copyWeak(&v33, &location);
            v32[4] = v12;
            -[PKDashboardPassMessage setActionOnButtonPress:](v16, "setActionOnButtonPress:", v32);
            v30[0] = MEMORY[0x1E0C809B0];
            v30[1] = 3221225472;
            v30[2] = __69__PKPayLaterDashboardMessageComposer__financingPlanOutstandingCredit__block_invoke_4;
            v30[3] = &unk_1E3E61B68;
            objc_copyWeak(&v31, &location);
            v30[4] = v12;
            -[PKDashboardPassMessage setActionOnDismiss:](v16, "setActionOnDismiss:", v30);
            -[PKPayLaterDashboardMessageComposer _reverseImage](self, "_reverseImage");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKDashboardPassMessage setImage:](v16, "setImage:", v20);

            v21 = -[PKPayLaterDashboardMessage initWithMessage:priority:date:]([PKPayLaterDashboardMessage alloc], "initWithMessage:priority:date:", v16, 400, 0);
            objc_msgSend(v28, "addObject:", v21);

            objc_destroyWeak(&v31);
            objc_destroyWeak(&v33);

            objc_destroyWeak(&location);
          }

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v7);
    }

    v22 = (void *)objc_msgSend(v28, "copy");
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

void __69__PKPayLaterDashboardMessageComposer__financingPlanOutstandingCredit__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "stateReason") == 4)
    objc_msgSend(*(id *)(a1 + 32), "safelyAddObject:", v3);

}

void __69__PKPayLaterDashboardMessageComposer__financingPlanOutstandingCredit__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

void __69__PKPayLaterDashboardMessageComposer__financingPlanOutstandingCredit__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_presentBusinessChatForApplePayLaterAccountWithTopicType:", 16);
    objc_msgSend(v3, "_updateSharedCacheForKey:value:reloadMessages:", *(_QWORD *)(a1 + 32), 1, 1);
    WeakRetained = v3;
  }

}

void __69__PKPayLaterDashboardMessageComposer__financingPlanOutstandingCredit__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateSharedCacheForKey:value:reloadMessages:", *(_QWORD *)(a1 + 32), 1, 1);
    WeakRetained = v3;
  }

}

- (id)_financingPlanCanceled
{
  id v2;
  void *v3;
  unint64_t context;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PKDashboardPassMessage *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PKPayLaterDashboardMessage *v19;
  void *v20;
  void *v22;
  id v23;
  void (**v24)(void *, NSArray *);
  id v25;
  id obj;
  id v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v31[5];
  id v32;
  _QWORD v33[6];
  id v34;
  id location;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  _QWORD aBlock[4];
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__PKPayLaterDashboardMessageComposer__financingPlanCanceled__block_invoke;
  aBlock[3] = &unk_1E3E71340;
  v25 = v2;
  v43 = v25;
  v3 = _Block_copy(aBlock);
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __60__PKPayLaterDashboardMessageComposer__financingPlanCanceled__block_invoke_2;
  v40[3] = &unk_1E3E61828;
  v23 = v3;
  v41 = v23;
  v24 = (void (**)(void *, NSArray *))_Block_copy(v40);
  context = self->_context;
  if (context)
  {
    if (context == 1)
    {
      (*((void (**)(id, PKPayLaterFinancingPlan *))v23 + 2))(v23, self->_financingPlan);
    }
    else if (context == 2)
    {
      if (self->_financingPlan)
      {
        objc_msgSend(v25, "safelyAddObject:");
      }
      else
      {
        -[NSArray firstObject](self->_allFinancingPlans, "firstObject");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "safelyAddObject:", v5);

      }
    }
  }
  else
  {
    v24[2](v24, self->_allFinancingPlans);
  }
  if (objc_msgSend(v25, "count"))
  {
    v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = v25;
    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v29)
    {
      v28 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v37 != v28)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v7, "planIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          PKStringWithValidatedFormat();
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          v9 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v7, "planIdentifier", v22);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "stringWithFormat:", CFSTR("PayLaterPlanCanceledPrefix-FOP-Loan-%@"), v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (!PKSharedCacheGetBoolForKey() || self->_isAllContext)
          {
            objc_initWeak(&location, self);
            v12 = objc_alloc_init(PKDashboardPassMessage);
            -[PKDashboardPassMessage setIdentifier:](v12, "setIdentifier:", v11);
            PKLocalizedCocoonString(CFSTR("DASHBOARD_LOAN_CANCELED_TITLE"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKDashboardPassMessage setTitle:](v12, "setTitle:", v13);

            objc_msgSend(v7, "merchant");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "displayName");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            PKLocalizedCocoonString(CFSTR("DASHBOARD_LOAN_CANCELED_MESSAGE"), CFSTR("%@"), v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKDashboardPassMessage setMessage:](v12, "setMessage:", v16);

            PKLocalizedCocoonString(CFSTR("DASHBOARD_CHAT_WITH_SPECIALIST_BUTTON"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKDashboardPassMessage setButtonTitle:](v12, "setButtonTitle:", v17);

            -[PKDashboardPassMessage setShowDisclosure:](v12, "setShowDisclosure:", 1);
            v33[0] = MEMORY[0x1E0C809B0];
            v33[1] = 3221225472;
            v33[2] = __60__PKPayLaterDashboardMessageComposer__financingPlanCanceled__block_invoke_3;
            v33[3] = &unk_1E3E61EE8;
            objc_copyWeak(&v34, &location);
            v33[4] = v7;
            v33[5] = v8;
            -[PKDashboardPassMessage setActionOnButtonPress:](v12, "setActionOnButtonPress:", v33);
            v31[0] = MEMORY[0x1E0C809B0];
            v31[1] = 3221225472;
            v31[2] = __60__PKPayLaterDashboardMessageComposer__financingPlanCanceled__block_invoke_4;
            v31[3] = &unk_1E3E61B68;
            objc_copyWeak(&v32, &location);
            v31[4] = v8;
            -[PKDashboardPassMessage setActionOnDismiss:](v12, "setActionOnDismiss:", v31);
            -[PKPayLaterDashboardMessageComposer _warningImage](self, "_warningImage");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKDashboardPassMessage setImage:](v12, "setImage:", v18);

            v19 = -[PKPayLaterDashboardMessage initWithMessage:priority:date:]([PKPayLaterDashboardMessage alloc], "initWithMessage:priority:date:", v12, 400, 0);
            objc_msgSend(v27, "addObject:", v19);

            objc_destroyWeak(&v32);
            objc_destroyWeak(&v34);

            objc_destroyWeak(&location);
          }

        }
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v29);
    }

    v20 = (void *)objc_msgSend(v27, "copy");
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

void __60__PKPayLaterDashboardMessageComposer__financingPlanCanceled__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "state") == 5)
    objc_msgSend(*(id *)(a1 + 32), "safelyAddObject:", v3);

}

void __60__PKPayLaterDashboardMessageComposer__financingPlanCanceled__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

void __60__PKPayLaterDashboardMessageComposer__financingPlanCanceled__block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_presentBusinessChatForFinancingPlan:topicType:", *(_QWORD *)(a1 + 32), 2);
    objc_msgSend(v3, "_updateSharedCacheForKey:value:reloadMessages:", *(_QWORD *)(a1 + 40), 1, 1);
    objc_msgSend(v3[4], "updateWalletBadgeCountWithCompletion:", 0);
    WeakRetained = v3;
  }

}

void __60__PKPayLaterDashboardMessageComposer__financingPlanCanceled__block_invoke_4(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateSharedCacheForKey:value:reloadMessages:", *(_QWORD *)(a1 + 32), 1, 1);
    objc_msgSend(v3[4], "updateWalletBadgeCountWithCompletion:", 0);
    WeakRetained = v3;
  }

}

- (id)_financingPlanChargedOff
{
  id v2;
  void *v3;
  unint64_t context;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PKDashboardPassMessage *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PKPayLaterDashboardMessage *v21;
  void *v22;
  id v24;
  void (**v25)(void *, NSArray *);
  id v26;
  id obj;
  id v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v32[5];
  id v33;
  _QWORD v34[6];
  id v35;
  id location;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  _QWORD aBlock[4];
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PKPayLaterDashboardMessageComposer__financingPlanChargedOff__block_invoke;
  aBlock[3] = &unk_1E3E71340;
  v26 = v2;
  v44 = v26;
  v3 = _Block_copy(aBlock);
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __62__PKPayLaterDashboardMessageComposer__financingPlanChargedOff__block_invoke_2;
  v41[3] = &unk_1E3E61828;
  v24 = v3;
  v42 = v24;
  v25 = (void (**)(void *, NSArray *))_Block_copy(v41);
  context = self->_context;
  if (context)
  {
    if (context == 1)
    {
      (*((void (**)(id, PKPayLaterFinancingPlan *))v24 + 2))(v24, self->_financingPlan);
    }
    else if (context == 2)
    {
      if (self->_financingPlan)
      {
        objc_msgSend(v26, "safelyAddObject:");
      }
      else
      {
        -[NSArray firstObject](self->_allFinancingPlans, "firstObject");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "safelyAddObject:", v5);

      }
    }
  }
  else
  {
    v25[2](v25, self->_allFinancingPlans);
  }
  if (objc_msgSend(v26, "count"))
  {
    v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = v26;
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v30)
    {
      v29 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v38 != v29)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          v8 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v7, "planIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "stringWithFormat:", CFSTR("PKSharedCachePayLaterDashboardPlanChargedOffPrefix-FOP-Loan-%@"), v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v7, "planIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringWithFormat:", CFSTR("PayLaterPlanChargedOffPrefix-FOP-Loan-%@"), v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!PKSharedCacheGetBoolForKey() || self->_isAllContext)
          {
            objc_initWeak(&location, self);
            v14 = objc_alloc_init(PKDashboardPassMessage);
            -[PKDashboardPassMessage setIdentifier:](v14, "setIdentifier:", v13);
            PKLocalizedCocoonString(CFSTR("DASHBOARD_LOAN_CHARGED_OFF_TITLE"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKDashboardPassMessage setTitle:](v14, "setTitle:", v15);

            objc_msgSend(v7, "merchant");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "displayName");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            PKLocalizedCocoonString(CFSTR("DASHBOARD_LOAN_CHARGED_OFF_MESSAGE"), CFSTR("%@"), v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKDashboardPassMessage setMessage:](v14, "setMessage:", v18);

            PKLocalizedCocoonString(CFSTR("DASHBOARD_CHAT_WITH_SPECIALIST_BUTTON"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKDashboardPassMessage setButtonTitle:](v14, "setButtonTitle:", v19);

            -[PKDashboardPassMessage setShowDisclosure:](v14, "setShowDisclosure:", 1);
            v34[0] = MEMORY[0x1E0C809B0];
            v34[1] = 3221225472;
            v34[2] = __62__PKPayLaterDashboardMessageComposer__financingPlanChargedOff__block_invoke_3;
            v34[3] = &unk_1E3E61EE8;
            objc_copyWeak(&v35, &location);
            v34[4] = v7;
            v34[5] = v10;
            -[PKDashboardPassMessage setActionOnButtonPress:](v14, "setActionOnButtonPress:", v34);
            v32[0] = MEMORY[0x1E0C809B0];
            v32[1] = 3221225472;
            v32[2] = __62__PKPayLaterDashboardMessageComposer__financingPlanChargedOff__block_invoke_4;
            v32[3] = &unk_1E3E61B68;
            objc_copyWeak(&v33, &location);
            v32[4] = v10;
            -[PKDashboardPassMessage setActionOnDismiss:](v14, "setActionOnDismiss:", v32);
            -[PKPayLaterDashboardMessageComposer _warningImage](self, "_warningImage");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKDashboardPassMessage setImage:](v14, "setImage:", v20);

            v21 = -[PKPayLaterDashboardMessage initWithMessage:priority:date:]([PKPayLaterDashboardMessage alloc], "initWithMessage:priority:date:", v14, 400, 0);
            objc_msgSend(v28, "addObject:", v21);

            objc_destroyWeak(&v33);
            objc_destroyWeak(&v35);

            objc_destroyWeak(&location);
          }

        }
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v30);
    }

    v22 = (void *)objc_msgSend(v28, "copy");
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

void __62__PKPayLaterDashboardMessageComposer__financingPlanChargedOff__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "stateReason") == 5)
    objc_msgSend(*(id *)(a1 + 32), "safelyAddObject:", v3);

}

void __62__PKPayLaterDashboardMessageComposer__financingPlanChargedOff__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

void __62__PKPayLaterDashboardMessageComposer__financingPlanChargedOff__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_presentBusinessChatForFinancingPlan:topicType:", *(_QWORD *)(a1 + 32), 3);
    objc_msgSend(v3, "_updateSharedCacheForKey:value:reloadMessages:", *(_QWORD *)(a1 + 40), 1, 1);
    WeakRetained = v3;
  }

}

void __62__PKPayLaterDashboardMessageComposer__financingPlanChargedOff__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateSharedCacheForKey:value:reloadMessages:", *(_QWORD *)(a1 + 32), 1, 1);
    WeakRetained = v3;
  }

}

- (id)_financingPlanProActiveCancellation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t context;
  uint64_t v12;
  PKPayLaterDashboardMessage *v13;
  void *v14;
  double v15;
  double v16;
  PKDashboardPassMessage *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v24[5];
  id v25;
  _QWORD v26[4];
  id v27;
  id location;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PKPayLaterFinancingPlan planIdentifier](self->_financingPlan, "planIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PKSharedCachePayLaterDashboardProActiveCancellationPrefix-Loan-%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  -[PKPayLaterFinancingPlan planIdentifier](self->_financingPlan, "planIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("PayLaterProActiveCancellationPrefix-Loan-%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPayLaterFinancingPlan planSummary](self->_financingPlan, "planSummary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transactionDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  context = self->_context;
  if (context == 2)
  {
LABEL_7:
    if (!PKSharedCacheGetBoolForKey() || self->_isAllContext)
    {
      objc_initWeak(&location, self);
      v17 = objc_alloc_init(PKDashboardPassMessage);
      -[PKDashboardPassMessage setIdentifier:](v17, "setIdentifier:", v8);
      PKLocalizedCocoonString(CFSTR("DASHBOARD_LOAN_PRO_ACTIVE_CANCELLATION_TITLE"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardPassMessage setTitle:](v17, "setTitle:", v18);

      PKLocalizedCocoonString(CFSTR("DASHBOARD_LOAN_PRO_ACTIVE_CANCELLATION_MESSAGE"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardPassMessage setMessage:](v17, "setMessage:", v19);

      PKLocalizedCocoonString(CFSTR("DASHBOARD_CHAT_WITH_SPECIALIST_BUTTON"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardPassMessage setButtonTitle:](v17, "setButtonTitle:", v20);

      -[PKDashboardPassMessage setShowDisclosure:](v17, "setShowDisclosure:", 1);
      v21 = MEMORY[0x1E0C809B0];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __73__PKPayLaterDashboardMessageComposer__financingPlanProActiveCancellation__block_invoke;
      v26[3] = &unk_1E3E61310;
      objc_copyWeak(&v27, &location);
      -[PKDashboardPassMessage setActionOnButtonPress:](v17, "setActionOnButtonPress:", v26);
      v24[0] = v21;
      v24[1] = 3221225472;
      v24[2] = __73__PKPayLaterDashboardMessageComposer__financingPlanProActiveCancellation__block_invoke_2;
      v24[3] = &unk_1E3E61B68;
      objc_copyWeak(&v25, &location);
      v24[4] = v5;
      -[PKDashboardPassMessage setActionOnDismiss:](v17, "setActionOnDismiss:", v24);
      -[PKPayLaterDashboardMessageComposer _warningImage](self, "_warningImage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKDashboardPassMessage setImage:](v17, "setImage:", v22);

      v13 = -[PKPayLaterDashboardMessage initWithMessage:priority:date:]([PKPayLaterDashboardMessage alloc], "initWithMessage:priority:date:", v17, 600, 0);
      objc_destroyWeak(&v25);
      objc_destroyWeak(&v27);

      objc_destroyWeak(&location);
      goto LABEL_11;
    }
LABEL_10:
    v13 = 0;
    goto LABEL_11;
  }
  if (context != 1)
    goto LABEL_10;
  v12 = -[PKPayLaterFinancingPlan state](self->_financingPlan, "state");
  v13 = 0;
  if (self->_financingPlan && v12 == 2 && v10)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", v10);
    v16 = v15;

    if (v16 <= 259200.0)
      goto LABEL_10;
    goto LABEL_7;
  }
LABEL_11:

  return v13;
}

void __73__PKPayLaterDashboardMessageComposer__financingPlanProActiveCancellation__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_presentBusinessChatForFinancingPlan:topicType:", WeakRetained[13], 1);
    WeakRetained = v2;
  }

}

void __73__PKPayLaterDashboardMessageComposer__financingPlanProActiveCancellation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateSharedCacheForKey:value:reloadMessages:", *(_QWORD *)(a1 + 32), 1, 1);
    WeakRetained = v3;
  }

}

- (void)_updateSharedCacheForKey:(id)a3 value:(BOOL)a4 reloadMessages:(BOOL)a5
{
  _BOOL4 v5;
  id WeakRetained;

  if (!self->_isAllContext)
  {
    v5 = a5;
    PKSharedCacheSetBoolForKey();
    if (v5)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "reloadMessages");

    }
  }
}

- (id)_systemImageWithName:(id)a3 tintColor:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0DC3870];
  v6 = a4;
  objc_msgSend(v5, "systemImageNamed:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithTintColor:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "imageWithRenderingMode:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_warningImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  PKPayLaterWarningColor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationWithPaletteColors:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("exclamationmark.triangle.fill"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_pencilImage
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterDashboardMessageComposer _systemImageWithName:tintColor:](self, "_systemImageWithName:tintColor:", CFSTR("pencil"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_reverseImage
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterDashboardMessageComposer _systemImageWithName:tintColor:](self, "_systemImageWithName:tintColor:", CFSTR("arrow.turn.up.right"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_uturnImage
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterDashboardMessageComposer _systemImageWithName:tintColor:](self, "_systemImageWithName:tintColor:", CFSTR("arrow.uturn.right"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)resetPayLaterDashboardCache
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  PKSharedCacheGetKeysWithKeyPrefix();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        PKSharedCacheSetBoolForKey();
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  objc_msgSend(MEMORY[0x1E0D668E8], "sharedInstance", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateWalletBadgeCountWithCompletion:", 0);

}

- (void)_displayDisputeExplanationViewControllerForFinancingPlan:(id)a3 contentType:(unint64_t)a4 messageIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0D669B8]);
  -[PKAccount accountIdentifier](self->_payLaterAccount, "accountIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccountIdentifier:", v11);

  -[PKAccount accountBaseURL](self->_payLaterAccount, "accountBaseURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBaseURL:", v12);

  objc_msgSend(v10, "setType:", a4);
  -[PKPayLaterDashboardMessageComposer _showSpinnerForDashboardMessageIdentifier:showSpinner:](self, "_showSpinnerForDashboardMessageIdentifier:showSpinner:", v9, 1);
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __125__PKPayLaterDashboardMessageComposer__displayDisputeExplanationViewControllerForFinancingPlan_contentType_messageIdentifier___block_invoke;
  v16[3] = &unk_1E3E6BBC8;
  objc_copyWeak(&v19, &location);
  v14 = v8;
  v17 = v14;
  v15 = v9;
  v18 = v15;
  objc_msgSend(v13, "accountPayLaterContentWithRequest:completion:", v10, v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __125__PKPayLaterDashboardMessageComposer__displayDisputeExplanationViewControllerForFinancingPlan_contentType_messageIdentifier___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __125__PKPayLaterDashboardMessageComposer__displayDisputeExplanationViewControllerForFinancingPlan_contentType_messageIdentifier___block_invoke_2;
  v5[3] = &unk_1E3E65CC0;
  objc_copyWeak(&v9, a1 + 6);
  v6 = v3;
  v7 = a1[4];
  v8 = a1[5];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v9);
}

void __125__PKPayLaterDashboardMessageComposer__displayDisputeExplanationViewControllerForFinancingPlan_contentType_messageIdentifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  PKPayLaterDisputeExplanationViewController *v5;
  PKNavigationController *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "dynamicContent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dynamicContentPageForPageType:", 14);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = -[PKPayLaterDisputeExplanationViewController initWithFinancingPlan:dispute:payLaterAccount:payLaterPass:layout:dynamicContentPage:]([PKPayLaterDisputeExplanationViewController alloc], "initWithFinancingPlan:dispute:payLaterAccount:payLaterPass:layout:dynamicContentPage:", *(_QWORD *)(a1 + 40), 0, *((_QWORD *)WeakRetained + 12), *((_QWORD *)WeakRetained + 3), 0, v4);
      v6 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v5);
      v7 = objc_loadWeakRetained((id *)WeakRetained + 1);
      objc_msgSend(v7, "dashboardMessageComposer:requestPresentViewController:", WeakRetained, v6);

    }
    else
    {
      PKLogFacilityTypeGetObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_19D178000, v8, OS_LOG_TYPE_DEFAULT, "There is no dynamic content page for PKPayLaterDynamicContentPageTypeDashboardDispute, opening business chat instead", v10, 2u);
      }

      PKAccountDisplayableError();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (PKPayLaterDisputeExplanationViewController *)PKAlertForDisplayableErrorWithHandlers(v9, 0, 0, 0);

      if (!v5)
        goto LABEL_9;
      v6 = (PKNavigationController *)objc_loadWeakRetained((id *)WeakRetained + 1);
      -[PKNavigationController dashboardMessageComposer:requestPresentViewController:](v6, "dashboardMessageComposer:requestPresentViewController:", WeakRetained, v5);
    }

LABEL_9:
    objc_msgSend(WeakRetained, "_showSpinnerForDashboardMessageIdentifier:showSpinner:", *(_QWORD *)(a1 + 48), 0);

  }
}

- (void)_displayDisputeEvidenceRequiredViewControllerForFinancingPlan:(id)a3 dispute:(id)a4
{
  id v6;
  id v7;
  PKNavigationController *v8;
  id WeakRetained;
  PKPayLaterDisputeExplanationViewController *v10;

  v6 = a4;
  v7 = a3;
  v10 = -[PKPayLaterDisputeExplanationViewController initWithFinancingPlan:dispute:payLaterAccount:payLaterPass:layout:dynamicContentPage:]([PKPayLaterDisputeExplanationViewController alloc], "initWithFinancingPlan:dispute:payLaterAccount:payLaterPass:layout:dynamicContentPage:", v7, v6, self->_payLaterAccount, self->_payLaterPass, 1, 0);

  v8 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v10);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "dashboardMessageComposer:requestPresentViewController:", self, v8);

}

- (void)_showSpinnerForDashboardMessageIdentifier:(id)a3 showSpinner:(BOOL)a4
{
  _BOOL4 v4;
  int v6;
  id WeakRetained;
  id v8;

  v4 = a4;
  v8 = a3;
  v6 = -[NSMutableSet containsObject:](self->_dashboardMessagesThatNeedSpinners, "containsObject:");
  if (v4 && (v6 & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_dashboardMessagesThatNeedSpinners, "addObject:", v8);
LABEL_7:
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "reloadMessages");

    goto LABEL_8;
  }
  if (!v4 && ((v6 ^ 1) & 1) == 0)
  {
    -[NSMutableSet removeObject:](self->_dashboardMessagesThatNeedSpinners, "removeObject:", v8);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)_presentBusinessChatForApplePayLaterAccountWithTopicType:(unint64_t)a3
{
  PKBusinessChatPayLaterContext *v4;
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D66FD8]), "initWithContext:topicType:", 1, a3);
  v4 = -[PKBusinessChatPayLaterContext initWithPayLaterAccount:paymentPass:topic:financingPlan:installment:payment:dispute:]([PKBusinessChatPayLaterContext alloc], "initWithPayLaterAccount:paymentPass:topic:financingPlan:installment:payment:dispute:", self->_payLaterAccount, self->_payLaterPass, v5, 0, 0, 0, 0);
  -[PKPayLaterDashboardMessageComposer _presentBusinessChatWithContext:](self, "_presentBusinessChatWithContext:", v4);

}

- (void)_presentBusinessChatForFinancingPlan:(id)a3 topicType:(unint64_t)a4
{
  objc_class *v6;
  id v7;
  PKBusinessChatPayLaterContext *v8;
  id v9;

  v6 = (objc_class *)MEMORY[0x1E0D66FD8];
  v7 = a3;
  v9 = (id)objc_msgSend([v6 alloc], "initWithContext:topicType:", 2, a4);
  v8 = -[PKBusinessChatPayLaterContext initWithPayLaterAccount:paymentPass:topic:financingPlan:installment:payment:dispute:]([PKBusinessChatPayLaterContext alloc], "initWithPayLaterAccount:paymentPass:topic:financingPlan:installment:payment:dispute:", self->_payLaterAccount, self->_payLaterPass, v9, v7, 0, 0, 0);

  -[PKPayLaterDashboardMessageComposer _presentBusinessChatWithContext:](self, "_presentBusinessChatWithContext:", v8);
}

- (void)_presentBusinessChatWithContext:(id)a3
{
  id v4;
  PKBusinessChatController *v5;
  PKBusinessChatController *businessChatController;
  PKBusinessChatController *v7;
  _QWORD v8[5];
  id v9;
  id location;

  v4 = a3;
  if (!self->_businessChatController)
  {
    v5 = objc_alloc_init(PKBusinessChatController);
    businessChatController = self->_businessChatController;
    self->_businessChatController = v5;

  }
  objc_initWeak(&location, self);
  v7 = self->_businessChatController;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__PKPayLaterDashboardMessageComposer__presentBusinessChatWithContext___block_invoke;
  v8[3] = &unk_1E3E65360;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  -[PKBusinessChatController openBusinessChatWithContext:completion:](v7, "openBusinessChatWithContext:completion:", v4, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __70__PKPayLaterDashboardMessageComposer__presentBusinessChatWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__PKPayLaterDashboardMessageComposer__presentBusinessChatWithContext___block_invoke_2;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
}

void __70__PKPayLaterDashboardMessageComposer__presentBusinessChatWithContext___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id v4;
  id v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && *(_QWORD *)(a1 + 32))
  {
    v6 = WeakRetained;
    PKAccountDisplayableError();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);

    if (v4)
    {
      v5 = objc_loadWeakRetained(v6 + 1);
      objc_msgSend(v5, "dashboardMessageComposer:requestPresentViewController:", *(_QWORD *)(a1 + 40), v4);

    }
    WeakRetained = v6;
  }

}

- (PKAccount)payLaterAccount
{
  return self->_payLaterAccount;
}

- (void)setPayLaterAccount:(id)a3
{
  objc_storeStrong((id *)&self->_payLaterAccount, a3);
}

- (PKPayLaterFinancingPlan)financingPlan
{
  return self->_financingPlan;
}

- (void)setFinancingPlan:(id)a3
{
  objc_storeStrong((id *)&self->_financingPlan, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_financingPlan, 0);
  objc_storeStrong((id *)&self->_payLaterAccount, 0);
  objc_storeStrong((id *)&self->_businessChatController, 0);
  objc_storeStrong((id *)&self->_dashboardMessagesThatNeedSpinners, 0);
  objc_storeStrong((id *)&self->_shortDateFormatter, 0);
  objc_storeStrong((id *)&self->_allFinancingPlans, 0);
  objc_storeStrong((id *)&self->_paymentIntentController, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_payLaterPass, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
