@implementation SASMyriadController

void __40__SASMyriadController_initWithDelegate___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    if (objc_msgSend(v8, "backlightState") == 2)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(WeakRetained, "_updateRaiseToWakeTimeForTransition:", v9);

    }
    else
    {
      v11 = *MEMORY[0x1E0CFE6A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315394;
        v13 = "-[SASMyriadController initWithDelegate:]_block_invoke";
        v14 = 2112;
        v15 = v9;
        _os_log_impl(&dword_1D132F000, v11, OS_LOG_TYPE_DEFAULT, "%s #myriad BTLE observerCalled. Screen is not activeOn. Ignoring transition=%@", (uint8_t *)&v12, 0x16u);
      }
    }
  }

}

- (void)_updateRaiseToWakeTimeForTransition:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  double v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v6 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315394;
    v12 = "-[SASMyriadController _updateRaiseToWakeTimeForTransition:]";
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1D132F000, v6, OS_LOG_TYPE_DEFAULT, "%s #myriad BTLE observerCalled transition=%@", (uint8_t *)&v11, 0x16u);
  }
  objc_msgSend(v4, "transitionReasons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "containsObject:", *MEMORY[0x1E0DAB158]) & 1) != 0
    || (objc_msgSend(v7, "containsObject:", *MEMORY[0x1E0DAB160]) & 1) != 0
    || (objc_msgSend(v7, "containsObject:", *MEMORY[0x1E0DAB168]) & 1) != 0
    || (objc_msgSend(v7, "containsObject:", *MEMORY[0x1E0DAB170]) & 1) != 0
    || (objc_msgSend(v7, "containsObject:", *MEMORY[0x1E0DAB180]) & 1) != 0
    || objc_msgSend(v7, "containsObject:", *MEMORY[0x1E0DAB188]))
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "systemUptime");
    self->_raiseToWakeTime = v9;

    v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315138;
      v12 = "-[SASMyriadController _updateRaiseToWakeTimeForTransition:]";
      _os_log_impl(&dword_1D132F000, v10, OS_LOG_TYPE_DEFAULT, "%s #myriad BTLE wake gesture noted", (uint8_t *)&v11, 0xCu);
    }
  }

}

- (SASMyriadController)initWithDelegate:(id)a3
{
  id v4;
  SASMyriadController *v5;
  id inited;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  FBSDisplayLayoutMonitor *displayMonitor;
  SASLockStateMonitor *v13;
  SASLockStateMonitor *lockStateMonitor;
  uint64_t v15;
  SCDACoordinator *scdaCoordinator;
  uint64_t v17;
  void *v18;
  objc_class *v19;
  id v20;
  void *v21;
  objc_class *v22;
  AWAttentionAwarenessClient *v23;
  AWAttentionAwarenessClient *attentionClient;
  NSObject *v25;
  NSObject *v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *myriadAttentionQueue;
  uint64_t v29;
  TRIClient *trialClient;
  id *v31;
  os_signpost_id_t v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, void *, void *, void *);
  void *v41;
  id v42;
  id location;
  objc_super v44;
  uint8_t buf[8];
  uint64_t v46;
  void (*v47)(uint64_t);
  void *v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;

  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)SASMyriadController;
  v5 = -[SASMyriadController init](&v44, sel_init);
  if (v5)
  {
    inited = objc_initWeak(&location, v5);
    v5->_activityManagerLock._os_unfair_lock_opaque = 0;
    v7 = inited;
    -[SASMyriadController _configureMotionActivityManager](v5, "_configureMotionActivityManager");

    objc_msgSend(MEMORY[0x1E0D230E8], "configurationForDefaultMainDisplayMonitor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v38 = MEMORY[0x1E0C809B0];
    v39 = 3221225472;
    v40 = __40__SASMyriadController_initWithDelegate___block_invoke;
    v41 = &unk_1E91FBF90;
    objc_copyWeak(&v42, &location);
    v10 = _Block_copy(&v38);
    objc_msgSend(v8, "setTransitionHandler:", v10, v38, v39, v40, v41);
    objc_msgSend(MEMORY[0x1E0D230D8], "monitorWithConfiguration:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    displayMonitor = v5->_displayMonitor;
    v5->_displayMonitor = (FBSDisplayLayoutMonitor *)v11;

    v13 = objc_alloc_init(SASLockStateMonitor);
    lockStateMonitor = v5->_lockStateMonitor;
    v5->_lockStateMonitor = v13;

    -[SASLockStateMonitor setDelegate:](v5->_lockStateMonitor, "setDelegate:", v5);
    v5->_isLocked = 0;
    if (AFSupportsSCDAFramework())
    {
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D97CE0]), "initWithDelegate:", v5);
      scdaCoordinator = v5->_scdaCoordinator;
      v5->_scdaCoordinator = (SCDACoordinator *)v15;
    }
    else
    {
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFE938]), "initWithDelegate:", v5);
      scdaCoordinator = v5->_myriadCoordinator;
      v5->_myriadCoordinator = (AFMyriadCoordinator *)v17;
    }

    v50 = 0;
    v51 = &v50;
    v52 = 0x2050000000;
    v18 = (void *)getAWAttentionAwarenessConfigurationClass_softClass;
    v53 = getAWAttentionAwarenessConfigurationClass_softClass;
    if (!getAWAttentionAwarenessConfigurationClass_softClass)
    {
      *(_QWORD *)buf = v9;
      v46 = 3221225472;
      v47 = __getAWAttentionAwarenessConfigurationClass_block_invoke;
      v48 = &unk_1E91FC090;
      v49 = &v50;
      __getAWAttentionAwarenessConfigurationClass_block_invoke((uint64_t)buf);
      v18 = (void *)v51[3];
    }
    v19 = objc_retainAutorelease(v18);
    _Block_object_dispose(&v50, 8);
    v20 = objc_alloc_init(v19);
    objc_msgSend(v20, "setIdentifier:", CFSTR("com.apple.siri.SASMyriadController"));
    objc_msgSend(v20, "setEventMask:", 128);
    v50 = 0;
    v51 = &v50;
    v52 = 0x2050000000;
    v21 = (void *)getAWAttentionAwarenessClientClass_softClass;
    v53 = getAWAttentionAwarenessClientClass_softClass;
    if (!getAWAttentionAwarenessClientClass_softClass)
    {
      *(_QWORD *)buf = v9;
      v46 = 3221225472;
      v47 = __getAWAttentionAwarenessClientClass_block_invoke;
      v48 = &unk_1E91FC090;
      v49 = &v50;
      __getAWAttentionAwarenessClientClass_block_invoke((uint64_t)buf);
      v21 = (void *)v51[3];
    }
    v22 = objc_retainAutorelease(v21);
    _Block_object_dispose(&v50, 8);
    v23 = (AWAttentionAwarenessClient *)objc_alloc_init(v22);
    attentionClient = v5->_attentionClient;
    v5->_attentionClient = v23;

    -[AWAttentionAwarenessClient setConfiguration:](v5->_attentionClient, "setConfiguration:", v20);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v25 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v25, QOS_CLASS_USER_INTERACTIVE, 0);
    v26 = objc_claimAutoreleasedReturnValue();

    v27 = dispatch_queue_create("com.apple.myriad_attention", v26);
    myriadAttentionQueue = v5->_myriadAttentionQueue;
    v5->_myriadAttentionQueue = (OS_dispatch_queue *)v27;

    objc_storeWeak((id *)&v5->_delegate, v4);
    objc_destroyWeak(&v42);

    objc_destroyWeak(&location);
  }
  objc_msgSend(MEMORY[0x1E0DC09C8], "clientWithIdentifier:", 294);
  v29 = objc_claimAutoreleasedReturnValue();
  trialClient = v5->_trialClient;
  v5->_trialClient = (TRIClient *)v29;

  v31 = (id *)MEMORY[0x1E0CFE6B8];
  v32 = os_signpost_id_generate((os_log_t)*MEMORY[0x1E0CFE6B8]);
  v33 = *v31;
  v34 = v33;
  if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D132F000, v34, OS_SIGNPOST_INTERVAL_BEGIN, v32, "SASMyriadController._cacheFactors", (const char *)&unk_1D1381C6B, buf, 2u);
  }

  -[SASMyriadController _cacheFactors](v5, "_cacheFactors");
  v35 = *v31;
  v36 = v35;
  if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D132F000, v36, OS_SIGNPOST_INTERVAL_END, v32, "SASMyriadController._cacheFactors", (const char *)&unk_1D1381C6B, buf, 2u);
  }

  -[SASMyriadController _setupTrialRefresh](v5, "_setupTrialRefresh");
  return v5;
}

