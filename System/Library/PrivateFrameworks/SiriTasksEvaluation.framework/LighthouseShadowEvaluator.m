@implementation LighthouseShadowEvaluator

- (LighthouseShadowEvaluator)init
{
  LighthouseShadowEvaluator *v2;
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LighthouseShadowEvaluator;
  v2 = -[LighthouseShadowEvaluator init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[LighthouseShadowEvaluator setEvaluationResults:](v2, "setEvaluationResults:", v3);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[LighthouseShadowEvaluator setJsonSELFResults:](v2, "setJsonSELFResults:", v4);

  }
  return v2;
}

- (BOOL)performSiriEvaluationTaskWithTaskName:(id)a3 bmStreamIdentifier:(id)a4 outError:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  id v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v24;
  id v25;
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  NSLog(CFSTR("LighthouseShadowEvaluator: Start task"));
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6DF88]), "initWithMaximumNumberOfDays:maximumNumberOfEvents:", 28, 28);
  if (v7)
  {
    objc_msgSend(CFSTR("com.apple.SiriTasksEvaluation"), "stringByAppendingString:", CFSTR("-"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingString:", v7);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = CFSTR("com.apple.SiriTasksEvaluation");
  }
  v26 = 0;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6DF90]), "initWithBundleIdentifier:dataProviderInstance:evaluationInstance:personalizationInstance:pruningPolicy:error:", v11, self, self, self, v9, &v26);
  v13 = v26;
  if (v13)
  {
    v14 = v13;
    NSLog(CFSTR("LighthouseShadowEvaluator: Failed to create ODCurareEvaluationAndReportingModule: %@"), v13);
    v15 = 0;
  }
  else
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BE0C0A8], "streamIdentifierForStream:", 35);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v24 = v8;
    -[LighthouseShadowEvaluator generateCandidateModels:](self, "generateCandidateModels:", v8);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6DF98]), "initWithMetricName:percentageIncrease:", CFSTR("taskSuccessMetric"), 0.05);
    v27[0] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6DFA0]), "initWithModelSelectionParameters:minimumNumberOfEvaluations:minimumNumberOfSamples:", v18, &unk_24CF88BB0, 0);
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6DFA8]), "initWithModelSelectionParameters:minimumNumberOfSamplesForPersonalization:minimumNumberOfSamplesForPersonalizationSelection:", v18, &unk_24CF88BC8, &unk_24CF88BB0);
    v25 = 0;
    v21 = (void *)v16;
    objc_msgSend(v12, "trainAndEvaluateModelsWithCandidateModels:personalizationPolicy:selectionPolicy:error:", v16, v20, v19, &v25);
    v22 = v25;
    v14 = v22;
    v15 = v22 == 0;
    if (v22)
      NSLog(CFSTR("LighthouseShadowEvaluator: Failed to run task with error: %@"), v22);

    v8 = v24;
  }

  return v15;
}

- (id)getDateString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDateFormat:", CFSTR("EEE',' dd' 'MMM' 'yyyy HH':'mm':'ss Z"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF38]), "initWithName:", CFSTR("UTC"));
  objc_msgSend(v4, "setTimeZone:", v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend(v4, "setLocale:", v6);

  objc_msgSend(v4, "stringFromDate:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isSuccess:(id)a3 intentType:(id)a4 intentResultType:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  double v11;
  int v12;
  uint64_t v13;
  char v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    objc_msgSend(v7, "type");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("INStartCallIntent")) & 1) != 0)
    {
      objc_msgSend(v7, "duration");
      v12 = (int)v11;
      v13 = minCallDurationInSeconds;

      if (v13 > v12)
        goto LABEL_4;
    }
    else
    {

    }
    v14 = 1;
    goto LABEL_10;
  }
LABEL_4:
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("INStartCal]lIntent")) & 1) != 0
    || (objc_msgSend(v8, "isEqualToString:", CFSTR("INSendMessageIntent")) & 1) != 0)
  {
    v14 = 0;
  }
  else
  {
    v14 = objc_msgSend(v9, "isEqualToString:", CFSTR("failed"));
  }
LABEL_10:

  return v14;
}

