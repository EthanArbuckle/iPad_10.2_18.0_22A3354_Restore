@implementation PLAWDWifiBT

+ (id)getSharedObjWithOperator:(id)a3
{
  void *v3;
  id v4;
  PLAWDWifiBT *v5;
  void *v6;

  v3 = (void *)plAwdWifiBT;
  if (!plAwdWifiBT)
  {
    v4 = a3;
    v5 = -[PLAWDAuxMetrics initWithOperator:]([PLAWDWifiBT alloc], "initWithOperator:", v4);

    v6 = (void *)plAwdWifiBT;
    plAwdWifiBT = (uint64_t)v5;

    v3 = (void *)plAwdWifiBT;
  }
  return v3;
}

+ (id)entryAggregateDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("AwdWifi");
  objc_msgSend(a1, "entryAggregateDefinitionAwdWifi");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("AwdBT");
  v8[0] = v3;
  objc_msgSend(a1, "entryAggregateDefinitionAwdBT");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)startMetricCollection:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD block[5];

  v4 = a3;
  v5 = objc_msgSend(v4, "longValue");
  if (v5 == 2031624)
  {
    -[PLAWDWifiBT startBtMetricCollection](self, "startBtMetricCollection");
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v13 = objc_opt_class();
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __37__PLAWDWifiBT_startMetricCollection___block_invoke_71;
      v19[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v19[4] = v13;
      if (startMetricCollection__defaultOnce_69 != -1)
        dispatch_once(&startMetricCollection__defaultOnce_69, v19);
      if (startMetricCollection__classDebugEnabled_70)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Start BT collection "), CFSTR("*******PLAWDMetricsService*******"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lastPathComponent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDWifiBT startMetricCollection:]");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v16, v17, 98);

        PLLogCommon();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();
        goto LABEL_15;
      }
    }
  }
  else if (v5 == 2031621)
  {
    -[PLAWDWifiBT startWifiMetricCollection](self, "startWifiMetricCollection");
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v6 = objc_opt_class();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __37__PLAWDWifiBT_startMetricCollection___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v6;
      if (startMetricCollection__defaultOnce_2 != -1)
        dispatch_once(&startMetricCollection__defaultOnce_2, block);
      if (startMetricCollection__classDebugEnabled_2)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Start Wifi collection "), CFSTR("*******PLAWDMetricsService*******"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "lastPathComponent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDWifiBT startMetricCollection:]");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 92);

        PLLogCommon();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();
LABEL_15:

      }
    }
  }
  -[PLAWDAuxMetrics runningMetrics](self, "runningMetrics");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v4);

}

uint64_t __37__PLAWDWifiBT_startMetricCollection___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  startMetricCollection__classDebugEnabled_2 = result;
  return result;
}

uint64_t __37__PLAWDWifiBT_startMetricCollection___block_invoke_71(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  startMetricCollection__classDebugEnabled_70 = result;
  return result;
}

- (void)stopMetricCollection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[5];
  _QWORD block[5];

  v4 = a3;
  -[PLAWDAuxMetrics runningMetrics](self, "runningMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  v6 = objc_msgSend(v4, "longValue");
  if (v6 == 2031624)
  {
    -[PLAWDWifiBT setBtEventCallback:](self, "setBtEventCallback:", 0);
    -[PLAWDWifiBT setBtPowerCallback:](self, "setBtPowerCallback:", 0);
    -[PLAWDWifiBT setBtRailCallback:](self, "setBtRailCallback:", 0);
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v14 = objc_opt_class();
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __36__PLAWDWifiBT_stopMetricCollection___block_invoke_78;
      v22[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v22[4] = v14;
      if (stopMetricCollection__defaultOnce_76 != -1)
        dispatch_once(&stopMetricCollection__defaultOnce_76, v22);
      if (stopMetricCollection__classDebugEnabled_77)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Stop BT collection "), CFSTR("*******PLAWDMetricsService*******"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lastPathComponent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDWifiBT stopMetricCollection:]");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v17, v18, 123);

        PLLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();
        goto LABEL_15;
      }
    }
  }
  else if (v6 == 2031621)
  {
    -[PLAWDWifiBT setWifiEventCallback:](self, "setWifiEventCallback:", 0);
    -[PLAWDWifiBT setWifiRailCallback:](self, "setWifiRailCallback:", 0);
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v7 = objc_opt_class();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __36__PLAWDWifiBT_stopMetricCollection___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v7;
      if (stopMetricCollection__defaultOnce_2 != -1)
        dispatch_once(&stopMetricCollection__defaultOnce_2, block);
      if (stopMetricCollection__classDebugEnabled_2)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Stop Wifi collection "), CFSTR("*******PLAWDMetricsService*******"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDWifiBT stopMetricCollection:]");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 116);

        PLLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();
LABEL_15:

      }
    }
  }
  -[PLAWDAuxMetrics runningMetrics](self, "runningMetrics");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (!v20)
  {
    v21 = (void *)plAwdWifiBT;
    plAwdWifiBT = 0;

  }
}

uint64_t __36__PLAWDWifiBT_stopMetricCollection___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  stopMetricCollection__classDebugEnabled_2 = result;
  return result;
}

uint64_t __36__PLAWDWifiBT_stopMetricCollection___block_invoke_78(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  stopMetricCollection__classDebugEnabled_77 = result;
  return result;
}

- (BOOL)submitDataToAWDServer:(id)a3 withAwdConn:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "longValue");
  if (v8 == 2031624)
  {
    -[PLAWDWifiBT submitBtDataToAWDServer:withAwdConn:](self, "submitBtDataToAWDServer:withAwdConn:", v6, v7);
  }
  else
  {
    if (v8 != 2031621)
    {
      v9 = 0;
      goto LABEL_7;
    }
    -[PLAWDWifiBT submitWiFiDataToAWDServer:withAwdConn:](self, "submitWiFiDataToAWDServer:withAwdConn:", v6, v7);
  }
  v9 = 1;
LABEL_7:

  return v9;
}

+ (id)entryAggregateDefinitionAwdWifi
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
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[4];
  _QWORD v26[6];

  v26[4] = *MEMORY[0x24BDAC8D0];
  v25[0] = *MEMORY[0x24BE751D0];
  v2 = *MEMORY[0x24BE751F0];
  v23[0] = *MEMORY[0x24BE751F8];
  v23[1] = v2;
  v24[0] = &unk_24EB64680;
  v24[1] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v15;
  v25[1] = *MEMORY[0x24BE751E8];
  v21[0] = CFSTR("WifiState");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_StringFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v3;
  v21[1] = CFSTR("Band");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v5;
  v21[2] = CFSTR("Value");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_RealFormat_aggregateFunction_sum");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v8;
  v25[2] = *MEMORY[0x24BE751A0];
  v19 = &unk_24EB64690;
  v17 = *MEMORY[0x24BE75198];
  v18 = &unk_24EB64690;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v10;
  v25[3] = *MEMORY[0x24BE751A8];
  v16 = CFSTR("Value");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)startWifiMetricCollection
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[PLAWDWifiBT setWifiSubmitCnt:](self, "setWifiSubmitCnt:", 0);
  -[PLAWDWifiBT resetWifiTable](self, "resetWifiTable");
  -[PLAWDWifiBT setIsWiFiRailStart:](self, "setIsWiFiRailStart:", 1);
  -[PLAWDWifiBT setIsWiFiStart:](self, "setIsWiFiStart:", 1);
  objc_msgSend(MEMORY[0x24BE752A0], "entryKeyForType:andName:", *MEMORY[0x24BE75210], *MEMORY[0x24BE753B8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE74FC8]);
  -[PLAWDAuxMetrics operator](self, "operator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __40__PLAWDWifiBT_startWifiMetricCollection__block_invoke;
  v8[3] = &unk_24EB5CDA0;
  v8[4] = self;
  v6 = (void *)objc_msgSend(v4, "initWithOperator:forEntryKey:withBlock:", v5, v3, v8);

  -[PLAWDWifiBT setWifiEventCallback:](self, "setWifiEventCallback:", v6);
  -[PLAWDWifiBT wifiEventCallback](self, "wifiEventCallback");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestEntry");

}

uint64_t __40__PLAWDWifiBT_startWifiMetricCollection__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleWifiCallback:", a2);
  return result;
}

- (void)resetWifiTable
{
  void *v3;
  objc_super v4;

  +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", *MEMORY[0x24BE75200], CFSTR("AwdWifi"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4.receiver = self;
  v4.super_class = (Class)PLAWDWifiBT;
  -[PLAWDAuxMetrics resetTableWithEntryKey:](&v4, sel_resetTableWithEntryKey_, v3);

}

