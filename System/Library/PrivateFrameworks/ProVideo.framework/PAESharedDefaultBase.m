@implementation PAESharedDefaultBase

- (PAESharedDefaultBase)initWithAPIManager:(id)a3
{
  PAESharedDefaultBase *v4;
  FxHostCapabilities *v5;
  char v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PAESharedDefaultBase;
  v4 = -[PAESharedDefaultBase init](&v8, sel_init);
  v4->_apiManager = (PROAPIAccessing *)a3;
  v5 = -[FxHostCapabilities initWithAPIManager:]([FxHostCapabilities alloc], "initWithAPIManager:", v4->_apiManager);
  v4->_upscalesFields = -[FxHostCapabilities upscalesFields](v5, "upscalesFields");
  if (-[FxHostCapabilities hostIsFCP](v5, "hostIsFCP"))
    v6 = 1;
  else
    v6 = -[FxHostCapabilities hostIsFCE](v5, "hostIsFCE");
  v4->_hostIsFinalCutPro = v6;
  v4->_hostIsVertigo = objc_msgSend(-[FxHostCapabilities hostID](v5, "hostID"), "isEqualToString:", CFSTR("com.apple.FinalCut"));
  return v4;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PAESharedDefaultBase;
  -[PAESharedDefaultBase dealloc](&v2, sel_dealloc);
}

- (BOOL)variesOverTime
{
  return 0;
}

- (id)properties
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
}

- (BOOL)addParameters
{
  return 1;
}

- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6
{
  *a6 = 0;
  *a5 = 0;
  return 1;
}

- (BOOL)frameCleanup
{
  return 1;
}

- (int)getRenderMode:(id)a3
{
  return 1;
}

- (void)overrideFrameSetupForRenderMode:(id *)a3 hardware:(BOOL *)a4 software:(BOOL *)a5
{
  *a5 = 0;
  *a4 = 1;
}

- (HGRef<HGNode>)changeDOD:(HGRef<HGNode>)a3 withRect:(const void *)a4
{
  HGCrop **v4;
  HGCrop **v7;
  HGTextureWrap *v8;
  char *v9;
  HGCrop *v10;
  uint64_t v11;
  int v12;
  int v13;
  _QWORD v15[3];

  v7 = v4;
  v15[2] = *MEMORY[0x1E0C80C00];
  v8 = (HGTextureWrap *)HGObject::operator new(0x1D0uLL);
  HGTextureWrap::HGTextureWrap(v8);
  HGTextureWrap::SetTextureWrapMode((uint64_t)v8, 0, v9);
  v15[0] = 0;
  v15[1] = 0;
  HGTextureWrap::SetTextureBorderColor(v8, (float *)v15);
  (*(void (**)(HGTextureWrap *, _QWORD, _QWORD))(*(_QWORD *)v8 + 120))(v8, 0, *(_QWORD *)a3.var0);
  v10 = (HGCrop *)HGObject::operator new(0x1A0uLL);
  HGCrop::HGCrop(v10);
  v11 = HGRectMake4i((int)*(double *)a4, (int)*((double *)a4 + 1), (int)(*(double *)a4 + *((double *)a4 + 2)), (int)(*((double *)a4 + 1) + *((double *)a4 + 3)));
  (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v10 + 96))(v10, 0, (float)(int)v11, (float)SHIDWORD(v11), (float)v12, (float)v13);
  (*(void (**)(HGCrop *, _QWORD, HGTextureWrap *))(*(_QWORD *)v10 + 120))(v10, 0, v8);
  *v7 = v10;
  return (HGRef<HGNode>)(*(uint64_t (**)(HGTextureWrap *))(*(_QWORD *)v8 + 24))(v8);
}

