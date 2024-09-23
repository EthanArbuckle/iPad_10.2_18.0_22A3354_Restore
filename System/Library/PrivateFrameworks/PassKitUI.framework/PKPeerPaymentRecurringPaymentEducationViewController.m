@implementation PKPeerPaymentRecurringPaymentEducationViewController

- (PKPeerPaymentRecurringPaymentEducationViewController)initWithContext:(int64_t)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5
{
  id v9;
  id v10;
  PKPeerPaymentRecurringPaymentEducationViewController *v11;
  PKPeerPaymentRecurringPaymentEducationViewController *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  PKPeerPaymentAccount *account;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  PKPaymentPass *paymentPass;
  objc_super v23;

  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)PKPeerPaymentRecurringPaymentEducationViewController;
  v11 = -[PKExplanationViewController initWithContext:](&v23, sel_initWithContext_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_transactionSourceCollection, a4);
    objc_storeStrong((id *)&v12->_familyCollection, a5);
    objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "targetDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "account");
    v15 = objc_claimAutoreleasedReturnValue();
    account = v12->_account;
    v12->_account = (PKPeerPaymentAccount *)v15;

    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentAccount associatedPassUniqueID](v12->_account, "associatedPassUniqueID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "passWithUniqueID:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "paymentPass");
    v20 = objc_claimAutoreleasedReturnValue();
    paymentPass = v12->_paymentPass;
    v12->_paymentPass = (PKPaymentPass *)v20;

  }
  return v12;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  PKTextRangeHyperlink *v12;
  PKTextRangeHyperlink *v13;
  PKMultiHyperlinkView *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id location;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)PKPeerPaymentRecurringPaymentEducationViewController;
  -[PKExplanationViewController viewDidLoad](&v25, sel_viewDidLoad);
  -[PKPeerPaymentRecurringPaymentEducationViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  -[PKExplanationViewController setShowCancelButton:](self, "setShowCancelButton:", 1);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowPrivacyView:", 0);
  objc_msgSend(v3, "setDelegate:", self);
  v4 = (void *)MEMORY[0x1E0DC3870];
  PKPassKitUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageNamed:inBundle:withConfiguration:", CFSTR("Hero_Apple_Cash_Recurring"), v5, 0);
  v6 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setImage:", v6);
  PKLocalizedPeerPaymentRecurringString(CFSTR("RECURRING_PAYMENT_EDUCATION_TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleText:", v7);

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  PKLocalizedPeerPaymentRecurringString(CFSTR("RECURRING_PAYMENT_EDUCATION_MESSAGE"));
  v9 = objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentRecurringString(CFSTR("RECURRING_PAYMENT_EDUCATION_MESSAGE_LINK"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentRecurringString(CFSTR("RECURRING_PAYMENT_EDUCATION_MESSAGE_FORMAT"), CFSTR("%@%@"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v12 = [PKTextRangeHyperlink alloc];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __67__PKPeerPaymentRecurringPaymentEducationViewController_viewDidLoad__block_invoke;
  v22[3] = &unk_1E3E61B68;
  objc_copyWeak(&v23, &location);
  v22[4] = self;
  v13 = -[PKTextRangeHyperlink initWithLinkText:action:](v12, "initWithLinkText:action:", v10, v22);
  v20 = (void *)v9;
  v21 = (void *)v6;
  objc_msgSend(v8, "addObject:", v13);
  v14 = objc_alloc_init(PKMultiHyperlinkView);
  -[PKMultiHyperlinkView setText:](v14, "setText:", v11);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMultiHyperlinkView setTextColor:](v14, "setTextColor:", v15);

  -[PKMultiHyperlinkView setTextAlignment:](v14, "setTextAlignment:", 1);
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], (NSString *)*MEMORY[0x1E0DC48D0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMultiHyperlinkView setTextFont:](v14, "setTextFont:", v16);

  -[PKMultiHyperlinkView setSources:](v14, "setSources:", v8);
  objc_msgSend(v3, "setBodyView:", v14);
  objc_msgSend(v3, "dockView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "primaryButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPeerPaymentRecurringString(CFSTR("RECURRING_PAYMENT_EDUCATION_ACTION"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTitle:forState:", v19, 0);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

void __67__PKPeerPaymentRecurringPaymentEducationViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "termsAcceptanceRequired"))
    {
      objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "targetDevice");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "updateAccountWithCompletion:", &__block_literal_global_187);
    }
    else
    {
      objc_msgSend(v5[132], "localizedValueForFieldKey:", *MEMORY[0x1E0D6AE20]);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
        objc_msgSend(v5, "_requestOpenURL:", v4);
    }

    WeakRetained = v5;
  }

}

void __67__PKPeerPaymentRecurringPaymentEducationViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v2 = a2;
  if (v2)
  {
    if (PKIsPad())
    {
      v3 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "statusBarOrientation"));
      v5 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = &unk_1E3FADB40;
    }
    objc_msgSend(MEMORY[0x1E0D67470], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentPeerPaymentTermsAndConditionsWithAccount:orientation:completion:", v2, v5, &__block_literal_global_40);

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "Cannot present terms acceptance flow because the account is nil", v7, 2u);
    }
  }

}

