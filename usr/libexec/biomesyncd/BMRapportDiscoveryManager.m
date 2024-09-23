@implementation BMRapportDiscoveryManager

- (BMRapportDiscoveryManager)initWithServiceName:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v9;
  id v10;
  id v11;
  BMRapportDiscoveryManager *v12;
  BMRapportDiscoveryManager *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *devices;
  NSMutableDictionary *v16;
  NSMutableDictionary *unsupportedDevices;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BMRapportDiscoveryManager;
  v12 = -[BMRapportDiscoveryManager init](&v19, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serviceName, a3);
    objc_storeStrong((id *)&v13->_queue, a5);
    objc_storeWeak((id *)&v13->_delegate, v10);
    v14 = objc_opt_new(NSMutableDictionary);
    devices = v13->_devices;
    v13->_devices = v14;

    v16 = objc_opt_new(NSMutableDictionary);
    unsupportedDevices = v13->_unsupportedDevices;
    v13->_unsupportedDevices = v16;

  }
  return v13;
}

- (id)newDiscoveryClients
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_invalidated)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BMRapportClient clientForSameAccountDiscoveryWithServiceName:delegate:queue:](BMRapportClient, "clientForSameAccountDiscoveryWithServiceName:delegate:queue:", CFSTR("com.apple.biomesyncd.rapport"), self, self->_queue));
  v5 = v4;
  if (!v4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v10[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BMRapportClient clientForSharedHomeDiscoveryWithServiceName:delegate:queue:](BMRapportClient, "clientForSharedHomeDiscoveryWithServiceName:delegate:queue:", CFSTR("com.apple.biomesyncd.rapport"), self, self->_queue));
  v7 = v6;
  if (!v6)
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v10[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_pas_filteredArrayWithTest:", &stru_100068D40));

  if (!v6)
  if (!v4)

  return v3;
}

- (void)rapportClient:(id)a3 didDiscoverDevice:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
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
  void *v24;
  BMRapportDevice *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  id WeakRetained;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  int v34;
  void *v35;

  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_invalidated)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bm_companionLinkDeviceIdentifier"));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "model"));

      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v6));
        if (v8)
        {

        }
        else
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_unsupportedDevices, "objectForKeyedSubscript:", v6));

          if (!v24)
          {
            v25 = -[BMRapportDevice initWithRPCompanionLinkDevice:]([BMRapportDevice alloc], "initWithRPCompanionLinkDevice:", v5);
            v26 = objc_claimAutoreleasedReturnValue(-[BMRapportDevice serviceTypes](v25, "serviceTypes"));
            if (v26
              && (v27 = (void *)v26,
                  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportDevice serviceTypes](v25, "serviceTypes")),
                  v29 = objc_msgSend(v28, "containsObject:", self->_serviceName),
                  v28,
                  v27,
                  (v29 & 1) == 0))
            {
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_unsupportedDevices, "setObject:forKeyedSubscript:", v25, v6);
            }
            else
            {
              WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
              if ((objc_msgSend(WeakRetained, "discoveryManager:supportsDevice:", self, v25) & 1) != 0)
              {
                -[NSMutableDictionary setObject:forKeyedSubscript:](self->_devices, "setObject:forKeyedSubscript:", v25, v6);
                v31 = __biome_log_for_category(11);
                v32 = objc_claimAutoreleasedReturnValue(v31);
                if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                {
                  v33 = (void *)objc_claimAutoreleasedReturnValue(-[BMRapportDevice shortenedRapportIdentifier](v25, "shortenedRapportIdentifier"));
                  v34 = 138412290;
                  v35 = v33;
                  _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "BMRappportDiscoveryManager: discovered device %@", (uint8_t *)&v34, 0xCu);

                }
                objc_msgSend(WeakRetained, "discoveryManager:didDiscoverDevice:", self, v25);
              }
              else
              {
                -[NSMutableDictionary setObject:forKeyedSubscript:](self->_unsupportedDevices, "setObject:forKeyedSubscript:", v25, v6);
              }

            }
          }
        }
        goto LABEL_11;
      }
      v17 = __biome_log_for_category(11);
      v10 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_100041C98((uint64_t)v5, v10, v18, v19, v20, v21, v22, v23);
    }
    else
    {
      v9 = __biome_log_for_category(11);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_100041C30((uint64_t)v5, v10, v11, v12, v13, v14, v15, v16);
    }

