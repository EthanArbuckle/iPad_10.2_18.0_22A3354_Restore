BOOL sub_100002808()
{
  return MGGetSInt32Answer(CFSTR("DeviceClassNumber"), 0xFFFFFFFFLL) == 4;
}

BOOL sub_100002830()
{
  return MGGetSInt32Answer(CFSTR("DeviceClassNumber"), 0xFFFFFFFFLL) == 6;
}

BOOL sub_100002858()
{
  return MGGetSInt32Answer(CFSTR("DeviceClassNumber"), 0xFFFFFFFFLL) == 1;
}

BOOL sub_100002880()
{
  return MGGetSInt32Answer(CFSTR("DeviceClassNumber"), 0xFFFFFFFFLL) == 9;
}

void sub_1000028A8()
{
  void *v0;
  id v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v1 = objc_msgSend(v0, "addObserverForName:object:queue:usingBlock:", NSUserDefaultsDidChangeNotification, 0, 0, &stru_1000104A0);

  sub_100002904();
}

void sub_100002904()
{
  void *v0;
  id v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "objectForKey:", CFSTR("EnableSignposts")));

  byte_100015A60 = objc_msgSend(v1, "BOOLValue");
}

void sub_100002DE4(const void *a1, uint64_t a2)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  id v11;

  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", a1));
  v4 = sub_1000030B0();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v11));

  if (v6)
  {
    v7 = sub_1000030B0();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_msgSend(v8, "removeObjectForKey:", v11);

    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "responseHandler"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "alert"));
    ((void (**)(_QWORD, void *, uint64_t))v9)[2](v9, v10, a2);

  }
  CFRelease(a1);

}

id sub_1000030B0()
{
  if (qword_100015A78 != -1)
    dispatch_once(&qword_100015A78, &stru_1000104E0);
  return (id)qword_100015A70;
}

void sub_1000030F0(id a1)
{
  NSMutableDictionary *v1;
  void *v2;

  v1 = objc_opt_new(NSMutableDictionary);
  v2 = (void *)qword_100015A70;
  qword_100015A70 = (uint64_t)v1;

}

void sub_100003118(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100003128(char *category)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.bluetooth", category);
  v2 = (void *)qword_100015A68;
  qword_100015A68 = (uint64_t)v1;

}

BOOL sub_100003C10(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "connectionID") == *(id *)(a1 + 32);
}

void sub_100004004(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  v2 = qword_100015A68;
  if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Registering for accessory disconnection notifications", v5, 2u);
  }
  IAPAppRegisterClient(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "handleAccessoryDidDisconnectNotification:", IAPAppBTPairingDidDisconnectKey, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CPDistributedNotificationCenter centerNamed:](CPDistributedNotificationCenter, "centerNamed:", IAP2GeneralDistributedNotificationServerName));
  objc_msgSend(v4, "startDeliveringNotificationsToMainThread");

}

void sub_1000043E4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000043F8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t start()
{
  void *v0;

  sub_100003128("BTMagic");
  sub_1000028A8();
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100010568);
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  objc_msgSend(v0, "run");

  return 1;
}

void sub_100004480(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  NSString *v3;
  void *v4;
  NSObject *v5;
  AccessoryPairingManager *v6;
  void *v7;
  NSObject *v8;

  v2 = a2;
  v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v2, _xpc_event_key_name));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = qword_100015A68;
  if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEBUG))
    sub_1000093BC((uint64_t)v4, v5);
  if (objc_msgSend(v4, "isEqualToString:", IAPAppBTPairingLaunchNotification))
  {
    if ((MGGetBoolAnswer(CFSTR("yhHcB0iH0d1XzPO/CFd3ow")) & 1) == 0)
    {
      v8 = qword_100015A68;
      if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
        sub_10000937C(v8);
      exit(1);
    }
    if (!qword_100015A88)
    {
      v6 = objc_alloc_init(AccessoryPairingManager);
      v7 = (void *)qword_100015A88;
      qword_100015A88 = (uint64_t)v6;

    }
  }

}

