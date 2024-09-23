@implementation PLXPCRelay

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1)
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_47);
  return (id)sharedInstance__sharedRelay;
}

void __28__PLXPCRelay_sharedInstance__block_invoke()
{
  PLXPCRelay *v0;
  void *v1;

  v0 = objc_alloc_init(PLXPCRelay);
  v1 = (void *)sharedInstance__sharedRelay;
  sharedInstance__sharedRelay = (uint64_t)v0;

}

- (PLXPCRelay)init
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;
  xpc_connection_t mach_service;
  void *v8;
  _xpc_connection_s *v9;
  PLXPCRelay *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v18[4];
  id v19;
  _QWORD block[5];
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)PLXPCRelay;
  v2 = -[PLXPCRelay init](&v21, sel_init);
  if (!v2)
    goto LABEL_4;
  if (+[PLUtilities isLiteModeDaemon](PLUtilities, "isLiteModeDaemon"))
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create_with_target_V2("com.apple.powerlog_mover", v4, 0);
    v6 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v5;

    mach_service = xpc_connection_create_mach_service("com.apple.powerlog_mover", *((dispatch_queue_t *)v2 + 5), 1uLL);
    v8 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = mach_service;

    xpc_connection_set_context(*((xpc_connection_t *)v2 + 4), v2);
    v9 = (_xpc_connection_s *)*((_QWORD *)v2 + 4);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __18__PLXPCRelay_init__block_invoke_16;
    v18[3] = &unk_1E6A53CB0;
    v19 = v2;
    xpc_connection_set_event_handler(v9, v18);
    xpc_connection_activate(*((xpc_connection_t *)v2 + 4));

LABEL_4:
    v10 = (PLXPCRelay *)v2;
    goto LABEL_13;
  }
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v11 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __18__PLXPCRelay_init__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v11;
    if (init_defaultOnce_1 != -1)
      dispatch_once(&init_defaultOnce_1, block);
    if (init_classDebugEnabled_1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Relay: Bad processname, no xpc relay for you"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCRelay init]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v14, v15, 46);

      PLLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  v10 = 0;
LABEL_13:

  return v10;
}

BOOL __18__PLXPCRelay_init__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  init_classDebugEnabled_1 = result;
  return result;
}

void __18__PLXPCRelay_init__block_invoke_16(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (MEMORY[0x1BCC9F134]() == MEMORY[0x1E0C812E0])
    objc_msgSend(*(id *)(a1 + 32), "handleCrashMoverConnection:", v3);

}

- (void)startRelay
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  xpc_connection_t mach_service;
  _xpc_connection_s *v12;
  _xpc_connection_s *v13;
  NSObject *v14;
  _xpc_connection_s *v15;
  _xpc_connection_s *v16;
  _QWORD handler[5];
  _QWORD block[5];

  v3 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __24__PLXPCRelay_startRelay__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (startRelay_defaultOnce != -1)
      dispatch_once(&startRelay_defaultOnce, block);
    if (startRelay_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Relay: Relay running in aggd with service %s to %s"), "com.apple.powerlog.plxpclogger.xpc", "com.apple.powerlogd.XPCService.xpc");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCRelay startRelay]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v7, v8, 71);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  -[PLXPCRelay setRelayActive:](self, "setRelayActive:", 1);
  +[PLUtilities workQueueForKey:](PLUtilities, "workQueueForKey:", CFSTR("XPCRelay_Connection"));
  v10 = objc_claimAutoreleasedReturnValue();
  mach_service = xpc_connection_create_mach_service("com.apple.powerlog.plxpclogger.xpc", v10, 1uLL);
  -[PLXPCRelay setXpcConnection:](self, "setXpcConnection:", mach_service);

  -[PLXPCRelay xpcConnection](self, "xpcConnection");
  v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_set_context(v12, self);

  -[PLXPCRelay xpcConnection](self, "xpcConnection");
  v13 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(2, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  xpc_connection_set_target_queue(v13, v14);

  -[PLXPCRelay xpcConnection](self, "xpcConnection");
  v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  handler[0] = v4;
  handler[1] = 3221225472;
  handler[2] = __24__PLXPCRelay_startRelay__block_invoke_24;
  handler[3] = &unk_1E6A53CB0;
  handler[4] = self;
  xpc_connection_set_event_handler(v15, handler);

  -[PLXPCRelay xpcConnection](self, "xpcConnection");
  v16 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_activate(v16);

}

BOOL __24__PLXPCRelay_startRelay__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  startRelay_classDebugEnabled = result;
  return result;
}

