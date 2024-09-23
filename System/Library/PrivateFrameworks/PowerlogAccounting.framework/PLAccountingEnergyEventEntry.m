@implementation PLAccountingEnergyEventEntry

- (double)energy
{
  void *v2;
  double v3;
  double v4;

  -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", *MEMORY[0x24BE75090]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3 / 1000.0;

  return v4;
}

- (PLAccountingEnergyEventEntry)initWithNodeID:(id)a3 withEnergy:(double)a4 withRange:(id)a5 withEntryDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  int v13;
  PLAccountingEnergyEventEntry *v14;
  void *v15;
  PLAccountingEnergyEventEntry *v16;
  id *p_isa;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  objc_super v30;
  objc_super v31;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = objc_msgSend(v10, "intValue");
  v14 = 0;
  if (v11 && v13 >= 1)
  {
    objc_msgSend((id)objc_opt_class(), "entryKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v31.receiver = self;
      v31.super_class = (Class)PLAccountingEnergyEventEntry;
      v16 = -[PLEntry initWithEntryKey:withDate:](&v31, sel_initWithEntryKey_withDate_, v15, v12);
    }
    else
    {
      v30.receiver = self;
      v30.super_class = (Class)PLAccountingEnergyEventEntry;
      v16 = -[PLEntry initWithEntryKey:](&v30, sel_initWithEntryKey_, v15);
    }
    p_isa = (id *)&v16->super.super.isa;

    if (p_isa)
    {
      objc_storeStrong(p_isa + 8, a5);
      objc_msgSend(p_isa, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE75098]);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", llround(a4 * 1000.0));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_isa, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BE75090]);

      v19 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v11, "startDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_isa, "entryDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "timeIntervalSinceDate:", v21);
      objc_msgSend(v19, "numberWithDouble:", v22 * 1000.0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_isa, "setObject:forKeyedSubscript:", v23, *MEMORY[0x24BE750C8]);

      v24 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v11, "endDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_isa, "entryDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "timeIntervalSinceDate:", v26);
      objc_msgSend(v24, "numberWithDouble:", v27 * 1000.0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_isa, "setObject:forKeyedSubscript:", v28, *MEMORY[0x24BE75088]);

    }
    self = p_isa;
    v14 = self;
  }

  return v14;
}

- (PLAccountingRange)range
{
  PLAccountingEnergyEventEntry *v2;
  PLAccountingRange *range;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  PLAccountingRange *v15;
  PLAccountingRange *v16;

  v2 = self;
  objc_sync_enter(v2);
  range = v2->_range;
  if (!range)
  {
    -[PLEntry objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", *MEMORY[0x24BE750C8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "doubleValue");
    v6 = v5;

    -[PLEntry objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", *MEMORY[0x24BE75088]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;

    -[PLEntry entryDate](v2, "entryDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dateByAddingTimeInterval:", v6 / 1000.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLEntry entryDate](v2, "entryDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dateByAddingTimeInterval:", v9 / 1000.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLAccountingRange rangeWithStartDate:withEndDate:](PLAccountingRange, "rangeWithStartDate:withEndDate:", v11, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v2->_range;
    v2->_range = (PLAccountingRange *)v14;

    range = v2->_range;
  }
  v16 = range;
  objc_sync_exit(v2);

  return v16;
}

- (NSNumber)nodeID
{
  return (NSNumber *)-[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", *MEMORY[0x24BE75098]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_range, 0);
}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccountingEnergyEventEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryKey
{
  if (entryKey_onceToken_5 != -1)
    dispatch_once(&entryKey_onceToken_5, &__block_literal_global_7);
  return (id)entryKey_entryKey_5;
}

void __40__PLAccountingEnergyEventEntry_entryKey__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BE74F88], "entryKeyForType:andName:", *MEMORY[0x24BE75220], *MEMORY[0x24BE75060]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)entryKey_entryKey_5;
  entryKey_entryKey_5 = v0;

}

@end
