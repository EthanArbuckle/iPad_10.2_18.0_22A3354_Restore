@implementation TIKeyboardApplicationStateMonitor

- (TIKeyboardApplicationStateMonitor)init
{
  return -[TIKeyboardApplicationStateMonitor initWithAppActivityTimeDurationThreshold:keyboardUsageFractionThreshold:](self, "initWithAppActivityTimeDurationThreshold:keyboardUsageFractionThreshold:", 180.0, 0.1);
}

- (TIKeyboardApplicationStateMonitor)initWithAppActivityTimeDurationThreshold:(double)a3 keyboardUsageFractionThreshold:(double)a4
{
  TIKeyboardApplicationStateMonitor *v6;
  NSMutableArray *v7;
  NSMutableArray *keyboardUsageTimes;
  NSMutableSet *v9;
  NSMutableSet *foregroundApps;
  NSString *activeAppBundleID;
  NSDate *activeAppStartDate;
  NSDictionary *applicationStateDatabase;
  NSMutableSet *imSuppressingBundleIDs;
  NSLock *v15;
  NSLock *activeStateDataLock;
  NSLock *v17;
  NSLock *databaseInUseLock;
  uint64_t v19;
  NSDate *timeOfLastFlushToDisk;
  id v21;
  uint64_t v22;
  NSCalendar *utcCalendar;
  void *v24;
  BKSApplicationStateMonitor *v25;
  BKSApplicationStateMonitor *applicationStateMonitor;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  id v33;
  id location;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)TIKeyboardApplicationStateMonitor;
  v6 = -[TIKeyboardApplicationStateMonitor init](&v35, sel_init);
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    keyboardUsageTimes = v6->_keyboardUsageTimes;
    v6->_keyboardUsageTimes = v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    foregroundApps = v6->_foregroundApps;
    v6->_foregroundApps = v9;

    v6->_appActivityTimeDurationThreshold = a3;
    v6->_appActivityKeyboardUsageFractionThreshold = a4;
    activeAppBundleID = v6->_activeAppBundleID;
    v6->_activeAppBundleID = 0;

    activeAppStartDate = v6->_activeAppStartDate;
    v6->_activeAppStartDate = 0;

    v6->_activeAppStartTime = 0.0;
    applicationStateDatabase = v6->_applicationStateDatabase;
    v6->_applicationStateDatabase = 0;

    imSuppressingBundleIDs = v6->_imSuppressingBundleIDs;
    v6->_imSuppressingBundleIDs = 0;

    v15 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    activeStateDataLock = v6->_activeStateDataLock;
    v6->_activeStateDataLock = v15;

    v17 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    databaseInUseLock = v6->_databaseInUseLock;
    v6->_databaseInUseLock = v17;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v19 = objc_claimAutoreleasedReturnValue();
    timeOfLastFlushToDisk = v6->_timeOfLastFlushToDisk;
    v6->_timeOfLastFlushToDisk = (NSDate *)v19;

    v21 = objc_alloc(MEMORY[0x1E0C99D48]);
    v22 = objc_msgSend(v21, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    utcCalendar = v6->_utcCalendar;
    v6->_utcCalendar = (NSCalendar *)v22;

    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar setTimeZone:](v6->_utcCalendar, "setTimeZone:", v24);

    v25 = (BKSApplicationStateMonitor *)objc_alloc_init(MEMORY[0x1E0D00C50]);
    applicationStateMonitor = v6->_applicationStateMonitor;
    v6->_applicationStateMonitor = v25;

    objc_initWeak(&location, v6);
    v29 = MEMORY[0x1E0C809B0];
    v30 = 3221225472;
    v31 = __109__TIKeyboardApplicationStateMonitor_initWithAppActivityTimeDurationThreshold_keyboardUsageFractionThreshold___block_invoke;
    v32 = &unk_1EA103B78;
    objc_copyWeak(&v33, &location);
    -[BKSApplicationStateMonitor setHandler:](v6->_applicationStateMonitor, "setHandler:", &v29);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v29, v30, v31, v32);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:selector:name:object:", v6, sel_applicationUninstalled_, CFSTR("TIApplicationUnregisteredNotification_Private"), 0);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  return v6;
}

