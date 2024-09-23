@implementation SBSpringloadingMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  PETScalarEventTracker *springloadTracker;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (a3 == 31)
  {
    objc_msgSend(a4, "eventPayload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DABD88]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntegerValue");

    springloadTracker = self->_springloadTracker;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PETScalarEventTracker trackEventWithPropertyValues:](springloadTracker, "trackEventWithPropertyValues:", v11);

  }
  return a3 == 31;
}

- (SBSpringloadingMetric)init
{
  SBSpringloadingMetric *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  PETScalarEventTracker *springloadTracker;
  objc_super v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)SBSpringloadingMetric;
  v2 = -[SBSpringloadingMetric init](&v11, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0D80F20];
    v13[0] = &unk_1E91D0590;
    v13[1] = &unk_1E91D05A8;
    v14[0] = CFSTR("icon");
    v14[1] = CFSTR("gridSwitcher");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "propertyWithName:enumMapping:", CFSTR("location"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc(MEMORY[0x1E0D80F38]);
    v12 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithFeatureId:event:registerProperties:", CFSTR("SpringBoard"), CFSTR("Springload"), v7);
    springloadTracker = v2->_springloadTracker;
    v2->_springloadTracker = (PETScalarEventTracker *)v8;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_springloadTracker, 0);
}

@end
