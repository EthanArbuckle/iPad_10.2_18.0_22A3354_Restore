@implementation RBMutableProcessState

- (id)copyWithZone:(_NSZone *)a3
{
  return -[RBProcessState _initWithProcessState:]((id *)+[RBProcessState allocWithZone:](RBProcessState, "allocWithZone:", a3), self);
}

- (void)unionState:(id)a3
{
  RBMutableProcessState *v4;
  unsigned int terminationResistance;
  unint64_t explicitJetsamBand;
  int memoryLimit;
  int v8;
  unsigned int memoryLimitStrength;
  unsigned int role;
  unsigned int gpuRole;
  BOOL v12;
  unint64_t coalitionLevel;
  unint64_t legacyFinishTaskReason;
  NSMutableSet *v15;
  NSMutableSet *preventIdleSleepIdentifiers;
  NSMutableSet *v17;
  NSMutableSet *v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *v20;
  NSMutableDictionary *minCPULimitsByRole;
  NSMutableDictionary *v22;
  NSMutableDictionary *v23;
  NSMutableDictionary *maxCPULimitsByRole;
  RBInheritanceCollection *v25;
  RBInheritanceCollection *inheritances;
  RBInheritanceCollection *v27;
  RBInheritanceCollection *v28;
  NSMutableSet *v29;
  NSMutableSet *tags;
  NSMutableSet *v31;
  NSMutableSet *v32;
  NSMutableSet *v33;
  NSMutableSet *legacyAssertions;
  NSMutableSet *v35;
  NSMutableSet *v36;
  NSMutableSet *v37;
  NSMutableSet *primitiveAssertions;
  NSMutableSet *v39;
  NSMutableSet *v40;
  NSMutableSet *v41;
  NSMutableSet *endowmentInfos;
  NSMutableSet *v43;
  NSMutableSet *v44;
  RBMutableProcessState *v45;
  _QWORD v46[5];
  _QWORD v47[5];

  v4 = (RBMutableProcessState *)a3;
  if (v4 && v4 != self)
  {
    self->super._flags |= v4->super._flags;
    terminationResistance = self->super._terminationResistance;
    if (terminationResistance <= v4->super._terminationResistance)
      LOBYTE(terminationResistance) = v4->super._terminationResistance;
    self->super._terminationResistance = terminationResistance;
    explicitJetsamBand = self->super._explicitJetsamBand;
    if (explicitJetsamBand <= v4->super._explicitJetsamBand)
      explicitJetsamBand = v4->super._explicitJetsamBand;
    self->super._explicitJetsamBand = explicitJetsamBand;
    memoryLimit = self->super._memoryLimit;
    v8 = v4->super._memoryLimit;
    v45 = v4;
    if (memoryLimit == v8)
    {
      memoryLimitStrength = self->super._memoryLimitStrength;
      if (memoryLimitStrength <= v4->super._memoryLimitStrength)
        LOBYTE(memoryLimitStrength) = v4->super._memoryLimitStrength;
      self->super._memoryLimitStrength = memoryLimitStrength;
    }
    else if (memoryLimit < v8)
    {
      objc_storeStrong((id *)&self->super._memoryLimitCategory, v4->super._memoryLimitCategory);
      v4 = v45;
      self->super._memoryLimitStrength = v45->super._memoryLimitStrength;
      self->super._memoryLimit = v45->super._memoryLimit;
    }
    role = self->super._role;
    if (role <= v4->super._role)
      LOBYTE(role) = v4->super._role;
    self->super._role = role;
    gpuRole = self->super._gpuRole;
    if (gpuRole <= v4->super._gpuRole)
      LOBYTE(gpuRole) = v4->super._gpuRole;
    self->super._gpuRole = gpuRole;
    v12 = self->super._guaranteedRunning || v4->super._guaranteedRunning;
    self->super._guaranteedRunning = v12;
    coalitionLevel = self->super._coalitionLevel;
    if (coalitionLevel <= v4->super._coalitionLevel)
      coalitionLevel = v4->super._coalitionLevel;
    self->super._coalitionLevel = coalitionLevel;
    legacyFinishTaskReason = v4->super._legacyFinishTaskReason;
    if (legacyFinishTaskReason && self->super._legacyFinishTaskReason - 1 >= legacyFinishTaskReason)
      self->super._legacyFinishTaskReason = legacyFinishTaskReason;
    v15 = v4->super._preventIdleSleepIdentifiers;
    if (-[NSMutableSet count](v15, "count"))
    {
      preventIdleSleepIdentifiers = self->super._preventIdleSleepIdentifiers;
      if (preventIdleSleepIdentifiers)
      {
        -[NSMutableSet unionSet:](preventIdleSleepIdentifiers, "unionSet:", v15);
      }
      else
      {
        v17 = (NSMutableSet *)-[NSMutableSet mutableCopy](v15, "mutableCopy");
        v18 = self->super._preventIdleSleepIdentifiers;
        self->super._preventIdleSleepIdentifiers = v17;

      }
    }
    v19 = v45->super._minCPULimitsByRole;
    if (-[NSMutableDictionary count](v19, "count"))
    {
      if (self->super._minCPULimitsByRole)
      {
        v47[0] = MEMORY[0x24BDAC760];
        v47[1] = 3221225472;
        v47[2] = __36__RBMutableProcessState_unionState___block_invoke;
        v47[3] = &unk_24DD46678;
        v47[4] = self;
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v19, "enumerateKeysAndObjectsUsingBlock:", v47);
      }
      else
      {
        v20 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](v19, "mutableCopy");
        minCPULimitsByRole = self->super._minCPULimitsByRole;
        self->super._minCPULimitsByRole = v20;

      }
    }
    v22 = v45->super._maxCPULimitsByRole;
    if (-[NSMutableDictionary count](v22, "count"))
    {
      if (self->super._maxCPULimitsByRole)
      {
        v46[0] = MEMORY[0x24BDAC760];
        v46[1] = 3221225472;
        v46[2] = __36__RBMutableProcessState_unionState___block_invoke_2;
        v46[3] = &unk_24DD466A0;
        v46[4] = self;
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v22, "enumerateKeysAndObjectsUsingBlock:", v46);
      }
      else
      {
        v23 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](v22, "mutableCopy");
        maxCPULimitsByRole = self->super._maxCPULimitsByRole;
        self->super._maxCPULimitsByRole = v23;

      }
    }
    v25 = v45->super._inheritances;
    if (-[RBInheritanceCollection count](v25, "count"))
    {
      inheritances = self->super._inheritances;
      if (inheritances)
      {
        -[RBInheritanceCollection unionCollection:](inheritances, "unionCollection:", v25);
      }
      else
      {
        v27 = (RBInheritanceCollection *)-[RBInheritanceCollection mutableCopy](v25, "mutableCopy");
        v28 = self->super._inheritances;
        self->super._inheritances = v27;

      }
    }
    v29 = v45->super._tags;
    if (-[NSMutableSet count](v29, "count"))
    {
      tags = self->super._tags;
      if (tags)
      {
        -[NSMutableSet unionSet:](tags, "unionSet:", v29);
      }
      else
      {
        v31 = (NSMutableSet *)-[NSMutableSet mutableCopy](v29, "mutableCopy");
        v32 = self->super._tags;
        self->super._tags = v31;

      }
    }
    v33 = v45->super._legacyAssertions;
    if (-[NSMutableSet count](v33, "count"))
    {
      legacyAssertions = self->super._legacyAssertions;
      if (legacyAssertions)
      {
        -[NSMutableSet unionSet:](legacyAssertions, "unionSet:", v33);
      }
      else
      {
        v35 = (NSMutableSet *)-[NSMutableSet mutableCopy](v33, "mutableCopy");
        v36 = self->super._legacyAssertions;
        self->super._legacyAssertions = v35;

      }
    }
    v37 = v45->super._primitiveAssertions;
    if (-[NSMutableSet count](v37, "count"))
    {
      primitiveAssertions = self->super._primitiveAssertions;
      if (primitiveAssertions)
      {
        -[NSMutableSet unionSet:](primitiveAssertions, "unionSet:", v37);
      }
      else
      {
        v39 = (NSMutableSet *)-[NSMutableSet mutableCopy](v37, "mutableCopy");
        v40 = self->super._primitiveAssertions;
        self->super._primitiveAssertions = v39;

      }
    }
    v41 = v45->super._endowmentInfos;
    if (-[NSMutableSet count](v41, "count"))
    {
      endowmentInfos = self->super._endowmentInfos;
      if (endowmentInfos)
      {
        -[NSMutableSet unionSet:](endowmentInfos, "unionSet:", v41);
      }
      else
      {
        v43 = (NSMutableSet *)-[NSMutableSet mutableCopy](v41, "mutableCopy");
        v44 = self->super._endowmentInfos;
        self->super._endowmentInfos = v43;

      }
    }

    v4 = v45;
  }

}