__CFString *sub_1000045C4(int a1)
{
  __CFString *v1;

  v1 = CFSTR("unknown");
  if (a1 == 1)
    v1 = CFSTR("out-of-band");
  if (a1)
    return v1;
  else
    return CFSTR("passkey");
}

uint64_t sub_10000469C()
{
  CFStringRef v0;
  char *v1;
  NSObject *v2;
  _BOOL4 v3;
  uint64_t v5;
  uint8_t buf[4];
  uint64_t v7;

  v0 = (CFStringRef)qword_100015A98;
  if (!qword_100015A98)
  {
    v5 = 1;
    v1 = (char *)container_system_group_path_for_identifier(0, "systemgroup.com.apple.bluetooth", &v5);
    v2 = qword_100015A68;
    v3 = os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT);
    if (v1)
    {
      if (v3)
      {
        *(_DWORD *)buf = 136315138;
        v7 = (uint64_t)v1;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Using containerized path %s", buf, 0xCu);
      }
      v0 = CFStringCreateWithCString(kCFAllocatorDefault, v1, 0x8000100u);
      qword_100015A98 = (uint64_t)v0;
      free(v1);
    }
    else
    {
      if (v3)
      {
        *(_DWORD *)buf = 134217984;
        v7 = v5;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Failed to find the system container: %llu", buf, 0xCu);
      }
      return qword_100015A98;
    }
  }
  return (uint64_t)v0;
}

void sub_100005A34(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v5 = a2;
  v6 = qword_100015A68;
  if (a3 == 1)
  {
    if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Turning Bluetooth ON in response to user request", v8, 2u);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"));
    objc_msgSend(v7, "setPowered:", 1);

    objc_msgSend(*(id *)(a1 + 32), "startExpirationTimer:", 10);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
      sub_10000985C();
    objc_msgSend(*(id *)(a1 + 32), "failPairing");
  }

}

id sub_1000061AC(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("PairedAccessoryLocalIdentifier")));
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

id sub_100006224(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accessoryID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PairedAccessoryRemoteIdentifier")));

  v6 = objc_msgSend(v4, "isEqual:", v5);
  return v6;
}

id sub_100006298(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "identifier"));
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

BOOL sub_1000062D8(id a1, CBPeer *a2, unint64_t a3, BOOL *a4)
{
  CBPeer *v4;
  unsigned __int8 v5;

  v4 = a2;
  if ((-[CBPeer hasTag:](v4, "hasTag:", CFSTR("A1603")) & 1) != 0)
    v5 = 1;
  else
    v5 = -[CBPeer hasTag:](v4, "hasTag:", CFSTR("A3085"));

  return v5;
}

void sub_100006CD0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;

  v5 = a2;
  v6 = (void *)qword_100015A68;
  if (a3 == 1)
  {
    if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(a1 + 32);
      v8 = v6;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessoryID"));
      v10 = 138412290;
      v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Accepting pairing to accessory \"%@\" in response to user request", (uint8_t *)&v10, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "advanceState");
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100015A68, OS_LOG_TYPE_ERROR))
      sub_100009A90();
    objc_msgSend(*(id *)(a1 + 32), "failPairing");
  }

}

void sub_100008A00(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "timerExpiredWithState:after:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void sub_100008E84(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100008EA4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100008EDC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_100008EE8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

id sub_100008EF4(id a1)
{
  return a1;
}

uint64_t sub_100008EFC()
{
  uint64_t v0;

  return v0;
}

void sub_100008F64(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

id sub_100008F88()
{
  void *v0;

  return objc_msgSend(v0, "connectionID");
}

id sub_100008F94()
{
  void *v0;

  return objc_msgSend(v0, "state");
}

id sub_100008FA0(id a1)
{
  return a1;
}

id sub_100008FA8(void *a1, const char *a2)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id sub_100008FB0()
{
  void *v0;

  return objc_msgSend(v0, "state");
}

void sub_100008FBC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003118((void *)&_mh_execute_header, a2, a3, "Failed to create notification with parameters %@", a5, a6, a7, a8, 2u);
}

void sub_100009024(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003118((void *)&_mh_execute_header, a2, a3, "Failed to create run loop source for notification with parameters %@", a5, a6, a7, a8, 2u);
}

void sub_10000908C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Creating persistence assertion \"%@\"", (uint8_t *)&v2, 0xCu);
}