- (void)applicationUninstalled:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardApplicationStateMonitor databaseInUseLock](self, "databaseInUseLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[TIKeyboardApplicationStateMonitor applicationStateDatabase](self, "applicationStateDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    || (v7 = (void *)MEMORY[0x1E0C99D80],
        -[TIKeyboardApplicationStateMonitor databaseLocation](self, "databaseLocation"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "dictionaryWithContentsOfURL:", v8),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    v20 = v6;
    v9 = (void *)objc_msgSend(v6, "mutableCopy");
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v21 = v4;
    v10 = v4;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v24;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v14);
          if (TICanLogMessageAtLevel_onceToken != -1)
            dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
          if (TICanLogMessageAtLevel_logLevel >= 2)
          {
            TIOSLogFacility();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Deleting data for bundle ID (%@)"), "-[TIKeyboardApplicationStateMonitor applicationUninstalled:]", v15);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v28 = v22;
              _os_log_debug_impl(&dword_1DA6F2000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

            }
          }
          objc_msgSend(v9, "removeObjectForKey:", v15);
          -[TIKeyboardApplicationStateMonitor imSuppressingBundleIDs](self, "imSuppressingBundleIDs");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "removeObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      }
      while (v12);
    }

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardApplicationStateMonitor setApplicationStateDatabase:](self, "setApplicationStateDatabase:", v18);

    -[TIKeyboardApplicationStateMonitor threadUnsafeFlushChangesToDiskWithImmediacy:](self, "threadUnsafeFlushChangesToDiskWithImmediacy:", 1);
    v4 = v21;
  }
  -[TIKeyboardApplicationStateMonitor databaseInUseLock](self, "databaseInUseLock");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "unlock");

}

- (void)handleApplicationStateChange:(id)a3
{
  __objc2_prot_list **p_prots;
  id v5;
  double v6;
  _QWORD *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  unint64_t v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  int v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  NSObject *v38;
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
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  __int128 buf;
  void *(*v58)(uint64_t);
  void *v59;
  uint64_t *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = TIGetCurrentTime();
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v7 = (_QWORD *)getSBApplicationStateDisplayIDKeySymbolLoc_ptr;
  v56 = getSBApplicationStateDisplayIDKeySymbolLoc_ptr;
  if (!getSBApplicationStateDisplayIDKeySymbolLoc_ptr)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v58 = __getSBApplicationStateDisplayIDKeySymbolLoc_block_invoke;
    v59 = &unk_1EA107058;
    v60 = &v53;
    __getSBApplicationStateDisplayIDKeySymbolLoc_block_invoke((uint64_t)&buf);
    v7 = (_QWORD *)v54[3];
  }
  _Block_object_dispose(&v53, 8);
  if (v7)
  {
    objc_msgSend(v5, "objectForKey:", *v7);
    v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    p_prots = &OBJC_PROTOCOL___TITrialManager.prots;
    if (-[TIKeyboardApplicationStateMonitor ignoreAppExtension:](self, "ignoreAppExtension:", v7))
    {
      if (TICanLogMessageAtLevel_onceToken == -1)
        goto LABEL_6;
      goto LABEL_111;
    }
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D00900]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D00908]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "BOOLValue"))
      v12 = objc_msgSend(v11, "longLongValue") == 8 || objc_msgSend(v11, "longLongValue") == 32;
    else
      v12 = 0;
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s New app state for (%@), isFront: %@, state: %@, isFrontmost: %d"), "-[TIKeyboardApplicationStateMonitor handleApplicationStateChange:]", v7, v10, v11, v12);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v39;
        _os_log_debug_impl(&dword_1DA6F2000, v13, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);

      }
    }

    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v40 = (void *)MEMORY[0x1E0CB3940];
        -[TIKeyboardApplicationStateMonitor foregroundApps](self, "foregroundApps");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "stringWithFormat:", CFSTR("%s Initial foreground apps: %@"), "-[TIKeyboardApplicationStateMonitor handleApplicationStateChange:]", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v42;
        _os_log_debug_impl(&dword_1DA6F2000, v14, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);

      }
    }
    -[TIKeyboardApplicationStateMonitor foregroundApps](self, "foregroundApps");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (!v16)
    {
LABEL_48:
      -[TIKeyboardApplicationStateMonitor foregroundApps](self, "foregroundApps");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "count");

      if (v24 >= 2)
      {
        if (TICanLogMessageAtLevel_onceToken != -1)
          dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
        if (TICanLogMessageAtLevel_logLevel < 2)
        {
          v8 = 0;
LABEL_104:

          goto LABEL_105;
        }
        TIOSLogFacility();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Multiple apps foreground, no activity tracking will take place"), "-[TIKeyboardApplicationStateMonitor handleApplicationStateChange:]");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v43;
          _os_log_debug_impl(&dword_1DA6F2000, v25, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);

        }
        v8 = 0;
