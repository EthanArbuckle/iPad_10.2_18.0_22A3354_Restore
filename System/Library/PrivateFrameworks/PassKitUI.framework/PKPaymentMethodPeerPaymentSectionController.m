@implementation PKPaymentMethodPeerPaymentSectionController

- (PKPaymentMethodPeerPaymentSectionController)initWithDelegate:(id)a3 request:(id)a4 useAppleCashBalance:(BOOL)a5
{
  id v8;
  id v9;
  PKPaymentMethodPeerPaymentSectionController *v10;
  PKPaymentMethodPeerPaymentSectionController *v11;
  void *v12;
  uint64_t v13;
  PKPeerPaymentAccount *account;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  PKPaymentPass *peerPaymentPass;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentMethodPeerPaymentSectionController;
  v10 = -[PKPaymentMethodPeerPaymentSectionController init](&v21, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_delegate, v8);
    objc_storeStrong((id *)&v11->_request, a4);
    v11->_useAppleCashBalance = a5;
    objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "account");
    v13 = objc_claimAutoreleasedReturnValue();
    account = v11->_account;
    v11->_account = (PKPeerPaymentAccount *)v13;

    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentAccount associatedPassUniqueID](v11->_account, "associatedPassUniqueID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "passWithUniqueID:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "paymentPass");
    v18 = objc_claimAutoreleasedReturnValue();
    peerPaymentPass = v11->_peerPaymentPass;
    v11->_peerPaymentPass = (PKPaymentPass *)v18;

  }
  return v11;
}

- (NSArray)identifiers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("peerPayment");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldHighlightItem:(id)a3
{
  return 0;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  PKPaymentMethodSelectionItem *v9;
  void *v10;
  void *v11;

  v5 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[PKPaymentRequest isPeerPaymentRequest](self->_request, "isPeerPaymentRequest")
    && -[PKPeerPaymentAccount supportsPreserveCurrentBalance](self->_account, "supportsPreserveCurrentBalance"))
  {
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "peerPaymentPassUniqueID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_peerPaymentPass)
    {
      v9 = -[PKPaymentMethodSelectionItem initWithIdentifier:]([PKPaymentMethodSelectionItem alloc], "initWithIdentifier:", v8);
      -[PKPaymentMethodSelectionItem setPaymentPass:](v9, "setPaymentPass:", self->_peerPaymentPass);
      -[PKPeerPaymentAccount currentBalance](self->_account, "currentBalance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentMethodSelectionItem setBalance:](v9, "setBalance:", v10);

      -[PKPaymentMethodSelectionItem setSelected:](v9, "setSelected:", self->_useAppleCashBalance);
      objc_msgSend(v6, "addObject:", v9);

    }
  }
  v11 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v5, "appendItems:", v11);

  return v5;
}

- (id)cellRegistrationForItem:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD v7[5];

  v4 = (void *)MEMORY[0x1E0DC35C8];
  v5 = objc_opt_class();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__PKPaymentMethodPeerPaymentSectionController_cellRegistrationForItem___block_invoke;
  v7[3] = &unk_1E3E6EA90;
  v7[4] = self;
  objc_msgSend(v4, "registrationWithCellClass:configurationHandler:", v5, v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __71__PKPaymentMethodPeerPaymentSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a2, "configureWithItem:style:delegate:", a4, 1, *(_QWORD *)(a1 + 32));
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0DC35A8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithAppearance:", 2);
  objc_msgSend(v6, "setFooterMode:", 1);
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (Class)supplementaryRegistrationClassForKind:(id)a3 sectionIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  v7 = (void *)*MEMORY[0x1E0DC48A0];
  v8 = v5;
  v9 = v7;
  if (v9 == v8)
  {

  }
  else
  {
    v10 = v9;
    if (v8 && v9)
    {
      objc_msgSend(v8, "isEqualToString:", v9);

    }
    else
    {

    }
  }
  objc_opt_class();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v11;
}

- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  PKTextRangeHyperlink *v20;
  PKTextRangeHyperlink *v21;
  id v22;
  double v23;
  double v24;
  _QWORD v25[5];
  id v26;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)*MEMORY[0x1E0DC48A0];
  v12 = v9;
  v13 = v11;
  if (v13 == v12)
  {

  }
  else
  {
    v14 = v13;
    if (!v12 || !v13)
    {

      goto LABEL_9;
    }
    v15 = objc_msgSend(v12, "isEqualToString:", v13);

    if (!v15)
      goto LABEL_9;
  }
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  PKLocalizedPeerPaymentRecurringString(CFSTR("PAYMENT_SHEET_PAYMENT_METHOD_FOOTER_LINK"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentRecurringString(CFSTR("PAYMENT_SHEET_PAYMENT_METHOD_FOOTER"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentRecurringString(CFSTR("PAYMENT_SHEET_PAYMENT_METHOD_FOOTER_FORMAT"), CFSTR("%@%@"), v18, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v20 = [PKTextRangeHyperlink alloc];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __112__PKPaymentMethodPeerPaymentSectionController_configureSupplementaryRegistration_elementKind_sectionIdentifier___block_invoke;
  v25[3] = &unk_1E3E61B68;
  objc_copyWeak(&v26, &location);
  v25[4] = self;
  v21 = -[PKTextRangeHyperlink initWithLinkText:action:](v20, "initWithLinkText:action:", v17, v25);
  objc_msgSend(v16, "addObject:", v21);
  v22 = v8;
  objc_msgSend(v22, "edgeInsets");
  v24 = v23;
  objc_msgSend(v22, "edgeInsets");
  objc_msgSend(v22, "setEdgeInsets:", 0.0, v24, 0.0);
  objc_msgSend(v22, "setText:", v19);
  objc_msgSend(v22, "setTextAlignment:", 4);
  objc_msgSend(v22, "setSources:", v16);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

LABEL_9:
}

void __112__PKPaymentMethodPeerPaymentSectionController_configureSupplementaryRegistration_elementKind_sectionIdentifier___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  id v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "termsAcceptanceRequired"))
    {
      objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "targetDevice");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "updateAccountWithCompletion:", &__block_literal_global_114);
    }
    else
    {
      objc_msgSend(v6[2], "localizedValueForFieldKey:", *MEMORY[0x1E0D6AE20]);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v5 = objc_loadWeakRetained(v6 + 1);
        objc_msgSend(v5, "requestOpenURL:", v4);

      }
    }

    WeakRetained = v6;
  }

}

void __112__PKPaymentMethodPeerPaymentSectionController_configureSupplementaryRegistration_elementKind_sectionIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v2 = a2;
  if (v2)
  {
    if (PKIsPad())
    {
      v3 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "statusBarOrientation"));
      v5 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = &unk_1E3FAD5B8;
    }
    objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentPeerPaymentTermsAndConditionsWithAccount:orientation:completion:", v2, v5, &__block_literal_global_175);

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Cannot present terms acceptance flow because the account is nil", v7, 2u);
    }
  }

}

void __112__PKPaymentMethodPeerPaymentSectionController_configureSupplementaryRegistration_elementKind_sectionIdentifier___block_invoke_173()
{
  NSObject *v0;
  uint8_t v1[16];

  PKLogFacilityTypeGetObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_19D178000, v0, OS_LOG_TYPE_DEFAULT, "Presented Terms & Conditions acceptance flow", v1, 2u);
  }

}

- (void)paymentMethodCellDidToggleItem:(id)a3
{
  id WeakRetained;
  unint64_t v5;

  self->_useAppleCashBalance = objc_msgSend(a3, "isSelected");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "toggledUseAppleCashBalance:", self->_useAppleCashBalance);

  v5 = -[PKPaymentPass settings](self->_peerPaymentPass, "settings");
  if (((v5 >> 11) & 1) != !self->_useAppleCashBalance)
    -[PKPaymentPass setSettings:](self->_peerPaymentPass, "setSettings:", v5 & 0xFFFFFFFFFFFFF7FFLL | ((unint64_t)!self->_useAppleCashBalance << 11));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_peerPaymentPass, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
