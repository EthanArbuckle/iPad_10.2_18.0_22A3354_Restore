@implementation RBMutableSystemState

- (RBMutableSystemState)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RBMutableSystemState;
  return (RBMutableSystemState *)-[RBSystemState _init](&v3, sel__init);
}

- (void)unionState:(id)a3
{
  RBMutableSystemState *v4;
  RBMutableSystemState *v5;
  NSMutableSet *v6;
  NSMutableSet *preventIdleSleepIdentifiers;
  NSMutableSet *v8;
  NSMutableSet *v9;
  NSMutableSet *v10;
  NSMutableSet *tags;
  NSMutableSet *v12;
  NSMutableSet *v13;
  NSMutableSet *v14;
  NSMutableSet *preventLaunchPredicates;
  NSMutableSet *v16;
  NSMutableSet *v17;
  NSMutableSet *v18;
  NSMutableSet *allowLaunchPredicates;
  NSMutableSet *v20;
  NSMutableSet *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  NSMutableDictionary *prewarmConfiguration;
  NSMutableSet *v30;
  void *v31;
  _QWORD v32[5];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = (RBMutableSystemState *)a3;
  v5 = v4;
  if (v4 && v4 != self)
  {
    self->super._preventIdleSleep |= v4->super._preventIdleSleep;
    self->super._preventLaunch |= v4->super._preventLaunch;
    v6 = v4->super._preventIdleSleepIdentifiers;
    if (-[NSMutableSet count](v6, "count"))
    {
      preventIdleSleepIdentifiers = self->super._preventIdleSleepIdentifiers;
      if (preventIdleSleepIdentifiers)
      {
        -[NSMutableSet unionSet:](preventIdleSleepIdentifiers, "unionSet:", v6);
      }
      else
      {
        v8 = (NSMutableSet *)-[NSMutableSet mutableCopy](v6, "mutableCopy");
        v9 = self->super._preventIdleSleepIdentifiers;
        self->super._preventIdleSleepIdentifiers = v8;

      }
    }
    v10 = v5->super._tags;
    if (-[NSMutableSet count](v10, "count"))
    {
      tags = self->super._tags;
      if (tags)
      {
        -[NSMutableSet unionSet:](tags, "unionSet:", v10);
      }
      else
      {
        v12 = (NSMutableSet *)-[NSMutableSet mutableCopy](v10, "mutableCopy");
        v13 = self->super._tags;
        self->super._tags = v12;

      }
    }
    v30 = v6;
    v14 = v5->super._preventLaunchPredicates;
    if (-[NSMutableSet count](v14, "count"))
    {
      preventLaunchPredicates = self->super._preventLaunchPredicates;
      if (preventLaunchPredicates)
      {
        -[NSMutableSet unionSet:](preventLaunchPredicates, "unionSet:", v14, v6);
      }
      else
      {
        v16 = (NSMutableSet *)-[NSMutableSet mutableCopy](v14, "mutableCopy", v6);
        v17 = self->super._preventLaunchPredicates;
        self->super._preventLaunchPredicates = v16;

      }
    }
    v18 = v5->super._allowLaunchPredicates;

    if (-[NSMutableSet count](v18, "count"))
    {
      allowLaunchPredicates = self->super._allowLaunchPredicates;
      if (allowLaunchPredicates)
      {
        -[NSMutableSet unionSet:](allowLaunchPredicates, "unionSet:", v18);
      }
      else
      {
        v20 = (NSMutableSet *)-[NSMutableSet mutableCopy](v18, "mutableCopy");
        v21 = self->super._allowLaunchPredicates;
        self->super._allowLaunchPredicates = v20;

      }
    }
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[NSMutableDictionary allKeys](v5->super._conditions, "allKeys", v30);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v34 != v25)
            objc_enumerationMutation(v22);
          v27 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          -[NSMutableDictionary objectForKey:](v5->super._conditions, "objectForKey:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[RBMutableSystemState upgradeCondition:toValue:](self, "upgradeCondition:toValue:", v27, objc_msgSend(v28, "integerValue"));

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v24);
    }

    prewarmConfiguration = v5->super._prewarmConfiguration;
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __35__RBMutableSystemState_unionState___block_invoke;
    v32[3] = &unk_24DD46840;
    v32[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](prewarmConfiguration, "enumerateKeysAndObjectsUsingBlock:", v32);

  }
}

