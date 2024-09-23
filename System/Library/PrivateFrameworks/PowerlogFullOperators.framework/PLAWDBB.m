@implementation PLAWDBB

+ (id)getSharedObjWithOperator:(id)a3
{
  void *v3;
  id v4;
  PLAWDBB *v5;
  void *v6;

  v3 = (void *)plAwdBb;
  if (!plAwdBb)
  {
    v4 = a3;
    v5 = -[PLAWDAuxMetrics initWithOperator:]([PLAWDBB alloc], "initWithOperator:", v4);

    v6 = (void *)plAwdBb;
    plAwdBb = (uint64_t)v5;

    v3 = (void *)plAwdBb;
  }
  return v3;
}

+ (id)entryAggregateDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("awdBBLqm");
  objc_msgSend(a1, "entryAggregateDefinitionAwdBBQlm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("awdBBLqmCounter");
  objc_msgSend(a1, "entryAggregateDefinitionAwdBBQlmCounter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("BBConnectedPower");
  objc_msgSend(a1, "entryAggregateDefinitionAwdConnectedPower");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = CFSTR("Volte");
  objc_msgSend(a1, "entryAggregateDefinitionAwdVolte");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)startMetricCollection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  -[PLAWDAuxMetrics runningMetrics](self, "runningMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  v6 = objc_msgSend(v4, "longValue");
  switch(v6)
  {
    case 2031628:
      -[PLAWDBB startAppRrc](self, "startAppRrc");
      break;
    case 2031629:
      -[PLAWDBB startAppBB](self, "startAppBB");
      break;
    case 2031630:
      -[PLAWDBB startConnectedPower](self, "startConnectedPower");
      break;
    case 2031631:
      -[PLAWDBB startBBLqm](self, "startBBLqm");
      break;
    case 2031632:
      -[PLAWDBB startBBPower](self, "startBBPower");
      break;
    default:
      return;
  }
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
  switch(v6)
  {
    case 2031628:
      -[PLAWDBB stopAppRrc](self, "stopAppRrc");
      break;
    case 2031629:
      -[PLAWDBB stopAppBB](self, "stopAppBB");
      break;
    case 2031630:
      -[PLAWDBB stopConnectedPower](self, "stopConnectedPower");
      break;
    case 2031631:
      -[PLAWDBB stopBBLqm](self, "stopBBLqm");
      break;
    default:
      break;
  }
  -[PLAWDAuxMetrics runningMetrics](self, "runningMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
  {
    v9 = (void *)plAwdBb;
    plAwdBb = 0;

  }
}

- (BOOL)submitDataToAWDServer:(id)a3 withAwdConn:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  switch(objc_msgSend(v6, "longValue"))
  {
    case 2031628:
      -[PLAWDBB submitAppRrc:withAwdConn:](self, "submitAppRrc:withAwdConn:", v6, v7);
      goto LABEL_6;
    case 2031629:
      -[PLAWDBB submitAppBB:withAwdConn:](self, "submitAppBB:withAwdConn:", v6, v7);
      goto LABEL_6;
    case 2031630:
      v8 = -[PLAWDBB submitConnectedPower:withAwdConn:](self, "submitConnectedPower:withAwdConn:", v6, v7);
      break;
    case 2031631:
      -[PLAWDBB submitBBLqm:withAwdConn:](self, "submitBBLqm:withAwdConn:", v6, v7);
      goto LABEL_6;
    case 2031632:
    case 2031633:
LABEL_6:
      v8 = 1;
      break;
    default:
      v8 = 0;
      break;
  }

  return v8;
}

+ (id)entryAggregateDefinitionAwdBBQlm
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
  _QWORD v18[3];
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  _QWORD v24[4];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[4];
  _QWORD v28[6];

  v28[4] = *MEMORY[0x24BDAC8D0];
  v27[0] = *MEMORY[0x24BE751D0];
  v2 = *MEMORY[0x24BE751F0];
  v25[0] = *MEMORY[0x24BE751F8];
  v25[1] = v2;
  v26[0] = &unk_24EB646F0;
  v26[1] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v17;
  v27[1] = *MEMORY[0x24BE751E8];
  v23[0] = CFSTR("BBLinkQuality");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v15;
  v23[1] = CFSTR("BBLqmTx");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v3;
  v23[2] = CFSTR("BBLqmRx");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v5;
  v23[3] = CFSTR("BBLqmTime");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_RealFormat_aggregateFunction_sum");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v8;
  v27[2] = *MEMORY[0x24BE751A0];
  v21 = &unk_24EB64700;
  v19 = *MEMORY[0x24BE75198];
  v20 = &unk_24EB64700;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v10;
  v27[3] = *MEMORY[0x24BE751A8];
  v18[0] = CFSTR("BBLqmTx");
  v18[1] = CFSTR("BBLqmRx");
  v18[2] = CFSTR("BBLqmTime");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryAggregateDefinitionAwdBBQlmCounter
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
  v22[0] = &unk_24EB64710;
  v22[1] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v3;
  v23[1] = *MEMORY[0x24BE751E8];
  v19[0] = CFSTR("BBLqmSwitchBucket");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = CFSTR("BBLqmSwitchCounter");
  v20[0] = v5;
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v8;
  v23[2] = *MEMORY[0x24BE751A0];
  v17 = &unk_24EB64700;
  v15 = *MEMORY[0x24BE75198];
  v16 = &unk_24EB64700;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v10;
  v23[3] = *MEMORY[0x24BE751A8];
  v14 = CFSTR("BBLqmSwitchCounter");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)startBBLqm
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];

  -[PLAWDBB resetAllBBLqmTables](self, "resetAllBBLqmTables");
  objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAWDBB setStartTimeBBLqm:](self, "setStartTimeBBLqm:", v3);

  -[PLAWDBB setUpBytes:](self, "setUpBytes:", 0);
  -[PLAWDBB setDownBytes:](self, "setDownBytes:", 0);
  -[PLAWDBB setUpBytesLTE:](self, "setUpBytesLTE:", 0);
  -[PLAWDBB setDownBytesLTE:](self, "setDownBytesLTE:", 0);
  objc_msgSend(MEMORY[0x24BE75288], "entryKeyForType:andName:", *MEMORY[0x24BE75218], *MEMORY[0x24BE75378]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BE74FC8]);
  -[PLAWDAuxMetrics operator](self, "operator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __21__PLAWDBB_startBBLqm__block_invoke;
  v16[3] = &unk_24EB5CDA0;
  v16[4] = self;
  v8 = (void *)objc_msgSend(v5, "initWithOperator:forEntryKey:withBlock:", v6, v4, v16);

  -[PLAWDBB setBbLqmCellularActiveCallback:](self, "setBbLqmCellularActiveCallback:", v8);
  objc_msgSend(MEMORY[0x24BE75270], "entryKeyForType:andName:", *MEMORY[0x24BE75210], *MEMORY[0x24BE75390]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x24BE74FC8]);
  -[PLAWDAuxMetrics operator](self, "operator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __21__PLAWDBB_startBBLqm__block_invoke_2;
  v15[3] = &unk_24EB5CDA0;
  v15[4] = self;
  v12 = (void *)objc_msgSend(v10, "initWithOperator:forEntryKey:withBlock:", v11, v9, v15);

  -[PLAWDBB setBbLqmCumulativeNetworkCallback:](self, "setBbLqmCumulativeNetworkCallback:", v12);
  -[PLAWDBB updateCurrLqmState](self, "updateCurrLqmState");
  -[PLAWDBB bbLqmCellularActiveCallback](self, "bbLqmCellularActiveCallback");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "requestEntry");

  -[PLAWDBB bbLqmCumulativeNetworkCallback](self, "bbLqmCumulativeNetworkCallback");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "requestEntry");

}

uint64_t __21__PLAWDBB_startBBLqm__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleBBLqmCellularActiveCallback:", a2);
  return result;
}

uint64_t __21__PLAWDBB_startBBLqm__block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleBBLqmCumulativeNetworkCallback:", a2);
  return result;
}

