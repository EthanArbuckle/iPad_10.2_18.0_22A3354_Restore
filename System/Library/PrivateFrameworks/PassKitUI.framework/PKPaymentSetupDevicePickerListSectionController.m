@implementation PKPaymentSetupDevicePickerListSectionController

- (PKPaymentSetupDevicePickerListSectionController)initWithWebServices:(id)a3 title:(id)a4 subtitle:(id)a5 image:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PKPaymentSetupDevicePickerListSectionController *v15;
  PKPaymentSetupDevicePickerListSectionController *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, uint64_t, void *);
  void *v24;
  id v25;
  id location;
  objc_super v27;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v27.receiver = self;
  v27.super_class = (Class)PKPaymentSetupDevicePickerListSectionController;
  v15 = -[PKPaymentSetupDevicePickerListSectionController init](&v27, sel_init);
  v16 = v15;
  if (v15)
  {
    -[PKDynamicListSectionController setIdentifiers:](v15, "setIdentifiers:", &unk_1E3FAE7B8);
    objc_storeStrong((id *)&v16->_items, a3);
    objc_storeStrong((id *)&v16->_title, a4);
    objc_storeStrong((id *)&v16->_subtitle, a5);
    objc_storeStrong((id *)&v16->_cardImage, a6);
    objc_initWeak(&location, v16);
    v17 = (void *)MEMORY[0x1E0DC35C8];
    v18 = objc_opt_class();
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __92__PKPaymentSetupDevicePickerListSectionController_initWithWebServices_title_subtitle_image___block_invoke;
    v24 = &unk_1E3E6DE40;
    objc_copyWeak(&v25, &location);
    objc_msgSend(v17, "registrationWithCellClass:configurationHandler:", v18, &v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupDevicePickerListSectionController setCellRegistration:](v16, "setCellRegistration:", v19, v21, v22, v23, v24);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v16;
}

void __92__PKPaymentSetupDevicePickerListSectionController_initWithWebServices_title_subtitle_image___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
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
    v8 = (id)objc_msgSend(WeakRetained, "decorateListCell:forRowItem:", v9, v6);

  }
}

- (id)decorateListCell:(id)a3 forRowItem:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0DC39A8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "subtitleCellConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "targetDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deviceDescriptionForPaymentWebService:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setText:", v10);
  objc_msgSend(v8, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 0.0);
  objc_msgSend(v7, "setContentConfiguration:", v8);
  objc_msgSend(v7, "setConfigurationUpdateHandler:", &__block_literal_global_110);
  v11 = objc_alloc_init(MEMORY[0x1E0DC3568]);
  v14[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessories:", v12);

  return v8;
}

void __79__PKPaymentSetupDevicePickerListSectionController_decorateListCell_forRowItem___block_invoke(uint64_t a1, void *a2, void *a3)
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
    PKProvisioningSecondaryBackgroundColor();
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
  objc_msgSend(v6, "setBackgroundColor:", v7);

  objc_msgSend(v5, "setBackgroundConfiguration:", v6);
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  objc_msgSend(v5, "appendItems:", self->_items);
  return v5;
}

- (void)didSelectItem:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "didSelectWebService:", v5);

  }
}

- (id)defaultListLayout
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35A8]), "initWithAppearance:", 2);
  PKProvisioningBackgroundColor();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  return v2;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  -[PKPaymentSetupDevicePickerListSectionController defaultListLayout](self, "defaultListLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHeaderMode:", 1);
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (Class)supplementaryRegistrationClassForKind:(id)a3 sectionIdentifier:(id)a4
{
  return (Class)objc_opt_class();
}

- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5
{
  objc_msgSend(a3, "configureWithUIImage:title:subtitle:", self->_cardImage, self->_title, self->_subtitle);
}

- (UICollectionViewCellRegistration)cellRegistration
{
  return self->cellRegistration;
}

- (void)setCellRegistration:(id)a3
{
  objc_storeStrong((id *)&self->cellRegistration, a3);
}

- (PKPaymentSetupDevicePickerListSectionControllerDelegate)delegate
{
  return (PKPaymentSetupDevicePickerListSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->cellRegistration, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_cardImage, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
