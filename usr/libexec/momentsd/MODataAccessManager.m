@implementation MODataAccessManager

- (MODataAccessManager)initWithUniverse:(id)a3
{
  id v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  MODataAccessManager *v11;
  MODataAccessManager *v12;
  dispatch_queue_attr_t v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *refreshSchedulingQueue;
  objc_super v18;

  v5 = a3;
  v7 = (objc_class *)objc_opt_class(MODefaultsManager, v6);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v9));

  v18.receiver = self;
  v18.super_class = (Class)MODataAccessManager;
  v11 = -[MODataAccessManager init](&v18, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_universe, a3);
    objc_storeStrong((id *)&v12->_defaultsManager, v10);
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = dispatch_queue_create("MODataAccessManager.refreshSchedulingQueue", v14);
    refreshSchedulingQueue = v12->_refreshSchedulingQueue;
    v12->_refreshSchedulingQueue = (OS_dispatch_queue *)v15;

  }
  return v12;
}

- (void)getApplicationsWithDataAccess:(id)a3
{
  MODataAccessManager *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void (**v8)(id, void *, _QWORD);

  v8 = (void (**)(id, void *, _QWORD))a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MODataAccessManager defaultsManager](v4, "defaultsManager"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("ApplicationsWithDataAccess")));

  if (v6)
    v7 = (void *)v6;
  else
    v7 = &__NSDictionary0__struct;
  v8[2](v8, v7, 0);

  objc_sync_exit(v4);
}

- (void)registerApplicationsForDataAccess:(id)a3
{
  id v4;
  MODataAccessManager *v5;
  void *v6;
  void *v7;
  id v8;
  NSNumber *v9;
  void *v10;
  NSNumber *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MODataAccessManager defaultsManager](v5, "defaultsManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("ApplicationsWithDataAccess")));

  if (v7)
  {
    v8 = objc_msgSend(v7, "mutableCopy");
    v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CFAbsoluteTimeGetCurrent());
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    objc_msgSend(v8, "setObject:forKey:", v10, v4);

  }
  else
  {
    v14 = v4;
    v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CFAbsoluteTimeGetCurrent());
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v15 = v12;
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MODataAccessManager defaultsManager](v5, "defaultsManager"));
  objc_msgSend(v13, "setObject:forKey:", v8, CFSTR("ApplicationsWithDataAccess"));

  objc_sync_exit(v5);
}

- (void)getClientsWithDataAccess:(id)a3
{
  MODataAccessManager *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void (**v8)(id, void *, _QWORD);

  v8 = (void (**)(id, void *, _QWORD))a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MODataAccessManager defaultsManager](v4, "defaultsManager"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("ClientsWithDataAccess")));

  if (v6)
    v7 = (void *)v6;
  else
    v7 = &__NSDictionary0__struct;
  v8[2](v8, v7, 0);

  objc_sync_exit(v4);
}

- (BOOL)_needsActivityRegistrationAfterRegisteringClientsForDataAccess:(id)a3
{
  id v4;
  MODataAccessManager *v5;
  void *v6;
  void *v7;
  id v8;
  NSNumber *v9;
  void *v10;
  NSNumber *v11;
  void *v12;
  void *v13;
  id v15;
  void *v16;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MODataAccessManager defaultsManager](v5, "defaultsManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("ClientsWithDataAccess")));

  if (v7)
  {
    v8 = objc_msgSend(v7, "mutableCopy");
    v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CFAbsoluteTimeGetCurrent());
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    objc_msgSend(v8, "setObject:forKey:", v10, v4);

  }
  else
  {
    v15 = v4;
    v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CFAbsoluteTimeGetCurrent());
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v16 = v12;
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MODataAccessManager defaultsManager](v5, "defaultsManager"));
  objc_msgSend(v13, "setObject:forKey:", v8, CFSTR("ClientsWithDataAccess"));

  objc_sync_exit(v5);
  return v7 == 0;
}

- (void)_registerForOnboardingRefresh:(id)a3
{
  id v4;
  id os_log;
  NSObject *v6;
  MODaemonUniverse *universe;
  uint64_t v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;

  v4 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityOnboarding);
  v6 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Posting onboarding refresh request after first data access client registered [%@]", (uint8_t *)&v13, 0xCu);
  }

  universe = self->_universe;
  v9 = (objc_class *)objc_opt_class(MOEventRefreshScheduler, v8);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse getService:](universe, "getService:", v11));

  objc_msgSend(v12, "registerDefaultRefreshActivity");
  objc_msgSend(v12, "registerFirstRefreshActivityWithPreRegisteredTask:", 0);
  objc_msgSend(v12, "registerLightRefreshActivity");

}

- (void)registerClientsForDataAccess:(id)a3
{
  id v4;
  NSObject *refreshSchedulingQueue;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (-[MODataAccessManager _needsActivityRegistrationAfterRegisteringClientsForDataAccess:](self, "_needsActivityRegistrationAfterRegisteringClientsForDataAccess:", v4))
  {
    refreshSchedulingQueue = self->_refreshSchedulingQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __52__MODataAccessManager_registerClientsForDataAccess___block_invoke;
    v6[3] = &unk_1002AD508;
    v6[4] = self;
    v7 = v4;
    dispatch_async(refreshSchedulingQueue, v6);

  }
}

