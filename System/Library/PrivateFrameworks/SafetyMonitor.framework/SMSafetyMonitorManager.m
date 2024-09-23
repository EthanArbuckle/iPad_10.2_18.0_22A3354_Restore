@implementation SMSafetyMonitorManager

+ (id)defaultManager
{
  if (qword_254415D58 != -1)
    dispatch_once(&qword_254415D58, &__block_literal_global_3);
  return (id)_MergedGlobals_15;
}

void __40__SMSafetyMonitorManager_defaultManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_MergedGlobals_15;
  _MergedGlobals_15 = v0;

}

- (SMSafetyMonitorManager)initWithRestorationIdentifier:(id)a3
{
  id v4;
  SMSafetyMonitorManager *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  SMSafetyMonitorManager *v13;
  NSObject *v14;
  const char *v15;
  id v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *queue;
  uint64_t v19;
  NSString *restorationIdentifier;
  __CFNotificationCenter *DarwinNotifyCenter;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  uint8_t buf[4];
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SMSafetyMonitorManager;
  v5 = -[SMSafetyMonitorManager init](&v27, sel_init);
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v24;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v24 != v9)
              objc_enumerationMutation(v6);
            v11 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v10);
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v29 = v11;
              _os_log_debug_impl(&dword_245521000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
        }
        while (v8);
      }

    }
    v13 = v5;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (const char *)-[SMSafetyMonitorManager UTF8String](objc_retainAutorelease(v13), "UTF8String");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), v13);
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v15 = (const char *)objc_msgSend(v16, "UTF8String");

    }
    v17 = dispatch_queue_create(v15, v14);

    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v17;

    v19 = objc_msgSend(v4, "copy");
    restorationIdentifier = v13->_restorationIdentifier;
    v13->_restorationIdentifier = (NSString *)v19;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v13, (CFNotificationCallback)onDaemonStartNotification, CFSTR("com.apple.routined.safetyMonitor"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    -[SMSafetyMonitorManager createConnection](v13, "createConnection");
  }

  return v5;
}

- (SMSafetyMonitorManager)init
{
  return -[SMSafetyMonitorManager initWithRestorationIdentifier:](self, "initWithRestorationIdentifier:", 0);
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  objc_super v5;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  v5.receiver = self;
  v5.super_class = (Class)SMSafetyMonitorManager;
  -[SMSafetyMonitorManager dealloc](&v5, sel_dealloc);
}

- (void)_createConnection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SMSafetyMonitorManagerExportedObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  void *v154;
  uint64_t v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  NSObject *v162;
  objc_class *v163;
  void *v164;
  void *v165;
  _QWORD v167[5];
  _QWORD v168[4];
  id v169;
  _QWORD v170[4];
  id v171;
  _BYTE location[12];
  __int16 v173;
  void *v174;
  uint64_t v175;

  v175 = *MEMORY[0x24BDAC8D0];
  -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.routined.safetyMonitor"), 4096);
  -[SMSafetyMonitorManager setXpcConnection:](self, "setXpcConnection:", v4);

  -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSafetyMonitorManager queue](self, "queue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setQueue:", v7);

    -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_257490620);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setExportedInterface:", v9);

    -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SMSafetyMonitorManagerExportedObject initWithSafetyMonitorManager:]([SMSafetyMonitorManagerExportedObject alloc], "initWithSafetyMonitorManager:", self);
    objc_msgSend(v10, "setExportedObject:", v11);

    -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_257495870);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRemoteObjectInterface:", v13);

    -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "remoteObjectInterface");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x24BDBCF20];
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, v18, v19, v20, v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_startSessionWithConfiguration_handler_, 0, 0);

    -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "remoteObjectInterface");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x24BDBCF20];
    v26 = objc_opt_class();
    v27 = objc_opt_class();
    v28 = objc_opt_class();
    v29 = objc_opt_class();
    v30 = objc_opt_class();
    objc_msgSend(v25, "setWithObjects:", v26, v27, v28, v29, v30, objc_opt_class(), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_modifySessionWithConfiguration_handler_, 0, 0);

    -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "remoteObjectInterface");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)MEMORY[0x24BDBCF20];
    v35 = objc_opt_class();
    v36 = objc_opt_class();
    v37 = objc_opt_class();
    v38 = objc_opt_class();
    v39 = objc_opt_class();
    objc_msgSend(v34, "setWithObjects:", v35, v36, v37, v38, v39, objc_opt_class(), 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setClasses:forSelector:argumentIndex:ofReply:", v40, sel_checkInitiatorEligibilityWithHandler_, 0, 0);

    -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "remoteObjectInterface");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setClasses:forSelector:argumentIndex:ofReply:", v43, sel_checkHasSimWithHandler_, 0, 0);

    -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "remoteObjectInterface");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)MEMORY[0x24BDBCF20];
    v47 = objc_opt_class();
    objc_msgSend(v46, "setWithObjects:", v47, objc_opt_class(), 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setClasses:forSelector:argumentIndex:ofReply:", v48, sel_checkConversationEligibility_handler_, 0, 0);

    -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "remoteObjectInterface");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setClasses:forSelector:argumentIndex:ofReply:", v51, sel_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler_, 0, 0);

    -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "remoteObjectInterface");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)MEMORY[0x24BDBCF20];
    v55 = objc_opt_class();
    objc_msgSend(v54, "setWithObjects:", v55, objc_opt_class(), 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setClasses:forSelector:argumentIndex:ofReply:", v56, sel_fetchSuggestionsWithOptions_handler_, 0, 1);

    -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "remoteObjectInterface");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (void *)MEMORY[0x24BDBCF20];
    v60 = objc_opt_class();
    v61 = objc_opt_class();
    v62 = objc_opt_class();
    objc_msgSend(v59, "setWithObjects:", v60, v61, v62, objc_opt_class(), 0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setClasses:forSelector:argumentIndex:ofReply:", v63, sel_fetchSessionManagerStatesWithOptions_handler_, 0, 1);

    -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "remoteObjectInterface");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = (void *)MEMORY[0x24BDBCF20];
    v67 = objc_opt_class();
    v68 = objc_opt_class();
    v69 = objc_opt_class();
    v70 = objc_opt_class();
    v71 = objc_opt_class();
    objc_msgSend(v66, "setWithObjects:", v67, v68, v69, v70, v71, objc_opt_class(), 0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setClasses:forSelector:argumentIndex:ofReply:", v72, sel_fetchSessionConfigurationsWithOptions_handler_, 0, 1);

    -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "remoteObjectInterface");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setClasses:forSelector:argumentIndex:ofReply:", v75, sel_fetchSuggestedSessionConfigurationWithHandler_, 0, 1);

    -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "remoteObjectInterface");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = (void *)MEMORY[0x24BDBCF20];
    v79 = objc_opt_class();
    v80 = objc_opt_class();
    v81 = objc_opt_class();
    v82 = objc_opt_class();
    v83 = objc_opt_class();
    v84 = objc_opt_class();
    objc_msgSend(v78, "setWithObjects:", v79, v80, v81, v82, v83, v84, objc_opt_class(), 0);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setClasses:forSelector:argumentIndex:ofReply:", v85, sel_launchSessionInitiationUIWithConfiguration_handler_, 0, 0);

    -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "remoteObjectInterface");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "setClasses:forSelector:argumentIndex:ofReply:", v88, sel_fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler_, 0, 1);

    -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "remoteObjectInterface");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = (void *)MEMORY[0x24BDBCF20];
    v92 = objc_opt_class();
    objc_msgSend(v91, "setWithObjects:", v92, objc_opt_class(), 0);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setClasses:forSelector:argumentIndex:ofReply:", v93, sel_runProactiveSuggestionsEngineWithContext_shouldStoreSuggestions_handler_, 0, 1);

    -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "remoteObjectInterface");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = (void *)MEMORY[0x24BDBCF20];
    v97 = objc_opt_class();
    objc_msgSend(v96, "setWithObjects:", v97, objc_opt_class(), 0);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "setClasses:forSelector:argumentIndex:ofReply:", v98, sel_fetchMostLikelyReceiverHandlesWithHandler_, 0, 1);

    -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "remoteObjectInterface");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "setClasses:forSelector:argumentIndex:ofReply:", v101, sel_fetchMostLikelySessionDestinationsWithHandler_, 0, 1);

    -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "remoteObjectInterface");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = (void *)MEMORY[0x24BDBCF20];
    v105 = objc_opt_class();
    objc_msgSend(v104, "setWithObjects:", v105, objc_opt_class(), 0);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "setClasses:forSelector:argumentIndex:ofReply:", v106, sel_fetchMostLikelySessionDestinationsWithHandler_, 1, 1);

    -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "remoteObjectInterface");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "setClasses:forSelector:argumentIndex:ofReply:", v109, sel_shouldShowKeyboardSuggestionsForInitiator_receiver_handler_, 0, 0);

    -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "remoteObjectInterface");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "setClasses:forSelector:argumentIndex:ofReply:", v112, sel_shouldShowTipKitSuggestionsForInitiator_receiver_handler_, 0, 0);

    -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "remoteObjectInterface");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "setClasses:forSelector:argumentIndex:ofReply:", v115, sel_shouldShowTipKitSuggestionsForInitiator_receiver_handler_, 0, 0);

    -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "remoteObjectInterface");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = (void *)MEMORY[0x24BDBCF20];
    v119 = objc_opt_class();
    objc_msgSend(v118, "setWithObjects:", v119, objc_opt_class(), 0);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "setClasses:forSelector:argumentIndex:ofReply:", v120, sel_initializeSessionWithConversation_handler_, 0, 0);

    -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "remoteObjectInterface");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = (void *)MEMORY[0x24BDBCF20];
    v124 = objc_opt_class();
    v125 = objc_opt_class();
    objc_msgSend(v123, "setWithObjects:", v124, v125, objc_opt_class(), 0);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "setClasses:forSelector:argumentIndex:ofReply:", v126, sel_initializeSessionWithConversation_handler_, 0, 1);

    -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "remoteObjectInterface");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "setClasses:forSelector:argumentIndex:ofReply:", v129, sel_showSuggestionsDetectionUIWithSuggestion_handler_, 0, 0);

    -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "remoteObjectInterface");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = (void *)MEMORY[0x24BDBCF20];
    v133 = objc_opt_class();
    v134 = objc_opt_class();
    v135 = objc_opt_class();
    v136 = objc_opt_class();
    v137 = objc_opt_class();
    objc_msgSend(v132, "setWithObjects:", v133, v134, v135, v136, v137, objc_opt_class(), 0);
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "setClasses:forSelector:argumentIndex:ofReply:", v138, sel_fetchAllReceiverSessionStatusWithCompletion_, 0, 1);

    -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "remoteObjectInterface");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "setClasses:forSelector:argumentIndex:ofReply:", v141, sel_respondToNotificationWithIdentifier_sessionIdentifier_actionIdentifier_handler_, 0, 0);

    -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "remoteObjectInterface");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "setClasses:forSelector:argumentIndex:ofReply:", v144, sel_sendHeartbeatForSessionID_handler_, 0, 0);

    -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "remoteObjectInterface");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "setClasses:forSelector:argumentIndex:ofReply:", v147, sel_fetchCurrentLocalSessionStateWithHandler_, 0, 1);

    -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "remoteObjectInterface");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    v150 = (void *)MEMORY[0x24BDBCF20];
    v151 = objc_opt_class();
    v152 = objc_opt_class();
    objc_msgSend(v150, "setWithObjects:", v151, v152, objc_opt_class(), 0);
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "setClasses:forSelector:argumentIndex:ofReply:", v153, sel_fetchSOSReceiversWithCompletion_, 0, 1);

    objc_initWeak((id *)location, self);
    -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    v155 = MEMORY[0x24BDAC760];
    v170[0] = MEMORY[0x24BDAC760];
    v170[1] = 3221225472;
    v170[2] = __43__SMSafetyMonitorManager__createConnection__block_invoke;
    v170[3] = &unk_25166E440;
    objc_copyWeak(&v171, (id *)location);
    objc_msgSend(v154, "setInvalidationHandler:", v170);

    -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    v168[0] = v155;
    v168[1] = 3221225472;
    v168[2] = __43__SMSafetyMonitorManager__createConnection__block_invoke_315;
    v168[3] = &unk_25166E440;
    objc_copyWeak(&v169, (id *)location);
    objc_msgSend(v156, "setInterruptionHandler:", v168);

    -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v157, "resume");

    -[SMSafetyMonitorManager restorationIdentifier](self, "restorationIdentifier");
    v158 = (void *)objc_claimAutoreleasedReturnValue();

    if (v158)
    {
      -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      v167[0] = v155;
      v167[1] = 3221225472;
      v167[2] = __43__SMSafetyMonitorManager__createConnection__block_invoke_317;
      v167[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
      v167[4] = a2;
      objc_msgSend(v159, "remoteObjectProxyWithErrorHandler:", v167);
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMSafetyMonitorManager restorationIdentifier](self, "restorationIdentifier");
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v160, "setRestorationIdentifier:", v161);

    }
    objc_destroyWeak(&v169);
    objc_destroyWeak(&v171);
    objc_destroyWeak((id *)location);
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v162 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v162, OS_LOG_TYPE_DEBUG))
  {
    v163 = (objc_class *)objc_opt_class();
    NSStringFromClass(v163);
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)location = 138412546;
    *(_QWORD *)&location[4] = v164;
    v173 = 2112;
    v174 = v165;
    _os_log_debug_impl(&dword_245521000, v162, OS_LOG_TYPE_DEBUG, "%@, XPC Connection Created, %@", location, 0x16u);

  }
}

void __43__SMSafetyMonitorManager__createConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__SMSafetyMonitorManager__createConnection__block_invoke_2;
  block[3] = &unk_25166E418;
  block[4] = WeakRetained;
  dispatch_async(v2, block);

}

uint64_t __43__SMSafetyMonitorManager__createConnection__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_245521000, v2, OS_LOG_TYPE_INFO, "%@, xpc connection invalidated", (uint8_t *)&v6, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "setXpcConnection:", 0);
}

void __43__SMSafetyMonitorManager__createConnection__block_invoke_315(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__SMSafetyMonitorManager__createConnection__block_invoke_2_316;
  block[3] = &unk_25166E418;
  block[4] = WeakRetained;
  dispatch_async(v2, block);

}

void __43__SMSafetyMonitorManager__createConnection__block_invoke_2_316()
{
  NSObject *v0;
  objc_class *v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    v1 = (objc_class *)objc_opt_class();
    NSStringFromClass(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_245521000, v0, OS_LOG_TYPE_INFO, "%@, xpc connection interrupted", (uint8_t *)&v3, 0xCu);

  }
}

void __43__SMSafetyMonitorManager__createConnection__block_invoke_317(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v8;
  NSObject *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  SMErrorConnectionCreate(*(const char **)(a1 + 32), CFSTR("%@"), a3, a4, a5, a6, a7, a8, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v8;
    _os_log_error_impl(&dword_245521000, v9, OS_LOG_TYPE_ERROR, "Error: %@", buf, 0xCu);
  }

}

- (void)_setUpMonitoring
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SMSafetyMonitorManager sessionStateHandler](self, "sessionStateHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SMSafetyMonitorManager sessionStateHandler](self, "sessionStateHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSafetyMonitorManager startMonitoringSessionStateWithHandler:](self, "startMonitoringSessionStateWithHandler:", v4);

  }
  -[SMSafetyMonitorManager initiatorSafetyCacheHandler](self, "initiatorSafetyCacheHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SMSafetyMonitorManager initiatorSafetyCacheHandler](self, "initiatorSafetyCacheHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSafetyMonitorManager startMonitoringInitiatorSafetyCacheWithHandler:](self, "startMonitoringInitiatorSafetyCacheWithHandler:", v6);

  }
  -[SMSafetyMonitorManager receiverSessionStatusHandler](self, "receiverSessionStatusHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SMSafetyMonitorManager receiverSessionStatusHandler](self, "receiverSessionStatusHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSafetyMonitorManager startMonitoringReceiverSessionStatusWithHandler:](self, "startMonitoringReceiverSessionStatusWithHandler:", v8);

  }
  -[SMSafetyMonitorManager receiverSafetyCacheHandler](self, "receiverSafetyCacheHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SMSafetyMonitorManager receiverSafetyCacheHandler](self, "receiverSafetyCacheHandler");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[SMSafetyMonitorManager startMonitoringReceiverSafetyCacheWithHandler:](self, "startMonitoringReceiverSafetyCacheWithHandler:", v10);

  }
}

- (void)createConnection
{
  NSObject *v3;
  _QWORD block[5];

  -[SMSafetyMonitorManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__SMSafetyMonitorManager_createConnection__block_invoke;
  block[3] = &unk_25166E418;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __42__SMSafetyMonitorManager_createConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createConnection");
}

- (id)_getConnection
{
  void *v3;
  NSObject *v4;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_fault_impl(&dword_245521000, v4, OS_LOG_TYPE_FAULT, "%@, xpcConnection is nil, create new connection", (uint8_t *)&v8, 0xCu);

    }
    -[SMSafetyMonitorManager _createConnection](self, "_createConnection");
  }
  -[SMSafetyMonitorManager xpcConnection](self, "xpcConnection");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)handleDaemonStart
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[SMSafetyMonitorManager handleDaemonStart]";
    _os_log_impl(&dword_245521000, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  -[SMSafetyMonitorManager queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__SMSafetyMonitorManager_handleDaemonStart__block_invoke;
  block[3] = &unk_25166E418;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __43__SMSafetyMonitorManager_handleDaemonStart__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  const __CFString *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("YES");
      if (!v4)
        v5 = CFSTR("NO");
      v7 = 136315394;
      v8 = "-[SMSafetyMonitorManager handleDaemonStart]_block_invoke";
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_245521000, v3, OS_LOG_TYPE_INFO, "%s, xpc connection, %@", (uint8_t *)&v7, 0x16u);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_createConnection");
  }
  return objc_msgSend(*(id *)(a1 + 32), "_setUpMonitoring");
}

- (id)_proxyForServicingSelector:(SEL)a3 withErrorHandler:(id)a4
{
  return -[SMSafetyMonitorManager _proxyForServicingSelector:asynchronous:withErrorHandler:](self, "_proxyForServicingSelector:asynchronous:withErrorHandler:", a3, 1, a4);
}

- (id)_proxyForServicingSelector:(SEL)a3 asynchronous:(BOOL)a4 withErrorHandler:(id)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void (**v10)(void *, void *);
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  _QWORD aBlock[5];
  id v27;
  SEL v28;

  v5 = a4;
  v8 = a5;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__SMSafetyMonitorManager__proxyForServicingSelector_asynchronous_withErrorHandler___block_invoke;
  aBlock[3] = &unk_25166E8D8;
  v27 = v8;
  v28 = a3;
  aBlock[4] = self;
  v9 = v8;
  v10 = (void (**)(void *, void *))_Block_copy(aBlock);
  -[SMSafetyMonitorManager _getConnection](self, "_getConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v11;
  if (!v11)
  {
    v20 = CFSTR("no xpc connection");
LABEL_10:
    SMErrorConnectionCreate(a3, v20, v12, v13, v14, v15, v16, v17, v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v23);

    v22 = 0;
    goto LABEL_11;
  }
  if (v5)
  {
    objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v10);
    v19 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_245521000, v21, OS_LOG_TYPE_INFO, "vending synchronous remote object proxy.", (uint8_t *)&v25, 2u);
    }

    objc_msgSend(v18, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v19;
  if (!v19)
  {
    v20 = CFSTR("no remote object proxy");
    goto LABEL_10;
  }
LABEL_11:

  return v22;
}

void __83__SMSafetyMonitorManager__proxyForServicingSelector_asynchronous_withErrorHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "createSMProxyErrorWithSelector:error:", *(_QWORD *)(a1 + 48), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    _os_log_error_impl(&dword_245521000, v4, OS_LOG_TYPE_ERROR, "%@, %@, Wrapped Proxy Error, %@", (uint8_t *)&v9, 0x20u);

  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v3);

}

- (id)createSMProxyErrorWithSelector:(SEL)a3 error:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)*MEMORY[0x24BDD0B88];

  if (v6 == v7)
  {
    if (objc_msgSend(v5, "code") == 4097)
    {
      v8 = 20;
    }
    else if (objc_msgSend(v5, "code") == 4099)
    {
      v8 = 21;
    }
    else
    {
      v8 = 8;
    }
  }
  else
  {
    v8 = 8;
  }
  v9 = (void *)MEMORY[0x24BDD1540];
  v16 = *MEMORY[0x24BDD0FC8];
  v10 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("connection failure while servicing %@, %@"), v11, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("SMErrorDomain"), v8, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)launchTaskWithSelector:(SEL)a3 remainingAttempts:(unint64_t)a4 proxyErrorHandler:(id)a5 taskBlock:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  SEL v18;
  unint64_t v19;

  v10 = a5;
  v11 = a6;
  -[SMSafetyMonitorManager queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __95__SMSafetyMonitorManager_launchTaskWithSelector_remainingAttempts_proxyErrorHandler_taskBlock___block_invoke;
  block[3] = &unk_25166E488;
  v18 = a3;
  v19 = a4;
  block[4] = self;
  v16 = v10;
  v17 = v11;
  v13 = v11;
  v14 = v10;
  dispatch_async(v12, block);

}

void __95__SMSafetyMonitorManager_launchTaskWithSelector_remainingAttempts_proxyErrorHandler_taskBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __95__SMSafetyMonitorManager_launchTaskWithSelector_remainingAttempts_proxyErrorHandler_taskBlock___block_invoke_2;
  v8[3] = &unk_25166E4B0;
  v2 = *(_QWORD *)(a1 + 56);
  v4 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 64);
  v12 = v2;
  v8[4] = v4;
  v9 = v3;
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v4, "_proxyForServicingSelector:withErrorHandler:", v2, v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v7;
    _os_log_impl(&dword_245521000, v6, OS_LOG_TYPE_INFO, "SMSafetyMonitorManager, %@, running task block", buf, 0xCu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __95__SMSafetyMonitorManager_launchTaskWithSelector_remainingAttempts_proxyErrorHandler_taskBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  __CFString *v4;
  __CFString *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 == CFSTR("SMErrorDomain"))
  {
    if (objc_msgSend(v3, "code") == 20)
    {

    }
    else
    {
      v7 = objc_msgSend(v3, "code");

      if (v7 != 21)
        goto LABEL_3;
    }
    if (*(_QWORD *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 32), "queue");
      v8 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[2] = __95__SMSafetyMonitorManager_launchTaskWithSelector_remainingAttempts_proxyErrorHandler_taskBlock___block_invoke_3;
      block[3] = &unk_25166E488;
      v9 = *(_QWORD *)(a1 + 56);
      v17 = *(_QWORD *)(a1 + 64);
      v18 = v9;
      v10 = *(void **)(a1 + 40);
      block[4] = *(_QWORD *)(a1 + 32);
      block[1] = 3221225472;
      v15 = v10;
      v16 = *(id *)(a1 + 48);
      dispatch_async(v8, block);

      goto LABEL_6;
    }
  }
  else
  {

  }
