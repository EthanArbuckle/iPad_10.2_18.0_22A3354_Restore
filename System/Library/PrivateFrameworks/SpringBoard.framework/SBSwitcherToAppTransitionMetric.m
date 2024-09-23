@implementation SBSwitcherToAppTransitionMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  PETDistributionEventTracker *tracker;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (a3 == 14)
  {
    objc_msgSend(a4, "eventPayload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DABF48]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DABF40]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

    tracker = self->_tracker;
    v13[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PETDistributionEventTracker trackEventWithPropertyValues:value:](tracker, "trackEventWithPropertyValues:value:", v11, (double)v9);

  }
  return a3 == 14;
}

- (SBSwitcherToAppTransitionMetric)init
{
  SBSwitcherToAppTransitionMetric *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  PETDistributionEventTracker *tracker;
  objc_super v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)SBSwitcherToAppTransitionMetric;
  v2 = -[SBSwitcherToAppTransitionMetric init](&v11, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0D80F20];
    v13[0] = &unk_1E91D0A28;
    v13[1] = &unk_1E91D0A40;
    v14[0] = CFSTR("CommandTab");
    v14[1] = CFSTR("MainSwitcher");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "propertyWithName:enumMapping:", CFSTR("Type"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc(MEMORY[0x1E0D80F18]);
    v12 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithFeatureId:event:registerProperties:", CFSTR("SpringBoard"), CFSTR("SwitcherTransition"), v7);
    tracker = v2->_tracker;
    v2->_tracker = (PETDistributionEventTracker *)v8;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracker, 0);
}

@end