- (void)updateLQMTableWithQuality:(int)a3 withTime:(double)a4 withRX:(double)a5 withTX:(double)a6
{
  uint64_t v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v9 = *(_QWORD *)&a3;
  +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", *MEMORY[0x24BE75200], CFSTR("awdBBLqm"));
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74FB8]), "initWithEntryKey:", v17);
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("BBLinkQuality"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("BBLqmTime"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("BBLqmRx"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("BBLqmTx"));

    -[PLAWDAuxMetrics operator](self, "operator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "logEntry:", v11);

  }
}

- (void)updateCurrLqmState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BE75288], "entryKeyForType:andName:", *MEMORY[0x24BE75218], *MEMORY[0x24BE75378]);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PLAWDAuxMetrics operator](self, "operator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastEntryForKey:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LinkQuality"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    -[PLAWDBB setNewQuality:](self, "setNewQuality:", -[PLAWDBB convertQualityWithLinkQuality:](self, "convertQualityWithLinkQuality:"));

  }
  else
  {
    -[PLAWDBB setNewQuality:](self, "setNewQuality:", 0);
  }
  -[PLAWDBB setCurrQuality:](self, "setCurrQuality:", -[PLAWDBB newQuality](self, "newQuality"));
  -[PLAWDBB updateLQMTableWithQuality:withTime:withRX:withTX:](self, "updateLQMTableWithQuality:withTime:withRX:withTX:", -[PLAWDBB newQuality](self, "newQuality"), 0.0, 0.0, 0.0);

}

- (void)finalizeTableWithEntry:(id)a3
{
  double v4;
  id v5;

  objc_msgSend(MEMORY[0x24BE75288], "entryKeyForType:andName:", *MEMORY[0x24BE75218], *MEMORY[0x24BE75378]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PLAWDBB getIntervalSinceLastUpdateWithEntryName:](self, "getIntervalSinceLastUpdateWithEntryName:", v5);
  -[PLAWDBB updateLQMTableWithQuality:withTime:withRX:withTX:](self, "updateLQMTableWithQuality:withTime:withRX:withTX:", -[PLAWDBB newQuality](self, "newQuality"), v4, 0.0, 0.0);

}

- (double)getIntervalSinceLastUpdateWithEntryName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;

  v4 = a3;
  -[PLAWDAuxMetrics operator](self, "operator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastEntryForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "entryDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAWDBB startTimeBBLqm](self, "startTimeBBLqm");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "laterDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceMonitonicNow");
  v12 = -v11;

  return v12;
}

- (void)stopBBLqm
{
  -[PLAWDBB setBbLqmCellularActiveCallback:](self, "setBbLqmCellularActiveCallback:", 0);
  -[PLAWDBB setBbLqmCumulativeNetworkCallback:](self, "setBbLqmCumulativeNetworkCallback:", 0);
}

- (void)submitBBLqm:(id)a3 withAwdConn:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  PLAWDBB *v78;
  id obj;
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  _QWORD v90[3];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE75200];
  +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", *MEMORY[0x24BE75200], CFSTR("awdBBLqm"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAWDBB finalizeTableWithEntry:](self, "finalizeTableWithEntry:", v9);
  v10 = objc_msgSend(v7, "newMetricContainerWithIdentifier:", objc_msgSend(v6, "unsignedIntValue"));
  v11 = (void *)v10;
  if (v10)
  {
    v71 = v8;
    v74 = (void *)v10;
    v76 = v6;
    -[PLAWDBB bbLqmCellularActiveCallback](self, "bbLqmCellularActiveCallback");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "requestEntry");

    -[PLAWDBB bbLqmCumulativeNetworkCallback](self, "bbLqmCumulativeNetworkCallback");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "requestEntry");

    sleep(5u);
    v77 = (void *)objc_opt_new();
    v80 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDateWithTimeIntervalSinceNow:", -86400.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSince1970");
    v17 = v16;
    objc_msgSend(v15, "timeIntervalSince1970");
    v19 = v18 - v17;

    v78 = self;
    -[PLAWDAuxMetrics operator](self, "operator");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "storage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v9;
    objc_msgSend(v21, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v9, 86400.0, v17, v19);
    v22 = objc_claimAutoreleasedReturnValue();

    v73 = (void *)v22;
    objc_msgSend(MEMORY[0x24BE74FB8], "summarizeAggregateEntries:", v22);
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v91, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v86;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v86 != v25)
            objc_enumerationMutation(obj);
          v27 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
          v28 = (void *)objc_opt_new();
          objc_msgSend(v28, "setBundleName:", CFSTR("no name"));
          objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("BBLqmTime"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "doubleValue");
          objc_msgSend(v28, "setStateDuration:", (v30 * 1000.0));

          objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("BBLinkQuality"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "doubleValue");
          objc_msgSend(v28, "setLQM:", (int)v32);

          objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("BBLqmRx"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "doubleValue");
          objc_msgSend(v28, "setRxBytes:", v34);

          objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("BBLqmTx"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "doubleValue");
          objc_msgSend(v28, "setTxBytes:", v36);

          objc_msgSend(v80, "addObject:", v28);
        }
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v91, 16);
      }
      while (v24);
    }
    objc_msgSend(v77, "setLQMBytes:", v80);
    +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", v71, CFSTR("awdBBLqmCounter"));
    v37 = objc_claimAutoreleasedReturnValue();
    -[PLAWDAuxMetrics operator](v78, "operator");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "storage");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = (void *)v37;
    objc_msgSend(v39, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v37, 86400.0, v17, v19);
    v40 = objc_claimAutoreleasedReturnValue();

    v70 = (void *)v40;
    objc_msgSend(MEMORY[0x24BE74FB8], "summarizeAggregateEntries:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    memset(v90, 0, sizeof(v90));
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v81, v89, 16);
    if (v42)
    {
      v43 = v42;
      v44 = 0;
      v45 = *(_QWORD *)v82;
      do
      {
        for (j = 0; j != v43; ++j)
        {
          if (*(_QWORD *)v82 != v45)
            objc_enumerationMutation(v41);
          v47 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * j);
          objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("BBLqmSwitchBucket"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "doubleValue");
          v50 = v49;

          if (v50 == 6.0)
          {
            v44 = 0;
          }
          else
          {
            objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("BBLqmSwitchBucket"));
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "doubleValue");
            v53 = v52;

            if (v53 == 12.0)
            {
              v44 = 1;
            }
            else
            {
              objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("BBLqmSwitchBucket"));
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "doubleValue");
              v56 = v55;

              if (v56 == 20.0)
              {
                v44 = 2;
              }
              else
              {
                objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("BBLqmSwitchBucket"));
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "doubleValue");
                v59 = v58;

                if (v59 == 100.0)
                {
                  v44 = 3;
                }
                else
                {
                  objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("BBLqmSwitchBucket"));
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v60, "doubleValue");
                  v62 = v61;

                  if (v62 == 300.0)
                  {
                    v44 = 4;
                  }
                  else
                  {
                    objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("BBLqmSwitchBucket"));
                    v63 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v63, "doubleValue");
                    v65 = v64;

                    if (v65 == 301.0)
                      v44 = 5;
                  }
                }
              }
            }
          }
          objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("BBLqmSwitchCounter"));
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "doubleValue");
          *((_DWORD *)v90 + v44) = v67;

        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v81, v89, 16);
      }
      while (v43);
    }
    objc_msgSend(v77, "setLQMTransitionCntBuckets:count:", v90, 6);
    objc_msgSend(v77, "setLQMBytes:", v80);
    v11 = v74;
    objc_msgSend(v74, "setMetric:", v77);
    objc_msgSend(v7, "submitMetric:", v74);

    v6 = v76;
    self = v78;
    v9 = v75;
  }
  -[PLAWDBB setUpBytes:](self, "setUpBytes:", 0);
  -[PLAWDBB setDownBytes:](self, "setDownBytes:", 0);
  -[PLAWDBB setUpBytesLTE:](self, "setUpBytesLTE:", 0);
  -[PLAWDBB setDownBytesLTE:](self, "setDownBytesLTE:", 0);
  -[PLAWDBB bbLqmCumulativeNetworkCallback](self, "bbLqmCumulativeNetworkCallback");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "requestEntry");

  -[PLAWDBB resetAllBBLqmTables](self, "resetAllBBLqmTables");
  objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAWDBB setStartTimeBBLqm:](self, "setStartTimeBBLqm:", v69);

  -[PLAWDBB updateCurrLqmState](self, "updateCurrLqmState");
}

