@implementation PKTransactionSupportStatementNameSectionController

- (PKTransactionSupportStatementNameSectionController)initWithMerchantStatementName:(id)a3
{
  id v5;
  PKTransactionSupportStatementNameSectionController *v6;
  PKTransactionSupportStatementNameSectionController *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, uint64_t, void *);
  void *v15;
  id v16;
  id location;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKTransactionSupportStatementNameSectionController;
  v6 = -[PKPaymentSetupListSectionController init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_merchantStatementName, a3);
    objc_initWeak(&location, v7);
    v8 = (void *)MEMORY[0x1E0DC35C8];
    v9 = objc_opt_class();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __84__PKTransactionSupportStatementNameSectionController_initWithMerchantStatementName___block_invoke;
    v15 = &unk_1E3E62748;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v8, "registrationWithCellClass:configurationHandler:", v9, &v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupListSectionController setCellRegistration:](v7, "setCellRegistration:", v10, v12, v13, v14, v15);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __84__PKTransactionSupportStatementNameSectionController_initWithMerchantStatementName___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  id v8;
  id v9;

  v9 = a2;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v8 = (id)objc_msgSend(WeakRetained, "_decorateListCell:forRowItem:", v9, v6);

  }
}

- (id)headerAttributedStringForIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  PKLocalizedPaymentString(CFSTR("TRANSACTION_DETAILS_REPORT_PROBLEM_STATEMENT_NAME"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedUppercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0CB3498]);
  v11[0] = *MEMORY[0x1E0DC1138];
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B10], (void *)*MEMORY[0x1E0DC4918], 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v11[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithString:attributes:", v4, v8);

  return v9;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  v8[0] = self->_merchantStatementName;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendItems:", v6);

  return v5;
}

- (BOOL)shouldHighlightItem:(id)a3
{
  return 0;
}

- (id)_decorateListCell:(id)a3 forRowItem:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0DC39A8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "valueCellConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v6);

  objc_msgSend(v7, "setContentConfiguration:", v8);
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantStatementName, 0);
}

@end
