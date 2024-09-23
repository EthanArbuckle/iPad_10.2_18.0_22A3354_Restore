void sub_1000018A4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;

  v3 = a2;
  if (v3)
  {
    v4 = ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138412546;
      v11 = v9;
      v12 = 2112;
      v13 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@ provider failed to process signal request error %@", (uint8_t *)&v10, 0x16u);
    }

    v6 = *(void **)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v8 = v3;
  }
  else
  {
    v6 = *(void **)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v8 = 0;
  }
  sub_100001988(v6, v8, v7);

}

void sub_100001988(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  if (a1)
  {
    v5 = a3;
    v6 = a2;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "managerObjectFactory"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "managerObject"));

    objc_msgSend(v8, "handleProviderError:forMessageID:", v6, v5);
  }
}

void sub_100001A0C(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  v2 = ne_log_obj();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138412290;
    v9 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%@ provider stopped", (uint8_t *)&v8, 0xCu);
  }

  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managerObjectFactory"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "managerObject"));

    objc_msgSend(v6, "handleProviderStopped");
  }
}

void sub_100001AE4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;

  v3 = a2;
  if (v3)
  {
    v4 = ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412546;
      v10 = v8;
      v11 = 2112;
      v12 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@ failed to start the provider, error %@", (uint8_t *)&v9, 0x16u);
    }

    v6 = *(void **)(a1 + 32);
    v7 = v3;
  }
  else
  {
    v6 = *(void **)(a1 + 32);
    v7 = 0;
  }
  sub_100001BC8(v6, v7);

}

void sub_100001BC8(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "managerObjectFactory"));
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managerObject"));

    objc_msgSend(v5, "handleProviderError:", v3);
  }
}

void sub_100001C30(void *a1, uint64_t a2)
{
  void *v3;
  id v4;

  if (a1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "managerObjectFactory"));
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managerObject"));

    objc_msgSend(v4, "handleProviderInstallationStatus:", a2);
  }
}

void sub_100001C88(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___NEAppPushPluginDriver));
  v2 = (void *)qword_10000E1D8;
  qword_10000E1D8 = v1;

}

void sub_100001CBC(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___NEAppPushPluginManager));
  v2 = (void *)qword_10000E1C8;
  qword_10000E1C8 = v1;

}

uint64_t start()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  SEL v4;
  SEL v5;
  const char *v6;
  SEL v7;
  void *v8;
  void *v9;
  uint64_t v11;
  NSObject *v12;
  int v13;
  const char *v14;

  v0 = objc_autoreleasePoolPush();
  v1 = sub_1000038A0();
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.neagent"));
    objc_setProperty_atomic(v2, v4, v3, 16);

    if (!objc_getProperty(v2, v5, 16, 1))
    {
      v11 = ne_log_obj();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = 136315138;
        v14 = "com.apple.neagent";
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to create an XPC listener for service %s", (uint8_t *)&v13, 0xCu);
      }

      exit(1);
    }
    objc_msgSend(objc_getProperty(v2, v6, 16, 1), "setDelegate:", v2);
    objc_msgSend(objc_getProperty(v2, v7, 16, 1), "resume");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    objc_msgSend(v8, "addObserver:", v2);

  }
  objc_autoreleasePoolPop(v0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  objc_msgSend(v9, "run");

  return 0;
}

void sub_100002AF4(void *a1, const char *a2, uint64_t a3)
{
  const char *v6;
  void (**Property)(id, _QWORD, const char *);
  SEL v8;

  if (a1)
  {
    if (objc_getProperty(a1, a2, 56, 1))
    {
      Property = (void (**)(id, _QWORD, const char *))objc_getProperty(a1, v6, 56, 1);
      Property[2](Property, a3, a2);
      objc_setProperty_atomic_copy(a1, v8, 0, 56);
    }
  }
}

