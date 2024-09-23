@implementation DirectionsElevationLabelView

+ (id)_formatter
{
  if (qword_1014D2090 != -1)
    dispatch_once(&qword_1014D2090, &stru_1011B0E40);
  return (id)qword_1014D2088;
}

- (DirectionsElevationLabelView)initWithFrame:(CGRect)a3
{
  return -[DirectionsElevationLabelView initWithStyle:](self, "initWithStyle:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (DirectionsElevationLabelView)initWithStyle:(int64_t)a3
{
  double y;
  double width;
  double height;
  DirectionsElevationLabelView *v7;
  DirectionsElevationLabelView *v8;
  double v9;
  double v10;
  UILabel *v11;
  UILabel *label;
  double v13;
  double v14;
  __CFString *v15;
  __CFString *v16;
  id v17;
  void *v18;
  UIImageView *v19;
  UIImageView *imageView;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  objc_super v42;
  _QWORD v43[2];

  v42.receiver = self;
  v42.super_class = (Class)DirectionsElevationLabelView;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = -[DirectionsElevationLabelView initWithFrame:](&v42, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v8 = v7;
  if (v7)
  {
    v7->_style = a3;
    -[DirectionsElevationLabelView setIsAccessibilityElement:](v7, "setIsAccessibilityElement:", 1);
    LODWORD(v9) = 1148846080;
    -[DirectionsElevationLabelView setContentCompressionResistancePriority:forAxis:](v8, "setContentCompressionResistancePriority:forAxis:", 1, v9);
    LODWORD(v10) = 1148829696;
    -[DirectionsElevationLabelView setContentCompressionResistancePriority:forAxis:](v8, "setContentCompressionResistancePriority:forAxis:", 0, v10);
    v11 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    label = v8->_label;
    v8->_label = v11;

    -[UILabel setAccessibilityIdentifier:](v8->_label, "setAccessibilityIdentifier:", CFSTR("TextLabel"));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v8->_label, "setAdjustsFontForContentSizeCategory:", 1);
    LODWORD(v13) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v8->_label, "setContentCompressionResistancePriority:forAxis:", 1, v13);
    LODWORD(v14) = 1148829696;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v8->_label, "setContentCompressionResistancePriority:forAxis:", 0, v14);
    v15 = CFSTR("arrow.down.forward.circle.fill");
    if (!a3)
      v15 = CFSTR("arrow.up.forward.circle.fill");
    v16 = v15;
    v17 = objc_alloc((Class)UIImageView);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v16));

    v19 = (UIImageView *)objc_msgSend(v17, "initWithImage:", v18);
    imageView = v8->_imageView;
    v8->_imageView = v19;

    -[UIImageView setAccessibilityIdentifier:](v8->_imageView, "setAccessibilityIdentifier:", CFSTR("ImageView"));
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v8->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel textColor](v8->_label, "textColor"));
    -[UIImageView setTintColor:](v8->_imageView, "setTintColor:", v21);

    LODWORD(v22) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v8->_imageView, "setContentHuggingPriority:forAxis:", 0, v22);
    LODWORD(v23) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v8->_imageView, "setContentHuggingPriority:forAxis:", 1, v23);
    LODWORD(v24) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v8->_imageView, "setContentCompressionResistancePriority:forAxis:", 1, v24);
    LODWORD(v25) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v8->_imageView, "setContentCompressionResistancePriority:forAxis:", 0, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleHeadline));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[DirectionsElevationLabelView setFont:color:](v8, "setFont:color:", v26, v27);
    v28 = objc_alloc((Class)UIStackView);
    v43[0] = v8->_imageView;
    v43[1] = v8->_label;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 2));
    v30 = objc_msgSend(v28, "initWithArrangedSubviews:", v29);

    objc_msgSend(v30, "setAccessibilityIdentifier:", CFSTR("StackView"));
    objc_msgSend(v30, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v30, "setAxis:", 0);
    objc_msgSend(v30, "setDistribution:", 2);
    objc_msgSend(v30, "setAlignment:", 0);
    objc_msgSend(v30, "setSpacing:", 3.0);
    LODWORD(v31) = 1132068864;
    objc_msgSend(v30, "setContentHuggingPriority:forAxis:", 0, v31);
    LODWORD(v32) = 1148846080;
    objc_msgSend(v30, "setContentHuggingPriority:forAxis:", 1, v32);
    LODWORD(v33) = 1148829696;
    objc_msgSend(v30, "setContentCompressionResistancePriority:forAxis:", 0, v33);
    LODWORD(v34) = 1148846080;
    objc_msgSend(v30, "setContentCompressionResistancePriority:forAxis:", 1, v34);
    -[DirectionsElevationLabelView addSubview:](v8, "addSubview:", v30);
    LODWORD(v35) = 1148846080;
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "_maps_constraintsEqualToEdgesOfView:priority:", v8, v35));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "allConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v37);

    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v39 = MNLocaleDidChangeNotification();
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    objc_msgSend(v38, "addObserver:selector:name:object:", v8, "_refreshLabel", v40, 0);

  }
  return v8;
}