- (void)handleBBLqmCumulativeNetworkCallback:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  uint64_t v12;
  void *v13;
  double v14;
  uint64_t v15;
  void *v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  uint64_t v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  void *v47;
  double v48;
  void *v49;
  double v50;
  id v51;

  v51 = a3;
  if (!-[PLAWDBB currQuality](self, "currQuality"))
    -[PLAWDBB updateCurrLqmState](self, "updateCurrLqmState");
  objc_msgSend(v51, "objectForKey:", CFSTR("entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Interface"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@"), v6);

  if (objc_msgSend(v7, "isEqualToString:", CFSTR("pdp_ip0")))
  {
    if (-[PLAWDBB telActivityState](self, "telActivityState") == 1)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UpBytes"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "doubleValue");
      -[PLAWDBB setUpBytesLTE:](self, "setUpBytesLTE:", v9);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DownBytes"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
      -[PLAWDBB setDownBytesLTE:](self, "setDownBytesLTE:", v11);

      v12 = 2;
    }
    else
    {
      if (-[PLAWDBB telActivityState](self, "telActivityState") != 3)
      {
LABEL_9:
        -[PLAWDBB unhandledRFLTEEntries](self, "unhandledRFLTEEntries");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");

        if (v19)
        {
          objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLAWDBB setEndLTECall:](self, "setEndLTECall:", v20);

          -[PLAWDBB endLTECall](self, "endLTECall");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLAWDBB lteCallArray](self, "lteCallArray");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLAWDBB lteCallArray](self, "lteCallArray");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectAtIndexedSubscript:", objc_msgSend(v23, "count") - 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setEndDate:", v21);

          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UpBytes"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "doubleValue");
          v27 = (v26 - (double)-[PLAWDBB upBytesLTE](self, "upBytesLTE"));
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DownBytes"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "doubleValue");
          -[PLAWDBB finalizePeriodWithUpBytes:withDownBytes:](self, "finalizePeriodWithUpBytes:withDownBytes:", v27, (v29 - (double)-[PLAWDBB downBytesLTE](self, "downBytesLTE")));

          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UpBytes"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "doubleValue");
          -[PLAWDBB setUpBytesLTE:](self, "setUpBytesLTE:", v31);

          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DownBytes"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "doubleValue");
          -[PLAWDBB setDownBytesLTE:](self, "setDownBytesLTE:", v33);

          -[PLAWDBB handleRfLTEOffline](self, "handleRfLTEOffline");
          objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLAWDBB setStartLTECall:](self, "setStartLTECall:", v34);

          v35 = (void *)objc_opt_new();
          -[PLAWDBB setPoint:](self, "setPoint:", v35);

          -[PLAWDBB startLTECall](self, "startLTECall");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLAWDBB point](self, "point");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setStartDate:", v36);

          -[PLAWDBB point](self, "point");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setEndDate:", 0);

          -[PLAWDBB lteCallArray](self, "lteCallArray");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLAWDBB point](self, "point");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "addObject:", v40);

        }
        if (-[PLAWDBB upBytes](self, "upBytes")
          && -[PLAWDBB downBytes](self, "downBytes")
          && -[PLAWDBB currQuality](self, "currQuality"))
        {
          v41 = -[PLAWDBB currQuality](self, "currQuality");
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UpBytes"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "doubleValue");
          v44 = v43 - (double)-[PLAWDBB upBytes](self, "upBytes");
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DownBytes"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "doubleValue");
          -[PLAWDBB updateLQMTableWithQuality:withTime:withRX:withTX:](self, "updateLQMTableWithQuality:withTime:withRX:withTX:", v41, 0.0, v44, v46 - (double)-[PLAWDBB downBytes](self, "downBytes"));

        }
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UpBytes"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "doubleValue");
        -[PLAWDBB setUpBytes:](self, "setUpBytes:", v48);

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DownBytes"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "doubleValue");
        -[PLAWDBB setDownBytes:](self, "setDownBytes:", v50);

        goto LABEL_16;
      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UpBytes"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      v15 = (v14 - (double)-[PLAWDBB upBytesLTE](self, "upBytesLTE"));
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DownBytes"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "doubleValue");
      -[PLAWDBB finalizePeriodWithUpBytes:withDownBytes:](self, "finalizePeriodWithUpBytes:withDownBytes:", v15, (v17 - (double)-[PLAWDBB downBytesLTE](self, "downBytesLTE")));

      -[PLAWDBB setUpBytesLTE:](self, "setUpBytesLTE:", 0);
      -[PLAWDBB setDownBytesLTE:](self, "setDownBytesLTE:", 0);
      v12 = 0;
    }
    -[PLAWDBB setTelActivityState:](self, "setTelActivityState:", v12);
    goto LABEL_9;
  }
LABEL_16:

}

- (int)convertQualityWithLinkQuality:(double)a3
{
  int v3;
  int v4;

  if (a3 >= 10.0)
    v3 = 3;
  else
    v3 = 0;
  if (a3 < 50.0)
    v4 = v3;
  else
    v4 = 2;
  if (a3 < 100.0)
    return v4;
  else
    return 1;
}

- (void)handleBBLqmCellularActiveCallback:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  double v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD block[5];

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAWDAuxMetrics operator](self, "operator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entryForKey:withID:", v7, objc_msgSend(v4, "entryID") - 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (v8)
    {
      +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", *MEMORY[0x24BE75200], CFSTR("awdBBLqmCounter"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74FB8]), "initWithEntryKey:", v9);
      objc_msgSend(v4, "entryDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSince1970");
      v13 = v12;
      objc_msgSend(v8, "entryDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAWDBB startTimeBBLqm](self, "startTimeBBLqm");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "laterDate:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeIntervalSince1970");
      v18 = v17;

      -[PLAWDBB setCurrQuality:](self, "setCurrQuality:", -[PLAWDBB newQuality](self, "newQuality"));
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LinkQuality"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "doubleValue");
      -[PLAWDBB setNewQuality:](self, "setNewQuality:", -[PLAWDBB convertQualityWithLinkQuality:](self, "convertQualityWithLinkQuality:"));

      if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v20 = objc_opt_class();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __45__PLAWDBB_handleBBLqmCellularActiveCallback___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v20;
        if (handleBBLqmCellularActiveCallback__defaultOnce != -1)
          dispatch_once(&handleBBLqmCellularActiveCallback__defaultOnce, block);
        if (handleBBLqmCellularActiveCallback__classDebugEnabled)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("type - %d; curr - %d"),
            -[PLAWDBB newQuality](self, "newQuality"),
            -[PLAWDBB currQuality](self, "currQuality"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBB.m");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "lastPathComponent");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDBB handleBBLqmCellularActiveCallback:]");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v24, v25, 548);

          PLLogCommon();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            -[PLAWDDisplay startMetricCollection:].cold.1();

        }
      }
      v27 = v13 - v18;
      v28 = -[PLAWDBB newQuality](self, "newQuality");
      if (v28 != -[PLAWDBB currQuality](self, "currQuality")
        && -[PLAWDBB newQuality](self, "newQuality")
        && -[PLAWDBB currQuality](self, "currQuality"))
      {
        if (v27 >= 6.0)
        {
          if (v27 >= 12.0)
          {
            if (v27 >= 20.0)
            {
              if (v27 >= 100.0)
              {
                if (v27 >= 300.0)
                  v29 = &unk_24EB64A00;
                else
                  v29 = &unk_24EB649E8;
              }
              else
              {
                v29 = &unk_24EB649D0;
              }
            }
            else
            {
              v29 = &unk_24EB649B8;
            }
          }
          else
          {
            v29 = &unk_24EB649A0;
          }
        }
        else
        {
          v29 = &unk_24EB64988;
        }
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v29, CFSTR("BBLqmSwitchBucket"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_24EB64A18, CFSTR("BBLqmSwitchCounter"));
        -[PLAWDAuxMetrics operator](self, "operator");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "logEntry:", v10);

      }
      -[PLAWDBB updateLQMTableWithQuality:withTime:withRX:withTX:](self, "updateLQMTableWithQuality:withTime:withRX:withTX:", -[PLAWDBB currQuality](self, "currQuality"), v27, 0.0, 0.0);
      if (v27 < 10.0)
      {
        -[PLAWDBB setUpBytes:](self, "setUpBytes:", 0);
        -[PLAWDBB setDownBytes:](self, "setDownBytes:", 0);
      }
      -[PLAWDBB bbLqmCumulativeNetworkCallback](self, "bbLqmCumulativeNetworkCallback");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "requestEntry");

    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LinkQuality"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      -[PLAWDBB setNewQuality:](self, "setNewQuality:", -[PLAWDBB convertQualityWithLinkQuality:](self, "convertQualityWithLinkQuality:"));
    }

  }
}

