@implementation ReservationSuccessViewController

- (void)viewDidLoad
{
  UIButton *v3;
  UIButton *editButton;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v58;
  void *v59;
  void *v60;
  objc_super v61;
  _QWORD v62[9];

  v61.receiver = self;
  v61.super_class = (Class)ReservationSuccessViewController;
  -[ReservationSuccessViewController viewDidLoad](&v61, "viewDidLoad");
  v3 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
  editButton = self->_editButton;
  self->_editButton = v3;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_editButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationSuccessViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationSuccessViewController mainLabel](self, "mainLabel"));
  objc_msgSend(v5, "addSubview:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationSuccessViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationSuccessViewController subLabel](self, "subLabel"));
  objc_msgSend(v7, "addSubview:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationSuccessViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationSuccessViewController editButton](self, "editButton"));
  objc_msgSend(v9, "addSubview:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationSuccessViewController mainLabel](self, "mainLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationSuccessViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layoutMarginsGuide"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v15));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationSuccessViewController mainLabel](self, "mainLabel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationSuccessViewController view](self, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "layoutMarginsGuide"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v20));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationSuccessViewController mainLabel](self, "mainLabel"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "firstBaselineAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationSuccessViewController view](self, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "layoutMarginsGuide"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "topAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v25, 42.5));

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationSuccessViewController mainLabel](self, "mainLabel"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationSuccessViewController subLabel](self, "subLabel"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "leadingAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v29));

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationSuccessViewController subLabel](self, "subLabel"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationSuccessViewController view](self, "view"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "layoutMarginsGuide"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "trailingAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v34));

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationSuccessViewController subLabel](self, "subLabel"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "firstBaselineAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationSuccessViewController mainLabel](self, "mainLabel"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "firstBaselineAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:constant:", v38, 25.0));

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationSuccessViewController editButton](self, "editButton"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "leadingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationSuccessViewController mainLabel](self, "mainLabel"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "leadingAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v42));

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationSuccessViewController editButton](self, "editButton"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "trailingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationSuccessViewController view](self, "view"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "trailingAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v46));

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationSuccessViewController editButton](self, "editButton"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "lastBaselineAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationSuccessViewController view](self, "view"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "bottomAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:constant:", v50, 16.5));

  v62[0] = v60;
  v62[1] = v59;
  v62[2] = v58;
  v62[3] = v57;
  v62[4] = v56;
  v62[5] = v55;
  v62[6] = v54;
  v62[7] = v53;
  v62[8] = v51;
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v62, 9));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v52);

}

- (void)setMainText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ReservationSuccessViewController mainLabel](self, "mainLabel"));
  objc_msgSend(v5, "setText:", v4);

}

- (void)setSubText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ReservationSuccessViewController subLabel](self, "subLabel"));
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)mainText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationSuccessViewController mainLabel](self, "mainLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (NSString)subText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationSuccessViewController subLabel](self, "subLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (UILabel)mainLabel
{
  UILabel *mainLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;

  mainLabel = self->_mainLabel;
  if (!mainLabel)
  {
    v4 = objc_opt_new(UILabel);
    v5 = self->_mainLabel;
    self->_mainLabel = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle2));
    -[UILabel setFont:](self->_mainLabel, "setFont:", v6);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_mainLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    mainLabel = self->_mainLabel;
  }
  return mainLabel;
}

- (UILabel)subLabel
{
  UILabel *subLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;

  subLabel = self->_subLabel;
  if (!subLabel)
  {
    v4 = objc_opt_new(UILabel);
    v5 = self->_subLabel;
    self->_subLabel = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
    -[UILabel setFont:](self->_subLabel, "setFont:", v6);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_subLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    subLabel = self->_subLabel;
  }
  return subLabel;
}

- (UIButton)editButton
{
  return self->_editButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_storeStrong((id *)&self->_subLabel, 0);
  objc_storeStrong((id *)&self->_mainLabel, 0);
}

@end
