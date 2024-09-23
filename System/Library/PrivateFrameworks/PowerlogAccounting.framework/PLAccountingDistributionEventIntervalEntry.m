@implementation PLAccountingDistributionEventIntervalEntry

+ (int)classDirectionality
{
  return 3;
}

+ (id)entryKey
{
  if (entryKey_onceToken_12 != -1)
    dispatch_once(&entryKey_onceToken_12, &__block_literal_global_15);
  return (id)entryKey_entryKey_12;
}

- (PLAccountingDistributionEventIntervalEntry)initWithDistributionID:(id)a3 withChildNodeIDToWeight:(id)a4 withStartDate:(id)a5 withEndDate:(id)a6
{
  PLAccountingDistributionEventIntervalEntry *v7;
  id v11;
  id v12;
  void *v13;
  PLAccountingDistributionEventIntervalEntry *v14;
  objc_super v16;

  v7 = 0;
  if (a5 && a6)
  {
    v11 = a4;
    v12 = a3;
    +[PLAccountingRange rangeWithStartDate:withEndDate:](PLAccountingRange, "rangeWithStartDate:withEndDate:", a5, a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16.receiver = self;
    v16.super_class = (Class)PLAccountingDistributionEventIntervalEntry;
    v14 = -[PLAccountingDistributionEventEntry initWithDistributionID:withChildNodeIDToWeight:withRange:](&v16, sel_initWithDistributionID_withChildNodeIDToWeight_withRange_, v12, v11, v13);

    self = v14;
    v7 = self;
  }

  return v7;
}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccountingDistributionEventIntervalEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

void __54__PLAccountingDistributionEventIntervalEntry_entryKey__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BE74F88], "entryKeyForType:andName:", *MEMORY[0x24BE75220], *MEMORY[0x24BE75128]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)entryKey_entryKey_12;
  entryKey_entryKey_12 = v0;

}

- (PLAccountingDistributionEventIntervalEntry)initWithDistributionID:(id)a3 withChildNodeNameToWeight:(id)a4 withStartDate:(id)a5 withEndDate:(id)a6
{
  PLAccountingDistributionEventIntervalEntry *v7;
  id v11;
  id v12;
  void *v13;
  PLAccountingDistributionEventIntervalEntry *v14;
  objc_super v16;

  v7 = 0;
  if (a5 && a6)
  {
    v11 = a4;
    v12 = a3;
    +[PLAccountingRange rangeWithStartDate:withEndDate:](PLAccountingRange, "rangeWithStartDate:withEndDate:", a5, a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16.receiver = self;
    v16.super_class = (Class)PLAccountingDistributionEventIntervalEntry;
    v14 = -[PLAccountingDistributionEventEntry initWithDistributionID:withChildNodeNameToWeight:withRange:](&v16, sel_initWithDistributionID_withChildNodeNameToWeight_withRange_, v12, v11, v13);

    self = v14;
    v7 = self;
  }

  return v7;
}

@end
