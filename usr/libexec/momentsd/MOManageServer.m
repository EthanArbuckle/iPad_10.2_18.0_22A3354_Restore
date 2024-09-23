@implementation MOManageServer

- (MOManageServer)initWithUniverse:(id)a3
{
  id v4;
  MOManageServer *v5;
  MODaemonClient *v6;
  MODaemonClient *client;
  uint64_t v8;
  NSXPCInterface *interface;
  NSXPCInterface *v10;
  void *v11;
  NSXPCInterface *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSSet *v22;
  void *v23;
  NSXPCInterface *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSSet *v34;
  void *v35;
  NSXPCInterface *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSSet *v40;
  void *v41;
  NSXPCInterface *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSSet *v48;
  void *v49;
  NSXPCInterface *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSSet *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  NSSet *v73;
  NSObject *v74;
  NSXPCInterface *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  NSSet *v83;
  void *v84;
  NSXPCInterface *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  NSSet *v93;
  void *v94;
  NSXPCInterface *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  NSSet *v103;
  void *v104;
  NSXPCInterface *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  NSSet *v113;
  void *v114;
  NSXPCInterface *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  NSSet *v123;
  void *v124;
  NSXPCInterface *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  NSSet *v133;
  void *v134;
  NSXPCInterface *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  NSSet *v139;
  void *v140;
  NSXPCInterface *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  NSSet *v147;
  void *v148;
  NSXPCInterface *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  NSSet *v153;
  void *v154;
  id v155;
  void *v156;
  id os_log;
  NSObject *v158;
  MOManageServer *v159;
  id v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  id v169;
  uint8_t buf[16];
  objc_super v171;

  v4 = a3;
  v171.receiver = self;
  v171.super_class = (Class)MOManageServer;
  v5 = -[MOManageServer init](&v171, "init");
  if (v5)
  {
    v6 = -[MODaemonClient initWithUniverse:]([MODaemonClient alloc], "initWithUniverse:", v4);
    client = v5->_client;
    v5->_client = v6;

    -[MODaemonClient setEntitlementDelegate:](v5->_client, "setEntitlementDelegate:", v5);
    v8 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___MOMomentsXPCProtocol));
    interface = v5->interface;
    v5->interface = (NSXPCInterface *)v8;

    v10 = v5->interface;
    if (v10)
    {
      v169 = v4;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___MODatabaseUpgradeCompletionDelegateProtocol));
      -[NSXPCInterface setInterface:forSelector:argumentIndex:ofReply:](v10, "setInterface:forSelector:argumentIndex:ofReply:", v11, "scheduleDatabaseUpgradeWithContext:andDelegate:", 1, 0);

      v12 = v5->interface;
      v14 = objc_opt_class(NSArray, v13);
      v16 = objc_opt_class(MOXPCContext, v15);
      v18 = objc_opt_class(MOEvent, v17);
      v20 = objc_opt_class(NSString, v19);
      v22 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v14, v16, v18, v20, objc_opt_class(NSData, v21), 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v12, "setClasses:forSelector:argumentIndex:ofReply:", v23, "storeEvents:withContext:andHandler:", 0, 0);

      v24 = v5->interface;
      v26 = objc_opt_class(NSArray, v25);
      v28 = objc_opt_class(MOXPCContext, v27);
      v30 = objc_opt_class(MOEvent, v29);
      v32 = objc_opt_class(NSString, v31);
      v34 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v26, v28, v30, v32, objc_opt_class(NSData, v33), 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v24, "setClasses:forSelector:argumentIndex:ofReply:", v35, "analyzeTrendsInEvents:withContext:andRefreshVariant:andHandler:", 0, 0);

      v36 = v5->interface;
      v38 = objc_opt_class(NSArray, v37);
      v40 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v38, objc_opt_class(NSUUID, v39), 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v36, "setClasses:forSelector:argumentIndex:ofReply:", v41, "didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:", 0, 0);

      v42 = v5->interface;
      v44 = objc_opt_class(NSDictionary, v43);
      v46 = objc_opt_class(NSNumber, v45);
      v48 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v44, v46, objc_opt_class(NSString, v47), 0);
      v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v42, "setClasses:forSelector:argumentIndex:ofReply:", v49, "didAppEntryUpdateUsingSuggestions:onEvent:duringInterval:withInfo:", 3, 0);

      v50 = v5->interface;
      v52 = objc_opt_class(NSArray, v51);
      v54 = objc_opt_class(MONotificationScheduleItem, v53);
      v56 = objc_opt_class(NSString, v55);
      v58 = objc_opt_class(NSDictionary, v57);
      v60 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v52, v54, v56, v58, objc_opt_class(NSNumber, v59), 0);
      v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v50, "setClasses:forSelector:argumentIndex:ofReply:", v61, "setupMomentsNotificationsWithSchedule:options:handler:", 0, 0);

      v63 = objc_opt_class(NSDictionary, v62);
      v65 = objc_opt_class(NSArray, v64);
      v67 = objc_opt_class(NSString, v66);
      v69 = objc_opt_class(NSNumber, v68);
      v71 = objc_opt_class(NSUUID, v70);
      v73 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v63, v65, v67, v69, v71, objc_opt_class(NSDate, v72), 0);
      v74 = objc_claimAutoreleasedReturnValue(v73);
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v5->interface, "setClasses:forSelector:argumentIndex:ofReply:", v74, "logEngagementEvent:timestamp:withContext:", 2, 0);
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v5->interface, "setClasses:forSelector:argumentIndex:ofReply:", v74, "logPerformanceEvent:timestamp:withContext:", 2, 0);
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v5->interface, "setClasses:forSelector:argumentIndex:ofReply:", v74, "logUsageEvent:timestamp:withContext:", 2, 0);
      v75 = v5->interface;
      v77 = objc_opt_class(NSArray, v76);
      v79 = objc_opt_class(NSString, v78);
      v81 = objc_opt_class(NSData, v80);
      v83 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v77, v79, v81, objc_opt_class(NSNumber, v82), 0);
      v84 = (void *)objc_claimAutoreleasedReturnValue(v83);
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v75, "setClasses:forSelector:argumentIndex:ofReply:", v84, "getOnboardingFlowCompletionStatusWithHandler:", 0, 0);

      v85 = v5->interface;
      v87 = objc_opt_class(NSArray, v86);
      v89 = objc_opt_class(NSString, v88);
      v91 = objc_opt_class(NSData, v90);
      v93 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v87, v89, v91, objc_opt_class(NSNumber, v92), 0);
      v94 = (void *)objc_claimAutoreleasedReturnValue(v93);
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v85, "setClasses:forSelector:argumentIndex:ofReply:", v94, "setOnboardingFlowCompletionStatus:", 0, 0);

      v95 = v5->interface;
      v97 = objc_opt_class(NSArray, v96);
      v99 = objc_opt_class(NSString, v98);
      v101 = objc_opt_class(NSData, v100);
      v103 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v97, v99, v101, objc_opt_class(NSNumber, v102), 0);
      v104 = (void *)objc_claimAutoreleasedReturnValue(v103);
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v95, "setClasses:forSelector:argumentIndex:ofReply:", v104, "getOnboardingFlowRefreshCompletionStatusWithHandler:", 0, 0);

      v105 = v5->interface;
      v107 = objc_opt_class(NSArray, v106);
      v109 = objc_opt_class(NSString, v108);
      v111 = objc_opt_class(NSData, v110);
      v113 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v107, v109, v111, objc_opt_class(NSNumber, v112), 0);
      v114 = (void *)objc_claimAutoreleasedReturnValue(v113);
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v105, "setClasses:forSelector:argumentIndex:ofReply:", v114, "getStateForSetting:withHandler:", 0, 0);

      v115 = v5->interface;
      v117 = objc_opt_class(NSArray, v116);
      v119 = objc_opt_class(NSString, v118);
      v121 = objc_opt_class(NSData, v120);
      v123 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v117, v119, v121, objc_opt_class(NSNumber, v122), 0);
      v124 = (void *)objc_claimAutoreleasedReturnValue(v123);
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v115, "setClasses:forSelector:argumentIndex:ofReply:", v124, "getStateForSettingFast:withHandler:", 0, 0);

      v125 = v5->interface;
      v127 = objc_opt_class(NSArray, v126);
      v129 = objc_opt_class(NSString, v128);
      v131 = objc_opt_class(NSData, v130);
      v133 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v127, v129, v131, objc_opt_class(NSNumber, v132), 0);
      v134 = (void *)objc_claimAutoreleasedReturnValue(v133);
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v125, "setClasses:forSelector:argumentIndex:ofReply:", v134, "setState:forSetting:", 0, 0);

      v135 = v5->interface;
      v137 = objc_opt_class(NSDictionary, v136);
      v139 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v137, objc_opt_class(NSNumber, v138), 0);
      v140 = (void *)objc_claimAutoreleasedReturnValue(v139);
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v135, "setClasses:forSelector:argumentIndex:ofReply:", v140, "getDiagnosticReporterConfiguration:", 0, 0);

      v141 = v5->interface;
      v143 = objc_opt_class(NSDictionary, v142);
      v145 = objc_opt_class(NSString, v144);
      v147 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v143, v145, objc_opt_class(NSNumber, v146), 0);
      v148 = (void *)objc_claimAutoreleasedReturnValue(v147);
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v141, "setClasses:forSelector:argumentIndex:ofReply:", v148, "getApplicationsWithDataAccess:", 0, 0);

      v149 = v5->interface;
      v151 = objc_opt_class(NSDictionary, v150);
      v153 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v151, objc_opt_class(NSString, v152), 0);
      v154 = (void *)objc_claimAutoreleasedReturnValue(v153);
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v149, "setClasses:forSelector:argumentIndex:ofReply:", v154, "registerApplicationsForDataAccess:", 0, 0);

      v155 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.momentsd"));
      v156 = v155;
      if (v155)
      {
        objc_msgSend(v155, "setDelegate:", v5);
        objc_msgSend(v156, "resume");
        os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
        v158 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v158, OS_LOG_TYPE_DEFAULT, "initiate managerSever", buf, 2u);
        }

        v159 = v5;
      }
      else
      {
        v159 = 0;
      }

      v4 = v169;
    }
    else
    {
      v160 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      v74 = objc_claimAutoreleasedReturnValue(v160);
      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
        -[MOManageServer initWithUniverse:].cold.1(v74, v161, v162, v163, v164, v165, v166, v167);
      v159 = 0;
    }

  }
  else
  {
    v159 = 0;
  }

  return v159;
}

