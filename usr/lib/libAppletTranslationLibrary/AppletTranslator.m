@implementation AppletTranslator

+ (void)initLibrary:(id)a3
{
  +[AppletConfigurationData init](AppletConfigurationData, "init", a3);
  if (initLibrary__onceToken != -1)
    dispatch_once(&initLibrary__onceToken, &__block_literal_global_7);
}

uint64_t __32__AppletTranslator_initLibrary___block_invoke()
{
  return os_state_add_handler();
}

_DWORD *__32__AppletTranslator_initLibrary___block_invoke_2()
{
  return +[AppletTranslator dumpState]();
}

+ (_DWORD)dumpState
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  _DWORD *v4;
  id v5;

  objc_opt_self();
  +[AppletTranslator userDefaults]();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0CB38B0];
  objc_msgSend(v0, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dataWithPropertyList:format:options:error:", v2, 200, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = malloc_type_calloc(1uLL, objc_msgSend(v3, "length") + 200, 0xC51DC296uLL);
  *v4 = 1;
  v4[1] = objc_msgSend(v3, "length");
  __strlcpy_chk();
  v5 = objc_retainAutorelease(v3);
  memcpy(v4 + 50, (const void *)objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));

  return v4;
}

+ (void)initLibraryWithDelegate:(id)a3
{
  id v4;

  v4 = a3;
  objc_storeStrong((id *)&delegate, a3);
  +[AppletConfigurationData init](AppletConfigurationData, "init");
  if (initLibraryWithDelegate__onceToken != -1)
    dispatch_once(&initLibraryWithDelegate__onceToken, &__block_literal_global_443);

}

uint64_t __44__AppletTranslator_initLibraryWithDelegate___block_invoke()
{
  return os_state_add_handler();
}

_DWORD *__44__AppletTranslator_initLibraryWithDelegate___block_invoke_2()
{
  return +[AppletTranslator dumpState]();
}

+ (void)setLibraryHardwareCapabilities:(id)a3
{
  objc_storeStrong(&hardwareCapabilities, a3);
}

+ (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  int v44;
  NSObject *v45;
  void *v46;
  uint64_t v48;
  _QWORD v49[2];
  _QWORD v50[2];
  uint64_t v51;
  uint64_t v52;
  uint8_t buf[4];
  id v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (parseHCIEvent_withApplet_withPackage_withModule_withTransceiver_withError__onceToken != -1)
    dispatch_once(&parseHCIEvent_withApplet_withPackage_withModule_withTransceiver_withError__onceToken, &__block_literal_global_445);
  if (parseHCIEvent_withApplet_withPackage_withModule_withTransceiver_withError__debugHCIPrint)
  {
    v18 = objc_retainAutorelease(v13);
    v19 = objc_msgSend(v18, "bytes");
    v20 = objc_msgSend(v18, "length");
    LogBinary(OS_LOG_TYPE_DEFAULT, (uint64_t)"+[AppletTranslator parseHCIEvent:withApplet:withPackage:withModule:withTransceiver:withError:]", 85, v19, v20, CFSTR("AID: %@ HCI:"), v21, v22, (uint64_t)v14);
  }
  +[ATLGetDecoder getDecoderForApplet:withPackage:withModule:]((uint64_t)ATLGetDecoder, (uint64_t)v14, (uint64_t)v15, v16);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    if (v17)
    {
      +[TransceiverWrapper withTransceiver:](TransceiverWrapper, "withTransceiver:", v17);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = 0;
    }
    objc_msgSend(v23, "parseHCIEvent:withApplet:withPackage:withModule:withTransceiver:withError:", v13, v14, v15, v16, v24, a8);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a8)
      goto LABEL_21;
  }
  else
  {
    ATLLogObject();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v54 = v14;
      v55 = 2112;
      v56 = v15;
      v57 = 2112;
      v58 = v16;
      _os_log_impl(&dword_1C3511000, v25, OS_LOG_TYPE_ERROR, "No suitable decoder for AID %@ PID %@ MID %@", buf, 0x20u);
    }

    v48 = (uint64_t)v14;
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("No suitable decoder for AID %@ PID %@ MID %@"));
    v27 = (void *)v26;
    if (a8)
    {
      v28 = *a8;
      v29 = (void *)MEMORY[0x1E0CB35C8];
      if (*a8)
      {
        v30 = *MEMORY[0x1E0CB3388];
        v49[0] = *MEMORY[0x1E0CB2D50];
        v49[1] = v30;
        v50[0] = v26;
        v50[1] = v28;
        v31 = (void *)MEMORY[0x1E0C99D80];
        v32 = v50;
        v33 = v49;
        v34 = 2;
      }
      else
      {
        v51 = *MEMORY[0x1E0CB2D50];
        v52 = v26;
        v31 = (void *)MEMORY[0x1E0C99D80];
        v32 = &v52;
        v33 = &v51;
        v34 = 1;
      }
      objc_msgSend(v31, "dictionaryWithObjects:forKeys:count:", v32, v33, v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 2, v36);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

    }
    v35 = 0;
    if (!a8)
      goto LABEL_21;
  }
  if (*a8)
  {
    v37 = objc_retainAutorelease(v13);
    v38 = objc_msgSend(v37, "bytes");
    v39 = objc_msgSend(v37, "length");
    LogBinary(OS_LOG_TYPE_ERROR, (uint64_t)"+[AppletTranslator parseHCIEvent:withApplet:withPackage:withModule:withTransceiver:withError:]", 108, v38, v39, CFSTR("Failed to parse HCI event:"), v40, v41, v48);
    goto LABEL_30;
  }
