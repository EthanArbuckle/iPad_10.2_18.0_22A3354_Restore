@implementation SignpostAnimationInterval

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstFrameGraceTime, 0);
  objc_storeStrong((id *)&self->_longRenderServerRenders, 0);
  objc_storeStrong((id *)&self->_allRenderServerRenders, 0);
  objc_storeStrong((id *)&self->_longHIDLatencies, 0);
  objc_storeStrong((id *)&self->_allHIDLatencies, 0);
  objc_storeStrong((id *)&self->_longFrameLifetimes, 0);
  objc_storeStrong((id *)&self->_allFrameLifetimes, 0);
  objc_storeStrong((id *)&self->_longFrameLatencies, 0);
  objc_storeStrong((id *)&self->_allFrameLatencies, 0);
  objc_storeStrong((id *)&self->_longTransactionLifetimes, 0);
  objc_storeStrong((id *)&self->_allTransactionLifetimes, 0);
  objc_storeStrong((id *)&self->_compositeIntervals, 0);
  objc_storeStrong((id *)&self->_longSystemwideClientDrawables, 0);
  objc_storeStrong((id *)&self->_allSystemwideClientDrawables, 0);
  objc_storeStrong((id *)&self->_longClientDrawables, 0);
  objc_storeStrong((id *)&self->_allClientDrawables, 0);
  objc_storeStrong((id *)&self->_longSystemwideCommits, 0);
  objc_storeStrong((id *)&self->_allSystemwideCommits, 0);
  objc_storeStrong((id *)&self->_longCommits, 0);
  objc_storeStrong((id *)&self->_allCommits, 0);
}

- (SignpostAnimationInterval)initWithBeginEvent:(id)a3 endEvent:(id)a4 accumulatedState:(id)a5 firstFrameGraceTimeController:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  SignpostAnimationInterval *v23;
  SignpostAnimationInterval *v24;
  NSArray *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  char v29;
  NSArray *v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  NSArray *compositeIntervals;
  void *v38;
  uint64_t v39;
  NSArray *longCommits;
  void *v41;
  uint64_t v42;
  NSArray *allCommits;
  void *v44;
  uint64_t v45;
  NSArray *longSystemwideCommits;
  void *v47;
  uint64_t v48;
  NSArray *allSystemwideCommits;
  void *v50;
  uint64_t v51;
  NSArray *longClientDrawables;
  void *v53;
  uint64_t v54;
  NSArray *allClientDrawables;
  void *v56;
  uint64_t v57;
  NSArray *longSystemwideClientDrawables;
  void *v59;
  uint64_t v60;
  NSArray *allSystemwideClientDrawables;
  void *v62;
  uint64_t v63;
  NSArray *longTransactionLifetimes;
  void *v65;
  uint64_t v66;
  NSArray *allTransactionLifetimes;
  void *v68;
  uint64_t v69;
  NSArray *longFrameLatencies;
  void *v71;
  uint64_t v72;
  NSArray *allFrameLatencies;
  void *v74;
  uint64_t v75;
  NSArray *longHIDLatencies;
  void *v77;
  uint64_t v78;
  NSArray *allHIDLatencies;
  void *v80;
  uint64_t v81;
  NSArray *longRenderServerRenders;
  void *v83;
  uint64_t v84;
  NSArray *allRenderServerRenders;
  SignpostSupportAnimationGraceTime *firstFrameGraceTime;
  void *v87;
  void *v88;
  SignpostSupportAnimationGraceTime *v89;
  SignpostSupportAnimationGraceTime *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  SignpostSupportAnimationGraceTime *v95;
  void *v96;
  uint64_t v97;
  NSArray *longFrameLifetimes;
  void *v99;
  uint64_t v100;
  NSArray *allFrameLifetimes;
  uint64_t v103;
  id v104;
  id v105;
  void *v106;
  NSArray *obj;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  objc_super v112;
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_msgSend(v10, "_hasTotalSkyLightCompositeCount");
  if (v14 != objc_msgSend(v11, "_hasTotalSkyLightCompositeCount"))
  {
    _signpost_debug_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[SignpostAnimationInterval initWithBeginEvent:endEvent:accumulatedState:firstFrameGraceTimeController:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);

    v23 = 0;
    goto LABEL_32;
  }
  v112.receiver = self;
  v112.super_class = (Class)SignpostAnimationInterval;
  v24 = -[SignpostInterval initWithBeginEvent:endEvent:](&v112, sel_initWithBeginEvent_endEvent_, v10, v11);
  if (!v24)
    goto LABEL_31;
  if ((v14 & 1) != 0)
    goto LABEL_25;
  v105 = v13;
  v110 = 0u;
  v111 = 0u;
  v108 = 0u;
  v109 = 0u;
  objc_msgSend(v12, "compositorIntervals");
  v25 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v108, v113, 16);
  if (!v26)
    goto LABEL_24;
  v27 = v26;
  v106 = v10;
  obj = v25;
  v104 = v12;
  v28 = v11;
  v29 = 0;
  v30 = 0;
  v31 = *(_QWORD *)v109;
  do
  {
    for (i = 0; i != v27; ++i)
    {
      if (*(_QWORD *)v109 != v31)
        objc_enumerationMutation(obj);
      v33 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * i);
      v34 = objc_msgSend(v33, "startMachContinuousTime", v104);
      v35 = objc_msgSend(v33, "endMachContinuousTime");
      if ((v29 & 1) != 0)
      {
        if (v35 >= objc_msgSend(v28, "startMachContinuousTime"))
          goto LABEL_22;
        goto LABEL_18;
      }
      if (v34 >= objc_msgSend(v106, "startMachContinuousTime") && v35 < objc_msgSend(v28, "startMachContinuousTime"))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v36 = objc_claimAutoreleasedReturnValue();

        v30 = (NSArray *)v36;
LABEL_18:
        -[NSArray addObject:](v30, "addObject:", v33);
        v29 = 1;
        continue;
      }
      v29 = 0;
    }
    v27 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v108, v113, 16);
  }
  while (v27);
LABEL_22:

  v13 = v105;
  v10 = v106;
  v11 = v28;
  v12 = v104;
  if (v30)
  {
    compositeIntervals = v24->_compositeIntervals;
    v24->_compositeIntervals = v30;
    v25 = v30;

LABEL_24:
  }
