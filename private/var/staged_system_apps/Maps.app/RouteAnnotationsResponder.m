@implementation RouteAnnotationsResponder

+ (id)routeAtPoint:(CGPoint)a3 inMapView:(id)a4 withRoutes:(id)a5 selectedRoute:(id)a6 overlappingRouteSelectorBlock:(id)a7
{
  double y;
  double x;
  id v12;
  id v13;
  MKMapPoint v14;
  id v15;
  id v16;
  uint64_t v17;
  double v18;
  void *i;
  void *v20;
  CLLocationCoordinate2D v21;
  double v22;
  uint64_t v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  void *j;
  uint64_t v41;
  void *v42;
  double v43;
  double v44;
  id v45;
  id v46;
  NSObject *v47;
  NSObject *v48;
  id v49;
  void *v50;
  uint64_t v51;
  void *v52;
  id v53;
  NSObject *v54;
  void *v55;
  void *v56;
  id v57;
  NSObject *v58;
  id v60;
  id v61;
  id obj;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t v73[128];
  uint8_t buf[4];
  id v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  void *v79;
  _BYTE v80[128];
  CLLocationCoordinate2D v81;
  MKMapPoint v82;

  y = a3.y;
  x = a3.x;
  v12 = a4;
  v13 = a5;
  v61 = a6;
  v60 = a7;
  objc_msgSend(v12, "convertPoint:toCoordinateFromView:", v12, x, y);
  v14 = MKMapPointForCoordinate(v81);
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  obj = v13;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v70;
    v18 = 1.79769313e308;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v70 != v17)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v20, "_maps_closestMapPointToMapPoint:", v14.x, v14.y);
        v21 = MKCoordinateForMapPoint(v82);
        v22 = UIDistanceBetweenPoints(objc_msgSend(v12, "convertCoordinate:toPointToView:", v12, v21.latitude, v21.longitude));
        v23 = *(_QWORD *)&v22;
        if (v22 < v18)
          v18 = v22;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        objc_msgSend(v64, "setObject:forKey:", v24, v20);

        v25 = sub_1004799E8();
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "uniqueRouteID"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "UUIDString"));
          *(_DWORD *)buf = 134349570;
          v75 = a1;
          v76 = 2048;
          v77 = v23;
          v78 = 2112;
          v79 = v28;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "[%{public}p] Adding minimum distance (%f) for route: %@", buf, 0x20u);

        }
      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
    }
    while (v16);
  }
  else
  {
    v18 = 1.79769313e308;
  }

  v29 = sub_1004799E8();
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349312;
    v75 = a1;
    v76 = 2048;
    v77 = *(_QWORD *)&v18;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "[%{public}p] Calculated closest route distance: %f", buf, 0x16u);
  }

  v31 = sub_1004799E8();
  v32 = objc_claimAutoreleasedReturnValue(v31);
  v33 = os_log_type_enabled(v32, OS_LOG_TYPE_INFO);
  if (v18 > 30.0)
  {
    v35 = v60;
    v34 = v61;
    if (v33)
    {
      *(_DWORD *)buf = 134349312;
      v75 = a1;
      v76 = 2048;
      v77 = 0x403E000000000000;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "[%{public}p] Closest route distance was larger than the maximum (%f)", buf, 0x16u);
    }
LABEL_41:
    v52 = 0;
    goto LABEL_46;
  }
  if (v33)
  {
    *(_DWORD *)buf = 134349312;
    v75 = a1;
    v76 = 2048;
    v77 = 0x403E000000000000;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "[%{public}p] Closest route distance was smaller than the maximum (%f)", buf, 0x16u);
  }

  v32 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(obj, "count")));
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v36 = v64;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v66;
    do
    {
      for (j = 0; j != v38; j = (char *)j + 1)
      {
        if (*(_QWORD *)v66 != v39)
          objc_enumerationMutation(v36);
        v41 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)j);
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKey:", v41));
        objc_msgSend(v42, "cgFloatValue");
        v44 = v43;

        if (vabdd_f64(v44, v18) < 0.00999999978)
          -[NSObject addObject:](v32, "addObject:", v41);
      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
    }
    while (v38);
  }

  v45 = -[NSObject count](v32, "count");
  v46 = sub_1004799E8();
  v47 = objc_claimAutoreleasedReturnValue(v46);
  v48 = v47;
  if (!v45)
  {
    v35 = v60;
    v34 = v61;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349312;
      v75 = a1;
      v76 = 2048;
      v77 = 0x3F847AE140000000;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "[%{public}p] Did not find any routes within %f of the closestRouteDistance", buf, 0x16u);
    }

    goto LABEL_41;
  }
  v35 = v60;
  v34 = v61;
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    v49 = sub_10039DCD4(v32, &stru_1011B7C18);
    v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
    *(_DWORD *)buf = 134349314;
    v75 = a1;
    v76 = 2112;
    v77 = (uint64_t)v50;
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "[%{public}p] Found closest routes: %@", buf, 0x16u);

  }
  if (-[NSObject count](v32, "count") == (id)1)
  {
LABEL_45:
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject firstObject](v32, "firstObject"));
    goto LABEL_46;
  }
  if (!v60)
  {
    v57 = sub_1004799E8();
    v58 = objc_claimAutoreleasedReturnValue(v57);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      v75 = a1;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "[%{public}p] overlappingRouteSelectorBlock is nil; cannot differentiate between multiple overlapping routes",
        buf,
        0xCu);
    }

    goto LABEL_45;
  }
  v51 = (*((uint64_t (**)(id, NSObject *, id))v60 + 2))(v60, v32, v61);
  v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
  v53 = sub_1004799E8();
  v54 = objc_claimAutoreleasedReturnValue(v53);
  if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "uniqueRouteID"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "UUIDString"));
    *(_DWORD *)buf = 134349314;
    v75 = a1;
    v76 = 2112;
    v77 = (uint64_t)v56;
    _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "[%{public}p] Differentiated between multiple overlapping routes: %@", buf, 0x16u);

  }
LABEL_46:

  return v52;
}

@end
