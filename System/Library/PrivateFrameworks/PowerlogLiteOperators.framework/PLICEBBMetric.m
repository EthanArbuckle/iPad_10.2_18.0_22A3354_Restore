@implementation PLICEBBMetric

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__PLICEBBMetric_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED886960 != -1)
    dispatch_once(&qword_1ED886960, block);
  return (id)qword_1ED886968;
}

uint64_t __31__PLICEBBMetric_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t result;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1ED886968;
  qword_1ED886968 = (uint64_t)v1;

  result = qword_1ED886968;
  if (qword_1ED886968)
    return objc_msgSend((id)qword_1ED886968, "initializeMetricsSim");
  return result;
}

- (void)initializeMetricsSim
{
  NSObject *v3;
  NSObject *v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *queue;
  void *v7;
  void *v8;
  NSDictionary *v9;
  NSDictionary *plistSimMetrics;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSNumber *error;
  NSDictionary *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.powerlog.cebb", v4, 0);
  queue = self->_queue;
  self->_queue = v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathForResource:ofType:", CFSTR("MetricsSim"), CFSTR("plist"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v8);
    v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    plistSimMetrics = self->_plistSimMetrics;
    self->_plistSimMetrics = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*** error *** plist not found, cannot proceed"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBMetric.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastPathComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLICEBBMetric initializeMetricsSim]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 64);

    PLLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v19 = 138412290;
      v20 = v11;
      _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v19, 0xCu);
    }

    error = self->_error;
    self->_error = (NSNumber *)&unk_1E86333D8;

    v18 = (NSDictionary *)objc_opt_new();
    -[NSDictionary setValue:forKey:](v18, "setValue:forKey:", CFSTR("1.0"), CFSTR("version"));
    -[NSDictionary setValue:forKey:](v18, "setValue:forKey:", self->_error, CFSTR("error"));
    plistSimMetrics = self->_plistSimMetrics;
    self->_plistSimMetrics = v18;
  }

}

