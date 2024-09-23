@implementation TUIAccountKeySpecifierCell

+ (int64_t)cellStyle
{
  return 3;
}

- (TUIAccountKeySpecifierCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6;
  TUIAccountKeySpecifierCell *v7;
  TUIAccountKeyLabel *v8;
  uint64_t v9;
  TUIAccountKeyLabel *accountKeyLabel;
  void *v11;
  double v12;
  double v13;
  TUIAccountKeyLabel *v14;
  void *v15;
  TUIAccountKeyLabel *v16;
  void *v17;
  void *v18;
  TUIAccountKeyLabel *v19;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  objc_super v41;
  _QWORD v42[5];

  v42[4] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_8 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_8, &__block_literal_global_8);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_8, OS_LOG_TYPE_DEBUG))
    -[TUIAccountKeySpecifierCell initWithStyle:reuseIdentifier:].cold.1();
  v41.receiver = self;
  v41.super_class = (Class)TUIAccountKeySpecifierCell;
  v7 = -[TUIAccountKeySpecifierCell initWithStyle:reuseIdentifier:](&v41, sel_initWithStyle_reuseIdentifier_, a3, v6);
  if (v7)
  {
    v8 = [TUIAccountKeyLabel alloc];
    v9 = -[TUIAccountKeyLabel initWithFrame:](v8, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    accountKeyLabel = v7->_accountKeyLabel;
    v7->_accountKeyLabel = (TUIAccountKeyLabel *)v9;

    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7810]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pointSize");
    v13 = v12;

    v14 = v7->_accountKeyLabel;
    objc_msgSend(MEMORY[0x24BDF6A70], "monospacedSystemFontOfSize:weight:", v13, *MEMORY[0x24BDF7880]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIAccountKeyLabel setFont:](v14, "setFont:", v15);

    v16 = v7->_accountKeyLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIAccountKeyLabel setTextColor:](v16, "setTextColor:", v17);

    -[TUIAccountKeyLabel setUserInteractionEnabled:](v7->_accountKeyLabel, "setUserInteractionEnabled:", 1);
    -[TUIAccountKeyLabel setLineBreakMode:](v7->_accountKeyLabel, "setLineBreakMode:", 1);
    -[TUIAccountKeyLabel setNumberOfLines:](v7->_accountKeyLabel, "setNumberOfLines:", 0);
    -[TUIAccountKeyLabel setTextAlignment:](v7->_accountKeyLabel, "setTextAlignment:", 0);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A30]), "initWithDelegate:", v7);
    -[TUIAccountKeySpecifierCell setEditInteraction:](v7, "setEditInteraction:", v18);

    v19 = v7->_accountKeyLabel;
    -[TUIAccountKeySpecifierCell editInteraction](v7, "editInteraction");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIAccountKeyLabel addInteraction:](v19, "addInteraction:", v20);

    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BA0]), "initWithTarget:action:", v7, sel_handleLongPressGesture_);
    objc_msgSend(v39, "setAllowedTouchTypes:", &unk_251A6D688);
    -[TUIAccountKeyLabel addGestureRecognizer:](v7->_accountKeyLabel, "addGestureRecognizer:", v39);
    -[TUIAccountKeySpecifierCell contentView](v7, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSubview:", v7->_accountKeyLabel);

    -[TUIAccountKeyLabel setTranslatesAutoresizingMaskIntoConstraints:](v7->_accountKeyLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TUIAccountKeySpecifierCell contentView](v7, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "layoutMarginsGuide");
    v40 = v6;
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = (void *)MEMORY[0x24BDD1628];
    -[TUIAccountKeyLabel topAnchor](v7->_accountKeyLabel, "topAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "topAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:constant:", v37, 5.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v36;
    -[TUIAccountKeyLabel bottomAnchor](v7->_accountKeyLabel, "bottomAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bottomAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:constant:", v34, -5.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v24;
    -[TUIAccountKeyLabel leadingAnchor](v7->_accountKeyLabel, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v42[2] = v27;
    -[TUIAccountKeyLabel trailingAnchor](v7->_accountKeyLabel, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v42[3] = v30;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "activateConstraints:", v31);

    v6 = v40;
  }

  return v7;
}

void __60__TUIAccountKeySpecifierCell_initWithStyle_reuseIdentifier___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_8;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_8 = (uint64_t)v0;

}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  TUIAccountKeyLabel *accountKeyLabel;
  void *v7;
  TUIAccountKeyLabel *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_8 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_8, &__block_literal_global_12);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_8, OS_LOG_TYPE_DEBUG))
    -[TUIAccountKeySpecifierCell refreshCellContentsWithSpecifier:].cold.1();
  v10.receiver = self;
  v10.super_class = (Class)TUIAccountKeySpecifierCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v10, sel_refreshCellContentsWithSpecifier_, v4);
  -[TUIAccountKeySpecifierCell textLabel](self, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

  accountKeyLabel = self->_accountKeyLabel;
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D50]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIAccountKeyLabel setText:](accountKeyLabel, "setText:", v7);

  v8 = self->_accountKeyLabel;
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75DA0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIAccountKeyLabel setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", v9);

  -[TUIAccountKeySpecifierCell setNeedsLayout](self, "setNeedsLayout");
}

void __63__TUIAccountKeySpecifierCell_refreshCellContentsWithSpecifier___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_8;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_8 = (uint64_t)v0;

}

- (void)handleLongPressGesture:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  objc_msgSend(MEMORY[0x24BDF6A28], "configurationWithIdentifier:sourcePoint:", 0, v7, v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[TUIAccountKeySpecifierCell editInteraction](self, "editInteraction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentEditMenuWithConfiguration:", v11);

}

- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  objc_msgSend(a3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (TUIAccountKeyLabel)accountKeyLabel
{
  return self->_accountKeyLabel;
}

- (void)setAccountKeyLabel:(id)a3
{
  objc_storeStrong((id *)&self->_accountKeyLabel, a3);
}

- (UIEditMenuInteraction)editInteraction
{
  return self->_editInteraction;
}

- (void)setEditInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_editInteraction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editInteraction, 0);
  objc_storeStrong((id *)&self->_accountKeyLabel, 0);
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
  OUTLINED_FUNCTION_2();
}

- (void)refreshCellContentsWithSpecifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

@end
