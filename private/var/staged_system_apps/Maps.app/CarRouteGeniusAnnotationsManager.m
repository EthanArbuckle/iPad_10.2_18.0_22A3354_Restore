@implementation CarRouteGeniusAnnotationsManager

- (CarRouteGeniusAnnotationsManager)initWithChromeViewController:(id)a3
{
  id v4;
  CarRouteGeniusAnnotationsManager *v5;
  CarRouteGeniusAnnotationsManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CarRouteGeniusAnnotationsManager;
  v5 = -[CarRouteGeniusAnnotationsManager init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_chromeViewController, v4);

  return v6;
}

- (void)frameRouteAnimated:(BOOL)a3
{
  -[CarRouteGeniusAnnotationsManager recenterCameraOnRouteAnimated:force:](self, "recenterCameraOnRouteAnimated:force:", a3, 1);
}

- (void)recenterCameraOnRouteAnimated:(BOOL)a3
{
  -[CarRouteGeniusAnnotationsManager recenterCameraOnRouteAnimated:force:](self, "recenterCameraOnRouteAnimated:force:", a3, 0);
}

- (void)recenterCameraOnRouteAnimated:(BOOL)a3 force:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  CarRouteGeniusAnnotationsManager *v12;
  CarRouteGeniusAnnotationsManager *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  GEOComposedRoute *route;
  CarChromeViewController **p_chromeViewController;
  id WeakRetained;
  void *v28;
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  id v38;
  NSObject *v39;
  CarRouteGeniusAnnotationsManager *v40;
  objc_class *v41;
  NSString *v42;
  void *v43;
  void *v44;
  void *v45;
  __CFString *v46;
  const char *v47;
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
  double v62;
  double v63;
  double Double;
  double v65;
  double v66;
  double v67;
  double v68;
  id v69;
  _BOOL4 v70;
  double v71;
  CarRouteGeniusAnnotationsManager *v72;
  objc_class *v73;
  NSString *v74;
  void *v75;
  void *v76;
  void *v77;
  NSObject *v78;
  uint32_t v79;
  id v80;
  CarRouteGeniusAnnotationsManager *v81;
  objc_class *v82;
  NSString *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  CarRouteGeniusAnnotationsManager *v88;
  objc_class *v89;
  NSString *v90;
  void *v91;
  void *v92;
  void *v93;
  __CFString *v94;
  double v95;
  double v96;
  double v97;
  void *v98;
  uint8_t buf[4];
  __CFString *v100;
  __int16 v101;
  __CFString *v102;
  __int16 v103;
  double v104;
  __int16 v105;
  double v106;
  __int16 v107;
  double v108;
  __int16 v109;
  double v110;
  CLLocationCoordinate2D v111;
  MKMapPoint v112;
  MKMapRect v113;

  v4 = a4;
  v5 = a3;
  if (!-[CarRouteGeniusAnnotationsManager _shouldIgnoreRoute](self, "_shouldIgnoreRoute"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusAnnotationsManager mapView](self, "mapView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userLocation"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "location"));

    v10 = sub_1004336BC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      goto LABEL_18;
    v12 = self;
    v13 = v12;
    v98 = v9;
    if (!v12)
    {
      v20 = v7;
      v19 = CFSTR("<nil>");
      goto LABEL_11;
    }
    v14 = (objc_class *)objc_opt_class(v12);
    v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if ((objc_opt_respondsToSelector(v13, "accessibilityIdentifier") & 1) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusAnnotationsManager performSelector:](v13, "performSelector:", "accessibilityIdentifier"));
      v18 = v17;
      if (v17 && !objc_msgSend(v17, "isEqualToString:", v16))
      {
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v16, v13, v18));

        goto LABEL_9;
      }

    }
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v16, v13));
LABEL_9:
    v20 = v7;

