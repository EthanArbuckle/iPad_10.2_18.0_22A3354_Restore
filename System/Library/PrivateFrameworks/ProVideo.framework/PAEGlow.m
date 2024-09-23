@implementation PAEGlow

- (PAEGlow)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEGlow;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PAEGlow;
  -[PAESharedDefaultBase dealloc](&v2, sel_dealloc);
}

- (id)properties
{
  if (-[PAEGlow properties]::once != -1)
    dispatch_once(&-[PAEGlow properties]::once, &__block_literal_global_44);
  return (id)-[PAEGlow properties]::sPropertiesDict;
}

uint64_t __21__PAEGlow_properties__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  v1 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
  result = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, CFSTR("SupportsHeliumRendering"), v2, CFSTR("MayRemapTime"), v3, CFSTR("PixelTransformSupport"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1), CFSTR("AutoColorProcessingSupport"), 0);
  -[PAEGlow properties]::sPropertiesDict = result;
  return result;
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  void *v6;
  void *v7;
  id result;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  char v14;
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (!a4 || v6)
  {
    v14 = 0;
    objc_msgSend(v6, "getBoolValue:fromParm:atFxTime:", &v14, 6, a3.var1);
    if (v14)
    {
      v17[0] = CFSTR("PositionIndependent");
      v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
      v17[1] = CFSTR("SupportsLargeRenderScale");
      v18[0] = v9;
      v18[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = v18;
      v12 = v17;
    }
    else
    {
      v15[0] = CFSTR("PositionIndependent");
      v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v15[1] = CFSTR("SupportsLargeRenderScale");
      v16[0] = v13;
      v16[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = v16;
      v12 = v15;
    }
    return (id)objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 2);
  }
  else
  {
    v19 = *MEMORY[0x1E0CB2D68];
    v20[0] = CFSTR("Unable to retrieve parameter retrieval API (v5)");
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", FxPlugErrorDomain, 13, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1));
    result = 0;
    *a4 = v7;
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
  v10.super_class = (Class)PAEGlow;
  -[PAESharedDefaultBase addParameters](&v10, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A6DD0);
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
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Glow::Radius"), 0, 0), 1, 0, 10.0, 0.0, 100.0, 0.0, 100.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Glow::Opacity"), 0, 0), 2, 0, 1.5, 0.0, 3.0, 0.0, 3.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Glow::Threshold"), 0, 0), 3, 0, 0.75, 0.0, 1.0, 0.0, 1.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Glow::Softness"), 0, 0), 4, 0, 0.2, 0.0, 1.0, 0.0, 1.0, 0.1);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Glow::Clip"), 0, 0), 5, v7, 1);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Glow::Equirect"), 0, 0), 6, 0, 1);
  }
  return v6;
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  void *v10;
  BOOL v11;
  BOOL v12;
  char v13;
  void *v14;
  unint64_t var1;
  float v16;
  unsigned int v17;
  int v18;
  double v20;
  char v21;

  v10 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (a3)
    v11 = v10 == 0;
  else
    v11 = 1;
  v12 = v11 || a4 == 0;
  v13 = v12;
  if (!v12)
  {
    v14 = v10;
    v21 = 0;
    objc_msgSend(v10, "getBoolValue:fromParm:atFxTime:", &v21, 6, a6->var0.var1);
    if (v21)
    {
      *a3 = a5->var0;
      var1 = a5->var1;
    }
    else
    {
      v20 = 0.0;
      objc_msgSend(v14, "getFloatValue:fromParm:atFxTime:", &v20, 1, a6->var0.var1);
      v16 = v20 + v20;
      v17 = vcvtps_s32_f32(v16);
      v18 = a5->var1;
      *a3 = (int)(LODWORD(a5->var0) + 2 * v17);
      var1 = (int)(v18 + 2 * v17);
    }
    *a4 = var1;
  }
  return v13 ^ 1;
}

