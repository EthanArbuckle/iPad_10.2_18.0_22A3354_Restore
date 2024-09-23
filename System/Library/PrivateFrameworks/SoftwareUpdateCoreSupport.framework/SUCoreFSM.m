@implementation SUCoreFSM

- (id)initMachine:(id)a3 withTable:(id)a4 startingIn:(id)a5
{
  uint64_t v6;

  LOBYTE(v6) = 0;
  return -[SUCoreFSM _initMachine:ofInstance:withTable:startingIn:usingDelegate:registeringAllInfoClass:registeringAndActivating:](self, "_initMachine:ofInstance:withTable:startingIn:usingDelegate:registeringAllInfoClass:registeringAndActivating:", a3, 0, a4, a5, 0, 0, v6);
}

- (id)initMachine:(id)a3 ofInstance:(id)a4 withTable:(id)a5 startingIn:(id)a6
{
  uint64_t v7;

  LOBYTE(v7) = 0;
  return -[SUCoreFSM _initMachine:ofInstance:withTable:startingIn:usingDelegate:registeringAllInfoClass:registeringAndActivating:](self, "_initMachine:ofInstance:withTable:startingIn:usingDelegate:registeringAllInfoClass:registeringAndActivating:", a3, a4, a5, a6, 0, 0, v7);
}

- (id)initMachine:(id)a3 withTable:(id)a4 startingIn:(id)a5 usingDelegate:(id)a6 registeringAllInfoClass:(Class)a7
{
  uint64_t v8;

  LOBYTE(v8) = 1;
  return -[SUCoreFSM _initMachine:ofInstance:withTable:startingIn:usingDelegate:registeringAllInfoClass:registeringAndActivating:](self, "_initMachine:ofInstance:withTable:startingIn:usingDelegate:registeringAllInfoClass:registeringAndActivating:", a3, 0, a4, a5, a6, a7, v8);
}

- (id)initMachine:(id)a3 ofInstance:(id)a4 withTable:(id)a5 startingIn:(id)a6 usingDelegate:(id)a7 registeringAllInfoClass:(Class)a8
{
  uint64_t v9;

  LOBYTE(v9) = 1;
  return -[SUCoreFSM _initMachine:ofInstance:withTable:startingIn:usingDelegate:registeringAllInfoClass:registeringAndActivating:](self, "_initMachine:ofInstance:withTable:startingIn:usingDelegate:registeringAllInfoClass:registeringAndActivating:", a3, a4, a5, a6, a7, a8, v9);
}

- (id)_initMachine:(id)a3 ofInstance:(id)a4 withTable:(id)a5 startingIn:(id)a6 usingDelegate:(id)a7 registeringAllInfoClass:(Class)a8 registeringAndActivating:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  SUCoreFSM *v19;
  void *v20;
  NSString *pendingFollowupEvent;
  id pendingFollowupInfo;
  NSMutableDictionary *usageTable;
  uint64_t v24;
  NSMutableDictionary *registeredActionTable;
  NSString *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  SUCoreFSM *v43;
  void *v44;
  NSString *fullName;
  SUCoreDiag *v47;
  SUCoreDiag *diag;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  const char *v53;
  NSObject *v54;
  dispatch_queue_t v55;
  OS_dispatch_queue *extendedStateQueue;
  void *v57;
  NSObject *v58;
  NSString *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  id v63;
  NSObject *v64;
  NSObject *v65;
  void *v66;
  id v68;
  id v69;
  objc_super v70;
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  const __CFString *v74;
  __int16 v75;
  NSString *v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v69 = a7;
  v70.receiver = self;
  v70.super_class = (Class)SUCoreFSM;
  v19 = -[SUCoreFSM init](&v70, sel_init);
  if (!v19)
    goto LABEL_30;
  v68 = v16;
  +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "trackBegin:", CFSTR("[FSM] API: initMachine"));

  v19->_isActive = 0;
  v19->_performingEvent = 0;
  pendingFollowupEvent = v19->_pendingFollowupEvent;
  v19->_pendingFollowupEvent = 0;

  pendingFollowupInfo = v19->_pendingFollowupInfo;
  v19->_pendingFollowupInfo = 0;

  usageTable = v19->_usageTable;
  v19->_usageTable = 0;

  v19->_untrackedOccurrences = 0;
  v24 = objc_opt_new();
  registeredActionTable = v19->_registeredActionTable;
  v19->_registeredActionTable = (NSMutableDictionary *)v24;

  if (!v15)
  {
    +[SUCore sharedCore](SUCore, "sharedCore");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    v29 = CFSTR("FSM name not provided");
    v30 = 8101;
LABEL_14:
    objc_msgSend(v27, "buildError:underlying:description:", v30, 0, v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[SUCore sharedCore](SUCore, "sharedCore");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    v29 = CFSTR("invalid FSM name");
    v30 = 8102;
    goto LABEL_14;
  }
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      +[SUCore sharedCore](SUCore, "sharedCore");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "buildError:underlying:description:", 8102, 0, CFSTR("invalid instance name"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
  }
  if (!v17)
  {
    +[SUCore sharedCore](SUCore, "sharedCore");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("FSM(%@) state table not provided"), v15);
LABEL_19:
    v34 = (void *)v32;
    v35 = v28;
    v36 = 8101;
LABEL_22:
    objc_msgSend(v35, "buildError:underlying:description:", v36, 0, v34);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[SUCore sharedCore](SUCore, "sharedCore");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("FSM(%@) invalid state table"), v15);