- (BOOL)getHeliumImage:(id *)a3 layerOffsetX:(double *)a4 layerOffsetY:(double *)a5 requestInfo:(id *)a6 fromParm:(int)a7 atTime:(id)a8
{
  uint64_t v9;
  uint64_t v14;
  void *v15;
  __int128 v16;
  _OWORD v18[3];

  v9 = *(_QWORD *)&a7;
  v14 = -[PROAPIAccessing apiForProtocol:](self->_apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (v14)
  {
    v15 = (void *)v14;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v16 = *(_OWORD *)&a6->var2;
      v18[0] = *(_OWORD *)&a6->var0.var0;
      v18[1] = v16;
      v18[2] = *(_OWORD *)&a6->var4;
      LOBYTE(v14) = objc_msgSend(v15, "getHeliumImage:layerOffsetX:layerOffsetY:requestInfo:fromParm:atTime:", a3, a4, a5, v18, v9, a8.var1);
    }
    else
    {
      *a3 = 0;
      LOBYTE(v14) = 1;
    }
  }
  return v14;
}

- (BOOL)getHeliumImage:(id *)a3 source:(BOOL)a4 withInfo:(id *)a5 atTime:(id)a6
{
  uint64_t v6;
  uint64_t v7;

  PCPrint("File %s, line %d should not have been reached:\n\t", (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (uint64_t)a6.var1, v6, v7, (char)"/Library/Caches/com.apple.xbs/Sources/ProAppsFxSupportiOS/SharedFilterClasses/PAESharedDefaultBase.mm");
  pcAbortImpl();
}

- (PCMatrix44Tmpl<double>)getPixelTransformForImage:(SEL)a3
{
  PCMatrix44Tmpl<double> *result;

  FxMatrixToPCMatrix((FxMatrix44 *)objc_msgSend(a4, "pixelTransform"), (uint64_t)retstr);
  return result;
}

- (PCVector2<double>)getScaleForImage:(id)a3
{
  double *v3;
  double *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  PCVector2<double> result;

  v4 = v3;
  if (self)
  {
    -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a3);
    v5 = v7;
    v6 = v8;
  }
  else
  {
    v6 = 0.0;
    v5 = 0.0;
  }
  *v4 = v5;
  v4[1] = v6;
  result.var1 = v5;
  result.var0 = v6;
  return result;
}

- (PCMatrix44Tmpl<double>)getInversePixelTransformForImage:(SEL)a3
{
  _OWORD v6[8];

  if (self)
    -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4);
  else
    memset(v6, 0, sizeof(v6));
  retstr->var0[3][3] = 1.0;
  retstr->var0[2][2] = 1.0;
  retstr->var0[1][1] = 1.0;
  retstr->var0[0][0] = 1.0;
  *(_OWORD *)&retstr->var0[0][1] = 0u;
  *(_OWORD *)&retstr->var0[0][3] = 0u;
  *(_OWORD *)&retstr->var0[1][2] = 0u;
  *(_OWORD *)&retstr->var0[2][0] = 0u;
  *(_OWORD *)&retstr->var0[2][3] = 0u;
  *(_OWORD *)&retstr->var0[3][1] = 0u;
  return (PCMatrix44Tmpl<double> *)PCMatrix44Tmpl<double>::planarInverseZ((uint64_t)retstr, (double *)v6, 0.0);
}

- (PCVector2<double>)convertRelativeToImageCoordinates:(const void *)a3 withImage:(id)a4
{
  double *v4;
  double *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  PCVector2<double> result;

  v6 = v4;
  objc_msgSend(a4, "bounds");
  v10 = v9 + *(double *)a3 * v7;
  v12 = v11 + *((double *)a3 + 1) * v8;
  *v6 = v10;
  v6[1] = v12;
  result.var1 = v12;
  result.var0 = v10;
  return result;
}

