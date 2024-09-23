@implementation PLMAVBBMetric

void __58__PLMAVBBMetric_queuePeriodicMetricId_payload_forTrigger___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  AWDMETRICSCellularPowerLog *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD block[5];
  _QWORD v42[5];
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  PLLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v38 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v44 = v38;
    _os_log_debug_impl(&dword_1CAF47000, v2, OS_LOG_TYPE_DEBUG, "BB Agent: queuePeriodicMetricId in dispatch queue : %@", buf, 0xCu);
  }

  v3 = objc_msgSend(*(id *)(a1 + 40), "integerValue");
  v4 = *(void **)(*(_QWORD *)(a1 + 48) + 48);
  if (v3 == 786435)
  {
    if (v4)
    {
      if (objc_msgSend(*(id *)(a1 + 56), "integerValue"))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 48), "objectForKeyedSubscript:", CFSTR("triggerId"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "integerValue");
        v7 = objc_msgSend(*(id *)(a1 + 56), "integerValue");

        if (v6 == v7)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bad tid. will failed assertion if debugEnabled"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KMAV/PLMAVBBMetric.m");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "lastPathComponent");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMAVBBMetric queuePeriodicMetricId:payload:forTrigger:]_block_invoke");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 107);

          PLLogCommon();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v44 = v8;
            _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
          return;
        }
      }
      objc_msgSend(*(id *)(a1 + 48), "modelProdMetricsNotify");
      if (*(_QWORD *)(*(_QWORD *)(a1 + 48) + 56))
      {
        PLLogCommon();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v40 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          v44 = v40;
          _os_log_debug_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_DEBUG, "BB Agent: queuePeriodicMetricId in RF Trigger Count : %@", buf, 0xCu);
        }

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 56), "logBBMavPeriodicMetrics");
      }
    }
    v21 = -[AWDMETRICSCellularPowerLog initWithData:]([AWDMETRICSCellularPowerLog alloc], "initWithData:", *(_QWORD *)(a1 + 32));
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v22 = objc_opt_class();
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __58__PLMAVBBMetric_queuePeriodicMetricId_payload_forTrigger___block_invoke_18;
      v42[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v42[4] = v22;
      if (qword_1ED8860B0 != -1)
        dispatch_once(&qword_1ED8860B0, v42);
      if (_MergedGlobals_76)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Generate awdPowerLog to handle periodic metrics: %@"), v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KMAV/PLMAVBBMetric.m");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "lastPathComponent");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMAVBBMetric queuePeriodicMetricId:payload:forTrigger:]_block_invoke_2");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v26, v27, 117);

        PLLogCommon();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v44 = v23;
          _os_log_debug_impl(&dword_1CAF47000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    if (-[AWDMETRICSCellularPowerLog cellularPerClientProfileTriggerCountsCount](v21, "cellularPerClientProfileTriggerCountsCount") >= 2)objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
    -[AWDMETRICSCellularPowerLog cellularPerClientProfileTriggerCountAtIndex:](v21, "cellularPerClientProfileTriggerCountAtIndex:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "hasTimestamp"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v29, "timestamp"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = &unk_1E862EB30;
    }
    if (objc_msgSend(v29, "hasTriggerCount"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v29, "triggerCount"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = &unk_1E862EB30;
    }
    objc_msgSend(*(id *)(a1 + 48), "initializeMetricsDictWithTS:triggerCnt:triggerId:", v30, v31, *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 48), "initializeDataStoreBBTS:triggerCnt:triggerId:", v30, v31, *(_QWORD *)(a1 + 56));

  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("arr"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v39 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v44 = v39;
        _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "BB Agent: queuePeriodicMetricId in default : %@", buf, 0xCu);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 56), "decodePayload:forMetricId:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __58__PLMAVBBMetric_queuePeriodicMetricId_payload_forTrigger___block_invoke_34;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v17;
      if (qword_1ED8860B8 != -1)
        dispatch_once(&qword_1ED8860B8, block);
      if (byte_1ED886099)
      {
        +[PLMAVBBMetricUtility convertToStringData:](PLMAVBBMetricUtility, "convertToStringData:", *(_QWORD *)(a1 + 32));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v18, CFSTR("payload"));

      }
      if (v16)
        objc_msgSend(v14, "addObject:", v16);
      v19 = *(void **)(*(_QWORD *)(a1 + 48) + 56);
      if (v19)
        objc_msgSend(v19, "addToListMetric:payload:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bad arr"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KMAV/PLMAVBBMetric.m");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "lastPathComponent");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMAVBBMetric queuePeriodicMetricId:payload:forTrigger:]_block_invoke");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "logMessage:fromFile:fromFunction:fromLineNumber:", v32, v35, v36, 141);

      PLLogCommon();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v44 = v32;
        _os_log_debug_impl(&dword_1CAF47000, v37, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        __assert_rtn("-[PLMAVBBMetric queuePeriodicMetricId:payload:forTrigger:]_block_invoke", "PLMAVBBMetric.m", 142, "0");
    }

  }
}

