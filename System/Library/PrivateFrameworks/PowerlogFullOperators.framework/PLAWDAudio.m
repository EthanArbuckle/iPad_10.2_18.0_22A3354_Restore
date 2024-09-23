@implementation PLAWDAudio

+ (id)getSharedObjWithOperator:(id)a3
{
  void *v3;
  id v4;
  PLAWDAudio *v5;
  void *v6;

  v3 = (void *)plAwdAudio;
  if (!plAwdAudio)
  {
    v4 = a3;
    v5 = -[PLAWDAuxMetrics initWithOperator:]([PLAWDAudio alloc], "initWithOperator:", v4);

    v6 = (void *)plAwdAudio;
    plAwdAudio = (uint64_t)v5;

    v3 = (void *)plAwdAudio;
  }
  return v3;
}

+ (id)entryAggregateDefinitions
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("AudioMetrics");
  objc_msgSend(a1, "entryAggregateDefinitionAwdAudio");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entryAggregateDefinitionAwdAudio
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
  _QWORD v18[2];
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
  v26[0] = &unk_24EB64730;
  v26[1] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v17;
  v27[1] = *MEMORY[0x24BE751E8];
  v23[0] = CFSTR("AudioRouting");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v15;
  v23[1] = CFSTR("AudioVolume");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v3;
  v23[2] = CFSTR("AudioPower");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_RealFormat_aggregateFunction_sum");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v5;
  v23[3] = CFSTR("AudioTime");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_RealFormat_aggregateFunction_sum");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v8;
  v27[2] = *MEMORY[0x24BE751A0];
  v21 = &unk_24EB64740;
  v19 = *MEMORY[0x24BE75198];
  v20 = &unk_24EB64740;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v10;
  v27[3] = *MEMORY[0x24BE751A8];
  v18[0] = CFSTR("AudioTime");
  v18[1] = CFSTR("AudioPower");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)startMetricCollection:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (objc_msgSend(v4, "longValue") == 2031626)
  {
    -[PLAWDAudio resetAudioTable](self, "resetAudioTable");
    objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAWDAudio setStartTime:](self, "setStartTime:", v5);

  }
  -[PLAWDAuxMetrics runningMetrics](self, "runningMetrics");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

}

- (void)stopMetricCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "longValue") == 2031626)
    -[PLAWDAudio setAudioRailCallback:](self, "setAudioRailCallback:", 0);
  -[PLAWDAuxMetrics runningMetrics](self, "runningMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  -[PLAWDAuxMetrics runningMetrics](self, "runningMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    v8 = (void *)plAwdAudio;
    plAwdAudio = 0;

    -[PLAWDAudio setAudioRailCallback:](self, "setAudioRailCallback:", 0);
  }
}

