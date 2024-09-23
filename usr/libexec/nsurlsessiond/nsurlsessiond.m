void sub_100005A54(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100005D4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100005EA8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100005FC8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000060C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1000061DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000062D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000062E0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessPredicate predicateMatchingBundleIdentifiers:](RBSProcessPredicate, "predicateMatchingBundleIdentifiers:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48)));
  v6 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  objc_msgSend(v3, "setPredicates:", v5);

}

void sub_100006394(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10000641C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000642C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  __int16 v13;
  uint64_t v14;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getBackgroundSettingsAppList"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));
    if (v3)
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));
    else
      v4 = &__kCFBooleanTrue;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 40));
    if (v3)

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "monitoredBundleIDsUpdated");
    v5 = (id)qword_1000C7158;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count");
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
      v9 = 138412802;
      v10 = v6;
      v11 = 2048;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Started monitoring app %@, now %lu total %@", (uint8_t *)&v9, 0x20u);
    }

  }
}

void sub_10000658C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100006718(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100006744(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  BOOL v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 336), "count"))
  {
    v2 = (id)qword_1000C7158;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier"));
      *(_DWORD *)buf = 138412290;
      v27 = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Bumping priority of AVAssetDownloads for %@ since it entered the foreground", buf, 0xCu);

    }
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 336);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "objectForKeyedSubscript:", v9));
        v11 = v10 == 0;

        if (v11)
          objc_msgSend(v4, "addObject:", v9);
        else
          objc_msgSend(*(id *)(a1 + 32), "updatePriorityForTaskID:", v9);
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v6);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(a1 + 32), "updatePriorityForTaskID:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)j), (_QWORD)v16);
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

void sub_1000069AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100006A30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100006BD8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100006CC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_100006CF8(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1[4] + 24), "objectForKeyedSubscript:", a1[5]));

  if (!v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    objc_msgSend(*(id *)(a1[4] + 24), "setObject:forKeyedSubscript:", v3, a1[5]);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1[4] + 24), "objectForKeyedSubscript:", a1[5]));
  objc_msgSend(v4, "addObject:", a1[6]);

  v5 = (id)qword_1000C7158;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[5];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1[4] + 24), "objectForKeyedSubscript:", v6));
    v8 = 138412546;
    v9 = v6;
    v10 = 2048;
    v11 = objc_msgSend(v7, "count");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Added observer for app %@, now %lu observers", (uint8_t *)&v8, 0x16u);

  }
}

void sub_100006E34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100007070(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000071A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000723C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100007518(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100007F10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_10000912C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_100009ADC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_100009D1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

uint64_t sub_100009E20(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;

  v2 = (id)qword_1000C7158;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
    v5 = 138543362;
    v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Invoking client reconnection completion block", (uint8_t *)&v5, 0xCu);

  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 232), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "performAllCallbacks");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void sub_100009F08(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000A148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_10000A554(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_10000A5F8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NDTaskMonitor *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48)));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", v3));

  if (*(_BYTE *)(a1 + 56))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "requestWithAdjustedWindowForTaskInfo:", *(_QWORD *)(a1 + 40)));
    objc_msgSend(v4, "updateCurrentRequest:", v5);

  }
  v6 = (id)qword_1000C7158;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_loggableDescription"));
    *(_DWORD *)buf = 138543618;
    v20 = v7;
    v21 = 2114;
    v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ will begin", buf, 0x16u);

  }
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48)));
  v11 = (NDTaskMonitor *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v10));

  if (!v11)
  {
    v12 = objc_msgSend(*(id *)(a1 + 40), "isDiscretionary");
    v13 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v13 + 142))
      v14 = v12 | 2;
    else
      v14 = v12;
    if (*(_BYTE *)(v13 + 146) || objc_msgSend(*(id *)(v13 + 32), "canBeSuspended"))
      v14 |= 4uLL;
    v11 = -[NDTaskMonitor initWithTask:taskInfo:clientBundleIdentifier:secondaryIdentifier:monitoredApplication:priority:options:queue:]([NDTaskMonitor alloc], "initWithTask:taskInfo:clientBundleIdentifier:secondaryIdentifier:monitoredApplication:priority:options:queue:", v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 296), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216), objc_msgSend(*(id *)(a1 + 40), "basePriority"), v14, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200));
    v15 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48)));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, v16);

  }
  -[NDTaskMonitor taskWillResume](v11, "taskWillResume");
  sub_10000B8B4(0, *(void **)(*(_QWORD *)(a1 + 32) + 280), *(void **)(*(_QWORD *)(a1 + 32) + 272), *(void **)(*(_QWORD *)(a1 + 32) + 288), *(void **)(*(_QWORD *)(a1 + 32) + 296), v4, *(void **)(a1 + 40), 0);
  v17 = *(void **)(a1 + 32);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentRequest_URL"));
  LOBYTE(v17) = objc_msgSend(v17, "errorIfBlockedTracker:url:", v4, v18);

  if ((v17 & 1) == 0)
    objc_msgSend(v4, "resume");

}

void sub_10000A8C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10000AAA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_10000B658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_10000B8B4(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, char a8)
{
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  char v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;

  v39 = a2;
  v38 = a3;
  v15 = a4;
  v37 = a5;
  v16 = a6;
  v36 = a7;
  v40 = v16;
  v35 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_metrics"));
  v34 = a1;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "_daemon_currentTransactionMetrics"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_daemon_connectionMetrics"));
  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "_sourceApplicationBundleIdentifierForMobileAsset"));
  v21 = (void *)v20;
  v33 = a8;
  if (v20)
    v22 = (id)v20;
  else
    v22 = v15;
  v32 = v22;
  v31 = objc_msgSend(v18, "_daemon_requestHeaderSize");
  v30 = objc_msgSend(v18, "_daemon_requestBodyTransferSize");
  v23 = objc_msgSend(v18, "_daemon_responseHeaderSize");
  v24 = objc_msgSend(v18, "_daemon_responseBodyTransferSize");
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "_daemon_interfaceName"));
  v26 = objc_msgSend(v19, "_daemon_isDiscretionary");
  v27 = objc_msgSend(v19, "_daemon_isDataBudgetingEnabled");
  v28 = objc_msgSend(v40, "state");
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "error"));
  sub_100019980(v34, v39, v38, v32, v37, v36, (uint64_t)v31 + (_QWORD)v30, (uint64_t)v23 + (_QWORD)v24, v25, v26, v27, v28 == (id)3, v33, v29);

}

void sub_10000BA94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, void *a19, void *a20,id a21)
{
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;

  _Unwind_Resume(a1);
}

void sub_10000BEC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_10000BFE4(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1[4] + 40), "objectForKeyedSubscript:", a1[5]));

  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1[4] + 40), "objectForKeyedSubscript:", a1[5]));
    objc_msgSend(v3, "removeObjectForKey:", a1[6]);

    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1[4] + 40), "objectForKeyedSubscript:", a1[5]));
    v5 = objc_msgSend(v4, "count");

    if (!v5)
      objc_msgSend(*(id *)(a1[4] + 40), "removeObjectForKey:", a1[5]);
  }
}

void sub_10000C080(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000C7AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10000C984(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  id v15;
  id v16;
  int64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  dispatch_time_t v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  unsigned int v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  unsigned int v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint8_t v72[8];
  _QWORD v73[4];
  NSObject *v74;
  NSObject *v75;
  _QWORD v76[4];
  NSObject *v77;
  _BYTE buf[22];

  v3 = a1;
  v4 = a2;
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("effectiveConfig")));
  if (v70)
  {
    v5 = (id)qword_1000C7158;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_loggableDescription"));
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v43;
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%{public}@ Updating configuration on daemon", buf, 0xCu);

    }
    objc_msgSend(v3, "_onqueue_adoptEffectiveConfiguration:", v70);
  }
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("StatusCodes")));
  if (v71)
  {
    objc_msgSend(v3, "initializeHTTPAuthenticatorWithAppleIDContext:statusCodes:", 0, v71);
    objc_msgSend(v3, "set_authenticatorConfiguredViaTaskProperty:", 1);
    v6 = (id)qword_1000C7158;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_loggableDescription"));
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v71;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ initialized appleIDAuthenticator, status codes = %@", buf, 0x16u);

    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PublishingURL")));
  objc_msgSend(v3, "set_backgroundPublishingURL:", v8);

  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("EarliestBeginDate")));
  v68 = (void *)v9;
  if (v9)
    objc_msgSend(v3, "setEarliestBeginDate:", v9);
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CountOfBytesClientExpectsToSend")));
  if (v69)
    objc_msgSend(v3, "setCountOfBytesClientExpectsToSend:", objc_msgSend(v69, "longLongValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CountOfBytesClientExpectsToReceive")));
  v11 = v10;
  if (v10)
    objc_msgSend(v3, "setCountOfBytesClientExpectsToReceive:", objc_msgSend(v10, "longLongValue"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pathToDownloadTaskFile")));
  if (v12)
    objc_msgSend(v3, "set_pathToDownloadTaskFile:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_DuetActivityProperties"));
  v14 = v13 == 0;

  if (!v14)
  {
    v15 = objc_msgSend(v3, "countOfBytesClientExpectsToSend");
    v16 = objc_msgSend(v3, "countOfBytesClientExpectsToReceive");
    v17 = (int64_t)v16;
    if ((uint64_t)v15 > NSURLSessionTransferSizeUnknown || (uint64_t)v16 > NSURLSessionTransferSizeUnknown)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_DuetActivityProperties"));
      v19 = objc_msgSend(v18, "mutableCopy");

      if ((uint64_t)v15 > NSURLSessionTransferSizeUnknown)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v15));
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, kConditionalConnectionRequirementUploadBytes);

      }
      if (v17 > NSURLSessionTransferSizeUnknown)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v17));
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, kConditionalConnectionRequirementDownloadBytes);

      }
      objc_msgSend(v3, "set_DuetActivityProperties:", v19);

    }
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SZExtractor")));
  if (v22)
  {
    v23 = sub_100065838();
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v24, v22, 0));

    if (!v25)
    {
LABEL_53:

      goto LABEL_54;
    }
    v26 = objc_msgSend(v3, "_extractorPreparedForExtraction");
    v27 = (id)qword_1000C7158;
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    if ((v26 & 1) != 0)
    {
      if (v28)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_loggableDescription"));
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v29;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ StreamingZip - already prepared for extraction while setting additional properties", buf, 0xCu);

      }
      goto LABEL_52;
    }
    if (v28)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_loggableDescription"));
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v30;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ StreamingZip - not yet prepared for extraction while setting additional properties", buf, 0xCu);

    }
    v27 = dispatch_semaphore_create(0);
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_extractor"));
    v32 = v31 == 0;

    if (!v32)
    {
      v33 = (id)qword_1000C7158;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_loggableDescription"));
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ StreamingZip - terminating lingering extractor from previous download attempt", buf, 0xCu);

      }
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_extractor"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSURLErrorDomain, -999, 0));
      v76[0] = _NSConcreteStackBlock;
      v76[1] = 3221225472;
      v76[2] = sub_1000659CC;
      v76[3] = &unk_1000B21E8;
      v37 = v27;
      v77 = v37;
      objc_msgSend(v35, "terminateStreamWithError:completionBlock:", v36, v76);

      dispatch_semaphore_wait(v37, 0xFFFFFFFFFFFFFFFFLL);
      objc_msgSend(v3, "set_extractor:", 0);

    }
    if (!objc_msgSend(v25, "conformsToProtocol:", &OBJC_PROTOCOL___STExtractor))
    {
      v39 = (id)qword_1000C7158;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_loggableDescription"));
        v41 = (void *)objc_opt_class(v25);
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v40;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v41;
        v42 = v41;
        _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%{public}@ Object does not support STExtractor protocol.  Dropping this object. Class=%@", buf, 0x16u);

      }
      goto LABEL_51;
    }
    v38 = objc_opt_class(NSURLSessionDownloadTask);
    if ((objc_opt_isKindOfClass(v3, v38) & 1) == 0)
    {
LABEL_52:

      goto LABEL_53;
    }
    if (v12)
    {
      v39 = v12;
    }
    else
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "downloadFile"));
      v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "path"));

      if (!v39)
      {
        v51 = (id)qword_1000C7158;
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_loggableDescription"));
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v66;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "%{public}@ StreamingZip - no path available.  Wait for init with resume-info for the path.", buf, 0xCu);

        }
        v39 = 0;
        goto LABEL_50;
      }
    }
    v45 = (id)qword_1000C7158;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_loggableDescription"));
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v46;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v39;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%{public}@ StreamingZip - preparing for extraction to %@", buf, 0x16u);

    }
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_1000659D4;
    v73[3] = &unk_1000B21C0;
    v47 = v3;
    v74 = v47;
    v48 = v27;
    v75 = v48;
    objc_msgSend(v25, "prepareForExtractionToPath:completionBlock:", v39, v73);
    v49 = dispatch_time(0, 45000000000);
    if (dispatch_semaphore_wait(v48, v49))
    {
      v50 = (id)qword_1000C7158;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        v67 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject _loggableDescription](v47, "_loggableDescription"));
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v67;
        _os_log_error_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%{public}@ Failed to prepare for extraction - timed-out.", buf, 0xCu);

      }
    }

    v51 = v74;
LABEL_50:

    objc_msgSend(v3, "set_extractor:", v25);
LABEL_51:

    goto LABEL_52;
  }
LABEL_54:
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TimeoutIntervalForResource")));
  v53 = v52;
  if (v52)
  {
    objc_msgSend(v52, "doubleValue");
    objc_msgSend(v3, "set_timeoutIntervalForResource:");
  }
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DisallowCellularDueToSystemPolicy")));
  v55 = objc_msgSend(v54, "BOOLValue");

  if (v55)
    objc_msgSend(v3, "set_disallowCellular:", 1);
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nw_activityUUID")));
  v57 = v56;
  if (v56)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    objc_msgSend(v56, "getUUIDBytes:", buf);
    v58 = (void *)nw_activity_create_from_token(buf);
    objc_msgSend(v3, "set_nw_activity:", v58);

    v59 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v72 = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEBUG, "[Telemetry]: Assiging taskMetrics on the daemon side", v72, 2u);
    }
  }
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sourceApplicationBundleIdentifierForMobileAsset")));
  objc_msgSend(v3, "set_sourceApplicationBundleIdentifierForMobileAsset:", v60);

  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("preconnect")));
  v62 = objc_msgSend(v61, "isEqual:", &__kCFBooleanTrue);

  if (v62)
    objc_msgSend(v3, "set_preconnect:", 1);
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cookies")));
  if (v63)
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentRequest"));
    v65 = objc_msgSend(v64, "mutableCopy");

    objc_msgSend(v65, "setValue:forHTTPHeaderField:", v63, CFSTR("Cookie"));
    objc_msgSend(v3, "updateCurrentRequest:", v65);

  }
}

void sub_10000D430(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, void *a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  _Unwind_Resume(a1);
}

void sub_10000D9E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_10000DC38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_10000DD7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_10000E068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_10000E0BC(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 98))
  {
    objc_msgSend((id)v2, "stopThroughputMonitoring");
    v2 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v2 + 98))
      goto LABEL_6;
  }
  if (*(_BYTE *)(v2 + 99))
    goto LABEL_6;
  if (*(_BYTE *)(v2 + 97))
  {
    *(_QWORD *)(v2 + 120) = 300;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 98) = 0;
    objc_msgSend(*(id *)(a1 + 32), "stopThroughputMonitoring");
    v2 = *(_QWORD *)(a1 + 32);
LABEL_6:
    sub_100014C18(*(void **)(v2 + 8), *(id *)(v2 + 120), *(void **)(v2 + 80));
    return;
  }
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v2 + 8), "error:code:", CFSTR("_nsurlsessiondErrorDomain"), 6));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "cancel_with_error:");

}

void sub_10000E178(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_10000E5C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_10000E8C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_10000EA98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v2);

  _Unwind_Resume(a1);
}

void sub_10000EAC4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A9EC;
  block[3] = &unk_1000B20B8;
  block[4] = v7;
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

void sub_10000EE60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_10000F524(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_10000F688(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  unsigned int v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 64))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NDSpringBoard sharedSpringBoard](NDSpringBoard, "sharedSpringBoard"));
    v4 = objc_msgSend(v3, "applicationIsForeground:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));

    if (!v4)
    {
      v9 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEBUG))
      {
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
        v11 = 138412290;
        v12 = v10;
        _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Capturing boost activity from %@ unnecessary", (uint8_t *)&v11, 0xCu);
      }
      goto LABEL_10;
    }
    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)(v2 + 40))
  {
LABEL_10:
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    objc_msgSend(v8, "endActivity:", *(_QWORD *)(a1 + 40));
    goto LABEL_11;
  }
  v5 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(v2 + 24);
    v11 = 138412290;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Capturing boost activity from %@", (uint8_t *)&v11, 0xCu);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v7 = *(id *)(a1 + 40);
  v8 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v7;
LABEL_11:

}

void sub_10000F804(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000F900(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000F91C(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v7, *(_QWORD *)(a1 + 40)) & 1) != 0)
          objc_msgSend(v7, *(SEL *)(a1 + 40), *(_QWORD *)(a1 + 32), (_QWORD)v8);
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

void sub_10000FA48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000FAD0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "fillInByteCountsForTaskInfo:withTaskID:", v5, v6);
  objc_msgSend(*(id *)(a1 + 32), "fillInPropertiesForTaskInfo:withTaskID:", v5, v6);

}

void sub_10000FB30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_10000FBC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_10000FC78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_10000FC98(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]));
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessPredicate predicateMatchingBundleIdentifier:](RBSProcessPredicate, "predicateMatchingBundleIdentifier:", a1[5]));
    v11 = (id)objc_claimAutoreleasedReturnValue(+[RBSProcessHandle handleForPredicate:error:](RBSProcessHandle, "handleForPredicate:error:", v5, 0));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentState"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "endowmentNamespaces"));
    v8 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v7, "containsObject:", CFSTR("com.apple.frontboard.visibility"))));
    v9 = *(_QWORD *)(a1[6] + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_msgSend(*(id *)(a1[4] + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[5]);
  }
}

void sub_10000FDC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_10000FDF8(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));
  v4 = objc_msgSend(v3, "isEqual:", &off_1000B4A30);

  if ((v4 & 1) == 0)
  {
    if ((unint64_t)(*(_QWORD *)(a1 + 48) - 13) <= 1)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));
      objc_msgSend(v5, "removeAllObjects");

    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));

    if (!v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "setObject:forKeyedSubscript:", v7, *(_QWORD *)(a1 + 40));

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48)));
    objc_msgSend(v8, "addObject:", v9);

    _objc_msgSend(*(id *)(a1 + 32), "storeTaskInfoUpdates:", *(unsigned __int8 *)(a1 + 56));
  }
}

void sub_10000FF20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100010040(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_100010124(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  BOOL v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *j;
  void *v28;
  _BOOL4 v29;
  void *v30;
  BOOL v31;
  _BOOL4 v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  void *k;
  void *v38;
  void *v39;
  void *v40;
  _BOOL4 v41;
  void *v42;
  BOOL v43;
  _BOOL4 v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;
  void *m;
  const char *v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  void *v54;
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
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint8_t v74[128];
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  uint64_t v78;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "embeddedApplicationIdentifier"));

  if (v3
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundle")),
        v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier")),
        v4,
        v3))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "previousState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "endowmentNamespaces"));
    v7 = objc_msgSend(v6, "containsObject:", CFSTR("com.apple.frontboard.visibility"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "state"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endowmentNamespaces"));
    v10 = objc_msgSend(v9, "containsObject:", CFSTR("com.apple.frontboard.visibility"));

    if (((v7 ^ 1 | v10) & 1) == 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "objectForKeyedSubscript:", v3));

      v12 = qword_1000C7158;
      v13 = os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT);
      if (v11)
      {
        if (v13)
        {
          *(_DWORD *)buf = 138412290;
          v76 = v3;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Application %@ no longer foreground", buf, 0xCu);
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "objectForKeyedSubscript:", v3));
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
        if (v16)
        {
          v17 = *(_QWORD *)v68;
          do
          {
            for (i = 0; i != v16; i = (char *)i + 1)
            {
              if (*(_QWORD *)v68 != v17)
                objc_enumerationMutation(v15);
              objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)i), "applicationNoLongerInForeground:", v3);
            }
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
          }
          while (v16);
        }

      }
      else if (v13)
      {
        *(_DWORD *)buf = 138412290;
        v76 = v3;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Application %@ no longer foreground, and no observers", buf, 0xCu);
      }
    }
    if ((_DWORD)v10)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "objectForKeyedSubscript:", v3));
      v20 = v19 == 0;

      v21 = qword_1000C7158;
      v22 = os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT);
      if (!v20)
      {
        if (v22)
        {
          *(_DWORD *)buf = 138412290;
          v76 = v3;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Application %@ entered foreground", buf, 0xCu);
        }
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "objectForKeyedSubscript:", v3));
        v65 = 0u;
        v66 = 0u;
        v63 = 0u;
        v64 = 0u;
        v24 = v23;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
        if (v25)
        {
          v26 = *(_QWORD *)v64;
          do
          {
            for (j = 0; j != v25; j = (char *)j + 1)
            {
              if (*(_QWORD *)v64 != v26)
                objc_enumerationMutation(v24);
              objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)j), "applicationEnteredForeground:", v3);
            }
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
          }
          while (v25);
        }

        goto LABEL_62;
      }
      if (v22)
      {
        *(_DWORD *)buf = 138412290;
        v76 = v3;
        v50 = "Application %@ entered foreground, and no observers";
LABEL_61:
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v50, buf, 0xCu);
      }
    }
    else
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "state"));
      v29 = objc_msgSend(v28, "taskState") == 3;

      if (v29)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "objectForKeyedSubscript:", v3));
        v31 = v30 == 0;

        v21 = qword_1000C7158;
        v32 = os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT);
        if (!v31)
        {
          if (v32)
          {
            *(_DWORD *)buf = 138412290;
            v76 = v3;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Application %@ was suspended", buf, 0xCu);
          }
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "objectForKeyedSubscript:", v3));
          v61 = 0u;
          v62 = 0u;
          v59 = 0u;
          v60 = 0u;
          v34 = v33;
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
          if (v35)
          {
            v36 = *(_QWORD *)v60;
            do
            {
              for (k = 0; k != v35; k = (char *)k + 1)
              {
                if (*(_QWORD *)v60 != v36)
                  objc_enumerationMutation(v34);
                objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)k), "applicationWasSuspended:pid:", v3, objc_msgSend(*(id *)(a1 + 32), "pid"));
              }
              v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
            }
            while (v35);
          }

          goto LABEL_62;
        }
        if (v32)
        {
          *(_DWORD *)buf = 138412290;
          v76 = v3;
          v50 = "Application %@ was suspended, and no observers";
          goto LABEL_61;
        }
      }
      else
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "exitEvent"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "context"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "status"));
        v41 = objc_msgSend(v40, "code") == (id)3735943697;

        if (v41)
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "objectForKeyedSubscript:", v3));
          v43 = v42 == 0;

          v21 = qword_1000C7158;
          v44 = os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT);
          if (!v43)
          {
            if (v44)
            {
              *(_DWORD *)buf = 138412290;
              v76 = v3;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Application %@ was quit in the app switcher", buf, 0xCu);
            }
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "objectForKeyedSubscript:", v3));
            v57 = 0u;
            v58 = 0u;
            v55 = 0u;
            v56 = 0u;
            v46 = v45;
            v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
            if (v47)
            {
              v48 = *(_QWORD *)v56;
              do
              {
                for (m = 0; m != v47; m = (char *)m + 1)
                {
                  if (*(_QWORD *)v56 != v48)
                    objc_enumerationMutation(v46);
                  objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)m), "applicationWasQuitFromAppSwitcher:", v3, (_QWORD)v55);
                }
                v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
              }
              while (v47);
            }

            goto LABEL_62;
          }
          if (v44)
          {
            *(_DWORD *)buf = 138412290;
            v76 = v3;
            v50 = "Application %@ was quit in the app switcher, and no observers";
            goto LABEL_61;
          }
        }
      }
    }
LABEL_62:
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v10, (_QWORD)v55));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 32), "setObject:forKeyedSubscript:", v54, v3);

    return;
  }
  v51 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
  {
    v52 = *(void **)(a1 + 32);
    v53 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v76 = v52;
    v77 = 2112;
    v78 = v53;
    _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "Cannot find bundle ID for process %@ state update %@", buf, 0x16u);
  }
}

void sub_100010888(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id sub_1000109D4(uint64_t a1)
{
  id v2;
  void *i;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *j;
  unsigned int v11;
  id obj;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];

  objc_msgSend(*(id *)(a1 + 32), "_beginSqliteTransaction");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = *(id *)(a1 + 40);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v2)
  {
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(obj);
        v4 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v4));
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v4));
        v17 = 0u;
        v18 = 0u;
        v15 = 0u;
        v16 = 0u;
        v7 = v5;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v8)
        {
          v9 = *(_QWORD *)v16;
          do
          {
            for (j = 0; j != v8; j = (char *)j + 1)
            {
              if (*(_QWORD *)v16 != v9)
                objc_enumerationMutation(v7);
              v11 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)j), "unsignedIntValue");
              objc_msgSend(*(id *)(a1 + 32), "_updateDBEntryForTask:updateType:sessionUUID:", v6, v11, *(_QWORD *)(a1 + 56));
              if (v11 == 13)
                objc_msgSend(*(id *)(a1 + 48), "removeObjectForKey:", v4);
            }
            v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          }
          while (v8);
        }

      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v2);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_commitSqliteTransaction");
}

void sub_100010BCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{

  _Unwind_Resume(a1);
}

void sub_100010ECC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1000114A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100011F50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18)
{
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_1000128B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,void *a26)
{
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  _Unwind_Resume(a1);
}

void sub_100013100(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

id sub_1000131C4(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  if (a1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "valueForEntitlement:", v3));
    if ((objc_opt_respondsToSelector(v4, "BOOLValue") & 1) != 0)
      v5 = objc_msgSend(v4, "BOOLValue");
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_100013240(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000134DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100013728(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1000137A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100013830(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1000138CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

id sub_1000138F8(void *a1)
{
  const char *v1;
  CC_LONG v2;
  void *v3;
  uint64_t i;
  void *v5;
  unsigned __int8 md[20];

  if (!a1)
    return 0;
  v1 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  v2 = strlen(v1);
  CC_SHA1(v1, v2, md);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 40));
  for (i = 0; i != 20; ++i)
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), md[i]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uppercaseString"));

  return v5;
}

void sub_1000139D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100013A5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1000147E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22)
{
  void *v22;
  void *v23;
  void *v24;

  _Unwind_Resume(a1);
}

double *sub_1000149F8(double *result)
{
  double *v1;
  double v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v1 = result;
  v2 = result[5];
  v3 = *((_QWORD *)result + 4);
  if (*((_BYTE *)result + 48) || v2 > *(double *)(v3 + 96) + 5.0)
  {
    *(double *)(v3 + 96) = v2;
    result = (double *)objc_msgSend(*(id *)(*((_QWORD *)result + 4) + 184), "count");
    if (result)
    {
      v4 = *((_QWORD *)v1 + 4);
      v5 = *(void **)(v4 + 240);
      if (v5)
      {
        v6 = *(_QWORD *)(v4 + 264);
        v7 = *(_QWORD *)(v4 + 224);
        v8 = objc_msgSend(*(id *)(v4 + 184), "copy");
        objc_msgSend(v5, "_updateDBEntriesForTasksInSession:taskInfos:updates:", v6, v7, v8);

        v4 = *((_QWORD *)v1 + 4);
      }
      return (double *)objc_msgSend(*(id *)(v4 + 184), "removeAllObjects");
    }
  }
  else
  {
    *(_BYTE *)(v3 + 104) = 1;
  }
  return result;
}

void sub_100014AB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100014C18(void *a1, id a2, void *a3)
{
  _BOOL4 v7;
  unsigned int v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  if (a1)
  {
    v7 = a2 == (id)300 || a2 == (id)400 || a2 == (id)600;
    if (v12 && v7)
    {
      v8 = objc_msgSend(v12, "isForeground");
      if (a2 == (id)300)
        v9 = 1;
      else
        v9 = v8;
      v10 = 350;
      if (v8)
        v10 = (uint64_t)a2;
      v11 = 650;
      if (a2 != (id)600)
        v11 = (uint64_t)a2;
      if (a2 == (id)400)
        v11 = 450;
      if ((v9 & 1) != 0)
        a2 = (id)v10;
      else
        a2 = (id)v11;
    }
    if (a2 != objc_msgSend(a1, "_priorityValue"))
      objc_msgSend(a1, "set_priority:", a2);
  }

}

void sub_100014CCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100014D24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100014E0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  void *v22;

  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_100014FA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100015880(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_100015AA8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100015B54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100015D00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100015E04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100015E80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100015F48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_100015FCC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100016178(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_100016244(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000162C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  void *v10;

  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_100018E20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24)
{
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  _Unwind_Resume(a1);
}

void sub_100019464(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10001969C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v22 = v18;

  _Unwind_Resume(a1);
}

void sub_1000196D4(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;

  v2 = (id)qword_1000C7158;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_loggableDescription"));
    *(_DWORD *)buf = 138543618;
    v22 = v3;
    v23 = 2114;
    v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ resuming", buf, 0x16u);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "personaUniqueString"));
  v6 = v5 == 0;

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentPersona"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "personaUniqueString"));
    v10 = objc_msgSend(v8, "createPersonaContextForBackgroundProcessingWithPersonaUniqueString:", v9);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "_backgroundPublishingURL"));
  v12 = v11 == 0;

  if (!v12)
  v13 = *(_QWORD *)(a1 + 56);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10003F9C0;
  v17[3] = &unk_1000B14B0;
  v14 = *(void **)(a1 + 40);
  v18 = *(id *)(a1 + 32);
  v20 = v13;
  v19 = v14;
  objc_msgSend(v18, "handleEarliestBeginDateForTaskWithIdentifier:completionHandler:", v13, v17);
  if ((objc_msgSend(*(id *)(a1 + 40), "hasStarted") & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 40), "isDiscretionary") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "setStartedUserInitiated:", 1);
  }
  objc_msgSend(*(id *)(a1 + 40), "setHasStarted:", 1);
  v15 = *(void **)(a1 + 32);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56)));
  objc_msgSend(v15, "queueUpdatesForTask:updateType:highPriority:", v16, 14, 1);

}

void sub_10001990C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100019980(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8, void *a9, unsigned __int8 a10, unsigned __int8 a11, char a12, char a13, void *a14)
{
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  BOOL v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  BOOL v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  BOOL v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  id v78;
  __int16 v79;
  id v80;
  __int16 v81;
  id v82;
  __int16 v83;
  void *v84;
  _QWORD v85[6];
  _QWORD v86[6];

  v21 = a2;
  v74 = a3;
  v71 = a4;
  v72 = a5;
  v22 = a6;
  v70 = a9;
  v73 = a14;
  if (!v21
    || !v74
    || !v22
    || (v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "uniqueIdentifier")), v23, !v23))
  {
    v28 = (id)qword_1000C7158;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "_loggableDescription"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "uniqueIdentifier"));
      *(_DWORD *)buf = 138544386;
      v76 = v29;
      v77 = 2112;
      v78 = v22;
      v79 = 2112;
      v80 = v74;
      v81 = 2112;
      v82 = v21;
      v83 = 2112;
      v84 = v30;
      _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%{public}@ tried to log a bad event to powerlog -- taskInfo %@, sessionID %@, bundleID %@, taskInfo.uniqueIdentifier: %@", buf, 0x34u);

    }
    goto LABEL_33;
  }
  if (PLShouldLogRegisteredEvent(14, CFSTR("Background Transfer")))
  {
    v85[0] = CFSTR("state");
    v86[0] = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a1));
    v85[1] = CFSTR("taskUUID");
    v68 = (void *)v86[0];
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "uniqueIdentifier"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "UUIDString"));
    v86[1] = v25;
    v85[2] = CFSTR("taskKind");
    v26 = (unint64_t)objc_msgSend(v22, "taskKind");
    if (v26 > 5)
      v27 = 0;
    else
      v27 = qword_100080328[v26];
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v27));
    v86[2] = v31;
    v85[3] = CFSTR("bundleID");
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:[%@:%@]"), v21, v71, v72));
    v86[3] = v32;
    v86[4] = v74;
    v85[4] = CFSTR("sessionID");
    v85[5] = CFSTR("taskID");
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v22, "identifier")));
    v86[5] = v33;
    v69 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v86, v85, 6));

    v34 = -[NSObject mutableCopy](v69, "mutableCopy");
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", CFSTR("state"), CFSTR("taskUUID"), CFSTR("taskKind"), CFSTR("bundleID"), CFSTR("sessionID"), CFSTR("taskID"), 0));
    if (!a12)
      goto LABEL_32;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a7));
    objc_msgSend(v34, "setObject:forKeyedSubscript:", v36, CFSTR("bytesSent"));

    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a8));
    objc_msgSend(v34, "setObject:forKeyedSubscript:", v37, CFSTR("bytesReceived"));

    if (a13)
    {
      objc_msgSend(v34, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("willRetry"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v22, "retryCount")));
      objc_msgSend(v34, "setObject:forKeyedSubscript:", v38, CFSTR("previousFailureCount"));

    }
    objc_msgSend(v35, "addObject:", CFSTR("bytesSent"));
    objc_msgSend(v35, "addObject:", CFSTR("bytesReceived"));
    if (a13)
    {
      objc_msgSend(v35, "addObject:", CFSTR("willRetry"));
      objc_msgSend(v35, "addObject:", CFSTR("previousFailureCount"));
    }
    if (v70)
    {
      objc_msgSend(v34, "setObject:forKeyedSubscript:", v70, CFSTR("interfaceName"));
      objc_msgSend(v35, "addObject:", CFSTR("interfaceName"));
    }
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a10));
    objc_msgSend(v34, "setObject:forKeyedSubscript:", v39, CFSTR("isDiscretionary"));

    objc_msgSend(v35, "addObject:", CFSTR("isDiscretionary"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a11));
    objc_msgSend(v34, "setObject:forKeyedSubscript:", v40, CFSTR("isDataBudgetingEnabled"));

    objc_msgSend(v35, "addObject:", CFSTR("isDataBudgetingEnabled"));
    if (!v73)
      goto LABEL_32;
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "domain"));
    if (objc_msgSend(v41, "isEqualToString:", NSURLErrorDomain))
    {
      v42 = objc_msgSend(v73, "code") == (id)-999;

      if (v42)
      {
        objc_msgSend(v34, "setObject:forKeyedSubscript:", &off_1000B4A78, CFSTR("state"));
LABEL_32:
        PLLogRegisteredEvent(14, CFSTR("Background Transfer"), v34, v35);

        v28 = v69;
LABEL_33:

        goto LABEL_34;
      }
    }
    else
    {

    }
    objc_msgSend(v34, "setObject:forKeyedSubscript:", &off_1000B4A90, CFSTR("state"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v73, "code")));
    objc_msgSend(v43, "setObject:forKeyedSubscript:", v44, CFSTR("errorCode"));

    v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "domain"));
    objc_msgSend(v43, "setObject:forKeyedSubscript:", v45, CFSTR("errorDomain"));

    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "userInfo"));
    v47 = _kCFStreamErrorCodeKey;
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKeyedSubscript:", _kCFStreamErrorCodeKey));
    LOBYTE(v45) = v48 == 0;

    if ((v45 & 1) == 0)
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "userInfo"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKeyedSubscript:", v47));
      objc_msgSend(v43, "setObject:forKeyedSubscript:", v50, CFSTR("errorCFStreamErrorCode"));

    }
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "userInfo"));
    v52 = _kCFStreamErrorDomainKey;
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKeyedSubscript:", _kCFStreamErrorDomainKey));
    v54 = v53 == 0;

    if (!v54)
    {
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "userInfo"));
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectForKeyedSubscript:", v52));
      objc_msgSend(v43, "setObject:forKeyedSubscript:", v56, CFSTR("errorCFStreamErrorDomain"));

    }
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "userInfo"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("_NSURLErrorFailingURLSessionTaskErrorKey")));
    v59 = v58 == 0;

    if (!v59)
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "userInfo"));
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("_NSURLErrorFailingURLSessionTaskErrorKey")));
      objc_msgSend(v43, "setObject:forKeyedSubscript:", v61, CFSTR("errorFailingURLSessionTask"));

    }
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "userInfo"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "objectForKeyedSubscript:", NSURLErrorFailingURLErrorKey));
    v64 = v63 == 0;

    if (!v64)
    {
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "userInfo"));
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "objectForKeyedSubscript:", NSURLErrorFailingURLErrorKey));
      objc_msgSend(v43, "setObject:forKeyedSubscript:", v66, CFSTR("errorFailingURL"));

    }
    objc_msgSend(v34, "addEntriesFromDictionary:", v43);
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "allKeys"));
    objc_msgSend(v35, "addObjectsFromArray:", v67);

    goto LABEL_32;
  }
LABEL_34:

}

void sub_10001A1F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22)
{
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  _Unwind_Resume(a1);
}

void sub_10001A8BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

_BYTE *sub_10001A9CC(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[104])
    return _objc_msgSend(result, "storeTaskInfoUpdates:", 1);
  return result;
}

void sub_10001A9E4(id a1, id a2, id a3, BOOL *a4)
{
  _objc_msgSend(a3, "archiveTimerFired");
}

id sub_10001A9EC(_QWORD *a1)
{
  objc_msgSend(*(id *)(a1[4] + 16), "addEntriesFromDictionary:", a1[5]);
  return objc_msgSend(*(id *)(a1[4] + 24), "addEntriesFromDictionary:", a1[6]);
}

id sub_10001AA30(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "enumerateKeysAndObjectsUsingBlock:", &stru_1000B1348);
}

void sub_10001AA44(id a1, NSString *a2, NDSessionManager *a3, BOOL *a4)
{
  -[NDSessionManager archiveTimerFired](a3, "archiveTimerFired");
}

void sub_10001AA4C(id a1)
{
  +[NSXPCConnection beginTransaction](NSXPCConnection, "beginTransaction");
}

id sub_10001AA58(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_removePendingLaunchForBundleID:sessionID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t sub_10001AA68(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10001AA74(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  if (!objc_msgSend(*(id *)(a1 + 32), "taskKind"))
  {
    v2 = *(void **)(a1 + 40);
    if (v2)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "userInfo"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", NSURLSessionDownloadTaskResumeData));

      if (!v4)
        objc_msgSend(*(id *)(a1 + 48), "removeDownloadFileForTaskInfo:", *(_QWORD *)(a1 + 32));
    }
  }
}

void sub_10001AAF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_10001AB04(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onqueue_resetRequestDelay");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "_onqueue_resetRequestDelay");
}

id sub_10001AB38(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onqueue_resetRequestDelay");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "_onqueue_resetRequestDelay");
}

id sub_10001AB6C(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;

  v2 = (id)qword_1000C7158;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "descriptionForTaskWithIdentifier:", *(_QWORD *)(a1 + 56)));
    v5 = 138543362;
    v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ client acknowledged completion", (uint8_t *)&v5, 0xCu);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "removeObject:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "clientAcknowledgedTerminalCallbackForTask:", *(_QWORD *)(a1 + 56));
}

