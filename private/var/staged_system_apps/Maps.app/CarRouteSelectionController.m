@implementation CarRouteSelectionController

- (CarRouteSelectionController)initWithPlatformController:(id)a3 chromeViewController:(id)a4
{
  id v6;
  id v7;
  CarRouteSelectionController *v8;
  CarRouteSelectionController *v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  id v14;
  CarAlternateRouteItemsContainingView *v15;
  CarAlternateRouteItemsContainingView *routeItemContainingView;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CarRouteSelectionController;
  v8 = -[CarRouteSelectionController init](&v18, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_chromeViewController, v7);
    v10 = objc_storeWeak((id *)&v9->_platformController, v6);
    objc_msgSend(v6, "addObserver:", v9);

    v9->_focusedRouteIndex = 0x7FFFFFFFFFFFFFFFLL;
    WeakRetained = objc_loadWeakRetained((id *)&v9->_platformController);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "currentSession"));

    if (objc_msgSend(v12, "conformsToProtocol:", &OBJC_PROTOCOL___CarRouteSelectableSession))
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    -[CarRouteSelectionController setCurrentSession:](v9, "setCurrentSession:", v14);
    v15 = -[CarAlternateRouteItemsContainingView initWithDataSource:]([CarAlternateRouteItemsContainingView alloc], "initWithDataSource:", v9);
    routeItemContainingView = v9->_routeItemContainingView;
    v9->_routeItemContainingView = v15;

    -[CarAlternateRouteItemsContainingView setTranslatesAutoresizingMaskIntoConstraints:](v9->_routeItemContainingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }

  return v9;
}

- (void)dealloc
{
  id WeakRetained;
  id v4;
  void *v5;
  objc_super v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
  objc_msgSend(WeakRetained, "removeObserver:forKeyPath:", self, CFSTR("edgeInsets"));

  v4 = objc_loadWeakRetained((id *)&self->_platformController);
  objc_msgSend(v4, "removeObserver:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController currentSession](self, "currentSession"));
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)CarRouteSelectionController;
  -[CarRouteSelectionController dealloc](&v6, "dealloc");
}

- (void)_updateAlternateRouteItemContainingView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CarAlternateRouteItemsContainingView *routeItemContainingView;
  void *v8;
  id v9;
  NSObject *v10;
  CarRouteSelectionController *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;

  if (!self->_active)
  {
    -[CarAlternateRouteItemsContainingView removeFromSuperview](self->_routeItemContainingView, "removeFromSuperview");
    return;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController mapView](self, "mapView"));

  if (!v3)
  {
    v9 = sub_10043364C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_13:

      return;
    }
    v11 = self;
    v12 = (objc_class *)objc_opt_class(v11);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if ((objc_opt_respondsToSelector(v11, "accessibilityIdentifier") & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController performSelector:](v11, "performSelector:", "accessibilityIdentifier"));
      v16 = v15;
      if (v15 && !objc_msgSend(v15, "isEqualToString:", v14))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v14, v11, v16));

        goto LABEL_12;
      }

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v14, v11));
LABEL_12:

    *(_DWORD *)buf = 138543362;
    v20 = v17;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[%{public}@] CarRouteSelectionController: tried to insert _routeItemContainingView, but self.mapView is nil.", buf, 0xCu);

    goto LABEL_13;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlternateRouteItemsContainingView superview](self->_routeItemContainingView, "superview"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController mapView](self, "mapView"));

  if (v4 != v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController mapView](self, "mapView"));
    objc_msgSend(v6, "addSubview:", self->_routeItemContainingView);

    routeItemContainingView = self->_routeItemContainingView;
    v18 = (id)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController mapView](self, "mapView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlternateRouteItemsContainingView _maps_constraintsForCenteringInView:](routeItemContainingView, "_maps_constraintsForCenteringInView:"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v8);

  }
}