- (PCVector2<double>)convertRelativeToPixelCoordinates:(const void *)a3 withImage:(id)a4
{
  double *v4;
  double *v5;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  PCVector2<double> result;

  v5 = v4;
  if (self)
  {
    -[PAESharedDefaultBase convertRelativeToImageCoordinates:withImage:](self, "convertRelativeToImageCoordinates:withImage:", a3);
    -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4);
    v9 = *v5;
    v8 = v5[1];
    v11 = v28;
    v10 = v29;
    v12 = v30;
    v14 = v22;
    v13 = v23;
    v16 = v24;
    v15 = v25;
    v17 = v26;
    v18 = v27;
  }
  else
  {
    v18 = 0.0;
    v17 = 0.0;
    v15 = 0.0;
    v16 = 0.0;
    v13 = 0.0;
    v14 = 0.0;
    v12 = 0.0;
    v10 = 0.0;
    v11 = 0.0;
    v8 = 0.0;
    v9 = 0.0;
  }
  v19 = v12 + v9 * v11 + v8 * v10;
  v20 = v9 * v15 + v8 * v17;
  v21 = (v18 + v20) / v19;
  *v5 = (v16 + v9 * v14 + v8 * v13) / v19;
  v5[1] = v21;
  result.var1 = v20;
  result.var0 = v21;
  return result;
}

- (PCRect<float>)getImageBoundary:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  float v9;
  float v10;
  PCRect<float> result;

  v4 = v3;
  objc_msgSend(a3, "bounds");
  *(float *)&v7 = v7;
  *(float *)&v8 = v8;
  *(_DWORD *)v4 = LODWORD(v7);
  *(_DWORD *)(v4 + 4) = LODWORD(v8);
  v9 = v5;
  v10 = v6;
  *(float *)(v4 + 8) = v9;
  *(float *)(v4 + 12) = v10;
  result.var3 = *(float *)&v6;
  result.var2 = *(float *)&v5;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- (PCRect<float>)getCropRectFromImage:(id)a3 toImage:(id)a4
{
  float32x4_t *v4;
  float32x4_t *v7;
  float64_t v8;
  float64_t v9;
  float64_t v10;
  float64_t v11;
  float v12;
  float v13;
  float v14;
  float32x4_t v15;
  _OWORD v16[8];
  float64x2_t v17;
  float64x2_t v18;
  PCRect<float> result;

  v7 = v4;
  objc_msgSend(a3, "bounds");
  v17.f64[0] = v8;
  v17.f64[1] = v9;
  v18.f64[0] = v10;
  v18.f64[1] = v11;
  if (self)
    -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4);
  else
    memset(v16, 0, sizeof(v16));
  PCMatrix44Tmpl<double>::transformRect<double>((double *)v16, v17.f64, (uint64_t)&v17);
  v14 = *(float *)v18.f64;
  v15 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v17), v18);
  *v7 = v15;
  result.var1 = v15.f32[0];
  result.var3 = v13;
  result.var2 = v12;
  result.var0 = v14;
  return result;
}

- (BOOL)getCropRectFromImage:(id)a3 toImage:(id)a4 output:(void *)a5
{
  float64_t v8;
  float64_t v9;
  float64_t v10;
  float64_t v11;
  _BOOL4 v12;
  _OWORD v14[8];
  float64x2_t v15;
  float64x2_t v16;

  objc_msgSend(a3, "bounds");
  v15.f64[0] = v8;
  v15.f64[1] = v9;
  v16.f64[0] = v10;
  v16.f64[1] = v11;
  if (self)
    -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4);
  else
    memset(v14, 0, sizeof(v14));
  v12 = PCMatrix44Tmpl<double>::transformRect<double>((double *)v14, v15.f64, (uint64_t)&v15);
  if (v12)
    *(float32x4_t *)a5 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v15), v16);
  return v12;
}

