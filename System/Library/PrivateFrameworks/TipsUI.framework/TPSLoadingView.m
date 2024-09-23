@implementation TPSLoadingView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingIndicatorView, 0);
  objc_storeStrong((id *)&self->_loadingLabel, 0);
  objc_storeStrong((id *)&self->_loadingLayoutGuide, 0);
}

- (TPSLoadingView)initWithLoadingLabel:(BOOL)a3
{
  _BOOL4 v3;
  TPSLoadingView *v4;
  TPSLoadingView *v5;
  UILayoutGuide *v6;
  UILayoutGuide *loadingLayoutGuide;
  uint64_t v8;
  UIActivityIndicatorView *loadingIndicatorView;
  id v10;
  uint64_t v11;
  UILabel *loadingLabel;
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
  void *v37;
  void *v38;
  objc_super v40;

  v3 = a3;
  v40.receiver = self;
  v40.super_class = (Class)TPSLoadingView;
  v4 = -[TPSLoadingView init](&v40, sel_init);
  v5 = v4;
  if (v4 && !v4->_loadingLayoutGuide)
  {
    v6 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x24BEBD718]);
    loadingLayoutGuide = v5->_loadingLayoutGuide;
    v5->_loadingLayoutGuide = v6;

    -[TPSLoadingView addLayoutGuide:](v5, "addLayoutGuide:", v5->_loadingLayoutGuide);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    loadingIndicatorView = v5->_loadingIndicatorView;
    v5->_loadingIndicatorView = (UIActivityIndicatorView *)v8;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v5->_loadingIndicatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TPSLoadingView addSubview:](v5, "addSubview:", v5->_loadingIndicatorView);
    if (v3)
    {
      v10 = objc_alloc(MEMORY[0x24BEBD708]);
      v11 = objc_msgSend(v10, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      loadingLabel = v5->_loadingLabel;
      v5->_loadingLabel = (UILabel *)v11;

      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_loadingLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UILabel setNumberOfLines:](v5->_loadingLabel, "setNumberOfLines:", 0);
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("LOADING"), &stru_24C5E0A00, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](v5->_loadingLabel, "setText:", v14);

      -[UILabel setTextAlignment:](v5->_loadingLabel, "setTextAlignment:", 1);
      +[TPSAppearance preferredFontForTextStyle:](TPSAppearance, "preferredFontForTextStyle:", *MEMORY[0x24BEBE1E8]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v5->_loadingLabel, "setFont:", v15);

      -[TPSLoadingView addSubview:](v5, "addSubview:", v5->_loadingLabel);
      -[UILabel firstBaselineAnchor](v5->_loadingLabel, "firstBaselineAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIActivityIndicatorView bottomAnchor](v5->_loadingIndicatorView, "bottomAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v17, 1.0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setActive:", 1);

      -[UILabel centerXAnchor](v5->_loadingLabel, "centerXAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide centerXAnchor](v5->_loadingLayoutGuide, "centerXAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToAnchor:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setActive:", 1);

      +[TPSAppearance secondaryLabelColor](TPSAppearance, "secondaryLabelColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v5->_loadingLabel, "setTextColor:", v22);

      -[UILayoutGuide bottomAnchor](v5->_loadingLayoutGuide, "bottomAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v5->_loadingLabel;
    }
    else
    {
      -[UILayoutGuide bottomAnchor](v5->_loadingLayoutGuide, "bottomAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v5->_loadingIndicatorView;
    }
    objc_msgSend(v24, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setActive:", 1);

    -[UIActivityIndicatorView centerXAnchor](v5->_loadingIndicatorView, "centerXAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide centerXAnchor](v5->_loadingLayoutGuide, "centerXAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setActive:", 1);

    -[UILayoutGuide topAnchor](v5->_loadingLayoutGuide, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView topAnchor](v5->_loadingIndicatorView, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setActive:", 1);

    -[UILayoutGuide centerXAnchor](v5->_loadingLayoutGuide, "centerXAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSLoadingView centerXAnchor](v5, "centerXAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setActive:", 1);

    -[UILayoutGuide centerYAnchor](v5->_loadingLayoutGuide, "centerYAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSLoadingView centerYAnchor](v5, "centerYAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setActive:", 1);

    -[UIActivityIndicatorView startAnimating](v5->_loadingIndicatorView, "startAnimating");
  }
  return v5;
}

- (TPSLoadingView)init
{
  return -[TPSLoadingView initWithLoadingLabel:](self, "initWithLoadingLabel:", 0);
}

@end
