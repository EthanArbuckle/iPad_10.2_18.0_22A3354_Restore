@implementation PKAccountBillPaymentLearnMoreViewController

- (PKAccountBillPaymentLearnMoreViewController)initWithAccount:(id)a3
{
  id v5;
  PKAccountBillPaymentLearnMoreViewController *v6;
  PKAccountBillPaymentLearnMoreViewController *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *titleText;
  uint64_t v12;
  NSString *subtitleText;
  uint64_t v14;
  NSString *customerAgreementLinkText;
  uint64_t v16;
  NSString *customerAgreementText;
  id v18;
  PKAccountBillPaymentLearnMoreSuggestionDescription *v19;
  void *v20;
  void *v21;
  PKAccountBillPaymentLearnMoreSuggestionDescription *v22;
  void *v23;
  void *v24;
  PKAccountBillPaymentLearnMoreSuggestionDescription *v25;
  void *v26;
  void *v27;
  PKAccountBillPaymentLearnMoreSuggestionDescription *v28;
  void *v29;
  void *v30;
  PKAccountBillPaymentLearnMoreSuggestionDescription *v31;
  void *v32;
  void *v33;
  PKAccountBillPaymentLearnMoreSuggestionDescription *v34;
  void *v35;
  void *v36;
  PKAccountBillPaymentLearnMoreSuggestionDescription *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSArray *suggestionDescriptions;
  id v42;
  void *v43;
  uint64_t v44;
  NSArray *footnotes;
  NSString *v47;
  objc_super v48;

  v5 = a3;
  v48.receiver = self;
  v48.super_class = (Class)PKAccountBillPaymentLearnMoreViewController;
  v6 = -[PKAccountBillPaymentLearnMoreViewController init](&v48, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    -[PKAccount feature](v7->_account, "feature");
    -[PKAccountBillPaymentLearnMoreViewController navigationItem](v7, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v8, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, v7, sel_doneButtonTapped);
    objc_msgSend(v8, "setRightBarButtonItem:", v9);
    PKLocalizedFeatureString();
    v10 = objc_claimAutoreleasedReturnValue();
    titleText = v7->_titleText;
    v7->_titleText = (NSString *)v10;

    PKLocalizedFeatureString();
    v12 = objc_claimAutoreleasedReturnValue();
    subtitleText = v7->_subtitleText;
    v7->_subtitleText = (NSString *)v12;

    PKLocalizedFeatureString();
    v14 = objc_claimAutoreleasedReturnValue();
    customerAgreementLinkText = v7->_customerAgreementLinkText;
    v7->_customerAgreementLinkText = (NSString *)v14;

    v47 = v7->_customerAgreementLinkText;
    PKLocalizedFeatureString();
    v16 = objc_claimAutoreleasedReturnValue();
    customerAgreementText = v7->_customerAgreementText;
    v7->_customerAgreementText = (NSString *)v16;

    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v19 = objc_alloc_init(PKAccountBillPaymentLearnMoreSuggestionDescription);
    PKLocalizedFeatureString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountBillPaymentLearnMoreSuggestionDescription setTitle:](v19, "setTitle:", v20, v47);

    PKLocalizedBeekmanString(CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_LEARN_MORE_WHEN_TO_PAY_INSTALLMENT_DESCRIPTION"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountBillPaymentLearnMoreSuggestionDescription setMessage:](v19, "setMessage:", v21);

    objc_msgSend(v18, "addObject:", v19);
    v22 = objc_alloc_init(PKAccountBillPaymentLearnMoreSuggestionDescription);

    PKLocalizedFeatureString();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountBillPaymentLearnMoreSuggestionDescription setTitle:](v22, "setTitle:", v23);

    PKLocalizedBeekmanString(CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_LEARN_MORE_PAY_TOTAL_BALANCE_INSTALLMENT_DESCRIPTION"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountBillPaymentLearnMoreSuggestionDescription setMessage:](v22, "setMessage:", v24);

    objc_msgSend(v18, "addObject:", v22);
    v25 = objc_alloc_init(PKAccountBillPaymentLearnMoreSuggestionDescription);

    PKLocalizedFeatureString();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountBillPaymentLearnMoreSuggestionDescription setTitle:](v25, "setTitle:", v26);

    PKLocalizedBeekmanString(CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_LEARN_MORE_PAY_MONTHLY_BALANCE_INSTALLMENT_DESCRIPTION"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountBillPaymentLearnMoreSuggestionDescription setMessage:](v25, "setMessage:", v27);

    objc_msgSend(v18, "addObject:", v25);
    v28 = objc_alloc_init(PKAccountBillPaymentLearnMoreSuggestionDescription);

    PKLocalizedFeatureString();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountBillPaymentLearnMoreSuggestionDescription setTitle:](v28, "setTitle:", v29);

    PKLocalizedBeekmanString(CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_LEARN_MORE_PAY_MINIMUM_INSTALLMENT_DESCRIPTION"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountBillPaymentLearnMoreSuggestionDescription setMessage:](v28, "setMessage:", v30);

    objc_msgSend(v18, "addObject:", v28);
    v31 = objc_alloc_init(PKAccountBillPaymentLearnMoreSuggestionDescription);

    PKLocalizedFeatureString();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountBillPaymentLearnMoreSuggestionDescription setTitle:](v31, "setTitle:", v32);

    PKLocalizedFeatureString();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountBillPaymentLearnMoreSuggestionDescription setMessage:](v31, "setMessage:", v33);

    objc_msgSend(v18, "addObject:", v31);
    v34 = objc_alloc_init(PKAccountBillPaymentLearnMoreSuggestionDescription);

    PKLocalizedBeekmanString(CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_LEARN_MORE_APPLE_CARD_INSTALLMENTS_INSTALLMENT_TITLE"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountBillPaymentLearnMoreSuggestionDescription setTitle:](v34, "setTitle:", v35);

    PKLocalizedBeekmanString(CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_LEARN_MORE_APPLE_CARD_INSTALLMENTS_INSTALLMENT_DESCRIPTION"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountBillPaymentLearnMoreSuggestionDescription setMessage:](v34, "setMessage:", v36);

    objc_msgSend(v18, "addObject:", v34);
    v37 = objc_alloc_init(PKAccountBillPaymentLearnMoreSuggestionDescription);

    PKLocalizedFeatureString();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountBillPaymentLearnMoreSuggestionDescription setTitle:](v37, "setTitle:", v38);

    PKLocalizedBeekmanString(CFSTR("ACCOUNT_SERVICE_BILL_PAYMENT_LEARN_MORE_INTEREST_INSTALLMENT_DESCRIPTION"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountBillPaymentLearnMoreSuggestionDescription setMessage:](v37, "setMessage:", v39);

    objc_msgSend(v18, "addObject:", v37);
    v40 = objc_msgSend(v18, "copy");
    suggestionDescriptions = v7->_suggestionDescriptions;
    v7->_suggestionDescriptions = (NSArray *)v40;

    v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    PKLocalizedFeatureString();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addObject:", v43);
    v44 = objc_msgSend(v42, "copy");
    footnotes = v7->_footnotes;
    v7->_footnotes = (NSArray *)v44;

  }
  return v7;
}

