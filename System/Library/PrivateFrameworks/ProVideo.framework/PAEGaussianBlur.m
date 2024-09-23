@implementation PAEGaussianBlur

- (PAEGaussianBlur)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEGaussianBlur;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (id)properties
{
  if (-[PAEGaussianBlur properties]::once != -1)
    dispatch_once(&-[PAEGaussianBlur properties]::once, &__block_literal_global_24);
  return (id)-[PAEGaussianBlur properties]::sProps;
}

uint64_t __29__PAEGaussianBlur_properties__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  v1 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  result = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, CFSTR("MayRemapTime"), v2, CFSTR("SupportsHeliumRendering"), v3, CFSTR("InputSizeLimit"), v4, CFSTR("UsesRationalTime"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
  -[PAEGaussianBlur properties]::sProps = result;
  return result;
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  void *v6;
  void *v7;
  int v8;
  BOOL v9;
  char v10;
  uint64_t v11;
  _BOOL8 v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id result;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  double v26;
  unsigned __int8 v27;
  unsigned __int8 v28;

  v6 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (!v6)
  {
    v19 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Unable to retrieve FxParameterRetrievalAPI object"), *MEMORY[0x1E0CB2D50], 0);
    if (a4)
    {
      v20 = v19;
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v22 = FxPlugErrorDomain;
      v23 = 100001;
LABEL_24:
      v25 = (void *)objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, v23, v20);
      result = 0;
      *a4 = v25;
      return result;
    }
    return 0;
  }
  v7 = v6;
  v28 = 0;
  v27 = 0;
  if (!objc_msgSend(v6, "getBoolValue:fromParm:atFxTime:", &v28, 4, a3.var1))
  {
    v26 = 0.0;
    goto LABEL_22;
  }
  v8 = objc_msgSend(v7, "getBoolValue:fromParm:atFxTime:", &v27, 6, a3.var1);
  if (v28)
    v9 = v27 == 0;
  else
    v9 = 0;
  v10 = v9;
  v28 = v10;
  v26 = 0.0;
  if (!v8 || (objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v26, 1, a3.var1) & 1) == 0)
  {
LABEL_22:
    v24 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Unable to retrieve a parameter in [-PAEGaussianBlur dynamicPropertiesAtTime:withError:]"), *MEMORY[0x1E0CB2D50], 0);
    if (a4)
    {
      v20 = v24;
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v22 = FxPlugErrorDomain;
      v23 = 100002;
      goto LABEL_24;
    }
    return 0;
  }
  v11 = 3;
  if (!v28)
  {
    if (v26 == 0.0 && v27 == 0)
      v11 = 6;
    else
      v11 = 3;
  }
  v13 = v28 == 0;
  v14 = (void *)MEMORY[0x1E0C99D80];
  v15 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (v28 | v27) == 0);
  v16 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
  v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v27 == 0);
  return (id)objc_msgSend(v14, "dictionaryWithObjectsAndKeys:", v15, CFSTR("PositionIndependent"), v16, CFSTR("PixelTransformSupport"), v17, CFSTR("SupportsLargeRenderScale"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13), CFSTR("SupportsStableAnimation"), 0);
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  BOOL v5;
  BOOL v6;
  _BOOL4 v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PAEGaussianBlur;
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
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("GaussianBlur::Amount"), 0, 0), 1, 0, 4.0, 0.0, dbl_1B3050050[v7], 0.0, 64.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("GaussianBlur::Horizontal"), 0, 0), 2, 0, 100.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("GaussianBlur::Vertical"), 0, 0), 3, 0, 100.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("GaussianBlur::Crop"), 0, 0), 4, 0, 33);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", CFSTR("Prescale Input"), 5, 0, 2);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("GaussianBlur::360 Blur"), 0, 0), 6, 0, 1);
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
    objc_msgSend(v10, "getBoolValue:fromParm:atFxTime:", &v22, 6, a6->var0.var1);
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
      v21 = v21 * 0.5;
      v20 = 0.0;
      objc_msgSend(v11, "getFloatValue:fromParm:atFxTime:", &v20, 2, a6->var0.var1);
      v20 = v20 * 0.01;
      v19 = 0.0;
      objc_msgSend(v11, "getFloatValue:fromParm:atFxTime:", &v19, 3, a6->var0.var1);
      v19 = v19 * 0.01;
      v18 = 0;
      objc_msgSend(v11, "getBoolValue:fromParm:atFxTime:", &v18, 4, a6->var0.var1);
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
  void *v9;
  void *v10;
  BOOL v11;
  BOOL v12;
  int v13;
  int v14;
  int v15;
  double v16;
  double v17;
  BOOL v18;
  HGaussianBlur *v19;
  double v20;
  double v21;
  double v22;
  float v23;
  float v24;
  HGaussianBlur *v25;
  float v26;
  float v27;
  float v28;
  void (*v29)(HGaussianBlur *);
  _DWORD v31[2];
  HGaussianBlur *v32;
  HGaussianBlur *v33;
  HGaussianBlur *v34;
  HGaussianBlur *v35;
  char v36;
  HGaussianBlur *v37;
  double v38;
  double v39;
  char v40;
  double v41[3];

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v10 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v9)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (v11)
    return 0;
  v13 = objc_msgSend(v10, "versionAtCreation");
  v14 = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
  v15 = objc_msgSend(a4, "imageType");
  -[PAESharedDefaultBase getScaleForImage:](self, "getScaleForImage:", a4);
  v17 = v41[1];
  v16 = v41[2];
  v41[0] = 0.0;
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", v41, 1, a5->var0.var1);
  v40 = 0;
  objc_msgSend(v9, "getBoolValue:fromParm:atFxTime:", &v40, 5, a5->var0.var1);
  if (v41[0] <= 0.0)
  {
    if (a4)
      objc_msgSend(a4, "heliumRef", v41[0]);
    else
      v39 = 0.0;
    objc_msgSend(a3, "setHeliumRef:", &v39);
    if (v39 != 0.0)
      (*(void (**)(_QWORD))(**(_QWORD **)&v39 + 24))(*(_QWORD *)&v39);
    return 1;
  }
  else
  {
    v41[0] = v41[0] * 0.5;
    v39 = 0.0;
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v39, 2, a5->var0.var1);
    v39 = v17 * (v39 * 0.01);
    v38 = 0.0;
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v38, 3, a5->var0.var1);
    v38 = v16 * (v38 * 0.01);
    if (v14)
      v18 = v15 == 3;
    else
      v18 = 0;
    v12 = v18;
    if (v18)
    {
      if (a4)
        objc_msgSend(a4, "heliumRef");
      else
        v37 = 0;
      v36 = 0;
      objc_msgSend(v9, "getBoolValue:fromParm:atFxTime:", &v36, 4, a5->var0.var1);
      if (v36)
      {
        v34 = v37;
        if (v37)
          (*(void (**)(HGaussianBlur *))(*(_QWORD *)v37 + 16))(v37);
        -[PAESharedDefaultBase smear:fromImage:toImage:](self, "smear:fromImage:toImage:", &v34, a4, a4);
        v19 = v35;
        if (v37 == v35)
        {
          if (v37)
            (*(void (**)(void))(*(_QWORD *)v37 + 24))();
        }
        else
        {
          if (v37)
          {
            (*(void (**)(void))(*(_QWORD *)v37 + 24))();
            v19 = v35;
          }
          v37 = v19;
          v35 = 0;
        }
        if (v34)
          (*(void (**)(HGaussianBlur *))(*(_QWORD *)v34 + 24))(v34);
      }
      v35 = 0;
      if (v40)
      {
        v32 = v37;
        if (v37)
          (*(void (**)(HGaussianBlur *))(*(_QWORD *)v37 + 16))(v37);
        HIDWORD(v20) = HIDWORD(v41[0]);
        *(float *)&v20 = v41[0];
        HIDWORD(v22) = HIDWORD(v38);
        HIDWORD(v21) = HIDWORD(v39);
        v23 = v39;
        v24 = v38;
        *(float *)v31 = v23;
        *(float *)&v31[1] = v24;
        LODWORD(v22) = 2139095039;
        LODWORD(v21) = 1.5;
        -[PAEFilterDefaultBase makePrescaledBlurNode:radius:withScale:minInputScale:maxInputScale:](self, "makePrescaledBlurNode:radius:withScale:minInputScale:maxInputScale:", &v32, v31, v20, v21, v22);
        if (v33)
        {
          v35 = v33;
          v33 = 0;
        }
        if (v32)
          (*(void (**)(HGaussianBlur *))(*(_QWORD *)v32 + 24))(v32);
      }
      else
      {
        v25 = (HGaussianBlur *)HGObject::operator new(0x1B0uLL);
        HGaussianBlur::HGaussianBlur(v25);
        v26 = v41[0];
        v27 = v39;
        v28 = v38;
        HGaussianBlur::init(v25, v26, v27, v28, v13 == 0, a5->var1 == 2, 0);
        (*(void (**)(HGaussianBlur *, _QWORD, HGaussianBlur *))(*(_QWORD *)v25 + 120))(v25, 0, v37);
        v29 = *(void (**)(HGaussianBlur *))(*(_QWORD *)v25 + 16);
        v35 = v25;
        v29(v25);
        (*(void (**)(HGaussianBlur *))(*(_QWORD *)v25 + 24))(v25);
      }
      if (v36)
        -[PAESharedDefaultBase crop:fromImage:toImage:](self, "crop:fromImage:toImage:", &v35, a4, a3);
      objc_msgSend(a3, "setHeliumRef:", &v35);
      if (v35)
        (*(void (**)(HGaussianBlur *))(*(_QWORD *)v35 + 24))(v35);
      if (v37)
        (*(void (**)(HGaussianBlur *))(*(_QWORD *)v37 + 24))(v37);
    }
  }
  return v12;
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

- (void)filteredEdges:(BOOL *)a3 withInfo:(id *)a4
{
  void *v5;
  __int128 v6;
  uint64_t v7;
  char v8;

  v5 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8, a4);
  v8 = 0;
  v6 = *MEMORY[0x1E0CA2E68];
  v7 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  objc_msgSend(v5, "getBoolValue:fromParm:atFxTime:", &v8, 6, &v6);
  *a3 = v8 ^ 1;
}

@end
