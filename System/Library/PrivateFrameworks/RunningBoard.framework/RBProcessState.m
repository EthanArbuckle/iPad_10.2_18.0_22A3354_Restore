@implementation RBProcessState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preventLaunchReasons, 0);
  objc_storeStrong((id *)&self->_endowmentInfos, 0);
  objc_storeStrong((id *)&self->_memoryLimitCategory, 0);
  objc_storeStrong((id *)&self->_primitiveAssertions, 0);
  objc_storeStrong((id *)&self->_legacyAssertions, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_preventIdleSleepIdentifiers, 0);
  objc_storeStrong((id *)&self->_jetsamLenientModeByRole, 0);
  objc_storeStrong((id *)&self->_minCPULimitsByRole, 0);
  objc_storeStrong((id *)&self->_maxCPULimitsByRole, 0);
  objc_storeStrong((id *)&self->_inheritances, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

- (BOOL)throttleBestEffortNetworking
{
  return (self->_flags >> 4) & 1;
}

- (BOOL)guaranteedRunning
{
  return self->_guaranteedRunning;
}

- (id)_initWithProcessState:(id *)a1
{
  id *v3;
  id *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  objc_super v22;

  v3 = a2;
  if (a1)
  {
    v22.receiver = a1;
    v22.super_class = (Class)RBProcessState;
    v4 = (id *)objc_msgSendSuper2(&v22, sel_init);
    a1 = v4;
    if (v4)
    {
      objc_storeStrong(v4 + 1, v3[1]);
      *((_WORD *)a1 + 60) = *((_WORD *)v3 + 60);
      *((_BYTE *)a1 + 89) = *((_BYTE *)v3 + 89);
      a1[12] = v3[12];
      objc_storeStrong(a1 + 13, v3[13]);
      *((_BYTE *)a1 + 112) = *((_BYTE *)v3 + 112);
      *((_DWORD *)a1 + 29) = *((_DWORD *)v3 + 29);
      *((_BYTE *)a1 + 122) = *((_BYTE *)v3 + 122);
      *((_BYTE *)a1 + 123) = *((_BYTE *)v3 + 123);
      *((_BYTE *)a1 + 88) = *((_BYTE *)v3 + 88);
      a1[10] = v3[10];
      a1[16] = v3[16];
      v5 = objc_msgSend(v3[7], "mutableCopy");
      v6 = a1[7];
      a1[7] = (id)v5;

      v7 = objc_msgSend(v3[8], "mutableCopy");
      v8 = a1[8];
      a1[8] = (id)v7;

      v9 = objc_msgSend(v3[9], "mutableCopy");
      v10 = a1[9];
      a1[9] = (id)v9;

      v11 = objc_msgSend(v3[6], "mutableCopy");
      v12 = a1[6];
      a1[6] = (id)v11;

      v13 = objc_msgSend(v3[3], "mutableCopy");
      v14 = a1[3];
      a1[3] = (id)v13;

      v15 = objc_msgSend(v3[4], "mutableCopy");
      v16 = a1[4];
      a1[4] = (id)v15;

      v17 = objc_msgSend(v3[2], "mutableCopy");
      v18 = a1[2];
      a1[2] = (id)v17;

      v19 = objc_msgSend(v3[17], "mutableCopy");
      v20 = a1[17];
      a1[17] = (id)v19;

    }
  }

  return a1;
}

- (RBInheritanceCollection)inheritances
{
  return (RBInheritanceCollection *)(id)-[RBInheritanceCollection copy](self->_inheritances, "copy");
}

- (unsigned)role
{
  return self->_role;
}

- (BOOL)targetedBySuspendableAssertion
{
  return HIBYTE(self->_flags) & 1;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[RBProcessState _initWithProcessState:]((id *)+[RBMutableProcessState allocWithZone:](RBMutableProcessState, "allocWithZone:", a3), self);
}

- (RBProcessState)initWithIdentity:(id)a3
{
  id v5;
  RBProcessState *v6;
  uint64_t v7;
  RBSProcessIdentity *identity;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBProcessState.m"), 244, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identity"));

  }
  v11.receiver = self;
  v11.super_class = (Class)RBProcessState;
  v6 = -[RBProcessState init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    identity = v6->_identity;
    v6->_identity = (RBSProcessIdentity *)v7;

    *(_WORD *)&v6->_role = 257;
    v6->_terminationResistance = 20;
    objc_storeStrong((id *)&v6->_memoryLimitCategory, (id)*MEMORY[0x24BE80E10]);
    v6->_memoryLimitStrength = 0;
    v6->_memoryLimit = 0;
    v6->_coalitionLevel = 0;
  }

  return v6;
}