- (void)addRBAssertion:(id)a3
{
  id v4;
  NSMutableSet *primitiveAssertions;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  primitiveAssertions = self->super._primitiveAssertions;
  v8 = v4;
  if (!primitiveAssertions)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->super._primitiveAssertions;
    self->super._primitiveAssertions = v6;

    v4 = v8;
    primitiveAssertions = self->super._primitiveAssertions;
  }
  -[NSMutableSet addObject:](primitiveAssertions, "addObject:", v4);

}

- (void)setGuaranteedRunning:(BOOL)a3
{
  self->super._guaranteedRunning = a3;
}

- (void)addLegacyAssertion:(id)a3
{
  id v4;
  NSMutableSet *legacyAssertions;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  legacyAssertions = self->super._legacyAssertions;
  v8 = v4;
  if (!legacyAssertions)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->super._legacyAssertions;
    self->super._legacyAssertions = v6;

    v4 = v8;
    legacyAssertions = self->super._legacyAssertions;
  }
  -[NSMutableSet addObject:](legacyAssertions, "addObject:", v4);

}

- (void)setPreventBaseMemoryLimitReduction:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->super._flags = self->super._flags & 0xFF7F | v3;
}

- (void)setPreventSuspend:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->super._flags = self->super._flags & 0xFFBF | v3;
}

