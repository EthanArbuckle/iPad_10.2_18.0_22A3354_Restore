@implementation SUCoreSimulate

+ (id)sharedSimulator
{
  if (sharedSimulator_simulatorOnce != -1)
    dispatch_once(&sharedSimulator_simulatorOnce, &__block_literal_global);
  return (id)sharedSimulator_simulator;
}

void __33__SUCoreSimulate_sharedSimulator__block_invoke()
{
  SUCoreSimulate *v0;
  void *v1;

  v0 = objc_alloc_init(SUCoreSimulate);
  v1 = (void *)sharedSimulator_simulator;
  sharedSimulator_simulator = (uint64_t)v0;

}

- (SUCoreSimulate)init
{
  SUCoreSimulate *v2;
  void *v3;
  NSDictionary *eventAlterations;
  id registeredCallback;
  void *v6;
  void *v7;
  id v8;
  const char *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *simulateQueue;
  void *v13;
  NSObject *v14;
  void *v15;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)SUCoreSimulate;
  v2 = -[SUCoreSimulate init](&v17, sel_init);
  if (v2)
  {
    +[SUCoreDevice sharedDevice](SUCoreDevice, "sharedDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_simulatorEnabled = objc_msgSend(v3, "isBootedOSSecureInternal");

    eventAlterations = v2->_eventAlterations;
    v2->_eventAlterations = 0;

    registeredCallback = v2->_registeredCallback;
    v2->_registeredCallback = 0;

    +[SUCore sharedCore](SUCore, "sharedCore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "commonDomain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.%@"), v7, CFSTR("core.simulate")));
    v9 = (const char *)objc_msgSend(v8, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create(v9, v10);
    simulateQueue = v2->_simulateQueue;
    v2->_simulateQueue = (OS_dispatch_queue *)v11;

    if (v2->_simulateQueue)
    {
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "oslog");
      v14 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v19 = v7;
        v20 = 2112;
        v21 = CFSTR("core.simulate");
        _os_log_impl(&dword_1B05B8000, v14, OS_LOG_TYPE_DEFAULT, "[SIMULATE] DISPATCH: created simulate dispatch queue domain(%@.%@)", buf, 0x16u);
      }

    }
    else
    {
      +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "trackError:forReason:withResult:withError:", CFSTR("[SIMULATE] DISPATCH"), CFSTR("failed to create simulate dispatch queue"), 8100, 0);

      v2->_simulatorEnabled = 0;
    }

  }
  return v2;
}

- (void)adoptAllEventAlterations:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];
  _QWORD block[5];
  id v11;

  v4 = a3;
  if (-[SUCoreSimulate simulatorEnabled](self, "simulatorEnabled"))
  {
    -[SUCoreSimulate simulateQueue](self, "simulateQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v5);

    -[SUCoreSimulate simulateQueue](self, "simulateQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__SUCoreSimulate_adoptAllEventAlterations___block_invoke;
    block[3] = &unk_1E611BF60;
    block[4] = self;
    v11 = v4;
    dispatch_sync(v6, block);

  }
  else
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1B05B8000, v8, OS_LOG_TYPE_DEFAULT, "[SIMULATE] cannot adopt event alterations (simulator disabled)", v9, 2u);
    }

    NSLog((NSString *)CFSTR("[SIMULATE] cannot adopt event alterations (simulator disabled)"));
  }

}

uint64_t __43__SUCoreSimulate_adoptAllEventAlterations___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_adoptAllEventAlterations:", *(_QWORD *)(a1 + 40));
}

- (void)_adoptAllEventAlterations:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  char v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  uint8_t buf[4];
  id v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreSimulate simulateQueue](self, "simulateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreSimulate eventAlterations](self, "eventAlterations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "fileExistsAtPath:", v4))
    {
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "oslog");
      v13 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v4;
        _os_log_impl(&dword_1B05B8000, v13, OS_LOG_TYPE_DEFAULT, "[SIMULATE] simulate event alterations file does not exist (file non-existent): %@", buf, 0xCu);
      }

      NSLog((NSString *)CFSTR("[SIMULATE] simulate event alterations file does not exist (file non-existent): %@"), v4);
      goto LABEL_33;
    }
    v38 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v43 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfFile:encoding:error:", v4, 1, &v43);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v43;
    if (v10)
    {
      +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "trackError:forReason:withResult:withError:", CFSTR("[SIMULATE] SETUP"), CFSTR("adopt event alterations (load failed)"), 8121, v10);
LABEL_32:

LABEL_33:
      goto LABEL_34;
    }
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("\r\n"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsSeparatedByCharactersInSet:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v11 = v15;
    v16 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    if (v16)
    {
      v17 = v16;
      v34 = v9;
      v35 = v8;
      v36 = v4;
      v18 = *(_QWORD *)v40;
      v37 = 1;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v40 != v18)
            objc_enumerationMutation(v11);
          v20 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          if (objc_msgSend(v20, "length"))
          {
            objc_msgSend(v20, "substringWithRange:", 0, 1);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("#"));

            if ((v22 & 1) == 0)
            {
              -[SUCoreSimulate _eventFromLine:](self, "_eventFromLine:", v20);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = v23;
              if (v23)
              {
                objc_msgSend(v23, "moduleName");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "safeObjectForKey:ofClass:", v25, objc_opt_class());
                v26 = (id)objc_claimAutoreleasedReturnValue();

                if (!v26)
                {
                  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  objc_msgSend(v24, "moduleName");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "setSafeObject:forKey:", v26, v27);

                }
                +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "oslog");
                v29 = objc_claimAutoreleasedReturnValue();

                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v24, "summary");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v45 = v30;
                  _os_log_impl(&dword_1B05B8000, v29, OS_LOG_TYPE_DEFAULT, "[SIMULATE] adding event: %@", buf, 0xCu);

                }
                objc_msgSend(v26, "addObject:", v24);

              }
              else
              {
                +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "oslog");
                v32 = objc_claimAutoreleasedReturnValue();

                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v45 = v20;
                  _os_log_impl(&dword_1B05B8000, v32, OS_LOG_TYPE_DEFAULT, "[SIMULATE] failed parsing line: %@", buf, 0xCu);
                }

                NSLog((NSString *)CFSTR("[SIMULATE] failed parsing line: %@"), v20);
                v37 = 0;
              }

            }
          }
        }
        v17 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
      }
      while (v17);

      v8 = v35;
      v4 = v36;
      v9 = v34;
      if ((v37 & 1) == 0)
      {
        +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "trackError:forReason:withResult:withError:", CFSTR("[SIMULATE] SETUP"), CFSTR("adopt event alterations (parsing failed)"), 8121, 0);

        goto LABEL_32;
      }
    }
    else
    {

    }
    -[SUCoreSimulate setEventAlterations:](self, "setEventAlterations:", v38);
    goto LABEL_32;
  }
  +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trackError:forReason:withResult:withError:", CFSTR("[SIMULATE] SETUP"), CFSTR("adopt event alterations (already adopted)"), 8111, 0);

LABEL_34:
}

