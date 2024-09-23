@implementation PAEGloom

- (PAEGloom)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEGloom;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4
{
  *a3 = 1;
}

- (id)properties
{
  if (-[PAEGloom properties]::once != -1)
    dispatch_once(&-[PAEGloom properties]::once, &__block_literal_global_47);
  return (id)-[PAEGloom properties]::sPropertiesDict;
}

uint64_t __22__PAEGloom_properties__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  v1 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  result = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, CFSTR("PositionIndependent"), v2, CFSTR("MayRemapTime"), v3, CFSTR("SupportsHeliumRendering"), v4, CFSTR("InputSizeLimit"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1), CFSTR("AutoColorProcessingSupport"), 0);
  -[PAEGloom properties]::sPropertiesDict = result;
  return result;
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id result;
  objc_class *v13;
  id v14;
  unsigned __int8 v15;
  double v16;

  v7 = -[PAEFilterDefaultBase getParamAPIWithError:](self, "getParamAPIWithError:", a4);
  v16 = 0.0;
  v15 = 0;
  if ((objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v16, 1, a3.var1) & 1) != 0
    || (objc_msgSend(v7, "getBoolValue:fromParm:atFxTime:", &v15, 4, a3.var1) & 1) != 0)
  {
    if (v16 == 0.0)
      v8 = 6;
    else
      v8 = 3;
    v9 = (void *)MEMORY[0x1E0C99D80];
    v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8, v16);
    v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    return (id)objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, CFSTR("PixelTransformSupport"), v11, CFSTR("SupportsStableAnimation"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15), CFSTR("SupportsLargeRenderScale"), 0);
  }
  else if (a4)
  {
    v13 = (objc_class *)objc_opt_class();
    v14 = -[PAEFilterDefaultBase getParamErrorFor:](self, "getParamErrorFor:", NSStringFromClass(v13));
    result = 0;
    *a4 = v14;
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
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAEGloom;
  -[PAESharedDefaultBase addParameters](&v6, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A6DD0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Gloom::Radius"), 0, 0), 1, 0, 10.0, 0.0, 100.0, 0.0, 100.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Gloom::Amount"), 0, 0), 2, 0, 1.0, 0.0, 2.0, 0.0, 2.0, 0.1);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", CFSTR("Prescale Input"), 3, 0, 2);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Gloom::Equirect"), 0, 0), 4, 0, 1);
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  int v13;
  double v14;
  double v16;
  double v17;
  double v18;
  double v19;
  float64_t v20;
  double v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  unint64_t v26;
  double v27;
  unint64_t v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  HgcGloom *v35;
  float v36;
  char *v37;
  HGCrop *v38;
  uint64_t v39;
  unsigned int v40;
  unsigned int v41;
  uint64_t v42;
  int v43;
  int v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  _OWORD v48[9];
  float64x2_t v49[2];
  float64x2_t v50;
  float64x2_t v51;
  _DWORD v52[2];
  float64_t v53;
  float64_t v54;
  float64_t v55;
  double v56;
  double v57;
  char v58;
  char v59;
  double v60;
  double v61;

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
  v13 = objc_msgSend(v12, "versionAtCreation");
  v60 = 2.0;
  v61 = 10.0;
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v61, 1, a5->var0.var1);
  v14 = v61;
  if (v61 == 0.0)
  {
    if (a4)
      objc_msgSend(a4, "heliumRef", v61);
    else
      v49[0].f64[0] = 0.0;
    objc_msgSend(a3, "setHeliumRef:", v49);
    if (*(_QWORD *)&v49[0].f64[0])
      (*(void (**)(_QWORD))(**(_QWORD **)&v49[0].f64[0] + 24))(*(_QWORD *)&v49[0].f64[0]);
  }
  else
  {
    if (!v13)
    {
      v14 = pow(v61 / 100.0, 1.425) * 253.0;
      v61 = v14;
    }
    v59 = 0;
    objc_msgSend(v9, "getBoolValue:fromParm:atFxTime:", &v59, 3, a5->var0.var1, v14);
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v60, 2, a5->var0.var1);
    v58 = 0;
    objc_msgSend(v9, "getBoolValue:fromParm:atFxTime:", &v58, 4, a5->var0.var1);
    v59 &= v58 ^ 1;
    -[PAESharedDefaultBase getScaleForImage:](self, "getScaleForImage:", a4);
    v17 = v56;
    v16 = v57;
    if (a4)
    {
      objc_msgSend(a4, "heliumRef");
      v54 = v55;
      if (v55 != 0.0)
        (*(void (**)(float64_t))(**(_QWORD **)&v55 + 16))(COERCE_FLOAT64_T(*(_QWORD *)&v55));
    }
    else
    {
      v54 = 0.0;
      v55 = 0.0;
    }
    -[PAESharedDefaultBase smear:fromImage:toImage:](self, "smear:fromImage:toImage:", &v54, a4, a4);
    v20 = v49[0].f64[0];
    if (*(_QWORD *)&v55 == *(_QWORD *)&v49[0].f64[0])
    {
      if (v55 != 0.0)
        (*(void (**)(float64_t))(**(_QWORD **)&v55 + 24))(COERCE_FLOAT64_T(*(_QWORD *)&v55));
    }
    else
    {
      if (v55 != 0.0)
      {
        (*(void (**)(float64_t))(**(_QWORD **)&v55 + 24))(COERCE_FLOAT64_T(*(_QWORD *)&v55));
        v20 = v49[0].f64[0];
      }
      v55 = v20;
      v49[0].f64[0] = 0.0;
    }
    if (v54 != 0.0)
      (*(void (**)(float64_t))(**(_QWORD **)&v54 + 24))(COERCE_FLOAT64_T(*(_QWORD *)&v54));
    if (v59)
    {
      v53 = v55;
      if (v55 != 0.0)
        (*(void (**)(float64_t))(**(_QWORD **)&v55 + 16))(COERCE_FLOAT64_T(*(_QWORD *)&v55));
      HIDWORD(v21) = HIDWORD(v61);
      *(float *)&v21 = v61;
      *(float *)&v18 = v17;
      *(float *)&v19 = v16;
      v52[0] = LODWORD(v18);
      v52[1] = LODWORD(v19);
      LODWORD(v18) = 1.5;
      LODWORD(v19) = 3.0;
      -[PAEFilterDefaultBase makePrescaledBlurNode:radius:withScale:minInputScale:maxInputScale:](self, "makePrescaledBlurNode:radius:withScale:minInputScale:maxInputScale:", &v53, v52, v21, v18, v19);
      v22 = *(_QWORD *)&v49[0].f64[0];
      if (*(_QWORD *)&v49[0].f64[0])
        v49[0].f64[0] = 0.0;
      if (v53 != 0.0)
        (*(void (**)(float64_t))(**(_QWORD **)&v53 + 24))(COERCE_FLOAT64_T(*(_QWORD *)&v53));
    }
    else if (v58)
    {
      -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a3);
      -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a3);
      v22 = (uint64_t)HGObject::operator new(0x1C0uLL);
      HGNode::HGNode((HGNode *)v22);
      *(_QWORD *)v22 = off_1E64E3B98;
      *(_QWORD *)(v22 + 408) = 0;
      *(_QWORD *)(v22 + 416) = 0;
      *(_DWORD *)(v22 + 424) = 0;
      *(_QWORD *)(v22 + 432) = 0;
      *(_QWORD *)(v22 + 440) = 0;
      v23 = v61;
      v24 = v56;
      v25 = v57;
      v26 = objc_msgSend(a4, "width");
      v27 = v49[0].f64[0];
      v28 = objc_msgSend(a4, "height");
      v29 = v23;
      v30 = v24;
      v31 = v25;
      v48[0] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v49[0]), v49[1]);
      v47 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v50), v51);
      v46 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)((char *)&v48[1] + 8)), *(float64x2_t *)((char *)&v48[2] + 8));
      v45 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)((char *)&v48[3] + 8)), *(float64x2_t *)((char *)&v48[4] + 8));
      HEquirectGaussianBlur::init(v22, vcvtpd_s64_f64(fabs(v27) * (double)v26), vcvtpd_s64_f64(fabs(v50.f64[1]) * (double)v28), (float32x2_t *)v48, (float32x2_t *)&v47, (float32x2_t *)&v46, (float32x2_t *)&v45, v29, v30, v31);
      (*(void (**)(uint64_t, _QWORD, float64_t))(*(_QWORD *)v22 + 120))(v22, 0, COERCE_FLOAT64_T(*(_QWORD *)&v55));
      (*(void (**)(uint64_t))(*(_QWORD *)v22 + 16))(v22);
      (*(void (**)(uint64_t))(*(_QWORD *)v22 + 24))(v22);
    }
    else
    {
      v22 = (uint64_t)HGObject::operator new(0x1B0uLL);
      HGaussianBlur::HGaussianBlur((HGaussianBlur *)v22);
      v32 = v61;
      v33 = v17;
      v34 = v16;
      HGaussianBlur::init((HGaussianBlur *)v22, v32, v33, v34, v13 == 0, 0, 0);
      (*(void (**)(uint64_t, _QWORD, float64_t))(*(_QWORD *)v22 + 120))(v22, 0, COERCE_FLOAT64_T(*(_QWORD *)&v55));
      (*(void (**)(uint64_t))(*(_QWORD *)v22 + 16))(v22);
      (*(void (**)(uint64_t))(*(_QWORD *)v22 + 24))(v22);
    }
    v35 = (HgcGloom *)HGObject::operator new(0x1A0uLL);
    HgcGloom::HgcGloom(v35);
    *(_QWORD *)v35 = &unk_1E64E4800;
    v36 = v60;
    HgcGloom::SetParameter(v35, 0, v36, v36, v36, v36, v37);
    (*(void (**)(HgcGloom *, _QWORD, float64_t))(*(_QWORD *)v35 + 120))(v35, 0, COERCE_FLOAT64_T(*(_QWORD *)&v55));
    (*(void (**)(HgcGloom *, uint64_t, uint64_t))(*(_QWORD *)v35 + 120))(v35, 1, v22);
    v38 = (HGCrop *)HGObject::operator new(0x1A0uLL);
    HGCrop::HGCrop(v38);
    (*(void (**)(HGCrop *, _QWORD, HgcGloom *))(*(_QWORD *)v38 + 120))(v38, 0, v35);
    v39 = objc_msgSend(a4, "dod");
    v42 = HGRectMake4i(v39, HIDWORD(v39), v40, v41);
    (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v38 + 96))(v38, 0, (float)(int)v42, (float)SHIDWORD(v42), (float)v43, (float)v44);
    *(_QWORD *)&v49[0].f64[0] = v38;
    (*(void (**)(HGCrop *))(*(_QWORD *)v38 + 16))(v38);
    objc_msgSend(a3, "setHeliumRef:", v49);
    if (*(_QWORD *)&v49[0].f64[0])
      (*(void (**)(_QWORD))(**(_QWORD **)&v49[0].f64[0] + 24))(*(_QWORD *)&v49[0].f64[0]);
    (*(void (**)(HGCrop *))(*(_QWORD *)v38 + 24))(v38);
    (*(void (**)(HgcGloom *))(*(_QWORD *)v35 + 24))(v35);
    if (v22)
      (*(void (**)(uint64_t))(*(_QWORD *)v22 + 24))(v22);
    if (v55 != 0.0)
      (*(void (**)(float64_t))(**(_QWORD **)&v55 + 24))(COERCE_FLOAT64_T(*(_QWORD *)&v55));
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