LABEL_21:
  if (v35)
  {
    objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("EventType"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v42, "isEqualToString:", CFSTR("StartEvent")))
    {

    }
    else
    {
      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("EventType"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "isEqualToString:", CFSTR("EndEvent"));

      if (!v44)
      {
        ATLLogObject();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("EventType"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v54 = v46;
          _os_log_impl(&dword_1C3511000, v45, OS_LOG_TYPE_DEFAULT, "ATL generated event = %{public}@", buf, 0xCu);

        }
        goto LABEL_29;
      }
    }
    ATLLogObject();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v54 = v35;
      _os_log_impl(&dword_1C3511000, v45, OS_LOG_TYPE_DEFAULT, "ATL generated event = %{public}@", buf, 0xCu);
    }
LABEL_29:

  }
LABEL_30:

  return v35;
}

void __94__AppletTranslator_parseHCIEvent_withApplet_withPackage_withModule_withTransceiver_withError___block_invoke()
{
  id v0;

  if ((+[AppletTranslator isInternalBuild]() & 1) != 0)
  {
    +[AppletTranslator userDefaults]();
    v0 = (id)objc_claimAutoreleasedReturnValue();
    parseHCIEvent_withApplet_withPackage_withModule_withTransceiver_withError__debugHCIPrint = objc_msgSend(v0, "BOOLForKey:", CFSTR("debug.hcievent.logging"));

  }
  else
  {
    parseHCIEvent_withApplet_withPackage_withModule_withTransceiver_withError__debugHCIPrint = 0;
  }
}

+ (uint64_t)isInternalBuild
{
  objc_opt_self();
  if (isInternalBuild_onceToken != -1)
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_552);
  return isInternalBuild_isInternal;
}

+ (id)userDefaults
{
  objc_opt_self();
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.stockholm.atl"));
}

+ (id)getAppletStateAndHistory:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v40;
  id v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  _BYTE v48[128];
  _QWORD v49[2];
  _QWORD v50[2];
  uint64_t v51;
  uint64_t v52;
  uint8_t buf[4];
  id v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  +[ATLGetDecoder getDecoderForApplet:withPackage:withModule:]((uint64_t)ATLGetDecoder, (uint64_t)v11, (uint64_t)v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    +[TransceiverWrapper withTransceiver:](TransceiverWrapper, "withTransceiver:", v14);
    v47 = 0;
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "getAppletStateAndHistory:withApplet:withPackage:withModule:withError:");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    if (v17 || !v16)
    {
      ATLLogObject();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v54 = v11;
        v55 = 2112;
        v56 = v12;
        v57 = 2112;
        v58 = v13;
        _os_log_impl(&dword_1C3511000, v36, OS_LOG_TYPE_ERROR, "Failed to query AID %@ PID %@ MID %@", buf, 0x20u);
      }

      v28 = v42;
      objc_msgSend(v42, "dumpAPDUs:", &__block_literal_global_462);
      v37 = 0;
      if (a7)
        *a7 = objc_retainAutorelease(v17);
    }
    else
    {
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ATLInternal"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v19 = (void *)objc_msgSend(v16, "mutableCopy");
        objc_msgSend(v19, "removeObjectForKey:", CFSTR("ATLInternal"));

        v16 = v19;
      }
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("State"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("TransactionInProgress"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v22 = v21;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      if (v23)
      {
        v40 = v15;
        v41 = v14;
        v24 = *(_QWORD *)v44;
        while (2)
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v44 != v24)
              objc_enumerationMutation(v22);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "hasPrefix:", CFSTR("TransitMetro")) & 1) != 0)
            {
              v23 = 1;
              goto LABEL_25;
            }
          }
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
          if (v23)
            continue;
          break;
        }
