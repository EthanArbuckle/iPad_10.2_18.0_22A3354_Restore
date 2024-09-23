@implementation PLProcessPortMap

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__PLProcessPortMap_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_portMap;
}

void __34__PLProcessPortMap_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_opt_class();
  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_portMap;
  sharedInstance_portMap = v0;

}

- (PLProcessPortMap)init
{
  PLProcessPortMap *v2;
  PLProcessPortMap *v3;
  NSMutableDictionary *strictLookupMap;
  NSMutableDictionary *lenientLookupMap;
  NSMutableDictionary *localPortOnlyLookupMap;
  NSMutableDictionary *ipAddrLookupMap;
  uint64_t v8;
  OS_dispatch_queue *workQueue;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PLProcessPortMap;
  v2 = -[PLProcessPortMap init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    strictLookupMap = v2->_strictLookupMap;
    v2->_strictLookupMap = 0;

    lenientLookupMap = v3->_lenientLookupMap;
    v3->_lenientLookupMap = 0;

    localPortOnlyLookupMap = v3->_localPortOnlyLookupMap;
    v3->_localPortOnlyLookupMap = 0;

    ipAddrLookupMap = v3->_ipAddrLookupMap;
    v3->_ipAddrLookupMap = 0;

    +[PLUtilities workQueueForClass:](PLUtilities, "workQueueForClass:", objc_opt_class());
    v8 = objc_claimAutoreleasedReturnValue();
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v8;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PLProcessPortMap;
  -[PLProcessPortMap dealloc](&v2, sel_dealloc);
}

- (void)reconstructPortMap
{
  NSObject *v3;
  _QWORD block[5];

  -[PLProcessPortMap workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__PLProcessPortMap_reconstructPortMap__block_invoke;
  block[3] = &unk_1EA16D040;
  block[4] = self;
  dispatch_async_and_wait(v3, block);

}

uint64_t __38__PLProcessPortMap_reconstructPortMap__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reconstructPortMapInternal");
}

- (void)clearPortMap
{
  NSObject *v3;
  _QWORD block[5];

  -[PLProcessPortMap workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__PLProcessPortMap_clearPortMap__block_invoke;
  block[3] = &unk_1EA16D040;
  block[4] = self;
  dispatch_async_and_wait(v3, block);

}

uint64_t __32__PLProcessPortMap_clearPortMap__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clearPortMapInternal");
}

- (id)pidAndProcessNameForDestAddress:(id)a3 withDestPort:(id)a4 withSourceAddress:(id)a5 withSourcePort:(id)a6 withProtocol:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD block[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy_;
  v36 = __Block_byref_object_dispose_;
  v37 = 0;
  -[PLProcessPortMap workQueue](self, "workQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke;
  block[3] = &unk_1EA16D088;
  block[4] = self;
  v26 = v16;
  v27 = v12;
  v28 = v14;
  v30 = v15;
  v31 = &v32;
  v29 = v13;
  v18 = v15;
  v19 = v13;
  v20 = v14;
  v21 = v12;
  v22 = v16;
  dispatch_async_and_wait(v17, block);

  v23 = (id)v33[5];
  _Block_object_dispose(&v32, 8);

  return v23;
}

void __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  const __CFString *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  NSObject *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  NSObject *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  int v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  NSObject *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  NSObject *v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  NSObject *v121;
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
  _QWORD v133[6];

  objc_msgSend(*(id *)(a1 + 32), "strictLookupMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v3 = objc_opt_class();
      v133[0] = MEMORY[0x1E0C809B0];
      v133[1] = 3221225472;
      v133[2] = __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_2;
      v133[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v133[4] = v3;
      if (protocolKey_block_invoke_defaultOnce != -1)
        dispatch_once(&protocolKey_block_invoke_defaultOnce, v133);
      if (protocolKey_block_invoke_classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("reconstructing the port map"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "lastPathComponent");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessPortMap pidAndProcessNameForDestAddress:withDestPort:withSourceAddress:withSourcePort:withProtocol:]_block_invoke");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 92);

        PLLogCommon();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "reconstructPortMapInternal");
  }
  v10 = objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("ESP"));
  v11 = *(void **)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 48);
  if (v10)
  {
    objc_msgSend(v11, "keyForIPAddrLookup:withSourceAddress:", v12, *(_QWORD *)(a1 + 56));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "ipAddrLookupMap");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v13);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v18 = objc_opt_class();
      v132[0] = MEMORY[0x1E0C809B0];
      v132[1] = 3221225472;
      v132[2] = __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_62;
      v132[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v132[4] = v18;
      if (protocolKey_block_invoke_defaultOnce_60 != -1)
        dispatch_once(&protocolKey_block_invoke_defaultOnce_60, v132);
      if (protocolKey_block_invoke_classDebugEnabled_61)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ESP protocol key %@ and pid and process %@"), v13, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "lastPathComponent");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessPortMap pidAndProcessNameForDestAddress:withDestPort:withSourceAddress:withSourcePort:withProtocol:]_block_invoke_2");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v22, v23, 100);

        PLLogCommon();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