LABEL_3:
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v20 = v12;
    v21 = 2112;
    v22 = v13;
    v23 = 2112;
    v24 = v3;
    _os_log_error_impl(&dword_245521000, v6, OS_LOG_TYPE_ERROR, "%@, %@, running proxy handler, %@", buf, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_6:

}

uint64_t __95__SMSafetyMonitorManager_launchTaskWithSelector_remainingAttempts_proxyErrorHandler_taskBlock___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 64) - 1;
    v6 = 138412546;
    v7 = v3;
    v8 = 2048;
    v9 = v4;
    _os_log_impl(&dword_245521000, v2, OS_LOG_TYPE_INFO, "SMSafetyMonitorManager retrying, %@, count, %lu", (uint8_t *)&v6, 0x16u);

  }
  return objc_msgSend(*(id *)(a1 + 32), "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64) - 1, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)initializeSessionWithConversation:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  SMHeartbeatTimer *v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  SMSafetyMonitorManager *v22;
  id v23;
  uint64_t *v24;
  __int128 *p_buf;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  os_signpost_id_t v32;
  __int128 buf;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 0;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_signpost_id_generate(v9);

    v32 = v10;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = v30[3];
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      objc_msgSend(v7, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "description");
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v16 = objc_msgSend(v15, "UTF8String");
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v16;
      _os_signpost_emit_with_name_impl(&dword_245521000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SMInitializationSessionLatency", " enableTelemetry=YES {handle:%{public,signpost.telemetry:string1}s}", (uint8_t *)&buf, 0xCu);

    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__1;
    v36 = __Block_byref_object_dispose__1;
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v37 = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc_init(SMHeartbeatTimer);
    -[SMSafetyMonitorManager setHeartbeatTimer:](self, "setHeartbeatTimer:", v17);

    v18 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __68__SMSafetyMonitorManager_initializeSessionWithConversation_handler___block_invoke;
    v26[3] = &unk_25166E4D8;
    v28 = &v29;
    v27 = v8;
    v20[0] = v18;
    v20[1] = 3221225472;
    v20[2] = __68__SMSafetyMonitorManager_initializeSessionWithConversation_handler___block_invoke_333;
    v20[3] = &unk_25166E528;
    v24 = &v29;
    p_buf = &buf;
    v21 = v7;
    v22 = self;
    v23 = v27;
    -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v26, v20);

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v29, 8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_245521000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: conversation", (uint8_t *)&buf, 2u);
    }

  }
}

void __68__SMSafetyMonitorManager_initializeSessionWithConversation_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = 134349056;
    v8 = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMInitializationSessionLatency", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __68__SMSafetyMonitorManager_initializeSessionWithConversation_handler___block_invoke_333(uint64_t a1, void *a2)
{
  id v4;
  int8x16_t v5;
  _QWORD v6[4];
  int8x16_t v7;
  id v8;
  __int128 v9;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__SMSafetyMonitorManager_initializeSessionWithConversation_handler___block_invoke_2;
  v6[3] = &unk_25166E500;
  v9 = *(_OWORD *)(a1 + 56);
  v5 = *(int8x16_t *)(a1 + 32);
  v4 = (id)v5.i64[0];
  v7 = vextq_s8(v5, v5, 8uLL);
  v8 = *(id *)(a1 + 48);
  objc_msgSend(a2, "initializeSessionWithConversation:handler:", v4, v6);

}

void __68__SMSafetyMonitorManager_initializeSessionWithConversation_handler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  double v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v8 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v13 = 134349056;
    v14 = objc_msgSend(v7, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v10, OS_SIGNPOST_INTERVAL_END, v11, "SMInitializationSessionLatency", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "timeIntervalSinceNow");
  objc_msgSend(*(id *)(a1 + 32), "submitInitializationAnalyticsEventWithError:conversation:duration:", v7, *(_QWORD *)(a1 + 40), -v12);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)cancelInitializationWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  uint8_t *v15;
  _QWORD v16[4];
  id v17;
  uint8_t *v18;
  uint8_t buf[16];
  uint8_t v20[8];
  uint8_t *v21;
  uint64_t v22;
  os_signpost_id_t v23;

  v5 = a3;
  if (v5)
  {
    *(_QWORD *)v20 = 0;
    v21 = v20;
    v22 = 0x2020000000;
    v23 = 0;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_signpost_id_generate(v6);

    v23 = v7;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = *((_QWORD *)v21 + 3);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_245521000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SMCancelInitializationSessionLatency", " enableTelemetry=YES ", buf, 2u);
    }

    v11 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __58__SMSafetyMonitorManager_cancelInitializationWithHandler___block_invoke;
    v16[3] = &unk_25166E4D8;
    v18 = v20;
    v17 = v5;
    v13[0] = v11;
    v13[1] = 3221225472;
    v13[2] = __58__SMSafetyMonitorManager_cancelInitializationWithHandler___block_invoke_336;
    v13[3] = &unk_25166E550;
    v15 = v20;
    v14 = v17;
    -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v16, v13);

    _Block_object_dispose(v20, 8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v20 = 0;
      _os_log_error_impl(&dword_245521000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", v20, 2u);
    }

  }
}

void __58__SMSafetyMonitorManager_cancelInitializationWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = 134349056;
    v8 = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMCancelInitializationSessionLatency", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__SMSafetyMonitorManager_cancelInitializationWithHandler___block_invoke_336(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__SMSafetyMonitorManager_cancelInitializationWithHandler___block_invoke_2;
  v5[3] = &unk_25166E4D8;
  v4 = *(_OWORD *)(a1 + 32);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(a2, "cancelInitializationWithHandler:", v5);

}

void __58__SMSafetyMonitorManager_cancelInitializationWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = 134349056;
    v8 = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMCancelInitializationSessionLatency", " enableTelemetry=YES {{error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)cancelInitializationForSessionID:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t *v19;
  _QWORD v20[4];
  id v21;
  uint8_t *v22;
  uint8_t buf[16];
  uint8_t v24[8];
  uint8_t *v25;
  uint64_t v26;
  os_signpost_id_t v27;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    *(_QWORD *)v24 = 0;
    v25 = v24;
    v26 = 0x2020000000;
    v27 = 0;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_signpost_id_generate(v9);

    v27 = v10;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = *((_QWORD *)v25 + 3);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_245521000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SMCancelInitializationSessionLatency", " enableTelemetry=YES ", buf, 2u);
    }

    v14 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __67__SMSafetyMonitorManager_cancelInitializationForSessionID_handler___block_invoke;
    v20[3] = &unk_25166E4D8;
    v22 = v24;
    v21 = v8;
    v16[0] = v14;
    v16[1] = 3221225472;
    v16[2] = __67__SMSafetyMonitorManager_cancelInitializationForSessionID_handler___block_invoke_337;
    v16[3] = &unk_25166E720;
    v17 = v7;
    v19 = v24;
    v18 = v21;
    -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v20, v16);

    _Block_object_dispose(v24, 8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v24 = 0;
      _os_log_error_impl(&dword_245521000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", v24, 2u);
    }

  }
}

void __67__SMSafetyMonitorManager_cancelInitializationForSessionID_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = 134349056;
    v8 = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMCancelInitializationSessionLatency", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__SMSafetyMonitorManager_cancelInitializationForSessionID_handler___block_invoke_337(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;

  v3 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__SMSafetyMonitorManager_cancelInitializationForSessionID_handler___block_invoke_2;
  v6[3] = &unk_25166E4D8;
  v5 = *(_OWORD *)(a1 + 40);
  v4 = (id)v5;
  v7 = v5;
  objc_msgSend(a2, "cancelInitializationForSessionID:handler:", v3, v6);

}

void __67__SMSafetyMonitorManager_cancelInitializationForSessionID_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = 134349056;
    v8 = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMCancelInitializationSessionLatency", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)endSessionForSessionID:(id)a3 reason:(unint64_t)a4 handler:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t *v21;
  unint64_t v22;
  _QWORD v23[4];
  id v24;
  uint8_t *v25;
  uint8_t buf[16];
  uint8_t v27[8];
  uint8_t *v28;
  uint64_t v29;
  os_signpost_id_t v30;

  v9 = a3;
  v10 = a5;
  if (v10)
  {
    *(_QWORD *)v27 = 0;
    v28 = v27;
    v29 = 0x2020000000;
    v30 = 0;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_signpost_id_generate(v11);

    v30 = v12;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = *((_QWORD *)v28 + 3);
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_245521000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v15, "SMEndSessionLatency", " enableTelemetry=YES ", buf, 2u);
    }

    v16 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __64__SMSafetyMonitorManager_endSessionForSessionID_reason_handler___block_invoke;
    v23[3] = &unk_25166E4D8;
    v25 = v27;
    v24 = v10;
    v18[0] = v16;
    v18[1] = 3221225472;
    v18[2] = __64__SMSafetyMonitorManager_endSessionForSessionID_reason_handler___block_invoke_338;
    v18[3] = &unk_25166E578;
    v21 = v27;
    v22 = a4;
    v19 = v9;
    v20 = v24;
    -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v23, v18);

    _Block_object_dispose(v27, 8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v27 = 0;
      _os_log_error_impl(&dword_245521000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", v27, 2u);
    }

  }
}

void __64__SMSafetyMonitorManager_endSessionForSessionID_reason_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = 134349056;
    v8 = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMEndSessionLatency", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__SMSafetyMonitorManager_endSessionForSessionID_reason_handler___block_invoke_338(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  __int128 v6;
  _QWORD v7[4];
  __int128 v8;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 56);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__SMSafetyMonitorManager_endSessionForSessionID_reason_handler___block_invoke_2;
  v7[3] = &unk_25166E4D8;
  v6 = *(_OWORD *)(a1 + 40);
  v5 = (id)v6;
  v8 = v6;
  objc_msgSend(a2, "endSessionForSessionID:reason:handler:", v3, v4, v7);

}

void __64__SMSafetyMonitorManager_endSessionForSessionID_reason_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = 134349056;
    v8 = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMEndSessionLatency", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)handoffSessionForSessionID:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  NSObject *v14;
  _QWORD v15[4];
  NSObject *v16;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    v10 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __61__SMSafetyMonitorManager_handoffSessionForSessionID_handler___block_invoke;
    v15[3] = &unk_25166E5A0;
    v16 = v8;
    v12[0] = v10;
    v12[1] = 3221225472;
    v12[2] = __61__SMSafetyMonitorManager_handoffSessionForSessionID_handler___block_invoke_2;
    v12[3] = &unk_25166EA18;
    v13 = v7;
    v14 = v16;
    -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v15, v12);

    v11 = v16;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_245521000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }

}

uint64_t __61__SMSafetyMonitorManager_handoffSessionForSessionID_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__SMSafetyMonitorManager_handoffSessionForSessionID_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __61__SMSafetyMonitorManager_handoffSessionForSessionID_handler___block_invoke_3;
  v4[3] = &unk_25166E5A0;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "handoffSessionForSessionID:handler:", v3, v4);

}

uint64_t __61__SMSafetyMonitorManager_handoffSessionForSessionID_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)modifySessionWithConfiguration:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t *v21;
  _QWORD v22[4];
  id v23;
  uint8_t *v24;
  uint8_t v25[8];
  uint8_t *v26;
  uint64_t v27;
  os_signpost_id_t v28;
  uint8_t buf[4];
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v25 = 0;
      _os_log_error_impl(&dword_245521000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", v25, 2u);
    }
    goto LABEL_12;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v25 = 0;
      _os_log_error_impl(&dword_245521000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: configuration", v25, 2u);
    }
LABEL_12:

    goto LABEL_13;
  }
  *(_QWORD *)v25 = 0;
  v26 = v25;
  v27 = 0x2020000000;
  v28 = 0;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  v28 = v10;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = *((_QWORD *)v26 + 3);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    objc_msgSend(v7, "description");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = objc_msgSend(v14, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v30 = v15;
    _os_signpost_emit_with_name_impl(&dword_245521000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SMModifySessionLatency", " enableTelemetry=YES {newConfiguration:%{public,signpost.telemetry:string1}s}", buf, 0xCu);

  }
  v16 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __65__SMSafetyMonitorManager_modifySessionWithConfiguration_handler___block_invoke;
  v22[3] = &unk_25166E4D8;
  v24 = v25;
  v23 = v8;
  v18[0] = v16;
  v18[1] = 3221225472;
  v18[2] = __65__SMSafetyMonitorManager_modifySessionWithConfiguration_handler___block_invoke_339;
  v18[3] = &unk_25166E720;
  v19 = v7;
  v21 = v25;
  v20 = v23;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v22, v18);

  _Block_object_dispose(v25, 8);
LABEL_13:

}

void __65__SMSafetyMonitorManager_modifySessionWithConfiguration_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = 134349056;
    v8 = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMModifySessionLatency", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__SMSafetyMonitorManager_modifySessionWithConfiguration_handler___block_invoke_339(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;

  v3 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __65__SMSafetyMonitorManager_modifySessionWithConfiguration_handler___block_invoke_2;
  v6[3] = &unk_25166E4D8;
  v5 = *(_OWORD *)(a1 + 40);
  v4 = (id)v5;
  v7 = v5;
  objc_msgSend(a2, "modifySessionWithConfiguration:handler:", v3, v6);

}

void __65__SMSafetyMonitorManager_modifySessionWithConfiguration_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = 134349056;
    v8 = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMModifySessionLatency", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sendSafetyCacheForSessionID:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint8_t buf[16];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  os_signpost_id_t v28;

  v7 = a3;
  v8 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  v28 = v10;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = v26[3];
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_245521000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SMSendSafetyCache", " enableTelemetry=YES ", buf, 2u);
  }

  v14 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __62__SMSafetyMonitorManager_sendSafetyCacheForSessionID_handler___block_invoke;
  v21[3] = &unk_25166E4D8;
  v23 = &v25;
  v22 = v8;
  v17[0] = v14;
  v17[1] = 3221225472;
  v17[2] = __62__SMSafetyMonitorManager_sendSafetyCacheForSessionID_handler___block_invoke_340;
  v17[3] = &unk_25166E720;
  v15 = v7;
  v18 = v15;
  v20 = &v25;
  v16 = v22;
  v19 = v16;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v21, v17);

  _Block_object_dispose(&v25, 8);
}

void __62__SMSafetyMonitorManager_sendSafetyCacheForSessionID_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = 134349056;
    v8 = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMSendSafetyCache", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__SMSafetyMonitorManager_sendSafetyCacheForSessionID_handler___block_invoke_340(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;

  v3 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __62__SMSafetyMonitorManager_sendSafetyCacheForSessionID_handler___block_invoke_2;
  v6[3] = &unk_25166E4D8;
  v5 = *(_OWORD *)(a1 + 40);
  v4 = (id)v5;
  v7 = v5;
  objc_msgSend(a2, "sendSafetyCacheForSessionID:handler:", v3, v6);

}

void __62__SMSafetyMonitorManager_sendSafetyCacheForSessionID_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = 134349056;
    v8 = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMSendSafetyCache", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startSessionWithConfiguration:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t *v22;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  os_signpost_id_t v29;
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  v29 = v10;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = v27[3];
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    objc_msgSend(v7, "description");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = objc_msgSend(v14, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v31 = v15;
    _os_signpost_emit_with_name_impl(&dword_245521000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SMStartSession", " enableTelemetry=YES {configuration:%{public,signpost.telemetry:string1}s}", buf, 0xCu);

  }
  v16 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __64__SMSafetyMonitorManager_startSessionWithConfiguration_handler___block_invoke;
  v23[3] = &unk_25166E4D8;
  v25 = &v26;
  v24 = v8;
  v19[0] = v16;
  v19[1] = 3221225472;
  v19[2] = __64__SMSafetyMonitorManager_startSessionWithConfiguration_handler___block_invoke_341;
  v19[3] = &unk_25166E720;
  v17 = v7;
  v20 = v17;
  v22 = &v26;
  v18 = v24;
  v21 = v18;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v23, v19);

  _Block_object_dispose(&v26, 8);
}

void __64__SMSafetyMonitorManager_startSessionWithConfiguration_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = 134349056;
    v8 = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMStartSession", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__SMSafetyMonitorManager_startSessionWithConfiguration_handler___block_invoke_341(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;

  v3 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __64__SMSafetyMonitorManager_startSessionWithConfiguration_handler___block_invoke_2;
  v6[3] = &unk_25166E4D8;
  v5 = *(_OWORD *)(a1 + 40);
  v4 = (id)v5;
  v7 = v5;
  objc_msgSend(a2, "startSessionWithConfiguration:handler:", v3, v6);

}

void __64__SMSafetyMonitorManager_startSessionWithConfiguration_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = 134349056;
    v8 = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMStartSession", " enableTelemetry=YES error:%{public,signpost.telemetry:number1}ld", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)initializeAndStartSessionWithConfiguration:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint8_t buf[16];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  os_signpost_id_t v28;

  v7 = a3;
  v8 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  v28 = v10;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = v26[3];
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_245521000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SMInitializeAndStartSession", " enableTelemetry=YES ", buf, 2u);
  }

  v14 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __77__SMSafetyMonitorManager_initializeAndStartSessionWithConfiguration_handler___block_invoke;
  v21[3] = &unk_25166E4D8;
  v23 = &v25;
  v22 = v8;
  v17[0] = v14;
  v17[1] = 3221225472;
  v17[2] = __77__SMSafetyMonitorManager_initializeAndStartSessionWithConfiguration_handler___block_invoke_342;
  v17[3] = &unk_25166E720;
  v15 = v7;
  v18 = v15;
  v20 = &v25;
  v16 = v22;
  v19 = v16;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v21, v17);

  _Block_object_dispose(&v25, 8);
}

void __77__SMSafetyMonitorManager_initializeAndStartSessionWithConfiguration_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = 134349056;
    v8 = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMInitializeAndStartSession", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__SMSafetyMonitorManager_initializeAndStartSessionWithConfiguration_handler___block_invoke_342(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;

  v3 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __77__SMSafetyMonitorManager_initializeAndStartSessionWithConfiguration_handler___block_invoke_2;
  v6[3] = &unk_25166E4D8;
  v5 = *(_OWORD *)(a1 + 40);
  v4 = (id)v5;
  v7 = v5;
  objc_msgSend(a2, "initializeAndStartSessionWithConfiguration:handler:", v3, v6);

}

void __77__SMSafetyMonitorManager_initializeAndStartSessionWithConfiguration_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = 134349056;
    v8 = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMInitializeAndStartSession", " enableTelemetry=YES error:%{public,signpost.telemetry:number1}ld", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)respondToTriggerPromptForSessionID:(id)a3 response:(int64_t)a4 handler:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  uint64_t v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t *v22;
  int64_t v23;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  os_signpost_id_t v30;
  uint8_t buf[4];
  int64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);

  v30 = v12;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = v28[3];
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 134349056;
    v32 = a4;
    _os_signpost_emit_with_name_impl(&dword_245521000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v15, "SMRespondToTriggerPrompt", " enableTelemetry=YES {response:%{public,signpost.telemetry:number1}ld}", buf, 0xCu);
  }

  v16 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __78__SMSafetyMonitorManager_respondToTriggerPromptForSessionID_response_handler___block_invoke;
  v24[3] = &unk_25166E4D8;
  v26 = &v27;
  v25 = v10;
  v19[0] = v16;
  v19[1] = 3221225472;
  v19[2] = __78__SMSafetyMonitorManager_respondToTriggerPromptForSessionID_response_handler___block_invoke_343;
  v19[3] = &unk_25166E578;
  v17 = v9;
  v22 = &v27;
  v23 = a4;
  v20 = v17;
  v18 = v25;
  v21 = v18;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v24, v19);

  _Block_object_dispose(&v27, 8);
}

void __78__SMSafetyMonitorManager_respondToTriggerPromptForSessionID_response_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = 134349056;
    v8 = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMRespondToTriggerPrompt", " enableTelemetry=YES {error:%{public,signpost.telemetry:number2}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __78__SMSafetyMonitorManager_respondToTriggerPromptForSessionID_response_handler___block_invoke_343(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  __int128 v6;
  _QWORD v7[4];
  __int128 v8;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 56);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __78__SMSafetyMonitorManager_respondToTriggerPromptForSessionID_response_handler___block_invoke_2;
  v7[3] = &unk_25166E4D8;
  v6 = *(_OWORD *)(a1 + 40);
  v5 = (id)v6;
  v8 = v6;
  objc_msgSend(a2, "respondToTriggerPromptForSessionID:response:handler:", v3, v4, v7);

}

void __78__SMSafetyMonitorManager_respondToTriggerPromptForSessionID_response_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = 134349056;
    v8 = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMRespondToTriggerPrompt", " enableTelemetry=YES {error:%{public,signpost.telemetry:number2}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)promptDestinationAnomalyVerificationWithContext:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t *v22;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  os_signpost_id_t v29;
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  v29 = v10;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = v27[3];
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    objc_msgSend(v7, "description");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = objc_msgSend(v14, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v31 = v15;
    _os_signpost_emit_with_name_impl(&dword_245521000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SMPromptDestinationAnomalyVerification", " enableTelemetry=YES {context:%{public,signpost.telemetry:string1}s}", buf, 0xCu);

  }
  v16 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __82__SMSafetyMonitorManager_promptDestinationAnomalyVerificationWithContext_handler___block_invoke;
  v23[3] = &unk_25166E4D8;
  v25 = &v26;
  v24 = v8;
  v19[0] = v16;
  v19[1] = 3221225472;
  v19[2] = __82__SMSafetyMonitorManager_promptDestinationAnomalyVerificationWithContext_handler___block_invoke_344;
  v19[3] = &unk_25166E720;
  v17 = v7;
  v20 = v17;
  v22 = &v26;
  v18 = v24;
  v21 = v18;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v23, v19);

  _Block_object_dispose(&v26, 8);
}

