@implementation PLUserActiveStateService

- (void)handlePluggedInStateUpdate:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  -[PLUserActiveStateService pluggedInState](self, "pluggedInState");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = (void *)v5,
        -[PLUserActiveStateService pluggedInState](self, "pluggedInState"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "BOOLValue"),
        v7,
        v6,
        v8 != v3))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[PLUserActiveStateService setLastPluggedInTime:](self, "setLastPluggedInTime:", v9);

      -[PLUserActiveStateService setLastUnplugTime:](self, "setLastUnplugTime:", 0);
      PLLogUserActiveState();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
LABEL_11:

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLUserActiveStateService setPluggedInState:](self, "setPluggedInState:", v18);

        return;
      }
      -[PLUserActiveStateService lastPluggedInTime](self, "lastPluggedInTime");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412290;
      v22 = v11;
      _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "Updated last plugged in time: %@", (uint8_t *)&v21, 0xCu);
    }
    else
    {
      -[PLUserActiveStateService setLastUnplugTime:](self, "setLastUnplugTime:", v9);

      -[PLUserActiveStateService lastPluggedInTime](self, "lastPluggedInTime");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[PLUserActiveStateService lastUnplugTime](self, "lastUnplugTime");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLUserActiveStateService lastPluggedInTime](self, "lastPluggedInTime");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", v14);
        v16 = v15;

        if (v16 > 0.0)
        {
          -[PLUserActiveStateService pluggedInTime](self, "pluggedInTime");
          -[PLUserActiveStateService setPluggedInTime:](self, "setPluggedInTime:", v16 + v17);
        }
        -[PLUserActiveStateService setLastPluggedInTime:](self, "setLastPluggedInTime:", 0);
      }
      PLLogUserActiveState();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        goto LABEL_11;
      -[PLUserActiveStateService lastUnplugTime](self, "lastUnplugTime");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0CB37E8];
      -[PLUserActiveStateService pluggedInTime](self, "pluggedInTime");
      objc_msgSend(v19, "numberWithDouble:");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412546;
      v22 = v11;
      v23 = 2112;
      v24 = v20;
      _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "Updated last unplug time: %@, total plugged in time: %@", (uint8_t *)&v21, 0x16u);

    }
    goto LABEL_11;
  }
}

- (NSNumber)pluggedInState
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