- (BOOL)findInteraction:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v3 = a3;
  if (objc_msgSend(v3, "eventType") == 1)
    v4 = 5;
  else
    v4 = 30;
  objc_msgSend(v3, "createdAt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dateByAddingTimeInterval:", (double)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  +[BiomeUtils getEventsFromStream:startingAt:until:](BiomeUtils, "getEventsFromStream:startingAt:until:", v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count") != 0;

  return v9;
}

- (BOOL)evaluateTaskSuccess:(id)a3 finalInteraction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  __CFString *v10;
  BOOL v11;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "count"))
  {
    v9 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v6, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
LABEL_6:
    v10 = &stru_24CF877B8;
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "eventType"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v9, "eventType"));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    NSLog(CFSTR("LighthouseShadowEvaluator: the first siriIntent event is not intentStart: %@"), v10);

    v11 = 0;
    goto LABEL_8;
  }
  v13 = (void *)MEMORY[0x24BDD1608];
  objc_msgSend(v9, "eventData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  objc_msgSend(v13, "JSONObjectWithData:options:error:", v14, 0, &v34);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v34;

  if (v16)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v15, "objectForKey:", CFSTR("intentType"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v18 = v6;
    v19 = (void *)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v19)
    {
      v27 = v17;
      v28 = v15;
      v20 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v31 != v20)
            objc_enumerationMutation(v18);
          v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v22, "eventType") == 1)
          {
            v23 = (void *)MEMORY[0x24BDD1608];
            objc_msgSend(v22, "eventData");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = 0;
            objc_msgSend(v23, "JSONObjectWithData:options:error:", v24, 0, &v29);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v29;

            v19 = 0;
            if (!v26)
            {
              objc_msgSend(v25, "objectForKey:", CFSTR("type"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
            }

            goto LABEL_23;
          }
        }
        v19 = (void *)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        if (v19)
          continue;
        break;
      }
LABEL_23:
      v17 = v27;
      v15 = v28;
    }

    v11 = -[LighthouseShadowEvaluator isSuccess:intentType:intentResultType:](self, "isSuccess:intentType:intentResultType:", v7, v17, v19);
  }

LABEL_8:
  return v11;
}

- (id)evaluateAbandonedSiriTasks:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  SiriTasksEvaluationResult *v9;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[LighthouseShadowEvaluator fetchSiriIntentEvents:](self, "fetchSiriIntentEvents:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "intentId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[LighthouseShadowEvaluator findInteraction:](self, "findInteraction:", v7))
    {
      NSLog(CFSTR("LighthouseShadowEvaluator: found non-interactions: %@"), v8);
      v9 = -[SiriTasksEvaluationResult initWithTaskId:isEffectiveTask:isSuccessfulTask:]([SiriTasksEvaluationResult alloc], "initWithTaskId:isEffectiveTask:isSuccessfulTask:", v8, 1, 0);
      objc_msgSend(v5, "addObject:", v9);

    }
  }
  else
  {
    -[LighthouseShadowEvaluator getDateString:](self, "getDateString:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("LighthouseShadowEvaluator: no SiriIntent events are detected at time: %@"), v7);
  }

  return v5;
}

