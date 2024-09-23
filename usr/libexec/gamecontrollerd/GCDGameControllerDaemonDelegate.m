@implementation GCDGameControllerDaemonDelegate

- (GCDGameControllerDaemonDelegate)init
{
  GCDGameControllerDaemonDelegate *v2;
  NSMutableArray *v3;
  NSMutableArray *appConnections;
  NSMutableArray *v5;
  NSMutableArray *foregroundAppConnections;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GCDGameControllerDaemonDelegate;
  v2 = -[GCDGameControllerDaemonDelegate init](&v8, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableArray);
    appConnections = v2->_appConnections;
    v2->_appConnections = v3;

    v5 = objc_opt_new(NSMutableArray);
    foregroundAppConnections = v2->_foregroundAppConnections;
    v2->_foregroundAppConnections = v5;

  }
  return v2;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[16];

  if (sub_1000065E0())
  {
    v3 = sub_100006804();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "dealloc", buf, 2u);
    }

  }
  v5.receiver = self;
  v5.super_class = (Class)GCDGameControllerDaemonDelegate;
  -[GCDGameControllerDaemonDelegate dealloc](&v5, "dealloc");
}

- (void)ping
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  if (sub_1000065E0())
  {
    v2 = sub_100006804();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "ping", v4, 2u);
    }

  }
}

- (BOOL)shouldKeepRunning
{
  return 1;
}

- (BOOL)acceptNewConnection:(id)a3 fromGCEnabledApp:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  void *v9;
  void *v10;
  NSMutableArray *v11;
  void ***v12;
  id v14;
  NSObject *v15;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  GCDGameControllerDaemonDelegate *v20;
  id v21;
  id v22;
  id from;
  id location[3];

  v6 = a3;
  v7 = a4;
  if (sub_1000065E0())
  {
    v14 = sub_100006804();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "acceptNewConnectionFromGCEnabledApp: %@", (uint8_t *)location, 0xCu);
    }

  }
  v8 = self->_foregroundAppConnections;
  objc_sync_enter(v8);
  -[NSMutableArray addObject:](self->_foregroundAppConnections, "addObject:", v6);
  objc_sync_exit(v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___GameControllerDaemon));
  objc_msgSend(v6, "setExportedInterface:", v9);

  objc_msgSend(v6, "setExportedObject:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___GameControllerClientProtocol));
  objc_msgSend(v6, "setRemoteObjectInterface:", v10);

  v11 = self->_appConnections;
  objc_sync_enter(v11);
  -[NSMutableArray addObject:](self->_appConnections, "addObject:", v6);
  objc_sync_exit(v11);

  objc_initWeak(location, v6);
  objc_initWeak(&from, self->_appConnections);
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_100003AF4;
  v19 = &unk_10000C340;
  objc_copyWeak(&v21, location);
  objc_copyWeak(&v22, &from);
  v20 = self;
  v12 = objc_retainBlock(&v16);
  objc_msgSend(v6, "setInvalidationHandler:", v12, v16, v17, v18, v19);
  objc_msgSend(v6, "setInterruptionHandler:", v12);
  objc_msgSend(v6, "resume");

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&from);
  objc_destroyWeak(location);

  return 1;
}