void sub_100009100(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Releasing persistence assertion", v1, 2u);
  sub_100004414();
}

void sub_10000913C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000043F8((void *)&_mh_execute_header, a1, a3, "Cannot process accessories as CoreBluetooth isn't available", a5, a6, a7, a8, 0);
  sub_100004414();
}

void sub_10000916C(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "currentAccessory"));
  sub_1000043E4((void *)&_mh_execute_header, v5, v6, "Failing pairing for current accessory \"%@\"", v7, v8, v9, v10, 2u);

  sub_100004408();
}

void sub_1000091F8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000043F8((void *)&_mh_execute_header, a1, a3, "Detected CoreBluetooth reset", a5, a6, a7, a8, 0);
  sub_100004414();
}

void sub_100009228(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a1;
  objc_msgSend(a2, "state");
  sub_1000043E4((void *)&_mh_execute_header, v4, v5, "CoreBluetooth is not %s - exiting", v6, v7, v8, v9, 2u);

  sub_100004408();
}

void sub_1000092C0(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;

  v5 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "currentAccessory"));
  v7 = 138412546;
  v8 = a1;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Received wizard finished event from device (%@) other than current wizard (%@)", (uint8_t *)&v7, 0x16u);

}

void sub_10000937C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Ignoring request to pair unsupported device", v1, 2u);
}

void sub_1000093BC(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Received event %@", (uint8_t *)&v2, 0xCu);
}

void sub_100009430(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = sub_100008EF4(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "peripheral"));
  sub_100008F14();
  sub_100008EDC((void *)&_mh_execute_header, v3, v5, "Unpairing peripheral \"%@\"", v6);

  sub_100004408();
}

void sub_1000094BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008EB8();
  sub_100008E84((void *)&_mh_execute_header, v0, v1, "Initialized → EstablishLECommunication", v2, v3, v4, v5, v6);
  sub_100004414();
}

void sub_1000094E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008EB8();
  sub_100008E84((void *)&_mh_execute_header, v0, v1, "EstablishLECommunication → ExchangeInitialState", v2, v3, v4, v5, v6);
  sub_100004414();
}

void sub_100009514()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008EB8();
  sub_100008E84((void *)&_mh_execute_header, v0, v1, "ExchangeInitialState → TurnOnBluetooth", v2, v3, v4, v5, v6);
  sub_100004414();
}

void sub_100009540()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008EB8();
  sub_100008E84((void *)&_mh_execute_header, v0, v1, "TurnOnBluetooth → DeterminePairStatus", v2, v3, v4, v5, v6);
  sub_100004414();
}

void sub_10000956C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008EB8();
  sub_100008E84((void *)&_mh_execute_header, v0, v1, "DeterminePairStatus → EraseExistingKeys", v2, v3, v4, v5, v6);
  sub_100004414();
}

void sub_100009598()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008EB8();
  sub_100008E84((void *)&_mh_execute_header, v0, v1, "EraseExistingKeys → ExchangeOOBData", v2, v3, v4, v5, v6);
  sub_100004414();
}

void sub_1000095C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008EB8();
  sub_100008E84((void *)&_mh_execute_header, v0, v1, "EraseExistingKeys → EnterPairingMode", v2, v3, v4, v5, v6);
  sub_100004414();
}

void sub_1000095F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008EB8();
  sub_100008E84((void *)&_mh_execute_header, v0, v1, "ExchangeOOBData → EnterPairingMode", v2, v3, v4, v5, v6);
  sub_100004414();
}

