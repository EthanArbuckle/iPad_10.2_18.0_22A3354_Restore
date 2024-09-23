@implementation PAENeon

- (PAENeon)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAENeon;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (id)properties
{
  if (-[PAENeon properties]::once != -1)
    dispatch_once(&-[PAENeon properties]::once, &__block_literal_global_31);
  return (id)-[PAENeon properties]::sPropertiesDict;
}

uint64_t __21__PAENeon_properties__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  v1 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 67584);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 591872);
  result = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, CFSTR("PixelIndependent"), v2, CFSTR("MayRemapTime"), v3, CFSTR("SupportsHeliumRendering"), v4, CFSTR("SDRWorkingSpace"), v5, CFSTR("HDRWorkingSpace"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1), CFSTR("AutoColorProcessingSupport"), 0);
  -[PAENeon properties]::sPropertiesDict = result;
  return result;
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  void *v6;
  void *v7;
  double v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id result;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  double v25;
  uint64_t v26;

  v6 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (!v6)
  {
    v15 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Unable to retrieve FxParameterRetrievalAPI object"), *MEMORY[0x1E0CB2D50], 0);
    if (a4)
    {
      v16 = v15;
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = FxPlugErrorDomain;
      v19 = 100001;
LABEL_20:
      v21 = (void *)objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, v19, v16);
      result = 0;
      *a4 = v21;
      return result;
    }
    return 0;
  }
  v7 = v6;
  v26 = 0x3FF0000000000000;
  v25 = 0.0;
  if (!objc_msgSend(v6, "getFloatValue:fromParm:atFxTime:", &v26, 1, a3.var1))
  {
    v24 = 0x3FF0000000000000;
    goto LABEL_16;
  }
  v24 = 0x3FF0000000000000;
  if (!objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v25, 3, a3.var1))
  {
LABEL_16:
    v23 = 0.0;
    goto LABEL_17;
  }
  v23 = 0.0;
  if ((objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v24, 2, a3.var1) & 1) == 0)
  {
LABEL_17:
    v22 = 0x3FF0000000000000;
    goto LABEL_18;
  }
  v22 = 0x3FF0000000000000;
  if ((objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v23, 5, a3.var1) & 1) == 0
    || (objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v22, 4, a3.var1) & 1) == 0)
  {
LABEL_18:
    v20 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Unable to retrieve a parameter in [-PAEGaussianBlur dynamicPropertiesAtTime:withError:]"), *MEMORY[0x1E0CB2D50], 0);
    if (a4)
    {
      v16 = v20;
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = FxPlugErrorDomain;
      v19 = 100002;
      goto LABEL_20;
    }
    return 0;
  }
  v8 = v25;
  if (v25 < v23)
    v8 = v23;
  if (v8 == 0.0)
    v9 = 6;
  else
    v9 = 3;
  v10 = (void *)MEMORY[0x1E0C99D80];
  v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
  v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  return (id)objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, CFSTR("PositionIndependent"), v12, CFSTR("PixelTransformSupport"), v13, CFSTR("SupportsLargeRenderScale"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0), CFSTR("SupportsStableAnimation"), 0);
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAENeon;
  -[PAESharedDefaultBase addParameters](&v6, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Neon::Outer Brightness"), 0, 0), 4, 0, 2.0, 0.0, 1000.0, 0.0, 20.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Neon::Outer Glow"), 0, 0), 5, 0, 45.0, 0.0, 1000.0, 0.0, 200.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Neon::Inner Brightness"), 0, 0), 2, 0, 2.0, 0.0, 1000.0, 0.0, 15.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Neon::Inner Glow"), 0, 0), 3, 0, 50.0, 0.0, 1000.0, 0.0, 100.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Neon::Edge Intensity"), 0, 0), 1, 0, 10.0, 0.0, 1000.0, 0.0, 15.0, 0.1);
  }
  return v3 != 0;
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  return 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  unsigned int v12;
  int v13;
  uint64_t v14;
  BOOL v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  HGHWMultiBlend *v25;
  void (*v26)(HGHWMultiBlend *, uint64_t, uint64_t);
  uint64_t *v27;
  HGHWMultiBlend *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  uint64_t v45;
  double v46;
  uint64_t v47;

  v9 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v10 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (!(v9 | v10))
    return 0;
  v12 = objc_msgSend((id)v10, "versionAtCreation");
  *(double *)&v47 = 1.0;
  objc_msgSend((id)v9, "getFloatValue:fromParm:atFxTime:", &v47, 1, a5->var0.var1);
  v46 = 0.0;
  objc_msgSend((id)v9, "getFloatValue:fromParm:atFxTime:", &v46, 3, a5->var0.var1);
  *(double *)&v45 = 1.0;
  objc_msgSend((id)v9, "getFloatValue:fromParm:atFxTime:", &v45, 2, a5->var0.var1);
  v44 = 0.0;
  objc_msgSend((id)v9, "getFloatValue:fromParm:atFxTime:", &v44, 5, a5->var0.var1);
  *(double *)&v43 = 1.0;
  objc_msgSend((id)v9, "getFloatValue:fromParm:atFxTime:", &v43, 4, a5->var0.var1);
  v13 = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
  v14 = objc_msgSend(a4, "imageType");
  if (v13)
    v15 = v14 == 3;
  else
    v15 = 0;
  v11 = v15;
  if (v15)
  {
    if (a4)
      objc_msgSend(a4, "heliumRef");
    else
      v42 = 0;
    -[PAESharedDefaultBase getScaleForImage:](self, "getScaleForImage:", a4);
    v16 = *(double *)&v47;
    v38 = v42;
    if (v42)
      (*(void (**)(uint64_t))(*(_QWORD *)v42 + 16))(v42);
    -[PAENeon brightnessNodeWithValue:inputNode:](self, "brightnessNodeWithValue:inputNode:", &v38, v16);
    if (v38)
      (*(void (**)(uint64_t))(*(_QWORD *)v38 + 24))(v38);
    v17 = v46;
    v18 = v40;
    v19 = v41;
    v36 = v42;
    if (v42)
      (*(void (**)(uint64_t))(*(_QWORD *)v42 + 16))(v42);
    -[PAENeon blurNodeWithRadius:xScale:yScale:inputNode:](self, "blurNodeWithRadius:xScale:yScale:inputNode:", &v36, v17, v18, v19);
    if (v36)
      (*(void (**)(uint64_t))(*(_QWORD *)v36 + 24))(v36);
    v20 = *(double *)&v45;
    v34 = v37;
    if (v37)
      (*(void (**)(uint64_t))(*(_QWORD *)v37 + 16))(v37);
    -[PAENeon brightnessNodeWithValue:inputNode:](self, "brightnessNodeWithValue:inputNode:", &v34, v20);
    if (v34)
      (*(void (**)(uint64_t))(*(_QWORD *)v34 + 24))(v34);
    v21 = v44;
    v22 = v40;
    v23 = v41;
    v32 = v42;
    if (v42)
      (*(void (**)(uint64_t))(*(_QWORD *)v42 + 16))(v42);
    -[PAENeon blurNodeWithRadius:xScale:yScale:inputNode:](self, "blurNodeWithRadius:xScale:yScale:inputNode:", &v32, v21, v22, v23);
    if (v32)
      (*(void (**)(uint64_t))(*(_QWORD *)v32 + 24))(v32);
    v24 = *(double *)&v43;
    v30 = v33;
    if (v33)
      (*(void (**)(uint64_t))(*(_QWORD *)v33 + 16))(v33);
    -[PAENeon brightnessNodeWithValue:inputNode:](self, "brightnessNodeWithValue:inputNode:", &v30, v24);
    if (v30)
      (*(void (**)(uint64_t))(*(_QWORD *)v30 + 24))(v30);
    v25 = (HGHWMultiBlend *)HGObject::operator new(0x280uLL);
    HGHWMultiBlend::HGHWMultiBlend(v25);
    (*(void (**)(HGHWMultiBlend *, _QWORD, uint64_t))(*(_QWORD *)v25 + 120))(v25, 0, v39);
    v26 = *(void (**)(HGHWMultiBlend *, uint64_t, uint64_t))(*(_QWORD *)v25 + 120);
    if (v12 < 4)
    {
      v26(v25, 1, v35);
      v27 = &v31;
    }
    else
    {
      v26(v25, 1, v31);
      v27 = &v35;
    }
    (*(void (**)(HGHWMultiBlend *, uint64_t, uint64_t))(*(_QWORD *)v25 + 120))(v25, 2, *v27);
    v29 = v25;
    (*(void (**)(HGHWMultiBlend *))(*(_QWORD *)v25 + 16))(v25);
    objc_msgSend(a3, "setHeliumRef:", &v29);
    if (v29)
      (*(void (**)(HGHWMultiBlend *))(*(_QWORD *)v29 + 24))(v29);
    (*(void (**)(HGHWMultiBlend *))(*(_QWORD *)v25 + 24))(v25);
    if (v31)
      (*(void (**)(uint64_t))(*(_QWORD *)v31 + 24))(v31);
    if (v33)
      (*(void (**)(uint64_t))(*(_QWORD *)v33 + 24))(v33);
    if (v35)
      (*(void (**)(uint64_t))(*(_QWORD *)v35 + 24))(v35);
    if (v37)
      (*(void (**)(uint64_t))(*(_QWORD *)v37 + 24))(v37);
    if (v39)
      (*(void (**)(uint64_t))(*(_QWORD *)v39 + 24))(v39);
    if (v42)
      (*(void (**)(uint64_t))(*(_QWORD *)v42 + 24))(v42);
  }
  return v11;
}