void __24__PLXPCRelay_startRelay__block_invoke_24(uint64_t a1, void *a2)
{
  id v3;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  _xpc_connection_s *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _xpc_connection_s *v13;
  _xpc_connection_s *v14;
  void *context;
  NSObject *v16;
  _xpc_connection_s *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _QWORD handler[5];
  _xpc_connection_s *v23;
  _QWORD v24[5];
  _QWORD block[5];

  v3 = a2;
  v4 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
  v5 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __24__PLXPCRelay_startRelay__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (relayConnectionSync_block_invoke_defaultOnce != -1)
      dispatch_once(&relayConnectionSync_block_invoke_defaultOnce, block);
    if (relayConnectionSync_block_invoke_classDebugEnabled)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
      v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("Relay: event handler fired peerPID=%d %@"), xpc_connection_get_pid(v7), v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCRelay startRelay]_block_invoke");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v10, v11, 78);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  if (MEMORY[0x1BCC9F134](v3) != MEMORY[0x1E0C81310])
  {
    v13 = (_xpc_connection_s *)v3;
    objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
    v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    context = xpc_connection_get_context(v14);
    xpc_connection_set_context(v13, context);

    dispatch_get_global_queue(2, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    xpc_connection_set_target_queue(v13, v16);

    handler[0] = v5;
    handler[1] = 3221225472;
    handler[2] = __24__PLXPCRelay_startRelay__block_invoke_33;
    handler[3] = &unk_1E6A55D18;
    handler[4] = *(_QWORD *)(a1 + 32);
    v23 = v13;
    v17 = v13;
    xpc_connection_set_event_handler(v17, handler);
    xpc_connection_activate(v17);

LABEL_10:
    goto LABEL_18;
  }
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v24[0] = v5;
    v24[1] = 3221225472;
    v24[2] = __24__PLXPCRelay_startRelay__block_invoke_29;
    v24[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v24[4] = objc_opt_class();
    if (relayConnectionSync_block_invoke_defaultOnce_27 != -1)
      dispatch_once(&relayConnectionSync_block_invoke_defaultOnce_27, v24);
    if (relayConnectionSync_block_invoke_classDebugEnabled_28)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Relay: XPC error! %@"), v3);
      v17 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lastPathComponent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCRelay startRelay]_block_invoke_2");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v19, v20, 81);

      PLLogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      goto LABEL_10;
    }
  }
LABEL_18:

}

BOOL __24__PLXPCRelay_startRelay__block_invoke_2(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  relayConnectionSync_block_invoke_classDebugEnabled = result;
  return result;
}

BOOL __24__PLXPCRelay_startRelay__block_invoke_29(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  relayConnectionSync_block_invoke_classDebugEnabled_28 = result;
  return result;
}

void __24__PLXPCRelay_startRelay__block_invoke_33(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t pid;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t block;
  uint64_t v14;
  BOOL (*v15)(uint64_t);
  void *v16;
  uint64_t v17;

  v3 = a2;
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v4 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __24__PLXPCRelay_startRelay__block_invoke_2_34;
    v16 = &__block_descriptor_40_e5_v8__0lu32l8;
    v17 = v4;
    if (relayConnectionSync_block_invoke_2_defaultOnce != -1)
      dispatch_once(&relayConnectionSync_block_invoke_2_defaultOnce, &block);
    if (relayConnectionSync_block_invoke_2_classDebugEnabled)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 40));
      objc_msgSend(v5, "stringWithFormat:", CFSTR("Relay: peer(%d) connected"), pid, block, v14, v15, v16, v17);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCRelay startRelay]_block_invoke");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v9, v10, 88);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  xpc_connection_get_context(*(xpc_connection_t *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handlePeer:forEvent:", *(_QWORD *)(a1 + 40), v3);

}

BOOL __24__PLXPCRelay_startRelay__block_invoke_2_34(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  relayConnectionSync_block_invoke_2_classDebugEnabled = result;
  return result;
}

- (void)stopRelay
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _xpc_connection_s *v9;
  _QWORD block[5];

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v3 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __23__PLXPCRelay_stopRelay__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (stopRelay_defaultOnce != -1)
      dispatch_once(&stopRelay_defaultOnce, block);
    if (stopRelay_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Relay: closing relay in aggd with service %s to %s"), "com.apple.powerlog.plxpclogger.xpc", "com.apple.powerlogd.XPCService.xpc");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCRelay stopRelay]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v6, v7, 106);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  -[PLXPCRelay setRelayActive:](self, "setRelayActive:", 0);
  -[PLXPCRelay xpcConnection](self, "xpcConnection");
  v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_cancel(v9);

  -[PLXPCRelay setXpcConnection:](self, "setXpcConnection:", 0);
  -[PLXPCRelay resetRelayConnection](self, "resetRelayConnection");
}

BOOL __23__PLXPCRelay_stopRelay__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  stopRelay_classDebugEnabled = result;
  return result;
}

