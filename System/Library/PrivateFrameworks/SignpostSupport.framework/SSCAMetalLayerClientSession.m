@implementation SSCAMetalLayerClientSession

- (double)startSeconds
{
  unint64_t v3;
  double v4;

  v3 = -[SSCAMetalLayerClientSession startMachContinuousTime](self, "startMachContinuousTime");
  -[SSCAMetalLayerClientSession timebaseRatio](self, "timebaseRatio");
  return v4 * (double)v3 / 1000000000.0;
}

- (double)endSeconds
{
  unint64_t v3;
  double v4;

  v3 = -[SSCAMetalLayerClientSession endMachContinuousTime](self, "endMachContinuousTime");
  -[SSCAMetalLayerClientSession timebaseRatio](self, "timebaseRatio");
  return v4 * (double)v3 / 1000000000.0;
}

- (unint64_t)durationMachContinuousTime
{
  unint64_t v3;

  v3 = -[SSCAMetalLayerClientSession endMachContinuousTime](self, "endMachContinuousTime");
  return v3 - -[SSCAMetalLayerClientSession startMachContinuousTime](self, "startMachContinuousTime");
}

- (float)durationSeconds
{
  double v3;
  double v4;
  double v5;

  -[SSCAMetalLayerClientSession endSeconds](self, "endSeconds");
  v4 = v3;
  -[SSCAMetalLayerClientSession startSeconds](self, "startSeconds");
  return v4 - v5;
}

- (unint64_t)startNanoseconds
{
  double v2;

  -[SSCAMetalLayerClientSession startSeconds](self, "startSeconds");
  return (unint64_t)(v2 * 1000000000.0);
}

- (unint64_t)endNanoseconds
{
  double v2;

  -[SSCAMetalLayerClientSession endSeconds](self, "endSeconds");
  return (unint64_t)(v2 * 1000000000.0);
}

- (unint64_t)durationNanoseconds
{
  float v2;

  -[SSCAMetalLayerClientSession durationSeconds](self, "durationSeconds");
  return (unint64_t)(float)(v2 * 1000000000.0);
}

- (double)startMs
{
  double v2;

  -[SSCAMetalLayerClientSession startSeconds](self, "startSeconds");
  return v2 * 1000.0;
}

- (double)endMs
{
  double v2;

  -[SSCAMetalLayerClientSession endSeconds](self, "endSeconds");
  return v2 * 1000.0;
}

- (double)durationMs
{
  float v2;

  -[SSCAMetalLayerClientSession durationSeconds](self, "durationSeconds");
  return (float)(v2 * 1000.0);
}

- (SSCAMetalLayerClientSession)initWithPID:(int)a3 includeTimelines:(BOOL)a4 timebaseRatio:(double)a5
{
  SSCAMetalLayerClientSession *v8;
  SSCAMetalLayerClientSession *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *mutableLayerIDToLayerSession;
  NSMutableArray *v12;
  NSMutableArray *mutableResourceSnapshotTimeline;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SSCAMetalLayerClientSession;
  v8 = -[SSCAMetalLayerClientSession init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_processID = a3;
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    mutableLayerIDToLayerSession = v9->_mutableLayerIDToLayerSession;
    v9->_mutableLayerIDToLayerSession = v10;

    v9->_includeTimelines = a4;
    v9->_timebaseRatio = a5;
    if (-[SSCAMetalLayerClientSession includeTimelines](v9, "includeTimelines"))
    {
      v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      mutableResourceSnapshotTimeline = v9->_mutableResourceSnapshotTimeline;
      v9->_mutableResourceSnapshotTimeline = v12;

    }
  }
  return v9;
}

- (SSCAMetalLayerClientResourceUsageInterval)overallResourceUsageInterval
{
  SSCAMetalLayerClientResourceUsageInterval *v3;
  void *v4;
  void *v5;
  SSCAMetalLayerClientResourceUsageInterval *v6;

  v3 = [SSCAMetalLayerClientResourceUsageInterval alloc];
  -[SSCAMetalLayerClientSession earliestSnapshot](self, "earliestSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSCAMetalLayerClientSession latestSnapshot](self, "latestSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SSCAMetalLayerClientResourceUsageInterval initWithStartSnapshot:endSnapshot:](v3, "initWithStartSnapshot:endSnapshot:", v4, v5);

  return v6;
}