void sub_10001AC48(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_10001AC60(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "enumerateKeysAndObjectsUsingBlock:", &stru_1000B1E68);
}

void sub_10001AC74(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v5, "isSpringBoardApp")));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);

}

void sub_10001ACF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

id sub_10001AD14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _objc_msgSend(*(id *)(a1 + 32), "handleStateUpdate:forProcess:", a4, a3);
}

void sub_10001ADF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t sub_10001AE20(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  if (!a1)
    return 0;
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_metrics"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "_daemon_currentTransactionMetrics"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_daemon_connectionMetrics"));

  if (v3)
  {
    objc_msgSend(v3, "_daemon_establishTime");
    v4 = 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void sub_10001AE9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL sub_10001AEC8(_BOOL8 result)
{
  void *v1;
  void *v2;
  void *v3;
  unsigned int v4;
  id v5;
  void *v6;
  unsigned int v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v13;
  unsigned int v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  if (result)
  {
    v1 = (void *)result;
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)result, "domain"));
    if (objc_msgSend(v2, "isEqualToString:", NSURLErrorDomain))
    {

      goto LABEL_5;
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "domain"));
    v4 = objc_msgSend(v3, "isEqualToString:", kCFErrorDomainCFNetwork);

    if (v4)
    {
LABEL_5:
      v5 = objc_msgSend(v1, "code");
      if ((unint64_t)v5 + 1019 <= 0x14)
      {
        if (((1 << (v5 - 5)) & 0xC501) != 0)
          return 1;
        if (v5 == (id)-1001)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "userInfo"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", _kCFStreamErrorCodeKey));
          v18 = objc_msgSend(v17, "integerValue");

          if ((unint64_t)v18 + 2106 >= 4)
            return 1;
          return (((_BYTE)v18 + 58) & 0xF) == 2;
        }
        if (v5 == (id)-999)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "userInfo"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", NSURLErrorBackgroundTaskCancelledReasonKey));
          v11 = objc_msgSend(v10, "integerValue");

          return v11 == (id)2;
        }
      }
      return 0;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "domain"));
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("_nsurlsessiondErrorDomain"));

    if (v7)
    {
      v8 = (unint64_t)objc_msgSend(v1, "code");
      if (v8 < 0xA)
        return (0x3F9u >> v8) & 1;
      return 0;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "domain"));
    v14 = objc_msgSend(v13, "isEqualToString:", AVFoundationErrorDomain);

    if (!v14)
      return 0;
    v15 = objc_msgSend(v1, "code");
    result = 1;
    if (((unint64_t)v15 + 11829 > 0xA || ((1 << (v15 + 53)) & 0x483) == 0)
      && v15 != (id)-11900)
    {
      return 0;
    }
  }
  return result;
}

void sub_10001B0D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

BOOL sub_10001B108(_BOOL8 result)
{
  void *v1;
  void *v2;
  unsigned __int8 v3;
  void *v4;
  unsigned int v5;

  if (result)
  {
    v1 = (void *)result;
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)result, "domain"));
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("_nsurlsessiondErrorDomain"));

    if ((v3 & 1) != 0)
    {
      return 1;
    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "domain"));
      v5 = objc_msgSend(v4, "isEqualToString:", NSURLErrorDomain);

      return v5 && objc_msgSend(v1, "code") == (id)-997;
    }
  }
  return result;
}

void sub_10001B1A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_10001B1B4(void *a1)
{
  void *v1;
  id v2;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "domain"));
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("_nsurlsessiondErrorDomain"));

  return v2;
}

void sub_10001B1F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10001B288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_10001B318(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_10001B3A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10001B748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, ...)
{
  void *v9;
  void *v10;
  void *v11;
  va_list va;

  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001BAC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_10001BCCC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10001BD94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_10001BE0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_10001BE68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_10001BF4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_10001C03C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_10001C184(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10001C308(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10001C56C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10001C660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_10001C6D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_10001C75C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  objc_sync_exit(v10);

  _Unwind_Resume(a1);
}

void sub_10001C8D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v17 = v16;

  _Unwind_Resume(a1);
}

void sub_10001C958(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10001CAC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10001CC0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10001D744(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL sub_10001F730(void *a1)
{
  void *v2;
  unsigned int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "domain"));
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("_nsurlsessiondErrorDomain"));

  return v3 && (char *)objc_msgSend(a1, "code") - 6 < (char *)4;
}

void sub_10001F794(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

_UNKNOWN **sub_10001F7A4(void *a1)
{
  void *v2;
  unsigned int v3;
  unint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "domain"));
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("_nsurlsessiondErrorDomain"));

  if (v3 && (v4 = (unint64_t)objc_msgSend(a1, "code"), v4 < 6))
    return off_1000B0F40[v4];
  else
    return 0;
}

void sub_10001F810(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_10001F820(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  const std::__fs::filesystem::path *v11;
  id v12;
  const std::__fs::filesystem::path *v13;
  std::error_code *v14;
  int v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint64_t v20;
  void *v21;
  id v22;
  const std::__fs::filesystem::path *v23;
  id v24;
  const std::__fs::filesystem::path *v25;
  std::error_code *v26;
  int v27;
  NSObject *v28;
  NSObject *v29;
  int v30;
  int v31;
  unsigned int v32;
  id v33;
  uint8_t buf[4];
  _BYTE v35[24];

  v3 = a2;
  objc_opt_self(a1);
  if (qword_1000C7040 != -1)
    dispatch_once(&qword_1000C7040, &stru_1000B0F20);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByDeletingLastPathComponent"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingString:", CFSTR("_unsafe")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", v8));

    v10 = objc_retainAutorelease(v3);
    v11 = (const std::__fs::filesystem::path *)objc_msgSend(v10, "fileSystemRepresentation");
    v12 = objc_retainAutorelease(v9);
    v13 = (const std::__fs::filesystem::path *)objc_msgSend(v12, "fileSystemRepresentation");
    rename(v11, v13, v14);
    if (v15)
    {
      v16 = (id)qword_1000C7158;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v30 = *__error();
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v35 = v30;
        *(_WORD *)&v35[4] = 2112;
        *(_QWORD *)&v35[6] = v10;
        *(_WORD *)&v35[14] = 2112;
        *(_QWORD *)&v35[16] = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Error %d renaming item at %@ to %@. Won't try to unarchive.", buf, 0x1Cu);
      }

      v17 = 0;
      v18 = 0;
      +[NDFileUtilities removeItemAtPath:](NDFileUtilities, "removeItemAtPath:", v10);
    }
    else
    {
      v20 = qword_1000C7038;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v12));
      v33 = 0;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v20, v21, &v33));
      v18 = v33;

      if (v17)
      {
        v22 = objc_retainAutorelease(v12);
        v23 = (const std::__fs::filesystem::path *)objc_msgSend(v22, "fileSystemRepresentation");
        v24 = objc_retainAutorelease(v10);
        v25 = (const std::__fs::filesystem::path *)objc_msgSend(v24, "fileSystemRepresentation");
        rename(v23, v25, v26);
        if (v27)
        {
          v28 = (id)qword_1000C7158;
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            v31 = *__error();
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)v35 = v31;
            *(_WORD *)&v35[4] = 2112;
            *(_QWORD *)&v35[6] = v22;
            *(_WORD *)&v35[14] = 2112;
            *(_QWORD *)&v35[16] = v24;
            _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Error %d renaming item at %@ to %@", buf, 0x1Cu);
          }

        }
      }
      else
      {
        v29 = (id)qword_1000C7158;
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v32 = objc_msgSend(v18, "code");
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)v35 = v12;
          *(_WORD *)&v35[8] = 2112;
          *(_QWORD *)&v35[10] = v18;
          *(_WORD *)&v35[18] = 1024;
          *(_DWORD *)&v35[20] = v32;
          _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Failure trying to unarchive file at %@ error: %@ [%d]", buf, 0x1Cu);
        }

        v17 = 0;
        +[NDFileUtilities removeItemAtPath:](NDFileUtilities, "removeItemAtPath:", v12);
      }
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

void sub_10001FBCC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_10001FC6C(id a1)
{
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
  NSMutableSet *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v16 = objc_opt_class(NSDictionary);
  v15 = objc_opt_class(NSArray);
  v1 = objc_opt_class(NSString);
  v2 = objc_opt_class(NSNumber);
  v3 = objc_opt_class(NSData);
  v4 = objc_opt_class(NSDate);
  v5 = objc_opt_class(NSUUID);
  v6 = objc_opt_class(NSURL);
  v7 = objc_opt_class(NSURLRequest);
  v8 = objc_opt_class(NSURLResponse);
  v9 = objc_opt_class(NSError);
  v10 = objc_opt_class(NSURLSessionConfiguration);
  v11 = +[NSMutableSet setWithObjects:](NSMutableSet, "setWithObjects:", v16, v15, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(__NSCFURLSessionTaskInfo), 0);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)qword_1000C7038;
  qword_1000C7038 = v12;

  v14 = sub_100065838();
  v17 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend((id)qword_1000C7038, "unionSet:");
  objc_msgSend((id)qword_1000C7038, "addObject:", objc_opt_class(AVURLAsset));
  objc_msgSend((id)qword_1000C7038, "addObject:", objc_opt_class(AVAssetDownloadConfiguration));

}

void sub_10001FE14(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void *sub_10001FE28(void *a1)
{
  void *v1;
  void *v3;
  void *v4;
  void *v5;

  v1 = 0;
  if (a1)
  {
    if (&_CHSIsWidgetExtensionPoint)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "extensionPointRecord"));
      v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

      if (v1)
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "extensionPointRecord"));
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
        v1 = (void *)CHSIsWidgetExtensionPoint();

      }
    }
  }
  return v1;
}

void sub_10001FEB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

uint64_t start(int a1, uint64_t a2)
{
  os_log_t v4;
  void *v5;
  char *v6;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const char **v13;
  const char *v14;
  os_log_t v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  dispatch_queue_global_t v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v26;
  int v27;
  NSObject *v28;
  int v29;
  NSObject *v30;
  int v31;
  int v32;
  int v33;
  uint8_t buf[1032];

  v4 = os_log_create("com.apple.nsurlsessiond", "background");
  v5 = (void *)qword_1000C7158;
  qword_1000C7158 = (uint64_t)v4;

  bzero(buf, 0x400uLL);
  if ((_set_user_dir_suffix("com.apple.nsurlsessiond") & 1) == 0)
  {
    v26 = (id)qword_1000C7158;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = *__error();
      v32 = 67109120;
      v33 = v27;
      _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "failed to set directory suffix: %{darwin.errno}d", (uint8_t *)&v32, 8u);
    }

    exit(1);
  }
  if (!confstr(65537, (char *)buf, 0x400uLL))
  {
    v28 = (id)qword_1000C7158;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = *__error();
      v32 = 67109120;
      v33 = v29;
      _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "failed to initialize temporary directory: %{darwin.errno}d", (uint8_t *)&v32, 8u);
    }

    exit(1);
  }
  v6 = realpath_DARWIN_EXTSN((const char *)buf, 0);
  if (!v6)
  {
    v30 = (id)qword_1000C7158;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = *__error();
      v32 = 67109120;
      v33 = v31;
      _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "failed to resolve temporary directory: %{darwin.errno}d", (uint8_t *)&v32, 8u);
    }

    exit(1);
  }
  free(v6);
  global_queue = dispatch_get_global_queue(2, 0);
  v8 = objc_claimAutoreleasedReturnValue(global_queue);
  v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v8);

  dispatch_source_set_event_handler(v9, &stru_1000B0F70);
  dispatch_resume(v9);
  v10 = objc_autoreleasePoolPush();
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](Daemon, "sharedDaemon"));
  if (a1 >= 2)
  {
    v12 = a1 - 1;
    v13 = (const char **)(a2 + 8);
    do
    {
      v14 = *v13;
      if (!strcmp(*v13, "--privileged"))
      {
        objc_msgSend(v11, "setPrivileged:", 1);
      }
      else if (!strcmp(v14, "--postlogoutsync"))
      {
        objc_msgSend(v11, "setInSyncBubble:", 1);
      }
      ++v13;
      --v12;
    }
    while (v12);
  }
  v15 = os_log_create("com.apple.nsurlsessiond", "proxy");
  v16 = (void *)qword_1000C7120;
  qword_1000C7120 = (uint64_t)v15;

  if ((objc_msgSend(v11, "isInSyncBubble") & 1) == 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[PDURLSessionProxyServerService sharedService](PDURLSessionProxyServerService, "sharedService"));
    objc_msgSend(v17, "start");

  }
  v18 = CacheDeleteRegisterInfoCallbacks(CFSTR("com.apple.nsurlsessiond-cachedelete"), &stru_1000B11A0, &stru_1000B11C0, 0, 0);
  v19 = qword_1000C7158;
  if (v18)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "CacheDelete callback registration failed!", buf, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "CacheDelete callback registration succeeded.", buf, 2u);
  }
  objc_msgSend(v11, "start");
  v20 = dispatch_get_global_queue(9, 0);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  dispatch_async(v21, &stru_1000B0F90);

  objc_msgSend(v11, "restoreState");
  objc_msgSend(v11, "setupArchiveTimer");
  v22 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.nsurlsessiond"));
  objc_msgSend(v22, "setDelegate:", v11);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "queue"));
  objc_msgSend(v22, "_setQueue:", v23);

  objc_msgSend(v22, "resume");
  if ((objc_msgSend(v11, "isInSyncBubble") & 1) == 0 && qword_1000C70B8 != -1)
    dispatch_once(&qword_1000C70B8, &stru_1000B18D8);

  objc_autoreleasePoolPop(v10);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  objc_msgSend(v24, "run");

  return 1;
}

void sub_100020394(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100020418(id a1)
{
  void *v1;
  void *v2;
  unsigned __int8 v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v1 = objc_autoreleasePoolPush();
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](Daemon, "sharedDaemon"));
  v3 = objc_msgSend(v2, "isInSyncBubble");

  if ((v3 & 1) == 0)
  {
    v4 = sub_10002F0B8();
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = v5;
    if (v5)
      sub_10002F114(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NDFileUtilities defaultDownloadDirectoryContainer](NDFileUtilities, "defaultDownloadDirectoryContainer"));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v12[0] = NSURLIsDirectoryKey;
      v12[1] = NSURLIsSymbolicLinkKey;
      v12[2] = NSURLIsVolumeKey;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 3));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v7, v9, 5, &stru_1000B1160));

      while (1)
      {

        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nextObject"));
        if (!v8)
          break;
        v11 = objc_autoreleasePoolPush();
        sub_10002F114(v8);
        objc_autoreleasePoolPop(v11);
      }

    }
  }
  objc_autoreleasePoolPop(v1);
}

void sub_100020598(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1000205FC(id a1)
{
  NSObject *v1;
  uint8_t v2[16];

  v1 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "SIGTERM received, shutting down.", v2, 2u);
  }
  exit(0);
}

void sub_100020E68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100020FF0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100021174(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100021494(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_100021634(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000218CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100021B84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100021D20(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1000225B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  if (!v17)
  {

    v17 = 0;
  }

  _Unwind_Resume(a1);
}

void sub_100022A40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100022B7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  if (!v10)

  _Unwind_Resume(a1);
}

void sub_1000232C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19)
{
  void *v19;
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_1000235E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_100023744(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1000238C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1000239C8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  BOOL v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  id v16;
  __int16 v17;
  BOOL v18;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_onqueue_sourceApplicationForMessage:", *(_QWORD *)(a1 + 40)));
  v5 = objc_msgSend(*(id *)(a1 + 32), "_onqueue_priorityForMessage:ofType:isReply:", *(_QWORD *)(a1 + 40), *(unsigned __int16 *)(a1 + 56), 1);
  v6 = objc_msgSend(*(id *)(a1 + 32), "_onqueue_IDSTimoutForMessage:", *(_QWORD *)(a1 + 40));
  v7 = *(_QWORD *)(a1 + 32);
  v8 = v5 == (id)300;
  v9 = *(NSObject **)(v7 + 80);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100023AEC;
  v12[3] = &unk_1000B1008;
  v12[4] = v7;
  v13 = v3;
  v17 = *(_WORD *)(a1 + 56);
  v14 = *(id *)(a1 + 48);
  v15 = v4;
  v18 = v8;
  v16 = v6;
  v10 = v4;
  v11 = v3;
  dispatch_async(v9, v12);

}

void sub_100023ACC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100023AEC(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(unsigned __int16 *)(a1 + 72);
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "outgoingResponseIdentifier"));
  objc_msgSend(v1, "_onqueue_sendMessage:ofType:responseIdentifier:forSourceApplication:withUrgency:withIDSMessageTimeout:withReply:", v2, v3, 0);

}

void sub_100023B50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id sub_100023B64(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_sendMessage:ofType:responseIdentifier:forSourceApplication:withUrgency:withIDSMessageTimeout:withReply:", *(_QWORD *)(a1 + 40), *(unsigned __int16 *)(a1 + 56), 0, 0, 0, objc_msgSend(*(id *)(a1 + 32), "_onqueue_IDSTimoutForMessage:", *(_QWORD *)(a1 + 40)), *(_QWORD *)(a1 + 48));
}

void sub_100023BCC(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));

  if (v2)
  {
    v3 = qword_1000C7120;
    if (os_log_type_enabled((os_log_t)qword_1000C7120, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(unsigned __int16 *)(a1 + 48);
      v7 = 138543618;
      v8 = v5;
      v9 = 1024;
      v10 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Timed out waiting for reply for message, identifier = %{public}@, type = %u", (uint8_t *)&v7, 0x12u);
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 60, 0));
    objc_msgSend(*(id *)(a1 + 32), "_onqueue_messageWithIdentifier:didSendWithSuccess:error:", *(_QWORD *)(a1 + 40), 0, v4);

  }
}

void sub_100023CD8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_100023CF0(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onqueue_sendStartupMessage");
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_remoteDeviceStartedUp");
}

void sub_100023D18(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v2 = objc_msgSend(objc_alloc((Class)IDSService), "initWithService:", CFSTR("com.apple.private.alloy.nsurlsessionproxy"));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addDelegate:queue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  v5 = qword_1000C7120;
  if (os_log_type_enabled((os_log_t)qword_1000C7120, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PDURLSessionProxyService setting preferInfraWiFi to NO", v7, 2u);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setPreferInfraWiFi:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_onqueue_sendStartupMessage");
  objc_msgSend(*(id *)(a1 + 32), "_onqueue_updateDeviceState");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "devicesDidUnpair:", NRPairedDeviceRegistryDeviceDidUnpairNotification, 0);

}

void sub_100023E0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100024528(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100024890(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100024934(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1000249F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100024ACC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100025020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_100025174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_100025218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_100025298(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
  v3 = *(void **)(a1 + 32);
  v5 = (id)v2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "objectForKeyedSubscript:"));

  if (v3 == v4)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "removeObjectForKey:", v5);

}

void sub_100025314(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100025328(id a1, NSString *a2, PDURLSessionProxyServer *a3, BOOL *a4)
{
  -[PDURLSessionProxyServer devicesConnected](a3, "devicesConnected");
}

void sub_100025330(id a1, NSString *a2, PDURLSessionProxyServer *a3, BOOL *a4)
{
  -[PDURLSessionProxyServer obliterate](a3, "obliterate");
}

void sub_100025338(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  BOOL v4;
  uint64_t v5;
  _QWORD *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  dispatch_time_t v14;
  _QWORD v15[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 120);
  v3 = v2 == 1;
  v4 = v2 < 1;
  v5 = v2 - 1;
  if (!v4)
  {
    *(_QWORD *)(v1 + 120) = v5;
    if (v3)
    {
      v7 = *(_QWORD **)(a1 + 32);
      v8 = v7[16];
      if (!v8)
      {
        v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "queue"));
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_10002547C;
        v15[3] = &unk_1000B23A0;
        v15[4] = *(_QWORD *)(a1 + 32);
        v10 = sub_1000454F8(v9, v15);
        v11 = objc_claimAutoreleasedReturnValue(v10);
        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(void **)(v12 + 128);
        *(_QWORD *)(v12 + 128) = v11;

        dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 128));
        v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 128);
      }
      if (qword_1000C70A0 != -1)
        dispatch_once(&qword_1000C70A0, &stru_1000B17F8);
      v14 = dispatch_time(0, (uint64_t)((double)dword_1000C66D0 * 1000000000.0));
      if (v8)
        dispatch_source_set_timer(v8, v14, 0x1DCD64FFC4653600uLL, 0);
    }
  }
}

void sub_10002547C(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 136);
  *(_QWORD *)(v2 + 136) = 0;

}

_QWORD *sub_1000254B8(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  PDBluetoothCompanionLinkAssertion *v7;
  uint64_t v8;
  void *v9;

  v1 = result[4];
  v2 = *(_QWORD *)(v1 + 120);
  *(_QWORD *)(v1 + 120) = v2 + 1;
  if (!v2)
  {
    v3 = result;
    v4 = result[4];
    v5 = *(NSObject **)(v4 + 128);
    if (v5)
    {
      dispatch_source_set_timer(v5, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD64FFC4653600uLL, 0);
      v4 = v3[4];
    }
    v6 = *(void **)(v4 + 136);
    if (!v6)
    {
      v7 = objc_opt_new(PDBluetoothCompanionLinkAssertion);
      v8 = v3[4];
      v9 = *(void **)(v8 + 136);
      *(_QWORD *)(v8 + 136) = v7;

      v6 = *(void **)(v3[4] + 136);
    }
    return _objc_msgSend(v6, "acquire");
  }
  return result;
}

void sub_100025748(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)PDBluetoothCompanionLinkAssertion;
  -[_Unwind_Exception dealloc](&a9, "dealloc");
  _Unwind_Resume(a1);
}

void sub_10002599C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

_QWORD *sub_1000259F4(_QWORD *result)
{
  uint64_t v1;
  _QWORD *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  v1 = result[4];
  if (*(_BYTE *)(v1 + 26))
  {
    v2 = result;
    *(_BYTE *)(v1 + 26) = 0;
    v3 = qword_1000C7120;
    if (os_log_type_enabled((os_log_t)qword_1000C7120, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v2[4];
      v5 = 138543362;
      v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Invalidating...", (uint8_t *)&v5, 0xCu);
    }
    return objc_msgSend((id)v2[4], "_updateState");
  }
  return result;
}

_QWORD *sub_100025AAC(_QWORD *result)
{
  uint64_t v1;
  _QWORD *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  v1 = result[4];
  if (!*(_BYTE *)(v1 + 26))
  {
    v2 = result;
    *(_BYTE *)(v1 + 26) = 1;
    v3 = qword_1000C7120;
    if (os_log_type_enabled((os_log_t)qword_1000C7120, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v2[4];
      v5 = 138543362;
      v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Acquiring...", (uint8_t *)&v5, 0xCu);
    }
    return objc_msgSend((id)v2[4], "_updateState");
  }
  return result;
}

void sub_100025B68(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_100025B78(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  BOOL v4;
  uint64_t v5;
  _QWORD *v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 104);
  v3 = v2 == 1;
  v4 = v2 < 1;
  v5 = v2 - 1;
  if (!v4)
  {
    *(_QWORD *)(v1 + 104) = v5;
    if (v3)
    {
      v7 = *(_QWORD **)(a1 + 32);
      v8 = v7[14];
      if (v8)
      {
        v9 = dispatch_time(0, 60000000000);
      }
      else
      {
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "queue"));
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_100025C9C;
        v15[3] = &unk_1000B23A0;
        v15[4] = *(_QWORD *)(a1 + 32);
        v11 = sub_1000454F8(v10, v15);
        v12 = objc_claimAutoreleasedReturnValue(v11);
        v13 = *(_QWORD *)(a1 + 32);
        v14 = *(void **)(v13 + 112);
        *(_QWORD *)(v13 + 112) = v12;

        dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 112));
        v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 112);
        v9 = dispatch_time(0, 60000000000);
        if (!v8)
          return;
      }
      dispatch_source_set_timer(v8, v9, 0x1DCD64FFC4653600uLL, 0);
    }
  }
}

id sub_100025C9C(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)PDURLSessionProxyServerService;
  return objc_msgSendSuper2(&v2, "_onqueue_setPrefersInfraWiFi:", 0);
}

_QWORD *sub_100025CD8(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  NSObject *v5;
  objc_super v6;

  v1 = result[4];
  v2 = *(_QWORD *)(v1 + 104);
  *(_QWORD *)(v1 + 104) = v2 + 1;
  if (!v2)
  {
    v3 = result;
    v4 = (_QWORD *)result[4];
    v5 = v4[14];
    if (v5)
    {
      dispatch_source_set_timer(v5, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD64FFC4653600uLL, 0);
      v4 = (_QWORD *)v3[4];
    }
    v6.receiver = v4;
    v6.super_class = (Class)PDURLSessionProxyServerService;
    return objc_msgSendSuper2(&v6, "_onqueue_setPrefersInfraWiFi:", 1);
  }
  return result;
}

id sub_100025D6C(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)PDURLSessionProxyServerService;
  return objc_msgSendSuper2(&v2, "start");
}

void sub_100025DE4(id a1)
{
  PDURLSessionProxyServerService *v1;
  void *v2;

  v1 = objc_alloc_init(PDURLSessionProxyServerService);
  v2 = (void *)qword_1000C7048;
  qword_1000C7048 = (uint64_t)v1;

}

void sub_100026104(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000265FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100026894(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10002789C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_100027F80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1000283E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100028834(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100028CB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_10002919C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1000295F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100029A44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100029E94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10002A1C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10002A5E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10002AA84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_10002AF6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10002B4D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10002B788(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10002B884(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10002BBC0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_10002BD5C(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  objc_msgSend(*(id *)(a1 + 32), "_beginSqliteTransaction");
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 32), "_onqueue_deleteEntryForTask:forSession:sessionUUID:", objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v5), "unsignedIntValue", (_QWORD)v7), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
        v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_commitSqliteTransaction");
}

void sub_10002BE74(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10002BE94(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  sqlite3 *v4;
  sqlite3_stmt **v5;
  sqlite3_stmt *v6;
  sqlite3_stmt *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint64_t v12;
  sqlite3_stmt *v13;
  int v14;
  const unsigned __int8 *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  _QWORD v22[2];

  v2 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEBUG))
  {
    v19 = *(_QWORD *)(a1 + 32);
    v21 = 138412290;
    v22[0] = v19;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "_getAllSessionIDsForBundle for bundleID %@", (uint8_t *)&v21, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(sqlite3 **)(v3 + 40);
  if (!v4 || !*(_BYTE *)(v3 + 24))
  {
    v11 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", (uint8_t *)&v21, 2u);
    }
    return;
  }
  v7 = *(sqlite3_stmt **)(v3 + 192);
  v5 = (sqlite3_stmt **)(v3 + 192);
  v6 = v7;
  if (v7)
    goto LABEL_6;
  if (!sqlite3_prepare_v2(v4, "SELECT DISTINCT session_id FROM session_tasks WHERE bundle_id = ?", -1, v5, 0))
  {
    v6 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 40) + 192);
LABEL_6:
    if (sqlite3_bind_text(v6, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), -1, 0))
    {
      v8 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        v9 = *(_QWORD *)(a1 + 32);
        v21 = 138412290;
        v22[0] = v9;
        v10 = "Failed to bind bundleID (%@) to the select statement";
LABEL_14:
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v21, 0xCu);
        return;
      }
    }
    else
    {
      v13 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 40) + 192);
      if (v13)
      {
        v14 = 0;
        while (sqlite3_step(v13) == 100)
        {
          v15 = sqlite3_column_text(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 40) + 192), 0);
          if (v15)
          {
            v16 = *(void **)(a1 + 48);
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v15));
            objc_msgSend(v16, "addObject:", v17);

          }
          v13 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 40) + 192);
          ++v14;
        }
        v18 = qword_1000C7158;
        if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEBUG))
        {
          v20 = *(_QWORD *)(a1 + 32);
          v21 = 67109378;
          LODWORD(v22[0]) = v14;
          WORD2(v22[0]) = 2112;
          *(_QWORD *)((char *)v22 + 6) = v20;
          _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "_getAllSessionIDsForBundle entries: %d for bundle: %@", (uint8_t *)&v21, 0x12u);
        }
        sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 40) + 192));
      }
    }
    return;
  }
  v8 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
  {
    v12 = *(_QWORD *)(a1 + 32);
    v21 = 138412290;
    v22[0] = v12;
    v10 = "Failed to init the _getAllSessionsStmt statement for session_tasks for bundle: %@";
    goto LABEL_14;
  }
}

void sub_10002C150(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

sqlite3 *sub_10002C168(uint64_t a1)
{
  uint64_t v2;
  sqlite3_stmt *v3;
  sqlite3_stmt *v4;
  sqlite3_stmt *v5;
  sqlite3_stmt *v6;
  sqlite3_stmt *v7;
  sqlite3_stmt *v8;
  sqlite3_stmt *v9;
  sqlite3_stmt *v10;
  sqlite3_stmt *v11;
  sqlite3_stmt *v12;
  sqlite3_stmt *v13;
  sqlite3_stmt *v14;
  sqlite3_stmt *v15;
  sqlite3_stmt *v16;
  sqlite3_stmt *v17;
  sqlite3_stmt *v18;
  sqlite3_stmt *v19;
  sqlite3_stmt *v20;
  sqlite3_stmt *v21;
  sqlite3 *result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(sqlite3_stmt **)(v2 + 48);
  if (v3)
  {
    sqlite3_finalize(v3);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v4 = *(sqlite3_stmt **)(v2 + 56);
  if (v4)
  {
    sqlite3_finalize(v4);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v5 = *(sqlite3_stmt **)(v2 + 64);
  if (v5)
  {
    sqlite3_finalize(v5);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v6 = *(sqlite3_stmt **)(v2 + 80);
  if (v6)
  {
    sqlite3_finalize(v6);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v7 = *(sqlite3_stmt **)(v2 + 88);
  if (v7)
  {
    sqlite3_finalize(v7);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v8 = *(sqlite3_stmt **)(v2 + 72);
  if (v8)
  {
    sqlite3_finalize(v8);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v9 = *(sqlite3_stmt **)(v2 + 96);
  if (v9)
  {
    sqlite3_finalize(v9);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v10 = *(sqlite3_stmt **)(v2 + 104);
  if (v10)
  {
    sqlite3_finalize(v10);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v11 = *(sqlite3_stmt **)(v2 + 112);
  if (v11)
  {
    sqlite3_finalize(v11);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v12 = *(sqlite3_stmt **)(v2 + 120);
  if (v12)
  {
    sqlite3_finalize(v12);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v13 = *(sqlite3_stmt **)(v2 + 128);
  if (v13)
  {
    sqlite3_finalize(v13);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v14 = *(sqlite3_stmt **)(v2 + 136);
  if (v14)
  {
    sqlite3_finalize(v14);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v15 = *(sqlite3_stmt **)(v2 + 152);
  if (v15)
  {
    sqlite3_finalize(v15);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v16 = *(sqlite3_stmt **)(v2 + 160);
  if (v16)
  {
    sqlite3_finalize(v16);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v17 = *(sqlite3_stmt **)(v2 + 168);
  if (v17)
  {
    sqlite3_finalize(v17);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v18 = *(sqlite3_stmt **)(v2 + 176);
  if (v18)
  {
    sqlite3_finalize(v18);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v19 = *(sqlite3_stmt **)(v2 + 184);
  if (v19)
  {
    sqlite3_finalize(v19);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v20 = *(sqlite3_stmt **)(v2 + 144);
  if (v20)
  {
    sqlite3_finalize(v20);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v21 = *(sqlite3_stmt **)(v2 + 192);
  if (v21)
  {
    sqlite3_finalize(v21);
    v2 = *(_QWORD *)(a1 + 32);
  }
  result = *(sqlite3 **)(v2 + 40);
  if (result)
  {
    result = (sqlite3 *)sqlite3_close(result);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v2 + 24) = 0;
  return result;
}

id sub_10002C2D4(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_onqueue_garbageCollect");
}

id sub_10002C2DC(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_onqueue_deleteAllTaskEntriesForSession:sessionUUID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void sub_10002C2EC(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  sqlite3 *v4;
  sqlite3_stmt **v5;
  sqlite3_stmt *v6;
  sqlite3_stmt *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint64_t v12;
  sqlite3_stmt *v13;
  int v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  _QWORD v21[2];

  v2 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEBUG))
  {
    v19 = *(_QWORD *)(a1 + 32);
    v20 = 138412290;
    v21[0] = v19;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "_getAllTasksFromDBForSession: %@", (uint8_t *)&v20, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(sqlite3 **)(v3 + 40);
  if (!v4 || !*(_BYTE *)(v3 + 24))
  {
    v11 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", (uint8_t *)&v20, 2u);
    }
    return;
  }
  v7 = *(sqlite3_stmt **)(v3 + 56);
  v5 = (sqlite3_stmt **)(v3 + 56);
  v6 = v7;
  if (v7)
    goto LABEL_6;
  if (!sqlite3_prepare_v2(v4, "SELECT * from session_tasks WHERE session_id = ? LIMIT 512", -1, v5, 0))
  {
    v6 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 40) + 56);
LABEL_6:
    if (sqlite3_bind_text(v6, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "UTF8String"), -1, 0))
    {
      v8 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        v9 = *(_QWORD *)(a1 + 32);
        v20 = 138412290;
        v21[0] = v9;
        v10 = "Failed to bind sessionID (%@) to the select statement";
LABEL_14:
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v20, 0xCu);
        return;
      }
    }
    else
    {
      v13 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 40) + 56);
      if (v13)
      {
        v14 = 0;
        while (sqlite3_step(v13) == 100)
        {
          v15 = objc_autoreleasePoolPush();
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_onqueue_convertSqlRowToTaskInfoEntry:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56)));
          if (v16)
            objc_msgSend(*(id *)(a1 + 56), "addObject:", v16);

          objc_autoreleasePoolPop(v15);
          v13 = *(sqlite3_stmt **)(*(_QWORD *)(a1 + 40) + 56);
          ++v14;
        }
        v17 = qword_1000C7158;
        if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
        {
          v18 = *(_QWORD *)(a1 + 32);
          v20 = 67109378;
          LODWORD(v21[0]) = v14;
          WORD2(v21[0]) = 2112;
          *(_QWORD *)((char *)v21 + 6) = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "_getAllTasksFromDB entries: %d for session: %@", (uint8_t *)&v20, 0x12u);
        }
        sqlite3_reset(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 40) + 56));
      }
    }
    return;
  }
  v8 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
  {
    v12 = *(_QWORD *)(a1 + 32);
    v20 = 138412290;
    v21[0] = v12;
    v10 = "Failed to init the _selectEntriesStmt statement for session_tasks for session: %@";
    goto LABEL_14;
  }
}

void sub_10002C59C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_10002C5B4(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "_onqueue_initDB");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_10002C5E4(id a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSSet *v10;
  uint64_t v11;
  void *v12;

  v1 = objc_opt_class(NSDictionary);
  v2 = objc_opt_class(NSArray);
  v3 = objc_opt_class(NSSet);
  v4 = objc_opt_class(NSString);
  v5 = objc_opt_class(NSNumber);
  v6 = objc_opt_class(NSData);
  v7 = objc_opt_class(NSURL);
  v8 = objc_opt_class(NSDate);
  v9 = objc_opt_class(NSUUID);
  v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(NSURLSessionConfiguration), 0);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)qword_1000C7058;
  qword_1000C7058 = v11;

}

void sub_10002DA4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_10002E010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_10002E444(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002E570(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_10002E610(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10002E654(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10002E698(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10002E6FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_10002E750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_10002ECE4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(WeakRetained, "NDAVAssetDownloadSessionWrapper:willDownloadVariants:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void sub_10002ED24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_10002ED38(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = objc_msgSend(*(id *)(a1 + 32), "countOfBytesWritten");
  objc_msgSend(*(id *)(a1 + 32), "setCountOfBytesWritten:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setCountOfBytesExpectedToWrite:", *(_QWORD *)(a1 + 48));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(WeakRetained, "NDAVAssetDownloadSessionWrapper:didUpdateProgressWithLastBytesWritten:totalBytesWritten:totalBytesExpectedToWrite:", *(_QWORD *)(a1 + 32), v2 - (_QWORD)v3, objc_msgSend(*(id *)(a1 + 32), "countOfBytesWritten"), objc_msgSend(*(id *)(a1 + 32), "countOfBytesExpectedToWrite"));

}

void sub_10002EDD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_10002EDE4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 56));
    v2 = *(_QWORD *)(a1 + 40);
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "propertyList"));
    objc_msgSend(WeakRetained, "NDAVAssetDownloadSessionWrapper:didResolveMediaSelectionPropertyList:", v2, v3);

  }
}

void sub_10002EE58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_10002EE78(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "propertyList"));
  objc_msgSend(WeakRetained, "NDAVAssetDownloadSessionWrapper:didFinishDownloadForMediaSelectionPropertyList:", v2, v3);

}

void sub_10002EED4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_10002EEF4(uint64_t a1)
{
  __int128 v2;
  void *v3;
  __int128 v4;
  void *v5;
  id WeakRetained;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _OWORD v10[3];
  _OWORD v11[3];

  v2 = *(_OWORD *)(a1 + 72);
  v11[0] = *(_OWORD *)(a1 + 56);
  v11[1] = v2;
  v11[2] = *(_OWORD *)(a1 + 88);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCMTimeRange:](NSValue, "valueWithCMTimeRange:", v11));
  v4 = *(_OWORD *)(a1 + 120);
  v10[0] = *(_OWORD *)(a1 + 104);
  v10[1] = v4;
  v10[2] = *(_OWORD *)(a1 + 136);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCMTimeRange:](NSValue, "valueWithCMTimeRange:", v10));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  v8 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "propertyList"));
  objc_msgSend(WeakRetained, "NDAVAssetDownloadSessionWrapper:didLoadTimeRange:totalTimeRangesLoaded:timeRangeExpectedToLoad:forMediaSelectionPropertyList:", v8, v3, v7, v5, v9);

}

void sub_10002EFCC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_10002EFFC(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "disavowSession");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(WeakRetained, "NDAVAssetDownloadSessionWrapper:didCompleteWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void sub_10002F044(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_10002F058(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "disavowSession");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(WeakRetained, "NDAVAssetDownloadSessionWrapper:didCompleteWithError:", *(_QWORD *)(a1 + 32), 0);

}

void sub_10002F0A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id sub_10002F0B8()
{
  NSString *v0;
  void *v1;
  void *v2;

  v0 = NSTemporaryDirectory();
  v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v1, 1));

  return v2;
}

