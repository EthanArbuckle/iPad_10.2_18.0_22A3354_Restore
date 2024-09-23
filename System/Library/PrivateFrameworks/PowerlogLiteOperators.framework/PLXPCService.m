@implementation PLXPCService

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
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  BOOL v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  NSObject *v80;
  void *v81;
  int v82;
  void *v83;
  _QWORD v84[5];
  _xpc_connection_s *v85;
  id v86;
  _QWORD v87[5];
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _QWORD v92[5];
  _QWORD v93[5];
  _QWORD v94[5];
  _QWORD v95[5];
  _QWORD v96[5];
  _QWORD block[5];
  uint8_t v98[128];
  uint8_t buf[4];
  void *v100;
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v6 = (_xpc_connection_s *)a3;
  v7 = a4;
  v8 = MEMORY[0x1D179CB2C]();
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v9 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__PLXPCService_handlePeer_forEvent___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1ED885AC8 != -1)
      dispatch_once(&qword_1ED885AC8, block);
    if (byte_1ED885A03)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("!!! %s/%d: type=%@, event=%@"), "-[PLXPCService handlePeer:forEvent:]", 487, v8, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService handlePeer:forEvent:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 487);

      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v100 = v10;
        _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if (v8 == MEMORY[0x1E0C81310])
  {
    if (v7 == (id)MEMORY[0x1E0C81260])
    {
      if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        goto LABEL_68;
      v50 = objc_opt_class();
      v96[0] = MEMORY[0x1E0C809B0];
      v96[1] = 3221225472;
      v96[2] = __36__PLXPCService_handlePeer_forEvent___block_invoke_478;
      v96[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v96[4] = v50;
      if (qword_1ED885AD0 != -1)
        dispatch_once(&qword_1ED885AD0, v96);
      if (!byte_1ED885A04)
        goto LABEL_68;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("peer(%d) received XPC_ERROR_CONNECTION_INVALID"), xpc_connection_get_pid(v6));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "lastPathComponent");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService handlePeer:forEvent:]");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "logMessage:fromFile:fromFunction:fromLineNumber:", v44, v53, v54, 492);

      PLLogCommon();
      v49 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        goto LABEL_67;
      *(_DWORD *)buf = 138412290;
      v100 = v44;
    }
    else if (v7 == (id)MEMORY[0x1E0C81258])
    {
      if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        goto LABEL_68;
      v61 = objc_opt_class();
      v95[0] = MEMORY[0x1E0C809B0];
      v95[1] = 3221225472;
      v95[2] = __36__PLXPCService_handlePeer_forEvent___block_invoke_483;
      v95[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v95[4] = v61;
      if (qword_1ED885AD8 != -1)
        dispatch_once(&qword_1ED885AD8, v95);
      if (!byte_1ED885A05)
        goto LABEL_68;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("peer(%d) received XPC_ERROR_CONNECTION_INTERRUPTED"), xpc_connection_get_pid(v6));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "lastPathComponent");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService handlePeer:forEvent:]");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "logMessage:fromFile:fromFunction:fromLineNumber:", v44, v64, v65, 496);

      PLLogCommon();
      v49 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        goto LABEL_67;
      *(_DWORD *)buf = 138412290;
      v100 = v44;
    }
    else
    {
      v41 = (id)MEMORY[0x1E0C81288];
      v42 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
      if (v7 == v41)
      {
        if (!v42)
          goto LABEL_68;
        v66 = objc_opt_class();
        v94[0] = MEMORY[0x1E0C809B0];
        v94[1] = 3221225472;
        v94[2] = __36__PLXPCService_handlePeer_forEvent___block_invoke_488;
        v94[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v94[4] = v66;
        if (qword_1ED885AE0 != -1)
          dispatch_once(&qword_1ED885AE0, v94);
        if (!byte_1ED885A06)
          goto LABEL_68;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("peer(%d) received XPC_ERROR_TERMINATION_IMMINENT"), xpc_connection_get_pid(v6));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "lastPathComponent");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService handlePeer:forEvent:]");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "logMessage:fromFile:fromFunction:fromLineNumber:", v44, v69, v70, 500);

        PLLogCommon();
        v49 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
          goto LABEL_67;
        *(_DWORD *)buf = 138412290;
        v100 = v44;
      }
      else
      {
        if (!v42)
          goto LABEL_68;
        v43 = objc_opt_class();
        v93[0] = MEMORY[0x1E0C809B0];
        v93[1] = 3221225472;
        v93[2] = __36__PLXPCService_handlePeer_forEvent___block_invoke_493;
        v93[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v93[4] = v43;
        if (qword_1ED885AE8 != -1)
          dispatch_once(&qword_1ED885AE8, v93);
        if (!byte_1ED885A07)
          goto LABEL_68;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("peer(%d) received Unidentified error:%@"), xpc_connection_get_pid(v6), v7);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "lastPathComponent");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService handlePeer:forEvent:]");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "logMessage:fromFile:fromFunction:fromLineNumber:", v44, v47, v48, 505);

        PLLogCommon();
        v49 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
LABEL_67:

LABEL_68:
          xpc_connection_cancel(v6);
          goto LABEL_84;
        }
        *(_DWORD *)buf = 138412290;
        v100 = v44;
      }
    }
    _os_log_debug_impl(&dword_1CAF47000, v49, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    goto LABEL_67;
  }
  if (v8 == MEMORY[0x1E0C812F8])
  {
    v16 = (void *)_CFXPCCreateCFObjectFromXPCMessage();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("content"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no message"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "lastPathComponent");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService handlePeer:forEvent:]");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "logMessage:fromFile:fromFunction:fromLineNumber:", v55, v58, v59, 549);

        PLLogCommon();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v100 = v55;
          _os_log_debug_impl(&dword_1CAF47000, v60, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
      if (objc_msgSend(MEMORY[0x1E0D80078], "isPowerlogHelperd"))
        -[PLXPCService setSatelliteProcessExitWithTime:](self, "setSatelliteProcessExitWithTime:", 10.0);
      goto LABEL_83;
    }
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("clientID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "shortValue");

    if (v19 == 110)
    {
      objc_msgSend(v17, "objectForKey:", CFSTR("PLXPCBatchedMessage"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      if (v71)
      {
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("PLXPCBatchedMessage"));
        v29 = (id)objc_claimAutoreleasedReturnValue();
        v84[0] = MEMORY[0x1E0C809B0];
        v84[1] = 3221225472;
        v84[2] = __36__PLXPCService_handlePeer_forEvent___block_invoke_511;
        v84[3] = &unk_1E8580768;
        v84[4] = self;
        v85 = v6;
        v86 = v7;
        objc_msgSend(v29, "enumerateKeysAndObjectsUsingBlock:", v84);

LABEL_82:
        goto LABEL_83;
      }
    }
    else if ((unsigned __int16)v19 == 51)
    {
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v20 = objc_opt_class();
        v92[0] = MEMORY[0x1E0C809B0];
        v92[1] = 3221225472;
        v92[2] = __36__PLXPCService_handlePeer_forEvent___block_invoke_500;
        v92[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v92[4] = v20;
        if (qword_1ED885AF0 != -1)
          dispatch_once(&qword_1ED885AF0, v92);
        if (byte_1ED885A08)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Got a batched message %@"), v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "lastPathComponent");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService handlePeer:forEvent:]");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v24, v25, 517);

          PLLogCommon();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v100 = v21;
            _os_log_debug_impl(&dword_1CAF47000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("PLXPCBatchedMessage"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("PLXPCBatchedMessageDropCounts"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = objc_msgSend(v28, "intValue");

      v90 = 0u;
      v91 = 0u;
      v88 = 0u;
      v89 = 0u;
      v29 = v27;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v88, v98, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v89;
        do
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v89 != v32)
              objc_enumerationMutation(v29);
            -[PLXPCService handleSingleMessage:fromPeer:forEvent:](self, "handleSingleMessage:fromPeer:forEvent:", *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * i), v6, v7);
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v88, v98, 16);
        }
        while (v31);
      }

      +[PLOperator entryKeyForType:andName:](PLXPCService, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("ClientLoggingDrops"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)MEMORY[0x1E0D7FFC0];
      -[PLOperator className](self, "className");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v35) = objc_msgSend(v35, "isEntryKeySetup:forOperatorName:", v34, v36);

      if ((_DWORD)v35)
        v37 = v82 < 1;
      else
        v37 = 1;
      if (!v37)
      {
        if (objc_msgSend(v29, "count"))
        {
          objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("clientID"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "shortValue");

        }
        else
        {
          v40 = 0;
        }
        v81 = v34;
        v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v34);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v82);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "setObject:forKeyedSubscript:", v73, CFSTR("PLXPCBatchedMessageDropCounts"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v40);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "setObject:forKeyedSubscript:", v74, CFSTR("clientID"));

        -[PLOperator logEntry:](self, "logEntry:", v72);
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v75 = objc_opt_class();
          v87[0] = MEMORY[0x1E0C809B0];
          v87[1] = 3221225472;
          v87[2] = __36__PLXPCService_handlePeer_forEvent___block_invoke_508;
          v87[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v87[4] = v75;
          if (qword_1ED885AF8 != -1)
            dispatch_once(&qword_1ED885AF8, v87);
          if (byte_1ED885A09)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Dropped messages %@"), v72);
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v76 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "lastPathComponent");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService handlePeer:forEvent:]");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "logMessage:fromFile:fromFunction:fromLineNumber:", v83, v78, v79, 534);

            PLLogCommon();
            v80 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v100 = v83;
              _os_log_debug_impl(&dword_1CAF47000, v80, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

          }
        }

        v34 = v81;
      }

      goto LABEL_82;
    }
    -[PLXPCService handleSingleMessage:fromPeer:forEvent:](self, "handleSingleMessage:fromPeer:forEvent:", v16, v6, v7);
LABEL_83:

  }
LABEL_84:

}