- (BOOL)registerForNotifClient:(id)a3 andProfile:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableDictionary *lteSimMetrics;
  void *v10;
  NSString *notifyTitle;
  __CFString *v12;
  NSMutableDictionary *tdsSimMetrics;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  BOOL v22;
  NSMutableDictionary *umtsSimMetrics;
  void *v24;
  NSMutableDictionary *egprsSimMetrics;
  void *v26;
  id v27;
  void *v28;
  OS_dispatch_queue *queue;
  uint64_t v30;
  id *p_tickTock;
  PLTimer *tickTock;
  NSString *v33;
  _QWORD v35[4];
  id v36;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)-[NSDictionary mutableCopy](self->_plistSimMetrics, "mutableCopy");
  switch(objc_msgSend(v7, "integerValue"))
  {
    case 1:
      objc_storeStrong((id *)&self->_lteSimMetrics, v8);
      lteSimMetrics = self->_lteSimMetrics;
      -[NSMutableDictionary objectForKey:](lteSimMetrics, "objectForKey:", CFSTR("arrlte"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](lteSimMetrics, "setObject:forKey:", v10, CFSTR("arr"));

      objc_storeStrong((id *)&self->_sendSimMetrics, self->_lteSimMetrics);
      notifyTitle = self->_notifyTitle;
      v12 = CFSTR("METRIC_SIM_LTE_TEST");
      goto LABEL_9;
    case 2:
      objc_storeStrong((id *)&self->_umtsSimMetrics, v8);
      umtsSimMetrics = self->_umtsSimMetrics;
      -[NSMutableDictionary objectForKey:](umtsSimMetrics, "objectForKey:", CFSTR("arrumts"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](umtsSimMetrics, "setObject:forKey:", v24, CFSTR("arr"));

      objc_storeStrong((id *)&self->_sendSimMetrics, self->_umtsSimMetrics);
      notifyTitle = self->_notifyTitle;
      v12 = CFSTR("METRIC_SIM_UMTS_TEST");
      goto LABEL_9;
    case 3:
      objc_storeStrong((id *)&self->_tdsSimMetrics, v8);
      tdsSimMetrics = self->_tdsSimMetrics;
      -[NSMutableDictionary objectForKey:](tdsSimMetrics, "objectForKey:", CFSTR("arrtds"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](tdsSimMetrics, "setObject:forKey:", v14, CFSTR("arr"));

      objc_storeStrong((id *)&self->_sendSimMetrics, self->_tdsSimMetrics);
      notifyTitle = self->_notifyTitle;
      v12 = CFSTR("METRIC_SIM_TDS_TEST");
      goto LABEL_9;
    case 4:
      objc_storeStrong((id *)&self->_egprsSimMetrics, v8);
      egprsSimMetrics = self->_egprsSimMetrics;
      -[NSMutableDictionary objectForKey:](egprsSimMetrics, "objectForKey:", CFSTR("arregprs"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](egprsSimMetrics, "setObject:forKey:", v26, CFSTR("arr"));

      objc_storeStrong((id *)&self->_sendSimMetrics, self->_egprsSimMetrics);
      notifyTitle = self->_notifyTitle;
      v12 = CFSTR("METRIC_SIM_EGPRS_TEST");
LABEL_9:
      self->_notifyTitle = &v12->isa;

      -[NSMutableDictionary removeObjectForKey:](self->_sendSimMetrics, "removeObjectForKey:", CFSTR("arrlte"));
      -[NSMutableDictionary removeObjectForKey:](self->_sendSimMetrics, "removeObjectForKey:", CFSTR("arrumts"));
      -[NSMutableDictionary removeObjectForKey:](self->_sendSimMetrics, "removeObjectForKey:", CFSTR("arrtds"));
      -[NSMutableDictionary removeObjectForKey:](self->_sendSimMetrics, "removeObjectForKey:", CFSTR("arregprs"));
      objc_initWeak(location, self);
      v27 = objc_alloc(MEMORY[0x1E0D80070]);
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 30.0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      queue = self->_queue;
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __51__PLICEBBMetric_registerForNotifClient_andProfile___block_invoke;
      v35[3] = &unk_1E8578C50;
      objc_copyWeak(&v36, location);
      v30 = objc_msgSend(v27, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v28, 1, 0, queue, v35, 30.0, 0.0);
      tickTock = self->_tickTock;
      p_tickTock = (id *)&self->_tickTock;
      *p_tickTock = (id)v30;

      objc_msgSend(*p_tickTock, "arm");
      objc_destroyWeak(&v36);
      objc_destroyWeak(location);
      goto LABEL_11;
    case 7:
      v33 = self->_notifyTitle;
      self->_notifyTitle = (NSString *)CFSTR("METRIC_PROD");

LABEL_11:
      v22 = 1;
      break;
    default:
      v15 = (void *)objc_opt_new();
      objc_msgSend(v15, "setValue:forKey:", CFSTR("1.0"), CFSTR("version"));
      objc_msgSend(v15, "setValue:forKey:", &unk_1E86333F0, CFSTR("error"));
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*** error *** unsupported profile"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBMetric.m");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lastPathComponent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLICEBBMetric registerForNotifClient:andProfile:]");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v19, v20, 134);

      PLLogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v16;
        _os_log_debug_impl(&dword_1CAF47000, v21, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)location, 0xCu);
      }

      v22 = 0;
      break;
  }

  return v22;
}

void __51__PLICEBBMetric_registerForNotifClient_andProfile___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "modelProdMetricsNotify");

}

- (void)deregisterForNotifications:(id)a3
{
  -[PLTimer invalidate](self->_tickTock, "invalidate", a3);
}

