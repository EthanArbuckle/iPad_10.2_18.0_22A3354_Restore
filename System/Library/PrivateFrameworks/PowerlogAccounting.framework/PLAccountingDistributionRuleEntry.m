@implementation PLAccountingDistributionRuleEntry

- (NSNumber)distributionID
{
  return (NSNumber *)-[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", *MEMORY[0x24BE750E0]);
}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccountingDistributionRuleEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryKey
{
  if (entryKey_onceToken_10 != -1)
    dispatch_once(&entryKey_onceToken_10, &__block_literal_global_12);
  return (id)entryKey_entryKey_10;
}

void __45__PLAccountingDistributionRuleEntry_entryKey__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BE74F88], "entryKeyForType:andName:", *MEMORY[0x24BE75228], *MEMORY[0x24BE750D8]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)entryKey_entryKey_10;
  entryKey_entryKey_10 = v0;

}

- (PLAccountingDistributionRuleEntry)initWithNodeID:(id)a3 withRootNodeID:(id)a4 withDistributionID:(id)a5 withEntryDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  PLAccountingDistributionRuleEntry *v15;
  PLAccountingDistributionRuleEntry *v16;
  PLAccountingDistributionRuleEntry *v17;
  objc_super v19;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if ((int)objc_msgSend(v10, "intValue") < 1
    || (int)objc_msgSend(v11, "intValue") < 1
    || (int)objc_msgSend(v12, "intValue") < 1)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "entryKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v20.receiver = self;
      v20.super_class = (Class)PLAccountingDistributionRuleEntry;
      v15 = -[PLEntry initWithEntryKey:withDate:](&v20, sel_initWithEntryKey_withDate_, v14, v13);
    }
    else
    {
      v19.receiver = self;
      v19.super_class = (Class)PLAccountingDistributionRuleEntry;
      v15 = -[PLEntry initWithEntryKey:](&v19, sel_initWithEntryKey_, v14);
    }
    v17 = v15;

    if (v17)
    {
      -[PLEntry setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE750E8]);
      -[PLEntry setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE750F0]);
      -[PLEntry setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE750E0]);
    }
    self = v17;
    v16 = self;
  }

  return v16;
}

- (NSNumber)nodeID
{
  return (NSNumber *)-[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", *MEMORY[0x24BE750E8]);
}

- (NSNumber)rootNodeID
{
  return (NSNumber *)-[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", *MEMORY[0x24BE750F0]);
}

- (unint64_t)hash
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  unint64_t v8;

  -[PLAccountingDistributionRuleEntry nodeID](self, "nodeID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");
  -[PLAccountingDistributionRuleEntry rootNodeID](self, "rootNodeID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue") + v4;
  -[PLAccountingDistributionRuleEntry distributionID](self, "distributionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (int)(v6 + objc_msgSend(v7, "intValue"));

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  objc_msgSend(v4, "nodeID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAccountingDistributionRuleEntry nodeID](self, "nodeID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    objc_msgSend(v4, "rootNodeID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAccountingDistributionRuleEntry rootNodeID](self, "rootNodeID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      objc_msgSend(v4, "distributionID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAccountingDistributionRuleEntry distributionID](self, "distributionID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[PLAccountingDistributionRuleEntry nodeID](self, "nodeID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAccountingDistributionRuleEntry rootNodeID](self, "rootNodeID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAccountingDistributionRuleEntry distributionID](self, "distributionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(nodeID=%@, rootNodeID=%@, distributionID=%@)"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
