void sub_10000632C(uint64_t a1, xpc_activity_t activity)
{
  NSObject *v3;
  _QWORD block[5];

  if (xpc_activity_get_state(activity) == 2)
  {
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000063B0;
    block[3] = &unk_10000C4A0;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_sync(v3, block);

  }
}

id sub_1000063B0(uint64_t a1)
{
  uint8_t v3[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "poking gizmo now", v3, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_sendMessage:to:identifier:expectReply:", &off_10000C9F8, IDSDefaultPairedDevice, 0, 0);
}

void sub_100006438(uint64_t a1)
{
  NSObject *v2;
  dispatch_source_t v3;
  void *v4;
  _QWORD handler[5];

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_data_or, 0, 0, v2);
  v4 = (void *)qword_100011800;
  qword_100011800 = (uint64_t)v3;

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100006528;
  handler[3] = &unk_10000C4A0;
  handler[4] = *(_QWORD *)(a1 + 32);
  dispatch_source_set_event_handler((dispatch_source_t)qword_100011800, handler);
  dispatch_activate((dispatch_object_t)qword_100011800);
}

id sub_1000064E8(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "stopWaitingForDeviceUnlock");
  return objc_msgSend(*(id *)(a1 + 32), "deviceUnlockTimedOut");
}

id sub_100006510(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendReplyToPacket");
}

void sub_100006518(id a1, int a2)
{
  dispatch_source_merge_data((dispatch_source_t)qword_100011800, 1uLL);
}

id sub_100006528(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendReplyToPacket");
}

void sub_100006530(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "session"));

  if (v2)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.otpaird"), 8, CFSTR("pairing session timed out")));
    v3 = *(void **)(a1 + 32);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "session"));
    objc_msgSend(v3, "session:didCompleteWithSuccess:error:", v4, 0, v5);

  }
}

void sub_1000065D4(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  char v18;

  v7 = a3;
  v8 = a4;
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000066B4;
  block[3] = &unk_10000C450;
  v18 = a2;
  v14 = v7;
  v15 = v8;
  v10 = *(void **)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 32);
  v17 = v10;
  v11 = v8;
  v12 = v7;
  dispatch_async(v9, block);

}

void sub_1000066B4(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
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
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[3];
  _QWORD v26[3];
  uint8_t buf[4];
  int v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(unsigned __int8 *)(a1 + 64);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 67109634;
    v28 = v2;
    v29 = 2112;
    v30 = v3;
    v31 = 2112;
    v32 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "exchangePacket: complete=%d responsePacket=%@ channelError=%@", buf, 0x1Cu);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "session"));

  if (v5)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      v6 = objc_alloc_init((Class)NSMutableDictionary);
      objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_10000C9A0, CFSTR("m"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "session"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("session"));

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "description"));
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("error"));

      v10 = *(void **)(a1 + 56);
      if (!v10)
      {
        v24 = _os_assert_log(0);
        _os_crash(v24);
        __break(1u);
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fromID"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "outgoingResponseIdentifier"));
      objc_msgSend(*(id *)(a1 + 48), "_sendMessage:to:identifier:", v6, v11, v12);
      v13 = *(void **)(a1 + 48);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "session"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:underlying:](NSError, "errorWithDomain:code:description:underlying:", CFSTR("com.apple.security.otpaird"), 7, CFSTR("exchangePacket"), *(_QWORD *)(a1 + 40)));
      objc_msgSend(v13, "session:didCompleteWithSuccess:error:", v14, 0, v15);

      goto LABEL_21;
    }
    if (*(_QWORD *)(a1 + 32))
    {
      v26[0] = &off_10000C9B8;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "session", CFSTR("m"), CFSTR("session")));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
      v25[2] = CFSTR("packet");
      v18 = *(_QWORD *)(a1 + 32);
      v26[1] = v17;
      v26[2] = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 3));

      v20 = *(void **)(a1 + 56);
      if (v20)
        v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "fromID"));
      else
        v21 = IDSDefaultPairedDevice;
      v11 = v21;
      v22 = *(void **)(a1 + 56);
      if (v22)
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "outgoingResponseIdentifier"));
      else
        v12 = 0;
      objc_msgSend(*(id *)(a1 + 48), "_sendMessage:to:identifier:", v19, v11, v12);

    }
    else
    {
      v12 = 0;
      v11 = 0;
    }
    if (*(_BYTE *)(a1 + 64))
    {
      v23 = *(void **)(a1 + 48);
      v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "session"));
      objc_msgSend(v23, "session:didCompleteWithSuccess:error:", v6, 1, 0);