LABEL_11:
  }

}

- (void)rapportClient:(id)a3 didLoseDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  id v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  NSObject *WeakRetained;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  id v29;
  _BYTE v30[128];

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_invalidated)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bm_companionLinkDeviceIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v8));
    if (v9)
    {

    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_unsupportedDevices, "objectForKeyedSubscript:", v8));

      if (!v10)
      {
LABEL_22:

        goto LABEL_23;
      }
    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = self->_discoveryClients;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v16 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          if (v16 != v6)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "activeDevices", (_QWORD)v24));
            v18 = objc_msgSend(v17, "containsObject:", v7);

            if (v18)
            {
              v23 = __biome_log_for_category(11);
              WeakRetained = objc_claimAutoreleasedReturnValue(v23);
              if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v29 = v7;
                _os_log_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_INFO, "BMRappportDiscoveryManager: already discovered by other connection to rapport %@", buf, 0xCu);
              }
              goto LABEL_20;
            }
          }
        }
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
        if (v13)
          continue;
        break;
      }
    }

    v11 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v8));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_devices, "setObject:forKeyedSubscript:", 0, v8);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_unsupportedDevices, "setObject:forKeyedSubscript:", 0, v8);
    if (v11)
    {
      v19 = __biome_log_for_category(11);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray shortenedRapportIdentifier](v11, "shortenedRapportIdentifier"));
        *(_DWORD *)buf = 138412290;
        v29 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "BMRappportDiscoveryManager: lost device %@", buf, 0xCu);

      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      -[NSObject discoveryManager:didLoseDevice:](WeakRetained, "discoveryManager:didLoseDevice:", self, v11);
LABEL_20:

    }
    goto LABEL_22;
  }
LABEL_23:

}

- (void)ignoreDevice:(id)a3
{
  id v4;
  NSMutableDictionary *unsupportedDevices;
  void *v6;
  void *v7;
  NSMutableDictionary *devices;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;
  id WeakRetained;
  int v19;
  void *v20;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    if (!self->_invalidated)
    {
      unsupportedDevices = self->_unsupportedDevices;
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rapportIdentifier"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](unsupportedDevices, "objectForKeyedSubscript:", v6));

      if (!v7)
      {
        devices = self->_devices;
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rapportIdentifier"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](devices, "objectForKeyedSubscript:", v9));

        if (v10)
        {
          v11 = __biome_log_for_category(11);
          v12 = objc_claimAutoreleasedReturnValue(v11);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shortenedRapportIdentifier"));
            v19 = 138412290;
            v20 = v13;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "BMRappportDiscoveryManager: ignore device %@", (uint8_t *)&v19, 0xCu);

          }
          v14 = self->_devices;
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rapportIdentifier"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", 0, v15);

          v16 = self->_unsupportedDevices;
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rapportIdentifier"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v4, v17);

          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(WeakRetained, "discoveryManager:didLoseDevice:", self, v4);

        }
      }
    }
  }

}

- (NSArray)devices
{
  void *v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_invalidated)
    v3 = 0;
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_devices, "allValues"));
  return (NSArray *)v3;
}

- (id)deviceWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_invalidated)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_discoveryClients, "firstObject"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localDevice"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bm_companionLinkDeviceIdentifier"));
    v9 = objc_msgSend(v8, "isEqual:", v4);

    if (v9)
      v10 = objc_claimAutoreleasedReturnValue(-[BMRapportDiscoveryManager localDevice](self, "localDevice"));
    else
      v10 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v4));
    v5 = (void *)v10;
  }

  return v5;
}