LABEL_90:

        goto LABEL_91;
      }
    }
    goto LABEL_91;
  }
  objc_msgSend(v11, "keyFromAddress:withPort:withSourceAddress:withSourcePort:withProtocol:", v12, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v25 = objc_opt_class();
    v131[0] = MEMORY[0x1E0C809B0];
    v131[1] = 3221225472;
    v131[2] = __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_68;
    v131[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v131[4] = v25;
    if (protocolKey_block_invoke_defaultOnce_66 != -1)
      dispatch_once(&protocolKey_block_invoke_defaultOnce_66, v131);
    if (protocolKey_block_invoke_classDebugEnabled_67)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("looking up %@"), v13);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "lastPathComponent");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessPortMap pidAndProcessNameForDestAddress:withDestPort:withSourceAddress:withSourcePort:withProtocol:]_block_invoke_2");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "logMessage:fromFile:fromFunction:fromLineNumber:", v26, v29, v30, 104);

      PLLogCommon();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v32 = objc_opt_class();
    v130[0] = MEMORY[0x1E0C809B0];
    v130[1] = 3221225472;
    v130[2] = __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_73;
    v130[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v130[4] = v32;
    if (protocolKey_block_invoke_defaultOnce_71 != -1)
      dispatch_once(&protocolKey_block_invoke_defaultOnce_71, v130);
    if (protocolKey_block_invoke_classDebugEnabled_72)
    {
      v33 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "strictLookupMap");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "stringWithFormat:", CFSTR("strictLookupMap=%@"), v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "lastPathComponent");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessPortMap pidAndProcessNameForDestAddress:withDestPort:withSourceAddress:withSourcePort:withProtocol:]_block_invoke_2");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "logMessage:fromFile:fromFunction:fromLineNumber:", v35, v38, v39, 105);

      PLLogCommon();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "strictLookupMap");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "objectForKeyedSubscript:", v13);
  v42 = objc_claimAutoreleasedReturnValue();
  v43 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v44 = *(void **)(v43 + 40);
  *(_QWORD *)(v43 + 40) = v42;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isAddressIPV4:", *(_QWORD *)(a1 + 48)))
      v52 = CFSTR("0.0.0.0");
    else
      v52 = CFSTR("::");
    objc_msgSend(*(id *)(a1 + 32), "keyFromAddress:withPort:withSourceAddress:withSourcePort:withProtocol:", v52, *(_QWORD *)(a1 + 64), v52, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v53 = objc_opt_class();
      v129[0] = MEMORY[0x1E0C809B0];
      v129[1] = 3221225472;
      v129[2] = __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_78;
      v129[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v129[4] = v53;
      if (protocolKey_block_invoke_defaultOnce_76 != -1)
        dispatch_once(&protocolKey_block_invoke_defaultOnce_76, v129);
      if (protocolKey_block_invoke_classDebugEnabled_77)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The search key is %@"), v46);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "lastPathComponent");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessPortMap pidAndProcessNameForDestAddress:withDestPort:withSourceAddress:withSourcePort:withProtocol:]_block_invoke_2");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "logMessage:fromFile:fromFunction:fromLineNumber:", v54, v57, v58, 119);

        PLLogCommon();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "strictLookupMap");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "objectForKeyedSubscript:", v46);
    v61 = objc_claimAutoreleasedReturnValue();
    v62 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v63 = *(void **)(v62 + 40);
    *(_QWORD *)(v62 + 40) = v61;

    if (!v61)
    {
      objc_msgSend(*(id *)(a1 + 32), "keyFromAddress:withPort:withSourceAddress:withSourcePort:withProtocol:", CFSTR("*"), *(_QWORD *)(a1 + 64), CFSTR("*"), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40));
      v64 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "strictLookupMap");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "objectForKeyedSubscript:", v64);
      v66 = objc_claimAutoreleasedReturnValue();
      v67 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v68 = *(void **)(v67 + 40);
      *(_QWORD *)(v67 + 40) = v66;

      v46 = (void *)v64;
    }
    v69 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    v70 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
    if (v69)
    {
      if (!v70)
        goto LABEL_82;
      v71 = objc_opt_class();
      v125[0] = MEMORY[0x1E0C809B0];
      v125[1] = 3221225472;
      v125[2] = __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_98;
      v125[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v125[4] = v71;
      if (protocolKey_block_invoke_defaultOnce_96 != -1)
        dispatch_once(&protocolKey_block_invoke_defaultOnce_96, v125);
      if (!protocolKey_block_invoke_classDebugEnabled_97)
        goto LABEL_82;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Wild card match succeeded!"));
      v51 = objc_claimAutoreleasedReturnValue();
      v72 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "lastPathComponent");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessPortMap pidAndProcessNameForDestAddress:withDestPort:withSourceAddress:withSourcePort:withProtocol:]_block_invoke_2");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "logMessage:fromFile:fromFunction:fromLineNumber:", v51, v74, v75, 143);

      PLLogCommon();
      v76 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
    }
    else
    {
      if (v70)
      {
        v77 = objc_opt_class();
        v128[0] = MEMORY[0x1E0C809B0];
        v128[1] = 3221225472;
        v128[2] = __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_83;
        v128[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v128[4] = v77;
        if (protocolKey_block_invoke_defaultOnce_81 != -1)
          dispatch_once(&protocolKey_block_invoke_defaultOnce_81, v128);
        if (protocolKey_block_invoke_classDebugEnabled_82)
        {
          v78 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(*(id *)(a1 + 32), "lenientLookupMap");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "stringWithFormat:", CFSTR("Lenient Map = %@"), v79);
          v80 = (void *)objc_claimAutoreleasedReturnValue();

          v81 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "lastPathComponent");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessPortMap pidAndProcessNameForDestAddress:withDestPort:withSourceAddress:withSourcePort:withProtocol:]_block_invoke_2");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "logMessage:fromFile:fromFunction:fromLineNumber:", v80, v83, v84, 128);

          PLLogCommon();
          v85 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        }
      }
      objc_msgSend(*(id *)(a1 + 32), "keyForlenientLookup:withPort:withProtocol:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));
      v51 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "lenientLookupMap");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "objectForKeyedSubscript:", v51);
      v87 = objc_claimAutoreleasedReturnValue();
      v88 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v89 = *(void **)(v88 + 40);
      *(_QWORD *)(v88 + 40) = v87;

      v90 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      v91 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
      if (v90)
      {
        if (!v91)
          goto LABEL_81;
        v92 = objc_opt_class();
        v126[0] = MEMORY[0x1E0C809B0];
        v126[1] = 3221225472;
        v126[2] = __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_93;
        v126[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v126[4] = v92;
        if (protocolKey_block_invoke_defaultOnce_91 != -1)
          dispatch_once(&protocolKey_block_invoke_defaultOnce_91, v126);
        if (!protocolKey_block_invoke_classDebugEnabled_92)
          goto LABEL_81;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("3 tuple match succeeded!"));
        v76 = objc_claimAutoreleasedReturnValue();
        v93 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "lastPathComponent");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessPortMap pidAndProcessNameForDestAddress:withDestPort:withSourceAddress:withSourcePort:withProtocol:]_block_invoke_2");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "logMessage:fromFile:fromFunction:fromLineNumber:", v76, v95, v96, 140);

        PLLogCommon();
        v97 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
      else
      {
        if (v91)
        {
          v98 = objc_opt_class();
          v127[0] = MEMORY[0x1E0C809B0];
          v127[1] = 3221225472;
          v127[2] = __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_88;
          v127[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v127[4] = v98;
          if (protocolKey_block_invoke_defaultOnce_86 != -1)
            dispatch_once(&protocolKey_block_invoke_defaultOnce_86, v127);
          if (protocolKey_block_invoke_classDebugEnabled_87)
          {
            v99 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(*(id *)(a1 + 32), "localPortOnlyLookupMap");
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v99, "stringWithFormat:", CFSTR("Local Port Only Map =%@"), v100);
            v101 = (void *)objc_claimAutoreleasedReturnValue();

            v102 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m");
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v103, "lastPathComponent");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessPortMap pidAndProcessNameForDestAddress:withDestPort:withSourceAddress:withSourcePort:withProtocol:]_block_invoke_2");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "logMessage:fromFile:fromFunction:fromLineNumber:", v101, v104, v105, 135);

            PLLogCommon();
            v106 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
              __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

          }
        }
        objc_msgSend(*(id *)(a1 + 32), "keyForlocalPortLookup:withProtocol:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));
        v76 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "localPortOnlyLookupMap");
        v97 = objc_claimAutoreleasedReturnValue();
        -[NSObject objectForKeyedSubscript:](v97, "objectForKeyedSubscript:", v76);
        v107 = objc_claimAutoreleasedReturnValue();
        v108 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
        v109 = *(void **)(v108 + 40);
        *(_QWORD *)(v108 + 40) = v107;

      }
    }