- (void)crop:(void *)a3 fromImage:(id)a4 toImage:(id)a5
{
  HGCrop *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (self)
  {
    -[PAESharedDefaultBase getCropRectFromImage:toImage:](self, "getCropRectFromImage:toImage:", a4, a5);
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  v6 = (HGCrop *)HGObject::operator new(0x1A0uLL);
  HGCrop::HGCrop(v6);
  (*(void (**)(HGCrop *, _QWORD, float, float, float))(*(_QWORD *)v6 + 96))(v6, 0, *(float *)&v8, *((float *)&v8 + 1) + *((float *)&v9 + 1), *(float *)&v8 + *(float *)&v9);
  (*(void (**)(HGCrop *, _QWORD, _QWORD))(*(_QWORD *)v6 + 120))(v6, 0, *(_QWORD *)a3);
  v7 = *(_QWORD *)a3;
  if (*(HGCrop **)a3 != v6)
  {
    if (v7)
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 24))(v7);
    *(_QWORD *)a3 = v6;
    (*(void (**)(HGCrop *))(*(_QWORD *)v6 + 16))(v6);
  }
  (*(void (**)(HGCrop *))(*(_QWORD *)v6 + 24))(v6);
}

- (void)crop:(void *)a3 withRect:(PCRect<float>)a4
{
  float *v4;
  float *v5;
  HGCrop *v7;
  uint64_t v8;

  v5 = v4;
  v7 = (HGCrop *)HGObject::operator new(0x1A0uLL);
  HGCrop::HGCrop(v7);
  (*(void (**)(HGCrop *, _QWORD, float, float, float))(*(_QWORD *)v7 + 96))(v7, 0, *v5, v5[1] + v5[3], *v5 + v5[2]);
  (*(void (**)(HGCrop *, _QWORD, _QWORD))(*(_QWORD *)v7 + 120))(v7, 0, *(_QWORD *)a3);
  v8 = *(_QWORD *)a3;
  if (*(HGCrop **)a3 != v7)
  {
    if (v8)
      (*(void (**)(uint64_t))(*(_QWORD *)v8 + 24))(v8);
    *(_QWORD *)a3 = v7;
    (*(void (**)(HGCrop *))(*(_QWORD *)v7 + 16))(v7);
  }
  (*(void (**)(HGCrop *))(*(_QWORD *)v7 + 24))(v7);
}

- (HGRef<HGNode>)cropFromImage:(id)a3 toImage:(id)a4
{
  _QWORD *v4;
  _QWORD *v8;

  v8 = v4;
  if (a3)
    objc_msgSend(a3, "heliumRef");
  else
    *v4 = 0;
  return (HGRef<HGNode>)-[PAESharedDefaultBase crop:fromImage:toImage:](self, "crop:fromImage:toImage:", v8, a3, a4);
}

- (HGRef<HGNode>)smear:(HGRef<HGNode>)a3 fromImage:(id)a4 toImage:(id)a5
{
  HgcSmearToRect **v5;
  HgcSmearToRect **v7;
  float64x2_t v8;
  float64x2_t v9;
  _OWORD v11[2];
  float32x2_t v12;
  float32x2_t v13;

  v7 = v5;
  if (self)
  {
    -[PAESharedDefaultBase getCropRectFromImage:toImage:](self, "getCropRectFromImage:toImage:", a4, a5);
    v8 = vcvtq_f64_f32(v12);
    v9 = vcvtq_f64_f32(v13);
  }
  else
  {
    v12 = 0;
    v13 = 0;
    v8 = 0uLL;
    v9 = 0uLL;
  }
  v11[0] = v8;
  v11[1] = v9;
  return (HGRef<HGNode>)Fx_smearToRect(a3.var0, (uint64_t)v11, v7);
}