void __35__RBMutableSystemState_unionState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "doubleValue");
  objc_msgSend(v4, "prewarmIdentity:withInterval:", v5);

}

- (void)setPreventLaunch:(BOOL)a3
{
  self->super._preventLaunch = a3;
}

- (void)setPreventIdleSleep:(BOOL)a3
{
  self->super._preventIdleSleep = a3;
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

- (void)removePreventIdleSleepIdentifier:(id)a3
{
  -[NSMutableSet removeObject:](self->super._preventIdleSleepIdentifiers, "removeObject:", a3);
}

- (void)removeAllPreventIdleSleepIdentifiers
{
  -[NSMutableSet removeAllObjects](self->super._preventIdleSleepIdentifiers, "removeAllObjects");
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

- (void)addPreventLaunchPredicate:(id)a3
{
  id v4;
  NSMutableSet *preventLaunchPredicates;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  preventLaunchPredicates = self->super._preventLaunchPredicates;
  v8 = v4;
  if (!preventLaunchPredicates)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->super._preventLaunchPredicates;
    self->super._preventLaunchPredicates = v6;

    v4 = v8;
    preventLaunchPredicates = self->super._preventLaunchPredicates;
  }
  -[NSMutableSet addObject:](preventLaunchPredicates, "addObject:", v4);

}

- (void)addAllowLaunchPredicate:(id)a3
{
  id v4;
  NSMutableSet *allowLaunchPredicates;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  allowLaunchPredicates = self->super._allowLaunchPredicates;
  v8 = v4;
  if (!allowLaunchPredicates)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->super._allowLaunchPredicates;
    self->super._allowLaunchPredicates = v6;

    v4 = v8;
    allowLaunchPredicates = self->super._allowLaunchPredicates;
  }
  -[NSMutableSet addObject:](allowLaunchPredicates, "addObject:", v4);

}

- (void)upgradeCondition:(id)a3 toValue:(int64_t)a4
{
  id v6;
  NSMutableDictionary *conditions;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  id v14;

  v6 = a3;
  conditions = self->super._conditions;
  v14 = v6;
  if (!conditions)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v9 = self->super._conditions;
    self->super._conditions = v8;

    v6 = v14;
    conditions = self->super._conditions;
  }
  -[NSMutableDictionary objectForKey:](conditions, "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10 || objc_msgSend(v10, "integerValue") < a4)
  {
    v12 = self->super._conditions;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setValue:forKey:](v12, "setValue:forKey:", v13, v14);

  }
}

- (void)prewarmIdentity:(id)a3 withInterval:(double)a4
{
  id v6;
  id v7;
  NSMutableDictionary *prewarmConfiguration;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  double v13;
  NSMutableDictionary *v14;
  void *v15;
  id v16;

  v6 = a3;
  if (!v6)
    -[RBMutableSystemState prewarmIdentity:withInterval:].cold.1();
  v7 = v6;
  prewarmConfiguration = self->super._prewarmConfiguration;
  v16 = v7;
  if (!prewarmConfiguration)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v10 = self->super._prewarmConfiguration;
    self->super._prewarmConfiguration = v9;

    v7 = v16;
    prewarmConfiguration = self->super._prewarmConfiguration;
  }
  -[NSMutableDictionary objectForKey:](prewarmConfiguration, "objectForKey:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11 || (objc_msgSend(v11, "doubleValue"), v13 > a4))
  {
    v14 = self->super._prewarmConfiguration;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v15, v16);

  }
}

- (void)prewarmIdentity:withInterval:.cold.1()
{
  __assert_rtn("-[RBMutableSystemState prewarmIdentity:withInterval:]", "RBSystemState.m", 219, "identity");
}

@end
