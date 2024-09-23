@implementation WGWidgetListEditViewPinTableViewCell

- (WGWidgetListEditViewPinTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WGWidgetListEditViewPinTableViewCell *v4;
  WGWidgetListEditViewPinTableViewCell *v5;
  UISwitch *v6;
  UISwitch *pinSwitch;
  WGWidgetPinningTeachingAnimationView *v8;
  double v9;
  WGWidgetPinningTeachingAnimationView *pinImageView;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  WGWidgetPinningTeachingAnimationView *v43;
  void *v44;
  objc_super v45;
  _QWORD v46[3];
  _QWORD v47[3];

  v47[2] = *MEMORY[0x24BDAC8D0];
  v45.receiver = self;
  v45.super_class = (Class)WGWidgetListEditViewPinTableViewCell;
  v4 = -[WGWidgetListEditViewPinTableViewCell initWithStyle:reuseIdentifier:](&v45, sel_initWithStyle_reuseIdentifier_, 3, a4);
  v5 = v4;
  if (v4)
  {
    -[WGWidgetListEditViewPinTableViewCell contentView](v4, "contentView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UISwitch *)objc_alloc_init(MEMORY[0x24BDF6E28]);
    pinSwitch = v5->_pinSwitch;
    v5->_pinSwitch = v6;

    -[UISwitch setTranslatesAutoresizingMaskIntoConstraints:](v5->_pinSwitch, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UISwitch sizeToFit](v5->_pinSwitch, "sizeToFit");
    v8 = objc_alloc_init(WGWidgetPinningTeachingAnimationView);
    -[WGWidgetPinningTeachingAnimationView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v9) = 1148846080;
    -[WGWidgetPinningTeachingAnimationView setContentHuggingPriority:forAxis:](v8, "setContentHuggingPriority:forAxis:", 0, v9);
    pinImageView = v5->_pinImageView;
    v5->_pinImageView = v8;
    v43 = v8;

    v11 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("WIDGETS_PIN_TITLE"), &stru_24D733868, CFSTR("Widgets"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v13);

    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77E8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v14);

    v15 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("WIDGETS_PIN_MESSAGE"), &stru_24D733868, CFSTR("Widgets"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setText:", v17);

    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFont:", v18);

    objc_msgSend(v15, "setNumberOfLines:", 0);
    v19 = objc_alloc(MEMORY[0x24BDF6DD0]);
    v47[0] = v11;
    v47[1] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithArrangedSubviews:", v20);

    objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v21, "setAxis:", 1);
    v22 = objc_alloc(MEMORY[0x24BDF6DD0]);
    v46[0] = v43;
    v46[1] = v21;
    v46[2] = v5->_pinSwitch;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithArrangedSubviews:", v23);

    objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v24, "setAxis:", 0);
    objc_msgSend(v24, "setAlignment:", 3);
    objc_msgSend(v24, "setSpacing:", 30.0);
    objc_msgSend(v44, "addSubview:", v24);
    v25 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v24, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, 30.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v28);

    objc_msgSend(v44, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, 23.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v31);

    objc_msgSend(v24, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:constant:", v33, 28.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v34);

    objc_msgSend(v44, "bottomAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:constant:", v36, 28.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v37);

    -[WGWidgetPinningTeachingAnimationView widthAnchor](v43, "widthAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToConstant:", 61.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v39);

    -[WGWidgetPinningTeachingAnimationView heightAnchor](v43, "heightAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToConstant:", 50.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v41);

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v25);
  }
  return v5;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WGWidgetListEditViewPinTableViewCell;
  -[WGWidgetListEditViewPinTableViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[WGWidgetListEditViewPinTableViewCell stopAnimating](self, "stopAnimating");
}

- (void)startAnimating
{
  -[WGWidgetPinningTeachingAnimationView startAnimating](self->_pinImageView, "startAnimating");
}

- (void)stopAnimating
{
  -[WGWidgetPinningTeachingAnimationView stopAnimating](self->_pinImageView, "stopAnimating");
}

- (UISwitch)pinSwitch
{
  return self->_pinSwitch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinSwitch, 0);
  objc_storeStrong((id *)&self->_pinImageView, 0);
}

@end
