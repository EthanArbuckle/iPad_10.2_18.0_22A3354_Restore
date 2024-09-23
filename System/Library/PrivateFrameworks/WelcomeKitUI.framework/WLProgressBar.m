@implementation WLProgressBar

- (WLProgressBar)initWithFrame:(CGRect)a3
{
  WLProgressBar *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  UIProgressView *progressView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  UILabel *label;
  UILabel *v19;
  void *v20;
  UILabel *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSDateComponentsFormatter *v32;
  NSDateComponentsFormatter *formatter;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  objc_super v43;
  _QWORD v44[4];
  _QWORD v45[4];

  v45[3] = *MEMORY[0x24BDAC8D0];
  v43.receiver = self;
  v43.super_class = (Class)WLProgressBar;
  v3 = -[WLProgressBar initWithFrame:](&v43, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLProgressBar addTopBorderWithColor:andWidth:](v3, "addTopBorderWithColor:andWidth:", v4, 0.5);

    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLProgressBar setBackgroundColor:](v3, "setBackgroundColor:", v5);

    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6CF8]), "initWithProgressViewStyle:", 0);
    progressView = v3->_progressView;
    v3->_progressView = (UIProgressView *)v6;

    -[UIProgressView setTranslatesAutoresizingMaskIntoConstraints:](v3->_progressView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WLProgressBar addSubview:](v3, "addSubview:", v3->_progressView);
    v37 = (void *)MEMORY[0x24BDD1628];
    -[UIProgressView topAnchor](v3->_progressView, "topAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLProgressBar topAnchor](v3, "topAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:constant:", v39, 25.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v8;
    -[UIProgressView leadingAnchor](v3->_progressView, "leadingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLProgressBar leadingAnchor](v3, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, 25.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v45[1] = v11;
    -[UIProgressView trailingAnchor](v3->_progressView, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLProgressBar trailingAnchor](v3, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, -25.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v45[2] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "activateConstraints:", v15);

    v16 = objc_alloc(MEMORY[0x24BDF6B68]);
    v17 = objc_msgSend(v16, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    label = v3->_label;
    v3->_label = (UILabel *)v17;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTextAlignment:](v3->_label, "setTextAlignment:", 1);
    v19 = v3->_label;
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7810]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v19, "setFont:", v20);

    -[UILabel setNumberOfLines:](v3->_label, "setNumberOfLines:", 1);
    -[UILabel setLineBreakMode:](v3->_label, "setLineBreakMode:", 3);
    v21 = v3->_label;
    WLLocalizedString();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v21, "setText:", v22);

    -[WLProgressBar addSubview:](v3, "addSubview:", v3->_label);
    v35 = (void *)MEMORY[0x24BDD1628];
    -[UILabel topAnchor](v3->_label, "topAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIProgressView bottomAnchor](v3->_progressView, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:constant:", v40, -20.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v38;
    -[UILabel leadingAnchor](v3->_label, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLProgressBar leadingAnchor](v3, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:constant:", v23, 20.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v44[1] = v24;
    -[UILabel trailingAnchor](v3->_label, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLProgressBar trailingAnchor](v3, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, -20.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v44[2] = v27;
    -[UILabel bottomAnchor](v3->_label, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLProgressBar bottomAnchor](v3, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v44[3] = v30;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "activateConstraints:", v31);

    v32 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x24BDD14F8]);
    formatter = v3->_formatter;
    v3->_formatter = v32;

    -[NSDateComponentsFormatter setUnitsStyle:](v3->_formatter, "setUnitsStyle:", 3);
    -[NSDateComponentsFormatter setAllowedUnits:](v3->_formatter, "setAllowedUnits:", 96);
    -[NSDateComponentsFormatter setIncludesApproximationPhrase:](v3->_formatter, "setIncludesApproximationPhrase:", 1);
  }
  return v3;
}

- (void)addTopBorderWithColor:(id)a3 andWidth:(double)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = (id)objc_opt_new();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  objc_msgSend(v6, "setAutoresizingMask:", 34);
  -[WLProgressBar frame](self, "frame");
  objc_msgSend(v6, "setFrame:", 0.0, 0.0);
  -[WLProgressBar addSubview:](self, "addSubview:", v6);

}

- (void)setProgress:(double)a3
{
  *(float *)&a3 = a3;
  -[UIProgressView setProgress:](self->_progressView, "setProgress:", a3);
}

- (void)setProgressText:(id)a3
{
  -[UILabel setText:](self->_label, "setText:", a3);
}

+ (double)height
{
  return 100.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
}

@end