void sub_10002F104(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10002F114(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;
  void *v12;
  _BOOL4 v13;
  id v14;
  id v15;
  id v16;
  NSURLResourceKey v17;

  v14 = a1;
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v17 = NSURLIsDirectoryKey;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v14, v2, 5, &stru_1000B11E0));

  while (1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nextObject"));
    if (!v4)
      break;
    v5 = objc_autoreleasePoolPush();
    v16 = 0;
    v6 = objc_msgSend(v4, "getResourceValue:forKey:error:", &v16, NSURLIsDirectoryKey, 0);
    v7 = v16;
    v8 = v7;
    if (v6 && objc_msgSend(v7, "BOOLValue"))
    {
      if (+[NDFileUtilities itemShouldBePurged:](NDFileUtilities, "itemShouldBePurged:", v4))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        objc_msgSend(v9, "removeItemAtURL:error:", v4, 0);
      }
      else
      {
        v15 = 0;
        v10 = objc_msgSend(v4, "getResourceValue:forKey:error:", &v15, NSURLNameKey, 0);
        v11 = v15;
        v9 = v11;
        if (v10
          && objc_msgSend(v11, "hasPrefix:", CFSTR("CFNetworkDownload_"))
          && objc_msgSend(v9, "hasSuffix:", CFSTR(".tmp")))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NDFileUtilities fetchStreamingZipModificationDate:](NDFileUtilities, "fetchStreamingZipModificationDate:", v4));
          v13 = v12 == 0;

          if (v13)
            +[NDFileUtilities updateStreamingZipModificationDate:](NDFileUtilities, "updateStreamingZipModificationDate:", v4);
        }
      }

    }
    objc_autoreleasePoolPop(v5);

  }
}

void sub_10002F338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

BOOL sub_10002F3A8(id a1, NSURL *a2, NSError *a3)
{
  NSURL *v4;
  NSError *v5;
  NSObject *v6;
  int v8;
  NSURL *v9;
  __int16 v10;
  NSError *v11;

  v4 = a2;
  v5 = a3;
  v6 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
  {
    v8 = 138412546;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "NDCacheDeleteFixUpDirectoriesOnStartup enumeration failed at %@ error=%@", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

BOOL sub_10002F478(id a1, NSURL *a2, NSError *a3)
{
  NSURL *v4;
  NSError *v5;
  NSObject *v6;
  int v8;
  NSURL *v9;
  __int16 v10;
  NSError *v11;

  v4 = a2;
  v5 = a3;
  v6 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
  {
    v8 = 138412546;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "NDCacheDeleteFixUpDirectoriesInContainer enumeration failed at %@ error=%@", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

__CFDictionary *__cdecl sub_10002F548(id a1, int a2, __CFDictionary *a3)
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  unsigned int v12;
  id v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  id v22;
  void *v23;
  unsigned int v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  id v28;
  id v29;
  __CFDictionary *v30;
  __CFDictionary *v32;
  void *v33;
  void *v34;
  id v35;
  id obj;
  uint64_t v37;
  id v38;
  uint64_t v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[2];
  _QWORD v47[2];
  uint8_t buf[4];
  id v49;
  __int16 v50;
  id v51;
  uint8_t v52[4];
  id v53;
  __int16 v54;
  id v55;
  __int16 v56;
  id v57;

  v32 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v32, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME")));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v32, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_AMOUNT"), v4));
  v35 = v4;
  v5 = (uint64_t)objc_msgSend(v34, "longLongValue");
  v6 = sub_10002FB04(v35, a2);
  v33 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "keysSortedByValueUsingComparator:", &stru_1000B1260));
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
  if (v7)
  {
    v37 = 0;
    v39 = *(_QWORD *)v43;
LABEL_3:
    v38 = v7;
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v43 != v39)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v8);
      v10 = objc_autoreleasePoolPush();
      v11 = sub_10002FF2C(v9);
      v41 = 0;
      v12 = objc_msgSend(v9, "getResourceValue:forKey:error:", &v41, NSURLIsDirectoryKey, 0);
      v13 = v41;
      v14 = v13;
      if (v12 && objc_msgSend(v13, "BOOLValue"))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
        v40 = 0;
        v16 = objc_msgSend(v9, "getResourceValue:forKey:error:", &v40, NSURLParentDirectoryURLKey, 0);
        v17 = v40;
        if (v16)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", v18, 1, v17));

          +[NDFileUtilities markItemAsPurged:](NDFileUtilities, "markItemAsPurged:", v9);
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
          v21 = objc_msgSend(v20, "moveItemAtURL:toURL:error:", v9, v19, 0);

          v22 = v21 ? v19 : 0;
        }
        else
        {
          v22 = 0;
        }

      }
      else
      {
        v22 = v9;
      }
      if (v22)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v24 = objc_msgSend(v23, "removeItemAtURL:error:", v22, 0);

        if (v24)
        {
          v37 += (uint64_t)v11;
          v5 -= (uint64_t)v11;
          v25 = qword_1000C7158;
          if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v49 = v22;
            v50 = 2048;
            v51 = v11;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "CacheDelete request - Purged %@ [%zu bytes]", buf, 0x16u);
          }
        }
      }

      objc_autoreleasePoolPop(v10);
      if (v5 < 1)
        break;
      if (v38 == (id)++v8)
      {
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v37 = 0;
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v37));
  v27 = (id)qword_1000C7158;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = objc_msgSend(v26, "longLongValue");
    v29 = objc_msgSend(v34, "longLongValue");
    *(_DWORD *)v52 = 134218498;
    v53 = v28;
    v54 = 2112;
    v55 = v35;
    v56 = 2048;
    v57 = v29;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Purged %lld bytes on volume %@.  CacheDelete requested %lld.", v52, 0x20u);
  }

  v46[0] = CFSTR("CACHE_DELETE_AMOUNT");
  v46[1] = CFSTR("CACHE_DELETE_VOLUME");
  v47[0] = v26;
  v47[1] = v35;
  v30 = (__CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v47, v46, 2));

  return v30;
}

void sub_10002F9FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, void *a18)
{

  _Unwind_Resume(a1);
}

id sub_10002FB04(void *a1, int a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  id v15;
  void *v16;
  unsigned int v17;
  id v18;
  void *v19;
  unsigned int v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[3];

  v27 = a1;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", dbl_100080530[a2 > 2]));
  v28 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v3 = sub_10002F0B8();
  v30 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (v30 && sub_100030070(v30, v31))
  {
    v4 = sub_10003017C(v30, v29);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    if (v5)
      objc_msgSend(v28, "addEntriesFromDictionary:", v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NDFileUtilities defaultDownloadDirectoryContainer](NDFileUtilities, "defaultDownloadDirectoryContainer"));
  v7 = v6;
  if (v6)
  {
    v26 = v6;
    v8 = sub_100030070(v6, v31);
    v7 = v26;
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v35[0] = NSURLIsDirectoryKey;
      v35[1] = NSURLIsSymbolicLinkKey;
      v35[2] = NSURLIsVolumeKey;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 3));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v26, v10, 5, &stru_1000B1200));

      v12 = 0;
      while (1)
      {

        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nextObject"));
        if (!v9)
        {
LABEL_22:

          v7 = v26;
          break;
        }
        v13 = objc_autoreleasePoolPush();
        v34 = 0;
        v14 = objc_msgSend(v9, "getResourceValue:forKey:error:", &v34, NSURLIsDirectoryKey, 0);
        v15 = v34;
        v16 = v15;
        if (v14 && objc_msgSend(v15, "BOOLValue"))
        {
          v33 = 0;
          v17 = objc_msgSend(v9, "getResourceValue:forKey:error:", &v33, NSURLIsVolumeKey, 0);
          v18 = v33;
          v19 = v18;
          if (v17 && (objc_msgSend(v18, "BOOLValue") & 1) == 0)
          {
            v32 = 0;
            v20 = objc_msgSend(v9, "getResourceValue:forKey:error:", &v32, NSURLIsSymbolicLinkKey, 0);
            v21 = v32;
            v22 = v21;
            if (v20 && (objc_msgSend(v21, "BOOLValue") & 1) == 0)
            {
              v23 = sub_10003017C(v9, v29);
              v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
              if (v24)
              {
                objc_msgSend(v28, "addEntriesFromDictionary:", v24);
                v12 += (uint64_t)objc_msgSend(v24, "count");
              }

            }
            goto LABEL_21;
          }
        }
        else
        {
          v19 = 0;
        }
        v22 = 0;
LABEL_21:

        objc_autoreleasePoolPop(v13);
        if ((unint64_t)++v12 > 0x2710)
          goto LABEL_22;
      }
    }
  }

  return v28;
}

void sub_10002FE54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17)
{
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

id sub_10002FF2C(void *a1)
{
  id v1;
  unsigned int v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  unsigned int v8;
  id v9;
  id v11;
  void *v12;
  id v13;

  v1 = a1;
  v13 = 0;
  v2 = objc_msgSend(v1, "getResourceValue:forKey:error:", &v13, NSURLIsDirectoryKey, 0);
  v3 = v13;
  v4 = v3;
  if (v2 && objc_msgSend(v3, "BOOLValue"))
  {
    v5 = objc_msgSend(objc_retainAutorelease(v1), "fileSystemRepresentation");
    if (v5)
    {
      v6 = 0;
      if (dirstat_np(v5, 0, &v12, 16))
        v7 = 0;
      else
        v7 = v12;
    }
    else
    {
      v7 = 0;
      v6 = 0;
    }
  }
  else
  {
    v11 = 0;
    v8 = objc_msgSend(v1, "getResourceValue:forKey:error:", &v11, NSURLFileAllocatedSizeKey, 0);
    v9 = v11;
    v6 = v9;
    if (v8)
      v7 = objc_msgSend(v9, "longLongValue");
    else
      v7 = 0;
  }

  return v7;
}

void sub_100030040(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

int64_t sub_100030068(id a1, NSDate *a2, NSDate *a3)
{
  return -[NSDate compare:](a2, "compare:", a3);
}

id sub_100030070(void *a1, void *a2)
{
  id v3;
  id v4;
  unsigned int v5;
  id v6;
  id v7;
  id v8;
  id v10;
  id v11;

  v3 = a1;
  v4 = a2;
  if (v4)
  {
    v11 = 0;
    v5 = objc_msgSend(v3, "getResourceValue:forKey:error:", &v11, NSURLVolumeIdentifierKey, 0);
    v6 = v11;
    if (v5)
    {
      v10 = 0;
      v7 = objc_msgSend(v4, "getResourceValue:forKey:error:", &v10, NSURLVolumeIdentifierKey, 0);
      v8 = v10;
      if ((_DWORD)v7)
        v7 = objc_msgSend(v6, "isEqual:", v8);
    }
    else
    {
      v8 = 0;
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void sub_100030160(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

id sub_10003017C(void *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;
  unsigned int v10;
  id v11;
  void *v12;
  int v13;
  unsigned int v14;
  id v15;
  unsigned int v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[5];

  v24 = a1;
  v26 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v31[0] = NSURLFileAllocatedSizeKey;
  v31[1] = NSURLIsDirectoryKey;
  v31[2] = NSURLIsRegularFileKey;
  v31[3] = NSURLAttributeModificationDateKey;
  v31[4] = NSURLNameKey;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 5));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v24, v4, 5, &stru_1000B1220));

  v25 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  for (i = 10000; ; --i)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nextObject"));
    if (!v7)
      break;
    v8 = objc_autoreleasePoolPush();
    v9 = v7;
    v30 = 0;
    v10 = objc_msgSend(v9, "getResourceValue:forKey:error:", &v30, NSURLIsRegularFileKey, 0);
    v11 = v30;
    v12 = v11;
    if (v10 && (objc_msgSend(v11, "BOOLValue") & 1) != 0)
    {
      v13 = 1;
    }
    else
    {
      v29 = 0;
      v14 = objc_msgSend(v9, "getResourceValue:forKey:error:", &v29, NSURLIsDirectoryKey, 0);
      v15 = v29;

      if (!v14 || !objc_msgSend(v15, "BOOLValue"))
      {
        v20 = 0;
        goto LABEL_17;
      }
      v13 = 0;
      v12 = v15;
    }
    v28 = 0;
    v16 = objc_msgSend(v9, "getResourceValue:forKey:error:", &v28, NSURLNameKey, 0);
    v17 = v28;
    v18 = v17;
    if (v16
      && objc_msgSend(v17, "hasPrefix:", CFSTR("CFNetworkDownload_"))
      && objc_msgSend(v18, "hasSuffix:", CFSTR(".tmp")))
    {
      if (v13)
      {
        v27 = 0;
        objc_msgSend(v9, "getResourceValue:forKey:error:", &v27, NSURLAttributeModificationDateKey, 0);
        v19 = v27;
      }
      else
      {
        v19 = (id)objc_claimAutoreleasedReturnValue(+[NDFileUtilities fetchStreamingZipModificationDate:](NDFileUtilities, "fetchStreamingZipModificationDate:", v9));
      }
      v20 = v19;
    }
    else
    {
      v20 = 0;
    }

    v15 = v12;
LABEL_17:

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "earlierDate:", v26));
      v22 = v21 == v20;

      if (v22)
        objc_msgSend(v25, "setObject:forKey:", v20, v9);
    }

    objc_autoreleasePoolPop(v8);
    if (!i)
      goto LABEL_25;

  }
  v9 = 0;
LABEL_25:

  return v25;
}

void sub_100030494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

BOOL sub_100030520(id a1, NSURL *a2, NSError *a3)
{
  NSURL *v4;
  NSError *v5;
  NSObject *v6;
  int v8;
  NSURL *v9;
  __int16 v10;
  NSError *v11;

  v4 = a2;
  v5 = a3;
  v6 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
  {
    v8 = 138412546;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "NDCacheDeletePurgableItemsForVolume enumeration failed at %@ error=%@", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

BOOL sub_1000305F0(id a1, NSURL *a2, NSError *a3)
{
  NSURL *v4;
  NSError *v5;
  NSObject *v6;
  int v8;
  NSURL *v9;
  __int16 v10;
  NSError *v11;

  v4 = a2;
  v5 = a3;
  v6 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
  {
    v8 = 138412546;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "NDCacheDeleteGetPurgableItemsInContainer enumeration failed at %@ error=%@", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

__CFDictionary *__cdecl sub_1000306C0(id a1, int a2, __CFDictionary *a3)
{
  __CFDictionary *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  __CFDictionary *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[2];
  _QWORD v25[2];
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME")));
  v6 = sub_10002FB04(v5, a2);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  v8 = 0;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, buf, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v11);
        v13 = objc_autoreleasePoolPush();
        v14 = sub_10002FF2C(v12);
        objc_autoreleasePoolPop(v13);
        v8 += (uint64_t)v14;
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, buf, 16);
    }
    while (v9);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", v8, (_QWORD)v20));
  v16 = (id)qword_1000C7158;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_msgSend(v15, "longLongValue");
    *(_DWORD *)buf = 134218242;
    v27 = v17;
    v28 = 2112;
    v29 = v5;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Informing CacheDelete purgable bytes %lld on %@", buf, 0x16u);
  }

  v24[0] = CFSTR("CACHE_DELETE_AMOUNT");
  v24[1] = CFSTR("CACHE_DELETE_VOLUME");
  v25[0] = v15;
  v25[1] = v5;
  v18 = (__CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 2));

  return v18;
}

void sub_1000308C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1000309B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100031234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,void *a28)
{
  void *v28;

  _Unwind_Resume(a1);
}

void sub_1000314E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1000316B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v7 = v6;

  _Unwind_Resume(a1);
}

void sub_10003176C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_100031878(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100031950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_100031B34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

id sub_100031E14(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "enumerateKeysAndObjectsUsingBlock:", &stru_1000B1328);
}

void sub_100031E28(id a1, id a2, id a3, BOOL *a4)
{
  objc_msgSend(a3, "obliterate");
}

id sub_100031E30(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "enumerateKeysAndObjectsUsingBlock:", &stru_1000B1308);
}

void sub_100031E44(id a1, id a2, id a3, BOOL *a4)
{
  objc_msgSend(a3, "clientApplicationWasReinstalled");
}

void sub_100031E4C(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void (**v4)(void);

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "obliterationCompletion"));

  if (v3)
  {
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "obliterationCompletion"));
    objc_msgSend(*(id *)(a1 + 32), "setObliterationCompletion:", 0);
    v4[2]();

  }
}

void sub_100031ED4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100031EE8(id a1, id a2, id a3, BOOL *a4)
{
  objc_msgSend(a3, "obliterate");
}

void sub_100031EF0(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 40))
  {
    v3 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(v1 + 24);
      v8 = 138412290;
      v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Ending boost activity from %@", (uint8_t *)&v8, 0xCu);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    objc_msgSend(v5, "endActivity:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));

    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

  }
}

void sub_100031FD8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_100031FF0(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;

  v2 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Triggering periodic update to powerlog for client %@", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "enumerateKeysAndObjectsUsingBlock:", &stru_1000B12A0);
}

void sub_1000320A8(id a1, id a2, id a3, BOOL *a4)
{
  _objc_msgSend(a3, "triggerPowerlogPeriodicUpdate");
}

void sub_100032158(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100032230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1000326A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{

  _Unwind_Resume(a1);
}

void sub_1000328D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100032AE0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100032B6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100032E1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  _Unwind_Resume(a1);
}

void sub_100033000(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100033098(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10003321C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1000336A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_100033B60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1000341F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1000346A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100034F18()
{
  void *v0;
  void *v1;
  void *v2;

  objc_end_catch();
  JUMPOUT(0x100035064);
}

void sub_100034F2C()
{
  void *v0;

  JUMPOUT(0x10003507CLL);
}

void sub_100034F3C()
{
  JUMPOUT(0x10003507CLL);
}

void sub_100034F44()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  JUMPOUT(0x10003508CLL);
}

void sub_100035174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8, uint64_t a9, ...)
{
  void *v9;
  void *v10;
  va_list va;

  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000353B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100035A48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_100035C0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100035F40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10003621C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100036418(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100036628(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100036868(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100036998(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100036AD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1000370E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_100037488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1000378F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_100037C70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_100037EE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1000380C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1000382B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1000384E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_100038A30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100038DCC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100038FF8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100039144(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_100039274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1000393A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_100039774(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10003985C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100039A1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100039B58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100039D5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10003A668(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  va_list va;

  va_start(va, a17);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003AF84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,void *a25,void *a26,void *a27,void *a28)
{
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;

  _Unwind_Resume(a1);
}

void sub_10003B2E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_10003B580(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_10003B83C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_10003BD40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_10003C1B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_10003C4F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_10003C7DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_10003CA30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10003CBA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_10003D174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_10003D404(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10003D5A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10003D7E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_10003DB84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_10003E064(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_10003E370(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  uint64_t v15;

  v3 = a2;
  v4 = (id)qword_1000C7158;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_loggableDescription"));
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280);
    v8 = 138544130;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    v12 = 2112;
    v13 = v3;
    v14 = 2112;
    v15 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ client disconnected (error %@) when attempting to communicate with HTTP Authenticator for Client %@", (uint8_t *)&v8, 0x2Au);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_10003E49C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10003E4CC(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;

  v7 = a3;
  v8 = a4;
  v9 = (id)qword_1000C7158;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_loggableDescription"));
    v12 = 138544386;
    v13 = v10;
    v14 = 2114;
    v15 = v11;
    v16 = 1024;
    v17 = a2;
    v18 = 2112;
    v19 = v7;
    v20 = 2112;
    v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ received auth headers for response, continueLoad: %d authHeaders %@ newRequest %@", (uint8_t *)&v12, 0x30u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_10003E614(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_10003E648(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    dup((int)objc_msgSend(v3, "fileDescriptor"));
    objc_msgSend(v4, "closeFile");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_10003E6A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_10003E6BC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "taskKind") == (id)2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setShouldCancelOnDisconnect:", 1);
    v7 = *(void **)(a1 + 40);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 72)));
    objc_msgSend(v7, "queueUpdatesForTask:updateType:highPriority:", v8, 10, 0);

  }
  v17 = v5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "HTTPBodyStream"));
  v10 = v9;
  if (v9 && !objc_msgSend(v9, "streamStatus"))
  {
    objc_msgSend(v10, "open");
    objc_msgSend(v10, "close");
  }
  v11 = v17;
  if (v6)
  {
    v11 = objc_msgSend(v17, "mutableCopy");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "inputStreamWithFileHandle:taskIdentifier:", v6, *(_QWORD *)(a1 + 72)));
    objc_msgSend(v11, "setHTTPBodyStream:", v12);

  }
  v13 = *(_QWORD *)(a1 + 56);
  v14 = *(void **)(a1 + 40);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "URL"));
  LODWORD(v13) = objc_msgSend(v14, "errorIfBlockedTracker:url:", v13, v15);

  if ((_DWORD)v13)
    v16 = 0;
  else
    v16 = v11;
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), v16);

}

void sub_10003E834(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_10003E8A0(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;

  v3 = a2;
  v4 = (id)qword_1000C7158;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_loggableDescription"));
    v7 = 138543874;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    v11 = 2112;
    v12 = v3;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ client disconnected (error %@) during didReciveData delegate", (uint8_t *)&v7, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_10003E9B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t sub_10003E9E0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10003E9EC(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;

  v3 = a2;
  v4 = (id)qword_1000C7158;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_loggableDescription"));
    v8 = 138543874;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    v12 = 2112;
    v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ client disconnected (error %@) with didReceiveResponse outstanding, responding with a cancel disposition", (uint8_t *)&v8, 0x20u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "error:code:", NSURLErrorDomain, -997));
  objc_msgSend(*(id *)(a1 + 40), "cancel_with_error:", v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_10003EB2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t sub_10003EB68(uint64_t a1, int a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  int v13;

  v4 = (id)qword_1000C7158;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_loggableDescription"));
    v8 = 138543874;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    v12 = 1024;
    v13 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ client responded to didReceiveResponse with disposition %d", (uint8_t *)&v8, 0x1Cu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void sub_10003EC70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t sub_10003EC94(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10003ECA0(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;

  v3 = a2;
  v4 = (id)qword_1000C7158;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_loggableDescription"));
    v7 = 138543874;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    v11 = 2112;
    v12 = v3;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ client disconnected (error %@) with new body stream request outstanding, providing no body", (uint8_t *)&v7, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_10003EDB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10003EDE4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  v5 = v3;
  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "inputStreamWithFileHandle:taskIdentifier:", v3, *(_QWORD *)(a1 + 48)));
  else
    v4 = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_10003EE50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_10003EE70(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setCurrentRequest:");
  v3 = *(void **)(a1 + 40);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56)));
  objc_msgSend(v3, "queueUpdatesForTask:updateType:highPriority:", v4, 8, 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void sub_10003EEF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_10003EF18(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;

  v3 = a2;
  v4 = (id)qword_1000C7158;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_loggableDescription"));
    v7 = 138543874;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    v11 = 2112;
    v12 = v3;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ client disconnected (error %@) with redirection outstanding, following redirect", (uint8_t *)&v7, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void sub_10003F028(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10003F058(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URL"));
  LODWORD(v4) = objc_msgSend(v4, "errorIfBlockedTracker:url:", v5, v6);

  v7 = 56;
  if ((_DWORD)v4)
    v7 = 48;
  (*(void (**)(void))(*(_QWORD *)(a1 + v7) + 16))();

}

void sub_10003F0DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t sub_10003F0FC(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_10003F120(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "protectionSpace"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "authenticationMethod"));
  if ((objc_msgSend(v2, "isEqualToString:", NSURLAuthenticationMethodNTLM) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", NSURLAuthenticationMethodNegotiate) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", NSURLAuthenticationMethodClientCertificate) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v3 = (uint64_t)objc_msgSend(v2, "isEqualToString:", NSURLAuthenticationMethodServerTrust);
  }

  return v3;
}

void sub_10003F1C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10003F1E4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;

  v3 = a2;
  v4 = (id)qword_1000C7158;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_loggableDescription"));
    v7 = 138543618;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ received resume data", (uint8_t *)&v7, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_10003F2E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10003F318(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;

  v3 = a2;
  v4 = (id)qword_1000C7158;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_loggableDescription"));
    v7 = 138543618;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ received resume data", (uint8_t *)&v7, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_10003F41C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10003F44C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a2;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "user"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "password"));
  v8 = (void *)v7;
  if (v6 && v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "host"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("__com.apple.CFNetwork.prefix__"), v9, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280)));

    v11 = objc_alloc((Class)NSURLProtectionSpace);
    v12 = objc_msgSend(v19, "port");
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "protocol"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "realm"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "authenticationMethod"));
    v16 = objc_msgSend(v11, "initWithHost:port:protocol:realm:authenticationMethod:", v10, v12, v13, v14, v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLCredential credentialWithUser:password:persistence:](NSURLCredential, "credentialWithUser:password:persistence:", v6, v8, 2));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLCredentialStorage sharedCredentialStorage](NSURLCredentialStorage, "sharedCredentialStorage"));
    objc_msgSend(v18, "setDefaultCredential:forProtectionSpace:", v17, v16);

  }
}

void sub_10003F5EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_10003F67C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a2;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "user"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "password"));
  v8 = (void *)v7;
  if (v6 && v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "host"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("__com.apple.CFNetwork.prefix__"), v9, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280)));

    v11 = objc_alloc((Class)NSURLProtectionSpace);
    v12 = objc_msgSend(v19, "port");
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "protocol"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "realm"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "authenticationMethod"));
    v16 = objc_msgSend(v11, "initWithHost:port:protocol:realm:authenticationMethod:", v10, v12, v13, v14, v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLCredential credentialWithUser:password:persistence:](NSURLCredential, "credentialWithUser:password:persistence:", v6, v8, 2));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLCredentialStorage sharedCredentialStorage](NSURLCredentialStorage, "sharedCredentialStorage"));
    objc_msgSend(v18, "setDefaultCredential:forProtectionSpace:", v17, v16);

  }
}

void sub_10003F81C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

id sub_10003F8AC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "wakeUpClient:", *(_QWORD *)(a1 + 40));
}

void sub_10003F8B8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40)));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", v3));

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 224);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40)));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  objc_msgSend(*(id *)(a1 + 32), "enqueueTaskWithIdentifier:", *(_QWORD *)(a1 + 40));
  if (!objc_msgSend(v6, "state") && !objc_msgSend(v6, "suspendCount") && !*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(v7, "startResourceTimer");
    objc_msgSend(*(id *)(a1 + 32), "taskShouldResume:", *(_QWORD *)(a1 + 40));
  }

}

void sub_10003F988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_10003F9C0(_QWORD *a1, char a2)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  uint64_t v7;
  char v8;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000A5F8;
  v4[3] = &unk_1000B13C0;
  v2 = (void *)a1[5];
  v3 = a1[6];
  v5 = (id)a1[4];
  v7 = v3;
  v8 = a2;
  v6 = v2;
  objc_msgSend(v5, "handleWillBeginDelayedRequestForTaskWithIdentifier:completionHandler:", v3, v4);

}

void sub_10003FA40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_10003FA54(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  dispatch_block_t v22;
  _QWORD block[4];
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;

  v5 = a3;
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56)));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v7));

  if (a2 == 1 && v5)
  {
    v9 = (id)qword_1000C7158;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_loggableDescription"));
      *(_DWORD *)buf = 138543618;
      v26 = v10;
      v27 = 2114;
      v28 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ using new request from delayed request callback", buf, 0x16u);

    }
    objc_msgSend(v8, "updateCurrentRequest:", v5);
    objc_msgSend(*(id *)(a1 + 40), "setCurrentRequest:", v5);
    v12 = *(void **)(a1 + 32);
    v13 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "identifier")));
    objc_msgSend(v12, "queueUpdatesForTask:updateType:highPriority:", v13, 8, 0);
  }
  else
  {
    v13 = (id)qword_1000C7158;
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (a2 == 2)
    {
      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_loggableDescription"));
        *(_DWORD *)buf = 138543618;
        v26 = v15;
        v27 = 2114;
        v28 = v16;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ will be canceled due to delayed request callback", buf, 0x16u);

      }
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error:code:", NSURLErrorDomain, -999));
      objc_msgSend(v8, "cancel_with_error:", v13);
    }
    else if (v14)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_loggableDescription"));
      *(_DWORD *)buf = 138543618;
      v26 = v17;
      v27 = 2114;
      v28 = v18;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ continuing load from delayed request callback", buf, 0x16u);

    }
  }

  objc_msgSend(*(id *)(a1 + 40), "setRespondedToWillBeginDelayedRequestCallback:", 1);
  v19 = *(void **)(a1 + 32);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "identifier")));
  objc_msgSend(v19, "queueUpdatesForTask:updateType:highPriority:", v20, 9, 0);

  v21 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 200);
  LODWORD(v20) = objc_msgSend(*(id *)(a1 + 40), "qos");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003FE5C;
  block[3] = &unk_1000B1EB8;
  v24 = *(id *)(a1 + 48);
  v22 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, (dispatch_qos_class_t)v20, 0, block);
  dispatch_async(v21, v22);

}

void sub_10003FDDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t sub_10003FE5C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10003FE68(uint64_t a1)
{
  unsigned int v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
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
  int v17;
  void *v18;
  __int16 v19;
  void *v20;

  v2 = objc_msgSend(*(id *)(a1 + 32), "resumedAndWaitingForEarliestBeginDate");
  v3 = (id)qword_1000C7158;
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "uuid"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_loggableDescription"));
      v17 = 138543618;
      v18 = v5;
      v19 = 2114;
      v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ can now begin - earliest begin date satisfied", (uint8_t *)&v17, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "setResumedAndWaitingForEarliestBeginDate:", 0);
    v7 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56)));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v8));
    if (v9)
    {
      v10 = *(void **)(*(_QWORD *)(a1 + 40) + 224);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56)));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v11));
      LOBYTE(v10) = v12 == 0;

      if ((v10 & 1) == 0)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        return;
      }
    }
    else
    {

    }
    v3 = (id)qword_1000C7158;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "uuid"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_loggableDescription"));
      v17 = 138543618;
      v18 = v15;
      v19 = 2114;
      v20 = v16;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ no longer has a valid task or taskInfo, no need to begin", (uint8_t *)&v17, 0x16u);

    }
  }
  else if (v4)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "uuid"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_loggableDescription"));
    v17 = 138543618;
    v18 = v13;
    v19 = 2114;
    v20 = v14;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> %{public}@ ignoring stale delay begin timer", (uint8_t *)&v17, 0x16u);

  }
}

void sub_1000400FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100040164(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  int v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;

  v2 = (id)qword_1000C7158;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280);
    v21 = 138543874;
    v22 = v3;
    v23 = 2112;
    v24 = v5;
    v25 = 2112;
    v26 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Received signal to deliver pending events for client session: <%@>.<%@>", (uint8_t *)&v21, 0x20u);

  }
  v6 = *(_QWORD **)(a1 + 32);
  if (v6[19])
  {
    v7 = (id)qword_1000C7158;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272);
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280);
      v21 = 138543874;
      v22 = v8;
      v23 = 2112;
      v24 = v10;
      v25 = 2112;
      v26 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Delivering pending events for client session: <%@>.<%@>", (uint8_t *)&v21, 0x20u);

    }
    v12 = *(_QWORD *)(a1 + 32);
    v11 = a1 + 32;
    v13 = (void (**)(_QWORD))objc_retainBlock(*(id *)(v12 + 152));
    v14 = *(void **)(*(_QWORD *)v11 + 152);
    *(_QWORD *)(*(_QWORD *)v11 + 152) = 0;

    v13[2](v13);
  }
  else
  {
    v15 = (void *)v6[4];
    v16 = v6[34];
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
    LODWORD(v15) = objc_msgSend(v15, "isHandlingBackgroundURLSessionWithIdentifier:withSessionUUID:", v16, v17);

    if ((_DWORD)v15)
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 145) = 1;
    }
    else
    {
      v18 = (id)qword_1000C7158;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
        v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280);
        v21 = 138543618;
        v22 = v19;
        v23 = 2112;
        v24 = v20;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Application %@ is not handling a background URLSession but we still received a signal to deliver pending events", (uint8_t *)&v21, 0x16u);

      }
    }
  }
}

void sub_1000403C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10004040C(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 224);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40)));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", v3));

  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(v4, "setLowThroughputTimerRetryCount:", 0);
  if (!objc_msgSend(v4, "state") && !objc_msgSend(v4, "suspendCount"))
    objc_msgSend(*(id *)(a1 + 32), "taskShouldResume:", objc_msgSend(v4, "identifier"));

}

void sub_1000404B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1000404D4(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  unint64_t v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  char v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;

  v7 = a2;
  v8 = a3;
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "downloadFileURL"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "downloadFileURL"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](Daemon, "sharedDaemon"));
      if (objc_msgSend(v12, "isPrivileged"))
      {

      }
      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "path"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "path"));
        v15 = objc_msgSend(v13, "hasPrefix:", v14);

        if ((v15 & 1) == 0)
        {
          v16 = (id)qword_1000C7158;
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
            v18 = *(_QWORD *)(a1 + 32);
            v19 = *(void **)(v18 + 280);
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v18 + 120), "path"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "path"));
            *(_DWORD *)buf = 138544130;
            v52 = v17;
            v53 = 2112;
            v54 = v19;
            v55 = 2112;
            v56 = v20;
            v57 = 2112;
            v58 = v21;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> Download directory for bundle %@ has moved to %@, but saved download file path is %@. Need to fix download path", buf, 0x2Au);

          }
          v22 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "URLByAppendingPathComponent:", v23));
          objc_msgSend(v9, "setDownloadFileURL:", v24);

          v25 = (id)qword_1000C7158;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "downloadFileURL"));
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "path"));
            *(_DWORD *)buf = 138543618;
            v52 = v26;
            v53 = 2112;
            v54 = v28;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> New download path: %@", buf, 0x16u);

          }
        }
      }

    }
    v50 = 0;
    if (objc_msgSend(v9, "shouldCancelOnDisconnect") && (uint64_t)objc_msgSend(v9, "state") <= 2)
    {
      objc_msgSend(v9, "setState:", 3);
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentRequest"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "URL"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLError _web_errorWithDomain:code:URL:](NSURLError, "_web_errorWithDomain:code:URL:", NSURLErrorDomain, -997, v30));
      objc_msgSend(v9, "setError:", v31);

      v32 = (id)qword_1000C7158;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
        v46 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_loggableDescription"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));
        v49 = objc_msgSend(v48, "code");
        *(_DWORD *)buf = 138544130;
        v52 = v45;
        v53 = 2114;
        v54 = v46;
        v55 = 2112;
        v56 = v47;
        v57 = 2048;
        v58 = v49;
        _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ completed with error %@ [%ld] (was active before nsurlsessiond exit)", buf, 0x2Au);

      }
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "restoreTask:isOutstanding:", v9, &v50));
    if (v33)
    {
      if (v50)
      {
        objc_msgSend(*(id *)(a1 + 32), "addOutstandingTaskWithIdentifier:", objc_msgSend(v9, "identifier"));
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "setObject:forKeyedSubscript:", v9, v7);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:forKeyedSubscript:", v33, v7);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKeyedSubscript:", v7, v33);
    }
    else
    {
      v34 = (id)qword_1000C7158;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
        v43 = *(void **)(*(_QWORD *)(a1 + 32) + 272);
        v44 = *(void **)(*(_QWORD *)(a1 + 32) + 280);
        *(_DWORD *)buf = 138544130;
        v52 = v42;
        v53 = 2112;
        v54 = v7;
        v55 = 2112;
        v56 = v44;
        v57 = 2112;
        v58 = v43;
        _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> Couldn't recreate existing task with identifier: %@ in session: <%@>.<%@>", buf, 0x2Au);

      }
    }

  }
  v35 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v36 = *(_QWORD *)(v35 + 24) + 1;
  *(_QWORD *)(v35 + 24) = v36;
  if (v36 >= 0x201)
  {
    v37 = (id)qword_1000C7158;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
    {
      v38 = *(_QWORD *)(a1 + 32);
      v39 = *(void **)(v38 + 272);
      v40 = *(void **)(v38 + 280);
      v41 = objc_msgSend(*(id *)(a1 + 48), "count");
      *(_DWORD *)buf = 138543874;
      v52 = v40;
      v53 = 2112;
      v54 = v39;
      v55 = 2048;
      v56 = v41;
      _os_log_fault_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_FAULT, "Too many tasks for app session <%{public}@>.<%@> (%zu > 512)", buf, 0x20u);
    }

    *a4 = 1;
  }

}

void sub_100040AAC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

id sub_100040C98(uint64_t a1)
{
  NSObject *v2;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;

  v2 = (id)qword_1000C7158;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_loggableDescription"));
    v6 = 138543618;
    v7 = v4;
    v8 = 2114;
    v9 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "NDSession <%{public}@> %{public}@ restored but never started, terminating with timeout", (uint8_t *)&v6, 0x16u);

  }
  return objc_msgSend(*(id *)(a1 + 48), "cancel_with_error:", *(_QWORD *)(a1 + 56));
}

void sub_100040D84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100040DA8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 280);
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier"));
  if (!objc_msgSend(v2, "isEqualToString:")
    || (objc_msgSend(*(id *)(a1 + 32), "clientIsActive") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "sessionHasOutstandingTasks") & 1) != 0
    || (v3 = *(_QWORD *)(a1 + 32), !*(_BYTE *)(v3 + 141)))
  {

  }
  else
  {
    v4 = objc_msgSend(*(id *)(v3 + 208), "count");

    if (v4)
      objc_msgSend(*(id *)(a1 + 32), "wakeUpClient:", 1);
  }
}

void sub_100040E58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id sub_100040E6C(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  int v7;
  id result;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;

  v2 = (id)qword_1000C7158;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier"));
    v5 = (void *)v4;
    v6 = *(_DWORD *)(a1 + 48);
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 168))
      v7 = 89;
    else
      v7 = 78;
    v9 = 138544130;
    v10 = v3;
    v11 = 2112;
    v12 = v4;
    v13 = 1024;
    v14 = v6;
    v15 = 1024;
    v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@> notified associated application %@(%d) was suspended, XPC(%c)", (uint8_t *)&v9, 0x22u);

  }
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "processIdentifier");
  if ((_DWORD)result == *(_DWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "invalidate");
    return objc_msgSend(*(id *)(a1 + 32), "clientDidDisconnect");
  }
  return result;
}

void sub_100040FA8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100043AC0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100043B4C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100043C4C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100043CAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)NDStatusMonitor;
  -[_Unwind_Exception dealloc](&a9, "dealloc");
  _Unwind_Resume(a1);
}

void sub_10004402C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1000442CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_1000443B8(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "handleBetterNetworkEvent");
}

id sub_1000443C0(uint64_t a1, uint64_t a2, void *a3)
{
  return _objc_msgSend(a3, "handleDynamicStoreCallback:changedKeys:", a1, a2);
}

void sub_1000443D4(_QWORD *a1)
{
  NDStatusMonitorClientHolder *v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v2 = -[NDStatusMonitorClientHolder initWithClient:identifier:]([NDStatusMonitorClientHolder alloc], "initWithClient:identifier:", a1[4], a1[6]);
  if (objc_msgSend(*(id *)(a1[5] + 16), "containsObject:", v2))
  {
    v3 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Simulating network change event", v5, 2u);
    }
    objc_msgSend(*(id *)(a1[5] + 16), "removeObject:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NDStatusMonitorClientHolder client](v2, "client"));
    objc_msgSend(v4, "statusMonitor:callbackForIdentifier:networkChanged:", a1[5], -[NDStatusMonitorClientHolder identifier](v2, "identifier"), 0);

  }
}