- (BOOL)smear:(HGRef<HGNode>)a3 fromImage:(id)a4 toImage:(id)a5 resultNode:(void *)a6
{
  _BOOL4 v8;
  uint64_t v9;
  HgcSmearToRect *v10;
  _OWORD v12[2];
  HgcSmearToRect *v13;
  __int128 v14;

  v14 = xmmword_1B35579A0;
  v8 = -[PAESharedDefaultBase getCropRectFromImage:toImage:output:](self, "getCropRectFromImage:toImage:output:", a4, a5, &v14);
  if (v8)
  {
    v12[0] = vcvtq_f64_f32(*(float32x2_t *)&v14);
    v12[1] = vcvtq_f64_f32(*(float32x2_t *)((char *)&v14 + 8));
    Fx_smearToRect(a3.var0, (uint64_t)v12, &v13);
    v9 = *(_QWORD *)a6;
    v10 = v13;
    if (*(HgcSmearToRect **)a6 == v13)
    {
      if (v9)
        (*(void (**)(uint64_t))(*(_QWORD *)v9 + 24))(v9);
    }
    else
    {
      if (v9)
      {
        (*(void (**)(uint64_t))(*(_QWORD *)v9 + 24))(v9);
        v10 = v13;
      }
      *(_QWORD *)a6 = v10;
    }
  }
  return v8;
}

- (void)transform:(void *)a3 fromImage:(id)a4 toImage:(id)a5 fit:(BOOL)a6
{
  _BOOL4 v6;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25[8];
  _OWORD v26[8];
  _BYTE v27[128];
  double v28[16];
  uint64_t v29;
  double v30;
  __int128 v31;
  __int128 v32;
  double v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[24];
  __int128 v37;
  uint64_t v38;

  v6 = a6;
  v38 = 0x3FF0000000000000;
  *(_QWORD *)v36 = 0x3FF0000000000000;
  v33 = 1.0;
  v30 = 1.0;
  v31 = 0u;
  v32 = 0u;
  v34 = 0u;
  v35 = 0u;
  *(_OWORD *)&v36[8] = 0u;
  v37 = 0u;
  objc_msgSend(a5, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(a4, "bounds");
  if (v6)
  {
    v31 = 0u;
    v32 = 0u;
    *(_QWORD *)&v34 = 0;
    v35 = 0u;
    v38 = 0x3FF0000000000000;
    *(_QWORD *)&v36[16] = 0;
    v37 = 0uLL;
    v30 = v16 / v21;
    *(double *)&v32 = v12 - v16 * v19 / v21;
    v33 = v18 / v22;
    *((double *)&v34 + 1) = v14 - v18 * v20 / v22;
    *(_OWORD *)v36 = xmmword_1B304EED0;
  }
  if (self)
  {
    -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a5);
    PCMatrix44Tmpl<double>::operator*((uint64_t)v26, (__int128 *)&v30, (uint64_t)v27);
    -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a4);
  }
  else
  {
    memset(v26, 0, sizeof(v26));
    PCMatrix44Tmpl<double>::operator*((uint64_t)v26, (__int128 *)&v30, (uint64_t)v27);
    memset(v25, 0, sizeof(v25));
  }
  PCMatrix44Tmpl<double>::operator*((uint64_t)v27, v25, (uint64_t)v28);
  FxSupport::makeHeliumXForm(v28, (uint64_t *)a3, 1, 0, &v29);
  v23 = *(_QWORD *)a3;
  v24 = v29;
  if (*(_QWORD *)a3 == v29)
  {
    if (v23)
      (*(void (**)(uint64_t))(*(_QWORD *)v23 + 24))(v23);
  }
  else
  {
    if (v23)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v23 + 24))(v23);
      v24 = v29;
    }
    *(_QWORD *)a3 = v24;
  }
}

- (HGRef<HGNode>)transformFromImage:(id)a3 toImage:(id)a4 fit:(BOOL)a5
{
  _QWORD *v5;
  _BOOL8 v6;
  _QWORD *v10;

  v6 = a5;
  v10 = v5;
  if (a3)
    objc_msgSend(a3, "heliumRef");
  else
    *v5 = 0;
  return (HGRef<HGNode>)-[PAESharedDefaultBase transform:fromImage:toImage:fit:](self, "transform:fromImage:toImage:fit:", v10, a3, a4, v6);
}