- (id)_metalLayerSessionForID:(unint64_t)a3 timebaseRatio:(double)a4
{
  void *v7;
  void *v8;
  SSCAMetalLayerSession *v9;
  void *v10;
  void *v11;

  -[SSCAMetalLayerClientSession mutableLayerIDToLayerSession](self, "mutableLayerIDToLayerSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (SSCAMetalLayerSession *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v9 = -[SSCAMetalLayerSession initWithID:includeTimelines:timebaseRatio:]([SSCAMetalLayerSession alloc], "initWithID:includeTimelines:timebaseRatio:", a3, -[SSCAMetalLayerClientSession includeTimelines](self, "includeTimelines"), a4);
    -[SSCAMetalLayerClientSession mutableLayerIDToLayerSession](self, "mutableLayerIDToLayerSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

  }
  return v9;
}

- (id)_dictionaryRepresentation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v3 = a3;
  v56 = *MEMORY[0x1E0C80C00];
  _timeIntervalDict(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SSCAMetalLayerClientSession processID](self, "processID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, kSSCAMetalLayerClientSessionKey_ProcessID);

  -[SSCAMetalLayerClientSession processName](self, "processName");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = CFSTR("Unknown");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, kSSCAMetalLayerClientSessionKey_ProcessName);

  -[SSCAMetalLayerClientSession bundleID](self, "bundleID");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = CFSTR("Unknown");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, kSSCAMetalLayerClientSessionKey_BundleID);

  -[SSCAMetalLayerClientSession bundleVersion](self, "bundleVersion");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (const __CFString *)v13;
  else
    v15 = CFSTR("Unknown");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, kSSCAMetalLayerClientSessionKey_BundleVersion);

  -[SSCAMetalLayerClientSession bundleShortVersion](self, "bundleShortVersion");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (const __CFString *)v16;
  else
    v18 = CFSTR("Unknown");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, kSSCAMetalLayerClientSessionKey_BundleShortVersion);

  -[SSCAMetalLayerClientSession gameSession](self, "gameSession");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[SSCAMetalLayerClientSession gameSession](self, "gameSession");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, kSSCAMetalLayerClientSessionKey_GameSession);

  }
  -[SSCAMetalLayerClientSession layerIDToLayerSession](self, "layerIDToLayerSession");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");

  if (v23)
  {
    v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    -[SSCAMetalLayerClientSession layerIDToLayerSession](self, "layerIDToLayerSession");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "allValues");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v51 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "_dictionaryRepresentation:", v3);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v31);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      }
      while (v28);
    }

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, kSSCAMetalLayerClientSessionKey_LayerSessions);
  }
  if (v3)
  {
    -[SSCAMetalLayerClientSession resourceSnapshotTimeline](self, "resourceSnapshotTimeline");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "count");

    if (v33)
    {
      -[SSCAMetalLayerClientSession resourceUsageIntervalTimeline](self, "resourceUsageIntervalTimeline");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v36 = v34;
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      if (v37)
      {
        v38 = v37;
        v39 = *(_QWORD *)v47;
        do
        {
          for (j = 0; j != v38; ++j)
          {
            if (*(_QWORD *)v47 != v39)
              objc_enumerationMutation(v36);
            objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v46);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "addObject:", v41);

          }
          v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
        }
        while (v38);
      }

      objc_msgSend(v5, "setObject:forKeyedSubscript:", v35, kSSCAMetalLayerClientSessionKey_ResourceUsageIntervals);
    }
  }
  -[SSCAMetalLayerClientSession overallResourceUsageInterval](self, "overallResourceUsageInterval", (_QWORD)v46);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v42;
  if (v42)
  {
    objc_msgSend(v42, "dictionaryRepresentation");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v44, kSSCAMetalLayerClientSessionKey_OverallResourceUsageInterval);

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  return -[SSCAMetalLayerClientSession _dictionaryRepresentation:](self, "_dictionaryRepresentation:", 1);
}

- (id)jsonDescription:(unint64_t)a3
{
  return SignpostJSONRepresentation(self, a3);
}

- (NSString)debugDescription
{
  return (NSString *)-[SSCAMetalLayerClientSession jsonDescription:](self, "jsonDescription:", 3);
}

