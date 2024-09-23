@implementation VSTwoFactorEntryViewController_iOS

- (VSTwoFactorEntryViewController_iOS)initWithNibName:(id)a3 bundle:(id)a4
{
  VSTwoFactorEntryViewController_iOS *v4;
  VSFontCenter *v5;
  VSFontCenter *fontCenter;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VSTwoFactorEntryViewController_iOS;
  v4 = -[VSTwoFactorEntryViewController_iOS initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = -[VSFontCenter initWithTraitEnvironment:]([VSFontCenter alloc], "initWithTraitEnvironment:", v4);
    fontCenter = v4->_fontCenter;
    v4->_fontCenter = v5;

  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[VSTwoFactorEntryViewController_iOS stopObservingViewModel:](self, "stopObservingViewModel:", self->_viewModel);
  v3.receiver = self;
  v3.super_class = (Class)VSTwoFactorEntryViewController_iOS;
  -[VSTwoFactorEntryViewController_iOS dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  VSIdentityProviderLogoView *v8;
  void *v9;
  id v10;
  void *v11;
  VSFontCenter *fontCenter;
  void *v13;
  id v14;
  void *v15;
  VSFontCenter *v16;
  void *v17;
  VSTwoFactorDigitView *v18;
  void *v19;
  VSTwoFactorDigitView *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  VSMultilineButton *v30;
  void *v31;
  void *v32;
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
  void *v43;
  void *v44;
  void *v45;
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
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  double v103;
  void *v104;
  void *v105;
  id v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  VSIdentityProviderLogoView *v111;
  VSTwoFactorDigitView *v112;
  id obj;
  VSTwoFactorEntryViewController_iOS *v114;
  void *v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  objc_super v124;
  _QWORD v125[2];
  _BYTE v126[128];
  _BYTE v127[128];
  uint64_t v128;

  v128 = *MEMORY[0x24BDAC8D0];
  v124.receiver = self;
  v124.super_class = (Class)VSTwoFactorEntryViewController_iOS;
  -[VSTwoFactorEntryViewController_iOS viewDidLoad](&v124, sel_viewDidLoad);
  -[VSTwoFactorEntryViewController_iOS view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDF6D50]);
  -[VSTwoFactorEntryViewController_iOS setScrollView:](self, "setScrollView:", v4);
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setAlwaysBounceVertical:", 1);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "systemGroupedBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  v115 = v3;
  objc_msgSend(v3, "addSubview:", v4);
  -[VSTwoFactorEntryViewController_iOS viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSTwoFactorEntryViewController_iOS setTitle:](self, "setTitle:", v7);

  v8 = objc_alloc_init(VSIdentityProviderLogoView);
  -[VSIdentityProviderLogoView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "logo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSIdentityProviderLogoView setLogo:](v8, "setLogo:", v9);

  objc_msgSend(v4, "addSubview:", v8);
  v111 = v8;
  -[VSTwoFactorEntryViewController_iOS setLogoView:](self, "setLogoView:", v8);
  v10 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "headerText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v11);

  objc_msgSend(v10, "setNumberOfLines:", 0);
  objc_msgSend(v10, "setTextAlignment:", 1);
  fontCenter = self->_fontCenter;
  VSMainConcurrencyBindingOptions();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "vs_bind:toObject:withKeyPath:options:", CFSTR("font"), fontCenter, CFSTR("title2Font"), v13);

  v110 = v10;
  objc_msgSend(v4, "addSubview:", v10);
  v14 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "message");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v15);

  objc_msgSend(v14, "setNumberOfLines:", 0);
  objc_msgSend(v14, "setTextAlignment:", 1);
  v16 = self->_fontCenter;
  VSMainConcurrencyBindingOptions();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "vs_bind:toObject:withKeyPath:options:", CFSTR("font"), v16, CFSTR("subheadlineFont"), v17);

  v109 = v14;
  objc_msgSend(v4, "addSubview:", v14);
  v18 = [VSTwoFactorDigitView alloc];
  objc_msgSend(v6, "twoFactorTextField");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[VSTwoFactorDigitView initWithDigitCount:](v18, "initWithDigitCount:", objc_msgSend(v19, "expectedLength"));

  -[VSTwoFactorEntryViewController_iOS setDigitView:](self, "setDigitView:", v20);
  v114 = self;
  -[VSTwoFactorDigitView setDelegate:](v20, "setDelegate:", self);
  -[VSTwoFactorDigitView setTranslatesAutoresizingMaskIntoConstraints:](v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "twoFactorTextField");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSTwoFactorDigitView setKeyboardType:](v20, "setKeyboardType:", objc_msgSend(v21, "keyboardType"));

  objc_msgSend(v6, "twoFactorTextField");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSTwoFactorDigitView setAutocapitalizationType:](v20, "setAutocapitalizationType:", objc_msgSend(v22, "autocapitalizationType"));

  v107 = v4;
  v112 = v20;
  objc_msgSend(v4, "addSubview:", v20);
  v23 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v108 = v6;
  objc_msgSend(v6, "buttons");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v120, v127, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v121;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v121 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * i);
        v30 = objc_alloc_init(VSMultilineButton);
        objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSMultilineButton setTitleColor:forState:](v30, "setTitleColor:forState:", v31, 1);

        objc_msgSend(v29, "text");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSMultilineButton setTitle:forState:](v30, "setTitle:forState:", v32, 0);

        -[VSMultilineButton titleLabel](v30, "titleLabel");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setTextAlignment:", 1);

        -[VSMultilineButton titleLabel](v30, "titleLabel");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setNumberOfLines:", 0);

        -[VSMultilineButton addTarget:action:forControlEvents:](v30, "addTarget:action:forControlEvents:", v114, sel_buttonPressed_, 64);
        objc_msgSend(v23, "addObject:", v30);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v120, v127, 16);
    }
    while (v26);
  }

  -[VSTwoFactorEntryViewController_iOS setButtons:](v114, "setButtons:", v23);
  objc_msgSend(v107, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "topAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setActive:", 1);

  objc_msgSend(v107, "bottomAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "bottomAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setActive:", 1);

  objc_msgSend(v107, "leftAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "leftAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setActive:", 1);

  objc_msgSend(v107, "rightAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "rightAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setActive:", 1);

  -[VSIdentityProviderLogoView topAnchor](v111, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "topAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:constant:", v48, 10.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setActive:", 1);

  -[VSIdentityProviderLogoView centerXAnchor](v111, "centerXAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "centerXAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setActive:", 1);

  objc_msgSend(v110, "topAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSIdentityProviderLogoView bottomAnchor](v111, "bottomAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:constant:", v54, 15.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setActive:", 1);

  objc_msgSend(v110, "leftAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "safeAreaLayoutGuide");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "leftAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setActive:", 1);

  objc_msgSend(v110, "rightAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "safeAreaLayoutGuide");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "rightAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "constraintEqualToAnchor:", v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setActive:", 1);

  objc_msgSend(v109, "topAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "bottomAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "constraintEqualToAnchor:constant:", v65, 10.0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setActive:", 1);

  objc_msgSend(v109, "leftAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "safeAreaLayoutGuide");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "leftAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintEqualToAnchor:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setActive:", 1);

  objc_msgSend(v109, "rightAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "safeAreaLayoutGuide");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "rightAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToAnchor:", v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setActive:", 1);

  -[VSTwoFactorDigitView topAnchor](v20, "topAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "bottomAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "constraintEqualToAnchor:constant:", v76, 10.0);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setActive:", 1);

  -[VSTwoFactorDigitView heightAnchor](v20, "heightAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "constraintEqualToConstant:", 50.0);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setActive:", 1);

  -[VSTwoFactorDigitView centerXAnchor](v20, "centerXAnchor");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "centerXAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "constraintEqualToAnchor:", v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setActive:", 1);

  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  obj = v23;
  v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v126, 16);
  if (v83)
  {
    v84 = v83;
    v85 = 0;
    v86 = *(_QWORD *)v117;
    do
    {
      v87 = 0;
      v88 = v85;
      do
      {
        if (*(_QWORD *)v117 != v86)
          objc_enumerationMutation(obj);
        v89 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * v87);
        objc_msgSend(v89, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v115, "addSubview:", v89);
        objc_msgSend(v89, "centerXAnchor");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "centerXAnchor");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "constraintEqualToAnchor:", v91);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "setActive:", 1);

        objc_msgSend(v89, "leftAnchor");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "safeAreaLayoutGuide");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "leftAnchor");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "constraintGreaterThanOrEqualToAnchor:", v95);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "setActive:", 1);

        objc_msgSend(v89, "rightAnchor");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "safeAreaLayoutGuide");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "rightAnchor");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "constraintLessThanOrEqualToAnchor:", v99);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "setActive:", 1);

        objc_msgSend(v89, "topAnchor");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        if (v88)
        {
          objc_msgSend(v88, "bottomAnchor");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          v103 = 10.0;
        }
        else
        {
          -[VSTwoFactorDigitView bottomAnchor](v112, "bottomAnchor");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          v103 = 20.0;
        }
        objc_msgSend(v101, "constraintEqualToAnchor:constant:", v102, v103);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "setActive:", 1);

        v85 = v89;
        ++v87;
        v88 = v85;
      }
      while (v84 != v87);
      v84 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v126, 16);
    }
    while (v84);
  }
  else
  {
    v85 = 0;
  }

  v125[0] = objc_opt_class();
  v125[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v125, 2);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = (id)-[VSTwoFactorEntryViewController_iOS registerForTraitChanges:withHandler:](v114, "registerForTraitChanges:withHandler:", v105, &__block_literal_global_8);

  VSAuthenticationViewControllerViewDidLoad(v114);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VSTwoFactorEntryViewController_iOS;
  -[VSTwoFactorEntryViewController_iOS viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  VSAuthenticationViewControllerViewWillAppear(self);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  int v6;
  dispatch_time_t v7;
  _QWORD block[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VSTwoFactorEntryViewController_iOS;
  -[VSTwoFactorEntryViewController_iOS viewDidAppear:](&v9, sel_viewDidAppear_, a3);
  -[VSTwoFactorEntryViewController_iOS viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "twoFactorTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "autoShowKeyboard");

  if (v6)
  {
    v7 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52__VSTwoFactorEntryViewController_iOS_viewDidAppear___block_invoke;
    block[3] = &unk_24FE19778;
    block[4] = self;
    dispatch_after(v7, MEMORY[0x24BDAC9B8], block);
  }
  VSAuthenticationViewControllerViewDidAppear(self);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VSTwoFactorEntryViewController_iOS;
  -[VSTwoFactorEntryViewController_iOS viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  VSAuthenticationViewControllerViewWillDisappear(self);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VSTwoFactorEntryViewController_iOS;
  -[VSTwoFactorEntryViewController_iOS viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  VSAuthenticationViewControllerViewWillDisappear(self);
}

- (void)verifyButtonPressed:(id)a3
{
  id v3;

  -[VSTwoFactorEntryViewController_iOS viewModel](self, "viewModel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValidationState:", 1);

}

- (void)buttonPressed:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = (void *)MEMORY[0x24BDBCE88];
    v6 = *MEMORY[0x24BDBCAB8];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "raise:format:", v6, CFSTR("Unexpectedly, sender was %@, instead of VSMultilineButton."), v8);

  }
  v9 = v4;
  -[VSTwoFactorEntryViewController_iOS buttons](self, "buttons");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "indexOfObject:", v9);

  VSDefaultLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v15 = v11;
    _os_log_impl(&dword_2303C5000, v12, OS_LOG_TYPE_DEFAULT, "Generic two factor button with index %lu pressed.", buf, 0xCu);
  }

  -[VSTwoFactorEntryViewController_iOS viewModel](self, "viewModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "buttonAtIndexWasPressed:", v11);

}