- (void)addEntryToWiFiTable:(id)a3 withValue:(double)a4 andBand:(id)a5
{
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = *MEMORY[0x24BE75200];
  v9 = a5;
  v10 = a3;
  +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", v8, CFSTR("AwdWifi"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74FB8]), "initWithEntryKey:", v14);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("WifiState"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("Value"));

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("Band"));
  -[PLAWDAuxMetrics operator](self, "operator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "logEntry:", v11);

}

- (void)handleWifiCallback:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  const __CFString *v27;
  void *v28;
  double v29;
  double v30;
  uint64_t v31;
  _QWORD *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  uint64_t v48;
  _QWORD *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  uint64_t v59;
  _QWORD *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  double v71;
  double v72;
  void *v73;
  double v74;
  void *v75;
  double v76;
  double v77;
  uint64_t v78;
  _QWORD *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  NSObject *v88;
  void *v89;
  void *v90;
  double v91;
  double v92;
  uint64_t v93;
  _QWORD *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  NSObject *v103;
  void *v104;
  void *v105;
  double v106;
  double v107;
  uint64_t v108;
  _QWORD *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  NSObject *v118;
  void *v119;
  void *v120;
  double v121;
  void *v122;
  double v123;
  void *v124;
  double v125;
  void *v126;
  double v127;
  void *v128;
  double v129;
  id v130;
  void *v131;
  double v132;
  uint64_t v133;
  _QWORD *v134;
  void *v135;
  void *v136;
  uint64_t v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  NSObject *v143;
  uint64_t v144;
  _QWORD *v145;
  void *v146;
  void *v147;
  uint64_t v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  NSObject *v154;
  uint64_t v155;
  _QWORD *v156;
  void *v157;
  void *v158;
  uint64_t v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  NSObject *v165;
  uint64_t v166;
  _QWORD *v167;
  void *v168;
  void *v169;
  uint64_t v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  NSObject *v176;
  uint64_t v177;
  _QWORD *v178;
  void *v179;
  void *v180;
  uint64_t v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  NSObject *v187;
  uint64_t v188;
  _QWORD *v189;
  void *v190;
  void *v191;
  uint64_t v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  NSObject *v198;
  uint64_t v199;
  _QWORD *v200;
  void *v201;
  void *v202;
  uint64_t v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  NSObject *v209;
  void *v210;
  double v211;
  double v212;
  void *v213;
  double v214;
  double v215;
  void *v216;
  double v217;
  double v218;
  void *v219;
  double v220;
  double v221;
  void *v222;
  double v223;
  double v224;
  void *v225;
  double v226;
  double v227;
  void *v228;
  double v229;
  void *v230;
  double v231;
  double v232;
  void *v233;
  void *v234;
  double v235;
  double v236;
  void *v237;
  void *v238;
  double v239;
  double v240;
  void *v241;
  double v242;
  double v243;
  void *v244;
  double v245;
  double v246;
  void *v247;
  double v248;
  double v249;
  const __CFString *v250;
  PLAWDWifiBT *v251;
  id v252;
  _QWORD v253[5];
  _QWORD v254[5];
  _QWORD v255[5];
  _QWORD v256[5];
  _QWORD v257[5];
  _QWORD v258[5];
  _QWORD v259[5];
  _QWORD v260[5];
  _QWORD v261[5];
  _QWORD v262[5];
  _QWORD v263[5];
  _QWORD v264[5];
  _QWORD v265[5];
  _QWORD block[5];
  objc_super v267;
  _QWORD v268[6];

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("entry"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_146;
  if (-[PLAWDWifiBT isWiFiStart](self, "isWiFiStart"))
  {
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v6 = objc_opt_class();
      v268[0] = MEMORY[0x24BDAC760];
      v268[1] = 3221225472;
      v268[2] = __34__PLAWDWifiBT_handleWifiCallback___block_invoke;
      v268[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v268[4] = v6;
      v7 = v268;
      if (handleWifiCallback__defaultOnce != -1)
        dispatch_once(&handleWifiCallback__defaultOnce, v7);

      if (handleWifiCallback__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Wifi first DiffProperty entry"), CFSTR("*******PLAWDMetricsService*******"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDWifiBT handleWifiCallback:]");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 243);

        PLLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();

      }
    }
    -[PLAWDWifiBT setIsWiFiStart:](self, "setIsWiFiStart:", 0);
    v267.receiver = self;
    v267.super_class = (Class)PLAWDWifiBT;
    if (-[PLAWDAuxMetrics dropFirstEntryReceived:usingFilter:andStartTime:](&v267, sel_dropFirstEntryReceived_usingFilter_andStartTime_, v5, 0, 0))
    {
      if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v14 = objc_opt_class();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __34__PLAWDWifiBT_handleWifiCallback___block_invoke_98;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v14;
        if (handleWifiCallback__defaultOnce_96 != -1)
          dispatch_once(&handleWifiCallback__defaultOnce_96, block);
        if (handleWifiCallback__classDebugEnabled_97)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Wifi DiffProperty first entry - dropped - %@"), CFSTR("*******PLAWDMetricsService*******"), v5);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "lastPathComponent");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDWifiBT handleWifiCallback:]");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 248);

          PLLogCommon();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            -[PLAWDDisplay startMetricCollection:].cold.1();

          goto LABEL_145;
        }
      }
      goto LABEL_146;
    }
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CurrentChannel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "doubleValue");
  v23 = v22;

  if (v23 <= 13.0)
  {
    v27 = CFSTR("band_2p4_ghz");
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CurrentBandwidth"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doubleValue");
    v26 = v25;

    if (v26 == 20.0)
    {
      v27 = CFSTR("band_5p02_ghz");
    }
    else
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CurrentBandwidth"));
      v241 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v241, "doubleValue");
      v243 = v242;

      if (v243 == 40.0)
      {
        v27 = CFSTR("band_5p04_ghz");
      }
      else
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CurrentBandwidth"));
        v244 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v244, "doubleValue");
        v246 = v245;

        if (v246 == 80.0)
          v27 = CFSTR("band_5p08_ghz");
        else
          v27 = 0;
      }
    }
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("TimeDuration"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "doubleValue");
  v30 = v29;

  if (v30 > 0.0)
  {
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v31 = objc_opt_class();
      v265[0] = MEMORY[0x24BDAC760];
      v265[1] = 3221225472;
      v265[2] = __34__PLAWDWifiBT_handleWifiCallback___block_invoke_109;
      v265[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v265[4] = v31;
      v32 = v265;
      if (handleWifiCallback__defaultOnce_107 != -1)
        dispatch_once(&handleWifiCallback__defaultOnce_107, v32);

      if (handleWifiCallback__classDebugEnabled_108)
      {
        v33 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("TimeDuration"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "doubleValue");
        objc_msgSend(v33, "stringWithFormat:", CFSTR("kPLWATimeDuration = %f"), v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v37 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "lastPathComponent");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDWifiBT handleWifiCallback:]");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "logMessage:fromFile:fromFunction:fromLineNumber:", v36, v39, v40, 266);

        PLLogCommon();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();

      }
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("TimeDuration"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "doubleValue");
    -[PLAWDWifiBT addEntryToWiFiTable:withValue:andBand:](self, "addEntryToWiFiTable:withValue:andBand:", CFSTR("WifiTotalDuration"), v27);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PMDuration"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "doubleValue");
  if (v44 == 0.0)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MPCDuration"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "doubleValue");
    v47 = v46;

    if (v47 == 0.0)
      goto LABEL_50;
  }
  else
  {

  }
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v48 = objc_opt_class();
    v264[0] = MEMORY[0x24BDAC760];
    v264[1] = 3221225472;
    v264[2] = __34__PLAWDWifiBT_handleWifiCallback___block_invoke_118;
    v264[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v264[4] = v48;
    v49 = v264;
    if (handleWifiCallback__defaultOnce_116 != -1)
      dispatch_once(&handleWifiCallback__defaultOnce_116, v49);

    if (handleWifiCallback__classDebugEnabled_117)
    {
      v50 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PMDuration"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "doubleValue");
      objc_msgSend(v50, "stringWithFormat:", CFSTR("kPLWAPMDuration = %f"), v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      v54 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "lastPathComponent");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDWifiBT handleWifiCallback:]");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "logMessage:fromFile:fromFunction:fromLineNumber:", v53, v56, v57, 273);

      PLLogCommon();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v59 = objc_opt_class();
    v263[0] = MEMORY[0x24BDAC760];
    v263[1] = 3221225472;
    v263[2] = __34__PLAWDWifiBT_handleWifiCallback___block_invoke_123;
    v263[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v263[4] = v59;
    v60 = v263;
    if (handleWifiCallback__defaultOnce_121 != -1)
      dispatch_once(&handleWifiCallback__defaultOnce_121, v60);

    if (handleWifiCallback__classDebugEnabled_122)
    {
      v61 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MPCDuration"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "doubleValue");
      objc_msgSend(v61, "stringWithFormat:", CFSTR("kPLWAMPCDuration = %f"), v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      v65 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "lastPathComponent");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDWifiBT handleWifiCallback:]");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "logMessage:fromFile:fromFunction:fromLineNumber:", v64, v67, v68, 274);

      PLLogCommon();
      v69 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PMDuration"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "doubleValue");
  v72 = v71;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MPCDuration"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "doubleValue");
  -[PLAWDWifiBT addEntryToWiFiTable:withValue:andBand:](self, "addEntryToWiFiTable:withValue:andBand:", CFSTR("WifiSleepTime"), v27, v72 + v74);

LABEL_50:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("TXDuration"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "doubleValue");
  v77 = v76;

  if (v77 > 0.0)
  {
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v78 = objc_opt_class();
      v262[0] = MEMORY[0x24BDAC760];
      v262[1] = 3221225472;
      v262[2] = __34__PLAWDWifiBT_handleWifiCallback___block_invoke_130;
      v262[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v262[4] = v78;
      v79 = v262;
      if (handleWifiCallback__defaultOnce_128 != -1)
        dispatch_once(&handleWifiCallback__defaultOnce_128, v79);

      if (handleWifiCallback__classDebugEnabled_129)
      {
        v80 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("TXDuration"));
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "doubleValue");
        objc_msgSend(v80, "stringWithFormat:", CFSTR("kPLWATXDuration = %f"), v82);
        v83 = (void *)objc_claimAutoreleasedReturnValue();

        v84 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "lastPathComponent");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDWifiBT handleWifiCallback:]");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "logMessage:fromFile:fromFunction:fromLineNumber:", v83, v86, v87, 281);

        PLLogCommon();
        v88 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();

      }
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("TXDuration"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "doubleValue");
    -[PLAWDWifiBT addEntryToWiFiTable:withValue:andBand:](self, "addEntryToWiFiTable:withValue:andBand:", CFSTR("WifiTxDuration"), v27);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RXDuration"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "doubleValue");
  v92 = v91;

  if (v92 > 0.0)
  {
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v93 = objc_opt_class();
      v261[0] = MEMORY[0x24BDAC760];
      v261[1] = 3221225472;
      v261[2] = __34__PLAWDWifiBT_handleWifiCallback___block_invoke_137;
      v261[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v261[4] = v93;
      v94 = v261;
      if (handleWifiCallback__defaultOnce_135 != -1)
        dispatch_once(&handleWifiCallback__defaultOnce_135, v94);

      if (handleWifiCallback__classDebugEnabled_136)
      {
        v95 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RXDuration"));
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "doubleValue");
        objc_msgSend(v95, "stringWithFormat:", CFSTR("kPLWARXDuration = %f"), v97);
        v98 = (void *)objc_claimAutoreleasedReturnValue();

        v99 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "lastPathComponent");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDWifiBT handleWifiCallback:]");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "logMessage:fromFile:fromFunction:fromLineNumber:", v98, v101, v102, 288);

        PLLogCommon();
        v103 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v103, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();

      }
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RXDuration"));
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "doubleValue");
    -[PLAWDWifiBT addEntryToWiFiTable:withValue:andBand:](self, "addEntryToWiFiTable:withValue:andBand:", CFSTR("WifiRxDuration"), v27);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HSICActiveDuration"));
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "doubleValue");
  v107 = v106;

  if (v107 > 0.0)
  {
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v108 = objc_opt_class();
      v260[0] = MEMORY[0x24BDAC760];
      v260[1] = 3221225472;
      v260[2] = __34__PLAWDWifiBT_handleWifiCallback___block_invoke_144;
      v260[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v260[4] = v108;
      v109 = v260;
      if (handleWifiCallback__defaultOnce_142 != -1)
        dispatch_once(&handleWifiCallback__defaultOnce_142, v109);

      if (handleWifiCallback__classDebugEnabled_143)
      {
        v110 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HSICActiveDuration"));
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "doubleValue");
        objc_msgSend(v110, "stringWithFormat:", CFSTR("kPLWATXDuration = %f"), v112);
        v113 = (void *)objc_claimAutoreleasedReturnValue();

        v114 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v115, "lastPathComponent");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDWifiBT handleWifiCallback:]");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "logMessage:fromFile:fromFunction:fromLineNumber:", v113, v116, v117, 295);

        PLLogCommon();
        v118 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v118, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();

      }
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HSICActiveDuration"));
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "doubleValue");
    -[PLAWDWifiBT addEntryToWiFiTable:withValue:andBand:](self, "addEntryToWiFiTable:withValue:andBand:", CFSTR("WifiHsicDuration"), v27);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PNOScanSSIDDuration"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "doubleValue");
  if (v121 == 0.0)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PNOBSSIDDuration"));
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "doubleValue");
    if (v123 == 0.0)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RoamScanDuration"));
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "doubleValue");
      if (v125 == 0.0)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AssociatedScanDuration"));
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "doubleValue");
        if (v127 == 0.0)
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("OtherScanDuration"));
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v128, "doubleValue");
          if (v129 == 0.0)
          {
            v250 = v27;
            v251 = self;
            v130 = v4;
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("UserScanDuration"));
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v131, "doubleValue");
            if (v132 == 0.0)
            {
              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ScanDuration"));
              v247 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v247, "doubleValue");
              v249 = v248;

              v4 = v130;
              v27 = v250;
              self = v251;
              if (v249 == 0.0)
                goto LABEL_139;
              goto LABEL_89;
            }

            v4 = v130;
            v27 = v250;
          }

        }
      }

    }
  }