- (void)handleSingleMessage:(id)a3 fromPeer:(id)a4 forEvent:(id)a5
{
  id v8;
  _xpc_connection_s *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  uint64_t v20;
  id v21;
  _xpc_connection_s *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  double v29;
  uint64_t v30;
  id v31;
  _xpc_connection_s *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  id v41;
  _xpc_connection_s *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  const __CFString *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  id v53;
  _xpc_connection_s *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  int v62;
  uint64_t v63;
  id v64;
  _xpc_connection_s *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  uint64_t v72;
  id v73;
  _xpc_connection_s *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  NSObject *v86;
  _xpc_connection_s *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  unsigned int v102;
  unsigned int v103;
  unsigned int v104;
  unsigned int v105;
  _xpc_connection_s *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  _QWORD v116[5];
  _QWORD v117[5];
  _QWORD v118[5];
  _QWORD block[5];
  _QWORD v120[5];
  _QWORD v121[5];
  _QWORD v122[5];
  uint8_t buf[4];
  void *v124;
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (_xpc_connection_s *)a4;
  v10 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("clientID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "shortValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("process-name"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("event"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0x1E0D80000uLL;
  if (objc_msgSend(MEMORY[0x1E0D80078], "isPowerlogHelperd"))
  {
    if ((_DWORD)v12 != 48)
    {
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v30 = objc_opt_class();
        v122[0] = MEMORY[0x1E0C809B0];
        v122[1] = 3221225472;
        v122[2] = __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke;
        v122[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v122[4] = v30;
        if (qword_1ED885B00 != -1)
          dispatch_once(&qword_1ED885B00, v122);
        if (byte_1ED885A0A)
        {
          v102 = v12;
          v109 = v14;
          v31 = v10;
          v32 = v9;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("!!! %s/%d: message=%@"), "-[PLXPCService handleSingleMessage:fromPeer:forEvent:]", 571, v8);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "lastPathComponent");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService handleSingleMessage:fromPeer:forEvent:]");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "logMessage:fromFile:fromFunction:fromLineNumber:", v33, v36, v37, 571);

          PLLogCommon();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v124 = v33;
            _os_log_debug_impl(&dword_1CAF47000, v38, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v9 = v32;
          v10 = v31;
          v14 = v109;
          v12 = v102;
          v15 = 0x1E0D80000uLL;
        }
      }
      v29 = 30.0;
      goto LABEL_20;
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("content"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("battery_gauge_event"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "intValue");

    v19 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
    if (v18 == 1)
    {
      v15 = 0x1E0D80000;
      if (v19)
      {
        v20 = objc_opt_class();
        v121[0] = MEMORY[0x1E0C809B0];
        v121[1] = 3221225472;
        v121[2] = __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke_521;
        v121[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v121[4] = v20;
        if (qword_1ED885B08 != -1)
          dispatch_once(&qword_1ED885B08, v121);
        if (byte_1ED885A0B)
        {
          v108 = v14;
          v21 = v10;
          v22 = v9;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("!!! %s/%d: message=%@"), "-[PLXPCService handleSingleMessage:fromPeer:forEvent:]", 577, v8);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "lastPathComponent");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService handleSingleMessage:fromPeer:forEvent:]");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v26, v27, 577);

          PLLogCommon();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v124 = v23;
            _os_log_debug_impl(&dword_1CAF47000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v9 = v22;
          v10 = v21;
          v14 = v108;
          v12 = 48;
          v15 = 0x1E0D80000;
        }
      }
      v29 = 100.0;
LABEL_20:
      -[PLXPCService setSatelliteProcessExitWithTime:](self, "setSatelliteProcessExitWithTime:", v29);
      goto LABEL_21;
    }
    v15 = 0x1E0D80000;
    if (v19)
    {
      v72 = objc_opt_class();
      v120[0] = MEMORY[0x1E0C809B0];
      v120[1] = 3221225472;
      v120[2] = __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke_524;
      v120[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v120[4] = v72;
      if (qword_1ED885B10 != -1)
        dispatch_once(&qword_1ED885B10, v120);
      if (byte_1ED885A0C)
      {
        v113 = v14;
        v73 = v10;
        v74 = v9;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("!!! %s/%d: message=%@"), "-[PLXPCService handleSingleMessage:fromPeer:forEvent:]", 582, v8);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "lastPathComponent");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService handleSingleMessage:fromPeer:forEvent:]");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "logMessage:fromFile:fromFunction:fromLineNumber:", v75, v78, v79, 582);

        PLLogCommon();
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v124 = v75;
          _os_log_debug_impl(&dword_1CAF47000, v80, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v9 = v74;
        v10 = v73;
        v14 = v113;
        v12 = 48;
        v15 = 0x1E0D80000;
      }
    }
  }
LABEL_21:
  objc_msgSend(v8, "objectForKey:", CFSTR("shouldLog"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v40 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke_529;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v40;
      if (qword_1ED885B18 != -1)
        dispatch_once(&qword_1ED885B18, block);
      if (byte_1ED885A0D)
      {
        v103 = v12;
        v110 = v14;
        v41 = v10;
        v42 = v9;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Should log request(%d): %@"), xpc_connection_get_pid(v9), v8);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "lastPathComponent");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService handleSingleMessage:fromPeer:forEvent:]");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "logMessage:fromFile:fromFunction:fromLineNumber:", v43, v46, v47, 588);

        PLLogCommon();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v124 = v43;
          _os_log_debug_impl(&dword_1CAF47000, v48, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v9 = v42;
        v10 = v41;
        v14 = v110;
        v12 = v103;
      }
    }
    -[PLXPCService handlePeerShouldLogEvent:withMessage:withClientID:withProcessName:withKey:](self, "handlePeerShouldLogEvent:withMessage:withClientID:withProcessName:withKey:", v10, v8, v12, v13, v14);
    v49 = CFSTR("shouldLog");
  }
  else
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("content"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("Query"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (v51)
    {
      if (!objc_msgSend(*(id *)(v15 + 120), "allowQueryFromPeer:", v9))
      {
LABEL_71:

        goto LABEL_72;
      }
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v52 = objc_opt_class();
        v118[0] = MEMORY[0x1E0C809B0];
        v118[1] = 3221225472;
        v118[2] = __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke_534;
        v118[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v118[4] = v52;
        if (qword_1ED885B20 != -1)
          dispatch_once(&qword_1ED885B20, v118);
        if (byte_1ED885A0E)
        {
          v99 = v50;
          v104 = v12;
          v111 = v14;
          v53 = v10;
          v54 = v9;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Response request(%d): %@"), xpc_connection_get_pid(v9), v8);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "lastPathComponent");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService handleSingleMessage:fromPeer:forEvent:]");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "logMessage:fromFile:fromFunction:fromLineNumber:", v55, v58, v59, 599);

          PLLogCommon();
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v124 = v55;
            _os_log_debug_impl(&dword_1CAF47000, v60, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v9 = v54;
          v10 = v53;
          v14 = v111;
          v12 = v104;
          v50 = v99;
        }
      }
      -[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:](self, "handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:", v10, v8, v12, v13, v14, v50);
      v49 = CFSTR("Query");
    }
    else
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("Post"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      v62 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
      if (v61)
      {
        if (v62)
        {
          v63 = objc_opt_class();
          v117[0] = MEMORY[0x1E0C809B0];
          v117[1] = 3221225472;
          v117[2] = __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke_539;
          v117[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v117[4] = v63;
          if (qword_1ED885B28 != -1)
            dispatch_once(&qword_1ED885B28, v117);
          if (byte_1ED885A0F)
          {
            v100 = v50;
            v105 = v12;
            v112 = v14;
            v64 = v10;
            v65 = v9;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Data posted(%d): %@"), xpc_connection_get_pid(v9), v8);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "lastPathComponent");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService handleSingleMessage:fromPeer:forEvent:]");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "logMessage:fromFile:fromFunction:fromLineNumber:", v66, v69, v70, 604);

            PLLogCommon();
            v71 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v124 = v66;
              _os_log_debug_impl(&dword_1CAF47000, v71, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v9 = v65;
            v10 = v64;
            v14 = v112;
            v12 = v105;
            v50 = v100;
          }
        }
        -[PLXPCService handlePeerListenerEvent:withMessage:withClientID:withProcessName:withKey:withPayload:](self, "handlePeerListenerEvent:withMessage:withClientID:withProcessName:withKey:withPayload:", v10, v8, v12, v13, v14, v50);
        v49 = CFSTR("Post");
      }
      else if (v62)
      {
        v116[1] = 3221225472;
        v116[2] = __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke_544;
        v116[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v116[4] = objc_opt_class();
        v114 = v14;
        v116[0] = MEMORY[0x1E0C809B0];
        v101 = v50;
        if (qword_1ED885B30 != -1)
          dispatch_once(&qword_1ED885B30, v116);
        if (byte_1ED885A10)
        {
          v106 = v9;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Message with no direction: %@"), v8);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "lastPathComponent");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService handleSingleMessage:fromPeer:forEvent:]");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "logMessage:fromFile:fromFunction:fromLineNumber:", v81, v84, v85, 608);

          PLLogCommon();
          v86 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v124 = v81;
            _os_log_debug_impl(&dword_1CAF47000, v86, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v49 = 0;
          v9 = v106;
        }
        else
        {
          v49 = 0;
        }
        v14 = v114;
        v50 = v101;
      }
      else
      {
        v49 = 0;
      }
    }

  }
  if (-[PLOperator isDebugEnabledForKey:](self, "isDebugEnabledForKey:", CFSTR("LogAggregateXPC")))
  {
    v107 = v13;
    v115 = v14;
    v87 = v9;
    +[PLOperator entryKeyForType:andName:](PLXPCService, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("XPCEvent"));
    v88 = objc_claimAutoreleasedReturnValue();
    v89 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v88);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("event"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "setObject:forKeyedSubscript:", v90, CFSTR("event"));

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("clientID"));
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "setObject:forKeyedSubscript:", v91, CFSTR("clientID"));

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("process-name"));
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "setObject:forKeyedSubscript:", v92, CFSTR("process-name"));

    if (v49)
      objc_msgSend(v89, "setObject:forKeyedSubscript:", v49, CFSTR("type"));
    objc_msgSend(v89, "setObject:forKeyedSubscript:", &unk_1E8635958, CFSTR("count"));
    -[PLOperator logEntry:](self, "logEntry:", v89);
    v93 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("type"));
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("clientID"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("process-name"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("event"));
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "stringWithFormat:", CFSTR("com.apple.power.xpc.%@.%@.%@.%@"), v94, v95, v96, v97);
    v98 = (void *)objc_claimAutoreleasedReturnValue();

    MEMORY[0x1D179B7DC](v98, 1);
    v9 = v87;
    v13 = v107;
    v14 = v115;
    v50 = (void *)v88;
    goto LABEL_71;
  }
LABEL_72:

}