LABEL_21:
    v34 = (void *)v33;
    v35 = v28;
    v36 = 8102;
    goto LABEL_22;
  }
  if (!v18)
  {
    +[SUCore sharedCore](SUCore, "sharedCore");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("FSM(%@) start state not provided"), v15);
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[SUCore sharedCore](SUCore, "sharedCore");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("FSM(%@) invalid start state"), v15);
    goto LABEL_21;
  }
  objc_storeStrong((id *)&v19->_fsmName, a3);
  objc_storeStrong((id *)&v19->_instanceName, a4);
  if (v19->_instanceName)
    v26 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@[%@]"), v19->_fsmName, v19->_instanceName);
  else
    v26 = v19->_fsmName;
  fullName = v19->_fullName;
  v19->_fullName = v26;

  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.%@"), CFSTR("fsm"), v19->_fullName);
  v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SUFSM_%@_%@"), v19->_fullName, CFSTR("SUDiagDump.plist"));
  v47 = -[SUCoreDiag initWithAppendedDomain:appendingDumpFilename:]([SUCoreDiag alloc], "initWithAppendedDomain:appendingDumpFilename:", v28, v62);
  diag = v19->_diag;
  v19->_diag = v47;

  +[SUCore sharedCore](SUCore, "sharedCore");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "commonDomain");
  v50 = objc_claimAutoreleasedReturnValue();

  v66 = (void *)v50;
  v63 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.%@.%@"), v50, CFSTR("core.fsm.extended"), v19->_fullName));
  v51 = objc_msgSend(v63, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v52 = objc_claimAutoreleasedReturnValue();
  v53 = (const char *)v51;
  v54 = v52;
  v55 = dispatch_queue_create(v53, v52);
  extendedStateQueue = v19->_extendedStateQueue;
  v19->_extendedStateQueue = (OS_dispatch_queue *)v55;

  if (v19->_extendedStateQueue)
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "oslog");
    v58 = objc_claimAutoreleasedReturnValue();

    v64 = v58;
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      v59 = v19->_fullName;
      *(_DWORD *)buf = 138543874;
      v72 = v66;
      v73 = 2114;
      v74 = CFSTR("core.fsm.extended");
      v75 = 2114;
      v76 = v59;
      _os_log_impl(&dword_1B05B8000, v58, OS_LOG_TYPE_DEFAULT, "[FSM] DISPATCH: created extended state dispatch queue domain(%{public}@.%{public}@.%{public}@)", buf, 0x20u);
    }
    v31 = 0;
    v60 = v64;
  }
  else
  {
    +[SUCore sharedCore](SUCore, "sharedCore");
    v65 = objc_claimAutoreleasedReturnValue();
    v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("FSM(%@) failed to create extended state dispatch queue"), v19->_fullName);
    -[NSObject buildError:underlying:description:](v65, "buildError:underlying:description:", 8100, 0, v61);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v60 = v65;
  }

LABEL_23:
  if (a9)
  {
    -[SUCoreFSM _registerAllActions:withInfoClass:stateTable:actionTable:loggingRegistration:](v19, "_registerAllActions:withInfoClass:stateTable:actionTable:loggingRegistration:", v69, a8, v17, v19->_registeredActionTable, 0);
    if (-[SUCoreFSM _activateMachineWithStateTable:withActionTable:](v19, "_activateMachineWithStateTable:withActionTable:", v17, v19->_registeredActionTable))
    {
      objc_storeStrong((id *)&v19->_currentState, a6);
      v19->_isActive = 1;
    }
    else
    {
      +[SUCore sharedCore](SUCore, "sharedCore");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("FSM(%@) failed to validate state table and registered actions"), v19->_fullName);
      objc_msgSend(v37, "buildError:underlying:description:", 8503, 0, v38);
      v39 = objc_claimAutoreleasedReturnValue();

      v31 = (void *)v39;
    }
  }
  v40 = v18;
  if (!v31)
  {
    objc_storeStrong((id *)&v19->_stateTable, a5);
    objc_storeStrong((id *)&v19->_startState, a6);
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "trackEnd:", CFSTR("[FSM] API: initMachine"));

    v16 = v68;
LABEL_30:
    v43 = v19;
    v40 = v18;
    goto LABEL_31;
  }
  +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "trackFailure:forReason:withResult:withError:", CFSTR("[FSM] FAILURE: initMachine"), CFSTR("unable to fully validate and setup FSM"), objc_msgSend(v31, "code"), v31);

  +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "trackEnd:withResult:withError:", CFSTR("[FSM] API: initMachine"), objc_msgSend(v31, "code"), v31);

  v43 = 0;
  v16 = v68;
LABEL_31:

  return v43;
}

- (void)teardownMachine
{
  NSObject *v3;
  _QWORD block[5];

  -[SUCoreFSM extendedStateQueue](self, "extendedStateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__SUCoreFSM_teardownMachine__block_invoke;
  block[3] = &unk_1E611BF88;
  block[4] = self;
  dispatch_async(v3, block);

}

void __28__SUCoreFSM_teardownMachine__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trackBegin:", CFSTR("[FSM] API: teardownMachine"));

  if (objc_msgSend(*(id *)(a1 + 32), "isActive"))
  {
    v3 = *(void **)(a1 + 32);
    v21 = 0;
    objc_msgSend(v3, "_acceptEvent:withInfo:issueType:attachedAction:", CFSTR("Teardown"), 0, CFSTR("post"), &v21);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v21;
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "pendingFollowupEvent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(*(id *)(a1 + 32), "diag");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(*(id *)(a1 + 32), "fullName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "pendingFollowupEvent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "currentState");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("FSM(%@) pending follow-up event(%@) [starting teardown in state(%@)] discarded"), v9, v10, v11);
        objc_msgSend(v7, "trackAnomaly:forReason:withResult:withError:", CFSTR("[FSM] TEARDOWN"), v12, 8117, 0);

        objc_msgSend(*(id *)(a1 + 32), "setPendingFollowupEvent:", 0);
        objc_msgSend(*(id *)(a1 + 32), "setPendingFollowupInfo:", 0);
      }
      objc_msgSend(*(id *)(a1 + 32), "setPerformingEvent:", 0);
      objc_msgSend(*(id *)(a1 + 32), "_performEvent:withInfo:issueType:forCell:attachedAction:checkingAttached:", CFSTR("Teardown"), 0, CFSTR("teardown"), v4, v5, 1);
      objc_msgSend(*(id *)(a1 + 32), "pendingFollowupEvent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(*(id *)(a1 + 32), "diag");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(*(id *)(a1 + 32), "fullName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "pendingFollowupEvent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "currentState");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("FSM(%@) pending follow-up event(%@) [ending teardown in state(%@)] discarded"), v16, v17, v18);
        objc_msgSend(v14, "trackAnomaly:forReason:withResult:withError:", CFSTR("[FSM] TEARDOWN"), v19, 8117, 0);

      }
      objc_msgSend(*(id *)(a1 + 32), "setIsActive:", 0);
    }

  }
  +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "trackEnd:", CFSTR("[FSM] API: teardownMachine"));

}