LABEL_25:
        v15 = v40;
        v14 = v41;
      }

      +[MetroStateMonitor shared](_TtC24AppletTranslationLibrary17MetroStateMonitor, "shared");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "consumeStateWithAid:newState:", v11, v23);

      v16 = v16;
      v37 = v16;
      v28 = v42;
    }

    goto LABEL_31;
  }
  ATLLogObject();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v54 = v11;
    v55 = 2112;
    v56 = v12;
    v57 = 2112;
    v58 = v13;
    _os_log_impl(&dword_1C3511000, v26, OS_LOG_TYPE_ERROR, "No suitable decoder for AID %@ PID %@ MID %@", buf, 0x20u);
  }

  v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("No suitable decoder for AID %@ PID %@ MID %@"), v11, v12, v13);
  v28 = (void *)v27;
  if (a7)
  {
    v29 = *a7;
    v30 = (void *)MEMORY[0x1E0CB35C8];
    if (*a7)
    {
      v31 = *MEMORY[0x1E0CB3388];
      v49[0] = *MEMORY[0x1E0CB2D50];
      v49[1] = v31;
      v50[0] = v27;
      v50[1] = v29;
      v32 = (void *)MEMORY[0x1E0C99D80];
      v33 = v50;
      v34 = v49;
      v35 = 2;
    }
    else
    {
      v51 = *MEMORY[0x1E0CB2D50];
      v52 = v27;
      v32 = (void *)MEMORY[0x1E0C99D80];
      v33 = &v52;
      v34 = &v51;
      v35 = 1;
    }
    objc_msgSend(v32, "dictionaryWithObjects:forKeys:count:", v33, v34, v35);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 2, v17);
    v37 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:

    goto LABEL_32;
  }
  v37 = 0;
LABEL_32:

  return v37;
}

void __94__AppletTranslator_getAppletStateAndHistory_withPackage_withModule_withTransceiver_withError___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  LogBinary(OS_LOG_TYPE_ERROR, (uint64_t)"+[AppletTranslator getAppletStateAndHistory:withPackage:withModule:withTransceiver:withError:]_block_invoke", 146, a3, a4, CFSTR("%c"), a7, a8, a2);
}

