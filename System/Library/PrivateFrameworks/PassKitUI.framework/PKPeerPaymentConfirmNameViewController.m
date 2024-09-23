@implementation PKPeerPaymentConfirmNameViewController

- (PKPeerPaymentConfirmNameViewController)initWithFamilyMember:(id)a3 delegate:(id)a4 context:(int64_t)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  PKPeerPaymentConfirmNameViewController *v19;
  PKPeerPaymentConfirmNameViewController *v20;
  objc_super v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0CB3780], "letterCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addCharactersInString:", CFSTR("-. "));
  objc_msgSend(MEMORY[0x1E0D672C8], "paymentSetupFieldWithIdentifier:", *MEMORY[0x1E0D6AF30]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAllowedCharacters:", v11);
  objc_msgSend(v9, "firstName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDefaultValue:", v13);

  objc_msgSend(v12, "setPopulateFromMeCard:", 0);
  objc_msgSend(MEMORY[0x1E0D672C8], "paymentSetupFieldWithIdentifier:", *MEMORY[0x1E0D6AF38]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAllowedCharacters:", v11);
  objc_msgSend(v9, "lastName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDefaultValue:", v15);

  objc_msgSend(v14, "setPopulateFromMeCard:", 0);
  v16 = objc_alloc(MEMORY[0x1E0D67300]);
  v23[0] = v12;
  v23[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithPaymentSetupFields:", v17);

  v22.receiver = self;
  v22.super_class = (Class)PKPeerPaymentConfirmNameViewController;
  v19 = -[PKPaymentSetupFieldsViewController initWithWebService:context:setupDelegate:setupFieldsModel:](&v22, sel_initWithWebService_context_setupDelegate_setupFieldsModel_, 0, a5, self, v18);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_familyMember, a3);
    objc_storeWeak((id *)&v20->_delegate, v10);
  }

  return v20;
}

- (void)viewDidLoad
{
  UIBarButtonItem *v3;
  UIBarButtonItem *cancelButton;
  void *v5;
  UIBarButtonItem *v6;
  UIBarButtonItem *doneButton;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t IsSetupAssistant;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;
  UIBarButtonItem *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)PKPeerPaymentConfirmNameViewController;
  -[PKPaymentSetupFieldsViewController viewDidLoad](&v26, sel_viewDidLoad);
  -[PKPaymentSetupFieldsViewController setHidesBackButton:animated:](self, "setHidesBackButton:animated:", 1, 0);
  -[PKPaymentSetupTableViewController context](self, "context");
  if ((PKPaymentSetupContextIsSetupAssistant() & 1) == 0)
  {
    v3 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelPressed);
    cancelButton = self->_cancelButton;
    self->_cancelButton = v3;

    v28[0] = self->_cancelButton;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupFieldsViewController _setLeftBarButtonItems:animated:](self, "_setLeftBarButtonItems:animated:", v5, 0);

  }
  v6 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__donePressed);
  doneButton = self->_doneButton;
  self->_doneButton = v6;

  v27 = self->_doneButton;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupFieldsViewController _setRightBarButtonItems:animated:](self, "_setRightBarButtonItems:animated:", v8, 0);

  -[PKPaymentSetupTableViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAllowsMultipleSelection:", 0);
  PKPassKitUIBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLForResource:withExtension:", CFSTR("AppleCashIcon"), CFSTR("pdf"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = PKUIScreenScale();
  PKUIImageFromPDF(v11, 80.0, 80.0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v13);
  objc_msgSend(v14, "setContentMode:", 1);
  objc_msgSend(v14, "setClipsToBounds:", 1);
  objc_msgSend(v14, "_setContinuousCornerRadius:", 20.0);
  -[PKPaymentSetupFieldsViewController headerView](self, "headerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTopPadding:", 30.0);
  -[PKPeerPaymentConfirmNameViewController traitCollection](self, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "userInterfaceIdiom");

  IsSetupAssistant = 0;
  if ((v17 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[PKPaymentSetupTableViewController context](self, "context", 0);
    IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
  }
  objc_msgSend(v15, "setStyle:", IsSetupAssistant);
  objc_msgSend(v15, "titleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_CONFIRM_NAME_TITLE"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setText:", v20);

  objc_msgSend(v15, "subtitleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_CONFIRM_NAME_MESSAGE"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setText:", v22);

  objc_msgSend(v15, "setImageView:", v14);
  -[PKPaymentSetupTableViewController dockView](self, "dockView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "footerView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setManualEntryButton:", 0);

  objc_msgSend(v23, "footerView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setSetupLaterButton:", 0);

  objc_msgSend(v23, "setPrimaryButton:", 0);
}

- (void)showSpinner:(BOOL)a3
{
  UIBarButtonItem *spinnerButton;
  void *v5;
  UIBarButtonItem *v6;
  UIBarButtonItem *v7;
  UIBarButtonItem **p_doneButton;
  void *v9;
  UIBarButtonItem *doneButton;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (self->_showSpinner != a3)
  {
    self->_showSpinner = a3;
    -[UIBarButtonItem setEnabled:](self->_cancelButton, "setEnabled:", !a3);
    if (self->_showSpinner)
    {
      spinnerButton = self->_spinnerButton;
      if (!spinnerButton)
      {
        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
        objc_msgSend(v5, "startAnimating");
        v6 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v5);
        v7 = self->_spinnerButton;
        self->_spinnerButton = v6;

        spinnerButton = self->_spinnerButton;
      }
      v11[0] = spinnerButton;
      p_doneButton = (UIBarButtonItem **)v11;
    }
    else
    {
      doneButton = self->_doneButton;
      p_doneButton = &doneButton;
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", p_doneButton, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupFieldsViewController _setRightBarButtonItems:animated:](self, "_setRightBarButtonItems:animated:", v9, 0);

  }
}

- (void)_continue
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;

  -[PKPeerPaymentConfirmNameViewController showSpinner:](self, "showSpinner:", 1);
  -[PKPaymentSetupFieldsViewController fieldForIdentifier:](self, "fieldForIdentifier:", *MEMORY[0x1E0D6AF30]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "submissionString");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[PKPaymentSetupFieldsViewController fieldForIdentifier:](self, "fieldForIdentifier:", *MEMORY[0x1E0D6AF38]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "submissionString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "confirmNameViewController:enteredFirstName:lastName:", self, v8, v5);
  else
    -[PKPeerPaymentConfirmNameViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_cancelPressed
{
  PKPeerPaymentConfirmNameViewControllerDelegate **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v4, "confirmNameViewControllerCancelled:", self);

  }
  else
  {
    -[PKPeerPaymentConfirmNameViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (PKPeerPaymentConfirmNameViewControllerDelegate)delegate
{
  return (PKPeerPaymentConfirmNameViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spinnerButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
}

@end
