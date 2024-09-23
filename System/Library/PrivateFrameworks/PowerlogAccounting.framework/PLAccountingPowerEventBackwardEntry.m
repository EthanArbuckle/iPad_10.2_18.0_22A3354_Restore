@implementation PLAccountingPowerEventBackwardEntry

- (BOOL)canMergeWithEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[PLAccountingPowerEventBackwardEntry mergingDenyList](PLAccountingPowerEventBackwardEntry, "mergingDenyList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootNodeID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "containsObject:", v5) ^ 1;
  return (char)v3;
}

+ (id)mergingDenyList
{
  if (mergingDenyList_onceToken_0 != -1)
    dispatch_once(&mergingDenyList_onceToken_0, &__block_literal_global_10);
  return (id)mergingDenyList__mergingDenyList_0;
}

+ (int)classDirectionality
{
  return 2;
}

+ (id)entryKey
{
  if (entryKey_onceToken_14 != -1)
    dispatch_once(&entryKey_onceToken_14, &__block_literal_global_18);
  return (id)entryKey_entryKey_14;
}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccountingPowerEventBackwardEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

void __47__PLAccountingPowerEventBackwardEntry_entryKey__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BE74F88], "entryKeyForType:andName:", *MEMORY[0x24BE75210], *MEMORY[0x24BE75150]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)entryKey_entryKey_14;
  entryKey_entryKey_14 = v0;

}

- (PLAccountingPowerEventBackwardEntry)initWithRootNodeID:(id)a3 withPower:(double)a4 withEndDate:(id)a5
{
  PLAccountingPowerEventBackwardEntry *v5;
  id v8;
  void *v9;
  PLAccountingPowerEventBackwardEntry *v10;
  objc_super v12;

  v5 = (PLAccountingPowerEventBackwardEntry *)a5;
  if (a5)
  {
    v8 = a3;
    +[PLAccountingRange rangeWithStartDate:withEndDate:](PLAccountingRange, "rangeWithStartDate:withEndDate:", 0, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12.receiver = self;
    v12.super_class = (Class)PLAccountingPowerEventBackwardEntry;
    v10 = -[PLAccountingPowerEventEntry initWithRootNodeID:withPower:withRange:](&v12, sel_initWithRootNodeID_withPower_withRange_, v8, v9, a4);

    self = v10;
    v5 = self;
  }

  return v5;
}

void __54__PLAccountingPowerEventBackwardEntry_mergingDenyList__block_invoke()
{
  void *v0;

  v0 = (void *)mergingDenyList__mergingDenyList_0;
  mergingDenyList__mergingDenyList_0 = (uint64_t)&unk_24DD031C0;

}

@end
