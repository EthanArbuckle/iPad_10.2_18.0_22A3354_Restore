@implementation TPSSubscriptionPickerCell

+ (int64_t)cellStyle
{
  return 3;
}

- (TPSSubscriptionPickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  TPSSubscriptionPickerCell *v4;
  uint64_t v5;
  TPBadgeView *badgeView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UILabel *v14;
  UILabel *nameLabel;
  uint64_t v16;
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
  UILabel *v29;
  UILabel *numberLabel;
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
  uint64_t v46;
  TPBadgeView *centeredBadgeView;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  UILabel *v56;
  UILabel *centeredNameLabel;
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
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  objc_super v84;
  _QWORD v85[14];

  v85[12] = *MEMORY[0x1E0C80C00];
  v84.receiver = self;
  v84.super_class = (Class)TPSSubscriptionPickerCell;
  v4 = -[TPSSubscriptionPickerCell initWithStyle:reuseIdentifier:](&v84, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DBD120]), "initWithTitle:theme:", &stru_1EA2CE0A0, 7);
    badgeView = v4->_badgeView;
    v4->_badgeView = (TPBadgeView *)v5;

    -[TPSSubscriptionPickerCell contentView](v4, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSSubscriptionPickerCell badgeView](v4, "badgeView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

    -[TPBadgeView setTranslatesAutoresizingMaskIntoConstraints:](v4->_badgeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TPSSubscriptionPickerCell badgeView](v4, "badgeView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSSubscriptionPickerCell contentView](v4, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layoutMarginsGuide");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v13);
    v83 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    nameLabel = v4->_nameLabel;
    v4->_nameLabel = v14;

    v16 = *MEMORY[0x1E0CEB538];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_nameLabel, "setFont:", v17);

    -[UILabel setNumberOfLines:](v4->_nameLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_nameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TPSSubscriptionPickerCell contentView](v4, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v4->_nameLabel);

    -[UILabel firstBaselineAnchor](v4->_nameLabel, "firstBaselineAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSSubscriptionPickerCell contentView](v4, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v21, 1.0);
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel leadingAnchor](v4->_nameLabel, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSSubscriptionPickerCell badgeView](v4, "badgeView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA5F8], "defaultMetrics");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "scaledValueForValue:", 4.0);
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v24);
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    -[TPSSubscriptionPickerCell badgeView](v4, "badgeView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "centerYAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel centerYAnchor](v4->_nameLabel, "centerYAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    numberLabel = v4->_numberLabel;
    v4->_numberLabel = v29;

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB590]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_numberLabel, "setFont:", v31);

    -[UILabel setNumberOfLines:](v4->_numberLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_numberLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_numberLabel, "setTextColor:", v32);

    -[TPSSubscriptionPickerCell contentView](v4, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addSubview:", v4->_numberLabel);

    -[UILabel firstBaselineAnchor](v4->_numberLabel, "firstBaselineAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel lastBaselineAnchor](v4->_nameLabel, "lastBaselineAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v35, 1.0);
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel leadingAnchor](v4->_numberLabel, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSSubscriptionPickerCell badgeView](v4, "badgeView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v38);
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel trailingAnchor](v4->_numberLabel, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSSubscriptionPickerCell contentView](v4, "contentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "layoutMarginsGuide");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "trailingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintLessThanOrEqualToAnchor:", v42);
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    -[TPSSubscriptionPickerCell contentView](v4, "contentView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "bottomAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel lastBaselineAnchor](v4->_numberLabel, "lastBaselineAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v45, 1.0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = objc_msgSend(objc_alloc(MEMORY[0x1E0DBD120]), "initWithTitle:theme:", &stru_1EA2CE0A0, 7);
    centeredBadgeView = v4->_centeredBadgeView;
    v4->_centeredBadgeView = (TPBadgeView *)v46;

    -[TPSSubscriptionPickerCell contentView](v4, "contentView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSSubscriptionPickerCell centeredBadgeView](v4, "centeredBadgeView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addSubview:", v49);

    -[TPBadgeView setTranslatesAutoresizingMaskIntoConstraints:](v4->_centeredBadgeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TPSSubscriptionPickerCell centeredBadgeView](v4, "centeredBadgeView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "leadingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSSubscriptionPickerCell contentView](v4, "contentView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "layoutMarginsGuide");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "leadingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    v56 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    centeredNameLabel = v4->_centeredNameLabel;
    v4->_centeredNameLabel = v56;

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v16);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_centeredNameLabel, "setFont:", v58);

    -[UILabel setNumberOfLines:](v4->_centeredNameLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_centeredNameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TPSSubscriptionPickerCell contentView](v4, "contentView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "addSubview:", v4->_centeredNameLabel);

    -[UILabel centerYAnchor](v4->_centeredNameLabel, "centerYAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSSubscriptionPickerCell contentView](v4, "contentView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "centerYAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:", v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel leadingAnchor](v4->_centeredNameLabel, "leadingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSSubscriptionPickerCell centeredBadgeView](v4, "centeredBadgeView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "trailingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA5F8], "defaultMetrics");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "scaledValueForValue:", 4.0);
    objc_msgSend(v64, "constraintEqualToAnchor:constant:", v66);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    -[TPSSubscriptionPickerCell centeredBadgeView](v4, "centeredBadgeView");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "centerYAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel centerYAnchor](v4->_centeredNameLabel, "centerYAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToAnchor:", v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    v73 = (void *)MEMORY[0x1E0CB3718];
    v85[0] = v83;
    v85[1] = v82;
    v85[2] = v81;
    v85[3] = v80;
    v85[4] = v79;
    v85[5] = v78;
    v85[6] = v77;
    v85[7] = v76;
    v85[8] = v55;
    v85[9] = v63;
    v85[10] = v68;
    v85[11] = v72;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 12);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "activateConstraints:", v74);

  }
  return v4;
}