uint64_t __45__PLAWDBB_handleBBLqmCellularActiveCallback___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleBBLqmCellularActiveCallback__classDebugEnabled = result;
  return result;
}

- (void)resetAllBBLqmTables
{
  -[PLAWDBB resetBBLqmTable](self, "resetBBLqmTable");
  -[PLAWDBB resetBBLqmCounterTable](self, "resetBBLqmCounterTable");
}

- (void)resetBBLqmTable
{
  void *v3;
  objc_super v4;

  +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", *MEMORY[0x24BE75200], CFSTR("awdBBLqm"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4.receiver = self;
  v4.super_class = (Class)PLAWDBB;
  -[PLAWDAuxMetrics resetTableWithEntryKey:](&v4, sel_resetTableWithEntryKey_, v3);

}

- (void)resetBBLqmCounterTable
{
  void *v3;
  objc_super v4;

  +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", *MEMORY[0x24BE75200], CFSTR("awdBBLqmCounter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4.receiver = self;
  v4.super_class = (Class)PLAWDBB;
  -[PLAWDAuxMetrics resetTableWithEntryKey:](&v4, sel_resetTableWithEntryKey_, v3);

}

+ (id)entryAggregateDefinitionAwdVolte
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
  v24[0] = &unk_24EB646F0;
  v24[1] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v15;
  v25[1] = *MEMORY[0x24BE751E8];
  v21[0] = CFSTR("BBLteThreshold");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v3;
  v21[1] = CFSTR("BBLteType");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v5;
  v21[2] = CFSTR("BBLteValue");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v8;
  v25[2] = *MEMORY[0x24BE751A0];
  v19 = &unk_24EB64700;
  v17 = *MEMORY[0x24BE75198];
  v18 = &unk_24EB64700;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v10;
  v25[3] = *MEMORY[0x24BE751A8];
  v16 = CFSTR("BBLteValue");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)startAppRrc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];

  -[PLAWDBB setTelActivityState:](self, "setTelActivityState:", 0);
  v3 = (void *)objc_opt_new();
  -[PLAWDBB setLteCallArray:](self, "setLteCallArray:", v3);

  v4 = (void *)objc_opt_new();
  -[PLAWDBB setUnhandledRFLTEEntries:](self, "setUnhandledRFLTEEntries:", v4);

  v5 = (void *)objc_opt_new();
  -[PLAWDBB setLock:](self, "setLock:", v5);

  -[PLAWDBB resetBBVoLTETable](self, "resetBBVoLTETable");
  objc_msgSend(MEMORY[0x24BE75240], "entryKeyForType:andName:", *MEMORY[0x24BE75230], *MEMORY[0x24BE752C0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x24BE74FC8]);
  -[PLAWDAuxMetrics operator](self, "operator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __22__PLAWDBB_startAppRrc__block_invoke;
  v16[3] = &unk_24EB5CDA0;
  v16[4] = self;
  v10 = (void *)objc_msgSend(v7, "initWithOperator:forEntryKey:withBlock:", v8, v6, v16);

  -[PLAWDBB setBbTelephonyActivityCallback:](self, "setBbTelephonyActivityCallback:", v10);
  objc_msgSend(MEMORY[0x24BE75240], "entryKeyForType:andName:", *MEMORY[0x24BE75210], *MEMORY[0x24BE75300]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x24BE74FC8]);
  -[PLAWDAuxMetrics operator](self, "operator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __22__PLAWDBB_startAppRrc__block_invoke_2;
  v15[3] = &unk_24EB5CDA0;
  v15[4] = self;
  v14 = (void *)objc_msgSend(v12, "initWithOperator:forEntryKey:withBlock:", v13, v11, v15);

  -[PLAWDBB setBbRfLTECallback:](self, "setBbRfLTECallback:", v14);
}

uint64_t __22__PLAWDBB_startAppRrc__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleTelephonyActiveCallback:", a2);
  return result;
}

uint64_t __22__PLAWDBB_startAppRrc__block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleRfLTE:", a2);
  return result;
}

- (void)stopAppRrc
{
  -[PLAWDBB setBbTelephonyActivityCallback:](self, "setBbTelephonyActivityCallback:", 0);
  -[PLAWDBB setBbRfLTECallback:](self, "setBbRfLTECallback:", 0);
}

- (void)submitAppRrc:(id)a3 withAwdConn:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  int v33;
  void *v34;
  int v35;
  void *v36;
  int v37;
  char *v38;
  _QWORD *v39;
  void *v40;
  void *v41;
  int v42;
  int v43;
  char *v44;
  BOOL v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  PLAWDBB *v55;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _QWORD v63[3];
  _QWORD v64[3];
  _QWORD v65[2];
  uint64_t v66;
  _QWORD v67[2];
  uint64_t v68;
  _QWORD v69[2];
  int v70;
  _BYTE v71[4];
  _QWORD v72[2];
  int v73;
  _BYTE v74[4];
  _QWORD v75[2];
  int v76;
  _QWORD v77[2];
  int v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = objc_msgSend(v6, "newMetricContainerWithIdentifier:", objc_msgSend(a3, "unsignedIntValue"));
  v8 = (void *)v7;
  if (v7)
  {
    v56 = (void *)v7;
    objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDateWithTimeIntervalSinceNow:", -604800.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSince1970");
    v12 = v11;
    objc_msgSend(v10, "timeIntervalSince1970");
    v14 = v13 - v12;

    +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", *MEMORY[0x24BE75200], CFSTR("Volte"));
    v15 = objc_claimAutoreleasedReturnValue();
    v55 = self;
    -[PLAWDAuxMetrics operator](self, "operator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "storage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)v15;
    objc_msgSend(v17, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v15, 86400.0, v12, v14);
    v18 = objc_claimAutoreleasedReturnValue();

    v53 = (void *)v18;
    objc_msgSend(MEMORY[0x24BE74FB8], "summarizeAggregateEntries:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v6;
    v52 = (void *)objc_opt_new();
    objc_msgSend(v52, "setTimestamp:", objc_msgSend(v6, "getAWDTimestamp"));
    v51 = (void *)objc_opt_new();
    v20 = (void *)objc_opt_new();
    v21 = (void *)objc_opt_new();
    v22 = (void *)objc_opt_new();
    v23 = (void *)objc_opt_new();
    v50 = v20;
    objc_msgSend(v20, "setThreshold:", 200);
    v49 = v21;
    objc_msgSend(v21, "setThreshold:", 1000);
    v48 = v22;
    objc_msgSend(v22, "setThreshold:", 10000);
    objc_msgSend(v23, "setThreshold:", 11000);
    v77[0] = 0;
    v77[1] = 0;
    v78 = 0;
    v75[0] = 0;
    v75[1] = 0;
    v76 = 0;
    v72[0] = 0;
    v72[1] = 0;
    v73 = 0;
    v69[0] = 0;
    v69[1] = 0;
    v70 = 0;
    v67[0] = 0;
    v67[1] = 0;
    v68 = 0;
    v65[0] = 0;
    v65[1] = 0;
    v66 = 0;
    memset(v64, 0, sizeof(v64));
    memset(v63, 0, sizeof(v63));
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v24 = v19;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
    if (!v25)
      goto LABEL_23;
    v26 = v25;
    v27 = *(_QWORD *)v59;
    while (1)
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v59 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("BBLteThreshold"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "intValue");

        if (v31 > 9999)
        {
          if (v31 == 10000)
          {
            objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("BBLteType"));
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v46, "intValue");

            objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("BBLteValue"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "intValue");
            objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("BBLteType"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "intValue");
            v38 = (char *)&v68 + 4 * v37 + 4;
            v39 = v64;
          }
          else
          {
            if (v31 != 11000)
              continue;
            objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("BBLteType"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v40, "intValue");

            objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("BBLteValue"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "intValue");
            objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("BBLteType"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "intValue");
            v38 = (char *)&v66 + 4 * v37 + 4;
            v39 = v63;
          }
          goto LABEL_16;
        }
        if (v31 != 200)
        {
          if (v31 != 1000)
            continue;
          objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("BBLteType"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "intValue");

          objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("BBLteValue"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "intValue");
          objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("BBLteType"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "intValue");
          v38 = &v71[4 * v37];
          v39 = v65;
LABEL_16:
          v44 = (char *)v39 + 4 * v37;
          v45 = v33 <= 6;
          goto LABEL_17;
        }
        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("BBLteType"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "intValue");

        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("BBLteValue"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "intValue");
        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("BBLteType"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v36, "intValue");
        v38 = &v74[4 * v43];
        v44 = (char *)v67 + 4 * v43;
        v45 = v42 <= 6;
