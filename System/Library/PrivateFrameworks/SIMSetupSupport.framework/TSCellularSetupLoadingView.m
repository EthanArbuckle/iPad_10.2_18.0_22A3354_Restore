@implementation TSCellularSetupLoadingView

- (TSCellularSetupLoadingView)initWithFrame:(CGRect)a3
{
  TSCellularSetupLoadingView *v3;
  TSCellularSetupLoadingView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSCellularSetupLoadingView;
  v3 = -[TSCellularSetupLoadingView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[TSCellularSetupLoadingView _setupLabels](v3, "_setupLabels");
    -[TSCellularSetupLoadingView _setupActivityIndicator](v4, "_setupActivityIndicator");
  }
  return v4;
}

- (void)_setupLabels
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;

  v37 = (id)objc_opt_new();
  -[TSCellularSetupLoadingView setFirstLabel:](self, "setFirstLabel:", v37);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Please wait while the page is loading..."), &stru_24DEF4290, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setText:", v4);

  objc_msgSend(v37, "setNumberOfLines:", 0);
  objc_msgSend(v37, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v37, "setLineBreakMode:", 0);
  objc_msgSend(v37, "setTextAlignment:", 1);
  v5 = *MEMORY[0x24BEBE1D0];
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setFont:", v6);

  objc_msgSend(v37, "setFrame:", 0.0, 0.0, 40.0, 20.0);
  -[TSCellularSetupLoadingView addSubview:](self, "addSubview:", v37);
  objc_msgSend(v37, "setIsAccessibilityElement:", 1);
  objc_msgSend(v37, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setAccessibilityLabel:", v7);

  objc_msgSend(v37, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v37, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularSetupLoadingView topAnchor](self, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, 130.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", 1);

  objc_msgSend(v37, "centerXAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularSetupLoadingView centerXAnchor](self, "centerXAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

  objc_msgSend(v37, "heightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularSetupLoadingView heightAnchor](self, "heightAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintLessThanOrEqualToAnchor:multiplier:", v15, 1.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  objc_msgSend(v37, "widthAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularSetupLoadingView widthAnchor](self, "widthAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintLessThanOrEqualToAnchor:multiplier:", v18, 1.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setActive:", 1);

  v20 = (void *)objc_opt_new();
  -[TSCellularSetupLoadingView setSecondLabel:](self, "setSecondLabel:", v20);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("This should only take a few seconds to complete."), &stru_24DEF4290, CFSTR("Localizable"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setText:", v22);

  objc_msgSend(v20, "setNumberOfLines:", 0);
  objc_msgSend(v20, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v20, "setLineBreakMode:", 0);
  objc_msgSend(v20, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFont:", v23);

  objc_msgSend(v20, "setFrame:", 0.0, 0.0, 40.0, 20.0);
  -[TSCellularSetupLoadingView addSubview:](self, "addSubview:", v20);
  objc_msgSend(v20, "setIsAccessibilityElement:", 1);
  objc_msgSend(v20, "text");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAccessibilityLabel:", v24);

  objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v20, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, 15.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setActive:", 1);

  objc_msgSend(v20, "centerXAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularSetupLoadingView centerXAnchor](self, "centerXAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setActive:", 1);

  objc_msgSend(v20, "heightAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularSetupLoadingView heightAnchor](self, "heightAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintLessThanOrEqualToAnchor:multiplier:", v32, 1.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setActive:", 1);

  objc_msgSend(v20, "widthAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularSetupLoadingView widthAnchor](self, "widthAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintLessThanOrEqualToAnchor:multiplier:", v35, 1.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setActive:", 1);

}

- (void)_setupActivityIndicator
{
  void *v3;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
  -[TSCellularSetupLoadingView setSpinner:](self, "setSpinner:", v3);

  -[TSCellularSetupLoadingView spinner](self, "spinner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidesWhenStopped:", 1);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularSetupLoadingView spinner](self, "spinner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularSetupLoadingView spinner](self, "spinner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setColor:", v7);

  -[TSCellularSetupLoadingView spinner](self, "spinner");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClipsToBounds:", 1);

  -[TSCellularSetupLoadingView spinner](self, "spinner");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularSetupLoadingView addSubview:](self, "addSubview:", v10);

  -[TSCellularSetupLoadingView spinner](self, "spinner");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIsAccessibilityElement:", 1);

  -[TSCellularSetupLoadingView spinner](self, "spinner");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[TSCellularSetupLoadingView spinner](self, "spinner");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularSetupLoadingView secondLabel](self, "secondLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, 30.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

  -[TSCellularSetupLoadingView spinner](self, "spinner");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "centerXAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularSetupLoadingView centerXAnchor](self, "centerXAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  -[TSCellularSetupLoadingView spinnerStartAnimating](self, "spinnerStartAnimating");
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSCellularSetupLoadingView;
  -[TSCellularSetupLoadingView layoutSubviews](&v7, sel_layoutSubviews);
  +[TSUtilities backgroundColorForRemotePlan:](TSUtilities, "backgroundColorForRemotePlan:", -[TSCellularSetupLoadingView isRemotePlan](self, "isRemotePlan"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularSetupLoadingView setBackgroundColor:](self, "setBackgroundColor:", v3);

  +[TSUtilities textColorForRemotePlan:](TSUtilities, "textColorForRemotePlan:", -[TSCellularSetupLoadingView isRemotePlan](self, "isRemotePlan"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularSetupLoadingView firstLabel](self, "firstLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v4);

  -[TSCellularSetupLoadingView secondLabel](self, "secondLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v4);

}

- (void)spinnerStartAnimating
{
  void *v3;
  char v4;
  id v5;

  -[TSCellularSetupLoadingView spinner](self, "spinner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAnimating");

  if ((v4 & 1) == 0)
  {
    -[TSCellularSetupLoadingView spinner](self, "spinner");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startAnimating");

  }
}

- (void)spinnerStopAnimating
{
  void *v3;
  int v4;
  id v5;

  -[TSCellularSetupLoadingView spinner](self, "spinner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAnimating");

  if (v4)
  {
    -[TSCellularSetupLoadingView spinner](self, "spinner");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopAnimating");

  }
}

- (BOOL)isRemotePlan
{
  return self->_isRemotePlan;
}

- (void)setIsRemotePlan:(BOOL)a3
{
  self->_isRemotePlan = a3;
}

- (UILabel)firstLabel
{
  return self->_firstLabel;
}

- (void)setFirstLabel:(id)a3
{
  objc_storeStrong((id *)&self->_firstLabel, a3);
}

- (UILabel)secondLabel
{
  return self->_secondLabel;
}

- (void)setSecondLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondLabel, a3);
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_secondLabel, 0);
  objc_storeStrong((id *)&self->_firstLabel, 0);
}

@end