- (NSDictionary)coreAnalyticsEvent
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  void *j;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  uint64_t v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  SSCAMetalLayerClientSession *v132;
  void *v133;
  uint64_t v134;
  void *v135;
  id obj;
  id obja;
  uint64_t v138;
  uint64_t v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  _BYTE v148[128];
  _BYTE v149[128];
  uint64_t v150;

  v150 = *MEMORY[0x1E0C80C00];
  -[SSCAMetalLayerClientSession processName](self, "processName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return (NSDictionary *)0;
  -[SSCAMetalLayerClientSession layerIDToLayerSession](self, "layerIDToLayerSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
    return (NSDictionary *)0;
  v146 = 0u;
  v147 = 0u;
  v144 = 0u;
  v145 = 0u;
  -[SSCAMetalLayerClientSession layerIDToLayerSession](self, "layerIDToLayerSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v7;
  v138 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v144, v149, 16);
  if (!v138)
  {
    v12 = 0;
    v11 = 0;
    v10 = 0;
    v32 = 0;
    goto LABEL_54;
  }
  v132 = self;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  obj = *(id *)v145;
  do
  {
    for (i = 0; i != v138; ++i)
    {
      if (*(id *)v145 != obj)
        objc_enumerationMutation(v8);
      v14 = *(void **)(*((_QWORD *)&v144 + 1) + 8 * i);
      objc_msgSend(v14, "totalSessionStats");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v14, "totalSessionStats");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "startDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
          goto LABEL_12;
        v18 = objc_msgSend(v11, "compare:", v17);

        if (v18 == 1)
        {
          objc_msgSend(v14, "totalSessionStats");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "startDate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
          v11 = v17;
        }
        objc_msgSend(v14, "totalSessionStats");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "endDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v21 = objc_msgSend(v10, "compare:", v20);

          if (v21 == -1)
          {
            objc_msgSend(v14, "totalSessionStats");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "endDate");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_16;
          }
        }
        else
        {
LABEL_16:

          v10 = v20;
        }
        objc_msgSend(v14, "totalSessionStats");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "presentedFrameStats");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "frameCount");

        if (v24)
        {
          v9 += v24;
          if (v12)
          {
            v134 = v9;
            v25 = v8;
            v26 = v10;
            v27 = v11;
            objc_msgSend(v12, "totalSessionStats");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "presentedFrameStats");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v12;
            v31 = objc_msgSend(v29, "frameCount");

            if (v31 >= v24)
            {
              v12 = v30;
            }
            else
            {
              v12 = v14;

            }
            v11 = v27;
            v10 = v26;
            v8 = v25;
            v9 = v134;
          }
          else
          {
            v12 = v14;
          }
        }
        continue;
      }
    }
    v138 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v144, v149, 16);
  }
  while (v138);

  v32 = 0;
  if (v11 && v10)
  {
    if (v12 && (v33 = v9, objc_msgSend(v12, "totalSessionStats"), (v34 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v35 = (void *)v34;
      v135 = v12;
      objc_msgSend(v12, "totalSessionStats");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "presentedFrameStats");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "frameCount");

      if (v38)
      {
        v32 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        -[SSCAMetalLayerClientSession processName](v132, "processName");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKeyedSubscript:", v39, kSSCAMetalLayerClientSessionCAKey_ProcessName);

        -[SSCAMetalLayerClientSession bundleID](v132, "bundleID");
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40)
        {
          -[SSCAMetalLayerClientSession bundleID](v132, "bundleID");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v41, kSSCAMetalLayerClientSessionCAKey_BundleID);

        }
        -[SSCAMetalLayerClientSession bundleVersion](v132, "bundleVersion");
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42)
        {
          -[SSCAMetalLayerClientSession bundleVersion](v132, "bundleVersion");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v43, kSSCAMetalLayerClientSessionCAKey_BundleVersion);

        }
        -[SSCAMetalLayerClientSession bundleShortVersion](v132, "bundleShortVersion");
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        if (v44)
        {
          -[SSCAMetalLayerClientSession bundleShortVersion](v132, "bundleShortVersion");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v45, kSSCAMetalLayerClientSessionCAKey_BundleShortVersion);

        }
        v46 = (void *)MEMORY[0x1E0CB37E8];
        -[SSCAMetalLayerClientSession layerIDToLayerSession](v132, "layerIDToLayerSession");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "numberWithUnsignedInteger:", objc_msgSend(v47, "count"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKeyedSubscript:", v48, kSSCAMetalLayerClientSessionCAKey_LifetimeActiveLayerCount);

        v49 = (void *)MEMORY[0x1E0CB37E8];
        v133 = v10;
        objc_msgSend(v10, "timeIntervalSinceDate:", v11);
        objc_msgSend(v49, "numberWithDouble:");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKeyedSubscript:", v50, kSSCAMetalLayerClientSessionCAKey_ClientLifetimeDurationSec);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v33);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKeyedSubscript:", v51, kSSCAMetalLayerClientSessionCAKey_TotalPresentedDrawablesCount);

        v142 = 0u;
        v143 = 0u;
        v140 = 0u;
        v141 = 0u;
        v52 = v135;
        objc_msgSend(v135, "configurationTimeline");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = (void *)objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v140, v148, 16);
        if (v54)
        {
          v131 = v32;
          v55 = 0;
          v56 = 0;
          v57 = 0;
          v58 = 0;
          v59 = 0;
          obja = v53;
          v139 = *(_QWORD *)v141;
          do
          {
            for (j = 0; j != v54; j = (char *)j + 1)
            {
              if (*(_QWORD *)v141 != v139)
                objc_enumerationMutation(obja);
              v61 = *(void **)(*((_QWORD *)&v140 + 1) + 8 * (_QWORD)j);
              objc_msgSend(v61, "layerName");
              v62 = (void *)objc_claimAutoreleasedReturnValue();

              if (v62)
              {
                objc_msgSend(v61, "layerName");
                v63 = objc_claimAutoreleasedReturnValue();

                v55 = (void *)v63;
              }
              objc_msgSend(v61, "heightPixels");
              v64 = (void *)objc_claimAutoreleasedReturnValue();

              if (v64)
              {
                objc_msgSend(v61, "heightPixels");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                v56 += objc_msgSend(v65, "unsignedLongLongValue");

                ++v57;
              }
              objc_msgSend(v61, "widthPixels");
              v66 = (void *)objc_claimAutoreleasedReturnValue();

              if (v66)
              {
                objc_msgSend(v61, "widthPixels");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                v58 += objc_msgSend(v67, "unsignedLongLongValue");

                ++v59;
              }
            }
            v54 = (void *)objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v140, v148, 16);
          }
          while (v54);

          if (v57)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v56 / v57);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v68 = 0;
          }
          if (v59)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v58 / v59);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v54 = 0;
          }
          v52 = v135;
          v32 = v131;
          if (v68)
          {
            objc_msgSend(v131, "setObject:forKeyedSubscript:", v68, kSSCAMetalLayerClientSessionCAKey_AverageHeightPixels);
            objc_msgSend(v131, "setObject:forKeyedSubscript:", v54, kSSCAMetalLayerClientSessionCAKey_AverageWidthPixels);
          }
          if (v55)
            objc_msgSend(v131, "setObject:forKeyedSubscript:", v55, kSSCAMetalLayerClientSessionCAKey_LayerName);
        }
        else
        {

          v68 = 0;
          v55 = 0;
        }

        objc_msgSend(v52, "totalSessionStats");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v8, "activeSeconds");
        objc_msgSend(v70, "numberWithDouble:");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKeyedSubscript:", v71, kSSCAMetalLayerClientSessionCAKey_ActiveDurationSeconds);

        v72 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v8, "presentedFrameStats");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "numberWithUnsignedLongLong:", objc_msgSend(v73, "frameCount"));
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKeyedSubscript:", v74, kSSCAMetalLayerClientSessionCAKey_PresentedFrameCount);

        v75 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v8, "presentedFrameStats");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "framesPerSecond");
        objc_msgSend(v75, "numberWithDouble:");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKeyedSubscript:", v77, kSSCAMetalLayerClientSessionCAKey_PresentedFramesPerSecond);

        v78 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v8, "presentedFrameStats");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "numberWithUnsignedLongLong:", objc_msgSend(v79, "commandBufferCount"));
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKeyedSubscript:", v80, kSSCAMetalLayerClientSessionCAKey_PresentedCommandBufferCount);

        objc_msgSend(v8, "skippedFrameStats");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = objc_msgSend(v81, "frameCount");

        if (v82)
        {
          v83 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v8, "skippedFrameStats");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "numberWithUnsignedLongLong:", objc_msgSend(v84, "frameCount"));
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v85, kSSCAMetalLayerClientSessionCAKey_SkippedFrameCount);

          v86 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v8, "skippedFrameStats");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "numberWithUnsignedLongLong:", objc_msgSend(v87, "commandBufferCount"));
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v88, kSSCAMetalLayerClientSessionCAKey_SkippedFrameCommandBufferCount);

        }
        v89 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v8, "presentedFrameStats");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "totalEndToEndWalltimeStats");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "totalMs");
        objc_msgSend(v89, "numberWithDouble:");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKeyedSubscript:", v92, kSSCAMetalLayerClientSessionCAKey_PresentedTotalEndToEndDrawableTotalMs);

        v93 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v8, "presentedFrameStats");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "cpuEndToEndWalltimeStats");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "totalMs");
        objc_msgSend(v93, "numberWithDouble:");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKeyedSubscript:", v96, kSSCAMetalLayerClientSessionCAKey_PresentedCPUEndToEndDrawableTotalMs);

        v97 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v8, "presentedFrameStats");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "gpuEndToEndWalltimeStats");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "totalMs");
        objc_msgSend(v97, "numberWithDouble:");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKeyedSubscript:", v100, kSSCAMetalLayerClientSessionCAKey_PresentedGPUEndToEndDrawableTotalMs);

        v101 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v8, "presentedFrameStats");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "onGPUWalltimeStats");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "totalMs");
        objc_msgSend(v101, "numberWithDouble:");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKeyedSubscript:", v104, kSSCAMetalLayerClientSessionCAKey_PresentedOnGPUTotalMs);

        v105 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v8, "frameOnGlassIntervalStats");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "numberWithUnsignedLongLong:", objc_msgSend(v106, "durationCount"));
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKeyedSubscript:", v107, kSSCAMetalLayerClientSessionCAKey_OnGlassIntervalCount);

        v108 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v8, "frameOnGlassIntervalStats");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "totalMs");
        objc_msgSend(v108, "numberWithDouble:");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKeyedSubscript:", v110, kSSCAMetalLayerClientSessionCAKey_OnGlassIntervalTotalMs);

        v111 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v8, "presentedFrameStats");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "gpuDoneToCompletedWalltimeStats");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "totalMs");
        objc_msgSend(v111, "numberWithDouble:");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKeyedSubscript:", v114, kSSCAMetalLayerClientSessionCAKey_PresentedGPUDoneToCompletedTotalMs);

        objc_msgSend(v8, "lateClientPresentStats");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        v116 = objc_msgSend(v115, "durationCount");

        if (v116)
        {
          v117 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v8, "lateClientPresentStats");
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v117, "numberWithUnsignedLongLong:", objc_msgSend(v118, "durationCount"));
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v119, kSSCAMetalLayerClientSessionCAKey_ClientPresentLatenessCount);

          v120 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v8, "lateClientPresentStats");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "totalMs");
          objc_msgSend(v120, "numberWithDouble:");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v122, kSSCAMetalLayerClientSessionCAKey_ClientPresentLatenessTotalMs);

        }
        objc_msgSend(v8, "lateOnGlassPresentStats");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        v124 = objc_msgSend(v123, "durationCount");

        v10 = v133;
        if (v124)
        {
          v125 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v8, "lateOnGlassPresentStats");
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v125, "numberWithUnsignedLongLong:", objc_msgSend(v126, "durationCount"));
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v127, kSSCAMetalLayerClientSessionCAKey_OnGlassPresentLatenessCount);

          v128 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v8, "lateOnGlassPresentStats");
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v129, "totalMs");
          objc_msgSend(v128, "numberWithDouble:");
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v130, kSSCAMetalLayerClientSessionCAKey_OnGlassPresentLatenessTotalMs);

        }
        v12 = v135;