void sub_10000961C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008EB8();
  sub_100008E84((void *)&_mh_execute_header, v0, v1, "EnterPairingMode → DiscoverPeripheral", v2, v3, v4, v5, v6);
  sub_100004414();
}

void sub_100009648()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008EB8();
  sub_100008E84((void *)&_mh_execute_header, v0, v1, "DiscoverPeripheral → ConnectPeripheral", v2, v3, v4, v5, v6);
  sub_100004414();
}

void sub_100009674()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008EB8();
  sub_100008E84((void *)&_mh_execute_header, v0, v1, "ConnectPeripheral → InitiatePairing", v2, v3, v4, v5, v6);
  sub_100004414();
}

void sub_1000096A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008EB8();
  sub_100008E84((void *)&_mh_execute_header, v0, v1, "InitiatePairing → ExchangePasskeyData", v2, v3, v4, v5, v6);
  sub_100004414();
}

void sub_1000096CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008EB8();
  sub_100008E84((void *)&_mh_execute_header, v0, v1, "InitiatePairing → AskUserApproval", v2, v3, v4, v5, v6);
  sub_100004414();
}

void sub_1000096F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008EB8();
  sub_100008E84((void *)&_mh_execute_header, v0, v1, "ExchangePasskeyData → AskUserApproval", v2, v3, v4, v5, v6);
  sub_100004414();
}

void sub_100009724()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008EB8();
  sub_100008E84((void *)&_mh_execute_header, v0, v1, "AskUserApproval → AcceptPairing", v2, v3, v4, v5, v6);
  sub_100004414();
}

void sub_100009750()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008EB8();
  sub_100008E84((void *)&_mh_execute_header, v0, v1, "AcceptPairing → SendPairingInfo", v2, v3, v4, v5, v6);
  sub_100004414();
}

void sub_10000977C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008EB8();
  sub_100008E84((void *)&_mh_execute_header, v0, v1, "SendPairingInfo → StorePairingInfo", v2, v3, v4, v5, v6);
  sub_100004414();
}

void sub_1000097A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008EB8();
  sub_100008E84((void *)&_mh_execute_header, v0, v1, "StorePairingInfo → Finished", v2, v3, v4, v5, v6);
  sub_100004414();
}

void sub_1000097D4(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100008FA0(a1);
  v3 = objc_msgSend((id)sub_100008EFC(), "accessoryID");
  objc_claimAutoreleasedReturnValue(v3);
  sub_100008F88();
  sub_100008F40();
  sub_100008F64((void *)&_mh_execute_header, v4, v5, "Failed to send StartBLEUpdates message to accessory \"%@\" (%llu) with result %d", v6, v7, v8, v9, v10);

  sub_100008F78();
}

void sub_10000985C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008EB8();
  sub_1000043F8((void *)&_mh_execute_header, v0, v1, "Failing pairing as user chose not to power Bluetooth on", v2, v3, v4, v5, v6);
  sub_100004414();
}

void sub_100009888(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = sub_100008EF4(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "UUIDString"));
  sub_100008F14();
  sub_100008EDC((void *)&_mh_execute_header, v3, v5, "Unable to find paired accessory with identifier \"%@\"", v6);

  sub_100004408();
}

void sub_100009914(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100008FA0(a1);
  v3 = objc_msgSend((id)sub_100008EFC(), "accessoryID");
  objc_claimAutoreleasedReturnValue(v3);
  sub_100008F88();
  sub_100008F40();
  sub_100008F64((void *)&_mh_execute_header, v4, v5, "Failed to send DeviceStateUpdate message with pairing mode 'on' to accessory \"%@\" (%llu) with result %d", v6, v7, v8, v9, v10);

  sub_100008F78();
}

void sub_10000999C(void *a1, void *a2, int a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  int v15;

  v5 = sub_100008FA0(a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "passkey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "accessoryID"));
  v8 = 138413058;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  v12 = 2048;
  v13 = objc_msgSend(a2, "connectionID");
  v14 = 1024;
  v15 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to send DevicePairingData message with passkey %@ to accessory \"%@\" (%llu) with result %d", (uint8_t *)&v8, 0x26u);

}

