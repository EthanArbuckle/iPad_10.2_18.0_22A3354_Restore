@implementation STSummationView

- (STSummationView)initWithTitle:(id)a3 detailText:(id)a4
{
  id v6;
  id v7;
  STSummationView *v8;
  void *v9;
  uint64_t v10;
  UILabel *titleLabel;
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
  UILabel *detailLabel;
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
  void *v40;
  id v41;
  id v42;
  objc_super v43;
  _QWORD v44[4];
  _QWORD v45[4];

  v45[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v43.receiver = self;
  v43.super_class = (Class)STSummationView;
  v8 = -[STSummationView initWithFrame:](&v43, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v42 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSummationView setBackgroundColor:](v8, "setBackgroundColor:", v9);

    v10 = objc_opt_new();
    titleLabel = v8->_titleLabel;
    v8->_titleLabel = (UILabel *)v10;

    -[UILabel setAttributedText:](v8->_titleLabel, "setAttributedText:", v6);
    -[UILabel setNumberOfLines:](v8->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v8->_titleLabel, "setLineBreakMode:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v8->_titleLabel, "setTextColor:", v12);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel sizeToFit](v8->_titleLabel, "sizeToFit");
    -[STSummationView addSubview:](v8, "addSubview:", v8->_titleLabel);
    v35 = (void *)MEMORY[0x24BDD1628];
    -[UILabel topAnchor](v8->_titleLabel, "topAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSummationView topAnchor](v8, "topAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:constant:", v37, 10.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v13;
    -[UILabel leadingAnchor](v8->_titleLabel, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSummationView leadingAnchor](v8, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 16.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v45[1] = v16;
    -[UILabel trailingAnchor](v8->_titleLabel, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSummationView trailingAnchor](v8, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, -16.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v45[2] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 3);
    v41 = v6;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "activateConstraints:", v20);

    v21 = objc_opt_new();
    detailLabel = v8->_detailLabel;
    v8->_detailLabel = (UILabel *)v21;

    -[UILabel setAttributedText:](v8->_detailLabel, "setAttributedText:", v42);
    -[UILabel setNumberOfLines:](v8->_detailLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v8->_detailLabel, "setLineBreakMode:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8->_detailLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel sizeToFit](v8->_detailLabel, "sizeToFit");
    -[STSummationView addSubview:](v8, "addSubview:", v8->_detailLabel);
    v33 = (void *)MEMORY[0x24BDD1628];
    -[UILabel topAnchor](v8->_detailLabel, "topAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v8->_titleLabel, "bottomAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:constant:", v38, 2.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v36;
    -[UILabel leadingAnchor](v8->_detailLabel, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSummationView leadingAnchor](v8, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:constant:", v23, 16.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v44[1] = v24;
    -[UILabel trailingAnchor](v8->_detailLabel, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSummationView trailingAnchor](v8, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, -16.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v44[2] = v27;
    -[UILabel bottomAnchor](v8->_detailLabel, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSummationView bottomAnchor](v8, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintLessThanOrEqualToAnchor:constant:", v29, -11.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v44[3] = v30;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "activateConstraints:", v31);

    v6 = v41;
    v7 = v42;

  }
  return v8;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (void)setDetailLabel:(id)a3
{
  objc_storeStrong((id *)&self->_detailLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