- (void)handleCrashMoverConnection:(id)a3
{
  _xpc_connection_s *v4;
  _QWORD handler[5];

  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __41__PLXPCRelay_handleCrashMoverConnection___block_invoke;
  handler[3] = &unk_1E6A53CB0;
  handler[4] = self;
  v4 = (_xpc_connection_s *)a3;
  xpc_connection_set_event_handler(v4, handler);
  xpc_connection_set_target_queue(v4, (dispatch_queue_t)self->_crashMoverQueue);
  xpc_connection_activate(v4);

}

uint64_t __41__PLXPCRelay_handleCrashMoverConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1BCC9F134](a2);
  if (result == MEMORY[0x1E0C812F8])
    return objc_msgSend(*(id *)(a1 + 32), "movePowerlogs");
  return result;
}

- (void)movePowerlogs
{
  if (+[PLDefaults fullMode](PLDefaults, "fullMode"))
    PLCrashMoverCopyPowerlog();
}

- (BOOL)isDebugEnabled
{
  uint64_t v2;
  _QWORD block[5];

  v2 = objc_opt_class();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__PLXPCRelay_isDebugEnabled__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  block[4] = v2;
  if (isDebugEnabled_defaultOnce != -1)
    dispatch_once(&isDebugEnabled_defaultOnce, block);
  return isDebugEnabled_classDebugEnabled
      || +[PLDefaults isClassNameDebugEnabled:](PLDefaults, "isClassNameDebugEnabled:", CFSTR("PLXPCService"));
}

BOOL __28__PLXPCRelay_isDebugEnabled__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  isDebugEnabled_classDebugEnabled = result;
  return result;
}

- (void)handlePeer:(id)a3 forEvent:(id)a4
{
  _xpc_connection_s *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  _BOOL4 v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  _BOOL4 v46;
  void *v47;
  _xpc_connection_s *v48;
  xpc_object_t v49;
  _BOOL4 v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  _BOOL4 v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  NSObject *v67;
  _BOOL4 v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  _xpc_connection_s *v75;
  _BOOL4 v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  NSObject *v84;
  void *v85;
  void *reply;
  NSObject *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  NSObject *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  xpc_object_t v121;
  _QWORD block[5];
  _QWORD v123[5];
  _QWORD v124[5];
  _QWORD v125[5];
  _QWORD v126[5];
  _QWORD v127[5];
  _QWORD v128[5];
  _QWORD v129[5];
  _QWORD v130[5];
  _QWORD v131[5];
  _QWORD v132[5];
  _QWORD v133[5];
  _QWORD v134[5];
  _QWORD v135[5];
  _QWORD v136[6];

  v6 = (_xpc_connection_s *)a3;
  v7 = a4;
  v8 = MEMORY[0x1BCC9F134]();
  if (v8 == MEMORY[0x1E0C81310])
  {
    if (v7 == (id)MEMORY[0x1E0C81260])
    {
      if (!+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
        goto LABEL_48;
      v31 = objc_opt_class();
      v136[0] = MEMORY[0x1E0C809B0];
      v136[1] = 3221225472;
      v136[2] = __34__PLXPCRelay_handlePeer_forEvent___block_invoke;
      v136[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v136[4] = v31;
      if (handlePeer_forEvent__defaultOnce != -1)
        dispatch_once(&handlePeer_forEvent__defaultOnce, v136);
      if (!handlePeer_forEvent__classDebugEnabled)
        goto LABEL_48;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Relay: peer(%d) received XPC_ERROR_CONNECTION_INVALID"), xpc_connection_get_pid(v6));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "lastPathComponent");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCRelay handlePeer:forEvent:]");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v33, v34, 146);

      PLLogCommon();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
    }
    else if (v7 == (id)MEMORY[0x1E0C81258])
    {
      if (!+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
        goto LABEL_48;
      v35 = objc_opt_class();
      v135[0] = MEMORY[0x1E0C809B0];
      v135[1] = 3221225472;
      v135[2] = __34__PLXPCRelay_handlePeer_forEvent___block_invoke_45;
      v135[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v135[4] = v35;
      if (handlePeer_forEvent__defaultOnce_43 != -1)
        dispatch_once(&handlePeer_forEvent__defaultOnce_43, v135);
      if (!handlePeer_forEvent__classDebugEnabled_44)
        goto LABEL_48;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Relay: peer(%d) received XPC_ERROR_CONNECTION_INTERRUPTED"), xpc_connection_get_pid(v6));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "lastPathComponent");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCRelay handlePeer:forEvent:]");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v37, v38, 150);

      PLLogCommon();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
    }
    else
    {
      v15 = (id)MEMORY[0x1E0C81288];
      v16 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
      if (v7 == v15)
      {
        if (!v16)
          goto LABEL_48;
        v39 = objc_opt_class();
        v134[0] = MEMORY[0x1E0C809B0];
        v134[1] = 3221225472;
        v134[2] = __34__PLXPCRelay_handlePeer_forEvent___block_invoke_50;
        v134[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v134[4] = v39;
        if (handlePeer_forEvent__defaultOnce_48 != -1)
          dispatch_once(&handlePeer_forEvent__defaultOnce_48, v134);
        if (!handlePeer_forEvent__classDebugEnabled_49)
          goto LABEL_48;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Relay: peer(%d) received XPC_ERROR_TERMINATION_IMMINENT"), xpc_connection_get_pid(v6));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "lastPathComponent");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCRelay handlePeer:forEvent:]");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v41, v42, 154);

        PLLogCommon();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
      }
      else
      {
        if (!v16)
          goto LABEL_48;
        v17 = objc_opt_class();
        v133[0] = MEMORY[0x1E0C809B0];
        v133[1] = 3221225472;
        v133[2] = __34__PLXPCRelay_handlePeer_forEvent___block_invoke_55;
        v133[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v133[4] = v17;
        if (handlePeer_forEvent__defaultOnce_53 != -1)
          dispatch_once(&handlePeer_forEvent__defaultOnce_53, v133);
        if (!handlePeer_forEvent__classDebugEnabled_54)
          goto LABEL_48;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Relay: peer(%d) received Unidentified error:%@"), xpc_connection_get_pid(v6), v7);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lastPathComponent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCRelay handlePeer:forEvent:]");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v20, v21, 159);

        PLLogCommon();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
      }
    }

