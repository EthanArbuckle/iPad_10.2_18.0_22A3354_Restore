@implementation RAPNotificationDetailsMapCell

+ (id)identifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(a1);
  return NSStringFromClass(v2);
}

- (RAPNotificationDetailsMapCell)initWithFrame:(CGRect)a3
{
  RAPNotificationDetailsMapCell *v3;
  RAPNotificationDetailsMapCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RAPNotificationDetailsMapCell;
  v3 = -[RAPNotificationDetailsMapCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[RAPNotificationDetailsMapCell _commonInit](v3, "_commonInit");
  return v4;
}

- (RAPNotificationDetailsMapCell)initWithCoder:(id)a3
{
  RAPNotificationDetailsMapCell *v3;
  RAPNotificationDetailsMapCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RAPNotificationDetailsMapCell;
  v3 = -[RAPNotificationDetailsMapCell initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[RAPNotificationDetailsMapCell _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  -[RAPNotificationDetailsMapCell _setupViews](self, "_setupViews");
  -[RAPNotificationDetailsMapCell _setupConstraints](self, "_setupConstraints");
}

- (void)_setupViews
{
  void *v3;
  id v4;
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
  id v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tableCellGroupedBackgroundColor](UIColor, "tableCellGroupedBackgroundColor"));
  -[RAPNotificationDetailsMapCell setBackgroundColor:](self, "setBackgroundColor:", v3);

  v4 = objc_msgSend(objc_alloc((Class)MKMapView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[RAPNotificationDetailsMapCell setMapView:](self, "setMapView:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsMapCell mapView](self, "mapView"));
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsMapCell mapView](self, "mapView"));
  objc_msgSend(v6, "setUserInteractionEnabled:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsMapCell mapView](self, "mapView"));
  objc_msgSend(v7, "setDelegate:", self);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsMapCell mapView](self, "mapView"));
  objc_msgSend(v8, "setShowsUserLocation:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsMapCell mapView](self, "mapView"));
  objc_msgSend(v9, "setCompassEnabled:", 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsMapCell mapView](self, "mapView"));
  objc_msgSend(v10, "setShowsAttribution:", 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsMapCell mapView](self, "mapView"));
  objc_msgSend(v11, "setClipsToBounds:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsMapCell mapView](self, "mapView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layer"));
  objc_msgSend(v13, "setCornerRadius:", 6.0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsMapCell mapView](self, "mapView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layer"));
  objc_msgSend(v15, "setCornerCurve:", kCACornerCurveContinuous);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsMapCell mapView](self, "mapView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "layer"));
  objc_msgSend(v17, "setMaskedCorners:", 12);

  v19 = (id)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsMapCell contentView](self, "contentView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsMapCell mapView](self, "mapView"));
  objc_msgSend(v19, "addSubview:", v18);

}

- (void)_setupConstraints
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsMapCell mapView](self, "mapView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "topAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsMapCell contentView](self, "contentView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v23));
  v27[0] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsMapCell mapView](self, "mapView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsMapCell contentView](self, "contentView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:", v18, 4.0));
  v27[1] = v17;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsMapCell mapView](self, "mapView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsMapCell contentView](self, "contentView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v13, -4.0));
  v27[2] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsMapCell mapView](self, "mapView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsMapCell contentView](self, "contentView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:constant:", v7, -4.0));
  v27[3] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsMapCell mapView](self, "mapView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "heightAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToConstant:", 194.0));
  v27[4] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 5));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)setViewModel:(id)a3
{
  _TtC4Maps31RAPNotificationDetailsViewModel *v5;
  _TtC4Maps31RAPNotificationDetailsViewModel *v6;

  v5 = (_TtC4Maps31RAPNotificationDetailsViewModel *)a3;
  if (self->_viewModel != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[RAPNotificationDetailsMapCell _updateMapView](self, "_updateMapView");
    v5 = v6;
  }

}

- (BOOL)_showsSingleMarker
{
  void *v3;
  BOOL v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsMapCell viewModel](self, "viewModel"));
  if (objc_msgSend(v3, "displayStyle") == (id)2)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsMapCell viewModel](self, "viewModel"));
    v4 = objc_msgSend(v5, "displayStyle") == (id)4;

  }
  return v4;
}