- (unsigned)terminationResistance
{
  return self->_terminationResistance;
}

- (id)clientStateForProcess:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  uint64_t terminationResistance;
  NSMutableSet *legacyAssertions;
  NSMutableSet *tags;
  NSMutableSet *primitiveAssertions;
  NSMutableSet *v16;
  NSMutableSet *v17;
  NSMutableSet *v18;
  NSMutableSet *v19;
  uint64_t v20;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE80C78]), "initWithIdentity:", self->_identity);
    goto LABEL_8;
  }
  objc_msgSend(v4, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isTerminating") & 1) != 0)
  {
LABEL_8:
    v7 = 1;
    goto LABEL_9;
  }
  if (objc_msgSend(v5, "isReported"))
  {
    if (-[RBProcessState preventSuspend](self, "preventSuspend"))
      v7 = 4;
    else
      v7 = 3;
  }
  else
  {
    v7 = 2;
  }
LABEL_9:
  objc_msgSend(MEMORY[0x24BE80CE8], "stateWithProcess:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[RBProcessState isBeingDebugged](self, "isBeingDebugged");
  -[RBProcessState inheritances](self, "inheritances");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allNamespaces");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && objc_msgSend(v5, "isReported"))
    terminationResistance = self->_terminationResistance;
  else
    terminationResistance = 20;
  objc_msgSend(v8, "setTerminationResistance:", terminationResistance);
  tags = self->_tags;
  legacyAssertions = self->_legacyAssertions;
  primitiveAssertions = self->_primitiveAssertions;
  v16 = self->_endowmentInfos;
  v17 = primitiveAssertions;
  v18 = legacyAssertions;
  v19 = tags;
  if (v9)
    v20 = 3;
  else
    v20 = 1;
  objc_msgSend(v8, "setDebugState:", v20);
  objc_msgSend(v8, "setTaskState:", v7);
  objc_msgSend(v8, "setEndowmentNamespaces:", v11);
  objc_msgSend(v8, "setTags:", v19);
  objc_msgSend(v8, "setLegacyAssertions:", v18);
  objc_msgSend(v8, "setPrimitiveAssertions:", v17);
  objc_msgSend(v8, "setEndowmentInfos:", v16);

  return v8;
}

- (BOOL)isBeingDebugged
{
  return (self->_flags >> 1) & 1;
}

- (BOOL)preventSuspend
{
  return (self->_flags >> 6) & 1;
}

- (unint64_t)legacyFinishTaskReason
{
  return self->_legacyFinishTaskReason;
}

- (RBSProcessIdentity)identity
{
  return self->_identity;
}

- (id)description
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromRBSRole();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("<%@| role:%@>"), v3, v4);

  return v5;
}

- (BOOL)preventIdleSleep
{
  return (self->_flags >> 2) & 1;
}

- (int)memoryLimit
{
  return self->_memoryLimit;
}

- (unsigned)memoryLimitStrength
{
  return self->_memoryLimitStrength;
}

- (NSString)memoryLimitCategory
{
  return self->_memoryLimitCategory;
}

- (BOOL)preventBaseMemoryLimitReduction
{
  return (self->_flags >> 7) & 1;
}

- (NSSet)preventIdleSleepIdentifiers
{
  return &self->_preventIdleSleepIdentifiers->super;
}

