@implementation PLBackgroundJobCriteria

- (PLBackgroundJobCriteria)initWithName:(id)a3 shortCode:(id)a4 xpcActivityPriority:(unint64_t)a5 allowBattery:(BOOL)a6 gracePeriod:(int64_t)a7 delay:(int64_t)a8 requireScreenSleep:(BOOL)a9 cpuIntensive:(BOOL)a10 memoryIntensive:(BOOL)a11 requireInexpensiveNetworkConnectivity:(BOOL)a12 requireConcurrencyLimit:(BOOL)a13 overrideRateLimiting:(BOOL)a14 involvedProcesses:(id)a15
{
  id v21;
  PLBackgroundJobCriteria *v22;
  uint64_t v23;
  NSString *name;
  uint64_t v25;
  NSString *shortCode;
  uint64_t v27;
  NSArray *involvedProcesses;
  void *v29;
  uint64_t v30;
  NSString *activityIdentifier;
  id v33;
  id v34;
  objc_super v35;

  v34 = a3;
  v33 = a4;
  v21 = a15;
  v35.receiver = self;
  v35.super_class = (Class)PLBackgroundJobCriteria;
  v22 = -[PLBackgroundJobCriteria init](&v35, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v34, "copy");
    name = v22->_name;
    v22->_name = (NSString *)v23;

    v25 = objc_msgSend(v33, "copy");
    shortCode = v22->_shortCode;
    v22->_shortCode = (NSString *)v25;

    v22->_xpcActivityPriority = a5;
    v22->_allowBattery = a6;
    v22->_gracePeriod = a7;
    v22->_delay = a8;
    v22->_requireScreenSleep = a9;
    v22->_cpuIntensive = a10;
    v22->_memoryIntensive = a11;
    v22->_requireInexpensiveNetworkConnectivity = a12;
    v22->_requireConcurrencyLimit = a13;
    v22->_overrideRateLimiting = a14;
    v27 = objc_msgSend(v21, "copy");
    involvedProcesses = v22->_involvedProcesses;
    v22->_involvedProcesses = (NSArray *)v27;

    -[NSString stringByReplacingOccurrencesOfString:withString:](v22->_name, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E36789C0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.%s.backgroundjobservice.%@"), "assetsd", v29);
    activityIdentifier = v22->_activityIdentifier;
    v22->_activityIdentifier = (NSString *)v30;

  }
  return v22;
}

- (id)xpcCriteria
{
  xpc_object_t v3;
  int64_t delay;
  xpc_object_t v5;
  unint64_t xpcActivityPriority;
  const char **v7;
  xpc_object_t v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  xpc_object_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C80898], 0);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C80738], self->_allowBattery);
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E0C80790], self->_gracePeriod);
  delay = self->_delay;
  if (delay >= 1)
    xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E0C80760], delay);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C808D8], self->_requireScreenSleep);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C80758], self->_cpuIntensive);
  if (self->_memoryIntensive)
    xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C80808], 1);
  if (self->_requireConcurrencyLimit)
  {
    xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x1E0C807A0], "com.apple.assetsd.backgroundJobService.concurrencygroupname");
    xpc_dictionary_set_uint64(v3, (const char *)*MEMORY[0x1E0C80798], 1uLL);
  }
  if (self->_overrideRateLimiting)
  {
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v5, "com.apple.das.overrideRateLimiting", 1);
    xpc_dictionary_set_value(v3, (const char *)*MEMORY[0x1E0C80778], v5);

  }
  xpcActivityPriority = self->_xpcActivityPriority;
  if (xpcActivityPriority)
  {
    if (xpcActivityPriority != 1)
      goto LABEL_14;
    v7 = (const char **)MEMORY[0x1E0C80888];
  }
  else
  {
    v7 = (const char **)MEMORY[0x1E0C80880];
  }
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x1E0C80878], *v7);
LABEL_14:
  if (-[NSArray count](self->_involvedProcesses, "count"))
  {
    v8 = xpc_array_create(0, 0);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = self->_involvedProcesses;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13));
          v15 = xpc_string_create((const char *)objc_msgSend(v14, "UTF8String", (_QWORD)v17));
          xpc_array_append_value(v8, v15);

          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

    xpc_dictionary_set_value(v3, (const char *)*MEMORY[0x1E0C807F8], v8);
  }
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C808B8], 1);
  return v3;
}

