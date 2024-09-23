@implementation MapsUserLocationView

- (MapsUserLocationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  MapsUserLocationView *v4;
  MapsUserLocationView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MapsUserLocationView;
  v4 = -[UserLocationView initWithAnnotation:reuseIdentifier:](&v11, "initWithAnnotation:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[MapsUserLocationView _setCalloutStyle:](v4, "_setCalloutStyle:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, "vlfSessionDidStartNotification:", CFSTR("VLFSessionDidStartNotification"), 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v5, "vlfSessionTaskWillShowVLFUINotification:", CFSTR("VLFSessionTaskWillShowVLFUINotification"), 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v5, "vlfContaineeViewControllerWillShowFailureViewNotification:", off_1014BB960, 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v5, "vlfContaineeViewControllerWillHideFailureViewNotification:", off_1014BB968, 0);

  }
  return v5;
}

- (void)_mapVisibleCenteringRectChanged
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MapsUserLocationView;
  -[MapsUserLocationView _mapVisibleCenteringRectChanged](&v3, "_mapVisibleCenteringRectChanged");
  if (+[VLFSessionTask isVLFModeSupported](VLFSessionTask, "isVLFModeSupported"))
  {
    -[MapsUserLocationView checkIsWithinEdgeInsets](self, "checkIsWithinEdgeInsets");
    -[MapsUserLocationView adjustVLFUIVisibility](self, "adjustVLFUIVisibility");
  }
}

- (void)_updateFromMap
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MapsUserLocationView;
  -[MapsUserLocationView _updateFromMap](&v3, "_updateFromMap");
  if (+[VLFSessionTask isVLFModeSupported](VLFSessionTask, "isVLFModeSupported"))
  {
    -[MapsUserLocationView checkIsWithinEdgeInsets](self, "checkIsWithinEdgeInsets");
    -[MapsUserLocationView adjustVLFUIVisibility](self, "adjustVLFUIVisibility");
  }
}

- (void)updateStateFromLocation:(id)a3 duration:(double)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MapsUserLocationView;
  -[UserLocationView updateStateFromLocation:duration:](&v5, "updateStateFromLocation:duration:", a3, a4);
  if (+[VLFSessionTask isVLFModeSupported](VLFSessionTask, "isVLFModeSupported"))
  {
    -[MapsUserLocationView checkIsWithinEdgeInsets](self, "checkIsWithinEdgeInsets");
    -[MapsUserLocationView adjustVLFUIVisibility](self, "adjustVLFUIVisibility");
  }
}

- (void)checkIsWithinEdgeInsets
{
  VLFPuckModeCircleView *vlfPuckModeCircleView;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  uint64_t v53;
  void *v54;
  _BOOL4 v55;
  double v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat rect2;
  CGFloat v63;
  CGFloat v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;

  if (+[VLFSessionTask isVLFModeSupported](VLFSessionTask, "isVLFModeSupported"))
  {
    vlfPuckModeCircleView = self->_vlfPuckModeCircleView;
    -[VLFPuckModeCircleView bounds](vlfPuckModeCircleView, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView _mapView](self, "_mapView"));
    -[VLFPuckModeCircleView convertRect:toView:](vlfPuckModeCircleView, "convertRect:toView:", v12, v5, v7, v9, v11);
    v14 = v13;
    v63 = v16;
    v64 = v15;
    rect2 = v17;

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView _calloutView](self, "_calloutView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView _calloutView](self, "_calloutView"));
    objc_msgSend(v19, "bounds");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView _mapView](self, "_mapView"));
    objc_msgSend(v18, "convertRect:toView:", v28, v21, v23, v25, v27);
    v60 = v30;
    v61 = v29;
    v58 = v32;
    v59 = v31;

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView _mapView](self, "_mapView"));
    objc_msgSend(v33, "_edgeInsets");
    v35 = v34;

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView _mapView](self, "_mapView"));
    objc_msgSend(v36, "bounds");
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v44 = v43;

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView _mapView](self, "_mapView"));
    objc_msgSend(v45, "bounds");
    v56 = v46;
    v57 = v47;
    v49 = v48;
    v51 = v50;

    if (!self->_vlfPuckModeCircleView)
      goto LABEL_6;
    v67.origin.x = v14;
    v52 = v35 + 0.0;
    v65.origin.x = v38 + 0.0 + 22.0;
    v65.origin.y = v40 + 0.0;
    v65.size.width = v42 + -44.0;
    v65.size.height = v44 - v52 + -22.0;
    v67.size.width = v63;
    v67.origin.y = v64;
    v67.size.height = rect2;
    if (!CGRectContainsRect(v65, v67))
      goto LABEL_6;
    v53 = objc_claimAutoreleasedReturnValue(-[MapsUserLocationView _calloutView](self, "_calloutView"));
    if (v53)
    {
      v54 = (void *)v53;
      v66.origin.x = v56 + 0.0;
      v66.origin.y = v49 + 0.0;
      v66.size.height = v51 - v52 + -15.0;
      v66.size.width = v57;
      v68.size.height = v58;
      v68.origin.y = v60;
      v68.origin.x = v61;
      v68.size.width = v59;
      v55 = CGRectContainsRect(v66, v68);

      -[MapsUserLocationView setVlfOutsideEdgeInsets:](self, "setVlfOutsideEdgeInsets:", !v55);
    }
    else
    {
LABEL_6:
      -[MapsUserLocationView setVlfOutsideEdgeInsets:](self, "setVlfOutsideEdgeInsets:", 1);
    }
  }
}

