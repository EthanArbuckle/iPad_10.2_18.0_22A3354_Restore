@implementation NIServerNearbyAccessoryRangingService

+ (id)sharedInstance
{
  if (qword_10085B4B8 != -1)
    dispatch_once(&qword_10085B4B8, &stru_100811448);
  return (id)qword_10085B4B0;
}

- (id)addServiceClient:(id)a3 identifier:(id)a4 processName:(id)a5 configuration:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  OS_dispatch_queue *queue;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  NIServerNearbyAccessoryRangingService *v23;
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_100285178;
  v32 = sub_100285188;
  v33 = 0;
  queue = self->_queue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100285190;
  v21[3] = &unk_100811470;
  v22 = v11;
  v23 = self;
  v24 = v12;
  v25 = v13;
  v26 = v10;
  v27 = &v28;
  v15 = v10;
  v16 = v13;
  v17 = v12;
  v18 = v11;
  dispatch_sync((dispatch_queue_t)queue, v21);
  v19 = (id)v29[5];

  _Block_object_dispose(&v28, 8);
  return v19;
}

- (void)removeServiceClientWithIdentifier:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  NIServerNearbyAccessoryRangingService *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100285BE0;
  v7[3] = &unk_1007FA518;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);

}

- (void)notifyServiceClientWithIdentifier:(id)a3 isRunning:(BOOL)a4
{
  id v6;
  OS_dispatch_queue *queue;
  id v8;
  _QWORD block[4];
  id v10;
  NIServerNearbyAccessoryRangingService *v11;
  BOOL v12;

  v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100285E84;
  block[3] = &unk_100809E88;
  v10 = v6;
  v11 = self;
  v12 = a4;
  v8 = v6;
  dispatch_sync((dispatch_queue_t)queue, block);

}

- (id)printableState
{
  OS_dispatch_queue *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_100285178;
  v10 = sub_100285188;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002861AC;
  v5[3] = &unk_10080A8F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_internalPrintableState
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  NSMutableDictionary *clientTracking;
  void *v8;
  void *v9;
  NSMutableDictionary *uwbSessionTracking;
  id v11;
  _QWORD v13[6];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  NSMutableArray *v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_100285178;
  v19 = sub_100285188;
  v20 = objc_opt_new(NSMutableArray);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = objc_autoreleasePoolPush();
  v4 = sub_10000883C();
  v5 = (void *)v16[5];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d clients"), -[NSMutableDictionary count](self->_clientTracking, "count")));
  objc_msgSend(v5, "addObject:", v6);

  clientTracking = self->_clientTracking;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1002863CC;
  v14[3] = &unk_100811498;
  v14[4] = &v15;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](clientTracking, "enumerateKeysAndObjectsUsingBlock:", v14);
  v8 = (void *)v16[5];
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d UWB sessions"), -[NSMutableDictionary count](self->_uwbSessionTracking, "count")));
  objc_msgSend(v8, "addObject:", v9);

  uwbSessionTracking = self->_uwbSessionTracking;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10028674C;
  v13[3] = &unk_1008114C0;
  v13[4] = &v15;
  *(double *)&v13[5] = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](uwbSessionTracking, "enumerateKeysAndObjectsUsingBlock:", v13);
  objc_autoreleasePoolPop(v3);
  v11 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v11;
}

- (id)_initInternal
{
  NIServerNearbyAccessoryRangingService *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  NSMapTable *clients;
  NSMutableDictionary *v9;
  NSMutableDictionary *clientTracking;
  NSMutableDictionary *v11;
  NSMutableDictionary *uwbSessionTracking;
  void *v13;
  unsigned int v14;
  OS_dispatch_queue *v15;
  _QWORD v17[4];
  NIServerNearbyAccessoryRangingService *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)NIServerNearbyAccessoryRangingService;
  v2 = -[NIServerNearbyAccessoryRangingService init](&v19, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.nearbyd.accessory-ranging-service", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](NSMapTable, "strongToWeakObjectsMapTable"));
    clients = v2->_clients;
    v2->_clients = (NSMapTable *)v7;

    v9 = objc_opt_new(NSMutableDictionary);
    clientTracking = v2->_clientTracking;
    v2->_clientTracking = v9;

    v11 = objc_opt_new(NSMutableDictionary);
    uwbSessionTracking = v2->_uwbSessionTracking;
    v2->_uwbSessionTracking = v11;

    if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild")
      || (v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults")),
          v14 = objc_msgSend(v13, "BOOLForKey:", CFSTR("EnableStateDump")),
          v13,
          v14))
    {
      v15 = v2->_queue;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100286E00;
      v17[3] = &unk_10080A8A0;
      v18 = v2;
      os_state_add_handler(v15, v17);

    }
  }
  return v2;
}

- (optional<unsigned)_generateUwbSessionIdForNewServiceClientWithProcessName:(id)a3 parsedAccessoryConfigData:(const void *)a4 debugParameters:(id)a5
{
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  unint64_t v13;
  int v14;
  uint64_t v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  NSMutableDictionary *uwbSessionTracking;
  char v24;
  char v25;
  BOOL v26;
  NSMutableDictionary *v27;
  id v28;
  int v29;
  NSObject *v30;
  _BOOL4 v31;
  int v32;
  const char *v33;
  NSObject *v34;
  uint64_t v35;
  int v36;
  const void *v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  _BYTE *v43;
  uint64_t *v44;
  const void *v45;
  BOOL v46;
  char v47;
  char v48;
  __int16 v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  _QWORD v54[5];
  uint8_t v55[4];
  id v56;
  __int16 v57;
  int v58;
  _BYTE buf[24];
  uint64_t (*v60)(uint64_t, uint64_t);
  uint64_t (*v61)();
  uint64_t v62;
  char v63;
  char v64;

  v40 = a3;
  v39 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKey:", CFSTR("UWBSessionIdOverride")));
    if (v9)
    {
      v10 = objc_opt_class(NSNumber, v8);
      if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
      {
        v11 = (id)qword_10085F520;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v40;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = objc_msgSend(v9, "unsignedIntValue");
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#accessory-service,Generate UWB session ID - process %@ will use UWB session ID %u in overrides", buf, 0x12u);
        }

        LODWORD(v12) = objc_msgSend(v9, "unsignedIntValue");
        v13 = 0;
        v14 = v12 & 0xFFFFFF00;
        v15 = (uint64_t)&_mh_execute_header;
        goto LABEL_28;
      }
    }

  }
  if (*((_BYTE *)a4 + 39))
  {
    v38 = a4;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3812000000;
    v60 = sub_100287400;
    v61 = nullsub_118;
    v62 = 0;
    v63 = 0;
    v64 = 0;
    do
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v17 = objc_msgSend(v16, "BOOLForKey:", CFSTR("AccessoryUse32BitUwbSessionId"));

      if (v17)
      {
        LODWORD(v50) = 0;
        v18 = NSRandomData(4, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        objc_msgSend(v19, "getBytes:length:", &v50, 4);
        v20 = v50;
      }
      else
      {
        LOWORD(v50) = 0;
        v21 = NSRandomData(2, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v21);
        objc_msgSend(v19, "getBytes:length:", &v50, 2);
        v20 = (unsigned __int16)v50;
      }

      v22 = *(_QWORD *)&buf[8];
      *(_DWORD *)(*(_QWORD *)&buf[8] + 48) = v20;
      *(_BYTE *)(v22 + 52) = 1;
      uwbSessionTracking = self->_uwbSessionTracking;
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_100287418;
      v54[3] = &unk_1008114E8;
      v54[4] = buf;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](uwbSessionTracking, "enumerateKeysAndObjectsUsingBlock:", v54);
    }
    while (!*(_BYTE *)(*(_QWORD *)&buf[8] + 52));
    v50 = 0;
    v51 = &v50;
    v52 = 0x2020000000;
    v53 = 0;
    v49 = 0;
    if (!*((_BYTE *)a4 + 39))
      sub_10000BA44();
    sub_1002874F4((uint64_t)a4, (_BYTE *)&v49 + 1, &v49);
    v24 = HIBYTE(v49);
    v25 = v49;
    v26 = v49 != 0;
    v27 = self->_uwbSessionTracking;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100287598;
    v41[3] = &unk_100811510;
    v28 = v40;
    v46 = v26;
    v47 = v24;
    v48 = v25;
    v42 = v28;
    v43 = buf;
    v44 = &v50;
    v45 = v38;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v27, "enumerateKeysAndObjectsUsingBlock:", v41);
    if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 52))
      __assert_rtn("-[NIServerNearbyAccessoryRangingService _generateUwbSessionIdForNewServiceClientWithProcessName:parsedAccessoryConfigData:debugParameters:]", "NIServerNearbyAccessoryRangingService.mm", 813, "uwbSessionId.has_value()");
    v29 = *((unsigned __int8 *)v51 + 24);
    v30 = (id)qword_10085F520;
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    if (v29)
    {
      if (v31)
      {
        if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 52))
          sub_10000BA44();
        v32 = *(_DWORD *)(*(_QWORD *)&buf[8] + 48);
        *(_DWORD *)v55 = 138412546;
        v56 = v28;
        v57 = 1024;
        v58 = v32;
        v33 = "#accessory-service,Generate UWB session ID - process %@ will use existing UWB session ID %u";