LABEL_25:
  objc_msgSend(v12, "longCommitIntervals");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostSupportObject _containedObjectsFromArray:](v24, "_containedObjectsFromArray:", v38);
  v39 = objc_claimAutoreleasedReturnValue();
  longCommits = v24->_longCommits;
  v24->_longCommits = (NSArray *)v39;

  objc_msgSend(v12, "allCommitIntervals");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostSupportObject _containedObjectsFromArray:](v24, "_containedObjectsFromArray:", v41);
  v42 = objc_claimAutoreleasedReturnValue();
  allCommits = v24->_allCommits;
  v24->_allCommits = (NSArray *)v42;

  objc_msgSend(v12, "longSystemwideCommitIntervals");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostSupportObject _containedObjectsFromArray:](v24, "_containedObjectsFromArray:", v44);
  v45 = objc_claimAutoreleasedReturnValue();
  longSystemwideCommits = v24->_longSystemwideCommits;
  v24->_longSystemwideCommits = (NSArray *)v45;

  objc_msgSend(v12, "allSystemwideCommitIntervals");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostSupportObject _containedObjectsFromArray:](v24, "_containedObjectsFromArray:", v47);
  v48 = objc_claimAutoreleasedReturnValue();
  allSystemwideCommits = v24->_allSystemwideCommits;
  v24->_allSystemwideCommits = (NSArray *)v48;

  objc_msgSend(v12, "longClientDrawableIntervals");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostSupportObject _containedObjectsFromArray:](v24, "_containedObjectsFromArray:", v50);
  v51 = objc_claimAutoreleasedReturnValue();
  longClientDrawables = v24->_longClientDrawables;
  v24->_longClientDrawables = (NSArray *)v51;

  objc_msgSend(v12, "allClientDrawableIntervals");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostSupportObject _containedObjectsFromArray:](v24, "_containedObjectsFromArray:", v53);
  v54 = objc_claimAutoreleasedReturnValue();
  allClientDrawables = v24->_allClientDrawables;
  v24->_allClientDrawables = (NSArray *)v54;

  objc_msgSend(v12, "longSystemwideClientDrawableIntervals");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostSupportObject _containedObjectsFromArray:](v24, "_containedObjectsFromArray:", v56);
  v57 = objc_claimAutoreleasedReturnValue();
  longSystemwideClientDrawables = v24->_longSystemwideClientDrawables;
  v24->_longSystemwideClientDrawables = (NSArray *)v57;

  objc_msgSend(v12, "allSystemwideClientDrawableIntervals");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostSupportObject _containedObjectsFromArray:](v24, "_containedObjectsFromArray:", v59);
  v60 = objc_claimAutoreleasedReturnValue();
  allSystemwideClientDrawables = v24->_allSystemwideClientDrawables;
  v24->_allSystemwideClientDrawables = (NSArray *)v60;

  objc_msgSend(v12, "longTransactionLifetimes");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostSupportObject _containedObjectsFromArray:](v24, "_containedObjectsFromArray:", v62);
  v63 = objc_claimAutoreleasedReturnValue();
  longTransactionLifetimes = v24->_longTransactionLifetimes;
  v24->_longTransactionLifetimes = (NSArray *)v63;

  objc_msgSend(v12, "allTransactionLifetimes");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostSupportObject _containedObjectsFromArray:](v24, "_containedObjectsFromArray:", v65);
  v66 = objc_claimAutoreleasedReturnValue();
  allTransactionLifetimes = v24->_allTransactionLifetimes;
  v24->_allTransactionLifetimes = (NSArray *)v66;

  objc_msgSend(v12, "longFrameLatencies");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostSupportObject _containedObjectsFromArray:](v24, "_containedObjectsFromArray:", v68);
  v69 = objc_claimAutoreleasedReturnValue();
  longFrameLatencies = v24->_longFrameLatencies;
  v24->_longFrameLatencies = (NSArray *)v69;

  objc_msgSend(v12, "allFrameLatencies");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostSupportObject _containedObjectsFromArray:](v24, "_containedObjectsFromArray:", v71);
  v72 = objc_claimAutoreleasedReturnValue();
  allFrameLatencies = v24->_allFrameLatencies;
  v24->_allFrameLatencies = (NSArray *)v72;

  objc_msgSend(v12, "longHIDLatencies");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostSupportObject _containedObjectsFromArray:](v24, "_containedObjectsFromArray:", v74);
  v75 = objc_claimAutoreleasedReturnValue();
  longHIDLatencies = v24->_longHIDLatencies;
  v24->_longHIDLatencies = (NSArray *)v75;

  objc_msgSend(v12, "allHIDLatencies");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostSupportObject _containedObjectsFromArray:](v24, "_containedObjectsFromArray:", v77);
  v78 = objc_claimAutoreleasedReturnValue();
  allHIDLatencies = v24->_allHIDLatencies;
  v24->_allHIDLatencies = (NSArray *)v78;

  objc_msgSend(v12, "longRenders");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostSupportObject _containedObjectsFromArray:](v24, "_containedObjectsFromArray:", v80);
  v81 = objc_claimAutoreleasedReturnValue();
  longRenderServerRenders = v24->_longRenderServerRenders;
  v24->_longRenderServerRenders = (NSArray *)v81;

  objc_msgSend(v12, "allRenders");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostSupportObject _containedObjectsFromArray:](v24, "_containedObjectsFromArray:", v83);
  v84 = objc_claimAutoreleasedReturnValue();
  allRenderServerRenders = v24->_allRenderServerRenders;
  v24->_allRenderServerRenders = (NSArray *)v84;

  firstFrameGraceTime = v24->_firstFrameGraceTime;
  v24->_firstFrameGraceTime = 0;

  objc_msgSend(v10, "_numberArgumentWithName:", CFSTR("first_frame_grace_time_ms"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v87;
  if (v87)
  {
    v89 = -[SignpostSupportAnimationGraceTime initWithAnimationType:firstFrameGraceTimeMs:]([SignpostSupportAnimationGraceTime alloc], "initWithAnimationType:firstFrameGraceTimeMs:", 3, objc_msgSend(v87, "unsignedIntValue"));
    goto LABEL_27;
  }
  v103 = objc_msgSend(v10, "animationType");
  if (v103 == 1)
  {
    objc_msgSend(v13, "userInteractiveGraceTime");
    v89 = (SignpostSupportAnimationGraceTime *)objc_claimAutoreleasedReturnValue();
LABEL_27:
    v90 = v24->_firstFrameGraceTime;
    v24->_firstFrameGraceTime = v89;

  }
  else if (v103 == 2)
  {
    objc_msgSend(v13, "userInitiatedGraceTime");
    v89 = (SignpostSupportAnimationGraceTime *)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  if (!v24->_firstFrameGraceTime)
  {
    -[SignpostSupportObject subsystem](v24, "subsystem");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostSupportObject category](v24, "category");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostObject name](v24, "name");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "gracetimeForSubsystem:category:name:", v91, v92, v93);
    v94 = objc_claimAutoreleasedReturnValue();
    v95 = v24->_firstFrameGraceTime;
    v24->_firstFrameGraceTime = (SignpostSupportAnimationGraceTime *)v94;

  }
  objc_msgSend(v12, "longFrameLifetimes");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostSupportObject _containedObjectsFromArray:](v24, "_containedObjectsFromArray:", v96);
  v97 = objc_claimAutoreleasedReturnValue();
  longFrameLifetimes = v24->_longFrameLifetimes;
  v24->_longFrameLifetimes = (NSArray *)v97;

  objc_msgSend(v12, "allFrameLifetimes");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostSupportObject _containedObjectsFromArray:](v24, "_containedObjectsFromArray:", v99);
  v100 = objc_claimAutoreleasedReturnValue();
  allFrameLifetimes = v24->_allFrameLifetimes;
  v24->_allFrameLifetimes = (NSArray *)v100;

LABEL_31:
  self = v24;
  v23 = self;
LABEL_32:

  return v23;
}

- (NSArray)allFrameLatencies
{
  return self->_allFrameLatencies;
}

- (NSArray)allFrameLifetimes
{
  return self->_allFrameLifetimes;
}

- (NSArray)longFrameLifetimes
{
  return self->_longFrameLifetimes;
}

- (NSArray)longFrameLatencies
{
  return self->_longFrameLatencies;
}

+ (unint64_t)forcedGlitchTimeRatioAdjustedVersion
{
  return _forcedGlitchTimeRatioAdjustedVersion;
}

+ (void)setForcedGlitchTimeRatioAdjustedVersion:(unint64_t)a3
{
  _forcedGlitchTimeRatioAdjustedVersion = a3;
}

+ (unint64_t)effectiveGlitchTimeRatioAdjustedVersion
{
  unint64_t v2;
  NSObject *v3;

  v2 = objc_msgSend(a1, "forcedGlitchTimeRatioAdjustedVersion");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (effectiveGlitchTimeRatioAdjustedVersion_onceToken != -1)
      dispatch_once(&effectiveGlitchTimeRatioAdjustedVersion_onceToken, &__block_literal_global_2);
    v2 = effectiveGlitchTimeRatioAdjustedVersion_userDefaultsVersion;
  }
  if (v2 >= 4)
  {
    if (v2 != 0x7FFFFFFFFFFFFFFFLL)
    {
      _signpost_debug_log();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        +[SignpostAnimationInterval effectiveGlitchTimeRatioAdjustedVersion].cold.1(v2, v3);

    }
    return 3;
  }
  return v2;
}

void __68__SignpostAnimationInterval_effectiveGlitchTimeRatioAdjustedVersion__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("SignpostSupportOverrideDefaultGlitchTimeRatioAdjustedVersion"));
  v1 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    effectiveGlitchTimeRatioAdjustedVersion_userDefaultsVersion = objc_msgSend(v1, "unsignedIntegerValue");

}

- (id)_intervalTypeString
{
  return CFSTR("Animation");
}

- (id)_descriptionStringForColumn:(unint64_t)a3 timeFormat:(unint64_t)a4 asBegin:(BOOL)a5
{
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v13;
  float v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SignpostAnimationInterval;
  -[SignpostInterval _descriptionStringForColumn:timeFormat:asBegin:](&v19, sel__descriptionStringForColumn_timeFormat_asBegin_, a3, a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    switch(a3)
    {
      case 4uLL:
        if (a4 != 2)
        {
          if (a4 == 1)
          {
            v18 = (void *)MEMORY[0x1E0CB3940];
            -[SignpostAnimationInterval glitches](self, "glitches");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "stringWithFormat:", CFSTR("%llu"), SignpostSupportTotalDurationMachContinuousTimeForIntervals(v16));
            break;
          }
          if (a4)
            goto LABEL_13;
        }
        v15 = (void *)MEMORY[0x1E0CB3940];
        -[SignpostAnimationInterval glitches](self, "glitches");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("%.3fs"), (double)SignpostSupportTotalDurationNsForIntervals(v16) / 1000000000.0);
        break;
      case 3uLL:
        v17 = (void *)MEMORY[0x1E0CB3940];
        -[SignpostAnimationInterval glitches](self, "glitches");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v16, "count"));
        break;
      case 2uLL:
        v13 = (void *)MEMORY[0x1E0CB3940];
        -[SignpostAnimationInterval frameRate](self, "frameRate");
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%.1fFPS"), v14);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      default:
LABEL_13:
        v11 = 0;
        goto LABEL_4;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_4;
  }
  v10 = v8;
LABEL_3:
  v11 = v10;
LABEL_4:

  return v11;
}

