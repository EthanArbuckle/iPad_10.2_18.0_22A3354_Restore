@implementation PAEKeyerSetupUtil

- (PAEKeyerSetupUtil)initWithAPIManager:(id)a3 colorPrimaries:(int)a4 atTime:(id)a5
{
  PAEKeyerSetupUtil *v6;
  uint64_t v7;
  id *omKeyer;
  PAEKeyerCbCrSetup *keyerCbCrSetup;
  PAEKeyerCbCrSetup *v10;
  id *v11;
  PAEKeyerLumaSetup *keyerLumaSetup;
  PAEKeyerLumaSetup *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PAEKeyerSetupUtil;
  v6 = -[PAEKeyerSetupUtil init](&v15, sel_init, a3, *(_QWORD *)&a4, a5.var1);
  if (v6)
  {
    v7 = operator new();
    PAEKeyerOMKeyer2D::PAEKeyerOMKeyer2D(v7, a4);
    v6->_omKeyer = (void *)v7;
    v6->_keyerCbCrSetup = objc_alloc_init(PAEKeyerCbCrSetup);
    v6->_keyerLumaSetup = objc_alloc_init(PAEKeyerLumaSetup);
    omKeyer = (id *)v6->_omKeyer;
    keyerCbCrSetup = v6->_keyerCbCrSetup;
    v10 = keyerCbCrSetup;

    omKeyer[31] = keyerCbCrSetup;
    v11 = (id *)v6->_omKeyer;
    keyerLumaSetup = v6->_keyerLumaSetup;
    v13 = keyerLumaSetup;

    v11[30] = keyerLumaSetup;
    (*(void (**)(void *, float, float))(*(_QWORD *)v6->_omKeyer + 152))(v6->_omKeyer, 0.1, 0.0);
  }
  return v6;
}

- (PAEKeyerSetupUtil)initWithOMSamples:(void *)a3 colorPrimaries:(int)a4 atTime:(id)a5
{
  PAEKeyerSetupUtil *v7;
  PAEKeyerSetupUtil *v8;
  uint64_t v9;
  id *omKeyer;
  PAEKeyerCbCrSetup *keyerCbCrSetup;
  PAEKeyerCbCrSetup *v12;
  id *v13;
  PAEKeyerLumaSetup *keyerLumaSetup;
  PAEKeyerLumaSetup *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PAEKeyerSetupUtil;
  v7 = -[PAEKeyerSetupUtil init](&v17, sel_init, a3, *(_QWORD *)&a4, a5.var1);
  v8 = v7;
  if (v7)
  {
    v7->_omSamples = a3;
    v9 = operator new();
    PAEKeyerOMKeyer2D::PAEKeyerOMKeyer2D(v9, a4);
    v8->_omKeyer = (void *)v9;
    v8->_keyerCbCrSetup = objc_alloc_init(PAEKeyerCbCrSetup);
    v8->_keyerLumaSetup = objc_alloc_init(PAEKeyerLumaSetup);
    omKeyer = (id *)v8->_omKeyer;
    keyerCbCrSetup = v8->_keyerCbCrSetup;
    v12 = keyerCbCrSetup;

    omKeyer[31] = keyerCbCrSetup;
    v13 = (id *)v8->_omKeyer;
    keyerLumaSetup = v8->_keyerLumaSetup;
    v15 = keyerLumaSetup;

    v13[30] = keyerLumaSetup;
    (*(void (**)(void *, float, float))(*(_QWORD *)v8->_omKeyer + 152))(v8->_omKeyer, 0.1, 0.0);
  }
  return v8;
}

- (void)dealloc
{
  void *omKeyer;
  objc_super v4;

  omKeyer = self->_omKeyer;
  if (omKeyer)
    (*(void (**)(void *, SEL))(*(_QWORD *)omKeyer + 8))(omKeyer, a2);

  v4.receiver = self;
  v4.super_class = (Class)PAEKeyerSetupUtil;
  -[PAEKeyerSetupUtil dealloc](&v4, sel_dealloc);
}

- (BOOL)tight
{
  return 0;
}

- (double)autoAdjustSoftGap
{
  return 9.0;
}

- (double)simpleKeyAmount
{
  return 0.0;
}

- (double)autoKeySoftness
{
  return 9.0;
}

- (double)shadowsGain
{
  return 2.5;
}

- (double)highlightsGain
{
  return 2.5;
}

- (double)spreadGain
{
  return 1.0;
}

- (BOOL)addTolerance
{
  return 1;
}

- (BOOL)defineEdge
{
  return 0;
}

- (BOOL)autoScale
{
  return 0;
}

- (BOOL)keyerActiveAt:(id)a3
{
  return 1;
}

- (void)omKeyer
{
  return self->_omKeyer;
}

@end
