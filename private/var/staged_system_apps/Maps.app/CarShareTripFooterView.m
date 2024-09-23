@implementation CarShareTripFooterView

- (CarShareTripFooterView)initWithFrame:(CGRect)a3
{
  CarShareTripFooterView *v3;
  CarShareTripFooterView *v4;
  id v5;
  double y;
  double width;
  double height;
  id v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UILabel *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  UILabel *nameLabel;
  UILabel *v22;
  UILabel *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  UILabel *handleLabel;
  UILabel *v29;
  NSDictionary *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  objc_super v38;
  _QWORD v39[2];
  _QWORD v40[2];

  v38.receiver = self;
  v38.super_class = (Class)CarShareTripFooterView;
  v3 = -[CarShareTripFooterView initWithFrame:](&v38, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CarShareTripFooterView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("CarShareTripFooterView"));
    v5 = objc_alloc((Class)UILabel);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v9 = objc_msgSend(v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("HeaderLabel"));
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v10) = 1148846080;
    objc_msgSend(v9, "setContentCompressionResistancePriority:forAxis:", 1, v10);
    LODWORD(v11) = 1148846080;
    objc_msgSend(v9, "setContentHuggingPriority:forAxis:", 1, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemPrimaryColor](UIColor, "_carSystemPrimaryColor"));
    objc_msgSend(v9, "setTextColor:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleCaption2, UIFontWeightRegular));
    objc_msgSend(v9, "setFont:", v13);

    objc_msgSend(v9, "setNumberOfLines:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("CarPlay_ShareTrip_SenderInfo_Footer"), CFSTR("localized string not found"), 0));
    objc_msgSend(v9, "setText:", v15);

    -[CarShareTripFooterView addSubview:](v4, "addSubview:", v9);
    v16 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[UILabel setAccessibilityIdentifier:](v16, "setAccessibilityIdentifier:", CFSTR("NameLabel"));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v17) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v16, "setContentCompressionResistancePriority:forAxis:", 1, v17);
    LODWORD(v18) = 1144750080;
    objc_msgSend(v9, "setContentHuggingPriority:forAxis:", 1, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemPrimaryColor](UIColor, "_carSystemPrimaryColor"));
    -[UILabel setTextColor:](v16, "setTextColor:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleCaption2, UIFontWeightRegular));
    -[UILabel setFont:](v16, "setFont:", v20);

    -[UILabel setNumberOfLines:](v16, "setNumberOfLines:", 0);
    -[UILabel setText:](v16, "setText:", &stru_1011EB268);
    -[CarShareTripFooterView addSubview:](v4, "addSubview:", v16);
    nameLabel = v4->_nameLabel;
    v4->_nameLabel = v16;
    v22 = v16;

    v23 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[UILabel setAccessibilityIdentifier:](v23, "setAccessibilityIdentifier:", CFSTR("HandleLabel"));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v24) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v23, "setContentCompressionResistancePriority:forAxis:", 1, v24);
    LODWORD(v25) = 1144750080;
    objc_msgSend(v9, "setContentHuggingPriority:forAxis:", 1, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemSecondaryColor](UIColor, "_carSystemSecondaryColor"));
    -[UILabel setTextColor:](v23, "setTextColor:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 10.0));
    -[UILabel setFont:](v23, "setFont:", v27);

    -[UILabel setLineBreakMode:](v23, "setLineBreakMode:", 5);
    -[UILabel setText:](v23, "setText:", &stru_1011EB268);
    -[CarShareTripFooterView addSubview:](v4, "addSubview:", v23);
    handleLabel = v4->_handleLabel;
    v4->_handleLabel = v23;
    v29 = v23;

    v30 = _NSDictionaryOfVariableBindings(CFSTR("headerLabel, nameLabel, handleLabel"), v9, v22, v29, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v39[0] = CFSTR("v");
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 8.0));
    v39[1] = CFSTR("h");
    v40[0] = v32;
    v40[1] = &off_101270018;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, v39, 2));

    v34 = objc_alloc_init((Class)NSMutableArray);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-v-[headerLabel][nameLabel][handleLabel]-v-|"), 96, v33, v31));
    objc_msgSend(v34, "addObjectsFromArray:", v35);

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-h-[headerLabel]-h-|"), 0, v33, v31));
    objc_msgSend(v34, "addObjectsFromArray:", v36);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v34);
  }
  return v4;
}

- (void)setNameText:(id)a3
{
  if (!a3)
    a3 = &stru_1011EB268;
  -[UILabel setText:](self->_nameLabel, "setText:", a3);
}

- (void)setHandleText:(id)a3
{
  if (!a3)
    a3 = &stru_1011EB268;
  -[UILabel setText:](self->_handleLabel, "setText:", a3);
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (UILabel)handleLabel
{
  return self->_handleLabel;
}

- (void)setHandleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_handleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
}

@end
