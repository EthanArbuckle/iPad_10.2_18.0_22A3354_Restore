@implementation PLAWDNetworkUsage

+ (id)entryAggregateDefinitions
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("NetworkUsage");
  objc_msgSend(a1, "entryAggregateDefinitionNetUsage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entryAggregateDefinitionNetUsage
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
  _QWORD v20[4];
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[4];
  _QWORD v30[6];

  v30[4] = *MEMORY[0x24BDAC8D0];
  v29[0] = *MEMORY[0x24BE751D0];
  v2 = *MEMORY[0x24BE751F0];
  v27[0] = *MEMORY[0x24BE751F8];
  v27[1] = v2;
  v28[0] = &unk_24EB646B0;
  v28[1] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v19;
  v29[1] = *MEMORY[0x24BE751E8];
  v25[0] = CFSTR("NetProcessName");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_StringFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v17;
  v25[1] = CFSTR("WifiIn");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v15;
  v25[2] = CFSTR("WifiOut");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v3;
  v25[3] = CFSTR("CellIn");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v5;
  v25[4] = CFSTR("CellOut");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v8;
  v29[2] = *MEMORY[0x24BE751A0];
  v23 = &unk_24EB646C0;
  v21 = *MEMORY[0x24BE75198];
  v22 = &unk_24EB646C0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v10;
  v29[3] = *MEMORY[0x24BE751A8];
  v20[0] = CFSTR("WifiIn");
  v20[1] = CFSTR("WifiOut");
  v20[2] = CFSTR("CellIn");
  v20[3] = CFSTR("CellOut");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)getSharedObjWithOperator:(id)a3
{
  void *v3;
  id v4;
  PLAWDNetworkUsage *v5;
  void *v6;

  v3 = (void *)plAwdNetworkUsage;
  if (!plAwdNetworkUsage)
  {
    v4 = a3;
    v5 = -[PLAWDAuxMetrics initWithOperator:]([PLAWDNetworkUsage alloc], "initWithOperator:", v4);

    v6 = (void *)plAwdNetworkUsage;
    plAwdNetworkUsage = (uint64_t)v5;

    v3 = (void *)plAwdNetworkUsage;
  }
  return v3;
}

