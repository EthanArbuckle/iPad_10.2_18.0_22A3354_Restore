@implementation FlyoverTrayHeader

- (FlyoverTrayHeader)initWithFrame:(CGRect)a3
{
  FlyoverTrayHeader *v3;
  FlyoverTrayHeader *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FlyoverTrayHeader;
  v3 = -[FlyoverTrayHeader initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[FlyoverTrayHeader setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("FlyoverTrayHeader"));
    -[FlyoverTrayHeader _setupViews](v4, "_setupViews");
    -[FlyoverTrayHeader _setupConstraints](v4, "_setupConstraints");
  }
  return v4;
}

- (void)_setupViews
{
  id v3;
  double y;
  double width;
  double height;
  id v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  ShorteningLabel *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  CardButton *v35;
  void *v36;
  id v37;
  CardButton *v38;

  v3 = objc_alloc((Class)UILabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[FlyoverTrayHeader setTitleLabel:](self, "setTitleLabel:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader titleLabel](self, "titleLabel"));
  objc_msgSend(v8, "setNumberOfLines:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader titleLabel](self, "titleLabel"));
  LODWORD(v10) = 1132068864;
  objc_msgSend(v9, "setContentCompressionResistancePriority:forAxis:", 0, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader titleLabel](self, "titleLabel"));
  LODWORD(v12) = 1148846080;
  objc_msgSend(v11, "setContentCompressionResistancePriority:forAxis:", 1, v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader titleLabel](self, "titleLabel"));
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader titleLabel](self, "titleLabel"));
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v14, &stru_1011B83A0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader titleLabel](self, "titleLabel"));
  objc_msgSend(v16, "setBackgroundColor:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader titleLabel](self, "titleLabel"));
  objc_msgSend(v18, "setTextColor:", v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader titleLabel](self, "titleLabel"));
  objc_msgSend(v19, "setAccessibilityIdentifier:", CFSTR("FlyoverTrayHeaderTitle"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader titleLabel](self, "titleLabel"));
  -[FlyoverTrayHeader addSubview:](self, "addSubview:", v20);

  v21 = -[ShorteningLabel initWithFrame:]([ShorteningLabel alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[FlyoverTrayHeader setSubtitleLabel:](self, "setSubtitleLabel:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v23, "setTextColor:", v22);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v24, "setNumberOfLines:", 0);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader subtitleLabel](self, "subtitleLabel"));
  LODWORD(v26) = 1132068864;
  objc_msgSend(v25, "setContentCompressionResistancePriority:forAxis:", 0, v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader subtitleLabel](self, "subtitleLabel"));
  LODWORD(v28) = 1148846080;
  objc_msgSend(v27, "setContentCompressionResistancePriority:forAxis:", 1, v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader subtitleLabel](self, "subtitleLabel"));
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v30, &stru_1011B8380);

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v32, "setBackgroundColor:", v31);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v33, "setAccessibilityIdentifier:", CFSTR("FlyoverTrayHeaderSubtitle"));

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader subtitleLabel](self, "subtitleLabel"));
  -[FlyoverTrayHeader addSubview:](self, "addSubview:", v34);

  v35 = [CardButton alloc];
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[CardButtonConfiguration close](CardButtonConfiguration, "close"));
  v38 = -[CardButton initWithConfiguration:](v35, "initWithConfiguration:", v36);

  -[CardButton setTranslatesAutoresizingMaskIntoConstraints:](v38, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CardButton addTarget:action:forControlEvents:](v38, "addTarget:action:forControlEvents:", self, "buttonDidTouchUpInside:", 64);
  -[CardButton setAccessibilityIdentifier:](v38, "setAccessibilityIdentifier:", CFSTR("FlyoverTrayHeaderButton"));
  -[FlyoverTrayHeader addSubview:](self, "addSubview:", v38);
  -[FlyoverTrayHeader setButton:](self, "setButton:", v38);
  v37 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "trayHeaderDidReceiveTap:");
  -[FlyoverTrayHeader addGestureRecognizer:](self, "addGestureRecognizer:", v37);

}

- (void)_setupConstraints
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSDictionary *v7;
  void *v8;
  uint64_t v9;
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
  void *v20;
  void *v21;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  const __CFString *v38;
  void *v39;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader titleLabel](self, "titleLabel"));
  v4 = objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader subtitleLabel](self, "subtitleLabel"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader button](self, "button"));
  v5 = (void *)v4;
  v6 = v3;
  v7 = _NSDictionaryOfVariableBindings(CFSTR("titleLabel, subtitleLabel, button"), v3, v4, v36, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v38 = CFSTR("margin");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 16.0));
  v39 = v8;
  v9 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));

  v34 = (void *)v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(margin)-[titleLabel]-(>=margin)-[button]|"), 0, v9, v35));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(margin)-[subtitleLabel]-(>=margin)-[button]|"), 0, v9, v35));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v11);

  v32 = v6;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstBaselineAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader topAnchor](self, "topAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v31));
  v28 = v5;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v30, &stru_1011B83A0, 35.0));
  v37[0] = v29;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstBaselineAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastBaselineAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v25, &stru_1011B8380, 21.0));
  v37[1] = v24;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstBaselineAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader bottomAnchor](self, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v22, -21.0));
  v37[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader button](self, "button"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader topAnchor](self, "topAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));
  v37[3] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader button](self, "button"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader trailingAnchor](self, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
  v37[4] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 5));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "setText:", v4);

}

- (void)setSubtitle:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v4);

  v7 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  -[FlyoverTrayHeader setAttributedSubtitleAlternatives:](self, "setAttributedSubtitleAlternatives:", v6);

}

- (void)setAttributedSubtitleAlternatives:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader subtitleLabel](self, "subtitleLabel"));
    objc_msgSend(v5, "setAttributedText:", v4);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader subtitleLabel](self, "subtitleLabel"));
    objc_msgSend(v6, "sizeToFit");

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v7, "setAttributedTextAlternatives:", v8);

}

- (void)buttonDidTouchUpInside:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader delegate](self, "delegate"));
  objc_msgSend(v5, "trayHeaderButtonDidTouchUpInside:", v4);

}

- (void)trayHeaderDidReceiveTap:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[FlyoverTrayHeader delegate](self, "delegate", a3));
  objc_msgSend(v3, "trayHeaderDidReceiveTap");

}

- (TrayHeaderDelegate)delegate
{
  return (TrayHeaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (ShorteningLabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (CardButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