- (void)loadView
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIScrollView *v10;
  UIScrollView *scrollView;
  UILabel *v12;
  UILabel *titleLabel;
  UILabel *v14;
  NSString *v15;
  void *v16;
  UILabel *v17;
  UILabel *subtitleLabel;
  UILabel *v19;
  void *v20;
  PKAccountBillPaymentLearnMoreViewController *v21;
  uint64_t v22;
  uint64_t v23;
  NSString *v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  PKAccountBillPaymentLearnMoreSuggestionDescriptionLabel *v33;
  uint64_t v34;
  NSArray *suggestionDescriptionLabels;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSString *v40;
  uint64_t j;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  NSArray *footnoteLabels;
  uint64_t v47;
  UITextView *customerAgreementTextView;
  UITextView *v49;
  void *v50;
  void *v51;
  NSArray *obj;
  NSString *v53;
  id v54;
  NSArray *v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  objc_super v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v65.receiver = self;
  v65.super_class = (Class)PKAccountBillPaymentLearnMoreViewController;
  -[PKAccountBillPaymentLearnMoreViewController loadView](&v65, sel_loadView);
  -[PKAccountBillPaymentLearnMoreViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = objc_alloc(MEMORY[0x1E0DC3C28]);
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v10 = (UIScrollView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v7, v8, v9);
  scrollView = self->_scrollView;
  self->_scrollView = v10;

  -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
  v51 = v3;
  objc_msgSend(v3, "addSubview:", self->_scrollView);
  v12 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v6, v7, v8, v9);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v12;

  v14 = self->_titleLabel;
  v15 = (NSString *)*MEMORY[0x1E0DC4938];
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4AE8], (void *)*MEMORY[0x1E0DC4938], 2, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v14, "setFont:", v16);

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  -[UILabel setText:](self->_titleLabel, "setText:", self->_titleText);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_titleLabel);
  v17 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v6, v7, v8, v9);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v17;

  v19 = self->_subtitleLabel;
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B60], v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v19, "setFont:", v20);

  -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 0);
  -[UILabel setText:](self->_subtitleLabel, "setText:", self->_subtitleText);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_subtitleLabel);
  v56 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v21 = self;
  obj = self->_suggestionDescriptions;
  v22 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
  if (v22)
  {
    v23 = v22;
    v53 = (NSString *)*MEMORY[0x1E0DC4AD0];
    v54 = *(id *)v62;
    v24 = (NSString *)*MEMORY[0x1E0DC4B10];
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(id *)v62 != v54)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v6, v7, v8, v9);
        PKFontForDefaultDesign(v53, v15);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setFont:", v28);

        objc_msgSend(v27, "setNumberOfLines:", 0);
        objc_msgSend(v26, "title");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setText:", v29);

        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v6, v7, v8, v9);
        PKFontForDefaultDesign(v24, v15);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setFont:", v31);

        objc_msgSend(v30, "setNumberOfLines:", 0);
        objc_msgSend(v26, "message");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setText:", v32);

        v33 = objc_alloc_init(PKAccountBillPaymentLearnMoreSuggestionDescriptionLabel);
        -[PKAccountBillPaymentLearnMoreSuggestionDescriptionLabel setTitleLabel:](v33, "setTitleLabel:", v27);
        -[PKAccountBillPaymentLearnMoreSuggestionDescriptionLabel setMessageLabel:](v33, "setMessageLabel:", v30);
        -[UIScrollView addSubview:](v21->_scrollView, "addSubview:", v27);
        -[UIScrollView addSubview:](v21->_scrollView, "addSubview:", v30);
        objc_msgSend(v56, "addObject:", v33);

      }
      v23 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
    }
    while (v23);
  }

  v34 = objc_msgSend(v56, "copy");
  suggestionDescriptionLabels = v21->_suggestionDescriptionLabels;
  v21->_suggestionDescriptionLabels = (NSArray *)v34;

  v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v55 = v21->_footnotes;
  v37 = -[NSArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v58;
    v40 = (NSString *)*MEMORY[0x1E0DC4AB8];
    do
    {
      for (j = 0; j != v38; ++j)
      {
        if (*(_QWORD *)v58 != v39)
          objc_enumerationMutation(v55);
        v42 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j);
        v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v6, v7, v8, v9);
        PKFontForDefaultDesign(v40, v15);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setFont:", v44);

        objc_msgSend(v43, "setNumberOfLines:", 0);
        objc_msgSend(v43, "setText:", v42);
        -[UIScrollView addSubview:](v21->_scrollView, "addSubview:", v43);
        objc_msgSend(v36, "addObject:", v43);

      }
      v38 = -[NSArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
    }
    while (v38);
  }

  v45 = objc_msgSend(v36, "copy");
  footnoteLabels = v21->_footnoteLabels;
  v21->_footnoteLabels = (NSArray *)v45;

  objc_msgSend(MEMORY[0x1E0DC3E50], "pkui_plainNonInteractiveTextViewWithFrame:", v6, v7, v8, v9);
  v47 = objc_claimAutoreleasedReturnValue();
  customerAgreementTextView = v21->_customerAgreementTextView;
  v21->_customerAgreementTextView = (UITextView *)v47;

  -[UITextView setDelegate:](v21->_customerAgreementTextView, "setDelegate:", v21);
  -[UITextView setSelectable:](v21->_customerAgreementTextView, "setSelectable:", 1);
  -[UITextView setUserInteractionEnabled:](v21->_customerAgreementTextView, "setUserInteractionEnabled:", 1);
  -[UITextView _setInteractiveTextSelectionDisabled:](v21->_customerAgreementTextView, "_setInteractiveTextSelectionDisabled:", 1);
  -[UITextView setTextContainerInset:](v21->_customerAgreementTextView, "setTextContainerInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  v49 = v21->_customerAgreementTextView;
  -[PKAccountBillPaymentLearnMoreViewController _customerAgreementAttributedString](v21, "_customerAgreementAttributedString");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setAttributedText:](v49, "setAttributedText:", v50);

  -[UIScrollView addSubview:](v21->_scrollView, "addSubview:", v21->_customerAgreementTextView);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)PKAccountBillPaymentLearnMoreViewController;
  -[PKAccountBillPaymentLearnMoreViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  v6 = *MEMORY[0x1E0D68AA0];
  v7[0] = *MEMORY[0x1E0D68C50];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountBillPaymentLearnMoreViewController _reportEventForPassIfNecessary:](self, "_reportEventForPassIfNecessary:", v4);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)PKAccountBillPaymentLearnMoreViewController;
  -[PKAccountBillPaymentLearnMoreViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  v6 = *MEMORY[0x1E0D68AA0];
  v7[0] = *MEMORY[0x1E0D68C58];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountBillPaymentLearnMoreViewController _reportEventForPassIfNecessary:](self, "_reportEventForPassIfNecessary:", v4);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double MaxY;
  void *v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  NSArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  CGFloat v47;
  double v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;

  v59 = *MEMORY[0x1E0C80C00];
  -[PKAccountBillPaymentLearnMoreViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v48 = v8;
  v9 = 24.0;
  if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    objc_msgSend(v3, "readableContentGuide");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layoutFrame");
    v9 = v11;

  }
  objc_msgSend(v3, "safeAreaInsets");
  objc_msgSend(v3, "safeAreaInsets");
  v12 = v5 + v9;
  v13 = v7 - (v9 + v9);
  -[UILabel frame](self->_titleLabel, "frame");
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_titleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v13, 1.79769313e308);
  v15 = v14;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v12, 30.0, v13, v14);
  -[UILabel frame](self->_subtitleLabel, "frame");
  v60.origin.y = 30.0;
  v60.origin.x = v12;
  v60.size.width = v13;
  v60.size.height = v15;
  v16 = CGRectGetMaxY(v60) + 15.0;
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_subtitleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, v13, 1.79769313e308);
  v18 = v17;
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", v12, v16, v13, v17);
  v61.origin.x = v12;
  v61.origin.y = v16;
  v61.size.width = v13;
  v61.size.height = v18;
  v19 = CGRectGetMaxY(v61) + 15.0;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v20 = self->_suggestionDescriptionLabels;
  v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v54 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_msgSend(v25, "titleLabel");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "frame");
        v27 = v19 + 20.0;
        objc_msgSend(v26, "pkui_sizeThatFits:forceWordWrap:", 1, v13, 1.79769313e308);
        v29 = v28;
        objc_msgSend(v26, "setFrame:", v12, v27, v13, v28);
        v62.origin.x = v12;
        v62.origin.y = v27;
        v62.size.width = v7 - (v9 + v9);
        v62.size.height = v29;
        MaxY = CGRectGetMaxY(v62);
        objc_msgSend(v25, "messageLabel");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "frame");
        v32 = MaxY + 5.0;
        objc_msgSend(v31, "pkui_sizeThatFits:forceWordWrap:", 1, v13, 1.79769313e308);
        v34 = v33;
        objc_msgSend(v31, "setFrame:", v12, v32, v13, v33);
        v63.origin.x = v12;
        v63.origin.y = v32;
        v63.size.width = v7 - (v9 + v9);
        v63.size.height = v34;
        v19 = CGRectGetMaxY(v63);

      }
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    }
    while (v22);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v35 = self->_footnoteLabels;
  v36 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v50;
    do
    {
      for (j = 0; j != v37; ++j)
      {
        if (*(_QWORD *)v50 != v38)
          objc_enumerationMutation(v35);
        v40 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
        objc_msgSend(v40, "frame");
        v41 = v19 + 15.0;
        objc_msgSend(v40, "pkui_sizeThatFits:forceWordWrap:", 1, v13, 1.79769313e308);
        v43 = v42;
        objc_msgSend(v40, "setFrame:", v12, v41, v13, v42);
        v64.origin.x = v12;
        v64.origin.y = v41;
        v64.size.width = v7 - (v9 + v9);
        v64.size.height = v43;
        v19 = CGRectGetMaxY(v64);
      }
      v37 = -[NSArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    }
    while (v37);
  }

  -[UITextView frame](self->_customerAgreementTextView, "frame");
  v44 = v19 + 20.0;
  -[UITextView sizeThatFits:](self->_customerAgreementTextView, "sizeThatFits:", v13, 1.79769313e308);
  v46 = v45;
  -[UITextView setFrame:](self->_customerAgreementTextView, "setFrame:", v12, v44, v13, v45);
  v65.origin.x = v12;
  v65.origin.y = v44;
  v65.size.width = v13;
  v65.size.height = v46;
  v47 = CGRectGetMaxY(v65) + 20.0;
  -[UIScrollView setFrame:](self->_scrollView, "setFrame:", 0.0, 0.0, v7, v48);
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v7, v47);

}