void sub_100002B70(uint64_t a1, const char *a2)
{
  id Property;
  const char *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  NSData *v10;
  const char *v11;
  void *v12;

  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, a2, 48, 1);
  v5 = Property;
  v6 = SOAuthorizationOperationFetchNetworkCredentials;
  v7 = *(id *)(a1 + 32);
  if (v7)
    v7 = objc_getProperty(v7, v4, 32, 1);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = v7;
  v10 = objc_opt_new(NSData);
  objc_msgSend(v5, "beginAuthorizationWithOperation:url:httpHeaders:httpBody:", v6, v9, v8, v10);

  v12 = *(void **)(a1 + 32);
  if (v12)
    objc_setProperty_atomic_copy(v12, v11, *(id *)(a1 + 48), 56);
}

void sub_100002C40(uint64_t a1, const char *a2)
{
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  id Property;
  void *v8;
  void *v9;
  const char *v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint8_t *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  __int16 v23;
  __int16 v24;
  __int16 v25;
  uint8_t v26[16];
  uint8_t buf[16];

  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_setProperty_atomic(v3, a2, *(id *)(a1 + 40), 40);
    v5 = *(void **)(a1 + 32);
    if (v5)
    {
      if (objc_getProperty(v5, v4, 40, 1))
      {
        Property = *(id *)(a1 + 32);
        if (Property)
          Property = objc_getProperty(Property, v6, 40, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "VPN"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "protocol"));

        if (!v9)
        {
          v11 = *(id *)(a1 + 32);
          if (v11)
            v11 = objc_getProperty(v11, v10, 40, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "appVPN"));
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "protocol"));

          if (!v9)
          {
            v13 = ne_log_obj();
            v14 = objc_claimAutoreleasedReturnValue(v13);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v26 = 0;
              _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Missing protocol configuration", v26, 2u);
            }

            (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
            v9 = 0;
          }
        }
        if (objc_msgSend(v9, "type") == (id)5)
        {
          if (objc_msgSend(v9, "useExtendedAuthentication"))
          {
            v15 = ne_log_obj();
            v16 = objc_claimAutoreleasedReturnValue(v15);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              v24 = 0;
              v17 = "Extensible SSO is not supported for EAP authentication";
              v18 = (uint8_t *)&v24;
LABEL_26:
              _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v17, v18, 2u);
            }
          }
          else
          {
            if (objc_msgSend(v9, "authenticationMethod") == (id)1)
            {
              (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48));
LABEL_28:

              return;
            }
            v22 = ne_log_obj();
            v16 = objc_claimAutoreleasedReturnValue(v22);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              v23 = 0;
              v17 = "Extensible SSO is supported only for certificate authentication";
              v18 = (uint8_t *)&v23;
              goto LABEL_26;
            }
          }
        }
        else
        {
          v21 = ne_log_obj();
          v16 = objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v25 = 0;
            v17 = "Extensible SSO is supported only for IKEv2";
            v18 = (uint8_t *)&v25;
            goto LABEL_26;
          }
        }

        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48));
        goto LABEL_28;
      }
    }
  }
  v19 = ne_log_obj();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Bad init message, configuration is missing", buf, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void sub_100002EC0(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___NEVPNAuthenticationPluginDriver));
  v2 = (void *)qword_10000E1F8;
  qword_10000E1F8 = v1;

}

void sub_100002EF4(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___NEVPNPluginManager));
  v2 = (void *)qword_10000E1E8;
  qword_10000E1E8 = v1;

}

