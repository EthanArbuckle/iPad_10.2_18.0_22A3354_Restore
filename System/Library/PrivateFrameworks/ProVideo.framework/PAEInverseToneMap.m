@implementation PAEInverseToneMap

- (PAEInverseToneMap)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEInverseToneMap;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (id)properties
{
  if (-[PAEInverseToneMap properties]::once != -1)
    dispatch_once(&-[PAEInverseToneMap properties]::once, &__block_literal_global_36);
  return (id)-[PAEInverseToneMap properties]::sPropertiesDict;
}

uint64_t __31__PAEInverseToneMap_properties__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  v1 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 67584);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 591872);
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3);
  result = objc_msgSend(v0, "initWithObjectsAndKeys:", MEMORY[0x1E0C9AAB0], CFSTR("PixelIndependent"), v1, CFSTR("PixelIndependent"), v2, CFSTR("PositionIndependent"), v3, CFSTR("MayRemapTime"), v4, CFSTR("SupportsLargeRenderScale"), v5, CFSTR("SupportsHeliumRendering"), v6, CFSTR("SDRWorkingSpace"), v7, CFSTR("HDRWorkingSpace"), v8,
             CFSTR("AutoColorProcessingSupport"),
             0);
  -[PAEInverseToneMap properties]::sPropertiesDict = result;
  return result;
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAEInverseToneMap;
  -[PAESharedDefaultBase addParameters](&v6, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("PAE_ITM::Gamma"), 0, 0), 1, 0, 0.699999988, 0.0, 2.0, 0.0, 2.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("PAE_ITM::Max"), 0, 0), 2, 0, 12.0, 0.0, 100.0, 0.0, 12.0, 0.1);
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v8;
  void *v9;
  float v10;
  float v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;

  v8 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v9 = v8;
  if (v8)
  {
    v16 = 0.0;
    v17 = 0.0;
    objc_msgSend(v8, "getFloatValue:fromParm:atFxTime:", &v17, 1, a5->var0.var1);
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v16, 2, a5->var0.var1);
    if (a4)
      objc_msgSend(a4, "heliumRef");
    else
      v15 = 0;
    v10 = v17;
    v11 = v16;
    FxApplyInverseSimpleToneCurve(&v15, &v14, v10, v11);
    v12 = v14;
    if (v15 == v14)
    {
      if (v15)
        (*(void (**)(void))(*(_QWORD *)v15 + 24))();
    }
    else
    {
      if (v15)
      {
        (*(void (**)(void))(*(_QWORD *)v15 + 24))();
        v12 = v14;
      }
      v15 = v12;
    }
    objc_msgSend(a3, "setHeliumRef:", &v15);
    if (v15)
      (*(void (**)(uint64_t))(*(_QWORD *)v15 + 24))(v15);
  }
  return v9 != 0;
}

- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6
{
  __int128 v6;
  _OWORD v8[3];

  *a6 = 0;
  *a5 = 0;
  v6 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0.var0;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a3->var4;
  -[PAESharedDefaultBase overrideFrameSetupForRenderMode:hardware:software:](self, "overrideFrameSetupForRenderMode:hardware:software:", v8, a5, a6);
  return 1;
}

@end