LABEL_48:
    xpc_connection_cancel(v6);
    goto LABEL_133;
  }
  if (v8 == MEMORY[0x1E0C812F8])
  {
    v23 = (void *)_CFXPCCreateCFObjectFromXPCMessage();
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v24 = objc_opt_class();
      v132[0] = MEMORY[0x1E0C809B0];
      v132[1] = 3221225472;
      v132[2] = __34__PLXPCRelay_handlePeer_forEvent___block_invoke_60;
      v132[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v132[4] = v24;
      if (handlePeer_forEvent__defaultOnce_58 != -1)
        dispatch_once(&handlePeer_forEvent__defaultOnce_58, v132);
      if (handlePeer_forEvent__classDebugEnabled_59)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Relay: message = %@"), v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "lastPathComponent");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCRelay handlePeer:forEvent:]");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v25, v27, v28, 165);

        PLLogCommon();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    if (!v23)
      goto LABEL_132;
    objc_msgSend(v23, "objectForKey:", CFSTR("shouldLog"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {

    }
    else
    {
      objc_msgSend(v23, "objectForKey:", CFSTR("Query"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v43)
      {
        objc_msgSend(v23, "objectForKey:", CFSTR("Post"));
        v94 = (void *)objc_claimAutoreleasedReturnValue();

        if (v94)
        {
          v95 = (void *)_CFXPCCreateXPCMessageWithCFObject();
          -[PLXPCRelay relayConnection](self, "relayConnection");
          v96 = objc_claimAutoreleasedReturnValue();
          xpc_connection_send_notification();
        }
        else
        {
          if (!+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
            goto LABEL_132;
          v111 = objc_opt_class();
          v123[0] = MEMORY[0x1E0C809B0];
          v123[1] = 3221225472;
          v123[2] = __34__PLXPCRelay_handlePeer_forEvent___block_invoke_113;
          v123[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v123[4] = v111;
          if (handlePeer_forEvent__defaultOnce_111 != -1)
            dispatch_once(&handlePeer_forEvent__defaultOnce_111, v123);
          if (!handlePeer_forEvent__classDebugEnabled_112)
            goto LABEL_132;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Message with no direction: %@"), v23);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "lastPathComponent");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCRelay handlePeer:forEvent:]");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v95, v113, v114, 229);

          PLLogCommon();
          v96 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
        }

LABEL_132:
        goto LABEL_133;
      }
    }
    objc_msgSend(v23, "objectForKey:", CFSTR("Query"));
    v44 = objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      v45 = (void *)v44;
      v46 = +[PLUtilities allowQueryFromPeer:](PLUtilities, "allowQueryFromPeer:", v6);

      if (!v46)
        goto LABEL_132;
    }
    v47 = (void *)_CFXPCCreateXPCMessageWithCFObject();
    -[PLXPCRelay relayConnection](self, "relayConnection");
    v48 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v49 = xpc_connection_send_message_with_reply_sync(v48, v47);

    v50 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
    if (!v49)
    {
      if (!v50)
        goto LABEL_131;
      v88 = objc_opt_class();
      v131[0] = MEMORY[0x1E0C809B0];
      v131[1] = 3221225472;
      v131[2] = __34__PLXPCRelay_handlePeer_forEvent___block_invoke_69;
      v131[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v131[4] = v88;
      v89 = v23;
      if (handlePeer_forEvent__defaultOnce_67 != -1)
        dispatch_once(&handlePeer_forEvent__defaultOnce_67, v131);
      if (!handlePeer_forEvent__classDebugEnabled_68)
        goto LABEL_131;
      v121 = 0;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Relay: no xpc_response"));
      v90 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "lastPathComponent");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCRelay handlePeer:forEvent:]");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v90, v92, v93, 177);

      PLLogCommon();
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
      v23 = v89;
      v58 = (void *)v90;
      goto LABEL_128;
    }
    v121 = v49;
    if (v50)
    {
      v51 = objc_opt_class();
      v130[0] = MEMORY[0x1E0C809B0];
      v130[1] = 3221225472;
      v130[2] = __34__PLXPCRelay_handlePeer_forEvent___block_invoke_74;
      v130[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v130[4] = v51;
      if (handlePeer_forEvent__defaultOnce_72 != -1)
        dispatch_once(&handlePeer_forEvent__defaultOnce_72, v130);
      if (handlePeer_forEvent__classDebugEnabled_73)
      {
        v116 = v47;
        v52 = v23;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Relay: xpc_response=%@"), v49);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "lastPathComponent");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCRelay handlePeer:forEvent:]");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v53, v55, v56, 183);

        PLLogCommon();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

        v23 = v52;
        v47 = v116;
        v49 = v121;
      }
    }
    xpc_dictionary_get_value(v49, (const char *)objc_msgSend(CFSTR("PLXPCConnectionReturnDict"), "UTF8String"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
    if (v58)
    {
      v120 = v58;
      if (v59)
      {
        v60 = objc_opt_class();
        v128[0] = MEMORY[0x1E0C809B0];
        v128[1] = 3221225472;
        v128[2] = __34__PLXPCRelay_handlePeer_forEvent___block_invoke_86;
        v128[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v128[4] = v60;
        if (handlePeer_forEvent__defaultOnce_84 != -1)
          dispatch_once(&handlePeer_forEvent__defaultOnce_84, v128);
        if (handlePeer_forEvent__classDebugEnabled_85)
        {
          v117 = v47;
          v61 = v23;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Relay: xpc_return_dict=%@"), v58);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "lastPathComponent");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCRelay handlePeer:forEvent:]");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v62, v64, v65, 194);

          PLLogCommon();
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

          v23 = v61;
          v47 = v117;
        }
      }
      v67 = _CFXPCCreateCFObjectFromXPCMessage();
      v68 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
      if (v67)
      {
        if (v68)
        {
          v69 = objc_opt_class();
          v126[0] = MEMORY[0x1E0C809B0];
          v126[1] = 3221225472;
          v126[2] = __34__PLXPCRelay_handlePeer_forEvent___block_invoke_96;
          v126[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v126[4] = v69;
          if (handlePeer_forEvent__defaultOnce_94 != -1)
            dispatch_once(&handlePeer_forEvent__defaultOnce_94, v126);
          if (handlePeer_forEvent__classDebugEnabled_95)
          {
            v115 = v23;
            v118 = v47;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Relay: response=%@"), v67);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "lastPathComponent");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCRelay handlePeer:forEvent:]");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v70, v72, v73, 206);

            PLLogCommon();
            v74 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
              -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

            v23 = v115;
            v47 = v118;
          }
        }
        xpc_dictionary_get_remote_connection(v7);
        v75 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
        v76 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
        if (v75)
        {
          if (v76)
          {
            v77 = objc_opt_class();
            v124[0] = MEMORY[0x1E0C809B0];
            v124[1] = 3221225472;
            v124[2] = __34__PLXPCRelay_handlePeer_forEvent___block_invoke_106;
            v124[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v124[4] = v77;
            if (handlePeer_forEvent__defaultOnce_104 != -1)
              dispatch_once(&handlePeer_forEvent__defaultOnce_104, v124);
            if (handlePeer_forEvent__classDebugEnabled_105)
            {
              v119 = v47;
              v78 = v23;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Relay: have remoteConnection"));
              v79 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v80, "lastPathComponent");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              v82 = (void *)v79;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCRelay handlePeer:forEvent:]");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v82, v81, v83, 217);

              PLLogCommon();
              v84 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
                -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

              v23 = v78;
              v47 = v119;
            }
          }
          v85 = v23;
          reply = xpc_dictionary_create_reply(v7);
          v87 = _CFXPCCreateXPCMessageWithCFObject();
          xpc_dictionary_set_value(reply, (const char *)objc_msgSend(CFSTR("PLXPCConnectionReturnDict"), "UTF8String"), v87);
          xpc_connection_send_message(v75, reply);
LABEL_85:

          v23 = v85;
LABEL_127:

LABEL_128:
LABEL_129:
          v49 = v121;
LABEL_130:

LABEL_131:
          goto LABEL_132;
        }
        if (!v76)
          goto LABEL_127;
        v107 = objc_opt_class();
        v125[0] = MEMORY[0x1E0C809B0];
        v125[1] = 3221225472;
        v125[2] = __34__PLXPCRelay_handlePeer_forEvent___block_invoke_101;
        v125[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v125[4] = v107;
        if (handlePeer_forEvent__defaultOnce_99 != -1)
          dispatch_once(&handlePeer_forEvent__defaultOnce_99, v125);
        if (handlePeer_forEvent__classDebugEnabled_100)
        {
          v85 = v23;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Relay: no remoteConnection"));
          reply = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "lastPathComponent");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCRelay handlePeer:forEvent:]");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", reply, v109, v110, 211);

          PLLogCommon();
          v87 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
          v58 = v120;
          goto LABEL_85;
        }
      }
      else
      {
        if (!v68)
          goto LABEL_129;
        v103 = objc_opt_class();
        v127[0] = MEMORY[0x1E0C809B0];
        v127[1] = 3221225472;
        v127[2] = __34__PLXPCRelay_handlePeer_forEvent___block_invoke_91;
        v127[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v127[4] = v103;
        if (handlePeer_forEvent__defaultOnce_89 != -1)
          dispatch_once(&handlePeer_forEvent__defaultOnce_89, v127);
        if (!handlePeer_forEvent__classDebugEnabled_90)
        {
          v49 = v121;
          goto LABEL_130;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Relay: no response"));
        v67 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "lastPathComponent");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCRelay handlePeer:forEvent:]");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v67, v105, v106, 200);

        PLLogCommon();
        v75 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v75, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
      }
    }
    else
    {
      if (!v59)
        goto LABEL_130;
      v97 = objc_opt_class();
      v129[0] = MEMORY[0x1E0C809B0];
      v129[1] = 3221225472;
      v129[2] = __34__PLXPCRelay_handlePeer_forEvent___block_invoke_81;
      v129[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v129[4] = v97;
      if (handlePeer_forEvent__defaultOnce_79 != -1)
        dispatch_once(&handlePeer_forEvent__defaultOnce_79, v129);
      if (!handlePeer_forEvent__classDebugEnabled_80)
        goto LABEL_129;
      v120 = 0;
      v98 = v47;
      v99 = v23;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Relay: no xpc_return_dict"));
      v67 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "lastPathComponent");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCRelay handlePeer:forEvent:]");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v67, v101, v102, 188);

      PLLogCommon();
      v75 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v75, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
      v23 = v99;
      v47 = v98;
    }
    v58 = v120;
    goto LABEL_127;
  }
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v9 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34__PLXPCRelay_handlePeer_forEvent___block_invoke_118;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (handlePeer_forEvent__defaultOnce_116 != -1)
      dispatch_once(&handlePeer_forEvent__defaultOnce_116, block);
    if (handlePeer_forEvent__classDebugEnabled_117)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Relay: unknown type"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCRelay handlePeer:forEvent:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v12, v13, 233);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