- (HGRef<HGNode>)get360BlurNode:(HGRef<HGNode>)a3 withInputImage:(id)a4 outputImage:(id)a5 blurRadius:(double)a6 blurScale:(PCVector2<double>)a7
{
  double *v7;
  HGNode **v8;
  double *v9;
  HGNode **v13;
  HGNode *v16;
  double v17;
  double v18;
  unint64_t v19;
  double v20;
  unint64_t v21;
  float v22;
  float v23;
  float v24;
  HGNode *v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float64x2_t v30;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  float64x2_t v38;
  float64x2_t v39;
  float64x2_t v40;
  float64x2_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;

  v9 = v7;
  v13 = v8;
  if (self)
  {
    -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a5, a6, a7.var0, a7.var1);
    -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a5);
  }
  else
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
  }
  v16 = (HGNode *)HGObject::operator new(0x1C0uLL);
  HGNode::HGNode(v16);
  *(_QWORD *)v16 = off_1E64E3B98;
  *((_QWORD *)v16 + 51) = 0;
  *((_QWORD *)v16 + 52) = 0;
  *((_DWORD *)v16 + 106) = 0;
  *((_QWORD *)v16 + 54) = 0;
  *((_QWORD *)v16 + 55) = 0;
  HGNode::SetInput(v16, 0, *(HGNode **)a3.var0);
  v17 = *v9;
  v18 = v9[1];
  v19 = objc_msgSend(a4, "width");
  v20 = v38.f64[0];
  v21 = objc_msgSend(a4, "height");
  v22 = a6;
  v23 = v17;
  v24 = v18;
  v29 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v38), v39);
  v28 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v40), v41);
  v27 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v30), v31);
  v26 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v32), v33);
  v25 = HEquirectGaussianBlur::init((uint64_t)v16, vcvtpd_s64_f64(fabs(v20) * (double)v19), vcvtpd_s64_f64(fabs(v40.f64[1]) * (double)v21), (float32x2_t *)&v29, (float32x2_t *)&v28, (float32x2_t *)&v27, (float32x2_t *)&v26, v22, v23, v24);
  *v13 = v16;
  return (HGRef<HGNode>)v25;
}

- (HGRef<HGNode>)getPlanarBlurNode:(HGRef<HGNode>)a3 withInputImage:(id)a4 outputImage:(id)a5 blurRadius:(double)a6 blurScale:(PCVector2<double>)a7
{
  double *v7;
  _QWORD *v8;
  double v9;
  _QWORD *v12;
  double v13;
  double v14;
  int v15;
  double v16;
  HGXForm *v17;
  double v18;
  long double v19;
  int v20;
  HGaussianBlur *v21;
  float v22;
  float v23;
  float v24;
  HGXForm *v25;
  HGXForm *v26;
  HGRef<HGNode> v27;
  _BYTE v28[144];

  v9 = a6;
  v12 = v8;
  v14 = *v7;
  v13 = v7[1];
  v15 = objc_msgSend((id)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190, a4, a5, a6, a7.var0, a7.var1), "versionAtCreation");
  if (!v15)
  {
    v9 = pow(v9 / 100.0, 1.425) * 253.0;
    objc_msgSend(a4, "pixelAspect");
    v14 = v14 * (1.0 / v16);
  }
  v17 = (HGXForm *)HGObject::operator new(0x210uLL);
  HGXForm::HGXForm(v17);
  v18 = 4.0;
  if (v9 <= 10.0 && (v18 = 2.0, v9 <= 5.0))
  {
    v20 = 0;
    v18 = 1.0;
  }
  else
  {
    HGTransform::HGTransform((HGTransform *)v28);
    HGTransform::Scale((HGTransform *)v28, 1.0 / v18, 1.0 / v18, 1.0);
    (*(void (**)(HGXForm *, _QWORD, _QWORD))(*(_QWORD *)v17 + 120))(v17, 0, *(_QWORD *)a3.var0);
    (*(void (**)(HGXForm *, _BYTE *))(*(_QWORD *)v17 + 576))(v17, v28);
    v19 = pow(v9 / 600.0, 0.65);
    v9 = pow(v19 * 575.0 / v18 / 575.0, 1.53846154) * 600.0;
    HGTransform::~HGTransform((HGTransform *)v28);
    v20 = 1;
  }
  v21 = (HGaussianBlur *)HGObject::operator new(0x1B0uLL);
  HGaussianBlur::HGaussianBlur(v21);
  v22 = v9;
  v23 = v14;
  v24 = v13;
  HGaussianBlur::init(v21, v22, v23, v24, v15 == 0, 0, 0);
  v25 = v17;
  if (!v20)
    v25 = *(HGXForm **)a3.var0;
  (*(void (**)(HGaussianBlur *, _QWORD, HGXForm *))(*(_QWORD *)v21 + 120))(v21, 0, v25);
  *v12 = v21;
  (*(void (**)(HGaussianBlur *))(*(_QWORD *)v21 + 16))(v21);
  v26 = (HGXForm *)HGObject::operator new(0x210uLL);
  HGXForm::HGXForm(v26);
  if (v20)
  {
    HGTransform::HGTransform((HGTransform *)v28);
    HGTransform::Scale((HGTransform *)v28, v18, v18, 1.0);
    (*(void (**)(HGXForm *, _QWORD, HGaussianBlur *))(*(_QWORD *)v26 + 120))(v26, 0, v21);
    (*(void (**)(HGXForm *, _BYTE *))(*(_QWORD *)v26 + 576))(v26, v28);
    if (v21 != (HGaussianBlur *)v26)
    {
      (*(void (**)(HGaussianBlur *))(*(_QWORD *)v21 + 24))(v21);
      *v12 = v26;
      (*(void (**)(HGXForm *))(*(_QWORD *)v26 + 16))(v26);
    }
    HGTransform::~HGTransform((HGTransform *)v28);
  }
  else if (!v26)
  {
    goto LABEL_15;
  }
  (*(void (**)(HGXForm *))(*(_QWORD *)v26 + 24))(v26);