- (void)setActive:(BOOL)a3
{
  id v4;
  NSObject *v5;
  CarRouteSelectionController *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  __CFString *v18;

  if (self->_active != a3)
  {
    self->_active = a3;
    v4 = sub_10043364C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
LABEL_12:

      -[CarRouteSelectionController _updateAlternateRouteItemContainingView](self, "_updateAlternateRouteItemContainingView");
      -[CarRouteSelectionController _updateFocusItemsIfNeeded](self, "_updateFocusItemsIfNeeded");
      return;
    }
    v6 = self;
    v7 = (objc_class *)objc_opt_class(v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

    if (self->_active)
      v13 = CFSTR("YES");
    else
      v13 = CFSTR("NO");
    v14 = v13;
    *(_DWORD *)buf = 138543618;
    v16 = v12;
    v17 = 2112;
    v18 = v14;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] CarRouteSelectionController: setting active: %@", buf, 0x16u);

    goto LABEL_12;
  }
}

- (void)setMapView:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  id v8;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  v5 = obj;
  if (WeakRetained != obj)
  {
    v6 = objc_loadWeakRetained((id *)&self->_mapView);
    objc_msgSend(v6, "removeObserver:forKeyPath:", self, CFSTR("edgeInsets"));

    v7 = objc_storeWeak((id *)&self->_mapView, obj);
    objc_msgSend(obj, "addObserver:forKeyPath:options:context:", self, CFSTR("edgeInsets"), 3, off_1014A60B0);

    v8 = objc_loadWeakRetained((id *)&self->_mapView);
    if (v8)
      -[CarRouteSelectionController _updateAlternateRouteItemContainingView](self, "_updateAlternateRouteItemContainingView");
    else
      -[CarRouteSelectionController setActive:](self, "setActive:", 0);
    -[CarRouteSelectionController _updateFocusItemsIfNeeded](self, "_updateFocusItemsIfNeeded");
    v5 = obj;
  }

}

- (id)routeAnnotationsController
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "routeAnnotationsController"));

  return v3;
}

- (void)setCurrentSession:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_currentSession);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_currentSession);
    objc_msgSend(v5, "removeObserver:", self);

    v6 = objc_storeWeak((id *)&self->_currentSession, obj);
    objc_msgSend(obj, "addObserver:", self);

    -[CarRouteSelectionController _updateFocusItemsIfNeeded](self, "_updateFocusItemsIfNeeded");
  }

}

- (void)setFocusedRouteIndex:(unint64_t)a3
{
  void *v4;
  _QWORD v5[5];

  if (self->_focusedRouteIndex != a3)
  {
    self->_focusedRouteIndex = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController routeAnnotationsController](self, "routeAnnotationsController"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10031DBA8;
    v5[3] = &unk_1011B1920;
    v5[4] = a3;
    objc_msgSend(v4, "updateConfigurationWithBlock:", v5);

  }
}

- (void)setAlternateRouteFocusItems:(id)a3
{
  NSArray *v5;
  id WeakRetained;
  NSArray *v7;

  v5 = (NSArray *)a3;
  if (self->_alternateRouteFocusItems != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_alternateRouteFocusItems, a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
    objc_msgSend(WeakRetained, "setNeedsFocusUpdate");

    v5 = v7;
  }

}

- (NSArray)focusableRouteItems
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController routeAnnotationsController](self, "routeAnnotationsController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "configuration"));
  if (objc_msgSend(v4, "alternateRoutesEnabled"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController routes](self, "routes"));
    v6 = (unint64_t)objc_msgSend(v5, "count") < 2;

  }
  else
  {
    v6 = 1;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController alternateRouteFocusItems](self, "alternateRouteFocusItems"));
  v8 = &__NSArray0__struct;
  if (v7 && !v6)
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController alternateRouteFocusItems](self, "alternateRouteFocusItems"));

  return (NSArray *)v8;
}

- (NSArray)routes
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController currentSession](self, "currentSession"));
  v4 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  if (v6 && objc_msgSend(v6, "currentTransportType") != (id)1)
  {
    v9 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController currentSession](self, "currentSession"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentRouteCollection"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "routes"));

  }
  return (NSArray *)v9;
}

- (GEOComposedRoute)currentRoute
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController currentSession](self, "currentSession"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentRouteCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentRoute"));

  return (GEOComposedRoute *)v4;
}

