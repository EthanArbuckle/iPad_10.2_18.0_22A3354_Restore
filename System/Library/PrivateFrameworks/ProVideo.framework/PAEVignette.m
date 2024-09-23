@implementation PAEVignette

- (PAEVignette)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEVignette;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4
{
  *a3 = 1;
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAEVignette;
  -[PAESharedDefaultBase addParameters](&v6, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Vignette::Size"), 0, 0), 1, 0, 0.6, 0.0, 1.5, 0.0, 1.5, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Vignette::Falloff"), 0, 0), 5, 0, 0.5, 0.001, 1.0, 0.001, 1.0, 0.01);
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Vignette::Center"), 0, 0), 6, 0, 0.5, 0.5);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Vignette::Blur Amount"), 0, 0), 2, 0, 4.0, 0.0, 400.0, 0.0, 16.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Vignette::Darken"), 0, 0), 3, 0, 0.3, 0.0, 1.0, 0.0, 1.0, 0.01);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Vignette::Saturation"), 0, 0), 4, 0, 0.3, -3.0, 3.0, -1.0, 1.0, 0.01);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", CFSTR("Prescale Input"), 7, 0, 2);
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  uint64_t v10;
  BOOL v11;
  BOOL result;
  uint64_t v13;
  int v14;
  double v15;
  double v16;
  HgcVignetteBB *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  unint64_t v22;
  unint64_t v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  HgcVignetteBB *v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  double v40;
  double v41;

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A4590);
  v10 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v9)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (v11)
    return 0;
  v13 = objc_msgSend(a4, "imageType");
  v14 = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
  objc_msgSend(v9, "mixAmountAtTime:", a5->var0.var1);
  result = 0;
  if (v14 && v13 == 3)
  {
    v16 = v15;
    v41 = 0.0;
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v41, 1, a5->var0.var1);
    if (v41 == 0.0)
    {
      if (a4)
        objc_msgSend(a4, "heliumRef", v41);
      else
        v35 = 0.0;
      objc_msgSend(a3, "setHeliumRef:", &v35);
      if (v35 != 0.0)
        (*(void (**)(double))(**(_QWORD **)&v35 + 24))(COERCE_DOUBLE(*(_QWORD *)&v35));
    }
    else
    {
      v41 = 1.5 - v41;
      v40 = 0.0;
      objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v40, 5, a5->var0.var1);
      v39 = 0;
      objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v39, 2, a5->var0.var1);
      v38 = 0.0;
      objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v38, 3, a5->var0.var1);
      v37 = 0.0;
      objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v37, 4, a5->var0.var1);
      v35 = 0.0;
      v36 = 0.0;
      objc_msgSend(v9, "getXValue:YValue:fromParm:atFxTime:", &v35, &v36, 6, a5->var0.var1);
      if (a4)
        objc_msgSend(a4, "heliumRef");
      else
        v34 = 0;
      v17 = (HgcVignetteBB *)HGObject::operator new(0x1A0uLL);
      HgcVignetteBB::HgcVignetteBB(v17);
      v33 = v17;
      (*(void (**)(HgcVignetteBB *, _QWORD, uint64_t))(*(_QWORD *)v17 + 120))(v17, 0, v34);
      v19 = v40;
      v18 = v41;
      v20 = v37;
      v21 = v38;
      v22 = objc_msgSend(a4, "width");
      v23 = objc_msgSend(a4, "height");
      v24 = v35 + -0.5;
      v25 = v36 + -0.5;
      (*(void (**)(HgcVignetteBB *, _QWORD, float, float, float, float))(*(_QWORD *)v17 + 96))(v17, 0, v24, v25, 0.0, 0.0);
      v26 = 1.0 / ((1.50999999 - v18) * v19);
      v27 = -(v18 * v26);
      (*(void (**)(HgcVignetteBB *, uint64_t, float, float, float, float))(*(_QWORD *)v17 + 96))(v17, 1, v26, v27, 0.0, 0.0);
      v28 = 1.0 - v21;
      v29 = v20 + 1.0;
      (*(void (**)(HgcVignetteBB *, uint64_t, float, float, float, float))(*(_QWORD *)v17 + 96))(v17, 2, v28, v29, 1.0, 1.0);
      v30 = 1.0 / (double)v22;
      v31 = 1.0 / (double)v23;
      (*(void (**)(HgcVignetteBB *, uint64_t, float, float, float, float))(*(_QWORD *)v17 + 96))(v17, 3, v30, v31, 0.0, 0.0);
      v32 = v16;
      (*(void (**)(HgcVignetteBB *, uint64_t, float, float, float, float))(*(_QWORD *)v17 + 96))(v17, 4, v32, 0.0, 0.0, 0.0);
      objc_msgSend(a3, "setHeliumRef:", &v33);
      if (v33)
        (*(void (**)(HgcVignetteBB *))(*(_QWORD *)v33 + 24))(v33);
      if (v34)
        (*(void (**)(uint64_t))(*(_QWORD *)v34 + 24))(v34);
    }
    return 1;
  }
  return result;
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

- (id)properties
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("MayRemapTime"), v4, CFSTR("SupportsHeliumRendering"), v5, CFSTR("InputSizeLimit"), v6, CFSTR("SupportsInternalMixing"), v7, CFSTR("PositionIndependent"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1), CFSTR("AutoColorProcessingSupport"), 0);
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id result;
  objc_class *v10;
  id v11;
  double v12;

  v12 = 0.0;
  if ((objc_msgSend(-[PAEFilterDefaultBase getParamAPIWithError:](self, "getParamAPIWithError:", a4), "getFloatValue:fromParm:atFxTime:", &v12, 1, a3.var1) & 1) != 0)
  {
    if (v12 == 0.0)
      v6 = 6;
    else
      v6 = 1;
    v7 = (void *)MEMORY[0x1E0C99D80];
    v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6, v12);
    return (id)objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, CFSTR("PixelTransformSupport"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), CFSTR("SupportsStableAnimation"), 0);
  }
  else if (a4)
  {
    v10 = (objc_class *)objc_opt_class();
    v11 = -[PAEFilterDefaultBase getParamErrorFor:](self, "getParamErrorFor:", NSStringFromClass(v10));
    result = 0;
    *a4 = v11;
  }
  else
  {
    return 0;
  }
  return result;
}

@end
