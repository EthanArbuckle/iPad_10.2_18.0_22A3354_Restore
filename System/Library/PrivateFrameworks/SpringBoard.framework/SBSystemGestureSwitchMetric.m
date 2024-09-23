@implementation SBSystemGestureSwitchMetric

- (SBSystemGestureSwitchMetric)init
{
  SBSystemGestureSwitchMetric *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBSystemGestureSwitchMetric;
  v2 = -[SBSystemGestureSwitchMetric init](&v4, sel_init);
  if (v2 && init_onceToken != -1)
    dispatch_once(&init_onceToken, &__block_literal_global_1);
  return v2;
}

void __35__SBSystemGestureSwitchMetric_init__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0D80F20];
  v8[0] = &unk_1E91CFBB8;
  v8[1] = &unk_1E91CFBD0;
  v9[0] = CFSTR("Next");
  v9[1] = CFSTR("Previous");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "propertyWithName:enumMapping:", CFSTR("Direction"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_alloc(MEMORY[0x1E0D80F38]);
  v7 = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "initWithFeatureId:event:registerProperties:", CFSTR("SpringBoard"), CFSTR("SwitchGesture"), v4);
  v6 = (void *)sTracker;
  sTracker = v5;

}

- (void)postWithDataBuilder:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = 0;
  (*((void (**)(id, uint64_t *))a3 + 2))(a3, &v6);
  v3 = (void *)sTracker;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trackEventWithPropertyValues:", v5);

}

@end
