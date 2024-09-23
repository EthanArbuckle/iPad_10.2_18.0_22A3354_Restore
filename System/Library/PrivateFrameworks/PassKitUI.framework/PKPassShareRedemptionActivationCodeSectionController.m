@implementation PKPassShareRedemptionActivationCodeSectionController

- (PKPassShareRedemptionActivationCodeSectionController)init
{

  return 0;
}

- (PKPassShareRedemptionActivationCodeSectionController)initWithMode:(unint64_t)a3 delegate:(id)a4
{
  id v6;
  PKPassShareRedemptionActivationCodeSectionController *v7;
  PKPassShareRedemptionActivationCodeSectionController *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, uint64_t, void *);
  void *v16;
  id v17;
  id location;
  objc_super v19;

  v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PKPassShareRedemptionActivationCodeSectionController;
  v7 = -[PKPassShareSectionController initWithIdentifiers:](&v19, sel_initWithIdentifiers_, &unk_1E3FAE9C8);
  v8 = v7;
  if (v7)
  {
    v7->_mode = a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
    objc_initWeak(&location, v8);
    v9 = (void *)MEMORY[0x1E0DC35C8];
    v10 = objc_opt_class();
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __78__PKPassShareRedemptionActivationCodeSectionController_initWithMode_delegate___block_invoke;
    v16 = &unk_1E3E78F90;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v9, "registrationWithCellClass:configurationHandler:", v10, &v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupListSectionController setCellRegistration:](v8, "setCellRegistration:", v11, v13, v14, v15, v16);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __78__PKPassShareRedemptionActivationCodeSectionController_initWithMode_delegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  id v8;

  v8 = a2;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "decorateListCell:forRowItem:", v8, v6);

  }
}

- (void)setActivationOptions:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_activationOptions, a3);
  -[PKPassShareRedemptionActivationCodeSectionController reloadItemsAnimated:](self, "reloadItemsAnimated:", 0);
  -[PKPassShareActivationOptions primaryOption](self->_activationOptions, "primaryOption");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_storeStrong((id *)&self->_enteredActivationCode, v6);
  if (objc_msgSend(v5, "type") == 1)
  {
    objc_msgSend(v5, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self->_requiresActivationCode = v7 == 0;

  }
  else
  {
    self->_requiresActivationCode = 0;
  }
  -[PKPassShareRedemptionActivationCodeSectionController reloadItemsAnimated:](self, "reloadItemsAnimated:", 0);

}

- (void)reloadItemsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  PKSharePreviewRowItem *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  id v10;

  v3 = a3;
  if (-[PKPassShareRedemptionActivationCodeSectionController requiresActivationCode](self, "requiresActivationCode"))
  {
    -[PKPassShareActivationOptions primaryOption](self->_activationOptions, "primaryOption");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v10, "type");
    if (PKPassShareActivationOptionTypeIsActivationCode())
    {
      v6 = -[PKSharePreviewRowItem initWithIdentifier:]([PKSharePreviewRowItem alloc], "initWithIdentifier:", CFSTR("EnterActivationCode"));
      PKLocalizedShareableCredentialString(CFSTR("SHARE_OVERVIEW_ACTIVATION_CODE_TITLE"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSharePreviewRowItem setTitle:](v6, "setTitle:", v7);

      PKLocalizedShareableCredentialString(CFSTR("SHARE_ACTIVATION_ENTER_PIN_CODE_PLACEHOLDER"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSharePreviewRowItem setSubtitle:](v6, "setSubtitle:", v8);

      objc_msgSend(v5, "addObject:", v6);
    }
    -[PKPaymentSetupListSectionController setItems:](self, "setItems:", v5);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "reloadDataAnimated:", v3);

  }
  else
  {
    -[PKPaymentSetupListSectionController setItems:](self, "setItems:", MEMORY[0x1E0C9AA60]);
  }
}

- (void)decorateListCell:(id)a3 forRowItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  +[PKListTextFieldContentConfiguration valueCellConfiguration](PKListTextFieldContentConfiguration, "valueCellConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPlaceholderText:", v9);

  objc_msgSend(v6, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setSecondaryText:", v10);
  objc_msgSend(v8, "setDirectionalLayoutMargins:", 10.0, 10.0, 10.0, 0.0);
  objc_msgSend(v8, "setKeyboardType:", 4);
  objc_msgSend(v8, "setReturnKeyType:", 9);
  objc_msgSend(v8, "secondaryTextProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC4918]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v12);

  objc_msgSend(v8, "setFocusTextField:", 0);
  objc_msgSend(v7, "setContentConfiguration:", v8);
  objc_msgSend(v7, "setDelegate:", self);
  v13 = objc_alloc(MEMORY[0x1E0DC34F0]);
  PKLocalizedString(CFSTR("DONE"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithTitle:style:target:action:", v14, 2, self, sel__endEditing);

  v17[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setToolbarItems:", v16);

  objc_msgSend(v7, "setConfigurationUpdateHandler:", &__block_literal_global_225);
}

void __84__PKPassShareRedemptionActivationCodeSectionController_decorateListCell_forRowItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)MEMORY[0x1E0DC34D8];
  v5 = a2;
  objc_msgSend(v4, "listGroupedCellConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isHighlighted") & 1) != 0 || (objc_msgSend(v9, "isSelected") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "tableCellDefaultSelectionTintColor");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
  objc_msgSend(v6, "setBackgroundColor:", v7);

  objc_msgSend(v5, "setBackgroundConfiguration:", v6);
}

- (void)didSelectItem:(id)a3
{
  PKPassShareRedemptionActivationCodeSectionControllerDelegate **p_delegate;
  id v4;
  id WeakRetained;
  id v6;
  id v7;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "deselectCells");

  v6 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v6, "cellForItem:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v7, "beginEditing");

}

- (BOOL)textFieldShouldReturn:(id)a3 forListCell:(id)a4
{
  -[PKPassShareRedemptionActivationCodeSectionController _endEditing](self, "_endEditing", a3, a4);
  return 1;
}

- (void)textFieldDidBeginEditing:(id)a3 forListCell:(id)a4
{
  PKPassShareRedemptionActivationCodeSectionControllerDelegate **p_delegate;
  id WeakRetained;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "setIsEnteringActivationCode:", 1);

  v6 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v6, "reloadDataAnimated:", 1);

}

- (void)_endEditing
{
  PKPassShareRedemptionActivationCodeSectionControllerDelegate **p_delegate;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  NSString *v8;
  NSString *enteredActivationCode;
  id v10;
  id v11;
  id v12;
  id v13;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[PKPaymentSetupListSectionController items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "cellForItem:", v6);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v13;
      objc_msgSend(v7, "endEditing");
      objc_msgSend(v7, "textFieldText");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();

      enteredActivationCode = self->_enteredActivationCode;
      self->_enteredActivationCode = v8;

    }
  }
  v10 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v10, "setIsEnteringActivationCode:", 0);

  v11 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v11, "activationCodeDidChange");

  v12 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v12, "reloadDataAnimated:", 1);

}

- (PKPassShareActivationOptions)activationOptions
{
  return self->_activationOptions;
}

- (BOOL)requiresActivationCode
{
  return self->_requiresActivationCode;
}

- (NSString)enteredActivationCode
{
  return self->_enteredActivationCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enteredActivationCode, 0);
  objc_storeStrong((id *)&self->_activationOptions, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