- (void)handlePeerListenerEvent:(id)a3 withMessage:(id)a4 withClientID:(signed __int16)a5 withProcessName:(id)a6 withKey:(id)a7 withPayload:(id)a8
{
  uint64_t v11;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  id v35;
  _QWORD block[5];
  _QWORD v37[5];
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v11 = a5;
  v40 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  if (-[PLXPCService permissionForClientID:withKey:withType:withProcessName:](self, "permissionForClientID:withKey:withType:withProcessName:", v11, v15, CFSTR("Post"), v14))
  {
    -[PLXPCService registeredListeners](self, "registeredListeners");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLXPCService registeredOperatorFromDictionary:forMessage:](self, "registeredOperatorFromDictionary:forMessage:", v17, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v19 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __101__PLXPCService_handlePeerListenerEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_615;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v19;
      if (qword_1ED885B90 != -1)
        dispatch_once(&qword_1ED885B90, block);
      if (byte_1ED885A1C)
      {
        v34 = v13;
        v35 = v16;
        v20 = (void *)MEMORY[0x1E0CB3940];
        -[PLXPCService registeredListeners](self, "registeredListeners");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", CFSTR("!!! %s/%d: [self registeredListeners]=%@, listener=%@"), "-[PLXPCService handlePeerListenerEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]", 774, v21, v18);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "lastPathComponent");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService handlePeerListenerEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "logMessage:fromFile:fromFunction:fromLineNumber:", v22, v25, v26, 774);

        PLLogCommon();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v39 = v22;
          _os_log_debug_impl(&dword_1CAF47000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v13 = v34;
        v16 = v35;
      }
    }
    if (v18)
      objc_msgSend(v18, "messageRecievedForClientID:withProcessName:withKey:withPayload:", v11, v14, v15, v16);
    else
      -[PLXPCService logMessage:withPayload:](self, "logMessage:withPayload:", v13, v16);
LABEL_19:

    goto LABEL_20;
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v28 = objc_opt_class();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __101__PLXPCService_handlePeerListenerEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke;
    v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v37[4] = v28;
    if (qword_1ED885B88 != -1)
      dispatch_once(&qword_1ED885B88, v37);
    if (byte_1ED885A1B)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no permission to log!"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "lastPathComponent");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService handlePeerListenerEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v31, v32, 766);

      PLLogCommon();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v18;
        _os_log_debug_impl(&dword_1CAF47000, v33, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_19;
    }
  }
LABEL_20:

}

- (signed)permissionForClientID:(signed __int16)a3 withKey:(id)a4 withType:(id)a5 withProcessName:(id)a6
{
  int v8;
  id v10;
  id v11;
  __CFString *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  signed __int16 v24;
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
  const __CFString *v37;
  void *v38;
  void *v39;
  uint64_t block;
  uint64_t v42;
  uint64_t (*v43)(uint64_t);
  void *v44;
  uint64_t v45;
  uint8_t buf[4];
  _BYTE v47[14];
  __int16 v48;
  id v49;
  __int16 v50;
  __CFString *v51;
  uint64_t v52;

  v8 = a3;
  v52 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = (__CFString *)a6;
  -[PLXPCService clientIDs](self, "clientIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14 <= v8)
  {
    PLLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v47 = v8;
      *(_WORD *)&v47[4] = 2112;
      *(_QWORD *)&v47[6] = v10;
      v48 = 2112;
      v49 = v11;
      v50 = 2112;
      v51 = v12;
      _os_log_fault_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_FAULT, "Invalid client ID %d request for key : %@, type : %@, processName %@", buf, 0x26u);
    }
    v24 = 0;
  }
  else
  {
    -[PLXPCService clientIDs](self, "clientIDs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", v8);
    v16 = objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v17 = objc_opt_class();
      block = MEMORY[0x1E0C809B0];
      v42 = 3221225472;
      v43 = __71__PLXPCService_permissionForClientID_withKey_withType_withProcessName___block_invoke;
      v44 = &__block_descriptor_40_e5_v8__0lu32l8;
      v45 = v17;
      if (qword_1ED885AA8 != -1)
        dispatch_once(&qword_1ED885AA8, &block);
      if (byte_1ED8859FF)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLXPCService: permissionForClientID:%hd"), v8, block, v42, v43, v44, v45);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "lastPathComponent");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService permissionForClientID:withKey:withType:withProcessName:]");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 439);

        PLLogCommon();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v47 = v18;
          _os_log_debug_impl(&dword_1CAF47000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    if ((objc_msgSend(MEMORY[0x1E0D80078], "isPowerlogHelperd") & 1) != 0)
    {
      v24 = 1;
    }
    else
    {
      -[PLXPCService permissionCache](self, "permissionCache");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", v11);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", v16);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("__PL__Global"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      -[PLXPCService permissionCache](self, "permissionCache");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKeyedSubscript:", v11);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKeyedSubscript:", v16);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v28)
      {
        objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("__PL__Global"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v33, "BOOLValue");
      }
      else
      {
        objc_msgSend(v31, "objectForKeyedSubscript:", v10);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("__PL__Global"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        -[PLXPCService permissionCache](self, "permissionCache");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKeyedSubscript:", v11);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKeyedSubscript:", v16);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectForKeyedSubscript:", v10);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v36;
        if (v35)
        {
          v37 = CFSTR("__PL__Global");
        }
        else
        {
          objc_msgSend(v36, "objectForKeyedSubscript:", v12);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v38)
          {
            v24 = objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode");
            goto LABEL_22;
          }
          -[PLXPCService permissionCache](self, "permissionCache");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectForKeyedSubscript:", v11);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectForKeyedSubscript:", v16);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectForKeyedSubscript:", v10);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v36;
          v37 = v12;
        }
        objc_msgSend(v36, "objectForKeyedSubscript:", v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v39, "BOOLValue");

      }
    }
  }
LABEL_22:

  return v24;
}

- (NSDictionary)permissionCache
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (NSArray)clientIDs
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (id)registeredOperatorFromDictionary:(id)a3 forMessage:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  void *v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v8 = objc_msgSend(&unk_1E8652748, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(&unk_1E8652748);
        v11 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, v11);

      }
      v8 = objc_msgSend(&unk_1E8652748, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v8);
  }
  v13 = v5;
  objc_sync_enter(v13);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v14 = objc_msgSend(&unk_1E8652748, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v30;
LABEL_10:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v15)
        objc_enumerationMutation(&unk_1E8652748);
      v17 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v16);
      objc_msgSend(v13, "objectForKeyedSubscript:", v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
        break;
      objc_msgSend(v7, "removeObjectForKey:", v17);
      if (v14 == ++v16)
      {
        v14 = objc_msgSend(&unk_1E8652748, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
        if (v14)
          goto LABEL_10;
        goto LABEL_16;
      }
    }
  }
  else
  {
LABEL_16:
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v19 = objc_msgSend(&unk_1E8652748, "countByEnumeratingWithState:objects:count:", &v25, v39, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v26;
LABEL_18:
      v21 = 0;
      while (1)
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(&unk_1E8652748);
        v37 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v21);
        objc_msgSend(v6, "objectForKeyedSubscript:");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v23);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
          break;
        if (v19 == ++v21)
        {
          v19 = objc_msgSend(&unk_1E8652748, "countByEnumeratingWithState:objects:count:", &v25, v39, 16);
          v18 = 0;
          if (v19)
            goto LABEL_18;
          break;
        }
      }
    }
    else
    {
      v18 = 0;
    }
  }
  objc_sync_exit(v13);

  return v18;
}

- (NSMutableDictionary)registeredListeners
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)logMessage:(id)a3 withPayload:(id)a4
{
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  __CFString *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t);
  void *v31;
  uint64_t v32;
  uint64_t block;
  uint64_t v34;
  uint64_t (*v35)(uint64_t);
  void *v36;
  const __CFString *v37;
  char v38;
  _QWORD v39[4];
  const __CFString *v40;
  uint64_t v41;
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
  {
    v8 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
    v9 = MEMORY[0x1E0C809B0];
    if (v8)
    {
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __39__PLXPCService_logMessage_withPayload___block_invoke;
      v39[3] = &unk_1E8578738;
      v40 = CFSTR("Listener");
      v41 = objc_opt_class();
      if (qword_1ED885A90 == -1)
      {
        v10 = CFSTR("Listener");
      }
      else
      {
        dispatch_once(&qword_1ED885A90, v39);
        v10 = (__CFString *)v40;
      }
      v11 = byte_1ED8859FC;

      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No registered Listener"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "lastPathComponent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService logMessage:withPayload:]");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v15, v16, 413);

        PLLogCommon();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v43 = v12;
          _os_log_debug_impl(&dword_1CAF47000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v9 = MEMORY[0x1E0C809B0];
      }
    }
    +[PLOperator entryKeyForType:andName:](PLXPCService, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("ClientLogging"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v18);
    objc_msgSend(v19, "setObjectsFromRawData:", v6);
    objc_msgSend(v19, "setDynamicObjectsFromRawData:", v7);
    block = v9;
    v34 = 3221225472;
    v35 = __39__PLXPCService_logMessage_withPayload___block_invoke_452;
    v36 = &unk_1E8579C80;
    v37 = CFSTR("dynamicClientLogging");
    v38 = 1;
    if (qword_1ED885A98 == -1)
    {
      v20 = CFSTR("dynamicClientLogging");
    }
    else
    {
      dispatch_once(&qword_1ED885A98, &block);
      v20 = (__CFString *)v37;
    }
    v21 = byte_1ED8859FD;

    if (v21)
    {
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v28 = v9;
        v29 = 3221225472;
        v30 = __39__PLXPCService_logMessage_withPayload___block_invoke_2;
        v31 = &__block_descriptor_40_e5_v8__0lu32l8;
        v32 = objc_opt_class();
        if (qword_1ED885AA0 != -1)
          dispatch_once(&qword_1ED885AA0, &v28);
        if (byte_1ED8859FE)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("entry=%@"), v19, v28, v29, v30, v31, v32, block, v34, v35, v36);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "lastPathComponent");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService logMessage:withPayload:]");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "logMessage:fromFile:fromFunction:fromLineNumber:", v22, v25, v26, 419);

          PLLogCommon();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v43 = v22;
            _os_log_debug_impl(&dword_1CAF47000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
      -[PLOperator logEntry:](self, "logEntry:", v19);
    }

  }
}

