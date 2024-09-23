void sub_100001AF4(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_100008978;
  qword_100008978 = (uint64_t)v1;

}

void sub_100001D40(uint64_t a1, xpc_object_t xdict)
{
  NSString *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(xdict, _xpc_event_key_name));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "handleXPCEventWithName:", v4);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

uint64_t start()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_autoreleasePoolPush();
  v1 = (void *)os_transaction_create("com.apple.safetycheckd.startup");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SCDaemon sharedDaemon](SCDaemon, "sharedDaemon"));
  objc_msgSend(v2, "start");

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  objc_msgSend(v3, "run");

  objc_autoreleasePoolPop(v0);
  return 0;
}

id sub_100002998()
{
  if (qword_100008990 != -1)
    dispatch_once(&qword_100008990, &stru_100004240);
  return (id)qword_100008988;
}

void sub_1000029D8(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.safetycheckd", "SCLogger");
  v2 = (void *)qword_100008988;
  qword_100008988 = (uint64_t)v1;

}

void sub_100002A08(void *a1, NSObject *a2)
{
  void *v4;
  unsigned int v5;
  const __CFString *v6;
  int v7;
  void *v8;
  __int16 v9;
  const __CFString *v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "identifier"));
  v5 = objc_msgSend(a1, "isRepeating");
  v6 = CFSTR("handleNonRepeatingTask");
  if (v5)
    v6 = CFSTR("handleRepeatingTask");
  v7 = 138412546;
  v8 = v4;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "\"Couldn't initialize task for identifier %@ and/or selector %@\"", (uint8_t *)&v7, 0x16u);

}

id objc_msgSend_XPCListenerPairs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "XPCListenerPairs");
}

id objc_msgSend__conformsToTaskHandling(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_conformsToTaskHandling");
}

id objc_msgSend__listenersByEventName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_listenersByEventName");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_backgroundSystemTasks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backgroundSystemTasks");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_errorWithCode_underlyingErrors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithCode:underlyingErrors:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_first(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "first");
}

id objc_msgSend_handleXPCEventWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleXPCEventWithName:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hash");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_initNonMemoizedWithFirst_second_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initNonMemoizedWithFirst:second:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_interestedEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interestedEvents");
}

id objc_msgSend_isEqualToPair_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToPair:");
}

id objc_msgSend_isRepeating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRepeating");
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_nonRepeatingTaskHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nonRepeatingTaskHandler");
}

id objc_msgSend_notifyDListeners(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyDListeners");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_pairWithFirst_second_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairWithFirst:second:");
}

id objc_msgSend_registerForTaskUsingQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerForTaskUsingQueue:");
}

id objc_msgSend_registerForTaskWithIdentifier_usingQueue_launchHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerForTaskWithIdentifier:usingQueue:launchHandler:");
}

id objc_msgSend_registerXPCEventHandlers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerXPCEventHandlers");
}

id objc_msgSend_repeatingTaskHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "repeatingTaskHandler");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "second");
}

id objc_msgSend_setActiveXPCListenerPairs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActiveXPCListenerPairs:");
}

id objc_msgSend_setCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCode:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setTaskCompleted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTaskCompleted");
}

id objc_msgSend_setUnderlyingErrors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUnderlyingErrors:");
}

id objc_msgSend_sharedDaemon(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedDaemon");
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedScheduler");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_tasks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tasks");
}

id objc_msgSend_underlyingErrors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "underlyingErrors");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_wakeXPCListeners(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wakeXPCListeners");
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workQueue");
}