void sub_100003290(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  os_unfair_lock_s *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  id v22;
  NSObject *Property;
  id (*v24)(uint64_t, const char *);
  const char *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  void **block;
  uint64_t v36;
  id (*v37)(uint64_t, const char *);
  void *v38;
  void *v39;
  id v40;
  _BYTE v41[128];
  _BYTE v42[128];

  v5 = a3;
  if (a1)
  {
    v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v5, "count"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v26 = v5;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v32;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v32 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v11), "bundleIdentifier"));
          objc_msgSend(v6, "addObject:", v12);

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
      }
      while (v9);
    }

    v13 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v14 = *(id *)(a1 + 24);
    os_unfair_lock_unlock(v13);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v28;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v28 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v19);
          if (a2 == 3)
          {
            v22 = v6;
            if (v20)
            {
              Property = objc_getProperty(v20, v25, 16, 1);
              block = _NSConcreteStackBlock;
              v36 = 3221225472;
              v24 = sub_10000462C;
              goto LABEL_20;
            }
          }
          else
          {
            if (a2)
              goto LABEL_22;
            v22 = v6;
            if (v20)
            {
              Property = objc_getProperty(v20, v21, 16, 1);
              block = _NSConcreteStackBlock;
              v36 = 3221225472;
              v24 = sub_100004660;
LABEL_20:
              v37 = v24;
              v38 = &unk_1000084C0;
              v39 = v20;
              v40 = v22;
              dispatch_async(Property, &block);

            }
          }

LABEL_22:
          v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
      }
      while (v17);
    }

    v5 = v26;
  }

}

void sub_100003550(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  void *v25;
  const char *v26;
  id v27;
  NSObject *Property;
  id (*v29)(uint64_t, const char *);
  const char *v30;
  id v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint8_t v42[128];
  uint8_t buf[8];
  uint64_t v44;
  id (*v45)(uint64_t, const char *);
  void *v46;
  void *v47;
  id v48;

  v5 = a3;
  v32 = a1;
  if (a1)
  {
    v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v5, "count"));
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v31 = v5;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v38 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pluginIdentifier", v31));

          if (v13)
          {
            v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pluginIdentifier"));
            objc_msgSend(v6, "addObject:", v17);
          }
          else
          {
            v18 = ne_log_obj(v14, v15, v16);
            v17 = objc_claimAutoreleasedReturnValue(v18);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = a2;
              _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Got a LSPlugInKitProxy with a nil identifier with event %d", buf, 8u);
            }
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v9);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(v32 + 8));
    v19 = objc_msgSend(*(id *)(v32 + 24), "copy");
    os_unfair_lock_unlock((os_unfair_lock_t)(v32 + 8));
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v20 = v19;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(_QWORD *)v34 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)j);
          if (a2 == 2)
          {
            v27 = v6;
            if (v25)
            {
              Property = objc_getProperty(v25, v30, 16, 1);
              *(_QWORD *)buf = _NSConcreteStackBlock;
              v44 = 3221225472;
              v29 = sub_1000046C8;
              goto LABEL_24;
            }
          }
          else
          {
            if (a2 != 1)
              continue;
            v27 = v6;
            if (v25)
            {
              Property = objc_getProperty(v25, v26, 16, 1);
              *(_QWORD *)buf = _NSConcreteStackBlock;
              v44 = 3221225472;
              v29 = sub_100004694;
LABEL_24:
              v45 = v29;
              v46 = &unk_1000084C0;
              v47 = v25;
              v48 = v27;
              dispatch_async(Property, buf);

            }
          }

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v22);
    }

    v5 = v31;
  }

}

id sub_1000038A0()
{
  objc_opt_self();
  if (qword_10000E210 != -1)
    dispatch_once(&qword_10000E210, &stru_1000083F8);
  return (id)qword_10000E208;
}

void sub_1000038E4(id a1)
{
  NEAgentServer *v1;
  _QWORD *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  NEInitCFTypes(a1);
  v1 = [NEAgentServer alloc];
  if (v1)
  {
    v8.receiver = v1;
    v8.super_class = (Class)NEAgentServer;
    v2 = objc_msgSendSuper2(&v8, "init");
    if (v2)
    {
      v3 = objc_alloc_init((Class)NSMutableArray);
      v4 = (void *)v2[3];
      v2[3] = v3;

      v5 = objc_alloc_init((Class)NSMutableArray);
      v6 = (void *)v2[4];
      v2[4] = v5;

      *((_DWORD *)v2 + 2) = 0;
    }
  }
  else
  {
    v2 = 0;
  }
  v7 = (void *)qword_10000E208;
  qword_10000E208 = (uint64_t)v2;

}