LABEL_133:

}

BOOL __34__PLXPCRelay_handlePeer_forEvent___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handlePeer_forEvent__classDebugEnabled = result;
  return result;
}

BOOL __34__PLXPCRelay_handlePeer_forEvent___block_invoke_45(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handlePeer_forEvent__classDebugEnabled_44 = result;
  return result;
}

BOOL __34__PLXPCRelay_handlePeer_forEvent___block_invoke_50(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handlePeer_forEvent__classDebugEnabled_49 = result;
  return result;
}

BOOL __34__PLXPCRelay_handlePeer_forEvent___block_invoke_55(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handlePeer_forEvent__classDebugEnabled_54 = result;
  return result;
}

BOOL __34__PLXPCRelay_handlePeer_forEvent___block_invoke_60(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handlePeer_forEvent__classDebugEnabled_59 = result;
  return result;
}

BOOL __34__PLXPCRelay_handlePeer_forEvent___block_invoke_69(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handlePeer_forEvent__classDebugEnabled_68 = result;
  return result;
}

BOOL __34__PLXPCRelay_handlePeer_forEvent___block_invoke_74(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handlePeer_forEvent__classDebugEnabled_73 = result;
  return result;
}

BOOL __34__PLXPCRelay_handlePeer_forEvent___block_invoke_81(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handlePeer_forEvent__classDebugEnabled_80 = result;
  return result;
}