LABEL_26:
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, v33, v55, 0x12u);
      }
    }
    else if (v31)
    {
      if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 52))
        sub_10000BA44();
      v36 = *(_DWORD *)(*(_QWORD *)&buf[8] + 48);
      *(_DWORD *)v55 = 138412546;
      v56 = v28;
      v57 = 1024;
      v58 = v36;
      v33 = "#accessory-service,Generate UWB session ID - process %@ will use new UWB session ID %u";
      goto LABEL_26;
    }

    v12 = *(_QWORD *)(*(_QWORD *)&buf[8] + 48);
    v14 = v12 & 0xFFFFFF00;
    v13 = v12 & 0xFFFFFF0000000000;
    _Block_object_dispose(&v50, 8);
    _Block_object_dispose(buf, 8);
    v15 = v12 & 0xFF00000000;
    goto LABEL_28;
  }
  v34 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    sub_1003E41E0((uint64_t)v40, v34, v35);
  v15 = 0;
  v13 = 0;
  LOBYTE(v12) = 0;
  v14 = 0;
LABEL_28:

  return (optional<unsigned int>)(v13 | v15 | v14 | v12);
}

- (void)_prepareUwbSessionTrackingObjectsForClientTracking:(id)a3 outServiceRequest:(void *)a4 outStartOptions:(void *)a5 outShareableConfigData:(id *)a6
{
  id v10;
  NSObject *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  unsigned __int8 *v19;
  int v20;
  int v21;
  NSObject *v22;
  const char *v23;
  BOOL v24;
  BOOL v25;
  uint64_t v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  int v38;
  char v39;
  int v40;
  int v41;
  char v42;
  char v43;
  unsigned __int16 v44;
  uint64_t *v45;
  char v46;
  char v47;
  char v48;
  int v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  double v58;
  double v59;
  unsigned int v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  _WORD *v64;
  NSObject *v65;
  uint64_t v66;
  _QWORD *v67;
  uint64_t v68;
  std::__shared_weak_count *v69;
  unint64_t *p_shared_owners;
  unint64_t v71;
  unint64_t v72;
  int v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  unsigned __int16 v83;
  uint64_t v84;
  unsigned __int16 v85;
  uint64_t v86;
  unsigned __int16 v87;
  NSObject *v88;
  unsigned int v89;
  int v90;
  int v91;
  int v92;
  int v93;
  NSObject *v94;
  uint64_t v95;
  char v96;
  void **v97;
  unsigned int v98;
  double v99;
  double v100;
  unint64_t v101;
  char v102;
  unint64_t v103;
  unint64_t v104;
  unint64_t v105;
  NSObject *v106;
  _BOOL4 v107;
  uint64_t v108;
  char v109;
  char v110;
  char *v111;
  _WORD *v112;
  __int16 v113;
  unsigned int v114;
  int v115;
  __int16 v116;
  int v117;
  unsigned int v118;
  char v119;
  char v120;
  int v121;
  __int16 v122;
  char v123;
  char v124;
  char v125;
  unint64_t *v126;
  unint64_t v127;
  int v128;
  const char *v129;
  int v130;
  const char *v131;
  int v132;
  id v133;
  int v134;
  unsigned __int16 *v135;
  unsigned int v136;
  unsigned int v137;
  std::__shared_weak_count *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  uint64_t v144;
  _WORD *v145;
  int v146;
  id *v147;
  _BOOL4 v148;
  void *v149;
  void *__p[6];
  void *v151[2];
  unsigned __int8 v152;
  uint64_t v153;
  std::__shared_weak_count *v154;
  __int16 v155;
  char v156;
  unsigned int v157;
  __int16 v158;
  __int16 v159;
  __int16 v160;
  int v161;
  __int16 v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  char v166;
  __int16 v167;
  BOOL v168;
  int v169;
  int v170;
  int v171;
  __int16 v172;
  __int16 v173;
  uint8_t buf[504];

  v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (*((_BYTE *)a4 + 504))
    *((_BYTE *)a4 + 504) = 0;
  if (*((_BYTE *)a5 + 112))
    *((_BYTE *)a5 + 112) = 0;
  *a6 = 0;
  if (v10)
  {
    v147 = a6;
    v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "niConfiguration"));
    v11 = (id)qword_10085F520;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "processName"));
      v13 = objc_msgSend(v10, "uwbSessionId");
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "debugParameters"));
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v13;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#accessory-service,Prep session objects: process %@, UWB session ID %u. Configuration debug parameters: %@", buf, 0x1Cu);

    }
    if (!+[NIPlatformInfo isInternalBuild](NIPlatformInfo, "isInternalBuild"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "debugParameters"));
      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "debugParameters"));
        v17 = objc_msgSend(v16, "count") == 0;

        if (!v17)
          goto LABEL_237;
      }
    }
    if (objc_msgSend(v149, "dataExchangeDisabledAndUsingParameterOverrides"))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "debugParameters"));
      -[NIServerNearbyAccessoryRangingService _prepareUwbSessionTrackingObjectsFromDebugParameters:outServiceRequest:outStartOptions:](self, "_prepareUwbSessionTrackingObjectsFromDebugParameters:outServiceRequest:outStartOptions:", v18, a4, a5);