LABEL_21:

    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "pairing session went away, dropping exchangePacket response", buf, 2u);
    }
    v12 = 0;
    v11 = 0;
  }

}

void sub_100006A34(uint64_t a1)
{
  void *v2;
  OTPairingSession *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "session"));

  if (v2)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "session"));
    objc_msgSend(v8, "addCompletionHandler:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    v3 = [OTPairingSession alloc];
    v4 = objc_msgSend(*(id *)(a1 + 32), "initiator");
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "deviceInfo"));
    v6 = -[OTPairingSession initAsInitiator:deviceInfo:identifier:](v3, "initAsInitiator:deviceInfo:identifier:", v4, v5, 0);
    objc_msgSend(*(id *)(a1 + 32), "setSession:", v6);

    objc_msgSend(*(id *)(a1 + 32), "scheduleSessionTimeout");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "session"));
    objc_msgSend(v7, "addCompletionHandler:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "sendReplyToPacket");
  }
}

void sub_100006B68(id a1)
{
  id v1;
  void *v2;

  v1 = -[OTPairingService initAsInitiator:]([OTPairingService alloc], "initAsInitiator:", 0);
  v2 = (void *)qword_1000117F0;
  qword_1000117F0 = (uint64_t)v1;

}

void start()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = objc_autoreleasePoolPush();
  v1 = objc_claimAutoreleasedReturnValue(+[OTPairingService sharedService](OTPairingService, "sharedService"));
  v2 = (void *)qword_100011808;
  qword_100011808 = v1;

  objc_autoreleasePoolPop(v0);
  dispatch_main();
}

void sub_100006D68(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000071E4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = secLogObjForScope("octagon");
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Notified that the device name has changed", v7, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "deviceNameUpdateListeners"));
  objc_msgSend(v6, "iterateListeners:", &stru_10000C588);

}

void sub_100007274(id a1, OTDeviceInformationNameUpdateListener *a2)
{
  -[OTDeviceInformationNameUpdateListener deviceNameUpdated](a2, "deviceNameUpdated");
}

void sub_10000727C(id a1)
{
  uint64_t v1;
  void *v2;
  utsname __b;

  memset(&__b, 170, sizeof(__b));
  uname(&__b);
  v1 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", __b.machine, 4));
  v2 = (void *)qword_100011810;
  qword_100011810 = v1;

}

void sub_100007850(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000079D4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007B64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_100007BD8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__sendMessage_to_identifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendMessage:to:identifier:");
}

id objc_msgSend__sendMessage_to_identifier_expectReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendMessage:to:identifier:expectReply:");
}

id objc_msgSend_acquireLockAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acquireLockAssertion");
}

id objc_msgSend_addCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addCompletionHandler:");
}

id objc_msgSend_addDelegate_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDelegate:queue:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_channel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "channel");
}

id objc_msgSend_completionHandlers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completionHandlers");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_deviceInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceInfo");
}

id objc_msgSend_deviceNameUpdateListeners(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceNameUpdateListeners");
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "devices");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didCompleteWithSuccess_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didCompleteWithSuccess:error:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error");
}

id objc_msgSend_errorWithDomain_code_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:description:");
}

id objc_msgSend_errorWithDomain_code_description_underlying_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:description:underlying:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_exchangePacket_complete_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exchangePacket:complete:");
}

id objc_msgSend_fromID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fromID");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_incomingResponseIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "incomingResponseIdentifier");
}

