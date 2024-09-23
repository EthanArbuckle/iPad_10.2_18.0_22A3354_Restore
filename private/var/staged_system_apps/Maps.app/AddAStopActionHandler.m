@implementation AddAStopActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  unsigned int v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  __int16 v25;
  void *v26;

  v5 = a3;
  v6 = a4;
  v7 = sub_100431A4C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138412290;
    v24 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Performing action: %@", (uint8_t *)&v23, 0xCu);
  }

  v9 = objc_opt_class(AddAStopAction);
  if ((objc_opt_isKindOfClass(v5, v9) & 1) != 0)
  {
    v10 = v5;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v12 = objc_msgSend(v11, "isCarAppSceneHostingNavigation");

    if (v12)
    {
      v13 = sub_100431A4C();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapItem"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));
        v23 = 138412290;
        v24 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "CarDisplayController will detour to mapItem: %@", (uint8_t *)&v23, 0xCu);

      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapItem"));
      objc_msgSend(v17, "detourToMapItem:", v18);
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appCoordinator"));
      v19 = sub_100431A4C();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapItem"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "name"));
        v23 = 138543618;
        v24 = v17;
        v25 = 2112;
        v26 = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Coordinator: %{public}@ will detour to mapItem: %@", (uint8_t *)&v23, 0x16u);

      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapItem"));
      objc_msgSend(v17, "addStopWithMapItem:", v18);
    }

  }
}

@end