void sub_100009A90()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008EB8();
  sub_1000043F8((void *)&_mh_execute_header, v0, v1, "Failing pairing upon user rejection", v2, v3, v4, v5, v6);
  sub_100004414();
}

void sub_100009ABC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008EB8();
  sub_1000043F8((void *)&_mh_execute_header, v0, v1, "Received state update but pairing mode is NOT enabled", v2, v3, v4, v5, v6);
  sub_100004414();
}

void sub_100009AE8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008EB8();
  sub_1000043F8((void *)&_mh_execute_header, v0, v1, "Received state update but pairing state is NOT success", v2, v3, v4, v5, v6);
  sub_100004414();
}

void sub_100009B14()
{
  void *v0;
  NSObject *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint8_t v8[24];

  sub_100008F08();
  sub_100008EF4(v2);
  v3 = objc_msgSend((id)sub_100008EFC(), "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v0));
  sub_100008FA8(v5, v6);
  sub_100008F14();
  sub_100008EDC((void *)&_mh_execute_header, v1, v7, "Ignoring state update notification from unexpected accessory 0x%llx", v8);

  sub_100008E94();
}

void sub_100009BB4()
{
  void *v0;
  NSObject *v1;
  id v2;
  unsigned int v3;
  __CFString *v4;
  void *v5;
  _DWORD v6[2];
  __int16 v7;
  void *v8;

  sub_100008F08();
  sub_100008EF4(v2);
  v3 = objc_msgSend((id)sub_100008EFC(), "intValue");
  v4 = sub_1000045C4((int)objc_msgSend(v0, "pairingMethod"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6[0] = 67109378;
  v6[1] = v3;
  v7 = 2112;
  v8 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Accessory pairing method (%d) does not match selected method (%@)", (uint8_t *)v6, 0x12u);

  sub_100008E94();
}

void sub_100009C68()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008EB8();
  sub_1000043F8((void *)&_mh_execute_header, v0, v1, "Ignoring pair info notification outside of initial exchange state", v2, v3, v4, v5, v6);
  sub_100004414();
}

void sub_100009C94()
{
  void *v0;
  NSObject *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint8_t v8[24];

  sub_100008F08();
  sub_100008EF4(v2);
  v3 = objc_msgSend((id)sub_100008EFC(), "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v0));
  sub_100008FA8(v5, v6);
  sub_100008F14();
  sub_100008EDC((void *)&_mh_execute_header, v1, v7, "Ignoring pair info notification from unexpected accessory 0x%llx", v8);

  sub_100008E94();
}

void sub_100009D34()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008EB8();
  sub_1000043F8((void *)&_mh_execute_header, v0, v1, "Accessory failed to provide passkey in pair data notification", v2, v3, v4, v5, v6);
  sub_100004414();
}

void sub_100009D60()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008EB8();
  sub_1000043F8((void *)&_mh_execute_header, v0, v1, "Accessory provided extraneous passkey in pair data notification", v2, v3, v4, v5, v6);
  sub_100004414();
}

void sub_100009D8C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100008EB8();
  sub_1000043F8((void *)&_mh_execute_header, v0, v1, "Ignoring pair data notification outside of data exchange states", v2, v3, v4, v5, v6);
  sub_100004414();
}