- (BOOL)submitDataToAWDServer:(id)a3 withAwdConn:(id)a4
{
  id v6;
  id v7;
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
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  void *v40;
  double v41;
  void *v42;
  double v43;
  unsigned int v44;
  void *v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  void *v52;
  double v53;
  void *v54;
  char v55;
  void *v56;
  void *v58;
  void *v59;
  PLAWDAudio *v60;
  id v61;
  void *v62;
  void *v63;
  uint64_t v64;
  id obj;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD block[5];
  _BYTE v71[128];
  _QWORD v72[2];
  int v73;
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(v7, "newMetricContainerWithIdentifier:", objc_msgSend(v6, "unsignedIntValue"));
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDateWithTimeIntervalSinceNow:", -86400.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSince1970");
    v12 = v11;
    objc_msgSend(v10, "timeIntervalSince1970");
    v14 = v13;

    if (objc_msgSend(v6, "longValue") == 2031626)
    {
      -[PLAWDAudio finalizeAudioTable](self, "finalizeAudioTable");
      +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", *MEMORY[0x24BE75200], CFSTR("AudioMetrics"));
      v15 = objc_claimAutoreleasedReturnValue();
      -[PLAWDAuxMetrics operator](self, "operator");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "storage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = (void *)v15;
      objc_msgSend(v17, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v15, 86400.0, v12, v14 - v12);
      v18 = objc_claimAutoreleasedReturnValue();

      v63 = (void *)v18;
      objc_msgSend(MEMORY[0x24BE74FB8], "summarizeAggregateEntries:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_opt_new();
      v62 = v20;
      if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v21 = objc_opt_class();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __48__PLAWDAudio_submitDataToAWDServer_withAwdConn___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v21;
        if (submitDataToAWDServer_withAwdConn__defaultOnce_3 != -1)
          dispatch_once(&submitDataToAWDServer_withAwdConn__defaultOnce_3, block);
        if (submitDataToAWDServer_withAwdConn__classDebugEnabled_3)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("results=%@\naggregatedResults=%@"), v18, v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDAudio.m");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "lastPathComponent");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDAudio submitDataToAWDServer:withAwdConn:]");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "logMessage:fromFile:fromFunction:fromLineNumber:", v22, v25, v26, 131);

          PLLogCommon();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            -[PLAWDDisplay startMetricCollection:].cold.1();

          v20 = v62;
        }
      }
      v59 = v8;
      v60 = self;
      v61 = v7;
      v72[0] = 0;
      v72[1] = 0;
      v73 = 0;
      objc_msgSend(v20, "setTimestamp:", objc_msgSend(v7, "getAWDTimestamp"));
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      obj = v19;
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
      if (!v28)
      {
        v30 = 0;
        v31 = 0;
        v64 = 0;
        goto LABEL_25;
      }
      v29 = v28;
      v30 = 0;
      v31 = 0;
      v64 = 0;
      v32 = *(_QWORD *)v67;
      while (1)
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v67 != v32)
            objc_enumerationMutation(obj);
          v34 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
          objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("AudioRouting"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "doubleValue");
          v37 = v36;

          if (v37 == 2.0)
          {
            objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("AudioTime"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "doubleValue");
            v30 = (v39 + (double)v30);

            objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("AudioPower"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "doubleValue");
            v31 = (v41 + (double)v31);

            objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("AudioVolume"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "doubleValue");
            v44 = (int)v43;

            objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("AudioTime"));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "doubleValue");
            *((_DWORD *)v72 + v44) = v46;
          }
          else
          {
            objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("AudioRouting"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "doubleValue");
            v49 = v48;

            if (v49 != 1.0)
              continue;
            objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("AudioTime"));
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "doubleValue");
            LODWORD(v64) = (v51 + (double)v64);

            objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("AudioPower"));
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "doubleValue");
            HIDWORD(v64) = (v53 + (double)HIDWORD(v64));

            objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("AudioVolume"));
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "doubleValue");

            objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("AudioTime"));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "doubleValue");
          }

        }
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
        if (!v29)
        {
LABEL_25:

          objc_msgSend(v62, "setAudioHeadsetDuration:", v30);
          objc_msgSend(v62, "setAudioHeadsetPowerMicroWatt:", v31);
          objc_msgSend(v62, "setAudioSpeakerDuration:", v64);
          objc_msgSend(v62, "setAudioSpeakerPowerMicroWatt:", HIDWORD(v64));
          objc_msgSend(v62, "setAudioVolumeLevelDurations:count:", v72, 5);
          v8 = v59;
          objc_msgSend(v59, "setMetric:", v62);

          v7 = v61;
          self = v60;
          goto LABEL_26;
        }
      }
    }
    v55 = 0;
  }
  else
  {
LABEL_26:
    -[PLAWDAudio resetAudioTable](self, "resetAudioTable");
    objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAWDAudio setStartTime:](self, "setStartTime:", v56);

    v55 = objc_msgSend(v7, "submitMetric:", v8);
  }

  return v55;
}

uint64_t __48__PLAWDAudio_submitDataToAWDServer_withAwdConn___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  submitDataToAWDServer_withAwdConn__classDebugEnabled_3 = result;
  return result;
}

