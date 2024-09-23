@implementation FMFUtils

+ (id)shiftLocations:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  id v23;
  uint64_t v24;
  void *j;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  id v38;
  NSObject *v39;
  dispatch_queue_global_t global_queue;
  void *v41;
  id v42;
  id v43;
  NSObject *v44;
  id v45;
  NSObject *v46;
  id v47;
  id v48;
  NSObject *v49;
  const char *v50;
  id v51;
  id v53;
  id obj;
  id v55;
  id v56;
  void *v57;
  NSObject *group;
  _QWORD v59[4];
  NSObject *v60;
  _QWORD v61[5];
  id v62;
  id v63;
  id v64;
  NSObject *v65;
  double v66;
  double v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t v76[128];
  uint8_t buf[4];
  id v78;
  _BYTE v79[128];

  v53 = a1;
  v3 = a3;
  v56 = objc_alloc_init((Class)GEOLocationShifter);
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v73;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v73 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("location"), v53));
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        if (v8 == v9)
        {

          v10 = 0;
        }
        else
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("location")));

          if (v10)
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("latitude")));
            objc_msgSend(v11, "doubleValue");
            v13 = v12;
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("longitude")));
            objc_msgSend(v14, "doubleValue");
            v16 = v15;

            if (+[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:", v13, v16))
            {
              v20 = sub_100011D0C();
              v21 = objc_claimAutoreleasedReturnValue(v20);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v78 = v7;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Detected location shift required for incoming locations(%@)", buf, 0xCu);
              }

              v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
              group = dispatch_group_create();
              v68 = 0u;
              v69 = 0u;
              v70 = 0u;
              v71 = 0u;
              v55 = obj;
              v23 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
              if (v23)
              {
                v24 = *(_QWORD *)v69;
                do
                {
                  for (j = 0; j != v23; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v69 != v24)
                      objc_enumerationMutation(v55);
                    v26 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)j);
                    v27 = objc_msgSend(v26, "mutableCopy");
                    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("location")));
                    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
                    if (v28 == v29)
                    {
                      v31 = objc_msgSend(0, "mutableCopy");
                    }
                    else
                    {
                      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("location")));
                      v31 = objc_msgSend(v30, "mutableCopy");

                    }
                    if (v31)
                    {
                      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKey:", CFSTR("latitude")));
                      objc_msgSend(v32, "doubleValue");
                      v34 = v33;
                      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKey:", CFSTR("longitude")));
                      objc_msgSend(v35, "doubleValue");
                      v37 = v36;

                      dispatch_group_enter(group);
                      v38 = sub_100011D0C();
                      v39 = objc_claimAutoreleasedReturnValue(v38);
                      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Entering shifter dispatch group", buf, 2u);
                      }

                      v61[0] = _NSConcreteStackBlock;
                      v61[1] = 3221225472;
                      v61[2] = sub_10002EF14;
                      v61[3] = &unk_10009A210;
                      v66 = v34;
                      v67 = v37;
                      v61[4] = v26;
                      v62 = v31;
                      v63 = v27;
                      v64 = v57;
                      v65 = group;
                      v59[0] = _NSConcreteStackBlock;
                      v59[1] = 3221225472;
                      v59[2] = sub_10002F148;
                      v59[3] = &unk_1000995E8;
                      v60 = v65;
                      global_queue = dispatch_get_global_queue(0, 0);
                      v41 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
                      objc_msgSend(v56, "shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v61, 0, v59, v41, v34, v37, 0.0);

                    }
                    else
                    {
                      v42 = v57;
                      objc_sync_enter(v42);
                      objc_msgSend(v42, "addObject:", v27);
                      v43 = sub_100011D0C();
                      v44 = objc_claimAutoreleasedReturnValue(v43);
                      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        v78 = v57;
                        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Outside shifter, updated locations array: %@", buf, 0xCu);
                      }

                      objc_sync_exit(v42);
                    }

                  }
                  v23 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
                }
                while (v23);
              }

              dispatch_group_wait(group, (dispatch_time_t)objc_msgSend(v53, "timeout"));
              v45 = sub_100011D0C();
              v46 = objc_claimAutoreleasedReturnValue(v45);
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Shifter after dispatch_group_wait", buf, 2u);
              }

              v19 = v57;
              objc_sync_enter(v19);
              v47 = objc_msgSend(v55, "count");
              if (v47 == -[NSObject count](v19, "count"))
              {
                v17 = -[NSObject copy](v19, "copy");
                v48 = sub_100011D0C();
                v49 = objc_claimAutoreleasedReturnValue(v48);
                if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v78 = v17;
                  v50 = "Shifter updating shiftedLocationsArray(%@) due to same count";
                  goto LABEL_41;
                }
              }
              else
              {
                v17 = v55;
                v51 = sub_100011D0C();
                v49 = objc_claimAutoreleasedReturnValue(v51);
                if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v78 = v17;
                  v50 = "Shifter updating shiftedLocationsArray(%@) due to mismatched array count";
LABEL_41:
                  _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, v50, buf, 0xCu);
                }
              }

              objc_sync_exit(v19);
              goto LABEL_43;
            }
          }
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
      if (v4)
        continue;
      break;
    }
  }

  v17 = obj;
  v18 = sub_100011D0C();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v78 = v17;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Shifter updating shiftedLocationsArray(%@) due to no shifting required", buf, 0xCu);
  }
LABEL_43:

  return v17;
}

+ (unint64_t)timeout
{
  return dispatch_time(0, 10000000000);
}

+ (BOOL)locationServicesEnabled
{
  return +[CLLocationManager locationServicesEnabled](CLLocationManager, "locationServicesEnabled");
}

+ (BOOL)shareMyLocationSystemServiceEnabled
{
  void *v2;
  unsigned int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/FMF.framework")));
  v3 = +[CLLocationManager authorizationStatusForBundle:](CLLocationManager, "authorizationStatusForBundle:", v2);

  return v3 == 3;
}

+ (void)handleAlertAction:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    v3 = a3;
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("url")));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sensitive")));

    v5 = objc_msgSend(v4, "BOOLValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    v7 = v6;
    if (v5)
      objc_msgSend(v6, "openSensitiveURL:withOptions:", v8, 0);
    else
      objc_msgSend(v6, "openURL:withOptions:", v8, 0);

  }
}

@end
