@implementation RoutePlanningAnalyticsTask

- (void)setRoutePlanningSession:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unsigned __int8 v7;
  id WeakRetained;
  id v9;
  RouteCollection *routeCollection;
  id obj;

  v4 = a3;
  v5 = (unint64_t)objc_loadWeakRetained((id *)&self->_routePlanningSession);
  v6 = (unint64_t)v4;
  if (v6 | v5)
  {
    obj = (id)v6;
    v7 = objc_msgSend((id)v5, "isEqual:", v6);

    v6 = (unint64_t)obj;
    if ((v7 & 1) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_routePlanningSession);
      objc_msgSend(WeakRetained, "removeObserver:", self);

      v9 = objc_storeWeak((id *)&self->_routePlanningSession, obj);
      objc_msgSend(obj, "addObserver:", self);

      routeCollection = self->_routeCollection;
      self->_routeCollection = 0;

      v6 = (unint64_t)obj;
    }
  }

}

- (int)analyticsTarget
{
  void *v2;
  id v3;
  int result;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  char *v9;
  int v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningAnalyticsTask routePlanningSession](self, "routePlanningSession"));
  v3 = objc_msgSend(v2, "currentTransportType");

  result = 302;
  switch((unint64_t)v3)
  {
    case 0uLL:
      v5 = sub_1004318FC();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v10 = 136315650;
        v11 = "-[RoutePlanningAnalyticsTask analyticsTarget]";
        v12 = 2080;
        v13 = "RoutePlanningAnalyticsTask.m";
        v14 = 1024;
        v15 = 64;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v10, 0x1Cu);
      }

      result = sub_100A70734();
      if (result)
      {
        v7 = sub_1004318FC();
        v8 = objc_claimAutoreleasedReturnValue(v7);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v9 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v10 = 138412290;
          v11 = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v10, 0xCu);

        }
        result = 0;
      }
      break;
    case 1uLL:
      result = 301;
      break;
    case 3uLL:
      result = 303;
      break;
    case 4uLL:
      result = 304;
      break;
    case 5uLL:
      result = 305;
      break;
    default:
      return result;
  }
  return result;
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v9 = a5;
  v6 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v9, v6) & 1) != 0)
    v7 = v9;
  else
    v7 = 0;
  v8 = v7;
  -[RoutePlanningAnalyticsTask setRoutePlanningSession:](self, "setRoutePlanningSession:", v8);

}

- (void)routePlanningSession:(id)a3 didUpdateRouteCollectionResult:(id)a4 forTransportType:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  char *v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const char *v33;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "isSuccess") && objc_msgSend(v8, "currentTransportType") == (id)a5)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = sub_1009E1714;
    v24 = sub_1009E1724;
    v25 = 0;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1009E172C;
    v19[3] = &unk_1011B58C0;
    v19[4] = &v20;
    objc_msgSend(v9, "withValue:orError:", v19, &stru_1011DECB8);
    if (!v21[5])
    {
      v14 = sub_1004318FC();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v27 = "-[RoutePlanningAnalyticsTask routePlanningSession:didUpdateRouteCollectionResult:forTransportType:]";
        v28 = 2080;
        v29 = "RoutePlanningAnalyticsTask.m";
        v30 = 1024;
        v31 = 89;
        v32 = 2080;
        v33 = "routeCollection != nil";
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
      }

      if (sub_100A70734())
      {
        v16 = sub_1004318FC();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v27 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v21[5], "routes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningAnalyticsTask routeCollection](self, "routeCollection"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "routes"));
    v13 = objc_msgSend(v10, "isEqualToArray:", v12);

    -[RoutePlanningAnalyticsTask setRouteCollection:](self, "setRouteCollection:", v21[5]);
    if ((v13 & 1) == 0)
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 3039, -[RoutePlanningAnalyticsTask analyticsTarget](self, "analyticsTarget"), 0);
    _Block_object_dispose(&v20, 8);

  }
}

+ (int64_t)creationPreference
{
  return 2;
}

- (RoutePlanningSession)routePlanningSession
{
  return (RoutePlanningSession *)objc_loadWeakRetained((id *)&self->_routePlanningSession);
}

- (RouteCollection)routeCollection
{
  return self->_routeCollection;
}

- (void)setRouteCollection:(id)a3
{
  objc_storeStrong((id *)&self->_routeCollection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeCollection, 0);
  objc_destroyWeak((id *)&self->_routePlanningSession);
}

@end