- (void)startObservingViewModel:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = kVSKeyValueObservingContext_LogoImage;
  v5 = a3;
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("logo"), 4, v4);
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("beginValidationButtonEnabled"), 4, kVSKeyValueObservingContext_VerifyButton);
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("validationState"), 3, kVSKeyValueObservingContext_ValidationState);
  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("twoFactorTextField.text"), 3, kVSKeyValueObservingContext_TwoFactorCode);

}

- (void)stopObservingViewModel:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = kVSKeyValueObservingContext_LogoImage;
  v5 = a3;
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("logo"), v4);
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("beginValidationButtonEnabled"), kVSKeyValueObservingContext_VerifyButton);
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("validationState"), kVSKeyValueObservingContext_ValidationState);
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("twoFactorTextField.text"), kVSKeyValueObservingContext_TwoFactorCode);

}

- (void)setViewModel:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  VSTwoFactorEntryViewModel *v8;

  v8 = (VSTwoFactorEntryViewModel *)a3;
  if (self->_viewModel != v8)
  {
    -[VSTwoFactorEntryViewController_iOS stopObservingViewModel:](self, "stopObservingViewModel:");
    objc_storeStrong((id *)&self->_viewModel, a3);
    v5 = objc_alloc(MEMORY[0x24BDF6860]);
    -[VSCuratedViewModel beginValidationButtonTitle](v8, "beginValidationButtonTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithTitle:style:target:action:", v6, 0, self, sel_verifyButtonPressed_);

    objc_msgSend(v7, "setEnabled:", 0);
    -[VSTwoFactorEntryViewController_iOS setVerifyButton:](self, "setVerifyButton:", v7);
    -[VSTwoFactorEntryViewController_iOS startObservingViewModel:](self, "startObservingViewModel:", v8);

  }
}