- (BOOL)acceptNewConnectionFromMediaRemote:(id)a3
{
  NSXPCConnection *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  NSXPCConnection *v8;
  NSXPCConnection *mediaremoted;
  NSXPCConnection *v10;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id location[3];

  v4 = (NSXPCConnection *)a3;
  if (sub_1000065E0())
  {
    v12 = sub_100006804();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "acceptNewConnectionFromMediaRemote: %@", (uint8_t *)location, 0xCu);
    }

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___GameControllerDaemon));
  -[NSXPCConnection setExportedInterface:](v4, "setExportedInterface:", v5);

  -[NSXPCConnection setExportedObject:](v4, "setExportedObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___GameControllerClientProtocol));
  -[NSXPCConnection setRemoteObjectInterface:](v4, "setRemoteObjectInterface:", v6);

  objc_initWeak(location, v4);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100003DD4;
  v14[3] = &unk_10000C368;
  objc_copyWeak(&v15, location);
  v7 = objc_retainBlock(v14);
  -[NSXPCConnection setInvalidationHandler:](v4, "setInvalidationHandler:", v7);
  -[NSXPCConnection setInterruptionHandler:](v4, "setInterruptionHandler:", v7);
  -[NSXPCConnection resume](v4, "resume");
  v8 = self->_mediaremoted;
  objc_sync_enter(v8);
  mediaremoted = self->_mediaremoted;
  self->_mediaremoted = v4;
  v10 = v4;

  objc_sync_exit(v8);
  objc_destroyWeak(&v15);
  objc_destroyWeak(location);
  return 1;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  unsigned __int8 v12;
  BOOL v13;
  id v15;
  NSObject *v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;

  v6 = a3;
  v7 = a4;
  v8 = GCBundleWithPID(objc_msgSend(v7, "processIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (sub_1000065E0())
  {
    v15 = sub_100006804();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "resourcePath"));
      v18 = 138412802;
      v19 = v7;
      v20 = 2112;
      v21 = v6;
      v22 = 2112;
      v23 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "New connection '%@' for listener '%@' from %@", (uint8_t *)&v18, 0x20u);

    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "resourcePath"));
  v11 = objc_msgSend(v10, "containsString:", CFSTR("/System/Library/PrivateFrameworks/MediaRemote.framework/Support"));

  if (v11)
    v12 = -[GCDGameControllerDaemonDelegate acceptNewConnectionFromMediaRemote:](self, "acceptNewConnectionFromMediaRemote:", v7);
  else
    v12 = -[GCDGameControllerDaemonDelegate acceptNewConnection:fromGCEnabledApp:](self, "acceptNewConnection:fromGCEnabledApp:", v7, 0);
  v13 = v12;

  return v13;
}

- (void)controllerWithUDID:(unint64_t)a3 setValue:(float)a4 forElement:(int)a5 forward:(BOOL)a6
{
  uint64_t v6;
  NSMutableArray *v10;
  NSMutableArray *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  id v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  unint64_t v25;
  __int16 v26;
  double v27;
  __int16 v28;
  int v29;

  v6 = *(_QWORD *)&a5;
  if (sub_1000065E0())
  {
    v17 = sub_100006804();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      v25 = a3;
      v26 = 2048;
      v27 = a4;
      v28 = 1024;
      v29 = v6;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "udid:%ld, value:%f, element:%d", buf, 0x1Cu);
    }

  }
  v10 = self->_foregroundAppConnections;
  objc_sync_enter(v10);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = self->_foregroundAppConnections;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v14), "remoteObjectProxyWithErrorHandler:", &stru_10000C3A8, (_QWORD)v19));
        *(float *)&v16 = a4;
        objc_msgSend(v15, "controllerWithUDID:setValue:forElement:", a3, v6, v16);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  objc_sync_exit(v10);
}

- (void)controllerWithUDID:(unint64_t)a3 setArrayValue:(id)a4 forElement:(int)a5 forward:(BOOL)a6
{
  uint64_t v6;
  float v7;
  float v8;
  float v9;
  float v10;
  NSMutableArray *v13;
  NSMutableArray *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v6 = *(_QWORD *)&a5;
  v7 = a4.var0[3];
  v8 = a4.var0[2];
  v9 = a4.var0[1];
  v10 = a4.var0[0];
  v13 = self->_foregroundAppConnections;
  objc_sync_enter(v13);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = self->_foregroundAppConnections;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v24;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v17), "remoteObjectProxyWithErrorHandler:", &stru_10000C3C8, (_QWORD)v23));
        *(float *)&v19 = v10;
        *(float *)&v20 = v9;
        *(float *)&v21 = v8;
        *(float *)&v22 = v7;
        objc_msgSend(v18, "controllerWithUDID:setValue0:setValue1:setValue2:setValue3:forElement:", a3, v6, v19, v20, v21, v22);

        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v15);
  }

  objc_sync_exit(v13);
}