- (void)handlePeerShouldLogEvent:(id)a3 withMessage:(id)a4 withClientID:(signed __int16)a5 withProcessName:(id)a6 withKey:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  id v38;
  _QWORD v39[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v9 = a5;
  v43 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v12 = a7;
  v13 = a6;
  v14 = a4;
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("shouldLog"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "mutableCopy");

  LODWORD(v9) = -[PLXPCService permissionForClientID:withKey:withType:withProcessName:](self, "permissionForClientID:withKey:withType:withProcessName:", v9, v12, v15, v13);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (_DWORD)v9 != 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("shouldLog"));

  v18 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v19 = MEMORY[0x1E0C809B0];
  if (v18)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__PLXPCService_handlePeerShouldLogEvent_withMessage_withClientID_withProcessName_withKey___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED885B38 != -1)
      dispatch_once(&qword_1ED885B38, block);
    if (byte_1ED885A11)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("!!! response=%@; %s:%d"),
        v16,
        "-[PLXPCService handlePeerShouldLogEvent:withMessage:withClientID:withProcessName:withKey:]",
        638);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "lastPathComponent");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService handlePeerShouldLogEvent:withMessage:withClientID:withProcessName:withKey:]");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v23, v24, 638);

      PLLogCommon();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v20;
        _os_log_debug_impl(&dword_1CAF47000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v19 = MEMORY[0x1E0C809B0];
    }
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v39[0] = v19;
    v39[1] = 3221225472;
    v39[2] = __90__PLXPCService_handlePeerShouldLogEvent_withMessage_withClientID_withProcessName_withKey___block_invoke_554;
    v39[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v39[4] = objc_opt_class();
    if (qword_1ED885B40 != -1)
      dispatch_once(&qword_1ED885B40, v39);
    if (byte_1ED885A12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("!!! vlad=%@; %s:%d"),
        v16,
        "-[PLXPCService handlePeerShouldLogEvent:withMessage:withClientID:withProcessName:withKey:]",
        639);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "lastPathComponent");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService handlePeerShouldLogEvent:withMessage:withClientID:withProcessName:withKey:]");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "logMessage:fromFile:fromFunction:fromLineNumber:", v26, v29, v30, 639);

      PLLogCommon();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v26;
        _os_log_debug_impl(&dword_1CAF47000, v31, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if (-[PLOperator isDebugEnabled](self, "isDebugEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("!!! response=%@; %s:%d"),
      v16,
      "-[PLXPCService handlePeerShouldLogEvent:withMessage:withClientID:withProcessName:withKey:]",
      640);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "lastPathComponent");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService handlePeerShouldLogEvent:withMessage:withClientID:withProcessName:withKey:]");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "logMessage:fromFile:fromFunction:fromLineNumber:", v32, v35, v36, 640);

    PLLogCommon();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v32;
      _os_log_debug_impl(&dword_1CAF47000, v37, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

  }
  -[PLXPCService respondToEvent:withResponse:](self, "respondToEvent:withResponse:", v38, v16);

}

- (void)respondToEvent:(id)a3 withResponse:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  xpc_object_t reply;
  void *v24;
  _xpc_connection_s *v25;
  _xpc_connection_s *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  _QWORD block[5];
  _QWORD v43[5];
  _QWORD v44[5];
  uint8_t buf[4];
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v8 = objc_opt_class();
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __44__PLXPCService_respondToEvent_withResponse___block_invoke;
      v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v44[4] = v8;
      if (qword_1ED885A78 != -1)
        dispatch_once(&qword_1ED885A78, v44);
      if (byte_1ED8859F9)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("empty response"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lastPathComponent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService respondToEvent:withResponse:]");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 378);

        PLLogCommon();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v46 = v9;
          _os_log_debug_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    v7 = (id)MEMORY[0x1E0C9AA70];
  }
  if (-[PLOperator isDebugEnabled](self, "isDebugEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("adding debug to response"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lastPathComponent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService respondToEvent:withResponse:]");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 383);

    PLLogCommon();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v15;
      _os_log_debug_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    v21 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLOperator isDebugEnabled](self, "isDebugEnabled"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("PLXPCClientDebug"));

    v7 = v21;
  }
  reply = xpc_dictionary_create_reply(v6);
  v24 = (void *)_CFXPCCreateXPCMessageWithCFObject();
  xpc_dictionary_set_value(reply, (const char *)objc_msgSend(CFSTR("PLXPCConnectionReturnDict"), "UTF8String"), v24);
  xpc_dictionary_get_remote_connection(v6);
  v25 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    xpc_connection_send_message(v25, reply);
  }
  else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v27 = objc_opt_class();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __44__PLXPCService_respondToEvent_withResponse___block_invoke_436;
    v43[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v43[4] = v27;
    if (qword_1ED885A80 != -1)
      dispatch_once(&qword_1ED885A80, v43);
    if (byte_1ED8859FA)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("remote connection missing"));
      v28 = objc_claimAutoreleasedReturnValue();
      v41 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "lastPathComponent");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService respondToEvent:withResponse:]");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v30, v31, 397);

      v32 = (void *)v28;
      PLLogCommon();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v32;
        _os_log_debug_impl(&dword_1CAF47000, v33, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v34 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__PLXPCService_respondToEvent_withResponse___block_invoke_441;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v34;
    if (qword_1ED885A88 != -1)
      dispatch_once(&qword_1ED885A88, block);
    if (byte_1ED8859FB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("responded to event! event=%@ response=%@ replyMessage=%@"), v6, v7, reply);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "lastPathComponent");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService respondToEvent:withResponse:]");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "logMessage:fromFile:fromFunction:fromLineNumber:", v35, v38, v39, 400);

      PLLogCommon();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v35;
        _os_log_debug_impl(&dword_1CAF47000, v40, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }

}

- (void)handlePeerResponderEvent:(id)a3 withMessage:(id)a4 withClientID:(signed __int16)a5 withProcessName:(id)a6 withKey:(id)a7 withPayload:(id)a8
{
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  useconds_t v50;
  id v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  int v66;
  intptr_t v67;
  NSObject *v68;
  NSObject *v69;
  void *v70;
  uint64_t v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  int v77;
  id v78;
  id v79;
  id v80;
  _QWORD v81[5];
  _QWORD v82[5];
  _QWORD v83[5];
  id v84;
  uint64_t *v85;
  uint64_t *v86;
  uint64_t *v87;
  uint64_t *v88;
  uint64_t *v89;
  __int128 *v90;
  _QWORD v91[6];
  _QWORD v92[5];
  _QWORD block[5];
  _QWORD v94[5];
  id v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t (*v99)(uint64_t, uint64_t);
  void (*v100)(uint64_t);
  id v101;
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t (*v105)(uint64_t, uint64_t);
  void (*v106)(uint64_t);
  id v107;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t (*v111)(uint64_t, uint64_t);
  void (*v112)(uint64_t);
  id v113;
  uint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  uint64_t (*v117)(uint64_t, uint64_t);
  void (*v118)(uint64_t);
  id v119;
  uint64_t v120;
  uint64_t *v121;
  uint64_t v122;
  __int16 v123;
  _QWORD v124[5];
  uint64_t v125;
  uint64_t *v126;
  uint64_t v127;
  uint64_t (*v128)(uint64_t, uint64_t);
  void (*v129)(uint64_t);
  id v130;
  uint8_t buf[4];
  id v132;
  __int128 v133;
  uint64_t v134;
  uint64_t (*v135)(uint64_t, uint64_t);
  void (*v136)(uint64_t);
  id v137;
  uint64_t v138;

  v77 = a5;
  v138 = *MEMORY[0x1E0C80C00];
  v72 = a3;
  v13 = a4;
  v74 = a6;
  v76 = a7;
  v79 = a8;
  if (objc_msgSend(MEMORY[0x1E0D80078], "isPowerlogHelperd"))
  {
    -[PLXPCService satelliteProcessSemaphore](self, "satelliteProcessSemaphore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "signalInterestByObject:", v13);

    objc_msgSend(MEMORY[0x1E0D7FFE0], "sharedManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "signalServiceActive:", 0);

  }
  v125 = 0;
  v126 = &v125;
  v127 = 0x3032000000;
  v128 = __Block_byref_object_copy__18;
  v129 = __Block_byref_object_dispose__18;
  v130 = 0;
  if (-[PLOperator isDebugEnabled](self, "isDebugEnabled"))
  {
    +[PLOperator entryKeyForType:andName:](PLXPCService, "entryKeyForType:andName:", *MEMORY[0x1E0D80380], CFSTR("ResponderEvent"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v16);
    v18 = (void *)v126[5];
    v126[5] = v17;

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("event"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v126[5], "setObject:forKeyedSubscript:", v19, CFSTR("event"));

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("clientID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v126[5], "setObject:forKeyedSubscript:", v20, CFSTR("clientID"));

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("process-name"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v126[5], "setObject:forKeyedSubscript:", v21, CFSTR("process-name"));

    if ((objc_msgSend(MEMORY[0x1E0D80078], "isPowerlogHelperd") & 1) == 0)
      -[PLOperator logEntry:](self, "logEntry:", v126[5]);

  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v22 = objc_opt_class();
    v124[0] = MEMORY[0x1E0C809B0];
    v124[1] = 3221225472;
    v124[2] = __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke;
    v124[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v124[4] = v22;
    if (qword_1ED885B48 != -1)
      dispatch_once(&qword_1ED885B48, v124);
    if (byte_1ED885A13)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("clientID=%i, processName=%@, key=%@, payload=%@"), v77, v74, v76, v79);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "lastPathComponent");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v26, v27, 666);

      PLLogCommon();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(v133) = 138412290;
        *(_QWORD *)((char *)&v133 + 4) = v23;
        _os_log_debug_impl(&dword_1CAF47000, v28, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v133, 0xCu);
      }

    }
  }
  *(_QWORD *)&v133 = 0;
  *((_QWORD *)&v133 + 1) = &v133;
  v134 = 0x3032000000;
  v135 = __Block_byref_object_copy__18;
  v136 = __Block_byref_object_dispose__18;
  v73 = v72;
  v137 = v73;
  v120 = 0;
  v121 = &v120;
  v122 = 0x2020000000;
  v123 = v77;
  v114 = 0;
  v115 = &v114;
  v116 = 0x3032000000;
  v117 = __Block_byref_object_copy__18;
  v118 = __Block_byref_object_dispose__18;
  v75 = v74;
  v119 = v75;
  v108 = 0;
  v109 = &v108;
  v110 = 0x3032000000;
  v111 = __Block_byref_object_copy__18;
  v112 = __Block_byref_object_dispose__18;
  v78 = v76;
  v113 = v78;
  v102 = 0;
  v103 = &v102;
  v104 = 0x3032000000;
  v105 = __Block_byref_object_copy__18;
  v106 = __Block_byref_object_dispose__18;
  v80 = v79;
  v107 = v80;
  v96 = 0;
  v97 = &v96;
  v98 = 0x3032000000;
  v99 = __Block_byref_object_copy__18;
  v100 = __Block_byref_object_dispose__18;
  -[PLXPCService registeredResponders](self, "registeredResponders");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLXPCService registeredOperatorFromDictionary:forMessage:](self, "registeredOperatorFromDictionary:forMessage:", v29, v13);
  v101 = (id)objc_claimAutoreleasedReturnValue();

  v30 = 0;
  v94[0] = 0;
  v94[1] = v94;
  v94[2] = 0x3032000000;
  v94[3] = __Block_byref_object_copy__18;
  v94[4] = __Block_byref_object_dispose__18;
  v95 = 0;
  while (1)
  {
    -[PLXPCService registeredResponders](self, "registeredResponders");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLXPCService registeredOperatorFromDictionary:forMessage:](self, "registeredOperatorFromDictionary:forMessage:", v31, v13);
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)v97[5];
    v97[5] = v32;

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v34 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_562;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v34;
      if (qword_1ED885B50 != -1)
        dispatch_once(&qword_1ED885B50, block);
      if (byte_1ED885A14)
      {
        v35 = (void *)MEMORY[0x1E0CB3940];
        -[PLXPCService registeredResponders](self, "registeredResponders");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "stringWithFormat:", CFSTR("!!! %s/%d: count=%d, [self registeredResponders]=%@, message=%@, responder=%@"), "-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]", 681, v30, v36, v13, v97[5]);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        v38 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "lastPathComponent");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "logMessage:fromFile:fromFunction:fromLineNumber:", v37, v40, v41, 681);

        PLLogCommon();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v132 = v37;
          _os_log_debug_impl(&dword_1CAF47000, v42, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    if (v97[5])
      break;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v43 = objc_opt_class();
      v82[0] = MEMORY[0x1E0C809B0];
      v82[1] = 3221225472;
      v82[2] = __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_607;
      v82[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v82[4] = v43;
      if (qword_1ED885B80 != -1)
        dispatch_once(&qword_1ED885B80, v82);
      if (byte_1ED885A1A)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No registered Responder"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "lastPathComponent");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "logMessage:fromFile:fromFunction:fromLineNumber:", v44, v47, v48, 731);

        PLLogCommon();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v132 = v44;
          _os_log_debug_impl(&dword_1CAF47000, v49, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    if (v30 > 3)
      v50 = 1000000;
    else
      v50 = -[PLXPCService responderWaitTime](self, "responderWaitTime");
    usleep(v50);
    v30 = (v30 + 1);
    if ((_DWORD)v30 == 20)
      goto LABEL_50;
  }
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("clientID"));
  v51 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v51, "integerValue") != 32)
    goto LABEL_45;
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("event"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "description");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "isEqualToString:", CFSTR("SafeLogFile"));

  if (v54)
  {
    v55 = (void *)objc_msgSend(v80, "mutableCopy");
    objc_msgSend(v55, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("BLDRetail"));
    v51 = v55;

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v56 = objc_opt_class();
      v92[0] = MEMORY[0x1E0C809B0];
      v92[1] = 3221225472;
      v92[2] = __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_571;
      v92[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v92[4] = v56;
      if (qword_1ED885B58 != -1)
        dispatch_once(&qword_1ED885B58, v92);
      if (byte_1ED885A15)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("!!! %s/%d: clientID=%d, event=%@, processName=%@, key=%@, payload=%@, message=%@"), "-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]", 687, *((__int16 *)v121 + 12), v73, v115[5], v109[5], v103[5], v13);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "lastPathComponent");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "logMessage:fromFile:fromFunction:fromLineNumber:", v57, v60, v61, 687);

        PLLogCommon();
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v132 = v57;
          _os_log_debug_impl(&dword_1CAF47000, v62, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    dispatch_get_global_queue(0, 0);
    v63 = objc_claimAutoreleasedReturnValue();
    v91[0] = MEMORY[0x1E0C809B0];
    v91[1] = 3221225472;
    v91[2] = __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_574;
    v91[3] = &unk_1E857DC60;
    v91[4] = self;
    v91[5] = v94;
    dispatch_sync(v63, v91);

    v80 = v51;
LABEL_45:

  }
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("event"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "description");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v65, "isEqualToString:", CFSTR("Aggregate"));

  if (v66)
    v67 = -32768;
  else
    v67 = 0;
  dispatch_get_global_queue(v67, 0);
  v68 = objc_claimAutoreleasedReturnValue();
  v83[0] = MEMORY[0x1E0C809B0];
  v83[1] = 3221225472;
  v83[2] = __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_601;
  v83[3] = &unk_1E8581E20;
  v86 = &v120;
  v87 = &v114;
  v88 = &v108;
  v89 = &v102;
  v85 = &v96;
  v83[4] = self;
  v90 = &v133;
  v84 = v13;
  dispatch_async(v68, v83);