- (id)_detailedFrameDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;

  -[SignpostAnimationInterval allFrameLatencies](self, "allFrameLatencies");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[SignpostAnimationInterval allFrameLatencies](self, "allFrameLatencies");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostAnimationInterval durationToFirstEndSeconds:](self, "durationToFirstEndSeconds:", v6);
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%.4fs\n"), v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = CFSTR("N/A");
  }
  -[SignpostAnimationInterval allContributedFrameLatencies](self, "allContributedFrameLatencies");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    -[SignpostAnimationInterval allContributedFrameLatencies](self, "allContributedFrameLatencies");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostAnimationInterval durationToFirstEndSeconds:](self, "durationToFirstEndSeconds:", v12);
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%.4fs\n"), v13);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = CFSTR("N/A");
    if (!v4)
    {
      v19 = 0;
      goto LABEL_8;
    }
  }
  v15 = (void *)MEMORY[0x1E0CB3940];
  -[SignpostAnimationInterval allFrameLatencies](self, "allFrameLatencies");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");
  -[SignpostAnimationInterval allContributedFrameLatencies](self, "allContributedFrameLatencies");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("Coincident frames: %lu frames\nTime to first coincident frame: %@\nKnown contributed frames: %lu frames\nTime to first known contributed frame: %@\n"), v17, v8, objc_msgSend(v18, "count"), v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v19;
}

- (id)_poorPerfFrameDescription
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;

  v54 = (void *)MEMORY[0x1E0CB3940];
  -[SignpostAnimationInterval longCommits](self, "longCommits");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v62, "count");
  -[SignpostAnimationInterval allCommits](self, "allCommits");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v61, "count");
  -[SignpostAnimationInterval longSystemwideCommits](self, "longSystemwideCommits");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v60, "count");
  -[SignpostAnimationInterval allSystemwideCommits](self, "allSystemwideCommits");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v59, "count");
  -[SignpostAnimationInterval longClientDrawables](self, "longClientDrawables");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v58, "count");
  -[SignpostAnimationInterval allClientDrawables](self, "allClientDrawables");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v57, "count");
  -[SignpostAnimationInterval longSystemwideClientDrawables](self, "longSystemwideClientDrawables");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v56, "count");
  -[SignpostAnimationInterval allSystemwideClientDrawables](self, "allSystemwideClientDrawables");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v55, "count");
  -[SignpostAnimationInterval longTransactionLifetimes](self, "longTransactionLifetimes");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v52, "count");
  -[SignpostAnimationInterval allTransactionLifetimes](self, "allTransactionLifetimes");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v50, "count");
  -[SignpostAnimationInterval longFrameLatencies](self, "longFrameLatencies");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v48, "count");
  -[SignpostAnimationInterval allFrameLatencies](self, "allFrameLatencies");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v46, "count");
  -[SignpostAnimationInterval longHIDLatencies](self, "longHIDLatencies");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v43, "count");
  -[SignpostAnimationInterval allHIDLatencies](self, "allHIDLatencies");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v41, "count");
  -[SignpostAnimationInterval longRenderServerRenders](self, "longRenderServerRenders");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v39, "count");
  -[SignpostAnimationInterval allRenderServerRenders](self, "allRenderServerRenders");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v37, "count");
  -[SignpostAnimationInterval longFrameLifetimes](self, "longFrameLifetimes");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v34, "count");
  -[SignpostAnimationInterval allFrameLifetimes](self, "allFrameLifetimes");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v32, "count");
  -[SignpostAnimationInterval longContributedFrameLifetimes](self, "longContributedFrameLifetimes");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v30, "count");
  -[SignpostAnimationInterval allContributedFrameLifetimes](self, "allContributedFrameLifetimes");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v27, "count");
  -[SignpostAnimationInterval glitches](self, "glitches");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v25, "count");
  -[SignpostAnimationInterval firstFrameGlitches](self, "firstFrameGlitches");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v23, "count");
  -[SignpostAnimationInterval nonFirstFrameGlitches](self, "nonFirstFrameGlitches");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  -[SignpostAnimationInterval contributedGlitches](self, "contributedGlitches");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  -[SignpostAnimationInterval contributedFirstFrameGlitches](self, "contributedFirstFrameGlitches");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  -[SignpostAnimationInterval contributedNonFirstFrameGlitches](self, "contributedNonFirstFrameGlitches");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  -[SignpostAnimationInterval glitchTimeRatioMsPerS](self, "glitchTimeRatioMsPerS");
  v13 = v12;
  -[SignpostAnimationInterval firstFrameGlitchTimeRatioMsPerS](self, "firstFrameGlitchTimeRatioMsPerS");
  v15 = v14;
  -[SignpostAnimationInterval nonFirstFrameGlitchTimeRatioMsPerS](self, "nonFirstFrameGlitchTimeRatioMsPerS");
  objc_msgSend(v54, "stringWithFormat:", CFSTR("Long commits: %lu long commit(s) out of %lu\nSystemwide Long commits: %lu systemwide long commit(s) out of %lu\nLong client drawables: %lu long client drawable(s) out of %lu\nSystemwide Long client drawables: %lu systemwide long client drawables(s) out of %lu\nLong Transaction Lifetimes: %lu long transaction lifetime(s) out of %lu\nLong Frame Latency Count: %lu late frame(s) a total of %lu\nLong HID Latency Count: %lu long HID interval(s) out of %lu\nLong CA Render Server Render Count: %lu render(s) out of %lu\nLong Frame Lifetime Count: %lu frame lifetime(s) out of %lu\nLong Contributed Frame Lifetime Count: %lu frame(s) out of %lu\nGlitch Count: %lu glitches (%lu first frame, %lu non-first frame)\nContributed Glitch Count: %lu glitches (%lu first frame, %lu non-first frame)\nGlitch Time Ratio: %.2f ms/s (%.2f ms/s first frame, %.2f ms/s non-first frame)\n"), v53, v51, v49, v47, v45, v44, v42, v40, v38, v36, v35, v33, v31, v29, v28, v26,
    v24,
    v22,
    v21,
    v20,
    v19,
    v3,
    v5,
    v7,
    v9,
    v11,
    v13,
    v15,
    v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (double)_timeRatioForTimeIntervalArray:(id)a3 applyPerceptionAdjustments:(unint64_t)a4
{
  id v6;
  double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  double v11;
  double v12;
  float v13;
  uint64_t v14;
  _QWORD v16[5];

  v6 = a3;
  v7 = 0.0;
  if (v6)
  {
    if (a4)
    {
      -[SignpostSupportObject timebaseRatio](self, "timebaseRatio");
      v9 = (unint64_t)(1500000000.0 / v8);
      v10 = -[SignpostInterval durationMachContinuousTime](self, "durationMachContinuousTime");
      if (v10 > v9)
        v9 = v10;
      if (v9)
      {
        -[SignpostSupportObject timebaseRatio](self, "timebaseRatio");
        v12 = v11;
        -[SignpostAnimationInterval _durationInSecondsFromDurationInMCT:timebaseRatio:](self, "_durationInSecondsFromDurationInMCT:timebaseRatio:", v9);
        if (v13 < 1.0)
          v9 = (unint64_t)(1000000000.0 / v12);
        if (a4 >= 2)
        {
          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __87__SignpostAnimationInterval__timeRatioForTimeIntervalArray_applyPerceptionAdjustments___block_invoke;
          v16[3] = &unk_1E4600FE0;
          v16[4] = self;
          v14 = SignpostSupportTotalDurationMachContinuousTimeForIntervalsWithAdjustments(v6, v16);
LABEL_12:
          v7 = (double)(unint64_t)v14 / (double)v9;
          goto LABEL_13;
        }
LABEL_11:
        v14 = SignpostSupportTotalDurationMachContinuousTimeForIntervals(v6);
        goto LABEL_12;
      }
    }
    else
    {
      v9 = -[SignpostInterval durationMachContinuousTime](self, "durationMachContinuousTime");
      if (v9)
        goto LABEL_11;
    }
  }
LABEL_13:

  return v7;
}

unint64_t __87__SignpostAnimationInterval__timeRatioForTimeIntervalArray_applyPerceptionAdjustments___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;

  v3 = a2;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v3, "startSeconds");
  v6 = v5;
  objc_msgSend(v3, "endSeconds");
  v8 = (v6 + v7) * 0.5;
  objc_msgSend(v4, "startSeconds");
  v10 = fmax(v8 - v9, 0.0);
  objc_msgSend(v4, "endSeconds");
  v12 = v11;

  v13 = fmax(v12 - v8, 0.0);
  if (v10 < v13)
    v13 = v10;
  if (v13 >= 0.175)
    v14 = 1.0;
  else
    v14 = v13 / 0.175;
  v15 = (unint64_t)(v14 * (double)(unint64_t)objc_msgSend(v3, "durationMachContinuousTime"));

  return v15;
}

