@implementation PAETile

- (PAETile)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAETile;
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
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PositionIndependent"), v4, CFSTR("MayRemapTime"), v5, CFSTR("SupportsLargeRenderScale"), v6, CFSTR("SupportsHeliumRendering"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
}

- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4
{
  *a3 = 1;
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PAETile;
  -[PAESharedDefaultBase addParameters](&v12, sel_addParameters);
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
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Tile::Center"), 0, 0), 1, 0, 0.5, 0.5);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Tile::Skew"), 0, 0), 2, 0, 0.0, -3.0, 3.0, -3.0, 3.0, 1.0);
    v9 = objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Tile::Scale"), 0, 0);
    if (v7 >= 2)
      v10 = 200.0;
    else
      v10 = 20.0;
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", v9, 3, 0, 3.0, 0.0, v10, 0.0, 20.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Tile::Stretch"), 0, 0), 4, 0, 1.0, 0.1, 10.0, 0.1, 10.0, 1.0);
    objc_msgSend(v3, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Tile::Angle"), 0, 0), 5, 0, 0.0, -360.0, 360.0);
  }
  return v6;
}

- (void)_compute_2x2_matrix:(float *)a3 withScale:(float)a4 angle:(float)a5 skew:(float)a6 stretch:(float)a7
{
  __float2 v11;

  v11 = __sincosf_stret(a5);
  *a3 = (float)((float)(v11.__cosval - (float)(v11.__sinval * a6)) * a7) * a4;
  a3[1] = (float)((float)(v11.__sinval + (float)(v11.__cosval * a6)) * a7) * a4;
  a3[2] = -(float)(v11.__sinval * a4);
  a3[3] = v11.__cosval * a4;
}

- (void)retrieveXValue:(double *)a3 YValue:(double *)a4 skew:(double *)a5 scale:(double *)a6 stretch:(double *)a7 rotation:(double *)a8 forOutputImage:(id)a9 withRenderInfo:(id *)a10
{
  void *v16;
  uint64_t v17;

  v16 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A4590);
  v17 = objc_msgSend(a9, "origin");
  objc_msgSend(v16, "getXValue:YValue:fromParm:atFxTime:", a3, a4, 1, a10->var0.var1);
  objc_msgSend(v16, "getFloatValue:fromParm:atFxTime:", a5, 2, a10->var0.var1);
  if (v17 == 2)
  {
    objc_msgSend(v16, "getFloatValue:fromParm:atFxTime:", a6, 3, a10->var0.var1);
    objc_msgSend(v16, "getFloatValue:fromParm:atFxTime:", a7, 4, a10->var0.var1);
    objc_msgSend(v16, "getFloatValue:fromParm:atFxTime:", a8, 5, a10->var0.var1);
  }
  else
  {
    *a5 = -*a5;
    objc_msgSend(v16, "getFloatValue:fromParm:atFxTime:", a6, 3, a10->var0.var1);
    objc_msgSend(v16, "getFloatValue:fromParm:atFxTime:", a7, 4, a10->var0.var1);
    objc_msgSend(v16, "getFloatValue:fromParm:atFxTime:", a8, 5, a10->var0.var1);
    *a8 = -*a8;
  }
}