- (void)startMetricCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];

  v4 = a3;
  -[PLAWDAuxMetrics runningMetrics](self, "runningMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  -[PLAWDNetworkUsage resetNetUsageTable](self, "resetNetUsageTable");
  LODWORD(v5) = objc_msgSend(v4, "unsignedIntValue");

  if ((_DWORD)v5 == 2031619)
  {
    -[PLAWDNetworkUsage setNetState:](self, "setNetState:", 0);
    objc_msgSend(MEMORY[0x24BE75280], "entryKeyForType:andName:", *MEMORY[0x24BE75220], *MEMORY[0x24BE753A0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x24BE74FC8]);
    -[PLAWDAuxMetrics operator](self, "operator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __43__PLAWDNetworkUsage_startMetricCollection___block_invoke;
    v19[3] = &unk_24EB5CDA0;
    v19[4] = self;
    v10 = (void *)objc_msgSend(v7, "initWithOperator:forEntryKey:withBlock:", v8, v6, v19);

    -[PLAWDNetworkUsage setNetEventCallback:](self, "setNetEventCallback:", v10);
    -[PLAWDNetworkUsage netEventCallback](self, "netEventCallback");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "requestEntry");

    objc_msgSend(MEMORY[0x24BE75280], "entryKeyForType:andName:", *MEMORY[0x24BE75230], *MEMORY[0x24BE753A8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("GroupID_%@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc(MEMORY[0x24BE74FC8]);
    -[PLAWDAuxMetrics operator](self, "operator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v9;
    v18[1] = 3221225472;
    v18[2] = __43__PLAWDNetworkUsage_startMetricCollection___block_invoke_2;
    v18[3] = &unk_24EB5CDA0;
    v18[4] = self;
    v16 = (void *)objc_msgSend(v14, "initWithOperator:forEntryKey:withBlock:", v15, v13, v18);

    -[PLAWDNetworkUsage setNameConnectionCallback:](self, "setNameConnectionCallback:", v16);
    -[PLAWDNetworkUsage nameConnectionCallback](self, "nameConnectionCallback");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "requestEntry");

  }
}

uint64_t __43__PLAWDNetworkUsage_startMetricCollection___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleNetCallback:", a2);
  return result;
}

uint64_t __43__PLAWDNetworkUsage_startMetricCollection___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleNameConnectionCallback:", a2);
  return result;
}

- (void)stopMetricCollection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  -[PLAWDAuxMetrics runningMetrics](self, "runningMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  v6 = objc_msgSend(v4, "longValue");
  if (v6 == 2031619)
    -[PLAWDNetworkUsage setNetEventCallback:](self, "setNetEventCallback:", 0);
  -[PLAWDAuxMetrics runningMetrics](self, "runningMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
  {
    v9 = (void *)plAwdNetworkUsage;
    plAwdNetworkUsage = 0;

  }
}

- (BOOL)submitDataToAWDServer:(id)a3 withAwdConn:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  uint64_t v28;
  void *v29;
  double v30;
  uint64_t v31;
  void *v32;
  double v33;
  uint64_t v34;
  void *v35;
  double v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  unint64_t j;
  void *v48;
  void *v49;
  void *v50;
  void *v52;
  void *v53;
  void *v54;
  PLAWDNetworkUsage *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  id obj;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(v7, "newMetricContainerWithIdentifier:", objc_msgSend(v6, "unsignedIntValue"));
  v9 = 0;
  if (objc_msgSend(v6, "longValue") == 2031619 && v8)
  {
    -[PLAWDNetworkUsage netEventCallback](self, "netEventCallback");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "requestEntry");

    sleep(5u);
    v11 = objc_opt_new();
    v12 = (void *)v11;
    if (v11)
    {
      v54 = (void *)v11;
      v56 = v8;
      v57 = v7;
      v58 = v6;
      v60 = (void *)objc_opt_new();
      v59 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDateWithTimeIntervalSinceNow:", -86400.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSince1970");
      v16 = v15;
      objc_msgSend(v14, "timeIntervalSince1970");
      v18 = v17 - v16;

      +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", *MEMORY[0x24BE75200], CFSTR("NetworkUsage"));
      v19 = objc_claimAutoreleasedReturnValue();
      v55 = self;
      -[PLAWDAuxMetrics operator](self, "operator");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "storage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = (void *)v19;
      objc_msgSend(v21, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v19, 86400.0, v16, v18);
      v22 = objc_claimAutoreleasedReturnValue();

      v52 = (void *)v22;
      objc_msgSend(MEMORY[0x24BE74FB8], "summarizeAggregateEntries:", v22);
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
      if (v63)
      {
        v62 = *(_QWORD *)v65;
        do
        {
          for (i = 0; i != v63; ++i)
          {
            if (*(_QWORD *)v65 != v62)
              objc_enumerationMutation(obj);
            v24 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
            v25 = (void *)objc_opt_new();
            objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("WifiIn"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "doubleValue");
            v28 = v27;

            objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("WifiOut"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "doubleValue");
            v31 = v30;

            objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("CellIn"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "doubleValue");
            v34 = v33;

            objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("CellOut"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "doubleValue");
            v37 = v36;

            v38 = objc_alloc(MEMORY[0x24BDD17C8]);
            objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("NetProcessName"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = (void *)objc_msgSend(v38, "initWithFormat:", CFSTR("%@"), v39);

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", (v31 + v28 + v34 + v37));
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v41, "intValue"))
            {
              objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("NetProcessName"));
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "setBundleName:", v42);

              objc_msgSend(v25, "setWifiIn:", v28);
              objc_msgSend(v25, "setWifiOut:", v31);
              objc_msgSend(v25, "setCellIn:", v34);
              objc_msgSend(v25, "setCellOut:", v37);
              objc_msgSend(v25, "setNumConnections:", 0);
              if (objc_msgSend(v40, "rangeOfString:", CFSTR("com.apple")) == 0x7FFFFFFFFFFFFFFFLL
                && objc_msgSend(v40, "rangeOfString:", CFSTR("system")) == 0x7FFFFFFFFFFFFFFFLL)
              {
                objc_msgSend(v59, "setObject:forKey:", v25, v41);
              }
              else
              {
                objc_msgSend(v60, "addObject:", v25);
              }
            }

          }
          v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
        }
        while (v63);
      }
      objc_msgSend(v59, "allKeys");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "sortedArrayUsingSelector:", sel_compare_);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "reverseObjectEnumerator");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "allObjects");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      for (j = 0; j != 10; ++j)
      {
        if (objc_msgSend(v46, "count") <= j)
          break;
        objc_msgSend(v46, "objectAtIndexedSubscript:", j);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "objectForKey:", v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v60, "addObject:", v49);
      }
      v7 = v57;
      v12 = v54;
      objc_msgSend(v54, "setTimestamp:", objc_msgSend(v57, "getAWDTimestamp"));
      objc_msgSend(v54, "setUsages:", v60);
      v8 = v56;
      objc_msgSend(v56, "setMetric:", v54);

      v6 = v58;
      self = v55;
    }
    -[PLAWDNetworkUsage resetNetUsageTable](self, "resetNetUsageTable");
    -[PLAWDNetworkUsage netEventCallback](self, "netEventCallback");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "requestEntry");

    v9 = objc_msgSend(v7, "submitMetric:", v8);
  }

  return v9;
}