- (void)setRole:(unsigned __int8)a3
{
  self->super._role = a3;
}

- (void)setTargetedBySuspendableAssertion:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->super._flags = self->super._flags & 0xFEFF | v3;
}

- (void)setTerminationResistance:(unsigned __int8)a3
{
  self->super._terminationResistance = a3;
}

- (void)addInheritance:(id)a3
{
  id v4;
  RBInheritanceCollection *inheritances;
  RBMutableInheritanceCollection *v6;
  RBInheritanceCollection *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  inheritances = self->super._inheritances;
  v13 = v4;
  if (!inheritances)
  {
    v6 = objc_alloc_init(RBMutableInheritanceCollection);
    v7 = self->super._inheritances;
    self->super._inheritances = &v6->super;

    v4 = v13;
    inheritances = self->super._inheritances;
  }
  -[RBInheritanceCollection addInheritance:](inheritances, "addInheritance:", v4);
  v8 = objc_alloc(MEMORY[0x24BE80C58]);
  objc_msgSend(v13, "endowmentNamespace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "environment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodedEndowment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "_initWithNamespace:environment:encodedEndowment:", v9, v10, v11);

  -[RBMutableProcessState addEndowmentInfo:](self, "addEndowmentInfo:", v12);
}

- (void)addEndowmentInfo:(id)a3
{
  id v4;
  NSMutableSet *endowmentInfos;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  endowmentInfos = self->super._endowmentInfos;
  v8 = v4;
  if (!endowmentInfos)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->super._endowmentInfos;
    self->super._endowmentInfos = v6;

    v4 = v8;
    endowmentInfos = self->super._endowmentInfos;
  }
  -[NSMutableSet addObject:](endowmentInfos, "addObject:", v4);

}

- (void)addPreventIdleSleepIdentifier:(id)a3
{
  id v4;
  NSMutableSet *preventIdleSleepIdentifiers;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  preventIdleSleepIdentifiers = self->super._preventIdleSleepIdentifiers;
  v8 = v4;
  if (!preventIdleSleepIdentifiers)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->super._preventIdleSleepIdentifiers;
    self->super._preventIdleSleepIdentifiers = v6;

    v4 = v8;
    preventIdleSleepIdentifiers = self->super._preventIdleSleepIdentifiers;
  }
  -[NSMutableSet addObject:](preventIdleSleepIdentifiers, "addObject:", v4);

}

- (void)setPreventIdleSleep:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->super._flags = self->super._flags & 0xFFFB | v3;
}

- (void)setMemoryLimitStrength:(unsigned __int8)a3
{
  self->super._memoryLimitStrength = a3;
}

- (void)setMemoryLimitCategory:(id)a3
{
  objc_storeStrong((id *)&self->super._memoryLimitCategory, a3);
}

- (void)setMemoryLimit:(int)a3
{
  self->super._memoryLimit = a3;
}

- (void)setMaxCPUUsageLimits:(id)a3 forRole:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  NSMutableDictionary *maxCPULimitsByRole;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  id v15;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    v15 = v6;
    maxCPULimitsByRole = self->super._maxCPULimitsByRole;
    if (!maxCPULimitsByRole)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v9 = self->super._maxCPULimitsByRole;
      self->super._maxCPULimitsByRole = v8;

      maxCPULimitsByRole = self->super._maxCPULimitsByRole;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](maxCPULimitsByRole, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "unionLimit:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = self->super._maxCPULimitsByRole;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v12, v14);

    v6 = v15;
  }

}