- (void)_cacheFactors
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v3 = (id)-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("WAKE_BOOST_TRIAL_ENABLE"), CFSTR("MYRIAD_BOOSTS"));
  v4 = (id)-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("MOTION_BOOST_TRIAL_ENABLE"), CFSTR("MYRIAD_BOOSTS"));
  v5 = (id)-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("UNLOCK_BOOST_TRIAL_ENABLE"), CFSTR("MYRIAD_BOOSTS"));
  v6 = (id)-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("WAKE_BOOST_SECOND_DEGREE_COEFF"), CFSTR("MYRIAD_BOOSTS"));
  v7 = (id)-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("WAKE_BOOST_FIRST_DEGREE_COEFF"), CFSTR("MYRIAD_BOOSTS"));
  v8 = (id)-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("WAKE_BOOST_INTERCEPT"), CFSTR("MYRIAD_BOOSTS"));
  v9 = (id)-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("MOTION_BOOST_SECOND_DEGREE_COEFF"), CFSTR("MYRIAD_BOOSTS"));
  v10 = (id)-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("MOTION_BOOST_FIRST_DEGREE_COEFF"), CFSTR("MYRIAD_BOOSTS"));
  v11 = (id)-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("MOTION_BOOST_INTERCEPT"), CFSTR("MYRIAD_BOOSTS"));
  v12 = (id)-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("UNLOCK_SECOND_DEGREE_COEFF"), CFSTR("MYRIAD_BOOSTS"));
  v13 = (id)-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("UNLOCK_FIRST_DEGREE_COEFF"), CFSTR("MYRIAD_BOOSTS"));
  v14 = (id)-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("UNLOCK_BOOST_INTERCEPT"), CFSTR("MYRIAD_BOOSTS"));
}

- (void)_setupTrialRefresh
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  OS_dispatch_queue *v6;
  OS_dispatch_queue *trialRefreshQueue;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  SASMyriadController *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[SASMyriadController _setupTrialRefresh]";
    _os_log_impl(&dword_1D132F000, v3, OS_LOG_TYPE_INFO, "%s Registering update handler", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __41__SASMyriadController__setupTrialRefresh__block_invoke;
  v12 = &unk_1E91FBFB8;
  objc_copyWeak(&v14, (id *)buf);
  v13 = self;
  v4 = _Block_copy(&v9);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (OS_dispatch_queue *)dispatch_queue_create("SASMyriadController", v5);

  trialRefreshQueue = self->_trialRefreshQueue;
  self->_trialRefreshQueue = v6;

  v8 = (id)-[TRIClient addUpdateHandlerForNamespaceName:queue:usingBlock:](self->_trialClient, "addUpdateHandlerForNamespaceName:queue:usingBlock:", CFSTR("MYRIAD_BOOSTS"), self->_trialRefreshQueue, v4, v9, v10, v11, v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __41__SASMyriadController__setupTrialRefresh__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id *WeakRetained;
  id *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[SASMyriadController _setupTrialRefresh]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1D132F000, v4, OS_LOG_TYPE_INFO, "%s Myriad Trial boosts updated: %@", (uint8_t *)&v7, 0x16u);
  }
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[3], "refresh");
    objc_msgSend(*(id *)(a1 + 32), "_cacheFactors");
  }

}

- (void)dealloc
{
  objc_super v3;

  -[FBSDisplayLayoutMonitor invalidate](self->_displayMonitor, "invalidate");
  -[CMMotionActivityManager stopActivityUpdates](self->_activityManager, "stopActivityUpdates");
  v3.receiver = self;
  v3.super_class = (Class)SASMyriadController;
  -[SASMyriadController dealloc](&v3, sel_dealloc);
}

- (void)setCanceledByMyriad:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[SASMyriadController setCanceledByMyriad:]";
    v8 = 1024;
    v9 = v3;
    _os_log_impl(&dword_1D132F000, v5, OS_LOG_TYPE_DEFAULT, "%s #myriad setCanceledByMyriad: %d", (uint8_t *)&v6, 0x12u);
  }
  self->_canceledByMyriad = v3;
}

- (BOOL)activateForRequest:(id)a3 visible:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  int v8;
  id v9;
  double v10;
  void *v11;
  BOOL v12;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "isVoiceRequest")
    && (+[SASSystemState sharedSystemState](SASSystemState, "sharedSystemState"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isConnectedToCarPlay"),
        v7,
        v8))
  {
    v9 = objc_alloc(MEMORY[0x1E0CB37E8]);
    LODWORD(v10) = 1148846080;
    v11 = (void *)objc_msgSend(v9, "initWithFloat:", v10);
    v12 = -[SASMyriadController activateForRequest:withTimeout:visible:](self, "activateForRequest:withTimeout:visible:", v6, v11, v4);

  }
  else
  {
    v12 = -[SASMyriadController activateForRequest:withTimeout:visible:](self, "activateForRequest:withTimeout:visible:", v6, 0, v4);
  }

  return v12;
}

