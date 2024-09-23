@implementation PPSTimeIntervalSetGenerator

- (PPSTimeIntervalSetGenerator)initWithFilepath:(id)a3 settings:(unint64_t)a4 directionality:(unint64_t)a5
{
  id v8;
  PPSTimeIntervalSetGenerator *v9;
  PPSTimeIntervalSetGenerator *v10;
  PPSRequestDispatcher *v11;
  PPSRequestDispatcher *dispatcher;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PPSTimeIntervalSetGenerator;
  v9 = -[PPSTimeIntervalSetGenerator init](&v14, sel_init);
  v10 = v9;
  if (v8 && v9)
  {
    v11 = -[PPSRequestDispatcher initWithFilepath:]([PPSRequestDispatcher alloc], "initWithFilepath:", v8);
    dispatcher = v10->_dispatcher;
    v10->_dispatcher = v11;

    v10->_settings = a4;
    v10->_directionality = a5;
  }

  return v10;
}

- (PPSTimeIntervalSetGenerator)initWithDispatcher:(id)a3 settings:(unint64_t)a4 directionality:(unint64_t)a5
{
  id v9;
  PPSTimeIntervalSetGenerator *v10;
  PPSTimeIntervalSetGenerator *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PPSTimeIntervalSetGenerator;
  v10 = -[PPSTimeIntervalSetGenerator init](&v13, sel_init);
  v11 = v10;
  if (v9 && v10)
  {
    objc_storeStrong((id *)&v10->_dispatcher, a3);
    v11->_settings = a4;
    v11->_directionality = a5;
  }

  return v11;
}

- (id)intervalSetForTimeSeries:(id)a3 withIntervalStartCheckBlock:(id)a4 intervalEndCheckBlock:(id)a5 payloadBlock:(id)a6 coalescePolicy:(id)a7
{
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  NSDictionary *v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  void *v43;
  double v44;
  double v45;
  NSDictionary *v46;
  uint64_t v47;
  void *v48;
  int v49;
  id v50;
  NSDictionary *v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  char v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  NSDictionary *v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  NSDictionary *v73;
  double v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  PPSTimeIntervalSet *v79;
  NSDictionary *v81;
  uint64_t v82;
  void *v83;
  unint64_t directionality;
  unint64_t settings;
  id v86;
  id v87;
  id v88;
  PPSTimeIntervalSet *v89;
  void (**v90)(void);
  void *v91;
  void *v92;
  id v93;
  const __CFString *v94;
  _QWORD v95[3];

  v95[1] = *MEMORY[0x24BDAC8D0];
  v88 = a3;
  v93 = a4;
  v86 = a5;
  v90 = (void (**)(void))a6;
  v87 = a7;
  +[PPSPerformanceProfiler sharedInstance](PPSPerformanceProfiler, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "startProfilingForPhase:", CFSTR("IntervalSetGeneration"));

  v92 = (void *)objc_msgSend(v88, "copy");
  settings = self->_settings;
  v91 = (void *)objc_opt_new();
  if (self->_directionality == 3)
    goto LABEL_13;
  if ((settings & 1) != 0)
  {
    -[PPSTimeIntervalSetGenerator systemSleepTimeSeries](self, "systemSleepTimeSeries");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v92, "mergeWithTimeSeries:", v13);
    if (objc_msgSend(v13, "count"))
    {
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "groupId");

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "addObject:", v16);

    }
  }
  if ((settings & 6) == 0)
  {
LABEL_13:
    v19 = -1;
  }
  else
  {
    -[PPSTimeIntervalSetGenerator systemHaltTimeSeries](self, "systemHaltTimeSeries");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      objc_msgSend(v92, "mergeWithTimeSeries:", v17);
    if (objc_msgSend(v17, "count"))
    {
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "groupId");

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "addObject:", v20);

    }
    else
    {
      v19 = -1;
    }

  }
  objc_msgSend(v92, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "monotonicTimestamp");
  v23 = v22;

  objc_msgSend(v92, "lastObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "monotonicTimestamp");
  v26 = v25;

  -[PPSTimeIntervalSetGenerator timelineBoundaries](self, "timelineBoundaries");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[PPSTimeIntervalSetGenerator timelineBoundaries](self, "timelineBoundaries");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "startDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "timeIntervalSince1970");
    v23 = v30;

    -[PPSTimeIntervalSetGenerator timelineBoundaries](self, "timelineBoundaries");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "duration");
    v26 = v23 + v32;

  }
  objc_msgSend(v92, "objectEnumerator");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  directionality = self->_directionality;
  if (directionality == 1)
  {
    objc_msgSend(v92, "reverseObjectEnumerator");
    v34 = objc_claimAutoreleasedReturnValue();

    v33 = (void *)v34;
  }
  else
  {
    v23 = v26;
  }
  v89 = -[PPSTimeIntervalSet initWithCoalescePolicy:]([PPSTimeIntervalSet alloc], "initWithCoalescePolicy:", v87);
  v82 = v19;
  v94 = CFSTR("__directionality");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_directionality);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v95[0] = v35;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v95, &v94, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v36, "mutableCopy");

  v38 = 0;
  v39 = 0;
  v40 = 0;