BOOL __34__PLXPCRelay_handlePeer_forEvent___block_invoke_86(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handlePeer_forEvent__classDebugEnabled_85 = result;
  return result;
}

BOOL __34__PLXPCRelay_handlePeer_forEvent___block_invoke_91(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handlePeer_forEvent__classDebugEnabled_90 = result;
  return result;
}

BOOL __34__PLXPCRelay_handlePeer_forEvent___block_invoke_96(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handlePeer_forEvent__classDebugEnabled_95 = result;
  return result;
}

BOOL __34__PLXPCRelay_handlePeer_forEvent___block_invoke_101(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handlePeer_forEvent__classDebugEnabled_100 = result;
  return result;
}

BOOL __34__PLXPCRelay_handlePeer_forEvent___block_invoke_106(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handlePeer_forEvent__classDebugEnabled_105 = result;
  return result;
}

BOOL __34__PLXPCRelay_handlePeer_forEvent___block_invoke_113(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handlePeer_forEvent__classDebugEnabled_112 = result;
  return result;
}

BOOL __34__PLXPCRelay_handlePeer_forEvent___block_invoke_118(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handlePeer_forEvent__classDebugEnabled_117 = result;
  return result;
}

- (OS_xpc_object)relayConnection
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  OS_xpc_object *mach_service;
  OS_xpc_object *relayConnection;
  uint64_t v18;
  OS_xpc_object *v19;
  void *v20;
  void *v21;
  void *v22;
  OS_xpc_object *v23;
  uint64_t v25;
  uint64_t v26;
  BOOL (*v27)(uint64_t);
  void *v28;
  uint64_t v29;
  _QWORD v30[5];
  _QWORD handler[5];
  _QWORD block[5];

  objc_sync_enter(CFSTR("__relayConnectionSync__"));
  if (self->_relayConnection)
  {
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v3 = objc_opt_class();
      v25 = MEMORY[0x1E0C809B0];
      v26 = 3221225472;
      v27 = __29__PLXPCRelay_relayConnection__block_invoke_149;
      v28 = &__block_descriptor_40_e5_v8__0lu32l8;
      v29 = v3;
      if (relayConnection_defaultOnce_147 != -1)
        dispatch_once(&relayConnection_defaultOnce_147, &v25);
      if (relayConnection_classDebugEnabled_148)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Relay: Reusing connection!"), v25, v26, v27, v28, v29);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "lastPathComponent");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCRelay relayConnection]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v6, v7, 265);

        PLLogCommon();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
LABEL_21:

      }
    }
  }
  else
  {
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v9 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __29__PLXPCRelay_relayConnection__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v9;
      if (relayConnection_defaultOnce != -1)
        dispatch_once(&relayConnection_defaultOnce, block);
      if (relayConnection_classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Relay: creating connection!"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lastPathComponent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCRelay relayConnection]");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v12, v13, 246);

        PLLogCommon();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    +[PLUtilities workQueueForKey:](PLUtilities, "workQueueForKey:", CFSTR("XPCRelay_Relay"));
    v15 = objc_claimAutoreleasedReturnValue();
    mach_service = xpc_connection_create_mach_service("com.apple.powerlogd.XPCService.xpc", v15, 0);
    relayConnection = self->_relayConnection;
    self->_relayConnection = mach_service;

    v18 = MEMORY[0x1E0C809B0];
    v19 = self->_relayConnection;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __29__PLXPCRelay_relayConnection__block_invoke_125;
    handler[3] = &unk_1E6A53CB0;
    handler[4] = self;
    xpc_connection_set_event_handler(v19, handler);
    xpc_connection_activate(self->_relayConnection);
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v30[0] = v18;
      v30[1] = 3221225472;
      v30[2] = __29__PLXPCRelay_relayConnection__block_invoke_144;
      v30[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v30[4] = objc_opt_class();
      if (relayConnection_defaultOnce_142 != -1)
        dispatch_once(&relayConnection_defaultOnce_142, v30);
      if (relayConnection_classDebugEnabled_143)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Relay: connection created!"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "lastPathComponent");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCRelay relayConnection]");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v21, v22, 263);

        PLLogCommon();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
        goto LABEL_21;
      }
    }
  }
  v23 = self->_relayConnection;
  objc_sync_exit(CFSTR("__relayConnectionSync__"));
  return v23;
}

