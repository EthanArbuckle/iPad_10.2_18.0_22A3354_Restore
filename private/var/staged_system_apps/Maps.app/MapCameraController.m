@implementation MapCameraController

- (MapCameraController)initWithMapView:(id)a3
{
  id v4;
  MapCameraController *v5;
  MapCameraController *v6;
  uint64_t v7;
  NSHashTable *observers;
  MapCameraController *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MapCameraController;
  v5 = -[MapCameraController init](&v11, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_mapView, v4);
    v7 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v7;

    v9 = v6;
  }

  return v6;
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)frameRoutes:(id)a3 includeCompassInset:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6
{
  -[MapCameraController frameRoutes:includeCompassInset:waypoints:animated:completion:](self, "frameRoutes:includeCompassInset:waypoints:animated:completion:", a3, a4, 1, a5, a6);
}

- (void)frameRoutes:(id)a3 includeCompassInset:(BOOL)a4 waypoints:(BOOL)a5 animated:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  void (**v12)(id, uint64_t);
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
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  double v44;
  __int16 v45;
  uint64_t v46;

  v7 = a6;
  v8 = a5;
  v9 = a4;
  v12 = (void (**)(id, uint64_t))a7;
  -[MapCameraController _mapRectForRoutes:includeCompassInset:waypoints:](self, "_mapRectForRoutes:includeCompassInset:waypoints:", a3, v9, v8);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[MapCameraController _maximumEdgeToEdgeDistanceBetweenCurrentAndTargetMapRect:](self, "_maximumEdgeToEdgeDistanceBetweenCurrentAndTargetMapRect:");
  v22 = v21;
  if (v21 <= 10.0)
  {
    v23 = sub_100583560();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%.1f, %.1f}"), *(_QWORD *)&v14, *(_QWORD *)&v16));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%.1f, %.1f}"), *(_QWORD *)&v18, *(_QWORD *)&v20));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%@, %@}"), v25, v26));

      v28 = v27;
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
      objc_msgSend(v29, "visibleMapRect");
      v31 = v30;
      v33 = v32;
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%.1f, %.1f}"), v34, v35));
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%.1f, %.1f}"), v31, v33));
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%@, %@}"), v36, v37));

      *(_DWORD *)buf = 138413058;
      v40 = v27;
      v41 = 2112;
      v42 = v38;
      v43 = 2048;
      v44 = v22;
      v45 = 2048;
      v46 = 0x4024000000000000;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "not framing routes, target map rect %@ not different enough from current map rect %@ (%#.1lf <= %#.1lf)", buf, 0x2Au);

    }
    if (v12)
      v12[2](v12, 1);
  }
  else
  {
    -[MapCameraController frameMapRect:animated:completion:](self, "frameMapRect:animated:completion:", v7, v12, v14, v16, v18, v20);
  }

}

- (void)frameApproximateRouteFromStartPOIShape:(id)a3 toEndPOIShapes:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void (**v12)(id, uint64_t);
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  id v31;
  uint64_t v32;
  double v33;
  double v34;
  void *v35;
  id v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  id v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  NSObject *v52;
  double v53;
  double v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  double v60;
  __int16 v61;
  uint64_t v62;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, uint64_t))a6;
  if (v10 || objc_msgSend(v11, "count"))
  {
    -[MapCameraController mapRectApproximatingRouteFromStartPOIShape:toEndPOIShapes:](self, "mapRectApproximatingRouteFromStartPOIShape:toEndPOIShapes:", v10, v11);
    v14 = v13;
    v53 = v13;
    v54 = v15;
    v17 = v16;
    v18 = v15;
    v20 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
    objc_msgSend(v21, "visibleMapRect");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
    v31 = objc_msgSend(v30, "_zoomLevelForMapRect:includeAccessoryPadding:", 0, v14, v17, v18, v20);
    v34 = MKZoomScaleForZoomLevelF(v31, v32, v33);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
    v36 = objc_msgSend(v35, "_zoomLevelForMapRect:includeAccessoryPadding:", 0, v23, v25, v27, v29);
    v39 = MKZoomScaleForZoomLevelF(v36, v37, v38);

    if (v34 <= v39)
      v40 = v39;
    else
      v40 = v34;
    v41 = fmax(fmax(fmax(vabdd_f64(v53, v23), vabdd_f64(v17, v25)), vabdd_f64(v53 + v54, v23 + v27)), vabdd_f64(v17 + v20, v25 + v29))* v40;
    if (v41 <= 20.0)
    {
      v42 = sub_100583560();
      v43 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%.1f, %.1f}"), *(_QWORD *)&v53, *(_QWORD *)&v17));
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%.1f, %.1f}"), *(_QWORD *)&v54, *(_QWORD *)&v20));
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%@, %@}"), v44, v45));

        v47 = v46;
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%.1f, %.1f}"), *(_QWORD *)&v23, *(_QWORD *)&v25));
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%.1f, %.1f}"), *(_QWORD *)&v27, *(_QWORD *)&v29));
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%@, %@}"), v48, v49));

        *(_DWORD *)buf = 138413058;
        v56 = v46;
        v57 = 2112;
        v58 = v50;
        v59 = 2048;
        v60 = v41;
        v61 = 2048;
        v62 = 0x4034000000000000;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "not framing approx route, target map rect %@ not different enough from current map rect %@ (%#.1lf <= %#.1lf)", buf, 0x2Au);

      }
      if (v12)
        v12[2](v12, 1);
    }
    else
    {
      -[MapCameraController frameMapRect:animated:completion:](self, "frameMapRect:animated:completion:", v7, v12, v53);
    }
  }
  else
  {
    v51 = sub_100583560();
    v52 = objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "not framing approx route, no POI shapes provided", buf, 2u);
    }

  }
}

- ($C79183323B9A0D5602617FF3BE5395AC)mapRectForTripFromLocation:(id)a3 alongRoute:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  $C79183323B9A0D5602617FF3BE5395AC result;

  -[MapCameraController _mapRectFromLocation:alongRoute:](self, "_mapRectFromLocation:alongRoute:", a3, a4);
  result.var1.var1 = v7;
  result.var1.var0 = v6;
  result.var0.var1 = v5;
  result.var0.var0 = v4;
  return result;
}

- (void)frameMapItem:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;

  v5 = a4;
  v8 = a5;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "_displayMapRegion"));
  -[MapCameraController displayMapRegion:animated:completion:](self, "displayMapRegion:animated:completion:", v9, v5, v8);

}