- (id)description
{
  const __CFString *v2;

  if (self->_xpcActivityPriority)
    v2 = CFSTR("utility");
  else
    v2 = CFSTR("maintenance");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Criteria: %@ | Short: %@ | Priority: %@ | Battery: %d | Grace: %zd | Delay: %zd | ScreenSleep: %d | CPUIntensive: %d | MemoryIntensive: %d | InexpensiveNetwork: %d | ConcurrencyLimit: %d | OverrideRateLimiting: %d | InvolvedProcesses: %@]"), self->_name, self->_shortCode, v2, self->_allowBattery, self->_gracePeriod, self->_delay, self->_requireScreenSleep, self->_cpuIntensive, self->_memoryIntensive, self->_requireInexpensiveNetworkConnectivity, self->_requireConcurrencyLimit, self->_overrideRateLimiting, self->_involvedProcesses);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSArray *involvedProcesses;
  NSArray *v7;
  NSArray *v8;
  char v9;
  NSArray *v11;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    if (PLObjectIsEqual()
      && PLObjectIsEqual()
      && self->_xpcActivityPriority == v5[4]
      && self->_allowBattery == *((unsigned __int8 *)v5 + 40)
      && self->_gracePeriod == v5[6]
      && self->_delay == v5[7]
      && self->_requireScreenSleep == *((unsigned __int8 *)v5 + 64)
      && self->_cpuIntensive == *((unsigned __int8 *)v5 + 65)
      && self->_memoryIntensive == *((unsigned __int8 *)v5 + 66)
      && self->_requireInexpensiveNetworkConnectivity == *((unsigned __int8 *)v5 + 67)
      && self->_requireConcurrencyLimit == *((unsigned __int8 *)v5 + 68)
      && self->_overrideRateLimiting == *((unsigned __int8 *)v5 + 69))
    {
      involvedProcesses = self->_involvedProcesses;
      v7 = (NSArray *)v5[9];
      v8 = involvedProcesses;
      v11 = v8;
      if (v8 == v7)
        v9 = 1;
      else
        v9 = -[NSArray isEqual:](v8, "isEqual:", v7);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_shortCode, "hash");
  v4 = -[NSString hash](self->_name, "hash") ^ v3 ^ self->_xpcActivityPriority ^ self->_allowBattery ^ self->_gracePeriod ^ self->_delay ^ self->_requireScreenSleep ^ self->_cpuIntensive ^ self->_memoryIntensive;
  v5 = self->_requireInexpensiveNetworkConnectivity ^ (unint64_t)self->_requireConcurrencyLimit ^ self->_overrideRateLimiting;
  return v4 ^ v5 ^ -[NSArray hash](self->_involvedProcesses, "hash");
}

- (NSString)shortCode
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)activityIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_involvedProcesses, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_shortCode, 0);
}

+ (id)criteriaForUrgentResourceWorker
{
  uint64_t v3;

  WORD2(v3) = 257;
  LODWORD(v3) = 0x10000;
  return -[PLBackgroundJobCriteria initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:]([PLBackgroundJobCriteria alloc], "initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:", CFSTR("urgent resource"), CFSTR("U"), 1, 1, 1, 30, v3, 0);
}

+ (id)criteriaForHighPriorityRenderDerivativesWorker
{
  uint64_t v3;

  WORD2(v3) = 257;
  LODWORD(v3) = 0;
  return -[PLBackgroundJobCriteria initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:]([PLBackgroundJobCriteria alloc], "initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:", CFSTR("render derivatives high"), CFSTR("I"), 1, 1, 1, 0, v3, 0);
}

+ (id)criteriaForDiscretionaryResourceWorker
{
  PLBackgroundJobCriteria *v2;
  uint64_t v4;

  v2 = [PLBackgroundJobCriteria alloc];
  WORD2(v4) = 0;
  LODWORD(v4) = 257;
  return -[PLBackgroundJobCriteria initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:](v2, "initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:", CFSTR("discretionary resource"), CFSTR("D"), 0, 1, *MEMORY[0x1E0C807B0], 0, v4, 0);
}

+ (id)criteriaForHubbleWorker
{
  PLBackgroundJobCriteria *v2;
  uint64_t v4;

  v2 = [PLBackgroundJobCriteria alloc];
  WORD2(v4) = 257;
  LODWORD(v4) = 256;
  return -[PLBackgroundJobCriteria initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:](v2, "initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:", CFSTR("hubble"), CFSTR("H"), 0, 0, *MEMORY[0x1E0C807B0], 0, v4, 0);
}

