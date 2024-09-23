@implementation CPXIDSRelay

- (CPXIDSRelay)init
{
  CPXIDSRelay *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *highPriorityPortConnections;
  NSMutableDictionary *v5;
  NSMutableDictionary *lowPriorityPortConnections;
  NSMutableDictionary *v7;
  NSMutableDictionary *wifiPortConnections;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  IDSService *v11;
  IDSService *service;
  IDSService *v13;
  CPXIDSRelay *v14;
  objc_super v16;
  uint8_t buf[4];
  const __CFString *v18;

  v16.receiver = self;
  v16.super_class = (Class)CPXIDSRelay;
  v2 = -[CPXIDSRelay init](&v16, "init");
  if (!v2)
    goto LABEL_4;
  v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  highPriorityPortConnections = v2->_highPriorityPortConnections;
  v2->_highPriorityPortConnections = v3;

  v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  lowPriorityPortConnections = v2->_lowPriorityPortConnections;
  v2->_lowPriorityPortConnections = v5;

  v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  wifiPortConnections = v2->_wifiPortConnections;
  v2->_wifiPortConnections = v7;

  v9 = dispatch_queue_create("CPXIDSRelayQueue", 0);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v9;

  v11 = (IDSService *)objc_msgSend(objc_alloc((Class)IDSService), "initWithService:", CFSTR("com.apple.private.alloy.companionproxy"));
  service = v2->_service;
  v2->_service = v11;

  v13 = v2->_service;
  if (v13)
  {
    -[IDSService addDelegate:queue:](v13, "addDelegate:queue:", v2, v2->_queue);
LABEL_4:
    v14 = v2;
    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = CFSTR("com.apple.private.alloy.companionproxy");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create CPXIDSRelay service for %@", buf, 0xCu);
  }
  v14 = 0;
LABEL_8:

  return v14;
}

- (unsigned)acquirePort:(unint64_t)a3 isLowPriority:(BOOL)a4 preferWifi:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const __CFString *v16;
  const __CFString *v17;
  int v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  void *v25;

  v5 = a5;
  v6 = a4;
  if (!a5 || a4)
  {
    if (a4)
      v8 = objc_claimAutoreleasedReturnValue(-[CPXIDSRelay lowPriorityPortConnections](self, "lowPriorityPortConnections"));
    else
      v8 = objc_claimAutoreleasedReturnValue(-[CPXIDSRelay highPriorityPortConnections](self, "highPriorityPortConnections"));
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(-[CPXIDSRelay wifiPortConnections](self, "wifiPortConnections"));
  }
  v9 = (void *)v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v10));
  v12 = objc_msgSend(v11, "unsignedIntValue") + 1;

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  objc_msgSend(v9, "setObject:forKey:", v13, v14);

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    v16 = CFSTR("High");
    if (v6)
      v16 = CFSTR("Low");
    v18 = 138413058;
    v19 = v16;
    v17 = CFSTR("WiFi");
    v20 = 2112;
    if (!v5)
      v17 = CFSTR("Bluetooth");
    v21 = v17;
    v22 = 2048;
    v23 = a3;
    v24 = 2112;
    v25 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Number of %@ Priority port connections for preferred link (%@) upon acquire of %lu: %@", (uint8_t *)&v18, 0x2Au);
  }

  return v12;
}

- (unsigned)releasePort:(unint64_t)a3 isLowPriority:(BOOL)a4 preferWifi:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const __CFString *v16;
  const __CFString *v17;
  int v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  void *v25;

  v5 = a5;
  v6 = a4;
  if (!a5 || a4)
  {
    if (a4)
      v8 = objc_claimAutoreleasedReturnValue(-[CPXIDSRelay lowPriorityPortConnections](self, "lowPriorityPortConnections"));
    else
      v8 = objc_claimAutoreleasedReturnValue(-[CPXIDSRelay highPriorityPortConnections](self, "highPriorityPortConnections"));
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(-[CPXIDSRelay wifiPortConnections](self, "wifiPortConnections"));
  }
  v9 = (void *)v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v10));
  v12 = objc_msgSend(v11, "unsignedIntValue") - 1;

  if ((_DWORD)v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    objc_msgSend(v9, "setObject:forKey:", v13, v14);

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    objc_msgSend(v9, "removeObjectForKey:", v13);
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    v16 = CFSTR("High");
    if (v6)
      v16 = CFSTR("Low");
    v18 = 138413058;
    v19 = v16;
    v17 = CFSTR("WiFi");
    v20 = 2112;
    if (!v5)
      v17 = CFSTR("Bluetooth");
    v21 = v17;
    v22 = 2048;
    v23 = a3;
    v24 = 2112;
    v25 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Number of %@ Priority port connections for preferred link (%@) upon release of %lu: %@", (uint8_t *)&v18, 0x2Au);
  }

  return v12;
}