LABEL_81:
LABEL_82:

    goto LABEL_83;
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v45 = objc_opt_class();
    v124[0] = MEMORY[0x1E0C809B0];
    v124[1] = 3221225472;
    v124[2] = __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_103;
    v124[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v124[4] = v45;
    if (protocolKey_block_invoke_defaultOnce_101 != -1)
      dispatch_once(&protocolKey_block_invoke_defaultOnce_101, v124);
    if (protocolKey_block_invoke_classDebugEnabled_102)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("5 tuple match succeeded!"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "lastPathComponent");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessPortMap pidAndProcessNameForDestAddress:withDestPort:withSourceAddress:withSourcePort:withProtocol:]_block_invoke_2");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "logMessage:fromFile:fromFunction:fromLineNumber:", v46, v49, v50, 146);

      PLLogCommon();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      goto LABEL_81;
    }
  }
LABEL_83:
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40)
    && objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v110 = objc_opt_class();
    v123[0] = MEMORY[0x1E0C809B0];
    v123[1] = 3221225472;
    v123[2] = __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_108;
    v123[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v123[4] = v110;
    if (protocolKey_block_invoke_defaultOnce_106 != -1)
      dispatch_once(&protocolKey_block_invoke_defaultOnce_106, v123);
    if (protocolKey_block_invoke_classDebugEnabled_107)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("lookup failed at all stages. Protocol %@ Dest Port %@"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "lastPathComponent");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessPortMap pidAndProcessNameForDestAddress:withDestPort:withSourceAddress:withSourcePort:withProtocol:]_block_invoke_2");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v113, v114, 150);

      PLLogCommon();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      goto LABEL_90;
    }
  }
