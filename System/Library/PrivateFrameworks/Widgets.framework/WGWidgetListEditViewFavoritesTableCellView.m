@implementation WGWidgetListEditViewFavoritesTableCellView

- (WGWidgetListEditViewFavoritesTableCellView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WGWidgetListEditViewFavoritesTableCellView *v4;
  WGWidgetListEditViewFavoritesTableCellView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  v29.receiver = self;
  v29.super_class = (Class)WGWidgetListEditViewFavoritesTableCellView;
  v4 = -[WGWidgetListEditViewFavoritesTableCellView initWithStyle:reuseIdentifier:](&v29, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[WGWidgetListEditViewFavoritesTableCellView contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("plus.circle.fill"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v7);
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.784313725, 0.780392157, 0.8, 1.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTintColor:", v9);

    v10 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v11 = _os_feature_enabled_impl();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11)
      v14 = CFSTR("WIDGETS_EDIT_DRAG_TO_PIN_LEGACY");
    else
      v14 = CFSTR("WIDGETS_EDIT_DRAG_TO_PIN");
    objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_24D733868, CFSTR("Widgets"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v15);

    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFont:", v16);

    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.596078431, 1.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextColor:", v17);

    v18 = objc_alloc(MEMORY[0x24BDF6DD0]);
    v30[0] = v8;
    v30[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithArrangedSubviews:", v19);

    objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v20, "setAxis:", 0);
    objc_msgSend(v20, "setAlignment:", 2);
    objc_msgSend(v20, "setSpacing:", 8.0);
    objc_msgSend(v6, "addSubview:", v20);
    v21 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v20, "centerXAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "centerXAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v24);

    objc_msgSend(v20, "centerYAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "centerYAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v27);

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v21);
  }
  return v5;
}

@end
