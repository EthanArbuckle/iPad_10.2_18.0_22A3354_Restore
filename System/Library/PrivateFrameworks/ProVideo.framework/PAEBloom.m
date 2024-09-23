@implementation PAEBloom

- (PAEBloom)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEBloom;
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
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("MayRemapTime"), v4, CFSTR("SupportsLargeRenderScale"), v5, CFSTR("SupportsHeliumRendering"), v6, CFSTR("InputSizeLimit"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1), CFSTR("AutoColorProcessingSupport"), 0);
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id result;
  objc_class *v12;
  id v13;
  unsigned __int8 v14;
  unsigned __int8 v15;
  double v16;

  v7 = -[PAEFilterDefaultBase getParamAPIWithError:](self, "getParamAPIWithError:", a4);
  v16 = 0.0;
  if ((objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v16, 1, a3.var1) & 1) != 0
    && (v15 = 0, (objc_msgSend(v7, "getBoolValue:fromParm:atFxTime:", &v15, 6, a3.var1) & 1) != 0)
    && (v14 = 0, (objc_msgSend(v7, "getBoolValue:fromParm:atFxTime:", &v14, 8, a3.var1) & 1) != 0))
  {
    if (v16 == 0.0)
      v8 = 6;
    else
      v8 = 1;
    v9 = (void *)MEMORY[0x1E0C99D80];
    v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8, v16);
    return (id)objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, CFSTR("PixelTransformSupport"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (v15 | v14) == 0), CFSTR("PositionIndependent"), 0);
  }
  else if (a4)
  {
    v12 = (objc_class *)objc_opt_class();
    v13 = -[PAEFilterDefaultBase getParamErrorFor:](self, "getParamErrorFor:", NSStringFromClass(v12));
    result = 0;
    *a4 = v13;
  }
  else
  {
    return 0;
  }
  return result;
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  BOOL v5;
  BOOL v6;
  _BOOL8 v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PAEBloom;
  -[PAESharedDefaultBase addParameters](&v10, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  v4 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v3)
    v5 = v4 == 0;
  else
    v5 = 1;
  v6 = !v5;
  if (!v5)
  {
    v7 = objc_msgSend(v4, "versionAtCreation") < 2;
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Bloom::Amount"), 0, 0), 1, 0, 7.0, 0.0, 32.0, 0.0, 32.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Bloom::Brightness"), 0, 0), 2, 0, 70.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Bloom::Threshold"), 0, 0), 3, 0, 75.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Bloom::Horizontal"), 0, 0), 4, 32, 100.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Bloom::Vertical"), 0, 0), 5, 32, 100.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Bloom::Clip"), 0, 0), 7, v7, 1);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Bloom::Crop"), 0, 0), 6, 0, 33);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Bloom::Equirect"), 0, 0), 8, 0, 1);
  }
  return v6;
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  return 1;
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
  char v18;
  double v19;
  double v20;
  double v21;
  char v22;

  v10 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v11 = v10;
  if (v10)
  {
    v22 = 0;
    objc_msgSend(v10, "getBoolValue:fromParm:atFxTime:", &v22, 8, a6->var0.var1);
    if (v22)
    {
      if (a3)
        *a3 = a5->var0;
      if (a4)
      {
        var1 = a5->var1;
LABEL_11:
        *a4 = var1;
      }
    }
    else
    {
      v21 = 0.0;
      objc_msgSend(v11, "getFloatValue:fromParm:atFxTime:", &v21, 1, a6->var0.var1);
      v20 = 0.0;
      objc_msgSend(v11, "getFloatValue:fromParm:atFxTime:", &v20, 4, a6->var0.var1);
      v20 = v20 * 0.01;
      v19 = 0.0;
      objc_msgSend(v11, "getFloatValue:fromParm:atFxTime:", &v19, 5, a6->var0.var1);
      v19 = v19 * 0.01;
      v18 = 0;
      objc_msgSend(v11, "getBoolValue:fromParm:atFxTime:", &v18, 6, a6->var0.var1);
      var0 = a5->var0;
      var1 = a5->var1;
      if (v18)
      {
        if (a3)
          *a3 = var0;
        if (a4)
          goto LABEL_11;
      }
      else
      {
        v15 = v21 + v21;
        v16 = v15;
        v17 = vcvtpd_s64_f64(v19 * v16);
        if (a3)
          *a3 = var0 + (int)(2 * vcvtpd_s64_f64(v20 * v16));
        var1 += (int)(2 * v17);
        if (a4)
          goto LABEL_11;
      }
    }
  }
  return v11 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  __int128 v16;
  _OWORD v18[3];
  unsigned __int8 v19;
  unsigned __int8 v20;
  unsigned __int8 v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26[3];

  v9 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (v9)
  {
    v10 = (void *)v9;
    if (objc_msgSend(a4, "imageType") == 3)
    {
      -[PAESharedDefaultBase getScaleForImage:](self, "getScaleForImage:", a4);
      v12 = v26[1];
      v11 = v26[2];
      v26[0] = 0.0;
      objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", v26, 1, a5->var0.var1);
      if (v26[0] == 0.0)
      {
        if (a4)
          objc_msgSend(a4, "heliumRef", v26[0]);
        else
          v25 = 0.0;
        objc_msgSend(a3, "setHeliumRef:", &v25);
        if (v25 != 0.0)
          (*(void (**)(double))(**(_QWORD **)&v25 + 24))(COERCE_DOUBLE(*(_QWORD *)&v25));
        LOBYTE(v9) = 1;
      }
      else
      {
        if (v12 <= v11)
          v13 = v11;
        else
          v13 = v12;
        v25 = 0.0;
        objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v25, 4, a5->var0.var1, v26[0]);
        v25 = v12 / v13 * (v25 * 0.01);
        v24 = 0.0;
        objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v24, 5, a5->var0.var1);
        v24 = v11 / v13 * (v24 * 0.01);
        v23 = 0.0;
        objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v23, 2, a5->var0.var1);
        v22 = 0.0;
        objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v22, 3, a5->var0.var1);
        v21 = 0;
        objc_msgSend(v10, "getBoolValue:fromParm:atFxTime:", &v21, 7, a5->var0.var1);
        v20 = 0;
        objc_msgSend(v10, "getBoolValue:fromParm:atFxTime:", &v20, 6, a5->var0.var1);
        v19 = 0;
        objc_msgSend(v10, "getBoolValue:fromParm:atFxTime:", &v19, 8, a5->var0.var1);
        v14 = v23;
        v23 = fabs((v23 + -50.0) * 4.0);
        if (v14 >= 50.0)
        {
          v15 = 0;
        }
        else
        {
          v22 = 100.0 - v22;
          v15 = 1;
        }
        v16 = *(_OWORD *)&a5->var2;
        v18[0] = *(_OWORD *)&a5->var0.var0;
        v18[1] = v16;
        v18[2] = *(_OWORD *)&a5->var4;
        LOBYTE(v9) = -[PAEBloom bloomHeliumRender:withInput:withRadius:withBrightness:withThreshold:doDarkBloom:withXScale:withYScale:withDoCrop:withDoClip:is360:withInfo:](self, "bloomHeliumRender:withInput:withRadius:withBrightness:withThreshold:doDarkBloom:withXScale:withYScale:withDoCrop:withDoClip:is360:withInfo:", a3, a4, v15, v20, v21, v19, v26[0], v18);
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