+ (id)_unionRangesForAnimations:(id)a3
{
  id v3;
  void *v4;
  uint64_t i;
  void *v6;
  SignpostAnimationsUnionInterval *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  SignpostAnimationsUnionInterval *v18;
  NSRange v19;
  void *v20;
  id obj;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;
  NSRange v38;
  NSRange v39;
  NSRange v40;
  NSRange v41;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v3;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v25)
  {
    v23 = v4;
    v24 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (objc_msgSend(v4, "count"))
        {
          v26 = i;
          v29 = 0u;
          v30 = 0u;
          v27 = 0u;
          v28 = 0u;
          v7 = v4;
          v8 = -[SignpostAnimationsUnionInterval countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (v8)
          {
            v9 = v8;
            v10 = *(_QWORD *)v28;
            while (2)
            {
              for (j = 0; j != v9; ++j)
              {
                if (*(_QWORD *)v28 != v10)
                  objc_enumerationMutation(v7);
                v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
                v13 = objc_msgSend(v12, "animationTimeRange");
                v15 = v14;
                v16 = objc_msgSend(v6, "startMachContinuousTime");
                v17 = objc_msgSend(v6, "durationMachContinuousTime");
                v38.location = v13;
                v38.length = v15;
                v40.location = v16;
                v40.length = v17;
                if (NSIntersectionRange(v38, v40).length)
                {
                  v39.location = v13;
                  v39.length = v15;
                  v41.location = v16;
                  v41.length = v17;
                  v19 = NSUnionRange(v39, v41);
                  objc_msgSend(v12, "setAnimationTimeRange:", v19.location, v19.length);
                  objc_msgSend(v12, "animationIntervals");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "addObject:", v6);

                  goto LABEL_17;
                }
              }
              v9 = -[SignpostAnimationsUnionInterval countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
              if (v9)
                continue;
              break;
            }
          }

          v18 = -[SignpostAnimationsUnionInterval initWithAnimation:]([SignpostAnimationsUnionInterval alloc], "initWithAnimation:", v6);
          -[SignpostAnimationsUnionInterval addObject:](v7, "addObject:", v18);
          v7 = v18;
LABEL_17:
          v4 = v23;
          i = v26;
        }
        else
        {
          v7 = -[SignpostAnimationsUnionInterval initWithAnimation:]([SignpostAnimationsUnionInterval alloc], "initWithAnimation:", v6);
          objc_msgSend(v4, "addObject:", v7);
        }

      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v25);
  }

  return v4;
}

- (float)_durationInSecondsFromDurationInMCT:(unint64_t)a3 timebaseRatio:(double)a4
{
  return (float)(unint64_t)((double)a3 * a4) / 1000000000.0;
}

+ (id)unionOfAnimationIntervals:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  SignpostAnimationInterval *v12;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") > 1)
  {
    objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_516);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    if (objc_msgSend(v6, "count") != 1)
    {
      v7 = 0;
      do
      {
        objc_msgSend(v6, "objectAtIndex:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndex:", v7 + 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "startMachContinuousTime");
        if (v10 >= objc_msgSend(v8, "endMachContinuousTime"))
        {
          ++v7;
        }
        else
        {
          v11 = objc_msgSend(v9, "endMachContinuousTime");
          if (v11 <= objc_msgSend(v8, "endMachContinuousTime"))
          {
            objc_msgSend(v6, "removeObjectAtIndex:", v7 + 1);
          }
          else
          {
            v12 = -[SignpostAnimationInterval initWithFirstAnimatonInterval:secondAnimationIntervak:]([SignpostAnimationInterval alloc], "initWithFirstAnimatonInterval:secondAnimationIntervak:", v8, v9);
            objc_msgSend(v6, "replaceObjectAtIndex:withObject:", v7, v12);
            objc_msgSend(v6, "removeObjectAtIndex:", v7 + 1);

          }
        }

      }
      while (v7 < objc_msgSend(v6, "count") - 1);
    }
    v4 = (void *)objc_msgSend(v6, "copy");

    v3 = v5;
  }
  else
  {
    v4 = (void *)objc_msgSend(v3, "copy");
  }

  return v4;
}

uint64_t __55__SignpostAnimationInterval_unionOfAnimationIntervals___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "startMachContinuousTime");
  if (v6 >= objc_msgSend(v5, "startMachContinuousTime"))
  {
    v8 = objc_msgSend(v4, "startMachContinuousTime");
    v7 = v8 != objc_msgSend(v5, "startMachContinuousTime");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (NSArray)firstFrameLifetimes
{
  return (NSArray *)-[SignpostAnimationInterval firstFrameLifetimesWithGraceTimeMCT:](self, "firstFrameLifetimesWithGraceTimeMCT:", -[SignpostAnimationInterval firstFrameGraceTimeMCT](self, "firstFrameGraceTimeMCT"));
}

- (id)firstFrameLifetimesWithGraceTimeMCT:(unint64_t)a3
{
  void *v5;
  NSUInteger v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSUInteger v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;
  NSRange v21;
  NSRange v22;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  v6 = -[SignpostInterval startMachContinuousTime](self, "startMachContinuousTime");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[SignpostAnimationInterval allFrameLifetimes](self, "allFrameLifetimes", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v12, "mayBeFirstFrame") & 1) == 0)
        {
          v13 = objc_msgSend(v12, "startMachContinuousTime");
          v22.length = objc_msgSend(v12, "durationMachContinuousTime");
          v21.location = v6;
          v21.length = a3;
          v22.location = v13;
          if (!NSIntersectionRange(v21, v22).length)
            continue;
        }
        objc_msgSend(v5, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v5;
}

- (BOOL)isFramePossibleFirstFrameForAnimation:(id)a3
{
  id v4;

  v4 = a3;
  LOBYTE(self) = -[SignpostAnimationInterval isFramePossibleFirstFrameForAnimation:withGraceTime:](self, "isFramePossibleFirstFrameForAnimation:withGraceTime:", v4, -[SignpostAnimationInterval firstFrameGraceTimeMCT](self, "firstFrameGraceTimeMCT"));

  return (char)self;
}