+ (BOOL)appletCacheUpdated:(id)a3 serialNumber:(id)a4 isdSequenceCounter:(id)a5 transceiver:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  char *v28;
  void *v29;
  char *v30;
  void *v31;
  void *v32;
  char *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  BOOL v41;
  NSObject *v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void **v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const __CFString *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  char v60;
  NSObject *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  const __CFString *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  NSObject *v73;
  NSObject *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  NSObject *v78;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  id v91;
  uint64_t v92;
  void *v93;
  void *v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _BYTE v107[128];
  _QWORD v108[2];
  _QWORD v109[2];
  uint64_t v110;
  void *v111;
  uint8_t buf[4];
  NSObject *v113;
  __int16 v114;
  uint64_t v115;
  _BYTE v116[128];
  _BYTE v117[128];
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v85 = a4;
  v84 = a5;
  v91 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v103, v117, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v104;
    v15 = 0x1E0C99000uLL;
    v16 = &unk_1E7D9D188;
    v92 = *(_QWORD *)v104;
    v82 = v11;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v104 != v14)
          objc_enumerationMutation(v11);
        v18 = *(NSObject **)(*((_QWORD *)&v103 + 1) + 8 * v17);
        v19 = v16;
        objc_msgSend(*(id *)(v15 + 3592), "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v99 = 0u;
        v100 = 0u;
        v101 = 0u;
        v102 = 0u;
        v20 = objc_msgSend(&unk_1E7D9D1A0, "countByEnumeratingWithState:objects:count:", &v99, v116, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v100;
          while (2)
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v100 != v22)
                objc_enumerationMutation(&unk_1E7D9D1A0);
              v24 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * i);
              -[NSObject objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v25)
              {
                ATLLogObject();
                v42 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v113 = v18;
                  v114 = 2112;
                  v115 = v24;
                  _os_log_impl(&dword_1C3511000, v42, OS_LOG_TYPE_ERROR, "Applet %@ missing prop %@", buf, 0x16u);
                }

                v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Applet %@ missing prop %@"), v18, v24);
                v29 = v84;
                if (a7)
                {
                  v44 = *a7;
                  v45 = (void *)MEMORY[0x1E0CB35C8];
                  v37 = v85;
                  v35 = v82;
                  if (*a7)
                  {
                    v46 = *MEMORY[0x1E0CB3388];
                    v108[0] = *MEMORY[0x1E0CB2D50];
                    v108[1] = v46;
                    v47 = v43;
                    v109[0] = v43;
                    v109[1] = v44;
                    v48 = (void *)MEMORY[0x1E0C99D80];
                    v49 = (void **)v109;
                    v50 = v108;
                    v51 = 2;
                  }
                  else
                  {
                    v110 = *MEMORY[0x1E0CB2D50];
                    v111 = v43;
                    v47 = v43;
                    v48 = (void *)MEMORY[0x1E0C99D80];
                    v49 = &v111;
                    v50 = &v110;
                    v51 = 1;
                  }
                  objc_msgSend(v48, "dictionaryWithObjects:forKeys:count:", v49, v50, v51);
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 6, v77);
                  *a7 = (id)objc_claimAutoreleasedReturnValue();

                  v41 = 0;
                  v27 = v82;
                  v43 = v47;
                }
                else
                {
                  v41 = 0;
                  v35 = v82;
                  v27 = v82;
                  v37 = v85;
                }
                goto LABEL_62;
              }
              -[NSObject objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", v24);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v94, "setObject:forKeyedSubscript:", v26, v24);

            }
            v21 = objc_msgSend(&unk_1E7D9D1A0, "countByEnumeratingWithState:objects:count:", &v99, v116, 16);
            if (v21)
              continue;
            break;
          }
        }
        objc_msgSend(v88, "addObject:", v94);

        ++v17;
        v11 = v82;
        v14 = v92;
        v15 = 0x1E0C99000;
        v16 = v19;
      }
      while (v17 != v13);
      v13 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v103, v117, 16);
    }
    while (v13);
  }

  v27 = v88;
  +[HashHelper hashHelper]();
  v28 = (char *)objc_claimAutoreleasedReturnValue();
  v29 = v84;
  -[HashHelper addData:](v28, v84);
  v30 = (char *)objc_claimAutoreleasedReturnValue();
  +[AppletConfigurationData dataHash](AppletConfigurationData, "dataHash");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HashHelper addData:](v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HashHelper addArray:](v32, v27);
  v33 = (char *)objc_claimAutoreleasedReturnValue();
  -[HashHelper getHash](v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = v34;
  +[AppletTranslator userDefaults]();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v85;
  objc_msgSend(v85, "asHexString");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = v36;
  objc_msgSend(v36, "objectForKey:", v38);
  v39 = objc_claimAutoreleasedReturnValue();

  v80 = (id)v39;
  if (objc_msgSend(v34, "isEqual:", v39))
  {
    ATLLogObject();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3511000, v40, OS_LOG_TYPE_DEFAULT, "No changes to either configuration or SE, bailing out", buf, 2u);
    }

    v41 = 1;
  }
  else
  {
    v83 = v34;
    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    v27 = v27;
    v52 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
    if (v52)
    {
      v53 = v52;
      v54 = CFSTR("lifecycleState");
      v55 = &unk_1E7D9B220;
      v56 = *(_QWORD *)v96;
      v81 = v27;
      v87 = *(_QWORD *)v96;
      while (2)
      {
        v57 = 0;
        v86 = v53;
        do
        {
          if (*(_QWORD *)v96 != v56)
            objc_enumerationMutation(v27);
          v58 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v57);
          objc_msgSend(v58, "objectForKeyedSubscript:", v54);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = objc_msgSend(v59, "isEqual:", v55);

          if ((v60 & 1) != 0)
          {
            objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("identifier"));
            v61 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("moduleIdentifier"));
            v62 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("packageIdentifier"));
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            +[TransceiverWrapper withTransceiver:](TransceiverWrapper, "withTransceiver:", v91);
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            +[ATLGetDecoder getDecoderForApplet:withPackage:withModule:]((uint64_t)ATLGetDecoder, (uint64_t)v61, (uint64_t)v63, v62);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = v64;
            if (v64
              && objc_msgSend(v64, "conformsToProtocol:", &unk_1EF8DF9C8)
              && (objc_msgSend(v65, "supportsPlasticCardMode:withApplet:withPackage:withModule:", v93, v61, v63, v62) & 1) == 0)
            {
              ATLLogObject();
              v74 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v113 = v61;
                _os_log_impl(&dword_1C3511000, v74, OS_LOG_TYPE_DEFAULT, "Plastic card mode not supported for %@", buf, 0xCu);
              }

            }
            else
            {
              +[AppletConfigurationData scriptForModule:](AppletConfigurationData, "scriptForModule:", v62);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              if (v66)
              {
                v89 = v63;
                v67 = v55;
                v68 = v54;
                objc_msgSend(MEMORY[0x1E0C99D50], "dataWithHexString:", v61);
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                SelectByNameCmd(v69);
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v93, "transceiveAndCheckSW:error:", v70, a7);
                v71 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v71 || !objc_msgSend(v93, "applyScript:error:", v66, a7) || a7 && *a7)
                {
                  ATLLogObject();
                  v78 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v113 = v61;
                    _os_log_impl(&dword_1C3511000, v78, OS_LOG_TYPE_ERROR, "Failed executing script on AID %@", buf, 0xCu);
                  }

                  objc_msgSend(v93, "dumpAPDUs:", &__block_literal_global_497);
                  v27 = v81;

                  v41 = 0;
                  v29 = v84;
                  v37 = v85;
                  v35 = v83;
                  goto LABEL_61;
                }
                ATLLogObject();
                v72 = objc_claimAutoreleasedReturnValue();
                v54 = v68;
                if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v113 = v61;
                  _os_log_impl(&dword_1C3511000, v72, OS_LOG_TYPE_DEFAULT, "Successfully executed script on AID %@", buf, 0xCu);
                }
                v27 = v81;
                v55 = v67;
                v63 = v89;
              }
              else
              {
                ATLLogObject();
                v72 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v113 = v62;
                  _os_log_impl(&dword_1C3511000, v72, OS_LOG_TYPE_DEFAULT, "No script for MID %@", buf, 0xCu);
                }
              }

              v53 = v86;
            }
            v56 = v87;
          }
          else
          {
            ATLLogObject();
            v61 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v58, "objectForKeyedSubscript:", v54);
              v73 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v113 = v73;
              _os_log_impl(&dword_1C3511000, v61, OS_LOG_TYPE_DEFAULT, "Ignore LC %@", buf, 0xCu);

            }
          }

          ++v57;
        }
        while (v53 != v57);
        v75 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
        v53 = v75;
        if (v75)
          continue;
        break;
      }
    }

    v37 = v85;
    objc_msgSend(v85, "asHexString");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v83;
    objc_msgSend(v94, "setObject:forKey:", v83, v76);

    objc_msgSend(v94, "synchronize");
    v41 = 1;
    v29 = v84;
  }