LABEL_54:

      }
      else
      {
        v32 = 0;
        v12 = v135;
      }
    }
    else
    {
      v32 = 0;
    }
  }

  return (NSDictionary *)v32;
}

- (id)_clientSessionFromLayerSessionDict:(id)a3 filteredResourceUsageSnapshots:(id)a4
{
  id v7;
  id v8;
  SSCAMetalLayerClientSession *v9;
  uint64_t v10;
  id *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v9 = [SSCAMetalLayerClientSession alloc];
    v10 = -[SSCAMetalLayerClientSession processID](self, "processID");
    -[SSCAMetalLayerClientSession timebaseRatio](self, "timebaseRatio");
    v11 = -[SSCAMetalLayerClientSession initWithPID:includeTimelines:timebaseRatio:](v9, "initWithPID:includeTimelines:timebaseRatio:", v10, 1);
    objc_storeStrong(v11 + 8, a3);
    -[SSCAMetalLayerClientSession processName](self, "processName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setProcessName:", v12);

    objc_msgSend(v11, "setProcessID:", -[SSCAMetalLayerClientSession processID](self, "processID"));
    -[SSCAMetalLayerClientSession bundleID](self, "bundleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBundleID:", v13);

    -[SSCAMetalLayerClientSession bundleVersion](self, "bundleVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBundleVersion:", v14);

    -[SSCAMetalLayerClientSession bundleShortVersion](self, "bundleShortVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBundleShortVersion:", v15);

    objc_msgSend(v11, "setMutableResourceSnapshotTimeline:", v8);
    objc_msgSend(v8, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEarliestSnapshot:", v16);

    objc_msgSend(v8, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLatestSnapshot:", v17);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)clientSessionFilteredToStartDate:(id)a3 endDate:(id)a4 errorOut:(id *)a5
{
  id v8;
  id v9;
  unsigned int v10;
  SSCAMetalLayerClientSession *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  BOOL v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  BOOL v28;
  id v30;
  id v31;
  id obj;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v33 = v8;
  v10 = _dateRangeIntersectionWithValidation(self, v8, v9, a5);
  v11 = 0;
  if (v10 >= 2 && v10 != 6)
  {
    if (v10 == 3)
    {
      v11 = self;
    }
    else
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v43 = 0;
      v44 = &v43;
      v45 = 0x3032000000;
      v46 = __Block_byref_object_copy__3;
      v47 = __Block_byref_object_dispose__3;
      v48 = 0;
      -[SSCAMetalLayerClientSession layerIDToLayerSession](self, "layerIDToLayerSession");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __81__SSCAMetalLayerClientSession_clientSessionFilteredToStartDate_endDate_errorOut___block_invoke;
      v38[3] = &unk_1E4601790;
      v14 = v8;
      v39 = v14;
      v15 = v9;
      v40 = v15;
      v42 = &v43;
      v31 = v12;
      v41 = v31;
      objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v38);
      v30 = v9;

      v16 = (void *)v44[5];
      if (v16)
      {
        v11 = 0;
        if (a5)
          *a5 = objc_retainAutorelease(v16);
      }
      else
      {
        -[SSCAMetalLayerClientSession resourceSnapshotTimeline](self, "resourceSnapshotTimeline");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count") == 0;

        if (v18)
        {
          v19 = 0;
        }
        else
        {
          v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v36 = 0u;
          v37 = 0u;
          v34 = 0u;
          v35 = 0u;
          -[SSCAMetalLayerClientSession resourceSnapshotTimeline](self, "resourceSnapshotTimeline");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v49, 16);
          obj = v20;
          if (v21)
          {
            v22 = *(_QWORD *)v35;
            do
            {
              for (i = 0; i != v21; ++i)
              {
                if (*(_QWORD *)v35 != v22)
                  objc_enumerationMutation(obj);
                v24 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
                if (v14)
                {
                  objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "snapshotDate");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = objc_msgSend(v25, "compare:", v14) == -1;

                  if (v26)
                    continue;
                }
                if (v15)
                {
                  objc_msgSend(v24, "snapshotDate");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  v28 = objc_msgSend(v15, "compare:", v27) == -1;

                  if (v28)
                    goto LABEL_21;
                }
                objc_msgSend(v19, "addObject:", v24, v30);
              }
              v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v49, 16);
            }
            while (v21);
          }
LABEL_21:

        }
        if (!objc_msgSend(v19, "count", v30))
        {

          v19 = 0;
        }
        -[SSCAMetalLayerClientSession _clientSessionFromLayerSessionDict:filteredResourceUsageSnapshots:](self, "_clientSessionFromLayerSessionDict:filteredResourceUsageSnapshots:", v31, v19);
        v11 = (SSCAMetalLayerClientSession *)objc_claimAutoreleasedReturnValue();

      }
      _Block_object_dispose(&v43, 8);

      v9 = v30;
    }
  }

  return v11;
}