- (BOOL)activateForRequest:(id)a3 withTimeout:(id)a4 visible:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *myriadAttentionQueue;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double liftEndTime;
  void *v35;
  double v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  double v41;
  double v42;
  int v43;
  uint64_t v44;
  unint64_t v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  _BOOL4 v57;
  NSObject *v58;
  _BOOL4 v59;
  _BOOL4 v60;
  double raiseToWakeTime;
  void *v62;
  double v63;
  uint64_t v64;
  NSObject *v65;
  NSObject *v66;
  NSObject *v67;
  id *v68;
  os_signpost_id_t v69;
  NSObject *v70;
  NSObject *v71;
  void *v72;
  double v73;
  double v74;
  NSObject *v75;
  NSObject *v76;
  int v77;
  uint64_t v78;
  void *v79;
  int v80;
  NSObject *v81;
  int v82;
  uint64_t v83;
  int v84;
  void *v85;
  id *v86;
  void *v87;
  int v88;
  uint64_t v89;
  id v90;
  NSObject *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  NSObject *v100;
  void *v101;
  SCDACoordinator *scdaCoordinator;
  uint64_t v103;
  double unlockTime;
  void *v105;
  double v106;
  NSObject *v107;
  NSObject *v108;
  NSObject *v109;
  void *v110;
  double v111;
  double v112;
  void *v113;
  int v114;
  NSObject *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  NSObject *v124;
  uint64_t v125;
  float v126;
  dispatch_time_t v127;
  OS_dispatch_semaphore *v128;
  OS_dispatch_semaphore *myriadFinishedSemaphore;
  intptr_t v130;
  OS_dispatch_semaphore *v131;
  NSObject *v132;
  id *v133;
  _BOOL4 canceledByMyriad;
  BOOL v135;
  NSObject *v136;
  _BOOL4 v137;
  const char *v138;
  NSObject *v139;
  SCDACoordinator *v140;
  id v141;
  id *v142;
  int v143;
  id *v144;
  NSObject *v145;
  SCDACoordinator *myriadCoordinator;
  uint64_t v147;
  id v148;
  id v150;
  void *v151;
  int v152;
  _BOOL4 v153;
  void *v154;
  id v155;
  unsigned int v156;
  uint64_t v157;
  _QWORD block[4];
  id v159;
  id v160;
  id v161;
  _BYTE location[12];
  __int16 v163;
  _BYTE v164[10];
  _BYTE v165[6];
  __int16 v166;
  int v167;
  __int16 v168;
  int v169;
  uint64_t v170;

  v153 = a5;
  v170 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v154 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v9, "requestInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "speechRequestOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  v12 = objc_msgSend(v11, "isVoiceTrigger");
  v13 = (id *)MEMORY[0x1E0CFE6A0];
  if (v12)
  {
    if (AFSupportsSCDAFramework())
    {
      objc_msgSend(v11, "scdaContext");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v15 = *v13;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[SASMyriadController activateForRequest:withTimeout:visible:].cold.6(v14, v15);
      v16 = 0;
    }
    else
    {
      objc_msgSend(v11, "myriadContext");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v15 = *v13;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[SASMyriadController activateForRequest:withTimeout:visible:].cold.7(v16, v15);
      v14 = 0;
    }

    if (AFCDAFaceDetection())
    {
      objc_initWeak((id *)location, self);
      myriadAttentionQueue = self->_myriadAttentionQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __62__SASMyriadController_activateForRequest_withTimeout_visible___block_invoke;
      block[3] = &unk_1E91FBFE0;
      objc_copyWeak(&v161, (id *)location);
      v14 = v14;
      v159 = v14;
      v16 = v16;
      v160 = v16;
      dispatch_async(myriadAttentionQueue, block);
      v18 = *v13;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[SASMyriadController activateForRequest:withTimeout:visible:].cold.5(v18, v19, v20, v21, v22, v23, v24, v25);

      objc_destroyWeak(&v161);
      objc_destroyWeak((id *)location);
    }
  }
  else
  {
    v14 = 0;
    v16 = 0;
  }
  if (AFCDAFaceDetection() && AFAccessibilitySupportsAttentionAwareFeatures())
  {
    v26 = *v13;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      -[SASMyriadController activateForRequest:withTimeout:visible:].cold.4(v26, v27, v28, v29, v30, v31, v32, v33);

    v156 = 0;
  }
  else
  {
    os_unfair_lock_lock(&self->_activityManagerLock);
    if (self->_activityManager)
    {
      v157 = 0x10000000000000;
      liftEndTime = self->_liftEndTime;
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "systemUptime");
      v156 = SASMyriadUtilCurrentBoostForDecay(20, (double *)&v157, 10.0, liftEndTime, v36);

      v37 = *v13;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)location = 136315650;
        *(_QWORD *)&location[4] = "-[SASMyriadController activateForRequest:withTimeout:visible:]";
        v163 = 2048;
        *(_QWORD *)v164 = v157;
        *(_WORD *)&v164[8] = 1024;
        *(_DWORD *)v165 = v156;
        _os_log_impl(&dword_1D132F000, v37, OS_LOG_TYPE_DEFAULT, "%s #myriad BTLE lift time delta %f, adjusting by %d", location, 0x1Cu);
      }

      if (-[SASMyriadController _isTrialFeatureFlagEnabled](self, "_isTrialFeatureFlagEnabled"))
      {
        v38 = *v13;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)location = 136315138;
          *(_QWORD *)&location[4] = "-[SASMyriadController activateForRequest:withTimeout:visible:]";
          _os_log_impl(&dword_1D132F000, v38, OS_LOG_TYPE_DEFAULT, "%s #myriad Myriad Trial FF enabled", location, 0xCu);
        }

        if (-[SASMyriadController _isTrialMotionBoostEnabled](self, "_isTrialMotionBoostEnabled"))
        {
          v39 = *v13;
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)location = 136315138;
            *(_QWORD *)&location[4] = "-[SASMyriadController activateForRequest:withTimeout:visible:]";
            _os_log_impl(&dword_1D132F000, v39, OS_LOG_TYPE_DEFAULT, "%s #myriad trialMotionBoostEnabled", location, 0xCu);
          }

          objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "systemUptime");
          v42 = v41;

          v156 = -[SASMyriadController _calculateExpBoosts:eventTime:trialBoostSecondDegree:trialBoostFirstDegree:trialBoostIntercept:](self, "_calculateExpBoosts:eventTime:trialBoostSecondDegree:trialBoostFirstDegree:trialBoostIntercept:", CFSTR("MOTION_BOOST_SECOND_DEGREE_COEFF"), CFSTR("MOTION_BOOST_FIRST_DEGREE_COEFF"), CFSTR("MOTION_BOOST_INTERCEPT"), v42, self->_liftEndTime);
        }
      }
    }
    else
    {
      v156 = 0;
    }
    os_unfair_lock_unlock(&self->_activityManagerLock);
  }
  if (AFMyriadEmitSelfMetrics())
  {
    v43 = AFSupportsSCDAFramework();
    v44 = 16;
    if (v43)
      v44 = 40;
    objc_msgSend(*(id *)((char *)&self->super.isa + v44), "instrumentationUpdateBoost:value:", 5, v156);
  }
  v45 = -[SASLockStateMonitor lockState](self->_lockStateMonitor, "lockState");
  v155 = v8;
  if (AFCDAFaceDetection() && AFAccessibilitySupportsAttentionAwareFeatures())
  {
    v46 = *v13;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      -[SASMyriadController activateForRequest:withTimeout:visible:].cold.3(v46, v47, v48, v49, v50, v51, v52, v53);

    goto LABEL_45;
  }
  if (v45)
  {
LABEL_45:
    v54 = 0;
    goto LABEL_46;
  }
  v157 = 0x10000000000000;
  unlockTime = self->_unlockTime;
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "systemUptime");
  v54 = SASMyriadUtilCurrentBoostForDecay(4, (double *)&v157, 180.0, unlockTime, v106);

  v107 = *v13;
  if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)location = 136315650;
    *(_QWORD *)&location[4] = "-[SASMyriadController activateForRequest:withTimeout:visible:]";
    v163 = 2048;
    *(_QWORD *)v164 = v157;
    *(_WORD *)&v164[8] = 1024;
    *(_DWORD *)v165 = v54;
    _os_log_impl(&dword_1D132F000, v107, OS_LOG_TYPE_DEFAULT, "%s #myriad BTLE unlock time delta %f, adjusting by %d", location, 0x1Cu);
  }

  if (-[SASMyriadController _isTrialFeatureFlagEnabled](self, "_isTrialFeatureFlagEnabled"))
  {
    v108 = *v13;
    if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 136315138;
      *(_QWORD *)&location[4] = "-[SASMyriadController activateForRequest:withTimeout:visible:]";
      _os_log_impl(&dword_1D132F000, v108, OS_LOG_TYPE_DEFAULT, "%s #myriad Myriad Trial FF enabled", location, 0xCu);
    }

    if (-[SASMyriadController _isTrialUnlockBoostEnabled](self, "_isTrialUnlockBoostEnabled"))
    {
      v109 = *v13;
      if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)location = 136315138;
        *(_QWORD *)&location[4] = "-[SASMyriadController activateForRequest:withTimeout:visible:]";
        _os_log_impl(&dword_1D132F000, v109, OS_LOG_TYPE_DEFAULT, "%s #myriad trialUnlockBoostEnabled]", location, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "systemUptime");
      v112 = v111;

      v54 = -[SASMyriadController _calculateExpBoosts:eventTime:trialBoostSecondDegree:trialBoostFirstDegree:trialBoostIntercept:](self, "_calculateExpBoosts:eventTime:trialBoostSecondDegree:trialBoostFirstDegree:trialBoostIntercept:", CFSTR("UNLOCK_SECOND_DEGREE_COEFF"), CFSTR("UNLOCK_FIRST_DEGREE_COEFF"), CFSTR("UNLOCK_BOOST_INTERCEPT"), v112, self->_unlockTime);
    }
  }
