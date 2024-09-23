@implementation PBBridgeResponsePerformanceMonitor

+ (id)shareMonitor
{
  if (shareMonitor_onceToken != -1)
    dispatch_once(&shareMonitor_onceToken, &__block_literal_global_4);
  return (id)shareMonitor___shareMonitor;
}

void __50__PBBridgeResponsePerformanceMonitor_shareMonitor__block_invoke()
{
  PBBridgeResponsePerformanceMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(PBBridgeResponsePerformanceMonitor);
  v1 = (void *)shareMonitor___shareMonitor;
  shareMonitor___shareMonitor = (uint64_t)v0;

}

- (void)beginMonitorTransaction
{
  NSMutableArray *v3;
  NSMutableArray *measurements;
  NSMutableDictionary *v5;
  NSMutableDictionary *macroActivities;
  NSMutableDictionary *v7;
  NSMutableDictionary *milestones;

  if (!self->_measurements)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    measurements = self->_measurements;
    self->_measurements = v3;

  }
  if (!self->_macroActivities)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    macroActivities = self->_macroActivities;
    self->_macroActivities = v5;

  }
  if (!self->_milestones)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    milestones = self->_milestones;
    self->_milestones = v7;

  }
}

- (void)endMonitorTransaction
{
  NSMutableString *v3;
  NSMutableString *logBuffer;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (NSMutableString *)objc_claimAutoreleasedReturnValue();
  logBuffer = self->_logBuffer;
  self->_logBuffer = v3;

  -[PBBridgeResponsePerformanceMonitor _logMeasurements](self, "_logMeasurements");
  -[PBBridgeResponsePerformanceMonitor _logMacroActivitiesLocal:](self, "_logMacroActivitiesLocal:", 1);
  if (self->_remoteMacroActivities)
    -[PBBridgeResponsePerformanceMonitor _logMacroActivitiesLocal:](self, "_logMacroActivitiesLocal:", 0);
  if (!self->_remoteMilestones)
    -[PBBridgeResponsePerformanceMonitor _logMilestones](self, "_logMilestones");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Bridge-Pair-Performance-Report-%f.txt"), CFAbsoluteTimeGetCurrent());
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableString writeToFile:atomically:encoding:error:](self->_logBuffer, "writeToFile:atomically:encoding:error:", v5, 1, 4, 0);
  -[NSMutableArray removeAllObjects](self->_measurements, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_macroActivities, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_milestones, "removeAllObjects");

}