void sub_1000444B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1000444D4(_QWORD *a1)
{
  uint64_t v2;
  NDStatusMonitorClientHolder *v3;
  dispatch_time_t v4;
  uint64_t v5;
  NSObject *v6;
  NDStatusMonitorClientHolder *v7;
  _QWORD block[5];
  NDStatusMonitorClientHolder *v9;
  uint64_t v10;

  if (!objc_msgSend(*(id *)(a1[4] + 16), "count"))
  {
    v2 = symptom_create("com.apple.symptoms.discretionary.tasks.suspended");
    symptom_set_qualifier(v2, 0, 0);
    symptom_send(v2);
  }
  v3 = -[NDStatusMonitorClientHolder initWithClient:identifier:]([NDStatusMonitorClientHolder alloc], "initWithClient:identifier:", a1[5], a1[6]);
  objc_msgSend(*(id *)(a1[4] + 16), "addObject:", v3);
  v4 = dispatch_time(0x8000000000000000, 1000000000 * a1[7]);
  v5 = a1[4];
  v6 = *(NSObject **)(v5 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000445EC;
  block[3] = &unk_1000B2418;
  block[4] = v5;
  v9 = v3;
  v10 = a1[7];
  v7 = v3;
  dispatch_after(v4, v6, block);

}

void sub_1000445DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000445EC(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;

  if (objc_msgSend(*(id *)(a1[4] + 16), "containsObject:", a1[5]))
  {
    v2 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
    {
      v3 = a1[6];
      v7 = 134217984;
      v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Simulating network change event since %lld seconds have passed", (uint8_t *)&v7, 0xCu);
    }
    v5 = a1[4];
    v4 = a1 + 4;
    objc_msgSend(*(id *)(v5 + 16), "removeObject:", v4[1]);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v4[1], "client"));
    objc_msgSend(v6, "statusMonitor:callbackForIdentifier:networkChanged:", *v4, objc_msgSend((id)v4[1], "identifier"), 0);

  }
}

void sub_1000446EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100044744(id a1)
{
  NDStatusMonitor *v1;
  void *v2;

  v1 = objc_alloc_init(NDStatusMonitor);
  v2 = (void *)qword_1000C7070;
  qword_1000C7070 = (uint64_t)v1;

}

void sub_100044828(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100044A4C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100044C68(uint64_t a1)
{
  void *v2;
  NSMutableDictionary *v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", *(_QWORD *)(a1 + 40)));

  if (!v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));

  }
  v4 = objc_retainBlock(*(id *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 48));

  v6 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Will wake client %@ for session %@ if we receive a notification that it supports launch-on-demand", (uint8_t *)&v9, 0x16u);
  }
}

void sub_100044D90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100044DB8(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  xpc_object_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;

  v2 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v8 = 138412546;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Attempting to launch client %@ for session %@", (uint8_t *)&v8, 0x16u);
  }
  if (*(_QWORD *)(*(_QWORD *)(a1 + 48) + 16))
  {
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v5, "com.apple.nsurlsessiond-events.message-type", 1);
    xpc_dictionary_set_string(v5, kNSURLSessionLaunchOnDemandClientIdentifierKey, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"));
    xpc_dictionary_set_string(v5, kNSURLSessionLaunchOnDemandSessionIdentifierKey, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"));
    xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 48) + 16), v5);

  }
  else
  {
    v6 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412290;
      v9 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Couldn't launch application %@ because we don't have an xpc connection to UserEventAgent", (uint8_t *)&v8, 0xCu);
    }
  }
}

void sub_100044F54(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100044F6C(uint64_t a1, void *a2)
{
  xpc_object_t value;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  void (**v18)(void);
  void *v19;
  xpc_object_t xdict;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint8_t v31[128];
  uint8_t buf[4];
  void *v33;

  xdict = a2;
  if (xpc_get_type(xdict) == (xpc_type_t)&_xpc_type_dictionary
    && xpc_dictionary_get_int64(xdict, "com.apple.nsurlsessiond-events.message-type") == 2)
  {
    value = xpc_dictionary_get_value(xdict, "com.apple.nsurlsessiond-events.registered-clients");
    v19 = (void *)objc_claimAutoreleasedReturnValue(value);
    v4 = _CFXPCCreateCFObjectFromXPCObject();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v4;

    v7 = (id)qword_1000C7158;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "allKeys"));
      *(_DWORD *)buf = 138412290;
      v33 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Updated Registered Launch-On-Demand Clients: %@", buf, 0xCu);

    }
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = *(id *)(*(_QWORD *)(a1 + 32) + 32);
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v10)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKeyedSubscript:", v12));
          if (v13)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectForKey:", v12);
            v24 = 0u;
            v25 = 0u;
            v22 = 0u;
            v23 = 0u;
            v14 = v13;
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            if (v15)
            {
              v16 = *(_QWORD *)v23;
              do
              {
                for (j = 0; j != v15; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v23 != v16)
                    objc_enumerationMutation(v14);
                  v18 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)j)));
                  v18[2]();

                }
                v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
              }
              while (v15);
            }

          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v9);
    }

  }
}

void sub_100045218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1000452A4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  v3 = a2;
  v4 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received xpc event", buf, 2u);
  }
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_connection)
  {
    v5 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NDUserEventAgentConnection received connection", v6, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "handleNewConnection:", v3);
  }

}

void sub_10004537C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10004538C(id a1)
{
  NDUserEventAgentConnection *v1;
  void *v2;

  v1 = objc_alloc_init(NDUserEventAgentConnection);
  v2 = (void *)qword_1000C7078;
  qword_1000C7078 = (uint64_t)v1;

}

void sub_1000453B4(id a1)
{
  int AppBooleanValue;
  NSObject *v2;
  uint8_t v3[16];

  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("enableBluetoothLinkRequirements"), CFSTR("com.apple.nsurlsessiond"), 0);
  byte_1000C7090 = AppBooleanValue;
  if (AppBooleanValue)
  {
    v2 = qword_1000C7120;
    if (os_log_type_enabled((os_log_t)qword_1000C7120, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "com.apple.nsurlsessiond enableBluetoothLinkRequirements is true - will assert bluetooth link requirements", v3, 2u);
    }
  }
}

void sub_100045438(id a1)
{
  int AppIntegerValue;
  NSObject *v2;
  _DWORD v3[2];

  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("bluetoothLinkRequirementsOverrideTimerValue"), CFSTR("com.apple.nsurlsessiond"), 0);
  if (AppIntegerValue)
  {
    v2 = qword_1000C7120;
    if (os_log_type_enabled((os_log_t)qword_1000C7120, OS_LOG_TYPE_DEFAULT))
    {
      v3[0] = 67109120;
      v3[1] = AppIntegerValue;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "com.apple.nsurlsessiond bluetoothLinkRequirementsOverrideTimerValue is %d", (uint8_t *)v3, 8u);
    }
    dword_1000C66D0 = AppIntegerValue;
  }
}

NSObject *sub_1000454F8(NSObject *a1, void *a2)
{
  id v3;
  NSObject *v4;
  dispatch_time_t v5;

  v3 = a2;
  v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, a1);
  v5 = dispatch_time(0, 2147483647000000000);
  dispatch_source_set_timer(v4, v5, 0x1DCD64FFC4653600uLL, 0);
  dispatch_source_set_event_handler(v4, v3);

  return v4;
}

void sub_100045584(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if ((objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___NSSecureCoding) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v6);

}

void sub_1000455E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_100045758(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100045A64(id a1)
{
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
  NSSet *v11;
  uint64_t v12;
  void *v13;

  v1 = objc_opt_class(NSURL);
  v2 = objc_opt_class(NSDictionary);
  v3 = objc_opt_class(NSData);
  v4 = objc_opt_class(NSDate);
  v5 = objc_opt_class(NSString);
  v6 = objc_opt_class(NSArray);
  v7 = objc_opt_class(NSNumber);
  v8 = objc_opt_class(NSError);
  v9 = objc_opt_class(NSSet);
  v10 = objc_opt_class(NSUUID);
  v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(NSURLSessionConfiguration), 0);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)qword_1000C70A8;
  qword_1000C70A8 = v12;

}

void sub_100045BF8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100045C50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100045CD0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100045D28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100045DB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100045E44(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100045EC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100045F5C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000460A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10004613C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1000462DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1000463F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10004648C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000464E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_10004656C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100046600(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10004667C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000466D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_10004675C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1000467F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000468E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000469BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_100046AB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100046B8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_100046C84(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100046CF8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100046DBC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100046E98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100046F70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10004704C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1000470C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1000471E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_10004735C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100047414(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100047E6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100048010(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1000481E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1000482A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100048330(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10004838C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t sub_10004916C(uint64_t a1, uint64_t a2)
{
  char v4;
  unsigned int v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  BOOL v9;
  int v10;
  char v12;
  unsigned int v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t Data;
  uint64_t v18;
  void *v19;
  uint64_t result;

  while (*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
      break;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    while (1)
    {
      v7 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
        break;
      v8 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0)
        goto LABEL_11;
      v4 += 7;
      v9 = v5++ >= 9;
      if (v9)
      {
        v6 = 0;
        v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
      v6 = 0;
LABEL_13:
    if (v10 || (v6 & 7) == 4)
      break;
    if ((v6 >> 3) == 2)
    {
      Data = PBReaderReadData(a2);
      v18 = objc_claimAutoreleasedReturnValue(Data);
      v19 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v18;

    }
    else if ((v6 >> 3) == 1)
    {
      v12 = 0;
      v13 = 0;
      v14 = 0;
      *(_BYTE *)(a1 + 20) |= 1u;
      while (1)
      {
        v15 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v15 == -1 || v15 >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
          break;
        v16 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
        *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
        v14 |= (unint64_t)(v16 & 0x7F) << v12;
        if ((v16 & 0x80) == 0)
          goto LABEL_30;
        v12 += 7;
        v9 = v13++ >= 9;
        if (v9)
        {
          LODWORD(v14) = 0;
          goto LABEL_32;
        }
      }
      *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_30:
      if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
        LODWORD(v14) = 0;
LABEL_32:
      *(_DWORD *)(a1 + 16) = v14;
    }
    else
    {
      result = PBReaderSkipValueWithTag(a2);
      if (!(_DWORD)result)
        return result;
    }
  }
  return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_1000494C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100049644(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100049B80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{

  _Unwind_Resume(a1);
}

void sub_100049D3C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100049F74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_10004A0F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

id sub_10004A148()
{
  void *v0;
  void *v1;
  __CFString *v2;
  void *v3;
  unsigned __int8 v4;
  id v5;
  id v6;
  id v8;
  id v9;
  uint64_t v10;
  uint8_t buf[4];
  const __CFString *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;

  v10 = 1;
  v0 = (void *)container_system_group_path_for_identifier(objc_msgSend(0, "UTF8String"), objc_msgSend(CFSTR("systemgroup.com.apple.nsurlstoragedresources"), "UTF8String"), &v10);
  if (v0)
  {
    v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v0, 1, 0));
    free(v0);
    if (v1)
    {
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library"), 1));
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v9 = 0;
      v4 = objc_msgSend(v3, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v2, 1, 0, &v9);
      v5 = v9;

      if ((v4 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v8 = objc_msgSend(v5, "code");
        *(_DWORD *)buf = 138412802;
        v12 = v2;
        v13 = 2112;
        v14 = v5;
        v15 = 2048;
        v16 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Couldn't create directory at %@, error: %@ [%ld]", buf, 0x20u);
      }
      v6 = (id)objc_claimAutoreleasedReturnValue(-[__CFString URLByAppendingPathComponent:isDirectory:](v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("dafsaData.bin"), 0));

      return v6;
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v12 = CFSTR("systemgroup.com.apple.nsurlstoragedresources");
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Error getting the system group container for Group ID %@ ", buf, 0xCu);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to get the system container for nsurlstoraged", buf, 2u);
  }
  v6 = 0;
  return v6;
}

void sub_10004A3B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10004A3E8(uint64_t a1, uint64_t a2)
{
  const char *v3;
  uint64_t v5;
  int v6;
  uint64_t v7;

  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      v6 = 134217984;
      v7 = a2;
      v3 = "Asset download failed. Result  %ld";
LABEL_7:
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, v3, (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "queryAndFindBestAsset:", 1);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(int *)(a1 + 40);
      v6 = 134217984;
      v7 = v5;
      v3 = "Asset download completed. Asset Version downloaded is %lu";
      goto LABEL_7;
    }
  }
}

void sub_10004A4E0(uint64_t a1, uint64_t a2)
{
  _BOOL4 v4;
  uint64_t v5;
  const char *v6;
  uint32_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;

  v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (a2)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 32);
      v9 = 138412546;
      v10 = v5;
      v11 = 2048;
      v12 = a2;
      v6 = "Failed to purge the asset with version %@. Purge result = %ld";
      v7 = 22;
LABEL_7:
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, v6, (uint8_t *)&v9, v7);
    }
  }
  else if (v4)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138412290;
    v10 = v8;
    v6 = "Asset version %@ purged";
    v7 = 12;
    goto LABEL_7;
  }
}

void sub_10004A5D8(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;

  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = a2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Catalogue fetch failed with result %ld. Fall back to the currently installed asset", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v7) = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Catalogue fetch succeeded", (uint8_t *)&v7, 2u);
    }
    v4 = objc_msgSend(objc_alloc((Class)MAAssetQuery), "initWithType:", CFSTR("com.apple.MobileAsset.TopLevelDomainDafsa"));
    objc_msgSend(v4, "returnTypes:", 2);
    objc_msgSend(v4, "queryMetaDataSync");
    v5 = *(void **)(a1 + 32);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "results"));
    objc_msgSend(v5, "findBestAssetFrom:skipDownload:", v6, *(unsigned __int8 *)(a1 + 40));

  }
}

void sub_10004A724(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10004A748(id a1)
{
  TLDMobileAssetManager *v1;
  void *v2;
  dispatch_queue_global_t global_queue;
  NSObject *v4;

  v1 = objc_alloc_init(TLDMobileAssetManager);
  v2 = (void *)qword_1000C70C0;
  qword_1000C70C0 = (uint64_t)v1;

  global_queue = dispatch_get_global_queue(17, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v4, &stru_1000B18F8);

}

void sub_10004A7A0(id a1)
{
  objc_msgSend((id)qword_1000C70C0, "queryAndFindBestAsset:", 0);
}

void sub_10004A848(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10004A8B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10004A9F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_10004ABF8(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v7, *(_QWORD *)(a1 + 40)) & 1) != 0)
          objc_msgSend(v7, *(SEL *)(a1 + 40), *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 48), (_QWORD)v8);
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

void sub_10004AD28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10004AD58(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NDUserEventAgentConnection sharedUserEventAgentConnection](NDUserEventAgentConnection, "sharedUserEventAgentConnection"));
  objc_msgSend(v2, "launchProcessWithIdentifier:sessionIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void sub_10004AD9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_10004AE94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_10004AF20(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10004AFF0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_10004B0D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_10004B1DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  objc_sync_exit(v3);
  _Unwind_Resume(a1);
}

void sub_10004B2EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10004B47C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v2);

  _Unwind_Resume(a1);
}

void sub_10004B52C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v2);

  _Unwind_Resume(a1);
}

void sub_10004B640(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10004B750(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10004B888(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_10004BA74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10004BADC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10004BB30(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10004BC1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_10004BED8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

id sub_10004BF6C(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  objc_super v5;
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  uint64_t v9;

  v2 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    *(_DWORD *)buf = 138412546;
    v7 = v3;
    v8 = 2048;
    v9 = 64800;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Application %@ has been in background for %lu seconds. Will reevaluate discretionary downloads", buf, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "setIsInTransitionalDiscretionaryPeriod:", 0);
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)NDSpringBoardApplication;
  return objc_msgSendSuper2(&v5, "invokeSelectorForAllObservers:", "applicationEndedTransitionalDiscretionaryBackgroundPeriod:");
}

void sub_10004C054(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  NSObject *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  double v16;
  dispatch_time_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;

  objc_msgSend(*(id *)(a1 + 32), "currentRequestDelay");
  v2 = *(void **)(a1 + 32);
  if (v3 == 0.0)
  {
    v4 = 60.0;
  }
  else
  {
    objc_msgSend(v2, "currentRequestDelay");
    v6 = v5 + v5;
    v4 = 3600.0;
    if (v6 <= 3600.0)
    {
      objc_msgSend(*(id *)(a1 + 32), "currentRequestDelay");
      v4 = v7 + v7;
    }
    v2 = *(void **)(a1 + 32);
  }
  objc_msgSend(v2, "setCurrentRequestDelay:", v4);
  v8 = (id)qword_1000C7158;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD **)(a1 + 32);
    v10 = v9[1];
    objc_msgSend(v9, "currentRequestDelay");
    v18 = 138412546;
    v19 = v10;
    v20 = 2048;
    v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Set request delay for %@ to %f", (uint8_t *)&v18, 0x16u);
  }

  v13 = *(void **)(a1 + 32);
  v12 = a1 + 32;
  objc_msgSend(v13, "setupDelayTimer");
  v14 = *(void **)v12;
  v15 = *(NSObject **)(*(_QWORD *)v12 + 40);
  objc_msgSend(v14, "currentRequestDelay");
  v17 = dispatch_time(0x8000000000000000, (uint64_t)((v16 + v16) * 1000000000.0));
  dispatch_source_set_timer(v15, v17, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

void sub_10004C1B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_10004C1CC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_resetRequestDelay");
}

void sub_10004C1D4(id a1)
{
  dispatch_queue_attr_t v1;
  dispatch_queue_attr_t v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  NSObject *v6;

  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue(v1);
  v2 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_UTILITY, 0);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v4 = dispatch_queue_create("com.apple.nsurlsessiond.NDSpringBoardApplication.request-delay-queue", v3);
  v5 = (void *)qword_1000C70E8;
  qword_1000C70E8 = (uint64_t)v4;

}

void sub_10004C2DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10004C4A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v2);

  _Unwind_Resume(a1);
}

void sub_10004C550(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v2);

  _Unwind_Resume(a1);
}

void sub_10004C664(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10004C774(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10004C808(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10004C998(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10004CA88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10004CB34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10004CCF0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_10004CDE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

id sub_10004CE64(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_resetRequestDelay");
}

void sub_10004CE6C(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  NSObject *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  double v16;
  dispatch_time_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;

  objc_msgSend(*(id *)(a1 + 32), "currentRequestDelay");
  v2 = *(void **)(a1 + 32);
  if (v3 == 0.0)
  {
    v4 = 60.0;
  }
  else
  {
    objc_msgSend(v2, "currentRequestDelay");
    v6 = v5 + v5;
    v4 = 3600.0;
    if (v6 <= 3600.0)
    {
      objc_msgSend(*(id *)(a1 + 32), "currentRequestDelay");
      v4 = v7 + v7;
    }
    v2 = *(void **)(a1 + 32);
  }
  objc_msgSend(v2, "setCurrentRequestDelay:", v4);
  v8 = (id)qword_1000C7158;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD **)(a1 + 32);
    v10 = v9[1];
    objc_msgSend(v9, "currentRequestDelay");
    v18 = 138412546;
    v19 = v10;
    v20 = 2048;
    v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Set request delay for %@ to %f", (uint8_t *)&v18, 0x16u);
  }

  v13 = *(void **)(a1 + 32);
  v12 = a1 + 32;
  objc_msgSend(v13, "setupDelayTimer");
  v14 = *(void **)v12;
  v15 = *(NSObject **)(*(_QWORD *)v12 + 40);
  objc_msgSend(v14, "currentRequestDelay");
  v17 = dispatch_time(0x8000000000000000, (uint64_t)((v16 + v16) * 1000000000.0));
  dispatch_source_set_timer(v15, v17, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

void sub_10004CFCC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_10004CFE4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_resetRequestDelay");
}

void sub_10004D02C(id a1)
{
  dispatch_queue_attr_t v1;
  dispatch_queue_attr_t v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  NSObject *v6;

  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue(v1);
  v2 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_UTILITY, 0);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v4 = dispatch_queue_create("com.apple.nsurlsessiond.NDExtension.request-delay-queue", v3);
  v5 = (void *)qword_1000C70F8;
  qword_1000C70F8 = (uint64_t)v4;

}

void sub_10004D09C(id a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v1 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v2 = (void *)qword_1000C70C8;
  qword_1000C70C8 = v1;

  v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)qword_1000C70D0;
  qword_1000C70D0 = v3;

  v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = (void *)qword_1000C70D8;
  qword_1000C70D8 = v5;

}

uint64_t sub_10004E570(uint64_t a1, uint64_t a2)
{
  char v4;
  unsigned int v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  BOOL v9;
  int v10;
  char v12;
  unsigned int v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t Data;
  uint64_t v18;
  void *v19;
  uint64_t result;

  while (*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
      break;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    while (1)
    {
      v7 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
        break;
      v8 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0)
        goto LABEL_11;
      v4 += 7;
      v9 = v5++ >= 9;
      if (v9)
      {
        v6 = 0;
        v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
      v6 = 0;
LABEL_13:
    if (v10 || (v6 & 7) == 4)
      break;
    if ((v6 >> 3) == 2)
    {
      Data = PBReaderReadData(a2);
      v18 = objc_claimAutoreleasedReturnValue(Data);
      v19 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v18;

    }
    else if ((v6 >> 3) == 1)
    {
      v12 = 0;
      v13 = 0;
      v14 = 0;
      *(_BYTE *)(a1 + 20) |= 1u;
      while (1)
      {
        v15 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v15 == -1 || v15 >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
          break;
        v16 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
        *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
        v14 |= (unint64_t)(v16 & 0x7F) << v12;
        if ((v16 & 0x80) == 0)
          goto LABEL_30;
        v12 += 7;
        v9 = v13++ >= 9;
        if (v9)
        {
          LODWORD(v14) = 0;
          goto LABEL_32;
        }
      }
      *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_30:
      if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
        LODWORD(v14) = 0;
LABEL_32:
      *(_DWORD *)(a1 + 16) = v14;
    }
    else
    {
      result = PBReaderSkipValueWithTag(a2);
      if (!(_DWORD)result)
        return result;
    }
  }
  return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_10004EC90(uint64_t a1, uint64_t a2)
{
  char v4;
  unsigned int v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  BOOL v9;
  int v10;
  char v12;
  unsigned int v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t Data;
  uint64_t v18;
  void *v19;
  uint64_t result;

  while (*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
      break;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    while (1)
    {
      v7 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
        break;
      v8 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0)
        goto LABEL_11;
      v4 += 7;
      v9 = v5++ >= 9;
      if (v9)
      {
        v6 = 0;
        v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
      v6 = 0;
LABEL_13:
    if (v10 || (v6 & 7) == 4)
      break;
    if ((v6 >> 3) == 2)
    {
      Data = PBReaderReadData(a2);
      v18 = objc_claimAutoreleasedReturnValue(Data);
      v19 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v18;

    }
    else if ((v6 >> 3) == 1)
    {
      v12 = 0;
      v13 = 0;
      v14 = 0;
      *(_BYTE *)(a1 + 20) |= 1u;
      while (1)
      {
        v15 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v15 == -1 || v15 >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
          break;
        v16 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
        *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
        v14 |= (unint64_t)(v16 & 0x7F) << v12;
        if ((v16 & 0x80) == 0)
          goto LABEL_30;
        v12 += 7;
        v9 = v13++ >= 9;
        if (v9)
        {
          LODWORD(v14) = 0;
          goto LABEL_32;
        }
      }
      *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_30:
      if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
        LODWORD(v14) = 0;
LABEL_32:
      *(_DWORD *)(a1 + 16) = v14;
    }
    else
    {
      result = PBReaderSkipValueWithTag(a2);
      if (!(_DWORD)result)
        return result;
    }
  }
  return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_10004F714(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10004F858(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_10004FA84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_10004FBA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_10004FD08(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _BYTE v26[128];

  v5 = a2;
  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "host"));
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("__com.apple.CFNetwork.prefix__")))
  {
    *((_BYTE *)v23 + 24) = 1;
    v8 = *(void **)(a1 + 32);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10004FF5C;
    v19[3] = &unk_1000B19E0;
    v20 = v7;
    v21 = &v22;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v19);

  }
  if (*((_BYTE *)v23 + 24))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allValues", 0));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v26, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v9);
          v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLCredentialStorage sharedCredentialStorage](NSURLCredentialStorage, "sharedCredentialStorage"));
          objc_msgSend(v14, "removeCredential:forProtectionSpace:", v13, v5);

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v26, 16);
      }
      while (v10);
    }

  }
  _Block_object_dispose(&v22, 8);

}

void sub_10004FEF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, ...)
{
  void *v15;
  void *v16;
  void *v17;
  va_list va;

  va_start(va, a15);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10004FF5C(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "hasSuffix:", a2);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

void sub_10004FFA0(id a1)
{
  NDUserSyncStakeholder *v1;
  void *v2;
  id v3;

  v1 = objc_opt_new(NDUserSyncStakeholder);
  v2 = (void *)qword_1000C7110;
  qword_1000C7110 = (uint64_t)v1;

  if (+[NDUserSyncStakeholder EDUMode](NDUserSyncStakeholder, "EDUMode"))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
    objc_msgSend(v3, "registerUserSyncStakeholder:withMachServiceName:", qword_1000C7110, CFSTR("com.apple.nsurlsessiond.usermanager.sync"));

  }
}

void sub_100050020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1000512B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  _Unwind_Resume(a1);
}

void sub_100051428(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100051544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;
  void *v10;

  _Unwind_Resume(a1);
}

void sub_10005165C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1000519B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_100051B38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;
  void *v10;

  _Unwind_Resume(a1);
}

id sub_100051C84(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
}

void sub_100051CC4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));

  if (!v2)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:");

  }
  v3 = *(void **)(a1 + 48);
  if (v3 && (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "user")), v4, v4))
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "user"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:");

    v5 = *(_QWORD *)(a1 + 48);
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "user"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, v6);

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  }
}

void sub_100051DF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  v11 = v10;

  _Unwind_Resume(a1);
}

void sub_100051E1C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000520C0;
  block[3] = &unk_1000B20B8;
  v9 = v3;
  v10 = v4;
  v11 = v5;
  v7 = v3;
  dispatch_sync(v6, block);

}

void sub_100051EB8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "user"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:");

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));
  if (!v2)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:");

  }
  v3 = *(_QWORD *)(a1 + 48);
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "user"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v3, v4);

}

void sub_100051FA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t sub_100051FD0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100051FE0(uint64_t a1)
{

}

void sub_100051FE8(_QWORD *a1)
{
  void *v2;
  BOOL v3;
  int v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1[4] + 24), "objectForKeyedSubscript:", a1[5]));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:", a1[5]));
  if (v2)
    v3 = v6 == 0;
  else
    v3 = 1;
  v4 = !v3;
  if (v3)
    v5 = 0;
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", v6));
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v5);
  if (v4)

}

void sub_1000520A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1000520C0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  if (v2 && (v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "user")), v3, v3))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "user"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setObject:forKeyedSubscript:");

    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48)));
    if (!v4)
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "setObject:forKeyedSubscript:");

    }
    v5 = *(_QWORD *)(a1 + 32);
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48)));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "user"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, v6);

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "removeObjectForKey:", *(_QWORD *)(a1 + 48));
  }
}

void sub_1000521EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100052218(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;
  int v4;
  NSError *v5;

  v2 = a2;
  v3 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "An XPC error occurred when obtaining the default credential: %@", (uint8_t *)&v4, 0xCu);
  }

}

void sub_1000522C0(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "user"));
  objc_msgSend(v3, "removeObjectForKey:", v2);

}

void sub_100052324(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_100052344(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:", a1[5]));

  if (!v2)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKeyedSubscript:");

  }
  v3 = a1[6];
  if (v3)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:", a1[5]));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)a1[6], "user"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v3, v4);

  }
}

void sub_100052418(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100052440(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100052514;
  block[3] = &unk_1000B23F0;
  block[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_sync(v5, block);

}

void sub_1000524C8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16)));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id sub_100052514(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addEntriesFromDictionary:", *(_QWORD *)(a1 + 40));
}

void sub_10005254C(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;
  int v4;
  NSError *v5;

  v2 = a2;
  v3 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "An XPC error occurred when obtaining all credentials %@", (uint8_t *)&v4, 0xCu);
  }

}

void sub_1000525F4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000526D4;
  block[3] = &unk_1000B20B8;
  block[4] = v4;
  v9 = v5;
  v10 = v3;
  v7 = v3;
  dispatch_sync(v6, block);

}

void sub_100052690(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:", a1[5]));
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_1000526D4(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", *(_QWORD *)(a1 + 48)));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:");

}

void sub_10005272C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100052740(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;
  int v4;
  NSError *v5;

  v2 = a2;
  v3 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "An XPC error occurred when obtaining a credential: %@", (uint8_t *)&v4, 0xCu);
  }

}

void sub_100053A2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_100053B54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_100053C50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100053DBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_100053E98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_100053FD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1000540B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1000541DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100054294(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_100054308(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100054380(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100054434(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100054644(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100054984(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100055190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_100055448(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1000555A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100055800(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1000559A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100055B20(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100055BB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100055D50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_10005603C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_100056190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1000562A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_100056534(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100056658(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1000568D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_100056C40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_100056F20(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_100057070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1000576B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100057A94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, void *a17)
{
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  _Unwind_Resume(a1);
}

void sub_100057DA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_100058380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, void *a18, void *a19)
{
  void *v19;
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_100058640(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100058848(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100058A68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100058CC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100058E7C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = objc_msgSend(v3, "continueLoad");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_actualAuthHeaders"));
  (*(void (**)(uint64_t, id, void *, _QWORD))(v4 + 16))(v4, v5, v6, 0);

}

void sub_100058EF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_100058F20(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BYTE *v13;
  _BYTE *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void (**v23)(_QWORD);
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  unint64_t v31;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentRequest"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _web_errorWithDomain:code:URL:](NSError, "_web_errorWithDomain:code:URL:", NSURLErrorDomain, -997, v8));

    objc_msgSend(*(id *)(a1 + 32), "_nsurlsessionproxy_cancelWithError:", v9);
  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "_requiresSustainedDataDelivery") & 1) != 0)
  {
    v10 = *(void **)(*(_QWORD *)(a1 + 40) + 72);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64)));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v11));
    v13 = objc_msgSend(v12, "unsignedIntegerValue");

    v14 = objc_msgSend(*(id *)(a1 + 48), "length");
    v15 = v13 - v14;
    if (v13 == v14)
      v16 = 0;
    else
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v15));
    v17 = *(void **)(*(_QWORD *)(a1 + 40) + 72);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64)));
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v18);

    if (v13 != v14)
    v19 = (id)qword_1000C7120;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "descriptionForTaskWithIdentifier:", *(_QWORD *)(a1 + 64)));
      v28 = 138543618;
      v29 = v20;
      v30 = 2048;
      v31 = v15;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ data acknowledged, now has %lu bytes pending acknowledgement", (uint8_t *)&v28, 0x16u);

    }
    if (!(v15 >> 19))
    {
      v21 = *(void **)(*(_QWORD *)(a1 + 40) + 80);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64)));
      v23 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", v22));

      if (v23)
      {
        v24 = (id)qword_1000C7120;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "descriptionForTaskWithIdentifier:", *(_QWORD *)(a1 + 64)));
          v28 = 138543362;
          v29 = v25;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ acknowledging pending data", (uint8_t *)&v28, 0xCu);

        }
        v26 = *(void **)(*(_QWORD *)(a1 + 40) + 80);
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64)));
        objc_msgSend(v26, "setObject:forKeyedSubscript:", 0, v27);

        v23[2](v23);
      }

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void sub_100059240(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1000592FC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  unsigned int v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  unsigned int v17;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentRequest"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _web_errorWithDomain:code:URL:](NSError, "_web_errorWithDomain:code:URL:", NSURLErrorDomain, -997, v8));

    objc_msgSend(*(id *)(a1 + 32), "_nsurlsessionproxy_cancelWithError:", v9);
  }
  v10 = v5;
  v11 = objc_msgSend(v10, "disposition");
  v12 = (id)qword_1000C7120;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "descriptionForTaskWithIdentifier:", *(_QWORD *)(a1 + 56)));
    v14 = 138543618;
    v15 = v13;
    v16 = 1024;
    v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ received response disposition: %d", (uint8_t *)&v14, 0x12u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_100059480(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1000594D8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentRequest"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _web_errorWithDomain:code:URL:](NSError, "_web_errorWithDomain:code:URL:", NSURLErrorDomain, -997, v8));

    objc_msgSend(*(id *)(a1 + 32), "_nsurlsessionproxy_cancelWithError:", v9);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    v10 = v5;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "request"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_actualRequest"));

    v13 = (id)qword_1000C7120;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "descriptionForTaskWithIdentifier:", *(_QWORD *)(a1 + 64)));
      v15 = 138543618;
      v16 = v14;
      v17 = 2112;
      v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ client responded to redirect with request %@", (uint8_t *)&v15, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    if (!v12)
      objc_msgSend(*(id *)(a1 + 32), "cancel");

  }
}

void sub_100059694(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_100059704(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_nsurlsessionproxy_clearError");
  v6 = v5;
  if (!objc_msgSend(v6, "hasRequest"))
  {
    v8 = 0;
    if (!a3)
      goto LABEL_11;
    goto LABEL_10;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "request"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_actualRequest"));

  if (v8)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "shouldRetainInfraWiFi"))
      objc_msgSend(*(id *)(a1 + 40), "retainInfraWiFiForTaskWithIdentifier:", *(_QWORD *)(a1 + 56));
    if (objc_msgSend(*(id *)(a1 + 40), "shouldRetainBTLinkAssertion"))
      objc_msgSend(*(id *)(a1 + 40), "retainBTLinkAssertionWithIdentifier:", *(_QWORD *)(a1 + 56));
  }
  if (a3)
  {
LABEL_10:
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentRequest"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URL"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _web_errorWithDomain:code:URL:](NSError, "_web_errorWithDomain:code:URL:", NSURLErrorDomain, -997, v10));

    objc_msgSend(*(id *)(a1 + 32), "_nsurlsessionproxy_cancelWithError:", v11);
  }
LABEL_11:
  if (objc_msgSend(v6, "hasBodyStream"))
  {
    v24 = 0;
    v25 = 0;
    +[NSStream getBoundStreamsWithBufferSize:inputStream:outputStream:](NSStream, "getBoundStreamsWithBufferSize:inputStream:outputStream:", 0x20000, &v25, &v24);
    v12 = v25;
    v13 = v24;
    v14 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56)));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v15);

    objc_msgSend(v13, "open");
    v16 = objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v16, "setHTTPBodyStream:", v12);

    v8 = v16;
  }
  else
  {
    v17 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56)));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v18));

    if (v19)
    {
      v20 = objc_msgSend(v8, "mutableCopy");
      v21 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56)));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", v22));
      objc_msgSend(v20, "setHTTPBodyStream:", v23);

      v8 = v20;
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_100059988(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_100059A10(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(v10, "hasDisposition"))
  {
    objc_msgSend(v10, "disposition");
    if (objc_msgSend(v10, "hasCredential"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "credential"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_actualCredential"));

    }
    else
    {
      v6 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    if (a3)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentRequest"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URL"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _web_errorWithDomain:code:URL:](NSError, "_web_errorWithDomain:code:URL:", NSURLErrorDomain, -997, v8));

      objc_msgSend(*(id *)(a1 + 32), "_nsurlsessionproxy_cancelWithError:", v9);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void sub_100059B34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_100059B90(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;

  v6 = a2;
  v7 = a4;
  block[0] = _NSConcreteStackBlock;
  block[2] = sub_100059C64;
  block[3] = &unk_1000B1CB0;
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 144);
  block[1] = 3221225472;
  v15 = v7;
  v16 = v6;
  v10 = v8;
  v11 = *(_QWORD *)(a1 + 32);
  v17 = v10;
  v18 = v11;
  v19 = *(id *)(a1 + 48);
  v12 = v6;
  v13 = v7;
  dispatch_async(v9, block);

}

void sub_100059C64(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (id)qword_1000C7120;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(void **)(a1 + 32);
      v4 = objc_msgSend(v3, "code");
      v5 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 138412802;
      v18 = v3;
      v19 = 2048;
      v20 = v4;
      v21 = 2112;
      v22 = v5;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Received error %@ [%ld] reading from streamTask %@", buf, 0x20u);
    }

    v7 = *(void **)(a1 + 64);
    v6 = (id *)(a1 + 64);
    objc_msgSend(v7, "closeRead");
    objc_msgSend(*v6, "closeWrite");
    objc_msgSend(*v6, "cancel");
  }
  else if (objc_msgSend(*(id *)(a1 + 40), "length"))
  {
    v8 = objc_msgSend(*(id *)(a1 + 40), "_createDispatchData");
    v9 = *(void **)(a1 + 48);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100059E44;
    v13[3] = &unk_1000B1C88;
    v10 = v9;
    v11 = *(_QWORD *)(a1 + 56);
    v12 = *(void **)(a1 + 64);
    v14 = v10;
    v15 = v11;
    v16 = v12;
    tcp_connection_write(v10, v8, v13);

  }
  else
  {
    tcp_connection_write_eof(*(_QWORD *)(a1 + 48));
  }
}

void sub_100059E10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

id sub_100059E44(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  _DWORD v7[2];
  __int16 v8;
  uint64_t v9;

  if (a2)
  {
    v4 = qword_1000C7120;
    if (os_log_type_enabled((os_log_t)qword_1000C7120, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v7[0] = 67109376;
      v7[1] = a2;
      v8 = 2048;
      v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received error %d writing to tcp_connection %p", (uint8_t *)v7, 0x12u);
    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "performForwardingFromStreamTask:toTCPConnection:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void sub_100059F0C(uint64_t a1, void *a2, int a3)
{
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  uint64_t v21;

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    v7 = qword_1000C7120;
    if (os_log_type_enabled((os_log_t)qword_1000C7120, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 67109376;
      v19 = a3;
      v20 = 2048;
      v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received error %d reading from tcp_connection %p", buf, 0x12u);
    }
    goto LABEL_6;
  }
  if (!dispatch_data_get_size(v5))
  {
LABEL_6:
    objc_msgSend(*(id *)(a1 + 32), "closeRead");
    objc_msgSend(*(id *)(a1 + 32), "closeWrite");
    objc_msgSend(*(id *)(a1 + 32), "cancel");
    goto LABEL_7;
  }
  v9 = *(void **)(a1 + 32);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_taskGroup"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_groupConfiguration"));
  objc_msgSend(v11, "timeoutIntervalForRequest");
  v13 = v12;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10005A0F4;
  v15[3] = &unk_1000B1C38;
  v14 = *(void **)(a1 + 48);
  v15[4] = *(_QWORD *)(a1 + 40);
  v16 = v14;
  v17 = *(id *)(a1 + 32);
  objc_msgSend(v9, "writeData:timeout:completionHandler:", v6, v15, v13);

LABEL_7:
}

void sub_10005A0AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_10005A0F4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 144);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005A180;
  block[3] = &unk_1000B20B8;
  block[4] = v2;
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

id sub_10005A180(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performForwardingFromTCPConnection:toStreamTask:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t sub_10005A190(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10005A1A0(uint64_t a1)
{

}

void sub_10005A1A8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;

  v5 = a3;
  if (!v5)
  {
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "host"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "streamTaskWithHostName:port:", v7, objc_msgSend(*(id *)(a1 + 40), "port")));

    objc_msgSend(v8, "resume");
    v9 = (void *)tcp_connection_create_with_connected_fd(a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144));
    tcp_connection_allow_client_socket_access(v9, 1);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10005A370;
    v14[3] = &unk_1000B1BE8;
    v10 = v9;
    v11 = *(_QWORD *)(a1 + 32);
    v15 = v10;
    v16 = v11;
    v12 = v8;
    v17 = v12;
    tcp_connection_set_event_handler(v10, v14);
    tcp_connection_start(v10);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v12);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setObject:forKeyedSubscript:", v10, v12);
    v13 = objc_retainBlock(*(id *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setObject:forKeyedSubscript:", v13, v12);

  }
}