LABEL_11:
    if (v5)
      v21 = CFSTR("YES");
    else
      v21 = CFSTR("NO");
    v22 = v21;
    if (v4)
      v23 = CFSTR("YES");
    else
      v23 = CFSTR("NO");
    *(double *)&v24 = COERCE_DOUBLE(v23);
    route = v13->_route;
    *(_DWORD *)buf = 138544386;
    v100 = v19;
    v101 = 2112;
    v102 = v22;
    v103 = 2112;
    v104 = *(double *)&v24;
    v105 = 2048;
    v106 = *(double *)&route;
    v107 = 2112;
    v108 = *(double *)&v98;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}@] recenterCameraOnRouteAnimated:animated %@, force: %@, route %p, userLocation: %@", buf, 0x34u);

    v7 = v20;
    v9 = v98;
LABEL_18:

    if (!self->_route || !v9)
      goto LABEL_50;
    p_chromeViewController = &self->_chromeViewController;
    WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "mapCameraController"));
    v29 = objc_msgSend(objc_alloc((Class)MNLocation), "initWithCLLocation:", v9);
    objc_msgSend(v28, "mapRectForTripFromLocation:alongRoute:", v29, self->_route);
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v37 = v36;

    if (v4)
    {
      v38 = sub_1004336BC();
      v39 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        v40 = self;
        v41 = (objc_class *)objc_opt_class(v40);
        v42 = NSStringFromClass(v41);
        v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
        if ((objc_opt_respondsToSelector(v40, "accessibilityIdentifier") & 1) != 0)
        {
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusAnnotationsManager performSelector:](v40, "performSelector:", "accessibilityIdentifier"));
          v45 = v44;
          if (v44 && !objc_msgSend(v44, "isEqualToString:", v43))
          {
            v46 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v43, v40, v45));

            goto LABEL_27;
          }

        }
        v46 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v43, v40));
LABEL_27:

        *(_DWORD *)buf = 138543362;
        v100 = v46;
        v47 = "[%{public}@] - updating framing (forced)";
LABEL_46:
        v78 = v39;
        v79 = 12;
        goto LABEL_47;
      }
LABEL_48:

      v39 = objc_loadWeakRetained((id *)p_chromeViewController);
      v87 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject mapCameraController](v39, "mapCameraController"));
      objc_msgSend(v87, "frameMapRect:animated:completion:", v5, 0, v31, v33, v35, v37);

LABEL_49:
LABEL_50:

      return;
    }
    objc_msgSend(v7, "visibleMapRect");
    v49 = v48;
    v51 = v50;
    v53 = v52;
    v55 = v54;
    objc_msgSend(v9, "coordinate");
    v112 = MKMapPointForCoordinate(v111);
    v113.origin.x = v49;
    v113.origin.y = v51;
    v113.size.width = v53;
    v113.size.height = v55;
    if (MKMapRectContainsPoint(v113, v112))
    {
      v97 = v31;
      v56 = v31;
      v57 = v33;
      v58 = v33;
      v59 = v35;
      v60 = v35;
      v61 = v37;
      objc_msgSend(v7, "_zoomLevelForMapRect:includeAccessoryPadding:", 0, v56, v58, v60, v37);
      v63 = v62;
      Double = GEOConfigGetDouble(MapsConfig_RouteGeniusMaximumFramingZoomLevel, off_1014B5658);
      v95 = Double;
      v96 = v63;
      if (v63 >= Double)
        v63 = Double;
      objc_msgSend(v7, "_zoomLevelForMapRect:includeAccessoryPadding:", 0, v49, v51, v53, v55);
      v66 = v65;
      v67 = vabdd_f64(v65, v63);
      v68 = GEOConfigGetDouble(MapsConfig_RouteGeniusMinimumZoomLevelDifferenceForReframing, off_1014B4C88);
      v69 = sub_1004336BC();
      v39 = objc_claimAutoreleasedReturnValue(v69);
      v70 = os_log_type_enabled(v39, OS_LOG_TYPE_INFO);
      if (v67 > v68)
      {
        v71 = v63;
        v37 = v61;
        v35 = v59;
        v33 = v57;
        v31 = v97;
        if (!v70)
          goto LABEL_48;
        v72 = self;
        v73 = (objc_class *)objc_opt_class(v72);
        v74 = NSStringFromClass(v73);
        v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
        if ((objc_opt_respondsToSelector(v72, "accessibilityIdentifier") & 1) != 0)
        {
          v76 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusAnnotationsManager performSelector:](v72, "performSelector:", "accessibilityIdentifier"));
          v77 = v76;
          if (v76 && !objc_msgSend(v76, "isEqualToString:", v75))
          {
            v46 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v75, v72, v77));

            goto LABEL_38;
          }

        }
        v46 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v75, v72));
