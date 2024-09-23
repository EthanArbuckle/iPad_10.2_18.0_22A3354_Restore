@implementation AeroMLTracerSpanEvent

- (BOOL)hasDeviceIdentifier
{
  return self->_deviceIdentifier != 0;
}

- (BOOL)hasTestKey
{
  return self->_testKey != 0;
}

- (BOOL)hasVersion
{
  return self->_version != 0;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasTrialDeploymentId
{
  return self->_trialDeploymentId != 0;
}

- (BOOL)hasTrialExperimentId
{
  return self->_trialExperimentId != 0;
}

- (BOOL)hasTrialTreatmentId
{
  return self->_trialTreatmentId != 0;
}

- (BOOL)hasTraceId
{
  return self->_traceId != 0;
}

- (BOOL)hasParentSpanId
{
  return self->_parentSpanId != 0;
}

- (BOOL)hasSpanId
{
  return self->_spanId != 0;
}

- (void)setPrivatizedStartTime:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_privatizedStartTime = a3;
}

- (void)setHasPrivatizedStartTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasPrivatizedStartTime
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setPrivatizedEndTime:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_privatizedEndTime = a3;
}

- (void)setHasPrivatizedEndTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPrivatizedEndTime
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setIntervalInMilliSeconds:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_intervalInMilliSeconds = a3;
}

- (void)setHasIntervalInMilliSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIntervalInMilliSeconds
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasErrorString
{
  return self->_errorString != 0;
}

- (void)setErrorCode:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasErrorCode
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setStartMemoryLevelInKB:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_startMemoryLevelInKB = a3;
}

- (void)setHasStartMemoryLevelInKB:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasStartMemoryLevelInKB
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setEndMemoryLevelInKB:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_endMemoryLevelInKB = a3;
}

- (void)setHasEndMemoryLevelInKB:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEndMemoryLevelInKB
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setMemoryLevelDeltaInKB:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_memoryLevelDeltaInKB = a3;
}

- (void)setHasMemoryLevelDeltaInKB:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMemoryLevelDeltaInKB
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasProcessName
{
  return self->_processName != 0;
}

- (BOOL)hasGcdQueueName
{
  return self->_gcdQueueName != 0;
}

- (BOOL)hasQosClassName
{
  return self->_qosClassName != 0;
}

- (BOOL)hasRelativePriority
{
  return self->_relativePriority != 0;
}

- (BOOL)hasProjectName
{
  return self->_projectName != 0;
}

- (void)clearAttributes
{
  -[NSMutableArray removeAllObjects](self->_attributes, "removeAllObjects");
}

- (void)addAttributes:(id)a3
{
  id v4;
  NSMutableArray *attributes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  attributes = self->_attributes;
  v8 = v4;
  if (!attributes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_attributes;
    self->_attributes = v6;

    v4 = v8;
    attributes = self->_attributes;
  }
  -[NSMutableArray addObject:](attributes, "addObject:", v4);

}

- (unint64_t)attributesCount
{
  return -[NSMutableArray count](self->_attributes, "count");
}

- (id)attributesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_attributes, "objectAtIndex:", a3);
}

+ (Class)attributesType
{
  return (Class)objc_opt_class();
}

- (void)clearInfoEvents
{
  -[NSMutableArray removeAllObjects](self->_infoEvents, "removeAllObjects");
}

- (void)addInfoEvents:(id)a3
{
  id v4;
  NSMutableArray *infoEvents;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  infoEvents = self->_infoEvents;
  v8 = v4;
  if (!infoEvents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_infoEvents;
    self->_infoEvents = v6;

    v4 = v8;
    infoEvents = self->_infoEvents;
  }
  -[NSMutableArray addObject:](infoEvents, "addObject:", v4);

}

- (unint64_t)infoEventsCount
{
  return -[NSMutableArray count](self->_infoEvents, "count");
}

- (id)infoEventsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_infoEvents, "objectAtIndex:", a3);
}

+ (Class)infoEventsType
{
  return (Class)objc_opt_class();
}

- (void)clearWarningEvents
{
  -[NSMutableArray removeAllObjects](self->_warningEvents, "removeAllObjects");
}

- (void)addWarningEvents:(id)a3
{
  id v4;
  NSMutableArray *warningEvents;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  warningEvents = self->_warningEvents;
  v8 = v4;
  if (!warningEvents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_warningEvents;
    self->_warningEvents = v6;

    v4 = v8;
    warningEvents = self->_warningEvents;
  }
  -[NSMutableArray addObject:](warningEvents, "addObject:", v4);

}

- (unint64_t)warningEventsCount
{
  return -[NSMutableArray count](self->_warningEvents, "count");
}

- (id)warningEventsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_warningEvents, "objectAtIndex:", a3);
}

+ (Class)warningEventsType
{
  return (Class)objc_opt_class();
}

- (void)clearDebugEvents
{
  -[NSMutableArray removeAllObjects](self->_debugEvents, "removeAllObjects");
}

- (void)addDebugEvents:(id)a3
{
  id v4;
  NSMutableArray *debugEvents;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  debugEvents = self->_debugEvents;
  v8 = v4;
  if (!debugEvents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_debugEvents;
    self->_debugEvents = v6;

    v4 = v8;
    debugEvents = self->_debugEvents;
  }
  -[NSMutableArray addObject:](debugEvents, "addObject:", v4);

}

- (unint64_t)debugEventsCount
{
  return -[NSMutableArray count](self->_debugEvents, "count");
}

- (id)debugEventsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_debugEvents, "objectAtIndex:", a3);
}

+ (Class)debugEventsType
{
  return (Class)objc_opt_class();
}

- (void)clearErrorEvents
{
  -[NSMutableArray removeAllObjects](self->_errorEvents, "removeAllObjects");
}