- (void)_logLocalMeasurements:(BOOL)a3
{
  __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  id v43;
  double v44;
  id v45;
  PBBridgeResponsePerformanceMonitor *v46;
  NSMutableString *logBuffer;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  double v57;
  double v58;
  id v59;
  double v60;
  id v61;
  double v62;
  id v63;
  double v64;
  double v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  NSMutableString *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  id v121;
  uint64_t v122;
  id obj;
  void *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  id v128;
  uint64_t v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  _BYTE v134[128];
  uint64_t v135;

  v135 = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("Remote");
  if (a3)
  {
    v4 = CFSTR("Local");
    v5 = 8;
  }
  else
  {
    v5 = 32;
  }
  if (a3)
    v6 = 40;
  else
    v6 = 16;
  v7 = v4;
  v8 = *(id *)((char *)&self->super.isa + v5);
  v128 = *(id *)((char *)&self->super.isa + v6);
  if (objc_msgSend(v8, "count"))
  {
    PBBAddToBufferAndLog(self->_logBuffer, &stru_24CBBF548, v9, v10, v11, v12, v13, v14, v115);
    v122 = (uint64_t)v7;
    PBBAddToBufferAndLog(self->_logBuffer, CFSTR("Statistics for %@ Pairing Run:"), v15, v16, v17, v18, v19, v20, (uint64_t)v7);
    PBBAddToBufferAndLog(self->_logBuffer, CFSTR("\tActivity, Identifier, RTT, OWD, LocalMessageSentTime"), v21, v22, v23, v24, v25, v26, v116);
    v132 = 0u;
    v133 = 0u;
    v130 = 0u;
    v131 = 0u;
    v121 = v8;
    obj = v8;
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v130, v134, 16);
    if (v27)
    {
      v28 = v27;
      v129 = 0;
      v126 = 0;
      v127 = 0;
      v29 = 0;
      v30 = 0;
      v124 = 0;
      v125 = *(_QWORD *)v131;
      v31 = 0.0;
      v32 = 0.0;
      v33 = 0.0;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v131 != v125)
            objc_enumerationMutation(obj);
          v35 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * i);
          objc_msgSend(v35, "identifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v128, "objectForKey:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (v37)
          {
            objc_msgSend(v37, "timeEnded");
            v39 = v38;
            objc_msgSend(v35, "timeStarted");
            v41 = v39 - v40;
            objc_msgSend(v124, "timeDelta");
            if (v41 > v42)
            {
              objc_msgSend(v37, "setTimeDelta:", v41);
              v43 = v37;

              v124 = v43;
            }
            if (!v30 || (objc_msgSend(v30, "timeDelta"), v41 < v44))
            {
              objc_msgSend(v37, "setTimeDelta:", v41);
              v45 = v37;

              v30 = v45;
            }
            v32 = v32 + v41;
            ++v129;
          }
          v46 = self;
          logBuffer = self->_logBuffer;
          objc_msgSend(v35, "activityType");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "identifier");
          v49 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "timeDelta");
          objc_msgSend(v35, "timeStarted");
          PBBAddToBufferAndLog(logBuffer, CFSTR("\t%@, %@, %f, %f, %f"), v50, v51, v52, v53, v54, v55, (uint64_t)v48);

          objc_msgSend(v35, "activityType");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v49) = objc_msgSend(v56, "isEqualToString:", CFSTR("PBBGMessageIDTellGizmoToUpdateProgressState"));

          if ((v49 & 1) != 0)
          {
            self = v46;
          }
          else
          {
            objc_msgSend(v35, "timeDelta");
            v58 = v57;
            v59 = v127;
            objc_msgSend(v127, "timeDelta");
            if (v58 > v60)
            {
              v61 = v35;

              v59 = v61;
            }
            self = v46;
            v127 = v59;
            if (!v29 || (objc_msgSend(v29, "timeDelta"), v58 < v62))
            {
              v63 = v35;

              v29 = v63;
            }
            ++v126;
            objc_msgSend(v35, "timeDelta");
            v33 = v33 + v64;
          }
          objc_msgSend(v35, "timeDelta");
          v31 = v31 + v65;

        }
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v130, v134, 16);
      }
      while (v28);
    }
    else
    {
      v129 = 0;
      v127 = 0;
      v29 = 0;
      v124 = 0;
      v30 = 0;
    }

    PBBAddToBufferAndLog(self->_logBuffer, &stru_24CBBF548, v66, v67, v68, v69, v70, v71, v117);
    PBBAddToBufferAndLog(self->_logBuffer, CFSTR("Round-Trip Delay Time"), v72, v73, v74, v75, v76, v77, v118);
    v7 = (__CFString *)v122;
    if (v127)
      PBBAddToBufferAndLog(self->_logBuffer, CFSTR("Longest %@ RTT Measurement: %@"), v78, v79, v80, v81, v82, v83, v122);
    if (v29)
      PBBAddToBufferAndLog(self->_logBuffer, CFSTR("Shortest %@ RTT Measurement: %@"), v78, v79, v80, v81, v82, v83, v122);
    v84 = self->_logBuffer;
    objc_msgSend(obj, "count");
    objc_msgSend(obj, "count");
    PBBAddToBufferAndLog(v84, CFSTR("Average %@ RTT: %f (Total %f across %d runs)."), v85, v86, v87, v88, v89, v90, v122);
    PBBAddToBufferAndLog(self->_logBuffer, CFSTR("(Without Sync Messages) Average %@ RTT: %f (Total %f across %d runs)."), v91, v92, v93, v94, v95, v96, v122);
    v8 = v121;
    if (v129)
    {
      PBBAddToBufferAndLog(self->_logBuffer, &stru_24CBBF548, v97, v98, v99, v100, v101, v102, v119);
      PBBAddToBufferAndLog(self->_logBuffer, CFSTR("One-Way Delay Time (Only correct if time sync is accurate)"), v103, v104, v105, v106, v107, v108, v120);
      if (v124)
        PBBAddToBufferAndLog(self->_logBuffer, CFSTR("Longest %@ OWD Measurement: %@"), v109, v110, v111, v112, v113, v114, v122);
      if (v30)
        PBBAddToBufferAndLog(self->_logBuffer, CFSTR("Shortest %@ OWD Measurement: %@"), v109, v110, v111, v112, v113, v114, v122);
      PBBAddToBufferAndLog(self->_logBuffer, CFSTR("Average %@ OWD Time: %f (Total %f across %d runs)."), v109, v110, v111, v112, v113, v114, v122);
    }

  }
}

