@implementation PAEThreshold

- (PAEThreshold)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEThreshold;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (id)properties
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", &unk_1E66491F8, CFSTR("PixelTransformSupport"), v3, CFSTR("PixelIndependent"), v4, CFSTR("PositionIndependent"), v5, CFSTR("MayRemapTime"), v6, CFSTR("SupportsLargeRenderScale"), v7, CFSTR("SupportsHeliumRendering"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1), CFSTR("AutoColorProcessingSupport"), 0);
}

- (BOOL)addParameters
{
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PAEThreshold;
  -[PAESharedDefaultBase addParameters](&v7, sel_addParameters);
  v3 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Threshold::Threshold"), 0, 0), 1, 0, 0.5, 0.0, 1.0, 0.0, 1.0, 0.01);
    objc_msgSend(v4, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Threshold::Smoothness"), 0, 0), 2, 0, 0.15, 0.0, 1.0, 0.0, 1.0, 0.01);
    objc_msgSend(v4, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Threshold::Dark Color"), 0, 0), 3, 0, 0.0, 0.0, 0.0);
    objc_msgSend(v4, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Threshold::Light Color"), 0, 0), 4, 0, 1.0, 1.0, 1.0);
    objc_msgSend(v4, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Threshold::Correct For Alpha"), 0, 0), 5, 0, 33);
  }
  return 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  HgcThreshold *v14;
  double v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  HgcThreshold *v25;
  uint64_t v26;
  int v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (v9)
  {
    v10 = v9;
    v35 = 0.0;
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v35, 1, a5->var0.var1);
    v34 = 0.0;
    objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v34, 2, a5->var0.var1);
    v32 = 0.0;
    v33 = 0.0;
    v31 = 0.0;
    objc_msgSend(v10, "getRedValue:greenValue:blueValue:fromParm:atFxTime:", &v33, &v32, &v31, 3, a5->var0.var1);
    v29 = 0.0;
    v30 = 0.0;
    v28 = 0.0;
    objc_msgSend(v10, "getRedValue:greenValue:blueValue:fromParm:atFxTime:", &v30, &v29, &v28, 4, a5->var0.var1);
    v27 = 0;
    v11 = objc_msgSend(v10, "getIntValue:fromParm:atFxTime:", &v27, 5, a5->var0.var1);
    LODWORD(v9) = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
    if ((_DWORD)v9)
    {
      if (objc_msgSend(a4, "imageType") == 3)
      {
        v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
        if (v9)
        {
          v12 = v9;
          if (a4)
            objc_msgSend(a4, "heliumRef");
          else
            v26 = 0;
          v25 = 0;
          if (v27)
            v13 = v11;
          else
            v13 = 0;
          if (v13 == 1)
          {
            v14 = (HgcThreshold *)HGObject::operator new(0x1A0uLL);
            HgcThreshold::HgcThreshold(v14);
          }
          else
          {
            v14 = (HgcThreshold *)HGObject::operator new(0x1A0uLL);
            HgcThresholdNoPremult::HgcThresholdNoPremult(v14);
          }
          if (v14)
            v25 = v14;
          v15 = v34;
          if (v34 == 0.0)
          {
            v34 = 0.00100000005;
            v15 = 0.00100000005;
          }
          (*(void (**)(HgcThreshold *, _QWORD, uint64_t))(*(_QWORD *)v14 + 120))(v14, 0, v26);
          v16 = v35;
          (*(void (**)(HgcThreshold *, _QWORD, float, float, float, float))(*(_QWORD *)v14 + 96))(v14, 0, v16, 0.0, 0.0, 0.0);
          v17 = 1.0 / v15;
          (*(void (**)(HgcThreshold *, uint64_t, float, float, float, float))(*(_QWORD *)v14 + 96))(v14, 1, v17, 0.0, 0.0, 0.0);
          objc_msgSend(v12, "versionAtCreation");
          v18 = v33;
          v19 = v32;
          v20 = v31;
          (*(void (**)(HgcThreshold *, uint64_t, float, float, float, float))(*(_QWORD *)v14 + 96))(v14, 2, v18, v19, v20, 1.0);
          v21 = v30;
          v22 = v29;
          v23 = v28;
          (*(void (**)(HgcThreshold *, uint64_t, float, float, float, float))(*(_QWORD *)v14 + 96))(v14, 3, v21, v22, v23, 1.0);
          objc_msgSend(a3, "setHeliumRef:", &v25);
          if (v25)
            (*(void (**)(HgcThreshold *))(*(_QWORD *)v25 + 24))(v25);
          if (v26)
            (*(void (**)(uint64_t))(*(_QWORD *)v26 + 24))(v26);
          LOBYTE(v9) = 1;
        }
      }
      else
      {
        LOBYTE(v9) = 0;
      }
    }
  }
  return (char)v9;
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
