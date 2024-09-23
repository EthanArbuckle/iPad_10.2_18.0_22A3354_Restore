@implementation PKPaymentPassDetailPassActionSectionController

- (PKPaymentPassDetailPassActionSectionController)initWithPass:(id)a3 viewStyle:(int64_t)a4 paymentDataProvider:(id)a5 webService:(id)a6 transitBalanceModel:(id)a7 delegate:(id)a8
{
  id v15;
  id v16;
  id v17;
  PKPaymentPassDetailPassActionSectionController *v18;
  PKPaymentPassDetailPassActionSectionController *v19;
  uint64_t v20;
  PKPaymentPassAction *action;
  id v23;
  id v24;
  objc_super v25;

  v15 = a3;
  v16 = a5;
  v24 = a6;
  v23 = a7;
  v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)PKPaymentPassDetailPassActionSectionController;
  v18 = -[PKPaymentPassDetailSectionController init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_pass, a3);
    v19->_viewStyle = a4;
    objc_storeWeak((id *)&v19->_delegate, v17);
    objc_storeStrong((id *)&v19->_transitBalanceModel, a7);
    objc_storeStrong((id *)&v19->_webService, a6);
    +[PKPaymentPassDetailAutoReloadSectionController enteredValueActionForPass:](PKPaymentPassDetailAutoReloadSectionController, "enteredValueActionForPass:", v19->_pass);
    v20 = objc_claimAutoreleasedReturnValue();
    action = v19->_action;
    v19->_action = (PKPaymentPassAction *)v20;

    objc_storeStrong((id *)&v19->_paymentDataProvider, a5);
    -[PKPaymentPassDetailPassActionSectionController _computeActionBundle](v19, "_computeActionBundle");
  }

  return v19;
}

- (id)allSectionIdentifiers
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("AddMoneySection");
  v3[1] = CFSTR("BuyPassesSection");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setTransitBalanceModel:(id)a3
{
  PKTransitBalanceModel *v5;
  id WeakRetained;
  void *v7;
  PKTransitBalanceModel *v8;

  v5 = (PKTransitBalanceModel *)a3;
  if (v5 && self->_transitBalanceModel != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_transitBalanceModel, a3);
    -[PKPaymentPassDetailPassActionSectionController _computeActionBundle](self, "_computeActionBundle");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[PKPaymentPassDetailPassActionSectionController sectionIdentifiers](self, "sectionIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "reloadSections:", v7);

    v5 = v8;
  }

}

- (id)sectionIdentifiers
{
  id v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!-[PKPaymentPassDetailSectionController currentSegment](self, "currentSegment"))
  {
    +[PKPaymentPassDetailAutoReloadSectionController enteredValueActionForPass:](PKPaymentPassDetailAutoReloadSectionController, "enteredValueActionForPass:", self->_pass);
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      v6 = -[PKTransitBalanceModel hasBalanceContent](self->_transitBalanceModel, "hasBalanceContent");

      if (v6)
        objc_msgSend(v3, "addObject:", CFSTR("AddMoneySection"));
    }
    -[PKPaymentPass actionGroups](self->_pass, "actionGroups");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
      objc_msgSend(v3, "addObject:", CFSTR("BuyPassesSection"));
  }
  v9 = (void *)objc_msgSend(v3, "copy");

  return v9;
}

+ (BOOL)validForPaymentPass:(id)a3
{
  id v3;
  void *v4;
  int IsPersonalized;
  void *v6;
  _BOOL8 v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "devicePrimaryPaymentApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "state");
  IsPersonalized = PKPaymentApplicationStateIsPersonalized();

  if (IsPersonalized)
  {
    +[PKPaymentPassDetailAutoReloadSectionController enteredValueActionForPass:](PKPaymentPassDetailAutoReloadSectionController, "enteredValueActionForPass:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      LOBYTE(v7) = 1;
    }
    else
    {
      objc_msgSend(v3, "actionGroups");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "count") != 0;

    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  id v17;
  uint64_t v19;

  v7 = a3;
  v8 = a5;
  if (PKEqualObjects())
  {
    PKPassLocalizedStringWithFormat();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentPassDetailSectionController linkCellWithText:forTableView:](self, "linkCellWithText:forTableView:", v9, v7, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!PKEqualObjects())
    {
      v10 = 0;
      goto LABEL_14;
    }
    -[PKPaymentPass actionGroups](self->_pass, "actionGroups");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKPaymentPass paymentPass](self->_pass, "paymentPass");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "actionLocalizations");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      v15 = v14 == 0;
    else
      v15 = 1;
    if (!v15)
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", v9);
      v16 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v16;
    }
    if (!v9)
    {
      v19 = 0;
      v17 = (id)PKPassLocalizedStringWithFormat();
    }
    -[PKPaymentPassDetailSectionController linkCellWithText:forTableView:](self, "linkCellWithText:forTableView:", v9, v7, v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_14:

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v8;
  char v9;
  id v10;
  PKPerformActionViewController *v11;
  id WeakRetained;
  id v13;
  uint64_t v14;

  v8 = a5;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", a4, 1);
  if (PKEqualObjects())
  {
    v13 = 0;
    v14 = 1;
    v9 = -[PKPaymentPass canPerformAction:unableReason:displayableError:](self->_pass, "canPerformAction:unableReason:displayableError:", self->_action, &v14, &v13);
    v10 = v13;
    if ((v9 & 1) != 0 || v14 == 2)
    {
      v11 = -[PKPerformActionViewController initWithPass:action:viewStyle:paymentDataProvider:]([PKPerformActionViewController alloc], "initWithPass:action:viewStyle:paymentDataProvider:", self->_pass, self->_action, self->_viewStyle, self->_paymentDataProvider);
    }
    else
    {
      +[PKPerformActionViewController alertControllerForUnableReason:action:displayableError:addCardActionHandler:](PKPerformActionViewController, "alertControllerForUnableReason:action:displayableError:addCardActionHandler:", v14, self->_action, v10, 0);
      v11 = (PKPerformActionViewController *)objc_claimAutoreleasedReturnValue();
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "presentPassActionViewController:", v11);

    goto LABEL_9;
  }
  if (PKEqualObjects())
  {
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v10, "presentCombinedPassActionViewControllerFromBundle:", self->_actionBundle);
LABEL_9:

  }
}

- (void)_computeActionBundle
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  PKPaymentPassActionBundle *actionBundle;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[PKPaymentPass actionGroups](self->_pass, "actionGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0D671D8]);
  objc_msgSend(v4, "setActionGroups:", v3);
  -[PKTransitBalanceModel filteredActionsForDisplayableEntities](self->_transitBalanceModel, "filteredActionsForDisplayableEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v12, "type", (_QWORD)v14) == 2
          && objc_msgSend(v12, "isActionAvailable")
          && (objc_msgSend(v12, "unavailableActionBehavior") & 2) == 0)
        {
          objc_msgSend(v6, "addObject:", v12);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  objc_msgSend(v4, "setOrAddActions:", v6);
  actionBundle = self->_actionBundle;
  self->_actionBundle = (PKPaymentPassActionBundle *)v4;

}

- (PKPaymentPassDetailPassActionSectionControllerDelegate)delegate
{
  return (PKPaymentPassDetailPassActionSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKTransitBalanceModel)transitBalanceModel
{
  return self->_transitBalanceModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitBalanceModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_actionBundle, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
