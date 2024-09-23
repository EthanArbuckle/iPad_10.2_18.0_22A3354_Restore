@implementation ChromeMapSelectionHandler

- (ChromeMapSelectionHandler)initWithChromeViewController:(id)a3
{
  id v4;
  ChromeMapSelectionHandler *v5;
  ChromeMapSelectionHandler *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ChromeMapSelectionHandler;
  v5 = -[ChromeMapSelectionHandler init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_chromeViewController, v4);
    objc_storeStrong((id *)&v6->_protocol, &OBJC_PROTOCOL___ChromeMapSelectionDelegate);
  }

  return v6;
}

- (BOOL)mapSelectionManager:(id)a3 shouldSelectVKLabelMarker:(id)a4
{
  void *v5;
  unsigned int v6;
  BOOL v7;
  char v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSelectionHandler _invocationWithSelector:argument:](self, "_invocationWithSelector:argument:", "chromeShouldAllowSelectingLabelMarker:", a4));
  v6 = -[ChromeMapSelectionHandler _propagateShouldSelectInvocation:](self, "_propagateShouldSelectInvocation:", v5);
  v7 = 1;
  if (v6)
  {
    v9 = 1;
    objc_msgSend(v5, "getReturnValue:", &v9);
    v7 = v9 != 0;
  }

  return v7;
}

- (void)mapSelectionManager:(id)a3 selectVKLabelMarker:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  if (!-[ChromeMapSelectionHandler _checkAndPropagateSpecificCallbacksForMarker:](self, "_checkAndPropagateSpecificCallbacksForMarker:"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSelectionHandler _invocationWithSelector:argument:](self, "_invocationWithSelector:argument:", "chromeDidSelectLabelMarker:", v6));
    -[ChromeMapSelectionHandler _propagateDidSelectInvocation:](self, "_propagateDidSelectInvocation:", v5);

  }
}

- (BOOL)_checkAndPropagateSpecificCallbacksForMarker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  ChromeMapSelectionHandler *v12;
  id v13;
  const char *v14;
  ChromeMapSelectionHandler *v15;
  id v16;
  BOOL v17;
  const char *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  char **v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  void *v33;
  id v34;
  NSObject *v35;
  id v36;
  NSObject *v37;
  void *v38;
  id v39;
  NSObject *v40;
  id v41;
  NSObject *v42;
  void *v43;
  id v44;
  NSObject *v45;
  id v46;
  NSObject *v47;
  void *v48;
  id v49;
  NSObject *v50;
  id v51;
  NSObject *v52;
  void *v53;
  id v54;
  _BYTE buf[12];
  __int16 v56;
  const char *v57;
  __int16 v58;
  int v59;
  __int16 v60;
  const char *v61;

  v4 = a3;
  if (!objc_msgSend(v4, "_maps_hasCustomPOIAnnotation"))
  {
    if (objc_msgSend(v4, "isRouteEta"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeInfo"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "route"));

      if (!v5)
      {
        v34 = sub_1004318FC();
        v35 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = "-[ChromeMapSelectionHandler _checkAndPropagateSpecificCallbacksForMarker:]";
          v56 = 2080;
          v57 = "ChromeMapSelectionHandler.m";
          v58 = 1024;
          v59 = 99;
          v60 = 2080;
          v61 = "route != nil";
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
        }

        if (sub_100A70734())
        {
          v36 = sub_1004318FC();
          v37 = objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v38;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

          }
        }
      }
      v11 = "chromeDidSelectETAMarkerForRoute:";
      goto LABEL_8;
    }
    if (objc_msgSend(v4, "isFlyoverTour"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "flyoverTourIdentifier"));
      if (!v5)
      {
        v39 = sub_1004318FC();
        v40 = objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = "-[ChromeMapSelectionHandler _checkAndPropagateSpecificCallbacksForMarker:]";
          v56 = 2080;
          v57 = "ChromeMapSelectionHandler.m";
          v58 = 1024;
          v59 = 106;
          v60 = 2080;
          v61 = "identifier != nil";
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
        }

        if (sub_100A70734())
        {
          v41 = sub_1004318FC();
          v42 = objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v43;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

          }
        }
      }
      v11 = "chromeDidSelectFlyoverTourLabelMarker:";