- (id)_eventFromLine:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;
  int64_t v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _BOOL4 v24;
  id v25;
  SUCoreSimulateEvent *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  SUCoreSimulateEvent *v31;
  SUCoreSimulateEvent *v32;
  void *v33;
  void *v34;
  uint64_t v36;
  void *v37;
  id v38;
  int64_t v39;
  SUCoreSimulateEvent *v40;
  id v41;
  int64_t v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  unsigned int v58;
  unsigned int v59[3];

  v4 = a3;
  v58 = -1;
  v59[0] = -1;
  v57 = -1;
  v55 = 0;
  v56 = 0;
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("--"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("\t "));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsSeparatedByCharactersInSet:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  if ((unint64_t)objc_msgSend(v5, "count") < 2)
  {
    v15 = 0;
    if (!v10)
      goto LABEL_11;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByTrimmingCharactersInSet:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("\t "));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "componentsSeparatedByCharactersInSet:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_11;
  }
  if ((unint64_t)objc_msgSend(v10, "count") >= 2)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[SUCoreSimulate _actionFromString:](self, "_actionFromString:", v16);

    v18 = v17;
    objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = -[SUCoreSimulate _triggerFromString:](self, "_triggerFromString:", v19);

    if (v15)
      goto LABEL_12;
LABEL_10:
    v20 = 0;
    v45 = 0;
    v46 = 0;
    v43 = 0;
    v44 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    goto LABEL_13;
  }
LABEL_11:
  v42 = 0;
  v18 = 0;
  if (!v15)
    goto LABEL_10;
LABEL_12:
  v53 = 0;
  v54 = 0;
  v51 = 0;
  v52 = 0;
  v49 = 0;
  v50 = 0;
  v47 = 0;
  v48 = 0;
  v24 = -[SUCoreSimulate _parseOptionalEntriesInLineFromWords:argStartAt:argEndAt:argDuration:argUntilStop:argAssetBuildVersions:argAssetProductVersions:argAssetAttributesPlist:argAssetState:argUpdateInfoPlist:argErrorDomain:argErrorCode:argErrorUserInfo:argErrorRecoverable:](self, "_parseOptionalEntriesInLineFromWords:argStartAt:argEndAt:argDuration:argUntilStop:argAssetBuildVersions:argAssetProductVersions:argAssetAttributesPlist:argAssetState:argUpdateInfoPlist:argErrorDomain:argErrorCode:argErrorUserInfo:argErrorRecoverable:", v15, v59, &v58, &v57, &v54, &v53, &v52, &v51, &v50, &v49, &v48, &v56, &v47, &v55);
  v20 = v54;
  v46 = v53;
  v45 = v52;
  v44 = v51;
  v21 = v50;
  v43 = v49;
  v22 = v48;
  v23 = v47;
  if (!v24)
    goto LABEL_25;
LABEL_13:
  if (!v18 || !v42)
    goto LABEL_25;
  if (objc_msgSend(v10, "count") == 4)
  {
    v39 = v18;
    v25 = v4;
    v26 = [SUCoreSimulateEvent alloc];
    objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 3);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = v20;
    v30 = (void *)v28;
    v41 = v29;
    LODWORD(v36) = v57;
    v31 = v26;
    v4 = v25;
    v32 = -[SUCoreSimulateEvent initWithAction:onTrigger:forModule:atFunction:startAt:endAt:duration:untilStop:assetBuildVersions:assetProductVersions:assetAttributesPlist:assetState:updateInfoPlist:errorDomain:errorCode:errorUserInfo:errorRecoverable:](v31, "initWithAction:onTrigger:forModule:atFunction:startAt:endAt:duration:untilStop:assetBuildVersions:assetProductVersions:assetAttributesPlist:assetState:updateInfoPlist:errorDomain:errorCode:errorUserInfo:errorRecoverable:", v39, v42, v27, v30, v59[0], v58, v36, v29, v46, v45, v44, v21, v43, v22, v56, v23,
            v55);
  }
  else
  {
    if (objc_msgSend(v10, "count") != 5 && objc_msgSend(v10, "count") != 6 || v42 != 3)
      goto LABEL_25;
    v38 = v4;
    v41 = v20;
    if (objc_msgSend(v10, "count") == 6)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", 5);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = 0;
    }
    v40 = [SUCoreSimulateEvent alloc];
    objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 3);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 4);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[SUCoreSimulateEvent initWithAction:onTrigger:forMachine:atEvent:inState:alteration:startAt:endAt:assetBuildVersions:assetProductVersions:assetAttributesPlist:assetState:updateInfoPlist:errorDomain:errorCode:errorUserInfo:errorRecoverable:](v40, "initWithAction:onTrigger:forMachine:atEvent:inState:alteration:startAt:endAt:assetBuildVersions:assetProductVersions:assetAttributesPlist:assetState:updateInfoPlist:errorDomain:errorCode:errorUserInfo:errorRecoverable:", v18, 3, v30, v33, v37, v27, __PAIR64__(v58, v59[0]), v46, v45, v44, v21, v43, v22, v56, v23, v55);

    v4 = v38;
  }

  v20 = v41;
  if (!v32)
  {
LABEL_25:
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SIMULATE] SETUP"), v4, 8112, 0);

    v32 = 0;
  }

  return v32;
}