- (void)frameLabelMarker:(id)a3 edgeInsets:(UIEdgeInsets)a4 minZoom:(id)a5 maxZoom:(id)a6 completion:(id)a7
{
  double right;
  double bottom;
  double left;
  double top;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v21 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "featureAnnotation"));
  if (objc_msgSend(v18, "conformsToProtocol:", &OBJC_PROTOCOL___CustomPOIAnnotation))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "searchResult"));
    if (v19 && -[MapCameraController searchResultIsVenueOrBuilding:](self, "searchResultIsVenueOrBuilding:", v19))
    {
      -[MapCameraController _frameSearchResult:minZoom:maxZoom:completion:](self, "_frameSearchResult:minZoom:maxZoom:completion:", v19, v15, v16, v17);

      goto LABEL_12;
    }

  }
  if (!objc_msgSend(v21, "isVenueButton")
    || !-[MapCameraController _frameVenueLabelMarker:completion:](self, "_frameVenueLabelMarker:completion:", v21, v17))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "mapRegion"));

    if (v20)
    {
      if (objc_msgSend(v21, "isVisible"))
        -[MapCameraController _frameVisibleLabelMarker:edgeInsets:completion:](self, "_frameVisibleLabelMarker:edgeInsets:completion:", v21, v17, top, left, bottom, right);
      else
        -[MapCameraController _frameNotVisibleLabelMarker:edgeInsets:completion:](self, "_frameNotVisibleLabelMarker:edgeInsets:completion:", v21, v17, top, left, bottom, right);
    }
  }
LABEL_12:

}

- (void)_frameVisibleLabelMarker:(id)a3 edgeInsets:(UIEdgeInsets)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double latitude;
  double longitude;
  double latitudeDelta;
  double longitudeDelta;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  void *v32;
  void *v33;
  double v34;
  double x;
  double v36;
  double y;
  double v38;
  double width;
  double v40;
  double height;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  void *i;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  double v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  double v70;
  double v71;
  double v72;
  void *v76;
  double v77;
  double v78;
  double v79;
  CGFloat v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double MinX;
  CGFloat v86;
  double v87;
  double v88;
  CGFloat v89;
  CGFloat v90;
  CGFloat v91;
  double MaxX;
  double v93;
  double MinY;
  double v95;
  double vertical;
  double MaxY;
  double v98;
  void *v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  void *v106;
  void *v107;
  double v108;
  double v109;
  double v110;
  double v111;
  void *v112;
  void *v113;
  double v114;
  double v115;
  void *v116;
  unint64_t v117;
  unint64_t v118;
  unint64_t v119;
  unint64_t v120;
  __n128 v121;
  __n128 v122;
  __n128 v123;
  __n128 v124;
  double v125;
  double v126;
  double v127;
  double v128;
  id v129;
  void *v130;
  void *v131;
  double v132;
  double v133;
  CGFloat left;
  double v135;
  double top;
  double horizontal;
  double right;
  CGFloat v139;
  double rect;
  CGFloat recta;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  _BYTE v146[128];
  MKMapRect v147;
  MKCoordinateRegion v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;
  CGRect v166;
  CGRect v167;
  CGRect v168;
  CGRect v169;
  CGRect v170;
  CGRect v171;

  right = a4.right;
  rect = a4.bottom;
  left = a4.left;
  top = a4.top;
  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapRegion"));
  v11 = GEOMapRectForMapRegion(v9, v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
  v147.origin.x = v11;
  v147.origin.y = v13;
  v147.size.width = v15;
  v147.size.height = v17;
  v148 = MKCoordinateRegionForMapRect(v147);
  latitude = v148.center.latitude;
  longitude = v148.center.longitude;
  latitudeDelta = v148.span.latitudeDelta;
  longitudeDelta = v148.span.longitudeDelta;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
  objc_msgSend(v18, "convertRegion:toRectToView:", v23, latitude, longitude, latitudeDelta, longitudeDelta);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "viewForAnnotation:", v7));

  if (v33)
  {
    objc_msgSend(v33, "bounds");
    x = v34;
    y = v36;
    width = v38;
    height = v40;
    v142 = 0u;
    v143 = 0u;
    v144 = 0u;
    v145 = 0u;
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "subviews"));
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v142, v146, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v143;
      do
      {
        for (i = 0; i != v44; i = (char *)i + 1)
        {
          if (*(_QWORD *)v143 != v45)
            objc_enumerationMutation(v42);
          objc_msgSend(*(id *)(*((_QWORD *)&v142 + 1) + 8 * (_QWORD)i), "frame", *(_QWORD *)&left);
          v170.origin.x = v47;
          v170.origin.y = v48;
          v170.size.width = v49;
          v170.size.height = v50;
          v149.origin.x = v25;
          v149.origin.y = v27;
          v149.size.width = v29;
          v149.size.height = v31;
          v150 = CGRectUnion(v149, v170);
        }
        x = v150.origin.x;
        y = v150.origin.y;
        width = v150.size.width;
        height = v150.size.height;
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v142, v146, 16);
      }
      while (v44);
    }

    if (width != CGSizeZero.width || height != CGSizeZero.height)
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
      objc_msgSend(v52, "convertRect:fromView:", v33, x, y, width, height);
      v25 = v53;
      v27 = v54;
      v29 = v55;
      v31 = v56;

    }
  }
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView", *(_QWORD *)&left));
  objc_msgSend(v7, "screenCollisionBounds");
  objc_msgSend(v57, "convertRect:fromView:", 0);
  v59 = v58;
  v61 = v60;
  v63 = v62;
  v65 = v64;

  v151.origin.x = v25;
  v151.origin.y = v27;
  v151.size.width = v29;
  v151.size.height = v31;
  v171.origin.x = v59;
  v171.origin.y = v61;
  v171.size.width = v63;
  v171.size.height = v65;
  v152 = CGRectUnion(v151, v171);
  v153 = CGRectInset(v152, -5.0, -5.0);
  v66 = v153.origin.x;
  v67 = v153.origin.y;
  v68 = v153.size.width;
  v69 = v153.size.height;
  v70 = fabs(v153.origin.y);
  v71 = fabs(v153.size.width);
  v72 = fabs(v153.size.height);
  if (fabs(v153.origin.x) != INFINITY && v70 != INFINITY && v71 != INFINITY && v72 != INFINITY)
  {
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView", INFINITY, v70, v71, v72));
    objc_msgSend(v76, "bounds");
    v78 = v135 + v77;
    v80 = top + v79;
    v82 = v81 - (v135 + right);
    v84 = v83 - (top + rect);

    v154.origin.x = v66;
    v154.origin.y = v67;
    v154.size.width = v68;
    v139 = v69;
    v154.size.height = v69;
    MinX = CGRectGetMinX(v154);
    v155.origin.x = v78;
    recta = v80;
    v155.origin.y = v80;
    v86 = v82;
    v155.size.width = v82;
    v155.size.height = v84;
    if (MinX >= CGRectGetMinX(v155))
    {
      v158.origin.x = v66;
      v158.origin.y = v67;
      v158.size.width = v68;
      v158.size.height = v139;
      MaxX = CGRectGetMaxX(v158);
      v159.origin.x = v78;
      v159.origin.y = recta;
      v159.size.width = v82;
      v159.size.height = v84;
      v90 = v78;
      if (MaxX <= CGRectGetMaxX(v159))
      {
        horizontal = UIOffsetZero.horizontal;
        v91 = v68;
        v89 = v139;
      }
      else
      {
        v160.origin.x = v66;
        v160.origin.y = v67;
        v160.size.width = v68;
        v91 = v68;
        v89 = v139;
        v160.size.height = v139;
        v93 = CGRectGetMaxX(v160);
        v161.origin.x = v90;
        v161.origin.y = recta;
        v161.size.width = v86;
        v161.size.height = v84;
        horizontal = v93 - CGRectGetMaxX(v161);
      }
    }
    else
    {
      v156.origin.x = v78;
      v156.origin.y = recta;
      v156.size.width = v82;
      v156.size.height = v84;
      v87 = CGRectGetMinX(v156);
      v157.origin.x = v66;
      v157.origin.y = v67;
      v157.size.width = v68;
      v88 = v68;
      v89 = v139;
      v157.size.height = v139;
      horizontal = -(v87 - CGRectGetMinX(v157));
      v90 = v78;
      v91 = v88;
    }
    v162.origin.x = v66;
    v162.origin.y = v67;
    v162.size.width = v91;
    v162.size.height = v89;
    MinY = CGRectGetMinY(v162);
    v163.origin.x = v90;
    v163.origin.y = recta;
    v163.size.width = v86;
    v163.size.height = v84;
    if (MinY >= CGRectGetMinY(v163))
    {
      v166.origin.x = v66;
      v166.origin.y = v67;
      v166.size.width = v91;
      v166.size.height = v89;
      MaxY = CGRectGetMaxY(v166);
      v167.origin.x = v90;
      v167.origin.y = recta;
      v167.size.width = v86;
      v167.size.height = v84;
      if (MaxY <= CGRectGetMaxY(v167))
      {
        vertical = UIOffsetZero.vertical;
      }
      else
      {
        v168.origin.x = v66;
        v168.origin.y = v67;
        v168.size.width = v91;
        v168.size.height = v89;
        v98 = CGRectGetMaxY(v168);
        v169.origin.x = v90;
        v169.origin.y = recta;
        v169.size.width = v86;
        v169.size.height = v84;
        vertical = v98 - CGRectGetMaxY(v169);
      }
    }
    else
    {
      v164.origin.x = v90;
      v164.origin.y = recta;
      v164.size.width = v86;
      v164.size.height = v84;
      v95 = CGRectGetMinY(v164);
      v165.origin.x = v66;
      v165.origin.y = v67;
      v165.size.width = v91;
      v165.size.height = v89;
      vertical = -(v95 - CGRectGetMinY(v165));
    }
    v99 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
    objc_msgSend(v99, "centerCoordinate");
    v101 = v100;
    v103 = v102;

    if (horizontal > 0.0 || vertical > 0.0)
    {
      v106 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
      v107 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
      objc_msgSend(v106, "convertCoordinate:toPointToView:", v107, v101, v103);
      v109 = v108;
      v111 = v110;

      v112 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
      v113 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
      objc_msgSend(v112, "convertPoint:toCoordinateFromView:", v113, horizontal + v109, vertical + v111);
      v104 = v114;
      v105 = v115;

    }
    else
    {
      v104 = v101;
      v105 = v103;
    }
    if (v104 != v101 || v105 != v103)
    {
      v116 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
      objc_msgSend(v116, "region");
      v118 = v117;
      v120 = v119;

      v121.n128_f64[0] = v104;
      v122.n128_f64[0] = v105;
      v123.n128_u64[0] = v118;
      v124.n128_u64[0] = v120;
      v125 = MKMapRectForCoordinateRegion(v121, v122, v123, v124);
      v129 = objc_msgSend(objc_alloc((Class)GEOMapRegion), "initWithMapRect:", v125, v126, v127, v128);
      v130 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
      v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "_mapLayer"));
      objc_msgSend(v131, "durationToAnimateToMapRegion:", v129);
      v133 = v132;

      -[MapCameraController _setCenterCoordinate:duration:completion:](self, "_setCenterCoordinate:duration:completion:", v8, v104, v105, v133);
    }
  }

}