LABEL_38:

        *(_DWORD *)buf = 138544642;
        v100 = v46;
        v101 = 2048;
        v102 = *(__CFString **)&v66;
        v103 = 2048;
        v104 = v71;
        v105 = 2048;
        v106 = v96;
        v107 = 2048;
        v108 = v95;
        v109 = 2048;
        v110 = v67;
        v47 = "[%{public}@] - updating framing (zoom current: %lf, target: %lf, desired: %lf, max: %lf, difference: %lf)";
        v78 = v39;
        v79 = 62;
LABEL_47:
        _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_INFO, v47, buf, v79);

        goto LABEL_48;
      }
      if (!v70)
        goto LABEL_49;
      v88 = self;
      v89 = (objc_class *)objc_opt_class(v88);
      v90 = NSStringFromClass(v89);
      v91 = (void *)objc_claimAutoreleasedReturnValue(v90);
      if ((objc_opt_respondsToSelector(v88, "accessibilityIdentifier") & 1) != 0)
      {
        v92 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusAnnotationsManager performSelector:](v88, "performSelector:", "accessibilityIdentifier"));
        v93 = v92;
        if (v92 && !objc_msgSend(v92, "isEqualToString:", v91))
        {
          v94 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v91, v88, v93));

          goto LABEL_58;
        }

      }
      v94 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v91, v88));
LABEL_58:

      *(_DWORD *)buf = 138544642;
      v100 = v94;
      v101 = 2048;
      v102 = *(__CFString **)&v66;
      v103 = 2048;
      v104 = v63;
      v105 = 2048;
      v106 = v96;
      v107 = 2048;
      v108 = v95;
      v109 = 2048;
      v110 = v67;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "[%{public}@] - not updating framing (zoom current: %lf, target: %lf, desired: %lf, max: %lf, difference: %lf)", buf, 0x3Eu);

      goto LABEL_49;
    }
    v80 = sub_1004336BC();
    v39 = objc_claimAutoreleasedReturnValue(v80);
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      goto LABEL_48;
    v81 = self;
    v82 = (objc_class *)objc_opt_class(v81);
    v83 = NSStringFromClass(v82);
    v84 = (void *)objc_claimAutoreleasedReturnValue(v83);
    if ((objc_opt_respondsToSelector(v81, "accessibilityIdentifier") & 1) != 0)
    {
      v85 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusAnnotationsManager performSelector:](v81, "performSelector:", "accessibilityIdentifier"));
      v86 = v85;
      if (v85 && !objc_msgSend(v85, "isEqualToString:", v84))
      {
        v46 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v84, v81, v86));

        goto LABEL_45;
      }

    }
    v46 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v84, v81));
LABEL_45:

    *(_DWORD *)buf = 138543362;
    v100 = v46;
    v47 = "[%{public}@] - updating framing (user location outside visible rect)";
    goto LABEL_46;
  }
}

- (void)_updateRouteAnnotation
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  objc_msgSend(WeakRetained, "setNeedsUpdateComponent:animated:", CFSTR("routeAnnotations"), 1);

}