void sub_100009DB8()
{
  void *v0;
  NSObject *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint8_t v8[24];

  sub_100008F08();
  sub_100008EF4(v2);
  v3 = objc_msgSend((id)sub_100008EFC(), "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v0));
  sub_100008FA8(v5, v6);
  sub_100008F14();
  sub_100008EDC((void *)&_mh_execute_header, v1, v7, "Ignoring pair data notification from unexpected accessory 0x%llx", v8);

  sub_100008E94();
}

void sub_100009E58(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[24];

  sub_100008EF4(a1);
  sub_100008FB0();
  sub_100008F14();
  sub_100008EDC((void *)&_mh_execute_header, v1, v2, "Failed to establish initial communication with CoreBluetooth - state is %ld", v3);

  sub_100004408();
}

void sub_100009ED0(void *a1)
{
  NSObject *v1;
  id v2;
  uint64_t v3;
  const char *v4;
  int v5;
  const char *v6;

  sub_100008EF4(a1);
  v2 = sub_100008FB0();
  v4 = "reset";
  if (v2 == (id)4)
    v4 = "powered off";
  v5 = 136315138;
  v6 = v4;
  sub_100008EDC((void *)&_mh_execute_header, v1, v3, "CoreBluetooth %s in the middle of accessory pairing", (uint8_t *)&v5);

  sub_100004408();
}

void sub_100009F64()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_100008F20();
  sub_100008EE8((void *)&_mh_execute_header, v0, (uint64_t)v0, "Failed to connect peripheral \"%@\" with error %@", v1);
  sub_100008F38();
}

void sub_100009FCC()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_100008F20();
  sub_100008EE8((void *)&_mh_execute_header, v0, (uint64_t)v0, "Unexpectedly disconnected peripheral \"%@\" with error %@", v1);
  sub_100008F38();
}

void sub_10000A034()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100008F14();
  sub_100008EDC((void *)&_mh_execute_header, v0, v1, "Failing unexpected pairing request from peripheral \"%@\"", v2);
  sub_100008F38();
}

void sub_10000A098()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100008F14();
  sub_100008EDC((void *)&_mh_execute_header, v0, v1, "Failing pairing request from peripheral \"%@\" outside of initiate pairing state", v2);
  sub_100008F38();
}

void sub_10000A0FC()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_100008F20();
  sub_100008EE8((void *)&_mh_execute_header, v0, (uint64_t)v0, "Failed to pair peripheral \"%@\" with error %@", v1);
  sub_100008F38();
}

void sub_10000A164()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100008F08();
  sub_100008EF4(v1);
  v2 = objc_msgSend((id)sub_100008EFC(), "accessoryID");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100008EC4();
  sub_100008EA4((void *)&_mh_execute_header, v4, v5, "Failed to receive pairing information from accessory \"%@\" after %lu seconds", v6, v7, v8, v9, v10);

  sub_100008E94();
}

void sub_10000A1E8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100008F14();
  sub_100008EDC((void *)&_mh_execute_header, v0, v1, "Failed to receive Bluetooth power on event after %lu seconds", v2);
  sub_100008F38();
}

void sub_10000A24C()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100008F14();
  sub_100008EDC((void *)&_mh_execute_header, v0, v1, "Failed to erase existing keys after %lu seconds", v2);
  sub_100008F38();
}

void sub_10000A2B0()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100008F08();
  sub_100008EF4(v1);
  v2 = objc_msgSend((id)sub_100008EFC(), "accessoryID");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100008EC4();
  sub_100008EA4((void *)&_mh_execute_header, v4, v5, "Failed to receive OOB data from accessory \"%@\" after %lu seconds", v6, v7, v8, v9, v10);

  sub_100008E94();
}

void sub_10000A334()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100008F14();
  sub_100008EDC((void *)&_mh_execute_header, v0, v1, "Failed to discover peripheral after %lu seconds", v2);
  sub_100008F38();
}

void sub_10000A398()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100008F08();
  sub_100008EF4(v1);
  v2 = objc_msgSend((id)sub_100008EFC(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100008EC4();
  sub_100008EA4((void *)&_mh_execute_header, v4, v5, "Failed to connect peripheral \"%@\" after %lu seconds", v6, v7, v8, v9, v10);

  sub_100008E94();
}

void sub_10000A41C()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100008F08();
  sub_100008EF4(v1);
  v2 = objc_msgSend((id)sub_100008EFC(), "peripheral");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100008EC4();
  sub_100008EA4((void *)&_mh_execute_header, v4, v5, "Failed to receive pairing request for peripheral \"%@\" after %lu seconds", v6, v7, v8, v9, v10);

  sub_100008E94();
}