- (id)evaluateAppLaunchedTasks:(id)a3 startTime:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
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
  id v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  uint64_t v34;
  void *v35;
  StitchableInteraction *v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  SiriTasksEvaluationResult *v50;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v57;
  id v58;
  uint64_t v59;
  id obj;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v55 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v52 = (void *)objc_opt_new();
  v53 = v6;
  v54 = v5;
  +[BiomeUtils getEventsFromStream:startingAt:until:](BiomeUtils, "getEventsFromStream:startingAt:until:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("LighthouseShadowEvaluator: the amount of data for evaluation: %ld"), objc_msgSend(v7, "count"));
  v58 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v63;
    v57 = *(_QWORD *)v63;
    do
    {
      v11 = 0;
      v59 = v9;
      do
      {
        if (*(_QWORD *)v63 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x2199B12EC]();
        objc_msgSend(v12, "eventBody");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "intentClass");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("INStartCallIntent"));

        if ((v16 & 1) != 0)
        {
          v17 = (void *)MEMORY[0x24BDD1620];
          v18 = objc_opt_class();
          objc_msgSend(v14, "interaction");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = 0;
          objc_msgSend(v17, "unarchivedObjectOfClass:fromData:error:", v18, v19, &v61);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("LighthouseShadowEvaluator: Interaction %@"), v21);
          objc_msgSend(v20, "intent");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "_className");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "intent");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "identifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "dateInterval");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "startDate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v27;
          if (v27)
          {
            v29 = v27;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCE60], "date");
            v29 = (id)objc_claimAutoreleasedReturnValue();
          }
          v30 = v29;

          objc_msgSend(v20, "dateInterval");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "duration");
          if (v32 == 0.0)
            v33 = 0.0;
          else
            v33 = v32;

          v34 = objc_msgSend(v20, "_donatedBySiri");
          objc_msgSend(v20, "dateInterval");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("LighthouseShadowEvaluator: Interaction dateinterval %@, identifier %@, isDonatedBySiri %d"), v35, v25, v34);

          v36 = -[StitchableInteraction initWithType:identifier:startDate:duration:isDonatedBySiri:]([StitchableInteraction alloc], "initWithType:identifier:startDate:duration:isDonatedBySiri:", v23, v25, v30, v34, v33);
          objc_msgSend(v58, "addObject:", v36);

          v9 = v59;
          v10 = v57;
        }
        else
        {
          NSLog(CFSTR("LighthouseShadowEvaluator: skip the non-INStartCallIntent interactions"));
        }

        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
    }
    while (v9);
  }

  v37 = v58;
  v38 = (id)objc_msgSend(v58, "sortedArrayUsingComparator:", &__block_literal_global_0);
  if ((unint64_t)objc_msgSend(v58, "count") >= 2)
  {
    v39 = 1;
    do
    {
      v40 = (void *)MEMORY[0x2199B12EC]();
      objc_msgSend(v37, "objectAtIndex:", v39);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v39 - 1;
      objc_msgSend(v37, "objectAtIndex:", v39 - 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v41, "isDonatedBySiri") & 1) == 0 && objc_msgSend(v43, "isDonatedBySiri"))
      {
        objc_msgSend(v41, "startDate");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[LighthouseShadowEvaluator fetchSiriIntentEvents:](self, "fetchSiriIntentEvents:", v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v45, "count"))
        {
          objc_msgSend(v45, "firstObject");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "intentId");
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          -[LighthouseShadowEvaluator getTaskConfigurationFromInteractionID:](self, "getTaskConfigurationFromInteractionID:", v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = v48;
          if (v48)
            minCallDurationInSeconds = objc_msgSend(v48, "minDurationInSeconds");
          else
            NSLog(CFSTR("LighthouseShadowEvaluator: Fail to derive the taskConfiguration with intendID %@"), v47);
          v50 = -[SiriTasksEvaluationResult initWithTaskId:isEffectiveTask:isSuccessfulTask:]([SiriTasksEvaluationResult alloc], "initWithTaskId:isEffectiveTask:isSuccessfulTask:", v47, 1, -[LighthouseShadowEvaluator evaluateTaskSuccess:finalInteraction:](self, "evaluateTaskSuccess:finalInteraction:", v45, v41));
          objc_msgSend(v55, "addObject:", v50);

        }
        else
        {
          -[LighthouseShadowEvaluator getDateString:](self, "getDateString:", v44);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("LighthouseShadowEvaluator: no siriIntentEvents with startDate %@"), v47);
        }

        v37 = v58;
      }

      objc_autoreleasePoolPop(v40);
      v39 = v42 + 2;
    }
    while (v42 + 2 < (unint64_t)objc_msgSend(v37, "count"));
  }

  return v55;
}

uint64_t __64__LighthouseShadowEvaluator_evaluateAppLaunchedTasks_startTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)fetchSiriIntentEvents:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  SiriIntentEvent *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id obj;
  id v33;
  uint64_t v34;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v33 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = v3;
  objc_msgSend(v4, "dateByAddingTimeInterval:", -60.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  +[BiomeUtils getEventsFromStream:startingAt:until:](BiomeUtils, "getEventsFromStream:startingAt:until:", v6, v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("LighthouseShadowEvaluator: Number of siri intent events: %@"), v8);

  if (objc_msgSend(v7, "count"))
  {
    v29 = v6;
    v30 = v5;
    v31 = v4;
    objc_msgSend(v7, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "eventBody");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "intentId");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v28 = v7;
    obj = v7;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v9)
    {
      v10 = v9;
      v34 = *(_QWORD *)v38;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v38 != v34)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v12, "eventBody");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "intentId");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", v36);

          if (!v15)
          {

            goto LABEL_14;
          }
          objc_msgSend(v13, "intentId");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "eventType");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "eventData");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)MEMORY[0x24BDBCE60];
          objc_msgSend(v12, "timestamp");
          objc_msgSend(v19, "dateWithTimeIntervalSinceReferenceDate:");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v12);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("LighthouseShadowEvaluator: The SiriIntent event is: %@"), v21);
          v22 = -[LighthouseShadowEvaluator getIntentEventType:](self, "getIntentEventType:", v17);
          v23 = -[SiriIntentEvent initWithIntentId:eventType:eventData:createdAt:]([SiriIntentEvent alloc], "initWithIntentId:eventType:eventData:createdAt:", v16, v22, v18, v20);
          if (v22 <= 5)
            objc_msgSend(v33, "addObject:", v23);

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_14:

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v33, "count"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("LighthouseShadowEvaluator: number of siriIntentEvents with intentID %@: %@"), v36, v24);

    v5 = v30;
    v4 = v31;
    v7 = v28;
    v6 = v29;
  }
  else
  {
    NSLog(CFSTR("LighthouseShadowEvaluator: knowledgeStore executeQuery return zero Siri Intents"));
  }

  return v33;
}

