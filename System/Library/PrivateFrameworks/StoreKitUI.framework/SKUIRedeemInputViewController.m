@implementation SKUIRedeemInputViewController

- (SKUIRedeemInputViewController)initWithRedeemCategory:(int64_t)a3
{
  SKUIRedeemInputViewController *v5;
  SKUIRedeemInputViewController *v6;
  objc_super v8;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIRedeemInputViewController initWithRedeemCategory:].cold.1();
  }
  v8.receiver = self;
  v8.super_class = (Class)SKUIRedeemInputViewController;
  v5 = -[SKUIRedeemInputViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    v5->_category = a3;
    -[SKUIRedeemInputViewController setEdgesForExtendedLayout:](v5, "setEdgesForExtendedLayout:", 0);
  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, 0x1E73BC8F0, 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC54D0], 0);
  -[SKUIRedeemTextField setDelegate:](self->_field, "setDelegate:", 0);
  -[SKUIRedeemITunesPassLockup removeTarget:action:forControlEvents:](self->_passbookLockup, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  v4.receiver = self;
  v4.super_class = (Class)SKUIRedeemInputViewController;
  -[SKUIRedeemInputViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  UIImageView *imageView;
  id v16;
  void *v17;
  void *v18;
  UIImageView *v19;
  UIImageView *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  float v27;
  double v28;
  id v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  double v41;
  float v42;
  SKUIRedeemTextField *v43;
  SKUIRedeemTextField *field;
  double MaxY;
  void *v46;
  uint64_t v47;
  double v48;
  double v49;
  double v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  SKUILinkButton *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  SKUIRedeemITunesPassLockup *passbookLockup;
  SKUIRedeemITunesPassLockup *v63;
  void *v64;
  void *v65;
  void *v66;
  SKUIRedeemITunesPassLockup *v67;
  SKUIRedeemITunesPassLockup *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  float v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  SKUIRedeemITunesPassLockup *v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  CGFloat v88;
  float v89;
  void *v90;
  id v91;
  void *v92;
  UIBarButtonItem *v93;
  UIBarButtonItem *redeemButton;
  UIBarButtonItem *v95;
  void *v96;
  UIBarButtonItem *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  objc_super v102;
  _QWORD v103[2];
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;

  v103[1] = *MEMORY[0x1E0C80C00];
  v102.receiver = self;
  v102.super_class = (Class)SKUIRedeemInputViewController;
  -[SKUIRedeemInputViewController loadView](&v102, sel_loadView);
  -[SKUIRedeemStepViewController clientContext](self, "clientContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemInputViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  v13 = 50.0;
  if (v10 <= 480.0)
    v13 = 28.0;
  if (v12)
    v14 = 30.0;
  else
    v14 = v13;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  imageView = self->_imageView;
  if (!imageView)
  {
    v16 = objc_alloc(MEMORY[0x1E0DC3890]);
    -[SKUIRedeemStepViewController configuration](self, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "inputImage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (UIImageView *)objc_msgSend(v16, "initWithImage:", v18);
    v20 = self->_imageView;
    self->_imageView = v19;

    -[UIImageView setAutoresizingMask:](self->_imageView, "setAutoresizingMask:", 5);
    -[SKUIRedeemStepViewController configuration](self, "configuration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "addObserver:selector:name:object:", self, sel__redeemConfigurationImagesDidLoad_, 0x1E73BC8F0, v21);

    imageView = self->_imageView;
  }
  -[UIImageView frame](imageView, "frame");
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "userInterfaceIdiom");

  v24 = dbl_1BBED1450[(v23 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  v25 = dbl_1BBED1460[(v23 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  objc_msgSend(v4, "frame");
  v27 = (v26 - v25) * 0.5;
  v28 = floorf(v27);
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v28, v14, v25, v24);
  objc_msgSend(v4, "addSubview:", self->_imageView);
  v29 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v29, "setAutoresizingMask:", 2);
  objc_msgSend(v4, "backgroundColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setBackgroundColor:", v30);

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 16.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFont:", v31);

  if (+[SKUIRedeemViewControllerLegacy redeemRequiresNationalId:](SKUIRedeemViewControllerLegacy, "redeemRequiresNationalId:", v3))
  {
    v32 = CFSTR("REDEEM_PROMPT_CN");
  }
  else
  {
    v32 = CFSTR("REDEEM_PROMPT");
  }
  if (v3)
    objc_msgSend(v3, "localizedStringForKey:inTable:", v32, CFSTR("Redeem"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", v32, 0, CFSTR("Redeem"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setText:", v33);

  objc_msgSend(v29, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTextColor:", v34);

  objc_msgSend(v29, "setNumberOfLines:", 0);
  objc_msgSend(v29, "frame");
  objc_msgSend(v4, "frame");
  v36 = v35 + -20.0;
  objc_msgSend(v4, "frame");
  objc_msgSend(v29, "sizeThatFits:", v37 + -20.0, 1.79769313e308);
  v39 = v38;
  v104.origin.x = v28;
  v104.origin.y = v14;
  v104.size.width = v25;
  v104.size.height = v24;
  v40 = CGRectGetMaxY(v104) + 15.0;
  objc_msgSend(v4, "frame");
  v42 = (v41 - v36) * 0.5;
  objc_msgSend(v29, "setFrame:", roundf(v42), v40, v36, v39);
  objc_msgSend(v4, "addSubview:", v29);
  v43 = -[SKUIRedeemInputViewController _newTextFieldWithClientContext:](self, "_newTextFieldWithClientContext:", v3);
  field = self->_field;
  self->_field = v43;

  -[SKUIRedeemTextField setDelegate:](self->_field, "setDelegate:", self);
  -[SKUIRedeemTextField setText:](self->_field, "setText:", self->_initialCode);
  -[SKUIRedeemTextField frame](self->_field, "frame");
  objc_msgSend(v29, "frame");
  MaxY = CGRectGetMaxY(v105);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "userInterfaceIdiom");

  v48 = 6.0;
  if ((v47 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v48 = 30.0;
  v49 = MaxY + v48;
  objc_msgSend(v4, "frame");
  v51 = v50;
  v52 = 0.0;
  v53 = 44.0;
  -[SKUIRedeemTextField setFrame:](self->_field, "setFrame:", 0.0, v49);
  objc_msgSend(v4, "addSubview:", self->_field);
  objc_msgSend(v101, "addObserver:selector:name:object:", self, sel__textFieldTextDidChange_, *MEMORY[0x1E0DC54D0], self->_field);
  v54 = -[SKUILinkButton initWithArrowStyle:]([SKUILinkButton alloc], "initWithArrowStyle:", 0);
  -[SKUILinkButton setAutoresizingMask:](v54, "setAutoresizingMask:", 5);
  v100 = v4;
  if (v3)
    objc_msgSend(v3, "localizedStringForKey:inTable:", CFSTR("REDEEM_TERMS_LINK"), CFSTR("Redeem"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REDEEM_TERMS_LINK"), 0, CFSTR("Redeem"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUILinkButton setTitle:forState:](v54, "setTitle:forState:", v55, 0);

  -[SKUILinkButton titleLabel](v54, "titleLabel");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setFont:", v57);

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUILinkButton setTitleColor:forState:](v54, "setTitleColor:forState:", v58, 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUILinkButton setTitleColor:forState:](v54, "setTitleColor:forState:", v59, 1);

  -[SKUILinkButton addTarget:action:forControlEvents:](v54, "addTarget:action:forControlEvents:", self, sel__termsButtonAction_, 64);
  v60 = v100;
  objc_msgSend(v100, "backgroundColor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUILinkButton setBackgroundColor:](v54, "setBackgroundColor:", v61);

  if (-[SKUIRedeemStepViewController shouldShowPassbookLearnMore](self, "shouldShowPassbookLearnMore"))
  {
    passbookLockup = self->_passbookLockup;
    if (!passbookLockup)
    {
      v63 = [SKUIRedeemITunesPassLockup alloc];
      -[SKUIRedeemStepViewController configuration](self, "configuration");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "ITunesPassConfiguration");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIRedeemStepViewController clientContext](self, "clientContext");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = -[SKUIRedeemITunesPassLockup initWithITunesPassConfiguration:clientContext:](v63, "initWithITunesPassConfiguration:clientContext:", v65, v66);
      v68 = self->_passbookLockup;
      self->_passbookLockup = v67;

      v60 = v100;
      -[SKUIRedeemITunesPassLockup addTarget:action:forControlEvents:](self->_passbookLockup, "addTarget:action:forControlEvents:", self, sel__passbookLockupAction_, 64);
      -[SKUIRedeemITunesPassLockup setAutoresizingMask:](self->_passbookLockup, "setAutoresizingMask:", 5);
      passbookLockup = self->_passbookLockup;
    }
    -[SKUIRedeemITunesPassLockup frame](passbookLockup, "frame");
    -[SKUIRedeemITunesPassLockup sizeThatFits:](self->_passbookLockup, "sizeThatFits:", v8 + -60.0, 1.79769313e308);
    v70 = v69;
    v72 = v71;
    objc_msgSend(v60, "bounds");
    v74 = (v73 - v70) * 0.5;
    v75 = floorf(v74);
    v106.origin.x = 0.0;
    v106.origin.y = v49;
    v106.size.width = v51;
    v106.size.height = 44.0;
    -[SKUIRedeemITunesPassLockup setFrame:](self->_passbookLockup, "setFrame:", v75, CGRectGetMaxY(v106) + 30.0, v70, v72);
    objc_msgSend(v60, "addSubview:", self->_passbookLockup);
  }
  -[SKUILinkButton sizeToFit](v54, "sizeToFit");
  -[SKUILinkButton frame](v54, "frame");
  v77 = v76;
  v79 = v78;
  objc_msgSend(v60, "bounds");
  v81 = v80;
  v82 = self->_passbookLockup;
  if (v82)
  {
    -[SKUIRedeemITunesPassLockup frame](v82, "frame");
    v52 = v83;
    v49 = v84;
    v51 = v85;
    v53 = v86;
    v87 = 30.0;
  }
  else
  {
    v87 = 26.0;
  }
  v107.origin.x = v52;
  v107.origin.y = v49;
  v107.size.width = v51;
  v107.size.height = v53;
  v88 = CGRectGetMaxY(v107) + v87;
  v89 = (v81 - v77) * 0.5;
  -[SKUILinkButton setFrame:](v54, "setFrame:", floorf(v89), v88, v77, v79);
  objc_msgSend(v60, "addSubview:", v54);
  -[SKUIRedeemInputViewController navigationItem](self, "navigationItem");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setHidesBackButton:", 1);
  v91 = objc_alloc_init(MEMORY[0x1E0DC34F0]);
  objc_msgSend(v91, "setAction:", sel__cancelAction_);
  objc_msgSend(v91, "setTarget:", self);
  if (v3)
    objc_msgSend(v3, "localizedStringForKey:inTable:", CFSTR("REDEEM_CANCEL_BUTTON"), CFSTR("Redeem"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REDEEM_CANCEL_BUTTON"), 0, CFSTR("Redeem"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setTitle:", v92);

  objc_msgSend(v90, "setLeftBarButtonItem:", v91);
  v93 = (UIBarButtonItem *)objc_alloc_init(MEMORY[0x1E0DC34F0]);
  redeemButton = self->_redeemButton;
  self->_redeemButton = v93;

  -[UIBarButtonItem setAction:](self->_redeemButton, "setAction:", sel__redeemAction_);
  -[UIBarButtonItem setTarget:](self->_redeemButton, "setTarget:", self);
  v95 = self->_redeemButton;
  if (v3)
    objc_msgSend(v3, "localizedStringForKey:inTable:", CFSTR("REDEEM_REDEEM_BUTTON"), CFSTR("Redeem"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REDEEM_REDEEM_BUTTON"), 0, CFSTR("Redeem"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setTitle:](v95, "setTitle:", v96);

  -[UIBarButtonItem setStyle:](self->_redeemButton, "setStyle:", 2);
  v97 = self->_redeemButton;
  -[SKUIRedeemTextField text](self->_field, "text");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setEnabled:](v97, "setEnabled:", objc_msgSend(v98, "length") != 0);

  v103[0] = self->_redeemButton;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 1);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setRightBarButtonItems:", v99);

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  -[SKUIRedeemInputViewController _redeemAction:](self, "_redeemAction:", 0);
  return 1;
}

- (void)_redeemConfigurationImagesDidLoad:(id)a3
{
  UIImageView *imageView;
  void *v4;
  id v5;

  imageView = self->_imageView;
  -[SKUIRedeemStepViewController configuration](self, "configuration", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inputImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](imageView, "setImage:", v4);

}

- (void)_textFieldTextDidChange:(id)a3
{
  UIBarButtonItem *redeemButton;
  id v4;

  redeemButton = self->_redeemButton;
  -[SKUIRedeemTextField text](self->_field, "text", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setEnabled:](redeemButton, "setEnabled:", objc_msgSend(v4, "length") != 0);

}

- (void)_cancelAction:(id)a3
{
  void *v4;
  id v5;

  -[SKUIRedeemInputViewController parentViewController](self, "parentViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = self;
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_passbookLockupAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SKUIRedeemITunesPassLearnMoreViewController *v8;

  v8 = objc_alloc_init(SKUIRedeemITunesPassLearnMoreViewController);
  -[SKUIRedeemStepViewController clientContext](self, "clientContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemStepViewController setClientContext:](v8, "setClientContext:", v4);

  -[SKUIRedeemStepViewController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemStepViewController setConfiguration:](v8, "setConfiguration:", v5);

  -[SKUIRedeemStepViewController operationQueue](self, "operationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemStepViewController setOperationQueue:](v8, "setOperationQueue:", v6);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v8);
  -[SKUIRedeemInputViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

}

- (void)_redeemAction:(id)a3
{
  SKUIRedeemOperation *v4;
  void *v5;
  SKUIRedeemOperation *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  -[SKUIRedeemTextField resignFirstResponder](self->_field, "resignFirstResponder", a3);
  UIKeyboardOrderOutAutomatic();
  -[SKUIRedeemInputViewController _toggleActivityIndicatorBarButtonItem:](self, "_toggleActivityIndicatorBarButtonItem:", 1);
  v4 = [SKUIRedeemOperation alloc];
  -[SKUIRedeemTextField text](self->_field, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SKUIRedeemOperation initWithCode:](v4, "initWithCode:", v5);

  -[SKUIRedeemOperation setCameraRecognized:](v6, "setCameraRecognized:", 0);
  -[SKUIRedeemStepViewController clientContext](self, "clientContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemOperation setClientContext:](v6, "setClientContext:", v7);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__SKUIRedeemInputViewController__redeemAction___block_invoke;
  v9[3] = &unk_1E73A3B60;
  v9[4] = self;
  -[SKUIRedeemOperation setResultBlock:](v6, "setResultBlock:", v9);
  -[SKUIRedeemStepViewController operationQueue](self, "operationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addOperation:", v6);

}

void __47__SKUIRedeemInputViewController__redeemAction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  SKUIRedeemResultsViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SKUIRedeemResultsViewController *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD aBlock[5];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = -[SKUIRedeemResultsViewController initWithRedeem:]([SKUIRedeemResultsViewController alloc], "initWithRedeem:", v5);
    objc_msgSend(*(id *)(a1 + 32), "clientContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIRedeemStepViewController setClientContext:](v8, "setClientContext:", v9);

    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIRedeemStepViewController setConfiguration:](v8, "setConfiguration:", v10);

    objc_msgSend(*(id *)(a1 + 32), "operationQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIRedeemStepViewController setOperationQueue:](v8, "setOperationQueue:", v11);

    -[SKUIRedeemResultsViewController setRedeemCategory:](v8, "setRedeemCategory:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1000));
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pushViewController:animated:", v8, 1);

    UIKeyboardOrderOutAutomatic();
LABEL_3:

    goto LABEL_4;
  }
  if (v6)
  {
    objc_msgSend(v6, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "valueForKey:", CFSTR("hideError"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend(*(id *)(a1 + 32), "clientContext");
      v15 = (SKUIRedeemResultsViewController *)objc_claimAutoreleasedReturnValue();
      v8 = v15;
      v16 = (void *)MEMORY[0x1E0DC3450];
      if (v15)
        -[SKUIRedeemResultsViewController localizedStringForKey:inTable:](v15, "localizedStringForKey:inTable:", CFSTR("REDEEM_FAILURE_TITLE"), CFSTR("Redeem"));
      else
        +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REDEEM_FAILURE_TITLE"), 0, CFSTR("Redeem"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "alertControllerWithTitle:message:preferredStyle:", v17, v18, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v7, "code") == 9518)
      {
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __47__SKUIRedeemInputViewController__redeemAction___block_invoke_2;
        aBlock[3] = &unk_1E73A3B38;
        aBlock[4] = *(_QWORD *)(a1 + 32);
        v20 = _Block_copy(aBlock);
      }
      else
      {
        v20 = 0;
      }
      v21 = (void *)MEMORY[0x1E0DC3448];
      if (v8)
        -[SKUIRedeemResultsViewController localizedStringForKey:inTable:](v8, "localizedStringForKey:inTable:", CFSTR("REDEEM_OK_BUTTON"), CFSTR("Redeem"));
      else
        +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REDEEM_OK_BUTTON"), 0, CFSTR("Redeem"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "actionWithTitle:style:handler:", v22, 0, v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addAction:", v23);

      objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v19, 1, 0);
      goto LABEL_3;
    }
  }
LABEL_4:
  objc_msgSend(*(id *)(a1 + 32), "_toggleActivityIndicatorBarButtonItem:", 0);

}

void __47__SKUIRedeemInputViewController__redeemAction___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "redeemStepDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "redeemStepViewControllerShouldValidateNationalID:", *(_QWORD *)(a1 + 32));

}

- (void)_termsButtonAction:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99E98], "termsAndConditionsURL", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  SKUIMetricsOpenURL(v3);

}

- (id)_newTextFieldWithClientContext:(id)a3
{
  id v4;
  SKUIRedeemTextField *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  v4 = a3;
  v5 = objc_alloc_init(SKUIRedeemTextField);
  -[SKUIRedeemTextField setAutocapitalizationType:](v5, "setAutocapitalizationType:", 3);
  -[SKUIRedeemTextField setAutocorrectionType:](v5, "setAutocorrectionType:", 1);
  -[SKUIRedeemTextField setAutoresizingMask:](v5, "setAutoresizingMask:", 2);
  -[SKUIRedeemTextField setEnablesReturnKeyAutomatically:](v5, "setEnablesReturnKeyAutomatically:", 1);
  -[SKUIRedeemTextField setReturnKeyType:](v5, "setReturnKeyType:", 9);
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 16.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemTextField setFont:](v5, "setFont:", v6);
  v7 = objc_alloc(MEMORY[0x1E0C99D80]);
  v8 = *MEMORY[0x1E0DC1138];
  -[SKUIRedeemInputViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tintColor");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
  {
    v12 = (void *)objc_msgSend(v7, "initWithObjectsAndKeys:", v6, v8, v10, *MEMORY[0x1E0DC1140], 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.7, 1.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v7, "initWithObjectsAndKeys:", v6, v8, v13, *MEMORY[0x1E0DC1140], 0);

  }
  v14 = objc_alloc(MEMORY[0x1E0CB3498]);
  if (v4)
    objc_msgSend(v4, "localizedStringForKey:inTable:", CFSTR("REDEEM_CODE_PLACEHOLDER"), CFSTR("Redeem"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REDEEM_CODE_PLACEHOLDER"), 0, CFSTR("Redeem"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithString:attributes:", v15, v12);

  -[SKUIRedeemTextField setAttributedPlaceholder:](v5, "setAttributedPlaceholder:", v16);
  return v5;
}

- (void)_toggleActivityIndicatorBarButtonItem:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIBarButtonItem *redeemButton;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 2);
    objc_msgSend(v4, "startAnimating");
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v4);
    -[SKUIRedeemInputViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = self->_redeemButton;
    v9[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRightBarButtonItems:", v7);

  }
  else
  {
    -[SKUIRedeemInputViewController navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    redeemButton = self->_redeemButton;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &redeemButton, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRightBarButtonItems:", v5);
  }

}

- (int64_t)category
{
  return self->_category;
}

- (NSString)initialCode
{
  return self->_initialCode;
}

- (void)setInitialCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redeemButton, 0);
  objc_storeStrong((id *)&self->_passbookLockup, 0);
  objc_storeStrong((id *)&self->_initialCode, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_field, 0);
}

- (void)initWithRedeemCategory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIRedeemInputViewController initWithRedeemCategory:]";
}

@end