- (void)addErrorEvents:(id)a3
{
  id v4;
  NSMutableArray *errorEvents;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  errorEvents = self->_errorEvents;
  v8 = v4;
  if (!errorEvents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_errorEvents;
    self->_errorEvents = v6;

    v4 = v8;
    errorEvents = self->_errorEvents;
  }
  -[NSMutableArray addObject:](errorEvents, "addObject:", v4);

}

- (unint64_t)errorEventsCount
{
  return -[NSMutableArray count](self->_errorEvents, "count");
}

- (id)errorEventsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_errorEvents, "objectAtIndex:", a3);
}

+ (Class)errorEventsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)AeroMLTracerSpanEvent;
  -[AeroMLTracerSpanEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AeroMLTracerSpanEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *deviceIdentifier;
  NSString *testKey;
  NSString *version;
  NSString *name;
  NSString *trialDeploymentId;
  NSString *trialExperimentId;
  NSString *trialTreatmentId;
  NSString *traceId;
  NSString *parentSpanId;
  NSString *spanId;
  char has;
  void *v16;
  NSString *errorString;
  char v18;
  void *v19;
  NSString *processName;
  NSString *gcdQueueName;
  NSString *qosClassName;
  NSString *relativePriority;
  NSString *projectName;
  void *v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  NSMutableArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  void *v45;
  void *v46;
  NSMutableArray *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t m;
  void *v52;
  void *v53;
  NSMutableArray *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t n;
  void *v59;
  id v60;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier)
    objc_msgSend(v3, "setObject:forKey:", deviceIdentifier, CFSTR("deviceIdentifier"));
  testKey = self->_testKey;
  if (testKey)
    objc_msgSend(v4, "setObject:forKey:", testKey, CFSTR("testKey"));
  version = self->_version;
  if (version)
    objc_msgSend(v4, "setObject:forKey:", version, CFSTR("version"));
  name = self->_name;
  if (name)
    objc_msgSend(v4, "setObject:forKey:", name, CFSTR("name"));
  trialDeploymentId = self->_trialDeploymentId;
  if (trialDeploymentId)
    objc_msgSend(v4, "setObject:forKey:", trialDeploymentId, CFSTR("trialDeploymentId"));
  trialExperimentId = self->_trialExperimentId;
  if (trialExperimentId)
    objc_msgSend(v4, "setObject:forKey:", trialExperimentId, CFSTR("trialExperimentId"));
  trialTreatmentId = self->_trialTreatmentId;
  if (trialTreatmentId)
    objc_msgSend(v4, "setObject:forKey:", trialTreatmentId, CFSTR("trialTreatmentId"));
  traceId = self->_traceId;
  if (traceId)
    objc_msgSend(v4, "setObject:forKey:", traceId, CFSTR("traceId"));
  parentSpanId = self->_parentSpanId;
  if (parentSpanId)
    objc_msgSend(v4, "setObject:forKey:", parentSpanId, CFSTR("parentSpanId"));
  spanId = self->_spanId;
  if (spanId)
    objc_msgSend(v4, "setObject:forKey:", spanId, CFSTR("spanId"));
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_privatizedStartTime);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v62, CFSTR("privatizedStartTime"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_23:
      if ((has & 4) == 0)
        goto LABEL_25;
      goto LABEL_24;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_privatizedEndTime);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v63, CFSTR("privatizedEndTime"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_24:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_intervalInMilliSeconds);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("intervalInMilliSeconds"));

  }
LABEL_25:
  errorString = self->_errorString;
  if (errorString)
    objc_msgSend(v4, "setObject:forKey:", errorString, CFSTR("errorString"));
  v18 = (char)self->_has;
  if ((v18 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_errorCode);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v64, CFSTR("errorCode"));

    v18 = (char)self->_has;
    if ((v18 & 0x40) == 0)
    {
LABEL_29:
      if ((v18 & 1) == 0)
        goto LABEL_30;
      goto LABEL_93;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_startMemoryLevelInKB);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v65, CFSTR("startMemoryLevelInKB"));

  v18 = (char)self->_has;
  if ((v18 & 1) == 0)
  {
LABEL_30:
    if ((v18 & 8) == 0)
      goto LABEL_32;
    goto LABEL_31;
  }
LABEL_93:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_endMemoryLevelInKB);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v66, CFSTR("endMemoryLevelInKB"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_31:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_memoryLevelDeltaInKB);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("memoryLevelDeltaInKB"));

  }