LABEL_237:
      goto LABEL_238;
    }
    if (!*((_BYTE *)objc_msgSend(v10, "parsedAccessoryConfigData") + 39))
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003E4274();
      goto LABEL_237;
    }
    v19 = (unsigned __int8 *)objc_msgSend(v10, "parsedAccessoryConfigData");
    if (!v19[39])
      sub_10000BA44();
    v146 = v19[32];
    v20 = *(unsigned __int16 *)(v19 + 33);
    v21 = v19[4];
    v173 = 0;
    v145 = v19;
    sub_1002874F4((uint64_t)v19, (_BYTE *)&v173 + 1, &v173);
    LODWORD(v144) = v173;
    HIDWORD(v144) = HIBYTE(v173);
    v148 = (HIBYTE(v173) | v173) != 0;
    v22 = (id)qword_10085F520;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = "Multicast SS-TWR";
      if (!(_DWORD)v144)
        v23 = "Unicast";
      if (HIDWORD(v144))
        v23 = "Multicast aDS-TWR";
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#accessory-service,Prep session objects: %s ranging mode", buf, 0xCu);
    }

    if (v148 && v146 == 1)
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003E4324();
      goto LABEL_237;
    }
    v135 = v145 + 8;
    v24 = v145[8] && (v145[8] != 1 || v145[9]);
    v25 = *(unsigned __int16 *)((char *)v145 + 35) > 0x64u && v24;
    do
    {
      *(_WORD *)buf = 0;
      v26 = NSRandomData(2, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      objc_msgSend(v27, "getBytes:length:", buf, 2);
      v28 = *(unsigned __int16 *)buf;

    }
    while (v28 == v20);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "debugParameters"));
    v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("LocalAddressOverride")));

    if (v140)
    {
      v31 = objc_opt_class(NSNumber, v30);
      if ((objc_opt_isKindOfClass(v140, v31) & 1) != 0)
        LOWORD(v28) = (unsigned __int16)objc_msgSend(v140, "intValue");
    }
    v32 = NSRandomData(6, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    objc_msgSend(v33, "getBytes:length:", buf, 6);

    v172 = *(_WORD *)&buf[4];
    v171 = *(_DWORD *)buf;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "debugParameters"));
    v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("STSInitVectorOverride")));

    if (v143)
    {
      v36 = objc_opt_class(NSData, v35);
      if ((objc_opt_isKindOfClass(v143, v36) & 1) != 0 && objc_msgSend(v143, "length") == (id)6)
        objc_msgSend(v143, "getBytes:length:", &v171, 6);
    }
    if ((_DWORD)v144)
      v37 = 10;
    else
      v37 = 0;
    if ((_DWORD)v144)
      v38 = 12;
    else
      v38 = 6;
    if (HIDWORD(v144))
      v39 = 30;
    else
      v39 = v37;
    if (HIDWORD(v144))
      v40 = 31;
    else
      v40 = v38;
    if (v144)
      v41 = 2400;
    else
      v41 = 3600;
    v136 = v41;
    v137 = v40;
    v42 = sub_100288C80(v146 != 1, v148);
    if (objc_msgSend(v149, "backgroundMode"))
    {
      if (!v21)
      {
        if (v148)
        {
          v134 = 0;
          v44 = 2160;
        }
        else
        {
          if (v146 == 1)
          {
            if ((v42 & 1) != 0)
            {
              v134 = 0;
              v44 = 1944;
              goto LABEL_91;
            }
LABEL_78:
            v45 = (uint64_t *)&unk_10085B3F0;
            goto LABEL_90;
          }
          if ((v42 & 1) == 0)
          {
            v128 = sub_100288D30(qword_10085B450);
            v44 = v128;
            v134 = 1;
            if (v128)
              goto LABEL_91;
            goto LABEL_240;
          }
          v134 = 1;
          v44 = 162;
        }
LABEL_91:
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "debugParameters"));
        v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("RangingIntervalMsOverride")));

        if (v141)
        {
          v52 = objc_opt_class(NSNumber, v51);
          if ((objc_opt_isKindOfClass(v141, v52) & 1) != 0)
          {
            v44 = (unsigned __int16)objc_msgSend(v141, "unsignedIntValue");
            v53 = (id)qword_10085F520;
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = v44;
              _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "#accessory-service,Prep session objects: Ranging interval override via config debug option: %d ms", buf, 8u);
            }

          }
        }
        v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
        v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectForKey:", CFSTR("NIAccessoryRangingIntervalMsOverride")));

        if (v142)
        {
          v56 = objc_opt_class(NSNumber, v55);
          if ((objc_opt_isKindOfClass(v142, v56) & 1) != 0)
          {
            v44 = (unsigned __int16)objc_msgSend(v142, "unsignedIntValue");
            v57 = (id)qword_10085F520;
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = v44;
              _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "#accessory-service,Prep session objects: Ranging interval override via defaults write: %d ms", buf, 8u);
            }

          }
        }
        v58 = (double)v137 * (double)v136 / 1200.0;
        if (v58 <= 0.0)
        {
          v129 = "numMillisecondsPerRound > 0";
          v130 = 240;
        }
        else
        {
          v59 = ceil((double)v44 / v58);
          if (v59 <= 0.0)
          {
            v129 = "numRoundsPerBlockAsDouble > 0";
            v130 = 244;
          }
          else
          {
            if (v59 < 65535.0)
            {
              LOBYTE(v60) = !v148 && objc_msgSend(v149, "backgroundMode") == 0;
              v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
              v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "objectForKey:", CFSTR("NIAccessoryUseDedicatedAntennasOverride")));

              if (v139)
              {
                v63 = objc_opt_class(NSNumber, v62);
                v64 = v145;
                if ((objc_opt_isKindOfClass(v139, v63) & 1) == 0)
                  goto LABEL_113;
                v60 = objc_msgSend(v139, "BOOLValue");
                v65 = (id)qword_10085F520;
                if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)&buf[4] = v60;
                  _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "#accessory-service,Prep session objects: Use dedicated antennas via defaults write: %d", buf, 8u);
                }

              }
              v64 = v145;
LABEL_113:
              v155 = 0;
              v156 = 0;
              v157 = objc_msgSend(v10, "uwbSessionId");
              v158 = v136;
              v159 = v137;
              v160 = (int)v59;
              v161 = v171;
              v162 = v172;
              v66 = *(unsigned __int16 *)((char *)v64 + 33);
              if (v148 && v146 != 1)
                v66 = 0;
              v163 = (unsigned __int16)v28;
              v164 = v66;
              v165 = 0x400000003;
              v166 = v60;
              v167 = 257;
              v168 = v25;
              v169 = 50528256;
              v170 = 6;
              if (HIDWORD(v144))
              {
                LOBYTE(v169) = 1;
              }
              else
              {
                if (!(_DWORD)v144)
                  goto LABEL_120;
                BYTE1(v169) = 1;
              }
              HIBYTE(v169) = v39;
              BYTE2(v169) = v39;