- (BOOL)bloomHeliumRender:(id)a3 withInput:(id)a4 withRadius:(double)a5 withBrightness:(double)a6 withThreshold:(double)a7 doDarkBloom:(BOOL)a8 withXScale:(double)a9 withYScale:(double)a10 withDoCrop:(BOOL)a11 withDoClip:(BOOL)a12 is360:(BOOL)a13 withInfo:(id *)a14
{
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v16;
  void *v25;
  _BOOL4 v26;
  float v27;
  float v28;
  float v29;
  HgcBloomThreshold *v30;
  HGNode *v31;
  unint64_t v32;
  unint64_t v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  HgcEchoScaleAndAdd *v40;
  float v41;
  __n128 v42;
  HGXForm *v43;
  HGXForm *v44;
  _BOOL4 v46;
  float64x2_t v47[2];
  float64x2_t v48;
  float64x2_t v49;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  float32x4_t v53;
  float64x2_t v54[8];
  uint64_t v55;

  v14 = a13;
  v15 = a12;
  v46 = a11;
  v16 = a8;
  v25 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v25)
  {
    v26 = objc_msgSend(v25, "versionAtCreation") == 0;
    if (a4)
    {
LABEL_3:
      objc_msgSend(a4, "heliumRef");
      goto LABEL_6;
    }
  }
  else
  {
    v26 = 1;
    if (a4)
      goto LABEL_3;
  }
  v55 = 0;
