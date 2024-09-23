@implementation PKPaymentAuthorizationCouponCodeEntryViewController

- (PKPaymentAuthorizationCouponCodeEntryViewController)initWithStyle:(int64_t)a3
{
  PKPaymentAuthorizationCouponCodeEntryViewController *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentAuthorizationCouponCodeEntryViewController;
  result = -[PKPaymentAuthorizationCouponCodeEntryViewController init](&v5, sel_init);
  if (result)
    result->_style = a3;
  return result;
}

- (BOOL)isPaymentStyle
{
  return (self->_style & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

- (BOOL)isViewTranslucent
{
  return (self->_style < 5uLL) & (0x19u >> self->_style);
}

- (void)reloadDataItem
{
  id WeakRetained;
  void *v4;
  NSString *v5;
  NSString *couponCode;
  _BOOL4 awaitingCouponCodeUpdate;
  void *v8;
  NSError *v9;
  NSError *firstError;
  _BOOL8 v11;
  dispatch_time_t v12;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "dataItemForPaymentAuthorizationCouponCodeEntryViewController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "couponCode");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  couponCode = self->_couponCode;
  self->_couponCode = v5;

  awaitingCouponCodeUpdate = self->_awaitingCouponCodeUpdate;
  self->_awaitingCouponCodeUpdate = objc_msgSend(v4, "isAwaitingCouponCodeUpdate");
  objc_msgSend(v4, "errors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (NSError *)objc_claimAutoreleasedReturnValue();
  firstError = self->_firstError;
  self->_firstError = v9;

  v11 = !self->_awaitingCouponCodeUpdate && !self->_finishing;
  -[UITextField setEnabled:](self->_textField, "setEnabled:", v11);
  if (self->_active && self->_firstError)
    -[UITextField becomeFirstResponder](self->_textField, "becomeFirstResponder");
  if (awaitingCouponCodeUpdate && !self->_awaitingCouponCodeUpdate && !self->_firstError)
  {
    self->_finishing = 1;
    v12 = dispatch_time(0, 200000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__PKPaymentAuthorizationCouponCodeEntryViewController_reloadDataItem__block_invoke;
    block[3] = &unk_1E3E612E8;
    block[4] = self;
    dispatch_after(v12, MEMORY[0x1E0C80D38], block);
  }
  -[PKPaymentAuthorizationCouponCodeEntryViewController updateAccessoryView](self, "updateAccessoryView");

}

uint64_t __69__PKPaymentAuthorizationCouponCodeEntryViewController_reloadDataItem__block_invoke(uint64_t a1)
{
  id WeakRetained;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1025) = 0;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1040));
  objc_msgSend(WeakRetained, "paymentAuthorizationCouponCodeEntryViewControllerDidFinish:", *(_QWORD *)(a1 + 32));

  return objc_msgSend(*(id *)(a1 + 32), "reloadDataItem");
}

- (id)canonicalizedText
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  -[UITextField text](self->_textField, "text");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E3E7D690;
  v4 = v2;

  return v4;
}

- (void)setAccessoryViewToActivityIndicator
{
  UIView *v3;
  double v4;
  double v5;
  UIView *accessoryView;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v3 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    LODWORD(v4) = 1148846080;
    -[UIView setContentHuggingPriority:forAxis:](v3, "setContentHuggingPriority:forAxis:", 0, v4);
    LODWORD(v5) = 1148846080;
    -[UIView setContentCompressionResistancePriority:forAxis:](v3, "setContentCompressionResistancePriority:forAxis:", 0, v5);
    -[UIView startAnimating](v3, "startAnimating");
    -[UIView removeFromSuperview](self->_accessoryView, "removeFromSuperview");
    -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", v3);
    accessoryView = self->_accessoryView;
    self->_accessoryView = v3;

  }
}