LABEL_46:
  if (AFMyriadEmitSelfMetrics())
  {
    v55 = AFSupportsSCDAFramework();
    v56 = 16;
    if (v55)
      v56 = 40;
    objc_msgSend(*(id *)((char *)&self->super.isa + v56), "instrumentationUpdateBoost:value:", 2, v54);
  }
  v152 = v54;
  if (v45)
    v57 = -[SASLockStateMonitor isScreenOn](self->_lockStateMonitor, "isScreenOn");
  else
    v57 = 1;
  v58 = *v13;
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    v59 = -[SASLockStateMonitor isScreenOn](self->_lockStateMonitor, "isScreenOn");
    *(_DWORD *)location = 136315906;
    *(_QWORD *)&location[4] = "-[SASMyriadController activateForRequest:withTimeout:visible:]";
    v163 = 1024;
    *(_DWORD *)v164 = v45 != 0;
    *(_WORD *)&v164[4] = 1024;
    *(_DWORD *)&v164[6] = v59;
    *(_WORD *)v165 = 1024;
    *(_DWORD *)&v165[2] = v57;
    _os_log_impl(&dword_1D132F000, v58, OS_LOG_TYPE_DEFAULT, "%s #myriad BTLE raise-to-wake locked=%d, screen=%d => shouldBoost:%d", location, 0x1Eu);
  }

  if (self->_displayMonitor)
    v60 = v57;
  else
    v60 = 0;
  if (v60)
  {
    v157 = 0x10000000000000;
    raiseToWakeTime = self->_raiseToWakeTime;
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "systemUptime");
    v64 = SASMyriadUtilCurrentBoostForDecay(85, (double *)&v157, 17.0, raiseToWakeTime, v63);

    v65 = *v13;
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 136315650;
      *(_QWORD *)&location[4] = "-[SASMyriadController activateForRequest:withTimeout:visible:]";
      v163 = 2048;
      *(_QWORD *)v164 = v157;
      *(_WORD *)&v164[8] = 1024;
      *(_DWORD *)v165 = v64;
      _os_log_impl(&dword_1D132F000, v65, OS_LOG_TYPE_DEFAULT, "%s #myriad BTLE raise-to-wake time delta %f, adjusting by %d", location, 0x1Cu);
    }

    if (-[SASMyriadController _isTrialFeatureFlagEnabled](self, "_isTrialFeatureFlagEnabled"))
    {
      v66 = *v13;
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)location = 136315138;
        *(_QWORD *)&location[4] = "-[SASMyriadController activateForRequest:withTimeout:visible:]";
        _os_log_impl(&dword_1D132F000, v66, OS_LOG_TYPE_DEFAULT, "%s #myriad Trial FF enabled", location, 0xCu);
      }

      if (-[SASMyriadController _isTrialWakeBoostEnabled](self, "_isTrialWakeBoostEnabled"))
      {
        v67 = *v13;
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)location = 136315138;
          *(_QWORD *)&location[4] = "-[SASMyriadController activateForRequest:withTimeout:visible:]";
          _os_log_impl(&dword_1D132F000, v67, OS_LOG_TYPE_DEFAULT, "%s #myriad trialWakeBoostEnabled", location, 0xCu);
        }

        v68 = (id *)MEMORY[0x1E0CFE6B8];
        v69 = os_signpost_id_generate((os_log_t)*MEMORY[0x1E0CFE6B8]);
        v70 = *v68;
        v71 = v70;
        if (v69 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v70))
        {
          *(_WORD *)location = 0;
          _os_signpost_emit_with_name_impl(&dword_1D132F000, v71, OS_SIGNPOST_INTERVAL_BEGIN, v69, "SASMyriadController._calculateTrialWakeBoost", (const char *)&unk_1D1381C6B, location, 2u);
        }

        objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "systemUptime");
        v74 = v73;

        v64 = -[SASMyriadController _calculateExpBoosts:eventTime:trialBoostSecondDegree:trialBoostFirstDegree:trialBoostIntercept:](self, "_calculateExpBoosts:eventTime:trialBoostSecondDegree:trialBoostFirstDegree:trialBoostIntercept:", CFSTR("WAKE_BOOST_SECOND_DEGREE_COEFF"), CFSTR("WAKE_BOOST_FIRST_DEGREE_COEFF"), CFSTR("WAKE_BOOST_INTERCEPT"), v74, self->_raiseToWakeTime);
        v75 = *v68;
        v76 = v75;
        if (v69 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v75))
        {
          *(_WORD *)location = 0;
          _os_signpost_emit_with_name_impl(&dword_1D132F000, v76, OS_SIGNPOST_INTERVAL_END, v69, "SASMyriadController._calculateTrialWakeBoost", (const char *)&unk_1D1381C6B, location, 2u);
        }

        v13 = (id *)MEMORY[0x1E0CFE6A0];
      }
    }
    if (AFMyriadEmitSelfMetrics())
    {
      v77 = AFSupportsSCDAFramework();
      v78 = 16;
      if (v77)
        v78 = 40;
      objc_msgSend(*(id *)((char *)&self->super.isa + v78), "instrumentationUpdateBoost:value:", 3, v64);
    }
  }
  else
  {
    LODWORD(v64) = 0;
  }
  if (objc_msgSend(v7, "isVoiceRequest")
    && (+[SASSystemState sharedSystemState](SASSystemState, "sharedSystemState"),
        v79 = (void *)objc_claimAutoreleasedReturnValue(),
        v80 = objc_msgSend(v79, "isConnectedToCarPlay"),
        v79,
        v80))
  {
    v81 = *v13;
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 136315394;
      *(_QWORD *)&location[4] = "-[SASMyriadController activateForRequest:withTimeout:visible:]";
      v163 = 1024;
      *(_DWORD *)v164 = 15;
      _os_log_impl(&dword_1D132F000, v81, OS_LOG_TYPE_DEFAULT, "%s #myriad BTLE connected to carplay, adjusting by %d", location, 0x12u);
    }

    if (AFMyriadEmitSelfMetrics())
    {
      v82 = AFSupportsSCDAFramework();
      v83 = 16;
      if (v82)
        v83 = 40;
      v84 = 15;
      objc_msgSend(*(id *)((char *)&self->super.isa + v83), "instrumentationUpdateBoost:value:", 1, 15);
    }
    else
    {
      v84 = 15;
    }
  }
  else
  {
    v84 = 0;
  }
  if (!objc_msgSend(v11, "isVoiceTrigger"))
  {
    v100 = *v13;
    if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 136315138;
      *(_QWORD *)&location[4] = "-[SASMyriadController activateForRequest:withTimeout:visible:]";
      _os_log_impl(&dword_1D132F000, v100, OS_LOG_TYPE_DEFAULT, "%s #myriad BTLE Myriad direct trigger advertising needed", location, 0xCu);
    }

    -[SASMyriadController setCanceledByMyriad:](self, "setCanceledByMyriad:", 0);
    v101 = v155;
    if (AFSupportsSCDAFramework())
    {
      scdaCoordinator = self->_scdaCoordinator;
      if (v11)
      {
        objc_msgSend(v11, "scdaContext");
        v103 = objc_claimAutoreleasedReturnValue();
        goto LABEL_117;
      }
    }
    else
    {
      scdaCoordinator = self->_myriadCoordinator;
      if (v11)
      {
        objc_msgSend(v11, "myriadContext");
        v103 = objc_claimAutoreleasedReturnValue();
LABEL_117:
        v123 = (void *)v103;
        -[SCDACoordinator startAdvertisingFromDirectTriggerWithContext:](scdaCoordinator, "startAdvertisingFromDirectTriggerWithContext:", v103);

        if (v155)
          goto LABEL_118;
        goto LABEL_164;
      }
    }
    -[SCDACoordinator startAdvertisingFromDirectTrigger](scdaCoordinator, "startAdvertisingFromDirectTrigger");
    if (v155)
      goto LABEL_118;
    goto LABEL_164;
  }
  if (AFSupportsSCDAFramework())
  {
    objc_msgSend(v11, "scdaContext");
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "isVoiceRequest"))
    {
      v86 = v13;
      +[SASSystemState sharedSystemState](SASSystemState, "sharedSystemState");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = objc_msgSend(v87, "isConnectedToCarPlay");

      if (v88)
      {
        v89 = (uint64_t)v16;
        v90 = v7;
        v91 = *v86;
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
          -[SASMyriadController activateForRequest:withTimeout:visible:].cold.1(v91, v92, v93, v94, v95, v96, v97, v98);

        v99 = objc_msgSend(MEMORY[0x1E0D97CD8], "newWithBuilder:", &__block_literal_global_2);
        v13 = v86;
        goto LABEL_114;
      }
      v89 = (uint64_t)v16;
      v13 = v86;
    }
    else
    {
      v89 = (uint64_t)v16;
    }
    v14 = v85;
    goto LABEL_140;
  }
  objc_msgSend(v11, "myriadContext");
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v7, "isVoiceRequest"))
  {
    v89 = (uint64_t)v85;
    goto LABEL_140;
  }
  v90 = v7;
  v99 = (uint64_t)v14;
  +[SASSystemState sharedSystemState](SASSystemState, "sharedSystemState");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = objc_msgSend(v113, "isConnectedToCarPlay");

  if (!v114)
  {
    v89 = (uint64_t)v85;
    goto LABEL_139;
  }
  v115 = *v13;
  if (os_log_type_enabled(v115, OS_LOG_TYPE_DEBUG))
    -[SASMyriadController activateForRequest:withTimeout:visible:].cold.1(v115, v116, v117, v118, v119, v120, v121, v122);

  v89 = objc_msgSend(MEMORY[0x1E0CFE930], "newWithBuilder:", &__block_literal_global_68);