LABEL_89:
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v133 = objc_opt_class();
    v259[0] = MEMORY[0x24BDAC760];
    v259[1] = 3221225472;
    v259[2] = __34__PLAWDWifiBT_handleWifiCallback___block_invoke_161;
    v259[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v259[4] = v133;
    v134 = v259;
    if (handleWifiCallback__defaultOnce_159 != -1)
      dispatch_once(&handleWifiCallback__defaultOnce_159, v134);

    if (handleWifiCallback__classDebugEnabled_160)
    {
      v135 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PNOScanSSIDDuration"));
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "doubleValue");
      objc_msgSend(v135, "stringWithFormat:", CFSTR("kPLWAPNOScanSSIDDuration = %f"), v137);
      v138 = (void *)objc_claimAutoreleasedReturnValue();

      v139 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "lastPathComponent");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDWifiBT handleWifiCallback:]");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "logMessage:fromFile:fromFunction:fromLineNumber:", v138, v141, v142, 305);

      PLLogCommon();
      v143 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v143, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v144 = objc_opt_class();
    v258[0] = MEMORY[0x24BDAC760];
    v258[1] = 3221225472;
    v258[2] = __34__PLAWDWifiBT_handleWifiCallback___block_invoke_166;
    v258[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v258[4] = v144;
    v145 = v258;
    if (handleWifiCallback__defaultOnce_164 != -1)
      dispatch_once(&handleWifiCallback__defaultOnce_164, v145);

    if (handleWifiCallback__classDebugEnabled_165)
    {
      v146 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PNOBSSIDDuration"));
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "doubleValue");
      objc_msgSend(v146, "stringWithFormat:", CFSTR("kPLWAPNOScanBSSIDDuration = %f"), v148);
      v149 = (void *)objc_claimAutoreleasedReturnValue();

      v150 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v151, "lastPathComponent");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDWifiBT handleWifiCallback:]");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v150, "logMessage:fromFile:fromFunction:fromLineNumber:", v149, v152, v153, 306);

      PLLogCommon();
      v154 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v154, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v155 = objc_opt_class();
    v257[0] = MEMORY[0x24BDAC760];
    v257[1] = 3221225472;
    v257[2] = __34__PLAWDWifiBT_handleWifiCallback___block_invoke_171;
    v257[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v257[4] = v155;
    v156 = v257;
    if (handleWifiCallback__defaultOnce_169 != -1)
      dispatch_once(&handleWifiCallback__defaultOnce_169, v156);

    if (handleWifiCallback__classDebugEnabled_170)
    {
      v157 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RoamScanDuration"));
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v158, "doubleValue");
      objc_msgSend(v157, "stringWithFormat:", CFSTR("kPLWARoamScanDuration = %f"), v159);
      v160 = (void *)objc_claimAutoreleasedReturnValue();

      v161 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m");
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v162, "lastPathComponent");
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDWifiBT handleWifiCallback:]");
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v161, "logMessage:fromFile:fromFunction:fromLineNumber:", v160, v163, v164, 307);

      PLLogCommon();
      v165 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v165, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v166 = objc_opt_class();
    v256[0] = MEMORY[0x24BDAC760];
    v256[1] = 3221225472;
    v256[2] = __34__PLAWDWifiBT_handleWifiCallback___block_invoke_176;
    v256[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v256[4] = v166;
    v167 = v256;
    if (handleWifiCallback__defaultOnce_174 != -1)
      dispatch_once(&handleWifiCallback__defaultOnce_174, v167);

    if (handleWifiCallback__classDebugEnabled_175)
    {
      v168 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AssociatedScanDuration"));
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v169, "doubleValue");
      objc_msgSend(v168, "stringWithFormat:", CFSTR("kPLWAAssociatedScanDuration = %f"), v170);
      v171 = (void *)objc_claimAutoreleasedReturnValue();

      v172 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m");
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v173, "lastPathComponent");
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDWifiBT handleWifiCallback:]");
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v172, "logMessage:fromFile:fromFunction:fromLineNumber:", v171, v174, v175, 308);

      PLLogCommon();
      v176 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v176, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v177 = objc_opt_class();
    v255[0] = MEMORY[0x24BDAC760];
    v255[1] = 3221225472;
    v255[2] = __34__PLAWDWifiBT_handleWifiCallback___block_invoke_181;
    v255[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v255[4] = v177;
    v178 = v255;
    if (handleWifiCallback__defaultOnce_179 != -1)
      dispatch_once(&handleWifiCallback__defaultOnce_179, v178);

    if (handleWifiCallback__classDebugEnabled_180)
    {
      v179 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("OtherScanDuration"));
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v180, "doubleValue");
      objc_msgSend(v179, "stringWithFormat:", CFSTR("kPLWAOtherScanDuration = %f"), v181);
      v182 = (void *)objc_claimAutoreleasedReturnValue();

      v183 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m");
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v184, "lastPathComponent");
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDWifiBT handleWifiCallback:]");
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v183, "logMessage:fromFile:fromFunction:fromLineNumber:", v182, v185, v186, 309);

      PLLogCommon();
      v187 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v187, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v188 = objc_opt_class();
    v254[0] = MEMORY[0x24BDAC760];
    v254[1] = 3221225472;
    v254[2] = __34__PLAWDWifiBT_handleWifiCallback___block_invoke_186;
    v254[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v254[4] = v188;
    v189 = v254;
    if (handleWifiCallback__defaultOnce_184 != -1)
      dispatch_once(&handleWifiCallback__defaultOnce_184, v189);

    if (handleWifiCallback__classDebugEnabled_185)
    {
      v190 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("UserScanDuration"));
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v191, "doubleValue");
      objc_msgSend(v190, "stringWithFormat:", CFSTR("kPLWAUserScanDuration = %f"), v192);
      v193 = (void *)objc_claimAutoreleasedReturnValue();

      v194 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m");
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v195, "lastPathComponent");
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDWifiBT handleWifiCallback:]");
      v197 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v194, "logMessage:fromFile:fromFunction:fromLineNumber:", v193, v196, v197, 310);

      PLLogCommon();
      v198 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v198, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }
  v252 = v4;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v199 = objc_opt_class();
    v253[0] = MEMORY[0x24BDAC760];
    v253[1] = 3221225472;
    v253[2] = __34__PLAWDWifiBT_handleWifiCallback___block_invoke_191;
    v253[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v253[4] = v199;
    v200 = v253;
    if (handleWifiCallback__defaultOnce_189 != -1)
      dispatch_once(&handleWifiCallback__defaultOnce_189, v200);

    if (handleWifiCallback__classDebugEnabled_190)
    {
      v201 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ScanDuration"));
      v202 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v202, "doubleValue");
      objc_msgSend(v201, "stringWithFormat:", CFSTR("kPLWAScanDuration = %f"), v203);
      v204 = (void *)objc_claimAutoreleasedReturnValue();

      v205 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m");
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v206, "lastPathComponent");
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDWifiBT handleWifiCallback:]");
      v208 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "logMessage:fromFile:fromFunction:fromLineNumber:", v204, v207, v208, 311);

      PLLogCommon();
      v209 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v209, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PNOScanSSIDDuration"));
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v210, "doubleValue");
  v212 = v211;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PNOBSSIDDuration"));
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v213, "doubleValue");
  v215 = v212 + v214;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RoamScanDuration"));
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v216, "doubleValue");
  v218 = v215 + v217;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AssociatedScanDuration"));
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v219, "doubleValue");
  v221 = v218 + v220;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("OtherScanDuration"));
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v222, "doubleValue");
  v224 = v221 + v223;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("UserScanDuration"));
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v225, "doubleValue");
  v227 = v224 + v226;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ScanDuration"));
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v228, "doubleValue");
  -[PLAWDWifiBT addEntryToWiFiTable:withValue:andBand:](self, "addEntryToWiFiTable:withValue:andBand:", CFSTR("WifiScanDuration"), v27, v227 + v229);

  v4 = v252;