+ (id)criteriaForHubbleNetworkDownloadWorker
{
  PLBackgroundJobCriteria *v2;
  uint64_t v4;

  v2 = [PLBackgroundJobCriteria alloc];
  WORD2(v4) = 0;
  LODWORD(v4) = 16777473;
  return -[PLBackgroundJobCriteria initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:](v2, "initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:", CFSTR("hubble network download"), CFSTR("N"), 0, 0, *MEMORY[0x1E0C807F0], 0, v4, 0);
}

+ (id)criteriaForHighPrioritySearchIndexingWorker
{
  uint64_t v3;

  WORD2(v3) = 256;
  LODWORD(v3) = 0;
  return -[PLBackgroundJobCriteria initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:]([PLBackgroundJobCriteria alloc], "initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:", CFSTR("high priority search indexing"), CFSTR("P"), 1, 1, 1, 0, v3, &unk_1E3763AD0);
}

+ (id)criteriaForLowPrioritySearchWorker
{
  PLBackgroundJobCriteria *v2;
  uint64_t v4;

  v2 = [PLBackgroundJobCriteria alloc];
  WORD2(v4) = 0;
  LODWORD(v4) = 257;
  return -[PLBackgroundJobCriteria initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:](v2, "initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:", CFSTR("low priority search"), CFSTR("S"), 0, 1, *MEMORY[0x1E0C807D8], *MEMORY[0x1E0C807B0], v4, &unk_1E3763AD0);
}

+ (id)criteriaForDuplicateDetectorWorker
{
  PLBackgroundJobCriteria *v2;
  uint64_t v4;

  v2 = [PLBackgroundJobCriteria alloc];
  WORD2(v4) = 1;
  LODWORD(v4) = 257;
  return -[PLBackgroundJobCriteria initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:](v2, "initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:", CFSTR("duplicate detector"), CFSTR("M"), 0, 0, *MEMORY[0x1E0C807D8], 0, v4, 0);
}

+ (id)criteriaForAssetStackWorker
{
  PLBackgroundJobCriteria *v2;
  uint64_t v4;

  v2 = [PLBackgroundJobCriteria alloc];
  WORD2(v4) = 1;
  LODWORD(v4) = 1;
  return -[PLBackgroundJobCriteria initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:](v2, "initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:", CFSTR("asset stack"), CFSTR("A"), 0, 1, *MEMORY[0x1E0C807B0], 0, v4, 0);
}

+ (id)criteriaForFeatureAvailabilityWorker
{
  PLBackgroundJobCriteria *v2;
  uint64_t v4;

  v2 = [PLBackgroundJobCriteria alloc];
  WORD2(v4) = 1;
  LODWORD(v4) = 1;
  return -[PLBackgroundJobCriteria initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:](v2, "initWithName:shortCode:xpcActivityPriority:allowBattery:gracePeriod:delay:requireScreenSleep:cpuIntensive:memoryIntensive:requireInexpensiveNetworkConnectivity:requireConcurrencyLimit:overrideRateLimiting:involvedProcesses:", CFSTR("feature availability"), CFSTR("F"), 0, 0, *MEMORY[0x1E0C807B8], 0, v4, 0);
}

+ (id)allKnownCriterias
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PLBackgroundJobCriteria_allKnownCriterias__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allKnownCriterias_onceToken != -1)
    dispatch_once(&allKnownCriterias_onceToken, block);
  return (id)allKnownCriterias_allKnownCriterias;
}

+ (PLBackgroundJobCriteria)criteriaWithKnownShortCode:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "allKnownCriterias", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "shortCode");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return (PLBackgroundJobCriteria *)v6;
}

+ (id)allKnownShortCodes
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "allKnownCriterias");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pl_map:", &__block_literal_global_44092);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __45__PLBackgroundJobCriteria_allKnownShortCodes__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shortCode");
}

void __44__PLBackgroundJobCriteria_allKnownCriterias__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "criteriaForUrgentResourceWorker");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "criteriaForDiscretionaryResourceWorker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "criteriaForHubbleWorker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "criteriaForHubbleNetworkDownloadWorker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "criteriaForHighPrioritySearchIndexingWorker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "criteriaForLowPrioritySearchWorker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "criteriaForDuplicateDetectorWorker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "criteriaForHighPriorityRenderDerivativesWorker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "criteriaForAssetStackWorker");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "criteriaForFeatureAvailabilityWorker");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObjects:", v14, v3, v4, v5, v6, v7, v8, v9, v10, v11, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)allKnownCriterias_allKnownCriterias;
  allKnownCriterias_allKnownCriterias = v12;

}

@end