- (void)queuePeriodicMetricId:(id)a3 payload:(id)a4 forTrigger:(id)a5
{
  id v8;
  id v9;
  id v10;
  PLAgent *logAgent;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  _QWORD v16[4];
  id v17;
  PLICEBBMetric *v18;
  id v19;
  id v20;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  logAgent = self->_logAgent;
  if (!logAgent)
  {
    PLLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    v15 = "PLBBAgent not ready";
LABEL_10:
    _os_log_error_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_ERROR, v15, buf, 2u);
    goto LABEL_7;
  }
  -[PLAgent workQueue](logAgent, "workQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    PLLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v15 = "PLBBAgent workQueue not ready";
    goto LABEL_10;
  }
  -[PLAgent workQueue](self->_logAgent, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__PLICEBBMetric_queuePeriodicMetricId_payload_forTrigger___block_invoke;
  v16[3] = &unk_1E8578598;
  v17 = v8;
  v18 = self;
  v19 = v10;
  v20 = v9;
  dispatch_async(v13, v16);

LABEL_8:
}

void __58__PLICEBBMetric_queuePeriodicMetricId_payload_forTrigger___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  PowerlogMetricLog *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD block[5];
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "integerValue");
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 112);
  if (v2 == 3932163)
  {
    if (v3)
    {
      if (objc_msgSend(*(id *)(a1 + 48), "integerValue"))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "objectForKeyedSubscript:", CFSTR("triggerId"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "integerValue");
        v6 = objc_msgSend(*(id *)(a1 + 48), "integerValue");

        if (v5 == v6)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bad tid. will failed assertion if debugEnabled"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBMetric.m");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "lastPathComponent");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLICEBBMetric queuePeriodicMetricId:payload:forTrigger:]_block_invoke");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 235);

          PLLogCommon();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v34 = v7;
            _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
          return;
        }
      }
      if ((objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003009) & 1) == 0)
        objc_msgSend(*(id *)(a1 + 40), "modelProdMetricsNotify");
      v18 = *(void **)(*(_QWORD *)(a1 + 40) + 120);
      if (v18)
        objc_msgSend(v18, "logBBIcePeriodicMetrics");
      v19 = -[PowerlogMetricLog initWithData:]([PowerlogMetricLog alloc], "initWithData:", *(_QWORD *)(a1 + 56));
      if (-[PowerlogMetricLog kCellularPerClientProfileTriggerCountsCount](v19, "kCellularPerClientProfileTriggerCountsCount") >= 2)objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
      -[PowerlogMetricLog kCellularPerClientProfileTriggerCountAtIndex:](v19, "kCellularPerClientProfileTriggerCountAtIndex:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "hasTimestamp"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v20, "timestamp"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = &unk_1E86333D8;
      }
      if (objc_msgSend(v20, "hasTriggerCount", v21))
      {
        v29 = (void *)MEMORY[0x1E0CB37E8];
LABEL_40:
        objc_msgSend(v29, "numberWithUnsignedInt:", objc_msgSend(v20, "triggerCount"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_42:
        objc_msgSend(*(id *)(a1 + 40), "initializeMetricsDictWithTS:triggerCnt:triggerId:", v31, v30, *(_QWORD *)(a1 + 48));
        objc_msgSend(*(id *)(a1 + 40), "initializeDataStoreBBTS:triggerCnt:triggerId:", v31, v30, *(_QWORD *)(a1 + 48));

        return;
      }
    }
    else
    {
      v19 = -[PowerlogMetricLog initWithData:]([PowerlogMetricLog alloc], "initWithData:", *(_QWORD *)(a1 + 56));
      if (-[PowerlogMetricLog kCellularPerClientProfileTriggerCountsCount](v19, "kCellularPerClientProfileTriggerCountsCount") >= 2)objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
      -[PowerlogMetricLog kCellularPerClientProfileTriggerCountAtIndex:](v19, "kCellularPerClientProfileTriggerCountAtIndex:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "hasTimestamp"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v20, "timestamp"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = &unk_1E86333D8;
      }
      if (objc_msgSend(v20, "hasTriggerCount", v22))
      {
        v29 = (void *)MEMORY[0x1E0CB37E8];
        goto LABEL_40;
      }
    }
    v30 = &unk_1E86333D8;
    goto LABEL_42;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("arr"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 120), "decodePayload:forMetricId:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__PLICEBBMetric_queuePeriodicMetricId_payload_forTrigger___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v15;
    if (qword_1ED886970 != -1)
      dispatch_once(&qword_1ED886970, block);
    if (_MergedGlobals_92)
    {
      +[PLICEBBMetricUtility convertToStringData:](PLICEBBMetricUtility, "convertToStringData:", *(_QWORD *)(a1 + 56));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v16, CFSTR("payload"));

    }
    if (v14)
      objc_msgSend(v13, "addObject:", v14);
    v17 = *(void **)(*(_QWORD *)(a1 + 40) + 120);
    if (v17)
      objc_msgSend(v17, "addToListMetric:payload:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bad arr"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBMetric.m");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "lastPathComponent");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLICEBBMetric queuePeriodicMetricId:payload:forTrigger:]_block_invoke");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v26, v27, 282);

    PLLogCommon();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v23;
      _os_log_debug_impl(&dword_1CAF47000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      __assert_rtn("-[PLICEBBMetric queuePeriodicMetricId:payload:forTrigger:]_block_invoke", "PLICEBBMetric.m", 283, "0");
  }

}