LABEL_139:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FRTSDuration"));
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v230, "doubleValue");
  v232 = v231;

  if (v232 > 0.0)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FRTSDuration"));
    v233 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v233, "doubleValue");
    -[PLAWDWifiBT addEntryToWiFiTable:withValue:andBand:](self, "addEntryToWiFiTable:withValue:andBand:", CFSTR("WifiFrtsDuration"), v27);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PCIESuspendDuration"));
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v234, "doubleValue");
  v236 = v235;

  if (v236 > 0.0)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PCIESuspendDuration"));
    v237 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v237, "doubleValue");
    -[PLAWDWifiBT addEntryToWiFiTable:withValue:andBand:](self, "addEntryToWiFiTable:withValue:andBand:", CFSTR("WifiPcieSuspendDuration"), v27);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PCIEActiveDuration"));
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v238, "doubleValue");
  v240 = v239;

  if (v240 > 0.0)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PCIEActiveDuration"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    -[PLAWDWifiBT addEntryToWiFiTable:withValue:andBand:](self, "addEntryToWiFiTable:withValue:andBand:", CFSTR("WifiPcieActiveDuration"), v27);
LABEL_145:

  }
LABEL_146:

}

uint64_t __34__PLAWDWifiBT_handleWifiCallback___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleWifiCallback__classDebugEnabled = result;
  return result;
}

uint64_t __34__PLAWDWifiBT_handleWifiCallback___block_invoke_98(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleWifiCallback__classDebugEnabled_97 = result;
  return result;
}

uint64_t __34__PLAWDWifiBT_handleWifiCallback___block_invoke_109(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleWifiCallback__classDebugEnabled_108 = result;
  return result;
}

uint64_t __34__PLAWDWifiBT_handleWifiCallback___block_invoke_118(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleWifiCallback__classDebugEnabled_117 = result;
  return result;
}

uint64_t __34__PLAWDWifiBT_handleWifiCallback___block_invoke_123(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleWifiCallback__classDebugEnabled_122 = result;
  return result;
}

uint64_t __34__PLAWDWifiBT_handleWifiCallback___block_invoke_130(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleWifiCallback__classDebugEnabled_129 = result;
  return result;
}

uint64_t __34__PLAWDWifiBT_handleWifiCallback___block_invoke_137(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleWifiCallback__classDebugEnabled_136 = result;
  return result;
}

uint64_t __34__PLAWDWifiBT_handleWifiCallback___block_invoke_144(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleWifiCallback__classDebugEnabled_143 = result;
  return result;
}

uint64_t __34__PLAWDWifiBT_handleWifiCallback___block_invoke_161(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleWifiCallback__classDebugEnabled_160 = result;
  return result;
}

uint64_t __34__PLAWDWifiBT_handleWifiCallback___block_invoke_166(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleWifiCallback__classDebugEnabled_165 = result;
  return result;
}