void sub_10005A31C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_10005A370(uint64_t a1, unsigned int a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;

  v4 = qword_1000C7120;
  if (os_log_type_enabled((os_log_t)qword_1000C7120, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 134218240;
    v7 = v5;
    v8 = 2048;
    v9 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "received tcp_connection (%p) event %lu", (uint8_t *)&v6, 0x16u);
  }
  if (a2 == 3)
  {
    objc_msgSend(*(id *)(a1 + 48), "closeRead");
    objc_msgSend(*(id *)(a1 + 48), "closeWrite");
    objc_msgSend(*(id *)(a1 + 48), "cancel");
    tcp_connection_cancel(*(_QWORD *)(a1 + 32));
  }
  else if (a2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 40), "performForwardingFromTCPConnection:toStreamTask:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "performForwardingFromStreamTask:toTCPConnection:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
  }
}

void sub_10005A478(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  char *v5;
  char *v6;
  __int128 v7;
  unint64_t v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  __int128 v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;

  v2 = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bodyData"));
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_retainAutorelease(v3);
    v5 = (char *)objc_msgSend(v4, "bytes");
    v6 = (char *)objc_msgSend(v4, "length");
    if (v6)
    {
      v8 = 0;
      *(_QWORD *)&v7 = 138544130;
      v20 = v7;
      do
      {
        if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "streamStatus", v20) > 4)
          break;
        v9 = (uint64_t)objc_msgSend(*(id *)(a1 + 40), "write:maxLength:", &v5[v8], &v6[-v8]);
        v10 = v9;
        if (v9 < 1)
        {
          v11 = (id)qword_1000C7120;
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "descriptionForTaskWithIdentifier:", *(_QWORD *)(a1 + 80)));
            v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "streamError"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "streamError"));
            v19 = objc_msgSend(v18, "code");
            *(_DWORD *)buf = v20;
            v23 = v21;
            v24 = 1024;
            v25 = v10;
            v26 = 2112;
            v27 = v17;
            v28 = 2048;
            v29 = v19;
            _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}@ writing to stream returned %d, error %@ [%ld]", buf, 0x26u);

          }
          objc_msgSend(*(id *)(a1 + 40), "close");
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "streamError"));
          v13 = v12;
          if (v12)
          {
            v14 = v12;
          }
          else
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "currentRequest"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "URL"));
            v14 = (id)objc_claimAutoreleasedReturnValue(+[NSError _web_errorWithDomain:code:URL:](NSError, "_web_errorWithDomain:code:URL:", NSURLErrorDomain, -1017, v16));

          }
          objc_msgSend(*(id *)(a1 + 56), "_nsurlsessionproxy_cancelWithError:", v14);

        }
        else
        {
          v8 += v9;
        }
      }
      while (v8 < (unint64_t)v6);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "close");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

  objc_autoreleasePoolPop(v2);
}

void sub_10005A708(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10005A79C(uint64_t a1)
{
  void *v2;
  unsigned int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PDURLSessionProxyServerService sharedService](PDURLSessionProxyServerService, "sharedService"));
  v3 = objc_msgSend(v2, "isConnected");

  if (v3)
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "containsObject:", *(_QWORD *)(a1 + 40)))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "removeObject:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "resendPendingMessage:", *(_QWORD *)(a1 + 40));
    }
  }
}

void sub_10005A814(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10005A824(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = objc_alloc((Class)__NSCFURLSessionTaskInfo);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_uniqueIdentifier"));
  v8 = objc_msgSend(v6, "initWithDataTask:uniqueIdentifier:bundleID:sessionID:", v5, v7, 0, *(_QWORD *)(a1 + 32));

  objc_msgSend(v8, "setCountOfBytesSent:", objc_msgSend(v5, "countOfBytesSent"));
  objc_msgSend(v8, "setCountOfBytesReceived:", objc_msgSend(v5, "countOfBytesReceived"));
  objc_msgSend(v8, "setCountOfBytesExpectedToSend:", objc_msgSend(v5, "countOfBytesExpectedToSend"));
  objc_msgSend(v8, "setCountOfBytesExpectedToReceive:", objc_msgSend(v5, "countOfBytesExpectedToReceive"));
  objc_msgSend(v8, "set_doesSZExtractorConsumeExtractedData:", objc_msgSend(v5, "_doesSZExtractorConsumeExtractedData"));
  objc_msgSend(v8, "set_hasSZExtractor:", objc_msgSend(v5, "_hasSZExtractor"));
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v9);

}

void sub_10005A938(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_10005A990(id a1)
{
  void *v1;
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[_DASScheduler sharedScheduler](_DASScheduler, "sharedScheduler"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityGroup groupWithName:maxConcurrent:](_DASActivityGroup, "groupWithName:maxConcurrent:", CFSTR("com.apple.nsurlsessiond.NSURLSessionProxyPool"), 2));
  objc_msgSend(v2, "createActivityGroup:", v1);

}

void sub_10005A9F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t sub_10005C020(uint64_t a1, uint64_t a2)
{
  char v4;
  unsigned int v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  BOOL v9;
  int v10;
  PDURLSessionProxySessionMessage *v12;
  char v13;
  unsigned int v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t result;
  _QWORD v19[2];

  while (*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
      break;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    while (1)
    {
      v7 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
        break;
      v8 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0)
        goto LABEL_11;
      v4 += 7;
      v9 = v5++ >= 9;
      if (v9)
      {
        v6 = 0;
        v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
      v6 = 0;
LABEL_13:
    if (v10 || (v6 & 7) == 4)
      break;
    if ((v6 >> 3) == 2)
    {
      v13 = 0;
      v14 = 0;
      v15 = 0;
      *(_BYTE *)(a1 + 24) |= 1u;
      while (1)
      {
        v16 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v16 == -1 || v16 >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
          break;
        v17 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v16);
        *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v16 + 1;
        v15 |= (unint64_t)(v17 & 0x7F) << v13;
        if ((v17 & 0x80) == 0)
          goto LABEL_32;
        v13 += 7;
        v9 = v14++ >= 9;
        if (v9)
        {
          v15 = 0;
          goto LABEL_34;
        }
      }
      *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_32:
      if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
        v15 = 0;
LABEL_34:
      *(_QWORD *)(a1 + 8) = v15;
    }
    else if ((v6 >> 3) == 1)
    {
      v12 = objc_alloc_init(PDURLSessionProxySessionMessage);
      objc_storeStrong((id *)(a1 + 16), v12);
      v19[0] = 0;
      v19[1] = 0;
      if (!PBReaderPlaceMark(a2, v19) || (sub_1000640A8((uint64_t)v12, a2) & 1) == 0)
      {

        return 0;
      }
      PBReaderRecallMark(a2, v19);

    }
    else
    {
      result = PBReaderSkipValueWithTag(a2);
      if (!(_DWORD)result)
        return result;
    }
  }
  return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_10005C54C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_10005C7EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10005C9A8(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_10005CB7C(uint64_t a1)
{
  uint64_t v1;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 98)
    && objc_msgSend(*(id *)(v1 + 16), "startedUserInitiated")
    && (sub_10001AE20(*(void **)(*(_QWORD *)(a1 + 32) + 8)) & 1) == 0)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "error:code:", CFSTR("_nsurlsessiondErrorDomain"), 9));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "cancel_with_error:");

  }
}

void sub_10005CC0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_10005CC20(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 98) && *(_BYTE *)(v2 + 100))
  {
    objc_msgSend((id)v2, "startThroughputMonitoring");
    v2 = *(_QWORD *)(a1 + 32);
  }
  sub_100014C18(*(void **)(v2 + 8), *(id *)(v2 + 120), *(void **)(v2 + 80));
}

void sub_10005CC68(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  id v4;
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 98))
  {
    v3 = *(void **)(v1 + 24);
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier"));
    LODWORD(v3) = objc_msgSend(v3, "isEqualToString:");

    if ((_DWORD)v3)
    {
      v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "error:code:", CFSTR("_nsurlsessiondErrorDomain"), 2));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "cancel_with_error:");

    }
  }
}

void sub_10005CD0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_10005CD24(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier"));
  LODWORD(v2) = objc_msgSend(v2, "isEqualToString:");

  if ((_DWORD)v2)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "error:code:", CFSTR("_nsurlsessiondErrorDomain"), 1));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "cancel_with_error:");

  }
}

void sub_10005CDBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

id sub_10005CDD4(uint64_t a1)
{
  int v2;
  void *v3;

  v2 = IOPSDrawingUnlimitedPower();
  v3 = *(void **)(a1 + 32);
  if (v2)
    return objc_msgSend(v3, "stopThroughputMonitoring");
  else
    return objc_msgSend(v3, "startThroughputMonitoring");
}

void sub_10005CE0C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 72);
  if (v3 > 7)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(v2 + 48));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = 0;

  }
  else
  {
    *(_QWORD *)(v2 + 72) = v3 + 1;
    objc_msgSend(*(id *)(a1 + 32), "setThroughputTimerForCurrentInterval");
  }
}

uint64_t sub_10005DD0C(uint64_t a1, uint64_t a2)
{
  char v4;
  unsigned int v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  BOOL v9;
  int v10;
  char v12;
  unsigned int v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t result;
  uint64_t String;
  uint64_t v19;
  uint64_t v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t Data;
  void *v27;

  while (*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
      break;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    while (1)
    {
      v7 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
        break;
      v8 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0)
        goto LABEL_11;
      v4 += 7;
      v9 = v5++ >= 9;
      if (v9)
      {
        v6 = 0;
        v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
      v6 = 0;
LABEL_13:
    if (v10 || (v6 & 7) == 4)
      break;
    switch((v6 >> 3))
    {
      case 1u:
        v12 = 0;
        v13 = 0;
        v14 = 0;
        *(_BYTE *)(a1 + 36) |= 2u;
        while (1)
        {
          v15 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v15 == -1 || v15 >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
            break;
          v16 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
          *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
          v14 |= (unint64_t)(v16 & 0x7F) << v12;
          if ((v16 & 0x80) == 0)
            goto LABEL_38;
          v12 += 7;
          v9 = v13++ >= 9;
          if (v9)
          {
            LODWORD(v14) = 0;
            goto LABEL_40;
          }
        }
        *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_38:
        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
          LODWORD(v14) = 0;
LABEL_40:
        *(_DWORD *)(a1 + 32) = v14;
        continue;
      case 2u:
        String = PBReaderReadString(a2);
        v19 = objc_claimAutoreleasedReturnValue(String);
        v20 = 16;
        goto LABEL_36;
      case 3u:
        v21 = 0;
        v22 = 0;
        v23 = 0;
        *(_BYTE *)(a1 + 36) |= 1u;
        break;
      case 4u:
        Data = PBReaderReadData(a2);
        v19 = objc_claimAutoreleasedReturnValue(Data);
        v20 = 24;
LABEL_36:
        v27 = *(void **)(a1 + v20);
        *(_QWORD *)(a1 + v20) = v19;

        continue;
      default:
        result = PBReaderSkipValueWithTag(a2);
        if (!(_DWORD)result)
          return result;
        continue;
    }
    while (1)
    {
      v24 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v24 == -1 || v24 >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
        break;
      v25 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v24);
      *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v24 + 1;
      v23 |= (unint64_t)(v25 & 0x7F) << v21;
      if ((v25 & 0x80) == 0)
        goto LABEL_42;
      v21 += 7;
      v9 = v22++ >= 9;
      if (v9)
      {
        v23 = 0;
        goto LABEL_44;
      }
    }
    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_42:
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
      v23 = 0;
LABEL_44:
    *(_QWORD *)(a1 + 8) = v23;
  }
  return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_10005E314(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_10005E510(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10005EB90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_10005F12C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_10005F4B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26)
{
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;

  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_10005F6A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10005F778(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  if (MKBDeviceUnlockedSinceBoot() == 1)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    v2 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Device is locked - waiting", v3, 2u);
    }
  }
}

uint64_t sub_10005F7FC(uint64_t result, int a2)
{
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) == a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

uint64_t sub_10005F820(uint64_t a1)
{
  uint64_t result;

  result = notify_cancel(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  return result;
}

void sub_10005F858(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  __int128 v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  _BYTE v20[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIDsForAppProxies:", *(_QWORD *)(a1 + 40)));
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v4)
  {
    v6 = *(_QWORD *)v15;
    *(_QWORD *)&v5 = 138412290;
    v13 = v5;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v8, v13, (_QWORD)v14));
        v10 = v9 == 0;

        if (!v10)
        {
          v11 = qword_1000C7158;
          if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v13;
            v19 = v8;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Bundle %@ uninstalled. Need to obliterate", buf, 0xCu);
          }
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v8));
          objc_msgSend(v12, "obliterate");

        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v4);
  }

}

void sub_10005FA00(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10005FA30(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  __int128 v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  _BYTE v20[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIDsForAppProxies:", *(_QWORD *)(a1 + 40)));
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v4)
  {
    v6 = *(_QWORD *)v15;
    *(_QWORD *)&v5 = 138412290;
    v13 = v5;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v8, v13, (_QWORD)v14));
        v10 = v9 == 0;

        if (!v10)
        {
          v11 = qword_1000C7158;
          if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v13;
            v19 = v8;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Bundle %@ re-installed. Need to adjust download paths", buf, 0xCu);
          }
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v8));
          objc_msgSend(v12, "clientApplicationWasReinstalled");

        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v4);
  }

}

void sub_10005FBD8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10005FC08(id a1)
{
  +[NSXPCConnection endTransaction](NSXPCConnection, "endTransaction");
}

uint64_t sub_10005FC14(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "archiveState");
  }
  else
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "archivePath"));
    +[NDFileUtilities removeItemAtPath:](NDFileUtilities, "removeItemAtPath:", v2);

  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_10005FCA4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_10005FCB4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10005FCC4(uint64_t a1)
{

}

void sub_10005FCCC(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", a1[5]));
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getSessionWithIdentifier:", a1[6]));
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_10005FD28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_10005FD3C(uint64_t a1, int a2)
{
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "userInfo"));
  v5 = (id)qword_1000C7158;
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
      v8 = *(_QWORD *)(a1 + 40);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
      v13 = 138543874;
      v14 = v7;
      v15 = 2112;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@>.<%@>.<%@> Lost connection to app -- connection interrupted", (uint8_t *)&v13, 0x20u);

    }
  }
  else if (v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
    v11 = *(_QWORD *)(a1 + 40);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v13 = 138543874;
    v14 = v10;
    v15 = 2112;
    v16 = v11;
    v17 = 2112;
    v18 = v12;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NDSession <%{public}@>.<%@>.<%@> Lost connection to app -- connection invalidated", (uint8_t *)&v13, 0x20u);

  }
  objc_msgSend(v4, "clientDidDisconnect");
  objc_msgSend(*(id *)(a1 + 32), "setUserInfo:", 0);

}

void sub_10005FEDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t sub_10005FF14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_10005FF24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

int64_t sub_10005FF34(id a1, id a2, id a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "creationTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v5, "creationTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v8 = objc_msgSend(v6, "compare:", v7);

  return (int64_t)v8;
}

void sub_10005FFD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_10005FFFC(id a1)
{
  Daemon *v1;
  void *v2;

  v1 = objc_alloc_init(Daemon);
  v2 = (void *)qword_1000C7130;
  qword_1000C7130 = (uint64_t)v1;

}

void sub_10006086C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1000608E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)NDSpringBoard;
  -[_Unwind_Exception dealloc](&a9, "dealloc");
  _Unwind_Resume(a1);
}

void sub_100060B8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  if (v2)

  _Unwind_Resume(a1);
}

void sub_100060D74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100060E2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100060F94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100061404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_10006188C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32)
{
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a27, 8);

  _Unwind_Resume(a1);
}

void sub_100061978(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t sub_100061A00(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100061A10(uint64_t a1)
{

}

void sub_100061A18(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_100061AA0(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_onqueue_releaseAssertionForBundleID:sessionID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

id sub_100061AB0(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "isValidAssertion:withName:", a3, *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  return result;
}

void sub_100061AF4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  __int16 v10;
  uint64_t v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "monitoredBundleIDsUpdated");
  v2 = (id)qword_1000C7158;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count");
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
    v6 = 138412802;
    v7 = v3;
    v8 = 2048;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Stopped monitoring app %@, now %lu total %@", (uint8_t *)&v6, 0x20u);
  }

}

void sub_100061BF8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100061C10(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1[4] + 24), "objectForKeyedSubscript:", a1[5]));
  objc_msgSend(v2, "removeObject:", a1[6]);

  v3 = (id)qword_1000C7158;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = a1[5];
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1[4] + 24), "objectForKeyedSubscript:", v4));
    v6 = 138412546;
    v7 = v4;
    v8 = 2048;
    v9 = objc_msgSend(v5, "count");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Removed observer for app %@, now %lu observers", (uint8_t *)&v6, 0x16u);

  }
}

void sub_100061D08(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100061D30(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v3 = objc_msgSend(v2, "isAutomaticAppUpdatesAllowed");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 68) = v3;

  v4 = qword_1000C7158;
  v5 = os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Background updates are on", buf, 2u);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getBackgroundSettingsAppList"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100061E70;
    v7[3] = &unk_1000B2050;
    v7[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Background updates were turned off", buf, 2u);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "enumerateKeysAndObjectsUsingBlock:", &stru_1000B2090);
  }
}

void sub_100061E5C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100061E70(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  id v21;
  uint64_t v22;
  void *j;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint8_t v33[128];
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", v5));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKeyedSubscript:", v5));
    v9 = objc_msgSend(v8, "isEqualToNumber:", v6);

    if ((v9 & 1) == 0)
    {
      v10 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v35 = v5;
        v36 = 2112;
        v37 = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Background update setting for %@ was changed to %@", buf, 0x16u);
      }
      v11 = objc_msgSend(v6, "BOOLValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v11));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKeyedSubscript:", v12, v5);

      v13 = qword_1000C7158;
      v14 = os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT);
      if ((v11 & 1) != 0)
      {
        if (v14)
        {
          *(_DWORD *)buf = 138412290;
          v35 = v5;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Notifying observers for %@ that background update setting was turned on", buf, 0xCu);
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", v5));
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v16 = v15;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v17)
        {
          v18 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v17; i = (char *)i + 1)
            {
              if (*(_QWORD *)v25 != v18)
                objc_enumerationMutation(v16);
              objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i), "applicationBackgroundUpdatesTurnedOn:", v5, (_QWORD)v24);
            }
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v17);
        }
      }
      else
      {
        if (v14)
        {
          *(_DWORD *)buf = 138412290;
          v35 = v5;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Notifying observers for %@ that background update setting was turned off", buf, 0xCu);
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", v5));
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v16 = v20;
        v21 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (v21)
        {
          v22 = *(_QWORD *)v29;
          do
          {
            for (j = 0; j != v21; j = (char *)j + 1)
            {
              if (*(_QWORD *)v29 != v22)
                objc_enumerationMutation(v16);
              objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j), "applicationBackgroundUpdatesTurnedOff:", v5);
            }
            v21 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
          }
          while (v21);
        }
      }

    }
  }

}

void sub_1000621A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100062224(id a1, NSString *a2, NSArray *a3, BOOL *a4)
{
  NSString *v5;
  NSArray *v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v5 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = a3;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "applicationBackgroundUpdatesTurnedOff:", v5, (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

void sub_100062328(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100062350(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessStateDescriptor descriptor](RBSProcessStateDescriptor, "descriptor"));
  objc_msgSend(v4, "setValues:", 1);
  objc_msgSend(v4, "setEndowmentNamespaces:", &off_1000B4AE8);
  objc_msgSend(v3, "setStateDescriptor:", v4);
  objc_msgSend(v3, "setEvents:", 1);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001AD14;
  v5[3] = &unk_1000B2000;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v3, "setUpdateHandler:", v5);

}

void sub_10006241C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

id sub_100062448(uint64_t a1, void *a2)
{
  return _objc_msgSend(a2, "handleBackgroundSettingsChange");
}

void sub_100062450(id a1)
{
  NDSpringBoard *v1;
  void *v2;

  v1 = objc_alloc_init(NDSpringBoard);
  v2 = (void *)qword_1000C7140;
  qword_1000C7140 = (uint64_t)v1;

}

void sub_100062590(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100062B80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

id sub_100062C4C(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_onqueue_wakeUpExtension:forSession:withSessionUUID:wakeRequirement:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

id sub_100062C60(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", *(_QWORD *)(a1 + 40));
}

id sub_100062C6C(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "containsObject:", *(_QWORD *)(a1 + 40));
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", *(_QWORD *)(a1 + 40));
  return result;
}

void sub_100062CAC(_QWORD *a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1[4] + 24), "objectForKeyedSubscript:", a1[5]));
  objc_msgSend(v2, "removeObject:", a1[6]);

}

void sub_100062CF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100062D04(_QWORD *a1)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1[4] + 24), "objectForKeyedSubscript:", a1[5]));

  if (!v2)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    objc_msgSend(*(id *)(a1[4] + 24), "setObject:forKeyedSubscript:");

  }
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1[4] + 24), "objectForKeyedSubscript:", a1[5]));
  objc_msgSend(v4, "addObject:", a1[6]);

}

void sub_100062D90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_100062DA8(id a1)
{
  NDChronoKitLauncher *v1;
  void *v2;

  if (objc_opt_class(CHSNSURLSessiondService))
  {
    v1 = objc_alloc_init(NDChronoKitLauncher);
    v2 = (void *)qword_1000C7148;
    qword_1000C7148 = (uint64_t)v1;

  }
}

void sub_100062EE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1000630D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100063478(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

_BYTE *sub_1000636F4(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[65])
  {
    if (result[67])
      return objc_msgSend(result, "startThroughputMonitoring");
  }
  return result;
}

_QWORD *sub_100063710(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (*((_BYTE *)result + 65)
    || (objc_msgSend(result, "stopThroughputMonitoring"), result = *(_QWORD **)(a1 + 32), *((_BYTE *)result + 65)))
  {
    if (!*((_BYTE *)result + 66))
    {
      if (*((_BYTE *)result + 64))
      {
        result[10] = 300;
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 65) = 0;
        return objc_msgSend(*(id *)(a1 + 32), "stopThroughputMonitoring");
      }
    }
  }
  return result;
}

void sub_100063778(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 48);
  if (v3 > 7)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(v2 + 24));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = 0;

  }
  else
  {
    *(_QWORD *)(v2 + 48) = v3 + 1;
    objc_msgSend(*(id *)(a1 + 32), "setThroughputTimerForCurrentInterval");
  }
}

uint64_t sub_1000640A8(uint64_t a1, uint64_t a2)
{
  char v4;
  unsigned int v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  BOOL v9;
  int v10;
  uint64_t String;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  char v17;
  unsigned int v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  char v22;
  unsigned int v23;
  unint64_t v24;
  char v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;

  while (*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
      break;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    while (1)
    {
      v7 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
        break;
      v8 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0)
        goto LABEL_11;
      v4 += 7;
      v9 = v5++ >= 9;
      if (v9)
      {
        v6 = 0;
        v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
      v6 = 0;
LABEL_13:
    if (v10 || (v6 & 7) == 4)
      break;
    switch((v6 >> 3))
    {
      case 1u:
        String = PBReaderReadString(a2);
        v13 = objc_claimAutoreleasedReturnValue(String);
        v14 = 32;
        goto LABEL_37;
      case 2u:
        v16 = PBReaderReadString(a2);
        v13 = objc_claimAutoreleasedReturnValue(v16);
        v14 = 40;
        goto LABEL_37;
      case 3u:
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 48) |= 2u;
        while (2)
        {
          v20 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v20 == -1 || v20 >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            v21 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v20);
            *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v20 + 1;
            v19 |= (unint64_t)(v21 & 0x7F) << v17;
            if (v21 < 0)
            {
              v17 += 7;
              v9 = v18++ >= 9;
              if (v9)
              {
                v19 = 0;
                goto LABEL_41;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
          v19 = 0;
LABEL_41:
        v28 = 16;
        goto LABEL_46;
      case 4u:
        v22 = 0;
        v23 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 48) |= 1u;
        break;
      case 5u:
        v26 = PBReaderReadString(a2);
        v13 = objc_claimAutoreleasedReturnValue(v26);
        v14 = 24;
LABEL_37:
        v27 = *(void **)(a1 + v14);
        *(_QWORD *)(a1 + v14) = v13;

        continue;
      default:
        result = PBReaderSkipValueWithTag(a2);
        if (!(_DWORD)result)
          return result;
        continue;
    }
    while (1)
    {
      v24 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v24 == -1 || v24 >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
        break;
      v25 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v24);
      *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v24 + 1;
      v19 |= (unint64_t)(v25 & 0x7F) << v22;
      if ((v25 & 0x80) == 0)
        goto LABEL_43;
      v22 += 7;
      v9 = v23++ >= 9;
      if (v9)
      {
        v19 = 0;
        goto LABEL_45;
      }
    }
    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_43:
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
      v19 = 0;
LABEL_45:
    v28 = 8;
LABEL_46:
    *(_QWORD *)(a1 + v28) = v19;
  }
  return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_100065600(uint64_t a1, uint64_t a2)
{
  char v4;
  unsigned int v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  BOOL v9;
  int v10;
  char v12;
  unsigned int v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t Data;
  uint64_t v18;
  void *v19;
  uint64_t result;

  while (*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
      break;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    while (1)
    {
      v7 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
        break;
      v8 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0)
        goto LABEL_11;
      v4 += 7;
      v9 = v5++ >= 9;
      if (v9)
      {
        v6 = 0;
        v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
      v6 = 0;
LABEL_13:
    if (v10 || (v6 & 7) == 4)
      break;
    if ((v6 >> 3) == 2)
    {
      Data = PBReaderReadData(a2);
      v18 = objc_claimAutoreleasedReturnValue(Data);
      v19 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v18;

    }
    else if ((v6 >> 3) == 1)
    {
      v12 = 0;
      v13 = 0;
      v14 = 0;
      *(_BYTE *)(a1 + 20) |= 1u;
      while (1)
      {
        v15 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v15 == -1 || v15 >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
          break;
        v16 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
        *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
        v14 |= (unint64_t)(v16 & 0x7F) << v12;
        if ((v16 & 0x80) == 0)
          goto LABEL_30;
        v12 += 7;
        v9 = v13++ >= 9;
        if (v9)
        {
          LODWORD(v14) = 0;
          goto LABEL_32;
        }
      }
      *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_30:
      if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
        LODWORD(v14) = 0;
LABEL_32:
      *(_DWORD *)(a1 + 16) = v14;
    }
    else
    {
      result = PBReaderSkipValueWithTag(a2);
      if (!(_DWORD)result)
        return result;
    }
  }
  return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

id sub_100065838()
{
  void *v0;
  id v1;
  void *v2;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[SZExtractor knownSZExtractorImplementations](SZExtractor, "knownSZExtractorImplementations"));
  v1 = objc_msgSend(v0, "setByAddingObject:", objc_opt_class(STRemoteExtractor));
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);

  return v2;
}

void sub_10006588C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

char *sub_10006589C(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  char *v7;
  _BYTE v9[32];
  _QWORD v10[2];
  void (*v11)(uint64_t);
  void *v12;
  char *v13;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3)
  {
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByDeletingLastPathComponent")));
    v7 = realpath_DARWIN_EXTSN((const char *)objc_msgSend(v6, "fileSystemRepresentation"), 0);

    if (v7)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v11 = sub_1000659C4;
      v12 = &unk_1000B2198;
      v13 = v7;
      objc_msgSend(v3, "auditToken");
      v7 = (char *)(sandbox_check_by_audit_token(v9, "file-write-create", SANDBOX_CHECK_POSIX_WRITEABLE | 1u) == 0);
      v11((uint64_t)v10);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void sub_100065990(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1000659C4(uint64_t a1)
{
  free(*(void **)(a1 + 32));
}

intptr_t sub_1000659CC(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000659D4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;

  v5 = a3;
  v6 = (id)qword_1000C7158;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_loggableDescription"));
    v8 = 138544130;
    v9 = v7;
    v10 = 2048;
    v11 = a2;
    v12 = 2112;
    v13 = v5;
    v14 = 2048;
    v15 = objc_msgSend(v5, "code");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Extractor prepare - Offset: %lld, error: %@ [%ld]", (uint8_t *)&v8, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 32), "set_extractorPreparedForExtraction:", 1);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void sub_100065AE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100065BA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_100065C68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1000660D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100066200(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "errorOccurredDuringFinishedCallbackDelivery:", v3);

}

void sub_10006624C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

id sub_100066264(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;

  v2 = (id)qword_1000C7158;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "descriptionForTaskWithIdentifier:", *(_QWORD *)(a1 + 56)));
    v5 = 138543362;
    v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ client acknowledged file download", (uint8_t *)&v5, 0xCu);

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "removeObject:", *(_QWORD *)(a1 + 48));
}

void sub_100066334(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10006634C(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "hasBeenCalled") & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
    objc_msgSend(WeakRetained, "errorOccurredDuringAuthCallbackDelivery:completionHandler:", v4, *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "removeObject:", *(_QWORD *)(a1 + 32));
  }

}

void sub_1000663B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1000663D4(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  int v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v16 = 0;
    v9 = +[SecKeyProxy createIdentityFromEndpoint:error:](SecKeyProxy, "createIdentityFromEndpoint:error:", v8, &v16);
    v10 = v16;
    if (v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "certificates"));
      v12 = objc_claimAutoreleasedReturnValue(+[NSURLCredential credentialWithIdentity:certificates:persistence:](NSURLCredential, "credentialWithIdentity:certificates:persistence:", v9, v11, objc_msgSend(v7, "persistence")));

      v7 = (id)v12;
      CFRelease(v9);
    }
    else
    {
      v13 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to establish client cert proxy: %@", buf, 0xCu);
      }
    }

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "hasBeenCalled") & 1) == 0)
  {
    v14 = (id)qword_1000C7158;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "descriptionForTaskWithIdentifier:", *(_QWORD *)(a1 + 64)));
      *(_DWORD *)buf = 138544130;
      v18 = v15;
      v19 = 1024;
      v20 = a2;
      v21 = 2112;
      v22 = v7;
      v23 = 2112;
      v24 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ client responded to task challenge with disp %d, cred %@, trustProxy %@", buf, 0x26u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "setHasBeenCalled:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "removeObject:", *(_QWORD *)(a1 + 32));
  }

}

void sub_100066600(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id sub_100066640(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObject:", *(_QWORD *)(a1 + 40));
}

id sub_10006664C(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObject:", *(_QWORD *)(a1 + 40));
}

id sub_100066658(uint64_t a1)
{
  id result;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  result = objc_msgSend(*(id *)(a1 + 32), "hasBeenCalled");
  if ((result & 1) == 0)
  {
    v3 = (id)qword_1000C7158;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "descriptionForTaskWithIdentifier:", *(_QWORD *)(a1 + 72)));
      v5 = 138543362;
      v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to ask client for modified request, using original proposed request", (uint8_t *)&v5, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "setHasBeenCalled:", 1);
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 8), "removeObject:", *(_QWORD *)(a1 + 32));
  }
  return result;
}

void sub_10006675C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100066774(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "hasBeenCalled") & 1) == 0)
  {
    v7 = (id)qword_1000C7158;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "descriptionForTaskWithIdentifier:", *(_QWORD *)(a1 + 64)));
      v9 = 138543874;
      v10 = v8;
      v11 = 2112;
      v12 = v5;
      v13 = 2112;
      v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ client responded to will send request callback with request %@ handle %@", (uint8_t *)&v9, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "setHasBeenCalled:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "removeObject:", *(_QWORD *)(a1 + 32));
  }

}

void sub_1000668AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1000668D4(uint64_t a1)
{
  id WeakRetained;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasBeenCalled") & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
    objc_msgSend(WeakRetained, "wakeUpClient:", 1);

  }
}

void sub_100066930(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100066944(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "hasBeenCalled") & 1) == 0)
  {
    v4 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Client responded to open file callback with handle %@", (uint8_t *)&v5, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "setHasBeenCalled:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "removeObject:", *(_QWORD *)(a1 + 32));
  }

}

void sub_100066A28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100066A40(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;

  v3 = a2;
  v4 = (id)qword_1000C7158;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "descriptionForTaskWithIdentifier:", *(_QWORD *)(a1 + 56)));
    v6 = 138543362;
    v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to deliver resolved MediaSelection", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "removeObject:", *(_QWORD *)(a1 + 48));

}

void sub_100066B1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id sub_100066B40(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObject:", *(_QWORD *)(a1 + 40));
}

void sub_100066B4C(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;

  v3 = a2;
  v4 = (id)qword_1000C7158;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "descriptionForTaskWithIdentifier:", *(_QWORD *)(a1 + 56)));
    v6 = 138543362;
    v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to deliver downloaded HLS variants", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "removeObject:", *(_QWORD *)(a1 + 48));

}

void sub_100066C28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id sub_100066C4C(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObject:", *(_QWORD *)(a1 + 40));
}

id sub_100066C58(uint64_t a1)
{
  id result;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  result = objc_msgSend(*(id *)(a1 + 32), "hasBeenCalled");
  if ((result & 1) == 0)
  {
    v3 = (id)qword_1000C7158;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "descriptionForTaskWithIdentifier:", *(_QWORD *)(a1 + 64)));
      v5 = 138543362;
      v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to ask client for delayed request disposition, continuing load", (uint8_t *)&v5, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "setHasBeenCalled:", 1);
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "removeObject:", *(_QWORD *)(a1 + 32));
  }
  return result;
}

void sub_100066D5C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100066D74(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  int v11;

  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "hasBeenCalled") & 1) == 0)
  {
    v6 = (id)qword_1000C7158;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "descriptionForTaskWithIdentifier:", *(_QWORD *)(a1 + 64)));
      v8 = 138543618;
      v9 = v7;
      v10 = 1024;
      v11 = a2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ client responded to delayed request callback with disposition %d", (uint8_t *)&v8, 0x12u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "setHasBeenCalled:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "removeObject:", *(_QWORD *)(a1 + 32));
  }

}

void sub_100066E98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100066EBC(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "hasBeenCalled") & 1) == 0)
  {
    v4 = (id)qword_1000C7158;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "descriptionForTaskWithIdentifier:", *(_QWORD *)(a1 + 64)));
      v6 = 138543618;
      v7 = v5;
      v8 = 2112;
      v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to ask client for getAuthHeadersForResponse. Error=%@", (uint8_t *)&v6, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "setHasBeenCalled:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "removeObject:", *(_QWORD *)(a1 + 32));
  }

}

void sub_100066FD8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100066FFC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  const __CFString *v11;
  int v12;
  void *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(*(id *)(a1 + 32), "hasBeenCalled") & 1) == 0)
  {
    v9 = (id)qword_1000C7158;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "descriptionForTaskWithIdentifier:", *(_QWORD *)(a1 + 64)));
      v11 = CFSTR("NO");
      v12 = 138544130;
      v13 = v10;
      if ((_DWORD)a2)
        v11 = CFSTR("YES");
      v14 = 2112;
      v15 = v11;
      v16 = 2112;
      v17 = v7;
      v18 = 2112;
      v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ client responded to getAuthHeadersForResponse callback with continueLoad=%@, authHeaders=%@, newRequest=%@", (uint8_t *)&v12, 0x2Au);

    }
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), a2);
    objc_msgSend(*(id *)(a1 + 32), "setHasBeenCalled:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "removeObject:", *(_QWORD *)(a1 + 32));
  }

}