BOOL __29__PLXPCRelay_relayConnection__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  relayConnection_classDebugEnabled = result;
  return result;
}

void __29__PLXPCRelay_relayConnection__block_invoke_125(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  _xpc_connection_s *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD block[5];

  v3 = a2;
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v4 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __29__PLXPCRelay_relayConnection__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (relayConnectionSync_block_invoke_3_defaultOnce != -1)
      dispatch_once(&relayConnectionSync_block_invoke_3_defaultOnce, block);
    if (relayConnectionSync_block_invoke_3_classDebugEnabled)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "relayConnection");
      v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("Relay: event handler fired peerPID=%d %@"), xpc_connection_get_pid(v6), v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCRelay relayConnection]_block_invoke");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v9, v10, 249);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  v12 = MEMORY[0x1BCC9F134](v3);
  v13 = MEMORY[0x1E0C81310];
  v14 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
  if (v12 == v13)
  {
    if (v14)
    {
      v21 = objc_opt_class();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __29__PLXPCRelay_relayConnection__block_invoke_128;
      v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v35[4] = v21;
      if (relayConnectionSync_block_invoke_3_defaultOnce_126 != -1)
        dispatch_once(&relayConnectionSync_block_invoke_3_defaultOnce_126, v35);
      if (relayConnectionSync_block_invoke_3_classDebugEnabled_127)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*** Relay ERROR*** XPC error! %@"), v3);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "lastPathComponent");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCRelay relayConnection]_block_invoke_2");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v22, v24, v25, 252);

        PLLogCommon();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    if (v3 == (id)MEMORY[0x1E0C81260] || v3 == (id)MEMORY[0x1E0C81258])
    {
      if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
      {
        v27 = objc_opt_class();
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __29__PLXPCRelay_relayConnection__block_invoke_134;
        v34[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v34[4] = v27;
        if (relayConnectionSync_block_invoke_3_defaultOnce_132 != -1)
          dispatch_once(&relayConnectionSync_block_invoke_3_defaultOnce_132, v34);
        if (relayConnectionSync_block_invoke_3_classDebugEnabled_133)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*** Relay RESET *** Resetting our connection"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "lastPathComponent");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCRelay relayConnection]_block_invoke_2");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v30, v31, 254);

          PLLogCommon();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

        }
      }
      objc_msgSend(*(id *)(a1 + 32), "resetRelayConnection");
    }
  }
  else if (v14)
  {
    v15 = objc_opt_class();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __29__PLXPCRelay_relayConnection__block_invoke_139;
    v33[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v33[4] = v15;
    if (relayConnectionSync_block_invoke_3_defaultOnce_137 != -1)
      dispatch_once(&relayConnectionSync_block_invoke_3_defaultOnce_137, v33);
    if (relayConnectionSync_block_invoke_3_classDebugEnabled_138)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*** Relay ERROR*** XPC relay back? %@"), v3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogCore/PLXPCRelay.m");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCRelay relayConnection]_block_invoke_2");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v18, v19, 259);

      PLLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }

}