uint64_t __52__PLUserActiveStateService_initOperatorDependancies__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("entry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ExternalConnected"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return objc_msgSend(*(id *)(a1 + 32), "handlePluggedInStateUpdate:", v5);
}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLUserActiveStateService;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventPointDefinitions
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("State");
  +[PLUserActiveStateService entryEventPointDefinitionState](PLUserActiveStateService, "entryEventPointDefinitionState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entryEventPointDefinitionState
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
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  uint64_t v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[4];

  v21[2] = *MEMORY[0x1E0C80C00];
  v20[0] = *MEMORY[0x1E0D80298];
  v18 = *MEMORY[0x1E0D80318];
  v19 = &unk_1E8652760;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  v20[1] = *MEMORY[0x1E0D802F0];
  v16[0] = CFSTR("UserInactiveTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_RealFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v16[1] = CFSTR("TimePluggedInDuringInactiveState");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_RealFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v3;
  v16[2] = CFSTR("TimeSinceLastUnplugDuringInactiveState");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_RealFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v5;
  v16[3] = CFSTR("DidSleep");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_BoolFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v7;
  v16[4] = CFSTR("BatteryTableID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (PLUserActiveStateService)init
{
  PLUserActiveStateService *v3;
  objc_super v5;

  if ((objc_msgSend(MEMORY[0x1E0D80078], "isPowerlogHelperd") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PLUserActiveStateService;
    self = -[PLOperator init](&v5, sel_init);
    v3 = self;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  if (objc_msgSend(MEMORY[0x1E0D80078], "deviceRebooted") || IOPMUserIsActive())
  {
    -[PLUserActiveStateService setLastUserInactiveTime:](self, "setLastUserInactiveTime:", 0);
  }
  else
  {
    -[PLUserActiveStateService lastUserInactiveTime](self, "lastUserInactiveTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 && IOPSDrawingUnlimitedPower())
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLUserActiveStateService setLastPluggedInTime:](self, "setLastPluggedInTime:", v9);

      -[PLUserActiveStateService setPluggedInState:](self, "setPluggedInState:", MEMORY[0x1E0C9AAB0]);
    }
  }
  v3 = objc_alloc(MEMORY[0x1E0D7FFC8]);
  +[PLEventBackwardBatteryEntry entryKey](PLEventBackwardBatteryEntry, "entryKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__PLUserActiveStateService_initOperatorDependancies__block_invoke;
  v10[3] = &unk_1E8577F48;
  v10[4] = self;
  v6 = (void *)objc_msgSend(v3, "initWithOperator:forEntryKey:withBlock:", self, v4, v10);
  -[PLUserActiveStateService setBatteryNotification:](self, "setBatteryNotification:", v6);

  -[PLOperator workQueue](self, "workQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUserActiveStateService setUserActiveNotificationHandle:](self, "setUserActiveNotificationHandle:", IOPMScheduleUserActiveChangedNotification(), v5, 3221225472, __52__PLUserActiveStateService_initOperatorDependancies__block_invoke_2, &unk_1E8578150, self);

}

uint64_t __52__PLUserActiveStateService_initOperatorDependancies__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleUserActiveStateChangeCallback:", a2);
}

- (void)handleUserActiveStateChangeCallback:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL8 v34;
  uint64_t v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  void *v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  _BOOL4 v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  PLUserActiveStateService *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint64_t v84;
  uint64_t v85;
  id (*v86)(uint64_t);
  void *v87;
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  uint8_t v94[128];
  uint8_t buf[4];
  void *v96;
  uint64_t v97;

  v3 = a3;
  v97 = *MEMORY[0x1E0C80C00];
  PLLogUserActiveState();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v96 = v6;
    _os_log_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEFAULT, "User active tracking: curr state %@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PLUserActiveStateService lastUserInactiveTime](self, "lastUserInactiveTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", v8);
    v10 = v9;

    -[PLUserActiveStateService lastUserInactiveTime](self, "lastUserInactiveTime");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(MEMORY[0x1E0D7FFA0], "doubleForKey:ifNotSet:", CFSTR("userInactiveMinInterval"), 300.0);
      v14 = v13;

      if (v10 >= v14)
      {
        -[PLUserActiveStateService getLastSystemSleepDate](self, "getLastSystemSleepDate");
        v15 = objc_claimAutoreleasedReturnValue();
        +[PLEventBackwardBatteryEntry entryKey](PLEventBackwardBatteryEntry, "entryKey");
        v16 = objc_claimAutoreleasedReturnValue();
        -[PLOperator storage](self, "storage");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = (void *)v16;
        objc_msgSend(v17, "lastEntryForKey:", v16);
        v78 = (void *)objc_claimAutoreleasedReturnValue();

        -[PLUserActiveStateService lastUnplugTime](self, "lastUnplugTime");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          -[PLUserActiveStateService lastUnplugTime](self, "lastUnplugTime");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "timeIntervalSinceDate:", v19);
          v21 = v20;

        }
        else
        {
          v21 = 0.0;
        }

        if (v15)
        {
          -[PLUserActiveStateService lastUserInactiveTime](self, "lastUserInactiveTime");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "compare:", v15) == -1;

        }
        else
        {
          v34 = 0;
        }
        -[PLUserActiveStateService lastPluggedInTime](self, "lastPluggedInTime");
        v35 = objc_claimAutoreleasedReturnValue();
        if (v35)
        {
          v36 = (void *)v35;
          -[PLUserActiveStateService pluggedInState](self, "pluggedInState");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "BOOLValue");

          if (v38)
          {
            -[PLUserActiveStateService lastPluggedInTime](self, "lastPluggedInTime");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "timeIntervalSinceDate:", v39);
            v41 = v40;

            if (v41 <= v10)
            {
              -[PLUserActiveStateService pluggedInTime](self, "pluggedInTime");
              -[PLUserActiveStateService setPluggedInTime:](self, "setPluggedInTime:", v41 + v42);
            }
          }
        }
        v75 = (void *)v15;
        v77 = v7;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = round(v10);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setObject:forKeyedSubscript:", v45, CFSTR("UserInactiveTime"));

        v46 = (void *)MEMORY[0x1E0CB37E8];
        v79 = self;
        -[PLUserActiveStateService pluggedInTime](self, "pluggedInTime");
        objc_msgSend(v46, "numberWithDouble:", round(v47));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setObject:forKeyedSubscript:", v48, CFSTR("TimePluggedInDuringInactiveState"));

        v73 = v34;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v34);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setObject:forKeyedSubscript:", v49, CFSTR("DidSleep"));

        v50 = round(v21);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setObject:forKeyedSubscript:", v51, CFSTR("TimeSinceLastUnplugDuringInactiveState"));

        PLLogUserActiveState();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v96 = v43;
          _os_log_debug_impl(&dword_1CAF47000, v52, OS_LOG_TYPE_DEBUG, "User active states to send: %@", buf, 0xCu);
        }

        v91 = 0u;
        v92 = 0u;
        v89 = 0u;
        v90 = 0u;
        v53 = objc_msgSend(&unk_1E864FC58, "countByEnumeratingWithState:objects:count:", &v89, v94, 16);
        if (v53)
        {
          v54 = v53;
          v55 = *(_QWORD *)v90;
          do
          {
            for (i = 0; i != v54; ++i)
            {
              if (*(_QWORD *)v90 != v55)
                objc_enumerationMutation(&unk_1E864FC58);
              v57 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * i);
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_Start"), v57);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_End"), v57);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLUserActiveStateService cachedBatteryMetrics](v79, "cachedBatteryMetrics");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "objectForKeyedSubscript:", v57);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "setObject:forKeyedSubscript:", v61, v58);

              objc_msgSend(v78, "objectForKeyedSubscript:", v57);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "setObject:forKeyedSubscript:", v62, v59);

            }
            v54 = objc_msgSend(&unk_1E864FC58, "countByEnumeratingWithState:objects:count:", &v89, v94, 16);
          }
          while (v54);
        }
        self = v79;
        -[PLUserActiveStateService getUserInactiveMinIntervalCA](v79, "getUserInactiveMinIntervalCA");
        if (v10 >= v63)
        {
          v84 = MEMORY[0x1E0C809B0];
          v85 = 3221225472;
          v86 = __64__PLUserActiveStateService_handleUserActiveStateChangeCallback___block_invoke;
          v87 = &unk_1E8578178;
          v88 = v43;
          AnalyticsSendEventLazy();

        }
        +[PLOperator entryKeyForType:andName:](PLUserActiveStateService, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("State"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v64);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v44);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "setObject:forKeyedSubscript:", v66, CFSTR("UserInactiveTime"));

        v67 = (void *)MEMORY[0x1E0CB37E8];
        -[PLUserActiveStateService pluggedInTime](v79, "pluggedInTime");
        objc_msgSend(v67, "numberWithDouble:", round(v68));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "setObject:forKeyedSubscript:", v69, CFSTR("TimePluggedInDuringInactiveState"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v73);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "setObject:forKeyedSubscript:", v70, CFSTR("DidSleep"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v50);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "setObject:forKeyedSubscript:", v71, CFSTR("TimeSinceLastUnplugDuringInactiveState"));

        v7 = v77;
        if (v78)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v78, "entryID"));
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "setObject:forKeyedSubscript:", v72, CFSTR("BatteryTableID"));

        }
        -[PLOperator logEntry:](v79, "logEntry:", v65);

      }
    }
    -[PLUserActiveStateService setLastUserInactiveTime:](self, "setLastUserInactiveTime:", 0);
    -[PLUserActiveStateService setLastUnplugTime:](self, "setLastUnplugTime:", 0);
    -[PLUserActiveStateService setPluggedInTime:](self, "setPluggedInTime:", 0.0);
    -[PLUserActiveStateService setCachedBatteryMetrics:](self, "setCachedBatteryMetrics:", 0);
  }
  else
  {
    v76 = v7;
    -[PLUserActiveStateService setLastUserInactiveTime:](self, "setLastUserInactiveTime:", v7);
    -[PLUserActiveStateService setPluggedInTime:](self, "setPluggedInTime:", 0.0);
    -[PLUserActiveStateService setLastUnplugTime:](self, "setLastUnplugTime:", 0);
    +[PLEventBackwardBatteryEntry entryKey](PLEventBackwardBatteryEntry, "entryKey");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator storage](self, "storage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "lastEntryForKey:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v26 = objc_msgSend(&unk_1E864FC58, "countByEnumeratingWithState:objects:count:", &v80, v93, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v81;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v81 != v28)
            objc_enumerationMutation(&unk_1E864FC58);
          v30 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * j);
          objc_msgSend(v24, "objectForKeyedSubscript:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v31, v30);

        }
        v27 = objc_msgSend(&unk_1E864FC58, "countByEnumeratingWithState:objects:count:", &v80, v93, 16);
      }
      while (v27);
    }
    -[PLUserActiveStateService setCachedBatteryMetrics:](self, "setCachedBatteryMetrics:", v25);
    v7 = v76;
    if (IOPSDrawingUnlimitedPower())
      v32 = v76;
    else
      v32 = 0;
    -[PLUserActiveStateService setLastPluggedInTime:](self, "setLastPluggedInTime:", v32);

  }
}

