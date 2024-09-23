@implementation RBAssertionTransientState

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  NSMutableDictionary *cpuUsageViolationPoliciesByRole;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  -[NSMutableSet allObjects](self->_tags, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  cpuUsageViolationPoliciesByRole = self->_cpuUsageViolationPoliciesByRole;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __40__RBAssertionTransientState_description__block_invoke;
  v15[3] = &unk_24DD465D8;
  v7 = v3;
  v16 = v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cpuUsageViolationPoliciesByRole, "enumerateKeysAndObjectsUsingBlock:", v15);
  v8 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v5)
  {
    -[NSMutableSet allObjects](self->_tags, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR(",\n\t"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("<%@| policies:[\n\t%@\n\t]%@%@>"), v10, v7, CFSTR(" tags:[\n\t"), v12);

  }
  else
  {
    v13 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("<%@| policies:[\n\t%@\n\t]%@%@>"), v9, v7, &stru_24DD48378, &stru_24DD48378);
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_cpuUsageViolationPoliciesByRole, 0);
}

- (void)addTag:(id)a3
{
  id v4;
  NSMutableSet *tags;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  tags = self->_tags;
  v8 = v4;
  if (!tags)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_tags;
    self->_tags = v6;

    v4 = v8;
    tags = self->_tags;
  }
  -[NSMutableSet addObject:](tags, "addObject:", v4);

}

- (unint64_t)maxCPUUsageViolationPolicyForRole:(unsigned __int8)a3
{
  NSMutableDictionary *cpuUsageViolationPoliciesByRole;
  void *v4;
  void *v5;
  unint64_t v6;

  cpuUsageViolationPoliciesByRole = self->_cpuUsageViolationPoliciesByRole;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](cpuUsageViolationPoliciesByRole, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  return v6;
}

- (void)setMaxCPUUsageViolationPolicy:(unint64_t)a3 forRole:(unsigned __int8)a4
{
  uint64_t v4;
  NSMutableDictionary *v7;
  NSMutableDictionary *cpuUsageViolationPoliciesByRole;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  v4 = a4;
  if (!self->_cpuUsageViolationPoliciesByRole)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    cpuUsageViolationPoliciesByRole = self->_cpuUsageViolationPoliciesByRole;
    self->_cpuUsageViolationPoliciesByRole = v7;

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v9 = self->_cpuUsageViolationPoliciesByRole;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v11, v10);

}

void __40__RBAssertionTransientState_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "unsignedIntegerValue");
  NSStringFromRBSRole();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unsignedIntegerValue");

  NSStringFromRBSCPUMaximumUsageViolationPolicy();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("%@=%@\n\t"), v7, v6);

}

- (void)unionState:(id)a3
{
  RBAssertionTransientState *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *cpuUsageViolationPoliciesByRole;
  NSMutableSet *v8;
  NSMutableSet *tags;
  NSMutableSet *v10;
  NSMutableSet *v11;
  RBAssertionTransientState *v12;
  _QWORD v13[5];

  v4 = (RBAssertionTransientState *)a3;
  if (v4 && v4 != self)
  {
    v12 = v4;
    v5 = v4->_cpuUsageViolationPoliciesByRole;
    if (-[NSMutableDictionary count](v5, "count"))
    {
      if (self->_cpuUsageViolationPoliciesByRole)
      {
        v13[0] = MEMORY[0x24BDAC760];
        v13[1] = 3221225472;
        v13[2] = __40__RBAssertionTransientState_unionState___block_invoke;
        v13[3] = &unk_24DD465D8;
        v13[4] = self;
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v5, "enumerateKeysAndObjectsUsingBlock:", v13);
      }
      else
      {
        v6 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](v5, "mutableCopy");
        cpuUsageViolationPoliciesByRole = self->_cpuUsageViolationPoliciesByRole;
        self->_cpuUsageViolationPoliciesByRole = v6;

      }
    }
    v8 = v12->_tags;
    if (-[NSMutableSet count](v8, "count"))
    {
      tags = self->_tags;
      if (tags)
      {
        -[NSMutableSet unionSet:](tags, "unionSet:", v8);
      }
      else
      {
        v10 = (NSMutableSet *)-[NSMutableSet mutableCopy](v8, "mutableCopy");
        v11 = self->_tags;
        self->_tags = v10;

      }
    }

    v4 = v12;
  }

}

void __40__RBAssertionTransientState_unionState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  id v13;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = objc_msgSend(v13, "unsignedIntegerValue");
  v10 = objc_msgSend(v6, "unsignedIntegerValue");

  if (v9 <= v10)
    v11 = v10;
  else
    v11 = v9;
  objc_msgSend(v8, "numberWithUnsignedInteger:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v12, v7);

}

- (id)copyWithZone:(_NSZone *)a3
{
  RBAssertionTransientState *v5;
  uint64_t v6;
  NSMutableDictionary *cpuUsageViolationPoliciesByRole;
  uint64_t v8;
  NSMutableSet *tags;

  v5 = -[RBAssertionTransientState init](+[RBAssertionTransientState allocWithZone:](RBAssertionTransientState, "allocWithZone:"), "init");
  v6 = -[NSMutableDictionary mutableCopyWithZone:](self->_cpuUsageViolationPoliciesByRole, "mutableCopyWithZone:", a3);
  cpuUsageViolationPoliciesByRole = v5->_cpuUsageViolationPoliciesByRole;
  v5->_cpuUsageViolationPoliciesByRole = (NSMutableDictionary *)v6;

  v8 = -[NSMutableSet mutableCopyWithZone:](self->_tags, "mutableCopyWithZone:", a3);
  tags = v5->_tags;
  v5->_tags = (NSMutableSet *)v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  RBAssertionTransientState *v4;
  uint64_t v5;
  BOOL v6;
  NSMutableSet *tags;
  NSMutableDictionary *cpuUsageViolationPoliciesByRole;

  v4 = (RBAssertionTransientState *)a3;
  v6 = 1;
  if (self != v4)
  {
    if ((v5 = objc_opt_class(), v5 != objc_opt_class())
      || (tags = self->_tags, tags != v4->_tags) && !-[NSMutableSet isEqualToSet:](tags, "isEqualToSet:")
      || (cpuUsageViolationPoliciesByRole = self->_cpuUsageViolationPoliciesByRole,
          cpuUsageViolationPoliciesByRole != v4->_cpuUsageViolationPoliciesByRole)
      && !-[NSMutableDictionary isEqualToDictionary:](cpuUsageViolationPoliciesByRole, "isEqualToDictionary:"))
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSMutableSet hash](self->_tags, "hash");
  return -[NSMutableDictionary hash](self->_cpuUsageViolationPoliciesByRole, "hash") ^ v3;
}

- (NSSet)tags
{
  return &self->_tags->super;
}

@end