- (void)registerAction:(id)a3 ForEvent:(id)a4 inState:(id)a5 usingDelegate:(id)a6 withInfoClass:(Class)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD block[5];
  id v23;
  id v24;
  id v25;
  id v26;
  Class v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  -[SUCoreFSM extendedStateQueue](self, "extendedStateQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v16);

  -[SUCoreFSM extendedStateQueue](self, "extendedStateQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__SUCoreFSM_registerAction_ForEvent_inState_usingDelegate_withInfoClass___block_invoke;
  block[3] = &unk_1E611C860;
  block[4] = self;
  v23 = v12;
  v24 = v13;
  v25 = v14;
  v26 = v15;
  v27 = a7;
  v18 = v15;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  dispatch_sync(v17, block);

}

void __73__SUCoreFSM_registerAction_ForEvent_inState_usingDelegate_withInfoClass___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trackBegin:atLevel:", CFSTR("[FSM] API: registerAction"), 0);

  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = a1[7];
  v8 = a1[8];
  v7 = a1[9];
  objc_msgSend(v3, "registeredActionTable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = 1;
  objc_msgSend(v3, "_registerAction:ForEvent:inState:usingDelegate:withInfoClass:actionTable:loggingRegistration:", v4, v5, v6, v8, v7, v9, v10);

  +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trackEnd:atLevel:", CFSTR("[FSM] API: registerAction"), 0);

}

- (void)registerAllActions:(id)a3 withInfoClass:(Class)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  Class v12;

  v6 = a3;
  -[SUCoreFSM extendedStateQueue](self, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  -[SUCoreFSM extendedStateQueue](self, "extendedStateQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__SUCoreFSM_registerAllActions_withInfoClass___block_invoke;
  block[3] = &unk_1E611C888;
  block[4] = self;
  v11 = v6;
  v12 = a4;
  v9 = v6;
  dispatch_sync(v8, block);

}

void __46__SUCoreFSM_registerAllActions_withInfoClass___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trackBegin:", CFSTR("[FSM] API: registerAllActions"));

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v3, "stateTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "registeredActionTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_registerAllActions:withInfoClass:stateTable:actionTable:loggingRegistration:", v4, v5, v6, v7, 1);

  +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trackEnd:", CFSTR("[FSM] API: registerAllActions"));

}

- (void)_registerAllActions:(id)a3 withInfoClass:(Class)a4 stateTable:(id)a5 actionTable:(id)a6 loggingRegistration:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  Class v19;
  BOOL v20;

  v12 = a3;
  v13 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __90__SUCoreFSM__registerAllActions_withInfoClass_stateTable_actionTable_loggingRegistration___block_invoke;
  v16[3] = &unk_1E611C8D8;
  v16[4] = self;
  v17 = v12;
  v18 = v13;
  v19 = a4;
  v20 = a7;
  v14 = v13;
  v15 = v12;
  objc_msgSend(a5, "enumerateKeysAndObjectsUsingBlock:", v16);

}

void __90__SUCoreFSM__registerAllActions_withInfoClass_stateTable_actionTable_loggingRegistration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8[2];
  _QWORD v9[5];
  id v10;
  id v11;
  __int128 v12;
  char v13;

  v5 = a2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __90__SUCoreFSM__registerAllActions_withInfoClass_stateTable_actionTable_loggingRegistration___block_invoke_2;
  v9[3] = &unk_1E611C8B0;
  v6 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v6;
  *(_OWORD *)v8 = *(_OWORD *)(a1 + 48);
  v7 = v8[0];
  v12 = *(_OWORD *)v8;
  v13 = *(_BYTE *)(a1 + 64);
  v8[0] = v5;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v9);

}

void __90__SUCoreFSM__registerAllActions_withInfoClass_stateTable_actionTable_loggingRegistration___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(a3, "safeStringForKey:", CFSTR("FSMAction"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    LOBYTE(v6) = *(_BYTE *)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 32), "_registerAction:ForEvent:inState:usingDelegate:withInfoClass:actionTable:loggingRegistration:", v5, v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), v6);
  }

}

- (void)_registerAction:(id)a3 ForEvent:(id)a4 inState:(id)a5 usingDelegate:(id)a6 withInfoClass:(Class)a7 actionTable:(id)a8 loggingRegistration:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  SUCoreFSMAttachedAction *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  SUCoreFSMAttachedAction *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "safeObjectForKey:ofClass:", v17, objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    v22 = objc_opt_new();
    if (!v22)
    {
      v34 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[SUCoreFSM fullName](self, "fullName");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)objc_msgSend(v34, "initWithFormat:", CFSTR("FSM(%@) unable to create actions for state(%@) so dropping registration of action(%@) for event(%@)"), v35, v17, v15, v16);
      objc_msgSend(v20, "trackAnomaly:forReason:withResult:withError:", CFSTR("[FSM] REGISTER_EVENT"), v36, 8100, 0);

      goto LABEL_11;
    }
    v21 = (void *)v22;
    objc_msgSend(v19, "setSafeObject:forKey:", v22, v17);
  }
  v23 = objc_msgSend(v16, "isEqualToString:", CFSTR("Teardown"));
  if (a7 && v23)
  {
    v24 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCoreFSM fullName](self, "fullName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "initWithFormat:", CFSTR("FSM(%@) action delegate registering for event(%@) with Class - not supported"), v25, v16);
  }
  else
  {
    objc_msgSend(v21, "objectForKey:", v16);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
    {
      v30 = -[SUCoreFSMAttachedAction initWithAction:usingDelegate:withInfoClass:]([SUCoreFSMAttachedAction alloc], "initWithAction:usingDelegate:withInfoClass:", v15, v18, a7);
      objc_msgSend(v21, "setSafeObject:forKey:", v30, v16);
      objc_msgSend(v19, "setSafeObject:forKey:", v21, v17);
      if (a9)
      {
        v37 = v30;
        +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "oslog");
        v32 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          -[SUCoreFSM fullName](self, "fullName");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v39 = v33;
          v40 = 2114;
          v41 = v15;
          v42 = 2114;
          v43 = v16;
          v44 = 2114;
          v45 = v17;
          _os_log_impl(&dword_1B05B8000, v32, OS_LOG_TYPE_DEFAULT, "[FSM] REGISTER_EVENT: FSM(%{public}@) attached action(%{public}@) handling event(%{public}@) in state(%{public}@)", buf, 0x2Au);

        }
        v30 = v37;
      }

      goto LABEL_10;
    }
    v28 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCoreFSM fullName](self, "fullName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v28, "initWithFormat:", CFSTR("FSM(%@) action delegate already registered as event handler for event(%@)"), v25, v16);
  }
  v29 = (void *)v26;
  objc_msgSend(v20, "trackAnomaly:forReason:withResult:withError:", CFSTR("[FSM] REGISTER_EVENT"), v26, 8111, 0);