void __82__SMSafetyMonitorManager_promptDestinationAnomalyVerificationWithContext_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = 134349056;
    v8 = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMPromptDestinationAnomalyVerification", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __82__SMSafetyMonitorManager_promptDestinationAnomalyVerificationWithContext_handler___block_invoke_344(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;

  v3 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __82__SMSafetyMonitorManager_promptDestinationAnomalyVerificationWithContext_handler___block_invoke_2;
  v6[3] = &unk_25166E4D8;
  v5 = *(_OWORD *)(a1 + 40);
  v4 = (id)v5;
  v7 = v5;
  objc_msgSend(a2, "promptDestinationAnomalyVerificationWithContext:handler:", v3, v6);

}

void __82__SMSafetyMonitorManager_promptDestinationAnomalyVerificationWithContext_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = 134349056;
    v8 = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMPromptDestinationAnomalyVerification", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)promptRoundTripAnomalyVerificationWithContext:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __80__SMSafetyMonitorManager_promptRoundTripAnomalyVerificationWithContext_handler___block_invoke;
  v15[3] = &unk_25166E5A0;
  v16 = v8;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __80__SMSafetyMonitorManager_promptRoundTripAnomalyVerificationWithContext_handler___block_invoke_2;
  v12[3] = &unk_25166EA18;
  v13 = v7;
  v14 = v16;
  v10 = v16;
  v11 = v7;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v15, v12);

}

uint64_t __80__SMSafetyMonitorManager_promptRoundTripAnomalyVerificationWithContext_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __80__SMSafetyMonitorManager_promptRoundTripAnomalyVerificationWithContext_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __80__SMSafetyMonitorManager_promptRoundTripAnomalyVerificationWithContext_handler___block_invoke_3;
  v4[3] = &unk_25166E5A0;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "promptRoundTripAnomalyVerificationWithContext:handler:", v3, v4);

}

uint64_t __80__SMSafetyMonitorManager_promptRoundTripAnomalyVerificationWithContext_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)promptTimerEndedVerificationWithContext:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t *v22;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  os_signpost_id_t v29;
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  v29 = v10;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = v27[3];
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    objc_msgSend(v7, "description");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = objc_msgSend(v14, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v31 = v15;
    _os_signpost_emit_with_name_impl(&dword_245521000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SMPromptTimerEndedVerification", " enableTelemetry=YES {context:%{public,signpost.telemetry:string1}s}", buf, 0xCu);

  }
  v16 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __74__SMSafetyMonitorManager_promptTimerEndedVerificationWithContext_handler___block_invoke;
  v23[3] = &unk_25166E4D8;
  v25 = &v26;
  v24 = v8;
  v19[0] = v16;
  v19[1] = 3221225472;
  v19[2] = __74__SMSafetyMonitorManager_promptTimerEndedVerificationWithContext_handler___block_invoke_345;
  v19[3] = &unk_25166E720;
  v17 = v7;
  v20 = v17;
  v22 = &v26;
  v18 = v24;
  v21 = v18;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v23, v19);

  _Block_object_dispose(&v26, 8);
}

void __74__SMSafetyMonitorManager_promptTimerEndedVerificationWithContext_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = 134349056;
    v8 = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMPromptTimerEndedVerification", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__SMSafetyMonitorManager_promptTimerEndedVerificationWithContext_handler___block_invoke_345(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;

  v3 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __74__SMSafetyMonitorManager_promptTimerEndedVerificationWithContext_handler___block_invoke_2;
  v6[3] = &unk_25166E4D8;
  v5 = *(_OWORD *)(a1 + 40);
  v4 = (id)v5;
  v7 = v5;
  objc_msgSend(a2, "promptTimerEndedVerificationWithContext:handler:", v3, v6);

}

void __74__SMSafetyMonitorManager_promptTimerEndedVerificationWithContext_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = 134349056;
    v8 = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMPromptTimerEndedVerification", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)promptSafeArrivalWithContext:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __63__SMSafetyMonitorManager_promptSafeArrivalWithContext_handler___block_invoke;
  v15[3] = &unk_25166E5A0;
  v16 = v8;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __63__SMSafetyMonitorManager_promptSafeArrivalWithContext_handler___block_invoke_2;
  v12[3] = &unk_25166EA18;
  v13 = v7;
  v14 = v16;
  v10 = v16;
  v11 = v7;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v15, v12);

}

uint64_t __63__SMSafetyMonitorManager_promptSafeArrivalWithContext_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __63__SMSafetyMonitorManager_promptSafeArrivalWithContext_handler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "promptSafeArrivalWithContext:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)promptWorkoutAnomalyVerificationWithContext:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[SMSafetyMonitorManager promptWorkoutAnomalyVerificationWithContext:handler:]";
      v20 = 1024;
      v21 = 752;
      _os_log_error_impl(&dword_245521000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  v10 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __78__SMSafetyMonitorManager_promptWorkoutAnomalyVerificationWithContext_handler___block_invoke;
  v16[3] = &unk_25166E5A0;
  v17 = v8;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __78__SMSafetyMonitorManager_promptWorkoutAnomalyVerificationWithContext_handler___block_invoke_2;
  v13[3] = &unk_25166EA18;
  v14 = v7;
  v15 = v17;
  v11 = v17;
  v12 = v7;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v16, v13);

}

uint64_t __78__SMSafetyMonitorManager_promptWorkoutAnomalyVerificationWithContext_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __78__SMSafetyMonitorManager_promptWorkoutAnomalyVerificationWithContext_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __78__SMSafetyMonitorManager_promptWorkoutAnomalyVerificationWithContext_handler___block_invoke_3;
  v4[3] = &unk_25166E5A0;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "promptWorkoutAnomalyVerificationWithContext:handler:", v3, v4);

}

uint64_t __78__SMSafetyMonitorManager_promptWorkoutAnomalyVerificationWithContext_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sendHeartbeatForSessionID:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __60__SMSafetyMonitorManager_sendHeartbeatForSessionID_handler___block_invoke;
  v15[3] = &unk_25166E5A0;
  v16 = v8;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __60__SMSafetyMonitorManager_sendHeartbeatForSessionID_handler___block_invoke_2;
  v12[3] = &unk_25166EA18;
  v13 = v7;
  v14 = v16;
  v10 = v16;
  v11 = v7;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v15, v12);

}

uint64_t __60__SMSafetyMonitorManager_sendHeartbeatForSessionID_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60__SMSafetyMonitorManager_sendHeartbeatForSessionID_handler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sendHeartbeatForSessionID:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_startHeartbeatForSessionID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[SMSafetyMonitorManager heartbeatTimer](self, "heartbeatTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__SMSafetyMonitorManager__startHeartbeatForSessionID___block_invoke;
  v7[3] = &unk_25166E5C8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "startHeartbeatForSessionID:handler:", v6, v7);

}

void __54__SMSafetyMonitorManager__startHeartbeatForSessionID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[SMSafetyMonitorManager _startHeartbeatForSessionID:]_block_invoke";
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_245521000, v4, OS_LOG_TYPE_INFO, "%s, %@, error, %@", (uint8_t *)&v6, 0x20u);
  }

}

- (void)_stopHeartbeat
{
  id v2;

  -[SMSafetyMonitorManager heartbeatTimer](self, "heartbeatTimer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopHeartbeatWithHandler:", &__block_literal_global_346);

}

void __40__SMSafetyMonitorManager__stopHeartbeat__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "-[SMSafetyMonitorManager _stopHeartbeat]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_245521000, v3, OS_LOG_TYPE_INFO, "%s, error, %@", (uint8_t *)&v4, 0x16u);
  }

}

- (void)processStateForHeartbeat:(id)a3 forActiveDevice:(BOOL)a4 withError:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  SMSafetyMonitorManager *v16;
  BOOL v17;

  v8 = a3;
  v9 = a5;
  -[SMSafetyMonitorManager queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __77__SMSafetyMonitorManager_processStateForHeartbeat_forActiveDevice_withError___block_invoke;
  v13[3] = &unk_25166E630;
  v14 = v9;
  v15 = v8;
  v17 = a4;
  v16 = self;
  v11 = v8;
  v12 = v9;
  dispatch_async(v10, v13);

}

void __77__SMSafetyMonitorManager_processStateForHeartbeat_forActiveDevice_withError___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  id v6;

  if (!*(_QWORD *)(a1 + 32))
  {
    v2 = *(void **)(a1 + 40);
    if (v2)
    {
      if (*(_BYTE *)(a1 + 56))
      {
        v3 = objc_msgSend(v2, "sessionState");
        if (v3 <= 0xE)
        {
          if (((1 << v3) & 0x5397) != 0)
          {
            objc_msgSend(*(id *)(a1 + 48), "_stopHeartbeat");
          }
          else if (((1 << v3) & 0xC00) != 0)
          {
            v4 = *(void **)(a1 + 48);
            objc_msgSend(*(id *)(a1 + 40), "configuration");
            v6 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "sessionID");
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "_startHeartbeatForSessionID:", v5);

          }
        }
      }
    }
  }
}

- (void)fetchCurrentWorkoutSnapshotWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _BYTE *v17;
  _QWORD v18[4];
  id v19;
  _BYTE *v20;
  uint8_t buf[4];
  const char *v22;
  _BYTE v23[24];
  os_signpost_id_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v23 = 136315394;
      *(_QWORD *)&v23[4] = "-[SMSafetyMonitorManager fetchCurrentWorkoutSnapshotWithHandler:]";
      *(_WORD *)&v23[12] = 1024;
      *(_DWORD *)&v23[14] = 815;
      _os_log_error_impl(&dword_245521000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v23, 0x12u);
    }

  }
  *(_QWORD *)v23 = 0;
  *(_QWORD *)&v23[8] = v23;
  *(_QWORD *)&v23[16] = 0x2020000000;
  v24 = 0;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  v24 = v8;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = *(_QWORD *)(*(_QWORD *)&v23[8] + 24);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_245521000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SMFetchCurrentWorkoutSnapshot", " enableTelemetry=YES ", buf, 2u);
  }

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[SMSafetyMonitorManager fetchCurrentWorkoutSnapshotWithHandler:]";
    _os_log_impl(&dword_245521000, v12, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  v13 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __65__SMSafetyMonitorManager_fetchCurrentWorkoutSnapshotWithHandler___block_invoke;
  v18[3] = &unk_25166E4D8;
  v20 = v23;
  v19 = v5;
  v15[0] = v13;
  v15[1] = 3221225472;
  v15[2] = __65__SMSafetyMonitorManager_fetchCurrentWorkoutSnapshotWithHandler___block_invoke_347;
  v15[3] = &unk_25166E550;
  v17 = v23;
  v14 = v19;
  v16 = v14;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v18, v15);

  _Block_object_dispose(v23, 8);
}

void __65__SMSafetyMonitorManager_fetchCurrentWorkoutSnapshotWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v9 = 136315138;
    v10 = "-[SMSafetyMonitorManager fetchCurrentWorkoutSnapshotWithHandler:]_block_invoke";
    _os_log_impl(&dword_245521000, v4, OS_LOG_TYPE_INFO, "%s, erroring immediately", (uint8_t *)&v9, 0xCu);
  }

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v8 = objc_msgSend(v3, "code");
    v9 = 134349056;
    v10 = (const char *)v8;
    _os_signpost_emit_with_name_impl(&dword_245521000, v6, OS_SIGNPOST_INTERVAL_END, v7, "SMFetchCurrentWorkoutSnapshot", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v9, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__SMSafetyMonitorManager_fetchCurrentWorkoutSnapshotWithHandler___block_invoke_347(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __65__SMSafetyMonitorManager_fetchCurrentWorkoutSnapshotWithHandler___block_invoke_2;
  v5[3] = &unk_25166E658;
  v4 = *(_OWORD *)(a1 + 32);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(a2, "fetchCurrentWorkoutSnapshotWithHandler:", v5);

}

void __65__SMSafetyMonitorManager_fetchCurrentWorkoutSnapshotWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v10 = 134349056;
    v11 = objc_msgSend(v5, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SMFetchCurrentWorkoutSnapshot", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v10, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchSOSReceiversWithCompletion:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  id v15;
  SEL v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_245521000, v6, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,%@,fetching active session share recipients", buf, 0x16u);

  }
  v10 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __58__SMSafetyMonitorManager_fetchSOSReceiversWithCompletion___block_invoke;
  v14[3] = &unk_25166E8D8;
  v14[4] = self;
  v16 = a2;
  v15 = v5;
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __58__SMSafetyMonitorManager_fetchSOSReceiversWithCompletion___block_invoke_349;
  v12[3] = &unk_25166E680;
  v13 = v15;
  v11 = v15;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v14, v12);

}

void __58__SMSafetyMonitorManager_fetchSOSReceiversWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_error_impl(&dword_245521000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __58__SMSafetyMonitorManager_fetchSOSReceiversWithCompletion___block_invoke_349(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fetchSOSReceiversWithCompletion:", *(_QWORD *)(a1 + 32));
}

- (void)fetchInitiatorSafetyCacheForSessionID:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  SEL v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v24 = v7;
    v25 = 2112;
    v26 = v11;
    v27 = 2112;
    v28 = v12;
    _os_log_impl(&dword_245521000, v9, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetching initiator safety cache", buf, 0x20u);

  }
  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __75__SMSafetyMonitorManager_fetchInitiatorSafetyCacheForSessionID_completion___block_invoke;
  v19[3] = &unk_25166E6A8;
  v19[4] = self;
  v22 = a2;
  v21 = v8;
  v20 = v7;
  v16[0] = v13;
  v16[1] = 3221225472;
  v16[2] = __75__SMSafetyMonitorManager_fetchInitiatorSafetyCacheForSessionID_completion___block_invoke_350;
  v16[3] = &unk_25166EA18;
  v17 = v20;
  v18 = v21;
  v14 = v21;
  v15 = v20;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v19, v16);

}

void __75__SMSafetyMonitorManager_fetchInitiatorSafetyCacheForSessionID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_error_impl(&dword_245521000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __75__SMSafetyMonitorManager_fetchInitiatorSafetyCacheForSessionID_completion___block_invoke_350(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fetchInitiatorSafetyCacheForSessionID:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)startMonitoringSessionStateWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _BYTE *v17;
  _QWORD v18[5];
  id v19;
  _BYTE *v20;
  uint8_t buf[4];
  const char *v22;
  _BYTE v23[24];
  os_signpost_id_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v23 = 136315394;
      *(_QWORD *)&v23[4] = "-[SMSafetyMonitorManager startMonitoringSessionStateWithHandler:]";
      *(_WORD *)&v23[12] = 1024;
      *(_DWORD *)&v23[14] = 867;
      _os_log_error_impl(&dword_245521000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v23, 0x12u);
    }

  }
  *(_QWORD *)v23 = 0;
  *(_QWORD *)&v23[8] = v23;
  *(_QWORD *)&v23[16] = 0x2020000000;
  v24 = 0;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  v24 = v8;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = *(_QWORD *)(*(_QWORD *)&v23[8] + 24);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_245521000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SMStartMonitoringSession", " enableTelemetry=YES ", buf, 2u);
  }

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[SMSafetyMonitorManager startMonitoringSessionStateWithHandler:]";
    _os_log_impl(&dword_245521000, v12, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  -[SMSafetyMonitorManager setSessionStateHandler:](self, "setSessionStateHandler:", v5);
  v13 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __65__SMSafetyMonitorManager_startMonitoringSessionStateWithHandler___block_invoke;
  v18[3] = &unk_25166E6D0;
  v20 = v23;
  v18[4] = self;
  v19 = v5;
  v15[0] = v13;
  v15[1] = 3221225472;
  v15[2] = __65__SMSafetyMonitorManager_startMonitoringSessionStateWithHandler___block_invoke_351;
  v15[3] = &unk_25166E720;
  v17 = v23;
  v14 = v19;
  v15[4] = self;
  v16 = v14;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v18, v15);

  _Block_object_dispose(v23, 8);
}

void __65__SMSafetyMonitorManager_startMonitoringSessionStateWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      v7 = 134349056;
      v8 = objc_msgSend(v3, "code");
      _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMStartMonitoringSession", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "setSessionStateHandler:", 0);
  }

}

void __65__SMSafetyMonitorManager_startMonitoringSessionStateWithHandler___block_invoke_351(uint64_t a1, void *a2)
{
  id v4;
  __int128 v5;
  _QWORD v6[5];
  __int128 v7;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __65__SMSafetyMonitorManager_startMonitoringSessionStateWithHandler___block_invoke_2;
  v6[3] = &unk_25166E6F8;
  v5 = *(_OWORD *)(a1 + 40);
  v4 = (id)v5;
  v7 = v5;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "startMonitoringSessionStateWithHandler:", v6);

}

void __65__SMSafetyMonitorManager_startMonitoringSessionStateWithHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  id v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    +[SMSessionManagerState convertSessionStateToString:](SMSessionManagerState, "convertSessionStateToString:", objc_msgSend(v6, "sessionState"));
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = 136446466;
    v13 = objc_msgSend(v11, "UTF8String");
    v14 = 2050;
    v15 = objc_msgSend(v7, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v9, OS_SIGNPOST_INTERVAL_END, v10, "SMStartMonitoringSession", " enableTelemetry=YES {state:%{public,signpost.telemetry:string1}s, error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v12, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "setSessionStateHandler:", 0);

}

- (void)stopMonitoringSessionStateWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _BYTE *v17;
  _QWORD v18[4];
  id v19;
  _BYTE *v20;
  uint8_t buf[4];
  const char *v22;
  _BYTE v23[24];
  os_signpost_id_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v23 = 136315394;
      *(_QWORD *)&v23[4] = "-[SMSafetyMonitorManager stopMonitoringSessionStateWithHandler:]";
      *(_WORD *)&v23[12] = 1024;
      *(_DWORD *)&v23[14] = 892;
      _os_log_error_impl(&dword_245521000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v23, 0x12u);
    }

  }
  *(_QWORD *)v23 = 0;
  *(_QWORD *)&v23[8] = v23;
  *(_QWORD *)&v23[16] = 0x2020000000;
  v24 = 0;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  v24 = v8;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = *(_QWORD *)(*(_QWORD *)&v23[8] + 24);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_245521000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SMStopMonitoringSession", " enableTelemetry=YES ", buf, 2u);
  }

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[SMSafetyMonitorManager stopMonitoringSessionStateWithHandler:]";
    _os_log_impl(&dword_245521000, v12, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  -[SMSafetyMonitorManager setSessionStateHandler:](self, "setSessionStateHandler:", 0);
  v13 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __64__SMSafetyMonitorManager_stopMonitoringSessionStateWithHandler___block_invoke;
  v18[3] = &unk_25166E4D8;
  v20 = v23;
  v19 = v5;
  v15[0] = v13;
  v15[1] = 3221225472;
  v15[2] = __64__SMSafetyMonitorManager_stopMonitoringSessionStateWithHandler___block_invoke_353;
  v15[3] = &unk_25166E550;
  v17 = v23;
  v14 = v19;
  v16 = v14;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v18, v15);

  _Block_object_dispose(v23, 8);
}

void __64__SMSafetyMonitorManager_stopMonitoringSessionStateWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = 134349056;
    v8 = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMStopMonitoringSession", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__SMSafetyMonitorManager_stopMonitoringSessionStateWithHandler___block_invoke_353(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __64__SMSafetyMonitorManager_stopMonitoringSessionStateWithHandler___block_invoke_2;
  v5[3] = &unk_25166E4D8;
  v4 = *(_OWORD *)(a1 + 32);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(a2, "stopMonitoringSessionStateWithHandler:", v5);

}

void __64__SMSafetyMonitorManager_stopMonitoringSessionStateWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = 134349056;
    v8 = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMStopMonitoringSession", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchCurrentSessionStateWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _BYTE *v16;
  _QWORD v17[4];
  id v18;
  _BYTE *v19;
  uint8_t buf[16];
  _BYTE v21[24];
  os_signpost_id_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v21 = 136315394;
      *(_QWORD *)&v21[4] = "-[SMSafetyMonitorManager fetchCurrentSessionStateWithHandler:]";
      *(_WORD *)&v21[12] = 1024;
      *(_DWORD *)&v21[14] = 911;
      _os_log_error_impl(&dword_245521000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v21, 0x12u);
    }

  }
  *(_QWORD *)v21 = 0;
  *(_QWORD *)&v21[8] = v21;
  *(_QWORD *)&v21[16] = 0x2020000000;
  v22 = 0;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  v22 = v8;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = *(_QWORD *)(*(_QWORD *)&v21[8] + 24);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_245521000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SMFetchCurrentSessionState", " enableTelemetry=YES ", buf, 2u);
  }

  v12 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __62__SMSafetyMonitorManager_fetchCurrentSessionStateWithHandler___block_invoke;
  v17[3] = &unk_25166E4D8;
  v19 = v21;
  v18 = v5;
  v14[0] = v12;
  v14[1] = 3221225472;
  v14[2] = __62__SMSafetyMonitorManager_fetchCurrentSessionStateWithHandler___block_invoke_354;
  v14[3] = &unk_25166E550;
  v16 = v21;
  v13 = v18;
  v15 = v13;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v17, v14);

  _Block_object_dispose(v21, 8);
}

void __62__SMSafetyMonitorManager_fetchCurrentSessionStateWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = 134349056;
    v8 = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMFetchCurrentSessionState", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__SMSafetyMonitorManager_fetchCurrentSessionStateWithHandler___block_invoke_354(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __62__SMSafetyMonitorManager_fetchCurrentSessionStateWithHandler___block_invoke_2;
  v5[3] = &unk_25166E748;
  v4 = *(_OWORD *)(a1 + 32);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(a2, "fetchCurrentSessionStateWithHandler:", v5);

}