LABEL_32:
  processName = self->_processName;
  if (processName)
    objc_msgSend(v4, "setObject:forKey:", processName, CFSTR("processName"));
  gcdQueueName = self->_gcdQueueName;
  if (gcdQueueName)
    objc_msgSend(v4, "setObject:forKey:", gcdQueueName, CFSTR("gcdQueueName"));
  qosClassName = self->_qosClassName;
  if (qosClassName)
    objc_msgSend(v4, "setObject:forKey:", qosClassName, CFSTR("qosClassName"));
  relativePriority = self->_relativePriority;
  if (relativePriority)
    objc_msgSend(v4, "setObject:forKey:", relativePriority, CFSTR("relativePriority"));
  projectName = self->_projectName;
  if (projectName)
    objc_msgSend(v4, "setObject:forKey:", projectName, CFSTR("projectName"));
  if (-[NSMutableArray count](self->_attributes, "count"))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_attributes, "count"));
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v26 = self->_attributes;
    v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v84;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v84 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * i), "dictionaryRepresentation");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v31);

        }
        v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
      }
      while (v28);
    }

    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("attributes"));
  }
  if (-[NSMutableArray count](self->_infoEvents, "count"))
  {
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_infoEvents, "count"));
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v33 = self->_infoEvents;
    v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v80;
      do
      {
        for (j = 0; j != v35; ++j)
        {
          if (*(_QWORD *)v80 != v36)
            objc_enumerationMutation(v33);
          objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * j), "dictionaryRepresentation");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addObject:", v38);

        }
        v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
      }
      while (v35);
    }

    objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("infoEvents"));
  }
  if (-[NSMutableArray count](self->_warningEvents, "count"))
  {
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_warningEvents, "count"));
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v40 = self->_warningEvents;
    v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v76;
      do
      {
        for (k = 0; k != v42; ++k)
        {
          if (*(_QWORD *)v76 != v43)
            objc_enumerationMutation(v40);
          objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * k), "dictionaryRepresentation");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "addObject:", v45);

        }
        v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
      }
      while (v42);
    }

    objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("warningEvents"));
  }
  if (-[NSMutableArray count](self->_debugEvents, "count"))
  {
    v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_debugEvents, "count"));
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v47 = self->_debugEvents;
    v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v71, v88, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v72;
      do
      {
        for (m = 0; m != v49; ++m)
        {
          if (*(_QWORD *)v72 != v50)
            objc_enumerationMutation(v47);
          objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * m), "dictionaryRepresentation");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "addObject:", v52);

        }
        v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v71, v88, 16);
      }
      while (v49);
    }

    objc_msgSend(v4, "setObject:forKey:", v46, CFSTR("debugEvents"));
  }
  if (-[NSMutableArray count](self->_errorEvents, "count"))
  {
    v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_errorEvents, "count"));
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v54 = self->_errorEvents;
    v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v67, v87, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v68;
      do
      {
        for (n = 0; n != v56; ++n)
        {
          if (*(_QWORD *)v68 != v57)
            objc_enumerationMutation(v54);
          objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * n), "dictionaryRepresentation", (_QWORD)v67);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "addObject:", v59);

        }
        v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v67, v87, 16);
      }
      while (v56);
    }

    objc_msgSend(v4, "setObject:forKey:", v53, CFSTR("errorEvents"));
  }
  v60 = v4;

  return v60;
}

- (BOOL)readFrom:(id)a3
{
  return AeroMLTracerSpanEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  char v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t n;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_deviceIdentifier)
    PBDataWriterWriteStringField();
  if (self->_testKey)
    PBDataWriterWriteStringField();
  if (self->_version)
    PBDataWriterWriteStringField();
  if (self->_name)
    PBDataWriterWriteStringField();
  if (self->_trialDeploymentId)
    PBDataWriterWriteStringField();
  if (self->_trialExperimentId)
    PBDataWriterWriteStringField();
  if (self->_trialTreatmentId)
    PBDataWriterWriteStringField();
  if (self->_traceId)
    PBDataWriterWriteStringField();
  if (self->_parentSpanId)
    PBDataWriterWriteStringField();
  if (self->_spanId)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_23:
      if ((has & 4) == 0)
        goto LABEL_25;
      goto LABEL_24;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_23;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_24:
    PBDataWriterWriteUint32Field();
LABEL_25:
  if (self->_errorString)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_processName)
    PBDataWriterWriteStringField();
  v6 = (char)self->_has;
  if ((v6 & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    v6 = (char)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_33:
      if ((v6 & 8) == 0)
        goto LABEL_35;
      goto LABEL_34;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_33;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_34:
    PBDataWriterWriteUint32Field();
LABEL_35:
  if (self->_gcdQueueName)
    PBDataWriterWriteStringField();
  if (self->_qosClassName)
    PBDataWriterWriteStringField();
  if (self->_relativePriority)
    PBDataWriterWriteStringField();
  if (self->_projectName)
    PBDataWriterWriteStringField();
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v7 = self->_attributes;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v49 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    }
    while (v9);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v12 = self->_infoEvents;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v45 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage();
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
    }
    while (v14);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v17 = self->_warningEvents;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v41;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v41 != v20)
          objc_enumerationMutation(v17);
        PBDataWriterWriteSubmessage();
      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
    }
    while (v19);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v22 = self->_debugEvents;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v37;
    do
    {
      for (m = 0; m != v24; ++m)
      {
        if (*(_QWORD *)v37 != v25)
          objc_enumerationMutation(v22);
        PBDataWriterWriteSubmessage();
      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
    }
    while (v24);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v27 = self->_errorEvents;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v32, v52, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v33;
    do
    {
      for (n = 0; n != v29; ++n)
      {
        if (*(_QWORD *)v33 != v30)
          objc_enumerationMutation(v27);
        PBDataWriterWriteSubmessage();
      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v32, v52, 16);
    }
    while (v29);
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  char v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t j;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t k;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t m;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t n;
  void *v26;
  id v27;

  v4 = a3;
  v27 = v4;
  if (self->_deviceIdentifier)
  {
    objc_msgSend(v4, "setDeviceIdentifier:");
    v4 = v27;
  }
  if (self->_testKey)
  {
    objc_msgSend(v27, "setTestKey:");
    v4 = v27;
  }
  if (self->_version)
  {
    objc_msgSend(v27, "setVersion:");
    v4 = v27;
  }
  if (self->_name)
  {
    objc_msgSend(v27, "setName:");
    v4 = v27;
  }
  if (self->_trialDeploymentId)
  {
    objc_msgSend(v27, "setTrialDeploymentId:");
    v4 = v27;
  }
  if (self->_trialExperimentId)
  {
    objc_msgSend(v27, "setTrialExperimentId:");
    v4 = v27;
  }
  if (self->_trialTreatmentId)
  {
    objc_msgSend(v27, "setTrialTreatmentId:");
    v4 = v27;
  }
  if (self->_traceId)
  {
    objc_msgSend(v27, "setTraceId:");
    v4 = v27;
  }
  if (self->_parentSpanId)
  {
    objc_msgSend(v27, "setParentSpanId:");
    v4 = v27;
  }
  if (self->_spanId)
  {
    objc_msgSend(v27, "setSpanId:");
    v4 = v27;
  }
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_DWORD *)v4 + 25) = self->_privatizedStartTime;
    *((_BYTE *)v4 + 208) |= 0x20u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_23:
      if ((has & 4) == 0)
        goto LABEL_25;
      goto LABEL_24;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_23;
  }
  *((_DWORD *)v4 + 24) = self->_privatizedEndTime;
  *((_BYTE *)v4 + 208) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_24:
    *((_DWORD *)v4 + 18) = self->_intervalInMilliSeconds;
    *((_BYTE *)v4 + 208) |= 4u;
  }