LABEL_22:
  v41 = v40;
  while (1)
  {
    objc_msgSend(v33, "nextObject");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = self->_directionality;
    if (!v40)
      break;
    if (v42 == 3)
    {
      objc_msgSend(v40, "metricValueForKey:", CFSTR("timestampEnd"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "doubleValue");
      v45 = v44;

      v41 = v40;
      if (PPSValidateIntervalStart(v93, v40, v37))
      {
        if (v90)
        {
          v90[2]();
          v46 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v46 = 0;
        }

        objc_msgSend(v40, "monotonicTimestamp");
        v38 = v46;
        PPSAddInterval(v89, v58, v45, v46);
        goto LABEL_22;
      }
    }
    else
    {
      v41 = v40;
      if (v42 < 3)
      {
        v47 = objc_msgSend(v40, "groupId");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v91, "containsObject:", v48);

        if (v49)
        {
          if (v39)
          {
            v50 = 0;
            if (objc_msgSend(v39, "groupId") != v47 && ((v47 == v82) & (settings >> 2)) == 0)
            {
              if (v90)
              {
                v90[2]();
                v51 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v51 = 0;
              }

              objc_msgSend(v39, "monotonicTimestamp");
              v68 = v67;
              objc_msgSend(v40, "monotonicTimestamp");
              if (directionality == 1)
                v70 = v69;
              else
                v70 = v68;
              if (directionality == 1)
                v71 = v68;
              else
                v71 = v69;
              PPSAddInterval(v89, v70, v71, v51);
              v50 = 0;
              v38 = v51;
            }
          }
          else
          {
            v50 = 0;
          }
          goto LABEL_67;
        }
        if (v39)
        {
          v81 = v38;
          v52 = v86;
          v53 = v40;
          v54 = v37;
          v55 = v54;
          v83 = v53;
          if (v86)
          {
            v56 = (*((uint64_t (**)(id, id, id))v86 + 2))(v52, v53, v54);

            v38 = v81;
            v57 = v83;
            if ((v56 & 1) == 0 && !PPSValidateIntervalStart(v93, v83, v55))
              goto LABEL_55;
          }
          else
          {

            v38 = v81;
            v57 = v83;
          }
          objc_msgSend(v39, "monotonicTimestamp");
          v60 = v59;
          objc_msgSend(v57, "monotonicTimestamp");
          v62 = v61;
          if (v90)
          {
            v90[2]();
            v63 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v63 = 0;
          }

          if (directionality == 1)
            v64 = v62;
          else
            v64 = v60;
          if (directionality == 1)
            v65 = v60;
          else
            v65 = v62;
          v38 = v63;
          PPSAddInterval(v89, v64, v65, v63);
        }
LABEL_55:
        if (PPSValidateIntervalStart(v93, v40, v37))
          v66 = v40;
        else
          v66 = 0;
        v50 = v66;
LABEL_67:

        v39 = v50;
        goto LABEL_22;
      }
    }
  }
  if (v42 == 3 || v39 == 0)
  {
    v73 = v38;
  }
  else
  {
    objc_msgSend(v39, "monotonicTimestamp");
    v75 = v74;
    if (v90)
    {
      v90[2]();
      v73 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v73 = 0;
    }

    if (directionality == 1)
      v76 = v23;
    else
      v76 = v75;
    if (directionality == 1)
      v77 = v75;
    else
      v77 = v23;
    PPSAddInterval(v89, v76, v77, v73);
  }
  +[PPSPerformanceProfiler sharedInstance](PPSPerformanceProfiler, "sharedInstance");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "endProfilingForPhase:", CFSTR("IntervalSetGeneration"));

  v79 = v89;
  return v79;
}