LABEL_16:
      v12 = self;
      v13 = v4;
      goto LABEL_17;
    }
    if (objc_msgSend(v4, "isTransitLine"))
    {
      v19 = "chromeDidSelectTransitLineMarker:";
LABEL_24:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSelectionHandler _invocationWithSelector:argument:](self, "_invocationWithSelector:argument:", v19, v4));
      v17 = -[ChromeMapSelectionHandler _propagateDidSelectInvocation:](self, "_propagateDidSelectInvocation:", v5);
      goto LABEL_20;
    }
    if (objc_msgSend(v4, "isTrafficIncident"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "incident"));
      if (!v5)
      {
        v44 = sub_1004318FC();
        v45 = objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = "-[ChromeMapSelectionHandler _checkAndPropagateSpecificCallbacksForMarker:]";
          v56 = 2080;
          v57 = "ChromeMapSelectionHandler.m";
          v58 = 1024;
          v59 = 118;
          v60 = 2080;
          v61 = "trafficIncident";
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
        }

        if (sub_100A70734())
        {
          v46 = sub_1004318FC();
          v47 = objc_claimAutoreleasedReturnValue(v46);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v48;
            _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

          }
        }
      }
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSelectionHandler _invocationWithSelector:argument:](self, "_invocationWithSelector:argument:", "chromeDidSelectTrafficIncident:latitude:longitude:", v5));
      objc_msgSend(v4, "coordinate");
      v21 = v20;
      *(_QWORD *)buf = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      v54 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v21));
      objc_msgSend(v7, "setArgument:atIndex:", buf, 3);
      objc_msgSend(v7, "setArgument:atIndex:", &v54, 4);
      v17 = -[ChromeMapSelectionHandler _propagateDidSelectInvocation:](self, "_propagateDidSelectInvocation:", v7);

      goto LABEL_19;
    }
    if (objc_msgSend(v4, "isRouteWaypoint"))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "waypointInfo"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "waypoint"));

      if (!objc_msgSend(v5, "hasFindMyHandleID"))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addressBookAddress"));
        v7 = v24;
        if (v24 && (objc_msgSend(v24, "isMeCard") & 1) == 0)
        {
          v14 = "chromeDidSelectWaypointMarkerForAddress:";
          v15 = self;
          v16 = v7;
        }
        else
        {
          if (!objc_msgSend(v4, "featureID"))
          {
            v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_maps_mapItem"));
            if (v9)
            {
              v25 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSelectionHandler _invocationWithSelector:argument:](self, "_invocationWithSelector:argument:", "chromeDidSelectMarkerForMapItem:", v9));
              v17 = -[ChromeMapSelectionHandler _propagateDidSelectInvocation:](self, "_propagateDidSelectInvocation:", v25);

            }
            else
            {
              v17 = 0;
            }
            goto LABEL_12;
          }
          v14 = "chromeDidSelectRouteWaypointMarker:";
          v15 = self;
          v16 = v4;
        }
        goto LABEL_10;
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "findMyHandleID"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSelectionHandler _invocationWithSelector:argument:](self, "_invocationWithSelector:argument:", "chromeDidSelectWaypointMarkerForFindMyHandleIdentifier:", v23));

LABEL_18:
      v17 = -[ChromeMapSelectionHandler _propagateDidSelectInvocation:](self, "_propagateDidSelectInvocation:", v7);
      goto LABEL_19;
    }
    if (objc_msgSend(v4, "isRouteAnnotation"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_maps_selectableRouteAnnotations"));
      if (!objc_msgSend(v5, "count"))
      {
        v49 = sub_1004318FC();
        v50 = objc_claimAutoreleasedReturnValue(v49);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = "-[ChromeMapSelectionHandler _checkAndPropagateSpecificCallbacksForMarker:]";
          v56 = 2080;
          v57 = "ChromeMapSelectionHandler.m";
          v58 = 1024;
          v59 = 159;
          v60 = 2080;
          v61 = "selectableAnnotations.count > 0";
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
        }

        if (sub_100A70734())
        {
          v51 = sub_1004318FC();
          v52 = objc_claimAutoreleasedReturnValue(v51);
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v53;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

          }
        }
      }
      v11 = "chromeDidSelectRouteAnnotations:";
      goto LABEL_8;
    }
    if ((objc_msgSend(v4, "_maps_isOfflineAnnotation") & 1) != 0
      || objc_msgSend(v4, "_maps_isOfflineClusterAnnotation"))
    {
      v19 = "chromeDidSelectOfflineAnnotationMarker:";
      goto LABEL_24;
    }
    v26 = objc_msgSend(v4, "isCluster");
    if ((_DWORD)v26)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clusterWaypointInfos"));
      if ((unint64_t)objc_msgSend(v5, "count") <= 1)
      {
        if (!objc_msgSend(v4, "clusterFeatureCount")
          || (objc_msgSend(v4, "_maps_isOfflineClusterAnnotation") & 1) != 0)
        {
          v17 = 0;
          goto LABEL_20;
        }
        v27 = &selRef_chromeDidSelectClusteredFeatureAnnotationsMarker_;
      }
      else
      {
        v27 = &selRef_chromeDidSelectClusteredWaypointMarker_;
      }
      v11 = *v27;
      goto LABEL_16;
    }
    if (MapsFeature_IsEnabled_ShelbyvilleSearch(v26))
    {
      if ((objc_msgSend(v4, "_mapkit_hasMUID") & 1) == 0)
        goto LABEL_57;
    }
    else if (!objc_msgSend(v4, "hasBusinessID"))
    {
      goto LABEL_57;
    }
    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_maps_mapItem"));
    if (v28)
    {
      v5 = (void *)v28;
      v11 = "chromeDidSelectMarkerForMapItem:";
LABEL_8:
      v12 = self;
      v13 = v5;
LABEL_17:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSelectionHandler _invocationWithSelector:argument:](v12, "_invocationWithSelector:argument:", v11, v13));
      goto LABEL_18;
    }
LABEL_57:
    v17 = 0;
    goto LABEL_21;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_maps_customPOIAnnotation"));
  if (!v5)
  {
    v29 = sub_1004318FC();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[ChromeMapSelectionHandler _checkAndPropagateSpecificCallbacksForMarker:]";
      v56 = 2080;
      v57 = "ChromeMapSelectionHandler.m";
      v58 = 1024;
      v59 = 85;
      v60 = 2080;
      v61 = "customPOI != nil";
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v31 = sub_1004318FC();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchResult"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "composedWaypoint"));

  if (!objc_msgSend(v7, "hasFindMyHandleID"))
  {
    v14 = "chromeDidSelectCustomPOIAnnotation:";
    v15 = self;
    v16 = v5;
LABEL_10:
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSelectionHandler _invocationWithSelector:argument:](v15, "_invocationWithSelector:argument:", v14, v16));
    goto LABEL_11;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "findMyHandleID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSelectionHandler _invocationWithSelector:argument:](self, "_invocationWithSelector:argument:", "chromeDidSelectWaypointMarkerForFindMyHandleIdentifier:", v8));

LABEL_11:
  v17 = -[ChromeMapSelectionHandler _propagateDidSelectInvocation:](self, "_propagateDidSelectInvocation:", v9);