- (void)_setMapPitchRadians:(double)a3
{
  void *v5;
  void *v6;
  CATransform3D v7;
  CATransform3D v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MapsUserLocationView;
  -[MapsUserLocationView _setMapPitchRadians:](&v9, "_setMapPitchRadians:");
  if (+[VLFSessionTask isVLFModeSupported](VLFSessionTask, "isVLFModeSupported"))
  {
    if (self->_vlfPuckModeCircleView)
    {
      +[CATransaction begin](CATransaction, "begin");
      +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
      CATransform3DMakeRotation(&v8, a3, 1.0, 0.0, 0.0);
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView backgroundView](self->_vlfPuckModeCircleView, "backgroundView"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));
      v7 = v8;
      objc_msgSend(v6, "setTransform:", &v7);

      +[CATransaction commit](CATransaction, "commit");
    }
  }
}

- (BOOL)updateCalloutViewIfNeededAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char isKindOfClass;
  id v11;
  NSObject *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  BOOL v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v21;
  NSObject *v22;
  objc_super v23;
  objc_super v24;
  objc_super v25;
  uint8_t buf[4];
  __CFString *v27;

  v3 = a3;
  v5 = -[MapsUserLocationView isSelected](self, "isSelected");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView annotation](self, "annotation"));
  if (!v6)
    goto LABEL_20;
  if ((_DWORD)v5 && !-[MapsUserLocationView isVLFPuckVisible](self, "isVLFPuckVisible"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v7, "captureUserAction:onTarget:eventValue:", 1034, 0, 0);

  }
  if (!-[MapsUserLocationView shouldShowVLFPuck](self, "shouldShowVLFPuck")
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView _calloutView](self, "_calloutView")),
        v9 = objc_opt_class(_MKBalloonCalloutView),
        isKindOfClass = objc_opt_isKindOfClass(v8, v9),
        v8,
        (isKindOfClass & 1) != 0))
  {
    v11 = sub_100A7D230();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = CFSTR("NO");
      if ((_DWORD)v5)
        v13 = CFSTR("YES");
      v14 = v13;
      *(_DWORD *)buf = 138412290;
      v27 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Updating regular callout for selected: %@", buf, 0xCu);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "annotation"));
    objc_msgSend(v15, "setSelected:", v5);
    v25.receiver = self;
    v25.super_class = (Class)MapsUserLocationView;
    v16 = -[MapsUserLocationView updateCalloutViewIfNeededAnimated:](&v25, "updateCalloutViewIfNeededAnimated:", v3);

    goto LABEL_21;
  }
  if (-[MapsUserLocationView shouldShowVLFBanner](self, "shouldShowVLFBanner")
    && !-[MapsUserLocationView isVLFBannerVisible](self, "isVLFBannerVisible")
    && ((v5 ^ 1) & 1) == 0)
  {
    v17 = sub_100A7D230();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Showing VLF banner", buf, 2u);
    }

    -[MapsUserLocationView _setCalloutStyle:](self, "_setCalloutStyle:", 2);
    v24.receiver = self;
    v24.super_class = (Class)MapsUserLocationView;
    v16 = -[MapsUserLocationView updateCalloutViewIfNeededAnimated:](&v24, "updateCalloutViewIfNeededAnimated:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView _calloutView](self, "_calloutView"));
    objc_msgSend(v19, "setHideTitle:", 1);
    objc_msgSend(v19, "_updateCalloutAnimated:", 0);
    objc_msgSend(v19, "_layoutSubviews:", 0);
    -[MapsUserLocationView _setCalloutStyle:](self, "_setCalloutStyle:", 1);

    goto LABEL_21;
  }
  if (-[MapsUserLocationView shouldShowVLFBanner](self, "shouldShowVLFBanner")
    || ((!-[MapsUserLocationView isVLFBannerVisible](self, "isVLFBannerVisible") | v5) & 1) != 0)
  {
LABEL_20:
    v16 = 0;
    goto LABEL_21;
  }
  v21 = sub_100A7D230();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Hiding VLF banner", buf, 2u);
  }

  v23.receiver = self;
  v23.super_class = (Class)MapsUserLocationView;
  v16 = -[MapsUserLocationView updateCalloutViewIfNeededAnimated:](&v23, "updateCalloutViewIfNeededAnimated:", v3);