LABEL_15:
  v27.var0 = (HGNode *)(*(uint64_t (**)(HGaussianBlur *))(*(_QWORD *)v21 + 24))(v21);
  if (v17)
    return (HGRef<HGNode>)(*(uint64_t (**)(HGXForm *))(*(_QWORD *)v17 + 24))(v17);
  return v27;
}

- (HGRef<HGNode>)getBlurNode:(HGRef<HGNode>)a3 withInputImage:(id)a4 outputImage:(id)a5 blurRadius:(double)a6 blurScale:(PCVector2<double>)a7 is360:(BOOL)a8
{
  int v8;
  _QWORD *v9;
  __int128 *v10;
  PAEGlow *v14;
  _QWORD *v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;

  v10 = (__int128 *)a8;
  v14 = self;
  v15 = v9;
  v16 = *(_QWORD *)a3.var0;
  if (!v8)
  {
    v18 = *(_QWORD *)a3.var0;
    if (v16)
      self = (PAEGlow *)(*(uint64_t (**)(uint64_t, SEL, double, PCVector2<double>, __n128))(*(_QWORD *)v16 + 16))(v16, a2, a6, a7, *(__n128 *)&a7.var1);
    v17 = *v10;
    if (v14)
    {
      self = -[PAEGlow getPlanarBlurNode:withInputImage:outputImage:blurRadius:blurScale:](v14, "getPlanarBlurNode:withInputImage:outputImage:blurRadius:blurScale:", &v18, a4, a5, &v17, a6, a7.var0, a7.var1);
      v16 = v18;
      if (!v18)
        return (HGRef<HGNode>)self;
    }
    else
    {
      *v15 = 0;
      if (!v16)
        return (HGRef<HGNode>)self;
    }
    return (HGRef<HGNode>)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v16 + 24))(v16);
  }
  v20 = *(_QWORD *)a3.var0;
  if (v16)
    self = (PAEGlow *)(*(uint64_t (**)(uint64_t, SEL, double, PCVector2<double>, __n128))(*(_QWORD *)v16 + 16))(v16, a2, a6, a7, *(__n128 *)&a7.var1);
  v19 = *v10;
  if (v14)
  {
    self = -[PAEGlow get360BlurNode:withInputImage:outputImage:blurRadius:blurScale:](v14, "get360BlurNode:withInputImage:outputImage:blurRadius:blurScale:", &v20, a4, a5, &v19, a6, a7.var0, a7.var1);
    v16 = v20;
    if (!v20)
      return (HGRef<HGNode>)self;
    return (HGRef<HGNode>)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v16 + 24))(v16);
  }
  *v15 = 0;
  if (v16)
    return (HGRef<HGNode>)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v16 + 24))(v16);
  return (HGRef<HGNode>)self;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  uint64_t v10;
  BOOL v11;
  BOOL v12;
  void *v13;
  double v14;
  double v15;
  double *v16;
  HgcGlow *v17;
  float v18;
  float v19;
  float v20;
  float v21;
  HgcGlowCombineFx *v22;
  __n128 v23;
  char *v24;
  __n128 v25;
  HgcGlowCombineFx *v27;
  __int128 v28;
  HgcGlow *v29;
  uint64_t v30;
  HGNode *v31;
  __int128 v32;
  __int16 v33;
  double v34;
  double v35;
  double v36;
  double v37;

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v10 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A2958);
  if (v9)
    v11 = v10 == 0;
  else
    v11 = 1;
  v12 = !v11;
  if (!v11)
  {
    v13 = (void *)v10;
    v36 = 0.75;
    v37 = 10.0;
    v35 = 0.2;
    v34 = 1.5;
    v33 = 0;
    -[PAESharedDefaultBase getScaleForImage:](self, "getScaleForImage:", a4);
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v37, 1, a5->var0.var1);
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v36, 3, a5->var0.var1);
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v35, 4, a5->var0.var1);
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v34, 2, a5->var0.var1);
    objc_msgSend(v9, "getBoolValue:fromParm:atFxTime:", (char *)&v33 + 1, 5, a5->var0.var1);
    objc_msgSend(v9, "getBoolValue:fromParm:atFxTime:", &v33, 6, a5->var0.var1);
    if (v35 == 0.0)
      v14 = -3.40282347e38;
    else
      v14 = -((v36 + v35 * -0.5) * (1.0 / v35));
    if (v35 == 0.0)
      v15 = 3.40282347e38;
    else
      v15 = 1.0 / v35;
    if (a4)
      objc_msgSend(a4, "heliumRef");
    else
      v31 = 0;
    v16 = (double *)objc_msgSend((id)objc_msgSend(v13, "colorMatrixFromDesiredRGBToYCbCrAtTime:", a5->var0.var1), "matrix");
    v17 = (HgcGlow *)HGObject::operator new(0x1A0uLL);
    HgcGlow::HgcGlow(v17);
    *(_QWORD *)v17 = &unk_1E64E4088;
    HGNode::SetInput((HGNode *)v17, 0, v31);
    v18 = v15 * *v16;
    v19 = v15 * v16[1];
    v20 = v15 * v16[2];
    v21 = v14;
    (*(void (**)(HgcGlow *, _QWORD, float, float, float, float))(*(_QWORD *)v17 + 96))(v17, 0, v18, v19, v20, v21);
    v29 = v17;
    (*(void (**)(HgcGlow *))(*(_QWORD *)v17 + 16))(v17);
    v28 = v32;
    -[PAEGlow getBlurNode:withInputImage:outputImage:blurRadius:blurScale:is360:](self, "getBlurNode:withInputImage:outputImage:blurRadius:blurScale:is360:", &v29, a4, a3, &v28, v33, v37);
    if (v29)
      (*(void (**)(HgcGlow *))(*(_QWORD *)v29 + 24))(v29);
    v22 = (HgcGlowCombineFx *)HGObject::operator new(0x1A0uLL);
    HgcGlowCombineFx::HgcGlowCombineFx(v22);
    *(_QWORD *)v22 = &unk_1E64E42F0;
    v27 = v22;
    v23.n128_u32[1] = HIDWORD(v34);
    v23.n128_f32[0] = v34;
    HgcGlowCombineFx::SetParameter(v22, 0, v23, 0.0, 0.0, 0.0, v24);
    (*(void (**)(HgcGlowCombineFx *, _QWORD, HGNode *))(*(_QWORD *)v22 + 120))(v22, 0, v31);
    (*(void (**)(HgcGlowCombineFx *, uint64_t, uint64_t))(*(_QWORD *)v22 + 120))(v22, 1, v30);
    v25.n128_u32[0] = 2139095039;
    if (HIBYTE(v33))
      v25.n128_f32[0] = 1.0;
    (*(void (**)(HgcGlowCombineFx *, uint64_t, __n128, float, float, float))(*(_QWORD *)v22 + 96))(v22, 1, v25, 0.0, 0.0, 0.0);
    objc_msgSend(a3, "setHeliumRef:", &v27);
    if (v27)
      (*(void (**)(HgcGlowCombineFx *))(*(_QWORD *)v27 + 24))(v27);
    if (v30)
      (*(void (**)(uint64_t))(*(_QWORD *)v30 + 24))(v30);
    (*(void (**)(HgcGlow *))(*(_QWORD *)v17 + 24))(v17);
    if (v31)
      (*(void (**)(HGNode *))(*(_QWORD *)v31 + 24))(v31);
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

@end