LABEL_17:
        if (v45)
          v38 = v44;
        *(_DWORD *)v38 += v35;

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
      if (!v26)
      {
LABEL_23:
        v47 = v24;

        objc_msgSend(v50, "setRxTxDurations:count:", v77, 5);
        objc_msgSend(v49, "setRxTxDurations:count:", v75, 5);
        objc_msgSend(v48, "setRxTxDurations:count:", v72, 5);
        objc_msgSend(v23, "setRxTxDurations:count:", v69, 5);
        objc_msgSend(v50, "setSleepStateDurations:count:", v67, 6);
        objc_msgSend(v49, "setSleepStateDurations:count:", v65, 6);
        objc_msgSend(v48, "setSleepStateDurations:count:", v64, 6);
        objc_msgSend(v23, "setSleepStateDurations:count:", v63, 6);
        objc_msgSend(v51, "addObject:", v50);
        objc_msgSend(v51, "addObject:", v49);
        objc_msgSend(v51, "addObject:", v48);
        objc_msgSend(v51, "addObject:", v23);
        objc_msgSend(v52, "addMetrics:", v50);
        objc_msgSend(v52, "addMetrics:", v49);
        objc_msgSend(v52, "addMetrics:", v48);
        objc_msgSend(v52, "addMetrics:", v23);
        v8 = v56;
        objc_msgSend(v56, "setMetric:", v52);
        v6 = v57;
        objc_msgSend(v57, "submitMetric:", v56);
        -[PLAWDBB resetBBVoLTETable](v55, "resetBBVoLTETable");

        break;
      }
    }
  }

}

- (void)resetBBVoLTETable
{
  void *v3;
  objc_super v4;

  +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", *MEMORY[0x24BE75200], CFSTR("Volte"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4.receiver = self;
  v4.super_class = (Class)PLAWDBB;
  -[PLAWDAuxMetrics resetTableWithEntryKey:](&v4, sel_resetTableWithEntryKey_, v3);

}

- (void)handleTelephonyActiveCallback:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("callStatus"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@"), v5);

  v7 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("campedRat"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("%@"), v8);

  if (objc_msgSend(v9, "isEqualToString:", CFSTR("LTE")))
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("Active")))
    {
      if (-[PLAWDBB telActivityState](self, "telActivityState") != 1)
      {
        -[PLAWDBB setTelActivityState:](self, "setTelActivityState:", 1);
        objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLAWDBB setStartLTECall:](self, "setStartLTECall:", v10);

        v11 = (void *)objc_opt_new();
        -[PLAWDBB setPoint:](self, "setPoint:", v11);

        -[PLAWDBB startLTECall](self, "startLTECall");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLAWDBB point](self, "point");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setStartDate:", v12);

        -[PLAWDBB point](self, "point");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setEndDate:", 0);

        -[PLAWDBB lteCallArray](self, "lteCallArray");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLAWDBB point](self, "point");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v16);
LABEL_10:

        -[PLAWDBB bbLqmCumulativeNetworkCallback](self, "bbLqmCumulativeNetworkCallback");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "requestEntry");

      }
    }
    else if (objc_msgSend(v6, "isEqualToString:", CFSTR("Inactive"))
           && (-[PLAWDBB telActivityState](self, "telActivityState") == 1
            || -[PLAWDBB telActivityState](self, "telActivityState") == 2))
    {
      -[PLAWDBB setTelActivityState:](self, "setTelActivityState:", 3);
      objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAWDBB setEndLTECall:](self, "setEndLTECall:", v17);

      -[PLAWDBB endLTECall](self, "endLTECall");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAWDBB lteCallArray](self, "lteCallArray");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAWDBB lteCallArray](self, "lteCallArray");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v18, "count") - 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setEndDate:", v15);

      goto LABEL_10;
    }
  }
  else
  {
    -[PLAWDBB setTelActivityState:](self, "setTelActivityState:", 0);
  }

}

- (void)handleRfLTEOffline
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
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
  id obj;

  -[PLAWDBB lock](self, "lock");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  v3 = *MEMORY[0x24BE75210];
  v4 = *MEMORY[0x24BE75300];
  while (1)
  {
    -[PLAWDBB unhandledRFLTEEntries](self, "unhandledRFLTEEntries");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (!v6)
      break;
    objc_msgSend(MEMORY[0x24BE75240], "entryKeyForType:andName:", v3, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAWDAuxMetrics operator](self, "operator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAWDBB unhandledRFLTEEntries](self, "unhandledRFLTEEntries");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "entryForKey:withID:", v7, (int)objc_msgSend(v11, "intValue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLAWDBB lteCallArray](self, "lteCallArray");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAWDBB lteCallArray](self, "lteCallArray");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v14, "count") - 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAWDBB bbLTEWriteAggregatedTableWithRFLTEEntry:withPoint:](self, "bbLTEWriteAggregatedTableWithRFLTEEntry:withPoint:", v12, v15);

    -[PLAWDBB unhandledRFLTEEntries](self, "unhandledRFLTEEntries");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObjectAtIndex:", 0);

  }
  objc_sync_exit(obj);

}

- (void)handleRfLTE:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a3;
  objc_msgSend(v30, "objectForKey:", CFSTR("entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    -[PLAWDBB lteCallArray](self, "lteCallArray");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (!v6)
      break;
    -[PLAWDBB lteCallArray](self, "lteCallArray");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "entryDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dateByAddingTimeInterval:", 10.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "compare:", v11);

    if (v12 == -1)
      goto LABEL_14;
    objc_msgSend(v8, "endDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      -[PLAWDBB currThreshold](self, "currThreshold");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "startDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "dateByAddingTimeInterval:", 30.0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "entryDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "compare:", v22);

      if (v23 == -1)
      {
        -[PLAWDBB currThreshold](self, "currThreshold");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLAWDBB bbLTEWriteAggregatedTableWithRFLTEEntry:withPoint:](self, "bbLTEWriteAggregatedTableWithRFLTEEntry:withPoint:", v4, v24);
      }
      else
      {
        -[PLAWDBB lock](self, "lock");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_sync_enter(v24);
        -[PLAWDBB unhandledRFLTEEntries](self, "unhandledRFLTEEntries");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "count");

        if (!v26)
        {
          -[PLAWDBB bbLqmCumulativeNetworkCallback](self, "bbLqmCumulativeNetworkCallback");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "requestEntry");

        }
        -[PLAWDBB unhandledRFLTEEntries](self, "unhandledRFLTEEntries");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v4, "entryID"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addObject:", v29);

        objc_sync_exit(v24);
      }

      goto LABEL_14;
    }
    objc_msgSend(v4, "entryDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dateByAddingTimeInterval:", 10.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v14, "compare:", v16);

    if (v17 != 1)
    {
      -[PLAWDBB bbLTEWriteAggregatedTableWithRFLTEEntry:withPoint:](self, "bbLTEWriteAggregatedTableWithRFLTEEntry:withPoint:", v4, v8);
LABEL_14:

      break;
    }
    -[PLAWDBB lteCallArray](self, "lteCallArray");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeObjectAtIndex:", 0);

  }
}