LABEL_103:

        goto LABEL_104;
      }
      -[TIKeyboardApplicationStateMonitor foregroundApps](self, "foregroundApps");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "count");

      if (v27 == 1)
      {
        if (TICanLogMessageAtLevel_onceToken != -1)
          dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
        if (TICanLogMessageAtLevel_logLevel >= 2)
        {
          TIOSLogFacility();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Foreground app set now empty"), "-[TIKeyboardApplicationStateMonitor handleApplicationStateChange:]");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v47;
            _os_log_debug_impl(&dword_1DA6F2000, v28, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);

          }
        }
        -[TIKeyboardApplicationStateMonitor foregroundApps](self, "foregroundApps");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "removeAllObjects");

      }
      -[TIKeyboardApplicationStateMonitor activeAppBundleID](self, "activeAppBundleID");
      v30 = objc_claimAutoreleasedReturnValue();
      v8 = v30;
      if (v30)
      {
        v31 = -[NSObject isEqualToString:](v30, "isEqualToString:", v7);
        if (TICanLogMessageAtLevel_onceToken != -1)
          dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
        if (v31)
        {
          if (v12)
          {
            if (TICanLogMessageAtLevel_logLevel >= 2)
            {
              TIOSLogFacility();
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Foreground app remained foreground"), "-[TIKeyboardApplicationStateMonitor handleApplicationStateChange:]");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(buf) = 138412290;
                *(_QWORD *)((char *)&buf + 4) = v33;
LABEL_109:
                _os_log_debug_impl(&dword_1DA6F2000, v32, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);

                goto LABEL_97;
              }
              goto LABEL_97;
            }
            goto LABEL_98;
          }
          if (TICanLogMessageAtLevel_logLevel >= 2)
          {
            TIOSLogFacility();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Record activity for foreground app that is now background"), "-[TIKeyboardApplicationStateMonitor handleApplicationStateChange:]");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(buf) = 138412290;
              *(_QWORD *)((char *)&buf + 4) = v52;
              _os_log_debug_impl(&dword_1DA6F2000, v38, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);

            }
          }
          -[TIKeyboardApplicationStateMonitor logOutKeyboardActivity:](self, "logOutKeyboardActivity:", v6);
        }
        else
        {
          if (!v12)
          {
            if (TICanLogMessageAtLevel_logLevel >= 2)
            {
              TIOSLogFacility();
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Discarding activity for background app"), "-[TIKeyboardApplicationStateMonitor handleApplicationStateChange:]");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(buf) = 138412290;
                *(_QWORD *)((char *)&buf + 4) = v33;
                goto LABEL_109;
              }
              goto LABEL_97;
            }
            goto LABEL_98;
          }
          if (TICanLogMessageAtLevel_logLevel >= 2)
          {
            TIOSLogFacility();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Record activity of app that went background directly"), "-[TIKeyboardApplicationStateMonitor handleApplicationStateChange:]");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(buf) = 138412290;
              *(_QWORD *)((char *)&buf + 4) = v51;
              _os_log_debug_impl(&dword_1DA6F2000, v35, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);

            }
          }
          -[TIKeyboardApplicationStateMonitor logOutKeyboardActivity:](self, "logOutKeyboardActivity:", v6);
          -[TIKeyboardApplicationStateMonitor foregroundApps](self, "foregroundApps");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addObject:", v8);

          -[TIKeyboardApplicationStateMonitor foregroundApps](self, "foregroundApps");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "addObject:", v7);

        }
        -[TIKeyboardApplicationStateMonitor startANewKeyboardActivity:](self, "startANewKeyboardActivity:", 0);
        goto LABEL_98;
      }
      if (TICanLogMessageAtLevel_onceToken != -1)
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
      if (v12)
      {
        if (TICanLogMessageAtLevel_logLevel >= 2)
        {
          TIOSLogFacility();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Start recording activity for new foreground app"), "-[TIKeyboardApplicationStateMonitor handleApplicationStateChange:]");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v50;
            _os_log_debug_impl(&dword_1DA6F2000, v34, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);

          }
        }
        -[TIKeyboardApplicationStateMonitor startANewKeyboardActivity:](self, "startANewKeyboardActivity:", v7);
        -[TIKeyboardApplicationStateMonitor setActiveAppStartTime:](self, "setActiveAppStartTime:", v6);
        goto LABEL_98;
      }
      if (TICanLogMessageAtLevel_logLevel >= 2)
      {
        TIOSLogFacility();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Discarding fresh activity for background app"), "-[TIKeyboardApplicationStateMonitor handleApplicationStateChange:]");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v33;
          goto LABEL_109;
        }
LABEL_97:

      }
LABEL_98:
      if (TICanLogMessageAtLevel_onceToken != -1)
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
      if (TICanLogMessageAtLevel_logLevel < 2)
        goto LABEL_104;
      TIOSLogFacility();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        v44 = (void *)MEMORY[0x1E0CB3940];
        -[TIKeyboardApplicationStateMonitor foregroundApps](self, "foregroundApps");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "stringWithFormat:", CFSTR("%s Current foreground apps: %@"), "-[TIKeyboardApplicationStateMonitor handleApplicationStateChange:]", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v46;
        _os_log_debug_impl(&dword_1DA6F2000, v25, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);

      }
      goto LABEL_103;
    }
    -[TIKeyboardApplicationStateMonitor foregroundApps](self, "foregroundApps");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "containsObject:", v7);

    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (v18)
    {
      if (!v12)
      {
        if (TICanLogMessageAtLevel_logLevel >= 2)
        {
          TIOSLogFacility();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Multiple apps - Foreground app went away"), "-[TIKeyboardApplicationStateMonitor handleApplicationStateChange:]");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v49;
            _os_log_debug_impl(&dword_1DA6F2000, v22, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);

          }
        }
        -[TIKeyboardApplicationStateMonitor foregroundApps](self, "foregroundApps");
        v19 = objc_claimAutoreleasedReturnValue();
        -[NSObject removeObject:](v19, "removeObject:", v7);
        goto LABEL_47;
      }
      if (TICanLogMessageAtLevel_logLevel < 2)
        goto LABEL_48;
      TIOSLogFacility();
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        goto LABEL_47;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Multiple apps - Foreground app still foreground"), "-[TIKeyboardApplicationStateMonitor handleApplicationStateChange:]");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v20;
    }
    else
    {
      if (v12)
      {
        if (TICanLogMessageAtLevel_logLevel >= 2)
        {
          TIOSLogFacility();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Multiple apps - Background app is now foreground"), "-[TIKeyboardApplicationStateMonitor handleApplicationStateChange:]");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v48;
            _os_log_debug_impl(&dword_1DA6F2000, v21, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);

          }
        }
        -[TIKeyboardApplicationStateMonitor foregroundApps](self, "foregroundApps");
        v19 = objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v19, "addObject:", v7);
        goto LABEL_47;
      }
      if (TICanLogMessageAtLevel_logLevel < 2)
        goto LABEL_48;
      TIOSLogFacility();
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        goto LABEL_47;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Multiple apps - Background app still background"), "-[TIKeyboardApplicationStateMonitor handleApplicationStateChange:]");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v20;
    }
    _os_log_debug_impl(&dword_1DA6F2000, v19, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);