- (void)initializeMetricsDictWithTS:(id)a3 triggerCnt:(id)a4 triggerId:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *prodMetrics;
  void *v13;
  void *v14;
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (NSMutableDictionary *)objc_opt_new();
  prodMetrics = self->_prodMetrics;
  self->_prodMetrics = v11;

  v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", (double)objc_msgSend(v10, "integerValue"));
  objc_msgSend(v15, "convertFromBasebandToMonotonic");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_prodMetrics, "setObject:forKeyedSubscript:", v13, CFSTR("timestamp"));

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_prodMetrics, "setObject:forKeyedSubscript:", v10, CFSTR("bbtimestamp"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_prodMetrics, "setObject:forKeyedSubscript:", &unk_1E862EB30, CFSTR("duration"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_prodMetrics, "setObject:forKeyedSubscript:", v9, CFSTR("seqnum"));

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_prodMetrics, "setObject:forKeyedSubscript:", v8, CFSTR("triggerId"));
  v14 = (void *)objc_opt_new();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_prodMetrics, "setObject:forKeyedSubscript:", v14, CFSTR("arr"));

}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__PLMAVBBMetric_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED8860A0 != -1)
    dispatch_once(&qword_1ED8860A0, block);
  return (id)qword_1ED8860A8;
}

- (void)queuePeriodicMetricId:(id)a3 payload:(id)a4 forTrigger:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  PLAgent *logAgent;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  PLMAVBBMetric *v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  PLLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v9;
    _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "BB Agent: queuePeriodicMetricId : %@", buf, 0xCu);
  }

  logAgent = self->_logAgent;
  if (logAgent
    && (-[PLAgent workQueue](logAgent, "workQueue"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v13))
  {
    -[PLAgent workQueue](self->_logAgent, "workQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __58__PLMAVBBMetric_queuePeriodicMetricId_payload_forTrigger___block_invoke;
    v15[3] = &unk_1E8578598;
    v16 = v9;
    v17 = v8;
    v18 = self;
    v19 = v10;
    dispatch_async(v14, v15);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  }

}

- (void)queueAperiodicMetricId:(id)a3 payload:(id)a4 profileId:(id)a5
{
  id v8;
  id v9;
  id v10;
  PLAgent *logAgent;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  PLMAVBBMetric *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  logAgent = self->_logAgent;
  if (logAgent
    && (-[PLAgent workQueue](logAgent, "workQueue"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v12))
  {
    -[PLAgent workQueue](self->_logAgent, "workQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __58__PLMAVBBMetric_queueAperiodicMetricId_payload_profileId___block_invoke;
    v14[3] = &unk_1E8578598;
    v15 = v9;
    v16 = self;
    v17 = v8;
    v18 = v10;
    dispatch_async(v13, v14);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  }

}

- (void)modelProdMetricsNotify
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t i;
  id v8;
  void *v9;
  void *v10;
  int v11;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[NSMutableDictionary objectForKey:](self->_prodMetrics, "objectForKey:", CFSTR("arr"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v25;
    v5 = -1;
    v6 = -1;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v25 != v4)
          objc_enumerationMutation(obj);
        v8 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("duration"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("duration"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "intValue");

          if (v11 < v6 || v6 == -1)
            v6 = v11;
          if (v11 > v5 || v5 == -1)
            v5 = v11;
        }

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v3);
  }
  else
  {
    v5 = -1;
    v6 = -1;
  }

  v14 = v6 + v5;
  if (v6 + v5 < 0 != __OFADD__(v6, v5))
    ++v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v14 >> 1));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_prodMetrics, "setObject:forKeyedSubscript:", v15, CFSTR("duration"));

  if (-[NSString isEqualToString:](self->_notifyTitle, "isEqualToString:", CFSTR("MAV_METRIC_PROD")))
  {
    objc_msgSend(MEMORY[0x1E0D80078], "postNotificationName:object:userInfo:", self->_notifyTitle, self, self->_prodMetrics);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bad metrics channel: !PROD"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KMAV/PLMAVBBMetric.m");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lastPathComponent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMAVBBMetric modelProdMetricsNotify]");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v19, v20, 268);

    PLLogCommon();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v16;
      _os_log_debug_impl(&dword_1CAF47000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      __assert_rtn("-[PLMAVBBMetric modelProdMetricsNotify]", "PLMAVBBMetric.m", 269, "0");
  }
}