- (void)_frameNotVisibleLabelMarker:(id)a3 edgeInsets:(UIEdgeInsets)a4 completion:(id)a5
{
  double right;
  double bottom;
  double left;
  double top;
  void (**v11)(id, uint64_t);
  double v12;
  CLLocationDegrees v13;
  CLLocationDegrees v14;
  CLLocationCoordinate2D v15;
  id v16;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v16 = a3;
  v11 = (void (**)(id, uint64_t))a5;
  if (-[MapCameraController _mapViewFitsLabelMarker:withEdgeInsets:](self, "_mapViewFitsLabelMarker:withEdgeInsets:", v16, top, left, bottom, right))
  {
    if (v11)
      v11[2](v11, 1);
  }
  else
  {
    objc_msgSend(v16, "coordinate");
    v13 = v12;
    objc_msgSend(v16, "coordinate");
    v15 = CLLocationCoordinate2DMake(v13, v14);
    -[MapCameraController _setCenterCoordinate:duration:completion:](self, "_setCenterCoordinate:duration:completion:", v11, v15.latitude, v15.longitude, 0.25);
  }

}

- (BOOL)_frameVenueLabelMarker:(id)a3 completion:(id)a4
{
  unsigned int v5;
  void *v6;
  double v7;
  double v8;
  CLLocationCoordinate2D v9;
  float v11;
  CLLocationDegrees v12;
  CLLocationDegrees v13;

  v12 = 0.0;
  v13 = 0.0;
  v11 = 0.0;
  v5 = objc_msgSend(a3, "positionOfInterest:zoom:", &v12, &v11);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
    objc_msgSend(v6, "_mapKitZoomLevelForVectorKitTileZoomLevel:", v11);
    v8 = v7;

    v9 = CLLocationCoordinate2DMake(v12, v13);
    -[MapCameraController _setCenterCoordinate:zoomLevel:animated:](self, "_setCenterCoordinate:zoomLevel:animated:", 1, v9.latitude, v9.longitude, v8);
  }
  return v5;
}

- (void)displayMapRegion:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  uint64_t v8;
  void (**v9)(id, _QWORD);
  id v10;

  v6 = a4;
  v10 = a3;
  v9 = (void (**)(id, _QWORD))a5;
  if (v10)
  {
    -[MapCameraController frameMapRect:animated:completion:](self, "frameMapRect:animated:completion:", v6, v9, GEOMapRectForMapRegion(v10, v8));
  }
  else if (v9)
  {
    v9[2](v9, 0);
  }

}

- (void)displayTransitRoute:(id)a3 boardingStopCoord:(id)a4 boardingStopIndex:(unint64_t)a5 animated:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v8;
  void (**v12)(id, _QWORD);
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  id v56;

  v8 = a6;
  v56 = a3;
  v12 = (void (**)(id, _QWORD))a7;
  if (v56)
  {
    v13 = GEOMapPoint3DForCoordinate(objc_msgSend(v56, "pointAt:", objc_msgSend(v56, "routeCoordinateAtDistance:beforeRouteCoordinate:", a4, 500.0)));
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "stops"));
    v17 = objc_msgSend(v16, "count");

    if ((unint64_t)v17 <= a5)
    {
      v19 = v13;
      v18 = v15;
    }
    else
    {
      v18 = v15;
      v19 = v13;
      v20 = v56;
      do
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stops"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", a5));

        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "latLng"));
        v24 = v23;
        if (v23)
        {
          objc_msgSend(v23, "lat");
          v25 = GEOMapPoint3DForCoordinate(objc_msgSend(v24, "lng"));
          if (v19 >= v25)
            v19 = v25;
          if (v13 <= v25)
            v13 = v25;
          if (v18 >= v26)
            v18 = v26;
          if (v15 <= v26)
            v15 = v26;
        }

        ++a5;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "stops"));
        v28 = objc_msgSend(v27, "count");

        v20 = v56;
      }
      while (a5 < (unint64_t)v28);
    }
    v29 = objc_msgSend(objc_alloc((Class)GEOMapRegion), "initWithMapRect:", v19, v18, v13 - v19, v15 - v18);
    UIEdgeInsetsMakeWithEdges(15, v30, 10.0);
    -[MapCameraController _insetsByAddingCompassPaddingToInsets:](self, "_insetsByAddingCompassPaddingToInsets:");
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v40 = GEOMapRectForMapRegion(v29, v39);
    v42 = v41;
    v44 = v43;
    v46 = v45;
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
    objc_msgSend(v47, "mapRectThatFits:edgePadding:", v40, v42, v44, v46, v32, v34, v36, v38);
    v49 = v48;
    v51 = v50;
    v53 = v52;
    v55 = v54;

    -[MapCameraController frameMapRect:animated:completion:](self, "frameMapRect:animated:completion:", v8, v12, v49, v51, v53, v55);
  }
  else if (v12)
  {
    v12[2](v12, 0);
  }

}

