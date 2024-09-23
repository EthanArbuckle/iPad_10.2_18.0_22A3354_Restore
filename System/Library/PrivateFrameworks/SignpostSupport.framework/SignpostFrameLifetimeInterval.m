@implementation SignpostFrameLifetimeInterval

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commits, 0);
  objc_storeStrong((id *)&self->_contextInfoForHIDInput, 0);
  objc_storeStrong((id *)&self->_earliestTimeContextInfo, 0);
  objc_storeStrong((id *)&self->_frameLatencyInterval, 0);
  objc_storeStrong((id *)&self->_skippedRenders, 0);
  objc_storeStrong((id *)&self->_renderInterval, 0);
  objc_storeStrong((id *)&self->_hidLatencyInterval, 0);
  objc_storeStrong((id *)&self->_pidToContextInfoArrayDict, 0);
}

- (BOOL)frameLatencyIsLong
{
  void *v3;
  unsigned __int8 v4;
  void *v6;
  BOOL v7;

  -[SignpostFrameLifetimeInterval frameLatencyInterval](self, "frameLatencyInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  if (-[SignpostFrameLifetimeInterval bufferCount](self, "bufferCount") < 2)
    v4 = 1;
  else
    v4 = -[SignpostFrameLifetimeInterval bufferCount](self, "bufferCount") - 1;
  -[SignpostFrameLifetimeInterval frameLatencyInterval](self, "frameLatencyInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SignpostFrameLifetimeInterval _isLongMCT:expectedFrameLatency:](self, "_isLongMCT:expectedFrameLatency:", objc_msgSend(v6, "durationMachContinuousTime"), v4);

  return v7;
}

- (SignpostFrameLatencyInterval)frameLatencyInterval
{
  return self->_frameLatencyInterval;
}

- (unsigned)bufferCount
{
  return self->_bufferCount;
}

+ (id)_frameSeedForLifetimeIntervalBegin:(id)a3
{
  return (id)objc_msgSend(a3, "_numberArgumentWithName:", CFSTR("frame_seed"));
}

- (SignpostHIDLatencyInterval)hidLatencyInterval
{
  return self->_hidLatencyInterval;
}

- (BOOL)_isLongMCT:(unint64_t)a3 expectedFrameLatency:(unsigned __int8)a4
{
  unsigned int v4;
  unint64_t v7;

  v4 = a4;
  v7 = (unint64_t)(float)((float)-[SignpostFrameLifetimeInterval displayRefreshIntervalDurationMachTime](self, "displayRefreshIntervalDurationMachTime")* 1.1);
  return v7
       + -[SignpostFrameLifetimeInterval displayRefreshIntervalDurationMachTime](self, "displayRefreshIntervalDurationMachTime")* v4 < a3;
}

- (unint64_t)displayRefreshIntervalDurationMachTime
{
  return self->_displayRefreshIntervalDurationMachTime;
}

- (SignpostFrameLifetimeInterval)initWithInterval:(id)a3 contextArray:(id)a4 renderInterval:(id)a5 frameSeedToSkippedRenderIntervals:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  SignpostHIDLatencyInterval *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  SignpostFrameLifetimeInterval *v31;
  SignpostFrameLatencyInterval *v32;
  uint64_t v33;
  uint64_t v34;
  SignpostFrameLatencyInterval *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v45;
  id v46;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "beginEvent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_numberArgumentWithName:", CFSTR("frame_seed"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v45 = v13;
    v46 = v11;
    v16 = objc_msgSend(v15, "unsignedLongLongValue");
    v17 = objc_msgSend(v10, "signpostId");
    objc_msgSend(v10, "beginEvent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_numberArgumentWithName:", CFSTR("input_time"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = [SignpostHIDLatencyInterval alloc];
      v21 = objc_msgSend(v19, "unsignedLongLongValue");
      v22 = objc_msgSend(v10, "endMachContinuousTime");
      objc_msgSend(v10, "timebaseRatio");
      v23 = -[SignpostHIDLatencyInterval initWithStartMCT:endMCT:timebaseRatio:swapID:frameSeed:](v20, "initWithStartMCT:endMCT:timebaseRatio:swapID:frameSeed:", v21, v22, v17, v16);
    }
    else
    {
      v23 = 0;
    }

    v32 = [SignpostFrameLatencyInterval alloc];
    v33 = objc_msgSend(v12, "endMachContinuousTime");
    v34 = objc_msgSend(v10, "endMachContinuousTime");
    objc_msgSend(v10, "timebaseRatio");
    v35 = -[SignpostFrameLatencyInterval initWithStartMCT:endMCT:timebaseRatio:swapID:frameSeed:totalFrameCount:lateFrameCount:](v32, "initWithStartMCT:endMCT:timebaseRatio:swapID:frameSeed:totalFrameCount:lateFrameCount:", v33, v34, v17, v16, 0, 0);
    if (v35)
    {
      v13 = v45;
      v11 = v46;
      self = -[SignpostFrameLifetimeInterval initWithInterval:contextArray:hidLatencyInterval:renderInterval:frameLatencyInterval:frameSeedToSkippedRenderIntervals:](self, "initWithInterval:contextArray:hidLatencyInterval:renderInterval:frameLatencyInterval:frameSeedToSkippedRenderIntervals:", v10, v46, v23, v12, v35, v45);
      v31 = self;
    }
    else
    {
      _signpost_debug_log();
      v36 = objc_claimAutoreleasedReturnValue();
      v13 = v45;
      v11 = v46;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        -[SignpostFrameLifetimeInterval initWithInterval:contextArray:renderInterval:frameSeedToSkippedRenderIntervals:].cold.2(v36, v37, v38, v39, v40, v41, v42, v43);

      v31 = 0;
    }

  }
  else
  {
    _signpost_debug_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[SignpostFrameLifetimeInterval initWithInterval:contextArray:renderInterval:frameSeedToSkippedRenderIntervals:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);
    v31 = 0;
  }

  return v31;
}

- (BOOL)hidLatencyIsLong
{
  void *v3;
  void *v4;
  BOOL v5;

  -[SignpostFrameLifetimeInterval hidLatencyInterval](self, "hidLatencyInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[SignpostFrameLifetimeInterval hidLatencyInterval](self, "hidLatencyInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SignpostFrameLifetimeInterval _isLongMCT:expectedFrameLatency:](self, "_isLongMCT:expectedFrameLatency:", objc_msgSend(v4, "durationMachContinuousTime"), -[SignpostFrameLifetimeInterval bufferCount](self, "bufferCount"));

  return v5;
}

- (NSSet)contributingPIDs
{
  void *v3;
  void *v4;
  void *v5;

  -[SignpostFrameLifetimeInterval pidToContextInfoArrayDict](self, "pidToContextInfoArrayDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SignpostFrameLifetimeInterval pidToContextInfoArrayDict](self, "pidToContextInfoArrayDict");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "count"))
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v5);
    else
      v3 = 0;

  }
  return (NSSet *)v3;
}

- (NSDictionary)pidToContextInfoArrayDict
{
  return self->_pidToContextInfoArrayDict;
}

- (SignpostFrameLifetimeInterval)initWithInterval:(id)a3 contextArray:(id)a4 hidLatencyInterval:(id)a5 renderInterval:(id)a6 frameLatencyInterval:(id)a7 frameSeedToSkippedRenderIntervals:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  SignpostFrameLifetimeInterval *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  unint64_t v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  SignpostFrameLifetimeInterval *v72;
  SignpostContextInfo *earliestTimeContextInfo;
  NSObject *v74;
  NSDictionary *pidToContextInfoArrayDict;
  void *v76;
  uint64_t v77;
  NSArray *skippedRenders;
  id v80;
  id v81;
  id v82;
  id obj;
  id v84;
  uint64_t v85;
  void *v86;
  void *v87;
  NSDictionary *v88;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  objc_super v94;
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v89 = a5;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v94.receiver = self;
  v94.super_class = (Class)SignpostFrameLifetimeInterval;
  v20 = -[SignpostAnimationSubInterval initWithInterval:](&v94, sel_initWithInterval_, v14);
  if (!v20)
    goto LABEL_57;
  objc_msgSend(v14, "beginEvent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_numberArgumentWithName:", CFSTR("frame_seed"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    _signpost_debug_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      -[SignpostFrameLifetimeInterval initWithInterval:contextArray:hidLatencyInterval:renderInterval:frameLatencyInterval:frameSeedToSkippedRenderIntervals:].cold.1(v27, v28, v29, v30, v31, v32, v33, v34);

    goto LABEL_53;
  }
  v84 = a7;
  v20->_frameSeed = objc_msgSend(v22, "unsignedLongLongValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SignpostFrameLifetimeInterval frameSeed](v20, "frameSeed"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v87 = v24;
  if (!v17)
  {
    if (objc_msgSend(v24, "count") == 1)
    {
      objc_msgSend(v24, "firstObject");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if (v17)
        goto LABEL_4;
    }
    else
    {
      v17 = 0;
    }
LABEL_14:
    if (v18)
    {
      v35 = objc_msgSend(v18, "frameSeed");
      if (v35 != -[SignpostFrameLifetimeInterval frameSeed](v20, "frameSeed"))
      {
        _signpost_debug_log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          -[SignpostFrameLifetimeInterval initWithInterval:contextArray:hidLatencyInterval:renderInterval:frameLatencyInterval:frameSeedToSkippedRenderIntervals:].cold.6();
        goto LABEL_52;
      }
    }
    if (v16)
    {
      v36 = objc_msgSend(v16, "frameSeed");
      if (v36 != -[SignpostFrameLifetimeInterval frameSeed](v20, "frameSeed"))
      {
        _signpost_debug_log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          -[SignpostFrameLifetimeInterval initWithInterval:contextArray:hidLatencyInterval:renderInterval:frameLatencyInterval:frameSeedToSkippedRenderIntervals:].cold.5();
        goto LABEL_52;
      }
    }
    objc_msgSend(v14, "beginEvent");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "_numberArgumentWithName:", CFSTR("skip_request"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
      v20->_frameStallSkipRequest = objc_msgSend(v38, "unsignedLongLongValue") != 0;

    objc_msgSend(v14, "beginEvent");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "_numberArgumentWithName:", CFSTR("buffer_count"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v40)
    {
      _signpost_debug_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        -[SignpostFrameLifetimeInterval initWithInterval:contextArray:hidLatencyInterval:renderInterval:frameLatencyInterval:frameSeedToSkippedRenderIntervals:].cold.2(v26, v57, v58, v59, v60, v61, v62, v63);
      goto LABEL_52;
    }
    v20->_bufferCount = objc_msgSend(v40, "unsignedLongLongValue");

    objc_msgSend(v14, "beginEvent");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "_numberArgumentWithName:", CFSTR("refresh_interval"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v42)
    {
      _signpost_debug_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        -[SignpostFrameLifetimeInterval initWithInterval:contextArray:hidLatencyInterval:renderInterval:frameLatencyInterval:frameSeedToSkippedRenderIntervals:].cold.3(v26, v64, v65, v66, v67, v68, v69, v70);
      goto LABEL_52;
    }
    v20->_displayRefreshIntervalDurationMachTime = objc_msgSend(v42, "unsignedLongLongValue");

    objc_msgSend(v14, "endEvent");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "_numberArgumentWithName:", CFSTR("prev_frame"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
      v20->_previousFramePresentationMCT = objc_msgSend(v44, "unsignedLongLongValue");

    objc_msgSend(v14, "beginEvent");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "_numberArgumentWithName:", CFSTR("presentation_modifier_display_target_mct"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v20->_inProcessAnimationDisplayTargetMCT = objc_msgSend(v46, "unsignedLongLongValue");

    if (v15)
    {
      v80 = v19;
      v81 = v18;
      v86 = v16;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v88 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v90 = 0u;
      v91 = 0u;
      v92 = 0u;
      v93 = 0u;
      v82 = v15;
      obj = v15;
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v95, 16);
      if (v47)
      {
        v48 = v47;
        v26 = 0;
        v85 = *(_QWORD *)v91;
        while (2)
        {
          for (i = 0; i != v48; ++i)
          {
            if (*(_QWORD *)v91 != v85)
              objc_enumerationMutation(obj);
            v50 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
            v51 = objc_msgSend(v50, "frameSeed");
            if (v51 != -[SignpostFrameLifetimeInterval frameSeed](v20, "frameSeed"))
            {
              _signpost_debug_log();
              v71 = objc_claimAutoreleasedReturnValue();
              v16 = v86;
              if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
                -[SignpostFrameLifetimeInterval initWithInterval:contextArray:hidLatencyInterval:renderInterval:frameLatencyInterval:frameSeedToSkippedRenderIntervals:].cold.4();

              v18 = v81;
              v15 = v82;
              v19 = v80;
              goto LABEL_52;
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v50, "pid"));
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDictionary objectForKeyedSubscript:](v88, "objectForKeyedSubscript:", v52);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v53)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSDictionary setObject:forKeyedSubscript:](v88, "setObject:forKeyedSubscript:", v53, v52);
            }
            objc_msgSend(v53, "addObject:", v50);
            if (!v26 || (v54 = objc_msgSend(v50, "earliestMCT"), v54 < -[NSObject earliestMCT](v26, "earliestMCT")))
            {
              v55 = v50;

              v26 = v55;
            }
            v56 = objc_msgSend(v50, "earliestMCT");
            if (v56 == objc_msgSend(v86, "startMachContinuousTime"))
              objc_storeStrong((id *)&v20->_contextInfoForHIDInput, v50);

          }
          v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v95, 16);
          if (v48)
            continue;
          break;
        }
      }
      else
      {
        v26 = 0;
      }

      earliestTimeContextInfo = v20->_earliestTimeContextInfo;
      v20->_earliestTimeContextInfo = (SignpostContextInfo *)v26;
      v74 = v26;

      pidToContextInfoArrayDict = v20->_pidToContextInfoArrayDict;
      v20->_pidToContextInfoArrayDict = v88;

      v18 = v81;
      v15 = v82;
      v16 = v86;
      v24 = v87;
      v19 = v80;
    }
    objc_storeStrong((id *)&v20->_hidLatencyInterval, v89);
    objc_storeStrong((id *)&v20->_renderInterval, v17);
    objc_storeStrong((id *)&v20->_frameLatencyInterval, v84);
    v20->_swapID = objc_msgSend(v14, "signpostId");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SignpostFrameLifetimeInterval frameSeed](v20, "frameSeed"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", v76);
    v77 = objc_claimAutoreleasedReturnValue();
    skippedRenders = v20->_skippedRenders;
    v20->_skippedRenders = (NSArray *)v77;

LABEL_57:
    v72 = v20;
    goto LABEL_58;
  }
