@implementation PLAccountingQualificationRuleEntry

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccountingQualificationRuleEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryKey
{
  if (entryKey_onceToken_4 != -1)
    dispatch_once(&entryKey_onceToken_4, &__block_literal_global_6);
  return (id)entryKey_entryKey_4;
}

void __46__PLAccountingQualificationRuleEntry_entryKey__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BE74F88], "entryKeyForType:andName:", *MEMORY[0x24BE75228], *MEMORY[0x24BE75110]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)entryKey_entryKey_4;
  entryKey_entryKey_4 = v0;

}

- (PLAccountingQualificationRuleEntry)initWithRootNodeID:(id)a3 withQualificationID:(id)a4 withEntryDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  PLAccountingQualificationRuleEntry *v12;
  PLAccountingQualificationRuleEntry *v13;
  PLAccountingQualificationRuleEntry *v14;
  objc_super v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((int)objc_msgSend(v8, "intValue") < 1 || (int)objc_msgSend(v9, "intValue") < 1)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "entryKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v17.receiver = self;
      v17.super_class = (Class)PLAccountingQualificationRuleEntry;
      v12 = -[PLEntry initWithEntryKey:withDate:](&v17, sel_initWithEntryKey_withDate_, v11, v10);
    }
    else
    {
      v16.receiver = self;
      v16.super_class = (Class)PLAccountingQualificationRuleEntry;
      v12 = -[PLEntry initWithEntryKey:](&v16, sel_initWithEntryKey_, v11);
    }
    v14 = v12;

    if (v14)
    {
      -[PLEntry setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BE75120]);
      -[PLEntry setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE75118]);
    }
    self = v14;
    v13 = self;
  }

  return v13;
}

- (NSNumber)rootNodeID
{
  return (NSNumber *)-[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", *MEMORY[0x24BE75120]);
}

- (NSNumber)qualificationID
{
  return (NSNumber *)-[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", *MEMORY[0x24BE75118]);
}

- (unint64_t)hash
{
  void *v3;
  int v4;
  void *v5;
  unint64_t v6;

  -[PLAccountingQualificationRuleEntry rootNodeID](self, "rootNodeID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");
  -[PLAccountingQualificationRuleEntry qualificationID](self, "qualificationID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (int)(objc_msgSend(v5, "intValue") + v4);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_msgSend(v4, "rootNodeID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAccountingQualificationRuleEntry rootNodeID](self, "rootNodeID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    objc_msgSend(v4, "qualificationID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAccountingQualificationRuleEntry qualificationID](self, "qualificationID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[PLAccountingQualificationRuleEntry rootNodeID](self, "rootNodeID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAccountingQualificationRuleEntry qualificationID](self, "qualificationID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(rootNodeID=%@, qualificationID=%@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
