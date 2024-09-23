@implementation VSAutoAuthenticationViewController_iOS

- (VSAutoAuthenticationViewController_iOS)initWithCoder:(id)a3
{
  VSAutoAuthenticationViewController_iOS *v3;
  VSAutoAuthenticationViewController_iOS *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSAutoAuthenticationViewController_iOS;
  v3 = -[VSAutoAuthenticationViewController_iOS initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    commonInit_5(v3);
  return v4;
}

- (VSAutoAuthenticationViewController_iOS)initWithNibName:(id)a3 bundle:(id)a4
{
  VSAutoAuthenticationViewController_iOS *v4;
  VSAutoAuthenticationViewController_iOS *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VSAutoAuthenticationViewController_iOS;
  v4 = -[VSAutoAuthenticationViewController_iOS initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    commonInit_5(v4);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[VSAutoAuthenticationViewController_iOS _stopObservingViewModel:](self, "_stopObservingViewModel:", self->_viewModel);
  v3.receiver = self;
  v3.super_class = (Class)VSAutoAuthenticationViewController_iOS;
  -[VSAutoAuthenticationViewController_iOS dealloc](&v3, sel_dealloc);
}

- (void)_startObservingViewModel:(id)a3
{
  objc_msgSend(a3, "addObserver:forKeyPath:options:context:", self, CFSTR("logo"), 4, kVSKeyValueObservingContext_ViewModelImage);
}

- (void)_stopObservingViewModel:(id)a3
{
  objc_msgSend(a3, "removeObserver:forKeyPath:context:", self, CFSTR("logo"), kVSKeyValueObservingContext_ViewModelImage);
}

- (void)_manualSignInButtonPressed:(id)a3
{
  id v3;

  -[VSAutoAuthenticationViewController_iOS viewModel](self, "viewModel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didSelectManualSignInButton");

}

- (void)setViewModel:(id)a3
{
  void *v5;
  void *v6;
  VSAutoAuthenticationViewModel *v7;

  v7 = (VSAutoAuthenticationViewModel *)a3;
  if (self->_viewModel != v7)
  {
    -[VSAutoAuthenticationViewController_iOS _stopObservingViewModel:](self, "_stopObservingViewModel:");
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[VSAutoAuthenticationViewController_iOS logoView](self, "logoView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSCuratedViewModel logoAccessibilityLabel](v7, "logoAccessibilityLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityLabel:", v6);

    -[VSAutoAuthenticationViewController_iOS _startObservingViewModel:](self, "_startObservingViewModel:", self->_viewModel);
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

  -[VSAutoAuthenticationViewController_iOS logoView](self, "logoView");
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
  id v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)kVSKeyValueObservingContext_ViewModelImage == a6)
  {
    if (!v11)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The objectOrNil parameter must not be nil."));
    v13 = v11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = (void *)MEMORY[0x24BDBCE88];
      v15 = *MEMORY[0x24BDBCAB8];
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "raise:format:", v15, CFSTR("Unexpectedly, object was %@, instead of VSAutoAuthenticationViewModel."), v17);

    }
    v18 = v13;
    if (!v10)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The keyPathOrNil parameter must not be nil."));
    objc_msgSend(v18, "valueForKeyPath:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSAutoAuthenticationViewController_iOS logoView](self, "logoView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setLogo:", v19);

  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)VSAutoAuthenticationViewController_iOS;
    -[VSAutoAuthenticationViewController_iOS observeValueForKeyPath:ofObject:change:context:](&v21, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  VSIdentityProviderLogoView *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  VSMultilineButton *v25;
  void *v26;
  void *v27;
  void *v28;
  VSIdentityProviderLogoView *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
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
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  VSIdentityProviderLogoView *v56;
  void *v57;
  void *v58;
  VSIdentityProviderLogoView *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  VSMultilineButton *v82;
  void *v83;
  VSAutoAuthenticationViewController_iOS *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id obj;
  uint64_t v92;
  void *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  objc_super v98;
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  v98.receiver = self;
  v98.super_class = (Class)VSAutoAuthenticationViewController_iOS;
  -[VSAutoAuthenticationViewController_iOS viewDidLoad](&v98, sel_viewDidLoad);
  -[VSAutoAuthenticationViewController_iOS view](self, "view");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDF6D50]);
  -[VSAutoAuthenticationViewController_iOS setScrollView:](self, "setScrollView:", v3);
  objc_msgSend(v3, "setAlwaysBounceVertical:", 1);
  objc_msgSend(MEMORY[0x24BDF6950], "groupTableViewBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v90, "addSubview:", v3);
  -[VSAutoAuthenticationViewController_iOS viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSAutoAuthenticationViewController_iOS setTitle:](self, "setTitle:", v6);

  v7 = objc_alloc_init(VSIdentityProviderLogoView);
  objc_msgSend(v5, "logo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSIdentityProviderLogoView setLogo:](v7, "setLogo:", v8);

  -[VSAutoAuthenticationViewController_iOS setLogoView:](self, "setLogoView:", v7);
  -[VSAutoAuthenticationViewController_iOS fontCenter](self, "fontCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(v5, "accountName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v11);

  objc_msgSend(v10, "setNumberOfLines:", 0);
  objc_msgSend(v10, "setTextAlignment:", 1);
  VSMainConcurrencyBindingOptions();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = v10;
  objc_msgSend(v10, "vs_bind:toObject:withKeyPath:options:", CFSTR("font"), v9, CFSTR("title2Font"), v12);

  -[VSAutoAuthenticationViewController_iOS setAccountNameLabel:](self, "setAccountNameLabel:", v10);
  v13 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(v5, "messageTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v14);

  objc_msgSend(v13, "setNumberOfLines:", 0);
  objc_msgSend(v13, "setTextAlignment:", 1);
  VSMainConcurrencyBindingOptions();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v13;
  objc_msgSend(v13, "vs_bind:toObject:withKeyPath:options:", CFSTR("font"), v9, CFSTR("bodyFont"), v15);

  -[VSAutoAuthenticationViewController_iOS setMessageTitleLabel:](self, "setMessageTitleLabel:", v13);
  v16 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(v5, "message");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v17);

  objc_msgSend(v16, "setNumberOfLines:", 0);
  objc_msgSend(v16, "setTextAlignment:", 1);
  VSMainConcurrencyBindingOptions();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v16;
  objc_msgSend(v16, "vs_bind:toObject:withKeyPath:options:", CFSTR("font"), v9, CFSTR("bodyFont"), v18);

  -[VSAutoAuthenticationViewController_iOS setMessageLabel:](self, "setMessageLabel:", v16);
  v19 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(v5, "notice");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setText:", v20);

  objc_msgSend(v19, "setNumberOfLines:", 0);
  objc_msgSend(v19, "setTextAlignment:", 1);
  VSMainConcurrencyBindingOptions();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v19;
  objc_msgSend(v19, "vs_bind:toObject:withKeyPath:options:", CFSTR("font"), v9, CFSTR("footnoteFont"), v21);

  -[VSAutoAuthenticationViewController_iOS setNoticeLabel:](self, "setNoticeLabel:", v19);
  v22 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(v5, "manualSignInTitle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setText:", v23);

  objc_msgSend(v22, "setNumberOfLines:", 0);
  objc_msgSend(v22, "setTextAlignment:", 1);
  VSMainConcurrencyBindingOptions();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v22;
  objc_msgSend(v22, "vs_bind:toObject:withKeyPath:options:", CFSTR("font"), v9, CFSTR("footnoteFont"), v24);

  -[VSAutoAuthenticationViewController_iOS setManualSignInTitleLabel:](self, "setManualSignInTitleLabel:", v22);
  v25 = objc_alloc_init(VSMultilineButton);
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSMultilineButton setTitleColor:forState:](v25, "setTitleColor:forState:", v26, 1);

  -[VSMultilineButton titleLabel](v25, "titleLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setNumberOfLines:", 0);

  v83 = v5;
  v28 = v5;
  v29 = v7;
  objc_msgSend(v28, "manualSignInButtonText");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSMultilineButton setTitle:forState:](v25, "setTitle:forState:", v30, 0);

  -[VSMultilineButton addTarget:action:forControlEvents:](v25, "addTarget:action:forControlEvents:", self, sel__manualSignInButtonPressed_, 0x2000);
  -[VSMultilineButton titleLabel](v25, "titleLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setTextAlignment:", 1);
  VSMainConcurrencyBindingOptions();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v31;
  objc_msgSend(v31, "vs_bind:toObject:withKeyPath:options:", CFSTR("font"), v9, CFSTR("bodyFont"), v32);

  -[VSAutoAuthenticationViewController_iOS setManualSignInButton:](self, "setManualSignInButton:", v25);
  v33 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("CREDENTIAL_ENTRY_FOOTER"), 0, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v35, "mutableCopy");

  objc_msgSend(v36, "appendString:", CFSTR(" "));
  objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("CREDENTIAL_ENTRY_FOOTER_IOS"), 0, 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "appendString:", v38);

  v79 = v36;
  objc_msgSend(v33, "setText:", v36);
  objc_msgSend(v33, "setNumberOfLines:", 0);
  objc_msgSend(v33, "setTextAlignment:", 1);
  VSMainConcurrencyBindingOptions();
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "vs_bind:toObject:withKeyPath:options:", CFSTR("font"), v9, CFSTR("footnoteFont"), v39);

  v84 = self;
  -[VSAutoAuthenticationViewController_iOS setFooterLabel:](self, "setFooterLabel:", v33);
  v40 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v90, "leftAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leftAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addObject:", v43);

  objc_msgSend(v90, "rightAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addObject:", v46);

  objc_msgSend(v90, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addObject:", v49);

  objc_msgSend(v90, "bottomAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = v40;
  objc_msgSend(v40, "addObject:", v52);

  v82 = v25;
  v80 = v33;
  _NSDictionaryOfVariableBindings(CFSTR("logoView, footerLabel, accountNameLabel, messageTitleLabel, messageLabel, noticeLabel, manualSignInTitleLabel, manualSignInButton"), v29, v33, v89, v88, v87, v86, v85, v25, 0);
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v99, 16);
  if (v53)
  {
    v54 = v53;
    v92 = *(_QWORD *)v95;
    do
    {
      for (i = 0; i != v54; ++i)
      {
        if (*(_QWORD *)v95 != v92)
          objc_enumerationMutation(obj);
        v56 = *(VSIdentityProviderLogoView **)(*((_QWORD *)&v94 + 1) + 8 * i);
        -[VSIdentityProviderLogoView setTranslatesAutoresizingMaskIntoConstraints:](v56, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v3, "addSubview:", v56);
        if (v56 == v29)
        {
          -[VSIdentityProviderLogoView leftAnchor](v29, "leftAnchor");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "leftAnchor");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "constraintEqualToAnchor:", v68);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "addObject:", v69);

          -[VSIdentityProviderLogoView rightAnchor](v29, "rightAnchor");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "rightAnchor");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "constraintEqualToAnchor:", v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "addObject:", v65);
        }
        else
        {
          -[VSIdentityProviderLogoView leadingAnchor](v56, "leadingAnchor");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "readableContentGuide");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "leadingAnchor");
          v59 = v29;
          v60 = v3;
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "constraintEqualToAnchor:constant:", v61, 10.0);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "addObject:", v62);

          v3 = v60;
          v29 = v59;

          -[VSIdentityProviderLogoView trailingAnchor](v56, "trailingAnchor");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "readableContentGuide");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "trailingAnchor");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "constraintEqualToAnchor:constant:", v65, -10.0);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "addObject:", v66);

        }
      }
      v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v99, 16);
    }
    while (v54);
  }
  v77 = v3;

  v70 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v70, "setObject:forKey:", &unk_24FE3CF40, CFSTR("logoBottomSpace"));
  objc_msgSend(v70, "setObject:forKey:", &unk_24FE3CF50, CFSTR("accountBottomSpace"));
  objc_msgSend(v70, "setObject:forKey:", &unk_24FE3CF60, CFSTR("titleBottomSpace"));
  objc_msgSend(v70, "setObject:forKey:", &unk_24FE3CF60, CFSTR("messageBottomSpace"));
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[logoView]-(logoBottomSpace)-[accountNameLabel]-(accountBottomSpace)-[messageTitleLabel]-(titleBottomSpace)-[messageLabel]-(messageBottomSpace)-[noticeLabel]-[footerLabel]|"), 0, v70, v78);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "addObjectsFromArray:", v71);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[noticeLabel]-(>=26)-[manualSignInTitleLabel]-(12)-[manualSignInButton]"), 0, v70, v78);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "addObjectsFromArray:", v72);

  -[VSMultilineButton bottomAnchor](v82, "bottomAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "bottomAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "constraintEqualToAnchor:constant:", v74, -16.0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v76) = 1144733696;
  objc_msgSend(v75, "setPriority:", v76);
  objc_msgSend(v93, "addObject:", v75);
  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v93);
  objc_msgSend(v90, "layoutIfNeeded");
  VSAuthenticationViewControllerViewDidLoad(v84);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  objc_super v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v28.receiver = self;
  v28.super_class = (Class)VSAutoAuthenticationViewController_iOS;
  -[VSAutoAuthenticationViewController_iOS viewDidLayoutSubviews](&v28, sel_viewDidLayoutSubviews);
  -[VSAutoAuthenticationViewController_iOS scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentInset");
  v25 = v5;
  v26 = v4;
  v27 = v6;
  -[VSAutoAuthenticationViewController_iOS manualSignInTitleLabel](self, "manualSignInTitleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[VSAutoAuthenticationViewController_iOS manualSignInButton](self, "manualSignInButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v29.origin.x = v9;
  v29.origin.y = v11;
  v29.size.width = v13;
  v29.size.height = v15;
  v31.origin.x = v18;
  v31.origin.y = v20;
  v31.size.width = v22;
  v31.size.height = v24;
  v30 = CGRectUnion(v29, v31);
  objc_msgSend(v3, "setContentInset:", v26, v25, CGRectGetHeight(v30) + 26.0 + 16.0, v27);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VSAutoAuthenticationViewController_iOS;
  -[VSAutoAuthenticationViewController_iOS viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  VSAuthenticationViewControllerViewWillAppear(self);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VSAutoAuthenticationViewController_iOS;
  -[VSAutoAuthenticationViewController_iOS viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  VSAuthenticationViewControllerViewDidAppear(self);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VSAutoAuthenticationViewController_iOS;
  -[VSAutoAuthenticationViewController_iOS viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  VSAuthenticationViewControllerViewWillDisappear(self);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VSAutoAuthenticationViewController_iOS;
  -[VSAutoAuthenticationViewController_iOS viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  VSAuthenticationViewControllerViewDidDisappear(self);
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

- (VSAutoAuthenticationViewModel)viewModel
{
  return self->_viewModel;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (VSIdentityProviderLogoView)logoView
{
  return self->_logoView;
}

- (void)setLogoView:(id)a3
{
  objc_storeStrong((id *)&self->_logoView, a3);
}

- (UILabel)accountNameLabel
{
  return self->_accountNameLabel;
}

- (void)setAccountNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_accountNameLabel, a3);
}

- (UILabel)messageTitleLabel
{
  return self->_messageTitleLabel;
}

- (void)setMessageTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_messageTitleLabel, a3);
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_messageLabel, a3);
}

- (UILabel)noticeLabel
{
  return self->_noticeLabel;
}

- (void)setNoticeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_noticeLabel, a3);
}

- (UILabel)manualSignInTitleLabel
{
  return self->_manualSignInTitleLabel;
}

- (void)setManualSignInTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_manualSignInTitleLabel, a3);
}

- (UIButton)manualSignInButton
{
  return self->_manualSignInButton;
}

- (void)setManualSignInButton:(id)a3
{
  objc_storeStrong((id *)&self->_manualSignInButton, a3);
}

- (UILabel)footerLabel
{
  return self->_footerLabel;
}

- (void)setFooterLabel:(id)a3
{
  objc_storeStrong((id *)&self->_footerLabel, a3);
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
  objc_storeStrong((id *)&self->_footerLabel, 0);
  objc_storeStrong((id *)&self->_manualSignInButton, 0);
  objc_storeStrong((id *)&self->_manualSignInTitleLabel, 0);
  objc_storeStrong((id *)&self->_noticeLabel, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_messageTitleLabel, 0);
  objc_storeStrong((id *)&self->_accountNameLabel, 0);
  objc_storeStrong((id *)&self->_logoView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