- (void)_logMeasurements
{
  -[PBBridgeResponsePerformanceMonitor _logLocalMeasurements:](self, "_logLocalMeasurements:", 1);
  if (self->_remoteMeasurements)
    -[PBBridgeResponsePerformanceMonitor _logLocalMeasurements:](self, "_logLocalMeasurements:", 0);
}

- (void)_logMacroActivitiesLocal:(BOOL)a3
{
  __CFString *v4;
  uint64_t v5;
  __CFString *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  NSMutableString *logBuffer;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __CFString *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("Remote");
  if (a3)
  {
    v4 = CFSTR("Local");
    v5 = 24;
  }
  else
  {
    v5 = 48;
  }
  v6 = v4;
  v7 = *(id *)((char *)&self->super.isa + v5);
  if (objc_msgSend(v7, "count"))
  {
    PBBAddToBufferAndLog(self->_logBuffer, &stru_24CBBF548, v8, v9, v10, v11, v12, v13, v40);
    v42 = v6;
    PBBAddToBufferAndLog(self->_logBuffer, CFSTR("Other %@ Activities: "), v14, v15, v16, v17, v18, v19, (uint64_t)v6);
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend(v7, "allValues");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v44 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          logBuffer = self->_logBuffer;
          objc_msgSend(v25, "activityType");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "timeDelta");
          PBBAddToBufferAndLog(logBuffer, CFSTR("\t Activity: %@ time: %f"), v28, v29, v30, v31, v32, v33, (uint64_t)v27);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v22);
    }

    PBBAddToBufferAndLog(self->_logBuffer, &stru_24CBBF548, v34, v35, v36, v37, v38, v39, v41);
    v6 = v42;
  }

}

- (void)_logMilestones
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  NSMutableString *logBuffer;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  if (-[NSMutableDictionary count](self->_milestones, "count"))
  {
    PBBAddToBufferAndLog(self->_logBuffer, &stru_24CBBF548, v3, v4, v5, v6, v7, v8, v36);
    PBBAddToBufferAndLog(self->_logBuffer, CFSTR("Local Milestones: "), v9, v10, v11, v12, v13, v14, v37);
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[NSMutableDictionary allValues](self->_milestones, "allValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v40 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          logBuffer = self->_logBuffer;
          objc_msgSend(v20, "activityType");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "identifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "timeEnded");
          PBBAddToBufferAndLog(logBuffer, CFSTR("\t Milestone: %@ (%@) time ended: %f"), v24, v25, v26, v27, v28, v29, (uint64_t)v22);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v17);
    }

    PBBAddToBufferAndLog(self->_logBuffer, &stru_24CBBF548, v30, v31, v32, v33, v34, v35, v38);
  }
}

- (void)addMeasurement:(double)a3 timeSent:(double)a4 activityType:(id)a5 activityIdentifier:(id)a6
{
  id v10;
  id v11;
  PBBProtoPerformanceResult *v12;

  v10 = a6;
  v11 = a5;
  -[PBBridgeResponsePerformanceMonitor beginMonitorTransaction](self, "beginMonitorTransaction");
  v12 = objc_alloc_init(PBBProtoPerformanceResult);
  -[PBBProtoPerformanceResult setTimeDelta:](v12, "setTimeDelta:", a3);
  -[PBBProtoPerformanceResult setTimeStarted:](v12, "setTimeStarted:", a4);
  -[PBBProtoPerformanceResult setActivityType:](v12, "setActivityType:", v11);

  -[PBBProtoPerformanceResult setIdentifier:](v12, "setIdentifier:", v10);
  -[NSMutableArray addObject:](self->_measurements, "addObject:", v12);

}