- (void)handleNetCallback:(id)a3
{
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v31 = v4;
    +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", *MEMORY[0x24BE75200], CFSTR("NetworkUsage"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("BundleName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74FB8]), "initWithEntryKey:", v5);
      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("BundleName"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("NetProcessName"));

      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("WifiIn"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("WifiIn"));

      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("WifiOut"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("WifiOut"));

      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("CellIn"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("CellIn"));

      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("CellOut"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("CellOut"));

      -[PLAWDAuxMetrics operator](self, "operator");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logEntry:", v7);

      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
    }
    else
    {
      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("WifiIn"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "doubleValue");
      v17 = (v19 + 0.0);

      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("WifiOut"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "doubleValue");
      v14 = (v21 + 0.0);

      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("CellIn"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "doubleValue");
      v15 = (v23 + 0.0);

      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("CellOut"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      v16 = (v24 + 0.0);
    }

    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74FB8]), "initWithEntryKey:", v5);
    objc_msgSend(v25, "setObject:forKeyedSubscript:", CFSTR("system"), CFSTR("NetProcessName"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v17);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v26, CFSTR("WifiIn"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v14);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v27, CFSTR("WifiOut"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v15);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v28, CFSTR("CellIn"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v16);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v29, CFSTR("CellOut"));

    -[PLAWDAuxMetrics operator](self, "operator");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "logEntry:", v25);

    v4 = v31;
  }

}

- (void)handleNameConnectionCallback:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];

  objc_msgSend(a3, "objectForKey:", CFSTR("group"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50__PLAWDNetworkUsage_handleNameConnectionCallback___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (handleNameConnectionCallback__defaultOnce != -1)
      dispatch_once(&handleNameConnectionCallback__defaultOnce, block);
    if (handleNameConnectionCallback__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s = %@"), "-[PLAWDNetworkUsage handleNameConnectionCallback:]", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDNetworkUsage.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDNetworkUsage handleNameConnectionCallback:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 278);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLAWDNetworkUsage handleNameConnectionCallback:].cold.1((uint64_t)v5, v10);

    }
  }

}

uint64_t __50__PLAWDNetworkUsage_handleNameConnectionCallback___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleNameConnectionCallback__classDebugEnabled = result;
  return result;
}

- (void)resetNetUsageTable
{
  void *v3;
  objc_super v4;

  +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", *MEMORY[0x24BE75200], CFSTR("NetworkUsage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4.receiver = self;
  v4.super_class = (Class)PLAWDNetworkUsage;
  -[PLAWDAuxMetrics resetTableWithEntryKey:](&v4, sel_resetTableWithEntryKey_, v3);

}

- (PLEntryNotificationOperatorComposition)netEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNetEventCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (PLEntryNotificationOperatorComposition)nameConnectionCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNameConnectionCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (unsigned)netState
{
  return self->_netState;
}

- (void)setNetState:(unsigned int)a3
{
  self->_netState = a3;
}

- (NSTimer)snapshotTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSnapshotTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotTimer, 0);
  objc_storeStrong((id *)&self->_nameConnectionCallback, 0);
  objc_storeStrong((id *)&self->_netEventCallback, 0);
}

- (void)handleNameConnectionCallback:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_222C6D000, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v2, 0xCu);
}

@end
