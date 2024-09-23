@implementation MapsActivityMergeController

- (id)mergeActivities:(id)a3
{
  objc_storeStrong((id *)&self->_activities, a3);
  return -[MapsActivityMergeController _performProcess](self, "_performProcess");
}

- (id)_performProcess
{
  -[MapsActivityMergeController _mergeActivitiesIfNeeded](self, "_mergeActivitiesIfNeeded");
  return self->_mergedActivity;
}

- (void)_mergeActivitiesIfNeeded
{
  NSUInteger v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  dispatch_queue_global_t global_queue;
  NSObject *v10;
  id v11;
  id v12;
  RichMapsActivity *v13;
  RichMapsActivity *mergedActivity;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;

  v3 = -[NSArray count](self->_activities, "count");
  v4 = -[NSArray copy](self->_activities, "copy");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));

  v7 = sub_100431A4C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "_mergeActivitiesIfNeeded (tag %@)", buf, 0xCu);
  }

  global_queue = dispatch_get_global_queue(-2, 0);
  v10 = objc_claimAutoreleasedReturnValue(global_queue);
  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = sub_100C006C4;
  v18 = &unk_1011AC8B0;
  v11 = v6;
  v19 = v11;
  v12 = v4;
  v20 = v12;
  dispatch_async(v10, &v15);

  if (v3)
  {
    if (v3 == 1)
    {
      v13 = (RichMapsActivity *)objc_claimAutoreleasedReturnValue(-[NSArray lastObject](self->_activities, "lastObject", v15, v16, v17, v18, v19));
      mergedActivity = self->_mergedActivity;
      self->_mergedActivity = v13;

    }
    else
    {
      -[MapsActivityMergeController _mergeActivities](self, "_mergeActivities", v15, v16, v17, v18, v19);
    }
  }

}

- (void)_mergeActivities
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int64_t v13;
  uint64_t v14;
  RichMapsActivity *v15;
  RichMapsActivity *mergedActivity;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  RichMapsActivity *v21;
  dispatch_queue_global_t global_queue;
  NSObject *v23;
  RichMapsActivity *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  RichMapsActivity *v28;
  uint8_t buf[4];
  void *v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_activities, "objectAtIndexedSubscript:", 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "action"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_activities, "objectAtIndexedSubscript:", 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapsActivity"));
  v7 = objc_msgSend(v6, "copy");

  if (!v7)
  {
    if (v4 && !objc_msgSend(v4, "isCompatibleWithRestorationTask")
      || (v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_activities, "objectAtIndexedSubscript:", 0)),
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapsActivity")),
          v7 = objc_msgSend(v9, "copy"),
          v9,
          v8,
          !v7))
    {
      v7 = (id)objc_claimAutoreleasedReturnValue(+[MapsActivity mapsActivityPerDefault](MapsActivity, "mapsActivityPerDefault"));
    }
  }
  v10 = sub_10039DCD4(self->_activities, &stru_1011E9070);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GEOURLOptions accumulateObjects:](GEOURLOptions, "accumulateObjects:", v11));
  if (v12)
  {
    v13 = -[MapsActivityMergeController _forcedViewMode](self, "_forcedViewMode");
    v14 = 0;
    switch(v13)
    {
      case -1:
        goto LABEL_13;
      case 1:
      case 5:
        v14 = 2;
        goto LABEL_12;
      case 2:
      case 6:
        v14 = 1;
        goto LABEL_12;
      case 3:
        v14 = 3;
        goto LABEL_12;
      case 7:
        v14 = 4;
        goto LABEL_12;
      default:
LABEL_12:
        objc_msgSend(v12, "setMapType:", v14);
LABEL_13:
        objc_msgSend(v7, "setDisplayOptions:", v12);
        break;
    }
  }
  v15 = -[RichMapsActivity initWithMapsActivity:mapsAction:]([RichMapsActivity alloc], "initWithMapsActivity:mapsAction:", v7, v4);
  mergedActivity = self->_mergedActivity;
  self->_mergedActivity = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "UUIDString"));

  v19 = sub_100431A4C();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v18;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "_mergedActivity (tag %@)", buf, 0xCu);
  }

  v21 = self->_mergedActivity;
  global_queue = dispatch_get_global_queue(-2, 0);
  v23 = objc_claimAutoreleasedReturnValue(global_queue);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100C00A8C;
  v26[3] = &unk_1011AC8B0;
  v27 = v18;
  v28 = v21;
  v24 = v21;
  v25 = v18;
  dispatch_async(v23, v26);

}

- (int64_t)_forcedViewMode
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  int64_t v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("__internal_ForcedViewMode")));

  if (!v3)
    return -1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = (unint64_t)objc_msgSend(v4, "integerForKey:", CFSTR("__internal_ForcedViewMode"));
  if (v5 > 7)
    v6 = -1;
  else
    v6 = qword_100E3F2E0[v5];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergedActivity, 0);
  objc_storeStrong((id *)&self->_activities, 0);
}

@end