uint64_t __58__PLICEBBMetric_queuePeriodicMetricId_payload_forTrigger___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_92 = result;
  return result;
}

- (void)queueAperiodicMetricId:(id)a3 payload:(id)a4 profileId:(id)a5
{
  id v8;
  id v9;
  id v10;
  PLAgent *logAgent;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  _QWORD v16[4];
  id v17;
  PLICEBBMetric *v18;
  id v19;
  id v20;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  logAgent = self->_logAgent;
  if (!logAgent)
  {
    PLLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    v15 = "PLBBAgent not ready";
LABEL_10:
    _os_log_error_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_ERROR, v15, buf, 2u);
    goto LABEL_7;
  }
  -[PLAgent workQueue](logAgent, "workQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    PLLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v15 = "PLBBAgent workQueue not ready";
    goto LABEL_10;
  }
  -[PLAgent workQueue](self->_logAgent, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__PLICEBBMetric_queueAperiodicMetricId_payload_profileId___block_invoke;
  v16[3] = &unk_1E8578598;
  v17 = v9;
  v18 = self;
  v19 = v8;
  v20 = v10;
  dispatch_async(v13, v16);

LABEL_8:
}

void __58__PLICEBBMetric_queueAperiodicMetricId_payload_profileId___block_invoke(uint64_t a1)
{
  PowerlogMetricLog *v2;
  PowerlogMetricLog *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  PLICEBBHardwareMessage *v27;
  void *v28;
  uint64_t block;
  uint64_t v30;
  uint64_t (*v31)(uint64_t);
  void *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = -[PowerlogMetricLog initWithData:]([PowerlogMetricLog alloc], "initWithData:", *(_QWORD *)(a1 + 32));
  v3 = v2;
  if (v2)
  {
    -[PowerlogMetricLog dictionaryRepresentation](v2, "dictionaryRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v35;
      do
      {
        v9 = 0;
        v10 = v7;
        do
        {
          if (*(_QWORD *)v35 != v8)
            objc_enumerationMutation(v4);
          objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v9));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectAtIndex:", 0);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          ++v9;
          v10 = v7;
        }
        while (v6 != v9);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }
    PLLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v7;
      _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "aperiodic ICE metric: %@", buf, 0xCu);
    }

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v14 = objc_opt_class();
      block = MEMORY[0x1E0C809B0];
      v30 = 3221225472;
      v31 = __58__PLICEBBMetric_queueAperiodicMetricId_payload_profileId___block_invoke_68;
      v32 = &__block_descriptor_40_e5_v8__0lu32l8;
      v33 = v14;
      if (qword_1ED886978 != -1)
        dispatch_once(&qword_1ED886978, &block);
      if (byte_1ED886959)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("aperiodic ICE metric: %@"), v7, block, v30, v31, v32, v33);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBMetric.m");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lastPathComponent");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLICEBBMetric queueAperiodicMetricId:payload:profileId:]_block_invoke_2");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 348);

        PLLogCommon();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v39 = v15;
          _os_log_debug_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    if (v7)
    {
      if (objc_msgSend(*(id *)(a1 + 48), "intValue") == 3932163)
      {
        objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 96), *(id *)(a1 + 56));
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("trigger_count"));
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = *(_QWORD *)(a1 + 40);
        v23 = *(void **)(v22 + 88);
        *(_QWORD *)(v22 + 88) = v21;

        v24 = *(_QWORD *)(a1 + 40);
        v25 = *(id *)(a1 + 32);
        v26 = *(id *)(v24 + 104);
        *(_QWORD *)(v24 + 104) = v25;
      }
      else
      {
        v27 = [PLICEBBHardwareMessage alloc];
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("timestamp"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[PLICEBBHardwareMessage initEntryWithBBTS:triggerId:seqnum:payload:logAgent:](v27, "initEntryWithBBTS:triggerId:seqnum:payload:logAgent:", v28, *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));

        objc_msgSend(v26, "logBBIceAperiodicMetrics");
      }

    }
  }
  else
  {
    PLLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_ERROR, "unable to init powerlogmetriclog class", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  }

}