LABEL_12:

LABEL_19:
LABEL_20:

LABEL_21:
  return v17;
}

- (BOOL)mapSelectionManager:(id)a3 shouldSelectAnnotationView:(id)a4
{
  void *v5;
  unsigned int v6;
  BOOL v7;
  char v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSelectionHandler _invocationWithSelector:argument:](self, "_invocationWithSelector:argument:", "chromeShouldAllowSelectingAnnotationView:", a4));
  v6 = -[ChromeMapSelectionHandler _propagateShouldSelectInvocation:](self, "_propagateShouldSelectInvocation:", v5);
  v7 = 1;
  if (v6)
  {
    v9 = 1;
    objc_msgSend(v5, "getReturnValue:", &v9);
    v7 = v9 != 0;
  }

  return v7;
}

- (void)mapSelectionManager:(id)a3 selectAnnotationView:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  if (!-[ChromeMapSelectionHandler _checkAndPropagateSpecificCallbacksForAnnotationView:](self, "_checkAndPropagateSpecificCallbacksForAnnotationView:"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSelectionHandler _invocationWithSelector:argument:](self, "_invocationWithSelector:argument:", "chromeDidSelectAnnotationView:", v6));
    -[ChromeMapSelectionHandler _propagateDidSelectInvocation:](self, "_propagateDidSelectInvocation:", v5);

  }
}

- (BOOL)_checkAndPropagateSpecificCallbacksForAnnotationView:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "annotation"));
  v5 = objc_opt_class(MKUserLocation);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSelectionHandler _invocationWithSelector:argument:](self, "_invocationWithSelector:argument:", "chromeDidSelectUserLocationAnnotation:", v4));
    v7 = -[ChromeMapSelectionHandler _propagateDidSelectInvocation:](self, "_propagateDidSelectInvocation:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)mapSelectionManagerClearSelection:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ChromeMapSelectionHandler _invocationWithSelector:argument:](self, "_invocationWithSelector:argument:", "chromeDidClearMapSelection", 0));
  -[ChromeMapSelectionHandler _propagateDidSelectInvocation:](self, "_propagateDidSelectInvocation:", v4);

}

- (id)searchPinsManagerForMapSelectionManager:(id)a3
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "searchPinsManager"));

  return v4;
}

- (int)currentUITargetForAnalytics
{
  ChromeViewController **p_chromeViewController;
  id WeakRetained;
  unsigned int v4;
  id v5;
  int v6;

  p_chromeViewController = &self->_chromeViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v4 = objc_msgSend(WeakRetained, "conformsToProtocol:", &OBJC_PROTOCOL___GEOLogContextDelegate);

  if (!v4)
    return 0;
  v5 = objc_loadWeakRetained((id *)p_chromeViewController);
  if ((objc_opt_respondsToSelector(v5, "currentUITargetForAnalytics") & 1) != 0)
    v6 = objc_msgSend(v5, "currentUITargetForAnalytics");
  else
    v6 = 0;

  return v6;
}

- (int)currentMapViewTargetForAnalytics
{
  ChromeViewController **p_chromeViewController;
  id WeakRetained;
  unsigned int v4;
  id v5;
  int v6;

  p_chromeViewController = &self->_chromeViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v4 = objc_msgSend(WeakRetained, "conformsToProtocol:", &OBJC_PROTOCOL___GEOLogContextDelegate);

  if (!v4)
    return 0;
  v5 = objc_loadWeakRetained((id *)p_chromeViewController);
  if ((objc_opt_respondsToSelector(v5, "currentMapViewTargetForAnalytics") & 1) != 0)
    v6 = objc_msgSend(v5, "currentMapViewTargetForAnalytics");
  else
    v6 = 0;

  return v6;
}

- (id)_invocationWithSelector:(SEL)a3 argument:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  char *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;

  v6 = a4;
  v15 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSelectionHandler protocolMethodSignatureForSelector:](self, "protocolMethodSignatureForSelector:", a3));
  if (!v7)
  {
    v10 = sub_1004318FC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v17 = "-[ChromeMapSelectionHandler _invocationWithSelector:argument:]";
      v18 = 2080;
      v19 = "ChromeMapSelectionHandler.m";
      v20 = 1024;
      v21 = 275;
      v22 = 2080;
      v23 = "methodSignature != nil";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v12 = sub_1004318FC();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v17 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSInvocation invocationWithMethodSignature:](NSInvocation, "invocationWithMethodSignature:", v7));
  objc_msgSend(v8, "setSelector:", a3);
  if (v6)
    objc_msgSend(v8, "setArgument:atIndex:", &v15, 2);

  return v8;
}

- (id)protocolMethodSignatureForSelector:(SEL)a3
{
  char *types;
  objc_method_description MethodDescription;
  objc_method_description v7;
  void *v8;

  MethodDescription = protocol_getMethodDescription(self->_protocol, a3, 0, 1);
  types = MethodDescription.types;
  if (MethodDescription.name
    || (v7 = protocol_getMethodDescription(self->_protocol, a3, 1, 1), types = v7.types, v7.name))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMethodSignature signatureWithObjCTypes:](NSMethodSignature, "signatureWithObjCTypes:", types));
  }
  else
  {
    -[ChromeMapSelectionHandler doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a3);
    v8 = 0;
  }
  return v8;
}