- (void)setAccessoryViewToError:(id)a3
{
  UIView **p_accessoryView;
  UIView *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  UIView *v10;

  p_accessoryView = &self->_accessoryView;
  v10 = self->_accessoryView;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3990]);

    LODWORD(v6) = 1148846080;
    -[UIView setContentHuggingPriority:forAxis:](v5, "setContentHuggingPriority:forAxis:", 0, v6);
    LODWORD(v7) = 1148846080;
    -[UIView setContentCompressionResistancePriority:forAxis:](v5, "setContentCompressionResistancePriority:forAxis:", 0, v7);
    -[UIView removeFromSuperview](*p_accessoryView, "removeFromSuperview");
    -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", v5);
    objc_storeStrong((id *)p_accessoryView, v5);
    v10 = v5;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "pkui_osloErrorColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setTextColor:](v10, "setTextColor:", v8);

  -[NSError localizedDescription](self->_firstError, "localizedDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setText:](v10, "setText:", v9);

}

- (void)setAccessoryViewToCheckmark
{
  id v3;
  void *v4;
  UIView *v5;
  double v6;
  double v7;
  UIView *accessoryView;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3870], "checkmarkImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (UIView *)objc_msgSend(v3, "initWithImage:", v4);

    -[UIView setContentMode:](v5, "setContentMode:", 1);
    LODWORD(v6) = 1148846080;
    -[UIView setContentHuggingPriority:forAxis:](v5, "setContentHuggingPriority:forAxis:", 0, v6);
    LODWORD(v7) = 1148846080;
    -[UIView setContentCompressionResistancePriority:forAxis:](v5, "setContentCompressionResistancePriority:forAxis:", 0, v7);
    -[UIView removeFromSuperview](self->_accessoryView, "removeFromSuperview");
    -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", v5);
    accessoryView = self->_accessoryView;
    self->_accessoryView = v5;

  }
}

- (void)clearAccessoryView
{
  UIView *accessoryView;

  -[UIView removeFromSuperview](self->_accessoryView, "removeFromSuperview");
  accessoryView = self->_accessoryView;
  self->_accessoryView = 0;

}