- (void)doneButtonTapped
{
  if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    -[PKAccountBillPaymentLearnMoreViewController dismissViewControllerWithTransition:completion:](self, "dismissViewControllerWithTransition:completion:", 9, 0);
  }
  else
  {
    -[PKAccountBillPaymentLearnMoreViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  PKAccountTermsAndConditionsController *v12;
  PKAccount *account;
  void *v14;
  PKAccountTermsAndConditionsController *v15;
  PKAccountTermsAndConditionsController *termsController;
  PKAccountTermsAndConditionsController *v17;
  NSObject *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "termsIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = [PKAccountTermsAndConditionsController alloc];
    account = self->_account;
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PKAccountTermsAndConditionsController initWithAccount:webService:context:termsIdentifier:](v12, "initWithAccount:webService:context:termsIdentifier:", account, v14, 0, v11);
    termsController = self->_termsController;
    self->_termsController = v15;

    objc_initWeak(location, self);
    v17 = self->_termsController;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __98__PKAccountBillPaymentLearnMoreViewController_textView_shouldInteractWithURL_inRange_interaction___block_invoke;
    v21[3] = &unk_1E3E62598;
    objc_copyWeak(&v22, location);
    -[PKAccountTermsAndConditionsController termsViewControllerWithCompletion:](v17, "termsViewControllerWithCompletion:", v21);
    objc_destroyWeak(&v22);
    objc_destroyWeak(location);
  }
  else
  {
    PKLogFacilityTypeGetObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      -[PKAccount accountIdentifier](self->_account, "accountIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v19;
      _os_log_impl(&dword_19D178000, v18, OS_LOG_TYPE_DEFAULT, "Error: Account: %@ is missing terms and conditions. Using the value in the pass instead.", (uint8_t *)location, 0xCu);

    }
  }

  return 0;
}