LABEL_50:
  if (objc_msgSend(MEMORY[0x1E0D80078], "isPowerlogHelperd") && !v97[5])
  {
    PLLogCommon();
    v69 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v132 = v13;
      _os_log_error_impl(&dword_1CAF47000, v69, OS_LOG_TYPE_ERROR, "powerlogHelperd received unhandled query: %@", buf, 0xCu);
    }

    -[PLXPCService satelliteProcessSemaphore](self, "satelliteProcessSemaphore");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "signalDoneByObject:", v13);

  }
  v71 = v126[5];
  if (v71)
  {
    v81[0] = MEMORY[0x1E0C809B0];
    v81[1] = 3221225472;
    v81[2] = __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_610;
    v81[3] = &unk_1E8578CE8;
    v81[4] = &v125;
    -[PLOperator updateEntry:withBlock:](self, "updateEntry:withBlock:", v71, v81);
  }
  _Block_object_dispose(v94, 8);

  _Block_object_dispose(&v96, 8);
  _Block_object_dispose(&v102, 8);

  _Block_object_dispose(&v108, 8);
  _Block_object_dispose(&v114, 8);

  _Block_object_dispose(&v120, 8);
  _Block_object_dispose(&v133, 8);

  _Block_object_dispose(&v125, 8);
}