- (void)finalizeAudioTable
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  v3 = *MEMORY[0x24BE75218];
  objc_msgSend(MEMORY[0x24BE75238], "entryKeyForType:andName:", *MEMORY[0x24BE75218], *MEMORY[0x24BE752F8]);
  v36 = (id)objc_claimAutoreleasedReturnValue();
  -[PLAWDAuxMetrics operator](self, "operator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastEntryForKey:", v36);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Active"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v7, "BOOLValue");

  if ((_DWORD)v5)
  {
    objc_msgSend(MEMORY[0x24BE75238], "entryKeyForType:andName:", v3, *MEMORY[0x24BE752F0]);
    v8 = objc_claimAutoreleasedReturnValue();
    -[PLAWDAuxMetrics operator](self, "operator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "storage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)v8;
    objc_msgSend(v10, "lastEntryForKey:", v8);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE75238], "entryKeyForType:andName:", *MEMORY[0x24BE75230], CFSTR("Audio"));
    v11 = objc_claimAutoreleasedReturnValue();
    -[PLAWDAuxMetrics operator](self, "operator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "storage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)v11;
    objc_msgSend(v13, "lastEntryForKey:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", *MEMORY[0x24BE75200], CFSTR("AudioMetrics"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74FB8]), "initWithEntryKey:", v16);
    objc_msgSend(v15, "timeIntervalSince1970");
    v19 = v18;
    objc_msgSend(v14, "entryDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "timeIntervalSince1970");
    v22 = v19 - v21;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HeadphonesConnected"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = objc_msgSend(v23, "BOOLValue");

    if ((v11 & 1) != 0)
    {
      v24 = 1;
    }
    else
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HeadsetHasInput"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "BOOLValue");

      v24 = 2;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v26, CFSTR("AudioRouting"));

    v27 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("Volume"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "doubleValue");
    objc_msgSend(v27, "numberWithDouble:", (v29 + -1.0) / 20.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v30, CFSTR("AudioVolume"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v22);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v31, CFSTR("AudioTime"));

    -[PLAWDAuxMetrics operator](self, "operator");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "logEntry:", v17);

  }
}

