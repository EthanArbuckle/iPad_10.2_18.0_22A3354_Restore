@implementation WSNanoWebSheetDetailView

- (WSNanoWebSheetDetailView)initWithURL:(id)a3 ssid:(id)a4 isSecure:(BOOL)a5 hasEVCert:(BOOL)a6
{
  WSNanoWebSheetDetailView *v8;
  void *v9;
  UILabel *v10;
  UILabel *urlLabel;
  void *v12;
  UILabel *v13;
  UILabel *ssidLabel;
  void *v15;
  uint64_t v16;
  UIImageView *padlockImageView;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
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
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _BOOL4 v51;
  id v52;
  id v53;
  objc_super v54;
  _QWORD v55[10];

  v51 = a5;
  v55[8] = *MEMORY[0x24BDAC8D0];
  v54.receiver = self;
  v54.super_class = (Class)WSNanoWebSheetDetailView;
  v53 = a4;
  v52 = a3;
  v8 = -[WSNanoWebSheetDetailView init](&v54, sel_init);
  v8->_hasEVCert = a6;
  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WSNanoWebSheetDetailView setBackgroundColor:](v8, "setBackgroundColor:", v9);

  v10 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
  urlLabel = v8->_urlLabel;
  v8->_urlLabel = v10;

  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTintColor:](v8->_urlLabel, "setTintColor:", v12);

  v13 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
  ssidLabel = v8->_ssidLabel;
  v8->_ssidLabel = v13;

  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTintColor:](v8->_ssidLabel, "setTintColor:", v15);

  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithScale:", 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:withConfiguration:", CFSTR("lock.fill"), v50);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v49);
  padlockImageView = v8->_padlockImageView;
  v8->_padlockImageView = (UIImageView *)v16;

  -[WSNanoWebSheetDetailView updateURILabel](v8, "updateURILabel");
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8->_urlLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8->_ssidLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v8->_padlockImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WSNanoWebSheetDetailView addSubview:](v8, "addSubview:", v8->_urlLabel);
  -[WSNanoWebSheetDetailView addSubview:](v8, "addSubview:", v8->_ssidLabel);
  -[UILabel setTextAlignment:](v8->_ssidLabel, "setTextAlignment:", 0);
  -[UILabel setTextAlignment:](v8->_urlLabel, "setTextAlignment:", 0);
  -[WSNanoWebSheetDetailView addSubview:](v8, "addSubview:", v8->_padlockImageView);
  v37 = (void *)MEMORY[0x24BDD1628];
  -[UILabel topAnchor](v8->_urlLabel, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[WSNanoWebSheetDetailView layoutMarginsGuide](v8, "layoutMarginsGuide");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v46);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v45;
  -[UILabel widthAnchor](v8->_urlLabel, "widthAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[WSNanoWebSheetDetailView layoutMarginsGuide](v8, "layoutMarginsGuide");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "widthAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:constant:", v42, -10.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v41;
  -[UILabel topAnchor](v8->_ssidLabel, "topAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](v8->_urlLabel, "bottomAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, 10.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v38;
  -[UILabel leadingAnchor](v8->_ssidLabel, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel leadingAnchor](v8->_urlLabel, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v34;
  -[UILabel widthAnchor](v8->_ssidLabel, "widthAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[WSNanoWebSheetDetailView layoutMarginsGuide](v8, "layoutMarginsGuide");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "widthAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:constant:", v31, -10.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v55[4] = v30;
  -[UIImageView firstBaselineAnchor](v8->_padlockImageView, "firstBaselineAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel firstBaselineAnchor](v8->_urlLabel, "firstBaselineAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v55[5] = v27;
  -[UIImageView trailingAnchor](v8->_padlockImageView, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel leadingAnchor](v8->_urlLabel, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, -2.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v55[6] = v20;
  -[UIImageView leadingAnchor](v8->_padlockImageView, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[WSNanoWebSheetDetailView layoutMarginsGuide](v8, "layoutMarginsGuide");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintGreaterThanOrEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v55[7] = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "activateConstraints:", v25);

  -[UIImageView setHidden:](v8->_padlockImageView, "setHidden:", !v51);
  -[UILabel setNumberOfLines:](v8->_urlLabel, "setNumberOfLines:", 0);
  -[UILabel setLineBreakMode:](v8->_urlLabel, "setLineBreakMode:", 0);
  -[UILabel setAdjustsFontForContentSizeCategory:](v8->_urlLabel, "setAdjustsFontForContentSizeCategory:", 1);
  -[UILabel setText:](v8->_urlLabel, "setText:", v52);

  -[UILabel sizeToFit](v8->_urlLabel, "sizeToFit");
  -[UILabel setNumberOfLines:](v8->_ssidLabel, "setNumberOfLines:", 0);
  -[UILabel setAdjustsFontForContentSizeCategory:](v8->_ssidLabel, "setAdjustsFontForContentSizeCategory:", 1);
  -[UILabel setText:](v8->_ssidLabel, "setText:", v53);

  -[UILabel sizeToFit](v8->_ssidLabel, "sizeToFit");
  return v8;
}

- (id)_evCertColor
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_evCertColor_color;
  if (!_evCertColor_color)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6950]), "initWithRed:green:blue:alpha:", 0.262745098, 0.749019608, 0.345098039, 1.0);
    v4 = (void *)_evCertColor_color;
    _evCertColor_color = v3;

    v2 = (void *)_evCertColor_color;
  }
  return v2;
}

- (void)updateURILabel
{
  void *v3;
  void *v4;
  id v5;

  if (self->_hasEVCert)
    -[WSNanoWebSheetDetailView _evCertColor](self, "_evCertColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_urlLabel, "setTextColor:", v5);
  -[UIImageView image](self->_padlockImageView, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithRenderingMode:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_padlockImageView, "setImage:", v4);

  -[UIImageView setTintColor:](self->_padlockImageView, "setTintColor:", v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_padlockImageView, 0);
  objc_storeStrong((id *)&self->_ssidLabel, 0);
  objc_storeStrong((id *)&self->_urlLabel, 0);
}

@end
