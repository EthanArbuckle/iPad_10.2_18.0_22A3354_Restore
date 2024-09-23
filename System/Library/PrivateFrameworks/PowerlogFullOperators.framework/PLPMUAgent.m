@implementation PLPMUAgent

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLPMUAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return (id)MEMORY[0x24BDBD1B8];
}

+ (id)railDefinitions
{
  return (id)MEMORY[0x24BDBD1B8];
}

+ (id)accountingGroupDefinitions
{
  return (id)MEMORY[0x24BDBD1B8];
}

+ (id)entryEventPointDefinitions
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[7];
  _QWORD v30[7];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[3];
  uint64_t v35;
  _QWORD v36[3];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v35 = kPLPMUAgentSensors;
  v33[0] = *MEMORY[0x24BE751D0];
  v2 = *MEMORY[0x24BE751C8];
  v31[0] = *MEMORY[0x24BE751F8];
  v31[1] = v2;
  v32[0] = &unk_24EB64640;
  v32[1] = MEMORY[0x24BDBD1C8];
  v31[2] = *MEMORY[0x24BE751D8];
  v32[2] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v26;
  v33[1] = *MEMORY[0x24BE751E8];
  v29[0] = CFSTR("C-ich");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_RealFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v24;
  v29[1] = CFSTR("C-vbus");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_RealFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v22;
  v29[2] = CFSTR("C-ich_avg");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_RealFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v20;
  v29[3] = CFSTR("V-vbus");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_RealFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v18;
  v29[4] = CFSTR("V-adc_in7");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_RealFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v16;
  v29[5] = CFSTR("V-vbat");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_RealFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[5] = v14;
  v29[6] = CFSTR("V-vcc_main");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_RealFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30[6] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v5;
  v33[2] = *MEMORY[0x24BE751E0];
  v27[0] = CFSTR("value");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_RealFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = CFSTR("unit");
  v28[0] = v7;
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_StringFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventForwardDefinitions
{
  return (id)MEMORY[0x24BDBD1B8];
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x24BDBD1B8];
}

+ (id)entryEventIntervalDefinitions
{
  return (id)MEMORY[0x24BDBD1B8];
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x24BDBD1B8];
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x24BDBD1B8];
}