- (void)_updateFocusItemsIfNeeded
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10031DE24;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)handleKnobPress:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  BOOL v20;
  CarRouteSelectionController *v21;
  CarRouteSelectionController *v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  id v29;
  CarRouteSelectionController *v30;
  CarRouteSelectionController *v31;
  objc_class *v32;
  NSString *v33;
  void *v34;
  void *v35;
  void *v36;
  __CFString *v37;
  CarRouteSelectionController *v38;
  CarRouteSelectionController *v39;
  objc_class *v40;
  NSString *v41;
  void *v42;
  void *v43;
  void *v44;
  __CFString *v45;
  uint64_t v46;
  _QWORD v48[4];
  NSObject *v49;
  __int128 *p_buf;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[4];
  __CFString *v56;
  __int16 v57;
  uint64_t v58;
  __int128 buf;
  uint64_t v60;
  uint64_t v61;
  _BYTE v62[128];

  v4 = a3;
  if (objc_msgSend(v4, "type") != (id)4)
  {
    v10 = 0;
    goto LABEL_49;
  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController focusableRouteItems](self, "focusableRouteItems"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v52;
LABEL_4:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v52 != v7)
        objc_enumerationMutation(v5);
      v9 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v8);
      if ((objc_msgSend(v9, "isFocused") & 1) != 0)
        break;
      if (v6 == (id)++v8)
      {
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
        if (v6)
          goto LABEL_4;
        goto LABEL_10;
      }
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "route"));

    if (!v11)
      goto LABEL_22;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v60 = 0x2020000000;
    v61 = 0x7FFFFFFFFFFFFFFFLL;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController routeAnnotationsController](self, "routeAnnotationsController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "configuration"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "routes"));
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_10031E414;
    v48[3] = &unk_1011B1948;
    v15 = v11;
    v49 = v15;
    p_buf = &buf;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v48);

    v16 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
    v17 = sub_10043364C();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = v18;
    v20 = v16 == 0x7FFFFFFFFFFFFFFFLL;
    v10 = v16 != 0x7FFFFFFFFFFFFFFFLL;
    if (!v20)
    {
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
LABEL_43:

        -[CarRouteSelectionController _selectRouteAtIndex:](self, "_selectRouteAtIndex:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 24));
LABEL_47:

        _Block_object_dispose(&buf, 8);
        goto LABEL_48;
      }
      v21 = self;
      v22 = v21;
      if (!v21)
      {
        v28 = CFSTR("<nil>");
        goto LABEL_42;
      }
      v23 = (objc_class *)objc_opt_class(v21);
      v24 = NSStringFromClass(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      if ((objc_opt_respondsToSelector(v22, "accessibilityIdentifier") & 1) != 0)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController performSelector:](v22, "performSelector:", "accessibilityIdentifier"));
        v27 = v26;
        if (v26 && (objc_msgSend(v26, "isEqualToString:", v25) & 1) == 0)
        {
          v28 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v25, v22, v27));

          goto LABEL_21;
        }

      }
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v25, v22));
LABEL_21:

LABEL_42:
      v46 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
      *(_DWORD *)v55 = 138543618;
      v56 = v28;
      v57 = 2048;
      v58 = v46;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[%{public}@] handleKnobPress: will attempt an alternate route with index: %lu", v55, 0x16u);

      goto LABEL_43;
    }
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
LABEL_46:

      goto LABEL_47;
    }
    v38 = self;
    v39 = v38;
    if (!v38)
    {
      v45 = CFSTR("<nil>");
      goto LABEL_45;
    }
    v40 = (objc_class *)objc_opt_class(v38);
    v41 = NSStringFromClass(v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    if ((objc_opt_respondsToSelector(v39, "accessibilityIdentifier") & 1) != 0)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController performSelector:](v39, "performSelector:", "accessibilityIdentifier"));
      v44 = v43;
      if (v43 && (objc_msgSend(v43, "isEqualToString:", v42) & 1) == 0)
      {
        v45 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v42, v39, v44));

        goto LABEL_37;
      }

    }
    v45 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v42, v39));
LABEL_37:

LABEL_45:
    *(_DWORD *)v55 = 138543362;
    v56 = v45;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "[%{public}@] CarRouteSelectionController: Failed to find a route associated with focused route item in routeAnnotationsController.", v55, 0xCu);

    goto LABEL_46;
  }
LABEL_10:

LABEL_22:
  v29 = sub_10043364C();
  v15 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v30 = self;
    v31 = v30;
    if (!v30)
    {
      v37 = CFSTR("<nil>");
      goto LABEL_39;
    }
    v32 = (objc_class *)objc_opt_class(v30);
    v33 = NSStringFromClass(v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    if ((objc_opt_respondsToSelector(v31, "accessibilityIdentifier") & 1) != 0)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController performSelector:](v31, "performSelector:", "accessibilityIdentifier"));
      v36 = v35;
      if (v35 && !objc_msgSend(v35, "isEqualToString:", v34))
      {
        v37 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v34, v31, v36));

        goto LABEL_29;
      }

    }
    v37 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v34, v31));
LABEL_29:

LABEL_39:
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v37;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "[%{public}@] CarRouteSelectionController: Didn't find a focused alternate route item for knob press.", (uint8_t *)&buf, 0xCu);

  }
  v10 = 0;
LABEL_48:

LABEL_49:
  return v10;
}

- (CGRect)_frameForRoute:(id)a3 offset:(unint64_t)a4
{
  MKMapView **p_mapView;
  id WeakRetained;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double x;
  CGFloat MinY;
  double Height;
  double width;
  double v29;
  double v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect result;

  p_mapView = &self->_mapView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)p_mapView);
    objc_msgSend(v7, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v16 = objc_loadWeakRetained((id *)p_mapView);
    objc_msgSend(v16, "_edgeInsets");
    v18 = v9 + v17;
    v20 = v11 + v19;
    v22 = v13 - (v17 + v21);
    v24 = v15 - (v19 + v23);

    v31.origin.x = v18;
    v31.origin.y = v20;
    v31.size.width = v22;
    v31.size.height = v24;
    x = CGRectGetMidX(v31) + (double)a4;
    v32.origin.x = v18;
    v32.origin.y = v20;
    v32.size.width = v22;
    v32.size.height = v24;
    MinY = CGRectGetMinY(v32);
    v33.origin.x = v18;
    v33.origin.y = v20;
    v33.size.width = v22;
    v33.size.height = v24;
    Height = CGRectGetHeight(v33);
    width = 10.0;
  }
  else
  {
    x = CGRectZero.origin.x;
    MinY = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    Height = CGRectZero.size.height;
  }
  v29 = x;
  v30 = MinY;
  result.size.height = Height;
  result.size.width = width;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (void)_rebuildAlternateRouteFocusItems
{
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  CarRouteSelectionController *v7;
  CarRouteSelectionController *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  CarRouteSelectionController *v20;
  CarRouteSelectionController *v21;
  objc_class *v22;
  NSString *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  unsigned int v28;
  __CFString *v29;
  __CFString *v30;
  void *v31;
  __CFString *v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  CarRouteSelectionController *v40;
  _QWORD v41[5];
  _QWORD v42[5];
  uint8_t buf[4];
  __CFString *v44;
  __int16 v45;
  __CFString *v46;
  __int16 v47;
  id v48;

  if (!-[CarRouteSelectionController isActive](self, "isActive")
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController routes](self, "routes")),
        v4 = objc_msgSend(v3, "count"),
        v3,
        (unint64_t)v4 <= 1))
  {
    v5 = sub_10043364C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_23:

      -[CarRouteSelectionController setAlternateRouteFocusItems:](self, "setAlternateRouteFocusItems:", 0);
      return;
    }
    v7 = self;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_20;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_10;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_10:

LABEL_20:
    v28 = -[CarRouteSelectionController isActive](v8, "isActive");
    v29 = CFSTR("NO");
    if (v28)
      v29 = CFSTR("YES");
    v30 = v29;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController routes](v8, "routes"));
    *(_DWORD *)buf = 138543874;
    v44 = v14;
    v45 = 2112;
    v46 = v30;
    v47 = 2048;
    v48 = objc_msgSend(v31, "count");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] CarRouteSelectionController: Not rebuilding alternate route items. Reson: active: %@, routesCount: %lu", buf, 0x20u);

    goto LABEL_23;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController routes](self, "routes"));
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_10031E9E4;
  v42[3] = &unk_1011B1970;
  v42[4] = self;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v42));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "filteredArrayUsingPredicate:", v16));

  v18 = sub_10043364C();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = self;
    v21 = v20;
    if (!v20)
    {
      v27 = CFSTR("<nil>");
      goto LABEL_25;
    }
    v22 = (objc_class *)objc_opt_class(v20);
    v23 = NSStringFromClass(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    if ((objc_opt_respondsToSelector(v21, "accessibilityIdentifier") & 1) != 0)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController performSelector:](v21, "performSelector:", "accessibilityIdentifier"));
      v26 = v25;
      if (v25 && !objc_msgSend(v25, "isEqualToString:", v24))
      {
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v24, v21, v26));

        goto LABEL_18;
      }

    }
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v24, v21));
LABEL_18:

LABEL_25:
    v32 = (__CFString *)objc_msgSend(v17, "count");
    *(_DWORD *)buf = 138543618;
    v44 = v27;
    v45 = 2048;
    v46 = v32;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[%{public}@] CarRouteSelectionController: Rebuilding alternate route items. Alternate routes count: %lu", buf, 0x16u);

  }
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_10031EA40;
  v41[3] = &unk_1011B1998;
  v41[4] = self;
  v33 = sub_10039DCD4(v17, v41);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10031EA68;
  v38[3] = &unk_1011B19C0;
  v39 = (id)objc_claimAutoreleasedReturnValue(v33);
  v40 = self;
  v34 = v39;
  v35 = sub_10039DCD4(v17, v38);
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "sortedArrayUsingComparator:", &stru_1011B1A00));
  -[CarRouteSelectionController setAlternateRouteFocusItems:](self, "setAlternateRouteFocusItems:", v37);

}

- (void)_updateRouteFrames
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController alternateRouteFocusItems](self, "alternateRouteFocusItems"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10031EBF4;
  v4[3] = &unk_1011B1A28;
  v4[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

- (void)_selectRouteAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  NSObject *v14;
  CarRouteSelectionController *v15;
  CarRouteSelectionController *v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  uint64_t v24;
  int isKindOfClass;
  id WeakRetained;
  void *v27;
  void *v28;
  unsigned int v29;
  id v30;
  NSObject *v31;
  CarRouteSelectionController *v32;
  CarRouteSelectionController *v33;
  objc_class *v34;
  NSString *v35;
  void *v36;
  void *v37;
  void *v38;
  __CFString *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  uint8_t buf[4];
  __CFString *v48;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController routeAnnotationsController](self, "routeAnnotationsController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configuration"));

  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routes"));
    v8 = objc_msgSend(v7, "count");

    if ((unint64_t)v8 > a3)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routes"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", a3));

      if (objc_msgSend(v6, "selectedRouteIndex") == (id)a3
        || (v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController currentRoute](self, "currentRoute")),
            v12 = objc_msgSend(v11, "isEqual:", v10),
            v11,
            v12))
      {
        v13 = sub_10043364C();
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
LABEL_26:

LABEL_29:
          goto LABEL_30;
        }
        v15 = self;
        v16 = v15;
        if (!v15)
        {
          v22 = CFSTR("<nil>");
          goto LABEL_25;
        }
        v17 = (objc_class *)objc_opt_class(v15);
        v18 = NSStringFromClass(v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        if ((objc_opt_respondsToSelector(v16, "accessibilityIdentifier") & 1) != 0)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController performSelector:](v16, "performSelector:", "accessibilityIdentifier"));
          v21 = v20;
          if (v20 && !objc_msgSend(v20, "isEqualToString:", v19))
          {
            v22 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v19, v16, v21));

            goto LABEL_12;
          }

        }
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v19, v16));
LABEL_12:

LABEL_25:
        *(_DWORD *)buf = 138543362;
        v48 = v22;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "[%{public}@] CarRouteSelectionController attempted to select alternate route which is already selected.", buf, 0xCu);

        goto LABEL_26;
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController currentSession](self, "currentSession"));
      v24 = objc_opt_class(NavigationSession);
      isKindOfClass = objc_opt_isKindOfClass(v23, v24);

      if ((isKindOfClass & 1) != 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "navigationDisplay"));
        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "trafficAlert"));

        if (-[NSObject alertType](v14, "alertType") == (id)1)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject originalRoute](v14, "originalRoute"));
          v29 = objc_msgSend(v28, "isEqual:", v10);

          if (v29)
          {
            v30 = sub_10043364C();
            v31 = objc_claimAutoreleasedReturnValue(v30);
            if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            {
LABEL_34:

              goto LABEL_26;
            }
            v32 = self;
            v33 = v32;
            if (!v32)
            {
              v39 = CFSTR("<nil>");
              goto LABEL_33;
            }
            v34 = (objc_class *)objc_opt_class(v32);
            v35 = NSStringFromClass(v34);
            v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
            if ((objc_opt_respondsToSelector(v33, "accessibilityIdentifier") & 1) != 0)
            {
              v37 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController performSelector:](v33, "performSelector:", "accessibilityIdentifier"));
              v38 = v37;
              if (v37 && !objc_msgSend(v37, "isEqualToString:", v36))
              {
                v39 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v36, v33, v38));

                goto LABEL_23;
              }

            }
            v39 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v36, v33));
