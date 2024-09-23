@implementation NavSpeedLimitView

- (NavSpeedLimitView)initWithFrame:(CGRect)a3
{
  NavSpeedLimitView *v3;
  NavSpeedLimitView *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  UIImageView *v8;
  UIImageView *imageView;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;
  _QWORD v26[4];

  v25.receiver = self;
  v25.super_class = (Class)NavSpeedLimitView;
  v3 = -[NavSpeedLimitView initWithFrame:](&v25, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (objc_class *)objc_opt_class(v3);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[NavSpeedLimitView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v7);

    -[NavSpeedLimitView setIsAccessibilityElement:](v4, "setIsAccessibilityElement:", 1);
    v8 = objc_opt_new(UIImageView);
    imageView = v4->_imageView;
    v4->_imageView = v8;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v4->_imageView, "setContentMode:", 4);
    -[UIImageView setIsAccessibilityElement:](v4->_imageView, "setIsAccessibilityElement:", 0);
    -[NavSpeedLimitView addSubview:](v4, "addSubview:", v4->_imageView);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavSpeedLimitView traitCollection](v4, "traitCollection"));
    v4->_useNightMode = objc_msgSend(v10, "userInterfaceStyle") == (id)2;

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v4->_imageView, "leadingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NavSpeedLimitView leadingAnchor](v4, "leadingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v23));
    v26[0] = v22;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](v4->_imageView, "trailingAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavSpeedLimitView trailingAnchor](v4, "trailingAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v11));
    v26[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](v4->_imageView, "topAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavSpeedLimitView topAnchor](v4, "topAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
    v26[2] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](v4->_imageView, "bottomAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavSpeedLimitView bottomAnchor](v4, "bottomAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
    v26[3] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);

  }
  return v4;
}

- (CGSize)intrinsicContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_intrinsicContentSize.width;
  height = self->_intrinsicContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  unint64_t speedLimit;
  unint64_t units;
  int64_t shieldType;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NavSpeedLimitView;
  -[NavSpeedLimitView traitCollectionDidChange:](&v8, "traitCollectionDidChange:", a3);
  speedLimit = self->_speedLimit;
  units = self->_units;
  shieldType = self->_shieldType;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavSpeedLimitView traitCollection](self, "traitCollection"));
  -[NavSpeedLimitView _setSpeedLimit:units:shieldType:useNightMode:](self, "_setSpeedLimit:units:shieldType:useNightMode:", speedLimit, units, shieldType, objc_msgSend(v7, "userInterfaceStyle") == (id)2);

}

- (void)setSpeedLimit:(unint64_t)a3 units:(unint64_t)a4 shieldType:(int64_t)a5
{
  -[NavSpeedLimitView _setSpeedLimit:units:shieldType:useNightMode:](self, "_setSpeedLimit:units:shieldType:useNightMode:", a3, a4, a5, self->_useNightMode);
}

- (BOOL)isVisible
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_imageView, "image"));
  v3 = v2 != 0;

  return v3;
}

- (void)_setSpeedLimit:(unint64_t)a3 units:(unint64_t)a4 shieldType:(int64_t)a5 useNightMode:(BOOL)a6
{
  _BOOL4 v6;
  id v11;
  NSObject *v12;
  unint64_t speedLimit;
  unint64_t units;
  int64_t shieldType;
  _BOOL4 useNightMode;
  int v17;
  unint64_t v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  int64_t v26;
  __int16 v27;
  int64_t v28;
  __int16 v29;
  _BOOL4 v30;
  __int16 v31;
  _BOOL4 v32;

  v6 = a6;
  if (*(_OWORD *)&self->_speedLimit != __PAIR128__(a4, a3) || self->_shieldType != a5 || self->_useNightMode != a6)
  {
    v11 = sub_100432E6C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      speedLimit = self->_speedLimit;
      units = self->_units;
      shieldType = self->_shieldType;
      useNightMode = self->_useNightMode;
      v17 = 134219776;
      v18 = speedLimit;
      v19 = 2048;
      v20 = a3;
      v21 = 2048;
      v22 = units;
      v23 = 2048;
      v24 = a4;
      v25 = 2048;
      v26 = shieldType;
      v27 = 2048;
      v28 = a5;
      v29 = 1024;
      v30 = useNightMode;
      v31 = 1024;
      v32 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Changing speedLimit from %lu to %lu, units from %lu to %lu, shieldType from %lld to %lld, useNightMode from %d to %d", (uint8_t *)&v17, 0x4Au);
    }

    self->_speedLimit = a3;
    self->_units = a4;
    self->_shieldType = a5;
    self->_useNightMode = v6;
    -[NavSpeedLimitView _drawSign](self, "_drawSign");
  }
}