void __81__SSCAMetalLayerClientSession_clientSessionFilteredToStartDate_endDate_errorOut___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id obj;

  v7 = a2;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v10 + 40);
  objc_msgSend(a3, "layerSessionFilteredToStartDate:endDate:errorOut:", v8, v9, &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v10 + 40), obj);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    *a4 = 1;
  else
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v11, v7);

}

- (id)clientSessionFilteredToStartMCT:(unint64_t)a3 endMCT:(unint64_t)a4 errorOut:(id *)a5
{
  unsigned int v9;
  void *v10;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  BOOL v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  uint64_t *v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v9 = _mctIntersectionWithValidation(self, a3, a4, a5);
  v10 = 0;
  if (v9 >= 2 && v9 != 6)
  {
    if (v9 == 3)
      return self;
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__3;
    v37 = __Block_byref_object_dispose__3;
    v38 = 0;
    -[SSCAMetalLayerClientSession layerIDToLayerSession](self, "layerIDToLayerSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __79__SSCAMetalLayerClientSession_clientSessionFilteredToStartMCT_endMCT_errorOut___block_invoke;
    v28[3] = &unk_1E46017B8;
    v31 = a3;
    v32 = a4;
    v30 = &v33;
    v14 = v12;
    v29 = v14;
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v28);

    v15 = (void *)v34[5];
    if (v15)
    {
      v10 = 0;
      if (a5)
        *a5 = objc_retainAutorelease(v15);
    }
    else
    {
      -[SSCAMetalLayerClientSession resourceSnapshotTimeline](self, "resourceSnapshotTimeline");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count") == 0;

      if (v17)
      {
        v18 = 0;
      }
      else
      {
        v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        -[SSCAMetalLayerClientSession resourceSnapshotTimeline](self, "resourceSnapshotTimeline", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v39, 16);
        if (v20)
        {
          v21 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v25 != v21)
                objc_enumerationMutation(v19);
              v23 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
              if (objc_msgSend(v23, "snapshotMCT") >= a3)
              {
                if (objc_msgSend(v23, "snapshotMCT") > a4)
                  goto LABEL_19;
                objc_msgSend(v18, "addObject:", v23);
              }
            }
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v39, 16);
          }
          while (v20);
        }