void __62__SMSafetyMonitorManager_fetchCurrentSessionStateWithHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  id v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    +[SMSessionManagerState convertSessionStateToString:](SMSessionManagerState, "convertSessionStateToString:", objc_msgSend(v6, "sessionState"));
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = 136446466;
    v13 = objc_msgSend(v11, "UTF8String");
    v14 = 2050;
    v15 = objc_msgSend(v7, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v9, OS_SIGNPOST_INTERVAL_END, v10, "SMFetchCurrentSessionState", " enableTelemetry=YES {state:%{public,signpost.telemetry:string1}s, error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v12, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)onSessionStateChanged:(id)a3 forActiveDevice:(BOOL)a4 withError:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v11;
  id v12;

  v6 = a4;
  v12 = a3;
  v8 = a5;
  -[SMSafetyMonitorManager sessionStateHandler](self, "sessionStateHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SMSafetyMonitorManager sessionStateHandler](self, "sessionStateHandler");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _BOOL8, id))v10)[2](v10, v12, v6, v8);

  }
  -[SMSafetyMonitorManager heartbeatTimer](self, "heartbeatTimer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    -[SMSafetyMonitorManager processStateForHeartbeat:forActiveDevice:withError:](self, "processStateForHeartbeat:forActiveDevice:withError:", v12, v6, v8);

}

- (void)fetchCurrentLocalSessionStateWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _BYTE *v16;
  _QWORD v17[4];
  id v18;
  _BYTE *v19;
  uint8_t buf[16];
  _BYTE v21[24];
  os_signpost_id_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v21 = 136315394;
      *(_QWORD *)&v21[4] = "-[SMSafetyMonitorManager fetchCurrentLocalSessionStateWithHandler:]";
      *(_WORD *)&v21[12] = 1024;
      *(_DWORD *)&v21[14] = 938;
      _os_log_error_impl(&dword_245521000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v21, 0x12u);
    }

  }
  *(_QWORD *)v21 = 0;
  *(_QWORD *)&v21[8] = v21;
  *(_QWORD *)&v21[16] = 0x2020000000;
  v22 = 0;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  v22 = v8;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = *(_QWORD *)(*(_QWORD *)&v21[8] + 24);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_245521000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SMFetchCurrentLocalSessionState", " enableTelemetry=YES ", buf, 2u);
  }

  v12 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __67__SMSafetyMonitorManager_fetchCurrentLocalSessionStateWithHandler___block_invoke;
  v17[3] = &unk_25166E4D8;
  v19 = v21;
  v18 = v5;
  v14[0] = v12;
  v14[1] = 3221225472;
  v14[2] = __67__SMSafetyMonitorManager_fetchCurrentLocalSessionStateWithHandler___block_invoke_355;
  v14[3] = &unk_25166E550;
  v16 = v21;
  v13 = v18;
  v15 = v13;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v17, v14);

  _Block_object_dispose(v21, 8);
}

void __67__SMSafetyMonitorManager_fetchCurrentLocalSessionStateWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = 134349056;
    v8 = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMFetchCurrentLocalSessionState", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__SMSafetyMonitorManager_fetchCurrentLocalSessionStateWithHandler___block_invoke_355(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __67__SMSafetyMonitorManager_fetchCurrentLocalSessionStateWithHandler___block_invoke_2;
  v5[3] = &unk_25166E770;
  v4 = *(_OWORD *)(a1 + 32);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(a2, "fetchCurrentLocalSessionStateWithHandler:", v5);

}

void __67__SMSafetyMonitorManager_fetchCurrentLocalSessionStateWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  id v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    objc_msgSend(v5, "description");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = 136446466;
    v12 = objc_msgSend(v10, "UTF8String");
    v13 = 2050;
    v14 = objc_msgSend(v6, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SMFetchCurrentLocalSessionState", " enableTelemetry=YES {state:%{public,signpost.telemetry:string1}s, error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v11, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)startMonitoringLocalSessionStateWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _BYTE *v17;
  _QWORD v18[5];
  id v19;
  _BYTE *v20;
  uint8_t buf[4];
  const char *v22;
  _BYTE v23[24];
  os_signpost_id_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v23 = 136315394;
      *(_QWORD *)&v23[4] = "-[SMSafetyMonitorManager startMonitoringLocalSessionStateWithHandler:]";
      *(_WORD *)&v23[12] = 1024;
      *(_DWORD *)&v23[14] = 954;
      _os_log_error_impl(&dword_245521000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v23, 0x12u);
    }

  }
  *(_QWORD *)v23 = 0;
  *(_QWORD *)&v23[8] = v23;
  *(_QWORD *)&v23[16] = 0x2020000000;
  v24 = 0;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  v24 = v8;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = *(_QWORD *)(*(_QWORD *)&v23[8] + 24);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_245521000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SMStartLocalSessionStateMonitoring", " enableTelemetry=YES ", buf, 2u);
  }

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[SMSafetyMonitorManager startMonitoringLocalSessionStateWithHandler:]";
    _os_log_impl(&dword_245521000, v12, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  -[SMSafetyMonitorManager setLocalSessionStateHandler:](self, "setLocalSessionStateHandler:", v5);
  v13 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __70__SMSafetyMonitorManager_startMonitoringLocalSessionStateWithHandler___block_invoke;
  v18[3] = &unk_25166E6D0;
  v20 = v23;
  v18[4] = self;
  v19 = v5;
  v15[0] = v13;
  v15[1] = 3221225472;
  v15[2] = __70__SMSafetyMonitorManager_startMonitoringLocalSessionStateWithHandler___block_invoke_357;
  v15[3] = &unk_25166E720;
  v17 = v23;
  v14 = v19;
  v15[4] = self;
  v16 = v14;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v18, v15);

  _Block_object_dispose(v23, 8);
}

void __70__SMSafetyMonitorManager_startMonitoringLocalSessionStateWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      v7 = 134349056;
      v8 = objc_msgSend(v3, "code");
      _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMStartLocalSessionStateMonitoring", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "setLocalSessionStateHandler:", 0);
  }

}

void __70__SMSafetyMonitorManager_startMonitoringLocalSessionStateWithHandler___block_invoke_357(uint64_t a1, void *a2)
{
  id v4;
  __int128 v5;
  _QWORD v6[5];
  __int128 v7;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__SMSafetyMonitorManager_startMonitoringLocalSessionStateWithHandler___block_invoke_2;
  v6[3] = &unk_25166E798;
  v5 = *(_OWORD *)(a1 + 40);
  v4 = (id)v5;
  v7 = v5;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "startMonitoringLocalSessionStateWithHandler:", v6);

}

void __70__SMSafetyMonitorManager_startMonitoringLocalSessionStateWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  id v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    objc_msgSend(v5, "description");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = 136446466;
    v12 = objc_msgSend(v10, "UTF8String");
    v13 = 2050;
    v14 = objc_msgSend(v6, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SMStartLocalSessionStateMonitoring", " enableTelemetry=YES {state:%{public,signpost.telemetry:string1}s, error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v11, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "setLocalSessionStateHandler:", 0);

}

- (void)stopMonitoringLocalSessionStateWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _BYTE *v17;
  _QWORD v18[4];
  id v19;
  _BYTE *v20;
  uint8_t buf[4];
  const char *v22;
  _BYTE v23[24];
  os_signpost_id_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v23 = 136315394;
      *(_QWORD *)&v23[4] = "-[SMSafetyMonitorManager stopMonitoringLocalSessionStateWithHandler:]";
      *(_WORD *)&v23[12] = 1024;
      *(_DWORD *)&v23[14] = 978;
      _os_log_error_impl(&dword_245521000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v23, 0x12u);
    }

  }
  *(_QWORD *)v23 = 0;
  *(_QWORD *)&v23[8] = v23;
  *(_QWORD *)&v23[16] = 0x2020000000;
  v24 = 0;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  v24 = v8;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = *(_QWORD *)(*(_QWORD *)&v23[8] + 24);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_245521000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SMStopLocalSessionStateMonitoring", " enableTelemetry=YES ", buf, 2u);
  }

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[SMSafetyMonitorManager stopMonitoringLocalSessionStateWithHandler:]";
    _os_log_impl(&dword_245521000, v12, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  -[SMSafetyMonitorManager setLocalSessionStateHandler:](self, "setLocalSessionStateHandler:", 0);
  v13 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __69__SMSafetyMonitorManager_stopMonitoringLocalSessionStateWithHandler___block_invoke;
  v18[3] = &unk_25166E4D8;
  v20 = v23;
  v19 = v5;
  v15[0] = v13;
  v15[1] = 3221225472;
  v15[2] = __69__SMSafetyMonitorManager_stopMonitoringLocalSessionStateWithHandler___block_invoke_358;
  v15[3] = &unk_25166E550;
  v17 = v23;
  v14 = v19;
  v16 = v14;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v18, v15);

  _Block_object_dispose(v23, 8);
}

void __69__SMSafetyMonitorManager_stopMonitoringLocalSessionStateWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = 134349056;
    v8 = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMStopLocalSessionStateMonitoring", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __69__SMSafetyMonitorManager_stopMonitoringLocalSessionStateWithHandler___block_invoke_358(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __69__SMSafetyMonitorManager_stopMonitoringLocalSessionStateWithHandler___block_invoke_2;
  v5[3] = &unk_25166E4D8;
  v4 = *(_OWORD *)(a1 + 32);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(a2, "stopMonitoringSessionStateWithHandler:", v5);

}

void __69__SMSafetyMonitorManager_stopMonitoringLocalSessionStateWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = 134349056;
    v8 = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMStopLocalSessionStateMonitoring", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)onLocalSessionStateChanged:(id)a3 withError:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[SMSafetyMonitorManager localSessionStateHandler](self, "localSessionStateHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SMSafetyMonitorManager localSessionStateHandler](self, "localSessionStateHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
}

- (void)fetchSuggestionsWithOptions:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  -[SMSafetyMonitorManager queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62__SMSafetyMonitorManager_fetchSuggestionsWithOptions_handler___block_invoke;
  v12[3] = &unk_25166E7C0;
  v14 = v8;
  v15 = a2;
  v12[4] = self;
  v13 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, v12);

}

void __62__SMSafetyMonitorManager_fetchSuggestionsWithOptions_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __62__SMSafetyMonitorManager_fetchSuggestionsWithOptions_handler___block_invoke_2;
  v5[3] = &unk_25166E5A0;
  v3 = *(_QWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_proxyForServicingSelector:withErrorHandler:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchSuggestionsWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __62__SMSafetyMonitorManager_fetchSuggestionsWithOptions_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchSuggestionsCountWithOptions:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  -[SMSafetyMonitorManager queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __67__SMSafetyMonitorManager_fetchSuggestionsCountWithOptions_handler___block_invoke;
  v12[3] = &unk_25166E7C0;
  v14 = v8;
  v15 = a2;
  v12[4] = self;
  v13 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, v12);

}

void __67__SMSafetyMonitorManager_fetchSuggestionsCountWithOptions_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __67__SMSafetyMonitorManager_fetchSuggestionsCountWithOptions_handler___block_invoke_2;
  v5[3] = &unk_25166E5A0;
  v3 = *(_QWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_proxyForServicingSelector:withErrorHandler:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchSuggestionsCountWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __67__SMSafetyMonitorManager_fetchSuggestionsCountWithOptions_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)clearSuggestionsWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  -[SMSafetyMonitorManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__SMSafetyMonitorManager_clearSuggestionsWithHandler___block_invoke;
  block[3] = &unk_25166E7E8;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(v6, block);

}

void __54__SMSafetyMonitorManager_clearSuggestionsWithHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_proxyForServicingSelector:withErrorHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearSuggestionsWithHandler:", *(_QWORD *)(a1 + 40));

}

- (void)storeSuggestions:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  -[SMSafetyMonitorManager queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __51__SMSafetyMonitorManager_storeSuggestions_handler___block_invoke;
  v12[3] = &unk_25166E7C0;
  v14 = v8;
  v15 = a2;
  v12[4] = self;
  v13 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, v12);

}

void __51__SMSafetyMonitorManager_storeSuggestions_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__SMSafetyMonitorManager_storeSuggestions_handler___block_invoke_2;
  v5[3] = &unk_25166E5A0;
  v3 = *(_QWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_proxyForServicingSelector:withErrorHandler:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storeSuggestions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __51__SMSafetyMonitorManager_storeSuggestions_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)storeSessionManagerStates:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  -[SMSafetyMonitorManager queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60__SMSafetyMonitorManager_storeSessionManagerStates_handler___block_invoke;
  v12[3] = &unk_25166E7C0;
  v14 = v8;
  v15 = a2;
  v12[4] = self;
  v13 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, v12);

}

void __60__SMSafetyMonitorManager_storeSessionManagerStates_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __60__SMSafetyMonitorManager_storeSessionManagerStates_handler___block_invoke_2;
  v5[3] = &unk_25166E5A0;
  v3 = *(_QWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_proxyForServicingSelector:withErrorHandler:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storeSessionManagerStates:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __60__SMSafetyMonitorManager_storeSessionManagerStates_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)storeSessionMonitorStates:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  -[SMSafetyMonitorManager queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60__SMSafetyMonitorManager_storeSessionMonitorStates_handler___block_invoke;
  v12[3] = &unk_25166E7C0;
  v14 = v8;
  v15 = a2;
  v12[4] = self;
  v13 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, v12);

}

void __60__SMSafetyMonitorManager_storeSessionMonitorStates_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __60__SMSafetyMonitorManager_storeSessionMonitorStates_handler___block_invoke_2;
  v5[3] = &unk_25166E5A0;
  v3 = *(_QWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_proxyForServicingSelector:withErrorHandler:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storeSessionMonitorStates:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __60__SMSafetyMonitorManager_storeSessionMonitorStates_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)storeSessionConfigurations:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  -[SMSafetyMonitorManager queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __61__SMSafetyMonitorManager_storeSessionConfigurations_handler___block_invoke;
  v12[3] = &unk_25166E7C0;
  v14 = v8;
  v15 = a2;
  v12[4] = self;
  v13 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, v12);

}

void __61__SMSafetyMonitorManager_storeSessionConfigurations_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __61__SMSafetyMonitorManager_storeSessionConfigurations_handler___block_invoke_2;
  v5[3] = &unk_25166E5A0;
  v3 = *(_QWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_proxyForServicingSelector:withErrorHandler:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storeSessionConfigurations:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __61__SMSafetyMonitorManager_storeSessionConfigurations_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)storeTriggerDestinationStates:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  -[SMSafetyMonitorManager queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __64__SMSafetyMonitorManager_storeTriggerDestinationStates_handler___block_invoke;
  v12[3] = &unk_25166E7C0;
  v14 = v8;
  v15 = a2;
  v12[4] = self;
  v13 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, v12);

}

void __64__SMSafetyMonitorManager_storeTriggerDestinationStates_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __64__SMSafetyMonitorManager_storeTriggerDestinationStates_handler___block_invoke_2;
  v5[3] = &unk_25166E5A0;
  v3 = *(_QWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_proxyForServicingSelector:withErrorHandler:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storeTriggerDestinationStates:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __64__SMSafetyMonitorManager_storeTriggerDestinationStates_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchSessionManagerStatesWithOptions:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  -[SMSafetyMonitorManager queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __71__SMSafetyMonitorManager_fetchSessionManagerStatesWithOptions_handler___block_invoke;
  v12[3] = &unk_25166E7C0;
  v14 = v8;
  v15 = a2;
  v12[4] = self;
  v13 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, v12);

}

void __71__SMSafetyMonitorManager_fetchSessionManagerStatesWithOptions_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __71__SMSafetyMonitorManager_fetchSessionManagerStatesWithOptions_handler___block_invoke_2;
  v5[3] = &unk_25166E5A0;
  v3 = *(_QWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_proxyForServicingSelector:withErrorHandler:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchSessionManagerStatesWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __71__SMSafetyMonitorManager_fetchSessionManagerStatesWithOptions_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchMostRecentSessionMonitorStateWithSessionID:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  -[SMSafetyMonitorManager queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __82__SMSafetyMonitorManager_fetchMostRecentSessionMonitorStateWithSessionID_handler___block_invoke;
  v12[3] = &unk_25166E7C0;
  v14 = v8;
  v15 = a2;
  v12[4] = self;
  v13 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, v12);

}

void __82__SMSafetyMonitorManager_fetchMostRecentSessionMonitorStateWithSessionID_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __82__SMSafetyMonitorManager_fetchMostRecentSessionMonitorStateWithSessionID_handler___block_invoke_2;
  v5[3] = &unk_25166E5A0;
  v3 = *(_QWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_proxyForServicingSelector:withErrorHandler:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchMostRecentSessionMonitorStateWithSessionID:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __82__SMSafetyMonitorManager_fetchMostRecentSessionMonitorStateWithSessionID_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchSessionConfigurationsWithOptions:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  -[SMSafetyMonitorManager queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __72__SMSafetyMonitorManager_fetchSessionConfigurationsWithOptions_handler___block_invoke;
  v12[3] = &unk_25166E7C0;
  v14 = v8;
  v15 = a2;
  v12[4] = self;
  v13 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, v12);

}

void __72__SMSafetyMonitorManager_fetchSessionConfigurationsWithOptions_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __72__SMSafetyMonitorManager_fetchSessionConfigurationsWithOptions_handler___block_invoke_2;
  v5[3] = &unk_25166E5A0;
  v3 = *(_QWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_proxyForServicingSelector:withErrorHandler:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchSessionConfigurationsWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __72__SMSafetyMonitorManager_fetchSessionConfigurationsWithOptions_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)clearSessionsWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  -[SMSafetyMonitorManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__SMSafetyMonitorManager_clearSessionsWithHandler___block_invoke;
  block[3] = &unk_25166E7E8;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(v6, block);

}

void __51__SMSafetyMonitorManager_clearSessionsWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__SMSafetyMonitorManager_clearSessionsWithHandler___block_invoke_2;
  v5[3] = &unk_25166E5A0;
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_proxyForServicingSelector:withErrorHandler:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearSessionsWithHandler:", *(_QWORD *)(a1 + 40));

}

uint64_t __51__SMSafetyMonitorManager_clearSessionsWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)clearSessionMonitorStatesWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  -[SMSafetyMonitorManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__SMSafetyMonitorManager_clearSessionMonitorStatesWithHandler___block_invoke;
  block[3] = &unk_25166E7E8;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(v6, block);

}

void __63__SMSafetyMonitorManager_clearSessionMonitorStatesWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __63__SMSafetyMonitorManager_clearSessionMonitorStatesWithHandler___block_invoke_2;
  v5[3] = &unk_25166E5A0;
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_proxyForServicingSelector:withErrorHandler:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearSessionMonitorStatesWithHandler:", *(_QWORD *)(a1 + 40));

}

uint64_t __63__SMSafetyMonitorManager_clearSessionMonitorStatesWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)clearTriggerDestinationStatesWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  -[SMSafetyMonitorManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__SMSafetyMonitorManager_clearTriggerDestinationStatesWithHandler___block_invoke;
  block[3] = &unk_25166E7E8;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(v6, block);

}

void __67__SMSafetyMonitorManager_clearTriggerDestinationStatesWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __67__SMSafetyMonitorManager_clearTriggerDestinationStatesWithHandler___block_invoke_2;
  v5[3] = &unk_25166E5A0;
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_proxyForServicingSelector:withErrorHandler:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearTriggerDestinationStatesWithHandler:", *(_QWORD *)(a1 + 40));

}

uint64_t __67__SMSafetyMonitorManager_clearTriggerDestinationStatesWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchTriggerDestinationStateWithSessionID:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  -[SMSafetyMonitorManager queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __76__SMSafetyMonitorManager_fetchTriggerDestinationStateWithSessionID_handler___block_invoke;
  v12[3] = &unk_25166E7C0;
  v14 = v8;
  v15 = a2;
  v12[4] = self;
  v13 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, v12);

}

void __76__SMSafetyMonitorManager_fetchTriggerDestinationStateWithSessionID_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __76__SMSafetyMonitorManager_fetchTriggerDestinationStateWithSessionID_handler___block_invoke_2;
  v5[3] = &unk_25166E5A0;
  v3 = *(_QWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_proxyForServicingSelector:withErrorHandler:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchTriggerDestinationStateWithSessionID:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __76__SMSafetyMonitorManager_fetchTriggerDestinationStateWithSessionID_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)runProactiveSuggestionsEngineWithContext:(id)a3 shouldStoreSuggestions:(BOOL)a4 handler:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  BOOL v17;
  _QWORD v18[4];
  id v19;

  v9 = a3;
  v10 = a5;
  v11 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __98__SMSafetyMonitorManager_runProactiveSuggestionsEngineWithContext_shouldStoreSuggestions_handler___block_invoke;
  v18[3] = &unk_25166E5A0;
  v19 = v10;
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __98__SMSafetyMonitorManager_runProactiveSuggestionsEngineWithContext_shouldStoreSuggestions_handler___block_invoke_2;
  v14[3] = &unk_25166E810;
  v17 = a4;
  v15 = v9;
  v16 = v19;
  v12 = v19;
  v13 = v9;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v18, v14);

}

uint64_t __98__SMSafetyMonitorManager_runProactiveSuggestionsEngineWithContext_shouldStoreSuggestions_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __98__SMSafetyMonitorManager_runProactiveSuggestionsEngineWithContext_shouldStoreSuggestions_handler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "runProactiveSuggestionsEngineWithContext:shouldStoreSuggestions:handler:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)fetchSuggestedSessionConfigurationWithHandler:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __72__SMSafetyMonitorManager_fetchSuggestedSessionConfigurationWithHandler___block_invoke;
  v10[3] = &unk_25166E5A0;
  v11 = v5;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __72__SMSafetyMonitorManager_fetchSuggestedSessionConfigurationWithHandler___block_invoke_2;
  v8[3] = &unk_25166E680;
  v9 = v11;
  v7 = v11;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v10, v8);

}

uint64_t __72__SMSafetyMonitorManager_fetchSuggestedSessionConfigurationWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72__SMSafetyMonitorManager_fetchSuggestedSessionConfigurationWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fetchSuggestedSessionConfigurationWithHandler:", *(_QWORD *)(a1 + 32));
}

- (void)fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __82__SMSafetyMonitorManager_fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler___block_invoke;
  v10[3] = &unk_25166E5A0;
  v11 = v5;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __82__SMSafetyMonitorManager_fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler___block_invoke_2;
  v8[3] = &unk_25166E680;
  v9 = v11;
  v7 = v11;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v10, v8);

}

uint64_t __82__SMSafetyMonitorManager_fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __82__SMSafetyMonitorManager_fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fetchSuggestedCheckInURLForWorkoutSuggestionWithHandler:", *(_QWORD *)(a1 + 32));
}

- (void)launchSessionInitiationUIWithConfiguration:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __77__SMSafetyMonitorManager_launchSessionInitiationUIWithConfiguration_handler___block_invoke;
  v11[3] = &unk_25166EA18;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v9, v11);

}

