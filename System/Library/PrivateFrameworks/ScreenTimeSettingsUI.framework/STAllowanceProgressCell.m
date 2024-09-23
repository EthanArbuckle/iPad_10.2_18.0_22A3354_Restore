@implementation STAllowanceProgressCell

- (STAllowanceProgressCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  STAllowanceProgressCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)STAllowanceProgressCell;
  v5 = -[STTableCell initWithStyle:reuseIdentifier:specifier:](&v26, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setContentMode:", 1);
    v7 = (void *)MEMORY[0x24BEBD640];
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageNamed:inBundle:", CFSTR("AllowanceProgressCell"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:", v9);

    -[STAllowanceProgressCell contentView](v5, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    objc_msgSend(v6, "setFrame:");

    objc_msgSend(v6, "setAutoresizingMask:", 18);
    -[STAllowanceProgressCell contentView](v5, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v6);

    objc_msgSend(v6, "image");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "size");
    v14 = v13;
    v16 = v15;

    objc_msgSend(v6, "heightAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "widthAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:multiplier:", v18, v16 / v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v20) = 1144750080;
    objc_msgSend(v19, "setPriority:", v20);
    objc_msgSend(v19, "setActive:", 1);
    objc_msgSend(v6, "heightAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[STAllowanceProgressCell contentView](v5, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "heightAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setActive:", 1);

  }
  return v5;
}

@end