LABEL_47:
    goto LABEL_48;
  }
  dlerror();
  abort_report_np();
LABEL_111:
  dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
LABEL_6:
  if (*((_DWORD *)p_prots + 950) >= 2u)
  {
    TIOSLogFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Ignoring activity for bundle ID (%@)"), "-[TIKeyboardApplicationStateMonitor handleApplicationStateChange:]", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v9;
      _os_log_debug_impl(&dword_1DA6F2000, v8, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);

    }
    goto LABEL_104;
  }
LABEL_105:

}

- (void)startANewKeyboardActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TIKeyboardApplicationStateMonitor activeStateDataLock](self, "activeStateDataLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "lockBeforeDate:", v6);

  if (v7)
  {
    -[TIKeyboardApplicationStateMonitor setActiveKeyboardStartTime:](self, "setActiveKeyboardStartTime:", 0.0);
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[TIKeyboardApplicationStateMonitor setKeyboardUsageTimes:](self, "setKeyboardUsageTimes:", v8);

    -[TIKeyboardApplicationStateMonitor activeStateDataLock](self, "activeStateDataLock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unlock");

    if (v4)
    {
      -[TIKeyboardApplicationStateMonitor setActiveAppBundleID:](self, "setActiveAppBundleID:", v4);
      -[TIKeyboardApplicationStateMonitor utcCalendar](self, "utcCalendar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "startOfDayForDate:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardApplicationStateMonitor setActiveAppStartDate:](self, "setActiveAppStartDate:", v12);

      -[TIKeyboardApplicationStateMonitor imSuppressingBundleIDs](self, "imSuppressingBundleIDs");
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = (void *)v13;
        -[TIKeyboardApplicationStateMonitor imSuppressingBundleIDs](self, "imSuppressingBundleIDs");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "containsObject:", v4);

        if (v16)
        {
          if (TICanLogMessageAtLevel_onceToken != -1)
            dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
          if (TICanLogMessageAtLevel_logLevel)
          {
            TIOSLogFacility();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Notify delegate of keyboard unlikely app launch"), "-[TIKeyboardApplicationStateMonitor startANewKeyboardActivity:]");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v20 = v18;
              _os_log_debug_impl(&dword_1DA6F2000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

            }
          }
          TIDispatchAsync();
        }
      }
    }
  }

}