- (BOOL)isEqualToProcessStateIgnoringInheritances:(id)a3
{
  RBProcessState *v4;
  char v5;

  v4 = (RBProcessState *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else if (-[RBProcessState _isEqualToProcessStateIgnoringIdentityAndInheritances:]((uint64_t)self, v4))
  {
    v5 = -[RBSProcessIdentity isEqualToIdentity:](self->_identity, "isEqualToIdentity:", v4->_identity);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToProcessStateIgnoringIdentity:(id)a3
{
  RBProcessState *v4;
  RBInheritanceCollection *inheritances;
  RBInheritanceCollection *v6;
  char v7;

  v4 = (RBProcessState *)a3;
  if (self == v4)
    goto LABEL_7;
  if (!-[RBProcessState _isEqualToProcessStateIgnoringIdentityAndInheritances:]((uint64_t)self, v4))
  {
    v7 = 0;
    goto LABEL_9;
  }
  inheritances = self->_inheritances;
  v6 = v4->_inheritances;
  if (inheritances == v6)
  {
LABEL_7:
    v7 = 1;
  }
  else
  {
    v7 = 0;
    if (inheritances && v6)
      v7 = -[RBInheritanceCollection isEqual:](inheritances, "isEqual:");
  }
LABEL_9:

  return v7;
}

- (uint64_t)_isEqualToProcessStateIgnoringIdentityAndInheritances:(uint64_t)a1
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  void *v8;
  CFIndex Count;
  void *v10;
  void *v11;
  const __CFDictionary *v12;
  CFIndex v13;
  const __CFSet *v14;
  const __CFSet *v15;
  CFIndex v16;
  const __CFSet *v17;
  const __CFSet *v18;
  CFIndex v19;
  const __CFSet *v20;
  const __CFSet *v21;
  CFIndex v22;
  const __CFSet *v23;
  const __CFSet *v24;
  CFIndex v25;

  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1 && v3)
  {
    if (*(unsigned __int16 *)(a1 + 120) != *((unsigned __int16 *)v3 + 60)
      || *(unsigned __int8 *)(a1 + 89) != *((unsigned __int8 *)v3 + 89)
      || *(_QWORD *)(a1 + 96) != v3[12]
      || *(_QWORD *)(a1 + 104) != v3[13]
      || *(unsigned __int8 *)(a1 + 112) != *((unsigned __int8 *)v3 + 112)
      || *(unsigned __int8 *)(a1 + 122) != *((unsigned __int8 *)v3 + 122)
      || *(unsigned __int8 *)(a1 + 123) != *((unsigned __int8 *)v3 + 123)
      || *(_QWORD *)(a1 + 128) != v3[16]
      || *(unsigned __int8 *)(a1 + 88) != *((unsigned __int8 *)v3 + 88)
      || *(_QWORD *)(a1 + 80) != v3[10])
    {
      goto LABEL_43;
    }
    v6 = *(const __CFDictionary **)(a1 + 24);
    v7 = (const __CFDictionary *)v4[3];
    if (v6 != v7)
    {
      v5 = 0;
      if (!v6 || !v7)
        goto LABEL_44;
      v8 = *(void **)(a1 + 24);
      Count = CFDictionaryGetCount(v6);
      if (Count != CFDictionaryGetCount(v7) || !objc_msgSend(v8, "isEqualToDictionary:", v7))
        goto LABEL_43;
    }
    v10 = *(void **)(a1 + 32);
    v11 = (void *)v4[4];
    if (v10 != v11)
    {
      v5 = 0;
      if (!v10 || !v11)
        goto LABEL_44;
      v12 = (const __CFDictionary *)v4[4];
      v13 = CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 32));
      if (v13 != CFDictionaryGetCount(v12) || !objc_msgSend(v10, "isEqualToDictionary:", v12))
        goto LABEL_43;
    }
    v14 = *(const __CFSet **)(a1 + 48);
    v15 = (const __CFSet *)v4[6];
    if (v14 != v15)
    {
      v5 = 0;
      if (!v14 || !v15)
        goto LABEL_44;
      v16 = CFSetGetCount(*(CFSetRef *)(a1 + 48));
      if (v16 != CFSetGetCount(v15) || !-[__CFSet isEqualToSet:](v14, "isEqualToSet:", v15))
        goto LABEL_43;
    }
    v17 = *(const __CFSet **)(a1 + 56);
    v18 = (const __CFSet *)v4[7];
    if (v17 != v18)
    {
      v5 = 0;
      if (!v17 || !v18)
        goto LABEL_44;
      v19 = CFSetGetCount(*(CFSetRef *)(a1 + 56));
      if (v19 != CFSetGetCount(v18) || !-[__CFSet isEqualToSet:](v17, "isEqualToSet:", v18))
        goto LABEL_43;
    }
    v20 = *(const __CFSet **)(a1 + 64);
    v21 = (const __CFSet *)v4[8];
    if (v20 != v21)
    {
      v5 = 0;
      if (!v20 || !v21)
        goto LABEL_44;
      v22 = CFSetGetCount(*(CFSetRef *)(a1 + 64));
      if (v22 != CFSetGetCount(v21) || !-[__CFSet isEqualToSet:](v20, "isEqualToSet:", v21))
        goto LABEL_43;
    }
    v23 = *(const __CFSet **)(a1 + 72);
    v24 = (const __CFSet *)v4[9];
    if (v23 == v24)
    {
      v5 = 1;
      goto LABEL_44;
    }
    v5 = 0;
    if (v23 && v24)
    {
      v25 = CFSetGetCount(v23);
      if (v25 == CFSetGetCount(v24))
      {
        v5 = -[__CFSet isEqualToSet:](v23, "isEqualToSet:", v24);
        goto LABEL_44;
      }
LABEL_43:
      v5 = 0;
    }
  }