LABEL_4:
  v25 = objc_msgSend(v17, "frameSeed");
  if (v25 == -[SignpostFrameLifetimeInterval frameSeed](v20, "frameSeed"))
    goto LABEL_14;
  _signpost_debug_log();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    -[SignpostFrameLifetimeInterval initWithInterval:contextArray:hidLatencyInterval:renderInterval:frameLatencyInterval:frameSeedToSkippedRenderIntervals:].cold.7();
LABEL_52:

LABEL_53:
  v72 = 0;
LABEL_58:

  return v72;
}

- (unsigned)frameSeed
{
  return self->_frameSeed;
}

- (BOOL)renderIntervalIsLong
{
  void *v3;
  void *v4;
  BOOL v5;

  -[SignpostFrameLifetimeInterval renderInterval](self, "renderInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[SignpostFrameLifetimeInterval renderInterval](self, "renderInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SignpostFrameLifetimeInterval _isLongMCT:expectedFrameLatency:](self, "_isLongMCT:expectedFrameLatency:", objc_msgSend(v4, "durationMachContinuousTime"), 1);

  return v5;
}

- (BOOL)mayBeFirstFrame
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  void *v10;
  BOOL v11;

  v3 = -[SignpostAnimationSubInterval startMachContinuousTime](self, "startMachContinuousTime");
  if (v3 > -[SignpostFrameLifetimeInterval previousFramePresentationMCT](self, "previousFramePresentationMCT")
    || (v4 = -[SignpostFrameLifetimeInterval previousFramePresentationMCT](self, "previousFramePresentationMCT"),
        v5 = -[SignpostAnimationSubInterval startMachContinuousTime](self, "startMachContinuousTime"),
        v4 == v5)
    || (double)-[SignpostFrameLifetimeInterval displayRefreshIntervalDurationMachTime](self, "displayRefreshIntervalDurationMachTime")* 0.5 > (double)(v4 - v5))
  {
    -[SignpostFrameLifetimeInterval renderInterval](self, "renderInterval");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "startMachContinuousTime");
    v8 = -[SignpostFrameLifetimeInterval previousFramePresentationMCT](self, "previousFramePresentationMCT");

    if (v7 == v8)
    {
      v9 = 1;
    }
    else
    {
      -[SignpostFrameLifetimeInterval renderInterval](self, "renderInterval");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v7 - v8 < objc_msgSend(v10, "displayRefreshIntervalMachContinuousTime");

      v9 = !v11;
    }
  }
  else
  {
    v9 = 0;
  }
  return v9 & 1;
}