- (void)logOutKeyboardActivity:(double)a3
{
  double v5;
  void *v6;
  void *v7;
  int v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  double v50;
  double v51;
  uint64_t i;
  void *v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t j;
  double v62;
  void *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  int v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id obj;
  uint64_t v75;
  TIKeyboardApplicationStateMonitor *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _QWORD v93[4];
  id v94;
  id v95;
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  uint64_t v99;
  uint64_t v100;
  _QWORD v101[3];
  _QWORD v102[3];
  uint8_t buf[4];
  void *v104;
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v5 = TIGetCurrentTime();
  -[TIKeyboardApplicationStateMonitor activeStateDataLock](self, "activeStateDataLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "lockBeforeDate:", v7);

  if (v8)
  {
    -[TIKeyboardApplicationStateMonitor activeKeyboardStartTime](self, "activeKeyboardStartTime");
    if (v9 != 0.0)
    {
      v10 = (void *)MEMORY[0x1E0CB37E8];
      -[TIKeyboardApplicationStateMonitor activeKeyboardStartTime](self, "activeKeyboardStartTime");
      objc_msgSend(v10, "numberWithDouble:", v5 - v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardApplicationStateMonitor setActiveKeyboardStartTime:](self, "setActiveKeyboardStartTime:", 0.0);
      -[TIKeyboardApplicationStateMonitor keyboardUsageTimes](self, "keyboardUsageTimes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v12);

      if (TICanLogMessageAtLevel_onceToken != -1)
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
      if (TICanLogMessageAtLevel_logLevel >= 2)
      {
        TIOSLogFacility();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s App went background without dismissing keyboard"), "-[TIKeyboardApplicationStateMonitor logOutKeyboardActivity:]");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v104 = v72;
          _os_log_debug_impl(&dword_1DA6F2000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

        }
      }

    }
    v15 = (void *)MEMORY[0x1E0CB37E8];
    -[TIKeyboardApplicationStateMonitor activeAppStartTime](self, "activeAppStartTime");
    objc_msgSend(v15, "numberWithDouble:", a3 - v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v102[0] = v17;
    v101[0] = CFSTR("appTime");
    v101[1] = CFSTR("keyboardTimes");
    -[TIKeyboardApplicationStateMonitor keyboardUsageTimes](self, "keyboardUsageTimes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v102[1] = v18;
    v101[2] = CFSTR("startDate");
    -[TIKeyboardApplicationStateMonitor activeAppStartDate](self, "activeAppStartDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      -[TIKeyboardApplicationStateMonitor activeAppStartDate](self, "activeAppStartDate");
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = CFSTR("unknown");
    }
    v102[2] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v102, v101, 3);
    v22 = objc_claimAutoreleasedReturnValue();
    if (v19)

    -[TIKeyboardApplicationStateMonitor activeStateDataLock](self, "activeStateDataLock");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "unlock");

    -[TIKeyboardApplicationStateMonitor databaseInUseLock](self, "databaseInUseLock");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "lock");

    -[TIKeyboardApplicationStateMonitor applicationStateDatabase](self, "applicationStateDatabase");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = (void *)v22;
    if (v25
      || (v26 = (void *)MEMORY[0x1E0C99D80],
          -[TIKeyboardApplicationStateMonitor databaseLocation](self, "databaseLocation"),
          v27 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v26, "dictionaryWithContentsOfURL:", v27),
          v25 = (void *)objc_claimAutoreleasedReturnValue(),
          v27,
          v25))
    {
      v28 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -345600.0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v93[0] = MEMORY[0x1E0C809B0];
      v93[1] = 3221225472;
      v93[2] = __60__TIKeyboardApplicationStateMonitor_logOutKeyboardActivity___block_invoke;
      v93[3] = &unk_1EA103BA0;
      v30 = v29;
      v94 = v30;
      v31 = v28;
      v95 = v31;
      objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v93);
      -[TIKeyboardApplicationStateMonitor activeAppBundleID](self, "activeAppBundleID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKey:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        objc_msgSend(v33, "arrayByAddingObject:", v22);
      }
      else
      {
        v100 = v22;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v100, 1);
      }
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardApplicationStateMonitor activeAppBundleID](self, "activeAppBundleID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setValue:forKey:", v34, v35);

      v36 = (void *)objc_msgSend(v31, "copy");
      -[TIKeyboardApplicationStateMonitor setApplicationStateDatabase:](self, "setApplicationStateDatabase:", v36);

    }
    else
    {
      v70 = (void *)MEMORY[0x1E0C99D80];
      v99 = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v99, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardApplicationStateMonitor activeAppBundleID](self, "activeAppBundleID");
      v31 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "dictionaryWithObject:forKey:", v25, v31);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardApplicationStateMonitor setApplicationStateDatabase:](self, "setApplicationStateDatabase:", v30);
    }

    -[TIKeyboardApplicationStateMonitor threadUnsafeFlushChangesToDiskWithImmediacy:](self, "threadUnsafeFlushChangesToDiskWithImmediacy:", 0);
    -[TIKeyboardApplicationStateMonitor databaseInUseLock](self, "databaseInUseLock");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "unlock");

    v38 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[TIKeyboardApplicationStateMonitor setImSuppressingBundleIDs:](self, "setImSuppressingBundleIDs:", v38);

    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    -[TIKeyboardApplicationStateMonitor applicationStateDatabase](self, "applicationStateDatabase");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "allKeys");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v40;
    v77 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v89, v98, 16);
    if (v77)
    {
      v75 = *(_QWORD *)v90;
      v76 = self;
      do
      {
        v41 = 0;
        do
        {
          if (*(_QWORD *)v90 != v75)
            objc_enumerationMutation(obj);
          v79 = v41;
          v42 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * v41);
          -[TIKeyboardApplicationStateMonitor applicationStateDatabase](self, "applicationStateDatabase");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = v42;
          objc_msgSend(v43, "objectForKeyedSubscript:", v42);
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          v87 = 0u;
          v88 = 0u;
          v85 = 0u;
          v86 = 0u;
          v45 = v44;
          v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
          if (v46)
          {
            v47 = v46;
            v48 = 0;
            v49 = *(_QWORD *)v86;
            v50 = 0.0;
            v51 = 0.0;
            do
            {
              v80 = v48;
              for (i = 0; i != v47; ++i)
              {
                if (*(_QWORD *)v86 != v49)
                  objc_enumerationMutation(v45);
                v53 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
                objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("appTime"));
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "doubleValue");
                v56 = v55;

                v83 = 0u;
                v84 = 0u;
                v81 = 0u;
                v82 = 0u;
                objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("keyboardTimes"));
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v81, v96, 16);
                if (v58)
                {
                  v59 = v58;
                  v60 = *(_QWORD *)v82;
                  do
                  {
                    for (j = 0; j != v59; ++j)
                    {
                      if (*(_QWORD *)v82 != v60)
                        objc_enumerationMutation(v57);
                      objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * j), "doubleValue");
                      v51 = v51 + v62;
                    }
                    v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v81, v96, 16);
                  }
                  while (v59);
                }
                v50 = v50 + v56;

              }
              v48 = v80 + v47;
              v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
            }
            while (v47);
          }
          else
          {
            v48 = 0;
            v50 = 0.0;
            v51 = 0.0;
          }

          self = v76;
          if (v51 / v50 < v76->_appActivityKeyboardUsageFractionThreshold
            && v50 / (double)v48 > v76->_appActivityTimeDurationThreshold)
          {
            -[TIKeyboardApplicationStateMonitor imSuppressingBundleIDs](v76, "imSuppressingBundleIDs");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "addObject:", v78);

          }
          v41 = v79 + 1;
        }
        while (v79 + 1 != v77);
        v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v98, 16);
      }
      while (v77);
    }

    -[TIKeyboardApplicationStateMonitor setActiveAppBundleID:](self, "setActiveAppBundleID:", 0);
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    v21 = v73;
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Wrote out app usage data"), "-[TIKeyboardApplicationStateMonitor logOutKeyboardActivity:]");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v104 = v71;
        _os_log_debug_impl(&dword_1DA6F2000, v64, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    -[TIKeyboardApplicationStateMonitor activeStateDataLock](self, "activeStateDataLock");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 1.0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v65, "lockBeforeDate:", v66);

    if (v67)
    {
      -[TIKeyboardApplicationStateMonitor setActiveKeyboardStartTime:](self, "setActiveKeyboardStartTime:", 0.0);
      v68 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[TIKeyboardApplicationStateMonitor setKeyboardUsageTimes:](self, "setKeyboardUsageTimes:", v68);

      -[TIKeyboardApplicationStateMonitor activeStateDataLock](self, "activeStateDataLock");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "unlock");

    }
  }
  else
  {
    v21 = 0;
  }

}