- (void)initializeDataStoreBBTS:(id)a3 triggerCnt:(id)a4 triggerId:(id)a5
{
  id v8;
  id v9;
  id v10;
  PLMAVBBHardwareMessage *v11;
  PLMAVBBHardwareMessage *storeMetricsLogger;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[PLMAVBBHardwareMessage initEntryWithBBTS:triggerId:seqnum:payload:logAgent:]([PLMAVBBHardwareMessage alloc], "initEntryWithBBTS:triggerId:seqnum:payload:logAgent:", v10, v8, v9, 0, self->_logAgent);

  storeMetricsLogger = self->_storeMetricsLogger;
  self->_storeMetricsLogger = v11;

}

void __58__PLMAVBBMetric_queueAperiodicMetricId_payload_profileId___block_invoke(uint64_t a1)
{
  AWDMETRICSCellularPowerLog *v2;
  AWDMETRICSCellularPowerLog *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  PLMAVBBHardwareMessage *v25;
  void *v26;
  uint64_t block;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v2 = -[AWDMETRICSCellularPowerLog initWithData:]([AWDMETRICSCellularPowerLog alloc], "initWithData:", *(_QWORD *)(a1 + 32));
  v3 = v2;
  if (v2)
  {
    -[AWDMETRICSCellularPowerLog dictionaryRepresentation](v2, "dictionaryRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v33;
      do
      {
        v9 = 0;
        v10 = v7;
        do
        {
          if (*(_QWORD *)v33 != v8)
            objc_enumerationMutation(v4);
          objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v9));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectAtIndex:", 0);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          ++v9;
          v10 = v7;
        }
        while (v6 != v9);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v12 = objc_opt_class();
      block = MEMORY[0x1E0C809B0];
      v28 = 3221225472;
      v29 = __58__PLMAVBBMetric_queueAperiodicMetricId_payload_profileId___block_invoke_2;
      v30 = &__block_descriptor_40_e5_v8__0lu32l8;
      v31 = v12;
      if (qword_1ED8860C0 != -1)
        dispatch_once(&qword_1ED8860C0, &block);
      if (byte_1ED88609A)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("aperiodic MAV metric: %@"), v7, block, v28, v29, v30, v31);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KMAV/PLMAVBBMetric.m");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lastPathComponent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMAVBBMetric queueAperiodicMetricId:payload:profileId:]_block_invoke");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 222);

        PLLogCommon();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v37 = v13;
          _os_log_debug_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    if (v7)
    {
      if (objc_msgSend(*(id *)(a1 + 48), "intValue") == 786435)
      {
        objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 32), *(id *)(a1 + 56));
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("trigger_count"));
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = *(_QWORD *)(a1 + 40);
        v21 = *(void **)(v20 + 24);
        *(_QWORD *)(v20 + 24) = v19;

        v22 = *(_QWORD *)(a1 + 40);
        v23 = *(id *)(a1 + 32);
        v24 = *(id *)(v22 + 40);
        *(_QWORD *)(v22 + 40) = v23;
      }
      else
      {
        v25 = [PLMAVBBHardwareMessage alloc];
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("timestamp"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[PLMAVBBHardwareMessage initEntryWithBBTS:triggerId:seqnum:payload:logAgent:](v25, "initEntryWithBBTS:triggerId:seqnum:payload:logAgent:", v26, *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));

        objc_msgSend(v24, "logBBMavAperiodicMetrics");
      }

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  }

}