LABEL_10:
LABEL_11:

}

- (void)activateMachine
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];

  -[SUCoreFSM extendedStateQueue](self, "extendedStateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  -[SUCoreFSM extendedStateQueue](self, "extendedStateQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__SUCoreFSM_activateMachine__block_invoke;
  block[3] = &unk_1E611BF88;
  block[4] = self;
  dispatch_sync(v4, block);

}

void __28__SUCoreFSM_activateMachine__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trackBegin:atLevel:", CFSTR("[FSM] API: activateMachine"), 1);

  if (objc_msgSend(*(id *)(a1 + 32), "isActive"))
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v3;
    v4 = 8502;
LABEL_6:
    objc_msgSend(v3, "trackEnd:atLevel:withResult:withError:", CFSTR("[FSM] API: activateMachine"), 1, v4, 0);
    goto LABEL_7;
  }
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "stateTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "registeredActionTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "_activateMachineWithStateTable:withActionTable:", v6, v7);

  if (!(_DWORD)v5)
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v3;
    v4 = 8503;
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "startState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCurrentState:", v8);

  objc_msgSend(*(id *)(a1 + 32), "setIsActive:", 1);
  +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trackEnd:atLevel:", CFSTR("[FSM] API: activateMachine"), 1);
LABEL_7:

}

- (BOOL)_activateMachineWithStateTable:(id)a3 withActionTable:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  SUCoreFSM *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v6 = a3;
  v7 = a4;
  +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 1;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__SUCoreFSM__activateMachineWithStateTable_withActionTable___block_invoke;
  v13[3] = &unk_1E611C928;
  v9 = v6;
  v14 = v9;
  v10 = v8;
  v15 = v10;
  v16 = self;
  v18 = &v19;
  v11 = v7;
  v17 = v11;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v13);
  LOBYTE(v7) = *((_BYTE *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)v7;
}

void __60__SUCoreFSM__activateMachineWithStateTable_withActionTable___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;

  v5 = a2;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__SUCoreFSM__activateMachineWithStateTable_withActionTable___block_invoke_2;
  v10[3] = &unk_1E611C900;
  v11 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(void **)(a1 + 56);
  v12 = v6;
  v13 = v7;
  v16 = *(_QWORD *)(a1 + 64);
  v14 = v8;
  v15 = v5;
  v9 = v5;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v10);

}