LABEL_25:
  if (self->_errorString)
  {
    objc_msgSend(v27, "setErrorString:");
    v4 = v27;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 9) = self->_errorCode;
    *((_BYTE *)v4 + 208) |= 2u;
  }
  if (self->_processName)
  {
    objc_msgSend(v27, "setProcessName:");
    v4 = v27;
  }
  v6 = (char)self->_has;
  if ((v6 & 0x40) != 0)
  {
    *((_DWORD *)v4 + 36) = self->_startMemoryLevelInKB;
    *((_BYTE *)v4 + 208) |= 0x40u;
    v6 = (char)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_33:
      if ((v6 & 8) == 0)
        goto LABEL_35;
      goto LABEL_34;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_33;
  }
  *((_DWORD *)v4 + 8) = self->_endMemoryLevelInKB;
  *((_BYTE *)v4 + 208) |= 1u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_34:
    *((_DWORD *)v4 + 19) = self->_memoryLevelDeltaInKB;
    *((_BYTE *)v4 + 208) |= 8u;
  }
LABEL_35:
  if (self->_gcdQueueName)
    objc_msgSend(v27, "setGcdQueueName:");
  if (self->_qosClassName)
    objc_msgSend(v27, "setQosClassName:");
  if (self->_relativePriority)
    objc_msgSend(v27, "setRelativePriority:");
  if (self->_projectName)
    objc_msgSend(v27, "setProjectName:");
  if (-[AeroMLTracerSpanEvent attributesCount](self, "attributesCount"))
  {
    objc_msgSend(v27, "clearAttributes");
    v7 = -[AeroMLTracerSpanEvent attributesCount](self, "attributesCount");
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
      {
        -[AeroMLTracerSpanEvent attributesAtIndex:](self, "attributesAtIndex:", i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addAttributes:", v10);

      }
    }
  }
  if (-[AeroMLTracerSpanEvent infoEventsCount](self, "infoEventsCount"))
  {
    objc_msgSend(v27, "clearInfoEvents");
    v11 = -[AeroMLTracerSpanEvent infoEventsCount](self, "infoEventsCount");
    if (v11)
    {
      v12 = v11;
      for (j = 0; j != v12; ++j)
      {
        -[AeroMLTracerSpanEvent infoEventsAtIndex:](self, "infoEventsAtIndex:", j);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addInfoEvents:", v14);

      }
    }
  }
  if (-[AeroMLTracerSpanEvent warningEventsCount](self, "warningEventsCount"))
  {
    objc_msgSend(v27, "clearWarningEvents");
    v15 = -[AeroMLTracerSpanEvent warningEventsCount](self, "warningEventsCount");
    if (v15)
    {
      v16 = v15;
      for (k = 0; k != v16; ++k)
      {
        -[AeroMLTracerSpanEvent warningEventsAtIndex:](self, "warningEventsAtIndex:", k);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addWarningEvents:", v18);

      }
    }
  }
  if (-[AeroMLTracerSpanEvent debugEventsCount](self, "debugEventsCount"))
  {
    objc_msgSend(v27, "clearDebugEvents");
    v19 = -[AeroMLTracerSpanEvent debugEventsCount](self, "debugEventsCount");
    if (v19)
    {
      v20 = v19;
      for (m = 0; m != v20; ++m)
      {
        -[AeroMLTracerSpanEvent debugEventsAtIndex:](self, "debugEventsAtIndex:", m);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addDebugEvents:", v22);

      }
    }
  }
  if (-[AeroMLTracerSpanEvent errorEventsCount](self, "errorEventsCount"))
  {
    objc_msgSend(v27, "clearErrorEvents");
    v23 = -[AeroMLTracerSpanEvent errorEventsCount](self, "errorEventsCount");
    if (v23)
    {
      v24 = v23;
      for (n = 0; n != v24; ++n)
      {
        -[AeroMLTracerSpanEvent errorEventsAtIndex:](self, "errorEventsAtIndex:", n);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addErrorEvents:", v26);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  char has;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  char v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  NSMutableArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  NSMutableArray *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  void *v51;
  NSMutableArray *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t k;
  void *v57;
  NSMutableArray *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t m;
  void *v63;
  NSMutableArray *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t n;
  void *v69;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_deviceIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_testKey, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v8;

  v10 = -[NSString copyWithZone:](self->_version, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v10;

  v12 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v12;

  v14 = -[NSString copyWithZone:](self->_trialDeploymentId, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v14;

  v16 = -[NSString copyWithZone:](self->_trialExperimentId, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v16;

  v18 = -[NSString copyWithZone:](self->_trialTreatmentId, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v18;

  v20 = -[NSString copyWithZone:](self->_traceId, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v20;

  v22 = -[NSString copyWithZone:](self->_parentSpanId, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v22;

  v24 = -[NSString copyWithZone:](self->_spanId, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v24;

  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 100) = self->_privatizedStartTime;
    *(_BYTE *)(v5 + 208) |= 0x20u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 96) = self->_privatizedEndTime;
  *(_BYTE *)(v5 + 208) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 72) = self->_intervalInMilliSeconds;
    *(_BYTE *)(v5 + 208) |= 4u;
  }
LABEL_5:
  v27 = -[NSString copyWithZone:](self->_errorString, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v27;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_errorCode;
    *(_BYTE *)(v5 + 208) |= 2u;
  }
  v29 = -[NSString copyWithZone:](self->_processName, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v29;

  v31 = (char)self->_has;
  if ((v31 & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 144) = self->_startMemoryLevelInKB;
    *(_BYTE *)(v5 + 208) |= 0x40u;
    v31 = (char)self->_has;
    if ((v31 & 1) == 0)
    {
LABEL_9:
      if ((v31 & 8) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  *(_DWORD *)(v5 + 32) = self->_endMemoryLevelInKB;
  *(_BYTE *)(v5 + 208) |= 1u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_10:
    *(_DWORD *)(v5 + 76) = self->_memoryLevelDeltaInKB;
    *(_BYTE *)(v5 + 208) |= 8u;
  }
LABEL_11:
  v32 = -[NSString copyWithZone:](self->_gcdQueueName, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v32;

  v34 = -[NSString copyWithZone:](self->_qosClassName, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v34;

  v36 = -[NSString copyWithZone:](self->_relativePriority, "copyWithZone:", a3);
  v37 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v36;

  v38 = -[NSString copyWithZone:](self->_projectName, "copyWithZone:", a3);
  v39 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v38;

  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v40 = self->_attributes;
  v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v88;
    do
    {
      for (i = 0; i != v42; ++i)
      {
        if (*(_QWORD *)v88 != v43)
          objc_enumerationMutation(v40);
        v45 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAttributes:", v45);

      }
      v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
    }
    while (v42);
  }

  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v46 = self->_infoEvents;
  v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v84;
    do
    {
      for (j = 0; j != v48; ++j)
      {
        if (*(_QWORD *)v84 != v49)
          objc_enumerationMutation(v46);
        v51 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addInfoEvents:", v51);

      }
      v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
    }
    while (v48);
  }

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v52 = self->_warningEvents;
  v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v79, v93, 16);
  if (v53)
  {
    v54 = v53;
    v55 = *(_QWORD *)v80;
    do
    {
      for (k = 0; k != v54; ++k)
      {
        if (*(_QWORD *)v80 != v55)
          objc_enumerationMutation(v52);
        v57 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addWarningEvents:", v57);

      }
      v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v79, v93, 16);
    }
    while (v54);
  }

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v58 = self->_debugEvents;
  v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v75, v92, 16);
  if (v59)
  {
    v60 = v59;
    v61 = *(_QWORD *)v76;
    do
    {
      for (m = 0; m != v60; ++m)
      {
        if (*(_QWORD *)v76 != v61)
          objc_enumerationMutation(v58);
        v63 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addDebugEvents:", v63);

      }
      v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v75, v92, 16);
    }
    while (v60);
  }

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v64 = self->_errorEvents;
  v65 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v71, v91, 16);
  if (v65)
  {
    v66 = v65;
    v67 = *(_QWORD *)v72;
    do
    {
      for (n = 0; n != v66; ++n)
      {
        if (*(_QWORD *)v72 != v67)
          objc_enumerationMutation(v64);
        v69 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * n), "copyWithZone:", a3, (_QWORD)v71);
        objc_msgSend((id)v5, "addErrorEvents:", v69);

      }
      v66 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v71, v91, 16);
    }
    while (v66);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *deviceIdentifier;
  NSString *testKey;
  NSString *version;
  NSString *name;
  NSString *trialDeploymentId;
  NSString *trialExperimentId;
  NSString *trialTreatmentId;
  NSString *traceId;
  NSString *parentSpanId;
  NSString *spanId;
  char has;
  NSString *errorString;
  NSString *processName;
  NSString *gcdQueueName;
  NSString *qosClassName;
  NSString *relativePriority;
  NSString *projectName;
  NSMutableArray *attributes;
  NSMutableArray *infoEvents;
  NSMutableArray *warningEvents;
  NSMutableArray *debugEvents;
  NSMutableArray *errorEvents;
  char v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_81;
  deviceIdentifier = self->_deviceIdentifier;
  if ((unint64_t)deviceIdentifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](deviceIdentifier, "isEqual:"))
      goto LABEL_81;
  }
  testKey = self->_testKey;
  if ((unint64_t)testKey | *((_QWORD *)v4 + 19))
  {
    if (!-[NSString isEqual:](testKey, "isEqual:"))
      goto LABEL_81;
  }
  version = self->_version;
  if ((unint64_t)version | *((_QWORD *)v4 + 24))
  {
    if (!-[NSString isEqual:](version, "isEqual:"))
      goto LABEL_81;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_81;
  }
  trialDeploymentId = self->_trialDeploymentId;
  if ((unint64_t)trialDeploymentId | *((_QWORD *)v4 + 21))
  {
    if (!-[NSString isEqual:](trialDeploymentId, "isEqual:"))
      goto LABEL_81;
  }
  trialExperimentId = self->_trialExperimentId;
  if ((unint64_t)trialExperimentId | *((_QWORD *)v4 + 22))
  {
    if (!-[NSString isEqual:](trialExperimentId, "isEqual:"))
      goto LABEL_81;
  }
  trialTreatmentId = self->_trialTreatmentId;
  if ((unint64_t)trialTreatmentId | *((_QWORD *)v4 + 23))
  {
    if (!-[NSString isEqual:](trialTreatmentId, "isEqual:"))
      goto LABEL_81;
  }
  traceId = self->_traceId;
  if ((unint64_t)traceId | *((_QWORD *)v4 + 20))
  {
    if (!-[NSString isEqual:](traceId, "isEqual:"))
      goto LABEL_81;
  }
  parentSpanId = self->_parentSpanId;
  if ((unint64_t)parentSpanId | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](parentSpanId, "isEqual:"))
      goto LABEL_81;
  }
  spanId = self->_spanId;
  if ((unint64_t)spanId | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](spanId, "isEqual:"))
      goto LABEL_81;
  }
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 208) & 0x20) == 0 || self->_privatizedStartTime != *((_DWORD *)v4 + 25))
      goto LABEL_81;
  }
  else if ((*((_BYTE *)v4 + 208) & 0x20) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 208) & 0x10) == 0 || self->_privatizedEndTime != *((_DWORD *)v4 + 24))
      goto LABEL_81;
  }
  else if ((*((_BYTE *)v4 + 208) & 0x10) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 208) & 4) == 0 || self->_intervalInMilliSeconds != *((_DWORD *)v4 + 18))
      goto LABEL_81;
  }
  else if ((*((_BYTE *)v4 + 208) & 4) != 0)
  {
    goto LABEL_81;
  }
  errorString = self->_errorString;
  if ((unint64_t)errorString | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](errorString, "isEqual:"))
      goto LABEL_81;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 208) & 2) == 0 || self->_errorCode != *((_DWORD *)v4 + 9))
      goto LABEL_81;
  }
  else if ((*((_BYTE *)v4 + 208) & 2) != 0)
  {
    goto LABEL_81;
  }
  processName = self->_processName;
  if ((unint64_t)processName | *((_QWORD *)v4 + 13))
  {
    if (-[NSString isEqual:](processName, "isEqual:"))
    {
      has = (char)self->_has;
      goto LABEL_48;
    }
LABEL_81:
    v27 = 0;
    goto LABEL_82;
  }