id objc_msgSend_initAsInitiator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initAsInitiator:");
}

id objc_msgSend_initAsInitiator_deviceInfo_identifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initAsInitiator:deviceInfo:identifier:");
}

id objc_msgSend_initWithMessage_fromID_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMessage:fromID:context:");
}

id objc_msgSend_initWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:");
}

id objc_msgSend_initWithService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithService:");
}

id objc_msgSend_initiator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initiator");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_isDefaultPairedDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDefaultPairedDevice");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_iterateListeners_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iterateListeners:");
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyEnumerator");
}

id objc_msgSend_listeners(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listeners");
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "message");
}

id objc_msgSend_messageType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageType");
}

id objc_msgSend_modelID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modelID");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextObject");
}

id objc_msgSend_notifyToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyToken");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectEnumerator");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_operatingSystemVersionString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operatingSystemVersionString");
}

id objc_msgSend_osVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "osVersion");
}

id objc_msgSend_outgoingResponseIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outgoingResponseIdentifier");
}

id objc_msgSend_overriddenMachineID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overriddenMachineID");
}

id objc_msgSend_packet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "packet");
}

id objc_msgSend_packetData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "packetData");
}

id objc_msgSend_pairingChannelAcceptor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingChannelAcceptor:");
}

id objc_msgSend_pairingChannelInitiator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingChannelInitiator:");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processInfo");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queue");
}

id objc_msgSend_registerListener_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerListener:");
}

id objc_msgSend_scheduleGizmoPoke(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleGizmoPoke");
}

id objc_msgSend_scheduleSessionTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleSessionTimeout");
}

id objc_msgSend_sendMessage_toDestinations_priority_options_identifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendMessage:toDestinations:priority:options:identifier:error:");
}

id objc_msgSend_sendReplyToPacket(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendReplyToPacket");
}

id objc_msgSend_sentMessageIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sentMessageIdentifier");
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "service");
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "session");
}

id objc_msgSend_session_didCompleteWithSuccess_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "session:didCompleteWithSuccess:error:");
}

id objc_msgSend_sessionIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionIdentifier");
}

id objc_msgSend_sessionTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionTimer");
}

id objc_msgSend_setChannel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChannel:");
}

id objc_msgSend_setCompletionHandlers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompletionHandlers:");
}

id objc_msgSend_setDeviceInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceInfo:");
}

id objc_msgSend_setDeviceNameUpdateListeners_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceNameUpdateListeners:");
}

id objc_msgSend_setFromID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFromID:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIncomingResponseIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIncomingResponseIdentifier:");
}

id objc_msgSend_setIntent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIntent:");
}

id objc_msgSend_setMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMessage:");
}

id objc_msgSend_setModel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModel:");
}

id objc_msgSend_setNotifyToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNotifyToken:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOsVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOsVersion:");
}

id objc_msgSend_setOutgoingResponseIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOutgoingResponseIdentifier:");
}

id objc_msgSend_setPacket_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPacket:");
}

id objc_msgSend_setQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQueue:");
}

id objc_msgSend_setSentMessageIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSentMessageIdentifier:");
}

id objc_msgSend_setService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setService:");
}

id objc_msgSend_setSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSession:");
}

id objc_msgSend_setSessionTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSessionTimer:");
}

id objc_msgSend_setStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStore:");
}

id objc_msgSend_setUniqueClientID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUniqueClientID:");
}

id objc_msgSend_setUniqueDeviceID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUniqueDeviceID:");
}

id objc_msgSend_setUnlockTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUnlockTimer:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setupDeviceNameListener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupDeviceNameListener");
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedService");
}

id objc_msgSend_stopWaitingForDeviceUnlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopWaitingForDeviceUnlock");
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "store");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_strongToWeakObjectsMapTable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "strongToWeakObjectsMapTable");
}

id objc_msgSend_uniqueIDOverride(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uniqueIDOverride");
}

id objc_msgSend_unlockTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlockTimer");
}
