@implementation SBSwitcherPresentationInteractionMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  PETScalarEventTracker *tracker;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (a3 == 5)
  {
    objc_msgSend(a4, "eventPayload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DABE78]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntegerValue");

    if (v8 == 2)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DABE70]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "unsignedIntegerValue");

      if ((unint64_t)(v10 - 1) > 0x1A)
        v11 = 0;
      else
        v11 = qword_1D0E8BB18[v10 - 1];
      tracker = self->_tracker;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PETScalarEventTracker trackEventWithPropertyValues:](tracker, "trackEventWithPropertyValues:", v14);

    }
  }
  return a3 == 5;
}

- (SBSwitcherPresentationInteractionMetric)init
{
  SBSwitcherPresentationInteractionMetric *v2;
  id v3;
  unint64_t i;
  const __CFString *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  PETScalarEventTracker *tracker;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)SBSwitcherPresentationInteractionMetric;
  v2 = -[SBSwitcherPresentationInteractionMetric init](&v13, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    for (i = 0; i != 26; ++i)
    {
      v5 = CFSTR("homescreen");
      if (i <= 0x19)
        v5 = off_1E8EBEE88[i];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v6);

    }
    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:enumMapping:", CFSTR("method"), v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0D80F38]);
    v14[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithFeatureId:event:registerProperties:", CFSTR("SpringBoard"), CFSTR("PresentSwitcher"), v9);
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v10;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracker, 0);
}

@end
