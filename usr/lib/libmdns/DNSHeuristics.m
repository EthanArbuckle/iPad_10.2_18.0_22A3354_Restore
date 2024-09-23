@implementation DNSHeuristics

+ (id)copyNetworkSettings:(id)a3
{
  objc_msgSend(a3, "DNSHeuristicsFailureStateInfo");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)setNetworkSettings:(id)a3 value:(id)a4
{
  objc_msgSend(a3, "setDNSHeuristicsFailureStateInfo:", a4);
  return 1;
}

+ (BOOL)getNetworkFilteredFlag:(id)a3
{
  return objc_msgSend(a3, "isDNSHeuristicsFilteredNetwork");
}

+ (BOOL)setNetworkAsFiltered:(id)a3
{
  objc_msgSend(a3, "setDNSHeuristicsFilteredNetwork:", 1);
  return 1;
}

+ (BOOL)clearNetworkAsFiltered:(id)a3
{
  objc_msgSend(a3, "setDNSHeuristicsFilteredNetwork:", 0);
  return 1;
}

+ (BOOL)setNetworkAsFiltered:(id)a3 filtered:(BOOL)a4
{
  if (a4)
    return +[DNSHeuristics setNetworkAsFiltered:](DNSHeuristics, "setNetworkAsFiltered:", a3);
  else
    return +[DNSHeuristics clearNetworkAsFiltered:](DNSHeuristics, "clearNetworkAsFiltered:", a3);
}

+ (BOOL)countersExceedThreshold:(unint64_t)a3 burstCounter:(unint64_t)a4
{
  return !a4 || a3 > 0xA;
}

+ (unint64_t)currentTimeMs
{
  void *v2;
  double v3;
  unint64_t v4;

  +[NSDate date](&off_255A6D000, "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSince1970");
  v4 = (unint64_t)(v3 * 1000.0);

  return v4;
}