- (void)addMilestone:(double)a3 activityType:(id)a4 activityIdentifier:(id)a5
{
  id v8;
  PBBProtoPerformanceResult *v9;
  id v10;

  v10 = a4;
  v8 = a5;
  -[PBBridgeResponsePerformanceMonitor beginMonitorTransaction](self, "beginMonitorTransaction");
  if (v8)
  {
    v9 = objc_alloc_init(PBBProtoPerformanceResult);
    -[PBBProtoPerformanceResult setTimeEnded:](v9, "setTimeEnded:", a3);
    -[PBBProtoPerformanceResult setActivityType:](v9, "setActivityType:", v10);
    -[PBBProtoPerformanceResult setIdentifier:](v9, "setIdentifier:", v8);
    -[NSMutableDictionary setObject:forKey:](self->_milestones, "setObject:forKey:", v9, v8);

  }
}

- (void)beginMacroActivity:(id)a3 beginTime:(double)a4
{
  PBBProtoPerformanceResult *v6;
  id v7;

  v7 = a3;
  -[PBBridgeResponsePerformanceMonitor beginMonitorTransaction](self, "beginMonitorTransaction");
  if (v7)
  {
    v6 = objc_alloc_init(PBBProtoPerformanceResult);
    -[PBBProtoPerformanceResult setTimeStarted:](v6, "setTimeStarted:", a4);
    -[PBBProtoPerformanceResult setActivityType:](v6, "setActivityType:", v7);
    -[PBBProtoPerformanceResult setIdentifier:](v6, "setIdentifier:", &stru_24CBBF548);
    -[NSMutableDictionary setObject:forKey:](self->_macroActivities, "setObject:forKey:", v6, v7);

  }
}

- (double)endMacroActivity:(id)a3 beginTime:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSObject *v13;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[NSMutableDictionary objectForKey:](self->_macroActivities, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setTimeEnded:", a4);
    objc_msgSend(v8, "timeEnded");
    v10 = v9;
    objc_msgSend(v8, "timeStarted");
    v12 = v10 - v11;
    objc_msgSend(v8, "setTimeDelta:", v12);
    -[NSMutableDictionary setObject:forKey:](self->_macroActivities, "setObject:forKey:", v8, v6);
  }
  else
  {
    pbb_shared_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v6;
      _os_log_impl(&dword_2113B6000, v13, OS_LOG_TYPE_DEFAULT, "Tried to end un-started Activity (%@)", (uint8_t *)&v15, 0xCu);
    }

    v12 = -1.0;
  }

  return v12;
}

- (NSMutableArray)measurements
{
  return self->_measurements;
}

- (NSMutableDictionary)milestones
{
  return self->_milestones;
}

- (NSMutableDictionary)macroActivities
{
  return self->_macroActivities;
}

- (NSArray)remoteMeasurements
{
  return self->_remoteMeasurements;
}

- (void)setRemoteMeasurements:(id)a3
{
  objc_storeStrong((id *)&self->_remoteMeasurements, a3);
}

- (NSDictionary)remoteMilestones
{
  return self->_remoteMilestones;
}

- (void)setRemoteMilestones:(id)a3
{
  objc_storeStrong((id *)&self->_remoteMilestones, a3);
}

- (NSDictionary)remoteMacroActivities
{
  return self->_remoteMacroActivities;
}

- (void)setRemoteMacroActivities:(id)a3
{
  objc_storeStrong((id *)&self->_remoteMacroActivities, a3);
}

- (NSMutableString)logBuffer
{
  return self->_logBuffer;
}

- (void)setLogBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_logBuffer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logBuffer, 0);
  objc_storeStrong((id *)&self->_remoteMacroActivities, 0);
  objc_storeStrong((id *)&self->_remoteMilestones, 0);
  objc_storeStrong((id *)&self->_remoteMeasurements, 0);
  objc_storeStrong((id *)&self->_macroActivities, 0);
  objc_storeStrong((id *)&self->_milestones, 0);
  objc_storeStrong((id *)&self->_measurements, 0);
}

@end
