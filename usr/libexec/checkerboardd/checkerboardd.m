void sub_1000017C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000017E4(uint64_t a1, void *a2, int a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  uint8_t buf[4];
  id v17;

  v5 = a2;
  v6 = CheckerBoardLogHandleForCategory(11);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "DeviceDiscovery: remoteDevice: %@", buf, 0xCu);
  }

  v8 = CheckerBoardLogHandleForCategory(11);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v17) = a3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "DeviceDiscovery: canceling: %i", buf, 8u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11 = WeakRetained;
  if (v5 && (a3 & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "dispatchQueue"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000019B4;
    v15[3] = &unk_10000C3D8;
    v15[4] = *(_QWORD *)(a1 + 32);
    remote_device_set_connected_callback(v5, v12, v15);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dispatchQueue"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100001AA4;
    v14[3] = &unk_10000C3D8;
    v14[4] = *(_QWORD *)(a1 + 32);
    remote_device_set_disconnected_callback(v5, v13, v14);

  }
}

void sub_1000019B4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  CBDRemoteDeviceConnection *v6;
  void *v7;
  int v8;
  id v9;

  v3 = a2;
  v4 = CheckerBoardLogHandleForCategory(11);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DeviceDiscovery: device connected callback %@", (uint8_t *)&v8, 0xCu);
  }

  v6 = -[CBDRemoteDeviceConnection initWithRemoteDevice:]([CBDRemoteDeviceConnection alloc], "initWithRemoteDevice:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  objc_msgSend(v7, "didConnectDeviceConnection:", v6);

}

void sub_100001AA4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  CBDRemoteDeviceConnection *v6;
  void *v7;
  int v8;
  id v9;

  v3 = a2;
  v4 = CheckerBoardLogHandleForCategory(11);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DeviceDiscovery: device disconnected callback %@", (uint8_t *)&v8, 0xCu);
  }

  v6 = -[CBDRemoteDeviceConnection initWithRemoteDevice:]([CBDRemoteDeviceConnection alloc], "initWithRemoteDevice:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  objc_msgSend(v7, "didDisconnectDeviceConnection:", v6);

}

void sub_100002F88(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t start()
{
  CBDMainController *v0;
  void *v1;
  void *v2;
  void *v3;
  uint8_t v5[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Hello, World! checkerboardd is alive!", v5, 2u);
  }
  v0 = objc_alloc_init(CBDMainController);
  v1 = (void *)qword_100012E68;
  qword_100012E68 = (uint64_t)v0;

  objc_msgSend((id)qword_100012E68, "start");
  v2 = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  objc_msgSend(v3, "run");

  objc_autoreleasePoolPop(v2);
  return 0;
}

void sub_10000328C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000032A8(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;

  v3 = a2;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000335C;
  v4[3] = &unk_10000C468;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  xpc_remote_connection_set_event_handler(v3, v4);
  xpc_remote_connection_activate(v3);
  objc_destroyWeak(&v5);

}

void sub_100003344(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000335C(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;
  NSObject *v6;
  xpc_type_t type;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id WeakRetained;
  int v19;
  char *v20;

  v3 = a2;
  v4 = xpc_copy_description(v3);
  v5 = CheckerBoardLogHandleForCategory(11);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 136315138;
    v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Remote XPC Service: Server received message: %s", (uint8_t *)&v19, 0xCu);
  }

  free(v4);
  type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    v17 = objc_autoreleasePoolPush();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_handleEvent:", v3);

    objc_autoreleasePoolPop(v17);
  }
  else
  {
    v8 = (uint64_t)type;
    if (type == (xpc_type_t)&_xpc_type_error)
    {
      v10 = objc_loadWeakRetained((id *)(a1 + 32));
      -[NSObject _handleError:](v10, "_handleError:", v3);
    }
    else
    {
      v9 = CheckerBoardLogHandleForCategory(11);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_1000072E4(v8, v10, v11, v12, v13, v14, v15, v16);
    }

  }
}