- (void)microControllerWithDigitizerX:(float)a3 withY:(float)a4 withTimeStamp:(unint64_t)a5 touchDown:(BOOL)a6
{
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  if (sub_1000065E0())
  {
    v6 = sub_100006804();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "microControllerWithDigitizerX called unexpectedly. NO-OP", v8, 2u);
    }

  }
}

- (void)microControllerWithUDID:(unint64_t)a3 setDigitizerX:(float)a4 digitizerY:(float)a5 withTimeStamp:(unint64_t)a6 touchDown:(BOOL)a7
{
  _BOOL4 v7;
  double v13;
  double v14;
  GCDGameControllerDaemonDelegate *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  int v21;
  unint64_t v22;
  __int16 v23;
  double v24;
  __int16 v25;
  double v26;
  __int16 v27;
  _BOOL4 v28;

  v7 = a7;
  if (sub_1000065E0())
  {
    v19 = sub_100006804();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 134218752;
      v22 = a3;
      v23 = 2048;
      v24 = a4;
      v25 = 2048;
      v26 = a5;
      v27 = 1024;
      v28 = v7;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "UDID:%ld, digitizerXY:%.1f,%.1f, touchDown:%d", (uint8_t *)&v21, 0x26u);
    }

    if (v7)
      goto LABEL_3;
LABEL_7:
    LODWORD(v13) = 0;
    LODWORD(v14) = 0;
    v15 = self;
    v16 = a3;
    v17 = a6;
    v18 = 0;
    goto LABEL_8;
  }
  if (!v7)
    goto LABEL_7;
LABEL_3:
  v15 = self;
  v16 = a3;
  *(float *)&v13 = a4;
  *(float *)&v14 = a5;
  v17 = a6;
  v18 = 1;
LABEL_8:
  -[GCDGameControllerDaemonDelegate processMicroControllerWithUDID:setDigitizerX:withY:withTimeStamp:touchDown:](v15, "processMicroControllerWithUDID:setDigitizerX:withY:withTimeStamp:touchDown:", v16, v17, v18, v13, v14);
}

- (void)processMicroControllerWithUDID:(unint64_t)a3 setDigitizerX:(float)a4 withY:(float)a5 withTimeStamp:(unint64_t)a6 touchDown:(BOOL)a7
{
  _BOOL8 v7;
  NSMutableArray *v13;
  NSMutableArray *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v7 = a7;
  v13 = self->_foregroundAppConnections;
  objc_sync_enter(v13);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = self->_foregroundAppConnections;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v22;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v17), "remoteObjectProxy", (_QWORD)v21));
        *(float *)&v19 = a4;
        *(float *)&v20 = a5;
        objc_msgSend(v18, "microControllerWithUDID:setDigitizerX:digitizerY:withTimeStamp:touchDown:", a3, a6, v7, v19, v20);

        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v15);
  }

  objc_sync_exit(v13);
}

- (void)controllerDidConnect:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  -[GCDGameControllerDaemonDelegate addController:forward:](self, "addController:forward:", v4, 1);

}

