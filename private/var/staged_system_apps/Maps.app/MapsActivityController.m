@implementation MapsActivityController

- (MapsActivityController)init
{
  MapsActivityController *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *loggingQueue;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MapsActivityController;
  v2 = -[MapsActivityController init](&v16, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);
    v6 = objc_claimAutoreleasedReturnValue(v5);

    v7 = dispatch_queue_create("com.apple.MapsActivity", v6);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_BACKGROUND, 0);
    v12 = objc_claimAutoreleasedReturnValue(v11);

    v13 = dispatch_queue_create("com.apple.MapsActivity.Logging", v12);
    loggingQueue = v2->_loggingQueue;
    v2->_loggingQueue = (OS_dispatch_queue *)v13;

  }
  return v2;
}

- (id)mapsUserActivityForStateRestoration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivityController delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapsActivity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "data"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v6 = objc_msgSend(objc_alloc((Class)NSUserActivity), "initWithActivityType:", CFSTR("com.apple.Maps.Restore"));
  v9[0] = CFSTR("MapsActivity");
  v9[1] = CFSTR("MapsActivityTimestamp");
  v10[0] = v4;
  v10[1] = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2));
  objc_msgSend(v6, "setUserInfo:", v7);

  return v6;
}

- (id)_mapsUserActivity
{
  NSUserActivity *mapsUserActivity;
  NSUserActivity *v4;
  NSUserActivity *v5;

  mapsUserActivity = self->_mapsUserActivity;
  if (!mapsUserActivity)
  {
    v4 = (NSUserActivity *)objc_msgSend(objc_alloc((Class)NSUserActivity), "initWithActivityType:", CFSTR("com.apple.Maps"));
    v5 = self->_mapsUserActivity;
    self->_mapsUserActivity = v4;

    -[NSUserActivity setDelegate:](self->_mapsUserActivity, "setDelegate:", self);
    -[NSUserActivity setEligibleForHandoff:](self->_mapsUserActivity, "setEligibleForHandoff:", 1);
    -[NSUserActivity setEligibleForPublicIndexing:](self->_mapsUserActivity, "setEligibleForPublicIndexing:", 0);
    -[NSUserActivity setEligibleForSearch:](self->_mapsUserActivity, "setEligibleForSearch:", 0);
    mapsUserActivity = self->_mapsUserActivity;
  }
  return mapsUserActivity;
}

- (void)_updateUserActivity
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *accessQueue;
  id v17;
  void *v18;
  unsigned int v19;
  _QWORD block[4];
  id v21;
  MapsActivityController *v22;
  _QWORD v23[4];
  _QWORD v24[4];

  -[MapsActivityController _maps_setNeedsUpdate:withSelector:](self, "_maps_setNeedsUpdate:withSelector:", 0, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivityController delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapsActivityWithFidelity:", 268435439));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivityController delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapsActivityWithFidelity:", 268435407));

  if (v4 && v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 3600.0));
    v23[0] = CFSTR("f");
    v23[1] = CFSTR("c");
    v24[0] = v4;
    v24[1] = v6;
    v23[2] = CFSTR("t");
    v23[3] = CFSTR("x");
    v24[2] = v7;
    v24[3] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 4));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivityController delegate](self, "delegate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "appCoordinator"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "baseActionCoordinator"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentMapItem"));

    if (v13)
    {
      v14 = objc_msgSend(v9, "mutableCopy");
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("m"));
      v15 = objc_msgSend(v14, "copy");

      v9 = v15;
    }
    -[MapsActivityController set_cachedMapsActivityDataDictionary:](self, "set_cachedMapsActivityDataDictionary:", v9);
    accessQueue = self->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1009A7924;
    block[3] = &unk_1011AC8B0;
    v17 = v7;
    v21 = v17;
    v22 = self;
    dispatch_async(accessQueue, block);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v19 = objc_msgSend(v18, "BOOLForKey:", CFSTR("__internal__EnableTestMode"));

    if (v19)
      -[MapsActivityController writeCurrentState:](self, "writeCurrentState:", v4);

  }
}