void sub_10006715C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1000679E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100067B14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100067C34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_100067D0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_100068454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1000686A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_100068758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100068B44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100068C08(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100068F20(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100069204(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000693A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100069D68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, void *a18, void *a19, void *a20,void *a21,void *a22,uint64_t a23,void *a24,void *a25,void *a26)
{
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  _Unwind_Resume(a1);
}

void sub_10006A400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18)
{
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_10006A634(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10006A6CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_10006A788(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10006A8EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10006AFA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_10006B358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_10006B594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16, void *a17)
{
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_10006B998(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_10006BC78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_10006BEE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_10006BFE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_10006C0E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10006C304(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_10006C4FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10006CAD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_10006CCE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_10006CE04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10006CEE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_10006CF5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_10006D0D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10006D3B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_10006D4D4(uint64_t a1)
{
  void *v2;
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  __CFString *v13;
  id v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  __CFString *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t *v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  __CFString *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  void *v60;
  id v61;
  NSObject *v62;
  __CFString *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  __CFString *v72;
  void *v73;
  id v74;
  uint64_t v75;
  _QWORD *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  _QWORD *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  _QWORD v88[4];
  id v89;
  _QWORD v90[4];
  id v91;
  uint64_t v92;
  uint64_t v93;
  objc_super v94;
  _QWORD v95[6];
  _QWORD v96[4];
  id v97;
  uint64_t v98;
  id v99;
  uint64_t v100;
  objc_super v101;
  uint8_t buf[4];
  __CFString *v103;
  __int16 v104;
  __CFString *v105;
  __int16 v106;
  int v107;
  __int16 v108;
  uint64_t v109;
  __int16 v110;
  void *v111;
  __int16 v112;
  void *v113;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_URLToUse"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "scheme"));

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_URLToUse"));
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "host"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_URLToUse"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "port"));

  v86 = v6;
  if (v6)
  {
    v7 = objc_msgSend(v6, "unsignedIntegerValue");
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_URLToUse"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "scheme"));
    v7 = sub_10006E39C(v9);

  }
  v10 = v87;
  if (objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("http")))
  {
    v11 = objc_msgSend(v10, "caseInsensitiveCompare:", CFSTR("https"));

    if (v11)
    {

      v4 = CFSTR("configuration.apple.com");
      v7 = sub_10006E39C(CFSTR("http"));
    }
  }
  else
  {

  }
  v12 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v103 = v4;
    v104 = 1024;
    LODWORD(v105) = (unsigned __int16)v7;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Creating tcp_connection to host: %@, port: %d", buf, 0x12u);
  }
  v13 = objc_retainAutorelease(v4);
  v14 = -[__CFString UTF8String](v13, "UTF8String");
  if (v14 && (v15 = tcp_connection_create(v14, bswap32(v7) >> 16, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 200))) != 0)
  {
    v16 = (__CFString *)v15;
    tcp_connection_allow_client_socket_access(v15, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_URLToUse"));
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "absoluteString")));
    tcp_connection_set_url(v16, objc_msgSend(v18, "UTF8String"));

    v19 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v103 = v16;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Created tcp_connection: %@", buf, 0xCu);
    }
    v101.receiver = *(id *)(a1 + 40);
    v101.super_class = (Class)NDAVBackgroundSession;
    v20 = objc_msgSendSuper2(&v101, "monitoredAppBundleID");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v20));
    tcp_connection_set_source_application_by_bundle(v16, objc_msgSend(v21, "UTF8String"));

    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 360), "allowsCellularAccess") & 1) == 0)
      tcp_connection_set_no_cellular(v16, 1);
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 360), "allowsExpensiveNetworkAccess") & 1) == 0)
      tcp_connection_set_no_expensive(v16, 1);
    objc_msgSend(*(id *)(a1 + 48), "startLoadingMetadata");
    v96[0] = _NSConcreteStackBlock;
    v96[1] = 3221225472;
    v96[2] = sub_10006E44C;
    v96[3] = &unk_1000B2468;
    v22 = *(id *)(a1 + 32);
    v23 = *(_QWORD *)(a1 + 40);
    v97 = v22;
    v98 = v23;
    v24 = *(id *)(a1 + 56);
    v25 = *(_QWORD *)(a1 + 64);
    v99 = v24;
    v100 = v25;
    v83 = objc_retainBlock(v96);
    v26 = *(id **)(a1 + 40);
    objc_msgSend(v26[45], "timeoutIntervalForResource");
    objc_msgSend(v26, "defaultWindowDurationForResourceTimeout:");
    v28 = v27;
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v30 = v29;
    objc_msgSend(*(id *)(a1 + 32), "creationTime");
    v32 = v31;
    v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", v28 - (v30 - v32)));
    v33 = getpid();
    v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("nsurl-AV-%d-%lld"), v33, ++qword_1000C7160));
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue(+[_DASActivity activityWithName:priority:duration:startingAfter:startingBefore:](_DASActivity, "activityWithName:priority:duration:startingAfter:startingBefore:"));
    -[__CFString setHandlerQueue:](v34, "setHandlerQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 200));
    v95[0] = _NSConcreteStackBlock;
    v95[1] = 3221225472;
    v95[2] = sub_10006E650;
    v95[3] = &unk_1000B2490;
    v35 = *(_QWORD *)(a1 + 64);
    v95[4] = *(_QWORD *)(a1 + 40);
    v95[5] = v35;
    -[__CFString setSuspendHandler:](v34, "setSuspendHandler:", v95);
    -[__CFString setRequiresNetwork:](v34, "setRequiresNetwork:", 1);
    -[__CFString setRequiresPlugin:](v34, "setRequiresPlugin:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 360), "_requiresPowerPluggedIn"));
    v36 = _DASActivityTransferSizeSmall;
    v37 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
    v38 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64)));
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", v38));

    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "_DuetActivityProperties"));
    LOBYTE(v38) = v39 == 0;

    if ((v38 & 1) == 0)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "_DuetActivityProperties"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", kConditionalConnectionRequirementDownloadBytes));

      if (v41)
      {
        v42 = objc_msgSend(v41, "unsignedLongLongValue");
        if ((unint64_t)v42 <= 0x40000000)
        {
          if ((unint64_t)v42 <= 0x1F400000)
          {
            if ((unint64_t)v42 <= 0x6400000)
            {
              if ((unint64_t)v42 <= 0xA00000)
              {
                v43 = (uint64_t *)&_DASActivityTransferSizeVerySmall;
                if ((unint64_t)v42 > 0x19000)
                  v43 = (uint64_t *)&_DASActivityTransferSizeSmall;
              }
              else
              {
                v43 = (uint64_t *)&_DASActivityTransferSizeModerate;
              }
            }
            else
            {
              v43 = (uint64_t *)&_DASActivityTransferSizeLarge;
            }
          }
          else
          {
            v43 = (uint64_t *)&_DASActivityTransferSizeVeryLarge;
          }
        }
        else
        {
          v43 = (uint64_t *)&_DASActivityTransferSizeGigantic;
        }
        v36 = *v43;
      }
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "_DuetActivityProperties"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectForKeyedSubscript:", kConditionalConnectionRequirementDuetPreClearedMode));

      if (v53)
        -[__CFString setPreClearedMode:](v34, "setPreClearedMode:", (int)objc_msgSend(v53, "intValue"));

    }
    -[__CFString setDownloadSize:](v34, "setDownloadSize:", v36);
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 360), "allowsCellularAccess")
      || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 360), "allowsExpensiveNetworkAccess") & 1) == 0)
    {
      -[__CFString setRequiresInexpensiveNetworking:](v34, "setRequiresInexpensiveNetworking:", 1);
    }
    if (objc_msgSend(*(id *)(a1 + 32), "isDiscretionary"))
    {
      if ((uint64_t)objc_msgSend(*(id *)(a1 + 40), "adjustedTCPConnectionPriorityForTaskPriority:", objc_msgSend(*(id *)(a1 + 32), "basePriority")) >= 250)
      {
        if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 142))
          v54 = (uint64_t *)&_DASSchedulingPriorityMaintenance;
        else
          v54 = (uint64_t *)&_DASSchedulingPriorityBackground;
      }
      else
      {
        v54 = (uint64_t *)&_DASSchedulingPriorityUserInitiatedOvercommit;
      }
    }
    else
    {
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "dateByAddingTimeInterval:", 10.0));
      -[__CFString setStartBefore:](v34, "setStartBefore:", v55);

      v56 = (uint64_t)objc_msgSend(*(id *)(a1 + 40), "adjustedTCPConnectionPriorityForTaskPriority:", objc_msgSend(*(id *)(a1 + 32), "basePriority"));
      v54 = (uint64_t *)&_DASSchedulingPriorityUserInitiated;
      if (v56 < 250)
        v54 = (uint64_t *)&_DASSchedulingPriorityUserInitiatedOvercommit;
    }
    v57 = *v54;
    if (objc_msgSend(*(id *)(a1 + 32), "isDiscretionary")
      && objc_msgSend(*(id *)(a1 + 32), "startedUserInitiated"))
    {
      v58 = *(id *)(*(_QWORD *)(a1 + 40) + 32);
      v59 = *(_QWORD *)(a1 + 40);
      if (*(_BYTE *)(v59 + 146))
      {
        v60 = *(void **)(v59 + 216);
        if (v60)
        {
          v61 = v60;

          v58 = v61;
        }
      }
      if (objc_msgSend(v58, "isInTransitionalDiscretionaryPeriod"))
      {
        v62 = (id)qword_1000C7158;
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          v63 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_loggableDescription"));
          *(_DWORD *)buf = 138543618;
          v103 = v63;
          v104 = 2112;
          v105 = v34;
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "%{public}@ client is in transistional discretionary period - updating activity _DASActivity %@", buf, 0x16u);

        }
        -[__CFString setDeferred:](v34, "setDeferred:", 1);
      }

    }
    -[__CFString setSchedulingPriority:](v34, "setSchedulingPriority:", v57);
    v94.receiver = *(id *)(a1 + 40);
    v94.super_class = (Class)NDAVBackgroundSession;
    v64 = objc_msgSendSuper2(&v94, "monitoredAppBundleID");
    v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
    -[__CFString setBundleId:](v34, "setBundleId:", v65);

    v66 = (void *)tcp_connection_copy_endpoint(v16);
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[NWEndpoint endpointWithCEndpoint:](NWEndpoint, "endpointWithCEndpoint:", v66));
    v68 = (void *)tcp_connection_copy_parameters(v16);
    v69 = (void *)objc_claimAutoreleasedReturnValue(+[NWParameters parametersWithCParameters:](NWParameters, "parametersWithCParameters:", v68));
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v67, kNWEndpointKey, v69, kNWParametersKey, 0));
    -[__CFString setUserInfo:](v34, "setUserInfo:", v70);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 344), "setObject:forKeyedSubscript:", v34, *(_QWORD *)(a1 + 56));
    v71 = (id)qword_1000C7158;
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      v72 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_loggableDescription"));
      *(_DWORD *)buf = 138543618;
      v103 = v72;
      v104 = 2112;
      v105 = v34;
      _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "%{public}@ submitting _DASActivity %@", buf, 0x16u);

    }
    v73 = (void *)objc_claimAutoreleasedReturnValue(+[_DASScheduler sharedScheduler](_DASScheduler, "sharedScheduler"));
    objc_msgSend(v73, "submitActivity:inGroupWithName:", v34, CFSTR("NSURLSessionBackgroundPoolName"));

    tcp_connection_set_indefinite(v16, 1);
    v90[0] = _NSConcreteStackBlock;
    v90[1] = 3221225472;
    v90[2] = sub_10006E65C;
    v90[3] = &unk_1000B24B8;
    v74 = *(id *)(a1 + 32);
    v75 = *(_QWORD *)(a1 + 40);
    v91 = v74;
    v92 = v75;
    v93 = *(_QWORD *)(a1 + 64);
    tcp_connection_set_event_handler(v16, v90);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 336), "setObject:forKeyedSubscript:", v16, *(_QWORD *)(a1 + 56));
    v88[0] = _NSConcreteStackBlock;
    v88[1] = 3221225472;
    v88[2] = sub_10006E760;
    v88[3] = &unk_1000B24E0;
    v76 = v83;
    v89 = v76;
    -[__CFString setStartHandler:](v34, "setStartHandler:", v88);
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "clientBundleID"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "identifier"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "monitoredAppBundleID"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "secondaryID"));
    sub_100019980(0, v77, v78, v79, v80, *(void **)(a1 + 32), 0, 0, 0, objc_msgSend(*(id *)(a1 + 32), "isDiscretionary"), 0, 0, 0, 0);

  }
  else
  {
    v44 = (id)qword_1000C7158;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v48 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_loggableDescription"));
      v49 = *(void **)(a1 + 32);
      v50 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 200);
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "_URLToUse"));
      *(_DWORD *)buf = 138544642;
      v103 = v48;
      v104 = 2112;
      v105 = v13;
      v106 = 1024;
      v107 = (unsigned __int16)v7;
      v108 = 2112;
      v109 = v50;
      v110 = 2112;
      v111 = v49;
      v112 = 2112;
      v113 = v51;
      _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%{public}@ tcp_connection_create() returned NULL (host %@, port %d, queue %@, taskInfo %@, URL %@)", buf, 0x3Au);

    }
    v45 = *(void **)(a1 + 40);
    v46 = *(_QWORD *)(a1 + 64);
    v47 = objc_claimAutoreleasedReturnValue(+[NSURLError errorWithDomain:code:userInfo:](NSURLError, "errorWithDomain:code:userInfo:", NSURLErrorDomain, -1, 0));
    objc_msgSend(v45, "taskWithIdentifier:didCompleteWithError:", v46, v47);
    v16 = (__CFString *)v47;
  }

}

void sub_10006E108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, uint64_t a16, void *a17, void *a18, void *a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,void *a45,uint64_t a46,void *a47)
{
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;

  _Unwind_Resume(a1);
}

uint64_t sub_10006E39C(void *a1)
{
  id v1;
  void *v2;
  unsigned __int8 v3;
  uint64_t v4;
  void *v5;
  unsigned int v6;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "lowercaseString"));
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("http"));

  if ((v3 & 1) != 0)
  {
    v4 = 80;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "lowercaseString"));
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("https"));

    if (v6)
      v4 = 443;
    else
      v4 = 0;
  }

  return v4;
}

void sub_10006E428(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_10006E44C(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  dispatch_time_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  void *v17;

  objc_msgSend(*(id *)(a1 + 32), "setEstablishedConnection:", 0);
  v2 = (id)qword_1000C7158;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_loggableDescription"));
    *(_DWORD *)buf = 138543362;
    v17 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ got DASActivity startHandler for tcp_connection", buf, 0xCu);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 336), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48)));
  if (v4)
  {
    v5 = (id)qword_1000C7158;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_loggableDescription"));
      *(_DWORD *)buf = 138543362;
      v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ starting tcp_connection", buf, 0xCu);

    }
    tcp_connection_start(v4);
    v7 = dispatch_time(0, 10000000000);
    v8 = *(void **)(a1 + 32);
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 200);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006E76C;
    block[3] = &unk_1000B2418;
    v10 = v8;
    v11 = *(_QWORD *)(a1 + 40);
    v13 = v10;
    v14 = v11;
    v15 = *(_QWORD *)(a1 + 56);
    dispatch_after(v7, v9, block);

  }
}

void sub_10006E620(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id sub_10006E650(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "stopAVAssetDownloadSessionWithTaskIdentifier:", *(_QWORD *)(a1 + 40));
}

void sub_10006E65C(uint64_t a1, int a2)
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  int v9;

  v4 = (id)qword_1000C7158;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_loggableDescription"));
    v6 = 138543618;
    v7 = v5;
    v8 = 1024;
    v9 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ received tcp_connection event %d", (uint8_t *)&v6, 0x12u);

  }
  if (a2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "setEstablishedConnection:", 1);
    objc_msgSend(*(id *)(a1 + 40), "startAVAssetDownloadSessionWithTaskIdentifier:", *(_QWORD *)(a1 + 48));
  }
}

void sub_10006E748(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_10006E760(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10006E76C(uint64_t a1)
{
  id v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "establishedConnection") & 1) == 0)
  {
    v2 = (id)objc_claimAutoreleasedReturnValue(+[NSURLError errorWithDomain:code:userInfo:](NSURLError, "errorWithDomain:code:userInfo:", NSURLErrorDomain, -1001, 0));
    objc_msgSend(*(id *)(a1 + 40), "cancelTCPConnectionForTask:withError:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "retryTask:originalError:", *(_QWORD *)(a1 + 32), v2);

  }
}

void sub_10006E7F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id sub_10006E804(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)NDAVBackgroundSession;
  return objc_msgSendSuper2(&v3, "requeueTask:", v1);
}

void sub_10006E83C(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  _QWORD block[5];
  id v6;
  uint64_t v7;

  block[0] = _NSConcreteStackBlock;
  block[2] = sub_10006E8B8;
  block[3] = &unk_1000B2418;
  v1 = a1[4];
  v2 = (void *)a1[5];
  v3 = *(NSObject **)(v1 + 200);
  block[1] = 3221225472;
  v4 = a1[6];
  block[4] = v1;
  v7 = v4;
  v6 = v2;
  dispatch_async(v3, block);

}

id sub_10006E8B8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "taskWithIdentifier:didCompleteWithError:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void sub_10006E8C8(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "clientBundleID"));
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  if (v4)
  {
    v5 = (id)qword_1000C7158;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "clientBundleID"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "identifier"));
      *(_DWORD *)buf = 138412546;
      v24 = v6;
      v25 = 2112;
      v26 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Client exited transitional discretionary period.  Re-evaluating task priorities for session <%@>.<%@>", buf, 0x16u);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 224), "allKeys"));
    v9 = objc_msgSend(v8, "copy");

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 224), "objectForKeyedSubscript:", v14, (_QWORD)v18));
          if (objc_msgSend(v15, "isDiscretionary")
            && objc_msgSend(v15, "startedUserInitiated")
            && (objc_msgSend(v15, "establishedConnection") & 1) == 0)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_URLToUse"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLError _web_errorWithDomain:code:URL:](NSURLError, "_web_errorWithDomain:code:URL:", CFSTR("_nsurlsessiondErrorDomain"), 9, v16));

            objc_msgSend(*(id *)(a1 + 40), "cancelAVDownloadAndFailTaskWithIdentifier:withError:", objc_msgSend(v14, "unsignedIntegerValue"), v17);
          }

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

  }
}

void sub_10006EB44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10006EBC0(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "clientBundleID"));
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v5 + 232);
    *(_QWORD *)(v5 + 232) = 0;

    v7 = (id)qword_1000C7158;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "clientBundleID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "identifier"));
      *(_DWORD *)buf = 138412546;
      v26 = v8;
      v27 = 2112;
      v28 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Cancelling AVAssetDownloads for session <%@>.<%@> since client was quit from app switcher", buf, 0x16u);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 224), "allKeys"));
    v11 = objc_msgSend(v10, "copy");

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    obj = v11;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 224), "objectForKeyedSubscript:", v15));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_URLToUse"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLError _web_errorWithDomain:code:URL:](NSURLError, "_web_errorWithDomain:code:URL:", CFSTR("_nsurlsessiondErrorDomain"), 1, v17));

          objc_msgSend(*(id *)(a1 + 40), "cancelAVDownloadAndFailTaskWithIdentifier:withError:", objc_msgSend(v15, "unsignedIntegerValue"), v18);
        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v12);
    }

  }
}

void sub_10006EE30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10006EEB0(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  BOOL v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 336), "count"))
  {
    v2 = (id)qword_1000C7158;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier"));
      *(_DWORD *)buf = 138412290;
      v27 = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Lowering priority of AVAssetDownloads for %@ since it is no longer in the foreground", buf, 0xCu);

    }
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 336);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "objectForKeyedSubscript:", v9));
        v11 = v10 == 0;

        if (v11)
          objc_msgSend(*(id *)(a1 + 32), "updatePriorityForTaskID:", v9);
        else
          objc_msgSend(v4, "addObject:", v9);
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v6);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(a1 + 32), "updatePriorityForTaskID:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)j), (_QWORD)v16);
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

void sub_10006F118(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10006F154(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  PendingCallback *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  PendingCallback *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  NSObject *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  PendingCallback *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  _QWORD v39[3];
  _QWORD v40[3];
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_destinationURLToUse"));
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLByDeletingLastPathComponent"));
    v38 = 0;
    v10 = objc_msgSend(v9, "checkResourceIsReachableAndReturnError:", &v38);
    v11 = v38;

    if ((v10 & 1) == 0)
    {
      v12 = (id)qword_1000C7158;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_loggableDescription"));
        *(_DWORD *)buf = 138543874;
        v42 = v13;
        v43 = 2112;
        v44 = v8;
        v45 = 2112;
        v46 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ not restoring task due to unreachable destination folder %@ (%@)", buf, 0x20u);

      }
      objc_msgSend(v6, "setState:", 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLError _web_errorWithDomain:code:failingURL:](NSURLError, "_web_errorWithDomain:code:failingURL:", NSURLErrorDomain, -3000, 0));
      objc_msgSend(v6, "setError:", v14);

      v15 = [PendingCallback alloc];
      v16 = objc_msgSend(v6, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "error"));
      v40[0] = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      v40[1] = v18;
      v40[2] = &__NSDictionary0__struct;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 3));
      v20 = -[PendingCallback initWithCallbackType:taskIdentifier:args:](v15, "initWithCallbackType:taskIdentifier:args:", 0, v16, v19);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "addPendingCallback:wakeRequirement:", v20, 0);
    }

  }
  if (objc_msgSend(v6, "initializedWithAVAsset") && (uint64_t)objc_msgSend(v6, "state") <= 2)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "AVAssetURL"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assetOptionsPlist"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[AVURLAsset assetForNSURLSessionWithURL:propertyList:](AVURLAsset, "assetForNSURLSessionWithURL:propertyList:", v21, v22));

    objc_msgSend(v6, "setAVURLAsset:", v23);
    objc_msgSend(v6, "setAVAssetDownloadToken:", objc_msgSend(v23, "downloadToken"));
    if (!v23
      || (v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "URL")),
          v25 = v24 == 0,
          v24,
          v25))
    {
      v29 = (id)qword_1000C7158;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_loggableDescription"));
        v37 = objc_msgSend(v6, "AVAssetDownloadToken");
        *(_DWORD *)buf = 138543618;
        v42 = v36;
        v43 = 2048;
        v44 = v37;
        _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%{public}@ failed to re-instantiate AVURLAsset with token %llu", buf, 0x16u);

      }
      objc_msgSend(v6, "setState:", 3);
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLError _web_errorWithDomain:code:failingURL:](NSURLError, "_web_errorWithDomain:code:failingURL:", NSURLErrorDomain, -1, 0));
      objc_msgSend(v6, "setError:", v30);

      v31 = [PendingCallback alloc];
      v32 = objc_msgSend(v6, "identifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "error"));
      v39[0] = v33;
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      v39[1] = v34;
      v39[2] = &__NSDictionary0__struct;
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v39, 3));
      v26 = -[PendingCallback initWithCallbackType:taskIdentifier:args:](v31, "initWithCallbackType:taskIdentifier:args:", 0, v32, v35);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "addPendingCallback:wakeRequirement:", v26, 0);
    }
    else
    {
      v26 = (id)qword_1000C7158;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_loggableDescription"));
        v28 = objc_msgSend(v6, "AVAssetDownloadToken");
        *(_DWORD *)buf = 138543618;
        v42 = v27;
        v43 = 2048;
        v44 = v28;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ restored asset with token %llu from archivedInfo", buf, 0x16u);

      }
    }

  }
  if ((uint64_t)objc_msgSend(v6, "state") <= 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "addOutstandingTaskWithIdentifier:", objc_msgSend(v5, "unsignedIntegerValue"));
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "setObject:forKeyedSubscript:", v6, v5);

}

void sub_10006F670(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

id sub_10006F794(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;

  v2 = (id)qword_1000C7158;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "clientBundleID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
    v9 = 138412546;
    v10 = v3;
    v11 = 2112;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Delayed wake timer fired for session <%@>.<%@>", (uint8_t *)&v9, 0x16u);

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "count")
    && (objc_msgSend(*(id *)(a1 + 32), "clientIsActive") & 1) == 0)
  {
    v5 = (id)qword_1000C7158;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "clientBundleID"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
      v9 = 138412546;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Triggering delayed wake for session <%@>.<%@>", (uint8_t *)&v9, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "wakeUpClient:", 1);
  }
  return objc_msgSend(*(id *)(a1 + 32), "cancelDelayedCompletionWakeTimer");
}

void sub_10006F930(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10006FA54(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10006FDA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

id objc_msgSend_AVAssetDownloadToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "AVAssetDownloadToken");
}

id objc_msgSend_AVAssetURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "AVAssetURL");
}

id objc_msgSend_AVURLAsset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "AVURLAsset");
}

id objc_msgSend_EDUMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "EDUMode");
}

id objc_msgSend_HTTPAdditionalHeaders(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "HTTPAdditionalHeaders");
}

id objc_msgSend_HTTPBodyStream(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "HTTPBodyStream");
}

id objc_msgSend_HTTPMaximumConnectionsPerHost(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "HTTPMaximumConnectionsPerHost");
}

id objc_msgSend_IDSMessageTimeout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "IDSMessageTimeout");
}

id objc_msgSend_NDAVAssetDownloadSessionWrapper_didCompleteWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "NDAVAssetDownloadSessionWrapper:didCompleteWithError:");
}

id objc_msgSend_NDAVAssetDownloadSessionWrapper_didFinishDownloadForMediaSelectionPropertyList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "NDAVAssetDownloadSessionWrapper:didFinishDownloadForMediaSelectionPropertyList:");
}

id objc_msgSend_NDAVAssetDownloadSessionWrapper_didLoadTimeRange_totalTimeRangesLoaded_timeRangeExpectedToLoad_forMediaSelectionPropertyList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "NDAVAssetDownloadSessionWrapper:didLoadTimeRange:totalTimeRangesLoaded:timeRangeExpectedToLoad:forMediaSelectionPropertyList:");
}

id objc_msgSend_NDAVAssetDownloadSessionWrapper_didResolveMediaSelectionPropertyList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "NDAVAssetDownloadSessionWrapper:didResolveMediaSelectionPropertyList:");
}

id objc_msgSend_NDAVAssetDownloadSessionWrapper_didUpdateProgressWithLastBytesWritten_totalBytesWritten_totalBytesExpectedToWrite_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "NDAVAssetDownloadSessionWrapper:didUpdateProgressWithLastBytesWritten:totalBytesWritten:totalBytesExpectedToWrite:");
}

id objc_msgSend_NDAVAssetDownloadSessionWrapper_willDownloadVariants_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "NDAVAssetDownloadSessionWrapper:willDownloadVariants:");
}

id objc_msgSend_TLSMaximumSupportedProtocol(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "TLSMaximumSupportedProtocol");
}

id objc_msgSend_TLSMinimumSupportedProtocol(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "TLSMinimumSupportedProtocol");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URL");
}

id objc_msgSend_URLAssetWithURL_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLAssetWithURL:options:");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_URLByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathExtension:");
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByDeletingLastPathComponent");
}

id objc_msgSend_URLForDirectory_inDomain_appropriateForURL_create_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForDirectory:inDomain:appropriateForURL:create:error:");
}

id objc_msgSend_URLPathAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLPathAllowedCharacterSet");
}

id objc_msgSend_URLSessionDidCompleteForExtensionWithBundleIdentifier_info_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLSessionDidCompleteForExtensionWithBundleIdentifier:info:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__AVAssetDownloadSessionOptions_config_asset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_AVAssetDownloadSessionOptions:config:asset:");
}

id objc_msgSend__DuetActivityProperties(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_DuetActivityProperties");
}

id objc_msgSend__IDSMessageTimeout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_IDSMessageTimeout");
}

id objc_msgSend__TCPAdaptiveReadTimeout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_TCPAdaptiveReadTimeout");
}

id objc_msgSend__TCPAdaptiveWriteTimeout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_TCPAdaptiveWriteTimeout");
}

id objc_msgSend__TLSMaximumSupportedProtocolVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_TLSMaximumSupportedProtocolVersion");
}

id objc_msgSend__TLSMinimumSupportedProtocolVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_TLSMinimumSupportedProtocolVersion");
}

id objc_msgSend__URLToUse(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_URLToUse");
}

id objc_msgSend__actualAdditionalProperties(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_actualAdditionalProperties");
}

id objc_msgSend__actualAuthHeaders(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_actualAuthHeaders");
}

id objc_msgSend__actualConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_actualConfiguration");
}

id objc_msgSend__actualCredential(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_actualCredential");
}

id objc_msgSend__actualRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_actualRequest");
}

id objc_msgSend__allProtocolProperties(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_allProtocolProperties");
}

id objc_msgSend__allowsHSTSWithUntrustedRootCertificate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_allowsHSTSWithUntrustedRootCertificate");
}

id objc_msgSend__allowsPowerNapScheduling(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_allowsPowerNapScheduling");
}

id objc_msgSend__allowsRetryForBackgroundDataTasks(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_allowsRetryForBackgroundDataTasks");
}

id objc_msgSend__allowsTLSECH(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_allowsTLSECH");
}

id objc_msgSend__allowsTLSFallback(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_allowsTLSFallback");
}

id objc_msgSend__allowsTLSFalseStart(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_allowsTLSFalseStart");
}

id objc_msgSend__allowsUCA(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_allowsUCA");
}

id objc_msgSend__allowsVirtualInterfaces(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_allowsVirtualInterfaces");
}

id objc_msgSend__alwaysPerformDefaultTrustEvaluation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_alwaysPerformDefaultTrustEvaluation");
}

id objc_msgSend__asset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_asset");
}

id objc_msgSend__atsContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_atsContext");
}

id objc_msgSend__authenticatorStatusCodes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_authenticatorStatusCodes");
}

id objc_msgSend__backgroundPublishingURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_backgroundPublishingURL");
}

id objc_msgSend__backgroundTrailers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_backgroundTrailers");
}

id objc_msgSend__beginSqliteTransaction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_beginSqliteTransaction");
}

id objc_msgSend__clientIsNotExplicitlyDiscretionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientIsNotExplicitlyDiscretionary");
}

id objc_msgSend__commitSqliteTransaction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_commitSqliteTransaction");
}

id objc_msgSend__companionAppBundleIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_companionAppBundleIdentifier");
}

id objc_msgSend__connectionIsCellular(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_connectionIsCellular");
}

id objc_msgSend__connectionPoolName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_connectionPoolName");
}

id objc_msgSend__copySocketStreamProperties(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_copySocketStreamProperties");
}

id objc_msgSend__createDBSchemaForPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createDBSchemaForPath:");
}

id objc_msgSend__createDispatchData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createDispatchData");
}

id objc_msgSend__daemon_connectionMetrics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_daemon_connectionMetrics");
}

id objc_msgSend__daemon_currentTransactionMetrics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_daemon_currentTransactionMetrics");
}

id objc_msgSend__daemon_establishTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_daemon_establishTime");
}

id objc_msgSend__daemon_interfaceName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_daemon_interfaceName");
}

id objc_msgSend__daemon_isDataBudgetingEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_daemon_isDataBudgetingEnabled");
}

id objc_msgSend__daemon_isDiscretionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_daemon_isDiscretionary");
}

id objc_msgSend__daemon_requestBodyTransferSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_daemon_requestBodyTransferSize");
}

id objc_msgSend__daemon_requestHeaderSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_daemon_requestHeaderSize");
}

id objc_msgSend__daemon_responseBodyTransferSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_daemon_responseBodyTransferSize");
}

id objc_msgSend__daemon_responseHeaderSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_daemon_responseHeaderSize");
}

id objc_msgSend__deleteAllTaskEntriesForSession_sessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deleteAllTaskEntriesForSession:sessionUUID:");
}

id objc_msgSend__deleteTaskEntriesWithIdentifiers_forSession_sessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deleteTaskEntriesWithIdentifiers:forSession:sessionUUID:");
}

id objc_msgSend__destinationURLToUse(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_destinationURLToUse");
}

id objc_msgSend__directoryForDownloadedFiles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_directoryForDownloadedFiles");
}

id objc_msgSend__doesSZExtractorConsumeExtractedData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_doesSZExtractorConsumeExtractedData");
}

id objc_msgSend__downloadTaskWithRequest_downloadFilePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_downloadTaskWithRequest:downloadFilePath:");
}

id objc_msgSend__duetPreClearedMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_duetPreClearedMode");
}

id objc_msgSend__duetPreauthorized(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_duetPreauthorized");
}

id objc_msgSend__effectiveConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_effectiveConfiguration");
}

id objc_msgSend__extractor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractor");
}

id objc_msgSend__extractorFinishedDecoding(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractorFinishedDecoding");
}

id objc_msgSend__extractorPreparedForExtraction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractorPreparedForExtraction");
}

id objc_msgSend__getAllSessionIDsForBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getAllSessionIDsForBundle:");
}

id objc_msgSend__getAllTasksFromDBForSession_sessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getAllTasksFromDBForSession:sessionUUID:");
}

id objc_msgSend__groupConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_groupConfiguration");
}

id objc_msgSend__hasSZExtractor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hasSZExtractor");
}

id objc_msgSend__ignoreDidReceiveResponseDisposition(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_ignoreDidReceiveResponseDisposition");
}

id objc_msgSend__infersDiscretionaryFromOriginatingClient(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_infersDiscretionaryFromOriginatingClient");
}

id objc_msgSend__initDB_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initDB:");
}

id objc_msgSend__initWithActualAuthChallenge_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithActualAuthChallenge:");
}

id objc_msgSend__initWithActualError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithActualError:");
}

id objc_msgSend__initWithActualRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithActualRequest:");
}

id objc_msgSend__initWithActualResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithActualResponse:");
}

id objc_msgSend__isSafeDirectoryForDownloads_withToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isSafeDirectoryForDownloads:withToken:");
}

id objc_msgSend__isSafeRequestForBackgroundDownload(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isSafeRequestForBackgroundDownload");
}

id objc_msgSend__legacySocketStreamProperties(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_legacySocketStreamProperties");
}

id objc_msgSend__loggableDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loggableDescription");
}

id objc_msgSend__loggingPrivacyLevel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loggingPrivacyLevel");
}

id objc_msgSend__maximumWatchCellularTransferSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_maximumWatchCellularTransferSize");
}

id objc_msgSend__metrics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_metrics");
}

id objc_msgSend__multipathAlternatePort(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_multipathAlternatePort");
}

id objc_msgSend__neTrackerTCCResult(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_neTrackerTCCResult");
}

id objc_msgSend__nsurlsessionproxy_cancelWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nsurlsessionproxy_cancelWithError:");
}

id objc_msgSend__nsurlsessionproxy_clearError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nsurlsessionproxy_clearError");
}

id objc_msgSend__nsurlsessionproxy_error(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nsurlsessionproxy_error");
}

id objc_msgSend__nsurlsessionproxy_isSafeRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nsurlsessionproxy_isSafeRequest");
}

id objc_msgSend__nsurlsessionproxy_launchUUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nsurlsessionproxy_launchUUID");
}

id objc_msgSend__nsurlsessionproxy_messagePriority(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nsurlsessionproxy_messagePriority");
}

id objc_msgSend__nsurlsessionproxy_requiresBackgroundSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nsurlsessionproxy_requiresBackgroundSession");
}

id objc_msgSend__nsurlsessionproxy_secureArchivedDataWithRootObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nsurlsessionproxy_secureArchivedDataWithRootObject:");
}

id objc_msgSend__nsurlsessionproxy_secureUnarchiveObjectOfClass_withData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nsurlsessionproxy_secureUnarchiveObjectOfClass:withData:");
}

id objc_msgSend__nsurlsessionproxy_sequenceNumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nsurlsessionproxy_sequenceNumber");
}

id objc_msgSend__nsurlsessionproxy_sessionIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nsurlsessionproxy_sessionIdentifier");
}

id objc_msgSend__nsurlsessionproxy_sessionUUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nsurlsessionproxy_sessionUUID");
}

id objc_msgSend__nsurlsessionproxy_setLaunchUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nsurlsessionproxy_setLaunchUUID:");
}

id objc_msgSend__nsurlsessionproxy_setMessagePriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nsurlsessionproxy_setMessagePriority:");
}

id objc_msgSend__nsurlsessionproxy_setSequenceNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nsurlsessionproxy_setSequenceNumber:");
}

id objc_msgSend__nsurlsessionproxy_taskIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nsurlsessionproxy_taskIdentifier");
}

id objc_msgSend__obliterateAllBackgroundSessionsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_obliterateAllBackgroundSessionsWithCompletionHandler:");
}

id objc_msgSend__onBehalfOfPairedDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onBehalfOfPairedDevice");
}

id objc_msgSend__onqueue_IDSTimoutForMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_IDSTimoutForMessage:");
}

id objc_msgSend__onqueue_adoptEffectiveConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_adoptEffectiveConfiguration:");
}

id objc_msgSend__onqueue_convertSqlRowToTaskInfoEntry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_convertSqlRowToTaskInfoEntry:");
}

id objc_msgSend__onqueue_deleteEntryForTask_forSession_sessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_deleteEntryForTask:forSession:sessionUUID:");
}

id objc_msgSend__onqueue_devicesConnected(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_devicesConnected");
}

id objc_msgSend__onqueue_devicesDisconnected(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_devicesDisconnected");
}

id objc_msgSend__onqueue_handleFailedMessageSend_ofType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_handleFailedMessageSend:ofType:");
}

id objc_msgSend__onqueue_handleReceivedMessage_ofType_withReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_handleReceivedMessage:ofType:withReply:");
}

id objc_msgSend__onqueue_handleReceivedReply_forIdentifier_ofType_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_handleReceivedReply:forIdentifier:ofType:withError:");
}

id objc_msgSend__onqueue_initDB(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_initDB");
}

id objc_msgSend__onqueue_insertOrUpdateAllEntriesForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_insertOrUpdateAllEntriesForTask:sessionUUID:");
}

id objc_msgSend__onqueue_loggableDescriptionForMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_loggableDescriptionForMessage:");
}

id objc_msgSend__onqueue_messageWithIdentifier_didSendWithSuccess_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_messageWithIdentifier:didSendWithSuccess:error:");
}

id objc_msgSend__onqueue_priorityForMessage_ofType_isReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_priorityForMessage:ofType:isReply:");
}

id objc_msgSend__onqueue_remoteDeviceStartedUp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_remoteDeviceStartedUp");
}

id objc_msgSend__onqueue_removePendingLaunchForBundleID_sessionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_removePendingLaunchForBundleID:sessionID:");
}

id objc_msgSend__onqueue_resetRequestDelay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_resetRequestDelay");
}

id objc_msgSend__onqueue_sendMessage_ofType_responseIdentifier_forSourceApplication_withUrgency_withIDSMessageTimeout_withReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_sendMessage:ofType:responseIdentifier:forSourceApplication:withUrgency:withIDSMessageTimeout:withReply:");
}

id objc_msgSend__onqueue_sendStartupMessage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_sendStartupMessage");
}

id objc_msgSend__onqueue_sourceApplicationForMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_sourceApplicationForMessage:");
}

id objc_msgSend__onqueue_updateBytesPerSecondLimitForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_updateBytesPerSecondLimitForTask:sessionUUID:");
}

id objc_msgSend__onqueue_updateCurrentRequestForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_updateCurrentRequestForTask:sessionUUID:");
}

id objc_msgSend__onqueue_updateDeviceState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_updateDeviceState");
}

id objc_msgSend__onqueue_updateDownloadFileURLForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_updateDownloadFileURLForTask:sessionUUID:");
}

id objc_msgSend__onqueue_updateExpectedProgressTargetForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_updateExpectedProgressTargetForTask:sessionUUID:");
}

id objc_msgSend__onqueue_updateLoadingPriorityForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_updateLoadingPriorityForTask:sessionUUID:");
}

id objc_msgSend__onqueue_updateRespondedToWillBeginDelayedRequestCallbackForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_updateRespondedToWillBeginDelayedRequestCallbackForTask:sessionUUID:");
}

id objc_msgSend__onqueue_updateResponseForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_updateResponseForTask:sessionUUID:");
}

id objc_msgSend__onqueue_updateResumableUploadDataForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_updateResumableUploadDataForTask:sessionUUID:");
}

id objc_msgSend__onqueue_updateSetPriorityEntriesForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_updateSetPriorityEntriesForTask:sessionUUID:");
}

id objc_msgSend__onqueue_updateShouldCancelOnDisconnectForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_updateShouldCancelOnDisconnectForTask:sessionUUID:");
}

id objc_msgSend__onqueue_updateSuspendPathEntriesForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_updateSuspendPathEntriesForTask:sessionUUID:");
}

id objc_msgSend__onqueue_updateTLSSupportedProtocolVersionForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_updateTLSSupportedProtocolVersionForTask:sessionUUID:");
}

id objc_msgSend__onqueue_updateTaskDescriptionForTask_sessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_onqueue_updateTaskDescriptionForTask:sessionUUID:");
}

id objc_msgSend__performsEVCertCheck(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performsEVCertCheck");
}

id objc_msgSend__pidForHAR(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pidForHAR");
}

id objc_msgSend__prefersInfraWiFi(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prefersInfraWiFi");
}

id objc_msgSend__priority(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_priority");
}

id objc_msgSend__priorityValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_priorityValue");
}

id objc_msgSend__propertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_propertyForKey:");
}

id objc_msgSend__releasePreventIdleSleepAssertionIfAppropriate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_releasePreventIdleSleepAssertionIfAppropriate");
}

id objc_msgSend__removeAllProtocolProperties(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeAllProtocolProperties");
}

id objc_msgSend__reportsDataStalls(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reportsDataStalls");
}

id objc_msgSend__requestFromResumeData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_requestFromResumeData");
}

id objc_msgSend__requiresPowerPluggedIn(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_requiresPowerPluggedIn");
}

id objc_msgSend__requiresSustainedDataDelivery(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_requiresSustainedDataDelivery");
}

id objc_msgSend__respectsAllowsCellularAccessForDiscretionaryTasks(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_respectsAllowsCellularAccessForDiscretionaryTasks");
}

