@implementation StaleMapEffectView

- (StaleMapEffectView)initWithMapView:(id)a3 applyDimmingEffect:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  StaleMapEffectView *v8;
  StaleMapEffectView *v9;
  objc_super v11;

  v4 = a4;
  v7 = a3;
  objc_msgSend(v7, "bounds");
  v11.receiver = self;
  v11.super_class = (Class)StaleMapEffectView;
  v8 = -[StaleMapEffectView initWithFrame:](&v11, "initWithFrame:");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mapView, a3);
    -[StaleMapEffectView setAutoresizingMask:](v9, "setAutoresizingMask:", 18);
    -[StaleMapEffectView _updateImage](v9, "_updateImage");
    if (v4)
      -[StaleMapEffectView _addDimmingEffect](v9, "_addDimmingEffect");
  }

  return v9;
}

- (void)setAlpha:(double)a3
{
  double v5;
  objc_super v6;

  if (a3 > 0.0)
  {
    -[StaleMapEffectView alpha](self, "alpha");
    if (fabs(v5) <= 2.22044605e-16)
    {
      -[MKMapView _forceFrame](self->_mapView, "_forceFrame");
      -[StaleMapEffectView _updateImage](self, "_updateImage");
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)StaleMapEffectView;
  -[StaleMapEffectView setAlpha:](&v6, "setAlpha:", a3);
}

- (void)_updateImage
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[StaleMapEffectView _mapSnapshotImage](self, "_mapSnapshotImage"));
  -[StaleMapEffectView setImage:](self, "setImage:", v3);

}

- (id)_mapRepresentationImage:(id)a3
{
  id v4;
  MKMapView *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  MKMapView *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  MKMapView *v15;
  id v16;

  v4 = a3;
  v5 = self->_mapView;
  v6 = objc_alloc_init((Class)UIGraphicsImageRendererFormat);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v7, "scale");
  objc_msgSend(v6, "setScale:");

  objc_msgSend(v6, "setOpaque:", 1);
  objc_msgSend(v6, "setPreferredRange:", 2);
  v8 = objc_alloc((Class)UIGraphicsImageRenderer);
  -[MKMapView bounds](v5, "bounds");
  v9 = objc_msgSend(v8, "initWithBounds:format:", v6);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100A110B4;
  v14[3] = &unk_1011DF960;
  v15 = v5;
  v16 = v4;
  v10 = v5;
  v11 = v4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageWithActions:", v14));

  return v12;
}

- (id)_mapSnapshotImage
{
  return -[StaleMapEffectView _mapRepresentationImage:](self, "_mapRepresentationImage:", &stru_1011DF9A0);
}

- (void)_addDimmingEffect
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[StaleMapEffectView dimmingOverlayForView:](StaleMapEffectView, "dimmingOverlayForView:", self));
  -[StaleMapEffectView addSubview:](self, "addSubview:", v3);

}

+ (double)_dimmingAlphaForUserInterfaceStyle:(int64_t)a3
{
  _QWORD *v3;
  _QWORD *v4;

  if (a3 == 2)
    v3 = &MapsConfig_StaleMapEffectViewDimmingValueDarkMode;
  else
    v3 = &MapsConfig_StaleMapEffectViewDimmingValueLightMode;
  v4 = &off_1014B49C8;
  if (a3 != 2)
    v4 = &off_1014B49D8;
  return GEOConfigGetDouble(*v3, *v4);
}

+ (id)dimmingOverlayForView:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t Integer;
  id v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;

  v3 = a3;
  v4 = objc_alloc((Class)UIView);
  objc_msgSend(v3, "bounds");
  v5 = objc_msgSend(v4, "initWithFrame:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  objc_msgSend(v5, "setBackgroundColor:", v6);

  objc_msgSend(v5, "setAutoresizingMask:", 18);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "traitCollection"));
  +[StaleMapEffectView _dimmingAlphaForUserInterfaceStyle:](StaleMapEffectView, "_dimmingAlphaForUserInterfaceStyle:", objc_msgSend(v7, "userInterfaceStyle"));
  objc_msgSend(v5, "setAlpha:");

  Integer = GEOConfigGetInteger(MapsConfig_StaleMapEffectViewBlurEffectStyle, off_1014B4A58);
  v9 = objc_alloc((Class)UIVisualEffectView);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", Integer));
  v11 = objc_msgSend(v9, "initWithEffect:", v10);

  objc_msgSend(v11, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  objc_msgSend(v11, "setFrame:", v13, v15, v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentView"));
  objc_msgSend(v20, "addSubview:", v5);

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapView, 0);
}

@end