- (id)getInternalEntitlementsForConnection:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "valueForEntitlement:", CFSTR("com.apple.momentsd.internal")));
  v5 = objc_opt_class(NSArray, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    v6 = v3;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id os_log;
  NSObject *v9;
  NSObject *v10;
  _DWORD v12[2];
  __int16 v13;
  id v14;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOManageServer getInternalEntitlementsForConnection:](self, "getInternalEntitlementsForConnection:", v5));
  v7 = objc_msgSend(v6, "count");

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12[0] = 67109378;
      v12[1] = objc_msgSend(v5, "processIdentifier");
      v13 = 2112;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "New XPC connection from process %d (%@)", (uint8_t *)v12, 0x12u);
    }

    objc_msgSend(v5, "setExportedInterface:", self->interface);
    objc_msgSend(v5, "setExportedObject:", self->_client);
    objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_0);
    objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_185);
    objc_msgSend(v5, "resume");
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MOManageServer listener:shouldAcceptNewConnection:].cold.1(v5, v10);

    objc_msgSend(v5, "invalidate");
  }

  return v7 != 0;
}

void __53__MOManageServer_listener_shouldAcceptNewConnection___block_invoke(id a1)
{
  id os_log;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  v2 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __53__MOManageServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

}

void __53__MOManageServer_listener_shouldAcceptNewConnection___block_invoke_184(id a1)
{
  id os_log;
  NSObject *v2;
  uint8_t v3[16];

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  v2 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Invalidated", v3, 2u);
  }

}