- (id)sendMessage:(id)a3 messageDictionary:(id)a4
{
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  id v13;
  id v14;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  _QWORD v24[2];
  _QWORD v25[2];

  v5 = IDSDefaultPairedDevice;
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v5));
  v24[0] = IDSSendMessageOptionTimeoutKey;
  v24[1] = IDSSendMessageOptionForceLocalDeliveryKey;
  v25[0] = &off_1000152D8;
  v25[1] = &__kCFBooleanTrue;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 2));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v6, 200, 0, 0));

  v16 = 0;
  v17 = 0;
  v11 = objc_msgSend(v7, "sendData:toDestinations:priority:options:identifier:error:", v10, v8, 300, v9, &v17, &v16);

  v12 = v17;
  v13 = v16;
  if ((v11 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v19 = v12;
    v20 = 2112;
    v21 = v10;
    v22 = 2112;
    v23 = v13;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IDS send failed (id: %@, data: %@): %@", buf, 0x20u);
  }
  v14 = v12;

  return v14;
}

- (void)handleGenericCPXConnection:(id)a3
{
  id v3;
  void *v4;
  id v5;
  char v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  unsigned int v15;
  char v16;
  uintptr_t v17;
  dispatch_queue_global_t global_queue;
  NSObject *v19;
  dispatch_source_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  id v26;
  dispatch_source_t v27;
  void *v28;
  NSObject *v29;
  id v30;
  dispatch_source_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  id v35;
  NSObject *v36;
  id v37;
  dispatch_source_t v38;
  void *v39;
  NSObject *v40;
  id v41;
  unsigned int v42;
  int v43;
  int *v44;
  char *v45;
  id v46;
  unsigned int v47;
  int v48;
  int *v49;
  char *v50;
  void (**v51)(void);
  void (**v52)(void);
  uint64_t *v53;
  void *v54;
  uint64_t *v55;
  void *v56;
  int v57;
  void *v58;
  int v59;
  id v60;
  _QWORD v61[4];
  id v62;
  _QWORD *v63;
  _QWORD *v64;
  uint64_t *v65;
  uint64_t *v66;
  uint64_t *v67;
  char v68;
  char v69;
  _QWORD v70[4];
  id v71;
  uint64_t *v72;
  uint64_t *v73;
  uint64_t *v74;
  _QWORD v75[4];
  id v76;
  _QWORD *v77;
  uint64_t *v78;
  uint64_t *v79;
  _QWORD *v80;
  uint64_t *v81;
  char v82;
  char v83;
  _QWORD v84[4];
  id v85;
  _QWORD *v86;
  _QWORD *v87;
  uint64_t *v88;
  uint64_t *v89;
  uint64_t *v90;
  char v91;
  char v92;
  _QWORD v93[4];
  id v94;
  uint64_t *v95;
  uint64_t *v96;
  uint64_t *v97;
  _QWORD handler[4];
  id v99;
  _QWORD *v100;
  uint64_t *v101;
  uint64_t *v102;
  _QWORD *v103;
  uint64_t *v104;
  char v105;
  char v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _QWORD v111[4];
  _QWORD v112[4];
  uint64_t v113;
  uint64_t *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t *v118;
  uint64_t v119;
  uint64_t v120;
  _QWORD v121[4];
  _QWORD v122[4];
  uint64_t v123;
  uint64_t *v124;
  uint64_t v125;
  uint64_t (*v126)(uint64_t, uint64_t);
  void (*v127)(uint64_t);
  id v128;
  uint64_t v129;
  uint64_t *v130;
  uint64_t v131;
  uint64_t (*v132)(uint64_t, uint64_t);
  void (*v133)(uint64_t);
  id v134;
  uint64_t v135;
  uint64_t *v136;
  uint64_t v137;
  uint64_t (*v138)(uint64_t, uint64_t);
  void (*v139)(uint64_t);
  id v140;
  uint64_t v141;
  uint64_t *v142;
  uint64_t v143;
  uint64_t (*v144)(uint64_t, uint64_t);
  void (*v145)(uint64_t);
  id v146;
  uint8_t buf[4];
  unsigned int v148;
  __int16 v149;
  int v150;
  __int16 v151;
  char *v152;
  uint8_t v153[4];
  uint64_t v154;
  _BYTE v155[128];

  v3 = a3;
  v141 = 0;
  v142 = &v141;
  v143 = 0x3032000000;
  v144 = sub_100005EC4;
  v145 = sub_100005ED4;
  v146 = 0;
  v135 = 0;
  v136 = &v135;
  v137 = 0x3032000000;
  v138 = sub_100005EC4;
  v139 = sub_100005ED4;
  v140 = 0;
  v129 = 0;
  v130 = &v129;
  v131 = 0x3032000000;
  v132 = sub_100005EC4;
  v133 = sub_100005ED4;
  v134 = 0;
  v123 = 0;
  v124 = &v123;
  v125 = 0x3032000000;
  v126 = sub_100005EC4;
  v127 = sub_100005ED4;
  v128 = 0;
  v122[0] = 0;
  v122[1] = v122;
  v122[2] = 0x2020000000;
  v122[3] = 0;
  v121[0] = 0;
  v121[1] = v121;
  v121[2] = 0x2020000000;
  v121[3] = 0;
  v117 = 0;
  v118 = &v117;
  v119 = 0x2020000000;
  v120 = 0;
  v113 = 0;
  v114 = &v113;
  v115 = 0x2020000000;
  v116 = 0;
  v112[0] = 0;
  v112[1] = v112;
  v112[2] = 0x2020000000;
  v112[3] = 0;
  v111[0] = 0;
  v111[1] = v111;
  v111[2] = 0x2020000000;
  v111[3] = 0;
  v59 = fcntl((int)objc_msgSend(v3, "localSocket"), 3, 0);
  v57 = fcntl((int)objc_msgSend(v3, "bridgeSocket"), 3, 0);
  v60 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.companion_proxy"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "arrayForKey:", CFSTR("ServiceSocketLogging")));
  v58 = v4;
  if (v4)
  {
    v109 = 0u;
    v110 = 0u;
    v107 = 0u;
    v108 = 0u;
    v5 = v4;
    v6 = 0;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v107, v155, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v108;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v108 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serviceName"));
          LODWORD(v10) = objc_msgSend(v10, "isEqualToString:", v11);

          if ((_DWORD)v10)
          {
            v12 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
            {
              v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serviceName"));
              sub_10000D05C(v13, v153, &v154);
            }

            v6 = 1;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v107, v155, 16);
      }
      while (v7);
    }

    v14 = v6 & 1;
  }
  else
  {
    v14 = 0;
  }
  v15 = objc_msgSend(v60, "BOOLForKey:", CFSTR("EnableSocketDataLogging"));
  v16 = v15;
  if (v15 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    sub_10000D018();
  if (v59 == -1 || fcntl((int)objc_msgSend(v3, "localSocket"), 4, v59 | 4u) == -1)
  {
    v41 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v42 = objc_msgSend(v3, "localSocket");
      v43 = *__error();
      v44 = __error();
      v45 = strerror(*v44);
      *(_DWORD *)buf = 67109634;
      v148 = v42;
      v149 = 1024;
      v150 = v43;
      v151 = 2080;
      v152 = v45;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "fcntl failed on local socket %d: %d (%s)", buf, 0x18u);
    }
    goto LABEL_32;
  }
  if (v57 == -1 || fcntl((int)objc_msgSend(v3, "bridgeSocket"), 4, v57 | 4u) == -1)
  {
    v46 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v47 = objc_msgSend(v3, "bridgeSocket");
      v48 = *__error();
      v49 = __error();
      v50 = strerror(*v49);
      *(_DWORD *)buf = 67109634;
      v148 = v47;
      v149 = 1024;
      v150 = v48;
      v151 = 2080;
      v152 = v50;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "fcntl failed on bridge socket %d: %d (%s)", buf, 0x18u);
    }
