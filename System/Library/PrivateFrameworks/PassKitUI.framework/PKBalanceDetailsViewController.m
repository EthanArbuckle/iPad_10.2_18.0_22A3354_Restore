@implementation PKBalanceDetailsViewController

- (PKBalanceDetailsViewController)initWithBalance:(id)a3 forPass:(id)a4 balanceReminder:(id)a5 balanceName:(id)a6 currencyCode:(id)a7 associatedAction:(id)a8 paymentDataProvider:(id)a9 webService:(id)a10 style:(int64_t)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  PKBalanceDetailsViewController *v22;
  PKBalanceDetailsViewController *v23;
  void *v24;
  void *v25;
  PKBalanceDetailsViewController *v26;
  NSObject *v27;
  id v29;
  id v30;
  objc_super v31;
  uint8_t buf[16];

  v17 = a3;
  v30 = a4;
  v18 = a5;
  v29 = a7;
  v19 = a8;
  v20 = a9;
  v21 = objc_msgSend(v19, "type");
  if ((!v19 || v21 == 1 || v21 == 6) && self->_shouldShowReminderSettings)
  {
    v31.receiver = self;
    v31.super_class = (Class)PKBalanceDetailsViewController;
    v22 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v31, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E0DC3D48], "pkui_groupedStyleWithRoundedCorners:", a11 != 1), 2);
    v23 = v22;
    if (v22)
    {
      objc_storeStrong((id *)&v22->_currentBalance, a3);
      objc_storeStrong((id *)&v23->_pass, a4);
      objc_storeStrong((id *)&v23->_action, a8);
      objc_storeStrong((id *)&v23->_paymentDataProvider, a9);
      v23->_style = a11;
      objc_storeStrong((id *)&v23->_currencyCode, a7);
      -[PKBalanceDetailsViewController _initializeReminderAmounts:](v23, "_initializeReminderAmounts:", v18);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[PKPaymentDataProvider addDelegate:](v23->_paymentDataProvider, "addDelegate:", v23);
      -[PKBalanceDetailsViewController navigationItem](v23, "navigationItem", v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "pkui_setupScrollEdgeChromelessAppearance");
      objc_msgSend(v24, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
      PKLocalizedPaymentString(CFSTR("BALANCE_DETAIL_BALANCE_CELL_TITLE"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setTitle:", v25);

    }
    self = v23;
    v26 = self;
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v27, OS_LOG_TYPE_DEFAULT, "Got invalid action type", buf, 2u);
    }

    v26 = 0;
  }

  return v26;
}

- (PKBalanceDetailsViewController)initWithTransitPassProperties:(id)a3 forPass:(id)a4 balanceReminder:(id)a5 associatedAction:(id)a6 paymentDataProvider:(id)a7 webService:(id)a8 style:(int64_t)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  NSString *v22;
  NSDecimalNumber *v23;
  void *v24;
  void *v25;
  PKBalanceDetailsViewController *v26;
  id v28;

  v28 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  PKLocalizedPaymentString(CFSTR("LOW_BALANCE_REMINDER_SETUP_CELL_TITLE"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "balanceAmount");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "currency");
  v22 = (NSString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "balance");
  v23 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();

  PKCurrencyAmountCreate(v23, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "formattedStringValue");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  self->_shouldShowReminderSettings = 1;
  v26 = -[PKBalanceDetailsViewController initWithBalance:forPass:balanceReminder:balanceName:currencyCode:associatedAction:paymentDataProvider:webService:style:](self, "initWithBalance:forPass:balanceReminder:balanceName:currencyCode:associatedAction:paymentDataProvider:webService:style:", v25, v18, v17, v20, v22, v16, v15, v28, a9);

  return v26;
}

