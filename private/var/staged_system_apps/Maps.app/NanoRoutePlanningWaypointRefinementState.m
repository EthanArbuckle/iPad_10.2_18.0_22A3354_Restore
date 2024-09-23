@implementation NanoRoutePlanningWaypointRefinementState

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  NSObject *v19;
  NSObject *isolationQueue;
  id v21;
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  NSObject *v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningState manager](self, "manager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "request"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "waypoints"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "waypoints"));
  v7 = sub_10039DCD4(v6, &stru_1011DA1D0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = objc_msgSend(v8, "count");
  v10 = objc_msgSend(v5, "count");
  v11 = sub_10043214C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v9 == v10)
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "All waypoints are already refined", buf, 2u);
    }

    -[NanoRoutePlanningWaypointRefinementState _handleCompletionWithWaypoints:error:](self, "_handleCompletionWithWaypoints:error:", v5, 0);
  }
  else
  {
    if (v13)
    {
      *(_DWORD *)buf = 134217984;
      v32 = objc_msgSend(v5, "count");
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Will refine %lu waypoints", buf, 0xCu);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "traits"));
    v15 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 2);
    v16 = dispatch_group_create();
    dispatch_group_enter(v16);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100898BA8;
    v26[3] = &unk_1011DA220;
    v27 = v16;
    v28 = v14;
    v29 = v4;
    v17 = v15;
    v30 = v17;
    v18 = v14;
    v19 = v16;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v26);
    dispatch_group_leave(v19);
    objc_initWeak((id *)buf, self);
    isolationQueue = self->super._isolationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100898E88;
    block[3] = &unk_1011AFF10;
    objc_copyWeak(&v25, (id *)buf);
    v23 = v17;
    v24 = v5;
    v21 = v17;
    dispatch_group_notify(v19, isolationQueue, block);

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);

  }
}

- (void)_handleCompletionWithWaypoints:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;

  v6 = a3;
  v7 = a4;
  if (-[NanoRoutePlanningState isActive](self, "isActive"))
  {
    v8 = sub_10039DCD4(v6, &stru_1011DA260);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = sub_10043214C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = v11;
    if (v7)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v22 = v7;
        v23 = 2114;
        v24 = v9;
        v13 = "Error refining waypoints: %{public}@\nRefinement success: %{public}@";
        v14 = v12;
        v15 = OS_LOG_TYPE_ERROR;
        v16 = 22;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v14, v15, v13, buf, v16);
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v22 = v9;
      v13 = "Refined waypoints (%{public}@)";
      v14 = v12;
      v15 = OS_LOG_TYPE_INFO;
      v16 = 12;
      goto LABEL_7;
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningState manager](self, "manager"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1008992AC;
    v18[3] = &unk_1011DA190;
    v19 = v6;
    v20 = v7;
    objc_msgSend(v17, "updateWithBlock:", v18);

  }
}

@end
