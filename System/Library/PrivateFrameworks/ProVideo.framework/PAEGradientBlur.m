@implementation PAEGradientBlur

- (PAEGradientBlur)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEGradientBlur;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
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
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PositionIndependent"), v4, CFSTR("SupportsHeliumRendering"), v5, CFSTR("MayRemapTime"), v6, CFSTR("SupportsLargeRenderScale"), v7, CFSTR("InputSizeLimit"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  id v7;
  uint64_t v9;
  id result;
  objc_class *v11;
  id v12;
  char v13;
  double v14;

  v7 = -[PAEFilterDefaultBase getParamAPIWithError:](self, "getParamAPIWithError:", a4);
  v14 = 0.0;
  if ((objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v14, 3, a3.var1) & 1) != 0
    && (v13 = 0, (objc_msgSend(v7, "getBoolValue:fromParm:atFxTime:", &v13, 4, a3.var1) & 1) != 0))
  {
    if (v14 == 0.0 && v13 == 0)
      v9 = 6;
    else
      v9 = 3;
    return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9, v14), CFSTR("PixelTransformSupport"), 0);
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
  return result;
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAEGradientBlur;
  -[PAESharedDefaultBase addParameters](&v6, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("GradientBlur::Point 1"), 0, 0), 1, 0, 0.0, 0.0);
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("GradientBlur::Point 2"), 0, 0), 2, 0, 0.67, 0.67);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("GradientBlur::Amount"), 0, 0), 3, 0, 10.0, 0.0, 100.0, 0.0, 100.0, 1.0);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("GradientBlur::Crop"), 0, 0), 4, 1, 1);
  }
  return v3 != 0;
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  void *v10;
  void *v11;
  unint64_t var1;
  double v13;
  double v15;
  char v16;

  v10 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (v10 && (v11 = v10, v16 = 0, objc_msgSend(v10, "getBoolValue:fromParm:atFxTime:", &v16, 4, a6->var0.var1), !v16))
  {
    v15 = 0.0;
    objc_msgSend(v11, "getFloatValue:fromParm:atFxTime:", &v15, 3, a6->var0.var1);
    v13 = v15 + v15;
    *a3 = (unint64_t)(v15 + v15 + (double)a5->var0);
    var1 = (unint64_t)(v13 + (double)a5->var1);
  }
  else
  {
    *a3 = a5->var0;
    var1 = a5->var1;
  }
  *a4 = var1;
  return 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  void *v10;
  double v11;
  double v12;
  HGNode *v13;
  int64x2_t v14;
  int64x2_t v15;
  HgcGradientBlur2 *v16;
  double v17;
  double v18;
  double v19;
  float v20;
  float v21;
  float v22;
  HgcGradientBlur2 *v23;
  uint64_t v24;
  float v25;
  float v26;
  float v27;
  int32x4_t v28;
  int32x4_t v29;
  float32x4_t v30;
  HGNode *v31;
  HGBlurGroup *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  HGNode *v38;
  HGBlurGroup *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  HGNode *v45;
  HGNode *v46;
  _QWORD v47[16];
  int64x2_t v48;
  int64x2_t v49;
  char v50;
  double v51;
  float v52[4];
  float v53;
  int64x2_t v54;
  float v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (v9)
  {
    v10 = v9;
    v51 = 10.0;
    v50 = 1;
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v51, 3, a5->var0.var1);
    if (v51 == 0.0)
    {
      if (a4)
        objc_msgSend(a4, "heliumRef", v51);
      else
        v47[0] = 0;
      objc_msgSend(a3, "setHeliumRef:", v47);
      if (v47[0])
        (*(void (**)(_QWORD))(*(_QWORD *)v47[0] + 24))(v47[0]);
LABEL_18:
      LOBYTE(v9) = 1;
      return (char)v9;
    }
    v49 = 0uLL;
    objc_msgSend(v10, "getXValue:YValue:fromParm:atFxTime:", &v49, &v49.u64[1], 1, a5->var0.var1, v51);
    v48 = vdupq_n_s64(0x3FE570A3D70A3D71uLL);
    objc_msgSend(v10, "getXValue:YValue:fromParm:atFxTime:", &v48, &v48.u64[1], 2, a5->var0.var1);
    objc_msgSend(v10, "getBoolValue:fromParm:atFxTime:", &v50, 4, a5->var0.var1);
    -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4);
    -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a3);
    v11 = *(double *)v47;
    v12 = *(double *)&v47[5];
    -[PAESharedDefaultBase convertRelativeToPixelCoordinates:withImage:](self, "convertRelativeToPixelCoordinates:withImage:", &v49, a3);
    v49 = v54;
    -[PAESharedDefaultBase convertRelativeToPixelCoordinates:withImage:](self, "convertRelativeToPixelCoordinates:withImage:", &v48, a3);
    v48 = v54;
    if (v51 == 0.0)
    {
      if (a4)
        objc_msgSend(a4, "heliumRef", v51);
      else
        v54.i64[0] = 0;
      objc_msgSend(a3, "setHeliumRef:", &v54);
      if (v54.i64[0])
        (*(void (**)(uint64_t))(*(_QWORD *)v54.i64[0] + 24))(v54.i64[0]);
      goto LABEL_18;
    }
    LODWORD(v9) = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1, v51);
    if ((_DWORD)v9)
    {
      if (objc_msgSend(a4, "imageType") == 3)
      {
        if (a4)
          objc_msgSend(a4, "heliumRef");
        else
          v46 = 0;
        if (v50)
        {
          v45 = v46;
          if (v46)
            (*(void (**)(HGNode *))(*(_QWORD *)v46 + 16))(v46);
          -[PAESharedDefaultBase smear:fromImage:toImage:](self, "smear:fromImage:toImage:", &v45, a4, a4);
          v13 = (HGNode *)v54.i64[0];
          if (v46 == (HGNode *)v54.i64[0])
          {
            if (v46)
              (*(void (**)(void))(*(_QWORD *)v46 + 24))();
          }
          else
          {
            if (v46)
            {
              (*(void (**)(void))(*(_QWORD *)v46 + 24))();
              v13 = (HGNode *)v54.i64[0];
            }
            v46 = v13;
            v54.i64[0] = 0;
          }
          if (v45)
            (*(void (**)(HGNode *))(*(_QWORD *)v45 + 24))(v45);
        }
        v14 = v49;
        v15 = v48;
        v16 = (HgcGradientBlur2 *)HGObject::operator new(0x1A0uLL);
        HgcGradientBlur2::HgcGradientBlur2(v16);
        v17 = 1.0
            / sqrt((*(double *)v14.i64 - *(double *)v15.i64) * (*(double *)v14.i64 - *(double *)v15.i64)+ (*(double *)&v14.i64[1] - *(double *)&v15.i64[1]) * (*(double *)&v14.i64[1] - *(double *)&v15.i64[1]));
        v18 = (*(double *)v14.i64 - *(double *)v15.i64) * v17;
        v19 = (*(double *)&v14.i64[1] - *(double *)&v15.i64[1]) * v17;
        v20 = v18;
        v21 = v19;
        *(float *)&v18 = *(double *)v15.i64 * v18 + *(double *)&v15.i64[1] * v19;
        v22 = -*(float *)&v18;
        (*(void (**)(HgcGradientBlur2 *, uint64_t, float, float, float, float))(*(_QWORD *)v16 + 96))(v16, 1, v20, v21, 0.0, -*(float *)&v18);
        *(float *)&v17 = v17;
        (*(void (**)(HgcGradientBlur2 *, uint64_t, float, float, float, float))(*(_QWORD *)v16 + 96))(v16, 2, *(float *)&v17, 0.0, 0.0, 0.0);
        v23 = (HgcGradientBlur2 *)HGObject::operator new(0x1A0uLL);
        HgcGradientBlur2::HgcGradientBlur2(v23);
        (*(void (**)(HgcGradientBlur2 *, uint64_t, float, float, float, float))(*(_QWORD *)v23 + 96))(v23, 1, v20, v21, 0.0, v22);
        (*(void (**)(HgcGradientBlur2 *, uint64_t, float, float, float, float))(*(_QWORD *)v23 + 96))(v23, 2, *(float *)&v17, 0.0, 0.0, 0.0);
        v24 = 0;
        v51 = v51 * 2.7;
        v27 = v51 / 7.0;
        v28 = (int32x4_t)xmmword_1B3050090;
        v29.i64[0] = 0x400000004;
        v29.i64[1] = 0x400000004;
        do
        {
          v30 = vmulq_n_f32(vcvtq_f32_s32(v28), v27);
          v25 = v11;
          *(float32x4_t *)((char *)&v54 + v24 * 4) = vmulq_n_f32(v30, v25);
          v26 = v12;
          *(float32x4_t *)&v52[v24] = vmulq_n_f32(v30, v26);
          v28 = vaddq_s32(v28, v29);
          v24 += 4;
        }
        while (v24 != 8);
        v31 = v46;
        v32 = (HGBlurGroup *)HGObject::operator new(0x70uLL);
        HGBlurGroup::HGBlurGroup(v32, v31, 0);
        HGBlurGroup::setBlurValues(v32, (const float *)v54.i32, v52, 5);
        (*(void (**)(HgcGradientBlur2 *, _QWORD, float, float, float, float))(*(_QWORD *)v16 + 96))(v16, 0, 0.0, 0.0, 0.0, 0.0);
        v33 = HGBlurGroup::level(v32, 0);
        (*(void (**)(HgcGradientBlur2 *, _QWORD, uint64_t))(*(_QWORD *)v16 + 120))(v16, 0, v33);
        v34 = HGBlurGroup::level(v32, 1u);
        (*(void (**)(HgcGradientBlur2 *, uint64_t, uint64_t))(*(_QWORD *)v16 + 120))(v16, 1, v34);
        v35 = HGBlurGroup::level(v32, 2u);
        (*(void (**)(HgcGradientBlur2 *, uint64_t, uint64_t))(*(_QWORD *)v16 + 120))(v16, 2, v35);
        v36 = HGBlurGroup::level(v32, 3u);
        (*(void (**)(HgcGradientBlur2 *, uint64_t, uint64_t))(*(_QWORD *)v16 + 120))(v16, 3, v36);
        v37 = HGBlurGroup::level(v32, 4u);
        (*(void (**)(HgcGradientBlur2 *, uint64_t, uint64_t))(*(_QWORD *)v16 + 120))(v16, 4, v37);
        if (v32)
          (*(void (**)(HGBlurGroup *))(*(_QWORD *)v32 + 24))(v32);
        v38 = v46;
        v39 = (HGBlurGroup *)HGObject::operator new(0x70uLL);
        HGBlurGroup::HGBlurGroup(v39, v38, 0);
        HGBlurGroup::setBlurValues(v39, &v55, &v53, 4);
        (*(void (**)(HgcGradientBlur2 *, _QWORD, float, float, float, float))(*(_QWORD *)v23 + 96))(v23, 0, 1.0, 0.0, 0.0, 0.0);
        (*(void (**)(HgcGradientBlur2 *, _QWORD, HgcGradientBlur2 *))(*(_QWORD *)v23 + 120))(v23, 0, v16);
        v40 = HGBlurGroup::level(v39, 0);
        (*(void (**)(HgcGradientBlur2 *, uint64_t, uint64_t))(*(_QWORD *)v23 + 120))(v23, 1, v40);
        v41 = HGBlurGroup::level(v39, 1u);
        (*(void (**)(HgcGradientBlur2 *, uint64_t, uint64_t))(*(_QWORD *)v23 + 120))(v23, 2, v41);
        v42 = HGBlurGroup::level(v39, 2u);
        (*(void (**)(HgcGradientBlur2 *, uint64_t, uint64_t))(*(_QWORD *)v23 + 120))(v23, 3, v42);
        v43 = HGBlurGroup::level(v39, 3u);
        (*(void (**)(HgcGradientBlur2 *, uint64_t, uint64_t))(*(_QWORD *)v23 + 120))(v23, 4, v43);
        if (v39)
          (*(void (**)(HGBlurGroup *))(*(_QWORD *)v39 + 24))(v39);
        v54.i64[0] = (uint64_t)v23;
        (*(void (**)(HgcGradientBlur2 *))(*(_QWORD *)v23 + 16))(v23);
        if (v50)
          -[PAESharedDefaultBase crop:fromImage:toImage:](self, "crop:fromImage:toImage:", &v54, a4, a3);
        objc_msgSend(a3, "setHeliumRef:", &v54, v45);
        if (v54.i64[0])
          (*(void (**)(uint64_t))(*(_QWORD *)v54.i64[0] + 24))(v54.i64[0]);
        (*(void (**)(HgcGradientBlur2 *))(*(_QWORD *)v23 + 24))(v23);
        (*(void (**)(HgcGradientBlur2 *))(*(_QWORD *)v16 + 24))(v16);
        if (v46)
          (*(void (**)(HGNode *))(*(_QWORD *)v46 + 24))(v46);
        goto LABEL_18;
      }
      LOBYTE(v9) = 0;
    }
  }
  return (char)v9;
}

- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6
{
  __int128 v6;
  _OWORD v8[3];

  *a6 = 0;
  *a5 = 1;
  v6 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0.var0;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a3->var4;
  -[PAESharedDefaultBase overrideFrameSetupForRenderMode:hardware:software:](self, "overrideFrameSetupForRenderMode:hardware:software:", v8, a5, a6);
  return 1;
}

@end