LABEL_114:

LABEL_139:
  v14 = (id)v99;
  v7 = v90;
LABEL_140:
  if (!v153)
  {
    v150 = v7;
    v142 = v13;
    v143 = v152 + v156 + v64 + v84;
    v144 = v142;
    v145 = *v142;
    if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 136316418;
      *(_QWORD *)&location[4] = "-[SASMyriadController activateForRequest:withTimeout:visible:]";
      v163 = 1024;
      *(_DWORD *)v164 = v152;
      *(_WORD *)&v164[4] = 1024;
      *(_DWORD *)&v164[6] = v156;
      *(_WORD *)v165 = 1024;
      *(_DWORD *)&v165[2] = v84;
      v166 = 1024;
      v167 = v64;
      v168 = 1024;
      v169 = v152 + v156 + v64 + v84;
      _os_log_impl(&dword_1D132F000, v145, OS_LOG_TYPE_DEFAULT, "%s #myriad BTLE Myriad voice trigger advertising needed adjusted by ul=%d + lt=%d + cp=%d + rtw=%d = %d", location, 0x2Au);
    }

    -[SASMyriadController setCanceledByMyriad:](self, "setCanceledByMyriad:", 0);
    if (v143 >= 255)
      LOBYTE(v143) = -1;
    if (AFSupportsSCDAFramework())
    {
      myriadCoordinator = self->_scdaCoordinator;
      v101 = v155;
      v16 = (id)v89;
      if (v14)
      {
        v147 = (char)v143;
        v148 = v14;
LABEL_159:
        -[SCDACoordinator startAdvertisingFromVoiceTriggerAdjusted:withContext:](myriadCoordinator, "startAdvertisingFromVoiceTriggerAdjusted:withContext:", v147, v148, v150);
        goto LABEL_163;
      }
    }
    else
    {
      myriadCoordinator = self->_myriadCoordinator;
      v101 = v155;
      v16 = (id)v89;
      if (v89)
      {
        v147 = (char)v143;
        v148 = (id)v89;
        goto LABEL_159;
      }
    }
    -[SCDACoordinator startAdvertisingFromVoiceTriggerAdjusted:](myriadCoordinator, "startAdvertisingFromVoiceTriggerAdjusted:", (char)v143, v150);
LABEL_163:
    v13 = v144;
    v7 = v151;
    if (v101)
      goto LABEL_118;
LABEL_164:
    v135 = 1;
    goto LABEL_165;
  }
  v139 = *v13;
  v101 = v155;
  if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)location = 136315138;
    *(_QWORD *)&location[4] = "-[SASMyriadController activateForRequest:withTimeout:visible:]";
    _os_log_impl(&dword_1D132F000, v139, OS_LOG_TYPE_DEFAULT, "%s #myriad BTLE Myriad voice trigger advertising while isVisible", location, 0xCu);
  }

  -[SASMyriadController setCanceledByMyriad:](self, "setCanceledByMyriad:", 0);
  v16 = (id)v89;
  if (AFSupportsSCDAFramework())
  {
    v140 = self->_scdaCoordinator;
    if (v14)
    {
      v141 = v14;
      goto LABEL_155;
    }
LABEL_160:
    -[SCDACoordinator startAdvertisingFromInTaskVoiceTrigger](v140, "startAdvertisingFromInTaskVoiceTrigger");
    if (!v155)
      goto LABEL_164;
    goto LABEL_118;
  }
  v140 = self->_myriadCoordinator;
  if (!v89)
    goto LABEL_160;
  v141 = (id)v89;
LABEL_155:
  -[SCDACoordinator startAdvertisingFromInTaskVoiceTriggerWithContext:](v140, "startAdvertisingFromInTaskVoiceTriggerWithContext:", v141);
  if (!v155)
    goto LABEL_164;
LABEL_118:
  v124 = *v13;
  if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
  {
    v125 = objc_msgSend(v7, "activationEvent");
    *(_DWORD *)location = 136315394;
    *(_QWORD *)&location[4] = "-[SASMyriadController activateForRequest:withTimeout:visible:]";
    v163 = 2048;
    *(_QWORD *)v164 = v125;
    _os_log_impl(&dword_1D132F000, v124, OS_LOG_TYPE_DEFAULT, "%s #myriad BTLE Siri is delayed for Myriad decision, evt = %ld", location, 0x16u);
  }

  objc_msgSend(v101, "floatValue");
  v127 = dispatch_time(0, (uint64_t)(float)(v126 * 1000000.0));
  v128 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  myriadFinishedSemaphore = self->_myriadFinishedSemaphore;
  self->_myriadFinishedSemaphore = v128;

  v130 = dispatch_semaphore_wait((dispatch_semaphore_t)self->_myriadFinishedSemaphore, v127);
  v131 = self->_myriadFinishedSemaphore;
  self->_myriadFinishedSemaphore = 0;

  if (v130)
  {
    v132 = *v13;
    if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 136315394;
      *(_QWORD *)&location[4] = "-[SASMyriadController activateForRequest:withTimeout:visible:]";
      v163 = 2048;
      *(_QWORD *)v164 = v130;
      _os_log_impl(&dword_1D132F000, v132, OS_LOG_TYPE_DEFAULT, "%s #myriad BTLE timed out waiting for Myriad decision, sem=%ld", location, 0x16u);
    }

  }
  v133 = v13;
  canceledByMyriad = self->_canceledByMyriad;
  v135 = !self->_canceledByMyriad;
  v136 = *v133;
  v137 = os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT);
  if (canceledByMyriad)
  {
    if (v137)
    {
      *(_DWORD *)location = 136315138;
      *(_QWORD *)&location[4] = "-[SASMyriadController activateForRequest:withTimeout:visible:]";
      v138 = "%s #myriad BTLE Canceled Myriad decision. Not activating Siri.";
LABEL_129:
      _os_log_impl(&dword_1D132F000, v136, OS_LOG_TYPE_DEFAULT, v138, location, 0xCu);
    }
  }
  else if (v137)
  {
    *(_DWORD *)location = 136315138;
    *(_QWORD *)&location[4] = "-[SASMyriadController activateForRequest:withTimeout:visible:]";
    v138 = "%s #myriad BTLE Got Myriad decision. Activating Siri.";
    goto LABEL_129;
  }