id objc_msgSend__seenFirstResume(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_seenFirstResume");
}

id objc_msgSend__sessionSendsLaunchOnDemandEvents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sessionSendsLaunchOnDemandEvents");
}

id objc_msgSend__sessionWithConfiguration_delegate_delegateDispatchQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sessionWithConfiguration:delegate:delegateDispatchQueue:");
}

id objc_msgSend__setActualTaskInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setActualTaskInfo:");
}

id objc_msgSend__setAllowsUCA_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setAllowsUCA:");
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setQueue:");
}

id objc_msgSend__setTimeWindowDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setTimeWindowDelay:");
}

id objc_msgSend__setTimeWindowDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setTimeWindowDuration:");
}

id objc_msgSend__shouldSkipPreferredClientCertificateLookup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldSkipPreferredClientCertificateLookup");
}

id objc_msgSend__socketStreamProperties(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_socketStreamProperties");
}

id objc_msgSend__sourceApplicationAuditTokenData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sourceApplicationAuditTokenData");
}

id objc_msgSend__sourceApplicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sourceApplicationBundleIdentifier");
}

id objc_msgSend__sourceApplicationBundleIdentifierForMobileAsset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sourceApplicationBundleIdentifierForMobileAsset");
}

id objc_msgSend__sourceApplicationSecondaryIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sourceApplicationSecondaryIdentifier");
}

id objc_msgSend__sqlBlobHelper_forColumn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sqlBlobHelper:forColumn:");
}

id objc_msgSend__supportsAVAssetDownloads(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_supportsAVAssetDownloads");
}

id objc_msgSend__taskGroup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_taskGroup");
}

id objc_msgSend__timeWindowDelay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_timeWindowDelay");
}

id objc_msgSend__timeWindowDuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_timeWindowDuration");
}

id objc_msgSend__timingDataOptions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_timingDataOptions");
}

id objc_msgSend__tlsSessionCachePrefix(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tlsSessionCachePrefix");
}

id objc_msgSend__tlsTrustPinningPolicyName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tlsTrustPinningPolicyName");
}

id objc_msgSend__trailers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_trailers");
}

id objc_msgSend__uniqueIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_uniqueIdentifier");
}

id objc_msgSend__updateDBEntriesForTasksInSession_taskInfos_updates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateDBEntriesForTasksInSession:taskInfos:updates:");
}

id objc_msgSend__updateDBEntryForTask_updateType_sessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateDBEntryForTask:updateType:sessionUUID:");
}

id objc_msgSend__updateState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateState");
}

id objc_msgSend__updatedStreamingZipModificationDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatedStreamingZipModificationDate");
}

id objc_msgSend__useTLSSessionCacheFromSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_useTLSSessionCacheFromSession:");
}

id objc_msgSend__web_errorWithDomain_code_URL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_web_errorWithDomain:code:URL:");
}

id objc_msgSend__web_errorWithDomain_code_failingURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_web_errorWithDomain:code:failingURL:");
}

id objc_msgSend__xpcActivityBudgeted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_xpcActivityBudgeted");
}

id objc_msgSend__xpcConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_xpcConnection");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_acquireWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acquireWithError:");
}

id objc_msgSend_activityCanceled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityCanceled:");
}

id objc_msgSend_activityCompleted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityCompleted:");
}

id objc_msgSend_activityWithName_priority_duration_startingAfter_startingBefore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityWithName:priority:duration:startingAfter:startingBefore:");
}

id objc_msgSend_addDelegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDelegate:queue:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_forApplication_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forApplication:");
}

id objc_msgSend_addObserver_forContainerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forContainerID:");
}

id objc_msgSend_addObserver_forExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forExtension:");
}

id objc_msgSend_addObserver_forProviderID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forProviderID:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addOutstandingTaskWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOutstandingTaskWithIdentifier:");
}

id objc_msgSend_addPendingCallback_wakeRequirement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPendingCallback:wakeRequirement:");
}

id objc_msgSend_addPendingCallbackToFront_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPendingCallbackToFront:");
}

id objc_msgSend_addTransaction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTransaction");
}

id objc_msgSend_additionalProperties(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "additionalProperties");
}

id objc_msgSend_adjustDiscretionaryStatusForTaskInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adjustDiscretionaryStatusForTaskInfo:");
}

id objc_msgSend_adjustedTCPConnectionPriorityForTaskPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adjustedTCPConnectionPriorityForTaskPriority:");
}

id objc_msgSend_allCredentials(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allCredentials");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allValues");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_allowReconnect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowReconnect");
}

id objc_msgSend_allowedClassesForUnarchiving(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowedClassesForUnarchiving");
}

id objc_msgSend_allowsCellularAccess(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowsCellularAccess");
}

id objc_msgSend_allowsConstrainedNetworkAccess(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowsConstrainedNetworkAccess");
}

id objc_msgSend_allowsExpensiveNetworkAccess(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowsExpensiveNetworkAccess");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_application_hasAssertionWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "application:hasAssertionWithName:");
}

id objc_msgSend_application_isHandlingBackgroundSessionWithIdentifier_withSessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "application:isHandlingBackgroundSessionWithIdentifier:withSessionUUID:");
}

id objc_msgSend_applicationBackgroundUpdatesEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationBackgroundUpdatesEnabled:");
}

id objc_msgSend_applicationBackgroundUpdatesTurnedOff_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationBackgroundUpdatesTurnedOff:");
}

id objc_msgSend_applicationBackgroundUpdatesTurnedOn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationBackgroundUpdatesTurnedOn:");
}

id objc_msgSend_applicationEnteredForeground_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationEnteredForeground:");
}

id objc_msgSend_applicationHasBackgroundTaskCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationHasBackgroundTaskCompletion:");
}

id objc_msgSend_applicationIsForeground_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationIsForeground:");
}

id objc_msgSend_applicationIsInstalled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationIsInstalled:");
}

id objc_msgSend_applicationNoLongerInForeground_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationNoLongerInForeground:");
}

id objc_msgSend_applicationWasQuitFromAppSwitcher_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationWasQuitFromAppSwitcher:");
}

id objc_msgSend_applicationWasSuspended_pid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationWasSuspended:pid:");
}

id objc_msgSend_applicationWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationWithIdentifier:");
}

id objc_msgSend_archiveList(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archiveList");
}

id objc_msgSend_archivePath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivePath");
}

id objc_msgSend_archiveState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archiveState");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_args(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "args");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assertionNameForSessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assertionNameForSessionUUID:");
}

id objc_msgSend_assertions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assertions");
}

id objc_msgSend_assetArtworkData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetArtworkData");
}

id objc_msgSend_assetDownloadSessionWithAsset_mediaSelections_destinationURL_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetDownloadSessionWithAsset:mediaSelections:destinationURL:options:");
}

id objc_msgSend_assetDownloadSessionWithURL_destinationURL_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetDownloadSessionWithURL:destinationURL:options:");
}

id objc_msgSend_assetForNSURLSessionWithURL_propertyList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetForNSURLSessionWithURL:propertyList:");
}

id objc_msgSend_assetOptionsPlist(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetOptionsPlist");
}

id objc_msgSend_assetTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetTitle");
}

id objc_msgSend_attributeWithDomain_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributeWithDomain:name:");
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributes");
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "auditToken");
}

id objc_msgSend_authenticationMethod(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authenticationMethod");
}

id objc_msgSend_avAssetDownloadChildDownloadSessionIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "avAssetDownloadChildDownloadSessionIdentifier");
}

id objc_msgSend_avAssetDownloadsDirectory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "avAssetDownloadsDirectory");
}

id objc_msgSend_avAssetForURL_downloadToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "avAssetForURL:downloadToken:");
}

id objc_msgSend_backgroundAVAssetDownloadTask_didFinishDownloadForMediaSelectionPropertyList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundAVAssetDownloadTask:didFinishDownloadForMediaSelectionPropertyList:");
}

id objc_msgSend_backgroundAVAssetDownloadTask_didLoadTimeRange_totalTimeRangesLoaded_timeRangeExpectedToLoad_forMediaSelectionPropertyList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundAVAssetDownloadTask:didLoadTimeRange:totalTimeRangesLoaded:timeRangeExpectedToLoad:forMediaSelectionPropertyList:");
}

id objc_msgSend_backgroundAVAssetDownloadTask_didReceiveDownloadToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundAVAssetDownloadTask:didReceiveDownloadToken:");
}

id objc_msgSend_backgroundAVAssetDownloadTask_didResolveMediaSelectionProperyList_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundAVAssetDownloadTask:didResolveMediaSelectionProperyList:reply:");
}

id objc_msgSend_backgroundAVAssetDownloadTask_willDownloadToURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundAVAssetDownloadTask:willDownloadToURL:");
}

id objc_msgSend_backgroundAVAssetDownloadTask_willDownloadVariants_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundAVAssetDownloadTask:willDownloadVariants:reply:");
}

id objc_msgSend_backgroundAVAssetDownloadTaskDidUpdateProgress_totalBytesWritten_totalBytesExpectedToWrite_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundAVAssetDownloadTaskDidUpdateProgress:totalBytesWritten:totalBytesExpectedToWrite:");
}

id objc_msgSend_backgroundDataTask_didReceiveData_withReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundDataTask:didReceiveData:withReply:");
}

id objc_msgSend_backgroundDataTaskDidBecomeDownloadTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundDataTaskDidBecomeDownloadTask:");
}

id objc_msgSend_backgroundDownloadTask_didFinishDownloadingToURL_response_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundDownloadTask:didFinishDownloadingToURL:response:reply:");
}

id objc_msgSend_backgroundDownloadTask_didResumeAtOffset_expectedTotalBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundDownloadTask:didResumeAtOffset:expectedTotalBytes:");
}

id objc_msgSend_backgroundDownloadTask_didWriteData_totalBytesWritten_totalBytesExpectedToWrite_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundDownloadTask:didWriteData:totalBytesWritten:totalBytesExpectedToWrite:");
}

id objc_msgSend_backgroundSessionDidFinishAppWake_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundSessionDidFinishAppWake:reply:");
}

id objc_msgSend_backgroundSessionDidStartAppWake_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundSessionDidStartAppWake:reply:");
}

id objc_msgSend_backgroundTask__willSendRequestForEstablishedConnection_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundTask:_willSendRequestForEstablishedConnection:reply:");
}

id objc_msgSend_backgroundTask_didCompleteWithError_taskMetrics_info_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundTask:didCompleteWithError:taskMetrics:info:reply:");
}

id objc_msgSend_backgroundTask_didReceiveChallenge_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundTask:didReceiveChallenge:reply:");
}

id objc_msgSend_backgroundTask_didReceiveInformationalResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundTask:didReceiveInformationalResponse:");
}

id objc_msgSend_backgroundTask_didReceiveResponse_transactionMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundTask:didReceiveResponse:transactionMetrics:");
}

id objc_msgSend_backgroundTask_didReceiveResponse_transactionMetrics_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundTask:didReceiveResponse:transactionMetrics:reply:");
}

id objc_msgSend_backgroundTask_didSendBodyData_totalBytesSent_totalBytesExpectedToSend_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundTask:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:");
}

id objc_msgSend_backgroundTask_getAuthHeadersForResponse_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundTask:getAuthHeadersForResponse:reply:");
}

id objc_msgSend_backgroundTask_hasConnectionWaitingWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundTask:hasConnectionWaitingWithError:");
}

id objc_msgSend_backgroundTask_needNewBodyStream_withReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundTask:needNewBodyStream:withReply:");
}

id objc_msgSend_backgroundTask_willBeginDelayedRequest_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundTask:willBeginDelayedRequest:reply:");
}

id objc_msgSend_backgroundTask_willPerformHTTPRedirection_withNewRequest_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundTask:willPerformHTTPRedirection:withNewRequest:reply:");
}

id objc_msgSend_backgroundTaskDidResume_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundTaskDidResume:");
}

id objc_msgSend_backgroundTaskDidSuspend_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundTaskDidSuspend:");
}

id objc_msgSend_backgroundUpdatesEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundUpdatesEnabled");
}

id objc_msgSend_baseMessage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "baseMessage");
}

id objc_msgSend_basePriority(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "basePriority");
}

id objc_msgSend_basePrioritySetExplicitly(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "basePrioritySetExplicitly");
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "begin");
}

id objc_msgSend_beginActivityWithOptions_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginActivityWithOptions:reason:");
}

id objc_msgSend_bgSessionManagerInterface(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bgSessionManagerInterface");
}

id objc_msgSend_bodyData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bodyData");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bumpAndReturnOutgoingSequenceNumberForPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bumpAndReturnOutgoingSequenceNumberForPriority:");
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundle");
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleID");
}

id objc_msgSend_bundleIDForPrimaryIdentifier_secondaryIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIDForPrimaryIdentifier:secondaryIdentifier:");
}

id objc_msgSend_bundleIDFromPrimaryIdentifier_secondaryIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIDFromPrimaryIdentifier:secondaryIdentifier:");
}

id objc_msgSend_bundleIDsForAppProxies_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIDsForAppProxies:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundleManagerPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleManagerPath:");
}

id objc_msgSend_bundleRecordWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bytes");
}

id objc_msgSend_bytesPerSecondLimit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bytesPerSecondLimit");
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_canBeSuspended(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canBeSuspended");
}

id objc_msgSend_canLaunchProcessWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canLaunchProcessWithIdentifier:");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancel");
}

id objc_msgSend_cancelAVDownloadAndFailTaskWithIdentifier_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelAVDownloadAndFailTaskWithIdentifier:withError:");
}

id objc_msgSend_cancelAndDeliverError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelAndDeliverError:");
}

id objc_msgSend_cancelByProducingResumeData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelByProducingResumeData:");
}

id objc_msgSend_cancelDelayedCompletionWakeTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelDelayedCompletionWakeTimer");
}

id objc_msgSend_cancelMonitorForTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelMonitorForTask:");
}

id objc_msgSend_cancelTCPConnectionForTask_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelTCPConnectionForTask:withError:");
}

id objc_msgSend_cancelTaskWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelTaskWithIdentifier:");
}

id objc_msgSend_cancelTasksRequiringClientConnectionAndResumeUnstartedTasks(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelTasksRequiringClientConnectionAndResumeUnstartedTasks");
}

id objc_msgSend_cancelThroughputMonitorForWrapper_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelThroughputMonitorForWrapper:");
}

id objc_msgSend_cancel_with_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancel_with_error:");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_certificates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "certificates");
}

id objc_msgSend_checkResourceIsReachableAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkResourceIsReachableAndReturnError:");
}

id objc_msgSend_chronoKitExtensionWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chronoKitExtensionWithIdentifier:");
}

id objc_msgSend_cleanupSessionWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanupSessionWithCompletionHandler:");
}

id objc_msgSend_cleanupWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanupWithCompletionHandler:");
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "client");
}

id objc_msgSend_clientAcknowledgedTerminalCallbackForTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientAcknowledgedTerminalCallbackForTask:");
}

id objc_msgSend_clientApplicationWasReinstalled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientApplicationWasReinstalled");
}

id objc_msgSend_clientBundleID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientBundleID");
}

id objc_msgSend_clientDidDisconnect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientDidDisconnect");
}

id objc_msgSend_clientErrorForError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientErrorForError:");
}

id objc_msgSend_clientIsActive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientIsActive");
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "close");
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "closeFile");
}

id objc_msgSend_closeRead(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "closeRead");
}

id objc_msgSend_closeWrite(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "closeWrite");
}

id objc_msgSend_cloudContainerWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cloudContainerWithIdentifier:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "code");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configuration");
}

id objc_msgSend_configurationWithClientConfiguration_discretionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithClientConfiguration:discretionary:");
}

id objc_msgSend_configureAdditionalPropertiesOnTask_taskInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureAdditionalPropertiesOnTask:taskInfo:");
}

id objc_msgSend_configureTask_withTaskInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureTask:withTaskInfo:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_connection_canUseSharedContainerIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connection:canUseSharedContainerIdentifier:");
}

id objc_msgSend_connectionProxyDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionProxyDictionary");
}

id objc_msgSend_containerIDForPrimaryIdentifier_secondaryIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerIDForPrimaryIdentifier:secondaryIdentifier:");
}

id objc_msgSend_containerIDFromPrimaryIdentifier_secondaryIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerIDFromPrimaryIdentifier:secondaryIdentifier:");
}

id objc_msgSend_containerURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerURL");
}

id objc_msgSend_containingBundleRecord(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containingBundleRecord");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "context");
}

id objc_msgSend_continueLoad(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "continueLoad");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copy");
}

id objc_msgSend_copyAndSanitizeClientConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyAndSanitizeClientConfiguration:");
}

id objc_msgSend_copyItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyItemAtURL:toURL:error:");
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countOfBytesClientExpectsToReceive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countOfBytesClientExpectsToReceive");
}

id objc_msgSend_countOfBytesClientExpectsToSend(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countOfBytesClientExpectsToSend");
}

id objc_msgSend_countOfBytesExpectedToReceive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countOfBytesExpectedToReceive");
}

id objc_msgSend_countOfBytesExpectedToSend(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countOfBytesExpectedToSend");
}

id objc_msgSend_countOfBytesExpectedToWrite(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countOfBytesExpectedToWrite");
}

id objc_msgSend_countOfBytesReceived(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countOfBytesReceived");
}

id objc_msgSend_countOfBytesSent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countOfBytesSent");
}

id objc_msgSend_countOfBytesWritten(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countOfBytesWritten");
}

id objc_msgSend_createActivityGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createActivityGroup:");
}

id objc_msgSend_createDaemonDirectory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDaemonDirectory");
}

id objc_msgSend_createDataVaultDirectoryAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDataVaultDirectoryAtPath:");
}

id objc_msgSend_createDirectoryAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtPath:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createDirectoryAtURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtURL:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createFileAtPath_contents_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createFileAtPath:contents:attributes:");
}

id objc_msgSend_createIdentityFromEndpoint_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createIdentityFromEndpoint:error:");
}

id objc_msgSend_createNewTaskFromInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createNewTaskFromInfo:");
}

id objc_msgSend_createPersonaContextForBackgroundProcessingWithPersonaUniqueString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createPersonaContextForBackgroundProcessingWithPersonaUniqueString:");
}

id objc_msgSend_createResumeDataForTaskInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createResumeDataForTaskInfo");
}

id objc_msgSend_createResumeInformation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createResumeInformation:");
}

id objc_msgSend_creationTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "creationTime");
}

id objc_msgSend_credStorage_allCredentialsWithReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "credStorage_allCredentialsWithReply:");
}

id objc_msgSend_credStorage_credentialsForProtectionSpace_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "credStorage_credentialsForProtectionSpace:reply:");
}

id objc_msgSend_credStorage_defaultCredentialForProtectionSpace_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "credStorage_defaultCredentialForProtectionSpace:reply:");
}

id objc_msgSend_credStorage_getInitialCredentialDictionariesWithReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "credStorage_getInitialCredentialDictionariesWithReply:");
}

id objc_msgSend_credStorage_setCredential_forProtectionSpace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "credStorage_setCredential:forProtectionSpace:");
}

id objc_msgSend_credStorage_setDefaultCredential_forProtectionSpace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "credStorage_setDefaultCredential:forProtectionSpace:");
}

id objc_msgSend_credential(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "credential");
}

id objc_msgSend_credentialForTrust_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "credentialForTrust:");
}

id objc_msgSend_credentialWithIdentity_certificates_persistence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "credentialWithIdentity:certificates:persistence:");
}

id objc_msgSend_credentialWithUser_password_persistence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "credentialWithUser:password:persistence:");
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentConnection");
}

id objc_msgSend_currentDiscretionaryStatus_withOptionalTaskInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentDiscretionaryStatus:withOptionalTaskInfo:");
}

id objc_msgSend_currentIntervalDuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentIntervalDuration");
}

id objc_msgSend_currentIntervalEndDelta(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentIntervalEndDelta");
}

id objc_msgSend_currentIntervalThroughputThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentIntervalThroughputThreshold");
}

id objc_msgSend_currentPersona(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentPersona");
}

id objc_msgSend_currentRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentRequest");
}

id objc_msgSend_currentRequestDelay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentRequestDelay");
}

id objc_msgSend_currentRequest_URL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentRequest_URL");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentState");
}

id objc_msgSend_currentThroughputThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentThroughputThreshold");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "data");
}

id objc_msgSend_dataContainerURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataContainerURL");
}

id objc_msgSend_dataTaskWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataTaskWithRequest:");
}

id objc_msgSend_dataWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "date");
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_dateWithTimeIntervalSince1970_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSince1970:");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_decodeIntegerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeIntegerForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultCredentialForProtectionSpace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCredentialForProtectionSpace:");
}

id objc_msgSend_defaultDownloadDirectoryContainer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultDownloadDirectoryContainer");
}

id objc_msgSend_defaultDownloadDirectoryForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultDownloadDirectoryForBundleID:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultPairedDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultPairedDevice");
}

id objc_msgSend_defaultSessionConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultSessionConfiguration");
}

id objc_msgSend_defaultTaskGroup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultTaskGroup");
}

id objc_msgSend_defaultWindowDurationForResourceTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultWindowDurationForResourceTimeout:");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_delegateImplementsDidReceiveResponse(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegateImplementsDidReceiveResponse");
}

id objc_msgSend_delegateImplementsSessionAuthChallenge(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegateImplementsSessionAuthChallenge");
}

id objc_msgSend_delegateImplementsTaskAuthChallenge(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegateImplementsTaskAuthChallenge");
}

id objc_msgSend_delegateImplementsWillPerformRedirection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegateImplementsWillPerformRedirection");
}

id objc_msgSend_delegateImplementsWillSendRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegateImplementsWillSendRequest");
}

id objc_msgSend_descriptionForRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionForRequest:");
}

id objc_msgSend_descriptionForTaskWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionForTaskWithIdentifier:");
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptor");
}

id objc_msgSend_destinationURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destinationURL");
}

id objc_msgSend_destinationURLToUseForTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destinationURLToUseForTask:");
}

id objc_msgSend_deviceIDForNRDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceIDForNRDevice:");
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "devices");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryRepresentation");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
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

id objc_msgSend_disableTransitionalDiscretionaryPeriodTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disableTransitionalDiscretionaryPeriodTimer");
}

id objc_msgSend_disablesRetry(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disablesRetry");
}

id objc_msgSend_disavowSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disavowSession");
}

id objc_msgSend_discretionaryOverride(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discretionaryOverride");
}

id objc_msgSend_disposition(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disposition");
}

id objc_msgSend_doesAVAssetDownloadSessionSupportMultipleDownloads(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doesAVAssetDownloadSessionSupportMultipleDownloads");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "domain");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_downloadAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadAsset:");
}

id objc_msgSend_downloadConfig(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadConfig");
}

id objc_msgSend_downloadDirectoryToUse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadDirectoryToUse:");
}

id objc_msgSend_downloadFile(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadFile");
}

id objc_msgSend_downloadFileURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadFileURL");
}

id objc_msgSend_downloadSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadSession");
}

id objc_msgSend_downloadTaskWithResumeData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadTaskWithResumeData:");
}

id objc_msgSend_downloadToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadToken");
}

id objc_msgSend_drainCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drainCallback:");
}

id objc_msgSend_drainCallbacksForTaskIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drainCallbacksForTaskIdentifier:");
}

id objc_msgSend_dropBoost(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dropBoost");
}

id objc_msgSend_earlierDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "earlierDate:");
}

id objc_msgSend_earliestBeginDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "earliestBeginDate");
}

id objc_msgSend_embeddedApplicationIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "embeddedApplicationIdentifier");
}

id objc_msgSend_enableSPIDelegateCallbacks(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableSPIDelegateCallbacks");
}

id objc_msgSend_encodeInteger_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInteger:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodedData");
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "end");
}

id objc_msgSend_endActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endActivity:");
}

id objc_msgSend_endBridgingUMTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endBridgingUMTask:");
}

id objc_msgSend_endUMTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endUMTask:");
}

id objc_msgSend_endowmentNamespaces(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endowmentNamespaces");
}

id objc_msgSend_endpointWithCEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endpointWithCEndpoint:");
}

id objc_msgSend_enqueueTaskWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueTaskWithIdentifier:");
}

id objc_msgSend_ensureAVAssetDownloadSessionWrapperForTaskIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ensureAVAssetDownloadSessionWrapperForTaskIdentifier:");
}

id objc_msgSend_ensureSessionDownloadDirectoryExists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ensureSessionDownloadDirectoryExists");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "error");
}

id objc_msgSend_error_code_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "error:code:");
}

id objc_msgSend_errorIfBlockedTracker_url_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorIfBlockedTracker:url:");
}

id objc_msgSend_errorOccurredDuringAuthCallbackDelivery_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorOccurredDuringAuthCallbackDelivery:completionHandler:");
}

id objc_msgSend_errorOccurredDuringFinishedCallbackDelivery_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorOccurredDuringFinishedCallbackDelivery:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_establishedConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "establishedConnection");
}

id objc_msgSend_exitEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exitEvent");
}

id objc_msgSend_expectedProgressTarget(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "expectedProgressTarget");
}

id objc_msgSend_expectingResumeCallback(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "expectingResumeCallback");
}

id objc_msgSend_explanation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "explanation");
}

id objc_msgSend_extension_isHandlingBackgroundSessionWithIdentifier_withSessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extension:isHandlingBackgroundSessionWithIdentifier:withSessionUUID:");
}

id objc_msgSend_extensionPointRecord(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extensionPointRecord");
}

id objc_msgSend_fetchStreamingZipModificationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchStreamingZipModificationDate:");
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileDescriptor");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileProviderWithIdentifer_applicationIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileProviderWithIdentifer:applicationIdentifier:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_fileURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURL");
}

id objc_msgSend_fileURLWithFileSystemRepresentation_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:isDirectory:relativeToURL:");
}

id objc_msgSend_fillInByteCountsForTaskInfo_withTaskID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fillInByteCountsForTaskInfo:withTaskID:");
}

id objc_msgSend_fillInPropertiesForTaskInfo_withTaskID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fillInPropertiesForTaskInfo:withTaskID:");
}

id objc_msgSend_finalizeTaskCompletionWithSuppressedWake_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finalizeTaskCompletionWithSuppressedWake:");
}

id objc_msgSend_findBestAssetFrom_skipDownload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findBestAssetFrom:skipDownload:");
}

id objc_msgSend_finishTasksAndInvalidate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishTasksAndInvalidate");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstObject");
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getActivePairedDevice");
}

id objc_msgSend_getBackgroundSettingsAppList(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBackgroundSettingsAppList");
}

id objc_msgSend_getBoundStreamsWithBufferSize_inputStream_outputStream_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBoundStreamsWithBufferSize:inputStream:outputStream:");
}

id objc_msgSend_getClientProxy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getClientProxy");
}

id objc_msgSend_getComponentsForFullIdentifier_bundleIdentifier_sessionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getComponentsForFullIdentifier:bundleIdentifier:sessionIdentifier:");
}

id objc_msgSend_getLocalFileUrl(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getLocalFileUrl");
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_getSessionWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSessionWithIdentifier:");
}

id objc_msgSend_getSessionWithIdentifier_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSessionWithIdentifier:forBundleID:");
}

id objc_msgSend_getTLSSessionCachePrefix(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getTLSSessionCachePrefix");
}

id objc_msgSend_getTasksForReconnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getTasksForReconnection");
}

id objc_msgSend_getUUIDBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getUUIDBytes:");
}

id objc_msgSend_groupContainerURLs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupContainerURLs");
}

id objc_msgSend_groupWithName_maxConcurrent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupWithName:maxConcurrent:");
}

id objc_msgSend_handleCancelTaskMessage_forTaskIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleCancelTaskMessage:forTaskIdentifier:");
}

id objc_msgSend_handleCompletionOfTask_identifier_taskInfo_isRecoverable_suppressWake_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleCompletionOfTask:identifier:taskInfo:isRecoverable:suppressWake:");
}

id objc_msgSend_handleDataTaskWithRequestMessage_forTaskIdentifier_withReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDataTaskWithRequestMessage:forTaskIdentifier:withReply:");
}

id objc_msgSend_handleEarliestBeginDateForTaskWithIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleEarliestBeginDateForTaskWithIdentifier:completionHandler:");
}

id objc_msgSend_handleFailedMessageSend_ofType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailedMessageSend:ofType:");
}

id objc_msgSend_handleForPredicate_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleForPredicate:error:");
}

id objc_msgSend_handleInvalidateMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleInvalidateMessage:");
}

id objc_msgSend_handleMessage_ofType_withReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleMessage:ofType:withReply:");
}

id objc_msgSend_handleNewConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleNewConnection:");
}

id objc_msgSend_handleOpenSocketMessage_withReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleOpenSocketMessage:withReply:");
}

id objc_msgSend_handleResumeTaskMessage_forTaskIdentifier_withReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleResumeTaskMessage:forTaskIdentifier:withReply:");
}

id objc_msgSend_handleSchemaVersionChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleSchemaVersionChange");
}

id objc_msgSend_handleSetDescriptionMessage_forTaskIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleSetDescriptionMessage:forTaskIdentifier:");
}

id objc_msgSend_handleSetPriorityMessage_forTaskIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleSetPriorityMessage:forTaskIdentifier:");
}

id objc_msgSend_handleSuspendTaskMessage_forTaskIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleSuspendTaskMessage:forTaskIdentifier:");
}

id objc_msgSend_handleUploadBodyDataMessage_forTaskIdentifier_withReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleUploadBodyDataMessage:forTaskIdentifier:withReply:");
}

id objc_msgSend_handleWillBeginDelayedRequestForTaskWithIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleWillBeginDelayedRequestForTaskWithIdentifier:completionHandler:");
}

id objc_msgSend_hasBackgroundTaskCompletion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasBackgroundTaskCompletion");
}

id objc_msgSend_hasBeenCalled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasBeenCalled");
}

id objc_msgSend_hasBodyStream(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasBodyStream");
}

id objc_msgSend_hasConnectedClient(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasConnectedClient");
}

id objc_msgSend_hasCredential(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasCredential");
}

id objc_msgSend_hasDelegateImplementsDidReceiveResponse(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasDelegateImplementsDidReceiveResponse");
}

id objc_msgSend_hasDelegateImplementsSessionAuthChallenge(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasDelegateImplementsSessionAuthChallenge");
}

id objc_msgSend_hasDelegateImplementsTaskAuthChallenge(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasDelegateImplementsTaskAuthChallenge");
}

id objc_msgSend_hasDelegateImplementsWillPerformRedirection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasDelegateImplementsWillPerformRedirection");
}

id objc_msgSend_hasDelegateImplementsWillSendRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasDelegateImplementsWillSendRequest");
}

id objc_msgSend_hasDisposition(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasDisposition");
}

id objc_msgSend_hasForegroundBackgroundStates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasForegroundBackgroundStates");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasRequest");
}

id objc_msgSend_hasSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSession");
}

id objc_msgSend_hasStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasStarted");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_hasTask(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasTask");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hash");
}

id objc_msgSend_headerData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "headerData");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "host");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifier");
}

id objc_msgSend_identifierIsForSpringBoardApplication_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifierIsForSpringBoardApplication:");
}

id objc_msgSend_identity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identity");
}

id objc_msgSend_idsPriority(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idsPriority");
}

id objc_msgSend_incomingResponseIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "incomingResponseIdentifier");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "init");
}

id objc_msgSend_initForReadingFromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForReadingFromData:error:");
}

id objc_msgSend_initRequiringSecureCoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initRequiringSecureCoding:");
}

id objc_msgSend_initSocketWithDevice_options_completionHandler_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initSocketWithDevice:options:completionHandler:queue:");
}

id objc_msgSend_initWithAVAggregateAssetDownloadChildDownloadSessionIdentifier_assetTitle_assetArtworkData_options_taskIdentifier_uniqueIdentifier_bundleID_sessionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAVAggregateAssetDownloadChildDownloadSessionIdentifier:assetTitle:assetArtworkData:options:taskIdentifier:uniqueIdentifier:bundleID:sessionID:");
}

id objc_msgSend_initWithAVAggregateDownloadTaskNoChildTaskKindWithURL_destinationURL_assetTitle_assetArtworkData_options_taskIdentifier_uniqueIdentifier_bundleID_sessionID_enableSPIDelegateCallbacks_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAVAggregateDownloadTaskNoChildTaskKindWithURL:destinationURL:assetTitle:assetArtworkData:options:taskIdentifier:uniqueIdentifier:bundleID:sessionID:enableSPIDelegateCallbacks:");
}

id objc_msgSend_initWithAVAssetDownloadURL_destinationURL_assetTitle_assetArtworkData_options_taskIdentifier_uniqueIdentifier_bundleID_sessionID_downloadConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAVAssetDownloadURL:destinationURL:assetTitle:assetArtworkData:options:taskIdentifier:uniqueIdentifier:bundleID:sessionID:downloadConfig:");
}

id objc_msgSend_initWithAsset_propertyList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAsset:propertyList:");
}

id objc_msgSend_initWithBackgroundTaskInfo_taskGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBackgroundTaskInfo:taskGroup:");
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_initWithBundleIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:error:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithCallbackType_taskIdentifier_args_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallbackType:taskIdentifier:args:");
}

id objc_msgSend_initWithClient_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClient:identifier:");
}

id objc_msgSend_initWithConfiguration_bundleID_isSpringBoardApp_downloadDirectory_options_clientProxy_delegate_workQueue_db_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:bundleID:isSpringBoardApp:downloadDirectory:options:clientProxy:delegate:workQueue:db:");
}

id objc_msgSend_initWithConfiguration_uuidString_options_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:uuidString:options:delegate:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithDataTask_uniqueIdentifier_bundleID_sessionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataTask:uniqueIdentifier:bundleID:sessionID:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithDelegate_bundleID_isSpringBoardApp_forPersona_dataSeparatedPath_db_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:bundleID:isSpringBoardApp:forPersona:dataSeparatedPath:db:");
}

id objc_msgSend_initWithDelegate_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:forBundleID:");
}

id objc_msgSend_initWithDelegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:queue:");
}

id objc_msgSend_initWithDownloadTask_uniqueIdentifier_bundleID_sessionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDownloadTask:uniqueIdentifier:bundleID:sessionID:");
}

id objc_msgSend_initWithExplanation_target_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExplanation:target:attributes:");
}

id objc_msgSend_initWithHost_port_protocol_realm_authenticationMethod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHost:port:protocol:realm:authenticationMethod:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithIdentifier_applicationIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:applicationIdentifier:");
}

id objc_msgSend_initWithKeyOptions_valueOptions_capacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKeyOptions:valueOptions:capacity:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithMessage_type_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMessage:type:");
}

id objc_msgSend_initWithProtobufData_type_isResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProtobufData:type:isResponse:");
}

id objc_msgSend_initWithService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithService:");
}

id objc_msgSend_initWithTask_taskInfo_clientBundleIdentifier_secondaryIdentifier_monitoredApplication_priority_options_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTask:taskInfo:clientBundleIdentifier:secondaryIdentifier:monitoredApplication:priority:options:queue:");
}

id objc_msgSend_initWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:");
}

id objc_msgSend_initWithURL_destinationURL_options_delegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:destinationURL:options:delegate:queue:");
}

id objc_msgSend_initWithURLAsset_destinationURL_options_delegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURLAsset:destinationURL:options:delegate:queue:");
}

id objc_msgSend_initWithUUIDBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDBytes:");
}

id objc_msgSend_initWithUploadTask_uniqueIdentifier_bundleID_sessionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUploadTask:uniqueIdentifier:bundleID:sessionID:");
}

id objc_msgSend_initWithWrapper_monitoredApplication_priority_options_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithWrapper:monitoredApplication:priority:options:queue:");
}

id objc_msgSend_initializeHTTPAuthenticatorWithAppleIDContext_statusCodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initializeHTTPAuthenticatorWithAppleIDContext:statusCodes:");
}

id objc_msgSend_initializedWithAVAsset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initializedWithAVAsset");
}

id objc_msgSend_inputStreamWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inputStreamWithData:");
}

id objc_msgSend_inputStreamWithFileHandle_taskIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inputStreamWithFileHandle:taskIdentifier:");
}

id objc_msgSend_installedAssetVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "installedAssetVersion");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerValue");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidateAndCancel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateAndCancel");
}

id objc_msgSend_invalidateReply(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateReply");
}

id objc_msgSend_isAutomaticAppUpdatesAllowed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAutomaticAppUpdatesAllowed");
}

id objc_msgSend_isCatalogFetchedWithinThePastFewDays_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCatalogFetchedWithinThePastFewDays:");
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isConnected");
}

id objc_msgSend_isContainerIDForeground_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isContainerIDForeground:");
}

id objc_msgSend_isDefaultPairedDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDefaultPairedDevice");
}

id objc_msgSend_isDiscretionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDiscretionary");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFileURL");
}

id objc_msgSend_isForeground(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isForeground");
}

id objc_msgSend_isHandlingBackgroundURLSessionWithIdentifier_withSessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHandlingBackgroundURLSessionWithIdentifier:withSessionUUID:");
}

id objc_msgSend_isInSyncBubble(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInSyncBubble");
}

id objc_msgSend_isInTransitionalDiscretionaryPeriod(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInTransitionalDiscretionaryPeriod");
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMemberOfClass:");
}

id objc_msgSend_isMultiUser(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMultiUser");
}

id objc_msgSend_isNearby(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNearby");
}

id objc_msgSend_isPrivileged(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPrivileged");
}

id objc_msgSend_isResponse(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isResponse");
}

id objc_msgSend_isResumable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isResumable");
}

id objc_msgSend_isSpringBoardApp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSpringBoardApp");
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValid");
}

id objc_msgSend_isValidAssertion_withName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidAssertion:withName:");
}

id objc_msgSend_itemShouldBePurged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemShouldBePurged:");
}

id objc_msgSend_keysSortedByValueUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysSortedByValueUsingComparator:");
}

id objc_msgSend_knownSZExtractorImplementations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "knownSZExtractorImplementations");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_launchProcessWithIdentifier_sessionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launchProcessWithIdentifier:sessionIdentifier:");
}

id objc_msgSend_launchUUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launchUUID");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_loadingPriority(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadingPriority");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_lowThroughputTimerRetryCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lowThroughputTimerRetryCount");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_makeTempUploadFile_withExtensionData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeTempUploadFile:withExtensionData:");
}

id objc_msgSend_managerBecameEmpty_bundleID_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managerBecameEmpty:bundleID:withCompletionHandler:");
}

id objc_msgSend_markItemAsPurged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markItemAsPurged:");
}

id objc_msgSend_mayBeDemotedToDiscretionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mayBeDemotedToDiscretionary");
}

id objc_msgSend_maySupportWakesLater(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maySupportWakesLater");
}

id objc_msgSend_mergeFrom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeFrom:");
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "message");
}

id objc_msgSend_messageLoggableDescriptionForTaskWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageLoggableDescriptionForTaskWithIdentifier:");
}

id objc_msgSend_messagePriorityForTaskWithIdentifier_isReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messagePriorityForTaskWithIdentifier:isReply:");
}

