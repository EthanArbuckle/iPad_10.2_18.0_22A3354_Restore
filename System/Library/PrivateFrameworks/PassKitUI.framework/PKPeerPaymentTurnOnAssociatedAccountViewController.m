@implementation PKPeerPaymentTurnOnAssociatedAccountViewController

- (PKPeerPaymentTurnOnAssociatedAccountViewController)initWithFamilyMember:(id)a3 familyCollection:(id)a4 delegate:(id)a5 passLibraryDataProvider:(id)a6 context:(int64_t)a7 setupType:(int64_t)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  PKPeerPaymentTurnOnAssociatedAccountViewController *v19;
  PKPeerPaymentTurnOnAssociatedAccountViewController *v20;
  void *v21;
  objc_super v23;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v23.receiver = self;
  v23.super_class = (Class)PKPeerPaymentTurnOnAssociatedAccountViewController;
  v19 = -[PKPeerPaymentTurnOnAssociatedAccountViewController initWithStyle:](&v23, sel_initWithStyle_, 1);
  v20 = v19;
  if (v19)
  {
    v19->_setupType = a8;
    objc_storeStrong((id *)&v19->_familyMember, a3);
    objc_storeStrong((id *)&v20->_familyCollection, a4);
    objc_storeWeak((id *)&v20->_delegate, v17);
    v20->_context = a7;
    objc_storeStrong((id *)&v20->_passLibraryDataProvider, a6);
    if (v20->_context == 3)
      PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_FAMILY_TITLE"));
    else
      -[PKFamilyMember labelName](v20->_familyMember, "labelName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentTurnOnAssociatedAccountViewController setTitle:](v20, "setTitle:", v21);

  }
  return v20;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentTurnOnAssociatedAccountViewController;
  -[PKPeerPaymentTurnOnAssociatedAccountViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[PKPeerPaymentTurnOnAssociatedAccountViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("CellReuseIdentifier"));

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return (id)PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_FAMILY_HEADER_TITLE"));
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[PKFamilyMember firstName](self->_familyMember, "firstName", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_TURN_ON_ASSOCIATED_ACCOUNT_FOOTER"), CFSTR("%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("CellReuseIdentifier"), a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_TURN_ON_APPLE_CASH"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v6);

  objc_msgSend(v4, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v8);

  objc_msgSend(v4, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68030]);
  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  char v6;
  PKPeerPaymentAddAssociatedAccountViewController *v7;
  PKFamilyMember *familyMember;
  PKFamilyMemberCollection *familyCollection;
  void *v10;
  PKPassLibraryDataProvider *passLibraryDataProvider;
  id WeakRetained;
  PKNavigationController *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PKPeerPaymentAddAssociatedAccountViewController *v20;

  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", a4, 1);
  -[PKFamilyMemberCollection currentUser](self->_familyCollection, "currentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isOrganizer");

  if ((v6 & 1) != 0)
  {
    v7 = [PKPeerPaymentAddAssociatedAccountViewController alloc];
    familyMember = self->_familyMember;
    familyCollection = self->_familyCollection;
    objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    passLibraryDataProvider = self->_passLibraryDataProvider;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v20 = -[PKPeerPaymentAddAssociatedAccountViewController initWithFamilyMember:familyCollection:webService:passLibraryDataProvider:delegate:context:setupType:](v7, "initWithFamilyMember:familyCollection:webService:passLibraryDataProvider:delegate:context:setupType:", familyMember, familyCollection, v10, passLibraryDataProvider, WeakRetained, self->_context, self->_setupType);

    v13 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v20);
    -[PKNavigationController setModalInPresentation:](v13, "setModalInPresentation:", 1);
    -[PKPeerPaymentTurnOnAssociatedAccountViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);

  }
  else
  {
    v14 = (void *)MEMORY[0x1E0DC3450];
    PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_CANNOT_TURN_ON_ACCOUNT_TITLE"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_CANNOT_TURN_ON_ACCOUNT_MESSAGE"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "alertControllerWithTitle:message:preferredStyle:", v15, v16, 1);
    v20 = (PKPeerPaymentAddAssociatedAccountViewController *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedString(CFSTR("OK_BUTTON_TITLE"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 0, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentAddAssociatedAccountViewController addAction:](v20, "addAction:", v19);

    -[PKPeerPaymentTurnOnAssociatedAccountViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v20, 1, 0);
  }

}

- (PKPeerPaymentAssociatedAccountSetupDelegate)delegate
{
  return (PKPeerPaymentAssociatedAccountSetupDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_passLibraryDataProvider, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
}

@end
