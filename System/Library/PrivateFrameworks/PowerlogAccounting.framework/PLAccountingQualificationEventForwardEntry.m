@implementation PLAccountingQualificationEventForwardEntry

+ (int)classDirectionality
{
  return 1;
}

+ (id)entryKey
{
  if (entryKey_onceToken_9 != -1)
    dispatch_once(&entryKey_onceToken_9, &__block_literal_global_11);
  return (id)entryKey_entryKey_9;
}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccountingQualificationEventForwardEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

void __54__PLAccountingQualificationEventForwardEntry_entryKey__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BE74F88], "entryKeyForType:andName:", *MEMORY[0x24BE75218], *MEMORY[0x24BE75168]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)entryKey_entryKey_9;
  entryKey_entryKey_9 = v0;

}

- (PLAccountingQualificationEventForwardEntry)initWithQualificationID:(id)a3 withChildNodeNames:(id)a4 withStartDate:(id)a5
{
  PLAccountingQualificationEventForwardEntry *v5;
  id v8;
  id v9;
  void *v10;
  PLAccountingQualificationEventForwardEntry *v11;
  objc_super v13;

  v5 = (PLAccountingQualificationEventForwardEntry *)a5;
  if (a5)
  {
    v8 = a4;
    v9 = a3;
    +[PLAccountingRange rangeWithStartDate:withEndDate:](PLAccountingRange, "rangeWithStartDate:withEndDate:", v5, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13.receiver = self;
    v13.super_class = (Class)PLAccountingQualificationEventForwardEntry;
    v11 = -[PLAccountingQualificationEventEntry initWithQualificationID:withChildNodeNames:withRange:](&v13, sel_initWithQualificationID_withChildNodeNames_withRange_, v9, v8, v10);

    self = v11;
    v5 = self;
  }

  return v5;
}

@end