uint64_t __77__SMSafetyMonitorManager_launchSessionInitiationUIWithConfiguration_handler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "launchSessionInitiationUIWithConfiguration:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)fetchMostLikelyReceiverHandlesWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _BYTE *v17;
  _QWORD v18[4];
  id v19;
  _BYTE *v20;
  uint8_t buf[4];
  const char *v22;
  _BYTE v23[24];
  os_signpost_id_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v23 = 136315394;
      *(_QWORD *)&v23[4] = "-[SMSafetyMonitorManager fetchMostLikelyReceiverHandlesWithHandler:]";
      *(_WORD *)&v23[12] = 1024;
      *(_DWORD *)&v23[14] = 1187;
      _os_log_error_impl(&dword_245521000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v23, 0x12u);
    }

  }
  *(_QWORD *)v23 = 0;
  *(_QWORD *)&v23[8] = v23;
  *(_QWORD *)&v23[16] = 0x2020000000;
  v24 = 0;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  v24 = v8;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = *(_QWORD *)(*(_QWORD *)&v23[8] + 24);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_245521000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SMFetchMostLikelyReceiverHandles", " enableTelemetry=YES ", buf, 2u);
  }

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[SMSafetyMonitorManager fetchMostLikelyReceiverHandlesWithHandler:]";
    _os_log_impl(&dword_245521000, v12, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  v13 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __68__SMSafetyMonitorManager_fetchMostLikelyReceiverHandlesWithHandler___block_invoke;
  v18[3] = &unk_25166E4D8;
  v20 = v23;
  v19 = v5;
  v15[0] = v13;
  v15[1] = 3221225472;
  v15[2] = __68__SMSafetyMonitorManager_fetchMostLikelyReceiverHandlesWithHandler___block_invoke_359;
  v15[3] = &unk_25166E550;
  v17 = v23;
  v14 = v19;
  v16 = v14;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v18, v15);

  _Block_object_dispose(v23, 8);
}

void __68__SMSafetyMonitorManager_fetchMostLikelyReceiverHandlesWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = 134349056;
    v8 = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMFetchMostLikelyReceiverHandles", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __68__SMSafetyMonitorManager_fetchMostLikelyReceiverHandlesWithHandler___block_invoke_359(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __68__SMSafetyMonitorManager_fetchMostLikelyReceiverHandlesWithHandler___block_invoke_2;
  v5[3] = &unk_25166E838;
  v4 = *(_OWORD *)(a1 + 32);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(a2, "fetchMostLikelyReceiverHandlesWithHandler:", v5);

}

void __68__SMSafetyMonitorManager_fetchMostLikelyReceiverHandlesWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v10 = 134349056;
    v11 = objc_msgSend(v5, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SMFetchMostLikelyReceiverHandles", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v10, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchNumFavoriteRecipientsWithReceiverHandles:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[SMSafetyMonitorManager fetchNumFavoriteRecipientsWithReceiverHandles:handler:]";
    v22 = 1024;
    v23 = 1206;
    _os_log_error_impl(&dword_245521000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: receiverHandles (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[SMSafetyMonitorManager fetchNumFavoriteRecipientsWithReceiverHandles:handler:]";
      v22 = 1024;
      v23 = 1207;
      _os_log_error_impl(&dword_245521000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  v12 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __80__SMSafetyMonitorManager_fetchNumFavoriteRecipientsWithReceiverHandles_handler___block_invoke;
  v18[3] = &unk_25166E5A0;
  v19 = v9;
  v15[0] = v12;
  v15[1] = 3221225472;
  v15[2] = __80__SMSafetyMonitorManager_fetchNumFavoriteRecipientsWithReceiverHandles_handler___block_invoke_2;
  v15[3] = &unk_25166EA18;
  v16 = v7;
  v17 = v19;
  v13 = v19;
  v14 = v7;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v18, v15);

}

uint64_t __80__SMSafetyMonitorManager_fetchNumFavoriteRecipientsWithReceiverHandles_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__SMSafetyMonitorManager_fetchNumFavoriteRecipientsWithReceiverHandles_handler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fetchNumFavoriteRecipientsWithReceiverHandles:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)fetchNumEmergencyRecipientsWithReceiverHandles:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[SMSafetyMonitorManager fetchNumEmergencyRecipientsWithReceiverHandles:handler:]";
    v22 = 1024;
    v23 = 1219;
    _os_log_error_impl(&dword_245521000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: receiverHandles (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[SMSafetyMonitorManager fetchNumEmergencyRecipientsWithReceiverHandles:handler:]";
      v22 = 1024;
      v23 = 1220;
      _os_log_error_impl(&dword_245521000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  v12 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __81__SMSafetyMonitorManager_fetchNumEmergencyRecipientsWithReceiverHandles_handler___block_invoke;
  v18[3] = &unk_25166E5A0;
  v19 = v9;
  v15[0] = v12;
  v15[1] = 3221225472;
  v15[2] = __81__SMSafetyMonitorManager_fetchNumEmergencyRecipientsWithReceiverHandles_handler___block_invoke_2;
  v15[3] = &unk_25166EA18;
  v16 = v7;
  v17 = v19;
  v13 = v19;
  v14 = v7;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v18, v15);

}

uint64_t __81__SMSafetyMonitorManager_fetchNumEmergencyRecipientsWithReceiverHandles_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __81__SMSafetyMonitorManager_fetchNumEmergencyRecipientsWithReceiverHandles_handler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fetchNumEmergencyRecipientsWithReceiverHandles:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)fetchNumiCloudFamilyRecipientsWithReceiverHandles:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[SMSafetyMonitorManager fetchNumiCloudFamilyRecipientsWithReceiverHandles:handler:]";
    v22 = 1024;
    v23 = 1232;
    _os_log_error_impl(&dword_245521000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: receiverHandles (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[SMSafetyMonitorManager fetchNumiCloudFamilyRecipientsWithReceiverHandles:handler:]";
      v22 = 1024;
      v23 = 1233;
      _os_log_error_impl(&dword_245521000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  v12 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __84__SMSafetyMonitorManager_fetchNumiCloudFamilyRecipientsWithReceiverHandles_handler___block_invoke;
  v18[3] = &unk_25166E5A0;
  v19 = v9;
  v15[0] = v12;
  v15[1] = 3221225472;
  v15[2] = __84__SMSafetyMonitorManager_fetchNumiCloudFamilyRecipientsWithReceiverHandles_handler___block_invoke_2;
  v15[3] = &unk_25166EA18;
  v16 = v7;
  v17 = v19;
  v13 = v19;
  v14 = v7;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v18, v15);

}

uint64_t __84__SMSafetyMonitorManager_fetchNumiCloudFamilyRecipientsWithReceiverHandles_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __84__SMSafetyMonitorManager_fetchNumiCloudFamilyRecipientsWithReceiverHandles_handler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fetchNumiCloudFamilyRecipientsWithReceiverHandles:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)fetchMostLikelySessionDestinationsWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _BYTE *v17;
  _QWORD v18[4];
  id v19;
  _BYTE *v20;
  uint8_t buf[4];
  const char *v22;
  _BYTE v23[24];
  os_signpost_id_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v23 = 136315394;
      *(_QWORD *)&v23[4] = "-[SMSafetyMonitorManager fetchMostLikelySessionDestinationsWithHandler:]";
      *(_WORD *)&v23[12] = 1024;
      *(_DWORD *)&v23[14] = 1244;
      _os_log_error_impl(&dword_245521000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v23, 0x12u);
    }

  }
  *(_QWORD *)v23 = 0;
  *(_QWORD *)&v23[8] = v23;
  *(_QWORD *)&v23[16] = 0x2020000000;
  v24 = 0;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  v24 = v8;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = *(_QWORD *)(*(_QWORD *)&v23[8] + 24);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_245521000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SMFetchMostLikelySessionDestinations", " enableTelemetry=YES ", buf, 2u);
  }

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[SMSafetyMonitorManager fetchMostLikelySessionDestinationsWithHandler:]";
    _os_log_impl(&dword_245521000, v12, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  v13 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __72__SMSafetyMonitorManager_fetchMostLikelySessionDestinationsWithHandler___block_invoke;
  v18[3] = &unk_25166E4D8;
  v20 = v23;
  v19 = v5;
  v15[0] = v13;
  v15[1] = 3221225472;
  v15[2] = __72__SMSafetyMonitorManager_fetchMostLikelySessionDestinationsWithHandler___block_invoke_361;
  v15[3] = &unk_25166E550;
  v17 = v23;
  v14 = v19;
  v16 = v14;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v18, v15);

  _Block_object_dispose(v23, 8);
}

void __72__SMSafetyMonitorManager_fetchMostLikelySessionDestinationsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = 134349056;
    v8 = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMFetchMostLikelySessionDestinations", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__SMSafetyMonitorManager_fetchMostLikelySessionDestinationsWithHandler___block_invoke_361(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __72__SMSafetyMonitorManager_fetchMostLikelySessionDestinationsWithHandler___block_invoke_2;
  v5[3] = &unk_25166E860;
  v4 = *(_OWORD *)(a1 + 32);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(a2, "fetchMostLikelySessionDestinationsWithHandler:", v5);

}

void __72__SMSafetyMonitorManager_fetchMostLikelySessionDestinationsWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a3;
  v9 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    v13 = 134349056;
    v14 = objc_msgSend(v7, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v11, OS_SIGNPOST_INTERVAL_END, v12, "SMFetchMostLikelySessionDestinations", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v13, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)showSuggestionsDetectionUIWithSuggestion:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __75__SMSafetyMonitorManager_showSuggestionsDetectionUIWithSuggestion_handler___block_invoke;
  v15[3] = &unk_25166E5A0;
  v16 = v8;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __75__SMSafetyMonitorManager_showSuggestionsDetectionUIWithSuggestion_handler___block_invoke_2;
  v12[3] = &unk_25166EA18;
  v13 = v7;
  v14 = v16;
  v10 = v16;
  v11 = v7;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v15, v12);

}

uint64_t __75__SMSafetyMonitorManager_showSuggestionsDetectionUIWithSuggestion_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __75__SMSafetyMonitorManager_showSuggestionsDetectionUIWithSuggestion_handler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "showSuggestionsDetectionUIWithSuggestion:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)shouldShowKeyboardSuggestionsForInitiator:(id)a3 receiver:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __85__SMSafetyMonitorManager_shouldShowKeyboardSuggestionsForInitiator_receiver_handler___block_invoke;
  v20[3] = &unk_25166E5A0;
  v21 = v11;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __85__SMSafetyMonitorManager_shouldShowKeyboardSuggestionsForInitiator_receiver_handler___block_invoke_2;
  v16[3] = &unk_25166E888;
  v17 = v9;
  v18 = v10;
  v19 = v21;
  v13 = v21;
  v14 = v10;
  v15 = v9;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v20, v16);

}

uint64_t __85__SMSafetyMonitorManager_shouldShowKeyboardSuggestionsForInitiator_receiver_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __85__SMSafetyMonitorManager_shouldShowKeyboardSuggestionsForInitiator_receiver_handler___block_invoke_2(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "shouldShowKeyboardSuggestionsForInitiator:receiver:handler:", a1[4], a1[5], a1[6]);
}

- (void)shouldShowTipKitSuggestionsForInitiator:(id)a3 receiver:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __83__SMSafetyMonitorManager_shouldShowTipKitSuggestionsForInitiator_receiver_handler___block_invoke;
  v20[3] = &unk_25166E5A0;
  v21 = v11;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __83__SMSafetyMonitorManager_shouldShowTipKitSuggestionsForInitiator_receiver_handler___block_invoke_2;
  v16[3] = &unk_25166E888;
  v17 = v9;
  v18 = v10;
  v19 = v21;
  v13 = v21;
  v14 = v10;
  v15 = v9;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v20, v16);

}

uint64_t __83__SMSafetyMonitorManager_shouldShowTipKitSuggestionsForInitiator_receiver_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __83__SMSafetyMonitorManager_shouldShowTipKitSuggestionsForInitiator_receiver_handler___block_invoke_2(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "shouldShowTipKitSuggestionsForInitiator:receiver:handler:", a1[4], a1[5], a1[6]);
}

- (void)fetchShouldShowProactiveSuggestionsWithHandler:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __73__SMSafetyMonitorManager_fetchShouldShowProactiveSuggestionsWithHandler___block_invoke;
  v10[3] = &unk_25166E5A0;
  v11 = v5;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __73__SMSafetyMonitorManager_fetchShouldShowProactiveSuggestionsWithHandler___block_invoke_2;
  v8[3] = &unk_25166E680;
  v9 = v11;
  v7 = v11;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v10, v8);

}

uint64_t __73__SMSafetyMonitorManager_fetchShouldShowProactiveSuggestionsWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __73__SMSafetyMonitorManager_fetchShouldShowProactiveSuggestionsWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fetchShouldShowProactiveSuggestionsWithHandler:", *(_QWORD *)(a1 + 32));
}

- (void)showAlwaysOnPromptWithConfiguration:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __70__SMSafetyMonitorManager_showAlwaysOnPromptWithConfiguration_handler___block_invoke;
  v11[3] = &unk_25166EA18;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v9, v11);

}

uint64_t __70__SMSafetyMonitorManager_showAlwaysOnPromptWithConfiguration_handler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "showAlwaysOnPromptWithConfiguration:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)sendIDSMessage:(id)a3 toConversation:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  SEL v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[SMSafetyMonitorManager queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__SMSafetyMonitorManager_sendIDSMessage_toConversation_completion___block_invoke;
  block[3] = &unk_25166E8B0;
  v19 = v11;
  v20 = a2;
  block[4] = self;
  v17 = v9;
  v18 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v11;
  dispatch_async(v12, block);

}

void __67__SMSafetyMonitorManager_sendIDSMessage_toConversation_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  uint64_t v8;

  v2 = (void *)a1[4];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__SMSafetyMonitorManager_sendIDSMessage_toConversation_completion___block_invoke_2;
  v6[3] = &unk_25166E8D8;
  v3 = (void *)a1[7];
  v4 = a1[8];
  v6[4] = v2;
  v8 = v4;
  v7 = v3;
  objc_msgSend(v2, "_proxyForServicingSelector:withErrorHandler:", v4, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendIDSMessage:toConversation:completion:", a1[5], a1[6], a1[7]);

}

void __67__SMSafetyMonitorManager_sendIDSMessage_toConversation_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_error_impl(&dword_245521000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)sendIDSMessageToMyDevices:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  -[SMSafetyMonitorManager queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __63__SMSafetyMonitorManager_sendIDSMessageToMyDevices_completion___block_invoke;
  v12[3] = &unk_25166E7C0;
  v14 = v8;
  v15 = a2;
  v12[4] = self;
  v13 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, v12);

}

void __63__SMSafetyMonitorManager_sendIDSMessageToMyDevices_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  uint64_t v8;

  v2 = (void *)a1[4];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63__SMSafetyMonitorManager_sendIDSMessageToMyDevices_completion___block_invoke_2;
  v6[3] = &unk_25166E8D8;
  v3 = (void *)a1[6];
  v4 = a1[7];
  v6[4] = v2;
  v8 = v4;
  v7 = v3;
  objc_msgSend(v2, "_proxyForServicingSelector:withErrorHandler:", v4, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendIDSMessageToMyDevices:completion:", a1[5], a1[6]);

}

void __63__SMSafetyMonitorManager_sendIDSMessageToMyDevices_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_error_impl(&dword_245521000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)sendIDSMessageToPairedDevice:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  -[SMSafetyMonitorManager queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __66__SMSafetyMonitorManager_sendIDSMessageToPairedDevice_completion___block_invoke;
  v12[3] = &unk_25166E7C0;
  v14 = v8;
  v15 = a2;
  v12[4] = self;
  v13 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, v12);

}

void __66__SMSafetyMonitorManager_sendIDSMessageToPairedDevice_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __66__SMSafetyMonitorManager_sendIDSMessageToPairedDevice_completion___block_invoke_2;
  v6[3] = &unk_25166E8D8;
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(id *)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "_proxyForServicingSelector:withErrorHandler:", v3, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendIDSMessageToPairedDevice:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __66__SMSafetyMonitorManager_sendIDSMessageToPairedDevice_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_error_impl(&dword_245521000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);

  }
}

- (void)sendIDSMessageToMyNearbyDevices:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  -[SMSafetyMonitorManager queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __69__SMSafetyMonitorManager_sendIDSMessageToMyNearbyDevices_completion___block_invoke;
  v12[3] = &unk_25166E7C0;
  v14 = v8;
  v15 = a2;
  v12[4] = self;
  v13 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, v12);

}

void __69__SMSafetyMonitorManager_sendIDSMessageToMyNearbyDevices_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__SMSafetyMonitorManager_sendIDSMessageToMyNearbyDevices_completion___block_invoke_2;
  v6[3] = &unk_25166E8D8;
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(id *)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "_proxyForServicingSelector:withErrorHandler:", v3, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendIDSMessageToMyNearbyDevices:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __69__SMSafetyMonitorManager_sendIDSMessageToMyNearbyDevices_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_error_impl(&dword_245521000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);

  }
}

- (void)sendMadridMessage:(id)a3 associatedGUID:(id)a4 toConversation:(id)a5 summaryText:(id)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD block[5];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  SEL v30;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  -[SMSafetyMonitorManager queue](self, "queue");
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __97__SMSafetyMonitorManager_sendMadridMessage_associatedGUID_toConversation_summaryText_completion___block_invoke;
  block[3] = &unk_25166E900;
  v29 = v17;
  v30 = a2;
  block[4] = self;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v19 = v16;
  v20 = v15;
  v21 = v14;
  v22 = v13;
  v23 = v17;
  dispatch_async(v18, block);

}

void __97__SMSafetyMonitorManager_sendMadridMessage_associatedGUID_toConversation_summaryText_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  uint64_t v8;

  v2 = (void *)a1[4];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __97__SMSafetyMonitorManager_sendMadridMessage_associatedGUID_toConversation_summaryText_completion___block_invoke_2;
  v6[3] = &unk_25166E8D8;
  v3 = (void *)a1[9];
  v4 = a1[10];
  v6[4] = v2;
  v8 = v4;
  v7 = v3;
  objc_msgSend(v2, "_proxyForServicingSelector:withErrorHandler:", v4, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendMadridMessage:associatedGUID:toConversation:summaryText:completion:", a1[5], a1[6], a1[7], a1[8], a1[9]);

}

void __97__SMSafetyMonitorManager_sendMadridMessage_associatedGUID_toConversation_summaryText_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_error_impl(&dword_245521000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)scheduleMadridMessageSendForMessage:(id)a3 messageGUID:(id)a4 associatedGUID:(id)a5 sendDate:(id)a6 toConversation:(id)a7 summaryText:(id)a8 completion:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD block[5];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  SEL v39;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  -[SMSafetyMonitorManager queue](self, "queue");
  v23 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __136__SMSafetyMonitorManager_scheduleMadridMessageSendForMessage_messageGUID_associatedGUID_sendDate_toConversation_summaryText_completion___block_invoke;
  block[3] = &unk_25166E928;
  v38 = v22;
  v39 = a2;
  block[4] = self;
  v32 = v16;
  v33 = v17;
  v34 = v18;
  v35 = v19;
  v36 = v20;
  v37 = v21;
  v24 = v21;
  v25 = v20;
  v26 = v19;
  v27 = v18;
  v28 = v17;
  v29 = v16;
  v30 = v22;
  dispatch_async(v23, block);

}

void __136__SMSafetyMonitorManager_scheduleMadridMessageSendForMessage_messageGUID_associatedGUID_sendDate_toConversation_summaryText_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;

  v2 = (void *)a1[4];
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __136__SMSafetyMonitorManager_scheduleMadridMessageSendForMessage_messageGUID_associatedGUID_sendDate_toConversation_summaryText_completion___block_invoke_2;
  v9 = &unk_25166E8D8;
  v3 = (void *)a1[11];
  v4 = a1[12];
  v10 = v2;
  v12 = v4;
  v11 = v3;
  objc_msgSend(v2, "_proxyForServicingSelector:withErrorHandler:", v4, &v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheduleMadridMessageSendForMessage:messageGUID:associatedGUID:sendDate:toConversation:summaryText:completion:", a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], v6, v7, v8, v9, v10);

}

void __136__SMSafetyMonitorManager_scheduleMadridMessageSendForMessage_messageGUID_associatedGUID_sendDate_toConversation_summaryText_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_error_impl(&dword_245521000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)cancelMadridMessageSendForMessageGUID:(id)a3 toConversation:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  SEL v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[SMSafetyMonitorManager queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __90__SMSafetyMonitorManager_cancelMadridMessageSendForMessageGUID_toConversation_completion___block_invoke;
  block[3] = &unk_25166E8B0;
  v19 = v11;
  v20 = a2;
  block[4] = self;
  v17 = v9;
  v18 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v11;
  dispatch_async(v12, block);

}

void __90__SMSafetyMonitorManager_cancelMadridMessageSendForMessageGUID_toConversation_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  uint64_t v8;

  v2 = (void *)a1[4];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __90__SMSafetyMonitorManager_cancelMadridMessageSendForMessageGUID_toConversation_completion___block_invoke_2;
  v6[3] = &unk_25166E8D8;
  v3 = (void *)a1[7];
  v4 = a1[8];
  v6[4] = v2;
  v8 = v4;
  v7 = v3;
  objc_msgSend(v2, "_proxyForServicingSelector:withErrorHandler:", v4, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelMadridMessageSendForMessageGUID:toConversation:completion:", a1[5], a1[6], a1[7]);

}

void __90__SMSafetyMonitorManager_cancelMadridMessageSendForMessageGUID_toConversation_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_error_impl(&dword_245521000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)iMessageSendFor:(id)a3 guid:(id)a4 successful:(BOOL)a5 withError:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  BOOL v21;
  _QWORD v22[6];

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __68__SMSafetyMonitorManager_iMessageSendFor_guid_successful_withError___block_invoke;
  v22[3] = &unk_25166E950;
  v22[4] = self;
  v22[5] = a2;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __68__SMSafetyMonitorManager_iMessageSendFor_guid_successful_withError___block_invoke_363;
  v17[3] = &unk_25166E978;
  v18 = v11;
  v19 = v12;
  v21 = a5;
  v20 = v13;
  v14 = v13;
  v15 = v12;
  v16 = v11;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v22, v17);

}

void __68__SMSafetyMonitorManager_iMessageSendFor_guid_successful_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_error_impl(&dword_245521000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);

  }
}