- (void)frameSearchResults:(id)a3 withResultToSelect:(id)a4 historyItem:(id)a5 suggestedMapRegion:(id)a6 minZoom:(id)a7 maxZoom:(id)a8 disableAdditionalViewportPadding:(BOOL)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _BOOL8 v21;
  id WeakRetained;
  uint64_t v23;
  id v24;

  v24 = a3;
  v16 = a10;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
  objc_msgSend(v20, "setUserTrackingMode:", 0);

  -[MapCameraController _notifyObserversWillChangeVisibleRect](self, "_notifyObserversWillChangeVisibleRect");
  if (a4)
    v21 = 1;
  else
    v21 = (unint64_t)objc_msgSend(v24, "count") > 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
  LOBYTE(v23) = a9;
  objc_msgSend(WeakRetained, "goToSearchResults:mapRegion:requireMapMovement:setCameraFromMapItemViewportFrame:animation:minZoom:maxZoom:disableAdditionalViewportPadding:completion:", v24, v19, v21, a5 == 0, 0, v18, v17, v23, v16);

}

- (void)_frameSearchResult:(id)a3 minZoom:(id)a4 maxZoom:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id WeakRetained;
  void *v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v10 = a6;
  if (a3)
  {
    v11 = a5;
    v12 = a4;
    v13 = a3;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
    objc_msgSend(v14, "setUserTrackingMode:", 0);

    -[MapCameraController _notifyObserversWillChangeVisibleRect](self, "_notifyObserversWillChangeVisibleRect");
    WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
    v20 = v13;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100584920;
    v18[3] = &unk_1011BBC38;
    v19 = v10;
    LOBYTE(v17) = 0;
    objc_msgSend(WeakRetained, "goToSearchResults:mapRegion:requireMapMovement:animation:minZoom:maxZoom:disableAdditionalViewportPadding:completion:", v16, 0, 1, 0, v12, v11, v17, v18);

  }
}

- (BOOL)searchResultIsVenueOrBuilding:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "mapItem"));
  if (objc_msgSend(v3, "_hasVenueFeatureType"))
    v4 = objc_msgSend(v3, "_venueFeatureType") == (id)1 || objc_msgSend(v3, "_venueFeatureType") == (id)2;
  else
    v4 = 0;

  return v4;
}

- (void)restoreRegionForMapSelectionForLabelMarker:(id)a3 edgeInsets:(UIEdgeInsets)a4 completion:(id)a5
{
  double right;
  double bottom;
  double left;
  double top;
  void (**v11)(id, uint64_t);
  void *v12;
  void *v13;
  id v14;
  double v15;
  CLLocationDegrees v16;
  CLLocationDegrees v17;
  CLLocationCoordinate2D v18;
  id v19;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v19 = a3;
  v11 = (void (**)(id, uint64_t))a5;
  if (-[MapCameraController _mapViewFitsLabelMarker:withEdgeInsets:](self, "_mapViewFitsLabelMarker:withEdgeInsets:", v19, top, left, bottom, right))
  {
    if (v11)
      v11[2](v11, 1);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "camera"));
    v14 = objc_msgSend(v13, "copy");

    objc_msgSend(v19, "coordinate");
    v16 = v15;
    objc_msgSend(v19, "coordinate");
    v18 = CLLocationCoordinate2DMake(v16, v17);
    objc_msgSend(v14, "setCenterCoordinate:", v18.latitude, v18.longitude);
    -[MapCameraController restoreRegionForMapSelectionWithCamera:completion:](self, "restoreRegionForMapSelectionWithCamera:completion:", v14, v11);

  }
}

- (void)restoreRegionForMapSelectionWithCamera:(id)a3 completion:(id)a4
{
  -[MapCameraController _setMapCamera:duration:options:completion:](self, "_setMapCamera:duration:options:completion:", a3, 0x20000, a4, 0.7);
}

- (void)frameMapRect:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  double var1;
  double var0;
  double v8;
  double v9;
  id v11;
  double y;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  _BOOL4 v30;
  __int16 v31;
  void *v32;
  UIEdgeInsets v33;

  v5 = a4;
  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v8 = a3.var0.var1;
  v9 = a3.var0.var0;
  v11 = a5;
  y = MKMapRectNull.origin.y;
  v13 = sub_100583560();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = v14;
  if (v9 == MKMapRectNull.origin.x && v8 == y)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%.1f, %.1f}"), *(_QWORD *)&v9, *(_QWORD *)&v8));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%.1f, %.1f}"), *(_QWORD *)&var0, *(_QWORD *)&var1));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%@, %@}"), v24, v25));

      *(_DWORD *)buf = 138412290;
      v28 = v26;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "not framing target map rect %@, it's null", buf, 0xCu);

    }
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%.1f, %.1f}"), *(_QWORD *)&v9, *(_QWORD *)&v8));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%.1f, %.1f}"), *(_QWORD *)&var0, *(_QWORD *)&var1));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%@, %@}"), v17, v18));

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
      objc_msgSend(v20, "_edgeInsets");
      v21 = NSStringFromUIEdgeInsets(v33);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      *(_DWORD *)buf = 138412802;
      v28 = v19;
      v29 = 1024;
      v30 = v5;
      v31 = 2114;
      v32 = v22;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "setting map camera to frame: %@, animated: %d, current edge insets: %{public}@", buf, 0x1Cu);

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
    objc_msgSend(v23, "setUserTrackingMode:", 0);

    -[MapCameraController _notifyObserversWillChangeVisibleRect](self, "_notifyObserversWillChangeVisibleRect");
    v15 = objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
    -[NSObject _setVisibleMapRect:animated:completionHandler:](v15, "_setVisibleMapRect:animated:completionHandler:", v5, v11, v9, v8, var0, var1);
  }

}

