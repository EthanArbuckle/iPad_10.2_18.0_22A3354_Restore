@implementation PKPassPersonalizationTermsViewController

- (PKPassPersonalizationTermsViewController)initWithTermsAndConditions:(id)a3
{
  id v4;
  PKPassPersonalizationTermsViewController *v5;
  uint64_t v6;
  NSString *termsAndConditions;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassPersonalizationTermsViewController;
  v5 = -[PKPassPersonalizationTermsViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    termsAndConditions = v5->_termsAndConditions;
    v5->_termsAndConditions = (NSString *)v6;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKPassPersonalizationTermsViewController;
  -[PKPassPersonalizationTermsViewController dealloc](&v2, sel_dealloc);
}

- (void)loadView
{
  UITextView *v3;
  UITextView *textView;

  v3 = (UITextView *)objc_alloc_init(MEMORY[0x1E0DC3E50]);
  textView = self->_textView;
  self->_textView = v3;

  -[PKPassPersonalizationTermsViewController setView:](self, "setView:", self->_textView);
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)PKPassPersonalizationTermsViewController;
  -[PKPassPersonalizationTermsViewController viewDidLoad](&v12, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x1E0DC34F0]);
  PKLocalizedString(CFSTR("PERSONALIZATION_TERMS_DECLINE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v4, 0, self, sel__declineButtonPressed_);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v7 = objc_alloc(MEMORY[0x1E0DC34F0]);
  PKLocalizedString(CFSTR("PERSONALIZATION_TERMS_ACCEPT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithTitle:style:target:action:", v8, 2, self, sel__acceptButtonPressed_);

  PKLocalizedString(CFSTR("PERSONALIZATION_TERMS_TITLE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassPersonalizationTermsViewController setTitle:](self, "setTitle:", v10);

  v13[0] = v5;
  v13[1] = v6;
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassPersonalizationTermsViewController setToolbarItems:](self, "setToolbarItems:", v11);

  -[UITextView setEditable:](self->_textView, "setEditable:", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPassPersonalizationTermsViewController;
  -[PKPassPersonalizationTermsViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[PKPassPersonalizationTermsViewController _applyTermsAndConditions](self, "_applyTermsAndConditions");
  -[PKPassPersonalizationTermsViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToolbarHidden:animated:", 0, 0);

}

- (void)_applyTermsAndConditions
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  PKAttributedStringByParsingLinksInString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setAttributedText:](self->_textView, "setAttributedText:", v5);

}

- (void)_declineButtonPressed:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "passPersonalizationTermsViewControllerDidDeclineTerms:", self);

}

- (void)_acceptButtonPressed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v4 = (void *)MEMORY[0x1E0DC3450];
  PKLocalizedString(CFSTR("PERSONALIZATION_TERMS_ALERT_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedString(CFSTR("PERSONALIZATION_TERMS_ALERT_MESSAGE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v5, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedString(CFSTR("PERSONALIZATION_TERMS_ALERT_CANCEL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v10);

  v11 = (void *)MEMORY[0x1E0DC3448];
  PKLocalizedString(CFSTR("PERSONALIZATION_TERMS_ALERT_ACCEPT"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__PKPassPersonalizationTermsViewController__acceptButtonPressed___block_invoke;
  v14[3] = &unk_1E3E61D68;
  v14[4] = self;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v13);

  -[PKPassPersonalizationTermsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
}

void __65__PKPassPersonalizationTermsViewController__acceptButtonPressed___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 984));
  objc_msgSend(WeakRetained, "passPersonalizationTermsViewControllerDidAcceptTerms:", *(_QWORD *)(a1 + 32));

}

- (NSString)termsAndConditions
{
  return self->_termsAndConditions;
}

- (void)setTermsAndConditions:(id)a3
{
  objc_storeStrong((id *)&self->_termsAndConditions, a3);
}

- (PKPassPersonalizationTermsViewControllerDelegate)delegate
{
  return (PKPassPersonalizationTermsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_termsAndConditions, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