void sub_100003764(_Unwind_Exception *exception_object, int a2)
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a2 == 1)
  {
    v2 = objc_begin_catch(exception_object);
    v3 = CheckerBoardLogHandleForCategory(11);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10000740C((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);

    objc_end_catch();
    JUMPOUT(0x100003744);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000037D4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  id v17;

  v3 = a2;
  v4 = CheckerBoardLogHandleForCategory(11);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "XPC object decoded as: %@", (uint8_t *)&v16, 0xCu);
  }

  if (v3)
  {
    if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class(CBDRemoteXPCMessagePing, v6)))
      objc_msgSend(v3, "setConnection:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "_dispatchReceivedMessage:event:client:", v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
  }
  else
  {
    v7 = CheckerBoardLogHandleForCategory(11);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100007470(v8, v9, v10, v11, v12, v13, v14, v15);

  }
}

void sub_100003A38(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;

  v2 = CheckerBoardLogHandleForCategory(11);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "delegate"));
    *(_DWORD *)buf = 138412546;
    v17 = v4;
    v18 = 2112;
    v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dispatching message to delegate; message = %@, delegate = %@",
      buf,
      0x16u);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "delegate"));
  v7 = *(void **)(a1 + 32);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100003B94;
  v11[3] = &unk_10000C4B8;
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(a1 + 48);
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = *(id *)(a1 + 56);
  objc_msgSend(v6, "didReceiveRemoteXPCMessage:completion:", v8, v11);

}

void sub_100003B94(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;

  v3 = a2;
  v4 = CheckerBoardLogHandleForCategory(11);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "delegate"));
    v10 = 138412802;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Delegate acknowledged message receipt; message = %@, delegate = %@, reply = %@",
      (uint8_t *)&v10,
      0x20u);

  }
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "_sendReply:event:client:", v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "replyClass"))
  {
    v8 = CheckerBoardLogHandleForCategory(11);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100007534(a1 + 32, a1);

  }
}

void sub_100003EEC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100003EFC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t sub_100004438(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  xpc_type_t type;
  xpc_type_t v8;
  uint64_t v9;
  NSObject *v10;
  NSNumber *v11;
  id v12;
  NSNumber *v13;
  NSNumber *v14;
  NSNumber *v15;
  NSString *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  xpc_type_t v22;
  __int16 v23;
  id v24;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a2));
  type = xpc_get_type(v5);
  if (type == (xpc_type_t)&_xpc_type_BOOL)
  {
    v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", xpc_BOOL_get_value(v5));
    v12 = (id)objc_claimAutoreleasedReturnValue(v11);
LABEL_16:
    v17 = v12;
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v12, v6);

    goto LABEL_17;
  }
  v8 = type;
  if (type == (xpc_type_t)&_xpc_type_int64)
  {
    v13 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", xpc_int64_get_value(v5));
    v12 = (id)objc_claimAutoreleasedReturnValue(v13);
    goto LABEL_16;
  }
  if (type == (xpc_type_t)&_xpc_type_uint64)
  {
    v14 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", xpc_uint64_get_value(v5));
    v12 = (id)objc_claimAutoreleasedReturnValue(v14);
    goto LABEL_16;
  }
  if (type == (xpc_type_t)&_xpc_type_double)
  {
    v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", xpc_double_get_value(v5));
    v12 = (id)objc_claimAutoreleasedReturnValue(v15);
    goto LABEL_16;
  }
  if (type == (xpc_type_t)&_xpc_type_string)
  {
    v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_string_get_string_ptr(v5));
    v12 = (id)objc_claimAutoreleasedReturnValue(v16);
    goto LABEL_16;
  }
  if (type == (xpc_type_t)&_xpc_type_uuid)
  {
    v12 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", xpc_uuid_get_bytes(v5));
    goto LABEL_16;
  }
  v9 = CheckerBoardLogHandleForCategory(11);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412802;
    v20 = v6;
    v21 = 2112;
    v22 = v8;
    v23 = 2112;
    v24 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Property key [%@] with unhandled type [%@]: %@", (uint8_t *)&v19, 0x20u);
  }

LABEL_17:
  return 1;
}

void sub_100004F38(uint64_t a1, uint64_t a2)
{
  id v3;

  if (*(_QWORD *)(a1 + 40))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "replyWithSuccess:error:", a2 == 0, a2));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void sub_100005010(id a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  NSSet *v5;
  id v6;

  v1 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CBLocalServiceClientInterface));
  v2 = (void *)qword_100012E78;
  qword_100012E78 = v1;

  v3 = (void *)qword_100012E78;
  v5 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(CBSProxyServer, v4));
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v6, "setProxyServer:completion:", 0, 0);

}