void sub_100003E78(void *a1, const char *a2)
{
  NSObject *Property;
  _QWORD block[5];

  if (a1)
  {
    Property = objc_getProperty(a1, a2, 16, 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100003EE4;
    block[3] = &unk_100008420;
    block[4] = a1;
    dispatch_async(Property, block);
  }
}

void sub_100003EE4(uint64_t a1, const char *a2)
{
  id Property;
  const char *v4;
  id v5;
  const char *v6;
  const char *v7;
  id v8;
  const char *v9;
  const char *v10;
  id v11;
  const char *v12;
  const char *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint8_t v24[16];

  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, a2, 24, 1);
  objc_msgSend(Property, "invalidate");
  v5 = *(id *)(a1 + 32);
  if (v5)
  {
    objc_setProperty_atomic(v5, v4, 0, 24);
    v5 = *(id *)(a1 + 32);
    if (v5)
      v5 = objc_getProperty(v5, v6, 32, 1);
  }
  objc_msgSend(v5, "invalidate");
  v8 = *(id *)(a1 + 32);
  if (v8)
  {
    objc_setProperty_atomic(v8, v7, 0, 32);
    v8 = *(id *)(a1 + 32);
    if (v8)
      v8 = objc_getProperty(v8, v9, 8, 1);
  }
  objc_msgSend(v8, "handleCancel");
  v11 = *(id *)(a1 + 32);
  if (v11)
  {
    objc_setProperty_atomic(v11, v10, 0, 8);
    v11 = *(id *)(a1 + 32);
    if (v11)
      v11 = objc_getProperty(v11, v12, 40, 1);
  }
  objc_msgSend(v11, "invalidate");
  v14 = *(void **)(a1 + 32);
  if (v14)
    objc_setProperty_atomic(v14, v13, 0, 40);
  v15 = sub_1000038A0();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (v16)
  {
    v17 = *(id *)(a1 + 32);
    os_unfair_lock_lock((os_unfair_lock_t)(v16 + 8));
    objc_msgSend(*(id *)(v16 + 24), "removeObject:", v17);

    os_unfair_lock_unlock((os_unfair_lock_t)(v16 + 8));
  }

  v21 = *(_QWORD *)(a1 + 32);
  if (!v21 || !*(_QWORD *)(v21 + 48))
  {
    v22 = ne_log_obj(v18, v19, v20);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "exiting", v24, 2u);
    }

    exit(0);
  }
}

void sub_100004068(uint64_t a1, const char *a2)
{
  void *v3;
  const char *v4;
  void *v5;
  id Property;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v3 = *(void **)(a1 + 32);
  if (v3 && objc_getProperty(v3, a2, 8, 1))
  {
    v5 = *(void **)(a1 + 32);
    if (v5)
    {
      Property = objc_getProperty(v5, v4, 8, 1);
      v7 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v7 = 0;
      Property = 0;
    }
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100004168;
    v10[3] = &unk_100008498;
    v10[4] = v7;
    v11 = *(id *)(a1 + 40);
    objc_msgSend(Property, "handleDisposeWithCompletionHandler:", v10);

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("NEAgentErrorDomain"), 1, 0);
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v9);

  }
}