- (void)setFont:(id)a3
{
  UILabel *label;
  id v5;
  id v6;

  label = self->_label;
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[UILabel textColor](label, "textColor"));
  -[DirectionsElevationLabelView setFont:color:](self, "setFont:color:", v5, v6);

}

- (void)setFont:(id)a3 color:(id)a4
{
  UILabel *label;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  label = self->_label;
  v10 = a4;
  v7 = a3;
  -[UILabel setFont:](label, "setFont:", v7);
  if (sub_1002A8AA0(self) == 5)
    v8 = -1;
  else
    v8 = 1;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v7, v8));

  -[UIImageView setPreferredSymbolConfiguration:](self->_imageView, "setPreferredSymbolConfiguration:", v9);
  -[UILabel setTextColor:](self->_label, "setTextColor:", v10);
  -[UIImageView setTintColor:](self->_imageView, "setTintColor:", v10);

}

- (void)setElevation:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 v8;
  id v9;

  v5 = a3;
  v6 = self->_elevation;
  v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    v9 = (id)v7;
    v8 = objc_msgSend((id)v6, "isEqual:", v7);

    v7 = (unint64_t)v9;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_elevation, a3);
      -[DirectionsElevationLabelView _refreshLabel](self, "_refreshLabel");
      v7 = (unint64_t)v9;
    }
  }

}

- (void)_refreshLabel
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  int64_t style;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  NSMeasurement *v18;

  v18 = self->_elevation;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  if ((objc_msgSend(v3, "_navigation_distanceUsesMetricSystem") & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMeasurement unit](v18, "unit"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUnitLength feet](NSUnitLength, "feet"));
    v6 = objc_msgSend(v4, "isEqual:", v5);

    if ((v6 & 1) != 0)
      goto LABEL_5;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUnitLength feet](NSUnitLength, "feet"));
    v7 = objc_claimAutoreleasedReturnValue(-[NSMeasurement measurementByConvertingToUnit:](v18, "measurementByConvertingToUnit:", v3));

    v18 = (NSMeasurement *)v7;
  }

LABEL_5:
  if (v18)
  {
    v8 = objc_msgSend((id)objc_opt_class(self), "_formatter");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringFromMeasurement:", v18));
    -[UILabel setText:](self->_label, "setText:", v10);

    style = self->_style;
    if (style == 1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = v12;
      v14 = CFSTR("Elevation graph loss accessibility label");
      goto LABEL_11;
    }
    if (!style)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = v12;
      v14 = CFSTR("Elevation graph gain accessibility label");
LABEL_11:
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", v14, CFSTR("localized string not found"), 0));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_label, "text"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v16));
      -[DirectionsElevationLabelView setAccessibilityLabel:](self, "setAccessibilityLabel:", v17);

    }
  }
  else
  {
    -[UILabel setText:](self->_label, "setText:", 0);
  }

}

- (id)accessibilityIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(self, a2);
  return NSStringFromClass(v2);
}

- (NSMeasurement)elevation
{
  return self->_elevation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elevation, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
