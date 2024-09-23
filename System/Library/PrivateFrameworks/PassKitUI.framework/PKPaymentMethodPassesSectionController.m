@implementation PKPaymentMethodPassesSectionController

- (PKPaymentMethodPassesSectionController)initWithDelegate:(id)a3 request:(id)a4 selectedPass:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKPaymentMethodPassesSectionController *v11;
  PKPaymentMethodPassesSectionController *v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentMethodPassesSectionController;
  v11 = -[PKPaymentMethodPassesSectionController init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    objc_storeStrong((id *)&v12->_request, a4);
    objc_storeStrong((id *)&v12->_selectedPass, a5);
    PKLocalizedPaymentString(CFSTR("PAYMENT_METHOD_PASSES_HEADER"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDynamicListSectionController setHeaderText:](v12, "setHeaderText:", v13);

  }
  return v12;
}

- (id)identifiers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("passes");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldHighlightItem:(id)a3
{
  return 1;
}

- (void)didSelectItem:(id)a3
{
  PKPaymentPass *v4;
  PKPaymentPass *selectedPass;
  PKPaymentPass *v6;
  id WeakRetained;
  id v8;

  objc_msgSend(a3, "paymentPass");
  v4 = (PKPaymentPass *)objc_claimAutoreleasedReturnValue();
  selectedPass = self->_selectedPass;
  self->_selectedPass = v4;
  v6 = v4;

  self = (PKPaymentMethodPassesSectionController *)((char *)self + 64);
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super.isa);
  objc_msgSend(WeakRetained, "reloadDataAnimated:", 1);

  v8 = objc_loadWeakRetained((id *)&self->super.super.isa);
  objc_msgSend(v8, "selectedPass:", v6);

}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  void *v5;
  NSArray *v6;
  NSArray *passes;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  PKPaymentMethodSelectionItem *v14;
  void *v15;
  PKPaymentMethodSelectionItem *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  BOOL v22;
  uint64_t v23;
  void *v24;
  id v26;
  NSArray *obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v26 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sortedPaymentPassesForPaymentRequest:", self->_request);
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  passes = self->_passes;
  self->_passes = v6;

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = self->_passes;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v14 = [PKPaymentMethodSelectionItem alloc];
        objc_msgSend(v13, "uniqueID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[PKPaymentMethodSelectionItem initWithIdentifier:](v14, "initWithIdentifier:", v15);

        -[PKPaymentMethodSelectionItem setPaymentPass:](v16, "setPaymentPass:", v13);
        -[PKPaymentPass uniqueID](self->_selectedPass, "uniqueID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "uniqueID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v17;
        v20 = v18;
        v21 = v20;
        if (v19 == v20)
        {
          v23 = 1;
        }
        else
        {
          if (v19)
            v22 = v20 == 0;
          else
            v22 = 1;
          if (v22)
            v23 = 0;
          else
            v23 = objc_msgSend(v19, "isEqualToString:", v20);
        }

        -[PKPaymentMethodSelectionItem setSelected:](v16, "setSelected:", v23);
        objc_msgSend(v8, "addObject:", v16);

      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v10);
  }

  v24 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v26, "appendItems:", v24);

  return v26;
}

- (id)cellRegistrationForItem:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0DC35C8], "registrationWithCellClass:configurationHandler:", objc_opt_class(), &__block_literal_global_226);
}

uint64_t __66__PKPaymentMethodPassesSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a2, "configureWithItem:", a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_selectedPass, 0);
  objc_storeStrong((id *)&self->_passes, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
