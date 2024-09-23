@implementation PAEOuterGlow

- (PAEOuterGlow)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEOuterGlow;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (id)properties
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PositionIndependent"), v4, CFSTR("MayRemapTime"), v5, CFSTR("SupportsLargeRenderScale"), v6, CFSTR("SupportsHeliumRendering"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1), CFSTR("AutoColorProcessingSupport"), 0);
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  id result;
  id v8;
  uint64_t v10;
  objc_class *v11;
  id v12;
  char v13;
  double v14;

  result = -[PAEFilterDefaultBase getParamAPIWithError:](self, "getParamAPIWithError:", a4);
  if (result)
  {
    v8 = result;
    v14 = 0.0;
    if ((objc_msgSend(result, "getFloatValue:fromParm:atFxTime:", &v14, 1, a3.var1) & 1) != 0
      && (v13 = 0, (objc_msgSend(v8, "getBoolValue:fromParm:atFxTime:", &v13, 8, a3.var1) & 1) != 0))
    {
      if (v14 == 0.0 && v13 == 0)
        v10 = 6;
      else
        v10 = 1;
      return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10, v14), CFSTR("PixelTransformSupport"), 0);
    }
    else if (a4)
    {
      v11 = (objc_class *)objc_opt_class();
      v12 = -[PAEFilterDefaultBase getParamErrorFor:](self, "getParamErrorFor:", NSStringFromClass(v11));
      result = 0;
      *a4 = v12;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  BOOL v5;
  BOOL v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PAEOuterGlow;
  -[PAESharedDefaultBase addParameters](&v13, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  v4 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v3)
    v5 = v4 == 0;
  else
    v5 = 1;
  v6 = !v5;
  if (!v5)
  {
    v7 = objc_msgSend(v4, "versionAtCreation");
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OuterGlow::Radius"), 0, 0);
    if (v7 >= 2)
      v10 = 1000.0;
    else
      v10 = 15.0;
    if (v7 >= 2)
      v11 = 30.0;
    else
      v11 = 15.0;
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", v9, 1, 0, 2.0, 0.0, v10, 0.0, v11, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OuterGlow::Brightness"), 0, 0), 2, 0, 15.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OuterGlow::Inner Color"), 0, 0), 3, 0, 1.0, 1.0, 0.0);
    objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OuterGlow::Outer Color"), 0, 0), 4, 0, 1.0, 0.0, 0.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OuterGlow::Range"), 0, 0), 5, 0, 0.25, 0.0, 1.0, 0.0, 1.0, 0.01);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OuterGlow::Horizontal"), 0, 0), 6, 32, 100.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OuterGlow::Vertical"), 0, 0), 7, 32, 100.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OuterGlow::Crop"), 0, 0), 8, 0, 33);
  }
  return v6;
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  void *v10;
  void *v11;
  unint64_t var1;
  unint64_t var0;
  float v15;
  double v16;
  unsigned int v17;
  double v18;
  double v19;
  char v20;
  double v21;

  v10 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v11 = v10;
  if (v10)
  {
    v21 = 0.0;
    objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v21, 1, a6->var0.var1);
    v20 = 0;
    objc_msgSend(v11, "getBoolValue:fromParm:atFxTime:", &v20, 8, a6->var0.var1);
    v19 = 0.0;
    objc_msgSend(v11, "getFloatValue:fromParm:atFxTime:", &v19, 6, a6->var0.var1);
    v19 = v19 * 0.01;
    v18 = 0.0;
    objc_msgSend(v11, "getFloatValue:fromParm:atFxTime:", &v18, 7, a6->var0.var1);
    var0 = a5->var0;
    var1 = a5->var1;
    if (v20)
    {
      if (a3)
        *a3 = var0;
      if (a4)
LABEL_6:
        *a4 = var1;
    }
    else
    {
      v15 = v21 * 3.0;
      v16 = v15;
      v17 = vcvtpd_s64_f64(v18 * 0.01 * v16);
      if (a3)
        *a3 = var0 + (int)(2 * vcvtpd_s64_f64(v19 * v16));
      var1 += (int)(2 * v17);
      if (a4)
        goto LABEL_6;
    }
  }
  return v11 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  double v14;
  double v15;
  double v16;
  double v17;
  int v18;
  HGaussianBlur *v19;
  float v20;
  float v21;
  float v22;
  HgcOuterGlowColorize *v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  __n128 v31;
  HgcOuterGlowLumaWeight *v32;
  HgcOuterGlowLumaWeight *v33;
  uint64_t v34;
  char v35;
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
  double v47;
  double v48;

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v10 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v9)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (v11)
    return 0;
  v12 = (void *)v10;
  if (objc_msgSend(a4, "imageType") != 3)
    return 0;
  v48 = 0.0;
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v48, 1, a5->var0.var1);
  if (v48 == 0.0)
  {
    if (a4)
      objc_msgSend(a4, "heliumRef", v48);
    else
      v46 = 0.0;
    objc_msgSend(a3, "setHeliumRef:", &v46);
    if (v46 != 0.0)
      (*(void (**)(double))(**(_QWORD **)&v46 + 24))(COERCE_DOUBLE(*(_QWORD *)&v46));
  }
  else
  {
    -[PAESharedDefaultBase getScaleForImage:](self, "getScaleForImage:", a4, v48);
    v14 = v46;
    v15 = v47;
    if (v46 <= v47)
      v16 = v47;
    else
      v16 = v46;
    v48 = v48 * v16;
    v45 = 0.0;
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v45, 6, a5->var0.var1);
    v45 = v14 / v16 * (v45 * 0.01);
    v44 = 0.0;
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v44, 7, a5->var0.var1);
    v44 = v15 / v16 * (v44 * 0.01);
    v43 = 0.0;
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v43, 2, a5->var0.var1);
    v41 = 0.0;
    v42 = 0.0;
    v40 = 0.0;
    objc_msgSend(v9, "getRedValue:greenValue:blueValue:fromParm:atFxTime:", &v42, &v41, &v40, 3, a5->var0.var1);
    v38 = 0.0;
    v39 = 0.0;
    v37 = 0.0;
    objc_msgSend(v9, "getRedValue:greenValue:blueValue:fromParm:atFxTime:", &v39, &v38, &v37, 4, a5->var0.var1);
    v36 = 0.0;
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v36, 5, a5->var0.var1);
    v35 = 0;
    objc_msgSend(v9, "getBoolValue:fromParm:atFxTime:", &v35, 8, a5->var0.var1);
    v17 = v36;
    if (v36 < 0.00100000005)
      v17 = 0.00100000005;
    v36 = v17;
    v43 = v43 * 4.0;
    v18 = objc_msgSend(v12, "versionAtCreation");
    v43 = v43 / 12.5;
    if (a4)
      objc_msgSend(a4, "heliumRef");
    else
      v34 = 0;
    v19 = (HGaussianBlur *)HGObject::operator new(0x1B0uLL);
    HGaussianBlur::HGaussianBlur(v19);
    v20 = v48;
    v21 = v45;
    v22 = v44;
    HGaussianBlur::init(v19, v20, v21, v22, v18 == 0, 0, 0);
    (*(void (**)(HGaussianBlur *, _QWORD, uint64_t))(*(_QWORD *)v19 + 120))(v19, 0, v34);
    (*(void (**)(HGaussianBlur *))(*(_QWORD *)v19 + 16))(v19);
    v23 = (HgcOuterGlowColorize *)HGObject::operator new(0x1A0uLL);
    HgcOuterGlowColorize::HgcOuterGlowColorize(v23);
    v24 = v39;
    v25 = v38;
    v26 = v37;
    (*(void (**)(HgcOuterGlowColorize *, _QWORD, float, float, float, float))(*(_QWORD *)v23 + 96))(v23, 0, v24, v25, v26, 1.0);
    v27 = v42;
    v28 = v41;
    v29 = v40;
    (*(void (**)(HgcOuterGlowColorize *, uint64_t, float, float, float, float))(*(_QWORD *)v23 + 96))(v23, 1, v27, v28, v29, 1.0);
    v30 = v43;
    (*(void (**)(HgcOuterGlowColorize *, uint64_t, float, float, float, float))(*(_QWORD *)v23 + 96))(v23, 2, v30, v30, v30, 1.0);
    v31.n128_u32[0] = 0;
    if (v36 > 0.0)
    {
      v31.n128_f64[0] = 1.0 / v36;
      v31.n128_f32[0] = 1.0 / v36;
    }
    (*(void (**)(HgcOuterGlowColorize *, uint64_t, __n128, float, float, float))(*(_QWORD *)v23 + 96))(v23, 3, v31, 0.0, 0.0, 0.0);
    (*(void (**)(HgcOuterGlowColorize *, _QWORD, HGaussianBlur *))(*(_QWORD *)v23 + 120))(v23, 0, v19);
    v32 = (HgcOuterGlowLumaWeight *)HGObject::operator new(0x1A0uLL);
    HgcOuterGlowLumaWeight::HgcOuterGlowLumaWeight(v32);
    v33 = v32;
    (*(void (**)(HgcOuterGlowLumaWeight *, _QWORD, float, float, float, float))(*(_QWORD *)v32 + 96))(v32, 0, 0.0, 0.0, 0.0, 1.0);
    (*(void (**)(HgcOuterGlowLumaWeight *, _QWORD, HgcOuterGlowColorize *))(*(_QWORD *)v33 + 120))(v33, 0, v23);
    (*(void (**)(HgcOuterGlowLumaWeight *, uint64_t, uint64_t))(*(_QWORD *)v33 + 120))(v33, 1, v34);
    if (v35)
      -[PAESharedDefaultBase crop:fromImage:toImage:](self, "crop:fromImage:toImage:", &v33, a4, a3);
    objc_msgSend(a3, "setHeliumRef:", &v33);
    if (v33)
      (*(void (**)(HgcOuterGlowLumaWeight *))(*(_QWORD *)v33 + 24))(v33);
    (*(void (**)(HgcOuterGlowColorize *))(*(_QWORD *)v23 + 24))(v23);
    (*(void (**)(HGaussianBlur *))(*(_QWORD *)v19 + 24))(v19);
    (*(void (**)(HGaussianBlur *))(*(_QWORD *)v19 + 24))(v19);
    if (v34)
      (*(void (**)(uint64_t))(*(_QWORD *)v34 + 24))(v34);
  }
  return 1;
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
