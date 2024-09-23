@implementation RoutePlanningEVChargeOptionsView

- (RoutePlanningEVChargeOptionsView)init
{
  RoutePlanningEVChargeOptionsView *v2;
  RoutePlanningEVChargeOptionsView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RoutePlanningEVChargeOptionsView;
  v2 = -[RoutePlanningEVChargeOptionsView init](&v5, "init");
  v3 = v2;
  if (v2)
    -[RoutePlanningEVChargeOptionsView _setup](v2, "_setup");
  return v3;
}

- (RoutePlanningEVChargeOptionsView)initWithFrame:(CGRect)a3
{
  RoutePlanningEVChargeOptionsView *v3;
  RoutePlanningEVChargeOptionsView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RoutePlanningEVChargeOptionsView;
  v3 = -[RoutePlanningEVChargeOptionsView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[RoutePlanningEVChargeOptionsView _setup](v3, "_setup");
  return v4;
}

- (void)_setup
{
  UISwitch *v3;
  UISwitch *checkbox;
  double v5;
  double v6;
  double v7;
  double v8;
  UILabel *v9;
  UILabel *descriptionLabel;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
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
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[12];

  v3 = objc_opt_new(UISwitch);
  checkbox = self->_checkbox;
  self->_checkbox = v3;

  -[UISwitch setTranslatesAutoresizingMaskIntoConstraints:](self->_checkbox, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v5) = 1148846080;
  -[UISwitch setContentHuggingPriority:forAxis:](self->_checkbox, "setContentHuggingPriority:forAxis:", 0, v5);
  LODWORD(v6) = 1148846080;
  -[UISwitch setContentCompressionResistancePriority:forAxis:](self->_checkbox, "setContentCompressionResistancePriority:forAxis:", 0, v6);
  LODWORD(v7) = 1148846080;
  -[UISwitch setContentHuggingPriority:forAxis:](self->_checkbox, "setContentHuggingPriority:forAxis:", 1, v7);
  LODWORD(v8) = 1148846080;
  -[UISwitch setContentCompressionResistancePriority:forAxis:](self->_checkbox, "setContentCompressionResistancePriority:forAxis:", 1, v8);
  v9 = objc_opt_new(UILabel);
  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = v9;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_descriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_descriptionLabel, "setTextColor:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  -[UILabel setFont:](self->_descriptionLabel, "setFont:", v12);

  -[UILabel setNumberOfLines:](self->_descriptionLabel, "setNumberOfLines:", 0);
  LODWORD(v13) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_descriptionLabel, "setContentHuggingPriority:forAxis:", 0, v13);
  LODWORD(v14) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_descriptionLabel, "setContentCompressionResistancePriority:forAxis:", 0, v14);
  LODWORD(v15) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_descriptionLabel, "setContentHuggingPriority:forAxis:", 1, v15);
  LODWORD(v16) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_descriptionLabel, "setContentCompressionResistancePriority:forAxis:", 1, v16);
  -[RoutePlanningEVChargeOptionsView addSubview:](self, "addSubview:", self->_checkbox);
  -[RoutePlanningEVChargeOptionsView addSubview:](self, "addSubview:", self->_descriptionLabel);
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[UISwitch leadingAnchor](self->_checkbox, "leadingAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningEVChargeOptionsView leadingAnchor](self, "leadingAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:constant:", v56, 0.0));
  v58[0] = v55;
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[UISwitch centerYAnchor](self->_checkbox, "centerYAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningEVChargeOptionsView centerYAnchor](self, "centerYAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:", v53));
  v58[1] = v52;
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[UISwitch topAnchor](self->_checkbox, "topAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningEVChargeOptionsView topAnchor](self, "topAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintGreaterThanOrEqualToAnchor:constant:", v50, 8.0));
  v58[2] = v49;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[UISwitch bottomAnchor](self->_checkbox, "bottomAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningEVChargeOptionsView bottomAnchor](self, "bottomAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintLessThanOrEqualToAnchor:constant:", v47, -8.0));
  v58[3] = v46;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_descriptionLabel, "leadingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UISwitch trailingAnchor](self->_checkbox, "trailingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:constant:", v44, 8.0));
  v58[4] = v43;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_descriptionLabel, "trailingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningEVChargeOptionsView trailingAnchor](self, "trailingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:constant:", v41, -8.0));
  v58[5] = v40;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_descriptionLabel, "topAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningEVChargeOptionsView topAnchor](self, "topAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintGreaterThanOrEqualToAnchor:constant:", v38, 8.0));
  v58[6] = v37;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_descriptionLabel, "bottomAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningEVChargeOptionsView bottomAnchor](self, "bottomAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintLessThanOrEqualToAnchor:constant:", v35, -8.0));
  v58[7] = v34;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UISwitch topAnchor](self->_checkbox, "topAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningEVChargeOptionsView topAnchor](self, "topAnchor"));
  LODWORD(v17) = 1144750080;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:constant:priority:", v32, 8.0, v17));
  v58[8] = v31;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_descriptionLabel, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningEVChargeOptionsView topAnchor](self, "topAnchor"));
  LODWORD(v20) = 1144750080;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:priority:", v19, 8.0, v20));
  v58[9] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UISwitch topAnchor](self->_checkbox, "topAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningEVChargeOptionsView bottomAnchor](self, "bottomAnchor"));
  LODWORD(v24) = 1144750080;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:priority:", v23, -8.0, v24));
  v58[10] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_descriptionLabel, "bottomAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningEVChargeOptionsView bottomAnchor](self, "bottomAnchor"));
  LODWORD(v28) = 1144750080;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:priority:", v27, -8.0, v28));
  v58[11] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v58, 12));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v30);

}

- (UISwitch)checkbox
{
  return self->_checkbox;
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_checkbox, 0);
}

@end