void sub_1000050E4(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CBLocalServiceServerInterface));
  v2 = (void *)qword_100012E88;
  qword_100012E88 = v1;

}

void sub_100005840(id a1)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = CheckerBoardLogHandleForCategory(11);
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Local XPC connection interrupted.", v3, 2u);
  }

}

void sub_1000058A8(id a1)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = CheckerBoardLogHandleForCategory(11);
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Local XPC connection invalidated.", v3, 2u);
  }

}

void sub_100005AC8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  id v7;

  v3 = a2;
  v4 = CheckerBoardLogHandleForCategory(11);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Local XPC - setProxyServer:completion: Can't get remote proxy object %@", (uint8_t *)&v6, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100005D20(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  id v7;

  v3 = a2;
  v4 = CheckerBoardLogHandleForCategory(11);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Local XPC - startDiagnostics: Can't get remote proxy object %@", (uint8_t *)&v6, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1000062B0(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  v2 = CheckerBoardLogHandleForCategory(11);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v9 = 138412290;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Connect to device: %@", (uint8_t *)&v9, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "hostDevice"));
  if (v5)
  {
    v6 = CheckerBoardLogHandleForCategory(11);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412290;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Error: attempt to connect already-connected host device %@", (uint8_t *)&v9, 0xCu);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setHostDevice:", *(_QWORD *)(a1 + 32));
  }
}

void sub_10000646C(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;

  v2 = CheckerBoardLogHandleForCategory(11);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v11 = 138412290;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Disconnect to device: %@", (uint8_t *)&v11, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "hostDevice"));
  v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "hostDevice"));
    objc_msgSend(v7, "invalidate");

    objc_msgSend(*(id *)(a1 + 40), "setHostDevice:", 0);
  }
  else
  {
    v8 = CheckerBoardLogHandleForCategory(11);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138412290;
      v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Error: attempt to disconnect a different device %@", (uint8_t *)&v11, 0xCu);
    }

  }
}

void sub_100006C00(uint64_t a1, uint64_t a2)
{
  id v3;

  if (*(_QWORD *)(a1 + 40))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "replyWithSuccess:error:", a2 == 0, a2));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void sub_100007214(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002F88((void *)&_mh_execute_header, a2, a3, "Unrecognized version while decoding message: %llu", a5, a6, a7, a8, 0);
}

void sub_10000727C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002F88((void *)&_mh_execute_header, a2, a3, "Magic incorrect while decoding message: %s", a5, a6, a7, a8, 2u);
}

void sub_1000072E4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002F88((void *)&_mh_execute_header, a2, a3, "Remote XPC Service: Unrecognized message type: %@", a5, a6, a7, a8, 2u);
  sub_100003F28();
}

void sub_100007348(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003EEC((void *)&_mh_execute_header, a1, a3, "XPC Service: Connection to client invalid.", a5, a6, a7, a8, 0);
  sub_100003F20();
}

void sub_100007378(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003EEC((void *)&_mh_execute_header, a1, a3, "XPC Service: Connection to client interrupted.", a5, a6, a7, a8, 0);
  sub_100003F20();
}

void sub_1000073A8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002F88((void *)&_mh_execute_header, a2, a3, "XPC Service: Unrecognized XPC error: %s", a5, a6, a7, a8, 2u);
  sub_100003F28();
}

void sub_10000740C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002F88((void *)&_mh_execute_header, a2, a3, "Invalid message, ignoring: %@", a5, a6, a7, a8, 2u);
  sub_100003F28();
}

void sub_100007470(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003EEC((void *)&_mh_execute_header, a1, a3, "Received message, but was unable to decode it.", a5, a6, a7, a8, 0);
  sub_100003F20();
}

void sub_1000074A0(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "delegate"));
  sub_100003EFC((void *)&_mh_execute_header, v2, v3, "Received message, but delegate unable to receive it; message = %@, delegate = %@",
    v4,
    v5,
    v6,
    v7,
    2u);

  sub_100003F10();
}

void sub_100007534(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a2 + 40), "delegate"));
  sub_100003EFC((void *)&_mh_execute_header, v2, v3, "Did not get a reply message from delegate, but message has a reply class. May be a bug in the delegate. message = %@, delegate = %@", v4, v5, v6, v7, 2u);

  sub_100003F10();
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend__dispatchReceivedMessage_event_client_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dispatchReceivedMessage:event:client:");
}

id objc_msgSend__handleError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleError:");
}