LABEL_165:
  return v135;
}

void __62__SASMyriadController_activateForRequest_withTimeout_visible___block_invoke(uint64_t a1)
{
  NSObject **v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id *WeakRetained;
  id *v12;
  int v13;
  NSObject *v14;
  double v15;
  double v16;

  v2 = (NSObject **)MEMORY[0x1E0CFE6A0];
  v3 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEBUG))
    __62__SASMyriadController_activateForRequest_withTimeout_visible___block_invoke_cold_2(v3, v4, v5, v6, v7, v8, v9, v10);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    v13 = objc_msgSend(WeakRetained[11], "isScreenOn");
    v14 = *v2;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      __62__SASMyriadController_activateForRequest_withTimeout_visible___block_invoke_cold_1(v13, v14);
    if (AFSupportsSCDAFramework())
    {
      if (v13)
        v15 = 0.5;
      else
        v15 = 0.75;
      objc_msgSend(v12, "_scdaCheckForAttention:withTimeout:", *(_QWORD *)(a1 + 32), v15);
    }
    else
    {
      if (v13)
        v16 = 0.5;
      else
        v16 = 0.75;
      objc_msgSend(v12, "_checkForAttention:withTimeout:", *(_QWORD *)(a1 + 40), v16);
    }
  }

}

void __62__SASMyriadController_activateForRequest_withTimeout_visible___block_invoke_60(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;

  v2 = (objc_class *)MEMORY[0x1E0D97CE8];
  v3 = a2;
  v4 = (id)objc_msgSend([v2 alloc], "initWithOverrideOption:reason:", 1, CFSTR("CarPlay request"));
  objc_msgSend(v3, "setOverrideState:", v4);

}

void __62__SASMyriadController_activateForRequest_withTimeout_visible___block_invoke_66(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;

  v2 = (objc_class *)MEMORY[0x1E0CFE940];
  v3 = a2;
  v4 = (id)objc_msgSend([v2 alloc], "initWithOverrideOption:reason:", 1, CFSTR("CarPlay request"));
  objc_msgSend(v3, "setOverrideState:", v4);

}

- (BOOL)_isTrialUnlockBoostEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("UNLOCK_BOOST_TRIAL_ENABLE"), CFSTR("MYRIAD_BOOSTS"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLeanValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_isTrialMotionBoostEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("MOTION_BOOST_TRIAL_ENABLE"), CFSTR("MYRIAD_BOOSTS"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLeanValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_isTrialWakeBoostEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("WAKE_BOOST_TRIAL_ENABLE"), CFSTR("MYRIAD_BOOSTS"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLeanValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_isTrialFeatureFlagEnabled
{
  return _os_feature_enabled_impl();
}

- (unsigned)_calculateExpBoosts:(double)a3 eventTime:(double)a4 trialBoostSecondDegree:(id)a5 trialBoostFirstDegree:(id)a6 trialBoostIntercept:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject **v27;
  NSObject *v28;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  int v35;
  const char *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  id v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  id v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v12 = a7;
  -[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", v10, CFSTR("MYRIAD_BOOSTS"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", v11, CFSTR("MYRIAD_BOOSTS"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", v12, CFSTR("MYRIAD_BOOSTS"));
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v13)
    v17 = v14 == 0;
  else
    v17 = 1;
  if (v17 || v15 == 0)
  {
    v19 = *MEMORY[0x1E0CFE6A0];
    LOBYTE(v20) = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v35 = 136315138;
      v36 = "-[SASMyriadController _calculateExpBoosts:eventTime:trialBoostSecondDegree:trialBoostFirstDegree:trialBoostIntercept:]";
      _os_log_impl(&dword_1D132F000, v19, OS_LOG_TYPE_DEFAULT, "%s #myriad error reading trial levels for trialBoostSecondDegree", (uint8_t *)&v35, 0xCu);
      LOBYTE(v20) = 0;
    }
  }
  else
  {
    objc_msgSend(v13, "doubleValue");
    v22 = v21;
    objc_msgSend(v14, "doubleValue");
    v24 = v23;
    objc_msgSend(v16, "doubleValue");
    v26 = v25;
    v27 = (NSObject **)MEMORY[0x1E0CFE6A0];
    v28 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v35 = 136316674;
      v36 = "-[SASMyriadController _calculateExpBoosts:eventTime:trialBoostSecondDegree:trialBoostFirstDegree:trialBoostIntercept:]";
      v37 = 2112;
      v38 = v10;
      v39 = 2048;
      v40 = v22;
      v41 = 2112;
      v42 = v11;
      v43 = 2048;
      v44 = v24;
      v45 = 2112;
      v46 = v12;
      v47 = 2048;
      v48 = v26;
      _os_log_impl(&dword_1D132F000, v28, OS_LOG_TYPE_DEFAULT, "%s #myriad trial coefficients %@:%f, %@:%f, %@:%f", (uint8_t *)&v35, 0x48u);
    }
    v20 = AFMyriadGoodnessComputeExponentialBoost();
    v30 = *v27;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = (void *)MEMORY[0x1E0CB37E8];
      v32 = v30;
      objc_msgSend(v31, "numberWithUnsignedChar:", v20);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 136315394;
      v36 = "-[SASMyriadController _calculateExpBoosts:eventTime:trialBoostSecondDegree:trialBoostFirstDegree:trialBoostIntercept:]";
      v37 = 2112;
      v38 = v33;
      _os_log_impl(&dword_1D132F000, v32, OS_LOG_TYPE_DEFAULT, "%s #myriad trial bump uint8_t %@", (uint8_t *)&v35, 0x16u);

    }
  }

  return v20;
}

- (double)_calculateExponentialBoost:(double)a3 secondDegree:(double)a4 firstDegree:(double)a5 intercept:(double)a6
{
  return exp(-(a3 * a5 + a4 * (a3 * a3) + a6));
}

- (void)activateForInTaskRequest:(BOOL)a3 isVisible:(BOOL)a4
{
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  _BOOL4 v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v5 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0CFE6A0];
  v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT);
  if (a4)
  {
    if (v7)
    {
      v10 = 136315394;
      v11 = "-[SASMyriadController activateForInTaskRequest:isVisible:]";
      v12 = 1024;
      v13 = v5;
      _os_log_impl(&dword_1D132F000, v6, OS_LOG_TYPE_DEFAULT, "%s #myriad BTLE Myriad voice trigger advertising while is visible [isVoiceTrigger %d]", (uint8_t *)&v10, 0x12u);
    }
    if (!v5)
    {
      if (AFSupportsSCDAFramework())
        v8 = (void *)MEMORY[0x1E0D97CE0];
      else
        v8 = (void *)MEMORY[0x1E0CFE938];
      objc_msgSend(v8, "currentCoordinator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "startAdvertisingFromDirectTrigger");

    }
  }
  else if (v7)
  {
    v10 = 136315650;
    v11 = "-[SASMyriadController activateForInTaskRequest:isVisible:]";
    v12 = 1024;
    v13 = v5;
    v14 = 1024;
    v15 = 0;
    _os_log_impl(&dword_1D132F000, v6, OS_LOG_TYPE_DEFAULT, "%s #myriad BTLE Myriad ignoring advertisement [isVoiceTrigger %d, isVisible %d]", (uint8_t *)&v10, 0x18u);
  }
}