- (id)intervalSetMapForTimeSeries:(id)a3 withGroupingDimensions:(id)a4 withIntervalStartCheckBlock:(id)a5 intervalEndCheckBlock:(id)a6 payloadBlock:(id)a7 coalescePolicy:(id)a8
{
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v35;
  id v36;
  id v37;
  id v38;
  id obj;
  id v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v43 = a4;
  v35 = a5;
  v36 = a6;
  v37 = a7;
  v38 = a8;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v13;
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  if (v42)
  {
    v41 = *(_QWORD *)v53;
    do
    {
      v44 = 0;
      do
      {
        if (*(_QWORD *)v53 != v41)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v44);
        if (v14)
        {
          if (!objc_msgSend(v43, "count"))
            goto LABEL_22;
          v45 = (void *)objc_opt_new();
          v50 = 0u;
          v51 = 0u;
          v48 = 0u;
          v49 = 0u;
          v15 = v43;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
          if (v16)
          {
            v17 = *(_QWORD *)v49;
            do
            {
              v18 = 0;
              do
              {
                if (*(_QWORD *)v49 != v17)
                  objc_enumerationMutation(v15);
                v19 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v18);
                v20 = (void *)MEMORY[0x24BDD17C8];
                objc_msgSend(v14, "metricKeysAndValues");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "groupBy");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "objectForKeyedSubscript:", v22);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "stringWithFormat:", CFSTR("%@"), v23);
                v24 = (void *)objc_claimAutoreleasedReturnValue();

                if (v24)
                {
                  objc_msgSend(v19, "groupBy");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "setObject:forKeyedSubscript:", v24, v25);

                }
                ++v18;
              }
              while (v16 != v18);
              v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
            }
            while (v16);
          }

          objc_msgSend(v40, "objectForKeyedSubscript:", v45);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26 == 0;

          if (v27)
          {
            v28 = (void *)MEMORY[0x24BDD1758];
            v46[0] = MEMORY[0x24BDAC760];
            v46[1] = 3221225472;
            v46[2] = __160__PPSTimeIntervalSetGenerator_intervalSetMapForTimeSeries_withGroupingDimensions_withIntervalStartCheckBlock_intervalEndCheckBlock_payloadBlock_coalescePolicy___block_invoke;
            v46[3] = &unk_25142CB60;
            v29 = v45;
            v47 = v29;
            objc_msgSend(v28, "predicateWithBlock:", v46);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(obj, "filteredTimeSeriesUsingPredicate:", v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[PPSTimeIntervalSetGenerator intervalSetForTimeSeries:withIntervalStartCheckBlock:intervalEndCheckBlock:payloadBlock:coalescePolicy:](self, "intervalSetForTimeSeries:withIntervalStartCheckBlock:intervalEndCheckBlock:payloadBlock:coalescePolicy:", v31, v35, v36, v37, v38);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "setObject:forKeyedSubscript:", v32, v29);

          }
        }
        ++v44;
      }
      while (v44 != v42);
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    }
    while (v42);
  }
LABEL_22:

  return v40;
}

uint64_t __160__PPSTimeIntervalSetGenerator_intervalSetMapForTimeSeries_withGroupingDimensions_withIntervalStartCheckBlock_intervalEndCheckBlock_payloadBlock_coalescePolicy___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7);
        objc_msgSend(v3, "metricKeysAndValues", (_QWORD)v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v8) = objc_msgSend(v10, "isEqual:", v11);

        if ((v8 & 1) == 0)
        {
          v12 = 0;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_11:

  return v12;
}

- (id)systemHaltTimeSeries
{
  return 0;
}

- (id)systemSleepTimeSeries
{
  return 0;
}

- (id)fetchTimeSeriesForBootTime
{
  void *v3;
  PPSTimeSeriesRequest *v4;
  void *v5;
  PPSTimeSeriesRequest *v6;
  PPSRequestDispatcher *dispatcher;
  void *v8;
  uint64_t v10;

  PPSCreateSubsystemCategoryPredicate((uint64_t)CFSTR("ConfigMetrics"), (uint64_t)CFSTR("DeviceConfig"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [PPSTimeSeriesRequest alloc];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_2514401E8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPSTimeSeriesRequest initWithMetrics:predicate:timeFilter:](v4, "initWithMetrics:predicate:timeFilter:", v5, v3, 0);

  dispatcher = self->_dispatcher;
  v10 = 0;
  -[PPSRequestDispatcher dataForRequest:withError:](dispatcher, "dataForRequest:withError:", v6, &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchTimeSeriesForBatteryShutdown
{
  void *v3;
  PPSTimeSeriesRequest *v4;
  void *v5;
  PPSTimeSeriesRequest *v6;
  PPSRequestDispatcher *dispatcher;
  void *v8;
  uint64_t v10;

  PPSCreateSubsystemCategoryPredicate((uint64_t)CFSTR("BatteryMetrics"), (uint64_t)CFSTR("BatteryShutdown"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [PPSTimeSeriesRequest alloc];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_251440200);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPSTimeSeriesRequest initWithMetrics:predicate:timeFilter:](v4, "initWithMetrics:predicate:timeFilter:", v5, v3, 0);

  dispatcher = self->_dispatcher;
  v10 = 0;
  -[PPSRequestDispatcher dataForRequest:withError:](dispatcher, "dataForRequest:withError:", v6, &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSDateInterval)timelineBoundaries
{
  return -[PPSRequestDispatcher timelineBoundaries](self->_dispatcher, "timelineBoundaries");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timelineBoundaries, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
}

@end