BOOL __29__PLXPCRelay_relayConnection__block_invoke_2(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  relayConnectionSync_block_invoke_3_classDebugEnabled = result;
  return result;
}

BOOL __29__PLXPCRelay_relayConnection__block_invoke_128(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  relayConnectionSync_block_invoke_3_classDebugEnabled_127 = result;
  return result;
}

BOOL __29__PLXPCRelay_relayConnection__block_invoke_134(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  relayConnectionSync_block_invoke_3_classDebugEnabled_133 = result;
  return result;
}

BOOL __29__PLXPCRelay_relayConnection__block_invoke_139(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  relayConnectionSync_block_invoke_3_classDebugEnabled_138 = result;
  return result;
}

BOOL __29__PLXPCRelay_relayConnection__block_invoke_144(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  relayConnection_classDebugEnabled_143 = result;
  return result;
}

BOOL __29__PLXPCRelay_relayConnection__block_invoke_149(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  relayConnection_classDebugEnabled_148 = result;
  return result;
}

- (void)resetRelayConnection
{
  OS_xpc_object *relayConnection;
  OS_xpc_object *v4;

  objc_sync_enter(CFSTR("__relayConnectionSync__"));
  relayConnection = self->_relayConnection;
  if (relayConnection)
  {
    xpc_connection_cancel(relayConnection);
    v4 = self->_relayConnection;
    self->_relayConnection = 0;

  }
  objc_sync_exit(CFSTR("__relayConnectionSync__"));
}

- (BOOL)relayActive
{
  return self->_relayActive;
}

- (void)setRelayActive:(BOOL)a3
{
  self->_relayActive = a3;
}

- (OS_xpc_object)xpcConnection
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 16, 1);
}

- (void)setXpcConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setRelayConnection:(id)a3
{
  objc_storeStrong((id *)&self->_relayConnection, a3);
}

- (OS_xpc_object)xpcCrashMoverConn
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 32, 1);
}

- (void)setXpcCrashMoverConn:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (OS_dispatch_queue)crashMoverQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCrashMoverQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crashMoverQueue, 0);
  objc_storeStrong((id *)&self->_xpcCrashMoverConn, 0);
  objc_storeStrong((id *)&self->_relayConnection, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