LABEL_61:
  v43 = v80;
LABEL_62:

  return v41;
}

void __89__AppletTranslator_appletCacheUpdated_serialNumber_isdSequenceCounter_transceiver_error___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  LogBinary(OS_LOG_TYPE_ERROR, (uint64_t)"+[AppletTranslator appletCacheUpdated:serialNumber:isdSequenceCounter:transceiver:error:]_block_invoke", 260, a3, a4, CFSTR("%c"), a7, a8, a2);
}

+ (BOOL)setPlasticCardMode:(BOOL)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 serialNumber:(id)a7 transceiver:(id)a8 error:(id *)a9
{
  _BOOL4 v13;
  __CFString *v14;
  id v15;
  __CFString *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  __CFString *v32;
  __CFString *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  BOOL v38;
  NSObject *v39;
  NSObject *v40;
  uint64_t v41;
  id v42;
  void *v43;
  uint64_t v44;
  void *v45;
  _QWORD *v46;
  uint64_t *v47;
  uint64_t v48;
  __CFString *v49;
  NSObject *v50;
  NSObject *v51;
  uint64_t v52;
  id v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t *v57;
  uint64_t *v58;
  uint64_t v59;
  void *v61;
  __CFString *v62;
  id v63;
  void *v64;
  id v65;
  uint8_t buf[4];
  __CFString *v67;
  __int16 v68;
  __CFString *v69;
  _QWORD v70[2];
  _QWORD v71[2];
  uint64_t v72;
  uint64_t v73;
  _QWORD v74[2];
  _QWORD v75[2];
  uint64_t v76;
  _QWORD v77[3];

  v13 = a3;
  v77[1] = *MEMORY[0x1E0C80C00];
  v14 = (__CFString *)a4;
  v15 = a5;
  v16 = (__CFString *)a6;
  v17 = a7;
  v18 = a8;
  if (v13)
    +[AppletConfigurationData plasticCardScriptForModule:](AppletConfigurationData, "plasticCardScriptForModule:", v16);
  else
    +[AppletConfigurationData scriptForModule:](AppletConfigurationData, "scriptForModule:", v16);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
  {
    v64 = (void *)v19;
    +[AppletTranslator userDefaults]();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v17;
    objc_msgSend(v17, "asHexString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeObjectForKey:", v22);

    objc_msgSend(v21, "synchronize");
    v65 = v18;
    +[TransceiverWrapper withTransceiver:](TransceiverWrapper, "withTransceiver:", v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATLGetDecoder getDecoderForApplet:withPackage:withModule:]((uint64_t)ATLGetDecoder, (uint64_t)v14, (uint64_t)v15, v16);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24
      && objc_msgSend(v24, "conformsToProtocol:", &unk_1EF8DF9C8)
      && (objc_msgSend(v25, "supportsPlasticCardMode:withApplet:withPackage:withModule:", v23, v14, v15, v16) & 1) == 0)
    {
      ATLLogObject();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v67 = v14;
        _os_log_impl(&dword_1C3511000, v51, OS_LOG_TYPE_ERROR, "Plastic card mode not supported for %@", buf, 0xCu);
      }

      v52 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Plastic card mode not supported for %@"), v14);
      v33 = (__CFString *)v52;
      v20 = v64;
      if (!a9)
      {
        v38 = 0;
        goto LABEL_32;
      }
      v53 = *a9;
      v54 = (void *)MEMORY[0x1E0CB35C8];
      if (*a9)
      {
        v55 = *MEMORY[0x1E0CB3388];
        v70[0] = *MEMORY[0x1E0CB2D50];
        v70[1] = v55;
        v71[0] = v52;
        v71[1] = v53;
        v56 = (void *)MEMORY[0x1E0C99D80];
        v57 = v71;
        v58 = v70;
        v59 = 2;
      }
      else
      {
        v72 = *MEMORY[0x1E0CB2D50];
        v73 = v52;
        v56 = (void *)MEMORY[0x1E0C99D80];
        v57 = &v73;
        v58 = &v72;
        v59 = 1;
      }
      objc_msgSend(v56, "dictionaryWithObjects:forKeys:count:", v57, v58, v59);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 2, v61);
      *a9 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v26 = v14;
      v27 = v15;
      v62 = v26;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithHexString:");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      SelectByNameCmd(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "transceiveAndCheckSW:error:", v29, a9);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        v31 = objc_msgSend(v23, "applyScript:error:", v64, a9);
        v32 = CFSTR("disabling");
        if (v13)
          v32 = CFSTR("enabling");
        v33 = v32;
        if (v31 && (!a9 || !*a9))
        {
          ATLLogObject();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v67 = v33;
            v68 = 2112;
            v69 = v62;
            _os_log_impl(&dword_1C3511000, v34, OS_LOG_TYPE_DEFAULT, "Success %@ plastic card mode on AID %@", buf, 0x16u);
          }

          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithHexString:", CFSTR("A00000015143525300"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          SelectByNameCmd(v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "transceiveAndCheckSW:error:", v36, 0);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v37 != 0;

          ATLLogObject();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v67) = v37 != 0;
            _os_log_impl(&dword_1C3511000, v39, OS_LOG_TYPE_INFO, "Selected CRS: %d", buf, 8u);
          }

          v15 = v27;
          v14 = v62;
          goto LABEL_31;
        }
      }
      else
      {
        v49 = CFSTR("disabling");
        if (v13)
          v49 = CFSTR("enabling");
        v33 = v49;
      }
      v15 = v27;
      ATLLogObject();
      v50 = objc_claimAutoreleasedReturnValue();
      v14 = v62;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v67 = v33;
        v68 = 2112;
        v69 = v62;
        _os_log_impl(&dword_1C3511000, v50, OS_LOG_TYPE_ERROR, "Failed %@ plastic card mode on AID %@", buf, 0x16u);
      }

      objc_msgSend(v23, "dumpAPDUs:", &__block_literal_global_506);
    }
    v38 = 0;