LABEL_6:
  v27 = a7 / 100.0;
  if (v16)
    v28 = -10.0;
  else
    v28 = 10.0;
  if (v16)
    v29 = -v27;
  else
    v29 = v27;
  v30 = (HgcBloomThreshold *)HGObject::operator new(0x1A0uLL);
  HgcBloomThreshold::HgcBloomThreshold(v30);
  (*(void (**)(HgcBloomThreshold *, _QWORD, uint64_t))(*(_QWORD *)v30 + 120))(v30, 0, v55);
  (*(void (**)(HgcBloomThreshold *, _QWORD, float, float, float, float))(*(_QWORD *)v30 + 96))(v30, 0, v29 * -10.0, v29 * -10.0, v29 * -10.0, v29 * -10.0);
  (*(void (**)(HgcBloomThreshold *, uint64_t, float, float, float, float))(*(_QWORD *)v30 + 96))(v30, 1, v28, v28, v28, v28);
  (*(void (**)(HgcBloomThreshold *, uint64_t, float, float, float, float))(*(_QWORD *)v30 + 96))(v30, 3, 0.0, 0.0, 0.0, 0.0);
  (*(void (**)(HgcBloomThreshold *, uint64_t, float, float, float, float))(*(_QWORD *)v30 + 96))(v30, 2, -3.4028e38, 3.4028e38, 0.0, 0.0);
  if (v14)
  {
    -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a3);
    -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a3);
    v31 = (HGNode *)HGObject::operator new(0x1C0uLL);
    HGNode::HGNode(v31);
    *(_QWORD *)v31 = off_1E64E3B98;
    *((_QWORD *)v31 + 51) = 0;
    *((_QWORD *)v31 + 52) = 0;
    *((_DWORD *)v31 + 106) = 0;
    *((_QWORD *)v31 + 54) = 0;
    *((_QWORD *)v31 + 55) = 0;
    HGNode::SetInput(v31, 0, (HGNode *)v30);
    v32 = objc_msgSend(a4, "width");
    v33 = objc_msgSend(a4, "height");
    v34 = a5 * 0.5;
    v35 = a9;
    v36 = a10;
    v53 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v47[0]), v47[1]);
    v52 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v48), v49);
    v51 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v54[0]), v54[1]);
    v50 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v54[2]), v54[3]);
    HEquirectGaussianBlur::init((uint64_t)v31, vcvtpd_s64_f64(fabs(v47[0].f64[0]) * (double)v32), vcvtpd_s64_f64(fabs(v48.f64[1]) * (double)v33), (float32x2_t *)&v53, (float32x2_t *)&v52, (float32x2_t *)&v51, (float32x2_t *)&v50, v34, v35, v36);
    (*(void (**)(HGNode *))(*(_QWORD *)v31 + 16))(v31);
    (*(void (**)(HGNode *))(*(_QWORD *)v31 + 24))(v31);
  }
  else
  {
    v31 = (HGNode *)HGObject::operator new(0x1B0uLL);
    HGaussianBlur::HGaussianBlur((HGaussianBlur *)v31);
    (*(void (**)(HGNode *, _QWORD, HgcBloomThreshold *))(*(_QWORD *)v31 + 120))(v31, 0, v30);
    v37 = a5 * 0.5;
    v38 = a9;
    v39 = a10;
    HGaussianBlur::init((HGaussianBlur *)v31, v37, v38, v39, 0, 0, 0);
    (*(void (**)(HGNode *))(*(_QWORD *)v31 + 16))(v31);
    (*(void (**)(HGNode *))(*(_QWORD *)v31 + 24))(v31);
  }
  if (v16)
    a6 = -a6;
  v40 = (HgcEchoScaleAndAdd *)HGObject::operator new(0x1A0uLL);
  HgcEchoScaleAndAdd::HgcEchoScaleAndAdd(v40);
  v41 = a6 / 50.0;
  *(_QWORD *)&v54[0].f64[0] = v40;
  (*(void (**)(HgcEchoScaleAndAdd *, _QWORD, float, float, float, float))(*(_QWORD *)v40 + 96))(v40, 0, v41, v41, v41, v41);
  v42.n128_u32[0] = 2139095039;
  if (v15)
    v42.n128_f32[0] = 1.0;
  (*(void (**)(HgcEchoScaleAndAdd *, uint64_t, __n128, float, float, float))(*(_QWORD *)v40 + 96))(v40, 1, v42, 0.0, 0.0, 0.0);
  (*(void (**)(HGNode *))(*(_QWORD *)v31 + 16))(v31);
  v43 = (HGXForm *)v31;
  if (v26)
  {
    v43 = (HGXForm *)v31;
    if (a14->var5)
    {
      HGTransform::HGTransform((HGTransform *)v47);
      HGTransform::Translate((HGTransform *)v47, 0.0, -2.25, 0.0);
      v44 = (HGXForm *)HGObject::operator new(0x210uLL);
      HGXForm::HGXForm(v44);
      (*(void (**)(HGXForm *, float64x2_t *))(*(_QWORD *)v44 + 576))(v44, v47);
      (*(void (**)(HGXForm *, _QWORD, uint64_t))(*(_QWORD *)v44 + 120))(v44, 0, v55);
      v43 = (HGXForm *)v31;
      if (v31 != (HGNode *)v44)
      {
        (*(void (**)(HGNode *))(*(_QWORD *)v31 + 24))(v31);
        v43 = v44;
        (*(void (**)(HGXForm *))(*(_QWORD *)v44 + 16))(v44);
      }
      (*(void (**)(HGXForm *))(*(_QWORD *)v44 + 24))(v44);
      HGTransform::~HGTransform((HGTransform *)v47);
    }
  }
  (*(void (**)(HgcEchoScaleAndAdd *, _QWORD, HGXForm *))(*(_QWORD *)v40 + 120))(v40, 0, v43);
  (*(void (**)(_QWORD, uint64_t, uint64_t))(**(_QWORD **)&v54[0].f64[0] + 120))(*(_QWORD *)&v54[0].f64[0], 1, v55);
  if (v46)
    -[PAESharedDefaultBase crop:fromImage:toImage:](self, "crop:fromImage:toImage:", v54, a4, a3);
  objc_msgSend(a3, "setHeliumRef:", v54);
  (*(void (**)(HGXForm *))(*(_QWORD *)v43 + 24))(v43);
  if (*(_QWORD *)&v54[0].f64[0])
    (*(void (**)(_QWORD))(**(_QWORD **)&v54[0].f64[0] + 24))(*(_QWORD *)&v54[0].f64[0]);
  (*(void (**)(HGNode *))(*(_QWORD *)v31 + 24))(v31);
  (*(void (**)(HgcBloomThreshold *))(*(_QWORD *)v30 + 24))(v30);
  if (v55)
    (*(void (**)(uint64_t))(*(_QWORD *)v55 + 24))(v55);
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
