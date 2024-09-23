@implementation PAEEquirectProject

- (PAEEquirectProject)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEEquirectProject;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PAEEquirectProject;
  -[PAESharedDefaultBase dealloc](&v2, sel_dealloc);
}

- (BOOL)addParameters
{
  void *v2;
  void *v3;

  v2 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A6DD0);
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "addImageReferenceWithName:parmId:parmFlags:", CFSTR("Equirect Image"), 1, 0);
  return v3 != 0;
}

- (BOOL)variesOverTime
{
  return 0;
}

- (id)properties
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 67584);
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 591872);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PixelTransformSupport"), v4, CFSTR("TransformsFromLocalToScreenSpace"), v5, CFSTR("UsesRationalTime"), v6, CFSTR("SupportsHeliumRendering"), v7, CFSTR("SDRWorkingSpace"), v8, CFSTR("HDRWorkingSpace"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
}

- (BOOL)frameSetup:(id *)a3 hardware:(BOOL *)a4 software:(BOOL *)a5
{
  *a4 = 0;
  *a5 = 0;
  return 1;
}

- (PCMatrix44Tmpl<float>)getViewMatrix:(SEL)a3
{
  uint64_t v7;
  PCMatrix44Tmpl<float> *result;
  BOOL v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  double v26[17];

  v26[16] = *(double *)MEMORY[0x1E0C80C00];
  v7 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  result = (PCMatrix44Tmpl<float> *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8380);
  if (v7)
    v9 = result == 0;
  else
    v9 = 1;
  if (v9)
  {
    retstr->var0[0][0] = 1.0;
    *(_QWORD *)&retstr->var0[0][3] = 0;
    *(_QWORD *)&retstr->var0[0][1] = 0;
    retstr->var0[1][1] = 1.0;
    *(_QWORD *)&retstr->var0[1][2] = 0;
    *(_QWORD *)&retstr->var0[2][0] = 0;
    *(_OWORD *)&retstr->var0[2][2] = xmmword_1B304F230;
    v25 = 1.0;
    v21 = 0.0;
  }
  else
  {
    result = (PCMatrix44Tmpl<float> *)objc_msgSend((id)unk_1EF0BD7F0(result, "cameraMatrixAtTime:", a4.var0), "getBytes:length:", v26, 128);
    v10 = v26[0];
    v11 = v26[1];
    v12 = v26[2];
    v13 = v26[3];
    v14 = v26[4];
    v15 = v26[5];
    v16 = v26[6];
    v17 = v26[7];
    v18 = v26[8];
    v19 = v26[9];
    v20 = v26[10];
    v21 = v26[11];
    v22 = v26[12];
    v23 = v26[13];
    v24 = v26[14];
    v25 = v26[15];
    retstr->var0[0][0] = v10;
    retstr->var0[0][1] = v14;
    retstr->var0[0][2] = v18;
    retstr->var0[0][3] = v22;
    retstr->var0[1][0] = v11;
    retstr->var0[1][1] = v15;
    retstr->var0[1][2] = v19;
    retstr->var0[1][3] = v23;
    retstr->var0[2][0] = v12;
    retstr->var0[2][1] = v16;
    retstr->var0[2][2] = v20;
    retstr->var0[2][3] = v24;
    retstr->var0[3][0] = v13;
    retstr->var0[3][1] = v17;
  }
  retstr->var0[3][2] = v21;
  retstr->var0[3][3] = v25;
  return result;
}

- (double)getProjectionFOVYDegrees:(id)a3
{
  double v3;
  double v4;
  long double v5;

  objc_msgSend((id)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8380), "focalLengthAtFxTime:", a3.var1);
  v4 = 0.0;
  if (fabs(v3) != INFINITY)
  {
    v5 = atan(1.0 / v3 * 36.0 * 0.5);
    return (v5 + v5) * 57.2957795;
  }
  return v4;
}

