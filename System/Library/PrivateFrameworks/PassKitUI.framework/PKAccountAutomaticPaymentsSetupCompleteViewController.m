@implementation PKAccountAutomaticPaymentsSetupCompleteViewController

- (PKAccountAutomaticPaymentsSetupCompleteViewController)initWithController:(id)a3
{
  id v5;
  PKAccountAutomaticPaymentsSetupCompleteViewController *v6;
  PKAccountAutomaticPaymentsSetupCompleteViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountAutomaticPaymentsSetupCompleteViewController;
  v6 = -[PKExplanationViewController initWithContext:](&v9, sel_initWithContext_, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_controller, a3);
    v7->_featureIdentifier = objc_msgSend(v5, "featureIdentifier");
    -[PKAccountAutomaticPaymentsSetupCompleteViewController setModalInPresentation:](v7, "setModalInPresentation:", 1);
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PKAccountAutomaticPaymentsSetupCompleteViewController;
  -[PKExplanationViewController viewDidLoad](&v18, sel_viewDidLoad);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedFeatureString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleText:", v4);

  -[PKAccountAutomaticPaymentsSetupCompleteViewController bodyString](self, "bodyString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBodyText:", v5);

  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setShowPrivacyView:", 0);
  objc_msgSend(v3, "showCheckmark:animated:", 0, 0);
  objc_msgSend(v3, "setBodyViewPadding:", 35.0);
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D67768], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__PKAccountAutomaticPaymentsSetupCompleteViewController_viewDidLoad__block_invoke;
  v14[3] = &unk_1E3E62570;
  objc_copyWeak(&v16, &location);
  v7 = v3;
  v15 = v7;
  objc_msgSend(v6, "authorizationStatusWithCompletion:", v14);

  objc_msgSend(v7, "dockView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "primaryButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedFeatureString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:forState:", v10, 0);

  objc_msgSend(v9, "setContentEdgeInsets:", 0.0, 16.0, 0.0, 16.0);
  objc_msgSend(v9, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAdjustsFontSizeToFitWidth:", 1);

  objc_msgSend(v9, "sizeToFit");
  -[PKAccountAutomaticPaymentsSetupCompleteViewController navigationItem](self, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLeftBarButtonItem:", 0);

  -[PKAccountAutomaticPaymentsSetupCompleteViewController navigationItem](self, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidesBackButton:", 1);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __68__PKAccountAutomaticPaymentsSetupCompleteViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, char a3)
{
  _QWORD v6[4];
  id v7;
  id v8[2];
  char v9;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__PKAccountAutomaticPaymentsSetupCompleteViewController_viewDidLoad__block_invoke_2;
  v6[3] = &unk_1E3E62548;
  objc_copyWeak(v8, (id *)(a1 + 40));
  v9 = a3;
  v8[1] = a2;
  v7 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v6);

  objc_destroyWeak(v8);
}

void __68__PKAccountAutomaticPaymentsSetupCompleteViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  PKAccountBillPaymentMessageContentView *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && *(_BYTE *)(a1 + 56) && *(_QWORD *)(a1 + 48) != 2)
  {
    v5 = WeakRetained;
    v3 = objc_alloc_init(PKAccountBillPaymentMessageContentView);
    -[PKAccountBillPaymentMessageContentView setSystemImage:](v3, "setSystemImage:", CFSTR("bell"));
    objc_msgSend(v5, "_supplementaryMessageAttributedString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountBillPaymentMessageContentView setAttributedMessage:](v3, "setAttributedMessage:", v4);

    objc_msgSend(*(id *)(a1 + 32), "setBodyView:", v3);
    WeakRetained = v5;
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKAccountAutomaticPaymentsSetupCompleteViewController;
  -[PKAccountAutomaticPaymentsSetupCompleteViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[PKExplanationViewController explanationView](self, "explanationView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowCheckmark:", 1);

}

- (id)bodyString
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v18;
  void *v19;

  v3 = -[PKAccountAutomaticPaymentsController paymentFrequency](self->_controller, "paymentFrequency");
  -[PKAccountAutomaticPaymentsSetupCompleteViewController _paymentDateString](self, "_paymentDateString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKAccountAutomaticPaymentsController paymentPreset](self->_controller, "paymentPreset") != 1)
    goto LABEL_5;
  -[PKAccountAutomaticPaymentsController amount](self->_controller, "amount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "amount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountAutomaticPaymentsController account](self->_controller, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "creditDetails");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currencyCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PKFormattedCurrencyStringFromNumber();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    switch(v3)
    {
      case 4:
      case 5:
        -[PKAccountAutomaticPaymentsSetupCompleteViewController _paymentDayNameString](self, "_paymentDayNameString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 6:
        -[PKAccountAutomaticPaymentsSetupCompleteViewController _paymentDay](self, "_paymentDay");
        -[PKAccountAutomaticPaymentsSetupCompleteViewController _paymentDayString](self, "_paymentDayString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
        v18 = v10;
        v19 = v11;
        PKLocalizedFeatureString();
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        break;
      case 7:
        v18 = v10;
        PKLocalizedFeatureString();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      default:
        goto LABEL_7;
    }
  }
  else
  {
LABEL_5:
    switch(v3)
    {
      case 4:
      case 5:
        -[PKAccountAutomaticPaymentsSetupCompleteViewController _paymentDayNameString](self, "_paymentDayNameString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedFeatureString();
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_11;
      case 6:
        -[PKAccountAutomaticPaymentsSetupCompleteViewController _paymentDay](self, "_paymentDay");
        -[PKAccountAutomaticPaymentsSetupCompleteViewController _paymentDayString](self, "_paymentDayString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedFeatureString();
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_11;
      case 7:
        PKLocalizedFeatureString();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
        v10 = 0;
        break;
      default:
        v10 = 0;
LABEL_7:
        v12 = 0;
        break;
    }
  }
  if (!-[PKAccountAutomaticPaymentsController willSkipFirstPayment](self->_controller, "willSkipFirstPayment", v18, v19)|| (v13 = -[PKAccountAutomaticPaymentsController paymentPreset](self->_controller, "paymentPreset"), v13 == 2)|| v13 == 3)
  {
    PKLocalizedFeatureString();
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      objc_msgSend(v12, "stringByAppendingFormat:", CFSTR(" %@"), v14);
      v16 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v16;
    }
  }

  return v12;
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id v4;

  -[PKAccountAutomaticPaymentsController delegate](self->_controller, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "accountAutomaticPaymentsControllerDidSelectSetupCompletionDone:viewController:", self->_controller, self);
  else
    -[PKAccountAutomaticPaymentsSetupCompleteViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (int64_t)_paymentDay
{
  int64_t result;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;

  result = -[PKAccountAutomaticPaymentsController scheduledDay](self->_controller, "scheduledDay");
  if ((unint64_t)(result - 1) >= 0x1F)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99D48]);
    v5 = (void *)objc_msgSend(v4, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    -[PKAccountAutomaticPaymentsController account](self->_controller, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "creditDetails");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "productTimeZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTimeZone:", v8);

    -[PKAccountAutomaticPaymentsController paymentDate](self->_controller, "paymentDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "component:fromDate:", 16, v9);

    return v10;
  }
  return result;
}

- (id)_paymentDayString
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int64_t v12;
  int64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  -[PKAccountAutomaticPaymentsController account](self->_controller, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "creditDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "productTimeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x1E0C99D48]);
  v7 = (void *)objc_msgSend(v6, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(v7, "setTimeZone:", v5);
  -[PKAccountAutomaticPaymentsController paymentDate](self->_controller, "paymentDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedFeatureString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v11 = objc_msgSend(v9, "isEqualToString:", CFSTR("1"));
  else
    v11 = 0;
  v12 = -[PKAccountAutomaticPaymentsController scheduledDay](self->_controller, "scheduledDay");
  if ((unint64_t)(v12 - 1) <= 0x1E)
  {
    v13 = v12;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nextDateAfterDate:matchingUnit:value:options:", v14, 16, v13, 2);
    v15 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v15;
  }
  if (v11)
  {
    objc_msgSend(v7, "component:fromDate:", 16, v8);
    PKOrdinalStringForInteger();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v17, "setTimeZone:", v5);
    objc_msgSend(v17, "setLocalizedDateFormatFromTemplate:", CFSTR("d"));
    objc_msgSend(v17, "stringFromDate:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (id)_paymentDayNameString
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  -[PKAccountAutomaticPaymentsController account](self->_controller, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creditDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "productTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeZone:", v6);

  objc_msgSend(v3, "setLocalizedDateFormatFromTemplate:", CFSTR("EEEE"));
  -[PKAccountAutomaticPaymentsController paymentDate](self->_controller, "paymentDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_paymentDateString
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  -[PKAccountAutomaticPaymentsController account](self->_controller, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creditDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "productTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeZone:", v6);

  objc_msgSend(v3, "setLocalizedDateFormatFromTemplate:", CFSTR("EEEE, MMMM d"));
  -[PKAccountAutomaticPaymentsController paymentDate](self->_controller, "paymentDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_supplementaryMessageAttributedString
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v2 = *MEMORY[0x1E0DC47F0];
  PKLocalizedFeatureString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedFeatureString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v4, v3);
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "rangeOfString:", v3);
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pk_addLinkURL:toRange:withColor:isUnderlined:", v6, v7, v9, v10, 0);

  v11 = (void *)objc_msgSend(v5, "copy");
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