- (NSMutableDictionary)registeredResponders
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLXPCService;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("ClientLogging");
  objc_msgSend(a1, "entryEventPointDefinitionClientLogging");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("ClientLoggingDrops");
  v8[0] = v3;
  objc_msgSend(a1, "entryEventPointDefinitionClientLoggingDrops");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)entryEventPointDefinitionClientLoggingDrops
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80330];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1E8653AE0;
  v14[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("clientID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("PLXPCBatchedMessageDropCounts");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventPointDefinitionClientLogging
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[4];
  _QWORD v25[4];
  _QWORD v26[3];
  _QWORD v27[5];

  v27[3] = *MEMORY[0x1E0C80C00];
  v26[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802A8];
  v24[0] = *MEMORY[0x1E0D80318];
  v24[1] = v2;
  v25[0] = &unk_1E8653AE0;
  v25[1] = MEMORY[0x1E0C9AAB0];
  v3 = *MEMORY[0x1E0D80270];
  v24[2] = *MEMORY[0x1E0D80278];
  v24[3] = v3;
  v25[2] = &unk_1E86358F8;
  v25[3] = &unk_1E8635910;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v17;
  v26[1] = *MEMORY[0x1E0D802F0];
  v22[0] = CFSTR("clientID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v15;
  v22[1] = CFSTR("process-name");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v5;
  v22[2] = CFSTR("event");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v8;
  v26[2] = *MEMORY[0x1E0D802B0];
  v20[0] = CFSTR("value");
  v18 = *MEMORY[0x1E0D80358];
  v19 = &unk_1E8635928;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = CFSTR("unit");
  v21[0] = v9;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_StringFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)entryEventIntervalDefinitions
{
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "isDebugEnabled"))
    return MEMORY[0x1E0C9AA70];
  v6 = CFSTR("ResponderEvent");
  objc_msgSend(a1, "entryEventIntervalDefinitionResponderEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)entryEventIntervalDefinitionResponderEvent
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[4];
  _QWORD v15[4];
  uint64_t v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v18[0] = *MEMORY[0x1E0D80298];
  v16 = *MEMORY[0x1E0D80318];
  v17 = &unk_1E8653AE0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v18[1] = *MEMORY[0x1E0D802F0];
  v14[0] = CFSTR("timestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_DateFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("clientID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  v14[2] = CFSTR("process-name");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v7;
  v14[3] = CFSTR("event");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_StringFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryAggregateDefinitions
{
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "isDebugEnabledForKey:", CFSTR("LogAggregateXPC")))
    return MEMORY[0x1E0C9AA70];
  v6 = CFSTR("XPCEvent");
  objc_msgSend(a1, "entryAggregateDefinitionXPCEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)entryAggregateDefinitionXPCEvent
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[4];
  _QWORD v32[6];

  v32[4] = *MEMORY[0x1E0C80C00];
  v31[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v29[0] = *MEMORY[0x1E0D80318];
  v29[1] = v2;
  v30[0] = &unk_1E8653AE0;
  v30[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v20;
  v31[1] = *MEMORY[0x1E0D802F0];
  v27[0] = CFSTR("clientID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v18;
  v27[1] = CFSTR("process-name");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_StringFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v16;
  v27[2] = CFSTR("event");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_StringFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v3;
  v27[3] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v5;
  v27[4] = CFSTR("count");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v8;
  v31[2] = *MEMORY[0x1E0D80228];
  v25[0] = &unk_1E8653AF0;
  v23 = *MEMORY[0x1E0D80220];
  v9 = v23;
  v24 = &unk_1E8653B00;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = &unk_1E8653B10;
  v26[0] = v10;
  v21 = v9;
  v22 = &unk_1E8653AF0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = *MEMORY[0x1E0D80238];
  v32[2] = v12;
  v32[3] = &unk_1E8652718;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)defaults
{
  return &unk_1E864FB90;
}

- (PLXPCService)init
{
  PLXPCService *v2;
  uint64_t v3;
  NSMutableDictionary *registeredListeners;
  uint64_t v5;
  NSMutableDictionary *registeredResponders;
  NSArray *clientIDs;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  id v11;
  int v12;
  uint64_t v13;
  NSDictionary *permissionCache;
  NSDictionary *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  PLXPCService *v23;
  uint64_t v24;
  PLNSNotificationOperatorComposition *registrationNotification;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  const char *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  xpc_connection_t mach_service;
  OS_xpc_object *xpcConnection;
  _xpc_connection_s *v53;
  NSObject *v54;
  _xpc_connection_s *v55;
  PLXPCService *v56;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v58;
  id v59;
  void *v60;
  PLXPCService *v61;
  uint64_t v62;
  PLTimer *resetPermissionsForClientsTimer;
  PLXPCService *v64;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  _QWORD v72[4];
  PLXPCService *v73;
  _QWORD handler[4];
  PLXPCService *v75;
  _QWORD v76[5];
  _QWORD v77[5];
  _QWORD block[5];
  _QWORD v79[4];
  PLXPCService *v80;
  _QWORD v81[4];
  id v82;
  objc_super v83;
  uint8_t buf[4];
  void *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v83.receiver = self;
  v83.super_class = (Class)PLXPCService;
  v2 = -[PLOperator init](&v83, sel_init);
  if (!v2)
  {
LABEL_40:
    v64 = v2;
    goto LABEL_41;
  }
  v3 = objc_opt_new();
  registeredListeners = v2->_registeredListeners;
  v2->_registeredListeners = (NSMutableDictionary *)v3;

  v5 = objc_opt_new();
  registeredResponders = v2->_registeredResponders;
  v2->_registeredResponders = (NSMutableDictionary *)v5;

  clientIDs = v2->_clientIDs;
  v2->_clientIDs = (NSArray *)&unk_1E8652730;

  v8 = (void *)objc_opt_new();
  v9 = v2->_clientIDs;
  v10 = MEMORY[0x1E0C809B0];
  v81[0] = MEMORY[0x1E0C809B0];
  v81[1] = 3221225472;
  v81[2] = __20__PLXPCService_init__block_invoke;
  v81[3] = &unk_1E8581DA8;
  v11 = v8;
  v82 = v11;
  -[NSArray enumerateObjectsUsingBlock:](v9, "enumerateObjectsUsingBlock:", v81);
  objc_storeStrong((id *)&v2->_clientNames, v8);
  if (objc_msgSend(MEMORY[0x1E0D80078], "isPowerlogHelperd"))
    v12 = 200000;
  else
    v12 = 1000000;
  v2->_responderWaitTime = v12;
  getClientPermissions();
  v13 = objc_claimAutoreleasedReturnValue();
  permissionCache = v2->_permissionCache;
  v2->_permissionCache = (NSDictionary *)v13;

  v15 = v2->_permissionCache;
  if ((!v15 || !-[NSDictionary count](v15, "count")) && objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("**** unable to load ClientPermissions ****"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lastPathComponent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService init]");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v19, v20, 229);

    PLLogCommon();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v85 = v16;
      _os_log_debug_impl(&dword_1CAF47000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

  }
  v22 = objc_alloc(MEMORY[0x1E0D80010]);
  v79[0] = v10;
  v79[1] = 3221225472;
  v79[2] = __20__PLXPCService_init__block_invoke_360;
  v79[3] = &unk_1E8577F48;
  v23 = v2;
  v80 = v23;
  v24 = objc_msgSend(v22, "initWithOperator:forNotification:withBlock:", v23, CFSTR("register.PLXPCService"), v79);
  registrationNotification = v23->_registrationNotification;
  v23->_registrationNotification = (PLNSNotificationOperatorComposition *)v24;

  if (objc_msgSend(MEMORY[0x1E0D80078], "isPowerlogHelperd"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v23, sel_stopPowerlogHelperd_, CFSTR("PLBatteryGaugeService.stopPowerlogHelperd"), 0);

  }
  if (objc_msgSend(MEMORY[0x1E0D80078], "isLiteModeDaemon"))
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      block[0] = v10;
      block[1] = 3221225472;
      block[2] = __20__PLXPCService_init__block_invoke_376;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = objc_opt_class();
      if (qword_1ED885A28 != -1)
        dispatch_once(&qword_1ED885A28, block);
      if (byte_1ED8859F1)
      {
        v27 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0D80078], "liteModeDaemonName");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringWithFormat:", CFSTR("running in %@ with service %s"), v28, "com.apple.powerlog.plxpclogger.xpc");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "lastPathComponent");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService init]");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "logMessage:fromFile:fromFunction:fromLineNumber:", v29, v32, v33, 255);

        PLLogCommon();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v85 = v29;
          _os_log_debug_impl(&dword_1CAF47000, v34, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    -[PLOperator workQueue](v23, "workQueue");
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = "com.apple.powerlog.plxpclogger.xpc";
LABEL_37:
    mach_service = xpc_connection_create_mach_service(v36, v35, 1uLL);
    xpcConnection = v23->_xpcConnection;
    v23->_xpcConnection = mach_service;

    xpc_connection_set_context(v23->_xpcConnection, v23);
    v53 = v23->_xpcConnection;
    dispatch_get_global_queue(2, 0);
    v54 = objc_claimAutoreleasedReturnValue();
    xpc_connection_set_target_queue(v53, v54);

    v55 = v23->_xpcConnection;
    handler[0] = v10;
    handler[1] = 3221225472;
    handler[2] = __20__PLXPCService_init__block_invoke_392;
    handler[3] = &unk_1E8581DF8;
    v56 = v23;
    v75 = v56;
    xpc_connection_set_event_handler(v55, handler);
    xpc_connection_activate(v23->_xpcConnection);
    if ((objc_msgSend(MEMORY[0x1E0D80078], "isPowerlogHelperd") & 1) == 0)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.powerlog.state_changed"), 0, 0, 0);
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 3600.0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_alloc(MEMORY[0x1E0D80070]);
    -[PLOperator workQueue](v56, "workQueue");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = v10;
    v72[1] = 3221225472;
    v72[2] = __20__PLXPCService_init__block_invoke_410;
    v72[3] = &unk_1E8578078;
    v61 = v56;
    v73 = v61;
    v62 = objc_msgSend(v59, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v58, 1, 0, v60, v72, 3600.0, 0.0);
    resetPermissionsForClientsTimer = v61->_resetPermissionsForClientsTimer;
    v61->_resetPermissionsForClientsTimer = (PLTimer *)v62;

    goto LABEL_40;
  }
  if (objc_msgSend(MEMORY[0x1E0D80078], "isFullModeDaemon"))
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v77[0] = v10;
      v77[1] = 3221225472;
      v77[2] = __20__PLXPCService_init__block_invoke_382;
      v77[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v77[4] = objc_opt_class();
      if (qword_1ED885A30 != -1)
        dispatch_once(&qword_1ED885A30, v77);
      if (byte_1ED8859F2)
      {
        v37 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0D80078], "fullModeDaemonName");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "stringWithFormat:", CFSTR("running in %@ with service %s"), v38, "com.apple.powerlogd.XPCService.xpc");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        v40 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "lastPathComponent");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService init]");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "logMessage:fromFile:fromFunction:fromLineNumber:", v39, v42, v43, 259);

        PLLogCommon();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v85 = v39;
          _os_log_debug_impl(&dword_1CAF47000, v44, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    -[PLOperator workQueue](v23, "workQueue");
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = "com.apple.powerlogd.XPCService.xpc";
    goto LABEL_37;
  }
  if (objc_msgSend(MEMORY[0x1E0D80078], "isPowerlogHelperd"))
  {
    -[PLXPCService initSatelliteProcessSemaphore](v23, "initSatelliteProcessSemaphore");
    if (-[PLOperator isDebugEnabled](v23, "isDebugEnabled"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("running in BLDService with service %s"), "com.apple.powerlogHelperd.XPCService.xpc");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "lastPathComponent");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService init]");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "logMessage:fromFile:fromFunction:fromLineNumber:", v45, v48, v49, 264);

      PLLogCommon();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v85 = v45;
        _os_log_debug_impl(&dword_1CAF47000, v50, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
    -[PLOperator workQueue](v23, "workQueue");
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = "com.apple.powerlogHelperd.XPCService.xpc";
    goto LABEL_37;
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v76[0] = v10;
    v76[1] = 3221225472;
    v76[2] = __20__PLXPCService_init__block_invoke_389;
    v76[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v76[4] = objc_opt_class();
    if (qword_1ED885A38 != -1)
      dispatch_once(&qword_1ED885A38, v76);
    if (byte_1ED8859F3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bad processname, no xpc for you"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "lastPathComponent");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService init]");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "logMessage:fromFile:fromFunction:fromLineNumber:", v66, v69, v70, 267);

      PLLogCommon();
      v71 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v85 = v66;
        _os_log_debug_impl(&dword_1CAF47000, v71, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }

  v64 = 0;
LABEL_41:

  return v64;
}

void __20__PLXPCService_init__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  objc_msgSend(v5, "numberWithUnsignedInteger:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

void __20__PLXPCService_init__block_invoke_360(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t block;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  uint64_t v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v10 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __20__PLXPCService_init__block_invoke_2;
    v30 = &__block_descriptor_40_e5_v8__0lu32l8;
    v31 = v10;
    if (qword_1ED885A20 != -1)
      dispatch_once(&qword_1ED885A20, &block);
    if (_MergedGlobals_1_68)
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("type"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("registration"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("registration of type %@ of key %@ for %@"), v12, v13, v9, block, v28, v29, v30, v31);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService init]_block_invoke");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 233);

      PLLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v14;
        _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("type"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "caseInsensitiveCompare:", CFSTR("Post")) == 0;

  if (v21)
  {
    objc_msgSend(*(id *)(a1 + 32), "registeredListeners");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v24);
    objc_msgSend(*(id *)(a1 + 32), "registeredListeners");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("registration"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v9, v26);
    goto LABEL_12;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("type"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "caseInsensitiveCompare:", CFSTR("Query")) == 0;

  if (v23)
  {
    objc_msgSend(*(id *)(a1 + 32), "registeredResponders");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v24);
    objc_msgSend(*(id *)(a1 + 32), "registeredResponders");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("registration"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v9, v26);
LABEL_12:

    objc_sync_exit(v24);
  }

}

uint64_t __20__PLXPCService_init__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_68 = result;
  return result;
}

uint64_t __20__PLXPCService_init__block_invoke_376(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8859F1 = result;
  return result;
}

uint64_t __20__PLXPCService_init__block_invoke_382(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8859F2 = result;
  return result;
}

uint64_t __20__PLXPCService_init__block_invoke_389(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8859F3 = result;
  return result;
}