- (void)handleAudioRailCallback:(id)a3
{
  id v4;
  uint64_t v5;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  uint64_t v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  _QWORD block[5];
  _QWORD v85[5];
  _QWORD v86[6];

  v4 = a3;
  v5 = *MEMORY[0x24BE75218];
  objc_msgSend(MEMORY[0x24BE75238], "entryKeyForType:andName:", *MEMORY[0x24BE75218], *MEMORY[0x24BE752F8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAWDAuxMetrics operator](self, "operator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "storage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastEntriesForKey:count:withFilters:", v6, 2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE75238], "entryKeyForType:andName:", v5, *MEMORY[0x24BE752F0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAWDAuxMetrics operator](self, "operator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "storage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastEntriesForKey:count:withFilters:", v10, 2, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v9, "count") < 2 || (unint64_t)objc_msgSend(v13, "count") < 2)
    goto LABEL_32;
  v76 = v10;
  v77 = v6;
  v78 = v4;
  objc_msgSend(v4, "objectForKey:", CFSTR("entry"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAWDAuxMetrics operator](self, "operator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "storage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "entryKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v14;
  objc_msgSend(v16, "entryForKey:withID:", v17, objc_msgSend(v14, "entryID") - 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", *MEMORY[0x24BE75200], CFSTR("AudioMetrics"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74FB8]), "initWithEntryKey:", v75);
  v82 = v18;
  objc_msgSend(v18, "entryDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "timeIntervalSince1970");
  v25 = v24;
  objc_msgSend(v19, "entryDate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "timeIntervalSince1970");
  v28 = v27;

  v79 = v19;
  v73 = v21;
  v74 = v20;
  if (v25 >= v28)
  {
    v37 = v19;
    v80 = v22;
    if (!objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      goto LABEL_19;
    v38 = objc_opt_class();
    v85[0] = MEMORY[0x24BDAC760];
    v85[1] = 3221225472;
    v85[2] = __38__PLAWDAudio_handleAudioRailCallback___block_invoke_48;
    v85[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v85[4] = v38;
    if (handleAudioRailCallback__defaultOnce_46 != -1)
      dispatch_once(&handleAudioRailCallback__defaultOnce_46, v85);
    if (!handleAudioRailCallback__classDebugEnabled_47)
      goto LABEL_19;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Output changed"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)MEMORY[0x24BE74FA8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDAudio.m");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "lastPathComponent");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDAudio handleAudioRailCallback:]");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "logMessage:fromFile:fromFunction:fromLineNumber:", v31, v41, v42, 238);

    PLLogCommon();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      -[PLAWDDisplay startMetricCollection:].cold.1();
  }
  else
  {
    v29 = v20;
    v80 = v21;
    if (!objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      goto LABEL_18;
    v30 = objc_opt_class();
    v86[0] = MEMORY[0x24BDAC760];
    v86[1] = 3221225472;
    v86[2] = __38__PLAWDAudio_handleAudioRailCallback___block_invoke;
    v86[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v86[4] = v30;
    if (handleAudioRailCallback__defaultOnce != -1)
      dispatch_once(&handleAudioRailCallback__defaultOnce, v86);
    if (!handleAudioRailCallback__classDebugEnabled)
    {
LABEL_18:
      v37 = v29;
      goto LABEL_19;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Routing changed"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)MEMORY[0x24BE74FA8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDAudio.m");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "lastPathComponent");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDAudio handleAudioRailCallback:]");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "logMessage:fromFile:fromFunction:fromLineNumber:", v31, v34, v35, 234);

    PLLogCommon();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      -[PLAWDDisplay startMetricCollection:].cold.1();
    v37 = v29;
  }

LABEL_19:
  objc_msgSend(v83, "entryDate");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "timeIntervalSince1970");
  v45 = v44;
  objc_msgSend(v82, "entryDate");
  v46 = objc_claimAutoreleasedReturnValue();
  -[PLAWDAudio startTime](self, "startTime");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v46, "laterDate:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "timeIntervalSince1970");
  v50 = v49;

  objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("HeadphonesConnected"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v46) = objc_msgSend(v51, "BOOLValue");

  if ((v46 & 1) != 0)
  {
    v52 = 1;
  }
  else
  {
    objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("HeadsetHasInput"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "BOOLValue");

    v52 = 2;
  }
  objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("Active"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "BOOLValue");

  v56 = v79;
  if (v55)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v52);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setObject:forKeyedSubscript:", v57, CFSTR("AudioRouting"));

    v58 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("Volume"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "doubleValue");
    objc_msgSend(v58, "numberWithDouble:", (v60 + -1.0) / 20.0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setObject:forKeyedSubscript:", v61, CFSTR("AudioVolume"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v45 - v50);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setObject:forKeyedSubscript:", v62, CFSTR("AudioTime"));

    -[PLAWDAuxMetrics operator](self, "operator");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "logEntry:", v81);

  }
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v64 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __38__PLAWDAudio_handleAudioRailCallback___block_invoke_53;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v64;
    if (handleAudioRailCallback__defaultOnce_51 != -1)
      dispatch_once(&handleAudioRailCallback__defaultOnce_51, block);
    if (handleAudioRailCallback__classDebugEnabled_52)
    {
      v65 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("Active"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "stringWithFormat:", CFSTR("No update required, currActive = %@\nAudio writes: %@\n%@\n-------------"), v66, v81, v37, v73, v74);
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      v68 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDAudio.m");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "lastPathComponent");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDAudio handleAudioRailCallback:]");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "logMessage:fromFile:fromFunction:fromLineNumber:", v67, v70, v71, 258);

      PLLogCommon();
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

      v56 = v79;
    }
  }

  v6 = v77;
  v4 = v78;
  v10 = v76;
LABEL_32:

}

uint64_t __38__PLAWDAudio_handleAudioRailCallback___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleAudioRailCallback__classDebugEnabled = result;
  return result;
}

uint64_t __38__PLAWDAudio_handleAudioRailCallback___block_invoke_48(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleAudioRailCallback__classDebugEnabled_47 = result;
  return result;
}

uint64_t __38__PLAWDAudio_handleAudioRailCallback___block_invoke_53(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleAudioRailCallback__classDebugEnabled_52 = result;
  return result;
}

- (void)resetAudioTable
{
  void *v3;
  objc_super v4;

  +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", *MEMORY[0x24BE75200], CFSTR("AudioMetrics"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4.receiver = self;
  v4.super_class = (Class)PLAWDAudio;
  -[PLAWDAuxMetrics resetTableWithEntryKey:](&v4, sel_resetTableWithEntryKey_, v3);

}

- (PLEntryNotificationOperatorComposition)audioRailCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAudioRailCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDate)startTime
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setStartTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_audioRailCallback, 0);
}

@end