LABEL_48:
  if ((has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 208) & 0x40) == 0 || self->_startMemoryLevelInKB != *((_DWORD *)v4 + 36))
      goto LABEL_81;
  }
  else if ((*((_BYTE *)v4 + 208) & 0x40) != 0)
  {
    goto LABEL_81;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 208) & 1) == 0 || self->_endMemoryLevelInKB != *((_DWORD *)v4 + 8))
      goto LABEL_81;
  }
  else if ((*((_BYTE *)v4 + 208) & 1) != 0)
  {
    goto LABEL_81;
  }
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 208) & 8) == 0 || self->_memoryLevelDeltaInKB != *((_DWORD *)v4 + 19))
      goto LABEL_81;
  }
  else if ((*((_BYTE *)v4 + 208) & 8) != 0)
  {
    goto LABEL_81;
  }
  gcdQueueName = self->_gcdQueueName;
  if ((unint64_t)gcdQueueName | *((_QWORD *)v4 + 7)
    && !-[NSString isEqual:](gcdQueueName, "isEqual:"))
  {
    goto LABEL_81;
  }
  qosClassName = self->_qosClassName;
  if ((unint64_t)qosClassName | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](qosClassName, "isEqual:"))
      goto LABEL_81;
  }
  relativePriority = self->_relativePriority;
  if ((unint64_t)relativePriority | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](relativePriority, "isEqual:"))
      goto LABEL_81;
  }
  projectName = self->_projectName;
  if ((unint64_t)projectName | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](projectName, "isEqual:"))
      goto LABEL_81;
  }
  attributes = self->_attributes;
  if ((unint64_t)attributes | *((_QWORD *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](attributes, "isEqual:"))
      goto LABEL_81;
  }
  infoEvents = self->_infoEvents;
  if ((unint64_t)infoEvents | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](infoEvents, "isEqual:"))
      goto LABEL_81;
  }
  warningEvents = self->_warningEvents;
  if ((unint64_t)warningEvents | *((_QWORD *)v4 + 25))
  {
    if (!-[NSMutableArray isEqual:](warningEvents, "isEqual:"))
      goto LABEL_81;
  }
  debugEvents = self->_debugEvents;
  if ((unint64_t)debugEvents | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](debugEvents, "isEqual:"))
      goto LABEL_81;
  }
  errorEvents = self->_errorEvents;
  if ((unint64_t)errorEvents | *((_QWORD *)v4 + 5))
    v27 = -[NSMutableArray isEqual:](errorEvents, "isEqual:");
  else
    v27 = 1;
