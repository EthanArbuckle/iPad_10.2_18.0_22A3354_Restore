@implementation PRWidgetEducationView

- (PRWidgetEducationView)initWithFrame:(CGRect)a3
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
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
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
  _PRWidgetEducationHeaderView *v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  PRWidgetEducationView *val;
  _QWORD v59[4];
  id v60;
  id location;
  objc_super v62;
  _QWORD v63[10];
  _QWORD v64[6];

  v64[4] = *MEMORY[0x1E0C80C00];
  v62.receiver = self;
  v62.super_class = (Class)PRWidgetEducationView;
  val = -[PRWidgetEducationView initWithFrame:](&v62, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (val)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRWidgetEducationView setBackgroundColor:](val, "setBackgroundColor:", v3);

    v53 = objc_alloc_init(_PRWidgetEducationHeaderView);
    v56 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setFont:", v4);

    objc_msgSend(v56, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(v56, "setTextAlignment:", 1);
    objc_msgSend(v56, "setNumberOfLines:", 0);
    PRBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("WIDGET_EDUCATION_TITLE"), &stru_1E2186E08, CFSTR("PosterKit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setText:", v6);

    v57 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setFont:", v7);

    objc_msgSend(v57, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setTextColor:", v8);

    objc_msgSend(v57, "setTextAlignment:", 1);
    objc_msgSend(v57, "setNumberOfLines:", 0);
    PRBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("WIDGET_EDUCATION_BODY"), &stru_1E2186E08, CFSTR("PosterKit"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setText:", v10);

    objc_msgSend(MEMORY[0x1E0DC3520], "filledButtonConfiguration");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setButtonSize:", 3);
    PRBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E2186E08, CFSTR("PosterKit"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setTitle:", v12);

    v55 = objc_alloc_init(MEMORY[0x1E0DC3518]);
    objc_msgSend(v55, "setConfiguration:", v54);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setTintColor:", v13);

    objc_initWeak(&location, val);
    v14 = (void *)MEMORY[0x1E0DC3428];
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __39__PRWidgetEducationView_initWithFrame___block_invoke;
    v59[3] = &unk_1E2183D00;
    objc_copyWeak(&v60, &location);
    objc_msgSend(v14, "actionWithHandler:", v59);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "addAction:forControlEvents:");
    v15 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v64[0] = v53;
    v64[1] = v56;
    v64[2] = v57;
    v64[3] = v55;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithArrangedSubviews:", v16);

    objc_msgSend(v17, "setSpacing:", 12.0);
    objc_msgSend(v17, "setCustomSpacing:afterView:", v53, 20.0);
    objc_msgSend(v17, "setCustomSpacing:afterView:", v57, 24.0);
    objc_msgSend(v17, "setAxis:", 1);
    objc_msgSend(v17, "setAlignment:", 3);
    objc_msgSend(v17, "setLayoutMarginsRelativeArrangement:", 1);
    objc_msgSend(v17, "setLayoutMargins:", 24.0, 24.0, 24.0, 24.0);
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v18 = objc_alloc_init(MEMORY[0x1E0DC3C28]);
    objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PRWidgetEducationView addSubview:](val, "addSubview:", v18);
    objc_msgSend(v18, "addSubview:", v17);
    objc_storeStrong((id *)&val->_contentView, v17);
    v29 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v55, "widthAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRWidgetEducationView widthAnchor](val, "widthAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:multiplier:", v51, 0.6);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = v50;
    objc_msgSend(v17, "leadingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v48);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v63[1] = v47;
    objc_msgSend(v17, "trailingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "trailingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v45);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v63[2] = v44;
    objc_msgSend(v17, "topAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "topAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v42);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v63[3] = v41;
    objc_msgSend(v17, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bottomAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v63[4] = v38;
    objc_msgSend(v17, "widthAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "widthAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v36);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v63[5] = v35;
    objc_msgSend(v18, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRWidgetEducationView leadingAnchor](val, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v63[6] = v32;
    objc_msgSend(v18, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRWidgetEducationView trailingAnchor](val, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v63[7] = v19;
    objc_msgSend(v18, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRWidgetEducationView bottomAnchor](val, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v63[8] = v22;
    objc_msgSend(v18, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRWidgetEducationView topAnchor](val, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v63[9] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "activateConstraints:", v26);

    objc_destroyWeak(&v60);
    objc_destroyWeak(&location);

  }
  return val;
}

void __39__PRWidgetEducationView_initWithFrame___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "widgetEducationViewDidDismiss:", WeakRetained);

}

- (UIView)contentView
{
  return self->_contentView;
}

- (PRWidgetEducationViewDelegate)delegate
{
  return (PRWidgetEducationViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