LABEL_31:
    v20 = v64;
LABEL_32:

    v17 = v63;
LABEL_41:

    v18 = v65;
    goto LABEL_42;
  }
  ATLLogObject();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v67 = v16;
    _os_log_impl(&dword_1C3511000, v40, OS_LOG_TYPE_ERROR, "No plastic card configuration for %@", buf, 0xCu);
  }

  v41 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("No plastic card configuration for %@"), v16);
  v21 = (void *)v41;
  if (a9)
  {
    v65 = v18;
    v42 = *a9;
    v43 = (void *)MEMORY[0x1E0CB35C8];
    if (*a9)
    {
      v44 = *MEMORY[0x1E0CB3388];
      v74[0] = *MEMORY[0x1E0CB2D50];
      v74[1] = v44;
      v75[0] = v41;
      v75[1] = v42;
      v45 = (void *)MEMORY[0x1E0C99D80];
      v46 = v75;
      v47 = v74;
      v48 = 2;
    }
    else
    {
      v76 = *MEMORY[0x1E0CB2D50];
      v77[0] = v41;
      v45 = (void *)MEMORY[0x1E0C99D80];
      v46 = v77;
      v47 = &v76;
      v48 = 1;
    }
    objc_msgSend(v45, "dictionaryWithObjects:forKeys:count:", v46, v47, v48);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 2, v23);
    v38 = 0;
    *a9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_41;
  }
  v38 = 0;
LABEL_42:

  return v38;
}

void __104__AppletTranslator_setPlasticCardMode_withApplet_withPackage_withModule_serialNumber_transceiver_error___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  LogBinary(OS_LOG_TYPE_ERROR, (uint64_t)"+[AppletTranslator setPlasticCardMode:withApplet:withPackage:withModule:serialNumber:transceiver:error:]_block_invoke", 320, a3, a4, CFSTR("%c"), a7, a8, a2);
}