LABEL_120:
              v67 = sub_1002CA108();
              v68 = v67[406];
              v69 = (std::__shared_weak_count *)v67[407];
              v153 = v68;
              v154 = v69;
              v138 = v69;
              if (v69)
              {
                p_shared_owners = (unint64_t *)&v69->__shared_owners_;
                do
                  v71 = __ldxr(p_shared_owners);
                while (__stxr(v71 + 1, p_shared_owners));
              }
              if (!v68)
              {
                if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
                  sub_1003E42A0();
                goto LABEL_231;
              }
              if (!sub_1002A4728(v68, (char *)&v155, (unsigned __int8 *)&v155 + 1, 0))
              {
                if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
                  sub_1003E42F8();
                goto LABEL_231;
              }
              sub_1002A4E18(v68, v151);
              v72 = v152;
              if ((v152 & 0x80u) != 0)
                v72 = (unint64_t)v151[1];
              if (!v72)
              {
                if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
                  sub_1003E42CC();
                goto LABEL_229;
              }
              if (v146 == 1)
                sub_100164D58((char *)&v155, (uint64_t)buf);
              else
                sub_100164A08((char *)&v155, (uint64_t)buf);
              v73 = *((unsigned __int8 *)a4 + 504);
              memcpy(a4, buf, 0x1F8uLL);
              if (!v73)
                *((_BYTE *)a4 + 504) = 1;
              v133 = objc_msgSend(v149, "backgroundMode");
              v74 = objc_msgSend(v149, "backgroundMode");
              if (v74 == (id)1)
              {
                *((_DWORD *)a4 + 17) |= 0xDu;
                *((_QWORD *)a4 + 9) = -4275240961;
                *((_WORD *)a4 + 40) = -1;
                *((_BYTE *)a4 + 82) = 0;
                *(_WORD *)((char *)a4 + 83) = -1;
              }
              else if (v74 == (id)2)
              {
                *((_DWORD *)a4 + 17) |= 0xBu;
                v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
                v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "objectForKey:", CFSTR("NIBackgroundAccessoryTimeoutSecondsOverride_InactivityBeforeTracking")));

                v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
                v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "objectForKey:", CFSTR("NIBackgroundAccessoryTimeoutSecondsOverride_InactivityAfterTracking")));

                v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
                v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "objectForKey:", CFSTR("NIBackgroundAccessoryTimeoutSecondsOverride_TotalJobTime")));

                if (v76
                  && (v82 = objc_opt_class(NSNumber, v81), (objc_opt_isKindOfClass(v76, v82) & 1) != 0))
                {
                  v83 = (unsigned __int16)objc_msgSend(v76, "unsignedIntValue");
                }
                else
                {
                  v83 = -1;
                }
                if (v78
                  && (v84 = objc_opt_class(NSNumber, v81), (objc_opt_isKindOfClass(v78, v84) & 1) != 0))
                {
                  v85 = (unsigned __int16)objc_msgSend(v78, "unsignedIntValue");
                }
                else
                {
                  v85 = -1;
                }
                if (v80
                  && (v86 = objc_opt_class(NSNumber, v81), (objc_opt_isKindOfClass(v80, v86) & 1) != 0))
                {
                  v87 = (unsigned __int16)objc_msgSend(v80, "unsignedIntValue");
                }
                else
                {
                  v87 = 7200;
                }
                *((_WORD *)a4 + 36) = v83;
                *((_WORD *)a4 + 37) = v85;
                *((_WORD *)a4 + 38) = -1;
                *((_WORD *)a4 + 39) = v87;
                *((_WORD *)a4 + 40) = -1;
                *((_BYTE *)a4 + 82) = 0;
                *(_WORD *)((char *)a4 + 83) = -1;

                v64 = v145;
              }
              if ((*((_BYTE *)a4 + 68) & 1) != 0)
              {
                v88 = (id)qword_10085F520;
                if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
                {
                  v89 = objc_msgSend(v10, "uwbSessionId");
                  v90 = *((unsigned __int16 *)a4 + 36);
                  v91 = *((unsigned __int16 *)a4 + 37);
                  v92 = *((unsigned __int16 *)a4 + 38);
                  v93 = *((unsigned __int16 *)a4 + 39);
                  *(_DWORD *)buf = 67110144;
                  *(_DWORD *)&buf[4] = v89;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v90;
                  *(_WORD *)&buf[14] = 1024;
                  *(_DWORD *)&buf[16] = v91;
                  *(_WORD *)&buf[20] = 1024;
                  *(_DWORD *)&buf[22] = v92;
                  *(_WORD *)&buf[26] = 1024;
                  *(_DWORD *)&buf[28] = v93;
                  _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "#accessory-service,Prep session objects: UWB session ID %u enables AP sleep operation. Timeouts: discovery %d, reacq %d, tracking %d, job %d", buf, 0x20u);
                }

                v64 = v145;
              }
              if (v134)
              {
                v94 = (id)qword_10085F520;
                if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "#accessory-service,Prep session objects: Automatic subrating in AOP enabled", buf, 2u);
                }

                *((_DWORD *)a4 + 17) |= 0x20u;
                sub_100288D88(__p);
                v95 = 0;
                v96 = 1;
                while (1)
                {
                  v97 = &__p[3 * v95];
                  if (*(unsigned __int8 *)v97 >= 0xFu)
                    v98 = 15;
                  else
                    v98 = *(unsigned __int8 *)v97;
                  v99 = *((double *)v97 + 1);
                  v100 = *((double *)v97 + 2);
                  v101 = vcvtd_n_u64_f64(v99, 2uLL);
                  if (v101 >= 0x7F)
                    v101 = 127;
                  v102 = v96;
                  v103 = vcvtd_n_u64_f64(v100, 2uLL);
                  if (v99 <= 0.0)
                    v104 = 0;
                  else
                    v104 = v101;
                  if (v103 >= 0xF)
                    v103 = 15;
                  v105 = v100 <= 0.0 ? 0 : v103;
                  v106 = (id)qword_10085F520;
                  v107 = os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT);
                  if (!v98)
                    break;
                  if (v107)
                  {
                    *(_DWORD *)buf = 67110400;
                    *(_DWORD *)&buf[4] = v95;
                    *(_WORD *)&buf[8] = 1024;
                    *(_DWORD *)&buf[10] = v98;
                    *(_WORD *)&buf[14] = 2048;
                    *(_QWORD *)&buf[16] = v104;
                    *(_WORD *)&buf[24] = 2048;
                    *(double *)&buf[26] = (double)v104 * 0.25;
                    *(_WORD *)&buf[34] = 2048;
                    *(_QWORD *)&buf[36] = v105;
                    *(_WORD *)&buf[44] = 2048;
                    *(double *)&buf[46] = (double)v105 * 0.25;
                    _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, "#accessory-service,Prep session objects: Subrating config %d: [subrate %d, dist_0_25_m %llu (%0.2f m), hyst_0_25_m %llu (%0.2f m)", buf, 0x36u);
                  }

                  if (!v104)
                    goto LABEL_193;
                  v108 = 0;
                  v109 = 1;
                  while (1)
                  {
                    v110 = v109;
                    v111 = (char *)a4 + 2 * v108;
                    v113 = *(_WORD *)(v111 + 87);
                    v112 = v111 + 87;
                    if ((v113 & 1) == 0)
                      break;
                    v109 = 0;
                    v108 = 1;
                    if ((v110 & 1) == 0)
                      goto LABEL_193;
                  }
                  if ((v109 & 1) == 0)
                  {
                    v114 = *(unsigned __int16 *)((char *)a4 + 87);
                    if (((v114 >> 1) & 0xF) >= v98 || ((v114 >> 5) & 0x7F) >= (unsigned __int16)v104)
                    {
LABEL_193:
                      v106 = (id)qword_10085F520;
                      if (os_log_type_enabled(v106, OS_LOG_TYPE_FAULT))
                      {
                        *(_DWORD *)buf = 67109120;
                        *(_DWORD *)&buf[4] = v95;
                        _os_log_fault_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_FAULT, "#accessory-service,Prep session objects: Error adding subrating config %d", buf, 8u);
                      }
LABEL_195:

                      goto LABEL_196;
                    }
                  }
                  *v112 = (32 * (v104 & 0x7F)) | (2 * (v98 & 0x7F)) | ((_WORD)v105 << 12) | 1;
LABEL_196:
                  v96 = 0;
                  v95 = 1;
                  if ((v102 & 1) == 0)
                  {
                    v64 = v145;
                    goto LABEL_198;
                  }
                }
                if (v107)
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)&buf[4] = v95;
                  _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, "#accessory-service,Prep session objects: Subrating config %d is empty", buf, 8u);
                }
                goto LABEL_195;
              }