id objc_msgSend__handleEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleEvent:");
}

id objc_msgSend__magicIsValidOnVersion1XPCObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_magicIsValidOnVersion1XPCObject:");
}

id objc_msgSend__sendReply_event_client_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendReply:event:client:");
}

id objc_msgSend__unarchiveObjectFromVersion1XPCObject_allowedClasses_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_unarchiveObjectFromVersion1XPCObject:allowedClasses:completion:");
}

id objc_msgSend_allowedClasses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowedClasses");
}

id objc_msgSend_archiveObject_toXPCObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archiveObject:toXPCObject:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_browser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "browser");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_clientInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientInterface");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connection");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeBoolForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_didConnectDeviceConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didConnectDeviceConnection:");
}

id objc_msgSend_didDisconnectDeviceConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didDisconnectDeviceConnection:");
}

id objc_msgSend_didReceiveRemoteXPCMessage_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didReceiveRemoteXPCMessage:completion:");
}

id objc_msgSend_discovery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discovery");
}

id objc_msgSend_dispatchQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dispatchQueue");
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeBool:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodedData");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_expectedRemoteMessageClasses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "expectedRemoteMessageClasses");
}

id objc_msgSend_generateLocalIPAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateLocalIPAddress:");
}

id objc_msgSend_handleRemoteMessage_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleRemoteMessage:completion:");
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handler");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hash");
}

id objc_msgSend_hostDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hostDevice");
}

id objc_msgSend_hostDeviceSerialQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hostDeviceSerialQueue");
}

id objc_msgSend_inReplyToUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inReplyToUUID");
}

id objc_msgSend_initForReadingFromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForReadingFromData:error:");
}

id objc_msgSend_initWithAllowedMessageClasses_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAllowedMessageClasses:");
}

id objc_msgSend_initWithDictionary_copyItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:copyItems:");
}

id objc_msgSend_initWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithHandler:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithProxyReceiver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithProxyReceiver:");
}

id objc_msgSend_initWithRemoteDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRemoteDevice:");
}

id objc_msgSend_initWithRemoteMessage_success_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRemoteMessage:success:error:");
}

id objc_msgSend_initWithServer_port_token_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServer:port:token:");
}

id objc_msgSend_initWithUUIDBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDBytes:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_interruptionHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interruptionHandler");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidationHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidationHandler");
}

id objc_msgSend_ip(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ip");
}

id objc_msgSend_ipGenerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ipGenerator");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToDeviceConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToDeviceConnection:");
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMemberOfClass:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listener");
}

id objc_msgSend_localXPCServer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localXPCServer");
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_messageHandlers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageHandlers");
}

id objc_msgSend_messageQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageQueue");
}

id objc_msgSend_moveToDiagnosticsAppWithcompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveToDiagnosticsAppWithcompletion:");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_osVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "osVersion");
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "port");
}

id objc_msgSend_productType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productType");
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "properties");
}

id objc_msgSend_proxyReceiver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxyReceiver");
}

id objc_msgSend_remoteDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteDevice");
}

id objc_msgSend_remoteXPCServer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteXPCServer");
}

id objc_msgSend_replyClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replyClass");
}

id objc_msgSend_replyToRemoteMessage_success_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replyToRemoteMessage:success:error:");
}

id objc_msgSend_replyWithSuccess_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replyWithSuccess:error:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "server");
}

id objc_msgSend_serverInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serverInterface");
}

id objc_msgSend_serviceQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceQueue");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setBrowser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBrowser:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnection:");
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

id objc_msgSend_setHostDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHostDevice:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIp:");
}

id objc_msgSend_setListener_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setListener:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setName:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setProductType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProductType:");
}

id objc_msgSend_setProperties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProperties:");
}

id objc_msgSend_setProxyServer_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProxyServer:completion:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRequiresSecureCoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequiresSecureCoding:");
}

id objc_msgSend_setUuid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUuid:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_startDiagnosticsReceiver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDiagnosticsReceiver");
}

id objc_msgSend_startDiagnosticsWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDiagnosticsWithCompletion:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_success(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "success");
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronousRemoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "token");
}

id objc_msgSend_unarchiveObjectFromXPCObject_allowedClasses_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchiveObjectFromXPCObject:allowedClasses:completion:");
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uuid");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}