LABEL_82:

  return v27;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSUInteger v24;
  NSUInteger v25;
  NSUInteger v26;
  NSUInteger v27;
  NSUInteger v28;
  NSUInteger v29;
  NSUInteger v30;
  NSUInteger v31;

  v31 = -[NSString hash](self->_deviceIdentifier, "hash");
  v30 = -[NSString hash](self->_testKey, "hash");
  v29 = -[NSString hash](self->_version, "hash");
  v28 = -[NSString hash](self->_name, "hash");
  v27 = -[NSString hash](self->_trialDeploymentId, "hash");
  v26 = -[NSString hash](self->_trialExperimentId, "hash");
  v25 = -[NSString hash](self->_trialTreatmentId, "hash");
  v24 = -[NSString hash](self->_traceId, "hash");
  v3 = -[NSString hash](self->_parentSpanId, "hash");
  v4 = -[NSString hash](self->_spanId, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
LABEL_6:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v5 = 2654435761 * self->_privatizedStartTime;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_6;
LABEL_3:
  v6 = 2654435761 * self->_privatizedEndTime;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v7 = 2654435761 * self->_intervalInMilliSeconds;
    goto LABEL_8;
  }
LABEL_7:
  v7 = 0;
LABEL_8:
  v8 = -[NSString hash](self->_errorString, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v9 = 2654435761 * self->_errorCode;
  else
    v9 = 0;
  v10 = -[NSString hash](self->_processName, "hash");
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    v11 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_13;
LABEL_16:
    v12 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_14;
LABEL_17:
    v13 = 0;
    goto LABEL_18;
  }
  v11 = 2654435761 * self->_startMemoryLevelInKB;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_16;