- (void)dealloc
{
  objc_super v3;

  -[BKSApplicationStateMonitor invalidate](self->_applicationStateMonitor, "invalidate");
  -[TIKeyboardApplicationStateMonitor setDelegate:](self, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardApplicationStateMonitor;
  -[TIKeyboardApplicationStateMonitor dealloc](&v3, sel_dealloc);
}

- (void)keyboardInUse
{
  double v3;
  void *v4;
  void *v5;
  int v6;
  id v7;

  v3 = TIGetCurrentTime();
  -[TIKeyboardApplicationStateMonitor activeStateDataLock](self, "activeStateDataLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "lockBeforeDate:", v5);

  if (v6)
  {
    -[TIKeyboardApplicationStateMonitor setActiveKeyboardStartTime:](self, "setActiveKeyboardStartTime:", v3);
    -[TIKeyboardApplicationStateMonitor activeStateDataLock](self, "activeStateDataLock");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unlock");

  }
}

- (void)keyboardNoLongerInUse
{
  double v3;
  void *v4;
  void *v5;
  int v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = TIGetCurrentTime();
  -[TIKeyboardApplicationStateMonitor activeStateDataLock](self, "activeStateDataLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "lockBeforeDate:", v5);

  if (v6)
  {
    -[TIKeyboardApplicationStateMonitor activeKeyboardStartTime](self, "activeKeyboardStartTime");
    if (v7 != 0.0)
    {
      v8 = (void *)MEMORY[0x1E0CB37E8];
      -[TIKeyboardApplicationStateMonitor activeKeyboardStartTime](self, "activeKeyboardStartTime");
      objc_msgSend(v8, "numberWithDouble:", v3 - v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardApplicationStateMonitor setActiveKeyboardStartTime:](self, "setActiveKeyboardStartTime:", 0.0);
      -[TIKeyboardApplicationStateMonitor keyboardUsageTimes](self, "keyboardUsageTimes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v10);

      if (TICanLogMessageAtLevel_onceToken != -1)
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
      if (TICanLogMessageAtLevel_logLevel >= 2)
      {
        TIOSLogFacility();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Recorded keyboard usage time data"), "-[TIKeyboardApplicationStateMonitor keyboardNoLongerInUse]");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v16 = v14;
          _os_log_debug_impl(&dword_1DA6F2000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

        }
      }

    }
    -[TIKeyboardApplicationStateMonitor activeStateDataLock](self, "activeStateDataLock");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "unlock");

  }
}

- (id)databaseLocation
{
  if (databaseLocation_onceToken != -1)
    dispatch_once(&databaseLocation_onceToken, &__block_literal_global_13905);
  return (id)databaseLocation_url;
}

- (BOOL)threadUnsafeFlushChangesToDiskWithImmediacy:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    -[TIKeyboardApplicationStateMonitor timeOfLastFlushToDisk](self, "timeOfLastFlushToDisk");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceNow");
    v6 = fabs(v5);

    if (v6 < 120.0)
      return 1;
  }
  -[TIKeyboardApplicationStateMonitor applicationStateDatabase](self, "applicationStateDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardApplicationStateMonitor databaseLocation](self, "databaseLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "writeToURL:atomically:", v9, 1);

  -[TIKeyboardApplicationStateMonitor databaseLocation](self, "databaseLocation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "setResourceValue:forKey:error:", *MEMORY[0x1E0C99928], *MEMORY[0x1E0C99938], 0);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardApplicationStateMonitor setTimeOfLastFlushToDisk:](self, "setTimeOfLastFlushToDisk:", v13);

  if (TICanLogMessageAtLevel_onceToken != -1)
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
  if (TICanLogMessageAtLevel_logLevel >= 2)
  {
    TIOSLogFacility();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Flushed changes to disk"), "-[TIKeyboardApplicationStateMonitor threadUnsafeFlushChangesToDiskWithImmediacy:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v15;
      _os_log_debug_impl(&dword_1DA6F2000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  return v10 & v12;
}

- (BOOL)flushPendingChangesToDisk
{
  void *v3;
  void *v4;
  int v5;
  BOOL v6;
  void *v7;

  -[TIKeyboardApplicationStateMonitor databaseInUseLock](self, "databaseInUseLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "lockBeforeDate:", v4);

  if (!v5)
    return 1;
  v6 = -[TIKeyboardApplicationStateMonitor threadUnsafeFlushChangesToDiskWithImmediacy:](self, "threadUnsafeFlushChangesToDiskWithImmediacy:", 1);
  -[TIKeyboardApplicationStateMonitor databaseInUseLock](self, "databaseInUseLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

  return v6;
}

- (BOOL)ignoreAppExtension:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = ignoreAppExtension__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&ignoreAppExtension__onceToken, &__block_literal_global_77_13810);
  v5 = objc_msgSend((id)ignoreAppExtension__ignoreList, "containsObject:", v4);

  return v5;
}

- (TIKeyboardApplicationStateResponses)delegate
{
  return (TIKeyboardApplicationStateResponses *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BKSApplicationStateMonitor)applicationStateMonitor
{
  return self->_applicationStateMonitor;
}

- (void)setApplicationStateMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_applicationStateMonitor, a3);
}

- (NSString)activeAppBundleID
{
  return self->_activeAppBundleID;
}

- (void)setActiveAppBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_activeAppBundleID, a3);
}

- (double)activeAppStartTime
{
  return self->_activeAppStartTime;
}

- (void)setActiveAppStartTime:(double)a3
{
  self->_activeAppStartTime = a3;
}

- (NSMutableSet)foregroundApps
{
  return self->_foregroundApps;
}

- (void)setForegroundApps:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundApps, a3);
}