void sub_10000A4A0()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100008F08();
  sub_100008EF4(v1);
  v2 = objc_msgSend((id)sub_100008EFC(), "accessoryID");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100008EC4();
  sub_100008EA4((void *)&_mh_execute_header, v4, v5, "Failed to receive passkey data from accessory \"%@\" after %lu seconds", v6, v7, v8, v9, v10);

  sub_100008E94();
}

void sub_10000A524()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_100008F08();
  sub_100008EF4(v1);
  v2 = objc_msgSend((id)sub_100008EFC(), "accessoryID");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100008EC4();
  sub_100008EA4((void *)&_mh_execute_header, v4, v5, "Failed to receive pair state update from accessory \"%@\" after %lu seconds", v6, v7, v8, v9, v10);

  sub_100008E94();
}

void sub_10000A5A8()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  sub_100008F08();
  sub_100008EF4(v1);
  sub_100008F94();
  sub_100008EC4();
  sub_100008EA4((void *)&_mh_execute_header, v2, v3, "Failed to advance unexpected state %lu after %lu seconds", v4, v5, v6, v7, v8);

  sub_100008E94();
}

void sub_10000A61C()
{
  uint64_t v0;
  NSObject *v1;
  id v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  id v6;

  sub_100008F08();
  sub_100008EF4(v2);
  v3 = 134218240;
  v4 = v0;
  v5 = 2048;
  v6 = sub_100008F94();
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "Checking timeout for state %lu (current: %lu)", (uint8_t *)&v3, 0x16u);

  sub_100008E94();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend_acceptPairing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acceptPairing");
}

id objc_msgSend_accessoryCookies(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryCookies");
}

id objc_msgSend_accessoryID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryID");
}

id objc_msgSend_accessoryPairingWizardDidFinish_success_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryPairingWizardDidFinish:success:");
}

id objc_msgSend_accessoryQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryQueue");
}

id objc_msgSend_accessoryType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryType");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_advanceState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "advanceState");
}

id objc_msgSend_alert(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alert");
}

id objc_msgSend_alertWithTitle_message_defaultButton_alternateButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alertWithTitle:message:defaultButton:alternateButton:");
}

id objc_msgSend_alternateButtonText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alternateButtonText");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_askUserApproval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "askUserApproval");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancel");
}

id objc_msgSend_cancelPeripheralConnection_force_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelPeripheralConnection:force:");
}

id objc_msgSend_centerNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "centerNamed:");
}

id objc_msgSend_centralManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "centralManager");
}

id objc_msgSend_connectPeripheral(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectPeripheral");
}

id objc_msgSend_connectPeripheral_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectPeripheral:options:");
}

id objc_msgSend_connectionID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionID");
}

id objc_msgSend_connectionTryCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionTryCount");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentAccessory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentAccessory");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_defaultButtonText(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultButtonText");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_dequeueDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dequeueDevice:");
}

id objc_msgSend_determinePairStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "determinePairStatus");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_discoverPeripheral(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoverPeripheral");
}

id objc_msgSend_discoveryName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoveryName");
}

id objc_msgSend_discoveryNameForAccessoryID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discoveryNameForAccessoryID:");
}

id objc_msgSend_enqueueDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enqueueDevice:");
}

id objc_msgSend_enterPairingMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enterPairingMode");
}

id objc_msgSend_eraseExistingKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eraseExistingKeys");
}

id objc_msgSend_establishLECommunication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "establishLECommunication");
}

id objc_msgSend_exchangeInitialState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exchangeInitialState");
}

id objc_msgSend_exchangeOOBData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exchangeOOBData");
}

id objc_msgSend_exchangePasskeyData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exchangePasskeyData");
}

id objc_msgSend_failPairing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "failPairing");
}

id objc_msgSend_finishPairing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishPairing");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBytes:length:");
}

id objc_msgSend_getUUIDBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getUUIDBytes:");
}