LABEL_19:

      }
      if (!objc_msgSend(v18, "count"))
      {

        v18 = 0;
      }
      -[SSCAMetalLayerClientSession _clientSessionFromLayerSessionDict:filteredResourceUsageSnapshots:](self, "_clientSessionFromLayerSessionDict:filteredResourceUsageSnapshots:", v14, v18);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    _Block_object_dispose(&v33, 8);

  }
  return v10;
}

void __79__SSCAMetalLayerClientSession_clientSessionFilteredToStartMCT_endMCT_errorOut___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id obj;

  v7 = a2;
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 56);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v10 + 40);
  objc_msgSend(a3, "layerSessionFilteredToStartMCT:endMCT:errorOut:", v8, v9, &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v10 + 40), obj);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *a4 = 1;
  else
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, v7);

}

- (NSDate)startDate
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SSCAMetalLayerClientSession layerIDToLayerSession](self, "layerIDToLayerSession", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      v9 = v6;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "startDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        _getEarliestDate(v9, v10);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        ++v8;
        v9 = v6;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return (NSDate *)v6;
}

- (NSDate)endDate
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SSCAMetalLayerClientSession layerIDToLayerSession](self, "layerIDToLayerSession", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      v9 = v6;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "endDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        _getLatestDate(v9, v10);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        ++v8;
        v9 = v6;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return (NSDate *)v6;
}

