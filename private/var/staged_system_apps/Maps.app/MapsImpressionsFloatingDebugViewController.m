@implementation MapsImpressionsFloatingDebugViewController

- (void)setCalculator:(id)a3
{
  id v4;
  id WeakRetained;
  _QWORD v6[5];

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_calculator);

  if (WeakRetained != v4)
  {
    objc_msgSend(v4, "setObserverBlock:", 0);
    objc_storeWeak((id *)&self->_calculator, v4);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100BE3848;
    v6[3] = &unk_1011AC860;
    v6[4] = self;
    objc_msgSend(v4, "setObserverBlock:", v6);
  }

}

- (id)iconText
{
  return CFSTR("IMPRESSIONS");
}

- (void)_updateDebugText
{
  void *v3;
  void *v4;
  id WeakRetained;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsImpressionsFloatingDebugViewController view](self, "view"));
  objc_msgSend(v3, "setHidden:", 0);

  WeakRetained = objc_loadWeakRetained((id *)&self->_calculator);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "debugState"));
  -[UILabel setText:](self->_debugLabel, "setText:", v4);

}

- (void)viewDidLoad
{
  UILabel *v3;
  void *v4;
  void *v5;
  UILabel *debugLabel;
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
  objc_super v30;
  _QWORD v31[4];

  v30.receiver = self;
  v30.super_class = (Class)MapsImpressionsFloatingDebugViewController;
  -[MapsFloatingDebugViewController viewDidLoad](&v30, "viewDidLoad");
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont monospacedSystemFontOfSize:weight:](UIFont, "monospacedSystemFontOfSize:weight:", 9.0, UIFontWeightRegular));
  -[UILabel setFont:](v3, "setFont:", v4);

  -[UILabel setNumberOfLines:](v3, "setNumberOfLines:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  -[UILabel setTextColor:](v3, "setTextColor:", v5);

  debugLabel = self->_debugLabel;
  self->_debugLabel = v3;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
  objc_msgSend(v7, "addSubview:", self->_debugLabel);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_debugLabel, "topAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "topAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, 5.0));
  v31[0] = v25;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_debugLabel, "bottomAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bottomAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v22, -5.0));
  v31[1] = v21;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_debugLabel, "leadingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leadingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v9, 5.0));
  v31[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_debugLabel, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController contentView](self, "contentView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, -5.0));
  v31[3] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 4));
  objc_msgSend(v29, "addObjectsFromArray:", v15);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v29);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 7, 3, 35.0));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("eyeglasses"), v16));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "imageWithRenderingMode:", 2));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFloatingDebugViewController thumbnailImageView](self, "thumbnailImageView"));
  objc_msgSend(v19, "setImage:", v18);

}

- (id)tintColor
{
  return +[UIColor magentaColor](UIColor, "magentaColor");
}

- (MUImpressionsCalculator)calculator
{
  return (MUImpressionsCalculator *)objc_loadWeakRetained((id *)&self->_calculator);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_calculator);
  objc_storeStrong((id *)&self->_debugLabel, 0);
}

@end