LABEL_21:

  return v16;
}

- (unint64_t)_allowedCalloutEdges
{
  objc_super v4;

  if (-[MapsUserLocationView shouldShowVLFBanner](self, "shouldShowVLFBanner"))
    return 4;
  v4.receiver = self;
  v4.super_class = (Class)MapsUserLocationView;
  return -[MapsUserLocationView _allowedCalloutEdges](&v4, "_allowedCalloutEdges");
}

- (CGPoint)_bottomCalloutOffset
{
  double v3;
  double v4;
  objc_super v5;
  CGPoint result;

  if (-[MapsUserLocationView shouldShowVLFBanner](self, "shouldShowVLFBanner"))
  {
    v3 = 5.0;
    v4 = 0.0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MapsUserLocationView;
    -[MapsUserLocationView _bottomCalloutOffset](&v5, "_bottomCalloutOffset");
  }
  result.y = v3;
  result.x = v4;
  return result;
}

- (void)_setIsOnAnotherFloorInVenue:(BOOL)a3
{
  double v4;
  float v5;
  double v6;

  if (self->_isOnAnotherFloorInVenue != a3)
  {
    self->_isOnAnotherFloorInVenue = a3;
    if (a3)
      v4 = 0.300000012;
    else
      v4 = 1.0;
    if (a3)
      v5 = 249.0;
    else
      v5 = 1000.0;
    -[MapsUserLocationView setPuckAlpha:](self, "setPuckAlpha:", v4);
    -[MapsUserLocationView setAccuracyRingAlpha:](self, "setAccuracyRingAlpha:", v4);
    *(float *)&v6 = v5;
    -[MapsUserLocationView _setSelectionPriority:](self, "_setSelectionPriority:", v6);
  }
}

- (UIEdgeInsets)_annotationTrackingInsets
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  UIEdgeInsets result;

  if (-[MapsUserLocationView isVLFLocalizationInProgress](self, "isVLFLocalizationInProgress"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView _mapView](self, "_mapView"));
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView _mapView](self, "_mapView"));
    objc_msgSend(v8, "_edgeInsets");
    v11 = v5 - (v9 + v10);
    v14 = v7 - (v12 + v13);

    if (v11 >= v14)
      v15 = v14;
    else
      v15 = v11;
    v16 = v15 * 0.6;
    v17 = (v14 - v15 * 0.6) * 0.5;
    v18 = (v11 - v16) * 0.5;
    v19 = v17;
    v20 = v18;
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)MapsUserLocationView;
    -[MapsUserLocationView _annotationTrackingInsets](&v21, "_annotationTrackingInsets");
  }
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (CGRect)_significantBounds
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  CGRect result;

  if (-[MapsUserLocationView isVLFPuckVisible](self, "isVLFPuckVisible"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView vlfPuckModeCircleView](self, "vlfPuckModeCircleView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView vlfPuckModeCircleView](self, "vlfPuckModeCircleView"));
    objc_msgSend(v4, "bounds");
    objc_msgSend(v3, "convertRect:toView:", self);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)MapsUserLocationView;
    -[MapsUserLocationView _significantBounds](&v21, "_significantBounds");
    v6 = v13;
    v8 = v14;
    v10 = v15;
    v12 = v16;
  }
  v17 = v6;
  v18 = v8;
  v19 = v10;
  v20 = v12;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (float)_selectionPriority
{
  float result;
  objc_super v4;

  if (-[MapsUserLocationView isVLFPuckVisible](self, "isVLFPuckVisible"))
    return 1000.0;
  v4.receiver = self;
  v4.super_class = (Class)MapsUserLocationView;
  -[MapsUserLocationView _selectionPriority](&v4, "_selectionPriority");
  return result;
}

