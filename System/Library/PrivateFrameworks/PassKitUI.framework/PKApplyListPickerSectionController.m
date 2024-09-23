@implementation PKApplyListPickerSectionController

- (PKApplyListPickerSectionController)initWithPicker:(id)a3
{
  id v5;
  PKApplyListPickerSectionController *v6;
  PKApplyListPickerSectionController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKApplyListPickerSectionController;
  v6 = -[PKApplyCollectionViewSectionController initWithController:applyPage:](&v9, sel_initWithController_applyPage_, 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_picker, a3);

  return v7;
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

- (id)headerAttributedStringForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPaymentSetupFieldPicker localizedDescription](self->_picker, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentSetupFieldPicker identifier](self->_picker, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  v9 = v7;
  v10 = v9;
  if (v9 == v8)
  {

  }
  else
  {
    if (!v8 || !v9)
    {

LABEL_10:
      goto LABEL_11;
    }
    v11 = objc_msgSend(v8, "isEqualToString:", v9);

    if (!v11)
      goto LABEL_10;
  }
  v12 = objc_msgSend(v6, "length");

  if (!v12)
  {
LABEL_11:
    v17 = 0;
    goto LABEL_12;
  }
  v13 = objc_alloc(MEMORY[0x1E0CB3498]);
  v19[0] = *MEMORY[0x1E0DC1138];
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4AB8], (void *)*MEMORY[0x1E0DC4918], 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v13, "initWithString:attributes:", v6, v16);

LABEL_12:
  return v17;
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  PKApplyListPickerRow *v17;
  void *v18;
  void *v19;
  void *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  PKApplyListPickerRow *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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

      goto LABEL_16;
    }
    v11 = objc_msgSend(v8, "isEqualToString:", v9);

    if (!v11)
      goto LABEL_16;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[PKPaymentSetupFieldPicker pickerItems](self->_picker, "pickerItems", v8);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v17 = -[PKApplyListPickerRow initWithPickerItem:]([PKApplyListPickerRow alloc], "initWithPickerItem:", v16);
        -[PKPaymentSetupFieldPicker currentValue](self->_picker, "currentValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKApplyListPickerRow setSelected:](v17, "setSelected:", v18 == v16);

        v27 = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendItems:", v19);

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v13);
  }

  v8 = v21;
LABEL_16:

  return v6;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[PKApplyCollectionViewSectionController listLayoutConfigurationWithLayoutEnvironment:sectionIdentifier:](self, "listLayoutConfigurationWithLayoutEnvironment:sectionIdentifier:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "contentInsets");
  objc_msgSend(v8, "setContentInsets:");

  return v8;
}

- (void)didSelectItem:(id)a3
{
  char isKindOfClass;
  void *v5;
  PKPaymentSetupFieldPicker *picker;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = v11;
  if ((isKindOfClass & 1) != 0)
  {
    picker = self->_picker;
    objc_msgSend(v11, "pickerItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupFieldPicker setCurrentValue:](picker, "setCurrentValue:", v7);

    -[PKApplyCollectionViewSectionController dynamicCollectionDelegate](self, "dynamicCollectionDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "recomputeSectionsWithReload:", 1);
      -[PKPaymentSetupFieldPicker identifier](self->_picker, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "reloadDataForSectionIdentifier:animated:", v10, 1);

      objc_msgSend(v9, "deselectCells");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v9, "didSelectCell");
    }

    v5 = v11;
  }

}

- (BOOL)shouldHighlightItem:(id)a3
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_picker, 0);
}

@end
