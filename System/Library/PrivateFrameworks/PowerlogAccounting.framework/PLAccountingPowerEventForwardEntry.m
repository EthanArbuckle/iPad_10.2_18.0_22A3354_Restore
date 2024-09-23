@implementation PLAccountingPowerEventForwardEntry

+ (id)entryKey
{
  if (entryKey_onceToken_13 != -1)
    dispatch_once(&entryKey_onceToken_13, &__block_literal_global_16);
  return (id)entryKey_entryKey_13;
}

+ (int)classDirectionality
{
  return 1;
}

- (BOOL)canMergeWithEvent:(id)a3
{
  return 0;
}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccountingPowerEventForwardEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

void __46__PLAccountingPowerEventForwardEntry_entryKey__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BE74F88], "entryKeyForType:andName:", *MEMORY[0x24BE75218], *MEMORY[0x24BE75150]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)entryKey_entryKey_13;
  entryKey_entryKey_13 = v0;

}

- (PLAccountingPowerEventForwardEntry)initWithRootNodeID:(id)a3 withPower:(double)a4 withStartDate:(id)a5
{
  PLAccountingPowerEventForwardEntry *v5;
  id v8;
  void *v9;
  PLAccountingPowerEventForwardEntry *v10;
  objc_super v12;

  v5 = (PLAccountingPowerEventForwardEntry *)a5;
  if (a5)
  {
    v8 = a3;
    +[PLAccountingRange rangeWithStartDate:withEndDate:](PLAccountingRange, "rangeWithStartDate:withEndDate:", v5, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12.receiver = self;
    v12.super_class = (Class)PLAccountingPowerEventForwardEntry;
    v10 = -[PLAccountingPowerEventEntry initWithRootNodeID:withPower:withRange:](&v12, sel_initWithRootNodeID_withPower_withRange_, v8, v9, a4);

    self = v10;
    v5 = self;
  }

  return v5;
}

@end