- (id)_splitString:(id)a3 byTheFirstOccurrenceOf:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "rangeOfString:", a4);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    v8 = v6;
    objc_msgSend(v5, "substringToIndex:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "substringFromIndex:", v8 + 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v9;
    v12[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (BOOL)_parseOptionalEntriesInLineFromWords:(id)a3 argStartAt:(int *)a4 argEndAt:(int *)a5 argDuration:(int *)a6 argUntilStop:(id *)a7 argAssetBuildVersions:(id *)a8 argAssetProductVersions:(id *)a9 argAssetAttributesPlist:(id *)a10 argAssetState:(id *)a11 argUpdateInfoPlist:(id *)a12 argErrorDomain:(id *)a13 argErrorCode:(int64_t *)a14 argErrorUserInfo:(id *)a15 argErrorRecoverable:(int64_t *)a16
{
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  BOOL v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  int v35;
  void *v36;
  BOOL v37;
  void *v38;
  NSObject *v39;
  void *v40;
  int v41;
  void *v42;
  BOOL v43;
  void *v44;
  NSObject *v45;
  void *v46;
  int v47;
  void *v48;
  int v49;
  void *v50;
  uint64_t v51;
  void *v52;
  int v53;
  void *v54;
  uint64_t v55;
  void *v56;
  int v57;
  void *v58;
  NSObject *v59;
  id v60;
  NSObject *v61;
  const char *v62;
  void *v63;
  int v64;
  void *v65;
  id v66;
  void *v67;
  int v68;
  void *v69;
  id v70;
  void *v71;
  int v72;
  void *v73;
  id v74;
  void *v75;
  int v76;
  void *v77;
  BOOL v78;
  void *v79;
  NSObject *v80;
  void *v81;
  int v82;
  void *v83;
  BOOL v84;
  void *v85;
  NSObject *v86;
  void *v87;
  int v88;
  void *v89;
  BOOL v90;
  void *v91;
  NSObject *v92;
  void *v93;
  NSObject *v94;
  uint64_t v95;
  id v96;
  id v97;
  BOOL v98;
  _BOOL4 v99;
  uint64_t v100;
  void *v101;
  NSObject *v102;
  void *v103;
  NSObject *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v108;
  id *v109;
  void *v110;
  void *v111;
  id obj;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  uint8_t buf[4];
  uint64_t v122;
  __int16 v123;
  uint64_t v124;
  _BYTE v125[128];
  uint64_t v126;

  v126 = *MEMORY[0x1E0C80C00];
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  obj = a3;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v125, 16);
  if (!v18)
  {
    v99 = 0;
    v98 = 0;
    v97 = 0;
    v96 = 0;
    v20 = 1;
    goto LABEL_81;
  }
  v19 = v18;
  v109 = a8;
  v110 = 0;
  v111 = 0;
  v20 = 1;
  v21 = *(_QWORD *)v118;
  do
  {
    v22 = 0;
    do
    {
      if (*(_QWORD *)v118 != v21)
        objc_enumerationMutation(obj);
      v23 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * v22);
      -[SUCoreSimulate _splitString:byTheFirstOccurrenceOf:](self, "_splitString:byTheFirstOccurrenceOf:", v23, CFSTR("="));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (!v24 || objc_msgSend(v24, "count") != 2)
      {
        +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "oslog");
        v33 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v122 = (uint64_t)v23;
          _os_log_impl(&dword_1B05B8000, v33, OS_LOG_TYPE_DEFAULT, "[SIMULATE] failed parsing tokens (unexpected format, expected 'key=value') for: '%@'", buf, 0xCu);
        }

        NSLog((NSString *)CFSTR("[SIMULATE] failed parsing tokens (unexpected format, expected 'key=value') for: '%@'"), v23);
        goto LABEL_16;
      }
      objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("startAt"));

      if (v27)
      {
        objc_msgSend(v25, "objectAtIndexedSubscript:", 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = -[SUCoreSimulate _parseIntFromString:destination:](self, "_parseIntFromString:destination:", v28, a4);

        if (v29)
          goto LABEL_17;
        +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "oslog");
        v31 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v122 = (uint64_t)v23;
          _os_log_impl(&dword_1B05B8000, v31, OS_LOG_TYPE_DEFAULT, "[SIMULATE] failed parsing 'startAt' (expected int) for: '%@'", buf, 0xCu);
        }

        NSLog((NSString *)CFSTR("[SIMULATE] failed parsing 'startAt' (expected int) for: '%@'"), v23);
        goto LABEL_16;
      }
      objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "isEqualToString:", CFSTR("endAt"));

      if (v35)
      {
        objc_msgSend(v25, "objectAtIndexedSubscript:", 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = -[SUCoreSimulate _parseIntFromString:destination:](self, "_parseIntFromString:destination:", v36, a5);

        if (!v37)
        {
          +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "oslog");
          v39 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v122 = (uint64_t)v23;
            _os_log_impl(&dword_1B05B8000, v39, OS_LOG_TYPE_DEFAULT, "[SIMULATE] failed parsing 'endAt' (expected int) for: '%@'", buf, 0xCu);
          }

          NSLog((NSString *)CFSTR("[SIMULATE] failed parsing 'endAt' (expected int) for: '%@'"), v23);
LABEL_16:
          v20 = 0;
        }
      }
      else
      {
        objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "isEqualToString:", CFSTR("duration"));

        if (v41)
        {
          objc_msgSend(v25, "objectAtIndexedSubscript:", 1);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = -[SUCoreSimulate _parseIntFromString:destination:](self, "_parseIntFromString:destination:", v42, a6);

          if (!v43)
          {
            +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "oslog");
            v45 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v122 = (uint64_t)v23;
              _os_log_impl(&dword_1B05B8000, v45, OS_LOG_TYPE_DEFAULT, "[SIMULATE] failed parsing 'duration' (expected int) for: '%@'", buf, 0xCu);
            }

            NSLog((NSString *)CFSTR("[SIMULATE] failed parsing 'duration' (expected int) for: '%@'"), v23);
            goto LABEL_16;
          }
        }
        else
        {
          objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v46, "isEqualToString:", CFSTR("untilStop"));

          if (a7 && v47)
          {
            objc_msgSend(v25, "objectAtIndexedSubscript:", 1);
            *a7 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_17;
          }
          objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "isEqualToString:", CFSTR("assetBuildVersions"));

          if (v49)
          {
            objc_msgSend(v25, "objectAtIndexedSubscript:", 1);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "componentsSeparatedByString:", CFSTR(","));
            v51 = objc_claimAutoreleasedReturnValue();

            v111 = (void *)v51;
            goto LABEL_17;
          }
          objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v52, "isEqualToString:", CFSTR("assetProductVersions"));

          if (v53)
          {
            objc_msgSend(v25, "objectAtIndexedSubscript:", 1);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "componentsSeparatedByString:", CFSTR(","));
            v55 = objc_claimAutoreleasedReturnValue();

            v110 = (void *)v55;
            goto LABEL_17;
          }
          objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = objc_msgSend(v56, "isEqualToString:", CFSTR("assetAttributesPlist"));

          if (a10 && v57)
          {
            objc_msgSend(v25, "objectAtIndexedSubscript:", 1);
            *a10 = (id)objc_claimAutoreleasedReturnValue();
            +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "oslog");
            v59 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
            {
              v60 = *a10;
              *(_DWORD *)buf = 138412290;
              v122 = (uint64_t)v60;
              v61 = v59;
              v62 = "[SIMULATE] using assetAttributesPlist: '%@'";
              goto LABEL_52;
            }