- (BOOL)getPoint:(void *)a3 fromParm:(unsigned int)a4 atTime:(id)a5 withImage:(id)a6
{
  PROAPIAccessing *apiManager;
  uint64_t v8;
  void *v10;

  apiManager = self->_apiManager;
  if (apiManager
    && (v8 = *(_QWORD *)&a4,
        (v10 = (void *)-[PROAPIAccessing apiForProtocol:](apiManager, "apiForProtocol:", &unk_1EF0A70B8, *(_QWORD *)&a4, a5.var1, a6)) != 0))
  {
    return objc_msgSend(v10, "getXValue:YValue:fromParm:atFxTime:", a3, (char *)a3 + 8, v8, a5.var1);
  }
  else
  {
    return 0;
  }
}

- (double)relativeShutterForAngle:(double)a3
{
  void *v5;
  double v6;
  __int128 *v8;
  __int128 v9;
  uint64_t v10;

  v5 = (void *)-[PROAPIAccessing apiForProtocol:](self->_apiManager, "apiForProtocol:", &unk_1EF0A7DB0);
  if (!v5)
    return 0.0;
  v9 = *MEMORY[0x1E0CA2E68];
  v10 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v8 = &v9;
  objc_msgSend(v5, "durationFxTimeForEffect:", &v8);
  -[PAESharedDefaultBase frameFromFxTime:forPlugIn:](self, "frameFromFxTime:forPlugIn:", v8, 0);
  return a3 / 360.0 / v6;
}

- (double)secondsFromFxTime:(id)a3
{
  __int128 v3;
  CMTime v5;

  v3 = *(_OWORD *)a3.var1;
  v5.epoch = *((_QWORD *)a3.var1 + 2);
  *(_OWORD *)&v5.value = v3;
  return CMTimeGetSeconds(&v5);
}

- (double)frameRate
{
  void *v2;
  void *v3;
  double v4;

  v2 = (void *)-[PROAPIAccessing apiForProtocol:](self->_apiManager, "apiForProtocol:", &unk_1EF0A79F8);
  if (!v2)
    return 0.0;
  v3 = v2;
  v4 = (double)(unint64_t)objc_msgSend(v2, "timelineFpsNumeratorForEffect:", 0);
  return v4 / (double)(unint64_t)objc_msgSend(v3, "timelineFpsDenominatorForEffect:", 0);
}

- (double)frameFromFxTime:(id)a3 forPlugIn:(id)a4
{
  double v5;
  double v6;
  double v7;

  -[PAESharedDefaultBase secondsFromFxTime:](self, "secondsFromFxTime:", a3.var1, a4);
  v6 = v5;
  -[PAESharedDefaultBase frameRate](self, "frameRate");
  return v6 * v7;
}

- (void)fxTime:(id *)a3 fromFrame:(double)a4 forPlugIn:(id)a5
{
  void *v8;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var1;
  __int128 v10;
  CMTime v11;

  v8 = (void *)-[PROAPIAccessing apiForProtocol:](self->_apiManager, "apiForProtocol:", &unk_1EF0A79F8);
  if (v8)
  {
    memset(&v11, 0, sizeof(v11));
    CMTimeMakeWithSeconds(&v11, a4/ (double)(objc_msgSend(v8, "timelineFpsNumeratorForEffect:", a5)/ (unint64_t)objc_msgSend(v8, "timelineFpsDenominatorForEffect:", a5)), 120000);
    var1 = a3->var1;
    v10 = *(_OWORD *)&v11.value;
    *((_QWORD *)var1 + 2) = v11.epoch;
    *(_OWORD *)var1 = v10;
  }
}

- (float)getBlendingGamma
{
  void *v2;
  float result;

  v2 = (void *)-[PROAPIAccessing apiForProtocol:](self->_apiManager, "apiForProtocol:", &unk_1EF0A3D78);
  if (!v2)
    return PCRenderModel::getDefaultBlendingGamma(0);
  objc_msgSend(v2, "blendingGamma");
  return result;
}

@end