LABEL_32:

    goto LABEL_33;
  }
  v17 = (int)objc_msgSend(v3, "localSocket");
  global_queue = dispatch_get_global_queue(0, 0);
  v19 = objc_claimAutoreleasedReturnValue(global_queue);
  v20 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v17, 0, v19);
  v21 = (void *)v142[5];
  v142[5] = (uint64_t)v20;

  if (!v142[5])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create local read dispatch source", buf, 2u);
    }
    goto LABEL_33;
  }
  v22 = malloc_type_malloc(0x4000uLL, 0x122EBC5EuLL);
  v118[3] = (uint64_t)v22;
  v23 = v142[5];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100005EDC;
  handler[3] = &unk_100014568;
  v100 = v122;
  v24 = v3;
  v99 = v24;
  v105 = v14;
  v101 = &v117;
  v102 = &v141;
  v106 = v16;
  v103 = v112;
  v104 = &v129;
  dispatch_source_set_event_handler(v23, handler);
  v25 = v142[5];
  v93[0] = _NSConcreteStackBlock;
  v93[1] = 3221225472;
  v93[2] = sub_1000062D0;
  v93[3] = &unk_100014590;
  v95 = &v129;
  v96 = &v135;
  v26 = v24;
  v94 = v26;
  v97 = &v117;
  dispatch_source_set_cancel_handler(v25, v93);
  v27 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_write, (int)objc_msgSend(v26, "bridgeSocket"), 0, v19);
  v28 = (void *)v130[5];
  v130[5] = (uint64_t)v27;

  v29 = v130[5];
  if (!v29)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create local write dispatch source", buf, 2u);
    }

    goto LABEL_33;
  }
  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472;
  v84[2] = sub_100006350;
  v84[3] = &unk_100014568;
  v86 = v122;
  v30 = v26;
  v85 = v30;
  v87 = v112;
  v91 = v14;
  v92 = v16;
  v88 = &v141;
  v89 = &v117;
  v90 = &v129;
  dispatch_source_set_event_handler(v29, v84);
  v31 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, (int)objc_msgSend(v30, "bridgeSocket"), 0, v19);
  v32 = (void *)v136[5];
  v136[5] = (uint64_t)v31;

  if (!v136[5])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create bridge read dispatch source", buf, 2u);
    }

    goto LABEL_33;
  }
  v33 = malloc_type_malloc(0x4000uLL, 0xC739D7BEuLL);
  v114[3] = (uint64_t)v33;
  v34 = v136[5];
  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472;
  v75[2] = sub_100006690;
  v75[3] = &unk_100014568;
  v77 = v121;
  v35 = v30;
  v76 = v35;
  v82 = v14;
  v78 = &v113;
  v79 = &v135;
  v83 = v16;
  v80 = v111;
  v81 = &v123;
  dispatch_source_set_event_handler(v34, v75);
  v36 = v136[5];
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472;
  v70[2] = sub_100006A0C;
  v70[3] = &unk_100014590;
  v72 = &v123;
  v73 = &v141;
  v37 = v35;
  v71 = v37;
  v74 = &v113;
  dispatch_source_set_cancel_handler(v36, v70);
  v38 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_write, (int)objc_msgSend(v37, "localSocket"), 0, v19);
  v39 = (void *)v124[5];
  v124[5] = (uint64_t)v38;

  v40 = v124[5];
  if (v40)
  {
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_100006A8C;
    v61[3] = &unk_100014568;
    v63 = v121;
    v62 = v37;
    v64 = v111;
    v68 = v14;
    v69 = v16;
    v65 = &v135;
    v66 = &v113;
    v67 = &v123;
    dispatch_source_set_event_handler(v40, v61);
    dispatch_resume((dispatch_object_t)v142[5]);
    dispatch_resume((dispatch_object_t)v136[5]);

  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create bridge write dispatch source", buf, 2u);
  }

  if (!v40)
  {
LABEL_33:
    v51 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localCompletion"));
    v51[2]();

    v52 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bridgeCompletion"));
    v52[2]();

    v53 = v118;
    v54 = (void *)v118[3];
    if (v54)
    {
      free(v54);
      v53 = v118;
    }
    v53[3] = 0;
    v55 = v114;
    v56 = (void *)v114[3];
    if (v56)
    {
      free(v56);
      v55 = v114;
    }
    v55[3] = 0;
  }

  _Block_object_dispose(v111, 8);
  _Block_object_dispose(v112, 8);
  _Block_object_dispose(&v113, 8);
  _Block_object_dispose(&v117, 8);
  _Block_object_dispose(v121, 8);
  _Block_object_dispose(v122, 8);
  _Block_object_dispose(&v123, 8);

  _Block_object_dispose(&v129, 8);
  _Block_object_dispose(&v135, 8);

  _Block_object_dispose(&v141, 8);
}

- (IDSService)service
{
  return self->_service;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableDictionary)highPriorityPortConnections
{
  return self->_highPriorityPortConnections;
}

- (NSMutableDictionary)lowPriorityPortConnections
{
  return self->_lowPriorityPortConnections;
}

- (NSMutableDictionary)wifiPortConnections
{
  return self->_wifiPortConnections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiPortConnections, 0);
  objc_storeStrong((id *)&self->_lowPriorityPortConnections, 0);
  objc_storeStrong((id *)&self->_highPriorityPortConnections, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
