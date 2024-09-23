@implementation CarTrafficAlertBannerView

- (CarTrafficAlertBannerView)initWithTarget:(id)a3 item:(id)a4 aperturePresentation:(BOOL)a5
{
  id v7;
  id v8;
  CarTrafficAlertBannerView *v9;
  CarTrafficAlertBannerView *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  id v14;
  void *v15;
  UILabel *v16;
  UILabel *titleLabel;
  UILabel *v18;
  UILabel *descriptionLabel;
  id v20;
  void *v21;
  UIStackView *v22;
  UIStackView *labelStackView;
  uint64_t v24;
  CPUIBannerViewButton *actionButton;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  objc_super v72;
  _QWORD v73[12];
  _QWORD v74[2];

  v7 = a3;
  v8 = a4;
  v72.receiver = self;
  v72.super_class = (Class)CarTrafficAlertBannerView;
  v9 = -[CarTrafficAlertBannerView initWithFrame:](&v72, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v10 = v9;
  if (v9)
  {
    v11 = (objc_class *)objc_opt_class(v9);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[CarTrafficAlertBannerView setAccessibilityIdentifier:](v10, "setAccessibilityIdentifier:", v13);

    v70 = v8;
    objc_storeWeak((id *)&v10->_target, v7);
    objc_storeStrong((id *)&v10->_item, a4);
    v69 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _applicationIconImageForBundleIdentifier:format:](UIImage, "_applicationIconImageForBundleIdentifier:format:", MapsAppBundleId, 9));
    v14 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v69);
    objc_msgSend(v14, "setAccessibilityIdentifier:", CFSTR("AppIconView"));
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v14, "setContentMode:", 1);
    v15 = v14;
    -[CarTrafficAlertBannerView addSubview:](v10, "addSubview:", v14);
    v16 = objc_opt_new(UILabel);
    titleLabel = v10->_titleLabel;
    v10->_titleLabel = v16;

    -[UILabel setAccessibilityIdentifier:](v10->_titleLabel, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v10->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v18 = objc_opt_new(UILabel);
    v71 = v7;
    descriptionLabel = v10->_descriptionLabel;
    v10->_descriptionLabel = v18;

    -[UILabel setAccessibilityIdentifier:](v10->_descriptionLabel, "setAccessibilityIdentifier:", CFSTR("DescriptionLabel"));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v10->_descriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v20 = objc_alloc((Class)UIStackView);
    v74[0] = v10->_titleLabel;
    v74[1] = v10->_descriptionLabel;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v74, 2));
    v22 = (UIStackView *)objc_msgSend(v20, "initWithArrangedSubviews:", v21);
    labelStackView = v10->_labelStackView;
    v10->_labelStackView = v22;

    -[UIStackView setAccessibilityIdentifier:](v10->_labelStackView, "setAccessibilityIdentifier:", CFSTR("LabelStackView"));
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v10->_labelStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v10->_labelStackView, "setAxis:", 1);
    -[UIStackView setDistribution:](v10->_labelStackView, "setDistribution:", 2);
    -[UIStackView setAlignment:](v10->_labelStackView, "setAlignment:", 0);
    -[CarTrafficAlertBannerView addSubview:](v10, "addSubview:", v10->_labelStackView);
    v24 = objc_claimAutoreleasedReturnValue(+[CPUIBannerViewButton buttonWithChevronImage](CPUIBannerViewButton, "buttonWithChevronImage"));
    actionButton = v10->_actionButton;
    v10->_actionButton = (CPUIBannerViewButton *)v24;

    -[CPUIBannerViewButton setAccessibilityIdentifier:](v10->_actionButton, "setAccessibilityIdentifier:", CFSTR("ActionButton"));
    -[CPUIBannerViewButton setTranslatesAutoresizingMaskIntoConstraints:](v10->_actionButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "window"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "windowScene"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "focusSystem"));
    -[CPUIBannerViewButton setSelected:](v10->_actionButton, "setSelected:", v29 != 0);

    LODWORD(v30) = 1148846080;
    -[CPUIBannerViewButton setContentHuggingPriority:forAxis:](v10->_actionButton, "setContentHuggingPriority:forAxis:", 0, v30);
    LODWORD(v31) = 1148846080;
    -[CPUIBannerViewButton setContentHuggingPriority:forAxis:](v10->_actionButton, "setContentHuggingPriority:forAxis:", 1, v31);
    LODWORD(v32) = 1148846080;
    -[CPUIBannerViewButton setContentCompressionResistancePriority:forAxis:](v10->_actionButton, "setContentCompressionResistancePriority:forAxis:", 0, v32);
    LODWORD(v33) = 1148846080;
    -[CPUIBannerViewButton setContentCompressionResistancePriority:forAxis:](v10->_actionButton, "setContentCompressionResistancePriority:forAxis:", 1, v33);
    -[CarTrafficAlertBannerView addSubview:](v10, "addSubview:", v10->_actionButton);
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertBannerView leadingAnchor](v10, "leadingAnchor"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToAnchor:constant:", v67, 12.0));
    v73[0] = v66;
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "widthAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToConstant:", 33.0));
    v73[1] = v64;
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "centerYAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertBannerView centerYAnchor](v10, "centerYAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:", v62));
    v73[2] = v61;
    v56 = v15;
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "heightAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToConstant:", 33.0));
    v73[3] = v59;
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[CPUIBannerViewButton trailingAnchor](v10->_actionButton, "trailingAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertBannerView trailingAnchor](v10, "trailingAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:constant:", v57, -12.0));
    v73[4] = v55;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[CPUIBannerViewButton widthAnchor](v10->_actionButton, "widthAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToConstant:", 29.0));
    v73[5] = v53;
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[CPUIBannerViewButton centerYAnchor](v10->_actionButton, "centerYAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertBannerView centerYAnchor](v10, "centerYAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v51));
    v73[6] = v50;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[CPUIBannerViewButton heightAnchor](v10->_actionButton, "heightAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToConstant:", 29.0));
    v73[7] = v48;
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](v10->_labelStackView, "leadingAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:constant:", v46, 12.0));
    v73[8] = v45;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](v10->_labelStackView, "trailingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CPUIBannerViewButton leadingAnchor](v10->_actionButton, "leadingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:constant:", v34, -12.0));
    v73[9] = v35;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v10->_labelStackView, "topAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertBannerView topAnchor](v10, "topAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, 3.0));
    v73[10] = v38;
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](v10->_labelStackView, "bottomAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertBannerView bottomAnchor](v10, "bottomAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:constant:", v40, -3.0));
    v73[11] = v41;
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v73, 12));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v42);

    v8 = v70;
    v7 = v71;

    -[CarTrafficAlertBannerView updateFromBannerItem](v10, "updateFromBannerItem");
  }

  return v10;
}

