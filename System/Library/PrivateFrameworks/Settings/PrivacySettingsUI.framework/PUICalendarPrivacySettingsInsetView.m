@implementation PUICalendarPrivacySettingsInsetView

- (PUICalendarPrivacySettingsInsetView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  PUICalendarPrivacySettingsInsetView *v5;
  id v6;
  id v7;
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
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  PUICalendarPrivacySettingsInsetView *v33;
  objc_super v34;
  _QWORD v35[5];

  v35[4] = *MEMORY[0x1E0C80C00];
  v34.receiver = self;
  v34.super_class = (Class)PUICalendarPrivacySettingsInsetView;
  v5 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v34, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  if (v5)
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D201C0]), "initWithBundleIdentifier:", 0);
    -[PUICalendarPrivacySettingsInsetView contentView](v5, "contentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUICalendarPrivacySettingsInsetView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v33 = v5;
    v6 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v6, "setAxis:", 1);
    objc_msgSend(v6, "setLayoutMargins:", 5.0, 0.0, 5.0, 0.0);
    objc_msgSend(v6, "setLayoutMarginsRelativeArrangement:", 1);
    objc_msgSend(v32, "addSubview:", v6);
    v7 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v7, "setAxis:", 1);
    objc_msgSend(v7, "setLayoutMargins:", 15.0, 15.0, 10.0, 15.0);
    objc_msgSend(v7, "setLayoutMarginsRelativeArrangement:", 1);
    v25 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v6, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v29, 0.5);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v28;
    objc_msgSend(v6, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v26, 0.5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v8;
    objc_msgSend(v32, "trailingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v10, 0.5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2] = v11;
    objc_msgSend(v32, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v13, 0.5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v35[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "activateConstraints:", v15);

    objc_msgSend(v31, "previewTableView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addArrangedSubview:", v16);

    v17 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFont:", v18);

    PUI_LocalizedStringForPrivacy(CFSTR("CALENDARS_PREVIEW_TABLE_TITLE"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", v19);

    objc_msgSend(v7, "addArrangedSubview:", v17);
    v20 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFont:", v21);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTextColor:", v22);

    objc_msgSend(v20, "setNumberOfLines:", 0);
    objc_msgSend(v31, "settingsViewSubtitle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setText:", v23);

    objc_msgSend(v7, "addArrangedSubview:", v20);
    objc_msgSend(v6, "addArrangedSubview:", v7);
    objc_msgSend(v6, "setCustomSpacing:afterView:", v20, 8.0);

    v5 = v33;
  }
  return v5;
}

@end
