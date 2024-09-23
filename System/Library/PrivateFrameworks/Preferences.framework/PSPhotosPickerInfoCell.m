@implementation PSPhotosPickerInfoCell

- (PSPhotosPickerInfoCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  PSPhotosPickerInfoCell *v5;
  PSPhotosPickerInfoCell *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
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
  PSPhotosPickerInfoCell *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
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
  void *v44;
  objc_super v45;
  _QWORD v46[9];

  v46[7] = *MEMORY[0x1E0C80C00];
  v45.receiver = self;
  v45.super_class = (Class)PSPhotosPickerInfoCell;
  v5 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v45, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[PSPhotosPickerInfoCell contentView](v5, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(MEMORY[0x1E0CEA700]);
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v9);

    objc_msgSend(v8, "setNumberOfLines:", 0);
    objc_msgSend(v7, "addSubview:", v8);
    v10 = objc_alloc_init(MEMORY[0x1E0CEA700]);
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB540]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFont:", v11);

    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextColor:", v12);

    objc_msgSend(v10, "setNumberOfLines:", 0);
    objc_msgSend(v7, "addSubview:", v10);
    PS_LocalizedStringForSystemPolicy(CFSTR("PHOTOS_PICKER_INFO_TITLE"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v13);

    PS_LocalizedStringForSystemPolicy(CFSTR("PHOTOS_PICKER_INFO_BODY"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v14);

    -[PSPhotosPickerInfoCell contentView](v6, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layoutMarginsGuide");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v8, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v7;
    objc_msgSend(v7, "topAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v43, 2.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v42;
    objc_msgSend(v8, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v38;
    v40 = v8;
    objc_msgSend(v8, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v36);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v35;
    objc_msgSend(v10, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v30, 1.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v46[3] = v29;
    objc_msgSend(v10, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v16;
    objc_msgSend(v16, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v27);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v46[4] = v17;
    objc_msgSend(v10, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v46[5] = v20;
    objc_msgSend(v7, "bottomAnchor");
    v21 = v6;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v23, 2.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v46[6] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 7);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "activateConstraints:", v25);

    v6 = v21;
  }
  return v6;
}

@end