LABEL_91:

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v115 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_113;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v115;
    if (protocolKey_block_invoke_defaultOnce_111 != -1)
      dispatch_once(&protocolKey_block_invoke_defaultOnce_111, block);
    if (protocolKey_block_invoke_classDebugEnabled_112)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pidAndProcessName=%@"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "lastPathComponent");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessPortMap pidAndProcessNameForDestAddress:withDestPort:withSourceAddress:withSourcePort:withProtocol:]_block_invoke_2");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "logMessage:fromFile:fromFunction:fromLineNumber:", v116, v119, v120, 153);

      PLLogCommon();
      v121 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v121, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
}

uint64_t __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  protocolKey_block_invoke_classDebugEnabled = result;
  return result;
}

uint64_t __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_62(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  protocolKey_block_invoke_classDebugEnabled_61 = result;
  return result;
}

uint64_t __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_68(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  protocolKey_block_invoke_classDebugEnabled_67 = result;
  return result;
}

uint64_t __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_73(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  protocolKey_block_invoke_classDebugEnabled_72 = result;
  return result;
}

uint64_t __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_78(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  protocolKey_block_invoke_classDebugEnabled_77 = result;
  return result;
}

uint64_t __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_83(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  protocolKey_block_invoke_classDebugEnabled_82 = result;
  return result;
}