uint64_t sub_100004168(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  const char *v4;
  void *v5;
  uint8_t v7[16];

  v2 = ne_log_obj();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Dispose complete", v7, 2u);
  }

  v5 = *(void **)(a1 + 32);
  if (v5)
    objc_setProperty_atomic(v5, v4, 0, 8);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_1000041F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __objc2_class **v10;
  objc_class *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  const char *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id Property;
  uint64_t v22;
  const char *v23;
  id v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  _QWORD v36[5];
  id v37;
  uint8_t buf[16];

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    *(_QWORD *)(v4 + 48) = *(_QWORD *)(a1 + 64);
  v5 = ne_log_obj(a1, a2, a3);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Initializing the delegate", buf, 2u);
  }

  v10 = (__objc2_class **)NEAgentPacketTunnelExtension_ptr;
  switch(*(_QWORD *)(a1 + 72))
  {
    case 1:
      v12 = ne_log_obj(v7, v8, v9);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Legacy plugins are not supported on iOS", buf, 2u);
      }

      v14 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("NEAgentErrorDomain"), 2, 0);
      goto LABEL_28;
    case 2:
      v10 = (__objc2_class **)NEAgentAppProxyExtension_ptr;
      goto LABEL_15;
    case 3:
      v10 = (__objc2_class **)NEAgentDNSProxyExtension_ptr;
      goto LABEL_15;
    case 4:
    case 6:
      v10 = (__objc2_class **)NEAgentFilterExtension_ptr;
      goto LABEL_15;
    case 5:
      goto LABEL_15;
    case 7:
      v10 = &off_100008018;
      goto LABEL_15;
    case 8:
      v10 = &off_100008028;
LABEL_15:
      v11 = (objc_class *)objc_opt_class(*v10);
      break;
    default:
      v11 = 0;
      break;
  }
  v16 = [v11 alloc];
  v17 = *(_QWORD *)(a1 + 72);
  v19 = *(_QWORD *)(a1 + 40);
  v18 = *(_QWORD *)(a1 + 48);
  v20 = *(void **)(a1 + 32);
  if (v20)
  {
    Property = objc_getProperty(v20, v15, 16, 1);
    v22 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v22 = 0;
    Property = 0;
  }
  v24 = objc_msgSend(v16, "initWithPluginType:pluginClass:pluginInfo:queue:factory:", v19, v17, v18, Property, v22);
  v25 = *(void **)(a1 + 32);
  if (v25)
    objc_setProperty_atomic(v25, v23, v24, 8);

  kdebug_trace(726990968, 0, 0, 0, 0);
  v27 = *(void **)(a1 + 32);
  if (v27 && objc_getProperty(v27, v26, 8, 1))
  {
    v29 = *(void **)(a1 + 32);
    if (v29)
      v30 = objc_getProperty(v29, v28, 8, 1);
    else
      v30 = 0;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1000044F8;
    v36[3] = &unk_100008448;
    v31 = *(id *)(a1 + 56);
    v36[4] = *(_QWORD *)(a1 + 32);
    v37 = v31;
    objc_msgSend(v30, "handleInitWithCompletionHandler:", v36);
    v14 = v37;
  }
  else
  {
    v14 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("NEAgentErrorDomain"), 2, 0);
    v34 = ne_log_obj(v14, v32, v33);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "NEAgentSession: failed to create the delegate", buf, 2u);
    }

LABEL_28:
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void sub_1000044F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  id Property;
  uint64_t v9;
  const char *v10;
  void *v11;
  id v12;
  void *v13;
  uint8_t v14[16];

  if ((a2 & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = ne_log_obj(a1, a2, a3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "NEAgentSession: failed to initialize the delegate", v14, 2u);
    }

    v4 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("NEAgentErrorDomain"), 2, 0);
  }
  kdebug_trace(726990964, 0, 0, 0, 0);
  Property = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  if (Property)
    Property = objc_getProperty(Property, v7, 40, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "endpoint"));
  v12 = *(id *)(a1 + 32);
  if (v12)
    v12 = objc_getProperty(v12, v10, 8, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuids"));
  (*(void (**)(uint64_t, id, void *, void *))(v9 + 16))(v9, v4, v11, v13);

}

void sub_10000461C(uint64_t a1, const char *a2)
{
  sub_100003E78(*(void **)(a1 + 32), a2);
}

void sub_100004624(uint64_t a1, const char *a2)
{
  sub_100003E78(*(void **)(a1 + 32), a2);
}

id sub_10000462C(uint64_t a1, const char *a2)
{
  id Property;

  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, a2, 8, 1);
  return objc_msgSend(Property, "handleAppsUninstalled:", *(_QWORD *)(a1 + 40));
}

