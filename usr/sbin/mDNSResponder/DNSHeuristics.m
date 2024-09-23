@implementation DNSHeuristics

+ (id)copyNetworkSettings:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "DNSHeuristicsFailureStateInfo"));
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

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
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
  _QWORD v8[3];

  v7[0] = CFSTR("LastFailureTimestamp");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 0));
  v8[0] = v2;
  v7[1] = CFSTR("LongCount");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 0));
  v8[1] = v3;
  v7[2] = CFSTR("BurstCount");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 10));
  v8[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 3));

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
  id v13;
  void *v14;
  char *v15;
  void *v16;
  id v17;
  void *v18;
  unsigned int v19;
  id v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  _BOOL4 v25;
  unint64_t v26;
  id v27;
  unsigned int v28;
  char *v29;
  unint64_t v30;
  BOOL v31;
  unint64_t v32;
  unint64_t v33;
  id v34;
  NSObject *v35;
  uint64_t v36;
  const char *v37;
  id v38;
  NSObject *v39;
  unint64_t v40;
  unsigned int v41;
  id v42;
  NSObject *v43;
  const char *v44;
  id v45;
  unsigned int v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v53;
  _QWORD v54[3];
  _QWORD v55[3];
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  char *v59;
  __int16 v60;
  unint64_t v61;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_opt_new(CWFInterface);
  objc_msgSend(v6, "activate");
  v53 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentKnownNetworkProfile"));
  v7 = +[DNSHeuristics copyNetworkSettings:](DNSHeuristics, "copyNetworkSettings:", v53);
  if (v7)
    v8 = v7;
  else
    v8 = &__NSDictionary0__struct;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("LastFailureTimestamp")));

  if (!v9)
  {
    v10 = +[DNSHeuristics copyEmptyHeuristicState](DNSHeuristics, "copyEmptyHeuristicState");

    v8 = v10;
  }
  v11 = +[DNSHeuristics currentTimeMs](DNSHeuristics, "currentTimeMs");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("LastFailureTimestamp")));
  v13 = objc_msgSend(v12, "unsignedIntegerValue");

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("LongCount")));
  v15 = (char *)objc_msgSend(v14, "unsignedIntegerValue");

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BurstCount")));
  v17 = objc_msgSend(v16, "unsignedIntegerValue");

  v18 = (void *)v53;
  v19 = +[DNSHeuristics getNetworkFilteredFlag:](DNSHeuristics, "getNetworkFilteredFlag:", v53);
  if (!v5)
  {
    v25 = v4;
    if (v4 && (v26 = v11 - (_QWORD)v13, v11 > (unint64_t)v13) && (unint64_t)v13 + 30000 > v11)
    {
      v27 = _mdns_heuristics_log();
      v21 = objc_claimAutoreleasedReturnValue(v27);
      LOBYTE(v28) = 1;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v57 = (const char *)v26;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Logging DoH timeout failure after only %llums, not incrementing failure counter", buf, 0xCu);
      }
      v18 = (void *)v53;
    }
    else
    {
      v29 = v15 + 1;
      v30 = (unint64_t)v17 + (v11 - (unint64_t)v13) / 0x1D4C0;
      if (v30 >= 0xA)
        v30 = 10;
      v31 = v30 != 0;
      v32 = v30 - 1;
      if (v31)
        v33 = v32;
      else
        v33 = 0;
      if ((v19 & 1) != 0)
      {
        v34 = _mdns_heuristics_log();
        v35 = objc_claimAutoreleasedReturnValue(v34);
        v36 = 1;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          v37 = "";
          *(_DWORD *)buf = 136315650;
          if (v25)
            v37 = "timeout ";
          v57 = v37;
          v58 = 2048;
          v59 = v15 + 1;
          v60 = 2048;
          v61 = v33;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Logging DoH %sfailure %llu (bucket %llu), keeping filtered state", buf, 0x20u);
        }
      }
      else
      {
        v41 = +[DNSHeuristics countersExceedThreshold:burstCounter:](DNSHeuristics, "countersExceedThreshold:burstCounter:", v15 + 1, v33);
        v42 = _mdns_heuristics_log();
        v43 = objc_claimAutoreleasedReturnValue(v42);
        v35 = v43;
        if (v41)
        {
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            v44 = "";
            *(_DWORD *)buf = 136315650;
            if (v25)
              v44 = "timeout ";
            v57 = v44;
            v58 = 2048;
            v59 = v29;
            v60 = 2048;
            v61 = v33;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Logging DoH %sfailure %llu (bucket %llu), moving into filtered state", buf, 0x20u);
          }
          v36 = 1;
        }
        else
        {
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            v47 = "";
            *(_DWORD *)buf = 136315650;
            if (v25)
              v47 = "timeout ";
            v57 = v47;
            v58 = 2048;
            v59 = v29;
            v60 = 2048;
            v61 = v33;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Logging DoH %sfailure %llu (bucket %llu), keeping unfiltered state", buf, 0x20u);
          }
          v36 = 0;
        }
      }

      v54[0] = CFSTR("LastFailureTimestamp");
      v48 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v11));
      v55[0] = v48;
      v54[1] = CFSTR("LongCount");
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v29));
      v55[1] = v49;
      v54[2] = CFSTR("BurstCount");
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v33));
      v55[2] = v50;
      v21 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v55, v54, 3));

      v18 = (void *)v53;
      LODWORD(v48) = +[DNSHeuristics setNetworkSettings:value:](DNSHeuristics, "setNetworkSettings:value:", v53, v21);
      v28 = v48 & +[DNSHeuristics setNetworkAsFiltered:filtered:](DNSHeuristics, "setNetworkAsFiltered:filtered:", v53, v36);
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_100140E80, &off_100140E98, 0));
      objc_msgSend(v6, "updateKnownNetworkProfile:properties:error:", v53, v51, 0);

    }
    goto LABEL_47;
  }
  if (v19)
  {
    if ((unint64_t)v13 + 86400000 >= v11)
    {
      v38 = _mdns_heuristics_log();
      v39 = objc_claimAutoreleasedReturnValue(v38);
      v21 = v39;
      v40 = v11 - (_QWORD)v13;
      if (v11 > (unint64_t)v13)
      {
        LOBYTE(v28) = 1;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v57 = (const char *)v40;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Logging DoH success after %llums, keeping filtered state", buf, 0xCu);
        }
        goto LABEL_47;
      }
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v22 = "Logging DoH success, invalid last failure, clearing filtered state";
        v23 = v21;
        v24 = 2;
        goto LABEL_39;
      }
    }
    else
    {
      v20 = _mdns_heuristics_log();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v57 = (const char *)(v11 - (_QWORD)v13);
        v22 = "Logging DoH success after %llums, clearing filtered state";
        v23 = v21;
        v24 = 12;
LABEL_39:
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
      }
    }

    v45 = +[DNSHeuristics copyEmptyHeuristicState](DNSHeuristics, "copyEmptyHeuristicState");
    v46 = +[DNSHeuristics setNetworkSettings:value:](DNSHeuristics, "setNetworkSettings:value:", v53, v45);

    v28 = v46 & +[DNSHeuristics setNetworkAsFiltered:filtered:](DNSHeuristics, "setNetworkAsFiltered:filtered:", v53, 0);
    v21 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_100140E80, &off_100140E98, 0));
    objc_msgSend(v6, "updateKnownNetworkProfile:properties:error:", v53, v21, 0);
LABEL_47:

    goto LABEL_48;
  }
  LOBYTE(v28) = 1;
LABEL_48:
  objc_msgSend(v6, "invalidate");

  return v28;
}

+ (BOOL)reportResolutionFailure:(id)a3 isTimeout:(BOOL)a4
{
  return +[DNSHeuristics updateHeuristicState:isTimeout:](DNSHeuristics, "updateHeuristicState:isTimeout:", 0, a4);
}

@end