- (NSDate)activeAppStartDate
{
  return self->_activeAppStartDate;
}

- (void)setActiveAppStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_activeAppStartDate, a3);
}

- (NSDictionary)applicationStateDatabase
{
  return self->_applicationStateDatabase;
}

- (void)setApplicationStateDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_applicationStateDatabase, a3);
}

- (NSMutableSet)imSuppressingBundleIDs
{
  return self->_imSuppressingBundleIDs;
}

- (void)setImSuppressingBundleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_imSuppressingBundleIDs, a3);
}

- (NSLock)activeStateDataLock
{
  return self->_activeStateDataLock;
}

- (void)setActiveStateDataLock:(id)a3
{
  objc_storeStrong((id *)&self->_activeStateDataLock, a3);
}

- (NSLock)databaseInUseLock
{
  return self->_databaseInUseLock;
}

- (void)setDatabaseInUseLock:(id)a3
{
  objc_storeStrong((id *)&self->_databaseInUseLock, a3);
}

- (NSDate)timeOfLastFlushToDisk
{
  return self->_timeOfLastFlushToDisk;
}

- (void)setTimeOfLastFlushToDisk:(id)a3
{
  objc_storeStrong((id *)&self->_timeOfLastFlushToDisk, a3);
}

- (NSCalendar)utcCalendar
{
  return self->_utcCalendar;
}

- (void)setUtcCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_utcCalendar, a3);
}

- (NSMutableArray)keyboardUsageTimes
{
  return self->_keyboardUsageTimes;
}

- (void)setKeyboardUsageTimes:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardUsageTimes, a3);
}

- (double)activeKeyboardStartTime
{
  return self->_activeKeyboardStartTime;
}