LABEL_53:

            goto LABEL_17;
          }
          objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = objc_msgSend(v63, "isEqualToString:", CFSTR("assetState"));

          if (a11 && v64)
          {
            objc_msgSend(v25, "objectAtIndexedSubscript:", 1);
            *a11 = (id)objc_claimAutoreleasedReturnValue();
            +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "oslog");
            v59 = objc_claimAutoreleasedReturnValue();

            if (!os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
              goto LABEL_53;
            v66 = *a11;
            *(_DWORD *)buf = 138412290;
            v122 = (uint64_t)v66;
            v61 = v59;
            v62 = "[SIMULATE] using assetState: '%@'";
LABEL_52:
            _os_log_impl(&dword_1B05B8000, v61, OS_LOG_TYPE_DEFAULT, v62, buf, 0xCu);
            goto LABEL_53;
          }
          objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = objc_msgSend(v67, "isEqualToString:", CFSTR("updateInfoPlist"));

          if (a12 && v68)
          {
            objc_msgSend(v25, "objectAtIndexedSubscript:", 1);
            *a12 = (id)objc_claimAutoreleasedReturnValue();
            +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "oslog");
            v59 = objc_claimAutoreleasedReturnValue();

            if (!os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
              goto LABEL_53;
            v70 = *a12;
            *(_DWORD *)buf = 138412290;
            v122 = (uint64_t)v70;
            v61 = v59;
            v62 = "[SIMULATE] using updateInfoPlist: '%@'";
            goto LABEL_52;
          }
          objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = objc_msgSend(v71, "isEqualToString:", CFSTR("errorDomain"));

          if (a13 && v72)
          {
            objc_msgSend(v25, "objectAtIndexedSubscript:", 1);
            *a13 = (id)objc_claimAutoreleasedReturnValue();
            +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "oslog");
            v59 = objc_claimAutoreleasedReturnValue();

            if (!os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
              goto LABEL_53;
            v74 = *a13;
            *(_DWORD *)buf = 138412290;
            v122 = (uint64_t)v74;
            v61 = v59;
            v62 = "[SIMULATE] using errorDomain: '%@'";
            goto LABEL_52;
          }
          objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = objc_msgSend(v75, "isEqualToString:", CFSTR("errorCode"));

          if (a14 && v76)
          {
            objc_msgSend(v25, "objectAtIndexedSubscript:", 1);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = -[SUCoreSimulate _parseErrorCodeFromString:destination:](self, "_parseErrorCodeFromString:destination:", v77, a14);

            if (!v78)
            {
              +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v79, "oslog");
              v80 = objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v122 = (uint64_t)v23;
                _os_log_impl(&dword_1B05B8000, v80, OS_LOG_TYPE_DEFAULT, "[SIMULATE] failed parsing 'errorCode' (expected SUCoreErrorCode) for: '%@'", buf, 0xCu);
              }

              NSLog((NSString *)CFSTR("[SIMULATE] failed parsing 'errorCode' (expected SUCoreErrorCode) for: '%@'"), v23);
              goto LABEL_16;
            }
          }
          else
          {
            objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            v82 = objc_msgSend(v81, "isEqualToString:", CFSTR("errorUserInfo"));

            if (a15 && v82)
            {
              objc_msgSend(v25, "objectAtIndexedSubscript:", 1);
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              v84 = -[SUCoreSimulate _parseDictionaryFromString:destination:](self, "_parseDictionaryFromString:destination:", v83, a15);

              if (!v84)
              {
                +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v85, "oslog");
                v86 = objc_claimAutoreleasedReturnValue();

                if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v122 = (uint64_t)v23;
                  _os_log_impl(&dword_1B05B8000, v86, OS_LOG_TYPE_DEFAULT, "[SIMULATE] failed parsing 'errorUserInfo' (expected {k1=v1;k2=v2;}) for: '%@'",
                    buf,
                    0xCu);
                }

                NSLog((NSString *)CFSTR("[SIMULATE] failed parsing 'errorUserInfo' (expected {k1=v1;k2=v2;}) for: '%@'"),
                  v23);
                goto LABEL_16;
              }
            }
            else
            {
              objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              v88 = objc_msgSend(v87, "isEqualToString:", CFSTR("errorRecoverable"));

              if (!a16 || !v88)
              {
                +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
                v93 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v93, "oslog");
                v94 = objc_claimAutoreleasedReturnValue();

                if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v122 = (uint64_t)v23;
                  _os_log_impl(&dword_1B05B8000, v94, OS_LOG_TYPE_DEFAULT, "[SIMULATE] failed parsing option (unexpected/unsupported option key) for: '%@'", buf, 0xCu);
                }

                NSLog((NSString *)CFSTR("[SIMULATE] failed parsing option (unexpected/unsupported option key) for: '%@'"), v23);
                goto LABEL_16;
              }
              objc_msgSend(v25, "objectAtIndexedSubscript:", 1);
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              v90 = -[SUCoreSimulate _parseEventBooleanFromString:destination:](self, "_parseEventBooleanFromString:destination:", v89, a16);

              if (!v90)
              {
                +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v91, "oslog");
                v92 = objc_claimAutoreleasedReturnValue();

                if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v122 = (uint64_t)v23;
                  _os_log_impl(&dword_1B05B8000, v92, OS_LOG_TYPE_DEFAULT, "[SIMULATE] failed parsing 'errorRecoverable' (expected SUCoreSimulateEventBoolean) for: '%@'", buf, 0xCu);
                }

                NSLog((NSString *)CFSTR("[SIMULATE] failed parsing 'errorRecoverable' (expected SUCoreSimulateEventBoolean) for: '%@'"), v23);
                goto LABEL_16;
              }
            }
          }
        }
      }
LABEL_17:

      ++v22;
    }
    while (v19 != v22);
    v95 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v125, 16);
    v19 = v95;
  }
  while (v95);
  v97 = v110;
  v96 = v111;
  v98 = v111 != 0;
  v99 = v110 != 0;
  if (v111 && v110)
  {
    v100 = objc_msgSend(v111, "count");
    if (v100 == objc_msgSend(v110, "count"))
    {
      v96 = objc_retainAutorelease(v111);
      *v109 = v96;
      v97 = objc_retainAutorelease(v110);
      *a9 = v97;
      goto LABEL_90;
    }
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "oslog");
    v104 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
    {
      v105 = objc_msgSend(v111, "count");
      v106 = objc_msgSend(v110, "count");
      *(_DWORD *)buf = 134218240;
      v122 = v105;
      v123 = 2048;
      v124 = v106;
      _os_log_impl(&dword_1B05B8000, v104, OS_LOG_TYPE_DEFAULT, "[SIMULATE] syntax error: assetBuildVersions (%lu) and assetProductVersions (%lu) must have the same count", buf, 0x16u);
    }

    NSLog((NSString *)CFSTR("[SIMULATE] syntax error: assetBuildVersions (%lu) and assetProductVersions (%lu) must have the same count"), objc_msgSend(v111, "count"), objc_msgSend(v110, "count"));
LABEL_89:
    v20 = 0;
    goto LABEL_90;
  }
LABEL_81:
  if (v98 || v99)
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "oslog");
    v102 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B05B8000, v102, OS_LOG_TYPE_DEFAULT, "[SIMULATE] syntax error: assetBuildVersions and assetProductVersions must both be defined", buf, 2u);
    }

    NSLog((NSString *)CFSTR("[SIMULATE] syntax error: assetBuildVersions and assetProductVersions must both be defined"), v108);
    goto LABEL_89;
  }
LABEL_90:

  return v20 & 1;
}

- (BOOL)_parseIntFromString:(id)a3 destination:(int *)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x1E0CB37F0];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "numberFromString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    *a4 = objc_msgSend(v8, "intValue");

  return v8 != 0;
}

- (BOOL)_parseErrorCodeFromString:(id)a3 destination:(int64_t *)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x1E0CB37F0];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "numberFromString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    *a4 = (int)objc_msgSend(v8, "intValue");

  return v8 != 0;
}

- (BOOL)_parseEventBooleanFromString:(id)a3 destination:(int64_t *)a4
{
  id v5;
  int64_t v6;
  BOOL v7;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("none")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
  {
    v6 = 0;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("true")) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", CFSTR("TRUE")) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", CFSTR("t")) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", CFSTR("T")) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", CFSTR("yes")) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", CFSTR("YES")) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", CFSTR("y")) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", CFSTR("Y")) & 1) != 0)
  {
    v6 = 2;
  }
  else
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("false")) & 1) == 0
      && (objc_msgSend(v5, "isEqualToString:", CFSTR("FALSE")) & 1) == 0
      && (objc_msgSend(v5, "isEqualToString:", CFSTR("f")) & 1) == 0
      && (objc_msgSend(v5, "isEqualToString:", CFSTR("F")) & 1) == 0
      && (objc_msgSend(v5, "isEqualToString:", CFSTR("no")) & 1) == 0
      && (objc_msgSend(v5, "isEqualToString:", CFSTR("NO")) & 1) == 0
      && (objc_msgSend(v5, "isEqualToString:", CFSTR("n")) & 1) == 0
      && !objc_msgSend(v5, "isEqualToString:", CFSTR("N")))
    {
      v7 = 0;
      goto LABEL_14;
    }
    v6 = 1;
  }
  *a4 = v6;
  v7 = 1;
