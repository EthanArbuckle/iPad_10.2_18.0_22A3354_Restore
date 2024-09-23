@implementation CRLImageToolbarButton

- (CRLImageToolbarButton)initWithFrame:(CGRect)a3
{
  CRLImageToolbarButton *v3;
  CRLImageToolbarButton *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  objc_super v11;
  _QWORD v12[2];

  v11.receiver = self;
  v11.super_class = (Class)CRLImageToolbarButton;
  v3 = -[CRLImageToolbarButton initWithFrame:](&v11, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CRLImageToolbarButton setExclusiveTouch:](v3, "setExclusiveTouch:", 1);
    -[CRLImageToolbarButton setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageToolbarButton imageView](v4, "imageView"));
    objc_msgSend(v5, "setContentMode:", 1);

    -[CRLImageToolbarButton setPointerStyleProvider:](v4, "setPointerStyleProvider:", &stru_10122E730);
    v12[0] = objc_opt_class(UITraitUserInterfaceIdiom, v6);
    v12[1] = objc_opt_class(UITraitVerticalSizeClass, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 2));
    v9 = -[CRLImageToolbarButton registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v8, "updateForCurrentTraitCollection");

  }
  return v4;
}

- (void)setTintAdjustmentMode:(int64_t)a3
{
  objc_super v3;

  if (a3 == 1)
    a3 = 0;
  v3.receiver = self;
  v3.super_class = (Class)CRLImageToolbarButton;
  -[CRLImageToolbarButton setTintAdjustmentMode:](&v3, "setTintAdjustmentMode:", a3);
}

- (void)setImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UIImage *v12;
  UIImage *image;
  void *v14;
  UIImage *v15;
  UIImage *landscapeImagePhone;

  v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122E750);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEA71C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122E770);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageToolbarButton setImage:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLImageToolbarButton.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 64, 0, "nil image is set");

  }
  if ((objc_msgSend(v4, "isSymbolImage") & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122E790);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEA69C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122E7B0);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageToolbarButton setImage:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLImageToolbarButton.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 65, 0, "Only vector images are supported");

  }
  if (objc_msgSend(v4, "isSymbolImage"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImageToolbarButton imageSymbolConfigurationWithScale:](CRLImageToolbarButton, "imageSymbolConfigurationWithScale:", 3));
    v12 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageWithConfiguration:", v11));

    image = self->_image;
    if (image != v12 && (-[UIImage isEqual:](image, "isEqual:", v12) & 1) == 0)
    {
      objc_storeStrong((id *)&self->_image, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImageToolbarButton imageSymbolConfigurationWithScale:](CRLImageToolbarButton, "imageSymbolConfigurationWithScale:", 2));
      v15 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageWithConfiguration:", v14));
      landscapeImagePhone = self->_landscapeImagePhone;
      self->_landscapeImagePhone = v15;

      -[CRLImageToolbarButton didChangeConfiguration](self, "didChangeConfiguration");
    }

  }
}

- (void)setImageNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v4));
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v4));
  v8 = v7;

  if ((objc_msgSend(v8, "isSymbolImage") & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122E7D0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEA79C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122E7F0);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageToolbarButton setImageNamed:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLImageToolbarButton.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 84, 0, "Only vector images are supported");

  }
  -[CRLImageToolbarButton setImage:](self, "setImage:", v8);

}

+ (id)imageSymbolConfigurationWithScale:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithScale:](UIImageSymbolConfiguration, "configurationWithScale:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithPreferredContentSizeCategory:](UITraitCollection, "traitCollectionWithPreferredContentSizeCategory:", UIContentSizeCategoryLarge));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "configurationWithTraitCollection:", v4));

  return v5;
}

- (void)setLandscapePhone:(BOOL)a3
{
  if (self->_landscapePhone != a3)
  {
    self->_landscapePhone = a3;
    -[CRLImageToolbarButton didChangeConfiguration](self, "didChangeConfiguration");
  }
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLImageToolbarButton;
  -[CRLImageToolbarButton didMoveToWindow](&v3, "didMoveToWindow");
  -[CRLImageToolbarButton updateForCurrentTraitCollection](self, "updateForCurrentTraitCollection");
}

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLImageToolbarButton;
  -[CRLImageToolbarButton didMoveToSuperview](&v3, "didMoveToSuperview");
  -[CRLImageToolbarButton updateForCurrentTraitCollection](self, "updateForCurrentTraitCollection");
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLImageToolbarButton;
  -[CRLImageToolbarButton tintColorDidChange](&v3, "tintColorDidChange");
  if (self->_onBackgroundView)
    -[CRLImageToolbarButton updateBackgroundViewColor](self, "updateBackgroundViewColor");
}