LABEL_198:
              v115 = sub_100289244((uint64_t)objc_msgSend(v149, "backgroundMode"));
              if (sub_100288C80(v146 != 1, v148))
                v116 = 276;
              else
                v116 = 0;
              *((_QWORD *)a5 + 8) = 0;
              *((_QWORD *)a5 + 9) = 0;
              *(_QWORD *)((char *)a5 + 78) = 0;
              *((_QWORD *)a5 + 12) = 0;
              *((_QWORD *)a5 + 13) = 0;
              *((_QWORD *)a5 + 11) = 0;
              v117 = *((unsigned __int8 *)a5 + 112);
              *(_BYTE *)a5 = 0;
              *((_BYTE *)a5 + 40) = 0;
              *((_QWORD *)a5 + 6) = 250000;
              *((_BYTE *)a5 + 56) = 1;
              *((_DWORD *)a5 + 15) = v115;
              *((_WORD *)a5 + 43) = v116;
              if (!v117)
                *((_BYTE *)a5 + 112) = 1;
              if (*((_BYTE *)a4 + 355))
              {
                if (!v148)
                  goto LABEL_207;
                if (*((_BYTE *)a4 + 435))
                {
                  if (*((_BYTE *)a4 + 437))
                  {
LABEL_207:
                    LODWORD(__p[0]) = 131073;
                    v118 = *v135;
                    if (v118 > 1 || v118 == 1 && (unsigned __int16)v64[9] >= 3u)
                      v135 = (unsigned __int16 *)__p;
                    if (v155 == 5)
                      v119 = 5;
                    else
                      v119 = 9;
                    v120 = sub_10028957C(*((unsigned __int8 *)a4 + 354));
                    v121 = objc_msgSend(v10, "uwbSessionId");
                    if (v133)
                      v122 = 200;
                    else
                      v122 = 100;
                    if ((_DWORD)v144)
                      v123 = 3;
                    else
                      v123 = 2;
                    if (HIDWORD(v144))
                      v123 = 8;
                    v124 = v148;
                    if (v148)
                    {
                      if (!*((_BYTE *)a4 + 437) || !*((_BYTE *)a4 + 435))
                        sub_10000BA44();
                      v124 = *((_BYTE *)a4 + 436);
                      v125 = *((_BYTE *)a4 + 434);
                    }
                    else
                    {
                      v125 = 0;
                    }
                    sub_10028936C(v135, (uint64_t)v151, v119, v120, v121, v136, v137, (int)v59, (uint64_t)buf, v167 != 0, (uint64_t)&v171, v28, v122, v148, v123, v124, v125);
                    sub_1002896D0((__int16 *)buf, __p);
                    *v147 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", __p[0], (char *)__p[1] - (char *)__p[0]));
                    if (__p[0])
                    {
                      __p[1] = __p[0];
                      operator delete(__p[0]);
                    }
LABEL_229:
                    if ((char)v152 < 0)
                      operator delete(v151[0]);
LABEL_231:
                    if (v138)
                    {
                      v126 = (unint64_t *)&v138->__shared_owners_;
                      do
                        v127 = __ldaxr(v126);
                      while (__stlxr(v127 - 1, v126));
                      if (!v127)
                      {
                        ((void (*)(std::__shared_weak_count *))v138->__on_zero_shared)(v138);
                        std::__shared_weak_count::__release_weak(v138);
                      }
                    }

                    goto LABEL_237;
                  }
                  v131 = "req.range_enable_params.fira.cap_size_max.has_value()";
                  v132 = 1237;
                }
                else
                {
                  v131 = "req.range_enable_params.fira.cap_size_min.has_value()";
                  v132 = 1236;
                }
              }
              else
              {
                v131 = "req.range_enable_params.fira.preamble.has_value()";
                v132 = 1233;
              }
              __assert_rtn("-[NIServerNearbyAccessoryRangingService _prepareUwbSessionTrackingObjectsForClientTracking:outServiceRequest:outStartOptions:outShareableConfigData:]", "NIServerNearbyAccessoryRangingService.mm", v132, v131);
            }
            v129 = "numRoundsPerBlockAsDouble < std::numeric_limits<uint16_t>::max()";
            v130 = 245;
          }
        }
        __assert_rtn("NumRoundsPerRangingBlock", "NIFiRaDefinitions.h", v130, v129);
      }
      if (v21 != 10)
      {
        if (v21 != 20)
          goto LABEL_240;
        v43 = v148 | v42;
        if (v148)
          v44 = 450;
        else
          v44 = 486;
        if ((v43 & 1) == 0)
        {
          v45 = (uint64_t *)&unk_10085B390;
          goto LABEL_90;
        }
        goto LABEL_85;
      }
      v47 = v148 | v42;
      if (v148)
        v44 = 2160;
      else
        v44 = 1944;
      if ((v47 & 1) == 0)
        goto LABEL_78;
LABEL_85:
      v134 = 0;
      goto LABEL_91;
    }
    if (v21)
    {
      if (v21 == 10)
      {
        v48 = v148 | v42;
        if (v148)
          v44 = 1080;
        else
          v44 = 972;
        if ((v48 & 1) == 0)
        {
          v45 = (uint64_t *)&unk_10085B330;
LABEL_90:
          v49 = sub_100288D30(v45);
          v44 = v49;
          v134 = 0;
          if (v49)
            goto LABEL_91;
LABEL_240:
          __assert_rtn("-[NIServerNearbyAccessoryRangingService _prepareUwbSessionTrackingObjectsForClientTracking:outServiceRequest:outStartOptions:outShareableConfigData:]", "NIServerNearbyAccessoryRangingService.mm", 1019, "rangingIntervalMsec > 0");
        }
        goto LABEL_85;
      }
      if (v21 != 20)
        goto LABEL_240;
    }
    v46 = v148 | v42;
    if (v148)
      v44 = 180;
    else
      v44 = 162;
    if ((v46 & 1) == 0)
    {
      v45 = (uint64_t *)&unk_10085B2D0;
      goto LABEL_90;
    }
    goto LABEL_85;
  }
LABEL_238:

}