uint64_t __34__PLAWDWifiBT_handleWifiCallback___block_invoke_171(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleWifiCallback__classDebugEnabled_170 = result;
  return result;
}

uint64_t __34__PLAWDWifiBT_handleWifiCallback___block_invoke_176(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleWifiCallback__classDebugEnabled_175 = result;
  return result;
}

uint64_t __34__PLAWDWifiBT_handleWifiCallback___block_invoke_181(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleWifiCallback__classDebugEnabled_180 = result;
  return result;
}

uint64_t __34__PLAWDWifiBT_handleWifiCallback___block_invoke_186(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleWifiCallback__classDebugEnabled_185 = result;
  return result;
}

uint64_t __34__PLAWDWifiBT_handleWifiCallback___block_invoke_191(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleWifiCallback__classDebugEnabled_190 = result;
  return result;
}

- (BOOL)submitWiFiDataToAWDServer:(id)a3 withAwdConn:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  const __CFString *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  id v42;
  void *v43;
  void *v44;
  double v45;
  id v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  NSObject *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  char v75;
  void *v77;
  void *v78;
  PLAWDWifiBT *v79;
  NSObject *v80;
  void *v81;
  id v82;
  _QWORD v83[5];
  _QWORD v84[5];
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD block[5];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)objc_msgSend(v6, "newMetricContainerWithIdentifier:", objc_msgSend(a3, "unsignedIntValue"));
  if (v7)
  {
    -[PLAWDWifiBT wifiEventCallback](self, "wifiEventCallback");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "requestEntry");

    sleep(5u);
    objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDateWithTimeIntervalSinceNow:", -86400.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSince1970");
    v12 = v11;
    objc_msgSend(v10, "timeIntervalSince1970");
    v14 = v13 - v12;

    +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", *MEMORY[0x24BE75200], CFSTR("AwdWifi"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAWDAuxMetrics operator](self, "operator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "storage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v15, 86400.0, v12, v14);
    v18 = objc_claimAutoreleasedReturnValue();

    v80 = v18;
    objc_msgSend(MEMORY[0x24BE74FB8], "summarizeAggregateEntries:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_opt_new();
    v81 = v19;
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v21 = objc_opt_class();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __53__PLAWDWifiBT_submitWiFiDataToAWDServer_withAwdConn___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v21;
      if (submitWiFiDataToAWDServer_withAwdConn__defaultOnce != -1)
        dispatch_once(&submitWiFiDataToAWDServer_withAwdConn__defaultOnce, block);
      if (submitWiFiDataToAWDServer_withAwdConn__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : %@"), CFSTR("*******PLAWDMetricsService*******"), v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "lastPathComponent");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDWifiBT submitWiFiDataToAWDServer:withAwdConn:]");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "logMessage:fromFile:fromFunction:fromLineNumber:", v22, v25, v26, 357);

        PLLogCommon();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();

        v19 = v81;
      }
    }
    if (v20)
    {
      v77 = v15;
      v78 = v7;
      v79 = self;
      objc_msgSend(v20, "setTimestamp:", 0);
      objc_msgSend(v20, "setWifi2P4GHzRxDuration:", 0);
      objc_msgSend(v20, "setWifi2P4GHzTxDuration:", 0);
      objc_msgSend(v20, "setWifi5GHz20MHzRxDuration:", 0);
      objc_msgSend(v20, "setWifi5GHz20MHzTxDuration:", 0);
      objc_msgSend(v20, "setWifi5GHz40MHzRxDuration:", 0);
      objc_msgSend(v20, "setWifi5GHz40MHzTxDuration:", 0);
      objc_msgSend(v20, "setWifi5GHz80MHzRxDuration:", 0);
      objc_msgSend(v20, "setWifi5GHz80MHzTxDuration:", 0);
      objc_msgSend(v20, "setWifiFRTSDuration:", 0);
      objc_msgSend(v20, "setWifiHsicActiveDuration:", 0);
      objc_msgSend(v20, "setWifiPcieL0Duration:", 0);
      objc_msgSend(v20, "setWifiPcieL10Duration:", 0);
      objc_msgSend(v20, "setWifiPcieL11Duration:", 0);
      objc_msgSend(v20, "setWifiPcieL12Duration:", 0);
      objc_msgSend(v20, "setWifiScanDuration:", 0);
      objc_msgSend(v20, "setWifiSleepDuration:", 0);
      objc_msgSend(v20, "setWifiTotalDuration:", 0);
      objc_msgSend(v20, "setWifiTotalPowerMicroWatt:", 0);
      objc_msgSend(v20, "setTimestamp:", objc_msgSend(v6, "getAWDTimestamp"));
      v87 = 0u;
      v88 = 0u;
      v85 = 0u;
      v86 = 0u;
      v28 = v19;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v85, v90, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v86;
        v32 = CFSTR("WifiPcieActiveDuration");
        v82 = v28;
        do
        {
          v33 = 0;
          do
          {
            v34 = v32;
            if (*(_QWORD *)v86 != v31)
              objc_enumerationMutation(v28);
            v35 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v33);
            v36 = objc_alloc(MEMORY[0x24BDD17C8]);
            objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("WifiState"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = (void *)objc_msgSend(v36, "initWithFormat:", CFSTR("%@"), v37);

            if (objc_msgSend(v38, "isEqualToString:", CFSTR("WifiTotalDuration")))
            {
              objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("Value"));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "doubleValue");
              objc_msgSend(v20, "setWifiTotalDuration:", v40);
LABEL_29:

              v32 = v34;
              goto LABEL_30;
            }
            if (objc_msgSend(v38, "isEqualToString:", CFSTR("WifiScanDuration")))
            {
              objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("Value"));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "doubleValue");
              objc_msgSend(v20, "setWifiScanDuration:", v41);
              goto LABEL_29;
            }
            if (objc_msgSend(v38, "isEqualToString:", CFSTR("WifiTxDuration")))
            {
              v42 = objc_alloc(MEMORY[0x24BDD17C8]);
              objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("Band"));
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = (void *)objc_msgSend(v42, "initWithFormat:", CFSTR("%@"), v43);

              if (objc_msgSend(v39, "isEqualToString:", CFSTR("band_2p4_ghz")))
              {
                objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("Value"));
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "doubleValue");
                objc_msgSend(v20, "setWifi2P4GHzTxDuration:", v45);
                goto LABEL_27;
              }
              if (objc_msgSend(v39, "isEqualToString:", CFSTR("band_5p02_ghz")))
              {
                objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("Value"));
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "doubleValue");
                objc_msgSend(v20, "setWifi5GHz20MHzTxDuration:", v49);
LABEL_27:
                v28 = v82;
              }
              else
              {
                v28 = v82;
                if (objc_msgSend(v39, "isEqualToString:", CFSTR("band_5p04_ghz")))
                {
                  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("Value"));
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v44, "doubleValue");
                  objc_msgSend(v20, "setWifi5GHz40MHzTxDuration:", v52);
                }
                else
                {
                  if (!objc_msgSend(v39, "isEqualToString:", CFSTR("band_5p08_ghz")))
                    goto LABEL_29;
                  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("Value"));
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v44, "doubleValue");
                  objc_msgSend(v20, "setWifi5GHz80MHzTxDuration:", v55);
                }
              }
              goto LABEL_28;
            }
            if (objc_msgSend(v38, "isEqualToString:", CFSTR("WifiRxDuration")))
            {
              v46 = objc_alloc(MEMORY[0x24BDD17C8]);
              objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("Band"));
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = (void *)objc_msgSend(v46, "initWithFormat:", CFSTR("%@"), v47);

              if (objc_msgSend(v39, "isEqualToString:", CFSTR("band_2p4_ghz")))
              {
                objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("Value"));
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "doubleValue");
                objc_msgSend(v20, "setWifi2P4GHzRxDuration:", v48);
                goto LABEL_27;
              }
              v28 = v82;
              if (objc_msgSend(v39, "isEqualToString:", CFSTR("band_5p02_ghz")))
              {
                objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("Value"));
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "doubleValue");
                objc_msgSend(v20, "setWifi5GHz20MHzRxDuration:", v51);
              }
              else if (objc_msgSend(v39, "isEqualToString:", CFSTR("band_5p04_ghz")))
              {
                objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("Value"));
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "doubleValue");
                objc_msgSend(v20, "setWifi5GHz40MHzRxDuration:", v54);
              }
              else
              {
                if (!objc_msgSend(v39, "isEqualToString:", CFSTR("band_5p08_ghz")))
                  goto LABEL_29;
                objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("Value"));
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "doubleValue");
                objc_msgSend(v20, "setWifi5GHz80MHzRxDuration:", v57);
              }