- (void)addController:(id)a3 forward:(BOOL)a4
{
  id v6;
  NSMutableArray *v7;
  NSMutableArray *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  NSObject *v50;
  void *v51;
  id v52;
  void *v53;
  _QWORD v54[4];
  id v55[2];
  BOOL v56;
  _QWORD v57[4];
  id v58[2];
  BOOL v59;
  _QWORD v60[4];
  id v61[2];
  BOOL v62;
  _QWORD v63[4];
  id v64[2];
  BOOL v65;
  _QWORD v66[4];
  id v67[2];
  BOOL v68;
  _QWORD v69[4];
  id v70[2];
  BOOL v71;
  _QWORD v72[4];
  id v73[2];
  BOOL v74;
  _QWORD v75[4];
  id v76[2];
  BOOL v77;
  _QWORD v78[4];
  id v79[2];
  BOOL v80;
  _QWORD v81[4];
  id v82[2];
  BOOL v83;
  _QWORD v84[4];
  id v85[2];
  BOOL v86;
  _QWORD v87[4];
  id v88[2];
  BOOL v89;
  _QWORD v90[4];
  id v91[2];
  BOOL v92;
  _QWORD v93[4];
  id v94[2];
  BOOL v95;
  _QWORD v96[4];
  id v97[2];
  BOOL v98;
  _QWORD v99[4];
  id v100[2];
  BOOL v101;
  _QWORD v102[4];
  id v103[2];
  BOOL v104;
  _QWORD v105[4];
  id v106[2];
  BOOL v107;
  _QWORD v108[4];
  id v109[2];
  BOOL v110;
  _QWORD v111[4];
  id v112[2];
  BOOL v113;
  _QWORD v114[4];
  id v115[2];
  BOOL v116;
  _QWORD v117[4];
  id v118[2];
  BOOL v119;
  _QWORD v120[4];
  id v121[2];
  BOOL v122;
  _QWORD v123[4];
  id v124[2];
  BOOL v125;
  _QWORD v126[4];
  id v127[2];
  BOOL v128;
  _QWORD v129[4];
  id v130[2];
  BOOL v131;
  _QWORD v132[4];
  id v133[2];
  BOOL v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  _BYTE v139[128];
  _BYTE location[12];
  __int16 v141;
  id v142;

  v6 = a3;
  if (sub_1000065E0())
  {
    v49 = sub_100006804();
    v50 = objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 138412546;
      *(_QWORD *)&location[4] = v6;
      v141 = 2048;
      v142 = objc_msgSend(v6, "deviceHash");
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "addController:%@ for hash:%lu", location, 0x16u);
    }

  }
  if (!a4)
  {
    v7 = self->_appConnections;
    objc_sync_enter(v7);
    v135 = 0u;
    v136 = 0u;
    v137 = 0u;
    v138 = 0u;
    v8 = self->_appConnections;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v135, v139, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v136;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v136 != v10)
            objc_enumerationMutation(v8);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v135 + 1) + 8 * (_QWORD)i), "remoteObjectProxy"));
          objc_msgSend(v12, "addControllerForAppStoreRemote:", v6);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v135, v139, 16);
      }
      while (v9);
    }

    objc_sync_exit(v7);
  }
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "gamepad"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "dpad"));
  objc_initWeak((id *)location, self);
  v52 = v6;
  v13 = objc_msgSend(v52, "deviceHash");
  v132[0] = _NSConcreteStackBlock;
  v132[1] = 3221225472;
  v132[2] = sub_100005488;
  v132[3] = &unk_10000C3F0;
  objc_copyWeak(v133, (id *)location);
  v133[1] = v13;
  v134 = a4;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "down"));
  objc_msgSend(v14, "setValueChangedHandler:", v132);

  v129[0] = _NSConcreteStackBlock;
  v129[1] = 3221225472;
  v129[2] = sub_1000054DC;
  v129[3] = &unk_10000C3F0;
  objc_copyWeak(v130, (id *)location);
  v130[1] = v13;
  v131 = a4;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "right"));
  objc_msgSend(v15, "setValueChangedHandler:", v129);

  v126[0] = _NSConcreteStackBlock;
  v126[1] = 3221225472;
  v126[2] = sub_100005530;
  v126[3] = &unk_10000C3F0;
  objc_copyWeak(v127, (id *)location);
  v127[1] = v13;
  v128 = a4;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "left"));
  objc_msgSend(v16, "setValueChangedHandler:", v126);

  v123[0] = _NSConcreteStackBlock;
  v123[1] = 3221225472;
  v123[2] = sub_100005584;
  v123[3] = &unk_10000C3F0;
  objc_copyWeak(v124, (id *)location);
  v124[1] = v13;
  v125 = a4;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "up"));
  objc_msgSend(v17, "setValueChangedHandler:", v123);

  v120[0] = _NSConcreteStackBlock;
  v120[1] = 3221225472;
  v120[2] = sub_1000055D8;
  v120[3] = &unk_10000C3F0;
  objc_copyWeak(v121, (id *)location);
  v121[1] = v13;
  v122 = a4;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "buttonA"));
  objc_msgSend(v18, "setValueChangedHandler:", v120);

  v117[0] = _NSConcreteStackBlock;
  v117[1] = 3221225472;
  v117[2] = sub_10000562C;
  v117[3] = &unk_10000C3F0;
  objc_copyWeak(v118, (id *)location);
  v118[1] = v13;
  v119 = a4;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "buttonB"));
  objc_msgSend(v19, "setValueChangedHandler:", v117);

  v114[0] = _NSConcreteStackBlock;
  v114[1] = 3221225472;
  v114[2] = sub_100005680;
  v114[3] = &unk_10000C3F0;
  objc_copyWeak(v115, (id *)location);
  v115[1] = v13;
  v116 = a4;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "buttonX"));
  objc_msgSend(v20, "setValueChangedHandler:", v114);

  v111[0] = _NSConcreteStackBlock;
  v111[1] = 3221225472;
  v111[2] = sub_1000056D4;
  v111[3] = &unk_10000C3F0;
  objc_copyWeak(v112, (id *)location);
  v112[1] = v13;
  v113 = a4;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "buttonY"));
  objc_msgSend(v21, "setValueChangedHandler:", v111);

  v108[0] = _NSConcreteStackBlock;
  v108[1] = 3221225472;
  v108[2] = sub_100005728;
  v108[3] = &unk_10000C3F0;
  objc_copyWeak(v109, (id *)location);
  v109[1] = v13;
  v110 = a4;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "leftShoulder"));
  objc_msgSend(v22, "setValueChangedHandler:", v108);

  v105[0] = _NSConcreteStackBlock;
  v105[1] = 3221225472;
  v105[2] = sub_10000577C;
  v105[3] = &unk_10000C3F0;
  objc_copyWeak(v106, (id *)location);
  v106[1] = v13;
  v107 = a4;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "rightShoulder"));
  objc_msgSend(v23, "setValueChangedHandler:", v105);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "extendedGamepad"));
  v102[0] = _NSConcreteStackBlock;
  v102[1] = 3221225472;
  v102[2] = sub_1000057D0;
  v102[3] = &unk_10000C3F0;
  objc_copyWeak(v103, (id *)location);
  v103[1] = v13;
  v104 = a4;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leftThumbstick"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "down"));
  objc_msgSend(v26, "setValueChangedHandler:", v102);

  v99[0] = _NSConcreteStackBlock;
  v99[1] = 3221225472;
  v99[2] = sub_100005824;
  v99[3] = &unk_10000C3F0;
  objc_copyWeak(v100, (id *)location);
  v100[1] = v13;
  v101 = a4;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leftThumbstick"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "right"));
  objc_msgSend(v28, "setValueChangedHandler:", v99);

  v96[0] = _NSConcreteStackBlock;
  v96[1] = 3221225472;
  v96[2] = sub_100005878;
  v96[3] = &unk_10000C3F0;
  objc_copyWeak(v97, (id *)location);
  v97[1] = v13;
  v98 = a4;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leftThumbstick"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "left"));
  objc_msgSend(v30, "setValueChangedHandler:", v96);

  v93[0] = _NSConcreteStackBlock;
  v93[1] = 3221225472;
  v93[2] = sub_1000058CC;
  v93[3] = &unk_10000C3F0;
  objc_copyWeak(v94, (id *)location);
  v94[1] = v13;
  v95 = a4;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leftThumbstick"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "up"));
  objc_msgSend(v32, "setValueChangedHandler:", v93);

  v90[0] = _NSConcreteStackBlock;
  v90[1] = 3221225472;
  v90[2] = sub_100005920;
  v90[3] = &unk_10000C3F0;
  objc_copyWeak(v91, (id *)location);
  v91[1] = v13;
  v92 = a4;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "rightThumbstick"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "down"));
  objc_msgSend(v34, "setValueChangedHandler:", v90);

  v87[0] = _NSConcreteStackBlock;
  v87[1] = 3221225472;
  v87[2] = sub_100005974;
  v87[3] = &unk_10000C3F0;
  objc_copyWeak(v88, (id *)location);
  v88[1] = v13;
  v89 = a4;
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "rightThumbstick"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "right"));
  objc_msgSend(v36, "setValueChangedHandler:", v87);

  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472;
  v84[2] = sub_1000059C8;
  v84[3] = &unk_10000C3F0;
  objc_copyWeak(v85, (id *)location);
  v85[1] = v13;
  v86 = a4;
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "rightThumbstick"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "left"));
  objc_msgSend(v38, "setValueChangedHandler:", v84);

  v81[0] = _NSConcreteStackBlock;
  v81[1] = 3221225472;
  v81[2] = sub_100005A1C;
  v81[3] = &unk_10000C3F0;
  objc_copyWeak(v82, (id *)location);
  v82[1] = v13;
  v83 = a4;
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "rightThumbstick"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "up"));
  objc_msgSend(v40, "setValueChangedHandler:", v81);

  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = sub_100005A70;
  v78[3] = &unk_10000C3F0;
  objc_copyWeak(v79, (id *)location);
  v79[1] = v13;
  v80 = a4;
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leftTrigger"));
  objc_msgSend(v41, "setValueChangedHandler:", v78);

  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472;
  v75[2] = sub_100005AC4;
  v75[3] = &unk_10000C3F0;
  objc_copyWeak(v76, (id *)location);
  v76[1] = v13;
  v77 = a4;
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "rightTrigger"));
  objc_msgSend(v42, "setValueChangedHandler:", v75);

  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_100005B18;
  v72[3] = &unk_10000C3F0;
  objc_copyWeak(v73, (id *)location);
  v73[1] = v13;
  v74 = a4;
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "buttonMenu"));
  objc_msgSend(v43, "setValueChangedHandler:", v72);

  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472;
  v69[2] = sub_100005B6C;
  v69[3] = &unk_10000C3F0;
  objc_copyWeak(v70, (id *)location);
  v70[1] = v13;
  v71 = a4;
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "buttonOptions"));
  objc_msgSend(v44, "setValueChangedHandler:", v69);

  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472;
  v66[2] = sub_100005BC0;
  v66[3] = &unk_10000C3F0;
  objc_copyWeak(v67, (id *)location);
  v67[1] = v13;
  v68 = a4;
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "buttonHome"));
  objc_msgSend(v45, "setValueChangedHandler:", v66);

  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = sub_100005C14;
  v63[3] = &unk_10000C3F0;
  objc_copyWeak(v64, (id *)location);
  v64[1] = v13;
  v65 = a4;
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leftThumbstickButton"));
  objc_msgSend(v46, "setValueChangedHandler:", v63);

  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_100005C68;
  v60[3] = &unk_10000C3F0;
  objc_copyWeak(v61, (id *)location);
  v61[1] = v13;
  v62 = a4;
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "rightThumbstickButton"));
  objc_msgSend(v47, "setValueChangedHandler:", v60);

  if ((objc_msgSend(v52, "isATVRemote") & 1) == 0)
  {
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_100005CBC;
    v57[3] = &unk_10000C418;
    objc_copyWeak(v58, (id *)location);
    v58[1] = v13;
    v59 = a4;
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "motion"));
    objc_msgSend(v48, "setValueChangedHandler:", v57);

    objc_destroyWeak(v58);
  }
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_100005E80;
  v54[3] = &unk_10000C440;
  objc_copyWeak(v55, (id *)location);
  v55[1] = v13;
  v56 = a4;
  objc_msgSend(v52, "setControllerPausedHandler:", v54);
  objc_destroyWeak(v55);
  objc_destroyWeak(v61);
  objc_destroyWeak(v64);
  objc_destroyWeak(v67);
  objc_destroyWeak(v70);
  objc_destroyWeak(v73);
  objc_destroyWeak(v76);
  objc_destroyWeak(v79);
  objc_destroyWeak(v82);
  objc_destroyWeak(v85);
  objc_destroyWeak(v88);
  objc_destroyWeak(v91);
  objc_destroyWeak(v94);
  objc_destroyWeak(v97);
  objc_destroyWeak(v100);
  objc_destroyWeak(v103);

  objc_destroyWeak(v106);
  objc_destroyWeak(v109);
  objc_destroyWeak(v112);
  objc_destroyWeak(v115);
  objc_destroyWeak(v118);
  objc_destroyWeak(v121);
  objc_destroyWeak(v124);
  objc_destroyWeak(v127);
  objc_destroyWeak(v130);
  objc_destroyWeak(v133);

  objc_destroyWeak((id *)location);
}