+ (id)copyEmptyHeuristicState
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("LastFailureTimestamp");
  +[NSNumber numberWithUnsignedInteger:](&off_255A6D228, "numberWithUnsignedInteger:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = CFSTR("LongCount");
  +[NSNumber numberWithUnsignedInteger:](&off_255A6D228, "numberWithUnsignedInteger:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v7[2] = CFSTR("BurstCount");
  +[NSNumber numberWithUnsignedInteger:](&off_255A6D228, "numberWithUnsignedInteger:", 10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_255A6D4C0, "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)updateHeuristicState:(BOOL)a3 isTimeout:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _BOOL4 v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  _BOOL4 v24;
  unint64_t v25;
  _BOOL4 v26;
  uint64_t v27;
  unint64_t v28;
  BOOL v29;
  unint64_t v30;
  unint64_t v31;
  NSObject *v32;
  uint64_t v33;
  const char *v34;
  NSObject *v35;
  unint64_t v36;
  _BOOL4 v37;
  NSObject *v38;
  const char *v39;
  id v40;
  _BOOL4 v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v48;
  _QWORD v49[3];
  _QWORD v50[3];
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  unint64_t v56;
  uint64_t v57;

  v4 = a4;
  v5 = a3;
  v57 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "activate");
  objc_msgSend(v6, "currentKnownNetworkProfile");
  v48 = objc_claimAutoreleasedReturnValue();
  v7 = +[DNSHeuristics copyNetworkSettings:](DNSHeuristics, "copyNetworkSettings:", v48);
  if (v7)
    v8 = v7;
  else
    v8 = (void *)MEMORY[0x24BDBD1B8];
  objc_msgSend(v8, "objectForKey:", CFSTR("LastFailureTimestamp"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = +[DNSHeuristics copyEmptyHeuristicState](DNSHeuristics, "copyEmptyHeuristicState");

    v8 = v10;
  }
  v11 = +[DNSHeuristics currentTimeMs](DNSHeuristics, "currentTimeMs");
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("LastFailureTimestamp"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedIntegerValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("LongCount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedIntegerValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BurstCount"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedIntegerValue");

  v18 = (void *)v48;
  v19 = +[DNSHeuristics getNetworkFilteredFlag:](DNSHeuristics, "getNetworkFilteredFlag:", v48);
  if (!v5)
  {
    v24 = v4;
    if (v4 && (v25 = v11 - v13, v11 > v13) && v13 + 30000 > v11)
    {
      _mdns_heuristics_log();
      v20 = objc_claimAutoreleasedReturnValue();
      LOBYTE(v26) = 1;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v52 = (const char *)v25;
        _os_log_impl(&dword_22983F000, v20, OS_LOG_TYPE_INFO, "Logging DoH timeout failure after only %llums, not incrementing failure counter", buf, 0xCu);
      }
      v18 = (void *)v48;
    }
    else
    {
      v27 = v15 + 1;
      v28 = v17 + (v11 - v13) / 0x1D4C0;
      if (v28 >= 0xA)
        v28 = 10;
      v29 = v28 != 0;
      v30 = v28 - 1;
      if (v29)
        v31 = v30;
      else
        v31 = 0;
      if (v19)
      {
        _mdns_heuristics_log();
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = 1;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          v34 = "";
          *(_DWORD *)buf = 136315650;
          if (v24)
            v34 = "timeout ";
          v52 = v34;
          v53 = 2048;
          v54 = v15 + 1;
          v55 = 2048;
          v56 = v31;
          _os_log_impl(&dword_22983F000, v32, OS_LOG_TYPE_INFO, "Logging DoH %sfailure %llu (bucket %llu), keeping filtered state", buf, 0x20u);
        }
      }
      else
      {
        v37 = +[DNSHeuristics countersExceedThreshold:burstCounter:](DNSHeuristics, "countersExceedThreshold:burstCounter:", v15 + 1, v31);
        _mdns_heuristics_log();
        v38 = objc_claimAutoreleasedReturnValue();
        v32 = v38;
        if (v37)
        {
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            v39 = "";
            *(_DWORD *)buf = 136315650;
            if (v24)
              v39 = "timeout ";
            v52 = v39;
            v53 = 2048;
            v54 = v27;
            v55 = 2048;
            v56 = v31;
            _os_log_impl(&dword_22983F000, v32, OS_LOG_TYPE_DEFAULT, "Logging DoH %sfailure %llu (bucket %llu), moving into filtered state", buf, 0x20u);
          }
          v33 = 1;
        }
        else
        {
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            v42 = "";
            *(_DWORD *)buf = 136315650;
            if (v24)
              v42 = "timeout ";
            v52 = v42;
            v53 = 2048;
            v54 = v27;
            v55 = 2048;
            v56 = v31;
            _os_log_impl(&dword_22983F000, v32, OS_LOG_TYPE_INFO, "Logging DoH %sfailure %llu (bucket %llu), keeping unfiltered state", buf, 0x20u);
          }
          v33 = 0;
        }
      }

      v49[0] = CFSTR("LastFailureTimestamp");
      +[NSNumber numberWithUnsignedInteger:](&off_255A6D228, "numberWithUnsignedInteger:", v11);
      v43 = objc_claimAutoreleasedReturnValue();
      v50[0] = v43;
      v49[1] = CFSTR("LongCount");
      +[NSNumber numberWithUnsignedInteger:](&off_255A6D228, "numberWithUnsignedInteger:", v27);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v50[1] = v44;
      v49[2] = CFSTR("BurstCount");
      +[NSNumber numberWithUnsignedInteger:](&off_255A6D228, "numberWithUnsignedInteger:", v31);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v50[2] = v45;
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_255A6D4C0, "dictionaryWithObjects:forKeys:count:", v50, v49, 3);
      v20 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v48;
      LODWORD(v43) = +[DNSHeuristics setNetworkSettings:value:](DNSHeuristics, "setNetworkSettings:value:", v48, v20);
      v26 = v43 & +[DNSHeuristics setNetworkAsFiltered:filtered:](DNSHeuristics, "setNetworkAsFiltered:filtered:", v48, v33);
      +[NSSet setWithObjects:](&off_255A6DB40, "setWithObjects:", &unk_24F28B838, &unk_24F28B850, 0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "updateKnownNetworkProfile:properties:error:", v48, v46, 0);

    }
    goto LABEL_47;
  }
  if (v19)
  {
    if (v13 + 86400000 >= v11)
    {
      _mdns_heuristics_log();
      v35 = objc_claimAutoreleasedReturnValue();
      v20 = v35;
      v36 = v11 - v13;
      if (v11 > v13)
      {
        LOBYTE(v26) = 1;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v52 = (const char *)v36;
          _os_log_impl(&dword_22983F000, v20, OS_LOG_TYPE_INFO, "Logging DoH success after %llums, keeping filtered state", buf, 0xCu);
        }
        goto LABEL_47;
      }
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v21 = "Logging DoH success, invalid last failure, clearing filtered state";
        v22 = v20;
        v23 = 2;
        goto LABEL_39;
      }
    }
    else
    {
      _mdns_heuristics_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v52 = (const char *)(v11 - v13);
        v21 = "Logging DoH success after %llums, clearing filtered state";
        v22 = v20;
        v23 = 12;
LABEL_39:
        _os_log_impl(&dword_22983F000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
      }
    }

    v40 = +[DNSHeuristics copyEmptyHeuristicState](DNSHeuristics, "copyEmptyHeuristicState");
    v41 = +[DNSHeuristics setNetworkSettings:value:](DNSHeuristics, "setNetworkSettings:value:", v48, v40);

    v26 = v41 & +[DNSHeuristics setNetworkAsFiltered:filtered:](DNSHeuristics, "setNetworkAsFiltered:filtered:", v48, 0);
    +[NSSet setWithObjects:](&off_255A6DB40, "setWithObjects:", &unk_24F28B838, &unk_24F28B850, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateKnownNetworkProfile:properties:error:", v48, v20, 0);
LABEL_47:

    goto LABEL_48;
  }
  LOBYTE(v26) = 1;
LABEL_48:
  objc_msgSend(v6, "invalidate");

  return v26;
}

+ (BOOL)reportResolutionFailure:(id)a3 isTimeout:(BOOL)a4
{
  return +[DNSHeuristics updateHeuristicState:isTimeout:](DNSHeuristics, "updateHeuristicState:isTimeout:", 0, a4);
}

@end