LABEL_14:

  return v7;
}

- (BOOL)_parseDictionaryFromString:(id)a3 destination:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  int v19;
  id v20;
  BOOL v21;
  id *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v24 = v5;
  if (a4)
  {
    objc_msgSend(v5, "propertyListFromStringsFileFormat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = a4;
    v8 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(v8, "setNumberStyle:", 1);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v26;
      v12 = (void *)MEMORY[0x1E0C9AAB0];
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v9, "valueForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "numberFromString:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16
            || (v18 = objc_msgSend(v15, "isEqualToString:", CFSTR("YES")), v17 = v12, (v18 & 1) != 0)
            || (v19 = objc_msgSend(v15, "isEqualToString:", CFSTR("NO")), v17 = (void *)MEMORY[0x1E0C9AAA0], v19))
          {
            objc_msgSend(v7, "setValue:forKey:", v17, v14);
          }

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v10);
    }

    v20 = objc_retainAutorelease(v7);
    *v23 = v20;

    v21 = 1;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (int64_t)_actionFromString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("error")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("fault")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("success")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("exit")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("spin")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("hang")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("wait")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("pause")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("replace_action")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("replace_event")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("modify_param")))
  {
    v4 = 11;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int64_t)_triggerFromString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("begin")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("end")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("fsm")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearAllEventAlterations
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[8];
  _QWORD block[5];

  if (-[SUCoreSimulate simulatorEnabled](self, "simulatorEnabled"))
  {
    -[SUCoreSimulate simulateQueue](self, "simulateQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v3);

    -[SUCoreSimulate simulateQueue](self, "simulateQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__SUCoreSimulate_clearAllEventAlterations__block_invoke;
    block[3] = &unk_1E611BF88;
    block[4] = self;
    dispatch_sync(v4, block);

  }
  else
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "oslog");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1B05B8000, v6, OS_LOG_TYPE_DEFAULT, "[SIMULATE] cannot clear events (simulator disabled)", v7, 2u);
    }

    NSLog((NSString *)CFSTR("[SIMULATE] cannot clear events (simulator disabled)"));
  }
}

uint64_t __42__SUCoreSimulate_clearAllEventAlterations__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setEventAlterations:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setAlterationsPerformed:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setLastAlteration:", 0);
}

- (void)dumpAllEventAlterations
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[8];
  _QWORD block[5];

  if (-[SUCoreSimulate simulatorEnabled](self, "simulatorEnabled"))
  {
    -[SUCoreSimulate simulateQueue](self, "simulateQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v3);

    -[SUCoreSimulate simulateQueue](self, "simulateQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__SUCoreSimulate_dumpAllEventAlterations__block_invoke;
    block[3] = &unk_1E611BF88;
    block[4] = self;
    dispatch_sync(v4, block);

  }
  else
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "oslog");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1B05B8000, v6, OS_LOG_TYPE_DEFAULT, "[SIMULATE] cannot dump events (simulator disabled)", v7, 2u);
    }

    NSLog((NSString *)CFSTR("[SIMULATE] cannot dump events (simulator disabled)"));
  }
}

uint64_t __41__SUCoreSimulate_dumpAllEventAlterations__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dumpAllEventAlterations");
}

- (void)_dumpAllEventAlterations
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  __CFString *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[SUCoreSimulate simulateQueue](self, "simulateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreSimulate eventAlterations](self, "eventAlterations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SUCoreSimulate eventAlterations](self, "eventAlterations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v27 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
      if (v27)
      {
        v7 = 0;
        v26 = *(_QWORD *)v34;
        v25 = v6;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v34 != v26)
              objc_enumerationMutation(v6);
            objc_msgSend(v6, "safeObjectForKey:ofClass:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i), objc_opt_class());
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = 0u;
            v30 = 0u;
            v31 = 0u;
            v32 = 0u;
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
            if (v10)
            {
              v11 = v10;
              v28 = i;
              v12 = *(_QWORD *)v30;
              do
              {
                for (j = 0; j != v11; ++j)
                {
                  if (*(_QWORD *)v30 != v12)
                    objc_enumerationMutation(v9);
                  v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
                  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "oslog");
                  v16 = objc_claimAutoreleasedReturnValue();

                  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v14, "summary");
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v38 = v17;
                    _os_log_impl(&dword_1B05B8000, v16, OS_LOG_TYPE_DEFAULT, "[SIMULATE] dump all events - %@", buf, 0xCu);

                  }
                  objc_msgSend(v14, "summary");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  NSLog((NSString *)CFSTR("[SIMULATE] dump all events - %@"), v18);

                }
                v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
              }
              while (v11);
              v7 = 1;
              v6 = v25;
              i = v28;
            }

          }
          v27 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
        }
        while (v27);
        if ((v7 & 1) != 0)
          goto LABEL_31;
      }
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "oslog");
      v20 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B05B8000, v20, OS_LOG_TYPE_DEFAULT, "[SIMULATE] dump all events - empty simulate events", buf, 2u);
      }
      v21 = CFSTR("[SIMULATE] dump all events - empty simulate events");
    }
    else
    {
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "oslog");
      v20 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B05B8000, v20, OS_LOG_TYPE_DEFAULT, "[SIMULATE] dump all events - no simulate events", buf, 2u);
      }
      v21 = CFSTR("[SIMULATE] dump all events - no simulate events");
    }

    NSLog((NSString *)v21);
LABEL_31:

    return;
  }
  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "oslog");
  v23 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B05B8000, v23, OS_LOG_TYPE_DEFAULT, "[SIMULATE] cannot dump events (no persisted state)", buf, 2u);
  }

  NSLog((NSString *)CFSTR("[SIMULATE] cannot dump events (no persisted state)"));
}

- (int)countOfAlterationsPerformed
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  int v7;
  uint8_t v9[16];
  _QWORD block[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (-[SUCoreSimulate simulatorEnabled](self, "simulatorEnabled"))
  {
    -[SUCoreSimulate simulateQueue](self, "simulateQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v3);

    -[SUCoreSimulate simulateQueue](self, "simulateQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__SUCoreSimulate_countOfAlterationsPerformed__block_invoke;
    block[3] = &unk_1E611BFB0;
    block[4] = self;
    block[5] = &v11;
    dispatch_sync(v4, block);

  }
  else
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "oslog");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1B05B8000, v6, OS_LOG_TYPE_DEFAULT, "[SIMULATE] cannot provide count of alterations (simulator disabled)", v9, 2u);
    }

    NSLog((NSString *)CFSTR("[SIMULATE] cannot provide count of alterations (simulator disabled)"));
  }
  v7 = *((_DWORD *)v12 + 6);
  _Block_object_dispose(&v11, 8);
  return v7;
}

