id sub_100004250()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v0 = _CFXPCCreateCFObjectFromXPCObject();
  v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  v2 = v1;
  if (v1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("Name")));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Object")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("UserInfo")));
    v6 = objc_msgSend(objc_alloc((Class)NSNotification), "initWithName:object:userInfo:", v3, v4, v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void sub_100004510(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pendingReplies", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v6) + 16))();
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pendingReplies"));
  objc_msgSend(v7, "removeAllObjects");

}

void sub_1000046BC(uint64_t a1)
{
  id v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pendingReplies"));
  v2 = objc_retainBlock(*(id *)(a1 + 40));
  objc_msgSend(v3, "addObject:", v2);

}

void sub_1000047A8(uint64_t a1)
{
  void *v2;
  const void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.location-query"), v2));

  v3 = (const void *)CPPowerAssertionCreate(v4, 30.0);
  objc_msgSend(*(id *)(a1 + 32), "_extensionQueue_deliverLocationPayloadToExtension:", *(_QWORD *)(a1 + 40));
  CFRelease(v3);

}

void sub_100005228(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

id sub_100005260(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;

  if (qword_100010D10 != -1)
    dispatch_once(&qword_100010D10, &stru_10000C398);
  v2 = qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Extension will be killed because it used its runtime in starting up", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 40), "_kill:", 9);
}

uint64_t sub_100005334(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100005344(uint64_t a1)
{

}

id sub_10000534C(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;

  if (qword_100010D10 != -1)
    dispatch_once(&qword_100010D10, &stru_10000C398);
  v2 = qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Service extension exceeded allowed time: sessionUUID=%{public}@", (uint8_t *)&v6, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 48), "cancelExtensionRequestWithIdentifier:", *(_QWORD *)(a1 + 40));
}

void sub_100005428(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;

  if (qword_100010D10 != -1)
    dispatch_once(&qword_100010D10, &stru_10000C398);
  v2 = (void *)qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
    v6 = *(_QWORD *)(a1 + 40);
    v9 = 138543618;
    v10 = v5;
    v11 = 2114;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Entering grace time: sessionUUID=%{public}@", (uint8_t *)&v9, 0x16u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "_auxiliaryConnection"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "remoteObjectProxy"));
  objc_msgSend(v8, "serviceExtensionWillTerminate");

}

void sub_100005550(_QWORD *a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  if (qword_100010D10 != -1)
    dispatch_once(&qword_100010D10, &stru_10000C398);
  v5 = qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[4];
    v7 = a1[5];
    v8 = 138543874;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    v12 = 2114;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Service extension connection encountered an error: sessionUUID=%{public}@, error=%{public}@", (uint8_t *)&v8, 0x20u);
  }

}

void sub_100005658(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;

  if (qword_100010D10 != -1)
    dispatch_once(&qword_100010D10, &stru_10000C398);
  v2 = qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138543618;
    v6 = v3;
    v7 = 2114;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Service extension finished: sessionUUID=%{public}@", (uint8_t *)&v5, 0x16u);
  }
}

void sub_100005904(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.locationpushd", "PushDaemon");
  v2 = (void *)qword_100010D18;
  qword_100010D18 = (uint64_t)v1;

}

void sub_100005974(id a1)
{
  LPPushRegistrar *v1;
  void *v2;

  v1 = objc_alloc_init(LPPushRegistrar);
  v2 = (void *)qword_100010EA8;
  qword_100010EA8 = (uint64_t)v1;

}

void sub_100005BA0(uint64_t a1, void *a2)
{
  id v3;
  const char *string;
  NSObject *v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;

  v3 = a2;
  string = xpc_dictionary_get_string(v3, _xpc_event_key_name);
  if (!strcmp(string, "com.apple.locationpushd.app-uninstalled"))
  {
    if (qword_100010D10 != -1)
      dispatch_once(&qword_100010D10, &stru_10000C450);
    v5 = qword_100010D18;
    if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Launched by application uninstalled notification", (uint8_t *)&v9, 2u);
    }
    v6 = sub_100004250();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "handleApplicationUninstalledNotification:", v7);
    }
    else
    {
      if (qword_100010D10 != -1)
        dispatch_once(&qword_100010D10, &stru_10000C450);
      v8 = qword_100010D18;
      if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138543362;
        v10 = v3;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Could not create notification for XPC event %{public}@", (uint8_t *)&v9, 0xCu);
      }
    }

  }
}

void sub_100006910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100006928(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100006938(uint64_t a1)
{

}

void sub_100006940(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  LPApplication *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifierToApplication"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v6 = -[LPApplication initWithAppBundleIdentifier:]([LPApplication alloc], "initWithAppBundleIdentifier:", *(_QWORD *)(a1 + 40));
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v9)
    {
      v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifierToApplication"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, *(_QWORD *)(a1 + 40));

    }
  }
}

id sub_100006F90(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setTopicEnabled:forConnection:appBundleIdentifier:", 1, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t sub_1000070C8(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    objc_msgSend(*(id *)(a1 + 40), "_setTopicEnabled:forConnection:appBundleIdentifier:", *(unsigned __int8 *)(a1 + 64), v2, *(_QWORD *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void sub_1000071A4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  uint64_t v16;

  if (qword_100010D10 != -1)
    dispatch_once(&qword_100010D10, &stru_10000C450);
  v2 = qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v16 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Handling app uninstall %{public}@", buf, 0xCu);
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "userInfo", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleIDs")));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(a1 + 40), "_unregisterLocationPushApplication:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

void sub_100007524(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifierToApplication"));
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

void sub_10000805C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.locationpushd", "PushDaemon");
  v2 = (void *)qword_100010D18;
  qword_100010D18 = (uint64_t)v1;

}

uint64_t start()
{
  void *v0;
  NSObject *v1;
  id v2;
  void *v3;
  void *v4;
  uint8_t v6[16];

  v0 = objc_autoreleasePoolPush();
  if (qword_100010D10 != -1)
    dispatch_once(&qword_100010D10, &stru_10000C470);
  v1 = qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Starting locationpushd", v6, 2u);
  }
  v2 = +[LPPushRegistrar sharedInstance](LPPushRegistrar, "sharedInstance");
  objc_autoreleasePoolPop(v0);
  v3 = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  objc_msgSend(v4, "run");

  objc_autoreleasePoolPop(v3);
  return 0;
}