- (BOOL)_propagateShouldSelectInvocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  char **v9;
  char **v10;
  char **v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  BOOL v16;
  int v17;
  id v18;
  NSObject *v19;
  ChromeMapSelectionHandler *v20;
  ChromeMapSelectionHandler *v21;
  objc_class *v22;
  NSString *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  id v28;
  NSObject *v29;
  ChromeMapSelectionHandler *v30;
  ChromeMapSelectionHandler *v31;
  objc_class *v32;
  NSString *v33;
  void *v34;
  void *v35;
  void *v36;
  __CFString *v37;
  __CFString *v38;
  id v39;
  void *v40;
  objc_class *v41;
  NSString *v42;
  void *v43;
  void *v44;
  void *v45;
  __CFString *v46;
  __CFString *v47;
  id v48;
  void *v49;
  objc_class *v50;
  NSString *v51;
  void *v52;
  void *v53;
  void *v54;
  __CFString *v55;
  const char *v56;
  NSString *v57;
  void *v58;
  NSString *v59;
  char *v60;
  id v61;
  id v62;
  NSObject *v63;
  ChromeMapSelectionHandler *v64;
  ChromeMapSelectionHandler *v65;
  objc_class *v66;
  NSString *v67;
  void *v68;
  void *v69;
  void *v70;
  __CFString *v71;
  __CFString *v72;
  id v73;
  void *v74;
  objc_class *v75;
  NSString *v76;
  void *v77;
  void *v78;
  void *v79;
  __CFString *v80;
  NSString *v81;
  char *v82;
  void *v83;
  id v84;
  NSObject *v85;
  ChromeMapSelectionHandler *v86;
  ChromeMapSelectionHandler *v87;
  objc_class *v88;
  NSString *v89;
  void *v90;
  void *v91;
  void *v92;
  __CFString *v93;
  BOOL v94;
  __CFString *v95;
  id v96;
  void *v97;
  objc_class *v98;
  NSString *v99;
  void *v100;
  void *v101;
  void *v102;
  __CFString *v103;
  const char *v104;
  NSString *v105;
  void *v106;
  id WeakRetained;
  id v109;
  ChromeMapSelectionHandler *v110;
  id obj;
  char *v112;
  uint64_t v113;
  char *v114;
  id v115;
  char *v116;
  const char *aSelector;
  char v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  unsigned __int8 v123;
  uint8_t buf[4];
  __CFString *v125;
  __int16 v126;
  __CFString *v127;
  __int16 v128;
  const char *v129;
  __int16 v130;
  void *v131;
  _BYTE v132[128];

  v4 = a3;
  v123 = 1;
  v110 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "contexts"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "reverseObjectEnumerator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));

  aSelector = (const char *)objc_msgSend(v4, "selector");
  v119 = 0u;
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  obj = v7;
  v115 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v132, 16);
  v8 = 0;
  if (v115)
  {
    v9 = &selRef_maneuverViewTopMarginForSign_;
    v10 = &selRef__updateNavigationDisplayConfigurationForDisplayedStep_;
    v113 = *(_QWORD *)v120;
    v11 = &selRef_viewControllerPresentPOIEnrichmentWithCoordinator_;
    v109 = v4;
    do
    {
      v12 = 0;
      v116 = v9[102];
      v112 = v10[486];
      v114 = v11[181];
      do
      {
        if (*(_QWORD *)v120 != v113)
          objc_enumerationMutation(obj);
        v13 = *(id *)(*((_QWORD *)&v119 + 1) + 8 * (_QWORD)v12);
        v14 = v13;
        if ((objc_opt_respondsToSelector(v13, v116) & 1) != 0)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mapSelectionDelegate"));

        }
        if ((objc_opt_respondsToSelector(v14, aSelector) & 1) == 0)
        {
          v28 = sub_1004C5118();
          v29 = objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            v30 = v110;
            v31 = v30;
            if (v110)
            {
              v32 = (objc_class *)objc_opt_class(v30);
              v33 = NSStringFromClass(v32);
              v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
              if ((objc_opt_respondsToSelector(v31, v112) & 1) == 0)
                goto LABEL_29;
              v35 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSelectionHandler performSelector:](v31, "performSelector:", v112));
              v36 = v35;
              if (v35 && !objc_msgSend(v35, "isEqualToString:", v34))
              {
                v37 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v34, v31, v36));

              }
              else
              {

LABEL_29:
                v37 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v34, v31));
              }

            }
            else
            {
              v37 = CFSTR("<nil>");
            }

            v47 = v37;
            v48 = v14;
            v49 = v48;
            if (v48)
            {
              v50 = (objc_class *)objc_opt_class(v48);
              v51 = NSStringFromClass(v50);
              v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
              if ((objc_opt_respondsToSelector(v49, v112) & 1) == 0)
                goto LABEL_45;
              v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "performSelector:", v112));
              v54 = v53;
              if (v53 && !objc_msgSend(v53, "isEqualToString:", v52))
              {
                v55 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v52, v49, v54));

                v4 = v109;
              }
              else
              {

                v4 = v109;
LABEL_45:
                v55 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v52, v49));
              }

            }
            else
            {
              v55 = CFSTR("<nil>");
            }

            v59 = NSStringFromSelector(aSelector);
            v60 = (char *)objc_claimAutoreleasedReturnValue(v59);
            *(_DWORD *)buf = 138543874;
            v125 = v47;
            v126 = 2114;
            v127 = v55;
            v128 = 2114;
            v129 = v60;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "[%{public}@] %{public}@ does not respond to %{public}@", buf, 0x20u);

          }
          goto LABEL_57;
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_maps_copy"));
        objc_msgSend(v15, "invokeWithTarget:", v14);
        v118 = 1;
        objc_msgSend(v15, "getReturnValue:", &v118);
        if (v123)
          v16 = v118 == 0;
        else
          v16 = 1;
        v17 = !v16;
        v123 = v17;
        v18 = sub_1004C5118();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v20 = v110;
          v21 = v20;
          if (v110)
          {
            v22 = (objc_class *)objc_opt_class(v20);
            v23 = NSStringFromClass(v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
            if ((objc_opt_respondsToSelector(v21, v112) & 1) == 0)
              goto LABEL_21;
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSelectionHandler performSelector:](v21, "performSelector:", v112));
            v26 = v25;
            if (v25 && !objc_msgSend(v25, "isEqualToString:", v24))
            {
              v27 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v24, v21, v26));

            }
            else
            {

LABEL_21:
              v27 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v24, v21));
            }

          }
          else
          {
            v27 = CFSTR("<nil>");
          }

          v38 = v27;
          v39 = v14;
          v40 = v39;
          if (v39)
          {
            v41 = (objc_class *)objc_opt_class(v39);
            v42 = NSStringFromClass(v41);
            v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
            if ((objc_opt_respondsToSelector(v40, v112) & 1) == 0)
              goto LABEL_37;
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "performSelector:", v112));
            v45 = v44;
            if (v44 && !objc_msgSend(v44, "isEqualToString:", v43))
            {
              v46 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v43, v40, v45));

            }
            else
            {

LABEL_37:
              v46 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v43, v40));
            }

          }
          else
          {
            v46 = CFSTR("<nil>");
          }

          if (v118)
            v56 = "allows";
          else
            v56 = "disallows";
          v57 = NSStringFromSelector(aSelector);
          v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
          *(_DWORD *)buf = 138544130;
          v125 = v38;
          v126 = 2114;
          v127 = v46;
          v128 = 2080;
          v129 = v56;
          v130 = 2114;
          v131 = v58;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[%{public}@] %{public}@ %s %{public}@ ", buf, 0x2Au);

          v17 = v123;
          v4 = v109;
        }

        v8 = 1;
        if (!v17)
          goto LABEL_86;