uint64_t __45__SUCoreSimulate_countOfAlterationsPerformed__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "alterationsPerformed");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)lastAlterationPerformed
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint8_t v9[16];
  _QWORD block[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  if (-[SUCoreSimulate simulatorEnabled](self, "simulatorEnabled"))
  {
    -[SUCoreSimulate simulateQueue](self, "simulateQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v3);

    -[SUCoreSimulate simulateQueue](self, "simulateQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__SUCoreSimulate_lastAlterationPerformed__block_invoke;
    block[3] = &unk_1E611BFB0;
    block[4] = self;
    block[5] = &v11;
    dispatch_sync(v4, block);

  }
  else
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "oslog");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1B05B8000, v6, OS_LOG_TYPE_DEFAULT, "[SIMULATE] cannot provide last alterations (simulator disabled)", v9, 2u);
    }

    NSLog((NSString *)CFSTR("[SIMULATE] cannot provide last alterations (simulator disabled)"));
  }
  v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __41__SUCoreSimulate_lastAlterationPerformed__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "lastAlteration");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)begin:(id)a3 atFunction:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  SUCoreSimulate *v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v7 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  if (-[SUCoreSimulate simulatorEnabled](self, "simulatorEnabled"))
  {
    -[SUCoreSimulate simulateQueue](self, "simulateQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v8);

    -[SUCoreSimulate simulateQueue](self, "simulateQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __35__SUCoreSimulate_begin_atFunction___block_invoke;
    v17 = &unk_1E611BFD8;
    v21 = &v22;
    v18 = self;
    v19 = v6;
    v20 = v7;
    dispatch_sync(v9, &v14);

    -[SUCoreSimulate _performOffQueueEvent:](self, "_performOffQueueEvent:", v23[5], v14, v15, v16, v17, v18);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v23[5];
    v23[5] = v10;

  }
  v12 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v12;
}

void __35__SUCoreSimulate_begin_atFunction___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "_locateEventForModule:forIdentity:withTrigger:forEvent:inState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1, 0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)
    && (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("*")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_locateEventForModule:forIdentity:withTrigger:forEvent:inState:", CFSTR("*"), *(_QWORD *)(a1 + 48), 1, 0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

- (id)end:(id)a3 atFunction:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  SUCoreSimulate *v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v7 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  if (-[SUCoreSimulate simulatorEnabled](self, "simulatorEnabled"))
  {
    -[SUCoreSimulate simulateQueue](self, "simulateQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v8);

    -[SUCoreSimulate simulateQueue](self, "simulateQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __33__SUCoreSimulate_end_atFunction___block_invoke;
    v17 = &unk_1E611BFD8;
    v21 = &v22;
    v18 = self;
    v19 = v6;
    v20 = v7;
    dispatch_sync(v9, &v14);

    -[SUCoreSimulate _performOffQueueEvent:](self, "_performOffQueueEvent:", v23[5], v14, v15, v16, v17, v18);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v23[5];
    v23[5] = v10;

  }
  v12 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v12;
}

void __33__SUCoreSimulate_end_atFunction___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "_locateEventForModule:forIdentity:withTrigger:forEvent:inState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 2, 0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)
    && (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("*")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_locateEventForModule:forIdentity:withTrigger:forEvent:inState:", CFSTR("*"), *(_QWORD *)(a1 + 48), 2, 0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

- (id)fsm:(id)a3 forEvent:(id)a4 inState:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  if (-[SUCoreSimulate simulatorEnabled](self, "simulatorEnabled"))
  {
    -[SUCoreSimulate simulateQueue](self, "simulateQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v11);

    -[SUCoreSimulate simulateQueue](self, "simulateQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__SUCoreSimulate_fsm_forEvent_inState___block_invoke;
    block[3] = &unk_1E611C000;
    v21 = &v22;
    block[4] = self;
    v18 = v8;
    v19 = v9;
    v20 = v10;
    dispatch_sync(v12, block);

    -[SUCoreSimulate _performOffQueueEvent:](self, "_performOffQueueEvent:", v23[5]);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v23[5];
    v23[5] = v13;

  }
  v15 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v15;
}

void __39__SUCoreSimulate_fsm_forEvent_inState___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_locateEventForModule:forIdentity:withTrigger:forEvent:inState:", CFSTR("fsm"), *(_QWORD *)(a1 + 40), 3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)generateError:(id)a3 ofDomain:(id)a4 withCode:(int64_t)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v7 = (objc_class *)MEMORY[0x1E0C99E08];
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(v7);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("[SIMULATED_ERROR] created by %@ (for domain=%@, code=%ld)"), v9, v8, a5);

  objc_msgSend(v10, "setSafeObject:forKey:", v11, *MEMORY[0x1E0CB2D50]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v8, a5, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_locateEventForModule:(id)a3 forIdentity:(id)a4 withTrigger:(int64_t)a5 forEvent:(id)a6 inState:(id)a7
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  SUCoreSimulate *v22;
  int64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v36;
  SUCoreSimulate *v37;
  id v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v39 = a7;
  -[SUCoreSimulate simulateQueue](self, "simulateQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  -[SUCoreSimulate eventAlterations](self, "eventAlterations");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    goto LABEL_30;
  v37 = self;
  -[SUCoreSimulate eventAlterations](self, "eventAlterations");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "safeObjectForKey:ofClass:", v11, objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v18 = v17;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (!v19)
  {

LABEL_30:
    v33 = 0;
    goto LABEL_31;
  }
  v20 = v19;
  v36 = v11;
  v40 = 0;
  v41 = v18;
  v21 = *(_QWORD *)v43;
  v22 = v37;
  v23 = a5;
  do
  {
    v24 = 0;
    do
    {
      if (*(_QWORD *)v43 != v21)
        objc_enumerationMutation(v18);
      v25 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v24);
      objc_msgSend(v25, "identityName", v36);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "isEqualToString:", v12);
      if (!v13)
      {
        if (!v27)
          goto LABEL_19;
        v31 = objc_msgSend(v25, "simTrigger");

        if (v31 == v23)
        {
          objc_msgSend(v25, "setCount:", objc_msgSend(v25, "count") + 1);
          v18 = v41;
          if (!-[SUCoreSimulate _isValidEvent:](v22, "_isValidEvent:", v25))
            goto LABEL_20;
          v26 = v40;
          v40 = v25;
          goto LABEL_19;
        }
        goto LABEL_23;
      }
      if (!v27 || objc_msgSend(v25, "simTrigger") != v23)
        goto LABEL_19;
      objc_msgSend(v25, "fsmEvent");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v28, "isEqualToString:", v13) & 1) == 0)
      {

        v18 = v41;
        goto LABEL_19;
      }
      objc_msgSend(v25, "fsmState");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "isEqualToString:", v39);

      if (!v30)
      {
        v22 = v37;
        v23 = a5;
LABEL_23:
        v18 = v41;
        goto LABEL_20;
      }
      objc_msgSend(v25, "setCount:", objc_msgSend(v25, "count") + 1);
      v22 = v37;
      v18 = v41;
      if (-[SUCoreSimulate _isValidEvent:](v37, "_isValidEvent:", v25))
      {
        v26 = v40;
        v40 = v25;
        v23 = a5;
LABEL_19:

        goto LABEL_20;
      }
      v23 = a5;
LABEL_20:
      ++v24;
    }
    while (v20 != v24);
    v32 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    v20 = v32;
  }
  while (v32);

  v33 = v40;
  if (v40)
  {
    v11 = v36;
    if (-[SUCoreSimulate _isImmediateEvent:](v22, "_isImmediateEvent:", v40))
    {
      -[SUCoreSimulate _performSimulatedEventAlteration:](v22, "_performSimulatedEventAlteration:", v40);
      v34 = objc_claimAutoreleasedReturnValue();

      v33 = (void *)v34;
    }
    else
    {
      -[SUCoreSimulate _triggerOffQueueAlteration:](v22, "_triggerOffQueueAlteration:", v40);
    }
  }
  else
  {
    v11 = v36;
  }