void __60__SUCoreFSM__activateMachineWithStateTable_withActionTable___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;

  v29 = a2;
  v5 = a3;
  objc_msgSend(v5, "safeStringForKey:", CFSTR("FSMNextState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeStringForKey:", CFSTR("FSMAction"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (objc_msgSend(v6, "isEqualToString:", CFSTR("NOT_VALID")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "safeDictionaryForKey:fromBase:withKeyDescription:", v6, CFSTR("SUCoreFSM stateTable"), CFSTR("next state"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v9 = *(void **)(a1 + 40);
      v10 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(*(id *)(a1 + 48), "fullName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("FSM(%@) with nextState(%@) that is not defined in state table"), v11, v6);
      objc_msgSend(v9, "trackAnomaly:forReason:withResult:withError:", CFSTR("[FSM] ACTIVATE_MACHINE"), v12, 8100, 0);

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    }

  }
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 56), "safeDictionaryForKey:fromBase:withKeyDescription:", *(_QWORD *)(a1 + 64), CFSTR("SUCoreFSM actionTable"), CFSTR("FSM state"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "safeObjectForKey:ofClass:", v29, objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "fsmAction");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v7, "isEqualToString:", v16);

      if ((v17 & 1) == 0)
      {
        v24 = *(void **)(a1 + 40);
        v25 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(*(id *)(a1 + 48), "fullName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = *(_QWORD *)(a1 + 64);
        objc_msgSend(v15, "fsmAction");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(v25, "initWithFormat:", CFSTR("FSM(%@) forEvent(%@) inState(%@) table action(%@) != registered event action(%@)"), v20, v29, v26, v7, v23);
        objc_msgSend(v24, "trackAnomaly:forReason:withResult:withError:", CFSTR("[FSM] ACTIVATE_MACHINE"), v27, 8100, 0);

        goto LABEL_15;
      }
      if (!objc_msgSend(v29, "isEqualToString:", CFSTR("Teardown"))
        || !objc_msgSend(v15, "eventInfoClass"))
      {
        goto LABEL_16;
      }
      v18 = *(void **)(a1 + 40);
      v19 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(*(id *)(a1 + 48), "fullName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "initWithFormat:", CFSTR("FSM(%@) forEvent(%@) inState(%@) indicates event info Class when not supported"), v20, v29, *(_QWORD *)(a1 + 64), v28);
    }
    else
    {
      v18 = *(void **)(a1 + 40);
      v22 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(*(id *)(a1 + 48), "fullName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v22, "initWithFormat:", CFSTR("FSM(%@) forEvent(%@) inState(%@) hasAction(%@) yet event handler has not been registered"), v20, v29, *(_QWORD *)(a1 + 64), v7);
    }
    v23 = (void *)v21;
    objc_msgSend(v18, "trackAnomaly:forReason:withResult:withError:", CFSTR("[FSM] ACTIVATE_MACHINE"), v21, 8100, 0);
LABEL_15:

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
LABEL_16:

  }
}

- (void)postEvent:(id)a3
{
  -[SUCoreFSM postEvent:withInfo:](self, "postEvent:withInfo:", a3, 0);
}

- (void)postEvent:(id)a3 withInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[SUCoreFSM extendedStateQueue](self, "extendedStateQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__SUCoreFSM_postEvent_withInfo___block_invoke;
  block[3] = &unk_1E611C270;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __32__SUCoreFSM_postEvent_withInfo___block_invoke(uint64_t a1)
{
  void *v2;

  +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trackBegin:atLevel:", CFSTR("[FSM] API: postEvent"), 0);

  return objc_msgSend(*(id *)(a1 + 32), "_postEvent:withInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)postProtectedEvent:(id)a3
{
  -[SUCoreFSM postProtectedEvent:withInfo:](self, "postProtectedEvent:withInfo:", a3, 0);
}

- (void)postProtectedEvent:(id)a3 withInfo:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;

  v6 = a4;
  v9 = a3;
  -[SUCoreFSM extendedStateQueue](self, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trackBegin:atLevel:", CFSTR("[FSM] API: postProtectedEvent"), 0);

  -[SUCoreFSM _postEvent:withInfo:](self, "_postEvent:withInfo:", v9, v6);
}

- (void)followupEvent:(id)a3
{
  -[SUCoreFSM followupEvent:withInfo:](self, "followupEvent:withInfo:", a3, 0);
}

- (void)followupEvent:(id)a3 withInfo:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  -[SUCoreFSM extendedStateQueue](self, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (-[SUCoreFSM performingEvent](self, "performingEvent"))
  {
    -[SUCoreFSM pendingFollowupEvent](self, "pendingFollowupEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      -[SUCoreFSM setPendingFollowupEvent:](self, "setPendingFollowupEvent:", v18);
      -[SUCoreFSM setPendingFollowupInfo:](self, "setPendingFollowupInfo:", v6);
      goto LABEL_7;
    }
    -[SUCoreFSM diag](self, "diag");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCoreFSM fullName](self, "fullName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreFSM currentState](self, "currentState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreFSM pendingFollowupEvent](self, "pendingFollowupEvent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("FSM(%@) follow-up event(%@) in state(%@) ignored - already have follow-up event(%@)"), v11, v18, v12, v13);
    objc_msgSend(v9, "trackAnomaly:forReason:withResult:withError:", CFSTR("[FSM] FOLLOW_UP_EVENT"), v14, 8111, 0);

  }
  else
  {
    -[SUCoreFSM diag](self, "diag");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCoreFSM fullName](self, "fullName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreFSM currentState](self, "currentState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("FSM(%@) follow-up event(%@) in state(%@) ignored - not performing any event"), v11, v18, v16);
    objc_msgSend(v9, "trackAnomaly:forReason:withResult:withError:", CFSTR("[FSM] FOLLOW_UP_EVENT"), v17, 8115, 0);

  }
LABEL_7:

}

- (id)copyCurrentState
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  -[SUCoreFSM extendedStateQueue](self, "extendedStateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__4;
  v12 = __Block_byref_object_dispose__4;
  v13 = 0;
  -[SUCoreFSM extendedStateQueue](self, "extendedStateQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__SUCoreFSM_copyCurrentState__block_invoke;
  v7[3] = &unk_1E611BFB0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __29__SUCoreFSM_copyCurrentState__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "currentState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)copyCurrentStateProtected
{
  NSObject *v3;
  void *v4;
  void *v5;

  -[SUCoreFSM extendedStateQueue](self, "extendedStateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreFSM currentState](self, "currentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (void)dumpEventInStateOccurrences:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  -[SUCoreFSM extendedStateQueue](self, "extendedStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  -[SUCoreFSM extendedStateQueue](self, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__SUCoreFSM_dumpEventInStateOccurrences___block_invoke;
  block[3] = &unk_1E611BF60;
  block[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, block);

}

void __41__SUCoreFSM_dumpEventInStateOccurrences___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "stateTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "stateTable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __41__SUCoreFSM_dumpEventInStateOccurrences___block_invoke_2;
    v11[3] = &unk_1E611C2C0;
    v5 = *(void **)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v5;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v11);

  }
  else
  {
    objc_msgSend(v3, "diag");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "fullName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@:FSM(%@) has no defined state table"), v7, v8);
    objc_msgSend(v10, "trackAnomaly:forReason:withResult:withError:", CFSTR("[FSM] DUMP_EVENT_IN_STATE"), v9, 8117, 0);

  }
}

void __41__SUCoreFSM_dumpEventInStateOccurrences___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v5 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__SUCoreFSM_dumpEventInStateOccurrences___block_invoke_3;
  v8[3] = &unk_1E611C950;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v8);

}

void __41__SUCoreFSM_dumpEventInStateOccurrences___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  id v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "safeStringForKey:", CFSTR("FSMAction"));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "usageTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "usageTable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safeDictionaryForKey:fromBase:withKeyDescription:", *(_QWORD *)(a1 + 40), CFSTR("dumpEventInStateOccurrences"), CFSTR("state name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "safeDictionaryForKey:fromBase:withKeyDescription:", v5, CFSTR("dumpEventInStateOccurrences"), CFSTR("event name"));
      v10 = objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = -[NSObject safeULLForKey:](v10, "safeULLForKey:", CFSTR("FSMOccurrences"));
        +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "oslog");
        v13 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = *(_QWORD *)(a1 + 48);
          objc_msgSend(*(id *)(a1 + 32), "fsmName");
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = (void *)v15;
          v17 = *(_QWORD *)(a1 + 40);
          v18 = CFSTR("NONE");
          v24 = 138413570;
          if (v6)
            v18 = v6;
          v25 = v14;
          v26 = 2112;
          v27 = v15;
          v28 = 2112;
          v29 = v17;
          v30 = 2112;
          v31 = v5;
          v32 = 2112;
          v33 = v18;
          v34 = 2048;
          v35 = v11;
          _os_log_impl(&dword_1B05B8000, v13, OS_LOG_TYPE_DEFAULT, "[FSM] DUMP_EVENT_IN_STATE | %@:FSM(%@) | STATE(%@) EVENT(%@) ACTION(%@) | occurrences:%llu", (uint8_t *)&v24, 0x3Eu);

        }
LABEL_12:

        goto LABEL_13;
      }
    }
  }
  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "oslog");
  v10 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v20 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "fsmName");
    v21 = objc_claimAutoreleasedReturnValue();
    v13 = v21;
    v22 = *(_QWORD *)(a1 + 40);
    v23 = CFSTR("NONE");
    v24 = 138413314;
    if (v6)
      v23 = v6;
    v25 = v20;
    v26 = 2112;
    v27 = v21;
    v28 = 2112;
    v29 = v22;
    v30 = 2112;
    v31 = v5;
    v32 = 2112;
    v33 = v23;
    _os_log_impl(&dword_1B05B8000, v10, OS_LOG_TYPE_DEFAULT, "[FSM] DUMP_EVENT_IN_STATE | %@:FSM(%@) | STATE(%@) EVENT(%@) ACTION(%@) | occurrences:0", (uint8_t *)&v24, 0x34u);
    goto LABEL_12;
  }
