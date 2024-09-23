@implementation RBSystemState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prewarmConfiguration, 0);
  objc_storeStrong((id *)&self->_conditions, 0);
  objc_storeStrong((id *)&self->_allowLaunchPredicates, 0);
  objc_storeStrong((id *)&self->_preventLaunchPredicates, 0);
  objc_storeStrong((id *)&self->_preventIdleSleepIdentifiers, 0);
  objc_storeStrong((id *)&self->_tags, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v4 = -[RBSystemState _init](+[RBMutableSystemState allocWithZone:](RBMutableSystemState, "allocWithZone:", a3), "_init");
  v4[17] = self->_preventIdleSleep;
  v4[16] = self->_preventLaunch;
  v5 = -[NSMutableSet mutableCopy](self->_preventIdleSleepIdentifiers, "mutableCopy");
  v6 = (void *)*((_QWORD *)v4 + 3);
  *((_QWORD *)v4 + 3) = v5;

  v7 = -[NSMutableSet mutableCopy](self->_tags, "mutableCopy");
  v8 = (void *)*((_QWORD *)v4 + 1);
  *((_QWORD *)v4 + 1) = v7;

  v9 = -[NSMutableSet mutableCopy](self->_preventLaunchPredicates, "mutableCopy");
  v10 = (void *)*((_QWORD *)v4 + 4);
  *((_QWORD *)v4 + 4) = v9;

  v11 = -[NSMutableSet mutableCopy](self->_allowLaunchPredicates, "mutableCopy");
  v12 = (void *)*((_QWORD *)v4 + 5);
  *((_QWORD *)v4 + 5) = v11;

  v13 = -[NSMutableDictionary mutableCopy](self->_conditions, "mutableCopy");
  v14 = (void *)*((_QWORD *)v4 + 6);
  *((_QWORD *)v4 + 6) = v13;

  v15 = -[NSMutableDictionary mutableCopy](self->_prewarmConfiguration, "mutableCopy");
  v16 = (void *)*((_QWORD *)v4 + 7);
  *((_QWORD *)v4 + 7) = v15;

  return v4;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RBSystemState;
  return -[RBSystemState init](&v3, sel_init);
}

- (NSDictionary)conditions
{
  return &self->_conditions->super;
}