void __20__PLXPCService_init__block_invoke_392(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  void *v6;
  _xpc_connection_s *v7;
  _xpc_connection_s *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _xpc_connection_s *v14;
  void *context;
  NSObject *v16;
  _xpc_connection_s *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD handler[4];
  NSObject *v24;
  _xpc_connection_s *v25;
  _QWORD v26[5];
  _QWORD block[5];
  uint8_t buf[4];
  _xpc_connection_s *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v5 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __20__PLXPCService_init__block_invoke_2_393;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED885A40 != -1)
      dispatch_once(&qword_1ED885A40, block);
    if (byte_1ED8859F4)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
      v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("event handler fired peerPID=%d %@"), xpc_connection_get_pid(v7), v3);
      v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService init]_block_invoke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 277);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if (MEMORY[0x1D179CB2C](v3) != MEMORY[0x1E0C81310])
  {
    v14 = (_xpc_connection_s *)v3;
    context = xpc_connection_get_context(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 56));
    xpc_connection_set_context(v14, context);
    dispatch_get_global_queue(2, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    xpc_connection_set_target_queue(v14, v16);

    handler[0] = v5;
    handler[1] = 3221225472;
    handler[2] = __20__PLXPCService_init__block_invoke_401;
    handler[3] = &unk_1E8581DD0;
    v24 = *(id *)(a1 + 32);
    v25 = v14;
    v17 = v14;
    xpc_connection_set_event_handler(v17, handler);
    xpc_connection_activate(v17);

    v18 = v24;
LABEL_10:

    goto LABEL_17;
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v26[0] = v5;
    v26[1] = 3221225472;
    v26[2] = __20__PLXPCService_init__block_invoke_398;
    v26[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v26[4] = objc_opt_class();
    if (qword_1ED885A48 != -1)
      dispatch_once(&qword_1ED885A48, v26);
    if (byte_1ED8859F5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("XPC error! %@"), v3);
      v17 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastPathComponent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService init]_block_invoke_2");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v21, v22, 280);

      PLLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v17;
        _os_log_debug_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      goto LABEL_10;
    }
  }
LABEL_17:

}

uint64_t __20__PLXPCService_init__block_invoke_2_393(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8859F4 = result;
  return result;
}

uint64_t __20__PLXPCService_init__block_invoke_398(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8859F5 = result;
  return result;
}

void __20__PLXPCService_init__block_invoke_401(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t pid;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t block;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D7FFA0];
  v4 = a2;
  if (objc_msgSend(v3, "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __20__PLXPCService_init__block_invoke_2_402;
    v18 = &__block_descriptor_40_e5_v8__0lu32l8;
    v19 = v5;
    if (qword_1ED885A50 != -1)
      dispatch_once(&qword_1ED885A50, &block);
    if (byte_1ED8859F6)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 40));
      objc_msgSend(v6, "stringWithFormat:", CFSTR("peer(%d) connected"), pid, block, v16, v17, v18, v19);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService init]_block_invoke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 288);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  xpc_connection_get_context(*(xpc_connection_t *)(a1 + 40));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handlePeer:forEvent:", *(_QWORD *)(a1 + 40), v4);

}

uint64_t __20__PLXPCService_init__block_invoke_2_402(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8859F6 = result;
  return result;
}

uint64_t __20__PLXPCService_init__block_invoke_410(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetPermissionsForClients");
}

- (void)initOperatorDependancies
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];

  if (-[PLOperator isDebugEnabledForKey:](self, "isDebugEnabledForKey:", CFSTR("LogAggregateXPC")))
  {
    v3 = objc_alloc(MEMORY[0x1E0D80010]);
    objc_msgSend(MEMORY[0x1E0D80078], "workQueueForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0C99690];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __40__PLXPCService_initOperatorDependancies__block_invoke;
    v7[3] = &unk_1E8577F48;
    v7[4] = self;
    v6 = (void *)objc_msgSend(v3, "initWithWorkQueue:forNotification:withBlock:", v4, v5, v7);

    -[PLXPCService setDailyTaskNotification:](self, "setDailyTaskNotification:", v6);
  }
}

uint64_t __40__PLXPCService_initOperatorDependancies__block_invoke(uint64_t a1)
{
  uint64_t v2;
  __CFString *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v2 = objc_opt_class();
    v12 = MEMORY[0x1E0C809B0];
    v14 = __40__PLXPCService_initOperatorDependancies__block_invoke_2;
    v15 = &unk_1E8578738;
    v13 = 3221225472;
    v16 = CFSTR("DailyTasks");
    v17 = v2;
    if (qword_1ED885A58 == -1)
    {
      v3 = CFSTR("DailyTasks");
    }
    else
    {
      dispatch_once(&qword_1ED885A58, &v12);
      v3 = (__CFString *)v16;
    }
    v4 = byte_1ED8859F7;

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DailyTasks notification!"), v12, v13, v14, v15);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService initOperatorDependancies]_block_invoke");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 313);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "dailyTasks", v12, v13, v14, v15);
}

uint64_t __40__PLXPCService_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  byte_1ED8859F7 = result;
  return result;
}

- (void)initSatelliteProcessSemaphore
{
  PLSemaphore *v3;
  PLSemaphore *satelliteProcessSemaphore;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D80030], "sharedSemaphoreForKey:", *MEMORY[0x1E0D803C8]);
  v3 = (PLSemaphore *)objc_claimAutoreleasedReturnValue();
  satelliteProcessSemaphore = self->_satelliteProcessSemaphore;
  self->_satelliteProcessSemaphore = v3;

  -[PLXPCService satelliteProcessSemaphore](self, "satelliteProcessSemaphore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeout:", 100.0);

  -[PLXPCService satelliteProcessSemaphore](self, "satelliteProcessSemaphore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "signalStartListening");

}

- (void)dailyTasks
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id obj;
  _QWORD block[5];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[5];
  uint8_t buf[4];
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", -86400.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  objc_msgSend(v4, "timeIntervalSince1970");
  v7 = v6;
  objc_msgSend(v5, "timeIntervalSince1970");
  v9 = v8;

  +[PLOperator entryKeyForType:andName:](PLXPCService, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("XPCEvent"));
  v10 = objc_claimAutoreleasedReturnValue();
  -[PLOperator storage](self, "storage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v10, 3600.0, v7, v9 - v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __26__PLXPCService_dailyTasks__block_invoke;
  v44[3] = &unk_1E85780C8;
  v44[4] = self;
  v36 = (void *)v10;
  v37 = v5;
  if (qword_1ED885A60 != -1)
    dispatch_once(&qword_1ED885A60, v44);
  v13 = qword_1ED885A68;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v12;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v41;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v41 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v17);
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("count"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "longValue");

        if (v20 > v13)
        {
          v21 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("type"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("clientID"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("process-name"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("event"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "stringWithFormat:", CFSTR("com.apple.power.xpc.highRatePerHour.%@.%@.%@.%@"), v22, v23, v24, v25, v36, v37);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          {
            v27 = objc_opt_class();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __26__PLXPCService_dailyTasks__block_invoke_2;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v27;
            if (qword_1ED885A70 != -1)
              dispatch_once(&qword_1ED885A70, block);
            if (byte_1ED8859F8)
            {
              v28 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("count"));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "stringWithFormat:", CFSTR("Reporting %@ crossing ratePerHourThreshold with %@"), v26, v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              v31 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "lastPathComponent");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService dailyTasks]");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "logMessage:fromFile:fromFunction:fromLineNumber:", v30, v33, v34, 338);

              PLLogCommon();
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v46 = v30;
                _os_log_debug_impl(&dword_1CAF47000, v35, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

            }
          }
          MEMORY[0x1D179B7DC](v26, 1);

        }
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    }
    while (v15);
  }

}

uint64_t __26__PLXPCService_dailyTasks__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "defaultLongForKey:", CFSTR("ratePerHourThreshold"));
  qword_1ED885A68 = result;
  return result;
}

uint64_t __26__PLXPCService_dailyTasks__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8859F8 = result;
  return result;
}

uint64_t __44__PLXPCService_respondToEvent_withResponse___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8859F9 = result;
  return result;
}

uint64_t __44__PLXPCService_respondToEvent_withResponse___block_invoke_436(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8859FA = result;
  return result;
}

uint64_t __44__PLXPCService_respondToEvent_withResponse___block_invoke_441(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8859FB = result;
  return result;
}

uint64_t __39__PLXPCService_logMessage_withPayload___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  byte_1ED8859FC = result;
  return result;
}

uint64_t __39__PLXPCService_logMessage_withPayload___block_invoke_452(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "BOOLForKey:ifNotSet:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
  byte_1ED8859FD = result;
  return result;
}

uint64_t __39__PLXPCService_logMessage_withPayload___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8859FE = result;
  return result;
}

uint64_t __71__PLXPCService_permissionForClientID_withKey_withType_withProcessName___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8859FF = result;
  return result;
}

- (void)resetPermissionsForClients
{
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__PLXPCService_resetPermissionsForClients__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED885AB0 != -1)
      dispatch_once(&qword_1ED885AB0, block);
    if (byte_1ED885A00)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("resetPermissionsForClients start!"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService resetPermissionsForClients]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 467);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLXPCService permissionCache](self, "permissionCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v4;
  v19[1] = 3221225472;
  v19[2] = __42__PLXPCService_resetPermissionsForClients__block_invoke_463;
  v19[3] = &unk_1E8581C88;
  v19[4] = self;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v19);

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v18[0] = v4;
    v18[1] = 3221225472;
    v18[2] = __42__PLXPCService_resetPermissionsForClients__block_invoke_471;
    v18[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v18[4] = objc_opt_class();
    if (qword_1ED885AC0 != -1)
      dispatch_once(&qword_1ED885AC0, v18);
    if (byte_1ED885A02)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("resetPermissionsForClients done!"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService resetPermissionsForClients]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v15, v16, 478);

      PLLogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v12;
        _os_log_debug_impl(&dword_1CAF47000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
}

uint64_t __42__PLXPCService_resetPermissionsForClients__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885A00 = result;
  return result;
}

void __42__PLXPCService_resetPermissionsForClients__block_invoke_463(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  _QWORD v5[5];

  objc_msgSend(a3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__PLXPCService_resetPermissionsForClients__block_invoke_2;
  v5[3] = &unk_1E8581DA8;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

void __42__PLXPCService_resetPermissionsForClients__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD block[5];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D179C2E0]();
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "clientNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.ClientID.%@"), CFSTR("com.apple.powerlog.state_changed"), v7);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v8, 0, 0, 0);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v10 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__PLXPCService_resetPermissionsForClients__block_invoke_3;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v10;
    if (qword_1ED885AB8 != -1)
      dispatch_once(&qword_1ED885AB8, block);
    if (byte_1ED885A01)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("resetPermissionsForClients posted %@"), v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService resetPermissionsForClients]_block_invoke_2");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 474);

      PLLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v11;
        _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }

  objc_autoreleasePoolPop(v4);
}