- (void)controllerDidDisconnect:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  -[GCDGameControllerDaemonDelegate removeController:forward:](self, "removeController:forward:", v4, 1);

}

- (void)removeController:(id)a3 forward:(BOOL)a4
{
  id v6;
  NSMutableArray *v7;
  NSMutableArray *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;

  v6 = a3;
  if (sub_1000065E0())
  {
    v13 = sub_100006804();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v6;
      v22 = 2048;
      v23 = objc_msgSend(v6, "deviceHash");
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "removeController:%@ for hash: %lu", buf, 0x16u);
    }

  }
  if (!a4)
  {
    v7 = self->_appConnections;
    objc_sync_enter(v7);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = self->_appConnections;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v8);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11), "remoteObjectProxy", (_QWORD)v15));
          objc_msgSend(v12, "removeController:", v6);

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    objc_sync_exit(v7);
  }

}

- (void)appWillEnterForeground
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  if (sub_1000065E0())
  {
    v2 = sub_100006804();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "appWillEnterForeground", v4, 2u);
    }

  }
}

- (void)appDidEnterBackground
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  if (sub_1000065E0())
  {
    v2 = sub_100006804();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "appDidEnterBackground", v4, 2u);
    }

  }
}

- (void)appWillEnterForegroundWithPID:(int)a3
{
  NSMutableArray *v5;
  NSMutableArray *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  NSMutableArray *v12;
  id v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  int v21;

  if (sub_1000065E0())
  {
    v13 = sub_100006804();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v21 = a3;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "appWillEnterForegroundWithPID:%d", buf, 8u);
    }

  }
  v5 = self->_appConnections;
  objc_sync_enter(v5);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_appConnections;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "processIdentifier", (_QWORD)v15) == a3)
        {
          v11 = v10;
          goto LABEL_12;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_12:

  objc_sync_exit(v5);
  v12 = self->_foregroundAppConnections;
  objc_sync_enter(v12);
  if ((-[NSMutableArray containsObject:](self->_foregroundAppConnections, "containsObject:", v11) & 1) == 0)
    -[NSMutableArray addObject:](self->_foregroundAppConnections, "addObject:", v11);
  objc_sync_exit(v12);

}

- (void)appDidEnterBackgroundWithPID:(int)a3
{
  NSMutableArray *v5;
  NSMutableArray *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  NSMutableArray *v12;
  id v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  int v21;

  if (sub_1000065E0())
  {
    v13 = sub_100006804();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v21 = a3;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "appDidEnterBackgroundWithPID:%d", buf, 8u);
    }

  }
  v5 = self->_appConnections;
  objc_sync_enter(v5);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_appConnections;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "processIdentifier", (_QWORD)v15) == a3)
        {
          v11 = v10;
          goto LABEL_12;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_12:

  objc_sync_exit(v5);
  v12 = self->_foregroundAppConnections;
  objc_sync_enter(v12);
  -[NSMutableArray removeObject:](self->_foregroundAppConnections, "removeObject:", v11);
  objc_sync_exit(v12);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaremoted, 0);
  objc_storeStrong((id *)&self->_foregroundAppConnections, 0);
  objc_storeStrong((id *)&self->_appConnections, 0);
}

@end