void __31__PLMAVBBMetric_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1ED8860A8;
  qword_1ED8860A8 = (uint64_t)v1;

}

- (BOOL)registerForNotifClient:(id)a3 andProfile:(id)a4
{
  uint64_t v5;
  NSString *notifyTitle;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a4, "integerValue", a3);
  if (v5 == 1)
  {
    notifyTitle = self->_notifyTitle;
    self->_notifyTitle = (NSString *)CFSTR("MAV_METRIC_PROD");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*** error *** unsupported profile"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KMAV/PLMAVBBMetric.m");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMAVBBMetric registerForNotifClient:andProfile:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 62);

    PLLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v14 = 138412290;
      v15 = v7;
      _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v14, 0xCu);
    }

  }
  return v5 == 1;
}

uint64_t __58__PLMAVBBMetric_queuePeriodicMetricId_payload_forTrigger___block_invoke_18(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_76 = result;
  return result;
}

uint64_t __58__PLMAVBBMetric_queuePeriodicMetricId_payload_forTrigger___block_invoke_34(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886099 = result;
  return result;
}

- (void)flushPeriodicMetrics
{
  PLAgent *logAgent;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  _QWORD block[5];
  uint8_t buf[16];

  logAgent = self->_logAgent;
  if (!logAgent)
  {
    PLLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v7 = "BBAgent not ready";
LABEL_10:
    _os_log_debug_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_DEBUG, v7, buf, 2u);
    goto LABEL_7;
  }
  -[PLAgent workQueue](logAgent, "workQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLAgent workQueue](self->_logAgent, "workQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__PLMAVBBMetric_flushPeriodicMetrics__block_invoke;
    block[3] = &unk_1E85780C8;
    block[4] = self;
    dispatch_async(v5, block);

    return;
  }
  PLLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    v7 = "Work-queue not ready";
    goto LABEL_10;
  }
LABEL_7:

}

uint64_t __37__PLMAVBBMetric_flushPeriodicMetrics__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  v1 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v1 + 48) && *(_QWORD *)(v1 + 56))
  {
    v2 = result;
    PLLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v4 = 0;
      _os_log_debug_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_DEBUG, "BB Agent: flushPeriodicMetrics", v4, 2u);
    }

    return objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 56), "logBBMavPeriodicMetrics");
  }
  return result;
}

uint64_t __58__PLMAVBBMetric_queueAperiodicMetricId_payload_profileId___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88609A = result;
  return result;
}

- (PLAgent)logAgent
{
  return (PLAgent *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLogAgent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)notifyTitle
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setNotifyTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSNumber)aPeriodicTriggerCnt
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAPeriodicTriggerCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSNumber)aPeriodicProfileId
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAPeriodicProfileId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSData)aPeriodicTriggerPayload
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAPeriodicTriggerPayload:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableDictionary)prodMetrics
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProdMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (PLMAVBBHardwareMessage)storeMetricsLogger
{
  return (PLMAVBBHardwareMessage *)objc_getProperty(self, a2, 56, 1);
}

- (void)setStoreMetricsLogger:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeMetricsLogger, 0);
  objc_storeStrong((id *)&self->_prodMetrics, 0);
  objc_storeStrong((id *)&self->_aPeriodicTriggerPayload, 0);
  objc_storeStrong((id *)&self->_aPeriodicProfileId, 0);
  objc_storeStrong((id *)&self->_aPeriodicTriggerCnt, 0);
  objc_storeStrong((id *)&self->_notifyTitle, 0);
  objc_storeStrong((id *)&self->_logAgent, 0);
}

@end
