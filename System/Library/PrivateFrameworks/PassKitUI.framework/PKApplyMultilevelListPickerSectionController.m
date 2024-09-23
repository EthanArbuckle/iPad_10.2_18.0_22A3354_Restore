@implementation PKApplyMultilevelListPickerSectionController

- (PKApplyMultilevelListPickerSectionController)initWithController:(id)a3 applyPage:(id)a4 picker:(id)a5
{
  id v9;
  PKApplyMultilevelListPickerSectionController *v10;
  PKApplyMultilevelListPickerSectionController *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PKApplyMultilevelListPickerSectionController;
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
  PKApplyMultilevelPickerRow *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
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
  v12 = -[PKApplyMultilevelPickerRow initWithPicker:]([PKApplyMultilevelPickerRow alloc], "initWithPicker:", self->_picker);
  v15[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendItems:", v13);

LABEL_9:
  return v6;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;

  v6 = a3;
  -[PKApplyCollectionViewSectionController listLayoutConfigurationWithLayoutEnvironment:sectionIdentifier:](self, "listLayoutConfigurationWithLayoutEnvironment:sectionIdentifier:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "contentInsets");
  if (self->_isTopmostSection)
    v9 = 7.0;
  objc_msgSend(v8, "setContentInsets:", v9);

  return v8;
}

- (void)didSelectItem:(id)a3
{
  id v4;
  PKApplyFocusedPickerViewController *v5;
  void *v6;
  PKApplyFocusedPickerViewController *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v10;
    v5 = [PKApplyFocusedPickerViewController alloc];
    objc_msgSend(v4, "picker");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[PKApplyFocusedPickerViewController initWithPicker:](v5, "initWithPicker:", v6);
    -[PKApplyCollectionViewSectionController dynamicCollectionDelegate](self, "dynamicCollectionDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKApplyFocusedPickerViewController setDynamicCollectionDelegate:](v7, "setDynamicCollectionDelegate:", v8);

    -[PKApplyCollectionViewSectionController dynamicCollectionDelegate](self, "dynamicCollectionDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pushViewController:animated:", v7, 1);

  }
}

- (BOOL)shouldHighlightItem:(id)a3
{
  return 1;
}

- (BOOL)isTopmostSection
{
  return self->_isTopmostSection;
}

- (void)setIsTopmostSection:(BOOL)a3
{
  self->_isTopmostSection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_picker, 0);
}

@end