- (PLPMUAgent)init
{
  PLPMUAgent *v3;
  uint64_t v4;
  uint64_t v5;
  NSMutableDictionary *matchingSensors;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  CFArrayRef v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __IOHIDServiceClient *v17;
  void *v18;
  void *v19;
  NSMutableDictionary *v20;
  PLPMUAgent *v21;
  void *v22;
  PLPMUAgent *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  CFArrayRef v51;
  CFArrayRef v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t j;
  __IOHIDServiceClient *v57;
  void *v58;
  void *v59;
  NSMutableDictionary *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const __CFArray *v76;
  void *v77;
  void *v78;
  NSObject *v79;
  const __CFArray *obj;
  const __CFArray *obja;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _QWORD v86[5];
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _QWORD v91[5];
  _QWORD block[5];
  objc_super v93;
  _BYTE v94[128];
  _QWORD v95[2];
  _QWORD v96[2];
  _BYTE v97[128];
  _QWORD v98[2];
  _QWORD v99[4];

  v99[2] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(MEMORY[0x24BE74FD8], "isArchARM"))
  {
    v93.receiver = self;
    v93.super_class = (Class)PLPMUAgent;
    v3 = -[PLAgent init](&v93, sel_init);
    if (!v3)
    {
LABEL_51:
      self = v3;
      v23 = self;
      goto LABEL_52;
    }
    v4 = IOHIDEventSystemClientCreate();
    v3->hidEventSystem = (__IOHIDEventSystemClient *)v4;
    if (!v4)
    {
      if (!objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
        goto LABEL_51;
      v24 = objc_opt_class();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __18__PLPMUAgent_init__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v24;
      if (init_defaultOnce != -1)
        dispatch_once(&init_defaultOnce, block);
      if (!init_classDebugEnabled)
        goto LABEL_51;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PMU: could not create HIDEventSystem"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLPMUAgent.m");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "lastPathComponent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLPMUAgent init]");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v27, v28, 119);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[PLPMUAgent init].cold.1((uint64_t)v10, v12, v29, v30, v31, v32, v33, v34);
      goto LABEL_50;
    }
    v5 = objc_opt_new();
    matchingSensors = v3->matchingSensors;
    v3->matchingSensors = (NSMutableDictionary *)v5;

    v98[0] = CFSTR("PrimaryUsagePage");
    v7 = 0x24BDD1000uLL;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 65288);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v98[1] = CFSTR("PrimaryUsage");
    v99[0] = v8;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v99[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v99, v98, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    IOHIDEventSystemClientSetMatching();
    v11 = IOHIDEventSystemClientCopyServices(v3->hidEventSystem);
    v12 = v11;
    v79 = v11;
    if (v11)
    {
      v89 = 0u;
      v90 = 0u;
      v87 = 0u;
      v88 = 0u;
      obj = v11;
      v13 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
      if (v13)
      {
        v14 = v13;
        v78 = v10;
        v15 = *(_QWORD *)v88;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v88 != v15)
              objc_enumerationMutation(obj);
            v17 = *(__IOHIDServiceClient **)(*((_QWORD *)&v87 + 1) + 8 * i);
            v18 = (void *)IOHIDServiceClientCopyProperty(v17, CFSTR("Product"));
            v19 = v18;
            if (v18)
            {
              v20 = v3->matchingSensors;
              objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR("PMU "), CFSTR("V-"));
              v21 = v3;
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", v17, v22);

              v3 = v21;
            }

          }
          v14 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
        }
        while (v14);
        v10 = v78;
        v12 = v79;
        v7 = 0x24BDD1000;
      }
    }
    else
    {
      if (!objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
        goto LABEL_30;
      v35 = objc_opt_class();
      v91[0] = MEMORY[0x24BDAC760];
      v91[1] = 3221225472;
      v91[2] = __18__PLPMUAgent_init__block_invoke_45;
      v91[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v91[4] = v35;
      if (init_defaultOnce_43 != -1)
        dispatch_once(&init_defaultOnce_43, v91);
      if (!init_classDebugEnabled_44)
      {
LABEL_30:
        v95[0] = CFSTR("PrimaryUsagePage");
        objc_msgSend(*(id *)(v7 + 1760), "numberWithInt:", 65288);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v95[1] = CFSTR("PrimaryUsage");
        v96[0] = v48;
        objc_msgSend(*(id *)(v7 + 1760), "numberWithInt:", 2);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v96[1] = v49;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v96, v95, 2);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        IOHIDEventSystemClientSetMatching();
        v51 = IOHIDEventSystemClientCopyServices(v3->hidEventSystem);
        v52 = v51;
        if (v51)
        {
          v84 = 0u;
          v85 = 0u;
          v82 = 0u;
          v83 = 0u;
          obja = v51;
          v53 = -[__CFArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
          if (v53)
          {
            v54 = v53;
            v76 = v52;
            v77 = v50;
            v55 = *(_QWORD *)v83;
            do
            {
              for (j = 0; j != v54; ++j)
              {
                if (*(_QWORD *)v83 != v55)
                  objc_enumerationMutation(obja);
                v57 = *(__IOHIDServiceClient **)(*((_QWORD *)&v82 + 1) + 8 * j);
                v58 = (void *)IOHIDServiceClientCopyProperty(v57, CFSTR("Product"));
                v59 = v58;
                if (v58)
                {
                  v60 = v3->matchingSensors;
                  objc_msgSend(v58, "stringByReplacingOccurrencesOfString:withString:", CFSTR("PMU "), CFSTR("C-"));
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSMutableDictionary setObject:forKey:](v60, "setObject:forKey:", v57, v61);

                }
              }
              v54 = -[__CFArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
            }
            while (v54);
            v12 = v79;
            v52 = v76;
            v50 = v77;
          }
        }
        else
        {
          if (!objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
            goto LABEL_49;
          v62 = objc_opt_class();
          v86[0] = MEMORY[0x24BDAC760];
          v86[1] = 3221225472;
          v86[2] = __18__PLPMUAgent_init__block_invoke_56;
          v86[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v86[4] = v62;
          if (init_defaultOnce_54 != -1)
            dispatch_once(&init_defaultOnce_54, v86);
          if (!init_classDebugEnabled_55)
            goto LABEL_49;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR: PMU: Could not find any current sensors"));
          v63 = objc_claimAutoreleasedReturnValue();
          v64 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLPMUAgent.m");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "lastPathComponent");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLPMUAgent init]");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          obja = (const __CFArray *)v63;
          objc_msgSend(v64, "logMessage:fromFile:fromFunction:fromLineNumber:", v63, v66, v67, 149);

          PLLogCommon();
          v68 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
            -[PLPMUAgent init].cold.1(v63, v68, v69, v70, v71, v72, v73, v74);

          v12 = v79;
        }

LABEL_49:
LABEL_50:

        goto LABEL_51;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR: PMU: Could not find any voltage sensors"));
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLPMUAgent.m");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "lastPathComponent");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLPMUAgent init]");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      obj = (const __CFArray *)v36;
      objc_msgSend(v37, "logMessage:fromFile:fromFunction:fromLineNumber:", v36, v39, v40, 131);

      PLLogCommon();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        -[PLPMUAgent init].cold.1(v36, v41, v42, v43, v44, v45, v46, v47);

      v12 = 0;
    }

    goto LABEL_30;
  }
  v23 = 0;
LABEL_52:

  return v23;
}

uint64_t __18__PLPMUAgent_init__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  init_classDebugEnabled = result;
  return result;
}