LABEL_31:

  return v33;
}

- (BOOL)_isValidEvent:(id)a3
{
  id v3;
  void *v4;
  int v5;
  _BOOL4 v6;
  int v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "startAt") == -1)
    {
      v6 = 1;
    }
    else
    {
      v5 = objc_msgSend(v4, "count");
      v6 = v5 >= (int)objc_msgSend(v4, "startAt");
    }
    if (objc_msgSend(v4, "endAt") != -1)
    {
      v7 = objc_msgSend(v4, "count");
      if (v7 > (int)objc_msgSend(v4, "endAt"))
        v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "oslog");
  v9 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "summary");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v6)
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    *(_DWORD *)buf = 138412546;
    v18 = v10;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_1B05B8000, v9, OS_LOG_TYPE_DEFAULT, "[SIMULATE] located event: %@ | valid=%@", buf, 0x16u);

  }
  objc_msgSend(v4, "summary");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v6)
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  NSLog((NSString *)CFSTR("[SIMULATE] located event: %@ | valid=%@"), v13, v15);

  return v6;
}

- (BOOL)_isImmediateEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  unint64_t v7;
  unsigned int v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[SUCoreSimulate simulateQueue](self, "simulateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if ((int)objc_msgSend(v4, "duration") > 0)
    goto LABEL_6;
  objc_msgSend(v4, "untilStop");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_6;
  v7 = objc_msgSend(v4, "simAction");
  if (v7 >= 0xC)
  {
    +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v4, "summary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("unknown simulate action: %@"), v11);
    objc_msgSend(v9, "trackError:forReason:withResult:withError:", CFSTR("[SIMULATE] PERFORM"), v12, 8113, 0);

LABEL_6:
    LOBYTE(v8) = 0;
    goto LABEL_7;
  }
  v8 = (0xE1Fu >> v7) & 1;
LABEL_7:

  return v8;
}

- (id)_performSimulatedEventAlteration:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreSimulate simulateQueue](self, "simulateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  switch(objc_msgSend(v4, "simAction"))
  {
    case 0:
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "oslog");
      v6 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "summary");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v23 = v17;
        _os_log_impl(&dword_1B05B8000, v6, OS_LOG_TYPE_DEFAULT, "[SIMULATE] PERFORM - no simulated action: %@", buf, 0xCu);

      }
      goto LABEL_13;
    case 1:
    case 3:
    case 9:
    case 10:
      -[SUCoreSimulate _performingAlteration:](self, "_performingAlteration:", v4);
      v13 = v4;
      goto LABEL_15;
    case 2:
      -[SUCoreSimulate _performingAlteration:](self, "_performingAlteration:", v4);
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "oslog");
      v19 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        -[SUCoreSimulate _performSimulatedEventAlteration:].cold.1(self, v4, v19);

      goto LABEL_14;
    case 4:
      -[SUCoreSimulate _performingAlteration:](self, "_performingAlteration:", v4);
      exit(9900);
    case 5:
    case 6:
    case 7:
    case 8:
      +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v4, "summary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("should be off-queue when performing simulate action: %@"), v8);
      v10 = v6;
      v11 = v9;
      v12 = 8117;
      goto LABEL_12;
    case 11:
      +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
      v6 = objc_claimAutoreleasedReturnValue();
      v20 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v4, "summary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v20, "initWithFormat:", CFSTR("modify param not yet supported: %@"), v8);
      goto LABEL_11;
    default:
      +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
      v6 = objc_claimAutoreleasedReturnValue();
      v14 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v4, "summary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "initWithFormat:", CFSTR("unknown simulate action: %@"), v8);
LABEL_11:
      v9 = (void *)v15;
      v10 = v6;
      v11 = v9;
      v12 = 8113;
LABEL_12:
      -[NSObject trackError:forReason:withResult:withError:](v10, "trackError:forReason:withResult:withError:", CFSTR("[SIMULATE] PERFORM"), v11, v12, 0);

LABEL_13:
LABEL_14:
      v13 = 0;
LABEL_15:

      return v13;
  }
}

- (id)_performOffQueueEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  unsigned int v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  const __CFString *v38;
  void *v39;
  id v40;
  NSObject *v41;
  id v42;
  void *v43;
  uint64_t v44;
  id v45;
  void *v46;
  uint64_t v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  uint8_t buf[4];
  _BYTE v54[18];
  _QWORD v55[4];
  _QWORD v56[5];

  v56[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreSimulate simulateQueue](self, "simulateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  if (!v4)
    goto LABEL_37;
  objc_msgSend(v4, "untilStop");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *MEMORY[0x1E0CB2AE0];
    v8 = *MEMORY[0x1E0CB2AA8];
    v55[0] = *MEMORY[0x1E0CB2AD8];
    v55[1] = v8;
    v56[0] = v7;
    v56[1] = &unk_1E612B8D8;
    v9 = *MEMORY[0x1E0CB2A58];
    v55[2] = *MEMORY[0x1E0CB2A98];
    v55[3] = v9;
    v56[2] = CFSTR("root");
    v56[3] = CFSTR("wheel");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "untilStop");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "summary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dataUsingEncoding:", 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v11, "createFileAtPath:contents:attributes:", v12, v14, v10);

    if (v15)
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      dispatch_get_current_queue();
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithUTF8String:", dispatch_queue_get_label(v17));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "oslog");
      v20 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "untilStop");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v54 = v21;
        *(_WORD *)&v54[8] = 2112;
        *(_QWORD *)&v54[10] = v18;
        _os_log_impl(&dword_1B05B8000, v20, OS_LOG_TYPE_DEFAULT, "[SIMULATE] PERFORM(OFF_QUEUE) - pausing until stop file(%@) has been deleted (running on queue %@)...", buf, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "untilStop");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "fileExistsAtPath:", v23);

      if (v24)
      {
        do
        {
          sleep(1u);
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "untilStop");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v25, "fileExistsAtPath:", v26);

        }
        while ((v27 & 1) != 0);
      }
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "oslog");
      v29 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "untilStop");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v54 = v30;
        _os_log_impl(&dword_1B05B8000, v29, OS_LOG_TYPE_DEFAULT, "[SIMULATE] PERFORM(OFF_QUEUE) - ...pausing [stop file(%@) has been deleted]", buf, 0xCu);

      }
    }
    else
    {
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "oslog");
      v32 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "untilStop");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v54 = v33;
        _os_log_impl(&dword_1B05B8000, v32, OS_LOG_TYPE_DEFAULT, "[SIMULATE] PERFORM(OFF_QUEUE) - unable to create stop file(%@)", buf, 0xCu);

      }
      objc_msgSend(v4, "untilStop");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog((NSString *)CFSTR("[SIMULATE] PERFORM(OFF_QUEUE) - unable to create stop file(%@)"), v18);
    }

  }
  if ((int)objc_msgSend(v4, "duration") > 0)
    goto LABEL_16;
  objc_msgSend(v4, "untilStop");
  v35 = objc_claimAutoreleasedReturnValue();
  if (v35)
  {
LABEL_28:

    goto LABEL_29;
  }
  if (objc_msgSend(v4, "simAction") == 8)
  {
LABEL_16:
    if ((int)objc_msgSend(v4, "duration") < 1)
      v34 = 5;
    else
      v34 = objc_msgSend(v4, "duration");
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "oslog");
    v37 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = CFSTR("s");
      if (v34 == 1)
        v38 = &stru_1E611E1C8;
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v54 = v34;
      *(_WORD *)&v54[4] = 2112;
      *(_QWORD *)&v54[6] = v38;
      _os_log_impl(&dword_1B05B8000, v37, OS_LOG_TYPE_DEFAULT, "[SIMULATE] PERFORM(OFF_QUEUE) - sleeping for %d second%@...", buf, 0x12u);
    }

    sleep(v34);
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "oslog");
    v35 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B05B8000, v35, OS_LOG_TYPE_DEFAULT, "[SIMULATE] PERFORM(OFF_QUEUE) - ...sleeping", buf, 2u);
    }
    goto LABEL_28;
  }
