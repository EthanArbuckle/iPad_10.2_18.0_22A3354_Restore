@implementation REUpNextAccessoryView

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    kActiveLayout_0_1 = 0x4030800000000000;
    kActiveLayout_2_1 = 0x400C000000000000;
    kActiveLayout_1_1 = 0x4000000000000000;
  }
}

- (REUpNextAccessoryView)initWithFrame:(CGRect)a3
{
  REUpNextAccessoryView *v3;
  void *v4;
  id v5;
  uint64_t v6;
  CLKUIColoringLabel *label;
  CLKUIColoringLabel *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;
  _QWORD v33[5];

  v33[4] = *MEMORY[0x24BDAC8D0];
  v32.receiver = self;
  v32.super_class = (Class)REUpNextAccessoryView;
  v3 = -[REUpNextAccessoryView initWithFrame:](&v32, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDB8748], "systemFontOfSize:weight:", *(double *)&kActiveLayout_0_1, *MEMORY[0x24BDF7880]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x24BE16F30]);
    v6 = objc_msgSend(v5, "initWithFrame:options:", 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    label = v3->_label;
    v3->_label = (CLKUIColoringLabel *)v6;

    v27 = v4;
    -[CLKUIColoringLabel setFont:](v3->_label, "setFont:", v4);
    -[CLKUIColoringLabel setNowProvider:](v3->_label, "setNowProvider:", &__block_literal_global_2);
    v8 = v3->_label;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextColor:](v8, "setTextColor:", v9);

    -[CLKUIColoringLabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CLKUIColoringLabel setLineBreakMode:](v3->_label, "setLineBreakMode:", 4);
    -[CLKUIColoringLabel setNumberOfLines:](v3->_label, "setNumberOfLines:", 1);
    LODWORD(v10) = 1148846080;
    -[CLKUIColoringLabel setContentCompressionResistancePriority:forAxis:](v3->_label, "setContentCompressionResistancePriority:forAxis:", 0, v10);
    LODWORD(v11) = 1148846080;
    -[CLKUIColoringLabel setContentCompressionResistancePriority:forAxis:](v3->_label, "setContentCompressionResistancePriority:forAxis:", 1, v11);
    LODWORD(v12) = 1148846080;
    -[CLKUIColoringLabel setContentHuggingPriority:forAxis:](v3->_label, "setContentHuggingPriority:forAxis:", 1, v12);
    LODWORD(v13) = 1148846080;
    -[CLKUIColoringLabel setContentHuggingPriority:forAxis:](v3->_label, "setContentHuggingPriority:forAxis:", 0, v13);
    -[REUpNextAccessoryView layer](v3, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCornerRadius:", *(double *)&kActiveLayout_1_1);

    -[REUpNextAccessoryView layer](v3, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCornerCurve:", *MEMORY[0x24BDE58E8]);

    -[REUpNextAccessoryView addSubview:](v3, "addSubview:", v3->_label);
    -[CLKUIColoringLabel leadingAnchor](v3->_label, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextAccessoryView leadingAnchor](v3, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, *(double *)&kActiveLayout_2_1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v29;
    -[CLKUIColoringLabel trailingAnchor](v3->_label, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextAccessoryView trailingAnchor](v3, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v16, -*(double *)&kActiveLayout_2_1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v17;
    -[CLKUIColoringLabel firstBaselineAnchor](v3->_label, "firstBaselineAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextAccessoryView bottomAnchor](v3, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, -*(double *)&kActiveLayout_2_1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v20;
    -[REUpNextAccessoryView topAnchor](v3, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel firstBaselineAnchor](v3->_label, "firstBaselineAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "capHeight");
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, -(v23 + *(double *)&kActiveLayout_2_1));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v33[3] = v24;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v25);
  }
  return v3;
}

uint64_t __39__REUpNextAccessoryView_initWithFrame___block_invoke()
{
  return objc_msgSend(MEMORY[0x24BDBCE60], "date");
}

- (void)configureWithDescription:(id)a3
{
  REAccessoryDescription **p_accessoryDescription;
  CLKUIColoringLabel *label;
  void *v7;
  void *v8;
  id v9;

  p_accessoryDescription = &self->_accessoryDescription;
  v9 = a3;
  if ((-[REAccessoryDescription isEqual:](*p_accessoryDescription, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_accessoryDescription, a3);
    label = self->_label;
    -[REAccessoryDescription textProvider](*p_accessoryDescription, "textProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextProvider:](label, "setTextProvider:", v7);

    -[REAccessoryDescription backgroundColor](*p_accessoryDescription, "backgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUpNextAccessoryView setBackgroundColor:](self, "setBackgroundColor:", v8);

  }
}

- (void)setTextColor:(id)a3
{
  -[CLKUIColoringLabel setTextColor:](self->_label, "setTextColor:", a3);
}

- (id)viewForLastBaselineLayout
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_accessoryDescription, 0);
}

@end
