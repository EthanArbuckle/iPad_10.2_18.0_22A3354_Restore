@implementation PKPaymentMethodRemovedSectionController

- (PKPaymentMethodRemovedSectionController)initWithPaymentMethodName:(id)a3 paymentMethodIdentifier:(id)a4
{
  id v7;
  id v8;
  PKPaymentMethodRemovedSectionController *v9;
  PKPaymentMethodRemovedSectionController *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentMethodRemovedSectionController;
  v9 = -[PKPaymentMethodRemovedSectionController init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_removedPaymentMethodName, a3);
    objc_storeStrong((id *)&v10->_removedPaymentMethodIdentifier, a4);
    PKLocalizedPaymentString(CFSTR("PASS_DETAILS_AUTO_RELOAD_PAYMENT_METHOD_PREVIOUSLY_AUTHORIZED"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pk_uppercaseStringForPreferredLocale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDynamicListSectionController setHeaderText:](v10, "setHeaderText:", v12);

  }
  return v10;
}

- (id)identifiers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("removedpass");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldHighlightItem:(id)a3
{
  return 0;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  PKPaymentMethodSelectionItem *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  if (self->_removedPaymentMethodName && self->_removedPaymentMethodIdentifier)
  {
    v6 = -[PKPaymentMethodSelectionItem initWithIdentifier:]([PKPaymentMethodSelectionItem alloc], "initWithIdentifier:", self->_removedPaymentMethodIdentifier);
    -[PKPaymentMethodSelectionItem setPaymentMethodName:](v6, "setPaymentMethodName:", self->_removedPaymentMethodName);
    v9[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendItems:", v7);

  }
  return v5;
}

- (id)cellRegistrationForItem:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0DC35C8], "registrationWithCellClass:configurationHandler:", objc_opt_class(), &__block_literal_global_238);
}

uint64_t __67__PKPaymentMethodRemovedSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a2, "configureWithItem:", a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedPaymentMethodIdentifier, 0);
  objc_storeStrong((id *)&self->_removedPaymentMethodName, 0);
}

@end