- (void)_prepareUwbSessionTrackingObjectsFromDebugParameters:(id)a3 outServiceRequest:(void *)a4 outStartOptions:(void *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  unsigned __int16 v15;
  void *v16;
  void *v17;
  int v18;
  unsigned __int8 v19;
  double v20;
  double v21;
  double v22;
  unint64_t v23;
  unsigned __int8 v24;
  unint64_t v25;
  unsigned __int8 v26;
  uint64_t v27;
  char *v28;
  char v29;
  char v30;
  char *v31;
  _WORD *v32;
  __int16 v33;
  __int16 v34;
  unsigned __int8 v35;
  double v36;
  double v37;
  double v38;
  unint64_t v39;
  unint64_t v40;
  unsigned int v41;
  __int16 v42;
  __int16 v43;
  unsigned int v44;
  void *v45;
  unsigned __int8 v46;
  __int16 v47;
  unsigned int v48;
  unsigned int v49;
  int v50;
  unsigned int v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  __int16 v73;
  char v74;
  unsigned int v75;
  unsigned __int16 v76;
  unsigned __int16 v77;
  unsigned __int16 v78;
  int v79;
  __int16 v80;
  id v81;
  id v82;
  uint64_t v83;
  unsigned __int8 v84;
  __int16 v85;
  unsigned __int8 v86;
  int v87;
  int v88;
  int v89;
  __int16 v90;
  _QWORD v91[4];
  id v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  char v97;
  _BYTE __src[504];

  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v8)
    __assert_rtn("-[NIServerNearbyAccessoryRangingService _prepareUwbSessionTrackingObjectsFromDebugParameters:outServiceRequest:outStartOptions:]", "NIServerNearbyAccessoryRangingService.mm", 1266, "debugParameters");
  if (*((_BYTE *)a4 + 504))
    *((_BYTE *)a4 + 504) = 0;
  if (*((_BYTE *)a5 + 112))
    *((_BYTE *)a5 + 112) = 0;
  v94 = 0;
  v95 = &v94;
  v96 = 0x2020000000;
  v97 = 0;
  v91[0] = _NSConcreteStackBlock;
  v91[1] = 3221225472;
  v91[2] = sub_10028A208;
  v91[3] = &unk_100811538;
  v9 = v8;
  v92 = v9;
  v93 = &v94;
  objc_msgSend(&off_10082BDE8, "enumerateObjectsUsingBlock:", v91);
  if (!*((_BYTE *)v95 + 24))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("InitiatorRoleOverride")));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("UWBChannelOverride")));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("UWBSessionIdOverride")));
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("NumRSTUsPerSlotOverride")));
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("NumSlotsPerRoundOverride")));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("NumRoundsPerBlockOverride")));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("STSInitVectorOverride")));
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("LocalAddressOverride")));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PeerAddressOverride")));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("UseDedicatedAntennaOverride")));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("RangingModeOverride")));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MulticastCapSizeMaxOverride")));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MulticastCapSizeMinOverride")));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SBREnabledLocallyOverride")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SBREnabledRemotelyOverride")));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("StartTimeOffsetUsecOverride")));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("StartTimeUncertaintyUsecOverride")));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("InitiatorCrossSessionOffsetMsecOverride")));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AOPSubratingEnabledOverride")));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AOPSubratingOverride_Config0_Subrate")));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AOPSubratingOverride_Config0_DistanceThresholdMeters")));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AOPSubratingOverride_Config0_HysteresisMeters")));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AOPSubratingOverride_Config1_Subrate")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AOPSubratingOverride_Config1_DistanceThresholdMeters")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AOPSubratingOverride_Config1_HysteresisMeters")));
    v14 = objc_msgSend(v10, "BOOLValue");
    objc_msgSend(v72, "getBytes:length:", &v89, 6);
    v73 = 0;
    v74 = 0;
    v75 = objc_msgSend(v71, "unsignedIntValue");
    v76 = (unsigned __int16)objc_msgSend(v70, "unsignedShortValue");
    v77 = (unsigned __int16)objc_msgSend(v69, "unsignedShortValue");
    v78 = (unsigned __int16)objc_msgSend(v68, "unsignedShortValue");
    v79 = v89;
    v80 = v90;
    v81 = objc_msgSend(v67, "unsignedLongLongValue");
    v82 = objc_msgSend(v66, "unsignedLongLongValue");
    v83 = 0x400000003;
    v84 = objc_msgSend(v65, "BOOLValue");
    v85 = 257;
    v86 = objc_msgSend(v11, "BOOLValue");
    v87 = 50528256;
    v88 = 6;
    v15 = sub_10036C674((unsigned __int16)objc_msgSend(v64, "unsignedIntValue") | 0x10000u);
    if (v15 < 0x100u)
    {
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003E4494();
LABEL_72:

      goto LABEL_73;
    }
    LOBYTE(v73) = v15;
    if (objc_msgSend(v63, "isEqualToString:", CFSTR("Multicast aDS-TWR")))
    {
      v16 = sub_100004784();
      if (!sub_1003956D0((uint64_t)v16))
      {
        if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
          sub_1003E4518();
        goto LABEL_72;
      }
      LOBYTE(v87) = 1;
    }
    else
    {
      if (!objc_msgSend(v63, "isEqualToString:", CFSTR("Multicast SS-TWR")))
        goto LABEL_18;
      BYTE1(v87) = 1;
    }
    HIBYTE(v87) = objc_msgSend(v56, "unsignedIntValue");
    BYTE2(v87) = objc_msgSend(v55, "unsignedIntValue");
LABEL_18:
    v17 = v10;
    if (v14)
      sub_100164A08((char *)&v73, (uint64_t)__src);
    else
      sub_100164D58((char *)&v73, (uint64_t)__src);
    v18 = *((unsigned __int8 *)a4 + 504);
    memcpy(a4, __src, 0x1F8uLL);
    if (!v18)
      *((_BYTE *)a4 + 504) = 1;
    v10 = v17;
    if (objc_msgSend(v62, "BOOLValue"))
    {
      if (!*((_BYTE *)a4 + 504))
        goto LABEL_77;
      *((_DWORD *)a4 + 17) |= 8u;
    }
    if (objc_msgSend(v61, "BOOLValue") && (int)objc_msgSend(v60, "intValue") >= 1)
    {
      if (!*((_BYTE *)a4 + 504))
        goto LABEL_77;
      v19 = objc_msgSend(v60, "intValue");
      objc_msgSend(v53, "doubleValue");
      v21 = v20;
      objc_msgSend(v54, "doubleValue");
      v23 = vcvtd_n_u64_f64(v21, 2uLL);
      if (v23 >= 0x7F)
        LOBYTE(v23) = 127;
      if (v21 <= 0.0)
        v24 = 0;
      else
        v24 = v23;
      v25 = vcvtd_n_u64_f64(v22, 2uLL);
      if (v25 >= 0xF)
        LOWORD(v25) = 15;
      if (!v19 || !v24)
        goto LABEL_70;
      v26 = v19;
      v27 = 0;
      v28 = (char *)a4 + 68;
      v29 = 1;
      while (1)
      {
        v30 = v29;
        v31 = (char *)a4 + 2 * v27;
        v33 = *(_WORD *)(v31 + 87);
        v32 = v31 + 87;
        if ((v33 & 1) == 0)
          break;
        v29 = 0;
        v27 = 1;
        if ((v30 & 1) == 0)
          goto LABEL_70;
      }
      if ((v29 & 1) == 0)
      {
        v51 = *(unsigned __int16 *)((char *)a4 + 87);
        if (((v51 >> 1) & 0xF) >= v26 || ((v51 >> 5) & 0x7F) >= v24)
        {
LABEL_70:
          if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
            sub_1003E44C0();
          goto LABEL_72;
        }
      }
      v34 = (_WORD)v25 << 12;
      if (v22 <= 0.0)
        v34 = 0;
      *v32 = v34 & 0xF001 | (2 * (v26 & 0xF)) & 0x1F | (32 * (v24 & 0x7F)) | 1;
      if ((int)objc_msgSend(v52, "intValue") >= 1)
      {
        if (*((_BYTE *)a4 + 504))
        {
          v35 = objc_msgSend(v52, "intValue");
          objc_msgSend(v12, "doubleValue");
          v37 = v36;
          objc_msgSend(v13, "doubleValue");
          v39 = vcvtd_n_u64_f64(v37, 2uLL);
          if (v39 >= 0x7F)
            LODWORD(v39) = 127;
          v40 = vcvtd_n_u64_f64(v38, 2uLL);
          if (v37 <= 0.0)
            v41 = 0;
          else
            v41 = v39;
          v42 = 15;
          if (v40 < 0xF)
            v42 = v40;
          if (v38 <= 0.0)
            v43 = 0;
          else
            v43 = v42;
          if ((sub_1002891BC((uint64_t)v28, v35, v41, v43) & 1) == 0)
          {
            if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
              sub_1003E44EC();
            goto LABEL_72;
          }
          goto LABEL_60;
        }
LABEL_77:
        sub_10000BA44();
      }
    }
LABEL_60:
    if (v59)
      v44 = v14;
    else
      v44 = 0;
    v45 = v10;
    if (v44 == 1)
    {
      v46 = objc_msgSend(v59, "unsignedIntValue");
      v47 = 1;
    }
    else
    {
      v46 = 0;
      v47 = 0;
    }
    v48 = objc_msgSend(v58, "intValue");
    v49 = objc_msgSend(v57, "intValue");
    *((_QWORD *)a5 + 8) = 0;
    *((_QWORD *)a5 + 9) = 0;
    *(_QWORD *)((char *)a5 + 78) = 0;
    *((_QWORD *)a5 + 12) = 0;
    *((_QWORD *)a5 + 13) = 0;
    *((_QWORD *)a5 + 11) = 0;
    v50 = *((unsigned __int8 *)a5 + 112);
    *(_BYTE *)a5 = 0;
    *((_BYTE *)a5 + 40) = 0;
    *((_QWORD *)a5 + 6) = v48;
    *((_BYTE *)a5 + 56) = 1;
    *((_DWORD *)a5 + 15) = v49;
    *((_WORD *)a5 + 43) = v46 | (unsigned __int16)(v47 << 8);
    v10 = v45;
    if (!v50)
      *((_BYTE *)a5 + 112) = 1;
    goto LABEL_72;
  }
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
    sub_1003E4544();
