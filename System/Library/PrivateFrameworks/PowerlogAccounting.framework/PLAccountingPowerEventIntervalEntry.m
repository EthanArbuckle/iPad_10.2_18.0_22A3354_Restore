@implementation PLAccountingPowerEventIntervalEntry

+ (int)classDirectionality
{
  return 3;
}

+ (id)entryKey
{
  if (entryKey_onceToken_3 != -1)
    dispatch_once(&entryKey_onceToken_3, &__block_literal_global_5);
  return (id)entryKey_entryKey_3;
}

- (BOOL)canMergeWithEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  BOOL v15;
  void *v16;
  int v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  int v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  void *v34;

  v4 = a3;
  -[PLAccountingEventEntry range](self, "range");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "range");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v8);
  v34 = v4;
  if (v9 <= -1.0)
  {
    v15 = 0;
  }
  else
  {
    objc_msgSend(v4, "range");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAccountingEventEntry range](self, "range");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v13);
    v15 = v14 > -1.0;

  }
  -[PLAccountingPowerEventEntry rootNodeID](self, "rootNodeID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "intValue");

  if (v17 == 54)
  {
    -[PLAccountingEventEntry range](self, "range");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "length");
    v20 = v19;
    v21 = v34;
    objc_msgSend(v34, "range");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "length");
    v24 = v20 + v23;

    v25 = 1800.0;
    goto LABEL_6;
  }
  -[PLAccountingPowerEventEntry rootNodeID](self, "rootNodeID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "intValue") != 56 || !objc_msgSend(MEMORY[0x24BE74FD8], "hasAOD"))
  {

    v21 = v34;
    goto LABEL_14;
  }
  v27 = _os_feature_enabled_impl();

  v21 = v34;
  if (v27)
  {
    -[PLAccountingEventEntry range](self, "range");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "length");
    v30 = v29;
    objc_msgSend(v34, "range");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "length");
    v24 = v30 + v32;

    v25 = 60.0;
LABEL_6:
    if (v24 >= v25)
      v15 = 0;
  }
LABEL_14:

  return v15;
}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccountingPowerEventIntervalEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

void __47__PLAccountingPowerEventIntervalEntry_entryKey__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BE74F88], "entryKeyForType:andName:", *MEMORY[0x24BE75220], *MEMORY[0x24BE75150]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)entryKey_entryKey_3;
  entryKey_entryKey_3 = v0;

}

- (PLAccountingPowerEventIntervalEntry)initWithRootNodeID:(id)a3 withPower:(double)a4 withStartDate:(id)a5 withEndDate:(id)a6
{
  PLAccountingPowerEventIntervalEntry *v7;
  id v11;
  void *v12;
  PLAccountingPowerEventIntervalEntry *v13;
  objc_super v15;

  v7 = 0;
  if (a5 && a6)
  {
    v11 = a3;
    +[PLAccountingRange rangeWithStartDate:withEndDate:](PLAccountingRange, "rangeWithStartDate:withEndDate:", a5, a6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15.receiver = self;
    v15.super_class = (Class)PLAccountingPowerEventIntervalEntry;
    v13 = -[PLAccountingPowerEventEntry initWithRootNodeID:withPower:withRange:](&v15, sel_initWithRootNodeID_withPower_withRange_, v11, v12, a4);

    self = v13;
    v7 = self;
  }

  return v7;
}

@end