LABEL_28:

              goto LABEL_29;
            }
            if (objc_msgSend(v38, "isEqualToString:", CFSTR("WifiSleepTime")))
            {
              objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("Value"));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "doubleValue");
              objc_msgSend(v20, "setWifiSleepDuration:", v50);
              goto LABEL_29;
            }
            if (objc_msgSend(v38, "isEqualToString:", CFSTR("WifiFrtsDuration")))
            {
              objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("Value"));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "doubleValue");
              objc_msgSend(v20, "setWifiFRTSDuration:", v53);
              goto LABEL_29;
            }
            if (objc_msgSend(v38, "isEqualToString:", CFSTR("WifiHsicDuration")))
            {
              objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("Value"));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "doubleValue");
              objc_msgSend(v20, "setWifiHsicActiveDuration:", v56);
              goto LABEL_29;
            }
            if (objc_msgSend(v38, "isEqualToString:", CFSTR("WifiTotalPower")))
            {
              objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("Value"));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "doubleValue");
              objc_msgSend(v20, "setWifiTotalPowerMicroWatt:", v58);
              goto LABEL_29;
            }
            v32 = v34;
            if (objc_msgSend(v38, "isEqualToString:", v34))
            {
              objc_msgSend(v35, "objectForKeyedSubscript:", v34);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "doubleValue");
              objc_msgSend(v20, "setWifiPcieL0Duration:", v59);
              goto LABEL_29;
            }
            if (objc_msgSend(v38, "isEqualToString:", CFSTR("WifiPcieSuspendDuration")))
            {
              objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("WifiPcieSuspendDuration"));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "doubleValue");
              objc_msgSend(v20, "setWifiPcieL12Duration:", v60);
              goto LABEL_29;
            }
LABEL_30:

            ++v33;
          }
          while (v30 != v33);
          v61 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v85, v90, 16);
          v30 = v61;
        }
        while (v61);
      }

      v7 = v78;
      objc_msgSend(v78, "setMetric:", v20);
      self = v79;
      -[PLAWDWifiBT setWifiSubmitCnt:](v79, "setWifiSubmitCnt:", -[PLAWDWifiBT wifiSubmitCnt](v79, "wifiSubmitCnt") + 1);
      v15 = v77;
      v19 = v81;
      if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v62 = objc_opt_class();
        v84[0] = MEMORY[0x24BDAC760];
        v84[1] = 3221225472;
        v84[2] = __53__PLAWDWifiBT_submitWiFiDataToAWDServer_withAwdConn___block_invoke_208;
        v84[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v84[4] = v62;
        if (submitWiFiDataToAWDServer_withAwdConn__defaultOnce_206 != -1)
          dispatch_once(&submitWiFiDataToAWDServer_withAwdConn__defaultOnce_206, v84);
        if (submitWiFiDataToAWDServer_withAwdConn__classDebugEnabled_207)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Submit WiFi stats: submit cnt = %ld"), -[PLAWDWifiBT wifiSubmitCnt](v79, "wifiSubmitCnt"));
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "lastPathComponent");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDWifiBT submitWiFiDataToAWDServer:withAwdConn:]");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "logMessage:fromFile:fromFunction:fromLineNumber:", v63, v66, v67, 444);

          PLLogCommon();
          v68 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
            -[PLAWDDisplay startMetricCollection:].cold.1();

          v19 = v81;
        }
      }
    }

    v69 = v80;
    goto LABEL_63;
  }
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v70 = objc_opt_class();
    v83[0] = MEMORY[0x24BDAC760];
    v83[1] = 3221225472;
    v83[2] = __53__PLAWDWifiBT_submitWiFiDataToAWDServer_withAwdConn___block_invoke_213;
    v83[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v83[4] = v70;
    if (submitWiFiDataToAWDServer_withAwdConn__defaultOnce_211 != -1)
      dispatch_once(&submitWiFiDataToAWDServer_withAwdConn__defaultOnce_211, v83);
    if (submitWiFiDataToAWDServer_withAwdConn__classDebugEnabled_212)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Submit WiFi stats: Empty container!!"), CFSTR("*******PLAWDMetricsService*******"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "lastPathComponent");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDWifiBT submitWiFiDataToAWDServer:withAwdConn:]");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v73, v74, 448);

      PLLogCommon();
      v69 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();
LABEL_63:

    }
  }
  -[PLAWDWifiBT resetWifiTable](self, "resetWifiTable");
  v75 = objc_msgSend(v6, "submitMetric:", v7);

  return v75;
}

uint64_t __53__PLAWDWifiBT_submitWiFiDataToAWDServer_withAwdConn___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  submitWiFiDataToAWDServer_withAwdConn__classDebugEnabled = result;
  return result;
}

uint64_t __53__PLAWDWifiBT_submitWiFiDataToAWDServer_withAwdConn___block_invoke_208(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  submitWiFiDataToAWDServer_withAwdConn__classDebugEnabled_207 = result;
  return result;
}

uint64_t __53__PLAWDWifiBT_submitWiFiDataToAWDServer_withAwdConn___block_invoke_213(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  submitWiFiDataToAWDServer_withAwdConn__classDebugEnabled_212 = result;
  return result;
}

+ (id)entryAggregateDefinitionAwdBT
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
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[4];
  _QWORD v24[6];

  v24[4] = *MEMORY[0x24BDAC8D0];
  v23[0] = *MEMORY[0x24BE751D0];
  v2 = *MEMORY[0x24BE751F0];
  v21[0] = *MEMORY[0x24BE751F8];
  v21[1] = v2;
  v22[0] = &unk_24EB646A0;
  v22[1] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v3;
  v23[1] = *MEMORY[0x24BE751E8];
  v19[0] = CFSTR("BTState");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = CFSTR("BTValue");
  v20[0] = v5;
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_RealFormat_aggregateFunction_sum");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v8;
  v23[2] = *MEMORY[0x24BE751A0];
  v17 = &unk_24EB64690;
  v15 = *MEMORY[0x24BE75198];
  v16 = &unk_24EB64690;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v10;
  v23[3] = *MEMORY[0x24BE751A8];
  v14 = CFSTR("BTValue");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)startBtMetricCollection
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];

  -[PLAWDWifiBT setBtSubmitCnt:](self, "setBtSubmitCnt:", 0);
  -[PLAWDWifiBT resetBTTable](self, "resetBTTable");
  -[PLAWDWifiBT setIsBTStart:](self, "setIsBTStart:", 1);
  -[PLAWDWifiBT setIsBTRailStart:](self, "setIsBTRailStart:", 1);
  objc_msgSend(MEMORY[0x24BE75250], "entryKeyForType:andName:", *MEMORY[0x24BE75218], *MEMORY[0x24BE75320]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE74FC8]);
  -[PLAWDAuxMetrics operator](self, "operator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __38__PLAWDWifiBT_startBtMetricCollection__block_invoke;
  v15[3] = &unk_24EB5CDA0;
  v15[4] = self;
  v7 = (void *)objc_msgSend(v4, "initWithOperator:forEntryKey:withBlock:", v5, v3, v15);

  -[PLAWDWifiBT setBtEventCallback:](self, "setBtEventCallback:", v7);
  -[PLAWDWifiBT btEventCallback](self, "btEventCallback");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestEntry");

  objc_msgSend(MEMORY[0x24BE75250], "entryKeyForType:andName:", *MEMORY[0x24BE75210], *MEMORY[0x24BE75318]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x24BE74FC8]);
  -[PLAWDAuxMetrics operator](self, "operator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __38__PLAWDWifiBT_startBtMetricCollection__block_invoke_2;
  v14[3] = &unk_24EB5CDA0;
  v14[4] = self;
  v12 = (void *)objc_msgSend(v10, "initWithOperator:forEntryKey:withBlock:", v11, v9, v14);

  -[PLAWDWifiBT setBtPowerCallback:](self, "setBtPowerCallback:", v12);
  -[PLAWDWifiBT btPowerCallback](self, "btPowerCallback");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "requestEntry");

}

uint64_t __38__PLAWDWifiBT_startBtMetricCollection__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleBTCallback:", a2);
  return result;
}

uint64_t __38__PLAWDWifiBT_startBtMetricCollection__block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleBTPowerCallback:", a2);
  return result;
}