uint64_t __42__PLXPCService_resetPermissionsForClients__block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885A01 = result;
  return result;
}

uint64_t __42__PLXPCService_resetPermissionsForClients__block_invoke_471(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885A02 = result;
  return result;
}

uint64_t __36__PLXPCService_handlePeer_forEvent___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885A03 = result;
  return result;
}

uint64_t __36__PLXPCService_handlePeer_forEvent___block_invoke_478(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885A04 = result;
  return result;
}

uint64_t __36__PLXPCService_handlePeer_forEvent___block_invoke_483(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885A05 = result;
  return result;
}

uint64_t __36__PLXPCService_handlePeer_forEvent___block_invoke_488(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885A06 = result;
  return result;
}

uint64_t __36__PLXPCService_handlePeer_forEvent___block_invoke_493(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885A07 = result;
  return result;
}

uint64_t __36__PLXPCService_handlePeer_forEvent___block_invoke_500(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885A08 = result;
  return result;
}

uint64_t __36__PLXPCService_handlePeer_forEvent___block_invoke_508(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885A09 = result;
  return result;
}

void __36__PLXPCService_handlePeer_forEvent___block_invoke_511(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(a1 + 32), "handleSingleMessage:fromPeer:forEvent:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

uint64_t __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885A0A = result;
  return result;
}

uint64_t __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke_521(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885A0B = result;
  return result;
}

uint64_t __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke_524(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885A0C = result;
  return result;
}

uint64_t __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke_529(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885A0D = result;
  return result;
}

uint64_t __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke_534(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885A0E = result;
  return result;
}

uint64_t __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke_539(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885A0F = result;
  return result;
}

uint64_t __54__PLXPCService_handleSingleMessage_fromPeer_forEvent___block_invoke_544(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885A10 = result;
  return result;
}

uint64_t __90__PLXPCService_handlePeerShouldLogEvent_withMessage_withClientID_withProcessName_withKey___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885A11 = result;
  return result;
}

uint64_t __90__PLXPCService_handlePeerShouldLogEvent_withMessage_withClientID_withProcessName_withKey___block_invoke_554(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885A12 = result;
  return result;
}

uint64_t __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885A13 = result;
  return result;
}

uint64_t __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_562(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885A14 = result;
  return result;
}

uint64_t __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_571(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885A15 = result;
  return result;
}

void __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_574(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  id obj;
  uint64_t v41;
  _QWORD v42[5];
  _QWORD block[5];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[5];
  uint8_t v49[128];
  uint8_t buf[4];
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  PLTalkToPowerlogHelper();
  PLQueryRegistered();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = 0x1E0D7F000uLL;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v6 = objc_opt_class();
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_2;
    v48[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v48[4] = v6;
    if (qword_1ED885B60 != -1)
      dispatch_once(&qword_1ED885B60, v48);
    if (byte_1ED885A16)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s/%d: buiResults=%@"), "-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]_block_invoke", 693, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]_block_invoke");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 693);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v51 = (uint64_t)v7;
        _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v5 = 0x1E0D7F000uLL;
    }
  }
  v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v13)
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("result"));
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v14)
    {
      v15 = v14;
      v16 = CFSTR("EntryKey");
      v17 = 0x1E0D7F000uLL;
      v41 = *(_QWORD *)v45;
      do
      {
        v18 = 0;
        v39 = v15;
        do
        {
          if (*(_QWORD *)v45 != v41)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v18);
          v20 = objc_alloc(*(Class *)(v17 + 4016));
          objc_msgSend(v19, "objectForKeyedSubscript:", v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)objc_msgSend(v20, "initWithEntryKey:withRawData:", v21, v19);

          objc_msgSend(*(id *)(a1 + 32), "logEntry:", v22);
          if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
          {
            v23 = objc_opt_class();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_590;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v23;
            if (qword_1ED885B68 != -1)
              dispatch_once(&qword_1ED885B68, block);
            if (byte_1ED885A17)
            {
              v24 = a1;
              v25 = v16;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("!!! %s/%d: log to database; entry=%@, serializedEntry=%@"),
                "-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]_block_invoke_2",
                702,
                v22,
                v19);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "lastPathComponent");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]_block_invoke_2");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "logMessage:fromFile:fromFunction:fromLineNumber:", v26, v29, v30, 702);

              PLLogCommon();
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v51 = (uint64_t)v26;
                _os_log_debug_impl(&dword_1CAF47000, v31, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v5 = 0x1E0D7F000;
              v16 = v25;
              a1 = v24;
              v17 = 0x1E0D7F000;
              v15 = v39;
            }
          }

          ++v18;
        }
        while (v15 != v18);
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v15);
    }
LABEL_31:

    return;
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v32 = objc_opt_class();
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_596;
    v42[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v42[4] = v32;
    if (qword_1ED885B70 != -1)
      dispatch_once(&qword_1ED885B70, v42);
    if (byte_1ED885A18)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("!!! %s/%d: buiResults is nil"), "-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]_block_invoke_2", 705);
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "lastPathComponent");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]_block_invoke_2");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      obj = (id)v33;
      objc_msgSend(v34, "logMessage:fromFile:fromFunction:fromLineNumber:", v33, v36, v37, 705);

      PLLogCommon();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v51 = v33;
        _os_log_debug_impl(&dword_1CAF47000, v38, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_31;
    }
  }
}

uint64_t __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885A16 = result;
  return result;
}

uint64_t __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_590(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885A17 = result;
  return result;
}

uint64_t __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_596(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885A18 = result;
  return result;
}

void __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_601(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD block[5];
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "respondToRequestForClientID:withProcessName:withKey:withPayload:", *(__int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_2_602;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1ED885B78 != -1)
      dispatch_once(&qword_1ED885B78, block);
    if (byte_1ED885A19)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("!!! %s/%d: responder=%@, response=%@"), "-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]_block_invoke", 722, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLXPCService.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLXPCService handlePeerResponderEvent:withMessage:withClientID:withProcessName:withKey:withPayload:]_block_invoke");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 722);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "respondToEvent:withResponse:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), v2);
  if (objc_msgSend(MEMORY[0x1E0D80078], "isPowerlogHelperd"))
  {
    objc_msgSend(*(id *)(a1 + 32), "satelliteProcessSemaphore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "signalDoneByObject:", *(_QWORD *)(a1 + 40));

  }
}

uint64_t __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_2_602(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885A19 = result;
  return result;
}

uint64_t __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_607(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885A1A = result;
  return result;
}

void __102__PLXPCService_handlePeerResponderEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_610(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v2, CFSTR("timestampEnd"));

}

uint64_t __101__PLXPCService_handlePeerListenerEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885A1B = result;
  return result;
}

uint64_t __101__PLXPCService_handlePeerListenerEvent_withMessage_withClientID_withProcessName_withKey_withPayload___block_invoke_615(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885A1C = result;
  return result;
}

- (void)stopPowerlogHelperd:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timeout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLXPCService setSatelliteProcessExitWithTime:](self, "setSatelliteProcessExitWithTime:", (double)(int)objc_msgSend(v4, "intValue"));

}

- (void)setSatelliteProcessExitWithTime:(double)a3
{
  void *v5;

  -[PLXPCService satelliteProcessSemaphore](self, "satelliteProcessSemaphore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeout:", a3);

  -[PLXPCService setSatelliteProcessExit](self, "setSatelliteProcessExit");
}

- (void)setSatelliteProcessExit
{
  _QWORD block[5];

  if (objc_msgSend(MEMORY[0x1E0D80078], "isPowerlogHelperd"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__PLXPCService_setSatelliteProcessExit__block_invoke;
    block[3] = &unk_1E85780C8;
    block[4] = self;
    if (setSatelliteProcessExit_onceToken != -1)
      dispatch_once(&setSatelliteProcessExit_onceToken, block);
  }
}

void __39__PLXPCService_setSatelliteProcessExit__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  dispatch_get_global_queue(2, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PLXPCService_setSatelliteProcessExit__block_invoke_2;
  block[3] = &unk_1E85780C8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, block);

}

void __39__PLXPCService_setSatelliteProcessExit__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v2 = MEMORY[0x1E0C809B0];
  while (1)
  {
    objc_msgSend(*(id *)(a1 + 32), "satelliteProcessSemaphore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = v2;
    v4[1] = 3221225472;
    v4[2] = __39__PLXPCService_setSatelliteProcessExit__block_invoke_3;
    v4[3] = &unk_1E85780C8;
    v4[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "waitWithBlockSync:", v4);

  }
}

void __39__PLXPCService_setSatelliteProcessExit__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "storage");
  v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v2, "blockingFlushCachesWithReason:", CFSTR("SatelliteExit"));

  sleep(0xAu);
  objc_msgSend(*(id *)(a1 + 32), "satelliteProcessSemaphore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "isActive");

  if ((v2 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D7FFE0], "sharedManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "signalServiceInactive:", 0);

  }
}

- (OS_xpc_object)xpcConnection
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 56, 1);
}

- (void)setXpcConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void)setRegisteredListeners:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void)setRegisteredResponders:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void)setPermissionCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (PLNSNotificationOperatorComposition)registrationNotification
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRegistrationNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void)setClientIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSDictionary)clientNames
{
  return (NSDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setClientNames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (PLTimer)resetPermissionsForClientsTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 112, 1);
}

- (void)setResetPermissionsForClientsTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (PLNSNotificationOperatorComposition)dailyTaskNotification
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDailyTaskNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (PLSemaphore)satelliteProcessSemaphore
{
  return (PLSemaphore *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSatelliteProcessSemaphore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (unsigned)responderWaitTime
{
  return self->_responderWaitTime;
}

- (void)setResponderWaitTime:(unsigned int)a3
{
  self->_responderWaitTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_satelliteProcessSemaphore, 0);
  objc_storeStrong((id *)&self->_dailyTaskNotification, 0);
  objc_storeStrong((id *)&self->_resetPermissionsForClientsTimer, 0);
  objc_storeStrong((id *)&self->_clientNames, 0);
  objc_storeStrong((id *)&self->_clientIDs, 0);
  objc_storeStrong((id *)&self->_registrationNotification, 0);
  objc_storeStrong((id *)&self->_permissionCache, 0);
  objc_storeStrong((id *)&self->_registeredResponders, 0);
  objc_storeStrong((id *)&self->_registeredListeners, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