- (void)_checkForAttention:(id)a3 withTimeout:(double)a4
{
  id v6;
  os_log_t *v7;
  AWAttentionAwarenessClient *attentionClient;
  char v9;
  id v10;
  AWAttentionAwarenessClient *v11;
  int v12;
  id v13;
  id v14;
  _BOOL4 v15;
  AWAttentionAwarenessClient *v16;
  char v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v6 = a3;
  if (a4 == 0.0)
    a4 = 0.5;
  v7 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEBUG))
    -[SASMyriadController _checkForAttention:withTimeout:].cold.5();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_myriadAttentionQueue);
  attentionClient = self->_attentionClient;
  v22 = 0;
  v9 = -[AWAttentionAwarenessClient resumeWithError:](attentionClient, "resumeWithError:", &v22);
  v10 = v22;
  if ((v9 & 1) == 0 && os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    -[SASMyriadController _checkForAttention:withTimeout:].cold.4();
  v11 = self->_attentionClient;
  v20 = 0;
  v21 = 0;
  v12 = -[AWAttentionAwarenessClient pollForAttentionWithTimeout:event:error:](v11, "pollForAttentionWithTimeout:event:error:", &v21, &v20, a4);
  v13 = v21;
  v14 = v20;
  v15 = os_log_type_enabled(*v7, OS_LOG_TYPE_DEBUG);
  if (v12)
  {
    if (v15)
    {
      -[SASMyriadController _checkForAttention:withTimeout:].cold.2();
      if (!v13)
        goto LABEL_14;
      goto LABEL_11;
    }
    if (v13)
LABEL_11:
      -[AFMyriadCoordinator faceDetectedBoostWithMyriadContext:](self->_myriadCoordinator, "faceDetectedBoostWithMyriadContext:", v6);
  }
  else if (v15)
  {
    -[SASMyriadController _checkForAttention:withTimeout:].cold.3();
  }
LABEL_14:
  v16 = self->_attentionClient;
  v19 = 0;
  v17 = -[AWAttentionAwarenessClient suspendWithError:](v16, "suspendWithError:", &v19);
  v18 = v19;
  if ((v17 & 1) == 0 && os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    -[SASMyriadController _checkForAttention:withTimeout:].cold.1();

}

- (void)_scdaCheckForAttention:(id)a3 withTimeout:(double)a4
{
  id v6;
  os_log_t *v7;
  AWAttentionAwarenessClient *attentionClient;
  char v9;
  id v10;
  AWAttentionAwarenessClient *v11;
  int v12;
  id v13;
  id v14;
  _BOOL4 v15;
  AWAttentionAwarenessClient *v16;
  char v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v6 = a3;
  if (a4 == 0.0)
    a4 = 0.5;
  v7 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEBUG))
    -[SASMyriadController _scdaCheckForAttention:withTimeout:].cold.5();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_myriadAttentionQueue);
  attentionClient = self->_attentionClient;
  v22 = 0;
  v9 = -[AWAttentionAwarenessClient resumeWithError:](attentionClient, "resumeWithError:", &v22);
  v10 = v22;
  if ((v9 & 1) == 0 && os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    -[SASMyriadController _scdaCheckForAttention:withTimeout:].cold.4();
  v11 = self->_attentionClient;
  v20 = 0;
  v21 = 0;
  v12 = -[AWAttentionAwarenessClient pollForAttentionWithTimeout:event:error:](v11, "pollForAttentionWithTimeout:event:error:", &v21, &v20, a4);
  v13 = v21;
  v14 = v20;
  v15 = os_log_type_enabled(*v7, OS_LOG_TYPE_DEBUG);
  if (v12)
  {
    if (v15)
    {
      -[SASMyriadController _scdaCheckForAttention:withTimeout:].cold.2();
      if (!v13)
        goto LABEL_14;
      goto LABEL_11;
    }
    if (v13)
LABEL_11:
      -[SCDACoordinator faceDetectedBoostWithContext:](self->_scdaCoordinator, "faceDetectedBoostWithContext:", v6);
  }
  else if (v15)
  {
    -[SASMyriadController _scdaCheckForAttention:withTimeout:].cold.3();
  }
LABEL_14:
  v16 = self->_attentionClient;
  v19 = 0;
  v17 = -[AWAttentionAwarenessClient suspendWithError:](v16, "suspendWithError:", &v19);
  v18 = v19;
  if ((v17 & 1) == 0 && os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    -[SASMyriadController _scdaCheckForAttention:withTimeout:].cold.1();

}

- (void)shouldContinue:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *myriadFinishedSemaphore;
  id WeakRetained;
  char v8;
  id v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[SASMyriadController shouldContinue:]";
    _os_log_impl(&dword_1D132F000, v5, OS_LOG_TYPE_DEFAULT, "%s #myriad", (uint8_t *)&v10, 0xCu);
  }
  myriadFinishedSemaphore = self->_myriadFinishedSemaphore;
  if (myriadFinishedSemaphore)
    dispatch_semaphore_signal(myriadFinishedSemaphore);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "shouldContinue:", self);

  }
}

- (void)shouldAbortAnotherDeviceBetter:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *myriadFinishedSemaphore;
  id WeakRetained;
  char v8;
  id v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[SASMyriadController shouldAbortAnotherDeviceBetter:]";
    _os_log_impl(&dword_1D132F000, v5, OS_LOG_TYPE_DEFAULT, "%s #myriad", (uint8_t *)&v10, 0xCu);
  }
  self->_canceledByMyriad = 1;
  myriadFinishedSemaphore = self->_myriadFinishedSemaphore;
  if (myriadFinishedSemaphore)
    dispatch_semaphore_signal(myriadFinishedSemaphore);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "shouldAbort:", self);

  }
}

- (void)scdaShouldContinue:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *myriadFinishedSemaphore;
  id WeakRetained;
  char v8;
  id v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[SASMyriadController scdaShouldContinue:]";
    _os_log_impl(&dword_1D132F000, v5, OS_LOG_TYPE_DEFAULT, "%s #myriad", (uint8_t *)&v10, 0xCu);
  }
  myriadFinishedSemaphore = self->_myriadFinishedSemaphore;
  if (myriadFinishedSemaphore)
    dispatch_semaphore_signal(myriadFinishedSemaphore);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "scdaShouldContinue:", self);

  }
}

- (void)scdaShouldAbortAnotherDeviceBetter:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *myriadFinishedSemaphore;
  id WeakRetained;
  char v8;
  id v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[SASMyriadController scdaShouldAbortAnotherDeviceBetter:]";
    _os_log_impl(&dword_1D132F000, v5, OS_LOG_TYPE_DEFAULT, "%s #myriad", (uint8_t *)&v10, 0xCu);
  }
  self->_canceledByMyriad = 1;
  myriadFinishedSemaphore = self->_myriadFinishedSemaphore;
  if (myriadFinishedSemaphore)
    dispatch_semaphore_signal(myriadFinishedSemaphore);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "scdaShouldAbort:", self);

  }
}

- (void)didChangeLockState:(unint64_t)a3 toState:(unint64_t)a4
{
  unsigned __int8 v4;
  int v7;
  NSObject *v8;
  void *v9;
  double v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v7 = (a4 == 0) & a3;
  v8 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_INFO))
  {
    v11 = 136315650;
    v12 = "-[SASMyriadController didChangeLockState:toState:]";
    v13 = 1024;
    v14 = v7;
    v15 = 1024;
    v16 = (a3 == 0) & v4;
    _os_log_impl(&dword_1D132F000, v8, OS_LOG_TYPE_INFO, "%s #myriad screen lock -> unlock: %d, screen unlock -> lock: %d", (uint8_t *)&v11, 0x18u);
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "systemUptime");
    self->_unlockTime = v10;

  }
}

