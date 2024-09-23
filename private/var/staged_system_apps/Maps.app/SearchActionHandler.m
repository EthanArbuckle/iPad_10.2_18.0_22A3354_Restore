@implementation SearchActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  int v30;
  id v31;
  __int16 v32;
  NSObject *v33;

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_class(SearchAction);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    v8 = objc_alloc_init((Class)NSMutableDictionary);
    -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", &off_10126D228, CFSTR("GEOMapServiceTraits_Source"));
    v9 = v5;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "coordinator"));

    if (v10)
    {
      v11 = sub_100431A4C();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "searchItem"));
        v30 = 138412546;
        v31 = v13;
        v32 = 2112;
        v33 = v8;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "SearchActionHandler : doSearchItem item %@ userInfo %@", (uint8_t *)&v30, 0x16u);

      }
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "coordinator"));
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "navActionCoordinator"));

      if (!v18)
      {
        if (objc_msgSend(v6, "isCarPlayOnlyContext"))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "searchItem"));
          objc_msgSend(v15, "displayRoutePlanningForDestination:userInfo:", v16, v8);
        }
        else
        {
          v27 = sub_100431A4C();
          v28 = objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "searchItem"));
            v30 = 138412546;
            v31 = v29;
            v32 = 2112;
            v33 = v8;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "SearchActionHandler : appCoordinator item %@ userInfo %@", (uint8_t *)&v30, 0x16u);

          }
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appCoordinator"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "searchItem"));
          objc_msgSend(v15, "openSearch:userInfo:", v16, v8);
        }
        goto LABEL_7;
      }
      if (((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v19, v20) & 1) != 0
         || (MapsFeature_IsEnabled_Maps420() & 1) != 0
         || MapsFeature_IsEnabled_Maps182())
        && objc_msgSend(v9, "searchAlongRoute"))
      {
        v21 = sub_100431A4C();
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          LOWORD(v30) = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "SearchActionHandler: handleSearchActionUsingSearchFieldItem.", (uint8_t *)&v30, 2u);
        }

        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v9, "searchAlongRoute")));
        -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v23, CFSTR("SearchAlongRoute"));

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "navActionCoordinator"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "searchItem"));
        objc_msgSend(v15, "handleSearchActionUsingSearchFieldItem:withUserInfo:", v16, v8);
        goto LABEL_7;
      }
      v24 = sub_100431A4C();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "searchItem"));
        v30 = 138412546;
        v31 = v26;
        v32 = 2112;
        v33 = v8;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "SearchActionHandler : doSearchItem item %@ userInfo %@", (uint8_t *)&v30, 0x16u);

      }
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "navActionCoordinator"));
    }
    v15 = (void *)v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "searchItem"));
    objc_msgSend(v15, "viewController:doSearchItem:withUserInfo:", 0, v16, v8);
LABEL_7:

    goto LABEL_10;
  }
  v17 = sub_100431A4C();
  v8 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v30 = 138412290;
    v31 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "SearchActionHandler : action is not a SearchAction %@ ", (uint8_t *)&v30, 0xCu);
  }
LABEL_10:

}

@end