- (void)_frameMapRect:(id)a3 duration:(double)a4 completion:(id)a5
{
  double var1;
  double var0;
  double v8;
  double v9;
  id v11;
  double y;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  double v30;
  __int16 v31;
  void *v32;
  UIEdgeInsets v33;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v8 = a3.var0.var1;
  v9 = a3.var0.var0;
  v11 = a5;
  y = MKMapRectNull.origin.y;
  v13 = sub_100583560();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = v14;
  if (v9 == MKMapRectNull.origin.x && v8 == y)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%.1f, %.1f}"), *(_QWORD *)&v9, *(_QWORD *)&v8));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%.1f, %.1f}"), *(_QWORD *)&var0, *(_QWORD *)&var1));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%@, %@}"), v24, v25));

      *(_DWORD *)buf = 138412290;
      v28 = v26;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "not framing target map rect %@, it's null", buf, 0xCu);

    }
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%.1f, %.1f}"), *(_QWORD *)&v9, *(_QWORD *)&v8));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%.1f, %.1f}"), *(_QWORD *)&var0, *(_QWORD *)&var1));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%@, %@}"), v17, v18));

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
      objc_msgSend(v20, "_edgeInsets");
      v21 = NSStringFromUIEdgeInsets(v33);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      *(_DWORD *)buf = 138543874;
      v28 = v19;
      v29 = 2048;
      v30 = a4;
      v31 = 2114;
      v32 = v22;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "setting map camera to frame: %{public}@, duration: %#.1lfs, current edge insets: %{public}@", buf, 0x20u);

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
    objc_msgSend(v23, "setUserTrackingMode:", 0);

    -[MapCameraController _notifyObserversWillChangeVisibleRect](self, "_notifyObserversWillChangeVisibleRect");
    v15 = objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
    -[NSObject _setVisibleMapRect:duration:completionHandler:](v15, "_setVisibleMapRect:duration:completionHandler:", v11, v9, v8, var0, var1, a4);
  }

}

- (void)_setMapCamera:(id)a3 duration:(double)a4 options:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  id v19;

  v10 = a3;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
  objc_msgSend(v12, "setUserTrackingMode:", 0);

  -[MapCameraController _notifyObserversWillChangeVisibleRect](self, "_notifyObserversWillChangeVisibleRect");
  v13 = sub_100583560();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "setting camera %@ animated", buf, 0xCu);
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100585198;
  v16[3] = &unk_1011AC8B0;
  v16[4] = self;
  v17 = v10;
  v15 = v10;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", a5, v16, v11, a4, 0.0);

}

- (void)_setCenterCoordinate:(CLLocationCoordinate2D)a3 duration:(double)a4 completion:(id)a5
{
  double longitude;
  double latitude;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  int v31;
  void *v32;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
  objc_msgSend(v10, "setUserTrackingMode:", 0);

  -[MapCameraController _notifyObserversWillChangeVisibleRect](self, "_notifyObserversWillChangeVisibleRect");
  v11 = sub_100583560();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = NSStringFromCLLocationCoordinate(latitude, longitude);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v31 = 138412290;
    v32 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "setting center coordinate %@ animated", (uint8_t *)&v31, 0xCu);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_mapLayer"));
  v17 = VKLocationCoordinate2DMake(latitude, longitude);
  v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "_mapLayer"));
  objc_msgSend(v21, "altitude");
  v23 = v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "_mapLayer"));
  objc_msgSend(v25, "yaw");
  v27 = v26;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "_mapLayer"));
  objc_msgSend(v29, "pitch");
  objc_msgSend(v16, "setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:", 0, v9, v17, v19, v23, v27, v30, a4);

}

- (void)_setCenterCoordinate:(CLLocationCoordinate2D)a3 zoomLevel:(double)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  double longitude;
  double latitude;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  double v19;

  v5 = a5;
  longitude = a3.longitude;
  latitude = a3.latitude;
  v10 = sub_100583560();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = NSStringFromCLLocationCoordinate(latitude, longitude);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v16 = 138412546;
    v17 = v13;
    v18 = 2048;
    v19 = a4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "setting center coordinate %@, zoom level %#.2lf animated", (uint8_t *)&v16, 0x16u);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
  objc_msgSend(v14, "setUserTrackingMode:", 0);

  -[MapCameraController _notifyObserversWillChangeVisibleRect](self, "_notifyObserversWillChangeVisibleRect");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
  objc_msgSend(v15, "setCenterCoordinate:zoomLevel:animated:", v5, latitude, longitude, a4);

}

- (void)_notifyObserversWillChangeVisibleRect
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = -[NSHashTable copy](self->_observers, "copy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "mapCameraControllerWillChangeVisibleRect:", self);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- ($C79183323B9A0D5602617FF3BE5395AC)_mapRectForRoutes:(id)a3 includeCompassInset:(BOOL)a4 startPOIShape:(id)a5 endPOIShapes:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
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
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  double v29;
  BOOL v30;
  double v31;
  double bottom;
  double right;
  double top;
  double left;
  BOOL v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double height;
  double v58;
  double width;
  double v60;
  double y;
  double v62;
  double x;
  double v64;
  MKMapRect v65;
  MKMapRect v66;
  $C79183323B9A0D5602617FF3BE5395AC result;
  MKMapRect v68;

  v7 = a4;
  v10 = a6;
  v11 = a5;
  -[MapCameraController _mapRectForRouteLines:includePadding:](self, "_mapRectForRouteLines:includePadding:", a3, 0);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[MapCameraController _mapRectApproximatingRouteFromStartPOIShape:toEndPOIShapes:includePadding:](self, "_mapRectApproximatingRouteFromStartPOIShape:toEndPOIShapes:includePadding:", v11, v10, 0);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  v65.origin.x = v21;
  v65.origin.y = v23;
  v65.size.width = v25;
  v65.size.height = v27;
  v68.origin.x = v13;
  v68.origin.y = v15;
  v68.size.width = v17;
  v68.size.height = v19;
  v66 = MKMapRectUnion(v65, v68);
  y = v66.origin.y;
  x = v66.origin.x;
  height = v66.size.height;
  width = v66.size.width;
  v29 = MKMapRectNull.origin.y;
  v30 = v23 == v29 && v21 == MKMapRectNull.origin.x;
  if (v30 || v25 == 0.0 || v27 == 0.0)
  {
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
    top = UIEdgeInsetsZero.top;
    left = UIEdgeInsetsZero.left;
    v36 = v15 == v29 && v13 == MKMapRectNull.origin.x;
    if (v36 || v17 == 0.0 || v19 == 0.0)
      goto LABEL_16;
    v31 = 10.0;
  }
  else
  {
    v31 = 20.0;
  }
  top = UIEdgeInsetsMakeWithEdges(15, v28, v31);
  left = v37;
  bottom = v38;
  right = v39;
LABEL_16:
  if (v7)
  {
    -[MapCameraController _insetsByAddingCompassPaddingToInsets:](self, "_insetsByAddingCompassPaddingToInsets:", top, left, bottom, right);
    top = v40;
    left = v41;
    bottom = v42;
    right = v43;
  }
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView", *(_QWORD *)&height, *(_QWORD *)&width, *(_QWORD *)&y, *(_QWORD *)&x));
  objc_msgSend(v44, "mapRectThatFits:edgePadding:", v64, v62, v60, v58, top, left, bottom, right);
  v46 = v45;
  v48 = v47;
  v50 = v49;
  v52 = v51;

  v53 = v46;
  v54 = v48;
  v55 = v50;
  v56 = v52;
  result.var1.var1 = v56;
  result.var1.var0 = v55;
  result.var0.var1 = v54;
  result.var0.var0 = v53;
  return result;
}

