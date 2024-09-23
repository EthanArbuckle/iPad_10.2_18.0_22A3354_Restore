@implementation TUIAccountKeySpecifierButtonCell

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
  objc_super v13;

  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_8 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_8, &__block_literal_global_87);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_8, OS_LOG_TYPE_DEBUG))
    -[TUIAccountKeySpecifierButtonCell refreshCellContentsWithSpecifier:].cold.1();
  v13.receiver = self;
  v13.super_class = (Class)TUIAccountKeySpecifierButtonCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v13, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(MEMORY[0x24BDF6B80], "cellConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75AC8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v6);

  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v7);

  -[TUIAccountKeySpecifierButtonCell textLabel](self, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "font");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v9);

  objc_msgSend(v5, "setImageToTextPadding:", 5.0);
  -[TUIAccountKeySpecifierButtonCell setContentConfiguration:](self, "setContentConfiguration:", v5);
  -[TUIAccountKeySpecifierButtonCell imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTintColor:", v12);

  -[TUIAccountKeySpecifierButtonCell setNeedsLayout](self, "setNeedsLayout");
}

void __69__TUIAccountKeySpecifierButtonCell_refreshCellContentsWithSpecifier___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_8;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_8 = (uint64_t)v0;

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