- (void)_drawSign
{
  CGSize *p_intrinsicContentSize;
  double height;
  double width;
  id v6;
  NSObject *v7;
  int64_t shieldType;
  unint64_t speedLimit;
  _BOOL4 useNightMode;
  void *v11;
  unint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  UIImageView **p_imageView;
  id v25;
  NSObject *v26;
  int64_t v27;
  unint64_t v28;
  CGFloat v29;
  CGFloat v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  int v36;
  int64_t v37;
  __int16 v38;
  unint64_t v39;
  __int16 v40;
  _BOOL4 v41;

  p_intrinsicContentSize = &self->_intrinsicContentSize;
  width = self->_intrinsicContentSize.width;
  height = self->_intrinsicContentSize.height;
  if (self->_speedLimit && self->_shieldType)
  {
    v6 = sub_100432E6C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      shieldType = self->_shieldType;
      speedLimit = self->_speedLimit;
      useNightMode = self->_useNightMode;
      v36 = 134218496;
      v37 = shieldType;
      v38 = 2048;
      v39 = speedLimit;
      v40 = 1024;
      v41 = useNightMode;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Drawing speed limit sign; type: %ld, speed limit: %lu, night mode: %d",
        (uint8_t *)&v36,
        0x1Cu);
    }

    v11 = (void *)objc_opt_new(VKIconModifiers);
    if (qword_1014D2E10 != -1)
      dispatch_once(&qword_1014D2E10, &stru_1011C0088);
    v12 = self->_speedLimit;
    v13 = (id)qword_1014D2E08;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v12));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringFromNumber:", v14));

    objc_msgSend(v11, "setText:", v15);
    if (self->_useNightMode)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[VKIconManager sharedManager](VKIconManager, "sharedManager"));
      objc_msgSend(v11, "setVariant:", objc_msgSend(v16, "darkVariant"));

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavSpeedLimitView traitCollection](self, "traitCollection"));
    objc_msgSend(v17, "displayScale");
    v19 = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[VKIconManager sharedManager](VKIconManager, "sharedManager"));
    *(float *)&v21 = v19;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "imageForDataID:text:contentScale:sizeGroup:modifiers:", LODWORD(self->_shieldType), v15, 4, v11, v21));

    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", objc_msgSend(v22, "image"), 0, v19));
      p_imageView = &self->_imageView;
      -[UIImageView setImage:](self->_imageView, "setImage:", v23);

    }
    else
    {
      p_imageView = &self->_imageView;
      -[UIImageView setImage:](self->_imageView, "setImage:", 0);
    }
    -[UIImageView intrinsicContentSize](*p_imageView, "intrinsicContentSize");
    p_intrinsicContentSize->width = v29;
    p_intrinsicContentSize->height = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](*p_imageView, "image"));

    if (!v31)
    {
      v32 = sub_100432E6C();
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v36) = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Failed to get an image for the speed limit", (uint8_t *)&v36, 2u);
      }

    }
  }
  else
  {
    v25 = sub_100432E6C();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = self->_shieldType;
      v28 = self->_speedLimit;
      v36 = 134218240;
      v37 = v27;
      v38 = 2048;
      v39 = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Missing speed limit information; type: %ld, speed limit: %lu",
        (uint8_t *)&v36,
        0x16u);
    }

    -[UIImageView setImage:](self->_imageView, "setImage:", 0);
    *p_intrinsicContentSize = CGSizeZero;
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[NavSpeedLimitView _currentAccessibilityLabel](self, "_currentAccessibilityLabel"));
  -[NavSpeedLimitView setAccessibilityLabel:](self, "setAccessibilityLabel:", v34);

  if (width != p_intrinsicContentSize->width || height != p_intrinsicContentSize->height)
  {
    -[NavSpeedLimitView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[NavSpeedLimitView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)_currentAccessibilityLabel
{
  unint64_t units;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  if (self->_speedLimit)
  {
    units = self->_units;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = v4;
    if (units)
      v6 = CFSTR("[Navigation][VO] Speed limit description (kph)");
    else
      v6 = CFSTR("[Navigation][VO] Speed limit description (mph)");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, CFSTR("localized string not found"), 0));

    v8 = objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, self->_speedLimit));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("[Navigation][VO] Empty speed limit description"), CFSTR("localized string not found"), 0));
  }
  v9 = (void *)v8;

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