uint64_t __18__PLPMUAgent_init__block_invoke_45(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  init_classDebugEnabled_44 = result;
  return result;
}

uint64_t __18__PLPMUAgent_init__block_invoke_56(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  init_classDebugEnabled_55 = result;
  return result;
}

- (void)initOperatorDependancies
{
  void *v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __38__PLPMUAgent_initOperatorDependancies__block_invoke;
  v4[3] = &unk_24EB5CDA0;
  v4[4] = self;
  objc_msgSend(MEMORY[0x24BE74FC8], "significantBatteryChangeNotificationWithOperator:withBlock:", self, v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPMUAgent setBatteryLevelChanged:](self, "setBatteryLevelChanged:", v3);

}

uint64_t __38__PLPMUAgent_initOperatorDependancies__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "log");
}

- (void)logEventPointSensors
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (self->matchingSensors)
  {
    +[PLOperator entryKeyForType:andName:](PLPMUAgent, "entryKeyForType:andName:", *MEMORY[0x24BE75230], kPLPMUAgentSensors);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74FB8]), "initWithEntryKey:", v13);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[NSMutableDictionary allKeys](self->matchingSensors, "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](self->matchingSensors, "objectForKeyedSubscript:", v9);

          v10 = IOHIDServiceClientCopyEvent();
          if (v10)
          {
            v11 = (const void *)v10;
            IOHIDEventGetFloatValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v9);

            CFRelease(v11);
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }

    -[PLOperator logEntry:](self, "logEntry:", v3);
  }
}

- (PLEntryNotificationOperatorComposition)batteryLevelChanged
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setBatteryLevelChanged:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryLevelChanged, 0);
  objc_storeStrong((id *)&self->sensorNamesV, 0);
  objc_storeStrong((id *)&self->sensorNamesC, 0);
  objc_storeStrong((id *)&self->matchingSensors, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_0(&dword_222C6D000, a2, a3, "%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
