@implementation PRXPCServicesManager

- (PRXPCServicesManager)init
{
  PRXPCServicesManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *xpcQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PRXPCServicesManager;
  v2 = -[PRXPCServicesManager init](&v6, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.nearbyd.xpcQueue", 0);
    xpcQueue = v2->_xpcQueue;
    v2->_xpcQueue = (OS_dispatch_queue *)v3;

    -[PRXPCServicesManager createServices](v2, "createServices");
    -[PRXPCServicesManager setupXPCListeners](v2, "setupXPCListeners");
  }
  return v2;
}

- (void)createServices
{
  NSMutableDictionary *v3;
  NSMutableDictionary *machServices;
  NSMutableArray *v5;
  NSMutableArray *listeners;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  PRDiagnosticsService *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
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
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];

  v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  machServices = self->_machServices;
  self->_machServices = v3;

  v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  listeners = self->_listeners;
  self->_listeners = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PRBeaconRangingService serviceWithQueue:](PRBeaconRangingService, "serviceWithQueue:", self->_xpcQueue));
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "machServicesNames"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v65;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v65 != v11)
          objc_enumerationMutation(v8);
        -[NSMutableDictionary setObject:forKey:](self->_machServices, "setObject:forKey:", v7, *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)v12));
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
    }
    while (v10);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[PRCompanionRangingService serviceWithQueue:](PRCompanionRangingService, "serviceWithQueue:", self->_xpcQueue));
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "machServicesNames"));
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v61;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v61 != v17)
          objc_enumerationMutation(v14);
        -[NSMutableDictionary setObject:forKey:](self->_machServices, "setObject:forKey:", v13, *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)v18));
        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
    }
    while (v16);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[PRBTRangingService serviceWithQueue:](PRBTRangingService, "serviceWithQueue:", self->_xpcQueue));
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "machServicesNames"));
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v56, v71, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v57;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v57 != v23)
          objc_enumerationMutation(v20);
        -[NSMutableDictionary setObject:forKey:](self->_machServices, "setObject:forKey:", v19, *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)v24));
        v24 = (char *)v24 + 1;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v56, v71, 16);
    }
    while (v22);
  }
  v43 = v7;

  v25 = objc_alloc_init(PRDiagnosticsService);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PRDiagnosticsService machServicesNames](v25, "machServicesNames"));
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v52, v70, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v53;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v53 != v29)
          objc_enumerationMutation(v26);
        -[NSMutableDictionary setObject:forKey:](self->_machServices, "setObject:forKey:", v25, *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)v30));
        v30 = (char *)v30 + 1;
      }
      while (v28 != v30);
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v52, v70, 16);
    }
    while (v28);
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[PRRangingService serviceWithQueue:](PRRangingService, "serviceWithQueue:", self->_xpcQueue));
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "machServicesNames"));
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v48, v69, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v49;
    do
    {
      v36 = 0;
      do
      {
        if (*(_QWORD *)v49 != v35)
          objc_enumerationMutation(v32);
        -[NSMutableDictionary setObject:forKey:](self->_machServices, "setObject:forKey:", v31, *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)v36));
        v36 = (char *)v36 + 1;
      }
      while (v34 != v36);
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v48, v69, 16);
    }
    while (v34);
  }

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[PRNearbyInteractionService serviceWithQueue:](PRNearbyInteractionService, "serviceWithQueue:", self->_xpcQueue));
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "machServicesNames"));
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v44, v68, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v45;
    do
    {
      v42 = 0;
      do
      {
        if (*(_QWORD *)v45 != v41)
          objc_enumerationMutation(v38);
        -[NSMutableDictionary setObject:forKey:](self->_machServices, "setObject:forKey:", v37, *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)v42));
        v42 = (char *)v42 + 1;
      }
      while (v40 != v42);
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v44, v68, 16);
    }
    while (v40);
  }

}

- (void)setupXPCListeners
{
  NSObject *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  NSObject *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  uint64_t v17;
  _BYTE v18[128];

  v3 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[PRXPCServicesManager] setting up XPC listeners", buf, 2u);
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_machServices, "allKeys"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v10 = qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[PRXPCServicesManager] setting up XPC listener for mach service: %@", buf, 0xCu);
        }
        v11 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", v9);
        objc_msgSend(v11, "setDelegate:", self);
        -[NSMutableArray addObject:](self->_listeners, "addObject:", v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v6);
  }

}

- (void)startServices
{
  NSMutableArray *v2;
  id v3;
  __int128 v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  void *v18;
  _BYTE v19[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = self->_listeners;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v14;
    *(_QWORD *)&v4 = 138412290;
    v12 = v4;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)qword_10085F520;
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
        {
          v10 = v9;
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serviceName"));
          *(_DWORD *)buf = v12;
          v18 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[PRXPCServicesManager] resuming listener for mach service: %@", buf, 0xCu);

        }
        objc_msgSend(v8, "resume", v12, (_QWORD)v13);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v5);
  }

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSMutableDictionary *machServices;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  int v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[PRXPCServicesManager] listener shouldAcceptNewConnection. Connection: %@", (uint8_t *)&v15, 0xCu);
  }
  machServices = self->_machServices;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serviceName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](machServices, "objectForKey:", v10));

  if (v11)
  {
    v12 = objc_msgSend(v11, "shouldAcceptNewConnection:", v7);
  }
  else
  {
    v13 = (void *)qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003CBDDC(v13, v7);
    v12 = 0;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcQueue, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_machServices, 0);
}

@end
