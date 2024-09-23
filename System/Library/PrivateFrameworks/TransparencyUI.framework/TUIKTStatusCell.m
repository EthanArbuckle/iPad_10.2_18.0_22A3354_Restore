@implementation TUIKTStatusCell

- (TUIKTStatusCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6;
  TUIKTStatusCell *v7;
  TUIKTStatusCell *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  UIStackView *ktStatusStackView;
  void *v13;
  uint64_t v14;
  UILabel *ktStatusTitleLabel;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  UILabel *ktStatusTextLabel;
  void *v21;
  void *v22;
  double v23;
  double v24;
  objc_super v26;

  v6 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_13 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_13, &__block_literal_global_13);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_13, OS_LOG_TYPE_DEBUG))
    -[TUIKTStatusCell initWithStyle:reuseIdentifier:].cold.1();
  v26.receiver = self;
  v26.super_class = (Class)TUIKTStatusCell;
  v7 = -[TUIKTStatusCell initWithStyle:reuseIdentifier:](&v26, sel_initWithStyle_reuseIdentifier_, a3, v6);
  v8 = v7;
  if (v7)
  {
    -[PSTableCell titleLabel](v7, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 1);

    -[TUIKTStatusCell detailTextLabel](v8, "detailTextLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", 1);

    v11 = objc_opt_new();
    ktStatusStackView = v8->_ktStatusStackView;
    v8->_ktStatusStackView = (UIStackView *)v11;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v8->_ktStatusStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setSpacing:](v8->_ktStatusStackView, "setSpacing:", 6.0);
    -[UIStackView setAxis:](v8->_ktStatusStackView, "setAxis:", 0);
    -[UIStackView setAlignment:](v8->_ktStatusStackView, "setAlignment:", 3);
    -[UIStackView setDistribution:](v8->_ktStatusStackView, "setDistribution:", 0);
    -[TUIKTStatusCell contentView](v8, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v8->_ktStatusStackView);

    v14 = objc_opt_new();
    ktStatusTitleLabel = v8->_ktStatusTitleLabel;
    v8->_ktStatusTitleLabel = (UILabel *)v14;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8->_ktStatusTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v8->_ktStatusTitleLabel, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v8->_ktStatusTitleLabel, "setTextColor:", v16);

    -[PSTableCell titleLabel](v8, "titleLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "font");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v8->_ktStatusTitleLabel, "setFont:", v18);

    -[UIStackView addArrangedSubview:](v8->_ktStatusStackView, "addArrangedSubview:", v8->_ktStatusTitleLabel);
    v19 = objc_opt_new();
    ktStatusTextLabel = v8->_ktStatusTextLabel;
    v8->_ktStatusTextLabel = (UILabel *)v19;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8->_ktStatusTextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v8->_ktStatusTextLabel, "setNumberOfLines:", 1);
    -[TUIKTStatusCell detailTextLabel](v8, "detailTextLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "font");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v8->_ktStatusTextLabel, "setFont:", v22);

    LODWORD(v23) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v8->_ktStatusTextLabel, "setContentHuggingPriority:forAxis:", 0, v23);
    LODWORD(v24) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v8->_ktStatusTextLabel, "setContentHuggingPriority:forAxis:", 1, v24);
    -[UIStackView addArrangedSubview:](v8->_ktStatusStackView, "addArrangedSubview:", v8->_ktStatusTextLabel);
  }

  return v8;
}

