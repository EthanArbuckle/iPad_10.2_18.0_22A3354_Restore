@implementation STWarningCell

- (STWarningCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  STWarningCell *v5;
  void *v6;
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
  void *v17;
  void *v18;
  void *v19;
  STWarningCell *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;
  _QWORD v27[4];

  v27[3] = *MEMORY[0x24BDAC8D0];
  v26.receiver = self;
  v26.super_class = (Class)STWarningCell;
  v5 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v26, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  -[STWarningCell contentView](v5, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithScale:", 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x24BEBD668]);
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("exclamationmark.circle"), v25);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithImage:", v8);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTintColor:", v10);

  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "addSubview:", v9);
  objc_msgSend(v9, "centerYAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v6;
  objc_msgSend(v6, "centerYAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v11;
  objc_msgSend(v9, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v14;
  objc_msgSend(v9, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v5;
  -[PSTableCell titleLabel](v5, "titleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintGreaterThanOrEqualToAnchor:constant:", v17, 8.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v19);
  return v21;
}

@end
