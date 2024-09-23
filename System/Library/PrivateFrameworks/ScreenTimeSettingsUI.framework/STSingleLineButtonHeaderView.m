@implementation STSingleLineButtonHeaderView

- (STSingleLineButtonHeaderView)initWithSpecifier:(id)a3 useContentLayoutGuide:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  STSingleLineButtonHeaderView *v6;
  uint64_t v7;
  UIButton *button;
  UIButton *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  STSingleLineButtonHeaderView *v16;
  void *v17;
  uint64_t v18;
  STSingleLineButtonHeaderView *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  STSingleLineButtonHeaderView *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  STSingleLineButtonHeaderView *v39;
  void *v40;
  void *v41;
  objc_super v42;
  _QWORD v43[5];

  v4 = a4;
  v43[4] = *MEMORY[0x24BDAC8D0];
  v42.receiver = self;
  v42.super_class = (Class)STSingleLineButtonHeaderView;
  v5 = a3;
  v6 = -[STSingleLineHeaderView initWithSpecifier:useContentLayoutGuide:](&v42, sel_initWithSpecifier_useContentLayoutGuide_, v5, v4);
  objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
  v7 = objc_claimAutoreleasedReturnValue();
  button = v6->_button;
  v6->_button = (UIButton *)v7;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v6->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v9 = v6->_button;
  objc_msgSend(v5, "target");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "buttonAction");

  -[UIButton addTarget:action:forEvents:](v9, "addTarget:action:forEvents:", v10, v11, 0x2000);
  -[UIButton titleLabel](v6->_button, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSingleLineHeaderView titleLabel](v6, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "font");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v14);

  objc_msgSend(v12, "setNumberOfLines:", 2);
  objc_msgSend(v12, "setLineBreakMode:", 0);
  objc_msgSend(v12, "setTextAlignment:", 2* (-[STSingleLineButtonHeaderView effectiveUserInterfaceLayoutDirection](v6, "effectiveUserInterfaceLayoutDirection") != 1));
  if (v4)
  {
    -[STSingleLineButtonHeaderView contentView](v6, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v6->_button);
    v16 = v15;
    -[STTableViewHeaderFooterView contentLayoutGuide](v6, "contentLayoutGuide");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "trailingAnchor");
    v18 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = v6;
    -[STSingleLineButtonHeaderView addSubview:](v19, "addSubview:", v6->_button);
    v16 = v19;
    -[STSingleLineButtonHeaderView trailingAnchor](v16, "trailingAnchor");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v36 = (void *)v18;
  v39 = v16;
  objc_msgSend(v12, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v22) = 1144750080;
  v41 = v21;
  objc_msgSend(v21, "setPriority:", v22);
  v35 = (void *)MEMORY[0x24BDD1628];
  v43[0] = v21;
  objc_msgSend(v12, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSingleLineButtonHeaderView topAnchor](v16, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintGreaterThanOrEqualToAnchor:", v37);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v23;
  objc_msgSend(v12, "lastBaselineAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastBaselineAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v26;
  objc_msgSend(v12, "leadingAnchor");
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = v13;
  v40 = v13;
  v29 = (void *)v27;
  objc_msgSend(v28, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v30, 1.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v31;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "activateConstraints:", v32);

  -[STSingleLineButtonHeaderView reloadFromSpecifier](v6, "reloadFromSpecifier");
  v33 = v6;

  return v33;
}

- (void)reloadFromSpecifier
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STSingleLineButtonHeaderView;
  -[STSingleLineHeaderView reloadFromSpecifier](&v8, sel_reloadFromSpecifier);
  -[STSingleLineButtonHeaderView button](self, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BEBDB00];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__STSingleLineButtonHeaderView_reloadFromSpecifier__block_invoke;
  v6[3] = &unk_24DB86588;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "transitionWithView:duration:options:animations:completion:", v5, 5, v6, 0, 0.3);

}

void __51__STSingleLineButtonHeaderView_reloadFromSpecifier__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "specifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ButtonHidden"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");
  v4 = 1.0;
  if (v3)
    v4 = 0.0;
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", v4);

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ButtonTag"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setTag:", objc_msgSend(v5, "integerValue"));

  v6 = *(void **)(a1 + 40);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ButtonTitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:forState:", v7, 0);

}

- (void)setSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v10;

  v4 = a3;
  -[STSingleLineButtonHeaderView button](self, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSingleLineHeaderView specifier](self, "specifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "target");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTarget:forEvents:", v7, 0x2000);

  v10.receiver = self;
  v10.super_class = (Class)STSingleLineButtonHeaderView;
  -[STSingleLineHeaderView setSpecifier:](&v10, sel_setSpecifier_, v4);
  objc_msgSend(v4, "target");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "buttonAction");

  objc_msgSend(v5, "addTarget:action:forEvents:", v8, v9, 0x2000);
}

- (double)preferredHeightForWidth:(double)a3
{
  double v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STSingleLineButtonHeaderView;
  -[STSingleLineHeaderView preferredHeightForWidth:](&v5, sel_preferredHeightForWidth_, a3);
  return v3 + 1.0;
}

- (UIButton)button
{
  return self->_button;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
}

@end