- (void)bbLTEWriteAggregatedTableWithRFLTEEntry:(id)a3 withPoint:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a3;
  v6 = a4;
  +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", *MEMORY[0x24BE75200], CFSTR("Volte"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  do
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74FB8]), "initWithEntryKey:", v7);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v6, "threshold"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("BBLteThreshold"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("BBLteType"));

    switch((int)v8)
    {
      case 0:
        v12 = v27;
        v13 = CFSTR("SleepStateArr");
        goto LABEL_10;
      case 1:
        v14 = v27;
        v15 = CFSTR("SleepStateArr");
        goto LABEL_12;
      case 2:
        v16 = v27;
        v17 = CFSTR("SleepStateArr");
        goto LABEL_14;
      case 3:
        v18 = v27;
        v19 = CFSTR("SleepStateArr");
        goto LABEL_16;
      case 4:
        v20 = v27;
        v21 = CFSTR("SleepStateArr");
        goto LABEL_18;
      case 5:
        objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("SleepStateArr"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        v24 = 5;
        goto LABEL_19;
      case 7:
        v12 = v27;
        v13 = CFSTR("kRfActRxTxArr");
LABEL_10:
        objc_msgSend(v12, "objectForKeyedSubscript:", v13);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        v24 = 0;
        goto LABEL_19;
      case 8:
        v14 = v27;
        v15 = CFSTR("kRfActRxTxArr");
LABEL_12:
        objc_msgSend(v14, "objectForKeyedSubscript:", v15);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        v24 = 1;
        goto LABEL_19;
      case 9:
        v16 = v27;
        v17 = CFSTR("kRfActRxTxArr");
LABEL_14:
        objc_msgSend(v16, "objectForKeyedSubscript:", v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        v24 = 2;
        goto LABEL_19;
      case 10:
        v18 = v27;
        v19 = CFSTR("kRfActRxTxArr");
LABEL_16:
        objc_msgSend(v18, "objectForKeyedSubscript:", v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        v24 = 3;
        goto LABEL_19;
      case 11:
        v20 = v27;
        v21 = CFSTR("kRfActRxTxArr");
LABEL_18:
        objc_msgSend(v20, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        v24 = 4;
LABEL_19:
        objc_msgSend(v22, "objectAtIndexedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v25, CFSTR("BBLteValue"));

        break;
      default:
        break;
    }
    -[PLAWDAuxMetrics operator](self, "operator");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "logEntry:", v9);

    v8 = (v8 + 1);
  }
  while ((_DWORD)v8 != 12);

}

- (void)finalizePeriodWithUpBytes:(unsigned int)a3 withDownBytes:(unsigned int)a4
{
  void *v7;
  void *v8;
  double v9;
  double v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  -[PLAWDBB endLTECall](self, "endLTECall");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAWDBB startLTECall](self, "startLTECall");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  v10 = v9;

  v11 = vcvtd_n_s64_f64((double)a3 / v10, 3uLL) + vcvtd_n_s64_f64((double)a4 / v10, 3uLL);
  if ((int)v11 > 199)
  {
    if (v11 > 0x3E7)
    {
      -[PLAWDBB lteCallArray](self, "lteCallArray");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      -[PLAWDBB lteCallArray](self, "lteCallArray");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v12, "count") - 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v11 >> 4 > 0x270)
        v15 = 11000;
      else
        v15 = 10000;
    }
    else
    {
      -[PLAWDBB lteCallArray](self, "lteCallArray");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      -[PLAWDBB lteCallArray](self, "lteCallArray");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v12, "count") - 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = 1000;
    }
  }
  else
  {
    -[PLAWDBB lteCallArray](self, "lteCallArray");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[PLAWDBB lteCallArray](self, "lteCallArray");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v12, "count") - 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = 200;
  }
  objc_msgSend(v13, "setThreshold:", v15);

}

- (void)startAppBB
{
  id v3;

  objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PLAWDBB setStartTimeAppBB:](self, "setStartTimeAppBB:", v3);

}

- (void)submitAppBB:(id)a3 withAwdConn:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t i;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a4;
  v6 = (void *)objc_msgSend(v21, "newMetricContainerWithIdentifier:", objc_msgSend(a3, "unsignedIntValue"));
  if (v6)
  {
    v7 = (void *)objc_opt_new();
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[PLAWDAuxMetrics operator](self, "operator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "defaultBoolForKey:", CFSTR("simulatedMode"));

    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAWDBB setStartTimeAppBB:](self, "setStartTimeAppBB:", v12);

    }
    objc_msgSend(v9, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sortedArrayUsingSelector:", sel_compare_);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "reverseObjectEnumerator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    for (i = 0; i != 10; ++i)
    {
      if (objc_msgSend(v16, "count") <= i)
        break;
      objc_msgSend(v16, "objectAtIndexedSubscript:", i);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v19);

    }
    objc_msgSend(v7, "setAppPowers:", v8);
    objc_msgSend(v6, "setMetric:", v7);
    objc_msgSend(v21, "submitMetric:", v6);
    objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAWDBB setStartTimeAppBB:](self, "setStartTimeAppBB:", v20);

  }
}

+ (id)entryAggregateDefinitionAwdConnectedPower
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
  v22[0] = &unk_24EB646F0;
  v22[1] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v3;
  v23[1] = *MEMORY[0x24BE751E8];
  v19[0] = CFSTR("RailIndex");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = CFSTR("RailValue");
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
  v17 = &unk_24EB64700;
  v15 = *MEMORY[0x24BE75198];
  v16 = &unk_24EB64700;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v10;
  v23[3] = *MEMORY[0x24BE751A8];
  v14 = CFSTR("RailValue");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)startConnectedPower
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[PLAWDBB resetConnectedPowerTable](self, "resetConnectedPowerTable");
  v3 = objc_alloc(MEMORY[0x24BE74FC8]);
  -[PLAWDAuxMetrics operator](self, "operator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __30__PLAWDBB_startConnectedPower__block_invoke;
  v6[3] = &unk_24EB5CDA0;
  v6[4] = self;
  v5 = (void *)objc_msgSend(v3, "initWithOperator:forEntryKey:withBlock:", v4, CFSTR("PLRail_EventNone_Rail"), v6);

  -[PLAWDBB setConnectedPowerRailCallback:](self, "setConnectedPowerRailCallback:", v5);
}

uint64_t __30__PLAWDBB_startConnectedPower__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleBBConnectedPowerRail:", a2);
  return result;
}

- (void)stopConnectedPower
{
  -[PLAWDBB setConnectedPowerRailCallback:](self, "setConnectedPowerRailCallback:", 0);
}

- (BOOL)submitConnectedPower:(id)a3 withAwdConn:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t i;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  double v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  __int16 v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  void *v46;
  void *v47;
  void *v48;
  PLAWDBB *v49;
  void *v50;
  id v51;
  void *v52;
  id obj;
  id obja;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)objc_msgSend(v6, "newMetricContainerWithIdentifier:", objc_msgSend(a3, "unsignedIntValue"));
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDateWithTimeIntervalSinceNow:", -86400.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSince1970");
    v11 = v10;
    objc_msgSend(v9, "timeIntervalSince1970");
    v13 = v12 - v11;

    +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", *MEMORY[0x24BE75200], CFSTR("BBConnectedPower"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAWDAuxMetrics operator](self, "operator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "storage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v14, 86400.0, v11, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE74FB8], "summarizeAggregateEntries:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)objc_opt_new();
    if (objc_msgSend(MEMORY[0x24BE74FD8], "isBasebandClass:", 1003003))
    {
      v47 = v17;
      v48 = v14;
      v49 = self;
      v50 = v7;
      v51 = v6;
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      v46 = v18;
      obj = v18;
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v60;
        v22 = 0.0;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v60 != v21)
              objc_enumerationMutation(obj);
            v24 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
            v25 = objc_alloc(MEMORY[0x24BDD17C8]);
            objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("RailIndex"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = (void *)objc_msgSend(v25, "initWithFormat:", CFSTR("%@"), v26);
            v28 = objc_msgSend(v27, "intValue");

            if ((v28 & 0xFFFD) == 1 || v28 << 16 == 0x40000 || v28 << 16 == 0x20000)
            {
              objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("RailValue"));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "doubleValue");
              v22 = v22 + v30;

            }
          }
          v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
        }
        while (v20);
        goto LABEL_29;
      }
    }
    else
    {
      if ((objc_msgSend(MEMORY[0x24BE74FD8], "isBasebandClass:", 1003002) & 1) == 0)
      {
        v22 = 0.0;
        if (!objc_msgSend(MEMORY[0x24BE74FD8], "isBasebandClass:", 1003001))
          goto LABEL_30;
      }
      v47 = v17;
      v48 = v14;
      v49 = self;
      v50 = v7;
      v51 = v6;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v46 = v18;
      obja = v18;
      v32 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v56;
        v22 = 0.0;
        do
        {
          for (j = 0; j != v33; ++j)
          {
            if (*(_QWORD *)v56 != v34)
              objc_enumerationMutation(obja);
            v36 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
            v37 = objc_alloc(MEMORY[0x24BDD17C8]);
            objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("RailIndex"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = (void *)objc_msgSend(v37, "initWithFormat:", CFSTR("%@"), v38);
            v40 = objc_msgSend(v39, "intValue");

            if ((v40 & 0xFFFC) == 4)
            {
              objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("RailValue"));
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "doubleValue");
              v22 = v22 + v42;

            }
          }
          v33 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
        }
        while (v33);
        goto LABEL_29;
      }
    }
    v22 = 0.0;