uint64_t __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_88(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  protocolKey_block_invoke_classDebugEnabled_87 = result;
  return result;
}

uint64_t __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_93(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  protocolKey_block_invoke_classDebugEnabled_92 = result;
  return result;
}

uint64_t __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_98(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  protocolKey_block_invoke_classDebugEnabled_97 = result;
  return result;
}

uint64_t __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_103(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  protocolKey_block_invoke_classDebugEnabled_102 = result;
  return result;
}

uint64_t __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_108(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  protocolKey_block_invoke_classDebugEnabled_107 = result;
  return result;
}

uint64_t __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_113(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  protocolKey_block_invoke_classDebugEnabled_112 = result;
  return result;
}

- (BOOL)isAddressIPV4:(id)a3
{
  return objc_msgSend(a3, "containsString:", CFSTR("."));
}

- (id)keyFromAddress:(id)a3 withPort:(id)a4 withSourceAddress:(id)a5 withSourcePort:(id)a6 withProtocol:(id)a7
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@_%@_%@_%@"), a7, a3, a4, a5, a6);
}

- (id)keyForlenientLookup:(id)a3 withPort:(id)a4 withProtocol:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@_%@"), a5, a3, a4);
}

- (id)keyForlocalPortLookup:(id)a3 withProtocol:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), a4, a3);
}

- (id)keyForIPAddrLookup:(id)a3 withSourceAddress:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), a3, a4);
}

- (id)dictFromNetPortInfo:(net_port_info *)a3
{
  unsigned __int16 var1;
  in_addr_4_6 *p_var7;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  char v17[46];
  char v18[46];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  var1 = a3->var1;
  if ((var1 & 1) != 0)
  {
    inet_ntop(2, &a3->var6, v18, 0x2Eu);
    p_var7 = &a3->var7;
    v6 = 2;
  }
  else
  {
    if ((var1 & 2) == 0)
    {
      v18[0] = 0;
      v17[0] = 0;
      goto LABEL_7;
    }
    inet_ntop(30, &a3->var6, v18, 0x2Eu);
    p_var7 = &a3->var7;
    v6 = 30;
  }
  inet_ntop(v6, p_var7, v17, 0x2Eu);
LABEL_7:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", bswap32(a3->var4) >> 16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", bswap32(a3->var5) >> 16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a3->var1 & 4) != 0)
    v11 = CFSTR("TCP");
  else
    v11 = CFSTR("UDP");
  v12 = v11;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v7, CFSTR("destIP"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v8, CFSTR("sourceIP"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "unsignedIntegerValue"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("destPort"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "unsignedIntegerValue"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("sourcePort"));

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("protocol"));
  return v13;
}