- (HGRef<HGNode>)brightnessNodeWithValue:(double)a3 inputNode:(HGRef<HGNode>)a4
{
  HGColorMatrix **v4;
  HGColorMatrix **v7;
  HGColorMatrix *v8;

  v7 = v4;
  v8 = (HGColorMatrix *)HGObject::operator new(0x1F0uLL);
  HGColorMatrix::HGColorMatrix(v8);
  *v7 = v8;
  *(float *)&a3 = a3;
  (*(void (**)(HGColorMatrix *, _QWORD, float, float, float, float))(*(_QWORD *)v8 + 96))(v8, 0, *(float *)&a3, 0.0, 0.0, 0.0);
  (*(void (**)(HGColorMatrix *, uint64_t, float, float, float, float))(*(_QWORD *)v8 + 96))(v8, 1, 0.0, *(float *)&a3, 0.0, 0.0);
  (*(void (**)(HGColorMatrix *, uint64_t, float, float, float, float))(*(_QWORD *)v8 + 96))(v8, 2, 0.0, 0.0, *(float *)&a3, 0.0);
  (*(void (**)(HGColorMatrix *, uint64_t, float, float, float, float))(*(_QWORD *)v8 + 96))(v8, 3, 0.0, 0.0, 0.0, 1.0);
  return (HGRef<HGNode>)(*(uint64_t (**)(HGColorMatrix *, _QWORD, _QWORD))(*(_QWORD *)v8 + 120))(v8, 0, *(_QWORD *)a4.var0);
}

