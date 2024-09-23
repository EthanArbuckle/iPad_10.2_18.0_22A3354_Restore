@implementation TUIStaticIdentitySpecifierCell

+ (int64_t)cellStyle
{
  return 3;
}

- (TUIStaticIdentitySpecifierCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6;
  TUIStaticIdentitySpecifierCell *v7;
  id v8;
  uint64_t v9;
  UITextView *textView;
  UITextView *v11;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  objc_super v34;
  _QWORD v35[5];

  v35[4] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_21 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_21, &__block_literal_global_22);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_21, OS_LOG_TYPE_DEBUG))
    -[TUIStaticIdentitySpecifierCell initWithStyle:reuseIdentifier:].cold.1();
  v34.receiver = self;
  v34.super_class = (Class)TUIStaticIdentitySpecifierCell;
  v7 = -[TUIStaticIdentitySpecifierCell initWithStyle:reuseIdentifier:](&v34, sel_initWithStyle_reuseIdentifier_, a3, v6);
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x24BDF6EF8]);
    v9 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    textView = v7->_textView;
    v7->_textView = (UITextView *)v9;

    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](v7->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v11 = v7->_textView;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v11, "setBackgroundColor:", v12);

    -[UITextView textContainer](v7->_textView, "textContainer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLineBreakMode:", 0);

    -[UITextView setTextContainerInset:](v7->_textView, "setTextContainerInset:", 0.0, 0.0, 0.0, 0.0);
    -[UITextView textContainer](v7->_textView, "textContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLineFragmentPadding:", 0.0);

    -[UITextView setScrollEnabled:](v7->_textView, "setScrollEnabled:", 0);
    -[UITextView setSelectable:](v7->_textView, "setSelectable:", 1);
    -[UITextView setEditable:](v7->_textView, "setEditable:", 0);
    -[UITextView _setInteractiveTextSelectionDisabled:](v7->_textView, "_setInteractiveTextSelectionDisabled:", 1);
    -[UITextView setDelegate:](v7->_textView, "setDelegate:", v7);
    -[TUIStaticIdentitySpecifierCell addSubview:](v7, "addSubview:", v7->_textView);
    v26 = (void *)MEMORY[0x24BDD1628];
    -[UITextView topAnchor](v7->_textView, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIStaticIdentitySpecifierCell detailTextLabel](v7, "detailTextLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v29;
    -[UITextView leadingAnchor](v7->_textView, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIStaticIdentitySpecifierCell detailTextLabel](v7, "detailTextLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v15;
    -[UITextView trailingAnchor](v7->_textView, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIStaticIdentitySpecifierCell detailTextLabel](v7, "detailTextLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "trailingAnchor");
    v33 = v6;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2] = v19;
    -[UITextView bottomAnchor](v7->_textView, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIStaticIdentitySpecifierCell bottomAnchor](v7, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v35[3] = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activateConstraints:", v23);

    v6 = v33;
  }

  return v7;
}

void __64__TUIStaticIdentitySpecifierCell_initWithStyle_reuseIdentifier___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_21;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_21 = (uint64_t)v0;

}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UIStackView *stackView;
  UIStackView *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  UIStackView *v38;
  UIStackView *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
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
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  objc_super v91;
  _QWORD v92[6];
  _QWORD v93[2];
  uint64_t v94;
  _QWORD v95[3];

  v95[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v91.receiver = self;
  v91.super_class = (Class)TUIStaticIdentitySpecifierCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v91, sel_refreshCellContentsWithSpecifier_, v4);
  -[TUIStaticIdentitySpecifierCell textLabel](self, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "disableUpdateMask");

  v8 = v7 | 0x12u;
  -[TUIStaticIdentitySpecifierCell textLabel](self, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDisableUpdateMask:", v8);

  -[TUIStaticIdentitySpecifierCell textLabel](self, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7848]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v12);

  -[TUIStaticIdentitySpecifierCell textLabel](self, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTextColor:", v14);

  -[TUIStaticIdentitySpecifierCell textLabel](self, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setLineBreakMode:", 0);

  -[TUIStaticIdentitySpecifierCell textLabel](self, "textLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setNumberOfLines:", 0);

  stackView = self->_stackView;
  if (stackView)
  {
    -[UIStackView removeFromSuperview](stackView, "removeFromSuperview");
    v18 = self->_stackView;
    self->_stackView = 0;

  }
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D50]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIStaticIdentitySpecifierCell textLabel](self, "textLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  v22 = (uint64_t *)MEMORY[0x24BDF65F8];
  if (v19)
  {
    objc_msgSend(v20, "setText:", v19);

    -[TUIStaticIdentitySpecifierCell textLabel](self, "textLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAccessibilityIdentifier:", CFSTR("Verification Code"));
  }
  else
  {
    objc_msgSend(v20, "setText:", CFSTR(" "));

    v94 = *v22;
    -[TUIStaticIdentitySpecifierCell textLabel](self, "textLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "font");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v95[0] = v25;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v95, &v94, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("8888"), "sizeWithAttributes:", v26);
    v28 = v27;

    v23 = (void *)objc_opt_new();
    objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "tertiarySystemFillColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBackgroundColor:", v29);

    objc_msgSend(v23, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setCornerRadius:", 8.0);

    objc_msgSend(v23, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setMasksToBounds:", 0);

    v32 = (void *)objc_opt_new();
    objc_msgSend(v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "tertiarySystemFillColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setBackgroundColor:", v33);

    objc_msgSend(v32, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setCornerRadius:", 8.0);

    v90 = v32;
    objc_msgSend(v32, "layer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setMasksToBounds:", 0);

    v36 = objc_alloc(MEMORY[0x24BDF6DD0]);
    v93[0] = v23;
    v93[1] = v32;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v93, 2);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (UIStackView *)objc_msgSend(v36, "initWithArrangedSubviews:", v37);
    v39 = self->_stackView;
    self->_stackView = v38;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](self->_stackView, "setAxis:", 0);
    -[UIStackView setSpacing:](self->_stackView, "setSpacing:", 8.0);
    -[UIStackView setDistribution:](self->_stackView, "setDistribution:", 3);
    -[UIStackView setAccessibilityIdentifier:](self->_stackView, "setAccessibilityIdentifier:", CFSTR("Verification Code"));
    -[TUIStaticIdentitySpecifierCell addSubview:](self, "addSubview:", self->_stackView);
    v81 = (void *)MEMORY[0x24BDD1628];
    -[UIStackView topAnchor](self->_stackView, "topAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIStaticIdentitySpecifierCell textLabel](self, "textLabel");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "topAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "constraintEqualToAnchor:", v87);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v92[0] = v86;
    -[UIStackView leadingAnchor](self->_stackView, "leadingAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIStaticIdentitySpecifierCell textLabel](self, "textLabel");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "leadingAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintEqualToAnchor:", v83);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v92[1] = v82;
    -[UIStackView bottomAnchor](self->_stackView, "bottomAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIStaticIdentitySpecifierCell textLabel](self, "textLabel");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "bottomAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "constraintEqualToAnchor:", v78);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v92[2] = v77;
    -[UIStackView trailingAnchor](self->_stackView, "trailingAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIStaticIdentitySpecifierCell trailingAnchor](self, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "constraintLessThanOrEqualToAnchor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v92[3] = v41;
    objc_msgSend(v23, "widthAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToConstant:", v28);
    v43 = v4;
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v92[4] = v44;
    objc_msgSend(v90, "widthAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToConstant:", v28);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v92[5] = v46;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v92, 6);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "activateConstraints:", v47);

    v19 = 0;
    v4 = v43;

    v22 = (uint64_t *)MEMORY[0x24BDF65F8];
  }

  -[TUIStaticIdentitySpecifierCell detailTextLabel](self, "detailTextLabel");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BDF77D0], 0x8000, 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "fontWithDescriptor:size:", v50, 0.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setFont:", v51);

  -[TUIStaticIdentitySpecifierCell detailTextLabel](self, "detailTextLabel");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = *MEMORY[0x24BE75D28];
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D28]);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setText:", v54);

  -[TUIStaticIdentitySpecifierCell detailTextLabel](self, "detailTextLabel");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setLineBreakMode:", 0);

  -[TUIStaticIdentitySpecifierCell detailTextLabel](self, "detailTextLabel");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setNumberOfLines:", 0);

  -[TUIStaticIdentitySpecifierCell detailTextLabel](self, "detailTextLabel");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setTextColor:", v58);

  objc_msgSend(v4, "propertyForKey:", v53);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v59);
  objc_msgSend(v60, "mutableString");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "length");

  v63 = *v22;
  -[TUIStaticIdentitySpecifierCell detailTextLabel](self, "detailTextLabel");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "font");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "addAttribute:value:range:", v63, v65, 0, v62);

  v66 = *MEMORY[0x24BDF6600];
  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "addAttribute:value:range:", v66, v67, 0, v62);

  objc_msgSend(v60, "mutableString");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE"), &stru_251A5E438, CFSTR("Localizable"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v68, "rangeOfString:", v70);
  v73 = v72;

  if (v71 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v74 = *MEMORY[0x24BDF6618];
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", &stru_251A5E438);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "addAttribute:value:range:", v74, v75, v71, v73);

  }
  -[UITextView setAttributedText:](self->_textView, "setAttributedText:", v60);
  -[TUIStaticIdentitySpecifierCell bringSubviewToFront:](self, "bringSubviewToFront:", self->_textView);
  -[TUIStaticIdentitySpecifierCell setNeedsLayout](self, "setNeedsLayout");

}

- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_21 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_21, &__block_literal_global_25_1);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_21, OS_LOG_TYPE_DEBUG))
    -[TUIStaticIdentitySpecifierCell textView:primaryActionForTextItem:defaultAction:].cold.1();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://support.apple.com/ht213465"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "openURL:options:completionHandler:", v10, MEMORY[0x24BDBD1B8], 0);

  return v9;
}

void __82__TUIStaticIdentitySpecifierCell_textView_primaryActionForTextItem_defaultAction___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_21;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_21 = (uint64_t)v0;

}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

- (void)initWithStyle:reuseIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

- (void)textView:primaryActionForTextItem:defaultAction:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
}

@end