LABEL_13:
  v12 = 2654435761 * self->_endMemoryLevelInKB;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_17;
LABEL_14:
  v13 = 2654435761 * self->_memoryLevelDeltaInKB;
LABEL_18:
  v14 = v30 ^ v31 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  v15 = v12 ^ v13 ^ -[NSString hash](self->_gcdQueueName, "hash");
  v16 = v15 ^ -[NSString hash](self->_qosClassName, "hash");
  v17 = v16 ^ -[NSString hash](self->_relativePriority, "hash");
  v18 = v17 ^ -[NSString hash](self->_projectName, "hash");
  v19 = v14 ^ v18 ^ -[NSMutableArray hash](self->_attributes, "hash");
  v20 = -[NSMutableArray hash](self->_infoEvents, "hash");
  v21 = v20 ^ -[NSMutableArray hash](self->_warningEvents, "hash");
  v22 = v21 ^ -[NSMutableArray hash](self->_debugEvents, "hash");
  return v19 ^ v22 ^ -[NSMutableArray hash](self->_errorEvents, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t n;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 3))
    -[AeroMLTracerSpanEvent setDeviceIdentifier:](self, "setDeviceIdentifier:");
  if (*((_QWORD *)v4 + 19))
    -[AeroMLTracerSpanEvent setTestKey:](self, "setTestKey:");
  if (*((_QWORD *)v4 + 24))
    -[AeroMLTracerSpanEvent setVersion:](self, "setVersion:");
  if (*((_QWORD *)v4 + 10))
    -[AeroMLTracerSpanEvent setName:](self, "setName:");
  if (*((_QWORD *)v4 + 21))
    -[AeroMLTracerSpanEvent setTrialDeploymentId:](self, "setTrialDeploymentId:");
  if (*((_QWORD *)v4 + 22))
    -[AeroMLTracerSpanEvent setTrialExperimentId:](self, "setTrialExperimentId:");
  if (*((_QWORD *)v4 + 23))
    -[AeroMLTracerSpanEvent setTrialTreatmentId:](self, "setTrialTreatmentId:");
  if (*((_QWORD *)v4 + 20))
    -[AeroMLTracerSpanEvent setTraceId:](self, "setTraceId:");
  if (*((_QWORD *)v4 + 11))
    -[AeroMLTracerSpanEvent setParentSpanId:](self, "setParentSpanId:");
  if (*((_QWORD *)v4 + 17))
    -[AeroMLTracerSpanEvent setSpanId:](self, "setSpanId:");
  v5 = *((_BYTE *)v4 + 208);
  if ((v5 & 0x20) != 0)
  {
    self->_privatizedStartTime = *((_DWORD *)v4 + 25);
    *(_BYTE *)&self->_has |= 0x20u;
    v5 = *((_BYTE *)v4 + 208);
    if ((v5 & 0x10) == 0)
    {
LABEL_23:
      if ((v5 & 4) == 0)
        goto LABEL_25;
      goto LABEL_24;
    }
  }
  else if ((*((_BYTE *)v4 + 208) & 0x10) == 0)
  {
    goto LABEL_23;
  }
  self->_privatizedEndTime = *((_DWORD *)v4 + 24);
  *(_BYTE *)&self->_has |= 0x10u;
  if ((*((_BYTE *)v4 + 208) & 4) != 0)
  {
LABEL_24:
    self->_intervalInMilliSeconds = *((_DWORD *)v4 + 18);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_25:
  if (*((_QWORD *)v4 + 6))
    -[AeroMLTracerSpanEvent setErrorString:](self, "setErrorString:");
  if ((*((_BYTE *)v4 + 208) & 2) != 0)
  {
    self->_errorCode = *((_DWORD *)v4 + 9);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 13))
    -[AeroMLTracerSpanEvent setProcessName:](self, "setProcessName:");
  v6 = *((_BYTE *)v4 + 208);
  if ((v6 & 0x40) != 0)
  {
    self->_startMemoryLevelInKB = *((_DWORD *)v4 + 36);
    *(_BYTE *)&self->_has |= 0x40u;
    v6 = *((_BYTE *)v4 + 208);
    if ((v6 & 1) == 0)
    {
LABEL_33:
      if ((v6 & 8) == 0)
        goto LABEL_35;
      goto LABEL_34;
    }
  }
  else if ((*((_BYTE *)v4 + 208) & 1) == 0)
  {
    goto LABEL_33;
  }
  self->_endMemoryLevelInKB = *((_DWORD *)v4 + 8);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v4 + 208) & 8) != 0)
  {
LABEL_34:
    self->_memoryLevelDeltaInKB = *((_DWORD *)v4 + 19);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_35:
  if (*((_QWORD *)v4 + 7))
    -[AeroMLTracerSpanEvent setGcdQueueName:](self, "setGcdQueueName:");
  if (*((_QWORD *)v4 + 15))
    -[AeroMLTracerSpanEvent setQosClassName:](self, "setQosClassName:");
  if (*((_QWORD *)v4 + 16))
    -[AeroMLTracerSpanEvent setRelativePriority:](self, "setRelativePriority:");
  if (*((_QWORD *)v4 + 14))
    -[AeroMLTracerSpanEvent setProjectName:](self, "setProjectName:");
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v7 = *((id *)v4 + 1);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v49 != v10)
          objc_enumerationMutation(v7);
        -[AeroMLTracerSpanEvent addAttributes:](self, "addAttributes:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    }
    while (v9);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v12 = *((id *)v4 + 8);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v45 != v15)
          objc_enumerationMutation(v12);
        -[AeroMLTracerSpanEvent addInfoEvents:](self, "addInfoEvents:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
    }
    while (v14);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v17 = *((id *)v4 + 25);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v41;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v41 != v20)
          objc_enumerationMutation(v17);
        -[AeroMLTracerSpanEvent addWarningEvents:](self, "addWarningEvents:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * k));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
    }
    while (v19);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v22 = *((id *)v4 + 2);
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v37;
    do
    {
      for (m = 0; m != v24; ++m)
      {
        if (*(_QWORD *)v37 != v25)
          objc_enumerationMutation(v22);
        -[AeroMLTracerSpanEvent addDebugEvents:](self, "addDebugEvents:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * m));
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
    }
    while (v24);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v27 = *((id *)v4 + 5);
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v32, v52, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v33;
    do
    {
      for (n = 0; n != v29; ++n)
      {
        if (*(_QWORD *)v33 != v30)
          objc_enumerationMutation(v27);
        -[AeroMLTracerSpanEvent addErrorEvents:](self, "addErrorEvents:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * n), (_QWORD)v32);
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v32, v52, 16);
    }
    while (v29);
  }

}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_deviceIdentifier, a3);
}