- (HGRef<HGNode>)blurNodeWithRadius:(double)a3 xScale:(double)a4 yScale:(double)a5 inputNode:(HGRef<HGNode>)a6
{
  HGaussianBlur **v6;
  HGaussianBlur **v11;
  HGaussianBlur *v12;
  float v13;
  float v14;
  float v15;
  HGRef<HGNode> v16;

  v11 = v6;
  v12 = (HGaussianBlur *)HGObject::operator new(0x1B0uLL);
  HGaussianBlur::HGaussianBlur(v12);
  v13 = a3;
  v14 = a4;
  v15 = a5;
  HGaussianBlur::init(v12, v13, v14, v15, 0, 0, 0);
  v16.var0 = (HGNode *)(*(uint64_t (**)(HGaussianBlur *, _QWORD, _QWORD))(*(_QWORD *)v12 + 120))(v12, 0, *(_QWORD *)a6.var0);
  *v11 = v12;
  return v16;
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

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  void *v10;
  void *v11;
  double v12;
  unint64_t var1;
  float v14;
  uint64_t v15;
  double v17;
  double v18;

  v10 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v11 = v10;
  if (v10)
  {
    v18 = 0.0;
    objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v18, 3, a6->var0.var1);
    v17 = 0.0;
    objc_msgSend(v11, "getFloatValue:fromParm:atFxTime:", &v17, 5, a6->var0.var1);
    v12 = v18;
    if (v18 < v17)
      v12 = v17;
    var1 = a5->var1;
    v14 = v12;
    v15 = (int)(2 * vcvtps_s32_f32(v14));
    if (a3)
      *a3 = a5->var0 + v15;
    if (a4)
      *a4 = var1 + v15;
  }
  return v11 != 0;
}

@end
