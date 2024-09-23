@implementation PLAccountingDistributionEventForwardEntry

+ (int)classDirectionality
{
  return 1;
}

+ (id)entryKey
{
  if (entryKey_onceToken_7 != -1)
    dispatch_once(&entryKey_onceToken_7, &__block_literal_global_9);
  return (id)entryKey_entryKey_7;
}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccountingDistributionEventForwardEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

void __53__PLAccountingDistributionEventForwardEntry_entryKey__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BE74F88], "entryKeyForType:andName:", *MEMORY[0x24BE75218], *MEMORY[0x24BE75128]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)entryKey_entryKey_7;
  entryKey_entryKey_7 = v0;

}

- (PLAccountingDistributionEventForwardEntry)initWithDistributionID:(id)a3 withChildNodeNameToWeight:(id)a4 withStartDate:(id)a5
{
  PLAccountingDistributionEventForwardEntry *v5;
  id v8;
  id v9;
  void *v10;
  PLAccountingDistributionEventForwardEntry *v11;
  objc_super v13;

  v5 = (PLAccountingDistributionEventForwardEntry *)a5;
  if (a5)
  {
    v8 = a4;
    v9 = a3;
    +[PLAccountingRange rangeWithStartDate:withEndDate:](PLAccountingRange, "rangeWithStartDate:withEndDate:", v5, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13.receiver = self;
    v13.super_class = (Class)PLAccountingDistributionEventForwardEntry;
    v11 = -[PLAccountingDistributionEventEntry initWithDistributionID:withChildNodeNameToWeight:withRange:](&v13, sel_initWithDistributionID_withChildNodeNameToWeight_withRange_, v9, v8, v10);

    self = v11;
    v5 = self;
  }

  return v5;
}

@end