- (id)getLastEvaluationTime:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  LighthouseShadowEvaluator *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "BMModelDataStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v23 = self;
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v4, "BMModelDataStream");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "publisher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "bmReceiveInputBlock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "filterWithIsIncluded:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[BiomeUtils getEventsFromPublisher:](BiomeUtils, "getEventsFromPublisher:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v16 = (void *)MEMORY[0x24BDBCE60];
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v15), "timestamp");
          objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v17);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v13);
    }
    if (objc_msgSend(v6, "count"))
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", 0, 1);
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sortUsingDescriptors:", v19);

      objc_msgSend(v6, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[LighthouseShadowEvaluator getDateString:](v23, "getDateString:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("LighthouseShadowEvaluator: last evaluation time is: %@"), v21);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

- (BOOL)isPSEBasedCandidateModel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "BMModelDataStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "BMModelDataStream");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("LighthouseShadowEvaluator: isPSEBasedCandidateModel with streamIdentifider: %@"), v5);

    objc_msgSend(v3, "BMModelDataStream");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v7, "isEqualToString:", CFSTR("Siri.PostSiriEngagement"));

  }
  return (char)v4;
}

- (id)evaluateWithPSEBasedModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _TtC19SiriTasksEvaluation26SimpleTaskSuccessEvaluator *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  BiomeLibrary();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "Siri");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "PostSiriEngagement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "publisher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bmReceiveInputBlock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "filterWithIsIncluded:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[BiomeUtils getEventsFromPublisher:](BiomeUtils, "getEventsFromPublisher:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(_TtC19SiriTasksEvaluation26SimpleTaskSuccessEvaluator);
  -[SimpleTaskSuccessEvaluator evaluateWithPseEvents:](v13, "evaluateWithPseEvents:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[LighthouseShadowEvaluator setJsonSELFResults:](self, "setJsonSELFResults:", v14);

  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "setMetricName:", CFSTR("taskSuccessMetric"));
  objc_msgSend(v15, "setMetricValue:", 0.5);
  objc_msgSend(v15, "setNumberOfPositiveSamples:", 5);
  objc_msgSend(v15, "setNumberOfSamples:", 10);
  objc_msgSend(v5, "addModelEvaluationResults:", v15);

  return v5;
}