- ($C79183323B9A0D5602617FF3BE5395AC)_mapRectForRouteLines:(id)a3 includePadding:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double v7;
  void *v8;
  unsigned int v9;
  double v10;
  double y;
  double x;
  double width;
  double height;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  MKMapRect v42;
  MKMapRect v43;
  $C79183323B9A0D5602617FF3BE5395AC result;
  MKMapRect v45;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    if (v4)
      v7 = 10.0;
    else
      v7 = 0.0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v9 = objc_msgSend(v8, "transportType");

    if (v9 == 1)
      v10 = v7 + 10.0;
    else
      v10 = v7;
    x = MKMapRectNull.origin.x;
    y = MKMapRectNull.origin.y;
    width = MKMapRectNull.size.width;
    height = MKMapRectNull.size.height;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v15 = v6;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v38 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i), "_maps_boundingMapRect", (_QWORD)v37);
          v45.origin.x = v20;
          v45.origin.y = v21;
          v45.size.width = v22;
          v45.size.height = v23;
          v42.origin.x = x;
          v42.origin.y = y;
          v42.size.width = width;
          v42.size.height = height;
          v43 = MKMapRectUnion(v42, v45);
          x = v43.origin.x;
          y = v43.origin.y;
          width = v43.size.width;
          height = v43.size.height;
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v17);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
    objc_msgSend(v24, "mapRectThatFits:edgePadding:", x, y, width, height, v10, v10, v10, v10);
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;

  }
  else
  {
    v26 = MKMapRectNull.origin.x;
    v28 = MKMapRectNull.origin.y;
    v30 = MKMapRectNull.size.width;
    v32 = MKMapRectNull.size.height;
  }

  v33 = v26;
  v34 = v28;
  v35 = v30;
  v36 = v32;
  result.var1.var1 = v36;
  result.var1.var0 = v35;
  result.var0.var1 = v34;
  result.var0.var0 = v33;
  return result;
}

- ($C79183323B9A0D5602617FF3BE5395AC)_mapRectForRoutes:(id)a3 includeCompassInset:(BOOL)a4 waypoints:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  $C79183323B9A0D5602617FF3BE5395AC result;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = v8;
  if (v5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "anchorPoints"));
    v12 = objc_msgSend(v11, "count");

    if (v12)
      v13 = objc_claimAutoreleasedReturnValue(-[MapCameraController _poiShapeAnchorPointMarkersFromRoute:](self, "_poiShapeAnchorPointMarkersFromRoute:", v10));
    else
      v13 = objc_claimAutoreleasedReturnValue(-[MapCameraController _poiShapeWaypointMarkersFromRoute:](self, "_poiShapeWaypointMarkersFromRoute:", v10));
    v14 = (void *)v13;

  }
  else
  {
    v14 = 0;
  }
  -[MapCameraController _mapRectForRoutes:includeCompassInset:startPOIShape:endPOIShapes:](self, "_mapRectForRoutes:includeCompassInset:startPOIShape:endPOIShapes:", v9, v6, 0, v14);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v23 = v16;
  v24 = v18;
  v25 = v20;
  v26 = v22;
  result.var1.var1 = v26;
  result.var1.var0 = v25;
  result.var0.var1 = v24;
  result.var0.var0 = v23;
  return result;
}