- (HGRef<HGNode>)transformAndTile:(HGRef<HGNode>)a3 withXValue:(double)a4 YValue:(double)a5 skew:(double)a6 scale:(double)a7 stretch:(double)a8 rotation:(double)a9 resolution:(PCVector2<double>)a10 inputImage:(id)a11
{
  void *v11;
  HGCrop **v12;
  void *v13;
  HGCrop **v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  HGXForm *v33;
  HGCrop *v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  int v38;
  int v39;
  HGTextureWrap *v40;
  char *v41;
  HGXForm *v42;
  HGXForm *v43;
  HGXForm *v44;
  HGCrop *v45;
  float32x2_t v46;
  float32x2_t v47;
  float v53;
  float v54;
  float v55;
  float v56;
  uint64_t v57;
  int v58;
  int v59;
  HGRef<HGNode> v60;
  double v61;
  double v62;
  __int128 v63;
  _OWORD v64[2];
  float32x2_t v65;
  float32x2_t v66;
  _OWORD v67[8];
  _BYTE v68[144];
  _BYTE v69[144];
  float64x2_t v70[9];
  float64x2_t v71[9];
  _QWORD v72[18];
  uint64_t v73;
  double v74[6];
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;
  float v81[4];
  uint64_t v82;

  v13 = v11;
  v23 = v12;
  v82 = *MEMORY[0x1E0C80C00];
  v24 = log2(a7);
  v25 = exp2(floor(v24));
  v26 = a7 / v25;
  *(float *)&v26 = a7 / v25;
  *(float *)&v27 = a9;
  *(float *)&v28 = a6;
  *(float *)&v29 = a8;
  -[PAETile _compute_2x2_matrix:withScale:angle:skew:stretch:](self, "_compute_2x2_matrix:withScale:angle:skew:stretch:", v81, v26, v27, v28, v29);
  v74[0] = v81[0];
  v74[1] = v81[2];
  v74[3] = 0.0;
  v74[2] = 0.0;
  v74[4] = v81[1];
  v74[5] = v81[3];
  v75 = 0u;
  v76 = 0u;
  v78 = 0u;
  v79 = 0u;
  v77 = 0x3FF0000000000000;
  v80 = 0x3FF0000000000000;
  v30 = *(_QWORD *)a3.var0;
  v73 = v30;
  if (v30)
    (*(void (**)(uint64_t))(*(_QWORD *)v30 + 16))(v30);
  if (!self)
  {
    v72[0] = 0;
    v32 = *(_QWORD *)a3.var0;
    if (!*(_QWORD *)a3.var0)
      goto LABEL_10;
LABEL_8:
    (*(void (**)(uint64_t))(*(_QWORD *)v32 + 24))(v32);
    v31 = v72[0];
LABEL_9:
    *(_QWORD *)a3.var0 = v31;
    v72[0] = 0;
    goto LABEL_10;
  }
  -[PAESharedDefaultBase smear:fromImage:toImage:](self, "smear:fromImage:toImage:", &v73, v13, v13);
  v31 = v72[0];
  v32 = *(_QWORD *)a3.var0;
  if (*(_QWORD *)a3.var0 != v72[0])
  {
    if (!v32)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (v72[0])
    (*(void (**)(void))(*(_QWORD *)v72[0] + 24))();
LABEL_10:
  if (v73)
    (*(void (**)(uint64_t))(*(_QWORD *)v73 + 24))(v73);
  HGTransform::HGTransform((HGTransform *)v72);
  HGTransform::Scale((HGTransform *)v72, 1.0 / v25, 1.0 / v25, 1.0);
  v33 = (HGXForm *)HGObject::operator new(0x210uLL);
  HGXForm::HGXForm(v33);
  (*(void (**)(HGXForm *, _QWORD *))(*(_QWORD *)v33 + 576))(v33, v72);
  (*(void (**)(HGXForm *, _QWORD, _QWORD))(*(_QWORD *)v33 + 120))(v33, 0, *(_QWORD *)a3.var0);
  (*(void (**)(HGXForm *, _QWORD, float))(*(_QWORD *)v33 + 592))(v33, 0, 0.0);
  v34 = (HGCrop *)HGObject::operator new(0x1A0uLL);
  HGCrop::HGCrop(v34);
  (*(void (**)(HGCrop *, _QWORD, HGXForm *))(*(_QWORD *)v34 + 120))(v34, 0, v33);
  v35 = objc_msgSend(v13, "width");
  v36 = objc_msgSend(v13, "height");
  v37 = HGRectMake4i((int)-floor((double)v35 * 0.5 / v25), (int)-floor((double)v36 * 0.5 / v25), vcvtmd_s64_f64((double)v35 * 0.5 / v25), vcvtmd_s64_f64((double)v36 * 0.5 / v25));
  (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v34 + 96))(v34, 0, (float)(int)v37, (float)SHIDWORD(v37), (float)v38, (float)v39);
  (*(void (**)(HGCrop *, uint64_t, uint64_t))(*(_QWORD *)v34 + 136))(v34, 0xFFFFFFFFLL, 2);
  HGTransform::HGTransform((HGTransform *)v71);
  HGTransform::Translate((HGTransform *)v71, a4, a5, 0.0);
  HGTransform::HGTransform((HGTransform *)v70);
  HGTransform::LoadMatrixd((HGTransform *)v70, v74);
  HGTransform::Invert(v70[0].f64);
  HGTransform::Multiply(v70, v71);
  v40 = (HGTextureWrap *)HGObject::operator new(0x1D0uLL);
  HGTextureWrap::HGTextureWrap(v40);
  (*(void (**)(HGTextureWrap *, _QWORD, HGCrop *))(*(_QWORD *)v40 + 120))(v40, 0, v34);
  HGTextureWrap::SetTextureWrapMode((uint64_t)v40, (const char *)3, v41);
  HGTransform::HGTransform((HGTransform *)v69);
  HGTransform::Scale((HGTransform *)v69, *(double *)a11, *((double *)a11 + 1), 1.0);
  v42 = (HGXForm *)HGObject::operator new(0x210uLL);
  HGXForm::HGXForm(v42);
  (*(void (**)(HGXForm *, _BYTE *))(*(_QWORD *)v42 + 576))(v42, v69);
  (*(void (**)(HGXForm *, _QWORD, HGTextureWrap *))(*(_QWORD *)v42 + 120))(v42, 0, v40);
  v43 = (HGXForm *)HGObject::operator new(0x210uLL);
  HGXForm::HGXForm(v43);
  (*(void (**)(HGXForm *, _QWORD, HGXForm *))(*(_QWORD *)v43 + 120))(v43, 0, v42);
  (*(void (**)(HGXForm *, float64x2_t *))(*(_QWORD *)v43 + 576))(v43, v70);
  HGTransform::HGTransform((HGTransform *)v68);
  HGTransform::Scale((HGTransform *)v68, 1.0 / *(double *)a11, 1.0 / *((double *)a11 + 1), 0.0);
  v44 = (HGXForm *)HGObject::operator new(0x210uLL);
  HGXForm::HGXForm(v44);
  (*(void (**)(HGXForm *, _BYTE *))(*(_QWORD *)v44 + 576))(v44, v68);
  (*(void (**)(HGXForm *, _QWORD, HGXForm *))(*(_QWORD *)v44 + 120))(v44, 0, v43);
  v45 = (HGCrop *)HGObject::operator new(0x1A0uLL);
  HGCrop::HGCrop(v45);
  (*(void (**)(HGCrop *, _QWORD, HGXForm *))(*(_QWORD *)v45 + 120))(v45, 0, v44);
  if (self)
  {
    -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", v13);
    -[PAESharedDefaultBase getImageBoundary:](self, "getImageBoundary:", v13);
    v46 = v65;
    v47 = v66;
  }
  else
  {
    memset(v67, 0, sizeof(v67));
    v46 = 0;
    v47 = 0;
    v65 = 0;
    v66 = 0;
  }
  v64[0] = vcvtq_f64_f32(v46);
  v64[1] = vcvtq_f64_f32(v47);
  v61 = 0.0;
  v62 = 0.0;
  __asm { FMOV            V0.2D, #-1.0 }
  v63 = _Q0;
  PCMatrix44Tmpl<double>::transformRect<double>((double *)v67, (double *)v64, (uint64_t)&v61);
  v53 = v61;
  v54 = v62;
  v55 = *(double *)&v63;
  v56 = *((double *)&v63 + 1);
  v57 = HGRectMake4i((int)v53, (int)v54, (int)v55 + (int)v53, (int)v56 + (int)v54);
  (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v45 + 96))(v45, 0, (float)(int)v57, (float)SHIDWORD(v57), (float)v58, (float)v59);
  *v23 = v45;
  (*(void (**)(HGXForm *))(*(_QWORD *)v44 + 24))(v44);
  HGTransform::~HGTransform((HGTransform *)v68);
  (*(void (**)(HGXForm *))(*(_QWORD *)v43 + 24))(v43);
  (*(void (**)(HGXForm *))(*(_QWORD *)v42 + 24))(v42);
  HGTransform::~HGTransform((HGTransform *)v69);
  (*(void (**)(HGTextureWrap *))(*(_QWORD *)v40 + 24))(v40);
  HGTransform::~HGTransform((HGTransform *)v70);
  HGTransform::~HGTransform((HGTransform *)v71);
  (*(void (**)(HGCrop *))(*(_QWORD *)v34 + 24))(v34);
  (*(void (**)(HGXForm *))(*(_QWORD *)v33 + 24))(v33);
  HGTransform::~HGTransform((HGTransform *)v72);
  return v60;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  int v10;
  double v11;
  double v12;
  double v13;
  __int128 v14;
  double v15;
  double v16;
  _QWORD v18[2];
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _OWORD v22[3];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v9)
  {
    v10 = objc_msgSend(v9, "versionAtCreation");
    -[PAESharedDefaultBase getScaleForImage:](self, "getScaleForImage:", a4);
    v11 = v30;
    if (v10)
    {
      v12 = v29;
    }
    else
    {
      objc_msgSend(a4, "pixelAspect");
      v12 = v29 * (1.0 / v13);
    }
    v27 = 0.5;
    v28 = 0.5;
    v26 = 0;
    v24 = 0x3FF0000000000000;
    v25 = 0x4008000000000000;
    v23 = 0;
    v14 = *(_OWORD *)&a5->var2;
    v22[0] = *(_OWORD *)&a5->var0.var0;
    v22[1] = v14;
    v22[2] = *(_OWORD *)&a5->var4;
    -[PAETile retrieveXValue:YValue:skew:scale:stretch:rotation:forOutputImage:withRenderInfo:](self, "retrieveXValue:YValue:skew:scale:stretch:rotation:forOutputImage:withRenderInfo:", &v28, &v27, &v26, &v25, &v24, &v23, a3, v22);
    LODWORD(v9) = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
    if ((_DWORD)v9)
    {
      if (objc_msgSend(a4, "imageType") == 3)
      {
        if (a4)
          objc_msgSend(a4, "heliumRef");
        else
          v21 = 0;
        v27 = v27 + -0.5;
        v28 = v28 + -0.5;
        v15 = v28;
        v28 = v12 * (v15 * (double)(unint64_t)objc_msgSend(a3, "width"));
        v16 = v27;
        v27 = v11 * (v16 * (double)(unint64_t)objc_msgSend(a3, "height"));
        v19 = v21;
        if (v21)
          (*(void (**)(uint64_t))(*(_QWORD *)v21 + 16))(v21);
        *(double *)v18 = v12;
        *(double *)&v18[1] = v11;
        -[PAETile transformAndTile:withXValue:YValue:skew:scale:stretch:rotation:resolution:inputImage:](self, "transformAndTile:withXValue:YValue:skew:scale:stretch:rotation:resolution:inputImage:", &v19, v18, a4, v28);
        if (v19)
          (*(void (**)(uint64_t))(*(_QWORD *)v19 + 24))(v19);
        objc_msgSend(a3, "setHeliumRef:", &v20);
        if (v20)
          (*(void (**)(uint64_t))(*(_QWORD *)v20 + 24))(v20);
        if (v21)
          (*(void (**)(uint64_t))(*(_QWORD *)v21 + 24))(v21);
        LOBYTE(v9) = 1;
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