LABEL_29:
    v18 = v46;

    v7 = v50;
    v6 = v51;
    v14 = v48;
    self = v49;
    v17 = v47;
LABEL_30:
    v43 = (void *)objc_opt_new();
    objc_msgSend(v43, "setRAT:", 0);
    objc_msgSend(v43, "setPowerConnSetupMicroWatt:", 0);
    objc_msgSend(v43, "setPowerConnectedMicroWatt:", v22);
    v44 = (void *)objc_opt_new();
    objc_msgSend(v44, "addObject:", v43);
    objc_msgSend(v52, "setTimestamp:", objc_msgSend(v6, "getAWDTimestamp"));
    objc_msgSend(v52, "setRATPowers:", v44);
    objc_msgSend(v7, "setMetric:", v52);
    -[PLAWDBB resetConnectedPowerTable](self, "resetConnectedPowerTable");
    v31 = objc_msgSend(v6, "submitMetric:", v7);

    goto LABEL_31;
  }
  -[PLAWDBB resetConnectedPowerTable](self, "resetConnectedPowerTable");
  v31 = 0;
LABEL_31:

  return v31;
}

- (void)resetConnectedPowerTable
{
  void *v3;
  objc_super v4;

  +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", *MEMORY[0x24BE75200], CFSTR("BBConnectedPower"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4.receiver = self;
  v4.super_class = (Class)PLAWDBB;
  -[PLAWDAuxMetrics resetTableWithEntryKey:](&v4, sel_resetTableWithEntryKey_, v3);

}

- (void)startBBPower
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = objc_alloc(MEMORY[0x24BE74FC8]);
  -[PLAWDAuxMetrics operator](self, "operator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __23__PLAWDBB_startBBPower__block_invoke;
  v6[3] = &unk_24EB5CDA0;
  v6[4] = self;
  v5 = (void *)objc_msgSend(v3, "initWithOperator:forEntryKey:withBlock:", v4, CFSTR("PLRail_EventNone_Rail"), v6);

  -[PLAWDBB setBbProtocolRailCallback:](self, "setBbProtocolRailCallback:", v5);
}

uint64_t __23__PLAWDBB_startBBPower__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleBBRailCallbackWrapper:", a2);
  return result;
}

- (void)stopBBPower
{
  -[PLAWDBB setBbProtocolRailCallback:](self, "setBbProtocolRailCallback:", 0);
  -[PLAWDBB setAccountingGroupEventCallback:](self, "setAccountingGroupEventCallback:", 0);
  -[PLAWDBB setIceStatsEventCallback:](self, "setIceStatsEventCallback:", 0);
}

- (void)handleBBRailCallbackBBProtocol:(id)a3
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

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__PLAWDBB_handleBBRailCallbackBBProtocol___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (handleBBRailCallbackBBProtocol__defaultOnce != -1)
      dispatch_once(&handleBBRailCallbackBBProtocol__defaultOnce, block);
    if (handleBBRailCallbackBBProtocol__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s - %@"), "-[PLAWDBB handleBBRailCallbackBBProtocol:]", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBB.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDBB handleBBRailCallbackBBProtocol:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 1281);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }

}

uint64_t __42__PLAWDBB_handleBBRailCallbackBBProtocol___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleBBRailCallbackBBProtocol__classDebugEnabled = result;
  return result;
}

- (void)handleBBRailCallbackLTESleep:(id)a3
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

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __40__PLAWDBB_handleBBRailCallbackLTESleep___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (handleBBRailCallbackLTESleep__defaultOnce != -1)
      dispatch_once(&handleBBRailCallbackLTESleep__defaultOnce, block);
    if (handleBBRailCallbackLTESleep__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s - %@"), "-[PLAWDBB handleBBRailCallbackLTESleep:]", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBB.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDBB handleBBRailCallbackLTESleep:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 1287);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }

}

uint64_t __40__PLAWDBB_handleBBRailCallbackLTESleep___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleBBRailCallbackLTESleep__classDebugEnabled = result;
  return result;
}

- (void)handleBBRailCallbackTxLte:(id)a3
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

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37__PLAWDBB_handleBBRailCallbackTxLte___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (handleBBRailCallbackTxLte__defaultOnce != -1)
      dispatch_once(&handleBBRailCallbackTxLte__defaultOnce, block);
    if (handleBBRailCallbackTxLte__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s - %@"), "-[PLAWDBB handleBBRailCallbackTxLte:]", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBB.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDBB handleBBRailCallbackTxLte:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 1293);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }

}

uint64_t __37__PLAWDBB_handleBBRailCallbackTxLte___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleBBRailCallbackTxLte__classDebugEnabled = result;
  return result;
}

- (void)handleBBRailCallbackTxCdma:(id)a3
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

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __38__PLAWDBB_handleBBRailCallbackTxCdma___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (handleBBRailCallbackTxCdma__defaultOnce != -1)
      dispatch_once(&handleBBRailCallbackTxCdma__defaultOnce, block);
    if (handleBBRailCallbackTxCdma__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s - %@"), "-[PLAWDBB handleBBRailCallbackTxCdma:]", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBB.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDBB handleBBRailCallbackTxCdma:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 1299);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }

}

uint64_t __38__PLAWDBB_handleBBRailCallbackTxCdma___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleBBRailCallbackTxCdma__classDebugEnabled = result;
  return result;
}

- (void)handleBBRailCallbackTxEvdo:(id)a3
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

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __38__PLAWDBB_handleBBRailCallbackTxEvdo___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (handleBBRailCallbackTxEvdo__defaultOnce != -1)
      dispatch_once(&handleBBRailCallbackTxEvdo__defaultOnce, block);
    if (handleBBRailCallbackTxEvdo__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s - %@"), "-[PLAWDBB handleBBRailCallbackTxEvdo:]", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBB.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDBB handleBBRailCallbackTxEvdo:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 1305);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }

}

uint64_t __38__PLAWDBB_handleBBRailCallbackTxEvdo___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleBBRailCallbackTxEvdo__classDebugEnabled = result;
  return result;
}

- (void)handleBBRailCallbackTxCdma2K:(id)a3
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

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __40__PLAWDBB_handleBBRailCallbackTxCdma2K___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (handleBBRailCallbackTxCdma2K__defaultOnce != -1)
      dispatch_once(&handleBBRailCallbackTxCdma2K__defaultOnce, block);
    if (handleBBRailCallbackTxCdma2K__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s - %@"), "-[PLAWDBB handleBBRailCallbackTxCdma2K:]", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBB.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDBB handleBBRailCallbackTxCdma2K:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 1311);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }

}

uint64_t __40__PLAWDBB_handleBBRailCallbackTxCdma2K___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleBBRailCallbackTxCdma2K__classDebugEnabled = result;
  return result;
}

- (void)handleBBRailCallbackTxGsm:(id)a3
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

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37__PLAWDBB_handleBBRailCallbackTxGsm___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (handleBBRailCallbackTxGsm__defaultOnce != -1)
      dispatch_once(&handleBBRailCallbackTxGsm__defaultOnce, block);
    if (handleBBRailCallbackTxGsm__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s - %@"), "-[PLAWDBB handleBBRailCallbackTxGsm:]", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBB.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDBB handleBBRailCallbackTxGsm:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 1317);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }

}

uint64_t __37__PLAWDBB_handleBBRailCallbackTxGsm___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleBBRailCallbackTxGsm__classDebugEnabled = result;
  return result;
}