- (id)_poiShapeAnchorPointMarkersFromRoute:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "anchorPoints"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "anchorPoints"));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100585B74;
  v9[3] = &unk_1011BBC60;
  v9[4] = self;
  v6 = sub_10039DCD4(v5, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (id)_poiShapeWaypointMarkersFromRoute:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "waypoints"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100585C90;
  v8[3] = &unk_1011BBC88;
  v8[4] = self;
  v5 = sub_10039DCD4(v4, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- ($C79183323B9A0D5602617FF3BE5395AC)mapRectApproximatingRouteFromStartPOIShape:(id)a3 toEndPOIShapes:(id)a4
{
  double left;
  double bottom;
  double right;
  id v9;
  id v10;
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
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  $C79183323B9A0D5602617FF3BE5395AC result;

  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  v9 = a4;
  v10 = a3;
  -[MapCameraController _insetsByAddingCompassPaddingToInsets:](self, "_insetsByAddingCompassPaddingToInsets:", UIEdgeInsetsZero.top, left, bottom, right);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[MapCameraController _mapRectApproximatingRouteFromStartPOIShape:toEndPOIShapes:includePadding:](self, "_mapRectApproximatingRouteFromStartPOIShape:toEndPOIShapes:includePadding:", v10, v9, 1);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
  objc_msgSend(v27, "mapRectThatFits:edgePadding:", v20, v22, v24, v26, v12, v14, v16, v18);
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;

  v36 = v29;
  v37 = v31;
  v38 = v33;
  v39 = v35;
  result.var1.var1 = v39;
  result.var1.var0 = v38;
  result.var0.var1 = v37;
  result.var0.var0 = v36;
  return result;
}

- ($C79183323B9A0D5602617FF3BE5395AC)_mapRectApproximatingRouteFromStartPOIShape:(id)a3 toEndPOIShapes:(id)a4 includePadding:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  CGFloat top;
  double v13;
  CGFloat left;
  double v15;
  CGFloat bottom;
  double v17;
  CGFloat right;
  id v19;
  void *v20;
  char *v21;
  double x;
  double y;
  double height;
  double width;
  char *v26;
  uint64_t v27;
  double *v28;
  double v29;
  uint64_t v30;
  double *v31;
  uint64_t v32;
  char *v33;
  _QWORD *v34;
  CLLocationDegrees *v35;
  void *v36;
  CLLocationDegrees latitude;
  CLLocationDegrees longitude;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  MapCameraController *v51;
  void *v52;
  id v53;
  uint64_t v54;
  double v55;
  double *v56;
  _QWORD *v57;
  uint64_t v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  MKMapPoint v76;
  void *v78;
  double v79;
  double v80;
  double v81;
  double v82;
  CLLocationCoordinate2D v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  MapCameraController *v95;
  double *v96;
  void *v97;
  double v98;
  double v99;
  double v100;
  CLLocationCoordinate2D v101;
  MKMapPoint v102;
  MKMapPoint v103;
  MKMapPoint v104;
  MKMapRect v105;
  MKMapRect v106;
  $C79183323B9A0D5602617FF3BE5395AC result;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v11 = v9;
  if (v8 || objc_msgSend(v9, "count"))
  {
    if (v5)
    {
      top = UIEdgeInsetsMakeWithEdges(15, v10, 20.0);
      left = v13;
      bottom = v15;
      right = v17;
    }
    else
    {
      top = UIEdgeInsetsZero.top;
      left = UIEdgeInsetsZero.left;
      bottom = UIEdgeInsetsZero.bottom;
      right = UIEdgeInsetsZero.right;
    }
    v19 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", v11);
    v20 = v19;
    if (v8)
      objc_msgSend(v19, "insertObject:atIndex:", v8, 0);
    v21 = (char *)objc_msgSend(v20, "count");
    x = MKMapRectNull.origin.x;
    y = MKMapRectNull.origin.y;
    width = MKMapRectNull.size.width;
    height = MKMapRectNull.size.height;
    if (v21)
    {
      v26 = v21;
      v93 = right;
      v94 = bottom;
      v97 = v11;
      v95 = self;
      v96 = &v91;
      __chkstk_darwin(v21);
      v28 = &v91 - 2 * v27;
      *(_QWORD *)&v29 = __chkstk_darwin(v27).n128_u64[0];
      v31 = &v91 - 2 * v30;
      v32 = 0;
      v33 = 0;
      v34 = v31 + 1;
      v35 = v28 + 1;
      do
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndexedSubscript:", v33, v29));
        objc_msgSend(v36, "centerCoordinate");
        latitude = v101.latitude;
        longitude = v101.longitude;
        if (CLLocationCoordinate2DIsValid(v101))
        {
          *(v35 - 1) = latitude;
          *v35 = longitude;
          objc_msgSend(v36, "estimatedSize");
          *(v34 - 1) = v39;
          *v34 = v40;
          ++v32;
        }

        ++v33;
        v34 += 2;
        v35 += 2;
      }
      while (v26 != v33);
      if (v32)
      {
        v91 = left;
        v92 = top;
        v98 = height;
        __chkstk_darwin(v41);
        v42 = 0;
        v43 = v32;
        do
        {
          *(MKMapPoint *)((char *)&v91 + v42 * 8 + -16 * v32) = MKMapPointForCoordinate(*(CLLocationCoordinate2D *)&v28[v42]);
          v42 += 2;
          --v43;
        }
        while (v43);
        v44 = MKMapRectBoundingMapPoints(&v91 - 2 * v32, v32);
        v46 = v45;
        v48 = v47;
        v50 = v49;
        v51 = v95;
        v52 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](v95, "mapView"));
        v53 = objc_msgSend(v52, "_zoomLevelForMapRect:includeAccessoryPadding:", 0, v44, v46, v48, v50);
        v100 = MKZoomScaleForZoomLevelF(v53, v54, v55);

        v56 = v31 + 1;
        v57 = v28 + 1;
        v58 = v32;
        v59 = MKMapRectNull.origin.x;
        v60 = y;
        v61 = width;
        v62 = v98;
        v63 = v98;
        v11 = v97;
        do
        {
          v64 = x;
          v65 = y;
          v66 = width;
          v67 = v62;
          if (v100 > 0.0)
          {
            v99 = v59;
            v68 = v60;
            v69 = v61;
            v70 = v63;
            v71 = width;
            v72 = x;
            v73 = y;
            v75 = *(v56 - 1);
            v74 = *v56;
            v76 = MKMapPointForCoordinate(*(CLLocationCoordinate2D *)(v57 - 1));
            v66 = v75 / v100;
            y = v73;
            v67 = v74 / v100;
            x = v72;
            width = v71;
            v63 = v70;
            v61 = v69;
            v60 = v68;
            v62 = v98;
            v59 = v99;
            v64 = v76.x - v66 * 0.5;
            v65 = v76.y - v67 * 0.5;
          }
          if (v59 == x && v60 == y)
          {
            v63 = v67;
            v61 = v66;
            v60 = v65;
            v59 = v64;
          }
          else
          {
            v105.origin.x = v59;
            v105.origin.y = v60;
            v105.size.width = v61;
            v105.size.height = v63;
            v106 = MKMapRectUnion(v105, *(MKMapRect *)&v64);
            v59 = v106.origin.x;
            v60 = v106.origin.y;
            v61 = v106.size.width;
            v63 = v106.size.height;
          }
          v56 += 2;
          v57 += 2;
          --v58;
        }
        while (v58);
        v78 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](v51, "mapView"));
        objc_msgSend(v78, "mapRectThatFits:edgePadding:", v59, v60, v61, v63, v92, v91, v94, v93);
        x = v79;
        y = v80;
        width = v81;
        height = v82;

        if (v32 == 1)
        {
          v102.x = x + width * 0.5;
          v102.y = y + height * 0.5;
          v104.x = v102.x;
          v104.y = y;
          if (MKMetersBetweenMapPoints(v102, v104) < 175.0)
          {
            v103.x = x + width * 0.5;
            v103.y = y + height * 0.5;
            v83 = MKCoordinateForMapPoint(v103);
            x = MKMapRectMakeWithRadialDistance(v83.latitude, v83.longitude, 175.0);
            y = v84;
            width = v85;
            height = v86;
          }
        }
      }
      else
      {
        v11 = v97;
      }
    }

  }
  else
  {
    x = MKMapRectNull.origin.x;
    y = MKMapRectNull.origin.y;
    width = MKMapRectNull.size.width;
    height = MKMapRectNull.size.height;
  }

  v87 = x;
  v88 = y;
  v89 = width;
  v90 = height;
  result.var1.var1 = v90;
  result.var1.var0 = v89;
  result.var0.var1 = v88;
  result.var0.var0 = v87;
  return result;
}