- (BOOL)_isSelectable
{
  objc_super v4;

  if (-[MapsUserLocationView isVLFPuckVisible](self, "isVLFPuckVisible"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)MapsUserLocationView;
  return -[MapsUserLocationView _isSelectable](&v4, "_isSelectable");
}

- (VLFPuckModeCircleView)vlfPuckModeCircleView
{
  VLFPuckModeCircleView *vlfPuckModeCircleView;
  VLFPuckModeCircleView *v4;
  VLFPuckModeCircleView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  CGFloat v16;
  void *v17;
  void *v18;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  char *v24;
  CATransform3D v25;
  CATransform3D v26;
  _QWORD v27[2];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  const char *v35;

  if (!+[VLFSessionTask isVLFModeSupported](VLFSessionTask, "isVLFModeSupported"))
  {
    v20 = sub_1004318FC();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v29 = "-[MapsUserLocationView vlfPuckModeCircleView]";
      v30 = 2080;
      v31 = "MapsUserLocationView.m";
      v32 = 1024;
      v33 = 271;
      v34 = 2080;
      v35 = "VLFSessionTask.isVLFModeSupported";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v22 = sub_1004318FC();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v29 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  vlfPuckModeCircleView = self->_vlfPuckModeCircleView;
  if (!vlfPuckModeCircleView)
  {
    v4 = -[VLFPuckModeCircleView initWithFrame:]([VLFPuckModeCircleView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_vlfPuckModeCircleView;
    self->_vlfPuckModeCircleView = v4;

    -[MapsUserLocationView addSubview:](self, "addSubview:", self->_vlfPuckModeCircleView);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView centerXAnchor](self->_vlfPuckModeCircleView, "centerXAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView centerXAnchor](self, "centerXAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
    v27[0] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView centerYAnchor](self->_vlfPuckModeCircleView, "centerYAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView centerYAnchor](self, "centerYAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
    v27[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

    objc_msgSend(*(id *)&self->super._MKUserLocationView_opaque[OBJC_IVAR____MKPuckAnnotationView__puckLayer], "zPosition");
    v14 = v13 + 1.0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView layer](self->_vlfPuckModeCircleView, "layer"));
    objc_msgSend(v15, "setZPosition:", v14);

    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    -[MapsUserLocationView _mapPitchRadians](self, "_mapPitchRadians");
    CATransform3DMakeRotation(&v26, v16, 1.0, 0.0, 0.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView backgroundView](self->_vlfPuckModeCircleView, "backgroundView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layer"));
    v25 = v26;
    objc_msgSend(v18, "setTransform:", &v25);

    +[CATransaction commit](CATransaction, "commit");
    vlfPuckModeCircleView = self->_vlfPuckModeCircleView;
  }
  return vlfPuckModeCircleView;
}

- (void)setVlfOverlappingFloatingControls:(BOOL)a3
{
  if (self->_vlfOverlappingFloatingControls != a3)
  {
    self->_vlfOverlappingFloatingControls = a3;
    -[MapsUserLocationView updateVlfCalloutAlpha](self, "updateVlfCalloutAlpha");
  }
}

- (void)setVlfOutsideEdgeInsets:(BOOL)a3
{
  if (self->_vlfOutsideEdgeInsets != a3)
  {
    self->_vlfOutsideEdgeInsets = a3;
    -[MapsUserLocationView updateVlfCalloutAlpha](self, "updateVlfCalloutAlpha");
  }
}

- (void)animateVLFPuckOnce
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView vlfPuckModeCircleView](self, "vlfPuckModeCircleView"));
  objc_msgSend(v2, "pulseOnce");

}

- (BOOL)isVLFPuckVisible
{
  unsigned int v3;

  v3 = -[VLFPuckModeCircleView isVisible](self->_vlfPuckModeCircleView, "isVisible");
  if (v3)
    LOBYTE(v3) = -[VLFPuckModeCircleView isHidden](self->_vlfPuckModeCircleView, "isHidden") ^ 1;
  return v3;
}

- (void)setVlfCalloutAlpha:(double)a3
{
  self->_vlfCalloutAlpha = a3;
  -[MapsUserLocationView updateVlfCalloutAlpha](self, "updateVlfCalloutAlpha");
}

- (void)updateVlfCalloutAlpha
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  unsigned __int8 v28;
  void *v29;
  id v30;
  NSObject *v31;
  uint8_t v32[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView _calloutView](self, "_calloutView"));
  v4 = objc_opt_class(MKStandardCalloutView);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
  {
    if (-[MapsUserLocationView isVLFOverlappingFloatingControls](self, "isVLFOverlappingFloatingControls")
      || -[MapsUserLocationView isVLFOutsideEdgeInsets](self, "isVLFOutsideEdgeInsets"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView _calloutView](self, "_calloutView"));
      objc_msgSend(v6, "setAlpha:", 0.0);

    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView _calloutView](self, "_calloutView"));
      objc_msgSend(v16, "alpha");
      v18 = v17;

      -[MapsUserLocationView vlfCalloutAlpha](self, "vlfCalloutAlpha");
      v20 = v19;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView _calloutView](self, "_calloutView"));
      objc_msgSend(v21, "setAlpha:", v20);

      if (fabs(v18) <= 2.22044605e-16)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView _calloutView](self, "_calloutView"));
        objc_msgSend(v22, "alpha");
        v24 = v23;

        if (v24 > 0.0)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView vlfSessionAnalyticsTracker](self, "vlfSessionAnalyticsTracker"));
          objc_msgSend(v25, "registerVLFCalloutWasShown");

        }
      }
      -[MapsUserLocationView vlfCalloutAlpha](self, "vlfCalloutAlpha");
      if (v26 > 0.0)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[VLFSessionUsageTracker sharedInstance](VLFSessionUsageTracker, "sharedInstance"));
        v28 = objc_msgSend(v27, "hasUserSeenVLFCallout");

        if ((v28 & 1) == 0)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[VLFSessionUsageTracker sharedInstance](VLFSessionUsageTracker, "sharedInstance"));
          objc_msgSend(v29, "registerUserWasShownCallout");

          v30 = sub_100A7D230();
          v31 = objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v32 = 0;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Detected that user was just shown the VLF callout for the first time; updating VLF UI visibility",
              v32,
              2u);
          }

          -[MapsUserLocationView adjustVLFUIVisibility](self, "adjustVLFUIVisibility");
        }
      }
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView _calloutView](self, "_calloutView"));
    objc_msgSend(v7, "alpha");
    v9 = v8;

    if (v9 <= 0.0)
    {
      -[VLFPuckModeCircleView stopPulsing](self->_vlfPuckModeCircleView, "stopPulsing");
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView vlfPuckModeCircleView](self, "vlfPuckModeCircleView"));
      objc_msgSend(v10, "startPulsing");

    }
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView _calloutView](self, "_calloutView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layer"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "animationKeys"));
    v14 = objc_msgSend(v13, "count");

    if (!v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView _calloutView](self, "_calloutView"));
      objc_msgSend(v15, "setAlpha:", 1.0);

      -[VLFPuckModeCircleView stopPulsing](self->_vlfPuckModeCircleView, "stopPulsing");
    }
  }
}