- (void)_configureMotionActivityManager
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id location;

  self->_liftEndTime = -10.0;
  objc_initWeak(&location, self);
  dispatch_get_global_queue(21, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__SASMyriadController__configureMotionActivityManager__block_invoke;
  v3[3] = &unk_1E91FBE70;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __54__SASMyriadController__configureMotionActivityManager__block_invoke(uint64_t a1)
{
  id *v2;
  os_unfair_lock_s *WeakRetained;
  os_log_t *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0CA5660], "isActivityAvailable"))
  {
    v2 = (id *)(a1 + 32);
    WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v4 = (os_log_t *)MEMORY[0x1E0CFE6A0];
      v5 = (void *)*MEMORY[0x1E0CFE6A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
      {
        v6 = (void *)MEMORY[0x1E0CB3978];
        v7 = v5;
        objc_msgSend(v6, "currentThread");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v18 = "-[SASMyriadController _configureMotionActivityManager]_block_invoke";
        v19 = 2048;
        v20 = objc_msgSend(v8, "qualityOfService");
        _os_log_impl(&dword_1D132F000, v7, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy strongSelf->_activityManagerLock about to lock with qos: %zd", buf, 0x16u);

      }
      os_unfair_lock_lock(WeakRetained + 28);
      v9 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v18 = "-[SASMyriadController _configureMotionActivityManager]_block_invoke";
        _os_log_impl(&dword_1D132F000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy strongSelf->_activityManagerLock successfully locked", buf, 0xCu);
      }
      v10 = objc_alloc_init(MEMORY[0x1E0CA5660]);
      v11 = *(void **)&WeakRetained[30]._os_unfair_lock_opaque;
      *(_QWORD *)&WeakRetained[30]._os_unfair_lock_opaque = v10;

      v12 = *(void **)&WeakRetained[30]._os_unfair_lock_opaque;
      objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __54__SASMyriadController__configureMotionActivityManager__block_invoke_83;
      v15[3] = &unk_1E91FC068;
      objc_copyWeak(&v16, v2);
      objc_msgSend(v12, "startActivityUpdatesToQueue:withHandler:", v13, v15);

      os_unfair_lock_unlock(WeakRetained + 28);
      v14 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v18 = "-[SASMyriadController _configureMotionActivityManager]_block_invoke_2";
        _os_log_impl(&dword_1D132F000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy strongSelf->_activityManagerLock unlocked", buf, 0xCu);
      }
      objc_destroyWeak(&v16);
    }

  }
}

void __54__SASMyriadController__configureMotionActivityManager__block_invoke_83(uint64_t a1, void *a2)
{
  id v3;
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v5;
  int v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  if (v3)
  {
    v9 = v3;
    WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
    v5 = WeakRetained;
    if (WeakRetained)
    {
      os_unfair_lock_lock(WeakRetained + 28);
      v6 = objc_msgSend(v9, "stationary");
      LOBYTE(v5[24]._os_unfair_lock_opaque) = v6;
      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "systemUptime");
        *(_QWORD *)&v5[26]._os_unfair_lock_opaque = v8;

      }
      os_unfair_lock_unlock(v5 + 28);
    }

    v3 = v9;
  }

}

- (BOOL)canceledByMyriad
{
  return self->_canceledByMyriad;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attentionClient, 0);
  objc_storeStrong((id *)&self->_myriadAttentionQueue, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
  objc_storeStrong((id *)&self->_lockStateMonitor, 0);
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong((id *)&self->_myriadFinishedSemaphore, 0);
  objc_storeStrong((id *)&self->_scdaCoordinator, 0);
  objc_storeStrong((id *)&self->_trialRefreshQueue, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_myriadCoordinator, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)activateForRequest:(uint64_t)a3 withTimeout:(uint64_t)a4 visible:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D132F000, a1, a3, "%s #myriad request from CarPlay", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)activateForRequest:(uint64_t)a3 withTimeout:(uint64_t)a4 visible:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D132F000, a1, a3, "%s #myriad unlock bump is ignored due to awareness being on", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)activateForRequest:(uint64_t)a3 withTimeout:(uint64_t)a4 visible:(uint64_t)a5 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D132F000, a1, a3, "%s #myriad motion bump is ignored due to awareness being on", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)activateForRequest:(uint64_t)a3 withTimeout:(uint64_t)a4 visible:(uint64_t)a5 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D132F000, a1, a3, "%s #myriad attention dispatched", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)activateForRequest:(void *)a1 withTimeout:(NSObject *)a2 visible:.cold.6(void *a1, NSObject *a2)
{
  id v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "debugDescription");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_1D132F000, a2, v4, "%s #myriad scdaContext: %@", (uint8_t *)v5);

  OUTLINED_FUNCTION_14();
}

- (void)activateForRequest:(void *)a1 withTimeout:(NSObject *)a2 visible:.cold.7(void *a1, NSObject *a2)
{
  id v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "debugDescription");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_1D132F000, a2, v4, "%s #myriad myriadContext: %@", (uint8_t *)v5);

  OUTLINED_FUNCTION_14();
}

void __62__SASMyriadController_activateForRequest_withTimeout_visible___block_invoke_cold_1(char a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[SASMyriadController activateForRequest:withTimeout:visible:]_block_invoke";
  v4 = 1024;
  v5 = a1 & 1;
  _os_log_debug_impl(&dword_1D132F000, a2, OS_LOG_TYPE_DEBUG, "%s #myriad attention isScreenOn?: %d", (uint8_t *)&v2, 0x12u);
  OUTLINED_FUNCTION_2();
}

void __62__SASMyriadController_activateForRequest_withTimeout_visible___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D132F000, a1, a3, "%s #myriad attention start", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_checkForAttention:withTimeout:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D132F000, v0, v1, "%s #myriad attention failed suspendWithError: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_checkForAttention:withTimeout:.cold.2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_10(v2, v3);
  OUTLINED_FUNCTION_11();
  objc_msgSend(v0, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(&dword_1D132F000, v5, v6, "%s #myriad attention awareness received attention event: %@, isMetadataValid %d, error: %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)_checkForAttention:withTimeout:.cold.3()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_12();
  v3 = OUTLINED_FUNCTION_10(v1, v2);
  objc_msgSend(v0, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7(&dword_1D132F000, v5, v6, "%s #myriad attention timed out with event: %@, error: %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)_checkForAttention:withTimeout:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D132F000, v0, v1, "%s #myriad attention failed with resumeWithError: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_checkForAttention:withTimeout:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6(&dword_1D132F000, v0, v1, "%s #myriad attention with timeout: %f", (uint8_t *)v2);
  OUTLINED_FUNCTION_2();
}

- (void)_scdaCheckForAttention:withTimeout:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D132F000, v0, v1, "%s #myriad attention failed suspendWithError: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_scdaCheckForAttention:withTimeout:.cold.2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_10(v2, v3);
  OUTLINED_FUNCTION_11();
  objc_msgSend(v0, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(&dword_1D132F000, v5, v6, "%s #myriad attention awareness received attention event: %@, isMetadataValid %d, error: %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)_scdaCheckForAttention:withTimeout:.cold.3()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_12();
  v3 = OUTLINED_FUNCTION_10(v1, v2);
  objc_msgSend(v0, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7(&dword_1D132F000, v5, v6, "%s #myriad attention timed out with event: %@, error: %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_3();
}

- (void)_scdaCheckForAttention:withTimeout:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D132F000, v0, v1, "%s #myriad attention failed with resumeWithError: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_scdaCheckForAttention:withTimeout:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6(&dword_1D132F000, v0, v1, "%s #myriad attention with timeout: %f", (uint8_t *)v2);
  OUTLINED_FUNCTION_2();
}

@end