- (void)updateFromBannerItem
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  if (qword_1014D44F8 != -1)
    dispatch_once(&qword_1014D44F8, &stru_1011E96C8);
  v11 = (id)objc_claimAutoreleasedReturnValue(-[CarTrafficAlertBannerView item](self, "item"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "title"));
  if (v3)
  {
    v4 = objc_alloc((Class)NSAttributedString);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "title"));
    v6 = objc_msgSend(v4, "initWithString:attributes:", v5, qword_1014D44E8);
    -[UILabel setAttributedText:](self->_titleLabel, "setAttributedText:", v6);

  }
  else
  {
    -[UILabel setAttributedText:](self->_titleLabel, "setAttributedText:", 0);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subtitle"));
  if (v7)
  {
    v8 = objc_alloc((Class)NSAttributedString);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subtitle"));
    v10 = objc_msgSend(v8, "initWithString:attributes:", v9, qword_1014D44F0);
    -[UILabel setAttributedText:](self->_descriptionLabel, "setAttributedText:", v10);

  }
  else
  {
    -[UILabel setAttributedText:](self->_descriptionLabel, "setAttributedText:", 0);
  }

}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = 54.0;
  result.height = v3;
  return result;
}

- (unint64_t)bannerType
{
  return 1;
}

- (BNBannerSource)target
{
  return (BNBannerSource *)objc_loadWeakRetained((id *)&self->_target);
}

- (BannerItem)item
{
  return self->_item;
}

- (BOOL)aperturePresentation
{
  return self->_aperturePresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_destroyWeak((id *)&self->_target);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
}

@end
