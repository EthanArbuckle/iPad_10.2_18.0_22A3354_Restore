@implementation CarAdvisoryDetailCardViewController

- (void)viewDidLoad
{
  void *v3;
  UILabel *v4;
  UILabel *primaryLabel;
  double v6;
  double v7;
  void *v8;
  UILabel *v9;
  UILabel *secondaryLabel;
  double v11;
  double v12;
  void *v13;
  UILabel *v14;
  UILabel *tertiaryLabel;
  double v16;
  double v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CarAdvisoryDetailCardViewController;
  -[CarAdvisoryDetailCardViewController viewDidLoad](&v19, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoryDetailCardViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("CarAdvisoryDetailCard"));

  v4 = (UILabel *)objc_alloc_init((Class)UILabel);
  primaryLabel = self->_primaryLabel;
  self->_primaryLabel = v4;

  -[UILabel setAccessibilityIdentifier:](self->_primaryLabel, "setAccessibilityIdentifier:", CFSTR("PrimaryLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_primaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v6) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_primaryLabel, "setContentHuggingPriority:forAxis:", 1, v6);
  LODWORD(v7) = 1144782848;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_primaryLabel, "setContentCompressionResistancePriority:forAxis:", 1, v7);
  -[UILabel setNumberOfLines:](self->_primaryLabel, "setNumberOfLines:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoryDetailCardViewController view](self, "view"));
  objc_msgSend(v8, "addSubview:", self->_primaryLabel);

  v9 = (UILabel *)objc_alloc_init((Class)UILabel);
  secondaryLabel = self->_secondaryLabel;
  self->_secondaryLabel = v9;

  -[UILabel setAccessibilityIdentifier:](self->_secondaryLabel, "setAccessibilityIdentifier:", CFSTR("SecondaryLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_secondaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v11) = 1132068864;
  -[UILabel setContentHuggingPriority:forAxis:](self->_secondaryLabel, "setContentHuggingPriority:forAxis:", 1, v11);
  LODWORD(v12) = 1144799232;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_secondaryLabel, "setContentCompressionResistancePriority:forAxis:", 1, v12);
  -[UILabel setNumberOfLines:](self->_secondaryLabel, "setNumberOfLines:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoryDetailCardViewController view](self, "view"));
  objc_msgSend(v13, "addSubview:", self->_secondaryLabel);

  v14 = (UILabel *)objc_alloc_init((Class)UILabel);
  tertiaryLabel = self->_tertiaryLabel;
  self->_tertiaryLabel = v14;

  -[UILabel setAccessibilityIdentifier:](self->_tertiaryLabel, "setAccessibilityIdentifier:", CFSTR("TertiaryLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_tertiaryLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v16) = 1132068864;
  -[UILabel setContentHuggingPriority:forAxis:](self->_tertiaryLabel, "setContentHuggingPriority:forAxis:", 1, v16);
  LODWORD(v17) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_tertiaryLabel, "setContentCompressionResistancePriority:forAxis:", 1, v17);
  -[UILabel setNumberOfLines:](self->_tertiaryLabel, "setNumberOfLines:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoryDetailCardViewController view](self, "view"));
  objc_msgSend(v18, "addSubview:", self->_tertiaryLabel);

  -[CarAdvisoryDetailCardViewController _setupConstraints](self, "_setupConstraints");
  -[CarAdvisoryDetailCardViewController _setupStyling](self, "_setupStyling");
  -[CarAdvisoryDetailCardViewController _updateContents](self, "_updateContents");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarAdvisoryDetailCardViewController;
  -[CarAdvisoryDetailCardViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[CarAdvisoryDetailCardViewController _updateContents](self, "_updateContents");
}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
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
  _QWORD v43[10];

  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_primaryLabel, "firstBaselineAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoryDetailCardViewController view](self, "view"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "topAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, 10.0));
  v43[0] = v38;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_primaryLabel, "leadingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoryDetailCardViewController view](self, "view"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "leadingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, 10.0));
  v43[1] = v34;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_primaryLabel, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoryDetailCardViewController view](self, "view"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "trailingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:constant:", v31, -10.0));
  v43[2] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_secondaryLabel, "topAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_primaryLabel, "bottomAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:", v28, 8.0));
  v43[3] = v27;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_secondaryLabel, "leadingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoryDetailCardViewController view](self, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v24, 10.0));
  v43[4] = v23;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_secondaryLabel, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoryDetailCardViewController view](self, "view"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v20, -10.0));
  v43[5] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_tertiaryLabel, "topAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_secondaryLabel, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", v17, 8.0));
  v43[6] = v16;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_tertiaryLabel, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoryDetailCardViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v13, 10.0));
  v43[7] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_tertiaryLabel, "trailingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoryDetailCardViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6, -10.0));
  v43[8] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_tertiaryLabel, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarAdvisoryDetailCardViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintLessThanOrEqualToAnchor:constant:", v10, -10.0));
  v43[9] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 10));
  objc_msgSend(v42, "addObjectsFromArray:", v12);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v42);
}