id __52__MODataAccessManager_registerClientsForDataAccess___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registerForOnboardingRefresh:", *(_QWORD *)(a1 + 40));
}

- (void)getApplicationsWithDataAccess:(id)a3 withinTimeInterval:(double)a4
{
  id v6;
  double Current;
  double v8;
  _QWORD v9[4];
  id v10;
  double v11;
  double v12;

  v6 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  if (a4 <= 0.0)
  {
    -[MODataAccessManager getApplicationsWithDataAccess:](self, "getApplicationsWithDataAccess:", v6, Current);
  }
  else
  {
    v8 = Current;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __72__MODataAccessManager_getApplicationsWithDataAccess_withinTimeInterval___block_invoke;
    v9[3] = &unk_1002AD530;
    v10 = v6;
    v11 = a4;
    v12 = v8;
    -[MODataAccessManager getApplicationsWithDataAccess:](self, "getApplicationsWithDataAccess:", v9);

  }
}

void __72__MODataAccessManager_getApplicationsWithDataAccess_withinTimeInterval___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSMutableDictionary *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v6 = objc_opt_new(NSMutableDictionary);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v12, (_QWORD)v16));
          v14 = v13;
          if (v13)
          {
            objc_msgSend(v13, "doubleValue");
            if (v15 + *(double *)(a1 + 40) > *(double *)(a1 + 48))
              -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v14, v12);
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)getClientsWithDataAccess:(id)a3 withinTimeInterval:(double)a4
{
  id v6;
  double Current;
  double v8;
  _QWORD v9[4];
  id v10;
  double v11;
  double v12;

  v6 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  if (a4 <= 0.0)
  {
    -[MODataAccessManager getClientsWithDataAccess:](self, "getClientsWithDataAccess:", v6, Current);
  }
  else
  {
    v8 = Current;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __67__MODataAccessManager_getClientsWithDataAccess_withinTimeInterval___block_invoke;
    v9[3] = &unk_1002AD530;
    v10 = v6;
    v11 = a4;
    v12 = v8;
    -[MODataAccessManager getClientsWithDataAccess:](self, "getClientsWithDataAccess:", v9);

  }
}

void __67__MODataAccessManager_getClientsWithDataAccess_withinTimeInterval___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSMutableDictionary *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v6 = objc_opt_new(NSMutableDictionary);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v12, (_QWORD)v16));
          v14 = v13;
          if (v13)
          {
            objc_msgSend(v13, "doubleValue");
            if (v15 + *(double *)(a1 + 40) > *(double *)(a1 + 48))
              -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", v14, v12);
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (BOOL)hasAnyApplicationsWithDataAccessWithinTimeInterval:(double)a3
{
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __74__MODataAccessManager_hasAnyApplicationsWithDataAccessWithinTimeInterval___block_invoke;
  v5[3] = &unk_1002AD558;
  v5[4] = &v6;
  -[MODataAccessManager getApplicationsWithDataAccess:withinTimeInterval:](self, "getApplicationsWithDataAccess:withinTimeInterval:", v5, a3);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

_QWORD *__74__MODataAccessManager_hasAnyApplicationsWithDataAccessWithinTimeInterval___block_invoke(_QWORD *result, void *a2, uint64_t a3)
{
  _QWORD *v3;

  v3 = result;
  if (a3)
  {
    *(_BYTE *)(*(_QWORD *)(result[4] + 8) + 24) = 0;
  }
  else
  {
    result = objc_msgSend(a2, "count");
    *(_BYTE *)(*(_QWORD *)(v3[4] + 8) + 24) = result != 0;
  }
  return result;
}

- (BOOL)hasAnyClientsWithDataAccessWithinTimeInterval:(double)a3
{
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __69__MODataAccessManager_hasAnyClientsWithDataAccessWithinTimeInterval___block_invoke;
  v5[3] = &unk_1002AD558;
  v5[4] = &v6;
  -[MODataAccessManager getClientsWithDataAccess:withinTimeInterval:](self, "getClientsWithDataAccess:withinTimeInterval:", v5, a3);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

_QWORD *__69__MODataAccessManager_hasAnyClientsWithDataAccessWithinTimeInterval___block_invoke(_QWORD *result, void *a2, uint64_t a3)
{
  _QWORD *v3;

  v3 = result;
  if (a3)
  {
    *(_BYTE *)(*(_QWORD *)(result[4] + 8) + 24) = 0;
  }
  else
  {
    result = objc_msgSend(a2, "count");
    *(_BYTE *)(*(_QWORD *)(v3[4] + 8) + 24) = result != 0;
  }
  return result;
}

- (MODefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (MODaemonUniverse)universe
{
  return self->_universe;
}

- (void)setUniverse:(id)a3
{
  objc_storeStrong((id *)&self->_universe, a3);
}

- (OS_dispatch_queue)refreshSchedulingQueue
{
  return self->_refreshSchedulingQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshSchedulingQueue, 0);
  objc_storeStrong((id *)&self->_universe, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end
