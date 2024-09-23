@implementation RoutePlanningFeatureDiscoveryProvider

- (RoutePlanningFeatureDiscoveryProvider)init
{
  RoutePlanningFeatureDiscoveryProvider *v2;
  RoutePlanningFeatureDiscoveryProvider *v3;
  TransitPayDiscoverySource *v4;
  DTMFeatureDiscoverySource *v5;
  LPRRoutingFeatureDiscoverySource *v6;
  EnvironmentalFeatureDiscoverySource *v7;
  void *v8;
  uint64_t v9;
  NSArray *sources;
  objc_super v12;
  _QWORD v13[4];

  v12.receiver = self;
  v12.super_class = (Class)RoutePlanningFeatureDiscoveryProvider;
  v2 = -[RoutePlanningFeatureDiscoveryProvider init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = -[TransitPayDiscoverySource initWithPriority:delegate:]([TransitPayDiscoverySource alloc], "initWithPriority:delegate:", 0, v2);
    v13[0] = v4;
    v5 = -[DTMFeatureDiscoverySource initWithPriority:delegate:]([DTMFeatureDiscoverySource alloc], "initWithPriority:delegate:", 3, v3);
    v13[1] = v5;
    v6 = -[LPRRoutingFeatureDiscoverySource initWithPriority:delegate:]([LPRRoutingFeatureDiscoverySource alloc], "initWithPriority:delegate:", 2, v3);
    v13[2] = v6;
    v7 = -[EnvironmentalFeatureDiscoverySource initWithPriority:delegate:]([EnvironmentalFeatureDiscoverySource alloc], "initWithPriority:delegate:", 4, v3);
    v13[3] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 4));

    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sortedArrayUsingComparator:", &stru_1011DFAE8));
    sources = v3->_sources;
    v3->_sources = (NSArray *)v9;

  }
  return v3;
}

- (BOOL)updateWithTransportType:(int64_t)a3 routeCollection:(id)a4
{
  id v7;
  RouteCollection *routeCollection;
  unint64_t v9;
  id v10;
  void *v11;
  unsigned int v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  id v17;
  NSObject *v18;
  unint64_t v19;
  const __CFString *v20;
  const __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *i;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  const __CFString *v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  __CFString *v44;

  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (self->_transportType == a3
    && ((routeCollection = self->_routeCollection,
         v9 = (unint64_t)v7,
         v10 = routeCollection,
         !(v9 | (unint64_t)v10))
     || (v11 = v10,
         v12 = objc_msgSend((id)v9, "isEqual:", v10),
         v11,
         (id)v9,
         v12)))
  {
    os_unfair_lock_unlock(&self->_lock);
    v13 = 0;
  }
  else
  {
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routes"));
    v15 = objc_claimAutoreleasedReturnValue(-[RouteCollection routes](self->_routeCollection, "routes"));
    if (v14 | v15)
      v16 = objc_msgSend((id)v14, "isEqual:", v15);
    else
      v16 = 1;

    v17 = sub_1004321BC();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = self->_transportType - 1;
      if (v19 > 4)
        v20 = CFSTR("Undefined");
      else
        v20 = off_1011DFB88[v19];
      if ((unint64_t)(a3 - 1) > 4)
        v21 = CFSTR("Undefined");
      else
        v21 = off_1011DFB88[a3 - 1];
      v22 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      v38 = v20;
      v39 = 2112;
      if (v16)
        v22 = CFSTR("YES");
      v40 = v21;
      v41 = 2048;
      v42 = v7;
      v43 = 2112;
      v44 = v22;
      v23 = v22;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Updating transport type from %@ to %@, route collection to %p (only route idx changed: %@)", buf, 0x2Au);

    }
    self->_transportType = a3;
    objc_storeStrong((id *)&self->_routeCollection, a4);
    v24 = -[NSArray copy](self->_sources, "copy");
    os_unfair_lock_unlock(&self->_lock);
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v25 = v24;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v27; i = (char *)i + 1)
        {
          if (*(_QWORD *)v33 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
          if (!v16
            || objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i), "wantsAllRouteCollectionChanges", (_QWORD)v32))
          {
            objc_msgSend(v30, "setTransportType:routeCollection:", a3, v7, (_QWORD)v32);
          }
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v27);
    }

    v13 = -[RoutePlanningFeatureDiscoveryProvider _updateCurrentModelAndNotify:](self, "_updateCurrentModelAndNotify:", 0);
  }

  return v13;
}

