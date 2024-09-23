@implementation PLSCDynamicStoreAgent

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLSCDynamicStoreAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)railDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)accountingGroupDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventPointDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventForwardDefinitions
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
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
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[2];
  uint64_t v59;
  uint64_t v60;
  _QWORD v61[2];
  _QWORD v62[4];
  _QWORD v63[6];

  v63[4] = *MEMORY[0x1E0C80C00];
  v62[0] = CFSTR("CellularActive");
  v59 = *MEMORY[0x1E0D80298];
  v2 = v59;
  v4 = *MEMORY[0x1E0D80300];
  v57[0] = *MEMORY[0x1E0D80318];
  v3 = v57[0];
  v57[1] = v4;
  v5 = MEMORY[0x1E0C9AAA0];
  v58[0] = &unk_1E8653450;
  v58[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v36;
  v60 = *MEMORY[0x1E0D802F0];
  v6 = v60;
  v55[0] = CFSTR("Active");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "commonTypeDict_BoolFormat");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = CFSTR("LinkQuality");
  v56[0] = v34;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "commonTypeDict_IntegerFormat");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v32;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v61[1] = v31;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, &v59, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v30;
  v62[1] = CFSTR("WifiActive");
  v52[1] = v5;
  v53[0] = v2;
  v51[0] = v3;
  v51[1] = v4;
  v52[0] = &unk_1E8653450;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v6;
  v54[0] = v29;
  v49[0] = CFSTR("Active");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "commonTypeDict_BoolFormat");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = CFSTR("LinkQuality");
  v50[0] = v27;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "commonTypeDict_IntegerFormat");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v63[1] = v23;
  v62[2] = CFSTR("HotspotActive");
  v46[1] = v5;
  v47[0] = v2;
  v45[0] = v3;
  v45[1] = v4;
  v46[0] = &unk_1E8653450;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v6;
  v48[0] = v22;
  v43[0] = CFSTR("Active");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_BoolFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = CFSTR("LinkQuality");
  v44[0] = v20;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v63[2] = v8;
  v62[3] = CFSTR("BTHotspotActive");
  v40[1] = v5;
  v41[0] = v2;
  v39[0] = v3;
  v39[1] = v4;
  v40[0] = &unk_1E8653450;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v6;
  v42[0] = v9;
  v37[0] = CFSTR("Active");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_BoolFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = CFSTR("LinkQuality");
  v38[0] = v11;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "commonTypeDict_IntegerFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v63[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventIntervalDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (PLSCDynamicStoreAgent)init
{
  PLSCDynamicStoreAgent *v2;
  PLSCDynamicStoreAgent *v3;
  const __CFAllocator *v4;
  const __SCDynamicStore *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  __CFString *NetworkGlobalEntity;
  __CFString *v11;
  const __CFString *v12;
  __CFString *NetworkInterfaceEntity;
  __CFString *v14;
  SCDynamicStoreContext v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PLSCDynamicStoreAgent;
  v2 = -[PLAgent init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    v16.version = 0;
    memset(&v16.retain, 0, 24);
    v16.info = v2;
    v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v5 = SCDynamicStoreCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("PLSCDynamicStoreAgent"), (SCDynamicStoreCallBack)networkLinkQualityChangeCallback, &v16);
    _dynamicStore = (uint64_t)v5;
    -[PLOperator workQueue](v3, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    SCDynamicStoreSetDispatchQueue(v5, v6);

    v7 = (void *)objc_opt_new();
    v8 = (void *)objc_opt_new();
    v9 = (const __CFString *)*MEMORY[0x1E0CE8B30];
    NetworkGlobalEntity = (__CFString *)SCDynamicStoreKeyCreateNetworkGlobalEntity(v4, (CFStringRef)*MEMORY[0x1E0CE8B30], (CFStringRef)*MEMORY[0x1E0CE8B78]);
    objc_msgSend(v7, "addObject:", NetworkGlobalEntity);
    v11 = (__CFString *)SCDynamicStoreKeyCreateNetworkGlobalEntity(v4, v9, (CFStringRef)*MEMORY[0x1E0CE8B80]);

    objc_msgSend(v7, "addObject:", v11);
    v12 = (const __CFString *)*MEMORY[0x1E0CE8B20];
    NetworkInterfaceEntity = (__CFString *)SCDynamicStoreKeyCreateNetworkInterfaceEntity(v4, v9, (CFStringRef)*MEMORY[0x1E0CE8B20], (CFStringRef)*MEMORY[0x1E0CE8B90]);

    objc_msgSend(v8, "addObject:", NetworkInterfaceEntity);
    v14 = (__CFString *)SCDynamicStoreKeyCreateNetworkInterfaceEntity(v4, v9, v12, (CFStringRef)*MEMORY[0x1E0CE8BA0]);

    objc_msgSend(v8, "addObject:", v14);
    SCDynamicStoreSetNotificationKeys((SCDynamicStoreRef)_dynamicStore, (CFArrayRef)v7, (CFArrayRef)v8);

  }
  return v3;
}