- (void)updateForCurrentTraitCollection
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLImageToolbarButton traitCollection](self, "traitCollection"));
  -[CRLImageToolbarButton updateForTraitCollection:](self, "updateForTraitCollection:", v3);

}

- (void)updateForTraitCollection:(id)a3
{
  _BOOL8 v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "userInterfaceIdiom"))
    v4 = 0;
  else
    v4 = objc_msgSend(v5, "verticalSizeClass") == (id)1;
  -[CRLImageToolbarButton setLandscapePhone:](self, "setLandscapePhone:", v4);

}

- (void)didChangeConfiguration
{
  UIImage *v3;
  double v4;
  UIImage *image;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  UIView *v24;
  UIView *onBackgroundView;
  void *v26;
  UIView *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  UIView *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double MaxY;
  double v46;
  UIImage *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  objc_super v59;
  objc_super v60;
  _QWORD v61[4];
  CGRect v62;
  CGRect v63;

  if (self->_landscapePhone)
  {
    v3 = self->_landscapeImagePhone;
    v4 = 32.0;
    if (v3)
      goto LABEL_16;
  }
  else
  {
    v4 = 44.0;
  }
  image = self->_image;
  if (!image)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122E810);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEA89C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122E830);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageToolbarButton didChangeConfiguration]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLImageToolbarButton.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 141, 0, "Don't have an image to use");

    image = self->_image;
  }
  v3 = image;
LABEL_16:
  -[UIImage size](v3, "size");
  v10 = v9;
  v12 = v11;
  v13 = v9 + 11.0 + 11.0;
  v14 = (v4 - v11) * 0.5;
  if (!self->_on)
    goto LABEL_29;
  if (!self->_landscapePhone)
    goto LABEL_52;
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10122E850);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DEA81C();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10122E870);
  v15 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageToolbarButton didChangeConfiguration]"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLImageToolbarButton.m"));

  if (self->_on)
  {
LABEL_52:
    if (self->_onBackgroundView)
      goto LABEL_32;
    +[UIPointerInteraction crl_toolbarRoundedRectWidth](UIPointerInteraction, "crl_toolbarRoundedRectWidth");
    v19 = v18;
    +[UIPointerInteraction crl_toolbarRoundedRectHeight](UIPointerInteraction, "crl_toolbarRoundedRectHeight");
    v21 = v20;
    +[UIPointerInteraction crl_toolbarRoundedRectCornerRadius](UIPointerInteraction, "crl_toolbarRoundedRectCornerRadius");
    v23 = v22;
    v24 = objc_opt_new(UIView);
    onBackgroundView = self->_onBackgroundView;
    self->_onBackgroundView = v24;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_onBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setUserInteractionEnabled:](self->_onBackgroundView, "setUserInteractionEnabled:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_onBackgroundView, "layer"));
    objc_msgSend(v26, "setCornerRadius:", v23);

    -[CRLImageToolbarButton updateBackgroundViewColor](self, "updateBackgroundViewColor");
    v27 = (UIView *)objc_claimAutoreleasedReturnValue(-[CRLImageToolbarButton imageView](self, "imageView"));
    -[CRLImageToolbarButton insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_onBackgroundView, v27);
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_onBackgroundView, "widthAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToConstant:", v19));
    v61[0] = v57;
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_onBackgroundView, "heightAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToConstant:", v21));
    v61[1] = v55;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_onBackgroundView, "centerXAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageToolbarButton centerXAnchor](self, "centerXAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, -0.5));
    v61[2] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_onBackgroundView, "centerYAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageToolbarButton centerYAnchor](self, "centerYAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, -0.5));
    v61[3] = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v61, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v34);

  }
  else
  {
LABEL_29:
    v35 = self->_onBackgroundView;
    if (!v35)
      goto LABEL_32;
    -[UIView removeFromSuperview](v35, "removeFromSuperview");
    v27 = self->_onBackgroundView;
    self->_onBackgroundView = 0;
  }