id __64__PLUserActiveStateService_handleUserActiveStateChangeCallback___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)getLastSystemSleepDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  +[PLOperator entryKeyForType:andName:](PLSleepWakeAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("PowerState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ IS NOT NULL"), CFSTR("KernelSleepDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ = %hd"), CFSTR("Event"), 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator storage](self, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v11[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastEntryForKey:withFilters:", v3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "entryDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSDate)lastUserInactiveTime
{
  double v2;

  objc_msgSend(MEMORY[0x1E0D7FFA0], "doubleForKey:ifNotSet:", CFSTR("PLUserActiveStateLastUserInactiveTimestamp"), 0.0);
  if (v2 == 0.0)
    return (NSDate *)0;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:");
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setLastUserInactiveTime:(id)a3
{
  void *v3;
  id v4;

  if (a3)
  {
    objc_msgSend(a3, "timeIntervalSince1970");
    v3 = (void *)MEMORY[0x1E0D7FFA0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:saveToDisk:", v4, CFSTR("PLUserActiveStateLastUserInactiveTimestamp"), 1);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D7FFA0], "setObject:forKey:saveToDisk:", 0, CFSTR("PLUserActiveStateLastUserInactiveTimestamp"), 1);
  }
}

- (double)getUserInactiveMinIntervalCA
{
  if (qword_1ED882308 != -1)
    dispatch_once(&qword_1ED882308, &__block_literal_global_65);
  return *(double *)&qword_1ED882310;
}

uint64_t __56__PLUserActiveStateService_getUserInactiveMinIntervalCA__block_invoke()
{
  uint64_t result;
  uint64_t v1;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "doubleForKey:ifNotSet:", CFSTR("userInactiveMinIntervalCA"), 43200.0);
  qword_1ED882310 = v1;
  return result;
}

- (NSDate)lastUnplugTime
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLastUnplugTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSDate)lastPluggedInTime
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLastPluggedInTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (double)pluggedInTime
{
  return self->_pluggedInTime;
}

- (void)setPluggedInTime:(double)a3
{
  self->_pluggedInTime = a3;
}

- (unint64_t)userActiveNotificationHandle
{
  return self->_userActiveNotificationHandle;
}

- (void)setUserActiveNotificationHandle:(unint64_t)a3
{
  self->_userActiveNotificationHandle = a3;
}

- (PLEntryNotificationOperatorComposition)batteryNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setBatteryNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void)setPluggedInState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSDictionary)cachedBatteryMetrics
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCachedBatteryMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedBatteryMetrics, 0);
  objc_storeStrong((id *)&self->_pluggedInState, 0);
  objc_storeStrong((id *)&self->_batteryNotification, 0);
  objc_storeStrong((id *)&self->_lastPluggedInTime, 0);
  objc_storeStrong((id *)&self->_lastUnplugTime, 0);
}

@end