- (void)handleBBRailCallbackTxUtran:(id)a3
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

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__PLAWDBB_handleBBRailCallbackTxUtran___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (handleBBRailCallbackTxUtran__defaultOnce != -1)
      dispatch_once(&handleBBRailCallbackTxUtran__defaultOnce, block);
    if (handleBBRailCallbackTxUtran__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s - %@"), "-[PLAWDBB handleBBRailCallbackTxUtran:]", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBB.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDBB handleBBRailCallbackTxUtran:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 1323);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }

}

uint64_t __39__PLAWDBB_handleBBRailCallbackTxUtran___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleBBRailCallbackTxUtran__classDebugEnabled = result;
  return result;
}

- (void)handleBBRailCallbackBBICE:(id)a3
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

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37__PLAWDBB_handleBBRailCallbackBBICE___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (handleBBRailCallbackBBICE__defaultOnce != -1)
      dispatch_once(&handleBBRailCallbackBBICE__defaultOnce, block);
    if (handleBBRailCallbackBBICE__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s - %@"), "-[PLAWDBB handleBBRailCallbackBBICE:]", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBB.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDBB handleBBRailCallbackBBICE:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 1329);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }

}

uint64_t __37__PLAWDBB_handleBBRailCallbackBBICE___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleBBRailCallbackBBICE__classDebugEnabled = result;
  return result;
}

- (void)handleBBRailCallbackBBTx:(id)a3
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

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __36__PLAWDBB_handleBBRailCallbackBBTx___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (handleBBRailCallbackBBTx__defaultOnce != -1)
      dispatch_once(&handleBBRailCallbackBBTx__defaultOnce, block);
    if (handleBBRailCallbackBBTx__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s - %@"), "-[PLAWDBB handleBBRailCallbackBBTx:]", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBB.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDBB handleBBRailCallbackBBTx:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 1335);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }

}

uint64_t __36__PLAWDBB_handleBBRailCallbackBBTx___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleBBRailCallbackBBTx__classDebugEnabled = result;
  return result;
}

- (void)handleBBRailCallbackOos:(id)a3
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

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __35__PLAWDBB_handleBBRailCallbackOos___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (handleBBRailCallbackOos__defaultOnce != -1)
      dispatch_once(&handleBBRailCallbackOos__defaultOnce, block);
    if (handleBBRailCallbackOos__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s - %@"), "-[PLAWDBB handleBBRailCallbackOos:]", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBB.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDBB handleBBRailCallbackOos:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 1341);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }

}

uint64_t __35__PLAWDBB_handleBBRailCallbackOos___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleBBRailCallbackOos__classDebugEnabled = result;
  return result;
}

- (void)handleAcountGroupCallback:(id)a3
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

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37__PLAWDBB_handleAcountGroupCallback___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (handleAcountGroupCallback__defaultOnce != -1)
      dispatch_once(&handleAcountGroupCallback__defaultOnce, block);
    if (handleAcountGroupCallback__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s - %@"), "-[PLAWDBB handleAcountGroupCallback:]", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBB.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDBB handleAcountGroupCallback:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 1347);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }

}

uint64_t __37__PLAWDBB_handleAcountGroupCallback___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleAcountGroupCallback__classDebugEnabled = result;
  return result;
}

- (void)handleIceStatsCallback:(id)a3
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

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __34__PLAWDBB_handleIceStatsCallback___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (handleIceStatsCallback__defaultOnce != -1)
      dispatch_once(&handleIceStatsCallback__defaultOnce, block);
    if (handleIceStatsCallback__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s - %@"), "-[PLAWDBB handleIceStatsCallback:]", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBB.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDBB handleIceStatsCallback:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 1353);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }

}

uint64_t __34__PLAWDBB_handleIceStatsCallback___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleIceStatsCallback__classDebugEnabled = result;
  return result;
}

- (PLEntryNotificationOperatorComposition)bbProtocolRailCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBbProtocolRailCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PLEntryNotificationOperatorComposition)bbEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBbEventCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (PLEntryNotificationOperatorComposition)accountingGroupEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAccountingGroupEventCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (PLEntryNotificationOperatorComposition)iceStatsEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setIceStatsEventCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (PLEntryNotificationOperatorComposition)connectedPowerRailCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setConnectedPowerRailCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSDate)startTimeAppBB
{
  return (NSDate *)objc_getProperty(self, a2, 96, 1);
}

- (void)setStartTimeAppBB:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSDate)startTimeBBLqm
{
  return (NSDate *)objc_getProperty(self, a2, 104, 1);
}

- (void)setStartTimeBBLqm:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (unsigned)upBytes
{
  return self->_upBytes;
}

- (void)setUpBytes:(unsigned int)a3
{
  self->_upBytes = a3;
}

- (unsigned)downBytes
{
  return self->_downBytes;
}

- (void)setDownBytes:(unsigned int)a3
{
  self->_downBytes = a3;
}

- (unsigned)upBytesLTE
{
  return self->_upBytesLTE;
}

- (void)setUpBytesLTE:(unsigned int)a3
{
  self->_upBytesLTE = a3;
}

- (unsigned)downBytesLTE
{
  return self->_downBytesLTE;
}

- (void)setDownBytesLTE:(unsigned int)a3
{
  self->_downBytesLTE = a3;
}

- (NSDate)startLTECall
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (void)setStartLTECall:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSDate)endLTECall
{
  return (NSDate *)objc_getProperty(self, a2, 120, 1);
}

- (void)setEndLTECall:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSMutableArray)lteCallArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 128, 1);
}

- (void)setLteCallArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSMutableArray)unhandledRFLTEEntries
{
  return (NSMutableArray *)objc_getProperty(self, a2, 136, 1);
}

- (void)setUnhandledRFLTEEntries:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (PLEntryNotificationOperatorComposition)bbLqmCellularActiveCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 144, 1);
}

- (void)setBbLqmCellularActiveCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (PLEntryNotificationOperatorComposition)bbLqmCumulativeNetworkCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 152, 1);
}

- (void)setBbLqmCumulativeNetworkCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (PLEntryNotificationOperatorComposition)bbTelephonyActivityCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 160, 1);
}

- (void)setBbTelephonyActivityCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (PLEntryNotificationOperatorComposition)bbRfLTECallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 168, 1);
}

- (void)setBbRfLTECallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (int)currQuality
{
  return self->_currQuality;
}

- (void)setCurrQuality:(int)a3
{
  self->_currQuality = a3;
}

- (int)newQuality
{
  return self->_newQuality;
}

- (void)setNewQuality:(int)a3
{
  self->_newQuality = a3;
}

- (signed)telActivityState
{
  return self->_telActivityState;
}

- (void)setTelActivityState:(signed __int16)a3
{
  self->_telActivityState = a3;
}

- (LTEPoint)point
{
  return (LTEPoint *)objc_getProperty(self, a2, 176, 1);
}

- (void)setPoint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (LTEPoint)currThreshold
{
  return (LTEPoint *)objc_getProperty(self, a2, 184, 1);
}

- (void)setCurrThreshold:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSLock)lock
{
  return (NSLock *)objc_getProperty(self, a2, 192, 1);
}

- (void)setLock:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_currThreshold, 0);
  objc_storeStrong((id *)&self->_point, 0);
  objc_storeStrong((id *)&self->_bbRfLTECallback, 0);
  objc_storeStrong((id *)&self->_bbTelephonyActivityCallback, 0);
  objc_storeStrong((id *)&self->_bbLqmCumulativeNetworkCallback, 0);
  objc_storeStrong((id *)&self->_bbLqmCellularActiveCallback, 0);
  objc_storeStrong((id *)&self->_unhandledRFLTEEntries, 0);
  objc_storeStrong((id *)&self->_lteCallArray, 0);
  objc_storeStrong((id *)&self->_endLTECall, 0);
  objc_storeStrong((id *)&self->_startLTECall, 0);
  objc_storeStrong((id *)&self->_startTimeBBLqm, 0);
  objc_storeStrong((id *)&self->_startTimeAppBB, 0);
  objc_storeStrong((id *)&self->_connectedPowerRailCallback, 0);
  objc_storeStrong((id *)&self->_iceStatsEventCallback, 0);
  objc_storeStrong((id *)&self->_accountingGroupEventCallback, 0);
  objc_storeStrong((id *)&self->_bbEventCallback, 0);
  objc_storeStrong((id *)&self->_bbProtocolRailCallback, 0);
}

@end