void __49__TUIKTStatusCell_initWithStyle_reuseIdentifier___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_13;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_13 = (uint64_t)v0;

}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  NSObject *v21;
  _BOOL8 v22;
  uint64_t v23;
  double v24;
  objc_super v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  __int16 v36;
  TUIKTStatusCell *v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_13 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_13, &__block_literal_global_5_0);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_13, OS_LOG_TYPE_DEBUG))
    -[TUIKTStatusCell refreshCellContentsWithSpecifier:].cold.1();
  v25.receiver = self;
  v25.super_class = (Class)TUIKTStatusCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v25, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_ktStatusTitleLabel, "setText:", v5);

  -[TUIKTStatusCell _setStatusText:](self, "_setStatusText:", v4);
  -[TUIKTStatusCell _tableView](self, "_tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  -[TUIKTStatusCell _tableView](self, "_tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutMargins");
  -[TUIKTStatusCell _tableView](self, "_tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutMargins");

  if (objc_msgSend(v4, "cellType") == 2)
  {
    -[TUIKTStatusCell _tableView](self, "_tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layoutMargins");

  }
  UICeilToViewScale();
  v11 = v10;
  -[UILabel text](self->_ktStatusTitleLabel, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = *MEMORY[0x24BDF65F8];
  -[UILabel font](self->_ktStatusTitleLabel, "font");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sizeWithAttributes:", v14);
  UICeilToViewScale();
  v16 = v15;

  -[UILabel intrinsicContentSize](self->_ktStatusTextLabel, "intrinsicContentSize");
  UICeilToViewScale();
  v18 = v17;
  v19 = v16 + v17;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_13 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_13, &__block_literal_global_10_0);
  v20 = v19 + 6.0;
  v21 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_13;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316418;
    v27 = "-[TUIKTStatusCell refreshCellContentsWithSpecifier:]";
    v28 = 1024;
    v29 = v11 > v20;
    v30 = 2048;
    v31 = v11;
    v32 = 2048;
    v33 = v16;
    v34 = 2048;
    v35 = v18;
    v36 = 2114;
    v37 = self;
    _os_log_debug_impl(&dword_2493EE000, v21, OS_LOG_TYPE_DEBUG, "%s isHorizontal = %d (cellWidth = %f, titleWidth = %f, statusWidth = %f) on %{public}@", buf, 0x3Au);
  }
  v22 = v11 <= v20;
  if (v11 <= v20)
    v23 = 1;
  else
    v23 = 2;
  if (v11 <= v20)
    v24 = 0.0;
  else
    v24 = 6.0;
  -[UIStackView setAxis:](self->_ktStatusStackView, "setAxis:", v22);
  -[UIStackView setAlignment:](self->_ktStatusStackView, "setAlignment:", v23);
  -[UIStackView setSpacing:](self->_ktStatusStackView, "setSpacing:", v24);
  -[TUIKTStatusCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[TUIKTStatusCell setNeedsLayout](self, "setNeedsLayout");

}

void __52__TUIKTStatusCell_refreshCellContentsWithSpecifier___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_13;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_13 = (uint64_t)v0;

}

void __52__TUIKTStatusCell_refreshCellContentsWithSpecifier___block_invoke_9()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_13;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_13 = (uint64_t)v0;

}

- (void)updateConstraints
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

void __36__TUIKTStatusCell_updateConstraints__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_13;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_13 = (uint64_t)v0;

}

- (void)_setStatusText:(id)a3
{
  id v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  id v8;
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
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;

  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_13 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_13, &__block_literal_global_16_0);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_13, OS_LOG_TYPE_DEBUG))
    -[TUIKTStatusCell _setStatusText:].cold.1();
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D28]);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = (__CFString *)v5;
  else
    v6 = &stru_251A5E438;
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D20]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = objc_alloc_init(MEMORY[0x24BDD1688]);
  if (-[__CFString length](v6, "length"))
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 == v9)
    {
      v10 = (void *)MEMORY[0x24BDF6AE0];
      -[TUIKTStatusCell detailTextLabel](self, "detailTextLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "font");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pointSize");
      objc_msgSend(v10, "configurationWithPointSize:weight:scale:", 4, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:withConfiguration:", CFSTR("exclamationmark.triangle.fill"), v25);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "imageWithTintColor:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "imageWithRenderingMode:", 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDF6768], "textAttachmentWithImage:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendAttributedString:", v17);

      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", CFSTR(" "));
      objc_msgSend(v8, "appendAttributedString:", v18);

    }
  }
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v6);
  objc_msgSend(v8, "appendAttributedString:", v19);

  v20 = (void *)objc_opt_new();
  objc_msgSend(v20, "setAlignment:", 2 * (-[TUIKTStatusCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1));
  v21 = objc_msgSend(v8, "length");
  objc_msgSend(v8, "addAttribute:value:range:", *MEMORY[0x24BDF6628], v20, 0, v21);
  objc_msgSend(v8, "addAttribute:value:range:", *MEMORY[0x24BDF6600], v7, 0, v21);
  v22 = *MEMORY[0x24BDF65F8];
  -[TUIKTStatusCell detailTextLabel](self, "detailTextLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "font");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAttribute:value:range:", v22, v24, 0, v21);

  -[UILabel setAttributedText:](self->_ktStatusTextLabel, "setAttributedText:", v8);
}

void __34__TUIKTStatusCell__setStatusText___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_13;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_13 = (uint64_t)v0;

}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (UIStackView)ktStatusStackView
{
  return self->_ktStatusStackView;
}

- (void)setKtStatusStackView:(id)a3
{
  objc_storeStrong((id *)&self->_ktStatusStackView, a3);
}

- (UILabel)ktStatusTitleLabel
{
  return self->_ktStatusTitleLabel;
}

- (void)setKtStatusTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_ktStatusTitleLabel, a3);
}

- (UILabel)ktStatusTextLabel
{
  return self->_ktStatusTextLabel;
}

- (void)setKtStatusTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_ktStatusTextLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ktStatusTextLabel, 0);
  objc_storeStrong((id *)&self->_ktStatusTitleLabel, 0);
  objc_storeStrong((id *)&self->_ktStatusStackView, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
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

- (void)_setStatusText:.cold.1()
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
