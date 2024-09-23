@implementation RouteAnnotationTextUpdater

- (RouteAnnotationTextUpdater)initWithRouteWaypoint:(id)a3 mapView:(id)a4
{
  id v6;
  id v7;
  RouteAnnotationTextUpdater *v8;
  id v9;
  NSObject *v10;
  _QWORD block[4];
  RouteAnnotationTextUpdater *v13;
  objc_super v14;
  uint8_t buf[4];
  RouteAnnotationTextUpdater *v16;
  __int16 v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RouteAnnotationTextUpdater;
  v8 = -[RouteAnnotationTextUpdater init](&v14, "init");
  if (v8)
  {
    v9 = sub_1007F1494();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349314;
      v16 = v8;
      v17 = 2112;
      v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] Initializing for waypoint: %@", buf, 0x16u);
    }

    objc_storeWeak((id *)&v8->_waypoint, v6);
    objc_storeWeak((id *)&v8->_mapView, v7);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1007F14D4;
    block[3] = &unk_1011AC860;
    v13 = v8;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  return v8;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  objc_super v6;
  uint8_t buf[4];
  RouteAnnotationTextUpdater *v8;
  __int16 v9;
  id v10;

  v3 = sub_1007F1494();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_waypoint);
    *(_DWORD *)buf = 134349314;
    v8 = self;
    v9 = 2112;
    v10 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating for waypoint: %@", buf, 0x16u);

  }
  v6.receiver = self;
  v6.super_class = (Class)RouteAnnotationTextUpdater;
  -[RouteAnnotationTextUpdater dealloc](&v6, "dealloc");
}

- (void)_updateAnnotationText
{
  const char *label;
  const char *v4;
  BOOL v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char *v12;
  id v13;
  NSObject *v14;
  id v15;
  double v16;
  id v17;
  NSObject *v18;
  _BOOL4 v19;
  double v20;
  GCDTimer *v21;
  GCDTimer *v22;
  id v23;
  NSObject *v24;
  GCDTimer *v25;
  GCDTimer *timer;
  id v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  RouteAnnotationTextUpdater *v31;
  _QWORD v32[4];
  id v33;
  double v34;
  uint8_t buf[4];
  RouteAnnotationTextUpdater *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  _BYTE v40[14];
  __int16 v41;
  const char *v42;
  __int16 v43;
  const char *v44;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v27 = sub_1004318FC();
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v36 = (RouteAnnotationTextUpdater *)"-[RouteAnnotationTextUpdater _updateAnnotationText]";
        v37 = 2080;
        v38 = "RouteAnnotationsController.m";
        v39 = 1024;
        *(_DWORD *)v40 = 94;
        *(_WORD *)&v40[4] = 2080;
        *(_QWORD *)&v40[6] = "dispatch_get_main_queue()";
        v41 = 2080;
        v42 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v43 = 2080;
        v44 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v29 = sub_1004318FC();
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = (RouteAnnotationTextUpdater *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v36 = v31;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_waypoint);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v34 = 0.0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "waypoint"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "location"));
    objc_msgSend(v9, "timestamp");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v12 = (char *)objc_claimAutoreleasedReturnValue(+[NSDateComponentsFormatter _mapkit_descriptionForTimeSinceDate:referenceDate:smallestUnit:timeUntilNextUpdate:](NSDateComponentsFormatter, "_mapkit_descriptionForTimeSinceDate:referenceDate:smallestUnit:timeUntilNextUpdate:", v10, v11, 64, &v34));

    v13 = sub_1007F1494();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349570;
      v36 = self;
      v37 = 2112;
      v38 = v12;
      v39 = 2048;
      *(double *)v40 = v34;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[%{public}p] Setting annotation text to: %@ with next update in: %f seconds", buf, 0x20u);
    }

    objc_msgSend(v7, "setAnnotationText:", v12);
    v15 = objc_loadWeakRetained((id *)&self->_mapView);
    objc_msgSend(v15, "forceLayout");

    v16 = v34;
    v17 = sub_1007F1494();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
    if (v16 <= 0.0)
    {
      if (v19)
      {
        *(_DWORD *)buf = 134349056;
        v36 = self;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%{public}p] No next update provided; stopping timer",
          buf,
          0xCu);
      }

      timer = self->_timer;
      self->_timer = 0;

    }
    else
    {
      if (v19)
      {
        *(_DWORD *)buf = 134349056;
        v36 = self;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%{public}p] Starting annotation text updating timer", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      v20 = v34;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1007F1A88;
      v32[3] = &unk_1011AE190;
      objc_copyWeak(&v33, (id *)buf);
      v21 = (GCDTimer *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v32, v20));
      v22 = self->_timer;
      self->_timer = v21;

      objc_destroyWeak(&v33);
      objc_destroyWeak((id *)buf);
    }

  }
  else
  {
    v23 = sub_1007F1494();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v36 = self;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "[%{public}p] Lost waypoint; stopping timer",
        buf,
        0xCu);
    }

    v25 = self->_timer;
    self->_timer = 0;

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapView);
  objc_destroyWeak((id *)&self->_waypoint);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