- (BOOL)isFramePossibleFirstFrameForAnimation:(id)a3 withGraceTime:(unint64_t)a4
{
  id v6;
  NSUInteger v7;
  BOOL v8;
  NSUInteger v9;
  NSRange v11;
  NSRange v12;

  v6 = a3;
  v7 = -[SignpostInterval startMachContinuousTime](self, "startMachContinuousTime");
  if ((objc_msgSend(v6, "mayBeFirstFrame") & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    v9 = objc_msgSend(v6, "startMachContinuousTime");
    v12.length = objc_msgSend(v6, "durationMachContinuousTime");
    v11.location = v7;
    v11.length = a4;
    v12.location = v9;
    v8 = NSIntersectionRange(v11, v12).length != 0;
  }

  return v8;
}

- (NSArray)glitches
{
  void *v3;
  void *v4;

  -[SignpostAnimationInterval longFrameLifetimes](self, "longFrameLifetimes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _glitchesFromFrameLifetimesBase(v3, self, 2, 19, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)contributedGlitches
{
  void *v3;
  void *v4;

  -[SignpostAnimationInterval longContributedFrameLifetimes](self, "longContributedFrameLifetimes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _glitchesFromFrameLifetimesBase(v3, self, 2, 19, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (id)overrunIntervalsOfType:(unint64_t)a3 class:(unint64_t)a4 contributingPID:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v8 = a5;
  -[SignpostAnimationInterval longFrameLifetimes](self, "longFrameLifetimes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v10 = (void *)MEMORY[0x1E0CB3880];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __74__SignpostAnimationInterval_overrunIntervalsOfType_class_contributingPID___block_invoke;
    v15[3] = &unk_1E4601028;
    v16 = v8;
    objc_msgSend(v10, "predicateWithBlock:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "filteredArrayUsingPredicate:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v12;
  }
  _glitchesFromFrameLifetimesBase(v9, self, a3, a4, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __74__SignpostAnimationInterval_overrunIntervalsOfType_class_contributingPID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "contributingPIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (double)timeRatioMSPerSForOverrunIntervals:(id)a3 applyPerceptionAdjustments:(unint64_t)a4
{
  double v4;

  -[SignpostAnimationInterval _timeRatioForTimeIntervalArray:applyPerceptionAdjustments:](self, "_timeRatioForTimeIntervalArray:applyPerceptionAdjustments:", a3, a4);
  return v4 * 1000.0;
}

- (double)timeRatioMSPerSForOverrunIntervalsOfType:(unint64_t)a3 class:(unint64_t)a4 contributingPID:(id)a5 applyPerceptionAdjustments:(unint64_t)a6
{
  void *v8;
  double v9;
  double v10;

  -[SignpostAnimationInterval overrunIntervalsOfType:class:contributingPID:](self, "overrunIntervalsOfType:class:contributingPID:", a3, a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAnimationInterval timeRatioMSPerSForOverrunIntervals:applyPerceptionAdjustments:](self, "timeRatioMSPerSForOverrunIntervals:applyPerceptionAdjustments:", v8, a6);
  v10 = v9;

  return v10;
}

- (double)glitchTimeRatio
{
  void *v3;
  double v4;
  double v5;

  -[SignpostAnimationInterval glitches](self, "glitches");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAnimationInterval _timeRatioForTimeIntervalArray:applyPerceptionAdjustments:](self, "_timeRatioForTimeIntervalArray:applyPerceptionAdjustments:", v3, 0);
  v5 = v4;

  return v5;
}

- (double)glitchTimeRatioMsPerS
{
  double v2;

  -[SignpostAnimationInterval glitchTimeRatio](self, "glitchTimeRatio");
  return v2 * 1000.0;
}

- (double)glitchTimeRatioAdjusted
{
  unint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v3 = +[SignpostAnimationInterval effectiveGlitchTimeRatioAdjustedVersion](SignpostAnimationInterval, "effectiveGlitchTimeRatioAdjustedVersion");
  if (v3 - 1 > 1)
  {
    -[SignpostAnimationInterval glitches](self, "glitches");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SignpostAnimationInterval longFrameLifetimes](self, "longFrameLifetimes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _glitchesFromFrameLifetimesBase(v4, self, 1, 19, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[SignpostAnimationInterval _timeRatioForTimeIntervalArray:applyPerceptionAdjustments:](self, "_timeRatioForTimeIntervalArray:applyPerceptionAdjustments:", v5, v3);
  v7 = v6;

  return v7;
}

- (double)glitchTimeRatioAdjustedMsPerS
{
  double v2;

  -[SignpostAnimationInterval glitchTimeRatioAdjusted](self, "glitchTimeRatioAdjusted");
  return v2 * 1000.0;
}

- (unint64_t)firstFrameGraceTimeMs
{
  void *v2;
  unint64_t v3;

  -[SignpostAnimationInterval firstFrameGraceTime](self, "firstFrameGraceTime");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "firstFrameGraceTimeMs");

  return v3;
}

- (unint64_t)animationType
{
  void *v2;
  unint64_t v3;

  -[SignpostAnimationInterval firstFrameGraceTime](self, "firstFrameGraceTime");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "animationType");

  return v3;
}

- (unint64_t)firstFrameGraceTimeMCT
{
  void *v3;
  double v4;
  double v5;
  unint64_t v6;

  -[SignpostAnimationInterval firstFrameGraceTime](self, "firstFrameGraceTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (double)(unint64_t)(1000000 * objc_msgSend(v3, "firstFrameGraceTimeMs"));
  -[SignpostSupportObject timebaseRatio](self, "timebaseRatio");
  v6 = (unint64_t)(v4 / v5);

  return v6;
}

- (NSArray)firstFrameGlitches
{
  void *v3;
  void *v4;

  -[SignpostAnimationInterval longFrameLifetimes](self, "longFrameLifetimes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _glitchesFromFrameLifetimesBase(v3, self, 2, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)contributedFirstFrameGlitches
{
  void *v3;
  void *v4;

  -[SignpostAnimationInterval longContributedFrameLifetimes](self, "longContributedFrameLifetimes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _glitchesFromFrameLifetimesBase(v3, self, 2, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (double)firstFrameGlitchTimeRatio
{
  void *v3;
  double v4;
  double v5;

  -[SignpostAnimationInterval firstFrameGlitches](self, "firstFrameGlitches");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAnimationInterval _timeRatioForTimeIntervalArray:applyPerceptionAdjustments:](self, "_timeRatioForTimeIntervalArray:applyPerceptionAdjustments:", v3, 0);
  v5 = v4;

  return v5;
}

- (double)firstFrameGlitchTimeRatioMsPerS
{
  double v2;

  -[SignpostAnimationInterval firstFrameGlitchTimeRatio](self, "firstFrameGlitchTimeRatio");
  return v2 * 1000.0;
}

- (NSArray)nonFirstFrameGlitches
{
  void *v3;
  void *v4;

  -[SignpostAnimationInterval longFrameLifetimes](self, "longFrameLifetimes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _glitchesFromFrameLifetimesBase(v3, self, 2, 18, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)contributedNonFirstFrameGlitches
{
  void *v3;
  void *v4;

  -[SignpostAnimationInterval longContributedFrameLifetimes](self, "longContributedFrameLifetimes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _glitchesFromFrameLifetimesBase(v3, self, 2, 18, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (double)nonFirstFrameGlitchTimeRatio
{
  void *v3;
  double v4;
  double v5;

  -[SignpostAnimationInterval nonFirstFrameGlitches](self, "nonFirstFrameGlitches");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAnimationInterval _timeRatioForTimeIntervalArray:applyPerceptionAdjustments:](self, "_timeRatioForTimeIntervalArray:applyPerceptionAdjustments:", v3, 0);
  v5 = v4;

  return v5;
}

- (double)nonFirstFrameGlitchTimeRatioMsPerS
{
  double v2;

  -[SignpostAnimationInterval nonFirstFrameGlitchTimeRatio](self, "nonFirstFrameGlitchTimeRatio");
  return v2 * 1000.0;
}

- (double)nonFirstFrameGlitchTimeRatioAdjusted
{
  unint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v3 = +[SignpostAnimationInterval effectiveGlitchTimeRatioAdjustedVersion](SignpostAnimationInterval, "effectiveGlitchTimeRatioAdjustedVersion");
  if (v3 - 1 > 1)
  {
    -[SignpostAnimationInterval nonFirstFrameGlitches](self, "nonFirstFrameGlitches");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SignpostAnimationInterval longFrameLifetimes](self, "longFrameLifetimes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _glitchesFromFrameLifetimesBase(v4, self, 1, 18, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[SignpostAnimationInterval _timeRatioForTimeIntervalArray:applyPerceptionAdjustments:](self, "_timeRatioForTimeIntervalArray:applyPerceptionAdjustments:", v5, v3);
  v7 = v6;

  return v7;
}

- (double)nonFirstFrameGlitchTimeRatioAdjustedMsPerS
{
  double v2;

  -[SignpostAnimationInterval nonFirstFrameGlitchTimeRatioAdjusted](self, "nonFirstFrameGlitchTimeRatioAdjusted");
  return v2 * 1000.0;
}

- (double)nonFirstFrameContributedGlitchTimeRatioAdjustedMsPerS
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[SignpostInterval beginEvent](self, "beginEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "processID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAnimationInterval timeRatioMSPerSForOverrunIntervalsOfType:class:contributingPID:applyPerceptionAdjustments:](self, "timeRatioMSPerSForOverrunIntervalsOfType:class:contributingPID:applyPerceptionAdjustments:", 2, 10, v5, +[SignpostAnimationInterval effectiveGlitchTimeRatioAdjustedVersion](SignpostAnimationInterval, "effectiveGlitchTimeRatioAdjustedVersion"));
  v7 = v6;

  return v7;
}

- (id)_statsStringForTimeIntervals:(id)a3 label:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  double v13;
  void *v14;
  uint64_t v15;
  double v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  SignpostSupportSlidingWindowAveragesForIntervalsInNs(v5, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    v11 = 0.0;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "doubleValue");
        if (v11 < v13)
          v11 = v13;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }
  else
  {
    v11 = 0.0;
  }
  v14 = (void *)MEMORY[0x1E0CB3940];
  v15 = objc_msgSend(v5, "count");
  v16 = (double)SignpostSupportAverageDurationNsForIntervals(v5) / 1000000.0;
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%lu %@ with %.2f ms average duration, %.3f ms standard deviation, and %.3f ms window max\n"), v15, v6, *(_QWORD *)&v16, (double)SignpostSupportStdDevNsForIntervals(v5) / 1000000.0, v11 / 1000000.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_animationStatsDescription
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  uint64_t v34;
  void *v35;
  __CFString *v36;
  const __CFString *v37;
  __CFString *v38;
  __CFString *v39;
  __CFString *v40;
  __CFString *v41;
  __CFString *v42;
  __CFString *v43;
  __CFString *v44;
  __CFString *v45;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  __CFString *v51;
  void *v52;

  -[SignpostAnimationInterval allCommits](self, "allCommits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v3 != 0;
  if (v3)
  {
    -[SignpostAnimationInterval allCommits](self, "allCommits");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostAnimationInterval _statsStringForTimeIntervals:label:](self, "_statsStringForTimeIntervals:label:", v5, CFSTR("commit(s)"));
    v6 = (const __CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_1E4610268;
  }
  -[SignpostAnimationInterval allSystemwideCommits](self, "allSystemwideCommits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SignpostAnimationInterval allSystemwideCommits](self, "allSystemwideCommits");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostAnimationInterval _statsStringForTimeIntervals:label:](self, "_statsStringForTimeIntervals:label:", v8, CFSTR("systemwide commit(s)"));
    v9 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    v4 = 1;
  }
  else
  {
    v9 = &stru_1E4610268;
  }
  -[SignpostAnimationInterval allClientDrawables](self, "allClientDrawables");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SignpostAnimationInterval allClientDrawables](self, "allClientDrawables");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostAnimationInterval _statsStringForTimeIntervals:label:](self, "_statsStringForTimeIntervals:label:", v11, CFSTR("client drawables(s)"));
    v12 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    v4 = 1;
  }
  else
  {
    v12 = &stru_1E4610268;
  }
  -[SignpostAnimationInterval allSystemwideClientDrawables](self, "allSystemwideClientDrawables");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SignpostAnimationInterval allSystemwideClientDrawables](self, "allSystemwideClientDrawables");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostAnimationInterval _statsStringForTimeIntervals:label:](self, "_statsStringForTimeIntervals:label:", v14, CFSTR("systemwide client drawable(s)"));
    v15 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    v4 = 1;
  }
  else
  {
    v15 = &stru_1E4610268;
  }
  -[SignpostAnimationInterval allRenderServerRenders](self, "allRenderServerRenders");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[SignpostAnimationInterval allRenderServerRenders](self, "allRenderServerRenders");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostAnimationInterval _statsStringForTimeIntervals:label:](self, "_statsStringForTimeIntervals:label:", v17, CFSTR("CA render server renders(s)"));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v4 = 1;
  }
  else
  {
    v18 = &stru_1E4610268;
  }
  -[SignpostAnimationInterval allTransactionLifetimes](self, "allTransactionLifetimes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[SignpostAnimationInterval allTransactionLifetimes](self, "allTransactionLifetimes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostAnimationInterval _statsStringForTimeIntervals:label:](self, "_statsStringForTimeIntervals:label:", v20, CFSTR("transaction lifetimes"));
    v21 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    v4 = 1;
  }
  else
  {
    v21 = &stru_1E4610268;
  }
  -[SignpostAnimationInterval allFrameLatencies](self, "allFrameLatencies");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[SignpostAnimationInterval allFrameLatencies](self, "allFrameLatencies");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostAnimationInterval _statsStringForTimeIntervals:label:](self, "_statsStringForTimeIntervals:label:", v23, CFSTR("frame latencies"));
    v47 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    v4 = 1;
  }
  else
  {
    v47 = &stru_1E4610268;
  }
  -[SignpostAnimationInterval allHIDLatencies](self, "allHIDLatencies");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[SignpostAnimationInterval allHIDLatencies](self, "allHIDLatencies");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostAnimationInterval _statsStringForTimeIntervals:label:](self, "_statsStringForTimeIntervals:label:", v25, CFSTR("HID latencies"));
    v50 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    v4 = 1;
  }
  else
  {
    v50 = &stru_1E4610268;
  }
  -[SignpostAnimationInterval allFrameLifetimes](self, "allFrameLifetimes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[SignpostAnimationInterval allFrameLifetimes](self, "allFrameLifetimes");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostAnimationInterval _statsStringForTimeIntervals:label:](self, "_statsStringForTimeIntervals:label:", v27, CFSTR("frame lifetimes"));
    v49 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    v4 = 1;
  }
  else
  {
    v49 = &stru_1E4610268;
  }
  -[SignpostAnimationInterval glitches](self, "glitches");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v21;
  v30 = v15;
  v31 = v12;
  v32 = v9;
  v33 = v6;
  if (v28)
  {
    -[SignpostAnimationInterval _statsStringForTimeIntervals:label:](self, "_statsStringForTimeIntervals:label:", v28, CFSTR("glitches"));
    v48 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    v4 = 1;
  }
  else
  {
    v48 = &stru_1E4610268;
  }

  -[SignpostAnimationInterval contributedGlitches](self, "contributedGlitches");
  v34 = objc_claimAutoreleasedReturnValue();
  v51 = (__CFString *)v6;
  if (v34)
  {
    v35 = (void *)v34;
    -[SignpostAnimationInterval _statsStringForTimeIntervals:label:](self, "_statsStringForTimeIntervals:label:", v34, CFSTR("contributed glitches"));
    v36 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v37 = v33;
    v38 = (__CFString *)v32;
    v39 = (__CFString *)v31;
    v40 = (__CFString *)v30;
    v41 = (__CFString *)v29;
    v42 = (__CFString *)v47;
  }
  else
  {
    v36 = &stru_1E4610268;
    v37 = v6;
    v38 = (__CFString *)v32;
    v39 = (__CFString *)v31;
    v40 = (__CFString *)v30;
    v41 = (__CFString *)v29;
    v42 = (__CFString *)v47;
    if (!v4)
    {
      v52 = 0;
      v45 = (__CFString *)v50;
      v44 = (__CFString *)v48;
      v43 = (__CFString *)v49;
      goto LABEL_36;
    }
  }
  v44 = (__CFString *)v48;
  v43 = (__CFString *)v49;
  v45 = (__CFString *)v50;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@%@%@%@%@%@%@%@"), v49, v37, v38, v39, v40, v18, v41, v42, v50, v48, v36);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_36:

  return v52;
}