id sub_100004660(uint64_t a1, const char *a2)
{
  id Property;

  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, a2, 8, 1);
  return objc_msgSend(Property, "handleAppsUpdateBegins:", *(_QWORD *)(a1 + 40));
}

id sub_100004694(uint64_t a1, const char *a2)
{
  id Property;

  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, a2, 8, 1);
  return objc_msgSend(Property, "handleAppsUpdateEnding:", *(_QWORD *)(a1 + 40));
}

id sub_1000046C8(uint64_t a1, const char *a2)
{
  id Property;

  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, a2, 8, 1);
  return objc_msgSend(Property, "handleAppsUpdateEnds:", *(_QWORD *)(a1 + 40));
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_VPN(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "VPN");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_anonymousListener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "anonymousListener");
}

id objc_msgSend_appVPN(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appVPN");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_authenticationMethod(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticationMethod");
}

id objc_msgSend_beginAuthorizationWithOperation_url_httpHeaders_httpBody_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginAuthorizationWithOperation:url:httpHeaders:httpBody:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleURL");
}

id objc_msgSend_canPerformAuthorizationWithURL_responseCode_useInternalExtensions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canPerformAuthorizationWithURL:responseCode:useInternalExtensions:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_driverInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "driverInterface");
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endpoint");
}

id objc_msgSend_extensionIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionIdentifier");
}

id objc_msgSend_handleCancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleCancel");
}

id objc_msgSend_handleDisposeWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleDisposeWithCompletionHandler:");
}

id objc_msgSend_handleInitWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleInitWithCompletionHandler:");
}

id objc_msgSend_handleProviderError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleProviderError:");
}

id objc_msgSend_handleProviderError_forMessageID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleProviderError:forMessageID:");
}

id objc_msgSend_handleProviderInstallationStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleProviderInstallationStatus:");
}

id objc_msgSend_handleProviderStopped(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleProviderStopped");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDomain:code:userInfo:");
}

id objc_msgSend_initWithIdentifier_url_machOUUIDs_name_appGroups_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:url:machOUUIDs:name:appGroups:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithPluginType_pluginClass_pluginInfo_queue_factory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPluginType:pluginClass:pluginInfo:queue:factory:");
}

id objc_msgSend_initWithUUIDBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDBytes:");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_lookupIdentifier_plugins_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lookupIdentifier:plugins:");
}

id objc_msgSend_machOUUIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "machOUUIDs");
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_managerInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managerInterface");
}

id objc_msgSend_managerObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managerObject");
}

id objc_msgSend_managerObjectFactory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managerObjectFactory");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_pluginIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pluginIdentifier");
}

id objc_msgSend_pluginProxyWithIdentifier_type_pluginClass_extensionPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pluginProxyWithIdentifier:type:pluginClass:extensionPoint:");
}

id objc_msgSend_protocol(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "protocol");
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxy");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_reportIncomingCall_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportIncomingCall:");
}

id objc_msgSend_reportPushToTalkMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportPushToTalkMessage:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_sendExtensionFailed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendExtensionFailed");
}

id objc_msgSend_sendOutgoingCallMessage_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendOutgoingCallMessage:completionHandler:");
}

id objc_msgSend_sendTimerEvent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendTimerEvent");
}

id objc_msgSend_serverAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serverAddress");
}

id objc_msgSend_sessionContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionContext");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDelegateDispatchQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegateDispatchQueue:");
}

id objc_msgSend_setEnableUserInteraction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnableUserInteraction:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setProviderConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProviderConfiguration:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_startConnectionWithProviderConfig_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startConnectionWithProviderConfig:completionHandler:");
}

id objc_msgSend_stopWithReason_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopWithReason:completionHandler:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_useExtendedAuthentication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useExtendedAuthentication");
}

id objc_msgSend_uuids(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uuids");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueForHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForHTTPHeaderField:");
}
