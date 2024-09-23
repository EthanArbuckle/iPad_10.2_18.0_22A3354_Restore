@implementation NCAppPickerViewFooter

- (NCAppPickerViewFooter)initWithFrame:(CGRect)a3
{
  NCAppPickerViewFooter *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UIButton *showMoreButton;
  UIButton *v11;
  void *v12;
  void *v13;
  void *v14;
  UIButton *v15;
  void *v16;
  uint64_t v17;
  UILabel *footnoteLabel;
  UILabel *v19;
  void *v20;
  UILabel *v21;
  void *v22;
  UILabel *v23;
  void *v24;
  id v25;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  objc_super v45;

  v45.receiver = self;
  v45.super_class = (Class)NCAppPickerViewFooter;
  v3 = -[NCAppPickerViewFooter initWithFrame:](&v45, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3518]);
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    showMoreButton = v3->_showMoreButton;
    v3->_showMoreButton = (UIButton *)v9;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_showMoreButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton addTarget:action:forControlEvents:](v3->_showMoreButton, "addTarget:action:forControlEvents:", v3, sel__showMoreButtonPressed_, 64);
    v11 = v3->_showMoreButton;
    objc_msgSend((id)objc_opt_class(), "_showMoreButtonText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v11, "setTitle:forState:", v12, 0);

    -[UIButton titleLabel](v3->_showMoreButton, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_showMoreButtonFont");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFont:", v14);

    v15 = v3->_showMoreButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v15, "setTitleColor:forState:", v16, 0);

    -[NCAppPickerViewFooter addSubview:](v3, "addSubview:", v3->_showMoreButton);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
    footnoteLabel = v3->_footnoteLabel;
    v3->_footnoteLabel = (UILabel *)v17;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_footnoteLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v19 = v3->_footnoteLabel;
    objc_msgSend((id)objc_opt_class(), "_footnoteText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v19, "setText:", v20);

    v21 = v3->_footnoteLabel;
    objc_msgSend((id)objc_opt_class(), "_footnoteFont");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v21, "setFont:", v22);

    -[UILabel setNumberOfLines:](v3->_footnoteLabel, "setNumberOfLines:", 0);
    v23 = v3->_footnoteLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v23, "setTextColor:", v24);

    -[UILabel setTextAlignment:](v3->_footnoteLabel, "setTextAlignment:", 1);
    -[NCAppPickerViewFooter addSubview:](v3, "addSubview:", v3->_footnoteLabel);
    v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[UIButton topAnchor](v3->_showMoreButton, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCAppPickerViewFooter topAnchor](v3, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, 8.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v28);

    -[UIButton leadingAnchor](v3->_showMoreButton, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCAppPickerViewFooter leadingAnchor](v3, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v31);

    -[NCAppPickerViewFooter trailingAnchor](v3, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton trailingAnchor](v3->_showMoreButton, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v34);

    -[UILabel leadingAnchor](v3->_footnoteLabel, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCAppPickerViewFooter leadingAnchor](v3, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v37);

    -[NCAppPickerViewFooter trailingAnchor](v3, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v3->_footnoteLabel, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v40);

    -[NCAppPickerViewFooter bottomAnchor](v3, "bottomAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v3->_footnoteLabel, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:constant:", v42, 4.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v43);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v25);
  }
  return v3;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCAppPickerViewFooter;
  -[NCAppPickerViewFooter prepareForReuse](&v3, sel_prepareForReuse);
  -[NCAppPickerViewFooter setDelegate:](self, "setDelegate:", 0);
}

+ (id)reuseIdentifier
{
  return CFSTR("NCAppPickerViewFooter");
}

+ (double)preferredHeightForWidth:(double)a3 showMoreButton:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double Height;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[2];
  CGRect v22;
  CGRect v23;

  v21[1] = *MEMORY[0x1E0C80C00];
  if (!preferredHeightForWidth_showMoreButton____drawingContext)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0DC12A0]);
    v7 = (void *)preferredHeightForWidth_showMoreButton____drawingContext;
    preferredHeightForWidth_showMoreButton____drawingContext = (uint64_t)v6;

    objc_msgSend((id)preferredHeightForWidth_showMoreButton____drawingContext, "setWantsNumberOfLineFragments:", 1);
  }
  if (a4)
  {
    objc_msgSend((id)objc_opt_class(), "_showMoreButtonText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0DC1138];
    v20 = *MEMORY[0x1E0DC1138];
    objc_msgSend((id)objc_opt_class(), "_showMoreButtonFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "boundingRectWithSize:options:attributes:context:", 1, v11, preferredHeightForWidth_showMoreButton____drawingContext, a3, 0.0);
    v12 = CGRectGetHeight(v22) + 8.0;

  }
  else
  {
    v9 = *MEMORY[0x1E0DC1138];
    v12 = 0.0;
  }
  objc_msgSend((id)objc_opt_class(), "_footnoteText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v9;
  objc_msgSend((id)objc_opt_class(), "_footnoteFont");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "boundingRectWithSize:options:attributes:context:", 1, v15, preferredHeightForWidth_showMoreButton____drawingContext, a3, 0.0);
  Height = CGRectGetHeight(v23);

  return v12 + Height + 16.0 + 4.0;
}

- (void)configureWithShowMoreButton:(BOOL)a3 delegate:(id)a4
{
  UIButton *showMoreButton;
  _BOOL8 v6;
  id v7;

  showMoreButton = self->_showMoreButton;
  v6 = !a3;
  v7 = a4;
  -[UIButton setHidden:](showMoreButton, "setHidden:", v6);
  -[NCAppPickerViewFooter setDelegate:](self, "setDelegate:", v7);

}

+ (id)_footnoteText
{
  void *v2;
  void *v3;

  NCUserNotificationsUIKitFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_DIGEST_SETTINGS_CHANGES"), &stru_1E8D21F60, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_footnoteFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
}

+ (id)_showMoreButtonText
{
  void *v2;
  void *v3;

  NCUserNotificationsUIKitFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_DIGEST_SETTINGS_SHOW_MORE"), &stru_1E8D21F60, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_showMoreButtonFont
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v2, "pointSize");
  objc_msgSend(v3, "systemFontOfSize:weight:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_showMoreButtonPressed:(id)a3
{
  id v4;

  -[NCAppPickerViewFooter delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "appPickViewFooterShowMoreButtonPressed:", self);

}

- (NCAppPickerViewFooterDelegate)delegate
{
  return (NCAppPickerViewFooterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_footnoteLabel, 0);
  objc_storeStrong((id *)&self->_showMoreButton, 0);
  objc_storeStrong((id *)&self->_captionLabel, 0);
}

@end