- (CGSize)preferredLogoSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[VSTwoFactorEntryViewController_iOS logoView](self, "logoView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredImageSize");
  v4 = v3;
  v6 = v5;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v8;

  v10 = v6 * v9;
  v11 = v4 * v9;
  result.height = v10;
  result.width = v11;
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if ((void *)kVSKeyValueObservingContext_LogoImage == a6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = (void *)MEMORY[0x24BDBCE88];
      v15 = *MEMORY[0x24BDBCAB8];
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "raise:format:", v15, CFSTR("Unexpectedly, objectOrNil was %@, instead of VSTwoFactorEntryViewModel."), v17);

    }
    v18 = v11;
    if (!v10)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The keyPathOrNil parameter must not be nil."));
    objc_msgSend(v18, "valueForKeyPath:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSTwoFactorEntryViewController_iOS logoView](self, "logoView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setLogo:", v19);

    goto LABEL_12;
  }
  if ((void *)kVSKeyValueObservingContext_VerifyButton == a6)
  {
    -[VSTwoFactorEntryViewController_iOS verifyButton](self, "verifyButton");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    -[VSTwoFactorEntryViewController_iOS viewModel](self, "viewModel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setEnabled:", objc_msgSend(v21, "isBeginValidationButtonEnabled"));

LABEL_12:
    goto LABEL_13;
  }
  if ((void *)kVSKeyValueObservingContext_ValidationState == a6)
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E80]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "unsignedIntegerValue");

    objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "unsignedIntegerValue");

    if (v24 == 2 || v24 == 1)
      -[VSTwoFactorEntryViewController_iOS resignFirstResponder](self, "resignFirstResponder");
  }
  else if ((void *)kVSKeyValueObservingContext_TwoFactorCode != a6)
  {
    v25.receiver = self;
    v25.super_class = (Class)VSTwoFactorEntryViewController_iOS;
    -[VSTwoFactorEntryViewController_iOS observeValueForKeyPath:ofObject:change:context:](&v25, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }
LABEL_13:

}

