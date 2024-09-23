@implementation RoutePlanningWaypointPillView

- (RoutePlanningWaypointPillView)initWithWaypointIndex:(unint64_t)a3 waypointInfoProvider:(id)a4
{
  id v6;
  RoutePlanningWaypointPillView *v7;
  void *v8;
  UILabel *v9;
  UILabel *textLabel;
  double v11;
  double v12;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  objc_super v34;
  _QWORD v35[5];

  v6 = a4;
  v34.receiver = self;
  v34.super_class = (Class)RoutePlanningWaypointPillView;
  v7 = -[RoutePlanningWaypointPillView init](&v34, "init");
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor quaternarySystemFillColor](UIColor, "quaternarySystemFillColor"));
    -[RoutePlanningWaypointPillView setBackgroundColor:](v7, "setBackgroundColor:", v8);

    v9 = objc_opt_new(UILabel);
    textLabel = v7->_textLabel;
    v7->_textLabel = v9;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v7->_textLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v11) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v7->_textLabel, "setContentCompressionResistancePriority:forAxis:", 0, v11);
    LODWORD(v12) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v7->_textLabel, "setContentCompressionResistancePriority:forAxis:", 1, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v7->_textLabel, "setTextColor:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:weight:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", UIFontTextStyleCaption1, UIFontWeightBold));
    -[UILabel setFont:](v7->_textLabel, "setFont:", v14);

    -[RoutePlanningWaypointPillView addSubview:](v7, "addSubview:", v7->_textLabel);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointPillView _attributedTitleTextForWaypointAtIndex:withInfoProvider:](v7, "_attributedTitleTextForWaypointAtIndex:withInfoProvider:", a3, v6));
    -[UILabel setAttributedText:](v7->_textLabel, "setAttributedText:", v15);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v7->_textLabel, "leadingAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointPillView leadingAnchor](v7, "leadingAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:constant:", v31, 8.0));
    v35[0] = v30;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v7->_textLabel, "trailingAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointPillView trailingAnchor](v7, "trailingAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:", v28, -8.0));
    v35[1] = v27;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v7->_textLabel, "topAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointPillView topAnchor](v7, "topAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", v16, 5.5));
    v35[2] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v7->_textLabel, "centerYAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointPillView centerYAnchor](v7, "centerYAnchor"));
    v33 = v6;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
    v35[3] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v7->_textLabel, "bottomAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointPillView bottomAnchor](v7, "bottomAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, -5.5));
    v35[4] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 5));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

    v6 = v33;
  }

  return v7;
}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;

  v3.receiver = self;
  v3.super_class = (Class)RoutePlanningWaypointPillView;
  -[RoutePlanningWaypointPillView layoutSubviews](&v3, "layoutSubviews");
  -[RoutePlanningWaypointPillView bounds](self, "bounds");
  -[RoutePlanningWaypointPillView setBoundsHeight:](self, "setBoundsHeight:", CGRectGetHeight(v4));
}

- (void)setBoundsHeight:(double)a3
{
  if (vabdd_f64(a3, self->_boundsHeight) > 2.22044605e-16)
  {
    self->_boundsHeight = a3;
    -[RoutePlanningWaypointPillView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", a3 * 0.5);
  }
}

- (id)_attributedTitleTextForWaypointAtIndex:(unint64_t)a3 withInfoProvider:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  char *v19;
  id v20;
  NSObject *v21;
  int v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chargingInfoForWaypointAtIndex:", a3));
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "chargingTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_stringWithSeconds:andAbbreviationType:](NSString, "_navigation_stringWithSeconds:andAbbreviationType:", (unint64_t)v9, 1));
    v11 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v10);
LABEL_5:
    v13 = v11;
    goto LABEL_6;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "evStepInfoForWaypointAtIndex:", a3));
  v10 = v12;
  if (v12)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointPillView _attributedBatteryChargeStringForBatteryPercentage:](self, "_attributedBatteryChargeStringForBatteryPercentage:", objc_msgSend(v12, "remainingBatteryPercentage")));
    goto LABEL_5;
  }
  v15 = sub_1004318FC();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v22 = 136315650;
    v23 = "-[RoutePlanningWaypointPillView _attributedTitleTextForWaypointAtIndex:withInfoProvider:]";
    v24 = 2080;
    v25 = "RoutePlanningWaypointPillView.m";
    v26 = 1024;
    v27 = 92;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v22, 0x1Cu);
  }

  if (sub_100A70734())
  {
    v17 = sub_1004318FC();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      v22 = 138412290;
      v23 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v22, 0xCu);

    }
  }
  v20 = sub_10043214C();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v22 = 134217984;
    v23 = (const char *)a3;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Didn't get evInfo for waypoint at index: %lu", (uint8_t *)&v22, 0xCu);
  }

  v13 = 0;
LABEL_6:

  return v13;
}

- (id)_attributedBatteryChargeStringForBatteryPercentage:(unsigned int)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSTextAttachment *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_textLabel, "font"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", UIFontTextStyleCaption1, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("bolt.fill")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageWithConfiguration:", v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageWithRenderingMode:", 2));

  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[VehicleBatteryView colorForBatteryLevel:](VehicleBatteryView, "colorForBatteryLevel:", a3));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_flatImageWithColor:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imageWithRenderingMode:", 1));

  v13 = objc_opt_new(NSTextAttachment);
  -[NSTextAttachment setImage:](v13, "setImage:", v12);
  objc_msgSend(v4, "capHeight");
  v15 = v14;
  objc_msgSend(v12, "size");
  v17 = (v15 - v16) * 0.5;
  objc_msgSend(v12, "size");
  v19 = v18;
  objc_msgSend(v12, "size");
  -[NSTextAttachment setBounds:](v13, "setBounds:", 0.0, v17, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithAttachment:](NSAttributedString, "attributedStringWithAttachment:", v13));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %lu%%"), v9));
  v23 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithAttributedString:", v21);
  v24 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v22);
  objc_msgSend(v23, "appendAttributedString:", v24);

  v25 = objc_msgSend(v23, "copy");
  return v25;
}

- (double)boundsHeight
{
  return self->_boundsHeight;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_waypointInfoProvider);
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end
