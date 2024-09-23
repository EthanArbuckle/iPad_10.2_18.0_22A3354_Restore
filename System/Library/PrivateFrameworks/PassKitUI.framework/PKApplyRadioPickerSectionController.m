@implementation PKApplyRadioPickerSectionController

- (PKApplyRadioPickerSectionController)initWithController:(id)a3 applyPage:(id)a4 picker:(id)a5
{
  id v9;
  PKApplyRadioPickerSectionController *v10;
  PKApplyRadioPickerSectionController *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PKApplyRadioPickerSectionController;
  v10 = -[PKApplyCollectionViewSectionController initWithController:applyPage:](&v13, sel_initWithController_applyPage_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_picker, a5);

  return v11;
}

- (id)identifiers
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[PKPaymentSetupFieldPicker identifier](self->_picker, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;

  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  -[PKPaymentSetupFieldPicker identifier](self->_picker, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  v9 = v7;
  if (v9 == v8)
  {

  }
  else
  {
    v10 = v9;
    if (!v8 || !v9)
    {

      goto LABEL_9;
    }
    v11 = objc_msgSend(v8, "isEqualToString:", v9);

    if (!v11)
      goto LABEL_9;
  }
  -[PKApplyRadioPickerSectionController _configureContentSection:](self, "_configureContentSection:", v6);
LABEL_9:

  return v6;
}

- (id)listLayoutConfigurationWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKApplyRadioPickerSectionController;
  -[PKApplyCollectionViewSectionController listLayoutConfigurationWithLayoutEnvironment:sectionIdentifier:](&v6, sel_listLayoutConfigurationWithLayoutEnvironment_sectionIdentifier_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setItemSeparatorHandler:", &__block_literal_global_18);
  return v4;
}

id __102__PKApplyRadioPickerSectionController_listLayoutConfigurationWithLayoutEnvironment_sectionIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;

  v4 = a3;
  if (!objc_msgSend(a2, "row"))
    objc_msgSend(v4, "setBottomSeparatorVisibility:", 2);
  return v4;
}

- (void)_configureContentSection:(id)a3
{
  PKApplyRadioPickerTitleRow *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  PKApplyRadioPickerRow *v12;
  void *v13;
  void *v14;
  PKApplyRadioPickerRow *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  id v22;
  _QWORD v23[5];
  id v24;
  id location;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  PKApplyRadioPickerRow *v30;
  _BYTE v31[128];
  _QWORD v32[3];

  v32[1] = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v4 = [PKApplyRadioPickerTitleRow alloc];
  -[PKPaymentSetupFieldPicker localizedDisplayName](self->_picker, "localizedDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKApplyRadioPickerTitleRow initWithTitle:](v4, "initWithTitle:", v5);

  v20 = (void *)v6;
  v32[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "appendItems:", v7);

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[PKPaymentSetupFieldPicker pickerItems](self->_picker, "pickerItems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v12 = [PKApplyRadioPickerRow alloc];
        objc_msgSend(v11, "localizedDisplayName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "submissionValue");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[PKApplyRadioPickerRow initWithTitle:submissionValue:](v12, "initWithTitle:submissionValue:", v13, v14);

        -[PKPaymentSetupFieldPicker currentValue](self->_picker, "currentValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "submissionValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "submissionValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKApplyRadioPickerRow setSelected:](v15, "setSelected:", PKEqualObjects());

        objc_initWeak(&location, self);
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __64__PKApplyRadioPickerSectionController__configureContentSection___block_invoke;
        v23[3] = &unk_1E3E61B68;
        objc_copyWeak(&v24, &location);
        v23[4] = v11;
        -[PKApplyRadioPickerRow setAction:](v15, "setAction:", v23);
        v30 = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "appendItems:", v19);

        objc_destroyWeak(&v24);
        objc_destroyWeak(&location);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v8);
  }

}

void __64__PKApplyRadioPickerSectionController__configureContentSection___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v3 = WeakRetained[11];
    objc_msgSend(v3, "setCurrentValue:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v7, "dynamicCollectionDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "recomputeSectionsWithReload:", 1);
      objc_msgSend(v3, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reloadDataForSectionIdentifier:animated:", v6, 1);

    }
    WeakRetained = v7;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_picker, 0);
}

@end