- (PKBalanceDetailsViewController)initWithBalance:(id)a3 forPass:(id)a4 balanceReminder:(id)a5 associatedAction:(id)a6 paymentDataProvider:(id)a7 webService:(id)a8 style:(int64_t)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  PKBalanceDetailsViewController *v26;
  PKBalanceDetailsViewController *v27;
  id obj;

  v16 = a3;
  v17 = a4;
  if (v16)
  {
    obj = a3;
    self->_isPostPaidPass = 0;
    v18 = a8;
    v19 = a7;
    v20 = a6;
    v21 = a5;
    v22 = !objc_msgSend(v17, "isAutoTopUpBalance:", v16)
       || !objc_msgSend(v17, "isAutoTopEnabled")
       || self->_isPostPaidPass;
    self->_shouldShowReminderSettings = v22;
    objc_msgSend(v16, "formattedValue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedTitle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "currencyCode");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[PKBalanceDetailsViewController initWithBalance:forPass:balanceReminder:balanceName:currencyCode:associatedAction:paymentDataProvider:webService:style:](self, "initWithBalance:forPass:balanceReminder:balanceName:currencyCode:associatedAction:paymentDataProvider:webService:style:", v23, v17, v21, v24, v25, v20, v19, v18, a9);

    if (v26)
      objc_storeStrong((id *)&v26->_balance, obj);
    self = v26;
    v27 = self;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (void)dealloc
{
  objc_super v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PKPaymentDataProvider removeDelegate:](self->_paymentDataProvider, "removeDelegate:", self);
  v3.receiver = self;
  v3.super_class = (Class)PKBalanceDetailsViewController;
  -[PKSectionTableViewController dealloc](&v3, sel_dealloc);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKBalanceDetailsViewController;
  -[PKBalanceDetailsViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  if (self->_style == 1)
  {
    PKBridgeAppearanceGetAppearanceSpecifier();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PKAppearanceApplyToContainer(v4, self);

    -[PKBalanceDetailsViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKBridgeAppearanceGetAppearanceSpecifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tintColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTintColor:", v7);

  }
}

- (void)_initializeReminderAmounts:(id)a3
{
  PKPaymentPassAction *action;
  id v5;
  void *v6;
  NSArray *v7;
  NSArray *reminderAmounts;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  NSArray *v14;
  NSArray *v15;
  NSArray *v16;
  NSArray *v17;
  NSArray *v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  _QWORD v22[4];
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  action = self->_action;
  v5 = a3;
  -[PKPaymentPassAction enteredValueItem](action, "enteredValueItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowBalanceReminderOptions");
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  reminderAmounts = self->_reminderAmounts;
  self->_reminderAmounts = v7;

  if (-[NSArray count](self->_reminderAmounts, "count")
    || !-[PKPaymentPass needsHardcodedReminderOptions](self->_pass, "needsHardcodedReminderOptions"))
  {
    goto LABEL_8;
  }
  if (-[PKPaymentPass isSuicaPass](self->_pass, "isSuicaPass"))
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", 200, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v9;
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", 500, 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v10;
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", 1000, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = v11;
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", 2000, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[3] = v12;
    v13 = v23;
  }
  else
  {
    if (!-[PKPaymentPass isChinaTransitCredential](self->_pass, "isChinaTransitCredential"))
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", 5, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v9;
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", 10, 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v10;
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", 15, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = v11;
    objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithMantissa:exponent:isNegative:", 20, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[3] = v12;
    v13 = v22;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 4);
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v15 = self->_reminderAmounts;
  self->_reminderAmounts = v14;

LABEL_8:
  -[NSArray sortedArrayUsingComparator:](self->_reminderAmounts, "sortedArrayUsingComparator:", &__block_literal_global_218);
  v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v17 = self->_reminderAmounts;
  self->_reminderAmounts = v16;

  v18 = self->_reminderAmounts;
  objc_msgSend(v5, "threshold");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[NSArray indexOfObject:](v18, "indexOfObject:", v19);
  if (v20 == 0x7FFFFFFFFFFFFFFFLL)
    v21 = 0;
  else
    v21 = v20 + 1;
  self->_selectedReminderAmountIndex = v21;
}

uint64_t __61__PKBalanceDetailsViewController__initializeReminderAmounts___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)_handleReminderAmountChanged:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  PKPaymentDataProvider *paymentDataProvider;
  PKPaymentBalance *balance;
  PKPaymentPass *pass;
  id WeakRetained;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(id *, int);
  void *v17;
  id v18;
  id v19[2];
  id location;

  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  if (v5 != self->_selectedReminderAmountIndex)
  {
    v6 = (void *)v5;
    if (v5)
    {
      -[NSArray objectAtIndexedSubscript:](self->_reminderAmounts, "objectAtIndexedSubscript:", v5 - 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D670C0]), "initWithThreshold:isEnabled:", v7, v6 != 0);
      objc_initWeak(&location, self);
      paymentDataProvider = self->_paymentDataProvider;
      balance = self->_balance;
      pass = self->_pass;
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __63__PKBalanceDetailsViewController__handleReminderAmountChanged___block_invoke;
      v17 = &unk_1E3E78AC0;
      objc_copyWeak(v19, &location);
      v19[1] = v6;
      v18 = v4;
      -[PKPaymentDataProvider setBalanceReminder:forBalance:pass:completion:](paymentDataProvider, "setBalanceReminder:forBalance:pass:completion:", v8, balance, pass, &v14);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v13 = WeakRetained;
      if (WeakRetained)
        objc_msgSend(WeakRetained, "balanceDetailsViewController:didUpdateBalanceReminder:forBalance:", self, v8, self->_balance, v14, v15, v16, v17);

      objc_destroyWeak(v19);
      objc_destroyWeak(&location);

    }
  }

}