- (HGEquirectProjectParams)getParams:(SEL)a3 :(id *)a4 :(id)a5 :(id)a6
{
  int *p_var12;
  HGEquirectProjectParams *result;
  double v14;
  float v15;
  float v16;
  float v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;

  *(_OWORD *)retstr->var0 = xmmword_1B304F230;
  *(_OWORD *)&retstr->var1[1] = xmmword_1B304F230;
  *(_QWORD *)&retstr->var2[2] = 0x423400003F800000;
  retstr->var4 = 45.0;
  *(_QWORD *)&retstr->var12 = 0;
  p_var12 = &retstr->var12;
  retstr->var5 = 0;
  *(_QWORD *)&retstr->var14 = 0;
  *(_WORD *)&retstr->var16 = 0;
  *(_OWORD *)retstr->var18 = xmmword_1B304FAB0;
  *(_OWORD *)retstr->var19 = xmmword_1B3050190;
  *(_OWORD *)retstr->var20 = xmmword_1B304FAB0;
  *(_OWORD *)retstr->var21 = xmmword_1B3050190;
  result = (HGEquirectProjectParams *)-[PAEEquirectProject getProjectionFOVYDegrees:](self, "getProjectionFOVYDegrees:", a4->var0.var1, a5, a6, a7);
  *(float *)&v14 = v14;
  retstr->var3 = *(float *)&v14;
  if (self)
  {
    result = -[PAEEquirectProject getViewMatrix:](self, "getViewMatrix:", a4->var0.var1);
    v15 = *(float *)&v22;
    v16 = *(float *)&v23;
    v17 = *(float *)&v24;
  }
  else
  {
    v24 = 0u;
    v22 = 0u;
    v23 = 0u;
    v17 = 0.0;
    v16 = 0.0;
    v15 = 0.0;
  }
  retstr->var0[0] = v15;
  retstr->var0[1] = v16;
  retstr->var0[2] = v17;
  if (a6)
  {
    *p_var12 = objc_msgSend(a6, "width");
    result = (HGEquirectProjectParams *)objc_msgSend(a6, "height");
  }
  retstr->var1[0] = *((float *)&v22 + 1);
  retstr->var1[1] = *((float *)&v23 + 1);
  retstr->var1[2] = *((float *)&v24 + 1);
  retstr->var2[0] = *((float *)&v22 + 2);
  retstr->var2[1] = *((float *)&v23 + 2);
  retstr->var2[2] = *((float *)&v24 + 2);
  *(_QWORD *)&retstr->var12 = 0;
  if (a6)
  {
    retstr->var12 = objc_msgSend(a6, "width");
    result = (HGEquirectProjectParams *)objc_msgSend(a6, "height");
    retstr->var13 = (int)result;
    if (self)
    {
      result = -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a6);
    }
    else
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
    }
    *(float32x4_t *)retstr->var20 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v18), v19);
    *(float32x4_t *)retstr->var21 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v20), v21);
  }
  *(_QWORD *)&retstr->var14 = 0;
  if (a5)
  {
    result = (HGEquirectProjectParams *)objc_msgSend(a5, "imageInfo");
    *(int32x2_t *)&retstr->var14 = vmovn_s64((int64x2_t)0);
    if (self)
    {
      result = -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a5);
    }
    else
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
    }
    *(float32x4_t *)retstr->var18 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v18), v19);
    *(float32x4_t *)retstr->var19 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v20), v21);
    retstr->var17 = 1;
  }
  retstr->var5 = 0;
  return result;
}

- (BOOL)renderOutput:(id)a3 withInfo:(id *)a4
{
  uint64_t v7;
  int v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  HGEquirectProject *v13;
  float v14;
  HGXForm *v15;
  HGXForm *v17;
  _BYTE v18[144];
  _OWORD v19[3];
  HGEquirectProjectParams v20;
  _OWORD v21[3];
  id v22;

  if (objc_msgSend(a3, "imageType") == 3)
  {
    v7 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
    v8 = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a4->var0.var1);
    if (v8)
    {
      v22 = 0;
      v9 = *(_OWORD *)&a4->var2;
      v10 = *(_OWORD *)&a4->var4;
      v21[0] = *(_OWORD *)&a4->var0.var0;
      v21[1] = v9;
      v21[2] = v10;
      -[PAESharedDefaultBase getHeliumImage:layerOffsetX:layerOffsetY:requestInfo:fromParm:atTime:](self, "getHeliumImage:layerOffsetX:layerOffsetY:requestInfo:fromParm:atTime:", &v22, 0, 0, v21, 1, a4->var0.var1);
      if (v22)
      {
        objc_msgSend(v22, "heliumRef");
        v11 = *(_QWORD *)v20.var0;
        if (*(_QWORD *)v20.var0)
          (*(void (**)(_QWORD))(**(_QWORD **)v20.var0 + 24))(*(_QWORD *)v20.var0);
      }
      else
      {
        fwrite("PAEEquirectProject: failed to get equirect input image.\n", 0x38uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
        v11 = 0;
      }
      v12 = *(_OWORD *)&a4->var2;
      v19[0] = *(_OWORD *)&a4->var0.var0;
      v19[1] = v12;
      v19[2] = *(_OWORD *)&a4->var4;
      -[PAEEquirectProject getParams::::](self, "getParams::::", v19, a3, v22, v7);
      v13 = (HGEquirectProject *)HGObject::operator new(0x240uLL);
      HGEquirectProject::HGEquirectProject(v13);
      v14 = HGEquirectProject::setParams(v13, &v20);
      (*(void (**)(HGEquirectProject *, _QWORD, uint64_t, float))(*(_QWORD *)v13 + 120))(v13, 0, v11, v14);
      v15 = (HGXForm *)HGObject::operator new(0x210uLL);
      HGXForm::HGXForm(v15);
      (*(void (**)(HGXForm *, _QWORD, HGEquirectProject *))(*(_QWORD *)v15 + 120))(v15, 0, v13);
      HGTransform::HGTransform((HGTransform *)v18);
      HGTransform::Translate((HGTransform *)v18, 0.0, (double)-v20.var15, 0.0);
      HGTransform::Scale((HGTransform *)v18, 1.0, -1.0, 1.0);
      (*(void (**)(HGXForm *, _BYTE *))(*(_QWORD *)v15 + 576))(v15, v18);
      v17 = v15;
      (*(void (**)(HGXForm *))(*(_QWORD *)v15 + 16))(v15);
      objc_msgSend(a3, "setHeliumRef:", &v17);
      if (v17)
        (*(void (**)(HGXForm *))(*(_QWORD *)v17 + 24))(v17);
      HGTransform::~HGTransform((HGTransform *)v18);
      (*(void (**)(HGXForm *))(*(_QWORD *)v15 + 24))(v15);
      (*(void (**)(HGEquirectProject *))(*(_QWORD *)v13 + 24))(v13);
      LOBYTE(v8) = 1;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (BOOL)frameCleanup
{
  return 1;
}

@end