LABEL_13:

}

- (void)_postEvent:(id)a3 withInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  _BOOL8 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;

  v6 = a3;
  v7 = a4;
  -[SUCoreFSM extendedStateQueue](self, "extendedStateQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v39 = 0;
  -[SUCoreFSM _acceptEvent:withInfo:issueType:attachedAction:](self, "_acceptEvent:withInfo:issueType:attachedAction:", v6, v7, CFSTR("post"), &v39);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v39;
  if (v9)
  {
    -[SUCoreFSM pendingFollowupEvent](self, "pendingFollowupEvent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[SUCoreFSM diag](self, "diag");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[SUCoreFSM fullName](self, "fullName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreFSM pendingFollowupEvent](self, "pendingFollowupEvent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreFSM currentState](self, "currentState");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("FSM(%@) pending follow-up event(%@) [prior to performing event(%@) in state(%@)] discarded"), v14, v15, v6, v16);
      objc_msgSend(v12, "trackAnomaly:forReason:withResult:withError:", CFSTR("[FSM] POST_EVENT"), v17, 8117, 0);

      -[SUCoreFSM setPendingFollowupEvent:](self, "setPendingFollowupEvent:", 0);
      -[SUCoreFSM setPendingFollowupInfo:](self, "setPendingFollowupInfo:", 0);
    }
    v34 = v6;
    v18 = v6;
    -[SUCoreFSM setPerformingEvent:](self, "setPerformingEvent:", 1);
    while (1)
    {
      +[SUCoreSimulate sharedSimulator](SUCoreSimulate, "sharedSimulator");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreFSM fsmName](self, "fsmName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreFSM currentState](self, "currentState");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "fsm:forEvent:inState:", v20, v18, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        v37 = v7;
        v38 = v18;
        v36 = v10;
        -[SUCoreFSM _simulateEventAlteration:fsmEvent:eventInfo:attachedAction:](self, "_simulateEventAlteration:fsmEvent:eventInfo:attachedAction:", v22, &v38, &v37, &v36);
        v23 = v38;

        v24 = v37;
        v25 = v36;

        objc_msgSend(v25, "fsmAction");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26 == 0;

        v7 = v24;
        v10 = v25;
        v18 = v23;
      }
      else
      {
        v27 = 1;
      }
      -[SUCoreFSM _performEvent:withInfo:issueType:forCell:attachedAction:checkingAttached:](self, "_performEvent:withInfo:issueType:forCell:attachedAction:checkingAttached:", v18, v7, CFSTR("post"), v9, v10, v27);

      -[SUCoreFSM pendingFollowupEvent](self, "pendingFollowupEvent");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28)
        break;

      -[SUCoreFSM pendingFollowupEvent](self, "pendingFollowupEvent");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreFSM pendingFollowupInfo](self, "pendingFollowupInfo");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      -[SUCoreFSM _acceptEvent:withInfo:issueType:attachedAction:](self, "_acceptEvent:withInfo:issueType:attachedAction:", v29, v30, CFSTR("follow-up"), &v35);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v35;

      if (!v31)
      {
        v9 = 0;
        break;
      }
      -[SUCoreFSM pendingFollowupEvent](self, "pendingFollowupEvent");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      -[SUCoreFSM pendingFollowupInfo](self, "pendingFollowupInfo");
      v32 = objc_claimAutoreleasedReturnValue();

      -[SUCoreFSM setPendingFollowupEvent:](self, "setPendingFollowupEvent:", 0);
      -[SUCoreFSM setPendingFollowupInfo:](self, "setPendingFollowupInfo:", 0);

      v7 = (id)v32;
      v9 = v31;
      if (!v18)
        goto LABEL_14;
    }

    v31 = v9;
    v32 = (uint64_t)v7;
LABEL_14:
    -[SUCoreFSM setPerformingEvent:](self, "setPerformingEvent:", 0);

    v7 = (id)v32;
    v6 = v34;
  }
  +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "trackEnd:atLevel:", CFSTR("[FSM] API: postEvent"), 0);

}