uint64_t __68__SMSafetyMonitorManager_iMessageSendFor_guid_successful_withError___block_invoke_363(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "iMessageSendFor:guid:successful:withError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)iMessageScheduledSendScheduledFor:(id)a3 guid:(id)a4 successful:(BOOL)a5 withError:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  BOOL v21;
  _QWORD v22[6];

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __86__SMSafetyMonitorManager_iMessageScheduledSendScheduledFor_guid_successful_withError___block_invoke;
  v22[3] = &unk_25166E950;
  v22[4] = self;
  v22[5] = a2;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __86__SMSafetyMonitorManager_iMessageScheduledSendScheduledFor_guid_successful_withError___block_invoke_364;
  v17[3] = &unk_25166E978;
  v18 = v11;
  v19 = v12;
  v21 = a5;
  v20 = v13;
  v14 = v13;
  v15 = v12;
  v16 = v11;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v22, v17);

}

void __86__SMSafetyMonitorManager_iMessageScheduledSendScheduledFor_guid_successful_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_error_impl(&dword_245521000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);

  }
}

uint64_t __86__SMSafetyMonitorManager_iMessageScheduledSendScheduledFor_guid_successful_withError___block_invoke_364(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "iMessageScheduledSendScheduledFor:guid:successful:withError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)iMessageScheduledSendCancelFor:(id)a3 successful:(BOOL)a4 withError:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  BOOL v16;
  _QWORD v17[6];

  v9 = a3;
  v10 = a5;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __78__SMSafetyMonitorManager_iMessageScheduledSendCancelFor_successful_withError___block_invoke;
  v17[3] = &unk_25166E950;
  v17[4] = self;
  v17[5] = a2;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __78__SMSafetyMonitorManager_iMessageScheduledSendCancelFor_successful_withError___block_invoke_365;
  v13[3] = &unk_25166E9A0;
  v16 = a4;
  v14 = v9;
  v15 = v10;
  v11 = v10;
  v12 = v9;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v17, v13);

}

void __78__SMSafetyMonitorManager_iMessageScheduledSendCancelFor_successful_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_error_impl(&dword_245521000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);

  }
}

uint64_t __78__SMSafetyMonitorManager_iMessageScheduledSendCancelFor_successful_withError___block_invoke_365(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "iMessageScheduledSendCancelFor:successful:withError:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)iMessageScheduledSendTriggeredFor:(id)a3
{
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[6];

  v7 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __60__SMSafetyMonitorManager_iMessageScheduledSendTriggeredFor___block_invoke;
  v8[3] = &unk_25166E950;
  v8[4] = self;
  v8[5] = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60__SMSafetyMonitorManager_iMessageScheduledSendTriggeredFor___block_invoke_366;
  v6[3] = &unk_25166E9C8;
  v5 = v7;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v8, v6);

}

void __60__SMSafetyMonitorManager_iMessageScheduledSendTriggeredFor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_error_impl(&dword_245521000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);

  }
}

uint64_t __60__SMSafetyMonitorManager_iMessageScheduledSendTriggeredFor___block_invoke_366(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "iMessageScheduledSendTriggeredFor:", *(_QWORD *)(a1 + 32));
}

- (void)iMessageReceived:(id)a3 fromHandle:(id)a4 fromMe:(BOOL)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  BOOL v16;
  _QWORD v17[6];

  v9 = a3;
  v10 = a4;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __61__SMSafetyMonitorManager_iMessageReceived_fromHandle_fromMe___block_invoke;
  v17[3] = &unk_25166E950;
  v17[4] = self;
  v17[5] = a2;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __61__SMSafetyMonitorManager_iMessageReceived_fromHandle_fromMe___block_invoke_367;
  v13[3] = &unk_25166E9A0;
  v14 = v9;
  v15 = v10;
  v16 = a5;
  v11 = v10;
  v12 = v9;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v17, v13);

}

void __61__SMSafetyMonitorManager_iMessageReceived_fromHandle_fromMe___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_error_impl(&dword_245521000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);

  }
}

uint64_t __61__SMSafetyMonitorManager_iMessageReceived_fromHandle_fromMe___block_invoke_367(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "iMessageReceived:fromHandle:fromMe:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)iMessageDeletedFor:(id)a3
{
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[6];

  v7 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__SMSafetyMonitorManager_iMessageDeletedFor___block_invoke;
  v8[3] = &unk_25166E950;
  v8[4] = self;
  v8[5] = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__SMSafetyMonitorManager_iMessageDeletedFor___block_invoke_368;
  v6[3] = &unk_25166E9C8;
  v5 = v7;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v8, v6);

}

void __45__SMSafetyMonitorManager_iMessageDeletedFor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_error_impl(&dword_245521000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);

  }
}

uint64_t __45__SMSafetyMonitorManager_iMessageDeletedFor___block_invoke_368(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "iMessageDeletedFor:", *(_QWORD *)(a1 + 32));
}

- (void)iMessageConversationDeletedFor:(id)a3
{
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[6];

  v7 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__SMSafetyMonitorManager_iMessageConversationDeletedFor___block_invoke;
  v8[3] = &unk_25166E950;
  v8[4] = self;
  v8[5] = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__SMSafetyMonitorManager_iMessageConversationDeletedFor___block_invoke_369;
  v6[3] = &unk_25166E9C8;
  v5 = v7;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v8, v6);

}

void __57__SMSafetyMonitorManager_iMessageConversationDeletedFor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_error_impl(&dword_245521000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);

  }
}

uint64_t __57__SMSafetyMonitorManager_iMessageConversationDeletedFor___block_invoke_369(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "iMessageConversationDeletedFor:", *(_QWORD *)(a1 + 32));
}

- (void)iMessageGroupMembershipChangedFor:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[6];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_245521000, v6, OS_LOG_TYPE_INFO, "%@,%@,groupID,%@", buf, 0x20u);

  }
  v12 = v5;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __60__SMSafetyMonitorManager_iMessageGroupMembershipChangedFor___block_invoke;
  v13[3] = &unk_25166E950;
  v13[4] = self;
  v13[5] = a2;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __60__SMSafetyMonitorManager_iMessageGroupMembershipChangedFor___block_invoke_370;
  v11[3] = &unk_25166E9C8;
  v10 = v5;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v13, v11);

}

void __60__SMSafetyMonitorManager_iMessageGroupMembershipChangedFor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_error_impl(&dword_245521000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);

  }
}

uint64_t __60__SMSafetyMonitorManager_iMessageGroupMembershipChangedFor___block_invoke_370(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "iMessageGroupMembershipChangedFor:", *(_QWORD *)(a1 + 32));
}

- (void)iMessageGroupDisplayNameChangedFor:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[6];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_245521000, v6, OS_LOG_TYPE_INFO, "%@,%@,groupID,%@", buf, 0x20u);

  }
  v12 = v5;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __61__SMSafetyMonitorManager_iMessageGroupDisplayNameChangedFor___block_invoke;
  v13[3] = &unk_25166E950;
  v13[4] = self;
  v13[5] = a2;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __61__SMSafetyMonitorManager_iMessageGroupDisplayNameChangedFor___block_invoke_371;
  v11[3] = &unk_25166E9C8;
  v10 = v5;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v13, v11);

}

void __61__SMSafetyMonitorManager_iMessageGroupDisplayNameChangedFor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_error_impl(&dword_245521000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);

  }
}

uint64_t __61__SMSafetyMonitorManager_iMessageGroupDisplayNameChangedFor___block_invoke_371(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "iMessageGroupDisplayNameChangedFor:", *(_QWORD *)(a1 + 32));
}

- (void)iMessageGroupPhotoChangedFor:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[6];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_245521000, v6, OS_LOG_TYPE_INFO, "%@,%@,groupID,%@", buf, 0x20u);

  }
  v12 = v5;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __55__SMSafetyMonitorManager_iMessageGroupPhotoChangedFor___block_invoke;
  v13[3] = &unk_25166E950;
  v13[4] = self;
  v13[5] = a2;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __55__SMSafetyMonitorManager_iMessageGroupPhotoChangedFor___block_invoke_372;
  v11[3] = &unk_25166E9C8;
  v10 = v5;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v13, v11);

}

void __55__SMSafetyMonitorManager_iMessageGroupPhotoChangedFor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_error_impl(&dword_245521000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);

  }
}

uint64_t __55__SMSafetyMonitorManager_iMessageGroupPhotoChangedFor___block_invoke_372(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "iMessageGroupPhotoChangedFor:", *(_QWORD *)(a1 + 32));
}

- (void)kickedFromIMessageGroupWith:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[6];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_245521000, v6, OS_LOG_TYPE_INFO, "%@,%@,groupID,%@", buf, 0x20u);

  }
  v12 = v5;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __54__SMSafetyMonitorManager_kickedFromIMessageGroupWith___block_invoke;
  v13[3] = &unk_25166E950;
  v13[4] = self;
  v13[5] = a2;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __54__SMSafetyMonitorManager_kickedFromIMessageGroupWith___block_invoke_373;
  v11[3] = &unk_25166E9C8;
  v10 = v5;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v13, v11);

}

void __54__SMSafetyMonitorManager_kickedFromIMessageGroupWith___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_error_impl(&dword_245521000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);

  }
}

uint64_t __54__SMSafetyMonitorManager_kickedFromIMessageGroupWith___block_invoke_373(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "kickedFromIMessageGroupWith:", *(_QWORD *)(a1 + 32));
}

- (void)fetchSessionReceiptForSessionID:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  SEL v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v25 = v10;
    v26 = 2112;
    v27 = v12;
    v28 = 2112;
    v29 = v13;
    _os_log_impl(&dword_245521000, v9, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,sessionID:%@,%@,%@,fetching session receipt", buf, 0x20u);

  }
  v14 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __69__SMSafetyMonitorManager_fetchSessionReceiptForSessionID_completion___block_invoke;
  v20[3] = &unk_25166E6A8;
  v20[4] = self;
  v23 = a2;
  v22 = v8;
  v21 = v7;
  v17[0] = v14;
  v17[1] = 3221225472;
  v17[2] = __69__SMSafetyMonitorManager_fetchSessionReceiptForSessionID_completion___block_invoke_374;
  v17[3] = &unk_25166EA18;
  v18 = v21;
  v19 = v22;
  v15 = v22;
  v16 = v21;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v20, v17);

}

void __69__SMSafetyMonitorManager_fetchSessionReceiptForSessionID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_error_impl(&dword_245521000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __69__SMSafetyMonitorManager_fetchSessionReceiptForSessionID_completion___block_invoke_374(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fetchSessionReceiptForSessionID:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)startMonitoringInitiatorSafetyCacheWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[SMSafetyMonitorManager startMonitoringInitiatorSafetyCacheWithHandler:]";
      v16 = 1024;
      v17 = 1558;
      _os_log_error_impl(&dword_245521000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[SMSafetyMonitorManager startMonitoringInitiatorSafetyCacheWithHandler:]";
    _os_log_impl(&dword_245521000, v7, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  -[SMSafetyMonitorManager setInitiatorSafetyCacheHandler:](self, "setInitiatorSafetyCacheHandler:", v5);
  v8 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __73__SMSafetyMonitorManager_startMonitoringInitiatorSafetyCacheWithHandler___block_invoke;
  v12[3] = &unk_25166E348;
  v12[4] = self;
  v13 = v5;
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __73__SMSafetyMonitorManager_startMonitoringInitiatorSafetyCacheWithHandler___block_invoke_2;
  v10[3] = &unk_25166EA18;
  v10[4] = self;
  v11 = v13;
  v9 = v13;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v12, v10);

}

uint64_t __73__SMSafetyMonitorManager_startMonitoringInitiatorSafetyCacheWithHandler___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = result;
    (*(void (**)(void))(*(_QWORD *)(result + 40) + 16))();
    return objc_msgSend(*(id *)(v2 + 32), "setInitiatorSafetyCacheHandler:", 0);
  }
  return result;
}

void __73__SMSafetyMonitorManager_startMonitoringInitiatorSafetyCacheWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  _QWORD v5[5];
  id v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __73__SMSafetyMonitorManager_startMonitoringInitiatorSafetyCacheWithHandler___block_invoke_3;
  v5[3] = &unk_25166E9F0;
  v4 = *(id *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(a2, "startMonitoringInitiatorSafetyCacheWithHandler:", v5);

}

uint64_t __73__SMSafetyMonitorManager_startMonitoringInitiatorSafetyCacheWithHandler___block_invoke_3(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;

  if (a7)
  {
    v7 = result;
    (*(void (**)(void))(*(_QWORD *)(result + 40) + 16))();
    return objc_msgSend(*(id *)(v7 + 32), "setInitiatorSafetyCacheHandler:", 0);
  }
  return result;
}

- (void)stopMonitoringInitiatorSafetyCacheWithCompletion:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[SMSafetyMonitorManager stopMonitoringInitiatorSafetyCacheWithCompletion:]";
      v15 = 1024;
      v16 = 1581;
      _os_log_error_impl(&dword_245521000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion (in %s:%d)", buf, 0x12u);
    }

  }
  -[SMSafetyMonitorManager setInitiatorSafetyCacheHandler:](self, "setInitiatorSafetyCacheHandler:", 0);
  v7 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __75__SMSafetyMonitorManager_stopMonitoringInitiatorSafetyCacheWithCompletion___block_invoke;
  v11[3] = &unk_25166E5A0;
  v12 = v5;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __75__SMSafetyMonitorManager_stopMonitoringInitiatorSafetyCacheWithCompletion___block_invoke_2;
  v9[3] = &unk_25166E680;
  v10 = v12;
  v8 = v12;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v11, v9);

}

uint64_t __75__SMSafetyMonitorManager_stopMonitoringInitiatorSafetyCacheWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __75__SMSafetyMonitorManager_stopMonitoringInitiatorSafetyCacheWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stopMonitoringInitiatorSafetyCacheWithCompletion:", *(_QWORD *)(a1 + 32));
}

- (void)onInitiatorSafetyCacheChangeForSessionID:(id)a3 phoneCache:(id)a4 watchCache:(id)a5 cacheExpiryDate:(id)a6 cacheReleaseDate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  void (**v24)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  -[SMSafetyMonitorManager initiatorSafetyCacheHandler](self, "initiatorSafetyCacheHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "UUIDString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412802;
      v26 = v21;
      v27 = 2112;
      v28 = v22;
      v29 = 2112;
      v30 = v23;
      _os_log_impl(&dword_245521000, v19, OS_LOG_TYPE_INFO, "#SafetyCache,Initiator,%@,sessionID:%@,%@,received safety cache update", (uint8_t *)&v25, 0x20u);

    }
    -[SMSafetyMonitorManager initiatorSafetyCacheHandler](self, "initiatorSafetyCacheHandler");
    v24 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id, id, id, id, _QWORD))v24)[2](v24, v13, v14, v15, v16, v17, 0);

  }
}

- (void)fetchAllReceiverSessionStatusWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  id v11;
  SEL v12;

  v5 = a3;
  v6 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __70__SMSafetyMonitorManager_fetchAllReceiverSessionStatusWithCompletion___block_invoke;
  v10[3] = &unk_25166E8D8;
  v10[4] = self;
  v12 = a2;
  v11 = v5;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __70__SMSafetyMonitorManager_fetchAllReceiverSessionStatusWithCompletion___block_invoke_376;
  v8[3] = &unk_25166E680;
  v9 = v11;
  v7 = v11;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v10, v8);

}

void __70__SMSafetyMonitorManager_fetchAllReceiverSessionStatusWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_error_impl(&dword_245521000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __70__SMSafetyMonitorManager_fetchAllReceiverSessionStatusWithCompletion___block_invoke_376(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fetchAllReceiverSessionStatusWithCompletion:", *(_QWORD *)(a1 + 32));
}

- (void)fetchReceiverSessionStatusForSessionID:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  SEL v17;

  v7 = a3;
  v8 = a4;
  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __76__SMSafetyMonitorManager_fetchReceiverSessionStatusForSessionID_completion___block_invoke;
  v15[3] = &unk_25166E8D8;
  v15[4] = self;
  v17 = a2;
  v16 = v8;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __76__SMSafetyMonitorManager_fetchReceiverSessionStatusForSessionID_completion___block_invoke_377;
  v12[3] = &unk_25166EA18;
  v13 = v7;
  v14 = v16;
  v10 = v16;
  v11 = v7;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v15, v12);

}

void __76__SMSafetyMonitorManager_fetchReceiverSessionStatusForSessionID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_error_impl(&dword_245521000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __76__SMSafetyMonitorManager_fetchReceiverSessionStatusForSessionID_completion___block_invoke_377(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fetchReceiverSessionStatusForSessionID:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)startMonitoringReceiverSessionStatusWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _BYTE *v17;
  _QWORD v18[5];
  id v19;
  _BYTE *v20;
  uint8_t buf[4];
  const char *v22;
  _BYTE v23[24];
  os_signpost_id_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v23 = 136315394;
      *(_QWORD *)&v23[4] = "-[SMSafetyMonitorManager startMonitoringReceiverSessionStatusWithHandler:]";
      *(_WORD *)&v23[12] = 1024;
      *(_DWORD *)&v23[14] = 1632;
      _os_log_error_impl(&dword_245521000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v23, 0x12u);
    }

  }
  *(_QWORD *)v23 = 0;
  *(_QWORD *)&v23[8] = v23;
  *(_QWORD *)&v23[16] = 0x2020000000;
  v24 = 0;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  v24 = v8;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = *(_QWORD *)(*(_QWORD *)&v23[8] + 24);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_245521000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SMStartMonitoringReceiverSessionStatus", " enableTelemetry=YES ", buf, 2u);
  }

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[SMSafetyMonitorManager startMonitoringReceiverSessionStatusWithHandler:]";
    _os_log_impl(&dword_245521000, v12, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  -[SMSafetyMonitorManager setReceiverSessionStatusHandler:](self, "setReceiverSessionStatusHandler:", v5);
  v13 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __74__SMSafetyMonitorManager_startMonitoringReceiverSessionStatusWithHandler___block_invoke;
  v18[3] = &unk_25166E6D0;
  v20 = v23;
  v18[4] = self;
  v19 = v5;
  v15[0] = v13;
  v15[1] = 3221225472;
  v15[2] = __74__SMSafetyMonitorManager_startMonitoringReceiverSessionStatusWithHandler___block_invoke_378;
  v15[3] = &unk_25166E720;
  v17 = v23;
  v14 = v19;
  v15[4] = self;
  v16 = v14;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v18, v15);

  _Block_object_dispose(v23, 8);
}

void __74__SMSafetyMonitorManager_startMonitoringReceiverSessionStatusWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = 134349056;
    v8 = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMStartMonitoringReceiverSessionStatus", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "setReceiverSessionStatusHandler:", 0);
  }

}

void __74__SMSafetyMonitorManager_startMonitoringReceiverSessionStatusWithHandler___block_invoke_378(uint64_t a1, void *a2)
{
  id v4;
  __int128 v5;
  _QWORD v6[5];
  __int128 v7;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __74__SMSafetyMonitorManager_startMonitoringReceiverSessionStatusWithHandler___block_invoke_2;
  v6[3] = &unk_25166EA40;
  v5 = *(_OWORD *)(a1 + 40);
  v4 = (id)v5;
  v7 = v5;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "startMonitoringReceiverSessionStatusWithHandler:", v6);

}

void __74__SMSafetyMonitorManager_startMonitoringReceiverSessionStatusWithHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    v9 = 134349056;
    v10 = objc_msgSend(v5, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v7, OS_SIGNPOST_INTERVAL_END, v8, "SMStartMonitoringReceiverSessionStatus", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v9, 0xCu);
  }

  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "setReceiverSessionStatusHandler:", 0);
  }

}

- (void)stopMonitoringReceiverSessionStatusWithCompletion:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _BYTE *v16;
  _QWORD v17[4];
  id v18;
  _BYTE *v19;
  uint8_t buf[16];
  _BYTE v21[24];
  os_signpost_id_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v21 = 136315394;
      *(_QWORD *)&v21[4] = "-[SMSafetyMonitorManager stopMonitoringReceiverSessionStatusWithCompletion:]";
      *(_WORD *)&v21[12] = 1024;
      *(_DWORD *)&v21[14] = 1659;
      _os_log_error_impl(&dword_245521000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion (in %s:%d)", v21, 0x12u);
    }

  }
  *(_QWORD *)v21 = 0;
  *(_QWORD *)&v21[8] = v21;
  *(_QWORD *)&v21[16] = 0x2020000000;
  v22 = 0;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  v22 = v8;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = *(_QWORD *)(*(_QWORD *)&v21[8] + 24);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_245521000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SMStopMonitoringReceiverSessionStatus", " enableTelemetry=YES ", buf, 2u);
  }

  -[SMSafetyMonitorManager setReceiverSessionStatusHandler:](self, "setReceiverSessionStatusHandler:", 0);
  v12 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __76__SMSafetyMonitorManager_stopMonitoringReceiverSessionStatusWithCompletion___block_invoke;
  v17[3] = &unk_25166E4D8;
  v19 = v21;
  v18 = v5;
  v14[0] = v12;
  v14[1] = 3221225472;
  v14[2] = __76__SMSafetyMonitorManager_stopMonitoringReceiverSessionStatusWithCompletion___block_invoke_380;
  v14[3] = &unk_25166E550;
  v16 = v21;
  v13 = v18;
  v15 = v13;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v17, v14);

  _Block_object_dispose(v21, 8);
}

void __76__SMSafetyMonitorManager_stopMonitoringReceiverSessionStatusWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = 134349056;
    v8 = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMStopMonitoringReceiverSessionStatus", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__SMSafetyMonitorManager_stopMonitoringReceiverSessionStatusWithCompletion___block_invoke_380(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __76__SMSafetyMonitorManager_stopMonitoringReceiverSessionStatusWithCompletion___block_invoke_2;
  v5[3] = &unk_25166E4D8;
  v4 = *(_OWORD *)(a1 + 32);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(a2, "stopMonitoringReceiverSessionStatusWithCompletion:", v5);

}

void __76__SMSafetyMonitorManager_stopMonitoringReceiverSessionStatusWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = 134349056;
    v8 = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMStopMonitoringReceiverSessionStatus", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)onReceiverSessionStatusChangeForSessionID:(id)a3 sessionStatus:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[SMSafetyMonitorManager receiverSessionStatusHandler](self, "receiverSessionStatusHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SMSafetyMonitorManager receiverSessionStatusHandler](self, "receiverSessionStatusHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id, _QWORD))v8)[2](v8, v9, v6, 0);

  }
}