- (id)_frameDescription
{
  __CFString *v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  float v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;

  -[SignpostAnimationInterval _detailedFrameDescription](self, "_detailedFrameDescription");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[SignpostAnimationInterval _poorPerfFrameDescription](self, "_poorPerfFrameDescription");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[SignpostAnimationInterval _animationStatsDescription](self, "_animationStatsDescription");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x1E0CB3940];
  if (v3 || v4 || v5)
  {
    v9 = &stru_1E4610268;
    if (v3)
      v10 = v3;
    else
      v10 = &stru_1E4610268;
    if (v4)
      v11 = v4;
    else
      v11 = &stru_1E4610268;
    if (v5)
      v9 = (const __CFString *)v5;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v10, v11, v9);
  }
  else
  {
    -[SignpostAnimationInterval frameRate](self, "frameRate");
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Average Framerate: %.1f frames/sec\n"), v8, v14, v15);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)debugDescription
{
  unint64_t v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  float v9;
  double v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = -[SignpostAnimationInterval animationType](self, "animationType");
  if (v3 - 1 > 2)
    v4 = CFSTR("Default");
  else
    v4 = off_1E4601070[v3 - 1];
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[SignpostObject name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SignpostInterval startMachContinuousTime](self, "startMachContinuousTime");
  v8 = -[SignpostInterval endMachContinuousTime](self, "endMachContinuousTime");
  -[SignpostInterval durationSeconds](self, "durationSeconds");
  v10 = v9;
  if (-[SignpostInterval telemetryEnabled](self, "telemetryEnabled"))
    v11 = CFSTR("Enabled");
  else
    v11 = CFSTR("Disabled");
  -[SignpostAnimationInterval _frameDescription](self, "_frameDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SignpostMetrics _deltaDescription:](SignpostMetrics, "_deltaDescription:", self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostInterval _eventDescriptions](self, "_eventDescriptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Animation Interval \"%@\" [%llu - %llu]\nDuration: %.4fs\nTelemetry:%@\nAnimation Type: %@\n%@%@%@"), v6, v7, v8, *(_QWORD *)&v10, v11, v4, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (float)frameRate
{
  void *v3;
  void *v4;
  float v5;
  float v6;
  float v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  float v12;
  float v13;

  -[SignpostAnimationInterval allFrameLatencies](self, "allFrameLatencies");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SignpostAnimationInterval allFrameLatencies](self, "allFrameLatencies");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (float)(unint64_t)objc_msgSend(v4, "count");
    -[SignpostInterval durationSeconds](self, "durationSeconds");
    v7 = v5 / v6;
LABEL_5:

    return v7;
  }
  -[SignpostInterval beginEvent](self, "beginEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_hasTotalSkyLightCompositeCount");

  v7 = 0.0;
  if (v9)
  {
    -[SignpostInterval endEvent](self, "endEvent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "_totalSkyLightCompositeCount");
    -[SignpostInterval beginEvent](self, "beginEvent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (float)(unint64_t)(v10 - objc_msgSend(v11, "_totalSkyLightCompositeCount"));
    -[SignpostInterval durationSeconds](self, "durationSeconds");
    v7 = v12 / v13;

    goto LABEL_5;
  }
  return v7;
}

- (SignpostAnimationInterval)initWithFirstAnimatonInterval:(id)a3 secondAnimationIntervak:(id)a4
{
  SignpostAnimationInterval *v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  SignpostAnimationInterval *v10;
  unint64_t v11;
  SignpostAnimationInterval *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSArray *longCommits;
  void *v19;
  void *v20;
  uint64_t v21;
  NSArray *longSystemwideCommits;
  void *v23;
  void *v24;
  uint64_t v25;
  NSArray *allSystemwideCommits;
  void *v27;
  void *v28;
  uint64_t v29;
  NSArray *longClientDrawables;
  void *v31;
  void *v32;
  uint64_t v33;
  NSArray *allClientDrawables;
  void *v35;
  void *v36;
  uint64_t v37;
  NSArray *longSystemwideClientDrawables;
  void *v39;
  void *v40;
  uint64_t v41;
  NSArray *allSystemwideClientDrawables;
  void *v43;
  void *v44;
  uint64_t v45;
  NSArray *longTransactionLifetimes;
  void *v47;
  void *v48;
  uint64_t v49;
  NSArray *allTransactionLifetimes;
  void *v51;
  void *v52;
  uint64_t v53;
  NSArray *longFrameLatencies;
  void *v55;
  void *v56;
  uint64_t v57;
  NSArray *allFrameLatencies;
  void *v59;
  void *v60;
  uint64_t v61;
  NSArray *longHIDLatencies;
  void *v63;
  void *v64;
  uint64_t v65;
  NSArray *allHIDLatencies;
  void *v67;
  void *v68;
  uint64_t v69;
  NSArray *longRenderServerRenders;
  void *v71;
  void *v72;
  uint64_t v73;
  NSArray *allRenderServerRenders;
  uint64_t v75;
  SignpostSupportAnimationGraceTime *firstFrameGraceTime;
  void *v77;
  void *v78;
  uint64_t v79;
  NSArray *longFrameLifetimes;
  void *v81;
  void *v82;
  uint64_t v83;
  NSArray *allFrameLifetimes;
  objc_super v86;

  v6 = (SignpostAnimationInterval *)a3;
  v7 = a4;
  v8 = -[SignpostInterval startMachContinuousTime](v6, "startMachContinuousTime");
  if (v8 <= objc_msgSend(v7, "startMachContinuousTime")
    && (v9 = -[SignpostInterval endMachContinuousTime](v6, "endMachContinuousTime"),
        v9 >= objc_msgSend(v7, "startMachContinuousTime")))
  {
    v11 = -[SignpostInterval endMachContinuousTime](v6, "endMachContinuousTime");
    if (v11 <= objc_msgSend(v7, "endMachContinuousTime"))
    {
      -[SignpostInterval beginEvent](v6, "beginEvent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "endEvent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v86.receiver = self;
      v86.super_class = (Class)SignpostAnimationInterval;
      v12 = -[SignpostInterval initWithBeginEvent:endEvent:](&v86, sel_initWithBeginEvent_endEvent_, v13, v14);

      if (v12)
      {
        -[SignpostAnimationInterval longCommits](v6, "longCommits");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "longCommits");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        _uniqueInterval(v15, v16);
        v17 = objc_claimAutoreleasedReturnValue();
        longCommits = v12->_longCommits;
        v12->_longCommits = (NSArray *)v17;

        -[SignpostAnimationInterval longSystemwideCommits](v6, "longSystemwideCommits");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "longSystemwideCommits");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        _uniqueInterval(v19, v20);
        v21 = objc_claimAutoreleasedReturnValue();
        longSystemwideCommits = v12->_longSystemwideCommits;
        v12->_longSystemwideCommits = (NSArray *)v21;

        -[SignpostAnimationInterval allSystemwideCommits](v6, "allSystemwideCommits");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "allSystemwideCommits");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        _uniqueInterval(v23, v24);
        v25 = objc_claimAutoreleasedReturnValue();
        allSystemwideCommits = v12->_allSystemwideCommits;
        v12->_allSystemwideCommits = (NSArray *)v25;

        -[SignpostAnimationInterval longClientDrawables](v6, "longClientDrawables");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "longClientDrawables");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        _uniqueInterval(v27, v28);
        v29 = objc_claimAutoreleasedReturnValue();
        longClientDrawables = v12->_longClientDrawables;
        v12->_longClientDrawables = (NSArray *)v29;

        -[SignpostAnimationInterval allClientDrawables](v6, "allClientDrawables");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "allClientDrawables");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        _uniqueInterval(v31, v32);
        v33 = objc_claimAutoreleasedReturnValue();
        allClientDrawables = v12->_allClientDrawables;
        v12->_allClientDrawables = (NSArray *)v33;

        -[SignpostAnimationInterval longSystemwideClientDrawables](v6, "longSystemwideClientDrawables");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "longSystemwideClientDrawables");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        _uniqueInterval(v35, v36);
        v37 = objc_claimAutoreleasedReturnValue();
        longSystemwideClientDrawables = v12->_longSystemwideClientDrawables;
        v12->_longSystemwideClientDrawables = (NSArray *)v37;

        -[SignpostAnimationInterval allSystemwideClientDrawables](v6, "allSystemwideClientDrawables");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "allSystemwideClientDrawables");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        _uniqueInterval(v39, v40);
        v41 = objc_claimAutoreleasedReturnValue();
        allSystemwideClientDrawables = v12->_allSystemwideClientDrawables;
        v12->_allSystemwideClientDrawables = (NSArray *)v41;

        -[SignpostAnimationInterval longTransactionLifetimes](v6, "longTransactionLifetimes");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "longTransactionLifetimes");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        _uniqueInterval(v43, v44);
        v45 = objc_claimAutoreleasedReturnValue();
        longTransactionLifetimes = v12->_longTransactionLifetimes;
        v12->_longTransactionLifetimes = (NSArray *)v45;

        -[SignpostAnimationInterval allTransactionLifetimes](v6, "allTransactionLifetimes");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "allTransactionLifetimes");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        _uniqueInterval(v47, v48);
        v49 = objc_claimAutoreleasedReturnValue();
        allTransactionLifetimes = v12->_allTransactionLifetimes;
        v12->_allTransactionLifetimes = (NSArray *)v49;

        -[SignpostAnimationInterval longFrameLatencies](v6, "longFrameLatencies");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "longFrameLatencies");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        _uniqueInterval(v51, v52);
        v53 = objc_claimAutoreleasedReturnValue();
        longFrameLatencies = v12->_longFrameLatencies;
        v12->_longFrameLatencies = (NSArray *)v53;

        -[SignpostAnimationInterval allFrameLatencies](v6, "allFrameLatencies");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "allFrameLatencies");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        _uniqueInterval(v55, v56);
        v57 = objc_claimAutoreleasedReturnValue();
        allFrameLatencies = v12->_allFrameLatencies;
        v12->_allFrameLatencies = (NSArray *)v57;

        -[SignpostAnimationInterval allHIDLatencies](v6, "allHIDLatencies");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "allHIDLatencies");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        _uniqueInterval(v59, v60);
        v61 = objc_claimAutoreleasedReturnValue();
        longHIDLatencies = v12->_longHIDLatencies;
        v12->_longHIDLatencies = (NSArray *)v61;

        -[SignpostAnimationInterval allHIDLatencies](v6, "allHIDLatencies");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "allHIDLatencies");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        _uniqueInterval(v63, v64);
        v65 = objc_claimAutoreleasedReturnValue();
        allHIDLatencies = v12->_allHIDLatencies;
        v12->_allHIDLatencies = (NSArray *)v65;

        -[SignpostAnimationInterval longRenderServerRenders](v6, "longRenderServerRenders");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "longRenderServerRenders");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        _uniqueInterval(v67, v68);
        v69 = objc_claimAutoreleasedReturnValue();
        longRenderServerRenders = v12->_longRenderServerRenders;
        v12->_longRenderServerRenders = (NSArray *)v69;

        -[SignpostAnimationInterval allRenderServerRenders](v6, "allRenderServerRenders");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "allRenderServerRenders");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        _uniqueInterval(v71, v72);
        v73 = objc_claimAutoreleasedReturnValue();
        allRenderServerRenders = v12->_allRenderServerRenders;
        v12->_allRenderServerRenders = (NSArray *)v73;

        -[SignpostAnimationInterval firstFrameGraceTime](v6, "firstFrameGraceTime");
        v75 = objc_claimAutoreleasedReturnValue();
        firstFrameGraceTime = v12->_firstFrameGraceTime;
        v12->_firstFrameGraceTime = (SignpostSupportAnimationGraceTime *)v75;

        -[SignpostAnimationInterval longFrameLifetimes](v6, "longFrameLifetimes");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "longFrameLifetimes");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        _uniqueInterval(v77, v78);
        v79 = objc_claimAutoreleasedReturnValue();
        longFrameLifetimes = v12->_longFrameLifetimes;
        v12->_longFrameLifetimes = (NSArray *)v79;

        -[SignpostAnimationInterval allFrameLifetimes](v6, "allFrameLifetimes");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "allFrameLifetimes");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        _uniqueInterval(v81, v82);
        v83 = objc_claimAutoreleasedReturnValue();
        allFrameLifetimes = v12->_allFrameLifetimes;
        v12->_allFrameLifetimes = (NSArray *)v83;

      }
      self = v12;
    }
    else
    {
      v12 = v6;
    }
    v10 = v12;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSArray)allContributedFrameLatencies
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[SignpostInterval beginEvent](self, "beginEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "processID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SignpostAnimationInterval allFrameLatencies](self, "allFrameLatencies");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3880];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__SignpostAnimationInterval_allContributedFrameLatencies__block_invoke;
  v12[3] = &unk_1E4601050;
  v13 = v5;
  v8 = v5;
  objc_msgSend(v7, "predicateWithBlock:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredArrayUsingPredicate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v10;
}