id objc_msgSend_hasTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasTag:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_initWithAccessoryInfo_pairingMethod_delegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAccessoryInfo:pairingMethod:delegate:");
}

id objc_msgSend_initWithDelegate_queue_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:queue:options:");
}

id objc_msgSend_initWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPath:");
}

id objc_msgSend_initWithUUIDBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDBytes:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initiatePairing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initiatePairing");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "message");
}

id objc_msgSend_mobileBluetoothBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mobileBluetoothBundle");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_oldPeripheral(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "oldPeripheral");
}

id objc_msgSend_pairedAccessories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairedAccessories");
}

id objc_msgSend_pairingAgent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingAgent");
}

id objc_msgSend_pairingMethod(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingMethod");
}

id objc_msgSend_pairingType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairingType");
}

id objc_msgSend_passkey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passkey");
}

id objc_msgSend_peripheral(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peripheral");
}

id objc_msgSend_persistenceAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistenceAssertion");
}

id objc_msgSend_pointerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pointerValue");
}

id objc_msgSend_presentAlert_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentAlert:");
}

id objc_msgSend_previousCentralManagerState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "previousCentralManagerState");
}

id objc_msgSend_processAccessoryQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processAccessoryQueue");
}

id objc_msgSend_processConnectedAccessories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processConnectedAccessories");
}

id objc_msgSend_releasePersistenceAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "releasePersistenceAssertion");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_respondToPairingRequest_type_accept_data_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "respondToPairingRequest:type:accept:data:");
}

id objc_msgSend_responseHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "responseHandler");
}

id objc_msgSend_responseWithAlert_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "responseWithAlert:handler:");
}

id objc_msgSend_retrievePairedPeers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrievePairedPeers");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_scanForPeripheralsWithServices_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanForPeripheralsWithServices:options:");
}

id objc_msgSend_sendPairingInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendPairingInfo");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setAccessoryCookies_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryCookies:");
}

id objc_msgSend_setAlert_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlert:");
}

id objc_msgSend_setAlternateButtonText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlternateButtonText:");
}

id objc_msgSend_setCentralManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCentralManager:");
}

id objc_msgSend_setConnectionTryCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectionTryCount:");
}

id objc_msgSend_setCurrentAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentAccessory:");
}

id objc_msgSend_setDefaultButtonText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDefaultButtonText:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMessage:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOldPeripheral_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOldPeripheral:");
}

id objc_msgSend_setPairedAccessories_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPairedAccessories:");
}

id objc_msgSend_setPairingAgent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPairingAgent:");
}

id objc_msgSend_setPairingType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPairingType:");
}

id objc_msgSend_setPasskey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPasskey:");
}

id objc_msgSend_setPeripheral_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPeripheral:");
}

id objc_msgSend_setPersistenceAssertion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPersistenceAssertion:");
}

id objc_msgSend_setPowered_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPowered:");
}

id objc_msgSend_setPreviousCentralManagerState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreviousCentralManagerState:");
}

id objc_msgSend_setResponseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResponseHandler:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setState:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setUserAlert_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserAlert:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedPairingAgent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedPairingAgent");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_startDeliveringNotificationsToMainThread(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDeliveringNotificationsToMainThread");
}

id objc_msgSend_startExpirationTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startExpirationTimer:");
}

id objc_msgSend_startPairing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startPairing");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_stopDeliveringNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopDeliveringNotifications");
}

id objc_msgSend_stopScan(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopScan");
}

id objc_msgSend_storePairingInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storePairingInfo");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_tag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tag:");
}

id objc_msgSend_takePersistenceAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "takePersistenceAssertion");
}

id objc_msgSend_timerExpiredWithState_after_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timerExpiredWithState:after:");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "title");
}

id objc_msgSend_turnOnBluetooth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "turnOnBluetooth");
}

id objc_msgSend_unpairPeer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unpairPeer:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_userAlert(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userAlert");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_valueWithPointer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithPointer:");
}