- (unint64_t)previousFramePresentationMCTForContributingPID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t i;
  unint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SignpostFrameLifetimeInterval pidToContextInfoArrayDict](self, "pidToContextInfoArrayDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v7);
          v13 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "previousPresentationMCT", (_QWORD)v15);
          if (v10 <= v13)
            v10 = v13;
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)inProcessAnimationDisplayTargetMCTForContributingPID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t i;
  unint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SignpostFrameLifetimeInterval pidToContextInfoArrayDict](self, "pidToContextInfoArrayDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v7);
          v13 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "inProcessAnimationDisplayTargetMCT", (_QWORD)v15);
          if (v10 <= v13)
            v10 = v13;
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unsigned)_displayID
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;

  -[SignpostFrameLifetimeInterval renderInterval](self, "renderInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SignpostFrameLifetimeInterval renderInterval](self, "renderInterval");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "displayID");
  }
  else
  {
    -[SignpostFrameLifetimeInterval skippedRenders](self, "skippedRenders");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      return -1;
    -[SignpostFrameLifetimeInterval skippedRenders](self, "skippedRenders");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "displayID");

  }
  return v5;
}

- (BOOL)_hasDisplayID
{
  void *v3;
  BOOL v4;
  void *v5;

  -[SignpostFrameLifetimeInterval renderInterval](self, "renderInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[SignpostFrameLifetimeInterval skippedRenders](self, "skippedRenders");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (NSNumber)displayIDNum
{
  void *v3;

  if (-[SignpostFrameLifetimeInterval _hasDisplayID](self, "_hasDisplayID"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SignpostFrameLifetimeInterval _displayID](self, "_displayID"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSNumber *)v3;
}

- (unint64_t)missedVBLCount
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[SignpostAnimationSubInterval durationMachContinuousTime](self, "durationMachContinuousTime");
  v4 = v3
     / -[SignpostFrameLifetimeInterval displayRefreshIntervalDurationMachTime](self, "displayRefreshIntervalDurationMachTime");
  if (v4 >= -[SignpostFrameLifetimeInterval bufferCount](self, "bufferCount"))
    return v4 - -[SignpostFrameLifetimeInterval bufferCount](self, "bufferCount") + 1;
  else
    return 0;
}

- (unint64_t)_overrunBeginMCT
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[SignpostFrameLifetimeInterval bufferCount](self, "bufferCount");
  v4 = -[SignpostFrameLifetimeInterval displayRefreshIntervalDurationMachTime](self, "displayRefreshIntervalDurationMachTime")* v3;
  if (-[SignpostAnimationSubInterval durationMachContinuousTime](self, "durationMachContinuousTime") <= v4)
    return 0;
  v5 = v4 - -[SignpostAnimationSubInterval durationMachContinuousTime](self, "durationMachContinuousTime");
  return v5 + -[SignpostAnimationSubInterval endMachContinuousTime](self, "endMachContinuousTime");
}

- (id)_glitchIntervalWithRoundingUp:(BOOL)a3 previousMCT:(unint64_t)a4
{
  _BOOL4 v5;
  unint64_t v7;
  SignpostFrameOverrunInterval *v8;
  SignpostFrameOverrunInterval *v9;
  unint64_t v10;
  SignpostFrameOverrunInterval *v11;
  unint64_t v12;
  SignpostFrameOverrunInterval *v13;
  unint64_t v14;

  if (a4)
  {
    v5 = a3;
    v7 = -[SignpostFrameLifetimeInterval displayRefreshIntervalDurationMachTime](self, "displayRefreshIntervalDurationMachTime");
    v8 = -[SignpostFrameLifetimeInterval _overrunBeginMCT](self, "_overrunBeginMCT");
    if (v8)
    {
      v9 = v8;
      v10 = v7 + a4;
      if ((unint64_t)v8 <= v7 + a4)
        v11 = (SignpostFrameOverrunInterval *)(v7 + a4);
      else
        v11 = v8;
      if (!v5
        || -[SignpostFrameLifetimeInterval mayBeFirstFrame](self, "mayBeFirstFrame")
        || v11 == (SignpostFrameOverrunInterval *)-[SignpostAnimationSubInterval endMachContinuousTime](self, "endMachContinuousTime"))
      {
        v12 = (unint64_t)v11;
      }
      else
      {
        v12 = (unint64_t)v11;
        if (v10 < (unint64_t)v9)
        {
          v12 = v10;
          if (v10 <= (unint64_t)v11 - v7)
          {
            v12 = -[SignpostAnimationSubInterval endMachContinuousTime](self, "endMachContinuousTime");
            do
              v12 -= v7;
            while (v12 > (unint64_t)v11);
          }
        }
      }
      if (v12 < -[SignpostAnimationSubInterval endMachContinuousTime](self, "endMachContinuousTime")
        && (double)v7 * 0.9 <= (double)(-[SignpostAnimationSubInterval endMachContinuousTime](self, "endMachContinuousTime")- v12))
      {
        v13 = [SignpostFrameOverrunInterval alloc];
        v14 = -[SignpostAnimationSubInterval endMachContinuousTime](self, "endMachContinuousTime");
        -[SignpostAnimationSubInterval timebaseRatio](self, "timebaseRatio");
        v8 = -[SignpostFrameOverrunInterval initWithStartMCT:endMCT:timebaseRatio:class:](v13, "initWithStartMCT:endMCT:timebaseRatio:class:", v12, v14, 0);
      }
      else
      {
        v8 = 0;
      }
    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_inProcessGlitchIntervalWithRoundingUp:(BOOL)a3 targetMCT:(unint64_t)a4 previousMCT:(unint64_t)a5
{
  SignpostFrameOverrunInterval *v6;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  NSObject *v14;
  unint64_t v15;
  SignpostFrameOverrunInterval *v17;
  unint64_t v18;

  v6 = 0;
  if (a4 && a5)
  {
    v9 = -[SignpostFrameLifetimeInterval displayRefreshIntervalDurationMachTime](self, "displayRefreshIntervalDurationMachTime", a3);
    v10 = a4 + (-[SignpostFrameLifetimeInterval bufferCount](self, "bufferCount") - 1) * v9;
    v11 = (unint64_t)((double)v9 * 0.2);
    if (v10 + v11 >= -[SignpostAnimationSubInterval endMachContinuousTime](self, "endMachContinuousTime"))
      goto LABEL_12;
    v12 = v9 + a5 <= v10 ? v10 : v9 + a5;
    if (v12 + v11 >= -[SignpostAnimationSubInterval endMachContinuousTime](self, "endMachContinuousTime"))
      goto LABEL_12;
    v13 = -[SignpostAnimationSubInterval startMachContinuousTime](self, "startMachContinuousTime");
    if (v12 >= v13 + v9 * -[SignpostFrameLifetimeInterval bufferCount](self, "bufferCount"))
      goto LABEL_14;
    _signpost_debug_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[SignpostFrameLifetimeInterval _inProcessGlitchIntervalWithRoundingUp:targetMCT:previousMCT:].cold.1(self);

    v15 = -[SignpostAnimationSubInterval startMachContinuousTime](self, "startMachContinuousTime");
    v12 = v15 + v9 * -[SignpostFrameLifetimeInterval bufferCount](self, "bufferCount");
    if ((double)-[SignpostAnimationSubInterval endMachContinuousTime](self, "endMachContinuousTime")
       + (double)v9 * -0.8 >= (double)v12)
    {
LABEL_14:
      v17 = [SignpostFrameOverrunInterval alloc];
      v18 = -[SignpostAnimationSubInterval endMachContinuousTime](self, "endMachContinuousTime");
      -[SignpostAnimationSubInterval timebaseRatio](self, "timebaseRatio");
      v6 = -[SignpostFrameOverrunInterval initWithStartMCT:endMCT:timebaseRatio:class:](v17, "initWithStartMCT:endMCT:timebaseRatio:class:", v12, v18, 8);
    }
    else
    {
LABEL_12:
      v6 = 0;
    }
  }
  return v6;
}

- (SignpostFrameOverrunInterval)frameOverrunInterval
{
  return (SignpostFrameOverrunInterval *)-[SignpostFrameLifetimeInterval overrunIntervalOfType:contributingPID:](self, "overrunIntervalOfType:contributingPID:", 0, 0);
}

- (SignpostFrameOverrunInterval)frameOverrunInactiveDisplayInterval
{
  return (SignpostFrameOverrunInterval *)-[SignpostFrameLifetimeInterval overrunIntervalOfType:contributingPID:](self, "overrunIntervalOfType:contributingPID:", 1, 0);
}

- (SignpostFrameOverrunInterval)userVisibleGlitchInterval
{
  return (SignpostFrameOverrunInterval *)-[SignpostFrameLifetimeInterval overrunIntervalOfType:contributingPID:](self, "overrunIntervalOfType:contributingPID:", 2, 0);
}

- (SignpostFrameOverrunInterval)discrepancyFrameOverrunInactiveDisplayInterval
{
  return (SignpostFrameOverrunInterval *)-[SignpostFrameLifetimeInterval overrunIntervalOfType:overrunClass:maybeFirstFrame:contributingPID:](self, "overrunIntervalOfType:overrunClass:maybeFirstFrame:contributingPID:", 1, 8, -[SignpostFrameLifetimeInterval mayBeFirstFrame](self, "mayBeFirstFrame"), 0);
}

- (id)overrunIntervalOfType:(unint64_t)a3 contributingPID:(id)a4
{
  uint64_t v6;
  id v7;
  void *v8;

  if (a4)
    v6 = 18;
  else
    v6 = 10;
  v7 = a4;
  -[SignpostFrameLifetimeInterval overrunIntervalOfType:overrunClass:maybeFirstFrame:contributingPID:](self, "overrunIntervalOfType:overrunClass:maybeFirstFrame:contributingPID:", a3, v6, -[SignpostFrameLifetimeInterval mayBeFirstFrame](self, "mayBeFirstFrame"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)overrunIntervalOfType:(unint64_t)a3 overrunClass:(unint64_t)a4 maybeFirstFrame:(BOOL)a5 contributingPID:(id)a6
{
  _BOOL4 v6;
  char v7;
  id v10;
  void *v11;
  int v12;
  _BOOL8 v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  SignpostFrameOverrunInterval *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  NSObject *v28;
  double v29;

  v6 = a5;
  v7 = a4;
  v10 = a6;
  if (!v10
    || (-[SignpostFrameLifetimeInterval contributingPIDs](self, "contributingPIDs"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "containsObject:", v10),
        v11,
        v12))
  {
    v13 = a3 == 2;
    v14 = -[SignpostFrameLifetimeInterval frameStallSkipRequest](self, "frameStallSkipRequest");
    if ((v7 & 4) == 0 && v14)
    {
      _signpost_debug_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[SignpostFrameLifetimeInterval overrunIntervalOfType:overrunClass:maybeFirstFrame:contributingPID:].cold.1(self);
      v16 = 0;
      goto LABEL_49;
    }
    if (v10)
    {
      v17 = -[SignpostFrameLifetimeInterval previousFramePresentationMCTForContributingPID:](self, "previousFramePresentationMCTForContributingPID:", v10);
      if (!v17)
        v17 = -[SignpostFrameLifetimeInterval previousFramePresentationMCT](self, "previousFramePresentationMCT");
      v18 = v17;
      if ((v7 & 8) != 0)
      {
        v19 = -[SignpostFrameLifetimeInterval inProcessAnimationDisplayTargetMCTForContributingPID:](self, "inProcessAnimationDisplayTargetMCTForContributingPID:", v10);
        if (v19)
          goto LABEL_19;
        goto LABEL_18;
      }
    }
    else
    {
      v18 = -[SignpostFrameLifetimeInterval previousFramePresentationMCT](self, "previousFramePresentationMCT");
      if ((v7 & 8) != 0)
      {
LABEL_18:
        v19 = -[SignpostFrameLifetimeInterval inProcessAnimationDisplayTargetMCT](self, "inProcessAnimationDisplayTargetMCT");
LABEL_19:
        -[SignpostFrameLifetimeInterval _inProcessGlitchIntervalWithRoundingUp:targetMCT:previousMCT:](self, "_inProcessGlitchIntervalWithRoundingUp:targetMCT:previousMCT:", a3 == 2, v19, v18);
        v15 = objc_claimAutoreleasedReturnValue();
        if ((v7 & 1) != 0)
          goto LABEL_21;
        goto LABEL_20;
      }
    }
    v15 = 0;
    if ((v7 & 1) != 0)
      goto LABEL_21;
LABEL_20:
    if (v6)
    {
LABEL_24:
      v16 = 0;
      goto LABEL_32;
    }
LABEL_21:
    if ((v7 & 0x10) == 0 && (v7 & 2) == 0 && !v6)
      goto LABEL_24;
    if (a3 == 1)
    {
      v13 = 0;
    }
    else if (!a3)
    {
      v16 = -[SignpostFrameLifetimeInterval _overrunBeginMCT](self, "_overrunBeginMCT");
      if (!v16)
        goto LABEL_32;
      v20 = [SignpostFrameOverrunInterval alloc];
      v21 = -[SignpostAnimationSubInterval endMachContinuousTime](self, "endMachContinuousTime");
      -[SignpostAnimationSubInterval timebaseRatio](self, "timebaseRatio");
      v22 = -[SignpostFrameOverrunInterval initWithStartMCT:endMCT:timebaseRatio:class:](v20, "initWithStartMCT:endMCT:timebaseRatio:class:", v16, v21, 0);
LABEL_31:
      v16 = (void *)v22;
LABEL_32:
      v23 = objc_msgSend(v16, "overrunClass");
      v24 = -[NSObject overrunClass](v15, "overrunClass");
      v25 = 1;
      if (!v6)
        v25 = 2;
      v26 = v23 | v24 | v25;
      if (-[SignpostFrameLifetimeInterval frameStallSkipRequest](self, "frameStallSkipRequest"))
        v26 |= 4uLL;
      v27 = objc_msgSend(v16, "durationMachContinuousTime");
      if (v27 < -[NSObject durationMachContinuousTime](v15, "durationMachContinuousTime"))
      {
        v28 = v15;

        v16 = v28;
      }
      if (v6)
        goto LABEL_48;
      if (-[SignpostFrameLifetimeInterval bufferCount](self, "bufferCount") == 2
        && -[SignpostFrameLifetimeInterval previousFrameBufferCount](self, "previousFrameBufferCount") == 3
        && (v26 & 2) != 0)
      {
        v29 = (double)(unint64_t)objc_msgSend(v16, "durationMachContinuousTime");
        if ((double)-[SignpostFrameLifetimeInterval displayRefreshIntervalDurationMachTime](self, "displayRefreshIntervalDurationMachTime")* 1.1 < v29)
        {
LABEL_48:
          objc_msgSend(v16, "setOverrunType:", a3);
          objc_msgSend(v16, "setOverrunClass:", v26);
LABEL_49:

          goto LABEL_50;
        }
        if ((v7 & 0x10) != 0)
        {
          v26 |= 0x10uLL;
          goto LABEL_48;
        }
      }
      else if ((v7 & 2) != 0 || v15)
      {
        goto LABEL_48;
      }

      v16 = 0;
      goto LABEL_48;
    }
    -[SignpostFrameLifetimeInterval _glitchIntervalWithRoundingUp:previousMCT:](self, "_glitchIntervalWithRoundingUp:previousMCT:", v13, v18);
    v22 = objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
  v16 = 0;
LABEL_50:

  return v16;
}

- (SignpostSupportTimeInterval)previousFrameOnScreenInterval
{
  SignpostAnimationSubInterval *v3;
  SignpostAnimationSubInterval *v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[SignpostFrameLifetimeInterval previousFramePresentationMCT](self, "previousFramePresentationMCT");
  if (v3)
  {
    v4 = [SignpostAnimationSubInterval alloc];
    v5 = -[SignpostFrameLifetimeInterval previousFramePresentationMCT](self, "previousFramePresentationMCT");
    v6 = -[SignpostAnimationSubInterval endMachContinuousTime](self, "endMachContinuousTime");
    -[SignpostAnimationSubInterval timebaseRatio](self, "timebaseRatio");
    v3 = -[SignpostAnimationSubInterval initWithStartMCT:endMCT:timebaseRatio:](v4, "initWithStartMCT:endMCT:timebaseRatio:", v5, v6);
  }
  return (SignpostSupportTimeInterval *)v3;
}

- (id)pidToContextIDtoContextFrameLifetimeDict
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  SignpostFrameLifetimeInterval *v14;
  id v15;

  -[SignpostFrameLifetimeInterval pidToContextInfoArrayDict](self, "pidToContextInfoArrayDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostFrameLifetimeInterval pidToContextInfoArrayDict](self, "pidToContextInfoArrayDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __73__SignpostFrameLifetimeInterval_pidToContextIDtoContextFrameLifetimeDict__block_invoke;
  v13 = &unk_1E4600FB8;
  v14 = self;
  v7 = v5;
  v15 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &v10);

  if (objc_msgSend(v7, "count", v10, v11, v12, v13, v14))
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

void __73__SignpostFrameLifetimeInterval_pidToContextIDtoContextFrameLifetimeDict__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  SignpostContextFrameLifetime *v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v16 = v6;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          v14 = -[SignpostContextFrameLifetime initWithFrameLifetime:contextInfo:]([SignpostContextFrameLifetime alloc], "initWithFrameLifetime:contextInfo:", *(_QWORD *)(a1 + 32), v13);
          if (v14)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v13, "contextId"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v15);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

    if (objc_msgSend(v7, "count"))
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v5);

    v6 = v16;
  }

}

- (unsigned)swapID
{
  return self->_swapID;
}

- (unsigned)previousFrameBufferCount
{
  return self->_previousFrameBufferCount;
}

- (void)setPreviousFrameBufferCount:(unsigned __int8)a3
{
  self->_previousFrameBufferCount = a3;
}

- (BOOL)frameStallSkipRequest
{
  return self->_frameStallSkipRequest;
}

- (unint64_t)previousFramePresentationMCT
{
  return self->_previousFramePresentationMCT;
}

- (SignpostRenderServerRenderInterval)renderInterval
{
  return self->_renderInterval;
}

- (NSArray)skippedRenders
{
  return self->_skippedRenders;
}

- (BOOL)lifetimeIsLong
{
  return self->_lifetimeIsLong;
}

- (void)setLifetimeIsLong:(BOOL)a3
{
  self->_lifetimeIsLong = a3;
}

- (SignpostContextInfo)earliestTimeContextInfo
{
  return self->_earliestTimeContextInfo;
}

- (SignpostContextInfo)contextInfoForHIDInput
{
  return self->_contextInfoForHIDInput;
}

- (NSArray)commits
{
  return self->_commits;
}

- (void)setCommits:(id)a3
{
  objc_storeStrong((id *)&self->_commits, a3);
}

- (unint64_t)inProcessAnimationDisplayTargetMCT
{
  return self->_inProcessAnimationDisplayTargetMCT;
}

- (void)initWithInterval:(uint64_t)a3 contextArray:(uint64_t)a4 hidLatencyInterval:(uint64_t)a5 renderInterval:(uint64_t)a6 frameLatencyInterval:(uint64_t)a7 frameSeedToSkippedRenderIntervals:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A1A28000, a1, a3, "Could not find frame_seed in %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithInterval:(uint64_t)a3 contextArray:(uint64_t)a4 hidLatencyInterval:(uint64_t)a5 renderInterval:(uint64_t)a6 frameLatencyInterval:(uint64_t)a7 frameSeedToSkippedRenderIntervals:(uint64_t)a8 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A1A28000, a1, a3, "Could not find buffer_count in %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithInterval:(uint64_t)a3 contextArray:(uint64_t)a4 hidLatencyInterval:(uint64_t)a5 renderInterval:(uint64_t)a6 frameLatencyInterval:(uint64_t)a7 frameSeedToSkippedRenderIntervals:(uint64_t)a8 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A1A28000, a1, a3, "Could not find refresh_interval in %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithInterval:contextArray:hidLatencyInterval:renderInterval:frameLatencyInterval:frameSeedToSkippedRenderIntervals:.cold.4()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_8(v0, v1);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1A1A28000, v2, v3, "ContextInfo frame seed mismatch: %#x vs %#x", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_4();
}

- (void)initWithInterval:contextArray:hidLatencyInterval:renderInterval:frameLatencyInterval:frameSeedToSkippedRenderIntervals:.cold.5()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_8(v0, v1);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1A1A28000, v2, v3, "HIDLatency frame seed mismatch: %#x vs %#x", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_4();
}

- (void)initWithInterval:contextArray:hidLatencyInterval:renderInterval:frameLatencyInterval:frameSeedToSkippedRenderIntervals:.cold.6()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_8(v0, v1);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1A1A28000, v2, v3, "FrameLatency frame seed mismatch: %#x vs %#x", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_4();
}