- (void)userRequestedCacheDownloadForSessionID:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  _QWORD v21[5];
  id v22;
  uint64_t *v23;
  SEL v24;
  uint8_t buf[16];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  os_signpost_id_t v29;

  v7 = a3;
  v8 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  v29 = v10;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = v27[3];
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_245521000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SMUserRequestedCacheDownloadForSessionID", " enableTelemetry=YES ", buf, 2u);
  }

  v14 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __76__SMSafetyMonitorManager_userRequestedCacheDownloadForSessionID_completion___block_invoke;
  v21[3] = &unk_25166EB08;
  v23 = &v26;
  v24 = a2;
  v21[4] = self;
  v22 = v8;
  v17[0] = v14;
  v17[1] = 3221225472;
  v17[2] = __76__SMSafetyMonitorManager_userRequestedCacheDownloadForSessionID_completion___block_invoke_381;
  v17[3] = &unk_25166E720;
  v15 = v7;
  v18 = v15;
  v20 = &v26;
  v16 = v22;
  v19 = v16;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v21, v17);

  _Block_object_dispose(&v26, 8);
}

void __76__SMSafetyMonitorManager_userRequestedCacheDownloadForSessionID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = (uint64_t)v10;
    v14 = 2112;
    v15 = v11;
    v16 = 2112;
    v17 = v3;
    _os_log_error_impl(&dword_245521000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v12, 0x20u);

  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v8 = objc_msgSend(v3, "code");
    v12 = 134349056;
    v13 = v8;
    _os_signpost_emit_with_name_impl(&dword_245521000, v6, OS_SIGNPOST_INTERVAL_END, v7, "SMUserRequestedCacheDownloadForSessionID", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v12, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __76__SMSafetyMonitorManager_userRequestedCacheDownloadForSessionID_completion___block_invoke_381(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;

  v3 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __76__SMSafetyMonitorManager_userRequestedCacheDownloadForSessionID_completion___block_invoke_2;
  v6[3] = &unk_25166E4D8;
  v5 = *(_OWORD *)(a1 + 40);
  v4 = (id)v5;
  v7 = v5;
  objc_msgSend(a2, "userRequestedCacheDownloadForSessionID:completion:", v3, v6);

}

void __76__SMSafetyMonitorManager_userRequestedCacheDownloadForSessionID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = 134349056;
    v8 = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMUserRequestedCacheDownloadForSessionID", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchReceiverSafetyCacheForSessionID:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  _QWORD v21[5];
  id v22;
  uint64_t *v23;
  SEL v24;
  uint8_t buf[16];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  os_signpost_id_t v29;

  v7 = a3;
  v8 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  v29 = v10;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = v27[3];
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_245521000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SMFetchReceiverSafetyCache", " enableTelemetry=YES ", buf, 2u);
  }

  v14 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __74__SMSafetyMonitorManager_fetchReceiverSafetyCacheForSessionID_completion___block_invoke;
  v21[3] = &unk_25166EB08;
  v23 = &v26;
  v24 = a2;
  v21[4] = self;
  v22 = v8;
  v17[0] = v14;
  v17[1] = 3221225472;
  v17[2] = __74__SMSafetyMonitorManager_fetchReceiverSafetyCacheForSessionID_completion___block_invoke_382;
  v17[3] = &unk_25166E720;
  v15 = v7;
  v18 = v15;
  v20 = &v26;
  v16 = v22;
  v19 = v16;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v21, v17);

  _Block_object_dispose(&v26, 8);
}

void __74__SMSafetyMonitorManager_fetchReceiverSafetyCacheForSessionID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = (uint64_t)v10;
    v14 = 2112;
    v15 = v11;
    v16 = 2112;
    v17 = v3;
    _os_log_error_impl(&dword_245521000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v12, 0x20u);

  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v8 = objc_msgSend(v3, "code");
    v12 = 134349056;
    v13 = v8;
    _os_signpost_emit_with_name_impl(&dword_245521000, v6, OS_SIGNPOST_INTERVAL_END, v7, "SMFetchReceiverSafetyCache", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v12, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __74__SMSafetyMonitorManager_fetchReceiverSafetyCacheForSessionID_completion___block_invoke_382(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;

  v3 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __74__SMSafetyMonitorManager_fetchReceiverSafetyCacheForSessionID_completion___block_invoke_2;
  v6[3] = &unk_25166EA68;
  v5 = *(_OWORD *)(a1 + 40);
  v4 = (id)v5;
  v7 = v5;
  objc_msgSend(a2, "fetchReceiverSafetyCacheForSessionID:completion:", v3, v6);

}

void __74__SMSafetyMonitorManager_fetchReceiverSafetyCacheForSessionID_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  __CFString *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a3;
  v9 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    if (v9)
      v13 = CFSTR("YES");
    else
      v13 = CFSTR("NO");
    v14 = 136446466;
    v15 = -[__CFString UTF8String](v13, "UTF8String");
    v16 = 2050;
    v17 = objc_msgSend(v7, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v11, OS_SIGNPOST_INTERVAL_END, v12, "SMFetchReceiverSafetyCache", " enableTelemetry=YES {phoneCacheAvailable:%{public,signpost.telemetry:string1}s, error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v14, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startMonitoringReceiverSafetyCacheWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _BYTE *v17;
  _QWORD v18[5];
  id v19;
  _BYTE *v20;
  uint8_t buf[4];
  const char *v22;
  _BYTE v23[24];
  os_signpost_id_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v23 = 136315394;
      *(_QWORD *)&v23[4] = "-[SMSafetyMonitorManager startMonitoringReceiverSafetyCacheWithHandler:]";
      *(_WORD *)&v23[12] = 1024;
      *(_DWORD *)&v23[14] = 1724;
      _os_log_error_impl(&dword_245521000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v23, 0x12u);
    }

  }
  *(_QWORD *)v23 = 0;
  *(_QWORD *)&v23[8] = v23;
  *(_QWORD *)&v23[16] = 0x2020000000;
  v24 = 0;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  v24 = v8;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = *(_QWORD *)(*(_QWORD *)&v23[8] + 24);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_245521000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SMStartMonitoringReceiverSafetyCache", " enableTelemetry=YES ", buf, 2u);
  }

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[SMSafetyMonitorManager startMonitoringReceiverSafetyCacheWithHandler:]";
    _os_log_impl(&dword_245521000, v12, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  -[SMSafetyMonitorManager setReceiverSafetyCacheHandler:](self, "setReceiverSafetyCacheHandler:", v5);
  v13 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __72__SMSafetyMonitorManager_startMonitoringReceiverSafetyCacheWithHandler___block_invoke;
  v18[3] = &unk_25166E6D0;
  v20 = v23;
  v18[4] = self;
  v19 = v5;
  v15[0] = v13;
  v15[1] = 3221225472;
  v15[2] = __72__SMSafetyMonitorManager_startMonitoringReceiverSafetyCacheWithHandler___block_invoke_384;
  v15[3] = &unk_25166E720;
  v17 = v23;
  v14 = v19;
  v15[4] = self;
  v16 = v14;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v18, v15);

  _Block_object_dispose(v23, 8);
}

void __72__SMSafetyMonitorManager_startMonitoringReceiverSafetyCacheWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = 134349056;
    v8 = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMStartMonitoringReceiverSafetyCache", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "setReceiverSafetyCacheHandler:", 0);
  }

}

void __72__SMSafetyMonitorManager_startMonitoringReceiverSafetyCacheWithHandler___block_invoke_384(uint64_t a1, void *a2)
{
  id v4;
  __int128 v5;
  _QWORD v6[5];
  __int128 v7;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __72__SMSafetyMonitorManager_startMonitoringReceiverSafetyCacheWithHandler___block_invoke_2;
  v6[3] = &unk_25166EA90;
  v5 = *(_OWORD *)(a1 + 40);
  v4 = (id)v5;
  v7 = v5;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "startMonitoringReceiverSafetyCacheWithHandler:", v6);

}

void __72__SMSafetyMonitorManager_startMonitoringReceiverSafetyCacheWithHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  __CFString *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    if (a3)
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    v12 = 136446466;
    v13 = -[__CFString UTF8String](v11, "UTF8String");
    v14 = 2050;
    v15 = objc_msgSend(v7, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v9, OS_SIGNPOST_INTERVAL_END, v10, "SMStartMonitoringReceiverSafetyCache", " enableTelemetry=YES {phoneCache:%{public,signpost.telemetry:string1}s, error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v12, 0x16u);
  }

  if (v7)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "setReceiverSafetyCacheHandler:", 0);
  }

}

- (void)stopMonitoringReceiverSafetyCacheWithCompletion:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _BYTE *v16;
  _QWORD v17[4];
  id v18;
  _BYTE *v19;
  uint8_t buf[16];
  _BYTE v21[24];
  os_signpost_id_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v21 = 136315394;
      *(_QWORD *)&v21[4] = "-[SMSafetyMonitorManager stopMonitoringReceiverSafetyCacheWithCompletion:]";
      *(_WORD *)&v21[12] = 1024;
      *(_DWORD *)&v21[14] = 1751;
      _os_log_error_impl(&dword_245521000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: completion (in %s:%d)", v21, 0x12u);
    }

  }
  *(_QWORD *)v21 = 0;
  *(_QWORD *)&v21[8] = v21;
  *(_QWORD *)&v21[16] = 0x2020000000;
  v22 = 0;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  v22 = v8;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = *(_QWORD *)(*(_QWORD *)&v21[8] + 24);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_245521000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SMStopMonitoringReceiverSafetyCache", " enableTelemetry=YES ", buf, 2u);
  }

  -[SMSafetyMonitorManager setReceiverSafetyCacheHandler:](self, "setReceiverSafetyCacheHandler:", 0);
  v12 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __74__SMSafetyMonitorManager_stopMonitoringReceiverSafetyCacheWithCompletion___block_invoke;
  v17[3] = &unk_25166E4D8;
  v19 = v21;
  v18 = v5;
  v14[0] = v12;
  v14[1] = 3221225472;
  v14[2] = __74__SMSafetyMonitorManager_stopMonitoringReceiverSafetyCacheWithCompletion___block_invoke_386;
  v14[3] = &unk_25166E550;
  v16 = v21;
  v13 = v18;
  v15 = v13;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v17, v14);

  _Block_object_dispose(v21, 8);
}

void __74__SMSafetyMonitorManager_stopMonitoringReceiverSafetyCacheWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = 134349056;
    v8 = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMStopMonitoringReceiverSafetyCache", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__SMSafetyMonitorManager_stopMonitoringReceiverSafetyCacheWithCompletion___block_invoke_386(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __74__SMSafetyMonitorManager_stopMonitoringReceiverSafetyCacheWithCompletion___block_invoke_2;
  v5[3] = &unk_25166E4D8;
  v4 = *(_OWORD *)(a1 + 32);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(a2, "stopMonitoringReceiverSafetyCacheWithCompletion:", v5);

}

void __74__SMSafetyMonitorManager_stopMonitoringReceiverSafetyCacheWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = 134349056;
    v8 = objc_msgSend(v3, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v5, OS_SIGNPOST_INTERVAL_END, v6, "SMStopMonitoringReceiverSafetyCache", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)onReceiverSafetyCacheChangeForSessionID:(id)a3 phoneCache:(id)a4 watchCache:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  -[SMSafetyMonitorManager receiverSafetyCacheHandler](self, "receiverSafetyCacheHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SMSafetyMonitorManager receiverSafetyCacheHandler](self, "receiverSafetyCacheHandler");
    v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id, id, _QWORD))v11)[2](v11, v12, v8, v9, 0);

  }
}

- (void)detailsViewOpenedForSessionID:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[6];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[SMSafetyMonitorManager detailsViewOpenedForSessionID:]";
      v13 = 1024;
      v14 = 1779;
      _os_log_error_impl(&dword_245521000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionID (in %s:%d)", buf, 0x12u);
    }

  }
  v9 = v5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__SMSafetyMonitorManager_detailsViewOpenedForSessionID___block_invoke;
  v10[3] = &unk_25166E950;
  v10[4] = self;
  v10[5] = a2;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__SMSafetyMonitorManager_detailsViewOpenedForSessionID___block_invoke_387;
  v8[3] = &unk_25166E9C8;
  v7 = v5;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v10, v8);

}

void __56__SMSafetyMonitorManager_detailsViewOpenedForSessionID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_error_impl(&dword_245521000, v4, OS_LOG_TYPE_ERROR, "%@,%@,failed to find proxy,error,%@", (uint8_t *)&v8, 0x20u);

  }
}

uint64_t __56__SMSafetyMonitorManager_detailsViewOpenedForSessionID___block_invoke_387(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "detailsViewOpenedForSessionID:", *(_QWORD *)(a1 + 32));
}

- (void)checkInitiatorEligibilityWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[SMSafetyMonitorManager checkInitiatorEligibilityWithHandler:]";
      v15 = 1024;
      v16 = 1792;
      _os_log_error_impl(&dword_245521000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  v7 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __63__SMSafetyMonitorManager_checkInitiatorEligibilityWithHandler___block_invoke;
  v11[3] = &unk_25166E5A0;
  v12 = v5;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __63__SMSafetyMonitorManager_checkInitiatorEligibilityWithHandler___block_invoke_2;
  v9[3] = &unk_25166E680;
  v10 = v12;
  v8 = v12;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v11, v9);

}

uint64_t __63__SMSafetyMonitorManager_checkInitiatorEligibilityWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__SMSafetyMonitorManager_checkInitiatorEligibilityWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __63__SMSafetyMonitorManager_checkInitiatorEligibilityWithHandler___block_invoke_3;
  v3[3] = &unk_25166EAB8;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "checkInitiatorEligibilityWithHandler:", v3);

}

uint64_t __63__SMSafetyMonitorManager_checkInitiatorEligibilityWithHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)checkHasSimWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[SMSafetyMonitorManager checkHasSimWithHandler:]";
      v15 = 1024;
      v16 = 1805;
      _os_log_error_impl(&dword_245521000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  v7 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __49__SMSafetyMonitorManager_checkHasSimWithHandler___block_invoke;
  v11[3] = &unk_25166E5A0;
  v12 = v5;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __49__SMSafetyMonitorManager_checkHasSimWithHandler___block_invoke_2;
  v9[3] = &unk_25166E680;
  v10 = v12;
  v8 = v12;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v11, v9);

}

uint64_t __49__SMSafetyMonitorManager_checkHasSimWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __49__SMSafetyMonitorManager_checkHasSimWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __49__SMSafetyMonitorManager_checkHasSimWithHandler___block_invoke_3;
  v3[3] = &unk_25166EAE0;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "checkHasSimWithHandler:", v3);

}

uint64_t __49__SMSafetyMonitorManager_checkHasSimWithHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)checkConversationEligibility:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[SMSafetyMonitorManager checkConversationEligibility:handler:]";
    v22 = 1024;
    v23 = 1818;
    _os_log_error_impl(&dword_245521000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: conversation (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[SMSafetyMonitorManager checkConversationEligibility:handler:]";
      v22 = 1024;
      v23 = 1819;
      _os_log_error_impl(&dword_245521000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  v12 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __63__SMSafetyMonitorManager_checkConversationEligibility_handler___block_invoke;
  v18[3] = &unk_25166E5A0;
  v19 = v9;
  v15[0] = v12;
  v15[1] = 3221225472;
  v15[2] = __63__SMSafetyMonitorManager_checkConversationEligibility_handler___block_invoke_2;
  v15[3] = &unk_25166EA18;
  v16 = v7;
  v17 = v19;
  v13 = v19;
  v14 = v7;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v18, v15);

}

uint64_t __63__SMSafetyMonitorManager_checkConversationEligibility_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__SMSafetyMonitorManager_checkConversationEligibility_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __63__SMSafetyMonitorManager_checkConversationEligibility_handler___block_invoke_3;
  v4[3] = &unk_25166EAB8;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "checkConversationEligibility:handler:", v3, v4);

}

uint64_t __63__SMSafetyMonitorManager_checkConversationEligibility_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[SMSafetyMonitorManager fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:]";
      v15 = 1024;
      v16 = 1832;
      _os_log_error_impl(&dword_245521000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  v7 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __86__SMSafetyMonitorManager_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler___block_invoke;
  v11[3] = &unk_25166E5A0;
  v12 = v5;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __86__SMSafetyMonitorManager_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler___block_invoke_2;
  v9[3] = &unk_25166E680;
  v10 = v12;
  v8 = v12;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v11, v9);

}

uint64_t __86__SMSafetyMonitorManager_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __86__SMSafetyMonitorManager_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __86__SMSafetyMonitorManager_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler___block_invoke_3;
  v3[3] = &unk_25166EAB8;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "fetchDeviceConfigurationLowPowerModeWarningStateWithHandler:", v3);

}

uint64_t __86__SMSafetyMonitorManager_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)checkEligibilityOfDestination:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[SMSafetyMonitorManager checkEligibilityOfDestination:completionHandler:]";
    v23 = 1024;
    v24 = 1849;
    _os_log_error_impl(&dword_245521000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: destinationLocation (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[SMSafetyMonitorManager checkEligibilityOfDestination:completionHandler:]";
      v23 = 1024;
      v24 = 1850;
      _os_log_error_impl(&dword_245521000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  v12 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __74__SMSafetyMonitorManager_checkEligibilityOfDestination_completionHandler___block_invoke;
  v18[3] = &unk_25166E348;
  v20 = v9;
  v19 = v7;
  v15[0] = v12;
  v15[1] = 3221225472;
  v15[2] = __74__SMSafetyMonitorManager_checkEligibilityOfDestination_completionHandler___block_invoke_390;
  v15[3] = &unk_25166EA18;
  v16 = v19;
  v17 = v20;
  v13 = v20;
  v14 = v19;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v18, v15);

}

void __74__SMSafetyMonitorManager_checkEligibilityOfDestination_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315394;
      v6 = "-[SMSafetyMonitorManager checkEligibilityOfDestination:completionHandler:]_block_invoke";
      v7 = 2112;
      v8 = v3;
      _os_log_error_impl(&dword_245521000, v4, OS_LOG_TYPE_ERROR, "%s, failed to find proxy, error, %@", (uint8_t *)&v5, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __74__SMSafetyMonitorManager_checkEligibilityOfDestination_completionHandler___block_invoke_390(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "checkEligibilityOfDestination:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)calculateDistanceToDestination:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[SMSafetyMonitorManager calculateDistanceToDestination:completionHandler:]";
    v23 = 1024;
    v24 = 1868;
    _os_log_error_impl(&dword_245521000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: destinationLocation (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[SMSafetyMonitorManager calculateDistanceToDestination:completionHandler:]";
      v23 = 1024;
      v24 = 1869;
      _os_log_error_impl(&dword_245521000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  v12 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __75__SMSafetyMonitorManager_calculateDistanceToDestination_completionHandler___block_invoke;
  v18[3] = &unk_25166E348;
  v20 = v9;
  v19 = v7;
  v15[0] = v12;
  v15[1] = 3221225472;
  v15[2] = __75__SMSafetyMonitorManager_calculateDistanceToDestination_completionHandler___block_invoke_391;
  v15[3] = &unk_25166EA18;
  v16 = v19;
  v17 = v20;
  v13 = v20;
  v14 = v19;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v18, v15);

}

void __75__SMSafetyMonitorManager_calculateDistanceToDestination_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315394;
      v6 = "-[SMSafetyMonitorManager calculateDistanceToDestination:completionHandler:]_block_invoke";
      v7 = 2112;
      v8 = v3;
      _os_log_error_impl(&dword_245521000, v4, OS_LOG_TYPE_ERROR, "%s, failed to find proxy, error, %@", (uint8_t *)&v5, 0x16u);
    }

    (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))(1.79769313e308);
  }

}

uint64_t __75__SMSafetyMonitorManager_calculateDistanceToDestination_completionHandler___block_invoke_391(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "calculateDistanceToDestination:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)estimateEtaToDestination:(id)a3 transportType:(unint64_t)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _BYTE *v26;
  unint64_t v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _BYTE *v31;
  unint64_t v32;
  uint8_t buf[4];
  const char *v34;
  _BYTE v35[24];
  os_signpost_id_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v35 = 136315394;
      *(_QWORD *)&v35[4] = "-[SMSafetyMonitorManager estimateEtaToDestination:transportType:completionHandler:]";
      *(_WORD *)&v35[12] = 1024;
      *(_DWORD *)&v35[14] = 1888;
      _os_log_error_impl(&dword_245521000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: destinationLocation (in %s:%d)", v35, 0x12u);
    }

  }
  if (!a4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v35 = 136315394;
      *(_QWORD *)&v35[4] = "-[SMSafetyMonitorManager estimateEtaToDestination:transportType:completionHandler:]";
      *(_WORD *)&v35[12] = 1024;
      *(_DWORD *)&v35[14] = 1889;
      _os_log_error_impl(&dword_245521000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: transportType (in %s:%d)", v35, 0x12u);
    }

  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v35 = 136315394;
      *(_QWORD *)&v35[4] = "-[SMSafetyMonitorManager estimateEtaToDestination:transportType:completionHandler:]";
      *(_WORD *)&v35[12] = 1024;
      *(_DWORD *)&v35[14] = 1890;
      _os_log_error_impl(&dword_245521000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v35, 0x12u);
    }

  }
  *(_QWORD *)v35 = 0;
  *(_QWORD *)&v35[8] = v35;
  *(_QWORD *)&v35[16] = 0x2020000000;
  v36 = 0;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_signpost_id_generate(v14);

  v36 = v15;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  v18 = *(_QWORD *)(*(_QWORD *)&v35[8] + 24);
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_245521000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v18, "SMEstimateETAToDestination", " enableTelemetry=YES ", buf, 2u);
  }

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v34 = "-[SMSafetyMonitorManager estimateEtaToDestination:transportType:completionHandler:]";
    _os_log_impl(&dword_245521000, v19, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  v20 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __83__SMSafetyMonitorManager_estimateEtaToDestination_transportType_completionHandler___block_invoke;
  v28[3] = &unk_25166EB08;
  v31 = v35;
  v30 = v10;
  v29 = v9;
  v32 = a4;
  v23[0] = v20;
  v23[1] = 3221225472;
  v23[2] = __83__SMSafetyMonitorManager_estimateEtaToDestination_transportType_completionHandler___block_invoke_392;
  v23[3] = &unk_25166E578;
  v21 = v29;
  v26 = v35;
  v27 = a4;
  v24 = v21;
  v22 = v30;
  v25 = v22;
  -[SMSafetyMonitorManager launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:](self, "launchTaskWithSelector:remainingAttempts:proxyErrorHandler:taskBlock:", a2, 3, v28, v23);

  _Block_object_dispose(v35, 8);
}