- (BOOL)isEqual:(id)a3
{
  RBSystemState *v4;
  RBSystemState *v5;
  RBSystemState *v6;
  RBSystemState *v7;
  NSMutableSet *preventIdleSleepIdentifiers;
  const __CFSet *v9;
  char v10;
  CFIndex Count;
  NSMutableSet *preventLaunchPredicates;
  const __CFSet *v13;
  CFIndex v14;
  NSMutableSet *allowLaunchPredicates;
  const __CFSet *v16;
  CFIndex v17;
  NSMutableSet *tags;
  const __CFSet *v19;
  CFIndex v20;
  NSMutableDictionary *conditions;
  NSMutableDictionary *v22;
  NSMutableDictionary *prewarmConfiguration;
  const __CFDictionary *v24;
  CFIndex v25;

  v4 = (RBSystemState *)a3;
  v5 = v4;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        v7 = v6;
        if (self->_preventIdleSleep != v6->_preventIdleSleep || self->_preventLaunch != v6->_preventLaunch)
          goto LABEL_37;
        preventIdleSleepIdentifiers = self->_preventIdleSleepIdentifiers;
        v9 = (const __CFSet *)v6->_preventIdleSleepIdentifiers;
        if (preventIdleSleepIdentifiers != (NSMutableSet *)v9)
        {
          v10 = 0;
          if (!preventIdleSleepIdentifiers || !v9)
            goto LABEL_38;
          Count = CFSetGetCount((CFSetRef)self->_preventIdleSleepIdentifiers);
          if (Count != CFSetGetCount(v9)
            || !-[NSMutableSet isEqualToSet:](preventIdleSleepIdentifiers, "isEqualToSet:", v9))
          {
            goto LABEL_37;
          }
        }
        preventLaunchPredicates = self->_preventLaunchPredicates;
        v13 = (const __CFSet *)v7->_preventLaunchPredicates;
        if (preventLaunchPredicates != (NSMutableSet *)v13)
        {
          v10 = 0;
          if (!preventLaunchPredicates || !v13)
            goto LABEL_38;
          v14 = CFSetGetCount((CFSetRef)self->_preventLaunchPredicates);
          if (v14 != CFSetGetCount(v13)
            || !-[NSMutableSet isEqualToSet:](preventLaunchPredicates, "isEqualToSet:", v13))
          {
            goto LABEL_37;
          }
        }
        allowLaunchPredicates = self->_allowLaunchPredicates;
        v16 = (const __CFSet *)v7->_allowLaunchPredicates;
        if (allowLaunchPredicates != (NSMutableSet *)v16)
        {
          v10 = 0;
          if (!allowLaunchPredicates || !v16)
            goto LABEL_38;
          v17 = CFSetGetCount((CFSetRef)self->_allowLaunchPredicates);
          if (v17 != CFSetGetCount(v16)
            || !-[NSMutableSet isEqualToSet:](allowLaunchPredicates, "isEqualToSet:", v16))
          {
            goto LABEL_37;
          }
        }
        tags = self->_tags;
        v19 = (const __CFSet *)v7->_tags;
        if (tags != (NSMutableSet *)v19)
        {
          v10 = 0;
          if (!tags || !v19)
            goto LABEL_38;
          v20 = CFSetGetCount((CFSetRef)self->_tags);
          if (v20 != CFSetGetCount(v19) || !-[NSMutableSet isEqualToSet:](tags, "isEqualToSet:", v19))
            goto LABEL_37;
        }
        conditions = self->_conditions;
        v22 = v7->_conditions;
        if (conditions != v22)
        {
          v10 = 0;
          if (!conditions || !v22)
            goto LABEL_38;
          if (!-[NSMutableDictionary isEqual:](conditions, "isEqual:"))
            goto LABEL_37;
        }
        prewarmConfiguration = self->_prewarmConfiguration;
        v24 = (const __CFDictionary *)v7->_prewarmConfiguration;
        if (prewarmConfiguration == (NSMutableDictionary *)v24)
        {
          v10 = 1;
          goto LABEL_38;
        }
        v10 = 0;
        if (!prewarmConfiguration || !v24)
          goto LABEL_38;
        v25 = CFDictionaryGetCount((CFDictionaryRef)prewarmConfiguration);
        if (v25 == CFDictionaryGetCount(v24))
          v10 = -[NSMutableDictionary isEqualToDictionary:](prewarmConfiguration, "isEqualToDictionary:", v24);
        else
LABEL_37:
          v10 = 0;
LABEL_38:

        goto LABEL_39;
      }
    }
    v10 = 0;
  }
LABEL_39:

  return v10;
}

- (BOOL)preventLaunch
{
  return self->_preventLaunch;
}

- (NSSet)preventLaunchPredicates
{
  return &self->_preventLaunchPredicates->super;
}

- (NSSet)allowLaunchPredicates
{
  return &self->_allowLaunchPredicates->super;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = 0xBF58476D1CE4E5B9
     * (((unint64_t)self->_preventIdleSleep << 24) | ((unint64_t)self->_preventLaunch << 16));
  v4 = 0x94D049BB133111EBLL * (v3 ^ (v3 >> 27));
  v5 = -[NSMutableSet hash](self->_preventIdleSleepIdentifiers, "hash");
  v6 = -[NSMutableSet hash](self->_tags, "hash");
  v7 = -[NSMutableSet hash](self->_preventLaunchPredicates, "hash");
  v8 = -[NSMutableSet hash](self->_allowLaunchPredicates, "hash");
  v9 = -[NSMutableDictionary hash](self->_conditions, "hash");
  return v6 ^ v5 ^ v7 ^ (v4 >> 31) ^ v8 ^ v9 ^ -[NSMutableDictionary hash](self->_prewarmConfiguration, "hash") ^ v4;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (self->_preventLaunch)
    v6 = CFSTR(" preventLaunch");
  else
    v6 = &stru_24DD48378;
  if (self->_preventIdleSleep)
    v7 = CFSTR(" preventIdleSleep");
  else
    v7 = &stru_24DD48378;
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| %@%@>"), v4, v6, v7);

  return v8;
}

- (BOOL)preventIdleSleep
{
  return self->_preventIdleSleep;
}

- (NSSet)preventIdleSleepIdentifiers
{
  return &self->_preventIdleSleepIdentifiers->super;
}

- (NSDictionary)prewarmConfiguration
{
  return &self->_prewarmConfiguration->super;
}

- (NSSet)tags
{
  return &self->_tags->super;
}

@end
