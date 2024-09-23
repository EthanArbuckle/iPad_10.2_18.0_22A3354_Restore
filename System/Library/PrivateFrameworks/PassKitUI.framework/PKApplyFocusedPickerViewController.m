@implementation PKApplyFocusedPickerViewController

- (PKApplyFocusedPickerViewController)initWithPicker:(id)a3
{
  id v5;
  PKApplyFocusedPickerViewController *v6;
  PKApplyFocusedPickerViewController *v7;
  PKApplyListPickerSectionController *v8;
  PKApplyListPickerSectionController *pickerSectionController;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKApplyFocusedPickerViewController;
  v6 = -[PKApplyFocusedPickerViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_picker, a3);
    v8 = -[PKApplyListPickerSectionController initWithPicker:]([PKApplyListPickerSectionController alloc], "initWithPicker:", v7->_picker);
    pickerSectionController = v7->_pickerSectionController;
    v7->_pickerSectionController = v8;

    -[PKApplyCollectionViewSectionController setDynamicCollectionDelegate:](v7->_pickerSectionController, "setDynamicCollectionDelegate:", v7);
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKApplyFocusedPickerViewController;
  -[PKDynamicCollectionViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[PKDynamicCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyFocusedPickerViewController recomputeSectionsWithReload:](self, "recomputeSectionsWithReload:", 0);
  PKProvisioningBackgroundColor();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);
  -[PKApplyFocusedPickerViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[PKApplyFocusedPickerViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupFieldPicker localizedDisplayName](self->_picker, "localizedDisplayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v7);

  objc_msgSend(v6, "setBackButtonDisplayMode:", 0);
}

- (id)_recomputeSections
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[PKPaymentSetupFieldPicker pickerType](self->_picker, "pickerType") == 2)
    objc_msgSend(v3, "addObject:", self->_pickerSectionController);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (void)reloadDataAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PKApplyFocusedPickerViewController;
  -[PKDynamicCollectionViewController reloadDataAnimated:](&v6, sel_reloadDataAnimated_);
  -[PKApplyFocusedPickerViewController _recomputeSections](self, "_recomputeSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDynamicCollectionViewController setSections:animated:](self, "setSections:animated:", v5, v3);

}

- (void)recomputeSectionsWithReload:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[PKApplyFocusedPickerViewController _recomputeSections](self, "_recomputeSections");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[PKDynamicCollectionViewController setSections:animated:](self, "setSections:animated:", v7, 1);
  -[PKApplyFocusedPickerViewController dynamicCollectionDelegate](self, "dynamicCollectionDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "recomputeSectionsWithReload:", v3);

}

- (void)didSelectCell
{
  void *v3;
  id v4;
  id v5;

  -[PKPaymentSetupFieldPicker currentValue](self->_picker, "currentValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PKApplyFocusedPickerViewController navigationController](self, "navigationController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 1);

  }
}

- (PKApplyCollectionViewSectionControllerDelegate)dynamicCollectionDelegate
{
  return self->_dynamicCollectionDelegate;
}

- (void)setDynamicCollectionDelegate:(id)a3
{
  self->_dynamicCollectionDelegate = (PKApplyCollectionViewSectionControllerDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerSectionController, 0);
  objc_storeStrong((id *)&self->_picker, 0);
}

@end
