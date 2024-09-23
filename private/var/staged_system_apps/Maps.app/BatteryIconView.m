@implementation BatteryIconView

- (BatteryIconView)initWithFrame:(CGRect)a3
{
  BatteryIconView *v3;
  id v4;
  void *v5;
  void *v6;
  UIImageView *v7;
  UIImageView *outlineView;
  id v9;
  void *v10;
  void *v11;
  UIImageView *v12;
  UIImageView *levelView;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)BatteryIconView;
  v3 = -[BatteryIconView initWithFrame:](&v15, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v3)
  {
    v4 = objc_alloc((Class)UIImageView);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("batteryOutline")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageWithRenderingMode:", 2));
    v7 = (UIImageView *)objc_msgSend(v4, "initWithImage:", v6);
    outlineView = v3->_outlineView;
    v3->_outlineView = v7;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_outlineView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[BatteryIconView addSubview:](v3, "addSubview:", v3->_outlineView);
    v9 = objc_alloc((Class)UIImageView);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("batteryFill")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "imageWithRenderingMode:", 2));
    v12 = (UIImageView *)objc_msgSend(v9, "initWithImage:", v11);
    levelView = v3->_levelView;
    v3->_levelView = v12;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_levelView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[BatteryIconView addSubview:](v3, "addSubview:", v3->_levelView);
    -[BatteryIconView _setupConstraints](v3, "_setupConstraints");
    -[BatteryIconView setLevel:](v3, "setLevel:", 0x7FFFFFFFFFFFFFFFLL);
  }
  return v3;
}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
  NSLayoutConstraint *v6;
  NSLayoutConstraint *fillWidthConstraint;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSLayoutConstraint *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView _maps_constraintsForCenteringInView:](self->_outlineView, "_maps_constraintsForCenteringInView:", self));
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_levelView, "widthAnchor"));
  v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToConstant:", 17.0));
  fillWidthConstraint = self->_fillWidthConstraint;
  self->_fillWidthConstraint = v6;

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](self->_levelView, "topAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](self->_outlineView, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", v17, 2.0));
  v19[0] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leftAnchor](self->_levelView, "leftAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leftAnchor](self->_outlineView, "leftAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, 2.0));
  v19[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](self->_outlineView, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](self->_levelView, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, 2.0));
  v15 = self->_fillWidthConstraint;
  v19[2] = v14;
  v19[3] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 4));
  objc_msgSend(v3, "addObjectsFromArray:", v16);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v3);
}

- (void)setLevel:(unint64_t)a3
{
  unint64_t v3;
  id v5;
  NSObject *v6;
  double v7;
  id v8;
  uint8_t buf[4];
  unint64_t v10;

  v3 = a3;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || a3 < 0x65)
  {
    if (self->_level != a3)
    {
      self->_level = a3;
      if (a3 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v7 = 17.0;
        v3 = 100;
      }
      else
      {
        v7 = fmax((double)a3 / 100.0 * 17.0, 4.0);
      }
      -[NSLayoutConstraint setConstant:](self->_fillWidthConstraint, "setConstant:", v7);
      v8 = (id)objc_claimAutoreleasedReturnValue(+[VehicleBatteryView colorForBatteryLevel:](VehicleBatteryView, "colorForBatteryLevel:", v3));
      -[UIImageView setTintColor:](self->_levelView, "setTintColor:", v8);
      -[UIImageView setTintColor:](self->_outlineView, "setTintColor:", v8);
      -[BatteryIconView setNeedsLayout](self, "setNeedsLayout");

    }
  }
  else
  {
    v5 = sub_1004326FC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "Tried to set %lu level on the battery view.", buf, 0xCu);
    }

  }
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 24.0;
  v3 = 11.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)batteryIconWithLevel:(unint64_t)a3
{
  BatteryIconView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  UIImage *ImageFromCurrentImageContext;
  void *v13;
  CGSize v15;

  v4 = -[BatteryIconView initWithFrame:]([BatteryIconView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[BatteryIconView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[BatteryIconView setLevel:](v4, "setLevel:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryIconView widthAnchor](v4, "widthAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToConstant:", 24.0));
  -[BatteryIconView addConstraint:](v4, "addConstraint:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryIconView heightAnchor](v4, "heightAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToConstant:", 11.0));
  -[BatteryIconView addConstraint:](v4, "addConstraint:", v8);

  -[BatteryIconView setNeedsLayout](v4, "setNeedsLayout");
  -[BatteryIconView layoutIfNeeded](v4, "layoutIfNeeded");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BatteryIconView traitCollection](v4, "traitCollection"));
  objc_msgSend(v9, "displayScale");
  v11 = v10;
  v15.width = 24.0;
  v15.height = 11.0;
  UIGraphicsBeginImageContextWithOptions(v15, 0, v11);

  -[BatteryIconView drawViewHierarchyInRect:afterScreenUpdates:](v4, "drawViewHierarchyInRect:afterScreenUpdates:", 1, 0.0, 0.0, 24.0, 11.0);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v13 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();

  return v13;
}

- (unint64_t)level
{
  return self->_level;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillWidthConstraint, 0);
  objc_storeStrong((id *)&self->_levelView, 0);
  objc_storeStrong((id *)&self->_outlineView, 0);
}

@end
