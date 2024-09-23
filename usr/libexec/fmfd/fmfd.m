void sub_100005AB4(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void (**v7)(_QWORD, _QWORD);
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  id v17;
  _BYTE v18[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void (***)(_QWORD, _QWORD))(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v8 = sub_100011D0C();
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = objc_retainBlock(v7);
          *(_DWORD *)buf = 138412290;
          v17 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Finally calling skipped block: %@", buf, 0xCu);

        }
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "error"));
        ((void (**)(_QWORD, void *))v7)[2](v7, v11);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v4);
  }

}

void sub_100005F70(uint64_t a1)
{
  uint64_t v2;
  id v3;
  NSObject *v4;
  id v5;
  FMFCoalescedCommand *v6;
  void *v7;
  int v8;
  id v9;

  v2 = *(_QWORD *)(a1 + 72);
  if (v2 > (uint64_t)objc_msgSend(*(id *)(a1 + 32), "coleasedRefreshPriority"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setColeasedRefreshPriority:", *(_QWORD *)(a1 + 72));
    v3 = sub_100011D0C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "coleasedRefreshPriority");
      v8 = 134217984;
      v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Updated refresh priority to: %ld", (uint8_t *)&v8, 0xCu);
    }

  }
  v6 = -[FMFCoalescedCommand initWithHandles:forSession:callerId:priority:reason:completionBlock:]([FMFCoalescedCommand alloc], "initWithHandles:forSession:callerId:priority:reason:completionBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 64));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "coalescedCommands"));
  objc_msgSend(v7, "addObject:", v6);

  objc_msgSend(*(id *)(a1 + 32), "_scheduleRefresh");
}

void sub_100006D04(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100006DB8(id *a1)
{
  dispatch_queue_global_t global_queue;
  NSObject *v3;
  void **v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id v9;

  global_queue = dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue(global_queue);
  v4 = _NSConcreteStackBlock;
  v5 = 3221225472;
  v6 = sub_100005AB4;
  v7 = &unk_100099348;
  v8 = a1[4];
  v9 = a1[5];
  dispatch_async(v3, &v4);

  objc_msgSend(a1[6], "setRefreshScheduled:", 0, v4, v5, v6, v7);
  objc_msgSend(a1[6], "_scheduleRefresh");

}

void sub_1000076D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000079A4(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  __int128 v17;
  NSMutableSet *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];

  v18 = objc_opt_new(NSMutableSet);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "allValues"));
  objc_msgSend(v2, "makeObjectsPerformSelector:", "clearFavoriteOrder");

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "favoritesData"));
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v21;
    *(_QWORD *)&v4 = 138412546;
    v17 = v4;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("id"), v17));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v9));
        if (v10)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("order")));
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
          if (v11 == v12)
            v13 = 0;
          else
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("order")));

          v14 = sub_100011D0C();
          v15 = objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v17;
            v25 = v10;
            v26 = 2112;
            v27 = v13;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Updating favorite order for %@ with %@.", buf, 0x16u);
          }

          if (v13)
          {
            objc_msgSend(v10, "setFavoriteOrder:", v13);
            -[NSMutableSet addObject:](v18, "addObject:", v10);
          }

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v5);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "favoritesHandlesInHandles:", v18));
  objc_msgSend(*(id *)(a1 + 40), "setFavoriteHandles:", v16);

}

void sub_100007C18(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_serverContext"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_100008984(id *a1)
{
  int v2;
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  unsigned int v15;

  v2 = byte_1000B3828;
  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v2 == 1)
  {
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "registeredDelegates"));
      *(_DWORD *)buf = 67109120;
      v15 = objc_msgSend(v6, "count");
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Checking for a handler for the APS message from %d registered delegates", buf, 8u);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "registeredDelegates"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10003E290;
    v11[3] = &unk_10009A9F8;
    v12 = a1[5];
    v13 = a1[6];
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

    v8 = v12;
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Startup is not complete. Queueing the aps message for later use", buf, 2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", a1[5], CFSTR("topic"));
    v9 = a1[6];
    if (v9)
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("message"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "pendingPushes"));
    objc_msgSend(v10, "addObject:", v8);

  }
}

void sub_100008FD4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
    objc_msgSend(v6, "clearTapMessagesCache");

  }
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006DB8;
  block[3] = &unk_10009A798;
  v10 = *(id *)(a1 + 32);
  v11 = v3;
  v12 = WeakRetained;
  v8 = v3;
  dispatch_async(v7, block);

}

void sub_1000090C4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  double v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "refreshTimer"));
  objc_msgSend(v2, "invalidate");

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "maxLocationRefreshTimeout"));

  v5 = *(double *)(a1 + 40);
  if (v4)
    v6 = (double)(int)objc_msgSend(v4, "intValue");
  else
    v6 = 60.0;
  if (v5 < v6)
    v6 = v5;
  if (v6 == 0.0)
    v7 = 60.0;
  else
    v7 = v6;
  v8 = sub_100011D0C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v11 = 134217984;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Refresh timer scheduled for %0.0f seconds", (uint8_t *)&v11, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 32), "refreshLocations", 0, 0, v7));
  objc_msgSend(*(id *)(a1 + 32), "setRefreshTimer:", v10);

}

void sub_100009470(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000097C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100009FE0(uint64_t a1, int a2)
{
  void *v2;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[6];
  _QWORD v34[6];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "changesToBeNotified"));
  if (a2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "fenceSequencer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fences"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("updatedFences"));

  }
  if (objc_msgSend(v5, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMFXPCSessionManager sharedInstance](FMFXPCSessionManager, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "clientSessions"));
    objc_msgSend(WeakRetained, "updateSessionCaches:forSessions:pushAllData:", v5, v9, 0);

    objc_msgSend(WeakRetained, "notifyClientOfUpdates:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("followers")));
    if (v10
      || (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pendingOffers")))) != 0
      || (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("futureFollower")))) != 0
      || (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("following")))) != 0
      || (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("favorites")))) != 0
      || (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("devices")))) != 0
      || (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("meDevice")))) != 0)
    {

    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("updatedFences")));

      if (!v23)
        goto LABEL_33;
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "storeController"));
    v33[0] = off_1000B2C68[0];
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "followerHandles"));
    if (v31)
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "followerHandles"));
    else
      v11 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v30 = (void *)v11;
    v34[0] = v11;
    v33[1] = off_1000B2C70[0];
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "followingHandles"));
    if (v29)
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "followingHandles"));
    else
      v12 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v28 = (void *)v12;
    v34[1] = v12;
    v33[2] = off_1000B2C78[0];
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_meDevice"));
    if (v27)
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_meDevice"));
    else
      v13 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v26 = (void *)v13;
    v34[2] = v13;
    v33[3] = off_1000B2C80[0];
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_devices"));
    if (v24)
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_devices", v24));
    else
      v14 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null", 0));
    v15 = (void *)v14;
    v34[3] = v14;
    v33[4] = off_1000B2C90[0];
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "modelVersion"));
    if (v16)
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "modelVersion"));
    else
      v17 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v18 = (void *)v17;
    v34[4] = v17;
    v33[5] = off_1000B2C88[0];
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "fenceSequencer"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "fences"));
    if (v20)
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "fenceSequencer"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fences"));
    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    }
    v34[5] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 6));
    objc_msgSend(v32, "updateModelCacheWithData:", v22);

    if (v20)
    {

      v21 = v2;
    }

  }
LABEL_33:

}

void sub_10000AA0C(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "internalClientSessions", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "keyEnumerator"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7));
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

void sub_10000AB14(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "internalClientSessions"));
  v3 = objc_msgSend(v2, "count");

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "internalClientSessions"));
  objc_msgSend(v4, "setObject:forKey:", &off_1000A0F90, *(_QWORD *)(a1 + 40));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "internalClientSessions"));
  v6 = objc_msgSend(v5, "count");

  if (v6 > v3)
  {
    v7 = sub_100011D0C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "internalClientSessions"));
      v11 = objc_msgSend(v10, "count");
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_internalClientSessionPIDsString"));
      v13 = 138412802;
      v14 = v9;
      v15 = 2048;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "📩 Added: %@ (%lu active pids: {%@})", (uint8_t *)&v13, 0x20u);

    }
  }
}

void sub_10000AD78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_10000C3F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_10000CA94(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_handlesInternal"));
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_10000D398(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 144));
  _Unwind_Resume(a1);
}

void sub_10000D4CC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000E674(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  FMFRefreshCommand *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  FMFRefreshCommand *v33;
  void *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id location;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "coalescedCommands"));
  v32 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "firstObject"));

  v2 = v32;
  if (v32)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "session"));
    v3 = objc_msgSend(v32, "reason");
    v4 = -[FMFBaseCmd initWithClientSession:]([FMFRefreshCommand alloc], "initWithClientSession:", v31);
    -[FMFRefreshCommand setType:](v4, "setType:", *(_QWORD *)(a1 + 40));
    v33 = v4;
    -[FMFRefreshCommand setReason:](v4, "setReason:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCountedSet setWithCapacity:](NSCountedSet, "setWithCapacity:", 50));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "coalescedCommands"));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v41 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "completionBlock"));
          v14 = v13 == 0;

          if (!v14)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "completionBlock"));
            v16 = objc_retainBlock(v15);
            objc_msgSend(v5, "addObject:", v16);

          }
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "session"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "clientPid"));
          v19 = v18 == 0;

          if (!v19)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "session"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "clientPid"));
            objc_msgSend(v35, "addObject:", v21);

          }
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringForReasonCode:", objc_msgSend(v12, "reason")));
          objc_msgSend(v6, "addObject:", v23);

          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "handles"));
          objc_msgSend(v7, "unionSet:", v24);

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v9);
    }

    if (objc_msgSend(v6, "count"))
      -[FMFRefreshCommand setSkippedReasons:](v33, "setSkippedReasons:", v6);
    if (objc_msgSend(v35, "count"))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "allObjects"));
      -[FMFRefreshCommand setCoalescedAppContexts:](v33, "setCoalescedAppContexts:", v25);

    }
    v26 = objc_msgSend(*(id *)(a1 + 32), "coleasedRefreshPriority");
    objc_msgSend(*(id *)(a1 + 32), "setColeasedRefreshPriority:", 0);
    if (objc_msgSend(v7, "count"))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));
      -[FMFRefreshCommand setSelectedHandles:](v33, "setSelectedHandles:", v27);

      -[FMFRefreshCommand setIsShallowLocate:](v33, "setIsShallowLocate:", v26 != (id)1);
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "coalescedCommands"));
    objc_msgSend(v28, "removeAllObjects");

    objc_initWeak(&location, *(id *)(a1 + 32));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100008FD4;
    v36[3] = &unk_10009A7C0;
    objc_copyWeak(&v38, &location);
    v30 = v5;
    v37 = v30;
    objc_msgSend(v29, "sendCommand:completionBlock:", v33, v36);

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);

    v2 = v32;
  }

}

void sub_10000EAC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000EF78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100010EB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_100011C98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

id sub_100011D0C()
{
  if (qword_1000B37A8 != -1)
    dispatch_once(&qword_1000B37A8, &stru_10009A3B8);
  return (id)qword_1000B37B0;
}

void sub_100011FB0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000132AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_1000140D4(id a1, id a2, FMFLocation *a3, BOOL *a4)
{
  return -[FMFLocation isValid](a3, "isValid") ^ 1;
}

void sub_1000140F0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  ++qword_1000B3298;
  v2 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t sub_10001413C(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

id sub_10001414C(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "set_serverContext:", *(_QWORD *)(a1 + 40));
  return _objc_msgSend(*(id *)(a1 + 32), "saveNotificationToken");
}

void sub_100014B20(uint64_t a1)
{
  id v2;
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint8_t v9[16];

  v2 = sub_100011D0C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Creating shared instance of FMFNetworkObserver", v9, 2u);
  }

  v4 = objc_alloc_init((Class)objc_opt_class(*(_QWORD *)(a1 + 32)));
  v5 = (void *)qword_1000B3680;
  qword_1000B3680 = (uint64_t)v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CPNetworkObserver sharedNetworkObserver](CPNetworkObserver, "sharedNetworkObserver"));
  objc_msgSend(v6, "addNetworkReachableObserver:selector:", qword_1000B3680, "_reportReachabilityChange:");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CPNetworkObserver sharedNetworkObserver](CPNetworkObserver, "sharedNetworkObserver"));
  v8 = objc_msgSend(v7, "isNetworkReachable");
  objc_msgSend((id)qword_1000B3680, "setIsReachable:", v8);

}

void sub_100014CD8(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint8_t buf[4];
  unsigned int v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "userInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CPNetworkObserverReachable));
  objc_msgSend(*(id *)(a1 + 32), "setIsReachable:", objc_msgSend(v3, "BOOLValue"));

  v4 = sub_100011D0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "isReachable");
    *(_DWORD *)buf = 67109120;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "FMFNetworkObserver reachability changed. Is reachable: %d", buf, 8u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isReachable", CFSTR("status"))));
  v11 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "postNotificationName:object:userInfo:", off_1000B2FD8, *(_QWORD *)(a1 + 32), v8);

}

uint64_t start()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = objc_autoreleasePoolPush();
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedInstance](FMFDaemon, "sharedInstance"));
  objc_msgSend(v1, "run");

  objc_autoreleasePoolPop(v0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  objc_msgSend(v2, "run");

  return 0;
}

void sub_100016170(id a1)
{
  FMFUserNotificationManager *v1;
  void *v2;

  v1 = objc_opt_new(FMFUserNotificationManager);
  v2 = (void *)qword_1000B3690;
  qword_1000B3690 = (uint64_t)v1;

}

void sub_100016D30(uint64_t a1)
{
  id v2;
  NSObject *v3;
  FMFDStoreController *v4;
  void *v5;
  dispatch_queue_t v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  v2 = sub_100011D0C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Creating shared instance of FMFDStoreController", v14, 2u);
  }

  v4 = objc_alloc_init(FMFDStoreController);
  v5 = (void *)qword_1000B36A0;
  qword_1000B36A0 = (uint64_t)v4;

  v6 = dispatch_queue_create("com.apple.icloud.fmfd.storecontroller", 0);
  objc_msgSend((id)qword_1000B36A0, "setQueue:", v6);

  v7 = objc_alloc((Class)FMDataArchiver);
  v8 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32)), "cacheFileURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_msgSend(v7, "initWithFileURL:", v9);

  objc_msgSend(v10, "setDataProtectionClass:", 3);
  objc_msgSend(v10, "setBackedUp:", 0);
  objc_msgSend(v10, "setCreateDirectories:", 1);
  objc_msgSend((id)qword_1000B36A0, "setDataArchiver:", v10);
  v11 = objc_alloc_init((Class)FMKeychainManager);
  objc_msgSend((id)qword_1000B36A0, "setKeychainManager:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v12, "addObserver:selector:name:object:", qword_1000B36A0, "accountWasRemoved", off_1000B2FC0, 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v13, "addObserver:selector:name:object:", qword_1000B36A0, "cleanupOldModel", off_1000B2FE8, 0);

}

void sub_1000171C0(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  const __CFString *v21;
  NSObject *v22;

  objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32)), "cleanupLegacyStoredDataIfNeeded");
  v2 = *(_QWORD *)(a1 + 40);
  v18 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v2, 1, &v18));
  v4 = v18;
  if (v4)
  {
    v5 = v4;
    v6 = sub_100011D0C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10006320C(v5);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "passwordData"));
    v17 = 0;
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "encryptWithKey:error:", v8, &v17));
    v5 = v17;

    if (v5)
    {
      v9 = sub_100011D0C();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_100063194(v5);
    }
    else
    {
      v21 = CFSTR("modelCache");
      v22 = v7;
      v10 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dataArchiver"));
      v16 = 0;
      objc_msgSend(v11, "saveDictionary:error:", v10, &v16);
      v5 = v16;

      v12 = sub_100011D0C();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      v14 = v13;
      if (v5)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          sub_10006311C(v5);
      }
      else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v20 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Updating local model cache with data: %@", buf, 0xCu);
      }

    }
  }

}

void sub_10001797C(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  __CFString *v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32)), "cacheFileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v9 = 0;
  objc_msgSend(v2, "removeItemAtURL:error:", v4, &v9);
  v5 = v9;

  v6 = sub_100011D0C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000633EC(v5);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = off_1000B2C60[0];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Removed local model cache for key: %@", buf, 0xCu);
  }

}

void sub_100017B18(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

BOOL sub_100017D7C(id a1, CKShareParticipant *a2)
{
  return (id)-[CKShareParticipant acceptanceStatus](a2, "acceptanceStatus") == (id)2;
}

uint64_t sub_100017D9C(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

uint64_t sub_100017DBC(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

BOOL sub_100017E1C(id a1, CKShareParticipant *a2)
{
  return -[CKShareParticipant isCurrentUser](a2, "isCurrentUser") ^ 1;
}

void sub_100017F1C(id a1)
{
  FMFCloudKitManager *v1;
  void *v2;

  v1 = objc_opt_new(FMFCloudKitManager);
  v2 = (void *)qword_1000B36B0;
  qword_1000B36B0 = (uint64_t)v1;

}

id sub_100018398(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;

  v2 = sub_100011D0C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stringFromBootstrapReason:", *(_QWORD *)(a1 + 40)));
    v6 = 136315394;
    v7 = "-[FMFCloudKitManager bootstrapAccountWithReason:]_block_invoke";
    v8 = 2112;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: Bootstrapping! For reason: %@", (uint8_t *)&v6, 0x16u);

  }
  return objc_msgSend(*(id *)(a1 + 32), "bootstrap");
}

void sub_1000186BC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 104));
  _Unwind_Resume(a1);
}

void sub_100018708(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  id WeakRetained;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status")));
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    v7 = sub_100011D0C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315394;
      v11 = "-[FMFCloudKitManager bootstrap]_block_invoke";
      v12 = 2112;
      v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: note: %@", (uint8_t *)&v10, 0x16u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "postNotificationName:object:", CFSTR("FMFCloudKitManagerRetryBootstrapNotification"), *(_QWORD *)(a1 + 32));

  }
}

void sub_10001882C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;

  v3 = a2;
  v4 = sub_100011D0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[FMFCloudKitManager bootstrap]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: note: %@", (uint8_t *)&v7, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "postNotificationName:object:", CFSTR("FMFCloudKitManagerRetryBootstrapNotification"), *(_QWORD *)(a1 + 32));

}

void sub_100018914(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  _QWORD v12[6];
  id v13;
  __int128 buf;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setBoostrapScheduled:", 0);
  if (v3)
  {
    v4 = sub_100011D0C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100063464();

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v15 = 0x3032000000;
    v16 = sub_100018B30;
    v17 = sub_100018B40;
    v18 = 0;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100018B48;
    v12[3] = &unk_1000994F0;
    objc_copyWeak(&v13, (id *)(a1 + 40));
    v12[4] = *(_QWORD *)(a1 + 32);
    v12[5] = &buf;
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "addObserverForName:object:queue:usingBlock:", CFSTR("FMFCloudKitManagerRetryBootstrapNotification"), 0, v7, v12));
    v9 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v8;

    _Block_object_dispose(&buf, 8);
    objc_destroyWeak(&v13);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "fetchChangesWithCompletion:", &stru_100099530);
    v10 = sub_100011D0C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[FMFCloudKitManager bootstrap]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: bootstrapped privateCloudDatabase", (uint8_t *)&buf, 0xCu);
    }

  }
}

void sub_100018B14(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100018B30(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100018B40(uint64_t a1)
{

}

void sub_100018B48(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;

  v3 = a2;
  v4 = sub_100011D0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[FMFCloudKitManager bootstrap]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: note: %@", (uint8_t *)&v7, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  objc_msgSend(*(id *)(a1 + 32), "bootstrapAccountWithReason:", 2);
}

void sub_100018C3C(id a1, NSError *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;

  if (!a2)
  {
    v2 = sub_100011D0C();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[FMFCloudKitManager bootstrap]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: bootstrap changes fetched", (uint8_t *)&v4, 0xCu);
    }

  }
}

void sub_100018DF8(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v13 = sub_100011D0C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1000634D0();

    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    v8 = objc_alloc((Class)CKRecordZoneID);
    v9 = a1[4];
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordName"));
    v11 = objc_msgSend(v8, "initWithZoneName:ownerName:", v9, v10);

    v12 = objc_msgSend(objc_alloc((Class)CKRecordID), "initWithRecordName:zoneID:", a1[5], v11);
    (*(void (**)(void))(a1[6] + 16))();

  }
}

void sub_100019068(id a1, NSArray *a2, NSArray *a3, NSError *a4)
{
  NSError *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  const __CFString *v9;

  v4 = a4;
  v5 = sub_100011D0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10006353C(v4, v7);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = CFSTR("private-changes");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Successfully subscribed to %@.", (uint8_t *)&v8, 0xCu);
  }

}

void sub_1000194C8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;

  v3 = a2;
  v4 = sub_100011D0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      v11 = 136315394;
      v12 = "-[FMFCloudKitManager processCKError:]_block_invoke";
      v13 = 2112;
      v14 = v3;
      v7 = "%s: Delete bootstrap zone error: %@";
      v8 = v5;
      v9 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v11, v9);
    }
  }
  else if (v6)
  {
    v11 = 136315138;
    v12 = "-[FMFCloudKitManager processCKError:]_block_invoke";
    v7 = "%s: Delete bootstrap zone success";
    v8 = v5;
    v9 = 12;
    goto LABEL_6;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
  objc_msgSend(v10, "endTransaction:", *(_QWORD *)(a1 + 32));

}

void sub_100019758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10001977C(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  id *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1[5] + 8);
  v7 = *(void **)(v4 + 40);
  v5 = (id *)(v4 + 40);
  v6 = v7;
  v10 = v3;
  if (v7)
    v3 = v6;
  objc_storeStrong(v5, v3);
  v8 = *(_QWORD *)(a1[6] + 8);
  v9 = *(_QWORD *)(v8 + 24) - 1;
  *(_QWORD *)(v8 + 24) = v9;
  if (!v9)
    (*(void (**)(void))(a1[4] + 16))();

}

void sub_100019984(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;

  v5 = a2;
  v6 = a3;
  v7 = sub_100011D0C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));
    v12 = 136315394;
    v13 = "-[FMFCloudKitManager removeAllFenceRecordsZonesInDatabase:withCompletion:]_block_invoke";
    v14 = 2112;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: All fetched keys for removal %@", (uint8_t *)&v12, 0x16u);

  }
  if (v5)
  {
    v10 = (void *)a1[4];
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));
    objc_msgSend(v10, "deleteRecordZonesWithID:fromDatabase:withCompletion:", v11, a1[5], &stru_100099650);

  }
  (*(void (**)(void))(a1[6] + 16))();

}

void sub_100019ABC(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  NSError *v12;

  v2 = a2;
  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v5)
    {
      v9 = 136315394;
      v10 = "-[FMFCloudKitManager removeAllFenceRecordsZonesInDatabase:withCompletion:]_block_invoke";
      v11 = 2112;
      v12 = v2;
      v6 = "%s: Deletion error for deleting fetched keys %@";
      v7 = v4;
      v8 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
    }
  }
  else if (v5)
  {
    v9 = 136315138;
    v10 = "-[FMFCloudKitManager removeAllFenceRecordsZonesInDatabase:withCompletion:]_block_invoke";
    v6 = "%s: Successfully deleted fetched keys";
    v7 = v4;
    v8 = 12;
    goto LABEL_6;
  }

}

void sub_100019D20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_100019D44(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  v10 = v3;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "processCKError:", v3);
    v3 = v10;
  }
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v4 + 40);
  v5 = (id *)(v4 + 40);
  v6 = v7;
  if (v7)
    v3 = v6;
  objc_storeStrong(v5, v3);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(_QWORD *)(v8 + 24) - 1;
  *(_QWORD *)(v8 + 24) = v9;
  if (!v9)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_10001A0F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 216), 8);
  _Unwind_Resume(a1);
}

id sub_10001A114(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

id sub_10001A120(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void sub_10001A12C(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  id *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1[5] + 8);
  v7 = *(void **)(v4 + 40);
  v5 = (id *)(v4 + 40);
  v6 = v7;
  v10 = v3;
  if (v7)
    v3 = v6;
  objc_storeStrong(v5, v3);
  v8 = *(_QWORD *)(a1[6] + 8);
  v9 = *(_QWORD *)(v8 + 24) - 1;
  *(_QWORD *)(v8 + 24) = v9;
  if (!v9)
    (*(void (**)(void))(a1[4] + 16))();

}

void sub_10001A1A4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[7];
  id v10;
  id v11;
  id v12;

  v3 = a2;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(void **)(a1 + 56);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001A280;
  v9[3] = &unk_1000996F0;
  v9[4] = v5;
  v9[5] = v6;
  v9[6] = v4;
  v10 = v3;
  v11 = v7;
  v12 = *(id *)(a1 + 64);
  v8 = v3;
  objc_msgSend(v4, "fetchChangedRecordZonesWithID:andDeleteRecordZonesWithID:fromDatabase:withCompletion:", v5, v6, v7, v9);

}

void sub_10001A280(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v3 = a2;
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "cache"));
    v5 = *(_QWORD *)(a1 + 56);
    v6 = objc_msgSend(*(id *)(a1 + 64), "scope");
    v7 = 0;
    objc_msgSend(v4, "updateServerChangeToken:forDatabaseWithScope:error:", v5, v6, &v7);
    v3 = v7;

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

}

void sub_10001A31C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSErrorUserInfoKey v13;
  const __CFString *v14;

  v6 = a2;
  v7 = a4;
  v8 = v7;
  if (!v6 || v7)
  {
    v9 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v7);
    }
    else
    {
      v10 = FMFErrorDomain;
      v13 = NSLocalizedDescriptionKey;
      v14 = CFSTR("no zoneServerChangeToken");
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v10, 1018, v11));
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v12);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
  }

}

void sub_10001A5D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10001A5F4(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  id *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1[5] + 8);
  v7 = *(void **)(v4 + 40);
  v5 = (id *)(v4 + 40);
  v6 = v7;
  v10 = v3;
  if (v7)
    v3 = v6;
  objc_storeStrong(v5, v3);
  v8 = *(_QWORD *)(a1[6] + 8);
  v9 = *(_QWORD *)(v8 + 24) - 1;
  *(_QWORD *)(v8 + 24) = v9;
  if (!v9)
    (*(void (**)(void))(a1[4] + 16))();

}

void sub_10001ABE4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

id sub_10001AC1C(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

id sub_10001AC28(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void sub_10001AC34(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  id *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  id *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  id *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];

  v5 = a2;
  v6 = a3;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v7 = *(id *)(a1 + 32);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v51 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "cache"));
        v14 = objc_msgSend(*(id *)(a1 + 48), "scope");
        v49 = 0;
        objc_msgSend(v13, "updateRecord:inDatabaseWithScope:error:", v12, v14, &v49);
        v15 = v49;

        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v19 = *(void **)(v16 + 40);
        v17 = (id *)(v16 + 40);
        v18 = v19;
        if (v19)
          v20 = v18;
        else
          v20 = v15;
        objc_storeStrong(v17, v20);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    }
    while (v9);
  }

  objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v21 = *(id *)(a1 + 56);
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(_QWORD *)v46 != v24)
          objc_enumerationMutation(v21);
        v26 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)j);
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "cache"));
        v28 = objc_msgSend(*(id *)(a1 + 48), "scope");
        v44 = 0;
        objc_msgSend(v27, "removeRecordWithID:inDatabaseWithScope:error:", v26, v28, &v44);
        v29 = v44;

        v30 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v33 = *(void **)(v30 + 40);
        v31 = (id *)(v30 + 40);
        v32 = v33;
        if (v33)
          v34 = v32;
        else
          v34 = v29;
        objc_storeStrong(v31, v34);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    }
    while (v23);
  }

  objc_msgSend(*(id *)(a1 + 56), "removeAllObjects");
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "cache"));
    v36 = objc_msgSend(*(id *)(a1 + 48), "scope");
    v43 = 0;
    objc_msgSend(v35, "updateServerChangeToken:forZoneWithID:inDatabaseWithScope:error:", v6, v5, v36, &v43);
    v37 = v43;

    v38 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v41 = *(void **)(v38 + 40);
    v39 = (id *)(v38 + 40);
    v40 = v41;
    if (v41)
      v42 = v40;
    else
      v42 = v37;
    objc_storeStrong(v39, v42);

  }
}

void sub_10001AF08(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  id *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSErrorUserInfoKey v25;
  const __CFString *v26;

  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = (unint64_t)v13;
  if (!v11 || v13)
  {
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v18 = *(_QWORD *)(v15 + 40);
    v16 = (id *)(v15 + 40);
    v17 = (void *)v18;
    if (v18 | v14)
    {
      if (v17)
        v19 = v17;
      else
        v19 = (void *)v14;
      objc_storeStrong(v16, v19);
    }
    else
    {
      v20 = FMFErrorDomain;
      v25 = NSLocalizedDescriptionKey;
      v26 = CFSTR("no zoneServerChangeToken");
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
      v22 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v20, 1018, v21));
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v24 = *(void **)(v23 + 40);
      *(_QWORD *)(v23 + 40) = v22;

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void sub_10001B070(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v4 + 40);
  v5 = (id *)(v4 + 40);
  v6 = v7;
  if (v7)
    v8 = v6;
  else
    v8 = a2;
  objc_storeStrong(v5, v8);
  v9 = a2;
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v8);

}

uint64_t sub_10001B330(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10001B468(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10001B51C;
    v7[3] = &unk_100099858;
    v6 = *(_QWORD *)(a1 + 48);
    v8 = *(id *)(a1 + 56);
    objc_msgSend(v4, "updateRecord:andShare:inDatabase:withCompletion:", v5, a2, v6, v7);

  }
}

void sub_10001B51C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void (*v10)(void);
  id v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else if (v8)
  {
    v11 = sub_100011D0C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315650;
      v14 = "-[FMFCloudKitManager updateRecord:inZoneSharedWith:inDatabaseWithScope:withCompletion:]_block_invoke_2";
      v15 = 2112;
      v16 = v8;
      v17 = 2112;
      v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: savedShare: %@ savedRecord: %@", (uint8_t *)&v13, 0x20u);
    }

    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v10();

}

void sub_10001B75C(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10001B830;
    v7[3] = &unk_1000998A8;
    v11 = *(id *)(a1 + 64);
    v5 = *(id *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 32);
    v8 = v5;
    v9 = v6;
    v10 = *(id *)(a1 + 56);
    objc_msgSend(v3, "fetchShareParticipantsForHandles:withCompletion:", v4, v7);

  }
}

void sub_10001B830(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v5 = objc_msgSend(objc_alloc((Class)CKRecordID), "initWithRecordName:zoneID:", CKRecordNameZoneWideShare, *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "recordWithID:inScope:", v5, objc_msgSend(*(id *)(a1 + 48), "scope")));
    v7 = v6;
    if (v6)
      v8 = v6;
    else
      v8 = objc_msgSend(objc_alloc((Class)CKShare), "initWithRecordZoneID:", *(_QWORD *)(a1 + 32));
    v9 = v8;

    objc_msgSend(v9, "setFmf_otherParticipants:", v10);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

uint64_t sub_10001BAD0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_10001BC4C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id sub_10001BE28(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t sub_10001BE34(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

void sub_10001C028(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v7 = a2;
  v23 = a3;
  v8 = a4;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v27;
    do
    {
      v13 = 0;
      v14 = v11;
      do
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v7);
        v15 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cache", v23));
        v17 = objc_msgSend(*(id *)(a1 + 40), "scope");
        v25 = 0;
        objc_msgSend(v16, "updateRecord:inDatabaseWithScope:error:", v15, v17, &v25);
        v18 = v25;

        if (v14)
          v19 = v14;
        else
          v19 = v18;
        v11 = v19;

        v13 = (char *)v13 + 1;
        v14 = v11;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fm_firstObjectPassingTest:", &stru_100099988, v23));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fm_firstObjectPassingTest:", &stru_1000999A8));
  if (v8)
    v22 = v8;
  else
    v22 = v11;
  (*(void (**)(_QWORD, void *, void *, id))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v21, v20, v22);

}

BOOL sub_10001C208(id a1, CKRecord *a2)
{
  CKRecord *v2;
  uint64_t v3;
  char isKindOfClass;

  v2 = a2;
  v3 = objc_opt_class(CKShare);
  isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  return isKindOfClass & 1;
}

BOOL sub_10001C250(id a1, CKRecord *a2)
{
  CKRecord *v2;
  uint64_t v3;
  char isKindOfClass;

  v2 = a2;
  v3 = objc_opt_class(CKShare);
  isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  return (isKindOfClass & 1) == 0;
}

id sub_10001C2AC(id a1, FMFHandle *a2)
{
  void *v2;
  BOOL IsEmail;
  id v4;
  id v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFHandle identifier](a2, "identifier"));
  IsEmail = FMFStringIsEmail(v2);
  v4 = objc_alloc((Class)CKUserIdentityLookupInfo);
  if (IsEmail)
    v5 = objc_msgSend(v4, "initWithEmailAddress:", v2);
  else
    v5 = objc_msgSend(v4, "initWithPhoneNumber:", v2);
  v6 = v5;

  return v6;
}

void sub_10001C7C8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[5];
  id v27;
  uint64_t v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  _QWORD v35[4];
  _QWORD v36[4];
  _QWORD v37[4];
  _QWORD v38[4];

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = (unint64_t)objc_msgSend(v3, "code");
    if (v5 <= 0x22 && ((1 << v5) & 0x4029000F8) != 0 || v5 == 111)
    {
      v6 = sub_100011D0C();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_1000636C4();

      v37[0] = CFSTR("acceptCKShareOperationSuccessful");
      v37[1] = CFSTR("ckShareRetryAvailable");
      v38[0] = &off_1000A0F00;
      v38[1] = &off_1000A0F18;
      v38[2] = &off_1000A0F00;
      v37[2] = CFSTR("ckShareRetryCount");
      v37[3] = CFSTR("acceptCKShareError");
      v8 = stringForCKErrorCode(objc_msgSend(v4, "code"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v38[3] = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v38, v37, 4));
      AnalyticsSendEvent(CFSTR("com.apple.icloud.fmfd.ReliabilityMetric"), v10);

      objc_msgSend(*(id *)(a1 + 48), "retryAcceptShareWithURLString:invitationToken:forError:retryCount:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v4, 0);
    }
    else
    {
      v19 = sub_100011D0C();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_100063650();

      v35[0] = CFSTR("acceptCKShareOperationSuccessful");
      v35[1] = CFSTR("ckShareRetryAvailable");
      v36[0] = &off_1000A0F00;
      v36[1] = &off_1000A0F00;
      v36[2] = &off_1000A0F00;
      v35[2] = CFSTR("ckShareRetryCount");
      v35[3] = CFSTR("acceptCKShareError");
      v21 = stringForCKErrorCode(objc_msgSend(v4, "code"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v36[3] = v22;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v36, v35, 4));
      AnalyticsSendEvent(CFSTR("com.apple.icloud.fmfd.ReliabilityMetric"), v23);

      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "cache"));
      v25 = *(_QWORD *)(a1 + 56);
      v28 = 0;
      objc_msgSend(v24, "removeUnacceptedShareInvitationWithShareURLString:inDatabaseWithScope:error:", v25, 3, &v28);

    }
  }
  else
  {
    v11 = sub_100011D0C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315650;
      v30 = "-[FMFCloudKitManager acceptCKShareWithURLString:invitationTokenBase64String:]_block_invoke";
      v31 = 2112;
      v32 = v13;
      v33 = 2112;
      v34 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: success without retry: shareURL: %@ invitationToken: %@", buf, 0x20u);
    }

    AnalyticsSendEvent(CFSTR("com.apple.icloud.fmfd.ReliabilityMetric"), &off_1000A1168);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "cache"));
    v16 = *(_QWORD *)(a1 + 56);
    v27 = 0;
    objc_msgSend(v15, "removeUnacceptedShareInvitationWithShareURLString:inDatabaseWithScope:error:", v16, 3, &v27);
    v17 = v27;

    v18 = *(void **)(a1 + 48);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10001CB20;
    v26[3] = &unk_1000995E8;
    v26[4] = v18;
    objc_msgSend(v18, "fetchChangesWithCompletion:", v26);

  }
}

void sub_10001CB20(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;

  v3 = a2;
  if (v3)
  {
    v4 = sub_100011D0C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100063738();

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("FMFCloudKitManagerRecordsDidChangeNotification"), *(_QWORD *)(a1 + 32));

  }
}

void sub_10001CE64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a30, 8);
  _Unwind_Resume(a1);
}

void sub_10001CE98(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  uint64_t v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v7 + 40);
  v8 = (id *)(v7 + 40);
  v9 = v10;
  if (v10)
    v11 = v9;
  else
    v11 = a4;
  objc_storeStrong(v8, v11);
  v14 = a4;
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v6;

}

void sub_10001CF08(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  __int128 v18;
  _QWORD v19[4];
  __int128 v20;
  _QWORD v21[5];
  uint64_t v22;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v4 + 40);
  v5 = (id *)(v4 + 40);
  v6 = v7;
  if (v7)
    v8 = v6;
  else
    v8 = v3;
  objc_storeStrong(v5, v8);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
      (*(void (**)(void))(v9 + 16))();
  }
  else
  {
    v10 = objc_alloc((Class)CKAcceptSharesOperation);
    v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
    v12 = objc_msgSend(v10, "initWithShareMetadatas:", v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "configuration"));
    objc_msgSend(v13, "setDiscretionaryNetworkBehavior:", 0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "container"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "configuration"));
    objc_msgSend(v15, "setContainer:", v14);

    objc_msgSend(v12, "setGroup:", *(_QWORD *)(a1 + 40));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10001D10C;
    v21[3] = &unk_100099A88;
    v21[4] = *(_QWORD *)(a1 + 56);
    objc_msgSend(v12, "setPerShareCompletionBlock:", v21);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10001D124;
    v19[3] = &unk_100099AB0;
    v18 = *(_OWORD *)(a1 + 48);
    v16 = (id)v18;
    v20 = v18;
    objc_msgSend(v12, "setAcceptSharesCompletionBlock:", v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    objc_msgSend(v17, "addOperation:", v12);

  }
}

void sub_10001D10C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  id *v5;
  void *v6;
  void *v7;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v4 + 40);
  v5 = (id *)(v4 + 40);
  v6 = v7;
  if (v7)
    a4 = v6;
  objc_storeStrong(v5, a4);
}

void sub_10001D124(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v4 + 40);
  v5 = (id *)(v4 + 40);
  v6 = v7;
  v9 = v3;
  if (v7)
    v3 = v6;
  objc_storeStrong(v5, v3);
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

void sub_10001D470(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001D520;
  v10[3] = &unk_100099B00;
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v11 = v5;
  v12 = v6;
  v13 = v7;
  v8 = *(id *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 64);
  v14 = v8;
  v15 = v9;
  objc_msgSend(v2, "acceptCKShareWithURL:invitationToken:completion:", v3, v4, v10);

}

void sub_10001D520(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[4];
  _QWORD v27[4];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "retryAcceptShareWithURLString:invitationToken:forError:retryCount:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v3, *(_QWORD *)(a1 + 64));
    v4 = sub_100011D0C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v20 = *(_QWORD *)(a1 + 56);
      v19 = *(_QWORD *)(a1 + 64);
      v21 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 136316162;
      v29 = "-[FMFCloudKitManager retryAcceptShareWithURLString:invitationToken:forError:retryCount:]_block_invoke_2";
      v30 = 2112;
      v31 = v3;
      v32 = 2048;
      v33 = v19;
      v34 = 2112;
      v35 = v21;
      v36 = 2112;
      v37 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s: error: %@, retryingWithRetryCount: %ld, shareURL: %@ invitationToken: %@", buf, 0x34u);
    }

    v26[0] = CFSTR("acceptCKShareOperationSuccessful");
    v26[1] = CFSTR("ckShareRetryAvailable");
    v27[0] = &off_1000A0F00;
    v27[1] = &off_1000A0F18;
    v26[2] = CFSTR("ckShareRetryCount");
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *(_QWORD *)(a1 + 64)));
    v27[2] = v6;
    v26[3] = CFSTR("acceptCKShareError");
    v7 = stringForCKErrorCode(objc_msgSend(v3, "code"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v27[3] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 4));
    AnalyticsSendEvent(CFSTR("com.apple.icloud.fmfd.ReliabilityMetric"), v9);

  }
  else
  {
    v10 = sub_100011D0C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(void **)(a1 + 48);
      v13 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 136315650;
      v29 = "-[FMFCloudKitManager retryAcceptShareWithURLString:invitationToken:forError:retryCount:]_block_invoke";
      v30 = 2112;
      v31 = v12;
      v32 = 2112;
      v33 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: success with retry: shareURL: %@ invitationToken: %@", buf, 0x20u);
    }

    v24[1] = CFSTR("ckShareRetryCount");
    v25[0] = &off_1000A0F18;
    v24[0] = CFSTR("acceptCKShareOperationSuccessful");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *(_QWORD *)(a1 + 64)));
    v25[1] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 2));
    AnalyticsSendEvent(CFSTR("com.apple.icloud.fmfd.ReliabilityMetric"), v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "cache"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "absoluteString"));
    v23 = 0;
    objc_msgSend(v16, "removeUnacceptedShareInvitationWithShareURLString:inDatabaseWithScope:error:", v17, 3, &v23);
    v6 = v23;

    v18 = *(void **)(a1 + 40);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10001D854;
    v22[3] = &unk_1000995E8;
    v22[4] = v18;
    objc_msgSend(v18, "fetchChangesWithCompletion:", v22);
  }

}

void sub_10001D854(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;

  v3 = a2;
  if (v3)
  {
    v4 = sub_100011D0C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000637A4();

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("FMFCloudKitManagerRecordsDidChangeNotification"), *(_QWORD *)(a1 + 32));

  }
}

void sub_10001DE28(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_10001DE38(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10001DE74(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_10001DE80(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x2Au);
}

void sub_10001E68C(id a1, NSNotification *a2)
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = sub_100011D0C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Received signal USR1...", v4, 2u);
  }

}

void sub_10001E6F0(id a1, NSNotification *a2)
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = sub_100011D0C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Received signal USR2...", v4, 2u);
  }

}

void sub_10001E754(uint64_t a1)
{
  id WeakRetained;
  id v2;
  NSObject *v3;
  void *v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = sub_100011D0C();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "📩 Connection interrupted from: %@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(WeakRetained, "removeAllFriendHandles");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMFXPCSessionManager sharedInstance](FMFXPCSessionManager, "sharedInstance"));
    objc_msgSend(v4, "removeClientSession:", WeakRetained);

    v5 = sub_100011D0C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "📩 Releasing session: %@", (uint8_t *)&v7, 0xCu);
    }

  }
}

void sub_10001E880(uint64_t a1)
{
  id WeakRetained;
  id v2;
  NSObject *v3;
  void *v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = sub_100011D0C();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "📩 Connection invalidated from: %@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(WeakRetained, "removeAllFriendHandles");
    objc_msgSend(WeakRetained, "invalidate");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMFXPCSessionManager sharedInstance](FMFXPCSessionManager, "sharedInstance"));
    objc_msgSend(v4, "removeClientSession:", WeakRetained);

    v5 = sub_100011D0C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "📩 Releasing session: %@", (uint8_t *)&v7, 0xCu);
    }

  }
}

void sub_10001EA4C(id a1)
{
  void *v1;
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNotification notificationWithName:object:userInfo:](NSNotification, "notificationWithName:object:userInfo:", off_1000B2FB8, 0, 0));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationQueue defaultQueue](NSNotificationQueue, "defaultQueue"));
  objc_msgSend(v1, "enqueueNotification:postingStyle:coalesceMask:forModes:", v2, 1, 1, 0);

}

void sub_10001ED3C(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  objc_msgSend(v2, "refreshDueToTapWithMessage:", *(_QWORD *)(a1 + 32));

}

void sub_10001F1C8(uint64_t a1)
{
  id v2;
  NSObject *v3;
  _BOOL8 v4;
  uint64_t v5;
  int v6;
  dispatch_time_t v7;
  _DWORD v8[2];
  __int16 v9;
  int v10;

  v2 = sub_100011D0C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v4)
  {
    v6 = *(_DWORD *)(a1 + 32);
    v8[0] = 67109376;
    v8[1] = v6;
    v9 = 1024;
    v10 = MKBDeviceUnlockedSinceBoot(v4, v5);
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "First unlock notification received: %d device unlocked status: %d", (uint8_t *)v8, 0xEu);
  }

  v7 = dispatch_time(0, 5000000000);
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, &stru_100099C08);
}

void sub_10001F2A4(id a1)
{
  id v1;
  NSObject *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  v1 = sub_100011D0C();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Updating account after first unlock.", buf, 2u);
  }

  +[FMFDStoreController cleanupLegacyStoredDataIfNeeded](FMFDStoreController, "cleanupLegacyStoredDataIfNeeded");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
  objc_msgSend(v3, "updateAccountInfo");

  v4 = sub_100011D0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Sending lazy init after first unlock.", v7, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  objc_msgSend(v6, "sendInitWithLazyCheckForSession:withReason:completion:", 0, 7, 0);

}

void sub_10001F45C(id a1)
{
  FMFLazyInitController *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v1 = objc_alloc_init(FMFLazyInitController);
  v2 = (void *)qword_1000B36C0;
  qword_1000B36C0 = (uint64_t)v1;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", qword_1000B36C0, "accountWasRemoved:", off_1000B2FC0, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", qword_1000B36C0, "accountWasRemoved:", off_1000B2FE8, 0);

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", qword_1000B36C0, "modelDidLoadSuccessfully:", off_1000B2FE0, 0);

}

void sub_10001FDC8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000202B8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  size_t size;

  size = 0;
  sysctlbyname("hw.machine", 0, &size, 0, 0);
  v2 = malloc_type_malloc(size, 0x4C14EED8uLL);
  sysctlbyname("hw.machine", v2, &size, 0, 0);
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v2, 4));
    v4 = (void *)qword_1000B36D0;
    qword_1000B36D0 = v3;

  }
  free(v2);
  if (objc_msgSend((id)qword_1000B36D0, "isEqualToString:", CFSTR("i386")))
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "deviceClass"));
    v6 = (void *)qword_1000B36D0;
    qword_1000B36D0 = v5;

  }
}

void sub_100020430(id a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "pathForResource:ofType:", CFSTR("Settings"), CFSTR("bundle")));

  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", v2));
    v4 = v3;
    if (v3)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathForResource:ofType:", CFSTR("Root"), CFSTR("plist")));
      if (v5)
      {
        v32 = v4;
        v33 = v2;
        v31 = v5;
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v5));
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKey:", CFSTR("PreferenceSpecifiers")));
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v35;
          while (2)
          {
            for (i = 0; i != v8; i = (char *)i + 1)
            {
              if (*(_QWORD *)v35 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
              v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("Type")));
              if (objc_msgSend(v12, "isEqualToString:", CFSTR("PSTitleValueSpecifier")))
              {
                v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("Title")));
                v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("Tag"));

                if (v14)
                {
                  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("DefaultValue")));
                  v16 = objc_msgSend(v15, "mutableCopy");

                  v17 = (unint64_t)objc_msgSend(v16, "rangeOfString:", CFSTR("("));
                  v19 = v18;
                  v20 = (char *)objc_msgSend(v16, "rangeOfString:", CFSTR(")"));
                  if (v19 == 1 && v21 == 1)
                  {
                    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "substringWithRange:", v17 + 1, &v20[~v17]));
                    v28 = objc_msgSend(v27, "copy");
                    v29 = (void *)qword_1000B36E0;
                    qword_1000B36E0 = (uint64_t)v28;

                    goto LABEL_21;
                  }
                  v23 = (void *)qword_1000B36E0;
                  qword_1000B36E0 = (uint64_t)CFSTR("unknown");

                }
              }

            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
            if (v8)
              continue;
            break;
          }
        }
LABEL_21:

        v4 = v32;
        v2 = v33;
        v5 = v31;
      }

    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForInfoDictionaryKey:", CFSTR("CFBundleVersion")));
      v26 = (void *)qword_1000B36E0;
      qword_1000B36E0 = v25;

    }
  }

}

void sub_100020734(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_deviceInfoForKey:", CFSTR("UniqueDeviceID")));
  v2 = (void *)qword_1000B36F0;
  qword_1000B36F0 = v1;

}

void sub_100020868(id a1)
{
  FMFBlockListManager *v1;
  void *v2;

  v1 = objc_alloc_init(FMFBlockListManager);
  v2 = (void *)qword_1000B3700;
  qword_1000B3700 = (uint64_t)v1;

  TUAddLocalNSObserver(qword_1000B3700, "_rulesChanged:", TUPrivacyRulesChangedNotification, 0);
}

BOOL sub_100020928(void *a1)
{
  __CFString *v1;
  _BOOL8 v2;

  v1 = a1;
  if (-[__CFString length](v1, "length"))
    v2 = CFStringFind(v1, CFSTR("@"), 0).location != -1;
  else
    v2 = 1;

  return v2;
}

void sub_100020DB8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a3;
  if (v4)
  {
    v5 = sub_100011D0C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100063C28(a1, (uint64_t)v4, v6);

  }
}

void sub_100020FC4(id a1)
{
  id v1;
  NSObject *v2;
  FMFAddressBook *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  v1 = sub_100011D0C();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Creating shared instance of sharedAddressBook", v6, 2u);
  }

  v3 = objc_alloc_init(FMFAddressBook);
  v4 = (void *)qword_1000B3710;
  qword_1000B3710 = (uint64_t)v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", qword_1000B3710, "contactStoreDidChange", CNContactStoreDidChangeNotification, 0);

}

void sub_1000212F8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000214AC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100021C08(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setIsUpdateGeoFenceCompleted:", 1);
  v4 = sub_100011D0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
    v10 = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMFFenceUpdateOperation %@ update command completed with error? %@", (uint8_t *)&v10, 0x16u);

  }
  if (v3 || objc_msgSend(*(id *)(a1 + 32), "operationType") == (id)2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "fence"));
    objc_msgSend(*(id *)(a1 + 32), "setUpdatedFence:", v7);

    v8 = *(void **)(a1 + 32);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fence"));
    objc_msgSend(v8, "finishWithFence:error:", v9, v3);

  }
}

void sub_100022258(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)objc_opt_class(*(_QWORD *)(a1 + 32)));
  v2 = (void *)qword_1000B3728;
  qword_1000B3728 = (uint64_t)v1;

}

BOOL sub_100022388(id a1, FMFHandle *a2, BOOL *a3)
{
  return -[FMFHandle isPending](a2, "isPending", a3) ^ 1;
}

void sub_100022E20(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "statusMapFromServer"));
  v7 = objc_msgSend(v5, "integerValue");

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v7 == (id)200));
  objc_msgSend(v9, "setObject:forKey:", v8, v6);

}

void sub_100023F08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  uint64_t v28;

  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_100023F3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 64), "_dayStringForDayOfWeek:", a2));
  objc_msgSend(*(id *)(a1 + 32), "addObject:");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_QWORD *)(v5 + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    *(_QWORD *)(v5 + 24) = a3;
  }
  else if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) + 1 != a3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;

}

void sub_100024410(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("com.apple.icloud.fmfd.handleTransactionQueue", 0);
  v2 = (void *)qword_1000B3730;
  qword_1000B3730 = (uint64_t)v1;

}

uint64_t sub_10002467C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100024750(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  id v22;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
  v8 = objc_msgSend(v7, "isAccountSignedIn");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMFSystemInfo sharedInstance](FMFSystemInfo, "sharedInstance"));
  v10 = objc_msgSend(v9, "isInMultiUserMode");

  v11 = objc_msgSend(v6, "code");
  v12 = sub_100011D0C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v11 != (id)1000 || (v8 & 1) != 0 || (v10 & 1) != 0)
  {
    if (v14)
    {
      v17 = *(_QWORD *)(a1 + 32);
      v19 = 138412546;
      v20 = v17;
      v21 = 2048;
      v22 = objc_msgSend(v6, "code");
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@: Not saving the mapping packet. Error %lu ", (uint8_t *)&v19, 0x16u);
    }

  }
  else
  {
    if (v14)
    {
      v15 = *(_QWORD *)(a1 + 32);
      v19 = 138412290;
      v20 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@: Requesting storing the mapping packet.", (uint8_t *)&v19, 0xCu);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
    objc_msgSend(v16, "storeMappingPacket:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "upselliCloudIfNeeded");
  }
  v18 = *(_QWORD *)(a1 + 48);
  if (v18)
    (*(void (**)(uint64_t, id, id))(v18 + 16))(v18, v5, v6);

}

uint64_t sub_100024A68(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100024A78(uint64_t a1)
{

}

void sub_100024B1C(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int8x16_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD block[4];
  int8x16_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint8_t v43[128];
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  uint64_t v47;

  v2 = sub_100011D0C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v45 = v4;
    v46 = 2112;
    v47 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: addFriendHandles: %@", buf, 0x16u);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v31 = a1;
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        objc_msgSend(v12, "timeIntervalSince1970");
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", floor(v13 * 1000.0)));

        objc_msgSend(v11, "setTrackingTimestamp:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[FMFXPCSessionManager sharedInstance](FMFXPCSessionManager, "sharedInstance"));
        objc_msgSend(v15, "updateTrackingTimestampForHandle:timestamp:", v11, v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v8);
  }

  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v31 + 40), "handlesQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024E94;
  block[3] = &unk_100099348;
  v30 = *(int8x16_t *)(v31 + 32);
  v17 = (id)v30.i64[0];
  v37 = vextq_s8(v30, v30, 8uLL);
  dispatch_sync(v16, block);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[FMFXPCSessionManager sharedInstance](FMFXPCSessionManager, "sharedInstance"));
  objc_msgSend(v18, "refreshLocationsForSession:", *(_QWORD *)(v31 + 40));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v20 = *(id *)(v31 + 32);
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (v21)
  {
    v22 = v21;
    v23 = 0;
    v24 = *(_QWORD *)v33;
    do
    {
      v25 = 0;
      v26 = v23;
      do
      {
        if (*(_QWORD *)v33 != v24)
          objc_enumerationMutation(v20);
        v27 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v25);
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance", *(_OWORD *)&v30));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "locationForHandle:", v27));

        if (v23)
          objc_msgSend(v19, "addObject:", v23);
        v25 = (char *)v25 + 1;
        v26 = v23;
      }
      while (v22 != v25);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    }
    while (v22);

  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v31 + 40), "clientProxy"));
  objc_msgSend(v29, "setLocations:", v19);

}

void sub_100024E94(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_handlesInternal"));
  objc_msgSend(v2, "unionSet:", *(_QWORD *)(a1 + 40));

}

void sub_100024F6C(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;

  v2 = sub_100011D0C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: removeFriendHandles: %@", (uint8_t *)&v7, 0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_handlesInternal"));
  objc_msgSend(v6, "minusSet:", *(_QWORD *)(a1 + 40));

}

void sub_1000250A4(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;

  v2 = sub_100011D0C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(void **)(a1 + 32);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_handlesInternal"));
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: removeAllFriendHandles: %@", (uint8_t *)&v7, 0x16u);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_handlesInternal"));
  objc_msgSend(v6, "removeAllObjects");

}

void sub_100025254(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_100025268(uint64_t a1)
{
  void *v2;
  id v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_handlesInternal"));
  v3 = objc_msgSend(v2, "copy");

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100025490(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v7 = a3;
  v6 = a2;
  objc_msgSend(v5, "sendFMFIDSPacketsForHandleIdToMappingIdentifiers:", v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  objc_msgSend(*(id *)(a1 + 32), "dispayOfferAlertDialogsWithoutRepeatForError:", v7);
}

id sub_1000255BC(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;

  if (!+[FMFUtils locationServicesEnabled](FMFUtils, "locationServicesEnabled"))
    +[FMFDUserNotification showLocationServicesSwitchOffAlert](FMFDUserNotification, "showLocationServicesSwitchOffAlert");
  if (!+[FMFUtils shareMyLocationSystemServiceEnabled](FMFUtils, "shareMyLocationSystemServiceEnabled")
    && +[FMFUtils locationServicesEnabled](FMFUtils, "locationServicesEnabled"))
  {
    +[FMFDUserNotification showShareMyLocationSystemServiceOffAlert](FMFDUserNotification, "showShareMyLocationSystemServiceOffAlert");
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  if ((objc_msgSend(v2, "locationHidden") & 1) == 0)
    goto LABEL_11;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
  if ((objc_msgSend(v3, "hasCredentials") & 1) == 0)
  {

LABEL_11:
    goto LABEL_12;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceSharingLocation"));
  v6 = objc_msgSend(v5, "isThisDevice");

  if (v6)
    +[FMFDUserNotification showShareMyLocationiCloudSettingsOffAlert](FMFDUserNotification, "showShareMyLocationiCloudSettingsOffAlert");
LABEL_12:
  if (objc_msgSend(*(id *)(a1 + 32), "code") == (id)1005)
    +[FMFDUserNotification showForbiddenRegionAlert](FMFDUserNotification, "showForbiddenRegionAlert");
  return objc_msgSend(*(id *)(a1 + 40), "setBlockingDialogs:", 0);
}

void sub_100025814(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "sendFMFIDSPacketsForHandleIdToMappingIdentifiers:", a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_1000259B4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "sendFMFIDSPacketsForHandleIdToMappingIdentifiers:", a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_100025BE8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;

  v4 = a3;
  v5 = sub_100011D0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedDescription"));
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "📩 %@: completed NotNow request (%@)", (uint8_t *)&v9, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t sub_100025D94(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100025E58(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100025F80(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "followerHandleForIdentifier:", v3));

  if (v4
    || ((v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance")),
         v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getHandlesWithPendingOffersSync")),
         !objc_msgSend(v6, "containsObject:", *(_QWORD *)(a1 + 32)))
      ? (v7 = 0)
      : (v7 = *(void **)(a1 + 32)),
        v4 = v7,
        v6,
        v5,
        v4))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", *(_QWORD *)(a1 + 32)));
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 48);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100026140;
    v15[3] = &unk_100099ED0;
    v12 = *(_QWORD *)(a1 + 56);
    v16 = *(id *)(a1 + 64);
    objc_msgSend(v8, "stopSharingMyLocationWithHandles:forSession:groupId:callerId:completion:", v9, v10, v11, v12, v15);

  }
  else
  {
    v13 = *(_QWORD *)(a1 + 64);
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 102, 0));
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);

  }
}

uint64_t sub_100026140(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100026264(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "followerHandles"));

  v4 = objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(v4, "intersectSet:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getHandlesWithPendingOffersSync"));

  v7 = objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(v7, "intersectSet:", v6);
  objc_msgSend(v4, "unionSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000263AC;
  v12[3] = &unk_100099EA8;
  v12[4] = v9;
  v11 = *(_QWORD *)(a1 + 56);
  v13 = *(id *)(a1 + 64);
  objc_msgSend(v8, "stopSharingMyLocationWithHandles:forSession:groupId:callerId:completion:", v4, v9, v10, v11, v12);

}

void sub_1000263AC(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "sendFMFIDSPacketsForHandleIdToMappingIdentifiers:", a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t sub_100026780(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

uint64_t sub_10002692C(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

void sub_100026FE0(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allLocations"));

  if (v5)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:"));
  else
    v3 = 0;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, void *, _QWORD))(v4 + 16))(v4, v3, 0);

}

void sub_1000270BC(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v3 = a2;
  v4 = sub_100011D0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Finished force refresh", v7, 2u);
  }

  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "clientProxy"));
    objc_msgSend(v6, "didReceiveServerError:", v3);

  }
}

void sub_100027234(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;
  int v5;
  NSError *v6;

  v2 = a2;
  if (v2)
  {
    v3 = sub_100011D0C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = 138412290;
      v6 = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Error initing from sessionWasCreatedRefresh: %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

void sub_100027604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002762C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  int v26;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "deviceSharingLocation"));

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
    v5 = objc_msgSend(v4, "hasModelInitialized");

    if ((v5 & 1) == 0)
    {
      v6 = sub_100011D0C();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 32);
        v19 = 138412546;
        v20 = v8;
        v21 = 2112;
        v22 = v3;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: Model not initialized on completion. Returning last known deviceSharingLocation: %@", (uint8_t *)&v19, 0x16u);
      }

    }
  }
  if (*(_QWORD *)(a1 + 40))
  {
    v9 = sub_100011D0C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v13 = *(unsigned __int8 *)(a1 + 56);
      v19 = 138413058;
      v20 = v11;
      v21 = 2112;
      v22 = v3;
      v23 = 2112;
      v24 = v12;
      v25 = 1024;
      v26 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@: Returning deviceSharingLocation: %@, clientError?: %@, model initialized? %d", (uint8_t *)&v19, 0x26u);
    }

    v14 = sub_100011D0C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v16)
      {
        v17 = *(_QWORD *)(a1 + 32);
        v19 = 138412290;
        v20 = v17;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@: Able to determine sharing device, completing successfully", (uint8_t *)&v19, 0xCu);
      }
    }
    else if (v16)
    {
      v18 = *(_QWORD *)(a1 + 32);
      v19 = 138412290;
      v20 = v18;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@: Not able to determine sharing device, completing with error", (uint8_t *)&v19, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void sub_100027890(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  int v9;
  uint64_t v10;

  v3 = a2;
  v4 = sub_100011D0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v9 = 138412290;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Finished force refresh for audio accessory", (uint8_t *)&v9, 0xCu);
  }

  if (v3)
  {
    v7 = sub_100011D0C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100063CB0(a1, (uint64_t)v3, v8);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t sub_100027D64(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100028FC0(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  v2 = sub_100011D0C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: showMeDeviceAlertCompleted", (uint8_t *)&v5, 0xCu);
  }

}

uint64_t sub_1000290F0(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 == 0);
  return result;
}

void sub_100029328(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = *(_QWORD *)(a1 + 32);
  v9 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("ERROR"), "dataUsingEncoding:", 4));
    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v9);

  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v7 + 16))(v7, a2, 0);
  }

}

void sub_10002B244(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = sub_100011D0C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v9)
      goto LABEL_7;
    v10 = *(_QWORD *)(a1 + 32);
    v14 = 138412546;
    v15 = v10;
    v16 = 2112;
    v17 = v6;
    v11 = "%@: addFence completed with error: %@";
  }
  else
  {
    if (!v9)
      goto LABEL_7;
    v12 = *(_QWORD *)(a1 + 32);
    v14 = 138412546;
    v15 = v12;
    v16 = 2112;
    v17 = v5;
    v11 = "%@: addFence completed sucessfully %@";
  }
  _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, 0x16u);
LABEL_7:

  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
    (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v5, v6);

}

void sub_10002B47C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = sub_100011D0C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v9)
      goto LABEL_7;
    v10 = *(_QWORD *)(a1 + 32);
    v14 = 138412546;
    v15 = v10;
    v16 = 2112;
    v17 = v6;
    v11 = "%@: removeFences completed with error: %@";
  }
  else
  {
    if (!v9)
      goto LABEL_7;
    v12 = *(_QWORD *)(a1 + 32);
    v14 = 138412546;
    v15 = v12;
    v16 = 2112;
    v17 = v5;
    v11 = "%@: removeFences completed sucessfully: %@";
  }
  _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, 0x16u);
LABEL_7:

  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v6);

}

void sub_10002BC84(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id obj;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *v28;
  uint8_t v29[128];
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  id v33;

  v3 = a2;
  if (v3)
  {
    v4 = sub_100011D0C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v31 = v6;
      v32 = 2112;
      v33 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: ERROR: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = *(id *)(a1 + 40);
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "friendIdentifier"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "followingHandleForServerId:", v13));
          v28 = v14;
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
          objc_msgSend(v11, "setRecipients:", v15);

          v16 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fenceSequencer"));
          v18 = *(_QWORD *)(a1 + 32);
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v20[2] = sub_10002BF14;
          v20[3] = &unk_10009A058;
          v21 = 0;
          v22 = v18;
          v23 = *(id *)(a1 + 48);
          objc_msgSend(v17, "addFence:clientSession:completion:", v11, v18, v20);

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v8);
    }

    v3 = 0;
  }

}

void sub_10002BF14(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void (*v8)(void);
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;

  v4 = a3;
  if (a1[4])
  {
    v5 = sub_100011D0C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = a1[5];
      v9 = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: ERROR: %@", (uint8_t *)&v9, 0x16u);
    }

    v8 = *(void (**)(void))(a1[6] + 16);
  }
  else
  {
    v8 = *(void (**)(void))(a1[6] + 16);
  }
  v8();

}

void sub_10002C19C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;

  v3 = a2;
  v4 = sub_100011D0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: addFavorite command completed with error?: %@", (uint8_t *)&v8, 0x16u);
  }

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

void sub_10002C384(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;

  v3 = a2;
  v4 = sub_100011D0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: removeFavorite command completed with error?: %@", (uint8_t *)&v8, 0x16u);
  }

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

void sub_10002C654(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_10002C668(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_10002C6AC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_10002C778(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  id v7;

  v3 = a2;
  v4 = sub_100011D0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "XPC error: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 8), 0);
}

void sub_10002C934(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    v15 = v5;
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  }
  else
  {
    v9 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v5, v9) & 1) == 0)
    {
      v10 = 0;
      goto LABEL_7;
    }
    v8 = v5;
  }
  v10 = v8;
LABEL_7:
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002CA70;
  v12[3] = &unk_10009A0A8;
  v13 = *(id *)(a1 + 32);
  v14 = v6;
  v11 = v6;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v12);

}

void sub_10002CA70(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  xpc_object_t xdict;

  v3 = a2;
  xdict = xpc_dictionary_create(0, 0, 0);
  v4 = objc_retainAutorelease(v3);
  xpc_dictionary_set_string(xdict, "Notification", (const char *)objc_msgSend(v4, "cStringUsingEncoding:", 4));
  v5 = objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v4);

  v6 = objc_retainAutorelease(v4);
  v7 = objc_msgSend(v6, "cStringUsingEncoding:", 4);

  xpc_set_event("com.apple.notifyd.matching", v7, xdict);
}

void sub_10002CB34(uint64_t a1, xpc_object_t xdict)
{
  const char *string;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  string = xpc_dictionary_get_string(xdict, _xpc_event_key_name);
  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    v6 = v7;
  }

}

void sub_10002CCAC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    v15 = v5;
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  }
  else
  {
    v9 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v5, v9) & 1) == 0)
    {
      v10 = 0;
      goto LABEL_7;
    }
    v8 = v5;
  }
  v10 = v8;
LABEL_7:
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002CDE8;
  v12[3] = &unk_10009A0A8;
  v13 = *(id *)(a1 + 32);
  v14 = v6;
  v11 = v6;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v12);

}

void sub_10002CDE8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  xpc_object_t xdict;

  v3 = a2;
  xdict = xpc_dictionary_create(0, 0, 0);
  v4 = objc_retainAutorelease(v3);
  xpc_dictionary_set_string(xdict, "Name", (const char *)objc_msgSend(v4, "cStringUsingEncoding:", 4));
  v5 = objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v4);

  v6 = objc_retainAutorelease(v4);
  v7 = objc_msgSend(v6, "cStringUsingEncoding:", 4);

  xpc_set_event("com.apple.distnoted.matching", v7, xdict);
}

void sub_10002CEAC(uint64_t a1, void *a2)
{
  id v3;
  const char *string;
  void *v5;
  void *v6;
  void (**v7)(id, id);

  v3 = a2;
  string = xpc_dictionary_get_string(v3, _xpc_event_key_name);
  v5 = *(void **)(a1 + 32);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
  v7 = (void (**)(id, id))objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));

  v7[2](v7, v3);
}

void sub_10002D288(id a1)
{
  FMFSystemInfoiOS *v1;
  void *v2;

  v1 = objc_alloc_init(FMFSystemInfoiOS);
  v2 = (void *)qword_1000B3740;
  qword_1000B3740 = (uint64_t)v1;

}

void sub_10002D454(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002D46C(id a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  size_t size;

  size = 0;
  sysctlbyname("kern.osversion", 0, &size, 0, 0);
  v1 = malloc_type_malloc(size, 0xB82A9E20uLL);
  sysctlbyname("kern.osversion", v1, &size, 0, 0);
  if (v1)
  {
    v2 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v1, 4));
    v3 = (void *)qword_1000B3760;
    qword_1000B3760 = v2;

  }
  free(v1);
}

void sub_10002E22C(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)objc_opt_class(*(_QWORD *)(a1 + 32)));
  v2 = (void *)qword_1000B3778;
  qword_1000B3778 = (uint64_t)v1;

}

void sub_10002E254(uint64_t a1)
{
  CFBooleanRef v2;

  v2 = (CFBooleanRef)MGCopyAnswer(CFSTR("InternalBuild"), 0);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = v2 == kCFBooleanTrue;
  CFRelease(v2);
}

uint64_t sub_10002E518(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  if ((_DWORD)result == 20)
  {
    v4 = v1;
    v5 = v2;
    v3 = 0;
    do
      result = waitpid(-1, &v3, 1);
    while ((int)result > 0);
  }
  return result;
}

void sub_10002E554(id a1)
{
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_10009A1A8);
}

void sub_10002E568(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v1, "postNotificationName:object:", off_1000B2FA8, 0);

}

void sub_10002E5AC(id a1)
{
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_10009A1E8);
}

void sub_10002E5C0(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v1, "postNotificationName:object:", off_1000B2FB0, 0);

}

void sub_10002EBBC(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  v3 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v5, v3) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  }
  else
  {
    v4 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v5);
  }

}

void sub_10002EC40(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  v3 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v5, v3) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  }
  else
  {
    v4 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v5);
  }

}

BOOL FMFStringIsEmail(void *a1)
{
  __CFString *v1;
  _BOOL8 v2;

  v1 = a1;
  if (-[__CFString length](v1, "length"))
    v2 = CFStringFind(v1, CFSTR("@"), 0).location != -1;
  else
    v2 = 1;

  return v2;
}

void sub_10002EF14(uint64_t a1, double a2, double a3)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  double v24;
  __int16 v25;
  double v26;
  __int16 v27;
  uint64_t v28;

  v6 = sub_100011D0C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 72);
    v9 = *(_QWORD *)(a1 + 80);
    v10 = *(_QWORD *)(a1 + 32);
    v19 = 134284547;
    v20 = v8;
    v21 = 2049;
    v22 = v9;
    v23 = 2049;
    v24 = a2;
    v25 = 2049;
    v26 = a3;
    v27 = 2112;
    v28 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Shifter callback returned, original(lat: %{private}f, long: %{private}f), shifted(lat: %{private}f, long: %{private}f) for location; %@",
      (uint8_t *)&v19,
      0x34u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a2));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  objc_msgSend(v11, "doubleValue");
  if (v13 != 0.0)
  {
    objc_msgSend(v12, "doubleValue");
    if (v14 != 0.0)
    {
      objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v11, CFSTR("latitude"));
      objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v12, CFSTR("longitude"));
    }
  }
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("location"));
  v15 = *(id *)(a1 + 56);
  objc_sync_enter(v15);
  objc_msgSend(*(id *)(a1 + 56), "addObject:", *(_QWORD *)(a1 + 48));
  v16 = sub_100011D0C();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = *(_QWORD *)(a1 + 56);
    v19 = 138412290;
    v20 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Shifter callback updated locations array: %@", (uint8_t *)&v19, 0xCu);
  }

  objc_sync_exit(v15);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

void sub_10002F128(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002F148(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10002F2BC(id a1)
{
  FMFIDSMessageController *v1;
  void *v2;

  v1 = objc_opt_new(FMFIDSMessageController);
  v2 = (void *)qword_1000B3798;
  qword_1000B3798 = (uint64_t)v1;

}

id sub_10002F760(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "IDSRecipientFromHandle:", a2);
}

void sub_10002F918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10002F934(uint64_t a1, uint64_t a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;

  v4 = sub_100011D0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v8 = 134218242;
    v9 = a2;
    v10 = 2112;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "IDSIDStatus result: %ld for destination: %@", (uint8_t *)&v8, 0x16u);
  }

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  return objc_msgSend(*(id *)(a1 + 40), "signal");
}

void sub_10003069C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000306B4(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "objectForKeyedSubscript:", a1[4]));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    v8 = IDSRegistrationPropertySupportsFMFenceV1;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "capabilities", (_QWORD)v12));
        v11 = objc_msgSend(v10, "valueForCapability:", v8);

        if (v11 == (id)1)
        {
          *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  (*(void (**)(void))(a1[5] + 16))();
}

void sub_100030BE4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_100030C10(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;

  v3 = a2;
  v4 = sub_100011D0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMFIDSMessageController: correlationID: %@, %@", (uint8_t *)&v7, 0x16u);

  }
  if (objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 40)))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void sub_100030D0C(_QWORD *a1)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  _BOOL4 v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  int v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  __int128 v25;
  _QWORD v26[4];
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;

  if (*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
  {
    v2 = sub_100011D0C();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
LABEL_5:

      (*(void (**)(void))(a1[6] + 16))();
      return;
    }
    v4 = *(unsigned __int8 *)(*(_QWORD *)(a1[7] + 8) + 24);
    *(_DWORD *)buf = 67109120;
    LODWORD(v29) = v4;
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FMFIDSMessageController: Message sender is valid? %d", buf, 8u);
    goto LABEL_5;
  }
  if (a1[4])
  {
    v5 = sub_100011D0C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = a1[4];
      *(_DWORD *)buf = 138412290;
      v29 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMFIDSMessageController: Checking sender validity based on fenceId: %@", buf, 0xCu);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fenceManager"));
    v10 = a1[4];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100030FEC;
    v26[3] = &unk_10009A2F8;
    v22 = *((_OWORD *)a1 + 3);
    v11 = (id)v22;
    v27 = v22;
    objc_msgSend(v9, "getFenceWithID:timeout:block:", v10, v26, 15.0);

    v12 = (void *)v27;
  }
  else
  {
    v13 = a1[5];
    v14 = sub_100011D0C();
    v3 = objc_claimAutoreleasedReturnValue(v14);
    v15 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    if (!v13)
    {
      if (!v15)
        goto LABEL_5;
      v21 = *(unsigned __int8 *)(*(_QWORD *)(a1[7] + 8) + 24);
      *(_DWORD *)buf = 67109120;
      LODWORD(v29) = v21;
      goto LABEL_4;
    }
    if (v15)
    {
      v16 = a1[5];
      *(_DWORD *)buf = 138412290;
      v29 = v16;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FMFIDSMessageController: Checking sender validity based on ckRecordName: %@", buf, 0xCu);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fenceManager"));
    v19 = a1[5];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000310C8;
    v24[3] = &unk_10009A2F8;
    v23 = *((_OWORD *)a1 + 3);
    v20 = (id)v23;
    v25 = v23;
    objc_msgSend(v18, "getFenceWithCKRecordName:timeout:block:", v19, v24, 15.0);

    v12 = (void *)v25;
  }

}

void sub_100030FEC(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  id v7;

  v3 = a2;
  v4 = sub_100011D0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMFIDSMessageController: Found fence for fenceId?: %@", (uint8_t *)&v6, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3 != 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_1000310C8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  id v7;

  v3 = a2;
  v4 = sub_100011D0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMFIDSMessageController: Found fence for ckRecordName?: %@", (uint8_t *)&v6, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3 != 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_1000312EC(uint64_t a1)
{
  void *v2;
  void *v3;
  _BOOL4 v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  void *v28;
  unsigned int v29;
  id v30;
  _BOOL4 v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  _QWORD v37[6];
  id v38;
  _QWORD v39[6];
  id v40;
  _QWORD v41[6];
  id v42;
  id v43;
  _QWORD v44[4];
  void *v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  _BOOL4 v53;
  __int16 v54;
  uint64_t v55;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "followerHandles"));

  if (v3)
    v4 = objc_msgSend(v3, "count") != 0;
  else
    v4 = 0;
  v5 = sub_100011D0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138413314;
    v47 = v7;
    v48 = 2112;
    v49 = v8;
    v50 = 2112;
    v51 = v9;
    v52 = 1024;
    v53 = v4;
    v54 = 2112;
    v55 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received IDS message to account: %@, message: %@ from ID: %@, canReceiveFollowerMessage: %d, payloadValue: %@", buf, 0x30u);
  }

  if (objc_msgSend(*(id *)(a1 + 56), "isEqualToString:", CFSTR("mappingPacket")))
  {
    v11 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:ofClass:", CFSTR("p"), objc_opt_class(NSString));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = sub_100011D0C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v47 = v12;
      v48 = 2112;
      v49 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Sending mapping packet to server on receiving end: %@ from message: %@", buf, 0x16u);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100031850;
    v44[3] = &unk_100099CB0;
    v45 = v12;
    v17 = v12;
    objc_msgSend(v16, "importMappingPacket:forSession:completion:", v17, 0, v44);

    v18 = v45;
LABEL_23:

    goto LABEL_24;
  }
  if (v4
    && objc_msgSend(*(id *)(a1 + 56), "isEqualToString:", CFSTR("CKDeviceToDeviceShareInvitationToken")))
  {
    v19 = sub_100011D0C();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "FMFIDSMessageController: Received share inivitation", buf, 2u);
    }

    v21 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:ofClass:", CFSTR("ckRecordName"), objc_opt_class(NSString));
    v17 = objc_claimAutoreleasedReturnValue(v21);
    v23 = *(void **)(a1 + 64);
    v22 = *(_QWORD *)(a1 + 72);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100031914;
    v41[3] = &unk_10009A348;
    v41[4] = *(_QWORD *)(a1 + 56);
    v41[5] = v23;
    v42 = *(id *)(a1 + 40);
    v43 = *(id *)(a1 + 48);
    objc_msgSend(v23, "senderIsValid:idsSenderRequirement:fenceId:ckRecordName:withCompletion:", v22, 0, 0, v17, v41);

    v18 = v42;
    goto LABEL_23;
  }
  if (objc_msgSend(*(id *)(a1 + 56), "isEqualToString:", CFSTR("fenceTrigger")))
  {
    v24 = sub_100011D0C();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "FMFIDSMessageController: Received fence trigger message", buf, 2u);
    }

    v26 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:ofClass:", CFSTR("fenceID"), objc_opt_class(NSString));
    v17 = objc_claimAutoreleasedReturnValue(v26);
    v28 = *(void **)(a1 + 64);
    v27 = *(_QWORD *)(a1 + 72);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100031ABC;
    v39[3] = &unk_10009A370;
    v39[4] = *(_QWORD *)(a1 + 56);
    v39[5] = v28;
    v40 = *(id *)(a1 + 40);
    objc_msgSend(v28, "senderIsValid:idsSenderRequirement:fenceId:ckRecordName:withCompletion:", v27, 1, v17, 0, v39);
    v18 = v40;
    goto LABEL_23;
  }
  v29 = objc_msgSend(*(id *)(a1 + 56), "isEqualToString:", CFSTR("deletedFenceInformation"));
  v30 = sub_100011D0C();
  v17 = objc_claimAutoreleasedReturnValue(v30);
  v31 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v29)
  {
    if (v31)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "FMFIDSMessageController: Received fence deleted message", buf, 2u);
    }

    v32 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:ofClass:", CFSTR("fenceID"), objc_opt_class(NSString));
    v17 = objc_claimAutoreleasedReturnValue(v32);
    v34 = *(void **)(a1 + 64);
    v33 = *(_QWORD *)(a1 + 72);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100031C14;
    v37[3] = &unk_10009A370;
    v37[4] = *(_QWORD *)(a1 + 56);
    v37[5] = v34;
    v38 = *(id *)(a1 + 40);
    objc_msgSend(v34, "senderIsValid:idsSenderRequirement:fenceId:ckRecordName:withCompletion:", v33, 1, v17, 0, v37);
    v18 = v38;
    goto LABEL_23;
  }
  if (v31)
  {
    v36 = *(_QWORD *)(a1 + 40);
    v35 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    v47 = v35;
    v48 = 2112;
    v49 = v36;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "FMFIDSMessageController: Unknown service from: %@ payload: %@", buf, 0x16u);
  }
LABEL_24:

}

void sub_100031850(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;

  v4 = a3;
  v5 = sub_100011D0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Sent mapping packet to server on receiving end: %@ with error: %@", (uint8_t *)&v8, 0x16u);
  }

}

void sub_100031914(_QWORD *a1, uint64_t a2)
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  _QWORD v11[2];
  _QWORD v12[2];
  uint8_t buf[4];
  int v14;

  v4 = sub_100011D0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v14 = a2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMFIDSMessageController: Sender is valid returned: %d", buf, 8u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a2, CFSTR("isSenderValid")));
  v11[1] = CFSTR("messageType");
  v12[0] = v6;
  v12[1] = a1[4];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 2));
  AnalyticsSendEvent(CFSTR("com.apple.icloud.fmfd.idsMessageValidityMetric"), v7);

  v8 = sub_100011D0C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)a2)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FMFIDSMessageController: Continuing with share invitation message, sender is valid", buf, 2u);
    }

    objc_msgSend((id)objc_opt_class(a1[5]), "_receivedShareInvitationMessage:fromID:", a1[6], a1[7]);
  }
  else
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FMFIDSMessageController: Dropping share invitation message on the floor, sender is invalid", buf, 2u);
    }

  }
}

void sub_100031ABC(_QWORD *a1, uint64_t a2)
{
  int v2;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint8_t v9[8];
  _QWORD v10[2];
  _QWORD v11[2];

  v2 = a2;
  v10[0] = CFSTR("isSenderValid");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a2));
  v10[1] = CFSTR("messageType");
  v11[0] = v4;
  v11[1] = a1[4];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));
  AnalyticsSendEvent(CFSTR("com.apple.icloud.fmfd.idsMessageValidityMetric"), v5);

  v6 = sub_100011D0C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v8)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FMFIDSMessageController: Continuing with fence trigger message, sender is valid", v9, 2u);
    }

    objc_msgSend((id)objc_opt_class(a1[5]), "_receivedFenceTriggerMessage:", a1[6]);
  }
  else
  {
    if (v8)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FMFIDSMessageController: Dropping fence trigger message on the floor, sender is invalid", v9, 2u);
    }

  }
}

void sub_100031C14(_QWORD *a1, uint64_t a2)
{
  int v2;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint8_t v9[8];
  _QWORD v10[2];
  _QWORD v11[2];

  v2 = a2;
  v10[0] = CFSTR("isSenderValid");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a2));
  v10[1] = CFSTR("messageType");
  v11[0] = v4;
  v11[1] = a1[4];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));
  AnalyticsSendEvent(CFSTR("com.apple.icloud.fmfd.idsMessageValidityMetric"), v5);

  v6 = sub_100011D0C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v8)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FMFIDSMessageController: Continuing with fence deleted message, sender is valid", v9, 2u);
    }

    objc_msgSend((id)objc_opt_class(a1[5]), "_receivedDeletedFenceInformationMessage:", a1[6]);
  }
  else
  {
    if (v8)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FMFIDSMessageController: Dropping fence deleted message on the floor, sender is invalid", v9, 2u);
    }

  }
}

void sub_100031DCC(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.fmfd", "_");
  v2 = (void *)qword_1000B37B0;
  qword_1000B37B0 = (uint64_t)v1;

}

id sub_100031DFC()
{
  if (qword_1000B37B8 != -1)
    dispatch_once(&qword_1000B37B8, &stru_10009A3D8);
  return (id)qword_1000B37C0;
}

void sub_100031E3C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.fmfd", "FMFMapXPC");
  v2 = (void *)qword_1000B37C0;
  qword_1000B37C0 = (uint64_t)v1;

}

void sub_10003202C(id a1)
{
  FMFAccountManager *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v1 = objc_opt_new(FMFAccountManager);
  v2 = (void *)qword_1000B37C8;
  qword_1000B37C8 = (uint64_t)v1;

  objc_msgSend((id)qword_1000B37C8, "setLatest401TS:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", qword_1000B37C8, "iCloudAccountChanged:", off_1000B2FB8, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", qword_1000B37C8, "iCloudAccountWasAdded:", off_1000B2FC8, 0);

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", qword_1000B37C8, "iCloudAccountRemoved:", off_1000B2FC0, 0);

}

id sub_10003224C(uint64_t a1)
{
  byte_1000B37D8 = 0;
  return objc_msgSend(*(id *)(a1 + 32), "updateAccountInfo");
}

void sub_100032974(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100032B30(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  uint8_t buf[16];

  v5 = a3;
  v6 = sub_100011D0C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "aa_updatePropertiesForAppleAccount completed with authenticated:YES. Saving the account...", buf, 2u);
    }

    v9 = *(void **)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100032C5C;
    v13[3] = &unk_10009A420;
    v14 = v9;
    v11 = *(id *)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 32);
    v15 = v11;
    v16 = v12;
    objc_msgSend(v14, "saveVerifiedAccount:withCompletionHandler:", v10, v13);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000644B4();

    objc_msgSend(*(id *)(a1 + 32), "setIsUpdatingAccountCredentials:", 0);
    objc_msgSend(*(id *)(a1 + 32), "renewAccountCredentials:", *(unsigned __int8 *)(a1 + 56));
  }

}

void sub_100032C5C(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  const __CFString *v14;
  id v15;
  int v16;
  const __CFString *v17;

  v5 = a3;
  if (a2)
  {
    v6 = *(void **)(a1 + 32);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "aa_fmfAccount"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "credentialForAccount:error:", v7, 0));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject credentialItemForKey:](v8, "credentialItemForKey:", ACFindMyFriendsAppTokenKey));
    v10 = sub_100011D0C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Saved the account after aa_updatePropertiesForAppleAccount, updating password", (uint8_t *)&v16, 2u);
    }

    v12 = sub_100011D0C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = CFSTR("YES");
      if (!v9)
        v14 = CFSTR("NO");
      v16 = 138412290;
      v17 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Password non-nil after fetching the credential? [%@]", (uint8_t *)&v16, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 48), "setIsUpdatingAccountCredentials:", 0);
    objc_msgSend(*(id *)(a1 + 48), "retryAfterCredentialUpdate");

  }
  else
  {
    v15 = sub_100011D0C();
    v8 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100064514();
  }

  objc_msgSend(*(id *)(a1 + 48), "setIsUpdatingAccountCredentials:", 0);
}

void sub_10003306C(uint64_t a1, unint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;

  v5 = a3;
  if (a2 > 2)
    v6 = 0;
  else
    v6 = (uint64_t)*(&off_10009A550 + a2);
  v7 = sub_100011D0C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(void **)(a1 + 32);
    v12 = 138412802;
    v13 = v9;
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Renewed account credentails for account %@ – status %@, Error: %@", (uint8_t *)&v12, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 40), "setIsRenewingAccountCredentials:", 0);
  if (a2 || v5)
  {
    v10 = sub_100011D0C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Not refreshing data because of credential error: %@", (uint8_t *)&v12, 0xCu);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "retryAfterCredentialUpdate");
  }

}

void sub_100033314(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;
  int v5;
  NSError *v6;

  v2 = a2;
  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Data refreshed after getting new credentials, Error: %@", (uint8_t *)&v5, 0xCu);
  }

}

void sub_100033B60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100033B84(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[4];
  __int128 v8;
  uint64_t v9;
  uint8_t buf[4];
  id v11;

  v3 = a2;
  if (v3)
  {
    v4 = sub_100011D0C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Error refreshing after account signin to import saved mapping packets: %@", buf, 0xCu);
    }

  }
  else
  {
    v6 = *(void **)(a1 + 32);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100033C80;
    v7[3] = &unk_10009A4E0;
    v9 = *(_QWORD *)(a1 + 56);
    v8 = *(_OWORD *)(a1 + 40);
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);
  }

}

void sub_100033C80(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  __int128 v9;
  uint64_t v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMFSession sharedInstance](FMFSession, "sharedInstance"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100033D38;
  v7[3] = &unk_10009A4B8;
  v8 = v4;
  v10 = *(_QWORD *)(a1 + 48);
  v9 = *(_OWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v5, "receivedMappingPacket:completion:", v6, v7);

}

void sub_100033D38(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;

  v4 = a3;
  v5 = sub_100011D0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Sent packet: %@ to server with error response: %@", (uint8_t *)&v8, 0x16u);
  }

  if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == *(_QWORD *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 40), "clearSavedMappingPackets");

}

id sub_10003434C(uint64_t a1, uint64_t a2)
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v9;
  int v10;
  uint64_t v11;

  v4 = sub_100011D0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v10 = 138412290;
      v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Error while trying to invalidated packets; %@",
        (uint8_t *)&v10,
        0xCu);
    }

    return objc_msgSend(*(id *)(a1 + 40), "storeInvalidMappingPacketsForFutureRemoval:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (v6)
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138412290;
      v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully invalidated all the packets; %@",
        (uint8_t *)&v10,
        0xCu);
    }

    return objc_msgSend(*(id *)(a1 + 40), "clearSavedInvalidMappingPackets");
  }
}

void sub_1000350BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000350D8(id a1)
{
  id v1;
  NSObject *v2;
  FMFDataManager *v3;
  void *v4;
  id v5;
  void *v6;
  FMFFenceManager *v7;
  FMFFenceSequencer *v8;
  void *v9;
  FMFFenceSequencer *v10;
  FMFFavoritesSequencer *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t v15[16];

  v1 = sub_100011D0C();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Creating shared instance of FMFDataManager", v15, 2u);
  }

  v3 = objc_alloc_init(FMFDataManager);
  v4 = (void *)qword_1000B37E0;
  qword_1000B37E0 = (uint64_t)v3;

  v5 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend((id)qword_1000B37E0, "set_locationDictionary:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDStoreController sharedInstance](FMFDStoreController, "sharedInstance"));
  objc_msgSend((id)qword_1000B37E0, "setStoreController:", v6);

  v7 = objc_opt_new(FMFFenceManager);
  objc_msgSend((id)qword_1000B37E0, "setFenceManager:", v7);

  v8 = [FMFFenceSequencer alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000B37E0, "fenceManager"));
  v10 = -[FMFFenceSequencer initWithFenceManager:](v8, "initWithFenceManager:", v9);
  objc_msgSend((id)qword_1000B37E0, "setFenceSequencer:", v10);

  v11 = objc_opt_new(FMFFavoritesSequencer);
  objc_msgSend((id)qword_1000B37E0, "setFavoritesSequencer:", v11);

  objc_msgSend((id)qword_1000B37E0, "updateClientsWithLocallyStoredModelCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", qword_1000B37E0, "sanitizeLocationsCache:", 0, 1, 21600.0));
  objc_msgSend((id)qword_1000B37E0, "setSanitizeLocationsCacheTimer:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v13, "addObserver:selector:name:object:", qword_1000B37E0, "accountWasRemoved", off_1000B2FC0, 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v14, "addObserver:selector:name:object:", qword_1000B37E0, "cleanupOldModel", off_1000B2FE8, 0);

}

void sub_1000355F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100035AE0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100035B38(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100036178(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100036568(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100036AF8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSharingThroughGroupId:", *(_QWORD *)(a1 + 32));
}

id sub_100036C58(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSharingThroughGroupId:", *(_QWORD *)(a1 + 32));
}

void sub_100036D08(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "futureFollowingRequests"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "futureFollowerRequests"));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void sub_100037630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100037648(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
  if (objc_msgSend(v3, "isEqualToString:", v4))
  {
    v5 = objc_msgSend(v7, "isSharingThroughGroupId:", *(_QWORD *)(a1 + 40));

    v6 = v7;
    if (v5)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {

    v6 = v7;
  }

}

void sub_100037E54(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000386D8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v12 = v5;
  v7 = v6;
  if (objc_msgSend(v7, "integerValue") != (id)217)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "allKeys"));
    v9 = objc_msgSend(v8, "containsObject:", v7);

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7));
      v11 = objc_msgSend(v10, "mutableCopy");

      objc_msgSend(v11, "addObject:", v12);
    }
    else
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v12));
    }
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, v7);

  }
}

void sub_100038848(id a1)
{
  FMFHeartbeatManager *v1;
  void *v2;
  id v3;

  v1 = objc_alloc_init(FMFHeartbeatManager);
  v2 = (void *)qword_1000B37F0;
  qword_1000B37F0 = (uint64_t)v1;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -600.0));
  objc_msgSend((id)qword_1000B37F0, "setLatestXPCActivityRegistrationTime:", v3);

}

void sub_1000388B0(id a1, OS_xpc_object *a2)
{
  xpc_activity_state_t state;
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  state = xpc_activity_get_state(a2);
  if (state == 2)
  {
    v5 = sub_100011D0C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Heartbeat activity called with state XPC_ACTIVITY_STATE_RUN, sending refresh", v7, 2u);
    }

    v4 = objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
    -[NSObject checkHeartbeat](v4, "checkHeartbeat");
  }
  else
  {
    if (state)
      return;
    v3 = sub_100011D0C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Heartbeat activity called with state XPC_ACTIVITY_STATE_CHECK_IN", buf, 2u);
    }
  }

}

void sub_100038BE8(uint64_t a1)
{
  void *v2;
  NSMutableArray *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "favoritesManager"));
  objc_msgSend(v2, "reset");

  v3 = objc_opt_new(NSMutableArray);
  objc_msgSend(*(id *)(a1 + 32), "setSaveFavoritesOperation:", v3);

}

void sub_100038DA4(uint64_t a1)
{
  void *v2;
  FMFSaveFavoritesOperations *v3;
  void *v4;
  void *v5;
  void *v6;
  FMFSaveFavoritesOperations *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "favoritesManager"));
  objc_msgSend(v2, "addFavorite:", *(_QWORD *)(a1 + 40));

  v3 = [FMFSaveFavoritesOperations alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "favoritesManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "favorites"));
  v7 = -[FMFSaveFavoritesOperations initWithFavorites:clientSession:completion:](v3, "initWithFavorites:clientSession:completion:", v5, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "saveFavoritesOperation"));
  objc_msgSend(v6, "addObject:", v7);

  objc_msgSend(*(id *)(a1 + 32), "executeNextOperation");
}

void sub_100038FBC(uint64_t a1)
{
  void *v2;
  FMFSaveFavoritesOperations *v3;
  void *v4;
  void *v5;
  void *v6;
  FMFSaveFavoritesOperations *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "favoritesManager"));
  objc_msgSend(v2, "removeFavorite:", *(_QWORD *)(a1 + 40));

  v3 = [FMFSaveFavoritesOperations alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "favoritesManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "favorites"));
  v7 = -[FMFSaveFavoritesOperations initWithFavorites:clientSession:completion:](v3, "initWithFavorites:clientSession:completion:", v5, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "saveFavoritesOperation"));
  objc_msgSend(v6, "addObject:", v7);

  objc_msgSend(*(id *)(a1 + 32), "executeNextOperation");
}

void sub_1000390E0(uint64_t a1)
{
  NSObject *v2;
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  _QWORD block[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  void *v22;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_10003938C;
  v19 = sub_10003939C;
  v20 = 0;
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "saveFavoritesOperationUpdateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000393A4;
  block[3] = &unk_10009A6D8;
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = &v15;
  dispatch_sync(v2, block);

  if (v16[5])
  {
    v3 = sub_100011D0C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v16[5], "identifier"));
      *(_DWORD *)buf = 138412290;
      v22 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMFFavoriteSequencer executeNextOperation: %@", buf, 0xCu);

    }
    v6 = objc_msgSend(objc_alloc((Class)FMSynchronizer), "initWithDescription:andTimeout:", CFSTR("com.apple.icloud.fmfd.favoritesequencer.savefavorites.execution.semaphore"), 300.0);
    objc_msgSend(*(id *)(a1 + 32), "setCurrentOperation:", v16[5]);
    v7 = (void *)v16[5];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100039454;
    v11[3] = &unk_10009A700;
    v13 = &v15;
    v8 = v6;
    v12 = v8;
    objc_msgSend(v7, "executeWithCompletion:", v11);
    -[NSObject wait](v8, "wait");
    objc_msgSend(*(id *)(a1 + 32), "setCurrentOperation:", 0);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100039538;
    v10[3] = &unk_1000993C8;
    v10[4] = *(_QWORD *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);

  }
  else
  {
    v9 = sub_100011D0C();
    v8 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FMFFenceSequencer executeNextOperation queue is empty!", buf, 2u);
    }
  }

  _Block_object_dispose(&v15, 8);
}

void sub_10003935C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003938C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10003939C(uint64_t a1)
{

}

void sub_1000393A4(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "saveFavoritesOperation"));
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "saveFavoritesOperation"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", 0));
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "saveFavoritesOperation"));
    objc_msgSend(v8, "removeObjectAtIndex:", 0);

  }
}

void sub_100039454(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;

  v3 = a2;
  v4 = sub_100011D0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "identifier"));
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMFFavoriteSequencer executeNextOperation completed: %@ withError?: %@", (uint8_t *)&v7, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "signal");

}

id sub_100039538(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "executeNextOperation");
}

BOOL sub_10003A368(id a1, id a2, id a3, BOOL *a4)
{
  return objc_msgSend(a3, "intValue") != 200;
}

void sub_10003A898(id a1)
{
  FMFCommandCoalescer *v1;
  void *v2;
  dispatch_queue_t v3;
  void *v4;

  v1 = objc_alloc_init(FMFCommandCoalescer);
  v2 = (void *)qword_1000B3800;
  qword_1000B3800 = (uint64_t)v1;

  v3 = dispatch_queue_create(off_1000B3160, 0);
  objc_msgSend((id)qword_1000B3800, "setQueue:", v3);

  objc_msgSend((id)qword_1000B3800, "setColeasedRefreshPriority:", 0);
  objc_msgSend((id)qword_1000B3800, "setRefreshScheduled:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_msgSend((id)qword_1000B3800, "setCoalescedCommands:", v4);

  objc_msgSend((id)qword_1000B3800, "setSequencer:", 0);
}

void sub_10003A990(uint64_t a1)
{
  id WeakRetained;
  id v3;
  const __CFString *v4;
  double v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const char *v13;
  id v14;
  const __CFString *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  id v27;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = *(id *)(a1 + 40);
  if (v3 != objc_msgSend(WeakRetained, "sequencer"))
  {
    v14 = sub_100011D0C();
    v8 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[FMFCommandCoalescer _scheduleRefresh]_block_invoke"));
      v15 = *(const __CFString **)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v23 = (uint64_t)v10;
      v24 = 2048;
      v25 = v15;
      v26 = 2048;
      v27 = objc_msgSend(WeakRetained, "sequencer");
      v13 = "%@ Not sending refresh request due to mismatch of sequencer, captured sequenceNumber value: %ld, current seq"
            "uenceNumber value: %ld";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v13, buf, 0x20u);

    }
LABEL_14:

    goto LABEL_15;
  }
  v4 = CFSTR("highPriority");
  if (*(_BYTE *)(a1 + 56))
  {
LABEL_7:
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("queued-%@(after %f)"), v4, *(_QWORD *)(a1 + 48)));
    objc_msgSend(WeakRetained, "_sendRefreshOfType:", v6);

    v7 = sub_100011D0C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[FMFCommandCoalescer _scheduleRefresh]_block_invoke"));
      v10 = (void *)v9;
      v11 = CFSTR("lowPriority");
      v12 = *(void **)(a1 + 40);
      if (*(_BYTE *)(a1 + 56))
        v11 = CFSTR("highPriority");
      *(_DWORD *)buf = 138412802;
      v23 = v9;
      v24 = 2112;
      v25 = v11;
      v26 = 2048;
      v27 = v12;
      v13 = "%@ Finally sending queued request(%@) with sequenceNumber: %ld";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  objc_msgSend(WeakRetained, "_timeTillMinCallback");
  if (v5 > 0.0)
  {
    if (*(_BYTE *)(a1 + 56))
      v4 = CFSTR("highPriority");
    else
      v4 = CFSTR("lowPriority");
    goto LABEL_7;
  }
  if (objc_msgSend(WeakRetained, "refreshScheduled") == (id)1)
  {
    objc_msgSend(WeakRetained, "setRefreshScheduled:", 0);
    v16 = sub_100011D0C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[FMFCommandCoalescer _scheduleRefresh]_block_invoke"));
      v19 = (void *)v18;
      v20 = CFSTR("lowPriority");
      v21 = *(void **)(a1 + 40);
      if (*(_BYTE *)(a1 + 56))
        v20 = CFSTR("highPriority");
      *(_DWORD *)buf = 138412802;
      v23 = v18;
      v24 = 2112;
      v25 = v20;
      v26 = 2048;
      v27 = v21;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@ Discarding queued request(%@) with sequenceNumber: %ld", buf, 0x20u);

    }
  }
  objc_msgSend(WeakRetained, "_scheduleRefresh");
LABEL_15:

}

id sub_10003B474(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  if ((unint64_t)objc_msgSend(v4, "length") < 4
    || (unint64_t)objc_msgSend(*(id *)(a1 + 32), "length") < 4)
  {
    v7 = 0;
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
    v7 = objc_msgSend(v5, "hasPrefix:", v6);

  }
  return v7;
}

id sub_10003B5D4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ckRecordName"));
  if ((unint64_t)objc_msgSend(v4, "length") < 4
    || (unint64_t)objc_msgSend(*(id *)(a1 + 32), "length") < 4)
  {
    v7 = 0;
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ckRecordName"));
    v7 = objc_msgSend(v5, "hasPrefix:", v6);

  }
  return v7;
}

void sub_10003B95C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  id *v26;
  uint64_t v27;

  _Block_object_dispose(&a26, 8);
  objc_destroyWeak(v26);
  objc_destroyWeak((id *)(v27 - 136));
  _Unwind_Resume(a1);
}

uint64_t sub_10003B9A4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10003B9B4(uint64_t a1)
{

}

void sub_10003B9BC(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "fenceWithID:", *(_QWORD *)(a1 + 40)));
  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[FMFFenceManager getFenceWithID:timeout:block:]_block_invoke";
    v10 = 2112;
    v11 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: fence2: %@", (uint8_t *)&v8, 0x16u);
  }

  if (v2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void sub_10003BADC(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

    v5 = *(_QWORD *)(a1 + 32);
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 10, 0));
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v6);

  }
}

void sub_10003BE90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  id *v26;
  uint64_t v27;

  _Block_object_dispose(&a26, 8);
  objc_destroyWeak(v26);
  objc_destroyWeak((id *)(v27 - 136));
  _Unwind_Resume(a1);
}

void sub_10003BED8(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pendingFenceWithCKRecordName:", *(_QWORD *)(a1 + 40)));
  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[FMFFenceManager getFenceWithCKRecordName:timeout:block:]_block_invoke";
    v10 = 2112;
    v11 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: fence2: %@", (uint8_t *)&v8, 0x16u);
  }

  if (v2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void sub_10003BFF8(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

    v5 = *(_QWORD *)(a1 + 32);
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 10, 0));
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v6);

  }
}

void sub_10003C248(uint64_t a1, void *a2)
{
  id v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;

  v3 = a2;
  v4 = objc_msgSend(v3, "isFromMe");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v6 = v5;
  if ((v4 & 1) != 0)
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "followedHandleForFence:", v3));
  else
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "followerHandleForFence:", v3));
  v8 = (void *)v7;

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMFIDSMessageController sharedInstance](FMFIDSMessageController, "sharedInstance"));
    v11 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v8));
    v15 = 0;
    objc_msgSend(v9, "sendDeletedFenceMessageWithFenceID:ckRecordID:toHandles:error:", v11, v10, v12, &v15);
    v13 = v15;

  }
  else
  {
    v14 = sub_100011D0C();
    v13 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000646C4(v13);
  }

}

void sub_10003C630(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "triggerManager"));
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    v11 = *(_QWORD *)(a1 + 64);
    v12 = *(_QWORD *)(a1 + 72);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10003C770;
    v15[3] = &unk_100099830;
    v16 = *(id *)(a1 + 88);
    objc_msgSend(v7, "triggerWithUUID:forFence:withStatus:atDate:triggerLocation:clientSession:completion:", v8, v5, v9, v10, v11, v12, v15);

  }
  else
  {
    AnalyticsSendEvent(CFSTR("com.apple.icloud.fmfd.ReliabilityMetric"), &off_1000A1190);
    v13 = sub_100011D0C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_100064740();

    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
  }

}

void sub_10003C770(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;

  v3 = a2;
  if (v3)
  {
    v4 = sub_100011D0C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000647B0();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_10003C8FC(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;

  v3 = a2;
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "triggerManager"));
    -[NSObject receiveTriggerWithUUID:forFence:withStatus:atDate:triggerLocation:completion:](v4, "receiveTriggerWithUUID:forFence:withStatus:atDate:triggerLocation:completion:", *(_QWORD *)(a1 + 40), v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), &stru_10009A910);
  }
  else
  {
    AnalyticsSendEvent(CFSTR("com.apple.icloud.fmfd.ReliabilityMetric"), &off_1000A11B8);
    v5 = sub_100011D0C();
    v4 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10006481C();
  }

}

void sub_10003C99C(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;

  v2 = a2;
  if (v2)
  {
    v3 = sub_100011D0C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10006488C();

  }
}

void sub_10003CB3C(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setAcceptanceStatus:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "triggerManager"));
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 72);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003CC14;
  v11[3] = &unk_100099830;
  v10 = *(_QWORD *)(a1 + 80);
  v12 = *(id *)(a1 + 88);
  objc_msgSend(v5, "triggerWithUUID:forFence:withStatus:atDate:triggerLocation:clientSession:completion:", v6, v4, v7, v8, v9, v10, v11);

}

void sub_10003CC14(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;

  v3 = a2;
  if (v3)
  {
    v4 = sub_100011D0C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000648F8();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_10003D498(id a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = objc_alloc_init((Class)NSMutableDictionary);
  v2 = (void *)qword_1000B3810;
  qword_1000B3810 = (uint64_t)v1;

  v3 = objc_alloc_init((Class)NSObject);
  v4 = (void *)qword_1000B3818;
  qword_1000B3818 = (uint64_t)v3;

}

void sub_10003D72C(id *a1)
{
  void *v2;
  FMFAPSDelegateInfo *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  NSObject *v35;

  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "registeredDelegates"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10003DA5C;
  v22[3] = &unk_10009A9A8;
  v23 = a1[5];
  v24 = a1[6];
  v25 = &v26;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v22);

  if (!*((_BYTE *)v27 + 24))
  {
    v3 = objc_alloc_init(FMFAPSDelegateInfo);
    -[FMFAPSDelegateInfo setTopic:](v3, "setTopic:", a1[6]);
    -[FMFAPSDelegateInfo setDelegate:](v3, "setDelegate:", a1[5]);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "registeredDelegates"));
    objc_msgSend(v4, "addObject:", v3);

  }
  if (byte_1000B3828 == 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "registeredDelegates"));
    v17 = _NSConcreteStackBlock;
    v18 = 3221225472;
    v19 = sub_10003DAF4;
    v20 = &unk_10009A9D0;
    v7 = v5;
    v21 = v7;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v17);

    v8 = sub_100011D0C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = a1[6];
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "environmentName", v17, v18, v19, v20));
      *(_DWORD *)buf = 138412802;
      v31 = v10;
      v32 = 2112;
      v33 = v11;
      v34 = 2112;
      v35 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Registering for topic %@ in environment %@. Total topics : %@", buf, 0x20u);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "apsConnection"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject allObjects](v7, "allObjects"));
    objc_msgSend(v12, "setEnabledTopics:", v13);

  }
  else
  {
    v14 = sub_100011D0C();
    v7 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v15 = a1[6];
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "environmentName"));
      *(_DWORD *)buf = 138412546;
      v31 = v15;
      v32 = 2112;
      v33 = v16;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Not registering for topic %@ in environment %@ right now since startup is not complete. Queueing it up.", buf, 0x16u);

    }
  }

  _Block_object_dispose(&v26, 8);
}

void sub_10003DA24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003DA5C(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delegate"));
  v4 = v3;
  if (v3 == (void *)a1[4])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topic"));
    v6 = (void *)a1[5];

    if (v5 == v6)
    {
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
      objc_msgSend(v7, "setTopic:", a1[5]);
    }
  }
  else
  {

  }
}

void sub_10003DAF4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "topic"));
  objc_msgSend(v2, "addObject:", v3);

}

void sub_10003DBB4(uint64_t a1)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  NSObject *v26;
  __int16 v27;
  void *v28;

  v2 = sub_100011D0C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(NSObject **)(a1 + 32);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "environmentName"));
    *(_DWORD *)buf = 138412546;
    v26 = v4;
    v27 = 2112;
    v28 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Attempting to deregister delegate %@ in environment %@", buf, 0x16u);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "registeredDelegates"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10003DE94;
  v22[3] = &unk_10009A9F8;
  v23 = *(id *)(a1 + 32);
  v8 = v6;
  v24 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v22);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "registeredDelegates"));
  v10 = objc_msgSend(v9, "count");
  v11 = objc_msgSend(v8, "count");

  if (v10 != v11)
  {
    objc_msgSend(*(id *)(a1 + 40), "setRegisteredDelegates:", v8);
    if (byte_1000B3828 == 1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "registeredDelegates"));
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10003DEF4;
      v20[3] = &unk_10009A9D0;
      v14 = v12;
      v21 = v14;
      objc_msgSend(v13, "enumerateObjectsUsingBlock:", v20);

      v15 = sub_100011D0C();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v14;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Updating list of topics after deregister: %@", buf, 0xCu);
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "apsConnection"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject allObjects](v14, "allObjects"));
      objc_msgSend(v17, "setEnabledTopics:", v18);

    }
    else
    {
      v19 = sub_100011D0C();
      v14 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Not updating list of topics after deregister since startup is not complete. Will do this later", buf, 2u);
      }
    }

  }
}

void sub_10003DE94(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));
  v4 = *(void **)(a1 + 32);

  if (v3 != v4)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

void sub_10003DEF4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "topic"));
  objc_msgSend(v2, "addObject:", v3);

}

void sub_10003DF58(id a1)
{
  objc_msgSend((id)qword_1000B3810, "enumerateKeysAndObjectsUsingBlock:", &stru_10009AA58);
}

void sub_10003DF6C(id a1, id a2, FMFAPSHandler *a3, BOOL *a4)
{
  FMFAPSHandler *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFAPSHandler registeredDelegates](v4, "registeredDelegates"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10003E24C;
  v27[3] = &unk_10009A9D0;
  v7 = v5;
  v28 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v27);

  v8 = sub_100011D0C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Updating list of topics after completion of startup: %@", buf, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMFAPSHandler apsConnection](v4, "apsConnection"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));
  objc_msgSend(v10, "setEnabledTopics:", v11);

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMFAPSHandler pendingPushes](v4, "pendingPushes"));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("topic")));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("message")));
        v20 = sub_100011D0C();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v30 = v18;
          v31 = 2112;
          v32 = v19;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Replaying aps message on topic %@: %@", buf, 0x16u);
        }

        -[FMFAPSHandler handleMessage:onTopic:](v4, "handleMessage:onTopic:", v19, v18);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    }
    while (v14);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[FMFAPSHandler setPendingPushes:](v4, "setPendingPushes:", v22);

}

void sub_10003E24C(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "topic"));
  objc_msgSend(v2, "addObject:", v3);

}

void sub_10003E290(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topic"));
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
    v7 = sub_100011D0C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Found delegate with matching topic %@", (uint8_t *)&v11, 0xCu);
    }

    v9 = *(_QWORD *)(a1 + 40);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topic"));
    objc_msgSend(v6, "didReceiveAPSMessage:onTopic:", v9, v10);

  }
}

void sub_10003E530(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  unsigned int v9;

  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    v2 = sub_100011D0C();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "registeredDelegates"));
      *(_DWORD *)buf = 67109120;
      v9 = objc_msgSend(v4, "count");
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Notifying %d delegates about the updated aps token", buf, 8u);

    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "registeredDelegates"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10003E65C;
    v6[3] = &unk_10009A9D0;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

  }
}

void sub_10003E65C(uint64_t a1, void *a2)
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "delegate"));
  objc_msgSend(v3, "didReceiveAPSToken:", *(_QWORD *)(a1 + 32));

}

void sub_10003E724(id a1)
{
  id v1;
  NSObject *v2;
  FMFXPCSessionManager *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v1 = sub_100011D0C();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Creating shared instance of FMFXPCSessionManager", v7, 2u);
  }

  v3 = objc_alloc_init(FMFXPCSessionManager);
  v4 = (void *)qword_1000B3830;
  qword_1000B3830 = (uint64_t)v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", qword_1000B3830, "invalidateMaxCallbackTimer", off_1000B2FC0, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", qword_1000B3830, "networkReachabilityUpdated:", off_1000B2FD8, 0);

}

void sub_10003EA20(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "internalClientSessions"));
  v3 = objc_msgSend(v2, "count");

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "internalClientSessions"));
  objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "internalClientSessions"));
  v6 = objc_msgSend(v5, "count");

  if (v6 < v3)
  {
    v7 = sub_100011D0C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "internalClientSessions"));
      v11 = objc_msgSend(v10, "count");
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_internalClientSessionPIDsString"));
      v13 = 138412802;
      v14 = v9;
      v15 = 2048;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "📩 Removed: %@ (%lu active pids: {%@})", (uint8_t *)&v13, 0x20u);

    }
  }
}

void sub_10003EEA0(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;

  v3 = a2;
  v4 = sub_100011D0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v12 = 138412546;
      v13 = v7;
      v14 = 2112;
      v15 = v3;
      v8 = "Error in quickly refreshing handles: %@, error: %@";
      v9 = v5;
      v10 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, v10);
    }
  }
  else if (v6)
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = 138412290;
    v13 = v11;
    v8 = "Quickly refreshed handles: %@, successfully";
    v9 = v5;
    v10 = 12;
    goto LABEL_6;
  }

}

void sub_10003F62C(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *j;
  uint64_t v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  id v37;
  id obj;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  void *v46;
  id v47;
  uint64_t v48;
  NSObject *v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t buf[4];
  NSObject *v68;
  __int16 v69;
  uint64_t v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];

  v41 = a2;
  v5 = a3;
  v6 = sub_100011D0C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      v68 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Error while getting locations: %@", buf, 0xCu);
    }
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Location response received", buf, 2u);
    }

    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    obj = *(id *)(a1 + 32);
    v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v74, 16);
    v7 = 0;
    if (v42)
    {
      v39 = *(_QWORD *)v64;
      v40 = a1;
      do
      {
        v9 = 0;
        v10 = v7;
        do
        {
          if (*(_QWORD *)v64 != v39)
            objc_enumerationMutation(obj);
          v43 = v9;
          v46 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v9);
          v49 = objc_alloc_init((Class)NSMutableSet);

          v61 = 0u;
          v62 = 0u;
          v59 = 0u;
          v60 = 0u;
          v44 = v41;
          v47 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v59, v73, 16);
          if (v47)
          {
            v45 = *(_QWORD *)v60;
            do
            {
              v11 = 0;
              do
              {
                if (*(_QWORD *)v60 != v45)
                  objc_enumerationMutation(v44);
                v48 = v11;
                v12 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v11);
                v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "handles"));
                v14 = objc_msgSend(v13, "copy");

                v57 = 0u;
                v58 = 0u;
                v55 = 0u;
                v56 = 0u;
                v50 = v14;
                v15 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v55, v72, 16);
                if (v15)
                {
                  v16 = v15;
                  v17 = *(_QWORD *)v56;
                  do
                  {
                    for (i = 0; i != v16; i = (char *)i + 1)
                    {
                      if (*(_QWORD *)v56 != v17)
                        objc_enumerationMutation(v50);
                      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1)
                                                                                         + 8 * (_QWORD)i), "identifier"));
                      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lowercaseString"));
                      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "handle"));
                      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifier"));
                      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "lowercaseString"));
                      v24 = objc_msgSend(v20, "isEqualToString:", v23);

                      if (v24)
                        -[NSObject addObject:](v49, "addObject:", v12);
                    }
                    v16 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v55, v72, 16);
                  }
                  while (v16);
                }

                v11 = v48 + 1;
              }
              while ((id)(v48 + 1) != v47);
              v47 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v59, v73, 16);
            }
            while (v47);
          }

          v25 = sub_100011D0C();
          v26 = objc_claimAutoreleasedReturnValue(v25);
          v7 = v49;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v68 = v49;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Calling setLocations on session for locations: %@", buf, 0xCu);
          }

          if (-[NSObject count](v49, "count"))
          {
            v53 = 0u;
            v54 = 0u;
            v51 = 0u;
            v52 = 0u;
            v27 = v49;
            v28 = -[NSObject countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v51, v71, 16);
            if (v28)
            {
              v29 = v28;
              v30 = *(_QWORD *)v52;
              do
              {
                for (j = 0; j != v29; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v52 != v30)
                    objc_enumerationMutation(v27);
                  v32 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)j);
                  v33 = sub_100011D0C();
                  v34 = objc_claimAutoreleasedReturnValue(v33);
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                  {
                    v35 = *(NSObject **)(v40 + 40);
                    *(_DWORD *)buf = 138412546;
                    v68 = v35;
                    v69 = 2112;
                    v70 = v32;
                    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%@: ingesting (refresh): %@", buf, 0x16u);
                  }

                }
                v29 = -[NSObject countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v51, v71, 16);
              }
              while (v29);
            }

            v7 = v49;
          }
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "clientProxy"));
          v37 = -[NSObject copy](v7, "copy");
          objc_msgSend(v36, "setLocations:", v37);

          v9 = v43 + 1;
          v10 = v7;
        }
        while ((id)(v43 + 1) != v42);
        v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v74, 16);
      }
      while (v42);
    }

    v5 = 0;
  }

}

void sub_10004024C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  uint64_t v8;
  int v9;
  id v10;

  v3 = a2;
  v4 = sub_100011D0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMFSaveFavoritesOperations: saveFavorites command completed with error?: %@", (uint8_t *)&v9, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "completionBlock"));
  if (v6)
  {
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "completionBlock"));
    ((void (**)(_QWORD, id))v7)[2](v7, v3);

  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);

}

void sub_10004076C(id a1)
{
  id v1;
  NSObject *v2;
  id v3;
  void *v4;
  uint8_t v5[16];

  v1 = sub_100011D0C();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Creating shared instance of FMFServerUserNotificationManager_iOS", v5, 2u);
  }

  v3 = -[FMFServerUserNotificationManager initSingleton]([FMFServerUserNotificationManager alloc], "initSingleton");
  v4 = (void *)qword_1000B3840;
  qword_1000B3840 = (uint64_t)v3;

}

void sub_100040E74(uint64_t a1)
{
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v2;
  __CFRunLoop *Current;

  RunLoopSource = CFUserNotificationCreateRunLoopSource(kCFAllocatorDefault, *(CFUserNotificationRef *)(a1 + 32), (CFUserNotificationCallBack)sub_100040EE0, 0);
  if (RunLoopSource)
  {
    v2 = RunLoopSource;
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, v2, kCFRunLoopCommonModes);
    CFRelease(v2);
  }
}

void sub_100040EE0(const void *a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", a1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMFServerUserNotificationManager sharedInstance](FMFServerUserNotificationManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeUserNotifications"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v19));

  if (a2 == 1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "alternateButtonAction"));

    if (!v9)
      goto LABEL_8;
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "alternateButtonAction"));
    goto LABEL_7;
  }
  if (!a2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "defaultButtonAction"));

    if (v7)
    {
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "defaultButtonAction"));
LABEL_7:
      v10 = (void *)v8;
      (*(void (**)(void))(v8 + 16))();

    }
  }
LABEL_8:
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMFServerUserNotificationManager sharedInstance](FMFServerUserNotificationManager, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "activeUserNotifications"));
  objc_msgSend(v12, "removeObjectForKey:", v19);

  if (objc_msgSend(v6, "category"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMFServerUserNotificationManager sharedInstance](FMFServerUserNotificationManager, "sharedInstance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activeCFNotificationsByCategory"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v6, "category")));
    objc_msgSend(v14, "removeObjectForKey:", v15);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[FMFServerUserNotificationManager sharedInstance](FMFServerUserNotificationManager, "sharedInstance"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "_xpcTransactionNameFor:", v6));
  objc_msgSend(v16, "endTransaction:", v18);

  CFRelease(a1);
}

void sub_100041148(id a1)
{
  FMFCommandManager *v1;
  void *v2;
  FMFServerInteractionController *v3;
  void *v4;
  void *v5;
  id v6;
  dispatch_queue_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  dispatch_queue_t v14;

  v1 = objc_alloc_init(FMFCommandManager);
  v2 = (void *)qword_1000B3850;
  qword_1000B3850 = (uint64_t)v1;

  v3 = objc_alloc_init(FMFServerInteractionController);
  objc_msgSend((id)qword_1000B3850, "setServerInteractionController:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  objc_msgSend((id)qword_1000B3850, "setHandlesToBeLocated:", v4);

  objc_msgSend((id)qword_1000B3850, "setHasModelInitialized:", 0);
  objc_msgSend((id)qword_1000B3850, "setIsPendingRefresh:", 0);
  objc_msgSend((id)qword_1000B3850, "setIsRefreshInProgress:", 0);
  objc_msgSend((id)qword_1000B3850, "setPreferredColeasedRefreshPriority:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("tap"), CFSTR("forced"), CFSTR("timer"), CFSTR("updateData"), CFSTR("userLocate"), CFSTR("apsTokenChange"), CFSTR("heartbeat"), CFSTR("firstunlock"), CFSTR("refreshMappingPackets"), CFSTR("bar"), CFSTR("notificationTokenInvalid"), CFSTR("audioAccessoryForced"), CFSTR("credentialRenewed"), CFSTR("cloudKitRecordsChanged"), CFSTR("clientSessionCreated"), CFSTR("apsStatusReconnected"),
                   0));
  objc_msgSend((id)qword_1000B3850, "setEnumToStringMap:", v5);

  v6 = objc_msgSend(objc_alloc((Class)NSCountedSet), "initWithCapacity:", 50);
  objc_msgSend((id)qword_1000B3850, "setSkippedRefreshReasons:", v6);

  objc_msgSend((id)qword_1000B3850, "setRegistrationRetries:", 0);
  objc_msgSend((id)qword_1000B3850, "setLatest5XXTS:", 0);
  v7 = dispatch_queue_create("com.apple.icloud.fmfd.redirectsUpdaterQueue", 0);
  objc_msgSend((id)qword_1000B3850, "setRedirectsUpdaterQueue:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "addObserver:selector:name:object:", qword_1000B3850, "accountWasRemoved", off_1000B2FC0, 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "addObserver:selector:name:object:", qword_1000B3850, "showAlertFromServerResponse:", off_1000B2FD0, 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v10, "addObserver:selector:name:object:", qword_1000B3850, "hostRedirected:", FMCommandRedirectedNotification, 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v12 = qword_1000B3850;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCloudKitManager sharedInstance](FMFCloudKitManager, "sharedInstance"));
  objc_msgSend(v11, "addObserver:selector:name:object:", v12, "cloudKitRecordsChanged:", CFSTR("FMFCloudKitManagerRecordsDidChangeNotification"), v13);

  v14 = dispatch_queue_create("com.apple.icloud.fmfd.serverContextQueue", 0);
  objc_msgSend((id)qword_1000B3850, "setServerContextQueue:", v14);

}

void sub_100041694(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  NSObject *v12;
  const char *v13;
  id v14;
  NSObject *v15;
  uint32_t v16;
  id v17;
  id v18;
  int v19;
  double v20;
  __int16 v21;
  id v22;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "registrationCheckTimer"));
  objc_msgSend(v2, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "setRegistrationCheckTimer:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "maxTriesToRegisterDevice"));

  if (!v4)
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 3.0));
  if (((unint64_t)objc_msgSend(v4, "integerValue") & 0x8000000000000000) != 0)
  {
    v14 = sub_100011D0C();
    v12 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412290;
      v20 = *(double *)&v4;
      v13 = "Not scheduling registration sanity check, since server sent -ve maxRetries(%@) value";
      goto LABEL_12;
    }
  }
  else
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "registrationRetries");
    if ((uint64_t)v5 >= (uint64_t)objc_msgSend(v4, "integerValue"))
    {
      v17 = sub_100011D0C();
      v12 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v18 = objc_msgSend(*(id *)(a1 + 32), "registrationRetries");
        v19 = 138412546;
        v20 = *(double *)&v4;
        v21 = 2048;
        v22 = v18;
        v13 = "Not scheduling registration sanity check, exceeded maxRetries(%@) current registrationRetries(%ld)";
        v15 = v12;
        v16 = 22;
        goto LABEL_15;
      }
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
      objc_msgSend(v6, "maxWaitTimeForRegisterMS");
      v8 = v7;

      if (v8 <= 0.0)
        v9 = 20.0;
      else
        v9 = v8 / 1000.0;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 32), "_performDeviceRegistrationCheck:", 0, 0, v9));
      objc_msgSend(*(id *)(a1 + 32), "setRegistrationCheckTimer:", v10);

      v11 = sub_100011D0C();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 134217984;
        v20 = v9;
        v13 = "Registration check timer scheduled to trigger in %f sesconds";
LABEL_12:
        v15 = v12;
        v16 = 12;
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v19, v16);
      }
    }
  }

}

void sub_100041AE4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "account"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dsid"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastLoggedInPrsId"));

    if (v7 && (objc_msgSend(v7, "isEqualToString:", v9) & 1) == 0)
    {
      v11 = objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
      -[NSObject updateLastLoggedInPrsId:](v11, "updateLastLoggedInPrsId:", v7);
    }
    else
    {
      v10 = sub_100011D0C();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412546;
        v15 = v7;
        v16 = 2112;
        v17 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Skipping last logged in prs id due to currentLoggedInPrsId(%@) and lastLoggedInPrsId(%@)", (uint8_t *)&v14, 0x16u);
      }
    }

  }
  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);

  }
}

void sub_100041E68(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;

  v3 = a2;
  v4 = sub_100011D0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      v14 = 138412290;
      v15 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Error while init: %@", (uint8_t *)&v14, 0xCu);
    }

    v7 = *(_QWORD *)(a1 + 48);
    if (!v7)
    {
      v8 = sub_100011D0C();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Error while init, but there is no completion block, notifying client through delegate callback", (uint8_t *)&v14, 2u);
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "clientProxy"));
      objc_msgSend(v10, "didReceiveServerError:", v3);

      goto LABEL_12;
    }
LABEL_11:
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
    goto LABEL_12;
  }
  if (v6)
  {
    LOWORD(v14) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Init succeeded", (uint8_t *)&v14, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setHasModelInitialized:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v11, "postNotificationName:object:", off_1000B2FE0, 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  objc_msgSend(v12, "clearTapMessagesCache");

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMFBlockListManager sharedInstance](FMFBlockListManager, "sharedInstance"));
  objc_msgSend(v13, "sanitizeBlockList");

  objc_msgSend(*(id *)(a1 + 32), "_scheduleRegistrationSanityCheck");
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    goto LABEL_11;
LABEL_12:

}

void sub_10004213C(id *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  if (a2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 1011, 0));
    objc_msgSend(a1[5], "setError:", v3);

    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "serverInteractionController"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100042238;
    v6[3] = &unk_10009AB30;
    v5 = a1[5];
    v8 = a1[6];
    v7 = a1[5];
    objc_msgSend(v4, "sendCommand:completionBlock:", v5, v6);

  }
}

uint64_t sub_100042238(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_100042AA4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "jsonResponseDictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  objc_msgSend(v4, "setLocationsFromData:", v3);

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "locationsForHandles:", *(_QWORD *)(a1 + 32)));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));
    (*(void (**)(uint64_t, void *, void *))(v5 + 16))(v5, v7, v8);

  }
}

void sub_100042C34(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "error"));
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void sub_100042D44(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "error"));
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void sub_100042E60(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "error"));
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void sub_100042F7C(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "error"));
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void sub_1000431EC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));

  if (v4)
  {
    v5 = sub_100011D0C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Error while trying to check reachability: %@", buf, 0xCu);
    }

  }
  if (*(_QWORD *)(a1 + 40))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "statusMapFromServer"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v20 = a1;
    v8 = *(id *)(a1 + 32);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "qualifiedIdentifier"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v14));
          v16 = objc_msgSend(v15, "BOOLValue");

          objc_msgSend(v13, "setReachable:", v16);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v10);
    }

    v17 = *(_QWORD *)(v20 + 32);
    v18 = *(_QWORD *)(v20 + 40);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));
    (*(void (**)(uint64_t, uint64_t, void *))(v18 + 16))(v18, v17, v19);

  }
}

void sub_10004365C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  _BYTE v27[128];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "requestTokens"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));

  if (!v5)
  {
    v20 = v3;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v19 = a1;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "toHandles"));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "followerHandleForIdentifier:", v13));

          if (v14)
          {
            v15 = sub_100011D0C();
            v16 = objc_claimAutoreleasedReturnValue(v15);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v26 = v14;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Not adding handle to cache because they are already a follower: %@", buf, 0xCu);
            }

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v8);
    }

    v3 = v20;
    a1 = v19;
  }
  v17 = *(_QWORD *)(a1 + 40);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));
  (*(void (**)(uint64_t, void *, void *))(v17 + 16))(v17, v4, v18);

}

void sub_1000439D0(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "requestTokens"));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));

  (*(void (**)(uint64_t, id, void *))(v4 + 16))(v4, v6, v5);
}

void sub_100043CA0(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "requestTokens"));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));

  (*(void (**)(uint64_t, id, void *))(v4 + 16))(v4, v6, v5);
}

void sub_100043EE8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "requestTokens"));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));

  (*(void (**)(uint64_t, id, void *))(v4 + 16))(v4, v6, v5);
}

void sub_100044164(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  objc_msgSend(v4, "removeFutureFollowerRequest:", *(_QWORD *)(a1 + 32));

  v5 = *(_QWORD *)(a1 + 40);
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));

  (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
}

void sub_1000442EC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  objc_msgSend(v4, "removeFutureFollowerRequest:", *(_QWORD *)(a1 + 32));

  v5 = *(_QWORD *)(a1 + 40);
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));

  (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
}

void sub_100044490(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "requestTokens"));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));

  (*(void (**)(uint64_t, id, void *))(v4 + 16))(v4, v6, v5);
}

void sub_100044624(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "error"));

  v4 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "error"));
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, void *))(v4 + 16))(v4, 0, 0, 0, 0, v5);
  }
  else
  {
    v6 = v10;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "requestTokensStatusMap"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "requestTokens"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "follower"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "following"));

    (*(void (**)(uint64_t, void *, void *, void *, void *, _QWORD))(v4 + 16))(v4, v5, v7, v8, v9, 0);
  }

}

void sub_100044840(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));

  v4 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v4 + 16))(v4, 0, 0, v5);
  }
  else
  {
    v6 = v9;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "offerPending"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "invitePending"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "error"));

    (*(void (**)(uint64_t, void *, void *, void *))(v4 + 16))(v4, v5, v7, v8);
  }

}

void sub_100044B7C(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "responseId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v6, v5);
}

void sub_100044CE4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "error"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
    objc_msgSend(v4, "storeInvalidMappingPacketsForFutureRemoval:", *(_QWORD *)(a1 + 32));

  }
  v5 = *(_QWORD *)(a1 + 40);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "error"));
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

}

void sub_100044E5C(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;

  v2 = sub_100011D0C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "userInfo"));
    v14 = 138412290;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Received host redirected notification, with userInfo: %@", (uint8_t *)&v14, 0xCu);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("originalHostname")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("redirectedHostname")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "appHostnameFromSettings"));

  if (objc_msgSend(v9, "length"))
  {
    v10 = sub_100011D0C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412546;
      v15 = v6;
      v16 = 2112;
      v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "330: Updating appHostNameFromSettings, current oldHostName(%@), host name from settings(%@)", (uint8_t *)&v14, 0x16u);
    }

    v12 = v9;
    v6 = v12;
  }
  if (v6 && v7)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v7, v6));
    objc_msgSend(*(id *)(a1 + 40), "updateRedirectsCache:", v13);

  }
}

id sub_10004522C(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  uint8_t v6[16];

  v2 = sub_100011D0C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cleaning up cached redirects", v6, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
  objc_msgSend(*(id *)(a1 + 32), "setCachedRedirects:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "storeRedirectsToDefaults");
}

id sub_100045EAC(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;

  v2 = sub_100011D0C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "OK button tapped. Performing action %@", (uint8_t *)&v6, 0xCu);
  }

  return +[FMFUtils handleAlertAction:](FMFUtils, "handleAlertAction:", *(_QWORD *)(a1 + 40));
}

id sub_100045F60(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;

  v2 = sub_100011D0C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Cancel button tapped. Performing action %@", (uint8_t *)&v6, 0xCu);
  }

  return +[FMFUtils handleAlertAction:](FMFUtils, "handleAlertAction:", *(_QWORD *)(a1 + 40));
}

id sub_100046014(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activate");
}

void sub_10004601C(uint64_t a1)
{
  void *v2;
  FMFSaveMeCommand *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "thisDeviceId"));

  v3 = -[FMFSaveMeCommand initWithDeviceId:]([FMFSaveMeCommand alloc], "initWithDeviceId:", v4);
  objc_msgSend(*(id *)(a1 + 32), "sendCommand:completionBlock:", v3, &stru_10009ABE8);

}

void sub_100046098(id a1, FMFBaseCmd *a2)
{
  FMFBaseCmd *v2;
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  int v8;
  void *v9;

  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFBaseCmd error](v2, "error"));

  v4 = sub_100011D0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMFBaseCmd error](v2, "error"));
      v8 = 138412290;
      v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Failed while trying to set this device as me device, error: %@", (uint8_t *)&v8, 0xCu);

    }
  }
  else if (v6)
  {
    LOWORD(v8) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully set this device as me device, through SAVEME alert", (uint8_t *)&v8, 2u);
  }

}

void sub_1000461A0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));

  v5 = sub_100011D0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));
      v11 = 138412546;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Failed while trying to acknowledge display of alert with id: %@, error: %@", (uint8_t *)&v11, 0x16u);

    }
  }
  else if (v7)
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = 138412290;
    v12 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Successfully acknowledged display of this alert with id: %@", (uint8_t *)&v11, 0xCu);
  }

}

uint64_t sub_100046660(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100046670(uint64_t a1)
{

}

void sub_100046854(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));

  v5 = sub_100011D0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));
      v11 = 138412290;
      v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMFCommandManager: send command failed: %@", (uint8_t *)&v11, 0xCu);

    }
    v9 = *(_QWORD *)(a1 + 32);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  }
  else
  {
    if (v7)
    {
      v11 = 138412290;
      v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMFCommandManager: send command succeeded: %@", (uint8_t *)&v11, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void sub_100046B84(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));

  v5 = sub_100011D0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));
      v11 = 138412290;
      v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMFCommandManager: saveFavorites command failed: %@", (uint8_t *)&v11, 0xCu);

    }
    v9 = *(_QWORD *)(a1 + 32);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  }
  else
  {
    if (v7)
    {
      v11 = 138412290;
      v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMFCommandManager: saveFavorites command succeeded: %@", (uint8_t *)&v11, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void sub_100047B2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100047B44(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100047B54(uint64_t a1)
{

}

void sub_100047B5C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  int v13;
  const char *v14;

  v2 = CKDatabaseScopeString(*(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storedDSID"));

  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "stringByAppendingString:", v7));
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  else
  {
    v11 = sub_100011D0C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315138;
      v14 = "-[FMFCloudKitCache scopeStringForAccountWithScope:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: No account DSID", (uint8_t *)&v13, 0xCu);
    }

  }
}

void sub_100049764(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

FMFSchedule *__cdecl sub_100049D64(id a1, FMFFence *a2)
{
  return (FMFSchedule *)-[FMFFence schedule](a2, "schedule");
}

void sub_10004A350(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v7 = a3;
  objc_msgSend(v4, "postConfirmationNotificationWithUUID:atDate:", v5, v6);
  (*(void (**)(void))(a1[7] + 16))();

}

BOOL sub_10004A6D4(id a1, FMFFence *a2)
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence trigger](a2, "trigger"));
  v3 = objc_msgSend(v2, "isEqualToString:", FMFFenceTriggerScheduled);

  return v3;
}

void sub_10004A7DC(uint64_t a1)
{
  id v1;
  id v2;
  __int128 v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  unsigned int v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  _QWORD v22[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  _BYTE v29[128];

  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v2)
  {
    v4 = v2;
    v5 = *(_QWORD *)v24;
    v6 = FMFFenceAcceptanceStatusPendingHidden;
    v20 = FMFFenceAcceptanceStatusPending;
    *(_QWORD *)&v3 = 138412290;
    v19 = v3;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v24 != v5)
          objc_enumerationMutation(v1);
        v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now", v19));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "inviteDate"));
        v11 = objc_msgSend(v9, "compare:", v10);

        if (v11 == (id)1)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "acceptanceStatus"));
          if (objc_msgSend(v12, "isEqualToString:", v6))
          {
            v13 = objc_msgSend(v8, "isOnMe");

            if (v13)
            {
              v14 = sub_100011D0C();
              v15 = objc_claimAutoreleasedReturnValue(v14);
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
                *(_DWORD *)buf = v19;
                v28 = v16;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Fence invite date overdue, inviting fence: %@", buf, 0xCu);

              }
              objc_msgSend(v8, "setAcceptanceStatus:", v20);
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "delegate"));
              v18 = *(_QWORD *)(a1 + 40);
              v22[0] = _NSConcreteStackBlock;
              v22[1] = 3221225472;
              v22[2] = sub_10004AA44;
              v22[3] = &unk_10009AD30;
              v22[4] = v8;
              objc_msgSend(v17, "triggerManager:didModifyFence:withCompletion:", v18, v8, v22);

            }
          }
          else
          {

          }
        }
        v7 = (char *)v7 + 1;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v4);
  }

}

void sub_10004AA44(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v1, "postConfirmationNotificationWithUUID:atDate:", v3, v2);

}

void sub_10004AB30(uint64_t a1, void *a2)
{
  id v3;
  const char *string;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;

  v3 = a2;
  string = xpc_dictionary_get_string(v3, _xpc_event_key_name);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
  v6 = sub_100011D0C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315394;
    v12 = "-[FMFFenceTriggerManager registerAlarms]_block_invoke";
    v13 = 2112;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: XPC Alarm fired with name: %@", (uint8_t *)&v11, 0x16u);
  }

  if (!strcmp(string, "com.apple.icloud.fmf.FMFFenceInviteTimer"))
  {
    v8 = 0;
    goto LABEL_9;
  }
  if (!strcmp(string, FMFScheduleTimerIdentifier))
  {
    v8 = 1;
    goto LABEL_9;
  }
  if (!strcmp(string, "com.apple.icloud.fmf.FMFFenceTriggerManager.GraceTimer"))
  {
    v8 = 2;
LABEL_9:
    objc_msgSend(*(id *)(a1 + 32), "handleAlarmForAlarmName:", v8);
  }
  v9 = FMFFenceTimerAlarmStream;
  v10 = xpc_dictionary_get_string(v3, _xpc_event_key_name);
  xpc_set_event(v9, v10, 0);

}

void sub_10004B210(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v1, "postConfirmationNotificationWithUUID:atDate:", v3, v2);

}

uint64_t sub_10004B438(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  NSObject *v7;
  const char *v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  int v18;
  const char *v19;
  __int16 v20;
  id v21;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "acceptanceStatus"));
  v5 = objc_msgSend(v4, "isEqualToString:", FMFFenceAcceptanceStatusAccepted);

  if ((v5 & 1) != 0)
  {
    if (objc_msgSend(v3, "isOnMe"))
    {
      v6 = sub_100011D0C();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v18 = 136315394;
        v19 = "-[FMFFenceTriggerManager _graceTimerFired]_block_invoke";
        v20 = 2112;
        v21 = v3;
        v8 = "%s: bailing, fence on me: %@";
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v18, 0x16u);
      }
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "schedule"));
      v11 = objc_msgSend(v10, "isCurrentAt:", *(_QWORD *)(a1 + 32));

      if ((v11 & 1) != 0)
      {
        if (objc_msgSend(v3, "isMuted"))
        {
          v12 = sub_100011D0C();
          v7 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          {
            v18 = 136315394;
            v19 = "-[FMFFenceTriggerManager _graceTimerFired]_block_invoke";
            v20 = 2112;
            v21 = v3;
            v8 = "%s: bailing, fence is muted: %@";
            goto LABEL_16;
          }
        }
        else
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "statusForDate:", *(_QWORD *)(a1 + 32)));

          if (!v14)
          {
            v16 = 1;
            goto LABEL_18;
          }
          AnalyticsSendEvent(CFSTR("com.apple.icloud.fmfd.ReliabilityMetric"), &off_1000A11E0);
          v15 = sub_100011D0C();
          v7 = objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          {
            v18 = 136315394;
            v19 = "-[FMFFenceTriggerManager _graceTimerFired]_block_invoke";
            v20 = 2112;
            v21 = v3;
            v8 = "%s: bailing, fence already has status: %@";
            goto LABEL_16;
          }
        }
      }
      else
      {
        v13 = sub_100011D0C();
        v7 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v18 = 136315394;
          v19 = "-[FMFFenceTriggerManager _graceTimerFired]_block_invoke";
          v20 = 2112;
          v21 = v3;
          v8 = "%s: bailing, fence is not current: %@";
          goto LABEL_16;
        }
      }
    }
  }
  else
  {
    v9 = sub_100011D0C();
    v7 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v18 = 136315394;
      v19 = "-[FMFFenceTriggerManager _graceTimerFired]_block_invoke";
      v20 = 2112;
      v21 = v3;
      v8 = "%s: bailing, fence not accepted: %@";
      goto LABEL_16;
    }
  }

  v16 = 0;
LABEL_18:

  return v16;
}

void sub_10004BCEC(id a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = CFSTR("FMFScheduledFenceStatus");
  v8 = &__NSDictionary0__struct;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  objc_msgSend(v1, "registerDefaults:", v2);

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dictionaryForKey:", CFSTR("FMFScheduledFenceStatus")));
  v5 = objc_msgSend(v4, "mutableCopy");
  v6 = (void *)qword_1000B3860;
  qword_1000B3860 = (uint64_t)v5;

}

FMFHandle *__cdecl sub_10004CF78(id a1, NSString *a2)
{
  NSString *v2;
  void *v3;
  void *v4;

  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "followerHandleForServerId:", v2));

  return (FMFHandle *)v4;
}

void sub_10004D0DC(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;

  v3 = a2;
  v4 = sub_100011D0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100065730();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 136315394;
    v9 = "-[FMFFence(Notifications) postConfirmationNotificationWithUUID:atDate:]_block_invoke";
    v10 = 2112;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: posted uuid: %@", (uint8_t *)&v8, 0x16u);
  }

}

void sub_10004D40C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;

  v3 = a2;
  v4 = sub_100011D0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000657A0();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 136315394;
    v9 = "-[FMFFence(Notifications) postReceiveTriggerNotificationWithUUID:forStatus:atDate:triggerLocation:]_block_invoke";
    v10 = 2112;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: posted uuid: %@", (uint8_t *)&v8, 0x16u);
  }

}

void sub_10004D764(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;

  v3 = a2;
  v4 = sub_100011D0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100065810();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 136315394;
    v9 = "-[FMFFence(Notifications) postTriggerNotificationWithUUID:forStatus:atDate:triggerLocation:]_block_invoke";
    v10 = 2112;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: posted uuid: %@", (uint8_t *)&v8, 0x16u);
  }

}

void sub_10004E8AC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

uint64_t sub_10004F078(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10004F088(uint64_t a1)
{

}

void sub_10004F090(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("com.example.mobileme.FMF.FMFBaseCmd.transactionFactory", 0);
  v2 = (void *)qword_1000B3878;
  qword_1000B3878 = (uint64_t)v1;

}

void sub_10004F268(id a1)
{
  void *v1;
  id v2;
  void *v3;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLQueryAllowedCharacterSet](NSCharacterSet, "URLQueryAllowedCharacterSet"));
  v2 = objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "removeCharactersInString:", CFSTR("!*'();:@&=+$,/?%#[]"));
  v3 = (void *)qword_1000B3880;
  qword_1000B3880 = (uint64_t)v2;

}

void sub_10004F584(uint64_t a1)
{
  NSArray *v2;

  v2 = objc_opt_new(NSArray);
  objc_msgSend(*(id *)(a1 + 32), "setFavoriteHandles:", v2);

}

void sub_10004F6DC(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "favoriteHandles"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "handles:minusHandle:", v3, *(_QWORD *)(a1 + 40)));
  v7 = objc_msgSend(v4, "mutableCopy");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
  objc_msgSend(*(id *)(a1 + 40), "setFavoriteOrder:", v5);

  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &stru_10009AE38);
  objc_msgSend(v7, "insertObject:atIndex:", *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(*(id *)(a1 + 32), "setFavoriteHandles:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "favoritesDataFromHandles:", v7));
  objc_msgSend(*(id *)(a1 + 32), "setFavoritesData:", v6);

}

void sub_10004F7C0(id a1, FMFHandle *a2, unint64_t a3, BOOL *a4)
{
  unint64_t v4;
  FMFHandle *v5;
  id v6;

  v4 = a3 + 1;
  v5 = a2;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v4));
  -[FMFHandle setFavoriteOrder:](v5, "setFavoriteOrder:", v6);

}

void sub_10004F938(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "favoriteHandles"));
  v15 = objc_opt_new(NSMutableArray);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serverId"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "serverId"));
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

        if ((v12 & 1) == 0)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v6));
          objc_msgSend(v9, "setFavoriteOrder:", v13);

          -[NSMutableArray addObject:](v15, "addObject:", v9);
          ++v6;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 32), "setFavoriteHandles:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "favoritesDataFromHandles:", v15));
  objc_msgSend(*(id *)(a1 + 32), "setFavoritesData:", v14);

}

id sub_10004FC74(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFavoritesData:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "updateHandlesWithFavorites:", *(_QWORD *)(a1 + 48));
}

void sub_10004FDC8(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  int v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "favoritesHandlesInHandles:", *(_QWORD *)(a1 + 40)));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "favoritesDataFromHandles:", v2));
  v4 = sub_100011D0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = objc_msgSend(v2, "count");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMFFavoritesSequencer updateWithCachedHandles favorites found (%ld)", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "setFavoriteHandles:", v2);
  objc_msgSend(*(id *)(a1 + 32), "setFavoritesData:", v3);

}

void sub_10004FF88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10004FFA0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10004FFB0(uint64_t a1)
{

}

void sub_10004FFB8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "favoriteHandles"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_100050590(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[2];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = sub_100011D0C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100065ABC();

    v24[0] = CFSTR("fenceType");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "type"));
    v24[1] = CFSTR("updateFenceError");
    v25[0] = v12;
    v13 = stringForCKErrorCode(objc_msgSend(v9, "code"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v25[1] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 2));
    AnalyticsSendEvent(CFSTR("com.apple.icloud.fmfd.ReliabilityMetric"), v15);

    v16 = *(_QWORD *)(a1 + 48);
    v17 = CKXPCSuitableError(v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    (*(void (**)(uint64_t, _QWORD, void *))(v16 + 16))(v16, 0, v18);

  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "recordName"));
    objc_msgSend(*(id *)(a1 + 32), "setCkRecordName:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "zoneID"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "ownerName"));
    objc_msgSend(*(id *)(a1 + 32), "setCkRecordZoneOwnerName:", v23);

    objc_msgSend(*(id *)(a1 + 40), "_addFence:clientSession:ckShare:completion:", *(_QWORD *)(a1 + 32), 0, v8, *(_QWORD *)(a1 + 48));
  }

}

void sub_100050A70(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  _QWORD v27[4];
  _QWORD v28[4];

  if ((a2 & 1) != 0)
  {
    v3 = (void *)objc_opt_class(*(_QWORD *)(a1 + 40));
    v4 = *(void **)(a1 + 32);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100050C68;
    v22[3] = &unk_10009AF50;
    v23 = v4;
    v5 = *(id *)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(a1 + 48);
    v26 = v5;
    v24 = v6;
    v25 = v7;
    objc_msgSend(v3, "ckCheckForStaleZonesForFence:withCompletion:", v23, v22);

    v8 = v23;
  }
  else
  {
    v9 = sub_100011D0C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100065B98(v10, v11, v12, v13, v14, v15, v16, v17);

    v27[0] = CFSTR("fenceType");
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "type"));
    v28[0] = v18;
    v27[1] = CFSTR("fenceTriggerType");
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "trigger"));
    v28[1] = v19;
    v28[2] = &off_1000A0FF0;
    v27[2] = CFSTR("addFenceSuccess");
    v27[3] = CFSTR("addFenceError");
    v28[3] = CFSTR("FMFFenceErrorAppUpgradeNeeded");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 4));
    AnalyticsSendEvent(CFSTR("com.apple.icloud.fmfd.ReliabilityMetric"), v20);

    v21 = *(_QWORD *)(a1 + 56);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFFenceErrorDomain, 0, 0));
    (*(void (**)(uint64_t, _QWORD, void *))(v21 + 16))(v21, 0, v8);
  }

}

void sub_100050C68(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  _QWORD v24[4];
  _QWORD v25[4];

  v3 = a2;
  if (v3)
  {
    v4 = sub_100011D0C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100065C08();

    v24[0] = CFSTR("fenceType");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "type"));
    v25[0] = v6;
    v24[1] = CFSTR("fenceTriggerType");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "trigger"));
    v25[1] = v7;
    v25[2] = &off_1000A0FF0;
    v24[2] = CFSTR("addFenceSuccess");
    v24[3] = CFSTR("addFenceError");
    v8 = stringForCKErrorCode(objc_msgSend(v3, "code"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v25[3] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 4));
    AnalyticsSendEvent(CFSTR("com.apple.icloud.fmfd.ReliabilityMetric"), v10);

    v11 = *(_QWORD *)(a1 + 56);
    v12 = CKXPCSuitableError(v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v13);
  }
  else
  {
    v14 = (void *)objc_opt_class(*(_QWORD *)(a1 + 40));
    v15 = *(void **)(a1 + 32);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100050E70;
    v19[3] = &unk_10009AF28;
    v20 = v15;
    v16 = *(id *)(a1 + 56);
    v17 = *(_QWORD *)(a1 + 40);
    v18 = *(void **)(a1 + 48);
    v23 = v16;
    v21 = v17;
    v22 = v18;
    objc_msgSend(v14, "ckUpdateRecordForFence:withCompletion:", v20, v19);

    v13 = v20;
  }

}

void sub_100050E70(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  _QWORD v26[4];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = sub_100011D0C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100065C08();

    v25[0] = CFSTR("fenceType");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "type"));
    v26[0] = v12;
    v25[1] = CFSTR("fenceTriggerType");
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "trigger"));
    v26[1] = v13;
    v26[2] = &off_1000A0FF0;
    v25[2] = CFSTR("addFenceSuccess");
    v25[3] = CFSTR("addFenceError");
    v14 = stringForCKErrorCode(objc_msgSend(v9, "code"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v26[3] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 4));
    AnalyticsSendEvent(CFSTR("com.apple.icloud.fmfd.ReliabilityMetric"), v16);

    v17 = *(_QWORD *)(a1 + 56);
    v18 = CKXPCSuitableError(v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    (*(void (**)(uint64_t, _QWORD, void *))(v17 + 16))(v17, 0, v19);

  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "recordName"));
    objc_msgSend(*(id *)(a1 + 32), "setCkRecordName:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordID"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "zoneID"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "ownerName"));
    objc_msgSend(*(id *)(a1 + 32), "setCkRecordZoneOwnerName:", v24);

    objc_msgSend(*(id *)(a1 + 40), "_addFence:clientSession:ckShare:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), v8, *(_QWORD *)(a1 + 56));
  }

}

void sub_1000511AC(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _QWORD v44[4];
  _QWORD v45[4];

  v3 = a2;
  if (v3)
  {
    v4 = sub_100011D0C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100065C74();

    v44[0] = CFSTR("fenceType");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "type"));
    v45[0] = v6;
    v44[1] = CFSTR("fenceTriggerType");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "trigger"));
    v45[1] = v7;
    v45[2] = &off_1000A0FF0;
    v44[2] = CFSTR("addFenceSuccess");
    v44[3] = CFSTR("addFenceError");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "FMFErrorAsString:", objc_msgSend(v3, "code")));
    v45[3] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v45, v44, 4));
    AnalyticsSendEvent(CFSTR("com.apple.icloud.fmfd.ReliabilityMetric"), v9);

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "fmf_otherParticipants"));
    v34 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    v11 = 0;
    if (v34)
    {
      v32 = v10;
      v33 = *(_QWORD *)v40;
      do
      {
        v12 = 0;
        v13 = v11;
        do
        {
          if (*(_QWORD *)v40 != v33)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "invitationToken"));

          if (v15)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userIdentity"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "lookupInfo"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "emailAddress"));
            v19 = v18;
            if (v18)
            {
              v20 = v18;
            }
            else
            {
              v22 = a1;
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userIdentity"));
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lookupInfo"));
              v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "phoneNumber"));

              a1 = v22;
              v10 = v32;
            }

            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "URL"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "invitationToken"));
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "ckRecordName"));
            v38 = 0;
            +[FMFCloudKitManager sendShareURL:andInvitationToken:recordName:toDestinationID:error:](FMFCloudKitManager, "sendShareURL:andInvitationToken:recordName:toDestinationID:error:", v25, v26, v27, v20, &v38);
            v21 = v38;

          }
          else
          {
            v21 = 0;
          }
          if (v13)
            v28 = v13;
          else
            v28 = v21;
          v11 = v28;

          v12 = (char *)v12 + 1;
          v13 = v11;
        }
        while (v34 != v12);
        v34 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v34);
    }

    v29 = *(void **)(a1 + 32);
    v30 = *(void **)(a1 + 40);
    v31 = *(_QWORD *)(a1 + 56);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10005157C;
    v35[3] = &unk_100099F90;
    v36 = v29;
    v37 = *(id *)(a1 + 64);
    objc_msgSend(v30, "triggerRepeatedFence:clientSesssion:afterAccpetanceWithCompletion:", v36, v31, v35);

    v3 = 0;
  }

}

void sub_10005157C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[3];
  _QWORD v10[3];

  v3 = a2;
  if (v3)
  {
    v4 = sub_100011D0C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100065CE0();

  }
  v9[0] = CFSTR("fenceType");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "type"));
  v10[0] = v6;
  v9[1] = CFSTR("fenceTriggerType");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "trigger"));
  v9[2] = CFSTR("addFenceSuccess");
  v10[1] = v7;
  v10[2] = &off_1000A1008;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 3));
  AnalyticsSendEvent(CFSTR("com.apple.icloud.fmfd.ReliabilityMetric"), v8);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_100051AD4(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)a1[4];
  v5 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fenceManager"));
  objc_msgSend(v4, "clearStaleFenceTriggerForFence:", a1[5]);

  (*(void (**)(void))(a1[6] + 16))();
}

void sub_100051CD4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  _QWORD v16[4];

  v4 = a3;
  if (v4)
  {
    v5 = sub_100011D0C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100065DBC();

    v15[0] = CFSTR("fenceType");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "type"));
    v16[0] = v7;
    v15[1] = CFSTR("fenceTriggerType");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "trigger"));
    v16[1] = v8;
    v16[2] = &off_1000A0FF0;
    v15[2] = CFSTR("removeFenceSuccess");
    v15[3] = CFSTR("removeFenceError");
    v9 = stringForCKErrorCode(objc_msgSend(v4, "code"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v16[3] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 4));
    AnalyticsSendEvent(CFSTR("com.apple.icloud.fmfd.ReliabilityMetric"), v11);

    v12 = *(_QWORD *)(a1 + 56);
    v13 = CKXPCSuitableError(v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v14);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_removeFence:clientSession:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }

}

void sub_100051F44(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  _QWORD v22[4];
  _QWORD v23[4];
  _QWORD v24[4];

  v3 = a2;
  if (v3)
  {
    v4 = sub_100011D0C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100065E28();

    v23[0] = CFSTR("fenceType");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "type"));
    v24[0] = v6;
    v23[1] = CFSTR("fenceTriggerType");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "trigger"));
    v24[1] = v7;
    v24[2] = &off_1000A0FF0;
    v23[2] = CFSTR("removeFenceSuccess");
    v23[3] = CFSTR("removeFenceError");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "FMFErrorAsString:", objc_msgSend(v3, "code")));
    v24[3] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 4));
    AnalyticsSendEvent(CFSTR("com.apple.icloud.fmfd.ReliabilityMetric"), v9);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v21[0] = CFSTR("fenceType");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "type"));
    v22[0] = v10;
    v21[1] = CFSTR("fenceTriggerType");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "trigger"));
    v22[1] = v11;
    v22[2] = &off_1000A1008;
    v21[2] = CFSTR("removeFenceSuccess");
    v21[3] = CFSTR("removeFenceError");
    v22[3] = CFSTR("None");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 4));
    AnalyticsSendEvent(CFSTR("com.apple.icloud.fmfd.ReliabilityMetric"), v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "fenceManager"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
    objc_msgSend(v13, "clearStaleStatusForRemovedFenceID:", v14);

    if (objc_msgSend(*(id *)(a1 + 32), "isOnMe"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCloudKitManager sharedInstance](FMFCloudKitManager, "sharedInstance"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "ckRecordID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "recordWithID:inScope:", v16, 3));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "recordID"));

    }
    else
    {
      v18 = 0;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "fenceManager"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
    objc_msgSend(v19, "informParticipantOfRemovedFenceWithID:ckRecordID:", v20, v18);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void sub_100052318(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a3;
  v5 = sub_100011D0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_100065E94((uint64_t)v4, a1, v6);

}

void sub_1000524A4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a3;
  if (v4)
  {
    v5 = sub_100011D0C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100065F24((uint64_t)v4, a1, v6);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_100052694(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCloudKitManager sharedInstance](FMFCloudKitManager, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recipients"));
    objc_msgSend(v5, "updateRecord:inZoneSharedWith:inDatabaseWithScope:withCompletion:", v7, v6, 2, *(_QWORD *)(a1 + 40));

  }
}

void sub_1000527DC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;

  v6 = a2;
  if (!v6 || a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v5 = objc_msgSend(objc_alloc((Class)CKRecord), "initWithRecordType:recordID:", CFSTR("Fence"), v6);
    objc_msgSend(v5, "updateFromFence:", *(_QWORD *)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

FMFFence *__cdecl sub_100052978(id a1, FMFFence *a2)
{
  FMFFence *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  FMFFence *v7;

  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFence ckRecordID](v2, "ckRecordID"));
  if (-[FMFFence isFromMe](v2, "isFromMe"))
    v4 = 2;
  else
    v4 = 3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCloudKitManager sharedInstance](FMFCloudKitManager, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordWithID:inScope:", v3, v4));

  if (v6)
    v7 = 0;
  else
    v7 = v2;

  return v7;
}

id sub_100052A10(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "updatedFenceForFence:", a2);
}

void sub_100053214(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;

  v5 = sub_100011D0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (a3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000660B4(a1, v7, v8, v9, v10, v11, v12, v13);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(a1 + 32);
    v15 = 136315394;
    v16 = "-[FMFFenceSequencer removeUnrecoverableManateeFences:withCompletion:]_block_invoke";
    v17 = 2112;
    v18 = v14;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Fence removed successfully due to loss of keychain. Fence: %@, ", (uint8_t *)&v15, 0x16u);
  }

}

void sub_1000533A4(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[4];
  const char *v8;

  v2 = sub_100011D0C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[FMFFenceSequencer handleIdentityLossWithCompletion:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: Completed removal of unrecoverable manatee fences.", buf, 0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCloudKitManager sharedInstance](FMFCloudKitManager, "sharedInstance"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000534B0;
  v5[3] = &unk_100099830;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v4, "removeAllFenceRecordZonesWithCompletion:", v5);

}

void sub_1000534B0(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;

  v3 = a2;
  v4 = sub_100011D0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      v12 = 136315394;
      v13 = "-[FMFFenceSequencer handleIdentityLossWithCompletion:]_block_invoke";
      v14 = 2112;
      v15 = v3;
      v7 = "%s: Completed removal of all record zones with error: %@";
      v8 = v5;
      v9 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v12, v9);
    }
  }
  else if (v6)
  {
    v12 = 136315138;
    v13 = "-[FMFFenceSequencer handleIdentityLossWithCompletion:]_block_invoke";
    v7 = "%s: Successfully ompleted removal of all record zones";
    v8 = v5;
    v9 = 12;
    goto LABEL_6;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCloudKitManager sharedInstance](FMFCloudKitManager, "sharedInstance"));
  objc_msgSend(v10, "bootstrapAccountWithReason:", 3);

  (*(void (**)(_QWORD, id, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v3, v11);
}

void sub_100054490(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

id sub_1000545D8()
{
  uint64_t v0;
  id result;

  v0 = type metadata accessor for Logger(0);
  sub_10006209C(v0, qword_1000B3898);
  sub_100061F8C(v0, (uint64_t)qword_1000B3898);
  result = sub_100011D0C();
  if (result)
    return (id)Logger.init(_:)();
  __break(1u);
  return result;
}

id sub_100054638()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FindMyLocateShims()), "init");
  qword_1000B3FE0 = (uint64_t)result;
  return result;
}

uint64_t *sub_100054664()
{
  if (qword_1000B38B0 != -1)
    swift_once(&qword_1000B38B0, sub_100054638);
  return &qword_1000B3FE0;
}

id sub_1000546A4()
{
  if (qword_1000B38B0 != -1)
    swift_once(&qword_1000B38B0, sub_100054638);
  return (id)qword_1000B3FE0;
}

id sub_100054724()
{
  void *v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unsigned int *v20;
  char v21;
  char *v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t, uint64_t);
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  objc_class *Shims;
  id v32;
  _QWORD *v33;
  id v34;
  uint64_t v35;
  uint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  objc_super v45;

  sub_100056A5C(&qword_1000B3300);
  ((void (*)(void))__chkstk_darwin)();
  v2 = (char *)&v37 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for ClientOrigin(0);
  v4 = *(_QWORD *)(v3 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for RequestOrigin(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  v10 = ((uint64_t (*)(void))__chkstk_darwin)();
  v39 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v38 = (char *)&v37 - v11;
  v12 = (void *)objc_opt_self(NSBundle);
  v40 = v0;
  v13 = objc_msgSend(v12, "mainBundle");
  v14 = objc_msgSend(v13, "bundleIdentifier");

  if (!v14)
    goto LABEL_6;
  v15 = v3;
  v37 = v7;
  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
  v18 = v17;

  v43 = v16;
  v44 = v18;
  v41 = 0xD000000000000013;
  v42 = 0x8000000100090BF0;
  v19 = sub_100061F08();
  if ((StringProtocol.contains<A>(_:)(&v41, &type metadata for String, &type metadata for String, v19, v19) & 1) == 0)
  {
    v43 = v16;
    v44 = v18;
    v41 = 0xD000000000000012;
    v42 = 0x8000000100090C10;
    v21 = StringProtocol.contains<A>(_:)(&v41, &type metadata for String, &type metadata for String, v19, v19);
    swift_bridgeObjectRelease(v18);
    v7 = v37;
    v3 = v15;
    if ((v21 & 1) != 0)
    {
      v20 = (unsigned int *)&enum case for ClientOrigin.messagesApp(_:);
      goto LABEL_7;
    }
LABEL_6:
    v20 = (unsigned int *)&enum case for ClientOrigin.other(_:);
    goto LABEL_7;
  }
  swift_bridgeObjectRelease(v18);
  v20 = (unsigned int *)&enum case for ClientOrigin.messagesApp(_:);
  v7 = v37;
  v3 = v15;
LABEL_7:
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *v20, v3);
  v22 = v38;
  RequestOrigin.init(_:)(v6);
  v23 = type metadata accessor for TaskPriority(0);
  v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56);
  v24(v2, 1, 1, v23);
  v25 = v39;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v39, v22, v7);
  v26 = *(unsigned __int8 *)(v8 + 80);
  v27 = (v26 + 32) & ~v26;
  v28 = swift_allocObject(&unk_10009B578, v27 + v9, v26 | 7);
  *(_QWORD *)(v28 + 16) = 0;
  *(_QWORD *)(v28 + 24) = 0;
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v28 + v27, v25, v7);
  v29 = sub_100054C30((uint64_t)v2, (uint64_t)&unk_1000B3400, v28);
  v30 = v40;
  *(_QWORD *)&v40[OBJC_IVAR____TtC4fmfd17FindMyLocateShims_sessionTask] = v29;

  Shims = (objc_class *)type metadata accessor for FindMyLocateShims();
  v45.receiver = v30;
  v45.super_class = Shims;
  v32 = objc_msgSendSuper2(&v45, "init");
  v24(v2, 1, 1, v23);
  v33 = (_QWORD *)swift_allocObject(&unk_10009B5A0, 40, 7);
  v33[2] = 0;
  v33[3] = 0;
  v33[4] = v32;
  v34 = v32;
  v35 = sub_100054D80((uint64_t)v2, (uint64_t)&unk_1000B3410, (uint64_t)v33);
  swift_release(v35);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v22, v7);
  return v34;
}

uint64_t sub_100054AC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[2] = a1;
  v4[3] = a4;
  v5 = type metadata accessor for RequestOrigin(0);
  v4[4] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[5] = v6;
  v4[6] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100054B20, 0, 0);
}

uint64_t sub_100054B20()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[5] + 16))(v0[6], v0[3], v0[4]);
  v1 = type metadata accessor for Session(0);
  swift_allocObject(v1, *(unsigned int *)(v1 + 48), *(unsigned __int16 *)(v1 + 52));
  v2 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to Session.init(_:) + 1));
  v0[7] = v2;
  *v2 = v0;
  v2[1] = sub_100054B98;
  return Session.init(_:)(v0[6]);
}

uint64_t sub_100054B98(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 56);
  *(_QWORD *)(*(_QWORD *)v1 + 64) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_100054BF4, 0, 0);
}

uint64_t sub_100054BF4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  **(_QWORD **)(v0 + 16) = *(_QWORD *)(v0 + 64);
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100054C30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD v20[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_100062278(a1, &qword_1000B3300);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      v10 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }
  else
  {
    v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v15 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
      goto LABEL_3;
  }
  v12 = 0;
  v14 = 0;
LABEL_6:
  v16 = swift_allocObject(&unk_10009B618, 32, 7);
  *(_QWORD *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a3;
  v17 = type metadata accessor for Session(0);
  if (v14 | v12)
  {
    v20[0] = 0;
    v20[1] = 0;
    v18 = v20;
    v20[2] = v12;
    v20[3] = v14;
  }
  else
  {
    v18 = 0;
  }
  return swift_task_create(v8, v18, v17, &unk_1000B34C0, v16);
}

uint64_t sub_100054D80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD v19[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_100062278(a1, &qword_1000B3300);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      v10 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }
  else
  {
    v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v15 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
      goto LABEL_3;
  }
  v12 = 0;
  v14 = 0;
LABEL_6:
  v16 = swift_allocObject(&unk_10009B640, 32, 7);
  *(_QWORD *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0;
    v19[1] = 0;
    v17 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }
  else
  {
    v17 = 0;
  }
  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_1000B34F8, v16);
}

uint64_t sub_100054ECC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t updated;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4[13] = a4;
  v5 = type metadata accessor for Fence(0);
  v4[14] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[15] = v6;
  v4[16] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  updated = type metadata accessor for Fence.UpdateStream.Snapshot(0);
  v4[17] = updated;
  v8 = *(_QWORD *)(updated - 8);
  v4[18] = v8;
  v4[19] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100056A5C(&qword_1000B3420);
  v4[20] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v9 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Fence.UpdateStream.AsyncIterator(0);
  v4[21] = v10;
  v11 = *(_QWORD *)(v10 - 8);
  v4[22] = v11;
  v4[23] = swift_task_alloc((*(_QWORD *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100054FA0, 0, 0);
}

uint64_t sub_100054FA0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 104) + OBJC_IVAR____TtC4fmfd17FindMyLocateShims_sessionTask);
  v2 = (_QWORD *)swift_task_alloc(async function pointer to Task<>.value.getter[1]);
  *(_QWORD *)(v0 + 192) = v2;
  v3 = type metadata accessor for Session(0);
  *v2 = v0;
  v2[1] = sub_10005501C;
  return Task<>.value.getter(v0 + 64, v1, v3);
}

uint64_t sub_10005501C()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 192));
  return swift_task_switch(sub_100055070, 0, 0);
}

uint64_t sub_100055070()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0[8];
  v0[25] = Session.fenceUpdateStream()();
  v2 = swift_release(v1);
  Fence.UpdateStream.makeAsyncIterator()(v2);
  v3 = sub_100061F4C(&qword_1000B3428, (uint64_t (*)(uint64_t))&type metadata accessor for Fence.UpdateStream.AsyncIterator, (uint64_t)&protocol conformance descriptor for Fence.UpdateStream.AsyncIterator);
  v0[26] = v3;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to dispatch thunk of AsyncIteratorProtocol.next()[1]);
  v0[27] = v4;
  *v4 = v0;
  v4[1] = sub_10005511C;
  return dispatch thunk of AsyncIteratorProtocol.next()(v0[20], v0[21], v3);
}

uint64_t sub_10005511C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)();

  v2 = *v1;
  swift_task_dealloc(*(_QWORD *)(*v1 + 216));
  if (v0)
  {
    *(_QWORD *)(v2 + 232) = v0;
    v3 = sub_100055860;
  }
  else
  {
    *(_QWORD *)(v2 + 224) = 0;
    v3 = sub_100055184;
  }
  return swift_task_switch(v3, 0, 0);
}

uint64_t sub_100055184()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t updated;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void (*v15)(_QWORD, _QWORD, _QWORD);
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint8_t *v28;
  id v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t result;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  void *v51;
  uint64_t j;
  void *v53;
  uint64_t v54;
  id v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  Class isa;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void (*v67)(_QWORD, _QWORD, _QWORD);
  uint64_t *v68;
  uint64_t *v69;
  uint64_t v70;
  id v71[2];

  v1 = *(_QWORD *)(v0 + 160);
  v2 = *(_QWORD *)(v0 + 136);
  v3 = *(_QWORD *)(v0 + 144);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    v4 = *(_QWORD *)(v0 + 200);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 176) + 8))(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 168));
    swift_release(v4);
LABEL_26:
    v46 = *(_QWORD *)(v0 + 152);
    v47 = *(_QWORD *)(v0 + 160);
    v48 = *(_QWORD *)(v0 + 128);
    swift_task_dealloc(*(_QWORD *)(v0 + 184));
    swift_task_dealloc(v47);
    swift_task_dealloc(v46);
    swift_task_dealloc(v48);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 32))(*(_QWORD *)(v0 + 152), v1, v2);
  v5 = objc_msgSend((id)objc_opt_self(FMFSession), "sharedInstance");
  if (!v5)
  {
LABEL_25:
    v41 = *(_QWORD *)(v0 + 176);
    v40 = *(_QWORD *)(v0 + 184);
    v42 = *(_QWORD *)(v0 + 168);
    v44 = *(_QWORD *)(v0 + 144);
    v43 = *(_QWORD *)(v0 + 152);
    v45 = *(_QWORD *)(v0 + 136);
    swift_release(*(_QWORD *)(v0 + 200));
    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v43, v45);
    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v40, v42);
    goto LABEL_26;
  }
  v6 = v5;
  v7 = objc_msgSend(v5, "delegate");
  if (!v7)
  {

    goto LABEL_25;
  }
  v65 = v7;
  updated = Fence.UpdateStream.Snapshot.fences.getter();
  v9 = (uint64_t)_swiftEmptyArrayStorage;
  *(_QWORD *)(v0 + 80) = _swiftEmptyArrayStorage;
  v10 = *(_QWORD *)(updated + 16);
  if (v10)
  {
    v63 = updated;
    v64 = v6;
    v11 = (uint64_t *)(v0 + 80);
    v68 = (uint64_t *)(v0 + 96);
    v12 = *(_QWORD *)(v0 + 120);
    v13 = updated + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
    v14 = *(_QWORD *)(v12 + 72);
    v15 = *(void (**)(_QWORD, _QWORD, _QWORD))(v12 + 16);
    v16 = *(_QWORD *)(v0 + 224);
    v66 = v0 + 104;
    swift_bridgeObjectRetain(updated);
    v69 = (uint64_t *)(v0 + 80);
    v70 = v0;
    v67 = v15;
    do
    {
      v15(*(_QWORD *)(v0 + 128), v13, *(_QWORD *)(v0 + 112));
      v17 = sub_100055928();
      if (v16)
      {
        if (qword_1000B3890 != -1)
          swift_once(&qword_1000B3890, sub_1000545D8);
        v18 = type metadata accessor for Logger(0);
        sub_100061F8C(v18, (uint64_t)qword_1000B3898);
        swift_errorRetain(v16);
        v19 = swift_errorRetain(v16);
        v20 = Logger.logObject.getter(v19);
        v21 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v20, v21))
        {
          v22 = (uint8_t *)swift_slowAlloc(12, -1);
          v23 = (uint64_t *)swift_slowAlloc(8, -1);
          *(_DWORD *)v22 = 138412290;
          swift_errorRetain(v16);
          v24 = v14;
          v25 = _swift_stdlib_bridgeErrorToNSError(v16);
          *v68 = v25;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v68, v66, v22 + 4, v22 + 12);
          *v23 = v25;
          v14 = v24;
          swift_errorRelease(v16);
          swift_errorRelease(v16);
          _os_log_impl((void *)&_mh_execute_header, v20, v21, "Failed to convert to FMFFence: %@", v22, 0xCu);
          v26 = sub_100056A5C(&qword_1000B3498);
          swift_arrayDestroy(v23, 1, v26);
          v27 = v23;
          v11 = v69;
          swift_slowDealloc(v27, -1, -1);
          v28 = v22;
          v15 = v67;
          v0 = v70;
          swift_slowDealloc(v28, -1, -1);
          swift_errorRelease(v16);

        }
        else
        {
          swift_errorRelease(v16);

          swift_errorRelease(v16);
          swift_errorRelease(v16);
        }
        (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 120) + 8))(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 112));
      }
      else
      {
        v29 = v17;
        v30 = (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 120) + 8))(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 112));
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v30);
        v32 = *(_QWORD *)((*(_QWORD *)(v0 + 80) & 0xFFFFFFFFFFFFFF8) + 0x10);
        v31 = *(_QWORD *)((*(_QWORD *)(v0 + 80) & 0xFFFFFFFFFFFFFF8) + 0x18);
        if (v32 >= v31 >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v31 > 1, v32 + 1, 1);
        v33 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v32, v29);
        specialized Array._endMutation()(v33);
      }
      v16 = 0;
      v13 += v14;
      --v10;
    }
    while (v10);
    swift_bridgeObjectRelease(v63);
    updated = v63;
    v9 = *v11;
    v6 = v64;
  }
  v34 = (uint64_t *)(v0 + 88);
  swift_bridgeObjectRelease(updated);
  if ((unint64_t)v9 >> 62)
  {
    if (v9 < 0)
      v62 = v9;
    else
      v62 = v9 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v9);
    v35 = _CocoaArrayWrapper.endIndex.getter(v62);
    swift_bridgeObjectRelease(v9);
  }
  else
  {
    v35 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v36 = sub_100061BA4(0, &qword_1000B33D0, FMFFence_ptr);
  v37 = sub_100061BDC();
  result = Set.init(minimumCapacity:)(v35, v36, v37);
  *v34 = result;
  if ((unint64_t)v9 >> 62)
  {
    if (v9 < 0)
      v49 = v9;
    else
      v49 = v9 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v9);
    v39 = _CocoaArrayWrapper.endIndex.getter(v49);
    result = swift_bridgeObjectRelease(v9);
    if (!v39)
    {
LABEL_38:
      swift_bridgeObjectRelease(v9);
      v54 = *v34;
      v55 = objc_msgSend(v6, "delegateQueue");
      if (v55)
      {
        v56 = v55;
        v57 = swift_allocObject(&unk_10009B5C8, 32, 7);
        *(_QWORD *)(v57 + 16) = v65;
        *(_QWORD *)(v57 + 24) = v54;
        *(_QWORD *)(v0 + 48) = sub_100061FD0;
        *(_QWORD *)(v0 + 56) = v57;
        *(_QWORD *)(v0 + 16) = _NSConcreteStackBlock;
        *(_QWORD *)(v0 + 24) = 1107296256;
        *(_QWORD *)(v0 + 32) = sub_100056920;
        *(_QWORD *)(v0 + 40) = &unk_10009B5E0;
        v58 = _Block_copy((const void *)(v0 + 16));
        v59 = *(_QWORD *)(v0 + 56);
        swift_unknownObjectRetain(v65);
        swift_release(v59);
        objc_msgSend(v56, "addOperationWithBlock:", v58);
        _Block_release(v58);

        swift_unknownObjectRelease(v65);
      }
      else
      {
        if ((objc_msgSend(v65, "respondsToSelector:", "didUpdateFences:") & 1) == 0)
        {

          swift_bridgeObjectRelease(v54);
          swift_unknownObjectRelease(v65);
          goto LABEL_43;
        }
        swift_unknownObjectRetain(v65);
        isa = Set._bridgeToObjectiveC()().super.isa;
        objc_msgSend(v65, "didUpdateFences:", isa);

        swift_bridgeObjectRelease(v54);
        swift_unknownObjectRelease_n(v65, 2);
      }

LABEL_43:
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 144) + 8))(*(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 136));
      v61 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to dispatch thunk of AsyncIteratorProtocol.next()
                                       + 1));
      *(_QWORD *)(v0 + 240) = v61;
      *v61 = v0;
      v61[1] = sub_1000558C0;
      return dispatch thunk of AsyncIteratorProtocol.next()(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 168), *(_QWORD *)(v0 + 208));
    }
  }
  else
  {
    v39 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v39)
      goto LABEL_38;
  }
  if (v39 >= 1)
  {
    if ((v9 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v39; ++i)
      {
        v51 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v9);
        sub_10005D860((Swift::Int *)v71, v51);

      }
    }
    else
    {
      for (j = 0; j != v39; ++j)
      {
        v53 = *(void **)(v9 + 8 * j + 32);
        sub_10005D860((Swift::Int *)v71, v53);

      }
    }
    goto LABEL_38;
  }
  __break(1u);
  return result;
}

uint64_t sub_100055860()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v0 + 72) = *(_QWORD *)(v0 + 232);
  v1 = sub_100056A5C(&qword_1000B3430);
  v2 = swift_dynamicCast(v1, v0 + 72, v1, &type metadata for Never, 7);
  return swift_willThrowTypedImpl(v2, &type metadata for Never, &protocol witness table for Never);
}

uint64_t sub_1000558C0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t (*v3)();

  v2 = *v1;
  swift_task_dealloc(*(_QWORD *)(*v1 + 240));
  if (v0)
  {
    *(_QWORD *)(v2 + 232) = v0;
    v3 = sub_100055860;
  }
  else
  {
    *(_QWORD *)(v2 + 224) = 0;
    v3 = sub_100055184;
  }
  return swift_task_switch(v3, 0, 0);
}

id sub_100055928()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  id v38;
  uint64_t v39;
  uint64_t (*v40)(char *, uint64_t);
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(char *, _QWORD *);
  char *v46;
  _QWORD *v47;
  uint64_t v48;
  void *object;
  NSString v50;
  uint64_t v51;
  uint64_t v52;
  NSString v53;
  void (*v54)(char *, char *, uint64_t);
  int v55;
  uint64_t v56;
  unint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  void (*v61)(char *, uint64_t);
  _BOOL8 v62;
  void (*v63)(char *, uint64_t);
  id v64;
  char *v65;
  uint64_t v66;
  _QWORD *v67;
  void *v68;
  char *v69;
  uint64_t v70;
  id v71;
  char *v72;
  uint64_t v73;
  char *v74;
  void (*v75)(char *, char *, uint64_t);
  uint64_t v76;
  int v77;
  id *v78;
  uint64_t v79;
  char *v80;
  void (*v81)(char *, uint64_t);
  id v82;
  char *v83;
  uint64_t v84;
  void (*v85)(char *, uint64_t);
  uint64_t v86;
  id v87;
  char *v88;
  uint64_t v89;
  double v90;
  double v91;
  double v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  double v96;
  uint64_t v97;
  char *v98;
  id v99;
  Class isa;
  id v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  unint64_t v105;
  unint64_t v106;
  uint64_t v107;
  unint64_t v108;
  uint64_t v109;
  unint64_t v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  unint64_t v114;
  uint64_t v115;
  unint64_t v116;
  char *v117;
  unint64_t v118;
  uint64_t v119;
  unint64_t v120;
  char *v121;
  unint64_t v122;
  uint64_t v123;
  unint64_t v124;
  uint64_t v125;
  NSString v126;
  NSString v127;
  NSString v128;
  NSString v129;
  NSString v130;
  NSString v131;
  id v132;
  uint64_t v133;
  Class v134;
  _QWORD *v135;
  char *v136;
  uint64_t v137;
  int v138;
  char *v139;
  Class v140;
  char *v141;
  uint64_t v142;
  char *v143;
  char v144;
  void (*v145)(char *, uint64_t);
  char *v146;
  uint64_t v147;
  id *v148;
  id v149;
  uint64_t v150;
  uint64_t v151;
  unint64_t v152;
  char *v153;
  char *v154;
  char *v155;
  char *v156;
  uint64_t v157;
  void (*v158)(char *, uint64_t);
  uint64_t v160;
  char *v161;
  char *v162;
  char *v163;
  uint64_t v164;
  uint64_t v165;
  char *v166;
  char *v167;
  char *v168;
  uint64_t v169;
  uint64_t v170;
  char *v171;
  uint64_t v172;
  uint64_t v173;
  char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  char *v178;
  uint64_t v179;
  char *v180;
  char *v181;
  uint64_t v182;
  uint64_t v183;
  char *v184;
  char *v185;
  uint64_t v186;
  _QWORD *v187;
  char *v188;
  _QWORD *v189;
  uint64_t v190;

  v1 = v0;
  v170 = type metadata accessor for Fence.Participant(0);
  v169 = *(_QWORD *)(v170 - 8);
  v2 = __chkstk_darwin(v170);
  v168 = (char *)&v160 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  v167 = (char *)&v160 - v4;
  v5 = sub_100056A5C(&qword_1000B3368);
  __chkstk_darwin(v5);
  v166 = (char *)&v160 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v165 = type metadata accessor for PlaceMark(0);
  v164 = *(_QWORD *)(v165 - 8);
  __chkstk_darwin(v165);
  v171 = (char *)&v160 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Date(0, v8);
  v172 = *(_QWORD *)(v9 - 8);
  v173 = v9;
  __chkstk_darwin(v9);
  v163 = (char *)&v160 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Fence.MonitorRegion.Source(0);
  v176 = *(_QWORD *)(v11 - 8);
  v177 = v11;
  __chkstk_darwin(v11);
  v178 = (char *)&v160 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v179 = type metadata accessor for Fence.MonitorRegion(0);
  v175 = *(_QWORD *)(v179 - 8);
  v13 = __chkstk_darwin(v179);
  v162 = (char *)&v160 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __chkstk_darwin(v13);
  v161 = (char *)&v160 - v16;
  __chkstk_darwin(v15);
  v174 = (char *)&v160 - v17;
  v18 = type metadata accessor for Fence.AcceptanceStatus(0);
  v182 = *(_QWORD *)(v18 - 8);
  v183 = v18;
  v19 = __chkstk_darwin(v18);
  v181 = (char *)&v160 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  v184 = (char *)&v160 - v21;
  v22 = type metadata accessor for Fence.Variant(0);
  v189 = *(_QWORD **)(v22 - 8);
  v190 = v22;
  v23 = __chkstk_darwin(v22);
  v180 = (char *)&v160 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __chkstk_darwin(v23);
  v185 = (char *)&v160 - v26;
  v27 = __chkstk_darwin(v25);
  v188 = (char *)&v160 - v28;
  __chkstk_darwin(v27);
  v30 = (char *)&v160 - v29;
  v187 = (_QWORD *)type metadata accessor for UUID(0);
  v31 = *(v187 - 1);
  __chkstk_darwin(v187);
  v33 = (char *)&v160 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = type metadata accessor for Fence.ID(0);
  v35 = *(_QWORD *)(v34 - 8);
  __chkstk_darwin(v34);
  v37 = (char *)&v160 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = objc_msgSend(objc_allocWithZone((Class)FMFFence), "init");
  v39 = Fence.id.getter();
  Fence.ID.id.getter(v39);
  v40 = *(uint64_t (**)(char *, uint64_t))(v35 + 8);
  v41 = v30;
  v42 = v40(v37, v34);
  UUID.uuidString.getter(v42);
  v44 = v43;
  v45 = *(void (**)(char *, _QWORD *))(v31 + 8);
  v46 = v188;
  v47 = v189;
  v48 = v190;
  v45(v33, v187);
  object = String.lowercased()()._object;
  swift_bridgeObjectRelease(v44);
  v50 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  objc_msgSend(v38, "setIdentifier:", v50);

  Fence.label.getter(objc_msgSend(v38, "setActive:", 1));
  v52 = v51;
  v53 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v52);
  objc_msgSend(v38, "setLabel:", v53);

  ((void (*)(void))Fence.variant.getter)();
  v54 = (void (*)(char *, char *, uint64_t))v47[2];
  v54(v46, v41, v48);
  v55 = ((uint64_t (*)(char *, uint64_t))v47[11])(v46, v48);
  if (v55 != enum case for Fence.Variant.oneTime(_:)
    && v55 != enum case for Fence.Variant.recurring(_:)
    && v55 != enum case for Fence.Variant.scheduled(_:))
  {
    v56 = _s5ErrorOMa(0);
    v57 = sub_100062118();
    swift_allocError(v56, v57, 0, 0);
    v59 = v58;
    v54(v58, v41, v48);
    v60 = swift_storeEnumTagMultiPayload(v59, v56, 4);
    swift_willThrow(v60);
    v61 = (void (*)(char *, uint64_t))v47[1];
    v61(v46, v48);
    v61(v41, v48);
LABEL_56:

    return v38;
  }
  v62 = v55 != enum case for Fence.Variant.oneTime(_:);
  v63 = (void (*)(char *, uint64_t))v47[1];
  v63(v46, v48);
  v63(v41, v48);
  v64 = objc_msgSend(v38, "setRecurring:", v62);
  v65 = v185;
  Fence.variant.getter(v64);
  v66 = v186;
  v67 = sub_10005B970();
  if (v66)
  {
    v63(v65, v48);
    goto LABEL_56;
  }
  v68 = v67;
  v63(v65, v48);
  objc_msgSend(v38, "setTrigger:", v68);

  v69 = v180;
  Fence.variant.getter(v70);
  v71 = sub_10005BC54();
  v63(v69, v48);
  objc_msgSend(v38, "setSchedule:", v71);

  v72 = v184;
  Fence.acceptanceStatus.getter();
  v74 = v181;
  v73 = v182;
  v75 = *(void (**)(char *, char *, uint64_t))(v182 + 16);
  v76 = v183;
  v75(v181, v72, v183);
  v77 = (*(uint64_t (**)(char *, uint64_t))(v73 + 88))(v74, v76);
  if (v77 == enum case for Fence.AcceptanceStatus.pendingHidden(_:))
  {
    v78 = (id *)&FMFFenceAcceptanceStatusPendingHidden;
LABEL_11:
    v80 = v178;
    v79 = v179;
    goto LABEL_12;
  }
  if (v77 == enum case for Fence.AcceptanceStatus.pending(_:))
  {
    v78 = (id *)&FMFFenceAcceptanceStatusPending;
    goto LABEL_11;
  }
  v80 = v178;
  v79 = v179;
  if (v77 != enum case for Fence.AcceptanceStatus.accepted(_:))
  {
    v150 = v73;
    v151 = _s5ErrorOMa(0);
    v152 = sub_100062118();
    swift_allocError(v151, v152, 0, 0);
    v153 = v74;
    v155 = v154;
    v156 = v184;
    v75(v154, v184, v76);
    v157 = swift_storeEnumTagMultiPayload(v155, v151, 5);
    swift_willThrow(v157);
    v158 = *(void (**)(char *, uint64_t))(v150 + 8);
    v158(v153, v76);
    v158(v156, v76);
    goto LABEL_56;
  }
  v78 = (id *)&FMFFenceAcceptanceStatusAccepted;
LABEL_12:
  v81 = *(void (**)(char *, uint64_t))(v73 + 8);
  v82 = *v78;
  v81(v184, v76);
  objc_msgSend(v38, "setAcceptanceStatus:", v82);

  v83 = v174;
  v84 = ((uint64_t (*)(void))Fence.region.getter)();
  Fence.MonitorRegion.source.getter(v84);
  v85 = *(void (**)(char *, uint64_t))(v175 + 8);
  v85(v83, v79);
  v86 = sub_10005BFC4();
  v188 = 0;
  (*(void (**)(char *, uint64_t))(v176 + 8))(v80, v177);
  v87 = objc_msgSend(v38, "setLocationType:", v86);
  v88 = v161;
  v89 = Fence.region.getter(v87);
  v90 = Fence.MonitorRegion.center.getter(v89);
  v92 = v91;
  v93 = ((uint64_t (*)(char *, uint64_t))v85)(v88, v79);
  v94 = v162;
  v95 = Fence.region.getter(v93);
  v96 = Fence.MonitorRegion.radius.getter(v95);
  v97 = ((uint64_t (*)(char *, uint64_t))v85)(v94, v79);
  v98 = v163;
  static Date.now.getter(v97);
  v99 = objc_allocWithZone((Class)CLLocation);
  isa = Date._bridgeToObjectiveC()().super.isa;
  v101 = objc_msgSend(v99, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", isa, v90, v92, 0.0, v96, -1.0);

  v181 = *(char **)(v172 + 8);
  ((void (*)(char *, uint64_t))v181)(v98, v173);
  v189 = v38;
  objc_msgSend(v38, "setLocation:", v101);

  v190 = v1;
  v102 = Fence.placemark.getter();
  v103 = PlaceMark.locality.getter(v102);
  v105 = 0xE000000000000000;
  if (v104)
    v106 = v104;
  else
    v106 = 0xE000000000000000;
  v107 = PlaceMark.administrativeArea.getter(v103);
  if (v108)
    v109 = v107;
  else
    v109 = 0;
  v182 = v109;
  if (v108)
    v110 = v108;
  else
    v110 = 0xE000000000000000;
  v111 = PlaceMark.country.getter(v107);
  if (v112)
    v113 = v111;
  else
    v113 = 0;
  v183 = v113;
  if (v112)
    v114 = v112;
  else
    v114 = 0xE000000000000000;
  v115 = PlaceMark.stateCode.getter(v111);
  if (v116)
    v117 = (char *)v115;
  else
    v117 = 0;
  v184 = v117;
  if (v116)
    v118 = v116;
  else
    v118 = 0xE000000000000000;
  v119 = PlaceMark.streetAddress.getter(v115);
  if (v120)
    v121 = (char *)v119;
  else
    v121 = 0;
  v185 = v121;
  if (v120)
    v122 = v120;
  else
    v122 = 0xE000000000000000;
  v123 = PlaceMark.streetName.getter(v119);
  if (v124)
    v125 = v123;
  else
    v125 = 0;
  v186 = v125;
  if (v124)
    v105 = v124;
  v187 = objc_allocWithZone((Class)FMFPlacemark);
  v126 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v106);
  v127 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v110);
  v128 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v114);
  v129 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v118);
  v130 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v122);
  v131 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v105);
  v132 = objc_msgSend(v187, "initWithLocality:administrativeArea:country:state:streetAddress:streetName:", v126, v127, v128, v129, v130, v131);

  v133 = PlaceMark.formattedAddressLines.getter();
  v134 = (Class)v133;
  if (v133)
  {
    v135 = sub_10005C8EC(v133);
    swift_bridgeObjectRelease(v134);
    v134 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v135);
  }
  v136 = v166;
  objc_msgSend(v132, "setFormattedAddressLines:", v134);

  (*(void (**)(char *, uint64_t))(v164 + 8))(v171, v165);
  v38 = v189;
  objc_msgSend(v189, "setPlacemark:", v132);

  Fence.muteEndDate.getter();
  v137 = v173;
  v138 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v172 + 48))(v136, 1, v173);
  v139 = v188;
  if (v138 == 1)
  {
    v140 = 0;
  }
  else
  {
    v140 = Date._bridgeToObjectiveC()().super.isa;
    ((void (*)(char *, uint64_t))v181)(v136, v137);
  }
  objc_msgSend(v38, "setMuteEndDate:", v140);

  v141 = v167;
  v142 = Fence.finder.getter();
  v143 = v168;
  Fence.createdBy.getter(v142);
  v144 = static Fence.Participant.== infix(_:_:)(v141, v143);
  v145 = *(void (**)(char *, uint64_t))(v169 + 8);
  v146 = v143;
  v147 = v170;
  v145(v146, v170);
  v145(v141, v147);
  v148 = (id *)&FMFFenceTypeNotifyMe;
  if ((v144 & 1) == 0)
    v148 = (id *)&FMFFenceTypeNotifyOther;
  v149 = *v148;
  objc_msgSend(v38, "setType:", v149);

  sub_10005C1A4(v38);
  if (v139)
    goto LABEL_56;
  return v38;
}

id sub_1000565A4(uint64_t a1)
{
  uint64_t v1;
  id result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSString v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  result = &_swiftEmptyArrayStorage;
  v4 = *(_QWORD *)(a1 + 16);
  if (v4)
  {
    v23 = v1;
    v5 = *(_QWORD *)(type metadata accessor for PersonHandle(0) - 8);
    v6 = a1 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    v24 = a1;
    swift_bridgeObjectRetain(a1);
    v7 = (void *)objc_opt_self(FMFDataManager);
    v8 = *(_QWORD *)(v5 + 72);
    while (1)
    {
      result = objc_msgSend(v7, "sharedInstance", v23);
      if (!result)
        break;
      v9 = result;
      PersonHandle.id.getter();
      v11 = v10;
      v12 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v11);
      v13 = objc_msgSend(v9, "followerHandleForIdentifier:", v12);

      if (!v13)
      {
        v17 = _s5ErrorOMa(0);
        v18 = sub_100062118();
        swift_allocError(v17, v18, 0, 0);
        v20 = v19;
        *v19 = PersonHandle.id.getter();
        v20[1] = v21;
        v22 = swift_storeEnumTagMultiPayload(v20, v17, 7);
        swift_willThrow(v22);
        swift_bridgeObjectRelease(v24);
        return (id)swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
      }
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      v15 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
      v14 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (v15 >= v14 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v14 > 1, v15 + 1, 1);
      v16 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v15, v13);
      specialized Array._endMutation()(v16);
      v6 += v8;
      if (!--v4)
      {
        swift_bridgeObjectRelease(v24);
        return &_swiftEmptyArrayStorage;
      }
    }
    __break(1u);
  }
  return result;
}

char *sub_100056784(uint64_t a1, SEL *a2)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t v17;

  if ((unint64_t)a1 >> 62)
    goto LABEL_17;
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  for (; v3; v3 = _CocoaArrayWrapper.endIndex.getter(v17))
  {
    v4 = (char *)&_swiftEmptyArrayStorage;
    v5 = 4;
    while (1)
    {
      v6 = (a1 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5 - 4, a1)
         : *(id *)(a1 + 8 * v5);
      v7 = v6;
      v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1))
        break;
      v9 = objc_msgSend(v6, *a2);
      if (v9)
      {
        v10 = v9;
        v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
        v13 = v12;

        if ((swift_isUniquelyReferenced_nonNull_native(v4) & 1) == 0)
          v4 = sub_10005CF0C(0, *((_QWORD *)v4 + 2) + 1, 1, v4);
        v15 = *((_QWORD *)v4 + 2);
        v14 = *((_QWORD *)v4 + 3);
        if (v15 >= v14 >> 1)
          v4 = sub_10005CF0C((char *)(v14 > 1), v15 + 1, 1, v4);
        *((_QWORD *)v4 + 2) = v15 + 1;
        v16 = &v4[16 * v15];
        *((_QWORD *)v16 + 4) = v11;
        *((_QWORD *)v16 + 5) = v13;
      }
      else
      {

      }
      ++v5;
      if (v8 == v3)
        goto LABEL_22;
    }
    __break(1u);
LABEL_17:
    if (a1 < 0)
      v17 = a1;
    else
      v17 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
  }
  v4 = (char *)&_swiftEmptyArrayStorage;
LABEL_22:
  swift_bridgeObjectRelease(a1);
  return v4;
}

uint64_t sub_100056920(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

uint64_t sub_10005697C(void *a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v16;

  v7 = sub_100056A5C(&qword_1000B3300);
  __chkstk_darwin(v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_10009B128, 64, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = v3;
  v11[5] = a1;
  v11[6] = a2;
  v11[7] = a3;
  v12 = v3;
  v13 = a1;
  swift_retain(a3);
  v14 = sub_100054D80((uint64_t)v9, (uint64_t)&unk_1000B3310, (uint64_t)v11);
  return swift_release(v14);
}

uint64_t sub_100056A5C(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_100056A9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7[5] = a6;
  v7[6] = a7;
  v7[3] = a4;
  v7[4] = a5;
  v8 = type metadata accessor for Fence(0);
  v7[7] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v7[8] = v9;
  v10 = (*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v7[9] = swift_task_alloc(v10);
  v7[10] = swift_task_alloc(v10);
  return swift_task_switch(sub_100056B10, 0, 0);
}

uint64_t sub_100056B10()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 24) + OBJC_IVAR____TtC4fmfd17FindMyLocateShims_sessionTask);
  v2 = (_QWORD *)swift_task_alloc(async function pointer to Task<>.value.getter[1]);
  *(_QWORD *)(v0 + 88) = v2;
  v3 = type metadata accessor for Session(0);
  *v2 = v0;
  v2[1] = sub_100056B8C;
  return Task<>.value.getter(v0 + 16, v1, v3);
}

uint64_t sub_100056B8C()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 88));
  return swift_task_switch(sub_100056BE0, 0, 0);
}

uint64_t sub_100056BE0()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  _QWORD *v3;

  v1 = v0[9];
  v2 = (void *)v0[4];
  v0[12] = v0[2];
  sub_100056EF0(v2, v1);
  v3 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to Session.addFence(_:) + 1));
  v0[13] = v3;
  *v3 = v0;
  v3[1] = sub_100056CC0;
  return Session.addFence(_:)(v0[10], v0[9]);
}

uint64_t sub_100056CC0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t (*v8)();

  v2 = *(_QWORD **)v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 104);
  *(_QWORD *)(*(_QWORD *)v1 + 112) = v0;
  swift_task_dealloc(v3);
  v4 = v2[12];
  v5 = v2[9];
  v6 = v2[7];
  v7 = *(void (**)(uint64_t, uint64_t))(v2[8] + 8);
  if (v0)
  {
    v7(v5, v6);
    swift_release(v4);
    v8 = sub_100056E1C;
  }
  else
  {
    v2[15] = v7;
    v7(v5, v6);
    swift_release(v4);
    v8 = sub_100056D58;
  }
  return swift_task_switch(v8, 0, 0);
}

uint64_t sub_100056D58()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  void (*v6)(_QWORD, void *);
  void *v7;
  void *v8;
  uint64_t v9;

  v1 = *(_QWORD *)(v0 + 112);
  v2 = sub_100055928();
  v3 = *(void (**)(uint64_t, uint64_t))(v0 + 120);
  v4 = *(_QWORD *)(v0 + 80);
  v5 = *(_QWORD *)(v0 + 56);
  if (v1)
  {
    v3(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 56));
    v6 = *(void (**)(_QWORD, void *))(v0 + 40);
    v7 = (void *)_convertErrorToNSError(_:)(v1);
    v6(0, v7);

    swift_errorRelease(v1);
  }
  else
  {
    v8 = v2;
    (*(void (**)(id, _QWORD))(v0 + 40))(v2, 0);

    v3(v4, v5);
  }
  v9 = *(_QWORD *)(v0 + 72);
  swift_task_dealloc(*(_QWORD *)(v0 + 80));
  swift_task_dealloc(v9);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100056E1C()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(_QWORD, void *);
  void *v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 112);
  v2 = *(void (**)(_QWORD, void *))(v0 + 40);
  v3 = (void *)_convertErrorToNSError(_:)(v1);
  v2(0, v3);

  swift_errorRelease(v1);
  v4 = *(_QWORD *)(v0 + 72);
  swift_task_dealloc(*(_QWORD *)(v0 + 80));
  swift_task_dealloc(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100056E8C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = v0[4];
  v3 = v0[5];
  v5 = v0[6];
  v4 = v0[7];
  v6 = (_QWORD *)swift_task_alloc(dword_1000B330C);
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_1000630F0;
  return sub_100056A9C((uint64_t)v6, v7, v8, v2, v3, v5, v4);
}

void sub_100056EF0(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  unsigned int v40;
  void (*v41)(char *, uint64_t, uint64_t);
  unsigned int v42;
  uint64_t v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  void **v48;
  void (*v49)(char *, uint64_t);
  uint64_t v50;
  unint64_t v51;
  uint64_t *v52;
  uint64_t *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unsigned int *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void **v80;
  void (*v81)(char *, uint64_t);
  uint64_t v82;
  char *v83;
  uint64_t v84;
  char v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char v90;
  uint64_t v91;
  unint64_t v92;
  _QWORD *v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  id v97;
  uint64_t v98;
  unint64_t v99;
  _QWORD *v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  void **v105;
  id v106;
  double v107;
  double v108;
  double v109;
  double v110;
  id v111;
  double v112;
  double v113;
  char *v114;
  char *v115;
  id v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  char *v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  unint64_t v127;
  char *v128;
  id v129;
  uint64_t v130;
  id v131;
  uint64_t v132;
  id v133;
  uint64_t v134;
  id v135;
  uint64_t v136;
  id v137;
  uint64_t v138;
  uint64_t v139;
  id v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void **v144;
  unint64_t *v145;
  id v146;
  uint64_t v147;
  unint64_t v148;
  unint64_t v149;
  char *v150;
  id v151;
  uint64_t v152;
  char *v153;
  void (*v154)(char *, char *, uint64_t);
  char *v155;
  uint64_t v156;
  char *v157;
  id v158;
  uint64_t v159;
  void *v160;
  char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  char *v174;
  uint64_t v175;
  char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  char *v181;
  char *v182;
  char *v183;
  char *v184;
  char *v185;
  char *v186;
  char *v187;
  char *v188;
  uint64_t v189;
  uint64_t v190;
  char *v191;
  char *v192;
  char *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  char *v197;
  char *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  char *v204;
  void **v205;
  char v206[8];
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;

  v4 = sub_100056A5C(&qword_1000B3368);
  __chkstk_darwin(v4);
  v181 = (char *)&v165 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v190 = type metadata accessor for Fence.ID(0);
  v189 = *(_QWORD *)(v190 - 8);
  v6 = __chkstk_darwin(v190);
  v188 = (char *)&v165 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v191 = (char *)&v165 - v8;
  v9 = type metadata accessor for PlaceMark(0);
  v195 = *(_QWORD *)(v9 - 8);
  v10 = __chkstk_darwin(v9);
  v182 = (char *)&v165 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v193 = (char *)&v165 - v12;
  v196 = type metadata accessor for Fence.MonitorRegion(0);
  v194 = *(_QWORD *)(v196 - 8);
  v13 = __chkstk_darwin(v196);
  v187 = (char *)&v165 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v197 = (char *)&v165 - v15;
  v16 = type metadata accessor for Fence.MonitorRegion.Source(0);
  v199 = *(_QWORD *)(v16 - 8);
  v200 = v16;
  v17 = __chkstk_darwin(v16);
  v192 = (char *)&v165 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  v198 = (char *)&v165 - v19;
  v20 = type metadata accessor for Fence.AcceptanceStatus(0);
  v203 = *(_QWORD *)(v20 - 8);
  v21 = __chkstk_darwin(v20);
  v186 = (char *)&v165 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  v204 = (char *)&v165 - v23;
  v24 = type metadata accessor for Fence.Variant(0);
  v201 = *(_QWORD *)(v24 - 8);
  v202 = v24;
  v25 = __chkstk_darwin(v24);
  v185 = (char *)&v165 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v25);
  v28 = (char *)&v165 - v27;
  v29 = type metadata accessor for Fence.Participant(0);
  v30 = *(_QWORD *)(v29 - 8);
  v31 = __chkstk_darwin(v29);
  v184 = (char *)&v165 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __chkstk_darwin(v31);
  v183 = (char *)&v165 - v34;
  v35 = __chkstk_darwin(v33);
  v37 = (char *)&v165 - v36;
  __chkstk_darwin(v35);
  v39 = (char *)&v165 - v38;
  if (!objc_msgSend(a1, "isActive"))
  {
    v50 = _s5ErrorOMa(0);
    v51 = sub_100062118();
    swift_allocError(v50, v51, 0, 0);
    v53 = v52;
    v54 = objc_msgSend(a1, "identifier");
    v55 = static String._unconditionallyBridgeFromObjectiveC(_:)(v54);
    v57 = v56;

    *v53 = v55;
    v53[1] = v57;
    v58 = swift_storeEnumTagMultiPayload(v53, v50, 9);
    swift_willThrow(v58);

    return;
  }
  v180 = v20;
  v178 = a2;
  v179 = v9;
  v40 = objc_msgSend(a1, "isFromMe");
  v41 = *(void (**)(char *, uint64_t, uint64_t))(v30 + 104);
  v42 = enum case for Fence.Participant.me(_:);
  v43 = v30;
  v44 = enum case for Fence.Participant.other(_:);
  if (v40)
    v45 = enum case for Fence.Participant.me(_:);
  else
    v45 = enum case for Fence.Participant.other(_:);
  v41(v39, v45, v29);
  if (objc_msgSend(a1, "isOnMe"))
    v46 = v44;
  else
    v46 = v42;
  v41(v37, v46, v29);
  v47 = a1;
  v48 = v205;
  sub_10005B0DC(v47, (uint64_t)v28);
  if (v48)
  {

    v49 = *(void (**)(char *, uint64_t))(v43 + 8);
    v49(v37, v29);
    v49(v39, v29);
    return;
  }
  v174 = v28;
  v175 = v29;
  v176 = v37;
  v177 = v43;
  v205 = (void **)v47;
  v59 = objc_msgSend(v47, "acceptanceStatus");
  v60 = static String._unconditionallyBridgeFromObjectiveC(_:)(v59);
  v62 = v61;
  swift_bridgeObjectRelease(v61);
  v63 = HIBYTE(v62) & 0xF;
  if ((v62 & 0x2000000000000000) == 0)
    v63 = v60 & 0xFFFFFFFFFFFFLL;
  if (!v63)
  {
    v71 = (unsigned int *)&enum case for Fence.AcceptanceStatus.pendingHidden(_:);
    v73 = v180;
    v72 = 0;
    v74 = v203;
LABEL_26:
    v80 = v205;

    (*(void (**)(char *, _QWORD, uint64_t))(v74 + 104))(v204, *v71, v73);
    goto LABEL_37;
  }
  v64 = v39;
  v65 = static String._unconditionallyBridgeFromObjectiveC(_:)(FMFFenceAcceptanceStatusPendingHidden);
  v67 = v66;
  v69 = static String._unconditionallyBridgeFromObjectiveC(_:)(v59);
  v70 = v68;
  if (v65 == v69 && v67 == v68)
  {
    v71 = (unsigned int *)&enum case for Fence.AcceptanceStatus.pendingHidden(_:);
    v39 = v64;
    v72 = 0;
LABEL_23:
    v74 = v203;
LABEL_24:
    swift_bridgeObjectRelease_n(v67, 2, v69);
LABEL_25:
    v73 = v180;
    goto LABEL_26;
  }
  v75 = _stringCompareWithSmolCheck(_:_:expecting:)(v65, v67, v69, v68, 0);
  swift_bridgeObjectRelease(v70);
  swift_bridgeObjectRelease(v67);
  v72 = 0;
  if ((v75 & 1) != 0)
  {
    v71 = (unsigned int *)&enum case for Fence.AcceptanceStatus.pendingHidden(_:);
    v39 = v64;
    v73 = v180;
    v74 = v203;
    goto LABEL_26;
  }
  v76 = static String._unconditionallyBridgeFromObjectiveC(_:)(FMFFenceAcceptanceStatusPending);
  v67 = v77;
  v69 = static String._unconditionallyBridgeFromObjectiveC(_:)(v59);
  v79 = v78;
  if (v76 == v69 && v67 == v78)
  {
    v71 = (unsigned int *)&enum case for Fence.AcceptanceStatus.pending(_:);
    v39 = v64;
    goto LABEL_23;
  }
  v85 = _stringCompareWithSmolCheck(_:_:expecting:)(v76, v67, v69, v78, 0);
  swift_bridgeObjectRelease(v79);
  swift_bridgeObjectRelease(v67);
  v74 = v203;
  if ((v85 & 1) != 0)
  {
    v71 = (unsigned int *)&enum case for Fence.AcceptanceStatus.pending(_:);
    v39 = v64;
    goto LABEL_25;
  }
  v86 = static String._unconditionallyBridgeFromObjectiveC(_:)(FMFFenceAcceptanceStatusAccepted);
  v67 = v87;
  v69 = static String._unconditionallyBridgeFromObjectiveC(_:)(v59);
  v89 = v88;
  if (v86 == v69 && v67 == v88)
  {
    v71 = (unsigned int *)&enum case for Fence.AcceptanceStatus.accepted(_:);
    v39 = v64;
    goto LABEL_24;
  }
  v90 = _stringCompareWithSmolCheck(_:_:expecting:)(v86, v67, v69, v88, 0);
  swift_bridgeObjectRelease(v89);
  swift_bridgeObjectRelease(v67);
  if ((v90 & 1) != 0)
  {
    v71 = (unsigned int *)&enum case for Fence.AcceptanceStatus.accepted(_:);
    v39 = v64;
    goto LABEL_25;
  }
  v91 = _s5ErrorOMa(0);
  v92 = sub_100062118();
  v72 = swift_allocError(v91, v92, 0, 0);
  *v93 = v59;
  v94 = swift_storeEnumTagMultiPayload(v93, v91, 1);
  swift_willThrow(v94);
  v39 = v64;
  v95 = v177;
  v73 = v180;
  v80 = v205;
  if (!v72)
  {
LABEL_37:
    v96 = objc_msgSend(v80, "locationType");
    v97 = v96;
    if ((unint64_t)v96 >= 8)
    {
      v98 = _s5ErrorOMa(0);
      v99 = sub_100062118();
      v72 = swift_allocError(v98, v99, 0, 0);
      *v100 = v97;
      v101 = swift_storeEnumTagMultiPayload(v100, v98, 2);
      swift_willThrow(v101);
    }
    else
    {
      (*(void (**)(char *, _QWORD, uint64_t))(v199 + 104))(v198, *(unsigned int *)*(&off_10009B6C8 + (_QWORD)v96), v200);
    }
    v102 = v176;
    v103 = v175;
    v104 = v177;
    v105 = v205;
    if (v72)
    {

      (*(void (**)(char *, uint64_t))(v74 + 8))(v204, v73);
      (*(void (**)(char *, uint64_t))(v201 + 8))(v174, v202);
      v81 = *(void (**)(char *, uint64_t))(v104 + 8);
      v81(v102, v103);
      v83 = v39;
      v84 = v103;
      goto LABEL_42;
    }
    v166 = v39;
    v106 = objc_msgSend(v205, "location");
    objc_msgSend(v106, "coordinate");
    v108 = v107;
    v110 = v109;

    v111 = objc_msgSend(v105, "location");
    objc_msgSend(v111, "horizontalAccuracy");
    v113 = v112;

    v114 = v192;
    (*(void (**)(char *, char *, uint64_t))(v199 + 16))(v192, v198, v200);
    Fence.MonitorRegion.init(center:radius:source:)(v114, v108, v110, v113);
    v115 = (char *)objc_msgSend(v105, "placemark");
    v116 = objc_msgSend(v115, "formattedAddressLines");
    if (v116)
    {
      v117 = v116;
      v118 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v116, (char *)&type metadata for Any + 8);

      v119 = *(_QWORD *)(v118 + 16);
      if (v119)
      {
        v192 = v115;
        v120 = v118 + 32;
        v173 = v118;
        swift_bridgeObjectRetain(v118);
        v121 = (char *)&_swiftEmptyArrayStorage;
        do
        {
          sub_1000622D4(v120, (uint64_t)&v209);
          sub_1000622D4((uint64_t)&v209, (uint64_t)v206);
          if ((swift_dynamicCast(&v207, v206, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) == 0)
          {
            v207 = 0;
            v208 = 0;
          }
          sub_1000622B4(&v209);
          v124 = v208;
          if (v208)
          {
            v125 = v207;
            if ((swift_isUniquelyReferenced_nonNull_native(v121) & 1) == 0)
              v121 = sub_10005CF0C(0, *((_QWORD *)v121 + 2) + 1, 1, v121);
            v127 = *((_QWORD *)v121 + 2);
            v126 = *((_QWORD *)v121 + 3);
            if (v127 >= v126 >> 1)
              v121 = sub_10005CF0C((char *)(v126 > 1), v127 + 1, 1, v121);
            *((_QWORD *)v121 + 2) = v127 + 1;
            v122 = &v121[16 * v127];
            *((_QWORD *)v122 + 4) = v125;
            *((_QWORD *)v122 + 5) = v124;
            v73 = v180;
          }
          v120 += 32;
          --v119;
        }
        while (v119);
        swift_bridgeObjectRelease_n(v173, 2, v123);
        v115 = v192;
        goto LABEL_58;
      }
      swift_bridgeObjectRelease(v118);
    }
    v121 = (char *)&_swiftEmptyArrayStorage;
LABEL_58:
    v128 = v193;
    v129 = objc_msgSend(v115, "locality");
    v192 = (char *)static String._unconditionallyBridgeFromObjectiveC(_:)(v129);
    v180 = v130;

    v131 = objc_msgSend(v115, "administrativeArea");
    v173 = static String._unconditionallyBridgeFromObjectiveC(_:)(v131);
    v172 = v132;

    v133 = objc_msgSend(v115, "country");
    v171 = static String._unconditionallyBridgeFromObjectiveC(_:)(v133);
    v170 = v134;

    v135 = objc_msgSend(v115, "state");
    v169 = static String._unconditionallyBridgeFromObjectiveC(_:)(v135);
    v168 = v136;

    v137 = objc_msgSend(v115, "streetAddress");
    v167 = static String._unconditionallyBridgeFromObjectiveC(_:)(v137);
    v139 = v138;

    v140 = objc_msgSend(v115, "streetName");
    v141 = static String._unconditionallyBridgeFromObjectiveC(_:)(v140);
    v143 = v142;

    PlaceMark.init(locality:administrativeArea:country:state:streetAddress:streetName:formattedAddress:coarseAddress:poiAddress:smallAddress:mediumAddress:largeAddress:)(v192, v180, v173, v172, v171, v170, v169, v168, v167, v139, v141, v143, v121, 0, 0, 0, 0, 0, 0,
      0,
      0,
      0,
      0);

    v144 = v205;
    v145 = sub_10005FF74(v205);
    v146 = objc_msgSend(v144, "identifier");
    v147 = static String._unconditionallyBridgeFromObjectiveC(_:)(v146);
    v149 = v148;

    v150 = v191;
    sub_10005B79C(v147, v149);
    (*(void (**)(char *, char *, uint64_t))(v189 + 16))(v188, v150, v190);
    v151 = objc_msgSend(v144, "label");
    v152 = static String._unconditionallyBridgeFromObjectiveC(_:)(v151);
    v192 = v153;

    v154 = *(void (**)(char *, char *, uint64_t))(v177 + 16);
    v39 = v166;
    v155 = v128;
    v156 = v175;
    v154(v183, v166, v175);
    v154(v184, v176, v156);
    (*(void (**)(char *, char *, uint64_t))(v201 + 16))(v185, v174, v202);
    (*(void (**)(char *, char *, uint64_t))(v203 + 16))(v186, v204, v73);
    (*(void (**)(char *, char *, uint64_t))(v194 + 16))(v187, v197, v196);
    v157 = v182;
    (*(void (**)(char *, char *, uint64_t))(v195 + 16))(v182, v155, v179);
    v158 = objc_msgSend(v144, "muteEndDate");
    if (v158)
    {
      v160 = v158;
      v161 = v181;
      static Date._unconditionallyBridgeFromObjectiveC(_:)(v158);

      v163 = type metadata accessor for Date(0, v162);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v163 - 8) + 56))(v161, 0, 1, v163);
    }
    else
    {
      v164 = type metadata accessor for Date(0, v159);
      v161 = v181;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v164 - 8) + 56))(v181, 1, 1, v164);
    }
    Fence.init(id:label:createdBy:finder:variant:acceptanceStatus:region:placemark:others:muteEndDate:)(v188, v152, v192, v183, v184, v185, v186, v187, v157, v145, v161);

    (*(void (**)(char *, uint64_t))(v189 + 8))(v191, v190);
    (*(void (**)(char *, uint64_t))(v195 + 8))(v193, v179);
    (*(void (**)(char *, uint64_t))(v194 + 8))(v197, v196);
    (*(void (**)(char *, uint64_t))(v199 + 8))(v198, v200);
    (*(void (**)(char *, uint64_t))(v203 + 8))(v204, v73);
    (*(void (**)(char *, uint64_t))(v201 + 8))(v174, v202);
    v81 = *(void (**)(char *, uint64_t))(v177 + 8);
    goto LABEL_28;
  }

  (*(void (**)(char *, uint64_t))(v201 + 8))(v174, v202);
  v81 = *(void (**)(char *, uint64_t))(v95 + 8);
LABEL_28:
  v82 = v175;
  v81(v176, v175);
  v83 = v39;
  v84 = v82;
LABEL_42:
  v81(v83, v84);
}

uint64_t sub_100058098(void *a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v16;

  v7 = sub_100056A5C(&qword_1000B3300);
  __chkstk_darwin(v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_10009B150, 64, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = a1;
  v11[5] = a2;
  v11[6] = a3;
  v11[7] = v3;
  v12 = a1;
  swift_retain(a3);
  v13 = v3;
  v14 = sub_100054D80((uint64_t)v9, (uint64_t)&unk_1000B3320, (uint64_t)v11);
  return swift_release(v14);
}

uint64_t sub_100058178(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v7[5] = a6;
  v7[6] = a7;
  v7[3] = a4;
  v7[4] = a5;
  v8 = type metadata accessor for Fence.ID(0);
  v7[7] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v7[8] = v9;
  v7[9] = swift_task_alloc((*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100056A5C(&qword_1000B3350);
  v7[10] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v10 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for UUID(0);
  v7[11] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v7[12] = v12;
  v13 = (*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v7[13] = swift_task_alloc(v13);
  v7[14] = swift_task_alloc(v13);
  return swift_task_switch(sub_100058238, 0, 0);
}

uint64_t sub_100058238()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void);
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;

  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 80);
  v4 = objc_msgSend(*(id *)(v0 + 24), "identifier");
  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  v7 = v6;

  UUID.init(uuidString:)(v5, v7);
  swift_bridgeObjectRelease(v7);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    v8 = *(void (**)(void))(v0 + 32);
    v9 = *(void **)(v0 + 24);
    sub_100062278(*(_QWORD *)(v0 + 80), &qword_1000B3350);
    v10 = objc_msgSend(v9, "identifier");
    v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
    v13 = v12;

    v14 = sub_10005F11C();
    v15 = swift_allocError(&type metadata for FindMyLocateShims.Error, v14, 0, 0);
    *(_QWORD *)v16 = v11;
    *(_QWORD *)(v16 + 8) = v13;
    *(_BYTE *)(v16 + 16) = 0;
    v17 = (void *)_convertErrorToNSError(_:)(v15);
    v8();

    swift_errorRelease(v15);
    v18 = *(_QWORD *)(v0 + 104);
    v20 = *(_QWORD *)(v0 + 72);
    v19 = *(_QWORD *)(v0 + 80);
    swift_task_dealloc(*(_QWORD *)(v0 + 112));
    swift_task_dealloc(v18);
    swift_task_dealloc(v19);
    swift_task_dealloc(v20);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v22 = *(_QWORD *)(v0 + 48);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 96) + 32))(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 88));
    v23 = *(_QWORD *)(v22 + OBJC_IVAR____TtC4fmfd17FindMyLocateShims_sessionTask);
    v24 = (_QWORD *)swift_task_alloc(async function pointer to Task<>.value.getter[1]);
    *(_QWORD *)(v0 + 120) = v24;
    v25 = type metadata accessor for Session(0);
    *v24 = v0;
    v24[1] = sub_100058404;
    return Task<>.value.getter(v0 + 16, v23, v25);
  }
}

uint64_t sub_100058404()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 120));
  return swift_task_switch(sub_100058458, 0, 0);
}

uint64_t sub_100058458()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[13];
  v1 = v0[14];
  v3 = v0[11];
  v4 = v0[12];
  v0[16] = v0[2];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v1, v3);
  Fence.ID.init(id:)(v2);
  v5 = (_QWORD *)swift_task_alloc(async function pointer to Session.deleteFence(id:)[1]);
  v0[17] = v5;
  *v5 = v0;
  v5[1] = sub_1000584DC;
  return Session.deleteFence(id:)(v0[9]);
}

uint64_t sub_1000584DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 128);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 136);
  v5 = *(_QWORD *)(*(_QWORD *)v1 + 64);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 72);
  v6 = *(_QWORD *)(*(_QWORD *)v1 + 56);
  *(_QWORD *)(*(_QWORD *)v1 + 144) = v0;
  swift_task_dealloc(v2);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  swift_release(v3);
  if (v0)
    v7 = sub_1000585E8;
  else
    v7 = sub_100058570;
  return swift_task_switch(v7, 0, 0);
}

uint64_t sub_100058570()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 96);
  (*(void (**)(_QWORD))(v0 + 32))(0);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  v4 = *(_QWORD *)(v0 + 104);
  v6 = *(_QWORD *)(v0 + 72);
  v5 = *(_QWORD *)(v0 + 80);
  swift_task_dealloc(*(_QWORD *)(v0 + 112));
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000585E8()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(void);
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 144);
  v2 = *(void (**)(void))(v0 + 32);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 96) + 8))(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 88));
  v3 = (void *)_convertErrorToNSError(_:)(v1);
  v2();

  swift_errorRelease(v1);
  v4 = *(_QWORD *)(v0 + 104);
  v6 = *(_QWORD *)(v0 + 72);
  v5 = *(_QWORD *)(v0 + 80);
  swift_task_dealloc(*(_QWORD *)(v0 + 112));
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100058674()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = v0[4];
  v3 = v0[5];
  v5 = v0[6];
  v4 = v0[7];
  v6 = (_QWORD *)swift_task_alloc(dword_1000B331C);
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_1000630F0;
  return sub_100058178((uint64_t)v6, v7, v8, v2, v3, v5, v4);
}

uint64_t sub_100058810(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  uint64_t v13;

  v5 = sub_100056A5C(&qword_1000B3300);
  __chkstk_darwin(v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = (_QWORD *)swift_allocObject(&unk_10009B178, 56, 7);
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = v2;
  v9[5] = a1;
  v9[6] = a2;
  v10 = v2;
  swift_retain(a2);
  v11 = sub_100054D80((uint64_t)v7, (uint64_t)&unk_1000B3330, (uint64_t)v9);
  return swift_release(v11);
}

uint64_t sub_1000588E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6[5] = a5;
  v6[6] = a6;
  v6[4] = a4;
  v7 = type metadata accessor for Fence(0);
  v6[7] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v6[8] = v8;
  v6[9] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10005894C, 0, 0);
}

uint64_t sub_10005894C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 32) + OBJC_IVAR____TtC4fmfd17FindMyLocateShims_sessionTask);
  v2 = (_QWORD *)swift_task_alloc(async function pointer to Task<>.value.getter[1]);
  *(_QWORD *)(v0 + 80) = v2;
  v3 = type metadata accessor for Session(0);
  *v2 = v0;
  v2[1] = sub_1000589C8;
  return Task<>.value.getter(v0 + 16, v1, v3);
}

uint64_t sub_1000589C8()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 80));
  return swift_task_switch(sub_100058A1C, 0, 0);
}

uint64_t sub_100058A1C()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[11] = v0[2];
  v1 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to Session.fences() + 1));
  v0[12] = v1;
  *v1 = v0;
  v1[1] = sub_100058A6C;
  return Session.fences()();
}

uint64_t sub_100058A6C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t (*v5)();

  v3 = *(_QWORD **)v2;
  v4 = *(_QWORD *)(*(_QWORD *)v2 + 96);
  v3[13] = a1;
  v3[14] = v1;
  swift_task_dealloc(v4);
  if (v1)
  {
    v5 = sub_100058DF8;
  }
  else
  {
    swift_release(v3[11]);
    v5 = sub_100058AE0;
  }
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_100058AE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(_QWORD, _QWORD, _QWORD);
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint8_t *v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, _QWORD);
  uint64_t v26;
  void (*v28)(_QWORD, _QWORD, _QWORD);
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;

  v1 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + 64);
    v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v30 = v0 + 32;
    v31 = (uint64_t *)(v0 + 24);
    v5 = *(_QWORD *)(v3 + 72);
    v6 = *(void (**)(_QWORD, _QWORD, _QWORD))(v3 + 16);
    v7 = *(_QWORD *)(v0 + 112);
    swift_bridgeObjectRetain(v1);
    v32 = v0;
    v28 = v6;
    v29 = v5;
    do
    {
      v6(*(_QWORD *)(v0 + 72), v4, *(_QWORD *)(v0 + 56));
      v8 = sub_100055928();
      if (v7)
      {
        if (qword_1000B3890 != -1)
          swift_once(&qword_1000B3890, sub_1000545D8);
        v9 = type metadata accessor for Logger(0);
        sub_100061F8C(v9, (uint64_t)qword_1000B3898);
        swift_errorRetain(v7);
        v10 = swift_errorRetain(v7);
        v11 = Logger.logObject.getter(v10);
        v12 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v11, v12))
        {
          v13 = (uint8_t *)swift_slowAlloc(12, -1);
          v14 = (uint64_t *)swift_slowAlloc(8, -1);
          *(_DWORD *)v13 = 138412290;
          swift_errorRetain(v7);
          v15 = v3;
          v16 = _swift_stdlib_bridgeErrorToNSError(v7);
          *v31 = v16;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v31, v30, v13 + 4, v13 + 12);
          *v14 = v16;
          v3 = v15;
          swift_errorRelease(v7);
          swift_errorRelease(v7);
          _os_log_impl((void *)&_mh_execute_header, v11, v12, "Failed to convert to FMFFence: %@", v13, 0xCu);
          v17 = sub_100056A5C(&qword_1000B3498);
          swift_arrayDestroy(v14, 1, v17);
          v18 = v14;
          v6 = v28;
          swift_slowDealloc(v18, -1, -1);
          v19 = v13;
          v5 = v29;
          v0 = v32;
          swift_slowDealloc(v19, -1, -1);

          swift_errorRelease(v7);
        }
        else
        {
          swift_errorRelease(v7);
          swift_errorRelease(v7);
          swift_errorRelease(v7);

        }
        (*(void (**)(_QWORD, _QWORD))(v3 + 8))(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 56));
      }
      else
      {
        v20 = v8;
        v21 = (*(uint64_t (**)(_QWORD, _QWORD))(v3 + 8))(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 56));
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v21);
        v23 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
        v22 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18);
        if (v23 >= v22 >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v22 > 1, v23 + 1, 1);
        v24 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v23, v20);
        specialized Array._endMutation()(v24);
      }
      v7 = 0;
      v4 += v5;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 104));
    v1 = *(_QWORD *)(v0 + 104);
  }
  v25 = *(void (**)(uint64_t, _QWORD))(v0 + 40);
  swift_bridgeObjectRelease(v1);
  v26 = sub_10005FD04((uint64_t)&_swiftEmptyArrayStorage);
  swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
  v25(v26, 0);
  swift_bridgeObjectRelease(v26);
  swift_task_dealloc(*(_QWORD *)(v0 + 72));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100058DF8()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(_QWORD, void *);
  void *v3;

  v1 = *(_QWORD *)(v0 + 112);
  v2 = *(void (**)(_QWORD, void *))(v0 + 40);
  swift_release(*(_QWORD *)(v0 + 88));
  v3 = (void *)_convertErrorToNSError(_:)(v1);
  v2(0, v3);

  swift_errorRelease(v1);
  swift_task_dealloc(*(_QWORD *)(v0 + 72));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100058E68()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = v0[4];
  v3 = v0[5];
  v4 = v0[6];
  v5 = (_QWORD *)swift_task_alloc(dword_1000B332C);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1000630F0;
  return sub_1000588E8((uint64_t)v5, v6, v7, v2, v3, v4);
}

void sub_100058FDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSSet v4;
  Class isa;

  if (a1)
  {
    sub_100061BA4(0, &qword_1000B33D0, FMFFence_ptr);
    sub_100061BDC();
    v4.super.isa = Set._bridgeToObjectiveC()().super.isa;
  }
  else
  {
    v4.super.isa = 0;
  }
  isa = v4.super.isa;
  (*(void (**)(uint64_t))(a3 + 16))(a3);

}

uint64_t sub_100059068(uint64_t a1, void (*a2)(_QWORD, _QWORD), uint64_t a3)
{
  _QWORD *v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  int64_t v16;
  unint64_t *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  char *v32;
  _QWORD *v33;
  void (*v34)(_QWORD, _QWORD);
  uint64_t v35;
  unint64_t *v36;

  v7 = sub_100056A5C(&qword_1000B3300);
  __chkstk_darwin(v7);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for PersonHandle(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
    return (*(uint64_t (**)(_QWORD, uint64_t))((swift_isaMask & *v3) + 0x70))(a2, a3);
  v14 = sub_100056784(a1, (SEL *)&selRef_identifier);
  v15 = v14;
  v16 = *((_QWORD *)v14 + 2);
  if (v16)
  {
    v32 = v9;
    v33 = v3;
    v34 = a2;
    v35 = a3;
    v36 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_10005F088(0, v16, 0);
    v17 = v36;
    v18 = v15 + 40;
    do
    {
      v20 = *(v18 - 1);
      v19 = *v18;
      swift_bridgeObjectRetain(*v18);
      PersonHandle.init(id:)(v20, v19);
      v36 = v17;
      v22 = v17[2];
      v21 = v17[3];
      if (v22 >= v21 >> 1)
      {
        sub_10005F088(v21 > 1, v22 + 1, 1);
        v17 = v36;
      }
      v18 += 2;
      v17[2] = v22 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))((unint64_t)v17+ ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))+ *(_QWORD *)(v11 + 72) * v22, v13, v10);
      --v16;
    }
    while (v16);
    swift_bridgeObjectRelease(v15);
    a2 = v34;
    a3 = v35;
    v9 = v32;
    v3 = v33;
    if (v17[2])
      goto LABEL_8;
  }
  else
  {
    swift_bridgeObjectRelease(v14);
    v17 = (unint64_t *)&_swiftEmptyArrayStorage;
    if (*((_QWORD *)&_swiftEmptyArrayStorage + 2))
    {
LABEL_8:
      v23 = type metadata accessor for TaskPriority(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v9, 1, 1, v23);
      v24 = (_QWORD *)swift_allocObject(&unk_10009B1A0, 64, 7);
      v24[2] = 0;
      v24[3] = 0;
      v24[4] = v3;
      v24[5] = v17;
      v24[6] = a2;
      v24[7] = a3;
      v25 = v3;
      swift_retain(a3);
      v26 = sub_100054D80((uint64_t)v9, (uint64_t)&unk_1000B3340, (uint64_t)v24);
      return swift_release(v26);
    }
  }
  swift_bridgeObjectRelease(v17);
  v28 = sub_10005F11C();
  v29 = swift_allocError(&type metadata for FindMyLocateShims.Error, v28, 0, 0);
  *(_OWORD *)v30 = xmmword_1000767A0;
  *(_BYTE *)(v30 + 16) = 2;
  v31 = (void *)_convertErrorToNSError(_:)(v29);
  a2(0, v31);

  return swift_errorRelease(v29);
}

uint64_t sub_100059344(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v7[6] = a6;
  v7[7] = a7;
  v7[4] = a4;
  v7[5] = a5;
  v8 = type metadata accessor for Fence(0);
  v7[8] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v7[9] = v9;
  v7[10] = swift_task_alloc((*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_1000593A8, 0, 0);
}

uint64_t sub_1000593A8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 32) + OBJC_IVAR____TtC4fmfd17FindMyLocateShims_sessionTask);
  v2 = (_QWORD *)swift_task_alloc(async function pointer to Task<>.value.getter[1]);
  *(_QWORD *)(v0 + 88) = v2;
  v3 = type metadata accessor for Session(0);
  *v2 = v0;
  v2[1] = sub_100059424;
  return Task<>.value.getter(v0 + 16, v1, v3);
}

uint64_t sub_100059424()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 88));
  return swift_task_switch(sub_100059478, 0, 0);
}

uint64_t sub_100059478()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[12] = v0[2];
  v1 = (_QWORD *)swift_task_alloc(async function pointer to Session.fences()[1]);
  v0[13] = v1;
  *v1 = v0;
  v1[1] = sub_1000594C8;
  return Session.fences()();
}

uint64_t sub_1000594C8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 104);
  *(_QWORD *)(*v2 + 112) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    v6 = sub_100059894;
  }
  else
  {
    swift_release(*(_QWORD *)(v4 + 96));
    *(_QWORD *)(v4 + 120) = a1;
    v6 = sub_100059544;
  }
  return swift_task_switch(v6, 0, 0);
}

uint64_t sub_100059544()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(_QWORD, _QWORD, _QWORD);
  __CFString **v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint8_t *v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, _QWORD);
  uint64_t v30;
  char *v32;
  void (*v33)(_QWORD, _QWORD, _QWORD);
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;

  v2 = *(_QWORD *)(v0 + 112);
  v1 = *(_QWORD *)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain(v3);
  v4 = sub_100060BDC(v1, v3);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v1);
  v5 = *((_QWORD *)v4 + 2);
  if (v5)
  {
    v6 = *(_QWORD *)(v0 + 72);
    v7 = v4;
    v8 = &v4[(*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80)];
    v35 = v0 + 32;
    v36 = (uint64_t *)(v0 + 24);
    v9 = *(_QWORD *)(v6 + 72);
    v10 = *(void (**)(_QWORD, _QWORD, _QWORD))(v6 + 16);
    v32 = v7;
    swift_bridgeObjectRetain(v7);
    v11 = &off_1000B3000;
    v37 = v0;
    v33 = v10;
    v34 = v9;
    do
    {
      v10(*(_QWORD *)(v0 + 80), v8, *(_QWORD *)(v0 + 64));
      v12 = sub_100055928();
      if (v2)
      {
        if (v11[274] != (__CFString *)-1)
          swift_once(&qword_1000B3890, sub_1000545D8);
        v13 = type metadata accessor for Logger(0);
        sub_100061F8C(v13, (uint64_t)qword_1000B3898);
        swift_errorRetain(v2);
        v14 = swift_errorRetain(v2);
        v15 = Logger.logObject.getter(v14);
        v16 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v15, v16))
        {
          v17 = (uint8_t *)swift_slowAlloc(12, -1);
          v18 = (uint64_t *)swift_slowAlloc(8, -1);
          *(_DWORD *)v17 = 138412290;
          swift_errorRetain(v2);
          v19 = v6;
          v20 = _swift_stdlib_bridgeErrorToNSError(v2);
          *v36 = v20;
          v11 = &off_1000B3000;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v36, v35, v17 + 4, v17 + 12);
          *v18 = v20;
          v6 = v19;
          swift_errorRelease(v2);
          swift_errorRelease(v2);
          _os_log_impl((void *)&_mh_execute_header, v15, v16, "Failed to convert to FMFFence: %@", v17, 0xCu);
          v21 = sub_100056A5C(&qword_1000B3498);
          swift_arrayDestroy(v18, 1, v21);
          v22 = v18;
          v9 = v34;
          swift_slowDealloc(v22, -1, -1);
          v23 = v17;
          v10 = v33;
          v0 = v37;
          swift_slowDealloc(v23, -1, -1);

          swift_errorRelease(v2);
        }
        else
        {
          swift_errorRelease(v2);
          swift_errorRelease(v2);
          swift_errorRelease(v2);

        }
        (*(void (**)(_QWORD, _QWORD))(v6 + 8))(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 64));
      }
      else
      {
        v24 = v12;
        v25 = (*(uint64_t (**)(_QWORD, _QWORD))(v6 + 8))(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 64));
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v25);
        v27 = *(_QWORD *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
        v26 = *(_QWORD *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18);
        if (v27 >= v26 >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v26 > 1, v27 + 1, 1);
        v28 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v27, v24);
        specialized Array._endMutation()(v28);
      }
      v2 = 0;
      v8 += v9;
      --v5;
    }
    while (v5);
    v4 = v32;
    swift_bridgeObjectRelease(v32);
  }
  v29 = *(void (**)(uint64_t, _QWORD))(v0 + 48);
  swift_bridgeObjectRelease(v4);
  v30 = sub_10005FD04((uint64_t)_swiftEmptyArrayStorage);
  swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  v29(v30, 0);
  swift_bridgeObjectRelease(v30);
  swift_task_dealloc(*(_QWORD *)(v0 + 80));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100059894()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(_QWORD, void *);
  void *v3;

  v1 = *(_QWORD *)(v0 + 112);
  v2 = *(void (**)(_QWORD, void *))(v0 + 48);
  swift_release(*(_QWORD *)(v0 + 96));
  v3 = (void *)_convertErrorToNSError(_:)(v1);
  v2(0, v3);

  swift_errorRelease(v1);
  swift_task_dealloc(*(_QWORD *)(v0 + 80));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100059998(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))((swift_isaMask & *v7) + 0x88))(a1, a2, a3, a4, a5, 0, a6, a7);
}

uint64_t sub_100059B60(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, void *a6, void (*a7)(void), void (*a8)(void))
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  unint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void (*v33)(char *, char *, uint64_t);
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  id v44;
  id v45;
  uint64_t v46;
  unsigned int *v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  char *v51;
  char *v52;
  unint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  char v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  char *v68;
  void *v69;
  void (**v70)(void);
  void (*v71)(void);
  id v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  void (*v97)(char *, char *, uint64_t);
  char *v98;
  uint64_t v99;
  _QWORD *v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  id v110;
  void (*v111)(void);
  void (*v112)(void);

  v106 = a4;
  v111 = a7;
  v112 = a8;
  v110 = a6;
  v10 = sub_100056A5C(&qword_1000B3300);
  __chkstk_darwin(v10);
  v109 = (uint64_t)&v97 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Fence.TriggerPosition(0);
  v13 = *(_QWORD *)(v12 - 8);
  v101 = v12;
  v102 = v13;
  v14 = *(_QWORD *)(v13 + 64);
  v15 = __chkstk_darwin(v12);
  v103 = (char *)&v97 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v17 = (char *)&v97 - v16;
  v18 = sub_100056A5C(&qword_1000B3350);
  __chkstk_darwin(v18);
  v20 = (char *)&v97 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for UUID(0);
  v22 = *(_QWORD *)(v21 - 8);
  v23 = *(_QWORD *)(v22 + 64);
  v24 = __chkstk_darwin(v21);
  __chkstk_darwin(v24);
  v26 = (char *)&v97 - v25;
  v107 = a2;
  v108 = a3;
  UUID.init(uuidString:)(a2, a3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21) == 1)
  {
    sub_100062278((uint64_t)v20, &qword_1000B3350);
    v27 = sub_10005F11C();
    v28 = swift_allocError(&type metadata for FindMyLocateShims.Error, v27, 0, 0);
    v29 = v108;
    *(_QWORD *)v30 = v107;
    *(_QWORD *)(v30 + 8) = v29;
    *(_BYTE *)(v30 + 16) = 0;
    swift_bridgeObjectRetain(v29);
    v31 = (void *)_convertErrorToNSError(_:)(v28);
    v111();

LABEL_10:
    v56 = v28;
    return swift_errorRelease(v56);
  }
  v98 = (char *)&v97 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v99 = v23;
  v107 = v14;
  v100 = v17;
  v32 = v109;
  v33 = *(void (**)(char *, char *, uint64_t))(v22 + 32);
  v33(v26, v20, v21);
  v104 = v22;
  v34 = v110;
  if (!v110)
  {
    v53 = sub_10005F11C();
    v28 = swift_allocError(&type metadata for FindMyLocateShims.Error, v53, 0, 0);
    *(_QWORD *)v54 = 0;
    *(_QWORD *)(v54 + 8) = 0;
    *(_BYTE *)(v54 + 16) = 2;
    v55 = (void *)_convertErrorToNSError(_:)(v28);
    v111();

    (*(void (**)(char *, uint64_t))(v104 + 8))(v26, v21);
    goto LABEL_10;
  }
  v108 = v26;
  v35 = static String._unconditionallyBridgeFromObjectiveC(_:)(FMFFenceTriggerStatusIn);
  v37 = v36;
  v38 = v106;
  v40 = static String._unconditionallyBridgeFromObjectiveC(_:)(v106);
  v41 = v39;
  v97 = v33;
  if (v35 != v40 || v37 != v39)
  {
    v58 = _stringCompareWithSmolCheck(_:_:expecting:)(v35, v37, v40, v39, 0);
    v59 = v34;
    swift_bridgeObjectRelease(v41);
    swift_bridgeObjectRelease(v37);
    if ((v58 & 1) != 0)
      goto LABEL_13;
    v75 = static String._unconditionallyBridgeFromObjectiveC(_:)(FMFFenceTriggerStatusEnter);
    v37 = v76;
    v46 = static String._unconditionallyBridgeFromObjectiveC(_:)(v38);
    v78 = v77;
    if (v75 == v46 && v37 == v77)
    {
      v44 = v34;
      v43 = v21;
      goto LABEL_7;
    }
    v79 = _stringCompareWithSmolCheck(_:_:expecting:)(v75, v37, v46, v77, 0);
    swift_bridgeObjectRelease(v78);
    swift_bridgeObjectRelease(v37);
    if ((v79 & 1) != 0)
    {
LABEL_13:
      v44 = v34;
      v43 = v21;
      v47 = (unsigned int *)&enum case for Fence.TriggerPosition.inside(_:);
    }
    else
    {
      v80 = static String._unconditionallyBridgeFromObjectiveC(_:)(FMFFenceTriggerStatusOut);
      v37 = v81;
      v46 = static String._unconditionallyBridgeFromObjectiveC(_:)(v38);
      v83 = v82;
      if (v80 == v46 && v37 == v82)
        goto LABEL_23;
      v84 = _stringCompareWithSmolCheck(_:_:expecting:)(v80, v37, v46, v82, 0);
      swift_bridgeObjectRelease(v83);
      swift_bridgeObjectRelease(v37);
      if ((v84 & 1) == 0)
      {
        v85 = static String._unconditionallyBridgeFromObjectiveC(_:)(FMFFenceTriggerStatusExit);
        v37 = v86;
        v46 = static String._unconditionallyBridgeFromObjectiveC(_:)(v38);
        v88 = v87;
        if (v85 == v46 && v37 == v87)
        {
LABEL_23:
          v44 = v34;
          v43 = v21;
          v47 = (unsigned int *)&enum case for Fence.TriggerPosition.outside(_:);
          goto LABEL_8;
        }
        v89 = _stringCompareWithSmolCheck(_:_:expecting:)(v85, v37, v46, v87, 0);
        swift_bridgeObjectRelease(v88);
        swift_bridgeObjectRelease(v37);
        if ((v89 & 1) == 0)
        {
          v90 = static String._unconditionallyBridgeFromObjectiveC(_:)(v38);
          v92 = v91;
          v93 = sub_10005F11C();
          v94 = swift_allocError(&type metadata for FindMyLocateShims.Error, v93, 0, 0);
          *(_QWORD *)v95 = v90;
          *(_QWORD *)(v95 + 8) = v92;
          *(_BYTE *)(v95 + 16) = 1;
          v96 = (void *)_convertErrorToNSError(_:)(v94);
          v111();

          (*(void (**)(char *, uint64_t))(v104 + 8))(v108, v21);
          v56 = v94;
          return swift_errorRelease(v56);
        }
      }
      v44 = v34;
      v43 = v21;
      v47 = (unsigned int *)&enum case for Fence.TriggerPosition.outside(_:);
    }
    v49 = v101;
    v48 = v102;
    v50 = v100;
    v52 = v103;
    v51 = v98;
    goto LABEL_15;
  }
  v42 = v34;
  v43 = v21;
  v44 = v42;
  v45 = v42;
LABEL_7:
  v47 = (unsigned int *)&enum case for Fence.TriggerPosition.inside(_:);
LABEL_8:
  v49 = v101;
  v48 = v102;
  v50 = v100;
  v51 = v98;
  swift_bridgeObjectRelease_n(v37, 2, v46);
  v52 = v103;
LABEL_15:
  *v50 = v44;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v48 + 104))(v50, *v47, v49);
  v60 = type metadata accessor for TaskPriority(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v60 - 8) + 56))(v32, 1, 1, v60);
  v61 = v104;
  (*(void (**)(char *, char *, uint64_t))(v104 + 16))(v51, v108, v43);
  (*(void (**)(char *, _QWORD *, uint64_t))(v48 + 16))(v52, v50, v49);
  v62 = *(unsigned __int8 *)(v61 + 80);
  v63 = v52;
  v64 = (v62 + 40) & ~v62;
  v65 = *(unsigned __int8 *)(v48 + 80);
  v66 = (v99 + v65 + v64) & ~v65;
  v67 = (v107 + v66 + 7) & 0xFFFFFFFFFFFFFFF8;
  v68 = (char *)swift_allocObject(&unk_10009B1C8, v67 + 16, v62 | v65 | 7);
  *((_QWORD *)v68 + 2) = 0;
  *((_QWORD *)v68 + 3) = 0;
  v69 = v105;
  *((_QWORD *)v68 + 4) = v105;
  v97(&v68[v64], v51, v43);
  (*(void (**)(char *, char *, uint64_t))(v48 + 32))(&v68[v66], v63, v49);
  v70 = (void (**)(void))&v68[v67];
  v71 = v112;
  *v70 = v111;
  v70[1] = v71;
  v72 = v110;
  v73 = v69;
  swift_retain(v71);
  v74 = sub_100054D80(v109, (uint64_t)&unk_1000B3360, (uint64_t)v68);
  swift_release(v74);

  (*(void (**)(_QWORD *, uint64_t))(v48 + 8))(v100, v49);
  return (*(uint64_t (**)(char *, uint64_t))(v104 + 8))(v108, v43);
}

uint64_t sub_10005A1E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v8[6] = a7;
  v8[7] = a8;
  v8[4] = a5;
  v8[5] = a6;
  v8[3] = a4;
  v9 = type metadata accessor for UUID(0);
  v8[8] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v8[9] = v10;
  v8[10] = swift_task_alloc((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Fence.ID(0);
  v8[11] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v8[12] = v12;
  v8[13] = swift_task_alloc((*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for Fence.TriggerID(0);
  v8[14] = v13;
  v14 = *(_QWORD *)(v13 - 8);
  v8[15] = v14;
  v8[16] = swift_task_alloc((*(_QWORD *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10005A298, 0, 0);
}

uint64_t sub_10005A298()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 24) + OBJC_IVAR____TtC4fmfd17FindMyLocateShims_sessionTask);
  v2 = (_QWORD *)swift_task_alloc(async function pointer to Task<>.value.getter[1]);
  *(_QWORD *)(v0 + 136) = v2;
  v3 = type metadata accessor for Session(0);
  *v2 = v0;
  v2[1] = sub_10005A314;
  return Task<>.value.getter(v0 + 16, v1, v3);
}

uint64_t sub_10005A314()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 136));
  return swift_task_switch(sub_10005A368, 0, 0);
}

uint64_t sub_10005A368()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0[9];
  v2 = v0[10];
  v3 = v0[8];
  v4 = v0[4];
  v0[18] = v0[2];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v2, v4, v3);
  Fence.ID.init(id:)(v2);
  v5 = (_QWORD *)swift_task_alloc(async function pointer to Session.triggerFence(id:position:)[1]);
  v0[19] = v5;
  *v5 = v0;
  v5[1] = sub_10005A3F8;
  return Session.triggerFence(id:position:)(v0[16], v0[13], v0[5]);
}

uint64_t sub_10005A3F8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v2 = *(_QWORD **)v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 152);
  *(_QWORD *)(*(_QWORD *)v1 + 160) = v0;
  swift_task_dealloc(v3);
  v4 = v2[18];
  if (v0)
  {
    (*(void (**)(_QWORD, _QWORD))(v2[12] + 8))(v2[13], v2[11]);
    swift_release(v4);
    v5 = sub_10005A518;
  }
  else
  {
    v7 = v2[15];
    v6 = v2[16];
    v9 = v2[13];
    v8 = v2[14];
    v12 = v2 + 11;
    v10 = v2[11];
    v11 = v12[1];
    swift_release(v4);
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    v5 = sub_10005A4C4;
  }
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_10005A4C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(_QWORD))(v0 + 48))(0);
  v1 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 80);
  swift_task_dealloc(*(_QWORD *)(v0 + 128));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10005A518()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(void);
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + 160);
  v2 = *(void (**)(void))(v0 + 48);
  v3 = (void *)_convertErrorToNSError(_:)(v1);
  v2();

  swift_errorRelease(v1);
  v4 = *(_QWORD *)(v0 + 104);
  v5 = *(_QWORD *)(v0 + 80);
  swift_task_dealloc(*(_QWORD *)(v0 + 128));
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10005A714(void *a1, uint64_t a2, void (*a3)(void), void (*a4)(void))
{
  void *v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  void (**v29)(void);
  id v30;
  uint64_t v31;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void (*v38)(void);

  v9 = sub_100056A5C(&qword_1000B3368);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  __chkstk_darwin(v9);
  v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100056A5C(&qword_1000B3300);
  __chkstk_darwin(v13);
  v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v16 = a1;
    v17 = objc_msgSend(v16, "identifier");
    if (v17)
    {
      v18 = v17;
      v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
      v37 = v20;
      v38 = a3;
      v21 = v19;

      v22 = type metadata accessor for TaskPriority(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v15, 1, 1, v22);
      sub_10005F228(a2, (uint64_t)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
      v23 = *(unsigned __int8 *)(v10 + 80);
      v24 = (v23 + 48) & ~v23;
      v25 = (v11 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
      v26 = (v25 + 15) & 0xFFFFFFFFFFFFFFF8;
      v27 = (_QWORD *)swift_allocObject(&unk_10009B1F0, v26 + 16, v23 | 7);
      v27[2] = 0;
      v27[3] = 0;
      v28 = v37;
      v27[4] = v21;
      v27[5] = v28;
      sub_10005F274((uint64_t)v12, (uint64_t)v27 + v24);
      *(_QWORD *)((char *)v27 + v25) = v4;
      v29 = (void (**)(void))((char *)v27 + v26);
      *v29 = v38;
      v29[1] = a4;
      v30 = v4;
      swift_retain(a4);
      v31 = sub_100054D80((uint64_t)v15, (uint64_t)&unk_1000B3378, (uint64_t)v27);

      return swift_release(v31);
    }

  }
  v33 = sub_10005F11C();
  v34 = swift_allocError(&type metadata for FindMyLocateShims.Error, v33, 0, 0);
  *(_OWORD *)v35 = xmmword_1000767A0;
  *(_BYTE *)(v35 + 16) = 2;
  v36 = (void *)_convertErrorToNSError(_:)(v34);
  a3();

  return swift_errorRelease(v34);
}

uint64_t sub_10005A93C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v8[8] = a8;
  v8[9] = v16;
  v8[6] = a6;
  v8[7] = a7;
  v8[4] = a4;
  v8[5] = a5;
  v9 = sub_100056A5C(&qword_1000B3368);
  v8[10] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v9 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Date(0, v10);
  v8[11] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v8[12] = v12;
  v8[13] = swift_task_alloc((*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for PersonHandle(0);
  v8[14] = v13;
  v14 = *(_QWORD *)(v13 - 8);
  v8[15] = v14;
  v8[16] = swift_task_alloc((*(_QWORD *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10005A9F4, 0, 0);
}

uint64_t sub_10005A9F4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t (*v12)();
  uint64_t v13;

  v1 = v0[11];
  v2 = v0[12];
  v3 = v0[10];
  v5 = v0[5];
  v4 = v0[6];
  v6 = v0[4];
  swift_bridgeObjectRetain(v5);
  PersonHandle.init(id:)(v6, v5);
  sub_10005F228(v4, v3);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    v7 = v0 + 2;
    v8 = v0[7];
    sub_100062278(v0[10], &qword_1000B3368);
    v9 = *(_QWORD *)(v8 + OBJC_IVAR____TtC4fmfd17FindMyLocateShims_sessionTask);
    v10 = (_QWORD *)swift_task_alloc(async function pointer to Task<>.value.getter[1]);
    v0[17] = v10;
    v11 = type metadata accessor for Session(0);
    v12 = sub_10005AB38;
  }
  else
  {
    v7 = v0 + 3;
    v13 = v0[7];
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[12] + 32))(v0[13], v0[10], v0[11]);
    v9 = *(_QWORD *)(v13 + OBJC_IVAR____TtC4fmfd17FindMyLocateShims_sessionTask);
    v10 = (_QWORD *)swift_task_alloc(async function pointer to Task<>.value.getter[1]);
    v0[21] = v10;
    v11 = type metadata accessor for Session(0);
    v12 = sub_10005AC50;
  }
  *v10 = v0;
  v10[1] = v12;
  return Task<>.value.getter(v7, v9, v11);
}

uint64_t sub_10005AB38()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 136));
  return swift_task_switch(sub_10005AB8C, 0, 0);
}

uint64_t sub_10005AB8C()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[18] = v0[2];
  v1 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to Session.unmuteFences(for:) + 1));
  v0[19] = v1;
  *v1 = v0;
  v1[1] = sub_10005ABE4;
  return Session.unmuteFences(for:)(v0[16]);
}

uint64_t sub_10005ABE4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 152);
  *(_QWORD *)(*v1 + 160) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    v4 = sub_10005AEE8;
  }
  else
  {
    swift_release(*(_QWORD *)(v2 + 144));
    v4 = sub_10005ADE8;
  }
  return swift_task_switch(v4, 0, 0);
}

uint64_t sub_10005AC50()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 168));
  return swift_task_switch(sub_10005ACA4, 0, 0);
}

uint64_t sub_10005ACA4()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[22] = v0[3];
  v1 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to Session.muteFences(for:untilDate:) + 1));
  v0[23] = v1;
  *v1 = v0;
  v1[1] = sub_10005AD00;
  return Session.muteFences(for:untilDate:)(v0[16], v0[13]);
}

uint64_t sub_10005AD00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 176);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 184);
  *(_QWORD *)(*(_QWORD *)v1 + 192) = v0;
  swift_task_dealloc(v2);
  swift_release(v3);
  if (v0)
    v4 = sub_10005AE54;
  else
    v4 = sub_10005AD6C;
  return swift_task_switch(v4, 0, 0);
}

uint64_t sub_10005AD6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 96) + 8))(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 88));
  (*(void (**)(_QWORD))(v0 + 64))(0);
  v1 = *(_QWORD *)(v0 + 128);
  v2 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 80);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 120) + 8))(v1, *(_QWORD *)(v0 + 112));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10005ADE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  (*(void (**)(_QWORD))(v0 + 64))(0);
  v1 = *(_QWORD *)(v0 + 128);
  v2 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 80);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 120) + 8))(v1, *(_QWORD *)(v0 + 112));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10005AE54()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(void);
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 96) + 8))(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 88));
  v1 = *(_QWORD *)(v0 + 192);
  v2 = *(void (**)(void))(v0 + 64);
  v3 = (void *)_convertErrorToNSError(_:)(v1);
  v2();
  swift_errorRelease(v1);

  v4 = *(_QWORD *)(v0 + 128);
  v5 = *(_QWORD *)(v0 + 104);
  v6 = *(_QWORD *)(v0 + 80);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 120) + 8))(v4, *(_QWORD *)(v0 + 112));
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10005AEE8()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(void);
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_release(*(_QWORD *)(v0 + 144));
  v1 = *(_QWORD *)(v0 + 160);
  v2 = *(void (**)(void))(v0 + 64);
  v3 = (void *)_convertErrorToNSError(_:)(v1);
  v2();
  swift_errorRelease(v1);

  v4 = *(_QWORD *)(v0 + 128);
  v5 = *(_QWORD *)(v0 + 104);
  v6 = *(_QWORD *)(v0 + 80);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 120) + 8))(v4, *(_QWORD *)(v0 + 112));
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_10005B09C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FindMyLocateShims();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_10005B0DC(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  unsigned int v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v23;
  char v24;
  unsigned int *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int *v29;
  char v30;
  unsigned int *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  _QWORD *v59;
  _QWORD *v60;
  id v61;
  _QWORD *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  id v67;
  void *v68;
  unint64_t v69;
  id v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  _QWORD *v77;
  unint64_t v78;
  _QWORD *v79;
  char *v80;
  uint64_t v81;

  v81 = a2;
  v3 = type metadata accessor for TimeZone(0);
  __chkstk_darwin(v3);
  v80 = (char *)&v80 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for Fence.DaysOfWeek(0);
  __chkstk_darwin(v5);
  v7 = (char *)&v80 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Fence.TimeOfDay(0);
  v9 = __chkstk_darwin(v8);
  v11 = (char *)&v80 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v80 - v12;
  v14 = objc_msgSend(a1, "isRecurring");
  v15 = objc_msgSend(a1, "trigger");
  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(FMFFenceTriggerArriving);
  v18 = v17;
  v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
  v21 = v19;
  v23 = v16 == v20 && v18 == v19;
  if (!v14)
  {
    if (v23)
    {
      swift_bridgeObjectRelease_n(v18, 2, v20);
    }
    else
    {
      v30 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v18, v20, v19, 0);
      swift_bridgeObjectRelease(v18);
      swift_bridgeObjectRelease(v21);
      if ((v30 & 1) == 0)
      {
        v42 = static String._unconditionallyBridgeFromObjectiveC(_:)(FMFFenceTriggerLeaving);
        v44 = v43;
        v46 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
        v47 = v45;
        if (v42 == v46 && v44 == v45)
        {
          swift_bridgeObjectRelease_n(v44, 2, v46);
        }
        else
        {
          v49 = _stringCompareWithSmolCheck(_:_:expecting:)(v42, v44, v46, v45, 0);
          swift_bridgeObjectRelease(v44);
          swift_bridgeObjectRelease(v47);
          if ((v49 & 1) == 0)
          {

            v57 = _s5ErrorOMa(0);
            v58 = sub_100062118();
            swift_allocError(v57, v58, 0, 0);
            v60 = v59;
            v61 = objc_msgSend(a1, "trigger");
LABEL_33:
            *v60 = v61;
            v62 = v60;
            v63 = v57;
            v64 = 0;
LABEL_34:
            v65 = swift_storeEnumTagMultiPayload(v62, v63, v64);
            swift_willThrow(v65);

            return;
          }
        }

        v31 = (unsigned int *)&enum case for Fence.Trigger.leaving(_:);
LABEL_17:
        v32 = *v31;
        v33 = type metadata accessor for Fence.Trigger(0);
        v28 = v81;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 104))(v81, v32, v33);
        v29 = (unsigned int *)&enum case for Fence.Variant.oneTime(_:);
        goto LABEL_18;
      }
    }

    v31 = (unsigned int *)&enum case for Fence.Trigger.arriving(_:);
    goto LABEL_17;
  }
  if (v23)
  {
    swift_bridgeObjectRelease_n(v18, 2, v20);
LABEL_13:

    v25 = (unsigned int *)&enum case for Fence.Trigger.arriving(_:);
LABEL_14:
    v26 = *v25;
    v27 = type metadata accessor for Fence.Trigger(0);
    v28 = v81;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 104))(v81, v26, v27);
    v29 = (unsigned int *)&enum case for Fence.Variant.recurring(_:);
LABEL_18:
    v34 = *v29;
    v35 = type metadata accessor for Fence.Variant(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 104))(v28, v34, v35);
    return;
  }
  v24 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v18, v20, v19, 0);
  swift_bridgeObjectRelease(v18);
  swift_bridgeObjectRelease(v21);
  if ((v24 & 1) != 0)
    goto LABEL_13;
  v36 = static String._unconditionallyBridgeFromObjectiveC(_:)(FMFFenceTriggerLeaving);
  v38 = v37;
  v40 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
  v41 = v39;
  if (v36 == v40 && v38 == v39)
  {
    swift_bridgeObjectRelease_n(v38, 2, v40);
LABEL_26:

    v25 = (unsigned int *)&enum case for Fence.Trigger.leaving(_:);
    goto LABEL_14;
  }
  v48 = _stringCompareWithSmolCheck(_:_:expecting:)(v36, v38, v40, v39, 0);
  swift_bridgeObjectRelease(v38);
  swift_bridgeObjectRelease(v41);
  if ((v48 & 1) != 0)
    goto LABEL_26;
  v50 = static String._unconditionallyBridgeFromObjectiveC(_:)(FMFFenceTriggerScheduled);
  v52 = v51;
  v54 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
  v55 = v53;
  if (v50 == v54 && v52 == v53)
  {

    swift_bridgeObjectRelease_n(v52, 2, v56);
    goto LABEL_36;
  }
  v66 = _stringCompareWithSmolCheck(_:_:expecting:)(v50, v52, v54, v53, 0);

  swift_bridgeObjectRelease(v52);
  swift_bridgeObjectRelease(v55);
  if ((v66 & 1) == 0)
  {
    v57 = _s5ErrorOMa(0);
    v78 = sub_100062118();
    swift_allocError(v57, v78, 0, 0);
    v60 = v79;
    v61 = objc_msgSend(a1, "trigger");
    goto LABEL_33;
  }
LABEL_36:
  v67 = objc_msgSend(a1, "schedule");
  if (!v67)
  {
    v75 = _s5ErrorOMa(0);
    v76 = sub_100062118();
    swift_allocError(v75, v76, 0, 0);
    v62 = v77;
    v63 = v75;
    v64 = 12;
    goto LABEL_34;
  }
  v68 = v67;
  Fence.TimeOfDay.init(hour:minute:)(objc_msgSend(v67, "startHour"), objc_msgSend(v67, "startMin"));
  Fence.TimeOfDay.init(hour:minute:)(objc_msgSend(v68, "endHour"), objc_msgSend(v68, "endMin"));
  v69 = (unint64_t)objc_msgSend(v68, "daysOfWeek");
  if ((v69 & 0x8000000000000000) != 0)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Negative value is not representable", 35, 2, "Swift/Integers.swift", 20, 2, 3451, 0);
  }
  else
  {
    if (v69 < 0x100)
    {
      Fence.DaysOfWeek.init(rawValue:)();
      v70 = objc_msgSend(v68, "timeZone");
      v71 = v80;
      static TimeZone._unconditionallyBridgeFromObjectiveC(_:)();

      v72 = v81;
      Fence.Schedule.init(start:end:daysOfWeek:timeZone:)(v13, v11, v7, v71);

      v73 = enum case for Fence.Variant.scheduled(_:);
      v74 = type metadata accessor for Fence.Variant(0);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v74 - 8) + 104))(v72, v73, v74);
      return;
    }
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Not enough bits to represent the passed value", 45, 2, "Swift/Integers.swift", 20, 2, 3455, 0);
  }
  __break(1u);
}

uint64_t sub_10005B79C(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v20;
  _QWORD v21[2];

  v4 = sub_100056A5C(&qword_1000B3350);
  __chkstk_darwin(v4);
  v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)v21 - v12;
  UUID.init(uuidString:)(a1, a2);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_100062278((uint64_t)v6, &qword_1000B3350);
    v14 = HIBYTE(a2) & 0xF;
    if ((a2 & 0x2000000000000000) == 0)
      v14 = a1 & 0xFFFFFFFFFFFFLL;
    if (v14)
    {
      v15 = _s5ErrorOMa(0);
      v16 = sub_100062118();
      swift_allocError(v15, v16, 0, 0);
      *v17 = a1;
      v17[1] = a2;
      v18 = swift_storeEnumTagMultiPayload(v17, v15, 3);
      return swift_willThrow(v18);
    }
    else
    {
      v20 = swift_bridgeObjectRelease(a2);
      return Fence.ID.init()(v20);
    }
  }
  else
  {
    swift_bridgeObjectRelease(a2);
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v6, v7);
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
    Fence.ID.init(id:)(v11);
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  }
}

_QWORD *sub_10005B970()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void (*v13)(char *, uint64_t, uint64_t);
  int v14;
  void (*v16)(char *, char *, _QWORD *);
  int v17;
  id *v18;
  void (*v19)(char *, uint64_t);
  unint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v30;

  v1 = v0;
  v2 = type metadata accessor for Fence.Variant(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (_QWORD *)type metadata accessor for Fence.Trigger(0);
  v7 = *(v6 - 1);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v30 - v11;
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v13(v5, v1, v2);
  v14 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v14 == enum case for Fence.Variant.oneTime(_:) || v14 == enum case for Fence.Variant.recurring(_:))
  {
    (*(void (**)(char *, uint64_t))(v3 + 96))(v5, v2);
    v16 = *(void (**)(char *, char *, _QWORD *))(v7 + 32);
    v16(v12, v5, v6);
    (*(void (**)(char *, char *, _QWORD *))(v7 + 16))(v10, v12, v6);
    v17 = (*(uint64_t (**)(char *, _QWORD *))(v7 + 88))(v10, v6);
    if (v17 == enum case for Fence.Trigger.arriving(_:))
    {
      (*(void (**)(char *, _QWORD *))(v7 + 8))(v12, v6);
      v18 = (id *)&FMFFenceTriggerArriving;
    }
    else
    {
      if (v17 != enum case for Fence.Trigger.leaving(_:))
      {
        v24 = _s5ErrorOMa(0);
        v25 = sub_100062118();
        swift_allocError(v24, v25, 0, 0);
        v27 = v26;
        v16(v26, v12, v6);
        v28 = swift_storeEnumTagMultiPayload(v27, v24, 10);
        swift_willThrow(v28);
        (*(void (**)(char *, _QWORD *))(v7 + 8))(v10, v6);
        return v6;
      }
      (*(void (**)(char *, _QWORD *))(v7 + 8))(v12, v6);
      v18 = (id *)&FMFFenceTriggerLeaving;
    }
    return *v18;
  }
  else if (v14 == enum case for Fence.Variant.scheduled(_:))
  {
    v19 = *(void (**)(char *, uint64_t))(v3 + 8);
    v6 = FMFFenceTriggerScheduled;
    v19(v5, v2);
  }
  else
  {
    v6 = (_QWORD *)_s5ErrorOMa(0);
    v20 = sub_100062118();
    swift_allocError(v6, v20, 0, 0);
    v22 = v21;
    v13(v21, v1, v2);
    v23 = swift_storeEnumTagMultiPayload(v22, v6, 4);
    swift_willThrow(v23);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return v6;
}

id sub_10005BC54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  unsigned __int8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  char *v32;
  Class isa;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;

  v1 = type metadata accessor for TimeZone(0);
  v39 = *(_QWORD *)(v1 - 8);
  v40 = v1;
  __chkstk_darwin();
  v38 = (char *)&v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Fence.TimeOfDay(0);
  v36 = *(_QWORD *)(v3 - 8);
  v37 = v3;
  __chkstk_darwin();
  v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = type metadata accessor for Fence.DaysOfWeek(0);
  v6 = *(_QWORD *)(v35 - 8);
  __chkstk_darwin();
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Fence.Variant(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin();
  v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for Fence.Schedule(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin();
  v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v0, v9);
  if ((*(unsigned int (**)(char *, uint64_t))(v10 + 88))(v12, v9) == enum case for Fence.Variant.scheduled(_:))
  {
    (*(void (**)(char *, uint64_t))(v10 + 96))(v12, v9);
    v17 = v13;
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
    v18 = objc_msgSend(objc_allocWithZone((Class)FMFSchedule), "init");
    v19 = Fence.Schedule.daysOfWeek.getter();
    v20 = Fence.DaysOfWeek.rawValue.getter(v19);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v35);
    v21 = Fence.Schedule.start.getter(objc_msgSend(v18, "setDaysOfWeek:", v20));
    v22 = Fence.TimeOfDay.hour.getter(v21);
    v23 = v37;
    v24 = *(void (**)(char *, uint64_t))(v36 + 8);
    v24(v5, v37);
    v25 = Fence.Schedule.start.getter(objc_msgSend(v18, "setStartHour:", v22));
    v26 = Fence.TimeOfDay.minute.getter(v25);
    v24(v5, v23);
    v27 = Fence.Schedule.end.getter(objc_msgSend(v18, "setStartMin:", v26));
    v28 = Fence.TimeOfDay.hour.getter(v27);
    v24(v5, v23);
    v29 = Fence.Schedule.end.getter(objc_msgSend(v18, "setEndHour:", v28));
    v30 = Fence.TimeOfDay.minute.getter(v29);
    v24(v5, v23);
    v31 = objc_msgSend(v18, "setEndMin:", v30);
    v32 = v38;
    Fence.Schedule.timeZone.getter(v31);
    isa = TimeZone._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v39 + 8))(v32, v40);
    objc_msgSend(v18, "setTimeZone:", isa);

    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v17);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    return 0;
  }
  return v18;
}

uint64_t sub_10005BFC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void (*v6)(char *, uint64_t, uint64_t);
  int v7;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;

  v1 = v0;
  v2 = type metadata accessor for Fence.MonitorRegion.Source(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v6(v5, v1, v2);
  v7 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  result = 0;
  if (v7 != enum case for Fence.MonitorRegion.Source.unknown(_:))
  {
    if (v7 == enum case for Fence.MonitorRegion.Source.currentLocation(_:))
    {
      return 1;
    }
    else if (v7 == enum case for Fence.MonitorRegion.Source.friendLocation(_:))
    {
      return 2;
    }
    else if (v7 == enum case for Fence.MonitorRegion.Source.labelledLocation(_:))
    {
      return 3;
    }
    else if (v7 == enum case for Fence.MonitorRegion.Source.addressBook(_:))
    {
      return 4;
    }
    else if (v7 == enum case for Fence.MonitorRegion.Source.custom(_:))
    {
      return 5;
    }
    else if (v7 == enum case for Fence.MonitorRegion.Source.droppedPin(_:))
    {
      return 6;
    }
    else if (v7 == enum case for Fence.MonitorRegion.Source.tool(_:))
    {
      return 7;
    }
    else
    {
      v9 = _s5ErrorOMa(0);
      v10 = sub_100062118();
      swift_allocError(v9, v10, 0, 0);
      v12 = v11;
      v6(v11, v1, v2);
      v13 = swift_storeEnumTagMultiPayload(v12, v9, 6);
      swift_willThrow(v13);
      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
  }
  return result;
}

void sub_10005C1A4(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(_BYTE *, uint64_t);
  int v26;
  int v27;
  id v28;
  int v29;
  int v30;
  Class isa;
  NSString v32;
  uint64_t v33;
  NSArray v34;
  NSString v35;
  int v36;
  BOOL v37;
  uint64_t v38;
  char *v39;
  Class v40;
  NSString v41;
  Class v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  Class v49;
  id v50;
  void *v51;
  id v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSString v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  _BYTE v71[4];
  int v72;
  uint64_t (*v73)(_BYTE *, uint64_t);
  uint64_t v74;
  id v75;
  uint64_t v76;

  v75 = a1;
  v2 = type metadata accessor for Fence.Participant(0);
  v76 = *(_QWORD *)(v2 - 8);
  v3 = __chkstk_darwin(v2);
  v5 = &v71[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = __chkstk_darwin(v3);
  v8 = &v71[-v7];
  __chkstk_darwin(v6);
  v10 = &v71[-v9];
  v11 = objc_msgSend((id)objc_opt_self(FMFAccountManager), "sharedInstance");
  if (!v11)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  v12 = v11;
  v13 = objc_msgSend(v11, "account");

  if (v13)
  {
    v14 = objc_msgSend(v13, "dsid");

    if (v14)
    {
      v15 = Fence.others.getter();
      v16 = (uint64_t)sub_1000565A4(v15);
      v17 = swift_bridgeObjectRelease(v15);
      if (v1)
      {

        return;
      }
      if ((unint64_t)v16 >> 62)
      {
        if (v16 < 0)
          v66 = v16;
        else
          v66 = v16 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v16);
        v67 = _CocoaArrayWrapper.endIndex.getter(v66);
        v17 = swift_bridgeObjectRelease(v16);
        if (v67)
          goto LABEL_10;
      }
      else if (*(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
LABEL_10:
        v74 = v16;
        Fence.createdBy.getter(v17);
        v25 = *(uint64_t (**)(_BYTE *, uint64_t))(v76 + 88);
        v26 = v25(v10, v2);
        v27 = enum case for Fence.Participant.me(_:);
        if (v26 == enum case for Fence.Participant.me(_:))
        {
          v28 = v75;
          v29 = v26;
          objc_msgSend(v75, "setFromMe:", 1);
          objc_msgSend(v28, "setCreatedByIdentifier:", v14);

          Fence.findee.getter();
          v30 = v25(v8, v2);
          if (v30 == v29)
          {
            isa = Array._bridgeToObjectiveC()().super.isa;
            objc_msgSend(v28, "setFollowerIds:", isa);

            v32 = String._bridgeToObjectiveC()();
            objc_msgSend(v28, "setFriendIdentifier:", v32);

            sub_100061BA4(0, &qword_1000B33C0, FMFHandle_ptr);
            v33 = v74;
            v34.super.isa = Array._bridgeToObjectiveC()().super.isa;
            swift_bridgeObjectRelease(v33);
LABEL_32:
            objc_msgSend(v28, "setRecipients:", v34.super.isa);

            return;
          }
          v38 = v74;
          if (v30 != enum case for Fence.Participant.other(_:))
          {
            swift_bridgeObjectRelease(v74);
            v55 = _s5ErrorOMa(0);
            v56 = sub_100062118();
            swift_allocError(v55, v56, 0, 0);
            v58 = v57;
            Fence.findee.getter();
            v59 = swift_storeEnumTagMultiPayload(v58, v55, 11);
            swift_willThrow(v59);
            (*(void (**)(_BYTE *, uint64_t))(v76 + 8))(v8, v2);
            return;
          }
          v42 = Array._bridgeToObjectiveC()().super.isa;
          objc_msgSend(v28, "setFollowerIds:", v42);

          if ((v38 & 0xC000000000000001) == 0)
          {
            if (*(_QWORD *)((v38 & 0xFFFFFFFFFFFFF8) + 0x10))
              goto LABEL_25;
            __break(1u);
          }
LABEL_41:
          v50 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v38);
          goto LABEL_26;
        }
        v73 = v25;
        if (v26 != enum case for Fence.Participant.other(_:))
        {
          swift_bridgeObjectRelease(v74);

          v43 = _s5ErrorOMa(0);
          v44 = sub_100062118();
          v45 = swift_allocError(v43, v44, 0, 0);
          v47 = v46;
          Fence.createdBy.getter(v45);
          v48 = swift_storeEnumTagMultiPayload(v47, v43, 8);
          swift_willThrow(v48);
          (*(void (**)(_BYTE *, uint64_t))(v76 + 8))(v10, v2);
          return;
        }
        v72 = v26;

        v28 = v75;
        objc_msgSend(v75, "setFromMe:", 0);
        v35 = String._bridgeToObjectiveC()();
        objc_msgSend(v28, "setCreatedByIdentifier:", v35);

        Fence.findee.getter();
        v36 = v73(v5, v2);
        v37 = v36 == v27;
        v38 = v74;
        if (v37)
        {
          v39 = sub_100056784(v74, (SEL *)&selRef_serverId);
          swift_bridgeObjectRelease(v38);
          v40 = Array._bridgeToObjectiveC()().super.isa;
          swift_bridgeObjectRelease(v39);
          objc_msgSend(v28, "setFollowerIds:", v40);

          v41 = String._bridgeToObjectiveC()();
          objc_msgSend(v28, "setFriendIdentifier:", v41);

LABEL_31:
          sub_100061BA4(0, &qword_1000B33C0, FMFHandle_ptr);
          v34.super.isa = Array._bridgeToObjectiveC()().super.isa;
          goto LABEL_32;
        }
        if (v36 != v72)
        {
          swift_bridgeObjectRelease(v74);
          v61 = _s5ErrorOMa(0);
          v62 = sub_100062118();
          swift_allocError(v61, v62, 0, 0);
          v64 = v63;
          Fence.findee.getter();
          v65 = swift_storeEnumTagMultiPayload(v64, v61, 11);
          swift_willThrow(v65);
          (*(void (**)(_BYTE *, uint64_t))(v76 + 8))(v5, v2);
          return;
        }
        v49 = Array._bridgeToObjectiveC()().super.isa;
        objc_msgSend(v28, "setFollowerIds:", v49);

        if ((v38 & 0xC000000000000001) != 0)
          goto LABEL_41;
        if (*(_QWORD *)((v38 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
LABEL_25:
          v50 = *(id *)(v38 + 32);
LABEL_26:
          v51 = v50;
          swift_bridgeObjectRelease(v38);
          v52 = objc_msgSend(v51, "serverId");

          if (v52)
          {
            static String._unconditionallyBridgeFromObjectiveC(_:)(v52);
            v54 = v53;

          }
          else
          {
            v54 = 0xE000000000000000;
          }
          v60 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(v54);
          objc_msgSend(v28, "setFriendIdentifier:", v60);

          goto LABEL_31;
        }
        __break(1u);
        goto LABEL_43;
      }
      swift_bridgeObjectRelease(v16);

      v68 = _s5ErrorOMa(0);
      v69 = sub_100062118();
      swift_allocError(v68, v69, 0, 0);
      v21 = v70;
      v22 = v68;
      v23 = 15;
    }
    else
    {
      v18 = _s5ErrorOMa(0);
      v19 = sub_100062118();
      swift_allocError(v18, v19, 0, 0);
      v21 = v20;
      v22 = v18;
      v23 = 13;
    }
    v24 = swift_storeEnumTagMultiPayload(v21, v22, v23);
    swift_willThrow(v24);
    return;
  }
LABEL_44:
  __break(1u);
}

_QWORD *sub_10005C8EC(uint64_t a1)
{
  int64_t v1;
  _QWORD *v2;
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD v9[2];
  _OWORD v10[2];
  _QWORD *v11;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = &_swiftEmptyArrayStorage;
  if (v1)
  {
    v11 = &_swiftEmptyArrayStorage;
    sub_10005F06C(0, v1, 0);
    v2 = &_swiftEmptyArrayStorage;
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *v4;
      v9[0] = *(v4 - 1);
      v9[1] = v5;
      swift_bridgeObjectRetain(v5);
      swift_dynamicCast(v10, v9, &type metadata for String, (char *)&type metadata for Any + 8, 7);
      if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
      {
        sub_10005F06C(0, v2[2] + 1, 1);
        v2 = v11;
      }
      v7 = v2[2];
      v6 = v2[3];
      if (v7 >= v6 >> 1)
      {
        sub_10005F06C(v6 > 1, v7 + 1, 1);
        v2 = v11;
      }
      v4 += 2;
      v2[2] = v7 + 1;
      sub_100062164(v10, &v2[4 * v7 + 4]);
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_10005CA10(uint64_t a1, uint64_t a2)
{
  return sub_10005CD70(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_10005CA28(uint64_t a1, id *a2)
{
  uint64_t result;
  uint64_t v5;
  NSString v6;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  result = static String._forceBridgeFromObjectiveC(_:result:)(a1, &v7);
  v5 = v8;
  if (v8)
  {
    v6 = String._bridgeToObjectiveC()();
    result = swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return result;
}

uint64_t sub_10005CA9C(uint64_t a1, id *a2)
{
  char v4;
  uint64_t v5;
  NSString v6;
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v8);
  v5 = v9;
  if (v9)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return v4 & 1;
}

uint64_t sub_10005CB18@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  uint64_t result;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v4 = v3;
  v5 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v4);
  *a2 = v5;
  return result;
}

uint64_t sub_10005CB5C(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;

  v2 = *a2;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*a1);
  v5 = v4;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  if (v3 == v6 && v5 == v7)
  {
    v10 = 1;
    v9 = v5;
  }
  else
  {
    v9 = v7;
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0);
  }
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

uint64_t sub_10005CBE8@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  NSString v4;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_10005CC2C@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_10005CC54(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100061F4C(&qword_1000B35F0, (uint64_t (*)(uint64_t))type metadata accessor for FMFFenceAcceptanceStatus, (uint64_t)&unk_100076B3C);
  v3 = sub_100061F4C(&qword_1000B35F8, (uint64_t (*)(uint64_t))type metadata accessor for FMFFenceAcceptanceStatus, (uint64_t)&unk_100076AE4);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_10005CCD8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100061F4C(&qword_1000B3600, (uint64_t (*)(uint64_t))type metadata accessor for FMFFenceTrigger, (uint64_t)&unk_1000769FC);
  v3 = sub_100061F4C(qword_1000B3608, (uint64_t (*)(uint64_t))type metadata accessor for FMFFenceTrigger, (uint64_t)&unk_1000769A4);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_10005CD64(uint64_t a1, uint64_t a2)
{
  return sub_10005CD70(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_10005CD70(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3);
  v7 = v6;
  v8 = a3(v5);
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_10005CDAC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_10005CDEC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::Int v6;
  _QWORD v8[9];

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_10005CE5C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_10005CEC0;
  return v6(a1);
}

uint64_t sub_10005CEC0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

char *sub_10005CF0C(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      v10 = sub_100056A5C(&qword_1000B34A8);
      v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 17;
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
      v14 = v11 + 32;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v11 = (char *)&_swiftEmptyArrayStorage;
      v14 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[16 * v8 + 32])
          memmove(v14, a4 + 32, 16 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10005FC14(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_10005D018(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  size_t v16;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
LABEL_29:
        result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division by zero", 16, 2, "Swift/IntegerTypes.swift", 24, 2, 14377, 0);
LABEL_31:
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v15 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_100056A5C(&qword_1000B34E8);
  v11 = *(_QWORD *)(type metadata accessor for PersonHandle(0) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  v16 = j__malloc_size(v15);
  if (!v12)
    goto LABEL_29;
  if (v16 - v14 == 0x8000000000000000 && v12 == -1)
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division results in an overflow", 31, 2, "Swift/IntegerTypes.swift", 24, 2, 14384, 0);
    goto LABEL_31;
  }
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  v18 = type metadata accessor for PersonHandle(0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v15 + v20;
  if ((a1 & 1) != 0)
  {
    v22 = a4 + v20;
    if ((unint64_t)v15 < a4 || v21 >= v22 + *(_QWORD *)(v19 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack((char *)v15 + v20, v22, v8, v18);
    }
    else if (v15 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront((char *)v15 + v20);
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_10005FE5C(0, v8, v21, a4);
  }
  swift_bridgeObjectRelease(a4);
  return (uint64_t)v15;
}

uint64_t sub_10005D220(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_10005D2F0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1000622D4((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1000622D4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_1000622B4(v12);
  return v7;
}

uint64_t sub_10005D2F0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_10005D4A8(a5, a6);
    *a1 = v13;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, v14, 1173, 0);
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
}

uint64_t sub_10005D4A8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_10005D53C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
    v2 = sub_10005D714(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_10005D714(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_10005D53C(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    while (1)
    {
      v5 = sub_10005D6B0(v4, 0);
      if (v4 < 0)
        break;
      v6 = v5;
      v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0)
        goto LABEL_14;
      if (v7 == v4)
        return v6;
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, v10, 1122, 0);
      __break(1u);
LABEL_10:
      v4 = String.UTF8View._foreignCount()();
      if (!v4)
        return &_swiftEmptyArrayStorage;
    }
    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, v10, 71, 0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_10005D6B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  size_t v6;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return &_swiftEmptyArrayStorage;
  v4 = sub_100056A5C(&qword_1000B3508);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10005D714(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_100056A5C(&qword_1000B3508);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8])
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10005D860(Swift::Int *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  Swift::Int v12;
  Swift::Int v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  char v17;
  uint64_t v18;
  id v19;
  char v20;
  void *v21;
  id v22;
  Swift::Int v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  Swift::Int v32;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(*v2);
    v8 = a2;
    v9 = __CocoaSet.member(for:)();

    if (v9)
    {
      swift_bridgeObjectRelease(v6);

      v31 = v9;
      v10 = sub_100061BA4(0, &qword_1000B33D0, FMFFence_ptr);
      swift_unknownObjectRetain(v9);
      swift_dynamicCast(&v32, &v31, (char *)&type metadata for Swift.AnyObject + 8, v10, 7);
      *a1 = v32;
      swift_unknownObjectRelease(v9);
      return 0;
    }
    result = __CocoaSet.count.getter(v7);
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v23 = sub_10005DAFC(v7, result + 1);
    v32 = v23;
    v24 = *(_QWORD *)(v23 + 16);
    if (*(_QWORD *)(v23 + 24) <= v24)
    {
      v29 = v24 + 1;
      v30 = v8;
      sub_10005DCF0(v29);
      v25 = v32;
    }
    else
    {
      v25 = v23;
      v26 = v8;
    }
    sub_10005E2F8((uint64_t)v8, v25);
    v28 = *v3;
    *v3 = v25;
  }
  else
  {
    v12 = *(_QWORD *)(v6 + 40);
    swift_bridgeObjectRetain(v6);
    v13 = NSObject._rawHashValue(seed:)(v12);
    v14 = -1 << *(_BYTE *)(v6 + 32);
    v15 = v13 & ~v14;
    if (((*(_QWORD *)(v6 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
    {
      sub_100061BA4(0, &qword_1000B33D0, FMFFence_ptr);
      v16 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v15);
      v17 = static NSObject.== infix(_:_:)();

      if ((v17 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease(v6);
        v21 = *(void **)(*(_QWORD *)(*v3 + 48) + 8 * v15);
        *a1 = (Swift::Int)v21;
        v22 = v21;
        return 0;
      }
      v18 = ~v14;
      while (1)
      {
        v15 = (v15 + 1) & v18;
        if (((*(_QWORD *)(v6 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
          break;
        v19 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v15);
        v20 = static NSObject.== infix(_:_:)();

        if ((v20 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease(v6);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v32 = *v3;
    *v3 = 0x8000000000000000;
    v8 = a2;
    sub_10005E378((uint64_t)v8, v15, isUniquelyReferenced_nonNull_native);
    v28 = *v3;
    *v3 = v32;
  }
  swift_bridgeObjectRelease(v28);
  *a1 = (Swift::Int)v8;
  return 1;
}

Swift::Int sub_10005DAFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Swift::Int result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a2)
  {
    sub_100056A5C(&qword_1000B34A0);
    v4 = static _SetStorage.convert(_:capacity:)(a1, a2);
    v23 = v4;
    v5 = __CocoaSet.makeIterator()(a1);
    v6 = __CocoaSet.Iterator.next()();
    if (v6)
    {
      v7 = v6;
      v8 = sub_100061BA4(0, &qword_1000B33D0, FMFFence_ptr);
      do
      {
        v21 = v7;
        swift_dynamicCast(&v22, &v21, (char *)&type metadata for Swift.AnyObject + 8, v8, 7);
        v4 = v23;
        v16 = *(_QWORD *)(v23 + 16);
        if (*(_QWORD *)(v23 + 24) <= v16)
        {
          sub_10005DCF0(v16 + 1);
          v4 = v23;
        }
        v9 = v22;
        result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v4 + 40));
        v11 = v4 + 56;
        v12 = -1 << *(_BYTE *)(v4 + 32);
        v13 = result & ~v12;
        v14 = v13 >> 6;
        if (((-1 << v13) & ~*(_QWORD *)(v4 + 56 + 8 * (v13 >> 6))) != 0)
        {
          v15 = __clz(__rbit64((-1 << v13) & ~*(_QWORD *)(v4 + 56 + 8 * (v13 >> 6)))) | v13 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v17 = 0;
          v18 = (unint64_t)(63 - v12) >> 6;
          do
          {
            if (++v14 == v18 && (v17 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v19 = v14 == v18;
            if (v14 == v18)
              v14 = 0;
            v17 |= v19;
            v20 = *(_QWORD *)(v11 + 8 * v14);
          }
          while (v20 == -1);
          v15 = __clz(__rbit64(~v20)) + (v14 << 6);
        }
        *(_QWORD *)(v11 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
        *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = v9;
        ++*(_QWORD *)(v4 + 16);
        v7 = __CocoaSet.Iterator.next()();
      }
      while (v7);
    }
    swift_release(v5);
  }
  else
  {
    swift_unknownObjectRelease(a1);
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v4;
}

Swift::Int sub_10005DCF0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_100056A5C(&qword_1000B34A0);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1);
  v6 = v5;
  if (*(_QWORD *)(v3 + 16))
  {
    v30 = v2;
    v7 = 1 << *(_BYTE *)(v3 + 32);
    v8 = (_QWORD *)(v3 + 56);
    if (v7 < 64)
      v9 = ~(-1 << v7);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v3 + 56);
    v11 = (unint64_t)(v7 + 63) >> 6;
    v12 = v5 + 56;
    result = swift_retain(v3);
    v14 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v14 << 6);
      }
      else
      {
        v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v18 >= v11)
          goto LABEL_36;
        v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v11)
            goto LABEL_36;
          v19 = v8[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v11)
              goto LABEL_36;
            v19 = v8[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_36:
                swift_release(v3);
                v2 = v30;
                v29 = 1 << *(_BYTE *)(v3 + 32);
                if (v29 > 63)
                  bzero((void *)(v3 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v8 = -1 << v29;
                *(_QWORD *)(v3 + 16) = 0;
                break;
              }
              v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_42;
                  if (v14 >= v11)
                    goto LABEL_36;
                  v19 = v8[v14];
                  ++v20;
                  if (v19)
                    goto LABEL_26;
                }
              }
              v14 = v20;
            }
          }
        }
LABEL_26:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v17);
      result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v6 + 40));
      v22 = -1 << *(_BYTE *)(v6 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v21;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release(v3);
  *v2 = v6;
  return result;
}

uint64_t sub_10005DF8C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t result;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, unint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  int64_t v38;
  _QWORD *v39;
  uint64_t v40;

  v2 = v1;
  v4 = type metadata accessor for PersonHandle(0);
  v40 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v2;
  if (*(_QWORD *)(*v2 + 24) > a1)
    a1 = *(_QWORD *)(*v2 + 24);
  sub_100056A5C(&qword_1000B34E0);
  v8 = static _SetStorage.resize(original:capacity:move:)(v7, a1, 1);
  v9 = v8;
  if (!*(_QWORD *)(v7 + 16))
    goto LABEL_39;
  v10 = 1 << *(_BYTE *)(v7 + 32);
  v11 = *(_QWORD *)(v7 + 56);
  v39 = (_QWORD *)(v7 + 56);
  if (v10 < 64)
    v12 = ~(-1 << v10);
  else
    v12 = -1;
  v13 = v12 & v11;
  v37 = v2;
  v38 = (unint64_t)(v10 + 63) >> 6;
  v14 = v8 + 56;
  result = swift_retain(v7);
  v16 = 0;
  while (1)
  {
    if (v13)
    {
      v18 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v19 = v18 | (v16 << 6);
      goto LABEL_26;
    }
    v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
      return result;
    }
    if (v20 >= v38)
      goto LABEL_35;
    v21 = v39[v20];
    ++v16;
    if (!v21)
    {
      v16 = v20 + 1;
      if (v20 + 1 >= v38)
        goto LABEL_35;
      v21 = v39[v16];
      if (!v21)
      {
        v16 = v20 + 2;
        if (v20 + 2 >= v38)
          goto LABEL_35;
        v21 = v39[v16];
        if (!v21)
          break;
      }
    }
LABEL_25:
    v13 = (v21 - 1) & v21;
    v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_26:
    v23 = v7;
    v24 = *(_QWORD *)(v7 + 48);
    v25 = *(_QWORD *)(v40 + 72);
    v26 = *(void (**)(char *, unint64_t, uint64_t))(v40 + 32);
    v26(v6, v24 + v25 * v19, v4);
    v27 = *(_QWORD *)(v9 + 40);
    v28 = sub_100061F4C(&qword_1000B34C8, (uint64_t (*)(uint64_t))&type metadata accessor for PersonHandle, (uint64_t)&protocol conformance descriptor for PersonHandle);
    result = dispatch thunk of Hashable._rawHashValue(seed:)(v27, v4, v28);
    v29 = -1 << *(_BYTE *)(v9 + 32);
    v30 = result & ~v29;
    v31 = v30 >> 6;
    if (((-1 << v30) & ~*(_QWORD *)(v14 + 8 * (v30 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v30) & ~*(_QWORD *)(v14 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v32 = 0;
      v33 = (unint64_t)(63 - v29) >> 6;
      do
      {
        if (++v31 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_40;
        }
        v34 = v31 == v33;
        if (v31 == v33)
          v31 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v14 + 8 * v31);
      }
      while (v35 == -1);
      v17 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(_QWORD *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(_QWORD *)(v9 + 48) + v17 * v25, v6, v4);
    ++*(_QWORD *)(v9 + 16);
    v7 = v23;
  }
  v22 = v20 + 3;
  if (v22 < v38)
  {
    v21 = v39[v22];
    if (!v21)
    {
      while (1)
      {
        v16 = v22 + 1;
        if (__OFADD__(v22, 1))
          goto LABEL_41;
        if (v16 >= v38)
          goto LABEL_35;
        v21 = v39[v16];
        ++v22;
        if (v21)
          goto LABEL_25;
      }
    }
    v16 = v22;
    goto LABEL_25;
  }
LABEL_35:
  swift_release(v7);
  v2 = v37;
  v36 = 1 << *(_BYTE *)(v7 + 32);
  if (v36 > 63)
    bzero(v39, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v39 = -1 << v36;
  *(_QWORD *)(v7 + 16) = 0;
LABEL_39:
  result = swift_release(v7);
  *v2 = v9;
  return result;
}

unint64_t sub_10005E2F8(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;
  unint64_t result;

  v4 = NSObject._rawHashValue(seed:)(*(_QWORD *)(a2 + 40));
  result = _HashTable.nextHole(atOrAfter:)(v4 & ~(-1 << *(_BYTE *)(a2 + 32)), a2 + 56, ~(-1 << *(_BYTE *)(a2 + 32)));
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

void sub_10005E378(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Swift::Int v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v4 = v3;
  v7 = *(_QWORD *)(*v3 + 16);
  v8 = *(_QWORD *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0)
    goto LABEL_14;
  v9 = v7 + 1;
  if ((a3 & 1) != 0)
  {
    sub_10005DCF0(v9);
  }
  else
  {
    if (v8 > v7)
    {
      sub_10005E700();
      goto LABEL_14;
    }
    sub_10005EACC(v9);
  }
  v10 = *v3;
  v11 = NSObject._rawHashValue(seed:)(*(_QWORD *)(*v3 + 40));
  v12 = -1 << *(_BYTE *)(v10 + 32);
  a2 = v11 & ~v12;
  if (((*(_QWORD *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v13 = sub_100061BA4(0, &qword_1000B33D0, FMFFence_ptr);
    v14 = *(id *)(*(_QWORD *)(v10 + 48) + 8 * a2);
    v15 = static NSObject.== infix(_:_:)();

    if ((v15 & 1) != 0)
    {
LABEL_13:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v13);
      __break(1u);
    }
    else
    {
      v16 = ~v12;
      while (1)
      {
        a2 = (a2 + 1) & v16;
        if (((*(_QWORD *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v17 = *(id *)(*(_QWORD *)(v10 + 48) + 8 * a2);
        v18 = static NSObject.== infix(_:_:)();

        if ((v18 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v19 = *v4;
  *(_QWORD *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v19 + 48) + 8 * a2) = a1;
  v20 = *(_QWORD *)(v19 + 16);
  v21 = __OFADD__(v20, 1);
  v22 = v20 + 1;
  if (v21)
    __break(1u);
  else
    *(_QWORD *)(v19 + 16) = v22;
}

uint64_t sub_10005E4FC(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, unint64_t, uint64_t);
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;

  v30 = a1;
  v6 = type metadata accessor for PersonHandle(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v29 = v3;
  if (v11 > v10 && (a3 & 1) != 0)
    goto LABEL_12;
  v12 = v10 + 1;
  if ((a3 & 1) != 0)
  {
    sub_10005DF8C(v12);
  }
  else
  {
    if (v11 > v10)
    {
      sub_10005E8A8();
      goto LABEL_12;
    }
    sub_10005ED44(v12);
  }
  v13 = *v3;
  v14 = *(_QWORD *)(*v3 + 40);
  v15 = sub_100061F4C(&qword_1000B34C8, (uint64_t (*)(uint64_t))&type metadata accessor for PersonHandle, (uint64_t)&protocol conformance descriptor for PersonHandle);
  v16 = dispatch thunk of Hashable._rawHashValue(seed:)(v14, v6, v15);
  v17 = -1 << *(_BYTE *)(v13 + 32);
  a2 = v16 & ~v17;
  if (((*(_QWORD *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v18 = ~v17;
    v19 = *(_QWORD *)(v7 + 72);
    v20 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v20(v9, *(_QWORD *)(v13 + 48) + v19 * a2, v6);
      v21 = sub_100061F4C(&qword_1000B34D0, (uint64_t (*)(uint64_t))&type metadata accessor for PersonHandle, (uint64_t)&protocol conformance descriptor for PersonHandle);
      v22 = dispatch thunk of static Equatable.== infix(_:_:)(v9, v30, v6, v21);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v22 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v18;
    }
    while (((*(_QWORD *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v23 = v30;
  v24 = *v29;
  *(_QWORD *)(*v29 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v24 + 48) + *(_QWORD *)(v7 + 72) * a2, v23, v6);
  v26 = *(_QWORD *)(v24 + 16);
  v27 = __OFADD__(v26, 1);
  v28 = v26 + 1;
  if (!v27)
  {
    *(_QWORD *)(v24 + 16) = v28;
    return result;
  }
  __break(1u);
LABEL_15:
  result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v6);
  __break(1u);
  return result;
}

id sub_10005E700()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  sub_100056A5C(&qword_1000B34A0);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_28;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
      {
        v9 = v18 + 2;
        if (v18 + 2 >= v13)
          goto LABEL_28;
        v19 = *(_QWORD *)(v6 + 8 * v9);
        if (!v19)
          break;
      }
    }
LABEL_27:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = v17;
  }
  v20 = v18 + 3;
  if (v20 >= v13)
    goto LABEL_28;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_10005E8A8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  uint64_t v10;
  unint64_t v11;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;

  v1 = v0;
  v2 = type metadata accessor for PersonHandle(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100056A5C(&qword_1000B34E0);
  v6 = *v0;
  v7 = static _SetStorage.copy(original:)(*v0);
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release(v6);
LABEL_30:
    *v1 = v8;
    return result;
  }
  v25 = v1;
  result = (void *)(v7 + 56);
  v10 = v6 + 56;
  v11 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v11)
    result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  v13 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v14 = 1 << *(_BYTE *)(v6 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v6 + 56);
  v17 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v19 = v18 | (v13 << 6);
      goto LABEL_12;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v21 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v17)
        goto LABEL_28;
      v22 = *(_QWORD *)(v10 + 8 * v13);
      if (!v22)
      {
        v13 = v21 + 2;
        if (v21 + 2 >= v17)
          goto LABEL_28;
        v22 = *(_QWORD *)(v10 + 8 * v13);
        if (!v22)
          break;
      }
    }
LABEL_27:
    v16 = (v22 - 1) & v22;
    v19 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_12:
    v20 = *(_QWORD *)(v3 + 72) * v19;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v20, v2);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v20, v5, v2);
  }
  v23 = v21 + 3;
  if (v23 >= v17)
  {
LABEL_28:
    result = (void *)swift_release(v6);
    v1 = v25;
    goto LABEL_30;
  }
  v22 = *(_QWORD *)(v10 + 8 * v23);
  if (v22)
  {
    v13 = v23;
    goto LABEL_27;
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_27;
  }
LABEL_32:
  __break(1u);
  return result;
}

Swift::Int sub_10005EACC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  Swift::Int v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_100056A5C(&qword_1000B34A0);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0);
  v6 = v5;
  if (!*(_QWORD *)(v3 + 16))
  {
    result = swift_release(v3);
LABEL_38:
    *v2 = v6;
    return result;
  }
  v30 = v2;
  v7 = 1 << *(_BYTE *)(v3 + 32);
  v8 = v3 + 56;
  if (v7 < 64)
    v9 = ~(-1 << v7);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v3 + 56);
  v11 = (unint64_t)(v7 + 63) >> 6;
  v12 = v5 + 56;
  result = swift_retain(v3);
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v14 << 6);
      goto LABEL_27;
    }
    v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v18 >= v11)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      v14 = v18 + 1;
      if (v18 + 1 >= v11)
        goto LABEL_36;
      v19 = *(_QWORD *)(v8 + 8 * v14);
      if (!v19)
      {
        v14 = v18 + 2;
        if (v18 + 2 >= v11)
          goto LABEL_36;
        v19 = *(_QWORD *)(v8 + 8 * v14);
        if (!v19)
          break;
      }
    }
LABEL_26:
    v10 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_27:
    v21 = *(_QWORD *)(v6 + 40);
    v22 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v17);
    result = NSObject._rawHashValue(seed:)(v21);
    v23 = -1 << *(_BYTE *)(v6 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v12 + 8 * (v24 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v12 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v28 = v25 == v27;
        if (v25 == v27)
          v25 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v25);
      }
      while (v29 == -1);
      v15 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v22;
    ++*(_QWORD *)(v6 + 16);
  }
  v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_36:
    result = swift_release_n(v3, 2);
    v2 = v30;
    goto LABEL_38;
  }
  v19 = *(_QWORD *)(v8 + 8 * v20);
  if (v19)
  {
    v14 = v20;
    goto LABEL_26;
  }
  while (1)
  {
    v14 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v14 >= v11)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v14);
    ++v20;
    if (v19)
      goto LABEL_26;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_10005ED44(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t result;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  int64_t v37;

  v2 = v1;
  v4 = type metadata accessor for PersonHandle(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v2;
  if (*(_QWORD *)(*v2 + 24) > a1)
    a1 = *(_QWORD *)(*v2 + 24);
  sub_100056A5C(&qword_1000B34E0);
  v9 = static _SetStorage.resize(original:capacity:move:)(v8, a1, 0);
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
  {
    result = swift_release(v8);
LABEL_37:
    *v2 = v10;
    return result;
  }
  v11 = 1 << *(_BYTE *)(v8 + 32);
  v12 = *(_QWORD *)(v8 + 56);
  v35 = v2;
  v36 = v8 + 56;
  if (v11 < 64)
    v13 = ~(-1 << v11);
  else
    v13 = -1;
  v14 = v13 & v12;
  v37 = (unint64_t)(v11 + 63) >> 6;
  v15 = v9 + 56;
  result = swift_retain(v8);
  v17 = 0;
  while (1)
  {
    if (v14)
    {
      v19 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v20 = v19 | (v17 << 6);
      goto LABEL_26;
    }
    v21 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v21 >= v37)
      goto LABEL_35;
    v22 = *(_QWORD *)(v36 + 8 * v21);
    ++v17;
    if (!v22)
    {
      v17 = v21 + 1;
      if (v21 + 1 >= v37)
        goto LABEL_35;
      v22 = *(_QWORD *)(v36 + 8 * v17);
      if (!v22)
      {
        v17 = v21 + 2;
        if (v21 + 2 >= v37)
          goto LABEL_35;
        v22 = *(_QWORD *)(v36 + 8 * v17);
        if (!v22)
          break;
      }
    }
LABEL_25:
    v14 = (v22 - 1) & v22;
    v20 = __clz(__rbit64(v22)) + (v17 << 6);
LABEL_26:
    v24 = *(_QWORD *)(v5 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v7, *(_QWORD *)(v8 + 48) + v24 * v20, v4);
    v25 = *(_QWORD *)(v10 + 40);
    v26 = sub_100061F4C(&qword_1000B34C8, (uint64_t (*)(uint64_t))&type metadata accessor for PersonHandle, (uint64_t)&protocol conformance descriptor for PersonHandle);
    result = dispatch thunk of Hashable._rawHashValue(seed:)(v25, v4, v26);
    v27 = -1 << *(_BYTE *)(v10 + 32);
    v28 = result & ~v27;
    v29 = v28 >> 6;
    if (((-1 << v28) & ~*(_QWORD *)(v15 + 8 * (v28 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v28) & ~*(_QWORD *)(v15 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v30 = 0;
      v31 = (unint64_t)(63 - v27) >> 6;
      do
      {
        if (++v29 == v31 && (v30 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v32 = v29 == v31;
        if (v29 == v31)
          v29 = 0;
        v30 |= v32;
        v33 = *(_QWORD *)(v15 + 8 * v29);
      }
      while (v33 == -1);
      v18 = __clz(__rbit64(~v33)) + (v29 << 6);
    }
    *(_QWORD *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32))(*(_QWORD *)(v10 + 48) + v18 * v24, v7, v4);
    ++*(_QWORD *)(v10 + 16);
  }
  v23 = v21 + 3;
  if (v23 >= v37)
  {
LABEL_35:
    result = swift_release_n(v8, 2);
    v2 = v35;
    goto LABEL_37;
  }
  v22 = *(_QWORD *)(v36 + 8 * v23);
  if (v22)
  {
    v17 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v17 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v17 >= v37)
      goto LABEL_35;
    v22 = *(_QWORD *)(v36 + 8 * v17);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_10005F06C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_10005F5C4(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_10005F088(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_10005F730(a1, a2, a3, (_QWORD *)*v3, &qword_1000B34E8, (uint64_t (*)(_QWORD))&type metadata accessor for PersonHandle);
  *v3 = result;
  return result;
}

uint64_t sub_10005F0B8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = v0[4];
  v3 = v0[5];
  v5 = v0[6];
  v4 = v0[7];
  v6 = (_QWORD *)swift_task_alloc(dword_1000B333C);
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_1000630F0;
  return sub_100059344((uint64_t)v6, v7, v8, v2, v3, v5, v4);
}

unint64_t sub_10005F11C()
{
  unint64_t result;

  result = qword_1000B3348;
  if (!qword_1000B3348)
  {
    result = swift_getWitnessTable(&unk_100076800, &type metadata for FindMyLocateShims.Error);
    atomic_store(result, (unint64_t *)&qword_1000B3348);
  }
  return result;
}

uint64_t sub_10005F164()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;

  v2 = *(_QWORD *)(type metadata accessor for UUID(0) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = *(_QWORD *)(type metadata accessor for Fence.TriggerPosition(0) - 8);
  v6 = (v3 + v4 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = *(_QWORD *)(v0 + 32);
  v8 = v0 + v3;
  v9 = v0 + v6;
  v10 = (uint64_t *)(v0 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));
  v11 = *v10;
  v12 = v10[1];
  v13 = (_QWORD *)swift_task_alloc(dword_1000B335C);
  *(_QWORD *)(v1 + 16) = v13;
  *v13 = v1;
  v13[1] = sub_1000630F0;
  return sub_10005A1E0((uint64_t)v13, v14, v15, v7, v8, v9, v11, v12);
}

uint64_t sub_10005F228(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100056A5C(&qword_1000B3368);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10005F274(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100056A5C(&qword_1000B3368);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10005F2BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v2 = *(_QWORD *)(sub_100056A5C(&qword_1000B3368) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = *(_QWORD *)(v0 + 32);
  v6 = *(_QWORD *)(v0 + 40);
  v7 = *(_QWORD *)(v0 + v4);
  v8 = v0 + v3;
  v9 = *(_QWORD *)(v0 + ((v4 + 15) & 0xFFFFFFFFFFFFFFF8));
  v10 = (_QWORD *)swift_task_alloc(dword_1000B3374);
  *(_QWORD *)(v1 + 16) = v10;
  *v10 = v1;
  v10[1] = sub_1000630F0;
  return sub_10005A93C((uint64_t)v10, v11, v12, v5, v6, v8, v7, v9);
}

uint64_t type metadata accessor for FindMyLocateShims()
{
  return objc_opt_self(_TtC4fmfd17FindMyLocateShims);
}

uint64_t sub_10005F394(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 1u)
    return swift_bridgeObjectRetain(a2);
  return result;
}

uint64_t destroy for FindMyLocateShims.Error(uint64_t a1)
{
  return sub_10005F3BC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_10005F3BC(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 1u)
    return swift_bridgeObjectRelease(a2);
  return result;
}

uint64_t _s4fmfd17FindMyLocateShimsC5ErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_10005F394(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for FindMyLocateShims.Error(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_10005F394(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_10005F3BC(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for FindMyLocateShims.Error(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for FindMyLocateShims.Error(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_10005F3BC(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for FindMyLocateShims.Error(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for FindMyLocateShims.Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_10005F554(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_10005F570(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for FindMyLocateShims.Error()
{
  return &type metadata for FindMyLocateShims.Error;
}

uint64_t sub_10005F598(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_10005F730(a1, a2, a3, (_QWORD *)*v3, &qword_1000B34D8, (uint64_t (*)(_QWORD))&type metadata accessor for Fence);
  *v3 = result;
  return result;
}

uint64_t sub_10005F5C4(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_100056A5C(&qword_1000B34B0);
    v11 = (char *)swift_allocObject(v10, 32 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 1;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 5);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[32 * v8])
      memmove(v14, v15, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v15 >= &v14[32 * v8] || v14 >= &v15[32 * v8])
  {
    swift_arrayInitWithCopy(v14);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10005F730(char a1, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  size_t v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char *v27;
  unint64_t v28;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (!v12)
  {
    v18 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v13 = sub_100056A5C(a5);
  v14 = *(_QWORD *)(a6(0) - 8);
  v15 = *(_QWORD *)(v14 + 72);
  v16 = *(unsigned __int8 *)(v14 + 80);
  v17 = (v16 + 32) & ~v16;
  v18 = (_QWORD *)swift_allocObject(v13, v17 + v15 * v12, v16 | 7);
  v19 = j__malloc_size(v18);
  if (!v15)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v19 - v17 == 0x8000000000000000 && v15 == -1)
    goto LABEL_34;
  v18[2] = v11;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v15);
LABEL_19:
  v21 = a6(0);
  v22 = *(_QWORD *)(v21 - 8);
  v23 = (*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  v24 = (char *)v18 + v23;
  v25 = (char *)a4 + v23;
  if ((a1 & 1) != 0)
  {
    if (v18 < a4 || v24 >= &v25[*(_QWORD *)(v22 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack(v24, v25, v11, v21);
    }
    else if (v18 != a4)
    {
      swift_arrayInitWithTakeBackToFront(v24);
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v26 = *(_QWORD *)(v22 + 72) * v11;
  v27 = &v24[v26];
  v28 = (unint64_t)&v25[v26];
  if (v25 >= v27 || (unint64_t)v24 >= v28)
  {
    swift_arrayInitWithCopy(v24);
LABEL_32:
    swift_release(a4);
    return (uint64_t)v18;
  }
LABEL_36:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10005F910(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t, __n128);
  __n128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v4 = type metadata accessor for PersonHandle(0);
  v30 = *(_QWORD *)(v4 - 8);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v25 - v8;
  if (!*(_QWORD *)(a2 + 16))
    return 1;
  v26 = *(_QWORD *)(a1 + 16);
  if (!v26)
    return 1;
  v27 = a1 + ((*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80));
  v10 = *(_QWORD *)(v30 + 72);
  v11 = *(void (**)(char *, uint64_t, uint64_t, __n128))(v30 + 16);
  v29 = a2 + 56;
  v25 = a1;
  v12 = swift_bridgeObjectRetain(a1);
  v13 = 0;
  while (1)
  {
    v28 = v13;
    v11(v9, v27 + v10 * v13, v4, v12);
    if (*(_QWORD *)(a2 + 16))
    {
      v14 = *(_QWORD *)(a2 + 40);
      v15 = sub_100061F4C(&qword_1000B34C8, (uint64_t (*)(uint64_t))&type metadata accessor for PersonHandle, (uint64_t)&protocol conformance descriptor for PersonHandle);
      v16 = dispatch thunk of Hashable._rawHashValue(seed:)(v14, v4, v15);
      v17 = -1 << *(_BYTE *)(a2 + 32);
      v18 = v16 & ~v17;
      if (((*(_QWORD *)(v29 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) != 0)
        break;
    }
LABEL_4:
    v13 = v28 + 1;
    (*(void (**)(char *, uint64_t))(v30 + 8))(v9, v4);
    if (v13 == v26)
    {
      v23 = 1;
      goto LABEL_13;
    }
  }
  v19 = ~v17;
  while (1)
  {
    ((void (*)(char *, unint64_t, uint64_t))v11)(v7, *(_QWORD *)(a2 + 48) + v18 * v10, v4);
    v20 = sub_100061F4C(&qword_1000B34D0, (uint64_t (*)(uint64_t))&type metadata accessor for PersonHandle, (uint64_t)&protocol conformance descriptor for PersonHandle);
    v21 = dispatch thunk of static Equatable.== infix(_:_:)(v7, v9, v4, v20);
    v22 = *(void (**)(char *, uint64_t))(v30 + 8);
    v22(v7, v4);
    if ((v21 & 1) != 0)
      break;
    v18 = (v18 + 1) & v19;
    if (((*(_QWORD *)(v29 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) == 0)
      goto LABEL_4;
  }
  v22(v9, v4);
  v23 = 0;
LABEL_13:
  swift_bridgeObjectRelease(v25);
  return v23;
}

uint64_t sub_10005FB5C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 24) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 32) = v3;
  *v3 = v2;
  v3[1] = sub_10005FBC4;
  return v5(v2 + 16);
}

uint64_t sub_10005FBC4()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  v1 = *v0;
  v2 = *(_QWORD **)(*v0 + 24);
  v4 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 32));
  *v2 = *(_QWORD *)(v1 + 16);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t sub_10005FC14(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else
  {
    if (v4 < 0)
    {
      result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
      goto LABEL_9;
    }
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy(a3);
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_10005FD04(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void **v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;

  v2 = (unint64_t)a1 >> 62;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v13 = a1;
    else
      v13 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v3 = _CocoaArrayWrapper.endIndex.getter(v13);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = sub_100061BA4(0, &qword_1000B33D0, FMFFence_ptr);
  v5 = sub_100061BDC();
  result = Set.init(minimumCapacity:)(v3, v4, v5);
  v15 = result;
  if (v2)
  {
    if (a1 < 0)
      v8 = a1;
    else
      v8 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v7 = _CocoaArrayWrapper.endIndex.getter(v8);
    result = swift_bridgeObjectRelease(a1);
    if (!v7)
      return v15;
  }
  else
  {
    v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return v15;
  }
  if (v7 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v7; ++i)
      {
        v10 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)(i, a1);
        sub_10005D860((Swift::Int *)&v14, v10);

      }
    }
    else
    {
      v11 = (void **)(a1 + 32);
      do
      {
        v12 = *v11++;
        sub_10005D860((Swift::Int *)&v14, v12);

        --v7;
      }
      while (v7);
    }
    return v15;
  }
  __break(1u);
  return result;
}

uint64_t sub_10005FE5C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v4 < 0)
  {
LABEL_9:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v8 = *(_QWORD *)(type metadata accessor for PersonHandle(0) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = *(_QWORD *)(v8 + 72);
  v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
  v12 = v10 * v4;
  v13 = a3 + v12;
  v14 = v11 + v12;
  if (v11 >= v13 || v14 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v13;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t *sub_10005FF74(void **a1)
{
  __objc2_prop *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  unsigned int v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t *result;
  uint64_t v20;
  unint64_t *v21;
  void **v22;
  unint64_t *v23;
  unint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t *v30;
  NSString v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void **v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  unint64_t *v45;
  id v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  id v50;
  uint64_t v51;
  __n128 v52;
  unint64_t *v53;
  uint64_t v54;
  char *v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t *v58;
  NSString v59;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  os_log_type_t v69;
  uint64_t v70;
  uint8_t *v71;
  unint64_t *v72;
  uint64_t v73;
  unint64_t *v74;
  uint8_t *v75;
  void (*v76)(char *, char *, uint64_t);
  char *v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  __n128 v84;
  void **v85;
  uint8_t *v86;
  char *v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t *v93;

  v3 = sub_100056A5C(&qword_1000B3500);
  __chkstk_darwin(v3);
  v5 = (char *)&v82 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for PersonHandle(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v88 = (char *)&v82 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v8);
  v87 = (char *)&v82 - v11;
  __chkstk_darwin(v10);
  v13 = (char *)&v82 - v12;
  if (objc_msgSend(a1, "isOnMe"))
  {
    v14 = objc_msgSend(a1, "isFromMe");
    v89 = v7;
    v90 = v6;
    if (v14)
    {
      v15 = objc_msgSend(a1, "recipients");
      v16 = sub_100061BA4(0, &qword_1000B33C0, FMFHandle_ptr);
      v17 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v15, v16);

      if ((unint64_t)v17 >> 62)
      {
        if (v17 < 0)
          v81 = v17;
        else
          v81 = v17 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v17);
        v18 = _CocoaArrayWrapper.endIndex.getter(v81);
        swift_bridgeObjectRelease(v17);
        if (v18)
          goto LABEL_5;
      }
      else
      {
        v18 = *(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (v18)
        {
LABEL_5:
          v93 = (unint64_t *)&_swiftEmptyArrayStorage;
          a1 = (void **)&v93;
          result = (unint64_t *)sub_10005F088(0, v18 & ~(v18 >> 63), 0);
          if ((v18 & 0x8000000000000000) == 0)
          {
            v20 = 0;
            v21 = v93;
            while (v18 != v20)
            {
              if ((v17 & 0xC000000000000001) != 0)
                v22 = (void **)specialized _ArrayBuffer._getElementSlowPath(_:)(v20, v17);
              else
                v22 = (void **)*(id *)(v17 + 8 * v20 + 32);
              a1 = v22;
              v23 = v21;
              result = (unint64_t *)objc_msgSend(v22, "identifier");
              if (!result)
                goto LABEL_58;
              v24 = result;
              v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(result);
              v27 = v26;

              PersonHandle.init(id:)(v25, v27);
              v21 = v23;
              v93 = v23;
              v29 = v23[2];
              v28 = v23[3];
              v1 = (__objc2_prop *)(v29 + 1);
              if (v29 >= v28 >> 1)
              {
                a1 = (void **)&v93;
                sub_10005F088(v28 > 1, v29 + 1, 1);
                v21 = v93;
              }
              ++v20;
              v21[2] = (unint64_t)v1;
              (*(void (**)(unint64_t, char *, uint64_t))(v89 + 32))((unint64_t)v21+ ((*(unsigned __int8 *)(v89 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v89 + 80))+ *(_QWORD *)(v89 + 72) * v29, v13, v90);
              if (v18 == v20)
              {
                swift_bridgeObjectRelease(v17);
                return v21;
              }
            }
            __break(1u);
LABEL_48:
            swift_once(&qword_1000B3890, sub_1000545D8);
LABEL_23:
            v40 = type metadata accessor for Logger(0);
            sub_100061F8C(v40, (uint64_t)qword_1000B3898);
            v41 = a1;
            v42 = Logger.logObject.getter(v41);
            v43 = static os_log_type_t.error.getter();
            if (os_log_type_enabled(v42, v43))
            {
              v44 = (uint8_t *)swift_slowAlloc(12, -1);
              v45 = (unint64_t *)swift_slowAlloc(32, -1);
              v93 = v45;
              *(_DWORD *)v44 = 136380675;
              v46 = objc_msgSend(v41, v1[234].name);
              v47 = static String._unconditionallyBridgeFromObjectiveC(_:)(v46);
              v49 = v48;

              v92 = sub_10005D220(v47, v49, (uint64_t *)&v93);
              UnsafeMutableRawBufferPointer.copyMemory(from:)(&v92, &v93, v44 + 4, v44 + 12);

              swift_bridgeObjectRelease(v49);
              _os_log_impl((void *)&_mh_execute_header, v42, v43, "Couldn't find handle for friendIdentifier=%{private}s", v44, 0xCu);
              swift_arrayDestroy(v45, 1, (char *)&type metadata for Any + 8);
              swift_slowDealloc(v45, -1, -1);
              swift_slowDealloc(v44, -1, -1);

            }
            else
            {

            }
            return (unint64_t *)&_swiftEmptyArrayStorage;
          }
          __break(1u);
          goto LABEL_57;
        }
      }
    }
    else
    {
      v50 = objc_msgSend(a1, "followerIds");
      v17 = ((uint64_t (*)(void))static Array._unconditionallyBridgeFromObjectiveC(_:))();

      v51 = *(_QWORD *)(v17 + 16);
      if (v51)
      {
        v85 = (void **)&v93;
        v52 = swift_bridgeObjectRetain(v17);
        v21 = (unint64_t *)&_swiftEmptyArrayStorage;
        v82 = v17;
        v53 = (unint64_t *)(v17 + 40);
        v52.n128_u64[0] = 136380675;
        v84 = v52;
        v83 = (char *)&type metadata for Any + 8;
        while (1)
        {
          v91 = v51;
          v55 = v5;
          v57 = *(v53 - 1);
          v56 = *v53;
          result = (unint64_t *)objc_msgSend((id)objc_opt_self(FMFDataManager), "sharedInstance");
          if (!result)
            break;
          v58 = result;
          v59 = String._bridgeToObjectiveC()();
          v60 = objc_msgSend(v58, "followerHandleForServerId:", v59);

          if (v60
            && (v61 = objc_msgSend(v60, "identifier", v82), v60, v61))
          {
            v62 = static String._unconditionallyBridgeFromObjectiveC(_:)(v61);
            v64 = v63;

            v5 = v55;
            PersonHandle.init(id:)(v62, v64);
            v65 = 0;
          }
          else
          {
            if (qword_1000B3890 != -1)
              swift_once(&qword_1000B3890, sub_1000545D8);
            v66 = type metadata accessor for Logger(0);
            sub_100061F8C(v66, (uint64_t)qword_1000B3898);
            v67 = swift_bridgeObjectRetain_n(v56, 2);
            v68 = Logger.logObject.getter(v67);
            v69 = static os_log_type_t.error.getter();
            if (os_log_type_enabled(v68, v69))
            {
              v71 = (uint8_t *)swift_slowAlloc(12, -1);
              v72 = (unint64_t *)swift_slowAlloc(32, -1);
              v93 = v72;
              *(_DWORD *)v71 = v84.n128_u32[0];
              v86 = v71 + 4;
              swift_bridgeObjectRetain(v56);
              v92 = sub_10005D220(v57, v56, (uint64_t *)&v93);
              UnsafeMutableRawBufferPointer.copyMemory(from:)(&v92, v85, v86, v71 + 12);
              swift_bridgeObjectRelease_n(v56, 3, v73);
              _os_log_impl((void *)&_mh_execute_header, v68, v69, "Couldn't find handle for followerID=%{private}s", v71, 0xCu);
              v65 = 1;
              swift_arrayDestroy(v72, 1, v83);
              v74 = v72;
              v6 = v90;
              swift_slowDealloc(v74, -1, -1);
              v75 = v71;
              v7 = v89;
              swift_slowDealloc(v75, -1, -1);

            }
            else
            {
              swift_bridgeObjectRelease_n(v56, 2, v70);

              v65 = 1;
            }
            v5 = v55;
          }
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, v65, 1, v6);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
          {
            sub_100062278((uint64_t)v5, &qword_1000B3500);
          }
          else
          {
            v76 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
            v77 = v87;
            v76(v87, v5, v6);
            v76(v88, v77, v6);
            if ((swift_isUniquelyReferenced_nonNull_native(v21) & 1) == 0)
              v21 = (unint64_t *)sub_10005D018(0, v21[2] + 1, 1, (unint64_t)v21);
            v79 = v21[2];
            v78 = v21[3];
            if (v79 >= v78 >> 1)
              v21 = (unint64_t *)sub_10005D018(v78 > 1, v79 + 1, 1, (unint64_t)v21);
            v21[2] = v79 + 1;
            v80 = (unint64_t)v21
                + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))
                + *(_QWORD *)(v7 + 72) * v79;
            v6 = v90;
            v76((char *)v80, v88, v90);
          }
          v53 += 2;
          v51 = v91 - 1;
          if (v91 == 1)
          {
            swift_bridgeObjectRelease_n(v82, 2, v54);
            return v21;
          }
        }
LABEL_57:
        __break(1u);
LABEL_58:
        __break(1u);
        goto LABEL_59;
      }
    }
    swift_bridgeObjectRelease(v17);
    return (unint64_t *)&_swiftEmptyArrayStorage;
  }
  result = (unint64_t *)objc_msgSend((id)objc_opt_self(FMFDataManager), "sharedInstance");
  if (result)
  {
    v30 = result;
    v1 = &stru_1000AE000;
    v31 = objc_msgSend(a1, "friendIdentifier");
    if (!v31)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)(0);
      v33 = v32;
      v31 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v33);
    }
    v34 = objc_msgSend(v30, "followingHandleForServerId:", v31);

    if (v34)
    {
      v35 = objc_msgSend(v34, "identifier");

      if (v35)
      {
        v36 = static String._unconditionallyBridgeFromObjectiveC(_:)(v35);
        v38 = v37;

        v39 = sub_100056A5C(&qword_1000B34E8);
        v21 = (unint64_t *)swift_allocObject(v39, ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(_QWORD *)(v7 + 72), *(unsigned __int8 *)(v7 + 80) | 7);
        *((_OWORD *)v21 + 1) = xmmword_1000767B0;
        PersonHandle.init(id:)(v36, v38);
        return v21;
      }
    }
    if (qword_1000B3890 == -1)
      goto LABEL_23;
    goto LABEL_48;
  }
LABEL_59:
  __break(1u);
  return result;
}

uint64_t sub_1000608B0(uint64_t a1, _QWORD *a2, void (**a3)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  int64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  void (*v27)(_QWORD, uint64_t);
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  char *v34;
  void (**v35)(_QWORD, _QWORD, _QWORD);
  _QWORD *v36;
  _QWORD *v37;

  v6 = type metadata accessor for PersonHandle(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100056A5C(&qword_1000B3300);
  __chkstk_darwin(v10);
  v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = swift_allocObject(&unk_10009B438, 24, 7);
  *(_QWORD *)(v13 + 16) = a3;
  if (!a1)
  {
    v27 = *(void (**)(_QWORD, uint64_t))((swift_isaMask & *a2) + 0x70);
    _Block_copy(a3);
    v27(sub_100061B5C, v13);
    return swift_release(v13);
  }
  _Block_copy(a3);
  v14 = sub_100056784(a1, (SEL *)&selRef_identifier);
  v15 = v14;
  v16 = *((_QWORD *)v14 + 2);
  if (v16)
  {
    v34 = v12;
    v35 = a3;
    v36 = a2;
    v37 = _swiftEmptyArrayStorage;
    sub_10005F088(0, v16, 0);
    v17 = v37;
    v18 = v15 + 40;
    do
    {
      v20 = *(v18 - 1);
      v19 = *v18;
      swift_bridgeObjectRetain(*v18);
      PersonHandle.init(id:)(v20, v19);
      v37 = v17;
      v22 = v17[2];
      v21 = v17[3];
      if (v22 >= v21 >> 1)
      {
        sub_10005F088(v21 > 1, v22 + 1, 1);
        v17 = v37;
      }
      v18 += 2;
      v17[2] = v22 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))((unint64_t)v17+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(_QWORD *)(v7 + 72) * v22, v9, v6);
      --v16;
    }
    while (v16);
    swift_bridgeObjectRelease(v15);
    a3 = v35;
    a2 = v36;
    v12 = v34;
    if (v17[2])
      goto LABEL_8;
LABEL_11:
    swift_bridgeObjectRelease(v17);
    v29 = sub_10005F11C();
    v30 = swift_allocError(&type metadata for FindMyLocateShims.Error, v29, 0, 0);
    *(_OWORD *)v31 = xmmword_1000767A0;
    *(_BYTE *)(v31 + 16) = 2;
    v32 = (void *)_convertErrorToNSError(_:)(v30);
    ((void (**)(_QWORD, _QWORD, void *))a3)[2](a3, 0, v32);

    swift_errorRelease(v30);
    return swift_release(v13);
  }
  swift_bridgeObjectRelease(v14);
  v17 = _swiftEmptyArrayStorage;
  if (!_swiftEmptyArrayStorage[2])
    goto LABEL_11;
LABEL_8:
  v23 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v12, 1, 1, v23);
  v24 = (_QWORD *)swift_allocObject(&unk_10009B460, 64, 7);
  v24[2] = 0;
  v24[3] = 0;
  v24[4] = a2;
  v24[5] = v17;
  v24[6] = sub_100061B5C;
  v24[7] = v13;
  v25 = a2;
  swift_retain(v13);
  v26 = sub_100054D80((uint64_t)v12, (uint64_t)&unk_1000B33C8, (uint64_t)v24);
  swift_release(v26);
  return swift_release(v13);
}

char *sub_100060BDC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *result;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, unint64_t, uint64_t);
  char isUniquelyReferenced_nonNull_native;
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
  void (*v34)(char *, char *, uint64_t);
  char *v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t (*v40)(char *, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(char *, unint64_t, uint64_t);
  uint64_t v58;
  char *v59;

  v45 = a2;
  v4 = type metadata accessor for PersonHandle(0);
  v55 = *(_QWORD *)(v4 - 8);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v38 - v8;
  v50 = type metadata accessor for Fence(0);
  v10 = __chkstk_darwin(v50);
  v44 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v49 = (char *)&v38 - v13;
  result = (char *)_swiftEmptyArrayStorage;
  v59 = (char *)_swiftEmptyArrayStorage;
  v43 = *(_QWORD *)(a1 + 16);
  if (v43)
  {
    v15 = 0;
    v16 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
    v46 = *(_QWORD *)(v12 + 72);
    v38 = v2;
    v39 = v16;
    v41 = a1 + v16;
    v42 = v12;
    v40 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 16);
    do
    {
      v48 = v15;
      v17 = v40(v49, v41 + v46 * v15, v50);
      v18 = Fence.others.getter(v17);
      v19 = *(_QWORD *)(v18 + 16);
      v52 = sub_100061F4C(&qword_1000B34C8, (uint64_t (*)(uint64_t))&type metadata accessor for PersonHandle, (uint64_t)&protocol conformance descriptor for PersonHandle);
      v20 = Set.init(minimumCapacity:)(v19, v4, v52);
      v53 = v19;
      v47 = v18;
      if (v19)
      {
        v21 = 0;
        v51 = v18 + ((*(unsigned __int8 *)(v55 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v55 + 80));
        v22 = *(void (**)(char *, unint64_t, uint64_t))(v55 + 16);
        v56 = *(_QWORD *)(v55 + 72);
        v57 = v22;
        do
        {
          v54 = v21;
          v57(v9, v51 + v56 * v21, v4);
          v26 = *(_QWORD *)(v20 + 40);
          swift_bridgeObjectRetain(v20);
          v27 = dispatch thunk of Hashable._rawHashValue(seed:)(v26, v4, v52);
          v28 = -1 << *(_BYTE *)(v20 + 32);
          v29 = v27 & ~v28;
          if (((*(_QWORD *)(v20 + 56 + ((v29 >> 3) & 0xFFFFFFFFFFFFF8)) >> v29) & 1) != 0)
          {
            v30 = ~v28;
            while (1)
            {
              v57(v7, *(_QWORD *)(v20 + 48) + v29 * v56, v4);
              v31 = sub_100061F4C(&qword_1000B34D0, (uint64_t (*)(uint64_t))&type metadata accessor for PersonHandle, (uint64_t)&protocol conformance descriptor for PersonHandle);
              v32 = dispatch thunk of static Equatable.== infix(_:_:)(v7, v9, v4, v31);
              v24 = *(void (**)(char *, uint64_t))(v55 + 8);
              v24(v7, v4);
              if ((v32 & 1) != 0)
                break;
              v29 = (v29 + 1) & v30;
              if (((*(_QWORD *)(v20 + 56 + ((v29 >> 3) & 0xFFFFFFFFFFFFF8)) >> v29) & 1) == 0)
                goto LABEL_7;
            }
            swift_bridgeObjectRelease(v20);
          }
          else
          {
LABEL_7:
            swift_bridgeObjectRelease(v20);
            isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v20);
            v57(v7, (unint64_t)v9, v4);
            v58 = v20;
            sub_10005E4FC((uint64_t)v7, v29, isUniquelyReferenced_nonNull_native);
            v20 = v58;
            swift_bridgeObjectRelease(0x8000000000000000);
            v24 = *(void (**)(char *, uint64_t))(v55 + 8);
          }
          v25 = v54;
          v24(v9, v4);
          v21 = v25 + 1;
        }
        while (v21 != v53);
      }
      swift_bridgeObjectRelease(v47);
      v33 = sub_10005F910(v45, v20);
      swift_bridgeObjectRelease(v20);
      if ((v33 & 1) != 0)
      {
        v34 = *(void (**)(char *, char *, uint64_t))(v42 + 32);
        v34(v44, v49, v50);
        v35 = v59;
        if ((swift_isUniquelyReferenced_nonNull_native(v59) & 1) == 0)
        {
          sub_10005F598(0, *((_QWORD *)v35 + 2) + 1, 1);
          v35 = v59;
        }
        v37 = *((_QWORD *)v35 + 2);
        v36 = *((_QWORD *)v35 + 3);
        if (v37 >= v36 >> 1)
        {
          sub_10005F598(v36 > 1, v37 + 1, 1);
          v35 = v59;
        }
        *((_QWORD *)v35 + 2) = v37 + 1;
        v34(&v35[v39 + v37 * v46], v44, v50);
        v59 = v35;
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v42 + 8))(v49, v50);
      }
      v15 = v48 + 1;
    }
    while (v48 + 1 != v43);
    return v59;
  }
  return result;
}

uint64_t sub_10006102C(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7, void (**a8)(_QWORD, _QWORD))
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, char *, uint64_t);
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  unsigned int *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  char v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  char *v68;
  void *v69;
  char *v70;
  id v71;
  id v72;
  uint64_t v73;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  void (*v98)(char *, char *, uint64_t);
  uint64_t v99;
  void (**v100)(_QWORD, _QWORD);
  uint64_t v101;
  char *v102;
  uint64_t v103;
  _QWORD *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  id v114;

  v106 = a7;
  v107 = a4;
  v113 = a3;
  v114 = a6;
  v10 = sub_100056A5C(&qword_1000B3300);
  __chkstk_darwin(v10);
  v110 = (uint64_t)&v97 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v108 = type metadata accessor for Fence.TriggerPosition(0);
  v105 = *(_QWORD *)(v108 - 8);
  v12 = *(_QWORD *)(v105 + 64);
  v13 = __chkstk_darwin(v108);
  v111 = (char *)&v97 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v15 = (char *)&v97 - v14;
  v16 = sub_100056A5C(&qword_1000B3350);
  __chkstk_darwin(v16);
  v18 = (char *)&v97 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for UUID(0);
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(_QWORD *)(v20 + 64);
  v22 = __chkstk_darwin(v19);
  __chkstk_darwin(v22);
  v24 = (char *)&v97 - v23;
  v112 = swift_allocObject(&unk_10009B3C0, 24, 7);
  *(_QWORD *)(v112 + 16) = a8;
  _Block_copy(a8);
  v109 = a2;
  v25 = a2;
  v26 = v113;
  UUID.init(uuidString:)(v25, v113);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19) != 1)
  {
    v100 = a8;
    v101 = v21;
    v109 = (char *)&v97 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
    v113 = v12;
    v104 = v15;
    v32 = v108;
    v33 = *(void (**)(char *, char *, uint64_t))(v20 + 32);
    v33(v24, v18, v19);
    if (!v114)
    {
      v53 = sub_10005F11C();
      v54 = swift_allocError(&type metadata for FindMyLocateShims.Error, v53, 0, 0);
      *(_QWORD *)v55 = 0;
      *(_QWORD *)(v55 + 8) = 0;
      *(_BYTE *)(v55 + 16) = 2;
      v56 = (void *)_convertErrorToNSError(_:)(v54);
      ((void (**)(_QWORD, void *))v100)[2](v100, v56);

      (*(void (**)(char *, uint64_t))(v20 + 8))(v24, v19);
      v31 = v54;
      goto LABEL_10;
    }
    v34 = v114;
    v102 = v24;
    v103 = v20;
    v99 = v19;
    v35 = static String._unconditionallyBridgeFromObjectiveC(_:)(FMFFenceTriggerStatusIn);
    v37 = v36;
    v38 = v107;
    v40 = static String._unconditionallyBridgeFromObjectiveC(_:)(v107);
    v41 = v39;
    v98 = v33;
    if (v35 == v40 && v37 == v39)
    {
      v42 = v34;
LABEL_7:
      v44 = (unsigned int *)&enum case for Fence.TriggerPosition.inside(_:);
LABEL_8:
      v45 = v111;
      v46 = v112;
      v47 = v32;
      v48 = v104;
      v49 = v105;
      v51 = v109;
      v50 = v110;
      swift_bridgeObjectRelease_n(v37, 2, v43);
      v52 = v102;
LABEL_15:
      *v48 = v114;
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(v49 + 104))(v48, *v44, v47);
      v59 = type metadata accessor for TaskPriority(0);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v59 - 8) + 56))(v50, 1, 1, v59);
      v60 = v103;
      v61 = v52;
      v62 = v99;
      (*(void (**)(char *, char *, uint64_t))(v103 + 16))(v51, v61, v99);
      (*(void (**)(char *, _QWORD *, uint64_t))(v49 + 16))(v45, v48, v47);
      v63 = *(unsigned __int8 *)(v60 + 80);
      v64 = (v63 + 40) & ~v63;
      v65 = *(unsigned __int8 *)(v49 + 80);
      v66 = (v101 + v65 + v64) & ~v65;
      v67 = (v113 + v66 + 7) & 0xFFFFFFFFFFFFFFF8;
      v68 = (char *)swift_allocObject(&unk_10009B3E8, v67 + 16, v63 | v65 | 7);
      *((_QWORD *)v68 + 2) = 0;
      *((_QWORD *)v68 + 3) = 0;
      v69 = v106;
      *((_QWORD *)v68 + 4) = v106;
      v98(&v68[v64], v51, v62);
      (*(void (**)(char *, char *, uint64_t))(v49 + 32))(&v68[v66], v111, v47);
      v70 = &v68[v67];
      *(_QWORD *)v70 = sub_100063118;
      *((_QWORD *)v70 + 1) = v46;
      v71 = v114;
      v72 = v69;
      swift_retain(v46);
      v73 = sub_100054D80(v110, (uint64_t)&unk_1000B33B8, (uint64_t)v68);
      swift_release(v73);

      (*(void (**)(_QWORD *, uint64_t))(v49 + 8))(v104, v47);
      (*(void (**)(char *, uint64_t))(v103 + 8))(v102, v62);
      return swift_release(v46);
    }
    v57 = _stringCompareWithSmolCheck(_:_:expecting:)(v35, v37, v40, v39, 0);
    v58 = v34;
    swift_bridgeObjectRelease(v41);
    swift_bridgeObjectRelease(v37);
    if ((v57 & 1) != 0)
      goto LABEL_12;
    v75 = static String._unconditionallyBridgeFromObjectiveC(_:)(FMFFenceTriggerStatusEnter);
    v37 = v76;
    v43 = static String._unconditionallyBridgeFromObjectiveC(_:)(v38);
    v78 = v77;
    if (v75 == v43 && v37 == v77)
      goto LABEL_7;
    v79 = _stringCompareWithSmolCheck(_:_:expecting:)(v75, v37, v43, v77, 0);
    swift_bridgeObjectRelease(v78);
    swift_bridgeObjectRelease(v37);
    if ((v79 & 1) != 0)
    {
LABEL_12:
      v44 = (unsigned int *)&enum case for Fence.TriggerPosition.inside(_:);
    }
    else
    {
      v80 = static String._unconditionallyBridgeFromObjectiveC(_:)(FMFFenceTriggerStatusOut);
      v37 = v81;
      v43 = static String._unconditionallyBridgeFromObjectiveC(_:)(v38);
      v83 = v82;
      if (v80 == v43 && v37 == v82)
        goto LABEL_22;
      v84 = _stringCompareWithSmolCheck(_:_:expecting:)(v80, v37, v43, v82, 0);
      swift_bridgeObjectRelease(v83);
      swift_bridgeObjectRelease(v37);
      if ((v84 & 1) == 0)
      {
        v85 = static String._unconditionallyBridgeFromObjectiveC(_:)(FMFFenceTriggerStatusExit);
        v37 = v86;
        v43 = static String._unconditionallyBridgeFromObjectiveC(_:)(v38);
        v88 = v87;
        if (v85 == v43 && v37 == v87)
        {
LABEL_22:
          v44 = (unsigned int *)&enum case for Fence.TriggerPosition.outside(_:);
          goto LABEL_8;
        }
        v89 = _stringCompareWithSmolCheck(_:_:expecting:)(v85, v37, v43, v87, 0);
        swift_bridgeObjectRelease(v88);
        swift_bridgeObjectRelease(v37);
        v45 = v111;
        if ((v89 & 1) == 0)
        {
          v90 = static String._unconditionallyBridgeFromObjectiveC(_:)(v38);
          v92 = v91;
          v93 = sub_10005F11C();
          v94 = swift_allocError(&type metadata for FindMyLocateShims.Error, v93, 0, 0);
          *(_QWORD *)v95 = v90;
          *(_QWORD *)(v95 + 8) = v92;
          *(_BYTE *)(v95 + 16) = 1;
          v96 = (void *)_convertErrorToNSError(_:)(v94);
          ((void (**)(_QWORD, void *))v100)[2](v100, v96);

          (*(void (**)(char *, uint64_t))(v103 + 8))(v102, v99);
          v31 = v94;
          goto LABEL_10;
        }
        v47 = v32;
        v44 = (unsigned int *)&enum case for Fence.TriggerPosition.outside(_:);
        v46 = v112;
        v52 = v102;
LABEL_14:
        v48 = v104;
        v49 = v105;
        v51 = v109;
        v50 = v110;
        goto LABEL_15;
      }
      v44 = (unsigned int *)&enum case for Fence.TriggerPosition.outside(_:);
    }
    v45 = v111;
    v46 = v112;
    v52 = v102;
    v47 = v32;
    goto LABEL_14;
  }
  sub_100062278((uint64_t)v18, &qword_1000B3350);
  v27 = sub_10005F11C();
  v28 = swift_allocError(&type metadata for FindMyLocateShims.Error, v27, 0, 0);
  *(_QWORD *)v29 = v109;
  *(_QWORD *)(v29 + 8) = v26;
  *(_BYTE *)(v29 + 16) = 0;
  swift_bridgeObjectRetain(v26);
  v30 = (void *)_convertErrorToNSError(_:)(v28);
  ((void (**)(_QWORD, void *))a8)[2](a8, v30);

  v31 = v28;
LABEL_10:
  swift_errorRelease(v31);
  v46 = v112;
  return swift_release(v46);
}

uint64_t sub_1000616FC(void *a1, uint64_t a2, void *a3, void (**a4)(_QWORD, _QWORD))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t (**v28)();
  id v29;
  uint64_t v30;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;

  v8 = sub_100056A5C(&qword_1000B3368);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  __chkstk_darwin(v8);
  v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100056A5C(&qword_1000B3300);
  __chkstk_darwin(v12);
  v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = swift_allocObject(&unk_10009B370, 24, 7);
  *(_QWORD *)(v15 + 16) = a4;
  if (a1)
  {
    _Block_copy(a4);
    v16 = a1;
    v17 = objc_msgSend(v16, "identifier");
    if (v17)
    {
      v18 = v17;
      v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
      v37 = v20;

      v21 = type metadata accessor for TaskPriority(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v14, 1, 1, v21);
      sub_10005F228(a2, (uint64_t)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
      v22 = *(unsigned __int8 *)(v9 + 80);
      v23 = (v22 + 48) & ~v22;
      v24 = (v10 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
      v25 = (v24 + 15) & 0xFFFFFFFFFFFFFFF8;
      v26 = (_QWORD *)swift_allocObject(&unk_10009B398, v25 + 16, v22 | 7);
      v26[2] = 0;
      v26[3] = 0;
      v27 = v37;
      v26[4] = v19;
      v26[5] = v27;
      sub_10005F274((uint64_t)v11, (uint64_t)v26 + v23);
      *(_QWORD *)((char *)v26 + v24) = a3;
      v28 = (uint64_t (**)())((char *)v26 + v25);
      *v28 = sub_100061990;
      v28[1] = (uint64_t (*)())v15;
      v29 = a3;
      swift_retain(v15);
      v30 = sub_100054D80((uint64_t)v14, (uint64_t)&unk_1000B33B0, (uint64_t)v26);

      swift_release(v30);
      return swift_release(v15);
    }

  }
  else
  {
    _Block_copy(a4);
  }
  v32 = sub_10005F11C();
  v33 = swift_allocError(&type metadata for FindMyLocateShims.Error, v32, 0, 0);
  *(_OWORD *)v34 = xmmword_1000767A0;
  *(_BYTE *)(v34 + 16) = 2;
  v35 = (void *)_convertErrorToNSError(_:)(v33);
  ((void (**)(_QWORD, void *))a4)[2](a4, v35);

  swift_errorRelease(v33);
  return swift_release(v15);
}

uint64_t sub_10006196C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100061990()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_1000619A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v1 = *(_QWORD *)(sub_100056A5C(&qword_1000B3368) - 8);
  v2 = *(unsigned __int8 *)(v1 + 80);
  v3 = (v2 + 48) & ~v2;
  v4 = *(_QWORD *)(v1 + 64);
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 40));
  v6 = type metadata accessor for Date(0, v5);
  v7 = *(_QWORD *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v0 + v3, 1, v6))
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v3, v6);
  v8 = (v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v9 = (v8 + 15) & 0xFFFFFFFFFFFFFFF8;

  swift_release(*(_QWORD *)(v0 + v9 + 8));
  return swift_deallocObject(v0, v9 + 16, v2 | 7);
}

uint64_t sub_100061A80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v1 = type metadata accessor for UUID(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 40) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = type metadata accessor for Fence.TriggerPosition(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = (v4 + v5 + v8) & ~v8;
  v10 = v3 | v8 | 7;
  v11 = (*(_QWORD *)(v7 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  swift_release(*(_QWORD *)(v0 + v11 + 8));
  return swift_deallocObject(v0, v11 + 16, v10);
}

void sub_100061B5C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_100058FDC(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_100061B68()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 40));
  swift_release(*(_QWORD *)(v0 + 56));
  return swift_deallocObject(v0, 64, 7);
}

uint64_t sub_100061BA4(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a2;
  if (!*a2)
  {
    v5 = objc_opt_self(*a3);
    result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }
  return result;
}

unint64_t sub_100061BDC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000B33D8;
  if (!qword_1000B33D8)
  {
    v1 = sub_100061BA4(255, &qword_1000B33D0, FMFFence_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_1000B33D8);
  }
  return result;
}

uint64_t sub_100061C38()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  swift_release(*(_QWORD *)(v0 + 48));
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100061C70()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  swift_release(*(_QWORD *)(v0 + 48));
  return swift_deallocObject(v0, 64, 7);
}

uint64_t sub_100061CAC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = v0[4];
  v3 = v0[5];
  v5 = v0[6];
  v4 = v0[7];
  v6 = (_QWORD *)swift_task_alloc(dword_1000B331C);
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_100061D10;
  return sub_100058178((uint64_t)v6, v7, v8, v2, v3, v5, v4);
}

uint64_t sub_100061D10()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100061D58()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_100061D70()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  swift_release(*(_QWORD *)(v0 + 56));
  return swift_deallocObject(v0, 64, 7);
}

uint64_t sub_100061DAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for RequestOrigin(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 32) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100061E20(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for RequestOrigin(0) - 8) + 80);
  v5 = v1 + ((v4 + 32) & ~v4);
  v6 = (_QWORD *)swift_task_alloc(dword_1000B33FC);
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_1000630F0;
  return sub_100054AC0(a1, v7, v8, v5);
}

uint64_t sub_100061E90()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100061EBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc(dword_1000B340C);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1000630F0;
  return sub_100054ECC((uint64_t)v3, v4, v5, v2);
}

unint64_t sub_100061F08()
{
  unint64_t result;

  result = qword_1000B3418;
  if (!qword_1000B3418)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_1000B3418);
  }
  return result;
}

uint64_t sub_100061F4C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100061F8C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_100061FA4()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100061FD0()
{
  uint64_t v0;
  void *v1;
  uint64_t result;
  Class isa;

  v1 = *(void **)(v0 + 16);
  result = (uint64_t)objc_msgSend(v1, "respondsToSelector:", "didUpdateFences:");
  if ((result & 1) != 0)
  {
    sub_100061BA4(0, &qword_1000B33D0, FMFFence_ptr);
    sub_100061BDC();
    swift_unknownObjectRetain(v1);
    isa = Set._bridgeToObjectiveC()().super.isa;
    objc_msgSend(v1, "didUpdateFences:", isa);

    return swift_unknownObjectRelease(v1);
  }
  return result;
}

uint64_t sub_100062084(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100062094(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t *sub_10006209C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    v4 = swift_slowAlloc(*(_QWORD *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }
  return a2;
}

uint64_t _s5ErrorOMa(uint64_t a1)
{
  uint64_t result;

  result = qword_1000B3948;
  if (!qword_1000B3948)
    return swift_getSingletonMetadata(a1, &_s5ErrorOMn);
  return result;
}

unint64_t sub_100062118()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000B3940;
  if (!qword_1000B3940)
  {
    v1 = _s5ErrorOMa(255);
    result = swift_getWitnessTable(&unk_1000768A0, v1);
    atomic_store(result, (unint64_t *)&qword_1000B3940);
  }
  return result;
}

_OWORD *sub_100062164(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100062174(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_1000B34BC);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_100061D10;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1000B34B8 + dword_1000B34B8))(a1, v4);
}

uint64_t sub_1000621E4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100062208(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_1000B34F4);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1000630F0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1000B34F0 + dword_1000B34F0))(a1, v4);
}

uint64_t sub_100062278(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100056A5C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000622B4(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1000622D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

char *sub_100062310(char *a1, char **a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  char *v8;
  char *v9;
  char *v10;
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v10 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = &v10[(v6 + 16) & ~(unint64_t)v6];
    swift_retain(v10);
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload(a2, a3))
    {
      case 0u:
        v8 = *a2;
        *(_QWORD *)a1 = *a2;
        v9 = v8;
        swift_storeEnumTagMultiPayload(a1, a3, 0);
        break;
      case 1u:
        v12 = *a2;
        *(_QWORD *)a1 = *a2;
        v13 = v12;
        swift_storeEnumTagMultiPayload(a1, a3, 1);
        break;
      case 3u:
        v14 = a2[1];
        *(_QWORD *)a1 = *a2;
        *((_QWORD *)a1 + 1) = v14;
        swift_bridgeObjectRetain(v14);
        swift_storeEnumTagMultiPayload(a1, a3, 3);
        break;
      case 4u:
        v15 = type metadata accessor for Fence.Variant(0);
        (*(void (**)(char *, char **, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(a1, a2, v15);
        swift_storeEnumTagMultiPayload(a1, a3, 4);
        break;
      case 5u:
        v16 = type metadata accessor for Fence.AcceptanceStatus(0);
        (*(void (**)(char *, char **, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(a1, a2, v16);
        swift_storeEnumTagMultiPayload(a1, a3, 5);
        break;
      case 6u:
        v17 = type metadata accessor for Fence.MonitorRegion.Source(0);
        (*(void (**)(char *, char **, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(a1, a2, v17);
        swift_storeEnumTagMultiPayload(a1, a3, 6);
        break;
      case 7u:
        v18 = a2[1];
        *(_QWORD *)a1 = *a2;
        *((_QWORD *)a1 + 1) = v18;
        swift_bridgeObjectRetain(v18);
        swift_storeEnumTagMultiPayload(a1, a3, 7);
        break;
      case 8u:
        v19 = type metadata accessor for Fence.Participant(0);
        (*(void (**)(char *, char **, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(a1, a2, v19);
        swift_storeEnumTagMultiPayload(a1, a3, 8);
        break;
      case 9u:
        v20 = a2[1];
        *(_QWORD *)a1 = *a2;
        *((_QWORD *)a1 + 1) = v20;
        swift_bridgeObjectRetain(v20);
        swift_storeEnumTagMultiPayload(a1, a3, 9);
        break;
      case 0xAu:
        v21 = type metadata accessor for Fence.Trigger(0);
        (*(void (**)(char *, char **, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(a1, a2, v21);
        swift_storeEnumTagMultiPayload(a1, a3, 10);
        break;
      case 0xBu:
        v22 = type metadata accessor for Fence.Participant(0);
        (*(void (**)(char *, char **, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(a1, a2, v22);
        swift_storeEnumTagMultiPayload(a1, a3, 11);
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(v5 + 64));
        break;
    }
  }
  return a1;
}

void sub_100062584(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  switch(swift_getEnumCaseMultiPayload(a1, a2))
  {
    case 0u:
    case 1u:

      return;
    case 3u:
    case 7u:
    case 9u:
      swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
      return;
    case 4u:
      v3 = type metadata accessor for Fence.Variant(0);
      goto LABEL_9;
    case 5u:
      v3 = type metadata accessor for Fence.AcceptanceStatus(0);
      goto LABEL_9;
    case 6u:
      v3 = type metadata accessor for Fence.MonitorRegion.Source(0);
      goto LABEL_9;
    case 8u:
    case 0xBu:
      v3 = type metadata accessor for Fence.Participant(0);
      goto LABEL_9;
    case 0xAu:
      v3 = type metadata accessor for Fence.Trigger(0);
LABEL_9:
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
      break;
    default:
      return;
  }
}

void **sub_10006263C(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  id v7;
  void **v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;

  switch(swift_getEnumCaseMultiPayload(a2, a3))
  {
    case 0u:
      v6 = *a2;
      *a1 = *a2;
      v7 = v6;
      v8 = a1;
      v9 = a3;
      v10 = 0;
      goto LABEL_14;
    case 1u:
      v11 = *a2;
      *a1 = *a2;
      v12 = v11;
      v8 = a1;
      v9 = a3;
      v10 = 1;
      goto LABEL_14;
    case 3u:
      v13 = a2[1];
      *a1 = *a2;
      a1[1] = v13;
      swift_bridgeObjectRetain(v13);
      v8 = a1;
      v9 = a3;
      v10 = 3;
      goto LABEL_14;
    case 4u:
      v14 = type metadata accessor for Fence.Variant(0);
      (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(a1, a2, v14);
      v8 = a1;
      v9 = a3;
      v10 = 4;
      goto LABEL_14;
    case 5u:
      v15 = type metadata accessor for Fence.AcceptanceStatus(0);
      (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(a1, a2, v15);
      v8 = a1;
      v9 = a3;
      v10 = 5;
      goto LABEL_14;
    case 6u:
      v16 = type metadata accessor for Fence.MonitorRegion.Source(0);
      (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(a1, a2, v16);
      v8 = a1;
      v9 = a3;
      v10 = 6;
      goto LABEL_14;
    case 7u:
      v17 = a2[1];
      *a1 = *a2;
      a1[1] = v17;
      swift_bridgeObjectRetain(v17);
      v8 = a1;
      v9 = a3;
      v10 = 7;
      goto LABEL_14;
    case 8u:
      v18 = type metadata accessor for Fence.Participant(0);
      (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(a1, a2, v18);
      v8 = a1;
      v9 = a3;
      v10 = 8;
      goto LABEL_14;
    case 9u:
      v19 = a2[1];
      *a1 = *a2;
      a1[1] = v19;
      swift_bridgeObjectRetain(v19);
      v8 = a1;
      v9 = a3;
      v10 = 9;
      goto LABEL_14;
    case 0xAu:
      v20 = type metadata accessor for Fence.Trigger(0);
      (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(a1, a2, v20);
      v8 = a1;
      v9 = a3;
      v10 = 10;
      goto LABEL_14;
    case 0xBu:
      v21 = type metadata accessor for Fence.Participant(0);
      (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(a1, a2, v21);
      v8 = a1;
      v9 = a3;
      v10 = 11;
LABEL_14:
      swift_storeEnumTagMultiPayload(v8, v9, v10);
      break;
    default:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

void **sub_100062860(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  id v7;
  void **v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;

  if (a1 != a2)
  {
    sub_100062AAC((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload(a2, a3))
    {
      case 0u:
        v6 = *a2;
        *a1 = *a2;
        v7 = v6;
        v8 = a1;
        v9 = a3;
        v10 = 0;
        goto LABEL_15;
      case 1u:
        v11 = *a2;
        *a1 = *a2;
        v12 = v11;
        v8 = a1;
        v9 = a3;
        v10 = 1;
        goto LABEL_15;
      case 3u:
        *a1 = *a2;
        v13 = a2[1];
        a1[1] = v13;
        swift_bridgeObjectRetain(v13);
        v8 = a1;
        v9 = a3;
        v10 = 3;
        goto LABEL_15;
      case 4u:
        v14 = type metadata accessor for Fence.Variant(0);
        (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(a1, a2, v14);
        v8 = a1;
        v9 = a3;
        v10 = 4;
        goto LABEL_15;
      case 5u:
        v15 = type metadata accessor for Fence.AcceptanceStatus(0);
        (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(a1, a2, v15);
        v8 = a1;
        v9 = a3;
        v10 = 5;
        goto LABEL_15;
      case 6u:
        v16 = type metadata accessor for Fence.MonitorRegion.Source(0);
        (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(a1, a2, v16);
        v8 = a1;
        v9 = a3;
        v10 = 6;
        goto LABEL_15;
      case 7u:
        *a1 = *a2;
        v17 = a2[1];
        a1[1] = v17;
        swift_bridgeObjectRetain(v17);
        v8 = a1;
        v9 = a3;
        v10 = 7;
        goto LABEL_15;
      case 8u:
        v18 = type metadata accessor for Fence.Participant(0);
        (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(a1, a2, v18);
        v8 = a1;
        v9 = a3;
        v10 = 8;
        goto LABEL_15;
      case 9u:
        *a1 = *a2;
        v19 = a2[1];
        a1[1] = v19;
        swift_bridgeObjectRetain(v19);
        v8 = a1;
        v9 = a3;
        v10 = 9;
        goto LABEL_15;
      case 0xAu:
        v20 = type metadata accessor for Fence.Trigger(0);
        (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(a1, a2, v20);
        v8 = a1;
        v9 = a3;
        v10 = 10;
        goto LABEL_15;
      case 0xBu:
        v21 = type metadata accessor for Fence.Participant(0);
        (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(a1, a2, v21);
        v8 = a1;
        v9 = a3;
        v10 = 11;
LABEL_15:
        swift_storeEnumTagMultiPayload(v8, v9, v10);
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

uint64_t sub_100062AAC(uint64_t a1)
{
  uint64_t v2;

  v2 = _s5ErrorOMa(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_100062AE8(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  switch(swift_getEnumCaseMultiPayload(a2, a3))
  {
    case 4u:
      v6 = type metadata accessor for Fence.Variant(0);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      v7 = a1;
      v8 = a3;
      v9 = 4;
      goto LABEL_9;
    case 5u:
      v10 = type metadata accessor for Fence.AcceptanceStatus(0);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(a1, a2, v10);
      v7 = a1;
      v8 = a3;
      v9 = 5;
      goto LABEL_9;
    case 6u:
      v11 = type metadata accessor for Fence.MonitorRegion.Source(0);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, a2, v11);
      v7 = a1;
      v8 = a3;
      v9 = 6;
      goto LABEL_9;
    case 8u:
      v12 = type metadata accessor for Fence.Participant(0);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(a1, a2, v12);
      v7 = a1;
      v8 = a3;
      v9 = 8;
      goto LABEL_9;
    case 0xAu:
      v13 = type metadata accessor for Fence.Trigger(0);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(a1, a2, v13);
      v7 = a1;
      v8 = a3;
      v9 = 10;
      goto LABEL_9;
    case 0xBu:
      v14 = type metadata accessor for Fence.Participant(0);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(a1, a2, v14);
      v7 = a1;
      v8 = a3;
      v9 = 11;
LABEL_9:
      swift_storeEnumTagMultiPayload(v7, v8, v9);
      break;
    default:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

void *sub_100062C80(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a1 != a2)
  {
    sub_100062AAC((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload(a2, a3))
    {
      case 4u:
        v6 = type metadata accessor for Fence.Variant(0);
        (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
        v7 = a1;
        v8 = a3;
        v9 = 4;
        goto LABEL_10;
      case 5u:
        v10 = type metadata accessor for Fence.AcceptanceStatus(0);
        (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(a1, a2, v10);
        v7 = a1;
        v8 = a3;
        v9 = 5;
        goto LABEL_10;
      case 6u:
        v11 = type metadata accessor for Fence.MonitorRegion.Source(0);
        (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, a2, v11);
        v7 = a1;
        v8 = a3;
        v9 = 6;
        goto LABEL_10;
      case 8u:
        v12 = type metadata accessor for Fence.Participant(0);
        (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(a1, a2, v12);
        v7 = a1;
        v8 = a3;
        v9 = 8;
        goto LABEL_10;
      case 0xAu:
        v13 = type metadata accessor for Fence.Trigger(0);
        (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(a1, a2, v13);
        v7 = a1;
        v8 = a3;
        v9 = 10;
        goto LABEL_10;
      case 0xBu:
        v14 = type metadata accessor for Fence.Participant(0);
        (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(a1, a2, v14);
        v7 = a1;
        v8 = a3;
        v9 = 11;
LABEL_10:
        swift_storeEnumTagMultiPayload(v7, v8, v9);
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

uint64_t sub_100062E28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_100062E34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_100062E44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_storeEnumTagMultiPayload(a1, a3, a2);
}

uint64_t sub_100062E54(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD v9[12];

  v9[0] = &unk_100076870;
  v9[1] = &unk_100076870;
  v9[2] = (char *)&value witness table for Builtin.Int64 + 64;
  v9[3] = &unk_100076888;
  result = type metadata accessor for Fence.Variant(319);
  if (v3 <= 0x3F)
  {
    v9[4] = *(_QWORD *)(result - 8) + 64;
    result = type metadata accessor for Fence.AcceptanceStatus(319);
    if (v4 <= 0x3F)
    {
      v9[5] = *(_QWORD *)(result - 8) + 64;
      result = type metadata accessor for Fence.MonitorRegion.Source(319);
      if (v5 <= 0x3F)
      {
        v9[6] = *(_QWORD *)(result - 8) + 64;
        v9[7] = &unk_100076888;
        result = type metadata accessor for Fence.Participant(319);
        if (v6 <= 0x3F)
        {
          v7 = *(_QWORD *)(result - 8) + 64;
          v9[8] = v7;
          v9[9] = &unk_100076888;
          result = type metadata accessor for Fence.Trigger(319);
          if (v8 <= 0x3F)
          {
            v9[10] = *(_QWORD *)(result - 8) + 64;
            v9[11] = v7;
            swift_initEnumMetadataMultiPayload(a1, 256, 12, v9);
            return 0;
          }
        }
      }
    }
  }
  return result;
}

void type metadata accessor for FMFFenceLocationType(uint64_t a1)
{
  sub_100062F90(a1, &qword_1000B35A8, (uint64_t)&unk_10009B668);
}

void type metadata accessor for FMFFenceAcceptanceStatus(uint64_t a1)
{
  sub_100062F90(a1, &qword_1000B35B0, (uint64_t)&unk_10009B688);
}

void type metadata accessor for FMFFenceTrigger(uint64_t a1)
{
  sub_100062F90(a1, &qword_1000B35B8, (uint64_t)&unk_10009B6B0);
}

void sub_100062F90(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v5;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, a3);
    if (!v5)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_100062FD4()
{
  return sub_100061F4C(&qword_1000B35C0, (uint64_t (*)(uint64_t))type metadata accessor for FMFFenceTrigger, (uint64_t)&unk_10007696C);
}

uint64_t sub_100063000()
{
  return sub_100061F4C(&qword_1000B35C8, (uint64_t (*)(uint64_t))type metadata accessor for FMFFenceTrigger, (uint64_t)&unk_100076944);
}

uint64_t sub_10006302C()
{
  return sub_100061F4C(&qword_1000B35D0, (uint64_t (*)(uint64_t))type metadata accessor for FMFFenceTrigger, (uint64_t)&unk_1000769D4);
}

uint64_t sub_100063058()
{
  return sub_100061F4C(&qword_1000B35D8, (uint64_t (*)(uint64_t))type metadata accessor for FMFFenceAcceptanceStatus, (uint64_t)&unk_100076AAC);
}

uint64_t sub_100063084()
{
  return sub_100061F4C(&qword_1000B35E0, (uint64_t (*)(uint64_t))type metadata accessor for FMFFenceAcceptanceStatus, (uint64_t)&unk_100076A84);
}

uint64_t sub_1000630B0()
{
  return sub_100061F4C(&qword_1000B35E8, (uint64_t (*)(uint64_t))type metadata accessor for FMFFenceAcceptanceStatus, (uint64_t)&unk_100076B14);
}

void sub_1000630DC()
{
  swift_deletedMethodError();
  __break(1u);
}

void sub_10006311C(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  sub_100017B38();
  sub_100017B18((void *)&_mh_execute_header, v2, v3, "Failed to update model cache with data: %@.", v4, v5, v6, v7, v8);

  sub_100017B2C();
}

void sub_100063194(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  sub_100017B38();
  sub_100017B18((void *)&_mh_execute_header, v2, v3, "Failed to encrypt model cache with data: %@.", v4, v5, v6, v7, v8);

  sub_100017B2C();
}

void sub_10006320C(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  sub_100017B38();
  sub_100017B18((void *)&_mh_execute_header, v2, v3, "Failed to plist encode model cache with data: %@.", v4, v5, v6, v7, v8);

  sub_100017B2C();
}

void sub_100063284(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  sub_100017B38();
  sub_100017B18((void *)&_mh_execute_header, v2, v3, "Error unarchiving decrypted model cache: %@", v4, v5, v6, v7, v8);

  sub_100017B2C();
}

void sub_1000632FC(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  sub_100017B38();
  sub_100017B18((void *)&_mh_execute_header, v2, v3, "Error decrypting model cache: %@", v4, v5, v6, v7, v8);

  sub_100017B2C();
}

void sub_100063374(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  sub_100017B38();
  sub_100017B18((void *)&_mh_execute_header, v2, v3, "Error unarchiving encrypted model cache: %@", v4, v5, v6, v7, v8);

  sub_100017B2C();
}

void sub_1000633EC(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  sub_100017B38();
  sub_100017B18((void *)&_mh_execute_header, v2, v3, "Error removing local model cache: %@", v4, v5, v6, v7, v8);

  sub_100017B2C();
}

void sub_100063464()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: error bootstrapping privateCloudDatabase: %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_1000634D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: error: %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_10006353C(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  v5 = 138412290;
  v6 = v3;
  sub_10001DE74((void *)&_mh_execute_header, a2, v4, "Subscription error: %@.", (uint8_t *)&v5);

}

void sub_1000635C8()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;

  v3[0] = 136315650;
  sub_10001DE14();
  v4 = v0;
  v5 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s: bad invitationToken: %@ or shareURL: %@", (uint8_t *)v3, 0x20u);
}

void sub_100063650()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315906;
  sub_10001DE48();
  sub_10001DE80((void *)&_mh_execute_header, v0, v1, "%s: error: %@, NOT RETRYING, shareURL: %@ invitationToken: %@", v2);
}

void sub_1000636C4()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315906;
  sub_10001DE48();
  sub_10001DE80((void *)&_mh_execute_header, v0, v1, "%s: error: %@, retrying first time, shareURL: %@ invitationToken: %@", v2);
}

void sub_100063738()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: Fetch changes with completion error- not notifying records did change. Error: %@:", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_1000637A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: Fetch changes with completion error- not notifying records did change. Error: %@:", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_100063810(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001DE38((void *)&_mh_execute_header, a1, a3, "Unable to encode share invitation, unknown error", a5, a6, a7, a8, 0);
  sub_10001DE94();
}

void sub_100063840(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_10001DE74((void *)&_mh_execute_header, a2, a3, "Unable to encode share invitation, error: %@", (uint8_t *)&v3);
  sub_10001DE6C();
}

void sub_1000638A8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001DE38((void *)&_mh_execute_header, a1, a3, "Unable to decode share invitation, unknown error", a5, a6, a7, a8, 0);
  sub_10001DE94();
}

void sub_1000638D8(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_10001DE74((void *)&_mh_execute_header, a2, a3, "Unable to decode share invitation, error: %@", (uint8_t *)&v3);
  sub_10001DE6C();
}

void sub_100063940(void *a1, NSObject *a2)
{
  _DWORD v3[2];

  v3[0] = 67109120;
  v3[1] = objc_msgSend(a1, "processIdentifier");
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Refusing client %d due to missing entitlement.", (uint8_t *)v3, 8u);
}

void sub_1000639C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100017B38();
  sub_10001FDC8((void *)&_mh_execute_header, v0, v1, "Unable to send command(%@) due to missing iCloud account", v2, v3, v4, v5, v6);
  sub_10001DE6C();
}

void sub_100063A28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100017B38();
  sub_10001FDC8((void *)&_mh_execute_header, v0, v1, "Unable to send command(%@) due to missing credentials", v2, v3, v4, v5, v6);
  sub_10001DE6C();
}

void sub_100063A88()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;

  sub_100017B38();
  v3 = 1024;
  v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "command.password == nil, renewing account credentials for command: %@ with force: %d", v2, 0x12u);
  sub_10001DE6C();
}

void sub_100063B08()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100017B38();
  sub_10001FDC8((void *)&_mh_execute_header, v0, v1, "Unable to send command(%@) due to 5XX grace period", v2, v3, v4, v5, v6);
  sub_10001DE6C();
}

void sub_100063B68()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100017B38();
  sub_10001FDC8((void *)&_mh_execute_header, v0, v1, "Unable to send command(%@) due to account status unauthorized", v2, v3, v4, v5, v6);
  sub_10001DE6C();
}

void sub_100063BC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100017B38();
  sub_10001FDC8((void *)&_mh_execute_header, v0, v1, "Unable to send command(%@) due to not first unlocked", v2, v3, v4, v5, v6);
  sub_10001DE6C();
}

void sub_100063C28(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error stopping sharing to handles in block list: %@ Error: %@", (uint8_t *)&v4, 0x16u);
}

void sub_100063CB0(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  sub_10002C654((void *)&_mh_execute_header, a2, a3, "%@: Refresh failed during deviceSharingLocation %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  sub_10001DE6C();
}

void sub_100063D24()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100017B38();
  sub_10001FDC8((void *)&_mh_execute_header, v0, v1, "%@: contactForPayload failed: FMFErrorPayloadLengthUnsupported", v2, v3, v4, v5, v6);
  sub_10001DE6C();
}

void sub_100063D84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100017B38();
  sub_10001FDC8((void *)&_mh_execute_header, v0, v1, "%@: contactForPayload failed: FMFErrorPayloadDecryptionFailed", v2, v3, v4, v5, v6);
  sub_10001DE6C();
}

void sub_100063DE4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10002C6BC();
  sub_10002C668((void *)&_mh_execute_header, v0, v1, "%@: contactForPayload failed: FMFErrorPayloadDecryptionFailed - handleIdentifier: %@", v2);
  sub_10001DE6C();
}

void sub_100063E48()
{
  uint64_t v0;
  os_log_t v1;

  sub_10002C674();
  sub_10002C654((void *)&_mh_execute_header, v0, v1, "%@: contactForPayload failed: FMFErrorNoContactMatching - handleIdentifier: %@");
  sub_10001DE6C();
}

void sub_100063EA8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100017B38();
  sub_10001FDC8((void *)&_mh_execute_header, v0, v1, "%@: handleAndLocationForPayload failed: FMFErrorPayloadLengthUnsupported", v2, v3, v4, v5, v6);
  sub_10001DE6C();
}

void sub_100063F08()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100017B38();
  sub_10001FDC8((void *)&_mh_execute_header, v0, v1, "%@: handleAndLocationForPayload failed: FMFErrorPayloadDecryptionFailed", v2, v3, v4, v5, v6);
  sub_10001DE6C();
}

void sub_100063F68()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10002C6BC();
  sub_10002C668((void *)&_mh_execute_header, v0, v1, "%@: handleAndLocationForPayload failed: FMFErrorPayloadDecryptionFailed - handle: %@", v2);
  sub_10001DE6C();
}

void sub_100063FCC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100017B38();
  sub_10001FDC8((void *)&_mh_execute_header, v0, v1, "%@: decryptPayload failed: FMFErrorPayloadLengthUnsupported", v2, v3, v4, v5, v6);
  sub_10001DE6C();
}

void sub_10006402C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100017B38();
  sub_10001FDC8((void *)&_mh_execute_header, v0, v1, "%@: decryptPayload failed: FMFErrorPayloadDecryptionFailed", v2, v3, v4, v5, v6);
  sub_10001DE6C();
}

void sub_10006408C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100017B38();
  sub_10001FDC8((void *)&_mh_execute_header, v0, v1, "%@: decryptPayload failed: error converting dictionary to string", v2, v3, v4, v5, v6);
  sub_10001DE6C();
}

void sub_1000640EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100017B38();
  sub_10001FDC8((void *)&_mh_execute_header, v0, v1, "%@: dataForPayload failed: FMFErrorPayloadLengthUnsupported", v2, v3, v4, v5, v6);
  sub_10001DE6C();
}

void sub_10006414C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100017B38();
  sub_10001FDC8((void *)&_mh_execute_header, v0, v1, "%@: dataForPayload failed: FMFErrorPayloadDecryptionFailed", v2, v3, v4, v5, v6);
  sub_10001DE6C();
}

void sub_1000641AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002C68C();
  sub_10002C6AC((void *)&_mh_execute_header, v0, v1, "%@: dataForPayload failed: FMFErrorPayloadDecryptionFailed - handle: %@, locationDict: %@", v2, v3, v4, v5, v6);
}

void sub_100064210()
{
  uint64_t v0;
  os_log_t v1;

  sub_10002C674();
  sub_10002C654((void *)&_mh_execute_header, v0, v1, "%@: Using provided token: %@");
  sub_10001DE6C();
}

void sub_100064270()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100017B38();
  sub_10001FDC8((void *)&_mh_execute_header, v0, v1, "%@:dataForPayload failed: FMFErrorPayloadLengthUnsupported", v2, v3, v4, v5, v6);
  sub_10001DE6C();
}

void sub_1000642D0()
{
  uint64_t v0;
  os_log_t v1;

  sub_10002C674();
  sub_10002C654((void *)&_mh_execute_header, v0, v1, "%@:encryptPayload failed: FMFErrorPayloadEncryptionFailed - decryptedPayload: %@");
  sub_10001DE6C();
}

void sub_100064330()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_100017B38();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%@: Sending refresh client to get new token", v1, 0xCu);
  sub_10001DE6C();
}

void sub_10006439C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001FDC8((void *)&_mh_execute_header, a2, a3, "NSKeyedUnarchiver error: %@", a5, a6, a7, a8, 2u);
}

void sub_100064404(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001FDC8((void *)&_mh_execute_header, a1, a3, "SecItemCopyMatching succeeded with empty results and result %ld", a5, a6, a7, a8, 0);
}

void sub_100064474(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "com.apple.Dataclass.ShareLocation data class missing from iCloud account", v1, 2u);
}

void sub_1000644B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100017B38();
  sub_10001FDC8((void *)&_mh_execute_header, v0, v1, "Error completing aa_updatePropertiesForAppleAccount : %@ try to renew credential", v2, v3, v4, v5, v6);
  sub_10001DE6C();
}

void sub_100064514()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100017B38();
  sub_10001FDC8((void *)&_mh_execute_header, v0, v1, "Error saving the account after aa_updatePropertiesForAppleAccount : %@", v2, v3, v4, v5, v6);
  sub_10001DE6C();
}

void sub_100064574(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "appHostnameFromSettings"));
  sub_100017B38();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Updating FMF app hostname: %@", v4, 0xCu);

}

void sub_100064604()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100017B38();
  sub_10001FDC8((void *)&_mh_execute_header, v0, v1, "Error getting credential: %@", v2, v3, v4, v5, v6);
  sub_10001DE6C();
}

void sub_100064664()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100017B38();
  sub_10001FDC8((void *)&_mh_execute_header, v0, v1, "Invalid APS Env value returned from iCloud Setup: %@, falling back to production", v2, v3, v4, v5, v6);
  sub_10001DE6C();
}

void sub_1000646C4(os_log_t log)
{
  int v1;
  const char *v2;

  v1 = 136315138;
  v2 = "-[FMFFenceManager informParticipantOfRemovedFenceWithID:ckRecordID:]_block_invoke";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: error: No followed or follower handle for fence", (uint8_t *)&v1, 0xCu);
  sub_10001DE6C();
}

void sub_100064740()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10003CEA4();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: could not find fence with ID: %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_1000647B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: error: %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_10006481C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10003CEA4();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: could not find fence with ID: %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_10006488C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: error: %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_1000648F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: error: %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_100064964(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "*** Trying to explicitly init FMFAPSHandler. Use 'instanceForEnvironment:'", v1, 2u);
}

void sub_1000649A4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001DE38((void *)&_mh_execute_header, a1, a3, "*** The AOSUserNotificationMgr_iOS singleton seems to have been deallocated. This is unexpected & damaging.", a5, a6, a7, a8, 0);
}

void sub_1000649D8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001DE38((void *)&_mh_execute_header, a1, a3, "*** Trying to explicitly init AOSUserNotificationMgr_iOS. Use 'sharedInstance'", a5, a6, a7, a8, 0);
}

void sub_100064A0C(int *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *a1;
  v3 = 134217984;
  v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error while creating a CFUserNotification : %ld", (uint8_t *)&v3, 0xCu);
}

void sub_100064A84(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001DE38((void *)&_mh_execute_header, a1, a3, "Cannot update fence due to missing credentials", a5, a6, a7, a8, 0);
}

void sub_100064AB8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001DE38((void *)&_mh_execute_header, a1, a3, "Cannot update favorites due to missing credentials", a5, a6, a7, a8, 0);
}

void sub_100064AEC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: write error: %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_100064B58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: archive error: %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_100064BC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: error: %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_100064C30()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: no file at %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_100064C9C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: unarchive error: %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_100064D08()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: read error: %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_100064D74()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_100049764((void *)&_mh_execute_header, v0, v1, "%s: no file at %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_100064DE0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: write error: %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_100064E4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: archive error: %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_100064EB8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: error: %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_100064F24()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: no file at %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_100064F90()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: write error: %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_100064FFC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: archive error: %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_100065068()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: unarchive error: %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_1000650D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: read error: %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_100065140()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_100049764((void *)&_mh_execute_header, v0, v1, "%s: no file at %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_1000651AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: write error: %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_100065218()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: archive error: %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_100065284()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: error: %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_1000652F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: no file at %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_10006535C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: unarchive error: %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_1000653C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: read error: %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_100065434()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: no file at %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_1000654A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10004E8C8();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: write error: %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_100065510()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10004E8C8();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: error creating path error: %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_100065580()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: error archiving data: %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_1000655EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: error unarchiving: %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_100065658()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: read error: %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_1000656C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: error: %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_100065730()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  sub_10004E890();
  sub_10004E8AC((void *)&_mh_execute_header, v0, v1, "%s: error posting: %@ uuid: %@", v2);
  sub_10004E8C0();
}

void sub_1000657A0()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  sub_10004E890();
  sub_10004E8AC((void *)&_mh_execute_header, v0, v1, "%s: error posting: %@ uuid: %@", v2);
  sub_10004E8C0();
}

void sub_100065810()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  sub_10004E890();
  sub_10004E8AC((void *)&_mh_execute_header, v0, v1, "%s: error posting: %@ uuid: %@", v2);
  sub_10004E8C0();
}

void sub_100065880(os_log_t log)
{
  int v1;
  const char *v2;

  v1 = 136315138;
  v2 = "+[FMFFence(Notifications) shouldPostForStatus:givenPreviousStatus:]";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "%s: shouldn't be here", (uint8_t *)&v1, 0xCu);
  sub_10001DE6C();
}

void sub_1000658FC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001FDC8((void *)&_mh_execute_header, a2, a3, "%@: Error encrypting....", a5, a6, a7, a8, 2u);
  sub_10001DE6C();
}

void sub_100065960(NSObject *a1)
{
  int v2;
  _DWORD v3[2];

  v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "FMFClientSession: SecRandomCopyBytes failed with error: %d", (uint8_t *)v3, 8u);
  sub_10001DE6C();
}

void sub_1000659E8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001FDC8((void *)&_mh_execute_header, a2, a3, "%@: Error decrypting....", a5, a6, a7, a8, 2u);
  sub_10001DE6C();
}

void sub_100065A4C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001FDC8((void *)&_mh_execute_header, a1, a3, "%s: no fence", a5, a6, a7, a8, 2u);
  sub_10001DE6C();
}

void sub_100065ABC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: error: %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_100065B28(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001FDC8((void *)&_mh_execute_header, a1, a3, "%s: no fence", a5, a6, a7, a8, 2u);
  sub_10001DE6C();
}

void sub_100065B98(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001FDC8((void *)&_mh_execute_header, a1, a3, "%s: App Upgrade Needed", a5, a6, a7, a8, 2u);
  sub_10001DE6C();
}

void sub_100065C08()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: error: %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_100065C74()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: error: %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_100065CE0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: triggerAfterAcceptanceError %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_100065D4C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001FDC8((void *)&_mh_execute_header, a1, a3, "%s: no fence", a5, a6, a7, a8, 2u);
  sub_10001DE6C();
}

void sub_100065DBC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: error: %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_100065E28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: error: %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_100065E94(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;

  v3 = *(_QWORD *)(a2 + 32);
  v4 = 136315650;
  v5 = "-[FMFFenceSequencer cleanupRemovedFenceInformationWithFenceID:ckRecordID:]_block_invoke";
  v6 = 2112;
  v7 = a1;
  v8 = 2112;
  v9 = v3;
  sub_100054490((void *)&_mh_execute_header, a3, (uint64_t)a3, "%s: Error removing zone from CK. Error: %@, RecordID: %@", (uint8_t *)&v4);
}

void sub_100065F24(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a2 + 32), "recordID"));
  v7 = 136315650;
  v8 = "+[FMFFenceSequencer ckCheckForStaleZonesForFence:withCompletion:]_block_invoke";
  v9 = 2112;
  v10 = a1;
  v11 = 2112;
  v12 = v5;
  sub_100054490((void *)&_mh_execute_header, a3, v6, "%s: Error removing zone from CK. Error: %@, RecordID: %@", (uint8_t *)&v7);

}

void sub_100065FDC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: could not get recordID for fence %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_100066048()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10001DE14();
  sub_10001DE28((void *)&_mh_execute_header, v0, v1, "%s: could not find record for fence %@", v2, v3, v4, v5, 2u);
  sub_10001DE6C();
}

void sub_1000660B4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001DE28((void *)&_mh_execute_header, a2, a3, "%s: Failed to remove fence due to loss of keychain. Fence: %@, ", a5, a6, a7, a8, 2u);
  sub_10001DE6C();
}

id objc_msgSend_FMFErrorAsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "FMFErrorAsString:");
}

id objc_msgSend_FMFServiceHost(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "FMFServiceHost");
}

id objc_msgSend_FMFServiceService(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "FMFServiceService");
}

id objc_msgSend_FMFServiceUseSSL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "FMFServiceUseSSL");
}

id objc_msgSend_IDSRecipientFromHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "IDSRecipientFromHandle:");
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URL");
}

id objc_msgSend_URLQueryAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLQueryAllowedCharacterSet");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__activityBlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_activityBlock");
}

id objc_msgSend__addFence_clientSession_ckShare_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addFence:clientSession:ckShare:completion:");
}

id objc_msgSend__alertTimeoutInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_alertTimeoutInterval");
}

id objc_msgSend__clearOldMappingPacketsOverLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clearOldMappingPacketsOverLimit:");
}

id objc_msgSend__configFromServer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configFromServer");
}

id objc_msgSend__dateFromHour_andMinute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dateFromHour:andMinute:");
}

id objc_msgSend__dayStringForDayOfWeek_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dayStringForDayOfWeek:");
}

id objc_msgSend__decryptPayload_withToken_withSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_decryptPayload:withToken:withSession:");
}

id objc_msgSend__deviceInfoForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deviceInfoForKey:");
}

id objc_msgSend__devices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_devices");
}

id objc_msgSend__encryptPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_encryptPayload:");
}

id objc_msgSend__enumerateDaysOfWeekInFMFDaysOfWeek_callback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enumerateDaysOfWeekInFMFDaysOfWeek:callback:");
}

id objc_msgSend__filterLocatableHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_filterLocatableHandles:");
}

id objc_msgSend__followerHandleMapWithIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_followerHandleMapWithIdentifier");
}

id objc_msgSend__followerHandleMapWithServerId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_followerHandleMapWithServerId");
}

id objc_msgSend__followingHandleMapWithIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_followingHandleMapWithIdentifier");
}

id objc_msgSend__followingHandleMapWithServerId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_followingHandleMapWithServerId");
}

id objc_msgSend__futureFollowerRequestMapWithIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_futureFollowerRequestMapWithIdentifier");
}

id objc_msgSend__futureFollowerRequestsInternal(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_futureFollowerRequestsInternal");
}

id objc_msgSend__futureFollowingRequestsInternal(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_futureFollowingRequestsInternal");
}

id objc_msgSend__handleWithData_withHandlesKey_forIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleWithData:withHandlesKey:forIdentifier:");
}

id objc_msgSend__handlesInternal(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handlesInternal");
}

id objc_msgSend__highPriorityRefreshInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_highPriorityRefreshInterval");
}

id objc_msgSend__internalClientSessionPIDsString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_internalClientSessionPIDsString");
}

id objc_msgSend__isApplicationForClientSessionInForeground_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isApplicationForClientSessionInForeground:");
}

id objc_msgSend__locationDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_locationDictionary");
}

id objc_msgSend__meDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_meDevice");
}

id objc_msgSend__myInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_myInfo");
}

id objc_msgSend__postAliveNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_postAliveNotification");
}

id objc_msgSend__preferences(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_preferences");
}

id objc_msgSend__receivedDeletedFenceInformationMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_receivedDeletedFenceInformationMessage:");
}

id objc_msgSend__receivedFenceTriggerMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_receivedFenceTriggerMessage:");
}

id objc_msgSend__receivedShareInvitationMessage_fromID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_receivedShareInvitationMessage:fromID:");
}

id objc_msgSend__recipients(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_recipients");
}

id objc_msgSend__refreshForSession_withReason_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_refreshForSession:withReason:withCompletion:");
}

id objc_msgSend__refreshLocationsForHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_refreshLocationsForHandles:");
}

id objc_msgSend__registerUnlockRefresh(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerUnlockRefresh");
}

id objc_msgSend__removeFence_clientSession_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeFence:clientSession:completion:");
}

id objc_msgSend__scheduleRefresh(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scheduleRefresh");
}

id objc_msgSend__scheduleRegistrationSanityCheck(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scheduleRegistrationSanityCheck");
}

id objc_msgSend__sendInitForSession_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendInitForSession:withCompletion:");
}

id objc_msgSend__sendMessage_toHandle_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendMessage:toHandle:error:");
}

id objc_msgSend__sendMessage_toHandles_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendMessage:toHandles:error:");
}

id objc_msgSend__sendRefreshOfType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendRefreshOfType:");
}

id objc_msgSend__serverContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverContext");
}

id objc_msgSend__strictlyUnarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_strictlyUnarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend__timeTillMinCallback(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_timeTillMinCallback");
}

id objc_msgSend__updateInviteTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateInviteTimer");
}

id objc_msgSend__verifyLaunchEventsConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_verifyLaunchEventsConfiguration");
}

id objc_msgSend__xpcTransactionNameFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_xpcTransactionNameFor:");
}

id objc_msgSend_aa_authToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_authToken");
}

id objc_msgSend_aa_fmfAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_fmfAccount");
}

id objc_msgSend_aa_personID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_personID");
}

id objc_msgSend_aa_primaryAppleAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_primaryAppleAccount");
}

id objc_msgSend_aa_updatePropertiesForAppleAccount_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_updatePropertiesForAppleAccount:completion:");
}

id objc_msgSend_abDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "abDidChange");
}

id objc_msgSend_abPreferencesDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "abPreferencesDidChange");
}

id objc_msgSend_abbreviation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "abbreviation");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_acceptCKShareWithURL_invitationToken_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptCKShareWithURL:invitationToken:completion:");
}

id objc_msgSend_acceptCKShareWithURLString_invitationTokenBase64String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptCKShareWithURLString:invitationTokenBase64String:");
}

id objc_msgSend_acceptanceStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptanceStatus");
}

id objc_msgSend_accepted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accepted");
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "account");
}

id objc_msgSend_accountQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountQueue");
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accounts");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activate");
}

id objc_msgSend_activateNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateNotification:");
}

id objc_msgSend_activeCFNotificationsByCategory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeCFNotificationsByCategory");
}

id objc_msgSend_activeDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeDevice");
}

id objc_msgSend_activeUserNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeUserNotifications");
}

id objc_msgSend_addClientSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addClientSession:");
}

id objc_msgSend_addDelegate_forService_listenerID_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDelegate:forService:listenerID:queue:");
}

id objc_msgSend_addDelegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDelegate:queue:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addFavorite_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFavorite:");
}

id objc_msgSend_addFavorite_clientSession_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFavorite:clientSession:completion:");
}

id objc_msgSend_addFence_clientSession_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFence:clientSession:completion:");
}

id objc_msgSend_addFence_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFence:completion:");
}

id objc_msgSend_addNetworkReachableObserver_selector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addNetworkReachableObserver:selector:");
}

id objc_msgSend_addNotificationRequest_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addNotificationRequest:withCompletionHandler:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_addObservers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObservers");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_addParticipant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addParticipant:");
}

id objc_msgSend_administrativeArea(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "administrativeArea");
}

id objc_msgSend_alertActionInfoForAction_andURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertActionInfoForAction:andURL:");
}

id objc_msgSend_alertId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertId");
}

id objc_msgSend_alertLevel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertLevel");
}

id objc_msgSend_aliasServerIds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aliasServerIds");
}

id objc_msgSend_allBlacklistRules(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allBlacklistRules");
}

id objc_msgSend_allDevices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allDevices");
}

id objc_msgSend_allFences(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allFences");
}

id objc_msgSend_allFencesWithoutCKData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allFencesWithoutCKData");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allLocations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allLocations");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allValues");
}

id objc_msgSend_allowFriendRequests(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowFriendRequests");
}

id objc_msgSend_allowInitForSessionCreation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowInitForSessionCreation");
}

id objc_msgSend_alternateButtonAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alternateButtonAction");
}

id objc_msgSend_alternateButtonTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alternateButtonTitle");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anyObject");
}

id objc_msgSend_appHostnameFromSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appHostnameFromSettings");
}

id objc_msgSend_appName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appName");
}

id objc_msgSend_appVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appVersion");
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendData:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_applicationInfoForPID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationInfoForPID:");
}

id objc_msgSend_applicationIsInstalled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationIsInstalled:");
}

id objc_msgSend_approveFriendshipRequest_forSession_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "approveFriendshipRequest:forSession:completion:");
}

id objc_msgSend_apsConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "apsConnection");
}

id objc_msgSend_apsEnvironment(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "apsEnvironment");
}

id objc_msgSend_apsEnvironmentConstantForiCloudBagKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "apsEnvironmentConstantForiCloudBagKey:");
}

id objc_msgSend_apsHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "apsHandler");
}

id objc_msgSend_apsToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "apsToken");
}

id objc_msgSend_apsTokenData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "apsTokenData");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_authToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authToken");
}

id objc_msgSend_authTokenFromKeychain(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authTokenFromKeychain");
}

id objc_msgSend_authorizationStatusForBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authorizationStatusForBundle:");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_beginTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginTransaction:");
}

id objc_msgSend_blockFMFChannel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "blockFMFChannel");
}

id objc_msgSend_blockingDialogs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "blockingDialogs");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_boostrapScheduled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "boostrapScheduled");
}

id objc_msgSend_bootstrap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bootstrap");
}

id objc_msgSend_bootstrapAccountWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bootstrapAccountWithReason:");
}

id objc_msgSend_bootstrapRetryInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bootstrapRetryInterval");
}

id objc_msgSend_buildVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildVersion");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithPath:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bytes");
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_cache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cache");
}

id objc_msgSend_cacheDirectory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cacheDirectory");
}

id objc_msgSend_cacheFileURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cacheFileURL");
}

id objc_msgSend_cachedFirstInvitedDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachedFirstInvitedDate");
}

id objc_msgSend_cachedRedirects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachedRedirects");
}

id objc_msgSend_cachedRedirectsFromDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachedRedirectsFromDefaults");
}

id objc_msgSend_cachedTapMessages(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachedTapMessages");
}

id objc_msgSend_cachesWarmedUp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachesWarmedUp");
}

id objc_msgSend_callerIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callerIdentifier");
}

id objc_msgSend_canAddFollower(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canAddFollower");
}

id objc_msgSend_canAddFriend(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canAddFriend");
}

id objc_msgSend_canOfferToHandles_forSession_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canOfferToHandles:forSession:completion:");
}

id objc_msgSend_capabilities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "capabilities");
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "category");
}

id objc_msgSend_changesToBeNotified(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changesToBeNotified");
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterSetWithCharactersInString:");
}

id objc_msgSend_checkForChangedFencesPastInviteDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkForChangedFencesPastInviteDate:");
}

id objc_msgSend_checkHeartbeat(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkHeartbeat");
}

id objc_msgSend_checkIDSStatusOfRecipientForService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkIDSStatusOfRecipientForService:");
}

id objc_msgSend_checkin(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkin");
}

id objc_msgSend_ckCheckForStaleZonesForFence_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ckCheckForStaleZonesForFence:withCompletion:");
}

id objc_msgSend_ckCreateRecordForFence_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ckCreateRecordForFence:withCompletion:");
}

id objc_msgSend_ckCreateRecordIDForFence_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ckCreateRecordIDForFence:withCompletion:");
}

id objc_msgSend_ckDeleteRecordForFence_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ckDeleteRecordForFence:withCompletion:");
}

id objc_msgSend_ckRecordID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ckRecordID");
}

id objc_msgSend_ckRecordName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ckRecordName");
}

id objc_msgSend_ckRecordZoneID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ckRecordZoneID");
}

id objc_msgSend_ckRecordZoneName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ckRecordZoneName");
}

id objc_msgSend_ckRecordZoneNameForRecordName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ckRecordZoneNameForRecordName:");
}

id objc_msgSend_ckRecordZoneOwnerName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ckRecordZoneOwnerName");
}

id objc_msgSend_ckUpdateRecordForFence_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ckUpdateRecordForFence:withCompletion:");
}

id objc_msgSend_cleanup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanup");
}

id objc_msgSend_cleanupCaches(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanupCaches");
}

id objc_msgSend_cleanupLegacyStoredDataIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanupLegacyStoredDataIfNeeded");
}

id objc_msgSend_cleanupOldModel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanupOldModel");
}

id objc_msgSend_cleanupRemovedFenceInformationWithFenceID_ckRecordID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanupRemovedFenceInformationWithFenceID:ckRecordID:");
}

id objc_msgSend_clearDataAndServerContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearDataAndServerContext");
}

id objc_msgSend_clearRedirectsCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRedirectsCache");
}

id objc_msgSend_clearSavedInvalidMappingPackets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearSavedInvalidMappingPackets");
}

id objc_msgSend_clearSavedMappingPackets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearSavedMappingPackets");
}

id objc_msgSend_clearStaleFenceStatusForFenceID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearStaleFenceStatusForFenceID:");
}

id objc_msgSend_clearStaleFenceTriggerForFence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearStaleFenceTriggerForFence:");
}

id objc_msgSend_clearStaleStatusForRemovedFenceID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearStaleStatusForRemovedFenceID:");
}

id objc_msgSend_clearTapMessagesCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearTapMessagesCache");
}

id objc_msgSend_clientBundleId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientBundleId");
}

id objc_msgSend_clientContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientContext");
}

id objc_msgSend_clientInfoVersionTagString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientInfoVersionTagString");
}

id objc_msgSend_clientPid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientPid");
}

id objc_msgSend_clientProxy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientProxy");
}

id objc_msgSend_clientSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientSession");
}

id objc_msgSend_clientSessions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientSessions");
}

id objc_msgSend_cloudKitAPSHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cloudKitAPSHandler");
}

id objc_msgSend_cloudKitPushTopic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cloudKitPushTopic");
}

id objc_msgSend_coalescedAppContexts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coalescedAppContexts");
}

id objc_msgSend_coalescedCommands(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coalescedCommands");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "code");
}

id objc_msgSend_coleasedRefreshPriority(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coleasedRefreshPriority");
}

id objc_msgSend_commandDataContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commandDataContext");
}

id objc_msgSend_commandServerContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commandServerContext");
}

id objc_msgSend_commandStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commandStatus");
}

id objc_msgSend_companionDeviceId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "companionDeviceId");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_compare_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:options:");
}

id objc_msgSend_completionBlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "completionBlock");
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "components:fromDate:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configuration");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connection");
}

id objc_msgSend_container(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "container");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coordinate");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countForObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countForObject:");
}

id objc_msgSend_country(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "country");
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countryCode");
}

id objc_msgSend_createDatabaseSubscriptionOperationWithSubscriptionId_database_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDatabaseSubscriptionOperationWithSubscriptionId:database:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createIDForRecordWithName_inZoneWithName_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createIDForRecordWithName:inZoneWithName:withCompletion:");
}

id objc_msgSend_createdByIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createdByIdentifier");
}

id objc_msgSend_credentialForAccount_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "credentialForAccount:error:");
}

id objc_msgSend_credentialItemForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "credentialItemForKey:");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentCalendar");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentLocale");
}

id objc_msgSend_currentOperation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentOperation");
}

id objc_msgSend_currentRemoteDevicesForDestinations_service_listenerID_queue_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentRemoteDevicesForDestinations:service:listenerID:queue:completionBlock:");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "data");
}

id objc_msgSend_dataArchiver(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataArchiver");
}

id objc_msgSend_dataForAccount_service_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataForAccount:service:");
}

id objc_msgSend_dataTaskWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataTaskWithRequest:completionHandler:");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithCapacity:");
}

id objc_msgSend_dataWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:options:error:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_dataWithLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithLength:");
}

id objc_msgSend_databaseWithDatabaseScope_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "databaseWithDatabaseScope:");
}

id objc_msgSend_dataclassProperties(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataclassProperties");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "date");
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_dateFromComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateFromComponents:");
}

id objc_msgSend_dateWithTimeIntervalSince1970_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSince1970:");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_daysOfWeek(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "daysOfWeek");
}

id objc_msgSend_declineFriendshipRequest_forSession_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "declineFriendshipRequest:forSession:completion:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_decryptWithKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decryptWithKey:error:");
}

id objc_msgSend_defaultButtonAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultButtonAction");
}

id objc_msgSend_defaultButtonTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultButtonTitle");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultQueue");
}

id objc_msgSend_defaultSessionConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultSessionConfiguration");
}

id objc_msgSend_defaultSound(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultSound");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegate");
}

id objc_msgSend_deleteFence_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteFence:completion:");
}

id objc_msgSend_deleteRecordWithRecordID_inDatabaseWithScope_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteRecordWithRecordID:inDatabaseWithScope:withCompletion:");
}

id objc_msgSend_deleteRecordZonesWithID_fromDatabase_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteRecordZonesWithID:fromDatabase:withCompletion:");
}

id objc_msgSend_deleteZoneWithID_inDatabase_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteZoneWithID:inDatabase:withCompletion:");
}

id objc_msgSend_deltasFromExisting_usingLatest_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deltasFromExisting:usingLatest:forKey:");
}

id objc_msgSend_deregisterDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deregisterDelegate:");
}

id objc_msgSend_deregisterWithAPS(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deregisterWithAPS");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "description");
}

id objc_msgSend_descriptorForRequiredKeysForStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptorForRequiredKeysForStyle:");
}

id objc_msgSend_determineNewMeDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "determineNewMeDevice");
}

id objc_msgSend_deviceClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceClass");
}

id objc_msgSend_deviceId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceId");
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceName");
}

id objc_msgSend_deviceSharingLocation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceSharingLocation");
}

id objc_msgSend_deviceUDID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceUDID");
}

id objc_msgSend_deviceWithId_name_idsDeviceId_isActive_isThisDevice_isCompanionDevice_isAutoMeCapable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceWithId:name:idsDeviceId:isActive:isThisDevice:isCompanionDevice:isAutoMeCapable:");
}

id objc_msgSend_devicesFromData_meDeviceId_thisDeviceId_companionDeviceId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "devicesFromData:meDeviceId:thisDeviceId:companionDeviceId:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryForKey:");
}

id objc_msgSend_dictionaryValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryValue");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_didAddFollowerHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didAddFollowerHandle:");
}

id objc_msgSend_didChangeActiveLocationSharingDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChangeActiveLocationSharingDevice:");
}

id objc_msgSend_didReceiveAPSMessage_onTopic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveAPSMessage:onTopic:");
}

id objc_msgSend_didReceiveAPSToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveAPSToken:");
}

id objc_msgSend_didReceiveFriendshipRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveFriendshipRequest:");
}

id objc_msgSend_didReceiveServerError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveServerError:");
}

id objc_msgSend_didRemoveFollowerHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didRemoveFollowerHandle:");
}

id objc_msgSend_didStartFollowingHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didStartFollowingHandle:");
}

id objc_msgSend_didStopFollowingHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didStopFollowingHandle:");
}

id objc_msgSend_didUpdateActiveDeviceList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateActiveDeviceList:");
}

id objc_msgSend_didUpdateFavorites_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateFavorites:");
}

id objc_msgSend_didUpdateFences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateFences:");
}

id objc_msgSend_didUpdateFollowers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateFollowers:");
}

id objc_msgSend_didUpdateFollowing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateFollowing:");
}

id objc_msgSend_didUpdateHideFromFollowersStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateHideFromFollowersStatus:");
}

id objc_msgSend_didUpdateLocations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateLocations:");
}

id objc_msgSend_didUpdatePendingOffersForHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdatePendingOffersForHandles:");
}

id objc_msgSend_didUpdatePreferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdatePreferences:");
}

id objc_msgSend_digestCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "digestCommand:");
}

id objc_msgSend_dismissMsgOnLock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissMsgOnLock");
}

id objc_msgSend_dismissMsgOnUnlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissMsgOnUnlock");
}

id objc_msgSend_dispayOfferAlertDialogsWithoutRepeatForError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dispayOfferAlertDialogsWithoutRepeatForError:");
}

id objc_msgSend_displayLocationName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayLocationName");
}

id objc_msgSend_displayNameForContact_andHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayNameForContact:andHandle:");
}

id objc_msgSend_displayiCloudUserNotificationWithTitleLocKey_messageLocKey_switchString_doNotSwitch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayiCloudUserNotificationWithTitleLocKey:messageLocKey:switchString:doNotSwitch:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "domain");
}

id objc_msgSend_donateFollowingsChangeEventsForAddedFollowings_removedFollowings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "donateFollowingsChangeEventsForAddedFollowings:removedFollowings:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_dsIds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dsIds");
}

id objc_msgSend_dsid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dsid");
}

id objc_msgSend_e928760c5fbc1719e59c427e2be01ce6(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "e928760c5fbc1719e59c427e2be01ce6");
}

id objc_msgSend_email(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "email");
}

id objc_msgSend_emailAddress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emailAddress");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_encryptWithKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encryptWithKey:error:");
}

id objc_msgSend_encryptedValuesByKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encryptedValuesByKey");
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endDate");
}

id objc_msgSend_endHour(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endHour");
}

id objc_msgSend_endMin(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endMin");
}

id objc_msgSend_endTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endTransaction:");
}

id objc_msgSend_enqueueNotification_postingStyle_coalesceMask_forModes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueNotification:postingStyle:coalesceMask:forModes:");
}

id objc_msgSend_enter5XXGracePeriod(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enter5XXGracePeriod");
}

id objc_msgSend_enumToStringMap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumToStringMap");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumeratorAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratorAtPath:");
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "environment");
}

id objc_msgSend_environmentName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "environmentName");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "error");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_executeNextOperation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeNextOperation");
}

id objc_msgSend_executeWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeWithCompletion:");
}

id objc_msgSend_executionCompletionBlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executionCompletionBlock");
}

id objc_msgSend_exit5XXGracePeriod(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exit5XXGracePeriod");
}

id objc_msgSend_expireInitTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "expireInitTimestamp");
}

id objc_msgSend_expiresByGroupId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "expiresByGroupId");
}

id objc_msgSend_expiresDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "expiresDate");
}

id objc_msgSend_exportedInterface(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exportedInterface");
}

id objc_msgSend_extendFriendshipOfferRequest_forSession_callerId_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extendFriendshipOfferRequest:forSession:callerId:completion:");
}

id objc_msgSend_favoriteHandles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "favoriteHandles");
}

id objc_msgSend_favoriteOrder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "favoriteOrder");
}

id objc_msgSend_favorites(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "favorites");
}

id objc_msgSend_favoritesData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "favoritesData");
}

id objc_msgSend_favoritesDataFromHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "favoritesDataFromHandles:");
}

id objc_msgSend_favoritesHandlesInHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "favoritesHandlesInHandles:");
}

id objc_msgSend_favoritesHandlesUpdateQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "favoritesHandlesUpdateQueue");
}

id objc_msgSend_favoritesManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "favoritesManager");
}

id objc_msgSend_favoritesSequencer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "favoritesSequencer");
}

id objc_msgSend_fence(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fence");
}

id objc_msgSend_fenceDictionariesFromResponseDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fenceDictionariesFromResponseDictionary:");
}

id objc_msgSend_fenceManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fenceManager");
}

id objc_msgSend_fenceManager_didModifyFence_clientSession_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fenceManager:didModifyFence:clientSession:withCompletion:");
}

id objc_msgSend_fenceManager_didModifyFence_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fenceManager:didModifyFence:withCompletion:");
}

id objc_msgSend_fenceSequencer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fenceSequencer");
}

id objc_msgSend_fenceWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fenceWithID:");
}

id objc_msgSend_fences(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fences");
}

id objc_msgSend_fencesForHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fencesForHandles:");
}

id objc_msgSend_fencesForHandles_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fencesForHandles:completion:");
}

id objc_msgSend_fencesFromFenceDictionaries_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fencesFromFenceDictionaries:");
}

id objc_msgSend_fencesOnMeByMe(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fencesOnMeByMe");
}

id objc_msgSend_fencesOnMeByOthers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fencesOnMeByOthers");
}

id objc_msgSend_fencesOnOthersByMe(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fencesOnOthersByMe");
}

id objc_msgSend_fencesOnOthersByOthers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fencesOnOthersByOthers");
}

id objc_msgSend_fetchAllRecordZonesOperation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAllRecordZonesOperation");
}

id objc_msgSend_fetchChangeConfigurationsForZonesWithIDs_inScope_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchChangeConfigurationsForZonesWithIDs:inScope:");
}

id objc_msgSend_fetchChangedRecordZonesWithID_andDeleteRecordZonesWithID_fromDatabase_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchChangedRecordZonesWithID:andDeleteRecordZonesWithID:fromDatabase:withCompletion:");
}

id objc_msgSend_fetchChangedRecordZonesWithID_fromDatabase_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchChangedRecordZonesWithID:fromDatabase:withCompletion:");
}

id objc_msgSend_fetchChangesFromDatabase_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchChangesFromDatabase:withCompletion:");
}

id objc_msgSend_fetchChangesWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchChangesWithCompletion:");
}

id objc_msgSend_fetchLocationForHandles_callerId_priority_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchLocationForHandles:callerId:priority:completion:");
}

id objc_msgSend_fetchLocationForHandles_forSession_callerId_priority_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchLocationForHandles:forSession:callerId:priority:completionBlock:");
}

id objc_msgSend_fetchShareParticipantsForHandles_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchShareParticipantsForHandles:withCompletion:");
}

id objc_msgSend_fetchUserRecordIDWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchUserRecordIDWithCompletionHandler:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_filteredSetUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredSetUsingPredicate:");
}

id objc_msgSend_findMyLocationChangeStream(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findMyLocationChangeStream");
}

id objc_msgSend_finishEncoding(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishEncoding");
}

id objc_msgSend_finishWithFence_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishWithFence:error:");
}

id objc_msgSend_firstFutureStartDateFromHiddenScheduledFences_order_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstFutureStartDateFromHiddenScheduledFences:order:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstObject");
}

id objc_msgSend_firstWeekday(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstWeekday");
}

id objc_msgSend_fm_filter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fm_filter:");
}

id objc_msgSend_fm_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fm_firstObjectPassingTest:");
}

id objc_msgSend_fm_hexString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fm_hexString");
}

id objc_msgSend_fm_map_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fm_map:");
}

id objc_msgSend_fm_nullToNil(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fm_nullToNil");
}

id objc_msgSend_fm_randomBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fm_randomBytes:");
}

id objc_msgSend_fm_safeSetObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fm_safeSetObject:forKey:");
}

id objc_msgSend_fmfAccountToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fmfAccountToken");
}

id objc_msgSend_fmfAppHostName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fmfAppHostName");
}

id objc_msgSend_fmfAppToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fmfAppToken");
}

id objc_msgSend_fmfIDSService(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fmfIDSService");
}

id objc_msgSend_fmf_otherParticipants(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fmf_otherParticipants");
}

id objc_msgSend_fmf_withCurrentUserDefaultName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fmf_withCurrentUserDefaultName");
}

id objc_msgSend_followedGivenName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "followedGivenName");
}

id objc_msgSend_followedHandleForFence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "followedHandleForFence:");
}

id objc_msgSend_follower(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "follower");
}

id objc_msgSend_followerGivenName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "followerGivenName");
}

id objc_msgSend_followerHandleForFence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "followerHandleForFence:");
}

id objc_msgSend_followerHandleForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "followerHandleForIdentifier:");
}

id objc_msgSend_followerHandleForServerId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "followerHandleForServerId:");
}

id objc_msgSend_followerHandles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "followerHandles");
}

id objc_msgSend_followerIds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "followerIds");
}

id objc_msgSend_followersFullyInited(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "followersFullyInited");
}

id objc_msgSend_followersInfoReceived(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "followersInfoReceived");
}

id objc_msgSend_followersUsingData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "followersUsingData:");
}

id objc_msgSend_following(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "following");
}

id objc_msgSend_followingFullyInited(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "followingFullyInited");
}

id objc_msgSend_followingHandleForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "followingHandleForIdentifier:");
}

id objc_msgSend_followingHandleForServerId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "followingHandleForServerId:");
}

id objc_msgSend_followingHandles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "followingHandles");
}

id objc_msgSend_followingInfoReceived(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "followingInfoReceived");
}

id objc_msgSend_forceRefreshWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "forceRefreshWithCompletion:");
}

id objc_msgSend_formattedAddress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formattedAddress");
}

id objc_msgSend_friendIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "friendIdentifier");
}

id objc_msgSend_friendIds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "friendIds");
}

id objc_msgSend_friendRequestId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "friendRequestId");
}

id objc_msgSend_friendRequestsFromData_forType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "friendRequestsFromData:forType:");
}

id objc_msgSend_friendshipRequestToHandles_fromHandle_withType_groupId_withEndDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "friendshipRequestToHandles:fromHandle:withType:groupId:withEndDate:");
}

id objc_msgSend_fromHandle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fromHandle");
}

id objc_msgSend_futureFollowerRequests(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "futureFollowerRequests");
}

id objc_msgSend_futureFollowingRequests(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "futureFollowingRequests");
}

id objc_msgSend_genericFriendName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "genericFriendName");
}

id objc_msgSend_getAccountEmailAddress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAccountEmailAddress");
}

id objc_msgSend_getContactForHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getContactForHandle:");
}

id objc_msgSend_getContactForHandle_keysToFetch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getContactForHandle:keysToFetch:");
}

id objc_msgSend_getFenceWithCKRecordName_timeout_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getFenceWithCKRecordName:timeout:block:");
}

id objc_msgSend_getFenceWithID_timeout_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getFenceWithID:timeout:block:");
}

id objc_msgSend_getFences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getFences:");
}

id objc_msgSend_getHandlesSharingLocationsWithMe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getHandlesSharingLocationsWithMe:");
}

id objc_msgSend_getHandlesSharingLocationsWithMeWithGroupId_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getHandlesSharingLocationsWithMeWithGroupId:completion:");
}

id objc_msgSend_getHandlesSharingMyLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getHandlesSharingMyLocation:");
}

id objc_msgSend_getHandlesSharingMyLocationWithGroupId_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getHandlesSharingMyLocationWithGroupId:completion:");
}

id objc_msgSend_getHandlesWithPendingOffers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getHandlesWithPendingOffers:");
}

id objc_msgSend_getHandlesWithPendingOffersSync(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getHandlesWithPendingOffersSync");
}

id objc_msgSend_getLocationForHandles_forSession_callerId_priority_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getLocationForHandles:forSession:callerId:priority:completionBlock:");
}

id objc_msgSend_getPendingFriendshipRequestsWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getPendingFriendshipRequestsWithCompletion:");
}

id objc_msgSend_getPendingMappingPacketsForHandle_groupId_forSession_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getPendingMappingPacketsForHandle:groupId:forSession:completion:");
}

id objc_msgSend_graceInterval401InSec(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "graceInterval401InSec");
}

id objc_msgSend_graceInterval5XXInSec(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "graceInterval5XXInSec");
}

id objc_msgSend_groupId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupId");
}

id objc_msgSend_handle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handle");
}

id objc_msgSend_handleAlarmForAlarmName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleAlarmForAlarmName:");
}

id objc_msgSend_handleAlertAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleAlertAction:");
}

id objc_msgSend_handleDarwinNotificationsWithHandlers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDarwinNotificationsWithHandlers:");
}

id objc_msgSend_handleDistributedNotificationsWithHandlers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDistributedNotificationsWithHandlers:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handleIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleIdentifiers");
}

id objc_msgSend_handleIdentityLossWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleIdentityLossWithCompletion:");
}

id objc_msgSend_handleMessage_onTopic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleMessage:onTopic:");
}

id objc_msgSend_handleReceiveCKShareWithURLString_invitationTokenBase64String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleReceiveCKShareWithURLString:invitationTokenBase64String:");
}

id objc_msgSend_handleWithId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleWithId:");
}

id objc_msgSend_handleWithId_serverId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleWithId:serverId:");
}

id objc_msgSend_handles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handles");
}

id objc_msgSend_handles_minusHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handles:minusHandle:");
}

id objc_msgSend_handlesFromData_forType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlesFromData:forType:");
}

id objc_msgSend_handlesFromData_withHandlesKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlesFromData:withHandlesKey:");
}

id objc_msgSend_handlesQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlesQueue");
}

id objc_msgSend_handlesToLocate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlesToLocate");
}

id objc_msgSend_hasCredentials(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasCredentials");
}

id objc_msgSend_hasFirstUnlocked(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasFirstUnlocked");
}

id objc_msgSend_hasIDSFenceCapabilityForHandle_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasIDSFenceCapabilityForHandle:withCompletion:");
}

id objc_msgSend_hasModelInitialized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasModelInitialized");
}

id objc_msgSend_hasPendingOfferToHandle_withGroupId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPendingOfferToHandle:withGroupId:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hashForToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hashForToken:");
}

id objc_msgSend_hashedAPSTokenMatchesStoredToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hashedAPSTokenMatchesStoredToken:");
}

id objc_msgSend_heartbeatIntervalInSec(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "heartbeatIntervalInSec");
}

id objc_msgSend_hideKeychainUI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hideKeychainUI");
}

id objc_msgSend_hideLocation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hideLocation");
}

id objc_msgSend_horizontalAccuracy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "horizontalAccuracy");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "host");
}

id objc_msgSend_iCloudAccountName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iCloudAccountName");
}

id objc_msgSend_iCloudId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iCloudId");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifier");
}

id objc_msgSend_idsCorrelationIdentifierWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idsCorrelationIdentifierWithCompletion:");
}

id objc_msgSend_idsDeviceId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idsDeviceId");
}

id objc_msgSend_idsStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idsStatus");
}

id objc_msgSend_idsValidatedHandlesStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idsValidatedHandlesStatus");
}

id objc_msgSend_importMappingPacket_forSession_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "importMappingPacket:forSession:completion:");
}

id objc_msgSend_infoByWindowStartDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "infoByWindowStartDate:");
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "infoDictionary");
}

id objc_msgSend_informParticipantOfRemovedFenceWithID_ckRecordID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "informParticipantOfRemovedFenceWithID:ckRecordID:");
}

id objc_msgSend_initFailed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initFailed");
}

id objc_msgSend_initForAvocadoIdentifier_inBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForAvocadoIdentifier:inBundleIdentifier:");
}

id objc_msgSend_initForReadingFromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForReadingFromData:error:");
}

id objc_msgSend_initForWritingWithMutableData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForWritingWithMutableData:");
}

id objc_msgSend_initSingleton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initSingleton");
}

id objc_msgSend_initWithAlertId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAlertId:");
}

id objc_msgSend_initWithAllowFriendRequests_forSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAllowFriendRequests:forSession:");
}

id objc_msgSend_initWithBase64EncodedString_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBase64EncodedString:options:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithClientSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClientSession:");
}

id objc_msgSend_initWithClientSession_andFavorites_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClientSession:andFavorites:");
}

id objc_msgSend_initWithClientSession_andFence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClientSession:andFence:");
}

id objc_msgSend_initWithClientSession_device_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClientSession:device:");
}

id objc_msgSend_initWithClientSession_friendRequestId_accepted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClientSession:friendRequestId:accepted:");
}

id objc_msgSend_initWithClientSession_handles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClientSession:handles:");
}

id objc_msgSend_initWithClientSession_handles_groupId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClientSession:handles:groupId:");
}

id objc_msgSend_initWithClientSession_handles_groupId_expiresDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClientSession:handles:groupId:expiresDate:");
}

id objc_msgSend_initWithClientSession_idsClientStatusMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClientSession:idsClientStatusMap:");
}

id objc_msgSend_initWithClientSession_mappingPacketToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClientSession:mappingPacketToken:");
}

id objc_msgSend_initWithConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConnection:");
}

id objc_msgSend_initWithContainerID_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContainerID:options:");
}

id objc_msgSend_initWithContainerIdentifier_environment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContainerIdentifier:environment:");
}

id objc_msgSend_initWithCoordinate_altitude_horizontalAccuracy_verticalAccuracy_timestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithDescription_andTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDescription:andTimeout:");
}

id objc_msgSend_initWithDeviceId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDeviceId:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithDictionary_forHandle_maxLocatingInterval_TTL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:forHandle:maxLocatingInterval:TTL:");
}

id objc_msgSend_initWithEmailAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEmailAddress:");
}

id objc_msgSend_initWithEnvironmentName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEnvironmentName:");
}

id objc_msgSend_initWithEnvironmentName_namedDelegatePort_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEnvironmentName:namedDelegatePort:queue:");
}

id objc_msgSend_initWithFavorites_clientSession_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFavorites:clientSession:completion:");
}

id objc_msgSend_initWithFenceManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFenceManager:");
}

id objc_msgSend_initWithFileURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFileURL:");
}

id objc_msgSend_initWithFromHandle_toHandle_ofType_groupId_endDate_requestId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFromHandle:toHandle:ofType:groupId:endDate:requestId:");
}

id objc_msgSend_initWithHandles_forSession_callerId_priority_reason_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHandles:forSession:callerId:priority:reason:completionBlock:");
}

id objc_msgSend_initWithHideLocation_forSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHideLocation:forSession:");
}

id objc_msgSend_initWithIDSHandle_locationChangeType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIDSHandle:locationChangeType:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithLocality_administrativeArea_country_state_streetAddress_streetName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLocality:administrativeArea:country:state:streetAddress:streetName:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithPhoneNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPhoneNumber:");
}

id objc_msgSend_initWithPreviousServerChangeToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPreviousServerChangeToken:");
}

id objc_msgSend_initWithRecordName_zoneID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordName:zoneID:");
}

id objc_msgSend_initWithRecordType_recordID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordType:recordID:");
}

id objc_msgSend_initWithRecordZoneID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordZoneID:");
}

id objc_msgSend_initWithRecordZoneIDs_configurationsByRecordZoneID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordZoneIDs:configurationsByRecordZoneID:");
}

id objc_msgSend_initWithRecordZonesToSave_recordZoneIDsToDelete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordZonesToSave:recordZoneIDsToDelete:");
}

id objc_msgSend_initWithRecordsToSave_recordIDsToDelete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordsToSave:recordIDsToDelete:");
}

id objc_msgSend_initWithService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithService:");
}

id objc_msgSend_initWithSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSet:");
}

id objc_msgSend_initWithShareMetadatas_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithShareMetadatas:");
}

id objc_msgSend_initWithShareURLs_invitationTokensByShareURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithShareURLs:invitationTokensByShareURL:");
}

id objc_msgSend_initWithSubscriptionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSubscriptionID:");
}

id objc_msgSend_initWithSubscriptionsToSave_subscriptionIDsToDelete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSubscriptionsToSave:subscriptionIDsToDelete:");
}

id objc_msgSend_initWithURL_cachePolicy_timeoutInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:cachePolicy:timeoutInterval:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithUserIdentityLookupInfos_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUserIdentityLookupInfos:");
}

id objc_msgSend_initWithZoneID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithZoneID:");
}

id objc_msgSend_initWithZoneName_ownerName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithZoneName:ownerName:");
}

id objc_msgSend_initializeModelForSession_withReason_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initializeModelForSession:withReason:completion:");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_instanceForEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instanceForEnvironment:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerForKey:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_internalClientSessions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "internalClientSessions");
}

id objc_msgSend_intersectSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intersectSet:");
}

id objc_msgSend_intersectsSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intersectsSet:");
}

id objc_msgSend_invalidLocation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidLocation");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidateAndCancel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateAndCancel");
}

id objc_msgSend_invalidateMappingPackets_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateMappingPackets:completion:");
}

id objc_msgSend_invitationToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invitationToken");
}

id objc_msgSend_inviteDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inviteDate");
}

id objc_msgSend_inviteFencesPastInviteDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inviteFencesPastInviteDate:");
}

id objc_msgSend_invitePending(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invitePending");
}

id objc_msgSend_isAccountAuthorized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAccountAuthorized");
}

id objc_msgSend_isAccountBootstrapped(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAccountBootstrapped");
}

id objc_msgSend_isAccountSignedIn(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAccountSignedIn");
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isActive");
}

id objc_msgSend_isActiveAutoMeDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isActiveAutoMeDevice");
}

id objc_msgSend_isActiveDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isActiveDevice");
}

id objc_msgSend_isAllowFriendRequestsEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAllowFriendRequestsEnabled");
}

id objc_msgSend_isAudioAccessory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAudioAccessory");
}

id objc_msgSend_isCurrentAt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCurrentAt:");
}

id objc_msgSend_isCurrentUser(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCurrentUser");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToArray:");
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToData:");
}

id objc_msgSend_isEqualToDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDate:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFMFAppRemoved(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFMFAppRemoved");
}

id objc_msgSend_isFromMe(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFromMe");
}

id objc_msgSend_isIdentityLossError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isIdentityLossError:");
}

id objc_msgSend_isIn5XXGracePeriod(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isIn5XXGracePeriod");
}

id objc_msgSend_isInMultiUserMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInMultiUserMode");
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInternalBuild");
}

id objc_msgSend_isLocatingInProgress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLocatingInProgress");
}

id objc_msgSend_isLocationShiftRequiredForCoordinate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLocationShiftRequiredForCoordinate:");
}

id objc_msgSend_isLocked(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLocked");
}

id objc_msgSend_isMoreRecentThan_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMoreRecentThan:");
}

id objc_msgSend_isMuted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMuted");
}

id objc_msgSend_isNetworkReachable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNetworkReachable");
}

id objc_msgSend_isOnMe(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isOnMe");
}

id objc_msgSend_isPasscodeSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPasscodeSet");
}

id objc_msgSend_isPending(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPending");
}

id objc_msgSend_isProvisionedForDataclass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isProvisionedForDataclass:");
}

id objc_msgSend_isReachable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isReachable");
}

id objc_msgSend_isRecurring(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRecurring");
}

id objc_msgSend_isRegionAllowed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRegionAllowed");
}

id objc_msgSend_isRenewingAccountCredentials(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRenewingAccountCredentials");
}

id objc_msgSend_isShallowLocate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isShallowLocate");
}

id objc_msgSend_isSharingThroughGroupId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSharingThroughGroupId:");
}

id objc_msgSend_isStatusValidAtDate_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isStatusValidAtDate:reason:");
}

id objc_msgSend_isString_equalToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isString:equalToString:");
}

id objc_msgSend_isSupported(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSupported");
}

id objc_msgSend_isThisDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isThisDevice");
}

id objc_msgSend_isThisDeviceRegistered(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isThisDeviceRegistered");
}

id objc_msgSend_isUpdateGeoFenceCompleted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isUpdateGeoFenceCompleted");
}

id objc_msgSend_isUpdatingAccountCredentials(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isUpdatingAccountCredentials");
}

id objc_msgSend_isUserAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isUserAction");
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValid");
}

id objc_msgSend_isValidPendingOffer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidPendingOffer:");
}

id objc_msgSend_jsonResponseDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "jsonResponseDictionary");
}

id objc_msgSend_jsonResponseParseError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "jsonResponseParseError");
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyEnumerator");
}

id objc_msgSend_keychainItemForService_withUsername_returningItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keychainItemForService:withUsername:returningItem:");
}

id objc_msgSend_keychainManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keychainManager");
}

id objc_msgSend_keysOfEntriesPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysOfEntriesPassingTest:");
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "label");
}

id objc_msgSend_lastLoggedInPrsId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastLoggedInPrsId");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_lastRefreshDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastRefreshDate");
}

id objc_msgSend_lastSuccessfulInitDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastSuccessfulInitDate");
}

id objc_msgSend_lastSuccessfulResponseTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastSuccessfulResponseTimestamp");
}

id objc_msgSend_latest401TS(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "latest401TS");
}

id objc_msgSend_latest5XXTS(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "latest5XXTS");
}

id objc_msgSend_latestXPCActivityRegistrationTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "latestXPCActivityRegistrationTime");
}

id objc_msgSend_lazyInitTimeoutInSec(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lazyInitTimeoutInSec");
}

id objc_msgSend_lazyInitTimeoutInSecStoredValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lazyInitTimeoutInSecStoredValue");
}

id objc_msgSend_lazyTimeLoaded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lazyTimeLoaded");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "listener");
}

id objc_msgSend_localTimeZone(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localTimeZone");
}

id objc_msgSend_locality(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locality");
}

id objc_msgSend_localizedDaysOfWeekString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedDaysOfWeekString");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedEndTimeString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedEndTimeString");
}

id objc_msgSend_localizedNotificationTextForStatus_atDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedNotificationTextForStatus:atDate:");
}

id objc_msgSend_localizedRequestNotificationStringForFollower_locationName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedRequestNotificationStringForFollower:locationName:");
}

id objc_msgSend_localizedStartTimeString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStartTimeString");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringFromDate_dateStyle_timeStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringFromDate:dateStyle:timeStyle:");
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "location");
}

id objc_msgSend_locationForHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locationForHandle:");
}

id objc_msgSend_locationFromRefresh_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locationFromRefresh:");
}

id objc_msgSend_locationHidden(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locationHidden");
}

id objc_msgSend_locationServicesEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locationServicesEnabled");
}

id objc_msgSend_locationTTL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locationTTL");
}

id objc_msgSend_locationType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locationType");
}

id objc_msgSend_locationsForHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locationsForHandles:");
}

id objc_msgSend_lookupInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lookupInfo");
}

id objc_msgSend_lookupInfosForHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lookupInfosForHandles:");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_machServiceName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "machServiceName");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainQueue");
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_makeObjectsPerformSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeObjectsPerformSelector:");
}

id objc_msgSend_mappingPacketToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mappingPacketToken");
}

id objc_msgSend_maxBootstrapInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maxBootstrapInterval");
}

id objc_msgSend_maxLocatingInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maxLocatingInterval");
}

id objc_msgSend_maxLocationRefreshTimeout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maxLocationRefreshTimeout");
}

id objc_msgSend_maxTriesToRegisterDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maxTriesToRegisterDevice");
}

id objc_msgSend_maxWaitTimeForRegisterMS(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maxWaitTimeForRegisterMS");
}

id objc_msgSend_member_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "member:");
}

id objc_msgSend_migrateLegacyKeychainItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrateLegacyKeychainItems");
}

id objc_msgSend_minCallbackInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minCallbackInterval");
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minusSet:");
}

id objc_msgSend_modelCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modelCache");
}

id objc_msgSend_modelDidLoad(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modelDidLoad");
}

id objc_msgSend_modelSpecificLocalizedStringKeyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modelSpecificLocalizedStringKeyForKey:");
}

id objc_msgSend_modelVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modelVersion");
}

id objc_msgSend_msgText(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "msgText");
}

id objc_msgSend_msgTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "msgTitle");
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableBytes");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_muteEndDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "muteEndDate");
}

id objc_msgSend_muteFences_withEndDate_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "muteFences:withEndDate:completion:");
}

id objc_msgSend_muteFencesForHandle_untilDate_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "muteFencesForHandle:untilDate:completion:");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "name");
}

id objc_msgSend_networkReachabilityUpdated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "networkReachabilityUpdated:");
}

id objc_msgSend_nextTransactionId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextTransactionId");
}

id objc_msgSend_notLoggedIntoiCloudAlert(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notLoggedIntoiCloudAlert");
}

id objc_msgSend_notNowRequestToHandles_fromHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notNowRequestToHandles:fromHandle:");
}

id objc_msgSend_notificationWithName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationWithName:object:userInfo:");
}

id objc_msgSend_notifyClientOfUpdates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyClientOfUpdates:");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "now");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "null");
}

id objc_msgSend_numberOfFriendsAndFollowers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfFriendsAndFollowers");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLong:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForInfoDictionaryKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForInfoDictionaryKey:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKey_ofClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:ofClass:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsPassingTest:");
}

id objc_msgSend_offerExpireDateForHandle_withGroupId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "offerExpireDateForHandle:withGroupId:");
}

id objc_msgSend_offerPending(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "offerPending");
}

id objc_msgSend_openSensitiveURL_withOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openSensitiveURL:withOptions:");
}

id objc_msgSend_openURL_withOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:withOptions:");
}

id objc_msgSend_operationType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operationType");
}

id objc_msgSend_osBuildVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "osBuildVersion");
}

id objc_msgSend_osName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "osName");
}

id objc_msgSend_osVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "osVersion");
}

id objc_msgSend_ownerName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ownerName");
}

id objc_msgSend_packetsToInvalidate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "packetsToInvalidate");
}

id objc_msgSend_participants(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "participants");
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "password");
}

id objc_msgSend_passwordData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "passwordData");
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathForResource:ofType:");
}

id objc_msgSend_pathSuffix(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathSuffix");
}

id objc_msgSend_pathToAllUnacceptedCKSharesInDatabaseWithScope_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathToAllUnacceptedCKSharesInDatabaseWithScope:");
}

id objc_msgSend_pathToDataForRecordWithID_inDatabaseWithScope_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathToDataForRecordWithID:inDatabaseWithScope:");
}

id objc_msgSend_pathToDataForUnacceptedCKShareTokenForShareURL_InDatabaseWithScope_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathToDataForUnacceptedCKShareTokenForShareURL:InDatabaseWithScope:");
}

id objc_msgSend_pathToServerChangeTokenDataForScope_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathToServerChangeTokenDataForScope:");
}

id objc_msgSend_pathToServerChangeTokenDataForZoneWithID_inDatabaseWithScope_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathToServerChangeTokenDataForZoneWithID:inDatabaseWithScope:");
}

id objc_msgSend_pathToTriggerDataForFenceWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathToTriggerDataForFenceWithID:");
}

id objc_msgSend_pendingFenceWithCKRecordName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingFenceWithCKRecordName:");
}

id objc_msgSend_pendingHandleFromData_withEmailKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingHandleFromData:withEmailKey:");
}

id objc_msgSend_pendingOfferHandles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingOfferHandles");
}

id objc_msgSend_pendingPushes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingPushes");
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phoneNumber");
}

id objc_msgSend_placemark(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "placemark");
}

id objc_msgSend_platform(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "platform");
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "port");
}

id objc_msgSend_postConfirmationNotificationWithUUID_atDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postConfirmationNotificationWithUUID:atDate:");
}

id objc_msgSend_postConfirmationWithUUID_forFenceWithID_withText_forDate_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postConfirmationWithUUID:forFenceWithID:withText:forDate:completion:");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_postReceiveTriggerNotificationWithUUID_forStatus_atDate_triggerLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postReceiveTriggerNotificationWithUUID:forStatus:atDate:triggerLocation:");
}

id objc_msgSend_postReceiveTriggerWithUUID_forFenceWithID_friendID_withText_forDate_triggerLocation_fenceLocation_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postReceiveTriggerWithUUID:forFenceWithID:friendID:withText:forDate:triggerLocation:fenceLocation:completion:");
}

id objc_msgSend_postTriggerNotificationWithUUID_forStatus_atDate_triggerLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postTriggerNotificationWithUUID:forStatus:atDate:triggerLocation:");
}

id objc_msgSend_postTriggerWithUUID_forFenceWithID_followerID_withText_forDate_triggerLocation_fenceLocation_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postTriggerWithUUID:forFenceWithID:followerID:withText:forDate:triggerLocation:fenceLocation:completion:");
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithBlock:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_preflightValidateCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preflightValidateCommand:");
}

id objc_msgSend_prettyGivenNameForHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prettyGivenNameForHandle:");
}

id objc_msgSend_prettyNameForHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prettyNameForHandle:");
}

id objc_msgSend_previousStartDateFrom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "previousStartDateFrom:");
}

id objc_msgSend_previouslyAtLocationForDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "previouslyAtLocationForDate:");
}

id objc_msgSend_privateCloudDatabase(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "privateCloudDatabase");
}

id objc_msgSend_processCKError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processCKError:");
}

id objc_msgSend_processCommandError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processCommandError");
}

id objc_msgSend_processCommandResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processCommandResponse:");
}

id objc_msgSend_processId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processId");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processInfo");
}

id objc_msgSend_productType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "productType");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_publicToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publicToken");
}

id objc_msgSend_qualifiedIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "qualifiedIdentifier");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queue");
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_readDictionaryAndClasses_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readDictionaryAndClasses:error:");
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reason");
}

id objc_msgSend_receiveTriggerWithUUID_forFence_withStatus_atDate_triggerLocation_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiveTriggerWithUUID:forFence:withStatus:atDate:triggerLocation:completion:");
}

id objc_msgSend_receiveTriggerWithUUID_forFenceWithID_withStatus_atDate_triggerLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiveTriggerWithUUID:forFenceWithID:withStatus:atDate:triggerLocation:");
}

id objc_msgSend_receiveTriggerWithUUID_status_atDate_triggerLocation_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiveTriggerWithUUID:status:atDate:triggerLocation:completion:");
}

id objc_msgSend_receivedMappingPacket_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receivedMappingPacket:completion:");
}

id objc_msgSend_recipients(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recipients");
}

id objc_msgSend_recordID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordID");
}

id objc_msgSend_recordName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordName");
}

id objc_msgSend_recordWithID_inDatabaseWithScope_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordWithID:inDatabaseWithScope:");
}

id objc_msgSend_recordWithID_inScope_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordWithID:inScope:");
}

id objc_msgSend_records(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "records");
}

id objc_msgSend_recurringAndScheduledFencesForHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recurringAndScheduledFencesForHandles:");
}

id objc_msgSend_redirectedHostname(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "redirectedHostname");
}

id objc_msgSend_redirectsUpdaterQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "redirectsUpdaterQueue");
}

id objc_msgSend_refreshDueToTapWithMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshDueToTapWithMessage:");
}

id objc_msgSend_refreshForSession_withReason_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshForSession:withReason:withCompletion:");
}

id objc_msgSend_refreshIDStatusForDestination_service_listenerID_queue_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshIDStatusForDestination:service:listenerID:queue:completionBlock:");
}

id objc_msgSend_refreshLocationForHandles_forSession_callerId_priority_reason_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshLocationForHandles:forSession:callerId:priority:reason:completionBlock:");
}

id objc_msgSend_refreshLocationsForSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshLocationsForSession:");
}

id objc_msgSend_refreshScheduled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshScheduled");
}

id objc_msgSend_refreshTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshTimer");
}

id objc_msgSend_registerAlarms(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerAlarms");
}

id objc_msgSend_registerDefaults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerDefaults:");
}

id objc_msgSend_registerDelegate_forTopic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerDelegate:forTopic:");
}

id objc_msgSend_registerSignalHandlers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerSignalHandlers");
}

id objc_msgSend_registerWithAPS(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerWithAPS");
}

id objc_msgSend_registerXPCEventHandlers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerXPCEventHandlers");
}

id objc_msgSend_registeredDelegates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registeredDelegates");
}

id objc_msgSend_registrationCheckTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registrationCheckTimer");
}

id objc_msgSend_registrationRetries(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registrationRetries");
}

id objc_msgSend_reloadTimeline(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadTimeline");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_removeAllFenceRecordZonesWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllFenceRecordZonesWithCompletion:");
}

id objc_msgSend_removeAllFenceRecordsZonesInDatabase_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllFenceRecordsZonesInDatabase:withCompletion:");
}

id objc_msgSend_removeAllFriendHandles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllFriendHandles");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeCharactersInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeCharactersInString:");
}

id objc_msgSend_removeClientSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeClientSession:");
}

id objc_msgSend_removeDevice_forSession_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDevice:forSession:completion:");
}

id objc_msgSend_removeFavorite_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeFavorite:");
}

id objc_msgSend_removeFavorite_clientSession_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeFavorite:clientSession:completion:");
}

id objc_msgSend_removeFence_clientSession_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeFence:clientSession:completion:");
}

id objc_msgSend_removeFutureFollowerRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeFutureFollowerRequest:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeKey_inDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeKey:inDomain:");
}

id objc_msgSend_removeKeychainItemForService_withUsername_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeKeychainItemForService:withUsername:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_removeObjectsInRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsInRange:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_removeParticipant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeParticipant:");
}

id objc_msgSend_removeRecordWithID_inDatabaseWithScope_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeRecordWithID:inDatabaseWithScope:error:");
}

id objc_msgSend_removeServerChangeTokenForZoneWithID_inDatabaseWithScope_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeServerChangeTokenForZoneWithID:inDatabaseWithScope:error:");
}

id objc_msgSend_removeStoredAPSToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeStoredAPSToken");
}

id objc_msgSend_removeUnacceptedShareInvitationWithShareURLString_inDatabaseWithScope_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeUnacceptedShareInvitationWithShareURLString:inDatabaseWithScope:error:");
}

id objc_msgSend_removeUnrecoverableManateeFences_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeUnrecoverableManateeFences:withCompletion:");
}

id objc_msgSend_renewAccountCredentials_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renewAccountCredentials:");
}

id objc_msgSend_renewCredentialsForAccount_force_reason_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renewCredentialsForAccount:force:reason:completion:");
}

id objc_msgSend_requestId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestId");
}

id objc_msgSend_requestTokens(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestTokens");
}

id objc_msgSend_requestTokensStatusMap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestTokensStatusMap");
}

id objc_msgSend_requestWithIdentifier_content_trigger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithIdentifier:content:trigger:");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reset");
}

id objc_msgSend_resetABCachesInSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetABCachesInSession");
}

id objc_msgSend_resetABPreferencesCachesInSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetABPreferencesCachesInSession");
}

id objc_msgSend_resetModelToUninitialized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetModelToUninitialized");
}

id objc_msgSend_resetRefreshTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetRefreshTimer");
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "response");
}

id objc_msgSend_responseId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "responseId");
}

id objc_msgSend_restoreKeychainUI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreKeychainUI");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resume");
}

id objc_msgSend_retryAcceptShareWithURLString_invitationToken_forError_retryCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retryAcceptShareWithURLString:invitationToken:forError:retryCount:");
}

id objc_msgSend_retryAfterCredentialUpdate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retryAfterCredentialUpdate");
}

id objc_msgSend_retryAfterRenewCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retryAfterRenewCount");
}

id objc_msgSend_retryCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retryCount");
}

id objc_msgSend_retryInviteUnacceptedCKShares(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retryInviteUnacceptedCKShares");
}

id objc_msgSend_retryOperationQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retryOperationQueue");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "run");
}

id objc_msgSend_safelyMapKey_toObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "safelyMapKey:toObject:");
}

id objc_msgSend_safelySetObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "safelySetObject:forKey:");
}

id objc_msgSend_sanitizeBlockList(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sanitizeBlockList");
}

id objc_msgSend_sanitizeLocationsCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sanitizeLocationsCache:");
}

id objc_msgSend_sanitizeLocationsCacheTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sanitizeLocationsCacheTimer");
}

id objc_msgSend_saveDictionary_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveDictionary:error:");
}

id objc_msgSend_saveFavorites_clientSession_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveFavorites:clientSession:completion:");
}

id objc_msgSend_saveFavoritesOperation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveFavoritesOperation");
}

id objc_msgSend_saveFavoritesOperationExecutionQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveFavoritesOperationExecutionQueue");
}

id objc_msgSend_saveFavoritesOperationUpdateQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveFavoritesOperationUpdateQueue");
}

id objc_msgSend_saveVerifiedAccount_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveVerifiedAccount:withCompletionHandler:");
}

id objc_msgSend_schedule(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "schedule");
}

id objc_msgSend_scheduleRefreshBefore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleRefreshBefore:");
}

id objc_msgSend_scheduleTimerFired(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleTimerFired");
}

id objc_msgSend_scheduledFences(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledFences");
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_scheduler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduler");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheme");
}

id objc_msgSend_scope(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scope");
}

id objc_msgSend_scopeStringForAccountWithScope_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scopeStringForAccountWithScope:");
}

id objc_msgSend_secondsFromGMT(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secondsFromGMT");
}

id objc_msgSend_selectedHandles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectedHandles");
}

id objc_msgSend_sendCommand_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendCommand:completionBlock:");
}

id objc_msgSend_sendDeletedFenceMessageWithFenceID_ckRecordID_toHandles_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendDeletedFenceMessageWithFenceID:ckRecordID:toHandles:error:");
}

id objc_msgSend_sendEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEvent:");
}

id objc_msgSend_sendFMFIDSPacket_toHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendFMFIDSPacket:toHandle:");
}

id objc_msgSend_sendFMFIDSPacketsForHandleIdToMappingIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendFMFIDSPacketsForHandleIdToMappingIdentifiers:");
}

id objc_msgSend_sendFriendshipInviteRequest_forSession_callerId_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendFriendshipInviteRequest:forSession:callerId:completion:");
}

id objc_msgSend_sendFriendshipOfferRequest_forSession_callerId_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendFriendshipOfferRequest:forSession:callerId:completion:");
}

id objc_msgSend_sendFriendshipOfferToHandles_groupId_callerId_endDate_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendFriendshipOfferToHandles:groupId:callerId:endDate:completion:");
}

id objc_msgSend_sendInitWithLazyCheckForSession_withReason_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendInitWithLazyCheckForSession:withReason:completion:");
}

id objc_msgSend_sendMappingPacket_toHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMappingPacket:toHandle:");
}

id objc_msgSend_sendMessage_toDestinations_priority_options_identifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMessage:toDestinations:priority:options:identifier:error:");
}

id objc_msgSend_sendMessage_toIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMessage:toIdentifier:error:");
}

id objc_msgSend_sendNotNowRequest_forSession_callerId_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendNotNowRequest:forSession:callerId:completion:");
}

id objc_msgSend_sendOnlyFMFChannel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendOnlyFMFChannel");
}

id objc_msgSend_sendRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendRequest");
}

id objc_msgSend_sendShareURL_andInvitationToken_recordName_toDestinationID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendShareURL:andInvitationToken:recordName:toDestinationID:error:");
}

id objc_msgSend_sendTriggerWithUUID_forFenceWithID_withStatus_forDate_triggerLocation_toHandles_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendTriggerWithUUID:forFenceWithID:withStatus:forDate:triggerLocation:toHandles:error:");
}

id objc_msgSend_sendUpdateGeoFenceCommand(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendUpdateGeoFenceCommand");
}

id objc_msgSend_senderCorrelationIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "senderCorrelationIdentifier");
}

id objc_msgSend_senderIsValid_idsSenderRequirement_fenceId_ckRecordName_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "senderIsValid:idsSenderRequirement:fenceId:ckRecordName:withCompletion:");
}

id objc_msgSend_sequencer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sequencer");
}

id objc_msgSend_serverChangeTokenForDatabaseWithScope_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverChangeTokenForDatabaseWithScope:");
}

id objc_msgSend_serverChangeTokenForZoneWithID_inDatabaseWithScope_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverChangeTokenForZoneWithID:inDatabaseWithScope:");
}

id objc_msgSend_serverChangeTokens(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverChangeTokens");
}

id objc_msgSend_serverContextQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverContextQueue");
}

id objc_msgSend_serverId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverId");
}

id objc_msgSend_serverIds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverIds");
}

id objc_msgSend_serverInteractionController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverInteractionController");
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceName");
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session");
}

id objc_msgSend_sessionConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionConfiguration:");
}

id objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionWithConfiguration:delegate:delegateQueue:");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set");
}

id objc_msgSend_setAcceptSharesCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAcceptSharesCompletionBlock:");
}

id objc_msgSend_setAcceptanceStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAcceptanceStatus:");
}

id objc_msgSend_setAccepted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccepted:");
}

id objc_msgSend_setAccountStateAuthorizedDueTo401(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountStateAuthorizedDueTo401");
}

id objc_msgSend_setAccountStateUnauthorizedDueTo401(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountStateUnauthorizedDueTo401");
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActive:");
}

id objc_msgSend_setActiveCFNotificationsByCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveCFNotificationsByCategory:");
}

id objc_msgSend_setActiveDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveDevice:");
}

id objc_msgSend_setActiveDevice_forSession_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveDevice:forSession:completion:");
}

id objc_msgSend_setActiveUserNotifications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveUserNotifications:");
}

id objc_msgSend_setAlertId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlertId:");
}

id objc_msgSend_setAliasServerIds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAliasServerIds:");
}

id objc_msgSend_setAllFences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllFences:");
}

id objc_msgSend_setAllFencesWithoutCKData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllFencesWithoutCKData:");
}

id objc_msgSend_setAllowFriendRequests_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowFriendRequests:");
}

id objc_msgSend_setAllowFriendRequestsEnabled_forSession_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowFriendRequestsEnabled:forSession:completion:");
}

id objc_msgSend_setAlternateButtonAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlternateButtonAction:");
}

id objc_msgSend_setAlternateButtonTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlternateButtonTitle:");
}

id objc_msgSend_setAppHostnameFromSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppHostnameFromSettings:");
}

id objc_msgSend_setApsConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setApsConnection:");
}

id objc_msgSend_setApsEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setApsEnvironment:");
}

id objc_msgSend_setApsHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setApsHandler:");
}

id objc_msgSend_setAuthToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthToken:");
}

id objc_msgSend_setAuthTokenStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthTokenStatus:");
}

id objc_msgSend_setAutomaticallyRetryNetworkFailures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutomaticallyRetryNetworkFailures:");
}

id objc_msgSend_setBackedUp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackedUp:");
}

id objc_msgSend_setBlockingDialogs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBlockingDialogs:");
}

id objc_msgSend_setBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBody:");
}

id objc_msgSend_setBoostrapScheduled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBoostrapScheduled:");
}

id objc_msgSend_setBootstrapRetryInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBootstrapRetryInterval:");
}

id objc_msgSend_setByAddingObjectsFromSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setByAddingObjectsFromSet:");
}

id objc_msgSend_setCachedFirstInvitedDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedFirstInvitedDate:");
}

id objc_msgSend_setCachedRedirects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedRedirects:");
}

id objc_msgSend_setCachedTapMessages_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedTapMessages:");
}

id objc_msgSend_setCachesWarmedUp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachesWarmedUp:");
}

id objc_msgSend_setCallerId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallerId:");
}

id objc_msgSend_setCallerIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallerIdentifier:");
}

id objc_msgSend_setCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCategory:");
}

id objc_msgSend_setCategoryIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCategoryIdentifier:");
}

id objc_msgSend_setChangeTokenUpdatedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChangeTokenUpdatedBlock:");
}

id objc_msgSend_setChangesToBeNotified_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChangesToBeNotified:");
}

id objc_msgSend_setCkRecordName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCkRecordName:");
}

id objc_msgSend_setCkRecordZoneOwnerName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCkRecordZoneOwnerName:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setClientBundleId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientBundleId:");
}

id objc_msgSend_setClientPid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientPid:");
}

id objc_msgSend_setClientSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientSession:");
}

id objc_msgSend_setCloudKitAPSHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCloudKitAPSHandler:");
}

id objc_msgSend_setCoalescedAppContexts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCoalescedAppContexts:");
}

id objc_msgSend_setCoalescedCommands_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCoalescedCommands:");
}

id objc_msgSend_setColeasedRefreshPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setColeasedRefreshPriority:");
}

id objc_msgSend_setCommandDataContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCommandDataContext:");
}

id objc_msgSend_setCommandServerContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCommandServerContext:");
}

id objc_msgSend_setCommandStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCommandStatus:");
}

id objc_msgSend_setCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletionBlock:");
}

id objc_msgSend_setConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConnection:");
}

id objc_msgSend_setContainer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContainer:");
}

id objc_msgSend_setCreateDirectories_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCreateDirectories:");
}

id objc_msgSend_setCurrentOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentOperation:");
}

id objc_msgSend_setData_forAccount_service_synchronizable_dataProtectionClass_migratable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setData:forAccount:service:synchronizable:dataProtectionClass:migratable:");
}

id objc_msgSend_setDataArchiver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataArchiver:");
}

id objc_msgSend_setDataProtectionClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataProtectionClass:");
}

id objc_msgSend_setDatabase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDatabase:");
}

id objc_msgSend_setDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDate:");
}

id objc_msgSend_setDaysOfWeek_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDaysOfWeek:");
}

id objc_msgSend_setDefaultButtonAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultButtonAction:");
}

id objc_msgSend_setDefaultButtonTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultButtonTitle:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDestinations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDestinations:");
}

id objc_msgSend_setDeviceId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceId:");
}

id objc_msgSend_setDiscretionaryNetworkBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiscretionaryNetworkBehavior:");
}

id objc_msgSend_setDismissMsgOnLock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDismissMsgOnLock:");
}

id objc_msgSend_setDismissMsgOnUnlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDismissMsgOnUnlock:");
}

id objc_msgSend_setDsid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDsid:");
}

id objc_msgSend_setEnabledTopics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabledTopics:");
}

id objc_msgSend_setEndHour_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndHour:");
}

id objc_msgSend_setEndMin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndMin:");
}

id objc_msgSend_setEnumToStringMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnumToStringMap:");
}

id objc_msgSend_setEnvironmentName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnvironmentName:");
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setError:");
}

id objc_msgSend_setExecutionCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExecutionCompletionBlock:");
}

id objc_msgSend_setExpiresByGroupId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpiresByGroupId:");
}

id objc_msgSend_setExpiresDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpiresDate:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFavoriteHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFavoriteHandles:");
}

id objc_msgSend_setFavoriteOrder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFavoriteOrder:");
}

id objc_msgSend_setFavorites_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFavorites:");
}

id objc_msgSend_setFavoritesData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFavoritesData:");
}

id objc_msgSend_setFavoritesSequencer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFavoritesSequencer:");
}

id objc_msgSend_setFence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFence:");
}

id objc_msgSend_setFenceManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFenceManager:");
}

id objc_msgSend_setFenceSequencer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFenceSequencer:");
}

id objc_msgSend_setFences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFences:");
}

id objc_msgSend_setFencesFromResponseDictionary_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFencesFromResponseDictionary:withCompletion:");
}

id objc_msgSend_setFencesOnMeByMe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFencesOnMeByMe:");
}

id objc_msgSend_setFencesOnMeByOthers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFencesOnMeByOthers:");
}

id objc_msgSend_setFencesOnOthersByMe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFencesOnOthersByMe:");
}

id objc_msgSend_setFencesOnOthersByOthers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFencesOnOthersByOthers:");
}

id objc_msgSend_setFencesWithoutCKData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFencesWithoutCKData:");
}

id objc_msgSend_setFetchDatabaseChangesCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchDatabaseChangesCompletionBlock:");
}

id objc_msgSend_setFetchRecordZoneChangesCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchRecordZoneChangesCompletionBlock:");
}

id objc_msgSend_setFetchRecordZonesCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchRecordZonesCompletionBlock:");
}

id objc_msgSend_setFetchShareMetadataCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchShareMetadataCompletionBlock:");
}

id objc_msgSend_setFetchShareParticipantsCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchShareParticipantsCompletionBlock:");
}

id objc_msgSend_setFetchStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchStatus:");
}

id objc_msgSend_setFmfAppHostName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFmfAppHostName:");
}

id objc_msgSend_setFmfAppToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFmfAppToken:");
}

id objc_msgSend_setFmfHostName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFmfHostName:");
}

id objc_msgSend_setFmfToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFmfToken:");
}

id objc_msgSend_setFmf_otherParticipants_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFmf_otherParticipants:");
}

id objc_msgSend_setFollower_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFollower:");
}

id objc_msgSend_setFollowerHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFollowerHandles:");
}

id objc_msgSend_setFollowersFullyInited_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFollowersFullyInited:");
}

id objc_msgSend_setFollowersInfoReceived_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFollowersInfoReceived:");
}

id objc_msgSend_setFollowing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFollowing:");
}

id objc_msgSend_setFollowingFullyInited_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFollowingFullyInited:");
}

id objc_msgSend_setFollowingHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFollowingHandles:");
}

id objc_msgSend_setFollowingInfoReceived_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFollowingInfoReceived:");
}

id objc_msgSend_setFriendIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFriendIdentifier:");
}

id objc_msgSend_setFriendRequestId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFriendRequestId:");
}

id objc_msgSend_setFromMe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFromMe:");
}

id objc_msgSend_setFutureFollowerRequests_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFutureFollowerRequests:");
}

id objc_msgSend_setGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGroup:");
}

id objc_msgSend_setGroupId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGroupId:");
}

id objc_msgSend_setHTTPCookieAcceptPolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPCookieAcceptPolicy:");
}

id objc_msgSend_setHTTPCookieStorage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPCookieStorage:");
}

id objc_msgSend_setHTTPMethod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPMethod:");
}

id objc_msgSend_setHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandles:");
}

id objc_msgSend_setHandlesQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandlesQueue:");
}

id objc_msgSend_setHandlesToBeLocated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandlesToBeLocated:");
}

id objc_msgSend_setHasModelInitialized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasModelInitialized:");
}

id objc_msgSend_setHashedDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHashedDSID:");
}

id objc_msgSend_setHideLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHideLocation:");
}

id objc_msgSend_setHideMyLocationEnabled_forSession_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHideMyLocationEnabled:forSession:completion:");
}

id objc_msgSend_setHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHost:");
}

id objc_msgSend_setHour_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHour:");
}

id objc_msgSend_setICloudId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setICloudId:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIdsStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdsStatus:");
}

id objc_msgSend_setInteger_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteger:forKey:");
}

id objc_msgSend_setInternalClientSessions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInternalClientSessions:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInterruptionLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionLevel:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setInvitationSentToIds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvitationSentToIds:");
}

id objc_msgSend_setInvitePending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvitePending:");
}

id objc_msgSend_setIsPendingRefresh_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsPendingRefresh:");
}

id objc_msgSend_setIsReachable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsReachable:");
}

id objc_msgSend_setIsRefreshInProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsRefreshInProgress:");
}

id objc_msgSend_setIsRenewingAccountCredentials_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsRenewingAccountCredentials:");
}

id objc_msgSend_setIsShallowLocate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsShallowLocate:");
}

id objc_msgSend_setIsUpdateGeoFenceCompleted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsUpdateGeoFenceCompleted:");
}

id objc_msgSend_setIsUpdatingAccountCredentials_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsUpdatingAccountCredentials:");
}

id objc_msgSend_setKeychainItemForService_withUsername_value_accessibility_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeychainItemForService:withUsername:value:accessibility:");
}

id objc_msgSend_setKeychainManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeychainManager:");
}

id objc_msgSend_setLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLabel:");
}

id objc_msgSend_setLastRefreshDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastRefreshDate:");
}

id objc_msgSend_setLastSuccessfulInitDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastSuccessfulInitDate:");
}

id objc_msgSend_setLastSuccessfulResponseTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastSuccessfulResponseTimestamp:");
}

id objc_msgSend_setLatest401TS_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLatest401TS:");
}

id objc_msgSend_setLatest5XXTS_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLatest5XXTS:");
}

id objc_msgSend_setLatestXPCActivityRegistrationTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLatestXPCActivityRegistrationTime:");
}

id objc_msgSend_setLaunchOnRebootActivity_keepAliveActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLaunchOnRebootActivity:keepAliveActivity:");
}

id objc_msgSend_setLazyInitTimeoutInSecStoredValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLazyInitTimeoutInSecStoredValue:");
}

id objc_msgSend_setLazyTimeLoaded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLazyTimeLoaded:");
}

id objc_msgSend_setListener_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setListener:");
}

id objc_msgSend_setLocatingInProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocatingInProgress:");
}

id objc_msgSend_setLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocation:");
}

id objc_msgSend_setLocationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocationType:");
}

id objc_msgSend_setLocations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocations:");
}

id objc_msgSend_setLocationsFromData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocationsFromData:");
}

id objc_msgSend_setMappingPacketToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMappingPacketToken:");
}

id objc_msgSend_setMinute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinute:");
}

id objc_msgSend_setModelVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModelVersion:");
}

id objc_msgSend_setModifyRecordZonesCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModifyRecordZonesCompletionBlock:");
}

id objc_msgSend_setModifyRecordsCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModifyRecordsCompletionBlock:");
}

id objc_msgSend_setModifySubscriptionsCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModifySubscriptionsCompletionBlock:");
}

id objc_msgSend_setMsgText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMsgText:");
}

id objc_msgSend_setMsgTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMsgTitle:");
}

id objc_msgSend_setMuteEndDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMuteEndDate:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNonNotifiableRecipients_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNonNotifiableRecipients:");
}

id objc_msgSend_setNotificationInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationInfo:");
}

id objc_msgSend_setNumberOfFriendsAndFollowers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfFriendsAndFollowers:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOfferPending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOfferPending:");
}

id objc_msgSend_setOperationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOperationType:");
}

id objc_msgSend_setPacketsToInvalidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPacketsToInvalidate:");
}

id objc_msgSend_setPassword_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPassword:");
}

id objc_msgSend_setPending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPending:");
}

id objc_msgSend_setPendingOfferHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPendingOfferHandles:");
}

id objc_msgSend_setPendingPushes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPendingPushes:");
}

id objc_msgSend_setPerShareCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPerShareCompletionBlock:");
}

id objc_msgSend_setPerShareMetadataBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPerShareMetadataBlock:");
}

id objc_msgSend_setPlacemark_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlacemark:");
}

id objc_msgSend_setPort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPort:");
}

id objc_msgSend_setPreferredColeasedRefreshPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredColeasedRefreshPriority:");
}

id objc_msgSend_setPreviousServerChangeToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreviousServerChangeToken:");
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPriority:");
}

id objc_msgSend_setQualifiedIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQualifiedIdentifier:");
}

id objc_msgSend_setQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueue:");
}

id objc_msgSend_setReachable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReachable:");
}

id objc_msgSend_setReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReason:");
}

id objc_msgSend_setRecipients_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecipients:");
}

id objc_msgSend_setRecordChangedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecordChangedBlock:");
}

id objc_msgSend_setRecordWithIDWasDeletedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecordWithIDWasDeletedBlock:");
}

id objc_msgSend_setRecordZoneChangeTokensUpdatedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecordZoneChangeTokensUpdatedBlock:");
}

id objc_msgSend_setRecordZoneFetchCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecordZoneFetchCompletionBlock:");
}

id objc_msgSend_setRecordZoneWithIDChangedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecordZoneWithIDChangedBlock:");
}

id objc_msgSend_setRecordZoneWithIDWasDeletedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecordZoneWithIDWasDeletedBlock:");
}

id objc_msgSend_setRedirectsUpdaterQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRedirectsUpdaterQueue:");
}

id objc_msgSend_setRefreshScheduled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRefreshScheduled:");
}

id objc_msgSend_setRefreshTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRefreshTimer:");
}

id objc_msgSend_setRegisteredDelegates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRegisteredDelegates:");
}

id objc_msgSend_setRegistrationCheckTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRegistrationCheckTimer:");
}

id objc_msgSend_setRegistrationRetries_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRegistrationRetries:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRequestCachePolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestCachePolicy:");
}

id objc_msgSend_setRequestTokens_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestTokens:");
}

id objc_msgSend_setRequestTokensStatusCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestTokensStatusCode:");
}

id objc_msgSend_setRequestTokensStatusMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestTokensStatusMap:");
}

id objc_msgSend_setRequiresSecureCoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiresSecureCoding:");
}

id objc_msgSend_setResponseId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResponseId:");
}

id objc_msgSend_setRetryAfterRenewCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRetryAfterRenewCount:");
}

id objc_msgSend_setRetryCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRetryCount:");
}

id objc_msgSend_setSanitizeLocationsCacheTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSanitizeLocationsCacheTimer:");
}

id objc_msgSend_setSaveFavoritesOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSaveFavoritesOperation:");
}

id objc_msgSend_setSchedule_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSchedule:");
}

id objc_msgSend_setSchedules_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSchedules:");
}

id objc_msgSend_setScheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScheme:");
}

id objc_msgSend_setSelectedHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedHandles:");
}

id objc_msgSend_setSequencer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSequencer:");
}

id objc_msgSend_setServerContextQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServerContextQueue:");
}

id objc_msgSend_setServerHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServerHost:");
}

id objc_msgSend_setServerId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServerId:");
}

id objc_msgSend_setServerInteractionController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServerInteractionController:");
}

id objc_msgSend_setServerProtocolScheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServerProtocolScheme:");
}

id objc_msgSend_setSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSession:");
}

id objc_msgSend_setShareParticipantFetchedBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShareParticipantFetchedBlock:");
}

id objc_msgSend_setShouldSendContentAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldSendContentAvailable:");
}

id objc_msgSend_setShowMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowMessage:");
}

id objc_msgSend_setShowMsgInLockScreen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowMsgInLockScreen:");
}

id objc_msgSend_setSkippedReasons_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSkippedReasons:");
}

id objc_msgSend_setSkippedRefreshReasons_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSkippedRefreshReasons:");
}

id objc_msgSend_setSound_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSound:");
}

id objc_msgSend_setStartHour_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartHour:");
}

id objc_msgSend_setStartMin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartMin:");
}

id objc_msgSend_setStatus_forDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatus:forDate:");
}

id objc_msgSend_setStatusMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatusMap:");
}

id objc_msgSend_setStatusMapFromServer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatusMapFromServer:");
}

id objc_msgSend_setStoreController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStoreController:");
}

id objc_msgSend_setStoredConfigLoaded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStoredConfigLoaded:");
}

id objc_msgSend_setThreadIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setThreadIdentifier:");
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeZone:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTopic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTopic:");
}

id objc_msgSend_setTrackingTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrackingTimestamp:");
}

id objc_msgSend_setTransactionId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransactionId:");
}

id objc_msgSend_setTriggerForRepeatedFenceBeforeAccpetanceWithTriggerStatus_date_location_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTriggerForRepeatedFenceBeforeAccpetanceWithTriggerStatus:date:location:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setType:");
}

id objc_msgSend_setURLCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setURLCache:");
}

id objc_msgSend_setURLCredentialStorage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setURLCredentialStorage:");
}

id objc_msgSend_setUpdateCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateCompletionBlock:");
}

id objc_msgSend_setUpdatedFence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdatedFence:");
}

id objc_msgSend_setUseZoneWidePCS_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseZoneWidePCS:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setUsername_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsername:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithCapacity:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_set_appleIDContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_appleIDContext:");
}

id objc_msgSend_set_configFromServer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_configFromServer:");
}

id objc_msgSend_set_devices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_devices:");
}

id objc_msgSend_set_features_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_features:");
}

id objc_msgSend_set_followerHandleMapWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_followerHandleMapWithIdentifier:");
}

id objc_msgSend_set_followerHandleMapWithServerId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_followerHandleMapWithServerId:");
}

id objc_msgSend_set_followerHandlesInternal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_followerHandlesInternal:");
}

id objc_msgSend_set_followingHandleMapWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_followingHandleMapWithIdentifier:");
}

id objc_msgSend_set_followingHandleMapWithServerId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_followingHandleMapWithServerId:");
}

id objc_msgSend_set_followingHandlesInternal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_followingHandlesInternal:");
}

id objc_msgSend_set_futureFollowerRequestMapWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_futureFollowerRequestMapWithIdentifier:");
}

id objc_msgSend_set_futureFollowerRequestsInternal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_futureFollowerRequestsInternal:");
}

id objc_msgSend_set_futureFollowingRequestsInternal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_futureFollowingRequestsInternal:");
}

id objc_msgSend_set_handlesInternal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_handlesInternal:");
}

id objc_msgSend_set_locationDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_locationDictionary:");
}

id objc_msgSend_set_meDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_meDevice:");
}

id objc_msgSend_set_myInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_myInfo:");
}

id objc_msgSend_set_preferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_preferences:");
}

id objc_msgSend_set_serverContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_serverContext:");
}

id objc_msgSend_set_sourceApplicationBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_sourceApplicationBundleIdentifier:");
}

id objc_msgSend_setupAuthentication(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupAuthentication");
}

id objc_msgSend_shareInvitationTokenFromString_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shareInvitationTokenFromString:error:");
}

id objc_msgSend_shareMyLocationSystemServiceEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shareMyLocationSystemServiceEnabled");
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shared");
}

id objc_msgSend_sharedAddressBook(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedAddressBook");
}

id objc_msgSend_sharedCloudDatabase(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedCloudDatabase");
}

id objc_msgSend_sharedConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedConfiguration");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedConnection");
}

id objc_msgSend_sharedDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedDefaults");
}

id objc_msgSend_sharedHandleTransactionQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedHandleTransactionQueue");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedNetworkObserver(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedNetworkObserver");
}

id objc_msgSend_sharedPrivacyManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedPrivacyManager");
}

id objc_msgSend_shiftCoordinate_accuracy_withCompletionHandler_mustGoToNetworkCallback_errorHandler_callbackQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:");
}

id objc_msgSend_shiftLocations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shiftLocations:");
}

id objc_msgSend_shortDisplayNameForContact_andHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shortDisplayNameForContact:andHandle:");
}

id objc_msgSend_shortNameFormatPrefersNicknames(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shortNameFormatPrefersNicknames");
}

id objc_msgSend_shouldDisplayAlerts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldDisplayAlerts");
}

id objc_msgSend_shouldIncludeDataContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldIncludeDataContext");
}

id objc_msgSend_shouldIncludeServerContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldIncludeServerContext");
}

id objc_msgSend_shouldPostForStatus_atDate_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldPostForStatus:atDate:reason:");
}

id objc_msgSend_shouldPostForStatus_givenPreviousStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldPostForStatus:givenPreviousStatus:");
}

id objc_msgSend_shouldUseCloudKitStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldUseCloudKitStore");
}

id objc_msgSend_showForbiddenRegionAlert(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showForbiddenRegionAlert");
}

id objc_msgSend_showLocationServicesSwitchOffAlert(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showLocationServicesSwitchOffAlert");
}

id objc_msgSend_showMaxFollowersLimitReachedAlert(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showMaxFollowersLimitReachedAlert");
}

id objc_msgSend_showMessage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showMessage");
}

id objc_msgSend_showMsgInLockScreen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showMsgInLockScreen");
}

id objc_msgSend_showRestrictedAlert(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showRestrictedAlert");
}

id objc_msgSend_showShareMyLocationSystemServiceOffAlert(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showShareMyLocationSystemServiceOffAlert");
}

id objc_msgSend_showShareMyLocationiCloudSettingsOffAlert(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showShareMyLocationiCloudSettingsOffAlert");
}

id objc_msgSend_showSwitchMeDeviceAlertUsingCurrentMeDeviceName_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showSwitchMeDeviceAlertUsingCurrentMeDeviceName:completion:");
}

id objc_msgSend_signal(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signal");
}

id objc_msgSend_skippedReasons(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "skippedReasons");
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorWithKey:ascending:");
}

id objc_msgSend_sortedArrayUsingDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingDescriptors:");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "source");
}

id objc_msgSend_sourceVersionFromVersionFile(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceVersionFromVersionFile");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_startHour(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startHour");
}

id objc_msgSend_startListeningForNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startListeningForNotifications");
}

id objc_msgSend_startMin(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startMin");
}

id objc_msgSend_startup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startup");
}

id objc_msgSend_startupComplete(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startupComplete");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "state");
}

id objc_msgSend_statusByWindowStartDateByFenceID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusByWindowStartDateByFenceID");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusCode");
}

id objc_msgSend_statusForDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusForDate:");
}

id objc_msgSend_statusMap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusMap");
}

id objc_msgSend_statusMapFromServer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusMapFromServer");
}

id objc_msgSend_stopListeningForNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopListeningForNotifications");
}

id objc_msgSend_stopSharingMyLocationWithHandles_forSession_groupId_callerId_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopSharingMyLocationWithHandles:forSession:groupId:callerId:completion:");
}

id objc_msgSend_stopSharingMyLocationWithHandles_groupId_callerId_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopSharingMyLocationWithHandles:groupId:callerId:completion:");
}

id objc_msgSend_stopTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopTimer");
}

id objc_msgSend_storeController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeController");
}

id objc_msgSend_storeInvalidMappingPacketsForFutureRemoval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeInvalidMappingPacketsForFutureRemoval:");
}

id objc_msgSend_storeMappingPacket_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeMappingPacket:");
}

id objc_msgSend_storeRedirectsToDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeRedirectsToDefaults");
}

id objc_msgSend_storeSavedAPSToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeSavedAPSToken:");
}

id objc_msgSend_storeTapMessagesToDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeTapMessagesToDefaults");
}

id objc_msgSend_storedConfigLoaded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storedConfigLoaded");
}

id objc_msgSend_storedDSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storedDSID");
}

id objc_msgSend_storedDSIDMatchesDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storedDSIDMatchesDSID:");
}

id objc_msgSend_streetAddress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "streetAddress");
}

id objc_msgSend_streetName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "streetName");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathExtension:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByDeletingLastPathComponent");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringForReasonCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForReasonCode:");
}

id objc_msgSend_stringFromBootstrapReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromBootstrapReason:");
}

id objc_msgSend_stringFromShareInvitationToken_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromShareInvitationToken:error:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_subdataWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subdataWithRange:");
}

id objc_msgSend_subscribeToChangesInDatabase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribeToChangesInDatabase:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronize");
}

id objc_msgSend_tapContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tapContext");
}

id objc_msgSend_tapMessagesFromDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tapMessagesFromDefaults");
}

id objc_msgSend_thisDeviceId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "thisDeviceId");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_timeZone(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeZone");
}

id objc_msgSend_timeZoneWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeZoneWithName:");
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeout");
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timestamp");
}

id objc_msgSend_toHandles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toHandles");
}

id objc_msgSend_topic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "topic");
}

id objc_msgSend_trackingTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackingTimestamp");
}

id objc_msgSend_transcriptDelegateStartEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transcriptDelegateStartEnabled");
}

id objc_msgSend_transcriptDelegateStopEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transcriptDelegateStopEnabled");
}

id objc_msgSend_trigger(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trigger");
}

id objc_msgSend_triggerAfterAcceptanceWithUUID_forFencewithID_withStatus_withAcceptanceStatus_atDate_triggerLocation_clientSession_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "triggerAfterAcceptanceWithUUID:forFencewithID:withStatus:withAcceptanceStatus:atDate:triggerLocation:clientSession:completion:");
}

id objc_msgSend_triggerForRepeatedFenceBeforeAcceptanceWithFence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "triggerForRepeatedFenceBeforeAcceptanceWithFence:");
}

id objc_msgSend_triggerManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "triggerManager");
}

id objc_msgSend_triggerManager_didModifyFence_clientSession_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "triggerManager:didModifyFence:clientSession:withCompletion:");
}

id objc_msgSend_triggerManager_didModifyFence_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "triggerManager:didModifyFence:withCompletion:");
}

id objc_msgSend_triggerRepeatedFence_clientSesssion_afterAccpetanceWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "triggerRepeatedFence:clientSesssion:afterAccpetanceWithCompletion:");
}

id objc_msgSend_triggerWithUUID_forFence_withStatus_atDate_triggerLocation_clientSession_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "triggerWithUUID:forFence:withStatus:atDate:triggerLocation:clientSession:completion:");
}

id objc_msgSend_triggerWithUUID_forFenceWithID_withStatus_atDate_triggerLocation_clientSession_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "triggerWithUUID:forFenceWithID:withStatus:atDate:triggerLocation:clientSession:completion:");
}

id objc_msgSend_triggerWithUUID_forFenceWithID_withStatus_forDate_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "triggerWithUUID:forFenceWithID:withStatus:forDate:completion:");
}

id objc_msgSend_triggerWithUUID_forFenceWithID_withStatus_forDate_triggerLocation_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "triggerWithUUID:forFenceWithID:withStatus:forDate:triggerLocation:completion:");
}

id objc_msgSend_triggerWithUUID_status_atDate_triggerLocation_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "triggerWithUUID:status:atDate:triggerLocation:completion:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "type");
}

id objc_msgSend_unacceptedShareInvitationsInDatabaseWithScope_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unacceptedShareInvitationsInDatabaseWithScope:");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_unformattedInternationalRepresentation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unformattedInternationalRepresentation");
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_unlockState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unlockState");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedLongValue");
}

id objc_msgSend_updateAccountCredentials_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAccountCredentials:");
}

id objc_msgSend_updateAccountInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAccountInfo");
}

id objc_msgSend_updateAccountWithFMFTokens(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAccountWithFMFTokens");
}

id objc_msgSend_updateClientsWithLocallyStoredModelCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateClientsWithLocallyStoredModelCache");
}

id objc_msgSend_updateCompletionBlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCompletionBlock");
}

id objc_msgSend_updateFence_clientSession_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateFence:clientSession:completion:");
}

id objc_msgSend_updateFenceMuteEndDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateFenceMuteEndDate:");
}

id objc_msgSend_updateFollowers_withCombinedGroupIdsFromPending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateFollowers:withCombinedGroupIdsFromPending:");
}

id objc_msgSend_updateFriendsFollowersCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateFriendsFollowersCount:");
}

id objc_msgSend_updateFromFence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateFromFence:");
}

id objc_msgSend_updateFromRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateFromRecord:");
}

id objc_msgSend_updateHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateHandle:");
}

id objc_msgSend_updateHandles_withFavoriteArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateHandles:withFavoriteArray:");
}

id objc_msgSend_updateHandlesWithFavorites_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateHandlesWithFavorites:");
}

id objc_msgSend_updateHeartbeat(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateHeartbeat");
}

id objc_msgSend_updateIDSStatusForHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateIDSStatusForHandle:");
}

id objc_msgSend_updateInited(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateInited");
}

id objc_msgSend_updateIsActive_isThisDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateIsActive:isThisDevice:");
}

id objc_msgSend_updateLastLoggedInPrsId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLastLoggedInPrsId:");
}

id objc_msgSend_updateLazyInitTimeoutInSecStoredValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLazyInitTimeoutInSecStoredValue:");
}

id objc_msgSend_updateModelCacheWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateModelCacheWithData:");
}

id objc_msgSend_updateRecord_andShare_inDatabase_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateRecord:andShare:inDatabase:withCompletion:");
}

id objc_msgSend_updateRecord_inDatabaseWithScope_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateRecord:inDatabaseWithScope:error:");
}

id objc_msgSend_updateRecord_inZoneSharedWith_inDatabaseWithScope_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateRecord:inZoneSharedWith:inDatabaseWithScope:withCompletion:");
}

id objc_msgSend_updateRedirectsCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateRedirectsCache:");
}

id objc_msgSend_updateServerChangeToken_forDatabaseWithScope_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateServerChangeToken:forDatabaseWithScope:error:");
}

id objc_msgSend_updateServerChangeToken_forZoneWithID_inDatabaseWithScope_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateServerChangeToken:forZoneWithID:inDatabaseWithScope:error:");
}

id objc_msgSend_updateSessionCaches_forSessions_pushAllData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSessionCaches:forSessions:pushAllData:");
}

id objc_msgSend_updateStoredDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateStoredDSID:");
}

id objc_msgSend_updateTapMessagesCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTapMessagesCache:");
}

id objc_msgSend_updateTrackingTimestampForHandle_timestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTrackingTimestampForHandle:timestamp:");
}

id objc_msgSend_updateUnacceptedShareInvitationsWithShareURLString_invitationTokenBase64String_InDatabaseWithScope_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateUnacceptedShareInvitationsWithShareURLString:invitationTokenBase64String:InDatabaseWithScope:error:");
}

id objc_msgSend_updateWithCachedHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithCachedHandles:");
}

id objc_msgSend_updateZoneWithID_inDatabase_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateZoneWithID:inDatabase:withCompletion:");
}

id objc_msgSend_updateZoneWithID_withShareRecipients_inDatabase_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateZoneWithID:withShareRecipients:inDatabase:withCompletion:");
}

id objc_msgSend_upsellTimeoutInSeconds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "upsellTimeoutInSeconds");
}

id objc_msgSend_upselliCloudAlert(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "upselliCloudAlert");
}

id objc_msgSend_upselliCloudIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "upselliCloudIfNeeded");
}

id objc_msgSend_userIdentity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userIdentity");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userLocateWaitIntervalInMS(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userLocateWaitIntervalInMS");
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "username");
}

id objc_msgSend_valueForCapability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForCapability:");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueForResponseHTTPHeader_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForResponseHTTPHeader:");
}

id objc_msgSend_wait(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wait");
}

id objc_msgSend_wasRedirected(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wasRedirected");
}

id objc_msgSend_wasSuccessful(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wasSuccessful");
}

id objc_msgSend_weakToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "weakToStrongObjectsMapTable");
}

id objc_msgSend_weekdaySymbols(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "weekdaySymbols");
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "whitespaceAndNewlineCharacterSet");
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:options:error:");
}

id objc_msgSend_xpcDarwinEventHandlers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xpcDarwinEventHandlers");
}

id objc_msgSend_xpcDistributedEventHandlers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xpcDistributedEventHandlers");
}

id objc_msgSend_zoneID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "zoneID");
}

id objc_msgSend_zoneName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "zoneName");
}

id objc_msgSend_zoneServerChangeTokens(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "zoneServerChangeTokens");
}
