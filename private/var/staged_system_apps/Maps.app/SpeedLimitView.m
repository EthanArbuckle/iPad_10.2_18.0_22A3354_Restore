@implementation SpeedLimitView

- (SpeedLimitView)initWithCoder:(id)a3
{
  SpeedLimitView *v3;
  SpeedLimitView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SpeedLimitView;
  v3 = -[SpeedLimitView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[SpeedLimitView _maps_commonInit](v3, "_maps_commonInit");
  return v4;
}

- (SpeedLimitView)initWithFrame:(CGRect)a3
{
  SpeedLimitView *v3;
  SpeedLimitView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SpeedLimitView;
  v3 = -[SpeedLimitView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[SpeedLimitView _maps_commonInit](v3, "_maps_commonInit");
  return v4;
}

- (void)_maps_commonInit
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
  _QWORD v21[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SpeedLimitView speedLimitImageView](self, "speedLimitImageView"));
  -[SpeedLimitView addSubview:](self, "addSubview:", v3);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SpeedLimitView speedLimitImageView](self, "speedLimitImageView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SpeedLimitView leadingAnchor](self, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v18));
  v21[0] = v17;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SpeedLimitView speedLimitImageView](self, "speedLimitImageView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SpeedLimitView trailingAnchor](self, "trailingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v14));
  v21[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SpeedLimitView speedLimitImageView](self, "speedLimitImageView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SpeedLimitView topAnchor](self, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
  v21[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SpeedLimitView speedLimitImageView](self, "speedLimitImageView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SpeedLimitView bottomAnchor](self, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
  v21[3] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

}

- (int64_t)shieldSize
{
  return 4;
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SpeedLimitView;
  -[SpeedLimitView didMoveToWindow](&v3, "didMoveToWindow");
  -[SpeedLimitView _updateShield](self, "_updateShield");
}

- (UIImageView)speedLimitImageView
{
  UIImageView *speedLimitImageView;
  UIImageView *v4;
  UIImageView *v5;
  double v6;
  double v7;

  speedLimitImageView = self->_speedLimitImageView;
  if (!speedLimitImageView)
  {
    v4 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    v5 = self->_speedLimitImageView;
    self->_speedLimitImageView = v4;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_speedLimitImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](self->_speedLimitImageView, "setContentMode:", 4);
    LODWORD(v6) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_speedLimitImageView, "setContentCompressionResistancePriority:forAxis:", 1, v6);
    LODWORD(v7) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](self->_speedLimitImageView, "setContentCompressionResistancePriority:forAxis:", 0, v7);
    speedLimitImageView = self->_speedLimitImageView;
  }
  return speedLimitImageView;
}

- (void)setSpeedLimit:(unint64_t)a3 shieldType:(int64_t)a4
{
  if (self->_speedLimit != a3 || self->_shieldType != a4)
  {
    self->_speedLimit = a3;
    self->_shieldType = a4;
    -[SpeedLimitView _updateShield](self, "_updateShield");
  }
}

- (void)setUseNightMode:(BOOL)a3
{
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (self->_useNightMode != a3)
  {
    self->_useNightMode = a3;
    v4 = -[SpeedLimitView useNightMode](self, "useNightMode");
    v5 = 5;
    if (v4)
      v5 = 4;
    v6 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___SpeedLimitView__speedLimitImageView[v5]);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SpeedLimitView speedLimitImageView](self, "speedLimitImageView"));
    objc_msgSend(v7, "setImage:", v6);

    v8 = (id)objc_claimAutoreleasedReturnValue(-[SpeedLimitView speedLimitImageView](self, "speedLimitImageView"));
    objc_msgSend(v8, "sizeToFit");

  }
}

- (BOOL)hasContent
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SpeedLimitView speedLimitImageView](self, "speedLimitImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "image"));
  v4 = v3 != 0;

  return v4;
}