- (id)getNotifier
{
  MODaemonClient *client;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id os_log;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  client = self->_client;
  if (!client)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[MOManageServer getNotifier].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOManageServer.m"), 168, CFSTR("Invalid parameter not satisfying: _client"));
    v5 = 0;
    goto LABEL_9;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonClient notifier](client, "notifier"));
  if (!v5)
  {
    v6 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MOManageServer getNotifier].cold.2(v7, v8, v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOManageServer.m"), 170, CFSTR("No daemon notifier (in %s:%d)"), "-[MOManageServer getNotifier]", 170);
LABEL_9:

  }
  return v5;
}

- (id)client
{
  return self->_client;
}

- (BOOL)clientConnection:(id)a3 hasInternalEntitlement:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOManageServer getInternalEntitlementsForConnection:](self, "getInternalEntitlementsForConnection:", a3));
  LOBYTE(self) = objc_msgSend(v7, "containsObject:", v6);

  return (char)self;
}

- (MODaemonSPINotifier)notifier
{
  return self->_notifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifier, 0);
  objc_storeStrong((id *)&self->interfaceOnboardingAndSettings, 0);
  objc_storeStrong((id *)&self->interface, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

- (void)initWithUniverse:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, a1, a3, "No interface created", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_2();
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v4;
  _DWORD v5[2];
  __int16 v6;
  void *v7;

  v5[0] = 67109378;
  v5[1] = objc_msgSend(a1, "processIdentifier");
  v6 = 2112;
  v7 = a1;
  OUTLINED_FUNCTION_1_2((void *)&_mh_execute_header, a2, v4, "Rejecting connection from process %d (%@)", (uint8_t *)v5);
}

void __53__MOManageServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, a1, a3, "Interrupted", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_2();
}

- (void)getNotifier
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;

  v3 = 136315394;
  v4 = "-[MOManageServer getNotifier]";
  v5 = 1024;
  v6 = 170;
  OUTLINED_FUNCTION_1_2((void *)&_mh_execute_header, a1, a3, "No daemon notifier (in %s:%d)", (uint8_t *)&v3);
}

@end
