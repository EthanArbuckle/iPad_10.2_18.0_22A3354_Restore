uint64_t start()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v0 = objc_autoreleasePoolPush();
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "arguments"));

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v4)
  {
LABEL_9:

    sub_100002470();
  }
  v5 = v4;
  v6 = *(_QWORD *)v12;
LABEL_3:
  v7 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v6)
      objc_enumerationMutation(v3);
    if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "containsString:", CFSTR("LAUNCHED_BY_LAUNCHD"), (_QWORD)v11) & 1) != 0)break;
    if (v5 == (id)++v7)
    {
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (!v5)
        goto LABEL_9;
      goto LABEL_3;
    }
  }

  if (!getuid())
    sub_100002578();
  v8 = (void *)objc_opt_new(RTLifeCycleManager);
  objc_msgSend(v8, "start");

  objc_autoreleasePoolPop(v0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  objc_msgSend(v9, "run");

  return 0;
}

void sub_100002470()
{
  id v0;
  NSObject *v1;
  id v2;
  const char *v3;
  id v4;
  const char *v5;
  id v6;
  const char *v7;
  uint8_t v8[16];

  v0 = sub_100002614(&qword_1000082A8);
  v1 = objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "routined was not launchd by launchd.", v8, 2u);
  }

  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("routined was not launchd by launchd.\n"))));
  v3 = (const char *)objc_msgSend(v2, "UTF8String");
  fputs(v3, __stderrp);

  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PERMISSION DENIED....and....\n"))));
  v5 = (const char *)objc_msgSend(v4, "UTF8String");
  fputs(v5, __stderrp);

  while (1)
  {
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("YOU DIDN'T SAY THE MAGIC WORD!\n"))));
    v7 = (const char *)objc_msgSend(v6, "UTF8String");
    fputs(v7, __stderrp);

    usleep(0x7A120u);
  }
}

void sub_100002578()
{
  id v0;
  NSObject *v1;
  id v2;
  const char *v3;
  uint8_t v4[16];

  v0 = sub_100002614(&qword_1000082A8);
  v1 = objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_FAULT, "routined is not worthy of running as root.", v4, 2u);
  }

  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("routined is not worthy of running as root.\n"))));
  v3 = (const char *)objc_msgSend(v2, "UTF8String");
  fputs(v3, __stderrp);

  exit(0);
}

id sub_100002614(dispatch_once_t *predicate)
{
  if (*predicate != -1)
    dispatch_once_f(predicate, predicate, (dispatch_function_t)sub_100002658);
  return (id)predicate[2];
}

os_log_t sub_100002658(uint64_t a1)
{
  os_log_t result;

  result = os_log_create("com.apple.CoreRoutine", *(const char **)(a1 + 8));
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

void sub_1000027F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000280C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000281C(uint64_t a1)
{

}

void sub_100002824(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    v8 = sub_100002614(&qword_1000082C0);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "An error was encountered while fetching proximity events, %@", (uint8_t *)&v10, 0xCu);
    }

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    objc_msgSend(*(id *)(a1 + 32), "setProximityEvents:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    objc_msgSend(*(id *)(a1 + 32), "queryPeopleCount");
  }

}

void sub_100002A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100002A8C(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    v8 = sub_100002614(&qword_1000082C0);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "An error was encountered while fetching people counts, %@", (uint8_t *)&v10, 0xCu);
    }

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    objc_msgSend(*(id *)(a1 + 32), "setPeopleCounts:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }

}

void sub_100002C94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100002CAC(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    v8 = sub_100002614(&qword_1000082C0);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "An error was encountered while fetching density information, %@", (uint8_t *)&v10, 0xCu);
    }

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    objc_msgSend(*(id *)(a1 + 32), "setPeopleDensities:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }

}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_arguments(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arguments");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_entryDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "entryDate");
}

id objc_msgSend_exitDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exitDate");
}

id objc_msgSend_fetchPeopleCountEventsHistory_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchPeopleCountEventsHistory:completionHandler:");
}

id objc_msgSend_fetchPeopleDensityHistoryFromStartDate_endDate_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchPeopleDensityHistoryFromStartDate:endDate:completionHandler:");
}

id objc_msgSend_fetchProximityHistoryFromStartDate_endDate_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchProximityHistoryFromStartDate:endDate:completionHandler:");
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processInfo");
}

id objc_msgSend_proximityEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proximityEvents");
}

id objc_msgSend_queryPeopleCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryPeopleCount");
}

id objc_msgSend_routineManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "routineManager");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_setPeopleCounts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPeopleCounts:");
}

id objc_msgSend_setPeopleDensities_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPeopleDensities:");
}

id objc_msgSend_setProximityEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProximityEvents:");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}