LABEL_57:
        if ((objc_opt_respondsToSelector(v13, v114) & 1) != 0
          && objc_msgSend(v13, "wantsMapSelectionControl"))
        {
          v62 = sub_1004C5118();
          v63 = objc_claimAutoreleasedReturnValue(v62);
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
          {
            v64 = v110;
            v65 = v64;
            if (v110)
            {
              v66 = (objc_class *)objc_opt_class(v64);
              v67 = NSStringFromClass(v66);
              v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
              if ((objc_opt_respondsToSelector(v65, v112) & 1) == 0)
                goto LABEL_73;
              v69 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSelectionHandler performSelector:](v65, "performSelector:", v112));
              v70 = v69;
              if (v69 && !objc_msgSend(v69, "isEqualToString:", v68))
              {
                v71 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v68, v65, v70));

              }
              else
              {

LABEL_73:
                v71 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v68, v65));
              }

            }
            else
            {
              v71 = CFSTR("<nil>");
            }

            v72 = v71;
            v73 = v14;
            v74 = v73;
            if (v73)
            {
              v75 = (objc_class *)objc_opt_class(v73);
              v76 = NSStringFromClass(v75);
              v77 = (void *)objc_claimAutoreleasedReturnValue(v76);
              if ((objc_opt_respondsToSelector(v74, v112) & 1) == 0)
                goto LABEL_81;
              v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "performSelector:", v112));
              v79 = v78;
              if (v78 && !objc_msgSend(v78, "isEqualToString:", v77))
              {
                v80 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v77, v74, v79));

              }
              else
              {

LABEL_81:
                v80 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v77, v74));
              }

            }
            else
            {
              v80 = CFSTR("<nil>");
            }

            v81 = NSStringFromSelector(aSelector);
            v82 = (char *)objc_claimAutoreleasedReturnValue(v81);
            *(_DWORD *)buf = 138543874;
            v125 = v72;
            v126 = 2114;
            v127 = v80;
            v128 = 2114;
            v129 = v82;
            _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEBUG, "[%{public}@] %{public}@ wants map selection control (%{public}@)", buf, 0x20u);

          }
LABEL_86:

          goto LABEL_87;
        }

        v12 = (char *)v12 + 1;
      }
      while (v115 != v12);
      v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v132, 16);
      v9 = &selRef_maneuverViewTopMarginForSign_;
      v115 = v61;
      v10 = &selRef__updateNavigationDisplayConfigurationForDisplayedStep_;
      v11 = &selRef_viewControllerPresentPOIEnrichmentWithCoordinator_;
    }
    while (v61);
  }
LABEL_87:

  if (v123 && (objc_opt_respondsToSelector(WeakRetained, aSelector) & 1) != 0)
  {
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_maps_copy"));
    objc_msgSend(v83, "invokeWithTarget:", WeakRetained);
    v118 = 1;
    objc_msgSend(v83, "getReturnValue:", &v118);
    v123 = v118;
    v84 = sub_1004C5118();
    v85 = objc_claimAutoreleasedReturnValue(v84);
    if (!os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
    {
LABEL_112:

      goto LABEL_113;
    }
    v86 = v110;
    v87 = v86;
    if (!v86)
    {
      v93 = CFSTR("<nil>");
LABEL_100:

      v95 = v93;
      v96 = WeakRetained;
      v97 = v96;
      if (!v96)
      {
        v103 = CFSTR("<nil>");
        goto LABEL_108;
      }
      v98 = (objc_class *)objc_opt_class(v96);
      v99 = NSStringFromClass(v98);
      v100 = (void *)objc_claimAutoreleasedReturnValue(v99);
      if ((objc_opt_respondsToSelector(v97, "accessibilityIdentifier") & 1) != 0)
      {
        v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "performSelector:", "accessibilityIdentifier"));
        v102 = v101;
        if (v101 && !objc_msgSend(v101, "isEqualToString:", v100))
        {
          v103 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v100, v97, v102));

          goto LABEL_106;
        }

      }
      v103 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v100, v97));
