@implementation CRLBadgeView_i

- (CRLBadgeView_i)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CRLBadgeView_i *v7;
  void *v8;
  UIImageView *v9;
  UIImageView *imageView;
  void *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)CRLBadgeView_i;
  v7 = -[CRLBadgeView_i initWithFrame:](&v13, "initWithFrame:");
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[CRLBadgeView_i setBackgroundColor:](v7, "setBackgroundColor:", v8);

    v9 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", x, y, width, height);
    imageView = v7->_imageView;
    v7->_imageView = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBadgeView_i imageView](v7, "imageView"));
    -[CRLBadgeView_i addSubview:](v7, "addSubview:", v11);

  }
  return v7;
}

- (void)setFinalImageWithName:(id)a3 legacyName:(id)a4
{
  -[CRLBadgeView_i setFinalImageWithName:legacyName:accessibilityName:scalesImageToFit:](self, "setFinalImageWithName:legacyName:accessibilityName:scalesImageToFit:", a3, a4, 0, 1);
}

- (void)setFinalImageWithName:(id)a3 legacyName:(id)a4 accessibilityName:(id)a5
{
  -[CRLBadgeView_i setFinalImageWithName:legacyName:accessibilityName:scalesImageToFit:](self, "setFinalImageWithName:legacyName:accessibilityName:scalesImageToFit:", a3, a4, a5, 1);
}

- (void)setFinalImageWithName:(id)a3 legacyName:(id)a4 accessibilityName:(id)a5 scalesImageToFit:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
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
  id v41;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!a6)
  {
    v13 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F6C8);
    v14 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E366DC(v13, v14);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F6E8);
    v15 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE81F0(v15, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBadgeView_i setFinalImageWithName:legacyName:accessibilityName:scalesImageToFit:]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/StatusHUDs/CRLBadgeView_i.m"));

  }
  v18 = objc_msgSend(v11, "copy");
  -[CRLBadgeView_i setLegacyImageName:](self, "setLegacyImageName:", v18);

  v19 = objc_msgSend(v10, "copy");
  -[CRLBadgeView_i setFinalImageName:](self, "setFinalImageName:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBadgeView_i finalImageName](self, "finalImageName"));
  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBadgeView_i finalImageName](self, "finalImageName"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v21));

    if (v22)
      goto LABEL_16;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBadgeView_i finalImageName](self, "finalImageName"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v23));
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "infoDictionary"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("CFBundleIcons")));
    v41 = v12;
    v26 = v11;
    v27 = v10;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("CFBundlePrimaryIcon")));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("CFBundleIconFiles")));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "lastObject"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v30));

    v10 = v27;
    v11 = v26;
    v12 = v41;

  }
LABEL_16:
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBadgeView_i imageView](self, "imageView"));
  objc_msgSend(v31, "setImage:", v22);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBadgeView_i imageView](self, "imageView"));
  objc_msgSend(v32, "setContentMode:", 4);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBadgeView_i finalImageName](self, "finalImageName"));
  if (v33)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBadgeView_i finalImageName](self, "finalImageName"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBadgeView_i tintColorForSystemImageNamed:](self, "tintColorForSystemImageNamed:", v34));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBadgeView_i imageView](self, "imageView"));
    objc_msgSend(v36, "setTintColor:", v35);

  }
  else
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBadgeView_i imageView](self, "imageView"));
    objc_msgSend(v37, "setContentMode:", 1);

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBadgeView_i imageView](self, "imageView"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "layer"));
    objc_msgSend(v39, "setCornerRadius:", 4.86);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBadgeView_i imageView](self, "imageView"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "layer"));
    objc_msgSend(v35, "setMasksToBounds:", 1);
  }

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBadgeView_i imageView](self, "imageView"));
  objc_msgSend(v40, "setAccessibilityLabel:", v12);

  -[CRLBadgeView_i setNeedsDisplay](self, "setNeedsDisplay");
}

- (id)tintColorForSystemImageNamed:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("exclamationmark.circle")))
  {
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("checkmark.circle")))
    {
      v5 = 0;
      goto LABEL_7;
    }
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
  }
  v5 = (void *)v4;
LABEL_7:

  return v5;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (NSString)legacyImageName
{
  return self->_legacyImageName;
}

- (void)setLegacyImageName:(id)a3
{
  objc_storeStrong((id *)&self->_legacyImageName, a3);
}

- (NSString)finalImageName
{
  return self->_finalImageName;
}

- (void)setFinalImageName:(id)a3
{
  objc_storeStrong((id *)&self->_finalImageName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalImageName, 0);
  objc_storeStrong((id *)&self->_legacyImageName, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