- (void)_simulateEventAlteration:(id)a3 fsmEvent:(id *)a4 eventInfo:(id *)a5 attachedAction:(id *)a6
{
  id v10;
  uint64_t v11;
  id v12;
  SUCoreFSMAttachedAction *v13;
  void *v14;
  void *v15;
  SUCoreFSMAttachedAction *v16;
  SUCoreFSMAttachedAction *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v10 = a3;
  v11 = objc_msgSend(v10, "simAction");
  if (v11 == 10)
  {
    objc_msgSend(v10, "fsmEvent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *a5;
    v27 = 0;
    -[SUCoreFSM _acceptEvent:withInfo:issueType:attachedAction:](self, "_acceptEvent:withInfo:issueType:attachedAction:", v18, v19, CFSTR("simulate"), &v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v27;

    if (v20)
    {
      objc_msgSend(v10, "fsmEvent");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      *a6 = objc_retainAutorelease(v21);
    }

  }
  else if (v11 == 9)
  {
    v12 = *a6;
    v13 = [SUCoreFSMAttachedAction alloc];
    objc_msgSend(v10, "alteration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "actionDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[SUCoreFSMAttachedAction initWithAction:usingDelegate:withInfoClass:](v13, "initWithAction:usingDelegate:withInfoClass:", v14, v15, objc_msgSend(v12, "eventInfoClass"));

    v17 = objc_retainAutorelease(v16);
    *a6 = v17;

  }
  else
  {
    -[SUCoreFSM diag](self, "diag");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCoreFSM fsmName](self, "fsmName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "summary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("FSM(%@) unsupported simulate action: %@"), v24, v25);
    objc_msgSend(v22, "trackAnomaly:forReason:withResult:withError:", CFSTR("[FSM] SIMULATE"), v26, 8113, 0);

  }
}

- (id)_acceptEvent:(id)a3 withInfo:(id)a4 issueType:(id)a5 attachedAction:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  id v40;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[SUCoreFSM extendedStateQueue](self, "extendedStateQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (-[SUCoreFSM isActive](self, "isActive"))
    {
      -[SUCoreFSM stateTable](self, "stateTable");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreFSM currentState](self, "currentState");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "safeDictionaryForKey:fromBase:withKeyDescription:", v15, CFSTR("SUCoreFSM stateTable"), CFSTR("current state"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "safeDictionaryForKey:fromBase:withKeyDescription:", v10, CFSTR("SUCoreFSM eventsForState"), CFSTR("FSM event"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v11;
      if (v16)
      {
        if (v17)
        {
          -[SUCoreFSM registeredActionTable](self, "registeredActionTable");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUCoreFSM currentState](self, "currentState");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "safeDictionaryForKey:fromBase:withKeyDescription:", v19, CFSTR("SUCoreFSM registeredActionTable"), CFSTR("current state"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "safeObjectForKey:ofClass:", v10, objc_opt_class());
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21;
          v11 = v40;
          if (v40)
          {
            if (v21)
            {
              if (!objc_msgSend(v21, "eventInfoClass"))
              {
                -[SUCoreFSM diag](self, "diag");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = objc_alloc(MEMORY[0x1E0CB3940]);
                -[SUCoreFSM fullName](self, "fullName");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                -[SUCoreFSM currentState](self, "currentState");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v38, "initWithFormat:", CFSTR("FSM(%@) event info provided when registered handler is not expecting any event info parameter: %@ event(%@) in state(%@)"), v25, v12, v10, v26);
                goto LABEL_24;
              }
              objc_msgSend(v22, "eventInfoClass");
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                -[SUCoreFSM diag](self, "diag");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = objc_alloc(MEMORY[0x1E0CB3940]);
                -[SUCoreFSM fullName](self, "fullName");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                -[SUCoreFSM currentState](self, "currentState");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v24, "initWithFormat:", CFSTR("FSM(%@) event info Class mismatch (eventInfo of diff Class than registered): %@ event(%@) in state(%@)"), v25, v12, v10, v26);
LABEL_24:
                v39 = (void *)v27;
                objc_msgSend(v23, "trackAnomaly:forReason:withResult:withError:", CFSTR("[FSM] ACCEPT_EVENT"), v27, 8112, 0);

                v11 = v40;
                goto LABEL_13;
              }
            }
          }
          else if (v21 && objc_msgSend(v21, "eventInfoClass"))
          {
            -[SUCoreFSM diag](self, "diag");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_alloc(MEMORY[0x1E0CB3940]);
            -[SUCoreFSM fullName](self, "fullName");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[SUCoreFSM currentState](self, "currentState");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v37, "initWithFormat:", CFSTR("FSM(%@) event info Class mismatch (nil eventInfo when registered handler expecting non-nil): %@ event(%@) in state(%@)"), v25, v12, v10, v26);
            goto LABEL_24;
          }

          v22 = objc_retainAutorelease(v22);
          *a6 = v22;
          goto LABEL_14;
        }
        -[SUCoreFSM diag](self, "diag");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_alloc(MEMORY[0x1E0CB3940]);
        -[SUCoreFSM fullName](self, "fullName");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCoreFSM currentState](self, "currentState");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)objc_msgSend(v36, "initWithFormat:", CFSTR("FSM(%@) current state(%@) does not support %@ event(%@)"), v32, v33, v12, v10);
        objc_msgSend(v20, "trackAnomaly:forReason:withResult:withError:", CFSTR("[FSM] ACCEPT_EVENT"), v34, 8501, 0);
      }
      else
      {
        -[SUCoreFSM diag](self, "diag");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_alloc(MEMORY[0x1E0CB3940]);
        -[SUCoreFSM fullName](self, "fullName");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCoreFSM currentState](self, "currentState");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCoreFSM stateTable](self, "stateTable");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)objc_msgSend(v31, "initWithFormat:", CFSTR("FSM(%@) current state(%@) does not exist in state table when checking %@ event(%@) table:\n%@"), v32, v33, v12, v10, v34);
        objc_msgSend(v20, "trackAnomaly:forReason:withResult:withError:", CFSTR("[FSM] ACCEPT_EVENT"), v35, 8500, 0);

      }
      v11 = v40;

    }
    else
    {
      -[SUCoreFSM diag](self, "diag");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[SUCoreFSM fullName](self, "fullName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v30, "initWithFormat:", CFSTR("FSM(%@) not active at %@ event(%@)"), v16, v12, v10);
      objc_msgSend(v17, "trackAnomaly:forReason:withResult:withError:", CFSTR("[FSM] ACCEPT_EVENT"), v20, 8111, 0);
    }
  }
  else
  {
    -[SUCoreFSM diag](self, "diag");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCoreFSM fullName](self, "fullName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v28, "initWithFormat:", CFSTR("FSM(%@) invalid %@ event"), v16, v12);
    objc_msgSend(v17, "trackFailure:forReason:withResult:withError:", CFSTR("[FSM] ACCEPT_EVENT"), v20, 8111, 0);
  }
  v22 = 0;
LABEL_13:

  v17 = 0;
LABEL_14:

  return v17;
}

- (void)_performEvent:(id)a3 withInfo:(id)a4 issueType:(id)a5 forCell:(id)a6 attachedAction:(id)a7 checkingAttached:(BOOL)a8
{
  _BOOL4 v8;
  id v14;
  id v15;
  id v16;
  unint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;

  v8 = a8;
  v35 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = (unint64_t)a7;
  -[SUCoreFSM extendedStateQueue](self, "extendedStateQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v18);

  -[SUCoreFSM _trackEventOccurrence:withInfo:issueType:](self, "_trackEventOccurrence:withInfo:issueType:", v35, v14, v15);
  -[SUCoreFSM currentState](self, "currentState");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "safeStringForKey:", CFSTR("FSMNextState"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    -[SUCoreFSM setCurrentState:](self, "setCurrentState:", v20);
  if (objc_msgSend(v35, "isEqualToString:", CFSTR("Teardown")))
    -[SUCoreFSM setIsActive:](self, "setIsActive:", 0);
  if (v8)
    objc_msgSend(v16, "safeStringForKey:", CFSTR("FSMAction"));
  else
    objc_msgSend((id)v17, "fsmAction");
  v21 = objc_claimAutoreleasedReturnValue();
  -[SUCoreFSM diag](self, "diag");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreFSM fullName](self, "fullName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "trackStateEvent:previousState:handlingEvent:nextState:performingAction:withInfo:", v23, v19, v35, v20, v21, v14);

  if (v17 | v21)
  {
    if (v17
      && v21
      && (objc_msgSend((id)v17, "fsmAction"),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          v25 = objc_msgSend((id)v21, "isEqualToString:", v24),
          v24,
          v25))
    {
      -[SUCoreFSM _triggerAction:usingAttached:onEvent:inState:withInfo:nextState:](self, "_triggerAction:usingAttached:onEvent:inState:withInfo:nextState:", v21, v17, v35, v19, v14, v20);
    }
    else
    {
      -[SUCoreFSM diag](self, "diag");
      v33 = v19;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[SUCoreFSM fullName](self, "fullName");
      v34 = v16;
      v28 = v15;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreFSM currentState](self, "currentState");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v17, "fsmAction");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v27, "initWithFormat:", CFSTR("FSM(%@) event where action indicated (but table / registration mismatch) %@ event(%@) in state(%@) action(%@)!=attached(%@)"), v29, v28, v35, v30, v21, v31);
      objc_msgSend(v26, "trackAnomaly:forReason:withResult:withError:", CFSTR("[FSM] PERFORM_EVENT"), v32, 8112, 0);

      v15 = v28;
      v16 = v34;

      v19 = v33;
    }
  }

}