- (unint64_t)startMachContinuousTime
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  unint64_t v9;
  unint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SSCAMetalLayerClientSession layerIDToLayerSession](self, "layerIDToLayerSession", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "startMachContinuousTime");
        if (v6 >= v9)
          v10 = v9;
        else
          v10 = v6;
        if (v6 + 1 >= 2)
          v6 = v10;
        else
          v6 = v9;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)endMachContinuousTime
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t i;
  unint64_t v9;
  unint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SSCAMetalLayerClientSession layerIDToLayerSession](self, "layerIDToLayerSession", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    v7 = -1;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "endMachContinuousTime");
        if (v7 <= v9)
          v10 = v9;
        else
          v10 = v7;
        if (v7 + 1 >= 2)
          v7 = v10;
        else
          v7 = v9;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (void)_handleResourceSnapshot:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SSCAMetalLayerClientSession earliestSnapshot](self, "earliestSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[SSCAMetalLayerClientSession setEarliestSnapshot:](self, "setEarliestSnapshot:", v6);
  -[SSCAMetalLayerClientSession setLatestSnapshot:](self, "setLatestSnapshot:", v6);
  if (-[SSCAMetalLayerClientSession includeTimelines](self, "includeTimelines"))
  {
    -[SSCAMetalLayerClientSession mutableResourceSnapshotTimeline](self, "mutableResourceSnapshotTimeline");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
}

- (NSArray)resourceUsageIntervalTimeline
{
  void *v3;
  unint64_t v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  SSCAMetalLayerClientResourceUsageInterval *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!-[SSCAMetalLayerClientSession includeTimelines](self, "includeTimelines"))
    return (NSArray *)0;
  -[SSCAMetalLayerClientSession resourceSnapshotTimeline](self, "resourceSnapshotTimeline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 < 2)
    return (NSArray *)0;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[SSCAMetalLayerClientSession mutableResourceSnapshotTimeline](self, "mutableResourceSnapshotTimeline", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      v13 = v10;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v12);
        if (v13)
        {
          v15 = -[SSCAMetalLayerClientResourceUsageInterval initWithStartSnapshot:endSnapshot:]([SSCAMetalLayerClientResourceUsageInterval alloc], "initWithStartSnapshot:endSnapshot:", v13, v14);
          if (v15)
            objc_msgSend(v6, "addObject:", v15);

        }
        v10 = v14;

        ++v12;
        v13 = v10;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);

  }
  if (objc_msgSend(v6, "count"))
    v16 = v6;
  else
    v16 = 0;

  return (NSArray *)v16;
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
  objc_storeStrong((id *)&self->_processName, a3);
}

