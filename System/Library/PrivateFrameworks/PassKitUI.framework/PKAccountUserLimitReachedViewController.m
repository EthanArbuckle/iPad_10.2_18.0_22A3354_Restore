@implementation PKAccountUserLimitReachedViewController

- (PKAccountUserLimitReachedViewController)initWithAccount:(id)a3 context:(int64_t)a4
{
  id v7;
  PKAccountUserLimitReachedViewController *v8;
  PKAccountUserLimitReachedViewController *v9;
  NSNumberFormatter *v10;
  NSNumberFormatter *maximumAccountUsersFormatter;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKAccountUserLimitReachedViewController;
  v8 = -[PKExplanationViewController initWithContext:](&v13, sel_initWithContext_, a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_account, a3);
    v10 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    maximumAccountUsersFormatter = v9->_maximumAccountUsersFormatter;
    v9->_maximumAccountUsersFormatter = v10;

    -[NSNumberFormatter setNumberStyle:](v9->_maximumAccountUsersFormatter, "setNumberStyle:", 5);
    -[PKExplanationViewController setShowDoneButton:](v9, "setShowDoneButton:", 0);
    -[PKExplanationViewController setShowCancelButton:](v9, "setShowCancelButton:", 0);
  }

  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKAccountUserLimitReachedViewController;
  -[PKExplanationViewController viewDidLoad](&v14, sel_viewDidLoad);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKAccount feature](self->_account, "feature");
  objc_msgSend(v3, "setShowPrivacyView:", 0);
  PKFeatureApplicationHeaderImageWithImage(v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v5);
  objc_msgSend(v3, "setTopMargin:", 30.0);
  PKLocalizedMadisonString(CFSTR("ACCOUNT_USER_LIMIT_REACHED_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleText:", v6);
  -[PKAccount accountUserInvitationAllowedFeatureDescriptor](self->_account, "accountUserInvitationAllowedFeatureDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "maximumAccountUsers");

  PKLocalizedString(CFSTR("ACCOUNT_USER_LIMIT_REACHED_BODY"), CFSTR("%lu"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBodyText:", v9);
  PKLocalizedMadisonString(CFSTR("ABOUT_APPLE_CARD_FAMILY"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBodyButtonText:", v10);
  PKLocalizedFeatureString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dockView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "primaryButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:forState:", v11, 0);

}

- (void)explanationViewDidSelectContinue:(id)a3
{
  -[PKAccountUserLimitReachedViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)explanationViewDidSelectBodyButton:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", CFSTR("https://support.apple.com/ht212143?cid=mc-ols-applecard-article_h212143-ios_ui-01212021"));
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openSensitiveURL:withOptions:", v4, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumAccountUsersFormatter, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
