@implementation PKAccountClosedViewController

- (PKAccountClosedViewController)initWithAccount:(id)a3 accountUserCollection:(id)a4 familyMemberCollection:(id)a5 context:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  PKAccountClosedViewController *v14;
  PKAccountClosedViewController *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKAccountClosedViewController;
  v14 = -[PKExplanationViewController initWithContext:](&v17, sel_initWithContext_, a6);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_account, a3);
    objc_storeStrong((id *)&v15->_accountUserCollection, a4);
    objc_storeStrong((id *)&v15->_familyMemberCollection, a5);
  }

  return v15;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  PKFamilyMemberCollection *familyMemberCollection;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PKAccountClosedViewController;
  -[PKExplanationViewController viewDidLoad](&v18, sel_viewDidLoad);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowPrivacyView:", 0);
  PKLocalizedMadisonString(CFSTR("ACCOUNT_CLOSURE_MORE_INFO_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleText:", v4);

  -[PKAccountUserCollection coOwnerAccountUser](self->_accountUserCollection, "coOwnerAccountUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  familyMemberCollection = self->_familyMemberCollection;
  objc_msgSend(v5, "altDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKFamilyMemberCollection familyMemberForAltDSID:](familyMemberCollection, "familyMemberForAltDSID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D66C60];
  objc_msgSend(v5, "nameComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contactForFamilyMember:nameComponents:imageData:", v8, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "givenName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedMadisonString(CFSTR("ACCOUNT_CLOSURE_MORE_INFO_BODY"), CFSTR("%@"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setBodyText:", v13);
  PKLocalizedMadisonString(CFSTR("ACCOUNT_CLOSURE_MORE_INFO_LINK"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBodyButtonText:", v14);

  objc_msgSend(v3, "dockView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "primaryButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedMadisonString(CFSTR("ACCOUNT_CLOSURE_MORE_INFO_DONE"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTitle:forState:", v17, 0);

}

- (void)explanationViewDidSelectContinue:(id)a3
{
  -[PKAccountClosedViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)explanationViewDidSelectBodyButton:(id)a3
{
  void *v4;
  void *v5;
  PKNavigationController *v6;
  PKPaymentMoreInformationViewController *v7;

  v7 = -[PKPaymentMoreInformationViewController initWithContext:]([PKPaymentMoreInformationViewController alloc], "initWithContext:", -[PKExplanationViewController context](self, "context"));
  PKLocalizedMadisonString(CFSTR("ACCOUNT_CLOSURE_LEGAL_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentMoreInformationViewController setDetailTitle:](v7, "setDetailTitle:", v4);

  PKLocalizedMadisonString(CFSTR("ACCOUNT_CLOSURE_LEGAL_BODY"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentMoreInformationViewController setDetailBody:](v7, "setDetailBody:", v5);

  v6 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v7);
  -[PKAccountClosedViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyMemberCollection, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