- (void)_updateUserActivityWithMapsActivityAtFullFidelity:(id)a3 atCompactFidelity:(id)a4 title:(id)a5 expirationDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  uint8_t buf[4];
  void *v41;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc_init((Class)NSMutableDictionary);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivityController _mapsUserActivity](self, "_mapsUserActivity"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bzip2CompressedData"));
  if ((unint64_t)objc_msgSend(v16, "length") >= 0x2329)
  {
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bzip2DataByIterativelyReducingIfNeeded"));

    v16 = (void *)v17;
  }
  if (v16)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("bs"));
  objc_msgSend(v15, "setTitle:", v12);
  objc_msgSend(v15, "setExpirationDate:", v13);

  objc_msgSend(v15, "setRequiredUserInfoKeys:", 0);
  objc_msgSend(v15, "setUserInfo:", v14);
  objc_msgSend(v15, "setEligibleForSearch:", objc_msgSend(v10, "shouldIndex"));
  objc_msgSend(v15, "setEligibleForPrediction:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapsSiriAction"));
  if (v18)
  {
    v36 = v14;
    v38 = v11;
    v19 = sub_10043188C();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "title"));
      *(_DWORD *)buf = 138477827;
      v41 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Created Siri Action for '%{private}@'", buf, 0xCu);

    }
    v22 = v12;

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "userInfo"));
    v24 = objc_msgSend(v23, "mutableCopy");

    if (v16)
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v16, CFSTR("bs"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "title", v36, v38));
    objc_msgSend(v15, "setTitle:", v25);

    objc_msgSend(v15, "setUserInfo:", v24);
    v26 = objc_alloc((Class)NSSet);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "userInfo"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "allKeys"));
    v29 = objc_msgSend(v26, "initWithArray:", v28);
    objc_msgSend(v15, "setRequiredUserInfoKeys:", v29);

    objc_msgSend(v15, "setEligibleForPrediction:", 1);
    v12 = v22;
    v14 = v37;
    v11 = v39;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivityController _cachedMapsActivityDataDictionary](self, "_cachedMapsActivityDataDictionary"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("m")));

  objc_msgSend(v15, "setContentAttributeSet:", 0);
  if (v31)
  {
    v32 = sub_10043188C();
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "name"));
      *(_DWORD *)buf = 138477827;
      v41 = v34;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Add App Donation for '%{private}@'", buf, 0xCu);

    }
    objc_msgSend(v15, "_mapkit_populateFieldsForDonationOfMapItem:", v31);
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "_activityURL"));
    objc_msgSend(v15, "setWebpageURL:", v35);

  }
  else
  {
    objc_msgSend(v15, "_mapkit_clearMapItemDonationFields");
  }

}

- (void)userActivityWillSave:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1009A7E44;
  block[3] = &unk_1011AC8B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(accessQueue, block);

}

- (void)setNeedsUserActivityUpdate
{
  BOOL v3;

  if (self->_needToWaitForHandoff)
  {
    v3 = 1;
  }
  else
  {
    -[MapsActivityController _maps_setNeedsUpdateWithSelector:](self, "_maps_setNeedsUpdateWithSelector:", "_updateUserActivity");
    v3 = 0;
  }
  self->_needToUpdateHandoff = v3;
}

- (void)archiveMapsActivity
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  signed int v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  NSObject *loggingQueue;
  id v28;
  id v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  _QWORD block[4];
  id v34;
  id v35;
  _QWORD v36[5];
  uint8_t buf[4];
  void *v38;

  v3 = sub_10043188C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = os_signpost_id_generate(v4);

  v6 = sub_10043188C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v5, "Archive", ", buf, 2u);
  }

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1009A8444;
  v36[3] = &unk_1011AC860;
  v36[4] = self;
  v9 = objc_retainBlock(v36);
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
    ((void (*)(_QWORD *))v9[2])(v9);
  else
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivityController delegate](self, "delegate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapsActivity"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "displayOptions"));
  v13 = objc_msgSend(v12, "hasCamera");

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "displayOptions"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "camera"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "data"));
    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults __maps_groupUserDefaults](NSUserDefaults, "__maps_groupUserDefaults"));
      objc_msgSend(v17, "setObject:forKey:", v16, CFSTR("MapsLastActivityCamera"));

    }
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "displayOptions"));
  v19 = objc_msgSend(v18, "hasMapType");

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "displayOptions"));
    v21 = objc_msgSend(v20, "mapType");

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults __maps_groupUserDefaults](NSUserDefaults, "__maps_groupUserDefaults"));
    objc_msgSend(v22, "setInteger:forKey:", v21, CFSTR("MapsLastActivityMapType"));

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "UUIDString"));

  v25 = sub_10043188C();
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v24;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Archiving MapsActivity (tag %@)", buf, 0xCu);
  }

  loggingQueue = self->_loggingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1009A84FC;
  block[3] = &unk_1011AC8B0;
  v34 = v24;
  v35 = v11;
  v28 = v11;
  v29 = v24;
  dispatch_async(loggingQueue, block);
  v30 = sub_10043188C();
  v31 = objc_claimAutoreleasedReturnValue(v30);
  v32 = v31;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_END, v5, "Archive", ", buf, 2u);
  }

}