LABEL_44:

  return v5;
}

- (BOOL)effectiveJetsamLenientMode
{
  return (self->_flags & 8) != 0 && self->_explicitJetsamBand > 0x28;
}

- (unsigned)gpuRole
{
  return self->_gpuRole;
}

- (unint64_t)effectiveMinCPUPercentage
{
  NSMutableDictionary *minCPULimitsByRole;
  void *v3;
  void *v4;
  unint64_t v5;

  minCPULimitsByRole = self->_minCPULimitsByRole;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", self->_role);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](minCPULimitsByRole, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "percentage");

  return v5;
}

- (unint64_t)effectiveMinCPUDuration
{
  NSMutableDictionary *minCPULimitsByRole;
  void *v3;
  void *v4;
  unint64_t v5;

  minCPULimitsByRole = self->_minCPULimitsByRole;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", self->_role);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](minCPULimitsByRole, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "duration");

  return v5;
}

- (unint64_t)effectiveMaxCPUUsageViolationPolicy
{
  NSMutableDictionary *maxCPULimitsByRole;
  void *v3;
  void *v4;
  unint64_t v5;

  maxCPULimitsByRole = self->_maxCPULimitsByRole;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", self->_role);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](maxCPULimitsByRole, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "violationPolicy");

  return v5;
}

- (unint64_t)effectiveMaxCPUPercentage
{
  NSMutableDictionary *maxCPULimitsByRole;
  void *v3;
  void *v4;
  unint64_t v5;

  maxCPULimitsByRole = self->_maxCPULimitsByRole;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", self->_role);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](maxCPULimitsByRole, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "percentage");

  return v5;
}

- (unint64_t)effectiveMaxCPUDuration
{
  NSMutableDictionary *maxCPULimitsByRole;
  void *v3;
  void *v4;
  unint64_t v5;

  maxCPULimitsByRole = self->_maxCPULimitsByRole;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", self->_role);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](maxCPULimitsByRole, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "duration");

  return v5;
}

- (unint64_t)explicitJetsamBand
{
  return self->_explicitJetsamBand;
}

- (BOOL)forceRoleManage
{
  return (self->_flags >> 5) & 1;
}

- (RBProcessState)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBProcessState.m"), 239, CFSTR("-init is not allowed on RBProcessState"));

  return 0;
}