- (void)resetBTTable
{
  void *v3;
  objc_super v4;

  +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", *MEMORY[0x24BE75200], CFSTR("AwdBT"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4.receiver = self;
  v4.super_class = (Class)PLAWDWifiBT;
  -[PLAWDAuxMetrics resetTableWithEntryKey:](&v4, sel_resetTableWithEntryKey_, v3);

}

- (void)addEntryToBTTable:(id)a3 withValue:(double)a4
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = *MEMORY[0x24BE75200];
  v7 = a3;
  +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", v6, CFSTR("AwdBT"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74FB8]), "initWithEntryKey:", v11);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("BTState"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("BTValue"));

  -[PLAWDAuxMetrics operator](self, "operator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logEntry:", v8);

}

- (void)handleBTCallback:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  _QWORD v32[5];
  _QWORD block[5];

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sleep(1u);
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __32__PLAWDWifiBT_handleBTCallback___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (handleBTCallback__defaultOnce != -1)
      dispatch_once(&handleBTCallback__defaultOnce, block);
    if (handleBTCallback__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s - %@"), "-[PLAWDWifiBT handleBTCallback:]", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDWifiBT handleBTCallback:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 557);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }
  if (v4)
  {
    -[PLAWDAuxMetrics operator](self, "operator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "storage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entryKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "entryForKey:withID:", v14, objc_msgSend(v4, "entryID") - 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("DeviceConnected"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "BOOLValue");

      if (v17)
      {
        objc_msgSend(v4, "entryDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "timeIntervalSince1970");
        v20 = v19;
        objc_msgSend(v15, "entryDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "laterDate:", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "timeIntervalSince1970");
        v24 = v20 - v23;

        if (v24 > 0.0)
          -[PLAWDWifiBT addEntryToBTTable:withValue:](self, "addEntryToBTTable:withValue:", CFSTR("Connected"), v24);
      }
      if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v25 = objc_opt_class();
        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        v32[2] = __32__PLAWDWifiBT_handleBTCallback___block_invoke_224;
        v32[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v32[4] = v25;
        if (handleBTCallback__defaultOnce_222 != -1)
          dispatch_once(&handleBTCallback__defaultOnce_222, v32);
        if (handleBTCallback__classDebugEnabled_223)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("BT ConnectedStateCallback - %@"), v15);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "lastPathComponent");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDWifiBT handleBTCallback:]");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "logMessage:fromFile:fromFunction:fromLineNumber:", v26, v29, v30, 567);

          PLLogCommon();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            -[PLAWDDisplay startMetricCollection:].cold.1();

        }
      }
    }

  }
}

uint64_t __32__PLAWDWifiBT_handleBTCallback___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleBTCallback__classDebugEnabled = result;
  return result;
}

uint64_t __32__PLAWDWifiBT_handleBTCallback___block_invoke_224(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleBTCallback__classDebugEnabled_223 = result;
  return result;
}

- (void)handleBTPowerCallback:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t block;
  uint64_t v41;
  uint64_t (*v42)(uint64_t);
  void *v43;
  uint64_t v44;
  _QWORD v45[5];
  objc_super v46;
  _QWORD v47[5];

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (!-[PLAWDWifiBT isBTStart](self, "isBTStart"))
      goto LABEL_17;
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v5 = objc_opt_class();
      v47[0] = MEMORY[0x24BDAC760];
      v47[1] = 3221225472;
      v47[2] = __37__PLAWDWifiBT_handleBTPowerCallback___block_invoke;
      v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v47[4] = v5;
      if (handleBTPowerCallback__defaultOnce != -1)
        dispatch_once(&handleBTPowerCallback__defaultOnce, v47);
      if (handleBTPowerCallback__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : BT Properties first entry"), CFSTR("*******PLAWDMetricsService*******"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDWifiBT handleBTPowerCallback:]");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 578);

        PLLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();

      }
    }
    -[PLAWDWifiBT setIsBTStart:](self, "setIsBTStart:", 0);
    v46.receiver = self;
    v46.super_class = (Class)PLAWDWifiBT;
    if (-[PLAWDAuxMetrics dropFirstEntryReceived:usingFilter:andStartTime:](&v46, sel_dropFirstEntryReceived_usingFilter_andStartTime_, v4, 0, 0))
    {
      if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v12 = objc_opt_class();
        v45[0] = MEMORY[0x24BDAC760];
        v45[1] = 3221225472;
        v45[2] = __37__PLAWDWifiBT_handleBTPowerCallback___block_invoke_231;
        v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v45[4] = v12;
        if (handleBTPowerCallback__defaultOnce_229 != -1)
          dispatch_once(&handleBTPowerCallback__defaultOnce_229, v45);
        if (handleBTPowerCallback__classDebugEnabled_230)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : BT Properties first entry - dropped"), CFSTR("*******PLAWDMetricsService*******"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "lastPathComponent");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDWifiBT handleBTPowerCallback:]");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 583);

          PLLogCommon();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            -[PLAWDDisplay startMetricCollection:].cold.1();
LABEL_31:

        }
      }
    }
    else
    {
LABEL_17:
      sleep(1u);
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TXPower"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "doubleValue");
      v21 = v20;

      if (v21 > 0.0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TXPower"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "doubleValue");
        -[PLAWDWifiBT addEntryToBTTable:withValue:](self, "addEntryToBTTable:withValue:", CFSTR("PowerTx"));

      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RXPower"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "doubleValue");
      v25 = v24;

      if (v25 > 0.0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RXPower"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "doubleValue");
        -[PLAWDWifiBT addEntryToBTTable:withValue:](self, "addEntryToBTTable:withValue:", CFSTR("PowerRx"));

      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SleepPower"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "doubleValue");
      v29 = v28;

      if (v29 > 0.0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SleepPower"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "doubleValue");
        -[PLAWDWifiBT addEntryToBTTable:withValue:](self, "addEntryToBTTable:withValue:", CFSTR("PowerSleep"));

      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OtherPower"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "doubleValue");
      v33 = v32;

      if (v33 > 0.0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OtherPower"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "doubleValue");
        -[PLAWDWifiBT addEntryToBTTable:withValue:](self, "addEntryToBTTable:withValue:", CFSTR("PowerOther"));

      }
      if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v35 = objc_opt_class();
        block = MEMORY[0x24BDAC760];
        v41 = 3221225472;
        v42 = __37__PLAWDWifiBT_handleBTPowerCallback___block_invoke_244;
        v43 = &__block_descriptor_40_e5_v8__0lu32l8;
        v44 = v35;
        if (handleBTPowerCallback__defaultOnce_242 != -1)
          dispatch_once(&handleBTPowerCallback__defaultOnce_242, &block);
        if (handleBTPowerCallback__classDebugEnabled_243)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("BT Properties Callback - %@"), v4, block, v41, v42, v43, v44);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "lastPathComponent");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDWifiBT handleBTPowerCallback:]");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v38, v39, 606);

          PLLogCommon();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            -[PLAWDDisplay startMetricCollection:].cold.1();
          goto LABEL_31;
        }
      }
    }
  }

}

uint64_t __37__PLAWDWifiBT_handleBTPowerCallback___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleBTPowerCallback__classDebugEnabled = result;
  return result;
}

uint64_t __37__PLAWDWifiBT_handleBTPowerCallback___block_invoke_231(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleBTPowerCallback__classDebugEnabled_230 = result;
  return result;
}

uint64_t __37__PLAWDWifiBT_handleBTPowerCallback___block_invoke_244(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleBTPowerCallback__classDebugEnabled_243 = result;
  return result;
}

