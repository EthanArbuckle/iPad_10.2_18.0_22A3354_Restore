@implementation PKContactPicker

- (PKContactPicker)initWithSelectionHandler:(id)a3 cancelationHandler:(id)a4
{
  id v6;
  id v7;
  PKContactPicker *v8;
  void *v9;
  id selectionHandler;
  void *v11;
  id cancelationHandler;
  UIViewController *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  UIViewController *pickerViewController;
  objc_super v19;
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PKContactPicker;
  v8 = -[PKContactPicker init](&v19, sel_init);
  if (v8)
  {
    v9 = _Block_copy(v6);
    selectionHandler = v8->_selectionHandler;
    v8->_selectionHandler = v9;

    v11 = _Block_copy(v7);
    cancelationHandler = v8->_cancelationHandler;
    v8->_cancelationHandler = v11;

    v13 = (UIViewController *)objc_alloc_init(MEMORY[0x1E0C974B0]);
    -[UIViewController setShouldDisplaySuggestionsController:](v13, "setShouldDisplaySuggestionsController:", 1);
    -[UIViewController setAllowsEditing:](v13, "setAllowsEditing:", 1);
    -[UIViewController setDelegate:](v13, "setDelegate:", v8);
    v14 = *MEMORY[0x1E0C966A8];
    v20[0] = *MEMORY[0x1E0C967C0];
    v20[1] = v14;
    v15 = *MEMORY[0x1E0C967A0];
    v20[2] = *MEMORY[0x1E0C966D0];
    v20[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController setDisplayedPropertyKeys:](v13, "setDisplayedPropertyKeys:", v16);

    pickerViewController = v8->_pickerViewController;
    v8->_pickerViewController = v13;

  }
  return v8;
}

- (void)contactPickerDidCancel:(id)a3
{
  void (**cancelationHandler)(void);

  cancelationHandler = (void (**)(void))self->_cancelationHandler;
  if (cancelationHandler)
    cancelationHandler[2]();
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;

  if (self->_selectionHandler)
  {
    v5 = (objc_class *)MEMORY[0x1E0D66C48];
    v6 = a4;
    v7 = (id)objc_msgSend([v5 alloc], "initWithCNContact:", v6);

    (*((void (**)(void))self->_selectionHandler + 2))();
  }
}

- (UIViewController)pickerViewController
{
  return self->_pickerViewController;
}

- (void)setPickerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_pickerViewController, a3);
}

- (id)selectionHandler
{
  return self->_selectionHandler;
}

- (void)setSelectionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)cancelationHandler
{
  return self->_cancelationHandler;
}

- (void)setCancelationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelationHandler, 0);
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_pickerViewController, 0);
}

@end