void __63__PKBalanceDetailsViewController__handleReminderAmountChanged___block_invoke(id *a1, int a2)
{
  _QWORD block[4];
  id v4;
  id v5[2];

  if (a2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__PKBalanceDetailsViewController__handleReminderAmountChanged___block_invoke_2;
    block[3] = &unk_1E3E671C0;
    objc_copyWeak(v5, a1 + 5);
    v5[1] = a1[6];
    v4 = a1[4];
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(v5);
  }
}

void __63__PKBalanceDetailsViewController__handleReminderAmountChanged___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && WeakRetained[144] != *(_QWORD *)(a1 + 48))
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cellForRowAtIndexPath:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessoryType:", 3);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v7[144], objc_msgSend(*(id *)(a1 + 32), "section"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cellForRowAtIndexPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setAccessoryType:", 0);
    v7[144] = *(_QWORD *)(a1 + 48);

    WeakRetained = v7;
  }

}

- (void)_handleActionSelected
{
  char v3;
  id v4;
  PKPerformActionViewController *v5;
  PKNavigationController *v6;
  id v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  v3 = -[PKPaymentPass canPerformAction:unableReason:displayableError:](self->_pass, "canPerformAction:unableReason:displayableError:", self->_action, &v8, &v7);
  v4 = v7;
  if ((v3 & 1) != 0 || v8 == 2)
  {
    v5 = -[PKPerformActionViewController initWithPass:action:paymentDataProvider:]([PKPerformActionViewController alloc], "initWithPass:action:paymentDataProvider:", self->_pass, self->_action, self->_paymentDataProvider);
    -[PKPerformActionViewController setDelegate:](v5, "setDelegate:", self);
    -[PKPerformActionViewController setWebService:](v5, "setWebService:", self->_webService);
    v6 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v5);
    -[PKNavigationController setSupportedInterfaceOrientations:](v6, "setSupportedInterfaceOrientations:", 2);
    -[PKBalanceDetailsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

  }
  else
  {
    +[PKPerformActionViewController alertControllerForUnableReason:action:displayableError:addCardActionHandler:](PKPerformActionViewController, "alertControllerForUnableReason:action:displayableError:addCardActionHandler:", v8, self->_action, v4, 0);
    v5 = (PKPerformActionViewController *)objc_claimAutoreleasedReturnValue();
    -[PKBalanceDetailsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
  }

}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  NSUInteger v4;

  if (a3)
  {
    if (a3 == 1)
    {
      if (self->_shouldShowReminderSettings)
      {
        v4 = -[NSArray count](self->_reminderAmounts, "count");
        if (v4)
          LOBYTE(v4) = -[PKPaymentDataProvider apiVersion](self->_paymentDataProvider, "apiVersion") > 1;
      }
      else
      {
        LOBYTE(v4) = 0;
      }
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKBalanceDetailsViewController;
  -[PKBalanceDetailsViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[PKBalanceDetailsViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKBalanceDetailsViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v3;

  -[PKBalanceDetailsViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (unint64_t)_balanceDetailsRowTypeForRowIndex:(int64_t)a3
{
  char v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v5 = 0;
  v6 = 0;
  v7 = 0;
  do
  {
    v8 = v6;
    v7 += -[PKBalanceDetailsViewController _numberOfBalanceDetailsRowsEnabledForRowType:](self, "_numberOfBalanceDetailsRowsEnabledForRowType:", v6);
    if ((v5 & 1) != 0)
      break;
    v5 = 1;
    v6 = 1;
  }
  while (v7 <= a3);
  if (v7 <= a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return v8;
}

- (int64_t)_numberOfBalanceDetailsRowsEnabled
{
  if (-[PKBalanceDetailsViewController _shouldDisplayAction](self, "_shouldDisplayAction"))
    return 2;
  else
    return 1;
}

- (int64_t)_numberOfBalanceDetailsRowsEnabledForRowType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (!a3)
    return 1;
  if (a3 == 1)
    return -[PKBalanceDetailsViewController _shouldDisplayAction](self, "_shouldDisplayAction", v3, v4);
  return 0;
}

- (BOOL)_shouldDisplayAction
{
  PKPaymentPassActivationState v3;
  BOOL v4;

  if (!self->_action || PKPassbookIsCurrentlyDeletedByUser())
    return 0;
  v3 = -[PKPaymentPass activationState](self->_pass, "activationState");
  v4 = -[PKPaymentPassAction type](self->_action, "type") != 1 || v3 - 1 >= 2;
  if (!v4 || (-[PKPaymentPassAction unavailableActionBehavior](self->_action, "unavailableActionBehavior") & 2) != 0)
    return 0;
  if (self->_style == 1)
    return PKIsAltAccountPairedOrPairing();
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v5;

  v5 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4);
  if (v5 == 1)
    return -[NSArray count](self->_reminderAmounts, "count") + 1;
  if (v5)
    return 0;
  return -[PKBalanceDetailsViewController _numberOfBalanceDetailsRowsEnabled](self, "_numberOfBalanceDetailsRowsEnabled");
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  NSDecimalNumber *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int64_t style;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("cell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, "setAccessoryType:", 0);
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, CFSTR("cell"));
  }
  v9 = objc_msgSend(v6, "row");
  v10 = objc_msgSend(v6, "section");

  v11 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", v10);
  if (v11 == 1)
  {
    if (v9 < 1)
    {
      PKLocalizedPaymentString(CFSTR("LOW_BALANCE_REMINDER_SETUP_CELL_NONE"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[NSArray objectAtIndexedSubscript:](self->_reminderAmounts, "objectAtIndexedSubscript:", v9 - 1);
      v15 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      PKCurrencyAmountCreate(v15, self->_currencyCode);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "formattedStringValue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      PKLocalizedPaymentString(CFSTR("LOW_BALANCE_REMINDER_SETUP_CELL_SUBTITLE_FORMAT_STRING"), CFSTR("%@"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v8, "textLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setText:", v18);

    objc_msgSend(v8, "detailTextLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setText:", 0);

    if (v9 == self->_selectedReminderAmountIndex)
      v21 = 3;
    else
      v21 = 0;
    objc_msgSend(v8, "setAccessoryType:", v21);
    if (self->_style != 1)
      goto LABEL_27;
    objc_msgSend(v8, "textLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    PKBridgeAppearanceGetAppearanceSpecifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "textColor");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v11)
      goto LABEL_28;
    v12 = -[PKBalanceDetailsViewController _balanceDetailsRowTypeForRowIndex:](self, "_balanceDetailsRowTypeForRowIndex:", v9);
    if (v12 != 1)
    {
      if (v12)
        goto LABEL_28;
      objc_msgSend(v8, "textLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentBalance localizedTitle](self->_balance, "localizedTitle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v13, "setText:", v14);
      }
      else
      {
        PKLocalizedPaymentString(CFSTR("BALANCE_DETAIL_BALANCE_CELL_TITLE"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setText:", v30);

      }
      objc_msgSend(v8, "detailTextLabel");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setText:", self->_currentBalance);

      if (self->_style != 1)
        goto LABEL_28;
      objc_msgSend(v8, "textLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      PKBridgeAppearanceGetAppearanceSpecifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "textColor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v18;
      goto LABEL_25;
    }
    -[PKPaymentPassAction title](self->_action, "title");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setText:", v18);

    objc_msgSend(v8, "detailTextLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setText:", 0);

    style = self->_style;
    objc_msgSend(v8, "textLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (style != 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v22;
LABEL_25:
      objc_msgSend(v29, "setTextColor:", v23);
      goto LABEL_26;
    }
    PKBridgeAppearanceGetAppearanceSpecifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "buttonTextColor");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v28 = (void *)v24;
  objc_msgSend(v22, "setTextColor:", v24);

LABEL_26:
LABEL_27:

LABEL_28:
  if (self->_style == 1)
  {
    v32 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v33 = (void *)objc_msgSend(v32, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    PKBridgeAppearanceGetAppearanceSpecifier();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "tableViewCellHighlightColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setBackgroundColor:", v35);

    objc_msgSend(v8, "setSelectedBackgroundView:", v33);
  }
  return v8;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  unint64_t v6;
  BOOL v7;

  v5 = a4;
  v6 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v5, "section"));
  if (v6 == 1)
  {
    v7 = 1;
  }
  else if (v6)
  {
    v7 = 0;
  }
  else
  {
    v7 = -[PKBalanceDetailsViewController _balanceDetailsRowTypeForRowIndex:](self, "_balanceDetailsRowTypeForRowIndex:", objc_msgSend(v5, "row")) == 1;
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  unint64_t v6;
  id v7;

  v7 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v7, 1);
  v6 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(v7, "section"));
  if (v6 == 1)
  {
    -[PKBalanceDetailsViewController _handleReminderAmountChanged:](self, "_handleReminderAmountChanged:", v7);
  }
  else if (!v6
         && -[PKBalanceDetailsViewController _balanceDetailsRowTypeForRowIndex:](self, "_balanceDetailsRowTypeForRowIndex:", objc_msgSend(v7, "row")) == 1)
  {
    -[PKBalanceDetailsViewController _handleActionSelected](self, "_handleActionSelected");
  }

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;

  if (-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4) == 1)
  {
    PKLocalizedPaymentString(CFSTR("BALANCE_DETAIL_REMINDER_SECTION_HEADER"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  unint64_t v5;
  void *v6;
  __CFString *v7;

  v5 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", a4);
  if (v5 == 1)
  {
    v7 = CFSTR("REMINDERS_SECTION_REMINDER_FOOTER_ONLY");
LABEL_8:
    PKLocalizedPaymentString(&v7->isa);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return v6;
  }
  if (!v5 && self->_style == 1 && self->_action && (PKIsAltAccountPairedOrPairing() & 1) == 0)
  {
    if (-[PKPaymentPass isTransitPass](self->_pass, "isTransitPass"))
      v7 = CFSTR("BALANCE_WATCH_TRANSIT_TOP_UP_INSTRUCTION");
    else
      v7 = CFSTR("BALANCE_WATCH_TOP_UP_INSTRUCTION");
    goto LABEL_8;
  }
  v6 = 0;
  return v6;
}

- (void)performActionViewControllerDidCancel:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(v3, "setDelegate:", 0);
  objc_msgSend(v3, "presentingViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)performActionViewControllerDidPerformAction:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(v3, "setDelegate:", 0);
  objc_msgSend(v3, "presentingViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)performActionViewControllerDidCompleteAutoReload:(id)a3
{
  id v4;
  id v5;

  -[PKBalanceDetailsViewController performActionViewControllerDidPerformAction:](self, "performActionViewControllerDidPerformAction:", a3);
  -[PKBalanceDetailsViewController navigationController](self, "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v5, "popToRootViewControllerAnimated:", 1);

}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  id v20;
  _QWORD block[6];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PKPaymentPass uniqueID](self->_pass, "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", v6);

  if (v9)
  {
    v19 = v7;
    v20 = v6;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          -[PKPaymentBalance identifiers](self->_balance, "identifiers", v19, v20);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "identifiers");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = PKEqualObjects();

          if (v18)
          {
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __90__PKBalanceDetailsViewController_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke;
            block[3] = &unk_1E3E61388;
            block[4] = self;
            block[5] = v15;
            dispatch_async(MEMORY[0x1E0C80D38], block);
            goto LABEL_12;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_12:

    v7 = v19;
    v6 = v20;
  }

}

void __90__PKBalanceDetailsViewController_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1080), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "formattedValue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1128);
  *(_QWORD *)(v3 + 1128) = v2;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, objc_msgSend(*(id *)(a1 + 32), "sectionForIndex:", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForRowAtIndexPath:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "detailTextLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1128));

}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4
{
  id v6;
  PKPaymentPass *pass;
  id v8;
  void *v9;
  int v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  pass = self->_pass;
  v8 = a3;
  -[PKPaymentPass uniqueID](pass, "uniqueID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", v8);

  if (v10 && !self->_balance)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __101__PKBalanceDetailsViewController_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke;
    v11[3] = &unk_1E3E61388;
    v11[4] = self;
    v12 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v11);

  }
}

void __101__PKBalanceDetailsViewController_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke(uint64_t a1)
{
  NSDecimalNumber *v2;
  void *v3;
  NSString *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 40), "balance");
  v2 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "balanceAmount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currency");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  PKCurrencyAmountCreate(v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formattedStringValue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 1128);
  *(_QWORD *)(v7 + 1128) = v6;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, objc_msgSend(*(id *)(a1 + 32), "sectionForIndex:", 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cellForRowAtIndexPath:", v10);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "detailTextLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1128));

}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateBalanceReminder:(id)a4 forBalanceWithIdentifier:(id)a5
{
  id v8;
  id v9;
  PKPaymentPass *pass;
  id v11;
  void *v12;
  void *v13;
  int v14;
  _QWORD v15[5];
  id v16;

  v8 = a4;
  v9 = a5;
  pass = self->_pass;
  v11 = a3;
  -[PKPaymentPass uniqueID](pass, "uniqueID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(pass) = objc_msgSend(v12, "isEqualToString:", v11);

  if ((pass & 1) != 0)
  {
    -[PKPaymentBalance identifiers](self->_balance, "identifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "containsObject:", v9);

    if (v14)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __116__PKBalanceDetailsViewController_paymentPassWithUniqueIdentifier_didUpdateBalanceReminder_forBalanceWithIdentifier___block_invoke;
      v15[3] = &unk_1E3E61388;
      v15[4] = self;
      v16 = v8;
      dispatch_async(MEMORY[0x1E0C80D38], v15);

    }
  }
  else
  {

  }
}

void __116__PKBalanceDetailsViewController_paymentPassWithUniqueIdentifier_didUpdateBalanceReminder_forBalanceWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1144);
  objc_msgSend(*(id *)(a1 + 40), "threshold");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "indexOfObject:", v3);

  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    v5 = 0;
  else
    v5 = v4 + 1;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1152) = v5;
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadSections:withRowAnimation:", v6, 5);

}

- (PKBalanceDetailsViewControllerDelegate)delegate
{
  return (PKBalanceDetailsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_reminderAmounts, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_currentBalance, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_balance, 0);
}

@end