+ (BOOL)configureSEWithPassInformation:(id)a3 transceiver:(id)a4 limitedToAID:(id)a5 seHasActivatedApplets:(BOOL *)a6 skipAllActivations:(BOOL)a7 useLegacyBehavior:(BOOL)a8 error:(id *)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  NSObject *v21;
  uint8_t v24[16];
  uint8_t v25[8];
  id v26;
  uint8_t buf[16];

  v9 = a8;
  v10 = a7;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  if (+[AppletTranslator isInternalBuild]())
  {
    +[AppletTranslator userDefaults]();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "BOOLForKey:", CFSTR("debug.skip.configure.express")))
    {
      ATLLogObject();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3511000, v18, OS_LOG_TYPE_ERROR, "!!! Skipping configuration and returning success due to debug pref !!!", buf, 2u);
      }
      LOBYTE(v19) = 1;
      goto LABEL_18;
    }

  }
  +[TransceiverWrapper withTransceiver:](TransceiverWrapper, "withTransceiver:", v15);
  v18 = objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v19 = +[ExpressMode applyConfiguration:toSecureElement:inSessionWithAID:hasActivatedApplets:skipActivations:useLegacyBehavior:error:](_TtC24AppletTranslationLibrary11ExpressMode, "applyConfiguration:toSecureElement:inSessionWithAID:hasActivatedApplets:skipActivations:useLegacyBehavior:error:", v14, v18, v16, a6, v10, v9, &v26);
  v17 = v26;
  ATLLogObject();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v19 && v17 == 0)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_1C3511000, v21, OS_LOG_TYPE_INFO, "Express config successfully set", v24, 2u);
    }

  }
  else
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_1C3511000, v21, OS_LOG_TYPE_ERROR, "Failed to set express mode configuration!", v25, 2u);
    }

    -[NSObject dumpAPDUs:](v18, "dumpAPDUs:", &__block_literal_global_512);
    if (a9)
    {
      v17 = objc_retainAutorelease(v17);
      *a9 = v17;
    }
  }
LABEL_18:

  return v19;
}

void __141__AppletTranslator_configureSEWithPassInformation_transceiver_limitedToAID_seHasActivatedApplets_skipAllActivations_useLegacyBehavior_error___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  LogBinary(OS_LOG_TYPE_ERROR, (uint64_t)"+[AppletTranslator configureSEWithPassInformation:transceiver:limitedToAID:seHasActivatedApplets:skipAllActivations:useLegacyBehavior:error:]_block_invoke", 367, a3, a4, CFSTR("  %c"), a7, a8, a2);
}

+ (id)checkSEExpressAppletCompatibilityWithPassInformation:(id)a3 error:(id *)a4
{
  return +[ExpressMode checkCompatibilityWithPassInformation:error:](_TtC24AppletTranslationLibrary11ExpressMode, "checkCompatibilityWithPassInformation:error:", a3, a4);
}

+ (id)checkSEExpressAppletCompatibilityWithPassInformation:(id)a3 useLegacyBehavior:(BOOL)a4 error:(id *)a5
{
  return +[ExpressMode checkCompatibilityWithPassInformation:useLegacyBehavior:error:](_TtC24AppletTranslationLibrary11ExpressMode, "checkCompatibilityWithPassInformation:useLegacyBehavior:error:", a3, a4, a5);
}

+ (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  +[ATLGetDecoder getDecoderForApplet:withPackage:withModule:]((uint64_t)ATLGetDecoder, (uint64_t)v11, (uint64_t)v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "GetAppletProperties:withPackage:withModule:withTransceiver:withError:", v11, v12, v13, v14, a7);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = CFSTR("Supported");
    v21[0] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v17;

  return v18;
}

+ (id)processEndOfTransaction:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  _QWORD v31[2];
  _QWORD v32[2];
  uint64_t v33;
  uint64_t v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  +[ATLGetDecoder getDecoderForApplet:withPackage:withModule:]((uint64_t)ATLGetDecoder, (uint64_t)v11, (uint64_t)v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    +[TransceiverWrapper withTransceiver:](TransceiverWrapper, "withTransceiver:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "processEndOfTransaction:withApplet:withPackage:withModule:withError:", v16, v11, v12, v13, a7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      goto LABEL_15;
  }
  else
  {
    ATLLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v36 = v11;
      v37 = 2112;
      v38 = v12;
      v39 = 2112;
      v40 = v13;
      _os_log_impl(&dword_1C3511000, v18, OS_LOG_TYPE_ERROR, "No suitable decoder for AID %@ PID %@ MID %@", buf, 0x20u);
    }

    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("No suitable decoder for AID %@ PID %@ MID %@"), v11, v12, v13);
    v20 = (void *)v19;
    if (a7)
    {
      v21 = *a7;
      v22 = (void *)MEMORY[0x1E0CB35C8];
      if (*a7)
      {
        v23 = *MEMORY[0x1E0CB3388];
        v31[0] = *MEMORY[0x1E0CB2D50];
        v31[1] = v23;
        v32[0] = v19;
        v32[1] = v21;
        v24 = (void *)MEMORY[0x1E0C99D80];
        v25 = v32;
        v26 = v31;
        v27 = 2;
      }
      else
      {
        v33 = *MEMORY[0x1E0CB2D50];
        v34 = v19;
        v24 = (void *)MEMORY[0x1E0C99D80];
        v25 = &v34;
        v26 = &v33;
        v27 = 1;
      }
      objc_msgSend(v24, "dictionaryWithObjects:forKeys:count:", v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 2, v28);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  ATLLogObject();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v11;
    _os_log_impl(&dword_1C3511000, v29, OS_LOG_TYPE_ERROR, "Failed to process End of Transaction: %@", buf, 0xCu);
  }

  v17 = 0;