LABEL_73:

  _Block_object_dispose(&v94, 8);
}

- (BOOL)_buildAndRunRangingSession:(unsigned int)a3
{
  uint64_t v3;
  NSMutableDictionary *uwbSessionTracking;
  void *v6;
  void *v7;
  NIServerNearbyAccessoryRangingService *v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  std::__shared_weak_count *v15;
  NIServerNearbyAccessoryRangingService *v16;
  NIServerNearbyAccessoryRangingService *v17;
  NIServerNearbyAccessoryRangingService *v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  BOOL v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  int v33;
  NSObject *v34;
  int v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  std::string v40;
  _QWORD *v41;
  std::__shared_weak_count *v42;
  uint64_t v43;
  std::__shared_weak_count *v44;
  _BYTE v45[24];
  _BYTE *v46;
  _BYTE v47[24];
  _BYTE *v48;
  _QWORD v49[2];
  int v50;
  _QWORD *v51;
  _QWORD v52[2];
  int v53;
  _QWORD *v54;
  _QWORD v55[2];
  int v56;
  _QWORD *v57;

  v3 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uwbSessionTracking = self->_uwbSessionTracking;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](uwbSessionTracking, "objectForKey:", v6));

  if (!v7)
  {
    v24 = 0;
    goto LABEL_56;
  }
  v8 = self;
  std::to_string(&v40, v3);
  v9 = objc_msgSend(v7, "serviceRequest");
  v10 = sub_1002CA108();
  v11 = v10[20];
  v12 = (std::__shared_weak_count *)v10[21];
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v14 = __ldxr(p_shared_owners);
    while (__stxr(v14 + 1, p_shared_owners));
  }
  v15 = (std::__shared_weak_count *)operator new(0x5D8uLL);
  v15->__shared_owners_ = 0;
  v15->__shared_weak_owners_ = 0;
  v15->__vftable = (std::__shared_weak_count_vtbl *)off_100811688;
  v16 = v8;
  v55[0] = off_1008116D8;
  v55[1] = v16;
  v56 = v3;
  v57 = v55;
  v17 = v16;
  v52[0] = off_100811780;
  v52[1] = v17;
  v53 = v3;
  v54 = v52;
  v18 = v17;
  v49[0] = off_100811820;
  v49[1] = v18;
  v50 = v3;
  v51 = v49;
  v48 = 0;
  v46 = 0;
  v43 = v11;
  v44 = v12;
  sub_1002B4864(&v15[1].__vftable, (__int128 *)&v40, v9, (uint64_t)v55, (uint64_t)v52, (uint64_t)v49, (uint64_t)v47, (uint64_t)v45, &v43);
  v19 = v44;
  if (v44)
  {
    v20 = (unint64_t *)&v44->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  v22 = v46;
  if (v46 == v45)
  {
    v23 = 4;
    v22 = v45;
  }
  else
  {
    if (!v46)
      goto LABEL_16;
    v23 = 5;
  }
  (*(void (**)(void))(*v22 + 8 * v23))();
LABEL_16:
  v25 = v48;
  if (v48 == v47)
  {
    v26 = 4;
    v25 = v47;
  }
  else
  {
    if (!v48)
      goto LABEL_21;
    v26 = 5;
  }
  (*(void (**)(void))(*v25 + 8 * v26))();
LABEL_21:
  v27 = v51;
  if (v51 == v49)
  {
    v28 = 4;
    v27 = v49;
  }
  else
  {
    if (!v51)
      goto LABEL_26;
    v28 = 5;
  }
  (*(void (**)(void))(*v27 + 8 * v28))();
LABEL_26:
  v29 = v54;
  if (v54 == v52)
  {
    v30 = 4;
    v29 = v52;
  }
  else
  {
    if (!v54)
      goto LABEL_31;
    v30 = 5;
  }
  (*(void (**)(void))(*v29 + 8 * v30))();
LABEL_31:
  v31 = v57;
  if (v57 == v55)
  {
    v32 = 4;
    v31 = v55;
  }
  else
  {
    if (!v57)
      goto LABEL_36;
    v32 = 5;
  }
  (*(void (**)(void))(*v31 + 8 * v32))();
LABEL_36:
  v41 = &v15[1].__vftable;
  v42 = v15;
  sub_10001B020((uint64_t)&v41, &v15[1].__shared_weak_owners_, (uint64_t)&v15[1]);
  if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v40.__r_.__value_.__l.__data_);
  if (!v41)
  {
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
      sub_1003E45D8();
    goto LABEL_49;
  }
  v33 = sub_1002AEA48((uint64_t)v41);
  if (v33)
  {
    v34 = (id)qword_10085F520;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      sub_1002B48B0(v33, v55);
      sub_1003E4650();
    }
LABEL_48:

LABEL_49:
    v24 = 0;
    goto LABEL_50;
  }
  v35 = sub_1002B1704((uint64_t)v41, (__int128 *)objc_msgSend(v7, "startOptions"));
  if (v35)
  {
    v34 = (id)qword_10085F520;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      sub_1002B48B0(v35, v55);
      sub_1003E4604();
    }
    goto LABEL_48;
  }
  objc_msgSend(v7, "setRangingSession:", &v41);
  v24 = 1;
LABEL_50:
  v36 = v42;
  if (v42)
  {
    v37 = (unint64_t *)&v42->__shared_owners_;
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }

LABEL_56:
  return v24;
}

- (void)_updateUwbSessionState:(unsigned int)a3
{
  uint64_t v3;
  NSMutableDictionary *uwbSessionTracking;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  unsigned int v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  unsigned int v15;
  unsigned int v16;
  char v17;
  NSMutableDictionary *v18;
  void *v19;
  unsigned int v20;
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint8_t buf[4];
  unsigned int v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  _BOOL4 v31;
  __int16 v32;
  unsigned int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  unsigned int v37;
  __int16 v38;
  unsigned int v39;

  v3 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uwbSessionTracking = self->_uwbSessionTracking;
  v20 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](uwbSessionTracking, "objectForKey:", v6));

  if (v7)
    v8 = *(_QWORD *)objc_msgSend(v7, "rangingSession") != 0;
  else
    v8 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "interestedClients"));
  if (objc_msgSend(v9, "count"))
    v10 = 1;
  else
    v10 = objc_msgSend(v7, "persistWhileDetached");

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "interestedClients"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10028AC68;
  v21[3] = &unk_100811560;
  v21[4] = self;
  v21[5] = &v22;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v21);

  v12 = (id)qword_10085F520;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *((unsigned __int8 *)v23 + 24);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "interestedClients"));
    v15 = objc_msgSend(v14, "count");
    v16 = objc_msgSend(v7, "persistWhileDetached");
    *(_DWORD *)buf = 67110656;
    v27 = v20;
    v28 = 1024;
    v29 = v7 != 0;
    v30 = 1024;
    v31 = v8;
    v32 = 1024;
    v33 = v10;
    v34 = 1024;
    v35 = v13;
    v36 = 1024;
    v37 = v15;
    v38 = 1024;
    v39 = v16;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#accessory-service,Update session state for UWB session ID %u. Currently: tracking %d, ranging %d. Should be: tracking %d, ranging %d. Clients: %d. Persist-detached: %d.", buf, 0x2Cu);

  }
  if ((v7 != 0) | (v10 ^ 1) & 1)
  {
    if (v7)
      v17 = v10;
    else
      v17 = 1;
    if ((v17 & 1) != 0)
    {
      if (v7)
      {
        if (v8)
        {
          if (!*((_BYTE *)v23 + 24))
            objc_msgSend(v7, "stopRanging");
        }
        else if (*((_BYTE *)v23 + 24))
        {
          if (*(_QWORD *)objc_msgSend(v7, "rangingSession"))
            __assert_rtn("-[NIServerNearbyAccessoryRangingService _updateUwbSessionState:]", "NIServerNearbyAccessoryRangingService.mm", 1541, "uwbSessionTracking.rangingSession == nullptr");
          if (!-[NIServerNearbyAccessoryRangingService _buildAndRunRangingSession:](self, "_buildAndRunRangingSession:", v20))-[NIServerNearbyAccessoryRangingService _relayToClientsOfUWBSessionId:blockToRelay:](self, "_relayToClientsOfUWBSessionId:blockToRelay:", v20, &stru_1008115A0);
        }
      }
    }
    else
    {
      objc_msgSend(v7, "stopRanging");
      v18 = self->_uwbSessionTracking;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v20));
      -[NSMutableDictionary removeObjectForKey:](v18, "removeObjectForKey:", v19);

    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
  {
    sub_1003E469C();
  }
  _Block_object_dispose(&v22, 8);

}