- (id)evaluateWithModel:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "BMModelDataStream");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6
    || (v7 = (void *)v6,
        objc_msgSend(v4, "bmReceiveInputBlock"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
    NSLog(CFSTR("LighthouseShadowEvaluator error: evaluateWithModel with a nil bmReceiveInputBlock"));
    v9 = v5;
    goto LABEL_6;
  }
  if (-[LighthouseShadowEvaluator isPSEBasedCandidateModel:](self, "isPSEBasedCandidateModel:", v4))
  {
    -[LighthouseShadowEvaluator evaluateWithPSEBasedModel:](self, "evaluateWithPSEBasedModel:", v4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v10 = v9;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[LighthouseShadowEvaluator getLastEvaluationTime:](self, "getLastEvaluationTime:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "absoluteString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[LighthouseShadowEvaluator getDateString:](self, "getDateString:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("LighthouseShadowEvaluator: evaluateWithModel with candidateModel URL: %@, startTime: %@"), v15, v16);

  objc_msgSend(v12, "dateByAddingTimeInterval:", -10800.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v17;
  if (objc_msgSend(v13, "compare:", v17) == -1)
  {
    v18 = v17;

    -[LighthouseShadowEvaluator getDateString:](self, "getDateString:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("LighthouseShadowEvaluator: evaluateWithModel with new startTime: %@"), v19);

    v13 = v18;
  }
  -[LighthouseShadowEvaluator evaluateAbandonedSiriTasks:](self, "evaluateAbandonedSiriTasks:", v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v12;
  -[LighthouseShadowEvaluator evaluateAppLaunchedTasks:startTime:](self, "evaluateAppLaunchedTasks:startTime:", v12, v13);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x24BDBCEB8];
  v35 = (void *)v21;
  v36 = v20;
  objc_msgSend(v20, "arrayByAddingObjectsFromArray:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "arrayWithArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[LighthouseShadowEvaluator setEvaluationResults:](self, "setEvaluationResults:", v24);

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[LighthouseShadowEvaluator evaluationResults](self, "evaluationResults");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v26)
  {
    v27 = v26;
    LODWORD(v28) = 0;
    LODWORD(v29) = 0;
    v30 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v40 != v30)
          objc_enumerationMutation(v25);
        v32 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        v29 = v29 + objc_msgSend(v32, "isSuccessfulTask");
        v28 = v28 + objc_msgSend(v32, "isEffectiveTask");
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v27);
  }
  else
  {
    v28 = 0;
    v29 = 0;
  }

  v33 = (void *)objc_opt_new();
  objc_msgSend(v33, "setMetricName:", CFSTR("taskSuccessMetric"));
  objc_msgSend(v33, "setMetricValue:", (double)v29 * 100.0 / (double)v28);
  objc_msgSend(v33, "setNumberOfPositiveSamples:", v29);
  objc_msgSend(v33, "setNumberOfSamples:", v28);
  objc_msgSend(v33, "metricName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("LighthouseShadowEvaluator: %@ evaluation results with positive samples %u and samples %u"), v34, v29, v28);

  objc_msgSend(v5, "addModelEvaluationResults:", v33);
  v10 = v5;

LABEL_7:
  return v10;
}

- (id)personalizeModel:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "modelURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("LighthouseShadowEvaluator: personalizeModel with candidateModel URL: %@"), v4);

  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setIsDefaultModel:", 0);
  return v5;
}

- (id)generateCandidateModels:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (v3)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", CFSTR("test_URL"));
    objc_msgSend(MEMORY[0x24BE0C0A8], "streamIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v3);

    v8 = "false";
    if (v7)
      v8 = "true";
    NSLog(CFSTR("LighthouseShadowEvaluationPlugin: %@ is a PublicStream :%s"), v3, v8);
    if (v7)
    {
      v9 = objc_msgSend(MEMORY[0x24BE0C0A8], "streamForStreamIdentifier:", v3);
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0CD88]), "initWithPublicStream:", v9);
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6DF80]), "initWithModelURL:withBiomeStream:andMetadata:", v5, v10, 0);

    }
    else
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6DF80]), "initWithModelURL:withBiomeStreamIdentifier:andMetadata:", v5, v3, 0);
    }
    objc_msgSend(v11, "setModelTag:", CFSTR("default_model"));
    objc_msgSend(v11, "setIsDefaultModel:", 1);
    objc_msgSend(v4, "addObject:", v11);

  }
  else
  {
    NSLog(CFSTR("LighthouseShadowEvaluationPlugin: Fail to set the defaultModel"));
  }

  return v4;
}

- (int64_t)getIntentEventType:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  int64_t v6;

  v3 = (void *)MEMORY[0x24BDBCE30];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:", CFSTR("intentStart"), CFSTR("intentResult"), CFSTR("disambiguationOffer"), CFSTR("disambiguationResult"), CFSTR("confirmationOffer"), CFSTR("confirmationResult"), CFSTR("entityRejection"), CFSTR("customSignal"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return v6;
}

- (id)getTaskConfigurationFromInteractionID:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  SiriTaskConfiguration *v6;
  uint64_t v7;
  uint64_t i;
  SiriTaskConfiguration *v9;
  SiriTaskConfiguration *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  SiriTaskConfiguration *v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  +[FeatureStoreUtils retrieveFeatureDataWithStreamId:interactionId:](_TtC19SiriTasksEvaluation17FeatureStoreUtils, "retrieveFeatureDataWithStreamId:interactionId:", CFSTR("SIRITaskConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v3);
        v9 = -[SiriTaskConfiguration initWithJSONData:]([SiriTaskConfiguration alloc], "initWithJSONData:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
        v10 = v9;
        if (v6)
        {
          -[SiriTaskConfiguration eventTime](v6, "eventTime");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[SiriTaskConfiguration eventTime](v10, "eventTime");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "compare:", v12);

          if (v13 == -1)
          {
            v14 = v10;

            v6 = v14;
          }
        }
        else
        {
          v6 = v9;
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSMutableArray)evaluationResults
{
  return self->_evaluationResults;
}

- (void)setEvaluationResults:(id)a3
{
  objc_storeStrong((id *)&self->_evaluationResults, a3);
}

- (NSMutableDictionary)jsonSELFResults
{
  return self->_jsonSELFResults;
}

- (void)setJsonSELFResults:(id)a3
{
  objc_storeStrong((id *)&self->_jsonSELFResults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsonSELFResults, 0);
  objc_storeStrong((id *)&self->_evaluationResults, 0);
}

@end
