@implementation TUIReportToAppleSpecifierCell

+ (int64_t)cellStyle
{
  return 3;
}

- (id)attributedStringForSystemImageNamed:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x24BDF6768];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithPointSize:weight:scale:", 4, 3, 10.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:withConfiguration:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithTintColor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v9);

  objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  objc_super v56;
  uint64_t v57;
  void *v58;
  _QWORD v59[2];

  v59[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_6 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_6, &__block_literal_global_6);
  v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_6;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_6, OS_LOG_TYPE_DEBUG))
    -[TUIReportToAppleSpecifierCell refreshCellContentsWithSpecifier:].cold.1((uint64_t)self, v5);
  v56.receiver = self;
  v56.super_class = (Class)TUIReportToAppleSpecifierCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v56, sel_refreshCellContentsWithSpecifier_, v4);
  -[TUIReportToAppleSpecifierCell textLabel](self, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", 0);

  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D28]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIReportToAppleSpecifierCell detailTextLabel](self, "detailTextLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v9);

  -[TUIReportToAppleSpecifierCell detailTextLabel](self, "detailTextLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextColor:", v11);

  -[TUIReportToAppleSpecifierCell detailTextLabel](self, "detailTextLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLineBreakMode:", 0);

  -[TUIReportToAppleSpecifierCell detailTextLabel](self, "detailTextLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNumberOfLines:", 0);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", CFSTR("\t"));
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", CFSTR("\n"));
  v16 = (void *)objc_opt_new();
  v55 = v7;
  v17 = objc_msgSend(v7, "isEqual:", *MEMORY[0x24BEBA878]);
  -[TUIReportToAppleSpecifierCell attributedStringForSystemImageNamed:](self, "attributedStringForSystemImageNamed:", CFSTR("person.crop.circle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appendAttributedString:", v18);

  objc_msgSend(v16, "appendAttributedString:", v14);
  v19 = objc_alloc(MEMORY[0x24BDD1458]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v17)
  {
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("APPLE_ID_WITH_PEER_STRING"), &stru_251A5E438);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v19, "initWithString:", v22);
    objc_msgSend(v16, "appendAttributedString:", v23);

    objc_msgSend(v16, "appendAttributedString:", v15);
    -[TUIReportToAppleSpecifierCell attributedStringForSystemImageNamed:](self, "attributedStringForSystemImageNamed:", CFSTR("key"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "appendAttributedString:", v24);

    objc_msgSend(v16, "appendAttributedString:", v14);
    v25 = objc_alloc(MEMORY[0x24BDD1458]);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("PUBLIC_KEYS_WITH_PEER_STRING"), &stru_251A5E438, CFSTR("Localizable"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v25, "initWithString:", v27);
    objc_msgSend(v16, "appendAttributedString:", v28);

    objc_msgSend(v16, "appendAttributedString:", v15);
    -[TUIReportToAppleSpecifierCell attributedStringForSystemImageNamed:](self, "attributedStringForSystemImageNamed:", CFSTR("network"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "appendAttributedString:", v29);

    objc_msgSend(v16, "appendAttributedString:", v14);
    v30 = objc_alloc(MEMORY[0x24BDD1458]);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    v33 = CFSTR("NETWORK_LOGS_STRING");
  }
  else
  {
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("APPLE_ID_STRING"), &stru_251A5E438, CFSTR("Localizable"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v19, "initWithString:", v34);
    objc_msgSend(v16, "appendAttributedString:", v35);

    objc_msgSend(v16, "appendAttributedString:", v15);
    -[TUIReportToAppleSpecifierCell attributedStringForSystemImageNamed:](self, "attributedStringForSystemImageNamed:", CFSTR("key"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "appendAttributedString:", v36);

    objc_msgSend(v16, "appendAttributedString:", v14);
    v37 = objc_alloc(MEMORY[0x24BDD1458]);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("PUBLIC_KEYS_MESSAGES_STRING"), &stru_251A5E438, CFSTR("Localizable"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(v37, "initWithString:", v39);
    objc_msgSend(v16, "appendAttributedString:", v40);

    objc_msgSend(v16, "appendAttributedString:", v15);
    -[TUIReportToAppleSpecifierCell attributedStringForSystemImageNamed:](self, "attributedStringForSystemImageNamed:", CFSTR("network"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "appendAttributedString:", v41);

    objc_msgSend(v16, "appendAttributedString:", v14);
    v42 = objc_alloc(MEMORY[0x24BDD1458]);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("NETWORK_LOGS_STRING"), &stru_251A5E438, CFSTR("Localizable"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)objc_msgSend(v42, "initWithString:", v44);
    objc_msgSend(v16, "appendAttributedString:", v45);

    objc_msgSend(v16, "appendAttributedString:", v15);
    -[TUIReportToAppleSpecifierCell attributedStringForSystemImageNamed:](self, "attributedStringForSystemImageNamed:", CFSTR("iphone.gen2"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "appendAttributedString:", v46);

    objc_msgSend(v16, "appendAttributedString:", v14);
    v30 = objc_alloc(MEMORY[0x24BDD1458]);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    v33 = CFSTR("DEVICE_IDENTIFIERS_STRING");
  }
  objc_msgSend(v31, "localizedStringForKey:value:table:", v33, &stru_251A5E438, CFSTR("Localizable"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_msgSend(v30, "initWithString:", v47);
  objc_msgSend(v16, "appendAttributedString:", v48);

  v49 = (void *)objc_opt_new();
  v50 = objc_alloc(MEMORY[0x24BDF6780]);
  v51 = (void *)objc_msgSend(v50, "initWithTextAlignment:location:options:", 4, MEMORY[0x24BDBD1B8], 25.0);
  v59[0] = v51;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setTabStops:", v52);

  objc_msgSend(v49, "setAlignment:", 4);
  objc_msgSend(v49, "setFirstLineHeadIndent:", 0.0);
  v57 = *MEMORY[0x24BDF6628];
  v58 = v49;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAttributes:range:", v53, 0, objc_msgSend(v16, "length"));

  -[TUIReportToAppleSpecifierCell detailTextLabel](self, "detailTextLabel");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setAttributedText:", v16);

  -[TUIReportToAppleSpecifierCell setNeedsLayout](self, "setNeedsLayout");
}

void __66__TUIReportToAppleSpecifierCell_refreshCellContentsWithSpecifier___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_6;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_6 = (uint64_t)v0;

}

- (void)refreshCellContentsWithSpecifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[TUIReportToAppleSpecifierCell refreshCellContentsWithSpecifier:]";
  v4 = 2114;
  v5 = a1;
  _os_log_debug_impl(&dword_2493EE000, a2, OS_LOG_TYPE_DEBUG, "%s  on %{public}@", (uint8_t *)&v2, 0x16u);
}

@end