- (void)scrollViewDidScroll:(id)a3
{
  id v3;

  -[VSTwoFactorEntryViewController_iOS digitView](self, "digitView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resignFirstResponder");

}

- (void)twoFactorDigitView:(id)a3 textDidChange:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[VSTwoFactorEntryViewController_iOS viewModel](self, "viewModel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "twoFactorTextField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

}

- (BOOL)isCancellationAllowed
{
  return self->_cancellationAllowed;
}

- (void)setCancellationAllowed:(BOOL)a3
{
  self->_cancellationAllowed = a3;
}

- (VSAuthenticationViewControllerDelegate)delegate
{
  return (VSAuthenticationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VSTwoFactorEntryViewModel)viewModel
{
  return self->_viewModel;
}

- (UIBarButtonItem)verifyButton
{
  return self->_verifyButton;
}

- (void)setVerifyButton:(id)a3
{
  objc_storeStrong((id *)&self->_verifyButton, a3);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (VSTwoFactorDigitView)digitView
{
  return self->_digitView;
}

- (void)setDigitView:(id)a3
{
  objc_storeStrong((id *)&self->_digitView, a3);
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
  objc_storeStrong((id *)&self->_buttons, a3);
}

- (VSIdentityProviderLogoView)logoView
{
  return self->_logoView;
}

- (void)setLogoView:(id)a3
{
  objc_storeStrong((id *)&self->_logoView, a3);
}

- (VSFontCenter)fontCenter
{
  return self->_fontCenter;
}

- (void)setFontCenter:(id)a3
{
  objc_storeStrong((id *)&self->_fontCenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontCenter, 0);
  objc_storeStrong((id *)&self->_logoView, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_digitView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_verifyButton, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