void sub_100008168(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.locationpushd", "PushDaemon");
  v2 = (void *)qword_100010D18;
  qword_100010D18 = (uint64_t)v1;

}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__addOrMoveTopic_forConnection_toList_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addOrMoveTopic:forConnection:toList:");
}

id objc_msgSend__apsConnectionForEnvironment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_apsConnectionForEnvironment:");
}

id objc_msgSend__auxiliaryConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_auxiliaryConnection");
}

id objc_msgSend__checkAndExerciseAuthorizationForBundleID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkAndExerciseAuthorizationForBundleID:error:");
}

id objc_msgSend__extensionContextForUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_extensionContextForUUID:");
}

id objc_msgSend__extensionQueue_deliverLocationPayloadToExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_extensionQueue_deliverLocationPayloadToExtension:");
}

id objc_msgSend__findOrCreateApplicationWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_findOrCreateApplicationWithBundleIdentifier:");
}

id objc_msgSend__invalidateTokenForTopic_fromConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_invalidateTokenForTopic:fromConnection:");
}

id objc_msgSend__kill_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_kill:");
}

id objc_msgSend__removeTopic_forConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeTopic:forConnection:");
}

id objc_msgSend__removeUnneededSandboxTopicsFromDevelopmentConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeUnneededSandboxTopicsFromDevelopmentConnection");
}

id objc_msgSend__setIgnoredTopics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setIgnoredTopics:");
}

id objc_msgSend__setOpportunisticTopics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setOpportunisticTopics:");
}

id objc_msgSend__setTopicEnabled_forConnection_appBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setTopicEnabled:forConnection:appBundleIdentifier:");
}

id objc_msgSend__topicsForWhichInstalledAppIsNotPresentWithAPNSDevelopmentEnvironment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_topicsForWhichInstalledAppIsNotPresentWithAPNSDevelopmentEnvironment:");
}

id objc_msgSend__unregisterLocationPushApplication_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_unregisterLocationPushApplication:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addPendingTokenReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addPendingTokenReply:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_apsEnvironment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "apsEnvironment");
}

id objc_msgSend_apsdQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "apsdQueue");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_beginExtensionRequestWithOptions_inputItems_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginExtensionRequestWithOptions:inputItems:error:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bundleIdFromTopic_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdFromTopic:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundleIdentifierToApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifierToApplication");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancel");
}

id objc_msgSend_cancelExtensionRequestWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelExtensionRequestWithIdentifier:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_deliverLocationPayloadToExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deliverLocationPayloadToExtension:");
}

id objc_msgSend_deliverToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deliverToken:");
}

id objc_msgSend_developmentAPSConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "developmentAPSConnection");
}

id objc_msgSend_dictionaryMutationQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryMutationQueue");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didReceiveLocationPushPayload_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didReceiveLocationPushPayload:reply:");
}

id objc_msgSend_entitlements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "entitlements");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_extensionQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionQueue");
}

id objc_msgSend_extensionsWithMatchingAttributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionsWithMatchingAttributes:error:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_handleApplicationUninstalledNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleApplicationUninstalledNotification:");
}

id objc_msgSend_hasLocationPushEntitlement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasLocationPushEntitlement");
}

id objc_msgSend_hasLocationPushServiceExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasLocationPushServiceExtension");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_ignoredTopics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ignoredTopics");
}

id objc_msgSend_initWithAppBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAppBundleIdentifier:");
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_initWithEnvironmentName_namedDelegatePort_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEnvironmentName:namedDelegatePort:queue:");
}

id objc_msgSend_initWithFireInterval_queue_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFireInterval:queue:handler:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithName_object_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:object:userInfo:");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidateTokenForTopic_identifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateTokenForTopic:identifier:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isPlaceholder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPlaceholder");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_moveTopic_fromList_toList_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveTopic:fromList:toList:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_objectForKey_ofClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:ofClass:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_opportunisticTopics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "opportunisticTopics");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pendingReplies(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pendingReplies");
}

id objc_msgSend_pendingReplyQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pendingReplyQueue");
}

id objc_msgSend_pidForRequestIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pidForRequestIdentifier:");
}

id objc_msgSend_productionAPSConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productionAPSConnection");
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxy");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_requestTokenForTopic_identifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestTokenForTopic:identifier:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_schedule(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "schedule");
}

id objc_msgSend_scheduledTimerWithFireInterval_queue_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduledTimerWithFireInterval:queue:handler:");
}

id objc_msgSend_serviceExtensionForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceExtensionForBundleIdentifier:");
}

id objc_msgSend_serviceExtensionPerformCleanup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceExtensionPerformCleanup");
}

id objc_msgSend_serviceExtensionWillTerminate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceExtensionWillTerminate");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronousRemoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_topic(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topic");
}

id objc_msgSend_topicFromBundleId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topicFromBundleId:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}
