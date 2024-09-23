@implementation TUIStaticIdentitySpecifierButtonsCell

+ (int64_t)cellStyle
{
  return 0;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  NSObject *v26;
  _BOOL8 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  UIStackView *buttonsStackView;
  UIStackView *v35;
  UIStackView *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
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
  objc_super v77;
  _QWORD v78[4];
  uint64_t v79;
  void *v80;
  uint8_t buf[4];
  const char *v82;
  __int16 v83;
  _BOOL4 v84;
  __int16 v85;
  double v86;
  __int16 v87;
  double v88;
  __int16 v89;
  TUIStaticIdentitySpecifierButtonsCell *v90;
  uint64_t v91;
  _QWORD v92[3];

  v92[1] = *MEMORY[0x24BDAC8D0];
  v77.receiver = self;
  v77.super_class = (Class)TUIStaticIdentitySpecifierButtonsCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v77, sel_refreshCellContentsWithSpecifier_, v4);
  -[PSTableCell titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", &stru_251A5E438);

  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75A18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75DA0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("NO_MATCH"), &stru_251A5E438, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("VERIFIED"), &stru_251A5E438, CFSTR("Localizable"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("MARK_AS_VERIFIED_NO_DOTS"), &stru_251A5E438, CFSTR("Localizable"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6F30], "currentTraitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "preferredContentSizeCategory");
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = UIContentSizeCategoryIsAccessibilityCategory(v14);

  v75 = v9;
  if ((_DWORD)v5)
    goto LABEL_7;
  v15 = *MEMORY[0x24BDF65F8];
  v91 = *MEMORY[0x24BDF65F8];
  objc_msgSend(v12, "titleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "font");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v92[0] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v92, &v91, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sizeWithAttributes:", v18);
  UICeilToViewScale();
  v20 = v19;

  -[TUIStaticIdentitySpecifierButtonsCell _tableView](self, "_tableView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "frame");
  -[TUIStaticIdentitySpecifierButtonsCell _tableView](self, "_tableView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "layoutMargins");
  -[TUIStaticIdentitySpecifierButtonsCell _tableView](self, "_tableView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "layoutMargins");
  -[UIStackView spacing](self->_buttonsStackView, "spacing");
  UICeilToViewScale();
  v25 = v24;

  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_21 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_21, &__block_literal_global_169);
  v26 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_21;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    v82 = "-[TUIStaticIdentitySpecifierButtonsCell refreshCellContentsWithSpecifier:]";
    v83 = 1024;
    v84 = v20 > v25;
    v85 = 2048;
    v86 = v25;
    v87 = 2048;
    v88 = v20;
    v89 = 2114;
    v90 = self;
    _os_log_debug_impl(&dword_2493EE000, v26, OS_LOG_TYPE_DEBUG, "%s verticalLayout = %d (cellHalfWidth = %f, stringWidth = %f) on %{public}@", buf, 0x30u);
  }
  if (v20 > v25)
  {
LABEL_7:
    v27 = 1;
  }
  else
  {
    if (objc_msgSend(v7, "BOOLValue"))
      v28 = v74;
    else
      v28 = v76;
    v79 = v15;
    objc_msgSend(v12, "titleLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "font");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = v30;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "sizeWithAttributes:", v31);
    UICeilToViewScale();
    v33 = v32;

    v27 = v33 > v25;
  }
  buttonsStackView = self->_buttonsStackView;
  if (buttonsStackView)
    -[UIStackView removeFromSuperview](buttonsStackView, "removeFromSuperview");
  v35 = (UIStackView *)objc_alloc_init(MEMORY[0x24BDF6DD0]);
  v36 = self->_buttonsStackView;
  self->_buttonsStackView = v35;

  -[UIStackView setAxis:](self->_buttonsStackView, "setAxis:", v27);
  -[UIStackView setSpacing:](self->_buttonsStackView, "setSpacing:", 12.0);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_buttonsStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAlignment:](self->_buttonsStackView, "setAlignment:", 0);
  -[UIStackView setDistribution:](self->_buttonsStackView, "setDistribution:", 1);
  objc_msgSend(v12, "setTitle:forState:", v9, 0);
  objc_msgSend(MEMORY[0x24BDF6888], "grayButtonConfiguration");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setContentInsets:", 10.0, 0.0, 10.0, 0.0);
  objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setBaseForegroundColor:", v38);

  objc_msgSend(v12, "setConfiguration:", v37);
  objc_msgSend(v12, "titleLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setTextAlignment:", 1);

  objc_msgSend(v12, "setEnabled:", objc_msgSend(v6, "BOOLValue"));
  objc_msgSend(v12, "addTarget:action:forControlEvents:", self, sel_noMatchTapped_, 64);
  -[UIStackView addArrangedSubview:](self->_buttonsStackView, "addArrangedSubview:", v12);
  objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v37, "setBaseForegroundColor:", 0);
  v41 = objc_msgSend(v7, "BOOLValue");
  v42 = v76;
  if (v41)
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("checkmark.circle.fill"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setImage:", v43);

    objc_msgSend(v37, "setImagePadding:", 5.0);
    objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithTextStyle:scale:", *MEMORY[0x24BDF77E8], -1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setPreferredSymbolConfigurationForImage:", v44);

    objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setBaseForegroundColor:", v45);

    v42 = v74;
  }
  objc_msgSend(v40, "setTitle:forState:", v42, 0);
  objc_msgSend(v40, "setConfiguration:", v37);
  objc_msgSend(v40, "titleLabel");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setTextAlignment:", 1);

  v72 = v37;
  v73 = v6;
  v71 = v7;
  if (objc_msgSend(v6, "BOOLValue"))
    v47 = objc_msgSend(v7, "BOOLValue") ^ 1;
  else
    v47 = 0;
  objc_msgSend(v40, "setEnabled:", v47);
  objc_msgSend(v40, "addTarget:action:forControlEvents:", self, sel_markAsVerifiedTapped_, 64);
  -[UIStackView addArrangedSubview:](self->_buttonsStackView, "addArrangedSubview:", v40);
  -[TUIStaticIdentitySpecifierButtonsCell contentView](self, "contentView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addSubview:", self->_buttonsStackView);

  v62 = (void *)MEMORY[0x24BDD1628];
  -[UIStackView topAnchor](self->_buttonsStackView, "topAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIStaticIdentitySpecifierButtonsCell contentView](self, "contentView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "topAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:", v68);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = v67;
  -[UIStackView leadingAnchor](self->_buttonsStackView, "leadingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIStaticIdentitySpecifierButtonsCell contentView](self, "contentView");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "layoutMarginsGuide");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "leadingAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:", v63);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v78[1] = v61;
  -[UIStackView trailingAnchor](self->_buttonsStackView, "trailingAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIStaticIdentitySpecifierButtonsCell contentView](self, "contentView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "layoutMarginsGuide");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "trailingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "constraintEqualToAnchor:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v78[2] = v51;
  -[UIStackView bottomAnchor](self->_buttonsStackView, "bottomAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIStaticIdentitySpecifierButtonsCell contentView](self, "contentView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "layoutMarginsGuide");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "bottomAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:constant:", v55, -5.0);
  v60 = v40;
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v78[3] = v56;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v78, 4);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "activateConstraints:", v57);

  -[TUIStaticIdentitySpecifierButtonsCell setNeedsLayout](self, "setNeedsLayout");
}

void __74__TUIStaticIdentitySpecifierButtonsCell_refreshCellContentsWithSpecifier___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_21;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_21 = (uint64_t)v0;

}

- (void)noMatchTapped:(id)a3
{
  id v3;

  -[PSTableCell specifier](self, "specifier", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performConfirmationAlternateAction");

}

- (void)markAsVerifiedTapped:(id)a3
{
  id v3;

  -[PSTableCell specifier](self, "specifier", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performConfirmationAction");

}

- (UIStackView)buttonsStackView
{
  return self->_buttonsStackView;
}

- (void)setButtonsStackView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonsStackView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonsStackView, 0);
}

@end