- (int)processID
{
  return self->_processID;
}

- (void)setProcessID:(int)a3
{
  self->_processID = a3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
  objc_storeStrong((id *)&self->_bundleVersion, a3);
}

- (NSString)bundleShortVersion
{
  return self->_bundleShortVersion;
}

- (void)setBundleShortVersion:(id)a3
{
  objc_storeStrong((id *)&self->_bundleShortVersion, a3);
}

- (BOOL)includeTimelines
{
  return self->_includeTimelines;
}

- (NSMutableArray)mutableResourceSnapshotTimeline
{
  return self->_mutableResourceSnapshotTimeline;
}

- (void)setMutableResourceSnapshotTimeline:(id)a3
{
  objc_storeStrong((id *)&self->_mutableResourceSnapshotTimeline, a3);
}

- (SSGameSessionInterval)gameSession
{
  return self->_gameSession;
}

- (void)setGameSession:(id)a3
{
  objc_storeStrong((id *)&self->_gameSession, a3);
}

- (NSMutableDictionary)mutableLayerIDToLayerSession
{
  return self->_mutableLayerIDToLayerSession;
}

- (SSCAMetalLayerClientResourceUsageSnapshot)earliestSnapshot
{
  return self->_earliestSnapshot;
}

- (void)setEarliestSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_earliestSnapshot, a3);
}

- (SSCAMetalLayerClientResourceUsageSnapshot)latestSnapshot
{
  return self->_latestSnapshot;
}

- (void)setLatestSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_latestSnapshot, a3);
}

- (double)timebaseRatio
{
  return self->_timebaseRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestSnapshot, 0);
  objc_storeStrong((id *)&self->_earliestSnapshot, 0);
  objc_storeStrong((id *)&self->_mutableLayerIDToLayerSession, 0);
  objc_storeStrong((id *)&self->_gameSession, 0);
  objc_storeStrong((id *)&self->_mutableResourceSnapshotTimeline, 0);
  objc_storeStrong((id *)&self->_bundleShortVersion, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_processName, 0);
}

@end