uint64_t __57__SignpostAnimationInterval_allContributedFrameLatencies__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "contributingPids");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (NSArray)contributedLongFrameLatencies
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[SignpostInterval beginEvent](self, "beginEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "processID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SignpostAnimationInterval longFrameLatencies](self, "longFrameLatencies");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3880];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__SignpostAnimationInterval_contributedLongFrameLatencies__block_invoke;
  v12[3] = &unk_1E4601050;
  v13 = v5;
  v8 = v5;
  objc_msgSend(v7, "predicateWithBlock:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredArrayUsingPredicate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v10;
}

uint64_t __58__SignpostAnimationInterval_contributedLongFrameLatencies__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "contributingPids");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (NSArray)allContributedFrameLifetimes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[SignpostInterval beginEvent](self, "beginEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "processID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SignpostAnimationInterval allFrameLifetimes](self, "allFrameLifetimes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3880];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__SignpostAnimationInterval_allContributedFrameLifetimes__block_invoke;
  v12[3] = &unk_1E4601028;
  v13 = v5;
  v8 = v5;
  objc_msgSend(v7, "predicateWithBlock:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredArrayUsingPredicate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v10;
}

uint64_t __57__SignpostAnimationInterval_allContributedFrameLifetimes__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "contributingPIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (NSArray)longContributedFrameLifetimes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[SignpostInterval beginEvent](self, "beginEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "processID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SignpostAnimationInterval longFrameLifetimes](self, "longFrameLifetimes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3880];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__SignpostAnimationInterval_longContributedFrameLifetimes__block_invoke;
  v12[3] = &unk_1E4601028;
  v13 = v5;
  v8 = v5;
  objc_msgSend(v7, "predicateWithBlock:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredArrayUsingPredicate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v10;
}