- (id)getLookupKeys:(id)a3
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

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("destIP"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sourceIP"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("destPort"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sourcePort"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("protocol"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLProcessPortMap keyFromAddress:withPort:withSourceAddress:withSourcePort:withProtocol:](self, "keyFromAddress:withPort:withSourceAddress:withSourcePort:withProtocol:", v6, v8, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLProcessPortMap keyForlenientLookup:withPort:withProtocol:](self, "keyForlenientLookup:withPort:withProtocol:", v6, v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLProcessPortMap keyForlocalPortLookup:withProtocol:](self, "keyForlocalPortLookup:withProtocol:", v8, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLProcessPortMap keyForIPAddrLookup:withSourceAddress:](self, "keyForIPAddrLookup:withSourceAddress:", v6, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("strictLookupKey"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("lenientLookupKey"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("localPortLookupKey"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("ipAddrLookupKey"));

  return v5;
}

- (void)clearPortMapInternal
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSMutableDictionary *strictLookupMap;
  NSMutableDictionary *lenientLookupMap;
  NSMutableDictionary *localPortOnlyLookupMap;
  NSMutableDictionary *ipAddrLookupMap;
  uint64_t block;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  uint64_t v18;

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __40__PLProcessPortMap_clearPortMapInternal__block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v3;
    if (clearPortMapInternal_defaultOnce != -1)
      dispatch_once(&clearPortMapInternal_defaultOnce, &block);
    if (clearPortMapInternal_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Clearing Pid:ProcPID map, old one: %@"), self->_strictLookupMap, block, v15, v16, v17, v18);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessPortMap clearPortMapInternal]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 253);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  strictLookupMap = self->_strictLookupMap;
  self->_strictLookupMap = 0;

  lenientLookupMap = self->_lenientLookupMap;
  self->_lenientLookupMap = 0;

  localPortOnlyLookupMap = self->_localPortOnlyLookupMap;
  self->_localPortOnlyLookupMap = 0;

  ipAddrLookupMap = self->_ipAddrLookupMap;
  self->_ipAddrLookupMap = 0;

}

uint64_t __40__PLProcessPortMap_clearPortMapInternal__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  clearPortMapInternal_classDebugEnabled = result;
  return result;
}

- (void)reconstructPortMapInternal
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _DWORD *v17;
  _DWORD *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSMutableDictionary *v31;
  NSMutableDictionary *strictLookupMap;
  NSMutableDictionary *v33;
  NSMutableDictionary *lenientLookupMap;
  NSMutableDictionary *v35;
  NSMutableDictionary *localPortOnlyLookupMap;
  NSMutableDictionary *v37;
  NSMutableDictionary *ipAddrLookupMap;
  unsigned int v39;
  const unsigned __int8 *v40;
  uint64_t v41;
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
  void *v53;
  void *v54;
  _DWORD *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  _QWORD v66[5];
  _QWORD v67[5];
  _QWORD v68[5];
  _QWORD v69[5];
  _QWORD v70[5];
  size_t v71;
  size_t v72;
  _QWORD block[5];
  char out[48];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__PLProcessPortMap_reconstructPortMapInternal__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (reconstructPortMapInternal_defaultOnce != -1)
      dispatch_once(&reconstructPortMapInternal_defaultOnce, block);
    if (reconstructPortMapInternal_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Starting rebuilding of Port Map"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessPortMap reconstructPortMapInternal]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 262);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  v71 = 0;
  v72 = 0;
  if (sysctlbyname("net.link.generic.system.port_used.list", 0, &v71, 0, 0))
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v10 = objc_opt_class();
      v70[0] = MEMORY[0x1E0C809B0];
      v70[1] = 3221225472;
      v70[2] = __46__PLProcessPortMap_reconstructPortMapInternal__block_invoke_141;
      v70[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v70[4] = v10;
      if (reconstructPortMapInternal_defaultOnce_139 != -1)
        dispatch_once(&reconstructPortMapInternal_defaultOnce_139, v70);
      if (reconstructPortMapInternal_classDebugEnabled_140)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to read buffer size, errno: %d"), *__error());
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "lastPathComponent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessPortMap reconstructPortMapInternal]");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 269);

        PLLogCommon();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
LABEL_15:

        return;
      }
    }
    return;
  }
  v17 = malloc_type_malloc(v71, 0x2175978DuLL);
  if (!v17)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v26 = objc_opt_class();
      v69[0] = MEMORY[0x1E0C809B0];
      v69[1] = 3221225472;
      v69[2] = __46__PLProcessPortMap_reconstructPortMapInternal__block_invoke_146;
      v69[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v69[4] = v26;
      if (reconstructPortMapInternal_defaultOnce_144 != -1)
        dispatch_once(&reconstructPortMapInternal_defaultOnce_144, v69);
      if (reconstructPortMapInternal_classDebugEnabled_145)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to allocate buffer"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "lastPathComponent");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessPortMap reconstructPortMapInternal]");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v29, v30, 275);

        PLLogCommon();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        goto LABEL_15;
      }
    }
    return;
  }
  v18 = v17;
  v72 = v71;
  if (sysctlbyname("net.link.generic.system.port_used.list", v17, &v72, 0, 0))
  {
    if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      goto LABEL_54;
    v19 = objc_opt_class();
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __46__PLProcessPortMap_reconstructPortMapInternal__block_invoke_151;
    v68[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v68[4] = v19;
    if (reconstructPortMapInternal_defaultOnce_149 != -1)
      dispatch_once(&reconstructPortMapInternal_defaultOnce_149, v68);
    if (!reconstructPortMapInternal_classDebugEnabled_150)
      goto LABEL_54;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to populate buffer, errno: %d"), *__error());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "lastPathComponent");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessPortMap reconstructPortMapInternal]");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v23, v24, 281);

    PLLogCommon();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
