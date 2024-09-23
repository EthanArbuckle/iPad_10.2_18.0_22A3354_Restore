@implementation MSDCellularHelper

+ (id)sharedInstance
{
  if (qword_100175308 != -1)
    dispatch_once(&qword_100175308, &stru_10013E838);
  return (id)qword_100175300;
}

- (MSDCellularHelper)init
{
  MSDCellularHelper *v2;
  void *v3;
  dispatch_queue_t v4;
  const __CFBoolean *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MSDCellularHelper;
  v2 = -[MSDCellularHelper init](&v10, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
    -[MSDCellularHelper setCellularSlotsInfo:](v2, "setCellularSlotsInfo:", v3);

    v4 = dispatch_queue_create("com.apple.msd.cellular", 0);
    -[MSDCellularHelper setCellularQueue:](v2, "setCellularQueue:", v4);

    v5 = (const __CFBoolean *)MGCopyAnswer(CFSTR("HasBaseband"), 0);
    -[MSDCellularHelper setCellularCapable:](v2, "setCellularCapable:", CFBooleanGetValue(v5) != 0);
    v7 = (void *)objc_opt_new(NSMutableArray, v6);
    -[MSDCellularHelper setObservers:](v2, "setObservers:", v7);

    if (-[MSDCellularHelper cellularCapable](v2, "cellularCapable"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v8, "addObserver:selector:name:object:", v2, "_handleCellularPlanInfoDidChange:", CTCellularPlanInfoDidChangeNotification, 0);

      -[MSDCellularHelper _fetchCellularPlanItems](v2, "_fetchCellularPlanItems");
    }
  }
  return v2;
}

- (NSDictionary)cellularInfo
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100041EE0;
  v11 = sub_100041EF0;
  v12 = 0;
  if (-[MSDCellularHelper cellularCapable](self, "cellularCapable"))
  {
    v3 = objc_claimAutoreleasedReturnValue(-[MSDCellularHelper cellularQueue](self, "cellularQueue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100041EF8;
    v6[3] = &unk_10013E510;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(v3, v6);

    v4 = (id)v8[5];
  }
  else
  {
    v4 = 0;
  }
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (id)getCellularSimInfo
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCellularHelper cellularInfo](self, "cellularInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("Slots")));

  return v3;
}

- (BOOL)embeddedSIMInstalled
{
  NSObject *v3;
  BOOL v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  if (-[MSDCellularHelper cellularCapable](self, "cellularCapable"))
  {
    v3 = objc_claimAutoreleasedReturnValue(-[MSDCellularHelper cellularQueue](self, "cellularQueue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004208C;
    v6[3] = &unk_10013E860;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(v3, v6);

    v4 = *((_BYTE *)v8 + 24) != 0;
  }
  else
  {
    v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)addObserver:(id)a3
{
  id v4;
  MSDCellularHelper *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCellularHelper observers](v5, "observers"));
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if ((v7 & 1) == 0)
  {
    v8 = sub_1000604F0();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Adding cellular oberver: %{public}@", (uint8_t *)&v11, 0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCellularHelper observers](v5, "observers"));
    objc_msgSend(v10, "addObject:", v4);

  }
  objc_sync_exit(v5);

}

- (void)removeObserver:(id)a3
{
  id v4;
  MSDCellularHelper *v5;
  void *v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCellularHelper observers](v5, "observers"));
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if (v7)
  {
    v8 = sub_1000604F0();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Removing cellular oberver: %{public}@", (uint8_t *)&v11, 0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCellularHelper observers](v5, "observers"));
    objc_msgSend(v10, "removeObject:", v4);

  }
  objc_sync_exit(v5);

}

- (BOOL)hasObserver:(id)a3
{
  id v4;
  MSDCellularHelper *v5;
  void *v6;
  unsigned __int8 v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCellularHelper observers](v5, "observers"));
  v7 = objc_msgSend(v6, "containsObject:", v4);

  objc_sync_exit(v5);
  return v7;
}

- (void)_fetchCellularPlanItems
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  _UNKNOWN **v14;
  void *v15;
  void *v16;
  void *v17;
  MSDCellularHelper *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *j;
  void *v23;
  id v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0));
  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Fetching cellular plan items...", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CTCellularPlanManager sharedManager](CTCellularPlanManager, "sharedManager"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "planItemsShouldUpdate:", 0));

  if (v26 && objc_msgSend(v26, "count"))
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v6 = v26;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v32 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
          v11 = sub_1000604F0();
          v12 = objc_claimAutoreleasedReturnValue(v11);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v37 = v10;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Found cellular plan item: %{public}@", buf, 0xCu);
          }

          if (!objc_msgSend(v10, "type") || objc_msgSend(v10, "type") == (id)2)
          {
            v13 = objc_alloc_init((Class)NSMutableDictionary);
            if (objc_msgSend(v10, "type"))
              v14 = &off_10014D898;
            else
              v14 = &off_10014D8B0;
            objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("SimType"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "carrierName"));
            v16 = v15;
            if (v15 && objc_msgSend(v15, "length"))
            {
              objc_msgSend(v13, "setObject:forKey:", v16, CFSTR("Provider"));
            }
            else
            {
              v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
              objc_msgSend(v13, "setObject:forKey:", v17, CFSTR("Provider"));

            }
            objc_msgSend(v2, "addObject:", v13);

          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
      }
      while (v7);
    }

    v18 = self;
    objc_sync_enter(v18);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCellularHelper observers](v18, "observers"));
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)j), "cellularPlanDidChange:", v2);
        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v20);
    }

    objc_sync_exit(v18);
  }
  else
  {
    v24 = sub_1000604F0();
    v18 = (MSDCellularHelper *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(&v18->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, &v18->super, OS_LOG_TYPE_DEFAULT, "No cellular plan items found.", buf, 2u);
    }
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v2));
  -[MSDCellularHelper setCellularSlotsInfo:](self, "setCellularSlotsInfo:", v23);

}

- (void)_handleCellularPlanInfoDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received notification for cellular plan info change!", buf, 2u);
  }

  v6 = objc_claimAutoreleasedReturnValue(-[MSDCellularHelper cellularQueue](self, "cellularQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100042988;
  block[3] = &unk_10013D868;
  block[4] = self;
  dispatch_async(v6, block);

}

- (NSArray)cellularSlotsInfo
{
  return self->_cellularSlotsInfo;
}

- (void)setCellularSlotsInfo:(id)a3
{
  objc_storeStrong((id *)&self->_cellularSlotsInfo, a3);
}

- (OS_dispatch_queue)cellularQueue
{
  return self->_cellularQueue;
}

- (void)setCellularQueue:(id)a3
{
  objc_storeStrong((id *)&self->_cellularQueue, a3);
}

- (BOOL)cellularCapable
{
  return self->_cellularCapable;
}

- (void)setCellularCapable:(BOOL)a3
{
  self->_cellularCapable = a3;
}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_cellularQueue, 0);
  objc_storeStrong((id *)&self->_cellularSlotsInfo, 0);
}

@end