- (BOOL)submitBtDataToAWDServer:(id)a3 withAwdConn:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  PLAWDWifiBT *v63;
  void *v64;
  void *v65;
  _QWORD v66[5];
  _QWORD v67[5];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD block[5];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)objc_msgSend(v6, "newMetricContainerWithIdentifier:", objc_msgSend(a3, "unsignedIntValue"));
  if (v7)
  {
    -[PLAWDWifiBT btEventCallback](self, "btEventCallback");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "requestEntry");

    sleep(5u);
    objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDateWithTimeIntervalSinceNow:", -86400.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSince1970");
    v12 = v11;
    objc_msgSend(v10, "timeIntervalSince1970");
    v14 = v13 - v12;

    +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", *MEMORY[0x24BE75200], CFSTR("AwdBT"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAWDAuxMetrics operator](self, "operator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "storage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v15, 86400.0, v12, v14);
    v18 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE74FB8], "summarizeAggregateEntries:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_opt_new();
    v65 = v19;
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v21 = objc_opt_class();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __51__PLAWDWifiBT_submitBtDataToAWDServer_withAwdConn___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v21;
      if (submitBtDataToAWDServer_withAwdConn__defaultOnce != -1)
        dispatch_once(&submitBtDataToAWDServer_withAwdConn__defaultOnce, block);
      if (submitBtDataToAWDServer_withAwdConn__classDebugEnabled)
      {
        v64 = v20;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : %@"), CFSTR("*******PLAWDMetricsService*******"), v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "lastPathComponent");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDWifiBT submitBtDataToAWDServer:withAwdConn:]");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "logMessage:fromFile:fromFunction:fromLineNumber:", v22, v25, v26, 628);

        PLLogCommon();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();

        v20 = v64;
        v19 = v65;
      }
    }
    if (v20)
    {
      v60 = v18;
      v61 = v15;
      v62 = v7;
      v63 = self;
      objc_msgSend(v20, "setBtConnectedDuration:", 0);
      objc_msgSend(v20, "setBtOthersDuration:", 0);
      objc_msgSend(v20, "setBtRxDuration:", 0);
      objc_msgSend(v20, "setBtTxDuration:", 0);
      objc_msgSend(v20, "setBtSleepDuration:", 0);
      objc_msgSend(v20, "setBtTotalPowerMicroWatt:", 0);
      v28 = v20;
      objc_msgSend(v20, "setTimestamp:", objc_msgSend(v6, "getAWDTimestamp"));
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v29 = v19;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v69;
        do
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v69 != v32)
              objc_enumerationMutation(v29);
            v34 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
            v35 = objc_alloc(MEMORY[0x24BDD17C8]);
            objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("BTState"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = (void *)objc_msgSend(v35, "initWithFormat:", CFSTR("%@"), v36);

            if (objc_msgSend(v37, "isEqualToString:", CFSTR("PowerOther")))
            {
              objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("BTValue"));
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "doubleValue");
              objc_msgSend(v28, "setBtOthersDuration:", v39);
            }
            else if (objc_msgSend(v37, "isEqualToString:", CFSTR("PowerRx")))
            {
              objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("BTValue"));
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "doubleValue");
              objc_msgSend(v28, "setBtRxDuration:", v40);
            }
            else if (objc_msgSend(v37, "isEqualToString:", CFSTR("PowerTx")))
            {
              objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("BTValue"));
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "doubleValue");
              objc_msgSend(v28, "setBtTxDuration:", v41);
            }
            else if (objc_msgSend(v37, "isEqualToString:", CFSTR("PowerSleep")))
            {
              objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("BTValue"));
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "doubleValue");
              objc_msgSend(v28, "setBtSleepDuration:", v42);
            }
            else if (objc_msgSend(v37, "isEqualToString:", CFSTR("Connected")))
            {
              objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("BTValue"));
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "doubleValue");
              objc_msgSend(v28, "setBtConnectedDuration:", v43);
            }
            else
            {
              if (!objc_msgSend(v37, "isEqualToString:", CFSTR("BTTotalPower")))
                goto LABEL_28;
              objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("BTValue"));
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "doubleValue");
              objc_msgSend(v28, "setBtTotalPowerMicroWatt:", v44);
            }

LABEL_28:
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
        }
        while (v31);
      }

      v7 = v62;
      v20 = v28;
      objc_msgSend(v62, "setMetric:", v28);
      self = v63;
      -[PLAWDWifiBT setBtSubmitCnt:](v63, "setBtSubmitCnt:", -[PLAWDWifiBT btSubmitCnt](v63, "btSubmitCnt") + 1);
      v19 = v65;
      v18 = v60;
      v15 = v61;
      if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v45 = objc_opt_class();
        v67[0] = MEMORY[0x24BDAC760];
        v67[1] = 3221225472;
        v67[2] = __51__PLAWDWifiBT_submitBtDataToAWDServer_withAwdConn___block_invoke_250;
        v67[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v67[4] = v45;
        if (submitBtDataToAWDServer_withAwdConn__defaultOnce_248 != -1)
          dispatch_once(&submitBtDataToAWDServer_withAwdConn__defaultOnce_248, v67);
        if (submitBtDataToAWDServer_withAwdConn__classDebugEnabled_249)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Submit BT stats: submit cnt = %ld"), -[PLAWDWifiBT btSubmitCnt](v63, "btSubmitCnt"));
          v46 = objc_claimAutoreleasedReturnValue();
          v59 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "lastPathComponent");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDWifiBT submitBtDataToAWDServer:withAwdConn:]");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "logMessage:fromFile:fromFunction:fromLineNumber:", v46, v48, v49, 665);

          v50 = (void *)v46;
          PLLogCommon();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
            -[PLAWDDisplay startMetricCollection:].cold.1();

          v19 = v65;
          v20 = v28;
        }
      }
    }

    goto LABEL_38;
  }
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v52 = objc_opt_class();
    v66[0] = MEMORY[0x24BDAC760];
    v66[1] = 3221225472;
    v66[2] = __51__PLAWDWifiBT_submitBtDataToAWDServer_withAwdConn___block_invoke_255;
    v66[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v66[4] = v52;
    if (submitBtDataToAWDServer_withAwdConn__defaultOnce_253 != -1)
      dispatch_once(&submitBtDataToAWDServer_withAwdConn__defaultOnce_253, v66);
    if (submitBtDataToAWDServer_withAwdConn__classDebugEnabled_254)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Submit BT stats: Empty container!!"), CFSTR("*******PLAWDMetricsService*******"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDWifiBT.m");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "lastPathComponent");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDWifiBT submitBtDataToAWDServer:withAwdConn:]");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v55, v56, 669);

      PLLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();
LABEL_38:

    }
  }
  -[PLAWDWifiBT resetBTTable](self, "resetBTTable");
  v57 = objc_msgSend(v6, "submitMetric:", v7);

  return v57;
}

uint64_t __51__PLAWDWifiBT_submitBtDataToAWDServer_withAwdConn___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  submitBtDataToAWDServer_withAwdConn__classDebugEnabled = result;
  return result;
}

uint64_t __51__PLAWDWifiBT_submitBtDataToAWDServer_withAwdConn___block_invoke_250(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  submitBtDataToAWDServer_withAwdConn__classDebugEnabled_249 = result;
  return result;
}

uint64_t __51__PLAWDWifiBT_submitBtDataToAWDServer_withAwdConn___block_invoke_255(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  submitBtDataToAWDServer_withAwdConn__classDebugEnabled_254 = result;
  return result;
}

- (PLEntryNotificationOperatorComposition)wifiEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 32, 1);
}

- (void)setWifiEventCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (PLEntryNotificationOperatorComposition)btEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBtEventCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (PLEntryNotificationOperatorComposition)btPowerCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBtPowerCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (PLEntryNotificationOperatorComposition)wifiRailCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setWifiRailCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PLEntryNotificationOperatorComposition)btRailCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBtRailCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)isWiFiStart
{
  return self->_isWiFiStart;
}

- (void)setIsWiFiStart:(BOOL)a3
{
  self->_isWiFiStart = a3;
}

- (BOOL)isWiFiRailStart
{
  return self->_isWiFiRailStart;
}

- (void)setIsWiFiRailStart:(BOOL)a3
{
  self->_isWiFiRailStart = a3;
}

- (BOOL)isBTStart
{
  return self->_isBTStart;
}

- (void)setIsBTStart:(BOOL)a3
{
  self->_isBTStart = a3;
}

- (BOOL)isBTRailStart
{
  return self->_isBTRailStart;
}

- (void)setIsBTRailStart:(BOOL)a3
{
  self->_isBTRailStart = a3;
}

- (int64_t)wifiSubmitCnt
{
  return self->_wifiSubmitCnt;
}

- (void)setWifiSubmitCnt:(int64_t)a3
{
  self->_wifiSubmitCnt = a3;
}

- (int64_t)btSubmitCnt
{
  return self->_btSubmitCnt;
}

- (void)setBtSubmitCnt:(int64_t)a3
{
  self->_btSubmitCnt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_btRailCallback, 0);
  objc_storeStrong((id *)&self->_wifiRailCallback, 0);
  objc_storeStrong((id *)&self->_btPowerCallback, 0);
  objc_storeStrong((id *)&self->_btEventCallback, 0);
  objc_storeStrong((id *)&self->_wifiEventCallback, 0);
}

@end