- (id)localDevice
{
  BMRapportDevice *v3;
  BMRapportDevice *v4;
  void *v5;
  void *v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_invalidated)
  {
    v3 = 0;
  }
  else
  {
    v4 = [BMRapportDevice alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_discoveryClients, "firstObject"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localDevice"));
    v3 = -[BMRapportDevice initWithRPCompanionLinkDevice:](v4, "initWithRPCompanionLinkDevice:", v6);

  }
  return v3;
}

- (void)startWithCompletion:(id)a3
{
  void (**v4)(id, NSObject *);
  NSMutableArray *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  NSArray *discoveryClients;
  NSArray *v10;
  NSArray *v11;
  NSArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  NSObject *queue;
  BMRapportDiscoveryManager *v19;
  _QWORD block[4];
  NSMutableArray *v21;
  BMRapportDiscoveryManager *v22;
  void (**v23)(id, NSObject *);
  _QWORD v24[4];
  NSMutableArray *v25;
  NSObject *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[8];
  _BYTE v32[128];
  NSErrorUserInfoKey v33;
  const __CFString *v34;

  v4 = (void (**)(id, NSObject *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_invalidated)
  {
    v33 = NSLocalizedDescriptionKey;
    v34 = CFSTR("BMRappportDiscoveryManager has been invalidated");
    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
    v6 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BMRapportErrorDomain"), 4, v5));
    v4[2](v4, v6);
  }
  else
  {
    v7 = __biome_log_for_category(11);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "BMRappportDiscoveryManager: start", buf, 2u);
    }

    v5 = objc_opt_new(NSMutableArray);
    v6 = dispatch_group_create();
    discoveryClients = self->_discoveryClients;
    if (!discoveryClients)
    {
      v10 = -[BMRapportDiscoveryManager newDiscoveryClients](self, "newDiscoveryClients");
      v11 = self->_discoveryClients;
      self->_discoveryClients = v10;

      discoveryClients = self->_discoveryClients;
    }
    v19 = self;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v12 = discoveryClients;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          dispatch_group_enter(v6);
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_1000105B8;
          v24[3] = &unk_100068D68;
          v25 = v5;
          v26 = v6;
          objc_msgSend(v17, "activateWithCompletion:", v24);

        }
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v14);
    }

    if (v4)
    {
      queue = v19->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000105E8;
      block[3] = &unk_100068D90;
      v5 = v5;
      v21 = v5;
      v22 = v19;
      v23 = v4;
      dispatch_group_notify(v6, queue, block);

    }
  }

}

- (void)stop
{
  uint64_t v3;
  NSObject *v4;
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSArray *discoveryClients;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[8];
  _BYTE v16[128];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_invalidated)
  {
    v3 = __biome_log_for_category(11);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "BMRappportDiscoveryManager: stop", buf, 2u);
    }

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = self->_discoveryClients;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), "invalidate", (_QWORD)v11);
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v7);
    }

    discoveryClients = self->_discoveryClients;
    self->_discoveryClients = 0;

  }
}

- (void)invalidate
{
  uint64_t v3;
  NSObject *v4;
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSArray *discoveryClients;
  NSMutableDictionary *unsupportedDevices;
  NSMutableDictionary *devices;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[8];
  _BYTE v18[128];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_invalidated)
  {
    v3 = __biome_log_for_category(11);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "BMRappportDiscoveryManager: invalidate", buf, 2u);
    }

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = self->_discoveryClients;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), "invalidate", (_QWORD)v13);
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v7);
    }

    discoveryClients = self->_discoveryClients;
    self->_discoveryClients = 0;

    unsupportedDevices = self->_unsupportedDevices;
    self->_unsupportedDevices = 0;

    devices = self->_devices;
    self->_devices = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveryClients, 0);
  objc_storeStrong((id *)&self->_unsupportedDevices, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