id objc_msgSend_messageSubclassForMessageType_isReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageSubclassForMessageType:isReply:");
}

id objc_msgSend_migrateSchemaToLatestVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrateSchemaToLatestVersion:");
}

id objc_msgSend_monitorWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monitorWithConfiguration:");
}

id objc_msgSend_monitoredAppBundleID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monitoredAppBundleID");
}

id objc_msgSend_monitoredBundleIDsUpdated(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monitoredBundleIDsUpdated");
}

id objc_msgSend_moveFileAtomically_toLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveFileAtomically:toLocation:");
}

id objc_msgSend_moveInstalledAsset_withVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveInstalledAsset:withVersion:");
}

id objc_msgSend_moveItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveItemAtURL:toURL:error:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_networkServiceType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "networkServiceType");
}

id objc_msgSend_newAVAssetDownloadSessionWrapperForTaskInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newAVAssetDownloadSessionWrapperForTaskInfo:");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextObject");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "now");
}

id objc_msgSend_nsurlsessiondLaunchdPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nsurlsessiondLaunchdPath");
}

id objc_msgSend_nsurlsessiondPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nsurlsessiondPath");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "null");
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

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLong:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_numberWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedShort:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_obliterate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "obliterate");
}

id objc_msgSend_obliterationCompletion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "obliterationCompletion");
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "open");
}

id objc_msgSend_openApplication_withOptions_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openApplication:withOptions:completion:");
}

id objc_msgSend_openFileAtPath_mode_withReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openFileAtPath:mode:withReply:");
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "options");
}

id objc_msgSend_optionsWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optionsWithDictionary:");
}

id objc_msgSend_originalNetworkContentURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "originalNetworkContentURL");
}

id objc_msgSend_originalRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "originalRequest");
}

id objc_msgSend_outgoingResponseIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "outgoingResponseIdentifier");
}

id objc_msgSend_parametersWithCParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parametersWithCParameters:");
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "password");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "path");
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathExtension");
}

id objc_msgSend_pathToDownloadTaskFile(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathToDownloadTaskFile");
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pause");
}

id objc_msgSend_performAllCallbacks(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performAllCallbacks");
}

id objc_msgSend_performCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performCallback:");
}

id objc_msgSend_performCallbackAfterNetworkChangedEvent_identifier_delay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performCallbackAfterNetworkChangedEvent:identifier:delay:");
}

id objc_msgSend_performCallbackAfterNetworkChangedEvent_identifier_numberOfPreviousRetries_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performCallbackAfterNetworkChangedEvent:identifier:numberOfPreviousRetries:");
}

id objc_msgSend_performCommonSetupForTask_taskInfo_identifier_discretionaryStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performCommonSetupForTask:taskInfo:identifier:discretionaryStatus:");
}

id objc_msgSend_performForwardingFromStreamTask_toTCPConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performForwardingFromStreamTask:toTCPConnection:");
}

id objc_msgSend_performForwardingFromTCPConnection_toStreamTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performForwardingFromTCPConnection:toStreamTask:");
}

id objc_msgSend_performSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:");
}

id objc_msgSend_performWake_uponNotification_sessionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performWake:uponNotification:sessionIdentifier:");
}

id objc_msgSend_persistence(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistence");
}

id objc_msgSend_persistentDomainForName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistentDomainForName:");
}

id objc_msgSend_personaUniqueString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personaUniqueString");
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pid");
}

id objc_msgSend_plugInKitPlugins(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "plugInKitPlugins");
}

id objc_msgSend_pluginIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pluginIdentifier");
}

id objc_msgSend_populateWithInitialCredentials(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "populateWithInitialCredentials");
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "port");
}

id objc_msgSend_predicateMatchingBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateMatchingBundleIdentifier:");
}

id objc_msgSend_predicateMatchingBundleIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateMatchingBundleIdentifiers:");
}

id objc_msgSend_prepareForExtractionToPath_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareForExtractionToPath:completionBlock:");
}

id objc_msgSend_previousFailureCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "previousFailureCount");
}

id objc_msgSend_previousState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "previousState");
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "priority");
}

id objc_msgSend_priorityForDiscretionaryStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "priorityForDiscretionaryStatus:");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processInfo");
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "progress");
}

id objc_msgSend_propertyForKey_inRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyForKey:inRequest:");
}

id objc_msgSend_propertyList(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyList");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_proposedCredential(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "proposedCredential");
}

id objc_msgSend_protectionSpace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "protectionSpace");
}

id objc_msgSend_protocol(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "protocol");
}

id objc_msgSend_providerIDForApplication_sharedContainerIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providerIDForApplication:sharedContainerIdentifier:");
}

id objc_msgSend_providerIDForBundle_sharedContainerIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providerIDForBundle:sharedContainerIdentifier:");
}

id objc_msgSend_proxyServerBecameInvalid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "proxyServerBecameInvalid:");
}

id objc_msgSend_purge_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purge:");
}

id objc_msgSend_qos(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "qos");
}

id objc_msgSend_queryAndFindBestAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryAndFindBestAsset:");
}

id objc_msgSend_queryMetaDataSync(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryMetaDataSync");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queue");
}

id objc_msgSend_queueUpdatesForTask_updateType_highPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queueUpdatesForTask:updateType:highPriority:");
}

id objc_msgSend_readDataOfMinLength_maxLength_timeout_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readDataOfMinLength:maxLength:timeout:completionHandler:");
}

id objc_msgSend_realm(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "realm");
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reason");
}

id objc_msgSend_reconnectClient_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reconnectClient:withCompletion:");
}

id objc_msgSend_registerUserSyncStakeholder_withMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerUserSyncStakeholder:withMachServiceName:");
}

id objc_msgSend_releaseAssertionForBundleID_sessionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "releaseAssertionForBundleID:sessionID:");
}

id objc_msgSend_releaseBTLinkAssertion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "releaseBTLinkAssertion");
}

id objc_msgSend_releaseBTLinkAssertionIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "releaseBTLinkAssertionIfNecessary:");
}

id objc_msgSend_releaseInfraWiFi(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "releaseInfraWiFi");
}

id objc_msgSend_releaseInfraWiFiForTaskIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "releaseInfraWiFiForTaskIfNecessary:");
}

id objc_msgSend_releasePowerAssertion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "releasePowerAssertion");
}

id objc_msgSend_releaseTransaction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "releaseTransaction");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeCharactersInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeCharactersInString:");
}

id objc_msgSend_removeCredential_forProtectionSpace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeCredential:forProtectionSpace:");
}

id objc_msgSend_removeDownloadFileForTaskInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDownloadFileForTaskInfo:");
}

id objc_msgSend_removeItemAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeItemAtURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeLastObject");
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

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_forApplication_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forApplication:");
}

id objc_msgSend_removeObserver_forContainerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forContainerID:");
}

id objc_msgSend_removeObserver_forExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forExtension:");
}

id objc_msgSend_removeObserver_forProviderID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forProviderID:");
}

id objc_msgSend_removeOutstandingTaskWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeOutstandingTaskWithIdentifier:");
}

id objc_msgSend_removePendingLaunchForBundleID_sessionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePendingLaunchForBundleID:sessionID:");
}

id objc_msgSend_removePendingWakeForClient_sessionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePendingWakeForClient:sessionIdentifier:");
}

id objc_msgSend_removeStreamingZipModificationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeStreamingZipModificationDate:");
}

id objc_msgSend_removeUploadFileForTaskInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeUploadFileForTaskInfo:");
}

id objc_msgSend_replaceItemAtURL_withItemAtURL_backupItemName_options_resultingItemURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "request");
}

id objc_msgSend_requestDelayQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestDelayQueue");
}

id objc_msgSend_requestWithAdjustedWindowForTaskInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithAdjustedWindowForTaskInfo:");
}

id objc_msgSend_requeueTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requeueTask:");
}

id objc_msgSend_requeueTask_skipResume_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requeueTask:skipResume:");
}

id objc_msgSend_resendPendingMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resendPendingMessage:");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reset");
}

id objc_msgSend_resetStandardUserDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetStandardUserDefaults");
}

id objc_msgSend_resourceTimeoutError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resourceTimeoutError");
}

id objc_msgSend_respondedToWillBeginDelayedRequestCallback(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "respondedToWillBeginDelayedRequestCallback");
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "response");
}

id objc_msgSend_restoreCompletedTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreCompletedTask:");
}

id objc_msgSend_restoreInProgressTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreInProgressTask:");
}

id objc_msgSend_restoreOptionsFromArchivePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreOptionsFromArchivePath:");
}

id objc_msgSend_restoreState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreState");
}

id objc_msgSend_restoreState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreState:");
}

id objc_msgSend_restoreTask_isOutstanding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreTask:isOutstanding:");
}

id objc_msgSend_restoreTasks_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreTasks:");
}

id objc_msgSend_restoreTasksFromArchivedInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreTasksFromArchivedInfo:");
}

id objc_msgSend_restoreTasksFromSqliteDB_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreTasksFromSqliteDB:");
}

id objc_msgSend_restoredTaskActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoredTaskActive:");
}

id objc_msgSend_restoredTaskEnqueued_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoredTaskEnqueued:");
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "results");
}

id objc_msgSend_resumableUploadData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resumableUploadData");
}

id objc_msgSend_resumableUploadState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resumableUploadState");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resume");
}

id objc_msgSend_resumeTaskWithIdentifier_withProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resumeTaskWithIdentifier:withProperties:");
}

id objc_msgSend_resumedAndWaitingForEarliestBeginDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resumedAndWaitingForEarliestBeginDate");
}

id objc_msgSend_retainBTLinkAssertion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retainBTLinkAssertion");
}

id objc_msgSend_retainBTLinkAssertionWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retainBTLinkAssertionWithIdentifier:");
}

id objc_msgSend_retainInfraWiFi(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retainInfraWiFi");
}

id objc_msgSend_retainInfraWiFiForTaskWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retainInfraWiFiForTaskWithIdentifier:");
}

id objc_msgSend_retryCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retryCount");
}

id objc_msgSend_retryError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retryError");
}

id objc_msgSend_retryTask_originalError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retryTask:originalError:");
}

id objc_msgSend_retryTask_originalError_transactionMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retryTask:originalError:transactionMetrics:");
}

id objc_msgSend_returnTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "returnTypes:");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "run");
}

id objc_msgSend_rusWithResumeData_originalRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rusWithResumeData:originalRequest:");
}

id objc_msgSend_sanitizeTaskProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sanitizeTaskProperties:");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheme");
}

id objc_msgSend_secondaryID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secondaryID");
}

id objc_msgSend_sendProtobuf_toDestinations_priority_options_identifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendProtobuf:toDestinations:priority:options:identifier:error:");
}

id objc_msgSend_sendProtobufMessage_ofType_withReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendProtobufMessage:ofType:withReply:");
}

id objc_msgSend_sequenceNumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sequenceNumber");
}

id objc_msgSend_serverTrust(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverTrust");
}

id objc_msgSend_serviceMinCompatibilityVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceMinCompatibilityVersion");
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceWithDefaultShellEndpoint");
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session");
}

id objc_msgSend_sessionCompleted_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionCompleted:withCompletionHandler:");
}

id objc_msgSend_sessionForDiscretionaryStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionForDiscretionaryStatus:");
}

id objc_msgSend_sessionHasOutstandingTasks(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionHasOutstandingTasks");
}

id objc_msgSend_sessionID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionID");
}

id objc_msgSend_sessionIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionIdentifier");
}

id objc_msgSend_sessionPath_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionPath:forBundleID:");
}

id objc_msgSend_sessionSendsLaunchEvents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionSendsLaunchEvents");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set");
}

id objc_msgSend_setAVAssetDownloadToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAVAssetDownloadToken:");
}

id objc_msgSend_setAVAssetURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAVAssetURL:");
}

id objc_msgSend_setAVURLAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAVURLAsset:");
}

id objc_msgSend_setAdditionalProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdditionalProperties:");
}

id objc_msgSend_setAllowsCellularAccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsCellularAccess:");
}

id objc_msgSend_setAllowsConstrainedNetworkAccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsConstrainedNetworkAccess:");
}

id objc_msgSend_setAllowsExpensiveNetworkAccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsExpensiveNetworkAccess:");
}

id objc_msgSend_setArchiveList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArchiveList:");
}

id objc_msgSend_setArgs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArgs:");
}

id objc_msgSend_setAssetArtworkData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssetArtworkData:");
}

id objc_msgSend_setAssetOptionsPlist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssetOptionsPlist:");
}

id objc_msgSend_setAssetTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssetTitle:");
}

id objc_msgSend_setAttributes_ofItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributes:ofItemAtPath:error:");
}

id objc_msgSend_setAvAssetDownloadChildDownloadSessionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAvAssetDownloadChildDownloadSessionIdentifier:");
}

id objc_msgSend_setBasePriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBasePriority:");
}

id objc_msgSend_setBasePrioritySetExplicitly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBasePrioritySetExplicitly:");
}

id objc_msgSend_setBodyData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBodyData:");
}

id objc_msgSend_setBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleID:");
}

id objc_msgSend_setBundleId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleId:");
}

id objc_msgSend_setByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setByAddingObject:");
}

id objc_msgSend_setBytesPerSecondLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBytesPerSecondLimit:");
}

id objc_msgSend_setBytesSent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBytesSent:");
}

id objc_msgSend_setChallenge_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChallenge:");
}

id objc_msgSend_setCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCode:");
}

id objc_msgSend_setConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfiguration:");
}

id objc_msgSend_setConnectionProxyDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConnectionProxyDictionary:");
}

id objc_msgSend_setCountOfBytesClientExpectsToReceive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountOfBytesClientExpectsToReceive:");
}

id objc_msgSend_setCountOfBytesClientExpectsToSend_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountOfBytesClientExpectsToSend:");
}

id objc_msgSend_setCountOfBytesExpectedToReceive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountOfBytesExpectedToReceive:");
}

id objc_msgSend_setCountOfBytesExpectedToSend_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountOfBytesExpectedToSend:");
}

id objc_msgSend_setCountOfBytesExpectedToWrite_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountOfBytesExpectedToWrite:");
}

id objc_msgSend_setCountOfBytesReceived_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountOfBytesReceived:");
}

id objc_msgSend_setCountOfBytesSent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountOfBytesSent:");
}

id objc_msgSend_setCountOfBytesWritten_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountOfBytesWritten:");
}

id objc_msgSend_setCreationTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCreationTime:");
}

id objc_msgSend_setCredential_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCredential:");
}

id objc_msgSend_setCurrentRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentRequest:");
}

id objc_msgSend_setCurrentRequestDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentRequestDelay:");
}

id objc_msgSend_setDefaultCredential_forProtectionSpace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultCredential:forProtectionSpace:");
}

id objc_msgSend_setDeferred_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeferred:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDelegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:queue:");
}

id objc_msgSend_setDestinationURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDestinationURL:");
}

id objc_msgSend_setDisablesRetry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisablesRetry:");
}

id objc_msgSend_setDiscretionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiscretionary:");
}

id objc_msgSend_setDiscretionaryOverride_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiscretionaryOverride:");
}

id objc_msgSend_setDisposition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisposition:");
}

id objc_msgSend_setDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDomain:");
}

id objc_msgSend_setDownloadConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownloadConfig:");
}

id objc_msgSend_setDownloadFileURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownloadFileURL:");
}

id objc_msgSend_setDownloadSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownloadSession:");
}

id objc_msgSend_setDownloadSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownloadSize:");
}

id objc_msgSend_setEarliestBeginDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEarliestBeginDate:");
}

id objc_msgSend_setEnableSPIDelegateCallbacks_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnableSPIDelegateCallbacks:");
}

id objc_msgSend_setEndowmentNamespaces_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndowmentNamespaces:");
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setError:");
}

id objc_msgSend_setEstablishedConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEstablishedConnection:");
}

id objc_msgSend_setEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEvents:");
}

id objc_msgSend_setExpectedProgressTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpectedProgressTarget:");
}

id objc_msgSend_setExpectingResumeCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpectingResumeCallback:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFileURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFileURL:");
}

id objc_msgSend_setHTTPAdditionalHeaders_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPAdditionalHeaders:");
}

id objc_msgSend_setHTTPBodyStream_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPBodyStream:");
}

id objc_msgSend_setHTTPCookieStorage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPCookieStorage:");
}

id objc_msgSend_setHTTPMaximumConnectionsPerHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPMaximumConnectionsPerHost:");
}

id objc_msgSend_setHandlerQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandlerQueue:");
}

id objc_msgSend_setHasBeenCalled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasBeenCalled:");
}

id objc_msgSend_setHasStarted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasStarted:");
}

id objc_msgSend_setHeaderData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeaderData:");
}

id objc_msgSend_setHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHost:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIdsPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdsPriority:");
}

id objc_msgSend_setInSyncBubble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInSyncBubble:");
}

id objc_msgSend_setInitializedWithAVAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitializedWithAVAsset:");
}

id objc_msgSend_setInstalledAssetVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInstalledAssetVersion:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidateReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidateReply:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIsInTransitionalDiscretionaryPeriod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsInTransitionalDiscretionaryPeriod:");
}

id objc_msgSend_setLaunchUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLaunchUUID:");
}

id objc_msgSend_setLinkRequirementsForPeer_packetsPerSecond_inputBytesPerSecond_outputBytesPerSecond_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLinkRequirementsForPeer:packetsPerSecond:inputBytesPerSecond:outputBytesPerSecond:");
}

id objc_msgSend_setLoadingPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLoadingPriority:");
}

id objc_msgSend_setLowThroughputTimerRetryCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLowThroughputTimerRetryCount:");
}

id objc_msgSend_setMayBeDemotedToDiscretionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMayBeDemotedToDiscretionary:");
}

id objc_msgSend_setNetworkServiceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNetworkServiceType:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setObliterationCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObliterationCompletion:");
}

id objc_msgSend_setOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOptions:");
}

id objc_msgSend_setOriginalRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOriginalRequest:");
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPath:");
}

id objc_msgSend_setPathToDownloadTaskFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPathToDownloadTaskFile:");
}

id objc_msgSend_setPersonaUniqueString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersonaUniqueString:");
}

id objc_msgSend_setPreClearedMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreClearedMode:");
}

id objc_msgSend_setPredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPredicates:");
}

id objc_msgSend_setPreferInfraWiFi_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferInfraWiFi:");
}

id objc_msgSend_setPriority_forTCPConnectionWithTaskIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPriority:forTCPConnectionWithTaskIdentifier:");
}

id objc_msgSend_setPrivileged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrivileged:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_setQos_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQos:");
}

id objc_msgSend_setReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReason:");
}

id objc_msgSend_setReceivedData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReceivedData:");
}

id objc_msgSend_setRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequest:");
}

id objc_msgSend_setRequiresInexpensiveNetworking_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiresInexpensiveNetworking:");
}

id objc_msgSend_setRequiresNetwork_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiresNetwork:");
}

id objc_msgSend_setRequiresPlugin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiresPlugin:");
}

id objc_msgSend_setResolvedMediaSelectionPlist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResolvedMediaSelectionPlist:");
}

id objc_msgSend_setRespondedToWillBeginDelayedRequestCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRespondedToWillBeginDelayedRequestCallback:");
}

id objc_msgSend_setResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResponse:");
}

id objc_msgSend_setResumableUploadData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResumableUploadData:");
}

id objc_msgSend_setResumableUploadState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResumableUploadState:");
}

id objc_msgSend_setResumedAndWaitingForEarliestBeginDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResumedAndWaitingForEarliestBeginDate:");
}

id objc_msgSend_setRetryCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRetryCount:");
}

id objc_msgSend_setRetryError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRetryError:");
}

id objc_msgSend_setSchedulingPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSchedulingPriority:");
}

id objc_msgSend_setSequenceNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSequenceNumber:");
}

id objc_msgSend_setSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSession:");
}

id objc_msgSend_setSessionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessionID:");
}

id objc_msgSend_setSessionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessionIdentifier:");
}

id objc_msgSend_setSharedContainerIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSharedContainerIdentifier:");
}

id objc_msgSend_setShouldCancelOnDisconnect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldCancelOnDisconnect:");
}

id objc_msgSend_setShouldUseExtendedBackgroundIdleMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldUseExtendedBackgroundIdleMode:");
}

id objc_msgSend_setSkip_download_unlink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSkip_download_unlink:");
}

id objc_msgSend_setSocketUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSocketUUID:");
}

id objc_msgSend_setStartBefore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartBefore:");
}

id objc_msgSend_setStartHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartHandler:");
}

id objc_msgSend_setStartTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartTime:");
}

id objc_msgSend_setStartedUserInitiated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartedUserInitiated:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:");
}

id objc_msgSend_setStateDescriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStateDescriptor:");
}

id objc_msgSend_setStoragePartitionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStoragePartitionIdentifier:");
}

id objc_msgSend_setStreamErrorCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStreamErrorCode:");
}

id objc_msgSend_setStreamErrorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStreamErrorDomain:");
}

id objc_msgSend_setSuspendCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuspendCount:");
}

id objc_msgSend_setSuspendHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuspendHandler:");
}

id objc_msgSend_setTLSMaximumSupportedProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTLSMaximumSupportedProtocol:");
}

id objc_msgSend_setTLSMinimumSupportedProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTLSMinimumSupportedProtocol:");
}

id objc_msgSend_setTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTask:");
}

id objc_msgSend_setTaskDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskDescription:");
}

id objc_msgSend_setTaskIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskIdentifier:");
}

id objc_msgSend_setTaskInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskInfo:");
}

id objc_msgSend_setTaskKind_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskKind:");
}

id objc_msgSend_setTaskMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskMetrics:");
}

id objc_msgSend_setTemporaryDestinationURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTemporaryDestinationURL:");
}

id objc_msgSend_setThroughputTimerForCurrentInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setThroughputTimerForCurrentInterval");
}

id objc_msgSend_setTimeoutIntervalForRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeoutIntervalForRequest:");
}

id objc_msgSend_setTimeoutIntervalForResource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeoutIntervalForResource:");
}

id objc_msgSend_setTotalBytesExpectedToSend_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTotalBytesExpectedToSend:");
}

id objc_msgSend_setTotalBytesSent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTotalBytesSent:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setType:");
}

id objc_msgSend_setURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setURL:");
}

id objc_msgSend_setURLCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setURLCache:");
}

id objc_msgSend_setURLCredentialStorage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setURLCredentialStorage:");
}

id objc_msgSend_setUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUniqueIdentifier:");
}

id objc_msgSend_setUpdateHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateHandler:");
}

id objc_msgSend_setUploadFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUploadFile:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setUuidString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUuidString:");
}

id objc_msgSend_setValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forHTTPHeaderField:");
}

id objc_msgSend_setValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValues:");
}

id objc_msgSend_setWaitsForConnectivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWaitsForConnectivity:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setWorkState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWorkState");
}

id objc_msgSend_setXPCConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setXPCConnection:");
}

id objc_msgSend_set_DuetActivityProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_DuetActivityProperties:");
}

id objc_msgSend_set_IDSMessageTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_IDSMessageTimeout:");
}

id objc_msgSend_set_TCPAdaptiveReadTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_TCPAdaptiveReadTimeout:");
}

id objc_msgSend_set_TCPAdaptiveWriteTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_TCPAdaptiveWriteTimeout:");
}

id objc_msgSend_set_TLSMaximumSupportedProtocolVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_TLSMaximumSupportedProtocolVersion:");
}

id objc_msgSend_set_TLSMinimumSupportedProtocolVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_TLSMinimumSupportedProtocolVersion:");
}

id objc_msgSend_set_allowsHSTSWithUntrustedRootCertificate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_allowsHSTSWithUntrustedRootCertificate:");
}

id objc_msgSend_set_allowsPowerNapScheduling_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_allowsPowerNapScheduling:");
}

id objc_msgSend_set_allowsTLSECH_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_allowsTLSECH:");
}

id objc_msgSend_set_allowsTLSFallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_allowsTLSFallback:");
}

id objc_msgSend_set_allowsTLSFalseStart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_allowsTLSFalseStart:");
}

id objc_msgSend_set_allowsVirtualInterfaces_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_allowsVirtualInterfaces:");
}

id objc_msgSend_set_alwaysPerformDefaultTrustEvaluation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_alwaysPerformDefaultTrustEvaluation:");
}

id objc_msgSend_set_atsContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_atsContext:");
}

id objc_msgSend_set_attributedBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_attributedBundleIdentifier:");
}

id objc_msgSend_set_authenticatorConfiguredViaTaskProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_authenticatorConfiguredViaTaskProperty:");
}

id objc_msgSend_set_authenticatorStatusCodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_authenticatorStatusCodes:");
}

id objc_msgSend_set_backgroundPublishingURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_backgroundPublishingURL:");
}

id objc_msgSend_set_backgroundTrailers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_backgroundTrailers:");
}

id objc_msgSend_set_bytesPerSecondLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_bytesPerSecondLimit:");
}

id objc_msgSend_set_clientIsNotExplicitlyDiscretionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_clientIsNotExplicitlyDiscretionary:");
}

id objc_msgSend_set_connectionCachePurgeTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_connectionCachePurgeTimeout:");
}

id objc_msgSend_set_connectionPoolName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_connectionPoolName:");
}

id objc_msgSend_set_directoryForDownloadedFiles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_directoryForDownloadedFiles:");
}

id objc_msgSend_set_disallowCellular_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_disallowCellular:");
}

id objc_msgSend_set_discretionaryOverride_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_discretionaryOverride:");
}

id objc_msgSend_set_doesSZExtractorConsumeExtractedData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_doesSZExtractorConsumeExtractedData:");
}

id objc_msgSend_set_duetPreClearedMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_duetPreClearedMode:");
}

id objc_msgSend_set_duetPreauthorized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_duetPreauthorized:");
}

id objc_msgSend_set_expectedProgressTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_expectedProgressTarget:");
}

id objc_msgSend_set_extractor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_extractor:");
}

id objc_msgSend_set_extractorPreparedForExtraction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_extractorPreparedForExtraction:");
}

id objc_msgSend_set_forcedNetworkServiceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_forcedNetworkServiceType:");
}

id objc_msgSend_set_hasSZExtractor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_hasSZExtractor:");
}

id objc_msgSend_set_legacySocketStreamProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_legacySocketStreamProperties:");
}

id objc_msgSend_set_loadingPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_loadingPriority:");
}

id objc_msgSend_set_loggingPrivacyLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_loggingPrivacyLevel:");
}

id objc_msgSend_set_longLivedConnectionCachePurgeTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_longLivedConnectionCachePurgeTimeout:");
}

id objc_msgSend_set_maximumWatchCellularTransferSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_maximumWatchCellularTransferSize:");
}

id objc_msgSend_set_metrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_metrics:");
}

id objc_msgSend_set_multipathAlternatePort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_multipathAlternatePort:");
}

id objc_msgSend_set_neTrackerTCCResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_neTrackerTCCResult:");
}

id objc_msgSend_set_nw_activity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_nw_activity:");
}

id objc_msgSend_set_onBehalfOfPairedDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_onBehalfOfPairedDevice:");
}

id objc_msgSend_set_pathToDownloadTaskFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_pathToDownloadTaskFile:");
}

id objc_msgSend_set_pidForHAR_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_pidForHAR:");
}

id objc_msgSend_set_preconnect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_preconnect:");
}

id objc_msgSend_set_prefersInfraWiFi_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_prefersInfraWiFi:");
}

id objc_msgSend_set_preventsIdleSleepOnceConnected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_preventsIdleSleepOnceConnected:");
}

id objc_msgSend_set_priority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_priority:");
}

id objc_msgSend_set_reportsDataStalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_reportsDataStalls:");
}

id objc_msgSend_set_requiresClientToOpenFiles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_requiresClientToOpenFiles:");
}

id objc_msgSend_set_requiresPowerPluggedIn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_requiresPowerPluggedIn:");
}

id objc_msgSend_set_requiresSustainedDataDelivery_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_requiresSustainedDataDelivery:");
}

id objc_msgSend_set_respectsAllowsCellularAccessForDiscretionaryTasks_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_respectsAllowsCellularAccessForDiscretionaryTasks:");
}

id objc_msgSend_set_shouldSkipPreferredClientCertificateLookup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_shouldSkipPreferredClientCertificateLookup:");
}

id objc_msgSend_set_socketStreamProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_socketStreamProperties:");
}

id objc_msgSend_set_sourceApplicationAuditTokenData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_sourceApplicationAuditTokenData:");
}

id objc_msgSend_set_sourceApplicationBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_sourceApplicationBundleIdentifier:");
}

id objc_msgSend_set_sourceApplicationBundleIdentifierForMobileAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_sourceApplicationBundleIdentifierForMobileAsset:");
}

id objc_msgSend_set_sourceApplicationSecondaryIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_sourceApplicationSecondaryIdentifier:");
}

id objc_msgSend_set_storagePartitionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_storagePartitionIdentifier:");
}

id objc_msgSend_set_suspensionThreshhold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_suspensionThreshhold:");
}

id objc_msgSend_set_tcpConnectionPoolName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_tcpConnectionPoolName:");
}

id objc_msgSend_set_timeoutIntervalForResource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_timeoutIntervalForResource:");
}

id objc_msgSend_set_timingDataOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_timingDataOptions:");
}

id objc_msgSend_set_tlsSessionCachePrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_tlsSessionCachePrefix:");
}

id objc_msgSend_set_tlsTrustPinningPolicyName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_tlsTrustPinningPolicyName:");
}

id objc_msgSend_set_uniqueIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_uniqueIdentifier:");
}

id objc_msgSend_set_updatedStreamingZipModificationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_updatedStreamingZipModificationDate:");
}

id objc_msgSend_set_watchExtensionBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_watchExtensionBundleIdentifier:");
}

id objc_msgSend_setupArchiveTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupArchiveTimer");
}

id objc_msgSend_setupDASPropertiesOnTask_taskInfo_discretionaryStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupDASPropertiesOnTask:taskInfo:discretionaryStatus:");
}

id objc_msgSend_setupDelayTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupDelayTimer");
}

id objc_msgSend_setupDelayedCompletionWakeTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupDelayedCompletionWakeTimer");
}

id objc_msgSend_setupDownloadDirectory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupDownloadDirectory");
}

id objc_msgSend_setupNewClassMappingsForUnarchiver(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupNewClassMappingsForUnarchiver");
}

id objc_msgSend_setupThroughputMonitorForWrapper_taskInfo_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupThroughputMonitorForWrapper:taskInfo:identifier:");
}

id objc_msgSend_setupTransitionalDiscretionaryPeriodTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupTransitionalDiscretionaryPeriodTimer");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedConnection");
}

id objc_msgSend_sharedContainerIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedContainerIdentifier");
}

id objc_msgSend_sharedCredentialStorage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedCredentialStorage");
}

id objc_msgSend_sharedDaemon(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedDaemon");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedLauncher(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedLauncher");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_sharedMonitor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedMonitor");
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedScheduler");
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedService");
}

id objc_msgSend_sharedSpringBoard(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedSpringBoard");
}

id objc_msgSend_sharedStakeholder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedStakeholder");
}

id objc_msgSend_sharedUserEventAgentConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedUserEventAgentConnection");
}

id objc_msgSend_shouldCancel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldCancel");
}

id objc_msgSend_shouldCancelOnDisconnect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldCancelOnDisconnect");
}

id objc_msgSend_shouldElevateDiscretionaryPriority(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldElevateDiscretionaryPriority");
}

id objc_msgSend_shouldRetainBTLinkAssertion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldRetainBTLinkAssertion");
}

id objc_msgSend_shouldRetainInfraWiFi(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldRetainInfraWiFi");
}

id objc_msgSend_simulateNetworkChangedEvent_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "simulateNetworkChangedEvent:identifier:");
}

id objc_msgSend_socketUUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "socketUUID");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_sourceApplicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceApplicationBundleIdentifier");
}

id objc_msgSend_springBoardApplicationExistsWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "springBoardApplicationExistsWithIdentifier:");
}

id objc_msgSend_springboardApplicationWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "springboardApplicationWithBundleIdentifier:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "start");
}

id objc_msgSend_startAVAssetDownloadSessionWithTaskIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAVAssetDownloadSessionWithTaskIdentifier:");
}

id objc_msgSend_startBridgingUMTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startBridgingUMTask:");
}

id objc_msgSend_startCatalogDownload_then_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startCatalogDownload:then:");
}

id objc_msgSend_startDownload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startDownload:");
}

id objc_msgSend_startLoadingMetadata(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startLoadingMetadata");
}

id objc_msgSend_startMonitoringBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startMonitoringBundleID:");
}

id objc_msgSend_startResourceTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startResourceTimer");
}

id objc_msgSend_startThroughputMonitoring(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startThroughputMonitoring");
}

id objc_msgSend_startThroughputMonitoringIfAppropriate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startThroughputMonitoringIfAppropriate");
}

id objc_msgSend_startTransitionalDiscretionaryPeriodTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startTransitionalDiscretionaryPeriodTimer");
}

id objc_msgSend_startUMTask_taskInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startUMTask:taskInfo:");
}

id objc_msgSend_startedUserInitiated(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startedUserInitiated");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "state");
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "status");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusCode");
}

id objc_msgSend_statusMonitor_callbackForIdentifier_networkChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusMonitor:callbackForIdentifier:networkChanged:");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stop");
}

id objc_msgSend_stopMonitoringBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopMonitoringBundleID:");
}

id objc_msgSend_stopThroughputMonitoring(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopThroughputMonitoring");
}

id objc_msgSend_storagePartitionIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storagePartitionIdentifier");
}

id objc_msgSend_streamError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "streamError");
}

id objc_msgSend_streamStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "streamStatus");
}

id objc_msgSend_streamTaskWithHostName_port_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "streamTaskWithHostName:port:");
}

id objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByDeletingLastPathComponent");
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCapacity:");
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

id objc_msgSend_submitActivity_inGroupWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitActivity:inGroupWithName:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_supportsRedirects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsRedirects");
}

id objc_msgSend_supportsWakes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsWakes");
}

id objc_msgSend_suspend(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suspend");
}

id objc_msgSend_suspendCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suspendCount");
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronousRemoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_takeAssertionForBundleID_sessionID_sessionUUID_pid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "takeAssertionForBundleID:sessionID:sessionUUID:pid:");
}

id objc_msgSend_takePowerAssertion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "takePowerAssertion");
}

id objc_msgSend_targetWithPid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "targetWithPid:");
}

id objc_msgSend_task(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "task");
}

id objc_msgSend_taskDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskDescription");
}

id objc_msgSend_taskIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskIdentifier");
}

id objc_msgSend_taskInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskInfo");
}

id objc_msgSend_taskKind(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskKind");
}

id objc_msgSend_taskMessageForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskMessageForIdentifier:");
}

id objc_msgSend_taskMetrics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskMetrics");
}

id objc_msgSend_taskSequenceNumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskSequenceNumber");
}

id objc_msgSend_taskShouldResume_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskShouldResume:");
}

id objc_msgSend_taskShouldSuspend_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskShouldSuspend:");
}

id objc_msgSend_taskState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskState");
}

id objc_msgSend_taskTransferredData_countOfBytesReceived_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskTransferredData:countOfBytesReceived:");
}

id objc_msgSend_taskWillResume(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskWillResume");
}

id objc_msgSend_taskWillSuspend(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskWillSuspend");
}

id objc_msgSend_taskWithIdentifier_didCompleteWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskWithIdentifier:didCompleteWithError:");
}

id objc_msgSend_taskWithName_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskWithName:reason:");
}

id objc_msgSend_taskWithName_reason_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskWithName:reason:forBundleID:");
}

id objc_msgSend_tasksArchivePath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tasksArchivePath");
}

id objc_msgSend_tasksHaveBeenEnqueued(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tasksHaveBeenEnqueued");
}

id objc_msgSend_temporaryDestinationURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "temporaryDestinationURL");
}

id objc_msgSend_terminateExtractorWithError_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "terminateExtractorWithError:completion:");
}

id objc_msgSend_terminateStreamWithError_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "terminateStreamWithError:completionBlock:");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceReferenceDate");
}

id objc_msgSend_timeoutIntervalForRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeoutIntervalForRequest");
}

id objc_msgSend_timeoutIntervalForResource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeoutIntervalForResource");
}

id objc_msgSend_trustPassesExtendedValidation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trustPassesExtendedValidation:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "type");
}

id objc_msgSend_unarchivedDictionaryWithKeysOfClass_objectsOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedDictionaryWithKeysOfClass:objectsOfClass:fromData:error:");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uniqueIdentifier");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_updateConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateConfiguration:");
}

id objc_msgSend_updateCurrentRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCurrentRequest:");
}

id objc_msgSend_updateOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateOptions:");
}

id objc_msgSend_updatePriorityForTaskID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePriorityForTaskID:");
}

id objc_msgSend_updateStreamingZipModificationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateStreamingZipModificationDate:");
}

id objc_msgSend_updateTaskInfoBasedOnCurrentDiscretionaryStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTaskInfoBasedOnCurrentDiscretionaryStatus:");
}

id objc_msgSend_uploadTaskWithRequest_fromFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uploadTaskWithRequest:fromFile:");
}

id objc_msgSend_uploadTaskWithStreamedRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uploadTaskWithStreamedRequest:");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uppercaseString");
}

id objc_msgSend_user(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "user");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userPersonaUniqueString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userPersonaUniqueString");
}

id objc_msgSend_usesContainerManagerForAVAsset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "usesContainerManagerForAVAsset");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uuid");
}

id objc_msgSend_uuidString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uuidString");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueWithBytes_objCType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithBytes:objCType:");
}

id objc_msgSend_valueWithCMTimeRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithCMTimeRange:");
}

id objc_msgSend_verifyAndUpdateIncomingSequenceNumber_forPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyAndUpdateIncomingSequenceNumber:forPriority:");
}

id objc_msgSend_waitUntilDeviceIsUnlocked(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waitUntilDeviceIsUnlocked");
}

id objc_msgSend_wakeForSessionIdentifier_withSessionUUID_wakeRequirement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wakeForSessionIdentifier:withSessionUUID:wakeRequirement:");
}

id objc_msgSend_wakeUpApp_forSession_withSessionUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wakeUpApp:forSession:withSessionUUID:");
}

id objc_msgSend_wakeUpClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wakeUpClient:");
}

id objc_msgSend_wakeUpExtension_forSession_withSessionUUID_wakeRequirement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wakeUpExtension:forSession:withSessionUUID:wakeRequirement:");
}

id objc_msgSend_willRetryBackgroundDataTask_withError_transactionMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willRetryBackgroundDataTask:withError:transactionMetrics:");
}

id objc_msgSend_withWorkQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "withWorkQueue:");
}

id objc_msgSend_wrapperTransferredData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wrapperTransferredData:");
}

id objc_msgSend_wrapperWillSuspend(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wrapperWillSuspend");
}

id objc_msgSend_write_maxLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "write:maxLength:");
}

id objc_msgSend_writeData_timeout_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeData:timeout:completionHandler:");
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:atomically:");
}