- (BOOL)_updateCurrentModelAndNotify:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  os_unfair_lock_s *p_lock;
  FeatureDiscoveryModel *suggestedModel;
  unint64_t v8;
  id v9;
  void *v10;
  unsigned int v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  unint64_t v23;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFeatureDiscoveryProvider _bestModelForCurrentState](self, "_bestModelForCurrentState"));
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  suggestedModel = self->_suggestedModel;
  v8 = v5;
  v9 = suggestedModel;
  if (v8 | (unint64_t)v9
    && (v10 = v9, v11 = objc_msgSend((id)v8, "isEqual:", v9),
                  v10,
                  (id)v8,
                  !v11))
  {
    v13 = sub_1004321BC();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Suggestion did change to %@", buf, 0xCu);
    }

    objc_storeStrong((id *)&self->_suggestedModel, v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFeatureDiscoveryProvider changeHandler](self, "changeHandler"));
    os_unfair_lock_unlock(p_lock);
    if (v3 && v15)
    {
      v16 = sub_1004321BC();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Will notify suggestion did change", buf, 2u);
      }

      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100A13B74;
      v19[3] = &unk_1011ACAD0;
      v21 = v15;
      v20 = (id)v8;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v19);

    }
    v12 = 1;
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    v12 = 0;
  }

  return v12;
}

- (id)_bestModelForCurrentState
{
  id v2;
  void *v3;
  void *v4;

  v2 = sub_10039DCD4(self->_sources, &stru_1011DFB28);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  return v4;
}

- (void)setTransitPayActionDelegate:(id)a3
{
  id v4;
  id WeakRetained;
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  uint64_t Log;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;

  v4 = a3;
  if (!v4)
  {
    v13 = sub_10043253C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Feature Discovery/RoutePlanningFeatureDiscoveryProvider.m";
      v23 = 1024;
      v24 = 119;
      v25 = 2082;
      v26 = "-[RoutePlanningFeatureDiscoveryProvider setTransitPayActionDelegate:]";
      v27 = 2082;
      v28 = "nil == transitPayActionDelegate";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Transit + Pay requires an action delegate", buf, 0x26u);
    }

    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "TransitPay");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Feature Discovery/RoutePlanningFeatureDiscoveryProvider.m";
      v23 = 1024;
      v24 = 119;
      v25 = 2082;
      v26 = "-[RoutePlanningFeatureDiscoveryProvider setTransitPayActionDelegate:]";
      v27 = 2082;
      v28 = "nil == transitPayActionDelegate";
      _os_log_impl((void *)&_mh_execute_header, &v6->super, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Transit + Pay requires an action delegate", buf, 0x26u);
    }
    goto LABEL_17;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_transitPayActionDelegate);

  if (!WeakRetained)
  {
    objc_storeWeak((id *)&self->_transitPayActionDelegate, v4);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = self->_sources;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          v12 = objc_opt_class(TransitPayDiscoverySource);
          if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
            objc_msgSend(v11, "setTransitPayActionDelegate:", v4, (_QWORD)v16);
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }
LABEL_17:

  }
}

- (void)markFeatureDiscoveryViewShown
{
  -[NSArray enumerateObjectsUsingBlock:](self->_sources, "enumerateObjectsUsingBlock:", &stru_1011DFB68);
}

- (void)source:(id)a3 didUpdateAvailability:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  int v14;
  void *v15;
  __int16 v16;
  __CFString *v17;

  v4 = a4;
  v6 = a3;
  v7 = sub_1004321BC();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = (objc_class *)objc_opt_class(v6);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = CFSTR("NO");
    if (v4)
      v12 = CFSTR("YES");
    v13 = v12;
    v14 = 138412546;
    v15 = v11;
    v16 = 2112;
    v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Availability of %@ changed to %@.", (uint8_t *)&v14, 0x16u);

  }
  -[RoutePlanningFeatureDiscoveryProvider _updateCurrentModelAndNotify:](self, "_updateCurrentModelAndNotify:", 1);

}

- (FeatureDiscoveryModel)suggestedModel
{
  return self->_suggestedModel;
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void)setChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (TransitPayActionDelegate)transitPayActionDelegate
{
  return (TransitPayActionDelegate *)objc_loadWeakRetained((id *)&self->_transitPayActionDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_transitPayActionDelegate);
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong((id *)&self->_suggestedModel, 0);
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_routeCollection, 0);
}

@end