- (void)_trackEventOccurrence:(id)a3 withInfo:(id)a4 issueType:(id)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;

  v22 = a3;
  v7 = a5;
  -[SUCoreFSM extendedStateQueue](self, "extendedStateQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[SUCoreFSM usageTable](self, "usageTable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[SUCoreFSM setUsageTable:](self, "setUsageTable:", v10);

  }
  -[SUCoreFSM usageTable](self, "usageTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[SUCoreFSM usageTable](self, "usageTable");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreFSM currentState](self, "currentState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "safeDictionaryForKey:fromBase:withKeyDescription:", v13, v7, CFSTR("current state"));
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (v14)
      goto LABEL_6;
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[SUCoreFSM usageTable](self, "usageTable");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreFSM currentState](self, "currentState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSafeObject:forKey:", v14, v16);

    if (v14)
    {
LABEL_6:
      objc_msgSend(v14, "safeDictionaryForKey:fromBase:withKeyDescription:", v22, v7, CFSTR("FSM event"));
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v14, "setSafeObject:forKey:", v17, v22);
        if (!v17)
        {
          -[SUCoreFSM setUntrackedOccurrences:](self, "setUntrackedOccurrences:", -[SUCoreFSM untrackedOccurrences](self, "untrackedOccurrences") + 1);
          goto LABEL_15;
        }
      }
      objc_msgSend(v17, "safeObjectForKey:ofClass:", CFSTR("FSMOccurrences"), objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v19 = v18;
        v20 = objc_msgSend(v18, "unsignedLongLongValue") + 1;
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", v20);

        if (v21)
        {
LABEL_10:
          objc_msgSend(v17, "setSafeObject:forKey:", v21, CFSTR("FSMOccurrences"));
LABEL_14:

LABEL_15:
          goto LABEL_16;
        }
      }
      else
      {
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", 1);
        if (v21)
          goto LABEL_10;
      }
      -[SUCoreFSM setUntrackedOccurrences:](self, "setUntrackedOccurrences:", -[SUCoreFSM untrackedOccurrences](self, "untrackedOccurrences") + 1);
      goto LABEL_14;
    }
  }
  -[SUCoreFSM setUntrackedOccurrences:](self, "setUntrackedOccurrences:", -[SUCoreFSM untrackedOccurrences](self, "untrackedOccurrences") + 1);
LABEL_16:

}

- (void)_triggerAction:(id)a3 usingAttached:(id)a4 onEvent:(id)a5 inState:(id)a6 withInfo:(id)a7 nextState:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  -[SUCoreFSM extendedStateQueue](self, "extendedStateQueue");
  v20 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v20);

  v21 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCoreFSM fullName](self, "fullName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("[FSM] ACTION: FSM(%@), action(%@)"), v22, v19);

  +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "trackBegin:atLevel:", v23, 0);

  objc_msgSend(v18, "actionDelegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0;
  v26 = objc_msgSend(v25, "performAction:onEvent:inState:withInfo:nextState:error:", v19, v17, v16, v15, v14, &v29);

  v27 = v29;
  +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "trackEnd:atLevel:withResult:withError:", v23, 0, v26, v27);

}

- (NSString)fsmName
{
  return self->_fsmName;
}

- (NSString)instanceName
{
  return self->_instanceName;
}

- (NSString)fullName
{
  return self->_fullName;
}

- (NSDictionary)stateTable
{
  return self->_stateTable;
}

- (NSMutableDictionary)usageTable
{
  return self->_usageTable;
}

- (void)setUsageTable:(id)a3
{
  objc_storeStrong((id *)&self->_usageTable, a3);
}

- (unint64_t)untrackedOccurrences
{
  return self->_untrackedOccurrences;
}

- (void)setUntrackedOccurrences:(unint64_t)a3
{
  self->_untrackedOccurrences = a3;
}

- (NSString)startState
{
  return self->_startState;
}

- (SUCoreDiag)diag
{
  return self->_diag;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (NSString)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(id)a3
{
  objc_storeStrong((id *)&self->_currentState, a3);
}

- (NSMutableDictionary)registeredActionTable
{
  return self->_registeredActionTable;
}

- (BOOL)performingEvent
{
  return self->_performingEvent;
}

- (void)setPerformingEvent:(BOOL)a3
{
  self->_performingEvent = a3;
}

- (NSString)pendingFollowupEvent
{
  return self->_pendingFollowupEvent;
}

- (void)setPendingFollowupEvent:(id)a3
{
  objc_storeStrong((id *)&self->_pendingFollowupEvent, a3);
}

- (id)pendingFollowupInfo
{
  return self->_pendingFollowupInfo;
}

- (void)setPendingFollowupInfo:(id)a3
{
  objc_storeStrong(&self->_pendingFollowupInfo, a3);
}

- (OS_dispatch_queue)extendedStateQueue
{
  return self->_extendedStateQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendedStateQueue, 0);
  objc_storeStrong(&self->_pendingFollowupInfo, 0);
  objc_storeStrong((id *)&self->_pendingFollowupEvent, 0);
  objc_storeStrong((id *)&self->_registeredActionTable, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_diag, 0);
  objc_storeStrong((id *)&self->_startState, 0);
  objc_storeStrong((id *)&self->_usageTable, 0);
  objc_storeStrong((id *)&self->_stateTable, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_instanceName, 0);
  objc_storeStrong((id *)&self->_fsmName, 0);
}

@end