LABEL_106:

LABEL_108:
      if (v118)
        v104 = "allows";
      else
        v104 = "disallows";
      v105 = NSStringFromSelector(aSelector);
      v106 = (void *)objc_claimAutoreleasedReturnValue(v105);
      *(_DWORD *)buf = 138544130;
      v125 = v95;
      v126 = 2114;
      v127 = v103;
      v128 = 2080;
      v129 = v104;
      v130 = 2114;
      v131 = v106;
      _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_INFO, "[%{public}@] %{public}@ %s %{public}@ ", buf, 0x2Au);

      goto LABEL_112;
    }
    v88 = (objc_class *)objc_opt_class(v86);
    v89 = NSStringFromClass(v88);
    v90 = (void *)objc_claimAutoreleasedReturnValue(v89);
    if ((objc_opt_respondsToSelector(v87, "accessibilityIdentifier") & 1) != 0)
    {
      v91 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSelectionHandler performSelector:](v87, "performSelector:", "accessibilityIdentifier"));
      v92 = v91;
      if (v91 && !objc_msgSend(v91, "isEqualToString:", v90))
      {
        v93 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v90, v87, v92));

        goto LABEL_96;
      }

    }
    v93 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v90, v87));
LABEL_96:

    goto LABEL_100;
  }
  if ((v8 & 1) != 0)
  {
LABEL_113:
    objc_msgSend(v4, "setReturnValue:", &v123);
    v94 = 1;
    goto LABEL_114;
  }
  v94 = 0;
LABEL_114:

  return v94;
}