void __67__PKPeerPaymentRecurringPaymentEducationViewController_viewDidLoad__block_invoke_38()
{
  NSObject *v0;
  uint8_t v1[16];

  PKLogFacilityTypeGetObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_19D178000, v0, OS_LOG_TYPE_DEFAULT, "Presented Terms & Conditions acceptance flow", v1, 2u);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPeerPaymentRecurringPaymentEducationViewController;
  -[PKPeerPaymentRecurringPaymentEducationViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
  PKPeerPaymentRecurringPaymentSetHasShownEducationMessage();
}

- (void)_requestOpenURL:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (objc_class *)MEMORY[0x1E0CD5600];
  v5 = a3;
  v7 = (id)objc_msgSend([v4 alloc], "initWithURL:", v5);

  objc_msgSend(v7, "setModalPresentationStyle:", 2);
  -[PKPeerPaymentRecurringPaymentEducationViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentViewController:animated:completion:", v7, 1, 0);

}

- (void)explanationViewDidSelectContinue:(id)a3
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD block[4];
  id v10;
  id location;
  id v12;
  uint64_t v13;

  v12 = 0;
  v13 = 0;
  v4 = +[PKPeerPaymentActionController canPerformPeerPaymentAction:account:unableReason:displayableError:](PKPeerPaymentActionController, "canPerformPeerPaymentAction:account:unableReason:displayableError:", 3, self->_account, &v13, &v12);
  v5 = v12;
  if (v4)
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __89__PKPeerPaymentRecurringPaymentEducationViewController_explanationViewDidSelectContinue___block_invoke;
    block[3] = &unk_1E3E61310;
    objc_copyWeak(&v10, &location);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __89__PKPeerPaymentRecurringPaymentEducationViewController_explanationViewDidSelectContinue___block_invoke_2;
    v8[3] = &unk_1E3E612E8;
    v8[4] = self;
    +[PKPeerPaymentActionController alertControllerForPeerPaymentActionUnableReason:displayableError:addCardActionHandler:](PKPeerPaymentActionController, "alertControllerForPeerPaymentActionUnableReason:displayableError:addCardActionHandler:", v13, v5, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentRecurringPaymentEducationViewController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentViewController:animated:completion:", v6, 1, 0);

  }
}

void __89__PKPeerPaymentRecurringPaymentEducationViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1)
{
  PKRecipientPickerViewController *v1;
  void *v2;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = -[PKRecipientPickerViewController initWithTransactionSourceCollection:familyCollection:peerPaymentSendFlowType:]([PKRecipientPickerViewController alloc], "initWithTransactionSourceCollection:familyCollection:peerPaymentSendFlowType:", WeakRetained[129], WeakRetained[130], 2);
    objc_msgSend(WeakRetained, "navigationController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "pushViewController:animated:", v1, 1);

  }
}

void __89__PKPeerPaymentRecurringPaymentEducationViewController_explanationViewDidSelectContinue___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __89__PKPeerPaymentRecurringPaymentEducationViewController_explanationViewDidSelectContinue___block_invoke_3;
  v3[3] = &unk_1E3E61310;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __89__PKPeerPaymentRecurringPaymentEducationViewController_explanationViewDidSelectContinue___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = *((_QWORD *)WeakRetained + 133);
    if (v3)
    {
      v4 = v2;
      (*(void (**)(void))(v3 + 16))();
      v2 = v4;
    }
  }

}

- (id)addCardHandler
{
  return self->_addCardHandler;
}

- (void)setAddCardHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_addCardHandler, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
}

@end