- (double)maxVLFCalloutWidth
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView _mapView](self, "_mapView"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView _mapView](self, "_mapView"));
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView _mapView](self, "_mapView"));
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;

  if (v5 >= v8)
    v14 = v13;
  else
    v14 = v11;

  result = v14 + -32.0;
  if (MKPopoverSmallCalloutDeviceIndependentMaxWidth < v14 + -32.0)
    return MKPopoverSmallCalloutDeviceIndependentMaxWidth;
  return result;
}

- (void)updateVLFCalloutWidth
{
  double v3;
  double v4;
  id v5;

  -[MapsUserLocationView maxVLFCalloutWidth](self, "maxVLFCalloutWidth");
  v4 = v3 + -27.0;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView vlfCalloutViewWidthConstraint](self, "vlfCalloutViewWidthConstraint"));
  objc_msgSend(v5, "setConstant:", v4);

}

- (BOOL)shouldShowVLFPuck
{
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  id v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  id v12;
  double v13;
  BOOL v14;
  double v15;
  double v16;
  __int16 v17;
  uint8_t v18[2];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("VLFSessionAlwaysShowPuckKey"));

  if (v4)
  {
    v5 = sub_100A7D230();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Debug key to always show the puck is enabled; should show VLF puck",
        buf,
        2u);
    }

    return 1;
  }
  if (!-[MapsUserLocationView vlfMode](self, "vlfMode"))
  {
    v12 = sub_100A7D230();
    v9 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v18 = 0;
      v10 = "VLF mode is .Off; should NOT show VLF puck";
      v11 = v18;
      goto LABEL_11;
    }
LABEL_12:

    return 0;
  }
  if (-[MapsUserLocationView isPedestrianARAvailable](self, "isPedestrianARAvailable"))
  {
    v8 = sub_100A7D230();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v17 = 0;
      v10 = "Pedestrian AR is available; should NOT show VLF puck";
      v11 = (uint8_t *)&v17;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, v10, v11, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  -[MapsUserLocationView locationAccuracy](self, "locationAccuracy");
  if (v13 >= GEOConfigGetDouble(MapKitConfig_UserLocation_MinAccuracyUncertainty[0], MapKitConfig_UserLocation_MinAccuracyUncertainty[1]))
  {
    -[MapsUserLocationView _locationAccuracyInScreenPoints](self, "_locationAccuracyInScreenPoints");
    v14 = v15 >= GEOConfigGetDouble(MapKitConfig_UserLocation_MinAccuracyRadius[0], MapKitConfig_UserLocation_MinAccuracyRadius[1]);
  }
  else
  {
    v14 = 0;
  }
  -[MapsUserLocationView _locationAccuracyInScreenPoints](self, "_locationAccuracyInScreenPoints");
  return v16 >= 44.0 && v14;
}

- (BOOL)isVLFBannerVisible
{
  void *v3;
  uint64_t v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView _calloutView](self, "_calloutView"));
  v4 = objc_opt_class(MKStandardCalloutView);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView _calloutView](self, "_calloutView"));
    v6 = objc_msgSend(v5, "isVisible");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)shouldShowVLFBanner
{
  if ((id)-[MapsUserLocationView vlfMode](self, "vlfMode") == (id)2
    && -[MapsUserLocationView shouldShowVLFPuck](self, "shouldShowVLFPuck")
    && !-[MapsUserLocationView isVLFLocalizationInProgress](self, "isVLFLocalizationInProgress"))
  {
    return GEOConfigGetBOOL(MapsConfig_VLFSessionActiveUIEnabled, off_1014B37D8);
  }
  else
  {
    return 0;
  }
}