LABEL_15:

  return v17;
}

+ (BOOL)isLegacyApplet:(id)a3 withPackage:(id)a4 withModule:(id)a5
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;

  v5 = a4;
  if (objc_msgSend(v5, "hasPrefix:", CFSTR("A00000068001")))
  {
    v6 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v5, "length") - 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataWithHexString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_retainAutorelease(v8);
    v10 = ReadU16BE((const unsigned __int8 *)objc_msgSend(v9, "bytes")) < 0x621;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)getNFCSettings
{
  return +[AppletConfigurationData getNFCSettings](AppletConfigurationData, "getNFCSettings");
}

+ (void)cleanup
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend((id)statefulDecoders, "allObjects", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "cleanup");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

+ (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  return (id)objc_msgSend(a1, "getServiceProviderData:withPackage:withModule:withPublicKey:withEncryptionScheme:withTransceiver:withError:", a3, a4, a5, 0, 0, a6, a7);
}

+ (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withPublicKey:(id)a6 withEncryptionScheme:(id)a7 withTransceiver:(id)a8 withError:(id *)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  void *v34;
  _QWORD v36[2];
  _QWORD v37[2];
  uint64_t v38;
  uint64_t v39;
  uint8_t buf[4];
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  +[ATLGetDecoder getDecoderForApplet:withPackage:withModule:]((uint64_t)ATLGetDecoder, (uint64_t)v14, (uint64_t)v15, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20 && objc_msgSend(v20, "conformsToProtocol:", &unk_1EF8DE740))
  {
    +[TransceiverWrapper withTransceiver:](TransceiverWrapper, "withTransceiver:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "getServiceProviderData:withPackage:withModule:withPublicKey:withEncryptionScheme:withTransceiver:withError:", v14, v15, v16, v17, v18, v22, a9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    ATLLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v14;
      _os_log_impl(&dword_1C3511000, v24, OS_LOG_TYPE_ERROR, "Service Provider Opaque Data is not supported for %@", buf, 0xCu);
    }

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Service Provider Opaque Data is not supported for %@"), v14);
    v26 = (void *)v25;
    if (a9)
    {
      v27 = *a9;
      v28 = (void *)MEMORY[0x1E0CB35C8];
      if (*a9)
      {
        v29 = *MEMORY[0x1E0CB3388];
        v36[0] = *MEMORY[0x1E0CB2D50];
        v36[1] = v29;
        v37[0] = v25;
        v37[1] = v27;
        v30 = (void *)MEMORY[0x1E0C99D80];
        v31 = v37;
        v32 = v36;
        v33 = 2;
      }
      else
      {
        v38 = *MEMORY[0x1E0CB2D50];
        v39 = v25;
        v30 = (void *)MEMORY[0x1E0C99D80];
        v31 = &v39;
        v32 = &v38;
        v33 = 1;
      }
      objc_msgSend(v30, "dictionaryWithObjects:forKeys:count:", v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 2, v34);
      *a9 = (id)objc_claimAutoreleasedReturnValue();

    }
    v23 = 0;
  }

  return v23;
}

+ (BOOL)getCurrentInMetroStatus:(id *)a3
{
  void *v3;
  char v4;

  +[MetroStateMonitor shared](_TtC24AppletTranslationLibrary17MetroStateMonitor, "shared", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "inMetro");

  return v4;
}

+ (id)getATLDelegate
{
  objc_opt_self();
  return (id)delegate;
}

void __44__AppletTranslator_Private__isInternalBuild__block_invoke()
{
  int has_internal_diagnostics;
  void *v1;
  NSObject *v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  isInternalBuild_isInternal = has_internal_diagnostics;
  if (has_internal_diagnostics)
  {
    +[AppletTranslator userDefaults]();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    isInternalBuild_isInternal = objc_msgSend(v1, "BOOLForKey:", CFSTR("debug.enable.customer.behavior")) ^ 1;

  }
  ATLLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3[0] = 67109120;
    v3[1] = isInternalBuild_isInternal;
    _os_log_impl(&dword_1C3511000, v2, OS_LOG_TYPE_INFO, "Allowing internal diagnostics? %d", (uint8_t *)v3, 8u);
  }

}

+ (void)registerForCleanup:(uint64_t)a1
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_opt_self();
  v2 = (void *)statefulDecoders;
  if (!statefulDecoders)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v4 = (void *)statefulDecoders;
    statefulDecoders = (uint64_t)v3;

    v2 = (void *)statefulDecoders;
  }
  objc_msgSend(v2, "addObject:", v5);

}

+ (void)deregisterForCleanup:(uint64_t)a1
{
  id v2;

  v2 = a2;
  objc_opt_self();
  if (objc_msgSend((id)statefulDecoders, "containsObject:", v2))
    objc_msgSend((id)statefulDecoders, "removeObject:", v2);

}

@end