- (void)updateAccessoryView
{
  NSString *couponCode;
  void *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;
  BOOL v8;
  _BOOL4 v9;

  if (self->_awaitingCouponCodeUpdate)
  {
    -[PKPaymentAuthorizationCouponCodeEntryViewController setAccessoryViewToActivityIndicator](self, "setAccessoryViewToActivityIndicator");
    return;
  }
  if (!-[NSString length](self->_couponCode, "length"))
    goto LABEL_15;
  couponCode = self->_couponCode;
  -[PKPaymentAuthorizationCouponCodeEntryViewController canonicalizedText](self, "canonicalizedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = couponCode;
  v6 = v4;
  if (v5 != v6)
  {
    v7 = v6;
    if (v5)
      v8 = v6 == 0;
    else
      v8 = 1;
    if (v8)
    {

    }
    else
    {
      v9 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

      if (v9)
        goto LABEL_13;
    }
LABEL_15:
    -[PKPaymentAuthorizationCouponCodeEntryViewController clearAccessoryView](self, "clearAccessoryView");
    return;
  }

LABEL_13:
  if (self->_firstError)
    -[PKPaymentAuthorizationCouponCodeEntryViewController setAccessoryViewToError:](self, "setAccessoryViewToError:");
  else
    -[PKPaymentAuthorizationCouponCodeEntryViewController setAccessoryViewToCheckmark](self, "setAccessoryViewToCheckmark");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  UIScrollView *v5;
  UIScrollView *scrollView;
  UIScrollView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  UIStackView *v30;
  UIStackView *stackView;
  UIStackView *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  UITextField *v43;
  UITextField *textField;
  UITextField *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  objc_super v72;
  _QWORD v73[4];
  _QWORD v74[5];
  _QWORD v75[6];

  v75[4] = *MEMORY[0x1E0C80C00];
  v72.receiver = self;
  v72.super_class = (Class)PKPaymentAuthorizationCouponCodeEntryViewController;
  -[PKPaymentAuthorizationCouponCodeEntryViewController viewDidLoad](&v72, sel_viewDidLoad);
  PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_COUPON_CODE_ENTRY_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationCouponCodeEntryViewController setTitle:](self, "setTitle:", v3);

  if (-[PKPaymentAuthorizationCouponCodeEntryViewController isPaymentStyle](self, "isPaymentStyle"))
    -[PKPaymentAuthorizationCouponCodeEntryViewController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", 0);
  -[PKPaymentAuthorizationCouponCodeEntryViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E0DC3C28]);
  scrollView = self->_scrollView;
  self->_scrollView = v5;

  -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](self->_scrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIScrollView setKeyboardDismissMode:](self->_scrollView, "setKeyboardDismissMode:", 0);
  if (-[PKPaymentAuthorizationCouponCodeEntryViewController isViewTranslucent](self, "isViewTranslucent"))
  {
    v7 = self->_scrollView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView setBackgroundColor:](v7, "setBackgroundColor:", v8);

  }
  objc_msgSend(v4, "addSubview:", self->_scrollView);
  v56 = (void *)MEMORY[0x1E0CB3718];
  -[UIScrollView topAnchor](self->_scrollView, "topAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToAnchor:", v67);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = v65;
  -[UIScrollView leadingAnchor](self->_scrollView, "leadingAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:", v59);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v75[1] = v9;
  objc_msgSend(v4, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView bottomAnchor](self->_scrollView, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v75[2] = v12;
  v69 = v4;
  objc_msgSend(v4, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView trailingAnchor](self->_scrollView, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v75[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "activateConstraints:", v16);

  v17 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v17, "setLayoutMargins:", 16.0, 16.0, 16.0, 16.0);
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (-[PKPaymentAuthorizationCouponCodeEntryViewController isViewTranslucent](self, "isViewTranslucent"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBackgroundColor:", v18);

  }
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", v17);
  -[UIScrollView contentLayoutGuide](self->_scrollView, "contentLayoutGuide");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView frameLayoutGuide](self->_scrollView, "frameLayoutGuide");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v17, "topAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:", v60);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v57;
  objc_msgSend(v17, "leadingAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "leadingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v52);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v74[1] = v50;
  objc_msgSend(v19, "bottomAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v74[2] = v22;
  v68 = v19;
  objc_msgSend(v19, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v74[3] = v25;
  v71 = v17;
  objc_msgSend(v17, "widthAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v20;
  objc_msgSend(v20, "widthAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v74[4] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "activateConstraints:", v29);

  v30 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
  stackView = self->_stackView;
  self->_stackView = v30;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](self->_stackView, "setAxis:", 0);
  -[UIStackView setAlignment:](self->_stackView, "setAlignment:", 3);
  -[UIStackView setSpacing:](self->_stackView, "setSpacing:", 1.17549435e-38);
  if (-[PKPaymentAuthorizationCouponCodeEntryViewController isViewTranslucent](self, "isViewTranslucent"))
  {
    v32 = self->_stackView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView setBackgroundColor:](v32, "setBackgroundColor:", v33);

  }
  objc_msgSend(v71, "addSubview:", self->_stackView);
  objc_msgSend(v71, "readableContentGuide");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)MEMORY[0x1E0CB3718];
  -[UIStackView topAnchor](self->_stackView, "topAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "topAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:", v58);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = v55;
  -[UIStackView leadingAnchor](self->_stackView, "leadingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "leadingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:", v51);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v73[1] = v35;
  v64 = v34;
  objc_msgSend(v34, "bottomAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView bottomAnchor](self->_stackView, "bottomAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v73[2] = v38;
  objc_msgSend(v34, "trailingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView trailingAnchor](self->_stackView, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v73[3] = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 4);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "activateConstraints:", v42);

  v43 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
  textField = self->_textField;
  self->_textField = v43;

  v45 = self->_textField;
  PKLocalizedPaymentString(CFSTR("IN_APP_PAYMENT_COUPON_CODE_ENTRY_PLACEHOLDER"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setPlaceholder:](v45, "setPlaceholder:", v46);

  -[UITextField setDelegate:](self->_textField, "setDelegate:", self);
  -[UITextField addTarget:action:forControlEvents:](self->_textField, "addTarget:action:forControlEvents:", self, sel_textFieldDidEditingChanged_, 0x20000);
  -[UITextField setAutocapitalizationType:](self->_textField, "setAutocapitalizationType:", 0);
  -[UITextField setAutocorrectionType:](self->_textField, "setAutocorrectionType:", 1);
  -[UITextField setReturnKeyType:](self->_textField, "setReturnKeyType:", 9);
  -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_textField);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPaymentAuthorizationCouponCodeEntryViewController;
  -[PKPaymentAuthorizationCouponCodeEntryViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_keyboardDidShow_, *MEMORY[0x1E0DC4E70], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_keyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);

  -[PKPaymentAuthorizationCouponCodeEntryViewController reloadDataItem](self, "reloadDataItem");
  -[UITextField setText:](self->_textField, "setText:", self->_couponCode);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPaymentAuthorizationCouponCodeEntryViewController;
  -[PKPaymentAuthorizationCouponCodeEntryViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  self->_active = 1;
  -[UITextField becomeFirstResponder](self->_textField, "becomeFirstResponder");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentAuthorizationCouponCodeEntryViewController;
  -[PKPaymentAuthorizationCouponCodeEntryViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  self->_active = 0;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentAuthorizationCouponCodeEntryViewController;
  -[PKPaymentAuthorizationCouponCodeEntryViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[PKPaymentAuthorizationCouponCodeEntryViewController updatePreferredContentSize](self, "updatePreferredContentSize");
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  void *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;
  _BOOL4 v8;
  id WeakRetained;

  objc_msgSend(a3, "resignFirstResponder");
  -[PKPaymentAuthorizationCouponCodeEntryViewController canonicalizedText](self, "canonicalizedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = self->_couponCode;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (!v6 || !v5)
    {

LABEL_9:
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "paymentAuthorizationCouponCodeEntryViewController:didChangeCouponCode:", self, v7);
      goto LABEL_10;
    }
    v8 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

    if (!v8)
      goto LABEL_9;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "paymentAuthorizationCouponCodeEntryViewControllerDidFinish:", self);
LABEL_10:

  return 1;
}

- (BOOL)shouldUpdatePreferredContentSize
{
  return !-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts")|| -[PKPaymentAuthorizationCouponCodeEntryViewController isPaymentStyle](self, "isPaymentStyle");
}

- (void)updatePreferredContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  if (-[PKPaymentAuthorizationCouponCodeEntryViewController shouldUpdatePreferredContentSize](self, "shouldUpdatePreferredContentSize"))
  {
    -[UIScrollView contentSize](self->_scrollView, "contentSize");
    v4 = v3;
    v6 = v5;
    -[UIScrollView contentInset](self->_scrollView, "contentInset");
    -[PKPaymentAuthorizationCouponCodeEntryViewController setPreferredContentSize:](self, "setPreferredContentSize:", v4, v6 + v7);
  }
}

- (void)keyboardDidShow:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  void *v24;
  double height;
  id v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  objc_msgSend(a3, "userInfo");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CGRectValue");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[PKPaymentAuthorizationCouponCodeEntryViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationCouponCodeEntryViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "convertRect:toView:", v15, v6, v8, v10, v12);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  -[PKPaymentAuthorizationCouponCodeEntryViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bounds");
  v29.origin.x = v17;
  v29.origin.y = v19;
  v29.size.width = v21;
  v29.size.height = v23;
  v28 = CGRectIntersection(v27, v29);
  height = v28.size.height;

  -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:", 0.0, 0.0, height, 0.0);
  -[UIScrollView setScrollIndicatorInsets:](self->_scrollView, "setScrollIndicatorInsets:", 0.0, 0.0, height, 0.0);
  -[PKPaymentAuthorizationCouponCodeEntryViewController updatePreferredContentSize](self, "updatePreferredContentSize");

}

- (void)keyboardWillHide:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;

  v4 = *MEMORY[0x1E0DC49E8];
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v7 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:", a3, *MEMORY[0x1E0DC49E8], v5, v6, v7);
  -[UIScrollView setScrollIndicatorInsets:](self->_scrollView, "setScrollIndicatorInsets:", v4, v5, v6, v7);
  -[PKPaymentAuthorizationCouponCodeEntryViewController updatePreferredContentSize](self, "updatePreferredContentSize");
}

- (int64_t)style
{
  return self->_style;
}

- (PKPaymentAuthorizationCouponCodeEntryViewControllerDelegate)delegate
{
  return (PKPaymentAuthorizationCouponCodeEntryViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_firstError, 0);
  objc_storeStrong((id *)&self->_couponCode, 0);
}

@end
