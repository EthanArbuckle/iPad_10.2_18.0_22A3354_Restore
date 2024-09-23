@implementation PRXActivityStatusView

- (PRXActivityStatusView)initWithFrame:(CGRect)a3
{
  PRXActivityStatusView *v3;
  uint64_t v4;
  UIActivityIndicatorView *activityIndicator;
  uint64_t v6;
  PRXLabel *statusLabel;
  void *v8;
  void *v9;
  uint64_t v10;
  NSLayoutConstraint *activityIndicatorVerticalConstraint;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PRXActivityStatusView *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v34;
  _QWORD v35[9];

  v35[7] = *MEMORY[0x24BDAC8D0];
  v34.receiver = self;
  v34.super_class = (Class)PRXActivityStatusView;
  v3 = -[PRXActivityStatusView initWithFrame:](&v34, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
    activityIndicator = v3->_activityIndicator;
    v3->_activityIndicator = (UIActivityIndicatorView *)v4;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v3->_activityIndicator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PRXActivityStatusView addSubview:](v3, "addSubview:", v3->_activityIndicator);
    +[PRXLabel labelWithStyle:](PRXLabel, "labelWithStyle:", 2);
    v6 = objc_claimAutoreleasedReturnValue();
    statusLabel = v3->_statusLabel;
    v3->_statusLabel = (PRXLabel *)v6;

    -[PRXLabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_statusLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PRXActivityStatusView addSubview:](v3, "addSubview:", v3->_statusLabel);
    -[UIActivityIndicatorView bottomAnchor](v3->_activityIndicator, "bottomAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXLabel firstBaselineAnchor](v3->_statusLabel, "firstBaselineAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXActivityStatusView activityIndicatorVerticalShift](v3, "activityIndicatorVerticalShift");
    objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    activityIndicatorVerticalConstraint = v3->_activityIndicatorVerticalConstraint;
    v3->_activityIndicatorVerticalConstraint = (NSLayoutConstraint *)v10;

    v26 = (void *)MEMORY[0x24BDD1628];
    -[UIActivityIndicatorView leadingAnchor](v3->_activityIndicator, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXActivityStatusView leadingAnchor](v3, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v31;
    -[PRXLabel leadingAnchor](v3->_statusLabel, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView trailingAnchor](v3->_activityIndicator, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, 7.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v28;
    -[PRXLabel trailingAnchor](v3->_statusLabel, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXActivityStatusView trailingAnchor](v3, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2] = v24;
    v35[3] = v3->_activityIndicatorVerticalConstraint;
    -[PRXLabel topAnchor](v3->_statusLabel, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXActivityStatusView topAnchor](v3, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintGreaterThanOrEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v35[4] = v13;
    -[PRXLabel bottomAnchor](v3->_statusLabel, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXActivityStatusView bottomAnchor](v3, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35[5] = v16;
    -[PRXActivityStatusView heightAnchor](v3, "heightAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView heightAnchor](v3->_activityIndicator, "heightAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintGreaterThanOrEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v35[6] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activateConstraints:", v20);

    v21 = v3;
  }

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  double v4;
  double v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PRXActivityStatusView;
  -[PRXActivityStatusView traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, a3);
  -[PRXActivityStatusView activityIndicatorVerticalShift](self, "activityIndicatorVerticalShift");
  v5 = v4;
  -[PRXActivityStatusView activityIndicatorVerticalConstraint](self, "activityIndicatorVerticalConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConstant:", v5);

}

- (double)activityIndicatorVerticalShift
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;

  objc_msgSend(MEMORY[0x24BDF6A80], "metricsForTextStyle:", *MEMORY[0x24BDF77B0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXActivityStatusView statusLabel](self, "statusLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lineHeight");
  v7 = v6;
  objc_msgSend(MEMORY[0x24BDF6F30], "currentTraitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValueForValue:compatibleWithTraitCollection:", v8, v7);
  v10 = v9;

  v11 = 4.0;
  if (v10 > 20.0)
    v11 = 4.0 - (floor(v10 / 10.0) + -1.0);

  return v11;
}

- (PRXLabel)statusLabel
{
  return self->_statusLabel;
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (NSLayoutConstraint)activityIndicatorVerticalConstraint
{
  return self->_activityIndicatorVerticalConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicatorVerticalConstraint, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
}

@end