- (void)_setupStyling
{
  void *v3;
  void *v4;
  double v5;
  UILabel *primaryLabel;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  UILabel *secondaryLabel;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  UILabel *tertiaryLabel;
  void *v21;
  double v22;
  id v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleCaption1, UIFontWeightRegular));
  -[UILabel setFont:](self->_primaryLabel, "setFont:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_primaryLabel, "font"));
  objc_msgSend(v4, "pointSize");
  primaryLabel = self->_primaryLabel;
  if (10.0 / v5 > 1.0)
  {
    -[UILabel setMinimumScaleFactor:](primaryLabel, "setMinimumScaleFactor:", 1.0);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](primaryLabel, "font"));
    objc_msgSend(v7, "pointSize");
    -[UILabel setMinimumScaleFactor:](self->_primaryLabel, "setMinimumScaleFactor:", 10.0 / v8);

  }
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_primaryLabel, "setAdjustsFontSizeToFitWidth:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_primaryLabel, "setTextColor:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleCaption2, UIFontWeightRegular));
  -[UILabel setFont:](self->_secondaryLabel, "setFont:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_secondaryLabel, "font"));
  objc_msgSend(v11, "pointSize");
  secondaryLabel = self->_secondaryLabel;
  if (10.0 / v12 > 1.0)
  {
    -[UILabel setMinimumScaleFactor:](secondaryLabel, "setMinimumScaleFactor:", 1.0);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](secondaryLabel, "font"));
    objc_msgSend(v14, "pointSize");
    -[UILabel setMinimumScaleFactor:](self->_secondaryLabel, "setMinimumScaleFactor:", 10.0 / v15);

  }
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_secondaryLabel, "setAdjustsFontSizeToFitWidth:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_secondaryLabel, "setTextColor:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleCaption2, UIFontWeightThin));
  -[UILabel setFont:](self->_tertiaryLabel, "setFont:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_tertiaryLabel, "font"));
  objc_msgSend(v18, "pointSize");
  tertiaryLabel = self->_tertiaryLabel;
  if (10.0 / v19 > 1.0)
  {
    -[UILabel setMinimumScaleFactor:](tertiaryLabel, "setMinimumScaleFactor:", 1.0);
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](tertiaryLabel, "font"));
    objc_msgSend(v21, "pointSize");
    -[UILabel setMinimumScaleFactor:](self->_tertiaryLabel, "setMinimumScaleFactor:", 10.0 / v22);

  }
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_tertiaryLabel, "setAdjustsFontSizeToFitWidth:", 1);
  v23 = (id)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_tertiaryLabel, "setTextColor:", v23);

}

- (void)_updateContents
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteAdvisoryItem subtitleString](self->_advisoryItem, "subtitleString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringWithDefaultOptions"));
  -[UILabel setText:](self->_primaryLabel, "setText:", v4);

  v5 = DetailTextsForAdvisoryItem(self->_advisoryItem);
  v9 = (id)objc_claimAutoreleasedReturnValue(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n")));
  -[UILabel setText:](self->_secondaryLabel, "setText:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteAdvisoryItem attributionString](self->_advisoryItem, "attributionString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringWithDefaultOptions"));
  -[UILabel setText:](self->_tertiaryLabel, "setText:", v8);

}

- (void)setAdvisoryItem:(id)a3
{
  id v5;
  GEOComposedRouteAdvisoryItem *advisoryItem;
  id v7;
  void *v8;
  unsigned __int8 v9;
  unint64_t v10;

  v5 = a3;
  advisoryItem = self->_advisoryItem;
  v10 = (unint64_t)v5;
  v7 = advisoryItem;
  v8 = (void *)v10;
  if (v10 | (unint64_t)v7)
  {
    v9 = objc_msgSend((id)v10, "isEqual:", v7);

    v8 = (void *)v10;
    if ((v9 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_advisoryItem, a3);
      -[CarAdvisoryDetailCardViewController _updateContents](self, "_updateContents");
      v8 = (void *)v10;
    }
  }

}

- (NSArray)focusOrderSubItems
{
  return (NSArray *)&__NSArray0__struct;
}

- (NSArray)preferredFocusEnvironments
{
  return (NSArray *)&__NSArray0__struct;
}

- (GEOComposedRouteAdvisoryItem)advisoryItem
{
  return self->_advisoryItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advisoryItem, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
}

@end
