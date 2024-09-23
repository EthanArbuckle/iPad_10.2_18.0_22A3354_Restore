@implementation PKPaymentServiceProviderProductsListSectionController

- (PKPaymentServiceProviderProductsListSectionController)init
{

  return 0;
}

- (PKPaymentServiceProviderProductsListSectionController)initWithIdentifier:(id)a3 serviceProviderProducts:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PKPaymentServiceProviderProductsListSectionController *v9;
  uint64_t v10;
  NSArray *listItems;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentServiceProviderProductsListSectionController;
  v9 = -[PKPaymentSetupListSectionController initWithIdentifiers:](&v13, sel_initWithIdentifiers_, v8);

  if (v9)
  {
    objc_msgSend(v7, "pk_arrayByApplyingBlock:", &__block_literal_global_53);
    v10 = objc_claimAutoreleasedReturnValue();
    listItems = v9->_listItems;
    v9->_listItems = (NSArray *)v10;

  }
  return v9;
}

PKServiceProviderProductListItem *__100__PKPaymentServiceProviderProductsListSectionController_initWithIdentifier_serviceProviderProducts___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKServiceProviderProductListItem *v3;
  void *v4;
  void *v5;

  v2 = a2;
  v3 = objc_alloc_init(PKServiceProviderProductListItem);
  objc_msgSend(v2, "localizedDisplayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupListItem setTitle:](v3, "setTitle:", v4);

  objc_msgSend(v2, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupListItem setSubtitle:](v3, "setSubtitle:", v5);

  -[PKPaymentSetupListItem setDisplayChevron:](v3, "setDisplayChevron:", 1);
  -[PKServiceProviderProductListItem setProduct:](v3, "setProduct:", v2);

  return v3;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  objc_msgSend(v5, "appendItems:", self->_listItems);
  return v5;
}

- (void)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PKPaymentServiceProviderProductsListSectionController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "product");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "didSelectServiceProviderProduct:", v5);
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  -[PKPaymentSetupListSectionController defaultListLayout](self, "defaultListLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "contentInsets");
  objc_msgSend(v7, "setContentInsets:", 16.0);

  return v7;
}

- (PKPaymentServiceProviderProductsListSectionControllerDelegate)delegate
{
  return (PKPaymentServiceProviderProductsListSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_listItems, 0);
}

@end