- (void)_setCenteredBadge:(id)a3 andLabel:(id)a4
{
  TPBadgeView *badgeView;
  id v7;
  id v8;

  badgeView = self->_badgeView;
  v8 = a4;
  v7 = a3;
  -[TPBadgeView setHidden:](badgeView, "setHidden:", 1);
  -[UILabel setHidden:](self->_nameLabel, "setHidden:", 1);
  -[UILabel setHidden:](self->_numberLabel, "setHidden:", 1);
  -[TPBadgeView setHidden:](self->_centeredBadgeView, "setHidden:", 0);
  -[UILabel setHidden:](self->_centeredNameLabel, "setHidden:", 0);
  -[TPBadgeView setTitle:](self->_badgeView, "setTitle:", v7);
  -[UILabel setText:](self->_nameLabel, "setText:", v8);
  -[UILabel setText:](self->_numberLabel, "setText:", CFSTR("+1 (123) 456-7890"));
  -[TPBadgeView setTitle:](self->_centeredBadgeView, "setTitle:", v7);

  -[UILabel setText:](self->_centeredNameLabel, "setText:", v8);
}

- (void)_setBadge:(id)a3 andLabel:(id)a4 andPhoneNumber:(id)a5
{
  TPBadgeView *badgeView;
  id v9;
  id v10;
  id v11;

  badgeView = self->_badgeView;
  v9 = a5;
  v11 = a4;
  v10 = a3;
  -[TPBadgeView setHidden:](badgeView, "setHidden:", 0);
  -[UILabel setHidden:](self->_nameLabel, "setHidden:", 0);
  -[UILabel setHidden:](self->_numberLabel, "setHidden:", 0);
  -[TPBadgeView setHidden:](self->_centeredBadgeView, "setHidden:", 1);
  -[UILabel setHidden:](self->_centeredNameLabel, "setHidden:", 1);
  -[TPBadgeView setTitle:](self->_badgeView, "setTitle:", v10);
  -[UILabel setText:](self->_nameLabel, "setText:", v11);
  -[UILabel setText:](self->_numberLabel, "setText:", v9);

  -[TPBadgeView setTitle:](self->_centeredBadgeView, "setTitle:", v10);
  -[UILabel setText:](self->_centeredNameLabel, "setText:", v11);

}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)TPSSubscriptionPickerCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v10, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x1E0D80930], v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "tps_localizedShortLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tps_localizedPhoneNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  TPSLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v12 = "-[TPSSubscriptionPickerCell refreshCellContentsWithSpecifier:]";
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_1DB4B7000, v9, OS_LOG_TYPE_DEFAULT, "%s : Received badge: %@, label: %@, phoneNumber: %@", buf, 0x2Au);
  }

  if (objc_msgSend(v8, "length"))
    -[TPSSubscriptionPickerCell _setBadge:andLabel:andPhoneNumber:](self, "_setBadge:andLabel:andPhoneNumber:", v6, v7, v8);
  else
    -[TPSSubscriptionPickerCell _setCenteredBadge:andLabel:](self, "_setCenteredBadge:andLabel:", v6, v7);
  -[TPSSubscriptionPickerCell setNeedsLayout](self, "setNeedsLayout");

}

- (TPBadgeView)badgeView
{
  return self->_badgeView;
}

- (void)setBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_badgeView, a3);
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (UILabel)numberLabel
{
  return self->_numberLabel;
}

- (void)setNumberLabel:(id)a3
{
  objc_storeStrong((id *)&self->_numberLabel, a3);
}

- (TPBadgeView)centeredBadgeView
{
  return self->_centeredBadgeView;
}

- (void)setCenteredBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_centeredBadgeView, a3);
}

- (UILabel)centeredNameLabel
{
  return self->_centeredNameLabel;
}

- (void)setCenteredNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_centeredNameLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centeredNameLabel, 0);
  objc_storeStrong((id *)&self->_centeredBadgeView, 0);
  objc_storeStrong((id *)&self->_numberLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
}

@end