- (BOOL)jetsamLenientMode
{
  return (self->_flags >> 3) & 1;
}

- (BOOL)carPlayMode
{
  return (self->_flags >> 9) & 1;
}

- (id)inheritancesForEnvironment:(id)a3
{
  return -[RBInheritanceCollection inheritancesForEnvironment:](self->_inheritances, "inheritancesForEnvironment:", a3);
}

- (id)maxCPUUsageLimitsForRole:(unsigned __int8)a3
{
  NSMutableDictionary *maxCPULimitsByRole;
  void *v4;
  void *v5;

  maxCPULimitsByRole = self->_maxCPULimitsByRole;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](maxCPULimitsByRole, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)minCPUUsageLimitsForRole:(unsigned __int8)a3
{
  NSMutableDictionary *minCPULimitsByRole;
  void *v4;
  void *v5;

  minCPULimitsByRole = self->_minCPULimitsByRole;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](minCPULimitsByRole, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isAppNapEqualToProcessState:(id)a3
{
  return 1;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  RBInheritanceCollection *inheritances;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  __CFString *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  const __CFString *v37;
  RBInheritanceCollection *v38;
  const __CFString *v39;
  unint64_t legacyFinishTaskReason;
  const __CFString *v41;
  uint64_t flags;
  NSString *memoryLimitCategory;
  uint64_t explicitJetsamBand_low;
  unint64_t coalitionLevel;
  id v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __CFString *v52;
  void *v53;
  void *v54;

  -[NSMutableSet allObjects](self->_tags, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[NSMutableSet allObjects](self->_legacyAssertions, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  -[NSMutableSet allObjects](self->_primitiveAssertions, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  -[NSMutableSet allObjects](self->_endowmentInfos, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  v46 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v49 = objc_claimAutoreleasedReturnValue();
  -[RBSProcessIdentity shortDescription](self->_identity, "shortDescription");
  v11 = objc_claimAutoreleasedReturnValue();
  NSStringFromRBSRole();
  v47 = objc_claimAutoreleasedReturnValue();
  NSStringFromRBSGPURole();
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  explicitJetsamBand_low = LODWORD(self->_explicitJetsamBand);
  coalitionLevel = self->_coalitionLevel;
  memoryLimitCategory = self->_memoryLimitCategory;
  NSStringFromRBSMemoryLimitStrength();
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  flags = self->_flags;
  if (self->_guaranteedRunning)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  legacyFinishTaskReason = self->_legacyFinishTaskReason;
  v41 = v12;
  inheritances = self->_inheritances;
  v14 = CFSTR(" inheritances:");
  if (!inheritances)
  {
    v14 = &stru_24DD48378;
    inheritances = (RBInheritanceCollection *)&stru_24DD48378;
  }
  v38 = inheritances;
  v39 = v14;
  v15 = CFSTR(" attributes:[\n\t");
  if (!v4)
    v15 = &stru_24DD48378;
  v37 = v15;
  v51 = v4;
  if (v4)
  {
    -[NSMutableSet allObjects](self->_tags, "allObjects");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "componentsJoinedByString:", CFSTR(",\n\t"));
    v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v36 = CFSTR("\n\t]");
  }
  else
  {
    v36 = &stru_24DD48378;
    v52 = &stru_24DD48378;
  }
  v48 = (void *)v11;
  if (v6)
    v16 = CFSTR(" legacyAssertions:[\n\t");
  else
    v16 = &stru_24DD48378;
  v50 = v6;
  if (v6)
  {
    -[NSMutableSet allObjects](self->_legacyAssertions, "allObjects");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "componentsJoinedByString:", CFSTR(",\n\t"));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v18 = CFSTR("\n\t]");
  }
  else
  {
    v18 = &stru_24DD48378;
    v17 = &stru_24DD48378;
  }
  if (v8)
    v19 = CFSTR(" primitiveAssertions:[\n\t");
  else
    v19 = &stru_24DD48378;
  if (v8)
  {
    -[NSMutableSet allObjects](self->_primitiveAssertions, "allObjects");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "componentsJoinedByString:", CFSTR(",\n\t"));
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v21 = CFSTR("\n\t]");
    if (v10)
    {
LABEL_22:
      -[NSMutableSet allObjects](self->_endowmentInfos, "allObjects");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR(",\n\t"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v19;
      v29 = v18;
      v24 = (void *)v47;
      v25 = v48;
      v26 = (void *)v49;
      v27 = (void *)objc_msgSend(v46, "initWithFormat:", CFSTR("<%@| identity:%@ role:%@ gpuRole:%@ coalitionLevel:%llu explicitJetsamBand:%d memoryLimit:%@(%@) flags:%hx guaranteedRunning:%@ legacyFinishTaskReason:%lu%@%@%@%@%@%@%@%@%@%@%@%@%@%@>"), v49, v48, v47, v54, coalitionLevel, explicitJetsamBand_low, memoryLimitCategory, v53, flags, v41, legacyFinishTaskReason, v39, v38, v37, v52, v36,
                      v16,
                      v17,
                      v29,
                      v31,
                      v20,
                      v21,
                      CFSTR(" endowments:[\n\t"),
                      v23,
                      CFSTR("\n\t]"));

      goto LABEL_25;
    }
  }
  else
  {
    v21 = &stru_24DD48378;
    v20 = &stru_24DD48378;
    if (v10)
      goto LABEL_22;
  }
  v32 = v19;
  v30 = v18;
  v24 = (void *)v47;
  v25 = v48;
  v26 = (void *)v49;
  v27 = (void *)objc_msgSend(v46, "initWithFormat:", CFSTR("<%@| identity:%@ role:%@ gpuRole:%@ coalitionLevel:%llu explicitJetsamBand:%d memoryLimit:%@(%@) flags:%hx guaranteedRunning:%@ legacyFinishTaskReason:%lu%@%@%@%@%@%@%@%@%@%@%@%@%@%@>"), v49, v48, v47, v54, coalitionLevel, explicitJetsamBand_low, memoryLimitCategory, v53, flags, v41, legacyFinishTaskReason, v39, v38, v37, v52, v36,
                  v16,
                  v17,
                  v30,
                  v32,
                  v20,
                  v21,
                  &stru_24DD48378,
                  &stru_24DD48378,
                  &stru_24DD48378);
LABEL_25:
  if (v8)
  {

  }
  if (v50)
  {

  }
  if (v51)
  {

  }
  return v27;
}

- (unint64_t)hash
{
  return -[RBSProcessIdentity hash](self->_identity, "hash");
}

- (BOOL)isEqual:(id)a3
{
  RBProcessState *v4;
  RBInheritanceCollection *inheritances;
  RBInheritanceCollection *v6;
  char v7;

  v4 = (RBProcessState *)a3;
  if (self == v4)
    goto LABEL_10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || !-[RBProcessState _isEqualToProcessStateIgnoringIdentityAndInheritances:]((uint64_t)self, v4)
    || !-[RBSProcessIdentity isEqualToIdentity:](self->_identity, "isEqualToIdentity:", v4->_identity))
  {
    v7 = 0;
    goto LABEL_11;
  }
  inheritances = self->_inheritances;
  v6 = v4->_inheritances;
  if (inheritances == v6)
  {
LABEL_10:
    v7 = 1;
    goto LABEL_11;
  }
  v7 = 0;
  if (inheritances && v6)
    v7 = -[RBInheritanceCollection isEqual:](inheritances, "isEqual:");
LABEL_11:

  return v7;
}

- (NSSet)tags
{
  return &self->_tags->super;
}

- (NSSet)legacyAssertions
{
  return &self->_legacyAssertions->super;
}

- (NSSet)primitiveAssertions
{
  return &self->_primitiveAssertions->super;
}

- (unint64_t)coalitionLevel
{
  return self->_coalitionLevel;
}

- (NSSet)endowmentInfos
{
  return &self->_endowmentInfos->super;
}

- (NSSet)preventLaunchReasons
{
  return self->_preventLaunchReasons;
}

@end