- (void)initWithInterval:contextArray:hidLatencyInterval:renderInterval:frameLatencyInterval:frameSeedToSkippedRenderIntervals:.cold.7()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_8(v0, v1);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1A1A28000, v2, v3, "RenderInterval frame seed mismatch: %#x vs %#x", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_4();
}

- (void)initWithInterval:(uint64_t)a3 contextArray:(uint64_t)a4 renderInterval:(uint64_t)a5 frameSeedToSkippedRenderIntervals:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A1A28000, a1, a3, "Could not find frame_seed in %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithInterval:(uint64_t)a3 contextArray:(uint64_t)a4 renderInterval:(uint64_t)a5 frameSeedToSkippedRenderIntervals:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1A1A28000, a1, a3, "Could not infer frame latency", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

- (void)_inProcessGlitchIntervalWithRoundingUp:(void *)a1 targetMCT:previousMCT:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "swapID");
  OUTLINED_FUNCTION_7(&dword_1A1A28000, v1, v2, "Discrepancy glitch begin before long_frame start for [SwapID: 0x%x]", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)overrunIntervalOfType:(void *)a1 overrunClass:maybeFirstFrame:contributingPID:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "swapID");
  OUTLINED_FUNCTION_7(&dword_1A1A28000, v1, v2, "frameStallSkipRequest for Swap ID: 0x%x", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
