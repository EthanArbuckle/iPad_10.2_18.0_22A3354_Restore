@implementation PKApplyRequiredFieldSectionController

- (PKApplyRequiredFieldSectionController)initWithController:(id)a3 applyPage:(id)a4 field:(id)a5
{
  id v9;
  PKApplyRequiredFieldSectionController *v10;
  PKApplyRequiredFieldSectionController *v11;
  PKApplyRequiredFieldRow *v12;
  uint64_t v13;
  NSArray *items;
  objc_super v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PKApplyRequiredFieldSectionController;
  v10 = -[PKApplyCollectionViewSectionController initWithController:applyPage:](&v16, sel_initWithController_applyPage_, a3, a4);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_field, a5);
    v12 = -[PKApplyRequiredFieldRow initWithField:cellDelegate:]([PKApplyRequiredFieldRow alloc], "initWithField:cellDelegate:", v11->_field, v11);
    v17[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v13 = objc_claimAutoreleasedReturnValue();
    items = v11->_items;
    v11->_items = (NSArray *)v13;

  }
  return v11;
}

- (id)identifiers
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[PKPaymentSetupField identifier](self->_field, "identifier");
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
  -[PKPaymentSetupField localizedDisplayName](self->_field, "localizedDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentSetupField identifier](self->_field, "identifier");
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

  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  -[PKPaymentSetupField identifier](self->_field, "identifier");
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
  objc_msgSend(v6, "appendItems:", self->_items);
LABEL_9:

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
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PKApplyCollectionViewSectionController dynamicCollectionDelegate](self, "dynamicCollectionDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cellForItem:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "beginEditing");
  }

}

- (BOOL)textFieldShouldReturn:(id)a3 forListCell:(id)a4
{
  objc_msgSend(a4, "endEditing", a3);
  return 1;
}

- (void)textFieldDidChangeSelection:(id)a3 forListCell:(id)a4
{
  void *v5;
  id v6;

  objc_msgSend(a3, "text");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupField setCurrentValue:](self->_field, "setCurrentValue:");
  if ((-[PKPaymentSetupField submissionStringMeetsAllRequirements](self->_field, "submissionStringMeetsAllRequirements") & 1) == 0)-[PKPaymentSetupField setCurrentValue:](self->_field, "setCurrentValue:", 0);
  -[PKApplyCollectionViewSectionController dynamicCollectionDelegate](self, "dynamicCollectionDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recomputeSectionsWithReload:", 0);

}

- (PKTextFieldCollectionViewListCellDelegate)cellDelegate
{
  return self->_cellDelegate;
}

- (void)setCellDelegate:(id)a3
{
  self->_cellDelegate = (PKTextFieldCollectionViewListCellDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_field, 0);
}

@end
