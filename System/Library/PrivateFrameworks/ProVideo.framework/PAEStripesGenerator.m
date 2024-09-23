@implementation PAEStripesGenerator

- (PAEStripesGenerator)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEStripesGenerator;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (BOOL)variesOverTime
{
  return 0;
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAEStripesGenerator;
  -[PAESharedDefaultBase addParameters](&v6, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("StripesGenerator::Center"), 0, 0), 310, 0, 0.5, 0.5);
    objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:defaultAlpha:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("StripesGenerator::Color 1"), 0, 0), 311, 0, 1.0, 1.0, 1.0, 1.0);
    objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:defaultAlpha:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("StripesGenerator::Color 2"), 0, 0), 312, 0, 0.0, 0.0, 0.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("StripesGenerator::Size"), 0, 0), 313, 0, 80.0, 0.0, 800.0, 0.0, 800.0, 10.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("StripesGenerator::Contrast"), 0, 0), 314, 0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.1);
  }
  return v3 != 0;
}

- (id)properties
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("MayRemapTime"), v4, CFSTR("PreservesAlpha"), v5, CFSTR("SupportsHeliumRendering"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
}

- (BOOL)canThrowRenderOutput:(id)a3 withInfo:(id *)a4
{
  void *v7;
  uint64_t v8;
  BOOL v9;
  BOOL v10;
  unint64_t v11;
  unint64_t v12;
  double var3;
  double v14;
  double v15;
  HgcStripes *v16;
  double v17;
  float v18;
  float v19;
  char *v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  _QWORD v34[17];
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;

  v7 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v8 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v7)
    v9 = v8 == 0;
  else
    v9 = 1;
  v10 = !v9;
  if (!v9)
  {
    v45 = 0.5;
    v46 = 0.5;
    v43 = 1.0;
    v44 = 1.0;
    v41 = 1.0;
    v42 = 1.0;
    v39 = 0.0;
    v40 = 0.0;
    v37 = 1.0;
    v38 = 0.0;
    v35 = 1.0;
    v36 = 80.0;
    v11 = objc_msgSend(a3, "height");
    v12 = objc_msgSend(a3, "width");
    var3 = a4->var3;
    objc_msgSend(v7, "getXValue:YValue:fromParm:atFxTime:", &v46, &v45, 310, a4->var0.var1);
    objc_msgSend(v7, "getRedValue:greenValue:blueValue:alphaValue:fromParm:atFxTime:", &v44, &v43, &v42, &v41, 311, a4->var0.var1);
    v43 = v41 * v43;
    v44 = v41 * v44;
    v42 = v41 * v42;
    objc_msgSend(v7, "getRedValue:greenValue:blueValue:alphaValue:fromParm:atFxTime:", &v40, &v39, &v38, &v37, 312, a4->var0.var1);
    v39 = v37 * v39;
    v40 = v37 * v40;
    v38 = v37 * v38;
    objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v36, 313, a4->var0.var1);
    objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v35, 314, a4->var0.var1);
    v35 = v35 * (v36 * 0.5);
    -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a3);
    v14 = *(double *)&v34[1];
    v15 = *(double *)&v34[6];
    if (-[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a4->var0.var1))
    {
      if (objc_msgSend(a3, "imageType") == 3)
      {
        v16 = (HgcStripes *)HGObject::operator new(0x1A0uLL);
        HgcStripes::HgcStripes(v16);
        v17 = v14 * (double)v11;
        *(_QWORD *)v16 = &unk_1E64E1620;
        v34[0] = v16;
        v36 = var3 * v36;
        v18 = -(v15 * (double)v12) * (v46 + -0.5);
        v19 = v17 * v45;
        HgcStripes::SetParameter(v16, 0, v18, v19, 0.0, 0.0, v20);
        v21 = v44;
        v22 = v43;
        v23 = v42;
        v24 = v41;
        (*(void (**)(HgcStripes *, uint64_t, float, float, float, float))(*(_QWORD *)v16 + 96))(v16, 1, v21, v22, v23, v24);
        v25 = v40;
        v26 = v39;
        v27 = v38;
        v28 = v37;
        (*(void (**)(HgcStripes *, uint64_t, float, float, float, float))(*(_QWORD *)v16 + 96))(v16, 2, v25, v26, v27, v28);
        v29 = 1.0 / (v36 + v36);
        v30 = v35 + v35;
        v31 = (1.0 - v35) * 0.5;
        v32 = v17;
        (*(void (**)(HgcStripes *, uint64_t, float, float, float, float))(*(_QWORD *)v16 + 96))(v16, 3, v29, v30, v31, v32);
        (*(void (**)(HgcStripes *, uint64_t, float, float, float, float))(*(_QWORD *)v16 + 96))(v16, 4, 1.0, 1.0, 0.0, 0.0);
        objc_msgSend(a3, "setHeliumRef:", v34);
        if (v34[0])
          (*(void (**)(_QWORD))(*(_QWORD *)v34[0] + 24))(v34[0]);
      }
    }
  }
  return v10;
}

- (BOOL)frameSetup:(id *)a3 hardware:(BOOL *)a4 software:(BOOL *)a5
{
  __int128 v5;
  _OWORD v7[3];

  *a5 = 0;
  *a4 = 0;
  v5 = *(_OWORD *)&a3->var2;
  v7[0] = *(_OWORD *)&a3->var0.var0;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a3->var4;
  -[PAESharedDefaultBase overrideFrameSetupForRenderMode:hardware:software:](self, "overrideFrameSetupForRenderMode:hardware:software:", v7);
  return 1;
}

@end