- (BOOL)updateRouteAnnotationsConfiguration:(id)a3
{
  id v4;
  __CFString *v5;
  __CFString *v6;
  id v7;
  NSObject *v8;
  CarRouteGeniusAnnotationsManager *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  CarRouteGeniusAnnotationsManager *v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  GEOComposedRoute *v25;
  id v26;
  __CFString *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  void *v31;
  GEOComposedRoute *route;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  __CFString *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  uint64_t v41;

  v4 = a3;
  v5 = CFSTR("the route is nil");
  if (!self->_route)
    goto LABEL_5;
  if (!-[CarRouteGeniusAnnotationsManager _shouldIgnoreRoute](self, "_shouldIgnoreRoute"))
  {
    v16 = sub_1004336BC();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
LABEL_20:

      route = self->_route;
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &route, 1));
      objc_msgSend(v4, "setRoutes:", v31);

      goto LABEL_21;
    }
    v18 = self;
    v19 = (objc_class *)objc_opt_class(v18);
    v20 = NSStringFromClass(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    if ((objc_opt_respondsToSelector(v18, "accessibilityIdentifier") & 1) != 0)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusAnnotationsManager performSelector:](v18, "performSelector:", "accessibilityIdentifier"));
      v23 = v22;
      if (v22 && !objc_msgSend(v22, "isEqualToString:", v21))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v21, v18, v23));

        goto LABEL_19;
      }

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v21, v18));
LABEL_19:

    v25 = self->_route;
    v26 = v24;
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute name](v25, "name"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute uniqueRouteID](self->_route, "uniqueRouteID"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "UUIDString"));
    v30 = -[GEOComposedRoute pointCount](self->_route, "pointCount");

    *(_DWORD *)buf = 138544130;
    v35 = v24;
    v36 = 2112;
    v37 = v27;
    v38 = 2112;
    v39 = v29;
    v40 = 2048;
    v41 = v30;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%{public}@] CarRouteGeniusAnnotationsManager: Drawing route: (name: %@, id: %@, points: %lu)", buf, 0x2Au);

    goto LABEL_20;
  }
  if (self->_route)
    v5 = CFSTR("the route has multiple legs");
LABEL_5:
  v6 = v5;
  v7 = sub_1004336BC();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = self;
    v10 = (objc_class *)objc_opt_class(v9);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if ((objc_opt_respondsToSelector(v9, "accessibilityIdentifier") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusAnnotationsManager performSelector:](v9, "performSelector:", "accessibilityIdentifier"));
      v14 = v13;
      if (v13 && !objc_msgSend(v13, "isEqualToString:", v12))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v12, v9, v14));

        goto LABEL_11;
      }

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v12, v9));
LABEL_11:

    *(_DWORD *)buf = 138543618;
    v35 = v15;
    v36 = 2112;
    v37 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] CarRouteGeniusAnnotationsManager: Won't draw route because %@", buf, 0x16u);

  }
  objc_msgSend(v4, "setRoutes:", 0);
LABEL_21:
  objc_msgSend(v4, "setSelectPolyline:", 1);
  objc_msgSend(v4, "setRouteTrafficFeaturesActive:", 1);
  objc_msgSend(v4, "setStyle:", 0);

  return 1;
}

- (BOOL)_shouldIgnoreRoute
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute legs](self->_route, "legs"));
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (void)clearAnnotations
{
  id v3;
  NSObject *v4;
  CarRouteGeniusAnnotationsManager *v5;
  CarRouteGeniusAnnotationsManager *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  GEOComposedRoute *route;
  uint8_t buf[4];
  __CFString *v15;

  v3 = sub_1004336BC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusAnnotationsManager performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v15 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] CarRouteGeniusAnnotationsManager: clearAnnotations", buf, 0xCu);

  }
  route = self->_route;
  self->_route = 0;

  -[CarRouteGeniusAnnotationsManager _updateRouteAnnotation](self, "_updateRouteAnnotation");
  -[CarRouteGeniusAnnotationsManager setDestination:](self, "setDestination:", 0);
}

- (void)setComposedRoute:(id)a3
{
  id v5;
  GEOComposedRoute **p_route;
  unsigned int v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  CarRouteGeniusAnnotationsManager *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  CarRouteGeniusAnnotationsManager *v25;
  objc_class *v26;
  NSString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  NSObject *log;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  uint64_t v58;

  v5 = a3;
  p_route = &self->_route;
  v7 = -[GEOComposedRoute _MapsCarPlay_isEqual:](self->_route, "_MapsCarPlay_isEqual:", v5);
  v8 = sub_1004336BC();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (!v7)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
LABEL_17:

      objc_storeStrong((id *)&self->_route, a3);
      -[CarRouteGeniusAnnotationsManager _updateRouteAnnotation](self, "_updateRouteAnnotation");
      -[CarRouteGeniusAnnotationsManager updateTrafficForRoute:](self, "updateTrafficForRoute:", self->_route);
      goto LABEL_18;
    }
    v25 = self;
    v26 = (objc_class *)objc_opt_class(v25);
    v27 = NSStringFromClass(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    log = v10;
    if ((objc_opt_respondsToSelector(v25, "accessibilityIdentifier") & 1) != 0)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusAnnotationsManager performSelector:](v25, "performSelector:", "accessibilityIdentifier"));
      v30 = v29;
      if (v29 && !objc_msgSend(v29, "isEqualToString:", v28))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v28, v25, v30));

        goto LABEL_16;
      }

    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v28, v25));