- (id)_cleanDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v4 = objc_msgSend(a3, "mutableCopy");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
  v6 = objc_msgSend(v5, "copy");

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v12, (_QWORD)v21));
        v14 = objc_opt_class(NSData);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
        {
          objc_msgSend(v4, "removeObjectForKey:", v12);
          goto LABEL_13;
        }
        v15 = objc_opt_class(NSDictionary);
        if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0)
        {
          v16 = objc_claimAutoreleasedReturnValue(-[MapsActivityController _cleanDictionary:](self, "_cleanDictionary:", v13));
        }
        else
        {
          v17 = objc_opt_class(NSArray);
          if ((objc_opt_isKindOfClass(v13, v17) & 1) == 0)
            goto LABEL_13;
          v16 = objc_claimAutoreleasedReturnValue(-[MapsActivityController _cleanArray:](self, "_cleanArray:", v13));
        }
        v18 = (void *)v16;
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, v12);

LABEL_13:
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  v19 = objc_msgSend(v4, "copy");
  return v19;
}

- (id)_cleanArray:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v10);
        v12 = objc_opt_class(NSData);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) == 0)
        {
          v13 = objc_opt_class(NSDictionary);
          if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
          {
            v14 = objc_claimAutoreleasedReturnValue(-[MapsActivityController _cleanDictionary:](self, "_cleanDictionary:", v11));
LABEL_11:
            v16 = (void *)v14;
            objc_msgSend(v5, "addObject:", v14, (_QWORD)v19);

            goto LABEL_13;
          }
          v15 = objc_opt_class(NSArray);
          if ((objc_opt_isKindOfClass(v11, v15) & 1) != 0)
          {
            v14 = objc_claimAutoreleasedReturnValue(-[MapsActivityController _cleanArray:](self, "_cleanArray:", v11));
            goto LABEL_11;
          }
          objc_msgSend(v5, "addObject:", v11, (_QWORD)v19);
        }
LABEL_13:
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  v17 = objc_msgSend(v5, "copy");
  return v17;
}

- (void)writeCurrentState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;

  v4 = a3;
  if (qword_1014D3BD0 != -1)
    dispatch_once(&qword_1014D3BD0, &stru_1011DD9C0);
  if (qword_1014D3BC8)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dictionaryRepresentation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivityController _cleanDictionary:](self, "_cleanDictionary:", v5));

    v18 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v6, 1, &v18));
    v8 = v18;
    if (v8)
    {
      v9 = v8;
      v10 = sub_10043188C();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description"));
        *(_DWORD *)buf = 138412290;
        v20 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "_writeCurrentState invalid json %@", buf, 0xCu);

      }
    }
    else
    {
      v11 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v7, 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", qword_1014D3BC8));
      v17 = 0;
      -[NSObject writeToURL:atomically:encoding:error:](v11, "writeToURL:atomically:encoding:error:", v13, 1, 4, &v17);
      v9 = v17;

      if (v9)
      {
        v14 = sub_10043188C();
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description"));
          *(_DWORD *)buf = 138412290;
          v20 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }

  }
}

- (MapsActivityControllerDelegate)delegate
{
  return (MapsActivityControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDictionary)_cachedMapsActivityDataDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)set_cachedMapsActivityDataDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cachedMapsActivityDataDictionary, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_loggingQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_mapsUserActivity, 0);
}

@end
