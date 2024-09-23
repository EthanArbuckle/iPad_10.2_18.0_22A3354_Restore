@implementation VSErrorViewController

- (VSErrorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  VSErrorViewController *v8;
  VSFontCenter *v9;
  VSFontCenter *fontCenter;
  void *v11;
  id v12;
  objc_super v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  VSRequireMainThread();
  v14.receiver = self;
  v14.super_class = (Class)VSErrorViewController;
  v8 = -[VSErrorViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, v7, v6);

  if (v8)
  {
    v9 = -[VSFontCenter initWithTraitEnvironment:]([VSFontCenter alloc], "initWithTraitEnvironment:", v8);
    fontCenter = v8->_fontCenter;
    v8->_fontCenter = v9;

    v15[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)-[VSErrorViewController registerForTraitChanges:withHandler:](v8, "registerForTraitChanges:withHandler:", v11, &__block_literal_global);

  }
  return v8;
}

void __48__VSErrorViewController_initWithNibName_bundle___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_msgSend(v2, "fontCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setTraitCollection:", v3);
}

- (void)dealloc
{
  objc_super v3;

  VSRequireMainThread();
  v3.receiver = self;
  v3.super_class = (Class)VSErrorViewController;
  -[VSErrorViewController dealloc](&v3, sel_dealloc);
}

- (void)_updateText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (-[VSErrorViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[VSErrorViewController error](self, "error");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSErrorViewController titleLabel](self, "titleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setText:", v3);

    objc_msgSend(v10, "localizedRecoverySuggestion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSErrorViewController messageLabel](self, "messageLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v5);

    objc_msgSend(v10, "localizedRecoveryOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[VSErrorViewController recoveryButton](self, "recoveryButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:forState:", v8, 0);

  }
}

- (void)_recoveryButtonPressed:(id)a3
{
  void *v3;
  id v4;

  -[VSErrorViewController error](self, "error", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recoveryAttempter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attemptRecoveryFromError:optionIndex:delegate:didRecoverSelector:contextInfo:", v4, 0, 0, 0, 0);

}

- (void)setError:(id)a3
{
  NSError *v5;
  NSError *v6;

  v5 = (NSError *)a3;
  if (self->_error != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_error, a3);
    -[VSErrorViewController _updateText](self, "_updateText");
    v5 = v6;
  }

}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
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
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  VSMultilineButton *v35;
  void *v36;
  void *v37;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)VSErrorViewController;
  -[VSErrorViewController viewDidLoad](&v38, sel_viewDidLoad);
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[VSErrorViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BDF6D50]);
  objc_msgSend(v4, "bounds");
  v6 = (void *)objc_msgSend(v5, "initWithFrame:");
  objc_msgSend(v6, "setAutoresizingMask:", 18);
  objc_msgSend(MEMORY[0x24BDF6950], "groupTableViewBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

  objc_msgSend(v4, "addSubview:", v6);
  v8 = objc_alloc_init(MEMORY[0x24BDF6DD0]);
  objc_msgSend(v8, "setAxis:", 1);
  objc_msgSend(v8, "setAlignment:", 3);
  objc_msgSend(v8, "setSpacing:", 20.0);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "addSubview:", v8);
  objc_msgSend(v8, "leftAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutMarginsGuide");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leftAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  objc_msgSend(v8, "rightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutMarginsGuide");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rightAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v16);

  objc_msgSend(v6, "leftAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v19);

  objc_msgSend(v6, "rightAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v22);

  objc_msgSend(v8, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutMarginsGuide");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:constant:", v25, 75.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v26);

  objc_msgSend(v6, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v29);

  -[VSErrorViewController fontCenter](self, "fontCenter");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  VSMainConcurrencyBindingOptions();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "vs_bind:toObject:withKeyPath:options:", CFSTR("font"), v30, CFSTR("title1Font"), v32);

  objc_msgSend(v31, "setNumberOfLines:", 0);
  objc_msgSend(v31, "setTextAlignment:", 1);
  -[VSErrorViewController setTitleLabel:](self, "setTitleLabel:", v31);
  objc_msgSend(v8, "addArrangedSubview:", v31);
  v33 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  VSMainConcurrencyBindingOptions();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "vs_bind:toObject:withKeyPath:options:", CFSTR("font"), v30, CFSTR("bodyFont"), v34);

  objc_msgSend(v33, "setNumberOfLines:", 0);
  objc_msgSend(v33, "setTextAlignment:", 1);
  -[VSErrorViewController setMessageLabel:](self, "setMessageLabel:", v33);
  objc_msgSend(v8, "addArrangedSubview:", v33);
  v35 = objc_alloc_init(VSMultilineButton);
  if (-[VSErrorViewController isRecoveryDestructive](self, "isRecoveryDestructive"))
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSMultilineButton setTintColor:](v35, "setTintColor:", v36);

  }
  -[VSMultilineButton addTarget:action:forControlEvents:](v35, "addTarget:action:forControlEvents:", self, sel__recoveryButtonPressed_, 64);
  -[VSMultilineButton titleLabel](v35, "titleLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setNumberOfLines:", 0);

  -[VSErrorViewController setRecoveryButton:](self, "setRecoveryButton:", v35);
  objc_msgSend(v8, "addArrangedSubview:", v35);
  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v3);
  -[VSErrorViewController _updateText](self, "_updateText");

}

- (NSError)error
{
  return self->_error;
}

- (BOOL)isRecoveryDestructive
{
  return self->_recoveryDestructive;
}

- (void)setRecoveryDestructive:(BOOL)a3
{
  self->_recoveryDestructive = a3;
}

- (UIButton)recoveryButton
{
  return self->_recoveryButton;
}

- (void)setRecoveryButton:(id)a3
{
  objc_storeStrong((id *)&self->_recoveryButton, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_messageLabel, a3);
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
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_recoveryButton, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