- (void)setActiveKeyboardStartTime:(double)a3
{
  self->_activeKeyboardStartTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardUsageTimes, 0);
  objc_storeStrong((id *)&self->_utcCalendar, 0);
  objc_storeStrong((id *)&self->_timeOfLastFlushToDisk, 0);
  objc_storeStrong((id *)&self->_databaseInUseLock, 0);
  objc_storeStrong((id *)&self->_activeStateDataLock, 0);
  objc_storeStrong((id *)&self->_imSuppressingBundleIDs, 0);
  objc_storeStrong((id *)&self->_applicationStateDatabase, 0);
  objc_storeStrong((id *)&self->_activeAppStartDate, 0);
  objc_storeStrong((id *)&self->_foregroundApps, 0);
  objc_storeStrong((id *)&self->_activeAppBundleID, 0);
  objc_storeStrong((id *)&self->_applicationStateMonitor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __56__TIKeyboardApplicationStateMonitor_ignoreAppExtension___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.apple.CryptoTokenKit.setoken"), CFSTR("com.apple.Sharing.AirDropDiagnostic"), CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider"), CFSTR("com.apple.UIKit.ShareUI"), CFSTR("com.apple.WebKit.WebContent"), CFSTR("com.apple.WebKit.Networking"), CFSTR("com.apple.mobileslideshow.PhotosDiagnostics"), CFSTR("com.apple.CarKit.CarPlayDiagnosticsExtension"), CFSTR("com.apple.CloudDocsDaemon.diagnostic"), CFSTR("com.apple.Maps.DEMapsExtension"), CFSTR("com.apple.Search.framework.SpotlightDiagnostic"), CFSTR("com.apple.BiometricKit.BioLogDiagnostic"), CFSTR("com.apple.audio.toolbox.AudioToolbox.DiagnosticExtensions"), CFSTR("com.apple.Symptoms.SFDiagnosticExtension.appex"), CFSTR("com.apple.news.articlenotificationserviceextension"), CFSTR("com.apple.DiagnosticsService.SystemReport"), CFSTR("com.apple.FileProvider.LocalStorage"),
    CFSTR("com.apple.news.diagnosticextension"),
    CFSTR("com.apple.mobilesafari.SafariDiagnosticExtension"),
    CFSTR("com.apple.mobilemail.DiagnosticExtension"),
    CFSTR("com.apple.mobilecal.diagnosticextension"),
    CFSTR("com.apple.accessibility.Accessibility.AXTapToRadar"),
    CFSTR("com.apple.accessibility.Accessibility.GuidedAccessTapToRadar"),
    CFSTR("com.apple.accessibility.Accessibility.HearingAidsTapToRadar"),
    CFSTR("com.apple.accessibility.Accessibility.SwitchControlTapToRadar"),
    CFSTR("com.apple.accessibility.Accessibility.VoiceOverTapToRadar"),
    CFSTR("com.apple.audio.toolbox.AudioToolbox.DiagnosticExtensions"),
    CFSTR("com.apple.duet.expertcenter.diagnosticextension"),
    CFSTR("com.apple.keyboard.TypoTracker.DiagnosticExtension"),
    CFSTR("com.apple.PowerlogCore.diagnosticextension"),
    CFSTR("com.apple.PassKit.applepay.diagnosticextension"),
    CFSTR("com.apple.HomeKit.diagnosticextensioncom.apple.MediaPlayer.DiagnosticExtension"),
    CFSTR("com.apple.MobileAddressBook"),
    CFSTR("com.apple.MobileBackup.framework.DiagnosticExtension"),
    CFSTR("com.apple.CoreRoutine.RTDiagnosticExtension"),
    CFSTR("com.apple.DiagnosticExtensions.sysdiagnose"),
    CFSTR("com.apple.DiagnosticExtensions.Bluetooth"),
    CFSTR("com.apple.DiagnosticExtensions.WiFi"),
    CFSTR("com.apple.DiagnosticExtensions.Syslog"),
    CFSTR("com.apple.DiagnosticExtensions.StackShot"),
    CFSTR("com.apple.DiagnosticExtensions.Keyboard"),
    CFSTR("com.apple.DiagnosticExtensions.CrashLogs"),
    CFSTR("com.apple.DiagnosticExtensions.Panic"),
    CFSTR("com.apple.DiagnosticExtensions.LowMemory"),
    CFSTR("com.apple.DiagnosticExtensions.Siri"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ignoreAppExtension__ignoreList;
  ignoreAppExtension__ignoreList = v0;

}

void __53__TIKeyboardApplicationStateMonitor_databaseLocation__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", TI_KB_USER_DIRECTORY(), 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("app_usage_database.plist"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)databaseLocation_url;
  databaseLocation_url = v0;

}

void __60__TIKeyboardApplicationStateMonitor_logOutKeyboardActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v15 = a2;
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "objectForKey:", CFSTR("startDate"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "compare:", *(_QWORD *)(a1 + 32));

        if (v14 == 1)
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v6, "count"))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v6, v15);

}

void __63__TIKeyboardApplicationStateMonitor_startANewKeyboardActivity___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "releaseInputManagers");

}

void __109__TIKeyboardApplicationStateMonitor_initWithAppActivityTimeDurationThreshold_keyboardUsageFractionThreshold___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "handleApplicationStateChange:", v3);

}

@end