LABEL_29:
  v40 = 0;
  switch(objc_msgSend(v4, "simAction"))
  {
    case 0:
    case 2:
    case 4:
    case 11:
      +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v4, "summary");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v42, "initWithFormat:", CFSTR("action should never be indicated when handling off-queue: %@"), v43);
      goto LABEL_35;
    case 1:
    case 3:
    case 9:
    case 10:
      v40 = v4;
      goto LABEL_38;
    case 5:
      while (objc_msgSend(v4, "simAction") == 5)
        ;
      break;
    case 6:
      v41 = dispatch_semaphore_create(0);
      dispatch_semaphore_wait(v41, 0xFFFFFFFFFFFFFFFFLL);
      goto LABEL_36;
    case 7:
      -[SUCoreSimulate registeredCallback](self, "registeredCallback");
      v48 = objc_claimAutoreleasedReturnValue();
      v41 = v48;
      if (v48)
      {
        (*(void (**)(uint64_t, id))(v48 + 16))(v48, v4);
      }
      else
      {
        +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v4, "summary");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = (void *)objc_msgSend(v50, "initWithFormat:", CFSTR("no registered callback when handling off-queue: %@"), v51);
        objc_msgSend(v49, "trackError:forReason:withResult:withError:", CFSTR("[SIMULATE] PERFORM(OFF_QUEUE)"), v52, 8101, 0);

      }
      goto LABEL_36;
    case 8:
      goto LABEL_38;
    default:
      +[SUCoreDiag sharedDiag](SUCoreDiag, "sharedDiag");
      v41 = objc_claimAutoreleasedReturnValue();
      v45 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v4, "summary");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v45, "initWithFormat:", CFSTR("unknown simulate action: %@"), v43);
LABEL_35:
      v46 = (void *)v44;
      -[NSObject trackError:forReason:withResult:withError:](v41, "trackError:forReason:withResult:withError:", CFSTR("[SIMULATE] PERFORM(OFF_QUEUE)"), v44, 8113, 0);

LABEL_36:
      break;
  }
LABEL_37:
  v40 = 0;
LABEL_38:

  return v40;
}

- (void)_performingAlteration:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  _DWORD v10[2];
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreSimulate simulateQueue](self, "simulateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreSimulate setAlterationsPerformed:](self, "setAlterationsPerformed:", -[SUCoreSimulate alterationsPerformed](self, "alterationsPerformed") + 1);
  -[SUCoreSimulate setLastAlteration:](self, "setLastAlteration:", v4);
  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "oslog");
  v7 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = -[SUCoreSimulate alterationsPerformed](self, "alterationsPerformed");
    objc_msgSend(v4, "summary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = 67109378;
    v10[1] = v8;
    v11 = 2112;
    v12 = v9;
    _os_log_impl(&dword_1B05B8000, v7, OS_LOG_TYPE_DEFAULT, "[SIMULATE] PERFORM #%d - %@", (uint8_t *)v10, 0x12u);

  }
}

- (void)_triggerOffQueueAlteration:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  _DWORD v10[2];
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreSimulate simulateQueue](self, "simulateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreSimulate setAlterationsPerformed:](self, "setAlterationsPerformed:", -[SUCoreSimulate alterationsPerformed](self, "alterationsPerformed") + 1);
  -[SUCoreSimulate setLastAlteration:](self, "setLastAlteration:", v4);
  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "oslog");
  v7 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = -[SUCoreSimulate alterationsPerformed](self, "alterationsPerformed");
    objc_msgSend(v4, "summary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = 67109378;
    v10[1] = v8;
    v11 = 2112;
    v12 = v9;
    _os_log_impl(&dword_1B05B8000, v7, OS_LOG_TYPE_DEFAULT, "[SIMULATE] TRIGGER #%d - %@", (uint8_t *)v10, 0x12u);

  }
}

- (int)alterationsPerformed
{
  return self->_alterationsPerformed;
}

- (void)setAlterationsPerformed:(int)a3
{
  self->_alterationsPerformed = a3;
}

- (SUCoreSimulateEvent)lastAlteration
{
  return self->_lastAlteration;
}

- (void)setLastAlteration:(id)a3
{
  objc_storeStrong((id *)&self->_lastAlteration, a3);
}

- (OS_dispatch_queue)simulateQueue
{
  return self->_simulateQueue;
}

- (BOOL)simulatorEnabled
{
  return self->_simulatorEnabled;
}

- (NSDictionary)eventAlterations
{
  return self->_eventAlterations;
}

- (void)setEventAlterations:(id)a3
{
  objc_storeStrong((id *)&self->_eventAlterations, a3);
}

- (id)registeredCallback
{
  return self->_registeredCallback;
}

- (void)setRegisteredCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_registeredCallback, 0);
  objc_storeStrong((id *)&self->_eventAlterations, 0);
  objc_storeStrong((id *)&self->_simulateQueue, 0);
  objc_storeStrong((id *)&self->_lastAlteration, 0);
}

- (void)_performSimulatedEventAlteration:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  int v5;
  void *v6;
  _DWORD v7[2];
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a1, "alterationsPerformed");
  objc_msgSend(a2, "summary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 67109378;
  v7[1] = v5;
  v8 = 2112;
  v9 = v6;
  _os_log_fault_impl(&dword_1B05B8000, a3, OS_LOG_TYPE_FAULT, "[SIMULATE] PERFORM #%d - causing fault: %@", (uint8_t *)v7, 0x12u);

}

@end