- ($C79183323B9A0D5602617FF3BE5395AC)_mapRectFromLocation:(id)a3 alongRoute:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char *v9;
  unsigned int v10;
  uint64_t v11;
  double v12;
  double v13;
  id v14;
  unsigned int v15;
  void *v16;
  char *v17;
  void *v18;
  void *v19;
  double v20;
  double x;
  double v22;
  double y;
  double v24;
  double width;
  double v26;
  double height;
  void *v28;
  char *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  id WeakRetained;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  MKMapRect v76;
  MKMapRect v77;
  MKMapRect v78;
  MKMapRect v79;
  $C79183323B9A0D5602617FF3BE5395AC result;
  MKMapRect v81;
  MKMapRect v82;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routeMatch"));
  v9 = (char *)objc_msgSend(v8, "stepIndex");
  v10 = objc_msgSend(v8, "routeCoordinate");
  if (v8)
  {
    v9 = (char *)objc_msgSend(v8, "stepIndex");
    v11 = objc_msgSend(v8, "routeCoordinate");
  }
  else
  {
    LODWORD(v11) = v10;
    objc_msgSend(v6, "coordinate");
    v14 = objc_msgSend(v7, "closestPointOnRoute:", GEOLocationCoordinate2DFromCLLocationCoordinate2D(v12, v13));
    v15 = v14;
    if (GEOPolylineCoordinateIsValid(v14))
    {
      v11 = v15;
      v9 = (char *)objc_msgSend(v7, "stepIndexForPointIndex:", v15);
    }
    else
    {
      v11 = v11;
      objc_msgSend(v7, "_maps_boundingMapRect");
    }
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "steps"));
  v17 = (char *)objc_msgSend(v16, "count");

  if (v9 >= v17)
  {
    x = MKMapRectNull.origin.x;
    y = MKMapRectNull.origin.y;
    width = MKMapRectNull.size.width;
    height = MKMapRectNull.size.height;
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "steps"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", v9));
    objc_msgSend(v7, "_maps_boundingRectForStep:fromPoint:", v19, v11);
    x = v20;
    y = v22;
    width = v24;
    height = v26;

    while (1)
    {
      ++v9;
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "steps"));
      v29 = (char *)objc_msgSend(v28, "count");

      if (v9 >= v29)
        break;
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "steps"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectAtIndexedSubscript:", v9));
      objc_msgSend(v7, "_maps_boundingRectForStep:", v31);
      v33 = v32;
      v35 = v34;
      v37 = v36;
      v39 = v38;

      v76.origin.x = x;
      v76.origin.y = y;
      v76.size.width = width;
      v76.size.height = height;
      v81.origin.x = v33;
      v81.origin.y = v35;
      v81.size.width = v37;
      v81.size.height = v39;
      v77 = MKMapRectUnion(v76, v81);
      x = v77.origin.x;
      y = v77.origin.y;
      width = v77.size.width;
      height = v77.size.height;
    }
  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "destination"));
  if (v6)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
    objc_msgSend(v6, "coordinate");
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[POIShapeFactory userLocationPOIShapeWithMapView:coordinate:](POIShapeFactory, "userLocationPOIShapeWithMapView:coordinate:", v41));

  }
  else
  {
    v42 = 0;
  }
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[POIShapeFactory composedWaypointPOIShapeWithMapView:composedWaypoint:](POIShapeFactory, "composedWaypointPOIShapeWithMapView:composedWaypoint:", v43, v40));

  if (v44)
  {
    v75 = v44;
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v75, 1));
    -[MapCameraController mapRectApproximatingRouteFromStartPOIShape:toEndPOIShapes:](self, "mapRectApproximatingRouteFromStartPOIShape:toEndPOIShapes:", v42, v45);
    v47 = v46;
    v49 = v48;
    v51 = v50;
    v53 = v52;

  }
  else
  {
    -[MapCameraController mapRectApproximatingRouteFromStartPOIShape:toEndPOIShapes:](self, "mapRectApproximatingRouteFromStartPOIShape:toEndPOIShapes:", v42, 0);
    v47 = v54;
    v49 = v55;
    v51 = v56;
    v53 = v57;
  }
  v78.origin.x = x;
  v78.origin.y = y;
  v78.size.width = width;
  v78.size.height = height;
  v82.origin.x = v47;
  v82.origin.y = v49;
  v82.size.width = v51;
  v82.size.height = v53;
  v79 = MKMapRectUnion(v78, v82);
  v58 = v79.origin.x;
  v59 = v79.origin.y;
  v60 = v79.size.width;
  v61 = v79.size.height;
  WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
  objc_msgSend(WeakRetained, "mapRectThatFits:edgePadding:", v58, v59, v60, v61, 20.0, 20.0, 20.0, 20.0);
  v64 = v63;
  v66 = v65;
  v68 = v67;
  v70 = v69;

  v71 = v64;
  v72 = v66;
  v73 = v68;
  v74 = v70;
  result.var1.var1 = v74;
  result.var1.var0 = v73;
  result.var0.var1 = v72;
  result.var0.var0 = v71;
  return result;
}

- (double)_maximumEdgeToEdgeDistanceBetweenCurrentAndTargetMapRect:(id)a3
{
  double var1;
  double v4;
  double v5;
  double v6;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  uint64_t v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double var0;
  double v30;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v30 = a3.var1.var1;
  v4 = a3.var1.var0;
  v5 = a3.var0.var1;
  v6 = a3.var0.var0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
  objc_msgSend(v8, "visibleMapRect");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
  v18 = objc_msgSend(v17, "_zoomLevelForMapRect:includeAccessoryPadding:", 0, v6, v5, v4, var1);
  v21 = MKZoomScaleForZoomLevelF(v18, v19, v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
  v23 = objc_msgSend(v22, "_zoomLevelForMapRect:includeAccessoryPadding:", 0, v10, v12, v14, v16);
  v26 = MKZoomScaleForZoomLevelF(v23, v24, v25);

  if (v21 <= v26)
    v27 = v26;
  else
    v27 = v21;
  return fmax(fmax(fmax(vabdd_f64(v6, v10), vabdd_f64(v5, v12)), vabdd_f64(v6 + var0, v10 + v14)), vabdd_f64(v5 + v30, v12 + v16))* v27;
}

- (UIEdgeInsets)_insetsByAddingCompassPaddingToInsets:(UIEdgeInsets)a3
{
  double right;
  CGFloat bottom;
  double left;
  CGFloat top;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  int IsRightToLeft;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  UIEdgeInsets result;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
  if (sub_1002A8AA0(v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
    v10 = sub_1002A8AA0(v9);

    if (v10 != 1)
      goto LABEL_11;
  }
  else
  {

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
  objc_msgSend(v11, "_compassDiameter");
  v13 = v12;

  v14 = v13 + sub_1005EC29C();
  IsRightToLeft = MKApplicationLayoutDirectionIsRightToLeft(v15);
  v17 = -0.0;
  if (IsRightToLeft)
    v18 = -0.0;
  else
    v18 = v14;
  right = right + v18;
  if (IsRightToLeft)
    v17 = v14;
  left = left + v17;
LABEL_11:
  v19 = top;
  v20 = left;
  v21 = bottom;
  v22 = right;
  result.right = v22;
  result.bottom = v21;
  result.left = v20;
  result.top = v19;
  return result;
}

- (UIEdgeInsets)_insetsForPin
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIEdgeInsets result;

  +[MKPinAnnotationView _perceivedSize](MKPinAnnotationView, "_perceivedSize");
  v3 = v2;
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  if (objc_msgSend(v6, "userInterfaceIdiom") == (id)1)
    v7 = v5 + v5;
  else
    v7 = v5 + 4.0;

  v8 = v7;
  v9 = v3 + v3;
  v10 = v7;
  v11 = v3 + v3;
  result.right = v11;
  result.bottom = v10;
  result.left = v9;
  result.top = v8;
  return result;
}

- (BOOL)_mapViewFitsLabelMarker:(id)a3 withEdgeInsets:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  CLLocationDegrees v9;
  CLLocationDegrees v10;
  CLLocationCoordinate2D v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v35;
  CGFloat v36;
  CGPoint v37;
  CGRect v38;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  objc_msgSend(a3, "coordinate");
  v11 = CLLocationCoordinate2DMake(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
  objc_msgSend(v12, "convertCoordinate:toPointToView:", v13, v11.latitude, v11.longitude);
  v35 = v15;
  v36 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
  objc_msgSend(v16, "bounds");
  v18 = left + v17;
  v20 = top + v19;
  v22 = v21 - (left + right);
  v24 = v23 - (top + bottom);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MapCameraController mapView](self, "mapView"));
  objc_msgSend(v25, "defaultInsetsForBalloonCallout");
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;

  v38.origin.x = v18 + v29;
  v38.origin.y = v20 + v27;
  v38.size.width = v22 - (v29 + v33);
  v38.size.height = v24 - (v27 + v31);
  v37.y = v35;
  v37.x = v36;
  return CGRectContainsPoint(v38, v37);
}

- (MKMapView)mapView
{
  return (MKMapView *)objc_loadWeakRetained((id *)&self->_mapView);
}

- (void)setMapView:(id)a3
{
  objc_storeWeak((id *)&self->_mapView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapView);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