- (void)_cleanupExcessiveDetachedSessions
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  NSMutableArray *v8;
  NSMutableDictionary *uwbSessionTracking;
  NSMutableArray *v10;
  NSObject *v11;
  unsigned int v12;
  _QWORD v13[4];
  NSMutableArray *v14;
  uint8_t buf[4];
  unsigned int v16;
  __int16 v17;
  unsigned int v18;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("NIAccessoryMaxDetachedSessionsOverride")));

  if (v4 && (v6 = objc_opt_class(NSNumber, v5), (objc_opt_isKindOfClass(v4, v6) & 1) != 0))
    v7 = objc_msgSend(v4, "unsignedIntValue");
  else
    v7 = 12;
  v8 = objc_opt_new(NSMutableArray);
  uwbSessionTracking = self->_uwbSessionTracking;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10028AEF4;
  v13[3] = &unk_1008115C8;
  v10 = v8;
  v14 = v10;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](uwbSessionTracking, "enumerateKeysAndObjectsUsingBlock:", v13);
  if ((unint64_t)-[NSMutableArray count](v10, "count") > v7)
  {
    v11 = (id)qword_10085F520;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = -[NSMutableArray count](v10, "count");
      *(_DWORD *)buf = 67109376;
      v16 = v12;
      v17 = 1024;
      v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#accessory-service,Cleaning up detached sessions. %d found, exceeds max of %d", buf, 0xEu);
    }

    -[NSMutableDictionary removeObjectsForKeys:](self->_uwbSessionTracking, "removeObjectsForKeys:", v10);
  }

}

- (void)_serviceRequestForUWBSessionID:(unsigned int)a3 didUpdateStatus:(ServiceRequestStatusUpdate)a4
{
  int var2;
  uint64_t v5;
  uint64_t v6;
  NSObject *v8;
  int v9;
  void **v10;
  void **v11;
  void **v12;
  NSMutableDictionary *uwbSessionTracking;
  void *v14;
  void *v15;
  NSObject *v16;
  unsigned int v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  dispatch_source_t v21;
  NSObject *v22;
  dispatch_time_t v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  _QWORD v27[5];
  int v28;
  _QWORD handler[4];
  id v30;
  int v31;
  uint64_t v32;
  int v33;
  void *__p[2];
  char v35;
  void *v36[2];
  char v37;
  id buf;
  __int16 v39;
  void **v40;
  __int16 v41;
  void **v42;

  var2 = a4.var2;
  v5 = *(_QWORD *)&a4.var0;
  v6 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8 = (id)qword_10085F520;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    sub_10000BF04(v36, off_1008119D8[v5 >> 32]);
    v9 = v37;
    v10 = (void **)v36[0];
    sub_10000BF04(__p, off_100811A50[var2]);
    v11 = v36;
    if (v9 < 0)
      v11 = v10;
    if (v35 >= 0)
      v12 = __p;
    else
      v12 = (void **)__p[0];
    LODWORD(buf) = 67109634;
    HIDWORD(buf) = v6;
    v39 = 2080;
    v40 = v11;
    v41 = 2080;
    v42 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#accessory-service,Service request status update for UWB session ID %u. Event type: %s. Reason: %s", (uint8_t *)&buf, 0x1Cu);
    if (v35 < 0)
      operator delete(__p[0]);
    if (v37 < 0)
      operator delete(v36[0]);
  }

  uwbSessionTracking = self->_uwbSessionTracking;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v6));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](uwbSessionTracking, "objectForKey:", v14));

  if (!v15 || (v5 & 0xFFFFFFFF00000000) != 0x200000000 || (var2 - 9) > 1)
    goto LABEL_22;
  if (objc_msgSend(v15, "rangingRetryCount") > 7)
  {
    v26 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      buf = (id)0x804000100;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "#accessory-service,Max # of retries (%d) reached. Stop tracking peer.", (uint8_t *)&buf, 8u);
    }
LABEL_22:
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10028B604;
    v27[3] = &unk_1008115E8;
    v27[4] = v5;
    v28 = var2;
    -[NIServerNearbyAccessoryRangingService _relayToClientsOfUWBSessionId:blockToRelay:](self, "_relayToClientsOfUWBSessionId:blockToRelay:", v6, v27);
    goto LABEL_23;
  }
  objc_msgSend(v15, "setRangingRetryCount:", (objc_msgSend(v15, "rangingRetryCount") + 1));
  v16 = (id)qword_10085F520;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_msgSend(v15, "rangingRetryCount");
    LODWORD(buf) = 67109376;
    HIDWORD(buf) = v17;
    v39 = 1024;
    LODWORD(v40) = 8;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#accessory-service,Retry ranging (%d of %d)", (uint8_t *)&buf, 0xEu);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "rangingRetryTimer"));
  v19 = v18 == 0;

  if (!v19)
  {
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "rangingRetryTimer"));
    dispatch_source_cancel(v20);

    objc_msgSend(v15, "setRangingRetryTimer:", 0);
  }
  v21 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
  objc_msgSend(v15, "setRangingRetryTimer:", v21);

  v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "rangingRetryTimer"));
  v23 = dispatch_time(0, 500000000);
  dispatch_source_set_timer(v22, v23, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);

  objc_initWeak(&buf, self);
  v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "rangingRetryTimer"));
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10028B438;
  handler[3] = &unk_100811610;
  objc_copyWeak(&v30, &buf);
  v31 = v6;
  v32 = v5 | 0x200000000;
  v33 = var2;
  dispatch_source_set_event_handler(v24, handler);

  v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "rangingRetryTimer"));
  dispatch_resume(v25);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&buf);
LABEL_23:

}

- (void)_relayToClientsOfUWBSessionId:(unsigned int)a3 blockToRelay:(id)a4
{
  id v6;
  NSMutableDictionary *clientTracking;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  unsigned int v13;

  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  clientTracking = self->_clientTracking;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10028B70C;
  v12[3] = &unk_100811630;
  v13 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary keysOfEntriesPassingTest:](clientTracking, "keysOfEntriesPassingTest:", v12));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10028B73C;
  v10[3] = &unk_100811658;
  v9 = v6;
  v10[4] = self;
  v11 = v9;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uwbSessionTracking, 0);
  objc_storeStrong((id *)&self->_clientTracking, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