- (void)adjustVLFUIVisibility
{
  void *v3;
  unsigned int v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (!-[MapsUserLocationView shouldShowVLFPuck](self, "shouldShowVLFPuck"))
  {
    -[VLFPuckModeCircleView hide](self->_vlfPuckModeCircleView, "hide");
    -[VLFPuckModeCircleView stopPulsing](self->_vlfPuckModeCircleView, "stopPulsing");
    if (!-[MapsUserLocationView isVLFBannerVisible](self, "isVLFBannerVisible"))
      goto LABEL_15;
LABEL_13:
    -[MapsUserLocationView deselectOrUpdateCalloutViewIfNeeded](self, "deselectOrUpdateCalloutViewIfNeeded");
    goto LABEL_15;
  }
  -[MapsUserLocationView setCanShowCallout:](self, "setCanShowCallout:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VLFSessionUsageTracker sharedInstance](VLFSessionUsageTracker, "sharedInstance"));
  v4 = objc_msgSend(v3, "hasUserSeenVLFCallout");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView vlfPuckModeCircleView](self, "vlfPuckModeCircleView"));
    v6 = objc_msgSend(v5, "isVisible");

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView vlfPuckModeCircleView](self, "vlfPuckModeCircleView"));
    objc_msgSend(v7, "show");

    if ((v6 & 1) == 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView vlfSessionAnalyticsTracker](self, "vlfSessionAnalyticsTracker"));
      objc_msgSend(v8, "registerVLFPuckWasShown");

      if (-[MapsUserLocationView isSelected](self, "isSelected"))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView _mapView](self, "_mapView"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView annotation](self, "annotation"));
        objc_msgSend(v9, "deselectAnnotation:animated:", v10, 1);

      }
    }
  }
  else
  {
    -[VLFPuckModeCircleView hide](self->_vlfPuckModeCircleView, "hide");
  }
  if (-[MapsUserLocationView shouldShowVLFBanner](self, "shouldShowVLFBanner")
    && !-[MapsUserLocationView isVLFBannerVisible](self, "isVLFBannerVisible"))
  {
    -[MapsUserLocationView selectOrUpdateCalloutViewIfNeeded](self, "selectOrUpdateCalloutViewIfNeeded");
    goto LABEL_15;
  }
  if (-[MapsUserLocationView isVLFBannerVisible](self, "isVLFBannerVisible")
    && !-[MapsUserLocationView shouldShowVLFBanner](self, "shouldShowVLFBanner"))
  {
    goto LABEL_13;
  }
LABEL_15:
  -[MapsUserLocationView updateVlfCalloutAlpha](self, "updateVlfCalloutAlpha");
  -[MapsUserLocationView updateVLFCalloutWidth](self, "updateVLFCalloutWidth");
}

- (void)selectOrUpdateCalloutViewIfNeeded
{
  if ((-[MapsUserLocationView isSelected](self, "isSelected") & 1) != 0)
    -[MapsUserLocationView updateCalloutViewIfNeededAnimated:](self, "updateCalloutViewIfNeededAnimated:", 0);
  else
    -[MapsUserLocationView setSelected:animated:](self, "setSelected:animated:", 1, 1);
}

- (void)deselectOrUpdateCalloutViewIfNeeded
{
  if (-[MapsUserLocationView isSelected](self, "isSelected"))
    -[MapsUserLocationView setSelected:animated:](self, "setSelected:animated:", 0, 1);
  else
    -[MapsUserLocationView updateCalloutViewIfNeededAnimated:](self, "updateCalloutViewIfNeededAnimated:", 0);
}

- (void)setVlfMode:(int64_t)a3
{
  id v4;
  NSObject *v5;
  int64_t vlfMode;
  int v7;
  int64_t v8;

  if (self->_vlfMode != a3)
  {
    self->_vlfMode = a3;
    v4 = sub_100A7D230();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      vlfMode = self->_vlfMode;
      v7 = 134217984;
      v8 = vlfMode;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Setting VLF Mode: %ld", (uint8_t *)&v7, 0xCu);
    }

    -[MapsUserLocationView checkIsWithinEdgeInsets](self, "checkIsWithinEdgeInsets");
    -[MapsUserLocationView adjustVLFUIVisibility](self, "adjustVLFUIVisibility");
  }
}