uint64_t __58__PLICEBBMetric_queueAperiodicMetricId_payload_profileId___block_invoke_68(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886959 = result;
  return result;
}

- (void)modelSimMetricsNotify:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSString *notifyTitle;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSString isEqualToString:](self->_notifyTitle, "isEqualToString:", CFSTR("METRIC_PROD")))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bad metrics channel, !TEST"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBMetric.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLICEBBMetric modelSimMetricsNotify:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 388);

    PLLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v14 = 138412290;
      v15 = v5;
      _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v14, 0xCu);
    }

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      __assert_rtn("-[PLICEBBMetric modelSimMetricsNotify:]", "PLICEBBMetric.m", 389, "0");
  }
  v11 = (void *)MEMORY[0x1E0D80078];
  notifyTitle = self->_notifyTitle;
  v13 = (void *)-[NSMutableDictionary copy](self->_sendSimMetrics, "copy");
  objc_msgSend(v11, "postNotificationName:object:userInfo:", notifyTitle, self, v13);

}

- (void)modelProdMetricsNotify
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const __CFString *v5;
  int v6;
  int v7;
  uint64_t i;
  const __CFString *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[NSMutableDictionary objectForKey:](self->_prodMetrics, "objectForKey:", CFSTR("arr"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (!v2)
  {
    v6 = -1;
    v7 = -1;
    goto LABEL_23;
  }
  v3 = v2;
  v4 = *(_QWORD *)v29;
  v5 = CFSTR("duration");
  v6 = -1;
  v7 = -1;
  do
  {
    for (i = 0; i != v3; ++i)
    {
      v9 = v5;
      if (*(_QWORD *)v29 != v4)
        objc_enumerationMutation(obj);
      v10 = *(id *)(*((_QWORD *)&v28 + 1) + 8 * i);
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("metricId"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "intValue");

      if (v12 != 3985670)
      {
        v5 = v9;
        objc_msgSend(v10, "objectForKeyedSubscript:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
          goto LABEL_19;
        objc_msgSend(v10, "objectForKeyedSubscript:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "intValue");

        if (v15 < v7 || v7 == -1)
          v7 = v15;
        if (v15 > v6 || v6 == -1)
          v6 = v15;
      }
      v5 = v9;
LABEL_19:

    }
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  }
  while (v3);
LABEL_23:

  v18 = v7 + v6;
  if (v7 + v6 < 0 != __OFADD__(v7, v6))
    ++v18;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v18 >> 1));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_prodMetrics, "setObject:forKeyedSubscript:", v19, CFSTR("duration"));

  if (-[NSString isEqualToString:](self->_notifyTitle, "isEqualToString:", CFSTR("METRIC_PROD")))
  {
    objc_msgSend(MEMORY[0x1E0D80078], "postNotificationName:object:userInfo:", self->_notifyTitle, self, self->_prodMetrics);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bad metrics channel: !PROD"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBMetric.m");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "lastPathComponent");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLICEBBMetric modelProdMetricsNotify]");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v23, v24, 419);

    PLLogCommon();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v20;
      _os_log_debug_impl(&dword_1CAF47000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      __assert_rtn("-[PLICEBBMetric modelProdMetricsNotify]", "PLICEBBMetric.m", 420, "0");
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
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_prodMetrics, "setObject:forKeyedSubscript:", &unk_1E86333D8, CFSTR("duration"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_prodMetrics, "setObject:forKeyedSubscript:", v9, CFSTR("seqnum"));

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_prodMetrics, "setObject:forKeyedSubscript:", v8, CFSTR("triggerId"));
  v14 = (void *)objc_opt_new();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_prodMetrics, "setObject:forKeyedSubscript:", v14, CFSTR("arr"));

}