LABEL_24:

LABEL_54:
    free(v18);
    return;
  }
  v31 = (NSMutableDictionary *)objc_opt_new();
  strictLookupMap = self->_strictLookupMap;
  self->_strictLookupMap = v31;

  v33 = (NSMutableDictionary *)objc_opt_new();
  lenientLookupMap = self->_lenientLookupMap;
  self->_lenientLookupMap = v33;

  v35 = (NSMutableDictionary *)objc_opt_new();
  localPortOnlyLookupMap = self->_localPortOnlyLookupMap;
  self->_localPortOnlyLookupMap = v35;

  v37 = (NSMutableDictionary *)objc_opt_new();
  ipAddrLookupMap = self->_ipAddrLookupMap;
  self->_ipAddrLookupMap = v37;

  if (!v18[2])
  {
    if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      goto LABEL_54;
    v61 = objc_opt_class();
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __46__PLProcessPortMap_reconstructPortMapInternal__block_invoke_156;
    v67[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v67[4] = v61;
    if (reconstructPortMapInternal_defaultOnce_154 != -1)
      dispatch_once(&reconstructPortMapInternal_defaultOnce_154, v67);
    if (!reconstructPortMapInternal_classDebugEnabled_155)
      goto LABEL_54;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Port map is empty!"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "lastPathComponent");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessPortMap reconstructPortMapInternal]");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v64, v65, 296);

    PLLogCommon();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
    goto LABEL_24;
  }
  if (v18 + 43 <= (_DWORD *)((char *)v18 + v72))
  {
    v39 = 1;
    v40 = (const unsigned __int8 *)v18;
    do
    {
      memset(out, 0, 37);
      uuid_unparse(v40 + 44, out);
      v41 = *((unsigned int *)v40 + 25);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v40 + 121);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v41);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setPid:", v44);

      objc_msgSend(v43, "setProcessName:", v42);
      if (!(_DWORD)v41
        && (*((_WORD *)v40 + 17) & 8) != 0
        && (unsigned __int16)((bswap32(*((unsigned __int16 *)v40 + 30)) >> 16) - 319) <= 1u)
      {
        objc_msgSend(v43, "setProcessName:", CFSTR("TimeSync"));
      }
      -[PLProcessPortMap dictFromNetPortInfo:](self, "dictFromNetPortInfo:", v40 + 32);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLProcessPortMap getLookupKeys:](self, "getLookupKeys:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (v46)
      {
        -[PLProcessPortMap strictLookupMap](self, "strictLookupMap");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("strictLookupKey"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setObject:forKeyedSubscript:", v43, v48);

        -[PLProcessPortMap lenientLookupMap](self, "lenientLookupMap");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("lenientLookupKey"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setObject:forKeyedSubscript:", v43, v50);

        -[PLProcessPortMap localPortOnlyLookupMap](self, "localPortOnlyLookupMap");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("localPortLookupKey"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setObject:forKeyedSubscript:", v43, v52);

        -[PLProcessPortMap ipAddrLookupMap](self, "ipAddrLookupMap");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("ipAddrLookupKey"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setObject:forKeyedSubscript:", v43, v54);

      }
      if (v39 >= v18[2])
        break;
      v55 = v40 + 312;
      v40 += 140;
      ++v39;
    }
    while (v55 <= (_DWORD *)((char *)v18 + v72));
  }
  free(v18);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v56 = objc_opt_class();
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __46__PLProcessPortMap_reconstructPortMapInternal__block_invoke_164;
    v66[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v66[4] = v56;
    if (reconstructPortMapInternal_defaultOnce_162 != -1)
      dispatch_once(&reconstructPortMapInternal_defaultOnce_162, v66);
    if (reconstructPortMapInternal_classDebugEnabled_163)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Completed rebuilding Port Map"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/PLProcessPortMap.m");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "lastPathComponent");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessPortMap reconstructPortMapInternal]");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v59, v60, 340);

      PLLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      goto LABEL_15;
    }
  }
}