- (void)setIsPedestrianARAvailable:(BOOL)a3
{
  id v4;
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  int v8;
  __CFString *v9;

  if (self->_isPedestrianARAvailable != a3)
  {
    self->_isPedestrianARAvailable = a3;
    v4 = sub_100A7D230();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      if (self->_isPedestrianARAvailable)
        v6 = CFSTR("YES");
      else
        v6 = CFSTR("NO");
      v7 = v6;
      v8 = 138412290;
      v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Updating pedestrian AR availability: %@", (uint8_t *)&v8, 0xCu);

    }
    -[MapsUserLocationView checkIsWithinEdgeInsets](self, "checkIsWithinEdgeInsets");
    -[MapsUserLocationView adjustVLFUIVisibility](self, "adjustVLFUIVisibility");
  }
}

- (VLFCalloutView)vlfCalloutView
{
  VLFCalloutView *vlfCalloutView;
  VLFCalloutView *v4;
  VLFCalloutView *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *vlfCalloutViewWidthConstraint;
  void *v9;
  NSLayoutConstraint *v11;

  vlfCalloutView = self->_vlfCalloutView;
  if (!vlfCalloutView)
  {
    v4 = -[VLFCalloutView initWithFrame:]([VLFCalloutView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_vlfCalloutView;
    self->_vlfCalloutView = v4;

    -[VLFCalloutView setDelegate:](self->_vlfCalloutView, "setDelegate:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VLFCalloutView widthAnchor](self->_vlfCalloutView, "widthAnchor"));
    -[MapsUserLocationView maxVLFCalloutWidth](self, "maxVLFCalloutWidth");
    v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToConstant:"));
    vlfCalloutViewWidthConstraint = self->_vlfCalloutViewWidthConstraint;
    self->_vlfCalloutViewWidthConstraint = v7;

    v11 = self->_vlfCalloutViewWidthConstraint;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v9);

    vlfCalloutView = self->_vlfCalloutView;
  }
  return vlfCalloutView;
}

- (id)detailCalloutAccessoryView
{
  void *v3;
  id v4;
  objc_super v6;

  if ((id)-[MapsUserLocationView vlfMode](self, "vlfMode") == (id)2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView vlfCalloutView](self, "vlfCalloutView"));
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MapsUserLocationView;
    v4 = -[MapsUserLocationView detailCalloutAccessoryView](&v6, "detailCalloutAccessoryView");
    v3 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }
  return v3;
}

- (id)vlfSessionTask
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_keyMapsSceneDelegate](UIApplication, "_maps_keyMapsSceneDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "platformController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "auxiliaryTasksManager"));
  v5 = objc_msgSend(v4, "auxilaryTaskForClass:", objc_opt_class(VLFSessionTask));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)vlfSessionAnalyticsTracker
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView vlfSessionTask](self, "vlfSessionTask"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "analyticsTracker"));

  return v3;
}

- (void)calloutViewWasDismissed:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[VLFSessionUsageTracker sharedInstance](VLFSessionUsageTracker, "sharedInstance", a3));
  objc_msgSend(v3, "registerUserDismissedCallout");

}

- (void)vlfSessionDidStartNotification:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView vlfPuckModeCircleView](self, "vlfPuckModeCircleView", a3));
  objc_msgSend(v4, "setHidden:", 1);

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "vlfSessionDidStopNotification:", CFSTR("VLFSessionDidStopNotification"), 0);

}

- (void)vlfSessionDidStopNotification:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView vlfPuckModeCircleView](self, "vlfPuckModeCircleView", a3));
  objc_msgSend(v4, "setHidden:", 0);

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("VLFSessionDidStopNotification"), 0);

}

- (void)vlfSessionTaskWillShowVLFUINotification:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint8_t v12[16];

  if (-[MapsUserLocationView isVLFBannerVisible](self, "isVLFBannerVisible", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView _calloutView](self, "_calloutView"));
    objc_msgSend(v4, "alpha");
    v6 = v5;

    if (v6 > 0.0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[VLFSessionUsageTracker sharedInstance](VLFSessionUsageTracker, "sharedInstance"));
      objc_msgSend(v7, "registerUserTappedCallout");

    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[VLFSessionUsageTracker sharedInstance](VLFSessionUsageTracker, "sharedInstance"));
  objc_msgSend(v8, "registerUserEnteredVLF");

  -[MapsUserLocationView setVlfLocalizationInProgress:](self, "setVlfLocalizationInProgress:", 1);
  -[MapsUserLocationView setHeadingIndicatorStyle:](self, "setHeadingIndicatorStyle:", 2);
  v9 = sub_100A7D230();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "VLFSession started; setting heading indicator style to .VisualLocalizationScan",
      v12,
      2u);
  }

  -[MapsUserLocationView setEnabled:](self, "setEnabled:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v11, "addObserver:selector:name:object:", self, "vlfContaineeViewControllerDidDisappearNotification:", off_1014BB950, 0);

}

- (void)vlfContaineeViewControllerDidDisappearNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  int v13;
  id v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "removeObserver:name:object:", self, off_1014BB950, 0);

  -[MapsUserLocationView setVlfLocalizationInProgress:](self, "setVlfLocalizationInProgress:", 0);
  if (!-[MapsUserLocationView shouldShowVLFPuck](self, "shouldShowVLFPuck"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView vlfPuckModeCircleView](self, "vlfPuckModeCircleView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));
    objc_msgSend(v6, "removeAllAnimations");

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView vlfPuckModeCircleView](self, "vlfPuckModeCircleView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[VLFPuckModeCircleView layer](self->_vlfPuckModeCircleView, "layer"));
    objc_msgSend(v8, "opacity");
    objc_msgSend(v7, "hideWithDuration:startingOpacity:shouldShrink:suppressOtherAnimations:", 1, 0, 0.0, v9);

  }
  if (-[UserLocationView mode](self, "mode"))
    v10 = 0;
  else
    v10 = GEOConfigGetBOOL(MapKitConfig_NewPuckEnabled[0], MapKitConfig_NewPuckEnabled[1]) ^ 1;
  -[MapsUserLocationView setHeadingIndicatorStyle:](self, "setHeadingIndicatorStyle:", v10);
  v11 = sub_100A7D230();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = 134217984;
    v14 = -[MapsUserLocationView headingIndicatorStyle](self, "headingIndicatorStyle");
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "VLFSession stopped; resetting heading indicator style: %ld",
      (uint8_t *)&v13,
      0xCu);
  }

  -[MapsUserLocationView setEnabled:](self, "setEnabled:", 1);
}

- (void)vlfContaineeViewControllerWillShowFailureViewNotification:(id)a3
{
  void *v4;
  unsigned int v5;
  double v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[16];

  if (-[MapsUserLocationView shouldShowVLFPuck](self, "shouldShowVLFPuck", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("VLFSessionScanningAnimationSlowDownKey"));

    if (v5)
      v6 = 5.0;
    else
      v6 = 0.3;
    v9 = (id)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView vlfPuckModeCircleView](self, "vlfPuckModeCircleView"));
    objc_msgSend(v9, "showWithDuration:startingOpacity:shouldGrow:suppressOtherAnimations:", 0, 1, v6, 0.0);

  }
  else
  {
    v7 = sub_100A7D230();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "VLF failure UI was shown but we shouldn't be showing the VLF puck; ignoring",
        buf,
        2u);
    }

  }
}

- (void)vlfContaineeViewControllerWillHideFailureViewNotification:(id)a3
{
  void *v4;
  unsigned int v5;
  double v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[16];

  if (-[MapsUserLocationView shouldShowVLFPuck](self, "shouldShowVLFPuck", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("VLFSessionScanningAnimationSlowDownKey"));

    if (v5)
      v6 = 5.0;
    else
      v6 = 0.2;
    v9 = (id)objc_claimAutoreleasedReturnValue(-[MapsUserLocationView vlfPuckModeCircleView](self, "vlfPuckModeCircleView"));
    objc_msgSend(v9, "hideWithDuration:startingOpacity:shouldShrink:suppressOtherAnimations:", 0, 1, v6, 1.0);

  }
  else
  {
    v7 = sub_100A7D230();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "VLF failure UI was hidden but we shouldn't be showing the VLF puck; ignoring",
        buf,
        2u);
    }

  }
}

- (BOOL)isOnAnotherFloorInVenue
{
  return self->_isOnAnotherFloorInVenue;
}

- (int64_t)vlfMode
{
  return self->_vlfMode;
}

- (BOOL)isPedestrianARAvailable
{
  return self->_isPedestrianARAvailable;
}

- (void)setVlfPuckModeCircleView:(id)a3
{
  objc_storeStrong((id *)&self->_vlfPuckModeCircleView, a3);
}

- (BOOL)isVLFOverlappingFloatingControls
{
  return self->_vlfOverlappingFloatingControls;
}

- (BOOL)isVLFOutsideEdgeInsets
{
  return self->_vlfOutsideEdgeInsets;
}

- (double)vlfCalloutAlpha
{
  return self->_vlfCalloutAlpha;
}

- (BOOL)isVLFLocalizationInProgress
{
  return self->_vlfLocalizationInProgress;
}

- (void)setVlfLocalizationInProgress:(BOOL)a3
{
  self->_vlfLocalizationInProgress = a3;
}

- (void)setVlfCalloutView:(id)a3
{
  objc_storeStrong((id *)&self->_vlfCalloutView, a3);
}

- (NSLayoutConstraint)vlfCalloutViewWidthConstraint
{
  return self->_vlfCalloutViewWidthConstraint;
}

- (void)setVlfCalloutViewWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_vlfCalloutViewWidthConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vlfCalloutViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_vlfCalloutView, 0);
  objc_storeStrong((id *)&self->_vlfPuckModeCircleView, 0);
}

@end