- (void)initializeDataStoreBBTS:(id)a3 triggerCnt:(id)a4 triggerId:(id)a5
{
  id v8;
  id v9;
  id v10;
  PLICEBBHardwareMessage *v11;
  PLICEBBHardwareMessage *storeMetricsLogger;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[PLICEBBHardwareMessage initEntryWithBBTS:triggerId:seqnum:payload:logAgent:]([PLICEBBHardwareMessage alloc], "initEntryWithBBTS:triggerId:seqnum:payload:logAgent:", v10, v8, v9, 0, self->_logAgent);

  storeMetricsLogger = self->_storeMetricsLogger;
  self->_storeMetricsLogger = v11;

}

- (PLAgent)logAgent
{
  return (PLAgent *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLogAgent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDictionary)plistSimMetrics
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPlistSimMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableDictionary)sendSimMetrics
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSendSimMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableDictionary)lteSimMetrics
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLteSimMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableDictionary)umtsSimMetrics
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUmtsSimMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableDictionary)egprsSimMetrics
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEgprsSimMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableDictionary)tdsSimMetrics
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTdsSimMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSNumber)error
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (PLTimer)tickTock
{
  return (PLTimer *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTickTock:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)notifyTitle
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setNotifyTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSNumber)aPeriodicTriggerCnt
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAPeriodicTriggerCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSNumber)aPeriodicProfileId
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAPeriodicProfileId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSData)aPeriodicTriggerPayload
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAPeriodicTriggerPayload:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSMutableDictionary)prodMetrics
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setProdMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (PLICEBBHardwareMessage)storeMetricsLogger
{
  return (PLICEBBHardwareMessage *)objc_getProperty(self, a2, 120, 1);
}

- (void)setStoreMetricsLogger:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 128, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_storeMetricsLogger, 0);
  objc_storeStrong((id *)&self->_prodMetrics, 0);
  objc_storeStrong((id *)&self->_aPeriodicTriggerPayload, 0);
  objc_storeStrong((id *)&self->_aPeriodicProfileId, 0);
  objc_storeStrong((id *)&self->_aPeriodicTriggerCnt, 0);
  objc_storeStrong((id *)&self->_notifyTitle, 0);
  objc_storeStrong((id *)&self->_tickTock, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_tdsSimMetrics, 0);
  objc_storeStrong((id *)&self->_egprsSimMetrics, 0);
  objc_storeStrong((id *)&self->_umtsSimMetrics, 0);
  objc_storeStrong((id *)&self->_lteSimMetrics, 0);
  objc_storeStrong((id *)&self->_sendSimMetrics, 0);
  objc_storeStrong((id *)&self->_plistSimMetrics, 0);
  objc_storeStrong((id *)&self->_logAgent, 0);
}

@end