LABEL_23:

LABEL_33:
            *(_DWORD *)buf = 138543362;
            v48 = v39;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "[%{public}@] CarRouteSelectionController attempted to select LAR with MNTrafficIncidentAlertType_Blockage, ignoring.", buf, 0xCu);

            goto LABEL_34;
          }
        }
        v40 = objc_loadWeakRetained((id *)&self->_chromeViewController);
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "navigationDisplay"));
        objc_msgSend(v41, "setTemporaryDisplayRate:forDuration:", -1, -1.0);

      }
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController currentSession](self, "currentSession"));
      objc_msgSend(v42, "selectRoute:", v10);

      -[CarRouteSelectionController setFocusedRouteIndex:](self, "setFocusedRouteIndex:", 0x7FFFFFFFFFFFFFFFLL);
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController currentSession](self, "currentSession"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "currentRouteCollection"));
      v45 = objc_msgSend(v44, "indexOfRoute:", v10);

      v46 = objc_loadWeakRetained((id *)&self->_chromeViewController);
      objc_msgSend(v46, "captureUserAction:selectedRouteIndex:", 3015, v45);

      goto LABEL_29;
    }
  }
LABEL_30:

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  objc_super v16;

  v10 = a3;
  if (off_1014A60B0 == a6)
  {
    v12 = a5;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", NSKeyValueChangeOldKey));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));

    if (v13 == v14 || !objc_msgSend(v10, "isEqualToString:", CFSTR("edgeInsets")))
    {

    }
    else
    {
      v15 = -[CarRouteSelectionController isActive](self, "isActive");

      if ((v15 & 1) != 0)
        -[CarRouteSelectionController _updateRouteFrames](self, "_updateRouteFrames");
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)CarRouteSelectionController;
    v11 = a5;
    -[CarRouteSelectionController observeValueForKeyPath:ofObject:change:context:](&v16, "observeValueForKeyPath:ofObject:change:context:", v10, a4, v11, a6);

  }
}

- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  Block_layout *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  CarRouteSelectionController *v16;
  CarRouteSelectionController *v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  id v24;
  CarRouteSelectionController *v25;
  CarRouteSelectionController *v26;
  objc_class *v27;
  NSString *v28;
  void *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  NSString *v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  __CFString *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  CGPoint v42;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController routeAnnotationsController](self, "routeAnnotationsController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configuration"));

  if ((objc_msgSend(v9, "alternateRoutesEnabled") & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "routes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectedRoute"));
    v12 = &stru_1011B7C58;
    v13 = objc_claimAutoreleasedReturnValue(+[RouteAnnotationsResponder routeAtPoint:inMapView:withRoutes:selectedRoute:overlappingRouteSelectorBlock:](RouteAnnotationsResponder, "routeAtPoint:inMapView:withRoutes:selectedRoute:overlappingRouteSelectorBlock:", v7, v10, v11, &stru_1011B7C58, x, y));

    v14 = sub_10043364C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
LABEL_20:

      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "routes"));
      -[CarRouteSelectionController _selectRouteAtIndex:](self, "_selectRouteAtIndex:", objc_msgSend(v35, "indexOfObject:", v13));

      goto LABEL_23;
    }
    v16 = self;
    v17 = v16;
    if (!v16)
    {
      v23 = CFSTR("<nil>");
      goto LABEL_19;
    }
    v18 = (objc_class *)objc_opt_class(v16);
    v19 = NSStringFromClass(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if ((objc_opt_respondsToSelector(v17, "accessibilityIdentifier") & 1) != 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController performSelector:](v17, "performSelector:", "accessibilityIdentifier"));
      v22 = v21;
      if (v21 && !objc_msgSend(v21, "isEqualToString:", v20))
      {
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v20, v17, v22));

        goto LABEL_9;
      }

    }
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v20, v17));
LABEL_9:

LABEL_19:
    v42.x = x;
    v42.y = y;
    v33 = NSStringFromCGPoint(v42);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    *(_DWORD *)buf = 138543874;
    v37 = v23;
    v38 = 2112;
    v39 = v34;
    v40 = 2048;
    v41 = -[NSObject _maps_routeIndex](v13, "_maps_routeIndex");
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}@] didTapMapView:atPoint: %@. selectedRoute.routeIndex: %lu", buf, 0x20u);

    goto LABEL_20;
  }
  v24 = sub_10043364C();
  v13 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v25 = self;
    v26 = v25;
    if (!v25)
    {
      v32 = CFSTR("<nil>");
      goto LABEL_22;
    }
    v27 = (objc_class *)objc_opt_class(v25);
    v28 = NSStringFromClass(v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    if ((objc_opt_respondsToSelector(v26, "accessibilityIdentifier") & 1) != 0)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController performSelector:](v26, "performSelector:", "accessibilityIdentifier"));
      v31 = v30;
      if (v30 && !objc_msgSend(v30, "isEqualToString:", v29))
      {
        v32 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v29, v26, v31));

        goto LABEL_17;
      }

    }
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v29, v26));
LABEL_17:

LABEL_22:
    *(_DWORD *)buf = 138543362;
    v37 = v32;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}@] didTapMapView:atPoint: alternate routes were not enabled, ignoring call", buf, 0xCu);

  }
LABEL_23:

}

- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4
{
  return objc_msgSend(a4, "isRouteEta", a3);
}

- (void)mapView:(id)a3 didSelectLabelMarker:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v9 = a4;
  if (objc_msgSend(v9, "isRouteEta"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController routeAnnotationsController](self, "routeAnnotationsController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configuration"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routes"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10031F6A0;
    v10[3] = &unk_1011B1A50;
    v11 = v9;
    v8 = objc_msgSend(v7, "indexOfObjectPassingTest:", v10);

    -[CarRouteSelectionController _selectRouteAtIndex:](self, "_selectRouteAtIndex:", v8);
  }

}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  void *v6;
  id v7;
  id v8;

  v8 = a5;
  if (objc_msgSend(v8, "conformsToProtocol:", &OBJC_PROTOCOL___CarRouteSelectableSession))
    v6 = v8;
  else
    v6 = 0;
  v7 = v6;
  -[CarRouteSelectionController setCurrentSession:](self, "setCurrentSession:", v7);

}

- (void)routeItemDidUpdateFocus:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((objc_msgSend(v8, "isFocused") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteSelectionController routeAnnotationsController](self, "routeAnnotationsController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "route"));
    -[CarRouteSelectionController setFocusedRouteIndex:](self, "setFocusedRouteIndex:", objc_msgSend(v6, "indexOfObject:", v7));

  }
  else
  {
    -[CarRouteSelectionController setFocusedRouteIndex:](self, "setFocusedRouteIndex:", 0x7FFFFFFFFFFFFFFFLL);
  }

}

- (BOOL)isActive
{
  return self->_active;
}

- (MKMapView)mapView
{
  return (MKMapView *)objc_loadWeakRetained((id *)&self->_mapView);
}

- (CarRouteSelectableSession)currentSession
{
  return (CarRouteSelectableSession *)objc_loadWeakRetained((id *)&self->_currentSession);
}

- (unint64_t)focusedRouteIndex
{
  return self->_focusedRouteIndex;
}

- (NSArray)alternateRouteFocusItems
{
  return self->_alternateRouteFocusItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateRouteFocusItems, 0);
  objc_destroyWeak((id *)&self->_currentSession);
  objc_destroyWeak((id *)&self->_mapView);
  objc_storeStrong((id *)&self->_routeItemContainingView, 0);
  objc_destroyWeak((id *)&self->_platformController);
  objc_destroyWeak((id *)&self->_chromeViewController);
}

@end