uint64_t __46__PLProcessPortMap_reconstructPortMapInternal__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reconstructPortMapInternal_classDebugEnabled = result;
  return result;
}

uint64_t __46__PLProcessPortMap_reconstructPortMapInternal__block_invoke_141(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reconstructPortMapInternal_classDebugEnabled_140 = result;
  return result;
}

uint64_t __46__PLProcessPortMap_reconstructPortMapInternal__block_invoke_146(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reconstructPortMapInternal_classDebugEnabled_145 = result;
  return result;
}

uint64_t __46__PLProcessPortMap_reconstructPortMapInternal__block_invoke_151(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reconstructPortMapInternal_classDebugEnabled_150 = result;
  return result;
}

uint64_t __46__PLProcessPortMap_reconstructPortMapInternal__block_invoke_156(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reconstructPortMapInternal_classDebugEnabled_155 = result;
  return result;
}

uint64_t __46__PLProcessPortMap_reconstructPortMapInternal__block_invoke_164(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reconstructPortMapInternal_classDebugEnabled_163 = result;
  return result;
}

- (NSMutableDictionary)strictLookupMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStrictLookupMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)lenientLookupMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLenientLookupMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableDictionary)localPortOnlyLookupMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLocalPortOnlyLookupMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableDictionary)ipAddrLookupMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIpAddrLookupMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setWorkQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_ipAddrLookupMap, 0);
  objc_storeStrong((id *)&self->_localPortOnlyLookupMap, 0);
  objc_storeStrong((id *)&self->_lenientLookupMap, 0);
  objc_storeStrong((id *)&self->_strictLookupMap, 0);
}

void __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