void __83__SMSafetyMonitorManager_estimateEtaToDestination_transportType_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[SMSafetyMonitorManager estimateEtaToDestination:transportType:completionHandler:]_block_invoke";
      v11 = 2112;
      v12 = v3;
      _os_log_error_impl(&dword_245521000, v4, OS_LOG_TYPE_ERROR, "%s, failed to find proxy, error, %@", (uint8_t *)&v9, 0x16u);
    }

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      v8 = objc_msgSend(v3, "code");
      v9 = 134349056;
      v10 = (const char *)v8;
      _os_signpost_emit_with_name_impl(&dword_245521000, v6, OS_SIGNPOST_INTERVAL_END, v7, "SMEstimateETAToDestination", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v9, 0xCu);
    }

    (*(void (**)(double, double))(*(_QWORD *)(a1 + 40) + 16))(-1.0, -1.0);
  }

}

void __83__SMSafetyMonitorManager_estimateEtaToDestination_transportType_completionHandler___block_invoke_392(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  __int128 v6;
  _QWORD v7[4];
  __int128 v8;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 56);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __83__SMSafetyMonitorManager_estimateEtaToDestination_transportType_completionHandler___block_invoke_2;
  v7[3] = &unk_25166EB30;
  v6 = *(_OWORD *)(a1 + 40);
  v5 = (id)v6;
  v8 = v6;
  objc_msgSend(a2, "estimateEtaToDestination:transportType:completionHandler:", v3, v4, v7);

}

void __83__SMSafetyMonitorManager_estimateEtaToDestination_transportType_completionHandler___block_invoke_2(uint64_t a1, void *a2, double a3, double a4, uint64_t a5, void *a6)
{
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  v11 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitorAnalytics);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v15 = 134349056;
    v16 = objc_msgSend(v10, "code");
    _os_signpost_emit_with_name_impl(&dword_245521000, v13, OS_SIGNPOST_INTERVAL_END, v14, "SMEstimateETAToDestination", " enableTelemetry=YES {error:%{public,signpost.telemetry:number1}ld}", (uint8_t *)&v15, 0xCu);
  }

  (*(void (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(a3, a4);
}

- (int64_t)prepareUserInfoForNotificationContent:(id)a3 initiatorHandle:(id)a4 messageUrl:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  int64_t v18;
  unint64_t v19;
  NSObject *v20;
  _BOOL4 v21;
  objc_class *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  objc_class *v28;
  NSObject *v29;
  void *v30;
  int64_t v31;
  NSObject *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  objc_class *v37;
  void *v38;
  void *v39;
  const char *v40;
  objc_class *v41;
  objc_class *v42;
  void *v43;
  SMSafetyMonitorManager *v44;
  const char *v45;
  id v46;
  void *v47;
  dispatch_semaphore_t v48;
  void *v49;
  id v50;
  NSObject *v51;
  id v52;
  NSObject *v53;
  void *v54;
  dispatch_time_t v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id v70;
  id v71;
  int64_t v72;
  int64_t v73;
  id v74;
  id v75;
  _QWORD v76[4];
  id v77;
  SMSafetyMonitorManager *v78;
  NSObject *v79;
  id v80;
  SEL v81;
  _BYTE buf[12];
  __int16 v83;
  void *v84;
  __int16 v85;
  id v86;
  __int16 v87;
  void *v88;
  _QWORD v89[3];

  v89[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v10)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SMSafetyMonitorManager prepareUserInfoForNotificationContent:initiatorHandle:messageUrl:]";
      v83 = 1024;
      LODWORD(v84) = 1917;
      _os_log_error_impl(&dword_245521000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: initiatorHandle (in %s:%d)", buf, 0x12u);
    }

    if (v9)
    {
LABEL_3:
      if (v11)
        goto LABEL_14;
      goto LABEL_11;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SMSafetyMonitorManager prepareUserInfoForNotificationContent:initiatorHandle:messageUrl:]";
    v83 = 1024;
    LODWORD(v84) = 1918;
    _os_log_error_impl(&dword_245521000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: content (in %s:%d)", buf, 0x12u);
  }

  if (!v11)
  {
LABEL_11:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SMSafetyMonitorManager prepareUserInfoForNotificationContent:initiatorHandle:messageUrl:]";
      v83 = 1024;
      LODWORD(v84) = 1919;
      _os_log_error_impl(&dword_245521000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: messageUrl (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_14:
  +[SMMessage createMessageFromURL:](SMMessage, "createMessageFromURL:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend((id)objc_opt_class(), "messageType");
  if (v16 == 2)
  {
    v19 = +[SMSessionEndMessage sessionEndReasonFromURL:](SMSessionEndMessage, "sessionEndReasonFromURL:", v11);
    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v19 == 4)
    {
      if (v21)
      {
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v23;
        v83 = 2112;
        v84 = v24;
        _os_log_impl(&dword_245521000, v20, OS_LOG_TYPE_DEFAULT, "#NotificationDeliveryRequest,%@,%@, Session ended due to SafetyCheck, suppress notification", buf, 0x16u);

      }
      v18 = 2;
    }
    else
    {
      if (v21)
      {
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v26;
        v83 = 2112;
        v84 = v27;
        _os_log_impl(&dword_245521000, v20, OS_LOG_TYPE_DEFAULT, "#NotificationDeliveryRequest,%@,%@, Session ended due to unhandled reason, use default delivery mechanism", buf, 0x16u);

      }
      v18 = 0;
    }

    goto LABEL_28;
  }
  if (v16 != 3)
  {
    v18 = 0;
LABEL_28:
    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      goto LABEL_46;
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v29 = objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v29;
    v83 = 2112;
    v84 = v30;
    _os_log_impl(&dword_245521000, v17, OS_LOG_TYPE_DEFAULT, "#NotificationDeliveryRequest,%@,%@, Not a trigger message, use default delivery mechanism", buf, 0x16u);
    goto LABEL_44;
  }
  v17 = v15;
  if ((unint64_t)(-[NSObject triggerType](v17, "triggerType") - 10) < 5
    || (-[NSObject isSOSTrigger](v17, "isSOSTrigger") & 1) != 0)
  {
    v18 = 2;
    goto LABEL_42;
  }
  objc_msgSend(v9, "setInterruptionLevel:", 2);
  v31 = +[SMMobileSMSPreferencesUtilities criticalAlertPreference](SMMobileSMSPreferencesUtilities, "criticalAlertPreference");
  if (v31 == 2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v37 = (objc_class *)objc_opt_class();
      NSStringFromClass(v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v38;
      v83 = 2112;
      v84 = v39;
      v40 = "#NotificationDeliveryRequest,%@,%@, User opted out of Critical Alerst, falling back to Notify Anyway + Time Sensitive";
LABEL_39:
      _os_log_impl(&dword_245521000, v32, OS_LOG_TYPE_DEFAULT, v40, buf, 0x16u);

    }
  }
  else
  {
    if (v31 == 1)
    {
      objc_msgSend(v9, "setInterruptionLevel:", 3);
      _rt_log_facility_get_os_log(RTLogFacilityFramework);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v34;
        v83 = 2112;
        v84 = v35;
        _os_log_impl(&dword_245521000, v32, OS_LOG_TYPE_DEFAULT, "#NotificationDeliveryRequest,%@,%@, User opted in for Critical Alert", buf, 0x16u);

      }
      v36 = 0;
      goto LABEL_41;
    }
    _rt_log_facility_get_os_log(RTLogFacilityFramework);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v41 = (objc_class *)objc_opt_class();
      NSStringFromClass(v41);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v38;
      v83 = 2112;
      v84 = v39;
      v40 = "#NotificationDeliveryRequest,%@,%@, Couldn't look up the the SafetyMonitorUsesCriticalAlertsKey in UserDefau"
            "lts. Perhaps user isn't on-boarded yet!";
      goto LABEL_39;
    }
  }
  v36 = 1;
LABEL_41:

  v18 = v36;
LABEL_42:
  objc_msgSend(v9, "setContentType:", *MEMORY[0x24BDF8B08]);
  _rt_log_facility_get_os_log(RTLogFacilityFramework);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v42 = (objc_class *)objc_opt_class();
    NSStringFromClass(v42);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v72 = v18;
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentType");
    v74 = v10;
    v44 = self;
    v45 = a2;
    v46 = v11;
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v30;
    v83 = 2112;
    v84 = v43;
    v85 = 2112;
    v86 = v9;
    v87 = 2112;
    v88 = v47;
    _os_log_impl(&dword_245521000, v29, OS_LOG_TYPE_DEFAULT, "#NotificationDeliveryRequest,%@,%@, content, %@, contentType, %@", buf, 0x2Au);

    v11 = v46;
    a2 = v45;
    self = v44;
    v10 = v74;

    v18 = v72;
LABEL_44:

  }
LABEL_46:

  v48 = dispatch_semaphore_create(0);
  objc_msgSend(v15, "sessionID");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = MEMORY[0x24BDAC760];
  v76[1] = 3221225472;
  v76[2] = __91__SMSafetyMonitorManager_prepareUserInfoForNotificationContent_initiatorHandle_messageUrl___block_invoke;
  v76[3] = &unk_25166EB80;
  v50 = v15;
  v77 = v50;
  v78 = self;
  v81 = a2;
  v51 = v48;
  v79 = v51;
  v52 = v9;
  v80 = v52;
  -[SMSafetyMonitorManager fetchReceiverSessionStatusForSessionID:completion:](self, "fetchReceiverSessionStatusForSessionID:completion:", v49, v76);

  v53 = v51;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v53, v55))
  {
    v70 = v50;
    v71 = v11;
    v73 = v18;
    v75 = v10;
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "timeIntervalSinceDate:", v54);
    v58 = v57;
    v59 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_482);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "filteredArrayUsingPredicate:", v60);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "firstObject");
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v59, "submitToCoreAnalytics:type:duration:", v63, 1, v58);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_245521000, v64, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v65 = (void *)MEMORY[0x24BDD1540];
    v66 = *MEMORY[0x24BE27EE8];
    v89[0] = *MEMORY[0x24BDD0FC8];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, v89, 1);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "errorWithDomain:code:userInfo:", v66, 15, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v73;
    v10 = v75;
    v50 = v70;
    v11 = v71;
    if (v68)

  }
  return v18;
}

void __91__SMSafetyMonitorManager_prepareUserInfoForNotificationContent_initiatorHandle_messageUrl___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  uint64_t v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "sessionID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v33 = v8;
      v34 = 2112;
      v35 = v10;
      v36 = 2112;
      v37 = v11;
      v38 = 2112;
      v39 = v6;
      _os_log_error_impl(&dword_245521000, v7, OS_LOG_TYPE_ERROR, "#NotificationDeliveryRequest,Receiver,sessionID:%@,%@,%@,couldn't fetch receiver session status with error %@", buf, 0x2Au);

    }
LABEL_10:

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
    goto LABEL_11;
  }
  objc_msgSend(*(id *)(a1 + 32), "sessionID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqual:", v13);

  if ((v14 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "sessionID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sessionID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v33 = v21;
      v34 = 2112;
      v35 = v22;
      v36 = 2112;
      v37 = v23;
      v38 = 2112;
      v39 = v24;
      _os_log_error_impl(&dword_245521000, v19, OS_LOG_TYPE_ERROR, "#NotificationDeliveryRequest,Receiver,%@,%@,sessionID:%@, mismatched with receiver session status sessionID %@", buf, 0x2Au);

    }
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v33 = v26;
      v34 = 2112;
      v35 = v27;
      _os_log_fault_impl(&dword_245521000, v7, OS_LOG_TYPE_FAULT, "#NotificationDeliveryRequest,Receiver,%@,%@, Incoming message's sessionID mismatched with receiver session status sessionID", buf, 0x16u);

    }
    goto LABEL_10;
  }
  v15 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "destinationMapItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x24BDAC760];
  v28[2] = __91__SMSafetyMonitorManager_prepareUserInfoForNotificationContent_initiatorHandle_messageUrl___block_invoke_398;
  v28[3] = &unk_25166EB58;
  v18 = *(void **)(a1 + 56);
  v17 = *(_QWORD *)(a1 + 64);
  v28[4] = *(_QWORD *)(a1 + 40);
  v31 = v17;
  v28[1] = 3221225472;
  v29 = v18;
  v30 = *(id *)(a1 + 48);
  +[SMReceiverNotificationUtilities prepareNotificationBodyFromMessage:destinationMapItem:completionHandler:](SMReceiverNotificationUtilities, "prepareNotificationBodyFromMessage:destinationMapItem:completionHandler:", v15, v16, v28);

LABEL_11:
}

void __91__SMSafetyMonitorManager_prepareUserInfoForNotificationContent_initiatorHandle_messageUrl___block_invoke_398(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      v15 = 2112;
      v16 = v6;
      _os_log_error_impl(&dword_245521000, v7, OS_LOG_TYPE_ERROR, "#NotificationDeliveryRequest,Receiver,%@,%@, error while fetching notification body: %@", (uint8_t *)&v11, 0x20u);

    }
  }
  else
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 40), "setBody:", v5);
      goto LABEL_7;
    }
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_error_impl(&dword_245521000, v7, OS_LOG_TYPE_ERROR, "#NotificationDeliveryRequest,Receiver, notification body is empty", (uint8_t *)&v11, 2u);
    }
  }

LABEL_7:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

- (void)respondToNotificationWithIdentifier:(id)a3 sessionIdentifier:(id)a4 actionIdentifier:(id)a5 handler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  SEL v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  -[SMSafetyMonitorManager queue](self, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __105__SMSafetyMonitorManager_respondToNotificationWithIdentifier_sessionIdentifier_actionIdentifier_handler___block_invoke;
  v20[3] = &unk_25166EBA8;
  v24 = v14;
  v25 = a2;
  v20[4] = self;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v16 = v13;
  v17 = v12;
  v18 = v11;
  v19 = v14;
  dispatch_async(v15, v20);

}

void __105__SMSafetyMonitorManager_respondToNotificationWithIdentifier_sessionIdentifier_actionIdentifier_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __105__SMSafetyMonitorManager_respondToNotificationWithIdentifier_sessionIdentifier_actionIdentifier_handler___block_invoke_2;
  v5[3] = &unk_25166E5A0;
  v3 = *(_QWORD *)(a1 + 72);
  v6 = *(id *)(a1 + 64);
  objc_msgSend(v2, "_proxyForServicingSelector:withErrorHandler:", v3, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondToNotificationWithIdentifier:sessionIdentifier:actionIdentifier:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

uint64_t __105__SMSafetyMonitorManager_respondToNotificationWithIdentifier_sessionIdentifier_actionIdentifier_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)shouldDropMessage:(id)a3 from:(id)a4 fromMe:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  NSObject *v21;
  NSObject *v22;
  objc_class *v23;
  char *v24;
  void *v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  BOOL v29;
  objc_class *v30;
  char *v31;
  void *v32;
  const char *v33;
  objc_class *v34;
  NSObject *v35;
  uint32_t v36;
  objc_class *v38;
  objc_class *v39;
  char *v40;
  void *v41;
  objc_class *v42;
  int v43;
  const char *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  double v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v43 = 136315394;
    v44 = "-[SMSafetyMonitorManager shouldDropMessage:from:fromMe:]";
    v45 = 1024;
    LODWORD(v46) = 2030;
    _os_log_error_impl(&dword_245521000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: messageUrl (in %s:%d)", (uint8_t *)&v43, 0x12u);
  }

  if (!v10)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v43 = 136315394;
      v44 = "-[SMSafetyMonitorManager shouldDropMessage:from:fromMe:]";
      v45 = 1024;
      LODWORD(v46) = 2031;
      _os_log_error_impl(&dword_245521000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: from (in %s:%d)", (uint8_t *)&v43, 0x12u);
    }

  }
LABEL_10:
  v13 = +[SMMessage messageTypeFromURL:](SMMessage, "messageTypeFromURL:", v8);
  if (+[SMMessage interfaceTypeFromMessageType:](SMMessage, "interfaceTypeFromMessageType:", v13) == 1)
  {
    +[SMMessage createMessageFromURL:](SMMessage, "createMessageFromURL:", v8);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!v14)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v42 = (objc_class *)objc_opt_class();
        NSStringFromClass(v42);
        v24 = (char *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 138413058;
        v44 = v24;
        v45 = 2112;
        v46 = v25;
        v47 = 2112;
        v48 = *(double *)&v10;
        v49 = 2112;
        v50 = v8;
        v26 = "%@,%@,received message from %@ could not be converted to SMMessage,messageUrl,%@";
        v27 = v22;
        v28 = 42;
        goto LABEL_34;
      }
LABEL_21:
      v29 = 1;
LABEL_29:

      goto LABEL_30;
    }
    if (v13 == 3)
    {
      if (-[NSObject triggerType](v14, "triggerType") == 15)
      {
        v16 = (void *)MEMORY[0x24BDBCE60];
        -[SMSafetyMonitorManager requestTimeFromTimed](self, "requestTimeFromTimed");
        objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject triggerDate](v15, "triggerDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "timeIntervalSinceDate:", v18);
        v20 = v19;

        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v20 < -10.0)
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            v23 = (objc_class *)objc_opt_class();
            NSStringFromClass(v23);
            v24 = (char *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = 138412802;
            v44 = v24;
            v45 = 2112;
            v46 = v25;
            v47 = 2048;
            v48 = fabs(v20);
            v26 = "%@,%@,schedule send message time cross-check failed,arrived early by %lf seconds,drop message";
            v27 = v22;
            v28 = 32;
LABEL_34:
            _os_log_error_impl(&dword_245521000, v27, OS_LOG_TYPE_ERROR, v26, (uint8_t *)&v43, v28);

            goto LABEL_21;
          }
          goto LABEL_21;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v38 = (objc_class *)objc_opt_class();
          NSStringFromClass(v38);
          v31 = (char *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = 138412802;
          v44 = v31;
          v45 = 2112;
          v46 = v32;
          v47 = 2048;
          v48 = v20;
          v33 = "%@,%@,schedule send message time cross-check passed,time difference is %lf seconds";
          v35 = v22;
          v36 = 32;
          goto LABEL_27;
        }
LABEL_28:
        v29 = 0;
        goto LABEL_29;
      }
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        goto LABEL_28;
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v31 = (char *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 138412546;
      v44 = v31;
      v45 = 2112;
      v46 = v32;
      v33 = "%@,%@,message is valid non-Scheduled-Send Key Release message";
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        goto LABEL_28;
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (char *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 138412546;
      v44 = v31;
      v45 = 2112;
      v46 = v32;
      v33 = "%@,%@,message is valid and not a Key Release message";
    }
    v35 = v22;
    v36 = 22;
LABEL_27:
    _os_log_impl(&dword_245521000, v35, OS_LOG_TYPE_DEFAULT, v33, (uint8_t *)&v43, v36);

    goto LABEL_28;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v39 = (objc_class *)objc_opt_class();
    NSStringFromClass(v39);
    v40 = (char *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 138412802;
    v44 = v40;
    v45 = 2112;
    v46 = v41;
    v47 = 1024;
    LODWORD(v48) = v13;
    _os_log_error_impl(&dword_245521000, v15, OS_LOG_TYPE_ERROR, "%@,%@,message type (%d) is either unrecognized or not expected as an iMessage", (uint8_t *)&v43, 0x1Cu);

  }
  v29 = 1;
LABEL_30:

  return v29;
}

- (double)requestTimeFromTimed
{
  NSObject *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v11;
  void *v12;
  void *v13;
  double Current;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  TMGetReferenceTime();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v16 = v12;
    v17 = 2112;
    v18 = v13;
    _os_log_error_impl(&dword_245521000, v3, OS_LOG_TYPE_ERROR, "%@,%@,TMGetReferenceTime returned invalid time, using time from CFAbsoluteTimeGetCurrent", buf, 0x16u);

  }
  Current = CFAbsoluteTimeGetCurrent();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", Current);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringFromDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    v19 = 2112;
    v20 = v9;
    v21 = 2048;
    v22 = 0;
    _os_log_impl(&dword_245521000, v4, OS_LOG_TYPE_INFO, "%@,%@,referenceTime:%@,referenceTimeUnc:%f", buf, 0x2Au);

  }
  return Current;
}

- (void)submitInitializationAnalyticsEventWithError:(id)a3 conversation:(id)a4 duration:(double)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("initializationDuration"));

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "code"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("errorCodeEnum"));

    v12 = MEMORY[0x24BDBD1C0];
  }
  else
  {
    v12 = MEMORY[0x24BDBD1C8];
  }
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("success"));
  v13 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v8, "receiverHandles");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("numRecepients"));

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = 136315650;
    v18 = "-[SMSafetyMonitorManager submitInitializationAnalyticsEventWithError:conversation:duration:]";
    v19 = 2112;
    v20 = CFSTR("com.apple.SafetyMonitor.initiator.initializationResult");
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_245521000, v16, OS_LOG_TYPE_INFO, "%s, event name, %@, event, %@", (uint8_t *)&v17, 0x20u);
  }

  AnalyticsSendEvent();
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (NSString)restorationIdentifier
{
  return self->_restorationIdentifier;
}

- (void)setRestorationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_restorationIdentifier, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (SMHeartbeatTimer)heartbeatTimer
{
  return self->_heartbeatTimer;
}

- (void)setHeartbeatTimer:(id)a3
{
  objc_storeStrong((id *)&self->_heartbeatTimer, a3);
}

- (id)initiatorSafetyCacheHandler
{
  return self->_initiatorSafetyCacheHandler;
}

- (void)setInitiatorSafetyCacheHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)sessionStateHandler
{
  return self->_sessionStateHandler;
}

- (void)setSessionStateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)localSessionStateHandler
{
  return self->_localSessionStateHandler;
}

- (void)setLocalSessionStateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)receiverSessionStatusHandler
{
  return self->_receiverSessionStatusHandler;
}

- (void)setReceiverSessionStatusHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)receiverSafetyCacheHandler
{
  return self->_receiverSafetyCacheHandler;
}

- (void)setReceiverSafetyCacheHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_receiverSafetyCacheHandler, 0);
  objc_storeStrong(&self->_receiverSessionStatusHandler, 0);
  objc_storeStrong(&self->_localSessionStateHandler, 0);
  objc_storeStrong(&self->_sessionStateHandler, 0);
  objc_storeStrong(&self->_initiatorSafetyCacheHandler, 0);
  objc_storeStrong((id *)&self->_heartbeatTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_restorationIdentifier, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