LABEL_16:

    v32 = v31;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uniqueRouteID"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "UUIDString"));
    v38 = objc_msgSend(v5, "pointCount");
    v41 = v5;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute name](*p_route, "name"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute uniqueRouteID](*p_route, "uniqueRouteID"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "UUIDString"));
    v37 = -[GEOComposedRoute pointCount](*p_route, "pointCount");

    *(_DWORD *)buf = 138544898;
    v46 = v31;
    v47 = 2112;
    v48 = v33;
    v49 = 2112;
    v50 = v39;
    v51 = 2048;
    v52 = v38;
    v53 = 2112;
    v54 = v34;
    v55 = 2112;
    v56 = v36;
    v57 = 2048;
    v58 = v37;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "[%{public}@] CarRouteGeniusAnnotationsManager: setRoute: route (name: %@, id: %@, points: %lu), current: (name: %@, id: %@, points: %lu). Redrawing route.", buf, 0x48u);

    v5 = v41;
    v10 = log;
    goto LABEL_17;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v11 = self;
    v12 = (objc_class *)objc_opt_class(v11);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if ((objc_opt_respondsToSelector(v11, "accessibilityIdentifier") & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusAnnotationsManager performSelector:](v11, "performSelector:", "accessibilityIdentifier"));
      v16 = v15;
      if (v15 && !objc_msgSend(v15, "isEqualToString:", v14))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v14, v11, v16));

        goto LABEL_8;
      }

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v14, v11));
LABEL_8:

    v18 = v17;
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uniqueRouteID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "UUIDString"));
    v20 = objc_msgSend(v5, "pointCount");
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute name](*p_route, "name"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute uniqueRouteID](*p_route, "uniqueRouteID"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "UUIDString"));
    v24 = -[GEOComposedRoute pointCount](*p_route, "pointCount");

    *(_DWORD *)buf = 138544898;
    v46 = v17;
    v47 = 2112;
    v48 = v40;
    v49 = 2112;
    v50 = v19;
    v51 = 2048;
    v52 = v20;
    v53 = 2112;
    v54 = v21;
    v55 = 2112;
    v56 = v23;
    v57 = 2048;
    v58 = v24;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[%{public}@] CarRouteGeniusAnnotationsManager: setRoute, new route (name: %@, id: %@, points: %lu) was considered equal to current route (name: %@, id: %@, points: %lu), we're not redrawing", buf, 0x48u);

  }
LABEL_18:

}

- (void)updateTrafficForRoute:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  CarRouteGeniusAnnotationsManager *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;

  v4 = a3;
  if (-[GEOComposedRoute _MapsCarPlay_isEqual:](self->_route, "_MapsCarPlay_isEqual:", v4))
  {
    v5 = sub_1004336BC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      -[GEOComposedRoute _maps_refreshTrafficIncidentsOnRoute](self->_route, "_maps_refreshTrafficIncidentsOnRoute");
      goto LABEL_10;
    }
    v7 = self;
    v8 = (objc_class *)objc_opt_class(v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusAnnotationsManager performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
      v12 = v11;
      if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

        goto LABEL_8;
      }

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_8:

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueRouteID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));
    *(_DWORD *)buf = 138543618;
    v17 = v13;
    v18 = 2112;
    v19 = v15;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] CarRouteGeniusAnnotationsManager: Will update traffic for route: %@", buf, 0x16u);

    goto LABEL_9;
  }
LABEL_10:

}

- (id)mapView
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "mapView"));

  return v3;
}

- (MKMapItem)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
  objc_storeStrong((id *)&self->_destination, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
}

@end