- (void)_updateMapView
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  BOOL v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  void *i;
  uint64_t v46;
  RAPAnnotation *v47;
  RAPAnnotation *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  double v56;
  CLLocationDegrees v57;
  void *v58;
  CLLocationDegrees v59;
  CLLocationCoordinate2D v60;
  id v61;
  void *v62;
  RAPAnnotation *v63;
  void *v64;
  void *v65;
  MKMapPoint v66;
  double x;
  double y;
  double width;
  double height;
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  CLLocationCoordinate2D v77;
  MKMapRect v78;
  MKMapRect v79;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsMapCell viewModel](self, "viewModel"));
  v4 = objc_msgSend(v3, "mapType");
  if (v4 > 4)
    v5 = 0;
  else
    v5 = qword_100E3F088[v4];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsMapCell mapView](self, "mapView"));
  objc_msgSend(v6, "setMapType:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsMapCell viewModel](self, "viewModel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapRegion"));

  objc_msgSend(v8, "southLat");
  v10 = v9;
  objc_msgSend(v8, "northLat");
  if (v10 == v12)
  {
    objc_msgSend(v8, "westLng");
    v14 = v13;
    objc_msgSend(v8, "eastLng");
    if (v14 == v15)
    {
      objc_msgSend(v8, "southLat");
      v17 = v16;
      objc_msgSend(v8, "westLng");
      v19 = MKMapRectMakeWithRadialDistance(v17, v18, 200.0);
      v23 = objc_msgSend(objc_alloc((Class)GEOMapRegion), "initWithMapRect:", v19, v20, v21, v22);

      v8 = v23;
    }
  }
  v26 = GEOMapRectForMapRegion(v8, v11);
  v28 = v27;
  v29 = v24;
  v30 = v25;
  v31 = v27 == MKMapRectNull.origin.y && v26 == MKMapRectNull.origin.x;
  v32 = 0.0;
  if (!v31 && v24 != 0.0 && v25 != 0.0)
  {
    if (-[RAPNotificationDetailsMapCell _showsSingleMarker](self, "_showsSingleMarker"))
      v32 = 48.5;
    else
      v32 = 0.0;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsMapCell mapView](self, "mapView"));
    objc_msgSend(v33, "setVisibleMapRect:edgePadding:animated:", 0, v26, v28, v29, v30, v32, 0.0, 0.0, 0.0);

  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsMapCell mapView](self, "mapView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsMapCell mapView](self, "mapView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "annotations"));
  objc_msgSend(v34, "removeAnnotations:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsMapCell viewModel](self, "viewModel"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "mapItems"));

  LODWORD(v36) = -[RAPNotificationDetailsMapCell _showsSingleMarker](self, "_showsSingleMarker");
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsMapCell viewModel](self, "viewModel"));
  v40 = objc_msgSend(v39, "displayStyle");

  if ((_DWORD)v36)
  {
    if (v40 == (id)2)
    {
      v41 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "firstObject"));
      if (!v41)
        goto LABEL_34;
      goto LABEL_32;
    }
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsMapCell viewModel](self, "viewModel"));
    v51 = objc_msgSend(v50, "displayStyle");

    if (v51 == (id)4)
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsMapCell viewModel](self, "viewModel"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "updatedLabel"));

      v54 = objc_alloc((Class)MKPlacemark);
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "center"));
      objc_msgSend(v55, "lat");
      v57 = v56;
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "center"));
      objc_msgSend(v58, "lng");
      v60 = CLLocationCoordinate2DMake(v57, v59);
      v61 = objc_msgSend(v54, "initWithCoordinate:addressDictionary:", 0, v60.latitude, v60.longitude);

      v41 = objc_msgSend(objc_alloc((Class)MKMapItem), "initWithPlacemark:", v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "localizedText"));
      objc_msgSend(v41, "setName:", v62);

      if (v41)
      {
LABEL_32:
        v63 = -[RAPAnnotation initWithMapItem:]([RAPAnnotation alloc], "initWithMapItem:", v41);
        v64 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsMapCell mapView](self, "mapView"));
        objc_msgSend(v64, "addAnnotation:", v63);

        v65 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsMapCell mapView](self, "mapView"));
        objc_msgSend(v65, "selectAnnotation:animated:", v63, 0);

        -[RAPAnnotation coordinate](v63, "coordinate");
        v66 = MKMapPointForCoordinate(v77);
        v78.origin.x = v26;
        v78.origin.y = v28;
        v78.size.width = v29;
        v78.size.height = v30;
        v79 = MKMapRectOffset(v78, v66.x - (v26 + v29 * 0.5), v66.y - (v28 + v30 * 0.5));
        x = v79.origin.x;
        y = v79.origin.y;
        width = v79.size.width;
        height = v79.size.height;
        v71 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsMapCell mapView](self, "mapView"));
        objc_msgSend(v71, "setVisibleMapRect:edgePadding:animated:", 0, x, y, width, height, v32, 0.0, 0.0, 0.0);

LABEL_33:
      }
    }
  }
  else if (v40 == (id)5)
  {
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v41 = v38;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v73;
      do
      {
        for (i = 0; i != v43; i = (char *)i + 1)
        {
          if (*(_QWORD *)v73 != v44)
            objc_enumerationMutation(v41);
          v46 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)i);
          v47 = [RAPAnnotation alloc];
          v48 = -[RAPAnnotation initWithMapItem:](v47, "initWithMapItem:", v46, (_QWORD)v72);
          v49 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDetailsMapCell mapView](self, "mapView"));
          objc_msgSend(v49, "addAnnotation:", v48);

        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
      }
      while (v43);
    }
    goto LABEL_33;
  }
LABEL_34:

}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableAnnotationViewWithIdentifier:", CFSTR("RAPNotificationMarker")));
  if (!v6)
    v6 = objc_msgSend(objc_alloc((Class)MKMarkerAnnotationView), "initWithAnnotation:reuseIdentifier:", v5, CFSTR("RAPNotificationMarker"));
  objc_msgSend(v6, "setDraggable:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "styleAttributes"));
  if (!v7)
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes RAPLocationStyleAttributes](GEOFeatureStyleAttributes, "RAPLocationStyleAttributes"));
  objc_msgSend(v6, "_setStyleAttributes:", v7);
  objc_msgSend(v6, "setAnnotation:", v5);

  return v6;
}

- (_TtC4Maps31RAPNotificationDetailsViewModel)viewModel
{
  return self->_viewModel;
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
  objc_storeStrong((id *)&self->_mapView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end