- (void)initOperatorDependancies
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createDistributionEventForwardWithDistributionID:withRemovingChildNodeName:withStartDate:", 8, CFSTR("Hotspot"), v2);

}

- (void)networkLinkQualityChanged:(__SCDynamicStore *)a3 withChangedKeys:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const __CFArray *v13;
  void *v14;
  const __CFAllocator *v15;
  const __CFString *v16;
  const __CFString *v17;
  __CFString *NetworkInterfaceEntity;
  __CFString *v19;
  CFDictionaryRef v20;
  uint64_t v21;
  PLSCDynamicStoreAgent *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  int v31;
  PLSCDynamicStoreAgent *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  const __CFArray *v55;
  id v56;
  PLSCDynamicStoreAgent *v57;
  void *v58;
  int v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  void *v67;
  void *v68;
  int v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  NSObject *v80;
  PLSCDynamicStoreAgent *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  _QWORD v86[5];
  _QWORD v87[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v6 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__PLSCDynamicStoreAgent_networkLinkQualityChanged_withChangedKeys___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (qword_1ED886EA8 != -1)
      dispatch_once(&qword_1ED886EA8, block);
    if (_MergedGlobals_102)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SCDS Changed Keys: %@"), v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSCDynamicStoreAgent.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSCDynamicStoreAgent networkLinkQualityChanged:withChangedKeys:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 163);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v90 = v7;
        _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v13 = (const __CFArray *)objc_opt_new();
  v14 = (void *)objc_opt_new();
  v15 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v16 = (const __CFString *)*MEMORY[0x1E0CE8B30];
  v17 = (const __CFString *)*MEMORY[0x1E0CE8B20];
  NetworkInterfaceEntity = (__CFString *)SCDynamicStoreKeyCreateNetworkInterfaceEntity((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)*MEMORY[0x1E0CE8B30], (CFStringRef)*MEMORY[0x1E0CE8B20], (CFStringRef)*MEMORY[0x1E0CE8B90]);
  objc_msgSend(v14, "addObject:", NetworkInterfaceEntity);

  v19 = (__CFString *)SCDynamicStoreKeyCreateNetworkInterfaceEntity(v15, v16, v17, (CFStringRef)*MEMORY[0x1E0CE8BA0]);
  objc_msgSend(v14, "addObject:", v19);

  v20 = SCDynamicStoreCopyMultiple((SCDynamicStoreRef)_dynamicStore, v13, (CFArrayRef)v14);
  if (!v20)
    goto LABEL_48;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v21 = objc_opt_class();
    v87[0] = MEMORY[0x1E0C809B0];
    v87[1] = 3221225472;
    v87[2] = __67__PLSCDynamicStoreAgent_networkLinkQualityChanged_withChangedKeys___block_invoke_37;
    v87[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v87[4] = v21;
    if (qword_1ED886EB0 != -1)
      dispatch_once(&qword_1ED886EB0, v87);
    if (byte_1ED886EA1)
    {
      v82 = v14;
      v22 = self;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SCDS Dynamic store dictionary: %@"), v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSCDynamicStoreAgent.m");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "lastPathComponent");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSCDynamicStoreAgent networkLinkQualityChanged:withChangedKeys:]");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v26, v27, 174);

      PLLogCommon();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v90 = v23;
        _os_log_debug_impl(&dword_1CAF47000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      self = v22;
      v14 = v82;
    }
  }
  if (objc_msgSend(v5, "containsObject:", CFSTR("State:/Network/Interface/en0/Link")))
  {
    -[__CFDictionary allKeys](v20, "allKeys");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v29, "containsObject:", CFSTR("State:/Network/Interface/en0/Link")))
    {
LABEL_25:

      goto LABEL_26;
    }
    -[__CFDictionary allKeys](v20, "allKeys");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "containsObject:", CFSTR("State:/Network/Interface/en0/LinkQuality"));

    if (v31)
    {
      v83 = v14;
      v32 = self;
      +[PLOperator entryKeyForType:andName:](PLSCDynamicStoreAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("WifiActive"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v29);
      -[__CFDictionary objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", CFSTR("State:/Network/Interface/en0/Link"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("Active"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "isEqual:", &unk_1E8634158);

      if (v36)
        v37 = MEMORY[0x1E0C9AAB0];
      else
        v37 = MEMORY[0x1E0C9AAA0];
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v37, CFSTR("Active"));
      -[__CFDictionary objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", CFSTR("State:/Network/Interface/en0/LinkQuality"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
      {
        -[__CFDictionary objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", CFSTR("State:/Network/Interface/en0/LinkQuality"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("LinkQuality"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setObject:forKeyedSubscript:", v40, CFSTR("LinkQuality"));

      }
      self = v32;
      -[PLOperator logEntry:](v32, "logEntry:", v33);

      v14 = v83;
      goto LABEL_25;
    }
  }
LABEL_26:
  if (objc_msgSend(v5, "containsObject:", CFSTR("State:/Network/Interface/ap1/Link")))
  {
    -[__CFDictionary allKeys](v20, "allKeys");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "containsObject:", CFSTR("State:/Network/Interface/ap1/Link"));

    if (v42)
    {
      v43 = v14;
      +[PLOperator entryKeyForType:andName:](PLSCDynamicStoreAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("HotspotActive"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v44);
      -[__CFDictionary objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", CFSTR("State:/Network/Interface/ap1/Link"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("Active"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "isEqual:", &unk_1E8634158);

      if (v48)
      {
        objc_msgSend(v45, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("Active"));
        objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "entryDate");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "createDistributionEventForwardWithDistributionID:withAddingChildNodeName:withStartDate:", 41, CFSTR("Hotspot"), v50);
      }
      else
      {
        objc_msgSend(v45, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("Active"));
        objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "entryDate");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "createDistributionEventForwardWithDistributionID:withRemovingChildNodeName:withStartDate:", 41, CFSTR("Hotspot"), v50);
      }

      -[PLOperator logEntry:](self, "logEntry:", v45);
      v14 = v43;
    }
  }
  if ((objc_msgSend(v5, "containsObject:", CFSTR("State:/Network/Interface/pdp_ip0/Link")) & 1) != 0
    || objc_msgSend(v5, "containsObject:", CFSTR("State:/Network/Interface/pdp_ip0/LinkQuality")))
  {
    -[__CFDictionary allKeys](v20, "allKeys");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "containsObject:", CFSTR("State:/Network/Interface/pdp_ip0/LinkQuality"));

    if (v52)
    {
      +[PLOperator entryKeyForType:andName:](PLSCDynamicStoreAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("CellularActive"));
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v84);
      -[__CFDictionary objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", CFSTR("State:/Network/Interface/pdp_ip0/LinkQuality"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("LinkQuality"));
      v55 = v13;
      v56 = v5;
      v57 = self;
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v58, "isEqual:", &unk_1E8634170);

      self = v57;
      v5 = v56;
      v13 = v55;

      if (v59)
        v60 = MEMORY[0x1E0C9AAA0];
      else
        v60 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(v53, "setObject:forKeyedSubscript:", v60, CFSTR("Active"));
      -[__CFDictionary objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", CFSTR("State:/Network/Interface/pdp_ip0/LinkQuality"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("LinkQuality"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setObject:forKeyedSubscript:", v62, CFSTR("LinkQuality"));

      -[PLOperator logEntry:](self, "logEntry:", v53);
    }
  }
  if (objc_msgSend(v5, "containsObject:", CFSTR("State:/Network/Interface/en2/Link")))
  {
    +[PLOperator entryKeyForType:andName:](PLSCDynamicStoreAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("BTHotspotActive"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v63);
    -[__CFDictionary allKeys](v20, "allKeys");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v65, "containsObject:", CFSTR("State:/Network/Interface/en2/Link"));

    if (v66)
    {
      -[__CFDictionary objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", CFSTR("State:/Network/Interface/en2/Link"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("Active"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v68, "isEqual:", &unk_1E8634158);

      if (!v69)
      {
        objc_msgSend(v64, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("Active"));
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v74 = objc_opt_class();
          v86[0] = MEMORY[0x1E0C809B0];
          v86[1] = 3221225472;
          v86[2] = __67__PLSCDynamicStoreAgent_networkLinkQualityChanged_withChangedKeys___block_invoke_58;
          v86[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v86[4] = v74;
          if (qword_1ED886EB8 != -1)
            dispatch_once(&qword_1ED886EB8, v86);
          if (byte_1ED886EA2)
          {
            v81 = self;
            v85 = v14;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WARNING: Interface en2 keys exist, but active=no. Expected en2.active=yes whenever en2 interface exists"));
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            v76 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSCDynamicStoreAgent.m");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "lastPathComponent");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSCDynamicStoreAgent networkLinkQualityChanged:withChangedKeys:]");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "logMessage:fromFile:fromFunction:fromLineNumber:", v75, v78, v79, 239);

            PLLogCommon();
            v80 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v90 = v75;
              _os_log_debug_impl(&dword_1CAF47000, v80, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            self = v81;
            v14 = v85;
          }
        }
        goto LABEL_45;
      }
      v70 = MEMORY[0x1E0C9AAB0];
    }
    else
    {
      v70 = MEMORY[0x1E0C9AAA0];
    }
    objc_msgSend(v64, "setObject:forKeyedSubscript:", v70, CFSTR("Active"));
LABEL_45:
    -[__CFDictionary objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", CFSTR("State:/Network/Interface/en2/LinkQuality"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    if (v71)
    {
      -[__CFDictionary objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", CFSTR("State:/Network/Interface/en2/LinkQuality"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "objectForKeyedSubscript:", CFSTR("LinkQuality"));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setObject:forKeyedSubscript:", v73, CFSTR("LinkQuality"));

    }
    -[PLOperator logEntry:](self, "logEntry:", v64);

  }
LABEL_48:

}

uint64_t __67__PLSCDynamicStoreAgent_networkLinkQualityChanged_withChangedKeys___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_102 = result;
  return result;
}

uint64_t __67__PLSCDynamicStoreAgent_networkLinkQualityChanged_withChangedKeys___block_invoke_37(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886EA1 = result;
  return result;
}

uint64_t __67__PLSCDynamicStoreAgent_networkLinkQualityChanged_withChangedKeys___block_invoke_58(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886EA2 = result;
  return result;
}

@end