- (BOOL)_propagateDidSelectInvocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const char *v8;
  NSObject *v9;
  id v10;
  id v11;
  uint64_t v12;
  char **v13;
  char **v14;
  char **v15;
  void *v16;
  char *v17;
  char *v18;
  char *v19;
  id v20;
  void *v21;
  char *v22;
  id v23;
  void *v24;
  id v25;
  _BOOL4 v26;
  ChromeMapSelectionHandler *v27;
  ChromeMapSelectionHandler *v28;
  objc_class *v29;
  NSString *v30;
  void *v31;
  void *v32;
  void *v33;
  __CFString *v34;
  __CFString *v35;
  id v36;
  void *v37;
  objc_class *v38;
  NSString *v39;
  void *v40;
  void *v41;
  void *v42;
  __CFString *v43;
  NSString *v44;
  void *v45;
  id v46;
  void *v47;
  ChromeMapSelectionHandler *v48;
  ChromeMapSelectionHandler *v49;
  objc_class *v50;
  NSString *v51;
  void *v52;
  void *v53;
  void *v54;
  __CFString *v55;
  const char *v56;
  NSObject *v57;
  int v58;
  id v59;
  NSObject *v60;
  _BOOL4 v61;
  ChromeMapSelectionHandler *v62;
  ChromeMapSelectionHandler *v63;
  objc_class *v64;
  NSString *v65;
  void *v66;
  void *v67;
  void *v68;
  __CFString *v69;
  ChromeMapSelectionHandler *v70;
  ChromeMapSelectionHandler *v71;
  objc_class *v72;
  NSString *v73;
  void *v74;
  void *v75;
  void *v76;
  __CFString *v77;
  __CFString *v78;
  id v79;
  void *v80;
  objc_class *v81;
  NSString *v82;
  void *v83;
  void *v84;
  void *v85;
  __CFString *v86;
  NSString *v87;
  void *v88;
  BOOL v89;
  __CFString *v90;
  id v91;
  void *v92;
  objc_class *v93;
  NSString *v94;
  void *v95;
  void *v96;
  void *v97;
  __CFString *v98;
  NSString *v99;
  void *v100;
  __CFString *v101;
  id v102;
  void *v103;
  objc_class *v104;
  NSString *v105;
  void *v106;
  void *v107;
  void *v108;
  __CFString *v109;
  NSString *v110;
  void *v111;
  id v112;
  ChromeMapSelectionHandler *v113;
  ChromeMapSelectionHandler *v114;
  objc_class *v115;
  NSString *v116;
  void *v117;
  void *v118;
  void *v119;
  __CFString *v120;
  NSString *v121;
  __CFString *v122;
  id WeakRetained;
  void *v125;
  NSObject *v126;
  ChromeMapSelectionHandler *v127;
  const char *aSelector;
  char *v129;
  char *v130;
  void *v131;
  void *v132;
  NSObject *log;
  unsigned __int8 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  uint8_t buf[4];
  __CFString *v140;
  __int16 v141;
  __CFString *v142;
  __int16 v143;
  void *v144;
  _BYTE v145[128];

  v4 = a3;
  v127 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "contexts"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "reverseObjectEnumerator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));

  v8 = (const char *)objc_msgSend(v4, "selector");
  v135 = 0u;
  v136 = 0u;
  v137 = 0u;
  v138 = 0u;
  v9 = v7;
  v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v135, v145, 16);
  v131 = v4;
  v126 = v9;
  aSelector = v8;
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v136;
    v13 = &selRef_maneuverViewTopMarginForSign_;
    v14 = &selRef__updateNavigationDisplayConfigurationForDisplayedStep_;
    v15 = &selRef_viewControllerPresentPOIEnrichmentWithCoordinator_;
    do
    {
      v16 = 0;
      v17 = v13[102];
      v18 = v14[486];
      v19 = v15[181];
      v129 = v18;
      v130 = v19;
      do
      {
        if (*(_QWORD *)v136 != v12)
          objc_enumerationMutation(v9);
        v20 = *(id *)(*((_QWORD *)&v135 + 1) + 8 * (_QWORD)v16);
        v21 = v20;
        if ((objc_opt_respondsToSelector(v20, v17) & 1) != 0)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "mapSelectionDelegate"));

        }
        if ((objc_opt_respondsToSelector(v21, v8) & 1) != 0)
        {
          v22 = v17;
          v23 = v11;
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "_maps_copy"));
          objc_msgSend(v24, "invokeWithTarget:", v21);
          v134 = 0;
          v132 = v24;
          objc_msgSend(v24, "getReturnValue:", &v134);
          LODWORD(v24) = v134;
          v25 = sub_1004C5118();
          log = objc_claimAutoreleasedReturnValue(v25);
          v26 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
          if ((_DWORD)v24)
          {
            v47 = WeakRetained;
            if (v26)
            {
              v48 = v127;
              v49 = v48;
              if (v127)
              {
                v50 = (objc_class *)objc_opt_class(v48);
                v51 = NSStringFromClass(v50);
                v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
                if ((objc_opt_respondsToSelector(v49, v129) & 1) == 0)
                  goto LABEL_43;
                v53 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSelectionHandler performSelector:](v49, "performSelector:", v129));
                v54 = v53;
                if (v53 && !objc_msgSend(v53, "isEqualToString:", v52))
                {
                  v55 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v52, v49, v54));

                }
                else
                {

LABEL_43:
                  v55 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v52, v49));
                }

              }
              else
              {
                v55 = CFSTR("<nil>");
              }

              v78 = v55;
              v79 = v21;
              v80 = v79;
              if (v79)
              {
                v81 = (objc_class *)objc_opt_class(v79);
                v82 = NSStringFromClass(v81);
                v83 = (void *)objc_claimAutoreleasedReturnValue(v82);
                if ((objc_opt_respondsToSelector(v80, v129) & 1) == 0)
                  goto LABEL_70;
                v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "performSelector:", v129));
                v85 = v84;
                if (v84 && !objc_msgSend(v84, "isEqualToString:", v83))
                {
                  v86 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v83, v80, v85));

                }
                else
                {

LABEL_70:
                  v86 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v83, v80));
                }

              }
              else
              {
                v86 = CFSTR("<nil>");
              }

              v87 = NSStringFromSelector(aSelector);
              v88 = (void *)objc_claimAutoreleasedReturnValue(v87);
              *(_DWORD *)buf = 138543874;
              v140 = v78;
              v141 = 2114;
              v142 = v86;
              v143 = 2114;
              v144 = v88;
              _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "[%{public}@] %{public}@ handled %{public}@", buf, 0x20u);

              v9 = v126;
            }

            v89 = 1;
            v57 = v9;
            goto LABEL_108;
          }
          if (v26)
          {
            v27 = v127;
            v28 = v27;
            if (v127)
            {
              v29 = (objc_class *)objc_opt_class(v27);
              v30 = NSStringFromClass(v29);
              v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
              if ((objc_opt_respondsToSelector(v28, v18) & 1) == 0)
                goto LABEL_16;
              v32 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSelectionHandler performSelector:](v28, "performSelector:", v18));
              v33 = v32;
              if (v32 && !objc_msgSend(v32, "isEqualToString:", v31))
              {
                v34 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v31, v28, v33));

              }
              else
              {

LABEL_16:
                v34 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v31, v28));
              }

            }
            else
            {
              v34 = CFSTR("<nil>");
            }

            v35 = v34;
            v36 = v21;
            v37 = v36;
            if (v36)
            {
              v38 = (objc_class *)objc_opt_class(v36);
              v39 = NSStringFromClass(v38);
              v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
              if ((objc_opt_respondsToSelector(v37, v129) & 1) == 0)
                goto LABEL_24;
              v125 = v40;
              v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "performSelector:", v129));
              v42 = v41;
              if (v41 && !objc_msgSend(v41, "isEqualToString:", v125))
              {
                v43 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v125, v37, v42));

                v40 = v125;
              }
              else
              {

                v40 = v125;
LABEL_24:
                v43 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v40, v37));
              }

            }
            else
            {
              v43 = CFSTR("<nil>");
            }

            v8 = aSelector;
            v44 = NSStringFromSelector(aSelector);
            v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
            *(_DWORD *)buf = 138543874;
            v140 = v35;
            v141 = 2114;
            v142 = v43;
            v143 = 2114;
            v144 = v45;
            _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "[%{public}@] %{public}@ did not handle %{public}@", buf, 0x20u);

            v9 = v126;
            v18 = v129;
          }

          v11 = v23;
          v17 = v22;
          v19 = v130;
        }
        if ((objc_opt_respondsToSelector(v20, v19) & 1) != 0
          && objc_msgSend(v20, "wantsMapSelectionControl"))
        {

          goto LABEL_46;
        }

        v16 = (char *)v16 + 1;
      }
      while (v11 != v16);
      v46 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v135, v145, 16);
      v11 = v46;
      v13 = &selRef_maneuverViewTopMarginForSign_;
      v14 = &selRef__updateNavigationDisplayConfigurationForDisplayedStep_;
      v15 = &selRef_viewControllerPresentPOIEnrichmentWithCoordinator_;
    }
    while (v46);
  }