- (void)addTag:(id)a3
{
  id v4;
  NSMutableSet *tags;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  tags = self->super._tags;
  v8 = v4;
  if (!tags)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->super._tags;
    self->super._tags = v6;

    v4 = v8;
    tags = self->super._tags;
  }
  -[NSMutableSet addObject:](tags, "addObject:", v4);

}

- (void)setGPURole:(unsigned __int8)a3
{
  self->super._gpuRole = a3;
}

- (void)setExplicitJetsamBand:(unint64_t)a3
{
  self->super._explicitJetsamBand = a3;
}

void __36__RBMutableProcessState_unionState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "objectForKey:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionLimit:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKey:", v8, v7);
}

void __36__RBMutableProcessState_unionState___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "objectForKey:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionLimit:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", v8, v7);
}

- (void)setIsBeingDebugged:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->super._flags = self->super._flags & 0xFFFD | v3;
}

- (void)setJetsamLenientMode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->super._flags = self->super._flags & 0xFFF7 | v3;
}

- (void)setCoalitionLevel:(unint64_t)a3
{
  self->super._coalitionLevel = a3;
}

- (void)setLegacyFinishTaskReason:(unint64_t)a3
{
  self->super._legacyFinishTaskReason = a3;
}

- (void)removePreventIdleSleepIdentifier:(id)a3
{
  NSMutableSet *preventIdleSleepIdentifiers;

  -[NSMutableSet removeObject:](self->super._preventIdleSleepIdentifiers, "removeObject:", a3);
  if (!-[NSMutableSet count](self->super._preventIdleSleepIdentifiers, "count"))
  {
    preventIdleSleepIdentifiers = self->super._preventIdleSleepIdentifiers;
    self->super._preventIdleSleepIdentifiers = 0;

  }
}

- (void)removeAllPreventIdleSleepIdentifiers
{
  NSMutableSet *preventIdleSleepIdentifiers;

  preventIdleSleepIdentifiers = self->super._preventIdleSleepIdentifiers;
  self->super._preventIdleSleepIdentifiers = 0;

}

- (void)setMinCPUUsageLimits:(id)a3 forRole:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  NSMutableDictionary *minCPULimitsByRole;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  id v15;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    v15 = v6;
    minCPULimitsByRole = self->super._minCPULimitsByRole;
    if (!minCPULimitsByRole)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v9 = self->super._minCPULimitsByRole;
      self->super._minCPULimitsByRole = v8;

      minCPULimitsByRole = self->super._minCPULimitsByRole;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](minCPULimitsByRole, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "unionLimit:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = self->super._minCPULimitsByRole;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v12, v14);

    v6 = v15;
  }

}

- (void)setThrottleBestEffortNetworking:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->super._flags = self->super._flags & 0xFFEF | v3;
}

- (void)setForceRoleManage:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->super._flags = self->super._flags & 0xFFDF | v3;
}

- (void)setCarPlayMode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->super._flags = self->super._flags & 0xFDFF | v3;
}

- (void)removeEndowmentInfo:(id)a3
{
  NSMutableSet *endowmentInfos;
  void *v5;
  NSMutableSet *v6;

  endowmentInfos = self->super._endowmentInfos;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet minusSet:](endowmentInfos, "minusSet:", v5);

  if (!-[NSMutableSet count](self->super._endowmentInfos, "count"))
  {
    v6 = self->super._endowmentInfos;
    self->super._endowmentInfos = 0;

  }
}

- (void)removeAllEndowmentInfos
{
  NSMutableSet *endowmentInfos;

  endowmentInfos = self->super._endowmentInfos;
  self->super._endowmentInfos = 0;

}

- (void)removeInheritance:(id)a3
{
  RBInheritanceCollection *inheritances;
  id v5;
  RBInheritanceCollection *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  inheritances = self->super._inheritances;
  v5 = a3;
  -[RBInheritanceCollection removeInheritance:](inheritances, "removeInheritance:", v5);
  if (!-[RBInheritanceCollection count](self->super._inheritances, "count"))
  {
    v6 = self->super._inheritances;
    self->super._inheritances = 0;

  }
  v7 = objc_alloc(MEMORY[0x24BE80C58]);
  objc_msgSend(v5, "endowmentNamespace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "environment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodedEndowment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (id)objc_msgSend(v7, "_initWithNamespace:environment:encodedEndowment:", v8, v9, v10);
  -[RBMutableProcessState removeEndowmentInfo:](self, "removeEndowmentInfo:", v11);

}

- (void)removeAllInheritances
{
  RBInheritanceCollection *inheritances;

  inheritances = self->super._inheritances;
  self->super._inheritances = 0;

  -[RBMutableProcessState removeAllEndowmentInfos](self, "removeAllEndowmentInfos");
}

@end