- (NSString)testKey
{
  return self->_testKey;
}

- (void)setTestKey:(id)a3
{
  objc_storeStrong((id *)&self->_testKey, a3);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)trialDeploymentId
{
  return self->_trialDeploymentId;
}

- (void)setTrialDeploymentId:(id)a3
{
  objc_storeStrong((id *)&self->_trialDeploymentId, a3);
}

- (NSString)trialExperimentId
{
  return self->_trialExperimentId;
}

- (void)setTrialExperimentId:(id)a3
{
  objc_storeStrong((id *)&self->_trialExperimentId, a3);
}

- (NSString)trialTreatmentId
{
  return self->_trialTreatmentId;
}

- (void)setTrialTreatmentId:(id)a3
{
  objc_storeStrong((id *)&self->_trialTreatmentId, a3);
}

- (NSString)traceId
{
  return self->_traceId;
}

- (void)setTraceId:(id)a3
{
  objc_storeStrong((id *)&self->_traceId, a3);
}

- (NSString)parentSpanId
{
  return self->_parentSpanId;
}

- (void)setParentSpanId:(id)a3
{
  objc_storeStrong((id *)&self->_parentSpanId, a3);
}

- (NSString)spanId
{
  return self->_spanId;
}

- (void)setSpanId:(id)a3
{
  objc_storeStrong((id *)&self->_spanId, a3);
}

- (unsigned)privatizedStartTime
{
  return self->_privatizedStartTime;
}

- (unsigned)privatizedEndTime
{
  return self->_privatizedEndTime;
}

- (unsigned)intervalInMilliSeconds
{
  return self->_intervalInMilliSeconds;
}

- (NSString)errorString
{
  return self->_errorString;
}

- (void)setErrorString:(id)a3
{
  objc_storeStrong((id *)&self->_errorString, a3);
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (unsigned)startMemoryLevelInKB
{
  return self->_startMemoryLevelInKB;
}

- (unsigned)endMemoryLevelInKB
{
  return self->_endMemoryLevelInKB;
}

- (unsigned)memoryLevelDeltaInKB
{
  return self->_memoryLevelDeltaInKB;
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
  objc_storeStrong((id *)&self->_processName, a3);
}

- (NSString)gcdQueueName
{
  return self->_gcdQueueName;
}

- (void)setGcdQueueName:(id)a3
{
  objc_storeStrong((id *)&self->_gcdQueueName, a3);
}

- (NSString)qosClassName
{
  return self->_qosClassName;
}

- (void)setQosClassName:(id)a3
{
  objc_storeStrong((id *)&self->_qosClassName, a3);
}

- (NSString)relativePriority
{
  return self->_relativePriority;
}

- (void)setRelativePriority:(id)a3
{
  objc_storeStrong((id *)&self->_relativePriority, a3);
}

- (NSString)projectName
{
  return self->_projectName;
}

- (void)setProjectName:(id)a3
{
  objc_storeStrong((id *)&self->_projectName, a3);
}

- (NSMutableArray)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_attributes, a3);
}

- (NSMutableArray)infoEvents
{
  return self->_infoEvents;
}

- (void)setInfoEvents:(id)a3
{
  objc_storeStrong((id *)&self->_infoEvents, a3);
}

- (NSMutableArray)warningEvents
{
  return self->_warningEvents;
}

- (void)setWarningEvents:(id)a3
{
  objc_storeStrong((id *)&self->_warningEvents, a3);
}

- (NSMutableArray)debugEvents
{
  return self->_debugEvents;
}

- (void)setDebugEvents:(id)a3
{
  objc_storeStrong((id *)&self->_debugEvents, a3);
}

- (NSMutableArray)errorEvents
{
  return self->_errorEvents;
}

- (void)setErrorEvents:(id)a3
{
  objc_storeStrong((id *)&self->_errorEvents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warningEvents, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_trialTreatmentId, 0);
  objc_storeStrong((id *)&self->_trialExperimentId, 0);
  objc_storeStrong((id *)&self->_trialDeploymentId, 0);
  objc_storeStrong((id *)&self->_traceId, 0);
  objc_storeStrong((id *)&self->_testKey, 0);
  objc_storeStrong((id *)&self->_spanId, 0);
  objc_storeStrong((id *)&self->_relativePriority, 0);
  objc_storeStrong((id *)&self->_qosClassName, 0);
  objc_storeStrong((id *)&self->_projectName, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_parentSpanId, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_infoEvents, 0);
  objc_storeStrong((id *)&self->_gcdQueueName, 0);
  objc_storeStrong((id *)&self->_errorString, 0);
  objc_storeStrong((id *)&self->_errorEvents, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_debugEvents, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