LABEL_32:
  +[UIScreen crl_screenScale](UIScreen, "crl_screenScale");
  v37 = v36;
  v38 = sub_10006309C(11.0, v36);
  v39 = sub_10006309C(v14, v37);
  -[CRLImageToolbarButton additionalLeftPaddingForImageFrame:](self, "additionalLeftPaddingForImageFrame:", v38, v39, v10, v12);
  v41 = v40;
  -[CRLImageToolbarButton additionalRightPaddingForImageFrame:](self, "additionalRightPaddingForImageFrame:", v38, v39, v10, v12);
  v43 = v13 + v41 + v42;
  v44 = v38 + v41;
  v62.origin.x = v44;
  v62.origin.y = v39;
  v62.size.width = v10;
  v62.size.height = v12;
  MaxY = CGRectGetMaxY(v62);
  v63.origin.x = v44;
  v63.origin.y = v39;
  v63.size.width = v10;
  v63.size.height = v12;
  v46 = v43 - CGRectGetMaxX(v63);
  if (self->_shouldRemoveTrailingPadding)
  {
    if (-[CRLImageToolbarButton effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"))
      v44 = v44 + -11.0;
    else
      v46 = v46 + -11.0;
  }
  v47 = (UIImage *)objc_claimAutoreleasedReturnValue(-[CRLImageToolbarButton imageForState:](self, "imageForState:", 0));

  if (v3 != v47)
  {
    v60.receiver = self;
    v60.super_class = (Class)CRLImageToolbarButton;
    -[CRLImageToolbarButton setImage:forState:](&v60, "setImage:forState:", v3, 0);
  }
  -[CRLImageToolbarButton crl_deprecatedContentEdgeInsets](self, "crl_deprecatedContentEdgeInsets");
  if (v44 != v51 || v39 != v48 || v46 != v50 || v4 - MaxY != v49)
  {
    v59.receiver = self;
    v59.super_class = (Class)CRLImageToolbarButton;
    -[CRLImageToolbarButton setContentEdgeInsets:](&v59, "setContentEdgeInsets:", v39, v44, v4 - MaxY, v46);
  }

}

- (void)updateBackgroundViewColor
{
  id v3;
  id v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLImageToolbarButton tintColor](self, "tintColor"));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "colorWithAlphaComponent:", 0.3)));
  v4 = objc_msgSend(v3, "CGColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_onBackgroundView, "layer"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  unsigned int v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  unsigned int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;

  v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3.top, a3.left, a3.bottom, a3.right);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10122E890);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v13 = v3;
    v14 = 2082;
    v15 = "-[CRLImageToolbarButton setContentEdgeInsets:]";
    v16 = 2082;
    v17 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLImageToolbarButton.m";
    v18 = 1024;
    v19 = 234;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10122E8B0);
  v5 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v6 = v5;
    v7 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v13 = v3;
    v14 = 2114;
    v15 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageToolbarButton setContentEdgeInsets:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLImageToolbarButton.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 234, 0, "Do not call method");

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLImageToolbarButton setContentEdgeInsets:]"));
  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v10, 0));

  objc_exception_throw(v11);
}

- (void)setOn:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->_on != a3)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10003B228;
    v3[3] = &unk_10122E8D8;
    v3[4] = self;
    v4 = a3;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v3);
  }
}

- (double)additionalLeftPaddingForImageFrame:(CGRect)a3
{
  return 0.0;
}

- (double)additionalRightPaddingForImageFrame:(CGRect)a3
{
  return 0.0;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double v6;
  double v7;
  double v8;
  CGPoint v10;
  CGRect v11;

  y = a3.y;
  x = a3.x;
  -[CRLImageToolbarButton bounds](self, "bounds", a4);
  v11.origin.x = v6 + -4.0;
  v11.origin.y = v7 + 0.0;
  v11.size.width = v8 + 8.0;
  v10.x = x;
  v10.y = y;
  return CGRectContainsPoint(v11, v10);
}

- (void)setShouldRemoveTrailingPadding:(BOOL)a3
{
  if (self->_shouldRemoveTrailingPadding != a3)
  {
    self->_shouldRemoveTrailingPadding = a3;
    -[CRLImageToolbarButton didChangeConfiguration](self, "didChangeConfiguration");
  }
}

- (BOOL)showsLargeContentViewer
{
  return 1;
}

- (UIImage)image
{
  return self->_image;
}

- (UIImage)landscapeImagePhone
{
  return self->_landscapeImagePhone;
}

- (BOOL)isLandscapePhone
{
  return self->_landscapePhone;
}

- (BOOL)isOn
{
  return self->_on;
}

- (BOOL)shouldRemoveTrailingPadding
{
  return self->_shouldRemoveTrailingPadding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_landscapeImagePhone, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_onBackgroundView, 0);
}

@end