LABEL_46:

  v56 = v8;
  v47 = WeakRetained;
  if ((objc_opt_respondsToSelector(WeakRetained, v56) & 1) == 0)
  {
LABEL_97:
    v112 = sub_1004C5118();
    v57 = objc_claimAutoreleasedReturnValue(v112);
    if (!os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
LABEL_107:
      v89 = 0;
      goto LABEL_108;
    }
    v113 = v127;
    v114 = v113;
    if (!v113)
    {
      v120 = CFSTR("<nil>");
      goto LABEL_106;
    }
    v115 = (objc_class *)objc_opt_class(v113);
    v116 = NSStringFromClass(v115);
    v117 = (void *)objc_claimAutoreleasedReturnValue(v116);
    if ((objc_opt_respondsToSelector(v114, "accessibilityIdentifier") & 1) != 0)
    {
      v118 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSelectionHandler performSelector:](v114, "performSelector:", "accessibilityIdentifier"));
      v119 = v118;
      if (v118 && !objc_msgSend(v118, "isEqualToString:", v117))
      {
        v120 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v117, v114, v119));

        goto LABEL_104;
      }

    }
    v120 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v117, v114));
LABEL_104:

LABEL_106:
    v121 = NSStringFromSelector(aSelector);
    v122 = (__CFString *)objc_claimAutoreleasedReturnValue(v121);
    *(_DWORD *)buf = 138543618;
    v140 = v120;
    v141 = 2114;
    v142 = v122;
    _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "[%{public}@] Nothing handled %{public}@", buf, 0x16u);

    goto LABEL_107;
  }
  v57 = objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "_maps_copy"));
  -[NSObject invokeWithTarget:](v57, "invokeWithTarget:", WeakRetained);
  v134 = 0;
  -[NSObject getReturnValue:](v57, "getReturnValue:", &v134);
  v58 = v134;
  v59 = sub_1004C5118();
  v60 = objc_claimAutoreleasedReturnValue(v59);
  v61 = os_log_type_enabled(v60, OS_LOG_TYPE_INFO);
  if (!v58)
  {
    if (!v61)
    {
LABEL_96:

      goto LABEL_97;
    }
    v70 = v127;
    v71 = v70;
    if (!v70)
    {
      v77 = CFSTR("<nil>");
LABEL_87:

      v101 = v77;
      v102 = WeakRetained;
      v103 = v102;
      if (!v102)
      {
        v109 = CFSTR("<nil>");
        goto LABEL_95;
      }
      v104 = (objc_class *)objc_opt_class(v102);
      v105 = NSStringFromClass(v104);
      v106 = (void *)objc_claimAutoreleasedReturnValue(v105);
      if ((objc_opt_respondsToSelector(v103, "accessibilityIdentifier") & 1) != 0)
      {
        v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "performSelector:", "accessibilityIdentifier"));
        v108 = v107;
        if (v107 && !objc_msgSend(v107, "isEqualToString:", v106))
        {
          v109 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v106, v103, v108));

          v9 = v126;
          goto LABEL_93;
        }

        v9 = v126;
      }
      v109 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v106, v103));
LABEL_93:

LABEL_95:
      v110 = NSStringFromSelector(aSelector);
      v111 = (void *)objc_claimAutoreleasedReturnValue(v110);
      *(_DWORD *)buf = 138543874;
      v140 = v101;
      v141 = 2114;
      v142 = v109;
      v143 = 2114;
      v144 = v111;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "[%{public}@] %{public}@ did not handle %{public}@", buf, 0x20u);

      goto LABEL_96;
    }
    v72 = (objc_class *)objc_opt_class(v70);
    v73 = NSStringFromClass(v72);
    v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
    if ((objc_opt_respondsToSelector(v71, "accessibilityIdentifier") & 1) != 0)
    {
      v75 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSelectionHandler performSelector:](v71, "performSelector:", "accessibilityIdentifier"));
      v76 = v75;
      if (v75 && !objc_msgSend(v75, "isEqualToString:", v74))
      {
        v77 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v74, v71, v76));

        goto LABEL_63;
      }

    }
    v77 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v74, v71));
LABEL_63:

    goto LABEL_87;
  }
  if (v61)
  {
    v62 = v127;
    v63 = v62;
    if (!v62)
    {
      v69 = CFSTR("<nil>");
LABEL_76:

      v90 = v69;
      v91 = WeakRetained;
      v92 = v91;
      if (!v91)
      {
        v98 = CFSTR("<nil>");
        goto LABEL_84;
      }
      v93 = (objc_class *)objc_opt_class(v91);
      v94 = NSStringFromClass(v93);
      v95 = (void *)objc_claimAutoreleasedReturnValue(v94);
      if ((objc_opt_respondsToSelector(v92, "accessibilityIdentifier") & 1) != 0)
      {
        v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "performSelector:", "accessibilityIdentifier"));
        v97 = v96;
        if (v96 && !objc_msgSend(v96, "isEqualToString:", v95))
        {
          v98 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v95, v92, v97));

          v9 = v126;
          goto LABEL_82;
        }

        v9 = v126;
      }
      v98 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v95, v92));
LABEL_82:

LABEL_84:
      v99 = NSStringFromSelector(aSelector);
      v100 = (void *)objc_claimAutoreleasedReturnValue(v99);
      *(_DWORD *)buf = 138543874;
      v140 = v90;
      v141 = 2114;
      v142 = v98;
      v143 = 2114;
      v144 = v100;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "[%{public}@] %{public}@ handled %{public}@", buf, 0x20u);

      goto LABEL_85;
    }
    v64 = (objc_class *)objc_opt_class(v62);
    v65 = NSStringFromClass(v64);
    v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
    if ((objc_opt_respondsToSelector(v63, "accessibilityIdentifier") & 1) != 0)
    {
      v67 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeMapSelectionHandler performSelector:](v63, "performSelector:", "accessibilityIdentifier"));
      v68 = v67;
      if (v67 && !objc_msgSend(v67, "isEqualToString:", v66))
      {
        v69 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v66, v63, v68));

        goto LABEL_55;
      }

    }
    v69 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v66, v63));
LABEL_55:

    goto LABEL_76;
  }
LABEL_85:

  v89 = 1;
LABEL_108:

  return v89;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
}

@end