uint64_t __58__SignpostAnimationInterval_longContributedFrameLifetimes__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "contributingPIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SignpostAnimationInterval;
  if (-[SignpostInterval isEqual:](&v16, sel_isEqual_, v5))
  {
    v6 = v5;
    -[SignpostAnimationInterval compositeIntervals](self, "compositeIntervals");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7 || (objc_msgSend(v6, "compositeIntervals"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[SignpostAnimationInterval compositeIntervals](self, "compositeIntervals");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {

        if (v7)
        {

        }
      }
      else
      {
        objc_msgSend(v6, "compositeIntervals");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {

        }
        if (v10)
          goto LABEL_15;
      }
      -[SignpostAnimationInterval compositeIntervals](self, "compositeIntervals");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11
        || (-[SignpostAnimationInterval compositeIntervals](self, "compositeIntervals"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v6, "compositeIntervals"),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            v14 = objc_msgSend(v12, "isEqual:", v13),
            v13,
            v12,
            v14))
      {
        v8 = 1;
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {

    }
LABEL_15:
    v8 = 0;
    goto LABEL_16;
  }
  v8 = 0;
LABEL_17:

  return v8;
}

- (unint64_t)frameCount
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  -[SignpostInterval beginEvent](self, "beginEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_hasTotalSkyLightCompositeCount");

  if (v4)
  {
    -[SignpostInterval endEvent](self, "endEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_totalSkyLightCompositeCount");
    -[SignpostInterval beginEvent](self, "beginEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6 - objc_msgSend(v7, "_totalSkyLightCompositeCount");

  }
  else
  {
    -[SignpostAnimationInterval compositeIntervals](self, "compositeIntervals");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[SignpostAnimationInterval compositeIntervals](self, "compositeIntervals");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[SignpostAnimationInterval allFrameLatencies](self, "allFrameLatencies");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
        return 0;
      -[SignpostAnimationInterval allFrameLatencies](self, "allFrameLatencies");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v5 = v10;
    v8 = objc_msgSend(v10, "count");
  }

  return v8;
}

- (unint64_t)durationToFirstBeginMachContinuousTime:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "startMachContinuousTime");
    v8 = v7 - -[SignpostInterval startMachContinuousTime](self, "startMachContinuousTime");

  }
  else
  {
    v8 = -1;
  }

  return v8;
}

- (unint64_t)durationToFirstEndMachContinuousTime:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "endMachContinuousTime");
    v8 = v7 - -[SignpostInterval startMachContinuousTime](self, "startMachContinuousTime");

  }
  else
  {
    v8 = -1;
  }

  return v8;
}

- (double)durationToFirstBeginSeconds:(id)a3
{
  double v4;
  double v5;

  v4 = (double)-[SignpostAnimationInterval durationToFirstBeginMachContinuousTime:](self, "durationToFirstBeginMachContinuousTime:", a3);
  -[SignpostSupportObject timebaseRatio](self, "timebaseRatio");
  return (double)(unint64_t)(v5 * v4) / 1000000000.0;
}

- (double)durationToFirstEndSeconds:(id)a3
{
  double v4;
  double v5;

  v4 = (double)-[SignpostAnimationInterval durationToFirstEndMachContinuousTime:](self, "durationToFirstEndMachContinuousTime:", a3);
  -[SignpostSupportObject timebaseRatio](self, "timebaseRatio");
  return (double)(unint64_t)(v5 * v4) / 1000000000.0;
}

- (NSArray)allCommits
{
  return self->_allCommits;
}

- (NSArray)longCommits
{
  return self->_longCommits;
}

- (NSArray)allSystemwideCommits
{
  return self->_allSystemwideCommits;
}

- (NSArray)longSystemwideCommits
{
  return self->_longSystemwideCommits;
}

- (NSArray)allClientDrawables
{
  return self->_allClientDrawables;
}

- (NSArray)longClientDrawables
{
  return self->_longClientDrawables;
}

- (NSArray)allSystemwideClientDrawables
{
  return self->_allSystemwideClientDrawables;
}

- (NSArray)longSystemwideClientDrawables
{
  return self->_longSystemwideClientDrawables;
}

- (NSArray)compositeIntervals
{
  return self->_compositeIntervals;
}

- (void)setCompositeIntervals:(id)a3
{
  objc_storeStrong((id *)&self->_compositeIntervals, a3);
}

- (NSArray)allTransactionLifetimes
{
  return self->_allTransactionLifetimes;
}

- (NSArray)longTransactionLifetimes
{
  return self->_longTransactionLifetimes;
}

- (NSArray)allHIDLatencies
{
  return self->_allHIDLatencies;
}

- (NSArray)longHIDLatencies
{
  return self->_longHIDLatencies;
}

- (NSArray)allRenderServerRenders
{
  return self->_allRenderServerRenders;
}

- (NSArray)longRenderServerRenders
{
  return self->_longRenderServerRenders;
}

- (SignpostSupportAnimationGraceTime)firstFrameGraceTime
{
  return (SignpostSupportAnimationGraceTime *)objc_getProperty(self, a2, 304, 1);
}

+ (id)serializationTypeNumber
{
  return 0;
}

- (SignpostAnimationInterval)initWithDictionary:(id)a3
{

  return 0;
}

- (id)humanReadableType
{
  return CFSTR("SignpostAnimationInterval");
}

- (id)_dictionaryRepresentationWithIsHumanReadable:(BOOL)a3 shouldRedact:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v40.receiver = self;
    v40.super_class = (Class)SignpostAnimationInterval;
    -[SignpostInterval _dictionaryRepresentationWithIsHumanReadable:shouldRedact:](&v40, sel__dictionaryRepresentationWithIsHumanReadable_shouldRedact_, 1, a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[SignpostAnimationInterval frameRate](self, "frameRate");
    objc_msgSend(v6, "numberWithFloat:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("Framerate"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SignpostAnimationInterval frameCount](self, "frameCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("FrameCount"));

    -[SignpostAnimationInterval compositeIntervals](self, "compositeIntervals");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      -[SignpostAnimationInterval compositeIntervals](self, "compositeIntervals");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        -[SignpostAnimationInterval compositeIntervals](self, "compositeIntervals", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v37;
          do
          {
            v18 = 0;
            do
            {
              if (*(_QWORD *)v37 != v17)
                objc_enumerationMutation(v14);
              objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v18), "humanReadableDictionaryRepresentation");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObject:", v19);

              ++v18;
            }
            while (v16 != v18);
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
          }
          while (v16);
        }

        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("CompositeIntervalArray"));
      }
    }
    v20 = (void *)MEMORY[0x1E0CB37E8];
    -[SignpostAnimationInterval glitches](self, "glitches");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "count"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, CFSTR("GC"));

    v23 = (void *)MEMORY[0x1E0CB37E8];
    -[SignpostAnimationInterval glitchTimeRatioMsPerS](self, "glitchTimeRatioMsPerS");
    objc_msgSend(v23, "numberWithDouble:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, CFSTR("GTRMsPerS"));

    v25 = (void *)MEMORY[0x1E0CB37E8];
    -[SignpostAnimationInterval firstFrameGlitches](self, "firstFrameGlitches");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "numberWithUnsignedInteger:", objc_msgSend(v26, "count"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, CFSTR("FFGC"));

    v28 = (void *)MEMORY[0x1E0CB37E8];
    -[SignpostAnimationInterval firstFrameGlitchTimeRatioMsPerS](self, "firstFrameGlitchTimeRatioMsPerS");
    objc_msgSend(v28, "numberWithDouble:");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, CFSTR("FFGTRMsPerS"));

    v30 = (void *)MEMORY[0x1E0CB37E8];
    -[SignpostAnimationInterval nonFirstFrameGlitches](self, "nonFirstFrameGlitches");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "numberWithUnsignedInteger:", objc_msgSend(v31, "count"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v32, CFSTR("NFFGC"));

    v33 = (void *)MEMORY[0x1E0CB37E8];
    -[SignpostAnimationInterval nonFirstFrameGlitchTimeRatioMsPerS](self, "nonFirstFrameGlitchTimeRatioMsPerS");
    objc_msgSend(v33, "numberWithDouble:");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v34, CFSTR("NFFGTRMsPerS"));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (void)effectiveGlitchTimeRatioAdjustedVersion
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 136315650;
  v3 = "+[SignpostAnimationInterval effectiveGlitchTimeRatioAdjustedVersion]";
  v4 = 2048;
  v5 = a1;
  v6 = 2048;
  v7 = 3;
  _os_log_debug_impl(&dword_1A1A28000, a2, OS_LOG_TYPE_DEBUG, "%s: Unknown GlitchTimeRatioAdjustedVersion %lu, - reverting to %lu", (uint8_t *)&v2, 0x20u);
}

- (void)initWithBeginEvent:(uint64_t)a3 endEvent:(uint64_t)a4 accumulatedState:(uint64_t)a5 firstFrameGraceTimeController:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1A1A28000, a1, a3, "Mismatch of begin and end event hasTotalFrames", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

@end
