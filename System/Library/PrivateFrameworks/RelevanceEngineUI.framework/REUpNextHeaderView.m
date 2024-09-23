@implementation REUpNextHeaderView

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    kActiveLayout_2_3 = 0x4030000000000000;
    kActiveLayout_0_3 = 0x3FF0000000000000;
    kActiveLayout_1_3 = 0x401E000000000000;
  }
}

- (REUpNextHeaderView)initWithFrame:(CGRect)a3
{
  REUpNextHeaderView *v3;
  id v4;
  uint64_t v5;
  UILabel *label;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  objc_super v24;
  _QWORD v25[4];

  v25[3] = *MEMORY[0x24BDAC8D0];
  v24.receiver = self;
  v24.super_class = (Class)REUpNextHeaderView;
  v3 = -[REUpNextHeaderView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6B68]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    label = v3->_label;
    v3->_label = (UILabel *)v5;

    v7 = v3->_label;
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", *(double *)&kActiveLayout_2_3, *MEMORY[0x24BDF7890]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7, "setFont:", v8);

    v9 = v3->_label;
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v9, "setTextColor:", v10);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v11 = v3->_label;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v11, "setBackgroundColor:", v12);

    -[UILabel setTextAlignment:](v3->_label, "setTextAlignment:", 4);
    -[REUpNextHeaderView addSubview:](v3, "addSubview:", v3->_label);
    -[UILabel leadingAnchor](v3->_label, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextHeaderView leadingAnchor](v3, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:constant:", v13, *(double *)&kActiveLayout_0_3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v14;
    -[UILabel trailingAnchor](v3->_label, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextHeaderView trailingAnchor](v3, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, -*(double *)&kActiveLayout_0_3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v17;
    -[UILabel lastBaselineAnchor](v3->_label, "lastBaselineAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextHeaderView bottomAnchor](v3, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, -*(double *)&kActiveLayout_1_3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v20;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v21);
  }
  return v3;
}

- (void)setAttributedText:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *attributedText;

  v4 = (NSAttributedString *)objc_msgSend(a3, "copy");
  attributedText = self->_attributedText;
  self->_attributedText = v4;

  -[UILabel setAttributedText:](self->_label, "setAttributedText:", self->_attributedText);
}

- (int64_t)textAlignment
{
  return -[UILabel textAlignment](self->_label, "textAlignment");
}

- (void)setTextAlignment:(int64_t)a3
{
  -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", a3);
}

- (UIColor)textColor
{
  return -[UILabel textColor](self->_label, "textColor");
}

- (void)setTextColor:(id)a3
{
  -[UILabel setTextColor:](self->_label, "setTextColor:", a3);
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