void __98__PKAccountBillPaymentLearnMoreViewController_textView_shouldInteractWithURL_inRange_interaction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v5)
    {
      v7 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
      objc_msgSend(WeakRetained, "navigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "presentViewController:animated:completion:", v7, 1, 0);

    }
    else if (v9)
    {
      objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v9, 1, 0);
    }
  }

}

- (id)_customerAgreementAttributedString
{
  NSUInteger v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  if (-[NSString length](self->_customerAgreementText, "length"))
  {
    v3 = -[NSString length](self->_customerAgreementText, "length");
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", &stru_1E3E7D690);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[NSString rangeOfString:](self->_customerAgreementText, "rangeOfString:", self->_customerAgreementLinkText);
    v7 = v6;
    PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4AB8], (NSString *)*MEMORY[0x1E0DC4938]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", self->_customerAgreementText);
    objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pk_addLinkURL:toRange:withColor:isUnderlined:", v4, v5, v7, v10, 0);

    objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    objc_msgSend(v12, "setLineBreakMode:", 0);
    objc_msgSend(v9, "addAttribute:value:range:", *MEMORY[0x1E0DC1178], v12, 0, v3);
    v13 = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAttribute:value:range:", v13, v14, 0, v3);

    objc_msgSend(v9, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v8, 0, v3);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)scrollViewDidScroll:(id)a3
{
  UIScrollView *scrollView;
  id v4;

  scrollView = self->_scrollView;
  -[PKAccountBillPaymentLearnMoreViewController navigationItem](self, "navigationItem", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIScrollView pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:](scrollView, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);

}

- (void)_reportEventForPassIfNecessary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x1E0D66A58], "subjectToReportDashboardAnalyticsForAccount:", self->_account);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && v4)
  {
    v5 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v5, "setObject:forKey:", *MEMORY[0x1E0D689E0], *MEMORY[0x1E0D68F50]);
    v6 = (void *)MEMORY[0x1E0D66A58];
    v7 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v6, "subject:sendEvent:", v4, v7);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customerAgreementTextView, 0);
  objc_storeStrong((id *)&self->_footnoteLabels, 0);
  objc_storeStrong((id *)&self->_suggestionDescriptionLabels, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_customerAgreementLinkText, 0);
  objc_storeStrong((id *)&self->_customerAgreementText, 0);
  objc_storeStrong((id *)&self->_footnotes, 0);
  objc_storeStrong((id *)&self->_suggestionDescriptions, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_termsController, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