- (void)_updateShield
{
  NSObject *v3;
  void *v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  int64_t v9;
  int64_t v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  int64_t v16;
  double v17;
  void *v18;
  id v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  UIImage *speedLimitImage;
  UIImage *dimmedSpeedLimitImage;
  void *v26;
  id v27;
  unint64_t v28;
  int64_t v29;
  void *v30;
  id v31;
  double v32;
  void *v33;
  UIImage **p_dimmedSpeedLimitImage;
  UIImage *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  unint64_t v44;
  int64_t v45;
  void *v46;
  void *v47;
  uint8_t buf[4];
  unint64_t v49;
  __int16 v50;
  unint64_t v51;
  __int16 v52;
  int64_t v53;
  __int16 v54;
  void *v55;

  if (-[SpeedLimitView speedLimit](self, "speedLimit") && -[SpeedLimitView shieldType](self, "shieldType"))
  {
    v3 = objc_claimAutoreleasedReturnValue(-[SpeedLimitView _stringWithSpeedLimit:](self, "_stringWithSpeedLimit:", -[SpeedLimitView speedLimit](self, "speedLimit")));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SpeedLimitView _screen](self, "_screen"));
    objc_msgSend(v4, "scale");
    v6 = v5;

    v7 = objc_alloc_init((Class)VKIconModifiers);
    objc_msgSend(v7, "setText:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[VKIconManager sharedManager](VKIconManager, "sharedManager"));
    v9 = -[SpeedLimitView shieldType](self, "shieldType");
    v10 = -[SpeedLimitView shieldSize](self, "shieldSize");
    *(float *)&v11 = v6;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageForDataID:text:contentScale:sizeGroup:modifiers:", v9, v3, v10, v7, v11));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[VKIconManager sharedManager](VKIconManager, "sharedManager"));
    objc_msgSend(v7, "setVariant:", objc_msgSend(v13, "darkVariant"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[VKIconManager sharedManager](VKIconManager, "sharedManager"));
    v15 = -[SpeedLimitView shieldType](self, "shieldType");
    v16 = -[SpeedLimitView shieldSize](self, "shieldSize");
    *(float *)&v17 = v6;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageForDataID:text:contentScale:sizeGroup:modifiers:", v15, v3, v16, v7, v17));

    if (v12)
    {
      v19 = objc_msgSend(v12, "image");
      -[SpeedLimitView dynamicScale](self, "dynamicScale");
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v19, 0, v6 / v20));
    }
    else
    {
      v21 = 0;
    }
    objc_storeStrong((id *)&self->_speedLimitImage, v21);
    if (v12)

    if (v18)
    {
      v31 = objc_msgSend(v18, "image");
      -[SpeedLimitView dynamicScale](self, "dynamicScale");
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v31, 0, v6 / v32));
    }
    else
    {
      v33 = 0;
    }
    objc_storeStrong((id *)&self->_dimmedSpeedLimitImage, v33);
    if (v18)

    if (-[SpeedLimitView useNightMode](self, "useNightMode"))
      p_dimmedSpeedLimitImage = &self->_dimmedSpeedLimitImage;
    else
      p_dimmedSpeedLimitImage = &self->_speedLimitImage;
    v35 = *p_dimmedSpeedLimitImage;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[SpeedLimitView speedLimitImageView](self, "speedLimitImageView"));
    objc_msgSend(v36, "setImage:", v35);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[SpeedLimitView speedLimitImageView](self, "speedLimitImageView"));
    objc_msgSend(v37, "sizeToFit");

    v38 = sub_100432E6C();
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[SpeedLimitView speedLimitImageView](self, "speedLimitImageView"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "image"));
      v41 = v18;
      v42 = v7;
      v43 = v12;
      v44 = -[SpeedLimitView speedLimit](self, "speedLimit");
      v45 = -[SpeedLimitView shieldType](self, "shieldType");
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[SpeedLimitView window](self, "window"));
      *(_DWORD *)buf = 138544130;
      v49 = (unint64_t)v40;
      v50 = 2048;
      v51 = v44;
      v12 = v43;
      v7 = v42;
      v18 = v41;
      v52 = 2048;
      v53 = v45;
      v54 = 2114;
      v55 = v46;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Got image %{public}@ for speed limit %lu, shield type %lld, in window %{public}@", buf, 0x2Au);

    }
LABEL_22:

    goto LABEL_23;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SpeedLimitView speedLimitImageView](self, "speedLimitImageView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "image"));

  if (v23)
  {
    speedLimitImage = self->_speedLimitImage;
    self->_speedLimitImage = 0;

    dimmedSpeedLimitImage = self->_dimmedSpeedLimitImage;
    self->_dimmedSpeedLimitImage = 0;

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[SpeedLimitView speedLimitImageView](self, "speedLimitImageView"));
    objc_msgSend(v26, "setImage:", 0);

    v27 = sub_100432E6C();
    v3 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v28 = -[SpeedLimitView speedLimit](self, "speedLimit");
      v29 = -[SpeedLimitView shieldType](self, "shieldType");
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[SpeedLimitView window](self, "window"));
      *(_DWORD *)buf = 134218498;
      v49 = v28;
      v50 = 2048;
      v51 = v29;
      v52 = 2114;
      v53 = (int64_t)v30;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Removing speed limit %lu, shield type %lld, in window %{public}@", buf, 0x20u);

    }
    goto LABEL_22;
  }
LABEL_23:
  -[SpeedLimitView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (double)dynamicScale
{
  return 1.0;
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SpeedLimitView speedLimitImageView](self, "speedLimitImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "image"));
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (id)_stringWithSpeedLimit:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (qword_1014D2E90 != -1)
    dispatch_once(&qword_1014D2E90, &stru_1011C06B0);
  v4 = (void *)qword_1014D2E88;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringFromNumber:", v5));

  return v6;
}

- (BOOL)useNightMode
{
  return self->_useNightMode;
}

- (unint64_t)speedLimit
{
  return self->_speedLimit;
}

- (void)setSpeedLimit:(unint64_t)a3
{
  self->_speedLimit = a3;
}

- (int64_t)shieldType
{
  return self->_shieldType;
}

- (void)setShieldType:(int64_t)a3
{
  self->_shieldType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speedLimitImageView, 0);
  objc_storeStrong((id *)&self->_dimmedSpeedLimitImage, 0);
  objc_storeStrong((id *)&self->_speedLimitImage, 0);
}

@end
